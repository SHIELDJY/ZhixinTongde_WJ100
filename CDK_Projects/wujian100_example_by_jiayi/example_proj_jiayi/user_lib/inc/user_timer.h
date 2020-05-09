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
 * @file     user_timer.h
 * @brief    header file for timer driver
 * @version  V1.0
 * @date     09. Apr. 2020
*/

#ifndef _USER_TIMER_H_
#define _USER_TIMER_H_

/*Include files*/
#include <stdio.h>
#include "soc.h"
#include "drv_timer.h"
#include "pin_name.h"
#include "pin.h"

#ifdef __cplusplus
extern "C" {
#endif

/*Macro*/
#define     TIM0    0   //timer0 has been configured as clock source for delay_ms
#define     TIM1    1
#define     TIM2    2
#define     TIM3    3
#define     TIM4    4
#define     TIM5    5
#define     TIM6    6
#define     TIM7    7
#define     TIM8    8
#define     TIM9    9
#define     TIM10   10
#define     TIM11   11
#define     TIM12   12
#define     TIM13   13
#define     TIM14   14
#define     TIM15   15

#ifdef __riscv
#define HI_PRIO   3
#define LO_PRIO   2
#else
#define HI_PRIO   2
#define LO_PRIO   3
#endif

/*Global Function*/
/******************************************************************************
 * @brief      Timer event callback function
 * @param[in]  idx, event
 * @return     None
 * @warning    make sure to write a callback function before initialize any timer
 ******************************************************************************/
//void timer_event_cb_fun(int32_t idx, timer_event_e event);

/******************************************************************************
 * @brief      Timer init function prototype for wujian100
 * @param[in]  timer_num timer idx from TIM0 to TIM15
 * @param[in]  timerout_ms timeout in milliseconds
 * @return     Error code
 ******************************************************************************/
int32_t user_timer_init(uint8_t timer_num, timer_event_cb_t timer_event_cb_fun, int32_t timeout_ms);

///******************************************************************************
// * @brief      Timer event callback function for delay
// * @param[in]  idx, event
// * @return     None
// * @warning    make sure to write a callback function before initialize any timer
// ******************************************************************************/
//
//static void timer_delay_cb_fun(int32_t idx, timer_event_e event);
/******************************************************************************
 * @brief      user delay function initialize
 * @return     None
 * @warning    TIM0 is used in this function
 ******************************************************************************/
void delay_ms_init(void);

/******************************************************************************
 * @brief      delay in milliseconds
 * @return     None
 * @warning    TIM0 is used in this function
 ******************************************************************************/
int delay_ms(int32_t delay_time_ms);

/*Private Function*/


#ifdef __cplusplus
}
#endif

#endif /* _USER_TIMER_H_ */