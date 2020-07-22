


#ifndef _IIC_h
#define _IIC_h



#include "stdio.h"
#include "soc.h"
#include "drv_gpio.h"
#include "pin_name.h"
#include "pin.h"
	 



typedef enum IIC       //DAC模块
{
    IIC,
    SCCB
} IIC_type;



void  IIC_start(void);
void  IIC_stop(void);
void  IIC_ack_main(uint8_t ack_main);
void  send_ch(uint8_t c);
uint8_t read_ch(void);
void  simiic_write_reg(uint8_t dev_add, uint8_t reg, uint8_t dat);
uint8_t simiic_read_reg(uint8_t dev_add, uint8_t reg, IIC_type type);
void  simiic_read_regs(uint8_t dev_add, uint8_t reg, uint8_t *dat_add, uint8_t num, IIC_type type);
void  IIC_init(void);












#endif

