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

/******************************************************************************
 * @file     user_gpio.c
 * @brief    user function prototype for gpio in wujian100
 * @version  V1.0
 * @date     6. Apr. 2020
 ******************************************************************************/

#include "user_gpio.h"

/******************************************************************************
 * @brief    gpio interrupt call back function prototype for wujian100
 * @version  V1.0
 * @date     7. Apr. 2020
 * @author   Jiayi
 * @return   None
 ******************************************************************************/
volatile static bool int_flag = 1;

static void gpio_interrupt_handler(int32_t idx)
{
    int_flag = 0;
}

/******************************************************************************
 * @brief    gpio init function prototype for wujian100
 * @param[in] gpio_pin       gpio pin name to operate.
 * @version  V1.0
 * @date     7. Apr. 2020
 * @author   Jiayi
 * @return   Error code
 ******************************************************************************/
int32_t user_gpio_init_output(pin_name_e gpio_pin)
{
    int32_t ret = 0;

    /*clear gpio pin handler*/
    gpio_pin_handle_t pin = NULL;

    /*De-Initialize gpio pin handler*/
    csi_gpio_pin_uninitialize(pin);

    /*Initialize gpio pin handler*/
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);

    /* Set gpio pin mode
    * 
    * @GPIO_MODE_PULLNONE         = 0,    ///< pull none for input
    * @GPIO_MODE_PULLUP,                  ///< pull up for input
    * @GPIO_MODE_PULLDOWN,                ///< pull down for input
    * @GPIO_MODE_OPEN_DRAIN,              ///< open drain mode for output
    * @GPIO_MODE_PUSH_PULL,               ///< push-pull mode for output
    * 
    */
    ret = csi_gpio_pin_config_mode(pin, GPIO_MODE_PUSH_PULL);
    if (ret < 0)
        return -1;

    /* set gpio pin direction
    *
    * @GPIO_DIRECTION_INPUT             = 0,    ///< gpio as input
    * @GPIO_DIRECTION_OUTPUT,                   ///< gpio as output
    * 
    */
	ret = csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_OUTPUT);
    if (ret < 0)
        return -1;
    
    return 0;
}

/******************************************************************************
 * @brief    gpio init function prototype for wujian100
 * @param[in]gpio_pin       gpio pin name to operate.
 * @version  V1.0
 * @date     7. Apr. 2020
 * @author   Jiayi
 * @return   Error code
 ******************************************************************************/
int32_t user_gpio_init_input(pin_name_e gpio_pin)
{
    int32_t ret = 0;

    /*clear gpio pin handler*/
    gpio_pin_handle_t pin = NULL;

    /*Initialize gpio pin handler*/
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);

    /* Set gpio pin mode
    * 
    * @GPIO_MODE_PULLNONE         = 0,    ///< pull none for input
    * @GPIO_MODE_PULLUP,                  ///< pull up for input
    * @GPIO_MODE_PULLDOWN,                ///< pull down for input
    * @GPIO_MODE_OPEN_DRAIN,              ///< open drain mode for output
    * @GPIO_MODE_PUSH_PULL,               ///< push-pull mode for output
    * 
    */
    ret = csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLUP);
    if (ret < 0)
        return -1;

    /* set gpio pin direction
    *
    * @GPIO_DIRECTION_INPUT             = 0,    ///< gpio as input
    * @GPIO_DIRECTION_OUTPUT,                   ///< gpio as output
    * 
    */
	ret = csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    if (ret < 0)
        return -1;
    
    return 0;
}

/******************************************************************************
 * @brief    set paticular pin function prototype for wujian100
 * @version  V1.0
 * @date     7. Apr. 2020
 * @author   Jiayi
 * @return   none
 ******************************************************************************/
void user_gpio_setpin(pin_name_e gpio_pin)
{
    /*clear gpio pin handler*/
    gpio_pin_handle_t pin = NULL;

    /*Initialize gpio pin handler*/
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);

	csi_gpio_pin_write(pin, 1);
}

/******************************************************************************
 * @brief    reset paticular pin function prototype for wujian100
 * @version  V1.0
 * @date     7. Apr. 2020
 * @author   Jiayi
 * @return   none
 ******************************************************************************/
void user_gpio_resetpin(pin_name_e gpio_pin)
{
    /*clear gpio pin handler*/
    gpio_pin_handle_t pin = NULL;

    /*Initialize gpio pin handler*/
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);

	csi_gpio_pin_write(pin, 0);
}

/******************************************************************************
 * @brief    read paticular pin function prototype for wujian100
 * @param[in]gpio_pin       gpio pin name to operate.
 * @author   Jiayi
 * @return   error code or read value
 * @note     Make sure to config port as input port
 ******************************************************************************/
int32_t user_gpio_readpin(pin_name_e gpio_pin)
{
    bool val;
    int32_t ret;

    /*clear gpio pin handler*/
    gpio_pin_handle_t pin = NULL;

    /*Initialize gpio pin handler*/
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);

    /*read value from pin*/
    ret = csi_gpio_pin_read(pin, &val);

    if(ret < 0){
        return -1;
    }
    else{
        return val;
    }
}
