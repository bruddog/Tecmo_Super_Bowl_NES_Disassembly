
.BASE $8800 

_F{_PLAY_CALL_SCREEN_CONSTANTS

FLASHING_YARDLINE_SPR_Y							= SPRITE_START + $08
FLASHING_YARDLINE_SPR_TILE						= SPRITE_START + $09
FLASHING_YARDLINE_SPR_ATTR						= SPRITE_START + $0A
FLASHING_YARDLINE_SPR_X							= SPRITE_START + $0B
                                                                                   							
YARDLINE_SPR_Y_LOCATION									= $D4

COM_OFFENSE_CLEAR_MENU_DELAY							= $3C
COM_PLAY_SELECT_DELAY									= $1E
OFFSET_TO_SPECIAL_TEAMS_MENU_OPTION						= $06
TIMEOUT_MENU_AUTO_CLEAR_DELAY							= $78 

CANCEL_MENU_OPTION										= $00
TIMEOUT_MENU_OPTION										= $01 

SELECT_TEXT_ROWS		= $01
SELECT_TEXT_LENGTH		= $06

READY_TEXT_ROWS			= $01
READY_TEXT_LENGTH		= $07

OFFENSE_MENU_LENGTH		= $0E	
OFFENSE_MENU_HEIGHT		= $0C

DEFENSE_MENU_LENGTH		= $0C
DEFENSE_MENU_HEIGHT		= $08							                              ; A little extra

OFF_TIMEOUT_MENU_LENGTH = $0D
OFF_TIMEOUT_MENU_HEIGHT = $07

DEF_TIMEOUT_MENU_LENGTH = $0C
DEF_TIMEOUT_MENU_HEIGHT = $07

PLAY_CALL_STATUS_BAR_PPU_HEIGHT	= $80

_F}_PLAY_CALL_SCREEN_CONSTANTS

BANK_JUMP_START_PLAY_SELECT:
	JMP START_PLAY_SELECT                 		                                          ; START PLAY SELECT

BANK_JUMP_DRAW_PLAYBOOK:
	JMP DRAW_PLAYBOOK                     		                                          ; DRAW PLAYBOOK ()

BANK_JUMP_DO_PLAY_CHANGE_IN_TEAM_DATA
	JMP DO_PLAY_CHANGE_IN_TEAM_DATA       		                                          ; DRAW SCROLLING PLAY WINDOW FOR TEAM DATA PLAY CHANGE()

BANK_JUMP_DRAW_INITIAL_PLAY_NAME_PLAY_CHANGE:
	JMP DRAW_INITIAL_PLAY_NAME_PLAY_CHANGE		                                          ; DRAW NAME FOR INITIAL PLAY TO CHANGE ON TEAM DATA 

BANK_JUMP_DRAW_CURRENT_PLAY_NAME_PLAY_CHANGE:
	JMP DRAW_CURRENT_PLAY_NAME_PLAY_CHANGE                                                ; MOVE TO NEXT PLAY IN SCROLLING WINDOW

	JMP GET_OFFENSIVE_STYLES_AND_RUNNERS    	                                          ; SKP MODE()


												                                      ;*** can remove references later once
CHANGE_PLAYERS									= $8009
											




_F{_INIT_PLAY_CALL_SCREEN

START_PLAY_SELECT:
	SET_CLOCK_TO_PLAY_SELECT                                                          ; SLOWS DOWN CLOCK SPEED
@wait_irq_ppu_clear:                                                                  ; MAKE SURE INTERRUPT REQUEST IS CLEAR LOOP
	LDA CURR_IRQ_PPU_ADDR                                                             ; WAIT FOR PPU ADDR TO BE CLEARED
	BEQ DRAW_PLAY_SELECT_SCREEN_START                                                 ;
	RETURN_1_FRAME 
	JMP @wait_irq_ppu_clear                                                           ; LOOP BACK TO MAKE SURE INTERRUPT REQUEST IS CLEAR LOOP
	
DRAW_PLAY_SELECT_SCREEN_START:                                                        ; START OF PLAY SELECT DRAWING
	JSR CLEAR_BOTH_SCREENS_EXCEPT_STATUS_BAR                                          ; CLEAR PLAY GRAFX, NAMETABLE1, SPRITES (2080,2400 ADDRESS START			
	JSR CLEAR_TEAM_NAMES_AND_SELECT_READY_AREA                                        ; CLEAR PPU MEMORY TEAM NAMES,SELECT/READY()
	LDY #<PLAY_SELECT_SCREEN_IRQ_INFO                                                 ; something with IRQ SCREEN SPLIT
	LDX #>PLAY_SELECT_SCREEN_IRQ_INFO                                                 ;
	JSR LOAD_IRQ_SPLIT_DATA                                                           ; DRAW PLAY SELECT
	LDA #PLAY_SELECT_SCREEN_ID                                                        ; LOAD PLAY CALL BACKGROUND EVENT
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16					
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ; DRAW BACKGROUND()
	LDA #REDRAW_CLOCK_SCORE_BANNER_ID                                                 ; LOAD TEAM AND TIME BANNER INDEX 
	JSR DO_BANNER_ONCE_PREVIOUS_COMPLETE                                              ; WAIT TO LOAD BANNER SCENE UNTIL NONE PLAYING(A=BANNER)

@draw_p1_team_name:	
	LDY #<P1_TEAM_NAME_SELECT_READY_PPU_ADDR                                          ; SET PLAYER 1 TEAM NAME PPU ADDRESS
	LDX #>P1_TEAM_NAME_SELECT_READY_PPU_ADDR                                          ; 
	LDA P1_TEAM                                                                       ; LOAD P1 TEAM
	CLC                                                                               ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                                               ; 
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT                                                 ; DRAW PLAYER 1 TEAM NAME()	
	
@draw_p2_team_name:	
	LDY #<P2_TEAM_NAME_SELECT_READY_PPU_ADDR                                          ; SET PLAYER 2 TEAM NAME PPU ADDRESS
	LDX #>P2_TEAM_NAME_SELECT_READY_PPU_ADDR                                          ;
	LDA P2_TEAM                                                                       ; LOAD P2 TEAM 
	CLC                                                                               ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                                               ; 
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT                                                 ; DRAW PLAYER 2 TEAM NAME()	
	RETURN_1_FRAME

	JSR DRAW_PLAYBOOK                                                                 ; DRAW PLAYBOOK() 
	
temp_los_x			= LOCAL_8
	
@set_yardline_sprite_on_mini_field:	
	LDA #SPRITE_OFFSCREEN                                                             ; SET FLASHING YARDLINE SPRITE(Y) to OFFSCREEN
	STA FLASHING_YARDLINE_SPR_Y                                                       ;
	LDA #$00                                                                          ; SET FLASHING YARDLINE TILE to ARROW
	STA FLASHING_YARDLINE_SPR_TILE                                                    ;
	LDA POSSESSION_STATUS                                                             ; LOAD POSSESSION STATUS SET FLASHING YARDLINE MIRRORING				
	AND #$80                                                                          ;
	LSR                                                                               ;
	STA FLASHING_YARDLINE_SPR_ATTR                                                    ; 
												                                      ; SET FLASHING YARDLINE SPRITE(X) location
	LDA LOS_X+1                                                                       ; CONVERT LOS FILED LOCATION TO PPU ADDR
	STA temp_los_x                                                                    ; 
	LDA LOS_X                                                                         ;
	LSR temp_los_x                                                                    ; 
	ROR                                                                               ;
	LSR temp_los_x                                                                    ;
	ROR                                                                               ;
	LSR temp_los_x                                                                    ;
	ROR                                                                               ;
	SEC                                                                               ;
	SBC #$7E                                                                          ;
	BIT POSSESSION_STATUS                                                             ; LOAD POSSESSION STATUS
	BPL @save_los_spr_x_loc                                                           ;
	CLC                                                                               ;
	ADC #$05                                                                          ; MOVE FLASHING YARDLINE SPRITE(X) towars P2 side so it lines up right mirrored 

@save_los_spr_x_loc:
	STA FLASHING_YARDLINE_SPR_X                                                       ; SAVE FLASHING YARDLINE SPRITE(X) location
	LDA SOFT_PPU_CTRL                                                                 ; MAKE SURE BACKGROUND PATTERN TABLE ADDRESS is $0000 
	AND #%11011111                                                                    ;
	STA SOFT_PPU_CTRL                                                                 ;
	LDA #PLAY_CALL_SPRITES_CHR_BANK                                                   ; SET FIRST PPU CHR BANK TO 15 
	STA SOFT_CHR_1000_BANK                                                            ; 	
	RETURN_IN_NUM_FRAMES 2

@set_and_fade_in_palletes:	
	LDA #PLAY_CALL_SCREEN_BG_PAL_INDEX                                                ; SET BACK GROUND PALLETE
	LDX #PLAY_CALL_SCREEN_SPR_PAL_INDEX                                               ; SET SPR PALLETE
	JSR SET_AND_FADE_IN_BG_SPR_PAL                                                    ; PALETTE_FADE_IN()
	
@clear_play_call	
	LDA #$80                                                                          ; LOAD PLAY CALL NOT CHOSEN VALUE
	STA P1_PLAY_CALL                                                                  ; CLEAR P1 PLAY CALL
	STA P2_PLAY_CALL                                                                  ; CLEAR P2 PLAY CALL
	LDA #PLAY_CALL_SCREEN_BANK                                                        ; SET TASK 5 A000 BANK TO BANK 19
	STA READY_SELECT_YARDLINE_TASK + TASK_BANK_A000                                   ; 
	LDY #<(UPDATE_SELECT_READY_YARDLINE-1)                                            ; LOAD SELECT/READY INPUT CHECK ADDRESS
	LDA #>(UPDATE_SELECT_READY_YARDLINE-1)                                            ;
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR CREATE_TASK                                                                   ; CREATE TASK(Y,A= ADDRESS, X= TASK INDEX)
	LDA POSSESSION_STATUS                                                             ; LOAD POSSESSION STATUS
	BPL @p1_on_offense_create_task                                                    ; DOES P1 HAVE BALL? YES-> BRANCH to PLAYER 1 OFFENSE create task
	
@p2_on_offense_create_task:	
	LDA #PLAY_CALL_SCREEN_BANK                                                        ; SET TASK 2 A000 BANK 
	STA DEFENSE_PLAYCALL_TASK + TASK_BANK_A000                                        ;
	LDY #<(P1_ON_D_PLAYCALL_START-1)                                                  ; LOAD P1 DEFENSE THREAD ADDRESS
	LDA #>(P1_ON_D_PLAYCALL_START-1)                                                  ;	 
	LDX #DEFENSE_PLAYCALL_TASK                                                        ; LOAD TASK 2 INDEX 
	JSR CREATE_TASK                                                                   ; CREATE TASK(Y,A= ADDRESS, X= TASK INDEX)
	JMP P2_ON_OFFENSE_PLAY_SELECT_START                                               ; JUMP to PLAYER 2 OFFENSE START

@p1_on_offense_create_task:                                                           ; PLAYER 1 OFFENSE START
	LDA #PLAY_CALL_SCREEN_BANK                                                        ; SET TASK 2 A000 BANK T
	STA DEFENSE_PLAYCALL_TASK + TASK_BANK_A000                                        ; 
	LDY #<(P2_ON_DEFENSE_PLAYCALL_START-1)                                            ; LOAD P2 DEFENSE THREAD ADDRESS
	LDA #>(P2_ON_DEFENSE_PLAYCALL_START-1)                                            ;
	LDX #DEFENSE_PLAYCALL_TASK                                                        ; LOAD  TASK 2 INDEX
	JSR CREATE_TASK                                                                   ; CREATE TASK(Y,A= ADDRESS, X= TASK INDEX)
	
_F}_INIT_PLAY_CALL_SCREEN

_F{_P1_ON_OFFENSE_PLAYCALL

P1_ON_OFFENSE_START:
	LDA TEAM_CONTROL_TYPES                                                            ; LOAD PLAYER TYPES
	AND #$E0                                                                          ; IS P1 COM?                   
	BNE P1_COM_ON_OFFENSE_START                                                       ; YES-> BRANCH TO P1 COM OFFENSE START
	
@check_for_4th_down_bring_up_menu	
	LDA DOWN                                                                          ; IS DOWN 4th DOWN?
	CMP #FOURTH_DOWN                                                                  ;
	BCC P1_MAN_OFFENSE_START                                                          ; NO->BRANCH TO P1 MAN OFFENSE START	
	JMP P1_OFFENSIVE_MENU_START
	
P1_MAN_OFFENSE_START:                                                                 ; P1 MAN OFFENSE START					 
	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	JSR GET_P1_CONTROLLER_INPUT_PLAY_SELECT                                           ; GET P1 CONTROLLER INPUT()
	BCC @no_direction_pressed                                                         ; A or B PRESSED WITH DIRECTION? NO-> P1 NO DIRECTION PRESSED
	JMP P1_OFFENSE_SAVE_PLAY_CALL                                                     ; YES->JUMP to P1 OFFENSE STORE PLAY CALL 

@no_direction_pressed:                                                                ; P1 NO DIRECTION PRESSED
	BVS P1_MAN_OFFENSE_START                                                          ;
	LDA JOY_PRESS_1                                                                   ; LOAD P1 JOYPAD PRESS 
	BPL P1_MAN_OFFENSE_START                                                          ; B button pressed? YES-> LOOP BACK TO P1 MAN OFFENSE START
	JMP P1_OFFENSIVE_MENU_START                                                       ; "A" button pressed JUMP TO go to P1 OFFENSE MENU START 

play_call_temp	= LOCAL_3	
	
P1_COM_ON_OFFENSE_START:                                                              ; P1 COM OFFENSE START
	JSR P1_ON_OFF_SET_VALUE_FOR_CPU_PLAY_CALL_LOGIC                                
	LDA play_call_temp                                                                ; SAVE PLAY VALUE

@check_for_P1_com_take_timeout:	
	STA CPU_P1_PLAY_CALL                                                              ; 
	LDA CPU_OFF_TIMEOUTS                                                              ; NEW NUMBER OF TIMEOUTS = OLD NUMBER OF TIMEOUTS?
	CMP P1_TIMEOUTS                                                                   ; 
	BEQ CHECK_P1_COM_OFF_PLAYCALL                                                     ; YES-> BRANCH TO P1 CHECK COM PLAY CALL
	
@do_p1_com_offense_menu	
	JSR DRAW_P1_OFFENSIVE_MENU                                                        ; DRAW P1 OFFENSIVE MENU()
	LDA #TIMEOUT_MENU_OPTION	                                                      ; LOAD TIME OUT OPTION
	JSR DO_P1_COM_SELECT_MENU_OPTION                                                  ; P1 COM SELECTS MENU OPTION (A= CHOICE)
	JSR DO_P1_TIMEOUT                                                                 ; BRING UP P1 TIME OUT SUB MENU()
	LDA #SPRITE_OFFSCREEN                                                             ; SET MENU ARROW (Y) TO OFFSCREEN
	STA MENU_ARROW_SPR_Y                                                              ;
	LDX #COM_OFFENSE_CLEAR_MENU_DELAY                                                 ; LOAD DELAY TIME
	
_WHILE NOT_EQUAL      

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER, IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	DEX                                                                               ; DECREASE TIMER
	
_END_WHILE 

	JSR RESTORE_SCREEN_COVERED_BY_P1_TIMEOUT                                          ; CLEAR P1 TIME OUT SUB MENU PPU()
	RETURN_IN_NUM_FRAMES 8
	JSR RESTORE_SCREEN_COVERED_BY_P1_MENU                                             ; RESTORE SCREEN COVERED BY MENU
	RETURN_IN_NUM_FRAMES 8

CHECK_P1_COM_OFF_PLAYCALL:                                                            ; P1 CHECK COM PLAY CALL
	LDA CPU_P1_PLAY_CALL                                                              ; LOAD COM PLAY CALL
	CMP #PUNT_PLAY_CALL_ID                                                            ; IS PLAY  FG or PUNT 
	BCC @do_p1_com_off_regular_play_call                                              ; NO-> 
	
	
@do_P1_com_off_fg_punt_playcall:	
	JSR DRAW_P1_OFFENSIVE_MENU                                                        ; DRAW P1 OFFENSIVE MENU()
	LDA CPU_P1_PLAY_CALL                                                              ; LOAD COM PLAY CALL
	SEC                                                                               ; SET INDEX FOR COM SPECIAL TEAMS SELECTION 
	SBC #OFFSET_TO_SPECIAL_TEAMS_MENU_OPTION	                                      ; 
	JSR DO_P1_COM_SELECT_MENU_OPTION                                                  ; P1 COM SELECTS MENU OPTION (A= CHOICE) 
	
	LDX #COM_PLAY_SELECT_DELAY                                                        ; LOAD SPECIAL TEAMS MENU TIMER VALUE
_WHILE NOT_EQUAL                                                                      ; P1 COM SPECIAL TEAMS MENU WAIT LOOP
	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER, IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	DEX                                                                               ; IS SPECIAL TEAMS MENU TIMER DONE?
_END_WHILE

	JSR END_OFF_AND_DRAW_TASK_AFTER_PPU_TRANS_DONE                            
	LDA CPU_P1_PLAY_CALL                                                              ; LOAD COM PLAY CALL
	JMP P1_OFFENSE_CHOOSES_SPECIAL_TEAMS_PLAY                                         ; JUMP TO P1 OR COM PICKS FG/PUNT

@do_p1_com_off_regular_play_call:                                                     ; SET P1 COM REGULAR PLAY DELAY	
	LDA RANDOM_1                                                                      ; MAKE DELAY 30-37 FRAMES
	AND #$07                                                                          ;
	CLC                                                                               ;
	ADC #COM_PLAY_SELECT_DELAY                                                        ; 
	TAX                                                                               ; 
	
_WHILE NOT_EQUAL                                                                      ; P1 COM PICKS PLAY LOOP 
	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER, IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	DEX                                                                               ; IS COM REGULAR PLAY TIMER DONE?
_END_WHILE
	LDA CPU_P1_PLAY_CALL                                                              ; LOAD COM PLAY CALL
	JMP P1_OFFENSE_SAVE_PLAY_CALL                                                     ; JUMP TO P1 SAVE PLAY CALL

P1_OFFENSIVE_MENU_START:                                                              ; P1 OFFENSE MENU START
	JSR DRAW_P1_OFFENSIVE_MENU                                                        ; DRAW P1 OFFESIVE MENU()

SET_P1_OFF_MENU_TO_FIRST_OPTION:                                                      ; P1 SET OFFENSE MENU ARROW TO FIRST SPOT
	LDA #CANCEL_MENU_OPTION                                                           ; SET MENU INDEX TO FIRST OPTION
	STA MENU_INDEX                                                                    ; 
	LDY #<P1_OFFENSE_MENU_INFO                                                        ; LOAD OFFENSIVE MENU INFO ADDRESS
	LDX #>P1_OFFENSE_MENU_INFO                                                        ;
	LDA #P1_SIDE_ID                                                                   ;
	JSR SET_MENU_ARROW_OPTIONS                                                        ; INITIALIZE MENU OPTIONS(X,Y= ADDRESS, A= PLAYER JOY)
	
_WHILE VALUE_CLEAR                                                                    ; P1 ON OFFENSE MENU LOOP

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER,IF OVER DO FADE OUT AND SCOREBOARD() and return
	JSR CHECK_MENU_ARROW_UP_DOWN                                                      ; CHECK FOR CURSOR MOVED UP OR DOWN()
	JSR UPDATE_MENU_ARROW_SPR_Y                                                       ; SET ARROW NEW Y COORDINATE()
	BIT JOY_PRESS_1                                                                   ; 
	BMI @do_menu_choice                                                               ; WAS "A"  pressed?

_END_WHILE

	LDA #CANCEL_MENU_OPTION                                                           ; if "B" pressed SET MENU INDEX to CANCEL 
	STA MENU_INDEX                                                                    ; 
	
@do_menu_choice:
	RTS_JUMP_TABLE[memVal_tableAddr]  MENU_INDEX, P1_OFFENSE_MENU_COMMAND_TABLE

P1_OFFENSE_MENU_COMMAND_TABLE:                                                        ; COMMAND TABLE
	.WORD P1_OFFENSE_MENU_CANCEL-1                                                    ; CANCEL
	.WORD P1_OFFENSE_MENU_TIMEOUT-1                                                   ; TIMEOUT
	.WORD P1_OFFENSE_MENU_PUNT-1                                                      ; PUNT
	.WORD P1_OFFENSE_MENU_FG-1                                                        ; FG
	.WORD P1_OFFENSE_MENU_CHANGE_PLAYERS-1                                            ; PLAYER CHANGE

P1_OFFENSE_MENU_CANCEL:                                                               ; P1 CANCEL
	JSR RESTORE_SCREEN_COVERED_BY_P1_MENU                                             ; RESTORE SCREEN COVERED BY MENU
	JMP P1_MAN_OFFENSE_START                                                          ; return to play call loop

P1_OFFENSE_MENU_TIMEOUT:                                                              ; P1 TIMEOUT
	LDA P1_TIMEOUTS                                                                   ; LOAD P1 TIMEOUTS	
	BEQ SET_P1_OFF_MENU_TO_FIRST_OPTION                                               ; NO timeouts left BRANCH TO P1 SET OFF MENU ARROW TO FIRST SPOT
	LDA CLOCK_RUN_TYPE                                                                ; LOAD CLOCK STATUS
	BPL SET_P1_OFF_MENU_TO_FIRST_OPTION                                               ; IF CLOCK NOT RUNNING JUMP TO P1 SET OFF MENU ARROW TO FIRST SPOT
	JSR DO_P1_TIMEOUT                                                                 ; BRING UP P1 TIME OUT SUB MENU()
	
	LDX #TIMEOUT_MENU_AUTO_CLEAR_DELAY                                                ; LOAD MENU CLEAR DELAY 
_WHILE NOT_EQUAL                                                                      ;

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER...IF OVER DO FADE OUT AND SCOREBOARD AND RETURN
	LDA JOY_PRESS_1                                                                   ; LOAD P1 BUTTON PRESS
	AND #(A_BUTTON + B_BUTTON )                                                       ; IS "A" or "B"?
	BNE @clear_p1_off_timout_menu                                                     ; YES->pressed clear timeout sub menu and exit to offense menu
	DEX                                                                               ; else loop until delay is done
	
_END_WHILE 
	
@clear_p1_off_timout_menu:                                                            ; CLEAR TIMEOUT SUB MENU and JUMP TO P1 SET OFF MENU ARROW TO FIRST SPOT
	JSR RESTORE_SCREEN_COVERED_BY_P1_TIMEOUT                                          ; CLEAR P1 TIME OUT SUB MENU PPU()
	JMP SET_P1_OFF_MENU_TO_FIRST_OPTION                                               ; JUMP to P1 SET OFFENSE MENU ARROW TO FIRST SPOT
	
P1_OFFENSE_MENU_PUNT:                                                                 ; 
	LDA #PUNT_PLAY_CALL_ID                                                            ; LOAD PUNT PLAY CODE
	JMP P1_OFFENSE_CHOOSES_SPECIAL_TEAMS_PLAY                                         ; go to P1 OR COM PICKS FG/PUNT
	
P1_OFFENSE_MENU_FG:
	LDA #FG_PLAY_CALL_ID                                                              ; LOAD FG PLAY CODE
	JMP P1_OFFENSE_CHOOSES_SPECIAL_TEAMS_PLAY                                         ; go to P1 OR COM PICKS FG/PUNT

P1_OFFENSE_MENU_CHANGE_PLAYERS:                                                       ; P1 CHANGE PLAYERS
	JSR END_OFF_AND_DRAW_TASK_AFTER_PPU_TRANS_DONE                                
	LDA P1_TEAM                                                                       ; LOAD PLAYER 1 TEAM
	STA CURRENT_TEAM                                                                  ; SAVE in CURRENT TEAM
	SUSPEND_TASK_DIRECT[task] UPDATE_CLOCK_TASK 
	LDA #$00                                                                          ; SET SUB CONTROL IS MAN
	STA SUB_CONTROL_TYPE                                                              ; 
	LDA #MAIN_GAME_BANK_1                                                             ; BANK17					
	LDY #<CHANGE_PLAYERS                                                              ; LOAD CHANGE PLAYERS ADDRESS
	LDX #>CHANGE_PLAYERS                                                              ;
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                                                ; bank_swap_8000_jump
	LDX #UPDATE_CLOCK_TASK                                                            ; LOAD TASK 0
	JSR RESUME_TASK                                                                   ; RESUME TASK (X=TASK)
	JSR SET_BG_SPR_FULLY_FADED_OUT                                                    ; PALETTE_FADE_OUT()
	JMP BANK_JUMP_START_PLAY_SELECT                                                   ; JUMP TO MAIN LOOP TO REDRAW() *** jumps to a jump could fix 

data_addr	= LOCAL_1	
	
P1_OFFENSE_SAVE_PLAY_CALL:                                                            ; P1 OFFENSE SAVE PLAY CALL
	STA P1_PLAY_CALL                                                                  ; SAVE P1 PLAY CALL 
	PLAY_SOUND_ID PLAY_SELECTED_SOUND
	
	LDY #<P1_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD PPU ADDRESS FOR P1 READY
	LDX #>P1_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDA #<READY_TEXT_INFO                                                             ; LOAD READY DATA AND CONTROL INFO ADDRESS
	STA data_addr                                                                     ;
	LDA #>READY_TEXT_INFO                                                             ;
	STA data_addr+1                                                                   ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	SET_CLOCK_TO_STOPPED
	
_WHILE MINUS                                                                          ; P1 PICKED PLAY WAIT FOR P2 PLAY 

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER...IF OVER DO FADE OUT AND SCOREBOARD AND RETURN  
	LDA P2_PLAY_CALL                                                                  ; LOAD P2 PLAY   
	
_END_WHILE                                                                            ; PLAY PICKED? NO-> LOOP BACK TO P1 PICKED PLAY WAIT FOR P2 PLAY

	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                                        ; SET TASK TO TERMINATED(X=TASK)
	RETURN_IN_NUM_FRAMES 60
	JSR FADE_OUT_BG_SPR_PAL                                                           ; FADE PALLETE()
	LDA #SPRITE_OFFSCREEN                                                             ; SET FLASHING YARDLINE SPRITE(Y) to offscreen
	STA FLASHING_YARDLINE_SPR_Y                                                       ; 
	JMP CLEAR_TEAM_NAMES_AND_SELECT_READY_AREA                                        ; CLEAR PPU MEMORY TEAM NAMES,SELECT/READY()

P1_OFFENSE_CHOOSES_SPECIAL_TEAMS_PLAY:                                                ; P1 OR COM PICKS FG/PUNT
	STA P1_PLAY_CALL                                                                  ; SAVE P1 PLAY CALL
	JSR END_OFF_AND_DRAW_TASK_AFTER_PPU_TRANS_DONE                                    ; CHECK FOR PPU TRANSFER DONE THEN KILL TASK 2, TASK5 ()
	LDY #<P1_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD PPU ADDRESS FOR P1 READY
	LDX #>P1_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDA #<READY_TEXT_INFO                                                             ; LOAD READY DATA AND CONTROL INFO ADDRESS
	STA data_addr                                                                     ;
	LDA #>READY_TEXT_INFO                                                             ;
	STA data_addr+1                                                                   ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	PLAY_SOUND_ID PLAY_SELECTED_SOUND
	SET_CLOCK_TO_STOPPED

num_tiles			= LOCAL_1	
lines 				= LOCAL_2

@clear_p2_slect_ready_after_p1_picks_st		 	                                      ; CLEAR P2 READY PPU
	LDY #<P2_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD PPU ADDRESS FOR P2 READY
	LDX #>P2_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDA #$01                                                                          ; LOAD # LINES
	STA lines                                                                         ;
	LDA #READY_TEXT_LENGTH                                                            ; LOAD LENGTH
	STA num_tiles                                                                     ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                                                   ; CLEAR PPU(X,Y= ADDR, 3F= NUM lines, 3E= length)
	RETURN_IN_NUM_FRAMES 60
	JSR FADE_OUT_BG_SPR_PAL                                                           ; FADE PALLETE
	LDA #SPRITE_OFFSCREEN                                                             ; SET FLASHING YARDLINE SPRITE(Y) to OFFSCREEN
	STA FLASHING_YARDLINE_SPR_Y                                                       ; 
	JMP CLEAR_TEAM_NAMES_AND_SELECT_READY_AREA                                        ; CLEAR PPU MEMORY TEAM NAMES,SELECT/READY()
								
_F}_P1_ON_OFFENSE_PLAYCALL

_F{_P1_ON_DEFENSE_PLAYCALL
								
P1_ON_D_PLAYCALL_START:                                                               ; PLAYER 1 DEFENSE START
	LDX #PLAYCALL_DEFENSE_STACK_INDEX                                                 ; SET STACK LOCATION
	TXS                                                                               ;
	LDA TEAM_CONTROL_TYPES                                                            ; IS PLAYER 1 COM?
	AND #$E0                                                                          ;
	BNE P1_COM_ON_DEFENSE_START                                                       ; YES-> BRANCH TO PLAYER 1 COM DEFENSE MENU 
	
P1_MAN_DEFENSE_INPUT_CHECK:                                                           ; PLAYER 1 DEFENSE INPUT CHECK
	RETURN_1_FRAME
	JSR GET_P1_CONTROLLER_INPUT_PLAY_SELECT                                           ; GET PLAYER 1 BUTTON INPUT()
	BCC @no_direction_pressed                                                         ; 
	JMP P1_DEFENSE_SAVE_PLAY_CALL                                                     ; PLAY PICKED? YES-> JUMP TO P1 DEFENSE PLAY PICKED
@no_direction_pressed:
	BVS P1_MAN_DEFENSE_INPUT_CHECK                                                    ; ONLY B PRESSED?-> LOOP BACK TO PLAYER 1 DEFENSE INPUT CHECK 
	LDA JOY_PRESS_1                                                                   ; 
	BPL P1_MAN_DEFENSE_INPUT_CHECK                                                    ; DIRECTION ONLY-> LOOP BACK TO PLAYER 1 DEFENSE INPUT CHECK
	JMP DO_P1_DEFENSIVE_MENU                                                          ; ONLY A PRESSED-> JUMP TO BRING UP P1 DEFENSIVE MENU
	
temp_play_call	= LOCAL_3	

P1_COM_ON_DEFENSE_START:                                                              ; PLAYER 1 IS COM DEFENSE START
	JSR P1_ON_DEF_SET_VALUE_FOR_CPU_PLAY_CALL_LOGIC                                   ; P1 ON D LOAD VALUES(DOWN, YDLN, & DO COM PLAY LOGIC)
	LDA temp_play_call                                                                ; LOAD COM PLAY CALL
	STA CPU_P1_PLAY_CALL                                                              ; SAVE IN $8E
	LDA CPU_OFF_TIMEOUTS                                                              ; NEW TIMEOUTS LEFT = OLD TIMEOUTS LEFT?
	CMP P1_TIMEOUTS                                                                   ;
	BEQ @p1_com_picks_play                                                            ; YES-> BRANCH TO P1 COM D PICKS PLAY
	
@p1_com_defense_takes_timeout:	
	JSR DRAW_P1_DEFENSE_MENU                                                          ; DRAW P1 DEFENSE MENU() 
	LDA #TIMEOUT_MENU_OPTION	                                                      ;
	JSR DO_P1_COM_SELECT_MENU_OPTION                                                  ; P1 COM SELECTS MENU OPTION (A= CHOICE)
	JSR DO_P1_DEF_TIMEOUT                                                             ; USE TIMEOUT ROUTINE()
	LDA #SPRITE_OFFSCREEN                                                             ; SET MENU ARROW (Y) TO OFFSCREEN
	STA MENU_ARROW_SPR_Y                                                              ;
	RETURN_IN_NUM_FRAMES 120
	JSR RESTORE_SCREEN_COVERED_BY_P1_TIMEOUT                                          ; CLEAR P1 TIME OUT SUB MENU PPU()
	RETURN_IN_NUM_FRAMES 8
	JSR RESTORE_SCREEN_COVERED_BY_P1_MENU                                             ; RESTORE SCREEN COVERED BY MENU
	RETURN_IN_NUM_FRAMES 8
	
@p1_com_picks_play:                                                                   ; P1 COM D PICKS PLAY
	LDA RANDOM_1                                                                      ; MAKE TIME 30-37 FRAMES
	AND #$07                                                                          ;
	CLC                                                                               ;
	ADC #COM_PLAY_SELECT_DELAY                                                        ;
	JSR DELAY_TASK                                                                    ; SWITCH TASKS( A= # FRAMES BEFORE RETURNING
	LDA CPU_P1_PLAY_CALL                                                              ; LOAD COM PLAY CALL
	JMP P1_DEFENSE_SAVE_PLAY_CALL
	
DO_P1_DEFENSIVE_MENU:                                                                 ; BRING UP P1 DEFENSIVE MENU
	JSR DRAW_P1_DEFENSE_MENU                                                          ; DRAW P1 DEFENSE MENU()
	
P1_DEFENSE_SET_MENU_TO_FIRST_OPTION:                                                  ; P1 DEFENSE MENU SET ARROW TO FIRST OPTION
	LDA #CANCEL_MENU_OPTION                                                           ; SET ARROW TO FIRST OPTION
	STA MENU_INDEX                                                                    ;
	LDY #<P1_DEFENSE_MENU_INFO                                                        ; LOAD P1 DEFENSE OPTION MENU TABLE ADDRESS
	LDX #>P1_DEFENSE_MENU_INFO                                                        ;
	LDA #P1_SIDE_ID                                                                   ; SET PLAYER JOY TO P1 
	JSR SET_MENU_ARROW_OPTIONS                                                        ; INITIALIZE MENU OPTIONS(X,Y= ADDRESS, A= PLAYER JOY)

_WHILE VALUE_CLEAR:                                                                   ; P1 DEFENSE MENU INPUT LOOP

	RETURN_1_FRAME
	JSR CHECK_MENU_ARROW_UP_DOWN                                                      ; CHECK FOR ARROW MOVED UP OR DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                                       ; SET ARROW NEW Y COORDINATE()
	BIT JOY_PRESS_1                                                                   ;
	BMI @do_p1_def_menu_choice                                                        ; A PRESSED? YES->BRANCH TO DO P1 DEFENSE MENU OPTION SELECTED
	
_END_WHILE                                                                            ; B PRESSED? NO-> LOOP BACK TO P1 DEFENSE MENU INPUT LOOP 
	
	LDA #CANCEL_MENU_OPTION                                                           ; YES->SET OPTION TO CANCEL
	STA MENU_INDEX 
@do_p1_def_menu_choice:                                                               ; P1 DEFENSE MENU OPTION SELECTED
	RTS_JUMP_TABLE[memVal_tableAddr]  MENU_INDEX, P1_DEFENSE_MENU_COMMAND_TABLE
	
P1_DEFENSE_MENU_COMMAND_TABLE:                                                        ; P1 DEFENSIVE MENU OPTIONS TABLE
	.WORD P1_DEFENSE_CANCEL-1                                                         ; CANCEL
	.WORD P1_DEFENSE_TIMEOUT-1                                                        ; TIMEOUT

P1_DEFENSE_CANCEL:                                                                    ; P1 DEFENSE CANCEL
	JSR RESTORE_SCREEN_COVERED_BY_P1_MENU                                             ; RESTORE SCREEN COVERED BY MENU
	JMP P1_ON_D_PLAYCALL_START                                                        ; JUMP TO PLAYER 1 DEFENSE START

P1_DEFENSE_TIMEOUT:                                                                   ; P1 DEF TIMEOUT
	LDA P1_TIMEOUTS                                                                   ; LOAD P1 TIMEOUTS
	BEQ P1_DEFENSE_SET_MENU_TO_FIRST_OPTION                                           ; ANY LEFT? NO-> LOOP BACK TO P1 DEFENSE SET ARROW TO FIRST OPTION
	LDA CLOCK_RUN_TYPE                                                                ; LOAD CLOCK STATUS
	BPL P1_DEFENSE_SET_MENU_TO_FIRST_OPTION                                           ; IS IT STOPPED? YES-> LOOP BACK TO P1 DEFENSE SET ARROW TO FIRST OPTION
	JSR DO_P1_DEF_TIMEOUT                                                             ; USE P1 TIMEOUT ROUTINE()
	
	LDX #TIMEOUT_MENU_AUTO_CLEAR_DELAY                                                ; LOAD SUBMENU DELAY
_WHILE NOT_EQUAL                                                                      ; P1 CLEAR DEFENSIVE TIMEOUT WAIT

	RETURN_1_FRAME
	LDA JOY_PRESS_1                                                                   ; LOAD P1 BUTTON PRESS		
	AND #(A_BUTTON + B_BUTTON )                                                       ; IS "A" or "B"?
	BNE @clear_p1_defense_timeout_menu                                                ; YES->
	DEX                                                                               ; DECREASE TIMER
_END_WHILE                                                                            ; TIMER DONE? NO-> LOOP BACK TO P1 CLEAR DEFENSIVE TIMEOUT WAIT
	
@clear_p1_defense_timeout_menu:                                                       ; P1 CLEAR DEFENSIVE TIMEOUT SUBMENU
	JSR RESTORE_SCREEN_COVERED_BY_P1_TIMEOUT                                          ; CLEAR P1 TIME OUT SUB MENU PPU()
	JMP P1_DEFENSE_SET_MENU_TO_FIRST_OPTION                                           ; JUMP TO P1 DEFENSE MENU SET ARROW TO FIRST OPTION
	LDA #CANCEL_MENU_OPTION                                                           ; *** CODE NOT NEEDED PERFORMED BY ROUTINE ABOVE
	STA MENU_INDEX                                                                    ; 
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                               
	LDY #<$2164                                                                       ;			
	LDX #>$2164                                                                       ;
	LDA #<$6103                                                                       ;
	STA $3E                                                                           ;
	LDA #>$6103                                                                       ;
	STA $3F                                                                           ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X=TASK)
	JMP P1_DEFENSE_SET_MENU_TO_FIRST_OPTION       
	
data_addr		= LOCAL_1	
	
P1_DEFENSE_SAVE_PLAY_CALL:                                                            ; P1 DEFENSE PLAY PICKED
	STA P1_PLAY_CALL                                                                  ; SAVE PLAY CALL
	PLAY_SOUND_ID PLAY_SELECTED_SOUND
	LDY #<P1_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD PPU ADDRESS FOR P1 READY
	LDX #>P1_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDA #<READY_TEXT_INFO                                                             ; LOAD READY DATA AND CONTROL INFO ADDRESS
	STA data_addr                                                                     ;
	LDA #>READY_TEXT_INFO                                                             ;
	STA data_addr +1                                                                  ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU (Y,X= PPU ADDR, 3E,3F DATA AND CONTROL ADDRESS)
	JMP END_CURRENT_TASK                                                              ; END CURRENT TASK()

_F}_P1_ON_DEFENSE_PLAYCALL	

_F{_P2_ON_OFFENSE_PLAYCALL
	
P2_ON_OFFENSE_PLAY_SELECT_START:                                                      ; PLAYER 2 OFFENSE START
	LDA TEAM_CONTROL_TYPES                                                            ; LOAD PLAYER TYPES
	AND #$0E                                                                          ; IS P1 COM?  
	BNE P2_COM_ON_OFFENSE_START                                                       ; YES-> BRANCH TO P2 COM OFFENSE START

@check_for_4th_down_bring_up_menu	
	LDA DOWN                                                                          ; IS DOWN 4th DOWN?
	CMP #FOURTH_DOWN                                                                  ; 
	BCC P2_MAN_OFFENSE_START                                                          ; NO->BRANCH TO P2 MAN OFFENSE START	
	JMP DO_P2_OFFENSE_MENU                                                            ;
	
P2_MAN_OFFENSE_START:                                                                 ; P2 MAN OFFENSE START
	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	JSR GET_P2_CONTROLLER_INPUT_PLAY_SELECT                                           ; GET P2 CONTROLLER INPUT()
	BCC @no_direction_pressed                                                         ; A or B PRESSED WITH DIRECTION? NO->
	JMP P2_OFFENSE_SAVE_PLAY_CALL                                                     ; YES->JUMP to P2 OFFENSE STORE PLAY CALL

@no_direction_pressed:                                                                ; P2 OFFENSE NO DIRECTION PRESSED
	BVS P2_MAN_OFFENSE_START                                                          ; B PRESSED ONLY? LOOP BACK TO P2 MAN OFFENSE START
	LDA JOY_PRESS_2                                                                   ; LOAD P2 JOYPAD PRESS
	BPL P2_MAN_OFFENSE_START                                                          ; DIERECTION ONLY pressed? YES-> LOOP BACK TO P2 MAN OFFENSE START
	JMP DO_P2_OFFENSE_MENU                                                            ; "A" button pressed JUMP TO go to P2 OFFENSE MENU START
	
play_call_temp	= LOCAL_3		

P2_COM_ON_OFFENSE_START:                                                              ; COM P2 OFFENSE
	JSR P2_ON_OFF_SET_VALUE_FOR_CPU_PLAY_CALL_LOGIC                                   ; LOAD VALUES(DOWN, YARDLINE, ETC FOR P2 COM LOGIC THEN DO COM PLAY LOGIC) 

@check_for_P2_com_take_timeout:	
	LDA play_call_temp                                                                ; SAVE P2 COM P2 PLAY  IN $8F
	STA CPU_P2_PLAY_CALL                                                              ; 
	LDA CPU_OFF_TIMEOUTS                                                              ; NEW NUMBER OF TIMEOUTS = CURRENT P2 TIMEOUTS
	CMP P2_TIMEOUTS                                                                   ;
	BEQ CHECK_P2_COM_PLAYCALL                                                         ; YES-> BRANCH TO P2 CHECK COM PLAY CALL
	
@do_p2_com_offense_menu		
	JSR DRAW_P2_OFFENSIVE_MENU                                                        ; DRAW P2 OFFENSIVE MENU()
	LDA #TIMEOUT_MENU_OPTION                                                          ; LOAD TIME OUT OPTION
	JSR DO_P2_COM_SELECT_MENU_OPTION                                                  ; P2 COM SELECTS MENU OPTION (A= CHOICE)
	JSR DO_P2_OFF_TIMEOUT                                                             ; BRING UP P2 TIME OUT SUB MENU()
	LDA #SPRITE_OFFSCREEN                                                             ; SET MENU ARROW (Y) TO OFFSCREEN
	STA MENU_ARROW_SPR_Y                                                              ;
	LDX #COM_OFFENSE_CLEAR_MENU_DELAY                                                 ; LOAD DELAY TIMER 
	
_WHILE NOT_EQUAL                                                                      ; DELAY LOOP START

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	DEX                                                                               ; DECREASE DELAY TIMER
	
_END_WHILE 
	
	JSR CLEAR_P2_TIME_OUT_SUB_MENU                                                    ; CLEAR P2 TIME OUT SUB MENU PPU()
	RETURN_IN_NUM_FRAMES 8
	JSR RESTORE_SCREEN_P2_MENU_COVERED                                                ; CLEAR P2 MENU PPU()
	RETURN_IN_NUM_FRAMES 8

CHECK_P2_COM_PLAYCALL:                                                                ; P2 CHECK COM PLAY CALL
	LDA CPU_P2_PLAY_CALL                                                              ; LOAD COM P2 PLAY CALL
	CMP #PUNT_PLAY_CALL_ID                                                            ; IS PLAY  FG or PUNT
	BCC @do_p2_com_off_regular_play_call                                              ; NO-> BRACNH TO SET P2 COM REGULAR PLAY DELAY
	
@do_P2_com_off_fg_punt_playcall	
	JSR DRAW_P2_OFFENSIVE_MENU                                                        ; DRAW P2 OFFENSIVE MENU()
	LDA CPU_P2_PLAY_CALL                                                              ; LOAD COM P2 PLAY CALL
	SEC                                                                               ; SET INDEX FOR COM SPECIAL TEAMS SELECTION
	SBC #OFFSET_TO_SPECIAL_TEAMS_MENU_OPTION                                          ;
	JSR DO_P2_COM_SELECT_MENU_OPTION                                                  ; P2 COM SELECTS MENU OPTION (A= CHOICE)
	LDX #COM_PLAY_SELECT_DELAY                                                        ; LOAD SPECIAL TEAMS MENU TIMER VALUE

_WHILE NOT_EQUAL                                                                      ; P2 COM SPECIAL TEAMS MENU WAIT LOOP

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	DEX                                                                               ; IS SPECIAL TEAMS MENU TIMER DONE?
	
_END_WHILE                                                                            ; NO->LOOP BACK TO P2 COM SPECIAL TEAMS MENU WAIT LOOP

	JSR END_OFF_AND_DRAW_TASK_AFTER_PPU_TRANS_DONE                                    ; CHECK FOR PPU TRANSFER DONE THEN KILL TASK 2, TASK5 ()
	LDA CPU_P2_PLAY_CALL                                                              ; LOAD COM P2 PLAY CALL
	JMP P2_OFFENSE_CHOOSES_SPECIAL_TEAMS_PLAY                                         ; JUMP TO P2 OR COM PICKS FG/PUNT

@do_p2_com_off_regular_play_call                                                      ; SET P2 COM REGULAR PLAY DELAY
	LDA RANDOM_2                                                                      ; MAKE COM REGULAR PLAY TIMER 30-37 FRAMES
	AND #$07                                                                          ;
	CLC                                                                               ;
	ADC #COM_PLAY_SELECT_DELAY                                                        ;
	TAX                                                                               ;
	
_WHILE NOT_EQUAL                                                                      ; P2 COM PICKS PLAY LOOP

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	DEX                                                                               ; IS COM REGULAR PLAY TIMER DONE?
	
_END_WHILE                                                                            ; NO->LOOP BACK TO P2 COM PICKS PLAY LOOP

	LDA CPU_P2_PLAY_CALL                                                              ; LOAD COM P2 PLAY CALL
	JMP P2_OFFENSE_SAVE_PLAY_CALL                                                     ; JUMP TO P2 SAVE PLAY CALL

DO_P2_OFFENSE_MENU:                                                                   ; P2 OFFENSE MENU START
	JSR DRAW_P2_OFFENSIVE_MENU                                                        ; DRAW P2 OFFENSIVE MENU()
	
SET_P2_OFFENSE_MENU_FIRST_OPTION:                                                     ; P2 SET OFF MENU ARROW TO FIRST SPOT
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR                                               ; SET SPRITE MENU ARROW LOCATION AND ATTRIBUTE() ???
	LDA #CANCEL_MENU_OPTION                                                           ; SET MENU INDEX TO FIRST OPTION
	STA MENU_INDEX                                                                    ;
	LDY #<P2_OFFENSE_MENU_INFO                                                        ; LOAD P2 OFFENSIVE MENU INFO ADDRESS
	LDX #>P2_OFFENSE_MENU_INFO                                                        ;
	LDA #P2_SIDE_ID                                                                   ; LOAD JOY =P2
	JSR SET_MENU_ARROW_OPTIONS                                                        ; INITIALIZE MENU OPTIONS(X,Y= ADDRESS, A=PLAYER JOY)
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR_P2                                            ; SET MENU ARROW LOCATION AND ATTRIBUTE_2() ??
	
_WHILE VALUE_CLEAR                                                                    ; P2 ON OFFENSE MENU LOOP

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR                                               ; SET MENU ARROW LOCATION AND ATTRIBUTE()
	JSR CHECK_MENU_ARROW_UP_DOWN                                                      ; CHECK FOR ARROW MOVED UP OR DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                                       ; SET ARROW NEW Y COORDINATE()
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR_P2                                            ; SET SPRITE MENU ARROW LOCATION AND ATTRIBUTE_2() ??
	BIT JOY_PRESS_2                                                                   ; CHECK JOY2 PRESS
	BMI @do_menu_choice                                                               ; WAS "A"  pressed? YES-> BRANCH TO P2 OFFENSIVE MENU SELECT
	
_END_WHILE                                                                            ; WAS "B"  pressed NO->BRANCH TO P2 ON OFFENSE MENU LOOP
	
	
	LDA #CANCEL_MENU_OPTION                                                           ; YES SET P2 MENU INDEX TO FIRST LOCATION
	STA P2_MENU_INDEX                                                                 ;
	
@do_menu_choice:                                                                      ; P2 OFFENSIVE MENU SELECT
	RTS_JUMP_TABLE[memVal_tableAddr]  P2_MENU_INDEX, P2_OFFENSE_MENU_COMMAND_TABLE
	
P2_OFFENSE_MENU_COMMAND_TABLE:
	.WORD P2_OFFENSE_MENU_CANCEL-1                                                    ; CANCEL
	.WORD P2_OFFENSE_MENU_TIMEOUT-1                                                   ; TIMEOUT
	.WORD P2_OFFENSE_MENU_PUNT-1                                                      ; PUNT
	.WORD P2_OFFENSE_MENU_FG-1                                                        ; FG
	.WORD P2_OFFENSE_MENU_CHANGE_PLAYERS-1                                            ; PLAYER CHANGE

P2_OFFENSE_MENU_CANCEL:                                                               ; P2 CANCEL
	JSR RESTORE_SCREEN_P2_MENU_COVERED                                                ; CLEAR P2 MENU PPU()
	JMP P2_MAN_OFFENSE_START                                                          ; JUMP TO P2 MAN OFFENSE START
	
P2_OFFENSE_MENU_TIMEOUT:                                                              ; P2 TIMEOUT
	LDA P2_TIMEOUTS                                                                   ; LOAD P2 TIMEOUTS
	BEQ SET_P2_OFFENSE_MENU_FIRST_OPTION                                              ; NO timeouts left BRANCH TO P2 SET OFF MENU ARROW TO FIRST SPOT
	LDA CLOCK_RUN_TYPE                                                                ; LOAD CLOCK STATUS
	BPL SET_P2_OFFENSE_MENU_FIRST_OPTION                                              ; IF CLOCK NOT RUNNING JUMP TO P1 SET OFF MENU ARROW TO FIRST SPOT
	JSR DO_P2_OFF_TIMEOUT                                                             ; BRING UP P2 TIME OUT SUB MENU()
	
	LDX #TIMEOUT_MENU_AUTO_CLEAR_DELAY                                                ; LOAD MENU CLEAR DELAY
	
_WHILE NOT_EQUAL                                                                      ; P2 TIMEOUT MENU WAIT TO CLEAR

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	LDA JOY_PRESS_2                                                                   ; LOAD P2 BUTTON PRESS
	AND #(A_BUTTON + B_BUTTON )                                                       ; IS "A" or "B"?
	BNE @clear_p2_off_timout_menu                                                     ; YES->BRANCH TO CLEAR TIMEOUT SUB MENU AND EXIT TO OFFENSE MENU
	DEX                                                                               ; DELAY TIME--
_END_WHILE                                                                            ; DELAY DONE? NO-> LOOP BACK TOP2 TIMEOUT MENU WAIT TO CLEAR
	
@clear_p2_off_timout_menu:                                                            ; CLEAR TIMEOUT SUB MENU AND EXIT TO OFFENSE MENU
	JSR CLEAR_P2_TIME_OUT_SUB_MENU                                                    ; CLEAR P2 TIME OUT SUB MENU PPU()
	JMP SET_P2_OFFENSE_MENU_FIRST_OPTION                                              ; P2 SET OFFENSE MENU ARROW TO FIRST SPOT
	
P2_OFFENSE_MENU_PUNT:
	LDA #PUNT_PLAY_CALL_ID                                                            ; LOAD PUNT PLAY CODE
	JMP P2_OFFENSE_CHOOSES_SPECIAL_TEAMS_PLAY                                         ; JUMP to P2 OR COM PICKS FG/PUNT
	
P2_OFFENSE_MENU_FG:
	LDA #FG_PLAY_CALL_ID                                                              ; LOAD FG PLAY CODE
	JMP P2_OFFENSE_CHOOSES_SPECIAL_TEAMS_PLAY                                         ; JUMP to P2 OR COM PICKS FG/PUNT

P2_OFFENSE_MENU_CHANGE_PLAYERS:                                                       ; P2 CHANGE PLAYERS 
	JSR END_OFF_AND_DRAW_TASK_AFTER_PPU_TRANS_DONE                                    ; CHECK FOR PPU TRANSFER DONE THEN KILL TASK 2, TASK5 ()
	LDA P2_TEAM                                                                       ; LOAD PLAYER 2 TEAM
	STA CURRENT_TEAM                                                                  ; SAVE in CURRENT TEAM
	SUSPEND_TASK_DIRECT[task] UPDATE_CLOCK_TASK 
	LDA #$00                                                                          ; SET COMING FROM PLAY SELECT
	STA SUB_CONTROL_TYPE                                                              ;
	LDA #MAIN_GAME_BANK_1                                                             ; BANK17				
	LDY #<CHANGE_PLAYERS                                                              ; LOAD CHANGE PLAYERS ADDRESS
	LDX #>CHANGE_PLAYERS                                                              ; 
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                                                ; BANK SWAP $8000 AND JUMP (A= BANK, Y,X= ADDRESS)
	LDX #UPDATE_CLOCK_TASK                                                            ; LOAD TASK 0
	JSR RESUME_TASK                                                                   ; RESUME TASK (X=TASK)
	JSR SET_BG_SPR_FULLY_FADED_OUT                                                    ; PALETTE_FADE_IN()
	JMP BANK_JUMP_START_PLAY_SELECT                                                        ; JUMP TO MAIN LOOP TO REDRAW() *** could fix dont need jump to a jump

data_addr	= LOCAL_1	
	
P2_OFFENSE_SAVE_PLAY_CALL:                                                            ; P2 OFFENSE SAVE PLAY CALL
	STA P2_PLAY_CALL                                                                  ; SAVE P2 PLAY CALL 
	PLAY_SOUND_ID PLAY_SELECTED_SOUND
	LDY #<P2_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD PPU ADDRESS FOR P2 READY
	LDX #>P2_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDA #<READY_TEXT_INFO                                                             ; LOAD READY DATA AND CONTROL INFO ADDRESS
	STA data_addr                                                                     ;
	LDA #>READY_TEXT_INFO                                                             ;
	STA data_addr +1                                                                  ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	SET_CLOCK_TO_STOPPED 
	
_WHILE MINUS                                                                          ; P2 PICKED PLAY WAIT FOR P1 PLAY 

	RETURN_1_FRAME
	JSR DO_SCOREBOARD_IF_QTR_OVER                                                     ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	LDA P1_PLAY_CALL                                                                  ; LOAD P1 PLAY  

_END_WHILE
	
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                                        ; SET TASK TO TERMINATED(X=TASK)
	RETURN_IN_NUM_FRAMES 60
	JSR FADE_OUT_BG_SPR_PAL                                                           ; FADE PALLETE()
	LDA #SPRITE_OFFSCREEN                                                             ; SET FLASHING YARDLINE SPRITE(Y) to offscreen
	STA FLASHING_YARDLINE_SPR_Y                                                       ;
	JMP CLEAR_TEAM_NAMES_AND_SELECT_READY_AREA                                        ; CLEAR PPU MEMORY TEAM NAMES,SELECT/READY()

P2_OFFENSE_CHOOSES_SPECIAL_TEAMS_PLAY:                                                ; P2 OR COM PICKS FG/PUNT
	STA P2_PLAY_CALL                                                                  ; SAVE P2 PLAY CALL
	JSR END_OFF_AND_DRAW_TASK_AFTER_PPU_TRANS_DONE                                    ; CHECK FOR PPU TRANSFER DONE THEN KILL TASK 2, TASK5 ()
	LDY #<P2_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDX #>P2_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDA #<READY_TEXT_INFO                                                             ; LOAD READY DATA AND CONTROL INFO ADDRESS
	STA data_addr                                                                     ;
	LDA #>READY_TEXT_INFO                                                             ;
	STA data_addr+1                                                                   ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	PLAY_SOUND_ID PLAY_SELECTED_SOUND
	SET_CLOCK_TO_STOPPED 
	
num_tiles			= LOCAL_1	
lines 				= LOCAL_2

@clear_p1_slect_ready_after_p2_picks_st	
	LDY #<P1_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD PPU ADDRESS FOR P2 READY
	LDX #>P1_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDA #$01                                                                          ; LOAD # LINES
	STA lines                                                                         ;
	LDA #READY_TEXT_LENGTH                                                            ; LOAD LENGTH
	STA num_tiles                                                                     ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                                                   ; CLEAR PPU(X,Y= ADDR, 3F= NUM lines, 3E= length)
	RETURN_IN_NUM_FRAMES 60
	JSR FADE_OUT_BG_SPR_PAL                                                           ; FADE PALLETE()	
	LDA #SPRITE_OFFSCREEN                                                             ; SET FLASHING YARDLINE SPRITE(Y) to OFFSCREEN
	STA FLASHING_YARDLINE_SPR_Y                                                       ; 
	JMP CLEAR_TEAM_NAMES_AND_SELECT_READY_AREA                                        ; CLEAR PPU MEMORY TEAM NAMES,SELECT/READY()

_F}_P2_ON_OFFENSE_PLAYCALL	

_F{_P2_ON_DEFENSE_PLAYCALL
	
P2_ON_DEFENSE_PLAYCALL_START:                                                         ; P2 DEFENSE START
	LDX #PLAYCALL_DEFENSE_STACK_INDEX                                                 ; SET STACK LOCATION
	TXS                                                                               ;
	LDA TEAM_CONTROL_TYPES                                                            ; LOAD PLAYER TYPES
	AND #$0E                                                                          ; IS PLAYER 2 COM?
	BNE P2_COM_ON_DEFENSE_START                                                       ; YES-> BRANCH TO P2 COM DEFENSE START
	
P2_MAN_DEFENSE_INPUT_CHECK:                                                           ; P2 DEFENSE INPUT CHECK
	RETURN_1_FRAME
	JSR GET_P2_CONTROLLER_INPUT_PLAY_SELECT                                           ; CHECK FOR P2 DIRECTION + BUTTON PRESS()
	BCC @no_direction_pressed                                                         ; PLAY PICKED? NO-> BRANCH TO  P2 DEFENSE PLAY NOT PICKED
	JMP P2_DEFENSE_SAVE_PLAY_CALL                                                     ; YES-> JUMP TO P2 DEFENSE PLAY PICKED

@no_direction_pressed:                                                                ; P2 DEFENSE PLAY NOT PICKED
	BVS P2_MAN_DEFENSE_INPUT_CHECK                                                    ; INVALID CHOICE? YES->LOOP BACK TO P2 DEFENSE INPUT CHECK
	LDA JOY_PRESS_2                                                                   ; LOAD P2 PRESS
	BPL P2_MAN_DEFENSE_INPUT_CHECK                                                    ; "B" PRESSED-> LOOP BACK TO P2 DEFENSE INPUT CHECK
	JMP DO_P2_DEFENSIVE_MENU                                                          ; "A" PRESSED-> JUMP TO BRING UP P1 DEFENSIVE MENU

temp_play_call	= LOCAL_3	
	
P2_COM_ON_DEFENSE_START:                                                              ; P2 COM DEFENSE START
	JSR P2_ON_DEF_SET_VALUE_FOR_CPU_PLAY_CALL_LOGIC                                   ; P2 ON D LOAD VALUES(DOWN, YDLN, & DO COM PLAY LOGIC)
	LDA temp_play_call                                                                ; LOAD COM PLAY CALL
	STA CPU_P2_PLAY_CALL                                                              ; SAVE in P2 COM PLAY CALL
	LDA CPU_OFF_TIMEOUTS                                                              ; NEW TIMEOUTS = P2 CURRENT TIMEOUTS?
	CMP P2_TIMEOUTS                                                                   ;
	BEQ @p2_com_picks_play                                                            ; YES-> BRANCH TO P2 COM D PICKS PLAY
	
@p2_com_defense_takes_timeout:	
	JSR DRAW_P2_DEFENSE_MENU                                                          ; DRAW P2 DEFENSE MENU()
	LDA #TIMEOUT_MENU_OPTION                                                          ; LOAD TIMEOUT OPTION INDEX
	JSR DO_P2_COM_SELECT_MENU_OPTION                                                  ; P2 COM SELECTS MENU OPTION (A= CHOICE)
	JSR DO_P2_DEF_TIMEOUT                                                             ; P2 DEF TIMEOUT ROUTINE()
	LDA #SPRITE_OFFSCREEN                                                             ; SET MENU ARROW (Y) TO OFFSCREEN
	STA MENU_ARROW_SPR_Y                                                              ;
	RETURN_IN_NUM_FRAMES 120
	JSR CLEAR_P2_TIME_OUT_SUB_MENU                                                    ; CLEAR P2 TIME OUT SUB MENU PPU()
	RETURN_IN_NUM_FRAMES 8
	JSR RESTORE_SCREEN_P2_MENU_COVERED                                                ; CLEAR P2 MENU PPU()
	RETURN_IN_NUM_FRAMES 8
	
@p2_com_picks_play:                                                                   ; P2 COM D PICKS PLAY
	LDA RANDOM_2                                                                      ; MAKE TIME 30-37 FRAMES
	AND #$07                                                                          ;
	CLC                                                                               ;
	ADC #COM_PLAY_SELECT_DELAY                                                        ;
	JSR DELAY_TASK                                                                    ; SWITCH TASKS( A= # FRAMES BEFORE RETURNING)
	LDA CPU_P2_PLAY_CALL                                                              ; LOAD P2 COM PLAY CALL
	JMP P2_DEFENSE_SAVE_PLAY_CALL                                                     ; JUMP TO P2 DEFENSE PLAY PICKED 

DO_P2_DEFENSIVE_MENU:                                                                 ; P2 DEFENSIVE MENU START
	JSR DRAW_P2_DEFENSE_MENU                                                          ; DRAW P2 DEFENSE MENU()

P2_DEFENSE_SET_MENU_TO_FIRST_OPTION:                                                  ; P2 DEFENSE SET ARROW TO FIRST OPTION
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR                                               ; SET MENU ARROW LOCATION AND ATTRIBUTE()
	LDA #$00                                                                          ; SET ARROW TO FIRST OPTION
	STA MENU_INDEX                                                                    ;
	LDY #<P2_DEFENSE_MENU_INFO                                                        ; LOAD P2 DEFENSE MENU ADDRESS
	LDX #>P2_DEFENSE_MENU_INFO                                                        ;
	LDA #P2_SIDE_ID                                                                   ; LOAD P2 JOY
	JSR SET_MENU_ARROW_OPTIONS                                                        ; INITIALIZE MENU OPTIONS(X,Y= ADDRESS, A=PLAYER JOY)
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR_P2                                            ;
	
_WHILE VALUE_CLEAR                                                                    ; P2 DEFENSE MENU INPUT LOOP

	RETURN_1_FRAME
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR                                               ; SET MENU ARROW LOCATION AND ATTRIBUTE()
	JSR CHECK_MENU_ARROW_UP_DOWN                                                      ; CHECK FOR ARROW MOVED UP OR DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                                       ; SET ARROW NEW Y COORDINATE()
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR_P2                                            ; SET SPRITE MENU ARROW LOCATION AND ATTRIBUTE_2() ??
	BIT JOY_PRESS_2                                                                   ; GET P2 JOY PRESS
	BMI @do_p2_def_menu_choice                                                        ; A PRESSED? YES->BRANCH TO DO P2 DEFENSE MENU OPTION SELECTED
_END_WHILE                                                                            ; B PRESSED? NO-> LOOP BACK TO P2 DEFENSE MENU INPUT LOOP

	LDA #CANCEL_MENU_OPTION                                                           ; YES->SET P2 MENU INDEX TO CANCEL
	STA P2_MENU_INDEX                                                                 ;
	
	
@do_p2_def_menu_choice:                                                               ; P2 DEFENSE MENU OPTION SELECTED
	RTS_JUMP_TABLE[memVal_tableAddr]  P2_MENU_INDEX , P2_DEFENSE_MENU_COMMAND_TABLE
	
P2_DEFENSE_MENU_COMMAND_TABLE:                                                        ; P2 DEFENSIVE MENU OPTIONS POINTER TABLE
	.WORD P2_DEFENSE_CANCEL-1                                                         ; CANCEL
	.WORD P2_DEFENSIVE_MENU_START-1                                                   ; TIMEOUT	

P2_DEFENSE_CANCEL:
	JSR RESTORE_SCREEN_P2_MENU_COVERED                                                ; CLEAR P2 MENU PPU()
	JMP P2_ON_DEFENSE_PLAYCALL_START                                                  ; JUMP TO PLAYER 1 DEFENSE START

P2_DEFENSIVE_MENU_START:
	LDA P2_TIMEOUTS                                                                   ; LOAD P2 TIMEOUTS
	BEQ P2_DEFENSE_SET_MENU_TO_FIRST_OPTION                                           ; ANY LEFT? NO-> LOOP BACK TO P2 DEFENSE SET ARROW TO FIRST OPTION
	LDA CLOCK_RUN_TYPE                                                                ; LOAD CLOCK STATUS
	BPL P2_DEFENSE_SET_MENU_TO_FIRST_OPTION                                           ; IS IT STOPPED? YES-> LOOP BACK TO P1 DEFENSE SET ARROW TO FIRST OPTION
	JSR DO_P2_DEF_TIMEOUT                                                             ; USE P2 TIMEOUT ROUTINE()
	
	LDX #TIMEOUT_MENU_AUTO_CLEAR_DELAY                                                ; LOAD CLEAR SUBMENU DELAY
_WHILE NOT_EQUAL                                                                      ; CLEAR P2 TIMEOUT SUBMENU WAIT		
		
	RETURN_1_FRAME
	LDA JOY_PRESS_2                                                                   ; LOAD P1 BUTTON PRESS
	AND #(A_BUTTON + B_BUTTON )                                                       ; IS "A" or "B"?
	BNE CLEAR_P2_DEFENSE_TIMEOUT_MENU                                                 ; YES-> JUMP TO CLEAR P2 TIMEOUT SUBMENU 
	DEX                                                                               ; DECREASE timer
	
_END_WHILE                                                                            ; Timer done? NO LOOP BACK TO CLEAR P2 TIMEOUT SUBMENU WAIT
	
sram_addr 	= LOCAL_1
	
CLEAR_P2_DEFENSE_TIMEOUT_MENU:                                                        ; CLEAR P2 TIMEOUT SUBMENU 
	JSR CLEAR_P2_TIME_OUT_SUB_MENU                                                    ; CLEAR P2 TIME OUT SUB MENU PPU()
	JMP P2_DEFENSE_SET_MENU_TO_FIRST_OPTION                                           ; JUMP TO P1 DEFENSE MENU SET ARROW TO FIRST OPTION
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; CODE NOT USED AS ITS PERFORMED BY 916B ROUTINE
	LDY #<$2172                                                                       ;					
	LDX #>$2172                                                                       ;
	LDA #<P2_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr                                                                     ;
	LDA #>P2_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr+1                                                                   ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; 
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; 
	JSR RESUME_TASK                                                                   ;
	JMP P2_DEFENSE_SET_MENU_TO_FIRST_OPTION                                           ; 

data_addr		= LOCAL_1		
	
P2_DEFENSE_SAVE_PLAY_CALL:                                                            ; P2 DEFENSE PLAY PICKED
	STA P2_PLAY_CALL                                                                  ; SAVE P2 PLAY CALL
	PLAY_SOUND_ID PLAY_SELECTED_SOUND
	LDY #<P2_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD PPU ADDRESS FOR P2 SELECT/READY
	LDX #>P2_READY_SELECT_TEXT_PPU_ADDR                                               ;
	LDA #<READY_TEXT_INFO                                                             ; LOAD READY DATA AND CONTROL INFO ADDRESS
	STA data_addr                                                                     ;
	LDA #>READY_TEXT_INFO                                                             ;
	STA data_addr+1                                                                   ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU (Y,X= PPU ADDR, 3E,3F DATA AND CONTROL ADDRESS)
	JMP END_CURRENT_TASK                                                              ; END CURRENT TASK()
	
_F}_P2_ON_DEFENSE_PLAYCALL	

_F{_GET_CONTROLLER_INPUT_PLAYCALL

GET_P1_CONTROLLER_INPUT_PLAY_SELECT:                                                  ; CHECK FOR P1 DIRECTION + BUTTON PRESS()
	LDA JOY_RAW_1                                                                     ; LOAD P1 JOY RAW
	AND #$0F                                                                          ; MASK OUT BUTTONS
	BEQ @nothing_pressed                                                              ; NOTHING PRESSED-> JUMP TO P1 NO DIRECTION PRESSED OR NO BUTTON PRESS 
	TAX                                                                               ; TRANSFER JOY VALUE TO X 
	LDA JOY_PAD_DIRECTION_BITMASK_TABLE,X                                             ; LOAD CONVERTED VALUE FROM JOYPAD CONVERT TABLE 
	BMI @invalid_input                                                                ; IF DIRECTION NOT VALID JUMP TO P1 MULTI OR INVALID DIRECTIONS PRESSED
	BIT JOY_PRESS_1                                                                   ; LOAD P1 JOY PRESS
	BMI @set_play_selected                                                            ; A pressed? YES->BRANCH TO  P1 BUTTON PLUS DIRECTION PRESSED
	BVC @nothing_pressed                                                              ; B pressed? NO-> BRANCH TO P1 NO DIRECTION PRESSED OR NO BUTTON PRESS	
	ORA #OFFSET_TO_PASS_PLAY                                                          ; SET PLAY TO PASS BY ADDING 4

@set_play_selected:                                                                   ; P1 BUTTON PLUS DIRECTION PRESSED	
	SEC                                                                               ; SET PLAY PICKED
	RTS                                                                               ; 
	
@nothing_pressed:                                                                     ; P1 NO DIRECTION PRESSED OR NO BUTTON PRESS 
	CLC                                                                               ; SET BUTTON OR DIRECTION NOT PRESSED
	CLV                                                                               ;
	RTS                                                                               ;
	
@invalid_input:                                                                       ; MULTIPLE OR INVALID DIRECTIONS PRESSED
	CLC                                                                               ; SET INVALID
	BIT $FFF9                                                                         ;
	RTS                                                                               ; 

GET_P2_CONTROLLER_INPUT_PLAY_SELECT:                                                  ; CHECK FOR P2 DIRECTION + BUTTON PRESS()
	LDA JOY_RAW_2                                                                     ; LOAD P1 JOY RAW
	AND #$0F                                                                          ; MASK OUT BUTTONS
	BEQ @nothing_pressed                                                              ; NOTHING PRESSED-> JUMP TO P1 NO DIRECTION PRESSED
	TAX                                                                               ; TRANSFER JOY VALUE TO X
	LDA JOY_PAD_DIRECTION_BITMASK_TABLE,X                                             ; LOAD CONVERTED VALUE FROM JOYPAD CONVERT TABLE
	BMI @nothing_pressed                                                              ; IF DIRECTION NOT VALID JUMP TO MULTIPLE OR INVALID DIRECTIONS PRESSED
	BIT JOY_PRESS_2                                                                   ; LOAD P2 JOY PRESS
	BMI @set_play_selected                                                            ; A pressed? YES->BRANCH TO P2 BUTTON PLUS DIRECTION PRESSED
	BVC @invalid_input                                                                ; B pressed? NO-> BRANCH TO DIRECTION NOT PRESSED OR PRESSED WITHOUT BUTTON
	ORA #OFFSET_TO_PASS_PLAY                                                          ; SET PLAY TO PASS BY ADDING 4
	
@set_play_selected:                                                                   ;P2 BUTTON PLUS DIRECTION PRESSED			
	SEC                                                                               ; SET PLAY PICKED
	RTS                                                                               ; 
	
@nothing_pressed:                                                                     ;P2 NO DIRECTION PRESS OR NO BUTTON PRESS
	CLC                                                                               ; SET BUTTON OR DIRECTION NOT PRESSED
	CLV                                                                               ;
	RTS                                                                               ; 
	
@invalid_input :                                                                      ;P2 MULTI OR INVALID DIRECTIONS PRESSED
	CLC                                                                               ; SET INVALID
	BIT $FFF9                                                                         ;	
	RTS                                                                               ; 

	
_F}_GET_CONTROLLER_INPUT_PLAYCALL	

_F{_UPDATE_SELECT_READY_YARDLINE
	
UPDATE_SELECT_READY_YARDLINE:                                                         ; FLASHING SELECT/READY START
	LDX #READY_SELECT_UPDATE_STACK_INDEX                                              ; SET STACK LOCATION
	TXS                                                                               ;
	
FLASH_READY_SELECT_LOOP:                                                              ; FLASHING SELECT/READY LOOP
	RETURN_1_FRAME
	LDA FRAME_COUNTER                                                                 ; LOAD COUNTER
	AND #$04                                                                          ; EVERY 4 FRAMES BRANCH TO SET YARDLINE INDICATOR ONSCREEN
	BEQ @restore_yardline_y_location                                                  ;
	
@set_yardline_indicator_offscreen	
	LDA #SPRITE_OFFSCREEN                                                             ; LOAD OFFSCREEN Y VALUE
	JMP @save_yardline_y_location                                                     ; JUMP TO 
	
@restore_yardline_y_location:                                                         ; SET YARDLINE INDICATOR ONSCREEN
	LDA #YARDLINE_SPR_Y_LOCATION	                                                  ; LOAD YARDLINE ONSCREEN Y VALUE

@save_yardline_y_location:                                                            ; 
	STA FLASHING_YARDLINE_SPR_Y                                                       ; SET FLASHING YARDLINE SPRITE(Y) LOCATION
	LDA FRAME_COUNTER                                                                 ;
	AND #$03                                                                          ; LOAD COUNTER
	BNE @check_for_update_p1_ready_select_text                                        ; 3 OUT OF EVERY 4 FRAMES BRANCH TO CHECK P1

@update_controller_pad_palletes	
	LDA FRAME_COUNTER                                                                 ; LOAD RANDOM PALLETE VALUE FROM SET OF 8 FOR FLASHING BUTTONS 
	LSR                                                                               ; AND CNTROLLER PADS
	LSR                                                                               ;
	AND #$07                                                                          ;		
	TAX                                                                               ;
	LDA PLAY_SELECT_FLASHING_PALLETE_VALUES,X                                         ;
	STA CONTROLLER_FLASH_PAL_BUF_1                                                    ; SAVE PALLETE VALUES need two pal locations due to attribut layout
	STA CONTROLLER_FLASH_PAL_BUF_2                                                    ;
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                                             ; UPDATE PALLETE()

@check_for_update_p1_ready_select_text:                                               ; CHECK P1
	LDA TEAM_CONTROL_TYPES                                                            ; LOAD PLAYER TYPES
	AND #$E0                                                                          ; IS P1 COM
	BNE @check_for_update_p2_ready_select_text                                        ; YES->BRANCH TO CHECK P2
	LDA P1_PLAY_CALL                                                                  ; LOAD P1 PLAY
	BPL @check_for_update_p2_ready_select_text                                        ; IS PLAY PICKED? YES-> BRANCH TO CHECK P2
	LDY #<P1_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD P1 SELECT/READY PPU ADDRESS
	LDX #>P1_READY_SELECT_TEXT_PPU_ADDR                                               ;
	JSR FLASH_SELECT_TEXT                                                             ; CLEAR OR SET SELECT TEXT(X,Y= PPU ADDR)

@check_for_update_p2_ready_select_text:                                               ; CHECK P2
	LDA TEAM_CONTROL_TYPES                                                            ; LOAD PLAYER TYPES
	AND #$0E                                                                          ; IS P2 COM
	BNE FLASH_READY_SELECT_LOOP
	LDA P2_PLAY_CALL                                                                  ; LOAD P2 PLAY
	BPL FLASH_READY_SELECT_LOOP                                                       ; PLAY PICKED? YES-> LOOP BACK TO  FLASHING SELECT/READY LOOP
	LDY #<P2_READY_SELECT_TEXT_PPU_ADDR                                               ; LOAD P2 SELECT/READY PPU ADDRESS
	LDX #>P2_READY_SELECT_TEXT_PPU_ADDR                                               ;
	JSR FLASH_SELECT_TEXT                                                             ; CLEAR OR SET SELECT TEXT(X,Y= PPU ADDR)
	JMP FLASH_READY_SELECT_LOOP                                                       ; LOOP BACK TO  FLASHING SELECT/READY LOOP

	
data_info_addr			= LOCAL_1

num_tiles				= LOCAL_1
num_lines				= LOCAL_2


FLASH_SELECT_TEXT:                                                                    ; CLEAR OR SET SELECT TEXT(X,Y= PPU ADDR)
	LDA FRAME_COUNTER                                                                 ; LOAD COUNTER
	AND #$0F                                                                          ; COUNTER MULTIPLE OF 16? 
	BEQ @exit                                                                         ; YES= EXIT
	LDA FRAME_COUNTER                                                                 ; 
	AND #$10                                                                          ;
	BEQ @clear_select                                                                 ; 

@draw_select:								                                          ; DRAW SELECT
	LDA #<SELECT_TEXT_INFO                                                            ; LOAD SELECT DATA ADDRESS
	STA data_info_addr                                                                ;
	LDA #>SELECT_TEXT_INFO                                                            ;
	STA data_info_addr+1                                                              ;
	JMP TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	
@clear_select:                                                                        ; CLEAR SELECT
	LDA #SELECT_TEXT_ROWS                                                             ; SET # LINES
	STA num_lines                                                                     ;
	LDA #SELECT_TEXT_LENGTH                                                           ; SET LENGTH 
	STA num_tiles                                                                     ;
	JMP FILL_SCREEN_BLANK_TILE_AREA                                                   ; CLEAR PPU(X,Y= ADDR, 3F= NUM lines, 3E= length)
	
@exit: 
	RTS


	
_F}_UPDATE_SELECT_READY_YARDLINE

_F{_DRAW_RESTORE_MENUS_DO_TIMEOUTS

menu_choice_plus_one = LOCAL_8		
	
DO_P1_COM_SELECT_MENU_OPTION:                                                         ; P1 COM SELECTS MENU OPTION (A= CHOICE)
	TAX                                                                               ; SAVE MENU CHOICE+1 in $45
	INX                                                                               ;
	STX menu_choice_plus_one                                                          ;
	LDA #CANCEL_MENU_OPTION                                                           ; SET P1 MENU INDEX BACK TO FIRST OPTION 
	STA MENU_INDEX                                                                    ;
	
_WHILE NOT_EQUAL                                                                      ; P1 COM MOVES ARROW LOOP

	LDY #<P1_OFFENSE_MENU_INFO                                                        ; LOAD P1 OFFENSIVE MENU DRAW INFO ADDRESS 
	LDX #>P1_OFFENSE_MENU_INFO                                                        ;
	LDA #P1_SIDE_ID                                                                   ; LOAD P1 JOY
	JSR SET_MENU_ARROW_OPTIONS                                                        ; INITIALIZE MENU OPTIONS(X,Y= ADDRESS, A=PLAYER JOY)
	RETURN_IN_NUM_FRAMES 20
	INC MENU_INDEX                                                                    ; INCREMENT ARROW LOCATION
	DEC menu_choice_plus_one                                                          ;
	
_END_WHILE                                                                            ; ARROW AT FINAL LOCATION? NO->LOOP BACK TO P1 COM MOVES ARROW LOOP
	
	RTS                                                                               ; EXIT

ppu_addr		= LOCAL_1	
sram_addr		= LOCAL_3
	
DRAW_P1_OFFENSIVE_MENU:                                                               ; P1 DRAW OFF MENU()
	PLAY_SOUND_ID PLAY_MENU_SOUND
	RETURN_IN_NUM_FRAMES 4
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                               
	MMC3_SRAM_WRITE_ENABLE 

@save_screen_that_will_be_covered	
	LDA #<P1_PLAY_CALL_MENU_PPU_ADDR                                                  ; SET PPU ADDRESS = $20A3
	STA ppu_addr                                                                      ;
	LDA #>P1_PLAY_CALL_MENU_PPU_ADDR                                                  ;
	STA ppu_addr+1                                                                    ;
	LDA #<P1_PLAY_CALL_MENU_SRAM                                                      ; SET DATA ADRESS = $6003 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P1_PLAY_CALL_MENU_SRAM                                                      ;
	STA sram_addr+1                                                                   ;
	LDX #OFFENSE_MENU_LENGTH                                                          ; SET DATA LENGTH =0x0C0E				
	LDY #OFFENSE_MENU_HEIGHT	                                                      ;
	JSR TRANSFER_BUFFER_TO_SRAM                                                       ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH) 
	
	MMC3_SRAM_WRITE_DISABLE
@draw_menu										                                      ; DRAW PLAYER 1 OFFENSIVE MENU
	LDA #P1_OFF_MENU_SCREEN_ID                                                        ; LOAD P1 OFFENSIVE MENU EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16					; 	
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ; DRAW EVENT (A= EVENT F= BANK CONTAINING EVENT)
	JSR CONVERT_P1_TIMEOUTS_TO_TILE                                                   ; CONVERT P1 TIMEOUT VALUE TO TILE TO DRAW()
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK (X=TASK) 
	RTS                                                                               ; EXIT

DRAW_P1_DEFENSE_MENU:                                                                 ; DRAW P1 DEFENSE MENU()
	PLAY_SOUND_ID PLAY_MENU_SOUND
	RETURN_IN_NUM_FRAMES 4
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	MMC3_SRAM_WRITE_ENABLE
	LDA #<P1_PLAY_CALL_MENU_PPU_ADDR                                                  ; SET PPU ADDRESS = $20A3
	STA ppu_addr                                                                      ;
	LDA #>P1_PLAY_CALL_MENU_PPU_ADDR                                                  ;
	STA ppu_addr+1                                                                    ;
	LDA #<P1_PLAY_CALL_MENU_SRAM                                                      ; SET DATA ADRESS = $6003 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P1_PLAY_CALL_MENU_SRAM                                                      ;
	STA sram_addr +1                                                                  ;
	LDX #DEFENSE_MENU_LENGTH                                                          ; SET DATA LENGTH =0x080C
	LDY #DEFENSE_MENU_HEIGHT                                                          ;
	JSR TRANSFER_BUFFER_TO_SRAM                                                       ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH) 
	MMC3_SRAM_WRITE_DISABLE
												                                      ; DRAW PLAYER 1 DEFENSIVE MENU
	LDA #P1_DEF_MENU_SCREEN_ID                                                        ; LOAD P1 DEFENSIVE MENU EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16					;
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ; DRAW EVENT (A= EVENT F= BANK CONTAINING EVENT	
	JSR CONVERT_P1_TIMEOUTS_TO_TILE                                                   ; CONVERT P1 TIMEOUT VALUE TO TILE TO DRAW()
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK (X=TASK)
	RTS

sram_addr = LOCAL_1	

	
RESTORE_SCREEN_COVERED_BY_P1_MENU:                                                    ; RESTORE SCREEN COVERED BY MENU
	LDA #SPRITE_OFFSCREEN                                                             ; SET P1 MENU ARROW TO OFFSCREEN
	STA MENU_ARROW_SPR_Y                                                              ; 
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	LDY #<P1_PLAY_CALL_MENU_PPU_ADDR                                                  ; SET PPU ADDRESS = $20A3
	LDX #>P1_PLAY_CALL_MENU_PPU_ADDR                                                  ;
	LDA #<P1_PLAY_CALL_MENU_SRAM                                                      ; SET DATA ADRESS = $6003 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P1_PLAY_CALL_MENU_SRAM                                                      ;
	STA sram_addr + 1                                                                 ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS                                                                               ; EXIT

ppu_addr  = LOCAL_1
sram_addr = LOCAL_3	


DO_P1_TIMEOUT:                                                                        ; P1 OFF DO TIMEOUT ROUTINE()
	DEC P1_TIMEOUTS                                                                   ; DECREASE P1 TIMEOUTS BY 1 
	JSR CONVERT_P1_TIMEOUTS_TO_TILE                                                   ; CONVERT P1 TIMEOUT VALUE TO TILE TO DRAW()
	SET_CLOCK_TO_STOPPED
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	MMC3_SRAM_WRITE_ENABLE
	LDA #<P1_TIMEOUT_MENU_PPU_ADDR                                                    ; SET PPU ADDRESS = $2124
	STA ppu_addr                                                                      ;
	LDA #>P1_TIMEOUT_MENU_PPU_ADDR                                                    ;
	STA ppu_addr +1                                                                   ;
	LDA #<P1_TIMEOUT_MENU_SRAM                                                        ; SET DATA ADRESS = $6103 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P1_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr + 1                                                                 ;
	LDX #OFF_TIMEOUT_MENU_LENGTH                                                      ; SET DATA LENGTH =0x070D
	LDY #OFF_TIMEOUT_MENU_HEIGHT                                                      ;
	JSR TRANSFER_BUFFER_TO_SRAM                                                       ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH) 
	MMC3_SRAM_WRITE_DISABLE
	LDA #SPRITE_OFFSCREEN                                                             ; SET P1 MENU ARROW TO OFFSCREEN()
	STA MENU_ARROW_SPR_Y                                                              ; 
												                                      ; Draw Player 1 Offensive Timeout Menu
	LDA #P1_OFF_TIMEOUT_SCREEN_ID                                                     ; LOAD P1 OFFENSIVE MENU TIMEOUT EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16					;
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ; DRAW EVENT (A= EVENT F= BANK CONTAINING EVENT)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS                                                                               ; EXIT

DO_P1_DEF_TIMEOUT:                                                                    ; P1 DEF DO TIMEOUT ROUTINE()
	DEC P1_TIMEOUTS                                                                   ; DECREASE P1 TIMEOUTS BY 1 
	JSR CONVERT_P1_TIMEOUTS_TO_TILE                                                   ; CONVERT P1 TIMEOUT VALUE TO TILE TO DRAW()
	SET_CLOCK_TO_STOPPED
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	MMC3_SRAM_WRITE_ENABLE
	LDA #<P1_TIMEOUT_MENU_PPU_ADDR                                                    ; SET PPU ADDRESS = $2124
	STA ppu_addr                                                                      ;
	LDA #>P1_TIMEOUT_MENU_PPU_ADDR                                                    ;
	STA ppu_addr + 1                                                                  ;
	LDA #<P1_TIMEOUT_MENU_SRAM                                                        ; SET DATA ADRESS = $6103 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P1_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr +1                                                                  ;
	LDX #DEF_TIMEOUT_MENU_LENGTH                                                      ;
	LDY #DEF_TIMEOUT_MENU_HEIGHT                                                      ; SET DATA LENGTH =0x070C
	JSR TRANSFER_BUFFER_TO_SRAM                                                       ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH) 
	MMC3_SRAM_WRITE_DISABLE 
	LDA #SPRITE_OFFSCREEN                                                             ; SET P1 MENU ARROW TO OFFSCREEN()
	STA MENU_ARROW_SPR_Y                                                              ; 
												                                      ; Draw Player 1 Defensive Timeout Menu
	LDA #P1_DEF_TIMEOUT_SCREEN_ID                                                     ; LOAD P1 DEFENSIVE MENU TIMEOUT EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ; DRAW EVENT (A= EVENT F= BANK CONTAINING EVENT)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS                                                                               ; EXIT

	
sram_addr = LOCAL_1
	
RESTORE_SCREEN_COVERED_BY_P1_TIMEOUT:                                                 ; RESTORE SCREEN COVERED BY TIMEOUT SUB MENU
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	LDY #<P1_TIMEOUT_MENU_PPU_ADDR                                                    ; SET PPU ADDRESS = $2124
	LDX #>P1_TIMEOUT_MENU_PPU_ADDR                                                    ;
	LDA #<P1_TIMEOUT_MENU_SRAM                                                        ; SET DATA ADRESS = $6103 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P1_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr +1                                                                  ; 
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS

DO_P2_COM_SELECT_MENU_OPTION:                                                         ; P2 COM SELECTS MENU OPTION (A= CHOICE)
	TAX                                                                               ; SAVE MENU CHOICE+1 in $45
	INX                                                                               ;
	STX menu_choice_plus_one                                                          ;
	LDA #CANCEL_MENU_OPTION                                                           ; SET P2 MENU INDEX BACK TO FIRST OPTION 
	STA P2_MENU_INDEX                                                                 ;
	
_WHILE NOT_EQUAL                                                                      ; P2 COM MOVES ARROW LOOP

	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR                                               ; SET MENU ARROW LOCATION AND ATTRIBUTE()
	LDY #<P2_OFFENSE_MENU_INFO                                                        ; LOAD P2 OFFENSIVE MENU DRAW INFO ADDRESS 
	LDX #>P2_OFFENSE_MENU_INFO                                                        ;
	LDA #$00                                                                          ;
	JSR SET_MENU_ARROW_OPTIONS                                                        ; INITIALIZE MENU OPTIONS(X,Y= ADDRESS, A=PLAYER JOY)
	JSR SET_SPR_MENU_ARROW_LOC_AND_ATTR_P2                                            ;
	RETURN_IN_NUM_FRAMES 20
	INC P2_MENU_INDEX                                                                 ; INCREMENT ARROW LOCATION
	DEC menu_choice_plus_one                                                          ;
	
_END_WHILE                                                                            ; ARROW AT FINAL LOCATION? NO->LOOP BACK TO P2 COM MOVES ARROW LOOP
	RTS                                                                               ;


ppu_addr		= LOCAL_1	
sram_addr		= LOCAL_3	
	
DRAW_P2_OFFENSIVE_MENU:                                                               ; DRAW P2 OFFENSIVE MENU()
	PLAY_SOUND_ID PLAY_MENU_SOUND
	RETURN_IN_NUM_FRAMES 4
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	MMC3_SRAM_WRITE_ENABLE
	LDA #<P2_PLAY_CALL_MENU_PPU_ADDR                                                  ; SET PPU ADDRESS = $20B1
	STA ppu_addr                                                                      ;
	LDA #>P2_PLAY_CALL_MENU_PPU_ADDR                                                  ;
	STA ppu_addr + 1                                                                  ;
	LDA #<P2_PLAY_CALL_MENU_SRAM                                                      ; SET DATA ADRESS = $6203 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P2_PLAY_CALL_MENU_SRAM                                                      ;
	STA sram_addr + 1                                                                 ;
	LDX #OFFENSE_MENU_LENGTH                                                          ; SET DATA LENGTH =0x0C0E
	LDY #OFFENSE_MENU_HEIGHT	                                                      ;
	JSR TRANSFER_BUFFER_TO_SRAM                                                       ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH) 
	MMC3_SRAM_WRITE_DISABLE
												                                      ; Draw Player 2 Offensive Menu
	LDA #P2_OFF_MENU_SCREEN_ID                                                        ; LOAD P2 OFFENSIVE MENU EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16					;
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ; DRAW EVENT (A= EVENT F= BANK CONTAINING EVENT)
	JSR CONVERT_P2_TIMEOUTS_TO_TILE                                                   ; CONVERT P2 TIMEOUT VALUE TO TILE TO DRAW()
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS                                                                               ; EXIT

DRAW_P2_DEFENSE_MENU:                                                                 ; DRAW P2 DEFENSE MENU
	PLAY_SOUND_ID PLAY_MENU_SOUND
	RETURN_IN_NUM_FRAMES 4
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	MMC3_SRAM_WRITE_ENABLE
	LDA #<P2_PLAY_CALL_MENU_PPU_ADDR                                                  ; SET PPU ADDRESS = $20B1
	STA ppu_addr                                                                      ;
	LDA #>P2_PLAY_CALL_MENU_PPU_ADDR                                                  ;
	STA ppu_addr + 1                                                                  ;
	LDA #<P2_PLAY_CALL_MENU_SRAM                                                      ; SET DATA ADRESS = $6203 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P2_PLAY_CALL_MENU_SRAM                                                      ;
	STA sram_addr + 1                                                                 ;
	LDX #DEFENSE_MENU_LENGTH                                                          ; SET DATA LENGTH =0x080C
	LDY #DEFENSE_MENU_HEIGHT                                                          ;
	JSR TRANSFER_BUFFER_TO_SRAM                                                       ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH)
	MMC3_SRAM_WRITE_DISABLE
												                                      ; Draw Player 2 Defensive Menu
	LDA #P2_DEFENSIVE_MENU_SCREEN_ID                                                  ; LOAD P1 DEFENSIVE MENU EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16					;
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ;
	JSR CONVERT_P2_TIMEOUTS_TO_TILE                                                   ; CONVERT P2 TIMEOUT VALUE TO TILE TO DRAW()
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS

sram_addr = LOCAL_1
	
RESTORE_SCREEN_P2_MENU_COVERED:                                                       ; CLEAR P2 MENU PPU()
	LDA #SPRITE_OFFSCREEN                                                             ; SET P2 MENU ARROW TO OFFSCREEN
	STA SECOND_MENU_ARROW_SPR_Y                                                       ; 
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	LDY #<P2_PLAY_CALL_MENU_PPU_ADDR                                                  ; SET PPU ADDRESS = $20B1
	LDX #>P2_PLAY_CALL_MENU_PPU_ADDR                                                  ;
	LDA #<P2_PLAY_CALL_MENU_SRAM                                                      ; SET DATA ADRESS = $6203 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P2_PLAY_CALL_MENU_SRAM                                                      ; 
	STA sram_addr + 1                                                                 ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH) 
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS

ppu_addr		= LOCAL_1	
sram_addr		= LOCAL_3	
	
DO_P2_OFF_TIMEOUT:                                                                    ; P2 OFF DO TIMEOUT ROUTINE()
	DEC P2_TIMEOUTS                                                                   ; DECREASE P2 TIMEOUTS BY 1 
	JSR CONVERT_P2_TIMEOUTS_TO_TILE                                                   ; CONVERT P2 TIMEOUT VALUE TO TILE TO DRAW()
	SET_CLOCK_TO_STOPPED
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	MMC3_SRAM_WRITE_ENABLE

@save_part_of_screen_p2_menu_covers:	
	LDA #<P2_TIMEOUT_MENU_PPU_ADDR                                                    ; SET PPU ADDRESS = $2132
	STA ppu_addr                                                                      ;
	LDA #>P2_TIMEOUT_MENU_PPU_ADDR                                                    ;
	STA ppu_addr + 1                                                                  ;
	LDA #<P2_TIMEOUT_MENU_SRAM                                                        ; SET DATA ADRESS = $6303 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P2_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr + 1                                                                 ;
	LDX #OFF_TIMEOUT_MENU_LENGTH                                                      ;
	LDY #OFF_TIMEOUT_MENU_HEIGHT   

	JSR TRANSFER_BUFFER_TO_SRAM                                                       ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH) 
	MMC3_SRAM_WRITE_DISABLE
	LDA #SPRITE_OFFSCREEN                                                             ; SET P2 MENU ARROW TO OFFSCREEN
	STA SECOND_MENU_ARROW_SPR_Y                                                       ; 
												                                      ; Draw Player 2 Offensive Timeout Menu
	LDA #P2_OFF_TIMEOUT_SCREEN_ID                                                     ; LOAD P2 OFFENSIVE MENU TIMEOUT EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16					
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ; DRAW EVENT (A= EVENT F= BANK CONTAINING EVENT)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS

DO_P2_DEF_TIMEOUT:                                                                    ; P2 DEF DO TIMEOUT ROUTINE()
	DEC P2_TIMEOUTS                                                                   ; DECREASE P2 TIMEOUTS BY 1 
	JSR CONVERT_P2_TIMEOUTS_TO_TILE                                                   ; CONVERT P2 TIMEOUT VALUE TO TILE TO DRAW()
	SET_CLOCK_TO_STOPPED
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	MMC3_SRAM_WRITE_ENABLE
	LDA #<P2_TIMEOUT_MENU_PPU_ADDR                                                    ; SET PPU ADDRESS = $2132
	STA ppu_addr                                                                      ;
	LDA #>P2_TIMEOUT_MENU_PPU_ADDR                                                    ;
	STA ppu_addr + 1                                                                  ;
	LDA #<P2_TIMEOUT_MENU_SRAM                                                        ; SET DATA ADRESS = $6303 in SRAM
	STA sram_addr                                                                     ;
	LDA #>P2_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr + 1                                                                 ;
	LDX #DEF_TIMEOUT_MENU_LENGTH                                                      ; SET DATA LENGTH =0x070C
	LDY #DEF_TIMEOUT_MENU_HEIGHT                                                      ;
	JSR TRANSFER_BUFFER_TO_SRAM                                                       ; UPDATE PPU(3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH)
	MMC3_SRAM_WRITE_DISABLE                                                           ;
	LDA #SPRITE_OFFSCREEN                                                             ; SET P2 MENU ARROW TO OFFSCREEN()
	STA SECOND_MENU_ARROW_SPR_Y                                                       ;
												                                      ; DRAW PLAYER 2 DEFENSIVE TIMEOUT MENU	
	LDA #P2_DEF_TIMEOUT_SCREEN_ID                                                     ; LOAD P2 DEFENSIVE MENU TIMEOUT EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                                        ; BANK16					;
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                              ; DRAW EVENT (A= EVENT F= BANK CONTAINING EVENT)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS

sram_addr = LOCAL_1
	
CLEAR_P2_TIME_OUT_SUB_MENU:                                                           ; CLEAR P2 TIME OUT SUB MENU PPU()
	JSR WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()
	LDY #<P2_TIMEOUT_MENU_PPU_ADDR                                                    ; SET PPU ADDRESS = $2132
	LDX #>P2_TIMEOUT_MENU_PPU_ADDR                                                    ;
	LDA #<P2_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr                                                                     ; SET DATA ADRESS = $6303 in SRAM
	LDA #>P2_TIMEOUT_MENU_SRAM                                                        ;
	STA sram_addr + 1                                                                 ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                                      ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR RESUME_TASK                                                                   ; RESUME TASK(X= TASK TO RESUME)
	RTS

_F}_DRAW_RESTORE_MENUS_DO_TIMEOUTS	
	
_F{_DRAW_ENTIRE_PLAYBOOK
	
ppu_addr	= LOCAL_1
	
DRAW_PLAYBOOK:                                                                        ; DRAW PLAYBOOK ()
	MMC3_SRAM_WRITE_ENABLE 
	LDA #PLAY_IMAGE_HEIGHT                                                            ; LOAD NUMBER OF VERTICAL TILES for PLAY IMAGE
	STA NUM_ROWS_PLAY_IMAGE_SRAM                                                      ;
	LDA #PLAY_IMAGE_LENGTH                                                            ;
	STA NUM_COLS_PLAY_IMAGE_SRAM                                                      ; LOAD NUMBER OF HORIZONTAL TILES for PLAY IMAGE

@if_p1_set_p1_playbook_offset	
	LDX #OFFSET_TO_P1_PLAYBOOK                                                        ; 
	LDA POSSESSION_STATUS                                                             ; LOAD POSSESSION STATUS
	BPL @save_playbook_offset                                                         ; IS P1-> YES
	
@else_set_p2_offset	
	LDX #OFFSET_TO_P2_PLAYBOOK                                                        ; SET PLAYBOOK INDEX FORWARD 8 SPOTS FOR P2
	
@save_playbook_offset:                                                                ; 
	STX CURRENT_PLAY_INDEX	                                                          ; SAVE PLAYBOOK INDEX   in $AC
	LDA #$00                                                                          ; SET PLAY IMAGE NUMBER TO ZERO
	STA CURRRENT_PLAY_IMAGE                                                           ; 
	
_WHILE CC                                                                             ; LOOP THROUGH ALL PLAYS

	LDA CURRRENT_PLAY_IMAGE                                                           ; LOAD PLAY IMAGE NUMBER
	ASL                                                                               ; SHIFT SINCE EACH POINTER IS 2 BYTES
	TAX                                                                               ;					
	LDA PLAY_IMAGE_PPU_ADDR_TABLE,X                                                   ; LOAD PLAY IMAGE PPU ADDRESS and SAVE  in 3E/3F
	STA ppu_addr                                                                      ;
	LDA PLAY_IMAGE_PPU_ADDR_TABLE+1,X                                                 ;
	STA ppu_addr +1                                                                   ;	 
	LDX CURRENT_PLAY_INDEX	                                                          ; LOAD PLAYBOOK INDEX (0 for P1, 8 for P2)
	LDA P1_P2_PLAYBOOKS[],X                                                           ; LOAD PLAYBOOK PLAY POINTER VALUE
	JSR DRAW_PLAYBOOK_PLAY_IMAGE                                                      ; DRAW PLAYBOOK IMAGE (A= PLAY IMAGE POINTER)
	LDX CURRENT_PLAY_INDEX	                                                          ; LOAD PLAYBOOK INDEX (0 for P1, 8 for P2)
	LDA P1_P2_PLAYBOOKS[],X                                                           ; LOAD PLAYBOOK PLAY POINTER VALUE
	JSR DRAW_RUN_PLAY_NAME_HEADER                                                     ; DRAW RUN PLAY HEADER IF RUN PLAY()
	INC CURRENT_PLAY_INDEX	                                                          ; LOAD CURRENT PLAYBOOK INDEX 
	INC CURRRENT_PLAY_IMAGE                                                           ; GO TO NEXT PLAY
	LDA CURRRENT_PLAY_IMAGE                                                           ;
	CMP #TOTAL_NUM_PLAYS_IN_PLAYBOOK                                                  ; ARE ALL PLAY DONE?
	
_END_WHILE                                                                            ; NO-> LOOP BACK TO LOOP THROUGH ALL PLAYS

	MMC3_SRAM_WRITE_DISABLE
	RTS                                                                               ; EXIT

_F}_DRAW_ENTIRE_PLAYBOOK	

_F{_PLAY_CHANGE_FROM_TEAM_DATA
	
play_to_draw			= LOCAL_6
	
DO_PLAY_CHANGE_IN_TEAM_DATA:                                                          ; DRAW SCROLLING PLAY WINDOW FOR TEAM DATA PLAY CHANGE
	MMC3_SRAM_WRITE_ENABLE
	LDA #PLAY_IMAGE_HEIGHT                                                            ; SET NUMBER OF VERTICAL PLAY TILES
	STA NUM_ROWS_PLAY_IMAGE_SRAM                                                      ;
	LDA #PLAY_IMAGE_LENGTH                                                            ; SET NUMBER OF HORIZONTAL PLAY TILES
	STA NUM_COLS_PLAY_IMAGE_SRAM                                                      ; 
	LDA play_to_draw                                                                  ; LOAD PLAY TO DRAW 
	JSR DRAW_PLAYBOOK_PLAY_IMAGE                                                      ; DRAW PLAY(A= PLAY TO DRAW)
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                                               ;
	
_F}_PLAY_CHANGE_FROM_TEAM_DATA

_F{_DRAW_PLAYBOOK_PLAY_IMAGE	
	

play_image_offset		= LOCAL_7
play_image_addr			= LOCAL_7

DRAW_PLAYBOOK_PLAY_IMAGE:                                                             ; DRAW PLAY IMAGE(A= PLAY NUMBER)
	LDX #NUM_TILES_PER_PLAY                                                           ; = LOAD 42 TILE MULTIPLIER
	JSR MULTIPLY_A_TIMES_X                                                            ; OFFSET = PLAY NUMBER x 42 TILES
	LDA play_image_offset                                                             ; = PLAY IMAGE TABLE ADDRESS + OFFSET
	CLC                                                                               ;
	ADC #<PLAY_IMAGE_TILES                                                            ;
	STA play_image_addr                                                               ;
	LDA play_image_offset+1                                                           ;
	ADC #>PLAY_IMAGE_TILES                                                            ;
	STA play_image_addr+1                                                             ;
	LDA POSSESSION_STATUS                                                             ; LOAD POSSESSION STATUS
	BMI @load_play_image_p2_side                                                      ; IS P2? YES-> BRANCH TO P2 SET LOOP COUNTER TO ZERO 
	
@load_play_image_p1_side	
	LDY #$00                                                                          ; SET TO FIRST TILE
	
_WHILE CC                                                                             ; P1 TRANSFER TILES TO SRAM
	LDA (play_image_addr),Y                                                           ; LOAD PLAY IMAGE TILE
	STA PLAY_IMAGE_TILES_SRAM,Y                                                       ; SAVE IN SRAM
	INY                                                                               ;
	CPY #NUM_TILES_PER_PLAY                                                           ; ALL TILES TRANSFERRED?  
	
_END_WHILE

	LDA #P1_SIDE_PLAY_IMAGE_TILES_CHR_BANK                                            ; LOAD IRQ SPLIT BG VALUE
	JMP SET_IRQ_BG_DRAW_IMAGE_FROM_SRAM                                               ;
	
@load_play_image_p2_side:                                                             ; P2 SET LOOP COUNTER TO ZERO
	LDX #$00                                                                          ; INITALIZE LOOP COUNTER
	
_WHILE CC

	LDY #PLAY_IMAGE_LENGTH -1                                                         ; SET TO SIXTH TILE SINCE THE IMAGE IS REVERSED
@do_one_row_loop:                                                                     ; P2 DO ROW OF PLAY IMAGE
	LDA (play_image_addr),Y                                                           ; LOAD PLAY IMAGE TILE
	STA PLAY_IMAGE_TILES_SRAM,X                                                       ; SAVE IN SRAM
	INX                                                                               ;
	DEY                                                                               ;
	BPL @do_one_row_loop                                                              ; ROW DONE? NO-> LOOP BACK TO P2 DO ROW OF PLAY IMAGE
	
	LDA play_image_addr                                                               ; INCREMENT TO NEXT ROW
	CLC                                                                               ;
	ADC #PLAY_IMAGE_LENGTH                                                            ; 
	STA play_image_addr                                                               ;
	LDA play_image_addr+1                                                             ;
	ADC #$00                                                                          ;
	STA play_image_addr+1                                                             ;
	CPX #NUM_TILES_PER_PLAY                                                           ; ALL TILES TRANSFERRED? 
	
_END_WHILE
	
	LDA #P2_SIDE_PLAY_IMAGE_TILES_CHR_BANK                                            ; SET IRQ SPLIT BG CHR VALUE
	
ppu_addr 	= LOCAL_1
sram_addr	= LOCAL_1 	

SET_IRQ_BG_DRAW_IMAGE_FROM_SRAM:
	STA IRQ_0_BG_0800                                                                 ; SET PLAY IMAGE TILE BANK
	LDY ppu_addr                                                                      ; SET PPU ADDRESS 
	LDX ppu_addr +1                                                                   ;
	LDA #<PLAY_IMAGE_INFO_SRAM                                                        ; SET DATA ADDRESS = $6003
	STA sram_addr                                                                     ;
	LDA #>PLAY_IMAGE_INFO_SRAM                                                        ;
	STA sram_addr +1                                                                  ;
	JMP DRAW_RECTANGULAR_IMAGE                                                        ; UPDATE PPU(3E,3F= DATA ADDRESS  X,Y= PPU ADDRESS)
	
_F}_DRAW_PLAYBOOK_PLAY_IMAGE	

_F{_DRAW_RUN_PLAY_BC_NAME

roster_id					= LOCAL_7
team_id						= LOCAL_8
run_play_table_bitmask		= $18


DRAW_RUN_PLAY_NAME_HEADER:                                                            ; DRAW RUN PLAY NAME HRADER IF NEEDED(A= PLAY NUMBER)
	CMP #PASS_PLAY_INDEX_START                                                        ; IS PLAY ID IMAGE RUN PLAY
	BCS @exit                                                                         ; NO-> BRANCH TO EXIT
	
@save_play_id				         			                                      ;	
	TAX                                                                               ;
	
@get_runner_roster_id:	
	LDY RUN_PLAY_PLAYER_HEADER,X                                                      ; GET RUN PLAY PLAYER POSITION (RB1, RB2, ETC) 
	LDA POSSESSION_STATUS                                                             ; IS P2?
	BMI @get_p2_team_and_roster_id                                                    ; YES-> BRANCH TO P2 
	
@get_p1_team_and_roster_id	
	LDA P1_PLAYER_TEAM_ID,Y                                                           ; LOAD ACTUAL P1 PLAYER PLAYING POSITION		
	STA team_id	                                                                      ;
	LDA P1_PLAYER_ROSTER_ID,Y                                                         ; 
	JMP @save_roster_id

@get_p2_team_and_roster_id                                                            ; P2
	LDA P2_PLAYER_TEAMID,Y                                                            ; LOAD ACTUAL P2 PLAYER PLAYING POSITION	
	STA team_id	
	LDA P2_PLAYER_ROSTER_ID,Y

@save_roster_id:                                                                      ; PREPARE DATA FOR DRAWING
	STA roster_id                                                                     ; 

@set_play_image_ppu_addr	
	TXA                                                                               ; LOAD PLAY NUMBER
	AND #run_play_table_bitmask                                                       ; GET RUN TEXT PPU ADDRESS
	LSR                                                                               ; DIVIDE BY 4 SINCE 8 plays per slot and each address is two bytes long 
	LSR                                                                               ;
	TAX                                                                               ;
	LDA PLAY_IMAGE_PPU_ADDR_TABLE,X                                                   ; LOAD LOW BYTE PPU ADDRESS
	SEC                                                                               ;
	SBC #OFFSET_TO_RUN_PLAY_HEADER                                                    ;
	TAY                                                                               ;
	LDA PLAY_IMAGE_PPU_ADDR_TABLE+1,X                                                 ; LOAD HIGH BYTE PPU ADDRESS
	SBC #$00                                                                          ;
	TAX                                                                               ;
	LDA #NUM_CHAR_RUN_PLAYER_NAME                                                     ; NUMBER OF CHARACTERS IN PLAYER NAME TO DRAW
	JMP DRAW_LAST_NAME_CHAR                                                           ; DRAW TEXT( X,Y= PPU ADDRESS, A= NUM CHARACTERS) 
@exit:
	RTS                                                                               ; EXIT

_F}_DRAW_RUN_PLAY_BC_NAME	
	
_F{_UPDATE_DISPLAYED_PLAY_NAME	

DRAW_INITIAL_PLAY_NAME_PLAY_CHANGE:                                                   ; MOVE TO DIFFERENT PLAY FOR TEAM DATA PLAY CHANGE
	LDA MENU_INDEX                                                                    ; LOAD MENU INDEX
	ASL                                                                               ;
	ASL                                                                               ; = MENU INDEX X 4
	CLC
	ADC MENU_X
	LDX POSSESSION_STATUS 
	BPL @get_current_play
	
@set_offset_to_p2_playbook:	
	CLC
	ADC #OFFSET_TO_P2_PLAYBOOK

@get_current_play:
	TAX 
	LDA P1_P2_PLAYBOOKS[],X

			

ppu_addr				= LOCAL_1	
play_offset 			= LOCAL_7
play_addr				= LOCAL_7 	

SET_DISPLAYED_PLAY_NAME:
	LDX #SIZE_OF_OFF_PLAY_INFO
	JSR MULTIPLY_A_TIMES_X
	ADD_16BIT_CONST_TO_ZP[val_addr] OFFENSIVE_PLAY_INFO_START, play_offset
	LDX #PLAY_NAME_AND_REACTIONS_BANK                                                 ; BANK15 LOAD PLAY NAME
	JSR SWAP_A000_BANK    
	LDY ppu_addr
	LDX ppu_addr+1
	LDA #PLAY_NAME_LENGTH
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE
	
	LDY #$00
_WHILE CC

	LDA (play_addr),Y							                                      ; SAVE PLAY NAME IN BG BUFFER		
	STA CURRENT_BG_BUFFER_LOC,X
	INX
	INY
	CPY #PLAY_NAME_LENGTH
	
_END_WHILE 
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY

play_index			= LOCAL_6

DRAW_CURRENT_PLAY_NAME_PLAY_CHANGE:								                      ; *** could move in front of displayed play for clarity 
	LDA play_index
	JMP SET_DISPLAYED_PLAY_NAME

_F}_UPDATE_DISPLAYED_PLAY_NAME	
	
_F{_SWAP_MENU_SPR_AND_MENU_INFO
	
SET_SPR_MENU_ARROW_LOC_AND_ATTR:                                                      ; SET MENU ARROW LOCATION AND ATTRIBUTE()
	SEC                                                                               ;
	ROR BANK_FLAG                                                                     ; 
	JSR SWAP_SPR_ARROW_INFO                                                           ; SWAP MENU ARROW SPRITE & MENU INDEX INFORMATION (P1, P2) 
	RTS                                                                               ; 

SET_SPR_MENU_ARROW_LOC_AND_ATTR_P2:       
	JSR SWAP_SPR_ARROW_INFO                                                           ; SWAP MENU ARROW SPRITE & MENU INDEX  INFORMATION (P1, P2) 
	LSR BANK_FLAG                                                                     ;
	RTS                                                                               ;
												                                      ; NOT SURE WHY THIS FUCNTION IS NEEDED BUT IT IS
SWAP_SPR_ARROW_INFO:                                                                  ; SWAP MENU ARROW SPRITE INFORMATION (P1, P2) 
	LDY #$FC      
_WHILE NOT_EQUAL
	LDX MENU_ARROW_SPR_INFO-$FC,Y                                                     ; SWAP P1 ARROW SPRITE INORMATION WITH P2 ARROW SPRITE INORMATION 
	LDA SECOND_MENU_ARROW_SPR_INFO-$FC,Y                                              ; (200-203 -> 204-208) (204-208 -> 200-203)
	STA MENU_ARROW_SPR_INFO-$FC,Y                                                     ;
	TXA                                                                               ;
	STA SECOND_MENU_ARROW_SPR_INFO-$FC,Y                                              ;
	INY                                                                               ;
_END_WHILE


P1_MENU_INFO_FOR_QUICKER_LOOP = $FF00 +  P1_MENU_INFO[] + MENU_INFO_LENGTH
P2_MENU_INFO_FOR_QUICKER_LOOP = $FF00 +  P2_MENU_INFO[] + MENU_INFO_LENGTH

	LDY #$FA                                                                          ;
_WHILE NOT_EQUAL                                                                      ; SWAP P1 ARROW INDEX INORMATION WITH P2 ARROW INDEX INORMATION 
	LDX P1_MENU_INFO_FOR_QUICKER_LOOP,Y                                               ; (E1-E6 -> E7-ED) (E7-ED -> E1-E6)
	LDA P2_MENU_INFO_FOR_QUICKER_LOOP,Y                                               ;
	STA P1_MENU_INFO_FOR_QUICKER_LOOP,Y                                               ;
	TXA                                                                               ;
	STA P2_MENU_INFO_FOR_QUICKER_LOOP,Y                                               ;
	INY                                                                               ;
_END_WHILE
	RTS                                                                               ;

WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK:                                       ; WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK  5()		
	LDA PPU_TRANSFER_STATUS                                                           ; IS PPU TRANSFER DONE?
	BPL @suspend_ready_task                                                           ; -> BRANCH TO PPU TRANSFER DONE SUSPEND TASK 5		
	RETURN_1_FRAME
	JMP WAIT_UNTIL_PPU_NOT_BUSY_SUSPEND_OPP_INPUT_TASK                                ; LOOP BACK TO WAIT TILL PPU TRANSFER DONE THEN SUSPEND TASK 5
@suspend_ready_task :                                                                 ; -> BRANCH TO PPU TRANSFER DONE SUSPEND TASK 5	
    SUSPEND_TASK_DIRECT[task] READY_SELECT_YARDLINE_TASK
	RTS                                                                               ; EXIT

_F}_SWAP_MENU_SPR_AND_MENU_INFO	

_F{_END_TASKS_AFTER_PPU_TRANSFER_DONE
	
END_OFF_AND_DRAW_TASK_AFTER_PPU_TRANS_DONE:                                           ; CHECK FOR PPU TRANSFER DONE THEN KILL TASK 2, TASK5 ()
_WHILE ALWAYS
	
	LDA PPU_TRANSFER_STATUS                                                           ; IS PPU TRANSFER DONE?
	BPL @end_tasks                                                                    ; YES-> BRANCH TO PPU TRANSFER DONE KILL TASK 2 AND 5	
	RETURN_1_FRAME
	
_END_WHILE
	
@end_tasks:                                                                           ; PPU TRANSFER DONE
	LDX #DEFENSE_PLAYCALL_TASK                                                        ; LOAD TASK 2 INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                                        ; END task(X= TASK)
	LDX #READY_SELECT_YARDLINE_TASK                                                   ; LOAD TASK 5 INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                                        ; END task(X= TASK)
	RTS
	
_F}_END_TASKS_AFTER_PPU_TRANSFER_DONE
	
_F{_CONVERT_TIMEOUTS_TO_TILES

CONVERT_P1_TIMEOUTS_TO_TILE:                                                          ; CONVERT P1 TIMEOUTS TO TILE GRAPHIC()
	LDA P1_TIMEOUTS                                                                   ; LOAD P1 TIMEOUTS
	LDY #<P1_TIMEOUTS_PPU_ADDR                                                        ; LOAD PPU ADDRESS = $212C
	LDX #>P1_TIMEOUTS_PPU_ADDR                                                        ;
	JMP CONVERT_2_DIG_NUM_TILES                                                       ; CONVERT NUMBER TO TILE AND DRAW(A= NUMBER)

CONVERT_P2_TIMEOUTS_TO_TILE:                                                          ; CONVERT P2 TIMEOUT TO TILE GRAPHIC ()
	LDA P2_TIMEOUTS                                                                   ; LOAD P1 TIMEOUTS
	LDY #<P2_TIMEOUTS_PPU_ADDR                                                        ; LOAD PPU ADDRESS = $212C
	LDX #>P2_TIMEOUTS_PPU_ADDR                                                        ;
	JMP CONVERT_2_DIG_NUM_TILES                                                       ; CONVERT NUMBER TO TILE AND DRAW(A= NUMBER)

_F}_CONVERT_TIMEOUTS_TO_TILES	

_F{_CLEAR_PLAYCALL_SCREENS_FULL_AND_PARTIAL

length = LOCAL_1	
height = LOCAL_2	
	
CLEAR_TEAM_NAMES_AND_SELECT_READY_AREA:                                               ; CLEAR PPU MEMORY TEAM NAMES,SELECT/READY()
	LDY #<P1_TEAM_NAME_SELECT_READY_PPU_ADDR                                          ; SET PPU START ADDRESS 
	LDX #>P1_TEAM_NAME_SELECT_READY_PPU_ADDR                                          ;
	LDA #$02                                                                          ; SET NUMBER OF LINES
	STA height                                                                        ;
	LDA #$0B                                                                          ; SET LENGTH
	STA length                                                                        ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                                                   ; CLEAR PPU(X,Y= ADDR, 3F= NUM lines, 3E= length)
	LDY #<P2_TEAM_NAME_SELECT_READY_PPU_ADDR-1                                        ; SET PPU START ADDRESS
	LDX #>P2_TEAM_NAME_SELECT_READY_PPU_ADDR                                          ;
	LDA #$02                                                                          ; SET NUMBER OF LINES
	STA height                                                                        ; 
	LDA #$0B                                                                          ; SET LENGTH
	STA length                                                                        ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                                                   ; CLEAR PPU(X,Y= ADDR, 3F= NUM lines, 3E= length)
	RTS
												                                      ; *** COULD BE IN LINE RATHER THAN jsr 
CLEAR_BOTH_SCREENS_EXCEPT_STATUS_BAR:                                                 ; CLEAR PLAY GRAPHICS AND NAMETABLE1 (2080,2400 ADDRESS START)
	LDY #<(NAMETABLE1_START + PLAY_CALL_STATUS_BAR_PPU_HEIGHT)	                      ; SET PPU START ADDRESS 
	LDX #>(NAMETABLE1_START + PLAY_CALL_STATUS_BAR_PPU_HEIGHT)	                      ;
	LDA #$1C                                                                          ; SET NUMBER OF LINES 
	STA height                                                                        ;
	LDA #$20                                                                          ; SET LENGTH
	STA length                                                                        ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                                                   ; CLEAR PPU(X,Y= ADDR, 3F= NUM lines, 3E= length)
	LDY #<NAMETABLE2_START                                                            ; SET PPU START ADDRESS 
	LDX #>NAMETABLE2_START                                                            ;
	LDA #$20                                                                          ; SET NUMBER OF LINES 	
	STA height                                                                        ;
	LDA #$20                                                                          ; SET LENGTH
	STA length                                                                        ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                                                   ; CLEAR PPU(X,Y= ADDR, 3F= NUM lines, 3E= length)
	JMP SET_ALL_SPR_OFFSCREEN

_F}_CLEAR_PLAYCALL_SCREENS_FULL_AND_PARTIAL	
	
_F{_DO_BANNER_ONCE_PREVIOUS_DONE_PLAYCALL	
	
DO_BANNER_ONCE_PREVIOUS_COMPLETE:                                                     ; *** didnt need to be routine WAIT TO LOAD BANNER SCENE UNTIL NONE PLAYING(A=BANNER)
	TAX                                                                               ; SAVE SCENE INDEX in X
	
@check_banner_done:                                                                   ; BANNER CHECK LOOP
	LDA BANNER_ID                                                                     ; LOAD CURRENT BANNER SCENE
	BEQ @set_new_banner_id                                                            ; ANY PLAYING? NO->BRANCH TO LOAD BANNER AND RETURN
	RETURN_1_FRAME
	JMP @check_banner_done                                                            ; YES-> LOOP BACK TO BANNER CHECK LOOP
	
@set_new_banner_id:                                                                   ; LOAD BANNER AND RETURN
	STX BANNER_ID
	RTS

_F}_DO_BANNER_ONCE_PREVIOUS_DONE_PLAYCALL		
	
_F{_GET_VALUES_FOR_CPU_PLAY_CALL_LOGIC

yards_for_first			= LOCAL_5
yardline_temp			= LOCAL_7
	
P1_ON_OFF_SET_VALUE_FOR_CPU_PLAY_CALL_LOGIC:                                          ; P1 O LOAD VALUES(DOWN, YARDLINE, ETC FOR COM LOGIC THEN DO COM PLAY LOGIC)
	LDA #$00
	STA CPU_SIDE_SAME_AS_OFF_BOOL                 
	JSR P1_ON_OFF_GET_SCORE_TIMEOUTS
	LDX P1_TEAM                             
	LDA TEAM_OFFENSIVE_STYLE,X                  
	STA OFFENSIVE_STYLE
	JMP P1_ON_OFF_GET_YARDS_TO_FIRST

P2_ON_DEF_SET_VALUE_FOR_CPU_PLAY_CALL_LOGIC:
	LDA #$80
	STA CPU_SIDE_SAME_AS_OFF_BOOL
	JSR P2_ON_OFF_GET_SCORE_TIMEOUTS
	JMP P1_ON_OFF_GET_YARDS_TO_FIRST

P2_ON_OFF_SET_VALUE_FOR_CPU_PLAY_CALL_LOGIC:                                          ; P2 O LOAD VALUES(DOWN, YARDLINE, ETC FOR P2 COM LOGIC THEN DO COM PLAY LOGIC)       
	LDA #$00
	STA CPU_SIDE_SAME_AS_OFF_BOOL
	JSR P2_ON_OFF_GET_SCORE_TIMEOUTS
	LDX P2_TEAM
	LDA TEAM_OFFENSIVE_STYLE,X
	STA OFFENSIVE_STYLE
	JMP P2_ON_OFF_GET_YARDS_TO_FIRST

P1_ON_DEF_SET_VALUE_FOR_CPU_PLAY_CALL_LOGIC:                                          ; P1 ON D LOAD VALUES(DOWN, YDLN, & DO COM PLAY LOGIC)
	LDA #$80
	STA CPU_SIDE_SAME_AS_OFF_BOOL
	JSR P1_ON_OFF_GET_SCORE_TIMEOUTS
	JMP P2_ON_OFF_GET_YARDS_TO_FIRST

P1_ON_OFF_GET_SCORE_TIMEOUTS:
	LDA P1_TOTAL_SCORE
	STA CPU_OFF_SCORE
	LDA P2_TOTAL_SCORE
	STA CPU_OPP_SCORE
	LDA P1_TIMEOUTS
	STA CPU_OFF_TIMEOUTS
	RTS

P2_ON_OFF_GET_SCORE_TIMEOUTS:
	LDA P2_TOTAL_SCORE
	STA CPU_OFF_SCORE
	LDA P1_TOTAL_SCORE
	STA CPU_OPP_SCORE
	LDA P2_TIMEOUTS
	STA CPU_OFF_TIMEOUTS
	RTS

P1_ON_OFF_GET_YARDS_TO_FIRST:
	LDA #<FRONT_RIGHT_ENDZONE					                                      ; RIGHT ENDZONE - LOS X = YARDLINE 
	SEC
	SBC LOS_X
	STA yardline_temp
	LDA #>FRONT_RIGHT_ENDZONE
	SBC LOS_X+1
	STA yardline_temp+1
	LDA FD_MARKER_X
	CLC
	ADC #$50									                                      ; ADD 10 yards 
	STA yards_for_first
	LDA FD_MARKER_X+1
	ADC #$00
	STA yards_for_first+1
	LDA yards_for_first
	CMP #<FRONT_RIGHT_ENDZONE	
	LDA yards_for_first+1
	SBC #>FRONT_RIGHT_ENDZONE
	BCC @Loop1
	LDA #<FRONT_RIGHT_ENDZONE	
	STA yards_for_first
	LDA #>FRONT_RIGHT_ENDZONE
	STA yards_for_first+1
@Loop1:
	LDA yards_for_first
	SEC
	SBC LOS_X
	STA yards_for_first
	LDA yards_for_first+1
	SBC LOS_X+1
	STA yards_for_first+1
	JMP SWAP_AND_DO_CPU_PLAY_CALL

P2_ON_OFF_GET_YARDS_TO_FIRST:
	LDA LOS_X
	SEC
	SBC #<FRONT_LEFT_ENDZONE
	STA yardline_temp
	LDA LOS_X+1
	SBC #>FRONT_LEFT_ENDZONE
	STA yardline_temp+1
	LDA FD_MARKER_X
	SEC
	SBC #$50
	STA yards_for_first
	LDA FD_MARKER_X+1
	SBC #$00
	STA yards_for_first+1
	LDA yards_for_first
	CMP #<FRONT_LEFT_ENDZONE
	LDA yards_for_first+1
	SBC #>FRONT_LEFT_ENDZONE
	BCS @Loop1
	LDA #<FRONT_LEFT_ENDZONE
	STA yards_for_first
	LDA #>FRONT_LEFT_ENDZONE
	STA yards_for_first+1
@Loop1:
	LDA LOS_X
	SEC
	SBC yards_for_first
	STA yards_for_first
	LDA LOS_X+1
	SBC yards_for_first+1
	STA yards_for_first+1
	JMP SWAP_AND_DO_CPU_PLAY_CALL
	
	
_F}_GET_VALUES_FOR_CPU_PLAY_CALL_LOGIC	

_F{_DO_SCOREBOARD_IF_QTR_OVER_PLAY_CALL

DO_SCOREBOARD_IF_QTR_OVER:                                                            ; CHECK FOR QTR OVER IF OVER DO FADE OUT AND SCOREBOARD AND RETURN()
	IF_GAME_STATUS_END_OF_QTR[ADDR] FADE_OUT_AND_DO_SCOREBOARD

@else	
	RTS                                                                               ; return
	
FADE_OUT_AND_DO_SCOREBOARD:
	PLA                                                                               ; Remove return locatoin
	PLA
	JSR END_OFF_AND_DRAW_TASK_AFTER_PPU_TRANS_DONE                                    ; CHECK FOR PPU TRANSFER DONE THEN KILL TASK 2, TASK5 ()
	JSR FADE_OUT_BG_SPR_PAL                                                           ; FADE PALLETE()	
	SET_GAME_STATUS_QTR_NOT_OVER[]
	JSR SUSPEND_TASK                                                                  ; SUSPEND CURRENT TASK()
	JMP DRAW_PLAY_SELECT_SCREEN_START                                                 ;
	
_F}_DO_SCOREBOARD_IF_QTR_OVER_PLAY_CALL	

_F{_GET_OFF_STYLES_AND_RUNNER_FOR_SKIP_MODE	
	
	
	
GET_OFFENSIVE_STYLES_AND_RUNNERS:                                                     ; SKP MODE LOAD OFFENSIVE STYLE AND RUNNER INFORMATION for P1 P2
	LDX P1_TEAM
	LDA TEAM_OFFENSIVE_STYLE,X
	STA P1_TEAM_OFFENSIVE_STYLE
	LDX P2_TEAM
	LDA TEAM_OFFENSIVE_STYLE,X
	STA P2_TEAM_OFFENSIVE_STYLE
	
	LDY #$00
	
_WHILE CC
	LDX P1_PLAYBOOK_EDIT,Y
	LDA RUN_PLAY_PLAYER_HEADER,X
	LSR
	STA P1_SKP_MODE_RUN_PLAY_RUNNERS,Y
	INY
	CPY #NUM_RUN_PLAYS
	
_END_WHILE 

	LDY #$00	
_WHILE CC
	LDX P2_PLAYBOOK_EDIT,Y
	LDA RUN_PLAY_PLAYER_HEADER,X
	LSR
	STA P2_SKP_MODE_RUN_PLAY_RUNNERS,Y
	INY
	CPY #NUM_RUN_PLAYS
_END_WHILE

	RTS
	
_F}_GET_OFF_STYLES_AND_RUNNER_FOR_SKIP_MODE	

_F{_VARIOUS_DATA_PLAYCALL_SCREEN

P1_OFFENSE_MENU_INFO:                                                                 ; OFFENSIVE DRAW INFO P1
	.DB $00,$00,$20                                                                   ; ARROW TILE NUMBER, ARROW ATTRIBUTES,  ARROW X LOCATION
	.DB $05                                                                           ; NUMBER OF CHOICES
	.DB $38, $48, $58, $68, $78                                                       ; Y LOCATIONS FOR CHOICES

P2_DEFENSE_MENU_INFO:                                                                 ; DEFENSIVE DRAW INFO P2
	.DB $00, $00, $90                                                                 ; ARROW TILE NUMBER, ARROW ATTRIBUTES,  ARROW X LOCATION
	.DB $02                                                                           ; NUMBER OF CHOICES
	.DB $38, $48                                                                      ; Y LOCATIONS FOR CHOICES

P1_DEFENSE_MENU_INFO:                                                                 ; DEFENSIVE DRAW INFO P1
	.DB $00,$00,$20                                                                   ; ARROW TILE NUMBER, ARROW ATTRIBUTES,  ARROW X LOCATION
	.DB $02                                                                           ; NUMBER OF CHOICES
	.DB $38, $48                                                                      ; Y LOCATIONS FOR CHOICES

P2_OFFENSE_MENU_INFO:                                                                 ; OFFENSIVE DRAW INFO P2
	.DB $00,$00,$90                                                                   ; ARROW TILE NUMBER, ARROW ATTRIBUTES,  ARROW X LOCATION
	.DB $05                                                                           ; number of choices
	.DB $38, $48, $58, $68, $78                                                       ; Y LOCATIONS FOR CHOICES

PLAY_SELECT_FLASHING_PALLETE_VALUES:                                                  ; PLAY SELECT PALLETE (BUFFER ONLY?)
	.DB $21, $25, $24, $2A, $31, $28, $30, $11

SELECT_TEXT_INFO:                                                                     ; SELECT			
	.DB $06                                                                           ; LENGTH OF TEXT
	.DB $60, $61, $62, $61, $63, $64                                                  ; S,E,L,E,C,T
	.DB $FF                                                                           ; END OF TEXT

READY_TEXT_INFO:                                                                      ; READY ! 
	.DB $07                                                                           ; LENGTH OF TEXT
	.DB $65, $66, $67, $68, $69, $00, $6A                                             ; R,E,A,D,Y, ,!
	.DB $FF                                                                           ; END OF TEXT

JOY_PAD_DIRECTION_BITMASK_TABLE:                                                      ; JOYPAD INPUT CONVERT TABLE
	.DB $FF, $02, $01, $FF, $03, $FF, $FF, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF

PLAY_SELECT_SCREEN_IRQ_INFO:                                                          ; IRQ TABLE
	.DB $00,$00,$18
	.DB $20,$00

PLAY_IMAGE_PPU_ADDR_TABLE:                                                            ; PPU START LOCATIONS FOR PLAY PICTURE
	.WORD PLAY_IMAGE_ONE_PPU_ADDR, PLAY_IMAGE_TWO_PPU_ADDR, PLAY_IMAGE_THREE_PPU_ADDR, PLAY_IMAGE_FOUR_PPU_ADDR
	.WORD PLAY_IMAGE_FIVE_PPU_ADDR, PLAY_IMAGE_SIX_PPU_ADDR	, PLAY_IMAGE_SEVEN_PPU_ADDR, PLAY_IMAGE_EIGHT_PPU_ADDR

RUN_PLAY_PLAYER_HEADER:                                                               ; RUN_PLAY_PLAYER_HEADERS

	.DB $02, $02, $02, $02, $02, $02, $02, $04
	.DB $02, $02, $02, $02, $02, $02, $02, $02
	.DB $02, $02, $04, $04, $04, $04, $06, $08
	.DB $00, $00, $00, $02, $04, $04, $04, $06

TEAM_OFFENSIVE_STYLE:                                                                 ; TEAM_OFFENSIVE_STYLE
	.DB $00, $02, $02, $02, $00
	.DB $00, $03, $03, $00
	.DB $00, $01, $01, $00, $00
	.DB $00, $01, $00, $00, $00
	.DB $00, $02, $03, $00, $00
	.DB $02, $02, $00, $02
	.DB $00, $00, $00, $00

_F}_VARIOUS_DATA_PLAYCALL_SCREEN	

_F{_PLAY_IMAGE_TILES

PLAY_IMAGE_TILES                                                                      ; PLAY_PICTURES
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01
	.DB $01, $90, $01, $96, $01, $01
	.DB $01, $98, $99, $9C, $01, $01
	.DB $01, $9A, $01, $91, $01, $01
	.DB $01, $C2, $B1, $B4, $01, $01
	.DB $01, $01, $01, $91, $01, $01

	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01
	.DB $01, $91, $E8, $96, $01, $01
	.DB $01, $01, $98, $9C, $01, $01
	.DB $01, $91, $9A, $91, $01, $01
	.DB $01, $01, $C2, $B4, $01, $01
	.DB $01, $01, $01, $91, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $94, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $91, $AF, $8D, $9C, $01, $01
	.DB $01, $01, $C2, $9E, $B4, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $91, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $90, $01, $01
	.DB $01, $01, $95, $9E, $B4, $01
	.DB $91, $AF, $97, $9C, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $90, $01, $01

	.DB $01, $A0, $A1, $91, $01, $01
	.DB $01, $8F, $01, $93, $01, $01
	.DB $01, $98, $92, $96, $01, $01
	.DB $01, $93, $01, $9C, $01, $01
	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $94, $91, $01, $01
	.DB $01, $01, $9F, $90, $01, $01
	.DB $01, $01, $9F, $96, $01, $01
	.DB $91, $8D, $B7, $9C, $01, $01
	.DB $01, $C2, $B7, $9E, $B4, $01
	.DB $01, $01, $BD, $01, $01, $01
	.DB $01, $01, $01, $01, $01, $01

	.DB $01, $A0, $A1, $91, $01, $01
	.DB $01, $8F, $01, $90, $01, $01
	.DB $01, $8F, $01, $96, $01, $01
	.DB $01, $9B, $B1, $9C, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $91, $98, $99, $9C, $01, $01
	.DB $01, $9A, $93, $96, $01, $01
	.DB $01, $C2, $B4, $01, $01, $01
	.DB $01, $01, $01, $90, $01, $01

	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01
	.DB $01, $93, $01, $96, $01, $01
	.DB $01, $95, $A3, $A6, $A1, $01
	.DB $01, $93, $01, $91, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $90, $01, $01
	.DB $01, $01, $95, $9E, $B4, $01
	.DB $91, $AF, $97, $9C, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $90, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $91, $AF, $A3, $A6, $A1, $01
	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $A0, $A1, $91, $01, $01
	.DB $01, $8F, $01, $90, $01, $01
	.DB $01, $98, $92, $96, $01, $01
	.DB $01, $93, $01, $9C, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $90, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $90, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $91, $AF, $98, $9C, $01, $01
	.DB $01, $01, $9A, $96, $01, $01
	.DB $01, $01, $C2, $B4, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $94, $91, $01, $01
	.DB $01, $01, $9F, $90, $01, $01
	.DB $01, $01, $9F, $96, $01, $01
	.DB $91, $98, $B7, $9C, $01, $01
	.DB $01, $8F, $9F, $96, $01, $01
	.DB $01, $9A, $BD, $01, $01, $01
	.DB $01, $C2, $B4, $01, $01, $01

	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01
	.DB $01, $8E, $92, $96, $01, $01
	.DB $01, $C2, $CB, $9C, $01, $01
	.DB $01, $91, $D2, $C8, $A1, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01
	.DB $01, $91, $E8, $96, $01, $01
	.DB $01, $01, $98, $9C, $01, $01
	.DB $01, $91, $9A, $91, $01, $01
	.DB $01, $01, $C2, $B1, $B4, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $8E, $A0, $B3, $A1, $01
	.DB $01, $B2, $97, $BF, $01, $01
	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $91, $98, $99, $9C, $01, $01
	.DB $01, $9A, $94, $91, $01, $01
	.DB $01, $C2, $B1, $B1, $B4, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $A0, $A1, $93, $01, $01
	.DB $01, $8F, $01, $94, $01, $01
	.DB $91, $8F, $01, $96, $01, $01
	.DB $01, $98, $B1, $9C, $01, $01
	.DB $01, $93, $01, $91, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $F9, $B6, $93, $01, $01
	.DB $01, $95, $B7, $9E, $B4, $01
	.DB $01, $98, $B7, $9C, $01, $01
	.DB $01, $93, $9F, $96, $01, $01
	.DB $01, $01, $BD, $01, $01, $01
	.DB $01, $01, $01, $01, $01, $01

	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01
	.DB $01, $93, $95, $9E, $B4, $01
	.DB $01, $95, $97, $9C, $01, $01
	.DB $01, $93, $01, $91, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $A0, $A1, $91, $01, $01
	.DB $01, $8F, $01, $90, $01, $01
	.DB $01, $8F, $01, $96, $01, $01
	.DB $01, $9B, $99, $9C, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $90, $01, $01

	.DB $A0, $A8, $A9, $AC, $01, $01
	.DB $8F, $BB, $01, $90, $01, $01
	.DB $8F, $8F, $01, $96, $01, $01
	.DB $8F, $9B, $99, $9C, $01, $01
	.DB $9A, $01, $01, $96, $01, $01
	.DB $C2, $B4, $01, $01, $01, $01
	.DB $01, $01, $01, $90, $01, $01

	.DB $01, $A0, $A1, $91, $01, $01
	.DB $01, $8F, $01, $90, $01, $01
	.DB $01, $8F, $01, $96, $01, $01
	.DB $91, $BE, $98, $9C, $01, $01
	.DB $01, $8F, $8F, $96, $01, $01
	.DB $01, $9A, $BB, $01, $01, $01
	.DB $01, $C2, $AF, $BA, $01, $01

	.DB $01, $A0, $A1, $91, $01, $01
	.DB $01, $8F, $01, $93, $01, $01
	.DB $01, $9A, $01, $96, $01, $01
	.DB $91, $C2, $B1, $9C, $01, $01
	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $A0, $A1, $01, $01, $01
	.DB $01, $8F, $01, $94, $01, $01
	.DB $01, $8F, $01, $96, $01, $01
	.DB $01, $9B, $99, $BF, $01, $01
	.DB $01, $93, $94, $91, $01, $01
	.DB $01, $01, $94, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $01, $93, $AE, $A6, $A1, $01
	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $90, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $91, $B1, $A3, $A6, $A1, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01
	.DB $01, $93, $01, $96, $01, $01
	.DB $01, $95, $A3, $A6, $A1, $01
	.DB $01, $93, $01, $91, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $91, $B1, $A3, $A6, $A1, $01
	.DB $01, $91, $01, $96, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $01, $90, $01, $01

	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $AA, $AB, $B3, $A1, $01
	.DB $01, $9B, $99, $BF, $01, $01
	.DB $01, $01, $01, $91, $01, $01
	.DB $01, $01, $01, $93, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $B8, $A9, $AC, $01, $01, $01
	.DB $98, $99, $B9, $94, $01, $01
	.DB $8F, $91, $8F, $96, $01, $01
	.DB $8F, $01, $98, $9C, $01, $01
	.DB $9A, $91, $BC, $91, $01, $01
	.DB $C2, $B1, $B4, $01, $01, $01
	.DB $01, $01, $01, $94, $01, $01

	.DB $E2, $01, $D8, $B1, $B1, $B4
	.DB $E8, $01, $94, $CA, $01, $01
	.DB $EC, $95, $9E, $BC, $01, $01
	.DB $EA, $BE, $9C, $01, $01, $01
	.DB $91, $BC, $91, $01, $01, $CA
	.DB $01, $01, $01, $01, $01, $8F
	.DB $01, $01, $91, $B1, $B1, $BC

	.DB $01, $94, $C8, $C1, $B1, $B4
	.DB $A0, $AB, $AB, $C0, $A1, $01
	.DB $8F, $01, $96, $C2, $C3, $01
	.DB $93, $C9, $9C, $01, $01, $01
	.DB $01, $01, $91, $01, $01, $01
	.DB $01, $91, $B1, $C4, $AB, $A1
	.DB $01, $01, $E4, $C6, $B4, $01

	.DB $01, $01, $D8, $B1, $B1, $C3
	.DB $01, $01, $94, $01, $01, $01
	.DB $91, $CB, $96, $01, $01, $01
	.DB $FA, $E1, $9C, $01, $01, $01
	.DB $EC, $E3, $91, $01, $01, $01
	.DB $E9, $C2, $C3, $01, $95, $CC
	.DB $01, $01, $91, $B1, $DC, $01

	.DB $01, $E0, $91, $B1, $CB, $01
	.DB $01, $8F, $90, $01, $C2, $C3
	.DB $B8, $E6, $96, $01, $01, $01
	.DB $EC, $BC, $9C, $01, $01, $01
	.DB $E8, $01, $96, $EB, $01, $01
	.DB $E9, $01, $01, $C2, $C3, $D3
	.DB $01, $01, $91, $B1, $B1, $DC

	.DB $E2, $94, $91, $B1, $B1, $B4
	.DB $E8, $9F, $E4, $CE, $01, $01
	.DB $ED, $9F, $96, $01, $01, $01
	.DB $EF, $B5, $9C, $01, $01, $01
	.DB $01, $9F, $96, $AB, $CE, $01
	.DB $01, $9F, $01, $01, $01, $01
	.DB $01, $9F, $AB, $AB, $AB, $CE

	.DB $01, $01, $D8, $B1, $CB, $01
	.DB $01, $01, $94, $01, $C2, $C3
	.DB $95, $93, $96, $01, $01, $01
	.DB $C9, $E7, $A6, $AB, $EE, $01
	.DB $8F, $93, $91, $01, $01, $01
	.DB $9A, $01, $01, $01, $01, $01
	.DB $C2, $B4, $94, $AB, $AB, $A1

	.DB $01, $01, $D8, $B1, $B1, $B4
	.DB $01, $E0, $94, $AB, $EB, $01
	.DB $01, $93, $96, $01, $C2, $C3
	.DB $01, $C9, $9C, $01, $01, $01
	.DB $01, $93, $91, $01, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $94, $AB, $AB, $EE

	.DB $01, $01, $91, $B1, $B1, $B4
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $91, $C7, $A6, $AB, $A1, $01
	.DB $01, $93, $96, $01, $01, $01
	.DB $01, $01, $01, $01, $01, $D4
	.DB $01, $01, $D8, $B1, $B1, $DC

	.DB $01, $01, $91, $B1, $CC, $01
	.DB $01, $01, $90, $01, $01, $01
	.DB $01, $95, $9E, $B4, $01, $01
	.DB $91, $CD, $9C, $01, $01, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $94, $AB, $AB, $CE

	.DB $01, $01, $91, $B1, $B1, $B4
	.DB $01, $01, $94, $01, $01, $01
	.DB $B8, $CF, $96, $01, $01, $01
	.DB $EC, $A3, $D5, $01, $01, $01
	.DB $E9, $99, $D7, $01, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $94, $AB, $AB, $CE

	.DB $A0, $A1, $91, $B1, $B1, $C5
	.DB $8F, $01, $D8, $B1, $C5, $01
	.DB $93, $01, $96, $01, $01, $01
	.DB $9B, $99, $BF, $01, $01, $01
	.DB $01, $01, $91, $01, $01, $01
	.DB $01, $01, $D8, $B1, $C5, $01
	.DB $01, $01, $94, $AB, $AB, $EE

	.DB $01, $01, $91, $B1, $CC, $01
	.DB $01, $01, $E4, $AB, $AB, $A1
	.DB $01, $01, $96, $01, $01, $01
	.DB $91, $C9, $9C, $01, $01, $01
	.DB $01, $01, $91, $01, $01, $01
	.DB $01, $01, $D8, $B1, $CC, $01
	.DB $01, $01, $94, $AB, $AB, $A1

	.DB $E0, $91, $B1, $B1, $B1, $C3
	.DB $8F, $01, $94, $EB, $01, $01
	.DB $93, $01, $96, $C2, $C3, $01
	.DB $01, $C9, $9C, $01, $01, $01
	.DB $90, $01, $91, $01, $01, $01
	.DB $9A, $01, $01, $A0, $EB, $01
	.DB $C2, $C3, $91, $DC, $C2, $C3

	.DB $01, $01, $91, $B1, $B1, $C5
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $8E, $C9, $9C, $01, $01, $01
	.DB $E3, $94, $96, $01, $01, $01
	.DB $E3, $C2, $F7, $CE, $01, $01
	.DB $C2, $C3, $E4, $AB, $AB, $A1

	.DB $01, $01, $E4, $AB, $CE, $01
	.DB $01, $01, $94, $01, $01, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $01, $C9, $9C, $01, $CA, $01
	.DB $91, $F7, $B3, $FE, $BC, $01
	.DB $01, $9F, $FB, $C0, $AB, $A1
	.DB $01, $9F, $90, $C2, $C3, $01

	.DB $01, $01, $91, $B1, $B1, $C5
	.DB $01, $01, $E4, $EB, $01, $01
	.DB $01, $01, $96, $C2, $C3, $01
	.DB $91, $C9, $9C, $01, $01, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $E4, $AB, $AB, $CE

	.DB $01, $01, $01, $D8, $B1, $C3
	.DB $94, $D0, $E0, $94, $01, $01
	.DB $B8, $A2, $8F, $96, $01, $01
	.DB $E9, $A4, $BE, $9C, $01, $01
	.DB $94, $AB, $D1, $91, $01, $01
	.DB $01, $01, $01, $01, $01, $CA
	.DB $01, $01, $01, $91, $B1, $BC

	.DB $01, $01, $91, $B1, $B1, $B4
	.DB $01, $01, $90, $01, $01, $01
	.DB $01, $95, $9E, $B4, $01, $01
	.DB $91, $CD, $9C, $01, $01, $01
	.DB $01, $01, $96, $AB, $CE, $01
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $E4, $AB, $AB, $A1

	.DB $A0, $A1, $91, $B1, $FF, $B4
	.DB $8F, $01, $D8, $B1, $BC, $01
	.DB $93, $01, $96, $01, $01, $01
	.DB $9B, $99, $BF, $01, $01, $01
	.DB $01, $01, $91, $01, $D3, $01
	.DB $01, $01, $D8, $B1, $DC, $01
	.DB $01, $01, $94, $AB, $AB, $A1

	.DB $01, $01, $91, $B1, $B1, $B4
	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $96, $01, $A0, $A1
	.DB $91, $C9, $9C, $01, $8F, $01
	.DB $01, $01, $DA, $AB, $D1, $CA
	.DB $01, $01, $D8, $B1, $B1, $BC
	.DB $01, $01, $94, $AB, $AB, $A1

	.DB $01, $01, $91, $B1, $B1, $B4
	.DB $01, $01, $E4, $AB, $EE, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $F3, $F2, $A6, $A1, $01, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $01, $01, $01, $01, $01, $CA
	.DB $01, $01, $94, $AB, $AB, $D1

	.DB $01, $94, $91, $B1, $B1, $CC
	.DB $01, $9F, $E4, $CE, $01, $01
	.DB $B8, $A5, $96, $01, $01, $01
	.DB $93, $B0, $9C, $01, $01, $01
	.DB $01, $9F, $96, $01, $01, $01
	.DB $01, $9F, $AB, $AB, $AB, $CE
	.DB $01, $01, $01, $01, $01, $01

	.DB $01, $01, $D8, $B1, $B1, $B4
	.DB $01, $01, $94, $AB, $EB, $01
	.DB $91, $01, $96, $01, $C2, $C3
	.DB $01, $C9, $9C, $01, $01, $01
	.DB $8E, $01, $91, $01, $01, $01
	.DB $C2, $F7, $AB, $AB, $CE, $01
	.DB $01, $01, $94, $AB, $AB, $EE

	.DB $01, $01, $01, $01, $01, $01
	.DB $01, $01, $94, $AB, $CE, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $9B, $99, $BF, $01, $01, $01
	.DB $91, $FD, $F6, $AB, $CE, $01
	.DB $01, $94, $FC, $AB, $EE, $01
	.DB $01, $01, $94, $AB, $AB, $CE

	.DB $01, $01, $91, $B1, $B1, $B4
	.DB $01, $01, $D8, $B1, $B1, $B4
	.DB $91, $B1, $9E, $B1, $CC, $01
	.DB $9B, $99, $BF, $01, $01, $01
	.DB $01, $01, $91, $01, $01, $01
	.DB $01, $01, $D8, $F7, $AB, $CE
	.DB $01, $01, $94, $AB, $AB, $A1

	.DB $A0, $A1, $91, $B1, $B1, $C3
	.DB $8F, $01, $D8, $B1, $C3, $01
	.DB $8F, $01, $96, $01, $01, $01
	.DB $93, $C9, $9C, $01, $01, $01
	.DB $01, $01, $91, $01, $01, $01
	.DB $01, $01, $D8, $B1, $B1, $B4
	.DB $01, $01, $91, $B1, $B1, $C3

	.DB $01, $01, $91, $B1, $F7, $CE
	.DB $01, $01, $E4, $CE, $01, $01
	.DB $01, $01, $96, $01, $01, $01
	.DB $8E, $C9, $9C, $01, $01, $01
	.DB $D2, $EB, $96, $F1, $AB, $CE
	.DB $01, $C2, $B1, $BC, $01, $01
	.DB $01, $01, $E4, $AB, $AB, $CE

	.DB $01, $01, $E0, $01, $01, $01
	.DB $01, $95, $D6, $BA, $01, $01
	.DB $95, $DC, $8F, $90, $01, $01
	.DB $BB, $DF, $DD, $96, $01, $01
	.DB $C9, $BA, $AF, $9C, $01, $01
	.DB $01, $01, $01, $96, $01, $01
	.DB $01, $01, $01, $E4, $AB, $CE

	.DB $01, $01, $91, $B1, $B1, $B4
	.DB $94, $B6, $D8, $B1, $C3, $01
	.DB $01, $9F, $96, $01, $01, $01
	.DB $01, $C9, $9C, $01, $01, $01
	.DB $90, $9F, $96, $EB, $01, $01
	.DB $9A, $9F, $AB, $F5, $AB, $CE
	.DB $C2, $F7, $A1, $01, $01, $01

	.DB $01, $94, $91, $B1, $B1, $C5
	.DB $01, $F8, $AB, $EB, $D3, $01
	.DB $01, $9F, $96, $C2, $BC, $01
	.DB $01, $C9, $9C, $01, $A0, $A1
	.DB $01, $9F, $96, $01, $8F, $01
	.DB $01, $9F, $AB, $AB, $D1, $01
	.DB $01, $01, $94, $AB, $AB, $A1

	.DB $01, $DB, $91, $B1, $B1, $B4
	.DB $01, $8F, $D8, $B1, $B1, $C3
	.DB $01, $93, $96, $01, $01, $01
	.DB $01, $9B, $BF, $01, $01, $01
	.DB $01, $01, $91, $01, $CA, $01
	.DB $01, $01, $D8, $B1, $BC, $01
	.DB $01, $01, $91, $B1, $B1, $B4

	.DB $01, $01, $90, $01, $01, $01
	.DB $01, $D3, $E5, $B1, $B1, $B4
	.DB $01, $8F, $F0, $DE, $B1, $C3
	.DB $01, $8F, $96, $E3, $01, $01
	.DB $96, $D9, $BF, $E3, $01, $01
	.DB $01, $01, $91, $C2, $C3, $01
	.DB $01, $01, $94, $AB, $AB, $A1
	
_F}_PLAY_IMAGE_TILES

.PAD $A000, $FF