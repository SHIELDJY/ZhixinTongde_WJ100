#include "imu.h"



extern void mdelay(uint32_t ms);






#define Gyro_Parameter 0.0174532925   //  1sec/s =  Gyro_Parameter *  rad/s


/*************获取原始数据*************/
float Angle,Gyro_Speed,Gyro_Speed_X=0;
void Get_Attitude()
{
	  MPU6050_GetData();
}
/*************根据原始数据解算角度和角速度*************/
void Angle_Calculate()
{
	Get_Attitude();

    Angle= (float) mpu_acc_z/4096;
	Gyro_Speed= -(float)((float)mpu_gyro_y*2000/(32768) )*(float)Gyro_Parameter;
	//SendTwo_int16_t(Angle*10,Gyro_Speed*100);
	Gyro_Speed_X=-(float)((float)mpu_gyro_x*2000/(32768) )*(float)Gyro_Parameter;
	Kalman_Filter();//卡尔曼滤波
}

/**************卡尔曼滤波******************/
const float      dt = 0.005;
const float Q_angle = 0.0005;                 //角度方差
float       Q_gyro  = 0.000003;               //角速度方差
float       R_angle = 0.02;                   //测量噪声的方差
const char  C_0     = 1;
float q_bias = 0;                             //角速度偏差
float angle_err;                              //角度偏差
float PCt_0, PCt_1, E, K_0, K_1, t_0, t_1;
float Pdot[4] = {0,0,0,0};
float P[2][2] = {{ 1, 0 },{ 0, 1 }};

float Angle_kalman,Angle_dot,Last_Angle_kalman;
void Kalman_Filter(void)  //欲求z轴角度值，输入z轴角度和与其变化方向一致的角加速度
{
    float  gyro_m,angle_m;

    gyro_m = Gyro_Speed;       //负号保证角加速度和角度变化一致
    angle_m = Angle;
    Angle_kalman += (gyro_m - q_bias) * dt; //角加速度积分


    Pdot[0]=Q_angle - P[0][1] - P[1][0];
    Pdot[1]= -P[1][1];
    Pdot[2]= -P[1][1];
    Pdot[3]=Q_gyro;

    P[0][0] += Pdot[0] * dt;
    P[0][1] += Pdot[1] * dt;
    P[1][0] += Pdot[2] * dt;
    P[1][1] += Pdot[3] * dt;

    angle_err = angle_m - Angle_kalman; //先验估计

    PCt_0 = C_0 * P[0][0];
    PCt_1 = C_0 * P[1][0];

    E = R_angle + C_0 * PCt_0;

    K_0 = PCt_0 / E;
    K_1 = PCt_1 / E;

    t_0 = PCt_0;
    t_1 = C_0 * P[0][1];

    P[0][0] -= K_0 * t_0;
    P[0][1] -= K_0 * t_1;
    P[1][0] -= K_1 * t_0;
    P[1][1] -= K_1 * t_1;

    Angle_kalman += K_0 * angle_err;
    q_bias += K_1 * angle_err;
    Angle_dot = gyro_m - q_bias;
}

/****************************   mpu6050 dataget  ********************************/
int16_t mpu_acc_x,mpu_acc_y,mpu_acc_z;
int16_t mpu_gyro_x,mpu_gyro_y,mpu_gyro_z;

void MPU6050_Init(void)
{
    //MPU9150复位
    simiic_write_reg(MPU6050_ADDRESS,PWR_MGMT_1,0X08);
    mdelay(50);
    
    //配置芯片时钟源
    simiic_write_reg(MPU6050_ADDRESS,PWR_MGMT_1,0X03);
    
    //采样率1kHz
    simiic_write_reg(MPU6050_ADDRESS,SMPLRT_DIV,0X00);
    
    //低通滤波器截止频率20Hz
    simiic_write_reg(MPU6050_ADDRESS,CONFIG,0X04);
    
    //陀螺仪量程设定 +-2000度
    simiic_write_reg(MPU6050_ADDRESS,GYRO_CONFIG,0X18);
    
    //加速度值量程设定 +-8g
    simiic_write_reg(MPU6050_ADDRESS,ACCEL_CONFIG,0X10);
    
 
}

void MPU6050_GetData(void)
{

	  uint8_t mpu1_data[14];
    
    mpu1_data[4] = simiic_read_reg(MPU6050_ADDRESS,ACCEL_XOUT_H + 4,IIC);    //Z向加速度
    mpu1_data[5] = simiic_read_reg(MPU6050_ADDRESS,ACCEL_XOUT_H + 5,IIC);
    mpu1_data[8] = simiic_read_reg(MPU6050_ADDRESS,ACCEL_XOUT_H + 8,IIC);    //X向角加速度
    mpu1_data[9] = simiic_read_reg(MPU6050_ADDRESS,ACCEL_XOUT_H + 9,IIC);
    mpu1_data[10] = simiic_read_reg(MPU6050_ADDRESS,ACCEL_XOUT_H + 10,IIC);  //Y向角加速度
    mpu1_data[11] = simiic_read_reg(MPU6050_ADDRESS,ACCEL_XOUT_H + 11,IIC);
    
    

	
	/*Byte0-Byte5为加速度计数据*/
	mpu_acc_z = ((int16_t)mpu1_data[4]<<8) | mpu1_data[5];
	
	/*Byte8-Byte13为加速度计数据*/
	mpu_gyro_x = ((int32_t)mpu1_data[8]<<8)  | mpu1_data[9];
	mpu_gyro_y = ((int32_t)mpu1_data[10]<<8) | mpu1_data[11];
	
}










