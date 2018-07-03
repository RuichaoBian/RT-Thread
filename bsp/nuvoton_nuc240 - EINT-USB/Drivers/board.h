/*
 * File      : board.h
 * This file is part of RT-Thread RTOS
 * COPYRIGHT (C) 2014, RT-Thread Development Team
 *
 * The license and distribution terms for this file may be
 * found in the file LICENSE in this distribution or at
 * http://www.rt-thread.org/license/LICENSE
 *
 * Change Logs:
 * Date           Author       Notes
 * 2017-8-10     Bright      add board.h to this bsp
 */

// <<< Use Configuration Wizard in Context Menu >>>
#ifndef __BOARD_H__
#define __BOARD_H__
#include <stdio.h>
#include "NUC230_240.h"
#include "usb_device.h"
#define BOARD_PLL_CLOCK           72000000

/* board configuration */
// <o> Internal SRAM memory size[Kbytes]
//	<i>Default: 64
#define NUC240_SRAM_SIZE         16
#define NUC240_SRAM_END          0x20003FFF     

//(0x20000000 + (NUC240_SRAM_SIZE * 1024-1))

void rt_hw_board_init(void);

//#define PRINT_RCC_FREQ_INFO

#endif

/*// <<< Use Configuration Wizard in Context Menu >>>
*/


