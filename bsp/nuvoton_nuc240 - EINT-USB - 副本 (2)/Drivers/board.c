/*
 * File      : board.c
 * This file is part of RT-Thread RTOS
 * COPYRIGHT (C) 2014 RT-Thread Develop Team
 *
 * The license and distribution terms for this file may be
 * found in the file LICENSE in this distribution or at
 * http://www.rt-thread.org/license/LICENSE
 *
 * Change Logs:
 * Date           Author       Notes
 * 2014-11-23     Bright      first implementation
 */
#include <rthw.h>
#include <rtthread.h>

#include "board.h"
#include "NUC230_240.h"
#include "usart.h"
/* RT_USING_COMPONENTS_INIT */
#ifdef  RT_USING_COMPONENTS_INIT
#include <components.h>
#endif
/**
 * @addtogroup NUVOTON_M05X
 */

/*@{*/

/*******************************************************************************
* Function Name  : NVIC_Configuration
* Description    : Configures Vector Table base location.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void NVIC_Configuration(void)
{
	
   // NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
}

/**
* @brief  Inserts a delay time.
* @param  nCount: specifies the delay time length.
* @retval None
*/

static void delay(__IO uint32_t nCount)
{
	/* Decrement nCount value */
	while (nCount != 0)
	{
		nCount--;
	}
}


static void rt_hw_system_init(void)
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
	
	 /* Enable external XTAL 12 MHz clock */
    CLK_EnableXtalRC(CLK_PWRCON_XTL12M_EN_Msk);   //add  RC

    /* Waiting for external XTAL clock ready */
    CLK_WaitClockReady(CLK_CLKSTATUS_XTL12M_STB_Msk);//add  RC

    /* Set core clock as PLL_CLOCK from PLL */
    CLK_SetCoreClock(BOARD_PLL_CLOCK);
		
		CLK_EnableModuleClock(USBD_MODULE);   									//add  RC
		
		CLK_SetModuleClock(USBD_MODULE, 0, CLK_CLKDIV_USB(3)); //add  RC

    /* Set SysTick clock source to HCLK source divide 2 */
    CLK_SetSysTickClockSrc(CLK_CLKSEL0_STCLK_S_HCLK_DIV2);
		
    	/* Set GPB multi-function pins for external interrupt */
		SYS->GPB_MFP &= ~(SYS_GPB_MFP_PB14_Msk);
		SYS->GPB_MFP |= (SYS_GPB_MFP_PB14_INT0);
		
    SYS_LockReg();
}

/**
 * This is the timer interrupt service routine.
 *
 */
void SysTick_Handler(void)
{
	/* enter interrupt */
	rt_interrupt_enter();

	rt_tick_increase();

	/* leave interrupt */
	rt_interrupt_leave();
}
/**
 * This function will initial Nuvoton board.
 */
void rt_hw_board_init()
{
	/* NVIC Configuration */
	NVIC_Configuration();

  /* Configure the system clock */
  rt_hw_system_init();
	/* Configure the SysTick */
	SysTick_Config(SystemCoreClock / RT_TICK_PER_SECOND);

	/* Initial usart deriver, and set console device */
	rt_hw_usart_init();
	
	
#ifdef RT_USING_CONSOLE
	rt_console_set_device(RT_CONSOLE_DEVICE_NAME);
#endif

	/* Call components board initial (use INIT_BOARD_EXPORT()) */
#ifdef RT_USING_COMPONENTS_INIT
    rt_components_board_init();
#endif
}

/*@}*/
