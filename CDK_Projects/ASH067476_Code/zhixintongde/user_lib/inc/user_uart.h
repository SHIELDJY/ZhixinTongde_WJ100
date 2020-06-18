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
 * @file     user_uart.h
 * @brief    header file for uart driver
 * @version  V1.0
 * @date     08. Apr. 2020
*/

#ifndef _USER_UART_H_
#define _USER_UART_H_

#include <stdio.h>
#include "soc.h"
#include "drv_usart.h"
#include "pin_name.h"
#include "pin.h"

#ifdef __cplusplus
extern "C" {
#endif
/**
 * \brief      UART init function prototype for wujian100
 * \param[in]  baud_rate    baud rate to configure uart to, must be 9600, 115200, etc
 * \return     Error code
 */
static int32_t user_usart_init(int32_t baud_rate);
/**
 * \brief      UART asycronous recieve function prototype for wujian100
 * \param[in]  num       data length.
 * \param[out] data      data buffer to store message to.
 * \return     Error code
 */
static int32_t usart_receive_async(void *data, uint32_t num);
/**
 * \brief      UART asycronous send function prototype for wujian100
 * \param[in]  num       data length.
 * \param[out] data      data buffer to send message from.
 * \return     Error code
 */
static int32_t usart_send_async(const void *data, uint32_t num);
/**
 * \brief      UART interrupt event call back function prototype for wujian100
 * \param[in]  event   event type.
 * \return     None
 */
static void usart_event_cb(int32_t idx, uint32_t event);
/**
 * \brief      UART interrupt query call back function prototype for wujian100
 * \param[in]  idx     usart port to operate.
 * \param[in]  event   event type.
 * \return     None
 */
static void usart_event_cb_query(int32_t idx, uint32_t event);
/**
 * \brief      example for uart receive waiting function
 * \param[in]  None
 * \return     None
 */
static int32_t usart_wait_reply_async(void);

#ifdef __cplusplus
}
#endif

#endif /* _USER_UART_H_ */