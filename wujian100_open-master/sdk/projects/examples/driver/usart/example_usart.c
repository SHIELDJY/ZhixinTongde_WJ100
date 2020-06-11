/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_usart.c
 * @brief    the main function for the USART driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_usart.h"
#include "stdio.h"
#include "soc.h"
#include "pin.h"

#define CONFIG_TERMINAL_USART      1

static usart_handle_t g_usart_handle;
static volatile uint8_t rx_async_flag = 0;
static volatile uint8_t tx_async_flag = 0;
static volatile uint8_t rx_trigger_flag = 0;

uint8_t  data[18] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                     'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R'
                    };
uint8_t data_rev[20];
static int32_t usart_receive_sync(usart_handle_t usart, void *data, uint32_t num)
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

static int32_t usart_send_sync(usart_handle_t usart, const void *data, uint32_t num)
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
	        printf("rx_irq\n");
        default:
            break;
    }

}

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







usart_handle_t p_csi_usart;
int example_usart(void)
{

    int32_t ret;

    /* init the USART*/
    p_csi_usart = csi_usart_initialize(0, usart_event_cb);

    /* config the USART */
    ret = csi_usart_config(p_csi_usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    return 0;
}

int main(void)
{
	example_usart();
	
	printf("Testing usart...");
    //查询接收
	while(1){
/*			usart_receive_sync(p_csi_usart,&data_rev,10);
			if(data_rev[0]!='\0')
			 {
				 usart_send_sync(p_csi_usart,data_rev,sizeof(data_rev));
				csi_usart_abort_receive(p_csi_usart);
				 int i=0;
				 while(i<20) {data_rev[i]='\0';i++;}					 
			 }*/
	}
    return  0;
}
