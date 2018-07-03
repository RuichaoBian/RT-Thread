/*
 * File      : startup.c
 * This file is part of RT-Thread RTOS
 * COPYRIGHT (C) 2014, RT-Thread Develop Team
 *
 * The license and distribution terms for this file may be
 * found in the file LICENSE in this distribution or at
 * http://openlab.rt-thread.com/license/LICENSE
 *
 * Change Logs:
 * Date           Author       Notes
 * 2014-11-23     Bright      first implementation
 */

#include <rthw.h>
#include <rtthread.h>
#include "usart.h"
#include "board.h"
#include "printf.h"

#include <stdint.h>


/**
 * @addtogroup NUVOTON_M05X
 */

/*@{*/
#define PLL_CLOCK           50000000

#define THREAD_PRIORITY				25
#define THREAD_STACK_SIZE			512
#define	THREAD_TIMESLICE			5	

static rt_thread_t tid1 = RT_NULL;
static rt_thread_t tid2 = RT_NULL;


#ifdef RT_USING_FINSH
extern void finsh_system_init(void);
extern void finsh_set_device(const char* device);
#endif

#ifdef __CC_ARM
extern int Image$$RW_IRAM1$$ZI$$Limit;
#define M05X_SRAM_BEGIN    (&Image$$RW_IRAM1$$ZI$$Limit)
#elif __ICCARM__
#pragma section="HEAP"
#define M05X_SRAM_BEGIN    (__segment_end("HEAP"))
#else
extern int __bss_end;
#define M05X_SRAM_BEGIN    (&__bss_end)
#endif

/*******************************************************************************
* Function Name  : assert_failed
* Description    : Reports the name of the source file and the source line number
*                  where the assert error has occurred.
* Input          : - file: pointer to the source file name
*                  - line: assert error line source number
* Output         : None
* Return         : None
*******************************************************************************/
void assert_failed(uint8_t* file, uint32_t line)
{
	rt_kprintf("\n\r Wrong parameter value detected on\r\n");
	rt_kprintf("       file  %s\r\n", file);
	rt_kprintf("       line  %d\r\n", line);

	while (1) ;
}

static void thread_entry(void *parameter)
{
	rt_uint32_t count = 0;
	rt_uint32_t no = (rt_uint32_t) parameter;   //获得线程的入口参数
	
	while(1)
	{
		rt_kprintf("thread%d count:%d\n",no,count ++);
		rt_thread_delay(10);   //休眠10个OS Tick
	}
}

int rt_application_init(void)
{
	tid1 = rt_thread_create("t1",
					thread_entry,(void*)1,
					THREAD_STACK_SIZE, THREAD_PRIORITY, THREAD_TIMESLICE);
	if(tid1 != RT_NULL)
		rt_thread_startup(tid1);
	else
		return -1;
	
	tid2 = rt_thread_create("t2",
					thread_entry,(void*)2,
					THREAD_STACK_SIZE, THREAD_PRIORITY, THREAD_TIMESLICE);
	if(tid2 != RT_NULL)
		rt_thread_startup(tid2);
	else
		return -1;
	
	return 0;
}

int main(void)
{
/*---------------------------------------------------------------------------------------------------------*/
    /* Init System Clock                                                                                       */
    /*---------------------------------------------------------------------------------------------------------*/
    SYS_UnlockReg();
	
    /* Enable Internal RC 22.1184MHz clock */
    CLK_EnableXtalRC(CLK_PWRCON_OSC22M_EN_Msk);

    /* Waiting for Internal RC clock ready */
    CLK_WaitClockReady(CLK_CLKSTATUS_OSC22M_STB_Msk);

    /* Switch HCLK clock source to Internal RC and HCLK source divide 1 */
    CLK_SetHCLK(CLK_CLKSEL0_HCLK_S_HIRC, CLK_CLKDIV_HCLK(1));

    /* Enable external XTAL 12MHz clock */
    CLK_EnableXtalRC(CLK_PWRCON_XTL12M_EN_Msk);

    /* Waiting for external XTAL clock ready */
    CLK_WaitClockReady(CLK_CLKSTATUS_XTL12M_STB_Msk);

    /* Set core clock as PLL_CLOCK from PLL */
    CLK_SetCoreClock(PLL_CLOCK);

    /* Enable UART module clock */
    CLK_EnableModuleClock(UART0_MODULE);
    CLK_EnableModuleClock(UART1_MODULE);

    /* Select UART module clock source */
    CLK_SetModuleClock(UART0_MODULE, CLK_CLKSEL1_UART_S_HXT, CLK_CLKDIV_UART(1));
    CLK_SetModuleClock(UART1_MODULE, CLK_CLKSEL1_UART_S_HXT, CLK_CLKDIV_UART(1));

    /*---------------------------------------------------------------------------------------------------------*/
    /* Init I/O Multi-function                                                                                 */
    /*---------------------------------------------------------------------------------------------------------*/

    /* Set P3 multi-function pins for UART0 RXD and TXD */
   SYS->P3_MFP &= ~(SYS_MFP_P30_Msk | SYS_MFP_P31_Msk);
   SYS->P3_MFP |= (SYS_MFP_P30_RXD0 | SYS_MFP_P31_TXD0);

    /* Set P1 multi-function pins for UART1 RXD and TXD */
    SYS->P1_MFP &= ~(SYS_MFP_P12_Msk | SYS_MFP_P13_Msk);
    SYS->P1_MFP |= (SYS_MFP_P12_RXD1 | SYS_MFP_P13_TXD1);

    /* Set P0 multi-function pins for UART1 CTS */
    SYS->P0_MFP = SYS->P0_MFP & (~SYS_MFP_P00_Msk) | SYS_MFP_P00_CTS1;
		
		SYS_LockReg(); 
        /* Reset IP */
		SYS_ResetModule(UART0_RST);
		UART_Open(UART0, 115200);
		SYS_ResetModule(UART1_RST);
		UART_Open(UART1, 115200);
	  
		printf("\n\nCPU @ %dHz\n", SystemCoreClock);

    printf("\n\nUART Sample Program\n");
		//GPIO_SetMode(P3, BIT6, GPIO_PMD_OUTPUT);
		//P36 = 0;
		rt_hw_interrupt_disable();
		rt_hw_board_init();
		rt_show_version();
		rt_system_timer_init();
		rt_system_heap_init((void*)M05X_SRAM_BEGIN, (void*)M05X_SRAM_END);
		rt_system_scheduler_init();
		rt_application_init();
		rt_system_timer_thread_init();
		rt_thread_idle_init();
		printf("\n\nUART Sample\n");
		rt_system_scheduler_start();
	 
	while(1)
{
;
}
}

/*@}*/
