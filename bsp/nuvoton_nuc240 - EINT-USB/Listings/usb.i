#line 1 "Drivers\\usb.c"




 


#line 1 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
 









 



















 



















































 








 




 



 

typedef enum IRQn {
     
    NonMaskableInt_IRQn         = -14,     
    HardFault_IRQn              = -13,     
    SVCall_IRQn                 = -5,      
    PendSV_IRQn                 = -2,      
    SysTick_IRQn                = -1,      

     
    BOD_IRQn                  = 0,         
    WDT_IRQn                  = 1,         
    EINT0_IRQn                = 2,         
    EINT1_IRQn                = 3,         
    GPAB_IRQn                 = 4,         
    GPCDEF_IRQn               = 5,         
    PWMA_IRQn                 = 6,         
    PWMB_IRQn                 = 7,         
    TMR0_IRQn                 = 8,         
    TMR1_IRQn                 = 9,         
    TMR2_IRQn                 = 10,        
    TMR3_IRQn                 = 11,        
    UART02_IRQn               = 12,        
    UART1_IRQn                = 13,        
    SPI0_IRQn                 = 14,        
    SPI1_IRQn                 = 15,        
    SPI2_IRQn                 = 16,        
    SPI3_IRQn                 = 17,        
    I2C0_IRQn                 = 18,        
    I2C1_IRQn                 = 19,        
    CAN0_IRQn                 = 20,        
    CAN1_IRQn                 = 21,        
    SC012_IRQn                = 22,        
    USBD_IRQn                 = 23,        
    PS2_IRQn                  = 24,        
    ACMP_IRQn                 = 25,        
    PDMA_IRQn                 = 26,        
    I2S_IRQn                  = 27,        
    PWRWU_IRQn                = 28,        
    ADC_IRQn                  = 29,        
    IRC_IRQn                  = 30,        
    RTC_IRQn                  = 31         
} IRQn_Type;






 

 





   


#line 1 ".\\Libraries\\CMSIS\\Include\\core_cm0.h"
 




















 













 












 




 


 

 













#line 89 ".\\Libraries\\CMSIS\\Include\\core_cm0.h"


 







#line 114 ".\\Libraries\\CMSIS\\Include\\core_cm0.h"

#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 116 ".\\Libraries\\CMSIS\\Include\\core_cm0.h"
#line 1 ".\\Libraries\\CMSIS\\Include\\core_cmInstr.h"
 




















 






 


 



 


 









 







 







 






 








 







 







 









 









 
__attribute__((section(".rev16_text"))) static __inline __asm uint32_t __REV16(uint32_t value)
{
  rev16 r0, r0
  bx lr
}








 
__attribute__((section(".revsh_text"))) static __inline __asm int32_t __REVSH(int32_t value)
{
  revsh r0, r0
  bx lr
}









 



#line 268 ".\\Libraries\\CMSIS\\Include\\core_cmInstr.h"



#line 619 ".\\Libraries\\CMSIS\\Include\\core_cmInstr.h"

   

   

#line 117 ".\\Libraries\\CMSIS\\Include\\core_cm0.h"
#line 1 ".\\Libraries\\CMSIS\\Include\\core_cmFunc.h"
 




















 






 

 



 


 





 
 






 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}







 
static __inline uint32_t __get_IPSR(void)
{
  register uint32_t __regIPSR          __asm("ipsr");
  return(__regIPSR);
}







 
static __inline uint32_t __get_APSR(void)
{
  register uint32_t __regAPSR          __asm("apsr");
  return(__regAPSR);
}







 
static __inline uint32_t __get_xPSR(void)
{
  register uint32_t __regXPSR          __asm("xpsr");
  return(__regXPSR);
}







 
static __inline uint32_t __get_PSP(void)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  return(__regProcessStackPointer);
}







 
static __inline void __set_PSP(uint32_t topOfProcStack)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  __regProcessStackPointer = topOfProcStack;
}







 
static __inline uint32_t __get_MSP(void)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  return(__regMainStackPointer);
}







 
static __inline void __set_MSP(uint32_t topOfMainStack)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  __regMainStackPointer = topOfMainStack;
}







 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}


#line 260 ".\\Libraries\\CMSIS\\Include\\core_cmFunc.h"


#line 296 ".\\Libraries\\CMSIS\\Include\\core_cmFunc.h"


#line 615 ".\\Libraries\\CMSIS\\Include\\core_cmFunc.h"

 

   

#line 118 ".\\Libraries\\CMSIS\\Include\\core_cm0.h"








 
#line 143 ".\\Libraries\\CMSIS\\Include\\core_cm0.h"

 






 
#line 159 ".\\Libraries\\CMSIS\\Include\\core_cm0.h"

 










 


 





 


 
typedef union
{
  struct
  {

    uint32_t _reserved0:27;               





    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} APSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       

    uint32_t _reserved0:15;               





    uint32_t T:1;                         
    uint32_t IT:2;                        
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t FPCA:1;                      
    uint32_t _reserved0:29;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 






 


 
typedef struct
{
  volatile uint32_t ISER[1];                  
       uint32_t RESERVED0[31];
  volatile uint32_t ICER[1];                  
       uint32_t RSERVED1[31];
  volatile uint32_t ISPR[1];                  
       uint32_t RESERVED2[31];
  volatile uint32_t ICPR[1];                  
       uint32_t RESERVED3[31];
       uint32_t RESERVED4[64];
  volatile uint32_t IP[8];                    
}  NVIC_Type;

 






 


 
typedef struct
{
  volatile const  uint32_t CPUID;                    
  volatile uint32_t ICSR;                     
       uint32_t RESERVED0;
  volatile uint32_t AIRCR;                    
  volatile uint32_t SCR;                      
  volatile uint32_t CCR;                      
       uint32_t RESERVED1;
  volatile uint32_t SHP[2];                   
  volatile uint32_t SHCSR;                    
} SCB_Type;

 















 



























 















 









 






 



 






 


 
typedef struct
{
  volatile uint32_t CTRL;                     
  volatile uint32_t LOAD;                     
  volatile uint32_t VAL;                      
  volatile const  uint32_t CALIB;                    
} SysTick_Type;

 












 



 



 









 








 
 






 

 










 









 

 



 




 

 
 










 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}







 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}











 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));
}







 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}







 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}










 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] = (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
  else {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( ((uint32_t)(IRQn) >> 2) )] = (((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( ((uint32_t)(IRQn) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
}












 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
  else {
    return((uint32_t)((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[ ( ((uint32_t)(IRQn) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
}





 
static __inline void NVIC_SystemReset(void)
{
  __dsb(0xF);                                                     
 
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = ((0x5FA << 16)      |
                 (1UL << 2));
  __dsb(0xF);                                                      
  while(1);                                                     
}

 



 




 

















 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if (ticks > (0xFFFFFFUL << 0))  return (1);             

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = (ticks & (0xFFFFFFUL << 0)) - 1;       
  NVIC_SetPriority (SysTick_IRQn, (1<<2) - 1);   
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2) |
                   (1UL << 1)   |
                   (1UL << 0);                     
  return (0);                                                   
}



 








   

#line 163 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\system_NUC230_240.h"
 









 






 
 
 

 




 






extern uint32_t SystemCoreClock;     
extern uint32_t CyclesPerUs;         
extern uint32_t PllClock;            









 
extern void SystemInit(void);










 
extern void SystemCoreClockUpdate(void);





#line 164 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"


#pragma anon_unions



 



 




 



 


typedef struct
{














































 

    volatile uint32_t CMPCR[2];       
    volatile uint32_t CMPSR;          

} ACMP_T;





 



 















 











   
   



 



 


typedef struct
{













































































































































































































 

    volatile const  uint32_t ADDR[8];        
    volatile uint32_t ADCR;           
    volatile uint32_t ADCHER;         
    volatile uint32_t ADCMPR[2];      
    volatile uint32_t ADSR;           
    volatile const  uint32_t RESERVE0[3];  
    volatile const  uint32_t ADPDMA;         

} ADC_T;





 



 









 






























 






 


















 





















 


   
   



 



 



typedef struct
{
























































































































































































































































 

    volatile uint32_t CREQ;           
    volatile uint32_t CMASK;          
    volatile uint32_t MASK1;          
    volatile uint32_t MASK2;          
    volatile uint32_t ARB1;           
    volatile uint32_t ARB2;           
    volatile uint32_t MCON;           
    volatile uint32_t DAT_A1;         
    volatile uint32_t DAT_A2;         
    volatile uint32_t DAT_B1;         
    volatile uint32_t DAT_B2;         
    volatile const  uint32_t RESERVE[13];   

} CAN_IF_T;





typedef struct
{




















































































































































































































































 

    volatile uint32_t CON;            
    volatile uint32_t STATUS;         
    volatile uint32_t ERR;            
    volatile uint32_t BTIME;          
    volatile uint32_t IIDR;           
    volatile uint32_t TEST;           
    volatile uint32_t BRPE;           
    volatile const  uint32_t RESERVE0[1];  
    volatile CAN_IF_T IF[2];          
    volatile const  uint32_t RESERVE1[8];  
    volatile uint32_t TXREQ1;         
    volatile uint32_t TXREQ2;         
    volatile const  uint32_t RESERVE2[6];  
    volatile uint32_t NDAT1;          
    volatile uint32_t NDAT2;          
    volatile const  uint32_t RESERVE3[6];  
    volatile uint32_t IPND1;          
    volatile uint32_t IPND2;          
    volatile const  uint32_t RESERVE4[6];  
    volatile uint32_t MVLD1;          
    volatile uint32_t MVLD2;          
    volatile uint32_t WU_EN;          
    volatile uint32_t WU_STATUS;      

} CAN_T;






 


 





















 


















 









 












 



 















 



 






 
























 



 









 



 












 






























 






 






 






 






 



 



 



 



 



 



 



 



 



 


   
   


 



 



typedef struct
{





















































































































































































































































































































































































































































































































































 

    volatile uint32_t PWRCON;         
    volatile uint32_t AHBCLK;         
    volatile uint32_t APBCLK;         
    volatile uint32_t CLKSTATUS;      
    volatile uint32_t CLKSEL0;        
    volatile uint32_t CLKSEL1;        
    volatile uint32_t CLKDIV;         
    volatile uint32_t CLKSEL2;        
    volatile uint32_t PLLCON;         
    volatile uint32_t FRQDIV;         
    volatile uint32_t RESERVE[2];   
    volatile uint32_t APBCLK1;        
    volatile uint32_t CLKSEL3;        
    volatile uint32_t CLKDIV1;        

} CLK_T;





 


 































 









 

















































































 









 






















 






 







































 






































 









 












 









 





















 











   
   



 



 


typedef struct
{








































































































































































 

    volatile uint32_t CTL;            
    volatile uint32_t DMASAR;         
    volatile const  uint32_t RESERVED0;    
    volatile uint32_t DMABCR ;        
    volatile const  uint32_t RESERVED1;    
    volatile const  uint32_t DMACSAR;        
    volatile const  uint32_t RESERVED2;    
    volatile const  uint32_t DMACBCR;        
    volatile uint32_t DMAIER ;        
    volatile uint32_t DMAISR;         
    volatile const  uint32_t RESERVED3[22];
    volatile uint32_t WDATA;          
    volatile uint32_t SEED;           
    volatile const  uint32_t CHECKSUM;       

} CRC_T;





 


 



























 



 



 



 



 






 






 



 



 


   
   


 



 


typedef struct
{































































 

    volatile uint32_t EBICON;         
    volatile uint32_t EXTIME;         
    volatile uint32_t EBICON2;        

} EBI_T;






 

 












 












 








   
   

 



 



typedef struct
{























































































































































 

    volatile uint32_t ISPCON;         
    volatile uint32_t ISPADR;         
    volatile uint32_t ISPDAT;         
    volatile uint32_t ISPCMD;         
    volatile uint32_t ISPTRG;         
    volatile const  uint32_t DFBADR;         
    volatile uint32_t FATCON;         
    volatile const  uint32_t RESERVED[9];  
    volatile uint32_t ISPSTA;         

} FMC_T;





 


 
























 



 



 









 



 



 
























   
   


 



 



typedef struct
{
















































































































































 

    volatile uint32_t PMD;            
    volatile uint32_t OFFD;           
    volatile uint32_t DOUT;           
    volatile uint32_t DMASK;          
    volatile const  uint32_t PIN;            
    volatile uint32_t DBEN;           
    volatile uint32_t IMD;            
    volatile uint32_t IEN;            
    volatile uint32_t ISRC;           

} GPIO_T;





typedef struct
{

































 

    volatile uint32_t DBNCECON;       

} GPIO_DBNCECON_T;





 


 
















































 



 



 



 



 



 



 






 



 








   
   



 



 


typedef struct
{




















































































































































































































 

    volatile uint32_t I2CON;          
    volatile uint32_t I2CADDR0;       
    volatile uint32_t I2CDAT;         
    volatile const  uint32_t I2CSTATUS;      
    volatile uint32_t I2CLK;          
    volatile uint32_t I2CTOC;         
    volatile uint32_t I2CADDR1;       
    volatile uint32_t I2CADDR2;       
    volatile uint32_t I2CADDR3;       
    volatile uint32_t I2CADM0;        
    volatile uint32_t I2CADM1;        
    volatile uint32_t I2CADM2;        
    volatile uint32_t I2CADM3;        
    volatile const  uint32_t RESERVED0[2]; 
    volatile uint32_t I2CWKUPCON;     
    volatile uint32_t I2CWKUPSTS;     

} I2C_T;





 



 


















 






 



 



 



 









 



 



 


   
   



 



 


typedef struct
{


























































































































































































































































































 

    volatile uint32_t CON;            
    volatile uint32_t CLKDIV;         
    volatile uint32_t IE;             
    volatile uint32_t STATUS;         
    volatile  uint32_t TXFIFO;         
    volatile const  uint32_t RXFIFO;         

} I2S_T;






 


 






















































 






 

























 
























































   
   



 



 


typedef struct
{







































































































































 

    volatile uint32_t CSR;            
    volatile uint32_t SAR;            
    volatile uint32_t DAR;            
    volatile uint32_t BCR;            
    volatile const  uint32_t POINT;          
    volatile const  uint32_t CSAR;           
    volatile const  uint32_t CDAR;           
    volatile const  uint32_t CBCR;           
    volatile uint32_t IER;            
    volatile uint32_t ISR;            
    volatile const  uint32_t RESERVE[22];  
    volatile const  uint32_t SBUF;           

} PDMA_T;





typedef struct
{


































































































































































































 

    volatile uint32_t GCRCSR;         
    volatile uint32_t PDSSR0;         
    volatile uint32_t PDSSR1;         
    volatile uint32_t GCRISR;         
    volatile uint32_t PDSSR2;         

} PDMA_GCR_T;






 


 





















 



 



 




 






 






 






























 
























 















 

































 





   
   


 



 


typedef struct
{




































































































































































 

    volatile uint32_t PS2CON;         
    volatile uint32_t PS2TXDATA0;     
    volatile uint32_t PS2TXDATA1;     
    volatile uint32_t PS2TXDATA2;     
    volatile uint32_t PS2TXDATA3;     
    volatile uint32_t PS2RXDATA;      
    volatile uint32_t PS2STATUS;      
    volatile uint32_t PS2INTID;       

} PS2_T;






 


 



























 



 



























 





   
   


 



 



typedef struct
{












































































































































































































































































































































































































































































































































































































































































































































































































 

    volatile uint32_t PPR;            
    volatile uint32_t CSR;            
    volatile uint32_t PCR;            
    volatile uint32_t CNR0;           
    volatile uint32_t CMR0;           
    volatile const  uint32_t PDR0;           
    volatile uint32_t CNR1;           
    volatile uint32_t CMR1;           
    volatile const  uint32_t PDR1;           
    volatile uint32_t CNR2;           
    volatile uint32_t CMR2;           
    volatile const  uint32_t PDR2;           
    volatile uint32_t CNR3;           
    volatile uint32_t CMR3;           
    volatile const  uint32_t PDR3;           
    volatile uint32_t PBCR;           
    volatile uint32_t PIER;           
    volatile uint32_t PIIR;           
    volatile const  uint32_t RESERVE1[2];  
    volatile uint32_t CCR0;           
    volatile uint32_t CCR2;           
    volatile uint32_t CRLR0;          
    volatile uint32_t CFLR0;          
    volatile uint32_t CRLR1;          
    volatile uint32_t CFLR1;          
    volatile uint32_t CRLR2;          
    volatile uint32_t CFLR2;          
    volatile uint32_t CRLR3;          
    volatile uint32_t CFLR3;          
    volatile uint32_t CAPENR;         
    volatile uint32_t POE;            
    volatile uint32_t TCON;           
    volatile uint32_t TSTATUS;        
    volatile uint32_t SYNCBUSY0;      
    volatile uint32_t SYNCBUSY1;      
    volatile uint32_t SYNCBUSY2;      
    volatile uint32_t SYNCBUSY3;      

} PWM_T;





 


 












 












 




























































 



 



 



 



 































 
























 










































 










































 



 



 












 












 













 













 



 



 



 


   
   


 



 


typedef struct
{

































































































































































































































 

    volatile uint32_t INIR;           
    volatile uint32_t AER;            
    volatile uint32_t FCR;            
    volatile uint32_t TLR;            
    volatile uint32_t CLR;            
    volatile uint32_t TSSR;           
    volatile uint32_t DWR;            
    volatile uint32_t TAR;            
    volatile uint32_t CAR;            
    volatile const  uint32_t LIR;            
    volatile uint32_t RIER;           
    volatile uint32_t RIIR;           
    volatile uint32_t TTR;            
    volatile const  uint32_t RESERVED[2];  
    volatile uint32_t SPRCTL;         
    volatile uint32_t SPR[20];        

} RTC_T;





 



 






 






 






 


















 


















 



 



 


















 


















 



 









 









 



 

















   
   


 



 



typedef struct
{


    
























































































































































































































































































































































































































































































































































































































































































 
    
    union {
    volatile const  uint32_t RBR;            
    volatile  uint32_t THR;            
    };
    volatile uint32_t CTL;            
    volatile uint32_t ALTCTL;         
    volatile uint32_t EGTR;           
    volatile uint32_t RFTMR;          
    volatile uint32_t ETUCR;          
    volatile uint32_t IER;            
    volatile uint32_t ISR;            
    volatile uint32_t TRSR;           
    volatile uint32_t PINCSR;         
    volatile uint32_t TMR0;           
    volatile uint32_t TMR1;           
    volatile uint32_t TMR2;           
    volatile uint32_t UACTL;          
    volatile const  uint32_t TDRA;           
    volatile const  uint32_t TDRB;           

} SC_T;





 


 



 



 













































 










































 



 



 






 

































 


































 



















































 







































 






 






 






 












 



 






   
   


 



 



typedef struct
{




























































































































































































































































































































































































































 

    volatile uint32_t CNTRL;          
    volatile uint32_t DIVIDER;        
    volatile uint32_t SSR;            
    volatile const  uint32_t RESERVE0;     
    volatile const  uint32_t RX[2];          
    volatile const  uint32_t RESERVE1;     
    volatile const  uint32_t RESERVE2;     
    volatile  uint32_t TX[2];          
    volatile const  uint32_t RESERVE3;     
    volatile const  uint32_t RESERVE4;     
    volatile const  uint32_t RESERVE5;     
    volatile uint32_t VARCLK;         
    volatile uint32_t DMA;            
    volatile uint32_t CNTRL2;         
    volatile uint32_t FIFO_CTL;       
    volatile uint32_t STATUS;         

} SPI_T;






 


 






















































 






 















 









 
























 
























 



































   
   




 



 



typedef struct
{
































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































 

    volatile const  uint32_t PDID;           
    volatile uint32_t RSTSRC;         
    volatile uint32_t IPRSTC1;        
    volatile uint32_t IPRSTC2;        
    volatile uint32_t IPRSTC3;        
    volatile const  uint32_t RESERVE0;     
    volatile uint32_t BODCR;          
    volatile uint32_t TEMPCR;         
    volatile const  uint32_t RESERVE1;     
    volatile uint32_t PORCR;          
    volatile const  uint32_t RESERVE2[2];  
    volatile uint32_t GPA_MFP;        
    volatile uint32_t GPB_MFP;        
    volatile uint32_t GPC_MFP;        
    volatile uint32_t GPD_MFP;        
    volatile uint32_t GPE_MFP;        
    volatile uint32_t GPF_MFP;        
    volatile const  uint32_t RESERVE3[2];  
    volatile uint32_t ALT_MFP;        
    volatile const  uint32_t RESERVE4;     
    volatile uint32_t ALT_MFP1;       
    volatile uint32_t ALT_MFP2;       
    volatile const  uint32_t RESERVE5[8];  
    volatile uint32_t IRCTRIMCTL;     
    volatile uint32_t IRCTRIMIEN;     
    volatile uint32_t IRCTRIMINT;     
    volatile const  uint32_t RESERVE6[29]; 
    volatile uint32_t REGWRPROT;      

} GCR_T;





 


 





















 












 





































































 









 





















 



 



 







 






 






 






 












 















 


































































 













































 


















 












 






 









 





   



typedef struct
{


























































































 

    volatile const  uint32_t IRQSRC[32];    
    volatile uint32_t NMISEL;        
    volatile uint32_t MCUIRQ;        
    volatile uint32_t MCUIRQCR;       

} GCR_INT_T;





 


 



 






 



 



   
   


 



 


typedef struct
{


















































































































































 

    volatile uint32_t TCSR;           
    volatile uint32_t TCMPR;          
    volatile uint32_t TISR;           
    volatile const  uint32_t TDR;            
    volatile const  uint32_t TCAP;           
    volatile uint32_t TEXCON;         
    volatile uint32_t TEXISR;         

} TIMER_T;





 


 






























 



 






 



 



 





















 


   
   


 



 



typedef struct
{






















































































































































































































































































































































































































































































































































































































































































































 

    union {
        volatile uint32_t DATA;           
        volatile uint32_t THR;            
        volatile uint32_t RBR;            
    };
    volatile uint32_t IER;            
    volatile uint32_t FCR;            
    volatile uint32_t LCR;            
    volatile uint32_t MCR;            
    volatile uint32_t MSR;            
    volatile uint32_t FSR;            
    volatile uint32_t ISR;            
    volatile uint32_t TOR;            
    volatile uint32_t BAUD;           
    volatile uint32_t IRCR;           
    volatile uint32_t ALT_CSR;        
    volatile uint32_t FUN_SEL;        
    volatile uint32_t LIN_CTL;        
    volatile uint32_t LIN_SR;         
    

} UART_T;






 


 



 



 







































 















 


















 









 










 







































 



































































 






 












 









 
























 



 










































 


















   
   


 



 


typedef struct
{










































































 

    volatile uint32_t BUFSEG;         
    volatile uint32_t MXPLD;          
    volatile uint32_t CFG;            
    volatile uint32_t CFGP;           

} USBD_EP_T;






typedef struct
{








































































































































































































































 

    volatile uint32_t INTEN;          
    volatile uint32_t INTSTS;         
    volatile uint32_t FADDR;          
    volatile const  uint32_t EPSTS;          
    volatile uint32_t ATTR;           
    volatile const  uint32_t FLDET;          
    volatile uint32_t STBUFSEG;       
    volatile const  uint32_t RESERVE1[29];  
    volatile uint32_t DRVSE0;         
    volatile const  uint32_t RESERVE2[283];
        USBD_EP_T EP[8];          

} USBD_T;





 


 


















 







































 



 





















 






























 



 



 



 



 















 






 


   
   


 



 


typedef struct
{


















































































 

    volatile uint32_t WTCR;           
    volatile uint32_t WTCRALT;        

} WDT_T;






 



 






























 


   
   


 



 


typedef struct
{













































































 

    volatile uint32_t WWDTRLD;        
    volatile uint32_t WWDTCR;         
    volatile uint32_t WWDTSR;         
    volatile const  uint32_t WWDTCVR;        

} WWDT_T;





 



 



 















 






 


   
   
   


 
 
 



 
 






 
#line 12073 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"













































#line 12127 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"















   

 
 
 




 
#line 12159 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"














































#line 12214 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"














   











 

typedef volatile unsigned char  vu8;        
typedef volatile unsigned short vu16;       
typedef volatile unsigned long  vu32;       





 







 







 








 







 








 







 







 






 








 







 








 







 







 






 


   







 













 
#line 12422 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"

 










   

   


 
 
 
#line 1 ".\\Libraries\\StdDriver\\inc\\SYS.h"
 









 










 



 



 


 
 
 
#line 64 ".\\Libraries\\StdDriver\\inc\\SYS.h"


 
 
 
#line 75 ".\\Libraries\\StdDriver\\inc\\SYS.h"


 
 
 







 








































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































   



 







 







 







 







 








 









 







 







 







 











 








 








 








 








 








 








 








 







 







 







 







 














 









 
static __inline void SYS_LockReg(void)
{
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0;
}








 
static __inline void SYS_UnlockReg(void)
{
    while(((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT != (1ul << 0))
    {
        ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x59;
        ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x16;
        ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x88;
    }
}


void SYS_ClearResetSrc(uint32_t u32Src);
uint32_t SYS_GetBODStatus(void);
uint32_t SYS_GetResetSrc(void);
uint32_t SYS_IsRegLocked(void);
uint32_t  SYS_ReadPDID(void);
void SYS_ResetChip(void);
void SYS_ResetCPU(void);
void SYS_ResetModule(uint32_t u32ModuleIndex);
void SYS_EnableBOD(int32_t i32Mode, uint32_t u32BODLevel);
void SYS_DisableBOD(void);


   

   

   








 
#line 12443 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\ADC.h"
 









 



#line 1 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
 









 



















 



















































 

#line 12466 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"

   


#line 16 ".\\Libraries\\StdDriver\\inc\\ADC.h"









 



 



 
 
 
 
























 
 
 




 
 
 
#line 77 ".\\Libraries\\StdDriver\\inc\\ADC.h"

 
 
 




 
 
 




 
 
 





 
 
 



 
 
 





   



 











 








 







 








 












 












 








 









 









 








 







 
















 
#line 255 ".\\Libraries\\StdDriver\\inc\\ADC.h"






 
















 
#line 288 ".\\Libraries\\StdDriver\\inc\\ADC.h"






 










 










 







 








 


void ADC_Open(ADC_T *adc,
              uint32_t u32InputMode,
              uint32_t u32OpMode,
              uint32_t u32ChMask);
void ADC_Close(ADC_T *adc);
void ADC_EnableHWTrigger(ADC_T *adc,
                         uint32_t u32Source,
                         uint32_t u32Param);
void ADC_DisableHWTrigger(ADC_T *adc);
void ADC_EnableInt(ADC_T *adc, uint32_t u32Mask);
void ADC_DisableInt(ADC_T *adc, uint32_t u32Mask);



   

   

   







 
#line 12444 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\CAN.h"
 









 



#line 16 ".\\Libraries\\StdDriver\\inc\\CAN.h"









 



 



 
 
 
 



 
 
 



 
 
 



   

 
 
 
typedef struct
{
    uint32_t  IdType;
    uint32_t  FrameType;
    uint32_t  Id;
    uint8_t   DLC;
    uint8_t   Data[8];
} STR_CANMSG_T;

 
 
 
typedef struct
{
    uint8_t   u8Xtd;
    uint8_t   u8Dir;
    uint32_t  u32Id;
    uint8_t   u8IdType;
} STR_CANMASK_T;






 










 











 










 










 












 



 
 
 
uint32_t CAN_SetBaudRate(CAN_T *tCAN, uint32_t u32BaudRate);
uint32_t CAN_Open(CAN_T *tCAN, uint32_t u32BaudRate, uint32_t u32Mode);
void CAN_Close(CAN_T *tCAN);
void CAN_CLR_INT_PENDING_BIT(CAN_T *tCAN, uint8_t u32MsgNum);
void CAN_EnableInt(CAN_T *tCAN, uint32_t u32Mask);
void CAN_DisableInt(CAN_T *tCAN, uint32_t u32Mask);
int32_t CAN_Transmit(CAN_T *tCAN, uint32_t u32MsgNum , STR_CANMSG_T* pCanMsg);
int32_t CAN_Receive(CAN_T *tCAN, uint32_t u32MsgNum , STR_CANMSG_T* pCanMsg);
int32_t CAN_SetMultiRxMsg(CAN_T *tCAN, uint32_t u32MsgNum , uint32_t u32MsgCount, uint32_t u32IDType, uint32_t u32ID);
int32_t CAN_SetRxMsg(CAN_T *tCAN, uint32_t u32MsgNum , uint32_t u32IDType, uint32_t u32ID);
int32_t CAN_SetTxMsg(CAN_T *tCAN, uint32_t u32MsgNum , STR_CANMSG_T* pCanMsg);
int32_t CAN_TriggerTxMsg(CAN_T  *tCAN, uint32_t u32MsgNum);


   

   

   







 
#line 12445 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\FMC.h"
 









 



#line 16 ".\\Libraries\\StdDriver\\inc\\FMC.h"









 



 



 


 
 
 







 
 
 



 
 
 
#line 62 ".\\Libraries\\StdDriver\\inc\\FMC.h"


   



 

 
 
 









 












 













 













 














 











 













 












 













 















 














 



 
 
 











 
static __inline void FMC_Write(uint32_t u32addr, uint32_t u32data)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x21;    
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;               
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT = u32data;               
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;                   
    __isb(0xF);                             
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);                  
}










 
static __inline uint32_t FMC_Read(uint32_t u32addr)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x00;  
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;          
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;              
    __isb(0xF);                        
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);             

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}













 
static __inline int32_t FMC_Erase(uint32_t u32addr)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x22;  
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;                
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;                    
    __isb(0xF);                              
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);                   

     
    if(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCON & (1ul << 6))
    {
        ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCON |= (1ul << 6);
        return -1;
    }
    return 0;
}










 
static __inline uint32_t FMC_ReadUID(uint8_t u8index)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x04;  
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = (u8index << 2);       
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;                  
    __isb(0xF);                            
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);                 

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}











 
static __inline uint32_t FMC_ReadCID(void)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x0B;            
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = 0x0;                            
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = (1ul << 0);           
    __isb(0xF);                                      
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG & (1ul << 0)) ;   

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}










 
static __inline uint32_t FMC_ReadPID(void)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x0C;           
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = 0x04;                          
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = (1ul << 0);          
    __isb(0xF);                                     
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG & (1ul << 0));   

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}










 
static __inline uint32_t FMC_ReadUCID(uint32_t u32Index)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x04;           
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = (0x04 * u32Index) + 0x10;      
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = (1ul << 0);          
    __isb(0xF);                                     
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG & (1ul << 0));   

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}















 
static __inline void FMC_SetVectorPageAddr(uint32_t u32PageAddr)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x2e;  
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32PageAddr;        
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;                
    __isb(0xF);                          
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);               
}














 
static __inline uint32_t FMC_GetVECMAP(void)
{
    return (((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPSTA & (0xFFFul << 9));
}

extern void FMC_Open(void);
extern void FMC_Close(void);
extern void FMC_EnableAPUpdate(void);
extern void FMC_DisableAPUpdate(void);
extern void FMC_EnableConfigUpdate(void);
extern void FMC_DisableConfigUpdate(void);
extern void FMC_EnableLDUpdate(void);
extern void FMC_DisableLDUpdate(void);
extern int32_t FMC_ReadConfig(uint32_t *u32Config, uint32_t u32Count);
extern int32_t FMC_WriteConfig(uint32_t *u32Config, uint32_t u32Count);
extern void FMC_SetBootSource(int32_t i32BootSrc);
extern int32_t FMC_GetBootSource(void);
extern uint32_t FMC_ReadDataFlashBaseAddr(void);

   

   

   








#line 12446 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\GPIO.h"
 









 











 



 



 


 
 
 





 
 
 






 
 
 



 
 
 






#line 82 ".\\Libraries\\StdDriver\\inc\\GPIO.h"















 
#line 183 ".\\Libraries\\StdDriver\\inc\\GPIO.h"


   




 












 













 













 













 













 













 













 














 



















 










 











 










 















 














 
















 














 



void GPIO_SetMode(GPIO_T *port, uint32_t u32PinMask, uint32_t u32Mode);
void GPIO_EnableInt(GPIO_T *port, uint32_t u32Pin, uint32_t u32IntAttribs);
void GPIO_DisableInt(GPIO_T *port, uint32_t u32Pin);


   

   

   







 
#line 12447 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\I2C.h"
 









 



#line 16 ".\\Libraries\\StdDriver\\inc\\I2C.h"









 



 



 

 
 
 
#line 47 ".\\Libraries\\StdDriver\\inc\\I2C.h"




   



 









 










 










 










 











 










 











 











 










 


 
 
 









 
static __inline void I2C_STOP(I2C_T *i2c)
{
    (i2c)->I2CON |= ((1ul << 3) | (1ul << 4));
    while((i2c)->I2CON & (1ul << 4));
}

void I2C_ClearTimeoutFlag(I2C_T *i2c);
void I2C_Close(I2C_T *i2c);
void I2C_Trigger(I2C_T *i2c, uint8_t u8Start, uint8_t u8Stop, uint8_t u8Si, uint8_t u8Ack);
void I2C_DisableInt(I2C_T *i2c);
void I2C_EnableInt(I2C_T *i2c);
uint32_t I2C_GetBusClockFreq(I2C_T *i2c);
uint32_t I2C_SetBusClockFreq(I2C_T *i2c, uint32_t u32BusClock);
uint32_t I2C_GetIntFlag(I2C_T *i2c);
uint32_t I2C_GetStatus(I2C_T *i2c);
uint32_t I2C_Open(I2C_T *i2c, uint32_t u32BusClock);
uint8_t I2C_GetData(I2C_T *i2c);
void I2C_SetSlaveAddr(I2C_T *i2c, uint8_t u8SlaveNo, uint8_t u8SlaveAddr, uint8_t u8GCMode);
void I2C_SetSlaveAddrMask(I2C_T *i2c, uint8_t u8SlaveNo, uint8_t u8SlaveAddrMask);
void I2C_EnableTimeout(I2C_T *i2c, uint8_t u8LongTimeout);
void I2C_DisableTimeout(I2C_T *i2c);
void I2C_EnableWakeup(I2C_T *i2c);
void I2C_DisableWakeup(I2C_T *i2c);
void I2C_SetData(I2C_T *i2c, uint8_t u8Data);

   

   

   

#line 12448 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\PWM.h"
 








 











 



 



 
#line 43 ".\\Libraries\\StdDriver\\inc\\PWM.h"
 
 
 






   




 











 
#line 79 ".\\Libraries\\StdDriver\\inc\\PWM.h"









 










 













 

















 













 














 
















 
#line 186 ".\\Libraries\\StdDriver\\inc\\PWM.h"


uint32_t PWM_ConfigCaptureChannel(PWM_T *pwm,
                                  uint32_t u32ChannelNum,
                                  uint32_t u32UnitTimeNsec,
                                  uint32_t u32CaptureEdge);
uint32_t PWM_ConfigOutputChannel(PWM_T *pwm,
                                 uint32_t u32ChannelNum,
                                 uint32_t u32Frequncy,
                                 uint32_t u32DutyCycle);
void PWM_Start(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_Stop(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_ForceStop(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_EnableADCTrigger(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Condition);
void PWM_DisableADCTrigger(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_ClearADCTriggerFlag(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Condition);
uint32_t PWM_GetADCTriggerFlag(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_EnableCapture(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_DisableCapture(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_EnableOutput(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_DisableOutput(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_EnableDeadZone(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Duration);
void PWM_DisableDeadZone(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_EnableCaptureInt(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Edge);
void PWM_DisableCaptureInt(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Edge);
void PWM_ClearCaptureIntFlag(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Edge);
uint32_t PWM_GetCaptureIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_EnableDutyInt(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32IntDutyType);
void PWM_DisableDutyInt(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_ClearDutyIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);
uint32_t PWM_GetDutyIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_EnablePeriodInt(PWM_T *pwm, uint32_t u32ChannelNum,  uint32_t u32IntPeriodType);
void PWM_DisablePeriodInt(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_ClearPeriodIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);
uint32_t PWM_GetPeriodIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);



   

   

   







 
#line 12449 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\SPI.h"
 









 











 



 



 














#line 52 ".\\Libraries\\StdDriver\\inc\\SPI.h"









   




 






 







 







 







 







 







 







 








 







 







 







 







 







 








 








 








 







 







 








 








 










 







 







 







 







 







 







 










 







 







 








 








 









 




 
uint32_t SPI_Open(SPI_T *spi, uint32_t u32MasterSlave, uint32_t u32SPIMode, uint32_t u32DataWidth, uint32_t u32BusClock);
void SPI_Close(SPI_T *spi);
void SPI_ClearRxFIFO(SPI_T *spi);
void SPI_ClearTxFIFO(SPI_T *spi);
void SPI_DisableAutoSS(SPI_T *spi);
void SPI_EnableAutoSS(SPI_T *spi, uint32_t u32SSPinMask, uint32_t u32ActiveLevel);
uint32_t SPI_SetBusClock(SPI_T *spi, uint32_t u32BusClock);
void SPI_EnableFIFO(SPI_T *spi, uint32_t u32TxThreshold, uint32_t u32RxThreshold);
void SPI_DisableFIFO(SPI_T *spi);
uint32_t SPI_GetBusClock(SPI_T *spi);
void SPI_EnableInt(SPI_T *spi, uint32_t u32Mask);
void SPI_DisableInt(SPI_T *spi, uint32_t u32Mask);
uint32_t SPI_GetIntFlag(SPI_T *spi, uint32_t u32Mask);
void SPI_ClearIntFlag(SPI_T *spi, uint32_t u32Mask);
uint32_t SPI_GetStatus(SPI_T *spi, uint32_t u32Mask);





 



 



 




#line 12450 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\CRC.h"
 








 











 



 



 
 
 
 





 
 
 





 
 
 




   




 









 










 










 










 













 










 










 



 
void CRC_Open(uint32_t u32Mode, uint32_t u32Attribute, uint32_t u32Seed, uint32_t u32DataLen);
void CRC_StartDMATransfer(uint32_t u32SrcAddr, uint32_t u32ByteCount);
uint32_t CRC_GetChecksum(void);

   

   

   







 
#line 12451 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\TIMER.h"
 








 











 



 



 

#line 43 ".\\Libraries\\StdDriver\\inc\\TIMER.h"

   




 










 












 











 










 
static __inline void TIMER_Start(TIMER_T *timer)
{
    timer->TCSR |= (1ul << 30);
}









 
static __inline void TIMER_Stop(TIMER_T *timer)
{
    timer->TCSR &= ~(1ul << 30);
}










 
static __inline void TIMER_EnableWakeup(TIMER_T *timer)
{
    timer->TCSR |= (1ul << 23);
}









 
static __inline void TIMER_DisableWakeup(TIMER_T *timer)
{
    timer->TCSR &= ~(1ul << 23);
}









 
static __inline void TIMER_EnableCaptureDebounce(TIMER_T *timer)
{
    timer->TEXCON |= (1ul << 6);
}









 
static __inline void TIMER_DisableCaptureDebounce(TIMER_T *timer)
{
    timer->TEXCON &= ~(1ul << 6);
}









 
static __inline void TIMER_EnableEventCounterDebounce(TIMER_T *timer)
{
    timer->TEXCON |= (1ul << 7);
}









 
static __inline void TIMER_DisableEventCounterDebounce(TIMER_T *timer)
{
    timer->TEXCON &= ~(1ul << 7);
}









 
static __inline void TIMER_EnableInt(TIMER_T *timer)
{
    timer->TCSR |= (1ul << 29);
}









 
static __inline void TIMER_DisableInt(TIMER_T *timer)
{
    timer->TCSR &= ~(1ul << 29);
}









 
static __inline void TIMER_EnableCaptureInt(TIMER_T *timer)
{
    timer->TEXCON |= (1ul << 5);
}









 
static __inline void TIMER_DisableCaptureInt(TIMER_T *timer)
{
    timer->TEXCON &= ~(1ul << 5);
}










 
static __inline uint32_t TIMER_GetIntFlag(TIMER_T *timer)
{
    return (timer->TISR & (1ul << 0) ? 1 : 0);
}









 
static __inline void TIMER_ClearIntFlag(TIMER_T *timer)
{
    timer->TISR = (1ul << 0);
}










 
static __inline uint32_t TIMER_GetCaptureIntFlag(TIMER_T *timer)
{
    return timer->TEXISR;
}









 
static __inline void TIMER_ClearCaptureIntFlag(TIMER_T *timer)
{
    timer->TEXISR = (1ul << 0);
}










 
static __inline uint32_t TIMER_GetWakeupFlag(TIMER_T *timer)
{
    return (timer->TISR & (1ul << 1) ? 1 : 0);
}









 
static __inline void TIMER_ClearWakeupFlag(TIMER_T *timer)
{
    timer->TISR = (1ul << 1);
}









 
static __inline uint32_t TIMER_GetCaptureData(TIMER_T *timer)
{
    return timer->TCAP;
}









 
static __inline uint32_t TIMER_GetCounter(TIMER_T *timer)
{
    return timer->TDR;
}

uint32_t TIMER_Open(TIMER_T *timer, uint32_t u32Mode, uint32_t u32Freq);
void TIMER_Close(TIMER_T *timer);
void TIMER_Delay(TIMER_T *timer, uint32_t u32Usec);
void TIMER_EnableCapture(TIMER_T *timer, uint32_t u32CapMode, uint32_t u32Edge);
void TIMER_DisableCapture(TIMER_T *timer);
void TIMER_EnableEventCounter(TIMER_T *timer, uint32_t u32Edge);
void TIMER_DisableEventCounter(TIMER_T *timer);
uint32_t TIMER_GetModuleClock(TIMER_T *timer);

   

   

   







 
#line 12452 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\WDT.h"
 








 











 



 



 
 
 
 
#line 42 ".\\Libraries\\StdDriver\\inc\\WDT.h"

 
 
 





   




 









 










 










 











 











 











 












 










 
static __inline void WDT_Close(void)
{
    ((WDT_T *) ((( uint32_t)0x40000000) + 0x4000))->WTCR = 0;
    return;
}









 
static __inline void WDT_EnableInt(void)
{
    ((WDT_T *) ((( uint32_t)0x40000000) + 0x4000))->WTCR |= (1ul << 6);
    return;
}









 
static __inline void WDT_DisableInt(void)
{
    
    ((WDT_T *) ((( uint32_t)0x40000000) + 0x4000))->WTCR &= ~((1ul << 6) | (1ul << 2) | (1ul << 3) | (1ul << 5));
    return;
}

void WDT_Open(uint32_t u32TimeoutInterval, uint32_t u32ResetDelay, uint32_t u32EnableReset, uint32_t u32EnableWakeup);

   

   

   







 
#line 12453 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\WWDT.h"
 








 











 



 



 
 
 
 
#line 50 ".\\Libraries\\StdDriver\\inc\\WWDT.h"



   




 









 










 











 











 










 












 


void WWDT_Open(uint32_t u32PreScale, uint32_t u32CmpValue, uint32_t u32EnableInt);

   

   

   







 
#line 12454 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\RTC.h"
 








 











 



 



 















#line 54 ".\\Libraries\\StdDriver\\inc\\RTC.h"

#line 62 ".\\Libraries\\StdDriver\\inc\\RTC.h"







   




 


 
typedef struct
{
    uint32_t u32Year;            
    uint32_t u32Month;           
    uint32_t u32Day;             
    uint32_t u32DayOfWeek;       
    uint32_t u32Hour;            
    uint32_t u32Minute;          
    uint32_t u32Second;          
    uint32_t u32TimeScale;       
    uint32_t u32AmPm;            
} S_RTC_TIME_DATA_T;

   




 










 










 










 











 











 










 











 












 













 










 
static __inline void RTC_WaitAccessEnable(void)
{
     
    while((((RTC_T *) ((( uint32_t)0x40000000) + 0x08000))->AER & (1ul << 16)) == (1ul << 16));
    ((RTC_T *) ((( uint32_t)0x40000000) + 0x08000))->AER = 0x0000A965UL;

     
    while((((RTC_T *) ((( uint32_t)0x40000000) + 0x08000))->AER & (1ul << 16)) == 0x0);
}

void RTC_Open(S_RTC_TIME_DATA_T *sPt);
void RTC_Close(void);
void RTC_32KCalibration(int32_t i32FrequencyX100);
void RTC_GetDateAndTime(S_RTC_TIME_DATA_T *sPt);
void RTC_GetAlarmDateAndTime(S_RTC_TIME_DATA_T *sPt);
void RTC_SetDateAndTime(S_RTC_TIME_DATA_T *sPt);
void RTC_SetAlarmDateAndTime(S_RTC_TIME_DATA_T *sPt);
void RTC_SetDate(uint32_t u32Year, uint32_t u32Month, uint32_t u32Day, uint32_t u32DayOfWeek);
void RTC_SetTime(uint32_t u32Hour, uint32_t u32Minute, uint32_t u32Second, uint32_t u32TimeMode, uint32_t u32AmPm);
void RTC_SetAlarmDate(uint32_t u32Year, uint32_t u32Month, uint32_t u32Day);
void RTC_SetAlarmTime(uint32_t u32Hour, uint32_t u32Minute, uint32_t u32Second, uint32_t u32TimeMode, uint32_t u32AmPm);
uint32_t RTC_GetDayOfWeek(void);
void RTC_SetTickPeriod(uint32_t u32TickSelection);
void RTC_EnableInt(uint32_t u32IntFlagMask);
void RTC_DisableInt(uint32_t u32IntFlagMask);
void RTC_EnableSpareRegister(void);
void RTC_DisableSpareRegister(void);
void RTC_EnableSnooperDetection(uint32_t u32PinCondition);
void RTC_DisableSnooperDetection(void);

   

   

   







 
#line 12455 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\UART.h"
 









 












 



 



 

 
 
 





 
 
 











 
 
 
















 
 
 



 
 
 



 
 
 





 
 
 
#line 114 ".\\Libraries\\StdDriver\\inc\\UART.h"

 
 
 




   




 











 











 












 










 












 












 











 











 











 












 











 












 












 




















 



















 



































 











 
static __inline void UART_CLEAR_RTS(UART_T* uart)
{
    (uart)->MCR |= (1ul << 9);
    (uart)->MCR &= ~(1ul << 1);
}









 
static __inline void UART_SET_RTS(UART_T* uart)
{
    (uart)->MCR |= (1ul << 9) | (1ul << 1);
}










 











 



void UART_ClearIntFlag(UART_T* uart , uint32_t u32InterruptFlag);
void UART_Close(UART_T* uart);
void UART_DisableFlowCtrl(UART_T* uart);
void UART_DisableInt(UART_T*  uart, uint32_t u32InterruptFlag);
void UART_EnableFlowCtrl(UART_T* uart);
void UART_EnableInt(UART_T*  uart, uint32_t u32InterruptFlag);
void UART_Open(UART_T* uart, uint32_t u32baudrate);
uint32_t UART_Read(UART_T* uart, uint8_t *pu8RxBuf, uint32_t u32ReadBytes);
void UART_SetLine_Config(UART_T* uart, uint32_t u32baudrate, uint32_t u32data_width, uint32_t u32parity, uint32_t  u32stop_bits);
void UART_SetTimeoutCnt(UART_T* uart, uint32_t u32TOC);
void UART_SelectIrDAMode(UART_T* uart, uint32_t u32Buadrate, uint32_t u32Direction);
void UART_SelectRS485Mode(UART_T* uart, uint32_t u32Mode, uint32_t u32Addr);
void UART_SelectLINMode(UART_T* uart, uint32_t u32Mode, uint32_t u32BreakLength);
uint32_t UART_Write(UART_T* uart, uint8_t *pu8TxBuf, uint32_t u32WriteBytes);


   

   

   







 

#line 12456 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\I2S.h"
 








 



#line 15 ".\\Libraries\\StdDriver\\inc\\I2S.h"








 



 



 





 



 



 



 
#line 58 ".\\Libraries\\StdDriver\\inc\\I2S.h"

#line 67 ".\\Libraries\\StdDriver\\inc\\I2S.h"

 



 



   



 
 
 
 








 
static __inline void I2S_ENABLE_TX_ZCD(I2S_T *i2s, uint32_t u32ChMask)
{
    if(u32ChMask == 0)
        i2s->CON |= (1ul << 16);
    else
        i2s->CON |= (1ul << 17);
}









 
static __inline void I2S_DISABLE_TX_ZCD(I2S_T *i2s, uint32_t u32ChMask)
{
    if(u32ChMask == 0)
        i2s->CON &= ~(1ul << 16);
    else
        i2s->CON &= ~(1ul << 17);
}






 







 







 







 







 







 







 







 







 







 







 







 










 
static __inline void I2S_SET_MONO_RX_CHANNEL(I2S_T *i2s, uint32_t u32Ch)
{
    u32Ch == (1ul << 23) ?
    (i2s->CON |= (1ul << 23)) :
    (i2s->CON &= ~(1ul << 23));
}







 







 








 








 







 







 



 
uint32_t I2S_Open(I2S_T *i2s, uint32_t u32MasterSlave, uint32_t u32SampleRate, uint32_t u32WordWidth, uint32_t u32Channels, uint32_t u32DataFormat);
void I2S_Close(I2S_T *i2s);
void I2S_EnableInt(I2S_T *i2s, uint32_t u32Mask);
void I2S_DisableInt(I2S_T *i2s, uint32_t u32Mask);
uint32_t I2S_EnableMCLK(I2S_T *i2s, uint32_t u32BusClock);
void I2S_DisableMCLK(I2S_T *i2s);
void I2S_SetFIFO(I2S_T *i2s, uint32_t u32TxThreshold, uint32_t u32RxThreshold);

   


   

   



 

#line 12457 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\USBD.h"
 









 







 



 



 


typedef struct s_usbd_info
{
    const uint8_t *gu8DevDesc;             
    const uint8_t *gu8ConfigDesc;          
    const uint8_t **gu8StringDesc;         
    const uint8_t **gu8HidReportDesc;      
    const uint32_t *gu32HidReportSize;     
    const uint32_t *gu32ConfigHidDescIdx;  

} S_USBD_INFO_T;

extern const S_USBD_INFO_T gsInfo;

   





 







#line 65 ".\\Libraries\\StdDriver\\inc\\USBD.h"


 




 
#line 84 ".\\Libraries\\StdDriver\\inc\\USBD.h"

 
#line 93 ".\\Libraries\\StdDriver\\inc\\USBD.h"

 



 
#line 105 ".\\Libraries\\StdDriver\\inc\\USBD.h"

 







 



 
 
 














#line 148 ".\\Libraries\\StdDriver\\inc\\USBD.h"















   





 










 












 












 











 











 











 











 











 











 











 














 











 














 











 















 












 











 












 












 













 











 













 













 











 










 










 












 















 
static __inline void USBD_MemCopy(uint8_t *dest, uint8_t *src, int32_t size)
{
    while(size--) *dest++ = *src++;
}











 
static __inline void USBD_SetStall(uint8_t epnum)
{
    uint32_t u32CfgAddr;
    uint32_t u32Cfg;
    int i;

    for(i = 0; i < 8; i++)
    {
        u32CfgAddr = (uint32_t)(i << 4) + (uint32_t)&((USBD_T *) ((( uint32_t)0x40000000) + 0x60000))->EP[0].CFG;  
        u32Cfg = *((volatile uint32_t *)(u32CfgAddr));

        if((u32Cfg & 0xf) == epnum)
        {
            u32CfgAddr = (uint32_t)(i << 4) + (uint32_t)&((USBD_T *) ((( uint32_t)0x40000000) + 0x60000))->EP[0].CFGP;  
            u32Cfg = *((volatile uint32_t *)(u32CfgAddr));

            *((volatile uint32_t *)(u32CfgAddr)) = (u32Cfg | (1ul << 1));
            break;
        }
    }
}









 
static __inline void USBD_ClearStall(uint8_t epnum)
{
    uint32_t u32CfgAddr;
    uint32_t u32Cfg;
    int i;

    for(i = 0; i < 8; i++)
    {
        u32CfgAddr = (uint32_t)(i << 4) + (uint32_t)&((USBD_T *) ((( uint32_t)0x40000000) + 0x60000))->EP[0].CFG;  
        u32Cfg = *((volatile uint32_t *)(u32CfgAddr));

        if((u32Cfg & 0xf) == epnum)
        {
            u32CfgAddr = (uint32_t)(i << 4) + (uint32_t)&((USBD_T *) ((( uint32_t)0x40000000) + 0x60000))->EP[0].CFGP;  
            u32Cfg = *((volatile uint32_t *)(u32CfgAddr));

            *((volatile uint32_t *)(u32CfgAddr)) = (u32Cfg & ~(1ul << 1));
            break;
        }
    }
}











 
static __inline uint32_t USBD_GetStall(uint8_t epnum)
{
    uint32_t u32CfgAddr;
    uint32_t u32Cfg;
    int i;

    for(i = 0; i < 8; i++)
    {
        u32CfgAddr = (uint32_t)(i << 4) + (uint32_t)&((USBD_T *) ((( uint32_t)0x40000000) + 0x60000))->EP[0].CFG;  
        u32Cfg = *((volatile uint32_t *)(u32CfgAddr));

        if((u32Cfg & 0xf) == epnum)
        {
            u32CfgAddr = (uint32_t)(i << 4) + (uint32_t)&((USBD_T *) ((( uint32_t)0x40000000) + 0x60000))->EP[0].CFGP;  
            break;
        }
    }

    return ((*((volatile uint32_t *)(u32CfgAddr))) & (1ul << 1));
}


extern volatile uint8_t g_usbd_RemoteWakeupEn;
typedef void (*VENDOR_REQ)(void);            
typedef void (*CLASS_REQ)(void);             
typedef void (*SET_INTERFACE_REQ)(void);     
typedef void (*SET_CONFIG_CB)(void);        

 
void USBD_Open(const S_USBD_INFO_T *param, CLASS_REQ pfnClassReq, SET_INTERFACE_REQ pfnSetInterface);
void USBD_Start(void);
void USBD_GetSetupPacket(uint8_t *buf);
void USBD_ProcessSetupPacket(void);
void USBD_StandardRequest(void);
void USBD_PrepareCtrlIn(uint8_t *pu8Buf, uint32_t u32Size);
void USBD_CtrlIn(void);
void USBD_PrepareCtrlOut(uint8_t *pu8Buf, uint32_t u32Size);
void USBD_CtrlOut(void);
void USBD_SwReset(void);
void USBD_SetVendorRequest(VENDOR_REQ pfnVendorReq);
void USBD_SetConfigCallback(SET_CONFIG_CB pfnSetConfigCallback);
void USBD_LockEpStall(uint32_t u32EpBitmap);

   

   

   




 
#line 12458 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\PDMA.h"
 









 



#line 16 ".\\Libraries\\StdDriver\\inc\\PDMA.h"




 



 



 

 
 
 




 
 
 





 
 
 
#line 64 ".\\Libraries\\StdDriver\\inc\\PDMA.h"


   



 









 










 











 











 











 











 












 
#line 161 ".\\Libraries\\StdDriver\\inc\\PDMA.h"









 


void PDMA_Open(uint32_t u32Mask);
void PDMA_Close(void);
void PDMA_SetTransferCnt(uint32_t u32Ch, uint32_t u32Width, uint32_t u32TransCount);
void PDMA_SetTransferAddr(uint32_t u32Ch, uint32_t u32SrcAddr, uint32_t u32SrcCtrl, uint32_t u32DstAddr, uint32_t u32DstCtrl);
void PDMA_SetTransferMode(uint32_t u32Ch, uint32_t u32Periphral, uint32_t u32ScatterEn, uint32_t u32DescAddr);
void PDMA_Trigger(uint32_t u32Ch);
void PDMA_EnableInt(uint32_t u32Ch, uint32_t u32Mask);
void PDMA_DisableInt(uint32_t u32Ch, uint32_t u32Mask);




 



 



 

#line 12459 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\SC.h"
 








 











 



 



 
#line 37 ".\\Libraries\\StdDriver\\inc\\SC.h"

#line 48 ".\\Libraries\\StdDriver\\inc\\SC.h"


   




 





















 






















 











 
#line 121 ".\\Libraries\\StdDriver\\inc\\SC.h"











 
#line 141 ".\\Libraries\\StdDriver\\inc\\SC.h"










 
#line 160 ".\\Libraries\\StdDriver\\inc\\SC.h"










 
#line 179 ".\\Libraries\\StdDriver\\inc\\SC.h"







 









 









 








 
static __inline void SC_SetTxRetry(SC_T *sc, uint32_t u32Count)
{
    while((sc)->CTL & (1ul << 30));
    if((u32Count) == 0)         
    {
        (sc)->CTL &= ~((7ul << 20) | (1ul << 23));
    }
    else
    {
        (sc)->CTL = ((sc)->CTL & ~(7ul << 20)) | (((u32Count) - 1) << 20) | (1ul << 23);
    }
}







 
static __inline void  SC_SetRxRetry(SC_T *sc, uint32_t u32Count)
{
    while((sc)->CTL & (1ul << 30));
    if((u32Count) == 0)         
    {
        (sc)->CTL &= ~((7ul << 16) | (1ul << 19));
    }
    else
    {
        (sc)->CTL = ((sc)->CTL & ~(7ul << 16)) | (((u32Count) - 1) << 16) | (1ul << 19);
    }
}


uint32_t SC_IsCardInserted(SC_T *sc);
void SC_ClearFIFO(SC_T *sc);
void SC_Close(SC_T *sc);
void SC_Open(SC_T *sc, uint32_t u32CardDet, uint32_t u32PWR);
void SC_ResetReader(SC_T *sc);
void SC_SetBlockGuardTime(SC_T *sc, uint32_t u32BGT);
void SC_SetCharGuardTime(SC_T *sc, uint32_t u32CGT);
void SC_StopAllTimer(SC_T *sc);
void SC_StartTimer(SC_T *sc, uint32_t u32TimerNum, uint32_t u32Mode, uint32_t u32ETUCount);
void SC_StopTimer(SC_T *sc, uint32_t u32TimerNum);


   

   

   







 
#line 12460 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\SCUART.h"
 








 











 



 



 













   




 

 







 











 









 









 










 









 



 







 










 










 










 









 


 













 














 
















 













 












 













 


void SCUART_Close(SC_T* sc);
uint32_t SCUART_Open(SC_T* sc, uint32_t u32baudrate);
uint32_t SCUART_Read(SC_T* sc, uint8_t *pu8RxBuf, uint32_t u32ReadBytes);
uint32_t SCUART_SetLineConfig(SC_T* sc, uint32_t u32Baudrate, uint32_t u32DataWidth, uint32_t u32Parity, uint32_t  u32StopBits);
void SCUART_SetTimeoutCnt(SC_T* sc, uint32_t u32TOC);
void SCUART_Write(SC_T* sc, uint8_t *pu8TxBuf, uint32_t u32WriteBytes);

   

   

   







 
#line 12461 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\PS2.h"
 








 



 
 
 
#line 18 ".\\Libraries\\StdDriver\\inc\\PS2.h"









 



 




 

 
 
 










 











 











 












 
static __inline void PS2_CLEAR_TX_FIFO(void)
{
    ((PS2_T *) ((( uint32_t)0x40100000) + 0x00000))->PS2CON |= (1ul << 8);
    ((PS2_T *) ((( uint32_t)0x40100000) + 0x00000))->PS2CON &= ~(1ul << 8);
}









 










 











 










 










 










 










 










 










 










 










 










 



 
 
 

void PS2_Open(void);
void PS2_Close(void);
uint8_t PS2_Read(void);
int32_t PS2_Write(uint32_t *pu32Buf, uint32_t u32ByteCount);
void PS2_EnableInt(uint32_t u32Mask);
void PS2_DisableInt(uint32_t u32Mask);


   

   

   







 

#line 12462 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\CLK.h"
 









 










 



 



 








 
 
 






#line 54 ".\\Libraries\\StdDriver\\inc\\CLK.h"


 
 
 









#line 76 ".\\Libraries\\StdDriver\\inc\\CLK.h"

#line 101 ".\\Libraries\\StdDriver\\inc\\CLK.h"





#line 116 ".\\Libraries\\StdDriver\\inc\\CLK.h"

#line 127 ".\\Libraries\\StdDriver\\inc\\CLK.h"

 
 
 










#line 161 ".\\Libraries\\StdDriver\\inc\\CLK.h"

#line 172 ".\\Libraries\\StdDriver\\inc\\CLK.h"

#line 183 ".\\Libraries\\StdDriver\\inc\\CLK.h"

#line 194 ".\\Libraries\\StdDriver\\inc\\CLK.h"

#line 205 ".\\Libraries\\StdDriver\\inc\\CLK.h"








 
 
 
#line 228 ".\\Libraries\\StdDriver\\inc\\CLK.h"


 
 
 






 
 
 





 
 
 










#line 271 ".\\Libraries\\StdDriver\\inc\\CLK.h"

#line 278 ".\\Libraries\\StdDriver\\inc\\CLK.h"


 
 
 

 

#line 296 ".\\Libraries\\StdDriver\\inc\\CLK.h"

#line 305 ".\\Libraries\\StdDriver\\inc\\CLK.h"


#line 409 ".\\Libraries\\StdDriver\\inc\\CLK.h"


#line 431 ".\\Libraries\\StdDriver\\inc\\CLK.h"


   




 







 
static __inline uint32_t CLK_GetPLLClockFreq(void)
{
    uint32_t u32PllFreq = 0, u32PllReg;
    uint32_t u32FIN, u32NF, u32NR, u32NO;
    uint8_t au8NoTbl[4] = {1, 2, 2, 4};

    u32PllReg = ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PLLCON;

    if(u32PllReg & ((1ul << 16) | (1ul << 18)))
        return 0;            

    if(u32PllReg & 0x00080000UL)
        u32FIN = (22118400UL);     
    else
        u32FIN = (12000000UL);      

    if(u32PllReg & (1ul << 17))
        return u32FIN;       

     
    u32NO = au8NoTbl[((u32PllReg & (3ul << 14)) >> 14)];
    u32NF = ((u32PllReg & (0x1FFul << 0)) >> 0) + 2;
    u32NR = ((u32PllReg & (0x1Ful << 9)) >> 9) + 2;

     
    u32PllFreq = (((u32FIN >> 2) * u32NF) / (u32NR * u32NO) << 2);

    return u32PllFreq;
}








 
static __inline void CLK_SysTickDelay(uint32_t us)
{
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = us * CyclesPerUs;
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL  = (0x00);
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2) | (1UL << 0);

     
    while((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL & (1UL << 16)) == 0);

     
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = 0;
}


void CLK_DisableCKO(void);
void CLK_EnableCKO(uint32_t u32ClkSrc, uint32_t u32ClkDiv, uint32_t u32ClkDivBy1En);
void CLK_PowerDown(void);
void CLK_Idle(void);
uint32_t CLK_GetHXTFreq(void);
uint32_t CLK_GetLXTFreq(void);
uint32_t CLK_GetHCLKFreq(void);
uint32_t CLK_GetPCLKFreq(void);
uint32_t CLK_GetCPUFreq(void);
uint32_t CLK_SetCoreClock(uint32_t u32Hclk);
void CLK_SetHCLK(uint32_t u32ClkSrc, uint32_t u32ClkDiv);
void CLK_SetModuleClock(uint32_t u32ModuleIdx, uint32_t u32ClkSrc, uint32_t u32ClkDiv);
void CLK_SetSysTickClockSrc(uint32_t u32ClkSrc);
void CLK_EnableXtalRC(uint32_t u32ClkMask);
void CLK_DisableXtalRC(uint32_t u32ClkMask);
void CLK_EnableModuleClock(uint32_t u32ModuleIdx);
void CLK_DisableModuleClock(uint32_t u32ModuleIdx);
uint32_t CLK_EnablePLL(uint32_t u32PllClkSrc, uint32_t u32PllFreq);
void CLK_DisablePLL(void);
uint32_t CLK_WaitClockReady(uint32_t u32ClkMask);
void CLK_EnableSysTick(uint32_t u32ClkSrc, uint32_t u32Count);
void CLK_DisableSysTick(void);


   

   

   







 
#line 12463 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\ACMP.h"
 








 











 



 



 

 
 
 
#line 44 ".\\Libraries\\StdDriver\\inc\\ACMP.h"

   




 







 








 











 








 








 








 








 









 








 








 








 








 



 
void ACMP_Open(ACMP_T *, uint32_t u32ChNum, uint32_t u32NegSrc, uint32_t u32HysteresisEn);
void ACMP_Close(ACMP_T *, uint32_t u32ChNum);

   

   

   







 
#line 12464 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"
#line 1 ".\\Libraries\\StdDriver\\inc\\EBI.h"
 









 











 



 



 
 
 
 



 
 
 



 
 
 
#line 53 ".\\Libraries\\StdDriver\\inc\\EBI.h"

#line 61 ".\\Libraries\\StdDriver\\inc\\EBI.h"

   




 









 











 










 











 










 











 


void EBI_Open(uint32_t u32Bank, uint32_t u32DataWidth, uint32_t u32TimingClass, uint32_t u32BusMode, uint32_t u32CSActiveLevel);
void EBI_Close(uint32_t u32Bank);
void EBI_SetBusTiming(uint32_t u32Bank, uint32_t u32TimingConfig, uint32_t u32MclkDiv);

   

   

   







 
#line 12465 ".\\Libraries\\Device\\Nuvoton\\NUC230_240\\Include\\NUC230_240.h"


   


#line 9 "Drivers\\usb.c"
#line 1 "..\\..\\components\\drivers\\include\\drivers\\usb_device.h"
























 




#line 1 "..\\..\\include\\rtthread.h"





























 




#line 1 "..\\nuvoton_nuc240\\rtconfig.h"
 



 


 


 


 






 
 




 
 

 





 
 


 


 


 


 


 
 


 


 





 
 






 

 






 

 




 



 


 
 


 

 

 

 




 

 


#line 36 "..\\..\\include\\rtthread.h"
#line 1 "..\\..\\include\\rtdebug.h"


















 




#line 25 "..\\..\\include\\rtdebug.h"

 
#line 130 "..\\..\\include\\rtdebug.h"








#line 37 "..\\..\\include\\rtthread.h"
#line 1 "..\\..\\include\\rtdef.h"
































 




 
#line 40 "..\\..\\include\\rtdef.h"







 

 

 




 



 
typedef signed   char                   rt_int8_t;       
typedef signed   short                  rt_int16_t;      
typedef signed   long                   rt_int32_t;      
typedef unsigned char                   rt_uint8_t;      
typedef unsigned short                  rt_uint16_t;     
typedef unsigned long                   rt_uint32_t;     
typedef int                             rt_bool_t;       

 
typedef long                            rt_base_t;       
typedef unsigned long                   rt_ubase_t;      

typedef rt_base_t                       rt_err_t;        
typedef rt_uint32_t                     rt_time_t;       
typedef rt_uint32_t                     rt_tick_t;       
typedef rt_base_t                       rt_flag_t;       
typedef rt_ubase_t                      rt_size_t;       
typedef rt_ubase_t                      rt_dev_t;        
typedef rt_base_t                       rt_off_t;        

 



 

 





 
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"
 
 
 





 










#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"








 

 
 
#line 57 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"
    typedef struct __va_list { void *__ap; } va_list;

   






 


   










 


   















 




   

 


   




 



   





 







#line 138 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"



#line 147 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"

 

#line 96 "..\\..\\include\\rtdef.h"
#line 102 "..\\..\\include\\rtdef.h"
     






#line 173 "..\\..\\include\\rtdef.h"

 

typedef int (*init_fn_t)(void);
#line 198 "..\\..\\include\\rtdef.h"

 

 
 

 

 

 

 


#line 224 "..\\..\\include\\rtdef.h"

 


 




 














 

 

 
#line 262 "..\\..\\include\\rtdef.h"

 







 








 







 


struct rt_list_node
{
    struct rt_list_node *next;                           
    struct rt_list_node *prev;                           
};
typedef struct rt_list_node rt_list_t;                   



 

 



 




 
struct rt_object
{
    char       name[8];                        
    rt_uint8_t type;                                     
    rt_uint8_t flag;                                     




    rt_list_t  list;                                     
};
typedef struct rt_object *rt_object_t;                   

















 
enum rt_object_class_type
{
    RT_Object_Class_Thread = 0,                          

    RT_Object_Class_Semaphore,                           


    RT_Object_Class_Mutex,                               


    RT_Object_Class_Event,                               


    RT_Object_Class_MailBox,                             


    RT_Object_Class_MessageQueue,                        





    RT_Object_Class_MemPool,                             


    RT_Object_Class_Device,                              

    RT_Object_Class_Timer,                               



    RT_Object_Class_Unknown,                             
    RT_Object_Class_Static = 0x80                        
};



 
struct rt_object_information
{
    enum rt_object_class_type type;                      
    rt_list_t                 object_list;               
    rt_size_t                 object_size;               
};



 
#line 396 "..\\..\\include\\rtdef.h"

 



 

 



 

















 






 
struct rt_timer
{
    struct rt_object parent;                             

    rt_list_t        row[1];

    void (*timeout_func)(void *parameter);               
    void            *parameter;                          

    rt_tick_t        init_tick;                          
    rt_tick_t        timeout_tick;                       
};
typedef struct rt_timer *rt_timer_t;

 



 

 



 



 
#line 468 "..\\..\\include\\rtdef.h"



 







 
struct rt_thread
{
     
    char        name[8];                       
    rt_uint8_t  type;                                    
    rt_uint8_t  flags;                                   





    rt_list_t   list;                                    
    rt_list_t   tlist;                                   

     
    void       *sp;                                      
    void       *entry;                                   
    void       *parameter;                               
    void       *stack_addr;                              
    rt_uint32_t stack_size;                              

     
    rt_err_t    error;                                   

    rt_uint8_t  stat;                                    

     
    rt_uint8_t  current_priority;                        
    rt_uint8_t  init_priority;                           




    rt_uint32_t number_mask;


     
    rt_uint32_t event_set;
    rt_uint8_t  event_info;


    rt_ubase_t  init_tick;                               
    rt_ubase_t  remaining_tick;                          

    struct rt_timer thread_timer;                        

    void (*cleanup)(struct rt_thread *tid);              

    rt_uint32_t user_data;                               
};
typedef struct rt_thread *rt_thread_t;

 



 

 



 











 
struct rt_ipc_object
{
    struct rt_object parent;                             

    rt_list_t        suspend_thread;                     
};




 
struct rt_semaphore
{
    struct rt_ipc_object parent;                         

    rt_uint16_t          value;                          
};
typedef struct rt_semaphore *rt_sem_t;





 
struct rt_mutex
{
    struct rt_ipc_object parent;                         

    rt_uint16_t          value;                          

    rt_uint8_t           original_priority;              
    rt_uint8_t           hold;                           

    struct rt_thread    *owner;                          
};
typedef struct rt_mutex *rt_mutex_t;





 






 
struct rt_event
{
    struct rt_ipc_object parent;                         

    rt_uint32_t          set;                            
};
typedef struct rt_event *rt_event_t;





 
struct rt_mailbox
{
    struct rt_ipc_object parent;                         

    rt_uint32_t         *msg_pool;                       

    rt_uint16_t          size;                           

    rt_uint16_t          entry;                          
    rt_uint16_t          in_offset;                      
    rt_uint16_t          out_offset;                     

    rt_list_t            suspend_sender_thread;          
};
typedef struct rt_mailbox *rt_mailbox_t;





 
struct rt_messagequeue
{
    struct rt_ipc_object parent;                         

    void                *msg_pool;                       

    rt_uint16_t          msg_size;                       
    rt_uint16_t          max_msgs;                       

    rt_uint16_t          entry;                          

    void                *msg_queue_head;                 
    void                *msg_queue_tail;                 
    void                *msg_queue_free;                 
};
typedef struct rt_messagequeue *rt_mq_t;


 



 

 




 

#line 706 "..\\..\\include\\rtdef.h"




 
struct rt_mempool
{
    struct rt_object parent;                             

    void            *start_address;                      
    rt_size_t        size;                               

    rt_size_t        block_size;                         
    rt_uint8_t      *block_list;                         

    rt_size_t        block_total_count;                  
    rt_size_t        block_free_count;                   

    rt_list_t        suspend_thread;                     
    rt_size_t        suspend_thread_count;               
};
typedef struct rt_mempool *rt_mp_t;


 




 

 



 
enum rt_device_class_type
{
    RT_Device_Class_Char = 0,                            
    RT_Device_Class_Block,                               
    RT_Device_Class_NetIf,                               
    RT_Device_Class_MTD,                                 
    RT_Device_Class_CAN,                                 
    RT_Device_Class_RTC,                                 
    RT_Device_Class_Sound,                               
    RT_Device_Class_Graphic,                             
    RT_Device_Class_I2CBUS,                              
    RT_Device_Class_USBDevice,                           
    RT_Device_Class_USBHost,                             
    RT_Device_Class_SPIBUS,                              
    RT_Device_Class_SPIDevice,                           
    RT_Device_Class_SDIO,                                
    RT_Device_Class_PM,                                  
    RT_Device_Class_Pipe,                                
    RT_Device_Class_Portal,                              
    RT_Device_Class_Timer,                               
	RT_Device_Class_Miscellaneous,                       
	RT_Device_Class_Unknown                              
};



 






























 





 
#line 817 "..\\..\\include\\rtdef.h"

typedef struct rt_device *rt_device_t;


 
struct rt_device
{
    struct rt_object          parent;                    

    enum rt_device_class_type type;                      
    rt_uint16_t               flag;                      
    rt_uint16_t               open_flag;                 

    rt_uint8_t                ref_count;                 
    rt_uint8_t                device_id;                 

     
    rt_err_t (*rx_indicate)(rt_device_t dev, rt_size_t size);
    rt_err_t (*tx_complete)(rt_device_t dev, void *buffer);

     
    rt_err_t  (*init)   (rt_device_t dev);
    rt_err_t  (*open)   (rt_device_t dev, rt_uint16_t oflag);
    rt_err_t  (*close)  (rt_device_t dev);
    rt_size_t (*read)   (rt_device_t dev, rt_off_t pos, void *buffer, rt_size_t size);
    rt_size_t (*write)  (rt_device_t dev, rt_off_t pos, const void *buffer, rt_size_t size);
    rt_err_t  (*control)(rt_device_t dev, rt_uint8_t cmd, void *args);

    void                     *user_data;                 
};



 
struct rt_device_blk_geometry
{
    rt_uint32_t sector_count;                            
    rt_uint32_t bytes_per_sector;                        
    rt_uint32_t block_size;                              
};



 
struct rt_device_blk_sectors
{
    rt_uint32_t sector_begin;                            
    rt_uint32_t sector_end;                              
};



 





 
#line 882 "..\\..\\include\\rtdef.h"

 
enum
{
    RTGRAPHIC_PIXEL_FORMAT_MONO = 0,
    RTGRAPHIC_PIXEL_FORMAT_GRAY4,
    RTGRAPHIC_PIXEL_FORMAT_GRAY16,
    RTGRAPHIC_PIXEL_FORMAT_RGB332,
    RTGRAPHIC_PIXEL_FORMAT_RGB444,
    RTGRAPHIC_PIXEL_FORMAT_RGB565,
    RTGRAPHIC_PIXEL_FORMAT_RGB565P,
    RTGRAPHIC_PIXEL_FORMAT_BGR565 = RTGRAPHIC_PIXEL_FORMAT_RGB565P,
    RTGRAPHIC_PIXEL_FORMAT_RGB666,
    RTGRAPHIC_PIXEL_FORMAT_RGB888,
    RTGRAPHIC_PIXEL_FORMAT_ARGB888,
    RTGRAPHIC_PIXEL_FORMAT_ABGR888,
    RTGRAPHIC_PIXEL_FORMAT_ARGB565,
    RTGRAPHIC_PIXEL_FORMAT_ALPHA,
};



 




 
struct rt_device_graphic_info
{
    rt_uint8_t  pixel_format;                            
    rt_uint8_t  bits_per_pixel;                          
    rt_uint16_t reserved;                                

    rt_uint16_t width;                                   
    rt_uint16_t height;                                  

    rt_uint8_t *framebuffer;                             
};



 
struct rt_device_rect_info
{
    rt_uint16_t x;                                       
    rt_uint16_t y;                                       
    rt_uint16_t width;                                   
    rt_uint16_t height;                                  
};



 
struct rt_device_graphic_ops
{
    void (*set_pixel) (const char *pixel, int x, int y);
    void (*get_pixel) (char *pixel, int x, int y);

    void (*draw_hline)(const char *pixel, int x1, int x2, int y);
    void (*draw_vline)(const char *pixel, int x, int y1, int y2);

    void (*blit_line) (const char *pixel, int x, int y, rt_size_t size);
};


 


#line 1001 "..\\..\\include\\rtdef.h"





#line 38 "..\\..\\include\\rtthread.h"
#line 1 "..\\..\\include\\rtservice.h"

























 










 

 



 






 
static __inline void rt_list_init(rt_list_t *l)
{
    l->next = l->prev = l;
}






 
static __inline void rt_list_insert_after(rt_list_t *l, rt_list_t *n)
{
    l->next->prev = n;
    n->next = l->next;

    l->next = n;
    n->prev = l;
}






 
static __inline void rt_list_insert_before(rt_list_t *l, rt_list_t *n)
{
    l->prev->next = n;
    n->prev = l->prev;

    l->prev = n;
    n->next = l;
}




 
static __inline void rt_list_remove(rt_list_t *n)
{
    n->next->prev = n->prev;
    n->prev->next = n->next;

    n->next = n->prev = n;
}




 
static __inline int rt_list_isempty(const rt_list_t *l)
{
    return l->next == l;
}






 








 












 


 





#line 39 "..\\..\\include\\rtthread.h"
#line 1 "..\\..\\include\\rtm.h"


















 




#line 25 "..\\..\\include\\rtm.h"
#line 1 "..\\..\\include\\rtthread.h"





























 

#line 26 "..\\..\\include\\rtm.h"

#line 56 "..\\..\\include\\rtm.h"

#line 40 "..\\..\\include\\rtthread.h"







 

 



 
void rt_system_object_init(void);
struct rt_object_information *
rt_object_get_information(enum rt_object_class_type type);
void rt_object_init(struct rt_object         *object,
                    enum rt_object_class_type type,
                    const char               *name);
void rt_object_detach(rt_object_t object);
rt_object_t rt_object_allocate(enum rt_object_class_type type,
                               const char               *name);
void rt_object_delete(rt_object_t object);
rt_bool_t rt_object_is_systemobject(rt_object_t object);
rt_object_t rt_object_find(const char *name, rt_uint8_t type);

#line 74 "..\\..\\include\\rtthread.h"

 



 

 



 
void rt_system_tick_init(void);
rt_tick_t rt_tick_get(void);
void rt_tick_set(rt_tick_t tick);
void rt_tick_increase(void);
rt_tick_t rt_tick_from_millisecond(rt_uint32_t ms);

void rt_system_timer_init(void);
void rt_system_timer_thread_init(void);

void rt_timer_init(rt_timer_t  timer,
                   const char *name,
                   void (*timeout)(void *parameter),
                   void       *parameter,
                   rt_tick_t   time,
                   rt_uint8_t  flag);
rt_err_t rt_timer_detach(rt_timer_t timer);
rt_timer_t rt_timer_create(const char *name,
                           void (*timeout)(void *parameter),
                           void       *parameter,
                           rt_tick_t   time,
                           rt_uint8_t  flag);
rt_err_t rt_timer_delete(rt_timer_t timer);
rt_err_t rt_timer_start(rt_timer_t timer);
rt_err_t rt_timer_stop(rt_timer_t timer);
rt_err_t rt_timer_control(rt_timer_t timer, rt_uint8_t cmd, void *arg);

rt_tick_t rt_timer_next_timeout_tick(void);
void rt_timer_check(void);





 



 

 



 
rt_err_t rt_thread_init(struct rt_thread *thread,
                        const char       *name,
                        void (*entry)(void *parameter),
                        void             *parameter,
                        void             *stack_start,
                        rt_uint32_t       stack_size,
                        rt_uint8_t        priority,
                        rt_uint32_t       tick);
rt_err_t rt_thread_detach(rt_thread_t thread);
rt_thread_t rt_thread_create(const char *name,
                             void (*entry)(void *parameter),
                             void       *parameter,
                             rt_uint32_t stack_size,
                             rt_uint8_t  priority,
                             rt_uint32_t tick);
rt_thread_t rt_thread_self(void);
rt_thread_t rt_thread_find(char *name);
rt_err_t rt_thread_startup(rt_thread_t thread);
rt_err_t rt_thread_delete(rt_thread_t thread);

rt_err_t rt_thread_yield(void);
rt_err_t rt_thread_delay(rt_tick_t tick);
rt_err_t rt_thread_control(rt_thread_t thread, rt_uint8_t cmd, void *arg);
rt_err_t rt_thread_suspend(rt_thread_t thread);
rt_err_t rt_thread_resume(rt_thread_t thread);
void rt_thread_timeout(void *parameter);









 
void rt_thread_idle_init(void);



void rt_thread_idle_excute(void);
rt_thread_t rt_thread_idle_gethandler(void);



 
void rt_system_scheduler_init(void);
void rt_system_scheduler_start(void);

void rt_schedule(void);
void rt_schedule_insert_thread(struct rt_thread *thread);
void rt_schedule_remove_thread(struct rt_thread *thread);

void rt_enter_critical(void);
void rt_exit_critical(void);
rt_uint16_t rt_critical_level(void);





 



 

 



 



 
rt_err_t rt_mp_init(struct rt_mempool *mp,
                    const char        *name,
                    void              *start,
                    rt_size_t          size,
                    rt_size_t          block_size);
rt_err_t rt_mp_detach(struct rt_mempool *mp);
rt_mp_t rt_mp_create(const char *name,
                     rt_size_t   block_count,
                     rt_size_t   block_size);
rt_err_t rt_mp_delete(rt_mp_t mp);

void *rt_mp_alloc(rt_mp_t mp, rt_int32_t time);
void rt_mp_free(void *block);











 
void rt_system_heap_init(void *begin_addr, void *end_addr);

void *rt_malloc(rt_size_t nbytes);
void rt_free(void *ptr);
void *rt_realloc(void *ptr, rt_size_t nbytes);
void *rt_calloc(rt_size_t count, rt_size_t size);
void *rt_malloc_align(rt_size_t size, rt_size_t align);
void rt_free_align(void *ptr);

void rt_memory_info(rt_uint32_t *total,
                    rt_uint32_t *used,
                    rt_uint32_t *max_used);













#line 269 "..\\..\\include\\rtthread.h"

 



 

 




 
rt_err_t rt_sem_init(rt_sem_t    sem,
                     const char *name,
                     rt_uint32_t value,
                     rt_uint8_t  flag);
rt_err_t rt_sem_detach(rt_sem_t sem);
rt_sem_t rt_sem_create(const char *name, rt_uint32_t value, rt_uint8_t flag);
rt_err_t rt_sem_delete(rt_sem_t sem);

rt_err_t rt_sem_take(rt_sem_t sem, rt_int32_t time);
rt_err_t rt_sem_trytake(rt_sem_t sem);
rt_err_t rt_sem_release(rt_sem_t sem);
rt_err_t rt_sem_control(rt_sem_t sem, rt_uint8_t cmd, void *arg);





 
rt_err_t rt_mutex_init(rt_mutex_t mutex, const char *name, rt_uint8_t flag);
rt_err_t rt_mutex_detach(rt_mutex_t mutex);
rt_mutex_t rt_mutex_create(const char *name, rt_uint8_t flag);
rt_err_t rt_mutex_delete(rt_mutex_t mutex);

rt_err_t rt_mutex_take(rt_mutex_t mutex, rt_int32_t time);
rt_err_t rt_mutex_release(rt_mutex_t mutex);
rt_err_t rt_mutex_control(rt_mutex_t mutex, rt_uint8_t cmd, void *arg);





 
rt_err_t rt_event_init(rt_event_t event, const char *name, rt_uint8_t flag);
rt_err_t rt_event_detach(rt_event_t event);
rt_event_t rt_event_create(const char *name, rt_uint8_t flag);
rt_err_t rt_event_delete(rt_event_t event);

rt_err_t rt_event_send(rt_event_t event, rt_uint32_t set);
rt_err_t rt_event_recv(rt_event_t   event,
                       rt_uint32_t  set,
                       rt_uint8_t   opt,
                       rt_int32_t   timeout,
                       rt_uint32_t *recved);
rt_err_t rt_event_control(rt_event_t event, rt_uint8_t cmd, void *arg);





 
rt_err_t rt_mb_init(rt_mailbox_t mb,
                    const char  *name,
                    void        *msgpool,
                    rt_size_t    size,
                    rt_uint8_t   flag);
rt_err_t rt_mb_detach(rt_mailbox_t mb);
rt_mailbox_t rt_mb_create(const char *name, rt_size_t size, rt_uint8_t flag);
rt_err_t rt_mb_delete(rt_mailbox_t mb);

rt_err_t rt_mb_send(rt_mailbox_t mb, rt_uint32_t value);
rt_err_t rt_mb_send_wait(rt_mailbox_t mb,
                         rt_uint32_t  value,
                         rt_int32_t   timeout);
rt_err_t rt_mb_recv(rt_mailbox_t mb, rt_uint32_t *value, rt_int32_t timeout);
rt_err_t rt_mb_control(rt_mailbox_t mb, rt_uint8_t cmd, void *arg);





 
rt_err_t rt_mq_init(rt_mq_t     mq,
                    const char *name,
                    void       *msgpool,
                    rt_size_t   msg_size,
                    rt_size_t   pool_size,
                    rt_uint8_t  flag);
rt_err_t rt_mq_detach(rt_mq_t mq);
rt_mq_t rt_mq_create(const char *name,
                     rt_size_t   msg_size,
                     rt_size_t   max_msgs,
                     rt_uint8_t  flag);
rt_err_t rt_mq_delete(rt_mq_t mq);

rt_err_t rt_mq_send(rt_mq_t mq, void *buffer, rt_size_t size);
rt_err_t rt_mq_urgent(rt_mq_t mq, void *buffer, rt_size_t size);
rt_err_t rt_mq_recv(rt_mq_t    mq,
                    void      *buffer,
                    rt_size_t  size,
                    rt_int32_t timeout);
rt_err_t rt_mq_control(rt_mq_t mq, rt_uint8_t cmd, void *arg);


 




 

 



 
rt_device_t rt_device_find(const char *name);

rt_err_t rt_device_register(rt_device_t dev,
                            const char *name,
                            rt_uint16_t flags);
rt_err_t rt_device_unregister(rt_device_t dev);
rt_err_t rt_device_init_all(void);

rt_err_t
rt_device_set_rx_indicate(rt_device_t dev,
                          rt_err_t (*rx_ind)(rt_device_t dev, rt_size_t size));
rt_err_t
rt_device_set_tx_complete(rt_device_t dev,
                          rt_err_t (*tx_done)(rt_device_t dev, void *buffer));

rt_err_t  rt_device_init (rt_device_t dev);
rt_err_t  rt_device_open (rt_device_t dev, rt_uint16_t oflag);
rt_err_t  rt_device_close(rt_device_t dev);
rt_size_t rt_device_read (rt_device_t dev,
                          rt_off_t    pos,
                          void       *buffer,
                          rt_size_t   size);
rt_size_t rt_device_write(rt_device_t dev,
                          rt_off_t    pos,
                          const void *buffer,
                          rt_size_t   size);
rt_err_t  rt_device_control(rt_device_t dev, rt_uint8_t cmd, void *arg);

 


#line 455 "..\\..\\include\\rtthread.h"



 



 
void rt_interrupt_enter(void);
void rt_interrupt_leave(void);



 
rt_uint8_t rt_interrupt_get_nest(void);







void rt_components_init(void);
void rt_components_board_init(void);




 

 



 




void rt_kprintf(const char *fmt, ...);
void rt_kputs(const char *str);

rt_int32_t rt_vsprintf(char *dest, const char *format, va_list arg_ptr);
rt_int32_t rt_vsnprintf(char *buf, rt_size_t size, const char *fmt, va_list args);
rt_int32_t rt_sprintf(char *buf ,const char *format, ...);
rt_int32_t rt_snprintf(char *buf, rt_size_t size, const char *format, ...);


rt_device_t rt_console_set_device(const char *name);
rt_device_t rt_console_get_device(void);


rt_err_t rt_get_errno(void);
void rt_set_errno(rt_err_t no);
int *_rt_errno(void);






void *rt_memset(void *src, int c, rt_ubase_t n);
void *rt_memcpy(void *dest, const void *src, rt_ubase_t n);

rt_int32_t rt_strncmp(const char *cs, const char *ct, rt_ubase_t count);
rt_int32_t rt_strcmp (const char *cs, const char *ct);
rt_size_t rt_strlen (const char *src);
char *rt_strdup(const char *s);

char *rt_strstr(const char *str1, const char *str2);
rt_int32_t rt_sscanf(const char *buf, const char *fmt, ...);
char *rt_strncpy(char *dest, const char *src, rt_ubase_t n);
void *rt_memmove(void *dest, const void *src, rt_ubase_t n);
rt_int32_t rt_memcmp(const void *cs, const void *ct, rt_ubase_t count);
rt_uint32_t rt_strcasecmp(const char *a, const char *b);

void rt_show_version(void);

#line 539 "..\\..\\include\\rtthread.h"

 





#line 31 "..\\..\\components\\drivers\\include\\drivers\\usb_device.h"
#line 1 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"























 








#line 34 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"




#line 57 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"

#line 70 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"

#line 77 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"



















#line 120 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"

#line 127 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"

#line 138 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"
































 
#line 184 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"









 
#line 206 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"



 




















typedef void (*func_callback)(void *context);
typedef enum
{
    USB_STATE_NOTATTACHED = 0,
    USB_STATE_ATTACHED,
    USB_STATE_POWERED,
    USB_STATE_RECONNECTING,
    USB_STATE_UNAUTHENTICATED,
    USB_STATE_DEFAULT,
    USB_STATE_ADDRESS,
    USB_STATE_CONFIGURED,
    USB_STATE_SUSPENDED
}udevice_state_t;

#pragma pack(1)

struct usb_descriptor
{
    rt_uint8_t bLength;
    rt_uint8_t type;
};
typedef struct usb_descriptor* udesc_t;

struct udevice_descriptor
{
    rt_uint8_t bLength;
    rt_uint8_t type;
    rt_uint16_t bcdUSB;
    rt_uint8_t bDeviceClass;
    rt_uint8_t bDeviceSubClass;
    rt_uint8_t bDeviceProtocol;
    rt_uint8_t bMaxPacketSize0;
    rt_uint16_t idVendor;
    rt_uint16_t idProduct;
    rt_uint16_t bcdDevice;
    rt_uint8_t iManufacturer;
    rt_uint8_t iProduct;
    rt_uint8_t iSerialNumber;
    rt_uint8_t bNumConfigurations;
};
typedef struct udevice_descriptor* udev_desc_t;

struct uconfig_descriptor
{
    rt_uint8_t bLength;
    rt_uint8_t type;
    rt_uint16_t wTotalLength;
    rt_uint8_t bNumInterfaces;
    rt_uint8_t bConfigurationValue;
    rt_uint8_t iConfiguration;
    rt_uint8_t bmAttributes;
    rt_uint8_t MaxPower;
    rt_uint8_t data[256];
};
typedef struct uconfig_descriptor* ucfg_desc_t;

struct uinterface_descriptor
{
    rt_uint8_t bLength;
    rt_uint8_t type;
    rt_uint8_t bInterfaceNumber;
    rt_uint8_t bAlternateSetting;
    rt_uint8_t bNumEndpoints;
    rt_uint8_t bInterfaceClass;
    rt_uint8_t bInterfaceSubClass;
    rt_uint8_t bInterfaceProtocol;
    rt_uint8_t iInterface;
};
typedef struct uinterface_descriptor* uintf_desc_t;

 
struct uiad_descriptor
{
    rt_uint8_t bLength;
    rt_uint8_t bDescriptorType;
    rt_uint8_t bFirstInterface;
    rt_uint8_t bInterfaceCount;
    rt_uint8_t bFunctionClass;
    rt_uint8_t bFunctionSubClass;
    rt_uint8_t bFunctionProtocol;
    rt_uint8_t iFunction;
};
typedef struct uiad_descriptor* uiad_desc_t;

struct uendpoint_descriptor
{
    rt_uint8_t bLength;
    rt_uint8_t type;
    rt_uint8_t bEndpointAddress;
    rt_uint8_t bmAttributes;
    rt_uint16_t wMaxPacketSize;
    rt_uint8_t bInterval;
};
typedef struct uendpoint_descriptor* uep_desc_t;

struct ustring_descriptor
{
    rt_uint8_t bLength;
    rt_uint8_t type;
    rt_uint8_t String[64];
};
typedef struct ustring_descriptor* ustr_desc_t;

struct uhub_descriptor
{
    rt_uint8_t length;
    rt_uint8_t type;
    rt_uint8_t num_ports;
    rt_uint16_t characteristics;
    rt_uint8_t pwron_to_good;         
    rt_uint8_t current;
    rt_uint8_t removable[8];
    rt_uint8_t pwr_ctl[8];
};
typedef struct uhub_descriptor* uhub_desc_t;

 
struct usb_qualifier_descriptor
{
    rt_uint8_t  bLength;
    rt_uint8_t  bDescriptorType;

    rt_uint16_t bcdUSB; 
    rt_uint8_t  bDeviceClass;
    rt_uint8_t  bDeviceSubClass;
    rt_uint8_t  bDeviceProtocol;
    rt_uint8_t  bMaxPacketSize0;
    rt_uint8_t  bNumConfigurations;
    rt_uint8_t  bRESERVED;
} __attribute__ ((packed));

struct uhid_descriptor
{
    rt_uint8_t bLength;
    rt_uint8_t type;
    rt_uint16_t bcdHID;
    rt_uint8_t bCountryCode;
    rt_uint8_t bNumDescriptors;
    struct hid_descriptor_list
    {
        rt_uint8_t type;
        rt_uint16_t wLength;
    }Descriptor[1];
};
typedef struct uhid_descriptor* uhid_desc_t;

struct urequest
{
    rt_uint8_t request_type;
    rt_uint8_t request;
    rt_uint16_t value;
    rt_uint16_t index;
    rt_uint16_t length;
};
typedef struct urequest* ureq_t;








 



#line 404 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"





#line 420 "..\\..\\components\\drivers\\include\\drivers\\usb_common.h"





struct ustorage_cbw
{
    rt_uint32_t signature;
    rt_uint32_t tag;
    rt_uint32_t xfer_len;
    rt_uint8_t dflags;
    rt_uint8_t lun;
    rt_uint8_t cb_len;
    rt_uint8_t cb[16];
};
typedef struct ustorage_cbw* ustorage_cbw_t;

struct ustorage_csw
{
    rt_uint32_t signature;
    rt_uint32_t tag;
    rt_int32_t data_reside;
    rt_uint8_t  status;
};
typedef struct ustorage_csw* ustorage_csw_t;

#pragma pack()



 
 




 









#line 32 "..\\..\\components\\drivers\\include\\drivers\\usb_device.h"


 





 






#line 70 "..\\..\\components\\drivers\\include\\drivers\\usb_device.h"

struct ufunction;
struct udevice;
struct uendpoint;

typedef enum 
{
     
    UIO_REQUEST_READ_FULL,
     
    UIO_REQUEST_READ_MOST,  
     
    UIO_REQUEST_WRITE,
}UIO_REQUEST_TYPE;

struct udcd_ops
{
    rt_err_t (*set_address)(rt_uint8_t address);
    rt_err_t (*set_config)(rt_uint8_t address);
    rt_err_t (*ep_set_stall)(rt_uint8_t address);
    rt_err_t (*ep_clear_stall)(rt_uint8_t address);
    rt_err_t (*ep_enable)(struct uendpoint* ep);
    rt_err_t (*ep_disable)(struct uendpoint* ep);
    rt_size_t (*ep_read_prepare)(rt_uint8_t address, void *buffer, rt_size_t size);
    rt_size_t (*ep_read)(rt_uint8_t address, void *buffer);
    rt_size_t (*ep_write)(rt_uint8_t address, void *buffer, rt_size_t size);
    rt_err_t (*ep0_send_status)(void);
    rt_err_t (*suspend)(void);
    rt_err_t (*wakeup)(void);    
};

struct ep_id
{
    rt_uint8_t addr;
    rt_uint8_t type;
    rt_uint8_t dir;
    rt_uint8_t maxpacket;
    rt_uint8_t status;
};

typedef rt_err_t (*udep_handler_t)(struct ufunction* func, rt_size_t size);

struct uio_request
{
    rt_list_t list;
    UIO_REQUEST_TYPE req_type;
    rt_uint8_t* buffer;
    rt_size_t size;
    rt_size_t remain_size;
};
typedef struct uio_request* uio_request_t;

struct uendpoint
{
    rt_list_t list;
    uep_desc_t ep_desc;
    rt_list_t request_list;
    struct uio_request request;
    rt_uint8_t* buffer;
    rt_bool_t stalled;
    struct ep_id* id;
    udep_handler_t handler;
    rt_err_t (*rx_indicate)(struct udevice* dev, rt_size_t size);
};
typedef struct uendpoint* uep_t;

struct udcd
{
    struct rt_device parent;
    const struct udcd_ops* ops;
    struct uendpoint ep0;
    struct ep_id* ep_pool;
};
typedef struct udcd* udcd_t;

struct ualtsetting
{
    rt_list_t list;
    uintf_desc_t intf_desc;
    void* desc;
    rt_size_t desc_size;
    rt_list_t ep_list;
};
typedef struct ualtsetting* ualtsetting_t;

typedef rt_err_t (*uintf_handler_t)(struct ufunction* func, ureq_t setup);

struct uinterface
{
    rt_list_t list;
    rt_uint8_t intf_num;
    ualtsetting_t curr_setting;
    rt_list_t setting_list;
    uintf_handler_t handler;
};
typedef struct uinterface* uintf_t;

struct ufunction_ops
{
    rt_err_t (*enable)(struct ufunction* func);
    rt_err_t (*disable)(struct ufunction* func);
    rt_err_t (*sof_handler)(struct ufunction* func);
};
typedef struct ufunction_ops* ufunction_ops_t;

struct ufunction
{
    rt_list_t list;
    ufunction_ops_t ops;
    struct udevice* device;
    udev_desc_t dev_desc;
    void* user_data;
    rt_bool_t enabled;

    rt_list_t intf_list;
};
typedef struct ufunction* ufunction_t;

struct uconfig
{
    rt_list_t list;
    struct uconfig_descriptor cfg_desc;
    rt_list_t func_list;
};
typedef struct uconfig* uconfig_t;

struct udevice
{
    rt_list_t list;
    struct udevice_descriptor dev_desc;

    struct usb_qualifier_descriptor * dev_qualifier;
    const char** str;

    udevice_state_t state;
    rt_list_t cfg_list;
    uconfig_t curr_cfg;
    rt_uint8_t nr_intf;

    udcd_t dcd;
};
typedef struct udevice* udevice_t;

enum udev_msg_type
{
    USB_MSG_SETUP_NOTIFY,
    USB_MSG_DATA_NOTIFY,
    USB_MSG_EP0_OUT,
    USB_MSG_EP_CLEAR_FEATURE,        
    USB_MSG_SOF,
    USB_MSG_RESET,
    USB_MSG_PLUG_IN,    
    


 
    USB_MSG_PLUG_OUT,
};
typedef enum udev_msg_type udev_msg_type;

struct ep_msg
{
    rt_size_t size;
    rt_uint8_t ep_addr;
};

struct udev_msg
{
    udev_msg_type type;
    udcd_t dcd;
    union
    {
        struct ep_msg ep_msg;
        struct urequest setup;
    } content;
};
typedef struct udev_msg* udev_msg_t;

udevice_t rt_usbd_device_new(void);
uconfig_t rt_usbd_config_new(void);
ufunction_t rt_usbd_function_new(udevice_t device, udev_desc_t dev_desc,
                              ufunction_ops_t ops);
uintf_t rt_usbd_interface_new(udevice_t device, uintf_handler_t handler);
uep_t rt_usbd_endpoint_new(uep_desc_t ep_desc, udep_handler_t handler);
ualtsetting_t rt_usbd_altsetting_new(rt_size_t desc_size);

rt_err_t rt_usbd_core_init(void);
rt_err_t rt_usb_device_init(void);
rt_err_t rt_usbd_event_signal(struct udev_msg* msg);
rt_err_t rt_usbd_device_set_controller(udevice_t device, udcd_t dcd);
rt_err_t rt_usbd_device_set_descriptor(udevice_t device, udev_desc_t dev_desc);
rt_err_t rt_usbd_device_set_string(udevice_t device, const char** ustring);
rt_err_t rt_usbd_device_set_qualifier(udevice_t device, struct usb_qualifier_descriptor* qualifier);
rt_err_t rt_usbd_device_add_config(udevice_t device, uconfig_t cfg);
rt_err_t rt_usbd_config_add_function(uconfig_t cfg, ufunction_t func);
rt_err_t rt_usbd_function_add_interface(ufunction_t func, uintf_t intf);
rt_err_t rt_usbd_interface_add_altsetting(uintf_t intf, ualtsetting_t setting);
rt_err_t rt_usbd_altsetting_add_endpoint(ualtsetting_t setting, uep_t ep);
rt_err_t rt_usbd_altsetting_config_descriptor(ualtsetting_t setting, const void* desc, rt_off_t intf_pos);
rt_err_t rt_usbd_set_config(udevice_t device, rt_uint8_t value);
rt_err_t rt_usbd_set_altsetting(uintf_t intf, rt_uint8_t value);

udevice_t rt_usbd_find_device(udcd_t dcd);
uconfig_t rt_usbd_find_config(udevice_t device, rt_uint8_t value);
uintf_t rt_usbd_find_interface(udevice_t device, rt_uint8_t value, ufunction_t *pfunc);
uep_t rt_usbd_find_endpoint(udevice_t device, ufunction_t* pfunc, rt_uint8_t ep_addr);
rt_size_t rt_usbd_io_request(udevice_t device, uep_t ep, uio_request_t req);
rt_size_t rt_usbd_ep0_write(udevice_t device, void *buffer, rt_size_t size);
rt_size_t rt_usbd_ep0_read(udevice_t device, void *buffer, rt_size_t size, 
    rt_err_t (*rx_ind)(udevice_t device, rt_size_t size));

ufunction_t rt_usbd_function_mstorage_create(udevice_t device);
ufunction_t rt_usbd_function_cdc_create(udevice_t device);
ufunction_t rt_usbd_function_rndis_create(udevice_t device);
ufunction_t rt_usbd_function_dap_create(udevice_t device);


rt_err_t rt_usbd_function_set_iad(ufunction_t func, uiad_desc_t iad_desc);


rt_err_t rt_usbd_set_feature(udevice_t device, rt_uint16_t value, rt_uint16_t index);
rt_err_t rt_usbd_clear_feature(udevice_t device, rt_uint16_t value, rt_uint16_t index);
rt_err_t rt_usbd_ep_set_stall(udevice_t device, uep_t ep);
rt_err_t rt_usbd_ep_clear_stall(udevice_t device, uep_t ep);
rt_err_t rt_usbd_ep0_set_stall(udevice_t device);
rt_err_t rt_usbd_ep0_clear_stall(udevice_t device);
rt_err_t rt_usbd_ep0_setup_handler(udcd_t dcd, struct urequest* setup);
rt_err_t rt_usbd_ep0_in_handler(udcd_t dcd);
rt_err_t rt_usbd_ep0_out_handler(udcd_t dcd, rt_size_t size);
rt_err_t rt_usbd_ep_in_handler(udcd_t dcd, rt_uint8_t address);
rt_err_t rt_usbd_ep_out_handler(udcd_t dcd, rt_uint8_t address, rt_size_t size);
rt_err_t rt_usbd_reset_handler(udcd_t dcd);
rt_err_t rt_usbd_connect_handler(udcd_t dcd);
rt_err_t rt_usbd_disconnect_handler(udcd_t dcd);
rt_err_t rt_usbd_sof_handler(udcd_t dcd);

static __inline rt_err_t dcd_set_address(udcd_t dcd, rt_uint8_t address)
{
    ;
    ;
    ;

    return dcd->ops->set_address(address);
}

static __inline rt_err_t dcd_set_config(udcd_t dcd, rt_uint8_t address)
{
    ;
    ;
    ;

    return dcd->ops->set_config(address);
}

static __inline rt_err_t dcd_ep_enable(udcd_t dcd, uep_t ep)
{
    ;
    ;
    ;

    return dcd->ops->ep_enable(ep);
}

static __inline rt_err_t dcd_ep_disable(udcd_t dcd, uep_t ep)
{
    ;
    ;
    ;

    return dcd->ops->ep_disable(ep);
}

static __inline rt_size_t dcd_ep_read_prepare(udcd_t dcd, rt_uint8_t address, void *buffer,
                               rt_size_t size)
{
    ;
    ;

    if(dcd->ops->ep_read_prepare != (0))
    {
        return dcd->ops->ep_read_prepare(address, buffer, size);
    }
    else
    {
        return 0;
    }
}

static __inline rt_size_t dcd_ep_read(udcd_t dcd, rt_uint8_t address, void *buffer)
{
    ;
    ;

    if(dcd->ops->ep_read != (0))
    {
        return dcd->ops->ep_read(address, buffer);
    }
    else
    {
        return 0;
    }
}

static __inline rt_size_t dcd_ep_write(udcd_t dcd, rt_uint8_t address, void *buffer,
                                 rt_size_t size)
{
    ;
    ;
    ;

    return dcd->ops->ep_write(address, buffer, size);
}

static __inline rt_err_t dcd_ep0_send_status(udcd_t dcd)
{
    ;
    ;
    ;

    return dcd->ops->ep0_send_status();
}

static __inline rt_err_t dcd_ep_set_stall(udcd_t dcd, rt_uint8_t address)
{    
    ;
    ;
    ;

    return dcd->ops->ep_set_stall(address);
}

static __inline rt_err_t dcd_ep_clear_stall(udcd_t dcd, rt_uint8_t address)
{
    ;
    ;
    ;

    return dcd->ops->ep_clear_stall(address);
}

#line 10 "Drivers\\usb.c"
#line 1 "..\\..\\components\\drivers\\include\\drivers\\usb_host.h"






















 








#line 33 "..\\..\\components\\drivers\\include\\drivers\\usb_host.h"
#line 34 "..\\..\\components\\drivers\\include\\drivers\\usb_host.h"














struct uhcd;
struct uintf;
struct uhub;

struct uclass_driver
{
    rt_list_t list;
    int class_code;
    int subclass_code;
    
    rt_err_t (*enable)(void* arg);
    rt_err_t (*disable)(void* arg);
    
    void* user_data;
};
typedef struct uclass_driver* ucd_t;

struct uprotocal
{
    rt_list_t list;
    int pro_id;
    
    rt_err_t (*init)(void* arg);
    rt_err_t (*callback)(void* arg);    
};
typedef struct uprotocal* uprotocal_t;

struct uinstance
{
    struct udevice_descriptor dev_desc;
    ucfg_desc_t cfg_desc;
    struct uhcd *hcd;

    rt_uint8_t status;
    rt_uint8_t type;
    rt_uint8_t index;
    rt_uint8_t address;    
    rt_uint8_t speed;
    rt_uint8_t max_packet_size;    
    rt_uint8_t port;

    struct uhub* parent;
    struct uintf* intf[0x08];        
};
typedef struct uinstance* uinst_t;

struct uintf
{
    struct uinstance* device;
    uintf_desc_t intf_desc;

    ucd_t drv;
    void *user_data;
};

struct upipe
{
    rt_uint32_t status;
    struct uendpoint_descriptor ep;
    struct uintf* intf;
    func_callback callback;
    void* user_data;
};
typedef struct upipe* upipe_t;

struct uhub
{
    struct uhub_descriptor hub_desc;
    rt_uint8_t num_ports;
    rt_uint32_t port_status[0x04];
    struct uinstance* child[0x04];        

    rt_bool_t is_roothub;
    upipe_t pipe_in;
    rt_uint8_t buffer[8];    
    struct uinstance* self;
    struct uhcd *hcd;
};    
typedef struct uhub* uhub_t;

struct uhcd_ops
{
    int (*ctl_xfer)(struct uinstance* inst, ureq_t setup, void* buffer, int nbytes, 
        int timeout);
    int (*bulk_xfer)(upipe_t pipe, void* buffer, int nbytes, int timeout);
    int (*int_xfer)(upipe_t pipe, void* buffer, int nbytes, int timeout);
    int (*iso_xfer)(upipe_t pipe, void* buffer, int nbytes, int timeout);
    
    rt_err_t (*alloc_pipe)(struct upipe** pipe, struct uintf* intf, uep_desc_t ep, 
        func_callback callback);
    rt_err_t (*free_pipe)(upipe_t pipe);    
    rt_err_t (*hub_ctrl)(rt_uint16_t port, rt_uint8_t cmd, void *args);    
};

struct uhcd
{
    struct rt_device parent;
    struct uhcd_ops* ops;
    struct uhub* roothub; 
};
typedef struct uhcd* uhcd_t;

enum uhost_msg_type
{
    USB_MSG_CONNECT_CHANGE,
    USB_MSG_CALLBACK,
};
typedef enum uhost_msg_type uhost_msg_type;

struct uhost_msg
{
    uhost_msg_type type; 
    union
    {
        struct uhub* hub;
        struct 
        {
            func_callback function;
            void *context;
        }cb;
    }content;
};
typedef struct uhost_msg* uhost_msg_t;

 
rt_err_t rt_usb_host_init(void);
void rt_usbh_hub_init(void);

 
struct uinstance* rt_usbh_alloc_instance(void);
rt_err_t rt_usbh_attatch_instance(struct uinstance* device);
rt_err_t rt_usbh_detach_instance(struct uinstance* device);
rt_err_t rt_usbh_get_descriptor(struct uinstance* device, rt_uint8_t type, void* buffer, 
    int nbytes);
rt_err_t rt_usbh_set_configure(struct uinstance* device, int config);
rt_err_t rt_usbh_set_address(struct uinstance* device);
rt_err_t rt_usbh_set_interface(struct uinstance* device, int intf);
rt_err_t rt_usbh_clear_feature(struct uinstance* device, int endpoint, int feature);
rt_err_t rt_usbh_get_interface_descriptor(ucfg_desc_t cfg_desc, int num, 
    uintf_desc_t* intf_desc);
rt_err_t rt_usbh_get_endpoint_descriptor(uintf_desc_t intf_desc, int num, 
    uep_desc_t* ep_desc);

 
rt_err_t rt_usbh_class_driver_init(void);
rt_err_t rt_usbh_class_driver_register(ucd_t drv);
rt_err_t rt_usbh_class_driver_unregister(ucd_t drv);
rt_err_t rt_usbh_class_driver_enable(ucd_t drv, void* args);
rt_err_t rt_usbh_class_driver_disable(ucd_t drv, void* args);
ucd_t rt_usbh_class_driver_find(int class_code, int subclass_code);

 
ucd_t rt_usbh_class_driver_hid(void);
ucd_t rt_usbh_class_driver_hub(void);
ucd_t rt_usbh_class_driver_storage(void);
ucd_t rt_usbh_class_driver_adk(void);

 
uprotocal_t rt_usbh_hid_protocal_kbd(void);
uprotocal_t rt_usbh_hid_protocal_mouse(void);

 
rt_err_t rt_usbh_adk_set_string(const char* manufacturer, const char* model,
    const char* description, const char* version, const char* uri, 
    const char* serial);

 
rt_err_t rt_usbh_hub_get_descriptor(struct uinstance* device, rt_uint8_t *buffer, 
    rt_size_t size);
rt_err_t rt_usbh_hub_get_status(struct uinstance* device, rt_uint8_t* buffer);
rt_err_t rt_usbh_hub_get_port_status(uhub_t uhub, rt_uint16_t port, 
    rt_uint8_t* buffer);
rt_err_t rt_usbh_hub_clear_port_feature(uhub_t uhub, rt_uint16_t port, 
    rt_uint16_t feature);
rt_err_t rt_usbh_hub_set_port_feature(uhub_t uhub, rt_uint16_t port, 
    rt_uint16_t feature);
rt_err_t rt_usbh_hub_reset_port(uhub_t uhub, rt_uint16_t port);
rt_err_t rt_usbh_event_signal(struct uhost_msg* msg);

 
static __inline rt_err_t rt_usb_hcd_alloc_pipe(uhcd_t hcd, upipe_t* pipe, 
    struct uintf* intf, uep_desc_t ep, func_callback callback)
{
    if(intf == (0)) return -8;

    return hcd->ops->alloc_pipe(pipe, intf, ep, callback);
}

static __inline rt_err_t rt_usb_hcd_free_pipe(uhcd_t hcd, upipe_t pipe)
{
    ;
    
    return hcd->ops->free_pipe(pipe);
}

static __inline int rt_usb_hcd_bulk_xfer(uhcd_t hcd, upipe_t pipe, void* buffer, 
    int nbytes, int timeout)
{
    if(pipe == (0)) return -1;
    if(pipe->intf == (0)) return -1;
    if(pipe->intf->device == (0)) return -1;    
    if(pipe->intf->device->status == 0x00) 
        return -1;

    return hcd->ops->bulk_xfer(pipe, buffer, nbytes, timeout);
}

static __inline int rt_usb_hcd_control_xfer(uhcd_t hcd, struct uinstance* device, ureq_t setup, 
    void* buffer, int nbytes, int timeout)
{
    if(device->status == 0x00) return -1;

    return hcd->ops->ctl_xfer(device, setup, buffer, nbytes, timeout);
}

static __inline int rt_usb_hcd_int_xfer(uhcd_t hcd, upipe_t pipe, void* buffer, 
    int nbytes, int timeout)
{    
    if(pipe == (0)) return -1;
    if(pipe->intf == (0)) return -1;
    if(pipe->intf->device == (0)) return -1;    
    if(pipe->intf->device->status == 0x00) 
        return -1;

    return hcd->ops->int_xfer(pipe, buffer, nbytes, timeout);
}

static __inline rt_err_t rt_usb_hcd_hub_control(uhcd_t hcd, rt_uint16_t port, 
    rt_uint8_t cmd, void *args)
{    
    return hcd->ops->hub_ctrl(port, cmd, args);
}







#line 11 "Drivers\\usb.c"


