
_F{_NES_REGISTERS

				; PPU REGISTERS

NES_PPU_CTRL						= $2000
	
NAMETABLE1_START 					= $2000
ATTR_TABLE1_START 					= $23C0

NAMETABLE2_START 					= $2400
ATTR_TABLE2_START 					= $27C0

NAMETABLE3_START 					= $2800
ATTR_TABLE3_START 					= $2BC0

NAMETABLE4_START 					= $2C00
PPU_PALLETE_START 					= $3F00

NUM_ROWS_PER_NAMETABLE				= 32	

;LOWER_BYTE_OF_ATTRIB_TABLE
OFFSET_TO_ATTR_TABLE	            = ATTR_TABLE1_START - NAMETABLE1_START
SIZE_OF_ATTR_TABLE 		            = $40


NES_PPU_MASK		                = $2001

NES_PPU_STATUS		                = $2002

NES_OAM_ADDR     		            = $2003

NES_OAM_DATA     		            = $2004

NES_PPU_SCROLL   		            = $2005

NES_PPU_ADDR     		            = $2006

NES_PPU_DATA      		            = $2007

NES_OAM_DMA                         = $4014


				; APU_REGISTERS
APU_CUR_CH_VOL[]	 		        = $4000				
APU_CUR_SQ_CH_SWEEP[]		        = $4001
APU_CUR_CH_PERIOD_VALUE[]	        = $4002			; 2 bytes
				
SQ1_VOL              	            = $4000

SQ1_SWEEP            	            = $4001

SQ1_LO                              = $4002

SQ1_HI                              = $4003

SQ2_VOL                             = $4004

SQ2_SWEEP                           = $4005

SQ2_LO                              = $4006

SQ2_HI                              = $4007

TRI_LINEAR                          = $4008

TRI_LO                              = $400A

TRI_HI                              = $400B

NOISE_VOL                           = $400C

NOISE_LO                            = $400E

NOISE_HI                            = $400F

APU_DMC_IRQ_FREQ                    = $4010

APU_DMC_OUPUT_LEV                   = $4011

DMC_START                           = $4012

DMC_LEN                             = $4013

APU_STATUS			                = $4015
SND_CHN                             = $4015

JOYPAD_STROBE                       = $4016
JOYPAD_1                            = $4016

JOYPAD_2                            = $4017
APU_FRAME_COUNTER                   = $4017

_F}_NES_REGISTERS