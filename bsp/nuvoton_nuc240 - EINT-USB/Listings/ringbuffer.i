#line 1 "..\\..\\components\\drivers\\src\\ringbuffer.c"























 

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

 





#line 27 "..\\..\\components\\drivers\\src\\ringbuffer.c"
#line 1 "..\\..\\components\\drivers\\include\\rtdevice.h"























 




#line 30 "..\\..\\components\\drivers\\include\\rtdevice.h"







 
struct rt_completion
{
    rt_uint32_t flag;

     
    rt_list_t suspended_list;
};

 
struct rt_ringbuffer
{
    rt_uint8_t *buffer_ptr;
    




















 
    rt_uint16_t read_mirror : 1;
    rt_uint16_t read_index : 15;
    rt_uint16_t write_mirror : 1;
    rt_uint16_t write_index : 15;
    
 
    rt_int16_t buffer_size;
};

 
struct rt_portal_device
{
    struct rt_device parent;
    struct rt_device *write_dev;
    struct rt_device *read_dev;
};

 

enum rt_pipe_flag
{
     
    RT_PIPE_FLAG_NONBLOCK_RDWR = 0x00,
     
    RT_PIPE_FLAG_BLOCK_RD = 0x01,
     
    RT_PIPE_FLAG_BLOCK_WR = 0x02,
    

 
    RT_PIPE_FLAG_FORCE_WR = 0x04,
};

struct rt_pipe_device
{
    struct rt_device parent;

     
    struct rt_ringbuffer ringbuffer;

    enum rt_pipe_flag flag;

     
    rt_list_t suspended_read_list;
    rt_list_t suspended_write_list;

    struct rt_portal_device *write_portal;
    struct rt_portal_device *read_portal;
};








struct rt_data_item;


 
struct rt_data_queue
{
    rt_uint16_t size;
    rt_uint16_t lwm;

    rt_uint16_t get_index;
    rt_uint16_t put_index;

    struct rt_data_item *queue;

    rt_list_t suspended_push_list;
    rt_list_t suspended_pop_list;

     
    void (*evt_notify)(struct rt_data_queue *queue, rt_uint32_t event);
};

 
struct rt_workqueue
{
	rt_list_t      work_list;
	struct rt_work *work_current;  
	rt_thread_t    work_thread;
};

struct rt_work
{
	rt_list_t list;

	void (*work_func)(struct rt_work* work, void* work_data);
	void *work_data;
};



 
void rt_completion_init(struct rt_completion *completion);
rt_err_t rt_completion_wait(struct rt_completion *completion,
                            rt_int32_t            timeout);
void rt_completion_done(struct rt_completion *completion);






 
void rt_ringbuffer_init(struct rt_ringbuffer *rb,
                        rt_uint8_t           *pool,
                        rt_int16_t            size);
rt_size_t rt_ringbuffer_put(struct rt_ringbuffer *rb,
                            const rt_uint8_t     *ptr,
                            rt_uint16_t           length);
rt_size_t rt_ringbuffer_put_force(struct rt_ringbuffer *rb,
                                  const rt_uint8_t     *ptr,
                                  rt_uint16_t           length);
rt_size_t rt_ringbuffer_putchar(struct rt_ringbuffer *rb,
                                const rt_uint8_t      ch);
rt_size_t rt_ringbuffer_putchar_force(struct rt_ringbuffer *rb,
                                      const rt_uint8_t      ch);
rt_size_t rt_ringbuffer_get(struct rt_ringbuffer *rb,
                            rt_uint8_t           *ptr,
                            rt_uint16_t           length);
rt_size_t rt_ringbuffer_getchar(struct rt_ringbuffer *rb, rt_uint8_t *ch);

enum rt_ringbuffer_state
{
    RT_RINGBUFFER_EMPTY,
    RT_RINGBUFFER_FULL,
     
    RT_RINGBUFFER_HALFFULL,
};

static __inline rt_uint16_t rt_ringbuffer_get_size(struct rt_ringbuffer *rb)
{
    ;
    return rb->buffer_size;
}

static __inline enum rt_ringbuffer_state
rt_ringbuffer_status(struct rt_ringbuffer *rb)
{
    if (rb->read_index == rb->write_index)
    {
        if (rb->read_mirror == rb->write_mirror)
            return RT_RINGBUFFER_EMPTY;
        else
            return RT_RINGBUFFER_FULL;
    }
    return RT_RINGBUFFER_HALFFULL;
}

 
static __inline rt_uint16_t rt_ringbuffer_data_len(struct rt_ringbuffer *rb)
{
    switch (rt_ringbuffer_status(rb))
    {
    case RT_RINGBUFFER_EMPTY:
        return 0;
    case RT_RINGBUFFER_FULL:
        return rb->buffer_size;
    case RT_RINGBUFFER_HALFFULL:
    default:
        if (rb->write_index > rb->read_index)
            return rb->write_index - rb->read_index;
        else
            return rb->buffer_size - (rb->read_index - rb->write_index);
    };
}

 




 
rt_err_t rt_pipe_init(struct rt_pipe_device *pipe,
                      const char *name,
                      enum rt_pipe_flag flag,
                      rt_uint8_t *buf,
                      rt_size_t size);
rt_err_t rt_pipe_detach(struct rt_pipe_device *pipe);

rt_err_t rt_pipe_create(const char *name, enum rt_pipe_flag flag, rt_size_t size);
void rt_pipe_destroy(struct rt_pipe_device *pipe);




 

rt_err_t rt_portal_init(struct rt_portal_device *portal,
                        const char *portal_name,
                        const char *write_dev,
                        const char *read_dev);
rt_err_t rt_portal_detach(struct rt_portal_device *portal);


rt_err_t rt_portal_create(const char *name,
                          const char *write_dev,
                          const char *read_dev);
void rt_portal_destroy(struct rt_portal_device *portal);




 
rt_err_t rt_data_queue_init(struct rt_data_queue *queue,
                            rt_uint16_t           size,
                            rt_uint16_t           lwm,
                            void (*evt_notify)(struct rt_data_queue *queue, rt_uint32_t event));
rt_err_t rt_data_queue_push(struct rt_data_queue *queue,
                            const void           *data_ptr,
                            rt_size_t             data_size,
                            rt_int32_t            timeout);
rt_err_t rt_data_queue_pop(struct rt_data_queue *queue,
                           const void          **data_ptr,
                           rt_size_t            *size,
                           rt_int32_t            timeout);
rt_err_t rt_data_queue_peak(struct rt_data_queue *queue,
                            const void          **data_ptr,
                            rt_size_t            *size);
void rt_data_queue_reset(struct rt_data_queue *queue);




 
struct rt_workqueue *rt_workqueue_create(const char* name, rt_uint16_t stack_size, rt_uint8_t priority);
rt_err_t rt_workqueue_destroy(struct rt_workqueue* queue);
rt_err_t rt_workqueue_dowork(struct rt_workqueue* queue, struct rt_work* work);
rt_err_t rt_workqueue_cancel_work(struct rt_workqueue* queue, struct rt_work* work);

static __inline void rt_work_init(struct rt_work* work, void (*work_func)(struct rt_work* work, void* work_data),
    void* work_data)
{
    rt_list_init(&(work->list));
    work->work_func = work_func;
    work->work_data = work_data;
}


#line 321 "..\\..\\components\\drivers\\include\\rtdevice.h"













#line 1 "..\\..\\components\\drivers\\include\\drivers/usb_device.h"
























 




#line 31 "..\\..\\components\\drivers\\include\\drivers/usb_device.h"
#line 1 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"























 








#line 34 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"




#line 57 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"

#line 70 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"

#line 77 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"



















#line 120 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"

#line 127 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"

#line 138 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"
































 
#line 184 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"









 
#line 206 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"



 




















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








 



#line 404 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"





#line 420 "..\\..\\components\\drivers\\include\\drivers/usb_common.h"





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



 
 




 









#line 32 "..\\..\\components\\drivers\\include\\drivers/usb_device.h"


 





 






#line 70 "..\\..\\components\\drivers\\include\\drivers/usb_device.h"

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

#line 336 "..\\..\\components\\drivers\\include\\rtdevice.h"


#line 1 "..\\..\\components\\drivers\\include\\drivers/usb_host.h"






















 








#line 33 "..\\..\\components\\drivers\\include\\drivers/usb_host.h"
#line 34 "..\\..\\components\\drivers\\include\\drivers/usb_host.h"














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







#line 340 "..\\..\\components\\drivers\\include\\rtdevice.h"


#line 1 "..\\..\\components\\drivers\\include\\drivers/serial.h"

























 




#line 32 "..\\..\\components\\drivers\\include\\drivers/serial.h"

#line 45 "..\\..\\components\\drivers\\include\\drivers/serial.h"












#line 64 "..\\..\\components\\drivers\\include\\drivers/serial.h"






























 
#line 106 "..\\..\\components\\drivers\\include\\drivers/serial.h"

struct serial_configure
{
    rt_uint32_t baud_rate;

    rt_uint32_t data_bits               :4;
    rt_uint32_t stop_bits               :2;
    rt_uint32_t parity                  :2;
    rt_uint32_t bit_order               :1;
    rt_uint32_t invert                  :1;
    rt_uint32_t bufsz                   :16;
    rt_uint32_t reserved                :4;
};



 
struct rt_serial_rx_fifo
{
     
    rt_uint8_t *buffer;

    rt_uint16_t put_index, get_index;

    rt_bool_t is_full;
};

struct rt_serial_tx_fifo
{
    struct rt_completion completion;
};



 
struct rt_serial_rx_dma
{
    rt_bool_t activated;
};

struct rt_serial_tx_dma
{
    rt_bool_t activated;
    struct rt_data_queue data_queue;
};

struct rt_serial_device
{
    struct rt_device          parent;

    const struct rt_uart_ops *ops;
    struct serial_configure   config;

    void *serial_rx;
    void *serial_tx;
};
typedef struct rt_serial_device rt_serial_t;



 
struct rt_uart_ops
{
    rt_err_t (*configure)(struct rt_serial_device *serial, struct serial_configure *cfg);
    rt_err_t (*control)(struct rt_serial_device *serial, int cmd, void *arg);

    int (*putc)(struct rt_serial_device *serial, char c);
    int (*getc)(struct rt_serial_device *serial);

    rt_size_t (*dma_transmit)(struct rt_serial_device *serial, rt_uint8_t *buf, rt_size_t size, int direction);
};

void rt_hw_serial_isr(struct rt_serial_device *serial, int event);

rt_err_t rt_hw_serial_register(struct rt_serial_device *serial,
                               const char              *name,
                               rt_uint32_t              flag,
                               void                    *data);

#line 344 "..\\..\\components\\drivers\\include\\rtdevice.h"


#line 354 "..\\..\\components\\drivers\\include\\rtdevice.h"

































#line 28 "..\\..\\components\\drivers\\src\\ringbuffer.c"
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



 

#line 29 "..\\..\\components\\drivers\\src\\ringbuffer.c"

void rt_ringbuffer_init(struct rt_ringbuffer *rb,
                        rt_uint8_t           *pool,
                        rt_int16_t            size)
{
    ;
    

     
    rb->read_mirror = rb->read_index = 0;
    rb->write_mirror = rb->write_index = 0;

     
    rb->buffer_ptr = pool;
    rb->buffer_size = ((size) & ~((4) - 1));
}
;



 
rt_size_t rt_ringbuffer_put(struct rt_ringbuffer *rb,
                            const rt_uint8_t     *ptr,
                            rt_uint16_t           length)
{
    rt_uint16_t size;

    ;

     
    size = ((rb)->buffer_size - rt_ringbuffer_data_len(rb));

     
    if (size == 0)
        return 0;

     
    if (size < length)
        length = size;

    if (rb->buffer_size - rb->write_index > length)
    {
         
        memcpy(&rb->buffer_ptr[rb->write_index], ptr, length);
        
 
        rb->write_index += length;
        return length;
    }

    memcpy(&rb->buffer_ptr[rb->write_index],
           &ptr[0],
           rb->buffer_size - rb->write_index);
    memcpy(&rb->buffer_ptr[0],
           &ptr[rb->buffer_size - rb->write_index],
           length - (rb->buffer_size - rb->write_index));

     
    rb->write_mirror = ~rb->write_mirror;
    rb->write_index = length - (rb->buffer_size - rb->write_index);

    return length;
}
;





 
rt_size_t rt_ringbuffer_put_force(struct rt_ringbuffer *rb,
                            const rt_uint8_t     *ptr,
                            rt_uint16_t           length)
{
    rt_uint16_t space_length;

    ;

    space_length = ((rb)->buffer_size - rt_ringbuffer_data_len(rb));

    if (length > space_length)
        length = rb->buffer_size;

    if (rb->buffer_size - rb->write_index > length)
    {
         
        memcpy(&rb->buffer_ptr[rb->write_index], ptr, length);
        
 
        rb->write_index += length;

        if (length > space_length)
            rb->read_index = rb->write_index;

        return length;
    }

    memcpy(&rb->buffer_ptr[rb->write_index],
           &ptr[0],
           rb->buffer_size - rb->write_index);
    memcpy(&rb->buffer_ptr[0],
           &ptr[rb->buffer_size - rb->write_index],
           length - (rb->buffer_size - rb->write_index));

     
    rb->write_mirror = ~rb->write_mirror;
    rb->write_index = length - (rb->buffer_size - rb->write_index);

    if (length > space_length)
    {
        rb->read_mirror = ~rb->read_mirror;
        rb->read_index = rb->write_index;
    }

    return length;
}
;



 
rt_size_t rt_ringbuffer_get(struct rt_ringbuffer *rb,
                            rt_uint8_t           *ptr,
                            rt_uint16_t           length)
{
    rt_size_t size;

    ;

     
    size = rt_ringbuffer_data_len(rb);

     
    if (size == 0)
        return 0;

     
    if (size < length)
        length = size;

    if (rb->buffer_size - rb->read_index > length)
    {
         
        memcpy(ptr, &rb->buffer_ptr[rb->read_index], length);
        
 
        rb->read_index += length;
        return length;
    }

    memcpy(&ptr[0],
           &rb->buffer_ptr[rb->read_index],
           rb->buffer_size - rb->read_index);
    memcpy(&ptr[rb->buffer_size - rb->read_index],
           &rb->buffer_ptr[0],
           length - (rb->buffer_size - rb->read_index));

     
    rb->read_mirror = ~rb->read_mirror;
    rb->read_index = length - (rb->buffer_size - rb->read_index);

    return length;
}
;



 
rt_size_t rt_ringbuffer_putchar(struct rt_ringbuffer *rb, const rt_uint8_t ch)
{
    ;

     
    if (!((rb)->buffer_size - rt_ringbuffer_data_len(rb)))
        return 0;

    rb->buffer_ptr[rb->write_index] = ch;

     
    if (rb->write_index == rb->buffer_size-1)
    {
        rb->write_mirror = ~rb->write_mirror;
        rb->write_index = 0;
    }
    else
    {
        rb->write_index++;
    }

    return 1;
}
;





 
rt_size_t rt_ringbuffer_putchar_force(struct rt_ringbuffer *rb, const rt_uint8_t ch)
{
    enum rt_ringbuffer_state old_state;

    ;

    old_state = rt_ringbuffer_status(rb);

    rb->buffer_ptr[rb->write_index] = ch;

     
    if (rb->write_index == rb->buffer_size-1)
    {
        rb->write_mirror = ~rb->write_mirror;
        rb->write_index = 0;
        if (old_state == RT_RINGBUFFER_FULL)
        {
            rb->read_mirror = ~rb->read_mirror;
            rb->read_index = rb->write_index;
        }
    }
    else
    {
        rb->write_index++;
        if (old_state == RT_RINGBUFFER_FULL)
            rb->read_index = rb->write_index;
    }

    return 1;
}
;



 
rt_size_t rt_ringbuffer_getchar(struct rt_ringbuffer *rb, rt_uint8_t *ch)
{
    ;

     
    if (!rt_ringbuffer_data_len(rb))
        return 0;

     
    *ch = rb->buffer_ptr[rb->read_index];

    if (rb->read_index == rb->buffer_size-1)
    {
        rb->read_mirror = ~rb->read_mirror;
        rb->read_index = 0;
    }
    else
    {
        rb->read_index++;
    }

    return 1;
}
;

