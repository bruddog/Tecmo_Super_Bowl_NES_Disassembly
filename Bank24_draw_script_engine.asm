
.MACRO LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	LDY CURR_BG_SCRIPT_PPU_ADDR							                                        ; LOAD PPU ADDRESS
	LDX CURR_BG_SCRIPT_PPU_ADDR+1						                                        ;
.ENDM


 .BASE $8000

BANK_JUMP_DO_DRAW_EVENT:
	JMP DO_DRAW_EVENT							                                        ; DO DRAW EVENT()

BANK_JUMP_DO_DRAW_EVENT_THEN_END_DRAW_TASKS:	
	JMP DO_DRAW_EVENT_THEN_END_DRAW_TASKS		                                        ; END DRAW EVENT TASKS, DO DRAW EVENT, THEN END TASK()

BANK_JUMP_DRAW_BG_METATILE:
	JMP DRAW_BG_METATILE						                                        ; DRAW 4X4 BG TILE BLOCK()

BANK_JUMP_INIT_SPRITE_SCRIPTS:	
	JMP INIT_SPRITE_SCRIPTS						                                        ; DRAW SPRITES()

BANK_JUMP_UPDATE_CHANGING_PALLETE_TASK	
	JMP DO_CHANGING_PALLETE						                                        ; DO BLINKING PALLETE()

BANK_JUMP_DRAW_PLAYER_FACE	
	JMP DRAW_PLAYER_FACE						                                        ; DRAW PLAYER FACE()

BANK_JUMP_START_CHANGING_PALLETE_TASK:	
	JMP START_CHANGING_PALLETE_TASK				                                        ; BLINK OFFENSIVE STARTER SELECTED()

; BANK 8
;START_OF_BRACKET_HIGHLIGHTING_PTRS				= $A0E0											; *** remove on full build

; BANK 23  
; SET_TEAM_UNIFORM_COLORS							= $8006											; *** remove on full build
; BANK 26
;SET_CUTSCENE_UNIFORM_AND_SKIN_COLOR			= $8003										; *** remove on full build
;SET_DIVISION_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL	= $8006											; *** remove on full build
;SET_CONFERENCE_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL	= $8009											; *** remove on full build
;SET_SUPER_BOWL_CUTSCENE_TEAM_UNIFORM_PAL		= $800C											; *** remove on full build

;GET_TEAM_1_RUSHING_YARDS						= $802A											; *** remove on full build
;GET_TEAM_2_RUSHING_YARDS						= $802D											; *** remove on full build
;GET_TEAM_1_PASSING_YARDS						= $8030											; *** remove on full build
;GET_TEAM_2_PASSING_YARDS						= $8033											; *** remove on full build

; BANK 28
; SOUND_ENGINE_START								= $8000



_F{_START_OF_BG_DRAW_SCRIPT_PROCESSING															; DONE

DO_DRAW_EVENT_THEN_END_DRAW_TASKS:						                                        ; DRAW EVENT THEN END TASKS

BG_SCRIPT_POINTER_STARTING_ADDR			= $A000
SPECIAL_BG_SCRIPT_COMMAND_OFFSET		= $C0

@set_stack:
	LDX #DRAW_SCRIPT_STACK_INDEX									                            ; SET STACK LOCATION = DRAW TASK STACK LOCATION	
	TXS													                                        ;
	
	
@end_other_draw_tasks:	
	LDX #UPDATE_PALLETE_TASK							                                        ; SET TASK INDEX = UPDATE PALLETE = TASK 5
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS			                                        ; END TASK (X= TASK INDEX)
	LDX #DRAWING_TASK									                                        ; SET TASK INDEX = CUTSCENE  = TASK 4
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS			                                        ; END TASK (X= TASK INDEX)
	LDX #BANNER_TASK 									                                        ; SET TASK INDEX = DRAW BALL  = TASK 3
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS			                                        ; END TASK (X= TASK INDEX)
	
	
	LDA DRAW_SCRIPT_ID									                                        ; SET DRAW EVENT INDEX =  DRAW EVENT INDEX
	LDX DRAW_SCRIPT_BANK								                                        ; SET DRAW EVENT BANK  =   BANK
	JSR DO_DRAW_EVENT									                                        ;
	LDX #UPDATE_PALLETE_TASK							                                        ; SET TASK INDEX = UPDATE PALLETE = TASK 5
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS			                                        ; END TASK (X= TASK INDEX)
	LDX #DRAWING_TASK									                                        ; SET TASK INDEX = CUTSCENE  = TASK 4
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS			                                        ; END TASK (X= TASK INDEX)
	LDX ##BANNER_TASK									                                        ; SET TASK INDEX = DRAW BALL  = TASK 3
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS			                                        ; END TASK (X= TASK INDEX)
	JMP END_CURRENT_TASK								                                        ; END CURRENT TASK (X= TASK INDEX)

DO_DRAW_EVENT:											                                        ; SWAP $A000 BANK AND SET TO 8X8 TEXT AND DO DRAW COMMANDS(A= POINTER INDEX, X= BANK TO SWAP TO)
	STA DRAW_SCRIPT_ID									                                        ; SAVE CURRENT DRAW_EVENT INDEX
	JSR SWAP_A000_BANK									                                        ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA GAME_STATUS										                                        ; SET GAME STATUS HORIZONTAL FLIP = FALSE
	AND #%11011111										                                        ;
	STA GAME_STATUS										                                        ;
	LDA DRAW_SCRIPT_ID									                                        ; LOAD DRAW EVENT POINTER INDEX
	ASL													                                        ;
	TAX													                                        ; 
	LDA BG_SCRIPT_POINTER_STARTING_ADDR,X 										                ; SET DRAW EVENT ADDRESS FROM POINTER TABLES
	STA CURR_BG_SCRIPT_ADDR								                                        ;
	LDA BG_SCRIPT_POINTER_STARTING_ADDR+1,X 										            ; 
	STA CURR_BG_SCRIPT_ADDR+1							                                        ; 
	LDA #<STARTING_BG_SCRIPT_PPU_ADDR												            ; SET PPU ADDRESS = $2082
	STA CURR_BG_SCRIPT_PPU_ADDR							                                        ;
	LDA #>STARTING_BG_SCRIPT_PPU_ADDR										                    ;
	STA CURR_BG_SCRIPT_PPU_ADDR+1						                                        ;
	LDA PPU_TRANSFER_STATUS								                                        ;  SET TEXT OPTION = 8X8
	AND #%10111111										                                        ;
	STA PPU_TRANSFER_STATUS								                                        ;
	LDA #$00											                                        ;
	STA BG_ONE_X_SCROLL_SPEED											                        ; CLEAR TEMP SCROLL AMOUNT 1
	STA BG_TWO_X_SCROLL_SPEED											                        ; CLEAR TEMP SCROLL AMOUNT 2
	STA BG_THREE_X_SCROLL_SPEED											                        ; CLEAR TEMP SCROLL AMOUNT 3 
	STA BG_FOUR_X_SCROLL_SPEED											                        ; CLEAR TEMP SCROLL AMOUNT 4
	STA NUM_FRAMES_DRAW_SCRIPT												                    ; SET DRAW DELAY = (00= DO FOREVER)
	
PROCESS_DRAW_SCRIPT_START:												                        ; PROCESS DATA START
	LDY #$00											                                        ; DOES DATA = DRAW SCRIPT COMMAND
	LDA (CURR_BG_SCRIPT_ADDR),Y		                                                            ; 
	BMI @process_bg_script_command						                                                            ; YES-> PROCESS COMMAND
	JMP DRAW_TEXT_FROM_SCRIPT					                                                ; JUMP->READ AND BUFFER TEXT

@process_bg_script_command:							                                                                ; PROCESS COMMAND
	CMP #SPECIAL_BG_SCRIPT_COMMAND_OFFSET						                                ; IS COMMAND =  UPDATE PPU ADDR COMMAND 
	BCS @special_draw_commands						                                            ; NO-> PROCESS SPECIAL COMMAND
	AND #$78						                                                            ; SHIFT SINCE EACH COMMAND TABLE ENTRY IS TWO BYTES
	LSR							                                                                ;
	LSR							                                                                ;
	TAX							                                                                ;
	LDA BG_SCRIPT_COMMAND_TABLE+1,X					                                            ; PUSH COMMAND ADDRESS-1 ONTO STACK FROM UPDATE PPU ADDR COMMAND TABLE
	PHA							                                                                ;
	LDA BG_SCRIPT_COMMAND_TABLE,X					                                            ;
	PHA							                                                                ;
	RTS							                                                                ; JUMP TO COMMAND ADDRESS USING RTS TRICK

@special_draw_commands:							                                                ; PROCESS SPECIAL COMMAND
	INY							                                                                ; DATA ADDRESS INDEX++
	SEC							                                                                ;
	SBC #$C0					                                                                ; = COMMAND - TABLE LENGTH
	PUSH_TABLE_ADDR[tableAddr] SPECIAL_DRAW_COMMAND_TABLE

_F}_START_OF_BG_DRAW_SCRIPT_PROCESSING

_F{_BG_SCRIPT_COMMAND_TABLES																	; DONE

BG_SCRIPT_COMMAND_TABLE:							                                            ; UPDATE PPU ADDR COMMAND JUMP TABLE


	.WORD TRANSFER_DATA_TO_PPU_COMMANDS_80_TO_87-1					                            ; #$80-#$87 SET PPU ADDRESS TRANSFER DATA TO PPU VIA BUFFER OR DIRECT DEPENDING ON FADE	 
	.WORD SET_PPU_ADDR_COMMANDS_88_TO_8F-1					                                    ; #$88-#$8F SET PPU ADDRESS WITH MIRRORING CHECK	 
	.WORD SET_PPU_ADDR_REPEAT_DOWN_COMMANDS_90_TO_97-1					                        ; #$90-#$97 SET PPU ADDRESS WITH MIRRORING CHECK AND REPEAT DOWN
	.WORD SET_PPU_ADDR_REPEAT_ACROSS_COMMANDS_98_TO_9F-1					                    ; #$98-#$9F SET PPU ADDRESS WITH MIRRORING CHECK AND REPEAT ACROSS	 
	.WORD SET_PPU_ADDR_FILL_RECT_TILE_COMMANDS_A0_TO_A7-1					                    ; #$A0-#$A7 SET PPU ADDRESS WITH MIRRORING CHECK AND REPEAT ACROSS AND DOWN	 
	.WORD SET_PPU_ADDR_DRAW_ROW_TILE_COMMANDS_A8_TO_AF-1					                    ; #$A8-#$AF SET PPU ADDRESS WITH MIRRORING CHECK AND WRITE TILE	 
	.WORD SET_PPU_ADDR_NUM_ROWS_DOWN_COMMANDS_B0_TO_B8-1					                    ; #$B0-#$B7	SET PPU ADDRESS TO NEXT ROW		 
	.WORD DRAW_RECT_COMMANDS_B8_TO_BF-1					                                        ; #$B8-#$BF SET PPU ADDRESS WITH MIRRORING CHECK AND DRAW FROM DATA ADDR	 

															
	
SPECIAL_DRAW_COMMAND_TABLE:							                                            ; SPECIAL COMMAND JUMP TABLE
	.WORD IRQ_COMMANDS_C0_BYTECODE-1				                                            ; #$C0 IRQ COMMANDS
	.WORD CLEAR_IRQ_COMMAND_END_UPDATE_PAL_C1_BYTECODE-1 				                        ; #$C1 CLEAR IRQS AND END UPDATE PALLLETE
	.WORD SET_Y_SCROLL_C2_BYTECODE-1 				                                            ; #$C2 SET Y SCROLL LOCATION
	.WORD SCROLL_BG_C3_BYTECODE-1 				                                                ; #$C3 SCROLL (Y SCROLL SPEED, X SCROLL SPEED, TIME) 
	.WORD DECREASE_BG_SCROLL_C4_BYTECODE-1 				                                        ; #$C4 DECREASE SCROLL SPEED (Y,X) SET TIMER TO VERY LONG
	.WORD INCREASE_BG_SCROLL_C5_BYTECODE-1 				                                        ; #$C5 SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)
	.WORD UNUSED_DRAW_COMMAND-1 				                                                ; #$C6 UNUSED
	.WORD DRAW_TEAM_INITIALS_C7_BYTECODE-1					                                    ; #$C7 DRAW TEAM INITIALS (VALUE = TEAM) 
	.WORD CLEAR_IRQ0_SCROLLS_NAMETABLE_C8_BYTECODE-1					                        ; #$C8 SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0
	.WORD CLEAR_IRQ0_XSCROLL_SET_NAMETABLE_TWO_C9_BYTECODE-1					                                                        ; #$C9 SET IRQ X SCROLL LOCATION TO SCREEN 2
	.WORD CLEAR_NAMETABLES_CA_BYTECODE-1	         			                                ; #$CA CLEAR NAMETABLES
	.WORD SET_ALL_SPRITES_OFFSCREEN_CB_BYTECODE-1            			                        ; #$CB SET SPRITES OFFSCREEN
	.WORD CLEAR_NAMETABLES_AND_SET_ALL_SPRITES_OFFSCREEN_CC_BYTECODE-1					        ; #$CC CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.WORD CLEAR_SPECIFIC_NAMETABLE_CD_BYTECODE-1				     	                        ; #$CD CLEAR NAMETABLES COMMANDS
								                                                                ;   0x00  CLEAR 2000 NAME TABLE 
								                                                                ;	0x01  CLEAR 2400 OR 2800 NAME TABLE BASED ON MIRRORING
								                                                                ;   0x02  CLEAR ON-SCREEN IRQ0 NAME TABLE
								                                                                ;   0x03  CLEAR OFF-SCREEN IRQ0 NAME TABLE
								                                                                ;   0x04  SET SPRITES OFF SCREEN, FILL BACKGROUND, CLEAR ATTRIBUTE TABLE
	.WORD UNUSED_DRAW_COMMAND-1				     	                                            ; #$CE UNUSED	 
	.WORD UNUSED_DRAW_COMMAND-1				     	                                            ; #$CF UNUSED	
	
	.WORD SET_IRQ0_BG_CHR_BANKS_D0_BYTECODE-1 							                        ; #$D0 SET IRQ 0 BACKGROUND CHR BANKS
	.WORD SET_SOFT_SPR_CHR_BANKS_D1_BYTECODE-1	 						                        ; #$D1 SET SOFT SPRITE CHR BANKS
	.WORD SET_IRQO_NAMETABLE_CLEAR_SCROLL_ONCE_METASPR_TASK_DONE_D2_BYTECODE-1 				    ; #$D2 SWITCH SCROLL LOCATION ONCE METASPRITE TASK DONE
	.WORD CONVERT_TO_GO_DIST_TO_NUMBER_D3_BYTECODE-1 					                        ; #$D3 CONVERT FIRST DOWN DISTANCE TO NUMBER
	.WORD DRAW_P1_TEAM_ABBREV_D4_BYTECODE-1 							                        ; #$D4 DRAW P1 TEAM ABREV
	.WORD DRAW_P2_TEAM_ABBREV_D5_BYTECODE-1 							                        ; #$D5 DRAW P2 TEAM ABREV
	.WORD DRAW_TEAM_ABBREV_D6_BYTECODE-1 								                        ; #$D6 DRAW TEAM INTIALS (SECOND BYTE= TEAM ID) 
	.WORD GET_OFFENSE_SPR_PAL_SET_BG_PAL_FADE_IN_D7_BYTECODE-1			                        ; #$D7 GET P1 OR P2 PALLETE  AND SET PALLETE FADE
	.WORD GET_DEFENSE_SPR_PAL_SET_BG_PAL_FADE_IN_D8_BYTECODE-1 				                    ; #$D8 GET SPECIAL TEAMS PLAYER PALLLETE, SET AND FADE IN BG PALLETE
 	.WORD GET_QB_UNI_BG_PAL_FADE_IN_D9_BYTECODE-1 												; #$D9 GET P1/P2 QB UNIFORM AND SKIN COLOR, SET AND FADE IN BG PALLETE
	.WORD DRAW_P1_NUMBER_NAME_DA_BYTECODE-1 							                        ; #$DA DRAW P1 PLAYER NUMBER AND NAME(DATA = PLAYER)
	.WORD DRAW_CURRENT_TEAM_NUMBER_NAME_DB_BYTECODE-1					                        ; #$DB DRAW CURRENT TEAM PLAYER NUMBER AND NAME(DATA = PLAYER)
	.WORD DRAW_PLAYER_NAME_LARGE_CENTERED_DC_BYTECODE-1 				                        ; #$DC DRAW CURRENT TEAM PLAYER NAME LARGE  CENTERED(DATA = PLAYER)
	.WORD START_OR_END_BLINKING_PALLETE_DD_BYTECODE-1					                        ; #$DD START OR END BLINKING PALLETE()
	.WORD DRAW_ONE_BYTE_NUMBER_FROM_DATA_DE_BYTECODE-1 					                        ; #$DE DRAW NUMBER (8-BIT) FROM DATA ADDR()
	.WORD DRAW_ONE_BYTE_NUMBER_FROM_DATA_PLUS_ONE_DF_BYTECODE-1			                        ; #$DF DRAW NUMBER + 1 (8-BIT) FROM DATA ADDR()
	.WORD UPDATES_SPRITES_FROM_DATA_E0_BYTECODE-1 						                        ; #$E0 UPDATE SPRITES(SPRITE DATA ADDR)
	.WORD SET_BG_SCRIPT_DRAW_DELAY_E1_BYTECODE-1 									                        ; #$E1 SET DRAW DELAY(DELAY)
	.WORD CLEAR_OFFSCREEN_BANNER_E2_BYTECODE-1 				                                    ; #$E2 CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.WORD SET_AND_FADE_IN_BG_PAL_E3_BYTECODE-1 							                        ; #$E3 SET AND FADE IN BG PALLETE (BG PAL INDEX)	
	.WORD SET_AND_FADE_IN_SPR_PAL_E4_BYTECODE-1 						                        ; #$E4 SET AND FADE IN SPR PALLETE (SPR PAL INDEX)	
	.WORD SET_AND_FADE_IN_BG_AND_SPR_PAL_E5_BYTECODE-1 					                        ; #$E5 SET AND FADE IN BG SPR PALLETE (BG,SPR PAL INDEX)
	.WORD END_PAL_TASK_AND_FADE_OUT_BG_PAL_E6_BYTECODE-1 				                        ; #$E6 END UPDATE PAL TASK AND FADE OUT BG PALLETE
	.WORD END_PAL_TASK_AND_FADE_OUT_SPR_PAL_E7_BYTECODE-1				                        ; #$E7 END UPDATE PAL TASK AND FADE OUT SPR PALLETE
	.WORD END_PAL_TASK_AND_FADE_OUT_BG_AND_SPR_PAL_E8_BYTECODE-1		                        ; #$E8 END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.WORD SET_BG_PAL_AND_SET_TO_FULLY_FADED_IN_E9_BYTECODE-1 			                        ; #$E9 SET BG PAL AND SET TO FULLY FADED IN (BG PAL INDEX)
	.WORD SET_SPR_PAL_AND_SET_TO_FULLY_FADED_IN_EA_BYTECODE-1 			                        ; #$EA SET SPR PAL AND SET TO FULLY FADED IN (SPR PAL INDEX)
	.WORD SET_BG_AND_SPR_PAL_AND_SET_TO_FULLY_FADED_IN_EB_BYTECODE-1 	                        ; #$EB SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG,SPR PAL INDEX)
	.WORD SET_BG_AND_SPR_PAL_TO_FULLY_FADED_IN_EC_BYTECODE-1 			                        ; #$EC SET BG AND SPR PAL TO FULLY FADED IN
	.WORD END_UPDATE_PALLETE_FADE_OUT_BG_SPR_ED_BYTECODE-1 				                        ; #$ED END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT
	.WORD SET_BG_SPR_PAL_TO_FULLY_FADED_IN_SET_SINGLE_COLOR_EE_BYTECODE-1  				        ; #$EE SET BG&SPR PAL(BG,SPR PAL INDEX) FADED IN, UPDATE ONE COLOR IN PAL(PAL INDEX, NEW PAL COLOR)
	.WORD CLEAR_X_AND_Y_SCROLL_EF_BYTECODE-1				                                    ; #$EF SET Y SCROOL AND IRQO XSCROLL TO ZERO
	.WORD SET_SCENE_SIDE_BASED_ON_POSSESSION_F0_BYTECODE-1 				                        ; #$F0 SET GAME STATUS($2D) HORIZONTAL FLIP BASED ON POSSESSION
	.WORD SET_MIRRORING_TO_HORIZONTAL_F1_BYTECODE-1 				                            ; #$F1 SET GAME STATUS AND PPU MIRRORING = HORIZONTAL 
	.WORD SET_MIRRORING_TO_VERTICAL_F2_BYTECODE-1 				                                ; #$F2 SET GAME STATUS AND PPU MIRRORING = VERTICAL
	.WORD PLAY_SOUND_F3_BYTECODE-1 				                                                ; #$F3 PLAY SOUND( SOUND ID)
	.WORD UNUSED_DRAW_COMMAND-1 	                                                            ; #$F4 UNUSED
	.WORD SET_TEXT_SIZE_TO_08_BY_08_F5_BYTECODE-1 				                                ; #$F5 SET TEXT/SPRITE SIZE TO 08 X 08 
	.WORD SET_TEXT_SIZE_TO_LARGE_F6_BYTECODE-1 				                                	; #$F6 SET TEXT/SPRITE SIZE TO 08 X 16
	.WORD DRAW_BACKGROUND_ONSCREEN_F7_BYTECODE-1				                                ; #$F7 DRAW BACKGROUND ON NAMETABLE 0 (BG ID)
	.WORD DRAW_BACKGROUND_OFFSCREEN_F8_BYTECODE-1 				                                ; #$F8 DRAW BACKGROUND ON NAMETABLE 1 (BG ID)
	.WORD DRAW_METASPRITES_F9_BYTECODE-1 				                                        ; #$F9 DRAW SPRITES (# SPRITE SEQUENCES, SPRITE ID'S(MAX 3) )
	.WORD SPECIAL_DRAW_COMMANDS_FA_BYTECODE-1 				                                    ; #$FA VARIOUS SPECIAL DRAW COMMANDS
	.WORD SET_FRAME_DELAY_FB_BYTECODE-1 				                                        ; #$FB SET FRAME DELAY (DELAY)
	.WORD JUMP_TO_BG_SCRIPT_ADDR_FD_BYTECODE-1 		                                            ; #$FC JUMP TO ADDR (ADDR)				
	.WORD DO_BG_SCRIPT_ROUTINE_AND_RETURN_FD_BYTECODE-1                                         ; #$FD JUMP TO ADDR  AND SAVE RETURN ADDR (ADDR)
	.WORD RETURN_FROM_ROUTINE_FE_BYTECODE-1 		                                            ; #$FE RETURN TO SAVED ADDR (ADDR)
	.WORD END_OF_DRAW_SCRIPT_FF_BYTECODE-1					                                     ; #$FF END OF DRAW

_F}_BG_SCRIPT_COMMAND_TABLES

_F{_DRAW_TEXT_FROM_SCRIPT																		; DONE

DRAW_TEXT_FROM_SCRIPT:									                                        ; READ AND BUFFER TEXT

temp_addr 		= LOCAL_1
data_length		= LOCAL_8

_WHILE PLUS

	INY							                                                                ; LOAD DATA 
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;

_END_WHILE					                                                            ; IS TEXT? YES->READ AND BUFFER TEXT
	LDA CURR_BG_SCRIPT_ADDR						                                                ; SAVE TEXT START ADDRESS
	STA temp_addr						                                                                ;
	LDA CURR_BG_SCRIPT_ADDR + 1						                                            ;
	STA temp_addr + 1						                                                                ;
	TYA							                                                                ; SAVE TEXT LENGTH
	STA data_length						                                                                ; 
	BIT PPU_TRANSFER_STATUS						                                                ; IS TEXT SIZE SETTING = LARGE 8X16
	BVS @large						                                                            ;

@save_small_text_to_buffer:	
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR SAVE_TEXT_TO_BUFFER_CHECK_FOR_SPACE						                                ; SAVE TEXT TO BUFFER WITH SPACES EQUAL BLANK TILE()
	JMP @exit

@large:							                                                                ; 8 X 16 TEXT SIZE 
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	LDA CURR_BG_SCRIPT_ADDR						                                                ; SAVE TEXT START ADDRESS
	STA temp_addr						                                                                ; 
	LDA CURR_BG_SCRIPT_ADDR + 1						                                            ;
	STA temp_addr + 1						                                                                ; SAVE TEXT LENGTH
	LDA data_length						                                                                ;
	JSR DRAW_LARGE_TEXT			                                                                ; BUFFER_LARGE_TEXT(X,Y= PPU ADDR, 3E,3F= DATA ADDR, A= LENGTH)

@exit:							                                                                ;
	LDA data_length						                                                                ; LOAD TEXT LENGTH
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_DRAW_TEXT_FROM_SCRIPT

_F{_TRANSFER_DATA_TO_PPU_BG_SCRIPT_COMMAND_80_TO_87												; DONE

TRANSFER_DATA_TO_PPU_COMMANDS_80_TO_87: 							                            ; #$80-#$87 TRANSFER DATA TO PPU VIA BUFFER OR DIRECT DEPENDING ON FADE VALUES COMMAND

data_addr = LOCAL_1

	JSR SET_BG_SCRIPT_PPU_ADDR_CHECK_MIRRORING						                            ; LOAD PPU ADDRESS FROM DATA ADDRESS WITH MIRRORING CHECK()
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET DATA ADDRESS = CURRENT DATA ADDRESS
	STA data_addr						                                                        ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA data_addr +1						                                                    ;
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						                        ; TRASNFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(X,Y= PPU ADDR, 3E,3F= DAT ADDR)
	LDA #$04						                                                            ; COMMAND LENGTH = 4
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_TRANSFER_DATA_TO_PPU_BG_SCRIPT_COMMAND_80_TO_87

_F{_SET_PPU_ADDR_BG_SCRIPT_COMMANDS_88_TO_B8													; DONE 

SET_PPU_ADDR_COMMANDS_88_TO_8F:							                                        ; #$88-#$8F SET PPU ADDRESS WITH MIRRORING CHECK
	JSR SET_BG_SCRIPT_PPU_ADDR_CHECK_MIRRORING						                            ; SET PPU ADDRESS WITH MIRRORING CHECK()
	LDA #$02						                                                            ; COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_PPU_ADDR_REPEAT_DOWN_COMMANDS_90_TO_97: 							                        ; #$90-#$97 SET PPU ADDRESS WITH MIRRORING CHECK AND REPEAT DOWN

number_of_tiles 		= LOCAL_1
number_of_rows			= LOCAL_2

	JSR SET_BG_SCRIPT_PPU_ADDR_CHECK_MIRRORING						                            ; LOAD PPU ADDRESS FROM DATA ADDRESS WITH MIRRORING CHECK()
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET #ROWS  = COMMAND AMOUNT
	STA number_of_rows					                                                        ;
	LDA #$01						                                                            ; SET SIZE ACROSS = 1 TILE
	STA number_of_tiles						                                                    ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET TILE TO REPEAT
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR FILL_SCREEN_TILE_AREA						                                            ; FILL PPU LOCATIONS WITH TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, A = TILE)
	LDA #$04						                                                            ; COMMAND LENGTH = 4
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_PPU_ADDR_REPEAT_ACROSS_COMMANDS_98_TO_9F:							                                                            ; #$98-#$9F SET PPU ADDRESS WITH MIRRORING CHECK AND REPEAT ACROSS
	JSR SET_BG_SCRIPT_PPU_ADDR_CHECK_MIRRORING						                            ; LOAD PPU ADDRESS FROM DATA ADDRESS WITH MIRRORING CHECK()
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET SIZE ACROSS = COMMAND AMOUNT
	STA number_of_tiles						                                                    ; 
	LDA #$01						                                                            ; SET # ROWS = 1
	STA number_of_rows						                                                     ;
	INY							                                                                ; SET TILE TO REPEAT
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; 
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR FILL_SCREEN_TILE_AREA						                                            ; FILL PPU LOCATIONS WITH TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, A = TILE)
	LDA #$04						                                                            ; COMMAND LENGTH = 4
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_PPU_ADDR_FILL_RECT_TILE_COMMANDS_A0_TO_A7:							                        ; #$A0-#$A7 SET PPU ADDRESS WITH MIRRORING CHECK AND REPEAT ACROSS AND DOWN
	JSR SET_BG_SCRIPT_PPU_ADDR_CHECK_MIRRORING						                            ; LOAD PPU ADDRESS FROM DATA ADDRESS WITH MIRRORING CHECK()
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET #ROWS  = COMMAND AMOUNT
	STA number_of_rows						                                                                ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET SIZE ACROSS = COMMAND AMOUNT
	STA number_of_tiles						                                                                ;
	INY							                                                                ; SET TILE TO REPEAT
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR FILL_SCREEN_TILE_AREA						                                            ; FILL PPU LOCATIONS WITH TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, A = TILE)
	LDA #$05						                                                            ; COMMAND LENGTH = 5
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_PPU_ADDR_DRAW_ROW_TILE_COMMANDS_A8_TO_AF:							                        ; #$A8-#$AF SET PPU ADDRESS WITH MIRRORING CHECK AND WRITE TILE
	JSR SET_BG_SCRIPT_PPU_ADDR_CHECK_MIRRORING						                            ; LOAD PPU ADDRESS FROM DATA ADDRESS WITH MIRRORING CHECK()
	LDA #$01						                                                            ;
	STA number_of_rows						                                                    ; SET #ROWS  = 1
	STA number_of_tiles						                                                    ; SET SIZE ACROSS = 1
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET TILE TO DRAW = DATA VALUE
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR FILL_SCREEN_TILE_AREA						                                            ; FILL PPU LOCATIONS WITH TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, A = TILE)
	LDA #$03						                                                            ; COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_PPU_ADDR_NUM_ROWS_DOWN_COMMANDS_B0_TO_B8:							                        ; #$B0-#$B8 SET PPU ADDRESS NUMBER OF ROWS BELOW CURRENT

num_rows_down	= LOCAL_8
ppu_offset		= LOCAL_8

	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD COMMAND VALUE 
	SEC							                                                                ;
	SBC #$AF						                                                            ; COVERT COMMAND VALUE TO NUMBER OF ROWS = max 0x19
	STA num_rows_down						                                                    ;
	LDA #$00						                                                            ; ROW OFFSET = (NUMBER OF ROWS * LENGTH OF A PPU ROW )
	UNSIGNED_DIVIDE_8[zp] num_rows_down
	CLC							                                                                ;
	ADC CURR_BG_SCRIPT_PPU_ADDR						                                            ; PPU LOCATION = PPU LOCATION +   ROW OFFSET
	STA CURR_BG_SCRIPT_PPU_ADDR						                                            ;
	LDA ppu_offset						                                                        ;
	ADC CURR_BG_SCRIPT_PPU_ADDR	+ 1					                                            ;
	STA CURR_BG_SCRIPT_PPU_ADDR + 1					                                            ;
	LDA #$01						                                                            ; COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_RECT_COMMANDS_B8_TO_BF:											                        ; #$B8-#$BF SET PPU SET PPU ADDRESS WITH MIRRORING CHECK AND DRAW RECTANGLE FROM DATA ADDR
	JSR SET_BG_SCRIPT_PPU_ADDR_CHECK_MIRRORING						                            ; LOAD PPU ADDRESS FROM DATA ADDRESS WITH MIRRORING CHECK()
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET LENGTH FROM DATA ADDR
	STA number_of_tiles											                                ; 
	INY												                                            ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA number_of_rows											                                ; SET #ROWS FROM DATA ADDR
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_RECTANGULAR_IMAGE						                                            ; UPDATE PPU NUM ROWS(3F= NUM ROWS, 3E= LENGTH,  X,Y= PPU ADDRESS)
	LDA #$04										                                            ; COMMAND LENGTH = 4
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR				                                            ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_PPU_ADDR_BG_SCRIPT_COMMANDS_88_TO_B8

_F{_IRQ_BG_SCRIPT_COMMANDS_C0_to_C1																; DONE


IRQ_COMMANDS_C0_BYTECODE: 							                                            ; #$C0 IRQ COMMANDS

irq_command_index	= LOCAL_2

	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; GET INDEX INTO IRQ COMMAND TABLE ( 8 CHOICES)
	AND #$07										                                            ; *** think could be AND #$03 
	STA irq_command_index											                            ;
	ASL												                                            ;
	ASL												                                            ;
	ADC irq_command_index											                            ;
	TAX												                                            ; SAVE IRQ INDEX  
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	AND #$F0										                                            ; MASK TO KEEP COMMAND INDEX
	LOG_SHIFT_RIGHT_3																			; SHIFT SINCE 8 POSSIBLE CHOICES AT 2 BYTES EACH
	TAY												                                            ;
	LDA IRQ_SCRIPT_COMMAND_TABLE+1,Y									                        ; SAVE COMMAND ADDRESS TO STACK
	PHA												                                            ;
	LDA IRQ_SCRIPT_COMMAND_TABLE,Y									                            ;
	PHA												                                            ;
	RTS												                                            ; USE RTS TO JUMP TO COMMAND ADDRESS

IRQ_SCRIPT_COMMAND_TABLE:							                                            ; #$C0 IRQ COMMAND TABLE
	.WORD SET_IRQ_C0_BYTECODE_ARG-1				                                                ; 0X SET IRQ  (IRQ INDEX, IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	.WORD START_SCROLL_C0_BYTECODE_ARG-1				                                        ; 1X START SCROLL THREAD,SET (IRQ INDEX, COUNTER VAL, +/- X SCROLL SPEED)
	.WORD SET_IRQ_AND_SCROLL_SPEED_C0_BYTECODE_ARG-1				                            ; 2X SET IRQ (IRQ INDEX, COUNTER VAL, SCROLL SPEED, CHR BANK 0, CHR BANK 1)
	.WORD SET_IRQ_AND_SCROLL_LOC_C0_BYTECODE_ARG-1				                                ; 3X SET IRQ  ()
	.WORD SET_IRQ_WITH_STARTING_PPU_ADDR_C0_BYTECODE_ARG-1				                        ; 4X SET IRQ Y SCROLL START (IRQ INDEX, COUNTER VAL, PPU ADDR, CHR BANK 0, CHR BANK 1 )
	.WORD IRQ_DO_VERTICAL_SCROLL_C0_BYTECODE_ARG-1				                                ; 5X SCROLL Y (IRQ INDEX, Y SCROLL SPEED, Y SCROLL STOP)
	.WORD IRQ_STOP_OR_CHANGE_SCROLL_SPEED_C0_BYTECODE_ARG-1				                        ; 6X STOP OR CHANGE SCROLL SPEED(IRQ INDEX, NEW SCROLL SPEED)
	.WORD SET_IRQ_SCROLL_AND_NAMETABLE_C0_BYTECODE_ARG-1				                        ; 7X SET IRQ  (IRQ INDEX, X SCROLL, X NAMETABLE (1= OFFSCREEN)

SET_IRQ_C0_BYTECODE_ARG:							                                            ; 0X SET IRQ  (IRQ INDEX, IRQ COUNTER, CHR BANK 0, CHR BANK 1)					
	LDY #$03						                                                            ; SAVE DATA INDEX
	JSR SET_IRQ_BG_CHR_BANKS_FOR_SCRIPT						                                    ; SET IRQ CHR BANKS (X= IRQ INDEX)
	JSR SET_IRQ_SCROLL_AND_NAME_TABLE_EQUAL_TO_PREVIOUS						                    ; SET NEXT IRQ SCROLL X & X NAMETABLE = CURRENT(X= IRQ INDEX)
	LDA #$05						                                                            ; SET COMMAND LENGTH
	JMP SAVE_CO_COMMAND_COUNTER_VALUE					                                        ; JUMP->IRQ SET LATCH AND UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

START_SCROLL_C0_BYTECODE_ARG:							                                        ; 1X START SCROLL THREAD,SET (IRQ INDEX, COUNTER VAL, +/- X SCROLL SPEED)
	LDY #$03						                                                            ; SAVE DATA INDEX
	JSR INIT_BG_SCROLLING_TASK					                                                ; START SCROLL THREAD IF NEEDED AND SET SCROLL AMOUNT()
	JSR SET_IRQ_BG_CHR_BANKS_TO_PREVIOUS_IRQ_FOR_SCRIPT						                    ; SET NEXT IRQ CHR BANKS = CURRENT BANKS (X= IRQ INDEX) AND CLEAR IRQ COUNTER
	JSR SET_IRQ_SCROLL_AND_NAME_TABLE_EQUAL_TO_PREVIOUS						                    ; SET NEXT IRQ SCROLL X & X NAMETABLE = CURRENT(X= IRQ INDEX)
	LDA #$04						                                                            ; SET COMMAND LENGTH
	JMP SAVE_CO_COMMAND_COUNTER_VALUE					                                        ; JUMP->IRQ SET LATCH AND UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_IRQ_AND_SCROLL_SPEED_C0_BYTECODE_ARG:							                            ; 2X SET IRQ (IRQ INDEX, COUNTER VAL, SCROLL SPEED, CHR BANK 0, CHR BANK 1)
	LDY #$03						                                                            ; SAVE DATA INDEX
	JSR INIT_BG_SCROLLING_TASK					                                                ; START SCROLL THREAD IF NEEDED AND SET SCROLL AMOUNT()
	JSR SET_IRQ_BG_CHR_BANKS_FOR_SCRIPT						                                    ; SET IRQ CHR BANKS (X= IRQ INDEX)
	JSR SET_IRQ_SCROLL_AND_NAME_TABLE_EQUAL_TO_PREVIOUS						                    ; SET NEXT IRQ SCROLL X & X NAMETABLE = CURRENT(X= IRQ INDEX)
	LDA #$06						                                                            ; SET COMMAND LENGTH
	JMP SAVE_CO_COMMAND_COUNTER_VALUE					                                                            ; JUMP->SET CURRENT IRQ COUNTER AND UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_IRQ_AND_SCROLL_LOC_C0_BYTECODE_ARG:							                                ; 3X SET IRQ X SCROLL (IRQ INDEX, XSCROLL, NAMETABLE, UNUSED)  *** NOT USED
	LDY #$03						                                                            ; SAVE DATA INDEX
	JSR SET_IRQ_XSCROLL_NAMETABLE_FOR_SCRIPT						                            ; SET IRQ SCROLL X AND SCROLL X NAMETABLE (X= IRQ INDEX)
	JSR SET_IRQ_BG_CHR_BANKS_TO_PREVIOUS_IRQ_FOR_SCRIPT						                    ; SET NEXT IRQ CHR BANKS = CURRENT BANKS (X= IRQ INDEX) AND CLEAR IRQ COUNTER
	LDA #$05						                                                            ; SET COMMAND LENGTH
	JMP SAVE_CO_COMMAND_COUNTER_VALUE					                                                            ; JUMP->SET CURRENT IRQ COUNTER AND UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_IRQ_WITH_STARTING_PPU_ADDR_C0_BYTECODE_ARG:							                        ; 4X SET IRQ Y SCROLL START (IRQ INDEX, COUNTER VAL, PPU ADDR, CHR BANK 0, CHR BANK 1 )
	LDY #$03						                                                            ; SAVE DATA INDEX
	JSR SET_IRQ_XSCROLL_NAMETABLE_FOR_SCRIPT						                            ; SET IRQ SCROLL X AND SCROLL X NAMETABLE (X= IRQ INDEX)
	JSR SET_IRQ_BG_CHR_BANKS_FOR_SCRIPT						                                    ; SET IRQ CHR BANKS (X= IRQ INDEX)
	LDA #$07

SAVE_CO_COMMAND_COUNTER_VALUE:							                                        ; SET CURRENT IRQ COUNTER AND UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

PREVIOUS_IRQ_COUNTER = CURR_IRQ_COUNTER - SIZE_OF_IRQ_INFO

save_command_length = LOCAL_2

	STA save_command_length 							                                        ; SAVE COMMAND LENGTH
	LDY #$02						                                                            ;
	LDA (CURR_BG_SCRIPT_ADDR),Y		                                                            ; SET PREV IRQ COUNTER
	STA PREVIOUS_IRQ_COUNTER,X						                                            ;		
	LDA save_command_length 							                                        ; LOAD COMMAND LENGTH
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

IRQ_DO_VERTICAL_SCROLL_C0_BYTECODE_ARG:							                                 ; 5X SCROLL Y (IRQ INDEX, Y SCROLL SPEED, Y SCROLL STOP)

scroll_distance	= LOCAL_5
scroll_speed	= LOCAL_7
	
	LDA #$00						                                                            ;  
	STA scroll_speed + 1							                                                ;
	STA scroll_distance							                                                            ; 
@load_scroll_speed:	
	LDY #$02						                                                            ; LOAD Y SCROLL SPEED =
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; 
 	BPL @Loop9						                                                            ; = 16 * Y SCROLL SPEED (SIGNED)
	DEC scroll_speed + 1							                                            ;

@Loop9:								                                                            ;
	ASL								                                                            ;
	ROL scroll_speed + 1							                                            ;
	ASL								                                                            ;
	ROL scroll_speed + 1							                                            ;
	ASL								                                                            ;
	ROL scroll_speed + 1							                                            ;
	ASL								                                                            ;
	ROL scroll_speed + 1							                                            ;
	STA scroll_speed							                                                ;
	INY								                                                            ;

_WHILE PLUS							                                                            ; SCROLL Y LOOP

	RETURN_1_FRAME
	LDA scroll_distance						                                                    ; CURRENT SPLIT SCREEN Y COUNT += Y SCROLL SPEED
	CLC							                                                                ;
	ADC scroll_speed						                                                    ;
	STA scroll_distance						                                                    ;
	LDA CURR_IRQ_COUNTER-SIZE_OF_IRQ_INFO,X						                                ;
	ADC scroll_speed + 1						                                                ;
	STA CURR_IRQ_COUNTER-SIZE_OF_IRQ_INFO,X						                                ; 
	CMP (CURR_BG_SCRIPT_ADDR),Y						                                            ; DOES CURRENT SPLIT SCREEN Y COUNTER = Y STOP VALUE
	ROR							                                                                ;
	EOR scroll_speed + 1						                                                ;

_END_WHILE					                                                            		; NO->SCROLL Y LOOP
	
	LDA #$04						                                                            ; SET COMMAND LENGTH = 4
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

IRQ_STOP_OR_CHANGE_SCROLL_SPEED_C0_BYTECODE_ARG:							                    ; 6X STOP OR CHANGE SCROLL SPEED(IRQ INDEX, NEW SCROLL SPEED)
	LDY #$02						                                                            ; SAVE DATA INDEX
	JSR INIT_BG_SCROLLING_TASK					                                                ; START SCROLL THREAD IF NEEDED AND SET SCROLL AMOUNT()
	LDA #$03						                                                            ; SET COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_IRQ_SCROLL_AND_NAMETABLE_C0_BYTECODE_ARG:							                        ; 7X SET IRQ  (IRQ INDEX, X SCROLL, X NAMETABLE (1= OFFSCREEN)	
    LDY #$02						                                                            ; SET CURRENT IRQ XSCROLL AND NAMETABLE FROM DATA VALUES
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; 
	STA CURR_IRQ_XSCROLL,X						                                                ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA CURR_IRQ_NAMETABLE ,X						                                            ;
	LDA #$04						                                                            ; SET COMMAND LENGTH = 4
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CLEAR_IRQ_COMMAND_END_UPDATE_PAL_C1_BYTECODE:							                        ; #$C1_CLEAR IRQ COUNTERS AND END UPDATE PALLLETE
	LDA #$00						                                                            ;
	STA IRQ_0_COUNTER						                                                    ; SET IRQ COUNTER 0 = ZERO
	STA IRQ_1_COUNTER						                                                    ; SET IRQ COUNTER 1 = ZERO
	STA IRQ_2_COUNTER						                                                    ; SET IRQ COUNTER 2 = ZERO
	STA CHANGING_PALLETE_INDEX 						                                            ; SET BLINKING PALLETE INDEX = FIRST
	LDX #UPDATE_PALLETE_TASK						                                            ; 
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS						                            ; 
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_IRQ_BG_SCRIPT_COMMANDS_C0_to_C1

_F{_SCROLL_BG_SCRIPT_COMMANDS_C2_TO_C5															; DONE

SET_Y_SCROLL_C2_BYTECODE:								                                        ; #$C2_ SET Y SCROLL LOCATION
    LDA (CURR_BG_SCRIPT_ADDR),Y							                                        ; SET Y SCROLL = VALUE
	STA CURR_Y_SCROLL									                                        ; 
	LDA #$02											                                        ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SCROLL_BG_C3_BYTECODE:									                                        ; #$C3 SCROLL (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	JSR SET_SCROLL_SPEEDS_AND_START_SCROLL_TASK										            ; 
	LDA #$04											                                        ; SET COMMAND LENGTH = 4
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DECREASE_BG_SCROLL_C4_BYTECODE:							                                        ; #$C4 DECREASE SCROLL SPEED (Y,X), SET TIMER TO VERY LONG
	LDY #$01											                                        ; Y SCROLL SPEED/ FRAME  = Y SCROLL SPEED/ FRAME  - Y AMOUNT
	LDA #$00											                                        ;  
	SEC													                                        ;
	SBC (CURR_BG_SCRIPT_ADDR),Y							                                        ;
	STA Y_SCROLL_PER_FRAME								                                        ;
	INY													                                        ;
	LDA #$00											                                        ; X SCROLL SPEED/ FRAME  = X SCROLL SPEED/ FRAME  - X AMOUNT
	SEC													                                        ;
	SBC (CURR_BG_SCRIPT_ADDR),Y							                                        ;
	STA X_SCROLL_PER_FRAME								                                        ;
	LDA #$FF											                                        ; SET SCROLL TIMER = VERY LONG
	STA NUM_FRAMES_TO_SCROLL												                    ;
	STA NUM_FRAMES_TO_SCROLL+1												                    ;
	LDA #$03											                                        ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

INCREASE_BG_SCROLL_C5_BYTECODE:							                                        ; #$C5 SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)
	LDA (CURR_BG_SCRIPT_ADDR),Y							                                        ; SET Y SCROLL SPEED UP PER FRAME  = VALUE
	STA Y_SCROLL_INC_PER_FRAME							                                        ;
	INY													                                        ;
	LDA (CURR_BG_SCRIPT_ADDR),Y							                                        ; SET X SCROLL SPEED UP PER FRAME  = VALUE
	STA X_SCROLL_INC_PER_FRAME							                                        ;
	LDA #$03											                                        ; SET COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SCROLL_BG_SCRIPT_COMMANDS_C2_TO_C5

_F{_DRAW_TEAM_INITALS_BG_SCRIPT_COMMANDS_C7_UNUSED												; DONE
	
DRAW_TEAM_INITIALS_C7_BYTECODE:							                                        ; #$C7 DRAW TEAM INITIALS (VALUE = TEAM) *** unused
	LDA (CURR_BG_SCRIPT_ADDR),Y							                                        ; SET TEAM = VALUE
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT					                                        ; DRAW TEAM CITY/ TEAM CONFERENCE (X,Y =PPU ADDR, A= TEAM ID)
	LDA #$02											                                        ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_DRAW_TEAM_INITALS_BG_SCRIPT_COMMANDS_C7_UNUSED	

_F{_CLEAR_NAME_TABLES_SPRITES_BG_SCRIPT_COMMANDS_C8_TO_CD										; DONE

CLEAR_IRQ0_SCROLLS_NAMETABLE_C8_BYTECODE: 				                                        ; #$C8 SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0
	LDA #$00											                                        ; SET XSCROLL = 0
	STA IRQ_0_XSCROLL									                                        ; 
	STA IRQ_0_NAMETABLE									                                        ; 
	STA CURR_Y_SCROLL									                                        ; SET Y SCROLL = 0
	STA CURR_Y_SCROLL + 1								                                        ;
	LDA #$01											                                        ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CLEAR_IRQ0_XSCROLL_SET_NAMETABLE_TWO_C9_BYTECODE: 												; #$C9 UPDATE SET IRQ X SCROLL LOCATION TO NEXT NAMETABLE START
	LDA #$00											                                        ; SET XSCROLL = 0
	STA IRQ_0_XSCROLL									                                        ;
	LDA #$01											                                        ; SET XSCROLL NAME TABLE = 1
	STA IRQ_0_NAMETABLE									                                        ;
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CLEAR_NAMETABLES_CA_BYTECODE:							                                        ; #$CA CLEAR ALL NAMETABLES COMMAND
	JSR CLEAR_ALL_NAMETABLES						                                            ; CLEAR ALL NAMETABLES $2000-$2BFF()	
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_ALL_SPRITES_OFFSCREEN_CB_BYTECODE:							                                ; #$CB SET ALL SPRITES OFFSCREEN COMMAND
    JSR SET_ALL_SPR_OFFSCREEN						                                            ; SET ALL SPRITE Y POSITIONS TO OFFSCREEN ()
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CLEAR_NAMETABLES_AND_SET_ALL_SPRITES_OFFSCREEN_CC_BYTECODE:							            ; #$CC CLEAR ALL NAMETABLES AND SET ALL SPRITES OFFSCREEN 
	JSR CLEAR_ALL_NAMETABLES						                                            ; CLEAR ALL NAMETABLES $2000-$2BFF()
	JSR SET_ALL_SPR_OFFSCREEN						                                            ; SET ALL SPRITE Y POSITIONS TO OFFSCREEN ()
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CLEAR_SPECIFIC_NAMETABLE_CD_BYTECODE:							                                ; #$CD CLEAR SPECIFIC NAMETABLE 
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; CONVERT DATA VALUE TO COMMAND INDEX
	PUSH_TABLE_ADDR[tableAddr] CLEAR_NAMETABLE_COMMAND_TABLE

CLEAR_NAMETABLE_COMMAND_TABLE:							                                          ; CD COMMAND TABLE
       .WORD CLEAR_2000_NAMETABLE_DRAW_COMMAND-1 								                ; CLEAR 2000 NAME TABLE COMMAND
       .WORD CLEAR_2400_OR_2800_NAMETABLE_DRAW_COMMAND-1 						                ; CLEAR 2400 OR 2800 NAME TABLE COMMAND
       .WORD CLEAR_ON_SCREEN_IRQO_NAMETABLE_DRAW_COMMAND-1 						                ; CLEAR ON-SCREEN IRQ0 NAME TABLE
       .WORD CLEAR_OFF_SCREEN_IRQO_NAMETABLE_DRAW_COMMAND-1 					                ; CLEAR OFF-SCREEN IRQ0 NAME TABLE
       .WORD FILL_ALL_BG_WITH_TILE_SET_ALL_SPRITES_OFFSCREEN_DRAW_COMMAND-1 	                ; SET SPRITES OFF SCREEN, FILL BACKGROUND, CLEAR ATTRIBUTE TABLE
       

CLEAR_2000_NAMETABLE_DRAW_COMMAND:												                ; CLEAR 2000 NAME TABLE 
	JSR CLEAR_2000_NAMETABLE													                ; CLEAR 2000 NAMETABLE()
	LDA #$02																	                ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR											                ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CLEAR_2400_OR_2800_NAMETABLE_DRAW_COMMAND:										                ; CLEAR 2400 OR 2800 NAME TABLE BASED ON MIRRORING
	LDA GAME_STATUS																                ; DOES GAME STATUS = HORIZONTAL MIRRORING SET
	AND #$40																	                ; 
	BNE CLEAR_2800_NAMETABLE_DRAW_COMMAND										                ; YES->CLEAR 2800 NAMETABLE						
	JSR CLEAR_2400_NAMETABLE													                ; CLEAR 2400 NAMETABLE()
	LDA #$02																	                ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR											                ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CLEAR_2800_NAMETABLE_DRAW_COMMAND:												                ; CLEAR 2800 NAMETABLE
	JSR CLEAR_2800_NAMETABLE													                ; CLEAR 2800 NAMETABLE()
	LDA #$02																	                ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR											                ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CLEAR_ON_SCREEN_IRQO_NAMETABLE_DRAW_COMMAND:									                ; CLEAR ON-SCREEN IRQ0 NAME TABLE
	LDA IRQ_0_NAMETABLE															                ; IS IRQ NAMETABLE =0
	LSR																			                ;
	BCC CLEAR_2000_NAMETABLE_DRAW_COMMAND										                ; YES-> CLEAR 2000 NAME TABLE COMMAND
	JMP CLEAR_2400_OR_2800_NAMETABLE_DRAW_COMMAND								                ; NO-> CLEAR 2400 OR 2800 NAME TABLE BASED ON MIRRORING

CLEAR_OFF_SCREEN_IRQO_NAMETABLE_DRAW_COMMAND:									                ; CLEAR OFF-SCREEN IRQ0 NAME TABLE
	LDA IRQ_0_NAMETABLE															                ; IS IRQ NAMETABLE =0
	LSR																			                ;
	BCC CLEAR_2400_OR_2800_NAMETABLE_DRAW_COMMAND								                ; YES-> CLEAR 2400 OR 2800 NAME TABLE BASED ON MIRRORING
	JMP CLEAR_2000_NAMETABLE_DRAW_COMMAND										                ; NO-> CLEAR 2000 NAME TABLE COMMAND


FILL_ALL_BG_WITH_TILE_SET_ALL_SPRITES_OFFSCREEN_DRAW_COMMAND:					                ; SET SPRITES OFF SCREEN, FILL BACKGROUND, CLEAR ATTRIBUTE TABLE

tiles_per_row		=  LOCAL_1
number_of_rows		=  LOCAL_2
fill_tile_id		=  LOCAL_8
fill_atrib_value	=  LOCAL_8

	JSR SET_ALL_SPR_OFFSCREEN													                ; SET ALL SPRITE Y POSITIONS TO OFFSCREEN ()
	LDY #$02																	                ; SAVE TILE TO FILL BACKGROUNDS
	LDA (CURR_BG_SCRIPT_ADDR),Y													                ;
	STA fill_tile_id						    											     ;
	LDX #>NAMETABLE1_START														                ; LOAD $2000 HIGH BYTE
	JSR @fill_nametable															                ; FILL NAMETABLE(X= UPPER BYTE OF NAMETABLE, A= TILE TO FILL) 
	LDX #>NAMETABLE2_START														                ; LOAD $2400 HIGH BYTE
	JSR @fill_nametable															                ; FILL NAMETABLE(X= UPPER BYTE OF NAMETABLE, A= TILE TO FILL) 
	LDX #>NAMETABLE3_START														                ; LOAD $2800 HIGH BYTE
	JSR @fill_nametable															                ; FILL NAMETABLE(X= UPPER BYTE OF NAMETABLE, A= TILE TO FILL

@set_attrib_table_values	
	LDA #$00																	                ; SET ATTRIBUTE TABLE COLOR SET = FIRST COLOR SET
	STA fill_atrib_value						    											    ;
	LDX #>ATTR_TABLE1_START														                ; LOAD $23C0 HIGH BYTE
	JSR @fill_attr_table														                ; FILL ATTRIBUTE TABLE (A= COLOR SET, X= UPPER BYTE OF ATTRIB TABLE)
	LDX #>ATTR_TABLE2_START														                ; LOAD $27C0 HIGH BYTE
	JSR @fill_attr_table														                ; FILL ATTRIBUTE TABLE (A= COLOR SET, X= UPPER BYTE OF ATTRIB TABLE)
	LDX #>ATTR_TABLE3_START																        ; LOAD $2BC0 HIGH BYTE
	JSR @fill_attr_table														                ; FILL ATTRIBUTE TABLE (A= COLOR SET, X= UPPER BYTE OF ATTRIB TABLE)
	LDA #$03																	                ; SET COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR											                ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

@fill_nametable:																                ; FILL NAMETABLE(X= UPPER BYTE OF NAMETABLE, A= TILE TO FILL)
	LDA #NUM_ROWS_IN_NAME_TABLE																	; SET NUM ROWS = 30
	STA number_of_rows																		    ;
	LDY #$00																	                ; SET LOW BYTE OF NAMETABLE (2000, 2400, 2800)
	JMP @fill_ppu_location																        ;
	
@fill_attr_table:																                ; FILL ATTRIBUTE TABLE (A= COLOR SET)
	LDA #NUM_ROWS_IN_ATTRIB_TABLE																; SET NUM ROWS = 2
	STA number_of_rows																		    ;
	LDY #$C0																	                ; SET LOW BYTE OF ATTRIB TABLE (23C0, 27C0, 2BC0)
	
@fill_ppu_location:																		         ;
	LDA #LENGTH_OF_ONE_ROW																	    ; SET LENGTH = ONE ROW
	STA tiles_per_row																		    ;
	LDA fill_tile_id																		    ; LOAD TILE
	JMP FILL_SCREEN_TILE_AREA													                ; FILL PPU WITH TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, A=TILE)

_F}_CLEAR_NAME_TABLES_SPRITES_BG_SCRIPT_COMMANDS_C8_TO_C

_F{_SET_BG_OR_SPR_CHRBANKS_BG_SCRIPT_COMMANDS_D0_TO_D1											; DONE 

SET_IRQ0_BG_CHR_BANKS_D0_BYTECODE:												                ; #$D0 SET IRQ 0 BACKGROUND CHR BANKS
	LDA (CURR_BG_SCRIPT_ADDR),Y													                ; SET $0000 BG CHR BANK
	STA IRQ_0_BG_0000															                ;
	INY																			                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y													                ; SET $0800 BG CHR BANK
	STA IRQ_0_BG_0800															                ;
	LDA #$03																	                ; SET COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR											                ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_SOFT_SPR_CHR_BANKS_D1_BYTECODE:												                ; #$D1 SET SOFT SPRITE CHR BANKS 
	LDA (CURR_BG_SCRIPT_ADDR),Y													                ; SET $1000 SPR CHR BANK
	STA_ABS_A_ZP SOFT_CHR_1000_BANK												                ;
	INY																			                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y													                ; SET $1400 SPR CHR BANK
	STA_ABS_A_ZP SOFT_CHR_1400_BANK	
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y													                ; SET $1800 SPR CHR BANK
	STA_ABS_A_ZP SOFT_CHR_1800_BANK	
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y													                ; SET $1A00 SPR CHR BANK
	STA_ABS_A_ZP SOFT_CHR_1C00_BANK	
	LDA #$05																	                ; SET COMMAND LENGTH = 5
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR											                ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_BG_OR_SPR_CHRBANKS_BG_SCRIPT_COMMANDS_D0_TO_D1

_F{_CLEAR_SCROLL_ONCE_SPR_METATILE_DONE_BG_SCRIPT_COMMAND_D2									; DONE

SET_IRQO_NAMETABLE_CLEAR_SCROLL_ONCE_METASPR_TASK_DONE_D2_BYTECODE:							    ; #$D2 SWITCH SCROLL LOCATION ONCE TASK 3 IS EMPTY
	
_WHILE ALWAYS	

	LDA METATILE_TASK																		    ; IS TASK 3 STATUS = EMPTY
	BEQ @set_scroll																	            ; 
	RETURN_1_FRAME

_END_WHILE															                			;

@set_scroll:																			        ; TASK 3 STATUS = EMPTY
	BIT GAME_STATUS																                ; IS GAME STATUS = HORIZONTAL MIRRORING SET
	BVS @horizontal_mirroring_set																; YES-> HORIZONTAL MIRRORING SET
	
@set_irq0_name_table:	
	LDA IRQ_0_NAMETABLE															                ; SWITCH IRQ X SCROLL SCREEN
	EOR #$01																	                ;
	STA IRQ_0_NAMETABLE															                ;
	JMP @clear_x_y_scroll																	    ;
	
@horizontal_mirroring_set:																		; HORIZONTAL MIRRORING SET
	LDA CURR_Y_SCROLL + 1														                ; SET Y SCROLL HIGH= NEXT SCREEN
	EOR #$01																	                ;
	STA CURR_Y_SCROLL + 1														                ;
	
@clear_x_y_scroll:																			    ; SET IRQ X SCROLL LOW AND Y SCROLL LOW
	LDA #$00																	                ; SET IRQ X SCROLL LOCATION = 0 
	STA IRQ_0_XSCROLL															                ;
	STA CURR_Y_SCROLL															                ; SET Y SCROLL LOW = 0 
	LDA #$01																	                ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR											                ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_CLEAR_SCROLL_ONCE_SPR_METATILE_DONE_BG_SCRIPT_COMMAND_D2

_F{_CONVERT_TO_YARDS_GO_DIST_TO_BCD_BG_SCRIPT_COMMAND_D3										; DONE
																				                ; USED IN SLIDE BAR AND PLAY CALL
CONVERT_TO_GO_DIST_TO_NUMBER_D3_BYTECODE: 										                ; #$D3 CONVERT FIRST DOWN DISTANCE TO NUMBER
	
first_down_x_loc		= LOCAL_7
yards_to_go				= LOCAL_7
yardage_BCD				= LOCAL_7

MAX_DISPLAYED_YARDAGE	= $99
	
	LDA POSSESSION_STATUS														                ; IS POSESSION = P2
	BMI @p2_has_ball																	                ;
	

@p1_has_ball:	
	LDA FD_MARKER_X																		        ; = LOS MARKER + 10 YARDS
	CLC																			                ;
	ADC #(ONE_YARD * 10)																	    ;
	STA first_down_x_loc																		;
	LDA FD_MARKER_X +1															                ;
	ADC #$00																	                ;
	STA first_down_x_loc+1																		;
	LDA first_down_x_loc																		;
	CMP #<FRONT_RIGHT_ENDZONE													                ; IS P1 FD MARKER PAST P1 FRONT OF ENDZONE?
	LDA first_down_x_loc+1																		;
	SBC #>FRONT_RIGHT_ENDZONE													                ;
	BCC @get_P1_yards_to_go																	                ; NO->P1 LOS X - FD MARKER + 10

@set_first_down_front_of_right_endzone:	
	LDA #<FRONT_RIGHT_ENDZONE																	; SET LOC= P1 FRONT OF ENDZONE
	STA first_down_x_loc						                                                ;
	LDA #>FRONT_RIGHT_ENDZONE						                                            ;
	STA first_down_x_loc+1						                                                ;

@get_P1_yards_to_go:							                                                                ; P1 LOS X - FD MARKER + 10
	LDA first_down_x_loc						                                                ;
	SEC							                                                                ;
	SBC LOS_X						                                                            ; 
	STA first_down_x_loc						                                                ;
	LDA first_down_x_loc +1						                                                ;
	SBC LOS_X + 1						                                                        ;
	STA first_down_x_loc+1					                                                    ;
	JMP @convert_distance_to_BCD						                                        ; JUMP-> CONVERT FD DISTANCE TO NUMBER

@p2_has_ball:							                                                        ; P2 HAS BALL
	LDA FD_MARKER_X						                                                        ; = LOS MARKER - 10 YARDS
	SEC							                                                                ;
	SBC #(ONE_YARD * 10)						                                                ;
	STA first_down_x_loc						                                                ;
	LDA FD_MARKER_X + 1						                                                    ;
	SBC #$00						                                                            ;
	STA first_down_x_loc+1						                                                ;
	LDA first_down_x_loc						                                                ;
	CMP #<FRONT_LEFT_ENDZONE						                                            ; IS MARKER IS P1 FD MARKER PAST P2 FRONT OF ENDZONE?	
	LDA first_down_x_loc+1						                                                ;
	SBC #>FRONT_LEFT_ENDZONE						                                            ;
	BCS @get_P2_yards_to_go						                                                ; NO-> P2 LOS X - FD MARKER + 10

@set_first_down_front_of_left_endzone:		
	LDA #<FRONT_LEFT_ENDZONE						                                            ; SET LOC= P2 FRONT OF ENDZONE
	STA first_down_x_loc						                                                ;
	LDA #>FRONT_LEFT_ENDZONE						                                            ;
	STA first_down_x_loc+1						                                                ;

@get_P2_yards_to_go	:							                                                ; P2 LOS X - FD MARKER + 10
	LDA LOS_X					                                                                ;
	SEC							                                                                ;
	SBC first_down_x_loc						                                                ;
	STA first_down_x_loc						                                                ;
	LDA LOS_X + 1						                                                        ;
	SBC first_down_x_loc + 1						                                                ;
	STA first_down_x_loc + 1					                                                    ;

@convert_distance_to_BCD:							                                            ; CONVERT FD DISTANCE TO NUMBER
	
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] yards_to_go, (ONE_YARD -$01)					    ; ROUN TO NEAREST YARD
	
	UNSIGNED_16_BIT_DIVIDE_8[zp] yards_to_go													; DIVIDE BY 8 since each 08 = 1 yard
	
	
	LDA yardage_BCD						                                                        ;
	JSR HEX_TO_2_DIGIT_DEC						                                                ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDA yardage_BCD + 1						                                                    ; IS DISTANCE > 99 YARDS
	BEQ @draw_first_down_distance						                                        ; NO-> DRAW FIRST DOWN DISTANCE
	
@set_distance_to_99_yards	
	LDA #MAX_DISPLAYED_YARDAGE						                                            ; SET MAX DISTANCE = 99 YARDS
	STA yardage_BCD						                                                        ;

@draw_first_down_distance:							                                            ; DRAW FIRST DOWN DISTANCE
	LDA yardage_BCD						                                                         ; LOAD NUMBER
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_CONVERT_TO_YARDS_GO_DIST_TO_BCD_BG_SCRIPT_COMMAND_D3

_F{_DRAW_TEAM_ABBREVIATIONS_BG_SCRIPT_COMMANDS_D4_TO_D6											; DONE

DRAW_P1_TEAM_ABBREV_D4_BYTECODE: 							                                    ; #$D4 DRAW P1 TEAM ABREV
	LDA P1_TEAM						                                                            ; LOAD P1 TEAM
	JMP DRAW_TEAM_ABBREVIATION_FOR_BG_SCRIPT					                                ; JUMP DRAW TEAM ABBREVIATION (A= TEAM)
	
DRAW_P2_TEAM_ABBREV_D5_BYTECODE:							                                    ; #$D5 DRAW P2 TEAM ABREV
	LDA P2_TEAM						                                                            ; LOAD P2 TEAM

DRAW_TEAM_ABBREVIATION_FOR_BG_SCRIPT:							                                ; DRAW TEAM ABBREVIATION (A= TEAM)
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT						                                    ; DRAW TEAM ABREV, OR CITY, OR NAME, OR CONFERENCE (X,Y =PPU ADDR, A= TEAM ID)
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_TEAM_ABBREV_D6_BYTECODE: 							                                        ; #$D6 DRAW TEAM ABREV (DATA= TEAM)
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD TEAM
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[] 
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT						                                    ; DRAW TEAM ABREV, OR CITY, OR NAME, OR CONFERENCE (X,Y =PPU ADDR, A= TEAM ID)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_DRAW_TEAM_ABBREVIATIONS_BG_SCRIPT_COMMANDS_D4_TO_D5

_F{_GET_UNIFORM_CUTSCENE_COLORS_BG_SCRIPT_COMMANDS_D7_TO_D9										; DONE

GET_OFFENSE_SPR_PAL_SET_BG_PAL_FADE_IN_D7_BYTECODE:							                    ; #$D7 GET P1 OR P2 PALLETE, SET BG PAL AND FADE IN
	LDA #$00						                                                            ; SET PALLETE CHECK = P1 OR P2 
	JMP GET_CUTSCENE_BG_UNIFORM_COLOR_BG_SCRIPT					                                ; *** could use BEQ
	
GET_DEFENSE_SPR_PAL_SET_BG_PAL_FADE_IN_D8_BYTECODE:							                    ; #$D8 GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN
	LDA #$FF						                                                            ; SET PALLETE CHECK = DEFENSE/SPECIAL TEAMS
	
GET_CUTSCENE_BG_UNIFORM_COLOR_BG_SCRIPT:							                            ; GET CUTSCENE UNIFORM AND SKIN COLOR

offensive_player_boolean		= LOCAL_5	; 00 = offense, FF= defense

	STA offensive_player_boolean						                                        ; SET PLAYER CHECK
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_CUTSCENE_UNI_COLORS_BANK,  BANK_JUMP_SET_CUTSCENE_UNIFORM_AND_SKIN_COLOR ; *** can use actual addr	

@set_bg_pal_index:	
	LDY #$01						                                                            ; SET BG PALLETE INDEX = DATA VALUE
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; 
	AND #$7F						                                                            ;
	STA BG_PAL_INDEX						                                                    ; 
	JSR GET_SAVE_BG_PAL_TO_BUFFER						                                        ; SAVE BACKGROUND PALETTE IN BUFFER(A= BG PAL INDEX)

@check_for_fade_in:	
	LDY #$01						                                                            ; DOES DATA VALUE = FADE IN COMMAND
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	BPL @fade_in_pallettes					                                                    ; YES->FADE IN PALLETES
	
	JSR SET_BG_SPR_FULLY_FADED_IN						                                        ; SET PALLETES TO FULLY FADED IN()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

@fade_in_pallettes:							                                                    ; FADE IN PALLETES
	JSR FADE_IN_BG_AND_SPR_PAL						                                            ; FADE IN BACKGROUND AND SPRITE PALLETES()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

GET_QB_UNI_BG_PAL_FADE_IN_D9_BYTECODE:							                                ; #$D9 GET P1/P2 QB UNIFORM AND SKIN COLOR AND SET PALLETE AND FADE OUT

save_p1_icon_id	= LOCAL_3
save_p2_icon_id	= LOCAL_4

	LDA P1_MAN_POS_ID_ICON_STATUS						                                        ; SAVE P1 ICON
	STA save_p1_icon_id						                                                    ;
	LDA P2_MAN_POS_ID_ICON_STATUS						                                        ; SAVE P2 ICON
	STA save_p2_icon_id						                                                    ;
	LDA #$00						                                                            ;	
    STA P1_MAN_POS_ID_ICON_STATUS						                                        ; SET P1 ICON = QB
	STA P2_MAN_POS_ID_ICON_STATUS						                                        ; SET P2 ICON = QB

@set_player_is_on_offense	
	LDA #$00						                                                            ;
	STA offensive_player_boolean
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_CUTSCENE_UNI_COLORS_BANK,  BANK_JUMP_SET_CUTSCENE_UNIFORM_AND_SKIN_COLOR ; *** can use actual addr	 

	
@restore_icon_ids:	
	LDA save_p1_icon_id						                                                                ; RESTORE P1 ICON
	STA P1_MAN_POS_ID_ICON_STATUS						                                        ;
	LDA save_p2_icon_id						                                                                ; RESTORE P2 ICON
	STA P2_MAN_POS_ID_ICON_STATUS						                                        ; SET BG PALLETE INDEX = DATA VALUE
	
@get_bg_pallette_and_fade_in:	
	LDY #$01						                                                            ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	AND #$7F						                                                            ;
	STA BG_PAL_INDEX						                                                    ; 
	JSR GET_SAVE_BG_PAL_TO_BUFFER						                                        ; SAVE BACKGROUND PALETTE IN BUFFER(A= BG PAL INDEX)
	JSR SET_BG_SPR_FULLY_FADED_IN						                                        ; SET PALLETES TO FULLY FADED IN()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_GET_UNIFORM_CUTSCENE_COLORS_BG_SCRIPT_COMMANDS_D7_TO_D9

_F{_DRAW_NUMBERS_NAMES_BG_SCRIPT_COMMANDS_DA_TO_DC												; DONE

DRAW_P1_NUMBER_NAME_DA_BYTECODE:							                                    ; #$DA DRAW P1 PLAYER NUMBER AND NAME

roster_id	= LOCAL_7
team_id		= LOCAL_8

	LDA SOFT_A000_BANK						                                                    ; SAVE CURRENT $A000 BANK
	PHA							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET PLAYER TO DRAW = DATA VALUE
	STA roster_id						                                                                ;
	LDA P1_TEAM						                                                            ; SET TEAM = P1 TEAM
	STA team_id						                                                                ;
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_PLAYER_NUM_AND_NAME						                                        ; DRAW PLAYER NUMBER AND NAME(X,Y= PPU LOCATION,$44=PLAYER, $45=TEAM)
	PLA							                                                                ; RESTORE $A000 BANK
	TAX							                                                                ;
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_CURRENT_TEAM_NUMBER_NAME_DB_BYTECODE: 							                            ; #$DB DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA
	LDA SOFT_A000_BANK						                                                    ; SAVE CURRENT $A000 BANK
	PHA							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET PLAYER TO DRAW = DATA VALUE
	STA roster_id						                                                        ;
	LDA CURRENT_TEAM						                                                    ; SET TEAM = CURRENT TEAM
	STA team_id						                                                            ;
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_PLAYER_NAME_NUMBER_CENTERED_FOR_BG_SCRIPT					                        ; DRAW CURRENT TEAM PLAYER NAME  AND NUMBER CTD ($44= PLAYER, $45= TEAM)
	PLA							                                                                ; RESTORE $A000 BANK
	TAX							                                                                ;
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_PLAYER_NAME_LARGE_CENTERED_DC_BYTECODE:							                        ; #$DC DRAW PLAYER NAME LARGE CENTERED
	LDA SOFT_A000_BANK						                                                    ; SAVE CURRENT $A000 BANK
	PHA							                                                                ; 
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET PLAYER TO DRAW = DATA VALUE
	STA roster_id						                                                                ;
	LDA CURRENT_TEAM						                                                    ; SET TEAM = CURRENT TEAM
	STA team_id						                                                                ;
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_PLAYER_NAME_CENTERED						                                        ; DRAW LARGE PLAYER TEXT CENTERED(A= TEAM, X= PLAYER)
	PLA							                                                                ; RESTORE $A000 BANK
	TAX							                                                                ;
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_DRAW_NUMBERS_NAMES_BG_SCRIPT_COMMANDS_DA_TO_DC	

_F{_START_OR_END_CHANGING_PALLETE_BG_SCRIPT_COMMAND_DD											; DONE
	
START_OR_END_BLINKING_PALLETE_DD_BYTECODE:							                            ; #$DD START OR END BLINKING PALLETE()
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD BLINKING PALLETE INDEX OR END COMMAND
	JSR START_CHANGING_PALLETE_TASK					                                            ; START OR END BLINKING PALLETE TASK(A= PAL INDEX OR END COMMAND)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_START_OR_END_CHANGING_PALLETE_BG_SCRIPT_COMMAND_DD	

_F{_DRAW_ONE_BYTE_NUMBER_BG_SCRIPT_COMMANDS_DE_TO_DF											; DONE

DRAW_ONE_BYTE_NUMBER_FROM_DATA_DE_BYTECODE:							                            ; #$DE DRAW NUMBER (8-BIT) FROM DATA ADDR()

number_data_addr	= LOCAL_1

	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET NUMBER ADDR = DATA ADDR
	STA number_data_addr						                                                ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA number_data_addr + 1						                                            ;
	LDY #$00						                                                            ; LOAD NUMBER TO DRAW
	LDA (number_data_addr),Y						                                            ;

CONVERT_NUMBER_TO_TILE_IDS_BG_SCRIPT:							                                ; CONVERT NUMBER TO TILES AND DRAW
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	LDA #$03						                                                            ; SET COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_ONE_BYTE_NUMBER_FROM_DATA_PLUS_ONE_DF_BYTECODE: 							                ; #$DF DRAW NUMBER + 1 (8-BIT) FROM DATA ADDR()
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET NUMBER ADDR = DATA ADDR
	STA number_data_addr						                                                ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA number_data_addr + 1						                                            ; LOAD NUMBER TO DRAW
	LDY #$00						                                                            ;
	LDA (number_data_addr),Y						                                                            ;
	CLC							                                                                ;
	ADC #$01						                                                            ; = NUMBER TO DRAW + 1
	JMP CONVERT_NUMBER_TO_TILE_IDS_BG_SCRIPT					                                ; JUMP->CONVERT NUMBER TO TILES AND DRAW
	
_F}_DRAW_ONE_BYTE_NUMBER_BG_SCRIPT_COMMANDS_DE_TO_DF	

_F{_UPDATES_SPRITES_FROM_DATA_BG_SCRIPT_COMMAND_E0												; DONE

UPDATES_SPRITES_FROM_DATA_E0_BYTECODE:							                                ; #$E0 UPDATE SPRITES(SPRITE DATA ADDR)
	
sprite_data_addr = LOCAL_1
data_length		 = LOCAL_4
SPRITE_INFO[]	=  SPRITE_START
	
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD DATA ADDR
	STA sprite_data_addr						                                                ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA sprite_data_addr + 1						                                            ;

@get_sprite_index:	
	LDY #$00						                                                            ; LOAD SPRITE INDEX
	LDA (sprite_data_addr),Y						                                            ;
	TAX							                                                                ;

@get_data_length:	
	INY							                                                                ;
	LDA (sprite_data_addr),Y						                                            ; LOAD DATA LENGTH
	STA data_length							                                                    ;
	INY							                                                                ;

_WHILE NOT_EQUAL							                                                    ; UPDATE SPRITE INFO LOOP
	
	LDA (sprite_data_addr),Y						                                            ;
	STA SPRITE_INFO[],X						                                                    ; SET SPRITE INFO = DATA VALUE
	INX							                                                                ;
	INY							                                                                ;
	DEC data_length							                                                    ; DONE WITH DATA?

_END_WHILE
	LDA #$03						                                                            ; SET COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_UPDATES_SPRITES_FROM_DATA_BG_SCRIPT_COMMAND_E0

_F{_SET_BG_SCRIPT_DRAW_DELAY_BG_SCRIPT_COMMAND_E1												; DONE

SET_BG_SCRIPT_DRAW_DELAY_E1_BYTECODE: 							                                ; #$E1 SET DRAW DELAY 
	LDA (CURR_BG_SCRIPT_ADDR),Y							                                        ; SET DRAW DELAY = DATA VALUE (00= DO FOREVER)
	STA NUM_FRAMES_DRAW_SCRIPT												                    ; 
	LDA #$02											                                        ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_BG_SCRIPT_DRAW_DELAY_BG_SCRIPT_COMMAND_E1

_F{_CLEAR_OFFSCREEN_BANNER_BG_SCRIPT_COMMAND_E2													; DONE

CLEAR_OFFSCREEN_BANNER_E2_BYTECODE: 							                                ; #$E2 CLEAR OFFSCREEN BANNER 

tiles_per_row					= LOCAL_1
number_of_rows					= LOCAL_2
NUM_ROWS_IN_OFFSCREEN_BANNER	= $02

	LDY #<OFFSCREEN_BANNER_PPU_ADDR						                                        ; SET PPU ADDR = 2440
	LDX #>OFFSCREEN_BANNER_PPU_ADDR	
	LDA #NUM_ROWS_IN_OFFSCREEN_BANNER						                                    ; SET NUM ROWS = 2
	STA number_of_rows						                                                    ;
	LDA #LENGTH_OF_ONE_ROW						                                                ; SET LENGTH = ONE ROW
	STA tiles_per_row						                                                    ;
	JSR FILL_SCREEN_BLANK_TILE_AREA					                                            ; FILL PPU WITH BLANK TILE(X,Y= PPU ADDR, 3F= NUM ROWS, 3E= LENGTH)
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_CLEAR_OFFSCREEN_BANNER_BG_SCRIPT_COMMAND_E2

_F{_PALLETE_BG_SCRIPT_COMMANDS_E3_TO_EE															; DONE
	
SET_AND_FADE_IN_BG_PAL_E3_BYTECODE:							                                    ; #$E3 SET AND FADE IN BG PALLETE
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD BG PALLETE INDEX
	JSR FADE_IN_BG_PAL				                                                            ; SET AND FADE IN BACKGROUND PALLETE(A= PALLETE ID)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)
	
SET_AND_FADE_IN_SPR_PAL_E4_BYTECODE:							                                ; #$E4 SET AND FADE IN SPR PALLETE
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD SPR PALLETE INDEX
	JSR FADE_IN_SPR_PAL				                                                            ; SET AND FADE IN SPRITE PALLETE(A= PALLETE ID)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_AND_FADE_IN_BG_AND_SPR_PAL_E5_BYTECODE:							                            ; #$E5 SET AND BG AND SPR PALLETE AND FADE IN	
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; 
	CMP #$FF						                                                            ; ARE THERE NEW PALLETES TO LOAD
	BEQ @fade_in						                                                        ; NO-> SET AND FADE IN PALLETES WITH NO BUFFER

@save_bg_pallete_index:	
	PHA							                                                                ; 
	
@set_sprite_pallete_index:	
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	TAX							                                                                ; SET SPR PAL INDEX
@set_bg_pallete_index:	
	PLA							                                                                ; SET BG PAL INDEX
	JSR SET_AND_FADE_IN_BG_SPR_PAL						                                        ; BUFFER AND FADE BG AND SPR PAL IN(A= BG PAL, X= SPR PAL)
	LDA #$03						                                                            ; SET COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

@fade_in:							                                                             ; SET AND FADE IN PALLETES WITH NO BUFFER
	JSR FADE_IN_BG_AND_SPR_PAL						                                            ; FADE IN BACKGROUND AND SPRITE PALLETES()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

END_PAL_TASK_AND_FADE_OUT_BG_PAL_E6_BYTECODE:							                        ; #$E6 FADE OUT BG PALLETE
	JSR END_CHANGING_PALLETE_TASK					                                             ; END UPDATE PALLETE TASK, CLEAR BLINKING PAL INDEX()
	JSR FADE_OUT_BG_PAL						                                                    ; FADE_OUT BACKGROUND PALLETE()
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

END_PAL_TASK_AND_FADE_OUT_SPR_PAL_E7_BYTECODE:							                        ; #$E7 FADE OUT SPR PALLETE
	JSR END_CHANGING_PALLETE_TASK					                                            ; END UPDATE PALLETE TASK, CLEAR BLINKING PAL INDEX()
	JSR FADE_OUT_SPR_PAL						                                                ; FADE_OUT SPRITE PALLETE()
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

END_PAL_TASK_AND_FADE_OUT_BG_AND_SPR_PAL_E8_BYTECODE: 							                ; #$E8 FADE OUT BG AND SPR PALLETE
	JSR END_CHANGING_PALLETE_TASK					                                            ; END UPDATE PALLETE TASK, CLEAR BLINKING PAL INDEX()
	JSR FADE_OUT_BG_SPR_PAL						                                                ; FADE_OUT BG AND SPRITE PALLETE()
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_BG_PAL_AND_SET_TO_FULLY_FADED_IN_E9_BYTECODE:							                    ; #$E9 SET BG PAL AND SET TO FULLY FADED IN
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD BG PAL
	JSR UPDATE_BG_PAL_SET_TO_FULLY_FADED_IN						                                ; SET BACKGROUND PALLETE AND SET TO FULLY FADED IN()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_SPR_PAL_AND_SET_TO_FULLY_FADED_IN_EA_BYTECODE:							                    ; #$EA SET SPR PAL AND SET TO FULLY FADED IN
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD SPR PAL
	JSR UPDATE_SPR_PAL_SET_TO_FULLY_FADED_IN						                            ; SET SPRITE PALLETE AND SET TO FULLY FADED IN()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_BG_AND_SPR_PAL_AND_SET_TO_FULLY_FADED_IN_EB_BYTECODE: 							            ; #$EB SET BG AND SPR PAL AND SET TO FULLY FADED IN
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD BG PALLETE INDEX FROM DATA VALUE 
	PHA							                                                                ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD SPR PALLETE INDEX FROM DATA VALUE
	TAX							                                                                ; SET SPR PALLETE
	PLA							                                                                ; SET BG PALLETE
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN						                                ; SET BACKGROUND AND SPRITE PALLETE AND SET TO FULLY FADED IN(A= BG, X= SPR)
	LDA #$03						                                                            ; SET COMMAND LENGTH = 3
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_BG_AND_SPR_PAL_TO_FULLY_FADED_IN_EC_BYTECODE:							                    ; #$EC SET BG AND SPR PAL TO FULLY FADED IN
	JSR SET_BG_SPR_FULLY_FADED_IN						                                        ; SET PALLETES TO FULLY FADED IN()
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

END_UPDATE_PALLETE_FADE_OUT_BG_SPR_ED_BYTECODE: 							                    ; #$ED END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT 
	JSR END_CHANGING_PALLETE_TASK															                    ; END UPDATE PALLETE TASK, CLEAR BLINKING PAL INDEX()
	JSR SET_BG_SPR_FULLY_FADED_OUT											                    ; SET PALLETES TO FULLY FADED OUT()
	LDA #$01																                    ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR										                    ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_BG_SPR_PAL_TO_FULLY_FADED_IN_SET_SINGLE_COLOR_EE_BYTECODE:			                    ; #$EE SET BG AND SPR PAL, SET TO FULLY FADED, UPDATE SINGLE COLOR IN PAL
	LDA (CURR_BG_SCRIPT_ADDR),Y												                    ; 
	STA BG_PAL_INDEX														                    ; SET SOFT BG PAL INDEX = DATA BG PAL VALUE
	INY																		                    ;
	LDA (CURR_BG_SCRIPT_ADDR),Y												                    ;
	STA SPR_PAL_INDEX														                    ; SET SOFT SPR PAL INDEX = DATA SPR PAL VALUE
	JSR GET_SAVE_BG_PAL_TO_BUFFER											                    ; SAVE BACKGROUND PALETTE IN BUFFER()
	JSR GET_SAVE_SPR_PAL_TO_BUFFER											                    ; SAVE SPRITE  PALETTE IN BUFFER()
	LDA #FULLY_FADED_IN						                                                    ; 
	STA BG_FADE						                                                            ; SET SOFT BG FADE = FULLY FADED IN 
	STA SPR_FADE						                                                        ; SET SOFT SPR FADE = FULLY FADED IN
	LDY #$03						                                                            ;	
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD PALLETE INDEX FROM DATA PAL INDEX
	AND #$1F						                                                            ;
	TAX							                                                                ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET PALLETE VALUE = DATA PAL COLOR
	STA PALLETE_BUFFER_START,X						                                            ;
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER						                                ; SAVE PALETTE BUFFER TO BUFFER ()
	LDA #$05						                                                            ; SET COMMAND LENGTH = 5
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_PALLETE_BG_SCRIPT_COMMANDS_E3_TO_EE

_F{_CLEAR_X_AND_Y_SCROLL_BG_SCRIPT_COMMAND_EF													; DONE

CLEAR_X_AND_Y_SCROLL_EF_BYTECODE:							                                    ; #$EF SET Y SCROOL AND IRQO XSCROLL TO ZERO
	LDA #$00						                                                            ; 
	STA CURR_Y_SCROLL						                                                    ; SET Y SCROLL = 0
	STA CURR_Y_SCROLL + 1						                                                ;
	STA IRQ_0_XSCROLL						                                                    ; SET IRQ X SCROLL = 0
	STA IRQ_0_NAMETABLE						                                                    ;
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_CLEAR_X_AND_Y_SCROLL_BG_SCRIPT_COMMAND_EF	

_F{_SET_SCENE_SIDE_BASED_ON_POSSESSION_BG_SCRIPT_COMMAND_F0										; DONE

SET_SCENE_SIDE_BASED_ON_POSSESSION_F0_BYTECODE:							                        ; #$F0 SET GAME STATUS($2D) CUTSCENE SIDE
	LDA POSSESSION_STATUS						                                                ; IS POSS = P2
	BMI @p2_has_ball						                                                    ; YES-> P2 HAS BALL
	SET_GAME_STATUS_P1_SIDE_CUTSCENE[]
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

@p2_has_ball:							                                                        ; SET GAME STATUS = P2 CUTSCENE
	SET_GAME_STATUS_P2_SIDE_CUTSCENE[]
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_SCENE_SIDE_BASED_ON_POSSESSION_BG_SCRIPT_COMMAND_F0

_F{_SET_MIRRORING_BG_SCRIPT_COMMANDS_F1_TO_F2													; DONE

SET_MIRRORING_TO_HORIZONTAL_F1_BYTECODE: 							                             ; #$F1 SET GAME STATUS($2D) AND PPU MIRRORING TO HORIZONTAL
	JSR SET_MMC3_HORIZ_MIRROR						                                            ; SET GAME STATUS AND PPU MIRRORING TO HORIZONTAL
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_MIRRORING_TO_VERTICAL_F2_BYTECODE: 							                                ; #$F2 SET GAME STATUS($2D) AND PPU MIRRORING TO VERTICAL 
	JSR SET_MMC3_VERT_MIRROR						                                            ; SET GAME STATUS AND PPU MIRRORING TO VERTICAL
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_MIRRORING_BG_SCRIPT_COMMANDS_F1_TO_F2

_F{_PLAY_SOUND_BG_SCRIPT_COMMANDS_F3															; DONE

PLAY_SOUND_F3_BYTECODE: 							                                            ; #$F3 PLAY SOUND
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; PLAY SOUND (A= SOUND ID)
	JSR PLAY_SOUND						                                                        ;
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_PLAY_SOUND_BG_SCRIPT_COMMANDS_F3

_F{_SET_TEXT_SIZE_COMMANDS_F5_TO_F6																; DONE

SET_TEXT_SIZE_TO_08_BY_08_F5_BYTECODE: 							                                ; #$F5 SET TEXT SIZE = NORMAL ( 8 BY 8 ) 
	LDA PPU_TRANSFER_STATUS						                                                ; SET TEXT SIZE = 08 x 08
	AND #%10111111					                                                            ; 
	STA PPU_TRANSFER_STATUS						                                                ;
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_TEXT_SIZE_TO_LARGE_F6_BYTECODE: 							                                ; #$F6 SET TEXT SIZE = LARGE ( 16 BY 16 )
	LDA PPU_TRANSFER_STATUS						                                                ; SET TEXT SIZE = 08 x 08
	ORA #%01000000					                                                            ;
	STA PPU_TRANSFER_STATUS						                                                ;
	LDA #$01						                                                            ;
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_SPR_SIZE_COMMANDS_F5_TO_F6

_F{_DRAW_BG_METATILE_BG_SCRIPT_COMMANDS_F7_TO_F8												; DONE

DRAW_BACKGROUND_ONSCREEN_F7_BYTECODE: 							                                ; #$F7 DRAW 4 BY 4 BLOCK NAMETABLE 0 (SECOND BYTE = CHR BANK)
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD BACKGROUND INDEX
	LDX #$00						                                                            ; SET NAME TABLE = 0
	JSR DRAW_BG_METATILE					                                                    ; DRAW 4 X 4 BLOCK()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_BACKGROUND_OFFSCREEN_F8_BYTECODE: 							                                ; #$F8 DRAW 4 BY 4 BLOCK NAMETABLE 1 (SECOND BYTE = CHR BANK)
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD BACKGROUND INDEX
	LDX #$01						                                                            ; SET NAME TABLE = 1
	JSR DRAW_BG_METATILE					                                                    ; DRAW 4 X 4 BLOCK()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_DRAW_BG_METATILE_BG_SCRIPT_COMMANDS_D7_TO_D8

_F{_DRAW_METASPRITES_BG_SCRIPT_COMMAND_F9														; DONE

DRAW_METASPRITES_F9_BYTECODE: 							                                        ; #$F9 DRAW SPRITES (# SPRITE SEQUENCES, SPRITE INDEXES)
	JSR INIT_SPRITE_SCRIPTS					                                                    ; START DRAW SPRITES WITH DRAW COMMANDS THREAD()
	JMP PROCESS_DRAW_SCRIPT_START					                                            ; PROCESS DATA START

_F}_DRAW_METASPRITES_BG_SCRIPT_COMMAND_F9

_F{_SPECIAL_BG_SCRIPT_COMMAND_FA																; DONE

SPECIAL_DRAW_COMMANDS_FA_BYTECODE:					 		                                    ; $FA VARIOUS COMMANDS
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD FA COMMAND 
	PUSH_TABLE_ADDR[tableAddr] FA_BYTE_CODE_COMMAND_TABLE
	

_F}_SPECIAL_BG_SCRIPT_COMMAND_FA																; DONE

_F{_BG_SCRIPT_FA_COMMAND_TABLE																	; DONE

FA_BYTE_CODE_COMMAND_TABLE:							                                            ; FA COMMAND TABLE
	.WORD DRAW_P1_TEAM_CONF_ABREV_FA_ARG-1 								                        ; 0X00 DRAW P1 TEAM CONFERENCE
	.WORD DRAW_P2_TEAM_CONF_ABREV_FA_ARG-1  								                    ; 0X01 DRAW P2 TEAM CONFERENCE
	.WORD DRAW_CURRENT_TEAM_CONF_ABREV_FA_ARG-1 	 							                ; 0X02 DRAW CURRENT TEAM CONFERENCE
	.WORD DRAW_P1_TEAM_DIVISION_NAME_FA_ARG-1  								                    ; 0X03 DRAW P1 TEAM DIVISION NAME
	.WORD DRAW_P2_TEAM_DIVISION_NAME_FA_ARG-1			                                        ; 0X04 DRAW P2 TEAM DIVISION NAME
	.WORD DRAW_CURRENT_TEAM_DIVISION_NAME_FA_ARG-1  			                                ; 0X05 DRAW CURRENT TEAM DIVISION
	.WORD DRAW_P1_TEAM_NAME_CENTERED_FA_ARG-1 			                                        ; 0X06 DRAW P1 TEAM NAME CENTERED SMALL LETTERS
	.WORD DRAW_P2_TEAM_NAME_CENTERED_FA_ARG-1				                                    ; 0X07 DRAW P2 TEAM NAME CENTERED SMALL LETTERS
	.WORD DRAW_CURRENT_TEAM_NAME_CENTERED_FA_ARG-1  			                                ; 0X08 DRAW CURRENT TEAM NAME CENTERED SMALL LETTERS
	.WORD DRAW_CURRENT_WEEK_NUMBER_FA_ARG-1 			                                        ; 0X09 DRAW CURRENT GAME WEEK
	.WORD DRAW_TEAM_CITY_LARGE_FA_ARG-1 			                                            ; 0X0A DRAW TEAM CITY LARGE LETTERS
	.WORD DRAW_TEAM_MASCOT_LARGE_FA_ARG-1 			                                            ; 0X0B DRAW CURRENT TEAM NAME LARGE LETTERS
	.WORD DRAW_TEAM_CITY_NAME_CONTROL_TYPE_COIN_TOSS_FA_ARG-1 			                        ; 0X0C DRAW P1 AND P2 TEAM CITY, TEAM NAME, TEAM CONTROL TYPE SMALL LETTERS
	.WORD DRAW_END_OF_GAME_STATS_FA_ARG-1 			                                            ; 0X0D DRAW END OF GAME STATS
	.WORD SET_SCENE_SIDE_P2_FA_ARG-1 			                                                ; 0X0E SET SCENE SIDE TO P2
	.WORD SET_SCENE_SIDE_P1_FA_ARG-1				                                            ; 0X0F SET SCENE SIDE TO P1 
	.WORD CHECK_EXIT_EOG_STATS_SCREEN_FA_ARG-1 			                                        ; 0X10 CHECK FOR EXIT FROM BLUE SCREEN STATS OR PLAY CALL GAMES MODE
	.WORD P1_WINS_TOSS_UPDATE_USER_CHOICE_SPRITE-1 			                                    ; 0X11 UPDATE P1 SELECTION ARROW COIN TOSS, AND SET KICK OR RECEIVE
	.WORD P2_WINS_TOSS_UPDATE_USER_CHOICE_SPRITE-1 			                                    ; 0X12 UPDATE P2 SELECTION ARROW COIN TOSS, AND SET KICK OR RECEIVE
	.WORD DRAW_CURRENT_OFF_NAME_CENT_FA_ARG-1 			                                        ; 0X13 DRAW CURRENT OFFENSIVE ICON PLAYER NAME CENTERED 
	.WORD DRAW_QB_PLAYER_NAME_CENTERED_FA_ARG-1 			                                    ; 0X14 DRAW OFFENSIVE QB ICON PLAYER NAME CENTERED 
	.WORD DRAW_SCORE_LARGE_AT_CURRENT_PPU_ADDR-1 			                                    ; 0X15 DRAW CURRENT SCORE LARGE NUMBERS
	.WORD DRAW_PLAYOFF_BRACKET_SCREEN_NAMES_FA_ARG-1 			                                ; 0X16 DRAW PLAYOFF BRACKET 
	.WORD SET_COIN_TOSS_UNI_COLORS_FA_ARG-1				                                        ; 0X17 GET COIN TOSS P1/P2 FIELD UNIFORM COLORS, SET REFEREE PALLETTE 
	.WORD DRAW_CURRENT_TEAM_CONFERENCE_ABREV_FA_ARG-1 			                                ; 0X18 DRAW CURRENT TEAM AFC OR NFC SMALL TEXT
	.WORD SET_DIV_CHAMP_PAL_FA_ARG-1 			                                                ; 0X19 SET DIVISION CHAMP PALLETE
	.WORD SET_CONF_CHAMP_PAL_FA_ARG-1 			                                                ; 0X1A SET CONFERENCE CHAMP PALLETE
	.WORD SET_SB_CHAMP_PAL_FA_ARG-1 			                                                ; 0X1B SET SUPER BOWL CHAMP PALLETE
	.WORD SET_RETURN_INJURY_INFO_FA_ARG-1			                                            ; 0X1C SET RECOVER FROM INJURY SCREEN PALLETE
	.WORD DRAW_CURRENT_DEF_NAME_CENT_FA_ARG-1				                                    ; 0X1D DRAW DEFENSIVE PLAYER NAME CENTERED 


_F}_BG_SCRIPT_FA_COMMAND_TABLE

_F{_FA_COMMAND_FUNCTIONS																		;  

DRAW_P1_TEAM_CONF_ABREV_FA_ARG:							                                        ; 0X01 DRAW P1 TEAM CONFERENCE 
	LDA P1_TEAM						                                                            ; LOAD P1 TEAM
	JMP DRAW_CONFERENCE_ABREV
	
DRAW_P2_TEAM_CONF_ABREV_FA_ARG:							                                        ; 0X02 DRAW P2 TEAM CONFERENCE		
	LDA P2_TEAM						                                                            ; LOAD P2 TEAM
	JMP DRAW_CONFERENCE_ABREV

DRAW_CURRENT_TEAM_CONF_ABREV_FA_ARG:							                                ;0X03 DRAW CURRENT TEAM CONFERENCE
	LDA CURRENT_TEAM			                                                                ; LOAD CURRENT TEAM
	
DRAW_CONFERENCE_ABREV:										                                    ; DRAW TEAM CONFERENCE (A= TEAM ID)	
	CMP #FIRST_TEAM_IN_NFC									                                    ; IS TEAM NFC? YES-> SET CARRY BIT
	LDA #$00												                                    ;
	ADC #$1C												                                    ; ADD OFFSET TO CONFERENCE NAMES
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT						                                    ; DRAW TEAM CITY/ TEAM CONFERENCE ON TEAM DATA(X,Y =PPUADDRESS, A= TEAM ID)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; UPDATE CURRENT DATA ADDRESS (A= AMOUNT) 

DRAW_P1_TEAM_DIVISION_NAME_FA_ARG:							                                    ; 0X04 DRAW P1 TEAM DIVISION NAME
	LDX P1_TEAM						                                                            ; LOAD P1 TEAM
	JMP DRAW_DIVISION_NAME					                                                    ;

DRAW_P2_TEAM_DIVISION_NAME_FA_ARG:							                                    ; 0X05 DRAW P2 TEAM DIVISION NAME
	LDX P2_TEAM						                                                            ; LOAD P2 TEAM
	JMP DRAW_DIVISION_NAME

DRAW_CURRENT_TEAM_DIVISION_NAME_FA_ARG:							                                ; 0X06 DRAW CURRENT TEAM DIVSION NAME
	LDX CURRENT_TEAM						                                                    ; LOAD CURRENT TEAM

DRAW_DIVISION_NAME:							                                                   ; DRAW DIVISION (X= TEAM TO DRAW)
	LDA TEAM_DIVISIONS_TABLE,X				                                                   ; LOAD OFFSET TO TEAM DIVISION (EAST, CENTRAL, WEST)
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]		
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT						                                    ; DRAW TEAM NAME, TEAM CITY, TEAM CONFERENCE (X,Y =PPUADDRESS, A= TEAM ID/ OFFSET TO DATA)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; UPDATE CURRENT DATA ADDRESS (A= AMOUNT) 


TEAM_DIVISIONS_TABLE:	                                                                        ; TEAM_DIVISIONS

EAST_DIV 		=  OFFSET_TO_TEAM_DIVISION_LOC_POINTERS
CENT_DIV		=  OFFSET_TO_TEAM_DIVISION_LOC_POINTERS + 1
WEST_DIV		=  OFFSET_TO_TEAM_DIVISION_LOC_POINTERS + 2

	.DB EAST_DIV, EAST_DIV, EAST_DIV, EAST_DIV, EAST_DIV
	.DB CENT_DIV, CENT_DIV, CENT_DIV, CENT_DIV
	.DB WEST_DIV, WEST_DIV, WEST_DIV, WEST_DIV, WEST_DIV
	
	.DB EAST_DIV, EAST_DIV, EAST_DIV, EAST_DIV, EAST_DIV
	.DB CENT_DIV, CENT_DIV, CENT_DIV, CENT_DIV, CENT_DIV
	.DB WEST_DIV, WEST_DIV, WEST_DIV, WEST_DIV

DRAW_P1_TEAM_NAME_CENTERED_FA_ARG:							                                    ; 0X06 DRAW P1 TEAM NAME CENTERED SMALL LETTERS *** unused
	LDA P1_TEAM						                                                            ; LOAD P1 TEAM
	JMP DRAW_TEAM_NAME_CENTERED

DRAW_P2_TEAM_NAME_CENTERED_FA_ARG:							                                    ; 0X07 DRAW P2 TEAM NAME CENTERED SMALL LETTERS *** unused
	LDA P2_TEAM						                                                            ; LOAD P2 TEAM
	JMP DRAW_TEAM_NAME_CENTERED

DRAW_CURRENT_TEAM_NAME_CENTERED_FA_ARG:						                                    ; 0X08 DRAW CURRENT TEAM CITY & MASCOT SMALL LETTERS FOR INJURY RETURN

MAX_TEAM_NAME_LENGTH_INJURY_RETURN	= $14 
text_length 						= LOCAL_8

	LDA CURRENT_TEAM										                                    ; LOAD CURRENT TEAM

DRAW_TEAM_NAME_CENTERED:
	LDX #MAX_TEAM_NAME_LENGTH_INJURY_RETURN												                    ; SET TEXT JUSTIFICATION
	STX text_length
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_TEAM_CITY_MASCOT_INJURY_RETURN_DRAW_SCRIPT											; DRAW AND CENTER TEAM NAME ($45= OFFSET TO TEAM NAME)
	LDA #$02												                                    ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR						                                    ; UPDATE CURRENT DATA ADDRESS (A= AMOUNT) 

DRAW_CURRENT_WEEK_NUMBER_FA_ARG:							                                    ; 0X09 DRAW CURRENT GAME WEEK

decimal_value	= LOCAL_7
 
	LDA CURRENT_WEEK_IN_SEASON												                    ; LOAD CURRENT WEEK			
	CLC														                                    ;
	ADC #$01												                                    ;
	CMP #FIRST_WEEK_OF_PLAYOFFS												                        ; IS CURRENT WEEK < 17?
	BCC @convert_hex_to_dec												                        ; NO-> DRAW WEEK NUMBER
	LDA #FIRST_WEEK_OF_PLAYOFFS												                        ; SET WEEK = 17
	
@convert_hex_to_dec:														                    ; DRAW WEEK NUMBER
	JSR HEX_TO_2_DIGIT_DEC									                                    ; CONVERT HEX NUMBER TO BCD(A= HEX) 
	LDA decimal_value													                                    ; LOAD DECIMAL VALUE
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR CONVERT_2_DIG_NUM_TILES								                                    ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	LDA #$02												                                    ; SET COMMAND LENGTH = 2 
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR   					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT) 

DRAW_TEAM_CITY_LARGE_FA_ARG:							                                        ; 0X0B DRAW CURRENT TEAM CITY LARGE LETTERS
	LDA CURRENT_TEAM						                                                    ; = CURRENT TEAM
	CLC							                                                                ;
	ADC #OFFSET_TO_TEAM_CITY_POINTERS						                                    ; + OFFSET TO TEAM CITY POINTERS
	JMP DRAW_TEAM_CITY_OR_MASCOT

DRAW_TEAM_MASCOT_LARGE_FA_ARG:							                                        ; 0X0B DRAW CURRENT TEAM NAME LARGE LETTERS
	LDA CURRENT_TEAM						                                                    ; = CURRENT TEAM
	CLC
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS						                                     ; + OFFSET TO TEAM NAME POINTERS

DRAW_TEAM_CITY_OR_MASCOT:

MAX_MASCOT_OR_CITY_TEXT_LENGTH	= $10 
text_length						= LOCAL_8


	LDX #MAX_MASCOT_OR_CITY_TEXT_LENGTH						                                        ; SAVE OFFSET TO TEAM NAME
	STX text_length						                                                                ;
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	JSR DRAW_TEAM_INFO_LARGE_JUSTIFY						                                    ; DRAW TEAM NAME OR CITY LARGE LETTERS()
	LDA #$02						                                                            ; COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_TEAM_CITY_NAME_CONTROL_TYPE_COIN_TOSS_FA_ARG:							                    ; 0X0C DRAW P1 AND P2 TEAM CITY, TEAM NAME, TEAM CONTROL TYPE SMALL LETTERS

TEAM_CITY_COIN_TOSS_MAX_LENGTH			= $0D
TEAM_MASCOT_COIN_TOSS_MAX_LENGTH		= $0A

text_length			= LOCAL_8		

	LDA #TEAM_CITY_COIN_TOSS_MAX_LENGTH						                                                            ;
	STA text_length					                                                                ; 

@draw_p1_team_city:	
	LDA P1_TEAM						                                                            ; LOAD P1 TEAM
	CLC							                                                                ;
	ADC #OFFSET_TO_TEAM_CITY_POINTERS						                                    ; ADD OFFSET TO TEAM CITY POINTERS
	LOAD_ADDR_XY[mem_loc] P1_TEAM_CITY_COIN_TOSS_PPU_ADDR										; 	
	JSR DRAW_TEAM_INFO_CENTERED						                                            ; DRAW TEAM NAMES SMALL LETTERS LEFT JUSTIFY (X,Y =PPU ADDR, A= TEAM + OFFSET TO INFO)

@draw_p2_team_city:			
	LDA P2_TEAM						                                                            ; LOAD P2 TEAM
	CLC							                                                                ;
	ADC #OFFSET_TO_TEAM_CITY_POINTERS						                                    ; ADD OFFSET TO TO TEAM CITY POINTERS 
	LOAD_ADDR_XY[mem_loc] P2_TEAM_CITY_COIN_TOSS_PPU_ADDR	
	JSR DRAW_TEAM_INFO_CENTERED						                                            ; DRAW TEAM NAMES SMALL LETTERS LEFT JUSTIFY (X,Y =PPU ADDR, A= TEAM + OFFSET TO INFO)	

@draw_p1_team_mascot:	
	LDA #TEAM_MASCOT_COIN_TOSS_MAX_LENGTH						                                ;
	STA text_length						                                                    ;
	LDA P1_TEAM						                                                            ; = P1 TEAM
	CLC							                                                                ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS						                                    ; + OFFSET TO TEAM NAME POINTERS
	LOAD_ADDR_XY[mem_loc] P1_TEAM_MASCOT_COIN_TOSS_PPU_ADDR
	JSR DRAW_TEAM_INFO_CENTERED						                                            ; DRAW TEAM NAMES SMALL LETTERS LEFT JUSTIFY (X,Y =PPU ADDR, A= TEAM + OFFSET TO INFO)

@draw_p2_team_mascot:	
	LDA P2_TEAM						                                                            ; = P2 TEAM
	CLC
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS						                                    ;+ OFFSET TO TEAM NAME POINTERS
	LOAD_ADDR_XY[mem_loc] P2_TEAM_MASCOT_COIN_TOSS_PPU_ADDR
	JSR DRAW_TEAM_INFO_CENTERED						                                            ; DRAW TEAM NAMES SMALL LETTERS LEFT JUSTIFY (X,Y =PPU ADDR, A= TEAM + OFFSET TO INFO) 

@draw_p1_control_type:	
	LDA TEAM_CONTROL_TYPES						                                                ; LOAD P1 PLAYER TYPE
	LOG_SHIFT_RIGHT_4
	CLC							                                                                ;
	ADC #OFFSET_TO_COIN_TOSS_CONTROL_TYPE_TEXT_POINTERS						                    ;
	LOAD_ADDR_XY[mem_loc] P1_CONTROL_TYPE_COIN_TOSS_PPU_ADDR
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT						                                    ; DRAW TEAM CITY/ TEAM CONFERENCE (X,Y =PPU ADDR, A= TEAM ID)

@draw_p2_control_type:	
	LDA TEAM_CONTROL_TYPES						                                                ;
	AND #$0F						                                                            ;
	CLC							                                                                ;
	ADC #OFFSET_TO_COIN_TOSS_CONTROL_TYPE_TEXT_POINTERS						                                                            ;
	LOAD_ADDR_XY[mem_loc] P2_CONTROL_TYPE_COIN_TOSS_PPU_ADDR
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT						                                    ; DRAW TEAM CITY/ TEAM CONFERENCE (X,Y =PPU ADDR, A= TEAM ID)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2  
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_END_OF_GAME_STATS_FA_ARG:							                                        ; 0X0D DRAW END OF GAME STATS
	JSR DRAW_END_OF_GAME_STATS					                                                ; DRAW END OF GAME STATS()
	LDA #$02						                                                            ; COMMAND LENGTH = 2  
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_SCENE_SIDE_P2_FA_ARG:							                                            ; 0X0E SET CUTSCENE SIDE = P2
	SET_GAME_STATUS_P2_SIDE_CUTSCENE[]
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2  
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_SCENE_SIDE_P1_FA_ARG:							                                            ; 0X0F SET CUTSCENE SIDE = P1
	SET_GAME_STATUS_P1_SIDE_CUTSCENE[]															;
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2  
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

CHECK_EXIT_EOG_STATS_SCREEN_FA_ARG:							                                    ; 0X10 CHECK FOR EXIT FROM BLUE SCREEN STATS OR PLAY ALL GAMES MODE
	LDA PLAY_OUT_ALL_GAMES_BOOL						                                            ; IS PLAY ALL GAMES FLAG = ON
	BPL @check_a_b_to_exit:						                                                ; NO-> CHECK FOR A OR B TO EXIT SCENE
	RETURN_IN_NUM_FRAMES 60
	LDA JOY_RAW_BOTH						                                                    ; IS P1/P2 A HELD?
	BPL @exit						                                                            ; NO->EXIT

	MMC3_SRAM_WRITE_ENABLE
	LDA PLAY_OUT_ALL_GAMES_BOOL		                                                            ; SET PLAY ALL GAMES FLAG = OFF *** COULD JUST USE LOAD 00
	AND #$7F						                                                            ;
	STA PLAY_OUT_ALL_GAMES_BOOL		                                                            ;
	MMC3_SRAM_WRITE_DISABLE

@check_a_b_to_exit:

_WHILE EQUAL
																								; CHECK FOR A OR B TO EXIT 
	RETURN_1_FRAME
	LDA JOY_PRESS_BOTH 								                                            ; IS A OR B PRESSED?
	AND #(A_BUTTON + B_BUTTON)						                                            ;

_END_WHILE						                                                                ; NO-> CHECK FOR A OR B TO EXIT

@exit:							                                                                ; EXIT
	LDA #$02						                                                            ; COMMAND LENGTH = 2  
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

P1_WINS_TOSS_UPDATE_USER_CHOICE_SPRITE:							                                ; 0X11 UPDATE P1 SELECTION ARROW COIN TOSS, AND SET KICK OR RECEIVE

current_p1_choice		= LOCAL_8
RETURN_SPR_Y_OFFSET		= $C0
KICK_SPR_Y_OFFSET		= RETURN_SPR_Y_OFFSET + $10 

	LDA #$0F						                                                            ; SET CHR 1000 BANK = #0F 
	STA  SOFT_CHR_1000_BANK						                                                ;

	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] P1_WINS_TOSS_MENU_ARROW_SPR_INFO_TABLE, MENU_ARROW_SPR_INFO, $04
	
	
	LDA #$00						                                                            ; P1 CHOICE = RETURN
	STA current_p1_choice						                                                ;
	LDA TEAM_CONTROL_TYPES						                                                ; IS P1 PLAYER TYPE = COM?
	AND #$F0						                                                            ;
	CMP #P1_TEAM_COM_CTRL						                                                ;
	BCS DO_COM_CHOICE_COIN_TOSS					                                                ; YES->COM COIN TOSS SELECTION DELAY
	
_WHILE PLUS							                                                            ; CHECK P1 KICK/RETURN CHOICE LOOP
	
	RETURN_1_FRAME
	LDA JOY_PRESS_1						                                                    	; DOES P1 JOY PRESS = "UP" 
	AND #UP_DPAD						                                                            ;
	BEQ @check_down					                                                            ; NO-> CHECK FOR P1 DOWN PRESS
	LDA #$00						                                                            ; SET CHOICE = P1 RETURN
	STA current_p1_choice						                                                ;
	LDA #RETURN_SPR_Y_OFFSET						                                            ; SET SPRITE Y POSITION = RETURN LOCATION
	STA MENU_ARROW_SPR_Y						                                                ;

@check_down:							                                                        ; CHECK FOR P1 DOWN PRESS
	LDA JOY_PRESS_1						                                                    	; DOES P1 JOY PRESS = "DOWN"
	AND #DOWN_DPAD 						                                                        ;
	BEQ @check_a					                                                            ; NO-> CHECK FOR P1 A PRESS
	LDA #$90						                                                            ; SET CHOICE = P1 KICK
	STA current_p1_choice						                                                ;
	LDA #KICK_SPR_Y_OFFSET						                                                ; SET SPRITE Y POSITION = KICK LOCATION
	STA MENU_ARROW_SPR_Y						                                                ;

@check_a:							                                                            ; CHECK FOR P1 A PRESS
	LDA JOY_PRESS_1						                                                    	; DOES P1 PRESS = "A"

_END_WHILE					                                                            		; NO-> CHECK P1 KICK/RETURN CHOICE LOOP

	JMP SAVE_KICKOFF_CHOICE_IN_GAME_STATUS					                                                            ;

P2_WINS_TOSS_UPDATE_USER_CHOICE_SPRITE:							                                ; 0X12 UPDATE P2 SELECTION ARROW COIN TOSS, AND SET KICK OR RECEIVE

current_p2_choice	= LOCAL_8

	LDA #$0F						                                                            ; SET CHR 1000 BANK = #0F
	STA  SOFT_CHR_1000_BANK						                                                ;
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] P2_WINS_TOSS_MENU_ARROW_SPR_INFO_TABLE, MENU_ARROW_SPR_INFO, $04
	
	LDA #$90						                                                            ; SET CHOICE = P2 RETURN
	STA current_p2_choice					                                                    ;
	LDA TEAM_CONTROL_TYPES						                                                ; IS P2 PLAYER TYPE = COM?
	AND #$0F						                                                            ;
	CMP #P2_TEAM_COM_CTRL 						                                                ;
	BCS DO_COM_CHOICE_COIN_TOSS					                                                ; YES->COM COIN TOSS SELECTION DELAY

_WHILE PLUS:							                                                            ; CHECK P2 KICK/RETURN CHOICE LOOP
	RETURN_1_FRAME
	LDA JOY_PRESS_2						                                                                ; DOES P2 JOY PRESS = "UP"
	AND #UP_DPAD						                                                            ;
	BEQ @check_down						                                                            ; NO-> CHECK FOR P2 DOWN PRESS
	LDA #$90						                                                            ; SET CHOICE = P2 RETURN
	STA current_p2_choice						                                                                ;
	LDA #RETURN_SPR_Y_OFFSET						                                                            ; SET SPRITE Y POSITION = RETURN LOCATION
	STA MENU_ARROW_SPR_Y						                                                            ;

@check_down:							                                                            ; CHECK FOR P2 DOWN PRESS
	LDA JOY_PRESS_2						                                                                ; DOES P1 JOY PRESS = "DOWN"
	AND #DOWN_DPAD						                                                            ;
	BEQ @check_a					                                                            ; NO-> CHECK FOR P2 "A" PRESS
	LDA #$00						                                                            ; SET CHOICE = P2 KICK
	STA current_p2_choice						                                                                ;	
	LDA #KICK_SPR_Y_OFFSET						                                                            ; SET SPRITE Y POSITION = KICK LOCATION
	STA MENU_ARROW_SPR_Y						                                                            ;

@check_a:							                                                            ; CHECK FOR P2 "A" PRESS
	LDA JOY_PRESS_2						                                                       ; DOES P2 PRESS = "A"
	
_END_WHILE					                                                            		; NO-> CHECK P2 KICK/RETURN CHOICE LOOP
	
	JMP SAVE_KICKOFF_CHOICE_IN_GAME_STATUS					                                    ; SAVE CHOICE AND UPDATE GAME STATUS AND POSSESSION

DO_COM_CHOICE_COIN_TOSS:							                                            ; COM COIN TOSS SELECTION DELAY
	RETURN_IN_NUM_FRAMES 60

SAVE_KICKOFF_CHOICE_IN_GAME_STATUS:							                                    ; SAVE CHOICE AND UPDATE GAME STATUS AND POSSESSION

current_poss_and_kickoff	= LOCAL_8
opening_kickoff_bitflag 	= LOCAL_7

	LDA current_poss_and_kickoff						                                        ; SAVE KICK RETURN CHOICE
	AND #$10						                                                            ;
	STA opening_kickoff_bitflag 						                                        ;
	LDA GAME_STATUS						                                                        ; SET ON FIELD = NO
	AND #$EF						                                                            ;
	ORA opening_kickoff_bitflag 						                                        ; SET GAME STATUS GOT FIRST HALF KICKOFF
	STA GAME_STATUS						                                                        ;
	LDA current_poss_and_kickoff						                                        ;
	AND #$80						                                                            ; SET CURRENT POSSESION 
	STA POSSESSION_STATUS						                                                ;
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2  
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

DRAW_CURRENT_OFF_NAME_CENT_FA_ARG:							                                    ; 0X1C DRAW CURRENT OFFENSIVE ICON PLAYER NAME CENTERED
	LDA POSSESSION_STATUS						                                                ; LOAD POSSESION STATUS
	JMP DRAW_CURRENT_OFF_DEF_NAME_CENT					                                         ; JUMP->LOAD BALL CARRIER/DEFENDER ICON

DRAW_CURRENT_DEF_NAME_CENT_FA_ARG:							                                    ; 0X1D DRAW CURRENT DEFENSIVE ICON PLAYER NAME CENTERED
	LDA POSSESSION_STATUS						                                                ; LOAD POSSESION STATUS
	EOR #$80						                                                            ;

DRAW_CURRENT_OFF_DEF_NAME_CENT:							                                        ; LOAD BALL CARRIER/DEFENDER ICON 
	BMI @load_p2_controlled_player					                                            ; 
	LDA P1_MAN_POS_ID_ICON_STATUS						                                        ; LOAD PLAYER 1 ACTIVE ICON
	AND #$1F						                                                            ;
	ASL							                                                                ; 	
	TAX							                                                                ; 
	JMP GET_P1_TEAM_AND_ROSTER_ID_FA_ARG				                                            ; JUMP->DRAW PLAYER 1 TEAM AND STARTER

@load_p2_controlled_player:							                                            ;
	LDA P2_MAN_POS_ID_ICON_STATUS						                                        ; LOAD PLAYER 2 ACTIVE ICON
	AND #$1F						                                                            ;
	ASL							                                                                ;
	TAX							                                                                ;
	JMP GET_P2_TEAM_AND_ROSTER_ID_FA_ARG					                                    ; JUMP->DRAW PLAYER  2 TEAM AND STARTER

DRAW_QB_PLAYER_NAME_CENTERED_FA_ARG:							                                ; 0X14 DRAW OFFENSIVE TEAM QB STARTER CENTERED
	LDX #$00						                                                            ; SET STARTER ID = QB 
	LDA POSSESSION_STATUS							                                            ; IS POSSESSION = P1
	BMI GET_P2_TEAM_AND_ROSTER_ID_FA_ARG				                                        ; NO->DRAW  PLAYER 2 TEAM AND STARTER

GET_P1_TEAM_AND_ROSTER_ID_FA_ARG:							                                    ; DRAW PLAYER 1 TEAM AND STARTER
	LDY P1_OFF_STARTERS,X						                                                ; LOAD P1 PLAYER TEAM
	LDA P1_OFF_STARTERS+1,X						                                                ; LOAD P1 STARTER
	JMP DRAW_PLAYER_TEXT_CENTERED					                                            ; JUMP-> DRAW PLAYER TEXT CENTERED (Y= TEAM, A= PLAYER)

GET_P2_TEAM_AND_ROSTER_ID_FA_ARG:							                                    ; DRAW  PLAYER 2 TEAM AND STARTER 
	LDY P2_OFF_STARTERS,X						                                                ; LOAD P2 PLAYER TEAM
	LDA P2_OFF_STARTERS+1,X						                                                ; LOAD P2 STARTER

DRAW_PLAYER_TEXT_CENTERED:							                                            ; DRAW PLAYER TEXT CENTERED (Y= TEAM, A= PLAYER)

roster_id	= LOCAL_7
team_id 	= LOCAL_8

	STY team_id						                                                            ; SET TEAM
	STA roster_id							                                                            ; SET PLAYER
	LDA SOFT_A000_BANK				                                                            ; SAVE $A000 BANK
	PHA								                                                            ;
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[] 
	JSR DRAW_PLAYER_NAME_CENTERED						                                        ; DRAW LARGE PLAYER TEXT CENTERED($45= TEAM $44 = PLAYER)
	PLA							                                                                ; RESTORE $A000 BANK
	TAX							                                                                ;
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA #$02
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)
	
_F{_DRAW_LARGE_SCORE_AT_PPU_ADDR_SPECIAL_COMMAND					                            ; DONE

buffer_addr = LOCAL_1

DRAW_SCORE_LARGE_AT_CURRENT_PPU_ADDR:							                                ; 0X15 DRAW CURRENT SCORE LARGE NUMBERS
	JSR WAIT_UNTIL_NAME_BUFFER_READY							                                ; WAIT UNTIL BUFFER STATUS($37E) =READY AND THEN SET TO NOT READY
																                                ; clear score buffer with space tile id
	SET_RAM_Y_INDEX[start_length_value] SCORE_BUFFER, SIZE_OF_SCORE_BUFFER, SPACE_TILE_ID 

	
	
	LDA P1_TOTAL_SCORE						                                                    ; LOAD P1 TOTAL SCORE
	LOG_SHIFT_RIGHT_4						                                                    ; GET P1 TOTAL SCORE HIGH DIGIT
	BEQ @set_p1_low_digit							                                            ; IS HIGH DIGIT = ZERO? YES-> SET P1 TOTAL SCORE LOW DIGIT
	CLC										                                                    ;
	ADC #OFFSET_TO_NUMBER_TILES				                                                    ; = P1 TOTAL SCORE HIGH DIGIT + OFFSET TO NUMBER TILE
	STA SCORE_BUFFER						                                                    ; SAVE P1 HIGH TOTAL SCORE DIGIT IN BUFFER
	
@set_p1_low_digit:									                                            ; SET P1 TOTAL SCORE LOW DIGIT
	LDA P1_TOTAL_SCORE						                                                    ;
	AND #$0F								                                                    ;
	CLC										                                                    ;
	ADC #OFFSET_TO_NUMBER_TILES				                                                    ; = LOW DIGIT + OFFSET TO NUMBER TILE
	STA SCORE_BUFFER + 1					                                                    ; SAVE P1 LOW SCORE DIGIT IN BUFFER
	LDA #LARGE_SCORE_DASH_TILE_ID						                                        ; SET TILE VALUE = DASH "-" 
	STA SCORE_BUFFER + 2						                                                ;
	LDA P2_TOTAL_SCORE 						                                                    ; LOAD P2 TOTAL SCORE
	LOG_SHIFT_RIGHT_4 						                                                    ; GET P2 TOTAL SCORE HIGH DIGIT
	BEQ @set_p2_low_digit					                                                    ; IS P2 TOTAL SCORE HIGH DIGIT = ZERO? YES-> SET P2 TOTAL SCORE LOW DIGIT
	
	CLC							                                                                ;
	ADC #OFFSET_TO_NUMBER_TILES						                                            ; = P2 TOTAL SCORE HIGH DIGIT + OFFSET TO NUMBER TILE
	STA SCORE_BUFFER + 3						                                                ;
	LDA P2_TOTAL_SCORE						                                                    ; LOAD P2 TOTAL SCORE
	AND #$0F						                                                            ;
	CLC							                                                                ;
	ADC #OFFSET_TO_NUMBER_TILES						                                            ; = P2 TOTAL SCORE LOW DIGIT + OFFSET TO NUMBER TILE
	STA SCORE_BUFFER + 4						                                                ;
	JMP @draw_score_from_buffer					                                                ; JUMP->DRAW CURRENT SCORE FROM BUFFER

@set_p2_low_digit:							                                                    ; SET P2 TOTAL SCORE LOW DIGIT
	LDA P2_TOTAL_SCORE						                                                    ; LOAD P2 TOTAL SCORE
	AND #$0F						                                                            ;
	CLC							                                                                ;
	ADC #OFFSET_TO_NUMBER_TILES						                                            ; = P2 TOTAL SCORE LOW DIGIT + OFFSET TO NUMBER TILE
	STA SCORE_BUFFER + 3						                                                ;

@draw_score_from_buffer:							                                            ; DRAW CURRENT SCORE FROM BUFFER
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	LDA #<SCORE_BUFFER						                                                    ; SET BUFFER DATA ADDRESS = $037F
	STA buffer_addr									                                            ;
	LDA #>SCORE_BUFFER						                                                    ;
	STA buffer_addr+1									                                        ;
	LDA #SIZE_OF_SCORE_BUFFER				                                                    ; SET BUFFER LENGTH = 5
	JSR DRAW_LARGE_TEXT						                                                    ; BUFFER_LARGE_TEXT(X,Y= PPU ADDR, 3E,3F= DATA ADDR, A= LENGTH)
	JSR SET_NAME_BUFFER_READY						                                            ; SET BUFFER STATUS($37E) TO READY()
	LDA #$02								                                                    ; SET COMMAND LENGTH = 2  
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_DRAW_LARGE_SCORE_AT_PPU_ADDR_SPECIAL_COMMAND

_F{_DRAW_PLAYOFF_BRACKET_TEAM_NAMES_SPECIAL_COMMAND												; DONE


SIZE_OF_EACH_BRACKET_PPU_TABLE_ENTRY		= $05 
MAX_PLAYOFF_BRACKET_TEAM_NAME_LENGTH		= $0A

scores_script_addr							= LOCAL_1
away_team_score								= LOCAL_3
home_team_score								= LOCAL_4
current_bracket_table_index					= LOCAL_7
playoff_bracket_team_name_length 			= LOCAL_8

current_matchup_index						= SEGMENT_VAR_8E
ppu_addr_table_index						= SEGMENT_VAR_8F
line_highlighting_draw_script_offset		= SEGMENT_VAR_90

previous_A000_bank							= SEGMENT_VAR_AD
SIZE_OF_PLAYOFF_BRACKET_TABLE_ENTRY			= $03 
TOTAL_NUMBER_OF_PLAYOFF_TEAMS				= PLAYOFF_TEAMS_PER_CONFERENCE * 2 

DRAW_PLAYOFF_BRACKET_SCREEN_NAMES_FA_ARG:									                    ; 0X16 DRAW PLAYOFF BRACKET TEAM NAMES
	LDA SOFT_A000_BANK						                                                    ; SAVE $A000 BANK
	STA previous_A000_bank									                                    ;
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK 								                ; LOAD BANK 8
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDA #MAX_PLAYOFF_BRACKET_TEAM_NAME_LENGTH	                                                ; SET TEAM NAME BUFFER LENGTH
	STA playoff_bracket_team_name_length	                                                    ;									
	LDA #$00								                                                    ; SET TABLE INDEX = FIRST NAME
	STA current_bracket_table_index			                                                    ;
	
_WHILE CC									                                                    ; DRAW TEAM NAMES LOOP
	
	LDX current_bracket_table_index									                            ;
	LDY PLAYOFF_BRACKET_TEAM_NAME_PPU_ADDR_TABLE,X					                            ; LOAD PLAYOFF MATCHUP INDEX FROM PLAYOFF BRACKET TEAM NAME PPU LOCATIONS
	
@save_team_id:	
	LDA PLAYOFF_RESULTS_START[],Y			                                                    ; SAVE TEAM ID FROM SRAM PLAYOFF INFO
	PHA										                                                    ; 
	LDY PLAYOFF_BRACKET_TEAM_NAME_PPU_ADDR_TABLE+1,X					                        ; SET PPU ADDRESS FROM  PLAYOFF BRACKET TEAM NAME PPU LOCATIONS
	LDA PLAYOFF_BRACKET_TEAM_NAME_PPU_ADDR_TABLE+2,X					                        ;
	TAX										                                                    ;
	PLA										                                                    ; LOAD TEAM ID
	CLC										                                                    ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS		                                                    ; ADD OFFSET TO TEAM NAMES
	JSR DRAW_TEAM_INFO_CENTERED				                                                    ; DRAW TEAM NAMES SMALL LETTERS LEFT JUSTIFY (X,Y =PPUADDRESS, A= TEAM ID + OFFSET)
	LDA current_bracket_table_index			                                                    ; MATCHUP INDEX = MATCHUP INDEX + OFFSET TO NEXT MATCHUP 
	CLC										                                                    ;
	ADC #SIZE_OF_PLAYOFF_BRACKET_TABLE_ENTRY									                ;
	STA current_bracket_table_index			                                                    ;
	CMP #(SIZE_OF_PLAYOFF_BRACKET_TABLE_ENTRY * TOTAL_NUMBER_OF_PLAYOFF_TEAMS)					; DONE WITH ALL MATCHUPS?

_END_WHILE									                                                    ; NO-> DRAW TEAM NAMES LOOP
	
	
	LDA CURRENT_GAME_IN_WEEK				                                                    ; LOAD CURRENT PLAYOFF GAME MATCHUP
	BEQ @exit_draw_playoff_bracket_team_names							                        ; NOT STARTED?-> EXIT DRAW PLAYOFF NAMES/SCORES/HELMETS
	STA current_matchup_index									                                ; SAVE CURRENT PLAYOFF GAME MATCHUP
	LDA #$00								                                                    ; 
	STA ppu_addr_table_index									                                ; SET SCORES TABLE INDEX = FIRST MATCHUP
	STA line_highlighting_draw_script_offset									                            ; SET SCORES HIGHLIGHTIN TABLE INDEX = FIRST MATCHUP 

_WHILE NOT_EQUAL									                                            ; DRAW MATCHUP SCORES LOOP
	LDX ppu_addr_table_index									                                ; LOAD CURRENT MATCHUP
	
@check_home_vs_away:	
	LDY PLAYOFF_BRACKET_SCORES_PPU_ADDR_TABLE,X					                                ; LOAD MATCHUP SCORE INDEX FROM PLAYOFF BRACKET SCORE LOCATIONS	
	LDA PLAYOFF_RESULTS_START[],Y						                                        ; LOAD HOME TEAM SCORE
	STA home_team_score						                                                    ;
	LDA PLAYOFF_RESULTS_START[]+1,Y						                                        ; LOAD AWAY TEAM SCORE
	STA away_team_score						                                                    ;
	CMP home_team_score						                                                    ; AWAY SCORE SCORE > HOME SCORE
	BCS @away_team_wins					                                                        ; YES->AWAY TEAM WINS

@home_team_wins:	
	JSR GET_HOME_TEAM_BRACKET_SCORE_PPU_ADDR					                                ; LOAD HOME TEAM PLAYOFF BRACKET SCORE PPU ADDR($8F= MATCHUP INDEX)
	LDA home_team_score						                                                    ; LOAD HOME TEAM SCORE
	JSR COPY_PLAYOFF_WINNER_SCORE_TO_BUFF_AND_HIGHLIGHT					                        ; TRANSFER WINNING TEAM SCORE TO BUFFER AND HIGHLIGHT(A= SCORE)
	JSR GET_AWAY_TEAM_BRACKET_SCORE_PPU_ADDR					                                ; LOAD AWAY TEAM PLAYOFF BRACKET SCORE PPU ADDR($8F= MATCHUP INDEX)
	LDA away_team_score						                                                    ; LOAD AWAY TEAM SCORE
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
@do_bracket_line_highlighting_home_wins:	
	LDX line_highlighting_draw_script_offset						                            ; LOAD MATCHUP INDEX
	LDA START_OF_BRACKET_HIGHLIGHTING_PTRS,X						                            ; SET HOME TEAM WINS DRAW SCORES SCRIPT DATA PTR 
	STA scores_script_addr						                                                ;
	LDA START_OF_BRACKET_HIGHLIGHTING_PTRS + 1,X						                        ;
	STA scores_script_addr + 1					                                                ;
	LDY PLAYOFF_BRACKET_LINES_PPU_ADDR_TABLE,X					                        ; LOAD HIGHLIGHT HOME SCORE ADDR FROM PLAYOFF SCORE HIGHLIGHTING PPU ADDR TABLE
	LDA PLAYOFF_BRACKET_LINES_PPU_ADDR_TABLE+1,X					                    ;
	TAX							                                                                ; 
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						                        ; TRANSFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()
	JMP @go_to_next_playoff_match_check_if_done					                                ;

@away_team_wins:							                                                    ; AWAY TEAM WINS
	JSR GET_HOME_TEAM_BRACKET_SCORE_PPU_ADDR					                                ; LOAD HOME TEAM PLAYOFF BRACKET SCORE PPU ADDR($8F= MATCHUP INDEX)
	LDA home_team_score						                                                    ; LOAD HOME TEAM SCORE
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	JSR GET_AWAY_TEAM_BRACKET_SCORE_PPU_ADDR					                                ; LOAD AWAY TEAM PLAYOFF BRACKET SCORE PPU ADDR($8F= MATCHUP INDEX)
	LDA away_team_score						                                                    ; LOAD AWAY TEAM SCORE
	JSR COPY_PLAYOFF_WINNER_SCORE_TO_BUFF_AND_HIGHLIGHT					                        ; TRANSFER WINNING TEAM SCORE TO BUFFER AND HIGHLIGHT(A= SCORE)

@do_bracket_line_highlighting_away_wins:	
	LDX line_highlighting_draw_script_offset						                                        ; LOAD MATCHUP INDEX
	LDA START_OF_BRACKET_HIGHLIGHTING_PTRS + 2,X						                         ; SET AWAY TEAM WINS DRAW SCORES SCRIPT DATA PTR 
	STA scores_script_addr						                                                ;
	LDA START_OF_BRACKET_HIGHLIGHTING_PTRS + 3,X						                                                            ;
	STA scores_script_addr + 1						                                            ;
	LDY PLAYOFF_BRACKET_LINES_PPU_ADDR_TABLE+2,X					                    ; LOAD HIGHLIGHT AWAY SCORE ADDR FROM PLAYOFF SCORE HIGHLIGHTING PPU ADDR TABLE
	LDA PLAYOFF_BRACKET_LINES_PPU_ADDR_TABLE+3,X					                    ;
	TAX							                                                                ; 
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						                        ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()

@go_to_next_playoff_match_check_if_done:							                            ; GO TO NEXT MATCHUP CHECK IF DONE
	
    ADD_8_BIT_CONST_TO_8BIT_ADDR[addr_val] ppu_addr_table_index, SIZE_OF_EACH_BRACKET_PPU_TABLE_ENTRY
	ADD_8_BIT_CONST_TO_8BIT_ADDR[addr_val] line_highlighting_draw_script_offset, SIZE_OF_EACH_PLAYOFF_RESULT
	DEC current_matchup_index						                                            ; DONE DRAWING ALL MATCHUPS? 
	
_END_WHILE 					                                                            		; NO-> DRAW MATCHUP SCORES LOOP

@exit_draw_playoff_bracket_team_names:							                                ; EXIT DRAW PLAYOFF NAMES/SCORES/HELMETS
	LDX previous_A000_bank						                                                ; RESTORE $A000 BANK
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

GET_AWAY_TEAM_BRACKET_SCORE_PPU_ADDR:							                                ; LOAD AWAY TEAM PLAYOFF BRACKET SCORE PPU ADDR
	LDX ppu_addr_table_index						                                            ; LOAD MATCHUP INDEX
	INX							                                                                ; + OFFSET TO AWAY TEAM
	INX							                                                                ;

GET_HOME_TEAM_BRACKET_SCORE_PPU_ADDR:							                                ; LOAD HOME TEAM PLAYOFF BRACKET SCORE PPU ADDR($8F= MATCHUP INDEX)
	LDY PLAYOFF_BRACKET_SCORES_PPU_ADDR_TABLE+1,X					                            ; LOAD PLAYOFF SCORE PPU ADDR FROM PLAYOFF BRACKET SCORE LOCATIONS
	LDA PLAYOFF_BRACKET_SCORES_PPU_ADDR_TABLE+2,X					                            ;
	TAX							                                                                ;
	RTS							                                                                ; RETURN

COPY_PLAYOFF_WINNER_SCORE_TO_BUFF_AND_HIGHLIGHT:							                    ; TRANSFER WINNING TEAM SCORE TO BUFFER AND HIGHLIGHT(A= SCORE)

winner_score = LOCAL_8
OFFSET_TO_HIG

	STA winner_score						                                                    ; SAVE SCORE
	LDA #$02						                                                            ; SET BUFFER LENGTH = 2 DIGITS
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                                ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	
@set_tens_digit:	
	LDA winner_score						                                                    ; GET LOW DIGIT
	LOG_SHIFT_RIGHT_4
	BEQ @set_ones_digit					                                                        ;
	CLC							                                                                ;
	ADC #OFFSET_TO_HIGHLIGHTED_NUMBER_TILES						                                ; ADD OFFSET TO HIGHLIGHTED NUMBERS

@set_ones_digit:							                                                    ; SAVE DIGITS TO BUFFER
	STA CURRENT_BG_BUFFER_LOC,X						                                            ; SAVE LOW DIGIT IN BUFFER 
	INX								                                                            ; BUFFER INDEX++
	LDA winner_score							                                                ; GET HIGH DIGIT
	AND #$0F						                                                            ;
	CLC								                                                            ;
	ADC #OFFSET_TO_HIGHLIGHTED_NUMBER_TILES						                                ;
	STA CURRENT_BG_BUFFER_LOC,X						                                            ; SAVE HIGH DIGIT TO BUFFER
	INX							                                                                ; BUFFER INDEX++
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						                            ; SET BUFFER LENGTH  AND SET BUFFER STATUS TO READY(X= LENGTH)

_F}_DRAW_PLAYOFF_BRACKET_TEAM_NAMES_SPECIAL_COMMAND	
	
_F{_SET_COIN_TOSS_UNI_COLORS_SPECIAL_COMMAND													; DONE

SET_COIN_TOSS_UNI_COLORS_FA_ARG:							                                    ; 0x17 GET COIN TOSS P1/P2 FIELD UNIFORM COLORS, SET REFEREE PALLETTE 
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_TEAM_UNIFORM_COLORS_BANK, BANK_JUMP_SET_TEAM_UNIFORM_COLORS ; *** can use actual addr	
	LDA #COLOR_BLACK_2						                                                    ;
	STA REF_PAL_BUF_1						                                                    ; SET SPR PAL VALUE 1  = BLACK = UNIFORM 1
	LDA #COLOR_WHITE_RED						                                                ;
	STA REF_PAL_BUF_2						                                                    ; SET SPR PAL VALUE 2 = SKIN
	LDA #COLOR_WHITE						                                                    ; 
	STA REF_PAL_BUF_3						                                                    ; SET SPR PAL VALUE 3 = WHITE = UNIFORM 2
	LDA #$00						                                                            ; SET BG PALLETE INDEX = FIRST INDEX
	STA BG_PAL_INDEX						                                                    ;
	JSR GET_SAVE_BG_PAL_TO_BUFFER						                                        ; SAVE BACKGROUND PALETTE IN BUFFER()
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_COIN_TOSS_UNI_COLORS_SPECIAL_COMMAND	

_F{_DRAW_CURRENT_TEAM_CONFERENCE_SPECIAL_COMMAND												; DONE

DRAW_CURRENT_TEAM_CONFERENCE_ABREV_FA_ARG:							                            ; 0X18 DRAW CURRENT TEAM CONFERENCE ABBREV SMALL TEXT
	LOAD_BG_SCRIPT_CURRENT_PPU_ADDR[]
	LDA CURRENT_TEAM_FOR_DRAW_CONF						                                        ; LOAD P1 OR P2 TEAM OFFSET
	CLC							                                                                ;
	ADC #OFFSET_TO_LEAGUE_AND_CONF_TEXT_POINTERS						                        ; + OFFSET TO TEAM CONFERENCE
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT						                                    ; DRAW TEAM CITY/ TEAM CONFERENCE (X,Y =PPU ADDR, A= TEAM ID)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)
	
_F}_DRAW_CURRENT_TEAM_CONFERENCE_SPECIAL_COMMAND	

_F{_SET_UNIFORM_PALLETES_CUTSCENES_DIV_CONF_SB_CHAMPS											; DONE

SET_DIV_CHAMP_PAL_FA_ARG:							                                            ; 0X19 SET DIVISION CHAMP PALLETE
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_CUTSCENE_UNI_COLORS_BANK, BANK_JUMP_SET_DIVISION_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL ; *** can use actual addr 
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_CONF_CHAMP_PAL_FA_ARG:							                                            ; 0X1A SET CONFERENCE CHAMP PALLETE
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_CUTSCENE_UNI_COLORS_BANK, BANK_JUMP_SET_CONFERENCE_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL ; *** can use actual addr 
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

SET_SB_CHAMP_PAL_FA_ARG:							                                            ; 0X1B SET SUPER BOWL CHAMP PALLETE
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_CUTSCENE_UNI_COLORS_BANK, BANK_JUMP_SET_SUPER_BOWL_CUTSCENE_TEAM_UNIFORM_PAL ; *** can use actual addr 
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_UNIFORM_PALLETES_CUTSCENES_DIV_CONF_SB_CHAMPS	

_F{_SET_RETURN_INJURY_INFO_SPECIAL_COMMAND														; DONE

position_id			= LOCAL_7
team_id				= LOCAL_8
player_number		= LOCAL_8

SET_RETURN_INJURY_INFO_FA_ARG:							                                        ; 0X1C SET RECOVER FROM INJURY SCREEN 
	LDA SOFT_A000_BANK						                                                    ; SAVE $A000 BANK
	PHA							                                                                ; 
	LDA PPU_TRANSFER_STATUS						                                                ; SET TEXT SIZE = LARGE TEXT (16 X 16)
	ORA #$40						                                                            ;
	STA PPU_TRANSFER_STATUS						                                                ;
	LDA P1_MAN_POS_ID_ICON_STATUS						                                        ; SAVE PLAYER
	STA position_id						                                                        ;
	LDA CURRENT_TEAM						                                                    ; SAVE CURRENT TEAM
	STA team_id						                                                            ;
	LOAD_ADDR_XY[mem_loc] RETURN_FROM_INJURY_TEAM_NAME_PPU_ADDR
	JSR DRAW_PLAYER_NAME_CENTERED						     									; DRAW LARGE PLAYER TEXT CENTERED( 44= PLAYER, 45= TEAM)
	LDA CURRENT_TEAM						                                                    ; LOAD TEAM
	LDX P1_MAN_POS_ID_ICON_STATUS						                                        ; LOAD PLAYER
	JSR GET_PLAYER_NUMBER_SAVE_NAME_TO_BUFFER						                            ; GET PLAYER NAME AND SAVE IN BUFFER(A= TEAM, X=PLAYER)
	JSR SET_NAME_BUFFER_READY						                                            ; SET BUFFER STATUS($37E) TO READY()
	LOAD_ADDR_XY[mem_loc] RETURN_FROM_INJURY_PLAYER_NAME_PPU_ADDR
	LDA player_number						                                                    ; LOAD PLAYER NUMBER
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	PLA							                                                                ;
	TAX							                                                                ; RESTORE $A000 BANK
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA #$02
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)
	
_F}_SET_RETURN_INJURY_INFO_SPECIAL_COMMAND		

_F}_FA_COMMAND_FUNCTIONS

_F{_SET_DRAW_SCRIPT_DELAY_FB_BYTECODE															; DONE

SET_FRAME_DELAY_FB_BYTECODE: 							                                        ; #$FB DELAY (DATA= # FRAMES)
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET NUMBER OF FRAMES = DATA VALUE
	JSR DELAY_TASK						                                                        ; WAIT (A= # OF FRAMES)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2
	JMP UPDATE_DRAW_SCRIPT_DATA_ADDR					                                        ; JUMP->UPDATE CURRENT DATA ADDRESS (A= AMOUNT)

_F}_SET_DRAW_SCRIPT_DELAY
	
_F{_JUMP_DO_ROUTINE_RETURN_END_DRAW_SCRIPT_FC_TO_FF_COMMANDS									; DONE

JUMP_TO_BG_SCRIPT_ADDR_FD_BYTECODE:							                                     ; #$FC JUMP TO ADDRESS
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET CURRENT DATA ADDRESS = ADDRESS VALUE
	TAX							                                                                ;
	INY							                                                                ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA CURR_BG_SCRIPT_ADDR + 1						                                            ;
	STX CURR_BG_SCRIPT_ADDR						                                                ;
	JMP PROCESS_DRAW_SCRIPT_START					                                            ; JUMP -> PROCESS DATA START

DO_BG_SCRIPT_ROUTINE_AND_RETURN_FD_BYTECODE:							                        ; #$FD JUMP AND SAVE RETURN ADDRESS
	
	COPY_16_BIT_A[var1_var2] CURR_BG_SCRIPT_ADDR, BG_SCRIPT_RETURN_ADDR
	JMP JUMP_TO_BG_SCRIPT_ADDR_FD_BYTECODE					                                    ; JUMP-> #$FC JUMP TO ADDRESS

RETURN_FROM_ROUTINE_FE_BYTECODE:							                                    ; #$FE RETURN TO SAVED ADDRESS
	LDA BG_SCRIPT_RETURN_ADDR						                                            ; SET CURRENT DATA ADRESS=  RETURN DATA ADDRESS + 3
	CLC							                                                                ;
	ADC #$03						                                                            ;
	STA CURR_BG_SCRIPT_ADDR						                                                ;
	LDA BG_SCRIPT_RETURN_ADDR + 1						                                        ;
	ADC #$00						                                                            ;
	STA CURR_BG_SCRIPT_ADDR + 1						                                            ;
	JMP PROCESS_DRAW_SCRIPT_START					                                            ; JUMP -> PROCESS DATA START

END_OF_DRAW_SCRIPT_FF_BYTECODE: 												                                        ; #$FF END
	LDA #$00											                                        ; SET DRAW BACKGROUND TILES THREAD = EMPTY
	STA NUM_FRAMES_DRAW_SCRIPT												                    ;
	RTS													                                        ; RETURN

_F}__JUMP_DO_ROUTINE_RETURN_END_DRAW_SCRIPT_FC_TO_FF_COMMANDS

UNUSED_DRAW_COMMAND:			                                                                ; *** UNUSED INFINITE LOOP
	JMP UNUSED_DRAW_COMMAND		                                                                ; 

_F{_UPDATE_DRAW_SCRIPT_DATA_PPU_ADDR															; DONE

UPDATE_DRAW_SCRIPT_DATA_ADDR:							                                        ; UPDATE DATA ADDRESS(A= COMMAND LENGTH)
	CLC													                                        ; DATA ADDRESS += LENGTH
	ADC CURR_BG_SCRIPT_ADDR								                                        ;
	STA CURR_BG_SCRIPT_ADDR								                                        ;
	LDA CURR_BG_SCRIPT_ADDR + 1							                                        ;
	ADC #$00											                                        ;
	STA CURR_BG_SCRIPT_ADDR + 1							                                        ; 
    JMP PROCESS_DRAW_SCRIPT_START										                        ; JUMP-> PROCESS NEXT DRAW COMMAND DATA
	
SET_BG_SCRIPT_PPU_ADDR_CHECK_MIRRORING:					                                        ; SET PPU ADDRESS WITH MIRRORING CHECK()
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SET HIGH NAMETABLE BYTE
	AND #$07										                                            ;		
	CMP #$04										                                            ;
	BCC @save_ppu_addr							                                                ; 
	BIT GAME_STATUS									                                            ; 
	BVC @save_ppu_addr							                                                ;
	CLC												                                            ;
	ADC #$04										                                            ;
@save_ppu_addr:										                                            ;
	ORA #>NAMETABLE1_START 							                                            ;
	STA CURR_BG_SCRIPT_PPU_ADDR+1					                                            ; SET HIGH BYTE PPU ADDRESS 
	INY												                                            ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA CURR_BG_SCRIPT_PPU_ADDR						                                            ; SET LOW BYTE PPU ADDRESS
	INY												                                            ; 
	RTS												                                            ; RETURN

_F}_UPDATE_DRAW_SCRIPT_DATA_PPU_ADDR

_F{_INIT_BG_SCROLLING_TASK																		; DONE

INIT_BG_SCROLLING_TASK:											                                ; START SCROLL THREAD IF NEEDED AND SET SCROLL AMOUNT()

script_index	= LOCAL_1
irq_index		= LOCAL_2

	STY script_index											                                ; SAVE DATA INDEX
	STX irq_index											                                    ; SAVE IRQ INDEX
	LDA SCROLL_BG_TASK											                                ; IS TASK STATUS = EMPTY
	BNE @task_already_created									                                ; NO-> TASK ALREADY CREATED
	
	
	LDA #$00										                                            ;
	STA IRQ_0_COUNTER										                                    ;
	STA IRQ_1_COUNTER										                                    ;
	STA IRQ_2_COUNTER										                                    ;
	LDA #DRAW_SCRIPT_PROCESSING_BANK										                    ; SET TASK BANK = BANK 24
	STA (SCROLL_BG_TASK + TASK_BANK)										                    ;
	LDY #<(UPDATE_BG_SCROLL_LOCATION_TASK_START-1)								                ; SET TASK ADDRESS =  UPDATE IRQ X SCROLL
	LDA #>(UPDATE_BG_SCROLL_LOCATION_TASK_START-1)								                ;
	LDX #SCROLL_BG_TASK										                                    ;
	JSR CREATE_TASK									                                            ; CREATE THREAD(A,Y = ADDRESS , X= TASK INDEX)

@task_already_created:											                                ; TASK ALREADY CREATED
	LDY #$01										                                            ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	AND #$07										                                            ;
	TAX												                                            ; 
	LDY script_index											                                ;
	LDA GAME_STATUS									                                            ;
	AND #%00100000									                                            ; IS GAME STATUS SCROLL DIRECTION = LEFT  
	BNE @set_scroll_left_speed									                                ; YES-> SET SCROLLING LEFT AMOUNT

@set_scroll_right_speed:	
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; LOAD SCROLL X AMOUNT
	JMP @save_scroll_speed_in_ram									                            ;

@set_scroll_left_speed:							                                                ; SET SCROLLING LEFT AMOUNT
	LDA #$00						                                                            ; = 1 - SCROLL X AMOUNT
	SEC								                                                            ;
	SBC (CURR_BG_SCRIPT_ADDR),Y		                                                            ;

@save_scroll_speed_in_ram:							                                            ; SET SCROLL AMOUNT 
	STA CURRENT_BG_X_SCROLL_SPEED[],X						                                    ; SAVE SCROLL X AMOUNT
	LDX irq_index							                                                    ; LOAD IRQ INDEX
	INY								                                                            ; DATA INDEX++ 
	RTS								                                                            ; RETURN

SET_IRQ_XSCROLL_NAMETABLE_FOR_SCRIPT:							                                ; SET IRQ SCROLL X AND NAMETABLE(X= IRQ INDEX)
	LDA (CURR_BG_SCRIPT_ADDR),Y		                                                            ; SET IRQ CHR SCROLL X = SCROLL X
	STA CURR_IRQ_PPU_ADDR,X			                                                            ;
	INY								                                                            ;
	LDA (CURR_BG_SCRIPT_ADDR),Y		                                                            ; SET IRQ CHR NAMETABLE = CHR NAMETABLE
	STA CURR_IRQ_PPU_ADDR+1,X		                                                            ;
	INY								                                                            ;
	RTS								                                                            ; RETURN

_F}_INIT_BG_SCROLLING_TASK

_F{_SET_IRQ_BG_BANKS_COUNTERS_SCROLLS_FOR_BG_SCRIPT												; DONE

SET_IRQ_BG_CHR_BANKS_FOR_SCRIPT:							                                     ; SET IRQ CHR BANKS (X= IRQ INDEX)
	LDA (CURR_BG_SCRIPT_ADDR),Y		                                                            ; SET IRQ CHR $0000 BANK = $0000 CHR BANK
	STA CURR_IRQ_BG_0000,X			                                                            ; 
	INY								                                                            ; DATA ADDRESS ++
	LDA (CURR_BG_SCRIPT_ADDR),Y		                                                            ; SET IRQ CHR $0800 BANK = $0800 CHR BANK
	STA CURR_IRQ_BG_0800,X			                                                            ; 
	JMP CLEAR_IRQ_COUNTER_FOR_SCRIPT					                                        ; JUMP->CLEAR IRQ COUNTER

SET_IRQ_BG_CHR_BANKS_TO_PREVIOUS_IRQ_FOR_SCRIPT:							                    ; SET IRQ CHR BANKS TO PREVIOUS BANKS (X= IRQ INDEX)
	LDA PREVIOUS_IRQ_BG_0000,X						                                            ; SET IRQ CHR $0000 = PREV IRQ CHR $000
	STA CURR_IRQ_BG_0000,X			                                                            ;
	LDA PREVIOUS_IRQ_BG_0800,X						                                            ; SET IRQ CHR $0800 = PREV IRQ CHR $0800
	STA CURR_IRQ_BG_0800,X			                                                            ;

CLEAR_IRQ_COUNTER_FOR_SCRIPT:							                                        ; CLEAR IRQ COUNTER
	CPX #$0F						                                                            ; IS CURRENT IRQ INDEX > LAST IRQ INDEX
	BCS @exit					                                                            	; YES->EXIT
	LDA #$00						                                                            ; SET IRQ COUNTER = CLEARED
	STA CURR_IRQ_COUNTER,X						                                                ; 
@exit:							                                                                ; EXIT
	RTS							                                                                ; RETURN

SET_IRQ_SCROLL_AND_NAME_TABLE_EQUAL_TO_PREVIOUS:							                    ; LOAD PREVIOUS IRQ SCROLL X & SCROLL X NAMETABLE(X= IRQ INDEX) 

PREVIOUS_IRQ_XSCROLL 	= CURR_IRQ_XSCROLL   - SIZE_OF_IRQ_INFO
PREVIOUS_IRQ_NAMETABLE	= CURR_IRQ_NAMETABLE - SIZE_OF_IRQ_INFO
	
	CPX #$00						                                                            ; IS IRQ INDEX= FIRST IRQ INDEX YES->EXIT
	BEQ @exit					                                                            	;
	LDA PREVIOUS_IRQ_XSCROLL,X						                                            ; SET IRQ SCROLL X = PREV IRQ SCROLL X
	STA CURR_IRQ_XSCROLL,X						                                                ;
	LDA PREVIOUS_IRQ_NAMETABLE,X						                                         ; SET IRQ SCROLL X NAMETABLE = PREV IRQ SCROLL X NAMETABLE
	STA CURR_IRQ_NAMETABLE ,X						                                            ; 

@exit:							                                                            	; EXIT
	RTS							                                                                ; RETURN

_F}_SET_IRQ_BG_BANKS_COUNTERS_SCROLLS_FOR_BG_SCRIPT

_F{_START_STOP_CHANGING_PALLETE_TASK															; DONE	

START_CHANGING_PALLETE_TASK:		                                                            ; START OR END BLINKING PALLETE TASK(A= PAL INDEX OR END COMMAND)
	CMP #$FF						                                                            ; IS VALUE = END COMMAND
	BEQ END_CHANGING_PALLETE_TASK					                                            ; YES->END UPDATE PALLETE TASK, CLEAR BLINKING PAL INDEX()
	STA CHANGING_PALLETE_INDEX 						                                            ; SAVE PALLETE INDEX	
	LDA #DRAW_SCRIPT_PROCESSING_BANK						                                    ; SET TASK BANK = 24
	STA (UPDATE_PALLETE_TASK + TASK_BANK)							                                       
	LDY #<(DO_CHANGING_PALLETE-1)				                                                ; SET TASK ADDRESS = DO BLINKING PALLETE 
	LDA #>(DO_CHANGING_PALLETE-1)				                                                ;
	LDX #UPDATE_PALLETE_TASK						                                            ; SET TASK INDEX = $1B
	JSR CREATE_TASK						                                                        ; CREATE THREAD(A,Y = ADDRESS , X= TASK INDEX)
	RTS							                                                                ; RETURN

END_CHANGING_PALLETE_TASK:							                                            ; END UPDATE PALLETE TASK, CLEAR BLINKING PAL INDEX()
	LDX #UPDATE_PALLETE_TASK						                                            ; LOAD UPDATE PALLETE TASK INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS						                            ; END TASK (X= TASK INDEX)
	LDA #$00						                                                            ; SET BLINKING PALLETE INDEX = NONE
	STA CHANGING_PALLETE_INDEX 							                                        ;
	RTS								                                                            ; RETURN

_F}_START_STOP_CHANGING_PALLETE_TASK

_F{_DO_CHANGING_PALLETE																			; DONE

data_index				   = LOCAL_6
changing_pallete_data_addr = LOCAL_7 

DO_CHANGING_PALLETE:							                                                ; DO BLINKING PALLETE
	LDX #BLINKING_PALLETE_STACK_INDEX								                            ; SET STACK LOCATION  = PALLETE STACK
	TXS											                                                ;
	LDX #PALLETE_DATA_BANK 						                                                ; LOAD BANK 14
	JSR SWAP_A000_BANK							                                                ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA CHANGING_PALLETE_INDEX 					                                                ; LOAD BLINKING PALLETE INDEX
	ASL											                                                ; SHIFT FOR TWO BYTE POINTER TABLE INDEX
	TAX											                                                ;
	LDA $AC00,X									                                                ; SET BLINKING PALLETE ADDR FROM BLINKING PALLETE PTR TABLE
	STA changing_pallete_data_addr				                                                ;
	LDA $AC01,X									                                                ;
	STA changing_pallete_data_addr+1			                                                ;
	
_WHILE EQUAL										                                            ; RESET TO FIRST DATA LOCATION
	LDY #$00									                                                ; SET TO FIRST PALLETE DATA VALUE 

@process_changing_pallete_data:										                            ; PROCESS BLINKING PALLETE COMMANDS LOOP
	LDA (changing_pallete_data_addr),Y			                                                ; IS DATA = COMMAND?
	CMP #$20									                                                ;
	BCS @fully_fade_in								                                            ; YES-> SET BACKGROUND AND SPRITE VALUES TO FULLY FADED IN 
	

@update_pallete_buffer_value	
	TAX											                                                ;
	INY											                                                ; PALLETE DATA INDEX++
	LDA (changing_pallete_data_addr),Y			                                                ;
	STA PALLETE_BUFFER_START,X					                                                ; SAVE IN PALLETE BUFFER
	INY											                                                ;
	JMP @process_changing_pallete_data								                            ; JUMP->PROCESS BLINKING PALLETE COMMANDS LOOP 

@fully_fade_in:										                                            ; SET BACKGROUND AND SPRITE VALUES TO FULLY FADED IN 
	STY data_index										                                         ; SAVE PALLETE DATA INDEX
	JSR UPDATE_BG_SPR_PAL_SET_TO_FULLY_FADED_IN						                            ; SET PALLETE FADES TO FULLY FADED IN()
	LDY data_index										                                        ; DOES DATA VALUE = LOOP BACK TO BEGINNING	
	LDA (changing_pallete_data_addr),Y						                                    ;
	CMP #$FE									                                                ;

_END_WHILE								                                                       ; YES-> RESET TO FIRST DATA LOCATION

	CMP #$FF									                                                ; DOES DATA VALUE = END BLINKING
	BEQ @end_changing_pallete_task								                                ; YES->END BLINKING
	
@set_frames_to_wait_before_next_pal_change:	
	SEC											                                                ; SET FRAMES TO WAIT = DATA  - 32 FRAMES
	SBC #$20									                                                ; 
	JSR DELAY_TASK								                                                ; WAIT TASK(A= # FRAMES)
	INY											                                                ; PALLETE DATA INDEX++
	JMP @process_changing_pallete_data								                                                ; JUMP->PROCESS BLINKING PALLETE COMMANDS LOOP

@end_changing_pallete_task:							                                                            ; END BLINKING
	LDA #$00						                                                            ; CLEAR BLINKING PALLETE PTR INDEX 
	STA CHANGING_PALLETE_INDEX	                                                                ;
	JMP END_CURRENT_TASK			                                                            ; END CURRENT TASK()
	
_F}_DO_CHANGING_PALLETE		

_F{_UPDATE_SPLIT_SCREEN_SCROLL_LOCATION															; DONE

UPDATE_BG_SCROLL_LOCATION_TASK_START:							                                ; UPDATE IRQ X SCROLL 

MAX_SPLIT_SCREENS				= $03 
bg_x_scroll_loc[]	   			= LOCAL_1

bg_x_scroll_nametable			= LOCAL_6
bg_x_scroll_speed_div_16		= LOCAL_7
bg_x_scroll_speed				= LOCAL_7

	LDX #SPLIT_SCREEN_SCROLL_STACK_INDEX 						                                ; SET STACK LOCATION = IRQ X STACK
	TXS								                                                            ;

@clear_local_vars: 
	CLEAR_RAM_Y_INDEX[start_length] LOCAL_1, SIZE_OF_LOCALS 
	

_WHILE ALWAYS							                                                        ; WAIT 1 FRAME THEN UPDATE ALL IRQ SCROLL X

	RETURN_1_FRAME

	LDY #$00						                                                            ; SET IRQ INDEX = FIRST IRQ INDEX
	LDX #$00						                                                            ; 
@scroll_loop:							                                                            ; UPDATE IRQ SCROLL X LOOP
	LDA CURRENT_BG_X_SCROLL_SPEED[],X						                                    ; LOAD X SCROLL SPEED 
	STA bg_x_scroll_speed_div_16						                                                ;
	CLC							                                                                ;
	AND #$80						                                                            ; IS SPEED = POSITIVE = SCROLL RIGHT?
	BPL @update_scroll_location					                                                ; YES-> CONVERT X SCROLL SPEED AND ADD TO SCROLL X LOCATION	

@scroll_left	
	LDA #$FF						                                                            ; 
	SEC							                                                                ;

@update_scroll_location:							                                            ; CONVERT X SCROLL SPEED AND ADD TO SCROLL X LOCATION	
	STA bg_x_scroll_nametable						                                            ;
	ROL bg_x_scroll_speed_div_16						                                        ;
	ROL							                                                                ;
	ROL bg_x_scroll_speed_div_16						                                        ;
	ROL							                                                                ;
	ROL bg_x_scroll_speed_div_16						                                        ;
	ROL							                                                                ;
	ROL bg_x_scroll_speed_div_16						                                        ;	
	ROL							                                                                ;
	STA bg_x_scroll_speed + 1					                                                ;
	LDA bg_x_scroll_speed						                                                ;
	CLC							                                                                ;
	ADC bg_x_scroll_loc[],X						                                                ;
	STA bg_x_scroll_loc[],X						                                                ;
	LDA bg_x_scroll_speed+1						                                                ; IRQ SCROLL X  =  IRQ INDEX + AMOUNT
	ADC CURR_IRQ_XSCROLL,Y						                                                ;
	STA CURR_IRQ_XSCROLL,Y						                                                ;
	LDA bg_x_scroll_nametable						                                            ; SET CURRENT NAMETABLE
	ADC CURR_IRQ_NAMETABLE,Y						                                            ;
	AND #$01						                                                            ;
	STA CURR_IRQ_NAMETABLE,Y						                                            ;
	TYA							                                                                ; IRQ INDEX = IRQ INDEX + OFFSET TO NEXT IRQ
	CLC							                                                                ;
	ADC #SIZE_OF_IRQ_INFO						                                                ;
	TAY							                                                                ;
	INX							                                                                ;  
	CPX #MAX_SPLIT_SCREENS + 1						                                            ; ALL IRQ SCROLL X UPDATED? NO-> UPDATE IRQ SCROLL X LOOP
	BCC @scroll_loop					                                                            ; NO-> UPDATE IRQ SCROLL X LOOP

_END_WHILE					                                                                   ; YES-> WAIT 1 FRAME THEN UPDATE ALL IRQ SCROLL X
	
_F}_UPDATE_SPLIT_SCREEN_SCROLL_LOCATION	

_F{_DRAW_TEAM_NAME_LARGE_EOG_SCREEN																; DONE

DRAW_TEAM_NAME_SCORE_LARGE_EOG_SCREEN:							                                ; DRAW TEAM NAME AND SCORE LARGE (X,Y= PPU ADDR, A= SCORE)

tile_data_addr	= LOCAL_1
high_digit		= LOCAL_7
low_digit		= LOCAL_8


	PHA															                                ; SAVE SCORE
	LOG_SHIFT_RIGHT_4																			; 
	CLC															                                ;
	ADC #OFFSET_TO_NUMBER_TILES - $10													        ; 
	CMP #OFFSET_TO_NUMBER_TILES - $10														    ;
	BEQ @save_high_digit										                                ; IS HIGH DIGIT = 0
	CLC															                                ;
	ADC #$10 													                                ; *** not sure why add after ADD OFFSET TO TILE VALUE
 
@save_high_digit:												                                ;
	STA high_digit														                        ; SAVE HIGH DIGIT TILE VALUE

@set_low_digit:	
	PLA															                                ;
	AND #$0F													                                ; GET LOW DIGIT TILE VALUE
	CLC															                                ;
	ADC #OFFSET_TO_NUMBER_TILES													                ;  = LOW DIGIT VALUE + OFFSET TO TILES
	STA low_digit														                        ;
	
@draw_large_text	
	LDA #high_digit													                            ; SET DATA ADDR = $0044 = SAVED SCORE TILES
	STA tile_data_addr														                    ;
	LDA #$00													                                ; 
	STA tile_data_addr+1														                ;
	LDA #$02													                                ; SET LENGTH = TWO DIGITS 
	JMP DRAW_LARGE_TEXT											                                ; BUFFER_LARGE_TEXT(X,Y= PPU ADDR, 3E,3F= TILE DATA ADDR, A= LENGTH)

_F}_DRAW_TEAM_NAME_LARGE_EOG_SCREEN	

_F{_DRAW_TEAM_CITY_MASCOT_FOR_DRAW_SCRIPT														; DONE

L_24_8DDA:							                                                            ; DRAW TEAM CITY AND MASCOT NOT CENTERED *** UNUSED
    CLC							                                                                ; SET TEXT CENTERING = OFF
	JMP DRAW_TEAM_CITY_MASCOT_FOR_DRAW_SCRIPT					                                ;	

DRAW_TEAM_CITY_MASCOT_INJURY_RETURN_DRAW_SCRIPT:							                    ; DRAW TEAM CITY AND MASCOT CENTERED
    SEC							                                                                ; SET TEXT CENTERING = ON

DRAW_TEAM_CITY_MASCOT_FOR_DRAW_SCRIPT:							                                ; DRAW TEAM CITY AND MASCOT (Carry= CENTERING)

previous_A000_bank_and_justify		= LOCAL_2
text_justify						= LOCAL_2

team_mascot_name_length				= LOCAL_3
team_city_name_length				= LOCAL_4

max_text_length						= LOCAL_8

team_pointer_index					= BUFFER_LOCAL1
total_text_length					= BUFFER_LOCAL2

@save_centering_and_team_id:
	ROR text_justify						                                                    ; SAVE CENTERING
	PHA							                                                                ; SAVE TEAM
	JSR WAIT_UNTIL_PPU_READY						                                            ; CHECK FOR READY TO TRANSFER VRAM(X,Y= PPU ADDR TO UPDATE) SAVE ADDR IN $65,66, SET PPU STATUS
	PLA							                                                                ; LOAD TEAM
	ASL							                                                                ; SHIFT FOR INDEX INTO POINTER TABLE
	STA team_pointer_index						                                                ; SAVE OFFSET TO TEAM NAME POINTER IN $67
	LDA text_justify						                                                    ;
	AND #$80						                                                            ;
	ORA SOFT_A000_BANK						                                                    ;
	STA previous_A000_bank_and_justify						                                    ; SAVE $A000 BANK AND CENTERING
	LDX #TEAM_NAME_CITY_DATA_BANK 						                                        ; LOAD BANK 16
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)

@calculate_team_city_length:	
	LDY team_pointer_index						                                                ; 
	LDA TEAM_CITY_POINTERS+2,Y						                                            ; = NEXT TEAM CITY POINTER ADDRESS - TEAM CITY POINTER ADDRESS
	SEC							                                                                ;
	SBC TEAM_CITY_POINTERS,Y						                                            ;
	STA team_city_name_length						                                            ; SAVE TEAM CITY LENGTH

@calculate_team_name_length:	
	LDA TEAM_MASCOT_POINTERS+2,Y						                                        ; = NEXT TEAM NAME ADDRESS - TEAM CITY NAME ADDRESS
	SEC							                                                                ;
	SBC TEAM_MASCOT_POINTERS,Y						                                            ;
	STA team_mascot_name_length						                                            ; SAVE TEAM NAME LENGTH

@calculate_total_length:	
	CLC							                                                                ; 
	ADC team_city_name_length						                                            ;
	CLC							                                                                ;
	ADC #$01						                                                            ;
	STA total_text_length						                                                ; TOTAL LENGTH = TEAM CITY LENGTH + TEAM NAME LENGTH + 1  
	BIT previous_A000_bank_and_justify							                                ; DOES TEXT ALIGN BIT = CENTERING ON
	BPL @allocate_buffer_space					                                                ; NO-> NO CENTERING
	
@center_text:								                                                    ; CENTER TEXT
	LDA max_text_length						                                                ; PPU ADDR = PPU ADDR + ((max length- Team  LENGTH)/2)
	SEC							                                                                ;
	SBC total_text_length						                                                ;
	LSR							                                                                ;
	CLC							                                                                ;
	ADC PPU_ADDR_TEMP						                                                    ;
	STA PPU_ADDR_TEMP						                                                    ;
	LDA PPU_ADDR_TEMP + 1						                                                ;
	ADC #$00						                                                            ;
	STA PPU_ADDR_TEMP + 1						                                                ; 
	
@allocate_buffer_space:							                                                ; NO CENTERING 
	LDA total_text_length						                                                ; LOAD BUFFER LENGTH
	LDY PPU_ADDR_TEMP						                                                    ; LOAD PPU ADDR
	LDX PPU_ADDR_TEMP + 1						                                                ;
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                                ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	
@get_team_city_data_address:	
	LDY team_pointer_index						                                                ; LOAD TEAM OFFSET 
	LDA TEAM_CITY_POINTERS,Y						                                            ; SET TEAM CITY TEXT ADDRESS FROM TEAM CITY POINTER TABLE + TEAM OFFSET  
	STA TEAM_TEXT_ADDR_INJURY_RETURN					                                        ; *** could have used local variables
	LDA TEAM_CITY_POINTERS+1,Y						                                            ;
	STA TEAM_TEXT_ADDR_INJURY_RETURN+1						                                    ; *** could have used local variables
	
	
	LDY #$00						                                                            ; 	
_WHILE NOT_EQUAL							                                                    ; SAVE TEAM CITY TEXT IN BUFFER LOOP
	
	LDA (TEAM_TEXT_ADDR_INJURY_RETURN),Y						                                                ;
	STA CURRENT_BG_BUFFER_LOC,X						                                            ; SAVE TEAM CITY LETTER IN BUFFER
	INY							                                                                ; DATA ADDR++
	INX							                                                                ; BUFFER INDEX++
	DEC team_city_name_length						                                            ; CITY LETTERS TO TRANSFER--

_END_WHILE					                                                                    ; NOT DONE-> SAVE TEAM CITY TEXT IN BUFFER LOOP
	
	LDA #$00						                                                            ; SET BUFFER VALUE = END 
	STA CURRENT_BG_BUFFER_LOC,X						                                            ;
	INX
	LDY team_pointer_index						                                                ; LOAD TEAM OFFSET  
	LDA TEAM_MASCOT_POINTERS,Y						                                            ; SET TEAM NAME TEXT ADDRESS FROM TEAM NAME POINTER TABLE + TEAM OFFSET  
	STA TEAM_TEXT_ADDR_INJURY_RETURN						                                    ; *** could have used local variables
	LDA TEAM_MASCOT_POINTERS+1,Y						                                        ;
	STA TEAM_TEXT_ADDR_INJURY_RETURN+1						                                     ; *** could have used local variables
	LDY #$00						                                                            ;
	
_WHILE NOT_EQUAL							                                                    ; SAVE TEAM NAME TEXT IN BUFFER LOOP
	
	LDA (TEAM_TEXT_ADDR_INJURY_RETURN),Y						                                                            ;
	STA CURRENT_BG_BUFFER_LOC,X						                                            ; SAVE TEAM NAME LETTER IN BUFFER
	INY							                                                                ; DATA ADDR++
	INX							                                                                ; BUFFER INDEX++
	DEC team_mascot_name_length						                                           ; NAME LETTERS TO TRANSFER--

_END_WHILE					                                                                    ; NOT DONE-> SAVE TEAM NAME TEXT IN BUFFER LOOP

	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						                            ; SET BUFFER LENGTH AND SET BUFFER STATUS TO READY(X= LENGTH)
	JSR SET_PPU_READY_KEEP_TEXT_SIZE						                                    ; SET BUFFER STATUS TO NOT BUSY BUT KEEP TEXT OPTION()
	LDA previous_A000_bank_and_justify						                                    ; MASK OUT CENTERING STATUS AND GET PREVIOUS $A000 BANK 
	AND #$7F						                                                            ;
	TAX							                                                                ; 
	JMP SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP) AND RETURN

_F}_DRAW_TEAM_CITY_MASCOT_FOR_DRAW_SCRIPT

_F{_DRAW_PLAYER_NAME_NUMBER_CENTERED_FOR_BG_SCRIPT												; DONE

DRAW_PLAYER_NAME_NUMBER_CENTERED_FOR_BG_SCRIPT:							                        ; DRAW CURRENT TEAM PLAYER NAME  AND NUMBER CTD ($44= PLAYER, $45= TEAM)

current_ppu_addr	= LOCAL_3
roster_id			= LOCAL_7
team_id				= LOCAL_8
player_number		= LOCAL_8

	LDA SOFT_A000_BANK						                                                    ; SAVE CURRENT $A000 BANK
	PHA							                                                                ;
	STY current_ppu_addr						                                                ; SAVE CURRENT PPU ADDR
	STX current_ppu_addr + 1						                                            ;
	
@save_player_name_to_buffer:	
	LDA team_id							                                                        ; LOAD TEAM
	LDX roster_id						                                                        ; LOAD PLAYER
	JSR GET_PLAYER_NUMBER_SAVE_NAME_TO_BUFFER						                            ; GET PLAYER NAME AND SAVE IN BUFFER(A= TEAM, X=PLAYER)
	JSR DISABLE_INTERRUPTS_RENDERING						                                    ; DISABLE NMI, SPRITES, BACKGROUND, DISABLE MMC3 INTERRUPTS
	
	LDA NES_PPU_STATUS						                                                    ; LOAD PPUSTATUS
	LDA current_ppu_addr + 1						                                            ; SET ACTUAL PPU ADDR = CURRENT PPU ADDR
	STA NES_PPU_ADDR						                                                    ;
	LDA current_ppu_addr						                                                ;
	STA NES_PPU_ADDR						                                                    ;
	
	LDA current_ppu_addr						                                                ;
	AND #$1F						                                                            ;
	TAX							                                                                ;
	LDA team_id						                                                            ; LOAD PLAYER NUMBER
	LOG_SHIFT_RIGHT_4																			; IS HIGH DIGIT = ZERO
	BEQ @set_low_digit					                                                        ; YES-> SET SECOND DIGIT OF PLAYER NUMBER
	CLC							                                                                ;
	ADC #OFFSET_TO_NUMBER_TILES						                                            ; = FIRST DIGIT + OFFSET TO NUMBER TILES

@set_low_digit:							                                                        ; SET SECOND DIGIT OF PLAYER NUMBER
	JSR @save_data_and_update_ppu_addr					                                        ;
	LDA player_number						                                                    ; LOAD PLAYER NUMBER
	AND #$0F						                                                            ; MASK OUT FIRST DIGIT
	CLC							                                                                ;
	ADC #OFFSET_TO_NUMBER_TILES						                                            ; = SECOND DIGIT + OFFSET TO NUMBER TILES
	JSR @save_data_and_update_ppu_addr					                                        ; DRAW DATA, CHECK IF AT END OF ROW()
	LDA #$00						                                                            ; LOAD SPACE TILE
	JSR @save_data_and_update_ppu_addr					                                                            ; DRAW DATA, CHECK IF AT END OF ROW()
	LDY #$00						                                                            ; SET BUFFER INDEX = FIRST TILE

_WHILE NOT_EQUAL							                                                    ; DRAW PLAYER NAME LOOP 

	LDA NAME_BUFFER_START,Y						                                                ;
	JSR @save_data_and_update_ppu_addr					                                                            ; DRAW DATA, CHECK IF AT END OF ROW()
	INY							                                                                ; BUFFER INDEX ++
	DEC NAME_BUFFER_LENGTH						                                                ; TILES TO TRANSFER--

_END_WHILE					                                                                    ; NOT DONE->DRAW PLAYER NAME LOOP
	JSR UPDATE_PPUCTRL						                                                    ; ENABLE NMI()
	JSR SET_NAME_BUFFER_READY						                                            ; SET BUFFER STATUS($37E) TO READY()
	PLA							                                                                ; RESTORE CURRENT $A000 BANK
	TAX							                                                                ;
	JMP SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)

@save_data_and_update_ppu_addr:							                                        ; DRAW DATA CHECK IF AT END OF ROW() 
	STA NES_PPU_DATA						                                                    ; LOAD DATA INTO PPUDATA 
	INX							                                                                ;
	CPX #LENGTH_OF_ONE_ROW						                                                ; PPU LOW BYTE = END OF ROW? 
	BCC @exit					                                                                ; NO-> EXIT
	
@else_update_ppu_addr	
	LDA current_ppu_addr + 1						                                            ; SET CURRENT PPU ADDR = NEXT NAMETABLE = 2ND SCREEN
	EOR #$04						                                                            ;
	STA current_ppu_addr + 1						                                            ;
	STA NES_PPU_ADDR						                                                    ;
	LDA current_ppu_addr						                                                ;
	AND #$E0						                                                            ;
	STA current_ppu_addr						                                                ;
	STA NES_PPU_ADDR						                                                    ;
	LDX #$00						                                                            ; 

@exit:							                                                                ; EXIT
	RTS							                                                                ; RETURN

_F}_DRAW_PLAYER_NAME_NUMBER_CENTERED_FOR_BG_SCRIPT	

_F{_DRAW_END_OF_GAME_STATS																		; DONE 

DRAW_END_OF_GAME_STATS:							                                                ; DRAW END OF GAME STATS

stat_value		= LOCAL_7
team_yardage	= SEGMENT_VAR_8E	; 2 bytes
player_yardage	= SEGMENT_VAR_90	; 2 bytes
	
	LDA P1_TEAM						                                                            ; LOAD P1 TEAM
	CLC							                                                                ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS						                                    ; ADD OFFSET TO TEAM NAME 
	LOAD_ADDR_XY[mem_loc] P1_TEAM_NAME_EOG_STATS_PPU_ADDR 
	JSR DRAW_TEAM_INFO_LARGE						                                            ; DRAW TEAM NAME LARGE BLUE SCREEN(A= TEAM ID, X,Y =PPUADDR)
	
	LDA P2_TEAM						                                                            ; LOAD P2 TEAM
	CLC							                                                                ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS						                                    ; ADD OFFSET TO TEAM NAME
	LOAD_ADDR_XY[mem_loc] P2_TEAM_NAME_EOG_STATS_PPU_ADDR 
	JSR DRAW_TEAM_INFO_LARGE						                                            ; DRAW TEAM NAME LARGE BLUE SCREEN(A= TEAM ID, X,Y =PPUADDR)
	
	LDA P1_TOTAL_SCORE						                                                    ; LOAD P1 TOTAL SCORE
	LOAD_ADDR_XY[mem_loc] P1_TOTAL_SCORE_EOG_STATS_PPU_ADDR						                                                            ;	
	JSR DRAW_TEAM_NAME_SCORE_LARGE_EOG_SCREEN					                                ; DRAW TEAM NAME AND SCORE LARGE (X,Y= PPU ADDR, A= SCORE)
	
	LDA P2_TOTAL_SCORE						                                                    ; LOAD P2 TOTAL SCORE
	LOAD_ADDR_XY[mem_loc] P2_TOTAL_SCORE_EOG_STATS_PPU_ADDR
	JSR DRAW_TEAM_NAME_SCORE_LARGE_EOG_SCREEN					                                ; DRAW TEAM NAME SCORE LARGE(X,Y= PPU ADDR, A= SCORE)
	
	LDA P1_GM_RUSHES						                                                    ; LOAD P1 TOTAL RUSHES
	JSR HEX_TO_2_DIGIT_DEC						                                                ; CONVERT HEX NUMBER TO BCD(A= HEX) 
	LDA stat_value						                                                        ; LOAD DECIMAL NUMBER
	LOAD_ADDR_XY[mem_loc] P1_RUSHES_EOG_STATS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	LDA P2_GM_RUSHES						                                                    ; LOAD P2 TOTAL RUSHES
	JSR HEX_TO_2_DIGIT_DEC						                                                ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDA stat_value						                                                        ; LOAD DECIMAL NUMBER
	LOAD_ADDR_XY[mem_loc] P2_RUSHES_EOG_STATS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_TEAM_1_RUSHING_YARDS  ; *** can use actual addr 
	
	LDY team_yardage							                                                ; LOAD PLAYER 1 TEAM RUSHING YARDS 
	LDX team_yardage + 1							                                                            ;
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P1_RUSH_YARDS_EOG_STATS_PPU_ADDR						                                                            ;
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= PPU, $44,45= HEX NUMBER
	
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_TEAM_2_RUSHING_YARDS	; *** can use actual add
	LDY team_yardage						                                                    ; LOAD PLAYER 2 TEAM RUSHING YARDS
	LDX team_yardage + 1						                                                ;
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P2_RUSH_YARDS_EOG_STATS_PPU_ADDR							                                                            ;
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= PPU, $44,45= HEX NUMBER) 
	
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_TEAM_1_PASSING_YARDS  ; *** can use actual addr 
	LDY team_yardage						                                                    ; LOAD YARDS
	LDX team_yardage + 1						                                                ;
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P1_PASS_YARDS_EOG_STATS_PPU_ADDR						                                                            ;
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= PPU, $44,45= HEX NUMBER
	
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_TEAM_2_PASSING_YARDS  ; *** can use actual addr 
	LDY team_yardage						                                                                ; LOAD YARDS
	LDX team_yardage + 1						                                                                ;
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P2_PASS_YARDS_EOG_STATS_PPU_ADDR							                                                            ; 
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= PPU, $44,45= HEX NUMBER
	
	LDA P1_FIRST_DOWNS						                                                    ; LOAD P1 FIRST DOWNS
	JSR HEX_TO_2_DIGIT_DEC						                                                ; CONVERT 8 BIT HEX NUMBER TO DECIMAL (A= HEX)
	LDA stat_value						                                                        ; LOAD DECIMAL VALUE
	LOAD_ADDR_XY[mem_loc] P1_FIRST_DOWNS_EOG_STATS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	LDA P2_FIRST_DOWNS						                                                    ; LOAD P2 FIRST DOWNS
	JSR HEX_TO_2_DIGIT_DEC						                                                ; CONVERT 8 BIT HEX NUMBER TO DECIMAL (A= HEX)
	LDA stat_value						                                                        ; LOAD DECIMAL VALUE
	LOAD_ADDR_XY[mem_loc] P2_FIRST_DOWNS_EOG_STATS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
@draw_p1_rush_yards_leader:	
	JSR GET_P1_RUSH_YARDS_LEADER_EOG_STATS					                                    ; GET P1 RUSHING YARDS LEADER()
	BCS @draw_p2_rush_yards_leader					                                            ; NO RUN YARDS->DRAW PLAYER 2 RUN YARDS LEADER
	LDY player_yardage						                                                    ; LOAD RUSHING YARDS
	LDX player_yardage + 1						                                                ;
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P1_RUSH_LEADER_YDS_EOG_STATS_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= ADDR)

	JSR CONVERT_RUSH_REC_LEAD_YARDS_TO_DEC					                                    ; CONVERT HEX VALUE TO DECIMAL ($93 = VALUE = RUN ATTEMPTS)
	LOAD_ADDR_XY[mem_loc] P1_RUSH_LEADER_ATT_EOG_STATS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	LDA P1_TEAM						                                                            ; LOAD TEAM 1
	LOAD_ADDR_XY[mem_loc] P1_RUSH_LEADER_NAME_EOG_STATS_PPU_ADDR						                                                            ;
	JSR DRAW_RUSH_REC_YARDS_LEADER_NAME_EOG_STATS					                                                            ; DRAW PLAYER FULL NAME(A= TEAM, $92=PLAYER)

@draw_p2_rush_yards_leader:							                                            ; DRAW PLAYER 2 RUN YARDS LEADER
	JSR GET_P2_RUSH_YARDS_LEADER_EOG_STATS					                                    ; GET P2 RUSHING YARDS LEADER()
	BCS @draw_p1_pass_yards_leader					                                            ; NO RUSHING YARDS->DRAW PLAYER 1 REC YARDS LEADER
	LDY player_yardage							                                                            ; LOAD RUSHING YARDS
	LDX player_yardage + 1							                                                            ;
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P2_RUSH_LEADER_YDS_EOG_STATS_PPU_ADDR			                                                            ; SET P2 RUN YARDS LEADER YARDS ADDR = $22BA

	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= ADDR)
	JSR CONVERT_RUSH_REC_LEAD_YARDS_TO_DEC					                                    ; CONVERT HEX VALUE TO DECIMAL ($93 = VALUE = RUN ATTEMPTS) 
	LOAD_ADDR_XY[mem_loc] P2_RUSH_LEADER_ATT_EOG_STATS_PPU_ADDR	 		                                                            ; SET P2 RUN ATT LEADER ADDR = $22B8 

	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	LDA P2_TEAM						                                                            ; LOAD TEAM 2
	LOAD_ADDR_XY[mem_loc] P2_RUSH_LEADER_NAME_EOG_STATS_PPU_ADDR			                                                            ; SET P2 RUN ATTEMPTS LEADER NAME ADDR = $22A7

	JSR DRAW_RUSH_REC_YARDS_LEADER_NAME_EOG_STATS				                                                            ; DRAW PLAYER FULL NAME(A= TEAM, $92=PLAYER)

@draw_p1_pass_yards_leader:							                                            ; DRAW PLAYER 1 PASSING YARDS LEADER
	JSR GET_P1_PASS_ATT_FOR_YARDS_LEADER_EOG_STATS					                                                            ; GET P1 PASSING YARDS LEADER()
	BCS @draw_p2_pass_yards_leader					                                            ; NO PASSING YARDS-> DRAW PLAYER 2 PASSING YARDS LEADER
	LDY player_yardage							                                                ; LOAD PASS YARDS
	LDX player_yardage + 1							                                            ;
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P1_PASS_LEADER_YARDS_EOG_STATS_PPU_ADDR			                                    ; SET P1 PASS YARDS LEADER YARDS ADDR = $22F7				
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= ADDR)
	
	LDX #QB_PASS_INT_SEASON_STAT_INDEX						                                                            ; SET STAT TO GET  = INTERCEPTIONS
	JSR GET_2_DIG_STAT_AND_CONVERT_TO_DECIMAL					                                ; GET STAT AND CONVERT TO DECIMAL(X = STAT TO GET)
	LOAD_ADDR_XY[mem_loc] P1_PASS_LEADER_INTS_EOG_STATS_PPU_ADDR						                                                ; SET P1 PASS YARDS LEADER INT ADDR = $22FC
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	JSR GET_COMP_PCT_CONVERT_TO_DECIMAL					                                        ; GET COMPLETION PERCENTAGE()
	LOAD_ADDR_XY[mem_loc] P1_PASS_LEADER_COMP_PCT_EOG_STATS_PPU_ADDR			                                                            ; SET P1 PASS YARDS LEADER COMP% ADDR = $22F3
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= ADDR)
	
	LDA P1_TEAM						                                                            ; LOAD P1 TEAM
	LOAD_ADDR_XY[mem_loc] P1_PASS_LEADER_NAME_EOG_STATS_PPU_ADDR 		                                                            ;  SET P1 PASS YARDS LEADER NAME ADDR = $22E7
	JSR DRAW_PASS_YARDS_LEADER_NAME_EOG_STATS					                                                            ; DRAW PLAYER FIRST INITIAL AND LAST NAME (X,Y = PPU ADDR, A= TEAM)

@draw_p2_pass_yards_leader:							                                            ; DRAW PLAYER 2 PASSING YARDS LEADER
	JSR GET_P2_PASS_ATT_FOR_YARDS_LEADER_EOG_STATS					                                                            ; GET P2 PASSING YARDS LEADER()
	BCS @draw_p1_rec_yards_leader					                                            ; NO PASSING YARDS-> DRAW PLAYER 1 REC YARDS LEADER
	LDY player_yardage						                                                                ; LOAD PASS YARDS
	LDX player_yardage + 1					                                                                ; 
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P2_PASS_LEADER_YARDS_EOG_STATS_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= ADDR)
	
	LDX #QB_PASS_INT_SEASON_STAT_INDEX						                                                            ; SET STAT TO GET  = INTERCEPTIONS
	JSR GET_2_DIG_STAT_AND_CONVERT_TO_DECIMAL					                                ; GET STAT AND CONVERT TO DECIMAL(X = STAT TO GET)
	LOAD_ADDR_XY[mem_loc] P2_PASS_LEADER_INTS_EOG_STATS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	JSR GET_COMP_PCT_CONVERT_TO_DECIMAL					                                        ; GET COMPLETION PERCENTAGE()
	LOAD_ADDR_XY[mem_loc] P2_PASS_LEADER_COMP_PCT_EOG_STATS_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= ADDR)
	
	LDA P2_TEAM						                                                            ; LOAD P2 TEAM
	LOAD_ADDR_XY[mem_loc] P2_PASS_LEADER_NAME_EOG_STATS_PPU_ADDR 
	JSR DRAW_PASS_YARDS_LEADER_NAME_EOG_STATS					                                                            ; DRAW PLAYER FIRST INITIAL AND LAST NAME (X,Y = PPU ADDR, A= TEAM)

@draw_p1_rec_yards_leader:			                                                            ; DRAW PLAYER 1 REC YARDS LEADER
	JSR GET_P1_REC_FOR_YARDS_LEADER_EOG_STATS					                                                            ; GET P1 REC YARDS LEADER()
	BCS @draw_p2_rec_yards_leader	                                                            ; NO REC YARDS-> DRAW PLAYER 2 REC YARDS LEADER
	LDY player_yardage							                                                ; LOAD REC YARDS
	LDX player_yardage + 1							                                            ;
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P1_REC_LEADER_YDS_EOG_STATS_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= ADDR)
	
	JSR CONVERT_RUSH_REC_LEAD_YARDS_TO_DEC					                                    ; CONVERT HEX VALUE TO DECIMAL ($93 = VALUE) VALUE =REC
	LOAD_ADDR_XY[mem_loc] P1_REC_LEADER_ATT_EOG_STATS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	LDA P1_TEAM						                                                            ; LOAD P1 TEAM
	LOAD_ADDR_XY[mem_loc] P1_REC_LEADER_NAME_EOG_STATS_PPU_ADDR						                                                            ;
	JSR DRAW_RUSH_REC_YARDS_LEADER_NAME_EOG_STATS					                                                            ; DRAW PLAYER FULL NAME(A= TEAM, $92=PLAYER)

@draw_p2_rec_yards_leader:							                                            ; DRAW PLAYER 2 REC YARDS LEADER
	JSR GET_P2_REC_FOR_YARDS_LEADER_EOG_STATS					                                                            ; GET P2 REC YARDS LEADER()
	BCS exit_draw_eog_player_stats					                                                            ; NO REC YARDS->EXIT
	LDY player_yardage						                                                                ; LOAD REC YARDS
	LDX player_yardage + 1						                                                                ; 
	JSR CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE					                            ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	LOAD_ADDR_XY[mem_loc] P2_REC_LEADER_YDS_EOG_STATS_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                                    ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= ADDR)
	
	JSR CONVERT_RUSH_REC_LEAD_YARDS_TO_DEC					                                    ; CONVERT HEX VALUE TO DECIMAL ($93 = VALUE) VALUE =REC
	LOAD_ADDR_XY[mem_loc] P2_REC_LEADER_ATT_EOG_STATS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES						                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	LDA P2_TEAM						                                                            ; LOAD P2 TEAM
	LOAD_ADDR_XY[mem_loc] P2_REC_LEADER_NAME_EOG_STATS_PPU_ADDR
	JSR DRAW_RUSH_REC_YARDS_LEADER_NAME_EOG_STATS					                            ; DRAW PLAYER FULL NAME(A= TEAM, $92=PLAYER)

exit_draw_eog_player_stats:							                                            ; EXIT
	RTS							                                                                ; RETURN

_F}_DRAW_END_OF_GAME_STATS

_F{_DRAW_PLAYER_NAME_EOG_STATS																	; DONE



DRAW_RUSH_REC_YARDS_LEADER_NAME_EOG_STATS:							                            ; DRAW PLAYER FULL NAME(A= TEAM, $92=PLAYER)

TEAM_ID_FOR_DRAW_NAME		= SEGMENT_VAR_8E
ROSTER_ID_FOR_DRAW_NAME		= SEGMENT_VAR_92

temp_ppu_addr				= LOCAL_3
temp_roster_id				= LOCAL_7		
temp_team_id				= LOCAL_8

	JSR GET_PLAYER_NAME_AND_TEAM_IF_PRO_BOWL_EOG_STATS					                        ; GET PLAYER TEAM IF PROBOWL(A= TEAM ID)	
	STA temp_team_id						                                                    ; SAVE TEAM
	LDA SOFT_A000_BANK						                                                    ; SAVE CURRENT $A000 BANK
	PHA							                                                                ;	
	LDA ROSTER_ID_FOR_DRAW_NAME						                                            ; LOAD PLAYER
	STA temp_roster_id						                                                    ;
	JSR DRAW_PLAYER_NAME						                                                ; DRAW PLAYER FULL NAME($44= PLAYER, $45= TEAM)
	PLA							                                                                ; LOAD PREVIOUS $A000 BANK
	TAX							                                                                ;
	JMP SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)

DRAW_PASS_YARDS_LEADER_NAME_EOG_STATS:							                                ; DRAW PLAYER FIRST INITIAL AND LAST NAME (X,Y = PPU ADDR, A= TEAM)
	JSR GET_PLAYER_NAME_AND_TEAM_IF_PRO_BOWL_EOG_STATS					                        ; GET PLAYER TEAM IF PROBOWL(A= TEAM ID)	
	STA TEAM_ID_FOR_DRAW_NAME						                                            ; SAVE PLAYER TEAM
	LDA SOFT_A000_BANK						                                                    ; SAVE CURRENT $A000 BANK
	PHA							                                                                ;
	STY temp_ppu_addr						                                                    ; SAVE PPU ADDR
	STX temp_ppu_addr+ 1						                                                ;
	
@get_player_name:	
	LDA TEAM_ID_FOR_DRAW_NAME						                                            ; LOAD TEAM
	LDX ROSTER_ID_FOR_DRAW_NAME						                                            ; LOAD PLAYER
	JSR GET_PLAYER_NUMBER_SAVE_NAME_TO_BUFFER						                            ; GET PLAYER NAME AND SAVE IN BUFFER(A= TEAM, X=PLAYER)

@draw_first_initial:	
	LDY temp_ppu_addr					                                                        ; LOAD PPU ADDR
	LDX temp_ppu_addr+1						                                                    ;
	LDA #$02						                                                            ; SET FIRST NAME LENGTH = 2 
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                                ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDA NAME_BUFFER_START						                                                ; SAVE FIRST NAME INITIAL IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X						                                            ;

@draw_period:	
	INX							                                                                ; BUFFER INDEX++
	LDA #PERIOD_TILE_ID						                                                     ; SAVE PERIOD TILE VALUE "." IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X						                                            ;
	INX							                                                                ; BUFFER INDEX++
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						                            ; SET BUFFER LENGTH  AND SET BUFFER STATUS TO READY(X= LENGTH)
	JSR SET_NAME_BUFFER_READY						                                            ; SET BUFFER STATUS($37E) TO READY()
	
@draw_last_Name:	
	LDA TEAM_ID_FOR_DRAW_NAME						                                            ; SET TEAM = PLAYER TEAM
	STA temp_team_id						                                                    ;
	LDA ROSTER_ID_FOR_DRAW_NAME						                                            ; SET PLAYER = PLAYER 
	STA temp_roster_id						                                                    ;
	LDA temp_ppu_addr						                                                    ; SET PPU ADDR = PPU ADDR + OFFSET TO LAST NAME ( 2 TILES)
	CLC							                                                                ;
	ADC #$02						                                                            ;
	TAY							                                                                ;
	LDX temp_ppu_addr+1						                                                    ;
	JSR DRAW_LAST_NAME_10_CHAR						                                            ; DRAW PLAYER LAST NAME MAX LENGTH 10 CHAR(X,Y= PPU LOCATION,$44=PLAYER, $45=TEAM)
	PLA							                                                                ; RESTORE PREVIOUS $A000 BANK
	TAX							                                                                ;
	JMP SWAP_A000_BANK						                                                    ; JUMP->SWAP $A000 BANK(X= $A000 BANK TO SWAP)

GET_PLAYER_NAME_AND_TEAM_IF_PRO_BOWL_EOG_STATS:							                        ; GET PLAYER TEAM IF PROBOWL TEAM(A= TEAM ID)

player_team_id						= LOCAL_7	
temp_pro_bowl_team_id				= LOCAL_7
pro_bowl_player_index				= LOCAL_8

	CMP #AFC_TEAM_ID						                                                    ; IS TEAM ID = PROBOWL 
	BCC @exit						                                                            ; NO-> EXIT

	
	STX temp_pro_bowl_team_id						                                             ; 
	LDX #$00						                                                            ; SET INDEX = AFC PROBOWL PLAYERS
	CMP #NFC_TEAM_ID						                                                    ; IS TEAM ID = NFC PRO BOWL TEAM?
	BCC @get_player_team_and_roster_id						                                    ; NO->

@set_index_tonfc_players:	
	LDX #OFFSET_TO_NFC_PLAYERS						                                            ; ADD OFFSET TO NFC PRO BOWL PLAYERS

@get_player_team_and_roster_id:							                                        ;
	STX pro_bowl_player_index						                                            ; SAVE AFC,NFC PLAYER INDEX
	LDA ROSTER_ID_FOR_DRAW_NAME						                                            ; = PLAYER ID + AFC,NFC PLAYER INDEX
	ASL							                                                                ;
	CLC							                                                                ;
	ADC pro_bowl_player_index						                                            ;
	TAX							                                                                ;
	LDA PRO_BOWL_PLAYER_INFO+1,X						                                        ; SET ACTUAL PLAYER FROM PRO BOWL PLAYERS
	STA ROSTER_ID_FOR_DRAW_NAME						                                            ;
	LDA PRO_BOWL_PLAYER_INFO,X						                                            ; SET ACTUAL TEAM FROM PRO BOWL TEAMS
	LDX player_team_id						                                                    ;

@exit:							                                                                ; EXIT
	RTS							                                                                ; 
	
_F}_DRAW_PLAYER_NAME_EOG_STATS

_F{_GET_RUSH_YARDS_LEADER_EOG_STATS																; DONE

leader_yards				= SEGMENT_VAR_90

GET_P1_RUSH_YARDS_LEADER_EOG_STATS:							                                    ; GET P1 RUSHING YARDS LEADER()
	LDA #P1_SIDE_ID						                                                        ; SET TEAM = P1
	JMP GET_RUSH_YARDS_LEADER_EOG_STATS					                                        ; JUMP-> GET RUSHING YARDS LEADER(A= P1 OR P2)
	
GET_P2_RUSH_YARDS_LEADER_EOG_STATS:							                                    ; GET P2 RUSHING YARDS LEADER()
	LDA #P2_SIDE_ID						                                                        ; SET TEAM = P2

GET_RUSH_YARDS_LEADER_EOG_STATS:							                                    ; GET RUSHING YARDS LEADER(A= P1 OR P2)
	JSR CLEAR_EOG_LEADER_YARDS_LEADER_ROSTER_ID					                                ; CLEAR YARDS VALUE AND SET PLAYER ID = FALSE 
	LDY #QB_RUSH_ATTEMPTS_SEASON_STAT_INDEX						                                ; SET STAT  TO GET = QB IN GAME RUN ATT 
	LDX #QB_RUSH_YDS_SEASON_STAT_INDEX						                                    ; SET STAT  TO COMPARE = QB IN GAME RUN YARDS
	JSR GET_NUM_ATT_FOR_QB_RUN_OR_PASS_YARDS_LEADER_EOG_STATS					                ; CHECK QBS LEADER (X=STAT TO COMPARE, Y= OTHER STAT TO SAVE)
	LDA leader_yards						                                                    ; **** ADD CONSTANT TO YARDS WHY? 
	CLC							                                                                ;
	ADC #$00						                                                            ;
	STA leader_yards						                                                    ;
	LDA leader_yards + 1						                                                ;
	ADC #$10						                                                            ;
	STA leader_yards + 1						                                                ;
	LDY #SKILL_RUN_ATT_SEASON_STAT_INDEX						                                ; SET STAT  TO GET = SKILL PLAYER IN GAME RUN ATT
	LDX #SKILL_RUN_YDS_SEASON_STAT_INDEX						                                ; SET STAT  TO COMPARE = SKILL PLAYER IN GAME RUN YARDS
	JSR GET_NUM_ATT_REC_FOR_YARDS_LEADER_EOG_STATS					                            ; CHECK SKILL PLAYERS LEADER (X=STAT TO COMPARE, Y= OTHER STAT)
	RTS							                                                                ; RETURN
	
_F}_GET_RUSH_YARDS_LEADER_EOG_STATS	

_F{_GET_PASS_YARDS_LEADER_EOG_STATS																; DONE

GET_P1_PASS_ATT_FOR_YARDS_LEADER_EOG_STATS:							                            ; GET P1 PASSING YARDS LEADER()
	LDA #P1_SIDE_ID						                                                        ; SET TEAM SIDE = P1
	JMP GET_PASS_ATT_FOR_YARDS_LEADER_EOG_STATS

GET_P2_PASS_ATT_FOR_YARDS_LEADER_EOG_STATS:							                           ; GET P2 PASSING YARDS LEADER()
	LDA #P2_SIDE_ID						                                                       ; SET TEAM SIDE = P2

GET_PASS_ATT_FOR_YARDS_LEADER_EOG_STATS:							                                    ; GET PASSING YARDS LEADER(A= TEAM SIDE)
	JSR CLEAR_EOG_LEADER_YARDS_LEADER_ROSTER_ID					                                ; CLEAR YARDS VALUE AND SET PLAYER ID LEADER = NONE 
	LDY #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX						                                ; SET STAT  TO GET = SKILL PLAYER IN GAME RUN ATT
	LDX #QB_PASS_YDS_SEASON_STAT_INDEX						                                    ; SET STAT  TO COMPARE = QB IN GAME PASS YARDS 
	JMP GET_NUM_ATT_FOR_QB_RUN_OR_PASS_YARDS_LEADER_EOG_STATS					                ; JUMP->CHECK QBS LEADER (X=STAT TO COMPARE, Y= OTHER STAT TO SAVE)

_F}_GET_PASS_YARDS_LEADER_EOG_STATS

_F{_GET_REC_YARDS_LEADER_EOG_STATS																; DONE

GET_P1_REC_FOR_YARDS_LEADER_EOG_STATS:							                                ; GET P1 REC YARDS LEADER
	LDA #P1_SIDE_ID						                                                            ; SET TEAM SIDE = P1
	JMP GET_NUM_REC_FOR_YARDS_LEADER

GET_P2_REC_FOR_YARDS_LEADER_EOG_STATS:							                                ; GET P2 REC YARDS LEADER
	LDA #P2_SIDE_ID						                                                            ; SET TEAM SIDE = P2

GET_NUM_REC_FOR_YARDS_LEADER:							                                                            ;
	JSR CLEAR_EOG_LEADER_YARDS_LEADER_ROSTER_ID					                                ; CLEAR YARDS VALUE AND SET PLAYER ID LEADER = NONE
	LDY #SKILL_REC_SEASON_STAT_INDEX						                                    ; SET STAT  TO GET = IN GAME REC 
	LDX #SKILL_REC_YDS_SEASON_STAT_INDEX						                                ; SET STAT  TO COMPARE = IN GAME REC YARDS
	JMP GET_NUM_ATT_REC_FOR_YARDS_LEADER_EOG_STATS

_F}_GET_REC_YARDS_LEADER_EOG_STATS

_F{_COMPARE_YARDAGES_FOR_EOG_STATS_LEADERS														; DONE

NO_LEADER_VALUE				= $FF

yards_to_compare			= LOCAL_7
stat_to_get					= SEGMENT_VAR_8E													; attempts/receptions stat index
stat_to_compare				= SEGMENT_VAR_8F													; yardage stat index
leader_yards				= SEGMENT_VAR_90													; holds the yards value for curent leader
leader_roster_id			= SEGMENT_VAR_92
leader_attemps_or_rec		= SEGMENT_VAR_93

number_attemps_or_rec		= SEGMENT_VAR_94
num_players_to_check		= SEGMENT_VAR_96
current_roster_id			= SEGMENT_VAR_97
	

CLEAR_EOG_LEADER_YARDS_LEADER_ROSTER_ID:							                            ; CLEAR YARDS VALUE AND SET PLAYER ID = FALSE
	STA TEAM_ON_OFFENSE						                                                    ; SAVE CURRENT SIDE (0=P1,1=P2)
	LDA #$00						                                                            ; SET YARDS LEADER YARDS = 0
	STA leader_yards						                                                    ;
	STA leader_yards+1						                                                    ;
	LDA #NO_LEADER_VALUE						                                                ; SET YARDS LEADER PLAYER ID = NONE
	STA leader_roster_id						                                                ;
	RTS							                                                                ; RETURN

GET_NUM_ATT_REC_FOR_YARDS_LEADER_EOG_STATS:							                            ; CHECK SKILL PLAYERS LEADER (X=STAT TO COMPARE, Y= OTHER STAT)
	LDA #NUMBER_OF_SKILL_PLAYERS_ON_ROSTER						                                ; SET PLAYERS TO CHECK = 10 everyone but qb 
	STA num_players_to_check						                                            ;
	LDA #RB1_ROSTER_ID						                                                    ; SET CURRENT PLAYER = RB1
	STA current_roster_id						                                                ;
	JMP COMPARE_AND_SAVE_LEADER_STATS					                                        ; JUMP->COMPARE AND SAVE LEADER STATS (X=STAT TO COMPARE, Y= OTHER STAT)

GET_NUM_ATT_FOR_QB_RUN_OR_PASS_YARDS_LEADER_EOG_STATS:							                ; CHECK QBS LEADER (X=STAT TO COMPARE, Y= OTHER STAT TO SAVE)
	LDA #NUMBER_OF_QBS_ON_ROSTER						                                        ; SET PLAYERS TO CHECK = 2
	STA num_players_to_check						                                            ;
	LDA #QB1_ROSTER_ID						                                                    ; SET CURRENT PLAYER = QB1
	STA current_roster_id						                                                ;

COMPARE_AND_SAVE_LEADER_STATS:					                                                ; COMPARE AND SAVE LEADER STATS (X=STAT TO COMPARE, Y= OTHER STAT)
	STY stat_to_get							                                                    ;
	STX stat_to_compare						                                                    ;

_WHILE NOT_EQUAL							                                                    ; COMPARE STATS LOOP
	LDA current_roster_id						                                                ; LOAD CURRENT PLAYER
	LDX stat_to_get							                                                    ;
	JSR SWAP_AND_GET_CURRENT_GAME_STATS						                                    ; GET STATS(X= STAT TO GET)
	LDA yards_to_compare						                                                ; LOAD CURRENT PLAYER YARDS
	BEQ @check_next_player						                                                ; YARDS = 0? YES->CHECK NEXT PLAYER
	
	STA number_attemps_or_rec						                                            ; SAVE LOW YARDS
	
	LDA current_roster_id						                                                ; LOAD CURRENT PLAYER
	LDX stat_to_compare						                                                    ; 
	JSR SWAP_AND_GET_CURRENT_GAME_STATS						                                    ; GET STATS(X= STAT TO GET)
	LDA yards_to_compare						                                                ;
	CLC							                                                                ;
	ADC #$00						                                                            ;
	STA yards_to_compare						                                                ;
	LDA yards_to_compare + 1						                                            ;
	ADC #$10						                                                            ; ***CONSTANT ADDED DUE TO WAY QB RUN YARDS ARE STORED?
	STA yards_to_compare + 1						                                            ; IS CURRENT YARDAGE > YARDAGE LEADER
	LDA leader_yards						                                                    ;
	CMP yards_to_compare						                                                ;
	LDA leader_yards +1						                                                    ;
	SBC yards_to_compare+1						                                                ;
	BCS @check_next_player						                                                ; NO-> CHECK NEXT PLAYER
	
@compare_yards_greater_than_leader:	
	LDA yards_to_compare						                                                ; SET YARDAGE LEAD = CURRENT YARDAGE 
	STA leader_yards						                                                    ;
	LDA yards_to_compare + 1						                                            ;
	STA leader_yards +1						                                                    ;
	
	LDA current_roster_id						                                                ; SET PLAYER LEADER = CURRENT PLAYER
	STA leader_roster_id						                                                ;
	LDA number_attemps_or_rec						                                            ; SAVE RUN ATTEMPTS/RECEPTIONS IN SECOND STAT	
	STA leader_attemps_or_rec						                                            ;

@check_next_player:							                                                    ; CHECK NEXT PLAYER
	INC current_roster_id						                                                ; CURRENT PLAYER ID ++
	DEC num_players_to_check						                                            ; PLAYERS TO CHECK--

_END_WHILE						                                                                ; DONE? NO->COMPARE STATS LOOP
	
	LDA leader_roster_id						                                                ; IS CURRENT LEADER PLAYER ID = NONE
	ASL							                                                                ;
	BCS @exit						                                                            ; YES->EXIT
	
	LDA leader_yards						                                                    ;
	SEC							                                                                ;
	SBC #$00						                                                            ;
	STA leader_yards						                                                    ;
	LDA leader_yards + 1						                                                ;
	SBC #$10						                                                            ; *** GETS SUBTRACTED BACK OUT HERE
	STA leader_yards + 1					                                                    ;
	CLC							                                                                ;

@exit:							                                                                ; EXIT
	RTS							                                                                ; RETURN
	
_F}_COMPARE_YARDAGES_FOR_EOG_STATS_LEADERS

_F{_CONVERT_STATS_TO_DRAW_TO_DECIMAL						                                    ; DONE

temp_math_result				= LOCAL_3
temp_hex_value					= LOCAL_7
temp_decimal_value				= LOCAL_7


roster_id				= SEGMENT_VAR_92
stat_value_hex			= SEGMENT_VAR_93

CONVERT_RUSH_REC_LEAD_YARDS_TO_DEC:							                                    ; CONVERT HEX VALUE TO DECIMAL ($93 = VALUE)
	LDA stat_value_hex										                                    ; LOAD HEX NUMBER
	JMP CONVERT_STAT_TO_DECIMAL								                                    ; JUMP->GET DECIMAL VALUE

GET_2_DIG_STAT_AND_CONVERT_TO_DECIMAL:						                                    ; GET STAT AND CONVERT TO DECIMAL ($92 = PLAYER ID, X= STAT TO GET)
	LDA roster_id											                                    ; LOAD PLAYER ID					
	JSR SWAP_AND_GET_CURRENT_GAME_STATS						                                    ; GET STATS(X= STAT TO GET)
	LDA temp_decimal_value									                                    ; LOAD NUMBER

CONVERT_STAT_TO_DECIMAL:									                                    ; GET DECIMAL VALUE
	JSR HEX_TO_2_DIGIT_DEC									                                    ; CONVERT 8 BIT HEX NUMBER TO BINARY DECIMAL (A= HEX)
	LDA temp_decimal_value									                                    ; LOAD BCD NUMBER
	RTS														                                    ; RETURN

CONVERT_YARDS_TO_DECIMAL_ZERO_IF_NEGATIVE:					                                    ; CONVERT YARDS TO DECIMAL SET TO ZERO IF NEGATIVE(X,Y=NUM)
	TXA														                                    ; ARE YARDS NEGATIVE
	BPL @convert												                                    ; NO->CONVERT YARDS TO BCD (X,Y= NUM)
	
@set_to_zero_if_negative:	
	LDY #$00												                                    ; SET YARDS = 0
	LDX #$00												                                    ;

@convert:														                                    ; CONVERT YARDS TO BCD (X,Y= NUM)
	STY temp_hex_value										                                    ; SAVE YARDS
	STX temp_hex_value+1									                                    ;
	JSR HEX_TO_3_DIGIT_DEC									                                    ; CONVERT 16 BIT HEX NUMBER TO BCD (A= HEX)
	LDA temp_math_result									                                    ; SAVE BCD YARDS 
	STA temp_decimal_value									                                    ;
	LDA temp_math_result+1									                                    ;
	STA temp_decimal_value+1								                                    ;
	RTS														                                    ; RETURN

GET_COMP_PCT_CONVERT_TO_DECIMAL:							                                    ; GET COMPLETION PERCENTAGE (92= PLAYER ID)

pass_completions			= LOCAL_5
temp_math_result			= LOCAL_6
pass_attempts				= LOCAL_7
comp_pct_2_dig				= LOCAL_8

	LDX #$00												                                    ; SET STAT TO GET = COMPLETIONS
	LDA roster_id											                                    ; LOAD PLAYER ID
	JSR SWAP_AND_GET_CURRENT_GAME_STATS						                                    ; GET STATS(X= STAT TO GET)
	LDA temp_hex_value										                                    ; COMPLETIONS = 0?
	BEQ @zero_comp_exit										                                    ; YES->EXIT
	
@save_completions:	
	STA pass_completions								                                        ;

@get_attempts:
	LDX #$01												                                    ; SET STAT TO GET = ATTEMPTS
	LDA roster_id											                                    ; LOAD PLAYER ID
	JSR SWAP_AND_GET_CURRENT_GAME_STATS						                                    ; GET STATS(X= STAT TO GET)
	LDA pass_attempts										                                    ; LOAD PASS ATTEMPTS

@multiply_by_100:	
	LDX #$64												                                    ; SET MULTIPLIER = 100
	JSR MULTIPLY_A_TIMES_X									                                    ; 8 BIT MULTIPLY (A * X)  RESULT IN $44,45 = PASS COMP * 100 
	LDA #$00												                                    ; SET UPPER BIT =0 
	STA temp_math_result									                                    ;
	JSR DIVIDE_16_BIT_16_BIT_RESULT							                                    ; 16 BIT DIVIDE ($45,44/ $43,42) RESULT $45,44 =(100* PASS COMP)/ATT 
	LDA temp_hex_value										                                    ; LOAD NON-DECIMAL PART OF COMP%
	JSR HEX_TO_2_DIGIT_DEC									                                    ; CONVERT HEX NUMBER TO BCD(A= HEX)
	RTS														                                    ; RETURN

@zero_comp_exit:											                                    ; EXIT
	STA comp_pct_2_dig													                        ; SET COMP % = 0 
	RTS														                                    ; RETURN

_F}_CONVERT_STATS_TO_DRAW_TO_DECIMAL

UNUSED_BANK24_DATA:													                             ; *** UNUSED
	.DB $00, $00, $20, $22, $00

_F{_COIN_TOSS_WINNER_MENU_ARROW_SPR_INFO
															                                    ; *** could move to after function
P1_WINS_TOSS_MENU_ARROW_SPR_INFO_TABLE:													        ; P1 WIN COIN TOSS SELECTION SPRITE INFO
	.DB $C0, $00, $03, $28									                                    ; Y, ARROW TILE, ATTRIB, X

P2_WINS_TOSS_MENU_ARROW_SPR_INFO_TABLE:													        ; P2 WIN COIN TOSS SELECTION SPRITE INFO
	.DB $C0, $00, $03, $A8									                                    ; Y, ARROW TILE, ATTRIB, X

_F}_COIN_TOSS_WINNER_MENU_ARROW_SPR_INFO	

_F{_PLAYOFF_BRACKET_BG_DATA_TABLE																 ; DONE

PLAYOFF_BRACKET_TEAM_NAME_PPU_ADDR_TABLE:						                                ; PLAYOFF BRACKET TEAM NAME PPU LOCATIONS
								                                                                ; MATCHUP NUMBER, PPU ADDR
	.DB (AFC_DIVISIONAL_TWO_HOME_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD AFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR					                        ; AFC DIV 2   LINE 1
	
	.DB (AFC_WILD_CARD_TWO_HOME_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD AFC_WILD_CARD_TWO_HOME_TEAM_NAME_PPU_ADDR 				                            ; AFC WILD 3  LINE 2
	
	.DB (AFC_WILD_CARD_TWO_AWAY_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD AFC_WILD_CARD_TWO_AWAY_TEAM_NAME_PPU_ADDR				                               ; AFC DIV 3   LINE 3 
	
	.DB (AFC_WILD_CARD_ONE_AWAY_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD AFC_WILD_CARD_ONE_AWAY_TEAM_NAME_PPU_ADDR				                                ; AFC WILD 1  LINE 4
	
	.DB (AFC_WILD_CARD_ONE_HOME_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD AFC_WILD_CARD_ONE_HOME_TEAM_NAME_PPU_ADDR				                                ; AFC WILD 2  LINE 5
	
	.DB (AFC_DIVISIONAL_ONE_HOME_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD AFC_DIVISIONAL_ONE_HOME_TEAM_NAME_PPU_ADDR 				                            ; AFC DIV 1   LINE 6
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	.DB (NFC_DIVISIONAL_TWO_HOME_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD NFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR 				                            ; NFC DIV 2   LINE 1
	
	.DB (NFC_WILD_CARD_TWO_HOME_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD NFC_WILD_CARD_TWO_HOME_TEAM_NAME_PPU_ADDR 				                            ; NFC WILD 3  LINE 2
	
	.DB (NFC_WILD_CARD_TWO_AWAY_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD NFC_WILD_CARD_TWO_AWAY_TEAM_NAME_PPU_ADDR				                                ; NFC DIV 3   LINE 3
	
	.DB (NFC_WILD_CARD_ONE_AWAY_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD NFC_WILD_CARD_ONE_AWAY_TEAM_NAME_PPU_ADDR				                                ; NFC WILD 1  LINE 4
	
	.DB (NFC_WILD_CARD_ONE_HOME_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD NFC_WILD_CARD_ONE_HOME_TEAM_NAME_PPU_ADDR 				                            ; NFC WILD 2  LINE 5
	
	.DB (NFC_DIVISIONAL_ONE_HOME_TEAM_ID - PLAYOFF_RESULTS_START[])
	.WORD NFC_DIVISIONAL_ONE_HOME_TEAM_NAME_PPU_ADDR				                            ; NFC DIV 1   LINE 6
	

PLAYOFF_BRACKET_SCORES_PPU_ADDR_TABLE:							                                ; PLAYOFF BRACKET SCORE LOCATIONS
	
																								; SRAM GAME_INDEX, HOME SCORE, AWAY_SCORE
																								
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; WC GAME SCORES
	
	.DB  (AFC_WILD_CARD_TWO_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD AFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR, AFC_WILD_CARD_TWO_AWAY_TEAM_SCORE_PPU_ADDR		                                                                  
	
	.DB  (NFC_WILD_CARD_TWO_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD NFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR, NFC_WILD_CARD_TWO_AWAY_TEAM_SCORE_PPU_ADDR 		                                                                    
	
	.DB  (AFC_WILD_CARD_ONE_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD AFC_WILD_CARD_ONE_HOME_TEAM_SCORE_PPU_ADDR, AFC_WILD_CARD_ONE_AWAY_TEAM_SCORE_PPU_ADDR 		                                                        
	
	.DB (NFC_WILD_CARD_ONE_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD NFC_WILD_CARD_ONE_HOME_TEAM_SCORE_PPU_ADDR, NFC_WILD_CARD_ONE_AWAY_TEAM_SCORE_PPU_ADDR  		                                                                    

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DIV GAME SCORES
	.DB (AFC_DIVISIONAL_TWO_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD AFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR, AFC_DIVISIONAL_TWO_AWAY_TEAM_SCORE_PPU_ADDR                                                
	
	.DB (NFC_DIVISIONAL_TWO_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD NFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR, NFC_DIVISIONAL_TWO_AWAY_TEAM_SCORE_PPU_ADDR
	
	.DB (AFC_DIVISIONAL_ONE_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD AFC_DIVISIONAL_ONE_HOME_TEAM_SCORE_PPU_ADDR, AFC_DIVISIONAL_ONE_AWAY_TEAM_SCORE_PPU_ADDR                                                    
	
	.DB (NFC_DIVISIONAL_ONE_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD NFC_DIVISIONAL_ONE_HOME_TEAM_SCORE_PPU_ADDR, NFC_DIVISIONAL_ONE_AWAY_TEAM_SCORE_PPU_ADDR                                                     

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONF CHAMP SCORES
	.DB (AFC_CHAMP_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD AFC_CHAMP_HOME_TEAM_SCORE_PPU_ADDR, AFC_CHAMP_AWAY_TEAM_SCORE_PPU_ADDR		         
	
	.DB (NFC_CHAMP_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD NFC_CHAMP_HOME_TEAM_SCORE_PPU_ADDR, NFC_CHAMP_AWAY_TEAM_SCORE_PPU_ADDR	                                                                    
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SUPERBOWL SCORE
	.DB (SUPERBOWL_HOME_SCORE - PLAYOFF_RESULTS_START[])
	.WORD SUPERBOWL_AFC_TEAM_SCORE_PPU_ADDR, SUPERBOWL_NFC_TEAM_SCORE_PPU_ADDR			 

PLAYOFF_BRACKET_LINES_PPU_ADDR_TABLE:							                        		; PLAYOFF SCORE HIGHLIGHTING PPU ADDR TABLE
									                                                            ; HOME TEAM WINS, AWAY TEAM WINS
	.WORD AFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR, AFC_WILD_CARD_TWO_AWAY_LINE_PPU_ADDR 			; AFC WC2 HOME , AFC WC2 AWAY 
	.WORD NFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR, NFC_WILD_CARD_TWO_AWAY_LINE_PPU_ADDR			; NFC WC2 HOME , NFC WC2 AWAY
	.WORD AFC_WILD_CARD_ONE_HOME_LINE_PPU_ADDR, AFC_WILD_CARD_ONE_AWAY_LINE_PPU_ADDR			; AFC WC1 HOME , AFC WC1 AWAY 
	.WORD NFC_WILD_CARD_ONE_HOME_LINE_PPU_ADDR,NFC_WILD_CARD_ONE_AWAY_LINE_PPU_ADDR				; NFC WC1 HOME , NFC WC1 AWAY
	
	.WORD AFC_DIVISIONAL_TWO_HOME_LINE_PPU_ADDR, AFC_DIVISIONAL_TWO_AWAY_LINE_PPU_ADDR			; AFC DIV 2 HOME, AFC DIV 2 AWAY
	.WORD NFC_DIVISIONAL_TWO_HOME_LINE_PPU_ADDR, NFC_DIVISIONAL_TWO_AWAY_LINE_PPU_ADDR			; NFC DIV 2 HOME, NFC DIV 2 AWAY
	.WORD AFC_DIVISIONAL_ONE_HOME_LINE_PPU_ADDR, AFC_DIVISIONAL_ONE_AWAY_LINE_PPU_ADDR			; AFC DIV 1 HOME, AFC DIV 1 AWAY
	.WORD NFC_DIVISIONAL_ONE_HOME_LINE_PPU_ADDR, NFC_DIVISIONAL_ONE_AWAY_LINE_PPU_ADDR			; NFC DIV 1 HOME, NFC DIV 1 AWAY
	
	.WORD AFC_CHAMP_HOME_LINE_PPU_ADDR, AFC_CHAMP_AWAY_LINE_PPU_ADDR				            ; AFC CHAMP HOME, AFC CHAMP AWAY
	.WORD NFC_CHAMP_HOME_LINE_PPU_ADDR, NFC_CHAMP_AWAY_LINE_PPU_ADDR				            ; NFC CHAMP HOME, NFC CHAMP AWAY
	
	.WORD SUPERBOWL_AFC_HOME_LINE_PPU_ADDR, SUPERBOWL_NFC_HOME_LINE_PPU_ADDR					; SB AFC HOME, SB NFC AWAY

_F}_PLAYOFF_BRACKET_BG_DATA_TABLE
	
_F{_DRAW_BG_METATILE																			 ; DONE EXCEPT ADDR REFERENCE

METATILE_TASK_FRAME_DELAY		= $04
METATILE_COMMAND_LENGTH			= $07
DONT_CHANGE_CHR_BANK			= $FF  
MAX_METATILE_TILES_PER_ROW		= $18		                                                    ; 24 rows per screen  
METATILE_START_DATA_ADDR		= $B000 

DRAW_BG_METATILE:							                                                    ; START DRAW 4 X 4 METATILE BLOCK TASK (A= METATILE INDEX)

num_metatile_rows_left			= LOCAL_5
meta_tile_data_index			= LOCAL_6
num_metatile_cols_left			= LOCAL_8

temp_ppu_addr_calc				= LOCAL_8	
save_metatile_rows				= LOCAL_8	
	STA METATILE_INDEX						                                                    ; SAVE METATILE INDEX
	STX $D7									                                                    ; SAVE NAME TABLE
	
	LDA #DRAW_SCRIPT_PROCESSING_BANK	                                                        ; SET TASK 3 $A000 BANK = BANK 24
	STA METATILE_TASK + TASK_BANK_A000		                                                    ;
	LDY #<(DRAW_METATILE_TASK_START-1)		                                                    ; LOAD DRAW 4X4 BLOCK TASK ADDRESS
	LDA #>(DRAW_METATILE_TASK_START-1)		                                                    ;
	LDX #METATILE_TASK						                                                    ; LOAD DRAW 4X4 BLOCK TASK 
	JSR CREATE_TASK							                                                    ; CREATE TASK (X= TASK BANK Y,A= TASK ADDRESS)
	
	LDA #METATILE_TASK_FRAME_DELAY			                                                    ; SET FRAMES TO WAIT =  4 FRAMES
	JSR DELAY_TASK							                                                    ; WAIT (A= # FRAMES)
	
	RTS										                                                    ; RETURN

DRAW_METATILE_TASK_START:					                                                    ; DRAW 4X4 BLOCK TASK
	LDX #METATILE_STACK_INDEX				                                                    ; SET STACK POINTER = DRAWING TASK
	TXS										                                                    ;
	LDA #$00								                                                    ;
	STA CURR_Y_SCROLL						                                                    ;
	STA X_SCROLL_AMOUNT						                                                    ;
	STA X_SCROLL_AMOUNT + 1					                                                    ;
	LDX #METATILE_BACKGROUNDS_BANK			                                                    ; LOAD BANK 3
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	
											                                                    ; SET DATA POINTER
	ASL METATILE_INDEX						                                                    ; 
	LDA #$00								                                                    ;
	ROL										                                                    ;
	TAX										                                                    ;
	LDA METATILE_INDEX						                                                    ;
	CLC										                                                    ;
	ADC #<METATILE_START_DATA_ADDR			                                                    ; + START ADDRESS = $B000
	STA TEMP_METATILE_DATA_ADDR				                                                    ;
	TXA										                                                    ;
	ADC #>METATILE_START_DATA_ADDR			                                                    ;
	STA TEMP_METATILE_DATA_ADDR + 1			                                                    ;
											                                                    ; GET DATA LOCATION
	LDY #$00								                                                    ; POINTER INDEX= 0
	LDA (TEMP_METATILE_DATA_ADDR),Y								                                ; LOAD DATA LOCATION
	TAX										                                                    ;
	INY										                                                    ;
	LDA (TEMP_METATILE_DATA_ADDR),Y								                                ;
	STA TEMP_METATILE_DATA_ADDR + 1									                            ; SET CURRENT DATA LOCATION =  DATA LOCATION 
	STX TEMP_METATILE_DATA_ADDR									                                ;
	LDY #$00								                                                    ; DATA INDEX= 0

@set_bg_chr_bank_one:											                                ; Set CHAR 0000 Bank
	LDA (TEMP_METATILE_DATA_ADDR),Y								                                ; DOES DATA = NO CHANGE
	CMP #DONT_CHANGE_CHR_BANK								                                    ; 
	BEQ @set_bg_chr_bank_two								                                    ; YES->CHECK SET CHAR 0800 BANK
	STA IRQ_0_BG_0000						                                                    ; SET CHR $0000 BANK = DATA
	
@set_bg_chr_bank_two:										                                    ; CHECK SET CHAR 0800 BANK
	INY										                                                    ; DATA INDEX++
	LDA (TEMP_METATILE_DATA_ADDR),Y								                                ;
	CMP #DONT_CHANGE_CHR_BANK								                                    ; DOES CHR BANK CHANGE = FALSE?	
	BEQ @set_data_bank_offset								                                    ; YES-> DO NEXT ROW
	STA IRQ_0_BG_0800						                                                    ; SET CHR $0800 BANK = DATA
	
																								; DO NEXT ROW

@set_data_bank_offset:
	INY															                                ; SET BANK OFFSET = DATA (0, 1)
	LDA (TEMP_METATILE_DATA_ADDR),Y								                                ; 
	STA BG_CHR_BANK_OFFSET						                                                ;

@set_pallete_index	
	INY											                                                ; SET BG PALLETE INDEX = PALLETE INDEX
	LDA (TEMP_METATILE_DATA_ADDR),Y				                                                ; 
	STA BG_PAL_INDEX							                                                ;
	
@set_height_width:	
	INY												                                            ; SET METATILE HEIGHT	
	LDA (TEMP_METATILE_DATA_ADDR),Y					                                            ; 
	STA NUM_METATILE_ROWS							                                            ;
	INY												                                            ; SET METATILE WIDTH
	LDA (TEMP_METATILE_DATA_ADDR),Y					                                            ; 
	STA NUM_METATILE_COLS							                                            ;
	
@set_starting_pos:	
	INY												                                            ; 
	
	LDA (TEMP_METATILE_DATA_ADDR),Y					                                            ; LOAD 4X4 BLOCK STARTING POS VALUE
	AND #$F8										                                            ; CONVERT STARTING POS VALUE TO PPU ADDRESS
	STA TEMP_METATILE_PPU_ADDR						                                            ;
	
	LDA #$02										                                            ;
	STA temp_ppu_addr_calc											                            ;
	
	ASL TEMP_METATILE_PPU_ADDR						                                            ;
	ROL temp_ppu_addr_calc											                            ;
	ASL TEMP_METATILE_PPU_ADDR						                                            ;
	ROL temp_ppu_addr_calc											                            ;
	
	LDA (TEMP_METATILE_DATA_ADDR),Y					                                            ;
	AND #$07										                                            ;
	ORA TEMP_METATILE_PPU_ADDR						                                            ;
	STA TEMP_METATILE_PPU_ADDR						                                            ;
	ASL TEMP_METATILE_PPU_ADDR						                                            ;
	ROL temp_ppu_addr_calc											                            ;
	ASL TEMP_METATILE_PPU_ADDR						                                            ;
	ROL temp_ppu_addr_calc											                           ;
	
@check_mirroring:
	BIT GAME_STATUS									                                            ; DOES GAME MIRRORING = HORIZONTAL
	BVS @horizontal_mirror							                                            ; YES->HORIZONTAL MIRRORING
	
@vertical_mirror:	
	LDA TEMP_METATILE_PPU_ADDR + 1					                                            ; CHECK IF ON SECOND SCREEN
	EOR IRQ_0_NAMETABLE								                                            ;
	AND #$01										                                            ;
	JMP @save_high_byte_ppu										                                ; JUMP->SAVE HIGH BYTE OF PPU ADDR

@horizontal_mirror:									                                            ; HORIZONTAL MIRRORING
	LDA TEMP_METATILE_PPU_ADDR + 1					                                            ;
	EOR CURR_Y_SCROLL + 1							                                            ;
	AND #$01										                                            ;
	ASL												                                            ;
	
@save_high_byte_ppu:												                            ; SAVE HIGH BYTE OF PPU ADDR
	ASL												                                            ;
	ASL												                                            ;
	ORA temp_ppu_addr_calc											                            ;
	STA TEMP_METATILE_PPU_ADDR + 1					                                            ;

@update_data_addr:	
	
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] TEMP_METATILE_DATA_ADDR, METATILE_COMMAND_LENGTH	
	
	
	LDA NUM_METATILE_COLS											                            ; SAVE METATILE WIDTH 
	STA save_metatile_rows											                            ;
	LDA BG_FADE										                                            ; LOAD BG PAL FADE VALUE
	ORA SPR_FADE									                                            ; LOAD SPR PAL FADE VALUE
	BEQ DRAW_METATILES_BG_SPR_ARE_FADED_OUT			                                            ; NOT FADED IN->DRAW METATILES BG AND SPR FADED OUT
	
_WHILE NOT_EQUAL									                                            ; DRAW METATILE COLLUMNS LOOP 
	
	COPY_16_BIT_A[var1_var2] TEMP_METATILE_PPU_ADDR, METATILE_PPU_ADDR
	LDA NUM_METATILE_ROWS							                                            ; SET # OF METATILE ROWS = HEIGHT
	STA num_metatile_rows_left											                        ;
	LDA #$00										                                            ;
	STA meta_tile_data_index											                        ; 

@row_loop:												                                        ; DO NEXT ROW
	JSR UPDATE_METATILE_DATA_ADDR_AND_ATTR_TABLE_ADDR									                                            ; UPDATE METATILE DATA ADDR AND SOFT ATTRIB TABLE ADDR
	RETURN_1_FRAME
	DEC num_metatile_rows_left											                        ; # OF METATILE ROWS LEFT --
	BNE @row_loop										                                        ; ROWS DONE? NO->DO NEXT ROW
	JSR UPDATE_TEMP_METATILE_DATA_ADDR_PPU_ADDR		                                            ; UPDATE METATILE DATA ADDR AND PPU ADDR()
	DEC num_metatile_cols_left											                                            ; # OF COLLUMNS LEFT --

_END_WHILE											                                            ; NOT DONE->DRAW METATILE COLLUMNS LOOP
	
@end:	
	JMP CLEAR_TEMP_METATILE_DATA_ADDR_AND_END_TASK								                ; JUMP-> CLEAR DATA ADDR AND END TASK

DRAW_METATILES_BG_SPR_ARE_FADED_OUT:				                                            ; DRAW METATILES BG AND SPR FADED OUT

number_of_metatile_rows_left	= LOCAL_5
number_of_metatile_tiles_left	= LOCAL_7
number_of_metatile_cols_left 	= LOCAL_8

	SUSPEND_TASK_DIRECT[task] DRAW_SCRIPT_TASK 
	JSR DISABLE_INTERRUPTS_RENDERING		                                                    ; DISABLE NMI, SPRITES, BACKGROUND()
	LDA #MAX_METATILE_TILES_PER_ROW		                                                        ; SET MAX # OF 4x4 METATILES ROWS PER SCREEN = 24
	STA number_of_metatile_tiles_left									                                                    ;

_WHILE NOT_EQUAL										                                        ; DRAW METATILES BG AND SPR FADED OUT LOOP
	
	COPY_16_BIT_A[var1_var2] TEMP_METATILE_PPU_ADDR, METATILE_PPU_ADDR
	
	LDA NUM_METATILE_ROWS					                                                    ; SAVE # OF METATILE ROWS = HEIGHT
	STA number_of_metatile_rows_left									                        ;
	LDA #$00								                                                    ; SET CURRENT BLOCK = FIRST BLOCK 
	STA meta_tile_data_index									                                ;

@do_row_loop:										                                                    ; DO NEXT METATILE ROW
	JSR UPDATE_METATILE_DATA_ADDR_AND_ATTR_TABLE_ADDR							                ; UPDATE METATILE DATA ADDR AND SOFT ATTRIB TABLE ADDR()
	JSR SWAP_8000_DRAW_METATILE_RETURN		                                                    ; SAVE $8000 BANK AND DO DRAW METATILE() BANK 23 THEN RETURN
	DEC number_of_metatile_tiles_left									                        ; MAX # OF 4x4 METATILES PER ROW COUNTER =  0
	BNE @row_done								                                                    ; NO->
	
	LDA number_of_metatile_cols_left	                                                    ; SAVE # OF METATILE COLLUMNS
	PHA										                                                    ;
	LDA #SOUND_ENGINE_BANK 					                                                    ; SET BANK = BANK 28
	LOAD_ADDR_XY[mem_loc] SOUND_ENGINE_START
	JSR SWAP_8000_BANK_AND_JUMP_RETURN		                                                    ; SWAP $8000 BANK AND JUMP(A= BANK TO SWAP TO)
	
	LDX #METATILE_BACKGROUNDS_BANK 		                                                        ; LOAD BANK 3
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	PLA										                                                    ; RESTORE # OF METATILE COLLUMNS
	STA number_of_metatile_cols_left	                                                    ;
	LDA #MAX_METATILE_TILES_PER_ROW		                                                        ; RESET MAX NUMBER OF 4x4 METATILES PER ROW
	STA number_of_metatile_tiles_left									                        ;

@row_done:									                                                    ; DO NEXT ROW AND CHECK IF DONE WITH ROWS AND COLLUMNS
	DEC number_of_metatile_rows_left									                        ; # OF METATILE ROWS--
	BNE @do_row_loop								                                            ; DONE? NO->DO NEXT ROW
	
	JSR UPDATE_TEMP_METATILE_DATA_ADDR_PPU_ADDR					                                ; UPDATE METATILE DATA ADDR AND PPU ADDR()	
	DEC number_of_metatile_cols_left									                                                    ; # OF METATILE COLLUMNS--

_END_WHILE								                                                        ; DONE? NO->DRAW METATILES BG AND SPR FADED OUT LOOP
	
@draw_done: 	
	JSR UPDATE_PPUCTRL						                                                    ; ENABLE NMI()	
	LDX #DRAW_SCRIPT_TASK					                                                    ; SET TASK INDEX = TASK 2		
	JSR RESUME_TASK							                                                    ; RESUME TASK (X= TASK INDEX)
	
CLEAR_TEMP_METATILE_DATA_ADDR_AND_END_TASK:											            ; CLEAR DATA ADDR AND END TASK
	LDA #$00										                                            ; CLEAR CURRENT DATA ADDR
	STA TEMP_METATILE_DATA_ADDR						                                            ;
	STA TEMP_METATILE_DATA_ADDR + 1					                                            ;
	JMP END_CURRENT_TASK							                                            ; END TASK()

UPDATE_METATILE_DATA_ADDR_AND_ATTR_TABLE_ADDR:										            ; UPDATE METATILE DATA ADDRESS AND SOFT ATTRIB TABLE ADDR

	LDX #METATILE_BACKGROUNDS_BANK 				                                                ; LOAD BANK 3
	JSR SWAP_A000_BANK							                                                ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)

	LDA #$00									                                                ; SET METATILE DATA ADDRESS LOW BYTE = 0X00 
	STA METATILE_ADDR+1							                                                ;

	
	LDY meta_tile_data_index										                            ; = (16 TILES x METATILE INDEX) 
	LDA (TEMP_METATILE_DATA_ADDR),Y				                                                ;
	
	STA METATILE_ADDR							                                                ;
	ASL											                                                ;
	ROL METATILE_ADDR+1							                                                ;
	ASL											                                                ;
	ROL METATILE_ADDR+1							                                                ;
	ASL											                                                ;
	ROL METATILE_ADDR+1							                                                ;
	ASL											                                                ;
	ROL METATILE_ADDR+1							                                                ;
	CLC											                                                ;
	ADC METATILE_ADDR							                                                ;
	STA METATILE_ADDR							                                                ;
	LDA METATILE_ADDR+1							                                                ;
	ADC #$00									                                                ;
	STA METATILE_ADDR+1							                                                ;
	LDA BG_CHR_BANK_OFFSET						                                                ; IS BANK OFFSET = 1
	LSR											                                                ;
	BCS @set_base_address_to_B000				                                                ; YES->SET BASE ADDRESS AS $B000 AND ADD TO OFFSET
	
@set_base_address_to_A000
	LDA METATILE_ADDR							                                                ; = OFFSET + BASE ADDRESS ($A000)
	CLC											                                                ;
	ADC #<$A000									                                                ;
	STA METATILE_ADDR							                                                ;
	LDA METATILE_ADDR+1							                                                ;
	ADC #>$A000									                                                ;			
	STA METATILE_ADDR+1							                                                ;
	JMP @set_attribute_table_addr				                                                ;
	
@set_base_address_to_B000:						                                                ; SET BASE ADDRESS AS $B000 AND ADD TO OFFSET
	LDA METATILE_ADDR							                                                ; = OFFSET + BASE ADDRESS ($B000)
	CLC											                                                ;
	ADC #<$B000									                                                ;
	STA METATILE_ADDR							                                                ;
	LDA METATILE_ADDR+1							                                                ;
	ADC #>$B000									                                                ;
	STA METATILE_ADDR+1							                                                ;
	
@set_attribute_table_addr:						                                                ; SET ATTRIBUTE TABLE ADDRESS
	LDA METATILE_PPU_ADDR						                                                ; SET ATTRIBUTE TABLE ADDRESS = ADDR THAT CORRESPONDS TO CURRENT PPU 4X4 BLOCK
	AND #$9C									                                                ;
	LSR											                                                ;
	LSR											                                                ;
	STA ATTRIBUTE_ADDR							                                                ;
	AND #$20									                                                ;
	LSR											                                                ;
	LSR											                                                ;
	ORA ATTRIBUTE_ADDR							                                                ;
	AND #$0F									                                                ;			
	STA ATTRIBUTE_ADDR							                                                ;
	LDA METATILE_PPU_ADDR + 1					                                                ;
	ASL											                                                ;
	ASL											                                                ;
	ASL											                                                ;
	ASL											                                                ;
	AND #$30									                                                ;
	CLC											                                                ;
	ADC #$C0									                                                ;
	ORA ATTRIBUTE_ADDR							                                                ;
	STA ATTRIBUTE_ADDR							                                                ;
	
	
	LDA METATILE_PPU_ADDR + 1					                                                ;
	AND #$FC									                                                ;
	ADC #$03									                                                ;
	STA ATTRIBUTE_ADDR + 1						                                                ; 
	LDA #$04									                                                ; SET META-TILE TILE HEIGHT = 4 TILES
	STA METATILE_HEIGHT							                                                ; 
	LDA BG_CHR_BANK_OFFSET						                                                ; LOAD METATILE BANK OFFSET
	LSR											                                                ;
	AND #$01									                                                ;
	CLC											                                                ;
	ADC #METATILE_TILES_1_BANK					                                                ; 
	STA METATILE_BANK						  	                                                ; SET METATILE BANK = BANK 10 OR BANK 11
	LDA meta_tile_data_index										                            ; CURRENT BLOCK INDEX + METATILE WIDTH = SET TO NEXT ROW
	CLC											                                                ;
	ADC NUM_METATILE_COLS										                                ;
	STA meta_tile_data_index										                            ; 
	RTS											                                                ; RETURN
	
	

UPDATE_TEMP_METATILE_DATA_ADDR_PPU_ADDR:			                                            ; UPDATE METATILE DATA ADDR AND PPU ADDR	
	INC TEMP_METATILE_DATA_ADDR						                                            ; DATA ADDR++
	BNE @update_metatile_ppu_addr					                                            ;
	INC TEMP_METATILE_DATA_ADDR + 1					                                            ;

@update_metatile_ppu_addr:							                                            ; UPDATE PPU ADDR
    LDA TEMP_METATILE_PPU_ADDR						                                            ; SET PPU ADDR += 4 TILES
	CLC												                                            ;
	ADC #$04										                                            ;
	STA TEMP_METATILE_PPU_ADDR						                                            ;
	AND #$20										                                            ;

@check_for_move_down_row	
	BEQ @exit										                                            ;

@updated_high_byte_name_table_if_needed
	LDA TEMP_METATILE_PPU_ADDR						                                            ;
	AND #$DF										                                            ;
	STA TEMP_METATILE_PPU_ADDR						                                            ;
	LDA TEMP_METATILE_PPU_ADDR + 1					                                            ; SET PPU ADDR TO NEXT NAMETABLE
	EOR #$04										                                            ;
	STA TEMP_METATILE_PPU_ADDR + 1					                                            ;

@exit:												                                            ;
	RTS												                                            ; RETURN

_F}_DRAW_BG_METATILE

_F{_SCROLL_BG_FUNCTIONS																			; DONE

SET_SCROLL_SPEEDS_AND_START_SCROLL_TASK:							                            ; DO SCROLL (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	LDA Y_SCROLL_PER_FRAME							                                            ; ARE Y,X SCROLL SPEEDS = ZERO?
	ORA X_SCROLL_PER_FRAME							                                            ;
	BEQ @set_scroll_speeds						                                                ; YES-> SET SCROLL SPEEDS
	RETURN_1_FRAME
	JMP SCROLLING_TASK_START					                                                 ; JUMP->SCROLLING TASK

@set_scroll_speeds:							                                                    ; SET SCROLL SPEEDS
	
@set_y_scroll_speed:	
	LDY #$01						                                                            ;
	LDA #$00						                                                            ;
	SEC							                                                                ;
	SBC (CURR_BG_SCRIPT_ADDR),Y						                                            ;  
	STA Y_SCROLL_PER_FRAME						                                                ; SET Y SCROLL SPEED =  1 - DATA VALUE

@set_x_scroll_speed:	
	INY							                                                                ;
	LDA #$00						                                                            ;
	SEC							                                                                ;
	SBC (CURR_BG_SCRIPT_ADDR),Y						                                            ;
	STA X_SCROLL_PER_FRAME						                                                                ;

@set_frames_to_scroll:	
	INY							                                                                ; SET X SCROLL SPEED =  1 - DATA VALUE
	LDA #$00						                                                            ; CLEAR SCROLL TIMER HIGH BYTE
	STA NUM_FRAMES_TO_SCROLL + 1						                                        ;
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; SCROLL FRAMES = 8 TIMES DATA VALUE
	ASL							                                                                ;
	ROL NUM_FRAMES_TO_SCROLL + 1						                                        ;
	ASL							                                                                ;
	ROL NUM_FRAMES_TO_SCROLL + 1						                                        ;
	ASL							                                                                ;
	ROL NUM_FRAMES_TO_SCROLL + 1						                                        ;
	STA NUM_FRAMES_TO_SCROLL						                                            ;
	
@clear_scroll_speed_change:	
	LDA #$00						                                                            ; 
	STA Y_SCROLL_INC_PER_FRAME						                                            ; SET Y SCROLL SPEED INCREASE PER FRAME = ZERO
	STA X_SCROLL_INC_PER_FRAME						                                            ; SET X SCROLL SPEED INCREASE PER FRAME = ZERO
	
	LDA #DRAW_SCRIPT_PROCESSING_BANK						                                    ; SET TASK 3 BANK = BANK 24
	STA (SCROLL_TASK + TASK_BANK)						                                                                ; 
	LDY #<(SCROLLING_TASK_START-1)				                                                ; SET TASK ADDR = SCROLLING TASK
	LDA #>(SCROLLING_TASK_START-1)				                                                ; 
	LDX #SCROLL_TASK						                                                    ; SET TASK INDEX = TASK 3
	JSR CREATE_TASK						                                                        ; CREATE TASK (X= TASK INDEX, Y,A= TASK ADDRESS)
	RTS							                                                                ; RETURN

SCROLLING_TASK_START:							                                                ; SCROLLING TASK

y_sub_pixel_dist			= LOCAL_1
x_sub_pixel_dist			= LOCAL_2	

y_scroll_speed_increase		= LOCAL_3
x_scroll_speed_increase		= LOCAL_4

scroll_distance				= LOCAL_5
y_scroll_distance			= LOCAL_5
x_scroll_distance			= LOCAL_6

scroll_value = LOCAL_8
scroll_speed = LOCAL_7

	LDX #SCROLLING_STACK_INDEX						                                            ; SET TASK STACK = DRAWING STACK
	TXS								                                                            ;
	
@clear_vars:	
	LDA #$00						                                                            ; 
	STA y_sub_pixel_dist							                                            ; SET SUBPIXEL Y DISTANCE = 0
	STA x_sub_pixel_dist							                                            ; SET SUBPIXEL X DISTANCE = 0
	STA y_scroll_speed_increase							                                        ; SET Y SCROLL SPEED INCREASE SUB PIXEL = 0
	STA x_scroll_speed_increase								                                    ; SET X SCROLL SPEED INCREASE SUB PIXEL = 0

_WHILE ALWAYS								                                                    ; SCROLL LOOP
	RETURN_1_FRAME
	
	
@update_y_scroll_speed	
	LDA Y_SCROLL_INC_PER_FRAME							                                        ; LOAD Y SCROLL SPEED INCREASE PER FRAME
	JSR MULTIPLY_SCROLL_VALUE_BY_8_SIGNED					                                    ; 
	LDA scroll_speed							                                                ;
	CLC								                                                            ;
	ADC y_scroll_speed_increase							                                        ;
	STA y_scroll_speed_increase							                                        ;
	LDA scroll_speed + 1							                                             ;
	ADC Y_SCROLL_PER_FRAME							                                            ;
	STA Y_SCROLL_PER_FRAME							                                            ; Y SCROLL SPEED = Y SCROLL SPEED + AMOUNT TO INCREASE (MAX= +/- 0X04)

@update_x_scroll_speed		
	LDA X_SCROLL_INC_PER_FRAME							                                        ; LOAD X SCROLL SPEED INCREASE PER FRAME
	JSR MULTIPLY_SCROLL_VALUE_BY_8_SIGNED					                                    ; 
	LDA scroll_speed						                                                    ;
	CLC								                                                            ;
	ADC x_scroll_speed_increase							                                        ;
	STA x_scroll_speed_increase							                                        ;
	LDA scroll_speed + 1							                                            ;
	ADC X_SCROLL_PER_FRAME							                                            ;
	STA X_SCROLL_PER_FRAME							                                            ; X SCROLL SPEED = X SCROLL SPEED + AMOUNT TO INCREASE (MAX= +/- 0X04)


@set_distances: 	
	LDA CURR_Y_SCROLL						                                                    ;
	STA y_scroll_distance						                                                ; SET TEMP Y = Y SCROLL  
	LDA IRQ_0_XSCROLL						                                                    ; 
	STA x_scroll_distance						                                                ; SET TEMP X SCROLL = IRQO X SCROLL  
	
    LDA Y_SCROLL_PER_FRAME						                                                ; LOAD Y SCROLL SPEED
	JSR MULTIPLY_SCROLL_VALUE_BY_16_SIGNED					                                    ; CONVERT SCROLL SPEED TO 16 BIT VALUE(A= SPEED)
	LDA scroll_speed						                                                    ; SUBPIXEL Y DISTANCE += SUBPIXEL Y SPEED/FRAME 
	CLC							                                                                ;
	ADC y_sub_pixel_dist					                                                    ; 
	STA y_sub_pixel_dist						                                                ;
	LDA scroll_speed + 1						                                                ; 
	BMI @scrolling_down						                                                    ; IS SCREEN SCROLLING DOWN? YES->SCREEN SCROLLING DOWN
	
	ADC CURR_Y_SCROLL						                                                    ; = Y SCROLL + SCROLL DISTANCE 
	CMP #$F0						                                                            ; IS SCROLL =  ONSCREEN?
	BCC @save_y_scroll_loc						                                                ; YES-> SAVE Y SCROLL LOW BYTE AND UPDATE X SCROLL
	ADC #$0F						                                                            ; SET TO START OF BOTTOMSCREEN
	INC CURR_Y_SCROLL + 1						                                                ;
	JMP @save_y_scroll_loc						                                                ; JUMP->SAVE Y SCROLL LOW BYTE AND UPDATE X SCROLL 

@scrolling_down:							                                                    ; SCREEN SCROLLING DOWN
    ADC CURR_Y_SCROLL						                                                    ; = Y SCROLL + SCROLL DISTANCE
	CMP #$F0						                                                            ; IS SCROLL =  ONSCREEN?
	BCC @save_y_scroll_loc						                                                            ; YES-> SAVE Y SCROLL LOW BYTE AND UPDATE X SCROLL
	SBC #$10						                                                            ; SET TO START OF BOTTOM SCREEN
	DEC CURR_Y_SCROLL + 1						                                                ;

@save_y_scroll_loc:							                                                     ; SAVE Y SCROLL LOW BYTE AND UPDATE X SCROLL 
	STA CURR_Y_SCROLL 						                                                    ; SAVE Y SCROLL LOW
	
	
	LDA X_SCROLL_PER_FRAME						                                                ; LOAD X SCROLL SPEED
	JSR MULTIPLY_SCROLL_VALUE_BY_16_SIGNED					                                    ; CONVERT SCROLL SPEED TO 16 BIT VALUE(A= SPEED)
	LDA GAME_STATUS						                                                        ; DOES GAME STATUS = HORIZONTAL FLIP 
	AND #$20						                                                            ;
	BEQ @Loop4						                                                            ; NO->
	
	NEGATE_16_ZP scroll_speed																	; 1- X SCROLL SPEED


@Loop4:							                                                                ; UPDATE IRQ 0 X SCROLL LOCATION
	LDA scroll_speed						                                                    ; SUBPIXEL X DISTANCE += SUBPIXEL X SPEED/FRAME
	CLC							                                                                ;
	ADC x_sub_pixel_dist						                                                ;
	STA x_sub_pixel_dist						                                                ;
	LDA scroll_speed + 1						                                                ;
	ADC IRQ_0_XSCROLL						                                                    ;
	STA IRQ_0_XSCROLL						                                                    ;
	LDA scroll_speed + 1						                                                ;
	AND #$80						                                                            ;
	BPL @set_x_scroll_dist						                                                ; SCROLLING RIGHT? YES-> UPDATE CURRENT X SCROLL HIGH BYTE 
	LDA #$FF						                                                            ;

@set_x_scroll_dist:							                                                    ; UPDATE CURRENT X SCROLL HIGH BYTE
	ADC IRQ_0_NAMETABLE						                                                    ; 
	AND #$01						                                                            ;
	STA IRQ_0_NAMETABLE						                                                    ;
	LDA CURR_Y_SCROLL						                                                    ; Y DIST MOVED = CURRENT_Y_SCROLL - PREVIOUS Y SCROLL
	SEC							                                                                ;
	SBC y_scroll_distance						                                                ;
	STA X_SCROLL_AMOUNT					                                                        ;
	ABS_A

@check_x_distance:							                                                                ; CHECK X DISTANCE MOVED
	STA y_scroll_distance						                                                 ; SAVE Y DIST MOVED
	LDA IRQ_0_XSCROLL						                                                    ; X DIST MOVED = CURRENT_X_SCROLL - PREVIOUS X SCROLL
	SEC							                                                                ;
	SBC x_scroll_distance						                                                ; 
	STA X_SCROLL_AMOUNT + 1						                                                ;
	ABS_A

@compare_y_vs_x:							                                                    ; X >Y SCROLL DISTANCE CHECK 
	CMP y_scroll_distance						                                                 ;
	BCC @update_scroll_distance						                                                            ;
	STA scroll_distance						                                                    ; SAVE LARGER DISTANCE 

@update_scroll_distance:
	SUB_16_BIT_MEM_BY_8BIT_MEM[mem1_mem12] NUM_FRAMES_TO_SCROLL, scroll_distance 
	BCC @exit_scroll						                                                    ; DONE? YES-> XIT SCROLL
	ORA NUM_FRAMES_TO_SCROLL						                                            ;
	BEQ @exit_scroll						                                                    ; YES-> EXIT SCROLL

_END_WHILE						                                                            	; NO->SCROLL LOOP

@exit_scroll:							                                                        ; EXIT SCROLL 
	RETURN_1_FRAME
	LDA #$00						                                                            ;
	STA X_SCROLL_AMOUNT						                                                    ; CLEAR Y DIST MOVED
	STA X_SCROLL_AMOUNT + 1						                                                ; CLEAR X DIST MOVED
	JMP END_CURRENT_TASK						                                                ; JUMP-> END TASK()

MULTIPLY_SCROLL_VALUE_BY_16_SIGNED:							                                    ; SCROLL SPEED VALUE * 16 SIGNED

scroll_value = LOCAL_8
scroll_speed = LOCAL_7

	ASL							                                                                ;
	ROL scroll_value						                                                                ;
	ASL							                                                                ;
	ROL scroll_value						                                                                ;
	ASL							                                                                ;
	ROL scroll_value						                                                                ;
	ASL							                                                                ;
	ROL scroll_value						                                                                ;
	STA scroll_speed						                                                                ;

@check_scroll_direction: 
	LDA scroll_value						                                                                ; SET MAX SPEED INCREASE PER FRAME = -F8  TO +07 
	AND #$0F						                                                            ; 
	CMP #$08						                                                            ;
	BCC @save_speed_lower_byte						                                                            ;
	ORA #$F0						                                                            ;

@save_speed_lower_byte:							                                                                ;
	STA scroll_speed + 1						                                                                ;
	RTS							                                                                ; RETURN

MULTIPLY_SCROLL_VALUE_BY_8_SIGNED:							                                                            ; SCROLL SPEED VALUE * 8 SIGNED
	ASL							                                                                ;
	ROL scroll_value						                                                                ;
	ASL							                                                                ;
	ROL scroll_value						                                                                ;
	ASL							                                                                ;
	ROL scroll_value						                                                                ;
	STA scroll_speed						                                                                ;
	
	LDA scroll_value						                                                                ; SET MAX SPEED INCREASE PER FRAME SIGNED
	AND #$07						                                                            ;
	CMP #$04						                                                            ;
	BCC @save_speed_lower_byte:						                                                            ;
	ORA #$F8						                                                            ;

@save_speed_lower_byte:							                                                                ; EXIT
	STA scroll_speed + 1						                                                                ;
	RTS							                                                                ; RETURN
	
_F}_SCROLL_BG_FUNCTIONS

_F{_INIT_SPRITE_SCRIPTS																			; DONE

SPRITE_SCRIPT_PTR_START_ADDR		= $A000
SIZE_OF_EACH_SPR_SCRIPT_RAM			= $20

current_sprite_script_index			= LOCAL_7
number_of_sprite_scripts			= LOCAL_7
save_A000_bank						= LOCAL_8


INIT_SPRITE_SCRIPTS:									                                        ; #$F9 CTD START DRAW SPRITES WITH DRAW COMMANDS THREAD
	JSR SET_ALL_SPR_OFFSCREEN						                                            ; SET ALL SPRITE Y POSITIONS TO OFFSCREEN ()
													                                            ; CLEAR TEMPORARY DATA ($683-$6E2) since collission data stored here too 
													
	CLEAR_RAM_Y_INDEX[start_length] SPRITE_SCRIPT_RAM_START, $60
	
	LDY #$01										                                            ; LOAD # OF $A000 BANKS
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; *** awkward
	AND #$07										                                            ; COULD HAVE BEEN AND #$03 
	STA number_of_sprite_scripts					                                            ; SAVE # OF SPRITE SCRIPT INDEXES TO TRANSFER
	TAX												                                            ;

_WHILE NOT_EQUAL									                                            ; TRANSFER SPRITE SCRIPT INDEXES TO RAM

	INY												                                            ; DATA ADDR++
	LDA (CURR_BG_SCRIPT_ADDR),Y						                                            ; 
	STA_ABS_X_ZP SPRITE_RAM_INDEX-1										                        ; SAVE SPRITE SCRIPT INDEX IN SPRITE SCRIPT INDEXES *** have to use non zero page
	DEX												                                            ; # OF SPRITE SCRIPT INDEXES TO TRANSFER--

_END_WHILE 										                                                ; DONE? NO-> TRANSFER SPRITE SCRIPT INDEXES TO RAM

@update_bg_script_addr:
	INY												                                            ; DATA ADDRESS = DATA ADDRESS + # OF SPRITE SCRIPT INDEXES TO TRANSFER
	TYA												                                            ;
	CLC												                                            ;
	ADC CURR_BG_SCRIPT_ADDR							                                            ;
	STA CURR_BG_SCRIPT_ADDR							                                            ;
	LDA CURR_BG_SCRIPT_ADDR + 1						                                            ;
	ADC #$00										                                            ;
	STA CURR_BG_SCRIPT_ADDR + 1						                                            ;
	
@save_current_A000_bank:	
	LDA SOFT_A000_BANK								                                            ; SAVE CURRENT $A000 BANK
	STA save_A000_bank								                                            ; 
	
@init_spr_ram_addr:	
	LDA #<SPRITE_SCRIPT_RAM_START					                                            ; SET CB,CC = RAM ADDR = $0683
	STA CURR_SPR_RAM_ADDR 							                                            ;
	LDA #>SPRITE_SCRIPT_RAM_START					                                            ;
	STA CURR_SPR_RAM_ADDR + 1						                                            ;
	
_WHILE NOT_EQUAL									                                            ; GET $A000 BANK TO USE AND SWAP TO IT (BANK 9 OR BANK 10)

	LDX current_sprite_script_index					                                            ; 
	LDA_ABS_X_ZP SPRITE_RAM_INDEX-1						                                        ; LOAD SPRITE SCRIPT INDEX *** could use zp command  Zero Page,X
	ASL												                                            ; SHIFT SINCE EACH ENTRY IS AN ADDR 
	LDA #SPRITE_SCRIPTS_1_BANK						                                            ; SET BANK OFFSET = BANK 9 IF SPRITE INDEX <0X80 
	ADC #$00										                                            ; ELSE SET BANK OFFSET = BANK 10 IF SPRITE INDEX >=0X80
	TAX												                                            ;
	JSR SWAP_A000_BANK								                                            ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)

													                                            ; SET DATA POINTER ADDRESS ($C9-CA)
    LDX current_sprite_script_index					                                            ; LOAD POINTER OFFSET
	LDA_ABS_X_ZP SPRITE_RAM_INDEX-1						                                        ; LOAD SPRITE SCRIPT INDEX *** could use zp command  Zero Page,X
	ASL												                                            ;
	CLC												                                            ;
	ADC #<SPRITE_SCRIPT_PTR_START_ADDR				                                            ; DATA PTR = $A000 + POINTER OFFSET
	STA CURR_SPR_SCRIPT_ADDR						                                            ;
	LDA #>SPRITE_SCRIPT_PTR_START_ADDR				                                            ;
	ADC #$00										                                            ;
	STA CURR_SPR_SCRIPT_ADDR + 1					                                            ;
													                                            ; SET DATA ADDRESS FROM DATA POINTER
	LDY #$00										                                            ; SAVE DATA PTR = ADDR AT PTR
	LDA (CURR_SPR_SCRIPT_ADDR),Y					                                            ;
	TAX												                                            ;				
	INY												                                            ;
	LDA (CURR_SPR_SCRIPT_ADDR),Y					                                            ;
	STA CURR_SPR_SCRIPT_ADDR + 1					                                            ;
	STX CURR_SPR_SCRIPT_ADDR						                                            ;
	LDX current_sprite_script_index					                                            ;
	LDA_ABS_X_ZP SPRITE_RAM_INDEX-1											                    ; LOAD SPRITE SCRIPT INDEX *** could use zp command  Zero Page,X
	ROL												                                            ;
	
@save_mirroring_bank_offset_in_spr_ram:	
	LDA GAME_STATUS									                                            ; SET GAME STATUS MIRRORING = HORIZONTAL
	ORA #$40										                                            ;
	AND #$60										                                            ; SAVE MIRRORING AND CUTSCENE SIDE
	ROL												                                            ;
	LDY #$00										                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SAVE MIRRORING INFO + BANK OFFSET AT $683
	
@save_frames_to_scroll:	
	INY												                                            ;
	LDA #$01										                                            ; SAVE # OF FRAMES TO SCROLL
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; 

@update_spr_script_data_addr:		
	LDY #$02										                                            ; UPDATE CURRENT SPR DATA ADDR
	LDA CURR_SPR_SCRIPT_ADDR						                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	INY												                                            ; 
	LDA CURR_SPR_SCRIPT_ADDR + 1					                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	
@set_spr_ram_tonext_spr_ram_structure:	
    ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] CURR_SPR_RAM_ADDR, SIZE_OF_EACH_SPR_SCRIPT_RAM

	DEC number_of_sprite_scripts					                                            ; ALL SPRITE SCRIPT INDEXES TRANSFER? 
	
_END_WHILE 											                                            ; NO->GET $A000 BANK TO USE AND SWAP TO IT (BANK 9 OR BANK 10)
	

@start_draw_sprites_thread_restore_bank: 	
	LDA #DRAW_SCRIPT_PROCESSING_BANK				                                            ; SET TASK 4 BANK = BANK 24
	STA (DRAWING_TASK + TASK_BANK_A000)				                                            ; 
	LDY #<(DRAW_SPRITES_FROM_SCRIPT-1)				                                            ; SET ADDR = DRAW SPRITES FROM DRAW COMMANDS THREAD 
	LDA #>(DRAW_SPRITES_FROM_SCRIPT-1)				                                            ;
	LDX #DRAWING_TASK								                                            ; SET TASK INDEX = TASK 4 
	JSR CREATE_TASK									                                            ; CREATE TASK( A= TASK INDEX)
	LDX save_A000_bank							                                                ; LOAD PREVIOUS $A000 BANK
	JSR SWAP_A000_BANK								                                            ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	RTS												                                            ; RETURN
	
_F}_INIT_SPRITE_SCRIPTS	

_F{_DRAW_SPRITES_FROM_SCRIPT_MAIN_LOOP															; DONE

.ENUM $00
	
	MIRRORING_SPR_SCRIPT_RAM_INDEX								.dsb 0							; uses 0x80 mask
	CUTSCENE_SIDE_SPR_SCRIPT_RAM_INDEX							.dsb 0							; uses 0x40 mask
	SCROLLING_ACTIVE_SPR_SCRIPT_RAM_INDEX						.dsb 0							; uses 0x20 mask
	VERTICAL_FLIP_SPR_SCRIPT_RAM_INDEX							.dsb 0
	SPRITE_PRIORITY_SPR_SCRIPT_RAM_INDEX						.dsb 0							; uses 0x02 mask 
	DATA_BANK_SPR_SCRIPT_RAM_INDEX								.dsb 1							; uses 0x01 mask
	
	
	FRAMES_LEFT_TO_SCROLL_SPR_SCRIPT_RAM_INDEX					.dsb 1
	SPRITE_SCRIPT_ADDR_RAM_INDEX								.dsb 2
	SPRITE_Y_SPEED_INCREASE_SPR_SCRIPT_RAM_INDEX				.dsb 1
	SPRITE_Y_SPEED_SUB_PIXEL_SPR_SCRIPT_RAM_INDEX				.dsb 1
	SPRITE_Y_SPEED_SPR_SCRIPT_RAM_INDEX							.dsb 1
	SPRITE_Y_LOC_SUB_PIXEL_SPR_SCRIPT_RAM_INDEX					.dsb 1
	SPRITE_Y_LOC_SPR_SCRIPT_RAM_INDEX							.dsb 1
	SPRITE_X_SPEED_INCREASE_SPR_SCRIPT_RAM_INDEX				.dsb 1
	SPRITE_X_SPEED_SUB_PIXEL_SPR_SCRIPT_RAM_INDEX				.dsb 1
	SPRITE_X_SPEED_SPR_SCRIPT_RAM_INDEX							.dsb 1
	SPRITE_X_LOC_SUB_PIXEL_SPR_SCRIPT_RAM_INDEX					.dsb 1
	SPRITE_X_LOC_SPR_SCRIPT_RAM_INDEX							.dsb 1
	SPRITE_NAMETABLE_SPR_SCRIPT_RAM_INDEX						.dsb 1							; 0 = onscreen
	SPRITE_TILE_ATTR_ADDR_SPR_SCRIPT_RAM_INDEX					.dsb 2                          ; 0x0F 
	SPRITE_Y_OFFSET_SPR_SCRIPT_RAM_INDEX						.dsb 1
	SPRITE_X_OFFSET_SPR_SCRIPT_RAM_INDEX						.dsb 1
	SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX					.dsb 1
	SPRITE_ANI_NUM_LOOPS_SPR_SCRIPT_RAM_INDEX					.dsb 0
	SPRITE_ANI_ONE_NUM_LOOPS_SPR_SCRIPT_RAM_INDEX				.dsb 1
	SPRITE_ANI_TWO_NUM_LOOPS_SPR_SCRIPT_RAM_INDEX				.dsb 1
	SPRITE_ANI_THREE_NUM_LOOPS_SPR_SCRIPT_RAM_INDEX				.dsb 1
	SPRITE_ANI_FOUR_NUM_LOOPS_SPR_SCRIPT_RAM_INDEX				.dsb 1
	RETURN_ADDRESSES_SPR_SCRIPT_RAM_INDEX						.dsb 0
.ENDE 


DRAW_SPRITES_FROM_SCRIPT:			                                                            ; DRAW SPRITES FROM DRAW COMMANDS THREAD 
	SET_STACK[loc] DRAW_SPRITE_CUTSCENE_STACK_INDEX
	
@init_variables:	
	LDA #$00						                                                            ; 
	STA NUM_SPLIT_SCREENS			                                                            ; SET NUMBER OF SPLIT SCREENS = 0
	STA SPRITE_SIZE					                                                            ; SET SPR SIZE + SPR # = 8X8 AND FIRST SPR
	STA SPR_SCRIPT_TOP_OF_SCREEN_THRESHOLD							                            ; SET TOP OF SCREEN THRESHOLD = TOP OF SCREEN
	LDA #$FF						                                                            ;
	STA SPR_SCRIPT_BOTTOM_OF_SCREEN_THRESHOLD							                         ; SET BOTTOM OF SCREEN THRESHOLD = BOTTOM OF SCREEN
	SET_SOFT_SPRITE_8_BY_8[]																	; SET SOFT PPU CTRL = SET SPRITE SIZE TO 8X8 


PROCESS_SPR_SCRIPT_MAIN_LOOP: 
	
@Loop1:								                                                            ; PROCESS SPRITE DATA AND COMMANDS LOOP
	RETURN_1_FRAME
	LDA #$00						                                                            ; SET SPRITE INDEX = FIRST SPRITE
	STA SPRITE_SCRIPT_SPRITE_INDEX							                                    ; 
	LDA NUM_SPLIT_SCREENS			                                                            ;
	AND #$F0						                                                            ;					
	BNE @add_irq_counters						                                                ;
	
	
	LDA SPR_SCRIPT_TOP_OF_SCREEN_THRESHOLD							                            ; DOES TOP OF SCREEN THRESHOLD = TOP OF SCREEN
	BEQ @check_number_of_splits:						                                        ; YES-> (WILL GO HERE ON FIRST RUN THROUGH)	
	
	CMP #$FC						                                                            ; IS TOP OF SCREEN THRESHOLD WITHIN 4 PIXELS OF BOTTOM OF SCREEN?
	BCC @hide_sprites						                                                    ; NO->
	
	
	AND #$03						                                                            ;
	SHIFT_LEFT_4
	ORA NUM_SPLIT_SCREENS							                                            ;
	STA NUM_SPLIT_SCREENS							                                            ;

@add_irq_counters:								                                				; SET NUMBER OF IRQ COUNTERS TO ADD
	LOG_SHIFT_RIGHT_4
	JSR ADD_IRQ_COUNTERS			                                                            ; ADD IRQ COUNTERS (A=COUNTERS TO ADD 1,2 OR 3)
	SEC								                                                            ;
	SBC #$08						                                                            ;
	BIT SPRITE_SIZE					                                                            ; IS SPRITE SIZE TEMP = 8X8
	BPL @save_top_of_screen_threshold						                                    ; YES->
	
@subtract_for_8_by_16_spr:	
	SEC								                                                            ;	
	SBC #$08						                                                            ;

@save_top_of_screen_threshold:								                                    ; SET TOP OF SCREEN THRESHOLD
	STA SPR_SCRIPT_TOP_OF_SCREEN_THRESHOLD							                            ; SET TOP OF SCREEN THRESHOLD

@hide_sprites:								                                                    ; 
	JSR USE_SPRITE_OVERFLOW_TO_HIDE_SPRITES_ON_LINE					                            ; SET 8 SPRITES TO LEFT EDGE SET TO BLANK TILE(A= Y POS)

@check_number_of_splits:								                                        ; 
	LDA NUM_SPLIT_SCREENS			                                                            ;
	AND #$0F						                                                            ;
	BNE @calculate_bottom_of_screen						                                        ; YES->CALCULATE Y POS FROM ALL IRQ COUNTERS
	
	LDA SPR_SCRIPT_BOTTOM_OF_SCREEN_THRESHOLD							                        ; DOES BOTTOM OF SCREEN THRESHOLD = BOTTOM OF SCREEN
	CMP #$FF						                                                            ;
	BEQ @init_sprite_script_ram_addr_and_counter						                        ; YES->SET RAM ADDR TO $683 AND PROCESS DATA
	
@check_for_hide_sprites:	
	CMP #$04						                                                            ; 
	BCS @hide_sprites_by_using_overflow						                                    ; YES->SET 8 SPRITES TO LEFT EDGE SET TO BLANK TILE(A= Y POS, CE= SPR INDEX)
	
@else_save_num_splits	
	AND #$03						                                                            ; SAVE NUMBER OF SPLIT SCREENS
	ORA NUM_SPLIT_SCREENS			                                                            ;
	STA NUM_SPLIT_SCREENS			                                                            ; 

@calculate_bottom_of_screen:								                                    ; CALCULATE Y POS FROM ALL IRQ COUNTERS (A= # OF COUNTERS TO ADD)
	LDX #$00						                                                            ; SET SCANLINE /YPOS = ZERO
	JSR ADD_IRQ_COUNTERS			                                                            ; ADD IRQ COUNTERS (A=IRQ COUNTERS TO ADD 1,2 OR 3)
	STA SPR_SCRIPT_BOTTOM_OF_SCREEN_THRESHOLD							                        ; SAVE BOTTOM OF SCREEN THRESHOLD

@hide_sprites_by_using_overflow:								                                ; SET 8 SPRITES TO LEFT EDGE SET TO BLANK TILE(A= Y POS, CE= SPR INDEX)
	JSR USE_SPRITE_OVERFLOW_TO_HIDE_SPRITES_ON_LINE					                            ; SET 8 SPRITES TO LEFT EDGE SET TO BLANK TILE(A= Y POS, CE= SPR INDEX)

@init_sprite_script_ram_addr_and_counter:							                                         ; SET RAM ADDR TO $683 AND PROCESS DATA
	LDA #<SPRITE_SCRIPT_RAM_START	                                                            ; SET ADDR = $0683 = SPR SCRIPT RAM START
	STA CURR_SPR_RAM_ADDR 			                                                            ; 
	LDA #>SPRITE_SCRIPT_RAM_START	                                                            ;
	STA CURR_SPR_RAM_ADDR + 1		                                                            ;
	LDA #$03						                                                            ; SET NUMBER OF TIMES TO RUN THROUGH LOOP = 3 = MAX NUMBER OF SPLIT SCREENS
	STA SPRITE_SCRIPT_COUNTER						                                            ;

CHECK_SPRITE_SCROLLING_ACTIVE:							                                        ; SPR_RAM LOOP 
	LDY #SCROLLING_ACTIVE_SPR_SCRIPT_RAM_INDEX							                        ; IS SCROLLING ACTIVE
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	BMI @process_sprite_script_data						                                        ; YES-> PROCESS SPRITE DATA LOOP
	
@else	
	JMP GO_TO_NEXT_SPR_SCRIPT_RAM_CHECK_IF_DONE						                            ; JUMP-> GO TO NEXT DATA SET AND CHECK IF DONE

@process_sprite_script_data:							                                        ; PROCESS SPRITE DATA LOOP
	
@check_if_any_scrolling_left: 	
	LDY #FRAMES_LEFT_TO_SCROLL_SPR_SCRIPT_RAM_INDEX						                        ; # FRAMES LEFT TO SCROLL --
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	SEC							                                                                ;
	SBC #$01						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	BEQ @set_script_data_bank						                                            ; FRAMES LEFT TO SCROLL == 0 ? YES->SET $A000 BANK TO SWAP TO 0X08 OR 0X09
	JMP UPDATE_SPR_SCRIPT_SCROLLING						                                        ; NO->DO SPR SCROLL UPDATE IF NEEDED

@set_script_data_bank:							                                                ; SET $A000 BANK TO SWAP TO 0X08 OR 0X09
	LDY #DATA_BANK_SPR_SCRIPT_RAM_INDEX						                                    ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ; $A000 BANK = #$08 + LOWEST BIT OF RAM VALUE
	LSR							                                                                ;
	LDA #SPRITE_SCRIPTS_1_BANK						                                            ;
	ADC #$00						                                                            ;
	TAX							                                                                ; 
	JSR SWAP_A000_BANK						                                                    ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)

@set_script_data_addr:	
	LDY #SPRITE_SCRIPT_ADDR_RAM_INDEX						                                    ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ; SET DATA ADDR = RAM ADDR
	STA CURR_SPR_SCRIPT_ADDR						                                            ; 
	INY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA CURR_SPR_SCRIPT_ADDR + 1						                                        ;

PROCESS_SPRITE_SCRIPT_DATA_LOOP:							                                    ; PROCESS SPRITE SCRIPT LOOP

command_value	= LOCAL_2

	LDY #$00						                                                            ; IS DATA VALUE = COMMAND = >0X80?
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	BMI @process_sprite_script_command						                                    ; YES->PROCESS SPRITE COMMAND LOOP

@set_frames_to_scroll_sprite_script:	
	INY							                                                                ;
	ASL							                                                                ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SET # FRAMES LEFT TO SCROLL = 2 * DATA 
	LDA CURR_SPR_SCRIPT_ADDR						                                            ; RAM DATA ADDR++ 
	CLC							                                                                ;
	ADC #$01						                                                            ;
	LDY #$02						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	INY							                                                                ;
	LDA CURR_SPR_SCRIPT_ADDR + 1						                                        ;
	ADC #$00						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	JMP UPDATE_SPR_SCRIPT_SCROLLING						                                        ; JUMP->DO SPR SCROLL UPDATE IF NEEDED

@process_sprite_script_command:							                                        ; PROCESS SPRITE COMMAND LOOP
	CMP #$F0						                                                            ; IS COMMAND BETWEEN 0XF0-0XFF
	BCC @check_for_other_commands						                                        ; NO->CHECK FOR OTHER SPR COMMANDS
	JMP @do_special_sprite_commands					                                            ; JUMP-> 0XF0-0XFF COMMANDS

@check_for_other_commands:							                                            ; CHECK FOR OTHER SPR COMMANDS
	
	CMP #$E0						                                                            ; IS COMMAND E0-EF?
	BCS @do_looping_sprite_data						                                            ; YES->0XE0-EF SAVE RETURN ADDRESS AND # OF TIMES TO LOOP( ) MIN OF 4 LOOPS
	
	CMP #$C0						                                                            ; IS COMMAND C0-DF?
	BCS @do_sprite_data_routine					                                                ; YES->C0-DF JUMP TO ADDRESS AND RETURN()
	
	CMP #$A0						                                                            ; IS COMMAND A0-BF?
	BCS @jump_to_new_sprite_data_addr						                                    ; YES->A0-BF JUMP TO NEW ADDRESS(ARG = LOW BYTE)

								                                                                ; 0X80-0X9F SET NEW SPR TILE DATA ADDR 
	CLC							                                                                ; SET SPR DATA ADDR HIGH =(COMMAND VALUE +0X20) 
	ADC #$20						                                                            ; 
	LDY #$10						                                                            ; 
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDY #$01						                                                            ; SET SPR DATA ADDR LOW =(COMMAND VALUE ARG)
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	LDY #$0F						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

@jump_to_new_sprite_data_addr:							                                        ; A0-BF JUMP TO NEW ADDRESS(ARG = LOW BYTE)
	TAX							                                                                ; SET SPR SCRIPT ADR = DATA VALUE
	LDY #$01						                                                            ;
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	STA CURR_SPR_SCRIPT_ADDR						                                            ;
	STX CURR_SPR_SCRIPT_ADDR + 1						                                        ;
	JMP PROCESS_SPRITE_SCRIPT_DATA_LOOP						                                    ; JUMP->PROCESS SPRITE SCRIPT LOOP

@do_sprite_data_routine:							                                            ; C0-DF JUMP TO ADDRESS AND RETURN( ) 
	STA command_value						                                                    ; 
	LDY #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX						                        ;
	LDA (CURR_SPR_RAM_ADDR),Y						                                            ;
	CMP #$03						                                                            ; VALUE < 3? YES->UPDATE RETURN INDEX, SAVE RTURN ADDR AND SET NEW ADDR
	BCC @save_return_adress					                                                    ; 
	JMP INFINITE_LOOP						                                                    ; JUMP->INFINITE LOOP

@save_return_adress:							                                                ; UPDATE RETURN INDEX, SAVE RTURN ADDR AND SET NEW ADDR
	TAX							                                                                ; RETURN INDEX COUNTER++
	CLC							                                                                ;  
	ADC #$01						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	TXA							                                                                ; SHIFT PREVIOUS INDEX SINCE ADDRESS IS TWO BYTES 
	ASL							                                                                ; 
	CLC							                                                                ;
	ADC #RETURN_ADDRESSES_SPR_SCRIPT_RAM_INDEX						                            ; + OFFSET TO RETURN ADDRESSES
	TAY							                                                                ; 
	LDA CURR_SPR_SCRIPT_ADDR						                                            ; SET SPR RETURN ADDR = SCRIPT ADDR + 0X02 (COMMAND+ ARG LENGTH)
	CLC							                                                                ;
	ADC #$02						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	INY							                                                                ; 
	LDA CURR_SPR_SCRIPT_ADDR + 1						                                        ;
	ADC #$00						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDY #$01						                                                            ;
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ; SET SPR DATA ADDR LOW =(COMMAND ARG)
	STA CURR_SPR_SCRIPT_ADDR						                                            ; 
	LDA command_value						                                                    ;
	SEC							                                                                ;
	SBC #$20						                                                            ;
	STA CURR_SPR_SCRIPT_ADDR + 1						                                        ; SET SPR DATA ADDR HIGH =(COMMAND - 0X20)
	JMP PROCESS_SPRITE_SCRIPT_DATA_LOOP						                                    ; JUMP->PROCESS SPRITE SCRIPT LOOP

@do_looping_sprite_data:							                                            ; E0-EF SAVE RETURN ADDRESS AND # OF TIMES TO LOOP( ) MIN OF 4 LOOPS
	TAX							                                                                ;
	LDY #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX						                        ; LOAD SEQUNCE INDEX
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	CMP #$04						                                                            ; VALUE < 4? 
	BCC @save_times_to_loop						                                                ;
	JMP INFINITE_LOOP						                                                    ; NO->INFINITE LOOP = CRASH = ONLY 3 SPRITE ANIMATIONS AT ONCE

@save_times_to_loop:							                                                ; UPDATE RETURN INDEX, SAVE RTURN ADDR AND SET NEW ADDR
	CLC							                                                                ; LOOP TIMER INDEX++	
	ADC #$01						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SET OFFSET TO LOOP TIMER
	CLC							                                                                ;
	ADC #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX					                       		;
	TAY							                                                                ; SAVE VALUE
	TXA							                                                                ; TIMES TO LOOP = EX - 0XE0 = 0 TO 15 TIMES
	SEC							                                                                ;
	SBC #$E0						                                                            ; 
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; 
	TYA							                                                                ; CONVERT FRAME DELAY INDEX TO RETURN ADDR INDEX
	ASL							                                                                ;
	SEC							                                                                ;
	SBC #$10						                                                            ;
	TAY							                                                                ;
	LDA CURR_SPR_SCRIPT_ADDR						                                            ; DATA ADDR++
	CLC							                                                                ;
	ADC #$01						                                                            ;
	STA CURR_SPR_SCRIPT_ADDR						                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SAVE CURRENT ADDRESS +1  IN SPR RETURN ADDR 
	INY							                                                                ;
	LDA CURR_SPR_SCRIPT_ADDR + 1						                                        ;
	ADC #$00						                                                            ;
	STA CURR_SPR_SCRIPT_ADDR + 1						                                        ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	JMP PROCESS_SPRITE_SCRIPT_DATA_LOOP						                                    ; JUMP->PROCESS SPRITE SCRIPT LOOP

@do_special_sprite_commands	:							                                        ; 0XF0-0XFF COMMANDS
	SEC							                                                                ; CONVERT COMMAND TO COMMAND ADDRESS INDEX
	SBC #$F0						                                                            ;
	PUSH_TABLE_ADDR[tableAddr] SPRITE_SCRIPT_F0_TO_FF_COMMAND_TABLE

_F}_DRAW_SPRITES_FROM_SCRIPT_MAIN_LOOP	

_F{_DRAW_SPRITES_COMMAND_TABLE																	; DONE
								                                                                ; SPRITE COMMAND JUMP TABLE 
SPRITE_SCRIPT_F0_TO_FF_COMMAND_TABLE:
	.WORD SET_SPR_PAL_AND_SET_TOFULLY_FADE_IN_SPR_SCRIPT_F0_BYTECODE-1 				            ; 0XF0 SET SPR PAL AND SET TO FULLY FADED IN(SPR PAL INDEX)
	.WORD SET_SPR_OFFSCREEN_THRESHOLD_SPR_SCRIPT_F1_BYTECODE-1					                ; 0XF1 SET SPRITE OFFSCREEN THRESHOLDS(0=TOP 1=BOT, THRESHOLD) 
	.WORD SET_SPR_SCROLLING_TRUE_SPR_SCRIPT_F2_BYTECODE-1 				                        ; 0XF2 START SCROLLING 
	.WORD SET_SPR_PRIORITY_BEHIND_BG_SPR_SCRIPT_F3_BYTECODE-1 				                    ; 0XF3 SET SPRITE PRIORITY =  BEHIND BACKGROUND
	.WORD SET_SPR_SIZE_8_BY_8_SPR_SCRIPT_F4_BYTECODE-1 				                            ; 0XF4 SET SPRITE SIZE = 8X8
	.WORD SET_SPR_SIZE_8_BY_16_SPR_SCRIPT_F5_BYTECODE-1 				                        ; 0XF5 SET SPRITE SIZE = 8X16
	.WORD SET_CHR_BANKS_SPR_SCRIPT_F6_BYTECODE-1 				                                ; 0XF6 SET SPRITE CHR BANKS (1000 BNK, 1400 BNK, 1800 BNK, 1C00 BNK)
	.WORD SET_DELAY_SPR_SCRIPT_F7_BYTECODE-1					                                ; 0XF7 DECEREMENT LOOP TIMER AND LOOP BACK IF NOT DONE
	.WORD SET_SPR_START_LOCATION_SPR_SCRIPT_F8_BYTECODE-1					                    ; 0XF8 SET SPR START LOCATION(Y,X)
	.WORD SWITCH_CUTSCENE_SIDE_SPR_SCRIPT_F9_BYTECODE-1 				                        ; 0XF9 SWITCH CURRENT PLAYER CUTSCENE SIDE 
	.WORD SET_CUTSCENE_SIDE_TO_CURRENT_SPR_SCRIPT_FA_BYTECODE-1 				                ; 0XFA SAVE CURRENT CUTSCENE SIDE IN RAM
	.WORD SET_SCROLL_SPEEDS_SPR_SCRIPT_FB_BYTECODE-1 				                            ; 0XFB SET SCROLL SPEEDS( DATA = Y SPEED, X SPEED, Y INC, X INC)
	.WORD SET_SPR_PAL_INDEX_SPR_SCRIPT_FC_BYTECODE-1 				                            ; 0XFC SET SPRITE PAL INDEX (DATA =PAL INDEX)
	.WORD REVERSE_SCROLL_DIRECTION_SPR_SCRIPT_FD_BYTECODE-1 				                    ; 0XFD SET SCROLLING = TRUE AND FLIP SCROLL DIRECTION 
	.WORD RETURN_FROM_ROUTINE_SPR_SCRIPT_FE_BYTECODE-1 				                            ; 0XFE RETURN TO SPR SCRIPT 
	.WORD STOP_SCROLL_SPR_SCRIPT_FF_BYTECODE-1					                                ; 0XFF SET SCROLLING = STOPPED AND SET SPR RAM TO NEXT SET

_F}_DRAW_SPRITES_COMMAND_TABLE	

_F{_DRAW_SPRITES_F0_to_FF_COMMANDS																; DONE

SET_SPR_PAL_AND_SET_TOFULLY_FADE_IN_SPR_SCRIPT_F0_BYTECODE:							            ; 0XF0 SET SPR PAL AND SET TO FULLY FADED IN(SPR PAL INDEX)
	LDY #$01						                                                            ; SET SPR PAL = DATA VALUE 
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	STA SPR_PAL_INDEX						                                                    ;
	JSR TRANSFER_BG_SPR_PAL_SET_FULLY_FADED_IN						                            ; UPDATE PALLETES AND SET TO FULLY FADED IN($50= BG, $51 = SPR)
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_SPR_OFFSCREEN_THRESHOLD_SPR_SCRIPT_F1_BYTECODE:							                    ; 0XF1 SET SPRITE OFFSCREEN THRESHOLDS (TOP=0 BOT=1, Y LOC) 
	LDY #$01						                                                            ; DOES DATA = SET BOTTOM OF SCREEN THRESHOLD = TRUE?
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	BNE @set_bottom_of_screen_threshold						                                   ; YES->SET BOTTOM OF SCREEN THRESHOLD

@set_top_of_screen_threshold:	
	LDY #$02						                                                            ; 
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	STA SPR_SCRIPT_TOP_OF_SCREEN_THRESHOLD						                                 ; SET TOP OF SCREEN THRESHOLD = DATA VALUE
	LDA #$03						                                                            ; SET COMMAND LENGTH = 3 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

@set_bottom_of_screen_threshold:							                                    ; SET BOTTOM OF SCREEN THRESHOLD *** dont think ever referenced
	LDY #$02						                                                            ; 
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	STA SPR_SCRIPT_BOTTOM_OF_SCREEN_THRESHOLD						                            ; SET BOTTOM OF SCREEN THRESHOLD = DATA VALUE
	LDA #$03						                                                            ; SET COMMAND LENGTH = 3 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_SPR_SCROLLING_TRUE_SPR_SCRIPT_F2_BYTECODE:							                        ; 0XF2 START SCROLLING 
	LDY #SCROLLING_ACTIVE_SPR_SCRIPT_RAM_INDEX						                            ; SET SCROLLING = TRUE
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	ORA #$20						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_SPR_PRIORITY_BEHIND_BG_SPR_SCRIPT_F3_BYTECODE: 							                    ; 0XF3 SET SPRITE PRIORITY =  BEHIND BACKGROUND
	LDY #SPRITE_PRIORITY_SPR_SCRIPT_RAM_INDEX						                            ; 
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ; SET SPR RAM PRIORTY FLAG = BEHIND BACKGROUND
	ORA #$02						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_SPR_SIZE_8_BY_8_SPR_SCRIPT_F4_BYTECODE:							                            ; 0XF4 SET SPRITE SIZE = 8X8
	LDA SPRITE_SIZE					                                                            ; SET SPRITE SIZE TEMP = 8X8
	AND #$7F						                                                            ;
	STA SPRITE_SIZE					                                                            ;
	SET_SOFT_SPRITE_8_BY_8[]																	; SET SOFT PPU CTRL = SET SPRITE SIZE = 8X8
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                         ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_SPR_SIZE_8_BY_16_SPR_SCRIPT_F5_BYTECODE:							                                                            ; 0XF5 SET SPRITE SIZE = 8X16
	LDA SPRITE_SIZE					                                                            ; SET SPRITE SIZE TEMP = 8X16
	ORA #$80						                                                            ;
	STA SPRITE_SIZE					                                                            ;
	SET_SOFT_SPRITE_8_BY_16
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                                            ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_CHR_BANKS_SPR_SCRIPT_F6_BYTECODE: 							                                ; 0XF6 SET SPRITE CHR BANKS (1000 BNK, 1400 BNK, 1800 BNK, 1C00 BNK)
	LDY #$01						                                                            ;

_WHILE CC							                                                            ; SET SOFT SPR CHR BANKS LOOP ($4B THRU $4E)
	
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ; DOES ARGUMENT = DON'T UPDATE
	CMP #$FF						                                                            ; 
	BEQ @check_done						                                                        ; YES-> CHECK NEXT ARGUMENT
	STA SOFT_CHR_BANKS-1,Y		                                                                ; SET CURRENT SOFT CHR BANK = ARGUMENT 
@check_done:							                                                        ; CHECK NEXT ARGUMENT
	INY							                                                                ; DATA ADDR++
	CPY #$05						                                                            ; DONE?

_END_WHILE						                                                                ; NO-> SET SPR CHR BANKS LOOP
	LDA #$05						                                                            ; SET COMMAND LENGTH = 5 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_DELAY_SPR_SCRIPT_F7_BYTECODE:							                                                            ; 0XF7 Loop32
	LDY #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX							                    ; LOAD FRAME DELAY/RETURN ADDR INDEX 
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	BNE @save_delay						                                                        ; 
	JMP INFINITE_LOOP						                                                    ; INFINITE LOOP

@save_delay:							                                                        ;
	TAX							                                                                ; = FRAME DELAY/RETURN ADDR INDEX 
	CLC							                                                                ;
	ADC #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX						                        ;  + OFFSET TO SPR FRAME DELAYS
	TAY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ; # FRAMES TO WAIT--
	SEC							                                                                ;
	SBC #$01						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	BEQ @decrease_sequence_index_by_one						                                    ; TIMER DONE? NO->END OF COMMAND
	TXA							                                                                ; = FRAME DELAY/RETURN ADDR INDEX 
	ASL							                                                                ;
	CLC							                                                                ;
	ADC #$16						                                                            ; + OFFSET TO RETURN ADDRESSES 
	TAY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ; SET DATA ADDR = RETURN ADDR
	STA CURR_SPR_SCRIPT_ADDR						                                            ;
	INY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA CURR_SPR_SCRIPT_ADDR + 1						                                        ; 
	JMP PROCESS_SPRITE_SCRIPT_DATA_LOOP						                                                            ; JUMP->PROCESS SPRITE SCRIPT LOOP

@decrease_sequence_index_by_one:							                                        ; END OF COMMAND
	LDY #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX							                    ; SPRITE TIMER INDEX--
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	SEC							                                                                ;
	SBC #$01						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_SPR_START_LOCATION_SPR_SCRIPT_F8_BYTECODE:							                        ; 0XF8 SET SPR START LOCATION (DATE= (Y LOC)/2 , (X LOC)/2)
	LDY #$01						                                                            ;
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ; 
	ASL							                                                                ;
	LDY #SPRITE_Y_LOC_SPR_SCRIPT_RAM_INDEX						                                ; 
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SET SPR Y HIGH BYTE = SPR Y DATA * 2
	PHP							                                                                ; SAVE SIGN
	LDY #$02						                                                            ; SAVE SPR X DATA
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	TAX							                                                                ;
	
@check_cutscene_side: 	
	LDA GAME_STATUS						                                                        ; IS CURRENT CUTSCENE SIDE = P2
	AND #$20						                                                            ;
	BEQ @save_spr_pos					                                                        ; NO->SAVE SPR X POSITION AND NAME TABLE
	
@set_spr_pos_p2_side:	
	TXA							                                                                ; CONVERT X POSITION OPPOSITE SIDE OF MIDDLE OF SCREEN
	EOR #$7F						                                                            ;
	SEC							                                                                ;
	SBC #$07						                                                            ;
	TAX							                                                                ;

@save_spr_pos:							                                                        ; SAVE SPR X POSITION AND NAME TABLE
	TXA							                                                                ; 
	ASL							                                                                ;
	LDY #SPRITE_X_LOC_SPR_SCRIPT_RAM_INDEX						                    			;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SET SPR X HIGH BYTE = CONVERTED SPR X DATA * 2
	INY							                                                                ; 
	LDA #$00						                                                            ;
	ROL							                                                                ; 
	PLP							                                                                ; RESTORE Y SIGN
	ROL							                                                                ; 
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SAVE SPR NAMETABLE = $2000 =0, $2800 =1,  $2400=2,  $2A00= 3  
	LDA #$03						                                                            ; SET COMMAND LENGTH = 3 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SWITCH_CUTSCENE_SIDE_SPR_SCRIPT_F9_BYTECODE:							                            ; 0XF9 SWITCH CURRENT PLAYER CUTSCENE SIDE 

cutscene_side		= LOCAL_8

@switch_cutscene_side:
	LDA GAME_STATUS						                                                        ; GET CURRENT PLAYER CUTSCENE SIDE
	ASL							                                                                ; 
	EOR #$40						                                                            ;
	AND #$40						                                                            ;
	STA cutscene_side						                                                    ; 

@save_in_sprite_ram:	
	LDY #CUTSCENE_SIDE_SPR_SCRIPT_RAM_INDEX						                                ; SAVE CUTSCENE SIDE
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	AND #$BF						                                                            ;
	ORA cutscene_side						                                                    ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; 
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_CUTSCENE_SIDE_TO_CURRENT_SPR_SCRIPT_FA_BYTECODE:							                ; 0XFA SAVE CURRENT CUTSCENE SIDE IN RAM

cutscene_side		= LOCAL_8

	LDA GAME_STATUS						                                                        ;
	ASL							                                                                ;
	AND #$40						                                                            ;
	STA cutscene_side						                                                    ;
	LDY #CUTSCENE_SIDE_SPR_SCRIPT_RAM_INDEX						                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	AND #$BF						                                                            ;
	ORA cutscene_side						                                                    ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; 
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 BYTE
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_SCROLL_SPEEDS_SPR_SCRIPT_FB_BYTECODE:							                            ; 0XFB SET SCROLL SPEEDS( Y SPEED/16, X SPEED/16, Y INC, X INC) 

scroll_speed = LOCAL_8

	LDA #$00						                                                            ; CLEAR TEMP VAR = LOWER BYTE OF 16 BIT SCROLL SPEED
	STA scroll_speed						                                                                ;
	LDY #$01						                                                            ; LOAD Y SCROLL SPEED DATA  
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ; 
	PHP							                                                                ; SAVE POSITIVE OR NEGATIVE SCROLL
	LSR							                                                                ; 16 BIT SCROLL SPEED = Y SCROLL SPEED DATA / 16  
	ROR scroll_speed						                                                    ;
	LSR							                                                                ;
	ROR scroll_speed						                                                    ;
	LSR							                                                                ;
	ROR scroll_speed						                                                    ;
	LSR							                                                                ;
	ROR scroll_speed						                                                    ;
	PLP							                                                                ;
	BPL @save_y_scroll_speed						                                            ; IS VALUE NEGATIVE? NO-> SAVE Y SCROLL SPEED
	ORA #$F0						                                                            ; CONVERT TO NEGATIVE NUMBER

@save_y_scroll_speed:							                                                ; SAVE Y SCROLL SPEED
	LDY #SPRITE_Y_SPEED_SPR_SCRIPT_RAM_INDEX						                            ; SET Y SCROLL SPEED = 16 BIT SCROLL SPEED
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	TAX							                                                                ;
	DEY							                                                                ;
	LDA scroll_speed						                                                    ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;

	LDY #$03						                                                            ;
	TXA							                                                                ; IS Y SCROLL INCREASE NEGATIVE
	BMI @negate_y_value						                                                    ; YES->DO 1 - Y SCROLL SPEED INCREASE

	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	JMP @save_y_speed_increase						                                            ; NO-> SAVE Y SCROLL SPEED INCREASE

@negate_y_value:							                                                        ; DO 1 - Y SCROLL SPEED INCREASE
	LDA #$00						                                                            ; 
	SEC							                                                                ;
	SBC (CURR_SPR_SCRIPT_ADDR),Y						                                        ;

@save_y_speed_increase:							                                                            ; SAVE Y SCROLL SPEED INCREASE 
	LDY #SPRITE_Y_SPEED_INCREASE_SPR_SCRIPT_RAM_INDEX						                    ; SAVE Y SCROLL SPEED INCREASE
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	
	
	LDA #$00						                                                            ;
	STA scroll_speed						                                                  ;
	LDY #$02						                                                            ; LOAD X SCROLL SPEED DATA
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	PHP							                                                                ; SAVE POSITIVE OR NEGATIVE SCROLL
	LSR							                                                                ; = 16 BIT X SCROLL SPEED DATA / 16  
	ROR scroll_speed						                                                    ;
	LSR							                                                                ;
	ROR scroll_speed						                                                    ;
	LSR							                                                                ;
	ROR scroll_speed						                                                    ;
	LSR							                                                                ;
	ROR scroll_speed						                                                    ;
	PLP							                                                                ;
	BPL @save_x_scroll_speed					                                                ; IS VALUE NEGATIVE? NO-> SAVE X SCROLL SPEED

@convert_to_negative: 
	ORA #$F0						                                                            ; CONVERT TO NEGATIVE NUMBER

@save_x_scroll_speed:							                                                ; SAVE X SCROLL SPEED
	LDY #SPRITE_X_SPEED_SPR_SCRIPT_RAM_INDEX						                            ; SET X SCROLL SPEED = STARTING SCROLL SPEED
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	TAX							                                                                ;
	DEY							                                                                ;
	LDA scroll_speed					                                                        ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDY #$04						                                                            ; 
	TXA							                                                                ; IS X SCROLL NEGATIVE
	BMI @negate_x_value						                                                    ; YES-> DO 1 - X SCROLL SPEED INCREASE
	LDA (CURR_SPR_SCRIPT_ADDR),Y						                                        ;
	JMP @save_x_speed_increase						                                            ;

@negate_x_value:							                                                    ; DO 1 - X SCROLL SPEED INCREASE
	LDA #$00						                                                            ;
	SEC							                                                                ;
	SBC (CURR_SPR_SCRIPT_ADDR),Y						                                        ;

@save_x_speed_increase:							                                                ; SAVE X SCROLL SPEED INCREASE 
	LDY #SPRITE_X_SPEED_INCREASE_SPR_SCRIPT_RAM_INDEX						                    ; SAVE X SCROLL SPEED INCREASE
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;

@set_sprite_script_scrolling_active:	
	LDY #SCROLLING_ACTIVE_SPR_SCRIPT_RAM_INDEX						                            ; SET SPR RAM SCROLLING FLAG  = TRUE
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	ORA #$20						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	
	LDA #$05						                                                            ; SET COMMAND LENGTH = 5 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

SET_SPR_PAL_INDEX_SPR_SCRIPT_FC_BYTECODE: 							                            ; 0XFC SET SPRITE PALLETE INDEX (DATA = SPR PAL INDEX)
	LDY #$01						                                                            ; SET SPR PALLETE INDEX
	LDA (CURR_SPR_SCRIPT_ADDR),Y	                                                            ;
	STA SPR_PAL_INDEX						                                                    ; 
	LDA #$02						                                                            ; SET COMMAND LENGTH = 2 BYTES
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

REVERSE_SCROLL_DIRECTION_SPR_SCRIPT_FD_BYTECODE:							                    ; 0XFD SET SCROLLING = TRUE AND FLIP SCROLL DIRECTION 
	LDY #VERTICAL_FLIP_SPR_SCRIPT_RAM_INDEX						                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	ORA #$30						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDA #$01						                                                            ; SET COMMAND LENGTH = 1 BYTE
	JMP UPDATE_SPRITE_SCRIPT_ADDR						                                        ; JUMP->UPDATE ADDR (A= COMMAND LENGTH)

RETURN_FROM_ROUTINE_SPR_SCRIPT_FE_BYTECODE:							                            ; 0XFE RETURN TO SPR SCRIPT ADDR 
	LDY #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX						                        ; LOAD SPR SET INDEX
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	BNE @get_return_address						                                                            ;
	JMP INFINITE_LOOP						                                                    ; JUMP->INFINITE LOOP

@get_return_address:							                                                ; 
	SEC							                                                                ; SPR SET INDEX--
	SBC #$01						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	ASL							                                                                ; SHIFT VALUE SINCE EACH ADDR IS TWO BYTES
	CLC							                                                                ;
	ADC #RETURN_ADDRESSES_SPR_SCRIPT_RAM_INDEX						                            ; + OFFSET TO RETURN ADDR
	TAY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA CURR_SPR_SCRIPT_ADDR						                                            ; SET DATA ADDR = RETURN ADDR
	INY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA CURR_SPR_SCRIPT_ADDR + 1						                                        ; 
	JMP PROCESS_SPRITE_SCRIPT_DATA_LOOP						                                                            ; JUMP->PROCESS SPRITE SCRIPT LOOP

UPDATE_SPRITE_SCRIPT_ADDR:							                                            ; UPDATE ADDR (A= COMMAND LENGTH)
	CLC							                                                                ;
	ADC CURR_SPR_SCRIPT_ADDR						                                            ; DATA ADDR = DATA ADDR + AMOUNT
	STA CURR_SPR_SCRIPT_ADDR						                                            ;
	LDA CURR_SPR_SCRIPT_ADDR + 1						                                        ;
	ADC #$00						                                                            ;
	STA CURR_SPR_SCRIPT_ADDR + 1						                                        ;
	JMP PROCESS_SPRITE_SCRIPT_DATA_LOOP						                                                            ; JUMP->PROCESS SPRITE SCRIPT LOOP

STOP_SCROLL_SPR_SCRIPT_FF_BYTECODE:							                                                            ; 0XFF SET SCROLLING = STOPPED AND SET SPR RAM TO NEXT SET
	LDA #$00						                                                            ;
	TAY							                                                                ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	
_F}_DRAW_SPRITES_F0_to_FF_COMMANDS

_F{_UPDATE_SPR_SCRIPT_SCROLLING																	; DONE
	
UPDATE_SPR_SCRIPT_SCROLLING:							                                        ; DO SPR SCROLL UPDATE IF NEEDED
sprite_data_addr		= LOCAL_1
curr_y_scroll_speed		= LOCAL_7
curr_x_scroll_speed		= LOCAL_7
last_sprite_index		= LOCAL_8

CURRENT_SPR_BUFFER_Y[]	= SPRITE_START + 4

	LDY #SCROLLING_ACTIVE_SPR_SCRIPT_RAM_INDEX						                            ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	TAX							                                                                ;
	AND #$20						                                                            ; DOES SCROLLING = FALSE?
	BEQ GO_TO_NEXT_SPR_SCRIPT_RAM_CHECK_IF_DONE						                            ; YES->SET SPRITE RAM ADDR TO NEXT SET AND CHECK IF DONE
	
@check_for_scrolling_flipped:	
	TXA							                                                                ;
	AND #$10						                                                            ; DOES SCROLL DIRECTION = INVERTED?
	BEQ @update_spr_y_location:					                                                ; NO->UPDATE SPR Y BASED ON SCROLL SPEEDS


@negative_scroll_y	
	LDA #$00						                                                            ; = 1 - Y SCROLL SPEED 
	SEC								                                                            ;
	SBC Y_SCROLL_DIST						                                                	;
	LDY #SPRITE_Y_SPEED_SPR_SCRIPT_RAM_INDEX						                            ; 
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SAVE IN Y SCROLL SPEED HIGH BYTE

@negative_scroll_x		
	LDA #$00						                                                            ; = 1 - X SCROLL SPEED
	SEC								                                                            ;
	SBC X_SCROLL_DIST							                                            	;
	LDY #SPRITE_X_SPEED_SPR_SCRIPT_RAM_INDEX						                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;

@update_spr_y_location:							                                                ; UPDATE SPR Y BASED ON SCROLL SPEEDS
	LDY #SPRITE_Y_SPEED_INCREASE_SPR_SCRIPT_RAM_INDEX						                    ; SET SCROLL SPEED INDEX = Y SCROLL SPEED
	JSR UPDATE_SPRITE_SCROLL_SPEED					                                            ; UPDATE Y or X SCROLL SPEED(Y= SCROLL SPEED INDEX)
	
	LDY #SPRITE_Y_LOC_SUB_PIXEL_SPR_SCRIPT_RAM_INDEX						                    ; SPR Y (16-BIT) += CURRENT Y SCROLL SPEED ($45,44) 
	LDA curr_y_scroll_speed						                                                ;
	CLC							                                                                ;
	ADC (CURR_SPR_RAM_ADDR),Y						                                            ;
	STA (CURR_SPR_RAM_ADDR),Y						                                            ;
	INY							                                                                ;
	LDA curr_y_scroll_speed+1						                                            ;
	ADC (CURR_SPR_RAM_ADDR),Y						                                            ;
	STA (CURR_SPR_RAM_ADDR),Y						                                            ;
	ROR							                                                                ; SET CURRENT NAMETABLE LOCATION Y 0= ONSCREEN, 1 = OFFSCREEN
	EOR curr_y_scroll_speed+1						                                            ;
	ASL							                                                                ;
	BCC @update_spr_x_location						                                            ; STILL ON SAME SCREEN? YES-> UPDATE SPR X BASED ON SCROLL SPEEDS
	LDY #SPRITE_NAMETABLE_SPR_SCRIPT_RAM_INDEX						                            ; SET CURRENT NAMETABLE LOCATION Y = NEXT SCREEN (ONSCREEN OR OFFSCREEN)
	LDA (CURR_SPR_RAM_ADDR),Y						                                            ;
	EOR #$01						                                                            ;
	STA (CURR_SPR_RAM_ADDR),Y						                                            ;

@update_spr_x_location:							                                                ; UPDATE SPR X BASED ON SCROLL SPEEDS
	LDY #SPRITE_X_SPEED_INCREASE_SPR_SCRIPT_RAM_INDEX						                    ; SET SCROLL SPEED INDEX = X SCROLL SPEED
	JSR UPDATE_SPRITE_SCROLL_SPEED					                                            ; UPDATE Y or X SCROLL SPEED(Y= SCROLL SPEED INDEX)
	LDA GAME_STATUS						                                                        ;
	AND #$20						                                                            ;
	BEQ @set_spr_x_location						                                                ;
	

@negative_x_scroll_speed:	
	NEGATE_16_ZP curr_x_scroll_speed															;  = 1- X SCROLL SPEED
	
	
@set_spr_x_location:							                                                ; 
	LDY #SPRITE_X_LOC_SUB_PIXEL_SPR_SCRIPT_RAM_INDEX						                    ; X SCROLL += CURRENT X SCROLL SPEED ($45,$44)
	LDA curr_x_scroll_speed							                                            ;
	CLC							                                                                ;
	ADC (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	INY							                                                                ;
	LDA curr_x_scroll_speed	+1						                                            ;
	ADC (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	ROR							                                                                ; SET CURRENT NAMETABLE LOCATION X
	EOR curr_x_scroll_speed	+1						                                            ;
	ASL							                                                                ;
	BCC @set_ram_addr_and_update_spr_buffer						                                ; STILL ON SAME SCREEN? YES->UPDATE OAM SPR VALUES
	
	LDY #SPRITE_NAMETABLE_SPR_SCRIPT_RAM_INDEX						                            ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	EOR #$02						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;

@set_ram_addr_and_update_spr_buffer:							                                ; UPDATE OAM SPR VALUES
	LDY #SPRITE_TILE_ATTR_ADDR_SPR_SCRIPT_RAM_INDEX						                        ; SET RAM ADDR = SPR TILE AND ATTRIB ADDR
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA sprite_data_addr						                                                ;
	INY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA sprite_data_addr+1						                                                ;
	JSR SPRITE_SCRIPT_UPDATE_SPRITE_BUFFER					                                    ; UPDATE OAM SPRITE LOCATIONS, TILES AND ATTRIBS() 

GO_TO_NEXT_SPR_SCRIPT_RAM_CHECK_IF_DONE:							                            ; SET SPRITE RAM TO NEXT SET AND CHECK IF DONE
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] CURR_SPR_RAM_ADDR, $20
	DEC SPRITE_SCRIPT_COUNTER						                                            ; DONE? 
	BEQ @check_for_end_of_loop						                                            ; YES->END OF SPRITE LOOP
	JMP CHECK_SPRITE_SCROLLING_ACTIVE						                                                            ; NO->

@check_for_end_of_loop:							                                                ; END OF SPRITE LOOP
	LDA SPRITE_RAM_INDEX							                                            ; IS LAST SPRITE INDEX <= CURRENT SPRITE INDEX 
	ASL								                                                            ;
	ASL								                                                            ;	
	CMP SPRITE_SCRIPT_SPRITE_INDEX							                                    ;
	BEQ @save_sprite_index_and_sprite_size					                                    ; YES->SAVE LAST SPRITE NUMBER AND JUMP TO PROCESS SPRITE DATA AND COMMANDS LOOP
	BCC @save_sprite_index_and_sprite_size						                                 ; 
	STA last_sprite_index						                                                ; SAVE ENDING SPRITE INDEX
	LDX SPRITE_SCRIPT_SPRITE_INDEX						                                        ; LOAD CURRENT SPRITE INDEX

	LDA #SPRITE_OFFSCREEN						                                                ; SET SPR Y POS VAL = OFFSCREEN 
_WHILE CC							                                                            ; SET SPRITES OFFSCREEN LOOP
	STA CURRENT_SPR_BUFFER_Y[],X						                                        ; SET SPRITE Y = OFFSCREEN 
	SET_X_INDEX_NEXT_SPRITE
	CPX last_sprite_index						                                                ; CURRENT SPRITE INDEX > ENDING SPRITE INDEX
_END_WHILE						                                                                ; NO-> SET SPRITES OFFSCREEN LOOP

@save_sprite_index_and_sprite_size:							                                    ; SAVE LAST SPRITE NUMBER AND JUMP TO PROCESS SPRITE DATA AND COMMANDS LOOP
	LSR SPRITE_SCRIPT_SPRITE_INDEX						                                        ; SAVE CURRENT SPRITE NUMBER AND SPRITE SIZE SETTING
	LSR SPRITE_SCRIPT_SPRITE_INDEX						                                        ;
	LDA SPRITE_RAM_INDEX						                                                ; 
	AND #$C0						                                                            ;
	ORA SPRITE_SCRIPT_SPRITE_INDEX						                                        ;
	STA SPRITE_RAM_INDEX						                                                ; 
	JMP PROCESS_SPR_SCRIPT_MAIN_LOOP						                                    ; JUMP->PROCESS SPRITE DATA AND COMMANDS LOOP

_F}_UPDATE_SPR_SCRIPT_SCROLLING

_F{_SPRITE_SCRIPT_UPDATE_SPRITE_BUFFER															; DONE

SPRITE_SCRIPT_UPDATE_SPRITE_BUFFER:							                                    ; UPDATE OAM SPRITE LOC, TILES AND ATTRIBUTES()

data_addr 											=  LOCAL_1

sprite_x_loc										=  LOCAL_3
sprite_onscreen_x									=  LOCAL_4

sprite_y_loc										=  LOCAL_5
sprite_onscreen_y									=  LOCAL_6

sprite_size											= LOCAL_8

SPRITE_BUFFER_JUMP_COMMAND_BITMASK					= $A0
SPRITE_BUFFER_ROUTINE_COMMAND_BITMASK				= $C0
SPRITE_BUFFER_UPDATE_TILE_ATTR_COMMAND_BITMASK		= $E0
SPRITE_BUFFER_UPDATE_SPECIAL_COMMAND_BITMASK		= $F0

@set_is_sprite_onscreen_var:
	LDY #SPRITE_NAMETABLE_SPR_SCRIPT_RAM_INDEX						                            ; SET IS SPRITE ONSCREEN
	LDA (CURR_SPR_RAM_ADDR ),Y		                                                            ;
	LSR								                                                            ;
	STA sprite_onscreen_x							                                            ; SET CURRENT SPR X NAMETABLE = BIT 1 OF SPR RAM NAMETABLE (0=ONSCREEN ,1= OFFSCREEN)
	
	LDA #$00						                                                            ;
	ROL								                                                            ;
	STA sprite_onscreen_y							                                            ; SET CURRENT SPR Y NAMETABLE = BIT 0 OF SPR RAM NAMETABLE (0=ONSCREEN ,1= OFFSCREEN)
	
@set_spr_x_location	
	DEY								                                                            ;
	LDA (CURR_SPR_RAM_ADDR ),Y		                                                            ;
	STA sprite_x_loc							                                                ; SET CURRENT SPR X = SPR RAM X 

@set_spr_y_location		
	LDY #SPRITE_Y_LOC_SPR_SCRIPT_RAM_INDEX						                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y		                                                            ;
	STA sprite_y_loc							                                                ; SET CURRENT SPR Y = SPR RAM

@set_spr_y_offset		
	LDA #$00						                                                            ; 
	LDY #SPRITE_Y_OFFSET_SPR_SCRIPT_RAM_INDEX						                            ;
	STA (CURR_SPR_RAM_ADDR ),Y		                                                            ; SET SPR Y OFFSET = 0

@set_spr_x_offset	
	INY								                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y		                                                            ; SET SPR X OFFSET = 0


UPDATE_SPRITE_BUFFER_LOOP:								                                        ; UPDATE SPRITE TILES LOOP
	LDY #$00						                                                            ; DOES DATA VALUE = COMMAND
	LDA (data_addr),Y						                                                    ;
	BMI PROCESS_SPRITE_BUFFER_COMMAND						                                            ; YES->SPR TILE DATA COMMANDS
	
@check_sprite_onscreen_x:	
	LDX SPRITE_SCRIPT_SPRITE_INDEX							                                    ; LOAD SPRITE INDEX
	LDA sprite_onscreen_x							                                            ; IS CURRENT SPR X NAMETABLE = OFFSCREEN
	LSR								                                                            ;
	BCC @update_sprite_x_location						                                        ; NO->UPDATE SPRITE X LOCATION
	JMP SET_SPRITE_OFFSCREEN_UPDATE_SPRITE_INDEX_AND_DATA_ADDR							        ; YES->SET SPR OFFSCREEN AND GO TO NEXT SPR

@update_sprite_x_location:								                                        ; UPDATE SPRITE X LOCATION
	LDA sprite_x_loc							                                                ; SET SPR X LOCATION = TEMP SPR X LOCATION
	STA CUR_SPRITE_X+4,X						                                                ; 	

	
	LDY #SPRITE_NAMETABLE_SPR_SCRIPT_RAM_INDEX						                            ; SET TEMP NAMETABLE OFFSCREEN  FROM SPR SCRIPT RAM NAMETABLE
	LDA (CURR_SPR_RAM_ADDR ),Y		                                                            ;
	AND #$01						                                                            ; 
	STA sprite_onscreen_y							                                            ; SET CURRENT SPR Y NAMETABLE = BIT 0 OF SPR RAM NAMETABLE (0=ONSCREEN ,1= OFFSCREEN)
	LDY #SPRITE_Y_LOC_SPR_SCRIPT_RAM_INDEX						                                ; 
	LDA (CURR_SPR_RAM_ADDR ),Y		                                                            ;
	STA sprite_y_loc							                                                 ; SET CURRENT SPR Y = SPR RAM Y
	
	LDY #$00						                                                            ; CONVERT DATA VALUE TO SPRITE ATTRIBUTES
	LDA (data_addr),Y						                                                    ;
	AND #$3C						                                                            ;
	SHIFT_LEFT_2								                                                 ;
	BIT SPRITE_SIZE					                                                            ; IS SPRITE SIZE TEMP = 8X16?
	BMI @check_thresholds						                                                ; YES->SPRITE SIZE IS 8X16 
	STA sprite_size							                                                    ;
	ROL sprite_size							                                                    ;
	ROR								                                                            ;

@check_thresholds:								                                                ; SPRITE SIZE IS 8X16
	JSR CHECK_SPRITE_Y_LOC_VS_THRESHOLDS					                                    ; CHECK SPR Y LOCATION VS SPLIT SCREEN THRESHOLD, SET Y LOCATION (A= Y DIST TO MOVE SPR)
	STA sprite_onscreen_y							                                            ; SAVE TEMP NAMETABLE OFFSCREEN  
	STY sprite_y_loc						                                                    ; SAVE CURRENT SPR Y
	BEQ @update_tile_and_attr						                                            ; IS NAME TABLE OFSCREEN NAMETABLE? 
	JMP SET_SPRITE_OFFSCREEN_UPDATE_SPRITE_INDEX_AND_DATA_ADDR						            ; YES->SET SPR OFFSCREEN AND GO TO NEXT SPR

@update_tile_and_attr:
	JMP UPDATE_SPRITE_BUFFER_TILE_AND_ATTR														; NO->SET SPRITE VALUES

PROCESS_SPRITE_BUFFER_COMMAND:							                                        ; SPR TILE DATA COMMANDS
	CMP #SPRITE_BUFFER_JUMP_COMMAND_BITMASK						                                ; IS COMMAND BETWEEN 0X80 AND 0X9F
	BCS CHECK_SPRITE_BUFFER_JUMP_COMMAND						                                ; NO-> CHECK FOR JUMP COMMAND
								                                                                ; 0X80 TO 0X9F SET SPR X LOCATION AND ONSCREEN/OFFSCREEN
	ASL							                                                                ; =(0X9F - DATA VALUE) *8 =Range 0 to 0xF8 in 0x08 increments 
	ASL							                                                                ;
	ASL							                                                                ;		
	TAX							                                                                ; 
	LDY #CUTSCENE_SIDE_SPR_SCRIPT_RAM_INDEX						                                ; DOES SPRITE CURRENT CUTSCENE SIDE = P2
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	ASL							                                                                ;
	BPL @set_sprite_x_loc:						                                                ; ABS(X)


@negate_location:	
	TXA							                                                                ; 
	EOR #$FF						                                                            ;
	TAX							                                                                ;
	INX							                                                                ;

@set_sprite_x_loc:							                                                                ; SET SPR X OFFSET
	TXA							                                                                ; = X VALUE 
	LDY #SPRITE_X_OFFSET_SPR_SCRIPT_RAM_INDEX						                            ;
	CLC							                                                                ;
	ADC (CURR_SPR_RAM_ADDR ),Y						                                            ; + CURR SPR X OFFSET
	TAX							                                                                ; X= X VALUE + CURR SPR X OFFSET
	LDY #SPRITE_X_LOC_SPR_SCRIPT_RAM_INDEX						                                ;
	CLC							                                                                ;
	ADC (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA sprite_x_loc						                                                    ; TEMP SPR X LOCATION = CUR SPR X + X DATA VALUE + CURR SPR X OFFSET
	TXA							                                                                ;
	AND #$80						                                                            ; IS X DATA VALUE + CURR SPR X OFFSET = LEFT SIDE OF SCREEN? 
	BPL @set_sprite_onscreen_x						                                            ; 
	LDA #$FF						                                                            ;

@set_sprite_onscreen_x:							                                                  ; SET SPRITE X LOC CHANGE (00= RIGHT, FF = LEFT)
	ADC #$00						                                                            ;
	STA sprite_onscreen_x						                                                ;
	INY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ; LODA SPR NAME TABLE
	LSR							                                                                ;
	CLC							                                                                ;
	ADC sprite_onscreen_x						                                                ;
	AND #$01						                                                            ;
	STA sprite_onscreen_x						                                                ; SET CURRENT SPR X NAMETABLE = SPR RAM X NAMETABLE + AMOUNT
	INC_16 data_addr																			; DATA ADDR++

@update_sprite_buffer:							                                                ;
	JMP UPDATE_SPRITE_BUFFER_LOOP						                                        ; JUMP->UPDATE SPRITE TILES LOOP

CHECK_SPRITE_BUFFER_JUMP_COMMAND:							                                    ; CHECK FOR JUMP COMMAND			
                                                                                                ; 0XA0 TO 0XBF JUMP TO NEW DATA ADDR
	CMP #SPRITE_BUFFER_ROUTINE_COMMAND_BITMASK						                             ; IS COMMAND = JUMP TO NEW DATA ADDR ?
	BCS CHECK_SPRITE_BUFFER_DO_ROUTINE_COMMAND						                            ; NO->CHECK FOR JSR COMMAND
	
DO_SPRITE_BUFFER_JUMP_COMMAND	
	TAX							                                                                ; SAVE HIGH BYTE OF ADDR
	INY							                                                                ;
	LDA (data_addr),Y						                                                    ; DATA ADDR = ADDR
	STA data_addr						                                                        ; SET LOW BYTE OF ADDR = 2ND DATA VALUE
	STX data_addr+1						                                                        ; SET HIGH BYTE OF ADDR = 1ST DATA VALUE
	JMP UPDATE_SPRITE_BUFFER_LOOP						                                        ; JUMP->UPDATE SPRITE TILES LOOP

CHECK_SPRITE_BUFFER_DO_ROUTINE_COMMAND:							                            ; CHECK FOR JSR COMMAND
 
																						        ; 0XC0 TO 0XDF JSR TO NEW DATA ADDR AND SAVE RETURN ADDR
	CMP #SPRITE_BUFFER_UPDATE_TILE_ATTR_COMMAND_BITMASK						                    ; IS COMMAND = JSR TO NEW DATA ADDR ?
	BCS CHECK_SPRITE_BUFFER_SPECIAL_COMMAND					                                    ;

DO_SPRITE_BUFFER_ROUTINE_COMMAND:	
	SEC							                                                                ;
	SBC #$20						                                                            ;
	TAX							                                                                ; SAVE HIGH BYTE OF RETURN ADDR = COMMAND -0X20 (Range 0xA0 to 0xBF)
	LDY #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX						                        ; IS CURRENT SPR RAM INDEX < 4
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	CMP #$04						                                                            ;
	BCC @save_return_address						                                            ;
	JMP INFINITE_LOOP						                                                    ; NO->INFINITE LOOP = CRASH

@save_return_address:							                                                 ;
	ADC #$01						                                                            ; CURRENT SPR RAM INDEX++
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	SBC #$00						                                                            ;
	ASL							                                                                ; SHIFT SINCE EACH ADDR TWO BYTES
	CLC							                                                                ;
	ADC #RETURN_ADDRESSES_SPR_SCRIPT_RAM_INDEX						                            ; + OFFSET TO SPR RAM RETURN ADDRESSES
	TAY							                                                                ;
	LDA data_addr						                                                        ; SET SPR RAM RETURN ADDR = CURRENT ADDR + COMMAND LENGTH
	CLC							                                                                ;
	ADC #$02						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	INY							                                                                ;
	LDA data_addr +1						                                                    ;
	ADC #$00						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	LDY #$01						                                                            ; DATA ADDR = ADDR
	LDA (data_addr),Y						                                                    ;
	STA data_addr						                                                        ; SET LOW BYTE OF ADDR = 2ND DATA VALUE
	STX data_addr+1						                                                        ; SET HIGH BYTE OF ADDR = 1ST DATA VALUE
	JMP UPDATE_SPRITE_BUFFER_LOOP						                                        ; JUMP->UPDATE SPRITE TILES LOOP

CHECK_SPRITE_BUFFER_SPECIAL_COMMAND:							                                                            ; 
	CMP #SPRITE_BUFFER_UPDATE_SPECIAL_COMMAND_BITMASK						                    ; IS COMMAND = UPDATE SPR TILE AND ATTRIBUTES ?
	BCC DO_SPRITE_BUFFER_UPDATE_TILE_ATTR_COMMAND					                            ; YES->0XE0 TO 0XEF SET SPR Y OFFSET AND UPDATE SPR TILE AND ATTRIBS
	JMP DO_FC_TO_FF_SPRITE_BUFFER_COMMAND						                                ; NO-> DO SPECIAL COMMAND

DO_SPRITE_BUFFER_UPDATE_TILE_ATTR_COMMAND:							                            ; 0XE0 TO 0XEF SET SPR X,Y OFFSET AND UPDATE SPR TILE AND ATTRIBS

sprite_x_pos	= LOCAL_3

command_value	= LOCAL_8

	SEC							                                                                ; SPR X OFFSET = COMMAND VALUE - 0XE0 = (0X00 TO 0X0F)
	SBC #SPRITE_BUFFER_UPDATE_TILE_ATTR_COMMAND_BITMASK						                    ;
	STA command_value						                                                    ;
	LDY #$00						                                                            ; DOES SPRITE CURRENT SIDE = P2
	LDA (CURR_SPR_RAM_ADDR),Y						                                            ;
	ASL							                                                                ;
	BPL @save_sprite_x_location						                                             ;
	NEGATE_8_ZP command_value
	

@save_sprite_x_location:							                                            ;
	LDX SPRITE_SCRIPT_SPRITE_INDEX						                                        ; LOAD SPRITE INDEX
	LDA command_value						                                                    ; = SPR X OFFSET
	CLC							                                                                ;
	ADC sprite_x_pos						                                                    ; + CURR SPR X
	STA CUR_SPRITE_X+4,X						                                                ; SET SPRITE X POS = SPR X OFFSET + CURR SPR X
	
	
	LDA command_value						                                                    ;
	AND #$80						                                                            ;
	BPL @check_offscreen						                                                ;
	LDA #$FF						                                                            ; 

@check_offscreen:							                                                    ;
	ADC sprite_x_pos + 1						                                                ;
	LSR							                                                                ; IS SPR OFFSCREEN?
	BCS SET_SPRITE_OFFSCREEN_UPDATE_SPRITE_INDEX_AND_DATA_ADDR						            ; YES-> SET SPR = OFFSCREEN AND UPDATE DATA ADDR AND SPR INDEX
	INC_16 data_addr																			; DATA ADDR++

@update_y_position:							                                                    ;
	LDY #$00						                                                            ;
	LDA (data_addr),Y						                                                    ;
	AND #$3C						                                                            ;
	LOG_SHIFT_RIGHT_2						                                                    ;
	JSR CHECK_SPRITE_Y_LOC_VS_THRESHOLDS 					                                    ; CHECK SPR Y LOCATION VS SPLIT SCREEN THRESHOLD, SET Y LOCATION (A= Y DIST TO MOVE SPR)
	BNE SET_SPRITE_OFFSCREEN_UPDATE_SPRITE_INDEX_AND_DATA_ADDR						            ; IS SPR OFFSCREEN YES->SET SPR OFFSCREEN AND UPDATE DATA ADDR

UPDATE_SPRITE_BUFFER_TILE_AND_ATTR:							                                    ; SET SPRITE TILE AND ATTRIBUTES 

sprite_attr		= LOCAL_8

	LDY #CUTSCENE_SIDE_SPR_SCRIPT_RAM_INDEX						                                ; 
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	TAX							                                                                ; SAVE SPR RAM FLAGS

@set_horizintal_flip								                                            ; 
	EOR (data_addr),Y						                                                    ; SET SPR HORIZONTAL FLIP
	AND #$40						                                                            ;
	TAY							                                                                ;
								                                                                ; SET SPR VERTICAL FLIP
	TXA							                                                                ; DOES SPR RAM VERTICAL FLIP FLAG  = TRUE
	AND #$04						                                                            ;
	BEQ @set_sprite_priority:						                                            ; NO->SET SPR PRIORITY
	
@flip_sprite_vertically:	
	TYA							                                                                ;
	ORA #$80						                                                            ; SET SPRITE MIRRORING = FLIP VERTICALLY
	TAY							                                                                ;

@set_sprite_priority:							                                                ; SET SPR PRIORITY
	TXA							                                                                ; DOES SPR RAM PRIOIRTY FLAG  = TRUE
	AND #$02						                                                            ;
	BEQ @set_spr_tile_and_attr					                                                ; NO->SET SPR TILE AND ATTRIBUTES
	
@set_sprite_priority_behind_background:	
	TYA							                                                                ;
	ORA #$20						                                                            ; SET SPRITE PRIORITY = BEHIND BACKGROUND 
	TAY							                                                                ;

@set_spr_tile_and_attr:							                                                ; SET SPR TILE AND ATTRIBUTES

@set_attr:
	STY sprite_attr						                                                        ; SAVE ATTRIBUTES
	LDY #$00						                                                            ; LOAD SPR PAL VALUE FROM DATA ADDR
	LDA (data_addr),Y						                                                    ;
	AND #$03						                                                            ;
	ORA sprite_attr						                                                        ;
	LDX SPRITE_SCRIPT_SPRITE_INDEX						                                        ; SET SPR ATTIRBUTES 
	STA CUR_SPRITE_ATTR+4,X						                                                ;			

@set_tile:	
	INY							                                                                ; DATA ADDR++
	LDA (data_addr),Y						                                                    ;
	STA CUR_SPRITE_TILE+4,X						                                                ; SET SPR TILE=  VAL AT DATA ADDR 
	JMP UPDATE_SPRITE_INDEX_AND_DATA_ADDR						                                ; JUMP-> UPDATE DATA ADDR AND SPR INDEX, CHECK IF AT LAST SPRITE

SET_SPRITE_OFFSCREEN_UPDATE_SPRITE_INDEX_AND_DATA_ADDR:							                ; SET SPR = OFFSCREEN AND UPDATE DATA ADDR AND SPR INDEX
	LDA #SPRITE_OFFSCREEN						                                                ; SET SPRITE Y = OFFSCREEN
	STA CUR_SPRITE_Y+4,X						                                                ;

UPDATE_SPRITE_INDEX_AND_DATA_ADDR:							                                         ; UPDATE DATA ADDR AND SPR INDEX, CHECK IF AT LAST SPRITE
	TXA							                                                                ; SET SPRITE INDEX += OFFSET TO NEXT SPRITE
	CLC							                                                                ;
	ADC #OFFSET_TO_NEXT_8_BY_8_SPRITE						                                    ;
	BCC @save_sprite_index_update_data_addr						                                ; PAST LAST SPRITE INDEX? NO->UPDATE DATA ADDR AND JUMP TO UPDATE SPRITE TILES LOOPS
	JMP SCRIPT_DONE_SPR_SCRIPT_FF_BYTECODE					                                    ; YES->DONE WITH SPRITES. *** COULD JUST USE RTS HERE

@save_sprite_index_update_data_addr:							                                ; SET SPR DATA ADDR TO NEXT SET AND JUMP TO UPDATE SPRITE TILES LOOPS
	STA SPRITE_SCRIPT_SPRITE_INDEX						                                        ; SAVE SPRITE INDEX
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] data_addr, $02
	JMP UPDATE_SPRITE_BUFFER_LOOP						                                        ; JUMP->UPDATE SPRITE TILES LOOP

_F}_SPRITE_SCRIPT_UPDATE_SPRITE_BUFFER

_F{_SPRITE_SCRIPT_UPDATE_SPRITE_BUFFER_FC_TO_FF_COMMANDS										; DONE

DO_FC_TO_FF_SPRITE_BUFFER_COMMAND:							                                                            ; DO SPECIAL COMMAND(0XFC TO 0XFF)  
	SEC							                                                                ; = COMMAND VALUE - fC
	SBC #$FC						                                                            ;
	PUSH_TABLE_ADDR[tableAddr] SRITE_SCRIPT_SPRITE_DATA_COMMAND_TABLE



SRITE_SCRIPT_SPRITE_DATA_COMMAND_TABLE:							                                ; FC-FF COMMAND TABLE
	.WORD PROCESS_SPR_DATA_SPR_SCRIPT_FC_BYTECODE-1 				                            ; 0XFC COMMANDS								                                                    
	.WORD UNUSED_UPDATE_SPR_SCRIPT_DATA_ADDR_FD_BYTECODE-1 				                        ; 0XFD INCR ADDR BY TWO BYTES APPEARS UNUSED
	.WORD RETURN_TO_PREVIOUS_SPR_SCRIPT_ADDR_FE_BYTECODE-1 				                        ; 0XFE RETURN TO PREV ADDR
	.WORD SCRIPT_DONE_SPR_SCRIPT_FF_BYTECODE-1				                                    ; 0XFF DONE UPDATING SPRITES
       

PROCESS_SPR_DATA_SPR_SCRIPT_FC_BYTECODE:							                            ; FC SPRITE DATA COMMANDS

data_addr 						=  LOCAL_1
curr_spr_x_loc					=  LOCAL_3
curr_spr_direction				=  LOCAL_4

SET_SPR_Y_OFFSET_BITMASK	=	$20
SET_SPR_X_OFFSET_BITMASK	=	$30														        ; 	00    = VERT FLIP = TRUE, 
									                                                            ; 	10    = VERT FLIP = FALSE
									                                                            ; 	20-2F = SET SPR Y OFFSET
									                                                            ; 	30-3F = SET SPR X OFFSET

	LDY #$01						                                                            ; DOES DATA VALUE = 0X00?
	LDA (data_addr),Y						                                                    ;
	
@check_for_vertical_flip_true:	
	BEQ @set_vertical_flip_to_true						                                        ; YES-> SET VERTICAL FLIP = TRUE

@check_for_vertical_flip_false:	
	CMP #SET_SPR_Y_OFFSET_BITMASK						                                         ; IS DATA VALUE BETWEEN 0X01-0X1F?
	BCC @set_vertical_flip_to_false						                                        ; YES->SET VERTICAL FLIP = FALSE	
 
@check_update_spr_y_offset:  
	CMP #SET_SPR_X_OFFSET_BITMASK						                                        ; IS DATA VALUE BETWEEN 0X20-0X2F?
	BCC @update_spr_y_offset						                                            ; 0X20-0X2F? YES-> SET SPR Y OFFSET 
								
 
@update_spr_x_offset 																			; 30-3F SET SPR X OFFSET
    AND #$0F						                                                            ; CONVERT 0X30-37 = 0X00 TO 0X07
    TAX							                                                                ;
	AND #$08						                                                            ;
	BEQ @check_cutscene_side					                                                    ; POS VALUE->CHECK FOR CUTSCENE SIDE
	
@convert_x_offset_to_negative	
	TXA							                                                                ; CONVERT 0X38-3F = 0XF8 TO 0XFF
	ORA #$F0						                                                            ;
	TAX							                                                                ;

@check_cutscene_side:							                                                ; CHECK FOR CUTSCENE SIDE/HORIZONTAL FLIP
	LDY #CUTSCENE_SIDE_SPR_SCRIPT_RAM_INDEX						                                ; IS SPRM RAM CUSIDE/HORIZONTAL FLIP = TRUE?
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	AND #$40						                                                            ;
	BEQ @save_x_offset					                                                        ; NO-> SAVE SPR X OFFSET
	
@do_abs
	TXA	
	EOR #$FF
	CLC
	ADC #$01
	TAX
	

@save_x_offset:							                                                        ; SAVE SPR X OFFSET
	TXA							                                                                ;
	LDY #SPRITE_X_OFFSET_SPR_SCRIPT_RAM_INDEX						                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ; SAVE SPR X OFFSET
	CLC							                                                                ; CURRENT SPR X POS += SPR X OFFSET
	ADC curr_spr_x_loc						                                                    ; 
	STA curr_spr_x_loc						                                                    ;
	TXA							                                                                ;
	AND #$80						                                                            ;
	BPL @set_screen_side					                                                    ;
	LDA #$FF						                                                            ;

@set_screen_side:							                                                    ; SET SCREEN SIDE
	ADC curr_spr_direction						                                                ;
	STA curr_spr_direction						                                                ;
	JMP @update_sprite_data_addr_by_two						                                    ; JUMP->INCR ADDR BY TWO BYTES AND JUMP TO UPDATE SPRITE TILES LOOP

@update_spr_y_offset:							                                                ; SET SPR Y OFFSET 
	AND #$0F						                                                            ; CONVERT 0X20-27 = 0X00 TO 0X07
	TAX							                                                                ;
	AND #$08						                                                            ;
	BEQ @save_y_offset						                                                    ;
	
@convert_y_offset_to_negative:	
	TXA							                                                                ; CONVERT 0X28-2F = 0XF8 TO 0XFF
	ORA #$F0						                                                            ;
	TAX							                                                                ;

@save_y_offset:							                                                        ;
	TXA							                                                                ;
	LDY #SPRITE_Y_OFFSET_SPR_SCRIPT_RAM_INDEX						                            ; SAVE SPR Y OFFSET
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	JMP @update_sprite_data_addr_by_two						                                    ; JUMP->INCR ADDR BY TWO BYTES AND JUMP TO UPDATE SPRITE TILES LOOP

@set_vertical_flip_to_false:							                                        ;  SET VERTICAL FLIP = FALSE
	LDY #VERTICAL_FLIP_SPR_SCRIPT_RAM_INDEX							                            ; SET SPR RAM VERTICAL FLIP FLAG = FALSE
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	AND #$FB						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	JMP @update_sprite_data_addr_by_two						                                    ; JUMP->INCR ADDR BY TWO BYTES AND JUMP TO UPDATE SPRITE TILES LOOP

@set_vertical_flip_to_true:							                                            ; SET VERTICAL FLIP = TRUE 
	LDY #VERTICAL_FLIP_SPR_SCRIPT_RAM_INDEX						                                ; SET SPR RAM VERTICAL FLIP FLAG = TRUE 
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	ORA #$04						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;

@update_sprite_data_addr_by_two:							                                    ; INCR ADDR BY TWO BYTES AND JUMP TO UPDATE SPRITE TILES LOOP
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] data_addr, $02
	JMP UPDATE_SPRITE_BUFFER_LOOP						                                         ; JUMP->UPDATE SPRITE TILES LOOP



UNUSED_UPDATE_SPR_SCRIPT_DATA_ADDR_FD_BYTECODE:							                        ; 0XFD INCR ADDR BY TWO BYTES APPEARS *** UNUSED
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] data_addr, $02
	JMP UPDATE_SPRITE_BUFFER_LOOP						                                        ; JUMP->UPDATE SPRITE TILES LOOP

RETURN_TO_PREVIOUS_SPR_SCRIPT_ADDR_FE_BYTECODE:							                        ; 0XFE RETURN TO PREVIOUS ADDR

return_addr		= LOCAL_1

	LDY #SPRITE_SEQUENCE_INDEX_SPR_SCRIPT_RAM_INDEX						                        ; DOES SPR SEQUENCE INDEX = 0
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	BNE @return_to_addr						                                                    ; NO->RETURN TO SAVED ADDRESS
	JMP INFINITE_LOOP						                                                    ; JUMP->INFINITE LOOP

@return_to_addr:							                                                    ; RETURN TO SAVED ADDRESS
	SEC							                                                                ; CONVERT RETURN ADDR INDEX TO RETURN ADDR OFFSET
	SBC #$01						                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	ASL							                                                                ;
	CLC							                                                                ;
	ADC #RETURN_ADDRESSES_SPR_SCRIPT_RAM_INDEX						                            ;
	TAY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ; SET CUR SEQUENCE ADDR = RETURN ADDR
	STA return_addr						                                                        ;
	INY							                                                                ;
	LDA (CURR_SPR_RAM_ADDR ),Y						                                            ;
	STA return_addr+1						                                                    ;
	JMP UPDATE_SPRITE_BUFFER_LOOP						                                        ; JUMP->UPDATE SPRITE TILES LOOP

SCRIPT_DONE_SPR_SCRIPT_FF_BYTECODE:							                                    ; 0XFF DONE UPDATING SPRITES 
	RTS							                                                                ; RETURN

_F}_SPRITE_SCRIPT_UPDATE_SPRITE_BUFFER_FC_TO_FF_COMMANDS

_F{_CHECK_SPRITE_Y_LOC_VS_THRESHOLDS															; DONE
	
CHECK_SPRITE_Y_LOC_VS_THRESHOLDS:							                                    ; CHECK SPR Y LOCATION VS SPLIT SCREEN THRESHOLD, SET Y LOCATION (A= Y DIST TO MOVE SPR)


current_spr_y		= LOCAL_5
current_name_table  = LOCAL_6
spr_y_change		= LOCAL_8

	LDY #SPRITE_Y_OFFSET_SPR_SCRIPT_RAM_INDEX								                    ; = DISTANCE TO MOVE SPRITE
	CLC							                                                                ;
	ADC (CURR_SPR_RAM_ADDR ),Y						                                            ; + SPR Y OFFSET
	STA spr_y_change						                                                    ; 
	CLC							                                                                ;
	ADC current_spr_y						                                                    ; + CURRENT SPR Y
	PHP							                                                                ; SAVE OVERFLOW STATUS = IF SPRITE GOES TO NEXT SCREEN
	
@check_if_sprite_above_below_split_screen:	
	CMP SPR_SCRIPT_TOP_OF_SCREEN_THRESHOLD						                                ; IS SPR Y < TOP OF SCREEN SPLIT THRESHOLD?
	BCC @set_sprite_offscreen						                                            ; YES->SET SPRITE Y = OFFSCREEN
	CMP SPR_SCRIPT_BOTTOM_OF_SCREEN_THRESHOLD						                            ; IS SPR Y > BOT OF SCREEN SPLIT THRESHOLD?
	BCS @set_sprite_offscreen						                                            ; YES->SET SPRITE Y = OFFSCREEN
	
	STA CUR_SPRITE_Y+4,X						                                                ; SET CURRENT SPRITE Y = Y LOCATION  
	TAY							                                                                ; 
	LDA spr_y_change						                                                    ; IS SPR Y OFFSET + DISTANCE TO MOVE SPRITE = MOVING DOWN
	AND #$80						                                                            ;
	BPL @set_name_table						                                                    ;
	LDA #$FF						                                                            ;

@set_name_table:							                                                    ; SET Y NAMETABLE = ONSCREEN OR OFFSCREEN
	PLP							                                                                ; =TEMP Y NAMETABLE  + CARRY + DIRECTION
	ADC current_name_table						                                                ; 
	AND #$01						                                                            ; IF VALUE = 1 = OFFSCREEN
	RTS							                                                                ; RETURN

@set_sprite_offscreen:							                                                ; SET SPRITE Y =  OFFSCREEN
	PLP							                                                                ; 
	LDA #SPRITE_OFFSCREEN						                                                ; SET CURRENT SPRITE Y = OFFSCREEN
	STA CUR_SPRITE_Y+4,X						                                                 ; 
	RTS							                                                                ; RETURN
	
_F}_CHECK_SPRITE_Y_LOC_VS_THRESHOLDS

_F{_UPDATE_SPRITE_SCROLL_SPEED																	; DONE

UPDATE_SPRITE_SCROLL_SPEED:			                                                            ; UPDATE Y or X SCROLL SPEED(Y= SCROLL SPEED INDEX)  RET SCROLL SPEED $45,$44

temp_scroll_speed	= LOCAL_7

	LDA (CURR_SPR_RAM_ADDR ),Y		                                                            ; LOAD SCROLL SPEED INCREASE
	TAX								                                                            ;
	INY								                                                            ;
	CLC								                                                            ;
	ADC (CURR_SPR_RAM_ADDR ),Y		                                                            ; = SCROLL SPEED INCREASE + SCROLL SPEED LOW BYTE
	STA (CURR_SPR_RAM_ADDR ),Y		                                                            ; SAVE SCROLL SPEED LOW (SUB PIXEL)
	STA temp_scroll_speed			                                                            ;
	INY								                                                            ;
	TXA								                                                            ;
	AND #$80						                                                            ;
	BPL @save_high_byte				                                                            ;
	LDA #$FF						                                                            ;
@save_high_byte:					                                                            ;
	ADC (CURR_SPR_RAM_ADDR ),Y		                                                            ;
	STA (CURR_SPR_RAM_ADDR ),Y		                                                            ; SAVE SCROLL SPEED HIGH
	STA temp_scroll_speed+1			                                                            ; 
	RTS								                                                            ; RETURN

_F}_UPDATE_SPRITE_SCROLL_SPEED		

_F{_ADD_SPRITE_IRQ_COUNTERS																		; DONE

ADD_IRQ_COUNTERS:					                                                            ; ADD IRQ Y COUNTERS (A=# COUNTERS TO ADD 0,1,2)

sprite_y_location = LOCAL_7

	STX sprite_y_location							                                              ; SAVE Y POS
	AND #$03						                                                            ; MAKE VALUE 0 TO 3
	TAX								                                                            ;
	LDA IRQ_0_COUNTER				                                                            ; = IRQ 0 COUNTER
	CPX #$01						                                                            ; 
	BEQ @exit						                                                            ; ANY MORE TO ADD? NO-> EXIT
	CLC								                                                            ;
	ADC IRQ_1_COUNTER				                                                            ; + IRQ 1 COUNTER
	CPX #$02						                                                            ;
	BEQ @exit						                                                            ; ANY MORE TO ADD? NO-> EXIT
	CLC								                                                            ;
	ADC IRQ_2_COUNTER				                                                            ; + IRQ 2 COUNTER	
@exit:								                                                            ; EXIT
	RTS								                                                            ; RETURN

_F}_ADD_SPRITE_IRQ_COUNTERS		
	
_F{_USE_SPRITE_OVERFLOW_TO_HIDE_SPRITES_ON_LINE													; DONE

USE_SPRITE_OVERFLOW_TO_HIDE_SPRITES_ON_LINE:							                        ; SET 8 SPRITES TO LEFT EDGE SET TO BLANK TILE(A= Y POS)

BOTTOM_CURRENT_SPRITE[]	= SPRITE_START + $04
sprite_y_pos			= LOCAL_7

	STA sprite_y_pos						                                                    ; SAVE SPRITE Y POS
	LDX SPRITE_SCRIPT_SPRITE_INDEX						                                        ; LOAD SPRITE INDEX
	LDY #MAX_SPRITES_PER_SCANLINE						                                        ; SET  NUMBER OF SPRITES TO UPDATE = 8
	
_WHILE NOT_EQUAL								                                                ; SET SPR ATTRIBUTES LOOP
	
	LDA sprite_y_pos							                                                ; SET SPRITE Y POS
	STA BOTTOM_CURRENT_SPRITE[],X						                                        ;
	LDA #SPRITE_SCRIPT_BLANK_TILE_ID						                                    ; SET SPRITE TILE = BLANK TILE
	STA BOTTOM_CURRENT_SPRITE[]+1,X						                                        ;
	LDA #$01						                                                            ; SET PALLETE SET = 2ND SET
	STA BOTTOM_CURRENT_SPRITE[]+2,X						                                        ;
	LDA #$00						                                                            ;
	STA BOTTOM_CURRENT_SPRITE[]+3,X						                                        ; SET SPRITE X  = LEFT EDGE 
	SET_X_INDEX_NEXT_SPRITE
	DEY								                                                            ; NUMBER OF SPRITES TO UPDATE--

_END_WHILE 						                                                                ; DONE? NO->SET SPR ATTRIBUTES LOOP
	
	STX SPRITE_SCRIPT_SPRITE_INDEX							                                                            ; SAVE SPRITE INDEX
	RTS								                                                            ; RETURN
	
_F}_USE_SPRITE_OVERFLOW_TO_HIDE_SPRITES_ON_LINE

_F{_DRAW_PLAYER_FACE										                                    ; DONE EXCEPT ADDR REFERENCE
								                                                                ; FACE DATA GENERAL STRUCTURE POINTERS AT 0X1C000	
								                                                                ; SUB DRAW HAIR
								                                                                ; SUB DRAW EYES 
								                                                                ; SUB DRAW EARS
								                                                                ; SUB DRAW NOSE AND MOUTH
								                                                                ; SUB DRAW NECK 
								                                                                ; SUB DRAW FOREHEAD 

DRAW_PLAYER_FACE:							                                                    ; DRAW PLAYER FACE(A= FACE POINTER INDEX)

current_face_data_addr				= 	LOCAL_1
face_id								=	LOCAL_3
face_data_ret_addr					= 	LOCAL_3

current_spr_attr_info				=   LOCAL_5
current_spr_y_offset				= 	LOCAL_6
current_face_x_offset				= 	LOCAL_7
entire_face_spr_y_offset			=   LOCAL_8

current_face_spr_y					= CUR_SPRITE_Y
current_face_spr_tile 				= CUR_SPRITE_TILE
current_face_spr_attr				= CUR_SPRITE_ATTR
current_face_spr_x					= CUR_SPRITE_X

FACE_Y_LOCATION_BITMASK				= $3F
FACE_X_LOCATION_BITMASK				= $3F
FACE_ATTRIBUTE_BITMASK				= $C0

START_OF_Y_OFFSET_FACE_COMMANDS		= $80
START_OF_JUMP_TO_ADDR_FACE_COMMANDS	= $A0 
START_OF_DO_ROUTINE_FACE_COMMANDS	= $C0
RETURN_TO_PREV_ADDR_FACE_COMMAND	= $FE

FACE_POINTERS						= $A000														; *** can replace on rebuild 
	
	STA face_id						                                                            ; SAVE FACE ID POINTER INDEX
	ROL								                                                            ; SHIFT SKIN COLOR BIT
	LDA #$00						                                                            ; SET SPRITE PALLETE INDEX = SKIN PALLETE INDEX + SKIN COLOR
	ADC #PLAYER_FACES_SPR_PAL_INDEX	                                                            ; 
	STA SPR_PAL_INDEX				                                                            ;
	LDX #PLAYER_FACES_DATA_BANK 	                                                            ; LOAD BANK 15
	JSR SWAP_A000_BANK				                                                            ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA #PLAYER_FACES_SPR_CHR_BANK_ONE						                                    ; SET CHR $1000 BANK = #$62
	STA SOFT_CHR_1000_BANK			                                                            ;
	LDA #PLAYER_FACES_SPR_CHR_BANK_TWO						                                    ; SET CHR $1400 BANK = #$63
	STA SOFT_CHR_1400_BANK			                                                            ;
	ASL face_id						                                                            ;
	LDA #$00						                                                            ;		
	ROL							                                                                ;
	STA face_data_ret_addr +1		                                                            ;
	LDA face_data_ret_addr		                                                                ;
	CLC							                                                                ;
	ADC #<FACE_POINTERS						                                                    ;
	STA face_data_ret_addr		                                                                ;
	LDA face_data_ret_addr + 1	                                                                ;
	ADC #>FACE_POINTERS					                                                        ; ADD HIGH BYTE OFFSET TO POINTERS TO FACE DATA AND COMMANDS
	STA face_data_ret_addr + 1	                                                                ;
	LDY #$00						                                                            ; SAVE ADDRESS TO START OF FACE TILES
	LDA (face_data_ret_addr),Y	                                                                ;
	STA current_face_data_addr		                                                            ;
	INY								                                                            ;
	LDA (face_data_ret_addr),Y	                                                                ;
	STA current_face_data_addr+1	                                                            ;
	LDA #$00						                                                            ; SET Y OFFSET FOR CURRENT FACE TILE
	STA current_spr_y_offset		                                                            ;
	
	LDX #$10						                                                            ; SET SPRITE INDEX = 5TH SPRITE

FACE_SCRIPT_LOOP:	
	
_WHILE ALWAYS						                                                            ; PROCESS FACE TILE DATA	
	LDY #$00						                                                            ; LOAD DATA
	LDA (current_face_data_addr),Y	 															; IS DATA = COMMAND
	BMI @process_face_command		                                                            ; YES-> PROCESS COMMAND
	

@update_sprite_info	

@set_face_spr_tile:
	STA current_face_spr_tile,X		                                                            ; SET SPRITE TILE ID = TILE ID
	INY								                                                            ; data addr ++ 
	
@set_face_spr_y_loc:	
	LDA (current_face_data_addr),Y	                                                            ; 
	AND #FACE_Y_LOCATION_BITMASK	                                                            ; MASK OUT MIRRORING INFO
	CLC								                                                            ;
	ADC current_spr_y_offset	                                                                ; + Y OFFSET FOR CURRENT FACE TILE
	CLC								                                                            ;
	ADC entire_face_spr_y_offset	                                                            ; + STARTING Y OFFSET
	STA current_face_spr_y,X		                                                            ; SET SPRITE Y LOC

@set_face_spr_attr:	
	LDA (current_face_data_addr),Y	                                                            ;
	AND #FACE_ATTRIBUTE_BITMASK		                                                            ;
	STA current_spr_attr_info		                                                            ;
	INY								                                                            ; data addr ++ 
	LDA (current_face_data_addr),Y	                                                            ;
	ROL								                                                            ;
	ROL								                                                            ;
	ROL								                                                            ;
	AND #$03						                                                            ;
	ORA current_spr_attr_info		                                                            ;
	STA current_face_spr_attr,X		                                                            ; SET SPRITE MIRRORING/PALLETE
	
@set_face_spr_x_loc:	
	LDA (current_face_data_addr),Y	                                                            ;
	AND #FACE_X_LOCATION_BITMASK	                                                            ;
	CLC								                                                            ;
	ADC current_face_x_offset		                                                            ;
	STA current_face_spr_x,X		                                                            ; SET SPRITE X LOC
	SET_X_INDEX_NEXT_SPRITE 
									                                                            ; DATA ADDR = DATA ADDR + DATA LENGTH (3 BYTES)
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] current_face_data_addr, $03 

_END_WHILE							                                                            ; JUMP-> PROCESS FACE TILE COMMANDS AND DATA
	
@process_face_command:				                                                            ; PROCESS COMMAND
	CMP #START_OF_JUMP_TO_ADDR_FACE_COMMANDS						
	BCS @do_commands						                                                ; NO-> CHECK FOR 0XA0-0XBF COMMAND
	
@set_current_y_offset_comman:	
	AND #$1F						                                                            ; SET CURRENT Y OFFSET
	CMP #$10						                                                            ;
	BCC @save_y_offset				                                                            ;
	
@set_y_offset_to_negative_direction	
	ORA #$F0						                                                            ;
	
@save_y_offset:						                                                            ; UPDATE Y OFFSET AND DATA ADDR
	STA current_spr_y_offset		                                                            ; Y OFFSET FOR CURRENT FACE TILE
	INC current_face_data_addr		                                                            ; DATA ADDR++
	BNE @exit_to_main_face_loop		                                                            ;
	INC current_face_data_addr+ 1	                                                            ;
	
@exit_to_main_face_loop:			                                                            ; 
	JMP FACE_SCRIPT_LOOP			                                                            ; JUMP-> PROCESS FACE TILE COMMANDS AND DATA
	
@do_commands:								                                           			; CHECK FOR 0XA0-0XBF COMMAND
	CMP #START_OF_DO_ROUTINE_FACE_COMMANDS						
	BCS @check_for_jsr_command		                                                            ; NO-> CHECK FOR 0XC0-0XDF COMMAND

@jump_to_new_face_data_addr			                                                            ; 0xA0-BF JUMP TO NEW ADDRESS COMMAND
	PHA								                                                            ; SAVE COMMAND VALUE
	INY								                                                            ; SET NEW ADDRESS LOW BYTE = NEXT DATA VALUE
	LDA (current_face_data_addr),Y	                                                            ;
	STA  current_face_data_addr		                                                            ;
	PLA								                                                            ; SET NEW ADDRESS HIGH BYTE = COMMAND VALUE
	STA current_face_data_addr +1	                                                            ;
	JMP FACE_SCRIPT_LOOP			                                                            ; JUMP-> PROCESS FACE TILE COMMANDS AND DATA
	
@check_for_jsr_command:								                                            ; CHECK FOR 0XC0-0XDF COMMAND
	CMP #$E0						                                                            ; IS COMMAND BETWEEN C0 - DF ?
	BCS @check_for_return_end		                                                            ; NO-> CHECK FOR FE,FF COMMAND
									                                                            ; 0XC0-DF JUMP TO NEW ADDRESS AND SAVE RETURN ADDRESS
									
@do_routine_and_return_command:
	PHA								                                                            ; SAVE COMMAND VALUE
	COPY_16_ZP_TO_ZP[source_dest] current_face_data_addr, face_data_ret_addr, 
	PLA								                                                            ; = COMMAND VALUE (0XC0 TO 0XDF) - 0X20
	SEC								                                                            ;
	SBC #$20						                                                            ;
	STA current_face_data_addr+1	                                                            ;
	INY								                                                            ; SET LOW BYTE OF NEW ADDRESS
	LDA (face_data_ret_addr),Y		                                                            ;
	STA current_face_data_addr		                                                            ; 
									                                                            ; DATA ADDR = DATA ADDR + COMMAND LENGTH (2 BYTES)
    ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] face_data_ret_addr, $02  	

	JMP FACE_SCRIPT_LOOP			                                                            ; JUMP-> PROCESS FACE TILE COMMANDS AND DATA
	
@check_for_return_end:				                                                            ; CHECK FOR FE,FF COMMAND
	CMP #RETURN_TO_PREV_ADDR_FACE_COMMAND						
	BNE @end_of_face_command		                                                            ; NO->0XFF COMMAND
	
@return_to_prev_adrr_command		                                                            ; 0XFE RETURN TO ADDRESS COMMAND
								
	COPY_16_ZP_TO_ZP[source_dest] face_data_ret_addr, current_face_data_addr 							
									                                                            ; 
	JMP FACE_SCRIPT_LOOP			                                                            ; JUMP-> PROCESS FACE TILE COMMANDS AND DATA

@end_of_face_command:				                                                            ; 0XFF END COMMAND
	RTS								                                                            ; RETURN FROM DRAW PLAYER FACE

_F}_DRAW_PLAYER_FACE

.PAD $A000,$FF