
#ifndef _OELD_H
#define _OELD_H



#include "stdio.h"
#include "soc.h"
#include "drv_gpio.h"
#include "pin_name.h"
#include "pin.h"
	 



void OLED_Init(void);
void OLED_Fill(uint8_t dat);
void OLED_WrDat(uint8_t data);
void OLED_Wr6Dat(uint8_t data);
void OLED_PutPixel(uint8_t x,uint8_t y);
void OLED_ClrPixel(uint8_t x,uint8_t y);
void OLED_Set_Pos(uint8_t x, uint8_t y);
void OLED_P6x8Str(uint8_t x,uint8_t y,uint8_t ch[]);
void OLED_P8x16Str(uint8_t x,uint8_t y,uint8_t ch[]);
void OLED_HEXACSII(uint16_t hex,uint8_t* Print);
void OLED_Print_Num(uint8_t x, uint8_t y, uint16_t num);
void OLED_Print_Num1(uint8_t x, uint8_t y, int16_t num);




/********************************************************************/

#endif
