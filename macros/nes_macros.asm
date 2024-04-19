
_F{_NES_MACROS

.MACRO SET_SPRITE_OFFSCREEN sprite_addr
	
	LDA #$F0                                     
	STA sprite_addr 
	
.ENDM


.MACRO SET_SPRITE_DMA addr

    LDA #<addr						                                     ; SET OAMADDR = SPRITE DMA =0x200
	STA NES_OAM_ADDR						                                 ;
	LDA #>addr						                                     ; 
	STA NES_OAM_DMA 						                                     ;  

.ENDM	


.MACRO STROBE_JOYPAD

	LDA #$01						                                     ; STROBE JOYPAD REGISTER TO TRANSFER BUTTON STATES
	STA JOYPAD_STROBE													 ;
	LDA #$00						                                     ;
	STA JOYPAD_STROBE													 ;
	
.ENDM	

_F}_NES_MACROS


