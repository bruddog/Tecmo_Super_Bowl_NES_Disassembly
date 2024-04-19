_F{_TECMO_MACROS

.MACRO SET_SOFT_SPRITE_8_BY_16
		LDA SOFT_PPU_CTRL                           ; SET SPRITE SIZE 8 X 16
		ORA #$20                                    ;
		STA SOFT_PPU_CTRL                           ;
.ENDM

.MACRO SET_SOFT_SPRITE_8_BY_8[]
		LDA SOFT_PPU_CTRL                           ; SET SPRITE SIZE 8 X 8
		AND #$DF                                    ;
		STA SOFT_PPU_CTRL                           ;
.ENDM  

.MACRO SET_P1_MAN_ICON_NOT_SET
		LDA_ABS_A_ZP P1_MAN_POS_ID_ICON_STATUS      ; *** Long version for rom verification 
		ORA #$40                                    ;
		STA_ABS_A_ZP P1_MAN_POS_ID_ICON_STATUS      ; *** Long version for rom verification 
.ENDM 

.MACRO SET_P2_MAN_ICON_NOT_SET
		LDA_ABS_A_ZP P2_MAN_POS_ID_ICON_STATUS      ;  *** Long version for rom verification 
		ORA #$40                                    ;
		STA_ABS_A_ZP P2_MAN_POS_ID_ICON_STATUS     ; *** Long version for rom verification 
.ENDM 


.MACRO END_SCENE_DRAW_NEW[sceneId_sceneBank] sceneid, scenebank 
		LDA #sceneid                                                    
		LDX #scenebank                                                    
		JSR END_OLD_SCENE_DRAW_NEW_SCENE 
.ENDM

.MACRO DRAW_SCENE_UNTIL_ENDED[sceneId_sceneBank] sceneid, scenebank 
		LDA #sceneid                                                    
		LDX #scenebank                                                    
		JSR DRAW_SCENE_UNTIL_ENDED 
.ENDM

.MACRO SUSPEND_TASK_DIRECT[task] fooba
		LDA fooba
		AND #$0F
		STA fooba
.ENDM

.MACRO RETURN_1_FRAME  
   LDA #$01
   JSR DELAY_TASK
.ENDM

.MACRO _IF_B_BUTTON_HELD_PRESSED[joyType_addr] joytype
		BIT joytype
		BVS addr
.ENDM 

.MACRO _IF_B_BUTTON_NOT_HELD_PRESSED[joyType_addr] joytype
		BIT joytype
		BVC addr
.ENDM 

.MACRO _IF_A_BUTTON_NOT_HELD_PRESSED[joyType_addr] joytype
		BIT joytype
		BPL addr
.ENDM 



.MACRO RETURN_IN_NUM_FRAMES frames 
   LDA #frames
   JSR DELAY_TASK
.ENDM

.MACRO SWAP_A000_BANK[bank_id] bank_id 
	LDX #bank_id                                                 ; SET BANK = BANK 18
	JSR SWAP_A000_BANK                                           ; SWAP A000 BANK (X= BANK TO SWAP TO)
.ENDM

.MACRO SWAP_8000_BANK[bank_id] bank_id 
	LDX #bank_id                                                 ; SET BANK = BANK 18
	JSR SWAP_8000_BANK                                           ; SWAP A000 BANK (X= BANK TO SWAP TO)
.ENDM

.MACRO JUMP_8000_BANK_AND_RETURN[bank_funcAddr] bank, funcAddr
	LDA #bank                                                 
	LDY #<funcAddr                                              
	LDX #>funcAddr                                                
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                           ; SWAP 8000 BANK AND JUMP( A= BANK, Y,X=  JUMP ADDRESS)
.ENDM

.MACRO  PLAY_SOUND_ID sound_id 
    LDA #sound_id 
	JSR PLAY_SOUND
.ENDM




.MACRO SAVE_ADDR_XY[mem_loc] mem_loc
	STY #<mem_loc
	STX #>mem_loc
.ENDM

.MACRO LOAD_ADDR_XY[mem_loc] mem_loc
	LDY #<mem_loc
	LDX #>mem_loc
.ENDM

.MACRO SET_ADDR_XY[addr] addr
	LDY #<addr
	LDX #>addr
.ENDM




.MACRO CALCULATE_TEAM_INFO_LENGTH
 	LDA CURRENT_TEAM_INFO_ADDR,Y						        ; SET TEAM CITY/NAME POINTER FROM TEAM CITY/NAME POINTER INTIAL POINTERS
	STA PPU_DATA_ADDR_TEMP						              ;
	LDA CURRENT_TEAM_INFO_ADDR+1,Y						     ;
	STA PPU_DATA_ADDR_TEMP+1						           ;
	LDA NEXT_TEAM_INFO_ADDR,Y						           ; LOAD NEXT TEAM CITY ABREEV POINTER TO CALCULATE LENGTH
	SEC							                             ;
	SBC PPU_DATA_ADDR_TEMP						              ;
.ENDM

.MACRO  SET_X_INDEX_NEXT_SPRITE
   INX
   INX 
   INX
   INX 
.ENDM



.MACRO LOCAL_PPU_ADDR_DOWN_ONE_ROW
 	LDA PPU_ADDR_TEMP							             ; SET PPU ADDRESS = PPU ADDRESS + ONE ROW DOWN
	CLC							                             ;
	ADC #$20						                         ;
	STA PPU_ADDR_TEMP							             ;
	LDA PPU_ADDR_TEMP+1							             ;
	ADC #$00						                         ;
	STA PPU_ADDR_TEMP+1						                 ;
.ENDM



.MACRO TEMP_PPU_ADDR_DOWN_ONE_ROW
 	LDA PPU_ADDR_TEMP							                 ; SET PPU ADDRESS = PPU ADDRESS + ONE ROW DOWN
	CLC							                             ;
	ADC #$20						                             ;
	STA PPU_ADDR_TEMP							                 ;
	LDA PPU_ADDR_TEMP+1							              ;
	ADC #$00						                             ;
	STA PPU_ADDR_TEMP+1						                 ;
.ENDM



.MACRO PULL_LOCALS_A_X_Y_FROM_STACK
   PLA							                                         ; PULL LOCAL VARIABLES $3E-45
	STA LOCAL_1						                                      ;
	PLA							                                         ;
	STA LOCAL_2						                                      ;
	PLA							                                         ;
	STA LOCAL_3						                                      ;
	PLA							                                         ;
	STA LOCAL_4						                                      ;
	PLA							                                         ;
	STA LOCAL_5						                                      ;
	PLA							                                         ;
	STA LOCAL_6						                                      ;
	PLA							                                         ;
	STA LOCAL_7						                                      ;
	PLA							                                         ;
	STA LOCAL_8						                                      ;
	PLA							                                         ; PULL Y
	TAY							                                         ;
	PLA							                                         ; PULL X
	TAX							                                         ;
	PLA							                                         ; PULL A
.ENDM	

.MACRO PUSH_A_X_Y_LOCALS_TO_STACK
	PHA							                                         ; SAVE A
	TXA							                                         ; SAVE X
	PHA							                                         ;
	TYA							                                         ; SAVE Y
	PHA							                                         ;
	LDA LOCAL_8						                                      ; SAVE LOCAL VARIABLES ($3E-$45)
	PHA							                                         ;
	LDA LOCAL_7						                                      ;
	PHA							                                         ;
	LDA LOCAL_6						                                      ;
	PHA							                                         ;
	LDA LOCAL_5							                                   ;
	PHA							                                         ;
	LDA LOCAL_4						                                      ;
	PHA							                                         ;
	LDA LOCAL_3						                                      ;
	PHA							                                         ;
	LDA LOCAL_2					                                         ;
	PHA							                                         ;
	LDA LOCAL_1						                                      ;
	PHA							                                         ;
.ENDM

.MACRO PUSH_NMI_A_X_Y_LOCALS_TO_STACK
	LDA NMI_A							                                   ; SAVE NMI A REGISTER
	PHA							                                         ;
	LDA NMI_X							                                   ; SAVE NMI X REGISTER
	PHA							                                         ;
	LDA NMI_Y						                                      ; SAVE NMI Y REGISTER
	PHA							                                         ;
	LDA LOCAL_8						                                      ; SAVE LOCAL VARIABLES ($3E-$45)
	PHA							                                         ;
	LDA LOCAL_7						                                      ;
	PHA							                                         ;
	LDA LOCAL_6						                                      ;
	PHA							                                         ;
	LDA LOCAL_5							                                   ;
	PHA							                                         ;
	LDA LOCAL_4						                                      ;
	PHA							                                         ;
	LDA LOCAL_3						                                      ;
	PHA							                                         ;
	LDA LOCAL_2					                                         ;
	PHA							                                         ;
	LDA LOCAL_1						                                      ;
	PHA							                                         ;;
.ENDM

_F}_TECMO_MACROS