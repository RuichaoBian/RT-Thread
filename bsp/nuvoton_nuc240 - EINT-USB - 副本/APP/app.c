
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

static rt_uint8_t mempool[4096];
static struct rt_mempool mp;
//static rt_uint8_t *ptr[49];

rt_thread_t init_thread1 = RT_NULL;
rt_thread_t init_thread2 = RT_NULL;

static rt_timer_t timer1;
rt_timer_t timer5;
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
/*
static void led_off(void* parameter)
{
	int i;
	while(1)
	{
		rt_kprintf("try to release block\n");
		for(i = 0;i < 49;i ++)
		{
			if(ptr[i] != RT_NULL)
			{
				rt_kprintf("release block %d\n",i);
				rt_mp_free(ptr[i]);
				ptr[i] = RT_NULL;
			}
		}
		rt_thread_delay(10);
	}
	
}

static void printf_test2(void* parameter)
{
	int i;
	char *block;
	rt_kprintf("printf_test2 init\n");
	while(1)
	{
		for(i = 0;i< 49;i++)
		{
			//rt_kprintf("allocte No.%d\n",i);
			if(ptr[i] == RT_NULL)
			{
				ptr[i] = rt_mp_alloc(&mp,RT_WAITING_FOREVER);
				rt_kprintf("ptr[%d] = %d,sizeof(rt_uint8_t *)=%d\n",i,ptr[i],sizeof(rt_uint8_t *));
			}
		}
		
		block = rt_mp_alloc(&mp,RT_WAITING_FOREVER);
		rt_kprintf("allocte the block mem\n");
		rt_mp_free(block);
		block = RT_NULL;
	}
}

*/
static void printf_test3(void* parameter)
{
	int i;
	char *ptr[20];
	for(i = 0;i < 20;i ++)
		ptr[i] = RT_NULL;
	while(1)
	{
		for(i = 0;i < 20;i ++)
		{
			
			ptr[i] = rt_malloc(1<<i);
			if(ptr[i] !=RT_NULL)
			{
				rt_kprintf("i= %d,get memory:0x%x\n",i,ptr[i]);
				rt_free(ptr[i]);
				ptr[i] = RT_NULL;
			}
		}
	}
}

int rt_application_init()
{
	//int i;
	rt_hw_led_init();
//	for(i = 0;i < 49;i ++)
		//{
				//ptr[i] = RT_NULL;
		//}
//	rt_mp_init(&mp,"mp1",&mempool[0],sizeof(mempool),20);
	
	init_thread1 = rt_thread_create("init1",printf_test3,RT_NULL,512,24,5);
	
	if(init_thread1 != RT_NULL)
	{
		rt_thread_startup(init_thread1);
		rt_kprintf("thread1 is ok!\n");
	}
	else
		rt_kprintf("thread1 is fail!\n");
	
	//init_thread2 = rt_thread_create("init2",led_off,RT_NULL,512,25,5);
	init_thread2 = RT_NULL;
	if(init_thread2 != RT_NULL)
	{
		//rt_thread_startup(init_thread2);
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


