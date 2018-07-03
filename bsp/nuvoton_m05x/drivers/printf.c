#include "printf.h"


#ifndef NONBLOCK_PRINTF

void SendChar_ToUART(int ch)
{

    while(DEBUG_PORT->FSR & UART_FSR_TX_FULL_Msk);
    DEBUG_PORT->DATA = ch;
    if(ch == '\n')
    {
        while(DEBUG_PORT->FSR & UART_FSR_TX_FULL_Msk);
        DEBUG_PORT->DATA = '\r';
    }
}

#else
/* Non-block implement of send char */
#define BUF_SIZE    2048
void SendChar_ToUART(int ch)
{
    static uint8_t u8Buf[BUF_SIZE] = {0};
    static int32_t i32Head = 0;
    static int32_t i32Tail = 0;
    int32_t i32Tmp;

    /* Only flush the data in buffer to UART when ch == 0 */
    if(ch)
    {
        // Push char
        i32Tmp = i32Head + 1;
        if(i32Tmp >= BUF_SIZE) i32Tmp = 0;
        if(i32Tmp != i32Tail)
        {
            u8Buf[i32Head] = ch;
            i32Head = i32Tmp;
        }

        if(ch == '\n')
        {
            i32Tmp = i32Head + 1;
            if(i32Tmp >= BUF_SIZE) i32Tmp = 0;
            if(i32Tmp != i32Tail)
            {
                u8Buf[i32Head] = '\r';
                i32Head = i32Tmp;
            }
        }
    }
    else
    {
        if(i32Tail == i32Head)
            return;
    }

    // pop char
    do
    {
        i32Tmp = i32Tail + 1;
        if(i32Tmp >= BUF_SIZE) i32Tmp = 0;

        if((DEBUG_PORT->FSR & UART_FSR_TX_FULL_Msk) == 0)
        {
            DEBUG_PORT->THR = u8Buf[i32Tail];
            i32Tail = i32Tmp;
        }
        else
            break; // FIFO full
    }
    while(i32Tail != i32Head);
}
#endif
/**
 * @brief    Routine to send a char
 *
 * @param[in]   ch Character to send to debug port.
 *
 * @returns  Send value from UART debug port or semihost
 *
 * @details  Send a target char to UART debug port or semihost.
 */
void SendChar(int ch)
{
#if defined(DEBUG_ENABLE_SEMIHOST)
    g_buf[g_buf_len++] = ch;
    g_buf[g_buf_len] = '\0';
    if(g_buf_len + 1 >= sizeof(g_buf) || ch == '\n' || ch == '\0')
    {
        /* Send the char */
        if(SH_DoCommand(0x04, (int)g_buf, NULL) != 0)
        {
            g_buf_len = 0;
            return;
        }
        else
        {
            int i;

            for(i = 0; i < g_buf_len; i++)
                SendChar_ToUART(g_buf[i]);
            g_buf_len = 0;
        }
    }
#else
    SendChar_ToUART(ch);
#endif
}

int fputc(int ch, FILE *stream)
{
    SendChar(ch);
    return ch;
}