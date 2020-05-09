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
 * @file     user_timer.c
 * @brief    user function prototype for timer in wujian100
 * @version  V1.0
 * @date     09. Apr. 2020
 ******************************************************************************/

#include "user_timer.h"

timer_handle_t g_timer_handle;

/******************************************************************************
 * @brief      Timer event callback function
 * @param[in]  idx, event
 * @author     Jiayi
 * @return     None
 * @warning    make sure to write a callback function before initialize any timer
 ******************************************************************************/
void timer_event_cb_fun(int32_t idx, timer_event_e event)
{
}

/******************************************************************************
 * @brief      Timer init function prototype for wujian100
 * @param[in]  timer_num timer idx from TIM0 to TIM15
 * @param[in]  timerout_ms timeout in milliseconds
 * @author     Jiayi
 * @return     Error code
 ******************************************************************************/

int32_t user_timer_init(uint8_t timer_num, timer_event_cb_t timer_event_cb_fun, int32_t timeout_ms)
{
    int32_t ret;
    timer_handle_t timer_handle;

    /*initialize timer handler*/
    timer_handle = csi_timer_initialize(timer_num, timer_event_cb_fun);


    /*config timer*/
    ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);

    /*error code and message*/
    if (ret < 0) {
        printf("csi_timer_config error %x\n", ret);
        return -1;
    }

    /*set timer timeout*/
    ret = csi_timer_set_timeout(timer_handle, 1000 * timeout_ms);

    /*error code and message*/
    if (ret < 0) {
        printf("csi_timer_set_timeout error %x\n", ret);
        return -1;
    }

    /*start timer (could be put anywhere you would like)*/
    ret = csi_timer_start(timer_handle);

    /*error code and message*/
    if (ret < 0) {
        printf("csi_timer_start error %x\n", ret);
        return -1;
    }

    /*stop timer (could be put anywhere you would like)*/
    // ret = csi_timer_stop(timer_handle);
    // if (ret == 0)
    //    printf("csi_timer_stopped %x\n", ret);

    printf("csi_timer_start Success! \n");
    return 0;
}

/******************************************************************************
 * @brief      Timer event callback function for delay
 * @param[in]  idx, event
 * @author     Jiayi
 * @return     None
 * @warning    make sure to write a callback function before initialize any timer
 ******************************************************************************/
timer_handle_t delay_timer_handle;
static int delay_flag1 = 0;
static void timer_delay_cb_fun(int32_t idx, timer_event_e event)
{
    csi_timer_stop(delay_timer_handle);
	delay_flag1 = 0;
	printf("delay finished! \n");
//	return;
}

/******************************************************************************
 * @brief      user delay function initialize
 * @author     Jiayi
 * @return     None
 * @warning    TIM0 is used in this function
 ******************************************************************************/
void delay_ms_init(void)
{
    int32_t ret;

    /*initialize delay timer handler*/
    delay_timer_handle = csi_timer_initialize(TIM0, timer_delay_cb_fun);


    /*config timer*/
    ret = csi_timer_config(delay_timer_handle, TIMER_MODE_RELOAD);

    /*config priority*/
    csi_vic_set_prio(TIM0_IRQn, LO_PRIO);

    /*error code and message*/
    if (ret < 0) {
        printf("csi_timer_config error %x\n", ret);
        return;
    }

    printf("delay config Success! \n");
    return;
}

/******************************************************************************
 * @brief      delay in milliseconds
 * @author     Jiayi
 * @return     None
 * @warning    TIM0 is used in this function
 ******************************************************************************/
int delay_ms(int32_t delay_time_ms)
{
	int32_t ret = 0;
	
	delay_flag1 = 1;
	
    /*set timer timeout*/
    ret = csi_timer_set_timeout(delay_timer_handle, 1000 * delay_time_ms);

    /*error code and message*/
    if (ret < 0) {
        printf("delay time set error %x\n", ret);
        return -1;
    } 

    /*start timer*/
	ret = csi_timer_start(delay_timer_handle);

    /*error code and message*/
    if (ret < 0) {
        printf("delay start error %x\n", ret);
        return -1;
    } 

    printf("Delay time: %d ms\n", delay_time_ms);

	
	while(1){
	 if (delay_flag1 == 0) {
		 printf("fuck you %d \n",delay_flag1);
            return 0;
        }
	}
}
