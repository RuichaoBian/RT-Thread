
#include <rthw.h>
#include <rtthread.h>
#include <stdio.h>

#include <board.h>

#ifdef  RT_USING_COMPONENTS_INIT
#include <components.h>
#endif  /* RT_USING_COMPONENTS_INIT */

#include "led.h"
#include "hid_mousekeyboard.h"


//static struct rt_thread thread1;
//ALIGN(4)
//static rt_uint8_t thread1_stack[512];
rt_thread_t init_thread1 = RT_NULL;
rt_thread_t init_thread2 = RT_NULL;

static rt_timer_t timer1;

static void printf_1(void* parameter)
{
//	
	while(1)
	{
		rt_kprintf("printf_1\n");
	}
}

static void printf_test2(void* parameter)
{
	rt_kprintf("1USB_reday\n");
	
	while(1)
	{
		//rt_kprintf("USB_reday\n");
		HID_UpdateKbData(0);
		//rt_thread_delay(1);
	}
}
static void printf_test1(void* parameter)
{
	int i;
	char *ptr[20];
	for(i = 0;i < 20; i ++)
		ptr[i] = RT_NULL;
	while(1)
	{
		for(i=1;i<20;i++)
		{
		ptr[i] = rt_malloc(128);
		rt_kprintf("malloc memory: 0x%x\n",ptr[i]);

		//rt_kprintf("calloc memory: 0x%x\n",rt_calloc(16,64));		
		}
		for(i = 0; i < 20;i ++){
			rt_free(ptr[i]);
			ptr[i] = RT_NULL;
		}
	}
}

static void USB_put(void* parameter)
{
	rt_kprintf("RC_USB_put\n");
}


int rt_application_init()
{
	GPIO_SetMode(PE, BIT4, GPIO_PMD_INPUT);
	//rt_err_t result;
	rt_hw_led_init();
	//result = rt_thread_init(&thread1,"thread1",printf_test1,RT_NULL,&thread1_stack[0],sizeof(thread1_stack),25,1);
	
	//if(result == RT_EOK)
	//	rt_thread_startup(&thread1);
	//else
	//	rt_kprintf("thread1 is fail!\n");
	init_thread1 = rt_thread_create("init1",printf_1,RT_NULL,512,25,5);
	
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
	
	timer1 = rt_timer_create("timer1",USB_put,RT_NULL,200,RT_TIMER_FLAG_PERIODIC);
	if(timer1 != RT_NULL)
	{
		rt_timer_start(timer1);
				rt_kprintf("timer1 is ok!\n");
	}
	else
		rt_kprintf("timer1 is fail!\n");
	
	return 0;
}

