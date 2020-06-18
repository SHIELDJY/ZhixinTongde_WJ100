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
 * @file     user_uart.c
 * @brief    user function prototype for uart in wujian100
 * @version  V1.0
 * @date     08. Apr. 2020
 ******************************************************************************/

#include "user_uart.h"

/*Global Variables*/
static volatile uint8_t rx_async_flag = 0;
static volatile uint8_t tx_async_flag = 0;
static volatile uint8_t rx_trigger_flag = 0;
usart_handle_t g_usart_handle;

/*Function Prototype*/

/******************************************************************************
 * @brief      UART init function prototype for wujian100
 * @param[in]  baud_rate    baud rate to configure uart to, must be 9600, 115200, etc
 * @author     Jiayi
 * @return     Error code
 ******************************************************************************/
static int32_t user_usart_init(int32_t baud_rate)
{
    usart_handle_t usart;
    int32_t uart_idx;
	int32_t ret = 0;

    /*de-initialize*/
    csi_usart_uninitialize(usart);

    /*initialize usart handler*/
    usart = csi_usart_initialize(uart_idx, (usart_event_cb_t)usart_event_cb);

    g_usart_handle = usart;

    /*error code and message*/
    if (usart == NULL) {
        printf("csi_usart_config error\n");
        return -1;
    }

    g_usart_handle = usart;
    
    /*configure usart*/
    ret = csi_usart_config(usart, baud_rate, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    /*error code and message*/
    if (ret < 0) {
        printf("csi_usart_config error %x\n", ret);
        return -1;
    }

    printf("Welcome! UART has been successfully configured to\n baud rate %d\nMode Asychronous\n", baud_rate);

    return 0;
}

/******************************************************************************
 * @brief      UART asycronous recieve function prototype for wujian100
 * @param[in]  num       data length.
 * @param[out] data      data buffer to store message to.
 * @author     Jiayi
 * @return     Error code
 ******************************************************************************/
static int32_t usart_receive_async(void *data, uint32_t num)
{
    usart_handle_t usart;
    int32_t uart_idx;
    
    int time_out = 0x7fffff;
    rx_async_flag = 0;

    /*initialize usart handler*/
    usart = csi_usart_initialize(uart_idx, (usart_event_cb_t)usart_event_cb);

    csi_usart_receive(usart, data, num);

    while (time_out) {
        time_out--;

        if (rx_async_flag == 1) {
            break;
        }
    }

    if (0 == time_out) {
        return -1;
    }

    rx_async_flag = 0;
    return 0;
}

/******************************************************************************
 * @brief      UART asycronous send function prototype for wujian100
 * @param[in]  num       data length.
 * @param[out] data      data buffer to send message from.
 * @author     Jiayi
 * @return     Error code
 ******************************************************************************/
static int32_t usart_send_async(const void *data, uint32_t num)
{
    usart_handle_t usart;
    int32_t uart_idx;

    int time_out = 0x7ffff;
    tx_async_flag = 0;

    /*initialize usart handler*/
    usart = csi_usart_initialize(uart_idx, (usart_event_cb_t)usart_event_cb);

    csi_usart_send(usart, data, num);

    while (time_out) {
        time_out--;

        if (tx_async_flag == 1) {
            break;
        }
    }

    if (0 == time_out) {
        return -1;
    }

    tx_async_flag = 0;
    return 0;
}

/******************************************************************************
 * @brief      UART interrupt event call back function prototype for wujian100
 * @param[in]  idx     usart port to operate.
 * @param[in]  event   event type.
 * @author     Jiayi
 * @return     None
 ******************************************************************************/
static void usart_event_cb(int32_t idx, uint32_t event)
{
    uint8_t g_data[15];


    switch (event) {
        case USART_EVENT_SEND_COMPLETE:
            tx_async_flag = 1;
            break;

        case USART_EVENT_RECEIVE_COMPLETE:
            rx_async_flag = 1;
            break;

        case USART_EVENT_RECEIVED:
            csi_usart_receive_query(g_usart_handle, g_data, 15);

        default:
            break;
    }
}

/******************************************************************************
 * @brief      example for uart receive waiting function
 * @param[in]  None
 * @author     Jiayi
 * @return     None
 ******************************************************************************/
static void usart_event_cb_query(int32_t idx, uint32_t event)
{
    uint8_t g_data[15];
    uint8_t ret;

    switch (event) {
        case USART_EVENT_SEND_COMPLETE:
            tx_async_flag = 1;
            break;

        case USART_EVENT_RECEIVE_COMPLETE:
            rx_async_flag = 1;
            break;

        case USART_EVENT_RECEIVED:
            ret = csi_usart_receive_query(g_usart_handle, g_data, 15);
            csi_usart_send(g_usart_handle, g_data, ret);
            rx_trigger_flag = 1;
            break;

        default:
            break;
    }
}

/******************************************************************************
 * @brief      example for uart receive waiting function
 * @param[in]  idx     usart port to operate.
 * @param[in]  event   event type.
 * @author     Jiayi
 * @return     None
 ******************************************************************************/
static int32_t usart_wait_reply_async(void)
{
    usart_handle_t usart;
    int32_t uart_idx;

    volatile uint32_t i;
    uint8_t ch;
    char answer[20];

    /*initialize usart handler*/
    usart = csi_usart_initialize(uart_idx, (usart_event_cb_t)usart_event_cb);

    /*Clear buffer*/
    for (i = 0; i < 20; i++) {
        answer[i] = '\0';
    }

    i = 0;

    while (i < 20) {
        if (0 == usart_receive_async(&ch, 1)) {
            if (ch == '\n' || ch == '\r') {
                answer[i] = '\0';
                break;
            }

            if (ch == 127 || ch == '\b') {
                if (i > 0) {
                    i--;
                    usart_send_async(&ch, 1);
                }
            } else {
                answer[i++] = ch;
                usart_send_async(&ch, 1);
            }
        }
    }

    if ((i == 1) && (answer[0] == '1')) {
        return 1;
    } else if ((i == 1) && (answer[0] == '2')) {
        return 0;
    }

    return 2;
}
