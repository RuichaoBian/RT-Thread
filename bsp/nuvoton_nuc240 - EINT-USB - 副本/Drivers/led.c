
/* 
  led.c
	2017-8-10
*/

#include "led.h"
/* RT_USING_COMPONENTS_INIT */
#ifdef  RT_USING_COMPONENTS_INIT
#include <components.h>
#endif

#define LED_DATA(dat) (PA10 = dat)


int rt_hw_led_init(void)
{
	GPIO_SetMode(PA, BIT10, GPIO_PMD_OUTPUT);
	return 0;
}

void rt_hw_led_on(void)
{
	LED_DATA(0);
}

void rt_hw_led_off(void)
{
	LED_DATA(1);
}
