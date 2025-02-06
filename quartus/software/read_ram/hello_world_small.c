/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */

#include "sys/alt_stdio.h"
#include <io.h>
#include <system.h>
#include <stdio.h>
#include "alt_types.h"
#include "altera_avalon_uart_regs.h"
#include "altera_avalon_pio_regs.h" //access to PIO macros
#define UART_STATUS_TX_READY 0x40  	// Bit 6: flag Listo para transmitir

// Funci�n para leer un byte desde UART
alt_u8 uart_read_byte() {
	while (!(IORD_ALTERA_AVALON_UART_STATUS(UART_DATA_BASE) & ALTERA_AVALON_UART_STATUS_RRDY_MSK)) {
	}// Esperar hasta que haya datos disponibles }
    return IORD_ALTERA_AVALON_UART_RXDATA(UART_DATA_BASE);
}

// Funci�n para enviar un car�cter por UART
void uart_send_char(char c) {
    																// Esperar hasta que el UART est� listo para transmitir
    while (!(IORD(UART_DATA_BASE, 2) & 0x40)) {						// Bit 6 (Transmit Ready) del registro de estado debe ser 1
    }
    IOWR(UART_DATA_BASE, 1, c); 									// Escribir el car�cter en el registro de datos (OFFSET 1)
}
// Funci�n para enviar una cadena de caracteres por UART
void uart_send_string(const char *str) {
    while (*str) {
        uart_send_char(*str);
        str++;
    }
}
void uint_to_string(unsigned int number, char* str) {
    sprintf(str, "%u", number);  									// Conviertir el numero en una cadena sin signo
}

int main()
{
	printf("Estoy vivo!!\n");
	const char *message = "Empezando transmision de datos!!\n";
	const char *salto	= "\n";
	const char *tab	= "\t";
	uart_send_string(message);
	char str[20];
	unsigned int data = IORD(DATA_BASE, 0);
	unsigned int i;
	unsigned int k = 0;

	alt_u8 received_data;
	alt_u32 button_value;
	alt_u32 led_value = 0;

	 while (1) {
		 	received_data = uart_read_byte();
	        button_value = IORD_ALTERA_AVALON_PIO_DATA(BUTTON_BASE);			// leer el valor del bot�n
	        if (button_value == 1 || received_data == 32) {											// si el bot�n est� presionado (asumiendo l�gica activa baja)
	        	printf("%d",received_data);
	        	IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, 0);
	            for (i = 0; i < 1000; i++) {			 						//comenzar a leer memoria ram
	            	 data = IORD_16DIRECT(DATA_BASE, i*2);
	            	 uint_to_string(data, str);
	            	 if (k%2 == 0){
	            	 	uart_send_string(str);
	            	 	uart_send_string(tab);
	            	 }
	            	 else uart_send_string(str);
	            	 if(k%2==1)uart_send_string(salto);
	            	 k++;
	            }
	            led_value = 1;
	            received_data = 0;
	        } else {
	        	led_value = 1;
	        }
	        IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, led_value); 			// Escribir el valor al LED PIO
	    }
	return 0;
}
