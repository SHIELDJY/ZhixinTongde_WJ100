/******************************************************************************
* Copyright 2020 Li Jiayi
*
*Licensed under the Apache License, Version 2.0 (the "License");
*you may not use this file except in compliance with the License.
*You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
*Unless required by applicable law or agreed to in writing, software
*distributed under the License is distributed on an "AS IS" BASIS,
*WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*See the License for the specific language governing permissions and
*limitations under the License.
******************************************************************************/

/**
 * @file     user_gpio.h
 * @brief    header file for gpio driver
 * @version  V1.0
 * @date     06. Apr. 2020
*/

#ifndef _USER_GPIO_H_
#define _USER_GPIO_H_

#include <stdio.h>
#include "soc.h"
#include "pin_name.h"
#include "drv_gpio.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief    gpio init function prototype for wujian100
 * @param[in]gpio_pin       gpio pin name to operate.
 * @return   Error code
*/
int32_t user_gpio_init_output(pin_name_e gpio_pin);

/**
 * @brief    gpio init function prototype for wujian100
 * @param[in]gpio_pin       gpio pin name to operate.
 * @return   Error code
*/
int32_t user_gpio_init_input(pin_name_e gpio_pin);

/**
 * @brief    set paticular pin function prototype for wujian100
 * @return   none
*/
void user_gpio_setpin(pin_name_e gpio_pin);

/**
 * @brief    reset paticular pin function prototype for wujian100
 * @return   none
*/
void user_gpio_resetpin(pin_name_e gpio_pin);

/**
 * @brief    read paticular pin function prototype for wujian100
 * @param[in]gpio_pin       gpio pin name to operate.
 * @return   error code or read value
 * @note     Make sure to config port as input port
*/
int32_t user_gpio_readpin(pin_name_e gpio_pin);


#ifdef __cplusplus
}
#endif

#endif /* _USER_GPIO_H_ */
