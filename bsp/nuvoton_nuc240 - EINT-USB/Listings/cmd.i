#line 1 "..\\..\\components\\finsh\\cmd.c"














































 

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

 





#line 50 "..\\..\\components\\finsh\\cmd.c"
#line 1 "..\\..\\components\\finsh\\finsh.h"












 



#line 18 "..\\..\\components\\finsh\\finsh.h"






 
















#line 47 "..\\..\\components\\finsh\\finsh.h"

#line 56 "..\\..\\components\\finsh\\finsh.h"

 





typedef unsigned char  u_char;
typedef unsigned short u_short;
typedef unsigned long  u_long;

#line 85 "..\\..\\components\\finsh\\finsh.h"
 
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"
 
 
 
 





 






 








#line 35 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"






#line 49 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"

 
#line 59 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"

 
 









 
#line 81 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"





#line 133 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"

extern __declspec(__nothrow) __attribute__((const)) unsigned char **__rt_ctype_table(void);







    extern int (isalnum)(int  );

     





    extern int (isalpha)(int  );

     





    extern int (iscntrl)(int  );

     
     

 




    extern int (isdigit)(int  );

     

    extern int (isblank)(int  );
     
     
     





    extern int (isgraph)(int  );

     





    extern int (islower)(int  );

     





    extern int (isprint)(int  );

     
     





    extern int (ispunct)(int  );

     





    extern int (isspace)(int  );

     





    extern int (isupper)(int  );

     

 
 

__inline int __isxdigit_helper(int __t) { return (__t ^ (__t << 2)); }




    extern int (isxdigit)(int  );

     



extern int tolower(int  );
     
     

extern int toupper(int  );
     
     







#line 272 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"



 

#line 87 "..\\..\\components\\finsh\\finsh.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
 
 
 




 
 



 






   














  


 








#line 54 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


  



    typedef unsigned int size_t;    
#line 70 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"






    



    typedef unsigned short wchar_t;  
#line 91 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { long long quot, rem; } lldiv_t;
    


#line 112 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   



 

   




 
#line 131 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) long long atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) long long strtoll(const char * __restrict  ,
                                  char ** __restrict  , int  )
                          __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned long long strtoull(const char * __restrict  ,
                                            char ** __restrict  , int  )
                                   __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 436 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 524 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 553 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __attribute__((const)) int abs(int  );
   



 

extern __declspec(__nothrow) __attribute__((const)) div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __attribute__((const)) long int labs(long int  );
   



 




extern __declspec(__nothrow) __attribute__((const)) ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __attribute__((const)) long long llabs(long long  );
   



 




extern __declspec(__nothrow) __attribute__((const)) lldiv_t lldiv(long long  , long long  );
   











 
#line 634 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"




 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 




 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 892 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"





 
#line 88 "..\\..\\components\\finsh\\finsh.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"


  



    typedef unsigned int size_t;    
#line 54 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"




extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 193 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 209 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 232 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 247 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 270 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 502 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"



 

#line 89 "..\\..\\components\\finsh\\finsh.h"








 
 
#line 114 "..\\..\\components\\finsh\\finsh.h"
 

typedef long (*syscall_func)();

 
struct finsh_syscall
{
	const char*		name;		 

	const char*		desc;		 

	syscall_func func;		 
};

 
struct finsh_syscall_item
{
	struct finsh_syscall_item* next;	 
	struct finsh_syscall syscall;		 
};
extern struct finsh_syscall *_syscall_table_begin, *_syscall_table_end;
extern struct finsh_syscall_item *global_syscall_list;

 
struct finsh_syscall* finsh_syscall_lookup(const char* name);

 
struct finsh_sysvar
{
	const char*		name;		 

	const char* 	desc;		 

	u_char		 type;		 
	void*		 var ;		 
};

#line 160 "..\\..\\components\\finsh\\finsh.h"

 
struct finsh_sysvar_item
{
	struct finsh_sysvar_item *next;		 
	struct finsh_sysvar sysvar;			 
};
extern struct finsh_sysvar *_sysvar_table_begin, *_sysvar_table_end;
extern struct finsh_sysvar_item* global_sysvar_list;

 
struct finsh_sysvar* finsh_sysvar_lookup(const char* name);








#line 240 "..\\..\\components\\finsh\\finsh.h"

#line 251 "..\\..\\components\\finsh\\finsh.h"

#line 315 "..\\..\\components\\finsh\\finsh.h"








 











 










 
#line 356 "..\\..\\components\\finsh\\finsh.h"

struct finsh_token
{
	char eof;
	char replay;

	int  position;
	u_char current_token;

	union {
		char char_value;
		int int_value;
		long long_value;
	} value;
	u_char string[128];

	u_char* line;
};





struct finsh_node
{
	u_char node_type;	 
	u_char data_type;	 
	u_char idtype;		 

	union {			 
		char 	char_value;
		short 	short_value;
		int 	int_value;
		long 	long_value;
		void* 	ptr;
	} value;
	union
	{
		 
		struct finsh_var	*var;
		struct finsh_sysvar	*sysvar;
		struct finsh_syscall*syscall;
	}id;

	 
	struct finsh_node *sibling, *child;
};

struct finsh_parser
{
	u_char* parser_string;

    struct finsh_token token;
	struct finsh_node* root;
};





 
enum finsh_type {
	finsh_type_unknown = 0,  
	finsh_type_void,		 
	finsh_type_voidp,		 
	finsh_type_char,		 
	finsh_type_uchar,		 
	finsh_type_charp,		 
	finsh_type_short,		 
	finsh_type_ushort,		 
	finsh_type_shortp,		 
	finsh_type_int,			 
	finsh_type_uint,		 
	finsh_type_intp,		 
	finsh_type_long,		 
	finsh_type_ulong,		 
	finsh_type_longp		 
};

 
int finsh_init(struct finsh_parser* parser);
 
int finsh_flush(struct finsh_parser* parser);
 
int finsh_reset(struct finsh_parser* parser);

void finsh_set_device(const char* device_name);


 
void finsh_parser_run (struct finsh_parser* parser, const unsigned char* string);
 
int finsh_compiler_run(struct finsh_node* node);
 
void finsh_vm_run(void);

 
struct finsh_var* finsh_var_lookup(const char* name);
 
long finsh_stack_bottom(void);

 
u_char finsh_errno(void);
 
const char* finsh_error_string(u_char type);








 
void finsh_syscall_append(const char* name, syscall_func func);








 
void finsh_sysvar_append(const char* name, u_char type, void* addr);
#line 51 "..\\..\\components\\finsh\\cmd.c"

static __inline unsigned int rt_list_len(const rt_list_t *l)
{
    unsigned int len = 0;
    const rt_list_t *p = l;
    while (p->next != l)
    {
        p = p->next;
        len ++;
    }

    return len;
}

long hello(void)
{
    rt_kprintf("Hello RT-Thread!\n");

    return 0;
}
const char __fsym_hello_name[] __attribute__((section(".rodata.name"))) = "hello"; const char __fsym_hello_desc[] __attribute__((section(".rodata.name"))) = "say hello world"; const struct finsh_syscall __fsym_hello __attribute__((section("FSymTab")))= { __fsym_hello_name, __fsym_hello_desc, (syscall_func)&hello };;

extern void rt_show_version(void);
long version(void)
{
    rt_show_version();

    return 0;
}
const char __fsym_version_name[] __attribute__((section(".rodata.name"))) = "version"; const char __fsym_version_desc[] __attribute__((section(".rodata.name"))) = "show RT-Thread version information"; const struct finsh_syscall __fsym_version __attribute__((section("FSymTab")))= { __fsym_version_name, __fsym_version_desc, (syscall_func)&version };;
;

extern struct rt_object_information rt_object_container[];

static int object_name_maxlen(struct rt_list_node *list)
{
    struct rt_list_node *node;
    struct rt_object *object = 0;
    int max_length = 0, length;

    rt_enter_critical();
    for (node = list->next; node != list; node = node->next)
    {
        object = ((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list)));

        length = rt_strlen(object->name);
        if (length > max_length) max_length = length;
    }
    rt_exit_critical();

    if (max_length > 8 || max_length == 0) max_length = 8;

    return max_length;
}

static __inline void object_split(int len)
{
    while (len--) rt_kprintf("-");
}

static long _list_thread(struct rt_list_node *list)
{
    int maxlen;
    rt_uint8_t *ptr;
    struct rt_thread *thread;
    struct rt_list_node *node;

    maxlen = object_name_maxlen(list);

    rt_kprintf("%-*.s pri  status      sp     stack size max used left tick  error\n", maxlen, "thread"); object_split(maxlen);
    rt_kprintf(     " ---  ------- ---------- ----------  ------  ---------- ---\n");
    for (node = list->next; node != list; node = node->next)
    {
        thread = ((struct rt_thread *)((char *)(node) - (unsigned long)(&((struct rt_thread *)0)->list)));
        rt_kprintf("%-*.*s %3d ", maxlen, 8, thread->name, thread->current_priority);

        if (thread->stat == 0x01)        rt_kprintf(" ready  ");
        else if (thread->stat == 0x02) rt_kprintf(" suspend");
        else if (thread->stat == 0x00)    rt_kprintf(" init   ");
        else if (thread->stat == 0x04)   rt_kprintf(" close  ");

        ptr = (rt_uint8_t *)thread->stack_addr;
        while (*ptr == '#')ptr ++;

        rt_kprintf(" 0x%08x 0x%08x    %02d%%   0x%08x %03d\n",
                   thread->stack_size + ((rt_uint32_t)thread->stack_addr - (rt_uint32_t)thread->sp),
                   thread->stack_size,
                   (thread->stack_size - ((rt_uint32_t) ptr - (rt_uint32_t) thread->stack_addr)) * 100
                        / thread->stack_size,
                   thread->remaining_tick,
                   thread->error);
    }

    return 0;
}

long list_thread(void)
{
    return _list_thread(&rt_object_container[RT_Object_Class_Thread].object_list);
}
const char __fsym_list_thread_name[] __attribute__((section(".rodata.name"))) = "list_thread"; const char __fsym_list_thread_desc[] __attribute__((section(".rodata.name"))) = "list thread"; const struct finsh_syscall __fsym_list_thread __attribute__((section("FSymTab")))= { __fsym_list_thread_name, __fsym_list_thread_desc, (syscall_func)&list_thread };;
;

static void show_wait_queue(struct rt_list_node *list)
{
    struct rt_thread *thread;
    struct rt_list_node *node;

    for (node = list->next; node != list; node = node->next)
    {
        thread = ((struct rt_thread *)((char *)(node) - (unsigned long)(&((struct rt_thread *)0)->tlist)));
        rt_kprintf("%s", thread->name);

        if (node->next != list)
            rt_kprintf("/");
    }
}


static long _list_sem(struct rt_list_node *list)
{
    int maxlen;
    struct rt_semaphore *sem;
    struct rt_list_node *node;

    maxlen = object_name_maxlen(list);
    if (maxlen < 9) maxlen = 9;

    rt_kprintf("%-*.s v   suspend thread\n", maxlen, "semaphore"); object_split(maxlen);
    rt_kprintf(     " --- --------------\n");
    for (node = list->next; node != list; node = node->next)
    {
        sem = (struct rt_semaphore *)(((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list))));
        if (!rt_list_isempty(&sem->parent.suspend_thread))
        {
            rt_kprintf("%-*.*s %03d %d:",
                       maxlen, 8,
                       sem->parent.parent.name,
                       sem->value,
                       rt_list_len(&sem->parent.suspend_thread));
            show_wait_queue(&(sem->parent.suspend_thread));
            rt_kprintf("\n");
        }
        else
        {
            rt_kprintf("%-*.*s %03d %d\n",
                       maxlen, 8,
                       sem->parent.parent.name,
                       sem->value,
                       rt_list_len(&sem->parent.suspend_thread));
        }
    }

    return 0;
}

long list_sem(void)
{
    return _list_sem(&rt_object_container[RT_Object_Class_Semaphore].object_list);
}
const char __fsym_list_sem_name[] __attribute__((section(".rodata.name"))) = "list_sem"; const char __fsym_list_sem_desc[] __attribute__((section(".rodata.name"))) = "list semaphone in system"; const struct finsh_syscall __fsym_list_sem __attribute__((section("FSymTab")))= { __fsym_list_sem_name, __fsym_list_sem_desc, (syscall_func)&list_sem };;
;



static long _list_event(struct rt_list_node *list)
{
    int maxlen;
    struct rt_event *e;
    struct rt_list_node *node;

    maxlen = object_name_maxlen(list);

    rt_kprintf("%-*.s      set    suspend thread\n", maxlen, "event"); object_split(maxlen);
    rt_kprintf(     "  ---------- --------------\n");
    for (node = list->next; node != list; node = node->next)
    {
        e = (struct rt_event *)(((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list))));
        if (!rt_list_isempty(&e->parent.suspend_thread))
        {
            rt_kprintf("%-*.*s  0x%08x %03d:",
                       maxlen, 8,
                       e->parent.parent.name,
                       e->set,
                       rt_list_len(&e->parent.suspend_thread));
            show_wait_queue(&(e->parent.suspend_thread));
            rt_kprintf("\n");
        }
        else
        {
            rt_kprintf("%-*.*s  0x%08x 0\n",
                       maxlen, 8, e->parent.parent.name, e->set);
        }
    }

    return 0;
}

long list_event(void)
{
    return _list_event(&rt_object_container[RT_Object_Class_Event].object_list);
}
const char __fsym_list_event_name[] __attribute__((section(".rodata.name"))) = "list_event"; const char __fsym_list_event_desc[] __attribute__((section(".rodata.name"))) = "list event in system"; const struct finsh_syscall __fsym_list_event __attribute__((section("FSymTab")))= { __fsym_list_event_name, __fsym_list_event_desc, (syscall_func)&list_event };;
;



static long _list_mutex(struct rt_list_node *list)
{
    int maxlen;
    struct rt_mutex *m;
    struct rt_list_node *node;

    maxlen = object_name_maxlen(list);
    rt_kprintf("%-*.s   owner  hold suspend thread\n", maxlen, "mutex"); object_split(maxlen);
    rt_kprintf(     " -------- ---- --------------\n");
    for (node = list->next; node != list; node = node->next)
    {
        m = (struct rt_mutex *)(((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list))));
        rt_kprintf("%-*.*s %-8.*s %04d %d\n",
                   maxlen, 8,
                   m->parent.parent.name,
                   8,
                   m->owner->name,
                   m->hold,
                   rt_list_len(&m->parent.suspend_thread));
    }

    return 0;
}

long list_mutex(void)
{
    return _list_mutex(&rt_object_container[RT_Object_Class_Mutex].object_list);
}
const char __fsym_list_mutex_name[] __attribute__((section(".rodata.name"))) = "list_mutex"; const char __fsym_list_mutex_desc[] __attribute__((section(".rodata.name"))) = "list mutex in system"; const struct finsh_syscall __fsym_list_mutex __attribute__((section("FSymTab")))= { __fsym_list_mutex_name, __fsym_list_mutex_desc, (syscall_func)&list_mutex };;
;



static long _list_mailbox(struct rt_list_node *list)
{
    int maxlen;
    struct rt_mailbox *m;
    struct rt_list_node *node;
    int item_title_len;
    const char *item_title = "mailbox";

    item_title_len = rt_strlen(item_title);
    maxlen = object_name_maxlen(list);
    if(maxlen < item_title_len) maxlen = item_title_len;

    rt_kprintf("%-*.s entry size suspend thread\n", maxlen, item_title); object_split(maxlen);
    rt_kprintf(     " ----  ---- --------------\n");
    for (node = list->next; node != list; node = node->next)
    {
        m = (struct rt_mailbox *)(((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list))));
        if (!rt_list_isempty(&m->parent.suspend_thread))
        {
            rt_kprintf("%-*.*s %04d  %04d %d:",
                       maxlen, 8,
                       m->parent.parent.name,
                       m->entry,
                       m->size,
                       rt_list_len(&m->parent.suspend_thread));
            show_wait_queue(&(m->parent.suspend_thread));
            rt_kprintf("\n");
        }
        else
        {
            rt_kprintf("%-*.*s %04d  %04d %d\n",
                       maxlen, 8,
                       m->parent.parent.name,
                       m->entry,
                       m->size,
                       rt_list_len(&m->parent.suspend_thread));
        }
    }

    return 0;
}

long list_mailbox(void)
{
    return _list_mailbox(&rt_object_container[RT_Object_Class_MailBox].object_list);
}
const char __fsym_list_mailbox_name[] __attribute__((section(".rodata.name"))) = "list_mailbox"; const char __fsym_list_mailbox_desc[] __attribute__((section(".rodata.name"))) = "list mail box in system"; const struct finsh_syscall __fsym_list_mailbox __attribute__((section("FSymTab")))= { __fsym_list_mailbox_name, __fsym_list_mailbox_desc, (syscall_func)&list_mailbox };;
;



static long _list_msgqueue(struct rt_list_node *list)
{
    int maxlen;
    struct rt_messagequeue *m;
    struct rt_list_node *node;
    int item_title_len;
    const char *item_title = "msgqueue";

    item_title_len = rt_strlen(item_title);
    maxlen = object_name_maxlen(list);
    if(maxlen < item_title_len) maxlen = item_title_len;

    rt_kprintf("%-*.s entry suspend thread\n", maxlen, item_title); object_split(maxlen);
    rt_kprintf(     " ----  --------------\n");
    for (node = list->next; node != list; node = node->next)
    {
        m = (struct rt_messagequeue *)(((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list))));
        if (!rt_list_isempty(&m->parent.suspend_thread))
        {
            rt_kprintf("%-*.*s %04d  %d:",
                       maxlen, 8,
                       m->parent.parent.name,
                       m->entry,
                       rt_list_len(&m->parent.suspend_thread));
            show_wait_queue(&(m->parent.suspend_thread));
            rt_kprintf("\n");
        }
        else
        {
            rt_kprintf("%-*.*s %04d  %d\n",
                       maxlen, 8,
                       m->parent.parent.name,
                       m->entry,
                       rt_list_len(&m->parent.suspend_thread));
        }
    }

    return 0;
}

long list_msgqueue(void)
{
    return _list_msgqueue(&rt_object_container[RT_Object_Class_MessageQueue].object_list);
}
const char __fsym_list_msgqueue_name[] __attribute__((section(".rodata.name"))) = "list_msgqueue"; const char __fsym_list_msgqueue_desc[] __attribute__((section(".rodata.name"))) = "list message queue in system"; const struct finsh_syscall __fsym_list_msgqueue __attribute__((section("FSymTab")))= { __fsym_list_msgqueue_name, __fsym_list_msgqueue_desc, (syscall_func)&list_msgqueue };;
;


#line 423 "..\\..\\components\\finsh\\cmd.c"


static long _list_mempool(struct rt_list_node *list)
{
    int maxlen;
    struct rt_mempool *mp;
    struct rt_list_node *node;

    maxlen = object_name_maxlen(list);

    rt_kprintf("%-*.s block total free suspend thread\n", maxlen, "mempool"); object_split(maxlen);
    rt_kprintf(     " ----  ----  ---- --------------\n");
    for (node = list->next; node != list; node = node->next)
    {
        mp = (struct rt_mempool *)((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list)));
        if (mp->suspend_thread_count > 0)
        {
            rt_kprintf("%-*.*s %04d  %04d  %04d %d:",
                       maxlen, 8,
                       mp->parent.name,
                       mp->block_size,
                       mp->block_total_count,
                       mp->block_free_count,
                       mp->suspend_thread_count);
            show_wait_queue(&(mp->suspend_thread));
            rt_kprintf("\n");
        }
        else
        {
            rt_kprintf("%-*.*s %04d  %04d  %04d %d\n",
                       maxlen, 8,
                       mp->parent.name,
                       mp->block_size,
                       mp->block_total_count,
                       mp->block_free_count,
                       mp->suspend_thread_count);
        }
    }

    return 0;
}

long list_mempool(void)
{
    return _list_mempool(&rt_object_container[RT_Object_Class_MemPool].object_list);
}
const char __fsym_list_mempool_name[] __attribute__((section(".rodata.name"))) = "list_mempool"; const char __fsym_list_mempool_desc[] __attribute__((section(".rodata.name"))) = "list memory pool in system"; const struct finsh_syscall __fsym_list_mempool __attribute__((section("FSymTab")))= { __fsym_list_mempool_name, __fsym_list_mempool_desc, (syscall_func)&list_mempool };
;


static long _list_timer(struct rt_list_node *list)
{
    int maxlen;
    struct rt_timer *timer;
    struct rt_list_node *node;

    maxlen = object_name_maxlen(list);

    rt_kprintf("%-*.s  periodic   timeout       flag\n", maxlen, "timer"); object_split(maxlen);
    rt_kprintf(     " ---------- ---------- -----------\n");
    for (node = list->next; node != list; node = node->next)
    {
        timer = (struct rt_timer *)(((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list))));
        rt_kprintf("%-*.*s 0x%08x 0x%08x ",
                   maxlen, 8,
                   timer->parent.name,
                   timer->init_tick,
                   timer->timeout_tick);
        if (timer->parent.flag & 0x1)
            rt_kprintf("activated\n");
        else
            rt_kprintf("deactivated\n");
    }

    rt_kprintf("current tick:0x%08x\n", rt_tick_get());

    return 0;
}

long list_timer(void)
{
    return _list_timer(&rt_object_container[RT_Object_Class_Timer].object_list);
}
const char __fsym_list_timer_name[] __attribute__((section(".rodata.name"))) = "list_timer"; const char __fsym_list_timer_desc[] __attribute__((section(".rodata.name"))) = "list timer in system"; const struct finsh_syscall __fsym_list_timer __attribute__((section("FSymTab")))= { __fsym_list_timer_name, __fsym_list_timer_desc, (syscall_func)&list_timer };;
;


static long _list_device(struct rt_list_node *list)
{
    int maxlen;
    struct rt_device *device;
    struct rt_list_node *node;
    char *const device_type_str[] =
    {
        "Character Device",
        "Block Device",
        "Network Interface",
        "MTD Device",
        "CAN Device",
        "RTC",
        "Sound Device",
        "Graphic Device",
        "I2C Bus",
        "USB Slave Device",
        "USB Host Bus",
        "SPI Bus",
        "SPI Device",
        "SDIO Bus",
        "PM Pseudo Device",
        "Pipe",
        "Portal Device",
        "Timer Device",
        "Miscellaneous Device",
        "Unknown"
    };
    int item_title_len;
    const char *item_title = "device";

    item_title_len = rt_strlen(item_title);
    maxlen = object_name_maxlen(list);
    if(maxlen < item_title_len) maxlen = item_title_len;

    rt_kprintf("%-*.s         type         ref count\n", maxlen, item_title); object_split(maxlen);
    rt_kprintf(     " -------------------- ----------\n");
    for (node = list->next; node != list; node = node->next)
    {
        device = (struct rt_device *)(((struct rt_object *)((char *)(node) - (unsigned long)(&((struct rt_object *)0)->list))));
        rt_kprintf("%-*.*s %-20s %-8d\n",
                   maxlen, 8,
                   device->parent.name,
                   (device->type <= RT_Device_Class_Unknown) ?
                   device_type_str[device->type] :
                   device_type_str[RT_Device_Class_Unknown],
                   device->ref_count);
    }

    return 0;
}

long list_device(void)
{
    return _list_device(&rt_object_container[RT_Object_Class_Device].object_list);
}
const char __fsym_list_device_name[] __attribute__((section(".rodata.name"))) = "list_device"; const char __fsym_list_device_desc[] __attribute__((section(".rodata.name"))) = "list device in system"; const struct finsh_syscall __fsym_list_device __attribute__((section("FSymTab")))= { __fsym_list_device_name, __fsym_list_device_desc, (syscall_func)&list_device };;
;


#line 702 "..\\..\\components\\finsh\\cmd.c"

long list(void)
{

    struct finsh_syscall_item *syscall_item;
    struct finsh_sysvar_item *sysvar_item;


    rt_kprintf("--Function List:\n");
    {
        struct finsh_syscall *index;
        for (index = _syscall_table_begin;
                index < _syscall_table_end;
                index++)
        {
             
            if (strncmp((char *)index->name, "__", 2) == 0) continue;


            rt_kprintf("%-16s -- %s\n", index->name, index->desc);



        }
    }


     
    syscall_item = global_syscall_list;
    while (syscall_item != 0)
    {
        rt_kprintf("[l] %s\n", syscall_item->syscall.name);
        syscall_item = syscall_item->next;
    }

    rt_kprintf("--Variable List:\n");
    {
        struct finsh_sysvar *index;
        for (index = _sysvar_table_begin;
                index < _sysvar_table_end;
                index++)
        {

            rt_kprintf("%-16s -- %s\n", index->name, index->desc);



        }
    }

    sysvar_item = global_sysvar_list;
    while (sysvar_item != 0)
    {
        rt_kprintf("[l] %s\n", sysvar_item->sysvar.name);
        sysvar_item = sysvar_item->next;
    }


    return 0;
}
const char __fsym_list_name[] __attribute__((section(".rodata.name"))) = "list"; const char __fsym_list_desc[] __attribute__((section(".rodata.name"))) = "list all symbol in system"; const struct finsh_syscall __fsym_list __attribute__((section("FSymTab")))= { __fsym_list_name, __fsym_list_desc, (syscall_func)&list };


static int str_is_prefix(const char *prefix, const char *str)
{
    while ((*prefix) && (*prefix == *str))
    {
        prefix ++;
        str ++;
    }

    if (*prefix == 0)
        return 0;

    return -1;
}

static int str_common(const char *str1, const char *str2)
{
    const char *str = str1;

    while ((*str != 0) && (*str2 != 0) && (*str == *str2))
    {
        str ++;
        str2 ++;
    }

    return (str - str1);
}

void list_prefix(char *prefix)
{
    struct finsh_syscall_item *syscall_item;
    struct finsh_sysvar_item *sysvar_item;
    rt_uint16_t func_cnt, var_cnt;
    int length, min_length;
    const char *name_ptr;

    func_cnt = 0;
    var_cnt  = 0;
    min_length = 0;
    name_ptr = (0);

     
    {
        struct finsh_syscall *index;
        for (index = _syscall_table_begin;
                index < _syscall_table_end;
                index++)
        {
             
            if (str_is_prefix("__", index->name) == 0) continue;

            if (str_is_prefix(prefix, index->name) == 0)
            {
                if (func_cnt == 0)
                {
                    rt_kprintf("--function:\n");

                    if (*prefix != 0)
                    {
                         
                        name_ptr = index->name;

                         
                        min_length = strlen(name_ptr);
                    }
                }

                func_cnt ++;

                if (*prefix != 0)
                {
                    length = str_common(name_ptr, index->name);
                    if (length < min_length)
                        min_length = length;
                }


                rt_kprintf("%-16s -- %s\n", index->name, index->desc);



            }
        }
    }

     
    syscall_item = global_syscall_list;
    while (syscall_item != 0)
    {
        if (str_is_prefix(prefix, syscall_item->syscall.name) == 0)
        {
            if (func_cnt == 0)
            {
                rt_kprintf("--function:\n");
                if (*prefix != 0 && name_ptr == 0)
                {
                     
                    name_ptr = syscall_item->syscall.name;

                     
                    min_length = strlen(name_ptr);
                }
            }

            func_cnt ++;

            if (*prefix != 0)
            {
                length = str_common(name_ptr, syscall_item->syscall.name);
                if (length < min_length)
                    min_length = length;
            }

            rt_kprintf("[l] %s\n", syscall_item->syscall.name);
        }
        syscall_item = syscall_item->next;
    }

     
    {
        struct finsh_sysvar *index;
        for (index = _sysvar_table_begin;
                index < _sysvar_table_end;
                index++)
        {
            if (str_is_prefix(prefix, index->name) == 0)
            {
                if (var_cnt == 0)
                {
                    rt_kprintf("--variable:\n");

                    if (*prefix != 0 && name_ptr == 0)
                    {
                         
                        name_ptr = index->name;

                         
                        min_length = strlen(name_ptr);

                    }
                }

                var_cnt ++;

                if (*prefix != 0)
                {
                    length = str_common(name_ptr, index->name);
                    if (length < min_length)
                        min_length = length;
                }


                rt_kprintf("%-16s -- %s\n", index->name, index->desc);



            }
        }
    }

     
    sysvar_item = global_sysvar_list;
    while (sysvar_item != 0)
    {
        if (str_is_prefix(prefix, sysvar_item->sysvar.name) == 0)
        {
            if (var_cnt == 0)
            {
                rt_kprintf("--variable:\n");
                if (*prefix != 0 && name_ptr == 0)
                {
                     
                    name_ptr = sysvar_item->sysvar.name;

                     
                    min_length = strlen(name_ptr);
                }
            }

            var_cnt ++;

            if (*prefix != 0)
            {
                length = str_common(name_ptr, sysvar_item->sysvar.name);
                if (length < min_length)
                    min_length = length;
            }

            rt_kprintf("[v] %s\n", sysvar_item->sysvar.name);
        }
        sysvar_item = sysvar_item->next;
    }

     
    if (name_ptr != 0)
    {
        rt_strncpy(prefix, name_ptr, min_length);
    }
}



static int dummy = 0;
const char __vsym_dummy_name[] __attribute__((section(".rodata.name"))) = "dummy"; const char __vsym_dummy_desc[] __attribute__((section(".rodata.name"))) = "dummy variable for finsh"; const struct finsh_sysvar __vsym_dummy __attribute__((section("VSymTab")))= { __vsym_dummy_name, __vsym_dummy_desc, finsh_type_int, (void*)&dummy };
