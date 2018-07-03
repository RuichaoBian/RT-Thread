#line 1 "..\\..\\src\\ipc.c"
















































 

#line 1 "..\\..\\include\\rtthread.h"





























 




#line 1 "..\\nuvoton_nuc240\\rtconfig.h"
 



 


 


 


 






 
 




 
 

 





 
 


 


 


 


 


 
 


 


 





 
 






 

 






 

 




 



 


 
 


 

 

 

 




 

 


#line 36 "..\\..\\include\\rtthread.h"
#line 1 "..\\..\\include\\rtdebug.h"


















 




#line 25 "..\\..\\include\\rtdebug.h"

 


 








































 




#line 82 "..\\..\\include\\rtdebug.h"







 
#line 104 "..\\..\\include\\rtdebug.h"




 
#line 128 "..\\..\\include\\rtdebug.h"

#line 137 "..\\..\\include\\rtdebug.h"

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


extern void (*rt_assert_hook)(const char* ex, const char* func, rt_size_t line);
void rt_assert_set_hook(void (*hook)(const char* ex, const char* func, rt_size_t line));

void rt_assert_handler(const char* ex, const char* func, rt_size_t line);


 





#line 52 "..\\..\\src\\ipc.c"
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





#line 53 "..\\..\\src\\ipc.c"









 

 







 
static __inline rt_err_t rt_ipc_object_init(struct rt_ipc_object *ipc)
{
     
    rt_list_init(&(ipc->suspend_thread));

    return 0;
}











 
static __inline rt_err_t rt_ipc_list_suspend(rt_list_t        *list,
                                       struct rt_thread *thread,
                                       rt_uint8_t        flag)
{
     
    rt_thread_suspend(thread);

    switch (flag)
    {
    case 0x00:
        rt_list_insert_before(list, &(thread->tlist));
        break;

    case 0x01:
        {
            struct rt_list_node *n;
            struct rt_thread *sthread;

             
            for (n = list->next; n != list; n = n->next)
            {
                sthread = ((struct rt_thread *)((char *)(n) - (unsigned long)(&((struct rt_thread *)0)->tlist)));

                 
                if (thread->current_priority < sthread->current_priority)
                {
                     
                    rt_list_insert_before(&(sthread->tlist), &(thread->tlist));
                    break;
                }
            }

            


 
            if (n == list)
                rt_list_insert_before(list, &(thread->tlist));
        }
        break;
    }

    return 0;
}









 
static __inline rt_err_t rt_ipc_list_resume(rt_list_t *list)
{
    struct rt_thread *thread;

     
    thread = ((struct rt_thread *)((char *)(list->next) - (unsigned long)(&((struct rt_thread *)0)->tlist)));

    do { if (0) rt_kprintf ("resume thread:%s\n", thread->name); } while (0);

     
    rt_thread_resume(thread);

    return 0;
}








 
static __inline rt_err_t rt_ipc_list_resume_all(rt_list_t *list)
{
    struct rt_thread *thread;
    register rt_ubase_t temp;

     
    while (!rt_list_isempty(list))
    {
         
        temp = rt_hw_interrupt_disable();

         
        thread = ((struct rt_thread *)((char *)(list->next) - (unsigned long)(&((struct rt_thread *)0)->tlist)));
         
        thread->error = -1;

        



 
        rt_thread_resume(thread);

         
        rt_hw_interrupt_enable(temp);
    }

    return 0;
}












 
rt_err_t rt_sem_init(rt_sem_t    sem,
                     const char *name,
                     rt_uint32_t value,
                     rt_uint8_t  flag)
{
    if (!(sem != (0))) { rt_assert_handler("sem != RT_NULL", __FUNCTION__, 216); };

     
    rt_object_init(&(sem->parent.parent), RT_Object_Class_Semaphore, name);

     
    rt_ipc_object_init(&(sem->parent));

     
    sem->value = value;

     
    sem->parent.parent.flag = flag;

    return 0;
}
;









 
rt_err_t rt_sem_detach(rt_sem_t sem)
{
    if (!(sem != (0))) { rt_assert_handler("sem != RT_NULL", __FUNCTION__, 245); };

     
    rt_ipc_list_resume_all(&(sem->parent.suspend_thread));

     
    rt_object_detach(&(sem->parent.parent));

    return 0;
}
;












 
rt_sem_t rt_sem_create(const char *name, rt_uint32_t value, rt_uint8_t flag)
{
    rt_sem_t sem;

    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 273); } } rt_hw_interrupt_enable(level); } while (0);

     
    sem = (rt_sem_t)rt_object_allocate(RT_Object_Class_Semaphore, name);
    if (sem == (0))
        return sem;

     
    rt_ipc_object_init(&(sem->parent));

     
    sem->value = value;

     
    sem->parent.parent.flag = flag;

    return sem;
}
;









 
rt_err_t rt_sem_delete(rt_sem_t sem)
{
    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 304); } } rt_hw_interrupt_enable(level); } while (0);

    if (!(sem != (0))) { rt_assert_handler("sem != RT_NULL", __FUNCTION__, 306); };

     
    rt_ipc_list_resume_all(&(sem->parent.suspend_thread));

     
    rt_object_delete(&(sem->parent.parent));

    return 0;
}
;










 
rt_err_t rt_sem_take(rt_sem_t sem, rt_int32_t time)
{
    register rt_base_t temp;
    struct rt_thread *thread;

    if (!(sem != (0))) { rt_assert_handler("sem != RT_NULL", __FUNCTION__, 333); };

    ;

     
    temp = rt_hw_interrupt_disable();

    do { if (0) rt_kprintf ("thread %s take sem:%s, which value is: %d\n", rt_thread_self()->name, ((struct rt_object *)sem)->name, sem->value); } while (0);




    if (sem->value > 0)
    {
         
        sem->value --;

         
        rt_hw_interrupt_enable(temp);
    }
    else
    {
         
        if (time == 0)
        {
            rt_hw_interrupt_enable(temp);

            return -2;
        }
        else
        {
             
            do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_thread_self() == (0)) { rt_kprintf("Function[%s] shall not be used before scheduler start\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 365); } } do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 365); } } rt_hw_interrupt_enable(level); } while (0); rt_hw_interrupt_enable(level); } while (0);

             
             
            thread = rt_thread_self();

             
            thread->error = 0;

            do { if (0) rt_kprintf ("sem take: suspend thread - %s\n", thread->name); } while (0);


             
            rt_ipc_list_suspend(&(sem->parent.suspend_thread),
                                thread,
                                sem->parent.parent.flag);

             
            if (time > 0)
            {
                do { if (0) rt_kprintf ("set thread:%s to timer list\n", thread->name); } while (0);


                 
                rt_timer_control(&(thread->thread_timer),
                                 0x0,
                                 &time);
                rt_timer_start(&(thread->thread_timer));
            }

             
            rt_hw_interrupt_enable(temp);

             
            rt_schedule();

            if (thread->error != 0)
            {
                return thread->error;
            }
        }
    }

    ;

    return 0;
}
;







 
rt_err_t rt_sem_trytake(rt_sem_t sem)
{
    return rt_sem_take(sem, 0);
}
;








 
rt_err_t rt_sem_release(rt_sem_t sem)
{
    register rt_base_t temp;
    register rt_bool_t need_schedule;

    ;

    need_schedule = 0;

     
    temp = rt_hw_interrupt_disable();

    do { if (0) rt_kprintf ("thread %s releases sem:%s, which value is: %d\n", rt_thread_self()->name, ((struct rt_object *)sem)->name, sem->value); } while (0);




    if (!rt_list_isempty(&sem->parent.suspend_thread))
    {
         
        rt_ipc_list_resume(&(sem->parent.suspend_thread));
        need_schedule = 1;
    }
    else
        sem->value ++;  

     
    rt_hw_interrupt_enable(temp);

     
    if (need_schedule == 1)
        rt_schedule();

    return 0;
}
;









 
rt_err_t rt_sem_control(rt_sem_t sem, rt_uint8_t cmd, void *arg)
{
    rt_ubase_t level;
    if (!(sem != (0))) { rt_assert_handler("sem != RT_NULL", __FUNCTION__, 484); };

    if (cmd == 0x01)
    {
        rt_uint32_t value;

         
        value = (rt_uint32_t)arg;
         
        level = rt_hw_interrupt_disable();

         
        rt_ipc_list_resume_all(&sem->parent.suspend_thread);

         
        sem->value = (rt_uint16_t)value;

         
        rt_hw_interrupt_enable(level);

        rt_schedule();

        return 0;
    }

    return -1;
}
;












 
rt_err_t rt_mutex_init(rt_mutex_t mutex, const char *name, rt_uint8_t flag)
{
    if (!(mutex != (0))) { rt_assert_handler("mutex != RT_NULL", __FUNCTION__, 527); };

     
    rt_object_init(&(mutex->parent.parent), RT_Object_Class_Mutex, name);

     
    rt_ipc_object_init(&(mutex->parent));

    mutex->value = 1;
    mutex->owner = (0);
    mutex->original_priority = 0xFF;
    mutex->hold  = 0;

     
    mutex->parent.parent.flag = flag;

    return 0;
}
;









 
rt_err_t rt_mutex_detach(rt_mutex_t mutex)
{
    if (!(mutex != (0))) { rt_assert_handler("mutex != RT_NULL", __FUNCTION__, 558); };

     
    rt_ipc_list_resume_all(&(mutex->parent.suspend_thread));

     
    rt_object_detach(&(mutex->parent.parent));

    return 0;
}
;











 
rt_mutex_t rt_mutex_create(const char *name, rt_uint8_t flag)
{
    struct rt_mutex *mutex;

    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 585); } } rt_hw_interrupt_enable(level); } while (0);

     
    mutex = (rt_mutex_t)rt_object_allocate(RT_Object_Class_Mutex, name);
    if (mutex == (0))
        return mutex;

     
    rt_ipc_object_init(&(mutex->parent));

    mutex->value              = 1;
    mutex->owner              = (0);
    mutex->original_priority  = 0xFF;
    mutex->hold               = 0;

     
    mutex->parent.parent.flag = flag;

    return mutex;
}
;









 
rt_err_t rt_mutex_delete(rt_mutex_t mutex)
{
    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 618); } } rt_hw_interrupt_enable(level); } while (0);

    if (!(mutex != (0))) { rt_assert_handler("mutex != RT_NULL", __FUNCTION__, 620); };

     
    rt_ipc_list_resume_all(&(mutex->parent.suspend_thread));

     
    rt_object_delete(&(mutex->parent.parent));

    return 0;
}
;










 
rt_err_t rt_mutex_take(rt_mutex_t mutex, rt_int32_t time)
{
    register rt_base_t temp;
    struct rt_thread *thread;

     
    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_thread_self() == (0)) { rt_kprintf("Function[%s] shall not be used before scheduler start\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 648); } } do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 648); } } rt_hw_interrupt_enable(level); } while (0); rt_hw_interrupt_enable(level); } while (0);

    if (!(mutex != (0))) { rt_assert_handler("mutex != RT_NULL", __FUNCTION__, 650); };

     
    temp = rt_hw_interrupt_disable();

     
    thread = rt_thread_self();

    ;

    do { if (0) rt_kprintf ("mutex_take: current thread %s, mutex value: %d, hold: %d\n", thread->name, mutex->value, mutex->hold); } while (0);



     
    thread->error = 0;

    if (mutex->owner == thread)
    {
         
        mutex->hold ++;
    }
    else
    {
        

 
        if (mutex->value > 0)
        {
             
            mutex->value --;

             
            mutex->owner             = thread;
            mutex->original_priority = thread->current_priority;
            mutex->hold ++;
        }
        else
        {
             
            if (time == 0)
            {
                 
                thread->error = -2;

                 
                rt_hw_interrupt_enable(temp);

                return -2;
            }
            else
            {
                 
                do { if (0) rt_kprintf ("mutex_take: suspend thread: %s\n", thread->name); } while (0);


                 
                if (thread->current_priority < mutex->owner->current_priority)
                {
                     
                    rt_thread_control(mutex->owner,
                                      0x02,
                                      &thread->current_priority);
                }

                 
                rt_ipc_list_suspend(&(mutex->parent.suspend_thread),
                                    thread,
                                    mutex->parent.parent.flag);

                 
                if (time > 0)
                {
                    do { if (0) rt_kprintf ("mutex_take: start the timer of thread:%s\n", thread->name); } while (0);



                     
                    rt_timer_control(&(thread->thread_timer),
                                     0x0,
                                     &time);
                    rt_timer_start(&(thread->thread_timer));
                }

                 
                rt_hw_interrupt_enable(temp);

                 
                rt_schedule();

                if (thread->error != 0)
                {
                     
                    return thread->error;
                }
                else
                {
                     
                     
                    temp = rt_hw_interrupt_disable();
                }
            }
        }
    }

     
    rt_hw_interrupt_enable(temp);

    ;

    return 0;
}
;








 
rt_err_t rt_mutex_release(rt_mutex_t mutex)
{
    register rt_base_t temp;
    struct rt_thread *thread;
    rt_bool_t need_schedule;

    need_schedule = 0;

     
    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_thread_self() == (0)) { rt_kprintf("Function[%s] shall not be used before scheduler start\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 781); } } do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 781); } } rt_hw_interrupt_enable(level); } while (0); rt_hw_interrupt_enable(level); } while (0);

     
    thread = rt_thread_self();

     
    temp = rt_hw_interrupt_disable();

    do { if (0) rt_kprintf ("mutex_release:current thread %s, mutex value: %d, hold: %d\n", thread->name, mutex->value, mutex->hold); } while (0);



    ;

     
    if (thread != mutex->owner)
    {
        thread->error = -1;

         
        rt_hw_interrupt_enable(temp);

        return -1;
    }

     
    mutex->hold --;
     
    if (mutex->hold == 0)
    {
         
        if (mutex->original_priority != mutex->owner->current_priority)
        {
            rt_thread_control(mutex->owner,
                              0x02,
                              &(mutex->original_priority));
        }

         
        if (!rt_list_isempty(&mutex->parent.suspend_thread))
        {
             
            thread = ((struct rt_thread *)((char *)(mutex->parent . suspend_thread . next) - (unsigned long)(&((struct rt_thread *)0)->tlist)));



            do { if (0) rt_kprintf ("mutex_release: resume thread: %s\n", thread->name); } while (0);


             
            mutex->owner             = thread;
            mutex->original_priority = thread->current_priority;
            mutex->hold ++;

             
            rt_ipc_list_resume(&(mutex->parent.suspend_thread));

            need_schedule = 1;
        }
        else
        {
             
            mutex->value ++;

             
            mutex->owner             = (0);
            mutex->original_priority = 0xff;
        }
    }

     
    rt_hw_interrupt_enable(temp);

     
    if (need_schedule == 1)
        rt_schedule();

    return 0;
}
;









 
rt_err_t rt_mutex_control(rt_mutex_t mutex, rt_uint8_t cmd, void *arg)
{
    return -1;
}
;












 
rt_err_t rt_event_init(rt_event_t event, const char *name, rt_uint8_t flag)
{
    if (!(event != (0))) { rt_assert_handler("event != RT_NULL", __FUNCTION__, 891); };

     
    rt_object_init(&(event->parent.parent), RT_Object_Class_Event, name);

     
    event->parent.parent.flag = flag;

     
    rt_ipc_object_init(&(event->parent));

     
    event->set = 0;

    return 0;
}
;







 
rt_err_t rt_event_detach(rt_event_t event)
{
     
    if (!(event != (0))) { rt_assert_handler("event != RT_NULL", __FUNCTION__, 919); };

     
    rt_ipc_list_resume_all(&(event->parent.suspend_thread));

     
    rt_object_detach(&(event->parent.parent));

    return 0;
}
;









 
rt_event_t rt_event_create(const char *name, rt_uint8_t flag)
{
    rt_event_t event;

    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 944); } } rt_hw_interrupt_enable(level); } while (0);

     
    event = (rt_event_t)rt_object_allocate(RT_Object_Class_Event, name);
    if (event == (0))
        return event;

     
    event->parent.parent.flag = flag;

     
    rt_ipc_object_init(&(event->parent));

     
    event->set = 0;

    return event;
}
;







 
rt_err_t rt_event_delete(rt_event_t event)
{
     
    if (!(event != (0))) { rt_assert_handler("event != RT_NULL", __FUNCTION__, 974); };

    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 976); } } rt_hw_interrupt_enable(level); } while (0);

     
    rt_ipc_list_resume_all(&(event->parent.suspend_thread));

     
    rt_object_delete(&(event->parent.parent));

    return 0;
}
;










 
rt_err_t rt_event_send(rt_event_t event, rt_uint32_t set)
{
    struct rt_list_node *n;
    struct rt_thread *thread;
    register rt_ubase_t level;
    register rt_base_t status;
    rt_bool_t need_schedule;

     
    if (!(event != (0))) { rt_assert_handler("event != RT_NULL", __FUNCTION__, 1007); };
    if (set == 0)
        return -1;

    need_schedule = 0;
    ;

     
    level = rt_hw_interrupt_disable();

     
    event->set |= set;

    if (!rt_list_isempty(&event->parent.suspend_thread))
    {
         
        n = event->parent.suspend_thread.next;
        while (n != &(event->parent.suspend_thread))
        {
             
            thread = ((struct rt_thread *)((char *)(n) - (unsigned long)(&((struct rt_thread *)0)->tlist)));

            status = -1;
            if (thread->event_info & 0x01)
            {
                if ((thread->event_set & event->set) == thread->event_set)
                {
                     
                    status = 0;
                }
            }
            else if (thread->event_info & 0x02)
            {
                if (thread->event_set & event->set)
                {
                     
                    thread->event_set = thread->event_set & event->set;

                     
                    status = 0;
                }
            }

             
            n = n->next;

             
            if (status == 0)
            {
                 
                if (thread->event_info & 0x04)
                    event->set &= ~thread->event_set;

                 
                rt_thread_resume(thread);

                 
                need_schedule = 1;
            }
        }
    }

     
    rt_hw_interrupt_enable(level);

     
    if (need_schedule == 1)
        rt_schedule();

    return 0;
}
;













 
rt_err_t rt_event_recv(rt_event_t   event,
                       rt_uint32_t  set,
                       rt_uint8_t   option,
                       rt_int32_t   timeout,
                       rt_uint32_t *recved)
{
    struct rt_thread *thread;
    register rt_ubase_t level;
    register rt_base_t status;

    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_thread_self() == (0)) { rt_kprintf("Function[%s] shall not be used before scheduler start\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1103); } } do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1103); } } rt_hw_interrupt_enable(level); } while (0); rt_hw_interrupt_enable(level); } while (0);

     
    if (!(event != (0))) { rt_assert_handler("event != RT_NULL", __FUNCTION__, 1106); };
    if (set == 0)
        return -1;

     
    status = -1;
     
    thread = rt_thread_self();
     
    thread->error = 0;

    ;

     
    level = rt_hw_interrupt_disable();

     
    if (option & 0x01)
    {
        if ((event->set & set) == set)
            status = 0;
    }
    else if (option & 0x02)
    {
        if (event->set & set)
            status = 0;
    }
    else
    {
         
        if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1136); };
    }

    if (status == 0)
    {
         
        if (recved)
            *recved = (event->set & set);

         
        if (option & 0x04)
            event->set &= ~set;
    }
    else if (timeout == 0)
    {
         
        thread->error = -2;
    }
    else
    {
         
        thread->event_set  = set;
        thread->event_info = option;

         
        rt_ipc_list_suspend(&(event->parent.suspend_thread),
                            thread,
                            event->parent.parent.flag);

         
        if (timeout > 0)
        {
             
            rt_timer_control(&(thread->thread_timer),
                             0x0,
                             &timeout);
            rt_timer_start(&(thread->thread_timer));
        }

         
        rt_hw_interrupt_enable(level);

         
        rt_schedule();

        if (thread->error != 0)
        {
             
            return thread->error;
        }

         
        level = rt_hw_interrupt_disable();

         
        if (recved)
            *recved = thread->event_set;
    }

     
    rt_hw_interrupt_enable(level);

    ;

    return thread->error;
}
;









 
rt_err_t rt_event_control(rt_event_t event, rt_uint8_t cmd, void *arg)
{
    rt_ubase_t level;
    if (!(event != (0))) { rt_assert_handler("event != RT_NULL", __FUNCTION__, 1216); };

    if (cmd == 0x01)
    {
         
        level = rt_hw_interrupt_disable();

         
        rt_ipc_list_resume_all(&event->parent.suspend_thread);

         
        event->set = 0;

         
        rt_hw_interrupt_enable(level);

        rt_schedule();

        return 0;
    }

    return -1;
}
;














 
rt_err_t rt_mb_init(rt_mailbox_t mb,
                    const char  *name,
                    void        *msgpool,
                    rt_size_t    size,
                    rt_uint8_t   flag)
{
    if (!(mb != (0))) { rt_assert_handler("mb != RT_NULL", __FUNCTION__, 1261); };

     
    rt_object_init(&(mb->parent.parent), RT_Object_Class_MailBox, name);

     
    mb->parent.parent.flag = flag;

     
    rt_ipc_object_init(&(mb->parent));

     
    mb->msg_pool   = msgpool;
    mb->size       = size;
    mb->entry      = 0;
    mb->in_offset  = 0;
    mb->out_offset = 0;

     
    rt_list_init(&(mb->suspend_sender_thread));

    return 0;
}
;







 
rt_err_t rt_mb_detach(rt_mailbox_t mb)
{
     
    if (!(mb != (0))) { rt_assert_handler("mb != RT_NULL", __FUNCTION__, 1296); };

     
    rt_ipc_list_resume_all(&(mb->parent.suspend_thread));
     
    rt_ipc_list_resume_all(&(mb->suspend_sender_thread));

     
    rt_object_detach(&(mb->parent.parent));

    return 0;
}
;










 
rt_mailbox_t rt_mb_create(const char *name, rt_size_t size, rt_uint8_t flag)
{
    rt_mailbox_t mb;

    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1324); } } rt_hw_interrupt_enable(level); } while (0);

     
    mb = (rt_mailbox_t)rt_object_allocate(RT_Object_Class_MailBox, name);
    if (mb == (0))
        return mb;

     
    mb->parent.parent.flag = flag;

     
    rt_ipc_object_init(&(mb->parent));

     
    mb->size     = size;
    mb->msg_pool = rt_malloc(mb->size * sizeof(rt_uint32_t));
    if (mb->msg_pool == (0))
    {
         
        rt_object_delete(&(mb->parent.parent));

        return (0);
    }
    mb->entry      = 0;
    mb->in_offset  = 0;
    mb->out_offset = 0;

     
    rt_list_init(&(mb->suspend_sender_thread));

    return mb;
}
;







 
rt_err_t rt_mb_delete(rt_mailbox_t mb)
{
    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1367); } } rt_hw_interrupt_enable(level); } while (0);

     
    if (!(mb != (0))) { rt_assert_handler("mb != RT_NULL", __FUNCTION__, 1370); };

     
    rt_ipc_list_resume_all(&(mb->parent.suspend_thread));

     
    rt_ipc_list_resume_all(&(mb->suspend_sender_thread));

#line 1384 "..\\..\\src\\ipc.c"

     
    rt_free(mb->msg_pool);

     
    rt_object_delete(&(mb->parent.parent));

    return 0;
}
;











 
rt_err_t rt_mb_send_wait(rt_mailbox_t mb,
                         rt_uint32_t  value,
                         rt_int32_t   timeout)
{
    struct rt_thread *thread;
    register rt_ubase_t temp;
    rt_uint32_t tick_delta;

     
    if (!(mb != (0))) { rt_assert_handler("mb != RT_NULL", __FUNCTION__, 1415); };

     
    tick_delta = 0;
     
    thread = rt_thread_self();

    ;

     
    temp = rt_hw_interrupt_disable();

     
    if (mb->entry == mb->size && timeout == 0)
    {
        rt_hw_interrupt_enable(temp);

        return -3;
    }

     
    while (mb->entry == mb->size)
    {
         
        thread->error = 0;

         
        if (timeout == 0)
        {
             
            rt_hw_interrupt_enable(temp);

            return -3;
        }

        do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_thread_self() == (0)) { rt_kprintf("Function[%s] shall not be used before scheduler start\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1450); } } do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1450); } } rt_hw_interrupt_enable(level); } while (0); rt_hw_interrupt_enable(level); } while (0);
         
        rt_ipc_list_suspend(&(mb->suspend_sender_thread),
                            thread,
                            mb->parent.parent.flag);

         
        if (timeout > 0)
        {
             
            tick_delta = rt_tick_get();

            do { if (0) rt_kprintf ("mb_send_wait: start timer of thread:%s\n", thread->name); } while (0);


             
            rt_timer_control(&(thread->thread_timer),
                             0x0,
                             &timeout);
            rt_timer_start(&(thread->thread_timer));
        }

         
        rt_hw_interrupt_enable(temp);

         
        rt_schedule();

         
        if (thread->error != 0)
        {
             
            return thread->error;
        }

         
        temp = rt_hw_interrupt_disable();

         
        if (timeout > 0)
        {
            tick_delta = rt_tick_get() - tick_delta;
            timeout -= tick_delta;
            if (timeout < 0)
                timeout = 0;
        }
    }

     
    mb->msg_pool[mb->in_offset] = value;
     
    ++ mb->in_offset;
    if (mb->in_offset >= mb->size)
        mb->in_offset = 0;
     
    mb->entry ++;

     
    if (!rt_list_isempty(&mb->parent.suspend_thread))
    {
        rt_ipc_list_resume(&(mb->parent.suspend_thread));

         
        rt_hw_interrupt_enable(temp);

        rt_schedule();

        return 0;
    }

     
    rt_hw_interrupt_enable(temp);

    return 0;
}
;










 
rt_err_t rt_mb_send(rt_mailbox_t mb, rt_uint32_t value)
{
    return rt_mb_send_wait(mb, value, 0);
}
;










 
rt_err_t rt_mb_recv(rt_mailbox_t mb, rt_uint32_t *value, rt_int32_t timeout)
{
    struct rt_thread *thread;
    register rt_ubase_t temp;
    rt_uint32_t tick_delta;

     
    if (!(mb != (0))) { rt_assert_handler("mb != RT_NULL", __FUNCTION__, 1560); };

     
    tick_delta = 0;
     
    thread = rt_thread_self();

    ;

     
    temp = rt_hw_interrupt_disable();

     
    if (mb->entry == 0 && timeout == 0)
    {
        rt_hw_interrupt_enable(temp);

        return -2;
    }

     
    while (mb->entry == 0)
    {
         
        thread->error = 0;

         
        if (timeout == 0)
        {
             
            rt_hw_interrupt_enable(temp);

            thread->error = -2;

            return -2;
        }

        do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_thread_self() == (0)) { rt_kprintf("Function[%s] shall not be used before scheduler start\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1597); } } do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1597); } } rt_hw_interrupt_enable(level); } while (0); rt_hw_interrupt_enable(level); } while (0);
         
        rt_ipc_list_suspend(&(mb->parent.suspend_thread),
                            thread,
                            mb->parent.parent.flag);

         
        if (timeout > 0)
        {
             
            tick_delta = rt_tick_get();

            do { if (0) rt_kprintf ("mb_recv: start timer of thread:%s\n", thread->name); } while (0);


             
            rt_timer_control(&(thread->thread_timer),
                             0x0,
                             &timeout);
            rt_timer_start(&(thread->thread_timer));
        }

         
        rt_hw_interrupt_enable(temp);

         
        rt_schedule();

         
        if (thread->error != 0)
        {
             
            return thread->error;
        }

         
        temp = rt_hw_interrupt_disable();

         
        if (timeout > 0)
        {
            tick_delta = rt_tick_get() - tick_delta;
            timeout -= tick_delta;
            if (timeout < 0)
                timeout = 0;
        }
    }

     
    *value = mb->msg_pool[mb->out_offset];

     
    ++ mb->out_offset;
    if (mb->out_offset >= mb->size)
        mb->out_offset = 0;
     
    mb->entry --;

     
    if (!rt_list_isempty(&(mb->suspend_sender_thread)))
    {
        rt_ipc_list_resume(&(mb->suspend_sender_thread));

         
        rt_hw_interrupt_enable(temp);

        ;

        rt_schedule();

        return 0;
    }

     
    rt_hw_interrupt_enable(temp);

    ;

    return 0;
}
;









 
rt_err_t rt_mb_control(rt_mailbox_t mb, rt_uint8_t cmd, void *arg)
{
    rt_ubase_t level;
    if (!(mb != (0))) { rt_assert_handler("mb != RT_NULL", __FUNCTION__, 1691); };

    if (cmd == 0x01)
    {
         
        level = rt_hw_interrupt_disable();

         
        rt_ipc_list_resume_all(&(mb->parent.suspend_thread));
         
        rt_ipc_list_resume_all(&(mb->suspend_sender_thread));

         
        mb->entry      = 0;
        mb->in_offset  = 0;
        mb->out_offset = 0;

         
        rt_hw_interrupt_enable(level);

        rt_schedule();

        return 0;
    }

    return -1;
}
;



struct rt_mq_message
{
    struct rt_mq_message *next;
};













 
rt_err_t rt_mq_init(rt_mq_t     mq,
                    const char *name,
                    void       *msgpool,
                    rt_size_t   msg_size,
                    rt_size_t   pool_size,
                    rt_uint8_t  flag)
{
    struct rt_mq_message *head;
    register rt_base_t temp;

     
    if (!(mq != (0))) { rt_assert_handler("mq != RT_NULL", __FUNCTION__, 1751); };

     
    rt_object_init(&(mq->parent.parent), RT_Object_Class_MessageQueue, name);

     
    mq->parent.parent.flag = flag;

     
    rt_ipc_object_init(&(mq->parent));

     
    mq->msg_pool = msgpool;

     
    mq->msg_size = (((msg_size) + (4) - 1) & ~((4) - 1));
    mq->max_msgs = pool_size / (mq->msg_size + sizeof(struct rt_mq_message));

     
    mq->msg_queue_head = (0);
    mq->msg_queue_tail = (0);

     
    mq->msg_queue_free = (0);
    for (temp = 0; temp < mq->max_msgs; temp ++)
    {
        head = (struct rt_mq_message *)((rt_uint8_t *)mq->msg_pool +
            temp * (mq->msg_size + sizeof(struct rt_mq_message)));
        head->next = mq->msg_queue_free;
        mq->msg_queue_free = head;
    }

     
    mq->entry = 0;

    return 0;
}
;







 
rt_err_t rt_mq_detach(rt_mq_t mq)
{
     
    if (!(mq != (0))) { rt_assert_handler("mq != RT_NULL", __FUNCTION__, 1800); };

     
    rt_ipc_list_resume_all(&mq->parent.suspend_thread);

     
    rt_object_detach(&(mq->parent.parent));

    return 0;
}
;











 
rt_mq_t rt_mq_create(const char *name,
                     rt_size_t   msg_size,
                     rt_size_t   max_msgs,
                     rt_uint8_t  flag)
{
    struct rt_messagequeue *mq;
    struct rt_mq_message *head;
    register rt_base_t temp;

    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1832); } } rt_hw_interrupt_enable(level); } while (0);

     
    mq = (rt_mq_t)rt_object_allocate(RT_Object_Class_MessageQueue, name);
    if (mq == (0))
        return mq;

     
    mq->parent.parent.flag = flag;

     
    rt_ipc_object_init(&(mq->parent));

     

     
    mq->msg_size = (((msg_size) + (4) - 1) & ~((4) - 1));
    mq->max_msgs = max_msgs;

     
    mq->msg_pool = rt_malloc((mq->msg_size + sizeof(struct rt_mq_message))* mq->max_msgs);
    if (mq->msg_pool == (0))
    {
        rt_mq_delete(mq);

        return (0);
    }

     
    mq->msg_queue_head = (0);
    mq->msg_queue_tail = (0);

     
    mq->msg_queue_free = (0);
    for (temp = 0; temp < mq->max_msgs; temp ++)
    {
        head = (struct rt_mq_message *)((rt_uint8_t *)mq->msg_pool +
               temp * (mq->msg_size + sizeof(struct rt_mq_message)));
        head->next = mq->msg_queue_free;
        mq->msg_queue_free = head;
    }

     
    mq->entry = 0;

    return mq;
}
;







 
rt_err_t rt_mq_delete(rt_mq_t mq)
{
    do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 1890); } } rt_hw_interrupt_enable(level); } while (0);

     
    if (!(mq != (0))) { rt_assert_handler("mq != RT_NULL", __FUNCTION__, 1893); };

     
    rt_ipc_list_resume_all(&(mq->parent.suspend_thread));

#line 1904 "..\\..\\src\\ipc.c"

     
    rt_free(mq->msg_pool);

     
    rt_object_delete(&(mq->parent.parent));

    return 0;
}
;











 
rt_err_t rt_mq_send(rt_mq_t mq, void *buffer, rt_size_t size)
{
    register rt_ubase_t temp;
    struct rt_mq_message *msg;

    if (!(mq != (0))) { rt_assert_handler("mq != RT_NULL", __FUNCTION__, 1931); };
    if (!(buffer != (0))) { rt_assert_handler("buffer != RT_NULL", __FUNCTION__, 1932); };
    if (!(size != 0)) { rt_assert_handler("size != 0", __FUNCTION__, 1933); };

     
    if (size > mq->msg_size)
        return -1;

    ;

     
    temp = rt_hw_interrupt_disable();

     
    msg = (struct rt_mq_message*)mq->msg_queue_free;
     
    if (msg == (0))
    {
         
        rt_hw_interrupt_enable(temp);

        return -3;
    }
     
    mq->msg_queue_free = msg->next;

     
    rt_hw_interrupt_enable(temp);

     
    msg->next = (0);
     
    rt_memcpy(msg + 1, buffer, size);

     
    temp = rt_hw_interrupt_disable();
     
    if (mq->msg_queue_tail != (0))
    {
         
        ((struct rt_mq_message *)mq->msg_queue_tail)->next = msg;
    }

     
    mq->msg_queue_tail = msg;
     
    if (mq->msg_queue_head == (0))
        mq->msg_queue_head = msg;

     
    mq->entry ++;

     
    if (!rt_list_isempty(&mq->parent.suspend_thread))
    {
        rt_ipc_list_resume(&(mq->parent.suspend_thread));

         
        rt_hw_interrupt_enable(temp);

        rt_schedule();

        return 0;
    }

     
    rt_hw_interrupt_enable(temp);

    return 0;
}
;











 
rt_err_t rt_mq_urgent(rt_mq_t mq, void *buffer, rt_size_t size)
{
    register rt_ubase_t temp;
    struct rt_mq_message *msg;

    if (!(mq != (0))) { rt_assert_handler("mq != RT_NULL", __FUNCTION__, 2019); };
    if (!(buffer != (0))) { rt_assert_handler("buffer != RT_NULL", __FUNCTION__, 2020); };
    if (!(size != 0)) { rt_assert_handler("size != 0", __FUNCTION__, 2021); };

     
    if (size > mq->msg_size)
        return -1;

    ;

     
    temp = rt_hw_interrupt_disable();

     
    msg = (struct rt_mq_message *)mq->msg_queue_free;
     
    if (msg == (0))
    {
         
        rt_hw_interrupt_enable(temp);

        return -3;
    }
     
    mq->msg_queue_free = msg->next;

     
    rt_hw_interrupt_enable(temp);

     
    rt_memcpy(msg + 1, buffer, size);

     
    temp = rt_hw_interrupt_disable();

     
    msg->next = mq->msg_queue_head;
    mq->msg_queue_head = msg;

     
    if (mq->msg_queue_tail == (0))
        mq->msg_queue_tail = msg;

     
    mq->entry ++;

     
    if (!rt_list_isempty(&mq->parent.suspend_thread))
    {
        rt_ipc_list_resume(&(mq->parent.suspend_thread));

         
        rt_hw_interrupt_enable(temp);

        rt_schedule();

        return 0;
    }

     
    rt_hw_interrupt_enable(temp);

    return 0;
}
;












 
rt_err_t rt_mq_recv(rt_mq_t    mq,
                    void      *buffer,
                    rt_size_t  size,
                    rt_int32_t timeout)
{
    struct rt_thread *thread;
    register rt_ubase_t temp;
    struct rt_mq_message *msg;
    rt_uint32_t tick_delta;

    if (!(mq != (0))) { rt_assert_handler("mq != RT_NULL", __FUNCTION__, 2107); };
    if (!(buffer != (0))) { rt_assert_handler("buffer != RT_NULL", __FUNCTION__, 2108); };
    if (!(size != 0)) { rt_assert_handler("size != 0", __FUNCTION__, 2109); };

     
    tick_delta = 0;
     
    thread = rt_thread_self();
    ;

     
    temp = rt_hw_interrupt_disable();

     
    if (mq->entry == 0 && timeout == 0)
    {
        rt_hw_interrupt_enable(temp);

        return -2;
    }

     
    while (mq->entry == 0)
    {
        do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_thread_self() == (0)) { rt_kprintf("Function[%s] shall not be used before scheduler start\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 2131); } } do { rt_base_t level; level = rt_hw_interrupt_disable(); if (rt_interrupt_get_nest() != 0) { rt_kprintf("Function[%s] shall not used in ISR\n", __FUNCTION__); if (!(0)) { rt_assert_handler("0", __FUNCTION__, 2131); } } rt_hw_interrupt_enable(level); } while (0); rt_hw_interrupt_enable(level); } while (0);

         
        thread->error = 0;

         
        if (timeout == 0)
        {
             
            rt_hw_interrupt_enable(temp);

            thread->error = -2;

            return -2;
        }

         
        rt_ipc_list_suspend(&(mq->parent.suspend_thread),
                            thread,
                            mq->parent.parent.flag);

         
        if (timeout > 0)
        {
             
            tick_delta = rt_tick_get();

            do { if (0) rt_kprintf ("set thread:%s to timer list\n", thread->name); } while (0);


             
            rt_timer_control(&(thread->thread_timer),
                             0x0,
                             &timeout);
            rt_timer_start(&(thread->thread_timer));
        }

         
        rt_hw_interrupt_enable(temp);

         
        rt_schedule();

         
        if (thread->error != 0)
        {
             
            return thread->error;
        }

         
        temp = rt_hw_interrupt_disable();

         
        if (timeout > 0)
        {
            tick_delta = rt_tick_get() - tick_delta;
            timeout -= tick_delta;
            if (timeout < 0)
                timeout = 0;
        }
    }

     
    msg = (struct rt_mq_message *)mq->msg_queue_head;

     
    mq->msg_queue_head = msg->next;
     
    if (mq->msg_queue_tail == msg)
        mq->msg_queue_tail = (0);

     
    mq->entry --;

     
    rt_hw_interrupt_enable(temp);

     
    rt_memcpy(buffer, msg + 1, size > mq->msg_size ? mq->msg_size : size);

     
    temp = rt_hw_interrupt_disable();
     
    msg->next = (struct rt_mq_message *)mq->msg_queue_free;
    mq->msg_queue_free = msg;
     
    rt_hw_interrupt_enable(temp);

    ;

    return 0;
}
;










 
rt_err_t rt_mq_control(rt_mq_t mq, rt_uint8_t cmd, void *arg)
{
    rt_ubase_t level;
    struct rt_mq_message *msg;

    if (!(mq != (0))) { rt_assert_handler("mq != RT_NULL", __FUNCTION__, 2241); };

    if (cmd == 0x01)
    {
         
        level = rt_hw_interrupt_disable();

         
        rt_ipc_list_resume_all(&mq->parent.suspend_thread);

         
        while (mq->msg_queue_head != (0))
        {
             
            msg = (struct rt_mq_message *)mq->msg_queue_head;

             
            mq->msg_queue_head = msg->next;
             
            if (mq->msg_queue_tail == msg)
                mq->msg_queue_tail = (0);

             
            msg->next = (struct rt_mq_message *)mq->msg_queue_free;
            mq->msg_queue_free = msg;
        }

         
        mq->entry = 0;

         
        rt_hw_interrupt_enable(level);

        rt_schedule();

        return 0;
    }

    return -1;
}
;


 
