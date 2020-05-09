/******************************************************************************
* Copyright (c) 2020 Jiayi
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
 */

/******************************************************************************
 * @file     main.c
 * @brief    hello world
 * @version  V1.0
 * @date     31. Mar. 2020
 ******************************************************************************/

#include <stdio.h>
#include "user_gpio.h"
#include "user_timer.h"
#include "user_uart.h"

int main(void)
{
	printf("Hello World!\n --example by jiayi\n");
	delay_ms_init();
	user_gpio_init_output(PA0);
	while(1){
		
		user_gpio_setpin(PA0);
		delay_ms(500);
		
		user_gpio_resetpin(PA0);
		delay_ms(500);
		
	}
	return 0;
}
