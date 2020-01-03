#define F_CPU 16000000UL

#include<avr/io.h>
#include<util/delay.h>
#include "uart.h"
#include"adc.h"



int main(void)
{
DDRB=0xff;
DDRC=0Xff;
unsigned char temp,vib;
int a=0;
uart_init();
adc_init();
_delay_ms(1000);
//uart_string("AT+CWMODE=3\r\n");
//_delay_ms(3000);


//uart_string("AT+CWJAP=\"dummy\",\"lmfaohaha\"\r\n");
//_delay_ms(5000);
//_delay_ms(5000);
//_delay_ms(5000);
//int 1;

while(1)
{

temp=getdata(0x00);
vib=getdata(0x01);

//uart_string("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80\r\n");
//_delay_ms(3000);


//uart_string("AT+CIPSEND=60\r\n");
//_delay_ms(100);

//uart_string("GET /update?api_key=76D619EWVMEW91UJ&field1=");
//uart_num(q);
//uart_string("&field2=");
uart_num(temp);
//uart_string("&field3=");
uart_string("	");
uart_num(vib);
//q=q+1;
uart_string("\r\n");
_delay_ms(1000);


//uart_string("AT+CIPCLOSE\r\n");
//_delay_ms(12000);


}

}
