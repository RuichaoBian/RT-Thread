#line 1 "..\\..\\src\\kservice.c"

































 

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

 





#line 37 "..\\..\\src\\kservice.c"
#line 1 "..\\..\\include\\rthw.h"

























 




#line 32 "..\\..\\include\\rthw.h"







 
void rt_hw_cpu_icache_enable(void);
void rt_hw_cpu_icache_disable(void);
rt_base_t rt_hw_cpu_icache_status(void);
void rt_hw_cpu_dcache_enable(void);
void rt_hw_cpu_dcache_disable(void);
rt_base_t rt_hw_cpu_dcache_status(void);
void rt_hw_cpu_reset(void);
void rt_hw_cpu_shutdown(void);

rt_uint8_t *rt_hw_stack_init(void       *entry,
                             void       *parameter,
                             rt_uint8_t *stack_addr,
                             void       *exit);



 
typedef void (*rt_isr_handler_t)(int vector, void *param);

struct rt_irq_desc
{
    rt_isr_handler_t handler;
    void            *param;





};



 
void rt_hw_interrupt_init(void);
void rt_hw_interrupt_mask(int vector);
void rt_hw_interrupt_umask(int vector);
rt_isr_handler_t rt_hw_interrupt_install(int              vector,
                                         rt_isr_handler_t handler,
                                         void            *param,
                                         char            *name);

rt_base_t rt_hw_interrupt_disable(void);
void rt_hw_interrupt_enable(rt_base_t level);



 
void rt_hw_context_switch(rt_uint32_t from, rt_uint32_t to);
void rt_hw_context_switch_to(rt_uint32_t to);
void rt_hw_context_switch_interrupt(rt_uint32_t from, rt_uint32_t to);

void rt_hw_console_output(const char *str);

void rt_hw_backtrace(rt_uint32_t *fp, rt_uint32_t thread_entry);
void rt_hw_show_memory(rt_uint32_t addr, rt_uint32_t size);



 
void rt_hw_exception_install(rt_err_t (*exception_handle)(void *context));





#line 38 "..\\..\\src\\kservice.c"

 




 

 

 
static volatile int _errno;


static rt_device_t _console_device = (0);






 
rt_err_t rt_get_errno(void)
{
    rt_thread_t tid;

    if (rt_interrupt_get_nest() != 0)
    {
         
        return _errno;
    }

    tid = rt_thread_self();
    if (tid == (0))
        return _errno;

    return tid->error;
}
;





 
void rt_set_errno(rt_err_t error)
{
    rt_thread_t tid;

    if (rt_interrupt_get_nest() != 0)
    {
         
        _errno = error;

        return;
    }

    tid = rt_thread_self();
    if (tid == (0))
    {
        _errno = error;

        return;
    }

    tid->error = error;
}
;





 
int *_rt_errno(void)
{
    rt_thread_t tid;

    if (rt_interrupt_get_nest() != 0)
        return (int *)&_errno;

    tid = rt_thread_self();
    if (tid != (0))
        return (int *)&(tid->error);

    return (int *)&_errno;
}
;









 
void *rt_memset(void *s, int c, rt_ubase_t count)
{
#line 149 "..\\..\\src\\kservice.c"

    int i;
    char *m = (char *)s;
    rt_uint32_t buffer;
    rt_uint32_t *aligned_addr;
    rt_uint32_t d = c & 0xff;

    if (!((count) < (sizeof(rt_int32_t))) && !((rt_int32_t)s & ((sizeof(rt_int32_t)) - 1)))
    {
         
        aligned_addr = (rt_uint32_t *)s;

        

 
        if ((sizeof(rt_int32_t)) == 4)
        {
            buffer = (d << 8) | d;
            buffer |= (buffer << 16);
        }
        else
        {
            buffer = 0;
            for (i = 0; i < (sizeof(rt_int32_t)); i ++)
                buffer = (buffer << 8) | d;
        }

        while (count >= (sizeof(rt_int32_t)) * 4)
        {
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            count -= 4 * (sizeof(rt_int32_t));
        }

        while (count >= (sizeof(rt_int32_t)))
        {
            *aligned_addr++ = buffer;
            count -= (sizeof(rt_int32_t));
        }

         
        m = (char *)aligned_addr;
    }

    while (count--)
    {
        *m++ = (char)d;
    }

    return s;





}
;










 
void *rt_memcpy(void *dst, const void *src, rt_ubase_t count)
{
#line 229 "..\\..\\src\\kservice.c"

#line 236 "..\\..\\src\\kservice.c"

    char *dst_ptr = (char *)dst;
    char *src_ptr = (char *)src;
    rt_int32_t *aligned_dst;
    rt_int32_t *aligned_src;
    int len = count;

    
 
    if (!((len) < (sizeof(rt_int32_t) << 2)) && !(((rt_int32_t)src_ptr & (sizeof(rt_int32_t) - 1)) | ((rt_int32_t)dst_ptr & (sizeof(rt_int32_t) - 1))))
    {
        aligned_dst = (rt_int32_t *)dst_ptr;
        aligned_src = (rt_int32_t *)src_ptr;

         
        while (len >= (sizeof(rt_int32_t) << 2))
        {
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            len -= (sizeof(rt_int32_t) << 2);
        }

         
        while (len >= (sizeof(rt_int32_t)))
        {
            *aligned_dst++ = *aligned_src++;
            len -= (sizeof(rt_int32_t));
        }

         
        dst_ptr = (char *)aligned_dst;
        src_ptr = (char *)aligned_src;
    }

    while (len--)
        *dst_ptr++ = *src_ptr++;

    return dst;





}
;










 
void *rt_memmove(void *dest, const void *src, rt_ubase_t n)
{
    char *tmp = (char *)dest, *s = (char *)src;

    if (s < tmp && tmp < s + n)
    {
        tmp += n;
        s += n;

        while (n--)
            *(--tmp) = *(--s);
    }
    else
    {
        while (n--)
            *tmp++ = *s++;
    }

    return dest;
}
;









 
rt_int32_t rt_memcmp(const void *cs, const void *ct, rt_ubase_t count)
{
    const unsigned char *su1, *su2;
    int res = 0;

    for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
        if ((res = *su1 - *su2) != 0)
            break;

    return res;
}
;








 
char *rt_strstr(const char *s1, const char *s2)
{
    int l1, l2;

    l2 = rt_strlen(s2);
    if (!l2)
        return (char *)s1;
    l1 = rt_strlen(s1);
    while (l1 >= l2)
    {
        l1 --;
        if (!rt_memcmp(s1, s2, l2))
            return (char *)s1;
        s1 ++;
    }

    return (0);
}
;








 
rt_uint32_t rt_strcasecmp(const char *a, const char *b)
{
    int ca, cb;

    do
    {
        ca = *a++ & 0xff;
        cb = *b++ & 0xff;
        if (ca >= 'A' && ca <= 'Z')
            ca += 'a' - 'A';
        if (cb >= 'A' && cb <= 'Z')
            cb += 'a' - 'A';
    }
    while (ca == cb && ca != '\0');

    return ca - cb;
}
;









 
char *rt_strncpy(char *dst, const char *src, rt_ubase_t n)
{
    if (n != 0)
    {
        char *d = dst;
        const char *s = src;

        do
        {
            if ((*d++ = *s++) == 0)
            {
                 
                while (--n != 0)
                    *d++ = 0;
                break;
            }
        } while (--n != 0);
    }

    return (dst);
}
;









 
rt_int32_t rt_strncmp(const char *cs, const char *ct, rt_ubase_t count)
{
    register signed char __res = 0;

    while (count)
    {
        if ((__res = *cs - *ct++) != 0 || !*cs++)
            break;
        count --;
    }

    return __res;
}
;








 
rt_int32_t rt_strcmp(const char *cs, const char *ct)
{
    while (*cs && *cs == *ct)
        cs++, ct++;

    return (*cs - *ct);
}
;










 
rt_size_t rt_strnlen(const char *s, rt_ubase_t maxlen)
{
    const char *sc;

    for (sc = s; *sc != '\0' && sc - s < maxlen; ++sc)  
        ;

    return sc - s;
}







 
rt_size_t rt_strlen(const char *s)
{
    const char *sc;

    for (sc = s; *sc != '\0'; ++sc)  
        ;

    return sc - s;
}
;








 
char *rt_strdup(const char *s)
{
    rt_size_t len = rt_strlen(s) + 1;
    char *tmp = (char *)rt_malloc(len);

    if (!tmp)
        return (0);

    rt_memcpy(tmp, s, len);

    return tmp;
}
;




 
void rt_show_version(void)
{
    rt_kprintf("\n \\ | /\n");
    rt_kprintf("- RT -     Thread Operating System\n");
    rt_kprintf(" / | \\     %d.%d.%d build %s\n",
               2L, 1L, 0L, "Aug 28 2017");
    rt_kprintf(" 2006 - 2017 Copyright by rt-thread team\n");
	 
}
;

 


static __inline rt_int32_t divide(rt_int32_t *n, rt_int32_t base)
{
    rt_int32_t res;

     
    if (base == 10)
    {
        res = ((rt_uint32_t)*n) % 10U;
        *n = ((rt_uint32_t)*n) / 10U;
    }
    else
    {
        res = ((rt_uint32_t)*n) % 16U;
        *n = ((rt_uint32_t)*n) / 16U;
    }

    return res;
}

static __inline int skip_atoi(const char **s)
{
    register int i=0;
    while (((unsigned)((* *s) - '0') < 10))
        i = i * 10 + *((*s)++) - '0';

    return i;
}

#line 579 "..\\..\\src\\kservice.c"


static char *print_number(char *buf,
                          char *end,
                          long  num,
                          int   base,
                          int   s,
                          int   precision,
                          int   type)
#line 596 "..\\..\\src\\kservice.c"
{
    char c, sign;



    char tmp[16];

    const char *digits;
    static const char small_digits[] = "0123456789abcdef";
    static const char large_digits[] = "0123456789ABCDEF";
    register int i;
    register int size;

    size = s;

    digits = (type & (1 << 6)) ? large_digits : small_digits;
    if (type & (1 << 4))
        type &= ~(1 << 0);

    c = (type & (1 << 0)) ? '0' : ' ';

     
    sign = 0;
    if (type & (1 << 1))
    {
        if (num < 0)
        {
            sign = '-';
            num = -num;
        }
        else if (type & (1 << 2))
            sign = '+';
        else if (type & (1 << 3))
            sign = ' ';
    }

#line 641 "..\\..\\src\\kservice.c"

    i = 0;
    if (num == 0)
        tmp[i++]='0';
    else
    {
        while (num != 0)
            tmp[i++] = digits[divide(&num, base)];
    }


    if (i > precision)
        precision = i;
    size -= precision;




    if (!(type&((1 << 0) | (1 << 4))))
    {
        if ((sign)&&(size>0))
            size--;

        while (size-->0)
        {
            if (buf <= end)
                *buf = ' ';
            ++ buf;
        }
    }

    if (sign)
    {
        if (buf <= end)
        {
            *buf = sign;
            -- size;
        }
        ++ buf;
    }

#line 704 "..\\..\\src\\kservice.c"

     
    if (!(type & (1 << 4)))
    {
        while (size-- > 0)
        {
            if (buf <= end)
                *buf = c;
            ++ buf;
        }
    }


    while (i < precision--)
    {
        if (buf <= end)
            *buf = '0';
        ++ buf;
    }


     
    while (i-- > 0)
    {
        if (buf <= end)
            *buf = tmp[i];
        ++ buf;
    }

    while (size-- > 0)
    {
        if (buf <= end)
            *buf = ' ';
        ++ buf;
    }

    return buf;
}

rt_int32_t rt_vsnprintf(char       *buf,
                        rt_size_t   size,
                        const char *fmt,
                        va_list     args)
{



    rt_uint32_t num;

    int i, len;
    char *str, *end, c;
    const char *s;

    rt_uint8_t base;             
    rt_uint8_t flags;            
    rt_uint8_t qualifier;        
    rt_int32_t field_width;      


    int precision;       


    str = buf;
    end = buf + size - 1;

     
    if (end < buf)
    {
        end  = ((char *)-1);
        size = end - buf;
    }

    for (; *fmt ; ++fmt)
    {
        if (*fmt != '%')
        {
            if (str <= end)
                *str = *fmt;
            ++ str;
            continue;
        }

         
        flags = 0;

        while (1)
        {
             
            ++ fmt;
            if (*fmt == '-') flags |= (1 << 4);
            else if (*fmt == '+') flags |= (1 << 2);
            else if (*fmt == ' ') flags |= (1 << 3);
            else if (*fmt == '#') flags |= (1 << 5);
            else if (*fmt == '0') flags |= (1 << 0);
            else break;
        }

         
        field_width = -1;
        if (((unsigned)((*fmt) - '0') < 10)) field_width = skip_atoi(&fmt);
        else if (*fmt == '*')
        {
            ++ fmt;
             
            field_width = __va_arg(args, int);
            if (field_width < 0)
            {
                field_width = -field_width;
                flags |= (1 << 4);
            }
        }


         
        precision = -1;
        if (*fmt == '.')
        {
            ++ fmt;
            if (((unsigned)((*fmt) - '0') < 10)) precision = skip_atoi(&fmt);
            else if (*fmt == '*')
            {
                ++ fmt;
                 
                precision = __va_arg(args, int);
            }
            if (precision < 0) precision = 0;
        }

         
        qualifier = 0;



        if (*fmt == 'h' || *fmt == 'l')

        {
            qualifier = *fmt;
            ++ fmt;
#line 849 "..\\..\\src\\kservice.c"
        }

         
        base = 10;

        switch (*fmt)
        {
        case 'c':
            if (!(flags & (1 << 4)))
            {
                while (--field_width > 0)
                {
                    if (str <= end) *str = ' ';
                    ++ str;
                }
            }

             
            c = (rt_uint8_t)__va_arg(args, int);
            if (str <= end) *str = c;
            ++ str;

             
            while (--field_width > 0)
            {
                if (str <= end) *str = ' ';
                ++ str;
            }
            continue;

        case 's':
            s = __va_arg(args, char *);
            if (!s) s = "(NULL)";

            len = rt_strlen(s);

            if (precision > 0 && len > precision) len = precision;


            if (!(flags & (1 << 4)))
            {
                while (len < field_width--)
                {
                    if (str <= end) *str = ' ';
                    ++ str;
                }
            }

            for (i = 0; i < len; ++i)
            {
                if (str <= end) *str = *s;
                ++ str;
                ++ s;
            }

            while (len < field_width--)
            {
                if (str <= end) *str = ' ';
                ++ str;
            }
            continue;

        case 'p':
            if (field_width == -1)
            {
                field_width = sizeof(void *) << 1;
                flags |= (1 << 0);
            }

            str = print_number(str, end,
                               (long)__va_arg(args, void *),
                               16, field_width, precision, flags);





            continue;

        case '%':
            if (str <= end) *str = '%';
            ++ str;
            continue;

             
        case 'o':
            base = 8;
            break;

        case 'X':
            flags |= (1 << 6);
        case 'x':
            base = 16;
            break;

        case 'd':
        case 'i':
            flags |= (1 << 1);
        case 'u':
            break;

        default:
            if (str <= end) *str = '%';
            ++ str;

            if (*fmt)
            {
                if (str <= end) *str = *fmt;
                ++ str;
            }
            else
            {
                -- fmt;
            }
            continue;
        }





        if (qualifier == 'l')

        {
            num = __va_arg(args, rt_uint32_t);
            if (flags & (1 << 1)) num = (rt_int32_t)num;
        }
        else if (qualifier == 'h')
        {
            num = (rt_uint16_t)__va_arg(args, rt_int32_t);
            if (flags & (1 << 1)) num = (rt_int16_t)num;
        }
        else
        {
            num = __va_arg(args, rt_uint32_t);
            if (flags & (1 << 1)) num = (rt_int32_t)num;
        }

        str = print_number(str, end, num, base, field_width, precision, flags);



    }

    if (str <= end) *str = '\0';
    else *end = '\0';

    

 
    return str - buf;
}
;







 
rt_int32_t rt_snprintf(char *buf, rt_size_t size, const char *fmt, ...)
{
    rt_int32_t n;
    va_list args;

    __va_start(args, fmt);
    n = rt_vsnprintf(buf, size, fmt, args);
    __va_end(args);

    return n;
}
;







 
rt_int32_t rt_vsprintf(char *buf, const char *format, va_list arg_ptr)
{
    return rt_vsnprintf(buf, (rt_size_t) -1, format, arg_ptr);
}
;






 
rt_int32_t rt_sprintf(char *buf, const char *format, ...)
{
    rt_int32_t n;
    va_list arg_ptr;

    __va_start(arg_ptr, format);
    n = rt_vsprintf(buf ,format, arg_ptr);
    __va_end(arg_ptr);

    return n;
}
;








 
rt_device_t rt_console_get_device(void)
{
    return _console_device;
}
;









 
rt_device_t rt_console_set_device(const char *name)
{
    rt_device_t new, old;

     
    old = _console_device;

     
    new = rt_device_find(name);
    if (new != (0))
    {
        if (_console_device != (0))
        {
             
            rt_device_close(_console_device);
        }

         
        rt_device_open(new, 0x003 | 0x040);
        _console_device = new;
    }

    return old;
}
;


__weak void rt_hw_console_output(const char *str)
{
     
}
;





 
void rt_kputs(const char *str)
{

    if (_console_device == (0))
    {
        rt_hw_console_output(str);
    }
    else
    {
        rt_uint16_t old_flag = _console_device->open_flag;

        _console_device->open_flag |= 0x040;
        rt_device_write(_console_device, 0, str, rt_strlen(str));
        _console_device->open_flag = old_flag;
    }



}





 
void rt_kprintf(const char *fmt, ...)
{
    va_list args;
    rt_size_t length;
    static char rt_log_buf[64];

    __va_start(args, fmt);
    



 
    length = rt_vsnprintf(rt_log_buf, sizeof(rt_log_buf) - 1, fmt, args);
    if (length > 64 - 1)
        length = 64 - 1;

    if (_console_device == (0))
    {
        rt_hw_console_output(rt_log_buf);
    }
    else
    {
        rt_uint16_t old_flag = _console_device->open_flag;

        _console_device->open_flag |= 0x040;
        rt_device_write(_console_device, 0, rt_log_buf, length);
        _console_device->open_flag = old_flag;
    }



    __va_end(args);
}
;











 
void* rt_malloc_align(rt_size_t size, rt_size_t align)
{
    void *align_ptr;
    void *ptr;
    rt_size_t align_size;

     
    align = ((align + 0x03) & ~0x03);

     
    align_size = ((size + 0x03) & ~0x03) + align;
     
    ptr = rt_malloc(align_size);
    if (ptr != (0))
    {
          
        if (((rt_uint32_t)ptr & (align - 1)) == 0)
        {
            align_ptr = (void *)((rt_uint32_t)ptr + align);
        }
        else
        {
            align_ptr = (void *)(((rt_uint32_t)ptr + (align - 1)) & ~(align - 1));
        }

         
        *((rt_uint32_t *)((rt_uint32_t)align_ptr - sizeof(void *))) = (rt_uint32_t)ptr;

        ptr = align_ptr;
    }

    return ptr;
}
;






 
void rt_free_align(void *ptr)
{
    void *real_ptr;

    real_ptr = (void *)*(rt_uint32_t *)((rt_uint32_t)ptr - sizeof(void *));
    rt_free(real_ptr);
}
;



const rt_uint8_t __lowest_bit_bitmap[] =
{
      0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
      4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0
};










 
rt_ubase_t __rt_ffs(rt_ubase_t value)
{
    if (value == 0) return 0;

    if (value & 0xff)
        return __lowest_bit_bitmap[value & 0xff] + 1;

    if (value & 0xff00)
        return __lowest_bit_bitmap[(value & 0xff00) >> 8] + 9;

    if (value & 0xff0000)
        return __lowest_bit_bitmap[(value & 0xff0000) >> 16] + 17;

    return __lowest_bit_bitmap[(value & 0xff000000) >> 24] + 25;
}


#line 1334 "..\\..\\src\\kservice.c"

#line 1356 "..\\..\\src\\kservice.c"

 
