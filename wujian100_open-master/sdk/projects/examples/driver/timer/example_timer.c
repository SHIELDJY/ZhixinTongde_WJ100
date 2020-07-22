/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_timer.c
 * @brief    the main function for the timer driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_timer.h"
#include "stdio.h"
#include "soc.h"
#include "drv_gpio.h"
#include "pin_name.h"
#include "pin.h"
#include "drv_usart.h"
#include "oled.h"
#include "imu.h"



#define motor1 1   //motor bottom
#define motor2 2   //motor top

extern void udelay(uint32_t ms);


//timers 产生模拟PWM用；由于中断不太正常，弃之未用
#define  pulse_freq 3000;
uint32_t pulse_T=500000/pulse_freq;
uint32_t counter_Motor1=0;
uint32_t flag_Motor1=1;
uint32_t flag1_Motor1=1;
int32_t pulse_num_Motor1=400;
uint32_t counter_Motor2=0;
uint32_t flag_Motor2=1;
uint32_t flag1_Motor2=1;
uint32_t pulse_num_Motor2=800;


//电机使用变量定义
gpio_pin_handle_t pin1 = NULL;//Motor1 PWM
gpio_pin_handle_t pin1_d1 = NULL;//Motor1 DIR1
gpio_pin_handle_t pin1_d2 = NULL;//Motor1 DIR2
gpio_pin_handle_t pin2 = NULL;//Motor2 PWM
gpio_pin_handle_t pin2_d1 = NULL;//Motor2 DIR1
gpio_pin_handle_t pin2_d2 = NULL;//Motor2 DIR2


//art 接受数组
uint8_t data_rev[10];
usart_handle_t p_csi_usart;


 int32_t usart_receive_sync(usart_handle_t usart, void *data, uint32_t num)
{
    int time_out = 0x7ffff;
    usart_status_t status;

    csi_usart_receive(usart, data, num);

    while (time_out) {
        time_out--;
        status = csi_usart_get_status(usart);

        if (!status.rx_busy) {
            break;
        }
    }

    if (0 == time_out) {
        return -1;
    }

    return 0;
}

 int32_t usart_send_sync(usart_handle_t usart, const void *data, uint32_t num)
{
    int time_out = 0x7ffff;
    usart_status_t status;

    csi_usart_send(usart, data, num);

    while (time_out) {
        time_out--;
        status = csi_usart_get_status(usart);

        if (!status.tx_busy) {
            break;
        }
    }

    if (0 == time_out) {
        return -1;
    }

    return 0;
}

uint16_t timer_counter=0; 
static void timer_event_cb_fun(int32_t idx, timer_event_e event)
{
	
	timer_counter++;
	
/*
	if(flag1_Motor1 && pulse_num_Motor1!=0)//start gernerate pulse
	{
		counter_Motor1++;
	    flag_Motor1=1-flag_Motor1;
	    if(flag_Motor1) csi_gpio_pin_write(pin1,1);//high
		else	 csi_gpio_pin_write(pin1,0);//low
		
		if(counter_Motor1==2*pulse_num_Motor1) 
			{
				flag1_Motor1=0;counter_Motor1=0;
				csi_gpio_pin_write(pin1,0);//low
			}
	}

	if(flag1_Motor2  && pulse_num_Motor2!=0)//start gernerate pulse
	{
		counter_Motor2++;
	    flag_Motor2=1-flag_Motor2;
	    if(flag_Motor2) csi_gpio_pin_write(pin2,1);//high2*pulse_num_Motor2
		else	 csi_gpio_pin_write(pin2,0);//low
		
		if(counter_Motor2==2*pulse_num_Motor2) 
			{
				flag1_Motor2=0;counter_Motor2=0;
				csi_gpio_pin_write(pin2,0);//low
			}
	}

	*/		
}


static int32_t timer_init(uint8_t timer_num,uint32_t timer_T)
{
    int32_t ret;
    timer_handle_t timer_handle;

    timer_handle = csi_timer_initialize(timer_num, timer_event_cb_fun);

    if (timer_handle == NULL) {
        printf("csi_timer_initialize error\n");
        return -1;
    }

    ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);

    if (ret < 0) {
        return -1;
    }

    ret = csi_timer_set_timeout(timer_handle, timer_T);

    if (ret < 0) {
        return -1;
    }

    ret = csi_timer_start(timer_handle);

    if (ret < 0) {
        return -1;
    }

    if (ret < 0) {
        printf("csi_timer_uninitialize error\n");
        return -1;
    }

    return 0;
}
void GPIO_Init()
{
    pin1=csi_gpio_pin_initialize(PA1,NULL); //gpio_PWM motor top
    csi_gpio_pin_config_mode(pin1, GPIO_MODE_OPEN_DRAIN);
    csi_gpio_pin_config_direction(pin1, GPIO_DIRECTION_OUTPUT);	
	csi_gpio_pin_write(pin1,0);//low
	pin2=csi_gpio_pin_initialize(PA4,NULL); //gpio_PWM motor bottom
    csi_gpio_pin_config_mode(pin2, GPIO_MODE_OPEN_DRAIN);
    csi_gpio_pin_config_direction(pin2, GPIO_DIRECTION_OUTPUT);	
	csi_gpio_pin_write(pin2,0);//low
	 
    pin1_d1=csi_gpio_pin_initialize(PA3,NULL); //dir+
    csi_gpio_pin_config_mode(pin1_d1, GPIO_MODE_OPEN_DRAIN);
    csi_gpio_pin_config_direction(pin1_d1, GPIO_DIRECTION_OUTPUT);	
    csi_gpio_pin_write(pin1_d1,1);//HIGH
    pin1_d2=csi_gpio_pin_initialize(PA5,NULL); //dir-
    csi_gpio_pin_config_mode(pin1_d2, GPIO_MODE_OPEN_DRAIN);
    csi_gpio_pin_config_direction(pin1_d2, GPIO_DIRECTION_OUTPUT);	
    csi_gpio_pin_write(pin1_d2,0);//low
	
    pin2_d1=csi_gpio_pin_initialize(PA2,NULL); //dir+
    csi_gpio_pin_config_mode(pin2_d1, GPIO_MODE_OPEN_DRAIN);
    csi_gpio_pin_config_direction(pin2_d1, GPIO_DIRECTION_OUTPUT);	
    csi_gpio_pin_write(pin2_d1,1);//HIGH	
    pin2_d2=csi_gpio_pin_initialize(PA0,NULL); //dir-
    csi_gpio_pin_config_mode(pin2_d2, GPIO_MODE_OPEN_DRAIN);
    csi_gpio_pin_config_direction(pin2_d2, GPIO_DIRECTION_OUTPUT);	
    csi_gpio_pin_write(pin2_d2,0);//low	
	
}



int usart_init(void)
{
    int32_t ret;

    /* init the USART*/
    p_csi_usart = csi_usart_initialize(0, NULL);

    /* config the USART */
    ret = csi_usart_config(p_csi_usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    printf("************\n");
	printf("Welcome to motor controlling system\n");
	printf("************\n");
	printf("Menu\n");
	printf("enter 'xxxxxx' to turn angle  \n");
	printf("first bit is direction: '+' is clockwise \n");
	printf("last bit is motor loc: '1' is bottom \n");
	printf("middle four bits is angle: 00000~9999 \n");
    printf("eg: +10001 represents bottom motor turns 1000 uint angles in clockwise \n");
			
	
    return 0;
}

//正值顺时针，负值逆时针，顺逆时针方向自定义
//loc是电机标号，num=0~9999 num和角度对应关系(近似线性)由于未闭环需要实测
int32_t move_speed=1000;
void change_angle(int32_t num,uint8_t loc)
{
	int count_pulse=0;	
	if(loc==motor1)
	{
		//确定方向
		if(num<0)//逆时针
		{
			csi_gpio_pin_write(pin1_d1,1);
			csi_gpio_pin_write(pin1_d2,0);	
			num=-num;
		}
		else
		{
			csi_gpio_pin_write(pin1_d1,0);
			csi_gpio_pin_write(pin1_d2,1);				
		}
		//产生固定数脉冲
		while(count_pulse<=num)
		{  
			 csi_gpio_pin_write(pin1,1);//high
			 udelay(move_speed);
			 csi_gpio_pin_write(pin1,0);//low
			 udelay(move_speed);
			 count_pulse++;
		}
	}
	else
	{
		if(num<0)//逆时针
		{
			csi_gpio_pin_write(pin2_d1,1);
			csi_gpio_pin_write(pin2_d2,0);	
			num=-num;
		}
		else
		{
			csi_gpio_pin_write(pin2_d1,0);
			csi_gpio_pin_write(pin2_d2,1);			
		}

		while(count_pulse<=num)
		{  
			 csi_gpio_pin_write(pin2,1);//high
			 udelay(move_speed);//100 us
			 csi_gpio_pin_write(pin2,0);//low
			 udelay(move_speed);
			 count_pulse++;
		}	
	}
	
}


int32_t aim_degree=0;//目标旋转角度
uint8_t aim_loc;//目标电机
uint8_t flag=0;//控制位
int16_t top_loc=0;
int16_t bottom_loc=0;
int main(void)
{

	GPIO_Init();
  	timer_init(1,500000);
	usart_init();
	//IIC_init();
	//MPU6050_Init();
	OLED_Init();
	OLED_P6x8Str(45,0,(uint8_t *)"Welcome!");
	OLED_P6x8Str(20,1,(uint8_t *)"top_loc=");
	OLED_P6x8Str(20,2,(uint8_t *)"bot_loc=");	
	OLED_P6x8Str(20,3,(uint8_t *)"tim_cnt=");	
    //循环进行：读取串口是否有数据->有数据进行解算、控制电机旋转->标志清零
	while(1)
	{			
			OLED_Print_Num1(70,1,top_loc);
			OLED_Print_Num1(70,2,bottom_loc);
			OLED_Print_Num1(70,3,timer_counter);
			usart_receive_sync(p_csi_usart,&data_rev,6);
			if(data_rev[0]!='\0')
			 {	
				//把接收到的数据回传过去并换行，然后终止接收
				usart_send_sync(p_csi_usart,data_rev,sizeof(data_rev));
				printf("\n");
				csi_usart_abort_receive(p_csi_usart);

				//计算目标旋转角度和目标电机
				aim_degree=(data_rev[1]-0x30)*1000+(data_rev[2]-0x30)*100+(data_rev[3]-0x30)*10+(data_rev[4]-0x30)*1;
				
				if(data_rev[0]=='-') aim_degree=-aim_degree;
				else if(data_rev[0]=='+') aim_degree=aim_degree;
				else  aim_degree=0;
				aim_loc=data_rev[5]-0x30;
				flag=1;
				//data_rev清零
				int i=0;
				while(i<10) {data_rev[i]='\0';i++;}					 
			 }	 
		if(flag)
		{   
			//旋转和复位
			change_angle(aim_degree,aim_loc);
			if(aim_loc==1)  //top_motor
			    top_loc+=aim_degree;
			else
				bottom_loc+=aim_degree;
			flag=0;
			aim_degree=0;
		}

	}
	return 0;
}
