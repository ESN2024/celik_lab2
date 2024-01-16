#include <stdio.h>
#include <stdint.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include <unistd.h>

int main(void)
{
	uint8_t data[3] = {0,0,0};					// 3-digit counter
	uint32_t cpt; 
	int speed_time = 75000;
	
	while(1)
	{	
		for(cpt = 0; cpt < 1000; cpt++)
		{	
			if(cpt >= 10)
			{	
				data[0] = cpt % 10; 			// Units
				data[1] =  (cpt / 10) % 10; 	// Dizaines
				data[2] = cpt / 100; 			// Centaines
				
			}
			else
			{
				data[0] = cpt;
			}
			
			IOWR_ALTERA_AVALON_PIO_DATA(SEG1_BASE, data[0]);
			IOWR_ALTERA_AVALON_PIO_DATA(SEG2_BASE, data[1]);
			IOWR_ALTERA_AVALON_PIO_DATA(SEG3_BASE, data[2]);
			usleep(speed_time);	
		}
	}
	return 0;
}