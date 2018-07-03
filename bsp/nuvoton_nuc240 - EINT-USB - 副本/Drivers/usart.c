 /* File      : usart.c
 
 */
 
#include "NUC230_240.h"
#include <rtdevice.h>
#include "usart.h"
#include "stdio.h"
int8_t rev_buf[80];        //接收缓存


/**
 * @brief       Routine to send a char
 *
 * @param[in]   ch Character to send to debug port.
 *
 * @returns     Send value from UART debug port
 *
 * @details     Send a target char to UART debug port .
 */

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
/**
 * @brief      Write character to stream
 *
 * @param[in]  ch       Character to be written. The character is passed as its int promotion.
 * @param[in]  stream   Pointer to a FILE object that identifies the stream where the character is to be written.
 *
 * @returns    If there are no errors, the same character that has been written is returned.
 *             If an error occurs, EOF is returned and the error indicator is set (see ferror).
 *
 * @details    Writes a character to the stream and advances the position indicator.\n
 *             The character is written at the current position of the stream as indicated \n
 *             by the internal position indicator, which is then advanced one character.
 *
 * @note       The above descriptions are copied from http://www.cplusplus.com/reference/clibrary/cstdio/fputc/.
 *
 *
 */

int fputc(int ch, FILE *stream)
{
    SendChar(ch);
    return ch;
}
static rt_err_t nuc240_configure(struct rt_serial_device *serial,struct serial_configure *cfg)
{
	UART_T* uart;
	
	uart = (UART_T*)serial->parent.user_data;
#if defined(RT_USING_UART0)
	if(uart == UART0){
		//enable clock
		CLK_EnableModuleClock(UART0_MODULE);
		/* Select UART module clock source */
    CLK_SetModuleClock(UART0_MODULE, CLK_CLKSEL1_UART_S_PLL, CLK_CLKDIV_UART(1));
		
		/* Set GPB multi-function pins for UART0 RXD and TXD */
    SYS->GPB_MFP &= ~(SYS_GPB_MFP_PB0_Msk | SYS_GPB_MFP_PB1_Msk);

    SYS->GPB_MFP |= (SYS_GPB_MFP_PB0_UART0_RXD | SYS_GPB_MFP_PB1_UART0_TXD);
		
		 /* Reset UART0 module */
    SYS_ResetModule(UART0_RST);

    /* Configure UART0 and set UART0 Baudrate */
    UART_Open(UART0, cfg->baud_rate);
		
	  /* Enable Interrupt */
    UART_EnableInt(UART0, UART_IER_RDA_IEN_Msk);
	}
#endif

	return RT_EOK;
}

static rt_err_t nuc240_control(struct rt_serial_device *serial,int cmd,void *arg){
	UART_T* uart;
	uart = (UART_T *)serial->parent.user_data;
	
	switch(cmd)
	{
		case RT_DEVICE_CTRL_CLR_INT:{
			//disable interrupt
			UART_DisableInt(uart,UART_IER_RDA_IEN_Msk);
			break;
		}
		case RT_DEVICE_CTRL_SET_INT:{
			UART_EnableInt(uart,UART_IER_RDA_IEN_Msk);
			break;
		}
	}
	return RT_EOK;
}


static int nuc240_putc(struct rt_serial_device *serial, char c)
{
    UART_T* uart;
    uart = (UART_T *)serial->parent.user_data;
    if (UART_IS_TX_FULL(uart)) {
        UART_WAIT_TX_EMPTY(uart);
        
    }
    UART_WRITE(uart, c);
    return 1;
}

static int nuc240_getc(struct rt_serial_device *serial)
{
    int ch = -1;
    UART_T* uart;
    uart = (UART_T *)serial->parent.user_data;

    if (UART_IS_RX_READY(uart))
        ch = UART_READ(uart);
    return ch;
}

static const struct rt_uart_ops NUC240_uart_ops =
{
    nuc240_configure,
    nuc240_control,
    nuc240_putc,
    nuc240_getc,
};


#if defined(RT_USING_UART0)
struct rt_serial_device serial0;
uint16_t num;
uint16_t i;
void UART02_IRQHandler(void)
{
	
	/*******************************************************/
	uint8_t u8InChar = 0xFF;
    /* enter interrupt */
    rt_interrupt_enter();
		UART_ClearIntFlag(UART0 , UART_IER_RDA_IEN_Msk);
	
		u8InChar = nuc240_getc(&serial0);

		 /*if(num>=80)
			 {
			  nuc240_putc(&serial0, 'E');
				num=0;
			 }
			else if(u8InChar=='\n')
			 {
				i=0;
				while(i!=num) 
				{
				nuc240_putc(&serial0, rev_buf[i]);
				i++;
				}
				num=0;
			 }		
		 else
		 rev_buf[num++] =u8InChar;  */    
/***************************************
		 
							R C
		 
******************************************/		 
   // if (UART_IS_RX_READY(UART0)) {
     //   rt_hw_serial_isr(&serial0, RT_SERIAL_EVENT_RX_IND);
   // }
    /* leave interrupt */
    rt_interrupt_leave();
}
#endif /* RT_USING_UART0 */

void rt_hw_usart_init(void)
{
#ifdef RT_USING_UART0
    struct serial_configure config = RT_SERIAL_CONFIG_DEFAULT;//配置串口波特率等一些配置
    config.baud_rate = BAUD_RATE_115200;
    serial0.ops    = &NUC240_uart_ops;     //
    serial0.config = config;

    /* register UART0 device */
    rt_hw_serial_register(&serial0, "uart0",
                          RT_DEVICE_FLAG_RDWR | RT_DEVICE_FLAG_INT_RX,
                          UART0);
#endif /* RT_USING_UART0 */
 return;
}

