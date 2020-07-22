


#include "IIC.h"


gpio_pin_handle_t I2C_SDA = NULL;
gpio_pin_handle_t I2C_SCL = NULL;


bool SDA_READ()
{
	bool value=0;
	csi_gpio_pin_read (I2C_SDA,&value);
	return value;
	
}


#define SDA             SDA_READ()
#define SDA0()          csi_gpio_pin_write(I2C_SDA,0)		//IO口输出低电平
#define SDA1()          csi_gpio_pin_write(I2C_SDA,1)		//IO口输出高电平  
#define SCL0()          csi_gpio_pin_write(I2C_SCL,0)		//IO口输出低电平
#define SCL1()          csi_gpio_pin_write(I2C_SCL,1)		//IO口输出高电平
#define DIR_OUT()       csi_gpio_pin_config_direction (I2C_SDA,GPIO_DIRECTION_OUTPUT)     //输出方向
#define DIR_IN()        csi_gpio_pin_config_direction (I2C_SDA,GPIO_DIRECTION_INPUT)      //输入方向


//内部数据定义
uint8_t IIC_ad_main; //器件从地址	    
uint8_t IIC_ad_sub;  //器件子地址	   
uint8_t *IIC_buf;    //发送|接收数据缓冲区	    
uint8_t IIC_num;     //发送|接收数据个数	     

#define ack 1      //主应答
#define no_ack 0   //从应答	 



//-------------------------------------------------------------------------------------------------------------------
//  @brief      模拟IIC延时
//  @return     void						
//  @since      v1.0
//  Sample usage:				如果IIC通讯失败可以尝试增加j的值
//-------------------------------------------------------------------------------------------------------------------
void simiic_delay(void)
{
	//64为100K的速率(bus频率为100M)
	//特别提示OV7725的通信速率不能太高，最好50K左右，j设置为120通信速率为60K，60K的时候可以正常通信
	//其他IIC器件一般可以400K的通信速率
	uint16_t j=10;
	while(j--);
}


//内部使用，用户无需调用
void IIC_start(void)
{
	SDA1();
	SCL1();
	simiic_delay();
	SDA0();
	simiic_delay();
	SCL0();
}

//内部使用，用户无需调用
void IIC_stop(void)
{
	SDA0();
	SCL0();
	simiic_delay();
	SCL1();
	simiic_delay();
	SDA1();
	simiic_delay();
}

//主应答(包含ack:SDA=0和no_ack:SDA=0)
//内部使用，用户无需调用
void I2C_SendACK(unsigned char ack_dat)
{
    SCL0();
	simiic_delay();
	if(ack_dat) SDA0();
    else    	SDA1();

    SCL1();
    simiic_delay();
    SCL0();
    simiic_delay();
}


static int SCCB_WaitAck(void)
{
    SCL0();
	DIR_IN();
	simiic_delay();
	
	SCL1();
    simiic_delay();
	
    if(SDA)           //应答为高电平，异常，通信失败
    {
        DIR_OUT();
        SCL0();
        return 0;
    }
    DIR_OUT();
    SCL0();
	simiic_delay();
    return 1;
}

//字节发送程序
//发送c(可以是数据也可是地址)，送完后接收从应答
//不考虑从应答位
//内部使用，用户无需调用
void send_ch(uint8_t c)
{
	uint8_t i = 8;
    while(i--)
    {
        if(c & 0x80)	SDA1();//SDA 输出数据
        else			SDA0();
        c <<= 1;
        simiic_delay();
        SCL1();                //SCL 拉高，采集信号
        simiic_delay();
        SCL0();                //SCL 时钟线拉低
    }
	SCCB_WaitAck();
}

//字节接收程序
//接收器件传来的数据，此程序应配合|主应答函数|使用
//内部使用，用户无需调用
uint8_t read_ch1(uint8_t ack_x)
{
    uint8_t i;
    uint8_t c;
    c=0;
    SCL0();
    simiic_delay();
    SDA1();             
    DIR_IN();           //置数据线为输入方式
    for(i=0;i<8;i++)
    {
        simiic_delay();
        SCL0();         //置时钟线为低，准备接收数据位
        simiic_delay();
        SCL1();         //置时钟线为高，使数据线上数据有效
        simiic_delay();
        c<<=1;
        if(SDA) 
        {
            c+=1;   //读数据位，将接收的数据存c
        }
    }
    DIR_OUT();
	SCL0();
	simiic_delay();
	I2C_SendACK(ack_x);
	
    return c;
}

//字节接收程序
//接收器件传来的数据，此程序应配合|主应答函数|IIC_ack_main()使用
//内部使用，用户无需调用
uint8_t read_ch(void)
{
    uint8_t i;
    uint8_t c;
    c=0;
    SCL0();
    simiic_delay();
    SDA1();             //置数据线为输入方式
    DIR_IN();
    for(i=0;i<8;i++)
    {
        simiic_delay();
        SCL0();         //置时钟线为低，准备接收数据位
        simiic_delay();
        SCL1();         //置时钟线为高，使数据线上数据有效
        simiic_delay();
        c<<=1;
        if(SDA) c+=1;   //读数据位，将接收的数据存c
    }
    DIR_OUT();
	SCL0();
	simiic_delay();
	I2C_SendACK(no_ack);
	
    return c;
}

//-------------------------------------------------------------------------------------------------------------------
//  @brief      模拟IIC写数据到设备寄存器函数
//  @param      dev_add			设备地址(低七位地址)
//  @param      reg				寄存器地址
//  @param      dat				写入的数据
//  @return     void						
//  @since      v1.0
//  Sample usage:				
//-------------------------------------------------------------------------------------------------------------------
void simiic_write_reg(uint8_t dev_add, uint8_t reg, uint8_t dat)
{
	IIC_start();
    send_ch( (dev_add<<1) | 0x00);   //发送器件地址加写位
	send_ch( reg );   				 //发送从机寄存器地址
	send_ch( dat );   				 //发送需要写入的数据
	IIC_stop();
}


//-------------------------------------------------------------------------------------------------------------------
//  @brief      模拟IIC从设备寄存器读取数据
//  @param      dev_add			设备地址(低七位地址)
//  @param      reg				寄存器地址
//  @param      type			选择通信方式是IIC  还是 SCCB
//  @return     uint8_t			返回寄存器的数据			
//  @since      v1.0
//  Sample usage:				
//-------------------------------------------------------------------------------------------------------------------
uint8_t simiic_read_reg(uint8_t dev_add, uint8_t reg, IIC_type type)
{
	uint8_t dat;
	IIC_start();
    send_ch( (dev_add<<1) | 0x00);  //发送器件地址加写位
	send_ch( reg );   				//发送从机寄存器地址
	if(type == SCCB)IIC_stop();
	
	IIC_start();
	send_ch( (dev_add<<1) | 0x01);  //发送器件地址加读位
	dat = read_ch();   				//发送需要写入的数据
	IIC_stop();
	
	return dat;
}

//-------------------------------------------------------------------------------------------------------------------
//  @brief      模拟IIC读取多字节数据
//  @param      dev_add			设备地址(低七位地址)
//  @param      reg				寄存器地址
//  @param      dat_add			数据保存的地址指针
//  @param      num				读取字节数量
//  @param      type			选择通信方式是IIC  还是 SCCB
//  @return     uint8_t			返回寄存器的数据			
//  @since      v1.0
//  Sample usage:				
//-------------------------------------------------------------------------------------------------------------------
void simiic_read_regs(uint8_t dev_add, uint8_t reg, uint8_t *dat_add, uint8_t num, IIC_type type)
{
	IIC_start();
    send_ch( (dev_add<<1) | 0x00);  //发送器件地址加写位
	send_ch( reg );   				//发送从机寄存器地址
	if(type == SCCB)IIC_stop();
	
	IIC_start();
	send_ch( (dev_add<<1) | 0x01);  //发送器件地址加读位
    while(--num)
    {
        *dat_add = read_ch1(ack); //读取数据
        dat_add++;
    }
    *dat_add = read_ch1(no_ack); //读取数据
	IIC_stop();
}

//-------------------------------------------------------------------------------------------------------------------
//  @brief      模拟IIC端口初始化
//  @param      NULL
//  @return     void	
//  @since      v1.0
//  Sample usage:				
//-------------------------------------------------------------------------------------------------------------------
void IIC_init(void)
{
	
	I2C_SDA=csi_gpio_pin_initialize(PA1,NULL); //gpio_PWM motor top
    csi_gpio_pin_config_mode(I2C_SDA, GPIO_MODE_OPEN_DRAIN);
    csi_gpio_pin_config_direction(I2C_SDA, GPIO_DIRECTION_OUTPUT);	
	csi_gpio_pin_write(I2C_SDA,1);//low
	
	I2C_SCL=csi_gpio_pin_initialize(PA1,NULL); //gpio_PWM motor top
    csi_gpio_pin_config_mode(I2C_SCL, GPIO_MODE_OPEN_DRAIN);
    csi_gpio_pin_config_direction(I2C_SCL, GPIO_DIRECTION_OUTPUT);	
	csi_gpio_pin_write(I2C_SCL,1);//low	
	

}

