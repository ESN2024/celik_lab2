#include <stdio.h>
#include <stdint.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include <sys/alt_irq.h>
#include <io.h>
#include <alt_types.h>
#include "sys/alt_sys_init.h"

uint32_t cpt = 0;

static void irq_handler_timer(void *context)
{
	uint8_t data[3] = {0,0,0}; 									// 3-digit counter
	
	if (cpt < 1000)
	{	
		if(cpt >= 10) 
		{	
			data[0] = cpt % 10; 								// Units
			data[1] = (cpt/10) % 10;							// Dizaines
			data[2] = cpt /100; 								// Centaines
		}
		else
		{
			data[0] = cpt;
		}
		
		IOWR_ALTERA_AVALON_PIO_DATA(SEG1_BASE, data[0]);
		IOWR_ALTERA_AVALON_PIO_DATA(SEG2_BASE, data[1]);
		IOWR_ALTERA_AVALON_PIO_DATA(SEG3_BASE, data[2]);
		cpt++;
	}
	else
	{
		cpt = 0;
	}
	
	// Clear flag interrupt
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0x01);
}

int main(void)
{
    alt_printf("Dans le main\n");
    alt_irq_register(TIMER_0_IRQ, NULL, irq_handler_timer);
	
	// Check le status
	uint16_t status = IORD_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE);
	alt_printf("STATUS = %x\n", status);
	
	// Check le control
	uint16_t control = IORD_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE);
	alt_printf("CONTROL = %x\n", control);
	cpt = 0;
	
    while(1) 
	{}

    return 0;
}
