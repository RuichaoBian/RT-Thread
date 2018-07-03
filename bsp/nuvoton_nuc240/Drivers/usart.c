 /* File      : usart.c
 
 */
 
#include "NUC230_240.h"
#include <rtdevice.h>
#include "usart.h"

int8_t rev_buf[80];        //接收缓存


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
		 if(num>=80)
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
		 rev_buf[num++] =u8InChar;      
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

