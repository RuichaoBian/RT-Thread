#include <stdio.h>
#include "NUC230_240.h"
#include "hid_mousekeyboard.h"

void SYS_Init(void)
{

    /*---------------------------------------------------------------------------------------------------------*/
    /* Init System Clock                                                                                       */
    /*---------------------------------------------------------------------------------------------------------*/

    /* Enable Internal RC 22.1184 MHz clock */
    CLK_EnableXtalRC(CLK_PWRCON_OSC22M_EN_Msk);

    /* Waiting for Internal RC clock ready */
    CLK_WaitClockReady(CLK_CLKSTATUS_OSC22M_STB_Msk);

    /* Switch HCLK clock source to Internal RC and HCLK source divide 1 */
    CLK_SetHCLK(CLK_CLKSEL0_HCLK_S_HIRC, CLK_CLKDIV_HCLK(1));

    /* Enable external XTAL 12 MHz clock */
    CLK_EnableXtalRC(CLK_PWRCON_XTL12M_EN_Msk);

    /* Waiting for external XTAL clock ready */
    CLK_WaitClockReady(CLK_CLKSTATUS_XTL12M_STB_Msk);

    /* Set core clock */
    CLK_SetCoreClock(72000000);

    /* Enable module clock */
    //CLK_EnableModuleClock(UART0_MODULE);
    CLK_EnableModuleClock(USBD_MODULE);

    /* Select module clock source */
   // CLK_SetModuleClock(UART0_MODULE, CLK_CLKSEL1_UART_S_HXT, CLK_CLKDIV_UART(1));
    CLK_SetModuleClock(USBD_MODULE, 0, CLK_CLKDIV_USB(3));


    /*---------------------------------------------------------------------------------------------------------*/
    /* Init I/O Multi-function                                                                                 */
    /*---------------------------------------------------------------------------------------------------------*/

    /* Set GPB multi-function pins for UART0 RXD and TXD, and Clock Output */
   // SYS->GPB_MFP |= (SYS_GPB_MFP_PB0_UART0_RXD | SYS_GPB_MFP_PB1_UART0_TXD | SYS_GPB_MFP_PB8_CLKO);
    //SYS->ALT_MFP |=  SYS_ALT_MFP_PB8_CLKO;

    /* Enable CLKO (PB.8) for monitor HCLK. CLKO = HCLK/8 Hz*/
   // EnableCLKO((2 << CLK_CLKSEL2_FRQDIV_S_Pos), 2);
}

/*---------------------------------------------------------------------------------------------------------*/
/*  Main Function                                                                                          */
/*---------------------------------------------------------------------------------------------------------*/
int32_t ma1in(void)
{

    /* Unlock protected registers */
    SYS_UnlockReg();

    SYS_Init();

     /*---------------------------------------------------------------------------------------------------------*/
    /* Init UART                                                                                               */
    /*---------------------------------------------------------------------------------------------------------*/
    /* Reset UART0 module */
   // SYS_ResetModule(UART0_RST);

    /* Configure UART0 and set UART0 Baudrate */
   // UART_Open(UART0, 115200);

  //  printf("\n");
  //  printf("+-----------------------------------------------------+\n");
  //  printf("|    NuMicro USB HID Mouse and Keyboard Sample Code   |\n");
  //  printf("+-----------------------------------------------------+\n");

  //  printf("Mouse draws circle on the screen.\n");
  //  printf("If PB.15 = 0, just report it is key 'a'.\n");
    /* Set PB.15 as Quasi-bidirectional mode */
  //  PB->PMD = (PB->PMD & ~GPIO_PMD_PMD15_Msk) | (GPIO_PMD_QUASI << GPIO_PMD_PMD15_Pos);
    
    USBD_Open(&gsInfo, HID_ClassRequest, NULL);

    /* Endpoint configuration */
    HID_Init();
    USBD_Start();
    NVIC_EnableIRQ(USBD_IRQn);

    while(1)
    {
       // HID_UpdateMouseData();
        //HID_UpdateKbData();
    }
}



