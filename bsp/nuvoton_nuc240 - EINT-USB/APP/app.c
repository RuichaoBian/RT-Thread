
#include <rthw.h>
#include <rtthread.h>
#include <stdio.h>

#include <board.h>

#ifdef  RT_USING_COMPONENTS_INIT
#include <components.h>
#endif  /* RT_USING_COMPONENTS_INIT */

#include "led.h"
#include "hid_mousekeyboard.h"
extern void USB_Init(void);
uint8_t flag=0;
uint16_t del=0;

rt_thread_t init_thread1 = RT_NULL;
rt_thread_t init_thread2 = RT_NULL;

static rt_timer_t timer1;

static void EINT0(void* parameter)
{
	rt_kprintf("EINT0 init\n");

	GPIO_SetMode(PB, BIT14, GPIO_PMD_INPUT);
	GPIO_EnableEINT0(PB, 14, GPIO_INT_FALLING);
	NVIC_EnableIRQ(EINT0_IRQn);
	GPIO_SET_DEBOUNCE_TIME(GPIO_DBCLKSRC_LIRC, GPIO_DBCLKSEL_1024);
	GPIO_ENABLE_DEBOUNCE(PB, BIT14);
	rt_kprintf("EINT0 is ok\n");
}
static void led_off(void* parameter)
{
	
	rt_hw_led_off();
	rt_kprintf("rt_hw_led_on\n");
	
}
static void printf_test2(void* parameter)
{
	rt_kprintf("printf_test2 init\n");
	while(1)
	{
		HID_UpdateKbData(0);
		if(flag == 1)
		{
			timer1 = rt_timer_create("led",led_off,RT_NULL,1000,RT_TIMER_FLAG_ONE_SHOT);
			if(timer1 != RT_NULL)
			{
				rt_timer_start(timer1);
				del ++;
				rt_kprintf("del:%d\n",del);
			}
			else
				rt_kprintf("timer1 is fail\n");
			flag = 0;
		}
	}
}




int rt_application_init()
{
	rt_hw_led_init();

	init_thread1 = rt_thread_create("init1",EINT0,RT_NULL,512,24,100);
	
	if(init_thread1 != RT_NULL)
	{
		rt_thread_startup(init_thread1);
		rt_kprintf("thread1 is ok!\n");
	}
	else
		rt_kprintf("thread1 is fail!\n");
	
	init_thread2 = rt_thread_create("init2",printf_test2,RT_NULL,512,25,5);
	
	if(init_thread2 != RT_NULL)
	{
		rt_thread_startup(init_thread2);
		rt_kprintf("thread2 is ok!\n");
	}
	else
		rt_kprintf("thread2 is fail!\n");
	
	return 0;
}
void EINT0_IRQHandler(void)
{
	 rt_interrupt_enter();
    /* For PB.14, clear the INT flag */
    GPIO_CLR_INT_FLAG(PB, BIT14);
		
	if(del!=0)
	{
		rt_timer_delete(timer1);
		del--;
	}
		rt_hw_led_on();
		flag = 1;
    rt_kprintf("EINT0 occurred.\n");
	rt_interrupt_leave();
}


