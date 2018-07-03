
#include <rthw.h>
#include <rtthread.h>
#include <stdio.h>
#include "NUC230_240.h"
#include <board.h>

#ifdef  RT_USING_COMPONENTS_INIT
#include <components.h>
#endif  /* RT_USING_COMPONENTS_INIT */
//#include "usbd.h"
#include "hid_mousekeyboard.h"

extern int  rt_application_init(void);

#ifdef __CC_ARM
extern int Image$$RW_IRAM1$$ZI$$Limit;
#define NUC240_SRAM_BEGIN    (&Image$$RW_IRAM1$$ZI$$Limit)
#elif __ICCARM__
#pragma section="HEAP"
#define NUC240_SRAM_BEGIN    (__segment_end("HEAP"))
#else
extern int __bss_end;
#define NUC240_SRAM_BEGIN    (&__bss_end)
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


void USB_Init(void)
{
	USBD_Open(&gsInfo, HID_ClassRequest, NULL);
	HID_Init();
	USBD_Start();
	NVIC_EnableIRQ(USBD_IRQn);
	NVIC_SetPriority(USBD_IRQn,5);
	//HID_UpdateKbData();
}

void rtthread_startup(void)
{
	/* init board */
	rt_hw_board_init();

	/* show version */
	rt_show_version();
	
	//USB_Init();
	
	/* init tick */
	rt_system_tick_init();

	/* init kernel object */
	rt_system_object_init();

	/* init timer system */
	rt_system_timer_init();

#ifdef RT_USING_HEAP
    rt_system_heap_init((void*)NUC240_SRAM_BEGIN, (void*)NUC240_SRAM_END);
#endif

	/* init scheduler system */
	rt_system_scheduler_init();

	/* init application */
	//rt_application_init();
		rt_usb_device_init();
   /* init timer thread */
  rt_system_timer_thread_init();

	/* init idle thread */
	rt_thread_idle_init();

	/* start scheduler */
	rt_system_scheduler_start();

}

int main(void)
{
	/* disable interrupt first */
	rt_hw_interrupt_disable();
	
	/* startup RT-Thread RTOS */
	rtthread_startup();
	return 0;
}

