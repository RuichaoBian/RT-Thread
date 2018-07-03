#ifndef __LED_H__
#define __LED_H__

#include "NUC230_240.h"
#include <rthw.h>
#include <rtthread.h>

int rt_hw_led_init(void);
void rt_hw_led_on(void);
void rt_hw_led_off(void);

#endif
	
