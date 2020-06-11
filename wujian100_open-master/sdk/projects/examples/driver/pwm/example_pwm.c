/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_pwm.c
 * @brief    the main function for the PWM driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_pwm.h"
#include "stdio.h"
#include "soc.h"
#include <pin.h>

extern void mdelay(uint32_t ms);

void example_pin_pwm_init(void)
{
    drv_pinmux_config(EXAMPLE_PWM_CH, EXAMPLE_PWM_CH_FUNC);
}

int32_t  pwm_signal_test(uint32_t pwm_idx, uint8_t pwm_ch)
{
    int32_t ret;
    pwm_handle_t pwm_handle;

    example_pin_pwm_init();

    pwm_handle = csi_pwm_initialize(pwm_idx);

    if (pwm_handle == NULL) {
        printf("csi_pwm_initialize error\n");
        return -1;
    }


    ret = csi_pwm_config(pwm_handle, pwm_ch, 2000, 1000);

    if (ret < 0) {
        printf("csi_pwm_config error\n");
        return -1;
    }

    csi_pwm_stop(pwm_handle, pwm_ch);

    while(1)
	{
		uint32_t counter_pwm_start=0,counter_pwm_stop=0;
		
		csi_pwm_start(pwm_handle, pwm_ch);
		drv_pwm_timer_get_current_value(pwm_handle,pwm_ch,&counter_pwm);
		while()
		
		
		
		
	}

    return 0;

}

int example_pwm(uint32_t pwm_idx, uint8_t pwm_pin)
{
    int32_t ret;
    ret = pwm_signal_test(pwm_idx, pwm_pin);

    if (ret < 0) {
        printf("pwm_signal_test error\n");
        return -1;
    }

    printf("pwm_signal_test OK\n");

    return 0;
}

int main(void)
{
	
	
	
    return example_pwm(0, 0);
}
