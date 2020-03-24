/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_gpio.c
 * @brief    the main function for the GPIO driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include <stdio.h>
#include "soc.h"
#include "drv_gpio.h"
#include "pin_name.h"
#include "pin.h"

#define time  1000000


volatile static bool int_flag = 1;

static void gpio_interrupt_handler(int32_t idx)
{
    int_flag = 0;
}

void example_pin_gpio_init(void)
{
    drv_pinmux_config(EXAMPLE_GPIO_PIN, EXAMPLE_GPIO_PIN_FUNC);
}

//void gpio_falling_edge_interrupt(pin_name_e gpio_pin)
//{
//    gpio_pin_handle_t pin = NULL;
//
//    example_pin_gpio_init();
//
//    printf("please change the gpio pin %s from high to low\r\n", EXAMPLE_BOARD_GPIO_PIN_NAME);
//    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);
//
//    csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
//    csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
//    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
//
//    while (int_flag);
//
//    int_flag = 1;
//    csi_gpio_pin_uninitialize(pin);
//    printf("gpio falling_edge test passed!!!\n");
//    printf("test gpio successfully\n");
//}

void gpio_set_pin(pin_name_e gpio_pin)
{
	gpio_pin_handle_t pin = NULL;
	
	example_pin_gpio_init();
	pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);
	
	csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLUP);
	csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_OUTPUT);
	
	csi_gpio_pin_write(pin, 1);
}

void gpio_reset_pin(pin_name_e gpio_pin)
{
	gpio_pin_handle_t pin = NULL;
	
	example_pin_gpio_init();
	pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);
	
	csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLUP);
	csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_OUTPUT);
	
	csi_gpio_pin_write(pin, 0);
}

int user_delay(uint32_t delay_time)
{
	uint32_t i = delay_time;
	while(i!=0) i--;
	return 0;
}

/*****************************************************************************
test_gpio: main function of the gpio test

INPUT: NULL

RETURN: NULL

*****************************************************************************/
int example_gpio(pin_name_e gpio_pin)
{
    gpio_set_pin(gpio_pin);
    return 0;
}

int main(void)
{
	uint32_t i=time;
	printf("LED Blinking\n");
	while(1)
	{
//		i = time;
//		while(i!=0) i--;
		
		gpio_set_pin(PA1);//LED D1 single
		gpio_set_pin(PA2);//LED D2 PA2 and PA4 are in serial connection to control LD2
		gpio_set_pin(PA4);//LED D2
		gpio_set_pin(PA3);//LED D3 PA3 and PA5 are in serial connection to control LD3
		gpio_set_pin(PA5);//LED D3
		gpio_set_pin(PA9);//LED D4
		gpio_set_pin(PA7);//LED D5 PA7 and PA8 are in serial connection to control LD5
		gpio_set_pin(PA8);//LED D5
		gpio_set_pin(PA12);//LED D6
		gpio_set_pin(PA13);//LED D7
		gpio_set_pin(PA14);//LED D8
		gpio_set_pin(PA15);//LED D9
		
		i = time;
		while(i) i--;
		
		gpio_reset_pin(PA1);
		gpio_reset_pin(PA2);
		gpio_reset_pin(PA4);
		gpio_reset_pin(PA3);
		gpio_reset_pin(PA5);
		gpio_reset_pin(PA9);//LED D4
		gpio_reset_pin(PA7);
		gpio_reset_pin(PA8);
		gpio_reset_pin(PA12);//LED D6
		gpio_reset_pin(PA13);//LED D7
		gpio_reset_pin(PA14);
		gpio_reset_pin(PA15);
			
		
	}

	return 0;
}
