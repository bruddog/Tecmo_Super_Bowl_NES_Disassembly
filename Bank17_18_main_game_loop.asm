.BASE $8000
.ORG $8000


BANK_JUMP_GAME_START: 
	JMP GAME_START                                   			; START GAME MAIN LOOP

JUMP_PLAYER_INJURED: 
	JMP SWAP_BANK_THEN_DO_UPDATE_STARTERS                        ; PLAYER INJURED UPDATE STARTERS
	
UNUSED_BANK_17_JUMP: 
	JMP UNUSED_BANK_17_JUMP                                     ; UNUSED

JUMP_CHANGE_PLAYERS: 
	JMP IN_GAME_CHANGE_PLAYERS                                  ; CHANGE PLAYERS
	
JUMP_UPDATE_SCOREBOARD_SKP_MODE: 
	JMP UPDATE_SCOREBOARD_CONDITIONS_SKP_MODE             		; UPDATE SCOREBOARD PPU, CLEAR PPU SECTION AND CLEAR SCORES 800C

JUMP_UPDATE_LARGE_SCOREBOARD: 
	JMP UPDATE_LARGE_SCOREBOARD                          		 ; UPDATE SCOREBOARD PPU 800F

																 ; offset for nfl shield sprties
NLF_LOGO_X_LOCATION_PRESEASON			= $B0
NLF_LOGO_X_LOCATION_SEASON				= $20 
															      ; *** can replace with actual label names once all builds
;;; BANK 19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 																  
;ON_FIELD_GAMEPLAY_START							= $8000																  
																  
																  
																  
;;; BANK 20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
;DRAW_PLAYBOOK									= $8803
;DO_PLAY_CHANGE_IN_TEAM_DATA					= $8806
;DRAW_INITIAL_PLAY_NAME_PLAY_CHANGE				= $8809
;DRAW_CURRENT_PLAY_NAME_PLAY_CHANGE				= $880C
;;;BANK 23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;BANK_JUMP_BANNER_TASK_START					= $9003

;;; BANK 25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;DRAW_NFL_LEADERS								= $8000
;DRAW_PLAYER_ATTRIBUTES							= $8003
;DRAW_PLAYER_TYPE_PRO_BOWL						= $8006

;;;; BANK 26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;FLASH_CURRENT_GAME_IN_SCHEDULE 				= $8003													
;RESET_SCHEDULE_RANDOMIZE_ORDER 				= $8006			
;GET_NUMBER_OF_GAMES_IN_WEEK 					= $8009
;CLEAR_SEASON_INFO								= $800C
;RESET_TEAM_PLAYBOOK_TO_DEFAULT_SAVE_CHECKSUM	= $800F
;RESET_AFC_STARTERS								= $8012
;RESET_NFC_STARTERS								= $8015
;DRAW_TEAM_DATA_SCREEN							= $8018 
;DRAW_DEFENSIVE_STARTERS_SCREEN 				= $801B
;DRAW_TEAM_CONTROL_TYPE_SCREEN					= $801E
;SAVE_DEFAULT_AFC_PLAYERS_W_CHECKSUM			= $8021
;SAVE_DEFAULT_NFC_PLAYERS_W_CHECKSUM			= $8024

;GET_TEAM_1_RUSHING_YARDS						= $802A
;GET_TEAM_2_RUSHING_YARDS						= $802D
;GET_TEAM_1_PASSING_YARDS						= $8030
;GET_TEAM_2_PASSING_YARDS						= $8033

PLAYER_IS_INJURED_BITFLAG			= $80
PLAYER_IS_STARTER_BITFLAG			= $40 



_F{_START_INTRO                      							 ; DONE 

GAME_START:                  									   
	SET_STACK[loc] GAME_MENUS_STACK_INDEX
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	JSR SET_ALL_SPR_OFFSCREEN                                    ; CLEAR SPRITES()
	
@draw_intro:                                                     ; DRAW INTRO
	RETURN_1_FRAME  
	END_SCENE_DRAW_NEW[sceneId_sceneBank] INTRO_SCENE_ID, CUTSCENE_DRAW_SCRIPT_BANK
	RETURN_IN_NUM_FRAMES 4 
	
@intro_slow_mo_enable_check:                                     ; INTRO LOOP
	RETURN_1_FRAME 
	LDA JOY_PRESS_1                                              ; CHECK FOR DOWN PRESSED
	AND #DOWN_DPAD                                                ;
	BEQ @intro_a_b_press_check                                   ;
	INC SLOW_MOTION_PAUSE_DEBUG                                  ; INCREASE SLOW MOTION/STOP DEBUG
	
@intro_a_b_press_check:
	LDA JOY_PRESS_BOTH                                           ; IS P1/P2 PRESS = A or B , select or starts
	AND #(A_BUTTON  + B_BUTTON + SELECT_BUTTON + START_BUTTON)   ;
	BEQ @intro_slow_mo_enable_check                              ; NO-> INTRO LOOP

_F}_START_INTRO 

_F{_START_SCREEN												 ; DONE
	
DRAW_START_SCREEN:                                               
	JSR END_DRAW_FADE_OUT_STOP_SOUND_CLEAR_SCREEN                ; END TASKS, FADE OUT PALLETE, STOP MUSIC, CLEAR NAMETABLES, CLEAR SPRITES()
	END_SCENE_DRAW_NEW[sceneId_sceneBank] START_SCREEN_SCENE_ID, CUTSCENE_DRAW_SCRIPT_BANK
	RETURN_IN_NUM_FRAMES 8 
	
@check_for_start_sound_mode:                                     ; CHECK FOR SOUND MODE SCREEN OR START/A PRESS LOOP
	RETURN_1_FRAME 
	LDA JOY_RAW_1                                                ; IS P1 LEFT + B HELD  
	CMP #(LEFT_DPAD + B_BUTTON)                                  ;
	BEQ DO_SOUND_MODE                                            ; YES-> BRANCH TO DRAW SOUND MODE SCREEN

@check_for_start_game:	
	LDA JOY_PRESS_BOTH                                           ; IS START OR A PRESSED?
	AND #(START_BUTTON+ A_BUTTON)                                 ;
	BEQ @check_for_start_sound_mode                              ; NO-> LOOP BACK TO CHECK FOR SOUND MODE SCREEN OR START/A PRESS LOOP

@start_game:	
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	END_SCENE_DRAW_NEW[sceneId_sceneBank] FLASH_START_GAME_SCENE_ID, CUTSCENE_DRAW_SCRIPT_BANK
	RETURN_IN_NUM_FRAMES 120 
	JSR END_DRAW_FADE_OUT_STOP_SOUND_CLEAR_SCREEN                ; END TASKS, FADE OUT PALLETE, STOP MUSIC, CLEAR NAMETABLES, CLEAR SPRITES()
	JMP DRAW_MAIN_MENU_INIT                                      ; JUMP TO MAIN MENU START

_F}_START_SCREEN 

_F{_DO_SOUND_MODE												 ; DONE
	
DO_SOUND_MODE:                                                   ; DRAW SOUND MODE SCREEN
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SOUND_MODE_SCREEN_BANK, $8000 
	JMP DRAW_START_SCREEN                                        ; JUMP BACK TO DRAW START SCREEN
	
_F}_DO_SOUND_MODE
	
_F{_MAIN_MENU_SCREEN											 ; DONE
	
DRAW_MAIN_MENU_INIT:                                             ; MAIN MENU START
	SET_ADDR_XY[addr] SMALL_LARGE_LETTERS_LOGO_IRQ_INFO 
	JSR LOAD_IRQ_SPLIT_DATA                                      ; LOAD IRQ SPLIT INFO(Y,X= IRQ INFO ADDRESS)
	SET_SOFT_SPRITE_8_BY_8[]									 ; SETS RAM PPU CTRL TO 8 X 8 SPRITES
	LDA #$00                                                     ;
	STA MENU_Y                                                   ; CLEAR MENU ARROW Y
	STA MENU_X                                                   ; CLEAR MENU ARROW X
	
DRAW_MAIN_MENU_PREV_CHOICE:                                      ; FADE OUT PAL, CLEAR NAMETABLES AND SPRITE AND DRAW MAIN MENU
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	JSR SET_MMC3_VERT_MIRROR                                     ; SET MMC3 MIRRORING TO VERTICAL()
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	JSR SET_ALL_SPR_OFFSCREEN                                    ; CLEAR SPRITES()
	JSR DRAW_MAIN_MENU_ONSCREEN_SEASON_OFFSCREEN                 ; DRAW MAIN MENU()
	LDA #PRESEASON_MENU_BG_PAL_INDEX                             ; SET BACKGROUND PALLETE INDEX TO MAIN MENU
	LDX #PRESEASON_MENU_SPR_PAL_INDEX                            ; SET SPRITE(OAM) PALLETE TO MAIN MENU
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE)

INIT_MAIN_MENU_CHOICES:                                          ; INITIALIZE MAIN MENU Y DATA OPTIONS
	LDY #<MAIN_MENU_OPTIONS_DATA                                 ; 
	LDX #>MAIN_MENU_OPTIONS_DATA                                 ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	
@main_menu_input_loop:                                           ; MAIN MENU PRESS LOOP
	_WHILE PLUS
	
		RETURN_1_FRAME  
		JSR CHECK_MENU_ARROW_UP_DOWN                             ; CHECK FOR MOVE MENU ARROW UP DOWN() 
		JSR UPDATE_MENU_ARROW_SPR_Y                              ; UPDATE MENU ARROW SPRITE Y LOCATION()
		LDA JOY_PRESS_BOTH                                       ; IS A BUTTON = PRESSED? 
		
	_END_WHILE
	
@do_menu_choice	
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	LDA #SPRITE_OFFSCREEN                                               ; SET ARROW SPRITE Y LOCATION = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	RTS_JUMP_TABLE[memVal_tableAddr] MENU_Y, MAIN_MENU_COMMAND_TABLE


MAIN_MENU_COMMAND_TABLE:                                         ; MENU COMMAND TABLE
	.WORD PRESEASON_MENU_START -1                                ; PRESEASON_MENU-1, 
	.WORD SEASON_MENU_START -1                                   ; SEASON_MENU -1, 
	.WORD PRO_BOWL_MENU_START -1                                 ; PRO_BOWL_MENU -1, 
	.WORD PRESEASON_TEAM_DATA_START -1                              ; TEAM_DATA_MENU -1

_F}_MAIN_MENU_SCREEN 

_F{_PRESEASON_MENU_SCREEN										 ; DONE

PRESEASON_MENU_START:                                            ; PRESEASON_MENU
	LDA GAME_STATUS                                              ; SET GAME STATUS == PRESEASON
	AND #$FC                                                     ;
	STA GAME_STATUS                                              ;
	JSR SAVE_PORTION_OF_MAIN_MENU_SRAM                           ; SAVE PART OF MAIN MENU IN SRAM AND LOAD PRESASON MENU UNTIL DESTROYED()
	
INIT_PRESEASON_MENU:
	LDY #<PRESEASON_MENU_OPTIONS_DATA                            ; SET MENU DRAW ADDRESS = MAIN MENU DRAW DATA= $B9E7
	LDX #>PRESEASON_MENU_OPTIONS_DATA                            ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	
@preseason_menu:                                                 ; CHECK FOR PRESEASON MENU BUTTON PRESS LOOP
	_WHILE PLUS
		RETURN_1_FRAME  
		JSR CHECK_MENU_ARROW_UP_DOWN                             ; CHECK FOR MOVE MENU ARROW UP DOWN() 
		JSR UPDATE_MENU_ARROW_SPR_Y                              ; UPDATE MENU ARROW SPRITE Y LOCATION()
		BIT JOY_PRESS_BOTH                                       ; DOES P1/P2 PRESS= B PRESSED
		BVC @check_a_pressed                                     ; NO-> CHECK FOR A PRESSED 
		JMP RESTORE_MAIN_MENU_FROM_SRAM                          ; JUMP TO REDRAW MISSING PART MAIN MENU FROM SRAM AND JUMP TO INITIALIZE MAIN MENU Y DATA OPTIONS
@check_a_pressed:                                                ; CHECK FOR A PRESSED
	_END_WHILE
	
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	RTS_JUMP_TABLE[memVal_tableAddr] MENU_Y, PRESEASON_MENU_COMMAND_TABLE

.ENUM $00 
	MAN_V_COM_MENU_CHOICE	.dsb 1	
	MAN_V_MAN_MENU_CHOICE	.dsb 1	
	MAN_V_COA_MENU_CHOICE	.dsb 1	
	COA_V_COM_MENU_CHOICE	.dsb 1	
	COA_V_COA_MENU_CHOICE	.dsb 1	
	COM_V_COM_MENU_CHOICE	.dsb 1	
.ENDE 
	
PRESEASON_MENU_COMMAND_TABLE:                                    ; PRESEASON MENU CHOICES
	.WORD MAN_VS_COM_PRESEASON-1                                 ; MAN V COM PRESEASON - 1, 
	.WORD MAN_VS_MAN_PRESEASON-1                                 ; MAN V MAN PRESEASON - 1, 
	.WORD MAN_VS_COA_PRESEASON-1                                 ; MAN V COA PRESEASON - 1, 
	.WORD COA_VS_COM_PRESEASON-1                                 ; COA V COM PRESEASON - 1, 
	.WORD COA_VS_COA_PRESEASON-1                                 ; COA V COA PRESEASON - 1, 
	.WORD COM_VS_COM_PRESEASON-1                                 ; COM V COM PRESEASON - 1,

MAN_VS_COM_PRESEASON:                                            ; MAN V COM PRESEASON 
	LDA #(P1_TEAM_MAN_CTRL + P2_TEAM_COM_CTRL)                     ; SET PLAYER TYPE = P1 MAN, P2 COM
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_TEAM_SELECT_BG_AND_INIT_MENU_MAP                    ; DRAW TEAM SELECT BACKGROUND, SET POSSIBLE ARROW LOCATIONS FOR TEAMS, UPDATE PALLETES
	JSR CHECK_FOR_FIRST_TEAM_SELECTED                            ; CHECK FOR SINGLE TEAM SELECTED()
	BCS @return_main_menu_man_v_com                              ; B PRESSED-> REDRAW MAIN MENU WITH ARROW ON MAN VS COM OPTION
	
@set_com_team:	
	JSR CHECK_FOR_SECOND_TEAM_SELECTED                           ; DO SINGLE MAN PLAYER TEAM SELECT()
	BCS @return_main_menu_man_v_com:                             ; B PRESSED? YES->REDRAW MAIN MENU WITH ARROW ON MAN VS COM OPTION
	
@start_game	
	JMP TRANSFER_TEAM_INFO_AND_START_GAME                        ; JUMP TO GAME START
	
@return_main_menu_man_v_com:                                     ; REDRAW MAIN MENU WITH ARROW ON MAN VS COM OPTION 
	LDA #MAN_V_COM_MENU_CHOICE                                    ; SET Y MENU INDEX = FIRST OPTION = MAN V COM
	STA MENU_Y                                                   ;
	JMP REDRAW_MAIN_MENU_WITH_PRESEASON_MENU                     ; FADE OUT PALLETE, CLR SPRITES, NAMETABLES, DRAW MAIN MENU, SAVE MENU SRAM()

MAN_VS_MAN_PRESEASON:                                            ; MAN V MAN PRESEASON
	LDA #(P1_TEAM_MAN_CTRL + P2_TEAM_MAN_CTRL)                     ; SET PLAYER TYPE = P1 MAN, P2 COM
	STA TEAM_CONTROL_TYPES                                       ; 
	JSR DRAW_TEAM_SELECT_BG_AND_INIT_MENU_MAP                    ; DRAW TEAM SELECT BACKGROUND AND HELMETS, SET POSSIBLE ARROW LOCATIONS FOR TEAMS, UPDATE PALLETES
	JSR CHECK_FOR_TEAM_SELECTED_2_PLAYER                         ; DO TWO PLAYER SELECT TEAMS LOOP()
	BCS @return_main_menu_man_v_man                              ; B PRESSED? YES-> REDRAW MAIN MENU WITH ARROW ON MAN VS MAN OPTION

@start_game:
	JMP TRANSFER_TEAM_INFO_AND_START_GAME                        ; JUMP TO GAME START

@return_main_menu_man_v_man:                                     ; REDRAW MAIN MENU WITH ARROW ON MAN VS MAN OPTION 
	LDA #MAN_V_MAN_MENU_CHOICE                                   ; SET Y MENU INDEX = SECOND OPTION = MAN V MAN
	STA MENU_Y                                                   ;
	JMP REDRAW_MAIN_MENU_WITH_PRESEASON_MENU                     ; FADE OUT PALLETE, CLR SPRITES, NAMETABLES, DRAW MAIN MENU, SAVE MENU SRAM()

COA_VS_COM_PRESEASON:                                            ; COA V COM PRESEASON
	LDA #(P1_TEAM_COA_CTRL + P2_TEAM_COM_CTRL)                     ; SET PLAYER TYPE = P1 COA, P2 COM
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_TEAM_SELECT_BG_AND_INIT_MENU_MAP                    ; DRAW TEAM SELECT BACKGROUND AND HELMETS, SET POSSIBLE ARROW LOCATIONS FOR TEAMS, UPDATE PALLETES
	JSR CHECK_FOR_FIRST_TEAM_SELECTED                            ; CHECK FOR SINGLE TEAM SELECTED()
	BCS @return_main_menu_coa_v_com                              ; B PRESSED-> REDRAW MAIN MENU WITH ARROW ON COA VS COM OPTION
	
@set_com_team:
	JSR CHECK_FOR_SECOND_TEAM_SELECTED                           ; DO SINGLE MAN PLAYER TEAM SELECT()
	BCS @return_main_menu_coa_v_com                              ; B PRESSED-> REDRAW MAIN MENU WITH ARROW ON COA VS COM OPTION
	JMP TRANSFER_TEAM_INFO_AND_START_GAME                        ; JUMP TO GAME START
	
@return_main_menu_coa_v_com:                                     ; REDRAW MAIN MENU WITH ARROW ON COA VS COM OPTION 
	LDA #COA_V_COM_MENU_CHOICE                                   ; SET Y MENU INDEX= FOURTH OPTION = COA VS COM
	STA MENU_Y                                                   ;
	JMP REDRAW_MAIN_MENU_WITH_PRESEASON_MENU                     ; FADE OUT PALLETE, CLR SPRITES, NAMETABLES, DRAW MAIN MENU, SAVE MENU SRAM()

COA_VS_COA_PRESEASON:                                            ; COA V COA PRESEASON
	LDA #(P1_TEAM_COA_CTRL + P2_TEAM_COA_CTRL)                     ; SET PLAYER TYPE = P1 COA, P2 COA
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_TEAM_SELECT_BG_AND_INIT_MENU_MAP                    ; DRAW TEAM SELECT BACKGROUND AND HELMETS, SET POSSIBLE ARROW LOCATIONS FOR TEAMS, UPDATE PALLETES
	JSR CHECK_FOR_TEAM_SELECTED_2_PLAYER                         ; DO TWO PLAYER SELECT TEAMS LOOP()
	BCS @return_main_menu_coa_v_coa                              ; B PRESSED? YES-> REDRAW MAIN MENU WITH ARROW ON COA VS COA OPTION

@start_game:
	JMP TRANSFER_TEAM_INFO_AND_START_GAME                        ; JUMP TO GAME START
	
@return_main_menu_coa_v_coa:                                     ; REDRAW MAIN MENU WITH ARROW ON COA VS COA OPTION
	LDA #COA_V_COA_MENU_CHOICE                                   ; SET Y MENU INDEX = FIFTH OPTION = COA VS COM
	STA MENU_Y
	JMP REDRAW_MAIN_MENU_WITH_PRESEASON_MENU                     ; FADE OUT PALLETE, CLR SPRITES, NAMETABLES, DRAW MAIN MENU, SAVE MENU SRAM()

MAN_VS_COA_PRESEASON:                                            ; MAN V COA PRESEASON
	LDA #(P1_TEAM_MAN_CTRL + P2_TEAM_COA_CTRL)                     ; SET PLAYER TYPE = P1 MAN, P2 COA
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_TEAM_SELECT_BG_AND_INIT_MENU_MAP                    ; DRAW TEAM SELECT BACKGROUND AND HELMETS, SET POSSIBLE ARROW LOCATIONS FOR TEAMS, UPDATE PALLETES
	JSR CHECK_FOR_FIRST_TEAM_SELECTED                            ; CHECK FOR SINGLE TEAM SELECTED()
	BCS @return_main_menu_man_v_coa                              ; B PRESSED->REDRAW MAIN MENU WITH ARROW ON MAN VS COA OPTION
	
@set_coa_team:
	JSR CHECK_FOR_SECOND_TEAM_SELECTED                           ; DO SINGLE MAN PLAYER TEAM SELECT()
	BCS @return_main_menu_man_v_coa                              ; B PRESSED->REDRAW MAIN MENU WITH ARROW ON MAN VS COA OPTION
	
@start_game:
	JMP TRANSFER_TEAM_INFO_AND_START_GAME                        ; JUMP TO GAME START

@return_main_menu_man_v_coa:                                     ; REDRAW MAIN MENU WITH ARROW ON MAN VS COA OPTION
	LDA #MAN_V_COA_MENU_CHOICE                                   ; SET Y MENU INDEX = THIRD OPTION = COA VS COM
	STA MENU_Y                                                   ;
	JMP REDRAW_MAIN_MENU_WITH_PRESEASON_MENU                     ; FADE OUT PALLETE, CLR SPRITES, NAMETABLES, DRAW MAIN MENU, SAVE MENU SRAM()

COM_VS_COM_PRESEASON:                                            ; COM V COM PRESEASON
	LDA #(P1_TEAM_COM_CTRL + P2_TEAM_COM_CTRL)                   ; SET PLAYER TYPE = P1 COM, P2 COM
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_TEAM_SELECT_BG_AND_INIT_MENU_MAP                    ; DRAW TEAM SELECT BACKGROUND AND HELMETS, SET POSSIBLE ARROW LOCATIONS FOR TEAMS, UPDATE PALLETES
	JSR CHECK_FOR_FIRST_TEAM_SELECTED                            ; CHECK FOR SINGLE TEAM SELECTED()
	BCS @return_main_menu_com_v_com                              ; B PRESSED->REDRAW MAIN MENU WITH ARROW ON COM VS COM OPTION
	JSR CHECK_FOR_SECOND_TEAM_SELECTED                           ; DO SINGLE MAN PLAYER TEAM SELECT()
	BCS @return_main_menu_com_v_com                              ; B PRESSED->REDRAW MAIN MENU WITH ARROW ON COM VS COM OPTION
	JMP TRANSFER_TEAM_INFO_AND_START_GAME                        ; JUMP TO GAME START
	
@return_main_menu_com_v_com:                                     ; REDRAW MAIN MENU WITH ARROW ON COM VS COM OPTION
	LDA #COM_V_COM_MENU_CHOICE                                   ; SET MENU Y OPTION = THIRD OPTION = COM VS COM
	STA MENU_Y                                                   ;
	JMP REDRAW_MAIN_MENU_WITH_PRESEASON_MENU                     ; JUMP->FADE OUT PALLETE, CLR SPRITES, NAMETABLES, DRAW MAIN MENU, SAVE MENU SRAM()


sram_addr 	= LOCAL_1

RESTORE_MAIN_MENU_FROM_SRAM:                                    ; REDRAW MISSING PART MAIN MENU FROM SRAM AND JUMP TO INITIALIZE MAIN MENU Y DATA OPTIONS
	LDA #SPRITE_OFFSCREEN                                               ; SET MENU ARROW SPRITE Y = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	LDY #<MAIN_MENU_TEXT_START_PPU_ADDR                               ; SET PPU ADDRESS = $2545
	LDX #>MAIN_MENU_TEXT_START_PPU_ADDR                               ;
	LDA #<MENU_SCREEN_SAVE_SRAM                                  ; SET SRAM ADDRESS = $6003
	STA sram_addr                                                ;
	LDA #>MENU_SCREEN_SAVE_SRAM                                  ;
	STA sram_addr+1                                              ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES (X,Y= PPU ADDRESS, 3E,3F = DATA ADDRESS)
	LDA #$00                                                     ; SET Y MENU INDEX= FIRST OPTION
	STA MENU_Y                                                   ;
	JMP INIT_MAIN_MENU_CHOICES                                   ; JUMP TO INITIALIZE MAIN MENU Y DATA OPTIONS

REDRAW_MAIN_MENU_WITH_PRESEASON_MENU:                            ; FADE OUT PALLETE, CLR SPRITES, NAMETABLES, DRAW MAIN MENU, SAVE MENU SRAM()
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	JSR SET_ALL_SPR_OFFSCREEN                                    ; CLEAR SPRITES()
	JSR DRAW_MAIN_MENU_ONSCREEN_SEASON_OFFSCREEN                 ; DRAW MAIN MENU()   
	JSR SAVE_PORTION_OF_MAIN_MENU_SRAM                           ; SAVE PART OF MAIN MENU IN SRAM AND LOAD PRESEASON MENU UNTIL DESTROYED()
	LDA #PRESEASON_MENU_BG_PAL_INDEX                             ; SET BACKGROUND PALLETE
	LDX #PRESEASON_MENU_SPR_PAL_INDEX                            ; SET SPRITE PALLETE
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE)  
	JMP INIT_PRESEASON_MENU

_F}_PRESEASON_MENU_SCREEN 

_F{_SEASON_MAIN_MENU_SCREEN										 ; DONE
	
SEASON_MENU_START:                                               ; SEASON_MENU
	SET_GAME_STATUS_SEASON_MODE[]
	LDA #$00                                                     ; SET NFL SHIELD LOCATION
	STA MENU_Y                                                   ; SET Y MENU INDEX= FIRST OPTION
	JSR SCROLL_PRESEASON_SEASON_SCREENS                          ; SCROLL MENU SCREEN AND INITIALIAZE ARROW LOCATION(A= NFL SHIELD LOATION)

SEASON_MENU_INIT:                                                ; SEASON MENU SELECTION LOOP
	LDY #<SEASON_MENU_OPTIONS_DATA                                     ;
	LDX #>SEASON_MENU_OPTIONS_DATA                                     ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	
@not_selected:
	_WHILE PLUS
		RETURN_1_FRAME  
		JSR CHECK_MENU_ARROW_UP_DOWN                             ; CHECK FOR MENU CURSOR MOVED UP OR DOWN() RET= CARRY SET= MOVED
		JSR UPDATE_MENU_ARROW_SPR_Y                              ; UPDATE MENU ARROW SPRITE Y LOCATION()
		BIT JOY_PRESS_BOTH                                      ; DOES P1/P2 PRESS= B PRESSED
		BVC @check_a                                             ; NO->
		JMP SCROLL_TO_MAIN_MENU
		
@check_a:                                                        ; CHECK FOR A PRESSED
	_END_WHILE
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	RTS_JUMP_TABLE[memVal_tableAddr] MENU_Y, SEASON_MENU_COMMAND_TABLE
	
SEASON_MENU_COMMAND_TABLE:                                       ; SEASON MENU CHOICES
	.WORD SEASON_TEAM_CONTROL-1                                  ; TEAM CONTROL
	.WORD SEASON_SCHEDULE-1                                      ; SCHEDULE
	.WORD SEASON_GAME_START-1                                    ; GAME START
	.WORD SEASON_STANDINGS-1                                     ; STANDINGS
	.WORD TEAM_RANKINGS_SCREEN_START-1                           ; TEAM RANKINGS
	.WORD SEASON_NFL_LEADERS-1                                   ; NFL LEADERS
	.WORD SEASON_TEAM_DATA-1                                     ; TEAM DATA

_F}_SEASON_MAIN_MENU_SCREEN

_F{_SEASON_TEAM_CONTROL_SCREEN									 ; DONE

SEASON_TEAM_CONTROL:                                             ; TEAM CONTROL
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	DRAW_SCENE_UNTIL_ENDED[sceneId_sceneBank] TEAM_CONTROL_SCREEN_ID, MENU_DRAW_SCRIPT_BANK
	LDY #<MINI_HELMETS_TEAM_CONTROL_SELECT_SPR_Y_X                      ;
	LDX #>MINI_HELMETS_TEAM_CONTROL_SELECT_SPR_Y_X                      ;
	JSR DRAW_MINI_HELMETS_AT_LOCATIONS                           ; DRAW MINI HELMETS AT COORDINATES()
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_TEAM_CONTROL_SCREEN_BANK, BANK_JUMP_DRAW_TEAM_CONTROL_TYPE_SCREEN  ; *** can use actual addr 
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	LDA #$00                                                     ; 
	STA MENU_Y                                                   ; SET Y MENU OPTION = FIRST OPTION
	STA MENU_X                                                   ; SET X MENU OPTION = FIRST OPTION

REDRAW_SEASON_MENU_SCREEN_INIT_MENU:                             ; REDRAW MAIN MENU/SEASON MENU, UPDATE PALLETES, JUMP TO SEASON MENU SELECTION LOOP
	JSR REDRAW_SEASON_MENU_SCREEN                                ; REDRAW MAIN MENU AND SEASON MENU()
	LDA #SEASON_MENU_BG_PAL_INDEX                                ; SET BACKGROUND PALLETE INDEX
	LDX #SEASON_MENU_SPR_PAL_INDEX                               ; SET SPRITE PALLETE INDEX
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ;
	JMP SEASON_MENU_INIT                                         ; JUMP TO SEASON MENU SELECTION LOOP

REDRAW_SEASON_MENU_SCREEN:                                       ; REDRAW MAIN MENU AND SEASON MENU
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	JSR SET_ALL_SPR_OFFSCREEN                                    ; CLEAR SPRITES()
	DRAW_SCENE_UNTIL_ENDED[sceneId_sceneBank] MAIN_MENU_SCREEN_ID, MENU_DRAW_SCRIPT_BANK
	DRAW_SCENE_UNTIL_ENDED[sceneId_sceneBank] SEASON_MENU_SCREEN_ID, MENU_DRAW_SCRIPT_BANK
	LDA #NLF_LOGO_X_LOCATION_SEASON                            ; SET LOGO LOCATION =  LEFT PART OF SCREEN
	JSR DRAW_NFL_SHIELD_SPRITES[x_offset]                        ; DRAW NFL LOGO FOR MENU(A= LOGO LOCATION)
	RTS                                                          ; RETURN

_F}_SEASON_TEAM_CONTROL_SCREEN 

_F{_SEASON_SCHEDULE_SCREEN                                       ; DONE

ppu_addr 					= LOCAL_1 
sram_addr 					= LOCAL_3

LAST_SCHEDULE_PAGE 			= $12
NUM_WEEKS_PER_SCREEN		= $04

SCHEDULE_MENU_NUM_TILES		= $0D
SCHEDULE_MENU_NUM_ROWS		= $09

AUTOSKP_MENU_NUM_TILES		= $0D
AUTOSKP_MENU_NUM_ROWS		= $05

AUTOSKP_WEEK_NUM_TILES		= $02
AUTOSKP_WEEK_NUM_ROWS		= $01 

RESET_SCHED_NUM_TILES		= $1C
RESET_SCHED_NUM_ROWS		= $0B

FINAL_RESET_SCHED_NUM_TILES	= $1C
FINAL_RESET_SCHED_NUM_ROWS	= $0B  

autoskip_choices			= LAST_WEEK_OF_SEASON + 2			 ; add one for zero index and one more for week 0(none) skip choice

SEASON_SCHEDULE:                                                 ; SEASON SCHEDULE
	LDA CURRENT_WEEK_IN_SEASON                                   ; IS CURRENT WEEK < PLAYOFFS
	CMP #FIRST_WEEK_OF_PLAYOFFS                                      ; 
	BCC DRAW_REGULAR_SEASON_SCHEDULE                              ;

@else_draw_playoff_bracket: 	
	JMP JUMP_TO_DRAW_PLAYOFF_BRACKET                             ; 
	
DRAW_REGULAR_SEASON_SCHEDULE:                                   ; REGULAR SEASON SCHEDULE
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	DRAW_SCENE_UNTIL_ENDED[sceneId_sceneBank] NFL_SCHEDULE_HEADER_SCREEN_ID, MENU_DRAW_SCRIPT_BANK
	LDA #<WEEKLY_MATCHUPS_START                                  ; SET START OF CURRENT WEEK MATCHUPS SRAM ADDRESS IN $8E/8F
	STA WEEKLY_MATCHUPS_SRAM_ADDR                                ; 
	LDA #>WEEKLY_MATCHUPS_START                                  ;
	STA WEEKLY_MATCHUPS_SRAM_ADDR+1                               ;
	LDA CURRENT_WEEK_IN_SEASON                                   ; LOAD CURRENT WEEK
	AND #$FC                                                     ; CONVERTS WEEK NUMBER TO 4 WEEK INDEX
	STA SCHEDULE_PAGE_FOR_DRAW	                                                      ; SAVE 4 WEEK INDEX
	STA TEMP_SCHEDULE_PAGE                                                      ; 
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_SCHEDULE_BANK, $8000 
	LDA #SCHEDULE_MENU_BG_PAL_INDEX	                             ; SET BG PALLETE
	LDX #SCHEDULE_MENU_SPR_PAL_INDEX	                         ; SET SPR PALLETE
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE)

REGULAR_SEASON_SCHEDULE_INPUT_LOOP: 
	
@update_schedule_page_loop:                                          ; REGULAR SEASON SCHEDULE UPDATE LOOP 
	RETURN_1_FRAME  
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_SCHEDULE_BANK, BANK_JUMP_FLASH_CURRENT_GAME_IN_SCHEDULE ; *** can use actual
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVS REDRAW_SEASON_MENU_SCREEN_INIT_MENU                      ; YES-> REDRAW MAIN MENU/SEASON MENU, UPDATE PALLETES, JUMP TO SEASON MENU SELECTION LOOP
	BMI @draw_schedule_menu                                      ; DOES P1/P2 PRESS= A PRESSED YES->
	LDA JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= UP OR DOWN PRESSED
	AND #(UP_DPAD+DOWN_DPAD)                                     ; 
	BEQ @update_schedule_page_loop                                    ; NOTHING PRESSED-> REGULAR SEASON SCHEDULE UPDATE LOOP

@check_up_pressed:	
	AND #UP_DPAD                                                 ; DOES P1/P2 PRESS= UP PRESSED
	BEQ @down_pressed                                            ;

@up_pressed:	
	LDA TEMP_SCHEDULE_PAGE                                       ; = 4 WEEK INDEX - 4 WEEKS 
	SEC                                                          ;
	SBC #NUM_WEEKS_PER_SCREEN                                    ; ARE WE AT FIRST 4 WEEK SEGMENT?
	BCC @update_schedule_page_loop                               ; YES-> REGULAR SEASON SCHEDULE UPDATE LOOP
	JMP @save_four_week_schedule_and_draw:                       ;
	
@down_pressed:                                                   ; DOWN PRESSED ON SCHEDULE GO FORWARD 4 WEEKS
	LDA TEMP_SCHEDULE_PAGE                                       ; = 4 WEEK INDEX + 4 WEEKS
	CLC                                                          ;
	ADC #NUM_WEEKS_PER_SCREEN                                    ;
	CMP #LAST_SCHEDULE_PAGE                                      ; ARE WE AT LAST 4 WEEK SEGMENT? 
	BCS @update_schedule_page_loop                               ; YES-> REGULAR SEASON SCHEDULE UPDATE LOOP

@save_four_week_schedule_and_draw:                               ; SAVE 4 WEEK SEGMENT AND UPDATE SCHEDULE
	STA TEMP_SCHEDULE_PAGE                                       ; SET 4 WEEK INDEX
	LDA TEMP_SCHEDULE_PAGE                                       ;
	STA SCHEDULE_PAGE_FOR_DRAW	                                 ; 
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_SCHEDULE_BANK, $8000 
	JMP @update_schedule_page_loop                               ; JUMP-> REGULAR SEASON SCHEDULE UPDATE LOOP

@draw_schedule_menu:                                             ; A PRESSED ON SCHEDULE
	LDA #$00                                                     ; 
	STA FRAME_COUNTER                                            ;
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_SCHEDULE_BANK, BANK_JUMP_FLASH_CURRENT_GAME_IN_SCHEDULE  ; *** can usu actual addr 
	JSR SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_FIRST_OPTION      ; SET MENU ARROW OFFSCREEN AND MENU INDEX = FIRST OPTION()
	
@save_part_of_schedule_menu_sram	
	LDA #<SCHEDULE_MENU_PPU_ADDR                                 ; SET SCHEDULE MENU PPU ADDRESS = $2082
	STA ppu_addr                                                 ;
	LDA #>SCHEDULE_MENU_PPU_ADDR                                 ;
	STA ppu_addr+1                                               ;
	LDA #<SCHEDULE_MENU_SRAM                                     ; SET SCHEDULE MENU ADDRESS = $6003
	STA sram_addr                                                ;
	LDA #>SCHEDULE_MENU_SRAM                                     ;
	STA sram_addr+1                                              ;
	LDX #SCHEDULE_MENU_NUM_TILES                                 ; SET LENGTH = 13 TILES
	LDY #SCHEDULE_MENU_NUM_ROWS                                  ; SET ROWS = 9 TILES
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                                                ; SAVE PPU DATA IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
	LDA #SCHEDULE_MENU_SCREEN_ID                                 ; LOAD SCHEDULE MENU DRAW EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; LOAD BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)

INIT_SCHEDULE_MENU_OPTIONS:                                      ; LOAD SCHEDULE MENU OPTIONS
	LDY #<SCHEDULE_MENU_OPTIONS_DATA                                   ; LOAD SCHEDULE MENU INFO ADDRESS
	LDX #>SCHEDULE_MENU_OPTIONS_DATA                                   ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	
@schedule_menu_input_loop:                                       ; SCHEDULE MENU INPUT CHECK
	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVC @check_a_press                                           ; NO->  CHECK A PRESSED SCHEDULE
	JMP RESTORE_SCHEDULE_SRAM                                   ; YES-> CLEAR SCHEDULE MENU
	
@check_a_press:                                                  ; CHECK A PRESSED SCHEDULE
	BPL @schedule_menu_input_loop                                ; A PRESSED? NO-> SCHEDULE MENU INPUT CHECK
	LDA MENU_Y                                                   ; IS MENU OPTION =  RESET SCHEDULE 
	CMP #RESET_SCHEDULE_CHOICE                                   ;
	BNE @check_playoff_autoksip                                  ; 
	JMP RESET_SCHEDULE                                          ; YES-> RESET SCHEDULE
	
@check_playoff_autoksip:                                        ; CHECK FOR PLAYOFF SCHEDULE SELECTED
	CMP #PLAYOFF_BRACKET_CHOICE                                  ;
	BNE AUTOSKIP_START                                           ;
	JMP JUMP_TO_DRAW_PLAYOFF_BRACKET                             ; YES-> JUMP TO PLAYOFF SCHEDULE SELECTED

AUTOSKIP_START:                                                  ; AUTOSKIP CHOICE SELECTED

length 		= LOCAL_1
rows 		= LOCAL_2 
sram_addr 	= LOCAL_3

	JSR SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_FIRST_OPTION      ; SET MENU ARROW OFFSCREEN AND MENU INDEX = FIRST OPTION()
	LDA #<AUTOSKIP_MENU_PPU_ADDR                                 ; SET PPU ADDRESS = $20C3
	STA ppu_addr                                                 ;
	LDA #>AUTOSKIP_MENU_PPU_ADDR                                 ;
	STA ppu_addr+1                                               ; 
	LDA #<AUTOSKIP_MENU_SRAM                                     ; SET SRAM ADDRESS = $6103
	STA sram_addr                                                ;
	LDA #>AUTOSKIP_MENU_SRAM                                     ;
	STA sram_addr+1                                              ;
	LDX #AUTOSKP_MENU_NUM_TILES                                  ; SET LENGTH = 13 TILES
	LDY #AUTOSKP_MENU_NUM_ROWS                                   ; SET ROWS = 5 ROWS 
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                           ; SAVE PPU DATA IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
	LDA #SKIP_TO_WEEK_SCREEN_ID	                                 ; LOAD AUTO SKIP EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDX CURRENT_WEEK_IN_SEASON                                   ; IS CURRENT WEEK > 17
	CPX #FIRST_WEEK_OF_PLAYOFFS                                      ; 
	BCS @exit_autoskip                                           ; YES->
	INX                                                          ; AUTOSKIP WEEK ++
	CPX WEEK_TO_SKIP_TO	                                         ; IS CURRENT WEEK+1 > SKIP TO WEEK   
	BCS @save_week_to_skip_to                                    ; 
	LDX WEEK_TO_SKIP_TO	                                         ; SAVE WEEK TO SKIP TO
	
@save_week_to_skip_to:                                           ; 
	STX MENU_Y                                                   ; SET Y MENU CHOICE =  WEEK TO SKIP TO 
	LDA #<AUTO_SKIP_MENU_NUM_WEEKS_MENY_OPT_ADDR                 ; SET MAX WEEK VALUE TO SKIP TO 
	STA MENU_OPTIONS_ADDR                                        ;
	LDA #>AUTO_SKIP_MENU_NUM_WEEKS_MENY_OPT_ADDR                 ;
	STA MENU_OPTIONS_ADDR+1                                      ;
	JMP @update_autoskip_week_displayed                          ; JUMP-> UPDATE DISPLAYED AUTOSKIP WEEK NUMBER
	
	
@autoskip_input_check:                                           ; AUTOSKIP WEEK INPUT CHECK
	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	LDA JOY_RAW_BOTH                                             ; IS JOY RAW = UP OR DOWN?
	AND #(UP_DPAD+DOWN_DPAD)                                     ;
	BNE @update_autoskip_week_displayed                          ; YES-> UPDATE DISPLAYED AUTOSKIP WEEK NUMBER
	LDA FRAME_COUNTER                                            ; SET FLASHING SPEED RATE = EVERY 4 FRAMES
	AND #$04                                                     ; 
	BEQ @clear_week_number_for_flashing                          ; 

@update_autoskip_week_displayed:                                 ; UPDATE DISPLAYED AUTOSKIP WEEK NUMBER
	LDA MENU_Y                                                   ; LOAD WEEK TO SKIP TO
	JSR HEX_TO_2_DIGIT_DEC                                       ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDY #<AUTOSKIP_WEEK_PPU_ADDR                                 ; SET AUTOSKIP WEEK # PPU ADDR = $210D
	LDX #>AUTOSKIP_WEEK_PPU_ADDR                                 ;
	JSR CONVERT_2_DIG_NUM_TILES_NO_LEADING_ZEROS                 ; SAVE 2 DIGIT NUMBER TO BUFFER(X,Y=PPU ADDR)
	JMP @check_for_exit_autoskip                                                  ;

	

@clear_week_number_for_flashing:                                 ; CLEAR WEEK NUMBER FOR FLASHING EFFECT
	LDY #<AUTOSKIP_WEEK_PPU_ADDR                                 ; SET AUTOSKIP WEEK # PPU ADDR = $210D
	LDX #>AUTOSKIP_WEEK_PPU_ADDR                                 ;
	LDA #AUTOSKP_WEEK_NUM_ROWS                                   ; SET ROWS = 1
	STA rows                                                     ;
	LDA #AUTOSKP_WEEK_NUM_TILES                                  ; SET LENGTH = 2 tiles
	STA length                                                   ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	
@check_for_exit_autoskip:
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVS @exit_autoskip                                           ; YES-> EXIT AUTOSKIP MENU
	BPL @autoskip_input_check                                    ; A PRESSED? NO->AUTOSKIP WEEK INPUT CHECK
	LDA #SCHEDULE_SELECT_SOUND                                   ; LOAD MENU CHOICE SOUND
	JSR PLAY_SOUND                                               ; PLAY SOUND(A= SOUND)
	MMC3_SRAM_WRITE_ENABLE
	LDA MENU_Y                                                   ; SAVE WEEK IN WEEK TO SKIP TO
	STA WEEK_TO_SKIP_TO                                          ;
	MMC3_SRAM_WRITE_DISABLE
	LDA MENU_Y                                                   ;
	JSR HEX_TO_2_DIGIT_DEC                                       ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDY #<AUTOSKIP_WEEK_PPU_ADDR                                 ; SET AUTOSKIP WEEK # PPU ADDR = $210D
	LDX #>AUTOSKIP_WEEK_PPU_ADDR                                 ;
	JSR CONVERT_2_DIG_NUM_TILES_NO_LEADING_ZEROS                 ; SAVE 2 DIGIT NUMBER TO BUFFER(X,Y=PPU ADDR)
	RETURN_IN_NUM_FRAMES 30                                      ; 0.5 sec

	

@exit_autoskip:                                                  ; EXIT AUTOSKIP MENU

sram_addr = LOCAL_1

	JSR SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_FIRST_OPTION      ; SET MENU ARROW OFFSCREEN AND MENU INDEX = FIRST OPTION()
	LDY #<AUTOSKIP_MENU_PPU_ADDR                                 ; SET PPU ADDR = SCHEDULE MENU 
	LDX #>AUTOSKIP_MENU_PPU_ADDR                                 ;
	LDA #<AUTOSKIP_MENU_SRAM                                     ; SET DATA ADDR= SCHEDULE MENU SRAM ADDR 
	STA sram_addr                                                ;
	LDA #>AUTOSKIP_MENU_SRAM                                      ;
	STA sram_addr+1                                              ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()
	JMP INIT_SCHEDULE_MENU_OPTIONS                              ; LOAD SCHEDULE MENU OPTIONS
	
AUTO_SKIP_MENU_NUM_WEEKS_MENY_OPT_ADDR
	.DB autoskip_choices										; max number of y options = 0 - 17 weeks. 0 = no skip

	
ppu_addr = LOCAL_1
sram_addr= LOCAL_3
	
RESET_SCHEDULE:                                                 ; RESET SCHEDULE
	JSR SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_FIRST_OPTION      ; SET MENU ARROW OFFSCREEN AND MENU INDEX = FIRST OPTION()
	LDA #<RESET_SCHEDULE_PPU_ADDR                                ; SET PPU ADDR = $2143
	STA ppu_addr                                                 ;
	LDA #>RESET_SCHEDULE_PPU_ADDR                                ;
	STA ppu_addr+1                                               ;
	LDA #<RESET_SCHEDULE_MENU_SRAM                               ; SET SRAM DATA ADDR = $60A3
	STA sram_addr                                                ;
	LDA #>RESET_SCHEDULE_MENU_SRAM                               ;
	STA sram_addr+1                                              ;
	LDX #RESET_SCHED_NUM_TILES                                   ; SET LENGTH = 28 TILES
	LDY #RESET_SCHED_NUM_ROWS                                      ; SET ROWS  = 11 TILES
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                                                ; SAVE PPU DATA IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
    DRAW_SCENE_UNTIL_ENDED[sceneId_sceneBank] FIRST_SCHEDULE_RESET_WARN_SCREEN_ID, MENU_DRAW_SCRIPT_BANK
	
INIT_RESET_SCHEDULE_MENU:                                        ; LOAD RESET SCHEDULE MENU CHOICES
	LDY #<SCHEDULE_RESET_MENU_OPTIONS_DATA                             ;
	LDX #>SCHEDULE_RESET_MENU_OPTIONS_DATA                             ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)

@reset_schedule_input_check:                                     ; RESET SCHEDULE WARNING INPUT CHECK
	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVC @check_a_pressed                                         ; NO->
	JMP EXIT_FROM_FIRST_RESET_RESTORE_SCREEN                     ; YES-> EXIT FROM RESET SEASON WARNING
@check_a_pressed:                                                ;
	BPL @reset_schedule_input_check                              ; A PRESSED? NO-> RESET SCHEDULE WARNING INPUT CHECK
	LDA MENU_Y                                                   ; LOAD CHOICE
	BNE FINAL_RESET_WARNING                                                 ; 
	JMP EXIT_FROM_FIRST_RESET_RESTORE_SCREEN                     ; “NO” SELECTED-> EXIT FROM RESET SEASON WARNING

ppu_addr 	= LOCAL_1 
sram_addr 	= LOCAL_3
	
FINAL_RESET_WARNING:                                              ; YES SELECTED ON RESET WARNING
	JSR SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_FIRST_OPTION      ; SET MENU ARROW OFFSCREEN AND MENU INDEX = FIRST OPTION()
																; SAVE SCHEDULE COVERED BY MENU IN SRAM

	LDA #<FINAL_RESET_PPU_ADDR                                   ; SET PPU ADDR= $224D
	STA ppu_addr                                                 ;
	LDA #>FINAL_RESET_PPU_ADDR                                   ;
	STA ppu_addr+1                                               ; SET SRAM DATA ADDR= $6203
	LDA #<FINAL_RESET_MENU_SRAM                                  ;
	STA sram_addr                                                ;
	LDA #>FINAL_RESET_MENU_SRAM                                  ;
	STA sram_addr+1                                              ;
	LDX #FINAL_RESET_SCHED_NUM_TILES                             ; SET LENGTH = 28 TILES
	LDY #FINAL_RESET_SCHED_NUM_ROWS                              ; SET ROWS  = 11 TILES
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                           ; SAVE PPU DATA IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
																 ; DRAW SCHEDULE RESET VERIFY MENU
	LDA #FINAL_SCHEDULE_RESET_WARN_SCREEN_ID
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDY #<SCHEDULE_RESET_VERIFY_MENU_OPTIONS_DATA
	LDX #>SCHEDULE_RESET_VERIFY_MENU_OPTIONS_DATA
	LDA #BOTH_JOYPADS                                                      ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	
@reset_warn_input_check:                                         ; RESET SEASON CONFIRM INPUT CHECK
	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT JOY_PRESS_BOTH                                          ; DOES P1/P2 PRESS= B PRESSED
	BVS EXIT_FROM_FINAL_RESET_RESTORE_SCREEN                     ; YES-> EXIT FROM RESET SEASON CONFIRM
	BPL @reset_warn_input_check:                                ; A PRESSED? NO-> RESET SEASON CONFIRM INPUT CHECK
	LDA MENU_Y                                                   ; IS MENU ARROW ON “NO”?
	BEQ EXIT_FROM_FINAL_RESET_RESTORE_SCREEN                      ; YES-> EXIT FROM RESET SEASON CONFIRM
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] CLEAR_SEASON_STATS_BANK, BANK_JUMP_CLEAR_SEASON_INFO ; *** can use actual addr
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] RESET_SCHEDULE_BANK, BANK_JUMP_RESET_SCHEDULE_RANDOMIZE_ORDER ; *** can use actual addr
	JMP SEASON_SCHEDULE                                          ; JUMP TO SEASON SCHEDULE

JUMP_TO_DRAW_PLAYOFF_BRACKET:                                    ; PLAYOFF SCHEDULE SELECTED 
	JSR DRAW_PLAYOFF_BRACKET_RETURN_B_PRESS                      ; DRAW PLAYOFF BRACKET RETURN WHEN B PRESSED()
	JMP DRAW_REGULAR_SEASON_SCHEDULE                            ; JUMP->REGULAR SEASON SCHEDULE 

EXIT_FROM_FINAL_RESET_RESTORE_SCREEN:                            ; EXIT FROM RESET SEASON CONFIRM 
	JSR SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_FIRST_OPTION      ; SET MENU ARROW OFFSCREEN AND MENU INDEX = FIRST OPTION()
	JSR RESTORE_SCHEDULE_MENU_FINAL_RESET_SRAM                   ; RESTORE PART OF SCHEDULE THAT FINAL RESET MENU DREW OVER()
	JMP INIT_RESET_SCHEDULE_MENU                                  ; DRAW RESET SCHEDULE MENU CHOICES

EXIT_FROM_FIRST_RESET_RESTORE_SCREEN:                             ; EXIT FROM RESET SEASON WARNING
	LDA #RESET_SCHEDULE_CHOICE                                   ; SET MENU CHOICE = RESET
	JSR SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_OPTION[option]    ; SET MENU ARROW OFFSCREEN AND MENU INDEX(A= MENU INDEX)
	JSR RESTORE_SCHEDULE_MENU_1ST_RESET_SRAM                     ; RESTORE PART OF SCHEDULE THAT 1ST RESET MENU DREW OVER()
	JMP INIT_SCHEDULE_MENU_OPTIONS                               ; JUMP-> LOAD SCHEDULE MENU OPTIONS

	
	
RESTORE_SCHEDULE_SRAM:                                           ; RESTORE SCHEDULE TILES AND REGULAR SEASON SCHEDULE UPDATE LOOP
	sram_addr 	= LOCAL_1
	
	LDA #SCHEDULE_CHOICE                                         ; SET MENU OPTION = SEASON SCHEDULE
	JSR SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_OPTION[option]    ; SET MENU ARROW OFFSCREEN AND MENU INDEX(A= MENU INDEX)
																 ; RELOAD SCHEDULE DATA FROM SRAM
	LDY #<SCHEDULE_MENU_PPU_ADDR                                 ; SET PPU ADDRESS = MENU LOCATION
	LDX #>SCHEDULE_MENU_PPU_ADDR                                 ;
	LDA #<SCHEDULE_MENU_SRAM                                     ; SET DATA ADDRESS = $6003 = SCHEDULE TILES WE DREW OVER
	STA sram_addr                                                ;
	LDA #>SCHEDULE_MENU_SRAM                                     ;
	STA sram_addr +1                                             ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY (X,Y= PPU ADDRESS, 3E,3F = DATA ADDRESS)
	JMP REGULAR_SEASON_SCHEDULE_INPUT_LOOP                            ; JUMP REGULAR SEASON SCHEDULE UPDATE LOOP

SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_FIRST_OPTION:             ; SET MENU ARROW OFFSCREEN AND MENU INDEX = FIRST OPTION()
	LDA #$00
SET_MENU_ARROW_OFFSCREEN_SET_CHOICE_TO_OPTION[option]:           ; SET MENU ARROW OFFSCREEN AND MENU INDEX(A= MENU INDEX)
	STA MENU_Y                                                   ; SAVE Y MENU CHOICE
	LDA #SPRITE_OFFSCREEN                                               ; SET MENU SPRITE Y = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	RTS                                                          ; RETURN


		
RESTORE_SCHEDULE_MENU_1ST_RESET_SRAM:                            ; RESTORE PART OF SCHEDULE THAT 1ST RESET MENU DREW OVER
	LDY #<RESET_SCHEDULE_PPU_ADDR                                ; SET PPU ADDRESS = 1ST RESET MENU LOCATION
	LDX #>RESET_SCHEDULE_PPU_ADDR                                ;
	LDA #<RESET_SCHEDULE_MENU_SRAM                               ; SET DATA ADDRESS = $60A3 = SCHEDULE TILES WE DREW OVER
	STA sram_addr                                                ;
	LDA #>RESET_SCHEDULE_MENU_SRAM                               ;
	STA sram_addr+1                                              ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY (X,Y= PPU ADDRESS, 3E,3F = DATA ADDRESS)
	RTS                                                          ; RETURN

RESTORE_SCHEDULE_MENU_FINAL_RESET_SRAM:                          ; RESTORE PART OF SCHEDULE THAT FINAL RESET MENU DREW OVER
	LDY #<FINAL_RESET_PPU_ADDR                                   ; SET PPU ADDRESS = FINAL RESET MENU LOCATION
	LDX #>FINAL_RESET_PPU_ADDR                                   ;
	LDA #<FINAL_RESET_MENU_SRAM                                   ; SET DATA ADDRESS = $6203 = SCHEDULE TILES WE DREW OVER
	STA sram_addr                                                ;
	LDA #>FINAL_RESET_MENU_SRAM                                   ;
	STA sram_addr+1                                             ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES (X,Y= PPU ADDRESS, 3E,3F = DATA ADDRESS)   
	RTS                                                          ; RETURN

_F}_SEASON_SCHEDULE_SCREEN  

_F{_SEASON_STANDINGS_SCREEN										 ; DONE 

ppu_addr 	= 	LOCAL_1
sram_addr =	LOCAL_3


SCROLL_UP_STANDINGS					= $00
SCROLL_DOWN_STANDINGS				= $01


AFC_STANDING_MENU_CHOICE			= $00 
NFC_STANDING_MENU_CHOICE			= $01
PLAYOFF_STANDING_MENU_CHOICE		= $02

SEASON_MENU_STANDINGS_CHOICE		= $03

SEASON_STANDINGS_Y_SCROLL			= $60 

SEASON_STANDINGS:                                                ; STANDINGS MENU OPTION
	LDA #SPRITE_OFFSCREEN                                               ; SET MENU SPRITE Y = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	LDA #<SEASON_STANDINGS_PPU_ADDR                              ; SET PPU ADDRESS = $2400
	STA ppu_addr                                                 ; 
	LDA #>SEASON_STANDINGS_PPU_ADDR                              ;
	STA ppu_addr+1                                               ;
	LDA #<SEASON_STANDINGS_MENU_SRAM                             ; SET SRAM ADDRESS = $6103
	STA sram_addr                                                ;
	LDA #>SEASON_STANDINGS_MENU_SRAM                             ;
	STA sram_addr+1                                              ;
	LDX #LENGTH_OF_ONE_ROW                                       ; SET LENGTH = 32 tiles
	LDY #$0C                                                     ; SET ROWS  = 12 rows
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                           ; SAVE PPU DATA IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
	LDA #STANDINGS_MENU_SCREEN_ID                                ; SET DRAW EVENT = STANDINGS SCREEN 
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDA #SCROLL_DOWN_STANDINGS                                                     ; SET SCROLL DIRECTION = DOWN
	JSR SCROLL_TO_FROM_STANDINGS[direction]                      ; SCROLL TO OR FROM STANDINGS( 0= SCROLL UP, 1 = SCROLL DOWN)
	LDA #$00                                                     ;
	STA MENU_Y                                                   ; SET Y MENU OPTION = FIRST CHOICE
	STA MENU_X                                                   ; SET X MENU OPTION = FIRST CHOICE

@season_standings_menu_init:                                     ; STANDINGS MENU INPUT START
	LDY #<STANDINGS_MENU_OPTIONS_DATA                                  ; LOAD STANDINGS MENU INFO ADDR
	LDX #>STANDINGS_MENU_OPTIONS_DATA                                  ;
	LDA #BOTH_JOYPADS                                            ; SET PLAYER JOY = BOTH
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	
@season_standings_input_check:                                   ; STANDING MENU INPUT CHECK
	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVC @check_draw_division_standings                           ; NO-> B NOT PRESSED STANDINGS MENU
	JMP @exit_standings_scroll_up                                ; 	
	
@check_draw_division_standings:                                  ; B NOT PRESSED STANDINGS MENU
	BPL @season_standings_input_check                            ; A PRESSED? NO->STANDING MENU INPUT CHECK
	
@draw_division_standings:										 ; A PRESSED STANDINGS MENU
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	LDA MENU_Y                                                   ; SAVE Y MENU CHOICE
	STA PREV_MENU_Y                                              ;
	LDA MENU_X                                                   ; SAVE X MENU CHOICE
	STA PREV_MENU_X                                              ; 
	LDA MENU_Y                                                   ; IS MENU CHOICE = PLAYOFFS
	CMP #PLAYOFF_STANDING_MENU_CHOICE                            ; 
	BEQ @draw_playoff_bracket                                     ; YES-> PLAYOFF STANDINGS
	JSR DRAW_DIVISION_STANDINGS_MENU_CHOICE                      ; DRAW DIVISION STANDINGS($E1,$E2= MENU CHOICE)
	
@division_standings_input_check:                                 ; STANDINGS INPUT CHECK
	RETURN_1_FRAME  
	LDA JOY_PRESS_BOTH                                           ; IS A OR B PRESSED?
	AND #(A_BUTTON + B_BUTTON)                                   ;
	BEQ @division_standings_input_check                          ; NO-> STANDINGS INPUT CHECK
	JMP @exit_from_division_to_standings_menu                    ; YES-> RETURN FROM PLAYOFF BRACKET OR STANDINGS TO SEASON MENU

@draw_playoff_bracket:                                           ; PLAYOFF STANDINGS
	JSR DRAW_PLAYOFF_BRACKET_RETURN_B_PRESS                      ; DRAW PLAYOFF BRACKET()

@exit_from_division_to_standings_menu:                           ; 
	LDA #$00                                                     ; CLEAR X MENU OPTION 
	STA MENU_X                                                   ;
	JSR REDRAW_SEASON_MENU_SCREEN                                ; REDRAW MAIN MENU AND SEASON MENU()
	LDA #STANDINGS_MENU_SCREEN_ID                                ; SET DRAW SCREEN = STANDINGS MENU
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDA #SEASON_STANDINGS_Y_SCROLL                               ; SET Y SCROLL = $0060 
	STA CURR_Y_SCROLL                                            ; 
	LDA #$00                                                     ;
	STA CURR_Y_SCROLL+1                                          ; 
	LDA PREV_MENU_Y                                              ; RESTORE Y MENU CHOICE
	STA MENU_Y                                                   ;
	LDA PREV_MENU_X                                              ; RESTORE X MENU CHOICE
	STA MENU_X                                                   ;
	RETURN_1_FRAME  
	LDA #SEASON_MENU_BG_PAL_INDEX                                ; SET BACKGROUND PALLETE INDEX
	LDX #SEASON_MENU_SPR_PAL_INDEX                               ; SET SPRITE PALLETE INDEX
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	JMP @season_standings_menu_init                              ; JUMP-> STANDINGS MENU INPUT START


@exit_standings_scroll_up:                                       ; EXIT FROM STANDINGS SCROLL UP TO SEASON MENU

sram_addr = LOCAL_1	

	LDA #SPRITE_OFFSCREEN                                               ; SET MENU ARROW = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	LDA #SCROLL_UP_STANDINGS                                     ; SET SCROLL DIRECTION = UP
	JSR SCROLL_TO_FROM_STANDINGS[direction]                      ; SCROLL TO OR FROM STANDINGS( 0= SCROLL UP, 1 = SCROLL DOWN)
	JSR SET_MMC3_VERT_MIRROR                                     ; SET MMC3 MIRRORING TO VERTICAL()
	LDY #<SEASON_STANDINGS_PPU_ADDR                              ; SET PPU ADDR  = $2400
	LDX #>SEASON_STANDINGS_PPU_ADDR                              ;
	LDA #<SEASON_STANDINGS_MENU_SRAM                             ; SET DATA ADDR  = $6103
	STA sram_addr                                                ;
	LDA #>SEASON_STANDINGS_MENU_SRAM                             ;
	STA sram_addr+1                                              ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()

ppu_addr = LOCAL_1		
	LDY #<SEASON_STANDING_PPU_ATTR_ADDR                          ; SET PPU ADDR  = $27C2
	LDX #>SEASON_STANDING_PPU_ATTR_ADDR                          ;
	LDA #<RETURN_FROM_STANDINGS_BG_ATRIB_DATA                    ; 
	STA ppu_addr                                                 ;
	LDA #>RETURN_FROM_STANDINGS_BG_ATRIB_DATA                    ;
	STA ppu_addr+1                                               ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()
	LDA #SEASON_MENU_STANDINGS_CHOICE                            ; SET Y MENU OPTION = STANDINGS
	STA MENU_Y                                                   ;
	JMP SEASON_MENU_INIT                                         ; SEASON MENU INPUT CHECK

RETURN_FROM_STANDINGS_BG_ATRIB_DATA:                           ; ATTRIBUTE TABLE DATA FOR RETURN FROM SEASON STANDINGS 
	.BYTE $08,$50,$50,$10,$00,$00                                 
	.BYTE $00,$00,$00                               
	.BYTE $FF                                                    ; END OF DATA
	
_F}_SEASON_STANDINGS_SCREEN 

_F{_SEASON_RANKINGS_SCREEN 										 ; DONE 

SEASON_MENU_RANKINGS_CHOICE		= $04

ppu_addr  						= LOCAL_1
sram_addr 						= LOCAL_3

num_tiles 						= LOCAL_1	
rows 							= LOCAL_2


	
TEAM_RANKINGS_SCREEN_START:                                      ; TEAM RANKINGS
	LDA #SPRITE_OFFSCREEN                                               ; SET ARROW SPRITE Y LOCATION = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	LDA #<TEAM_RANKINGS_PPU_ADDR                                 ; SET PPU ADDRESS TO READ FROM TO $224D
	STA ppu_addr                                                 ;
	LDA #>TEAM_RANKINGS_PPU_ADDR                                 ;
	STA ppu_addr+1                                               ;
	LDA #<TEAM_RANKINGS_MENU_SRAM                                ; SET SRAM ADDRESS TO WRITE TO TO $6103
	STA sram_addr                                                ;
	LDA #>TEAM_RANKINGS_MENU_SRAM                                ;
	STA sram_addr+1                                              ;
	LDX #$11                                                     ; SET LENGTH  = 17 TILES
	LDY #$0A                                                     ; SET ROWS = 10 ROWS
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                           ; SAVE PPU DATA IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
	LDA #RANKINGS_MENU_SCREEN_ID_EXTRA                           ; LOAD TEAM RANKINGS DRAW EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; LOAD BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	LDA #$00                                                     ;
	STA MENU_Y                                                   ; SET Y MENU INDEX = FIRST OPTION
	STA MENU_X                                                   ; SET X MENU INDEX = FIRST OPTION
@rankings_menu_initialization:
	LDY #<RANKINGS_MENU_OPTIONS_DATA                                   ;
	LDX #>RANKINGS_MENU_OPTIONS_DATA                                   ;
	LDA #BOTH_JOYPADS                                            ; SET JOY = BOTH
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	
@rankings_menu_input_loop:                                       ; RANKINGS INPUT LOOP
	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	BIT JOY_PRESS_BOTH                                            ; DOES P1/P2 PRESS= B PRESSED
	BVS @return_season_menu_from_standings                       ; YES->B PRESSED ON TEAM RANKINGS RETURN TO SEASON MENU
	BPL @rankings_menu_input_loop                                ; A/B NOT PRESSED-> RANKINGS INPUT LOOP
	
@save_menu_choice:	
	LDA MENU_Y                                                   ; SAVE Y MENU CHOICE
	STA PREV_MENU_Y                                              ;
	LDA MENU_X                                                   ; SAVE X MENU CHOICE
	STA PREV_MENU_X                                              ;
	JSR DO_TEAM_RANKINGS                                         ; DO TEAM RANKINGS()
	JSR REDRAW_SEASON_MENU_SCREEN                                ; REDRAW MAIN MENU AND SEASON MENU()
	LDA #RANKINGS_MENU_SCREEN_ID_EXTRA                           ; SET SCREEN ID = RANKINGS SCREEN
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK) 
	LDA PREV_MENU_Y                                              ; RESTORE Y MENU CHOICE
	STA MENU_Y                                                   ;
	LDA PREV_MENU_X                                              ; RESTORE X MENU CHOICE
	STA MENU_X                                                   ; 
	LDA #SEASON_MENU_BG_PAL_INDEX                                ; SET BACKGROUND PALLETE INDEX
	LDX #SEASON_MENU_SPR_PAL_INDEX                               ; SET SPRITE PALLETE INDEX
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	JMP @rankings_menu_initialization                            ; JUMP-> RANKINGS MENU INPUT START



@return_season_menu_from_standings:                              ; B PRESSED ON TEAM RANKINGS RETURN TO SEASON MENU
	LDA #SPRITE_OFFSCREEN                                               ; SET ARROW SPRITE Y = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	LDY #<TEAM_RANKINGS_PPU_ATTR_ADDR                            ; SET PPU ADDRESS = BOTTOM OF ATTRIBUTE TABLE
	LDX #>TEAM_RANKINGS_PPU_ATTR_ADDR                            ;
	
@clear_part_of_screen

sram_addr 	= LOCAL_1
	
	LDA #$01                                                     ;
	STA rows                                                     ; 
	LDA #$0B                                                     ;
	STA num_tiles                                                ; 
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	LDY #<TEAM_RANKINGS_PPU_ADDR                                 ; SET PPU ADDRESS = $224D
	LDX #>TEAM_RANKINGS_PPU_ADDR                                 ;
	LDA #<TEAM_RANKINGS_MENU_SRAM                                ; SET SRAM DATA ADDRESS = $6103
	STA sram_addr                                                ;
	LDA #>TEAM_RANKINGS_MENU_SRAM                                ;
	STA sram_addr+1                                              ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()
	
@set_menu_choice_back_to_rankings	
	LDA #SEASON_MENU_RANKINGS_CHOICE	                         ; SET Y MENU OPTION = TEAM RANKINGS
	STA MENU_Y                                                   ;
	JMP SEASON_MENU_INIT                                         ; SEASON MENU INPUT CHECK
	
_F}_SEASON_RANKINGS_SCREEN
	
_F{_SEASON_LEADERS_SCREEN 										 ; DONE

SEASON_MENU_LEADERS_CHOICE		= $05

SEASON_NFL_LEADERS:                                              ; NFL LEADERS MENU OPTION START
	LDA #$00                                                     ; SET X AND Y MENU OPTION = FIRST OPTION
	STA MENU_Y                                                   ;
	STA MENU_X                                                   ;
	
SEASON_DRAW_NFL_LEADERS:                                  		; NFL LEADERS DRAW START 
	LDA #NFL_LEADERS_SCENE_ID                                    ; SET EVENT = NFL LEADERS
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; SET BANK = 8 
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	LDA #$0F                                                     ; SET SOFT CHR BANK $1000 = 0X0F 
	STA SOFT_CHR_1000_BANK                                       ;
	LDY #<LEADERS_MENU_OPTIONS_DATA                              ; SET LEADERS MENU INFO ADDR
	LDX #>LEADERS_MENU_OPTIONS_DATA                              ;
	LDA #BOTH_JOYPADS                                            ; SET JOY = BOTH
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	
@nfl_leaders_input_loop:                                         ; NFL LEADERS INPUT LOOP
	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVS @exit_from_nfl_leaders_to_season_menu                    ; 
	BPL @nfl_leaders_input_loop                                  ;
	
@save_menu_choice:	
	LDA MENU_Y                                                   ; SAVE MENU OPTIONS
	STA PREV_MENU_Y                                              ;
	LDA MENU_X                                                   ;
	STA PREV_MENU_X                                              ;
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] NFL_LEADERS_BANK, BANK_JUMP_DRAW_NFL_LEADERS_SCREEN ; *** can use actual
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	LDA PREV_MENU_Y                                              ; RESTORE MENU OPTIONS
	STA MENU_Y                                                   ;
	LDA PREV_MENU_X                                              ;
	STA MENU_X                                                   ;
	JMP SEASON_DRAW_NFL_LEADERS                                ; JUMP-> NFL LEADERS DRAW START
	
@exit_from_nfl_leaders_to_season_menu:                           ; B PRESSED EXIT NFL LEADERS
	LDA #SEASON_MENU_LEADERS_CHOICE                              ; SET Y MENU OPTION = NFL LEADERS
	STA MENU_Y                                                   ;
	JMP REDRAW_SEASON_MENU_SCREEN_INIT_MENU                      ; JUMP TO RE-DRAW SEASON MENU
	
_F}_SEASON_LEADERS_SCREEN  

_F{_SEASON_TEAM_DATA											 ; DONE

SEASON_MENU_TEAM_DATA_CHOICE		= $06

SEASON_TEAM_DATA:                                                ; TEAM DATA SEASON
	JSR DO_TEAM_DATA_SCREEN_TEAM_SELECTION                       ; DO TEAM DATA()
	LDA GAME_STATUS                                              ; SET GAME STATUS = SEASON MODE
	AND #%11111100                                                ; 
	ORA #%00000010                                                ;
	STA GAME_STATUS                                              ;
	LDA #SEASON_MENU_TEAM_DATA_CHOICE                            ; SET Y MENU OPTION = SEASON TEAM DATA
	STA MENU_Y                                                   ;
	JMP REDRAW_SEASON_MENU_SCREEN_INIT_MENU                      ; JUMP TO RE-DRAW SEASON MENU

_F}_SEASON_TEAM_DATA

_F{_HORIZONTAL_SCROLL_MENU_SCREENS								 ; DONE


FRAMES_TO_SCROLL_FROM_PRE_TO_SEASON		= $20 
IRQ_SPLIT_LINE_SHIELD					= $38					; ABOUT 1/4 OF THE WAY 

	
SCROLL_TO_MAIN_MENU:                                             ;
	LDA #SPRITE_OFFSCREEN                                               ; SET MENU ARROW = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	LDA #$01                                                     ; SET NFL LOGO LOCATION = RIGHT SIDE OF SCREEN
	JSR SCROLL_PRESEASON_SEASON_SCREENS                          ; SCROLL SCREEN AND DRAW NFL LOGO(A= SCROLL DIRECTION)
	LDA #$01                                                     ;
	STA MENU_Y                                                   ;
	JMP INIT_MAIN_MENU_CHOICES                                   ; JUMP-> INITIALIZE MAIN MENU Y DATA OPTIONS

frames_to_scroll 			= LOCAL_1
scroll_direction 			= LOCAL_2
starting_nfl_logo_spr_loc 	= LOCAL_3	 
SCROLL_PRESEASON_SEASON_SCREENS:                                 ; SCROLL SCREEN AND DRAW NFL LOGO(A= SCROLL DIRECTION)
	TAX                                                          ; SET SCROLL INFO INDEX = SHIFT 4 BYTES FOR TABLE
	ASL                                                          ;
	ASL                                                          ;
	STA scroll_direction                                         ; SAVE SCROLL INFO INDEX
	LDA NFL_LOGO_SPR_STARTING_X_LOC,X                            ; SET NFL LOGO STARTING SCROLL X FROM NFL LOGO STARTING X LOCATION 
	STA starting_nfl_logo_spr_loc+1                              ;
	LDA #$00                                                     ;
	STA starting_nfl_logo_spr_loc                                ;
	
	LDY #$FC                                                     ; 
@copy_irq0_to_irq1:                                              ; TRANSFER IRQ0 TO IRQ1 LOOP
	LDA IRQ_0_XSCROLL-$FC,Y                                      ;
	STA IRQ_1_XSCROLL-$FC,Y                                      ;
	INY                                                          ;
	BNE @copy_irq0_to_irq1                                       ; NOT DONE? ->TRANSFER IRQ0 TO IRQ1
	LDA #IRQ_SPLIT_LINE_SHIELD                                   ; SET IRQ0 COUNTER = ABOUT 1/4 SCREEN = SCREEN TITLE
	STA IRQ_0_COUNTER                                            ;
	LDA #$00                                                     ; CLEAR IRQ 1 COUNTER
	STA IRQ_1_COUNTER                                            ;
	LDA #FRAMES_TO_SCROLL_FROM_PRE_TO_SEASON                     ; SET NUMBER OF FRAMES TO SCROLL = 32
	STA frames_to_scroll                                         ;
	
@scroll_loop:                                                    ; SCROLL MAIN MENU SCREEN LOOP
	_WHILE NOT_EQUAL
	
	RETURN_1_FRAME  
	LDX scroll_direction                                         ; LOAD SCROLL INFO INDEX
	LDA IRQ_0_XSCROLL                                            ; = TITLE SCROLL X -  MENU SCROLL SPEED FROM SEASON MENU SCREEN SCROLL INFO
	SEC                                                          ;
	SBC PRE_SEASON_TO_SEASON_SCROLL_INFO,X                       ;
	STA IRQ_0_XSCROLL                                            ;
	LDA IRQ_0_NAMETABLE	                                         ;
	SBC PRE_SEASON_TO_SEASON_SCROLL_INFO+1,X                     ;
	AND #$01                                                     ;
	STA IRQ_0_NAMETABLE	                                         ;
	LDA IRQ_1_XSCROLL                                            ; = MENU SCROLL X -  MENU SCROLL SPEED FROM SEASON MENU SCREEN SCROLL INFO
	CLC                                                          ;
	ADC PRE_SEASON_TO_SEASON_SCROLL_INFO,X                       ;
	STA IRQ_1_XSCROLL                                            ;
	LDA IRQ_1_NAMETABLE                                          ;
	ADC PRE_SEASON_TO_SEASON_SCROLL_INFO+1,X                     ;
	AND #$01                                                     ;
	STA IRQ_1_NAMETABLE                                          ;
	LDA starting_nfl_logo_spr_loc                                ; = NFL LOGO SCROLL X -  LOGO SCROLL SPEED FROM SEASON MENU SCREEN SCROLL INFO
	CLC                                                          ;
	ADC PRE_SEASON_TO_SEASON_SCROLL_INFO+2,X                     ;
	STA starting_nfl_logo_spr_loc                                ;
	LDA starting_nfl_logo_spr_loc +1                             ;
	ADC PRE_SEASON_TO_SEASON_SCROLL_INFO+3,X                     ;
	STA starting_nfl_logo_spr_loc +1                             ;
	JSR DRAW_NFL_SHIELD_SPRITES[x_offset]                        ; DRAW_MENU_NFL_LOGO (A= X LOCATION FOR LOGO)
	DEC frames_to_scroll                                         ; NUMBER OF FRAMES TO SCROLL--
	
	_END_WHILE
	
	LDA #$00                                                     ; SET IRQ 0 COUNTER = 0
	STA IRQ_0_COUNTER                                            ; 
	RTS                                                          ; RETURN


	

	
PRE_SEASON_TO_SEASON_SCROLL_INFO:                                 ; SEASON MENU SCREEN SCROLL INFO

																 ; SCROLL SPEED LOW, SCROLL SPEED HIGH, SHIELD SCROLL SPEED LOW, SHIELD SCROLL SPEED HIGH
	.BYTE $08, $00, $80, $FB                                     ; SCROLL TO SEASON MENU
	.BYTE $F8, $FF, $80, $04                                     ; SCROLL TO PRESEASON MENU

NFL_LOGO_SPR_STARTING_X_LOC:                                     ; NFL LOGO STARTING X LOCATION      
	.BYTE NLF_LOGO_X_LOCATION_PRESEASON                          ; PRESEASON STARTING X LOCATION
	.BYTE NLF_LOGO_X_LOCATION_SEASON                             ; SEASON STARTING X LOCATION
	
_F}_HORIZONTAL_SCROLL_MENU_SCREENS	

_F{_SEASON_STANDINGS_SCROLL_TO_AND_FROM							 ; DONE

SCROLL_AMOUNT_PER_FRAME_STANDINGS	= $04	
FRAMES_TO_VERT_SCROLL_STANDINGS		= $18 

frames_to_scroll 					= LOCAL_1
y_distance_per_frame 				= LOCAL_2

SCROLL_TO_FROM_STANDINGS[direction]:                             ; SCROLL TO OR FROM STANDINGS( 0= SCROLL UP, 1 = SCROLL DOWN)
	ASL                                                          ; SET SCROLL DIRECTION
	ASL                                                          ;
	ASL                                                          ;
	SEC                                                          ;
	SBC #SCROLL_AMOUNT_PER_FRAME_STANDINGS                      ; SET SCROLL DIRECTION AND AMOUNT  = +4 OR -4 
	STA y_distance_per_frame                                     ;
	LDA #FRAMES_TO_VERT_SCROLL_STANDINGS                         ; SET NUMBER OF FRAMES TO SCROLL = 24
	STA frames_to_scroll                                         ;
_WHILE NOT_EQUAL

	RETURN_1_FRAME  
	LDA y_distance_per_frame                                     ; LOAD SCROLL AMOUNT
	JSR UPDATE_Y_SCROLL_LOCATION                                 ; UPDATE Y SCROLL LOCATION()
    DEC frames_to_scroll
_END_WHILE
	RTS                                                          ; RETURN

UPDATE_Y_SCROLL_LOCATION:                                        ; UPDATE Y SCROLL LOCATION FOR STANDINGS()
	TAY                                                          ; IS SCROLL DIRECTION = UP
	BMI @scroll_up                                                ; YES->SCROLL UP

	CLC                                                          ; SCROLL DOWN TO STANDINDS
	ADC CURR_Y_SCROLL                                            ;
	CMP #$F0                                                     ;
	BCC @exit_scroll_down:                                       ;
	ADC #$0F                                                     ;
	INC CURR_Y_SCROLL+1                                          ;
	
@exit_scroll_down:                                               ;
	STA CURR_Y_SCROLL                                            ;
	RTS                                                          ; RETURN

@scroll_up:                                                          ; SCROLL UP FROM STANDINDS
	CLC                                                          ; Y SCROLL = Y SCROLL + AMOUNT
	ADC CURR_Y_SCROLL                                                      ;
	CMP #$F0                                                     ;
	BCC @exit_scroll_up                                                    ;
	SBC #$10                                                     ;
	DEC CURR_Y_SCROLL+1                                          ;
	
@exit_scroll_up:                                                 ; 
	STA CURR_Y_SCROLL                                                      ;
	RTS                                                          ; RETURN

_F}_SEASON_STANDINGS_SCROLL_TO_AND_FROM 

_F{_PRESEASON_PRO_BOWL_SCREEN									 ; DONE

PRESEASON_PROBOWL_MENU_CHOICE			= $02 
	
PRO_BOWL_MENU_START:                                             ; PRO BOWL 
	LDA GAME_STATUS                                              ; SET GAME TYPE = PRO BOWL
	AND #%11111100                                               ;
	ORA #%00000001                                               ;
	STA GAME_STATUS                                              ;
	JSR SAVE_MENU_SRAM_DRAW_PB_SCREEN                            ; SAVE PART OF PREVIOUS MENU IN SRAM()
	LDA #$00                                                     ; SET MENU CHOICE = FIRST OPTION
	STA MENU_Y                                                   ;
	
INIT_PRO_BOWL_MENU_CHOICES:
	LDY #<PRO_BOWL_MENU_OPTIONS_DATA                                   ; LOAD PRO BOWL MENU INFO ADDR = $BA0F
	LDX #>PRO_BOWL_MENU_OPTIONS_DATA                                   ; 
	LDA #BOTH_JOYPADS                                                    ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	
@pro_bowl_menu_input_loop:                                       ; PRO BOWL INPUT LOOP
	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVC @check_a_press                                            ; NO-> CHECK FOR A
	JMP RETURN_TO_PRESEASON_MENU_FROM_PB                         ; YES-> EXIT PRO BOWL
	
@check_a_press:                                                  ; CHECK FOR A
	BPL @pro_bowl_menu_input_loop                                ; A PRESSED? NO-> PRO BOWL INPUT LOOP
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	RTS_JUMP_TABLE[memVal_tableAddr] MENU_Y, PRO_BOWL_COMMAND_CHOICES

	
PRO_BOWL_COMMAND_CHOICES: 
	.WORD PRO_BOWL_MAN_V_COM -1                                  ; PB MAN VS COM-1 
	.WORD PRO_BOWL_MAN_V_MAN -1                                  ; PB MAN VS MAN-1 
	.WORD PRO_BOWL_MAN_V_COA -1                                  ; PB MAN VS COA-1 
	.WORD PRO_BOWL_COA_V_COM -1                                  ; PB COA VS COM-1 
	.WORD PRO_BOWL_COA_V_COA -1                                  ; PB COA VS COA-1 
	.WORD PRO_BOWL_COM_V_COM -1                                  ; PB COM VS COM-1
	
.ENUM $00 
	PRO_BOWL_MAN_V_COM_MENU_CHOICE	.dsb 1	
	PRO_BOWL_MAN_V_MAN_MENU_CHOICE	.dsb 1	
	PRO_BOWL_MAN_V_COA_MENU_CHOICE	.dsb 1	
	PRO_BOWL_COA_V_COM_MENU_CHOICE	.dsb 1	
	PRO_BOWL_COA_V_COA_MENU_CHOICE	.dsb 1	
	PRO_BOWL_COM_V_COM_MENU_CHOICE	.dsb 1	
.ENDE 	

PRO_BOWL_MAN_V_COM:                                              ; PB MAN VS COM
	LDA #(P1_TEAM_MAN_CTRL + P2_TEAM_COM_CTRL)                   ; SET PLAYER TYPE = MAN VS COM
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_PROBOWL_SELECT_SCREEN                               ; DRAW PRO BOWL SELECT SCREEN()
	JSR DO_PRO_BOWL_TEAM_SELECT                                  ; DO PRO BOWL TEAM SELECTION()
	BCS @return_PB_team_type                                     ; B PRESSED? Y->RETURN TO MAN VS COM MENU CHOICE
	JMP PRO_BOWL_GAME_START                                      ; JUMP-> PRO BOWL-GAME START
	
@return_PB_team_type:                                            ; RETURN TO MAN VS COM MENU CHOICE
	LDA #PRO_BOWL_MAN_V_COM_MENU_CHOICE                          ; SET MENU OPTION = PB MAN V MAN
	STA MENU_Y                                                   ;
	JMP EXIT_TO_PRO_BOWL_TEAM_TYPE_SELECTION                     ; JUMP-> RETURN TO PRO BOWL TEAM TYPE SELECTION

PRO_BOWL_MAN_V_MAN:                                              ; PB MAN VS MAN
	LDA #(P1_TEAM_MAN_CTRL + P2_TEAM_MAN_CTRL)                    ; SET PLAYER TYPE = MAN VS MAN
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_PROBOWL_SELECT_SCREEN                               ; DRAW PRO BOWL SELECT SCREEN()
	JSR DO_PRO_BOWL_TEAM_SELECT                                  ; DO PRO BOWL TEAM SELECTION()
	BCS @return_PB_team_type                                     ; B PRESSED? Y->RETURN TO MAN VS MAN MENU CHOICE
	JMP PRO_BOWL_GAME_START                                      ; JUMP-> PRO BOWL-GAME START
	
@return_PB_team_type:                                             ; RETURN TO MAN VS MAN MENU CHOICE
	LDA #PRO_BOWL_MAN_V_MAN_MENU_CHOICE                                                     ; SET MENU OPTION = PB MAN V MAN
	STA MENU_Y                                                   ;
	JMP EXIT_TO_PRO_BOWL_TEAM_TYPE_SELECTION                     ; JUMP-> RETURN TO PRO BOWL TEAM TYPE SELECTION

PRO_BOWL_COA_V_COM:                                                       ; PB COA VS COM
	LDA #(P1_TEAM_COA_CTRL + P2_TEAM_COM_CTRL)                                                     ; SET PLAYER TYPE = COA VS COM
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_PROBOWL_SELECT_SCREEN                                                ; DRAW PRO BOWL SELECT SCREEN()
	JSR DO_PRO_BOWL_TEAM_SELECT                                                ; DO PRO BOWL TEAM SELECTION()
	BCS @return_PB_team_type                                                 ; B PRESSED? Y->RETURN TO COA VS COM MENU CHOICE
	JMP PRO_BOWL_GAME_START                                                ; JUMP-> PRO BOWL-GAME START
	
@return_PB_team_type:                                                         ; RETURN TO COA VS COM MENU CHOICE
	LDA #PRO_BOWL_COA_V_COM_MENU_CHOICE                                                     ; SET MENU OPTION = PB COA V COM
	STA MENU_Y 
	JMP EXIT_TO_PRO_BOWL_TEAM_TYPE_SELECTION                      ; JUMP-> RETURN TO PRO BOWL TEAM TYPE SELECTION

PRO_BOWL_COA_V_COA:                                              ; PB COA VS COA
	LDA #(P1_TEAM_COA_CTRL + P2_TEAM_COA_CTRL)                  ; SET PLAYER TYPE = COA VS COA
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_PROBOWL_SELECT_SCREEN                                                ; DRAW PRO BOWL SELECT SCREEN()
	JSR DO_PRO_BOWL_TEAM_SELECT                                                ; DO PRO BOWL TEAM SELECTION()
	BCS @return_PB_team_type                                                 ; B PRESSED? Y->RETURN TO COA VS COM MENU CHOICE
	JMP PRO_BOWL_GAME_START                                                ; JUMP-> PRO BOWL-GAME START
	
@return_PB_team_type:                                                         ; RETURN TO COA VS COA MENU CHOICE
	LDA #PRO_BOWL_COA_V_COA_MENU_CHOICE                                                     ; SET MENU OPTION = PB COA V COA
	STA MENU_Y                                                   ;
	JMP EXIT_TO_PRO_BOWL_TEAM_TYPE_SELECTION                     ; JUMP-> RETURN TO PRO BOWL TEAM TYPE SELECTION

PRO_BOWL_MAN_V_COA:                                              ; PB MAN VS COA
	LDA #(P1_TEAM_MAN_CTRL + P2_TEAM_COA_CTRL)                   ; SET PLAYER TYPE = MAN VS COA
	STA TEAM_CONTROL_TYPES                                       ;
	JSR DRAW_PROBOWL_SELECT_SCREEN                                                ; DRAW PRO BOWL SELECT SCREEN()
	JSR DO_PRO_BOWL_TEAM_SELECT                                                ; DO PRO BOWL TEAM SELECTION()
	BCS @return_PB_team_type                                                  ; B PRESSED? Y->RETURN TO MAN VS COA MENU CHOICE
	JMP PRO_BOWL_GAME_START                                                ; JUMP-> PRO BOWL-GAME START
	
@return_PB_team_type:                                                         ; RETURN TO MAN VS COA MENU CHOICE
	LDA #PRO_BOWL_MAN_V_COA_MENU_CHOICE                                                      ; SET MENU OPTION = PB MAN V COA
	STA MENU_Y                                                   ;
	JMP EXIT_TO_PRO_BOWL_TEAM_TYPE_SELECTION                     ; JUMP-> RETURN TO PRO BOWL TEAM TYPE SELECTION

PRO_BOWL_COM_V_COM:                                              ; PB COM VS COM
	LDA #(P1_TEAM_COM_CTRL + P2_TEAM_COM_CTRL)                   ; SET PLAYER TYPE = COM VS COM
	STA TEAM_CONTROL_TYPES
	JSR DRAW_PROBOWL_SELECT_SCREEN                               ; DRAW PRO BOWL SELECT SCREEN()
	JSR DO_PRO_BOWL_TEAM_SELECT                                  ; DO PRO BOWL TEAM SELECTION()
	BCS @return_PB_team_type                                     ; B PRESSED? Y->RETURN TO COM VS COM MENU CHOICE
	JMP PRO_BOWL_GAME_START                                      ; JUMP-> PRO BOWL-GAME START

@return_PB_team_type:                                            ; RETURN TO COM VS COM MENU CHOICE
	LDA #PRO_BOWL_COM_V_COM_MENU_CHOICE                          ; SET MENU OPTION = PB MAN V COA
	STA MENU_Y                                                   ;
	JMP EXIT_TO_PRO_BOWL_TEAM_TYPE_SELECTION                     ; JUMP-> RETURN TO PRO BOWL TEAM TYPE SELECTION

sram_addr = LOCAL_1
	
RETURN_TO_PRESEASON_MENU_FROM_PB:                                ; EXIT PRO BOWL
	LDA #SPRITE_OFFSCREEN                                               ; SET ARROW TILE Y = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	LDY #<PRO_BOWL_MENU_PPU_ADDR                                 ; SET PPU ADDRESS = $25C5
	LDX #>PRO_BOWL_MENU_PPU_ADDR                                 ;
	LDA #<PRO_BOWL_MENU_SRAM                                     ; SET DATA ADDRESS =$6003
	STA sram_addr                                                ;
	LDA #>PRO_BOWL_MENU_SRAM                                     ;
	STA sram_addr+1                                              ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()
	LDA #PRESEASON_PROBOWL_MENU_CHOICE                           ; SET MENU OPTION = PRO-BOWL
	STA MENU_Y                                                   ;
	JMP INIT_MAIN_MENU_CHOICES                                   ; JUMP TO INITIALIZE MAIN MENU Y DATA OPTIONS

EXIT_TO_PRO_BOWL_TEAM_TYPE_SELECTION:                            ; RETURN TO PRO BOWL TEAM TYPE SELECTION
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	JSR SET_ALL_SPR_OFFSCREEN                                    ; CLEAR SPRITES()
	JSR DRAW_MAIN_MENU_ONSCREEN_SEASON_OFFSCREEN                 ; DRAW MAIN MENU()
	JSR SAVE_MENU_SRAM_DRAW_PB_SCREEN                                                ; SAVE PART OF PREVIOUS MENU IN SRAM()
	LDA #PRESEASON_MENU_BG_PAL_INDEX                             ; SET BG PAL INDEX
	LDX #PRESEASON_MENU_SPR_PAL_INDEX                            ; SET SPR PAL INDEX
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	JMP INIT_PRO_BOWL_MENU_CHOICES													 ; 

_F}_PRESEASON_PRO_BOWL_SCREEN 

_F{_PRESEASON_TEAM_DATA_TEAM_SELECTION							 ; DONE

PRESEASON_TEAM_DATA_MENU_CHOICE			= $03
LAST_TEAM_MAP_ID						= $23
	
PRESEASON_TEAM_DATA_START:                                       ; TEAM DATA MENU
	JSR DO_TEAM_DATA_SCREEN_TEAM_SELECTION                       ; DO TEAM DATA()
	LDA #PRESEASON_TEAM_DATA_MENU_CHOICE	                     ; SET Y MENU OPTION = TEAM DATA
	STA MENU_Y                                                   ;
	JMP DRAW_MAIN_MENU_PREV_CHOICE                               ; JUMP->FADE OUT PAL, CLEAR NAMETABLES AND SPRITE AND DRAW MAIN MENU

DO_TEAM_DATA_SCREEN_TEAM_SELECTION:                              ; TEAM DATA START
	LDA #$00                                                     ; 
	STA MENU_Y                                                   ; SET Y MENU INDEX = FIRST OPTION
	STA MENU_X                                                   ; SET X MENU INDEX = FIRST OPTION
	
DRAW_MINI_HELMETS_INIT_MENU:                                     ; DRAW MINI HELMETS TEAM DATA
	LDA #TEAM_DATA_SCREEN_ID	                                 ; LOAD TEAM DATA DRAW EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK	                                 ; LOAD BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	LDY #<MINI_HELMET_SPR_LOCATIONS                            	 ; LOAD MINI HELMETS TEAM DATA ADRESS
	LDX #>MINI_HELMET_SPR_LOCATIONS                              ;
	JSR DRAW_MINI_HELMETS_AT_LOCATIONS                           ; DRAW MINI HELMETS AT COORDINATES()
	LDA #TEAM_DATA_HELMETS_BG_PAL_INDEX	                         ; SET BACKGROUND PALLETE
	LDX #TEAM_DATA_HELMETS_SPR_PAL_INDEX	                     ; SET SPRITE PALLETE
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	LDY #<MINI_HELMET_ARROW_MENU_INFO                            ; LOAD TEAM DATA ARROW MENU INFO ADDDRESS
	LDX #>MINI_HELMET_ARROW_MENU_INFO                            ;
	LDA #BOTH_JOYPADS                                            ;
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)

@team_data_input_loop:                                            ; TEAM DATA INPUT CHECK LOOP
	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVC @team_data_a_pressed_check                               ; NO->
	JMP FADE_OUT_AND_RETURN                                      ; B PRESSED JUMP TO EXIT TO TEAM HELMET SCREEN
	
@team_data_a_pressed_check:                                      ;
	BPL @team_data_input_loop                                    ; A PRESSED? NO-> TEAM DATA INPUT CHECK LOOP   
	LDA MENU_Y                                                   ; SAVE Y MENU OPTION
	STA PREV_MENU_Y                                              ; 
	LDA MENU_X                                                   ; SAVE X MENU OPTION
	STA PREV_MENU_X                                              ;
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MINI HELMET ARROW MAP() A= RET
	SEC                                                          ; 
	SBC #$06                                                     ;
	CMP #(LAST_TEAM_MAP_ID -6 +1)                                ; *** COULD JUST TO BRANCH MINUS OR DO DIFF COMPARE METHOD
	BCC @a_pressed_on_mini_helemet_team                          ; NO->A PRESSED ON REGULAR TEAM FOR TEAM DATA
	JMP PRO_BOWL_TEAM_DATA_START                                 ; YES-> JUMP TO PRO-BOWL TEAM DATA

@a_pressed_on_mini_helemet_team:                                 ; A PRESSED ON REGULAR TEAM FOR TEAM DATA
	JSR GET_TEAM_ID_TEAM_DATA_OR_CONTROL                         ; GET TEAM ID FROM GRID LOCATION (X= GRID LOCATION)
	STA CURRENT_TEAM                                             ; SAVE TEAM IN CURRENT TEAM
	STA P1_TEAM                                                  ; SAVE TEAM IN P1 TEAM
	CLC                                                          ;
	ADC #$01                                                     ; IS NEXT TEAM = PROBOWL? ***CODE COULD BE CHANGED***
	CMP #NUMBER_OF_TEAMS_IN_LEAGUE                               ;
	BCC @save_P2_team                                            ; NO-> SAVE NEXT TEAM	
	LDA #BUF_TEAM_ID                                             ; YES->SET NEXT TEAM TO BUF
	
@save_P2_team:                                                   ; SAVE NEXT TEAM
	STA P2_TEAM                                                  ; NO SET P2 TEAM = NEXT TEAM
	
@transfer_season_info_to_temp_info: 	
	JSR CLEAR_IN_GAME_STATS_TRANSFER_SEASON_INFO                 ; CLEAR P1/P2 GAME STATS, TRANSFER PB, STARTERS, INJ, CONDITIONS TO P1/P2 GAME INFO()
	JSR SET_CUR_STARTERS_PLAYBOOKS_TO_SEASON                     ; LOAD STARTERS AND PLAYBOOKS FROM SEASON INFO()
	LDA #$00                                                     ; SET POSSESSION = P1 SIDE
	STA POSSESSION_STATUS                                        ; 
	STA MENU_X                                                   ; SET X MENU INDEX = FIRST OPTION
	STA MENU_Y                                                   ; SET Y MENU INDEX = FIRST OPTION

_F}_PRESEASON_TEAM_DATA_TEAM_SELECTION 
	
_F{_TEAM_DATA_SCREEN											 ; DONE

DRAW_TEAM_DATA_SCREEN_AND_DO_INPUT:                              ; DRAW TEAM DATA SCREEN
	JSR DRAW_TEAM_SCREEN_AND_LARGE_HELMET                        ; DRAW TEAM DATA BACKGROUND, WINS/LOSSES, HELMET, SET SPLIT SCREEN()   

INIT_TEAM_DATA_MENU:
	LDY #<TEAM_DATA_MENU_OPTIONS_DATA                                       ; SET MENU DATA ADDR =  TEAM_DATA ROSTER_MENU= $BA19
	LDX #>TEAM_DATA_MENU_OPTIONS_DATA                                       ;
	LDA #BOTH_JOYPADS                                           ; SET JOYPAD INDEX= P1/P2 RAW
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	
@team_data_input_loop:                                           ; TEAM MENU INPUT CHECK LOOP
	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= B PRESSED
	BVC @check_a_pressed                                          ; NO->
	JMP EXIT_TEAM_DATA_TO_TEAM_SELECTION                        ; YES-> EXIT TEAM ROSTER SCREEN TO TEAM DATA HELMETS

@check_a_pressed:                                                ; CHECK FOR MENU OPTION SELECTED
	BPL @team_data_input_loop                                     ; A PRESSED? NO-> TEAM MENU INPUT CHECK LOOP
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	RTS_JUMP_TABLE[memVal_tableAddr] MENU_Y, TEAM_DATA_MENU_CHOICES


TEAM_DATA_MENU_CHOICES:                                         ; TEAM DATA MENU OPTIONS
	.WORD PLAYER_DATA_START - 1                                  ; PLAYER DATA
	.WORD OFFENSIVE_STARTERS_SCREEN - 1                          ; OF STARTERS
	.WORD DEFENSIVE_STARTERS_SCREEN - 1                          ; DF STARTERS
	.WORD CHANGE_PLAYBOOK_SCREEN - 1                             ; PLAYBOOK
	
EXIT_TEAM_DATA_TO_TEAM_SELECTION:                                ; EXIT TEAM ROSTER SCREEN TO TEAM DATA HELMETS
	LDA #$00                                                     ; CLEAR IRQ 0 COUNTER   
	STA IRQ_0_COUNTER                                                    ; 
	LDA PREV_MENU_Y                                                      ; RESTORE MENU X,Y FOR HELMET MAP
	STA MENU_Y                                                   ;
	LDA PREV_MENU_X                                                       ;
	STA MENU_X                                                   ;
	JMP DRAW_MINI_HELMETS_INIT_MENU                              ; JUMP->DRAW MINI HELMETS TEAM DATA
	
_F}_TEAM_DATA_SCREEN

_F{_PLAYER_DATA_SCREEN											 ; DONE

PLAYER_DATA_MENU_OFFSET_TO_KICKER 	= $06
FIRST_PAGE_ROSTER_DATA 				= $00
SECOND_PAGE_ROSTER_DATA				= $01
THIRD_PAGE_ROSTER_DATA				= $02 
player_roster_id = LOCAL_6

PLAYER_DATA_START:                                               ; PLAYER DATA 
	LDY #$FC                                                     ;
@init_arrow_sprite_loop:                                         ; UPDATE 2ND ARROW SPRITE ATTRIBUTES LOOP
	LDA ROSTER_ARROW_SPR_INFO-$FC,Y                              ; TRANSFER SPR INFO FROM ROSTER PAGE ARROW SPRITE STARTING LOCATION
	STA SECOND_MENU_ARROW_SPR_INFO-$FC,Y                                              ;
	INY                                                          ;
	BNE @init_arrow_sprite_loop                                  ;
@set_to_first_player:                                            ; SET ARROW LOCATION TO FIRST PLAYER ON PAGE
	LDA #$00                                                     ; SET Y MENU INDEX = FIRST PLAYER
	STA MENU_Y                                                   ;
@init_roster_menu_options:                                       ; INITIALIZE PLAYER SELECTION ARROW
	LDA MENU_X                                                   ; IS X MENU INDEX = FIRST PAGE
	CMP #SECOND_PAGE_ROSTER_DATA                                  ;
	BNE @on_roster_pg1_pg3                                       ;
	LDY #<TEAM_PLAYER_SELECT_PG2_MENU_OPTIONS_DATA                                   ; 
	LDX #>TEAM_PLAYER_SELECT_PG2_MENU_OPTIONS_DATA                                   ;
	LDA #BOTH_JOYPADS                                            ;
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)   
	JMP @check_input_on_roster                                   ; JUMP-> CHECK FOR JOYPAD INPUT ON ROSTER PAGE LOOP

@on_roster_pg1_pg3:                                              ;
	LDY #<TEAM_PLAYER_SELECT_PG1_PG3_MENU_OPTIONS_DATA                                   ;
	LDX #>TEAM_PLAYER_SELECT_PG1_PG3_MENU_OPTIONS_DATA                                    ;
	LDA #BOTH_JOYPADS                                                     ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)

@check_input_on_roster:                                          ; CHECK FOR JOYPAD INPUT ON ROSTER PAGE LOOP
	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= “B” 
	BVS @exit_to_team_data_menu                                  ; YES->B PRESSED WITH ARROW ON PLAYER
	BMI @a_pressed_on_player                                     ; DOES P1/P2 PRESS= "A"  -> A PRESSED WITH ARROW ON PLAYER
	LDA JOY_PRESS_BOTH                                           ; DOES P1/P2 PRESS= RIGHT
	LSR                                                          ;
	BCS @right_dpad_press                                        ; YES-> RIGHT PRESSED WITH ARROW ON PLAYER
	LSR                                                          ;
	BCC @check_input_on_roster                                   ; NO PRESSES-> CHECK FOR JOYPAD INPUT ON ROSTER PAGE LOOP
	LDA #SPRITE_OFFSCREEN                                               ; SET ARROW SPRITE Y LOCATION = OFFSCREEEN
	STA MENU_ARROW_SPR_Y                                         ; ARROW X INDEX --
	DEC MENU_X                                                   ; 
	LDA MENU_X                                                   ; ARROW X INDEX < FIRST ROSTER PAGE?
	BPL @scroll_left                                             ; 
	LDA #THIRD_PAGE_ROSTER_DATA                                  ; SET ARROW INDEX= THIRD PAGE
	STA MENU_X                                                   ;
@scroll_left:                                                    ; SCROLL ROSTER PAGE LEFT TIMING LOOP
	RETURN_1_FRAME  
	LDA IRQ_1_XSCROLL                                            ; = BOTTOM SPLIT SCREEN XSCROLL LOCATION – 8 PIXELS
	SEC                                                          ; 
	SBC #SIZE_OF_TILE                                                     ;
	STA IRQ_1_XSCROLL                                            ;
	LDA IRQ_1_NAMETABLE                                          ; 
	SBC #$00                                                     ;
	AND #$01                                                     ;
	STA IRQ_1_NAMETABLE                                          ;
	LDX MENU_X                                                   ; IS CURRENT SCROLL LOCATION = ROSTER PAGE FINAL SCROLL LOCATION
	LDA ROSTER_PAGE_SCROLL_INFO,X                                              ; 
	CMP IRQ_1_XSCROLL                                             ;
	BNE @scroll_left                                             ; NO-> SCROLL ROSTER PAGE LEFT TIMING LOOP
	JMP @set_to_first_player                                     ; JUMP TO SET ARROW LOCATION TO FIRST PLAYER ON PAGE

@right_dpad_press:                                               ; RIGHT PRESSED WITH ARROW ON PLAYER
	LDA #SPRITE_OFFSCREEN                                               ; SET ARROW SPRITE Y LOCATION = OFFSCREEEN
	STA MENU_ARROW_SPR_Y                                         ;
	INC MENU_X                                                   ; ARROW X INDEX ++
	LDA MENU_X                                                   ;
	CMP #(THIRD_PAGE_ROSTER_DATA +1)                              ; ARROW X INDEX = PAST  LAST ROSTER PAGE?
	BCC @scroll_right                                            ; 
	
@scroll_back_to_first_page	
	LDA #$00                                                     ; SET ARROW X INDEX = FIRST ROSTER PAGE?
	STA MENU_X

@scroll_right:                                                         ; SCROLL ROSTER PAGE RIGHT TIMING LOOP
	RETURN_1_FRAME  
	LDA IRQ_1_XSCROLL                                                    ; = BOTTOM SPLIT SCREEN XSCROLL LOCATION + 8 PIXELS
	CLC                                                          ;
	ADC #SIZE_OF_TILE                                                     ;
	STA IRQ_1_XSCROLL                                                    ;
	LDA IRQ_1_NAMETABLE                                                    ;
	ADC #$00                                                     ;
	AND #$01                                                     ;
	STA IRQ_1_NAMETABLE                                                    ;
	LDX MENU_X                                                   ;
	LDA ROSTER_PAGE_SCROLL_INFO,X                                ; IS CURRENT SCROLL LOCATION = ROSTER PAGE FINAL SCROLL LOCATION
	CMP IRQ_1_XSCROLL                                                    ; 
	BNE @scroll_right                                                  ; NO-> SCROLL ROSTER PAGE RIGHT TIMING LOOP 
	JMP @set_to_first_player                                                 ; JUMP SET ARROW LOCATION TO FIRST PLAYER ON PAGE 

@exit_to_team_data_menu:                                         ; B PRESSED WITH ARROW ON PLAYER
	LDA #$00                                                     ; SET Y MENU INDEX= PLAYER DATA
	STA MENU_Y                                                   ;
	LDA #SPRITE_OFFSCREEN                                               ; SET SECOND ARROW SPRITE Y LOCATION = OFFSCREEN
	STA SECOND_MENU_ARROW_SPR_Y                                  ; 
	JMP INIT_TEAM_DATA_MENU                                     ; RETURN TO TEAM DATA MAIN LOOP
	
@a_pressed_on_player:                                            ; A PRESSED WITH ARROW ON PLAYER
	LDA #$00                                                     ; CLEAR SPLIT SCREEN IRQ COUNTER 
	STA IRQ_0_COUNTER                                             ;
	LDA MENU_Y                                                   ; LOAD Y MENU OPTION  
	LDX MENU_X                                                   ; LOAD X MENU OPTION  
	BEQ @draw_player_attributes                                  ; ON FIRST ROSTER PAGE? YES->ON FIRST PAGE OF PLAYER DATA
	CPX #$01                                                     ; ON SECOND ROSTER PAGE? 
	BNE @add_offset_to_defenders                                 ; NO->ON LAST PAGE OF PLAYER DATA
	
@check_if_on_kicker_or_punter	
	CMP #$06                                                     ; ARE WE ON KICKER/PUNTER IN SECOND ROSTER PAGE?
	BCS @add_offset_to_kicker_punter                             ; YES->ADD ROSTER OFFSET FOR KICKER/PUNTER
	
@add_offset_offensive_lineman	
	CLC                                                          ;
	ADC #TE2_ROSTER_ID                                           ;
	JMP @draw_player_attributes                                  ; JUMP-> DRAW PLAYER ATTRBIUTES(A= PLAYER ROSTER INDEX)

@add_offset_to_kicker_punter:                                    ; ADD ROSTER OFFSET FOR KICKER/PUNTER
	CLC                                                          ;
	ADC #(KICKER_ROSTER_ID - PLAYER_DATA_MENU_OFFSET_TO_KICKER)  ; OFFSET TO KICKER/PUNTER - MENU INDEX 
	JMP @draw_player_attributes                                  ; JUMP-> DRAW PLAYER ATTRBIUTES(A= PLAYER ROSTER INDEX)

@add_offset_to_defenders:                                        ; ON LAST PAGE OF PLAYER DATA 
	CLC                                                          ; 
	ADC #RE_ROSTER_ID                                            ; = MENU INDEX + OFFSET TO DEFENDERS


	
@draw_player_attributes:                                         ; DRAW PLAYER ATTRBIUTES(A= PLAYER ROSTER INDEX)
	STA player_roster_id                                         ; SAVE PLAYER ROSTER ID
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_PLAYER_ATTRIBUTES_BANK, BANK_JUMP_DRAW_PLAYER_DATA_SCREEN ; *** can use actual addr
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	JSR DRAW_TEAM_SCREEN_AND_LARGE_HELMET                        ; DRAW TEAM DATA BACKGROUND, WINS/LOSSES, HELMET, SET SPLIT SCREEN()

COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] ROSTER_ARROW_SPR_INFO, SECOND_MENU_ARROW_SPR_Y, $04
	
	JMP @init_roster_menu_options                                ; JUMP-> INITILIAZE PLAYER SELECTION ARROW
	
_F}_PLAYER_DATA_SCREEN

_F{_OFFENSIVE_STARTERS_SCREEN 									 ; DONE

OFFENSIVE_STARTERS_MENU_CHOICE	= $01 

OFFENSIVE_STARTERS_SCREEN:                                       ; OFFENSIVE STARTERS
	LDA #$00                                                     ; SET CURRENT TEAM = P1
	STA TEAM_ON_OFFENSE                                          ;
	LDA #$00                                                     ; SET SCREEN = OFFENSIVE STARTER
	JSR DO_OFFENSIVE_STARTERS                                    ; DRAW OFFENSIVE STARTERS(A= SCREEN COMING FROM)
	JSR SAVE_TEMP_P1_P2_TEAM_INFO_TO_SEASON                         ; TRANSFER SEASON PLAYBOOK, STARTERS, INJ, COND FROM IN GAME SRAM -> SEASON SRAM()
	LDA #OFFENSIVE_STARTERS_MENU_CHOICE                          ; SET Y MENU OPTION = OFFENSIVE STARTERS
	STA MENU_Y                                                   ;
	LDA #$00                                                     ;
	STA MENU_X                                                   ;
	JMP DRAW_TEAM_DATA_SCREEN_AND_DO_INPUT                                   ; JUMP -> DRAW TEAM DATA SCREEN

_F}_OFFENSIVE_STARTERS_SCREEN 

_F{_DEFENSIVE_STARTERS_SCREEN 									 ; DONE
	
DEFENSIVE_STARTERS_SCREEN:                                       ; DEFENSIVE STARTERS 
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_DEFENSIVE_STARTERS_BANK, BANK_JUMP_DRAW_DEFENSIVE_STARTERS_SCREEN ; *** can use actual addr 
	JMP DRAW_TEAM_DATA_SCREEN_AND_DO_INPUT                                   ; JUMP -> DRAW TEAM DATA SCREEN

_F}_DEFENSIVE_STARTERS_SCREEN

_F{_CHANGE_PLAYBOOK_SCREEN										 ; DONE

CHANGE_PLAYBOOK_MENU_CHOICE	= $03 
	
CHANGE_PLAYBOOK_SCREEN:                                          ; PLAYBOOK
	JSR SET_TEAM_PLAYBOOK                                        ; SET PLAYBOOK()
	JSR SAVE_TEMP_P1_P2_TEAM_INFO_TO_SEASON                         ; TRANSFER SEASON PLAYBOOK, STARTERS, INJ, COND FROM IN GAME SRAM -> SEASON SRAM()
	LDA #CHANGE_PLAYBOOK_MENU_CHOICE                             ; SET Y MENU OPTION = PLAYBOOK
	STA MENU_Y                                                   ;
	LDA #$00                                                     ;
	STA MENU_X                                                   ;
	JMP DRAW_TEAM_DATA_SCREEN_AND_DO_INPUT                                   ; JUMP -> DRAW TEAM DATA SCREEN
	
_F}_CHANGE_PLAYBOOK_SCREEN

_F{_PROBOWL_TEAM_DATA_SCREEN									 ; DONE

PRO_BOWL_TEAM_DATA_START:                                        ; PRO-BOWL TEAM DATA MENU
	LDA #$00                                                     ; SET POSSESSION = P1 
	STA POSSESSION_STATUS                                        ;
	SET_GAME_STATUS_PRO_BOWL_MODE[]                              ; 
	LDA MENU_Y                                                   ; LOAD MENU CHOICE
	CLC                                                          ;
	ADC #AFC_TEAM_ID                                             ; += OFFSET TO PRO-BOWL TEAMS
	STA CURRENT_TEAM                                             ; SET CURRENT TEAM
	STA P1_TEAM                                                  ; SET P1 TEAM
	JSR TRANSFER_SEASON_PRO_BOWL_INFO_TO_TEMP                    ; TRANSFER SEASON PRO BOWL STARTERS AND PLAYBOOK TO IN GAME PRO BOWL STARTERS AND PLAYBOOK
	LDA #$00                                                     ; 
	STA MENU_Y                                                   ; SET Y MENU CHOICE = FIRST CHOICE
	STA MENU_X                                                   ; SET X MENU CHOICE = FIRST CHOICE

DRAW_PROBOWL_TEAM_DATA_SCREEN:                                  ; DRAW PRO BOWL TEAM DATA SCREEN
	JSR DO_PRO_BOWL_TEAM_DATA                                    ; DO PRO BOWL TEAM DATA SCREEN()

INIT_PRO_BOWL_MENU_OPTIONS:                                      ; LOAD PRO BOWL MENU OPTIONS
	LDY #<PRO_BOWL_TEAM_DATA_MENU_OPTIONS_DATA                              ;
	LDX #>PRO_BOWL_TEAM_DATA_MENU_OPTIONS_DATA                              ;
	LDA #BOTH_JOYPADS                                            ; SET JOY = BOTH
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)

@probowl_meanu_input_check:                                      ; PRO BOWL TEAM DATA INPUT CHECK
	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; “B” PRESSED?
	BVC @check_for_a_press                                       ; NO-> CHECK FOR A
	JMP PRO_BOWL_TEAM_DATA_EXIT                                  ; YES-> PRO BOWL TEAM DATA EXIT

@check_for_a_press:                                              ; CHECK FOR A PRESSED
	BPL @probowl_meanu_input_check                               ; A PRESSED? NO-> PRO BOWL TEAM DATA INPUT CHECK
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MENU ARROW MAP() A= RET
	PUSH_TABLE_ADDR[tableAddr] PRO_BOWL_MENU_COMMAND_TABLE		 ;	

	

PRO_BOWL_MENU_COMMAND_TABLE:                                     ; PRO BOWL TEAM DATA MENU COMMAND ADDRESSES 
	.WORD PRO_BOWL_PLAYER_DATA -1                                ; PRO-BOWL PLAYER DATA -1
	.WORD PRO_BOWL_OFFENSIVE_STARTERS -1                         ; DRAW PRO BOWL OFF STARTERS  -1
	.WORD PRO_BOWL_CHANGE_PLAYERS-1                              ; PRO BOWL CHANGE PLAYERS-1
	.WORD DRAW_PRO_BOWL_DEFENSIVE_STARTERS-1                     ; DRAW PRO BOWL DEF STARTERS  -1
	.WORD RESET_PRO_BOWL_STARTERS-1                              ; RESET PRO BOWL STARTERS  -1
	.WORD PRO_BOWL_PLAYBOOK_CHANGE-1                             ; PRO BOWL PLAY BOOKS -1
	
_F}_PROBOWL_TEAM_DATA_SCREEN 

_F{_PROBOWL_PLAYER_DATA_SCREEN								     ; DONE


pro_bowl_roster_id = LOCAL_6  

PRO_BOWL_PLAYER_DATA:                                            ; PRO-BOWL PLAYER DATA
    
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] PRO_BOWL_PLAYER_DATA_LEFTOVER_ARROW, SECOND_MENU_ARROW_SPR_INFO, $04
	JSR DO_PRO_BOWL_PLAYER_SELECT                                ; DO PRO BOWL PLAYER SELECT()
	BCS @exit_pro_bowl_player_selection                          ; B PRESSED?-> EXIT PRO BOWL INDIVIDUAL PLAYER DATA SCREEN
	
@draw_pro_bowl_player_data	
	LDA CURRENT_TEAM                                             ; SAVE CURRENT TEAM
	STA TEMP_CURRENT_TEAM                                        ;
	JSR CONVERT_ARROW_TO_PB_PLAYER_OFFSET                        ; GET OFFSET TO PRO BOWL PLAYER INFO($E1,$E2=ARROW LOCATION) RET = X
	LDA PRO_BOWL_PLAYER_INFO,X                                   ; SET PRO-BOWL PLAYER TEAM FROM SRAM PRO-BOWL PLAYER INFO
	STA CURRENT_TEAM                                             ;
	LDA PRO_BOWL_PLAYER_INFO+1,X                                 ; LOAD PRO-BOWL ROSTER ID FROM SRAM PRO-BOWL PLAYER INFO
	STA pro_bowl_roster_id                                       ;
	
@bank_swap_and_draw_attributes	
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_PLAYER_ATTRIBUTES_BANK, BANK_JUMP_DRAW_PLAYER_DATA_SCREEN ; *** can use actual addr
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	
	LDA TEMP_CURRENT_TEAM                                        ; RESTORE CURRENT TEAM
	STA CURRENT_TEAM                                             ;
	JSR DO_PRO_BOWL_TEAM_DATA                                    ; DO PRO BOWL TEAM DATA SCREEN()
	JMP PRO_BOWL_PLAYER_DATA                                     ; JUMP->PRO-BOWL PLAYER DATA
	
@exit_pro_bowl_player_selection:                                 ; EXIT PRO BOWL INDIVIDUAL PLAYER DATA SCREEN 
	LDA #$00                                                     ;
	STA MENU_Y                                                   ; SET Y MENU CHOICE = FIRST CHOICE
	STA MENU_X                                                   ; SET X MENU CHOICE = FIRST CHOICE
	LDA #SPRITE_OFFSCREEN                                               ; SET PRO BOWL PLAYER DATA ARROW = OFFSCREEN
	STA SECOND_MENU_ARROW_SPR_Y                                     ;
	JMP INIT_PRO_BOWL_MENU_OPTIONS                               ; JUMP-> LOAD PRO BOWL MENU OPTIONS
	
_F}_PROBOWL_PLAYER_DATA_SCREEN 

_F{_PROBOWL_OFFENSIVE_STARTERS_SCREEN 							 ; DONE

PRO_BOWL_OFFENSIVE_STARTERS:                                     ; DRAW PRO BOWL OFFENSIVE STARTERS()
	JSR TRANSFER_SEASON_PRO_BOWL_INFO_TO_TEMP                    ; TRANSFER SEASON PRO BOWL STARTERS AND PLAYBOOK TO IN GAME PRO BOWL STARTERS AND PLAYBOOK
	LDA #$00                                                     ;
	STA TEAM_ON_OFFENSE                                          ;
	LDA #$00                                                     ; SET COMING FROM TEAM DATA SCREEN
	JSR DO_OFFENSIVE_STARTERS                                    ; DRAW OFFENSIVE STARTERS(A= SCREEN COMING FROM)
	LDA #$00                                                     ; SET Y MENU CHOICE = FIRST CHOICE
	STA MENU_Y                                                   ;
	LDA #$01                                                     ; SET X MENU CHOICE = SECOND CHOICE
	STA MENU_X                                                   ;
	JMP DRAW_PROBOWL_TEAM_DATA_SCREEN                            ; JUMP-> DRAW PRO BOWL TEAM DATA SCREEN

_F}_PROBOWL_OFFENSIVE_STARTERS_SCREEN 
	
_F{_RESET_PRO_BOWL_STARTERS							             ; DONE 
	
data_addr	= LOCAL_1 

num_tiles 	= LOCAL_1  
rows		= LOCAL_2 	
	
RESET_PRO_BOWL_STARTERS:                                         ; RESET PRO BOWL OFFENSIVE STARTERS()
	LDA #<PRO_BOWL_RESET_WORDS_DATA                              ; SET RESET WORDS ADDR
	STA data_addr                                                ;
	LDA #>PRO_BOWL_RESET_WORDS_DATA                              ;
	STA data_addr+1                                              ;
	LDY #<RESET_PRO_BOWL_STARTERS_PPU_ADDR                       ; SET PPU ADDRESS = $20E7 = RESET WORDS LOCATION
	LDX #>RESET_PRO_BOWL_STARTERS_PPU_ADDR                       ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()
	LDA #$00                                                     ; SET Y MENU CHOICE = FIRST CHOICE
	STA MENU_Y                                                   ;
	STA MENU_X                                                   ; SET X MENU CHOICE = FIRST CHOICE
	LDY #<PRO_BOWL_RESET_MENU_OPTIONS_DATA                                  ; SET RESET MENU INFO ADDR
	LDX #>PRO_BOWL_RESET_MENU_OPTIONS_DATA                                  ;
	LDA #BOTH_JOYPADS                                            ; SET JOY = BOTH
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
@pro_bowl_reset_input_check:                                     ; PRO BOWL RESET INPUT CHECK
	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; B PRESSED?
	BVS @exit_reset_pb_starters                                   ; YES-> EXIT RESET STARTERS
	BPL @pro_bowl_reset_input_check                              ; A PRESSED? NO-> PRO BOWL RESET INPUT CHECK
	LDA MENU_X                                                   ; IS CHOICE = YES?
	BEQ @exit_reset_pb_starters                                  ; NO-> EXIT RESET STARTERS
	LDA CURRENT_TEAM                                             ; IS CURRENT TEAM = NFC PRO BOWL?
	CMP #NFC_TEAM_ID                                             ;
	BCS @reset_nfc_starters                                      ; YES-> RESET NFC STARTERS
	
@reset_afc_starters:  											 ; RESET AFC STARTERS
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_DEFAULT_PLAYBOOK_STARTERS_BANK , BANK_JUMP_RESET_AFC_STARTERS ; *** can use actual
	JMP @return_pro_bowl_team_data
	
@reset_nfc_starters:                                             ; RESET NFC STARTERS
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_DEFAULT_PLAYBOOK_STARTERS_BANK , BANK_JUMP_RESET_NFC_STARTERS			; *** can use actual
	
@return_pro_bowl_team_data:                                      ; RETURN FROM RESET STARTERS
	LDA #$00                                                     ; SET X MENU CHOICE = FIRST CHOICE
	STA MENU_X
	JMP DRAW_PROBOWL_TEAM_DATA_SCREEN                            ; JUMP-> DRAW PRO BOWL TEAM DATA SCREEN



@exit_reset_pb_starters:                                         ; EXIT RESET STARTERS
	LDY #<RESET_PRO_BOWL_STARTERS_PPU_ADDR                       ; SET PPU ADDR = $20E7 = RESET MENU
	LDX #>RESET_PRO_BOWL_STARTERS_PPU_ADDR
	LDA #$01                                                     ; SET ROWS = 1 
	STA rows                                                     ;
	LDA #$08                                                     ; SET LENGTH =8
	STA num_tiles                                                ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	JMP INIT_PRO_BOWL_MENU_OPTIONS                               ; JUMP-> LOAD PRO BOWL MENU OPTIONS
	
_F}_RESET_PRO_BOWL_STARTERS

_F{_PROBOWL_DEFENSIVE_STARTERS_SCREEN							  ; DONE 
 
DRAW_PRO_BOWL_DEFENSIVE_STARTERS:                                ; DRAW PRO BOWL DEFENSIVE STARTERS()
	JSR TRANSFER_SEASON_PRO_BOWL_INFO_TO_TEMP                    ; TRANSFER SEASON PRO BOWL STARTERS AND PLAYBOOK TO IN GAME PRO BOWL STARTERS AND PLAYBOOK
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_DEFENSIVE_STARTERS_BANK, BANK_JUMP_DRAW_DEFENSIVE_STARTERS_SCREEN ; *** can use actual
	JMP DRAW_PROBOWL_TEAM_DATA_SCREEN                            ; JUMP-> DRAW PRO BOWL TEAM DATA SCREEN

_F}_PROBOWL_DEFENSIVE_STARTERS_SCREEN

_F{_PROBOWL_PLAYER_CHANGE_SCREEN                                 ; DONE 

ppu_addr			      					= LOCAL_1	
num_tiles 	         						= LOCAL_1
rows 		            					= LOCAL_2
player_roster_id 	  		 				= LOCAL_6

probowl_change_player_roster_id             = SEGMENT_VAR_9E
probowl_change_player_num_players_at_pos    = SEGMENT_VAR_9F
current_pro_bowl_sub_team                   = SEGMENT_VAR_A0

pro_bowl_sub_roster_and_team_ids[]          = SEGMENT_VAR_A6         ; max of 4 slots for certain positions


NUM_TILES_PER_ROW_PRO_BOWL_MENU				= $20
NUM_ROWS_PRO_BOWL_MENU						= $06
FIRST_TEAM_IN_CONFERENCE_INDEX				= $00 
LAST_TEAM_IN_CONFERENCE_INDEX				= NUMBER_OF_TEAMS_IN_EACH_CONFERENCE - 1 


	
PRO_BOWL_CHANGE_PLAYERS:                                         ; PRO BOWL CHANGE PLAYERS()
	LDA #$00                                                     ; SET Y MENU CHOICE = FIRST PLAYER    
	STA MENU_Y                                                   ;
	STA current_pro_bowl_sub_team                               ; SET SUB TEAM = FIRST TEAM

	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] PRO_BOWL_CHANGE_PLAYERS_ARROW_SPR_TABLE, SECOND_MENU_ARROW_SPR_INFO, $04


@do_pro_bowl_player_select:                                      ; PRO BOWL PLAYER SELECT START
	JSR DO_PRO_BOWL_PLAYER_SELECT                                ; DO PRO BOWL PLAYER SELECT()
	BCC @pro_bowl_player_selected                                ; “A” PRESSED -> PRO BOWL PLAYER SLECTED
	JMP @exit_pro_bowl_change_players                            ; JMP-> RETURN FROM PROBOWL PLAYER SELECT TO MAIN MENU
	
@pro_bowl_player_selected:                                       ; PRO BOWL PLAYER SLECTED
	LDA MENU_Y                                                   ; SAVE ARROW LOCATION 
	STA SECOND_MENU_Y                                            ;
	LDA MENU_X                                                   ;
	STA SECOND_MENU_X                                            ;

	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] MENU_ARROW_SPR_INFO, SECOND_MENU_ARROW_SPR_INFO, $04


	
@clear_pro_bowl_menu
	LDY #<PRO_BOWL_MENU_OPTIONS_PPU_ADDR                         ; SET LOCATION = PRO BOWL MENU CHOICES 
	LDX #>PRO_BOWL_MENU_OPTIONS_PPU_ADDR                         ;
	LDA #NUM_ROWS_PRO_BOWL_MENU                                  ; SET NUM ROWS = 6
	STA rows                                                     ;
	LDA #NUM_TILES_PER_ROW_PRO_BOWL_MENU                         ; SET LENGTH = FULL SCREEN = 32 
	STA num_tiles                                                ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	


@draw_pro_bowl_sub_menu
	JSR CONVERT_ARROW_TO_PB_PLAYER_OFFSET                        ; GET OFFSET TO PRO BOWL PLAYER INFO($E1,$E2=ARROW LOCATION) RET = X
	STY player_roster_id                                         ; SAVE PLAYER ROSTER ID 
	LDA #<PRO_BOWL_PLAYER_POS_PPU_ADDR                           ; SET PPU LOCATION = $2058
	STA ppu_addr                                                 ;
	LDA #>PRO_BOWL_PLAYER_POS_PPU_ADDR                           ;
	STA ppu_addr +1                                              ;
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_PRO_BOWL_POSITION_BANK, BANK_JUMP_DRAW_DRAW_PLAYER_POSITION_ABBREV_PRO_BOWL; *** use actual addr
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MENU ARROW MAP() A= RET
	ASL                                                          ;
	TAX                                                          ;
	LDA PRO_BOWL_SUB_INFO_TABLE,X                                ; LOAD POSITION STARTING ROSTER ID FROM PROBOWL SUB INFO
	STA probowl_change_player_roster_id                          ;
	LDA PRO_BOWL_SUB_INFO_TABLE+1,X                               ; LOAD NUMBER OF PLAYERS AT POS FROM PROBOWL SUB INFO
	STA probowl_change_player_num_players_at_pos

@draw_pro_bowl_subs_start:                                       ; DRAW PRO BOWL POSSIBLE SUBS START
	JSR DRAW_PRO_BOWL_SUBS_FOR_CURRENT_TEAM                      ; DRAW PRO-BOWL PLAYER TEAM SUBS() 
	LDA SPR_INDEX_TEMP                                           ; ARE ALL PLAYERS ON TEAM SELECTED? eaxh X mark increments index
	LSR                                                          ; divive by 4 
	LSR                                                          ;
	CMP probowl_change_player_num_players_at_pos                 ;
	BCS @set_arrow_offscreen                                     ; YES-> SET ARROW TO OFFSCREEN

	LDX #$FE                                                     ;
@check_if_player_selected_for_menu_y:                            ; SET ARROW LOCATION LOOP
	INX                                                          ; SET INDEX  = NEXT POSSIBLE SUB
	INX                                                          ;
	LDA pro_bowl_sub_roster_and_team_ids[]+1,X                     ; CHECK IF SUB IS ALREADY SELECTED
	BMI @check_if_player_selected_for_menu_y                     ; YES-> SET ARROW LOCATION LOOP

@save_menu_y
	TXA                                                          ; SUB INDEX / 2
	LSR                                                          ; 
	STA MENU_Y                                                   ; SET MENU Y = SUB INDEX


	LDA probowl_change_player_num_players_at_pos                  ; NUMBER OF PLAYERS
	ASL                                                          ; SET INDEX INTO TABLE
	TAX                                                          ;
	LDY PROBOWL_MENU_INFO_PTR_TABLE-2,X                          ; SET CHOICES FROM PRO BOWL CHANGE PLAYER CHOICES
	LDA PROBOWL_MENU_INFO_PTR_TABLE-1,X                          ;
	TAX                                                          ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX= BOTH
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)

_WHILE PLUS                                                      ; CHECK FOR PLAYER CHANGE INPUT LOOP

	RETURN_1_FRAME  
@arrow_up_down_loop:                                              ; MOVE SUB ARROW UP OR DOWN INPUT LOOP
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	LDA MENU_Y                                                   ;
	ASL                                                          ;
	TAX                                                          ;
	LDA pro_bowl_sub_roster_and_team_ids[]+1,X                     ; LOAD ROSTER ID
	BMI @arrow_up_down_loop                                      ; PLAYER ALREADY SELECTED? YES->MOVE SUB ARROW UP OR DOWN INPUT LOOP	
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	JSR @check_left_right_or_b								     ; CHECK FOR LEFT/RIGHT SUBS TEAM CHANGE()
	BCS @draw_pro_bowl_subs_start                                 ; TEAM CHANGED? YES-> DRAW PRO BOWL POSSIBLE SUBS START
	LDA JOY_PRESS_BOTH                                           ; IS JOY PRESS = “A”

_END_WHILE                                                       ; NO-> CHECK FOR PLAYER CHANGE INPUT LOOP


	MMC3_SRAM_WRITE_ENABLE
	LDA SECOND_MENU_Y                                              ; RESTORE PREVIOUS PLAYER ARROW LOCATION
	LDX SECOND_MENU_X                                              ;
	JSR CHECK_FOR_ARROW_ON_PB_DEFENDER_OR_SPECIAL_TEAMS                                                ;
	LDA MENU_Y                                                   ; LOAD PLAYER CHOICE
	ASL                                                          ;
	TAY                                                          ;
	LDA pro_bowl_sub_roster_and_team_ids[],Y                     ; SAVE PLAYER TEAM IN SRAM PRO BOWL STARTERS
	STA PRO_BOWL_PLAYER_INFO,X
	LDA pro_bowl_sub_roster_and_team_ids[]+1,Y                     ; SAVE ROSTER ID IN SRAM PRO BOWL STARTERS
	STA PRO_BOWL_PLAYER_INFO+1,X                                 ;
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	JSR DRAW_PRO_BOWL_PLAYER_NAMES                               ; DRAW PRO BOWL PLAYER NAMES()
	JMP @draw_pro_bowl_subs_start                                 ;


@set_arrow_offscreen:                                           ; ALL PLAYERS ON TEAM SELECTED SET ARROW TO OFFSCREEN
	LDA #SPRITE_OFFSCREEN                                               ; SET ARROW Y = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ; 

_WHILE CC
 
	RETURN_1_FRAME  
	JSR @check_left_right_or_b:                                  ;

_END_WHILE	
	JMP @draw_pro_bowl_subs_start                                 ; JUMP-> DRAW PRO BOWL POSSIBLE SUBS START

@check_left_right_or_b:                                          ; CHECK FOR LEFT/RIGHT SUBS TEAM CHANGE()
	BIT  JOY_PRESS_BOTH                                          ; IS “B” PRESSED?
	BVS @return_to_pb_change_player_selection                    ; YES-> RETURN TO PRO BOWL PLAYER CHANGE PLAYER SELECTION
	LDA  JOY_PRESS_BOTH                                          ; IS RIGHT PRESSED?
	
@check_for_right:	
	LSR                                                          ;
	BCS @right_pressed_increas_sub_team_id                       ; YES-> RIGHT PRESSED
	
@check_for_left:	
	LSR                                                          ; IS LEFT PRESSED?
	BCC @neither_left_right_pressed                              ; NO->TEAM NOT CHANGED
	
@left_pressed_decrease_sub_team_id:	
	DEC current_pro_bowl_sub_team                                ; CURRENT SUBS TEAM--
	BPL @left_pressed_return                                     ; IS CURRENT SUBS TEAM < FIRST TEAM IN CONFERENCE
	LDA #LAST_TEAM_IN_CONFERENCE_INDEX                           ; SET CURRENT SUBS TEAM = LAST TEAM IN CONFERENCE
	STA current_pro_bowl_sub_team                                ;
	
@left_pressed_return:                                            ; LEFT PRESSED RETURN
	SEC                                                          ; SEC TO INDICATE TEAM CHANGE
	RTS                                                          ; RETURN

@right_pressed_increas_sub_team_id:                              ; RIGHT PRESSED
	INC current_pro_bowl_sub_team                                ; CURRENT SUBS TEAM ++
	LDA current_pro_bowl_sub_team                                ;
	CMP #LAST_TEAM_IN_CONFERENCE_INDEX +1                        ; IS CURRENT SUBS TEAM > LAST TEAM IN CONFERENCE
	BCC @pro_bowl_sub_team_changed                               ; NO-> PRO BOWL SUB TEAM CHANGED

@set_to_first_team_in_conference:	
	LDA #FIRST_TEAM_IN_CONFERENCE_INDEX                          ; SET CURRENT SUBS TEAM = FIRST TEAM IN CONFERENCE
	STA current_pro_bowl_sub_team                                ;

@pro_bowl_sub_team_changed:                                      ; PRO BOWL SUB TEAM CHANGED
	SEC                                                          ; SEC TO INDICATE TEAM CHANGE

@neither_left_right_pressed:                                     ; TEAM NOT CHANGED
	RTS                                                          ; RETURN


@return_to_pb_change_player_selection:                           ; RETURN TO PRO BOWL PLAYER CHANGE PLAYER SELECTION
	PLA                                                          ; REMOVE RETURN ADDRESS
	PLA                                                          ;
	LDA #SPRITE_OFFSCREEN                                               ; SET PLAYER SELECTION ARROW = OFFSCREEN
	STA SECOND_MENU_ARROW_SPR_Y                                  ;
	LDA SECOND_MENU_Y                                            ; 
	STA MENU_Y                                                   ; RESTORE MENU Y
	LDA SECOND_MENU_X                                            ;
	STA MENU_X                                                   ; RESTORE MENU X
	JMP @do_pro_bowl_player_select                               ; JUMP->PRO BOWL PLAYER SELECT START

@exit_pro_bowl_change_players:                                   ; RETURN FROM PROBOWL PLAYER SELECT TO PRO BOWL MENU
	LDA #SPRITE_OFFSCREEN                                               ; SET PLAYER SELECTION ARROW = OFFSCREEN
	STA SECOND_MENU_ARROW_SPR_Y                                  ;
	
@set_x_sprites_offscreen:
 	
SET_RAM_Y_INDEX[start_length_value] PRO_BOWL_X_MARKER_SPR_INFO[], $10, SPRITE_OFFSCREEN  	

@swt_previous_menu_choice: 		
	LDA #$01                                                     ; SET MENU CHOICE = CHANGE PLAYERS
	STA MENU_Y                                                   ;
	LDA #$00                                                     ;
	STA MENU_X                                                   ;
	LDA #PRO_BOWL_HEADER_SCREEN_ID                               ; SET BG SCREEN ID  = PRO BOWL HEADER
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	JMP INIT_PRO_BOWL_MENU_OPTIONS

_F}_PROBOWL_PLAYER_CHANGE_SCREEN 
	
_F{_PROBOWL_PLAYBOOK_SCREEN										 ; DONE

PRO_BOWL_MENU_PLAYBOOK_CHOICE_Y		= $02
PRO_BOWL_MENU_PLAYBOOK_CHOICE_X		= $01
	
PRO_BOWL_PLAYBOOK_CHANGE:                                        ; PRO BOWL PLAYBOOK CHANGE
	JSR SET_TEAM_PLAYBOOK                                        ; SET PLAYBOOK()
	MMC3_SRAM_WRITE_ENABLE
	LDA CURRENT_TEAM                                             ; IS PRO-BOWL TEAM = NFC
	CMP #NFC_TEAM_ID                                             ;
	BCS @nfc_playbook_change                                     ; YES->NFC PRO BOWL PLAYBOOK CHANGE
	
	COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] P1_PLAYBOOK_EDIT, SRAM_AFC_PLAYBOOK, 8
	COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] P2_PLAYBOOK_EDIT, SRAM_NFC_PLAYBOOK, 8
	JMP @calculate_checksum_and_return
	
	
@nfc_playbook_change: 
	COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] P2_PLAYBOOK_EDIT, SRAM_AFC_PLAYBOOK, 8
	COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] P1_PLAYBOOK_EDIT, SRAM_NFC_PLAYBOOK, 8 
	
@calculate_checksum_and_return:                                 ; CALCULATE CHECKSUM AND RETURN TO PRO-BOWL MENU
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	LDA #PRO_BOWL_MENU_PLAYBOOK_CHOICE_Y                         ; SET MENU CHOICE = PRO BOWL PLAYBOOK
	STA MENU_Y                                                   ;
	LDA #PRO_BOWL_MENU_PLAYBOOK_CHOICE_X                         ;
	STA MENU_X                                                   ;
	JMP DRAW_PROBOWL_TEAM_DATA_SCREEN                            ; JUMP-> DRAW PRO BOWL TEAM DATA SCREEN

PRO_BOWL_TEAM_DATA_EXIT:                                         ; PRO BOWL TEAM DATA EXIT
	LDA PREV_MENU_Y                                              ; RESTORE PREVIOUS MINI HELMET CHOICE 
	STA MENU_Y                                                   ;
	LDA PREV_MENU_X                                              ;
	STA MENU_X                                                   ;
	LDA #$00                                                     ; SET IRQ 0 COUNTER =0 
	STA IRQ_0_COUNTER                                            ;
	STA MENU_X                                                   ; SET MINI HELMET X CHOICE = 0 
	SET_GAME_STATUS_PRE_SEASON_MODE[]
	JMP DRAW_MINI_HELMETS_INIT_MENU                              ; JUMP->DRAW MINI HELMETS TEAM DATA

_F}_PROBOWL_PLAYBOOK_SCREEN 

_F{_FADE_OUT_AND_RETURN 										 ; DONE

FADE_OUT_AND_RETURN:                                             ; RETURN TO MAIN MENU FROM TEAM DATA MINI HELMET
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	RTS                                                          ; RETURN
	
_F}_FADE_OUT_AND_RETURN 
	
_F{_DRAW_PROBOWL_POSSIBLE_SUBS_BACKGROUND 						 ; DONE EXCEPT CHR BANK

DO_PRO_BOWL_TEAM_DATA:                                           ; DO PRO BOWL TEAM DATA SCREEN()     
	LDA CURRENT_TEAM                                             ; SET P1 TEAM ID = CURRENT TEAM ID
	STA P1_TEAM                                                  ; 
	LDA #PRO_BOWL_TEAM_DATA_SCREEN_ID                            ; SET EVENT ID = PRO BOWL TEAM SCREEN
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	JSR DRAW_PRO_BOWL_PLAYER_NAMES                               ; DRAW PRO BOWL PLAYER NAMES()
	LDA #$0F                                                     ;
	STA SOFT_CHR_1000_BANK                                       ;
	LDA #PRO_BOWL_TEAM_DATA_BG_PAL_INDEX                         ; SET BG PAL INDEX
	LDX #PRO_BOWL_TEAM_DATA_SPR_PAL_INDEX                        ; SET SPR PAL INDEX
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	RTS                                                          ; RETURN

_F}_DRAW_PROBOWL_POSSIBLE_SUBS_BACKGROUND
	
_F{_DO_PROBOWL_PLAYER_TEAM_SCROLL_INPUT							 ; DONE

DO_PRO_BOWL_PLAYER_SELECT:                                      ; DO PRO BOWL PLAYER SELECT()
	LDY #<PRO_BOWL_PLAYER_SELECT                                 ; LOAD PRO BOWL PLAYER SELECT MENU INFO ADDR 
	LDX #>PRO_BOWL_PLAYER_SELECT                                 ;
	LDA #BOTH_JOYPADS                                            ; SET JOY = BOTH
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	
_WHILE PLUS                                                          ; PRO BOWL PLAYER SELECT INPUT CHECK
	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; IS B PRESSED?
	BVS @b_press_exit                                             ; YES-> B PRESSED EXIT
_END_WHILE                                                   ; A PRESSED NO-> PRO BOWL PLAYER SELECT INPUT CHECK
	CLC                                                          ; CLC TO INDICATE “A” PRESSED 
	RTS                                                          ;
	
@b_press_exit:                                                          ; B PRESSED EXIT
	SEC                                                          ; SET CARRY TO INDICATE “B” PRESSED
	RTS                                                          ; RETURN

_F}_DO_PROBOWL_PLAYER_TEAM_SCROLL_INPUT 

_F{_DRAW_PROBOWL_CURRENT_TEAM_PLAYER_CHOICES					 ; DONE

sub_roster_id					= LOCAL_7
sub_team_id					    = LOCAL_8

ppu_addr						= SEGMENT_VAR_90

current_sub_roster_id			= SEGMENT_VAR_92
num_of_subs_left_to_draw		= SEGMENT_VAR_93
sub_array_index					= SEGMENT_VAR_94

saved_roster_id					= SEGMENT_VAR_9E
saved_num_subs_to_draw			= SEGMENT_VAR_9F		

team_and_rosterid_info[]		= SEGMENT_VAR_A6



	
DRAW_PRO_BOWL_SUBS_FOR_CURRENT_TEAM:                            ; DRAW PRO-BOWL PLAYER TEAM SUBS() 
	LDA CURRENT_TEAM                                             ; SAVE CURRENT PRO BOWL TEAM
	STA CURRENT_PRO_BOWL_TEAM                                    ;
	JSR ADD_OFFSET_TO_NFC_TEAMS_IF_NFC_PRO_BOWL_TEAM             ; ADD OFFSET TO PRO BOWL SUB TEAM ID IF PROBOWL TEAM = NFC()
	STA CURRENT_TEAM                                             ; 
	LDA #PRO_BOWL_CHANGE_PLAYER_SCREEN_ID                        ; SET EVENT = PRO BOWL CHANGE PLAYERS HEADER
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	LDA #<PLAYER_ALREADY_SELECTED_X_PPU_ADDR                     ; SET PPU ADDR = $2081= FIRST SUB ALREADY SELECTED “X” SPRITES
	STA ppu_addr                                                 ;
	LDA #>PLAYER_ALREADY_SELECTED_X_PPU_ADDR                     ;
	STA ppu_addr+1                                               ;
	LDA #$00                                                     ; SET SPRITE INDEX OFFSET =0  
	STA SPR_INDEX_TEMP                                           ;
																 ; CLEAR IS PLAYER ALREADY SELECTED “X” SPRITES
																 
SET_RAM_Y_INDEX[start_length_value] PRO_BOWL_X_MARKER_SPR_INFO[], $10, SPRITE_OFFSCREEN 	


	LDA saved_roster_id	                                         ; SAVE SUBS TEAM ID
	STA current_sub_roster_id                                    ;
	LDA saved_num_subs_to_draw                                   ; SAVE # OF SUBS TO DRAW
	STA num_of_subs_left_to_draw                                 ;
	LDA #$00                                                     ;
	STA sub_array_index                                          ;
	
_WHILE NOT_EQUAL                                                 ; DRAW SUBS LOOP

	JSR ADD_OFFSET_TO_NFC_TEAMS_IF_NFC_PRO_BOWL_TEAM             ; ADD OFFSET TO PRO BOWL SUB TEAM ID IF PROBOWL TEAM = NFC()
	
	LDX sub_array_index                                                      ; 
	STA team_and_rosterid_info[],X                               ; LOAD SUB TEAM
	STA sub_team_id	                                             ;
	
	LDA current_sub_roster_id                                    ; LOAD SUB ROSTER ID
	STA team_and_rosterid_info[]+1,X                             ;
	STA sub_roster_id                                            ;
	
	LDY ppu_addr                                                 ; LOAD PPU ADDR
	LDX ppu_addr +1                                              ;
	JSR DRAW_NUMBER_LAST_NAME_11_CHAR                            ; TRANSFER PLAYER NUMBERS AND NAMES TO BUFFER (X,Y= PPU ADDR, $44=PLAYER, $45=TEAM)
	LDY ppu_addr                                                 ; SET PPU ADDR + = 2 TILES OVER
	LDX ppu_addr+1                                               ; 

	INY                                                          ;
	INY                                                          ;
	LDA #$01                                                     ; SET LENGTH = 1
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                        ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDA #$00                                                     ; LOAD BLANK TILE
	STA CURRENT_BG_BUFFER_LOC,X                                  ; 
	INX                                                          ; BUFFER INDEX ++
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                    ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	JSR CHECK_IF_PLAYER_ALREADY_PRO_BOWL_PLAYER                  ; CHECK IF PLAYER ALREADY A PRO BOWL STARTER ($44 = ROSTER ID, $45 = TEAM)
	BCC @go_to_next_sub                                          ; NO->
	
	LDX sub_array_index                                          ; SET SUB = ALREADY A STARTER 
	LDA team_and_rosterid_info[]+1,X                             ;
	ORA #$80                                                     ;
	STA team_and_rosterid_info[]+1,X                             ;
	LDX SPR_INDEX_TEMP                                           ; LOAD SPRITE INDEX 
	
@convert_ppu_addr_to_spr_location	
	LDA ppu_addr                                                 ; SET PPU ADDR = PLAYER ALREADY SELECTED LOC
	SEC                                                          ;
	SBC #<PLAYER_ALREADY_SELECTED_X_PPU_ADDR                     ;
	LSR                                                          ;
	LSR                                                          ;
	CLC                                                          ;
	ADC #>PLAYER_ALREADY_SELECTED_X_PPU_ADDR                     ; SAVE SPRITE Y LOCATION

@set_x_marker_spr_info:	
	STA PRO_BOWL_X_MARKER_SPR_INFO[],X                           ;
	LDA #PLAYER_SELECTED_X_TILE_ID                               ; SET SPRITE TILE = PLAYER ALREADY SELECTED “X”
	STA PRO_BOWL_X_MARKER_SPR_INFO[]+1,X                         ;
	LDA #$00                                                     ; SET SPRITE ATTRIBUTES
	STA PRO_BOWL_X_MARKER_SPR_INFO[]+2,X                         ;
	LDA #$18                                                     ; SET SPRITE X LOCATION
	STA PRO_BOWL_X_MARKER_SPR_INFO[]+3,X                         ;
	TXA                                                          ; SPRITE INDEX OFFSET +=OFFSET TO NEXT SPRITE
	CLC                                                          ;
	ADC #$04                                                     ;
	STA SPR_INDEX_TEMP                                           ;
	
@go_to_next_sub:                                                 ; PLAYER IS NOT A STARTER ALREADY
	LDA ppu_addr                                                 ; SET PPU ADDR = NEXT ROW
	CLC                                                          ; 
	ADC #LENGTH_OF_ONE_ROW                                       ;
	STA ppu_addr                                                 ;
	LDA ppu_addr+1                                               ;
	ADC #$00                                                     ;
	STA ppu_addr+1                                               ;
	INC current_sub_roster_id                                    ; SUB ROSTER ID++
	INC sub_array_index                                          ; SUB ARRAY INDEX += OFFSET TO NEXT PLAYER
	INC sub_array_index                                         ;    
	DEC num_of_subs_left_to_draw                                 ; NUMBER OF SUBS TO DRAW--
_END_WHILE                                                   ; DONE? NO-> DRAW SUBS LOOP
	
	
	
	LDA CURRENT_PRO_BOWL_TEAM                                    ; RESTORE CURRENT TEAM
	STA CURRENT_TEAM                                             ;
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	RTS                                                          ; RETURN
	
_F}_DRAW_PROBOWL_CURRENT_TEAM_PLAYER_CHOICES

_F{_CHECK_IF_PLAYER_ALREADY_PRO_BOWL_PLAYER						 ; DONE
	
OFFSET_TO_NFC_PLAYERS = NFC_PLAYER_INFO - AFC_PLAYER_INFO

roster_id				= LOCAL_7
team_id					= LOCAL_8
	
CHECK_IF_PLAYER_ALREADY_PRO_BOWL_PLAYER:                        ; CHECK IF PLAYER ALREADY A PRO BOWL PLAYER  ($44 = ROSTER ID, $45 = TEAM) 
	LDX #$00                                                     ; SET OFFSET TO AFC PLAYER 
	LDA CURRENT_PRO_BOWL_TEAM                                    ; IS CURRENT TEAM =NFC?
	CMP #NFC_TEAM_ID	                                         ;
	BCC @check_all_players                                       ; NO->SET NUMBER OF PLAYERS = 30
	LDX #OFFSET_TO_NFC_PLAYERS                                   ; SET OFFSET TO NFC PLAYER 

@check_all_players:                                              ; SET NUMBER OF PLAYERS TO CHECK = 30
	LDY #NUMBER_OF_PLAYERS_ON_ROSTER                             ; 
	
_WHILE NOT_EQUAL                                                 ; CHECK PLAYER  LOOP

@check_team: 
	LDA PRO_BOWL_PLAYER_INFO,X                                   ; DOES PLAYER  TEAM = SUB TEAM
	CMP team_id                                                  ;
	BNE @set_to_next_player                                      ; NO-> CHECK NEXT PLAYER  AND CHECK IF DONE
	
@check_roster_id	
	LDA PRO_BOWL_PLAYER_INFO+1,X                                 ; DOES PLAYER ROSTER ID  = SUB ROSTER ID
	CMP roster_id                                                ;
	BEQ @player_already_on_pro_bowl_team                              ; YES->
	
@set_to_next_player:                                             ; SET TO NEXT PLAYER  AND CHECK IF DONE
	INX                                                          ; CURRENT PRO BOWL PLAYER = NEXT PLAYER
	INX                                                          ;
	DEY                                                          ; ALL PLAYER  CHECKED?

_END_WHILE                                                   ; NO-> CHECK PLAYER  LOOP

@player_not_on_pro_bowl_team:	
	CLC                                                          ; CLC = PLAYER IS NOT ON TEAM
	RTS                                                          ;

@player_already_on_pro_bowl_team:                                 ; PLAYER IS ALREADY ON TEAM
	SEC                                                          ; SEC = PLAYER IS A PLAYER 
	RTS                                                          ; RETURN
	
_F}_CHECK_IF_PLAYER_ALREADY_PRO_BOWL_PLAYER
	
_F{_DRAW_PRO_BOWL_PLAYER_NAMES									  ; DONE

roster_id						= LOCAL_7
team_id							= LOCAL_8

offset_to_pro_bowl_players		= SEGMENT_VAR_8E
ppu_addr						= SEGMENT_VAR_90
num_players_left_to_draw		= SEGMENT_VAR_92


DRAW_PRO_BOWL_PLAYER_NAMES:                                      ; DRAW PRO BOWL PLAYER NAMES()
	JSR SET_OFFSET_TO_AFC_NFC_PLAYERS                            ; SET OFFSET TO AFC/NFC PRO BOWL PLAYERS()
	STA offset_to_pro_bowl_players                               ; SAVE OFFSET TO PLAYERS
	
@draw_offensive_names:	
	LDA #<PRO_BOWL_OFF_NAMES_START_PPU_ADDR                      ; SET PPU ADDR= $2164 = OFFENSIVE NAMES START
	STA ppu_addr                                                 ;
	LDA #>PRO_BOWL_OFF_NAMES_START_PPU_ADDR                      ;
	STA ppu_addr+1                                               ;
	LDA #NUMBER_OF_OFFENSIVE_PLAYERS_ON_ROSTER                   ; SET NUMBER OF OFFENSIVE PLAYERS = 17
	JSR DRAW_PRO_BOWL_NAMES                                      ; DRAW PRO BOWL NAMES (X,Y= PPU ADDR, A= NUM PLAYERS)
	
@draw_defensive_names:	
	LDA #<PRO_BOWL_DEF_NAMES_START_PPU_ADDR                       ; SET PPU ADDR= $2190 = DEFENSIVE NAMES START
	STA ppu_addr                                                 ;
	LDA #>PRO_BOWL_DEF_NAMES_START_PPU_ADDR                       ;
	STA ppu_addr+1                                               ;
	LDA #NUMBER_OF_DEFENSIVE_PLAYERS_ON_ROSTER                            ; SET NUMBER OF DEFENSIVE PLAYERS = 11
	JSR DRAW_PRO_BOWL_NAMES                                      ; DRAW PRO BOWL NAMES (X,Y= PPU ADDR, A= NUM PLAYERS)
	
@draw_kicker_name:	
	LDA #<PRO_BOWL_KICKER_NAME_PPU_ADDR                          ; SET PPU ADDR= $2334 = KICKER NAME START
	STA ppu_addr                                                 ;
	LDA #>PRO_BOWL_KICKER_NAME_PPU_ADDR                          ;
	STA ppu_addr+1                                               ;
	JSR DRAW_PRO_BOWL_NAME                                       ; DRAW PRO BOWL NAME (X,Y= PPU ADDR, A= NUM PLAYERS)
	
@draw_punter_name:	
	LDA #<PRO_BOWL_PUNTER_NAME_PPU_ADDR                          ; SET PPU ADDR= $2374 = PUNTER NAME START
	STA ppu_addr                                                 ;
	LDA #>PRO_BOWL_PUNTER_NAME_PPU_ADDR                          ;
	STA ppu_addr+1                                               ;
	JSR DRAW_PRO_BOWL_NAME                                        ; DRAW PRO BOWL NAME (X,Y= PPU ADDR, A= NUM PLAYERS)
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	RTS                                                          ; RETURN

DRAW_PRO_BOWL_NAMES:                                             ; DRAW PRO BOWL NAMES (X,Y= PPU ADDR, A= NUM PLAYERS)
	STA num_players_left_to_draw                                 ; SAVE # PLAYERS TO DRAW
	
_WHILE NOT_EQUAL                                                  ; DRAW PLAYERS LOOP

	JSR DRAW_PRO_BOWL_NAME                                       ; DRAW PRO BOWL NAME (X,Y= PPU ADDR, A= NUM PLAYERS)
	DEC num_players_left_to_draw                                 ; # PLAYERS TO DRAW--

_END_WHILE                                                       ; DONE? NO-> DRAW PLAYERS LOOP
	
	RTS                                                          ; RETURN

DRAW_PRO_BOWL_NAME:                                              ; DRAW PRO BOWL NAME (X,Y= PPU ADDR, A= NUM PLAYERS)
	LDX offset_to_pro_bowl_players                               ; LOAD OFFSET TO CURRENT PRO-BOWL PLAYER
	
@load_team_id:	
	LDA PRO_BOWL_PLAYER_INFO,X                                   ; LOAD PRO BOWL PLAYER TEAM FROM SRAM PRO BOWL PLAYER INFO
	STA team_id                                                  ;
	
@load_roster_id:	
	LDA PRO_BOWL_PLAYER_INFO+1,X                                 ; LOAD PRO BOWL PLAYER ROSTER ID FROM SRAM PRO BOWL PLAYER INFO
	STA roster_id                                                ;

@load_ppu_addr:	
	LDY ppu_addr                                                 ; LOAD PPU ADDR
	LDX ppu_addr+1                                               ;
	JSR DRAW_LAST_NAME_10_CHAR                                   ; DRAW PLAYER LAST NAME MAX LENGTH 10 CHAR(X,Y= PPU LOCATION,$44=PLAYER, $45=TEAM)
	
@set_to_next_player_and_move_down_one_row:	
	INC offset_to_pro_bowl_players                               ; CURRENT PRO-BOWL PLAYER += OFFSET TO NEXT PLAYER
	INC offset_to_pro_bowl_players                               ;
	LDA ppu_addr                                                 ; CURRENT PPU LOCATION += OFFSET TO NEXT ROW
	CLC                                                          ;
	ADC #LENGTH_OF_ONE_ROW                                       ;
	STA ppu_addr                                                 ;
	LDA ppu_addr+1                                               ;
	ADC #$00                                                     ;
	STA ppu_addr+1                                               ;
	RTS                                                          ; RETURN
	
_F}_DRAW_PRO_BOWL_PLAYER_NAMES
	
_F{_TRANSFER_PRO_BOWL_PLAYBOOKS_PLAYERS_TO_IN_GAME				  ; DONE

OFFSET_TO_P1_IN_GAME_PLAYERS 		=  $00
OFFSET_TO_P2_IN_GAME_PLAYERS 		=  P2_GM_PLAYERS - P1_GM_PLAYERS	
	
OFFSET_TO_AFC_PLAYERS 				=  $00	
OFFSET_TO_NFC_PLAYERS 				=  NFC_PLAYER_INFO - AFC_PLAYER_INFO

OFFSET_TO_AFC_STARTERS 				= $00 
OFFSET_TO_NFC_STARTERS 				= SRAM_NFC_STARTERS - SRAM_AFC_STARTERS

offset_to_starters					= LOCAL_5
offset_to_players					= LOCAL_6
current_starter_id					= LOCAL_7
num_players_left    				= LOCAL_8

NUM_STARTERS						= PR_STARTER_ID - QB_STARTER_ID + 1
	
TRANSFER_SEASON_PRO_BOWL_INFO_TO_TEMP:                           ; TRANSFER SEASON PRO BOWL STARTERS AND PLAYBOOK TO IN GAME PRO BOWL STARTERS AND PLAYBOOK
	MMC3_SRAM_WRITE_ENABLE    
	LDA P1_TEAM                                                  ; IS P1 PRO BOWL TEAM = NFC  
	CMP #NFC_TEAM_ID                                             ; 
	BCS @nfc_is_player_one                                       ; YES-> NFC IS PROBOWL TEAM IS PLAYER 1
	
	COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] SRAM_AFC_PLAYBOOK, P1_PLAYBOOK_EDIT, TOTAL_NUM_PLAYS_IN_PLAYBOOK 
    COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] SRAM_NFC_PLAYBOOK, P2_PLAYBOOK_EDIT, TOTAL_NUM_PLAYS_IN_PLAYBOOK 
	

	LDY #OFFSET_TO_AFC_PLAYERS                                   ; SET OFFSET TO PLAYERS = (AFC)
	LDA #OFFSET_TO_AFC_STARTERS                                  ; SET OFFSET TO STARTERS = (AFC)
	LDX #OFFSET_TO_P1_IN_GAME_PLAYERS                            ; SET OFFSET TO IN GAME PLAYERS = P1
	JSR TRANSFER_PRO_BOWL_PLAYERS_TO_IN_GAME_PLAYERS             ; TRANSFER PRO BOWL PLAYERS TO IN GAME PLAYERS(Y= OFFSET TO PLAYERS, A= OFFSET TO STARTERS, X= OFFSET TO IN GAME PLAYERS)
	LDY #OFFSET_TO_NFC_PLAYERS                                   ; SET OFFSET TO PLAYERS  = (NFC)
	LDA #OFFSET_TO_NFC_STARTERS                                                     ; SET OFFSET TO STARTERS = (NFC)
	LDX #OFFSET_TO_P2_IN_GAME_PLAYERS                            ; SET OFFSET TO IN GAME PLAYERS = P2
	JSR TRANSFER_PRO_BOWL_PLAYERS_TO_IN_GAME_PLAYERS             ; TRANSFER PRO BOWL PLAYERS TO IN GAME PLAYERS(Y= OFFSET TO PLAYERS, A= OFFSET TO STARTERS, X= OFFSET TO IN GAME PLAYERS)
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN

@nfc_is_player_one: 
	
	COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] SRAM_AFC_PLAYBOOK, P2_PLAYBOOK_EDIT, TOTAL_NUM_PLAYS_IN_PLAYBOOK 
	COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] SRAM_NFC_PLAYBOOK, P1_PLAYBOOK_EDIT, TOTAL_NUM_PLAYS_IN_PLAYBOOK 
    
	
	LDY #OFFSET_TO_NFC_PLAYERS                                   ; SET OFFSET TO PLAYERS  = (NFC)
	LDA #OFFSET_TO_NFC_STARTERS                                  ; SET OFFSET TO STARTERS = (NFC)
	LDX #OFFSET_TO_P1_IN_GAME_PLAYERS                            ; SET OFFSET TO IN GAME PLAYERS = P1
	JSR TRANSFER_PRO_BOWL_PLAYERS_TO_IN_GAME_PLAYERS             ; TRANSFER PRO BOWL PLAYERS TO IN GAME PLAYERS(Y= OFFSET TO PLAYERS, A= OFFSET TO STARTERS, X= OFFSET TO IN GAME PLAYERS)
	LDY #OFFSET_TO_AFC_PLAYERS                                   ; SET OFFSET TO PLAYERS = (AFC)
	LDA #OFFSET_TO_AFC_STARTERS                                  ; SET OFFSET TO STARTERS = (AFC)
	LDX #OFFSET_TO_P2_IN_GAME_PLAYERS                            ; SET OFFSET TO IN GAME PLAYERS = P2
	JSR TRANSFER_PRO_BOWL_PLAYERS_TO_IN_GAME_PLAYERS             ; TRANSFER PRO BOWL PLAYERS TO IN GAME PLAYERS(Y= OFFSET TO PLAYERS, A= OFFSET TO STARTERS, X= OFFSET TO IN GAME PLAYERS)
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN 

TRANSFER_PRO_BOWL_PLAYERS_TO_IN_GAME_PLAYERS:                    ; TRANSFER PRO BOWL PLAYERS TO IN GAME PLAYERS(Y= OFFSET TO PLAYERS, A= OFFSET TO STARTERS, X= OFFSET TO IN GAME PLAYERS)
	STY offset_to_players                                        ; SAVE OFFSET TO PLAYERS (AFC OR NFC)
	STA offset_to_starters                                       ; SAVE OFFSET TO STARTERS(AFC OR NFC)
	LDA #$00                                                     ; SET CURRENT STARTER = QB
	STA current_starter_id                                       ;
	LDA #NUM_STARTERS                                            ; SET NUMBER OF PLAYERS TO LOAD = 26
	STA num_players_left                                         ;
	
	
_WHILE NOT_EQUAL                                                 ; LOAD PLAYER ROSTER ID AND TEAM INTO STARTERS LOOP
	
	LDA current_starter_id                                       ; IS CURRENT STARTER = QB,RB,WR,TE
	CMP #C_STARTER_ID                                            ;
	BCC @save_starter                                            ; YES-> LOAD OFFENSIVE STARTER
	
@check_for_kr_pr:	
	CMP #KR_STARTER_ID                                           ; IS CURRENT STARTER = KR,PR
	BCC @load_no_skill_player_offset                             ; NO-> LOAD NON SKILL PLAYER PRO BOWL STARTER ROSTER IDS
	
	SEC                                                          ; 
	SBC #$12                                                     ; SET OFFSET TO KR/PR
	
@save_starter:                                                   ; LOAD OFFENSIVE STARTER
	CLC                                                          ; = STARTER INDEX +
	ADC offset_to_starters                                       ; OFFSET TO STARTERS (AFC OR NFC)
	TAY                                                          ;
	LDA SRAM_PRO_BOWL_STARTERS[],Y                               ; LOAD STARTER ROSTER ID
	JMP @save_info_to_in_game_players
	
@load_no_skill_player_offset:                     				 ; LOAD NON SKILL PLAYER PRO BOWL STARTER ROSTER IDS
	TAY                                                          ;
	LDA PRO_BOWL_PLAYER_OFFSET_TABLE,Y                           ; LOAD OFFSET TO AFC PLAYER
	
@save_info_to_in_game_players:
	CLC                                                          ;
	ADC offset_to_players                                        ; + OFFSET TO PLAYERS (AFC OR NFC)
	TAY                                                          ;
	LDA PRO_BOWL_PLAYER_INFO,Y                                   ; TRANSFER PRO BOWL PLAYER TEAM TO 
	STA GAME_PLAYERS[],X                                         ; PRO BOWL STARTER TEAM
	LDA PRO_BOWL_PLAYER_INFO+1,Y                                 ; 
	STA GAME_PLAYERS[]+1,X                                       ;
	INC current_starter_id                                       ; CURRENT PLAYER++
	INX                                                          ; IN GAME PLAYER = NEXT IN GAME PLAYER
	INX                                                          ;
	DEC num_players_left                                         ; PLAYERS TO LOAD--

_END_WHILE                                                       ;

	RTS                                                          ; RETURN

_F}_TRANSFER_PRO_BOWL_PLAYBOOKS_PLAYERS_TO_IN_GAME 	

_F{_MISC_PRO_BOWL_FUNCTIONS										 ; DONE

OFFSET_TO_AFC_NFC_TEAM_IDS			= SEGMENT_VAR_A0
	
ADD_OFFSET_TO_NFC_TEAMS_IF_NFC_PRO_BOWL_TEAM:                    ; ADD OFFSET TO PRO BOWL SUB TEAM ID IF PROBOWL TEAM = NFC()
	LDA OFFSET_TO_AFC_NFC_TEAM_IDS                               ; LOAD PRO BOWL SUB TEAM CHOICE 
	LDX CURRENT_PRO_BOWL_TEAM                                    ; IS CURRENT TEAM = NFC PRO BOWL
	CPX #NFC_TEAM_ID                                             ; NO-> EXIT
	BCC @exit                                                    ;
	CLC                                                          ; = PRO BOWL SUB TEAM CHOICE
	ADC #FIRST_TEAM_IN_NFC                                        ; + OFFSET TO NFC TEAMS
@exit:                                                           ; EXIT
	RTS                                                          ; RETURN

CONVERT_ARROW_TO_PB_PLAYER_OFFSET:                               ; GET OFFSET TO PRO BOWL PLAYER INFO() RET = X
	LDA MENU_Y                                                   ; LOAD ARROW LOCATION
	LDX MENU_X                                                   ;

CHECK_FOR_ARROW_ON_PB_DEFENDER_OR_SPECIAL_TEAMS:                 ; CHECK FOR ARROW ON D OR SPECIAL TEAMS 
	BEQ @save_starter_offset                                     ; ARROW ON DEFENSE? NO->SET OFFSET TO PLAYER SUB TEAM AND PLAYER ROSTER ID
	CLC                                                          ;
	ADC #$0F                                                     ; = ADD OFFSET TO DEFENSE
	CMP #KICKER_ROSTER_ID +1                                     ; 
	BCC @save_starter_offset                                     ; IS PLAYER = K,P NO-> SET OFFSET TO PLAYER SUB TEAM AND PLAYER ROSTER ID
	
	LSR                                                          ; = ADD OFFSET TO KICKER/PUNTER
	CLC                                                          ;
	ADC #$0E                                                     ; 
@save_starter_offset:                                            ; SET OFFSET TO PLAYER SUB TEAM AND PLAYER ROSTER ID
	TAY                                                          ; 
	ASL                                                          ; SHIFT SINCE EACH PLAYER TWO BYTES (TEAM, ROSTER ID)
	JSR ADD_OFFSET_TO_STARTERS_IF_NFC                            ;  CHECK FOR AFC OR NFC AND ADD OFFSET IF NFC()
	RTS                                                          ; RETURN

SET_OFFSET_TO_AFC_NFC_PLAYERS:                                  ; SET OFFSET FOR AFC/NFC PRO BOWL FIRST PLAYER()
	LDA #$00                                                     ;
	
ADD_OFFSET_TO_STARTERS_IF_NFC:                                    ; CHECK FOR AFC OR NFC AND ADD OFFSET IF NFC()
	LDX CURRENT_TEAM                                             ; IS CURRENT TEAM = NFC PRO-BOWL ?
	CPX #NFC_TEAM_ID                                             ; 
	BCC @exit                                                    ; NO-> SAVE OFFSET TO PRO-BOWL TEAM
	CLC                                                          ;
	ADC #OFFSET_TO_NFC_PLAYERS                                  ; OFFSET += OFFSET TO NFC STARTERS
@exit:                                                          ; SAVE OFFSET TO PRO-BOWL TEAM
	TAX                                                          ;
	RTS                                                          ; RETURN
	
_F}_MISC_PRO_BOWL_FUNCTIONS

_F{_DRAW_TEAM_DATA_BACKGROUND									 ; DONE 

DRAW_TEAM_SCREEN_AND_LARGE_HELMET:                               ; DRAW TEAM DATA BACKGROUND, WINS/LOSSES, HELMET, SET SPLIT SCREEN
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_TEAM_DATA_SCREEN_BANK, BANK_JUMP_DRAW_ROSTER_SCREEN ; *** can use actual 
	JSR DRAW_LARGE_HELMET_TEAM_DATA                              ; DRAW TEAM HELMET LARGE ()
	LDX MENU_X                                                   ; SET SPLIT SCREEN LOCATION FROM MENU CHOICE 
	LDA ROSTER_PAGE_SCROLL_INFO,X                                ;
	STA IRQ_1_XSCROLL                                            ; SAVE IN IRQ 1 X SCROLL
	LDA ROSTER_PAGE_SCROLL_INFO+3,X                              ;
	STA IRQ_1_NAMETABLE                                          ;
	LDA #$80                                                     ; SET IRQ COUNTER = #$80 = MID SCREEN
	STA IRQ_0_COUNTER                                            ;
	LDA #$0F                                                     ; SET CHR $1000 BANK = 0F = TEXT?
	STA SOFT_CHR_1000_BANK                                       ;
	RTS                                                          ; RETURN

_F}_DRAW_TEAM_DATA_BACKGROUND 
	
_F{_DRAW_PLAYBOOK_AND_SCROLLING_PLAYBOOK						 ; DONE 

RUN_PLAY_MENU_CHOICE				= $00 
PASS_PLAY_MENU_CHOICE				= $01
RESET_PLAYBOOK_MENU_CHOICE			= $02						 ; 

FRAMES_TO_SCROLL_TO_NEXT_PLAY		= $10 

ppu_addr 							= LOCAL_1
num_tiles							= LOCAL_1
num_rows							= LOCAL_2

RIGHT_PB_SCROLL_SPEED				= $0004
LEFT_PB_SCROLL_SPEED				= $FFFC
playbook_scroll_speed				= LOCAL_3
current_play_index_in_slot			= LOCAL_5


current_play_slot					= MENU_X					; goes from 0-3
current_play_id						= MENU_X 


SET_TEAM_PLAYBOOK:                                               ; SET PLAYBOOK()
	LDA #$00                                                     ; SET MENU OPTIONS = FIRST OPTIONS
	STA MENU_Y                                                   ;
	STA MENU_X                                                   ;
	
DRAW_PLAYBOOK_START:                                            ; DRAW PLAYBOOK START MENU CHOICES SET()
	LDA #PLAYBOOK_SCREEN_ID                                      ; LOAD TEAM DATA PLAYBOOK SCREEN DRAW EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; LOAD BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] PLAY_CALL_SCREEN_BANK, BANK_JUMP_DRAW_PLAYBOOK 
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	LDA #$00                                                     ; CLEAR IRQ 0 COUNTER
	STA IRQ_0_COUNTER                                            ;
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	CLC                                                          ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                          ; + OFFSET TO TEAM NAME
	LDY #<TEAM_NAME_PLAYBOOK_CHANGE_PPU_ADDR                     ; SET PPU ADDR = PLAYBOOK CHANGE TEAM NAME LOCATION
	LDX #>TEAM_NAME_PLAYBOOK_CHANGE_PPU_ADDR                     ; 
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT                            ; DRAW ABREV TEAM, CITY, OR CONFERENCE (X,Y =PPUADDRESS, A= TEAM ID)
	JSR INIT_FLASHING_CONTROLLER_SPRITES                         ; SET SPR TILES FOR CONTROLLER FLASH ON PLAYBOOK SCREEN()
	JSR UPDATE_FLASHING_CONTROLLER_SPRITES_BASED_ON_PLAY         ; SET FLASHING CONTROLLER TILES X,Y BASED ON PLAY SELECTED()
	LDA #FLASHING_CONTROLLER_SPR_TILES_CHR_BANK                  ; SET SPR $1000 CHR BANK = 0X20 
	STA SOFT_CHR_1400_BANK                                       ; 
	LDA #CHANGE_PLAY_ARROW_SPR_TILES_CHR_BANK                    ; SET SPR $1400 CHR BANK = 0X2E *** pointless
	STA SOFT_CHR_1800_BANK                                       ;
	LDA #SET_PLAYBOOK_BG_PAL_INDEX                               ; SET PLAYBOOK SCREEN BG PALLETE
	LDX #SET_PLAYBOOK_SPR_PAL_INDEX                              ; SET PLAYBOOK SCREEN SPR PALLETE 
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	RETURN_1_FRAME

@set_blink_pallete_index:	
	LDA #PLAYBOOK_CONTROLLERS_CYCLING_PAL_INDEX                  ; SET SPR INDEX = CONTROLLER OUTLINE SPRITES
	JSR BANK_SWAP_DO_BLINKING_PALLETE                            ; BLINK SPRITE (A= SPRITE INDEX)

@init_playbook_manu:	
	LDY #<PLAYBOOK_SELECT_MENU_INFO                              ; SET ADDR = PLAYBOOK OPTIONS
	LDX #>PLAYBOOK_SELECT_MENU_INFO                              ;
	LDA #BOTH_JOYPADS                                            ; SET JOY = BOTH
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	JMP @draw_play_name                                          ; JUMP-> DRAW PLAY NAME 

@playbook_check_input_loop:                                      ; PLAYBOOK CHECK FOR INPUT LOOP 
	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	BCC @check_for_play_selected                                 ;
	
@check_for_arrow_on_reset	
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	LDA MENU_Y                                                   ;
	CMP #RESET_PLAYBOOK_MENU_CHOICE                               ;
	BCS @clear_play_name                                         ;

@draw_play_name:                                                 ; DRAW PLAY NAME
	LDA #<PLAY_NAME_LOCATION_PPU_ADDR                            ; SET PPU ADDR = PLAY NAME LOCATION =$2362
	STA ppu_addr                                                 ; 
	LDA #>PLAY_NAME_LOCATION_PPU_ADDR                            ;
	STA ppu_addr+1                                               ;
	LDA #PLAY_CALL_SCREEN_BANK                                                     ; SET BANK = 20
	LDY #<BANK_JUMP_DRAW_INITIAL_PLAY_NAME_PLAY_CHANGE                     ; SET ADDR = UPDATE CURRENT PLAY TO CHANGE ON TEAM DATA()
	LDX #>BANK_JUMP_DRAW_INITIAL_PLAY_NAME_PLAY_CHANGE                     ;
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                           ; SWAP 8000 BANK AND JUMP( A= BANK, Y,X=  JUMP ADDRESS)
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	JSR UPDATE_FLASHING_CONTROLLER_SPRITES_BASED_ON_PLAY          ; SET FLASHING CONTROLLER TILES X,Y BASED ON PLAY SELECTED()
	JMP @check_for_play_selected                                  ; JUMP->CHECK FOR CHANGE PLAY

@clear_play_name:                                                ; CLEAR PLAY NAME
	LDY #<PLAY_NAME_LOCATION_PPU_ADDR                            ; SET PPU ADDR = PLAY NAME START
	LDX #>PLAY_NAME_LOCATION_PPU_ADDR                            ;
	LDA #$01                                                     ; SET NUM ROWS = 1
	STA num_rows                                                 ;
	LDA #PLAY_NAME_LENGTH +1                                     ; SET LENGTH = HALF SCREEN = 16 TILES
	STA num_tiles                                                ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	
	LDX #$00                                                     ; SPRITE INDEX = 0
	LDA #SPRITE_OFFSCREEN                                               ; Y VALUE= OFFSCREEN
@clear_sprites:                                                  ; SET FLASHING CONTROLLER SPRITES = OFFSCREEN 
	STA CONTROLLER_SPR_INFO[],X                                  ; SET SPRITE Y = OFFSCREEN
	SET_X_INDEX_NEXT_SPRITE                                      ;
	CPX #$20                                                     ; ALL CONTROLLER SPRITES CLEARED?
	BCC @clear_sprites                                           ; NO->SET FLASHING CONTROLLER SPRITES = OFFSCREEN
	
@check_for_play_selected:                                        ; CHECK FOR CHANGE PLAY
	BIT JOY_PRESS_BOTH                                           ; IS B PRESSED?
	BVC @check_a_pressed                                         ; NO-> CHECK FOR A PRESSED PLAYBOOK
	JMP EXIT_PLAYBOOK_CHANGE                                     ; YES-> EXIT TO SET PLAYBOOK *** could just have RTS here

@check_a_pressed:                                                ; CHECK FOR A PRESSED PLAYBOOK
	BPL @playbook_check_input_loop                                ; A PRESSED? NO->PLAYBOOK CHECK FOR INPUT LOOP
	LDA MENU_Y                                                   ;
	CMP #RESET_PLAYBOOK_MENU_CHOICE                              ; DOES Y MENU CHOICE = RESET PLAYS
	BCC @check_if_run_or_pass                                    ;
	JMP RESET_PLAYBOOK_TO_DEFAULT                                ; JUMP->  RESET PLAYS

@check_if_run_or_pass:                                           ; DRAW SUBSTITUTE PLAYS
	CMP #PASS_PLAY_MENU_CHOICE                                   ; IS CHOICE= PASS PLAY
	BEQ @clear_sub_pass_play_area                                ; YES-> DRAW SUBSTITUTE PASS PLAYS 
	
@clear_onscreen_sub_run_play_area
	LDY #<RUN_PLAY_SUB_WINDOW_START_PPU_ADDR                     ; SET PPU ADDR = RUN PLAYS START LOCATION
	LDX #>RUN_PLAY_SUB_WINDOW_START_PPU_ADDR                     ;
	LDA #WIDTH_OF_PLAY_IMAGE + $04                                ; SET NUM ROWS = 12 =  40% OF SCREEN
	STA num_rows                                                 ;
	LDA #LENGTH_OF_ONE_ROW                                       ; SET LENGTH = 32 TILES = WHOLE SCREEN
	STA num_tiles                                                ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	
@clear_ofscreen_sub_run_play_area	
	LDY #<OFFSCREEN_RUN_PLAY_START_PPU_ADDR                      ; SET PPU ADDRESS = $2600 = OFFSCREEN PLAYS LOCATION
	LDX #>OFFSCREEN_RUN_PLAY_START_PPU_ADDR                      ;
	LDA #WIDTH_OF_PLAY_IMAGE + $04                               ; SET NUM ROWS = 12 =  40% OF SCREEN
	STA num_rows                                                 ;
	LDA #LENGTH_OF_ONE_ROW                                       ; SET LENGTH = 32 TILES = WHOLE SCREEN
	STA num_tiles                                                ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	
@set_irq_split_run_play_change:	
	LDY #<IRQ_DATA_RUN_PB_CHANGE                                 ; SET ADDR = CHANGE RUNPLAY IRQ SPLIT INFO
	LDX #>IRQ_DATA_RUN_PB_CHANGE                                 ;
	JSR LOAD_IRQ_SPLIT_DATA                                      ; LOAD IRQ SPLIT INFO(Y,X= IRQ INFO ADDRESS)
	
@draw_run_sub_play_images: 	
	LDA #PLAYBOOK_RUN_CHANGE_SCREEN_ID                           ; SET BG EVENT = CHANGE RUN PLAY BACKGROUND
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16    
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	LDA current_play_slot                                         ; LOAD PLAY SLOT SELECTED
	JSR DRAW_SUB_PLAYS_IN_SCROLLING_WINDOW                       ; DRAW SUBSTITUTE PLAYS IN SCROLLING WINDOW (A= PLAY SLOT)
	
@draw_sub_run_play_name: 	
	LDA #<RUN_PLAY_SUB_NAME_PPU_ADDR                             ; SET PPU ADDR = RUN PLAY NAME
	STA ppu_addr                                                 ;
	LDA #>RUN_PLAY_SUB_NAME_PPU_ADDR                             ;
	STA ppu_addr+1                                               ;
	JMP @save_current_play_id                                    ; JUMP SET CURRENT PLAY IN SCROLLING PLAYBOOK WINDOW

@clear_sub_pass_play_area:                                       ; DRAW SUBSTITUTE PASS PLAYS

@clear_onscreen_sub_pass_play_area:
	LDY #<PASS_PLAY_SUB_WINDOW_START_PPU_ADDR                    ; SET PPU ADDRESS = $2080 = PASS PLAYS START LOCATION
	LDX #>PASS_PLAY_SUB_WINDOW_START_PPU_ADDR                    ;
	LDA #WIDTH_OF_PLAY_IMAGE + $04                               ; SET NUM ROWS = 12 =  40% OF SCREEN
	STA num_rows                                                ;
	LDA #LENGTH_OF_ONE_ROW                                       ; SET LENGTH = 32 TILES = WHOLE SCREEN
	STA num_tiles                                                ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)

@clear_ofscreen_sub_pass_play_area:
	LDY #<OFFSCREEN_PASS_PLAY_START_PPU_ADDR                     ; SET PPU ADDRESS = $2480 = OFFSCREEN PASS PLAYS LOCATION
	LDX #>OFFSCREEN_PASS_PLAY_START_PPU_ADDR                     ;
	LDA #WIDTH_OF_PLAY_IMAGE + $04                               ; SET NUM ROWS = 12 =  40% OF SCREEN
	STA num_rows                                                 ;
	LDA #LENGTH_OF_ONE_ROW                                       ; SET LENGTH = 32 TILES = WHOLE SCREEN
	STA num_tiles                                                ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH) 
	
@set_irq_split_pass_play_change:		
	LDY #<IRQ_DATA_PASS_PB_CHANGE                                ; SET ADDR = CHANGE PASS PLAY IRQ SPLIT INFO
	LDX #>IRQ_DATA_PASS_PB_CHANGE                                ; 
	JSR LOAD_IRQ_SPLIT_DATA                                      ; LOAD IRQ SPLIT INFO(Y,X= IRQ INFO ADDRESS)

@draw_pass_sub_play_images:
	LDA #PLAYBOOK_PASS_CHANGE_SCREEN_ID                          ; SET BG EVENT = CHANGE PASS PLAY BACKGROUND
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16 
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	LDA current_play_slot                                         ; LOAD MENU X INDEX
	CLC                                                          ;
	ADC #OFFSET_TO_PASS_PLAY                                     ; + OFFSET TO PASS PLAYS
	JSR DRAW_SUB_PLAYS_IN_SCROLLING_WINDOW                       ; DRAW SUBSTITUTE PLAYS IN SCROLLING WINDOW (A= PLAY SLOT)
	
@update_play_change_arrow_y_locations: 	
	LDA #$40                                                     ; UPDATE PLAY CHANGE ARROW TILES Y LOCATIONS
	STA PLAY_CHANGE_ARROWS_SPR_INFO[]                            ;
	STA PLAY_CHANGE_ARROWS_SPR_INFO[] + $04                      ;
	STA PLAY_CHANGE_ARROWS_SPR_INFO[] + $10                      ;
	STA PLAY_CHANGE_ARROWS_SPR_INFO[] + $14                      ;
	
	LDA #$48                                                     ;
	STA PLAY_CHANGE_ARROWS_SPR_INFO[]+ $08                       ;
	STA PLAY_CHANGE_ARROWS_SPR_INFO[]+ $0C                       ;
	STA PLAY_CHANGE_ARROWS_SPR_INFO[]+ $18                       ;
	STA PLAY_CHANGE_ARROWS_SPR_INFO[]+ $1C                       ;
	
@draw_sub_pass_play_name:	
	LDA #<PASS_PLAY_SUB_NAME_PPU_ADDR                            ; SET PPU ADDR = PASS PLAY NAME
	STA ppu_addr                                                 ;
	LDA #>PASS_PLAY_SUB_NAME_PPU_ADDR                            ;
	STA ppu_addr+1                                               ;	
	
@save_current_play_id:                                           ; SET CURRENT PLAY IN SCROLLING PLAYBOOK WINDOW

current_play_id						= LOCAL_6

	LDA MENU_X                                                   ; = LOAD PLAY SLOT + OFFSET TO PLAYS
	CLC                                                          ; 
	ADC #$02                                                     ; + OFFSET TO THIRD PLAY
	STA current_play_id                                          ; = PLAY ID
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] PLAY_CALL_SCREEN_BANK, BANK_JUMP_DRAW_CURRENT_PLAY_NAME_PLAY_CHANGE ;  *** can use actual
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	LDA #$02
	STA current_play_index_in_slot
@playbook_input_check:                                           ; SCROLLING SUB PLAYBOOK INPUT CHECK LOOP
	RETURN_1_FRAME  
	LDA JOY_RAW_BOTH                                             ; LOAD JOY RAW
	LSR                                                          ; IS RIGHT PRESSED?
	BCS @right_press_set_scroll_speed                            ; YES->RIGHT PRESSED PLAYBOOK CHANGE
	LSR                                                          ; IS LEFT PRESSED?
	BCS @left_press_set_scroll_speed                             ; YES->LEFT PRESSED PLAYBOOK CHANGE
	JMP @check_for_a_or_b                                        ;
	
@right_press_set_scroll_speed:                                   ; RIGHT PRESSED PLAYBOOK CHANGE
	INC current_play_index_in_slot                               ; CURRENT PLAY ++
	LDY #<RIGHT_PB_SCROLL_SPEED                                     ; SET SCROLL AMOUNT = +4 PIXELS/ FRAME
	LDX #>RIGHT_PB_SCROLL_SPEED                                     ;
	JMP @save_scroll_speed
	
@left_press_set_scroll_speed:                                    ; LEFT PRESSED PLAYBOOK CHANGE
	DEC current_play_index_in_slot                               ; CURRENT PLAY --
	LDY #<LEFT_PB_SCROLL_SPEED                                      ; SET SCROLL AMOUNT = -4 PIXELS/ FRAME
	LDX #>LEFT_PB_SCROLL_SPEED                                      ;

@save_scroll_speed:                                              ; SAVE SCROLL AMOUNT 
	STY playbook_scroll_speed                                    ; SAVE SCROLL AMOUNT/ FRAME
	STX playbook_scroll_speed+1                                  ;
	LDA current_play_index_in_slot                               ; MAKE SURE PLAY INDEX IS BETWEEN 0 -7 
	AND #$07                                                     ;
	STA current_play_index_in_slot                               ;
	CLC                                                          ;
	ADC MENU_X                                                   ; + PLAY SLOT OFFSET
	STA current_play_id                                                      ; = PLAY ID
	
@update_play_name:
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] PLAY_CALL_SCREEN_BANK, BANK_JUMP_DRAW_CURRENT_PLAY_NAME_PLAY_CHANGE  ; *** can use actual addr  
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	
	
@scroll_to_play: 	
	LDX #FRAMES_TO_SCROLL_TO_NEXT_PLAY                            ; SET NUMBER OF FRAMES TO SCROLL
_WHILE NOT_EQUAL                                                 ; SCROLL PLAYBOOK DIRECTION ($40,$41 = AMOUNT)

	RETURN_1_FRAME  
	LDA IRQ_1_XSCROLL                                            ; IRQ 1 X SCROLl += SCROLL AMOUNT PER FRAME
	CLC                                                          ;
	ADC playbook_scroll_speed                                    ;
	STA IRQ_1_XSCROLL                                            ;
	LDA IRQ_1_NAMETABLE                                          ;
	ADC playbook_scroll_speed+1                                  ;
	AND #$01                                                     ;
	STA IRQ_1_NAMETABLE                                          ;
	DEX                                                          ; NUMBER OF FRAMES LEFT TO SCROLL--
	
_END_WHILE                                                       ;
	
@check_for_a_or_b:                                                         ; CHECK FOR A PRESSED ON NEW PLAY 
	BIT JOY_PRESS_BOTH                                           ; B PRESSED?
	BVS @exit_scrolling_playbook                                 ; YES-> B PRESSED EXIT SCROLLING PLAYBOOK
	BPL @playbook_input_check                                    ; A NOT PRESSED->SCROLLING SUB PLAYBOOK INPUT CHECK LOOP
	MMC3_SRAM_WRITE_ENABLE
	LDA MENU_X                                                   ; CONVERT MENU INDEX TO PLAY ID
	LOG_SHIFT_RIGHT_3									         ;
	TAX                                                          ;
	LDA current_play_index_in_slot                               ;
	CLC                                                          ;
	ADC MENU_X                                                   ;
	STA P1_PLAYBOOK_EDIT,X                                       ; SAVE PLAY IN P1 EDIT PLAYBOOK
	JSR TRANSFER_CURRENT_PLAYBOOK_TO_SEASON_PLAYBOOK             ; SAVE TEAM DATA PLAYBOOK INTO SEASON PLAYBOOK()
	
@exit_scrolling_playbook:                                        ; B PRESSED EXIT SCROLLING PLAYBOOK 
	LDA #$00                                                     ; SET Y MENU CHOICE = RUN PLAY
	STA MENU_Y                                                   ;
	LDA MENU_X                                                   ; IS SCROLLING X MENU CHOICE  = RUN 
	LOG_SHIFT_RIGHT_3								             ;  CONVERT MENU INDEX TO PLAY ID
	CMP #OFFSET_TO_PASS_PLAY                                     ;
	BCC @save_play_choice                                        ; YES-> SAVE X MENU CHOICE

@set_play_to_pass_play:	
	INC MENU_Y                                                   ; SET Y MENU CHOICE = PASS PLAY
	AND #$03           

@save_play_choice:                                               ; SAVE X MENU CHOICE
	STA MENU_X                                                   ;
	JMP DRAW_PLAYBOOK_START                                     ; JUMP-> DRAW PLAYBOOK START MENU CHOICES SET()

_F}_DRAW_PLAYBOOK_AND_SCROLLING_PLAYBOOK 

_F{_SET_PLAYBOOK_TO_DEAFULT										 ; DONE
		
temp_current_team = LOCAL_6		
		
RESET_PLAYBOOK_TO_DEFAULT:                                       ; RESET PLAYBOOK
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	STA temp_current_team                                        ;
	
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_DEFAULT_PLAYBOOK_STARTERS_BANK, BANK_JUMP_RESET_TEAM_PLAYBOOK_TO_DEFAULT_SAVE_CHECKSUM ; *** can use actual addr
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	CMP #AFC_TEAM_ID                                             ; IS TEAM PRO BOWL?
	BCS @reset_pro_bowl_team_playbook                             ; YES->RESET PROBOWL PLAYBOOK
	
@reset_team_playbook	
	JSR CLEAR_IN_GAME_STATS_TRANSFER_SEASON_INFO                 ; CLEAR P1/P2 GAME STATS, TRANSFER PB, STARTERS, INJ, CONDITIONS TO P1/P2 GAME INFO()
	JSR SET_CUR_STARTERS_PLAYBOOKS_TO_SEASON                     ; LOAD STARTERS AND PLAYBOOKS FROM SEASON INFO()
	JMP SET_TEAM_PLAYBOOK                                        ; JUMP SET PLAYBOOK()

@reset_pro_bowl_team_playbook                                    ; RESET PROBOWL PLAYBOOK
	JSR TRANSFER_SEASON_PRO_BOWL_INFO_TO_TEMP                    ; TRANSFER SEASON PRO BOWL STARTERS AND PLAYBOOK TO IN GAME PRO BOWL STARTERS AND PLAYBOOK 
	JMP SET_TEAM_PLAYBOOK                                        ; JUMP SET PLAYBOOK()

EXIT_PLAYBOOK_CHANGE:                                            ; EXIT TO SET PLAYBOOK   *** uneeded since only one jump to this could just have RTS at jump
	RTS                                                          ; RETURN
	
_F}_SET_PLAYBOOK_TO_DEAFULT 

_F{_DRAW_PLAYS_TO_SUB_IN_PLAYBOOK								 ; DONE

ppu_addr					= LOCAL_1
num_plays_drawn				= LOCAL_5
current_play_id				= LOCAL_6	

DRAW_SUB_PLAYS_IN_SCROLLING_WINDOW:                              ; DRAW SUBSTITUTE PLAYS (A= PLAY SLOT)
	ASL                                                          ; SHIFT BY 8 SINCE 8 PLAYS PER SLOT
	ASL                                                          ;
	ASL                                                          ;
	AND #$38                                                     ; MAKE SURE ADJUSTED PLAY SLOT IS 0 THROUGH 7 
	STA current_play_id                                          ; 
	STA MENU_X                                                   ; 
	LDA #$00                                                     ; SET NUMBER OF PLAYS DRAWN = NONE 
	STA num_plays_drawn                                          ;
	
_WHILE CC                                                       ; DRAW SUBSTITUTE PLAYS LOOP

	LDA MENU_Y                                                   ; CONVERT PLAY CHOICE INDEX INTO IMAGE LOCATION INDEX
	ASL                                                          ;
	ASL                                                          ;
	ASL                                                          ;
	CLC                                                          ;
	ADC num_plays_drawn                                          ;
	ASL                                                          ;
	TAX                                                          ; 
	LDA SCROLLING_WINDOW_PLAY_IMAGE_LOCATIONS,X                  ; SET PLAY IMAGE LOCATION FROM SCROLLING WINDOW PLAY IMAGE LOCATIONS
	STA ppu_addr                                                 ;
	LDA SCROLLING_WINDOW_PLAY_IMAGE_LOCATIONS+1,X                ;
	STA ppu_addr+1                                               ;
	
@draw_scrolling_window: 	
	LDA #PLAY_CALL_SCREEN_BANK                            		 ; SET BANK = 20
	LDY #<BANK_JUMP_DO_PLAY_CHANGE_IN_TEAM_DATA                  ; SET ADDR = DRAW SCROLLING PLAY WINDOW FOR TEAM DATA PLAY CHANGE() *** can use actual
	LDX #>BANK_JUMP_DO_PLAY_CHANGE_IN_TEAM_DATA                  ;
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                           ; SWAP 8000 BANK AND JUMP( A= BANK, Y,X=  JUMP ADDRESS)
	
@set_current_play_to_next_play:	
	INC current_play_id                                          ; SET CURRENT SLOT PLAY = NEXT PLAY
	INC num_plays_drawn                                          ; NUMBER OF PLAYS DRAWN++
	LDA num_plays_drawn                                          ; ALL PLAYS DRAWN?
	CMP #TOTAL_NUM_PLAYS_IN_PLAYBOOK                             ;

_END_WHILE
	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] PLAY_CHANGE_ARROWS_SPR_DATA, PLAY_CHANGE_ARROWS_SPR_INFO[], $20
	
@set_blinking_pallete	
	LDA #PLAYBOOK_CONTROLLERS_CYCLING_PAL_INDEX                 ; SET INDEX TO CONTROLLER SPRITES PAL 
	JMP BANK_SWAP_DO_BLINKING_PALLETE                            ; BLINK SPRITE (A= SPRITE INDEX)

SCROLLING_WINDOW_PLAY_IMAGE_LOCATIONS:                           ; SCROLLING WINDOW PLAY IMAGE LOCATIONS
																 ; SCROLLING WINDOW RUN PLAY IMAGE START LOCATIONS 
	.WORD RUN_PLAY_CHANGE_IMAGE_ONE_PPU_ADDR 
	.WORD RUN_PLAY_CHANGE_IMAGE_TWO_PPU_ADDR
	.WORD RUN_PLAY_CHANGE_IMAGE_THREE_PPU_ADDR 
	.WORD RUN_PLAY_CHANGE_IMAGE_FOUR_PPU_ADDR
	.WORD RUN_PLAY_CHANGE_IMAGE_FIVE_PPU_ADDR 					 ; offscreen	
	.WORD RUN_PLAY_CHANGE_IMAGE_SIX_PPU_ADDR
	.WORD RUN_PLAY_CHANGE_IMAGE_SEVEN_PPU_ADDR 
	.WORD RUN_PLAY_CHANGE_IMAGE_EIGHT_PPU_ADDR

	.WORD PASS_PLAY_CHANGE_IMAGE_ONE_PPU_ADDR 
	.WORD PASS_PLAY_CHANGE_IMAGE_TWO_PPU_ADDR
	.WORD PASS_PLAY_CHANGE_IMAGE_THREE_PPU_ADDR 
	.WORD PASS_PLAY_CHANGE_IMAGE_FOUR_PPU_ADDR
	.WORD PASS_PLAY_CHANGE_IMAGE_FIVE_PPU_ADDR 					 ; offscreen	
	.WORD PASS_PLAY_CHANGE_IMAGE_SIX_PPU_ADDR
	.WORD PASS_PLAY_CHANGE_IMAGE_SEVEN_PPU_ADDR 
	.WORD PASS_PLAY_CHANGE_IMAGE_EIGHT_PPU_ADDR
	
	
_F}_DRAW_PLAYS_TO_SUB_IN_PLAYBOOK 

_F{_TRANSFER_TEAM_DATA_PLAYBOOK_TO_SEASON_PLAYBOOK 				  ; DONE

sram_playbook_addr 		= LOCAL_1
temp_playbook_byte 		= LOCAL_8
IN_GAME_PLAYBOOK_OFFSET	= P1_GM_PLAYBOOK_START - P1_GAME_STATS_START
END_OF_INGAME_PLAYBOOK	= IN_GAME_PLAYBOOK_OFFSET + 4 

TRANSFER_CURRENT_PLAYBOOK_TO_SEASON_PLAYBOOK:                   ; SAVE TEAM DATA PLAYBOOK INTO SEASON PLAYBOOK
	MMC3_SRAM_WRITE_ENABLE
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	JSR GET_P1_P2_GAME_STATS_ADDR                                    ; LOAD START OF TEAM SEASON INFO SRAM LOCATION IN 3E 3F()
	LDY #IN_GAME_PLAYBOOK_OFFSET	                             ; LOAD OFFSET TO SEASON PLAYBOOK BYTES
	LDX #$00                                                     ;
_WHILE CC                                                        ; TRANSFER CURRENT PLAYBOOK TO SEASON PLAYBOOK LOOP
	LDA P1_P2_PLAYBOOKS[],X                                      ; MERGE FIRST TWO PLAYS FROM THE EDITED PLAYBOOK INTO ONE BYTE 
	AND #$07                                                     ;
	SHIFT_LEFT_4
	STA temp_playbook_byte                                       ;
	LDA P1_P2_PLAYBOOKS[]+1,X                                    ;
	AND #$07                                                     ;
	ORA temp_playbook_byte                                       ;
	STA (sram_playbook_addr),Y                                   ; SAVE PLAYS IN TEAM SEASON PLAYBOOK LOCATION
	INX                                                          ; EDIT PLAYBOOK PLAY += TWO PLAYS
	INX                                                          ;
	INY                                                          ; SRAM SEASON PLAYBOOK LOCATION ++ 
	CPY #END_OF_INGAME_PLAYBOOK                                  ; DONE? 
_END_WHILE                                                   ; NO->TRANSFER CURRENT PLAYBOOK TO SEASON PLAYBOOK LOOP
	MMC3_SRAM_WRITE_ENABLE
	RTS                                                          ; RETURN
_F}_TRANSFER_TEAM_DATA_PLAYBOOK_TO_SEASON_PLAYBOOK 

_F{_DO_GAME_START_PRESEASON										  ; DONE

TRANSFER_TEAM_INFO_AND_START_GAME:                               ; GAME START
	JSR CLEAR_IN_GAME_STATS_TRANSFER_SEASON_INFO                 ; CLEAR P1/P2 GAME STATS, TRANSFER PB, STARTERS, INJ, CONDITIONS TO P1/P2 GAME INFO()
	JSR SET_CUR_STARTERS_PLAYBOOKS_TO_SEASON                     ; LOAD STARTERS AND PLAYBOOKS FROM SEASON INFO()
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	LDA #PRESEASON_LARGE_TXT_SCENE_ID                            ; LOAD PRE-SEASON SCREEN DRAW EVENT INDEX
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; LOAD BANK 8
	JSR DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP
	JSR DO_GAME                                                  ; DO GAME()
	LDA #$00                                                     ; 
	STA MENU_Y                                                   ; SET Y MENU CHOICE = FIRST CHOICE
	STA MENU_X                                                   ; SET X MENU CHOICE = FIRST CHOICE
	JMP DRAW_MAIN_MENU_INIT                                      ; JUMP TO MAIN MENU START
	
_F}_DO_GAME_START_PRESEASON
	
_F{_DO_GAME_START_SEASON										; DONE	

START_OF_SEASON_WEEK_SCENE_IDS = REG_SEAS_WEEK_1_SCENE_ID

	
SEASON_GAME_START:                                               ; SEASON GAME START
	LDA JOY_RAW_BOTH                                             ; IS P1/P2 START HELD ?
	AND #START_BUTTON                                            ;
	BEQ @normal_season_start                                    ; NO->SEASON GAME NORMAL START

@set_play_out_all_games_to_true									; START HELD PLAY OUT ALL SEASON GAMES
	MMC3_SRAM_WRITE_ENABLE
	LDA PLAY_OUT_ALL_GAMES_BOOL                                  ; SET PLAY OUT ALL GAMES FLAG = TRUE
	ORA #$80                                                     ; 
	STA PLAY_OUT_ALL_GAMES_BOOL                                  ;
	MMC3_SRAM_WRITE_DISABLE

@normal_season_start:                                             ; SEASON GAME NORMAL START
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	LDA CURRENT_WEEK_IN_SEASON                                   ; IS CURRENT WEEK = PLAYOFFS
	CMP #FIRST_WEEK_OF_PLAYOFFS                                      ; 
	BCS @playoff_game_start                                       ; YES->PLAYOFF SEASON GAME

	
	JSR SET_TEAMS_AND_CONTROL_TYPE_SEASON_GAME                   ; SET TEAMS AND PLAYER TYPES FOR SEASON GAME (MAN,COA,COM,SKP)
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	JSR CLEAR_IN_GAME_STATS_TRANSFER_SEASON_INFO                 ; CLEAR P1/P2 GAME STATS, TRANSFER PB, STARTERS, INJ, CONDITIONS TO P1/P2 GAME INFO()
	JSR UPDATE_INJURY_STATUS                                     ; CHECK FOR RETURN FROM INJURY AND UPDATE INJURY STATUS()
	JSR SET_CUR_STARTERS_PLAYBOOKS_TO_SEASON                     ; SET DEFAULT STARTERS AND PLAYBOOKS()

@check_for_skip_mode:
	JSR CHECK_IF_GAME_TYPE_SKIP_MODE                             ; IS GAME TYPE SKIP MODE () CS= IN SKIP CC= DONE OR NOT IN SKIP()
	BCS @start_game                                                   ; 
	
@draw_current_week_scene
	LDA CURRENT_WEEK_IN_SEASON                                   ; LOAD CURRENT WEEK
	CLC
	ADC #START_OF_SEASON_WEEK_SCENE_IDS                          ; + OFFSET TO “REGULAR SEASON WEEK” CUTSCENE 
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; SET BANK = 8
	JSR DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP 
	
@start_game:                                                          ; 
	JSR DO_GAME                                                  ; DO GAME()
	JSR ADD_GAME_STATS_TO_SEASON_STATS_UPDATE_GAME_INDEX         ; ADD GAME STATS TO SEASON STATS AND UPDATE GAME WEEK INDEX()
	JMP @return_to_season_menu_game_start                                                  ; 
	
@playoff_game_start:                                             ; PLAYOFF SEASON GAME
	SET_GAME_STATUS_PLAYOFF_MODE[]
	LDA CURRENT_GAME_IN_WEEK                                     ; IS CURRENT PLAYOFF GAME > SUPER-BOWL
	CMP #SUPERBOWL_GAME_ID +1                            		;
	BCC @get_current_playoff_matchup                             ;
	
@do_super_bowl_champ_credits:	
	JMP @do_super_bowl_champion_and_credits                      ; YES->DO FINAL CHAMPION ROSTER PLUS CREDITS

@get_current_playoff_matchup:                                    ; PLAYOFF GAME START
	ASL                                                          ; SHIFT BY 4 SINCE EACH PLAYOFF ENTRY IS 4 BYTES
	ASL                                                          ;
	TAX                                                          ;
	LDA PLAYOFF_RESULTS_START[],X                                ; SET P1 TEAM = PLAYOFF MATCHUP P1 TEAM
	STA P1_TEAM                                                  ; 
	LDA PLAYOFF_RESULTS_START[]+1,X                              ; SET P2 TEAM = PLAYOFF MATCHUP P2 TEAM
	STA P2_TEAM                                                  ;
	JSR SET_TEAMS_AND_CONTROL_TYPE_PLAYOFF_GAME                  ; CHECK FOR P1/P2 TEAM SWAP AND LOAD TEAM PLAYER TYPES()
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	JSR CLEAR_IN_GAME_STATS_TRANSFER_SEASON_INFO                 ; CLEAR P1/P2 GAME STATS, TRANSFER PB, STARTERS, INJ, CONDITIONS TO P1/P2 GAME INFO()
	JSR UPDATE_INJURY_STATUS                                     ; CHECK FOR RETURN FROM INJURY AND UPDATE INJURY STATUS()
	JSR SET_CUR_STARTERS_PLAYBOOKS_TO_SEASON                     ; SET DEFAULT STARTERS AND PLAYBOOKS()
	
@draw_current_playoff_round_text	
	LDA CURRENT_GAME_IN_WEEK                                     ; LOAD CURRENT GAME
	CLC                                                          ;
	ADC #$50                                                     ; + OFFSET TO PLAYOFF GAME CUTSCREEN *** bug due to empty pointers 
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; SET BANK = 8
	JSR DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP

	
	JSR DO_GAME                                                  ; DO GAME()
	JSR SAVE_TEMP_P1_P2_TEAM_INFO_TO_SEASON                         ; TRANSFER SEASON PLAYBOOK, STARTERS, INJ, COND FROM IN GAME SRAM -> SEASON SRAM()
	MMC3_SRAM_WRITE_ENABLE
	LDA CURRENT_GAME_IN_WEEK                                     ; SET INDEX = CURRENT PLAYOFF MATCHUP
	SHIFT_LEFT_2
	TAX                                                          ;
	LDA PLAYOFF_RESULTS_START[],X                                ; IS HOME TEAM == P1 TEAM 
	CMP P1_TEAM                                                  ;
	BEQ @save_playoff_score_results                                                   ; YES->SAVE PLAYOFF SCORES

@swap_teams_and_scores_if_away_team_wins	
	LDA P1_TEAM                                                  ; SWAP TEAMS SO THAT P2 TEAM IS IN P1 
	LDY P2_TEAM                                                  ; 
	STY P1_TEAM                                                  ; 
	STA P2_TEAM                                                  ;
	LDA P1_TOTAL_SCORE                                           ; SWAP SCORES SO THAT P2 TOTAL SCORE IS IN P1 TOTAL SCORE LOCATION
	LDY P2_TOTAL_SCORE                                           ;
	STY P1_TOTAL_SCORE                                           ;
	STA P2_TOTAL_SCORE                                           ;

@save_playoff_score_results:                                    ;  SAVE PLAYOFF SCORES 
	LDA P1_TOTAL_SCORE                                           ;  SAVE WINNING TEAM SCORE IN SRAM PLAYOFF MATCHUP SCORE RESULTS
	STA PLAYOFF_RESULTS_START[]+2,X                              ;
	LDA P2_TOTAL_SCORE                                           ;  SAVE LOSING TEAM SCORE IN SRAM PLAYOFF MATCHUP SCORE RESULTS
	STA PLAYOFF_RESULTS_START[]+3,X                              ;
	LDA P1_TOTAL_SCORE                                           ;
	CMP P2_TOTAL_SCORE                                           ;
	BCC @set_p2_as_winning_team                                  ;
	
@set_p1_as_winning_team	
	LDX P1_TEAM                                                  ; LOAD WINNING TEAM
	LDY P2_TEAM                                                  ; LOAD LOSING TEAM
	JMP @save_team_ids                                                   ;
	
@set_p2_as_winning_team:                                         ; 
	LDX P2_TEAM                                                  ;
	LDY P1_TEAM                                                  ; LOAD P1 TEAM
	
@save_team_ids:                                                  ; SAVE TEAM IDS
	STX CURRENT_TEAM                                             ;
	STY PLAYOFF_LOSING_TEAM                                      ;
	LDY CURRENT_GAME_IN_WEEK                                     ; IS PLAYOFF GAME = SUPERBOWL 
	CPY #SUPERBOWL_GAME_ID                                       ;      
	BCS @check_for_draw_afc_nfc_champ_super_bowl                 ; YES-> CHECK FOR DRAW AFC WINNER, NFC WINNER, SUPER BOWL WINNER SCREENS
	

	LDA OFFSETS_FOR_PLAYOFF_WINNING_TEAMS_TABLE,Y                ; LOAD WINNING TEAM NEXT MATCHUP LOCATION
	TAY                                                          ; 
	TXA                                                          ;
	STA PLAYOFF_RESULTS_START[],Y                                ; SAVE WINNING TEAM ID IN NEXT MATCHUP

@check_for_draw_afc_nfc_champ_super_bowl:                        ; CHECK FOR DRAW AFC WINNER, NFC WINNER, SUPER BOWL WINNER SCREENS
	MMC3_SRAM_WRITE_ENABLE
	INC CURRENT_GAME_IN_WEEK                                     ; CURRENT GAME++
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	LDA CURRENT_GAME_IN_WEEK                                     ; IS CURRENT GAME < AFC CONFERENCE CHAMPIONSHIP
	CMP #AFC_CONF_CHAMP_PLAYOFF_GAME_ID + 1                      ; 
	BCC @return_to_season_menu_game_start                        ; YES->EXIT TO GAME START SEASON MENU IF PLAY ALL GAMES FLAG= OFF
	BEQ @set_afc_champion_scene_id                               ;
	
@check_for_draw_superbowl_credits:	
	CMP #NFC_CONF_CHAMP_PLAYOFF_GAME_ID +1                         ; IS GAME= SUPER BOWL?
	BNE @do_super_bowl_champion_and_credits                      ; YES->DO SUPER BOWL CHAMPION ROSTER PLUS CREDITS

@set_nfc_champion_scene_id	
	LDA #NFC_CHAMPION_SCENE_ID                                                     ; LOAD OFFSET TO NFC CHAMPION
	JMP @do_conference_champion_scene                            ;
	
@set_afc_champion_scene_id:                                      ; DRAW AFC CHAMPION SCREEN
	LDA #AFC_CHAMPION_SCENE_ID                                   ; LOAD OFFSET TO AFC CHAMPION

@do_conference_champion_scene:                                  ; DO CONFERENCE CHAMPIONSHIP SCREEN
	LDX #CUTSCENE_DRAW_SCRIPT_BANK                               ; LOAD BANK 7
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	JSR FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0                      ; FADE OUT PAL, CLEAR IRQ0 XSCROLL,COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES()
	JMP @return_to_season_menu_game_start                        ; JUMP->EXIT TO GAME START SEASON MENU IF PLAY ALL GAMES FLAG= OFF

@do_super_bowl_champion_and_credits:                             ; DO SUPER BOWL CHAMPION ROSTER PLUS CREDITS
	LDX #$00                                                     ; SET TEAM = HOME TEAM
	LDA SUPERBOWL_HOME_SCORE                                     ; IS SUPER BOWL HOME SCORE > AWAY SCORE
	CMP SUPERBOWL_AWAY_SCORE                                     ;
	BCS @Loop12                                                  ;
	INX                                                          ; SET TEAM = AWAY TEAM
	
@Loop12:
	LDA SUPERBOWL_MATCHUP_INFO[],X                               ; SET CURRENT TEAM = SUPER BOWL WINNER
	STA CURRENT_TEAM                                             ;
	JSR FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0                      ; FADE OUT PAL, CLEAR IRQ0 XSCROLL,COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES()
	LDA #SUPER_BOWL_CHAMPION_SCENE_ID                            ; LOAD ENDING SCREEN DRAW EVENT INDEX
	LDX #CUTSCENE_DRAW_SCRIPT_BANK                               ; LOAD BANK 7
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	JSR FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0                      ; FADE OUT PAL, CLEAR IRQ0 XSCROLL,COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES()
	MMC3_SRAM_WRITE_ENABLE 
	
@set_play_out_all_games_to_false:	
	LDA #$00                                                     ; SET PLAY OUT ALL GAMES FLAG TO OFF
	STA PLAY_OUT_ALL_GAMES_BOOL                                  ;
	MMC3_SRAM_WRITE_DISABLE
	
@return_to_season_menu_game_start:                               ; EXIT TO GAME START SEASON MENU IF PLAY ALL GAMES FLAG= OFF 
	LDA #$02                                                     ; SET SEASON MENU OPTION = GAME START  
	STA MENU_Y                                                   ;
	LDA #$00                                                     ;
	STA MENU_X                                                   ;
	JSR CHECK_IF_GAME_TYPE_SKIP_MODE                             ; IS GAME TYPE SKIP MODE () CS= IN SKIP CC= DONE OR NOT IN SKIP()
	BCS @do_next_skp_game_unless_b_held													 ;
	
@check_if_play_all_games_is_false:	
	LDA PLAY_OUT_ALL_GAMES_BOOL                                  ; IS PLAY OUT ALL GAMES FLAG = OFF
	BPL @redraw_season_menu                                       ; YES-> BRANCH TO JUMP TO REDRAW SEASON MENU
	JMP SEASON_GAME_START                                        ; NO->SEASON GAME START
	
@redraw_season_menu:                                             ; JUMP TO REDRAW SEASON MENU
	JMP REDRAW_SEASON_MENU_SCREEN_INIT_MENU                      ; JUMP TO RE-DRAW SEASON MENU
	
@do_next_skp_game_unless_b_held:
	BIT JOY_RAW_BOTH                                             ; IS JOY HELD = B
	BVS @draw_season_menu                                        ; YES-> DRAW SEASON MENU
	JSR SET_TEAMS_AND_CONTROL_TYPE_SEASON_GAME                   ; SET TEAMS AND PLAYER TYPES FOR SEASON GAME (MAN,COA,COM,SKP)
	LDA TEAM_CONTROL_TYPES                                       ; IS PLAYER TYPE = SKP VS SKP
	CMP #(P1_TEAM_SKP_CTRL + P2_TEAM_SKP_CTRL)                   ; 
	BNE @draw_season_menu                                        ; NO-> DRAW SEASON MENU
	JMP SEASON_GAME_START                                        ; NO->SEASON GAME START
	
@draw_season_menu:                                               ; DRAW SEASON MENU
	JMP REDRAW_SEASON_MENU_SCREEN_INIT_MENU                      ; JUMP TO RE-DRAW SEASON MENU

OFFSETS_FOR_PLAYOFF_WINNING_TEAMS_TABLE:                        ; SRAM OFFSETS FOR PLAYOFF WINNING TEAMS
	.DB (AFC_DIVISIONAL_TWO_AWAY_TEAM_ID - PLAYOFF_RESULTS_START[])
    .DB (NFC_DIVISIONAL_TWO_AWAY_TEAM_ID - PLAYOFF_RESULTS_START[]) 
	.DB (AFC_DIVISIONAL_ONE_AWAY_TEAM_ID - PLAYOFF_RESULTS_START[])
	.DB (NFC_DIVISIONAL_ONE_AWAY_TEAM_ID - PLAYOFF_RESULTS_START[])

	
	.DB ( AFC_CHAMP_HOME_TEAM_ID  - PLAYOFF_RESULTS_START[])
	.DB ( NFC_CHAMP_HOME_TEAM_ID  - PLAYOFF_RESULTS_START[])
	.DB ( AFC_CHAMP_AWAY_TEAM_ID  - PLAYOFF_RESULTS_START[])
	.DB ( NFC_CHAMP_AWAY_TEAM_ID  - PLAYOFF_RESULTS_START[])
	 
	.DB (SUPERBOWL_HOME_TEAM_ID -  PLAYOFF_RESULTS_START[])      ;  ALWAYS AFC TEAM 
	.DB (SUPERBOWL_AWAY_TEAM_ID -  PLAYOFF_RESULTS_START[])      ; ALWAYS  NFC TEAM
	.DB (PLAYOFF_TEAMS[] - PLAYOFF_RESULTS_START[])				; *** uneeded?  


_F}_DO_GAME_START_SEASON 

_F{_DO_GAME_START_PRO_BOWL										  ; DONE

low_byte_addr 						= LOCAL_7
SIZE_OF_IN_GAME_DATA				= P2_GAME_STATS_START - P1_GAME_STATS_START


PRO_BOWL_GAME_START:                                             ; PRO BOWL-GAME START
	MMC3_SRAM_WRITE_ENABLE

@clear_p1_game_stats:										     ; *** REDUNDANT
	LDA #<SIZE_OF_IN_GAME_DATA                                  ; SET SIZE TO CLEAR = 0X105 
	LDX #>SIZE_OF_IN_GAME_DATA                                  ;
	LDY #<P1_GAME_STATS_START                                    ;
	STY low_byte_addr                                            ; SET SRAM STARTING ADDRESS = 0x6406
	LDY #>P1_GAME_STATS_START                                    ;
	JSR CLEAR_RAM                                                ; CLEAR RAM LENGTH (X * 0x100 + A , $44,Y= DATA ADDR)

@clear_p2_game_stats:											; CLEAR P2 GAME INFO
	LDA #<SIZE_OF_IN_GAME_DATA                                  ; SET SIZE TO CLEAR = 0X105
	LDX #>SIZE_OF_IN_GAME_DATA                                  ;
	LDY #<P2_GAME_STATS_START                                    ;
	STY low_byte_addr                                            ; SET SRAM STARTING ADDRESS = 0x650B 
	LDY #>P2_GAME_STATS_START                                    ;
	JSR CLEAR_RAM                                                ; CLEAR RAM LENGTH (X * 0x100 + A , $44,Y= DATA ADDR
	MMC3_SRAM_WRITE_DISABLE
	
	JSR TRANSFER_SEASON_PRO_BOWL_INFO_TO_TEMP                    ; TRANSFER STARTERS AND PLAYBOOK TO SEASON STARTERS AND PLAYBOOK()
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	
@draw_pro_bowl_matchup_screen:	
	LDA #PROBOWL_LARGE_TXT_SCENE_ID                              ; LOAD PRO BOWL INTRO SCREEN ID
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; SET BANK = 8     
	JSR DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP
	JSR CLEAR_IN_GAME_TEAM_STATS                                 ; DO PROBOWL GAME()
	LDA #PRESEASON_PROBOWL_MENU_CHOICE                           ; SET Y MENU CHOICE = PRO BOWL
	STA MENU_Y                                                   ;
	LDA #$00                                                     ;
	STA MENU_X                                                   ;
	JMP DRAW_MAIN_MENU_INIT                                      ; JUMP TO MAIN MENU START

_F}_DO_GAME_START_PRO_BOWL 

_F{_DO_DRAW_SEASON_MENU_OFFSCREEN							      ; DONE	
	
DRAW_MAIN_MENU_ONSCREEN_SEASON_OFFSCREEN:                        ; DRAW MAIN MENU()
	DRAW_SCENE_UNTIL_ENDED[sceneId_sceneBank] SEASON_MENU_SCREEN_ID, MENU_DRAW_SCRIPT_BANK
	DRAW_SCENE_UNTIL_ENDED[sceneId_sceneBank] MAIN_MENU_SCREEN_ID, MENU_DRAW_SCRIPT_BANK
	LDA #NLF_LOGO_X_LOCATION_PRESEASON                           ; SET LOGO LOCATION =  RIGHT PART OF SCREEN
	JMP DRAW_NFL_SHIELD_SPRITES[x_offset]                        ; DRAW_MENU_NFL_LOGO (A= X LOCATION FOR LOGO



_F}_DO_DRAW_SEASON_MENU
	
_F{_SAVE_PART_OF_PRESEASON_SCREEN_SRAM							 ; DONE

ppu_addr									= LOCAL_1
sram_addr									= LOCAL_3

NUM_TILES_PER_ROW_TO_SAVE_MAIN_MENU			= $0F
NUM_ROWS_TO_SAVE_MAIN_MENU					= $0F	

NUM_TILES_PER_ROW_TO_SAVE_PRO_BOWL_MENU		= $0F
NUM_ROWS_TO_SAVE_PRO_BOWL_MENU				= $0F	
	
SAVE_PORTION_OF_MAIN_MENU_SRAM:                                  ; SAVE PART OF MAIN MENU IN SRAM AND LOAD PRESASON MENU UNTIL DESTROYED()
	LDA #<MAIN_MENU_TEXT_START_PPU_ADDR                          ; SET PPU ADDRESS = $2545
	STA ppu_addr                                                 ;
	LDA #>MAIN_MENU_TEXT_START_PPU_ADDR                          ;
	STA ppu_addr+1                                               ;
	LDA #<MAIN_MENU_SRAM                                         ;
	STA sram_addr                                                ;
	LDA #>MAIN_MENU_SRAM                                         ; SET SRAM ADDRESS = $6003
	STA sram_addr+1                                              ;
	LDX #NUM_TILES_PER_ROW_TO_SAVE_MAIN_MENU                     ; SET LENGTH = 15 TILES 
	LDY #NUM_ROWS_TO_SAVE_MAIN_MENU                              ; SET ROWS = 15 TILES
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                           ; SAVE PPU IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
	LDA #PRESEASON_MENU_SCREEN_ID                               ; LOAD PREASON MENU CUTSCENE ID 
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; LOAD BANK 16
	JMP DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)

_F}_SAVE_PART_OF_PRESEASON_SCREEN_SRAM 

_F{_SAVE_PART_OF_PRESEASON_PRO_BOWL_SCREEN_SRAM 				; DONE

SAVE_MENU_SRAM_DRAW_PB_SCREEN:                                   ; SAVE MAIN MENU TILES IN SRAM PRO-BOWL()
	LDA #<PRO_BOWL_MENU_PPU_ADDR	                             ; SET PPU ADDRESS = $25C5
	STA ppu_addr                                                 ;
	LDA #>PRO_BOWL_MENU_PPU_ADDR	                             ;
	STA ppu_addr+1                                               ;
	LDA #<PRO_BOWL_MENU_SRAM                                     ; 
	STA sram_addr                                                ;
	LDA #>PRO_BOWL_MENU_SRAM                                     ; SET SRAM ADDRESS = $6003   
	STA sram_addr+1                                                      ;
	LDX #NUM_TILES_PER_ROW_TO_SAVE_PRO_BOWL_MENU                 ; SET LENGTH = 15 TILES
	LDY #NUM_ROWS_TO_SAVE_PRO_BOWL_MENU                          ; SET ROWS = 15 TILES
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                           ; SAVE PPU IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
	LDA #PROBOWL_TEAM_TYPE_SCREEN_ID                             ; LOAD PRO BOWL BG SCREEN ID 
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; LOAD BANK 16
	JMP DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	
_F}_SAVE_PART_OF_PRESEASON_PROW_BOWL_SCREEN_SRAM
	
_F{_GET_AND_SET_P1_P2_TEAM_CONTROL_TYPES_SEASON					 ; DONE

current_team_control_type		= LOCAL_8

SET_TEAMS_AND_CONTROL_TYPE_SEASON_GAME:                         ; SET TEAMS AND PLAYER TYPES FOR SEASON GAME (MAN,COA,COM,SKP)
	LDA CURRENT_GAME_IN_WEEK                                     ; LOAD CURRENT GAME
	ASL                                                          ;
	TAX                                                          ;
	LDA WEEKLY_MATCHUPS_START,X                                  ; LOAD P1 TEAM FROM SRAM CURRENT WEEK MATCHUPS
	STA P1_TEAM                                                  ;
	LDA WEEKLY_MATCHUPS_START+1,X                                ; LOAD P2 TEAM FROM SRAM CURRENT WEEK MATCHUPS
	STA P2_TEAM      

SET_TEAMS_AND_CONTROL_TYPE_PLAYOFF_GAME:                               ; CHECK FOR P1 P2 TEAM SWAP AND LOAD TEAM PLAYER TYPES()
	LDX P1_TEAM                                                  ; LOAD P1 TEAM
	LDA TEAM_TYPE_SEASON,X                                       ; SAVE P1 PLAYER TYPE FROM SEASON TEAM TYPE (MAN, COA,COM,SKP)
	STA current_team_control_type                                ;
	LDX P2_TEAM                                                  ; LOAD P2 TEAM
	LDA TEAM_TYPE_SEASON,X                                       ;
	CMP current_team_control_type                                ; P2 PLAYER TYPE >= P1 PLAYER TYPE 
	BCS @set_team_control_normal                                 ;

@make_man_controlled_team_player_one							 ; MAKE MAN CONTROLLED TEAMS ALWAYS P1 SIDE
	LDX P1_TEAM                                                  ; SWAP PLAYER 2 TEAM WITH PLAYER 1 TEAM
	LDY P2_TEAM                                                  ; 
	STX P2_TEAM                                                  ;
	STY P1_TEAM                                                  ;
	JSR SET_IN_GAME_TEAM_CONTROL_TYPES                           ; SET P1 AND P2 TEAM PLAYER TYPES FROM SEASON TEAM PLAYER TYPE()
	SEC                                                          ; *** seems uneeded
	RTS                                                          ; RETURN

@set_team_control_normal:
	JSR SET_IN_GAME_TEAM_CONTROL_TYPES                           ; SET P1 AND P2 TEAM PLAYER TYPES FROM SEASON TEAM PLAYER TYPE()
	CLC                                                          ; *** seems uneeded
	RTS                                                          ; RETURN


	
SET_IN_GAME_TEAM_CONTROL_TYPES:                                  ; SET P1 AND P2 PLAYER TYPES FROM SEASON TEAM PLAYER TYPE()
	LDX P1_TEAM                                                  ; LOAD P1 TEAM
	LDA TEAM_TYPE_SEASON,X                                       ; LOAD P1 PLAYER TYPE FROM SEASON TEAM TYPE (MAN, COA,COM,SKP)
	SHIFT_LEFT_4                                                 ;
	LDX P2_TEAM                                                  ; LOAD P2 TEAM
	ORA TEAM_TYPE_SEASON,X                                       ; LOAD P2 PLAYER TYPE FROM SEASON TEAM TYPE (MAN, COA,COM,SKP)
	STA TEAM_CONTROL_TYPES                                       ; SAVE P1 AND P2 PLAYER TYPES
	RTS                                                          ; RETURN

_F}_GET_AND_SET_P1_P2_TEAM_CONTROL_TYPES_SEASON  

_F{_SAVE_PPU_TO_SRAM_WHEN_PPU_FREE								; DONE

SAVE_PARTIAL_SCREEN_BG_IN_SRAM:                                                       ; SAVE PPU IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
	MMC3_SRAM_WRITE_ENABLE 
	JSR TRANSFER_BUFFER_TO_SRAM                                                    ; SAVE PPU DATA IN SRAM (3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH)
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN
	
_F}__SAVE_PPU_TO_SRAM_WHEN_PPU_FREE
	
_F{_END_DRAWING_TASKS											; DONE

END_DRAW_FADE_OUT_STOP_SOUND_CLEAR_SCREEN:                       ; END TASKS, FADE OUT PALLETE, STOP MUSIC, CLEAR NAMETABLES, CLEAR SPRITES()
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	LDA #STOP_SONG_SOUND_ID                                                ;
	STA SOUND_ID_TO_PLAY                                         ;
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	JSR SET_ALL_SPR_OFFSCREEN                                    ; CLEAR SPRITES()
	RTS

END_ALL_DRAWING_TASKS_CLEAR_YSCROLL:                             ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	LDX #DRAW_SCRIPT_TASK                                        ; LOAD TASK 2 INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                   ; END TASK(X= TASK INDEX)
	LDX #BANNER_TASK                                             ; LOAD TASK 3 INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                   ; END TASK(X= TASK INDEX)
	LDX #DRAWING_TASK                                            ; LOAD TASK 4 INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                   ; END TASK(X= TASK INDEX)
	LDX #UPDATE_PALLETE_TASK                                     ; LOAD TASK 5 INDEX = FLASHING PALLETE
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                   ; END TASK(X= TASK INDEX)
	LDA #$00                                                     ; CLEAR Y SCROLL
	STA CURR_Y_SCROLL                                            ;
	STA CURR_Y_SCROLL+1                                          ;
	RTS                                                          ; RETURN

IN_GAME_CHANGE_PLAYERS:                                          ; JUMP FROM CHANGE PLAYER 
	LDA #$01                                                     ; SET SCREEN COMING FROM = CHANGE PLAYER
	JMP DO_OFFENSIVE_STARTERS                                    ; JUMP->DRAW OFFENSIVE STARTERS(A= SCREEN COMING FROM)

SWAP_BANK_THEN_DO_UPDATE_STARTERS:
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	JMP UPDATE_STARTERS_SRAM                                     ; UPDATE STARTERS IN SRAM()

_F}_END_DRAWING_TASKS 

_F{_PROWBOWL_CHANGE_PLAYER_DATA									; DONE
	
PRO_BOWL_PLAYER_OFFSET_TABLE:

AFC_PRO_BOWL_PLAYER_OFFSETS:                                                       ; OFFSET TO PRO BOWL PLAYERS 
.BYTE $00, $04, $06, $0C, $0E, $14, $18, $1A, $1C, $1E, $20, $22, $24

NFC_PRO_BOWL_PLAYER_OFFSETS:
.BYTE $26, $28, $2A, $2C, $2E, $30, $32, $34, $36, $38, $3A, $3C, $3E

PRO_BOWL_SUB_INFO_TABLE:                                        ; PROBOWL SUB INFO
																                ; STARTING ROSTER ID, NUMBER OF SUBS TO DRAW
	.BYTE $00,$02                                                ; QB 1
	.BYTE $00,$00                                                ; BLANK
	.BYTE $00,$02                                                ; QB 2
	.BYTE $00,$00                                                ; BLANK
	.BYTE $02,$04                                                ; RB 1
	.BYTE $11,$03                                                ; RE
	.BYTE $02,$04                                                ; RB 2
	.BYTE $11,$03                                                ; NT
	.BYTE $02,$04                                                ; RB 3
	.BYTE $11,$03                                                ; LE
	.BYTE $02,$04                                                ; RB 4
	.BYTE $14,$04                                                ; ROLB
	.BYTE $06,$04                                                ; WR1
	.BYTE $14,$04                                                ; RILB
	.BYTE $06,$04                                                ; WR2
	.BYTE $14,$04                                                ; LILB
	.BYTE $06,$04                                                ; WR 3
	.BYTE $14,$04                                                ; LOLB
	.BYTE $06,$04                                                ; WR 4
	.BYTE $18,$02                                                ; RCB
	.BYTE $0A,$02                                                ; TE 1
	.BYTE $18,$02                                                ; LCB
	.BYTE $0A,$02                                                ; TE2
	.BYTE $1A,$02                                                ; FS
	.BYTE $0C,$01                                                ; C
	.BYTE $1A,$02                                                ; SS
	.BYTE $0D,$02                                                ; LG
	.BYTE $00,$00                                                ; BLANK
	.BYTE $0D,$02                                                ; RG
	.BYTE $1C,$01                                                ; K
	.BYTE $0F,$02                                                ; LT
	.BYTE $00,$00                                                ; BLANK
	.BYTE $0F,$02                                                ; RT
	.BYTE $1D,$01                                                ; P

PROBOWL_MENU_INFO_PTR_TABLE:                                    ; PROBOWL PLAYER CHANGE NUMBER OF CHOICES
	.WORD SINGLE_PROBOWL_PLAYER_CHANGE_MENU_INFO                 ; 1 PLAYER  (C,P,K)
	.WORD TWO_PROBOWL_PLAYER_CHANGE_MENU_INFO                    ; 2 PLAYERS (QB,TE,G,T,CB,S)
	.WORD THREE_PROBOWL_PLAYER_CHANGE_MENU_INFO                   ; 3 PLAYERS (DL)
	.WORD FOUR_PROBOWL_PLAYER_CHANGE_MENU_INFO                   ; 4 PLAYERS (RB,WR,LB) 
	
SINGLE_PROBOWL_PLAYER_CHANGE_MENU_INFO:                                                       ; 1 PLAYER  (C,P,K)
	.BYTE $00,$00,$18                                            ; ARROW TILE, ARROW INVERT/PALETTE, ARROW X
	.BYTE $01                                                    ; NUMBER OF CHOICES
	.BYTE $20                                                    ; Y LOCATIONS 

TWO_PROBOWL_PLAYER_CHANGE_MENU_INFO:                                                       ; 2 PLAYERS (QB,TE,G,T,CB,S)
	.BYTE $00,$00,$18
	.BYTE $02                                                    ; NUMBER OF CHOICES
	.BYTE $20, $28                                               ; Y LOCATIONS

THREE_PROBOWL_PLAYER_CHANGE_MENU_INFO:                                                       ; 3 PLAYERS (DL)
	.BYTE $00,$00,$18
	.BYTE $03                                                    ; NUMBER OF CHOICES
	.BYTE $20, $28, $30                                          ; Y LOCATIONS

FOUR_PROBOWL_PLAYER_CHANGE_MENU_INFO:                           ; 4 PLAYERS (RB,WR,LB)
	.BYTE $00,$00,$18
	.BYTE $04                                                    ; NUMBER OF CHOICES
	.BYTE $20, $28, $30, $38                                     ; Y LOCATIONS

PRO_BOWL_TEAM_DATA_MENU_OPTIONS_DATA:                                       ; PRO_BOWL_TEAM_MENU_SELECT
	.BYTE $00,$00                                                ;  ARROW TILE, ARROW INVERT/PALETTE
	.BYTE $03,$02                                                ;  # Y CHOICES , #X CHOICES 
                                                                ;
                                                                ; ARROW LOCATIONS
	.BYTE $20,$10                                                ; PLAYER DATA
	.BYTE $20,$90                                                ; OF STARTERS
	.BYTE $28,$10                                                ; CHANGE PLAYERS
	.BYTE $28,$90                                                ; DF STARTERS
	.BYTE $30,$10                                                ; RESET PLAYERS
	.BYTE $30,$90                                                ; PLAY BOOKS 

		
PRO_BOWL_PLAYER_SELECT:                                         ; PRO_BOWL_PLAYER_SELECT
	.BYTE $00,$00                                                ; ARROW TILE, ARROW INVERT/PALETTE

																; PRO BOWL PLAYER ARROW LOCATIONS
																; Y,X
	.BYTE $11,$02                                                ; # Y CHOICES = 17, # X CHOICES = 2 
	.BYTE $58,$18                                                ; QB1 
	.BYTE $FF,$FF                                                ; EMPTY
	.BYTE $60,$18                                                ; QB2
	.BYTE $FF,$FF                                                ; EMPTY
	.BYTE $68,$18                                                ; RB1
	.BYTE $68,$98                                                ; RE
	.BYTE $70,$18                                                ; RB2
	.BYTE $70,$98                                                ; NT
	.BYTE $78,$18                                                ; RB3
	.BYTE $78,$98                                                ; LE
	.BYTE $80,$18                                                ; RB4
	.BYTE $80,$98                                                ; ROLB
	.BYTE $88,$18                                                ; WR1
	.BYTE $88,$98                                                ; RILB
	.BYTE $90,$18                                                ; WR2
	.BYTE $90,$98                                                ; LILB
	.BYTE $98,$18                                                ; WR3
	.BYTE $98,$98                                                ; LOLB
	.BYTE $A0,$18                                                ; WR4
	.BYTE $A0,$98                                                ; RCB
	.BYTE $A8,$18                                                ; TE1
	.BYTE $A8,$98                                                ; LCB
	.BYTE $B0,$18                                                ; TE2
	.BYTE $B0,$98                                                ; FS
	.BYTE $B8,$18                                                ; C
	.BYTE $B8,$98                                                ; SS
	.BYTE $C0,$18                                                ; RG
	.BYTE $FF,$FF                                                ; EMPTY
	.BYTE $C8,$18                                                ; LG
	.BYTE $C8,$98                                                ; K
	.BYTE $D0,$18                                                ; LT
	.BYTE $FF,$FF                                                ; EMPTY
	.BYTE $D8,$18                                                ; RT
	.BYTE $D8,$98                                                ; P 

PRO_BOWL_PLAYER_DATA_LEFTOVER_ARROW:                             ; PRO_BOWL_PLAYER_DATA_LEFTOVER_ARROW

							
	.BYTE $20,$00,$01,$10                                        ; Y, TILE, MIRROR/PAL, X

PRO_BOWL_CHANGE_PLAYERS_ARROW_SPR_TABLE:                         ; PRO_BOWL_CHANGE_PLAYERS_LEFTOVER_ARROW

	.BYTE $28,$00,$01,$10                                        ; Y, TILE, MIRROR/PAL, X

_F}_PROWBOWL_CHANGE_PLAYER_DATA

_F{_PLAYBOOK_CHANGE_DATA										; DONE

PLAYBOOK_SELECT_MENU_INFO:                                                       ; PLAYBOOK_SELECT CHOICES INFO
	.BYTE $00,$00                                                ; ARROW TILE, ARROW INVERT/PALETTE
	.BYTE $03,$04                                                ; # Y CHOICES , #X CHOICES

																; ARROW LOCATIONS
	.BYTE $F8,$00                                                ; RUN 1 
	.BYTE $F8,$00                                                ; RUN 2
	.BYTE $F8,$00                                                ; RUN 3
	.BYTE $F8,$00                                                ; RUN 4
	.BYTE $F8,$00                                                ; PASS 1
	.BYTE $F8,$00                                                ; PASS 2
	.BYTE $F8,$00                                                ; PASS 3
	.BYTE $F8,$00                                                ; PASS 4
	.BYTE $D8,$98                                                ; DATA RESET FROM PASS 1
	.BYTE $D8,$98                                                ; DATA RESET FROM PASS 2
	.BYTE $D8,$98                                                ; DATA RESET FROM PASS 3
	.BYTE $D8,$98                                                ; DATA RESET FROM PASS 4
	
_F}_PLAYBOOK_CHANGE_DATA

_F{_PRO_BOWL_RESET_DATA  										 ; DONE              

PRO_BOWL_RESET_WORDS_DATA:										  ; PRO_BOWL_RESET_WORDS
	.BYTE $08                                                    ; STRING LENGTH
	.BYTE "NO   YES"                                            ; STRING TEXT
	.BYTE $FF                                                    ; END OF STRING

PRO_BOWL_RESET_MENU_OPTIONS_DATA:								 ; PRO_BOWL_RESET_SELECT
	.BYTE $00,$00                                                ; ARROW TILE, ARROW INVERT/PALETTE
	.BYTE $01,$02                                                ; # Y CHOICES , #X CHOICES

																;  ARROW LOCATIONS
	.BYTE $38,$30                                                ;  NO
	.BYTE $38,$58                                                ;  YES
_F}_PRO_BOWL_RESET_DATA  
	
_F{_CHANGE_PLAYER												 ; DONE

ppu_addr								= LOCAL_1
sram_addr_reload						= LOCAL_1					; for reloading screen
sram_addr								= LOCAL_3
temp_roster_id							= LOCAL_6					; for drawing player data attributes
starter_id								= LOCAL_8

SIZE_OF_SKILL_CHANGE_PLAYER_STARTERS	= KR_STARTER_TEAM_ID_CHANGE_PLAYER -  QB_STARTER_TEAM_ID_CHANGE_PLAYER 
SIZE_OF_SKILL_CHANGE_PLAYER_RESERVES	= END_OF_CHANGE_PLAYER  - QB_RESERVE_TEAM_ID_CHANGE_PLAYER

SIZE_OF_STARTERS_CHANGE_PLAYER			= CHANGE_PLAYER_RESERVES[] - CHANGE_PLAYER_STARTERS[]
OFFSET_TO_RESERVES						= SIZE_OF_STARTERS_CHANGE_PLAYER
SIZE_OF_STARTER_RESERVE_CHANGE_PLAYER	= END_OF_CHANGE_PLAYER - CHANGE_PLAYER_STARTERS[]

TEAM_IDS_CHANGE_PLAYER[]										= QB_STARTER_TEAM_ID_CHANGE_PLAYER
ROSTER_IDS_CHANGE_PLAYER[]										= QB_STARTER_ROSTER_ID_CHANGE_PLAYER

NON_QB_STARTERS_TEAM_IDS_CHANGE_PLAYER[]						= RB1_STARTER_TEAM_ID_CHANGE_PLAYER
NON_QB_STARTERS_ROSTER_IDS_CHANGE_PLAYER[]						= RB1_STARTER_ROSTER_ID_CHANGE_PLAYER

.ENUM SEGMENT_VAR_8E
CHANGE_PLAYER_TEAM_DATA_FLAG		.dsb 1 
OFF_BASE_FORMATION_CHANGE_PLAYER	.dsb 1
OFFSET_TO_PLAYERS_CHANGE_PLAYER		.dsb 1
CURRENT_STARTER_Y_MENU_INDEX		.dsb 1


CHANGE_PLAYER_STARTERS[]			.dsb 0					 ;  92 
CHANGE_PLAYER_STARTER_RESERVE[]		.dsb 0					 ;  used when initialzing arrary
QB_STARTER_TEAM_ID_CHANGE_PLAYER	.dsb 1					 ;  92 
QB_STARTER_ROSTER_ID_CHANGE_PLAYER	.dsb 1					 ;  93

RB1_STARTER_TEAM_ID_CHANGE_PLAYER	.dsb 1					 ;  94 
RB1_STARTER_ROSTER_ID_CHANGE_PLAYER	.dsb 1					 ;  95
RB2_STARTER_TEAM_ID_CHANGE_PLAYER	.dsb 1
RB2_STARTER_ROSTER_ID_CHANGE_PLAYER	.dsb 1
WR1_STARTER_TEAM_ID_CHANGE_PLAYER	.dsb 1
WR1_STARTER_ROSTER_ID_CHANGE_PLAYER	.dsb 1
WR2_STARTER_TEAM_ID_CHANGE_PLAYER	.dsb 1
WR2_STARTER_ROSTER_ID_CHANGE_PLAYER	.dsb 1
TE_STARTER_TEAM_ID_CHANGE_PLAYER	.dsb 1
TE_STARTER_ROSTER_ID_CHANGE_PLAYER	.dsb 1
KR_STARTER_TEAM_ID_CHANGE_PLAYER	.dsb 1
KR_STARTER_ROSTER_ID_CHANGE_PLAYER	.dsb 1
PR_STARTER_TEAM_ID_CHANGE_PLAYER	.dsb 1
PR_STARTER_ROSTER_ID_CHANGE_PLAYER	.dsb 1

CHANGE_PLAYER_RESERVES[]			.dsb 0 

QB_RESERVE_TEAM_ID_CHANGE_PLAYER	.dsb 1						; A2
QB_RESERVE_ROSTER_ID_CHANGE_PLAYER	.dsb 1						; A3

RB1_RESERVE_TEAM_ID_CHANGE_PLAYER	.dsb 1						; A4
ROSTER_IDS_SKILL_RESERVES_CHANGE_PLAYER[]		.dsb 0				
RB1_RESERVE_ROSTER_ID_CHANGE_PLAYER	.dsb 1						; A5
RB2_RESERVE_TEAM_ID_CHANGE_PLAYER	.dsb 1
RB2_RESERVE_ROSTER_ID_CHANGE_PLAYER	.dsb 1
WR1_RESERVE_TEAM_ID_CHANGE_PLAYER	.dsb 1
WR1_RESERVE_ROSTER_ID_CHANGE_PLAYER	.dsb 1
WR2_RESERVE_TEAM_ID_CHANGE_PLAYER	.dsb 1
WR2_RESERVE_ROSTER_ID_CHANGE_PLAYER	.dsb 1
TE_RESERVE_TEAM_ID_CHANGE_PLAYER	.dsb 1
TE_RESERVE_ROSTER_ID_CHANGE_PLAYER	.dsb 1
END_OF_CHANGE_PLAYER				.dsb 0 
.ENDE 

MAX_STARTERS_TO_SET					= $07						 ; QB,RB,RB,WR,WR,TE,KR,PR	

TEAM_OFF_FORMATION_TWO_WR			= $00
TEAM_OFF_FORMATION_FOUR_WR 			= $01
TEAM_OFF_FORMATION_THREE_WR 		= $02

LENGTH_OF_RESET_STARTER_OVERLAY		= $0A
HEIGHT_OF_RESET_STARTER_OVERLAY		= $08

STARTERS_TEXT_SPR_X_LOC				= $10
PLAYERS_TEXT_SPR_X_LOC				= $20



DO_OFFENSIVE_STARTERS:                                           ; DRAW OFFENSIVE STARTERS(A= SCREEN COMING FROM)
	STA CHANGE_PLAYER_TEAM_DATA_FLAG                              ; SAVE IF COMING FROM CHANGE PLAYER OR TEAM DATA
	LDA #$00                                                     ; SET Y,X MENU ARROW LOCATOINS = FIRST OPTION
	STA MENU_Y
	STA MENU_X

CHANGE_OFFENSIVE_STARTERS_LOOP:                                  ; DRAW OFFENSIVE STARTERS MENU AND SCREEN COMING FROM SET ALREADY
	LDY #TEAM_OFF_FORMATION_THREE_WR                             ; SET FORMATION = 3 WR
	LDA CURRENT_TEAM                                             ; IS CURRENT TEAM = SAN DIEGO
	CMP #SD_TEAM_ID                                              ;
	BEQ @save_formation                                          ; YES-> DRAW STARTERS
	CMP #WAS_TEAM_ID                                              ; CURRENT TEAM = WASHINGTON?    
	BEQ @save_formation                                          ; YES-> DRAW STARTERS
	CMP #PHX_TEAM_ID                                                 ; CURRENT TEAM = PHOENIX?
	BEQ @save_formation                                          ; YES-> DRAW STARTERS
	DEY                                                          ; SET FORMATION = 4 WR
	CMP #HOU_TEAM_ID                                                 ; CURRENT TEAM = HOUSTON?
	BEQ @save_formation                                          ; YES-> DRAW STARTERS
	CMP #DET_TEAM_ID                                                 ; CURRENT TEAM = DETROIT?
	BEQ @save_formation                                          ; YES-> DRAW STARTERS
	CMP #ATL_TEAM_ID                                                 ; CURRENT TEAM = ATLANTA?
	BEQ @save_formation                                          ; YES-> DRAW STARTERS
	DEY                                                          ; SET FORMATION = 2 WR

@save_formation:                                                 ; DRAW STARTERS
	STY OFF_BASE_FORMATION_CHANGE_PLAYER                         ; SAVE FORMATION
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; = CHANGE PLAYER OR TEAM DATA OFFSET
	ASL                                                          ;
	CLC                                                          ;
	ADC CHANGE_PLAYER_TEAM_DATA_FLAG                             ;
	CLC                                                          ;
	ADC #OFF_STARTERS_2WR_SCREEN_ID                              ; + OFFSET TO FORMATION BACKGROUND SCREEN
	CLC                                                          ;
	ADC OFF_BASE_FORMATION_CHANGE_PLAYER                         ; + FORMATION TYPE
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                         ; START DRAWING TASK SWAP $A000 BANKS AND SET TO 8X8 TEXT (A= DRAW EVENT, X = BANK)
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM 
	CLC                                                          ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                          ; + OFFSET TO TEAM CITY
	LDY #<TEAM_DATA_TEAM_NAME_PPU_ADDR                           ; SET PPU ADDR = $2054 = TEAM CITY LOCATION
	LDX #>TEAM_DATA_TEAM_NAME_PPU_ADDR                           ;
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT                            ; DRAW ABREV TEAM, CITY, OR CONFERENCE (X,Y =PPUADDRESS, A= TEAM ID)
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2                     ;
	JSR DRAW_OFF_STARTERS_RESERVES_TEXT                          ; SET AND DRAW STARTERS AND RESERVES()
	LDA #$00                                                     ; SET IRQ SPLIT 0 COUNTER = ZERO
	STA IRQ_0_COUNTER                                            ;
	LDA #OFF_STARTERS_BG_PAL_INDEX                               ; SET OF STARTER SCREEN BG PALLETE
	LDX #OFF_STARTERS_SPR_PAL_INDEX                              ; SET OF STARTER SCREEN SPR PALLETE
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	
@blink_starter_number:	
	LDA #$03                                                     ; = INDEX TO STARTER SPRITE 
	JSR BANK_SWAP_DO_BLINKING_PALLETE                            ; BLINK SPRITE (A= SPRITE INDEX)
	BIT SUB_CONTROL_TYPE                                         ; IS COM SUBBING PLAYERS?
	BPL MAN_SUBBING_OFFENSIVE_STARTERS                           ; NO->
	JMP COM_SUBBING_OFF_STARTERS                                 ; YES->COM SUBBING PLAYERS

MAN_SUBBING_OFFENSIVE_STARTERS:                                  ; MAN/COA SET ARROW LOCATION OFFENSIVE STARTERS
	JSR SET_STARTER_ARROW_SPR_LOCATION                           ; SET STARTER ARROW LOCATION()

CHANGE_PLAYERS_INPUT_LOOP:                                       ; CHANGE PLAYERS INPUT LOOP
	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; COMING FROM IN GAME CHANGE PLAYER?
	LSR                                                          ;
	BCS @update_menu_arrow                                       ; YES-> UPDATE MENU ARROW LOCATION OFFENSIVE STARTERS

@set_menu_arrow_x_to_player	
	LDA #PLAYERS_TEXT_SPR_X_LOC                                  ; SET MENU ARROW X LOC = PLAYERS
	LDX MENU_Y                                                   ; IS MENU CHOICE PLAYER?
	BNE @save_menu_arrow_x                                       ; YES->SET START ARROW X LOCATION

@set_arrow_to_starters:	
	LDA #STARTERS_TEXT_SPR_X_LOC                                 ; SET MENU ARROW X LOC = STARTERS TEXT

@save_menu_arrow_x:                                              ; SET START ARROW X LOCATION
	STA MENU_ARROW_SPR_X                                         ;

@update_menu_arrow:                                              ; UPDATE MENU ARROW LOCATION OFFENSIVE STARTERS
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	JSR BLINK_STARTER_NUM_ON_FORMATION_IMAGE                     ; FLASH STARTER NUMBER ON OFFENSIVE FORMATION IMAGE()
	LDA JOY_PRESS_BOTH                                           ; CHECK FOR P1/P2 START BUTTON PRESS
	AND #START_BUTTON                                            ; START PRESSED?
	BEQ @check_for_b                                             ; NO-> BRANCH TO CHECK FOR B BUTTON
	JMP DRAW_PLAYER_SCREEN_OF_OFF_PLAYER_SELECTED                ; YES->BRANCH TO DRAW STARTER SELECTED

@check_for_b:                                                    ; CHECK FOR B BUTTON
	BIT JOY_PRESS_BOTH                                          ; 
	BVC @check_for_a                                                   ; B PRESSED? NO-> CHECK FOR A BUTTON
	JMP EXIT_OFFENSIVE_STARTERS                                  ; YES->EXIT OFFENSIVE STARTERS

@check_for_a:                                                    ; CHECK FOR A BUTTON
	BPL CHANGE_PLAYERS_INPUT_LOOP                                ; A PRESSED? NO-> CHANGE PLAYERS INPUT LOOP
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; COMING FROM IN GAME CHANGE PLAYER?
	LSR                                                          ;
	BCC @a_pressed_on_team_data                                  ; NO-> TEAM DATA OFFENSIVE STARTERS A PRESSED
	JMP @in_game_player_selected                                 ; YES->IN GAME PLAYER SELECTED

@a_pressed_on_team_data:                                         ; TEAM DATA OFFENSIVE STARTERS A PRESSED
	LDA MENU_Y                                                   ; IS ARROW ON RESET STARTERS?
	ORA MENU_X                                                   ;
	BEQ @draw_reset_starter_yes_no                               ; YES->DRAW RESET STARTER YES/NO CHOICE
	JMP @sub_player_selected                                     ; JUMP-> A PRESSED ON SUB PLAYER;

@draw_reset_starter_yes_no:                                      ; DRAW RESET STARTER YES/NO CHOICE
	
@save_part_of_current_screen:	
	LDA #SPRITE_OFFSCREEN                                               ; SET ARROW SPRITE Y = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	LDA #<STARTERS_RESET_AREA_PPU_ADDR                           ; SET PPU ADDR = $2142
	STA ppu_addr                                                 ;
	LDA #>STARTERS_RESET_AREA_PPU_ADDR                           ;
	STA ppu_addr+1                                               ;
	LDA #<RESET_STARTERS_SRAM                                    ; SET SRAM ADDR = $6003
	STA sram_addr                                                ;
	LDA #>RESET_STARTERS_SRAM                                    ;
	STA sram_addr+1                                              ;
	LDX #LENGTH_OF_RESET_STARTER_OVERLAY                                                     ; SET LENGTH = 10 TILES 
	LDY #HEIGHT_OF_RESET_STARTER_OVERLAY                                                    ; SET ROWS = 8 ROWS
	JSR SAVE_PARTIAL_SCREEN_BG_IN_SRAM                           ; SAVE PPU DATA IN SRAM WHEN READY(3E,3F= PPU ADDRESS,40,41= SRAM ADDRESS, X,Y= DATA LENGTH )
	
@draw_message:	
	LDA #OFF_STARTER_RESET_SCREEN_ID                              ; SET BG SCREEN = DRAW OF STARTER RESET MENU
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                         ; START DRAWING TASK SWAP $A000 BANKS AND SET TO 8X8 TEXT (A= DRAW EVENT, X = BANK)
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	LDY #<STARTER_RESET_SELECT_MENU_DATA                         ; LOAD STARTER RESET MENU INFO
	LDX #>STARTER_RESET_SELECT_MENU_DATA                         ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	
_WHILE PLUS                                                         ; STARTER RESET INPUT LOOP

	RETURN_1_FRAME  
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; B PRESSED
	BVS @return_from_reset_starters                              ; YES->RETURN FROM RESET STARTERS

_END_WHILE                                                       ; A PRESSED? NO-> STARTER RESET INPUT LOOP
	
	LDA MENU_Y                                                   ; NO SELECTED->RETURN FROM RESET STARTERS
	BEQ @return_from_reset_starters                              ;     
	LDA CURRENT_TEAM                                             ; IS CURRENT TEAM = PRO-BOWL TEAM
	CMP #AFC_TEAM_ID                                             ;
	BCS @reset_afc_pro_bowl_starters                            ; YES->RESET PROBOWL STARTERS
	
	JSR UPDATE_STARTERS_SRAM                                     ; UPDATE STARTERS IN SRAM()
	JSR SET_CUR_STARTERS_PLAYBOOKS_TO_SEASON                     ; SET DEFAULT STARTERS AND PLAYBOOKS()
	JMP @return_from_reset_starters                              ; JUMP->RETURN FROM RESET STARTERS

@reset_afc_pro_bowl_starters:                                                         ; RESET PROBOWL STARTERS
	BNE @reset_nfc_pro_bowl_starters                                                  ; IS PRO BOWL TEAM NFC? YES->RESET NFC PRO BOWL STARTERS
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_DEFAULT_PLAYBOOK_STARTERS_BANK,BANK_JUMP_SAVE_DEFAULT_AFC_PLAYERS_W_CHECKSUM ; *** can use actual addr  
	JMP @save_pro_bowl_starters

@reset_nfc_pro_bowl_starters:                                                         ; RESET NFC PRO BOWL STARTERS
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] SET_DEFAULT_PLAYBOOK_STARTERS_BANK,BANK_JUMP_SAVE_DEFAULT_NFC_PLAYERS_W_CHECKSUM ; *** can use actual addr 


@save_pro_bowl_starters:                                                         ; SET PRO BOWL STARTERS AND PLAYBOOKS
	JSR TRANSFER_SEASON_PRO_BOWL_INFO_TO_TEMP                    ; TRANSFER STARTERS AND PLAYBOOK TO SEASON STARTERS AND PLAYBOOK()

@return_from_reset_starters:                                     ; RETURN FROM RESET STARTERS
	LDY #<STARTERS_RESET_AREA_PPU_ADDR                           ; SET PPU ADDR = $2142
	LDX #>STARTERS_RESET_AREA_PPU_ADDR                           ;
	LDA #<RESET_STARTERS_SRAM                                    ; SET SRAM ADDR = $6003 
	STA sram_addr_reload                                         ;
	LDA #>RESET_STARTERS_SRAM                                    ;
	STA sram_addr_reload+1                                       ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()
	LDA #$00                                                     ; SET Y MENU = FIRST CHOICE = RESET STARTERS
	STA MENU_Y                                                   ;
	JSR DRAW_OFF_STARTERS_RESERVES_TEXT                          ; SET AND DRAW STARTERS AND RESERVES() 
	LDA #$03                                                     ; LOAD OFFSET TO SPRITE TO BLINK
	JSR BANK_SWAP_DO_BLINKING_PALLETE                            ; BLINK SPRITE (A= SPRITE INDEX)
	JMP MAN_SUBBING_OFFENSIVE_STARTERS                           ; JUMP-> MAN/COA SET ARROW LOCATION STARTERS

@sub_player_selected:                                            ; A PRESSED ON SUB PLAYER
	LDA MENU_Y                                                   ; CONVERT MENU INDEX TO POSITION ID 
	SEC                                                          ;
	SBC #$01                                                     ;
	JMP @save_starter_id                                         ;
	
@in_game_player_selected:                                        ; IN GAME PLAYER SELECTED
	LDA MENU_Y                                                   ; LOAD POSITION ID
	
@save_starter_id:                                                ; SAVE POSITION ID AND CHECK FOR KR/PR  
	STA starter_id                                               ;
	CMP #TE1_STARTER_ID +1                                       ; IS POSITION = KR/PR
	BCC @skill_player_selected                                   ; NO-> IN GAME SKILL PLAYER SELECTED
	JMP @kr_pr_selected                                          ; YES-> KR,PR SELECTED

@skill_player_selected:                                          ; CHECK FOR RB,WR,TE SELECTED
	CMP #RB1_STARTER_ID                                          ; IS POSITION >=RB,WR,TE 
	BCS @skill_player_selected_in_game                            ; YES-> RB, WR, TE SLECTED IN GAME
	
@check_if_reserve_qb_is_injured:	
	LDA QB_RESERVE_ROSTER_ID_CHANGE_PLAYER                       ; IS QB RESERVE = INJURED? 
	BMI @set_starter_arrow_offscreen                             ; YES->SET MENU Y = OFFSCREEN AND RETURN TO INPUT LOOP
	JSR SET_STARTER_MENU_ARROW_TO_BLUE_MOVE_TO_SECOND_SPRITE     ; SET STARTER ARROW TO BLUE, TRNASFER TO 2ND SPRITE()
	
	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] QB_RESERVE_ARROW_SPR_DATA, MENU_ARROW_SPR_INFO, $04


_WHILE PLUS                                                      ; QB SELECTED TO CHANGE INPUT LOOP

	RETURN_1_FRAME  
	BIT JOY_PRESS_BOTH                                           ; IS B PRESSED? 
	BVS @set_starter_arrow_offscreen                             ; YES-> SET MENU Y = OFFSCREEN AND RETURN TO INPUT LOOP
	
_END_WHILE                                                       ; A PRESSED? NO->PLAYER SELECTED TO CHANGE INPUT LOOP

	LDX #$00                                                     ; SET STARTER INDEX = QB
	LDY #$00                                                     ; SET RESERVE INDEX = QB
	JSR SWAP_STARTER_WITH_RESERVE                                ; SWAP STARTER WITH RESERVE(X= STARTER INDEX, Y= RESERVE INDEX)
	JSR TRANSFER_TEMP_STARTERS_TO_IN_GAME_STARTERS               ; TRANSFER TEMP OFFENSIVE STARTERS TO P1 IN GAME OFFENSIVE STARTERS()

@set_starter_arrow_offscreen:                                    ; SET SUB ARROW Y = OFFSCREEN AND RETURN TO OFFENSIVE STARTER LOOP
	LDA #SPRITE_OFFSCREEN                                               ; SET BLUE STARTER ARROW = OFFCREEN
	STA SECOND_MENU_ARROW_SPR_Y	                                 ;
	JMP MAN_SUBBING_OFFENSIVE_STARTERS                           ; JUMP-> MAN/COA SET ARROW LOCATION OFFENSIVE STARTERS

@skill_player_selected_in_game:                                  ; RB, WR, TE SLECTED IN GAME
	JSR CHECK_IF_ALL_RESERVES_INJURED                            ; CHECK IF ALL POSSIBLE SKILL PLAYER SUBS INJURED() C= SET IF ALL INJURED
	BCC @set_starter_arrow_to_blue_init_reserve_arrow            ; NOT ALL INJURED->
	JMP MAN_SUBBING_OFFENSIVE_STARTERS                           ; YES-> MAN/COA SET ARROW LOCATION OFFENSIVE STARTERS

@set_starter_arrow_to_blue_init_reserve_arrow:                                                         ;
	JSR SET_STARTER_MENU_ARROW_TO_BLUE_MOVE_TO_SECOND_SPRITE     ; SET STARTER ARROW TO BLUE, TRANSFER TO 2ND SPRITE()
	LDA MENU_Y                                                   ; SET STARTER BEING SUBBED FOR  =  STARTER ARROW Y CHOICE
	STA CURRENT_STARTER_Y_MENU_INDEX                             ; 
	LDA #$00                                                     ; SET ARROW Y = FIRST SUB CHOICE
	STA MENU_Y                                                   ;
	JSR ADJUST_SUB_ARROW_LOC_IF_SUB_INJURED                      ; ADJUST INITIAL PLAYER SUB ARROW LOCATION IF SUB INJURED()
	JSR SET_RESERVE_ARROW_BASED_ON_FORMATION                     ; SET RESERVE ARROW LOCATION BASED ON FORMATION()

@skill_player_sub_input_loop:                                                         ; SKILL PLAYER SUB INPUT CHECK LOOP
	RETURN_1_FRAME  

_WHILE MINUS                                                     ; CHECK FOR UP OR DOWN

	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 
	LDA MENU_Y                                                   ; CHECK IF NEW PLAYER SELECTION = INJURED
	ASL                                                          ;
	TAX                                                          ;
	LDA ROSTER_IDS_SKILL_RESERVES_CHANGE_PLAYER[],X              ; RESERVE PLAYER INJURED?
	
_END_WHILE                                                      ; YES->CHECK FOR UP OR DOWN
	
	
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT  JOY_PRESS_BOTH                                          ; B PRESSED?
	BVC @check_a_press                                           ; NO->CHECK FOR A PRESSED ON SKILL PLAYER SUB
	JMP @return_arrow_to_starter                                 ; YES-> JUMP RETURN ARROW TO STARTER

@check_a_press:                                                         ; CHECK FOR A PRESSED ON SKILL PLAYER SUB
	BPL @skill_player_sub_input_loop                             ; A PRESSED? NO->SKILL PLAYER SUB INPUT CHECK LOOP
	LDX MENU_Y                                                   ; LOAD MENU Y CHOICE
	LDY CURRENT_STARTER_Y_MENU_INDEX                             ; LOAD STARTER BEING SUBBED FOR
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; COMING FROM IN GAME CHANGE PLAYER? 
	BNE @swap_starter_with_sub                                   ; YES->SWAP STARTER WITH SUB
	DEY                                                          ; STARTER BEING SUBBED FOR-- IF ON OFFENSIVE STARTERS TO ACCOUNT FOR RESET OPTION 

@swap_starter_with_sub:                                           ; SWAP STARTER WITH SUB
	INX                                                          ; MENU Y CHOICE++ SINCE QB NOT OPTION
	JSR SWAP_STARTER_WITH_RESERVE                                ; SWAP STARTER WITH RESERVE(X= STARTER INDEX, Y= RESERVE INDEX)
	JSR TRANSFER_TEMP_STARTERS_TO_IN_GAME_STARTERS               ; TRANSFER TEMP OFFENSIVE STARTERS TO P1 IN GAME OFFENSIVE STARTERS()
	JMP @return_arrow_to_starter                                 ;
	
@kr_pr_selected :                                                ; KR,PR SELECTED
	JSR SET_STARTER_MENU_ARROW_TO_BLUE_MOVE_TO_SECOND_SPRITE     ; SET STARTER ARROW TO BLUE, TRANSFER TO 2ND SPRITE()
	LDA MENU_Y                                                   ; SAVE STARTER SELECTED
	STA CURRENT_STARTER_Y_MENU_INDEX                             ;
	JSR SET_KR_PR_RESERVE_MENU_DATA_ADDR_BASED_ON_FORMATION      ; SET KICK/PUNT RETURNER RESERVE ARROW MENU ADDRESSES BASED ON FORMATION()
	LDY RETURNER_MENU_ADDR[]                                     ; LOAD KR/PR RESERVE MENU Y LOC
	LDX RETURNER_MENU_ADDR[]+1                                   ; LOAD KR/PR RESERVE MENU X LOC
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX= P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	LDA #$01                                                     ; SET X MENU INDEX = RESERVE
	STA ON_RESERVES_BOOL                                         ;
	JSR CHECK_IF_ALL_RESERVES_INJURED                            ; CHECK IF ALL POSSIBLE SKILL PLAYER SUBS INJURED() C= SET IF ALL INJURED
	BCC @init_kr_pr_sub_arrow                                    ; NOT ALL INJURED-> MOVE SUB ARROW FOR KR,PR INPUT LOOP
	DEC ON_RESERVES_BOOL                                         ; SET X MENU INDEX = STARTERS

@init_kr_pr_sub_arrow:                                           ; INITALIZE SUB ARROW FOR KR,PR
	RETURN_1_FRAME  
	JSR UPDATE_MENU_ARROW_KR_PR_SUB                              ; UPDATE MENU ARROW FOR KR/PR SUB()
	
_WHILE EQUAL                                                      ; KR AND PR SUB CHECK FOR INPUT LOOP
	JSR CHECK_MENU_ARROW_UP_DOWN                                 ; CHECK FOR MOVE MENU ARROW UP DOWN() 

@convert_menu_index_to_chnage_player_index:                      ; CONVERT MENU VALUES TO STARTER INDEX AND CHECK FOR INJURED PLAYER
	LDA MENU_X                                                   ; CONVERT MENU VALUES TO STARTER INDEX
	ASL                                                          ;
	ASL                                                          ;
	ASL                                                          ;
	CLC                                                          ;
	ADC MENU_Y                                                   ;
	ASL                                                          ;
	TAX                                                          ; SAVE STARTER INDEX IN X
	LDA NON_QB_STARTERS_ROSTER_IDS_CHANGE_PLAYER[],X             ; IS PLAYER INJURED? 
	BPL @update_menu_arrow_save_player_in_in_game_starters       ; NO-> UPDATE ARROW SPRITE, STARTER AND SAVE IN GAME STARTER INFO
	LDA JOY_PRESS_BOTH                                           ; DOES P1 OR P2 BUTTON PRESS = LEFT OR RIGHT?
	AND #(LEFT_DPAD + RIGHT_DPAD)                                ;
	
_END_WHILE

	INC MENU_Y                                                   ; MENU Y INDEX++ TO MOVE PAST INJURED PLAYER
	JMP @convert_menu_index_to_chnage_player_index               ; JUMP-> CONVERT MENU VALUES TO STARTER INDEX AND CHECK FOR INJURED PLAYER

@update_menu_arrow_save_player_in_in_game_starters:              ; UPDATE ARROW SPRITE, STARTER AND SAVE IN GAME STARTER INFO
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	BIT JOY_PRESS_BOTH                                           ; B PRESSED? 
	BVS @return_arrow_to_starter                                  ; YES-> RETURN TO ARROW TO STARTER
	BPL @init_kr_pr_sub_arrow                                    ; A PRESSED? NO->MOVE SUB ARROW INPUT LOOP
	JSR COPY_PLAYER_TO_KR_OR_PR_SPOT                             ; COPY PLAYER TO KR/PR SPOT()
	JSR TRANSFER_TEMP_STARTERS_TO_IN_GAME_STARTERS               ; TRANSFER TEMP OFFENSIVE STARTERS TO P1 IN GAME OFFENSIVE STARTERS()

@return_arrow_to_starter:                                        ; RETURN TO ARROW TO STARTER 
	LDA CURRENT_STARTER_Y_MENU_INDEX                             ; RESTORE MENU Y CHOICE
	STA MENU_Y                                                   ;
	LDA #$00                                                     ; SET MENU X = STARTERS
	STA MENU_X                                                   ;
	LDA #SPRITE_OFFSCREEN                                               ; SET 2ND ARROW Y LOC = OFFSCREEN 
	STA SECOND_MENU_ARROW_SPR_Y                                  ;
	JMP MAN_SUBBING_OFFENSIVE_STARTERS                           ; JUMP-> MAN/COA SET ARROW LOCATION STARTERS

DRAW_PLAYER_SCREEN_OF_OFF_PLAYER_SELECTED:                       ; DRAW PLAYER SCREEN OF STARTER SELECTED
	LDX MENU_Y                                                   ; LOAD POSITION SELECTED
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; COMING FROM IN GAME CHANGE PLAYER? 
	BNE @start_pressed_on_player                                ; YES->START PRESSED TO CHECK PLAYER
	
@adjust_index_for_team_data	
	DEX                                                          ; POSITION SELECTED--
	BPL @start_pressed_on_player                                 ; IF ON PLAYER->START PRESSED TO CHECK PLAYER (X= STARTER ID)
	JMP CHANGE_PLAYERS_INPUT_LOOP                                ; START PRESSED ON STARTERS TEXT? YES-> CHANGE PLAYERS INPUT LOOP

@start_pressed_on_player:                                        ; START PRESSED TO CHECK PLAYER (X= STARTER ID)
	TXA                                                          ; SHIFT SINCE EACH PLAYER IS TWO BYTES (TEAM, STARTER ID)
	ASL                                                          ; 
	TAX                                                          ; SAVE STARTER INDEX
	LDA CURRENT_TEAM                                             ; SAVE CURRENT TEAM
	PHA                                                          ;
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; SAVE WHERE COMING FROM (IN-GAME CHANGE PLAYER OR TEAM DATA)
	PHA                                                          ;
	LDA CHANGE_PLAYER_STARTERS[],X                               ; SET CURRENT TEAM = STARTER TEAM
	STA CURRENT_TEAM                                             ;
	LDA CHANGE_PLAYER_STARTERS[]+1,X                             ; SET ROSTER ID = STARTER ROSTER ID
	STA temp_roster_id                                           ;
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] DRAW_PLAYER_ATTRIBUTES_BANK, BANK_JUMP_DRAW_PLAYER_DATA_SCREEN ; *** can use actual addr  
	PLA                                                          ;
	STA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; RESTORE WHERE COMING FROM (IN-GAME CHANGE PLAYER OR TEAM DATA)
	PLA                                                          ;
	STA CURRENT_TEAM                                             ; RESTORE CURRENT TEAM
	JMP CHANGE_OFFENSIVE_STARTERS_LOOP                           ; JUMP->DRAW OFFENSIVE STARTERS (MENU AND SCREEN COMING FROM SET ALREADY)

_F}_CHANGE_PLAYER

_F{_EXIT_OFFENSIVE_STARTERS										; DONE

STARTER_CHANGE_PLAYER_ROSTER_IDS[]	= QB_STARTER_ROSTER_ID_CHANGE_PLAYER

EXIT_OFFENSIVE_STARTERS:                                         ; B PRESSED EXIT OFFENSIVE STARTERS
	LDX #$00                                                     ; SET STARTER INDEX= FIRST STARTER
	
_WHILE CC                                                        ; CHECK IF ANY STARTERS ARE INJURED LOOP
	LDA STARTER_CHANGE_PLAYER_ROSTER_IDS[],X                     ; LOAD STATUS + ROSTER ID 
	BPL @go_to_next_starter                                      ; IS PLAYER INJURED
	JMP MAN_SUBBING_OFFENSIVE_STARTERS                           ; YES-> MAN/COA SET ARROW LOCATION STARTERS

@go_to_next_starter:
	INX                                                          ; STARTER INDEX += OFFSET TO NEXT PLAYER
	INX                                                          ;
	CPX #SIZE_OF_STARTERS_CHANGE_PLAYER                          ; AT LAST STARTER?
	
_END_WHILE                                                       ; NO-> CHECK IF ANY STARTERS ARE INJURED LOOP
	LDX #UPDATE_PALLETE_TASK                                     ; SET TASK INDEX = FLASHING PALLETE
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                   ; END TASK(X= TASK INDEX)
	RTS                                                          ; RETURN

_F}_EXIT_OFFENSIVE_STARTERS

_F{_COM_SUB_FOR_INJURED_PLAYER									; DONE

offset_addr					=   LOCAL_1
STARTER_ROSTER_IDS[]		=	QB_STARTER_ROSTER_ID_CHANGE_PLAYER

COM_SUBBING_OFF_STARTERS:                                        ; COM SUBBING PLAYERS
	JSR SET_STARTER_ARROW_SPR_LOCATION                           ; SET STARTER ARROW LOCATION()
	RETURN_IN_NUM_FRAMES 30                                      ; 0.5 sec
	LDA MENU_Y                                                   ; SAVE STARTER SLECTED
	STA CURRENT_STARTER_Y_MENU_INDEX                             ;
	JSR SET_KR_PR_RESERVE_MENU_DATA_ADDR_BASED_ON_FORMATION      ; SET KICK/PUNT RETURNER RESERVE ARROW MENU ADDRESSES BASED ON FORMATION()
	
_WHILE ALWAYS                                                    ; COM CHECK FOR INJURED STARTER SUB LOOP
	LDA CURRENT_STARTER_Y_MENU_INDEX                             ; CONVERT MENU CHOICE TO TEMP STARTER ARRAY INDEX 
	ASL                                                          ;
	TAX                                                          ;
	LDA_ABS_X_ZP STARTER_ROSTER_IDS[]                            ; *** can fix to use regular instruction IS STARTER INJURED
	BMI @com_sub_injured_starter                                 ; YES->COM SUB INJURED STARTER
	JMP @com_check_next_player_injured                           ; NO->COM CHECK NEXT PLAYER EXIT IF ALL CHECKED

@com_sub_injured_starter:                                        ; COM SUB INJURED STARTER
	TXA                                                          ;
	BEQ @com_subs_qb                                            ; IS STARTER INDEX = QB? YES->COM SUB FOR INJURED QB
	
	
	LDY OFF_BASE_FORMATION_CHANGE_PLAYER                         ; IS FORMATION TYPE = 2 WR
	BEQ @set_sub_table_addr                                      ; 
	
	CLC                                                          ;
	ADC #OFFSET_TO_THREE_FOUR_WR_COM_SUB_TABLE                   ; = OFFSET FOR 3 AND 4 WR FORMATIONS

@set_sub_table_addr:                                             ; 
	TAX
	LDA COM_SUB_RESERVE_CHOICE_OFFSET_TABLES,X                   ; LOAD COM SUB RESERVE OFFSET POINTER FROM COM SUB RESERVE OFFSET POINTER TABLE
	STA offset_addr                                              ;
	LDA COM_SUB_RESERVE_CHOICE_OFFSET_TABLES+1,X                 ;
	STA offset_addr+1                                            ;
	
	LDY #$00                                                     ; SET SUB INDEX = FIRST SUB
@loop_until_find_non_injured_sub:                                ;
	LDA (offset_addr),Y                                          ; LOAD RESERVE INDEX FROM POINTER 
	TAX                                                          ;
	LDA STARTER_ROSTER_IDS[],X                                   ; LOAD RESERVE PLAYER
	BPL @check_player_starter_or_reserve                         ; INJURED? NO->
	INY                                                          ; SUB INDEX++
	JMP @loop_until_find_non_injured_sub                         ;
	
@check_player_starter_or_reserve:                                ;
	TXA                                                          ; LOAD PLAYER INDEX
	LDY #$00                                                     ;
	CMP #OFFSET_TO_RESERVES                                      ; IS PLAYER = STARTER
	BCC @convert_change_player_index_to_menu_choice               ; YES-> CONVERT COM RESERVE CHOICE TO MENU CHOICE

@convert_reserve_choice_to_menu_index	
	INY                                                          ; SET MENU X CHOICE = RESERVE
	SEC                                                          ;
	SBC #OFFSET_TO_RESERVES                                      ; CONVERT RESERVE INDEX = POSITION INDEX
	
@convert_change_player_index_to_menu_choice:                     ; CONVERT COM RESERVE CHOICE TO MENU CHOICE
	SEC                                                          ; CONVERT POSITION INDEX INTO MENU Y
	SBC #$02                                                     ;  
	LSR                                                          ;
	STA MENU_Y                                                   ; SAVE MENU Y CHOICE
	STY MENU_X                                                   ; SAVE MENU X CHOICE
	JSR SET_STARTER_MENU_ARROW_TO_BLUE_MOVE_TO_SECOND_SPRITE     ; SET STARTER ARROW TO BLUE, TRANSFER TO 2ND SPRITE()
	LDA MENU_X                                                   ;
	ASL                                                          ;
	TAY                                                          ;
	LDA RETURNER_MENU_ADDR[],Y                                   ; LOAD MENU OPTIONS ADDR FROM E7,E8 OR E9,EA *** funky addressing mode
	STA MENU_OPTIONS_ADDR                                        ;
	LDA RETURNER_MENU_ADDR[]+1,Y                                 ;  
	STA MENU_OPTIONS_ADDR+1                                      ;
	JSR UPDATE_MENU_ARROW_INFO_LOADED                            ; INITIALIZE Y MENU OPTIONS(E4,E3= ADDRESS, $E5= PLAYER JOY)
	LDA CURRENT_STARTER_Y_MENU_INDEX                             ; IS ORIGINAL STARTER = KR OR PR
	CMP #KR_PR_IN_GAME_Y_MENU_INDEX                              ;
	BCS @com_subs_kr_or_pr                                       ; YES->COM SUB KR/PR
	
@com_subs_rb_wr_te	
	LDX MENU_Y                                                   ; LOAD Y MENU CHOICE = STARTER INDEX
	LDY CURRENT_STARTER_Y_MENU_INDEX                             ; LOAD ORIGINAL STARTER INDEX= RESERVE INDEX
	INX                                                          ; 
	JSR SWAP_STARTER_WITH_RESERVE                                ; SWAP STARTER WITH RESERVE(X= STARTER INDEX, Y= RESERVE INDEX)
	JMP @com_moves_arrow

@com_subs_kr_or_pr:                                              ; COM SUB KR/PR
	JSR COPY_PLAYER_TO_KR_OR_PR_SPOT                             ; COPY PLAYER TO KR/PR SPOT()
	JMP @com_moves_arrow                                         ; JUMP->UPDATE COM ARROW

@com_subs_qb:                                                         ; COM SUB FOR INJURED QB
	JSR SET_STARTER_MENU_ARROW_TO_BLUE_MOVE_TO_SECOND_SPRITE     ; SET STARTER ARROW TO BLUE, TRNASFER TO 2ND SPRITE()
	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] QB_RESERVE_ARROW_SPR_DATA, MENU_ARROW_SPR_INFO, $04

	LDX #$00                                                     ; SET STARTER INDEX = QB
	LDY #$00                                                     ; SET RESERVE INDEX = QB
	JSR SWAP_STARTER_WITH_RESERVE                                ; SWAP STARTER WITH RESERVE(X= STARTER INDEX, Y= RESERVE INDEX)

@com_moves_arrow:                                                 ; UPDATE COM ARROW
	JSR UPDATE_MENU_ARROW_SPR_Y                                  ; UPDATE MENU ARROW SPRITE Y LOCATION()
	RETURN_IN_NUM_FRAMES 60
	LDA #SPRITE_OFFSCREEN                                               ; SET MENU ARROW = OFFSCREEN 
	STA SECOND_MENU_ARROW_SPR_Y                                  ;
	JSR TRANSFER_TEMP_STARTERS_TO_IN_GAME_STARTERS               ; TRANSFER TEMP OFFENSIVE STARTERS TO P1 IN GAME OFFENSIVE STARTERS()

@com_check_next_player_injured :                                 ; COM CHECK NEXT PLAYER EXIT IF ALL CHECKED
	INC CURRENT_STARTER_Y_MENU_INDEX                             ; MENU Y CHOICE ++
	LDA CURRENT_STARTER_Y_MENU_INDEX                             ; IS CHOICE >= LAST STARTER MENU INDEX?
	CMP #MAX_STARTERS_TO_SET +1                                  ; 
	BCS @clear_menu_arrow_stop_flashing_pal                      ; YES->SET ARROWS OFFCREEN, WAIT 1 SECOND, END FLASHING PALLETE
	
	LDA CURRENT_STARTER_Y_MENU_INDEX                             ; RESTORE MENU Y CHOICE
	STA MENU_Y                                                   ;
	LDA #$00                                                     ; SET MENU X CHOICE = STARTERS
	STA MENU_X                                                   ;
	JSR SET_STARTER_ARROW_SPR_LOCATION                           ; SET STARTER ARROW LOCATION()
	RETURN_IN_NUM_FRAMES 10                                      ; 1/6 second
	
_END_WHILE                                                       ; JUMP->COM CHECK FOR INJURED STARTER SUB LOOP

@clear_menu_arrow_stop_flashing_pal:                             ; SET ARROWS OFFCREEN, WAIT 1 SECOND, END FLASHING PALLETE
	LDA #SPRITE_OFFSCREEN                                               ; SET MENU ARROWS = OFFSCREEN
	STA MENU_ARROW_SPR_Y                                         ;
	STA SECOND_MENU_ARROW_SPR_Y                                  ;
	RETURN_IN_NUM_FRAMES 60
	LDX #UPDATE_PALLETE_TASK                                     ; SET TASK INDEX = FLASHING PALLETE
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                   ; END TASK(X= TASK INDEX)
	RTS                                                          ; RETURN

_F}_COM_SUB_FOR_INJURED_PLAYER
	
_F{_STARTERS_AND_RESERVES_CHANGE_LOGIC 							; DONE


OFFSET_TO_TE_RESERVE_ROSTER_ID_CHANGE_PLAYER					= TE_RESERVE_ROSTER_ID_CHANGE_PLAYER - QB_STARTER_ROSTER_ID_CHANGE_PLAYER

roster_id_offset												= LOCAL_7
OFFSET_TO_KR_STARTER_CHANGE_PLAYER								= KR_STARTER_TEAM_ID_CHANGE_PLAYER - NON_QB_STARTERS_TEAM_IDS_CHANGE_PLAYER[]

DRAW_OFF_STARTERS_RESERVES_TEXT:                                 ; SET AND DRAW STARTERS AND RESERVES()
	LDA CURRENT_TEAM                                             ; IS CURRENT TEAM = PRO-BOWL TEAM
	CMP #AFC_TEAM_ID                                             ; 
	BCS INIT_PRO_BOWL_STARTERS_AND_RESERVES_CHANGE_PLAYER        ; YES->SET PRO BOWL OFFENSIVE STARTERS AND RESERVES
	
@copy_current_team_to_all_slots: 	
	LDX #$00                                                     ; SET CURRENT STARTER = FIRST STARTER
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
_WHILE CC                                                        ; SAVE ALL STARTERS TEAM IDS IN TEMP ARRAY
	STA CHANGE_PLAYER_STARTER_RESERVE[],X                        ; 
	INX                                                          ; *** copies team id to all slots
	CPX #SIZE_OF_STARTER_RESERVE_CHANGE_PLAYER                   ; ALL STARTERS TRANSFERRED?
_END_WHILE                                                       ; NO->SAVE ALL STARTERS TEAM IDS IN TEMP ARRAY


	JSR COPY_IN_GAME_STARTERS_TO_CHANGE_PLAYER_STARTERS          ; TRANSFER IN GAME OFFENSIVE STARTERS TO TEMP STARTERS($92-$A1)
	LDA QB_STARTER_ROSTER_ID_CHANGE_PLAYER                       ; LOAD CURRENT QB STARTER  
	EOR #$01                                                     ; SET QB RESERVE PLAYER
	STA QB_RESERVE_ROSTER_ID_CHANGE_PLAYER                       ;
	
	LDX #$00                                                     ; SET CURRENT RESERVE PLAYER = RB 1 RESERVE 
	LDA #RB1_ROSTER_ID                                           ; SET CURRENT ROSTER ID = RB1
_WHILE CC
	
	LDY #$00                                                     ; SET OFFSET = FIRST SKILL STARTER
@set_reserves_loop:                                              ; CHECK IF CURRENT ROSTER ID = CURRENT STARTER
	CMP NON_QB_STARTERS_ROSTER_IDS_CHANGE_PLAYER[],Y             ; IS CURRENT ROSTER ID  = CURRENT STARTER? 
	BEQ @set_to_next_roster_id                                   ; YES->SET ROSTER ID TO NEXT PLAYER
	INY                                                          ; CURRENT STARTER += OFFSET TO NEXT STARTER
	INY                                                          ;
	CPY #OFFSET_TO_KR_STARTER_CHANGE_PLAYER                      ; AT KR STARTER = PR? 
	BCC @set_reserves_loop                                       ; NO->CHECK IF CURRENT ROSTER ID = CURRENT STARTER
	
@save_roster_id_in_reserves:	
	STA ROSTER_IDS_SKILL_RESERVES_CHANGE_PLAYER[],X              ; SET RESERVE PLAYER = CURRENT ROSTER ID
	INX                                                          ; CURENT RESERVE PLAYER += OFFSET TO NEXT RESERVE 
	INX                                                          ; 
@set_to_next_roster_id:                                          ; SET ROSTER ID TO NEXT PLAYER
	CLC                                                          ; CURRENT STARTER++
	ADC #$01                                                     ;
	CMP #C_ROSTER_ID                                             ; AT LAST OFFSENIVE SKILL PLAYER ROSTER ID?
_END_WHILE                                                   	 ;


	LDA #OFFSET_TO_TE_RESERVE_ROSTER_ID_CHANGE_PLAYER            ; SET CURRENT OFFSET = LAST RESERVE ROSTER ID
	STA roster_id_offset                                         ;
_WHILE PLUS                                                      ; CHECK IF STARTER OR RESERVE INJURED
	LDX roster_id_offset                                         ; 
	LDA ROSTER_IDS_CHANGE_PLAYER[],X                             ; LOAD ROSTER ID
	JSR CHECK_IF_PLAYER_INJURED                                  ; CHECK IF PLAYER IS INJURED(A= PLAYER INDEX)
	BCC @set_offset_to_previous                                  ; NOT INJURED-> SET TO PREVIOUS PLAYER

@set_player_injured:
	LDX roster_id_offset                                         ; SET PLAYER STATUS = INJURED
	LDA ROSTER_IDS_CHANGE_PLAYER[],X                             ;
	ORA #PLAYER_IS_INJURED_BITFLAG                               ;
	STA ROSTER_IDS_CHANGE_PLAYER[],X                             ;
	CPX #OFFSET_TO_RESERVES                                      ; IS PLAYER= STARTER? 
	BCS @set_offset_to_previous                                  ; NO->SET TO PREVIOUS PLAYER
	TXA                                                          ; SET MENU Y LOCATION = INJURED STARTER
	LSR                                                          ;
	STA MENU_Y                                                   ;
	
@set_offset_to_previous:                                         ; SET TO PREVIOUS PLAYER
	LDA roster_id_offset                                   		; CURRENT OFFSET -= OFFSET TO PREVIOUS PLAYER
	SEC                                                          ;
	SBC #$02                                                     ;
	STA roster_id_offset                                    		;
_END_WHILE                                                   		; AT FIRST STARTER? NO-> CHECK IF STARTER OR RESERVE INJURED

	JMP DRAW_TEAM_OFFENSIVE_FORMATION_IMAGE_AND_PLAYER_NAMES      ; JUMP->DRAW TEAM OFFENSIVE FORMATION IMAGE AND STARTER/SUB LAST NAMES


INIT_PRO_BOWL_STARTERS_AND_RESERVES_CHANGE_PLAYER:               ; SET PRO BOWL OFFENSIVE STARTERS AND RESERVES

change_player_index									= LOCAL_6
current_player_index								= LOCAL_7					; index to player id in sram
offset_to_afc_nfc_starters							= LOCAL_8


PRO_BOWL_CHANGE_PLAYER_STARTER_TEAM_IDS[]			= QB_STARTER_TEAM_ID_CHANGE_PLAYER
PRO_BOWL_CHANGE_PLAYER_STARTER_ROSTER_IDS[]			= QB_STARTER_ROSTER_ID_CHANGE_PLAYER	
PRO_BOWL_CHANGE_PLAYER_RESERVE_TEAM_IDS[]			= QB_RESERVE_TEAM_ID_CHANGE_PLAYER
PRO_BOWL_CHANGE_PLAYER_RESERVE_ROSTER_IDS[]			= QB_RESERVE_ROSTER_ID_CHANGE_PLAYER
 

	JSR COPY_IN_GAME_STARTERS_TO_CHANGE_PLAYER_STARTERS          ; TRANSFER IN GAME OFFENSIVE STARTERS TO TEMP STARTERS($92-$A1)
	JSR SET_OFFSET_TO_AFC_NFC_PLAYERS                           ; SET OFFSET FOR AFC/NFC PRO BOWL FIRST PLAYER()
	STX offset_to_afc_nfc_starters                               ; SAVE OFFSET TO AFC OR NFC STARTERS
	LDA #$00                                                     ;
	STA current_player_index                                     ; SET PRO BOWL PLAYER INDEX = FIRST PLAYER
	STA change_player_index                                                      ; 
	
_WHILE ALWAYS                                                    ; RESET TEMP PLAYER INDEX TO FIRST STARTER 

	LDX #$00                                                     ; SET TEM PLAYER INDEX = FIRST STARTER
@init_off_starters_loop:                                         ; CHECK IF PLAYER IS STARTER LOOP 
	LDA current_player_index                                     ; = PLAYER INDEX
	CLC                                                          ;
	ADC offset_to_afc_nfc_starters                               ; + OFFSET TO AFC OR NFC STARTERS
	TAY                                                          ;
	
@check_team_id_match:	
	LDA PRO_BOWL_PLAYER_INFO,Y                                   ; LOAD PRO BOWL PLAYER STARTER TEAM
	CMP PRO_BOWL_CHANGE_PLAYER_STARTER_TEAM_IDS[],X                      ; SAME AS TEMP STARTER CURRENT TEAM?
	BNE @set_index_to_next_change_player_offset                  ; NO->
	
@check_roster_id_match:	
	LDA PRO_BOWL_PLAYER_INFO+1,Y                                 ; LOAD PRO BOWL PLAYER ROSTER ID
	CMP PRO_BOWL_CHANGE_PLAYER_STARTER_ROSTER_IDS[],X                     ; SAME AS TEMP STARTER ROSTER ID?
	BEQ @go_to_next_player                                       ; YES->GO TO NEXT PRO BOWL PLAYER

@set_index_to_next_change_player_offset:                         ; GO TO NEXT TEMP STARTER
	INX                                                          ;
	INX                                                          ;
	CPX #SIZE_OF_SKILL_CHANGE_PLAYER_STARTERS                    ; ALL STARTERS CHECKED?
	BCC @init_off_starters_loop                                  ; NO->CHECK IF PLAYER IS STARTER LOOP

	LDX change_player_index                                      ; SAVE PLAYER AS RESERVE PLAYER
	
@set_reserve_team_id:	
	LDA PRO_BOWL_PLAYER_INFO,Y                                   ; SET TEMP RESERVE TEAM = PRO BOWL PLAYER TEAM
	STA PRO_BOWL_CHANGE_PLAYER_RESERVE_TEAM_IDS[],X              ;
	
@set_reserve_roster_id:	
	LDA PRO_BOWL_PLAYER_INFO+1,Y                                 ; SET TEMP RESERVE ROSTER ID = PRO BOWL PLAYER TEAM
	STA PRO_BOWL_CHANGE_PLAYER_RESERVE_ROSTER_IDS[],X             ;
	INX                                                          ; PLAYER INDEX += OFFSET TO NEXT PLAYER
	INX                                                          ;
	STX change_player_index                                      ;
	CPX #SIZE_OF_SKILL_CHANGE_PLAYER_RESERVES                    ; ALL PRO BOWL RESERVES LOADED?
	BCS DRAW_TEAM_OFFENSIVE_FORMATION_IMAGE_AND_PLAYER_NAMES     ; YES->DRAW TEAM OFFENSIVE FORMATION IMAGE AND STARTER/SUB LAST NAMES

@go_to_next_player:                                              ; GO TO NEXT PRO BOWL PLAYER
	INC current_player_index                                     ; PRO BOWL PLAYER INDEX++
	INC current_player_index                                     ;
_END_WHILE                                                       ; JUMP->RESET TEMP PLAYER INDEX TO FIRST STARTER

DRAW_TEAM_OFFENSIVE_FORMATION_IMAGE_AND_PLAYER_NAMES:            ; DRAW TEAM OFFENSIVE FORMATION IMAGE AND STARTER/SUB LAST NAMES

current_change_player_index			= LOCAL_5

upper_dig_jersey_num_spr_y			= CUR_SPRITE_Y					
upper_dig_jersey_num_spr_tile		= CUR_SPRITE_TILE					
upper_dig_jersey_num_spr_attr		= CUR_SPRITE_ATTR					
upper_dig_jersey_num_spr_x			= CUR_SPRITE_X	

lower_dig_jersey_num_spr_y			= CUR_SPRITE_Y		+ $04				
lower_dig_jersey_num_spr_tile		= CUR_SPRITE_TILE	+ $04				
lower_dig_jersey_num_spr_attr		= CUR_SPRITE_ATTR	+ $04				
lower_dig_jersey_num_spr_x			= CUR_SPRITE_X		+ $04

curr_injury_marker_spr_y			= CUR_SPRITE_Y					
curr_injury_marker_spr_tile			= CUR_SPRITE_TILE					
curr_injury_marker_spr_attr			= CUR_SPRITE_ATTR					
curr_injury_marker_spr_x			= CUR_SPRITE_X	

injury_markers_spr_info[]			= CUR_SPRITE_Y	+ $40 
SIZE_OF_INJURY_MARKER_SPR_INFO		= $20 

temp_mult_result					= LOCAL_7

current_starter_roster_id			= LOCAL_7
current_starter_team_id				= LOCAL_8


NAME_POSITION_TABLE_OFFSET			= SEGMENT_VAR_90
INJURY_MARKER_TABLE_OFFSET			= SEGMENT_VAR_90
FORMATION_JERSEY_NUMBER_OFFSET		= SEGMENT_VAR_91

OFFSET_TO_FIRST_PLAYER_NUMBER_SPR	= $08						; menu arrows use first two sprites 
OFFSET_TO_NEXT_JERSEY_SPR			= $08
OFFSET_TO_NEXT_INJURY_SPR			= $04	
OFFSET_TO_INJURY_MARKER_SPRITES		= $40
SIZE_OF_EACH_INJURT_MARKER_TABLE	
SIZE_OF_EACH_NAME_POSITION_TABLE	= $1C						; 2 bytes * 14 player names ( QB, RB, RB, WR, WR ,TE + reserves + Kr + PR) 
SIZE_OF_EACH_INJURY_MARKER_TABLE	= SIZE_OF_EACH_NAME_POSITION_TABLE	 
SIZE_OF_EACH_OFF_IMAGE_TABLE		= $0C	

injury_status_bitmask				= $1F	    

@calculate_name_positioning_offset:								 ; separate tables for 2wr, 3 wr, 4 wr 
	LDA OFF_BASE_FORMATION_CHANGE_PLAYER                         ; LOAD CURRENT FORMATION TYPE
	LDX #SIZE_OF_EACH_NAME_POSITION_TABLE                        ; SET SIZE OF TABLE = 28
	JSR MULTIPLY_A_TIMES_X                                       ; (A * X)  RESULT IN $44,45
	LDA temp_mult_result                                         ; SAVE OFFSET TO PLAYERS
	STA NAME_POSITION_TABLE_OFFSET
	
@calculate_off_imge_positioning_offset:	
	LDA OFF_BASE_FORMATION_CHANGE_PLAYER                         ; LOAD CURRENT FORMATION TYPE
	LDX #SIZE_OF_EACH_OFF_IMAGE_TABLE                             ; SET SIZE OF TABLE = 12
	JSR MULTIPLY_A_TIMES_X                                       ; (A * X)  RESULT IN $44,45
	LDA temp_mult_result                                         ; SAVE OFFSET TO SKILL PLAYER STARTERS FORMATION POSITIONING
	STA FORMATION_JERSEY_NUMBER_OFFSET                           ;
	
@init_vars	
	LDA #OFFSET_TO_FIRST_PLAYER_NUMBER_SPR                       ; SET SPRITE INDEX = FIRST STARTER = QB
	STA SPR_INDEX_TEMP                                           ;
	LDA #$00                                                     ; SET CURRENT PLAYER = FIRST STARTER= QB
	STA current_change_player_index                              ;
	
_WHILE CC                                                        ; DRAW STARTER NUMBERS AND NAME LOOP

@draw_starters_number
	LDY current_change_player_index                              ; LOAD CURRENT PLAYER INDEX
	LDA ROSTER_IDS_CHANGE_PLAYER[],Y                             ; LOAD PLAYER
	AND #injury_status_bitmask                                   ; MASK OUT INJURY INFO
	TAX                                                          ;
	LDA TEAM_IDS_CHANGE_PLAYER[],Y                               ; LOAD TEAM
	JSR GET_PLAYER_NUMBER                                        ; GET NEXT PLAYER NUMBER FOR OFFENSIVE STARTERS(A=TEAM, X=PLAYER) RET A= NUMBER
	LDX current_change_player_index                              ; LOAD CURRENT PLAYER INDEX
	CPX #$0C                                                     ; HAVE WE CHECKED ALL OFFENSIVE SKILL PLAYER STARTERS
	BCS @draw_offensive_player_name                              ; YES->DRAW STARTERS AND RESERVES NAMES
	TAY                                                          ; SAVE NUMBER
	LDX SPR_INDEX_TEMP                                           ; LOAD SPRITE INDEX
	LOG_SHIFT_RIGHT_4											 ; CONVERT HIGH DIGIT OF NUMBER TO TILE 
	CLC                                                          ;
	ADC #OFFSET_TO_NUMBER_TILES                                  ; CONVERT LO-DIGIT TO TILE
	STA upper_dig_jersey_num_spr_tile,X                          ; SAVE IN PLAYER HIGH DIGIT TILE
	TYA                                                          ; LOAD STARTER NUMBER
	AND #$0F                                                     ; CONVERT LOW DIGIT OF NUMBER TO TILE
	CLC                                                          ;
	ADC #OFFSET_TO_NUMBER_TILES                                  ;
	STA lower_dig_jersey_num_spr_tile,X                          ; SAVE IN PLAYER HIGH DIGIT TILE
	
@set_jersey_num_y_location:		
	LDA current_change_player_index                              ; LOAD CURRENT PLAYER INDEX
	CLC                                                          ;
	ADC FORMATION_JERSEY_NUMBER_OFFSET                           ; + OFFSET TO SKILL PLAYER STARTERS
	TAY                                                          ;
	LDA STARTERS_FORMATION_POSITIONING_TABLE,Y                   ; SET Y LOC FOR NUMBER FROM STARTERS_FORMATION_POSITIONING_TABLE
	STA upper_dig_jersey_num_spr_y,X                             ;
	STA lower_dig_jersey_num_spr_y,X                             ;

@set_jersey_num_x_location:	
	LDA STARTERS_FORMATION_POSITIONING_TABLE+1,Y                 ; SET X LOC FOR HIGH DIGIT FROM STARTERS_FORMATION_POSITIONING
	STA upper_dig_jersey_num_spr_x,X                             ;
	CLC                                                          ;
	ADC #$08                                                     ; SET LOW DIGIT X LOC = ONE TILE OVER
	STA lower_dig_jersey_num_spr_x,X                             ;
	
@set_jersey_num_attr:	
	LDA #$00                                                     ; SET SPRITE MIRROING AND PALLETE
	STA upper_dig_jersey_num_spr_attr,X                          ;
	STA lower_dig_jersey_num_spr_attr,X                          ;
	TXA                                                          ; SET SPRITE INDEX = NEXT SKILL PLAYER
	CLC                                                          ;
	ADC #OFFSET_TO_NEXT_JERSEY_SPR                               ;
	STA SPR_INDEX_TEMP                                           ;
	
@draw_offensive_player_name:                                     ; DRAW STARTERS AND RESERVES NAMES

@save_starter_team:
	LDY current_change_player_index                              ; LOAD CURRENT PLAYER INDEX
	LDA TEAM_IDS_CHANGE_PLAYER[],Y                               ; SET STARTER TEAM
	STA current_starter_team_id                                  ; SAVE
	
@save_starter_roster_id:	
	LDA ROSTER_IDS_CHANGE_PLAYER[],Y                             ; LOAD STARTER ROSTER ID
	AND #injury_status_bitmask                                   ; MASK OUT INJURY STATUS 
	STA current_starter_roster_id                                 ; SAVE
	TYA                                                          ; SET STARTER NAME LOCATION INDEX = CURRENT PLAYER INDEX + 
	CLC                                                          ;
	ADC NAME_POSITION_TABLE_OFFSET                               ; + OFFSET TO PLAYERS
	TAX                                                          ; 
	LDY OFF_PLAYERS_NAME_POSITIONING,X                           ; LOAD NAME PPU ADDR FROM OFFENSIVE STARTERS AND RESERVES_NAME_POSITIONING PPU ADDR
	LDA OFF_PLAYERS_NAME_POSITIONING+1,X                         ;
	TAX                                                          ;
	JSR DRAW_LAST_NAME_10_CHAR                                   ; DRAW PLAYER LAST NAME MAX LENGTH 10 CHAR(X,Y= PPU LOCATION,$44=PLAYER, $45=TEAM)
	LDX current_change_player_index                              ; CURRENT PLAYER INDEX += OFFSET TO NEXT PLAYER
	INX                                                          ;
	INX                                                          ;
	STX current_change_player_index                              ;
	CPX #SIZE_OF_EACH_NAME_POSITION_TABLE                        ; ALL PLAYERS DRAWN?
_END_WHILE                                                       ; NO->DRAW STARTER NUMBERS AND NAME LOOP


CLEAR_RAM_Y_INDEX[start_length] injury_markers_spr_info[], SIZE_OF_INJURY_MARKER_SPR_INFO 

@draw_injury_makers	
	LDA OFF_BASE_FORMATION_CHANGE_PLAYER                         ; LOAD FORMATION TYPE
	LDX #SIZE_OF_EACH_INJURY_MARKER_TABLE                        ; = 14 2 BYTE PLAYERS PER FORMATION FOR OFFENSIVE STARTERS
	JSR MULTIPLY_A_TIMES_X                                       ; (A * X)  RESULT IN $44,45
	LDA temp_mult_result                                                      ;
	STA INJURY_MARKER_TABLE_OFFSET                                                      ; SAVE OFFSET TO PLAYERS IN $90
	LDA #OFFSET_TO_INJURY_MARKER_SPRITES                         ;
	STA SPR_INDEX_TEMP                                           ; SET SPRITE OFFSET = 0X40
	
	LDA #$00                                                     ; SET CURRENT PLAYER = FIRST OFFENSIVE STARTER 
	STA current_change_player_index                              ;
	
_WHILE CC                                                        ; CHECK PLAYERS FOR INJURY TO DRAW MARKER
	LDY current_change_player_index                              ;
	LDA ROSTER_IDS_CHANGE_PLAYER[],Y                             ; LOAD PLAYER
	BPL @player_not_injured_go_to_next                           ; IS PLAYER STATUS = INJURED? NO->GO TO NEXT PLAYER
	
@set_injury_marker_tile_id	
	LDX SPR_INDEX_TEMP                                           ; LOAD SPRITE INDEX
	LDA #INJURY_MARKER_X_TILE_ID                                 ; LOAD RED X SPRITE TILE ID
	STA curr_injury_marker_spr_tile,X                            ; SAVE IN SPRITE TILE
	
@set_formation_table_offset:	
	LDA current_change_player_index                              ; = CURRENT PLAYER
	CLC                                                          ;
	ADC INJURY_MARKER_TABLE_OFFSET                               ; + OFFSET TO PLAYERS
	TAY                                                          ; SET RED X SPRITE X,YLOCATION FROM INJURY_MARKER_POSITIONING_SPR_TABLE

@set_injury_spr_y:	
	LDA INJURY_MARKER_POSITIONING_SPR_TABLE,Y                    ; SET SPRITE Y LOC
	STA curr_injury_marker_spr_y,X                               ;

@set_injury_spr_x:	
	LDA INJURY_MARKER_POSITIONING_SPR_TABLE+1,Y                  ; SET SPRITE X LOC 
	STA curr_injury_marker_spr_x,X                               ;
	
@set_injury_spr_attr:	
	LDA #$00                                                     ; SET SPR PAL
	STA curr_injury_marker_spr_attr,X                             ;
	TXA                                                          ; SET SPRITE INDEX = NEXT SPRITE
	CLC                                                          ;
	ADC #OFFSET_TO_NEXT_INJURY_SPR                               ;
	STA SPR_INDEX_TEMP                                           ;
	
@player_not_injured_go_to_next:                                  ; GO TO NEXT PLAYER
	LDX current_change_player_index                              ; CURRENT PLAYER += OFFSET TO NEXT PLAYER
	INX                                                          ;
	INX                                                          ;
	STX current_change_player_index                              ; SAVE CURRENT PLAYER
	CPX #SIZE_OF_EACH_INJURY_MARKER_TABLE                         ; ALL STARTERS AND RESERVES CHECKED FOR INJURY?
_END_WHILE                                                       ; NO-> CHECK PLAYERS FOR INJURY TO DRAW MARKER
	SWAP_A000_BANK[bank_id] MAIN_GAME_BANK_2
	RTS                                                          ; RETURN

_F}_STARTERS_AND_RESERVES_CHANGE_LOGIC  

_F{_TRANSFER_SEASON_STARTERS_TO_TEMP_STARTERS 					; DONE

COPY_IN_GAME_STARTERS_TO_CHANGE_PLAYER_STARTERS:                                                       ; TRANSFER IN GAME OFFENSIVE STARTERS TO TEMP STARTERS($92-$A1)
	LDY #$00                                                     ; IS P1?
	LDA POSSESSION_STATUS                                        ;
	BPL @copy_in_game_kr_pr_to_temp                              ; YES-> TRANSFER IN GAME KR/PR TO TEMP KR/PR

@set_p2_offset:	
	LDY #P2_GAME_PLAYERS_OFFSET                                  ; SET OFFSET TO P2 PLAYERS
	
@copy_in_game_kr_pr_to_temp:                                     ; TRANSFER IN GAME KR/PR TO TEMP KR/PR
	LDA KR_PR_STARTERS[],Y                                       ; SAVE KR TEAM IN TEMP KR TEAM
	STA KR_STARTER_TEAM_ID_CHANGE_PLAYER                                                      ;
	LDA KR_PR_STARTERS[]+1,Y                                     ; SAVE KR ROSTER ID IN TEMP KR ROSTER ID
	STA KR_STARTER_ROSTER_ID_CHANGE_PLAYER                                                      ;
	LDA KR_PR_STARTERS[]+2,Y                                     ; SAVE PR TEAM IN TEMP PR TEAM
	STA PR_STARTER_TEAM_ID_CHANGE_PLAYER                                                      ;
	LDA KR_PR_STARTERS[]+3,Y                                     ; SAVE PR ROSTER ID IN TEMP PR TEAM
	STA PR_STARTER_ROSTER_ID_CHANGE_PLAYER                                                      ;

	LDX #$00                                                     ; SET OFFENSIVE STARTER INDEX = FIRST STARTER = QB
_WHILE CC                                                        ; TRANSFER IN-GAME STARTERS TO TEMP STARTERS
	LDA GAME_PLAYERS[],Y                                         ; TRANSFER IN GAME STARTERS TEAM AND ROSTER ID TO TEMP STARTERS TEAM AND ROSTER ID
	STA CHANGE_PLAYER_STARTERS[],X                               ;
	INY                                                          ;
	INX                                                          ;
	CPX #SIZE_OF_SKILL_CHANGE_PLAYER_STARTERS                           ; ALL OFFENSIVE STARTERS LOADED?
_END_WHILE                                                       ; NO-> TRANSFER IN-GAME STARTERS TO TEMP STARTERS
	RTS                                                          ; RETURN
	
_F}_TRANSFER_SEASON_STARTERS_TO_TEMP_STARTERS 

_F{_FLASH_STARTER_ON_OFFENSIVE_FORMATION						; DONE

FIRST_OFF_FORM_IMAGE_SPR_ATTR			= SPRITE_START + 10
SECOND_OFF_FORM_IMAGE_SPR_ATTR			= SPRITE_START + 14 
SIZE_OF_OFF_FORM_SPR_DATA				= $30
FLASHING_PALLETE_INDEX					= $03
KR_PR_IN_GAME_Y_MENU_INDEX				= $06 
KR_PR_TEAM_DATA_Y_MENU_INDEX			= $07 		
		
BLINK_STARTER_NUM_ON_FORMATION_IMAGE:                            ; FLASH STARTER NUMBER ON OFFENSIVE FORMATION IMAGE()
	LDX #$00                                                     ; SET SPRITE INDEX = FIRST FORMATION SPRITE
_WHILE CC                                                        ; CLEAR FORMATION SPRITE ATTRIBUTES AND SET TO FIRST PALLETE LOOP
	LDA #$00                                                     ;
	STA FIRST_OFF_FORM_IMAGE_SPR_ATTR,X                          ; SET SPRITE ATTRIBUTE
	INX                                                          ; SPRITE INDEX += OFFSET TO NEXT SPRITE
	INX                                                          ;
	INX                                                          ;
	INX                                                          ; 
	CPX #SIZE_OF_OFF_FORM_SPR_DATA                               ; ALL SPRITES DONE?    
_END_WHILE                                                  	 ; NO-> CLEAR FORMATION SPRITE ATTRIBUTES AND SET TO FIRST PALLETE LOOP
	

	LDX MENU_Y                                                   ; LOAD MENU Y  
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; COMING FROM IN GAME PLAYER CHANGE?
	BNE @check_if_on_kr_pr_in_game                               ; YES-> CHECK IF ARROW ON KR/PR FOR IN GAME PLAYER CHANGE
	TXA                                                          ; 
	BEQ @exit                                                    ; MENU ARROW ON “RESET STARTERS” YES->EXIT FROM FLASH STARTER IMAGE
	
@check_if_on_kr_pr_team_Data: 	
	CPX #KR_PR_TEAM_DATA_Y_MENU_INDEX                            ; MENU ARROW ON KR/PR?
	BCS @exit                                                    ; YES->EXIT FROM FLASH STARTER IMAGE

@convert_menu_index_to_pos_index	
	DEX                                                          ; CONVERT MENU INDEX TO PLAYER INDEX
	JMP @load_flashing_pal_index                                 ; 

@check_if_on_kr_pr_in_game:                                      ; CHECK IF ARROW ON KR/PR FOR IN GAME PLAYER CHANGE
	CPX #KR_PR_IN_GAME_Y_MENU_INDEX                              ; ARROW ON KR/PR?
	BCS @exit                                                    ; YES->EXIT FROM FLASH STARTER IMAGE

@load_flashing_pal_index:                                        ; LOAD FLASHING PAL INDEX INTO SPRITE NUMBER ATTRIBUTES        ;
	TXA                                                          ; CONVERT POSITION INDEX INTO SPRITE INDEX
	ASL                                                          ;
	ASL                                                          ;
	ASL                                                          ;
	TAX                                                          ;
	LDA #FLASHING_PALLETE_INDEX                                  ; LOAD FLASHING SPRITE PAL INDEX
	STA FIRST_OFF_FORM_IMAGE_SPR_ATTR,X                          ; SET FIRST NUMBER SPRITE PAL
	STA SECOND_OFF_FORM_IMAGE_SPR_ATTR,X                         ; SET SECOND NUMBER SPRITE PAL
	
@exit:                                                           ; EXIT FROM FLASH STARTER IMAGE
	RTS                                                          ; RETURN

_F}_FLASH_STARTER_ON_OFFENSIVE_FORMATION 

_F{_TRANSFER_TEMP_STARTERS_TO_P1_STARTERS  						; DONE

in_game_sram_addr					= LOCAL_1
starter_player_offset				= LOCAL_5
offset_to_pb_starters				= LOCAL_7
offset_to_pb_players				= LOCAL_8

OFFSET_TO_AFC_PLAYERS 				=  $00	
OFFSET_TO_NFC_PLAYERS 				=  NFC_PLAYER_INFO - AFC_PLAYER_INFO

OFFSET_TO_AFC_STARTERS 				= $00 
OFFSET_TO_NFC_STARTERS 				= SRAM_NFC_STARTERS - SRAM_AFC_STARTERS

PRO_BOWL_PLAYER_TEAM_ID[]			= PRO_BOWL_PLAYER_INFO
PRO_BOWL_PLAYER_ROSTER_ID[]			= PRO_BOWL_PLAYER_INFO + 1
CHANGE_PLAYER_TEAM_ID[]				= SEGMENT_VAR_92
CHANGE_PLAYER_ROSTER_ID[]			= SEGMENT_VAR_93

TRANSFER_TEMP_STARTERS_TO_IN_GAME_STARTERS:                      ; TRANSFER TEMP OFFENSIVE STARTERS TO P1 IN GAME OFFENSIVE STARTERS() 
	MMC3_SRAM_WRITE_ENABLE
	LDA CURRENT_TEAM                                             ; IS CURRENT TEAM = PRO BOWL TEAM
	CMP #AFC_TEAM_ID                                             ;
	BCS @pro_bowl_in_game_starters                               ; YES-> TRANSFER PRO BOWL TEMP OFFENSIVE STARTERS TO P1 IN-GAME OFFENSIVE STARTERS()
	
@get_in_game_sram_addr:	
	JSR GET_P1_P2_GAME_STATS_ADDR                                    ; LOAD P1 or P2 GAME STATS SRAM LOCATION IN 3E 3F()
	LDY #IN_GAME_STARTERS_OFFSET                                 ; SET STARTER OFFSET= IN GAME STARTERS FIRST BYTE
	LDA QB_STARTER_ROSTER_ID_CHANGE_PLAYER                       ; LOAD TEMP QB STARTER
	JSR SAVE_STARTER_ID_IN_UPPER_NIBBLE                         ; SAVE VALUE IN UPPER NIBBLE (A= VAL 3E,3F = DATA POINTER)
	
	LDA RB1_STARTER_ROSTER_ID_CHANGE_PLAYER                      ; LOAD TEMP RB1 STARTER
	JSR SAVE_STARTER_ID_IN_LOWER_NIBBLE                          ; SET VALUE TO LOWER NIBBLE  AND COMBINE WITH UPPER(A= VAL, 3E,3F = DATA POINTER)
	INY                                                          ; STARTER BYTE OFFSET++
	
	LDA RB2_STARTER_ROSTER_ID_CHANGE_PLAYER                      ; LOAD TEMP RB2 STARTER
	JSR SAVE_STARTER_ID_IN_UPPER_NIBBLE                          ; SAVE VALUE IN UPPER NIBBLE (A= VAL 3E,3F = DATA POINTER)
	
	LDA WR1_STARTER_ROSTER_ID_CHANGE_PLAYER                      ; LOAD TEMP WR1 STARTER
	JSR SAVE_STARTER_ID_IN_LOWER_NIBBLE                          ; SET VALUE TO LOWER NIBBLE  AND COMBINE WITH UPPER(A= VAL, 3E,3F = DATA POINTER)
	INY                                                          ; STARTER BYTE OFFSET++
	
	LDA WR2_STARTER_ROSTER_ID_CHANGE_PLAYER                      ; LOAD TEMP WR2 STARTER
	JSR SAVE_STARTER_ID_IN_UPPER_NIBBLE                          ; SAVE VALUE IN UPPER NIBBLE (A= VAL 3E,3F = DATA POINTER)
	
	LDA TE_STARTER_ROSTER_ID_CHANGE_PLAYER                       ; LOAD TEMP TE STARTER
	JSR SAVE_STARTER_ID_IN_LOWER_NIBBLE                          ; SET VALUE TO LOWER NIBBLE  AND COMBINE WITH UPPER(A= VAL, 3E,3F = DATA POINTER)
	INY                                                          ; STARTER BYTE OFFSET++
	
	LDA KR_STARTER_ROSTER_ID_CHANGE_PLAYER                       ; LOAD TEMP KR STARTER
	JSR SAVE_STARTER_ID_IN_UPPER_NIBBLE                          ; SAVE VALUE IN UPPER NIBBLE (A= VAL 3E,3F = DATA POINTER)
	
	LDA PR_STARTER_ROSTER_ID_CHANGE_PLAYER                       ; LOAD TEMP PR STARTER
	JSR SAVE_STARTER_ID_IN_LOWER_NIBBLE                          ; SET VALUE TO LOWER NIBBLE  AND COMBINE WITH UPPER(A= VAL, 3E,3F = DATA POINTER)
	JSR SET_CUR_STARTERS_PLAYBOOKS_TO_SEASON                     ; SET DEFAULT STARTERS AND PLAYBOOKS()
	JMP @exit_transfer_starters                                  ; 

@pro_bowl_in_game_starters:                                      ; TRANSFER PRO BOWL TEMP OFFENSIVE STARTERS TO P1 IN-GAME OFFENSIVE STARTERS() 
	LDX #OFFSET_TO_AFC_PLAYERS                                   ; SET OFFSET TO PLAYERS = AFC PLAYERS
	LDY #OFFSET_TO_AFC_STARTERS                                  ; SET OFFSET TO STARTERS = AFC STARTERS
	LDA CURRENT_TEAM                                             ; IS CURRENT TEAM = AFC
	CMP #NFC_TEAM_ID                                             ; 
	BCC @save_offsets                                            ; YES->SAVE OFFSETS

@set_offsets_to_nfc_players	
	LDX #OFFSET_TO_NFC_PLAYERS                                                     ; SET OFFSET TO PLAYERS = NFC PLAYERS
	LDY #OFFSET_TO_NFC_STARTERS                                                     ; SET OFFSET TO STARTERS = NFC STARTERS

@save_offsets:                                                   ; SAVE OFFSETS
	STX offset_to_pb_players                                     ; SAVE OFFSET TO PLAYERS
	STY offset_to_pb_starters                                    ; SAVE OFFSET TO STARTERS
	LDX #$00                                                     ; SET TEMP PLAYER = FIRST STARTER

_WHILE CC                                                        ; SET PRO-BOWL PLAYER TO FIRST PLAYER
	LDA #$00                                                     ; SET CURRENT PRO BOWL PLAYER = FIRST PLAYER
	STA starter_player_offset                                    ; 
	
@set_afc_or_nfc_starters:                                        ; SET PRO BOWL STARTERS LOOP
	LDA starter_player_offset                                    ; = CURRENT PRO BOWL PLAYER
	CLC                                                          ;
	ADC offset_to_pb_players                                     ; + OFFSET TO PLAYERS
	TAY                                                          ;
	LDA PRO_BOWL_PLAYER_TEAM_ID[],Y                              ; IS  PRO BOWL PLAYER TEAM = TEMP TEAM 
	CMP CHANGE_PLAYER_TEAM_ID[],X                                ;
	BNE @go_to_next_starter                                      ; NO-> SET PRO BOWL PLAYER TO NEXT PLAYER
	LDA PRO_BOWL_PLAYER_ROSTER_ID[],Y                            ; IS  PRO BOWL PLAYER ROSTER ID  = TEMP ROSTER ID
	CMP CHANGE_PLAYER_ROSTER_ID[],X                              ;
	BEQ @set_player_as_starter                                   ; YES->

@go_to_next_starter:                                             ; SET PRO BOWL PLAYER TO NEXT PLAYER 
	INC starter_player_offset                                    ; CURRENT PRO BOWL PLAYER = OFFSET TO NEXT PLAYER
	INC starter_player_offset                                    ;
	JMP @set_afc_or_nfc_starters                                 ; JUMP-> SET PRO BOWL STARTERS LOOP

@set_player_as_starter:                                          ; SET TEMP PLAYER AS PRO BOWL STARTER
	TXA                                                          ; 
	LSR                                                          ;
	CLC                                                          ;
	ADC offset_to_pb_starters                                    ; OFFSET TO STARTERS
	TAY                                                          ;
	LDA starter_player_offset                                    ; LOAD PLAYER ROSTER ID
	STA SRAM_PRO_BOWL_STARTERS[],Y                               ; SAVE IN AFC OR NFC STARTERS
	INX                                                          ; TEMP PLAYER += OFFSET TO NEXT PLAYER
	INX                                                          ;
	CPX #SIZE_OF_STARTERS_CHANGE_PLAYER                          ; ALL STARTERS LOADED?

_END_WHILE 
                                                                 ; NO->SET PRO-BOWL PLAYER TO FIRST PLAYER
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	JSR TRANSFER_SEASON_PRO_BOWL_INFO_TO_TEMP                    ; TRANSFER STARTERS AND PLAYBOOK TO SEASON STARTERS AND PLAYBOOK()
	
@exit_transfer_starters:                                         ; EXIT TRANSFER TEMP STARTERS TO P1 IN GAME STARTERS
	LDA CURRENT_STARTER_Y_MENU_INDEX                                 ; SAVE MENU Y INDEX
	PHA                                                          ;
	JSR DRAW_TEAM_OFFENSIVE_FORMATION_IMAGE_AND_PLAYER_NAMES      ; DRAW TEAM OFFENSIVE FORMATION IMAGE AND STARTER/SUB LAST NAMES()
	PLA                                                          ;
	STA CURRENT_STARTER_Y_MENU_INDEX                                  ; RESTORE MENU Y INDEX
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN

SAVE_STARTER_ID_IN_UPPER_NIBBLE:                                 ; SAVE VALUE IN UPPER NIBBLE (A= VAL 3E,3F = DATA POINTER) 
	ASL                                                          ; SHIFT VALUE TO UPPER NIBBLE 
	ASL                                                          ;
	ASL                                                          ;
	ASL                                                          ;
	STA (in_game_sram_addr),Y                                    ; SAVE VALUE
	RTS                                                          ; RETURN

SAVE_STARTER_ID_IN_LOWER_NIBBLE:                                 ; SET VALUE TO LOWER NIBBLE  AND COMBINE WITH UPPER(A= VAL, 3E,3F = DATA POINTER)
	AND #$0F                                                     ; MASK OUT UPPER NIBBLE
	ORA (in_game_sram_addr),Y                                    ; SAVE VALUE
	STA (in_game_sram_addr),Y                                    ; 
	RTS                                                          ; RETURN

SET_STARTER_MENU_ARROW_TO_BLUE_MOVE_TO_SECOND_SPRITE:            ; SET STARTER ARROW TO BLUE, TRNASFER TO 2ND SPRITE()

	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] MENU_ARROW_SPR_INFO, SECOND_MENU_ARROW_SPR_INFO, $04
	LDA #$01                                                     ; SET STARTER ARROW PAL TO USE = BLUE
	STA SECOND_MENU_ARROW_SPR_ATTR                               ;
	RTS                                                          ; RETURN

	
POSSIBLE_KR_PR_STARTERS[]		= RB1_STARTER_TEAM_ID_CHANGE_PLAYER 

COPY_PLAYER_TO_KR_OR_PR_SPOT:                                    ; COPY PLAYER TO KR/PR SPOT()
	LDA MENU_X                                                   ; CONVERT CURRENT MENU LOCATION TO STARTER/RESERVE INDEX
	ASL                                                          ;
	ASL                                                          ;
	ASL                                                          ;
	CLC                                                          ;
	ADC MENU_Y                                                   ;
	ASL                                                          ;
	TAX                                                          ;
	LDA CURRENT_STARTER_Y_MENU_INDEX                                 ; LOAD STARTER BEING SUBBED FOR 
	ASL                                                          ; SHIFT SINCE EACH STARTER IS TWO BYTES
	TAY                                                          ; 
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ; COMING FROM IN GAME PLAYER CHANGE?
	BNE @set_kr_pr_starter                                       ; YES->
	
	DEY                                                          ; SUBTRACT LENGTH OF ONE STARTER DUE TO RESET OPTION
	DEY                                                          ;
@set_kr_pr_starter:                                                          ; COPY RESERVE TO KR OR PR SPOT AND RETURN
	LDA POSSIBLE_KR_PR_STARTERS[],X                      		 ; SET KR OR PR TEAM = SUB TEAM
	STA CHANGE_PLAYER_STARTERS[],Y                               ; 
	LDA POSSIBLE_KR_PR_STARTERS[]+1,X                    			; SET KR OR PR STARTER ROSTER ID = SUB ROSTER ID
	STA CHANGE_PLAYER_STARTERS[]+1,Y                             ; 
	RTS                                                          ; RETURN

_F}_TRANSFER_TEMP_STARTERS_TO_P1_STARTERS 

_F{_SWAP_TEMP_STARTER_WITH_TEMP_RESERVE							; DONE

SWAP_STARTER_WITH_RESERVE:                                       ; SWAP STARTER WITH RESERVE(X= STARTER INDEX, Y= RESERVE INDEX)
	TXA                                                          ; EACH STARTER TWO BYTES SO SHIFT
	ASL                                                          ;
	TAX                                                          ; SAVE INDEX IN X
	TYA                                                          ; EACH RESERVE TWO BYTES SO SHIFT
	ASL                                                          ;
	TAY                                                          ; SAVE INDEX IN Y
	LDA CHANGE_PLAYER_RESERVES[],X                               ; SWAP PLAYER TEAM AND PLAYER ROSTER ID FROM RESERVE PLAYER ARRAY TO TEMP STARTER ARRAY
	PHA                                                          ;
	LDA CHANGE_PLAYER_STARTERS[],Y                               ;
	STA CHANGE_PLAYER_RESERVES[],X                               ;
	PLA                                                          ;
	STA CHANGE_PLAYER_STARTERS[],Y                               ;
	LDA CHANGE_PLAYER_RESERVES[]+1,X                             ;
	PHA                                                          ;
	LDA CHANGE_PLAYER_STARTERS[]+1,Y                             ;
	STA CHANGE_PLAYER_RESERVES[]+1,X                             ;
	PLA                                                          ;
	STA CHANGE_PLAYER_STARTERS[]+1,Y                            ; 
	RTS                                                          ; RETURN

_F}_SWAP_TEMP_STARTER_WITH_TEMP_RESERVE 

_F{_CHECK_IF_ALL_RESERVES_INJURED								; DONE

CHECK_IF_ALL_RESERVES_INJURED:                                   ; CHECK IF ALL POSSIBLE SKILL PLAYER SUBS INJURED() C= SET IF ALL INJURED
	LDA RB1_RESERVE_ROSTER_ID_CHANGE_PLAYER                      ; 
	AND RB2_RESERVE_ROSTER_ID_CHANGE_PLAYER                      ;
	AND WR1_RESERVE_ROSTER_ID_CHANGE_PLAYER                      ;
	AND WR2_RESERVE_ROSTER_ID_CHANGE_PLAYER                      ;
	AND TE_RESERVE_ROSTER_ID_CHANGE_PLAYER                       ;
	ASL                                                          ; IF ALL INJURED CARRY = SET
	RTS                                                          ; RETURN
	
_F}_CHECK_IF_ALL_RESERVES_INJURED 

_F{_SET_STARTER_ARROW_SPRITE_LOCATION							; DONE

SET_STARTER_ARROW_SPR_LOCATION:                                  ; INITIALIZE STARTER ARROW LOCATION()
	LDA CHANGE_PLAYER_TEAM_DATA_FLAG                             ;
	ASL                                                          ;
	CLC                                                          ;
	ADC CHANGE_PLAYER_TEAM_DATA_FLAG                             ;
	CLC                                                          ;
	ADC OFF_BASE_FORMATION_CHANGE_PLAYER                         ;
	ASL                                                          ;
	TAX                                                          ;
	LDY STARTER_MENU_DATA_TABLE,X                                ; SET MENU DATA ADDR FROM STARTER SELECT PTR TABLE  
	LDA STARTER_MENU_DATA_TABLE+1,X                              ;
	TAX                                                          ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX = P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	RTS                                                          ; RETURN

_F}_SET_STARTER_ARROW_SPRITE_LOCATION 

_F{_SET_RESERVE_ARROW_SPRITE_LOCATION							; DONE
	
SET_RESERVE_ARROW_BASED_ON_FORMATION:                            ; *** only called once could inline SET RESERVE ARROW LOCATION BASED ON FORMATION()
	LDA OFF_BASE_FORMATION_CHANGE_PLAYER                         ;
	ASL                                                          ;
	TAX                                                          ;
	LDY RESERVE_MENU_DATA_TABLE,X                                ; SET MENU DATA ADDR FROM RESERVE SELECT PTR TABLE  
	LDA RESERVE_MENU_DATA_TABLE+1,X                              ;
	TAX                                                          ;
	LDA #BOTH_JOYPADS                                            ; SET JOYPAD INDEX = P1 AND P2
	JSR SET_MENU_ARROW_OPTIONS                                   ; SET MENU ARROW Y(X,Y = MENU DATA ADDRESS, A=JOYPAD)
	RTS                                                          ; RETURN

_F}_SET_RESERVE_ARROW_SPRITE_LOCATION  

_F{_ADJUST_RESERVE_ARROW_SPRITE_LOCATION_IF_INJURED				; DONE
	
ADJUST_SUB_ARROW_LOC_IF_SUB_INJURED:                              ; ADJUST INITIAL PLAYER SUB ARROW LOCATION IF SUB INJURED() 

_WHILE ALWAYS 
	LDA MENU_Y                                                   ; CONVERT MENU Y CHOICE INTO SUB PLAYER INDEX
	ASL                                                          ;
	TAX                                                          ;
	LDA ROSTER_IDS_SKILL_RESERVES_CHANGE_PLAYER[],X                                                    ; IS SUB STATUS = INJURED? 
	BPL @exit                                                    ; NO->EXIT
	INC MENU_Y                                                   ; MENU Y CHOICE++
	
_END_WHILE

@exit:                                                          ; 
	RTS                                                          ; RETURN
	
_F}_ADJUST_RESERVE_ARROW_SPRITE_LOCATION_IF_INJURED

_F{_SET_KR_PR_RESERVE_ARROW_SPRITE_LOCATION						; DONE
	
SET_KR_PR_RESERVE_MENU_DATA_ADDR_BASED_ON_FORMATION:             ; SET KICK/PUNT RETURNER RESERVE ARROW MENU ADDRESSES BASED ON FORMATION()
	LDA #$00                                                     ; 
	STA MENU_Y                                                   ; CLEAR MENU Y CHOICE
	STA MENU_X                                                   ; CLEAR MENU X CHOICE
	LDA OFF_BASE_FORMATION_CHANGE_PLAYER                         ; LOAD FORMATION TYPE
	ASL                                                          ;
	TAX                                                          ;
	
	LDA RETURNER_MENU_DATA_TABLE,X                               ; 
	STA RETURNER_STARTER_MENU_ADDR                               ;
	LDA RETURNER_MENU_DATA_TABLE+1,X                             ; 
	STA RETURNER_STARTER_MENU_ADDR+1                             ;
	
	LDA RESERVE_MENU_DATA_TABLE,X                                ; SET TEMP MENU DATA ADDR FROM RESERVE SELECT PTR TABLE  
	STA RETURNER_RESERVE_MENU_ADDR                               ;
	LDA RESERVE_MENU_DATA_TABLE+1,X                              ;
	STA RETURNER_RESERVE_MENU_ADDR+1                             ;
	RTS                                                          ; RETURN
	
_F}_SET_KR_PR_RESERVE_ARROW_SPRITE_LOCATION

_F{_SET_DEFAULT_STARTERS_AND_PLAYBOOKS							; DONE

playbook_edit_offset		= LOCAL_5
p1_p2_players_offset		= LOCAL_6
sram_addr					= LOCAL_7

OFFSET_TO_P1_GAME_PLAYERS	= $00
OFFSET_TO_P1_PLAYBOOK_EDIT	= $00
OFFSET_TO_P2_GAME_PLAYERS	= P2_GM_PLAYERS - P1_GM_PLAYERS
OFFSET_TO_P2_PLAYBOOK_EDIT	= P2_PLAYBOOK_EDIT	- P1_PLAYBOOK_EDIT

SET_CUR_STARTERS_PLAYBOOKS_TO_SEASON:                           ; SET DEFAULT STARTERS AND PLAYBOOKS() 
	MMC3_SRAM_WRITE_ENABLE
	
@transfer_p1_to_season:	
	LDA #<P1_GAME_STATS_START                                    ; SET P1 GAME INFO = $6406
	STA sram_addr                                                ; 
	LDA #>P1_GAME_STATS_START                                    ;
	STA sram_addr+1                                              ;
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	LDY #OFFSET_TO_P1_PLAYBOOK_EDIT                              ; SET PLAYBOOK OFFSET = P1 PLAYBOOK
	LDX #OFFSET_TO_P1_GAME_PLAYERS                               ; SET STARTER INDEX = P1 STARTERS 
	JSR @copy_in_game_to_season                                  ; SET CURRENT STARTERS/PLAYBOOKS = SEASON STARTERS/PLAYBOOKS(A= TEAM ID, X=STARTER INDEX, Y=PB INDEX)

@transfer_p2_to_season:	
	LDA #<P2_GAME_STATS_START                                    ; SET P2 GAME INFO = $650B
	STA sram_addr                                                ;
	LDA #>P2_GAME_STATS_START                                    ;
	STA sram_addr+1                                              ;
	LDA P2_TEAM                                                  ; LOAD P2 TEAM
	LDY #OFFSET_TO_P2_PLAYBOOK_EDIT                              ; SET PLAYBOOK OFFSET = P2 PLAYBOOK
	LDX #OFFSET_TO_P2_GAME_PLAYERS                               ; SET STARTER INDEX = P2 STARTERS
	JSR @copy_in_game_to_season                                  ; SET CURRENT STARTERS/PLAYBOOKS = SEASON STARTERS/PLAYBOOKS(A= TEAM ID, X=STARTER INDEX, Y=PB INDEX) 
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN

@copy_in_game_to_season:                                         ; SET CURRENT STARTERS/PLAYBOOKS = SEASON STARTERS/PLAYBOOKS(A= TEAM ID, X=STARTER INDEX, Y=PB INDEX ) 
	STY playbook_edit_offset                                     ; SAVE PLAYBOOK OFFSET
	STX p1_p2_players_offset                                     ; SAVE STARTER OFFSET 
	
	LDY #NUMBER_OF_IN_GM_STARTERS                                ; SET NUMBER OF PLAYERS TO DO = 26
_WHILE NOT_EQUAL                                                 ; TRANSFER STARTERS TEAM IDS LOOP
	STA GAME_PLAYERS[],X                                         ; SAVE TEAM ID
	INX                                                          ; STARTER INDEX += OFFSET TO NEXT STARTER
	INX                                                          ; 
	DEY                                                          ; NUMBER OF PLAYERS TO DO--
_END_WHILE                                                       ; DONE? NO-> TRANSFER STARTERS TEAM IDS LOOP
	
	LDX playbook_edit_offset                                     ; LOAD PLAYBOOK P1 OR P2 OFFSET
	LDA #$00                                                     ; 
	STA playbook_edit_offset                                     ;
	LDY #IN_GAME_PLAYBOOK_OFFSET                                 ; SET IN GAME INDEX = PLAYBOOK

_WHILE CC                                                        ; TRANSFER IN-GAME P1 OR P2 PLAYBOOK TO P1 P2 ACTUAL PLAY IDS
	LDA (sram_addr),Y                                            ; CONVERT UPPER NIBBLE OF PLAYBOOK BYTE TO ACTUAL PLAY ID
	LOG_SHIFT_RIGHT_4											 ; 
	CLC                                                          ;
	ADC playbook_edit_offset                                     ; + ACTUAL PLAY OFFSET 
	STA P1_P2_PLAYBOOKS[],X                                      ;  SAVE PLAY IN P1 OR P2 ACTUAL PLAY IDS
	LDA (sram_addr),Y                                            ; CONVERT LOW NIBBLE OF PLAYBOOK BYTE TO ACTUAL PLAY ID
	AND #$0F                                                     ;
	CLC                                                          ;
	ADC playbook_edit_offset                                     ; + ACTUAL PLAY OFFSET
	CLC                                                          ;
	ADC #$08                                                     ; + offset to next set of plays 
	STA P1_P2_PLAYBOOKS[]+1,X                                    ; SAVE PLAY IN P1 OR P2 ACTUAL PLAY IDS
	LDA playbook_edit_offset                                     ; ACTUAL PLAY OFFSET += SIZE OF TWO SLOTS
	CLC                                                          ;
	ADC #$10                                                     ; + offset to next set of plays
	STA playbook_edit_offset                                     ;
	INX                                                          ; ACTUAL PLAY ID INDEX += OFFSET TO NEXT TWO PLAYS 
	INX                                                          ;
	INY                                                          ; 
	CPY #IN_GAME_STARTERS_OFFSET	                             ; DONE WITH PLAYBOOK TRANSFER?
	
_END_WHILE
																 ; TRANSFER P1 OR P2 IN GAME STARTERS TO P1 OR P2 PLAYERS
	LDX p1_p2_players_offset                                     ; LOAD P1 OR P2 IN GAME STARTER OFFSET
	LDY #IN_GAME_STARTERS_OFFSET                                 ; LOAD INDEX TO STARTERS

@set_qb_starter:	
	LDA (sram_addr),Y                                            ; SHIFT 1ST STARTER FROM UPPER NIBBLE 
	LOG_SHIFT_RIGHT_4
	STA GAME_PLAYERS[]+1,X                                       ; SAVE IN P1 OR P2 PLAYERS QB1

@set_rb_one_starter:	
	LDA (sram_addr),Y                                            ; 
	AND #$0F                                                     ; MASK UPPER NIBBLE STARTER TO GET 2ND STARTER
	STA GAME_PLAYERS[]+3,X                                       ; SAVE IN P1 OR P2 PLAYERS RB1
	INY                                                          ; P1 OR P2 IN GAME STARTER INDEX ++
	
@set_rb_two_starter:	
	LDA (sram_addr),Y                                            ; SHIFT 3RD STARTER FROM UPPER NIBBLE
	LOG_SHIFT_RIGHT_4
	STA GAME_PLAYERS[]+5,X                                       ;SAVE IN P1 OR P2 PLAYERS RB2
	
@set_wr_one_starter:	
	LDA (sram_addr),Y                                            ; 
	AND #$0F                                                     ;MASK UPPER NIBBLE STARTER TO GET 4TH STARTER
	STA GAME_PLAYERS[]+7,X                                      ;SAVE IN P1 OR P2 PLAYERS WR1
	INY                                                          ;P1 OR P2 IN GAME STARTER INDEX ++

@set_wr_two_starter:	
	LDA (sram_addr),Y                                            ;
	LOG_SHIFT_RIGHT_4                                            ;
	STA GAME_PLAYERS[]+9,X                                       ; SAVE IN P1 OR P2 PLAYERS WR2

@set_te_starter:	
	LDA (sram_addr),Y                                            ;
	AND #$0F                                                     ; MASK UPPER NIBBLE STARTER TO GET 6TH STARTER
	STA GAME_PLAYERS[]+11,X                                      ; SAVE IN P1 OR P2 PLAYERS TE
	INY                                                          ; P1 OR P2 IN GAME STARTER INDEX ++

@set_kr_starter:	
	LDA (sram_addr),Y                                            ; SHIFT 7TH STARTER FROM UPPER NIBBLE
	LOG_SHIFT_RIGHT_4 
	STA KR_PR_STARTERS[]+1,X 
																 ; SAVE IN P1 OR P2 PLAYERS KR
@set_pr_starter:	
	LDA (sram_addr),Y                                            ;
	AND #$0F                                                     ; MASK UP UPPER NIBBLE STARTER TO GET 8TH STARTER
	STA KR_PR_STARTERS[]+3,X                                     ; SAVE IN P1 OR P2 PLAYERS PR
	
	LDY #C_ROSTER_ID                                             ; SET STARTER VALUE = CENTER ROSTER ID
	
_WHILE CC                                                        ; SET OL,DEF,K,P TO DEFAULT STARTERS LOOP
	TYA                                                          ;
	STA OL_STARTERS[]+1,X                                          ; SAVE STARTER VALUE IN P1 OR P2 PLAYERS  
	INX                                                          ; PLAYER INDEX += OFFSET TO NEXT PLAYER
	INX                                                          ; 
	INY                                                          ;
	CPY #PUNTER_ROSTER_ID + 1                                    ; ALL PLAYERS LOADED?

_END_WHILE                                                       ; NO->SET OL,DEF,K,P TO DEFAULT STARTERS LOOP

	RTS                                                          ; RETURN

_F}_SET_DEFAULT_STARTERS_AND_PLAYBOOK 

_F{_CLEAR_PRE_SEASON_GAME_STATS_TRANSFER_SEASON_STARTERS_CONDITIONS_PLAYBOOKS_TO_P1_P2 ; DONE

season_sram_addr		= LOCAL_1
in_game_sram_addr		= LOCAL_3

	
CLEAR_IN_GAME_STATS_TRANSFER_SEASON_INFO:                        ; CLEAR P1/P2 GAME STATS. TRANSFER P1 AND P2 TEAMS PB, STARTERS, INJ, CONDITIONS TO CURRENT GAME P1/P2  
	MMC3_SRAM_WRITE_ENABLE 
	
	CLEAR_RAM_Y_INDEX[start_length] P1_GAME_STATS_START, SIZE_OF_IN_GAME_STATS 
	
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	LOAD_ADDR_XY[mem_loc] P1_GM_PLAYBOOK_START 
	JSR @transfer_from_season_to_in_game                         ; TRANSFER SEASON PLAYBOOK, STARTERS, INJURIES, CONDITIONS IN SRAM TO P1/P2 GAME DATA(X,Y= SRAM LOCATION)
	
	CLEAR_RAM_Y_INDEX[start_length] P2_GAME_STATS_START, SIZE_OF_IN_GAME_STATS 
	LDA P2_TEAM                                                  ; LOAD P2 TEAM
	LOAD_ADDR_XY[mem_loc] P2_GM_PLAYBOOK_START 
	JSR @transfer_from_season_to_in_game                         ; TRANSFER SEASON PLAYBOOK, STARTERS, INJURIES, CONDITIONS IN SRAM TO P1/P2 GAME DATA(X,Y= SRAM LOCATION)
	MMC3_SRAM_WRITE_DISABLE 
	RTS                                                          ; RETURN


	
@transfer_from_season_to_in_game:                                ; TRANSFER SEASON PLAYBOOK, STARTERS, INJ, COND FROM SEASON SRAM TO P1 OR P2 IN GAME SRAM(A= TEAM X,Y= SRAM ADDR)
	STY in_game_sram_addr                                        ; SAVE IN GAME P1 OR P2 SRAM ADDR
	STX in_game_sram_addr+1                                      ;
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON DATA SRAM LOCATION IN 3E 3F(A= TEAM ID, X,Y= ADDR)
	LDA season_sram_addr                                         ; = TEAM SEASON SRAM ADDR + OFFSET TO SEASON PLAYBOOK
	CLC                                                          ;
	ADC #PLAYBOOK_SEASON_STATS_OFFSET                            ;
	STA season_sram_addr                                         ;
	LDA season_sram_addr+1                                       ;
	ADC #$00                                                     ;
	
	STA season_sram_addr+1                                       ;

@copy_pb_starters_inj_conditions: 	
	LDY #$00                                                     ;
_WHILE CC                                                        ; TRANSFER PLAYBOOK, INJURIES , CONDITIONS FROM SEASON SRAM TO IN GAME SRAM
	LDA (season_sram_addr),Y                                     ;
	STA (in_game_sram_addr),Y                                    ;
	INY                                                          ;
	CPY #PB_STARTER_INJURY_COND_SIZE                             ; DONE TRANSFERRING INFO?
	
_END_WHILE                                                      ; NO-> TRANSFER PLAYBOOK, INJURIES , CONDITIONS FROM SEASON SRAM TO IN GAME SRAM
	
	RTS                                                          ; RETURN

_F}_CLEAR_PRE_SEASON_GAME_STATS_TRANSFER_SEASON_STARTERS_CODITIONS_PLAYBOOKS_TO_P1_P2 

_F{_TRANSFER_P1_P2_STARTERS_CONDITIONS_PLAYBOOKS_TO_SEASON_SRAM 			; DONE

team_sram_addr			= LOCAL_1
in_game_sram_addr		= LOCAL_3
SIZE_OF_STATS			= END_OF_SEASON_STATS - PLAYBOOK_SEASON_STATS_OFFSET

SAVE_TEMP_P1_P2_TEAM_INFO_TO_SEASON:                             ; TRANSFER SEASON PLAYBOOK, STARTERS, INJ, COND FROM IN GAME SRAM -> SEASON SRAM()
	MMC3_SRAM_WRITE_ENABLE

@transfer_p1_data	
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	LDY #<P1_GM_PLAYBOOK_START                                   ; SET P1 IN-GAME SRAM ADDRESS
	LDX #>P1_GM_PLAYBOOK_START                                   ;
	JSR @transfer_data                                           ; TRANSFER PLAYBOOK, STARTERS, INJ, COND FROM P1 OR P2 IN-GAME SRAM -> SEASON SRAM(A= TEAM X,Y= SRAM ADDR)

@transfer_p2_data	
	LDA P2_TEAM                                                  ; LOAD P2 TEAM
	LDY #<P2_GM_PLAYBOOK_START                                   ; SET P1 IN-GAME SRAM ADDRESS
	LDX #>P2_GM_PLAYBOOK_START                                   ;
	JSR @transfer_data                                           ; TRANSFER PLAYBOOK, STARTERS, INJ, COND FROM P1 OR P2 IN-GAME SRAM -> SEASON SRAM(A= TEAM X,Y= SRAM ADDR)
	
@set_checksum	
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN

@transfer_data :                                                 ; TRANSFER SEASON PLAYBOOK, STARTERS, INJ, COND FROM P1 OR P2 IN GAME SRAM TO SEASON SRAM(A= TEAM X,Y= SRAM ADDR)
	STY in_game_sram_addr                                        ; SAVE IN GAME SRAM ADDRESS
	STX in_game_sram_addr +1                                     ; 
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDA team_sram_addr                                           ; = TEAM SEASON SRAM LOCATION +
	CLC                                                          ;
	ADC #PLAYBOOK_SEASON_STATS_OFFSET                            ; OFFSET TO SEASON PLAYBOOK
	STA team_sram_addr                                           ;
	LDA team_sram_addr+1                                         ;
	ADC #$00                                                     ;
	STA team_sram_addr+1                                        ;
	LDY #$00                                                    ; SET DATA INDEX = FIRST PLAYBOOK BYTE
_WHILE  CC                                                      ; TRANSFER PLAYBOOK, STARTERS INJURIES , CONDITIONS FROM IN GAME SRAM TO SEASON SRAM 

	LDA (in_game_sram_addr),Y                                    ; TRANFER FROM IN GAME
	STA (team_sram_addr),Y                                       ; TO SEASON 
	INY                                                          ; 
	CPY #SIZE_OF_STATS                                                     ; DATA INDEX++

_END_WHILE                                                ; DONE TRANSFERRING INFO? NO-> TRANSFER PLAYBOOK,STARTERS INJURIES,CONDITIONS FROM IN GAME SRAM TO SEASON SRAM
	RTS                                                          ; RETURN

_F}_TRANSFER_P1_P2_STARTERS_CONDITIONS_PLAYBOOKS_TO_SEASON_SRAM  
	
_F{_DRAW_FINAL_SCORE_BOARD_END_OF_GAME_STATS								; DONE

scene_id		= LOCAL_6
	
DRAW_SCOREBOARD_SCENE:                                           ; DRAW SCOREBOARD/END OF GAME STATS (A= SCOREBOARD/END OF GAME DRAW EVENT INDEX)
	STA scene_id                                                 ; SAVE EVENT ID
	LDY #<END_OF_GAME_SCROEBOARD_IRQ_INFO                        ; LOAD IRQ SPLIT SCREEN INFO ADDRESS
	LDX #>END_OF_GAME_SCROEBOARD_IRQ_INFO                        ;
	JSR LOAD_IRQ_SPLIT_DATA                                      ; UPDATE IRQ SPLIT INFO(X,Y= IRQ INFO ADDRESS)
	LDA scene_id                                                 ; LOAD EVENT ID
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; SET BANK = BANK 8
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT ID, X = BANK)
	JMP CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()

_F}_DRAW_FINAL_SCORE_BOARD_END_OF_GAME_STATS 

_F{_CLEAR_SCOREBOARD_SCORES													; DONE

num_tiles 	= LOCAL_1
rows 		= LOCAL_2

NUMBER_OF_SCOREBOARD_ROWS					= $03
NUMBER_OF_SCOREBOARD_TILES_PER_ROW			= $0B

UPDATE_SCOREBOARD_CONDITIONS_SKP_MODE:                           ; UPDATE SCOREBOARD PPU, CLEAR PPU SECTION AND CLEAR SCORES
	JSR UPDATE_LARGE_SCOREBOARD                                  ; UPDATE SCOREBOARD PPU ()
	RETURN_IN_NUM_FRAMES 8
	JSR UPDATE_PLAYER_CONDITIONS                                 ; 
	LDA QUARTER                                                  ; IS QUARTER = OVERTIME
	CMP #OVERTIME_QUARTER                                        ; 
	BCC @exit                                                    ; NO-> EXIT UPDATE SCOREBOARD
	
@clear_scoreboard:	
	LDY #<SCOREBOARD_P1_Q1_PPU_ADDR	                             ; SET PPU ADDRESS = SCOREBOARD 
	LDX #>SCOREBOARD_P1_Q1_PPU_ADDR	                             ;
	LDA #NUMBER_OF_SCOREBOARD_ROWS                               ; SET ROWS =0x03  
	STA rows                                                     ;
	LDA #NUMBER_OF_SCOREBOARD_TILES_PER_ROW                      ; SET LENGTH = 0X0B
	STA num_tiles												 ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	
	CLEAR_RAM_Y_INDEX[start_length] P1_QTR_SCORES, $04
	CLEAR_RAM_Y_INDEX[start_length] P2_QTR_SCORES, $04
	
	RETURN_IN_NUM_FRAMES 4
@exit:                                                           ; EXIT UPDATE SCOREBOARD
	RTS                                                          ; RETURN
	
_F}_CLEAR_SCOREBOARD_SCORES 

_F{_DRAW_SCOREBOARD_QUARTER_SCORES											; DONE

ppu_addr 				= LOCAL_1

current_qtr_to_draw 	= LOCAL_5
number_of_qtrs_to_draw  = LOCAL_6
size_of_two_rows		= $40
scoreboard_qtr_spacing  = $03

UPDATE_LARGE_SCOREBOARD:                                         ; UPDATE SCOREBOARD PPU ROUTINE
	LDA #<SCOREBOARD_P1_Q1_PPU_ADDR                              ; SET PPU ADDR = $218A = P1 FIRST QTR SCORE LOCATION
	STA ppu_addr                                                 ;
	LDA #>SCOREBOARD_P1_Q1_PPU_ADDR                              ;
	STA ppu_addr+1                                               ;
	LDA QUARTER                                                  ; LOAD QTR 
	BEQ @exit                                                    ; IS FIRST QUARTER? YES-> BRANCH TO EXIT 
	CMP #(OVERTIME_QUARTER +1)                                   ; IS QTR = END OF OVERTIME
	BNE @save_qtrs_to_draw                                       ; NO
	LDA #$01                                                     ; YES-> SET NUMBER OF QUARTERS TO DRAW OT = 1
@save_qtrs_to_draw:                                                          ;
	STA number_of_qtrs_to_draw                                   ; SAVE # OF QTRS TO DRAW
	LDA #$00                                                     ; SET CURRENT QTR INDEX = FIRST
	STA current_qtr_to_draw                                      ; 
@draw_qtr_scores_loop:                                                          ; DRAW QTR SCORE VALUES ON SCOREBOARD LOOP
	LDX current_qtr_to_draw                                      ; LOAD P1 QTR SCORE
	LDA P1_QTR_SCORES,X                                                  ; 
	LDY ppu_addr                                                 ; LOAD PPU ADDR
	LDX ppu_addr+1                                               ; 
	JSR CONVERT_2_DIG_NUM_TILES                                  ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(X,Y= PPUADDR, A=NUMBER)
	LDX current_qtr_to_draw                                                      ; LOAD P2 QTR SCORE
	LDA P2_QTR_SCORES,X                                                  ; 
	PHA                                                          ; SAVE P2 QTR SCORE
	LDA ppu_addr                                                 ; SET PPU ADDR = TWO ROWS DOWN
	CLC                                                          ;
	ADC #size_of_two_rows                                        ; 
	TAY                                                          ;
	LDX ppu_addr+1                                               ;
	PLA                                                          ; LOAD P2 QTR SCORE
	JSR CONVERT_2_DIG_NUM_TILES                                  ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(X,Y= PPUADDR, A=NUMBER)
	LDA ppu_addr                                                 ; SET PPU ADDR += SCOREBOARD QTR SPACING
	CLC                                                          ;
	ADC #scoreboard_qtr_spacing                                  ;
	STA ppu_addr                                                 ;
	LDA ppu_addr+1                                               ;
	ADC #$00                                                     ;
	STA ppu_addr+1                                               ;
	INC current_qtr_to_draw                                      ; CURRENT QTR INDEX++
	DEC number_of_qtrs_to_draw                                   ; # OF QTRS TO DRAW--
	BNE @draw_qtr_scores_loop                                    ; DONE? NO->DRAW QTR SCORE VALUES ON SCOREBOARD LOOP
	LDY #<SCOREBOARD_P1_TOTAL_PPU_ADDR                           ; SET PPU ADDR = SCOREBOARD P1 TOTAL SCORE
	LDX #>SCOREBOARD_P1_TOTAL_PPU_ADDR                           ;
	LDA P1_TOTAL_SCORE                                           ; LOAD P1 TOTAL SCORE
	JSR CONVERT_2_DIG_NUM_TILES                                  ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(X,Y= PPUADDR, A=NUMBER)
	LDY #<SCOREBOARD_P2_TOTAL_PPU_ADDR                           ; SET PPU ADDR = SCOREBOARD P2 TOTAL SCORE
	LDX #>SCOREBOARD_P2_TOTAL_PPU_ADDR                           ;
	LDA P2_TOTAL_SCORE                                           ; LOAD P2 TOTAL SCORE
	JSR CONVERT_2_DIG_NUM_TILES                                  ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(X,Y= PPUADDR, A=NUMBER)
@exit:                                                          ; EXIT
	RTS                                                          ; RETURN

_F}_DRAW_SCOREBOARD_QUARTER_SCORES 
																
_F{_STARTERS_RESERVES_POS_NAME_LOC_DATA										; DONE except PPDU ADDR 
	
OFF_PLAYERS_NAME_POSITIONING:

@two_wr_name_positioning:										; TWO_BACKS
	.WORD $2185                                                  ; QB1
	.WORD $21C5                                                  ; RB1
	.WORD $21E5                                                  ; RB2
	.WORD $2225                                                  ; WR1
	.WORD $2245                                                  ; WR2
	.WORD $2285                                                  ; TE
	.WORD $2305                                                  ; KR
	.WORD $2345                                                  ; PR
	
	.WORD $2194                                                  ; QB2
	.WORD $21F4                                                  ; RB3
	.WORD $2214                                                  ; RB4
	.WORD $2294                                                  ; WR3
	.WORD $22B4                                                  ; WR4
	.WORD $2334                                                  ; TE

@four_wr_name_positioning:										; RUN_AND_SHOOT
	.WORD $2185                                                  ; QB1
	.WORD $21C5                                                  ; RB1
	.WORD $2205                                                  ; WR3
	.WORD $2225                                                  ; WR1
	.WORD $2245                                                  ; WR2
	.WORD $2265                                                  ; WR4
	.WORD $2305                                                  ; KR
	.WORD $2345                                                  ; PR


	.WORD $2194                                                  ; QB2
	.WORD $21F4                                                  ; RB2
	.WORD $2214                                                  ; RB3
	.WORD $2234                                                  ; RB4
	.WORD $2294                                                  ; WR5
	.WORD $22B4                                                  ; WR6

@three_wr_name_positioning:	
	.WORD $2185                                                  ; QB1
	.WORD $21C5                                                  ; RB1
	.WORD $2205                                                  ; WR3
	.WORD $2225                                                  ; WR1
	.WORD $2245                                                  ; WR2
	.WORD $2285                                                  ; TE 
	.WORD $2305                                                  ; KR
	.WORD $2345                                                  ; PR
	
	.WORD $2194                                                  ; QB2
	.WORD $21F4                                                  ; RB2
	.WORD $2214                                                  ; RB3
	.WORD $2234                                                  ; RB4
	.WORD $2294                                                  ; WR4
	.WORD $2334                                                  ; TE2

_F}_STARTERS_RESERVES_POS_NAME_LOC_DATA 
																
_F{_STARTERS_ARROW_SPR_LOC_DATA         									; DONE        
			
STARTERS_FORMATION_POSITIONING_TABLE:												; used for setting the sprites in the upper half of change players

@two_wr_formation_spr_locations											    ; 2 WR
	.BYTE $30,$78
	.BYTE $40,$60
	.BYTE $40,$90
	.BYTE $28,$38
	.BYTE $30,$C8
	.BYTE $28,$A8

@four_wr_formation_spr_locations										    ; 4 WR
	.BYTE $30,$78
	.BYTE $40,$78
	.BYTE $30,$48
	.BYTE $28,$18
	.BYTE $28,$D8
	.BYTE $30,$A8
	
@three_wr_formation_spr_locations										    ; 3 WR
	.BYTE $30,$78
	.BYTE $40,$78
	.BYTE $30,$40
	.BYTE $30,$18
	.BYTE $28,$D8
	.BYTE $28,$A8

_F}_STARTERS_ARROW_SPR_LOC_DATA  

_F{_PLAYERS_INJURY_MARKER_SPR_LOC_DATA  						 			; DONE
																
INJURY_MARKER_POSITIONING_SPR_TABLE

@two_wr_injury_marker_locations:
	.BYTE $60,$20
	.BYTE $70,$20
	.BYTE $78,$20
	.BYTE $88,$20
	.BYTE $90,$20
	.BYTE $A0,$20
	.BYTE $C0,$20
	.BYTE $D0,$20
	.BYTE $60,$98
	.BYTE $78,$98
	.BYTE $80,$98
	.BYTE $A0,$98
	.BYTE $A8,$98
	.BYTE $C8,$98
	
@four_wr_injury_marker_locations:																
	.BYTE $60,$20
	.BYTE $70,$20
	.BYTE $80,$20
	.BYTE $88,$20
	.BYTE $90,$20
	.BYTE $98,$20
	.BYTE $C0,$20
	.BYTE $D0,$20
	.BYTE $60,$98
	.BYTE $78,$98
	.BYTE $80,$98
	.BYTE $88,$98
	.BYTE $A0,$98
	.BYTE $A8,$98
	
@three_wr_injury_marker_locations:																
	.BYTE $60,$20
	.BYTE $70,$20
	.BYTE $80,$20
	.BYTE $88,$20
	.BYTE $90,$20
	.BYTE $A0,$20
	.BYTE $C0,$20
	.BYTE $D0,$20
	.BYTE $60,$98
	.BYTE $78,$98
	.BYTE $80,$98
	.BYTE $88,$98
	.BYTE $A0,$98
	.BYTE $C8,$98
	
_F}_PLAYERS_INJURY_MARKER_SPR_LOC_DATA 

_F{_STARTERS_RESERVES_MENU_DATA_POINTERS								   ; DONE
	
STARTER_MENU_DATA_TABLE:                                         ; STARTER_SELECT
	.WORD TWO_WR_STARTER_MENU_OPTIONS_DATA                       ; TWO_WR_STARTER_SELECT 
	.WORD FOUR_WR_STARTER_MENU_OPTIONS_DATA                      ; FOUR_WR_STARTER_SELECT
	.WORD THREE_WR_STARTER_MENU_OPTIONS_DATA                     ; THREE_WR_STARTER_SELECT

IN_GAME_STARTER_MENU_DATA_TABLE:
	.WORD TWO_WR_IN_GAME_STARTER_MENU_OPTIONS_DATA               ; TWO_WR_GAME_STARTER_SELECT 
	.WORD FOUR_WR_IN_GAME_STARTER_MENU_OPTIONS_DATA              ; FOUR_WR_GAME_STARTER_SELECT 
	.WORD THREE_WR_IN_GAME_STARTER_MENU_OPTIONS_DATA             ; THREE_WR_STARTER_SELECT
	
RESERVE_MENU_DATA_TABLE:                                         ; RESERVE_SELECT:
	.WORD TWO_WR_RESERVE_MENU_OPTIONS_DATA                       ; TWO_WR_RESERVE_SELECT 
	.WORD FOUR_WR_RESERVE_MENU_OPTIONS_DATA                      ; FOUR_WR_RESERVE_SELECT 
	.WORD THREE_WR_RESERVE_MENU_OPTIONS_DATA                     ; THREE_WR_RESERVE_SELECT
	
RETURNER_MENU_DATA_TABLE:                                        ; RETURNER_SELECT
	.WORD TWO_WR_RETURNER_MENU_OPTIONS_DATA                      ; TWO_WR_RETURNER_SELECT 
	.WORD FOUR_WR_RETURNER_MENU_OPTIONS_DATA                     ; FOUR_WR_RETURNER_SELECT 
	.WORD THREE_WR_RETURNER_MENU_OPTIONS_DATA                    ; THREE_WR_RETURNER_SELECT

_F}_STARTERS_RESERVES_MENU_DATA_POINTERS 

_F{_POINTERS_TO_RESERVE_PLAYER_DATA_LOCATIONS_SRAM							; DONE
	
COM_SUB_RESERVE_CHOICE_OFFSET_TABLES:

TWO_WR_COM_SUB_OFFSET_TABLE:                                                       			          ; 2 WR RESERVE COM SUB OFFSET POINTERS
	.WORD QB_RESERVE_OFFSET 
	.WORD RB_KR_PR_RESERVE_OFFSET
	.WORD RB_KR_PR_RESERVE_OFFSET 
	.WORD TWO_WR_RESERVE_OFFSET 
	.WORD TWO_WR_RESERVE_OFFSET 
	.WORD TE_OR_FOURTH_WR_RESERVE_OFFSET 
	.WORD RB_KR_PR_RESERVE_OFFSET
	.WORD RB_KR_PR_RESERVE_OFFSET

THREE_FOUR_WR_COM_SUB_OFFSET_TABLE:                                                        			; 3 AND 4 WR RESERVE COM SUB OFFSET POINTERS
	.WORD QB_RESERVE_OFFSET
	.WORD RB_KR_PR_RESERVE_OFFSET
	.WORD THREE_OR_MORE_WR_RESERVE_OFFSET
	.WORD THREE_OR_MORE_WR_RESERVE_OFFSET 
	.WORD THREE_OR_MORE_WR_RESERVE_OFFSET
	.WORD TE_OR_FOURTH_WR_RESERVE_OFFSET
	.WORD RB_KR_PR_RESERVE_OFFSET
	.WORD RB_KR_PR_RESERVE_OFFSET

OFFSET_TO_THREE_FOUR_WR_COM_SUB_TABLE		= 	THREE_FOUR_WR_COM_SUB_OFFSET_TABLE  - TWO_WR_COM_SUB_OFFSET_TABLE

QB_RESERVE_OFFSET: 					.DB $10                                             			; QB RESERVE OFFSET
RB_KR_PR_RESERVE_OFFSET: 			.DB $12, $14, $16, $18, $1A, $06, $08               			; RB,KR,PR RESERVE OFFSET
THREE_OR_MORE_WR_RESERVE_OFFSET: 	.DB $18, $1A, $16, $12, $14                         			; 1ST, 2ND, 3RD, WR OFFSETS FOR 3+ wr FORMS
TWO_WR_RESERVE_OFFSET: 				.DB $16, $18, $12, $14, $1A                         			; 2WR FORM WR OFFSETS
TE_OR_FOURTH_WR_RESERVE_OFFSET: 	.DB $1A, $12, $14, $16, $18, $12, $14, $16, $18, $1A			; TE, 4TH WR RESERVE OFFSETS

_F}_POINTERS_TO_RESERVE_PLAYER_DATA_LOCATIONS_SRAM

_F{_EMPTY_SPACE_MENU_BANK													; DONE

.PAD $A000, $00

_F}_EMPTY_SPACE_MENU_BANK 

_F{_GAMEPLAY_START_GAME                                      				; DONE
	
text_justify         = LOCAL_8
CITY_TEXT_JUSTIY     = $10                                     ; = CENTER OF SCREEN
MASCOT_TEXT_JUSIFY   = $0A                                     ; =  LEFT OF CENTER 

DO_GAME:                                                       ; TEAM 1 VS TEAM 2 HELMET AND NAME START
	JSR CHECK_IF_GAME_TYPE_SKIP_MODE                            ; IS GAME TYPE SKIP MODE () CS= IN SKIP CC= DONE OR NOT IN SKIP()
	BCS CLEAR_IN_GAME_TEAM_STATS                                 ; YES-> SKP MODE START/ CLEAR TEAM STATS START
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	JSR DRAW_LARGE_HELMETS_FOR_MATCHUP                          ; LOAD TEAM HELMETS()
	LDA #CITY_TEXT_JUSTIY                                       ; SET TEXT ALIGNMENT = CENTER OF SCREEN
	STA text_justify                                             ;
	LDY #<GAME_MATCHUP_P1_TEAM_CITY_PPU_ADDR                     ; SET PPU P1 LARGE CITY ADDRESS  = $2140
	LDX #>GAME_MATCHUP_P1_TEAM_CITY_PPU_ADDR                      ;
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	CLC                                                          ;
	ADC #OFFSET_TO_TEAM_CITY_POINTERS                            ; LOAD OFFSET TO TEAM CITY POINTER
	JSR DRAW_TEAM_INFO_LARGE_JUSTIFY                             ; DRAW TEAM INFO( $45= INFO TO DRAW, X,Y=PPU ADDR,  A= TEAM +OFFSET)
	LDA #MASCOT_TEXT_JUSIFY                                                     ; SET TEXT ALIGNMENT = SLIGHTLY LEFT OF CENTER
	STA text_justify                                             ;
	LDY #<GAME_MATCHUP_P1_TEAM_MASCOT_PPU_ADDR                   ; SET PPU P1 LARGE TEAM NAME ADDRESS = $2186
	LDX #>GAME_MATCHUP_P1_TEAM_MASCOT_PPU_ADDR                   ;
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	CLC                                                          ; 
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                                                     ; LOAD OFFSET TO TEAM NAME POINTER
	JSR DRAW_TEAM_INFO_LARGE_JUSTIFY                             ; DRAW TEAM INFO( $45= INFO TO DRAW, X,Y=PPU ADDR,  A= TEAM +OFFSET)
	LDA #CITY_TEXT_JUSTIY                                                     ; SET TEXT ALIGNMENT = CENTER OF SCREEN
	STA text_justify                                             ;
	LDY #<GAME_MATCHUP_P2_TEAM_CITY_PPU_ADDR                                                 ; SET PPU P2 LARGE CITY NAME ADDRESS  = $2300
	LDX #>GAME_MATCHUP_P2_TEAM_CITY_PPU_ADDR                                                  ;
	LDA P2_TEAM                                                  ; LOAD P2 TEAM
	CLC                                                          ;
	ADC #OFFSET_TO_TEAM_CITY_POINTERS                                                     ; LOAD OFFSET TO TEAM CITY POINTER
	JSR DRAW_TEAM_INFO_LARGE_JUSTIFY                             ; DRAW TEAM INFO( $45= INFO TO DRAW, X,Y=PPU ADDR,  A= TEAM +OFFSET)
	LDA #MASCOT_TEXT_JUSIFY                                                     ;
	STA text_justify 
	LDY #<GAME_MATCHUP_P2_TEAM_MASCOT_PPU_ADDR                                                 ; SET PPU P2 LARGE TEAM NAME ADDRESS = $2346
	LDX #>GAME_MATCHUP_P2_TEAM_MASCOT_PPU_ADDR                                                  ;
	LDA P2_TEAM                                                  ; LOAD P2 TEAM
	CLC                                                          ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                                                     ; LOAD OFFSET TO TEAM NAME POINTER
	JSR DRAW_TEAM_INFO_LARGE_JUSTIFY                             ; DRAW TEAM INFO( $45= INFO TO DRAW, X,Y=PPU ADDR,  A= TEAM +OFFSET)
	JSR FADE_IN_BG_AND_SPR_PAL                                   ; FADE IN BACKGROUND AND SPRITE PALLETES()
	LDX #$78                                                     ; LOAD 120 FRAMES = 2 SEC DELAY  = TEAM 1 VS TEAM 2 HELMET AND NAME DELAY
	JSR CONTINUE_SCENE_UNLESS_B_PRESSED                          ; WAIT X FRAMES OR CONTINUE IF B PRESSED(X= FRAMES TO WAIT), FADE OUT PALLETTE()
	
_F}_GAMEPLAY_START_GAME 

_F{_GAMEPLAY_CLEAR_STATS										         	; DONE EXCEPT ADDR

CLEAR_IN_GAME_TEAM_STATS:                                                       ; SKP MODE OR PROBOWL START/ CLEAR TEAM STATS START
	MMC3_SRAM_WRITE_ENABLE 
	
	CLEAR_RAM_Y_INDEX[start_length] IN_GAME_TEAM_STATS[], SIZE_OF_TEAM_STATS
	
	MMC3_SRAM_WRITE_DISABLE
	
	LDA #SET_COM_JUICE_VALUES_BANK                               ; SET BANK = 27
	LDY #<$800F                                                  ; SET ADDRESS  = $800F = SET COMPUTER JUICE VALUES()
	LDX #>$800F                                                  ;
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                           ; SWAP 8000 BANK AND JUMP( A= BANK, X,Y=  ADDRESS)

@clear_qtr_scores_and_total_score	
	CLEAR_RAM_Y_INDEX[start_length] QTR_SCORES[], SIZE_OF_ALL_SCORES 
	
	 
_F}_GAMEPLAY_CLEAR_STATS

_F{_GAMEPLAY_CHECK_DRAW_PLAYOFF_BRACKET_COIN_TOSS              				; DONE
	
PLAYOFF_BRACKET_SCROLL_FRAMES                            = $80
AFC_PLAYOFF_MATCH_SCROLL_DIR_SPEED                       = $01 
NFC_PLAYOFF_MATCH_SCROLL_DIR_SPEED                       = $02 
SUPERBOWLF_MATCH_SCROLL_DIR_SPEED                        = $01 

@draw_playoff_bracket_check 
    IF_GAME_STATUS_NOT_SEASON[ADDR] COIN_TOSS_START
	
	LDA CURRENT_WEEK_IN_SEASON                                   ; IS CURRENT WEEK < PLAYOFFS  
	CMP #FIRST_WEEK_OF_PLAYOFFS                                  ; 
	BCC @check_for_skp_vs_skp_game                                ; YES-> BRANCH TO CHECK FOR CHECK FOR SKIP MODE

@draw_playoff_bracket 
	JSR FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0                      ; FADE OUT PAL, CLEAR IRQ0 XSCROLL,COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES()
	LDA #PLAYOFF_BRACKET_TEAM_NAMES_SCREEN_ID                    ; LOAD PLAYOFF BRACKET DRAW EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; LOAD BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	JSR DRAW_ONE_SIDE_OF_PLAYOFF_BRACKET                         ; DRAW PLAY OFF BRACKET SINGLE SCREEN()
	RETURN_IN_NUM_FRAMES 120
	LDA CURRENT_GAME_IN_WEEK                                     ; IS CURRENT GAME IN PLAYOFFS = SUPER BOWL
	CMP #SUPERBOWL_GAME_ID                               ;
	BEQ @scroll_to_super_bowl_match                              ; 

	LSR                                                          ;
	BCS @scroll_to_nfc_match                                     ;

@do_afc_match_no_scroll
	LDX #AFC_PLAYOFF_MATCH_SCROLL_DIR_SPEED                                                     ; LOAD 1 FRAME
	JSR CONTINUE_SCENE_UNLESS_B_PRESSED                          ; WAIT X FRAMES OR CONTINUE IF B PRESSED(X= FRAMES TO WAIT), FADE OUT PALLETTE()
	JMP @check_for_skp_vs_skp_game                               ; JUMP TO CHECK FOR SKIP MODE

@scroll_to_nfc_match:
	LDA #NFC_PLAYOFF_MATCH_SCROLL_DIR_SPEED                                                     ; SET BRACKET SCROLL PER FRAME = 2 
	LDX #PLAYOFF_BRACKET_SCROLL_FRAMES                           ; SET SCROLL FRAMES = 80
	JMP @scroll_playoff_bracket                                                  ;

@scroll_to_super_bowl_match:                                    ; 
	LDA #SUPERBOWLF_MATCH_SCROLL_DIR_SPEED                      ; SET BRACKET SCROLL PER FRAME = 1
	LDX #PLAYOFF_BRACKET_SCROLL_FRAMES                           ; SET SCROLL FRAMES = 80

@scroll_playoff_bracket:
	JSR SCROLL_PLAYOFF_BRACKET_NUM_FRAMES                        ; SCROLL PLAYOFF BRACKET(A= DIRECTION + SCROLL SPEED, X= # FRAMES)
	LDX #$78                                                     ; LOAD 120 FRAMES=  2 SECOND DELAY
	JSR CONTINUE_SCENE_UNLESS_B_PRESSED                          ; WAIT X FRAMES OR CONTINUE IF B PRESSED(X= FRAMES TO WAIT), FADE OUT PALLETTE()
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	JSR FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0                      ; FADE OUT PAL, CLEAR IRQ0 XSCROLL,COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES()
	RETURN_IN_NUM_FRAMES 10

@check_for_skp_vs_skp_game:                                                          ; CHECK FOR SKIP MODE
	LDA TEAM_CONTROL_TYPES                                       ; BOTH PLAYER TYPES = SKIP MODE?
	CMP #(P1_TEAM_SKP_CTRL + P2_TEAM_SKP_CTRL)                    ; 
	BNE COIN_TOSS_START                                          ; NO-> BRANCH TO COIN TOSS START 
	JMP DO_SIM_MODE_GAME_LOOP                                     ; YES-> JUMP TO SKIP MODE START

_F}_GAMEPLAY_CHECK_DRAW_PLAYOFF_BRACKET_COIN_TOSS
	
_F{_NORMAL_GAME_LOOP											            ; DONE EXCEPT ADDR

TIMEOUTS_PER_HALF 			= $03
	
COIN_TOSS_START:                                                 ; COIN TOSS START
	JSR DO_COIN_TOSS                                             ; COIN TOSS ANIMATION AND CHOICE()
	LDA GAME_STATUS                                              ; SET KICKOFF STATUS IN BALL STATUS
	LOG_SHIFT_RIGHT_4											 ; 
	AND #$01                                                     ; 
	STA BALL_STATUS                                              ; 
	LDA #TIMEOUTS_PER_HALF                                       ; SET NUMBER OF TIMEOUTS PER HALF = 3 
	STA P1_TIMEOUTS                                              ; SAVE IN P1 TIMEOUTS
	STA P2_TIMEOUTS                                              ; SAVE IN P2 TIMEOUTS
	LDA #FIRST_QUARTER                                            ; SET CURRENT QUARTER TO FIRST QUARTER
	STA QUARTER                                                  ; 
	JSR START_QUARTER_GAMEPLAY_UPDATE_CLOCK_TASK                 ; DO QUARTER GAMEPLAY LOOP()
	
@update_conditions: 	
	JSR UPDATE_PLAYER_CONDITIONS                                 ; UPDATE CONDITIONS()
	LDA #END_QTR_SONG                                            ; LOAD END OF QUARTER SOUND 
	JSR PLAY_SOUND                                               ; SET NEXT SOUND TO PLAY (A= SOUND TO PLAY)
	INC QUARTER                                                  ; SET CURRENT QUARTER TO SECOND QUARTER
	LDA #SCOREBOARD_Q1_SCENE_ID                                  ; LOAD Q1 SCOREBOARD DRAW EVENT INDEX
	JSR DRAW_SCOREBOARD_SCENE                                    ; DRAW SCOREBOARD/END OF GAME STATS (A= SCOREBOARD/END OF GAME DRAW EVENT INDEX)

@start_of_second_qtr:	
	JSR START_QUARTER_GAMEPLAY_UPDATE_CLOCK_TASK                 ; DO QUARTER GAMEPLAY LOOP()
	INC QUARTER                                                  ; SET CURRENT QUARTER TO THIRD QUARTER
	LDA #SCOREBOARD_Q2_SCENE_ID                                  ; LOAD Q2 SCOREBOARD DRAW EVENT INDEX
	JSR DRAW_SCOREBOARD_SCENE                                    ; DRAW SCOREBOARD/END OF GAME STATS (A= SCOREBOARD/END OF GAME DRAW EVENT INDEX)
	
@halftime:	
	JSR DO_HALFTIME_SHOW:                                        ; DO HALFTIME SHOW() 
	JSR UPDATE_PLAYER_CONDITIONS                                 ; UPDATE CONDITIONS()
	LDA GAME_STATUS                                              ; SET WHO IS KICKING OFF IN BALL STATUS
	LOG_SHIFT_RIGHT_4
	EOR #$01                                                     ;
	AND #$01                                                     ;
	STA BALL_STATUS                                              ; 
	LDA #TIMEOUTS_PER_HALF                                       ; LOAD NUMBER OF TIMEOUTS PER HALF
	STA P1_TIMEOUTS                                         ; SAVE IN P1 TIMEOUTS
	STA P2_TIMEOUTS                                         ; SAVE IN P2 TIMEOUTS

@start_of_third_qtr:	
	JSR START_QUARTER_GAMEPLAY_UPDATE_CLOCK_TASK                 ; DO QUARTER GAMEPLAY LOOP()
	JSR UPDATE_PLAYER_CONDITIONS                                 ; UPDATE CONDITIONS()
	LDA #END_QTR_SONG                                            ; LOAD END OF QUARTER SOUND
	JSR PLAY_SOUND                                               ; SET NEXT SOUND TO PLAY (A= SOUND TO PLAY)
	INC QUARTER                                                  ; SET CURRENT QUARTER TO FOURTH QUARTER
	LDA #SCOREBOARD_Q3_SCENE_ID                                  ; LOAD Q3 SCOREBOARD DRAW EVENT INDEX
	JSR DRAW_SCOREBOARD_SCENE                                     ; DRAW SCOREBOARD/END OF GAME STATS (A= SCOREBOARD/END OF GAME DRAW EVENT INDEX)
	
@start_of_fourth_qtr:	
	JSR START_QUARTER_GAMEPLAY_UPDATE_CLOCK_TASK                  ; DO QUARTER GAMEPLAY LOOP()
	
@check_for_tie_game: 	
	LDA P1_TOTAL_SCORE                                           ;  HOME TOTAL SCORE
	CMP P2_TOTAL_SCORE                                           ;  == AWAY TOTAL SCORE ?
	BEQ @start_of_overtime                                        ; YES-> BRANCH TO OVERTIME START 
	
@do_end_of_game_stats: 	
	LDA #SCOREBOARD_4Q_THEN_STATS_SCENE_ID                       ; LOAD BLUE SCREEN STATS INDEX
	JMP DRAW_SCOREBOARD_SCENE                                    ; JUMP-> DRAW SCOREBOARD/END OF GAME STATS (A= SCOREBOARD/END OF GAME DRAW EVENT INDEX)

@start_of_overtime:                                              ; OVERTIME START
	LDA #SCOREBOARD_ALL_QTRS_SCENE_ID                            ; LOAD OT SCOREBOARD DRAW EVENT INDEX
	JSR DRAW_SCOREBOARD_SCENE                                    ; DRAW SCOREBOARD/END OF GAME STATS (A= SCOREBOARD/END OF GAME DRAW EVENT INDEX)
	
@clear_p1_scores
    CLEAR_RAM_Y_INDEX[start_length]	P1_QTR_SCORES, 4			; only clears qtr scores not total


@clear_p2_scores	
	CLEAR_RAM_Y_INDEX[start_length]	P2_QTR_SCORES, 4 			 ; only clears qtr scores not total	
	
	INC QUARTER                                                  ; SET CURRENT QUARTER TO OVERTIME
	JSR DO_OVER_TIME_COIN_TOSS                                   ; DO OVERTIME COIN TOSS()
	LDA GAME_STATUS                                              ; IS GAME TYPE == PLAYOFFS
	AND #$03                                                     ;
	CMP #$03                                                     ; 
	BEQ @start_of_playoff_overtime                               ; YES-> PLAYOFF OVERTIME UNTIMED QTR 
	
@start_of_regular_overtime	
	JSR START_QUARTER_GAMEPLAY_UPDATE_CLOCK_TASK                 ; 
	LDA #SCOREBOARD_OT_THEN_STATS_SCENE_ID                       ; LOAD OVERTIME BLUE SCREEN INDEX
	JMP DRAW_SCOREBOARD_SCENE                                    ; JUMP-> DRAW SCOREBOARD/END OF GAME STATS (A= SCOREBOARD/END OF GAME DRAW EVENT INDEX)

@start_of_playoff_overtime                                       ; PLAYOFF OVERTIME UNTIMED QTR
	SET_ADDR_XY[addr] SMALL_LARGE_LETTERS_LOGO_IRQ_INFO 
	JSR LOAD_IRQ_SPLIT_DATA                                      ; LOAD IRQ SPLIT INFO(Y,X= IRQ INFO ADDRESS)
	LDA #$00                                                     ; CLEAR P1 AND P2 TIMEOUTS
	STA P1_TIMEOUTS                                              ;
	STA P2_TIMEOUTS                                              ;
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	LDA #HIGH_LEVEL_GAME_LOGIC_BANK_1                            ; SET GAME PLAY CHECK TASK BANK = 19
	STA GAMEPLAY_TASK + TASK_BANK                                ; 
	LDY #<(BANK_JUMP_ON_FIELD_GAMEPLAY_START-1)                  ; SET TASK ADDR = DO KICKOFF *** can replace with actual
	LDA #>(BANK_JUMP_ON_FIELD_GAMEPLAY_START-1)                  ;
	LDX #GAMEPLAY_TASK                                           ; SET TASK INDEX = TASK 2
	JSR CREATE_TASK                                              ; CREATE TASK (X= TASK INDEX, Y,A= TASK ADDRESS)
	
	LDA #BANNER_ANIMATION_BANK                                   ; SET TASK BANK = 23
	STA BANNER_TASK + TASK_BANK                                  ; 
	LDY #<(BANK_JUMP_BANNER_TASK_START-1)                        ; SET TASK ADDR = UPDATE SLIDEBAR *** can use actual
	LDA #>(BANK_JUMP_BANNER_TASK_START-1)                                  ;
	LDX #BANNER_TASK                                             ; SET TASK INDEX = TASK 3
	JSR CREATE_TASK                                              ; CREATE TASK (X= TASK INDEX, Y,A= TASK ADDRESS)
	
_WHILE EQUAL                                                     ; CHECK FOR GAME OVER

	RETURN_1_FRAME  
	LDA P1_TOTAL_SCORE                                           ; P1 TOTAL SCORE = P2 TOTAL SCORE?
	CMP P2_TOTAL_SCORE                                           ;
	
_END_WHILE                                                       ; YES-> CHECK FOR GAME OVER
	
	SET_GAME_STATUS_QTR_OVER[]
	
_WHILE NOT_EQUAL                                                  ; CHECK FOR OVERIMTE GAME OVER LOOP
	RETURN_1_FRAME  
	LDA GAME_STATUS                                              ; DOES GAME STATUS = GAME OVER?
	AND #$08                                                     ; 
_END_WHILE                                                 		 ; NO-> CHECK FOR OVERIMTE GAME OVER LOOP
	LDA #SCOREBOARD_OT_THEN_STATS_SCENE_ID                       ; LOAD OVERTIME END OF GAME STATS
	JMP DRAW_SCOREBOARD_SCENE                                    ; JUMP-> DRAW SCOREBOARD/END OF GAME STATS (A= SCOREBOARD/END OF GAME DRAW EVENT INDEX)     

_F}_NORMAL_GAME_LOOP
	
_F{_SIM_MODE_GAME_LOOP											 ; DONE EXCEPT ADDR
	
DO_SIM_MODE_GAME_LOOP:                                           ; SKIP MODE START
	SET_ADDR_XY[addr] SMALL_LARGE_LETTERS_LOGO_IRQ_INFO 
	JSR LOAD_IRQ_SPLIT_DATA                                      ; LOAD IRQ SPLIT INFO(Y,X= IRQ INFO ADDRESS)
	LDA #SCOREBOARD_NO_QTRS_SCENE_ID                             ;
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ;      
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	RETURN_IN_NUM_FRAMES 10 
	LDA GAME_STATUS                                              ; IS GAME STATUS = PLAYOFFS?
	AND #$03                                                     ;
	CMP #$03                                                     ;
	LDA #$00                                                     ;
	ROL                                                          ; SAVE PLAYOFF STATUS IN CARRY 
	STA SIM_IS_IS_PLAYOFFS_BOOL                                  ; SAVE GAME TYPE IN $61F
	LDA #PLAY_CALL_SCREEN_BANK                                   ; LOAD BANK 20     
	LDY #<$880F                                              	 ; LOAD SKP MODE LOAD OFFENSIVE STYLE AND RUNNER INFORMATION ADDRESS
	LDX #>$880F                                              	 ;
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                           ; SWAP 8000 BANK AND JUMP( A= BANK, Y,X=  JUMP ADDRESS)


	TRANSFER_SRAM_TO_RAM_Y_INDEX[source_dest_length] P1_CONDITIONS_START, P1_SIM_CONDITIONS[], $08 ; *** FIX LNEGTH TO NOT MAGIC NUMBER  
	
	TRANSFER_SRAM_TO_RAM_Y_INDEX[source_dest_length] P2_CONDITIONS_START, P2_SIM_CONDITIONS[], $08 ; *** FIX LNEGTH TO NOT MAGIC NUMBER 
	
	JSR SWAP_AND_DO_SKP_MODE                                     ; CALCULATE SKP MODE STATS()
	MMC3_SRAM_WRITE_ENABLE    
	
	TRANSFER_RAM_TO_SRAM_Y_INDEX[source_dest_length] P1_P2_SIM_TEAM_STATS[], IN_GAME_TEAM_STATS[], SIZE_OF_TEAM_STATS

	MMC3_SRAM_WRITE_DISABLE   
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	JSR CHECK_IF_GAME_TYPE_SKIP_MODE                             ; IS GAME TYPE SKIP MODE. IF SKIP MODE IS IT DONE () C SET= IN SKIP C CLR= DONE OR NOT IN SKIP()
	BCS @update_scoreboard                                       ; YES->UPDATE SCOREBOARD AND FADE OUT
	
@skip_mode_done	
	LDY #SCOREBOARD_4Q_THEN_STATS_SKP_SCENE_ID                   ; SET CUTSCENE INDEX = NORMAL SCOREBOARD BACKGROUND INDEX
	LDA QUARTER                                                  ; IS CURRENT QTR = END OF OT?
	CMP #OVERTIME_QUARTER +1                                     ; 
	BCC @draw_skip_mode_stats_scene                              ; NO-> DRAW SCOREBOARD BACKGROUND
	INY                                                          ; SET CUTSCENE INDEX = OVERTIME SCOREBOARD BACKGROUND INDEX

@draw_skip_mode_stats_scene                   					 ; DRAW SCOREBOARD BACKGROUND
	TYA                                                          ; 
	LDX ##LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK              ; SET BANK = 8
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	RTS
	
@update_scoreboard:                                               ; UPDATE SCOREBOARD SCORES AND FADE OUT 
	JSR UPDATE_LARGE_SCOREBOARD                                  ; UPDATE SCOREBOARD PPU ()
	RETURN_IN_NUM_FRAMES 20                                      ; 1/3 second
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	RTS                                                          ; RETURN 

_F}_SIM_MODE_GAME_LOOP 
	
_F{_UPDATE_CLOCK_TASK_START                                       			; DONE EXCEPT ADDR

PLAY_SELECT_CLOCK_COUNT_DOWN_SPEED			=    $1E					 ; SET TO 1/2 OF 60 FRAMES	
CLOCK_COUNT_DOWN_SPEED					    =    $14					 ; set to 1/3 of 60 frames = clock counts 3 times normal  	
MAX_SECONDS_TO_DISPLAY					    =    $59 			 ; BINARY CODED DECIMAL
PLAY_TICKING_CLOCK_SECONDS_LEFT			    =    $09

seconds_timer							      = LOCAL_2 
	
START_QUARTER_GAMEPLAY_UPDATE_CLOCK_TASK:                        ; START OF QUARTER ROUTINE
	LDA #SECONDS_PER_QTR                                         ; SET QUARTER SECONDS =0
	STA CLOCK_SECONDS                                            ;
	LDA #MINUTES_PER_QTR	                                     ; SET QUARTER MINUTES = 5
	STA CLOCK_MINUTES                                            ;
	LDA #$00                                                     ; SET CLOCK STATUS TO STOPPED
	STA CLOCK_RUN_TYPE                                           ; 
	LDA QUARTER                                                  ; LOAD QUARTER
	LSR                                                          ;
	BCS @resume_gameplay_after_half_time                         ; IS HALF OVER? YES->BRANCH TO HALF OVER
	
@start_game_play_task	
	LDA #HIGH_LEVEL_GAME_LOGIC_BANK_1                            ; 
	STA GAMEPLAY_TASK + TASK_BANK                                ;
	LDY #<(BANK_JUMP_ON_FIELD_GAMEPLAY_START-1)                  ; LOAD START GAMEPLAY ADDRESS *** can replace with actual
	LDA #>(BANK_JUMP_ON_FIELD_GAMEPLAY_START-1)                  ;
	LDX #GAMEPLAY_TASK                                           ; LOAD TASK 1 INDEX 
	JSR CREATE_TASK                                              ; CREATE THREAD(X= BANK, Y,A= THREAD ADDRESS)
	JMP @create_banner_task
	
@resume_gameplay_after_half_time:                                ; HALFTIME RESUME GAMEPLAY THREAD
	LDX #GAMEPLAY_TASK                                           ; LOAD TASK 1 THREAD INDEX= GAMEPLAY THREAD
	JSR RESUME_TASK                                              ; RESUME TASK (X= TASK INDEX) 

@create_banner_task:                                              ; 
	LDA #BANNER_ANIMATION_BANK                                     ; SET TASK BANK TO BANK 23
	STA BANNER_TASK + TASK_BANK                                   ;
	LDY #<(BANK_JUMP_BANNER_TASK_START-1)                                   ; SET ADDRESS = DRAW TOP BANNER() *** can use actual
	LDA #>(BANK_JUMP_BANNER_TASK_START-1)                                   ; 
	LDX #BANNER_TASK                                              ; LOAD TASK 3 INDEX
	JSR CREATE_TASK                                           ; CREATE THREAD(X= BANK, Y,A= THREAD ADDRESS)

WHILE_BALL_NOT_SNAPPED_WAIT_ONE_FRAME[]							 ; 

@main_clock_check_loop:                                          ; CLOCK CHECK LOOP
	RETURN_1_FRAME  
	BIT CLOCK_RUN_TYPE                                            ; LOAD CLOCK STATUS

@check_normal_clock:
	BMI @normal_clock_countdown                                   ; IS CLOCK STARTED? YES->NORMAL CLOCK COUNTDOWN

@check_play_select_clock:
	BVS @set_clock_count_down_to_play_select                      ; IS CLOCK STATUS = PLAY SELECT -> BRANCH TO 

@check_overtime:	
   LDA QUARTER                                                  ; LOAD QUARTER
	CMP #OVERTIME_QUARTER                                        ; IS OVERTIME?
	BCC @main_clock_check_loop                                    ; NO-> LOOP BACK TO CLOCK CHECK LOOP

@check_if_game_tied
	LDA P1_TOTAL_SCORE                                           ; P1 SCORE == P2 SCORE? 
	CMP P2_TOTAL_SCORE                                           ;
	BEQ @main_clock_check_loop                                   ; YES->LOOP BACK TO CLOCK CHECK LOOP
	JMP @set_qtr_over                                                  ; YES->JUMP TO GAME OVER 

@normal_clock_countdown:                                        ; NORMAL CLOCK COUNTDOWN
	LDA #$0A                                                     ; SET SECONDS TIMER  =  10 “GAME” SECONDS
	STA seconds_timer                                             ; 

@reload_normal_clock_counter:                                                          ; RESET FRAME COUNTER NORMAL CLOCK SPEED
	LDX #CLOCK_COUNT_DOWN_SPEED                                  ; SET COUNTER TO 20 FRAMES. 3 TECMO SECONDS = 1 SECOND

@normal_clock_loop:                                             ; NORMAL CLOCK SPEED FRAME COUNTER LOOP
	RETURN_1_FRAME  
	BIT CLOCK_RUN_TYPE                                           ; LOAD CLOCK STATUS
	BPL @main_clock_check_loop                                    ; DOES CLOCK STATUS = STOPPED? YES-> LOOP BACK TO CLOCK CHECK LOOP
	
@check_for_play_select_countdown	
	BVS @set_clock_count_down_to_play_select                     ; IS CLOCK STATUS = PLAY SELECT COUNTDOWN? YES-> PLAY SELECT CLOCK COUNTDOWN
	DEX                                                          ; FRAME COUNTER--
	BNE @normal_clock_loop                                       ; IS COUNTER ZERO? NO->LOOP BACK TO DECREASE COUNTER LOOP
	JSR UPDATE_CURRENT_CLOCK_TIME                                ; UPDATE CURRENT TIME()
	BCS @set_qtr_over                                           ; TIME LEFT =0? YES->BRANCH TO GAME OVER CHECK 
	LDA PLAY_STATUS                                              ; DOES PLAY STATUS = BALL SNAPPED
	AND #$04                                                     ; 
	BNE @reload_normal_clock_counter                             ; NO-> RESET FRAME COUNTER NORMAL CLOCK SPEED
	DEC seconds_timer                                             ; SECONDS TIMER--
	BNE @reload_normal_clock_counter                             ; 10 SECONDS ELAPSED? NO-> RESET FRAME COUNTER NORMAL CLOCK SPEED 

_WHILE EQUAL                                                          ; BALL NOT SNAPPED WAIT LOOP
	RETURN_1_FRAME  
	LDA PLAY_STATUS                                              ; DOES PLAY STATUS = BALL SNAPPED
	AND #$04                                                     ;                                                           
_END_WHILE                                                   ; NO->BALL NOT SNAPPED WAIT LOOP
	JMP @normal_clock_countdown                                                   ; YES-> NORMAL CLOCK COUNTDOWN

@set_clock_count_down_to_play_select:                           ; PLAY SELECT CLOCK COUNTDOWN
	LDA #$0A                                                     ; SET SECONDS TIMER  =  10 “GAME” SECONDS
	STA seconds_timer                                            ; 

@play_select_clock_loop:
	LDX #PLAY_SELECT_CLOCK_COUNT_DOWN_SPEED                      ; SET COUNTER TO 30 FRAMES. 2 TECMO SECONDS = 1 SECOND

_WHILE NOT_EQUAL                                                       ; PLAY SELECT FRAME COUNTER LOOP
	RETURN_1_FRAME  
	BIT CLOCK_RUN_TYPE                                           ; 
	BPL @main_clock_check_loop                                   ; DOES CLOCK STATUS = STOPPED? YES-> LOOP BACK TO CLOCK CHECK LOOP
	BVC @normal_clock_countdown                                  ; DOES CLOCK STATUS = RUNNING NORMAL? YES->NORMAL CLOCK COUNTDOWN
	DEX                                                          ; FRAME COUNTER--
_END_WHILE                                                      ; COUNTER DONE? NO->PLAY SELECT COUNTER LOOP

	JSR UPDATE_CURRENT_CLOCK_TIME                                ; UPDATE CURRENT TIME, CHECK FOR END OF QUARTER, CHECK FOR PUNT CLOCK()
	BCS @set_qtr_over                                                  ; IS QUARTER OVER? YES-> QUARTER OVER START
	DEC seconds_timer                                            ; SECONDS TIMER--
	BNE @play_select_clock_loop                                  ;
	SET_CLOCK_TO_STOPPED 
	JMP @main_clock_check_loop                                   ; JUMP TO CLOCK CHECK LOOP

@set_qtr_over:                                                         ; QUARTER OVER START
	SET_GAME_STATUS_QTR_OVER[]

_WHILE NOT_EQUAL                                               ; QUARTER OVER LOOP
	RETURN_1_FRAME  
	LDA GAME_STATUS                                              ; IS QUARTER OVER FLAG CLEARED?
	AND #$08                                                     ; 
_END_WHILE                                                      ; NO-> LOOP BACK TO QUARTER OVER LOOP
	JMP ADD_RANDOMS_TO_SAVED_RANDOMS                             ; YES-> UPDATE SRAM RANDOM VALUES FOR SRAM VERIFY()

UPDATE_CURRENT_CLOCK_TIME:                                      ; UPDATE TIME,CHECK FOR END OF QUARTER, CHECK FOR PUNTING()
	DEC CLOCK_SECONDS                                            ; QUARTER_SECONDS--
	BMI @update_clock_minutes                                    ; 
	LDA CLOCK_SECONDS                                            ; COUNT QUARTER SECONDS DOWN IN DECIMAL 
	AND #$0F                                                     ;
	CMP #$0A                                                     ; 
	BCC @check_for_punt_in_progress                              ;
	LDA CLOCK_SECONDS                                            ; 
	SEC                                                          ;
	SBC #$06                                                     ;
	STA CLOCK_SECONDS                                            ; SAVE QUARTER SECONDS
	JMP @check_for_punt_in_progress                                                    ;
	
@update_clock_minutes:                                                          ; NEXT MINUTE
	LDA #MAX_SECONDS_TO_DISPLAY                                  ; SET QUARTER_SECONDS  = 59
	STA CLOCK_SECONDS                                            ; 
	DEC CLOCK_MINUTES                                            ; QUARTER MINUTES--
	LDA CLOCK_MINUTES                                            ; COUNT QUARTER MINUTES  DOWN IN DECIMAL
	AND #$0F                                                     ;
	CMP #$0A                                                     ;
	BCC @check_for_punt_in_progress                             ;
	LDA CLOCK_MINUTES                                            ;
	SEC                                                          ;
	SBC #$06                                                     ;
	STA CLOCK_MINUTES                                            ;
	
@check_for_punt_in_progress :                                    ;
	JSR CHECK_FOR_PUNT_CLOCK_COUNTDOWN                            ; UPDATE CLOCK GRAPHIC IF NOT PUNTING()
	
@check_for_last_ten_seconds	
	LDA CLOCK_SECONDS                                            ; IS QUARTER SECONDS = O 
	BEQ @check_qtr_over                                         ; YES->CHECK FOR PLAY QTR OVER OR TWO MINUTE WARNING
	LDX CLOCK_MINUTES                                            ; DOES QUARTER MINUTES LEFT = 0 MINUTES  
	BNE @exit                                                    ; NO-> NO SOUND TO PLAY
	CMP #(PLAY_TICKING_CLOCK_SECONDS_LEFT + 1)                   ; IS QUARTER SECONDS < 10
	BCS @exit                                                    ; NO-> NO SOUND TO PLAY
	
@play_clock_ticking_sound	
	LDA #CLOCK_TICK_SOUND                                       ; SET SOUND ID = FINAL SECONDS TICKING
	JSR PLAY_SOUND                                               ; PLAY SOUND(A= SOUND)
	CLC                                                          ; CLC = QUARTER NOT OVER
	RTS                                                          ; RETURN

@check_qtr_over:                                                          ; CHECK FOR PLAY QTR OVER OR TWO MINUTE WARNING
	LDA CLOCK_MINUTES                                            ; DOES QUARTER MINUTES LEFT = 0 MINUTES  
	BEQ @play_quarter_over_sound                                 ; YES-> PLAY END OF QUARTER SOUND
	
@check_for_two_minute_warning	
	CMP #$03                                                     ; IS QUARTER MINUTES LEFT >= 3 MINUTES  
	BCS @exit                                                    ; YES-> NO SOUND TO PLAY
	
@play_two_minute_warning_sound	
	LDA #TWO_MIN_WARN_SOUND                                      ; LOAD TWO MINUTE WARNING SOUND INDEX
	JSR PLAY_SOUND                                               ; SET NEXT SOUND TO PLAY (A= SOUND TO PLAY)

@exit:                                                          ; NO SOUND TO PLAY
	CLC                                                          ; CLC= QUARTER NOT OVER
	RTS                                                          ; RETURN

@play_quarter_over_sound:                                        ; PLAY END OF QUARTER SOUND
	LDA #GUNSHOT_SOUND                                           ; LOAD END OF QUARTER SOUND INDEX 
	JSR PLAY_SOUND                                               ; SET NEXT SOUND TO PLAY (A= SOUND TO PLAY)
	SEC                                                          ; SEC= QUARTER OVER
	RTS                                                          ; RETURN

CHECK_FOR_PUNT_CLOCK_COUNTDOWN:                                 ; UPDATE CLOCK GRAPHIC IF NOT PUNTING()
	LDA CLOCK_RUN_TYPE                                           ; DOES CLOCK STATUS = PUNT COUNTDOWN
	AND #PUNT_CLOCK                                              ; 
	BEQ @update_clock_graphic                                     ; NO-> UPDATE CLOCK GRAPHIC
	RTS                                                          ; RETURN

@update_clock_graphic:                                          ; UPDATE CLOCK GRAPHIC
	LDY #<CLOCK_PPU_ADDR                                         ; SET CLOCK PPU ADDR = $204D
	LDX #>CLOCK_PPU_ADDR                                         ;
	LDA #$05                                                     ; SET LENGTH = 5 BYTES
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                        ; 
	LDA CLOCK_MINUTES                                            ; *** ONLY NEEDED FOR 10 MINS OR MORE QTRS  CONVERT MINUTES VALUE TO TILE
	LOG_SHIFT_RIGHT_4											             ;
	BEQ @save_minutes_in_buffer                                  ; 
	CLC                                                          ;
	ADC #OFFSET_TO_NUMBER_TILES                                  ; 

@save_minutes_in_buffer:                                        ; 
	STA CURRENT_BG_BUFFER_LOC,X                                  ; SAVE UPPER DIGIT OF MINUTES
	INX                                                          ; BUFFER INDEX++
	LDA CLOCK_MINUTES                                            ; LOAD MINUTES
	JSR SAVE_CLOCK_TILE_ID_IN_BUFFER                             ; CONVERT NUMBER TO TILE(A= VALUE)
	LDA #COLON_TILE_ID                                           ; LOAD CLOCK “:” TILE
	STA CURRENT_BG_BUFFER_LOC,X                                  ;
	INX                                                          ; BUFFER INDEX++
	LDA CLOCK_SECONDS                                            ; LOAD SECONDS UPPER DIGIT
	LOG_SHIFT_RIGHT_4
	JSR SAVE_CLOCK_TILE_ID_IN_BUFFER                             ; CONVERT NUMBER TO TILE AND INCREASE BUFFERE INDEX(A= VALUE)
	LDA CLOCK_SECONDS                                            ; LLOAD SECONDS LOWER DIGIT
	JSR SAVE_CLOCK_TILE_ID_IN_BUFFER                             ; CONVERT NUMBER TO TILE AND INCREASE BUFFERE INDEX(A= VALUE)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                    ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)

SAVE_CLOCK_TILE_ID_IN_BUFFER:                                   ; CONVERT NUMBER TO TILE AND INCREASE BUFFERE INDEX(A= VALUE)
	AND #$0F                                                     ; = NUMBER 
	CLC                                                          ;
	ADC #OFFSET_TO_NUMBER_TILES                                  ;+ OFFSET TO NUMBER TILES
	STA CURRENT_BG_BUFFER_LOC,X                                  ;
	INX                                                          ; BUFFER INDEX++
	RTS                                                          ; RETURN

_F}_UPDATE_CLOCK_TASK_START 

_F{_UPDATE_PLAYER_CONDITIONS									         	; DONE 

possession_status_save		= LOCAL_5
condition_byte				= LOCAL_6
current_roster_id			= LOCAL_7
player_condition			= LOCAL_8		

	
UPDATE_PLAYER_CONDITIONS:                                       ; UPDATE CONDITION ROUTINE
	MMC3_SRAM_WRITE_ENABLE
	LDA POSSESSION_STATUS                                        ; SAVE POSSESION STATUS IN $42
	STA possession_status_save                                   ; 
	LDA #$00                                                     ; SET POSSESION TO PLAYER 1
	STA POSSESSION_STATUS                                        ;
	
@set_player_to_first_qb:                                                          ; CONDITION LOOP SET TO FIRST PLAYER
	LDA #QB1_ROSTER_ID                                           ; SET CURRENT PLAYER = FIRST PLAYER 
	STA current_roster_id                                        ; 
	
																; CONDITION LOOP START
@condition_loop:
	LDA current_roster_id                                        ; LOAD CURRENT PLAYER 
	JSR CHECK_IF_PLAYER_INJURED                                  ; CHECK IF PLAYER IS INJURED(A= PLAYER INDEX)
	LDA #AVERAGE_CONDITION                                       ; LOAD AVERAGE CONDITION 
	BCS @save_condition                                          ; PLAYER INJURED? YES-> ROUTINE TO GET NEW CONDITION BACK TO APPROPRIATE NIBBLE

@update_condition: 	
	JSR HEAVIER_RANDOMIZE                                        ; UPDATE RANDOMS and MAKE MORE RANDOM() RET=A=RAND
	AND #$18                                                     ; 25% chance of condition change (because 2 out of 8 bits being checked)
	BNE @check_all_players_on_team_updated                      ; 


	LDA current_roster_id                                        ; LOAD CURRENT PLAYER
	JSR GET_PLAYER_CONDITION                                     ; GET PLAYER CONDITION (A= PLAYER)
	STA player_condition                                         ; SAVE CONDITION IN $45
	CMP #BAD_CONDITION                                           ; PLAYER CONDITION = BAD? 
	BEQ @set_player_average_condition                            ; YES-> JUMP to PLAYER IN BAD ADD 1 to MAKE AVG
	CMP #EXCELLENT_CONDITION                                     ; PLAYER CONDITION = EXCELLENT?
	BEQ @make_excellent_player_good                              ; YES->PLAYER IN EXECELLENT ADD -1 to MAKE GOOD
	
@player_in_average_or_good:										 ; PLAYER IN AVERAGE,GOOD 
	JSR UPDATE_RANDOM_1                                          ; MAKE VALUE = -1 or 1.  
	AND #$02                                                     ; 
	SEC                                                          ;
	SBC #$01                                                     ;
	JMP @add_value_to_condition                                  ; JUMP->ADD CURRENT CONDITION + VALUE

@set_player_average_condition:                                   ; PLAYER IN BAD ADD 1 to MAKE AVG
	LDA #$01	                                                 ; SET 
	JMP @add_value_to_condition                                  ; JUMP->CURRENT CONDITION + VALUE

@make_excellent_player_good:                                     ; PLAYER IN EXECELLENT ADD -1 to MAKE GOOD
	LDA #$FF
	
@add_value_to_condition:                                         ; CURRENT CONDITION + VALUE
	CLC
	ADC player_condition 
	
@save_condition:                                                 ; ROUTINE TO GET NEW CONDITION BACK TO APPROPRIATE NIBBLE
	STA player_condition                                         ;
	LDA #$FC                                                     ;
	STA condition_byte                                           ;
	LDA current_roster_id                                        ;
	EOR #$FF                                                     ;
	AND #$03                                                     ;
	BEQ @save_in_sram_conditions                                 ;
	
	TAX                                                          ; save number of times to shift
	
_WHILE NOT_EQUAL                                                 ;

	ASL player_condition                                         ;
	ASL player_condition                                         ;
	SEC                                                          ;
	ROL condition_byte                                           ;
	ROL condition_byte                                           ;
	DEX                                                          ; 
	
_END_WHILE                                                       ;
	

@save_in_sram_conditions:
	LDA current_roster_id                                        ;
	LSR                                                          ; 4 conditions per byte hence divide by 4 
	LSR                                                          ;
	TAY                                                          ;
	BIT POSSESSION_STATUS                                        ; PLAYER 1 or 2?
	BMI @save_p2_condition_sram                                  ; PLAYER 2-> BRANCH TO SAVE NEW CONDITION FOR AWAY PLAYER
	
@save_p1_condition_sram: 	
	LDA P1_CONDITIONS_START,Y                                    ; SAVE NEW CONDITION FOR HOME PLAYER 
	AND condition_byte                                           ;
	ORA player_condition                                         ;
	STA P1_CONDITIONS_START,Y                                    ; SAVE CONDITION IN P1 IN-GAME CONDITIONS 
	JMP @check_all_players_on_team_updated                       ;
	
@save_p2_condition_sram:                                                          ; SAVE NEW CONDITION FOR AWAY PLAYER 
	LDA P2_CONDITIONS_START,Y                                    ;
	AND condition_byte                                                      ;
	ORA player_condition                                         ;
	STA P2_CONDITIONS_START,Y                                    ; SAVE CONDITION IN P2 IN-GAME CONDITIONS
	
@check_all_players_on_team_updated:                             ; CHECK FOR ALL CONDITIONS UPDATED
	INC current_roster_id                                        ; CURRENT PLAYER ++ 
	LDA current_roster_id                                        ;
	CMP #PUNTER_ROSTER_ID +1                                     ; HAVE ALL PLAYERS BEEN CHECKED? 
    BCC  @condition_loop
                                                                ; NO->BRANCH to CONDITION LOOP START
	
@check_if_p2_team_done:	
	LDA POSSESSION_STATUS                                        ; IS TEAM = PLAYER 2? 
	BMI @save_poss_status_and_exit                               ; YES->BRANCH to RESTORE POSSESION BYTE, SET SRAM TO NO WRITE AND RETURN 
	
@set_current_team_to_p2:	
	LDA #$FF                                                     ; SET POSSESION TO PLAYER 2
	STA POSSESSION_STATUS                                        ;
	JMP @set_player_to_first_qb                                  ; JUMP TO CONDITION LOOP SET TO FIRST PLAYER    

@save_poss_status_and_exit:                                                         ; RESTORE POSSESION BYTE, SET SRAM TO NO WRITE AND RETURN
	LDA possession_status_save                                   ; 
	STA POSSESSION_STATUS                                        ; 
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN

_F}_UPDATE_PLAYER_CONDITIONS 

_F{_CHECK_FOR_RETURN_FROM_INJURY								            ; DONE 

roster_id						= LOCAL_7
injury_status					= LOCAL_8
DOUBTFUL_RETURN_INJURY_CHANCE	= $30								 ; bitflag to set to 25% 
QUEST_RETURN_INJURY_CHANCE		= $10								 ; tiflag to set to  50$
	
UPDATE_INJURY_STATUS:                                            ; CHECK FOR RETURN FROM INJURY AND UPDATE INJURY STATUS()
	LDA #$00                                                     ; 
	LDX P1_TEAM                                                  ; LOAD P1 TEAM ID
	
@set_roster_id_to_qb1:
	STA POSSESSION_STATUS                                        ; SET POSSESION TO PLAYER 1
	STX CURRENT_TEAM                                             ; SET CURRENT TEAM TO P1 TEAM
	LDA #$00                                                     ; SET CURRENT PLAYER = FIRST PLAYER
	STA roster_id                                                ;
	
_WHILE CC                                                        ; UPDATE INJURY STATUS LOOP

	LDA roster_id                                                ; LOAD CURRENT PLAYER
	JSR CHECK_IF_PLAYER_INJURED                                  ; CHECK IF PLAYER IS INJURED(A= PLAYER INDEX)
	BCC @go_to_next_player_check_done                            ; NO-> BRANCH TO GO TO NEXT PLAYER CHECK IF ALL PLAYERS CHECKED
	
@check_injury_status:	
	STA injury_status                                            ; SAVE INJURY STATUS IN 45
	
@check_if_probable:	
	CMP #PROBABLE_INJ_STATUS                                     ; IS PLAYER INJURY STATUS=  PROBABLE
	BEQ @player_return_from_injury                               ; YES->BRANCH TO SET PLAYER NOT INJURED

@check_if_questionable:	
	CMP #QUEST_INJ_STATUS                                        ;
	BEQ @questionable_check_return_injury                        ;

@doubtful_check_return_injury	
	JSR HEAVIER_RANDOMIZE                                        ; UPDATE RANDOMS and MAKE MORE RANDOM() RET=A=RAND
	AND #DOUBTFUL_RETURN_INJURY_CHANCE                           ; IF QUESTIONABLE = 25% CHANCE OF RETURN FROM INJURY
	BEQ @player_return_from_injury                               ; 
	DEC injury_status                                            ; CHANGE INJURY STATUS FROM QUESTIONABLE TO DOUBTFUL
	JMP @save_injury_status                                      ;
	
@questionable_check_return_injury:                              ;
	JSR HEAVIER_RANDOMIZE                                        ; UPDATE RANDOMS and MAKE MORE RANDOM() RET=A=RAND
	AND #QUEST_RETURN_INJURY_CHANCE                              ; IF DOUBTFUL = 50% CHANCE OF RETURN FROM INJURY
	BEQ @player_return_from_injury                               ;
	DEC injury_status                                            ; CHANGE INJURY STATUS FROM DOUBTFUL TO PROBABLE
	
@save_injury_status:                                             ; SAVE NEW INJURY STATUS
	LDA roster_id                                                ; LOAD CURRENT PLAYER
	LDX injury_status                                            ; LOAD NEW INJURY STATUS
	JSR SET_INJURY_STATUS                                        ; SET PLAYER INJURY STATUS(A= PLAYER, X=INJURY STATUS)
	JMP @go_to_next_player_check_done                            ; JUMP to GO TO NEXT PLAYER, EXIT IF ALL PLAYERS CHECKED

@player_return_from_injury:                                      ; SET PLAYER TO NOT INJURED 
	LDA roster_id                                                ; LOAD CURRENT PLAYER
	LDX #$00                                                     ; LOAD INJURY STATUS= NOT INJURED
	JSR SET_INJURY_STATUS                                        ; SET PLAYER INJURY STATUS(A= PLAYER, X=INJURY STATUS)
	JSR UPDATE_STARTERS_SRAM                                     ; UPDATE STARTERS IN SRAM()
	LDA roster_id                                                ; LOAD CURRENT PLAYER
	STA P1_MAN_POS_ID_ICON_STATUS                                ;
	STA P2_MAN_POS_ID_ICON_STATUS                                ;
	JSR DO_RETURN_INJURY_SCREEN_IF_NOT_SKIP                      ; DRAW PLAYER RETURN FROM INJURY CUTSCENE IF NOT SKIP MODE OR PAST WEEK TO SKIP TO()
	
@go_to_next_player_check_done:                                   ; GO TO NEXT PLAYER CHECK IF ALL PLAYERS CHECKED
	INC roster_id                                                ; CURRENT PLAYER ++
	LDA roster_id                                                ;
	CMP #(TE2_ROSTER_ID+1)                                       ; IS PLAYER > LAST OFFENSIVE SKILL PLAYER

_END_WHILE                                                		 ; NO-> LOOP BACK  

	LDA POSSESSION_STATUS                                        ; IS SIDE = PLAYER 2?
	BMI @exit                                                   ; YES-> BRANCH TO EXIT

@set_current_side_to_p2	
	LDA #$FF                                                     ; SET TEAM TO PLAYER 2
	LDX P2_TEAM                                                  ; LOAD P2 TEAM ID
	JMP @set_roster_id_to_qb1                                    ;
	
@exit:                                                          ; EXIT
	RTS                                                          ; RETURN


	
DO_RETURN_INJURY_SCREEN_IF_NOT_SKIP:                             ; DRAW PLAYER RETURN FROM INJURY CUTSCENE IF NOT SKIP MODE OR PAST WEEK TO SKIP TO()
	JSR CHECK_IF_GAME_TYPE_SKIP_MODE                             ; IS GAME TYPE SKIP MODE. IF SKIP MODE IS IT DONE () CS= IN SKIP CC= DONE OR NOT IN SKIP() 
	BCS @exit                                                    ; YES->SKIP RETURN FROM INJURY SCREEN
	
@draw_return_injury_screen	
	LDA #RECOVERED_FROM_INJURY_SCENE_ID                          ; SET BG SCREEN ID = PLAYER RETURN FROM INJURY
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK                ; SET BANK = 8
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)

@exit:                                                          ; SKIP RETURN FROM INJURY SCREEN
	RTS                                                          ; RETURN

CHECK_IF_GAME_TYPE_SKIP_MODE:                                    ; IS GAME TYPE SKIP MODE. IF SKIP MODE IS IT DONE () CS= IN SKIP CC= DONE OR NOT IN SKIP()
	LDA TEAM_CONTROL_TYPES                                       ; IS PLAYER TYPE = SKP VS SKP
	CMP #(P1_TEAM_SKP_CTRL + P2_TEAM_SKP_CTRL)                   ; 
	BNE @not_skip_game                                          ; NO-> BRANCH TO CLEAR CARRY TO SHOW PLAYER RETURN

@check_if_past_skip_week:
	LDA CURRENT_WEEK_IN_SEASON                                   ; IS CURRENT WEEK > WEEK TO SKIP TO 
	CMP WEEK_TO_SKIP_TO                                          ;
	BCS @not_skip_game                                           ; YES-> BRANCH TO CLEAR CARRY TO SHOW PLAYER RETURN
	SEC                                                          ; SET CARRY TO NOT SHOW PLAYER RETURN
	RTS                                                          ; RETURN
	
@not_skip_game:                                                  ; CLEAR CARRY TO SHOW PLAYER RETURN
	CLC                                                          ;
	RTS                                                          ; RETURN

_F}_CHECK_FOR_RETURN_FROM_INJURY 
	
_F{_TRANSFER_STATS_TO_SEASON_STATS_CHECK_DIV_WINNER							; DONE 

sram_addr			= LOCAL_1

p2_team_sram_addr		= LOCAL_1
p1_team_sram_addr		= LOCAL_3
current_game_in_week	= LOCAL_8
	
ADD_GAME_STATS_TO_SEASON_STATS_UPDATE_GAME_INDEX:                ; ADD GAME STATS TO SEASON STATS AND UPDATE GAME WEEK INDEX
	JSR SAVE_TEMP_P1_P2_TEAM_INFO_TO_SEASON                         ; TRANSFER SEASON PLAYBOOK, STARTERS, INJ, COND FROM IN GAME SRAM -> SEASON SRAM()
	MMC3_SRAM_WRITE_ENABLE
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDA sram_addr                                                ; SAVE P1 TEAM SEASON STATS SRAM POINTER IN $40,$41
	STA p1_team_sram_addr                                           ;
	LDA sram_addr +1                                             ;
	STA p1_team_sram_addr +1                                        ;
	LDA P2_TEAM                                                  ; LOAD P2 TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	
@check_who_won_game:	
	LDA P1_TOTAL_SCORE                                           ; IS P1 SCORE = P2 SCORE
	CMP P2_TOTAL_SCORE                                           ;
	BEQ @tie_game                                                   ; YES->TIE GAME
	BCC @player_two_side_won                                                   ; NO->P2 WON

@player_one_side_won:	
	LDY #WINS_SEASON_STATS_OFFSET                                 ; SET P1 STAT OFFSET = WINS
	LDX #LOSSES_SEASON_STATS_OFFSET                              ; SET P2 STAT OFFSET = LOSSES
	JMP @update_team_stats
	
@player_two_side_won:                                            ; P2 WON
	LDY #LOSSES_SEASON_STATS_OFFSET                              ; SET P1 STAT OFFSET = LOSSES
	LDX #WINS_SEASON_STATS_OFFSET                                 ; SET P2 STAT OFFSET = WINS
	JMP @update_team_stats
	
@tie_game:                                                       ; TIE GAME
	LDY #TIES_SEASON_STATS_OFFSET                                ; SET P1 STAT OFFSET = TIES
	LDX #TIES_SEASON_STATS_OFFSET                                ; SET P2 STAT OFFSET = TIES *** not needed

@update_team_stats:                                              ; UPDATE SEASON TEAM STATS
	LDA (p1_team_sram_addr),Y                                    ; UPDATE P1 WINS/LOSSES/TIES 
	CLC                                                          ;
	ADC #$01                                                     ;
	STA (p1_team_sram_addr),Y                                    ;
	TXA                                                          ;
	TAY                                                          ;
	LDA (p2_team_sram_addr),Y                                    ; UPDATE P2 WINS/LOSSES/TIES
	CLC                                                          ;
	ADC #$01                                                     ;
	STA (p2_team_sram_addr),Y                                     ;
	LDA P1_TOTAL_SCORE                                           ; LOAD P1 SCORE
	JSR CONVERT_GAME_SCORE_DEC_TO_HEX                            ; CONVERT DECMIAL TO HEX(A= VAL) RET IN $45
	TAX                                                          ; SAVE P1 SCORE
	LDY #POINTS_FOR_SEASON_STATS_OFFSET                         ; P1 SEASON POINTS FOR =  P1 SEASON POINTS FOR + P1 GAME PTS
	CLC                                                          ;
	ADC (p1_team_sram_addr),Y                                                  ;
	STA (p1_team_sram_addr),Y                                                  ;
	INY                                                          ;
	LDA #$00                                                     ;
	ADC (p1_team_sram_addr),Y                                                  ;
	STA (p1_team_sram_addr),Y                                                  ;
	TXA                                                          ; LOAD P1 SCORE 
	LDY #POINTS_ALLOWED_SEASON_STATS_OFFSET                                                     ; P2 SEASON POINTS AGAINST  =  P2 SEASON POINTS AGAINST  + P1 GAME PTS
	CLC                                                          ;
	ADC (p2_team_sram_addr),Y                                                  ;
	STA (p2_team_sram_addr),Y                                                  ;
	INY                                                          ;
	LDA #$00                                                     ;
	ADC (p2_team_sram_addr),Y                                                  ;
	STA (p2_team_sram_addr),Y                                                  ;
	LDA P2_TOTAL_SCORE                                           ; LOAD P2 SCORE
	JSR CONVERT_GAME_SCORE_DEC_TO_HEX                                                ; CONVERT DECMIAL TO HEX(A= VAL) RET IN $45
	TAX                                                          ; SAVE P2 SCORE
	LDY #POINTS_FOR_SEASON_STATS_OFFSET                                                       ; P2 SEASON POINTS FOR =  P2 SEASON POINTS FOR + P2 GAME PTS
	CLC                                                          ;
	ADC (p2_team_sram_addr),Y                                    ;
	STA (p2_team_sram_addr),Y                                                  ;
	INY                                                          ;
	LDA #$00                                                     ;
	ADC (p2_team_sram_addr),Y                                    ;
	STA (p2_team_sram_addr),Y                                   ;
	TXA                                                          ; LOAD P2 SCORE
	LDY #POINTS_ALLOWED_SEASON_STATS_OFFSET                      ; P1 SEASON POINTS AGAINST  =  P1 SEASON POINTS AGAINST  + P2 GAME PTS
	CLC                                                          ;
	ADC (p1_team_sram_addr),Y                                    ;
	STA (p1_team_sram_addr),Y                                    ;
	INY                                                          ; 
	LDA #$00                                                     ;
	ADC (p1_team_sram_addr),Y                                    ;
	STA (p1_team_sram_addr),Y                                    ; 
	
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_TEAM_2_RUSHING_YARDS ; *** can use actual addr

	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #RUSH_YDS_ALLOWED_SEASON_STATS_OFFSET                    ; SET STAT OFFSET= SEASON RUSHING YARDS
	JSR ADD_GAME_DEF_YARDS_ALLOW_TO_SEASON_YARDS                 ; ADD GAME YARDS TO SEASON YARDS(8E,8F= GAME YARDS, $3E,$3F = SRAM SEASON STAT ADRR)
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_TEAM_1_RUSHING_YARDS ; *** can use actual addr
	
	LDA P2_TEAM                                                  ; LOAD P2 TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #RUSH_YDS_ALLOWED_SEASON_STATS_OFFSET                    ; SET STAT OFFSET= SEASON RUSHING YARDS
	JSR ADD_GAME_DEF_YARDS_ALLOW_TO_SEASON_YARDS                 ; ADD GAME YARDS TO SEASON YARDS(8E,8F= GAME YARDS, $3E,$3F = SRAM SEASON STAT ADRR)
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_TEAM_2_PASSING_YARDS ; *** can use actual addr
	
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #PASS_YDS_ALLOWED_SEASON_STATS_OFFSET                    ; SET STAT OFFSET= SEASON PASSING YARDS
	JSR ADD_GAME_DEF_YARDS_ALLOW_TO_SEASON_YARDS                                                ; ADD GAME YARDS TO SEASON YARDS(8E,8F= GAME YARDS, $3E,$3F = SRAM SEASON STAT ADRR)
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_TEAM_1_PASSING_YARDS 
	LDA P2_TEAM                                                  ; LOAD P2 TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #PASS_YDS_ALLOWED_SEASON_STATS_OFFSET                    ; SET STAT OFFSET= SEASON PASSING YARDS
	JSR ADD_GAME_DEF_YARDS_ALLOW_TO_SEASON_YARDS                                                ; ADD GAME YARDS TO SEASON YARDS(8E,8F= GAME YARDS, $3E,$3F = SRAM SEASON STAT ADRR)
	LDA P1_TEAM                                                  ; SET CURRENT TEAM = P1 TEAM
	STA CURRENT_TEAM                                             ; 
	LDA #P1_ON_OFFENSE                                           ; SET SIDE = P1 SIDE
	STA TEAM_ON_OFFENSE                                          ;
	JSR SWAP_AND_ADD_ALL_CURRENT_STATS_TO_SEASON_STATS           ; ADD IN GAME PLAYER STATS TO SEASON STATS SRAM ()
	LDA P2_TEAM                                                  ; SET CURRENT TEAM = P2 TEAM
	STA CURRENT_TEAM                                             ;
	LDA #P2_ON_OFFENSE                                           ; SET SIDE = P2 SIDE 
	STA TEAM_ON_OFFENSE                                          ;
	JSR SWAP_AND_ADD_ALL_CURRENT_STATS_TO_SEASON_STATS           ; ADD IN GAME PLAYER STATS TO SEASON STATS SRAM ()
	MMC3_SRAM_WRITE_DISABLE
	JSR CHECK_DIVISION_CHAMP_CUTSCENE                            ; DIVISION CHAMP CUTSCENE CHECK()
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] GET_TEAM_PASS_RUSH_YARDS_BANK, BANK_JUMP_GET_NUMBER_OF_GAMES_IN_WEEK ; *** can use actual addr
	MMC3_SRAM_WRITE_ENABLE
	
@check_game_in_week: 	
	INC CURRENT_GAME_IN_WEEK                                     ; CURRENT GAME IN WEEK ++
	LDA CURRENT_GAME_IN_WEEK                                     ; IS CURRENT GAME IN WEEK < NUMBER OF GAMES IN WEEK
	CMP current_game_in_week                                     ; 
	BCC @exit                                                    ; YES->
	
@set_to_next_week_first_game:
	LDA #$00                                                     ; SET CURRENT GAME = FIRST GAME
	STA CURRENT_GAME_IN_WEEK                                     ; 
	INC CURRENT_WEEK_IN_SEASON                                   ; CURRENT WEEK++
	LDA CURRENT_WEEK_IN_SEASON                                   ; IS CURRENT WEEK = PLAYOFFS
	CMP #FIRST_WEEK_OF_PLAYOFFS                                  ;
	BCS SEASON_OVER_DRAW_STANDINGS                               ; YES-> SEASON OVER DRAW DIVISION STANDINGS
	
@shuffle_order_of_games_for_week
	JUMP_8000_BANK_AND_RETURN[bank_funcAddr] RESET_SCHEDULE_BANK, BANK_JUMP_RESET_SCHEDULE_RANDOMIZE_ORDER ; *** can use actual addr

@exit:                                                          ; CURRENT WEEK NOT DONE
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN

_F}_TRANSFER_STATS_TO_SEASON_STATS_CHECK_DIV_WINNER 

_F{_DRAW_FINAL_STANDINGS_PLAYOFF_BRACKET									; DONE

SEASON_OVER_DRAW_STANDINGS:                                      ; SEASON OVER DRAW DIVISION STANDINGS AND PLAYOFF BRACKET
	JSR SORT_DIVISIONS_SET_SEEDINGS_FOR_PLAYOFFS                 ; SORT ALL DIVISIONS()
	LDA #FINAL_STANDINGS_SCREEN_ID                               ; SET DRAW EVENT INDEX = DRAW STANDINGS
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; LOAD BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDA #AFCE_DIVISION_ID                                        ; LOAD AFC EAST
	JSR DRAW_DIVISION_STANDINGS_FOR_FIVE_SECONDS                 ; DRAW DIVISION STANDINGS WITH 5 SECOND DELAY(A= DIVISION) 
	LDA #AFCC_DIVISION_ID                                                      ; LOAD AFC CENT
	JSR DRAW_DIVISION_STANDINGS_FOR_FIVE_SECONDS                 ; DRAW DIVISION STANDINGS WITH 5 SECOND DELAY(A= DIVISION)
	LDA #AFCW_DIVISION_ID                                                      ; LOAD AFC WEST
	JSR DRAW_DIVISION_STANDINGS_FOR_FIVE_SECONDS                 ; DRAW DIVISION STANDINGS WITH 5 SECOND DELAY(A= DIVISION)
	LDA #NFCE_DIVISION_ID                                                      ; LOAD NFC EAST
	JSR DRAW_DIVISION_STANDINGS_FOR_FIVE_SECONDS                 ; DRAW DIVISION STANDINGS WITH 5 SECOND DELAY(A= DIVISION)
	LDA #NFCC_DIVISION_ID                                                      ; LOAD NFC CENT
	JSR DRAW_DIVISION_STANDINGS_FOR_FIVE_SECONDS                 ; DRAW DIVISION STANDINGS WITH 5 SECOND DELAY(A= DIVISION)
	LDA #NFCW_DIVISION_ID                                                     ; LOAD NFC WEST
	JSR DRAW_DIVISION_STANDINGS_FOR_FIVE_SECONDS                 ; DRAW DIVISION STANDINGS WITH 5 SECOND DELAY(A= DIVISION)

@draw_bracket:																; DRAW PLAYOFF BRACKET
	LDA #PLAYOFF_BRACKET_TEAM_NAMES_SCREEN_ID                    ; SET BACKGROUND SCREEN INDEX = PLAYOFF BRACKET
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= BACKGROUND SCREEN INDEX, X = BANK)
	JSR DRAW_ONE_SIDE_OF_PLAYOFF_BRACKET                         ; DRAW PLAY OFF BRACKET SINGLE SCREEN()
	RETURN_IN_NUM_FRAMES 240                                     ; 4 second
	
@scroll_to_nfc_bracket:	
	LDA #$01                                                     ; SET SCROLL DIRECTION = RIGHT AND SPEED = 1
	LDX #$00                                                     ; SET # SCROLL FRAMES = 0 
	JSR SCROLL_PLAYOFF_BRACKET_NUM_FRAMES                        ; SCROLL PLAYOFF BRACKET(A= DIRECTION + SCROLL SPEED, X= # FRAMES)
	LDA #FADE_OUT                                                ; LOAD PLAYOFF BRACKET SOUND
	JSR PLAY_SOUND                                               ; PLAY SOUND(A= SOUND)
	RETURN_IN_NUM_FRAMES 240                                     ; 4 second
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	
	
@turn_off_play_off_all_games:
	MMC3_SRAM_WRITE_ENABLE	
	LDA #$00                                                     ; SET PLAY OUT ALL GAMES FLAG TO OFF
	STA PLAY_OUT_ALL_GAMES_BOOL                                  ;
	MMC3_SRAM_WRITE_DISABLE
	RETURN_IN_NUM_FRAMES 30                                      ; 0.5 sec
	LDA #STOP_SONG_SOUND_ID                                      ;
	JSR PLAY_SOUND                                               ; PLAY SOUND(A= SOUND)
	RTS                                                          ; RETURN

	

DRAW_DIVISION_STANDINGS_FOR_FIVE_SECONDS:                        ; DRAW DIVISION STANDINGS WITH 5 SECOND DELAY(A= DIVISION) 
	JSR DRAW_DIVISION_STANDINGS_DIVISION_ID                      ; DRAW DIVISION STANDINGS(A= DIVISION)
	RETURN_IN_NUM_FRAMES 240                                     ; 4 second
	RETURN_IN_NUM_FRAMES 60                                      ; 1 second
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	RETURN_IN_NUM_FRAMES 10                                      ; 0.16 SEC
	RTS 
	; RETURN
_F}_DRAW_FINAL_STANDINGS_PLAYOFF_BRACKET

_F{_ADD_TEAM_GAME_YARDS_TO_SEASON_YARDS										; DONE

season_yards	= LOCAL_1
game_yards		= SEGMENT_VAR_8E
	
ADD_GAME_DEF_YARDS_ALLOW_TO_SEASON_YARDS:                       ; ADD GAME YARDS TO SEASON YARDS(8E,8F= GAME YARDS, $3E,$3F = SRAM SEASON STAT ADRR)
	MMC3_SRAM_WRITE_ENABLE
	LDA (season_yards),Y                                         ; = SEASON YARDS + GAME YARDS
	CLC                                                          ;
	ADC game_yards                                               ;
	STA (season_yards),Y                                         ;
	INY                                                          ;
	LDA (season_yards),Y                                         ;
	ADC game_yards+1                                             ;
	STA (season_yards),Y                                         ; 
	RTS                                                          ; RETURN

_F}_ADD_TEAM_GAME_YARDS_TO_SEASON_YARDS
	
_F{_SAVE_ATTRIBUTE_TABLE_IN_SRAM 											; DONE

ppu_addr								= LOCAL_1
sram_addr								= LOCAL_3

NUMBER_OF_ATTR_TABLE_VALUES_PER_ROW		= $20
NUMBER_OF_ATTR_TABLE_ROWS 				= $02
SPR_INDEX_OF_HELMET_TILES				= $10 		 

	
SAVE_MINI_HELMET_ATTR_TABLES_IN_SRAM:                                   ; SAVE ATTRIBUTE TABLE IN SRAM(), SET CHR 1800,1C00 BANKS, SET $B8()

@save_nametable_one_attr_to_sram:
	MMC3_SRAM_WRITE_ENABLE 
	LDA #<ATTR_TABLE1_START                                      ; SET PPU ADDRESS =$23C0 = ATTRIBUTE TABLE UPPER LEFT CORNER
	STA ppu_addr                                                 ;
	LDA #>ATTR_TABLE1_START                                      ;
	STA ppu_addr+1                                               ;
	LDA #<MINI_HELMET_ATTR_ONE_SRAM                              ; SET SRAM ADDRESS  =$6003
	STA sram_addr                                                ;
	LDA #>MINI_HELMET_ATTR_ONE_SRAM                              ;
	STA sram_addr+1                                              ;
	LDX #NUMBER_OF_ATTR_TABLE_VALUES_PER_ROW                     ; SET LENGTH = 0X20 BY 0X02
	LDY #NUMBER_OF_ATTR_TABLE_ROWS                               ;
	JSR TRANSFER_BUFFER_TO_SRAM                                  ; SAVE PPU DATA IN SRAM (3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH)
	
@save_nametable_two_attr_to_sram:	
	LDA #<ATTR_TABLE2_START                                      ; SET PPU ADDRESS =$27C0= ATTRIBUTE TABLE MIRRORED
	STA ppu_addr                                                 ;
	LDA #>ATTR_TABLE2_START                                      ;
	STA ppu_addr +1                                              ;
	LDA #<MINI_HELMET_ATTR_TWO_SRAM                              ; SET SRAM ADDRESS  =$6083
	STA sram_addr                                                ;
	LDA #>MINI_HELMET_ATTR_TWO_SRAM                              ;
	STA sram_addr +1                                             ;
	LDX #NUMBER_OF_ATTR_TABLE_VALUES_PER_ROW                     ; SET LENGTH = 0X20 BY 0X02
	LDY #NUMBER_OF_ATTR_TABLE_ROWS                               ;
	JSR TRANSFER_BUFFER_TO_SRAM                                  ; SAVE PPU DATA IN SRAM (3E,3F= PPU ADDRESS  40,41= DATA ADDRESS, X,Y= LENGTH) 
	MMC3_SRAM_WRITE_DISABLE
	
@set_chr_banks	
	LDA #HELMET_SPR_TILES_CHR_BANK_ONE                           ; SET CHR 1800 BANK FOR SOME OF SPECIAL HELMET DRAWING
	STA SOFT_CHR_1800_BANK                                       ;
	LDA #HELMET_SPR_TILES_CHR_BANK_TWO                           ; SET CHR 1C00 BANK FOR SOME OF SPECIAL HELMET DRAWING
	STA SOFT_CHR_1C00_BANK                                       ;
	JSR SET_MMC3_VERT_MIRROR                                     ; SET MMC3 MIRRORING AND GAME STATUS MIRRORING TO VERTICAL()
	LDA #SPR_INDEX_OF_HELMET_TILES                               ;
	STA SPR_INDEX_TEMP                                           ;
	RTS                                                          ; RETURN

_F}_SAVE_ATTRIBUTE_TABLE_IN_SRAM 

_F{_SAVE_MINI_HELMET_BG_INFO_TO_BUFFER									    ; DONE

x_location					= LOCAL_1
name_table_one_or_two		= LOCAL_2
y_location					= LOCAL_3

ppu_addr					= LOCAL_5
attr_value					= LOCAL_5

helmet_tile_index			= LOCAL_7
current_team_id				= LOCAL_8

MINI_HELMET_ATTR_VALS_SRAM	= MINI_HELMET_ATTR_ONE_SRAM + 1 

OFFSET_TO_ATTR_TWO_SRAM		= MINI_HELMET_ATTR_TWO_SRAM - MINI_HELMET_ATTR_ONE_SRAM

	
SAVE_MINI_HELMET_DATA_TO_BG_BUFFER:                              ; SAVE MINI HELMET DATA TO BUFFER ( $45=HELMET INDEX, Y,A = COORDINATES, X= NAMETABLE)  
	STA y_location                                               ; SAVE Y COORD
	STY x_location                                               ; SAVE X COORD
	STX name_table_one_or_two                                    ; SAVE MINI HELMET NAMETABLE LOCATION = $2000-23DF OR $2400-(FOR PLAYOFF BRACKET)
	LDA current_team_id                                          ; SET INDEX TO HELMET TILES ( 5 entries per team) 
	ASL                                                          ;
	ASL                                                          ;
	CLC                                                          ;
	ADC current_team_id                                          ;
	STA helmet_tile_index                                        ; SAVE INDEX TO HELEMET TILES
	
@convert_coordinate_to_ppu_location: 	
	LDA y_location                                               ; CONVERT COORDINATES TO PPU LOCATION
	AND #$F8                                                     ; 
	STA ppu_addr                                                 ;
	LDA #$00                                                     ;
	ASL ppu_addr                                                 ;
	ROL                                                          ;
	ASL ppu_addr                                                 ;
	ROL                                                          ;
	STA ppu_addr+1                                               ;
	LDA x_location                                               ;
	LSR                                                          ;
	LSR                                                          ;
	LSR                                                          ;
	ORA ppu_addr                                                 ;
	STA ppu_addr                                                 ;
	LDA name_table_one_or_two                                    ;
	AND #$01                                                     ;
	ASL                                                          ;
	ASL                                                          ;
	ORA #>NAMETABLE1_START                                       ; SET PPU HIGH BYTE = NAME TABLE 1 =$2X
	ORA ppu_addr+1                                               ;
	STA ppu_addr+1                                               ;
	
@save_ppu_addr_to_buffer:	
	LDY ppu_addr                                                 ; LOAD PPU ADDR
	LDX ppu_addr+1                                                ;
	LDA #$02                                                     ; SET LENGTH = 2
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                        ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)

@save_top_mini_helemt_tiles_to_buffer	
	LDY helmet_tile_index                                        ; LOAD LEFT MINI HELMET TOP TILE FROM MINI HELMET TILE TABLE
	LDA MINI_HELMETS_BG_TILES_TABLE,Y                            ;
	STA CURRENT_BG_BUFFER_LOC,X                                  ; SAVE IN BUFFER
	INX                                                          ; BUFFER INDEX++
	LDA MINI_HELMETS_BG_TILES_TABLE+1,Y                          ; LOAD RIGHT MINI HELMET TOP TILE FROM MINI HELMET TILE TABLE
	STA CURRENT_BG_BUFFER_LOC,X                                  ; SAVE IN BUFFER
	INX                                                          ; BUFFER INDEX++
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                    ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	
@move_down_row: 	
	LDA ppu_addr                                                 ; SET PPU ADDR = NEXT ROW
	CLC                                                          ;
	ADC #LENGTH_OF_ONE_ROW                                       ;
	TAY                                                          ;
	LDA ppu_addr +1                                              ;
	ADC #$00                                                     ;
	TAX                                                          ;
	LDA #$02                                                     ; SET LENGTH = 2 TILES
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                        ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	
@save_bottom_mini_helemt_tiles_to_buffer	
	LDY helmet_tile_index                                        ;
	LDA MINI_HELMETS_BG_TILES_TABLE+2,Y                          ; LOAD LEFT MINI HELMET BOTTOM TILE FROM MINI HELMET TILE TABLE
	STA CURRENT_BG_BUFFER_LOC,X                                  ; SAVE IN BUFFER
	INX                                                          ; BUFFER INDEX++
	LDA MINI_HELMETS_BG_TILES_TABLE+3,Y                          ; LOAD RIGHT MINI HELMET BOTTOM TILE FROM MINI HELMET TILE TABLE
	STA CURRENT_BG_BUFFER_LOC,X                                  ; SAVE IN BUFFER
	INX                                                          ; BUFFER INDEX++
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                    ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	
	
	MMC3_SRAM_WRITE_ENABLE 
	LDA x_location                                               ; CONVERT COORDINATES TO PPU ATTR TABLE LOCATION
	AND #$E0                                                     ;
	LSR                                                          ;
	LSR                                                          ;
	LSR                                                          ;
	STA ppu_addr+1                                               ;
	
	LDA y_location                                               ;
	AND #$E0                                                     ;
	ORA ppu_addr+1                                               ;
	LSR                                                          ;
	LSR                                                          ;
	CMP #$20                                                     ;
	BCC @check_name_table_attr                                   ;

	CLC                                                          ;
	ADC #$02                                                     ;
	
@check_name_table_attr:                                          ;
	LDX name_table_one_or_two                                    ; LOAD MINI HELMET NAMETABLE ATTR TABLE LOCATION
	BEQ @check_which_helmet_tile                                  ;

@set_sram_index_to_attr_two	
	ORA #OFFSET_TO_ATTR_TWO_SRAM                                 ;
	
@check_which_helmet_tile:                                        ; CHECK WHICH PART OF NAMETABLE HELMET IS IN
	TAX                                                          ;
	LDY helmet_tile_index                                        ; LOAD MINI HELMET INDEX
	LDA ppu_addr                                                 ; check ppu low byte
	AND #$42                                                     ;
	BEQ @top_left_helmet_tile                                    ; YES->HELMET TILE IN TOP LEFT OF 4 TILE ATTRIBUTE TABLE

	CMP #$02                                                     ;
	BEQ @top_right_helmet_tile:                                  ; YES->HELMET TILE IN TOP RIGHT OF 4 TILE ATTRIBUTE TABLE

	CMP #$40                                                     ;
	BEQ @bottom_left_helmet_tile                                 ; YES->HELMET TILE IN BOTTOM LEFT OF 4 TILE ATTRIBUTE TABLE
	

@bottom_right_helmet_tile								    	 ; HELMET TILE IN BOTTOM RIGHT OF 4 TILE ATTRIBUTE TABLE
	LDA MINI_HELMET_ATTR_VALS_SRAM,X                             ; LOAD ATTRIBUTE TABLE VALUE 
	AND #$3F                                                     ; MASK BITS TO KEEP
	STA attr_value                                               ; SAVE
	LDA MINI_HELMETS_BG_TILES_TABLE+4,Y                          ; LOAD ATTRIBUTE TABLE VALUE FROM MINI HELMETS INFO TABLE
	ROR                                                          ; SHIFT AND MASK NEEDED BITS
	ROR                                                          ;
	ROR                                                          ;
	AND #$C0                                                     ; 
	JMP @save_attr_table_value                                   ; JUMP SAVE ATTRIBUTE TABLE VALUE FOR HELMET IN SRAM

@bottom_left_helmet_tile:                                        ; HELMET TILE IN BOTTOM LEFT OF 4 TILE ATTRIBUTE TABLE
	LDA MINI_HELMET_ATTR_VALS_SRAM,X                             ; LOAD ATTRIBUTE TABLE VALUE
	AND #$CF                                                     ; MASK BITS TO KEEP
	STA attr_value                                               ; SAVE
	LDA MINI_HELMETS_BG_TILES_TABLE+4,Y                          ; LOAD ATTRIBUTE TABLE VALUE  FROM MINI HELMETS INFO TABLE
	SHIFT_LEFT_4
	AND #$30                                                     ;
	JMP @save_attr_table_value                                   ;JUMP->SAVE ATTRIBUTE TABLE VALUE FOR HELMET IN SRAM

@top_right_helmet_tile:                                                          ; HELMET TILE IN TOP RIGHT OF 4 TILE ATTRIBUTE TABLE
	LDA MINI_HELMET_ATTR_VALS_SRAM,X                             ; LOAD ATTRIBUTE TABLE VALUE
	AND #$F3                                                     ; MASK BITS TO KEEP
	STA attr_value                                                      ; SAVE
	LDA MINI_HELMETS_BG_TILES_TABLE+4,Y                          ; LOAD ATTRIBUTE TABLE VALUE  FROM MINI HELMETS INFO TABLE
	SHIFT_LEFT_2 												 ; SHIFT AND MASK NEEDED BITS
	AND #$0C                                                     ;
	JMP @save_attr_table_value                                   ; JUMP-> SAVE ATTRIBUTE TABLE VALUE FOR HELMET IN SRAM

@top_left_helmet_tile:                                           ; HELMET TILE IN TOP LEFT OF 4 TILE ATTRIBUTE TABLE
	LDA MINI_HELMET_ATTR_VALS_SRAM,X                             ; LOAD ATTRIBUTE TABLE VALUE
	AND #$FC                                                     ; MASK BITS TO KEEP
	STA attr_value                                               ; 
	LDA MINI_HELMETS_BG_TILES_TABLE+4,Y                          ; LOAD ATTRIBUTE TABLE VALUE FROM MINI HELMETS INFO TABLE
	AND #$03                                                     ;
	
@save_attr_table_value:                                          ; SAVE ATTRIBUTE TABLE VALUE FOR HELMET IN SRAM
	ORA attr_value                                               ; = CURRENT VALUE + NEW BITS TO ADD
	STA MINI_HELMET_ATTR_VALS_SRAM,X                             ;
	MMC3_SRAM_WRITE_DISABLE
	JMP DRAW_MINI_HELMET_SPECIAL_SPRITES                         ; JUMP-> DRAW PLAYOFF BRACKET MINI HELMET SPRITE()

_F}_SAVE_MINI_HELMET_BG_INFO_TO_BUFFER 
		
_F{_DRAW_MINI_HELMET_PLAYOFF_BRACKET										 ; DONE

helmet_x_loc				= LOCAL_1
helmet_x_nametable			= LOCAL_2
helmet_y_loc				= LOCAL_3

final_spr_x_loc				= LOCAL_5
num_special_sprite_bytes	= LOCAL_6

helmet_table_index			= LOCAL_7
helmet_id					= LOCAL_8

CUR_HELMET_SPR_Y			= CUR_SPRITE_Y
CUR_HELMET_SPR_TILE			= CUR_SPRITE_TILE
CUR_HELMET_SPR_ATTR			= CUR_SPRITE_ATTR	
CUR_HELMET_SPR_X			= CUR_SPRITE_X				
					   



	
DRAW_PLAYOFF_BRACKET_MINI_HELMET:                                ; DRAW PLAYOFF BRACKET MINI HELMET SPRITE()
	STA helmet_y_loc                                             ;
	STY helmet_x_loc                                             ;
	STX helmet_x_nametable                                       ;
	LDA helmet_id                                                ; Each table entry is 5 bytes = helmet_id * (4+1)  
	ASL                                                          ;
	ASL                                                          ;
	CLC                                                          ;
	ADC helmet_id                                                ;
	STA helmet_table_index                                       ;

DRAW_MINI_HELMET_SPECIAL_SPRITES:                                ; CHECK IF MINI HELMET NEEDS SPECIAL SPRITE
	LDY helmet_table_index                                       ; DOES HELMET NEED SPRITE TILES
	LDA MINI_HELMETS_BG_TILES_TABLE+4,Y                          ;  
	AND #$FC                                                     ;
	BEQ @exit                                                    ; NO-> EXIT FROM SAVE MINI HELMET DATA TO BUFFER
	
@get_helmet_sprite_info: 	
	LSR                                                          ;
	LSR                                                          ;
	TAX                                                          ; SET INDEX TO MINI HELMET SPECIAL TILES
	LDY MINI_HELMET_SPECIAL_SIZE_TABLE-1,X                       ; LOAD INDEX TO TO SPRITE DATA
	LDA MINI_HELMET_SPECIAL_SIZE_TABLE,X                         ; SET NUMBER OF SPRITE BYTES TO UPDATE = 4 BYTES x NUM SPRITES
	STA num_special_sprite_bytes                                 ;
	LDX_ABS_ZP SPR_INDEX_TEMP                                    ; *** can fix to normal instruction 
	
	
_WHILE CC                                                        ; ADD HELMET SPRITES LOOP 
																 ; SET SPECIAL HELMET TILES X LOCATION
	LDA MINI_HELMET_SPR_TILES_TABLE+3,Y                          ; = HELMET SPRITE X OFFSET 
	CLC                                                          ;
	ADC helmet_x_loc                                             ; + HELMET X LOC
	STA final_spr_x_loc                                          ; SAVE X LOCATION
	LDA MINI_HELMET_SPR_TILES_TABLE+3,Y                          ; IS TILE CURRENTLY OFFSCREEN? (FOR PLAYOFF BRACKET) 
	AND #$80                                                     ;
	BEQ @check_sprite_offscreen                                   ;
	
	ORA #$FF                                                     ; 
	
@check_sprite_offscreen:                                        ; SAVE HELMET SPRITE DATA IN SPR MEMORY
	ADC helmet_x_nametable                                       ; 
	BNE @set_sprite_offscreen                                    ; YES->SET HELMET SPRITE TILE = OFFSCREEN
	
@set_sprite_info	
	LDA MINI_HELMET_SPR_TILES_TABLE,Y                            ; TILE Y OFFSET
	CLC                                                          ;
	ADC helmet_y_loc                                             ; + HELMET Y
	STA CUR_HELMET_SPR_Y,X                                                  ; SET EXTRA HELMET SPRITE  Y LOCATION
	LDA MINI_HELMET_SPR_TILES_TABLE+1,Y                          ; SET EXTRA HELMET SPRITE TILE 
	STA CUR_HELMET_SPR_TILE,X                                                  ;
	LDA MINI_HELMET_SPR_TILES_TABLE+2,Y                          ; SET  EXTRA HELMET SPRITE PAL AND MIRROR
	STA CUR_HELMET_SPR_ATTR,X                                                  ; 
	LDA final_spr_x_loc                                          ; SET EXTRA HELMET SPRITE  X LOCATION
	STA CUR_HELMET_SPR_X,X                                                  ;
	JMP @go_to_next_sprite                                       ;
	
@set_sprite_offscreen:                                           ; SET HELMET SPRITE TILE = OFFSCREEN
	LDA #SPRITE_OFFSCREEN                                               ;
	STA CUR_HELMET_SPR_Y,X                                       ;
	
@go_to_next_sprite:                                              ; GO TO NEXT SPRITE, CHECK IF DONE
	SET_X_INDEX_NEXT_SPRITE										 ;
	INY                                                          ; DATA INDEX += OFFSET TO NEXT HELMET SPRITE DATA
	INY                                                          ;
	INY                                                          ;
	INY                                                          ;
	CPY num_special_sprite_bytes                                 ; MORE HELMET SPRITES TO ADD?
	
_END_WHILE                                                       ; YES-> ADD HELMET SPRITES LOOP

	STX SPR_INDEX_TEMP                                           ; SAVE SPRITE INDEX
	
@exit:                                                          ; EXIT FROM SAVE MINI HELMET DATA TO BUFFER 
	RTS                                                          ; RETURN


_F}_DRAW_MINI_HELMET_PLAYOFF_BRACKET
	
_F{_TRANSFER_ATTRIBUTE_TABLE_FROM_BUFFER_TO_PPU								; DONE

sram_addr	= LOCAL_1
	
LOAD_BG_ATTR_VALUES_BOTH_SCREENS_FROM_SRAM:                     ; UPDATE PPU ATTRIBUTE TABLES FROM SRAM BUFFER
	LDY #<ATTR_TABLE1_START                                      ; SET PPU ADDRESS = $23C0 = ATTRIBUTE TABLE 1 
	LDX #>ATTR_TABLE1_START                                      ; 
	LDA #<MINI_HELMET_ATTR_ONE_SRAM                              ; SET DATA ADDRESS = SRAM $6003
	STA sram_addr                                                      ; 
	LDA #>MINI_HELMET_ATTR_ONE_SRAM                              ;
	STA sram_addr+1                                                      ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRASNFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES (X,Y= PPU ADDRESS, 3E,3F = DATA ADDRESS)
	LDY #<ATTR_TABLE2_START                                      ; SET PPU ADDRESS = $23C0 = ATTRIBUTE TABLE 1 
	LDX #>ATTR_TABLE2_START                                      ; 
	LDA #<MINI_HELMET_ATTR_TWO_SRAM                                                  ; SET DATA ADDRESS = SRAM $6083
	STA sram_addr                                                      ; 
	LDA #>MINI_HELMET_ATTR_TWO_SRAM                                                  ;
	STA sram_addr+1                                                      ; 
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRASNFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES (X,Y= PPU ADDRESS, 3E,3F = DATA ADDRESS)
	RTS                                                          ; RETURN

_F}_TRANSFER_ATTRIBUTE_TABLE_FROM_BUFFER_TO_PPU 
	
_F{_DRAW_MINI_HELMETS_AT_COORDINATE											; DONE

data_addr					= SEGMENT_VAR_8E
current_helmet_index		= SEGMENT_VAR_90

helmet_x_coordinate		= LOCAL_7
helmet_index_for_buffer		= LOCAL_8



DRAW_MINI_HELMETS_AT_LOCATIONS:                                  ; DRAW MINI HELMETS AT COORDINATES()
	STY data_addr                                                ; SAVE ADDRESS
	STX data_addr+1                                              ;  
	JSR SAVE_MINI_HELMET_ATTR_TABLES_IN_SRAM                     ; SAVE ATTRIBUTE TABLE IN SRAM(), SET CHR 1800,1C00 BANKS, SET $B8()
	LDA #$00                                                     ; SET CURRENT HELMET= FIRST HELMET
	STA current_helmet_index                                     ;
	
_WHILE CC                                                        ; DRAW HELMETS AT COORDINATES LOOP

	LDA current_helmet_index                                     ; SET MINI HELMET INDEX = CURRENT HLEMET
	STA helmet_index_for_buffer                                  ;
	LDY #$01                                                     ;
	LDA (data_addr),Y                                            ; GET MINI HELMET X COORDINATE
	ASL                                                          ;
	STA helmet_x_coordinate                                      ;
	LDA #$00                                                     ;
	ROL                                                          ;
	TAX                                                          ;
	DEY                                                          ;
	LDA (data_addr),Y                                            ; GET MINI HELMET Y COORDINATE
	LDY helmet_x_coordinate                                      ;
	JSR SAVE_MINI_HELMET_DATA_TO_BG_BUFFER                       ; SAVE DATA TO BUFFER ( $45=HELMET INDEX, Y,A = COORDINATES)  
	LDA data_addr                                                ; SET TABLE ADDRESS = TABLE ADDRESS + 1 WORD = NEXT X,Y SET 
	CLC                                                          ;
	ADC #$02                                                     ;
	STA data_addr                                                ;
	LDA data_addr+1                                              ;
	ADC #$00                                                     ;
	STA data_addr+1                                              ;
	INC current_helmet_index                                     ; CURRENT HELMET++
	LDA current_helmet_index                                     ; IS CURRENT HELMET  < NUMBER OF HELMETS TO DRAW
	CMP #NUMBER_OF_TEAMS_IN_LEAGUE                               ; 
	
_END_WHILE                                                       ; YES-> LOOP BACK DRAW HELMETS AT COORDINATES LOOP
	JMP LOAD_BG_ATTR_VALUES_BOTH_SCREENS_FROM_SRAM               ; JUMP TO UPDATE PPU ATTRIBUTE TABLES FROM SRAM BUFFER()
	
_F}_DRAW_MINI_HELMETS_AT_COORDINATE
	
_F{_DRAW_LARGE_HELMET_TEAM_DATA												; DONE

second_logo_team_matchup_flag		= LOCAL_1					;  set to false here since we are only drawing one helmet
current_team_id						= LOCAL_2

HELMET_SPRITE_Y_OFFSET				= $C4						; OFFSET FROM where its located on matchup screen added to wrap around
HELMET_SPRITE_X_OFFSET				= $C4					    ;  

DRAW_LARGE_HELMET_TEAM_DATA:                                     ; DRAW LARGE HELMET TEAM DATA($6E= CURRENT TEAM)
	JSR SET_LARGE_HELMET_PALLETES                                ; SET BACKGROUND AND SPRITE PALLETES()
	LDA CURRENT_TEAM                                             ; SET TEAM =  CURRENT TEAM
	STA current_team_id                                          ;
	
@set_sprite_memory_loc_flag	
	LDA #$FF                                                     ; SET LOCATION TO SAVE LOGO SPRITES IN = FF = START AT $280
	STA second_logo_team_matchup_flag                            ; 
	LDX current_team_id                                          ; 
	LDA HELMET_SHELLS,X                                          ; SET HELMET SHELL TYPE FROM TEAM HELEMET SHELLS
	LDY #HELMET_SPRITE_Y_OFFSET                                  ; SET LOGO AND FACEMASK LOCATION
	LDX #HELMET_SPRITE_X_OFFSET                                  ;
	JSR DRAW_LARGE_HELMET                                        ; DRAW HELMET LOGO()
	JMP SET_BG_SPR_FULLY_FADED_IN                                ; SET PALLETES TO FULLY FADED IN() AND RETURN

_F}_DRAW_LARGE_HELMET_TEAM_DATA 
	
_F{_DRAW_LARGE_HELMET_GAME_MATCHUP											; DONE

helmet_location_boolean					= LOCAL_1
team_id									= LOCAL_2
P2_LARGE_HELMET_SPR_TILES[]				= CUR_SPRITE_Y + $80

HELMET_ADJUSTED_X_LOCATION				 = $C4					; these are relative to the metatile drawing system not normal spr or ppu coordinates 
P2_HELMET_ADJUSTED_Y_LOCATION			 = $24
P1_HELMET_ADJUSTED_Y_LOCATION			 = $B4

OFFSET_TO_GAME_MATCHUP_P1_HELMET_SHELL	= $04
OFFSET_TO_GAME_MATCHUP_P2_HELMET_SHELL	= $08

DRAW_LARGE_HELMETS_FOR_MATCHUP:                                  ; LOAD TEAM HELMETS FOR MATCHUP SCREEN
	JSR SET_LARGE_HELMET_PALLETES                                ; SET BACKGROUND AND SPRITE PALLETES() 
	LDA P2_TEAM                                                  ; SET TEAM = P2 TEAM
	STA team_id                                                  ;
	LDA #$FF                                                     ; SET LOCATION TO SAVE LOGO SPRITES IN = FF = START AT $280
	STA helmet_location_boolean                                  ;
	LDX team_id                                                  ;
	LDA HELMET_SHELLS,X                                          ; SET HELMET SHELL TYPE FROM TEAM HELEMET SHELLS
	CLC                                                          ;
	ADC #OFFSET_TO_GAME_MATCHUP_P2_HELMET_SHELL                   ; ADD OFFSET FOR TEAM MATCHUP SCREEN
	LDY #P2_HELMET_ADJUSTED_Y_LOCATION                           ; SET LOGO AND FACEMASK LOCATION= P2 HELMET
	LDX #HELMET_ADJUSTED_X_LOCATION                              ;
	JSR DRAW_LARGE_HELMET                                        ; DRAW HELMET ()
	
	MMC3_SRAM_WRITE_ENABLE										 ; *** why do this?  
	
	TRANSFER_RAM_TO_SRAM_Y_INDEX[source_dest_length] P2_LARGE_HELMET_SPR_TILES[], LARGE_HELMET_TILES_SRAM, $80

	
	MMC3_SRAM_WRITE_DISABLE
	
	
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	STA team_id                                                  ;
	LDA #$00                                                     ; SET LOCATION TO SAVE LOGO SPRITES IN = 00 = START AT $200
	STA helmet_location_boolean                                  ;
	LDX team_id                                                  ; SET HELMET SHELL TYPE FROM TEAM HELEMET SHELLS
	LDA HELMET_SHELLS,X                                          ;
	CLC                                                          ;
	ADC #OFFSET_TO_GAME_MATCHUP_P1_HELMET_SHELL                  ; ADD OFFSET FOR TEAM MATCHUP SCREEN
	LDY #P1_HELMET_ADJUSTED_Y_LOCATION                           ; SET LOGO AND FACEMASK LOCATION = P1 HELMET
	LDX #HELMET_ADJUSTED_X_LOCATION                              ;
	JSR DRAW_LARGE_HELMET                                        ; DRAW HELMET ()
	MMC3_SRAM_WRITE_ENABLE
	
	TRANSFER_SRAM_TO_RAM_Y_INDEX[source_dest_length] LARGE_HELMET_TILES_SRAM, P2_LARGE_HELMET_SPR_TILES[], $80

	MMC3_SRAM_WRITE_DISABLE
	LDY #<IRQ_DATA_MATCHUP_SCREEN                                ; SET SPLIT SCREEN INFO ADDR = MATCHUP SCREEN SPLIT SCREEN
	LDX #>IRQ_DATA_MATCHUP_SCREEN                                ;
	JSR LOAD_IRQ_SPLIT_DATA                                      ; SET IRQ SPLIT INFO(Y,X= IRQ INFO ADDRESS)
	RTS                                                          ; RETURN

_F}_DRAW_LARGE_HELMET_GAME_MATCHUP 

_F{_DRAW_LARGE_HELMET_LOGO													; DONE

second_logo_team_matchup_flag	= LOCAL_1
team_logo_sprite_script_index   = LOCAL_2
sprite_logo_y_offset   			= LOCAL_5
sprite_logo_x_offset  			= LOCAL_6
HELMET_SPRITE_MEM_SIZE			= $80							; half of avialable sprite area

LG_HELMET_ONE_CURR_SPR_Y[] 		= CUR_SPRITE_Y
LG_HELMET_ONE_CURR_SPR_TILE[] 	= CUR_SPRITE_TILE
LG_HELMET_ONE_CURR_SPR_ATTR[]	= CUR_SPRITE_ATTR					
LG_HELMET_ONE_CURR_SPR_X[] 		= CUR_SPRITE_X

LG_HELMET_TWO_CURR_SPR_Y[] 		= CUR_SPRITE_Y 		+ $80
LG_HELMET_TWO_CURR_SPR_TILE[] 	= CUR_SPRITE_TILE 	+ $80
LG_HELMET_TWO_CURR_SPR_ATTR[]	= CUR_SPRITE_ATTR 	+ $80					
LG_HELMET_TWO_CURR_SPR_X[] 		= CUR_SPRITE_X 		+ $80
							

 
DRAW_LARGE_HELMET:                                               ; DRAW HELMET LOGO()
	STY sprite_logo_y_offset                                     ; SEVE LOGO AND FACEMASK LOCATION
	STX sprite_logo_x_offset                                     ;
	JSR DRAW_4X4_METATILE_BG                                     ; DRAW HELMET SHELL()
	
@draw_logo_facemask: 	
	LDX team_logo_sprite_script_index                            ;
	LDA HELMET_DECALS,X                                          ; SET HELMET LOGO SCRIPT FROM TEAM HELMET LOGOS
	STA LARGE_HELMET_SCRIPT_ID_ONE                               ;
	LDA #LH_FACEMASK_SPRITE_SCRIPT_ID                            ; 
	STA LARGE_HELMET_SCRIPT_ID_TWO                               ;
	LDA #$02                        						    ; Set number of sprite scripts
	STA NUM_SPRITE_SCRIPTS_LARGE_HELMET                          ;
	JSR DRAW_SPRITE_SCRIPT_NAMETABLE_0                           ; DRAW LOGO AND FACEMASK()
	RETURN_IN_NUM_FRAMES 3 
	LDX #DRAWING_TASK                                            ; SET TASK INDEX = SPRITE DRAW TASK
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                   ; END TASK(X= TASK INDEX)
	
@check_for_draw_second_logo_matchup_screen	
	LDA second_logo_team_matchup_flag                            ; CHECK FOR WHERE TO SAVE SPRITES TO IN SPRITE MEMORY
	BPL @adjust_first_logo_sprites                               ;
	
	LDX #$00                                                     ;


																 ; this is needed for the team matchup screen to draw the p1 team logo
@copy_sprites_to_second_logo_location_and_adjust:                ; SAVE LARGE HELMET SPRITES X,Y IN $280-$2FF
	LDA LG_HELMET_ONE_CURR_SPR_Y[],X                             ; IS SPRITE Y = OFFSCREEN
	CMP #SPRITE_OFFSCREEN                                               ;
	BCS @check_next_sprite_one                                       ; YES-> GO TO NEXT SPRITE

@copy_sprite_to_second_large_helmet_sprite_area
	CLC                                                          ; = SPRITE Y + Y OFFSET 
	ADC sprite_logo_y_offset                                     ;
	STA LG_HELMET_TWO_CURR_SPR_Y[],X                             ; SAVE IN SPRITE Y
	LDA LG_HELMET_ONE_CURR_SPR_X[],X                              ; = SPRITE X + X OFFSET
	CLC                                                          ;
	ADC sprite_logo_x_offset                                     ;
	STA LG_HELMET_TWO_CURR_SPR_X[],X                             ; SAVE IN SPRITE X 
	LDA LG_HELMET_ONE_CURR_SPR_TILE[],X                          ; = SPRITE ATTRIBS + SET VERTICAL MIRROING
	ORA #$80                                                     ; 
	STA LG_HELMET_TWO_CURR_SPR_TILE[],X                          ; SAVE IN SPRITE ATTRIBUTES
	LDA LG_HELMET_ONE_CURR_SPR_ATTR[],X                          ;
	ORA #$02                                                     ; SET SPRITE PALLETE = SECOND PALLETE
	STA LG_HELMET_TWO_CURR_SPR_ATTR[],X                           ; SAVE IN SPRITE ATTRIBUTES
	
@check_next_sprite_one:                                              ; GO TO NEXT SPRITE
	SET_X_INDEX_NEXT_SPRITE 
	CPX #$80                                                     ; ALL HELMET SPRITES CHECKED?
	BCC @copy_sprites_to_second_logo_location_and_adjust         ; NO-> SAVE LARGE HELMET SPRITES X,Y IN $280-$2FF
	
												                 ; *** could just use normal offscreen value rather than offscreen plus 1 
																 
	SET_RAM_Y_INDEX[start_length_value] LG_HELMET_ONE_CURR_SPR_Y[], HELMET_SPRITE_MEM_SIZE, SPRITE_OFFSCREEN+1
	
	LDA SOFT_CHR_1000_BANK
	STA SOFT_CHR_1800_BANK
	LDA SOFT_CHR_1400_BANK
	STA SOFT_CHR_1C00_BANK
	JMP @set_offset_to_pallete_buffer

@adjust_first_logo_sprites:                                      ; SAVE LARGE HELMET SPRITES X,Y IN $200-$27F
	LDX #$00                                                     ; SET SPRITE INDEX = FIRST SPRITE
@set_sprite_locations:	
_WHILE CC                                                        ; SAVE HELMET SPRITE X,Y LOCATIONS LOOP
	LDA LG_HELMET_ONE_CURR_SPR_Y[],X                             ; IS SPRITE Y = OFFSCREEN
	CMP #SPRITE_OFFSCREEN                                               ; 
	BCS @check_next_sprite_two                                       ; YES-> GO TO NEXT SPRITE
	CLC                                                          ; CURRENT SPRITE Y = CURRENT SPRITE Y + Y OFFSET
	ADC sprite_logo_y_offset                                     ;
	STA LG_HELMET_ONE_CURR_SPR_Y[],X                             ;
	LDA LG_HELMET_ONE_CURR_SPR_X[],X                             ; CURRENT SPRITE X = CURRENT SPRITE X + X OFFSET
	CLC                                                          ;
	ADC sprite_logo_x_offset                                     ;
	STA LG_HELMET_ONE_CURR_SPR_X[],X                             ;

@check_next_sprite_two:                                              ; GO TO NEXT SPRITE
	SET_X_INDEX_NEXT_SPRITE 
	CPX #$80                                                     ; ALL HELMET SPRITES CHECKED?
	
_END_WHILE                                                       ; NO->SAVE HELMET SPRITE X,Y LOCATIONS LOOP

@set_offset_to_pallete_buffer:                                   ; SET BUFFER INDEX FOR LARGE HELMET COLORS
	LDY #$00                                                     ; SET BUFFER INDEX = FIRST SET OF HELMET COLORS
	LDA second_logo_team_matchup_flag                            ;
	BPL @save_helmet_colors_in_pal_buffer                        ;

@set_index_to_p2_helmet_colors:	
	LDY #$08                                                     ; SET BUFFER INDEX = SECOND SET OF HELMET COLORS
	
@save_helmet_colors_in_pal_buffer:                               ; TRANSFER LARGE HELMET COLORS TO BUFFER
	LDA team_logo_sprite_script_index                            ;
	ASL                                                          ;
	ASL                                                          ;
	ASL                                                          ;
	TAX                                                          ;
	
HELMET_SHELL_INNER_BG_COLOR_OFFSET 	= BG_PAL_BUFFER_START + $05 
HELMET_SHELL_MIDDLE_BG_COLOR_OFFSET = BG_PAL_BUFFER_START + $06
HELMET_SHELL_LINING_BG_COLOR_OFFSET = BG_PAL_BUFFER_START + $07

FACEMASK_OUTLINE_SPR_COLOR_OFFSET	= SPR_PAL_BUFFER_START + $02
FACEMASK_OUTLINE_SPR_COLOR_OFFSET	= SPR_PAL_BUFFER_START + $02

FACEMASK_FILL_COLOR	= $0F 
 
;BG shell lining middle, BG shell lining color outer, SPR facemask outline, SPR facemask middle, SPR logo 1, SPR logo 2, SPR logo 3	
	
@set_helmet_shell_colors:	
	LDA LARGE_HELMET_COLORS,X                                    ; TRANSFER COLORS FROM LARGE HELMET COLORS TO BUFFER
	STA LARGE_HELMET_SHELL_INNER_BG_COLOR_OFFSET,Y               ;
	LDA LARGE_HELMET_COLORS+1,X                                  ;
	STA LARGE_HELMET_SHELL_MIDDLE_BG_COLOR_OFFSET,Y              ;
	LDA LARGE_HELMET_COLORS+2,X                                  ;
	STA LARGE_HELMET_LINING_BG_COLOR_OFFSET,Y                    ;

@set_sprite_colors:	
	LDA LARGE_HELMET_COLORS+3,X                                  ;
	STA LARGE_HELMET_FACEMASK_OUTLINE_SPR_COLOR_OFFSET,Y         ;
	LDA LARGE_HELMET_COLORS+4,X                                  ;
	STA LARGE_HELMET_FACEMASK_MIDDLE_SPR_COLOR_OFFSET,Y          ;
	LDA LARGE_HELMET_COLORS+5,X                                  ;
	STA LARGE_HELMET_LOGO_SPR_COLOR_ONE_OFFSET,Y                 ;
	LDA LARGE_HELMET_COLORS+6,X                                  ;
	STA LARGE_HELMET_LOGO_SPR_COLOR_TWO_OFFSET,Y                 ;
	LDA LARGE_HELMET_COLORS+7,X                                  ;
	STA LARGE_HELMET_LOGO_SPR_COLOR_THREE_OFFSET,Y               ;
	LDA #FACEMASK_FILL_COLOR                                     ; 
	STA LARGE_HELMET_FACEMASK_FILL_SPR_COLOR_OFFSET,Y           ;
	RTS                                                          ; RETURN

_F}_DRAW_LARGE_HELMET_LOGO

_F{_SET_PALLETES_TO_LARGE_HELMET_PALLETES									; DONE

SET_LARGE_HELMET_PALLETES:                                       ; SET BACKGROUND AND SPRITE PALLETES
	LDA #LARGE_HELMET_BG_PAL_INDEX                                                     ; SET SOFT BG PAL = PALLETE 2C
	STA BG_PAL_INDEX                                             ;
	LDA #LARGE_HELMET_SPR_PAL_INDEX	                                                     ;
	STA SPR_PAL_INDEX                                            ; SET SPR PAL = PALLETE 2E
	JSR GET_SAVE_BG_PAL_TO_BUFFER                                ; SAVE BACKGROUND PALETTE IN BUFFER($3E= PALLETE ID) 
	JMP GET_SAVE_SPR_PAL_TO_BUFFER                               ; SAVE SPRITE PALETTE IN BUFFER($3E= PALLETE ID)

_F}_SET_PALLETES_TO_LARGE_HELMET_PALLETES 
	
_F{_ONE_MAN_PLAYER_CHECK_FOR_TEAMS_SELECTED									; DONE							

P1_ARROW_TWO_SPR_TILE		= CUR_SPRITE_TILE +$04
P1_ARROW_TWO_SPR_ATTR		= CUR_SPRITE_ATTR +$04

CHECK_FOR_FIRST_TEAM_SELECTED:                                  ; CHECK FOR SINGLE TEAM SELECTED
	LDA #$00                                                     ; 
	STA MENU_Y                                                   ; SET MENU Y LOCATION = FIRST OPTION
	STA MENU_X                                                   ; SET MENU X LOCATION = FIRST OPTION
	LDY #<TEAM_MATCHUP_SELECT_MENU_INFO                          ;
	LDX #>TEAM_MATCHUP_SELECT_MENU_INFO                          ;
	LDA #BOTH_JOYPADS                                            ;
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	LDA #TEAM_SELECT_P1_ARROW_TILE_ID                            ; SET ARROW TILE = RIGHT SIDE
	STA P1_ARROW_TWO_SPR_TILE                                    ;
	LDA #$02                                                     ; SET MIRRORING AND PALLETE USED
	STA P1_ARROW_TWO_SPR_ATTR                                    ;
	JSR UPDATE_MATCHUP_TEAMS_SELECT_ARROW                         ; UPDATE MENU ARROW SPRITE()

_WHILE PLUS                                                      ; CHECK FOR TEAM SLECTED LOOP

	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	JSR UPDATE_AND_BLINK_MATCHUP_TEAMS_SELECT_ARROW              ; BLINK AND MOVE SECOND HALF OF ARROW SPRITE()
	BIT JOY_PRESS_BOTH                                           ; IS P1/P2 PRESS = B PRESSED? 
	
@check_b_press: 	
	BVS @exit_team_select                                        ; YES-> B PRESSED EXIT CHECK FOR SINGLE TEAM

_END_WHILE                                                       ; IS P1/P2 PRESS = A PRESSED? NO->
	
	JSR UPDATE_MATCHUP_TEAMS_SELECT_ARROW                        ; UPDATE MENU ARROW SPRITE()
	RETURN_IN_NUM_FRAMES 8
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MENU ARROW MAP() A= RET
	JSR GET_PRESEASON_TEAM_ID_BASED_ON_ARROW_LOCATION            ; CONVERT PRESEASON TEAM ARROW INDEX TO TEAM ID(A= ARROW INDEX); SAVE TEAM ID AND RETURN 
	STA P1_TEAM                                                  ; SET P1 TEAM ID = TEAM ID
	CLC                                                          ;
	RTS                                                          ; RETURN
	
@exit_team_select:                                                          ; B PRESSED EXIT CHECK FOR SINGLE TEAM
	SEC
	RTS                                                          ; RETURN
	


P1_ARROW_SPR_START						= SPRITE_START
P2_ARROW_SPR_START						= SPRITE_START + $08
P2_ARROW_VERT_BAR_TILE					= SPRITE_START + $01
P2_ARROW_TILE							= SPRITE_START + $05
P2_ARROW_ATTR							= SPRITE_START + $06

CHECK_FOR_SECOND_TEAM_SELECTED:                                  ; SINGLE MAN PLAYER TEAM SELECT()

	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] P1_ARROW_SPR_START, P2_ARROW_SPR_START, $08
	LDA #$00                                                     ; 
	STA MENU_Y                                                   ; SET Y MENU OPTION = FIRST OPTION
	STA MENU_X                                                   ; SET X MENU OPTION = FIRST OPTION
	LDA P1_TEAM                                                  ; LOAD P1 TEAM
	BNE @set_menu_options_and_sprites                            ;

@move_to_next_team		
	INC MENU_Y                                                   ; Y MENU OPTION ++  

@set_menu_options_and_sprites:
	LDY #<TEAM_MATCHUP_SELECT_MENU_INFO                          ; LOAD TEAM SELECT ARROW INFO ADDR
	LDX #>TEAM_MATCHUP_SELECT_MENU_INFO                          ;
	LDA #BOTH_JOYPADS                                            ; SET PLAYER JOY = BOTH
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	LDA #TEAM_SELECT_P2_VERT_BAR_TILE_ID	                     ; SET SPRITE 0 TILE = P2 ARROW TILE LEFT
	STA P2_ARROW_VERT_BAR_TILE                                   ;
	LDA #TEAM_SELECT_P2_ARROW_TILE_ID                            ; SET SPRITE 1 TILE = P2 ARROW TILE
	STA P2_ARROW_TILE                                            ;
	LDA #$02                                                     ; SET P2 ARROW TILE ATTRIBUTES
	STA P2_ARROW_ATTR                                            ;
	JSR UPDATE_MATCHUP_TEAMS_SELECT_ARROW                        ; UPDATE MENU ARROW SPRITE()
	
_WHILE PLUS                                                      ; CHECK FOR P1 TEAM SELECTED

	RETURN_1_FRAME  
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MENU ARROW MAP() A= RET
	JSR GET_PRESEASON_TEAM_ID_BASED_ON_ARROW_LOCATION                                                ; CONVERT PRESEASON TEAM ARROW INDEX TO TEAM ID(A= ARROW INDEX)
	CMP P1_TEAM                                                  ; LOAD P1 TEAM
	BNE @check_for_team_two_selected                                                   ;
	JSR MOVE_TEAM_SELECT_ARROW_UP_DOWN_ONE                       ;
	
@check_for_team_two_selected:                                                          ; CHECK FOR P2 TEAM SELECTED
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	JSR UPDATE_AND_BLINK_MATCHUP_TEAMS_SELECT_ARROW                        ; BLINK AND MOVE SECOND HALF OF ARROW SPRITE()
	BIT JOY_PRESS_BOTH                                           ; 
	BVS @b_exit_to_prev_menu                                     ; IS P1/P2 PRESS = B YES-> B PRESSED RETURN TO MENU
_END_WHILE                                                       ; IS P1/P2 PRESS = A NO->

	
	JSR UPDATE_MATCHUP_TEAMS_SELECT_ARROW             				; UPDATE MENU ARROW SPRITE()
	RETURN_IN_NUM_FRAMES 8
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MENU ARROW MAP() A= RET
	JSR GET_PRESEASON_TEAM_ID_BASED_ON_ARROW_LOCATION            ; CONVERT PRESEASON TEAM ARROW INDEX TO TEAM ID(A= ARROW INDEX)
	STA P2_TEAM                                                  ; SAVE P2 TEAM
	CLC                                                          ; CLC = INDICATE TEAMS SELECTED
	RTS                                                          ;
	
@b_exit_to_prev_menu:                                            ; B PRESSED RETURN TO MENU
	SEC                                                          ; SEC = RETURN TO MENU
	RTS                                                          ; RETURN

_F}_ONE_MAN_PLAYER_CHECK_FOR_TEAMS_SELECTED

_F{_TWO_PLAYER_CHECK_FOR_TEAMS_SELECTED										; DONE

TEAMS_NOT_SELECTED 						= $FF
P1_SELECT_ARROW_TILE					= SECOND_MENU_ARROW_SPR_TILE
P1_SELECT_ARROW_ATTR					= SECOND_MENU_ARROW_SPR_ATTR

P1_ARROW_SPR_START						= SPRITE_START
P2_ARROW_SPR_START						= SPRITE_START + $08
P2_ARROW_SPR_LEFT_TILE_ID_AFTER_SWAP	= SPRITE_START + $01 

PLAYER_TWO_STARTING_TEAM				= $01
	     
															     ; E7-ED is used to hold the last players menu info
																 ; same goes for the sprite info. 
CHECK_FOR_TEAM_SELECTED_2_PLAYER:                                ; DO TWO PLAYER NON COM SELECT TEAMS LOOP()
	LDA #$00                                                     ; SET X AND Y INDEX = FIRST INDEX
	STA MENU_Y                                                   ;
	STA MENU_X                                                   ;
	LDY #<TEAM_MATCHUP_SELECT_MENU_INFO                          ; LOAD TEAM SELECT MENU ARROW INFO ADDRESS = $BE81
	LDX #>TEAM_MATCHUP_SELECT_MENU_INFO                          ;
	LDA #$00                                                     ; SET PLAYER JOY = PLAYER 1
	JSR INIT_MENU_OPTIONS                                        ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	LDA #TEAM_SELECT_P1_ARROW_TILE_ID                            ; SET ARROW TILE
	STA P1_SELECT_ARROW_TILE                                     ;
	LDA #$02                                                     ; SET ARROW MIRRORING AND PALLETE 
	STA P1_SELECT_ARROW_ATTR                                     ;
	JSR UPDATE_MATCHUP_TEAMS_SELECT_ARROW                       ; UPDATE MENU ARROW SPRITE()
	LDA #TEAMS_NOT_SELECTED                                      ; SET P1 AND P2 TEAMS = NOT SELECTED
	STA P1_TEAM                                                  ;
	STA P2_TEAM                                                  ;
	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] MAN_V_MAN_TEAM_CHOICE_ARROWS_SPR_TABLE, P2_ARROW_SPR_START, $08 

@swap_menu_info 
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] P1_MENU_INDEX, P2_MENU_INDEX, $06

	
	LDA #PLAYER_TWO_STARTING_TEAM                                ; 
	STA P2_MENU_Y                                                ; SET P2 Y OPTION TO SECOND OPTION
	STA P2_MENU_JOYPAD_P1_OR_P2                                  ; SET MENU JOY TO P2
_WHILE ALWAYS                                                    ; CHECK FOR MAN P1 AND P2 TEAM SELECTION 
	RETURN_1_FRAME  
	LDA P1_TEAM                                                  ; DOES P1 TEAM = TEAM VALUE
	BPL @check_for_p2_selection                                  ; YES-> CHECK FOR P2 SELECTED TEAM
	
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	JSR UPDATE_TEAM_SELECT_ARROWS_TWO_PLAYER                     ; CHECK FOR ARROWS ON THE SAME SPOT AND MOVE ARROW TO NEXT TEAM()
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	JSR UPDATE_AND_BLINK_MATCHUP_TEAMS_SELECT_ARROW              ; BLINK AND MOVE SECOND HALF OF ARROW SPRITE()
	BIT JOY_PRESS_1                                              ; IS P1 PRESS = A PRESSED?
	BPL @check_for_p2_selection                                  ; NO-> CHECK FOR P2 SELECTED TEAM
	
@set_p1_team_selection:		
	JSR UPDATE_MATCHUP_TEAMS_SELECT_ARROW             			; UPDATE MENU ARROW SPRITE()
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MENU ARROW MAP
	JSR GET_PRESEASON_TEAM_ID_BASED_ON_ARROW_LOCATION            ; CONVERT PRESEASON TEAM ARROW INDEX TO TEAM ID(A= ARROW INDEX)
	STA P1_TEAM                                                  ; SAVE P1 TEAM 

@check_for_p2_selection:                                         ; CHECK FOR P2 SELECTED TEAM
	LDA P2_TEAM                                                  ; DOES P2 TEAM = TEAM VALUE
	BPL @check_for_both_teams_selected                           ; YES-> CHECK FOR BOTH TEAMS SELECTED
	JSR SWAP_MATCHUP_SELECT_ARROW_AND_MENU                       ; SWAP LAST PLAYER MENU INFO  AND ARROW SPRITE INTO CURRENT PLAYER MENU INFO AND SPRITE()
	JSR CHECK_INPUT_MENU                                         ; CHECK FOR MOVE ARROW ON MENU X OR Y()   
	JSR UPDATE_TEAM_SELECT_ARROWS_TWO_PLAYER                     ; CHECK FOR ARROWS ON THE SAME SPOT AND MOVE ARROW TO NEXT TEAM()
	LDA #TEAM_SELECT_P2_VERT_BAR_TILE_ID                         ; 
	STA P2_ARROW_SPR_LEFT_TILE_ID_AFTER_SWAP                     ;
	JSR SET_MENU_ARROW_X_Y                                       ; SET MENU ARROW X AND Y LOCATION()
	JSR UPDATE_AND_BLINK_MATCHUP_TEAMS_SELECT_ARROW               ; BLINK AND MOVE SECOND HALF OF ARROW SPRITE()
	BIT JOY_PRESS_2                                              ; IS P2 PRESS = A PRESSED?
	BPL @swap_menu_and_arrows                                    ; NO->SWAP P1 MENU INFO AND ARROW SPRITE INTO CURRENT MENU INFO AND SPRITE
	
@set_p2_team_selection:	
	JSR UPDATE_MATCHUP_TEAMS_SELECT_ARROW                 ; UPDATE MENU ARROW SPRITE()
	JSR GET_MENU_INDEX_X_Y                                      ; SET INDEX INTO MENU ARROW MAP
	JSR GET_PRESEASON_TEAM_ID_BASED_ON_ARROW_LOCATION            ; CONVERT PRESEASON TEAM ARROW INDEX TO TEAM ID(A= ARROW INDEX)
	STA P2_TEAM                                                  ; SAVE P2 TEAM

@swap_menu_and_arrows:                                           ; SWAP P1 MENU INFO AND ARROW SPRITE INTO CURRENT MENU INFO AND SPRITE
	JSR SWAP_MATCHUP_SELECT_ARROW_AND_MENU                       ; SWAP LAST PLAYER MENU INFO  AND ARROW SPRITE INTO CURRENT PLAYER MENU INFO AND SPRITE()

@check_for_both_teams_selected:                                  ; CHECK FOR BOTH TEAMS SELECTED
	BIT JOY_PRESS_BOTH                                           ; IS P1/P2 B PRESSED
	BVS @b_pressed_return_to_menu                                ; 
	
	LDA P1_TEAM                                                  ; HAVE BOTH PLAYERS SELECTED TEAMS?
	ORA P2_TEAM                                                  ;
	BPL @both_teams_selected                                     ; YES-> BOTH TEAMS SELECTED
_END_WHILE                                                       ; NO-> CHECK FOR MAN P1 AND P2 TEAM SELECTION

@both_teams_selected:                                            ; BOTH TEAMS SELECTED 
	RETURN_IN_NUM_FRAMES 60                                      ; 1 second
	CLC                                                          ; CLC = INDICATE TEAMS SELECTED
	RTS                                                          ; RETURN
	
@b_pressed_return_to_menu:                                       ; B PRESSED RETURN TO MAIN MENU
	SEC                                                          ; SEC = RETURN TO MENU
	RTS                                                          ; RETURN

SWAP_MATCHUP_SELECT_ARROW_AND_MENU:                             ; SWAP LAST PLAYER MENU INFO  AND ARROW SPRITE INTO CURRENT PLAYER MENU INFO AND SPRITE

@swap_arrow_sprites:
	LDY #$F8
_WHILE NOT_EQUAL                                                 ; SWAP SPRITE 0 WITH SPRITE 3 INFO
	LDX P1_ARROW_SPR_START-$F8,Y                                 ;
	LDA P2_ARROW_SPR_START-$F8,Y                                 ;
	STA P1_ARROW_SPR_START-$F8,Y                                 ;
	TXA                                                          ; 
	STA P2_ARROW_SPR_START-$F8,Y                                 ;
	INY                                                          ;
_END_WHILE                                                       ;

@swap_menu_info
	LDY #$FA                                                     ;
_WHILE NOT_EQUAL                                                 ; SWAP MENU INFO ($E1-$E6 INTO $E7-$EC)
	LDX $FFE7,Y                                                  ;
	LDA $FFED,Y                                                  ;
	STA $FFE7,Y                                                  ;
	TXA                                                          ;
	STA $FFED,Y                                                  ;
	INY                                                          ;
_END_WHILE                                                       ;
	RTS                                                          ; RETURN

_F}_TWO_PLAYER_CHECK_FOR_TEAMS_SELECTED 

_F{_DRAW_TEAM_SELECT_BACKGROUND_AND_MINI_HELEMETS								; DONE

DRAW_TEAM_SELECT_BG_AND_INIT_MENU_MAP:                           ; DRAW TEAM SELECT BACKGROUND AND HELMETS, SET ARROW LOCATIONS FOR TEAMS, UPDATE PALLETES
	LDA #TEAM_SELECT_CHR_BANK                                    ; SET CHR 1000 BANK = CHR BANK 16
	STA SOFT_CHR_1000_BANK                                       ;
	LDA #PRESEASON_SELECT_TEAM_SCREEN_ID                         ; SET DRAW EVENT INDEX = DRAW PRESEASON TEAM SELECT SCREEN
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; LOAD BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDY #<MINI_HELMETS_TEAM_CONTROL_SELECT_SPR_Y_X               ; LOAD MINI HELMETS X,Y LOCATION TABLE ADDRESS = $BCD9
	LDX #>MINI_HELMETS_TEAM_CONTROL_SELECT_SPR_Y_X               ;
	JSR DRAW_MINI_HELMETS_AT_LOCATIONS                           ; DRAW MINI HELMETS AT COORDINATES()
	LDA #TEAM_DATA_HELMETS_BG_PAL_INDEX                          ; SET BACKGROUND PALLLETE
	LDX #TEAM_DATA_HELMETS_SPR_PAL_INDEX	                     ; SET SPRITE PALLETE
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	RTS                                                          ; RTS
	
_F}_DRAW_TEAM_SELECT_BACKGROUND_AND_MINI_HELEMETS 

_F{_DO_PRO_BOWL_TEAM_SELECTION												  ; DONE

ppu_data_addr					= LOCAL_1
pro_bowl_team_choice			= LOCAL_8

AFC_PRO_BOWL_CHOICE				= $00
NFC_PRO_BOWL_CHOICE				= $FF

OFFSET_TO_1P_TEXT_INFO			=  $00
OFFSET_TO_2P_TEXT_INFO			=  $02
OFFSET_TO_BLANK_TEXT_INFO		=  $04

OFFSET_TO_AFC_PPU_ADDR			=  $00
OFFSET_TO_NFC_PPU_ADDR			=  $02

DO_PRO_BOWL_TEAM_SELECT:                                         ; DO PRO BOWL TEAM SELECTION
	LDA #AFC_PRO_BOWL_CHOICE                                     ; SET P1 CURRENT PRO BOWL CHOICE = AFC
	STA pro_bowl_team_choice                                     ;
	
@pb_team_select_input_loop:                                      ; PRO BOWL TEAM SELECT INPUT LOOP 
	RETURN_1_FRAME  
	BIT JOY_PRESS_BOTH                                           ;
	BMI @draw_player_two_text_on_remaining_pb_team               ; IS A PRESSED? YES->TEAM SELECTED
	BVS @exit_pro_bowl_team_selection                            ; IS B PRESSED? YES->EXIT FROM PRO BOWL TEAM SELECTION
	
@check_for_left_or_right:	
	LDA JOY_PRESS_BOTH                                           ; IS RIGHT PRESSED?
	LSR                                                          ;
	BCS @player_one_selects_nfc                                  ; YES-> SET 1P SELECTION TO NFC
	LSR                                                          ; IS LEFT PRESSED?
	BCC @pb_team_select_input_loop                               ; NO->PRO BOWL TEAM SELECT INPUT LOOP
	
@player_one_selects_afc	
	LDY #OFFSET_TO_1P_TEXT_INFO                                  ; SET TEXT = “1 P” 
	LDX #OFFSET_TO_AFC_PPU_ADDR                                  ; SET PPU LOCATION = AFC 
	JSR UPDATE_PRO_BOWL_TEAM_SELECT_TEXT                         ; SET PRO BOWL SELECTION TEXT ()
	LDY #OFFSET_TO_BLANK_TEXT_INFO                               ; SET TEXT = “  ”
	LDX #OFFSET_TO_NFC_PPU_ADDR                                                     ; SET PPU LOCATION = NFC
	JSR UPDATE_PRO_BOWL_TEAM_SELECT_TEXT                         ; SET PRO BOWL SELECTION TEXT ()
	LDA #AFC_PRO_BOWL_CHOICE                                     ;
	STA pro_bowl_team_choice                                     ;
	JMP @pb_team_select_input_loop                               ; JUMP-> PRO BOWL TEAM SELECT INPUT LOOP

@player_one_selects_nfc:                                         ; SET 1P SELECTION TO NFC 
	LDY #OFFSET_TO_1P_TEXT_INFO                                  ; SET TEXT = “1 P”
	LDX #OFFSET_TO_NFC_PPU_ADDR                                  ; SET PPU LOCATION = NFC
	JSR UPDATE_PRO_BOWL_TEAM_SELECT_TEXT                         ; SET PRO BOWL SELECTION TEXT ()
	LDY #OFFSET_TO_BLANK_TEXT_INFO                               ; SET TEXT = “  ”
	LDX #OFFSET_TO_AFC_PPU_ADDR                                  ; SET PPU LOCATION = AFC
	JSR UPDATE_PRO_BOWL_TEAM_SELECT_TEXT                         ; SET PRO BOWL SELECTION TEXT ()
	LDA #NFC_PRO_BOWL_CHOICE                                     ; SET P1 CURRENT PRO BOWL CHOICE = NFC
	STA pro_bowl_team_choice                                     ; 
	JMP @pb_team_select_input_loop                               ; JUMP->PRO BOWL TEAM SELECT INPUT LOOP

@draw_player_two_text_on_remaining_pb_team:                      ; TEAM SELECTED DRAW 2P TEXT ON OTHER TEAM
	LDA pro_bowl_team_choice                                     ; LOAD P1 CURRENT PRO BOWL CHOICE
	BMI @set_remaining_team_to_afc_p2							  ; IS P1 NFC? YES->SET AFC SELECTION TEXT TO “P 2”
	
@set_remaining_team_to_nfc_p2		                            
	LDY #OFFSET_TO_2P_TEXT_INFO                                  ; SET TEXT = “2 P”
	LDX #OFFSET_TO_NFC_PPU_ADDR                                  ; SET PPU LOCATION = NFC
	JSR UPDATE_PRO_BOWL_TEAM_SELECT_TEXT                         ; SET PRO BOWL SELECTION TEXT ()
	LDX #AFC_TEAM_ID                                             ; SET P1 TEAM = AFC
	LDY #NFC_TEAM_ID                                             ; SET P2 TEAM = NFC
	JMP @save_team_ids_and_exit                                                   ; JUMP-> SAVE TEAMS AND RETURN

@set_remaining_team_to_afc_p2:                                   ; SET AFC SELECTION TEXT TO “P 2”
	LDY #OFFSET_TO_2P_TEXT_INFO                                  ; SET TEXT = “2 P”
	LDX #OFFSET_TO_AFC_PPU_ADDR                                  ; SET PPU LOCATION = AFC
	JSR UPDATE_PRO_BOWL_TEAM_SELECT_TEXT                         ; SET PRO BOWL SELECTION TEXT ()
	LDX #NFC_TEAM_ID                                             ; SET P1 TEAM = NFC
	LDY #AFC_TEAM_ID                                              ; SET P2 TEAM = AFC
	
@save_team_ids_and_exit:                                                          ; SAVE TEAMS AND RETURN 
	STX P1_TEAM                                                  ; SAVE P1 PRO BOWL CONFERENCE
	STY P2_TEAM                                                  ; SAVE P2 PRO BOWL CONFERENCE
	RETURN_IN_NUM_FRAMES 60                                      ; 1 sec 
	CLC                                                          ; INDICATES TEAMS SELECTED
	RTS                                                          ; RETURN
	
@exit_pro_bowl_team_selection:                                    ; EXIT FROM PRO BOWL TEAM SELECTION
	SEC                                                          ; INDICATES WE EXITED FROM SELECTION
	RTS                                                          ; RETURN

UPDATE_PRO_BOWL_TEAM_SELECT_TEXT:                                ; SET PRO BOWL SELECTION TEXT (X= PPU TEAM LOC, Y=TEXT CHOICE)
	LDA PPU_PRO_BOWL_CHOICE_TEXT_DATA_ADDR_TABLE,Y               ; LOAD TEXT INFO ADDR
	STA ppu_data_addr                                            ;
	LDA PPU_PRO_BOWL_CHOICE_TEXT_DATA_ADDR_TABLE+1,Y             ;
	STA ppu_data_addr+1                                          ;
	LDA PROBOWL_P1_OR_P2_PPU_ADDR_TABLE,X                        ; LOAD TEXT PPU ADDR
	TAY                                                          ;
	LDA PROBOWL_P1_OR_P2_PPU_ADDR_TABLE+1,X                      ;
	TAX                                                          ;
	JMP TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES()

PPU_PRO_BOWL_CHOICE_TEXT_DATA_ADDR_TABLE:
		.WORD PROBOWL_PLAYER_ONE_PPU_TILE_INFO 
		.WORD PROBOWL_PLAYER_TWO_PPU_TILE_INFO 
		.WORD PROBOWL_BLANK_PPU_TILE_INFO                        ; PRO BOWL TEXT INFO POINTERS

																; PRO BOWL TEXT OPTIONS
PROBOWL_PLAYER_ONE_PPU_TILE_INFO: 
	.DB $03, $31, SPACE_TILE_ID, $50, $FF                     ; LENGTH, “1 P”, END
	
PROBOWL_PLAYER_TWO_PPU_TILE_INFO: 
	.DB $03, $32, SPACE_TILE_ID, $50, $FF                     ; LENGTH, “2 P”, END
	
PROBOWL_BLANK_PPU_TILE_INFO: 
	.DB $03, SPACE_TILE_ID, SPACE_TILE_ID, SPACE_TILE_ID, $FF  ; LENGTH, “   ”, END

PROBOWL_P1_OR_P2_PPU_ADDR_TABLE: 
	.WORD AFC_TEAM_SELECT_TEXT_PPU_ADDR 
	.WORD NFC_TEAM_SELECT_TEXT_PPU_ADDR                         ; AFC TEAM SELECT PPU ADDR

DRAW_PROBOWL_SELECT_SCREEN:                                      ; DRAW PRO BOWL SELECT SCREEN()
	LDA #PRO_BOWL_TEAM_CHOICE_SCREEN_ID                          ; LOAD PRO BOWL SELECT SCREEN ID
	LDX #MENU_DRAW_SCRIPT_BANK                                    ; SET BANK = 16
	JMP DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)

_F}_DO_PRO_BOWL_TEAM_SELECTION 
	
_F{_CONVERT_TEAM_ARROW_LOCATION_TO_TEAM_ID					   				 ; DONE

GET_PRESEASON_TEAM_ID_BASED_ON_ARROW_LOCATION:                   ; CONVERT PRESEASON TEAM ARROW INDEX TO TEAM ID(A= ARROW INDEX) for mathcup slection
	TAX                                                          ; LOAD ARROW INDEX
	LDA PRESEASON_ARROW_TO_TEAM_ID_TABLE,X                       ; LOAD TEAM ID FROM PRESEASON/TEAM DATA ARROW INDEX TO TEAM TABLE
	RTS                                                          ; RETURN

PRESEASON_ARROW_TO_TEAM_ID_TABLE:                                ; PRESEASON/TEAM DATA ARROW INDEX TO TEAM TABLE
		.DB BUF_TEAM_ID, CIN_TEAM_ID, DEN_TEAM_ID 
		.DB IND_TEAM_ID, CLE_TEAM_ID, KC_TEAM_ID 
		.DB MIA_TEAM_ID, HOU_TEAM_ID, LAR_TEAM_ID 
		.DB NE_TEAM_ID,  PIT_TEAM_ID, SD_TEAM_ID 
		.DB NYJ_TEAM_ID, $00, 		  SEA_TEAM_ID
		
		.DB WAS_TEAM_ID, CHI_TEAM_ID, SF_TEAM_ID 
		.DB NYG_TEAM_ID, DET_TEAM_ID, LAM_TEAM_ID 
		.DB PHI_TEAM_ID, GB_TEAM_ID,  NO_TEAM_ID 
		.DB PHX_TEAM_ID, MIN_TEAM_ID, ATL_TEAM_ID 
		.DB DAL_TEAM_ID, TB_TEAM_ID, $00

		
		
GET_TEAM_ID_TEAM_DATA_OR_CONTROL:                                ; CONVERT TEAM CONTROL ARROW INDEX TO TEAM ID(A= ARROW INDEX)
	TAX                                                          ; LOAD ARROW INDEX
	LDA TEAM_CONTROL_DATA_TEAM_ID_TABLE,X                        ; LOAD TEAM ID FROM TEAM CONTROL ARROW INDEX TO TEAM TABLE
	RTS                                                          ; RETURN

TEAM_CONTROL_DATA_TEAM_ID_TABLE:                                  ; TEAM CONTROL  ARROW INDEX TO TEAM TABLE
		.DB BUF_TEAM_ID, CIN_TEAM_ID, DEN_TEAM_ID 
		.DB IND_TEAM_ID, CLE_TEAM_ID, KC_TEAM_ID 
		.DB MIA_TEAM_ID, HOU_TEAM_ID, LAR_TEAM_ID 
		.DB NE_TEAM_ID,  PIT_TEAM_ID,  SD_TEAM_ID 
		.DB NYJ_TEAM_ID, $00, 		  SEA_TEAM_ID
		
		.DB WAS_TEAM_ID, CHI_TEAM_ID, $00 
		.DB NYG_TEAM_ID, DET_TEAM_ID, SF_TEAM_ID  
		.DB PHI_TEAM_ID, GB_TEAM_ID,  LAM_TEAM_ID 
		.DB PHX_TEAM_ID, MIN_TEAM_ID, NO_TEAM_ID 
		.DB DAL_TEAM_ID, TB_TEAM_ID,  ATL_TEAM_ID 
		
_F}_CONVERT_TEAM_ARROW_LOCATION_TO_TEAM_ID  

_F{_BLINK_AND_MOVE_NUMBER_PART_ARROW_SPRITE_MATCHUP_TEAM_SELECT				  ; DONE

MATCHUP_ARROW_BLINK_RATE			= $04

UPDATE_AND_BLINK_MATCHUP_TEAMS_SELECT_ARROW:                                                       ; BLINK AND MOVE SECOND HALF OF ARROW SPRITE 
	LDA MENU_INPUT_DELAY                                         ; IS FRAMES TO WAIT TO MOVE ARROW != 0
	BNE @update_menu_arrow_location                              ; UPDATE MENU ARROW SPRITE()

@set_arrow_sprite_offscreen_every_four_frames:	
	LDA FRAME_COUNTER                                            ; 
	AND #MATCHUP_ARROW_BLINK_RATE                                ; SET BLINK RATE = ON FOR 4 FRAMES OFF FOR FOR FRAMES
	BEQ SET_MATCHUP_SELECT_ARROWS_OFFSCREEN                      ; IS BLINK STATUS IN OFF STATE YES->SET MENU ARROW = OFFSCREEN FOR BLINKING

@update_menu_arrow_location:                                     ; UPDATE MENU ARROW SPRITE 

UPDATE_MATCHUP_TEAMS_SELECT_ARROW:
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MENU ARROW TABLE()
	ASL                                                          ; SHIFT SINCE TABLE IS TWO BYTES
	CLC                                                          ;
	ADC #$04                                                     ; = ADD OFFSET PAST MENU TILES TO ENTRIES
	TAY                                                          ;
	LDA (MENU_OPTIONS_ADDR),Y                                    ; LOAD  
	JMP UPDATE_MATCHUP_SELECT_MENU_ARROW_SPRITE                  ;
	
SET_MATCHUP_SELECT_ARROWS_OFFSCREEN:                             ; SET MENU ARROW = OFFSCREEN FOR BLINKING
	LDA #SPRITE_OFFSCREEN

UPDATE_MATCHUP_SELECT_MENU_ARROW_SPRITE:                         ; UPDATE ARROWS X AND Y LOCATION
	STA MENU_ARROW_SPR_Y                                         ; SAVE ARROW Y LOC
	STA MENU_ARROW_SPR_Y + $04                                   ; SAVE ARROW X LOC
	LDA MENU_ARROW_SPR_X                                         ; SET SECOND HALF OF ARROW SPRITE X LOC 8 PIXELS OVER
	CLC                                                          ;
	ADC #$08                                                     ;
	STA MENU_ARROW_SPR_X + $04                                   ;
	RTS                                                          ; RETURN

_F}_BLINK_AND_MOVE_NUMBER_PART_ARROW_SPRITE_MATCHUP_TEAM_SELECT 
	
_F{_UPDATE_ARROW_KR_PR_SUB													; DONE

offset_to_max_y_choices		=  $03
	
UPDATE_MENU_ARROW_KR_PR_SUB:                                    ; UPDATE ARROW FOR KR/PR SUB
	LDX MENU_JOYPAD_P1_OR_P2                                     ; LOAD JOYPAD INDEX
	LDA CURR_JOY_PRESS,X                                         ; DOES PLAYER BUTTON PRESS = LEFT?
	AND #LEFT_DPAD                                               ;
	BEQ @check_right_pressed                                     ; NO-> CHECK FOR RIGHT PRESSED
	
@check_on_starters_already:	
	LDA MENU_X                                                   ; IS MENU X CHOICE ON STARTER SIDE?
	BEQ @check_right_pressed                                     ; YES->CHECK FOR RIGHT PRESSED

@move_arrow_back_to_starters:	
	DEC MENU_X                                                   ; SET MENU X CHOICE = STARTERS
	JMP @copy_returner_menu_addr_to_menu_addr                    ; JUMP->LOAD MENU INFO ADDR BASED ON RETURNER
	
@check_right_pressed:                                             ; CHECK FOR RIGHT PRESSED
	LDA CURR_JOY_PRESS,X                                          ; DOES PLAYER BUTTON PRESS = RIGHT?
	LSR                                                           ;
	BCC @exit                                                     ; NO->EXIT
	LDA MENU_X                                                    ; IS MENU X CHOICE = on reserves
	CMP ON_RESERVES_BOOL                                          ; 
	BCS @exit                                                     ; YES->EXIT
	
@set_menu_x_to_reserves	
	INC MENU_X                                                    ; SET MENU X CHOICE = RESERVES
	
@copy_returner_menu_addr_to_menu_addr:                            ; LOAD MENU INFO ADDR BASED ON RETURNER
	LDA MENU_X                                                   ; CONVERT MENU X CHOICE = STARTER OR SUB MENU
	ASL                                                          ;
	TAX                                                          ; (X VALUE = 0 STARTER, 1 SUB) 
	LDA_ABS_X_ZP RETURNER_MENU_ADDR[]                            ; *** can fix to normal instruction TRANSFER RETURNER MENU ADDR TO MENU ADDR
	STA MENU_OPTIONS_ADDR                                        ;
	LDA_ABS_X_ZP RETURNER_MENU_ADDR[]+1                          ; *** can fix to normal instruction
	STA MENU_OPTIONS_ADDR+1                                      ;
	
	LDA MENU_Y                                                   ; LOAD MENU Y INDEX 
	LDY #offset_to_max_y_choices                                 ; 
	CMP (MENU_OPTIONS_ADDR),Y                                    ; IS MENU Y INDEX > NUMBER OF RESERVE MENU CHOICES?
	BCC @update_reserve_menu_arrow                               ; NO->INITIALIZE SUB MENU ARROW AND EXIT() 

@set_menu_y_to_last_reserve_choice	
	LDA (MENU_OPTIONS_ADDR),Y                                    ; SET MENU Y INDEX = LAST CHOICE
	STA MENU_Y                                                   ;
	DEC MENU_Y                                                   ;
	
@update_reserve_menu_arrow:                                      ; INITIALIZE SUB MENU ARROW AND EXIT()
	JMP UPDATE_MENU_ARROW_INFO_LOADED                            ; INITIALIZE Y MENU OPTIONS(E3,E4= ADDRESS, $E5= PLAYER JOY)
	
@exit:                                                           ; EXIT 
	RTS                                                          ; RETURN

_F}_UPDATE_ARROW_KR_PR_SUB 
	
_F{_CHECK_ARROWS_ON_SAME_SPOT_TEAM_SELECTION								; DONE

offset_to_max_y_choice   		= $02
offset_to_first_x_y_entry		= $04
empty_x_y_entry					= $FF

UPDATE_TEAM_SELECT_ARROWS_TWO_PLAYER:                                                       ; CHECK FOR ARROWS ON THE SAME SPOT AND MOVE ARROW TO NEXT TEAM
	LDA MENU_X                                                   ; ARE P1/P2 ARROWS ON SAME X CHOICE
	CMP P2_MENU_X                                                ;
	BNE CHECK_MENU_ARROW_ON_VALID_CHOICE                        ; NO-> CHECK FOR VALID SELECTION
	
	LDA MENU_Y                                                   ; ARE P1/P2 ARROWS ON SAME Y CHOICE
	CMP P2_MENU_Y                                                ;
	BNE CHECK_MENU_ARROW_ON_VALID_CHOICE                        ; NO-> CHECK FOR VALID SELECTION

MOVE_TEAM_SELECT_ARROW_UP_DOWN_ONE:                               ; SET MENU CHOICE UP OR DOWN ONE
	LDY MENU_JOYPAD_P1_OR_P2                                     ; LOAD JOY INDEX
	LDA CURR_JOY_RAW,Y                                           ; DOES BUTTON RAW = UP
	AND #UP_DPAD                                                 ;
	BEQ @move_down_additional_spot                                  ; NO-> SET P1 MENU Y = DOWN ONE
	
@move_up_additional_spot:	
	DEC MENU_Y                                                   ; P1 MENU Y--
	JMP CHECK_MENU_ARROW_ON_VALID_CHOICE                       ;

@move_down_additional_spot:	                                     ; SET P1 MENU Y = DOWN ONE
	INC MENU_Y                                                   ; P1 MENU Y ++

CHECK_MENU_ARROW_ON_VALID_CHOICE:                               ; CHECK FOR VALID SELECTION
	LDA MENU_Y                                                   ; IS P1 MENU Y = VALID 
	BPL @check_for_past_last_choice                               ;

@set_menu_y_to_last_choice
	LDY #offset_to_max_y_choice                                  ; OFFSET TO MENU OPTIONS
	LDA (MENU_OPTIONS_ADDR),Y                                    ; 
	SEC                                                          ;
	SBC #$01                                                     ;
	STA MENU_Y                                                   ; 

@check_for_past_last_choice:                                     ; CHECK IF MENU CHOICE > NUM CHOICES ELSE SET TO FIRST CHOICE
	LDA MENU_Y                                                   ; IS P1 Y MENU CHOICE 
	LDY #offset_to_max_y_choice                                  ;
	CMP (MENU_OPTIONS_ADDR),Y                                    ; OFFSET TO MENU OPTIONS
	BCC @update_menu_arrow                                       ; NO-> UPDATE MENU ARROW

@set_menu_y_to_first_choice	
	LDA #$00                                                     ; SET P1 Y MENU CHOICE = FIRST OPTION
	STA MENU_Y                                                   ; 
	
@update_menu_arrow:                                              ; UPDATE MENU ARROW
	JSR GET_MENU_INDEX_X_Y                                       ; SET INDEX INTO MENU ARROW MAP() A= RET
	ASL                                                          ; EACH MENU X,Y ENTRY TWO BYTES
	CLC                                                          ;
	ADC #offset_to_first_x_y_entry                               ; + OFFSET TO ARROW X,Y TABLE
	TAY                                                          ;
	LDA (MENU_OPTIONS_ADDR),Y                                    ; IS MENU OPTION ENTRY = EMPTY
	CMP #empty_x_y_entry                                          ;
	BEQ MOVE_TEAM_SELECT_ARROW_UP_DOWN_ONE                       ; YES-> SET MENU CHOICE UP OR DOWN ONE 
	RTS                                                          ; RETURN

_F}_CHECK_ARROWS_ON_SAME_SPOT_TEAM_SELECTION
	
_F{_DRAW_NFL_LOGO_MENU														; DONE
	
NFL_LOGO_Y_START_LOC		= $40
NFL_LOGO_Y_END_LOC			= $8c
current_y_loc				= LOCAL_5
current_x_offset			= LOCAL_6				
nfl_logo_x_start_loc		= LOCAL_7

LENGTH_OF_SHIELD			= SIZE_OF_TILE * 7	
	
DRAW_NFL_SHIELD_SPRITES[x_offset]:                               ; DRAW_MENU_NFL_LOGO (A= X LOCATION FOR LOGO)
	STA nfl_logo_x_start_loc                                      ; SAVE NFL LOGO X LOCATION
	LDA #$0F                                                     ; SET  SOFT CHR 1000 BANK = 0X0F = SHIELD OUTLINE
	STA SOFT_CHR_1000_BANK                                       ;     
	LDA #$1D                                                     ; SET SOFT CHR 1400 BANK = 0X1D = SHILED SPRITES
	STA SOFT_CHR_1400_BANK                                       ;    
	LDA #NFL_LOGO_Y_START_LOC                                    ; SET NFL LOGO Y START LOCATION = 0X40
	STA current_y_loc                                            ;
	LDY #$08                                                     ; SET SPRITE INDEX  TO THIRD SPRITE TILE
	LDX #$00                                                     ; SET SPRITE ATTRIBUTE INDEX TO FIRST ATTRIBUTE
	
_WHILE CC                                                       ;
	LDA #$00                                                     ; SET CURRENT ROW LOCATION = START OF ROW
	STA current_x_offset                                         ;
	
@draw_row:                                                       ; DRAW ROW OF TILES FOR SHIELD META SPRITE LOOP
	LDA NFL_SHIELD_SPRITE_TABLE,X                                ; IS CURRENT TILE = BACKGROUND ONLY?
	BMI @go_to_next_sprite_check_done                             ; YES-> GO TO NEXT TILE AND CHECK IF DONE
	
@draw_current_sprite: 	
	LDA current_y_loc                                                      ; SET SPRITE Y = CURRENT Y LOC
	STA CUR_SPRITE_Y,Y                                                  ;
	LDA NFL_SHIELD_SPRITE_TABLE+1,X                              ; SET SHIELD SPR TILE FROM NFL_SHIELD_SPRITE TABLE
	STA CUR_SPRITE_TILE,Y                                                  ;
	LDA NFL_SHIELD_SPRITE_TABLE,X                                ; SET SHIELD SPR ATTRIB FROM NFL_SHIELD_SPRITE TABLE
	STA CUR_SPRITE_ATTR,Y                                        ;
	LDA current_x_offset                                         ; SPRITE X = CURRENT X OFFSET
	CLC                                                          ;
	ADC nfl_logo_x_start_loc                                     ; + SHIELD STARTING X LOC
	STA CUR_SPRITE_X,Y                                           ; SAVE IN SPRITE X
	INY                                                          ; SPRITE INDEX += OFFSET TO NEXT SPRITE 
	INY                                                          ;
	INY                                                          ;
	INY                                                          ;
	
@go_to_next_sprite_check_done:                                    ; GO TO NEXT TILE AND CHECK IF DONE
	INX                                                          ; DATA INDEX += OFFSET TO NEXT ENTRY 
	INX                                                          ; 
	LDA current_x_offset                                         ;  CURRENT ROW LOCATION += LENGTH OF ONE TILE
	CLC                                                          ;
	ADC #SIZE_OF_TILE                                                     ;
	STA current_x_offset                                         ;
	CMP #LENGTH_OF_SHIELD                                        ; AT END OF ROW FOR META SPRITE?
	BCC @draw_row                                                ; NO-> DRAW ROW OF TILES FOR SHIELD META SPRITE LOOP
	
@move_down_one_row:	
	LDA current_y_loc                                            ; MOVE CURRENT Y LOCATION DOWN ONE ROW 
	CLC                                                          ;
	ADC #SIZE_OF_TILE                                             ;
	STA current_y_loc                                            ; 
	CPX #NFL_LOGO_Y_END_LOC                                      ;
_END_WHILE

	RTS                                                          ; RETURN

_F}_DRAW_NFL_LOGO_MENU 
	
_F{_INITILIZE_UPDATE_FLASHING_CONTROLLER_SPRITES							; DONE

			
INIT_FLASHING_CONTROLLER_SPRITES:                                ; SET SPR TILES FOR CONTROLLER FLASH ON PLAYBOOK SCREEN()

controller_sprite_info		=	CUR_SPRITE_Y + $10				 ; uses two sprites
	LDY #$00                                                     ;
	LDX #$00                                                     ;
	
_WHILE CC                                                       ; UPDATE CONTROLLER SPR TILES AND PALLETES

	LDA PLAYBOOK_FLASH_CONTROLLER_TILE_DATA,Y             ; LOAD CONTROLLER SPR TILE FROM UNFILLED_PLAYBOOK_CONTROLLER_SPR_TILE_DATA
	STA controller_sprite_info+1,X                               ;
	LDA #$00                                                     ; SET MIRRORING TO NORMAL, PAL SET TO FIRST
	STA controller_sprite_info+2,X                              ;
	SET_X_INDEX_NEXT_SPRITE
	INY                                                          ; DATA INDEX= 
	CPY #$08                                                     ; DONE UPDATING SPRITES?
	
_END_WHILE                                                       ; NO-> UPDATE CONTROLLER SPR TILES AND PALLETES
	RTS                                                          ; RETURN
	


UPDATE_FLASHING_CONTROLLER_SPRITES_BASED_ON_PLAY:               ; SET FLASHING CONTROLLER TILES X,Y BASED ON PLAY SELECTED()

@set_y_location_of_ctrl_spr	
	LDX MENU_Y                                                   ; LOAD PLAY TYPE SLECTED
	LDA CONTROLLER_SPR_Y_LOC_BY_PLAY_TYPE_TABLE,X                 ; SET Y LOCATION FOR TILES FROM CONTROLLER TILES Y LOCATIONS
	STA controller_sprite_info                                   ;
	STA controller_sprite_info + $04                             ;
	STA controller_sprite_info + $08                             ;
	STA controller_sprite_info + $0C                             
	CLC                                                          ;
	ADC #$08                                                     ; MOVE DOWN ONE ROW
	STA controller_sprite_info + $10                             ;
	STA controller_sprite_info + $14                             ;
	STA controller_sprite_info + $18                              ;
	STA controller_sprite_info + $1c                             ;
	
@set_x_location_of_ctrl_spr	
	LDX MENU_X                                                   ; LOAD PLAY # SLECTED
	LDA CONTROLLER_SPR_X_LOC_BY_PLAY_NUMBER_TABLE,X             ; SET X LOCATION FOR TILES FROM CONTROLLER TILES X LOCATIONS
	STA controller_sprite_info + $03                              ;
	STA controller_sprite_info + $13                              ;
	CLC                                                          ;
	ADC #$08                                                     ; MOVE DOWN ONE ROW
	STA controller_sprite_info + $07                                                     ;
	STA controller_sprite_info + $17                                                     ;
	CLC                                                          ;
	ADC #$08                                                     ; MOVE DOWN ONE ROW
	STA controller_sprite_info  + $0B                                                    ;
	STA controller_sprite_info  + $1B                                                     ;
	CLC                                                          ;
	ADC #$08                                                     ; MOVE DOWN ONE ROW
	STA controller_sprite_info  + $0F                                                    ;
	STA controller_sprite_info  + $1F                                                    ;
	RTS                                                          ; RETURN
	
CONTROLLER_SPR_Y_LOC_BY_PLAY_TYPE_TABLE: 
.DB $70, $C0                                                      ; CONTROLLER TILES Y LOCATIONS (PASS, RUN)

CONTROLLER_SPR_X_LOC_BY_PLAY_NUMBER_TABLE: 
.DB $20, $58, $90, $C8                                             ; CONTROLLER TILES X LOCATIONS (PLAY1,PLAY2, PLAY3, PLAY 4)

_F}_UPDATE_FLASHING_CONTROLLER_SPRITES

_F{_DO_COIN_TOSS												 			; DONE

scene_id = LOCAL_8

DO_COIN_TOSS:                                                    ; COIN TOSS ROUTINE
	SET_ADDR_XY[addr] SMALL_LARGE_LETTERS_LOGO_IRQ_INFO 
	JSR LOAD_IRQ_SPLIT_DATA                                      ; LOAD IRQ SPLIT INFO(Y,X= IRQ INFO ADDRESS) 
	LDA #KICKER_STARTER_ID                                       ; SET PLAYER 1 AND PLAYER 2 ICON TO KICKER
	STA P1_MAN_POS_ID_ICON_STATUS                                ;
	STA P2_MAN_POS_ID_ICON_STATUS                                ;
	STA DEF_SACK_BALL_BLOCK_STARTER_ID                           ; 
	LDA RANDOM_3                                                 ; SET COIN TOSS CUTSCENE INDEX 
	AND #$01                                                     ; MAKE RANDOM 3D 0 OR 1 AN 
	CLC                                                          ;
	ADC #P1_WINS_COIN_TOSS_SCENE_ID                              ; ADD 0X2C
	STA scene_id                                                 ; SAVE 0X2C +(0 OR 1) IN $45
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; LOAD BANK 8
	JSR DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP
	BCS @coin_toss_skipped                                       ; IF B PRESSED BRNACH TO COIN TOSS CUTSCNE SKIPPED
	
@exit:	
	RTS                                                          ; RETURN

@coin_toss_skipped:                                              ; COIN TOSS CUTSCNE SKIPPED
	LDA RANDOM_3                                                 ;  
	AND #$20                                                     ;
	BEQ @p2_gets_kickoff                                         ;
	
@p1_gets_kickoff	
	SET_GAME_STATUS_P1_GOT_OPENING_KICKOFF[]
	RTS                                                          ;
	
@p2_gets_kickoff:
	SET_GAME_STATUS_P2_GOT_OPENING_KICKOFF[]
	RTS                                                          ; RETURN

_F}_DO_COIN_TOSS 

_F{_DO_OVERTIME_COIN_TOSS 													; DONE

DO_OVER_TIME_COIN_TOSS:                                                       ; DO OVERTIME COIN TOSS()
	SET_ADDR_XY[addr] SMALL_LARGE_LETTERS_LOGO_IRQ_INFO 
	JSR LOAD_IRQ_SPLIT_DATA                                      ; LOAD IRQ SPLIT INFO(Y,X= IRQ INFO ADDRESS)
	LDA #KICKER_STARTER_ID                                       ; SET PLAYER 1 AND PLAYER 2 ICON TO KICKER
	STA P1_MAN_POS_ID_ICON_STATUS                                ;
	STA P2_MAN_POS_ID_ICON_STATUS                                ;
	STA DEF_SACK_BALL_BLOCK_STARTER_ID                           ; 
	LDA RANDOM_3                                                 ; LOAD RANDOM 
	AND #$08                                                     ; CHECK SINGLE BIT 50% CHANCE OF COIN TOSS
	BEQ @p2_wins_ot_toss                                                  ; AWAY WINS TOSS? YES-> BRANCH TO PLAYER 2 WINS OVERTIME TOSS
	
@p1_wins_ot_toss:	
	LDA #$00                                                     ; SET POSSESSION STATUS TO P2 KICKOFF, BALL STATUS TO P1 WAITING FOR BALL? 
	STA POSSESSION_STATUS                                        ;
	STA BALL_STATUS                                              ;
	LDA #OT_COIN_TOSS_P1_WINS_SCENE_ID                           ; LOAD P1 WINS OVERTIME TOSS CUTSCENE
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; LOAD BANK 8
	JMP DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP 
	
@p2_wins_ot_toss:                                                ; PLAYER 2 WINS OVERTIME TOSS
	LDA #$83                                                     ; SET POSSESSION STATUS TO P1 KICKOFF, BALL STATUS TO P2 WAITING FOR BALL? 
	STA POSSESSION_STATUS                                        ;
	LDA #$01                                                     ;
	STA BALL_STATUS                                              ;
	LDA #OT_COIN_TOSS_P2_WINS_SCENE_ID                           ; LOAD P2 WINS OVERTIME TOSS CUTSCENE
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK               ; LOAD BANK 8
	JMP DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP

_F}_DO_OVERTIME_COIN_TOSS  

_F{_DO_HALFTIME_SHOW														; DONE
	
DO_HALFTIME_SHOW:                                               ; CHECK FOR HALF TIME SHOW TO DRAW()
    IF_GAME_STATUS_NOT_PLAYOFFS[ADDR] DO_RANDOM_HALFTIME_SHOW
																 ; *** seems redundant ****
	LDA CURRENT_WEEK_IN_SEASON                                   ; IS CURRENT WEEK = WEEK 18 = PLAYOFFS
	CMP #FIRST_WEEK_OF_PLAYOFFS                                   ;
	BNE DO_RANDOM_HALFTIME_SHOW                                  ; NO-> BRANCH TO DRAW RANDOM HALFTIME SHOW
	LDA CURRENT_GAME_IN_WEEK                                     ; IS CURRENT GAME = SUPER BOWL?
	CMP #SUPERBOWL_GAME_ID                               ; 
	BEQ DO_MIGHTY_BOMBJACK_HALFTIME                              ; YES->BRANCH TO DRAW MIGHTY BOMBJACK HALFTIME 

																 ; 59 = BLIMP, WINK, BAND, KISS, 
																 ; 5A = PARACHUTE, WAVE, CHEER X 2, CHEER TOSS W PANTY 
																 ; 5B = CHEER X 2, BANS, BLIMP, WINK
																 ; 5C = WINK, CHEER X 2, CHEER TOSS W PANTY, KISS    
DO_RANDOM_HALFTIME_SHOW:                                         ; DRAW RANDOM HALFTIME
	JSR HEAVIER_RANDOMIZE                                                   ; UPDATE RANDOMS(), RET A= RAND
	AND #$03                                                     ; MAKE NUMBER 59 TO 5B FOR CUTSCENE INDEX
	CLC                                                          ;
	ADC #HALFTIME_SCENES_ID                                      ;
	LDX #CUTSCENE_DRAW_SCRIPT_BANK                               ; LOAD BANK 7
	JMP DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP

DO_MIGHTY_BOMBJACK_HALFTIME:                                     ; DRAW MIGHTY BOMBJACK HALFTIME
	LDA #MIGHTY_BOMBJACK_HALFTIME_SCENE_ID                       ; LOAD SPECIAL HALFTIME CUTSCENE INDEX
	LDX #CUTSCENE_DRAW_SCRIPT_BANK                               ; LOAD BANK 7
	JMP DRAW_SCREEN_SKIP_IF_B                                    ; DRAW SCREEN(A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP

_F}_DO_HALFTIME_SHOW 

_F{_CHECK_ALL_DIVISIONS_FOR_CHAMP_CUTSCENE_CHECK							; DONE


current_division_id					= SEGMENT_VAR_8E
current_team_in_division			= SEGMENT_VAR_8F
current_team_win_check				= SEGMENT_VAR_90
num_teams_division_left_to_check	= SEGMENT_VAR_91
num_teams_division_win_check		= SEGMENT_VAR_92
standings_array_index				= SEGMENT_VAR_93

team_winpct_and_id[]				= SEGMENT_VAR_9E

	
CHECK_DIVISION_CHAMP_CUTSCENE:                                   ; DIVISION CHAMP CUTSCENE CHECK
	LDA CURRENT_WEEK_IN_SEASON                                   ; LOAD CURRENT WEEK
	CMP #WEEK_TO_CHECK_FOR_DIV_CHAMPION                          ; IS CURRENT WEEK GREATER THAN 8?
	BCC @exit                                                   ; NO-> BRANCH TO DIVISIION CHAMP CUTSCENE CHECK EXIT
	LDA #AFCE_DIVISION_ID                                        ; LOAD AFC EAST DIVISION INDEX
	JSR CHECK_IF_DIVISION_HAS_CHAMP                              ; CHECK STANDINGS FOR DIVISION CHAMP (A= DIVISION INDEX)
	LDA #AFCC_DIVISION_ID                                        ; LOAD AFC CENTRAL DIVISION INDEX
	JSR CHECK_IF_DIVISION_HAS_CHAMP                              ; CHECK STANDINGS FOR DIVISION CHAMP (A= DIVISION INDEX)
	LDA #AFCW_DIVISION_ID                                        ; LOAD AFC WEST DIVISION INDEX
	JSR CHECK_IF_DIVISION_HAS_CHAMP                              ; CHECK STANDINGS FOR DIVISION CHAMP (A= DIVISION INDEX)
	LDA #NFCE_DIVISION_ID                                        ; LOAD NFC EAST DIVISION INDEX
	JSR CHECK_IF_DIVISION_HAS_CHAMP                              ; CHECK STANDINGS FOR DIVISION CHAMP (A= DIVISION INDEX)
	LDA #NFCC_DIVISION_ID                                        ; LOAD NFC CENTRAL DIVISION INDEX 
	JSR CHECK_IF_DIVISION_HAS_CHAMP                              ; CHECK STANDINGS FOR DIVISION CHAMP (A= DIVISION INDEX)
	LDA #NFCW_DIVISION_ID                                        ; LOAD NFC WEST DIVISION INDEX
	JSR CHECK_IF_DIVISION_HAS_CHAMP                              ; CHECK STANDINGS FOR DIVISION CHAMP (A= DIVISION INDEX)
	
@exit:                                                          ; DIVISION CHAMP CUTSCENE CHECK EXIT
	RTS                                                          ; RETURN

CHECK_IF_DIVISION_HAS_CHAMP:                                     ; CHECK STANDINDS FOR DIVISION CHAMP(A= DIVISION INDEX)
	TAY                                                          ; 
	LDX DIVISION_WINNERS[],Y                                        ; DOES SRAM DIVISION CHAMPS FOR DIVISION HAVE WINNER?
	BMI @check_division_for_winner                               ; NO->CHECK DIVISION FOR WINNER(A= DIVISION) 
	RTS                                                          ; RETURN

@check_division_for_winner:                                       ; CHECK DIVISION FOR WINNER(A= DIVISION)    
	STA current_division_id	                                     ; SAVE DIVISION INDEX
	ASL                                                          ; EACH DIVISION LIST ENTRY IS TWO BYTES
	TAY                                                          ;
	LDA DIVISIONS_INFO_TABLE,Y                                         ; LOAD FIRST TEAM IN DIVISION
	STA current_team_in_division                                 ;
	STA current_team_win_check                                   ;
	LDA DIVISIONS_INFO_TABLE+1,Y                                       ; LOAD NUMBER OF TEAMS IN DIVISION
	STA num_teams_division_left_to_check                         ;
	STA num_teams_division_win_check                             ;
	
@calculate_winpct_for_all_teams_in_division	
	LDA #$00                                                     ; SET DIVISION ARRAY TEAM INDEX = FIRST TEAM
	STA standings_array_index                                    ;


season_data_addr		= LOCAL_1
season_losses			= LOCAL_7
total_games_played		= LOCAL_8
wins_plus_games_left	= LOCAL_8	
	
_WHILE NOT_EQUAL                                                 ; LOAD ALL DIVISION TEAM IDS AND WIN %’S INTO ARRAY

	LDA current_team_in_division                                 ; LOAD CURRENT DIVISION TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #LOSSES_SEASON_STATS_OFFSET                              ; LOAD OFFSET TO TEAM LOSSES
	LDA (season_data_addr),Y                                     ;
	STA season_losses                                            ; SAVE LOSSES
	LDY #WINS_SEASON_STATS_OFFSET                                ; LOAD OFFSET TO TEAM WINS
	CLC                                                          ;
	ADC (season_data_addr),Y                                     ;
	LDY #TIES_SEASON_STATS_OFFSET                                ; LOAD OFFSET TO TEAM TIES 
	CLC                                                          ;
	ADC (season_data_addr),Y                                     ;
	STA total_games_played                                       ; TOTAL GAMES = WINS + TIES+ LOSSES
	LDA #TOTAL_GAMES_PER_TEAM                                    ; = 16
	SEC                                                          ;
	SBC total_games_played                                       ; - TOTAL GAMES
	LDY #WINS_SEASON_STATS_OFFSET                                ;
	CLC                                                          ;
	ADC (season_data_addr),Y                                     ; + WINS
	STA wins_plus_games_left                                     ; = (16-TOTAL GAMES) + WINS
	JSR CALC_WIN_PCT                                             ;

@save_team_win_pct:	
	LDX standings_array_index                                    ; SAVE TEAM WIN PERCENTAGE IN STANDINGS ARRAY
	STA team_winpct_and_id[],X                                   ;

@save_team_id:	
	LDA current_team_in_division                                 ; SAVE TEAM ID IN STANDINGS ARRAY
	STA team_winpct_and_id[]+1,X                                                    ;

@set_index_to_next_slot	
	INC standings_array_index                                    ; DIVISION ARRAY TEAM INDEX += OFFSET TO NEXT TEAM
	INC standings_array_index                                    ; 

@set_team_to_next_team:	
	INC current_team_in_division                                 ; CURRENT DIVISION TEAM++
	DEC num_teams_division_left_to_check                         ; NUMBER OF TEAMS IN DIVISION TO CHECK --
	
_END_WHILE

COMPARE_TEAMS_IN_DIVISION:

current_team_win_pct				= 	LOCAL_7
temp_calculation					= 	LOCAL_7
team_games_played					= 	LOCAL_7
team_wins 							= 	LOCAL_8
	
	LDA num_teams_division_win_check                             ; RESET NUMBER OF TEAMS IN DIVISION TO CHECK = NUMBER OF TEAMS IN DIVISION
	STA num_teams_division_left_to_check                         ;
	
_WHILE NOT_EQUAL                                                ; COMPARE TEAM WINS + TIES VS POSSIBLE WINS TIES($90= DIV TEAM)
	LDA current_team_win_check                                  ; LOAD FIRST TEAM IN DIVISION
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #WINS_SEASON_STATS_OFFSET                                ; = TEAM WINS
	LDA (season_data_addr),Y                                     ;
	STA team_wins                                                      ;
	LDY #TIES_SEASON_STATS_OFFSET                                ; + TEAM TIES
	CLC                                                          ;
	ADC (season_data_addr),Y                                     ;
	LDY #LOSSES_SEASON_STATS_OFFSET                              ; + TEAM LOSSES
	CLC                                                          ;
	ADC (season_data_addr),Y                                     ;
	STA team_games_played                                         ; = TOTAL GAMES
	
@total_possible_games_minus_games_played:	
	LDA #TOTAL_GAMES_PER_TEAM                                    ; = 16- TOTAL GAMES + LOSSES = 16 – (WINS + TIES) 
	SEC                                                          ;
	SBC team_games_played                                        ;
	CLC                                                          ;
	ADC (season_data_addr),Y                                     ;
	STA temp_calculation                                                      ; 
	JSR CALC_WIN_PCT                                             ; ($44+$45)
	STA current_team_win_pct                                                      ;
	LDY num_teams_division_left_to_check                         ; LOAD NUMBER OF TEAMS IN DIVISION
	
	LDX #$00                                                     ; 
@check_team_vs_all_in_division:                                  ; CHECK CURRENT TEAM VS ALL TEAMS IN DIVISION LOOP

@check_if_team_to_check_is_same_as_current_team
	LDA current_team_win_check                                   ; IS CURRENT DIVISION TEAM = TEAM TO CHECK
	CMP team_winpct_and_id[]+1,X                                 ;
	BEQ @go_to_next_team_in_division                             ; YES-> GO TO NEXT TEAM IF SAME TEAM
	
@compare_win_pct_of_two_Teams	
	LDA team_winpct_and_id[],X                                   ; IS POSSIBLE WIN PCT > CURRENT TEAM WIN %
	CMP current_team_win_pct                                                  ;
	BCS @go_to_next_team_check_if_done                           ; YES->CHECK NEXT TEAM AMND RETURN WHEN DONE
	
@go_to_next_team_in_division:                                    ; GO TO NEXT TEAM
	INX                                                          ; DIVISION ARRAY TEAM INDEX
	INX                                                          ;
	DEY                                                          ; NUMBER OF TEAMS IN DIVISION TO CHECK--
	BNE @check_team_vs_all_in_division                           ; DONE NO->CHECK CURRENT TEAM VS ALL TEAMS IN DIVISION LOOP
	
@set_team_as_division_winner:	
	MMC3_SRAM_WRITE_ENABLE
	LDX current_division_id	                                     ; LOAD DIVISION INDEX
	LDA current_team_win_check                                   ; SET DIVISION WINNER = CURRENT DIVISION TEAM
	STA DIVISION_WINNERS[],X                                        ;
	STA CURRENT_TEAM                                             ; SET CURRENT TEAM = DIVISION WINNER
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE										 ;
	
@draw_division_champ_cutscene:	
	LDA #DIVISION_CHAMP_SCENE_ID                                 ; LOAD DIVISION CHAMP CUTSCENE INDEX
	LDX #CUTSCENE_DRAW_SCRIPT_BANK                               ; LOAD BANK 7
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; DO CUTSCENE UNTIL DONE (A= CUTSCENE INDEX, X= BANK) 
	JSR FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0                      ; FADE OUT PAL, CLEAR IRQ0 XSCROLL,COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES()
	
@go_to_next_team_check_if_done:                                  ; CHECK NEXT TEAM AMND RETURN WHEN DONE
	INC current_team_win_check                                   ; CURRENT DIVISION TEAM++
	DEC num_teams_division_win_check                             ; NUMBER OF TEAMS IN DIVISION
_END_WHILE                                                       ; DONE? NO->COMPARE TEAM WINS + TIES VS POSSIBLE WINS TIES($90= DIV TEAM)

	RTS                                                          ; RETURN

_F}_CHECK_ALL_DIVISIONS_FOR_CHAMP_CUTSCENE_CHECK
	
_F{_DRAW_DIVISION_STANDINGS													; DONE

num_teams_left_compare_loop			= SEGMENT_VAR_8E
num_teams_division_left_to_check	= SEGMENT_VAR_8F
num_teams_in_division				= SEGMENT_VAR_90

team_info[]							= SEGMENT_VAR_96

DRAW_DIVISION_STANDINGS_MENU_CHOICE:                             ; DRAW DIVISION STANDINGS($E1,$E2= MENU CHOICE)
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	LDA #$00                                                     ; SET Y SCROLL =$0000
	STA CURR_Y_SCROLL                                            ;
	STA CURR_Y_SCROLL+1                                          ;
	
@convert_menu_choice_to_division_id	
	LDA MENU_Y                                                   ; CONVERT MENU X,Y TO DIVISION
	ASL                                                          ;
	CLC                                                          ;
	ADC MENU_Y                                                   ;
	CLC                                                          ;
	ADC MENU_X                                                   ;

next_team_sram_addr					= LOCAL_3
current_team_sram_addr				= LOCAL_1
division_id							= LOCAL_8

DRAW_DIVISION_STANDINGS_DIVISION_ID:                             ; DRAW DIVISION STANDINGS BACKGROUND(A=DIVISION)
	STA division_id                                              ; SAVE DIVISION
	CLC                                                          ;
	ADC #AFC_EAST_STANDINGS_TEXT_SCREEN_ID                       ; + OFFSET TO DIVISION NAME 
	LDX #MENU_DRAW_SCRIPT_BANK                                                      ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDA division_id                                              ;
	ASL                                                          ;
	TAY                                                          ;
	LDA DIVISIONS_INFO_TABLE,Y                                         ; LOAD FIRST TEAM IN DIVISION
	LDX DIVISIONS_INFO_TABLE+1,Y                                       ; LOAD NUMBER OF TEAMS IN DIVISION
	STX num_teams_in_division                                    ; SAVE NUMBER OF TEAMS IN DIVISION
	JSR LOAD_DIVISION_TEAMS_WIN_PCT_ARRAY                        ; ORDER DIVISION TEAMS IN ARRAY(A= FIRST TEAM, X= NUMBER OF TEAMS)
	LDA num_teams_in_division                                    ; LOAD NUMBER OF TEAMS IN DIVISION
	STA num_teams_division_left_to_check                         ; SAVE IN NUMBER OF TIMES TO LOOP
	DEC num_teams_division_left_to_check                         ; NUMBER OF TIMES TO LOOP--
	
_WHILE NOT_EQUAL                                                 ; SET INDEX TO HIGHEST ORDERED TEAM IN DIVSION
	LDA num_teams_division_left_to_check                         ; 
	STA num_teams_left_compare_loop	                             ; 
	LDX #$00                                                     ;
@compare_win_pct_loop:                                           ; CURRENT TEAM SORT LOOP
	LDA team_info[],X                                            ; = CURRENT TEAM WIN % VS NEXT TEAM WIN %
	CMP team_info[]+2,X                                          ;
	BCC @swap_order_of_teams                                     ; CURRENT TEAM WIN % < NEXT TEAM WIN %? YES->SWAP ORDER OF TEAMS AND GO TO NEXT TEAM()
	BNE @go_to_next_team                                         ; CURRENT TEAM WIN % > NEXT TEAM WIN %? YES->GO TO NEXT TEAM AND CHECK IF DONE


@check_pt_diff_tiebreaker										 ; WIN % TIE BREAKERS
	JSR COMPARE_TEAM_PT_DIFFERENTIAL                             ; COMPARE TEAM POINT DIFFERENTIAL()
	BNE @check_sign_of_compare                                                   ; CURRENT TEAM POINT DIF != NEXT TEAM POINT DIFF 
	
@check_pts_for_tiebreaker	
	LDY #POINTS_FOR_SEASON_STATS_OFFSET                          ; SET INDEX = TEAM OFFENSIVE POINTS
	LDA (next_team_sram_addr),Y                                  ; = CURRENT TEAM OFFENSIVE POINTS – NEXT TEAM OFFENSIVE POINTS
	CMP (current_team_sram_addr),Y                               ;
	INY                                                          ;
	LDA (next_team_sram_addr),Y                                  ;
	SBC (current_team_sram_addr),Y                               ;
	BCC @set_current_team_has_tiebreaker                          ; CURRENT TEAM OFFENSIVE POINTS < NEXT TEAM’S? 
	
@set_next_team_has_tiebreaker	
																 ; SET NEXT TEAM HAS FINAL TIEBREAKER ADVANTAGE
	LDA team_info[]+3,X                                          ; SET TIBREAK ADVANTAGE STATUS + NEXT TEAM ID
	ORA #$80                                                     ;
	STA team_info[]+3,X                                          ;
	JMP @go_to_next_team                                         ;
	
@set_current_team_has_tiebreaker:                                ; SET CURRENT TEAM HAS FINAL TIEBREAKER ADVANTAGE
	LDA team_info[]+1,X                                          ; SET TIBREAK ADVANTAGE STATUS +  CURRENT TEAM ID
	ORA #$80                                                     ;
	STA team_info[]+1,X                                          ;
	JMP @swap_order_of_teams                                     ; JUMP->SWAP ORDER OF TEAMS AND GO TO NEXT TEAM()

@check_sign_of_compare:                                          ; SWAP TEAMS IF CURRENT TEAM DIF > NEXT TEAM DIF
	BCS @go_to_next_team                                         ; CURRENT TEAM>? YES-> GO TO NEXT TEAM AND CHECK IF DONE

@swap_order_of_teams:                                            ; SWAP ORDER OF TEAMS AND GO TO NEXT TEAM()
	JSR SWAP_ADJANCENT_TEAMS_ORDER                               ; SWAP ORDER OF ADJACENT TEAMS (X= INDEX TO HIGHER ORDERED TEAM)

@go_to_next_team:                                                ; GO TO NEXT TEAM AND CHECK IF DONE
	INX                                                          ; CURRENT TEAM INDEX += OFFSET TO NEXT TEAM
	INX                                                          ;
	DEC num_teams_left_compare_loop	                             ; DONE WITH FIRST PASS? NO->CURRENT TEAM SORT LOOP
	BNE @compare_win_pct_loop                                    ;
	DEC num_teams_division_left_to_check                         ; 
	
_END_WHILE                                                       ; DONE? NO->SET INDEX TO HIGHEST ORDERED TEAM IN DIVSION
	
@draw_division_mini_helmets:	
	JSR SAVE_MINI_HELMET_ATTR_TABLES_IN_SRAM                            ; SAVE ATTRIBUTE TABLE IN SRAM(), SET CHR 1800,1C00 BANKS, SET $B8()
	LDA #$00                                                     ; SET RANKING # OF TEAM = FIRST TEAM = #1 RANKED TEAM
	STA $8E                                                      ;
	LDA team_info[]+1                                            ; LOAD DIVISION TEAM 1 TEAM ID
	LDX #$00                                                     ; SET TEAM INDEX = TEAM 1
	JSR DRAW_MINI_HELMETS_DIVISION_STANDINGS                     ; DRAW HELMETS FOR DIVISION STANDINGS (A= TEAM ID, X= TEAM INDEX IN DIVISION)
	LDA team_info[]+3                                            ; LOAD DIVISION TEAM 2 TEAM ID
	LDX #$01                                                     ; SET TEAM INDEX = TEAM 2
	JSR DRAW_MINI_HELMETS_DIVISION_STANDINGS                     ; DRAW HELMETS FOR DIVISION STANDINGS (A= TEAM ID, X= TEAM INDEX IN DIVISION)
	LDA team_info[]+5                                            ; LOAD DIVISION TEAM 3 TEAM ID
	LDX #$02                                                     ; SET TEAM INDEX = TEAM 3
	JSR DRAW_MINI_HELMETS_DIVISION_STANDINGS                     ; DRAW HELMETS FOR DIVISION STANDINGS (A= TEAM ID, X= TEAM INDEX IN DIVISION)
	LDA team_info[]+7                                            ; LOAD DIVISION TEAM 4 TEAM ID
	LDX #$03                                                     ; SET TEAM INDEX = TEAM 4
	JSR DRAW_MINI_HELMETS_DIVISION_STANDINGS                     ; DRAW HELMETS FOR DIVISION STANDINGS (A= TEAM ID, X= TEAM INDEX IN DIVISION)
	
@check_if_division_is_four_teams: 	
	LDA num_teams_in_division                                    ; LOAD # OF TEAMS IN DIVISION
	CMP #$04                                                     ; IS 4 TEAM DIVISION?
	BEQ @draw_division_standings_background:                     ; YES-> DRAW STANDINGS BACKGROUND SCREEN
	
@draw_fifth_team_division_id	
	LDA team_info[]+9                                            ; LOAD DIVISION TEAM 5 TEAM ID
	LDX #$04                                                     ; SET TEAM INDEX = TEAM 5
	JSR DRAW_MINI_HELMETS_DIVISION_STANDINGS                     ; DRAW HELMETS FOR DIVISION STANDINGS (X= TEAM INDEX IN DIVISION)
	
@draw_division_standings_background:                             ; DRAW STANDINGS BACKGROUND SCREEN
	JSR LOAD_BG_ATTR_VALUES_BOTH_SCREENS_FROM_SRAM               ; UPDATE PPU ATTRIBUTE TABLES FROM SRAM BUFFER()
	RETURN_1_FRAME  
	LDA num_teams_in_division                                    ; NUM TEAMS IN DIVISON
	CLC
	ADC #(FOUR_TEAM_DIV_STANDINGS_SCREEN_ID - $04)               ; + OFFSET TO STANDINGS BACKGROUND
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JMP DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)

_F}_DRAW_DIVISION_STANDINGS 
	
_F{_DRAW_DATA_AND_MINI_HELMETS_DIVISION_STANDINGS 							; DONE

   current_team_sram_addr		  = LOCAL_1 
   ppu_data_addr				  = LOCAL_1	
   
   num_rows						  = LOCAL_1
   num_tiles_per_row			  = LOCAL_2
   
   team_wins					  = LOCAL_7
   team_losses					  = LOCAL_7
   team_ties					  = LOCAL_7
   team_points_for			      = LOCAL_7						; 16 bit 	
   team_points_against			  = LOCAL_7

   
   hex_to_BCD_result			  = LOCAL_3
   team_points_for_BCD			  = LOCAL_7
   team_points_against_BCD		  = LOCAL_7
   
   wins_plus_losses				  = LOCAL_3
   win_pct_BCD					  = LOCAL_3
   divide_result				  = LOCAL_6
   win_pct_hex					  = LOCAL_7	
   
   helmet_index				 	  = LOCAL_8
   playoff_team_tile_id			  = LOCAL_8

   team_ranking_number            = SEGMENT_VAR_8E
   team_index_in_division         = SEGMENT_VAR_8F
   current_team_id                = SEGMENT_VAR_91
   season_stats_addr              = SEGMENT_VAR_92
   ppu_addr						  = SEGMENT_VAR_94
   
   PPU_OFFSET_TO_RANKING_NUMBER	  =  $20 	
   PPU_OFFSET_TO_NO_GAMES_DASH	  =  $27
   PPU_OFFSET_TO_TEAM_WINS		  =  $26
   PPU_OFFSET_TO_TEAM_LOSSES	  =  PPU_OFFSET_TO_TEAM_WINS + $03	
   PPU_OFFSET_TO_TEAM_TIES		  =  PPU_OFFSET_TO_TEAM_LOSSES + $03
   PPU_OFFSET_TO_TEAM_WIN_PCT	  =  PPU_OFFSET_TO_TEAM_TIES + $03 
   
   PPU_OFFSET_TO_POINTS_FOR		  =  PPU_OFFSET_TO_TEAM_WIN_PCT + $05 
   PPU_OFFSET_TO_POINTS_AGAINST   =  PPU_OFFSET_TO_POINTS_FOR + $04	
   PPU_OFFSET_TO_TEAM_ABBREV	  =  $42

DRAW_MINI_HELMETS_DIVISION_STANDINGS:                            ; DRAW HELMETS FOR DIVISION STANDINGS(X= TEAM INDEX IN DIVISION)
	STA current_team_id                                          ; SAVE TEAM ID
	AND #$1F                                                     ;
	STA helmet_index                                             ;
	STX team_index_in_division                                   ; SAVE CURRENT DIVISION INDEX 
	LDA MINI_HELMETS_Y_LOCATIONS_DIV_STANDINGS,X                 ; LOAD SPRITE Y COORDINATE FOR MINI HELMETS FROM Y LOC FOR MINI HELMETS FOR DIVISION STANDINGS TABLE
	LDY #$20                                                     ; SET SPRITE  X COORDINATE FOR MINI HELMETS
	LDX #$00                                                     ; SET NAME TABLE = FIRST PAGE
	JSR SAVE_MINI_HELMET_DATA_TO_BG_BUFFER                       ; SAVE MINI HELMET DATA TO BUFFER ( $45=HELMET INDEX, Y,A = COORDINATES, X= NAMETABLE)  
	LDA team_index_in_division                                    ; LOAD CURRENT DIVISION TEAM INDEX
	ASL                                                          ;
	TAX                                                          ;
	
@set_team_ppu_addr_:	
	LDA TEAM_STANDINGS_RANK_NUMBER_PPU_ADDR_TABLE,X              ; SET PPU ADDR FROM  TEAM STANDINGS NUMBER PPU ADDR
	STA ppu_addr                                                 ;
	LDA TEAM_STANDINGS_RANK_NUMBER_PPU_ADDR_TABLE+1,X            ;
	STA ppu_addr+1                                               ;
	LDX team_ranking_number                                      ; LOAD RANKING # OF TEAM
	LDA current_team_id                                          ; LOAD TEAM ID
	BMI @add_Ranking_number_to_buffer                            ;

@set_to_next_team	
	INX                                                          ; DIVISION TEAM INDEX++
	STX team_ranking_number                                      ; SAVE CURRENT DIVISION TEAM INDEX
	
@add_Ranking_number_to_buffer:
	LDA #PPU_OFFSET_TO_RANKING_NUMBER                            ; SET PPU OFFSET = 1 ROW
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA #$01                                                     ; SET LENGTH = 1
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                        ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	
@convert_ranking_number_to_tile: 	
	LDA team_ranking_number                                      ; CONVERT RANKING # OF TEAM IN DIVISION TO TILE
	AND #$0F                                                     ;
	CLC                                                          ;
	ADC #OFFSET_TO_NUMBER_TILES                                  ;
	STA CURRENT_BG_BUFFER_LOC,X                                  ; SAVE DIVISION ORDER NUMBER TILE IN BUFFER
	INX                                                          ; BUFFER INDEX++
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                    ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	
	LDA #PPU_OFFSET_TO_TEAM_ABBREV                               ; SET VALUE = 2 ROW
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA current_team_id                                          ; LOAD TEAM ID
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT                            ; DRAW ABREV TEAM, CITY, OR CONFERENCE (X,Y =PPUADDRESS, A= TEAM ID)
	LDA current_team_id                                          ; LOAD TEAM ID
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDA current_team_sram_addr                                   ;
	STA season_stats_addr                                        ;
	LDA current_team_sram_addr+1                                 ;
	STA season_stats_addr+1                                      ;
	LDY #WINS_SEASON_STATS_OFFSET                                 ; LOAD TEAM WINS
	LDA (season_stats_addr),Y                                    ;
	LDY #LOSSES_SEASON_STATS_OFFSET                              ; LOAD TEAM LOSSES
	ORA (season_stats_addr),Y                                    ;
	LDY #TIES_SEASON_STATS_OFFSET                                ; LOAD TEAM TIES
	ORA (season_stats_addr),Y                                    ;
	BNE @draw_team_standings_info                                ; ANY GAMES PLAYED?
	
	JMP @no_games_played_draw_dashes                             ; NO->NO GAMES PLAYED DRAW DASHES
	
@draw_team_standings_info:

@draw_team_wins:
	LDY #WINS_SEASON_STATS_OFFSET                                 ; LOAD TEAM WINS
	LDA (season_stats_addr),Y                                    ;
	JSR HEX_TO_2_DIGIT_DEC                                       ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDA #PPU_OFFSET_TO_TEAM_WINS                                                     ; SET PPU OFFSET TO TEAM WINS 
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA team_wins                                                ; LOAD WINS DECIMAL NUMBER
	JSR CONVERT_2_DIG_NUM_TILES                                  ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(X,Y= PPUADDR, A=NUMBER)

@draw_team_losses:	
	LDY #LOSSES_SEASON_STATS_OFFSET                              ; LOAD TEAM LOSSES
	LDA (season_stats_addr),Y                                    ;
	JSR HEX_TO_2_DIGIT_DEC                                       ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDA #PPU_OFFSET_TO_TEAM_LOSSES                               ; SET PPU OFFSET TO TEAM LOSSES 
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA team_losses                                              ; LOAD LOSSES DECIMAL NUMBER
	JSR CONVERT_2_DIG_NUM_TILES                                  ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(X,Y= PPUADDR, A=NUMBER)

@draw_team_ties:	
	LDY #TIES_SEASON_STATS_OFFSET                                ;
	LDA (season_stats_addr),Y                                    ;
	JSR HEX_TO_2_DIGIT_DEC                                       ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDA #PPU_OFFSET_TO_TEAM_TIES                                 ; SET PPU OFFSET TO TEAM TIES
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA team_ties                                                ; LOAD TIES DECIMAL NUMBER	
	JSR CONVERT_2_DIG_NUM_TILES                                  ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(X,Y= PPUADDR, A=NUMBER)
	
@draw_team_points_for:	
	LDY #POINTS_FOR_SEASON_STATS_OFFSET                          ; LOAD TEAM POINTS
	LDA (season_stats_addr),Y                                    ;
	STA team_points_for                                          ;
	INY                                                          ;
	LDA (season_stats_addr),Y                                    ;
	STA team_points_for+1                                        ;
	JSR HEX_TO_3_DIGIT_DEC                                       ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)
	LDA hex_to_BCD_result                                        ; SAVE TEAM POINTS DECIMAl IN $44,$45
	STA team_points_for_BCD                                      ;
	LDA hex_to_BCD_result+1                                      ;
	STA team_points_for_BCD+1                                    ;
	LDA #PPU_OFFSET_TO_POINTS_FOR                                ; 
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES                          ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= PPU ADDR, $44,45= NUMBER)


@draw_team_points_against:	
	LDY #POINTS_ALLOWED_SEASON_STATS_OFFSET                      ; LOAD TEAM POINTS ALLOWED
	LDA (season_stats_addr),Y                                    ;
	STA team_points_against                                      ;
	INY                                                          ;
	LDA (season_stats_addr),Y                                    ;
	STA team_points_against+1                                    ;
	JSR HEX_TO_3_DIGIT_DEC                                       ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)
	LDA hex_to_BCD_result                                        ;
	STA team_points_against_BCD                                   ;
	LDA hex_to_BCD_result+1                                      
	STA team_points_against_BCD +1                               ;
	LDA #PPU_OFFSET_TO_POINTS_AGAINST                            ; SET PPU OFFSET TO TEAM POINTS
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES                          ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= PPU ADDR, $44,45= NUMBER)
	

@draw_team_win_pct:	
	LDY #WINS_SEASON_STATS_OFFSET                                ; LOAD TEAM WINS
	LDA (season_stats_addr),Y                                    ;
	LDY #$E8                                                     ; LOAD 1000
	LDX #$03                                                     ;
	JSR MULTIPLY_A_TIMES_X_Y                                     ; (A * X,Y)  RESULT IN in $43 $44 $45 = WINS * 1000
	LDY #WINS_SEASON_STATS_OFFSET                                 ;
	LDA (season_stats_addr),Y                                    ;
	LDY #LOSSES_SEASON_STATS_OFFSET                              ; LOAD TEAM LOSSES
	CLC                                                          ;
	ADC (season_stats_addr),Y                                    ;
	STA wins_plus_losses                                          ;
	LDA #$00                                                     ;
	ADC #$00                                                     ;
	STA wins_plus_losses+1                                       ;
	JSR DIVIDE_32_BIT_BY_16_BIT                                  ; DIVIDE () =  (WINS *1000)/(WINS+LOSSES)= CALCULATE WIN %
	LDA divide_result+1                                          ;
	STA win_pct_hex +1                                           ; SAVE WIN %
	LDA divide_result                                            ;
	STA win_pct_hex                                              ;
	JSR HEX_TO_3_DIGIT_DEC                                       ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT) 
	LDA #PPU_OFFSET_TO_TEAM_WIN_PCT                              ; SET PPU OFFSET TO TEAM WIN%
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA #$05                                                     ; SET LENGTH = 5 TILES
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                        ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	CLC                                                          ; 
	LDA win_pct_BCD+1                                            ; LOAD FIRST NUMBER OF WIN %
	JSR CONVERT_UPPER_DIGIT_TO_TILE                              ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(X,Y=PPU ADDR, A= NUM)
	LDA #PERIOD_TILE_ID                                          ; SAVE DECIMAL POINT TILE ID IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                  ;
	INX                                                          ; BUFFER INDEX++
	SEC                                                          ;
	LDA win_pct_BCD+1                                            ; LOAD FIRST NUMBER OF WIN %
	JSR CONVERT_LOWER_DIGIT_TO_TILE                              ; CONVERT LO DIGIT TO TILE AND SAVE IN BUFFER(X,Y=PPU ADDR, A= NUM)
	LDA win_pct_BCD                                              ; LOAD SECOND NUMBER OF WIN %
	JSR CONVERT_UPPER_DIGIT_TO_TILE                              ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(X,Y=PPU ADDR, A= NUM)
	LDA win_pct_BCD                                              ; LOAD SECOND NUMBER OF WIN %
	JSR CONVERT_LOWER_DIGIT_TO_TILE                              ; CONVERT LO DIGIT TO TILE AND SAVE IN BUFFER(X,Y=PPU ADDR, A= NUM)
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                    ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	
	
	LDA current_team_id                                                      ; LOAD TEAM ID 
	AND #$7F                                                     ;
	
	LDX #$00                                                     ; SET INDEX = AFC EAST DIVISION WINNER
	
_WHILE CC                                                        ; CHECK FOR DIVISION WINNERS AND WILD CARD TEAMS FOR SPECIAL INDICATOR TILES

	CMP PLAYOFF_TEAMS[],X                                        ; IS TEAM DIVISION WINNER OR WILD CARD TEAM?
	BEQ @team_is_wild_card_or_division_winner                    ; YES->
	INX
	CPX #NUM_OF_PLAYOFF_TEAMS                                    ; ALL DIVISION WINNERS AND WILD CARD TEAMS CHECKED? 
	
_END_WHILE                                                       ; NO-> CHECK FOR DIVISION WINNERS AND WILD CARD TEAMS FOR SPECIAL INDICATOR TILES
	RTS                                                          ; RETURN

@team_is_wild_card_or_division_winner:                           ; SET WILD CARD OR DIVISION WINNER TILE
	LDA #DIVISION_WINNER_TILE_ID	                             ; LOAD DIVISION WINNER STAR TILE ID
	CPX #NUMBER_OF_DIVISON_WINNERS                               ; IS INDEX = DIVISION WINNER
	BCC @add_special_tile_to_buffer                              ; YES->
	
@set_tile_to_wild_Card	
	LDA #WILD_CARD_TEAM_TILE_ID                                  ; LOAD WILD CARD TEAM CIRCLE TILE
	
@add_special_tile_to_buffer:                                     ; SAVE AND ADD TILE TO BUFFER
	STA playoff_team_tile_id                                     ; SAVE TILE
	LDA #$00                                                     ; 
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA #$01                                                     ;
	STA num_rows                                                 ; SET NUM ROWS = 1
	STA num_tiles_per_row                                        ; SET LENGTH = 1 
	LDA playoff_team_tile_id                                     ; LOAD TILE
	JMP FILL_SCREEN_TILE_AREA                                    ; FILL PPU LOCATIONS WITH TILE (X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, A = TILE)

@no_games_played_draw_dashes:                                    ; NO GAMES PLAYED DRAW DASHES
	LDA #PPU_OFFSET_TO_NO_GAMES_DASH                                                     ; SET PPU OFFSET = FIRST DASH 
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA #<DIVISON_STANDING_DASHES_DATA                           ; LOAD DIVISION STANDINGS DASHES IF NO GAMES PLAYED DATA ADDR
	STA ppu_data_addr                                            ;
	LDA #>DIVISON_STANDING_DASHES_DATA                           ;
	STA ppu_data_addr+1                                          ;
	JMP TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS                 ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(3E,3F = DATA PTR)

DIVISON_STANDING_DASHES_DATA                                     ; DIVISION STANDINGS DASHES IF NO GAMES PLAYED

	.BYTE $14                                                    ; LENGTH OF ARRAY
	
	.BYTE DASH_TILE_ID                                           ; DASH TILE ID
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	
	.BYTE DASH_TILE_ID                                           ; DASH TILE ID
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	
	.BYTE DASH_TILE_ID                                            ; DASH TILE ID
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	
	.BYTE DASH_TILE_ID                                           ; DASH TILE ID
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE 
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	
	.BYTE DASH_TILE_ID                                           ; DASH TILE ID
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE SPACE_TILE_ID                                          ; BLANK TILE
	.BYTE DASH_TILE_ID                                           ; DASH TILE ID
	
	.BYTE $FF                                                    ; END OF DATA

ADD_VALUE_TO_TEMP_PPU_ADDR[value]:                               ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	CLC                                                          ; = CURRENT PPU ADDR + VALUE
	ADC ppu_addr                                                 ;
	TAY                                                          ; SAVE LOW BYTE IN Y
	LDA ppu_addr+1                                               ;
	ADC #$00                                                     ;
	TAX                                                          ; SAVE HIGH BYTE IN X
	RTS                                                          ; RETURN

_F}_DRAW_DATA_AND_MINI_HELMETS_DIVISION_STANDINGS  

_F{_COMPARE_TEAM_PT_DIFFERENTIAL 											; DONE

temp_sram_addr 			= LOCAL_1
team_sram_addr_team_1	= LOCAL_3
team_sram_addr_team_2 	= LOCAL_1

pt_diff_team2 			= LOCAL_5
pt_diff_team1 			= LOCAL_7

team_info[]				= SEGMENT_VAR_96

COMPARE_TEAM_PT_DIFFERENTIAL:                                    ; COMPARE TEAM POINT DIFFERENTIAL()
	LDA team_info[]+1,X                                          ; LOAD TEAM 1 TEAM ID
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDA temp_sram_addr                                           ; SAVE TEAM 1 SRAM LOCATION IN $40,$41
	STA team_sram_addr_team_1                                    ;
	LDA temp_sram_addr+1                                         ;
	STA team_sram_addr_team_1 +1                                 ;
	LDA team_info[]+3,X                                          ; LOAD TEAM 2 TEAM ID
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	

@team_one_pts_for_minus_allowed	
	LDY #POINTS_FOR_SEASON_STATS_OFFSET                          ; = TEAM 1 POINTS FOR – TEAM 1 POINTS ALLOWED 
	LDA (team_sram_addr_team_1),Y                                ; SAVE IN $44,$45
	LDY #POINTS_ALLOWED_SEASON_STATS_OFFSET                      ; 
	SEC                                                          ;
	SBC (team_sram_addr_team_1),Y                                ;
	STA pt_diff_team1                                            ;
	LDY #POINTS_FOR_SEASON_STATS_OFFSET + 1                      ;
	LDA (team_sram_addr_team_1),Y                                ;
	LDY #POINTS_ALLOWED_SEASON_STATS_OFFSET + 1                  ;
	SBC (team_sram_addr_team_1),Y                                ;
	STA pt_diff_team1+1                                          ;
	LDA pt_diff_team1                                            ; 
	CLC                                                          ;
	ADC #$00                                                     ;
	STA pt_diff_team1                                            ;
	LDA pt_diff_team1+1                                          ;
	ADC #$80                                                     ;
	STA pt_diff_team1+1                                          ; 
	
@team_two_pts_for_minus_allowed		
	LDY #POINTS_FOR_SEASON_STATS_OFFSET                          ; = TEAM 2 POINTS FOR – TEAM 2 POINTS ALLOWED
	LDA (team_sram_addr_team_2),Y                                ; SAVE IN $42,$43
	LDY #POINTS_ALLOWED_SEASON_STATS_OFFSET                      ;
	SEC                                                          ;
	SBC (team_sram_addr_team_2),Y                                ;
	STA pt_diff_team2                                            ;
	LDY #POINTS_FOR_SEASON_STATS_OFFSET+1                        ;
	LDA (team_sram_addr_team_2),Y                                ;
	LDY #POINTS_ALLOWED_SEASON_STATS_OFFSET + 1                  ;
	SBC (team_sram_addr_team_2),Y                                ;
	STA pt_diff_team2+1                                          ;
	LDA pt_diff_team2                                            ;
	CLC                                                          ;
	ADC #$00                                                     ;
	STA pt_diff_team2                                            ;
	LDA pt_diff_team2+1                                          ;
	ADC #$80                                                     ;
	STA pt_diff_team2+1											 ;
	
@team1_minus_team2 	
	LDA pt_diff_team1                                            ;
	SEC                                                          ;
	SBC pt_diff_team2                                            ;
	STA pt_diff_team1                                            ;
	LDA pt_diff_team1+1                                          ;
	SBC pt_diff_team2+1                                          ;
	STA pt_diff_team1+1                                          ;
	ORA pt_diff_team1                                            ; 
	RTS                                                          ; RETURN
	
_F}_COMPARE_TEAM_PT_DIFFERENTIAL

_F{_SWAP_TEAM_ORDER_WILD_CARD_RANKINGS										; DONE

team_info[]		= SEGMENT_VAR_96
	
SWAP_ADJANCENT_TEAMS_ORDER:                                        ; SWAP ORDER OF ADJACENT TEAMS (X= INDEX TO HIGHER ORDERED TEAM)
	LDA team_info[],X                                                    ; SWAP TEAM WIN % 
	LDY team_info[]+2,X                                                    ;
	STA team_info[]+2,X                                                    ;
	TYA                                                          ;
	STA team_info[],X                                                    ; SWAP TEAM ID’S
	LDA team_info[]+1,X                                                    ;
	LDY team_info[]+3,X                                                    ;
	STA team_info[]+3,X                                                    ;  
	TYA                                                          ;
	STA team_info[]+1,X                                                    ;
	RTS                                                          ; RETURN

_F}_SWAP_TEAM_ORDER_WILD_CARD_RANKINGS 

_F{_MINI_HELMETS_SPR_Y_LOC_DATA_STANDINGS						 			; DONE	
	
MINI_HELMETS_Y_LOCATIONS_DIV_STANDINGS:                          ; Y LOC FOR MINI HELMETS FOR DIVISION STANDINGS TABLE
	.BYTE $40                                                    ; TEAM 1 MINI HELMET
	.BYTE $60                                                    ; ..
	.BYTE $80                                                    ; ..
	.BYTE $A0                                                    ; ..
	.BYTE $C0                                                    ; TEAM 5 MINI HELEMT

_F}_MINI_HELMETS_SPR_Y_LOC_DATA_STANDINGS
	
_F{_TEAM_STANDINGS_RANKING_NUMBER_PPU_ADDR						 			; DONE	
	
TEAM_STANDINGS_RANK_NUMBER_PPU_ADDR_TABLE:                                                       ; TEAM STANDINGS NUMBER PPU ADDR
	.WORD $2102                                                  ; TEAM 1 STANDINGS NUMBER
	.WORD $2182                                                  ; ..
	.WORD $2202                                                  ; ..
	.WORD $2282                                                  ; ..
	.WORD $2302                                                  ; TEAM 5

_F}_TEAM_STANDINGS_RANKING_NUMBER_PPU_ADDR 
	
_F{_GET_SEEDING_FOR_PLAYOFFS									 			; DONE	

team_info[]						= SEGMENT_VAR_96


afc_east_champ_win_pct			= team_info[]	
afc_east_champ_team_id			= team_info[] + 1
afc_cent_champ_win_pct			= team_info[] + 2
afc_cent_champ_team_id			= team_info[] + 3
afc_west_champ_win_pct			= team_info[] + 4
afc_west_champ_team_id			= team_info[] + 5

nfc_east_champ_win_pct			= team_info[]  
nfc_east_champ_team_id			= team_info[] + 1
nfc_cent_champ_win_pct			= team_info[] + 2
nfc_cent_champ_team_id			= team_info[] + 3
nfc_west_champ_win_pct			= team_info[] + 4
nfc_west_champ_team_id			= team_info[] + 5



afc_one_seed_win_pct			= team_info[]
afc_one_seed_team_id			= team_info[] + 1
afc_two_seed_win_pct			= team_info[] + 2
afc_two_seed_team_id			= team_info[] + 3
afc_three_seed_win_pct			= team_info[] + 4
afc_three_seed_team_id			= team_info[] + 5

nfc_one_seed_win_pct			= team_info[] 
nfc_one_seed_team_id			= team_info[] + 1
nfc_two_seed_win_pct			= team_info[] + 2
nfc_two_seed_team_id			= team_info[] + 3
nfc_three_seed_win_pct			= team_info[] + 4
nfc_three_seed_team_id			= team_info[] + 5



afc_four_seed_win_pct			= team_info[]
afc_four_seed_team_id			= team_info[] + 1
afc_five_seed_win_pct			= team_info[] + 2
afc_five_seed_team_id			= team_info[] + 3
afc_six_seed_win_pct			= team_info[] + 4
afc_six_seed_team_id			= team_info[] + 5

nfc_four_seed_win_pct			= team_info[] 
nfc_four_seed_team_id			= team_info[] + 1
nfc_five_seed_win_pct			= team_info[] + 2
nfc_five_seed_team_id			= team_info[] + 3
nfc_six_seed_win_pct			= team_info[] + 4
nfc_six_seed_team_id			= team_info[] + 5


	
SORT_DIVISIONS_SET_SEEDINGS_FOR_PLAYOFFS:                        ; SORT PLAYOFF TEAMS()
	LDA #AFCE_DIVISION_ID                                        ; SET DIVISION = AFC EAST
	JSR CHECK_FOR_DIVISION_CHAMP                                 ; CHECK FOR DRAW DIVISION CHAMPION(A = DIVISION INDEX)
	LDA #AFCC_DIVISION_ID                                        ; SET DIVISION = AFC CENTRAL
	JSR CHECK_FOR_DIVISION_CHAMP                                 ; CHECK FOR DRAW DIVISION CHAMPION(A = DIVISION INDEX)
	LDA #AFCW_DIVISION_ID                                        ; SET DIVISION = AFC WEST
	JSR CHECK_FOR_DIVISION_CHAMP                                 ; CHECK FOR DRAW DIVISION CHAMPION(A = DIVISION INDEX)
	LDA #NFCE_DIVISION_ID                                        ; SET DIVISION = NFC EAST
	JSR CHECK_FOR_DIVISION_CHAMP                                 ; CHECK FOR DRAW DIVISION CHAMPION(A = DIVISION INDEX)
	LDA #NFCC_DIVISION_ID                                        ; SET DIVISION = NFC CENTRAL 
	JSR CHECK_FOR_DIVISION_CHAMP                                 ; CHECK FOR DRAW DIVISION CHAMPION(A = DIVISION INDEX)
	LDA #NFCW_DIVISION_ID                                        ; SET DIVISION = NFC WEST 
	JSR CHECK_FOR_DIVISION_CHAMP                                 ; CHECK FOR DRAW DIVISION CHAMPION(A = DIVISION INDEX)
	MMC3_SRAM_WRITE_ENABLE

																 ; GET AFC DIVISION WINNER TEAM ID’S AND WIN %
	LDA AFCE_DIVISION_CHAMP                                      ; LOAD AFC EAST DIVISION CHAMP
	STA afc_east_champ_team_id                                    ; SAVE IN TEMP PLAYOFF TEAMS AND WIN%
	JSR CALC_WIN_PCT_FOR_TEAM                                    ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	STA afc_east_champ_win_pct                                    ; SAVE AFC EAST DIVISION CHAMP WIN % IN TEMP PLAYOFF TEAMS AND WIN%
	
	LDA AFCC_DIVISION_CHAMP                                      ; LOAD AFC CENTRAL DIVISION CHAMP
	STA afc_cent_champ_team_id                                   ; SAVE IN TEMP PLAYOFF TEAMS AND WIN%
	JSR CALC_WIN_PCT_FOR_TEAM                                    ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	STA afc_cent_champ_win_pct                                   ; SAVE AFC CENTRAL DIVISION CHAMP WIN % IN TEMP PLAYOFF TEAMS AND WIN%
	
	LDA AFCW_DIVISION_CHAMP                                      ; LOAD AFC WEST DIVISION CHAMP
	STA afc_west_champ_team_id                                   ; SAVE IN TEMP PLAYOFF TEAMS AND WIN%
	JSR CALC_WIN_PCT_FOR_TEAM                                    ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	STA afc_west_champ_win_pct                                   ; SAVE AFC WEST DIVISION CHAMP WIN % IN TEMP PLAYOFF TEAMS AND WIN%
																 ; SORT AFC DIVISION WINNERS
																 
	LDX #NUMBER_OF_DIVISION_CHAMPS                               ; SET NUMBER OF TEAMS = 3
	JSR SORT_TEAMS_BY_WIN_PCT                                    ; SORT TEAMS(X= NUMBER OF TEAMS TO SORT)
	LDA afc_one_seed_team_id                                     ; SAVE AFC #1 SEED TEAM ID IN PLAYOFF MATCHUPS
	STA AFC_DIVISIONAL_ONE_HOME_TEAM_ID                          ;
	LDA afc_two_seed_team_id                                     ; SAVE AFC #2 SEED TEAM ID IN PLAYOFF MATCHUPS 
	STA AFC_DIVISIONAL_TWO_HOME_TEAM_ID                          ;
	LDA afc_three_seed_team_id                                   ; SAVE AFC #3 SEED TEAM ID IN PLAYOFF MATCHUPS
	STA AFC_WILD_CARD_ONE_HOME_TEAM_ID                                                    ; 

	LDA NFCE_DIVISION_CHAMP                                        ; LOAD NFC EAST DIVISION CHAMP
	STA nfc_east_champ_team_id                                    ; SAVE IN TEMP PLAYOFF TEAMS AND WIN%
	JSR CALC_WIN_PCT_FOR_TEAM                                    ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	STA nfc_east_champ_win_pct                                   ; SAVE NFC EAST DIVISION CHAMP WIN % IN SAVE IN TEMP PLAYOFF TEAMS AND WIN%
	
	LDA NFCC_DIVISION_CHAMP                                      ; LOAD NFC CENTRAL DIVISION CHAMP
	STA nfc_cent_champ_team_id                                    ; SAVE IN TEMP PLAYOFF TEAMS AND WIN%
	JSR CALC_WIN_PCT_FOR_TEAM                                    ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	STA nfc_cent_champ_win_pct                                   ; SAVE NFC CENTRAL DIVISION CHAMP WIN % IN TEMP PLAYOFF TEAMS AND WIN%
	
	LDA NFCW_DIVISION_CHAMP                                      ;
	STA nfc_west_champ_team_id                                   ;
	JSR CALC_WIN_PCT_FOR_TEAM                                    ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	STA nfc_west_champ_win_pct                                  ;
	
	
	LDX #NUMBER_OF_DIVISION_CHAMPS                               ; SET NUMBER OF TEAMS TO SORT = 3
	JSR SORT_TEAMS_BY_WIN_PCT                                    ; SORT TEAMS(X= NUMBER OF TEAMS TO SORT)
	LDA nfc_one_seed_team_id                                     ; SAVE NFC #1 SEED TEAM ID IN PLAYOFF MATCHUPS
	STA NFC_DIVISIONAL_ONE_HOME_TEAM_ID                          ;
	LDA nfc_two_seed_team_id                                     ; SAVE NFC #2 SEED TEAM ID IN PLAYOFF MATCHUPS
	STA NFC_DIVISIONAL_TWO_HOME_TEAM_ID                          ;
	LDA nfc_three_seed_team_id                                   ; SAVE NFC #3 SEED TEAM ID IN PLAYOFF MATCHUPS
	STA NFC_WILD_CARD_ONE_HOME_TEAM_ID                           ;

	LDA #FIRST_TEAM_IN_AFC                                       ; SET FIRST TEAM IN CONFERENCE = AFC FIRST TEAM
	JSR SORT_TEAMS_FOR_WILD_CARD                                 ; SORT TEAMS FOR WILDCARD(A= FIRST TEAM IN CONFERNCE)
	
	LDA afc_four_seed_team_id                                    ; 
	STA AFC_WILD_CARD_TWO_HOME_TEAM_ID                           ; SET AFC WC 1 HOME TEAM  = FIRST WILDCARD TEAM ID
	STA AFC_WILD_CARD_ONE_TEAM_ID                                ;
	
	LDA afc_five_seed_team_id                                    ; 
	STA AFC_WILD_CARD_TWO_AWAY_TEAM_ID                           ; SET AFC WC 1 AWAY TEAM  = SECOND WILDCARD TEAM ID
	STA AFC_WILD_CARD_TWO_TEAM_ID                                ; 
	
	LDA afc_six_seed_team_id                                     ;
	STA AFC_WILD_CARD_ONE_AWAY_TEAM_ID                           ; SET AFC WC 3 AWAY TEAM  = THIRD WILDCARD TEAM ID
	STA AFC_WILD_CARD_THREE_TEAM_ID                              ; SET NFC WC 3 TEAM  = THIRD WILDCARD TEAM ID

	LDA #FIRST_TEAM_IN_NFC                                       ; SET FIRST TEAM IN CONFERENCE = NFC FIRST TEAM
	JSR SORT_TEAMS_FOR_WILD_CARD                                 ; SORT TEAMS FOR WILDCARD(A= FIRST TEAM IN CONFERNCE)
	
	LDA nfc_four_seed_team_id                                    ;
	STA NFC_WILD_CARD_TWO_HOME_TEAM_ID                           ; SET NFC WC 1 HOME TEAM  = FIRST WILDCARD TEAM ID
	STA NFC_WILD_CARD_ONE_TEAM_ID                                ; 
	
	LDA nfc_five_seed_team_id                                    ; SET NFC WC 1 AWAY TEAM  = SECOND WILDCARD TEAM ID
	STA NFC_WILD_CARD_TWO_AWAY_TEAM_ID                           ; 
	STA NFC_WILD_CARD_TWO_TEAM_ID                                ; 
	
	LDA nfc_six_seed_team_id                                     ;
	STA NFC_WILD_CARD_ONE_AWAY_TEAM_ID                            ; SET NFC WC 2 AWAY TEAM  = THIRD WILDCARD TEAM ID
	STA NFC_WILD_CARD_THREE_TEAM_ID                              ;
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN

_F}_GET_SEEDING_FOR_PLAYOFFS 

_F{_CHECK_DIVISION_FOR_CHAMPION_CUTSCENE						 			 ; DONE

num_teams_in_division	= SEGMENT_VAR_90
division_index			= SEGMENT_VAR_92
team_info[]				= SEGMENT_VAR_96

division_winner_team_id	 = team_info[]	+ 1
	
CHECK_FOR_DIVISION_CHAMP:                                        ; CHECK FOR DRAW DIVISION CHAMPION(A = DIVISION INDEX)
	TAY                                                          ; LOAD DIVISION INDEX
	LDX DIVISION_WINNERS[],Y                                     ; LOAD DIVISION WINNER
	BPL @exit                                                     ; winner already drawn 

@check_for_winner	
	STY division_index                                            ; SAVE DIVISION INDEX
	ASL                                                          ; SHIFT FOR ENTRY INTO TABLE
	TAY                                                          ;
	LDA DIVISIONS_INFO_TABLE,Y                                         ; LOAD FIRST TEAM IN DIVISION
	LDX DIVISIONS_INFO_TABLE+1,Y                                       ; LOAD NUMBER OF TEAMS IN DIVISION
	STX num_teams_in_division                                    ; SAVE NUMBER OF TEAMS IN DIVISION
	JSR LOAD_DIVISION_TEAMS_WIN_PCT_ARRAY                        ; SAVE DIVISION TEAMS IN ARRAY()
	LDX num_teams_in_division                                    ; LOAD NUMBER OF TEAMS IN DIVISION
	JSR SORT_TEAMS_BY_WIN_PCT                                    ; SORT TEAMS(X= NUMBER OF TEAMS TO SORT)
	MMC3_SRAM_WRITE_ENABLE
	LDX division_index                                           ; LOAD DIVISION INDEX
	LDA division_winner_team_id                                   ; SAVE DIVISION WINNER IN SRAM DIVISION WINNERS
	STA DIVISION_WINNERS[],X                                     ;
	STA CURRENT_TEAM                                             ; SET CURRENT TEAM = DIVISION WINNER
	JSR GET_SAVE_CHECKSUM                                        ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	LDA #DIVISION_CHAMP_SCENE_ID                                 ; LOAD DIVISION CHAMP BACKGROUND ID
	LDX #CUTSCENE_DRAW_SCRIPT_BANK                               ; LOAD BANK 7
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAWING INDEX, X = BANK)
	JMP FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0                      ; FADE OUT PAL, CLEAR IRQ0 XSCROLL,COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES()
@exit:                                                           ; NO WINNER EXIT
	RTS                                                          ; RETURN
	
_F}_CHECK_DIVISION_FOR_CHAMPION_CUTSCENE

_F{_GET_WILD_CARD_TEAMS														 ; DONE	

		
OFFSET_TO_FIRST_DIVSION_CHAMP		= NFCW_DIVISION_CHAMP - AFCE_DIVISION_CHAMP + 1

current_team_id							= SEGMENT_VAR_8E		
num_teams_left_to_check	 				= SEGMENT_VAR_8F
team_info_index							= SEGMENT_VAR_91

team_info[]								= SEGMENT_VAR_96		
	
SORT_TEAMS_FOR_WILD_CARD:                                        ; SORT TEAMS FOR WILDCARD(A= FIRST TEAM IN CONFERNCE)
	STA current_team_id                                          ; SAVE FIRST CONFERENCE OFFSET
	LDA #NUMBER_OF_TEAMS_IN_EACH_CONFERENCE                      ; SET NUMBER OF TEAMS TO CHECK = 14
	STA num_teams_left_to_check                                  ; 
	LDA #$00                                                     ; SET TEAM INDEX = FIRST TEAM IN CONFERENCE 
	STA team_info_index	                                         ;
	
_WHILE NOT_EQUAL                                                 ; SORT CONFERENCE TEAMS LOOP

	LDA current_team_id                                          ; LOAD CURRENT TEAM IN CONFERENCE
	LDX #OFFSET_TO_FIRST_DIVSION_CHAMP                           ; LOAD OFFSET TO FIRST DIVISION WINNER
@check_winner_loop:                                              ; CHECK FOR DIVISION WINNERS LOOP
	CMP DIVISION_WINNERS[]-1,X                                   ; IS TEAM IN CONFERENCE = DIVISION WINNER
	BEQ @go_to_next_team                                         ; YES->GO TO NEXT TEAM

@set_to_next_division_winner	
	DEX                                                          ; DIVISION WINNER INDEX--
	BNE @check_winner_loop                                       ; TEAM CHECKED VS ALL DIVISION WINNERS? NO->CHECK FOR DIVISION WINNERS LOOP
	
	JSR CALC_WIN_PCT_FOR_TEAM                                    ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	
@save_win_pct:	
	LDX team_info_index                                          ; SAVE NON DIVISION WINNER TEAM WIN % 
	STA team_info[],X                                            

@save_team_id:	
	LDA current_team_id                                          ; SAVE NON DIVISION WINNER TEAM ID
	STA team_info[]+1,X                                          ;

@set_to_team_info_index_to_next_slot:	
	INC team_info_index                                          ; CURRENT TEAM INDEX +=  OFFSET TO NEXT TEAM
	INC team_info_index                                          ;
	
@go_to_next_team:                                                ; GO TO NEXT TEAM 
	INC current_team_id                                          ; CURRENT TEAM IN CONFERENCE++
	DEC num_teams_left_to_check                                  ; NUMBER OF TEAMS TO CHECK--
	
_END_WHILE                                                       ; DONE? NO->
	
	LDX #NUMBER_OF_TEAMS_TO_SORT_FOR_WILD_CARD                   ; SET NUMBER OF TEAMS TO SORT = 11 

current_team_addr	= LOCAL_1
next_team_addr		= LOCAL_3
pt_diff				= LOCAL_7

	
SORT_TEAMS_BY_WIN_PCT:                                           ; SORT TEAMS(X= # OF TEAMS TO SORT)
	DEX                                                          ;
	STX num_teams_left_to_check                                  ; SET  TEAM INDEX = NUM TEAMS IN CONFERENCE -1
	
_WHILE NOT_EQUAL                                                          ; SET TEAM TO FIRST TEAM IN SORT
	LDA num_teams_left_to_check                                  ; TOTAL NUMBER OF TEAMS TO CHECK = NUM TEAMS IN CONFERENCE -1
	STA current_team_id                                          ; NUMBER OF TEAMS TO CHECK VS CURRENT TEAM CHECK = NUM TEAMS IN CONFERENCE -1
	
	LDX #$00                                                     ; SET DIVISION TEAM INDEX = FIRST TEAM IN DIVISION
@check_vs_all_teams_in_conference_loop:                          ; CHECK CURRENT TEAM VS NEXT TEAM
	LDA team_info[],X                                            ; IS  CURRENT TEAM WIN % < NEXT TEAM WIN %
	CMP team_info[]+2,X                                          ;
	BCC @swap_order                                              ; YES->SWAP ORDER OF ADAJECENT TEAMS
	
	BNE @go_to_next_team                                         ; IS CURRENT TEAM WIN % =  NEXT TEAM WIN % NO->

@team_win_pct_is_same	
	JSR COMPARE_TEAM_PT_DIFFERENTIAL                             ; COMPARE TEAM POINT DIFFERENTIAL()
	BNE @check_value_greater                                     ; NOT EQUAL-> CHECK FOR VALUE GREATER OR LESS
	
@check_who_has_more_pts_scored:	
	LDY #POINTS_FOR_SEASON_STATS_OFFSET                          ; 
	LDA (next_team_addr),Y                                       ; IS CURRENT TEAM TOTAL POINTS = NEXT TEAM POINTS?
	CMP (current_team_addr),Y                                    ;
	STA pt_diff                                                  ;
	INY                                                          ;
	LDA (next_team_addr),Y                                       ;
	SBC (current_team_addr),Y                                    ;
	ORA pt_diff                                                  ;
	BNE @check_value_greater                                     ; NO-> CHECK FOR VALUE GREATER OR LESS
	
@flip_a_coin_for_winner:	
	LDA RANDOM_3                                                 ; DO 50% RANDOM NUMBER CHECK
	AND #$04                                                     ;
	BEQ @go_to_next_team                                         ; 50%->GO TO NEXT TEAM EXIT IF DONE
	JMP @swap_order                                              ; 50%-> SWAP ORDER OF ADAJECENT TEAMS

@check_value_greater:                                            ; CHECK FOR VALUE GREATER
	BCS @go_to_next_team                                         ; VALUE GREATER? YES-> GO TO NEXT TEAM EXIT IF DONE

@swap_order:                                                     ; SWAP ORDER OF ADAJECENT TEAMS
	JSR SWAP_ADJANCENT_TEAMS_ORDER                               ; SWAP ORDER OF ADJACENT TEAMS (X= INDEX TO HIGHER ORDERED TEAM)

@go_to_next_team:                                               ; GO TO NEXT TEAM EXIT IF DONE
	INX                                                          ; DIVISION TEAM INDEX += OFFSET TO NEXT TEAM
	INX                                                          ; DONE? NO->CHECK CURRENT TEAM VS NEXT TEAM
	DEC current_team_id	                                         ; NUMBER OF TEAMS TO CHECK VS CURRENT TEAM --
	BNE @check_vs_all_teams_in_conference_loop                   ;
	DEC num_teams_left_to_check                                  ; TOTAL NUMBER OF TEAMS TO CHECK--
	
_END_WHILE                                                       ; DONE? NO->SET TEAM TO FIRST TEAM IN SORT

	RTS                                                          ; RETURN

_F}_GET_WILD_CARD_TEAMS 

_F{_DRAW_PLAYOFF_BRACKET													 ; DONE

scroll_bracket_right_speed			= $04
scroll_bracket_left_speed			= $FC

DRAW_PLAYOFF_BRACKET_RETURN_B_PRESS:                             ; DRAW PLAYOFF BRACKETT
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	LDA CURRENT_WEEK_IN_SEASON                                   ; IS WEEK IN SEASON = PLAYOFFS
	CMP #FIRST_WEEK_OF_PLAYOFFS	                                 ;
	BCS @draw_playoff_bracket_with_teams                         ;

@draw_generic_bracket:
	LDA #PLAYOFF_BRACKET_SEASON_NOT_OVER_SCREEN_ID               ; LOAD BLANK PLAYOFF BRACKET SCREEN ID 
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDA #PLAYOFF_BRACKET_BG_PAL_INDEX                            ; SET BG PAL
	LDX #PLAYOFF_BRACKET_SPR_PAL_INDEX                           ; SET SPR PAL
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	JMP SCROLL_BRACKET_RIGHT_CHECK

@draw_playoff_bracket_with_teams:                                ; DRAW PLAYOFF BRACKET FILLED WITH HELMETS AND TEAMS
	LDA #PLAYOFF_BRACKET_TEAM_NAMES_SCREEN_ID                    ; LOAD TEAM FILLED PLAYOFF BRACKET SCREEN ID
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	JSR DRAW_ONE_SIDE_OF_PLAYOFF_BRACKET                         ; DRAW PLAY OFF BRACKET SINGLE SCREEN()

SCROLL_BRACKET_RIGHT_CHECK:										; CHECK FOR MOVE PLAYOFF BRACKET RIGHT/EXIT LOOP                          
	RETURN_1_FRAME  
	IF_EITHER_JOY_PRESSED_B[ADDR] DRAW_BRACKET_EXIT
	IF_NEITHER_JOY_HELD_RIGHT[ADDR] SCROLL_BRACKET_RIGHT_CHECK
	
@else_scroll_bracket_right:	
	LDA #scroll_bracket_right_speed                                                     ; SET SCROLL DIRECTION AND SPEED = RIGHT 
	JSR SCROLL_PLAYOFF_BRACKET                                   ; MOVE PLAYOFF BRACKET(A= DIRECTION + SCROLL SPEED)


SCROLL_BRACKET_LEFT_CHECK:                                   ; CHECK FOR MOVE PLAYOFF BRACKET LEFT/EXIT LOOP
	RETURN_1_FRAME
	IF_EITHER_JOY_PRESSED_B[ADDR] DRAW_BRACKET_EXIT
	IF_NEITHER_JOY_HELD_LEFT[ADDR] SCROLL_BRACKET_LEFT_CHECK
	
@scroll_bracket_left:		
	LDA #scroll_bracket_left_speed                               ; SET SCROLL DIRECTION AND SPEED = LEFT   
	JSR SCROLL_PLAYOFF_BRACKET                                   ; MOVE PLAYOFF BRACKET(A= DIRECTION + SCROLL SPEED)
	JMP SCROLL_BRACKET_RIGHT_CHECK                          ; JUMP->CHECK FOR MOVE PLAYOFF BRACKET RIGHT/EXIT LOOP
	
DRAW_BRACKET_EXIT:                                               ; B PRESSED EXIT
	RTS                                                          ; RETURN

_F}_DRAW_PLAYOFF_BRACKET 

_F{_SCROLL_PLAYOFF_BRACKET 										 			; DONE	

FRAMES_TO_SCROLL_BRACKET 	 		= $40
SPRITE_INDEX_FOR_NFC_HELMET_TILES	= $10

scroll_direction_speed				 = SEGMENT_VAR_8F

current_scroll_offset			    = SEGMENT_VAR_92
scroll_frames_remaining		 		= SEGMENT_VAR_94


SCROLL_PLAYOFF_BRACKET:                                          ; MOVE PLAYOFF BRACKET(A= DIRECTION + SCROLL SPEED)
	LDX #FRAMES_TO_SCROLL_BRACKET                                ; SET # FRAMES TO SCROLL BRACKET

SCROLL_PLAYOFF_BRACKET_NUM_FRAMES:                               ; MOVE PLAYOFF BRACKET(A= DIRECTION + SCROLL SPEED, X= # FRAMES)
	STX scroll_frames_remaining                                  ; SAVE # FRAMES TO SCROLL BRACKET
	STA scroll_direction_speed                                    ; SAVE BRACKET SCROLL DISTANCE/FRAME

_WHILE NOT_EQUAL												 ; UPDATE SCROLL LOCATION LOOP
                                                       
	RETURN_1_FRAME  
	LDA scroll_direction_speed                                   ; LOAD SCROLL SPEED
	CLC                                                          ;
	ADC IRQ_0_XSCROLL                                            ; IRQ SCROLL X = IRQ SCROLL X + SCROLL AMOUNT
	STA IRQ_0_XSCROLL                                            ;
	LDA scroll_direction_speed                                   ;
	AND #$80                                                     ;
	BPL @update_ppu_loc                                          ;

@set_scrolling_left:	
	LDA #$FF                                                     ;
	
@update_ppu_loc:                                                 ;
	ADC IRQ_0_NAMETABLE	                                         ;
	AND #$01                                                     ;
	STA IRQ_0_NAMETABLE	                                         ;
	LDA scroll_direction_speed                                   ; = PPU LOCATION + BRACKET SCROLL DISTANCE/FRAME
	EOR #$FF                                                     ;
	CLC                                                          ;
	ADC #$01                                                     ;
	TAX                                                          ;
	CLC                                                          ;
	ADC current_scroll_offset                                    ;
	STA current_scroll_offset                                    ;
	TXA                                                          ;
	AND #$80                                                     ;
	BPL @update_scroll_offset                                    ;
	
	LDA #$FF                                                     ;
	
@update_scroll_offset:                                            ;
	ADC current_scroll_offset +1                                 ;
	STA current_scroll_offset +1                                 ;
	
	
	LDA CURRENT_WEEK_IN_SEASON                                   ; IS CURRENT WEEK = PLAYOFFS?
	CMP #FIRST_WEEK_OF_PLAYOFFS                                  ; 
	BCC @decrease_frames_left                                    ; NO->UPDATE FRAMES TO SCROLL, EXIT IF DONE

@update_sprite_index_for_playoffs	
	LDA #SPRITE_INDEX_FOR_NFC_HELMET_TILES                       ;
	STA SPR_INDEX_TEMP                                           ;
	JSR UPDATE_PLAYOFF_BRACKET_HELMET_TILES                      ; UPDATE SPECIAL MINI HELMET SPRITES()
	
@decrease_frames_left:                                           ; UPDATE FRAMES TO SCROLL, EXIT IF DONE
	DEC scroll_frames_remaining                                  ; # FRAMES TO SCROLL BRACKET--
_END_WHILE
	RTS                                                          ; RETURN

_F}_SCROLL_PLAYOFF_BRACKET 

_F{_PUT_DIVISION_TEAMS_WIN_PCT_TO_TEMP_ARRAY					 			; DONE

current_team_id					= SEGMENT_VAR_8E
number_teams_in_division		= SEGMENT_VAR_8F
division_team_index				= SEGMENT_VAR_91
team_info[]						= SEGMENT_VAR_96				 ; structure win%,teamid 
	
LOAD_DIVISION_TEAMS_WIN_PCT_ARRAY:                              ; ORDER DIVISION TEAMS IN ARRAY(A= FIRST TEAM, X= NUMBER OF TEAMS)
	STA current_team_id	                                         ; SAVE CURRENT TEAM 
	STX number_teams_in_division                                 ; SET NUMBER OF TEAMS TO PUT IN ARRAY = NUMBER OF TEAMS IN DIVISION
	LDA #$00                                                     ; SET ARRAY INDEX = FIRST POSITION 
	STA division_team_index                                      ;
	
_WHILE NOT_EQUAL                                                 ; ADD TEAMS TO ARRAY
	LDA current_team_id	                                         ; LOAD CURRENT TEAM
	JSR CALC_WIN_PCT_FOR_TEAM                                    ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	LDX division_team_index                                      ;

@save_team_win_pct:	
	STA team_info[],X                                            ; SAVE WIN PCT
	LDA current_team_id	                                         ; SAVE CURRENT TEAM

@save_team_id:	
	STA team_info[]+1,X                                          ;
	INC current_team_id	                                         ; CURRENT TEAM++
	INC division_team_index                                      ; ARRAY INDEX= ARRAY INDEX + 2
	INC division_team_index                                      ;
	DEC number_teams_in_division                                 ; NUMBER OF TEAMS TO PUT IN ARRAY--
_END_WHILE                                                       ; DONE? NO->
	RTS                                                          ; RETURN
	
_F}_PUT_DIVISION_TEAMS_WIN_PCT_TO_TEMP_ARRAY 

_F{_CALCULATE_TEAM_WIN_PERCENTAGE								 			; DONE

team_sram_addr		= LOCAL_1
total_games			= LOCAL_5
temp_losses			= LOCAL_7
temp_wins			= LOCAL_8

divisor_upper		= LOCAL_6
numerator_upper		= LOCAL_7
win_pct				= LOCAL_7 

															     ; *** doesn't include ties. 
CALC_WIN_PCT_FOR_TEAM:                                           ; CALCULATE TEAM WIN PERCENTAGE() RES A = WIN PCT
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #WINS_SEASON_STATS_OFFSET                                ; LOAD WINS
	LDA (team_sram_addr),Y                                       ;
	STA temp_wins                                                ;
	LDY #LOSSES_SEASON_STATS_OFFSET                              ; LOAD LOSSES
	LDA (team_sram_addr),Y                                       ;
	STA temp_losses	                                             ;
	
																 ; *** seems uneeded? 
CALC_WIN_PCT:                                                    ; CALCULATE WIN ($45= 
	LDA temp_wins                                                ; GAMES = WINS + LOSSES
	CLC                                                          ;
	ADC temp_losses	                                             ;
	BEQ @zero_games_played_exit                                  ; GAMES = ZERO ? YES-> GAMES PLAYED = ZERO EXIT
	
@do_calculation:	
	STA total_games                                              ;
	LDA #$00                                                     ;
	STA numerator_upper                                          ;
	STA divisor_upper                                            ;
																 ; WINS/GAMES OR 
	JSR DIVIDE_16_BIT_16_BIT_RESULT                              ; 16 BIT DIVIDE ($44,45/ $42,43) RESULT $40,41
	LDA win_pct +1                                               ;
	BNE @perfect_record                                          ;
	LDA win_pct                                                  ; LOAD WIN PERCENTAGE 
	RTS                                                          ; RETURN

@perfect_record                                                  ; GAMES WON = ALL EXIT
	LDA #$FF                                                     ; SET WIN PERCENTAGE = 100
	RTS                                                          ; RETURN
	
@zero_games_played_exit:                                         ; GAMES PLAYED = ZERO EXIT
	LDA #$01                                                     ; SET WIN PERCENTAGE = 0
	RTS                                                          ; RETURN

_F}_CALCULATE_TEAM_WIN_PERCENTAGE
	
_F{_CONVERT_GAME_SCORE_TO_HEX									 			; DONE

temp_hex_score	= LOCAL_8
	
											                     ; A= score value
CONVERT_GAME_SCORE_DEC_TO_HEX:                                   ; CONVERT DECIMAL TO HEX (RET  VAL IN $45)
	TAX                                                          ;
	AND #$F0                                                     ; Mask out lower digit
	LSR                                                          ;
	STA temp_hex_score                                           ;
	LSR                                                          ;
	LSR                                                          ;
	CLC                                                          ;
	ADC temp_hex_score                                           ;
	STA temp_hex_score                                           ;
	TXA                                                          ;
	AND #$0F                                                     ; Mask out upper digit digit
	CLC                                                          ;
	ADC temp_hex_score                                           ;
	RTS                                                          ; RETURN

_F}_CONVERT_GAME_SCORE_TO_HEX 

_F{_SAVE_CURRENT_RANDOM_VALUES_IN_SRAM							 			; DONE

ADD_RANDOMS_TO_SAVED_RANDOMS:                                                       ; UPDATE SRAM RANDOM VALUES FOR SRAM VERIFY
	MMC3_SRAM_WRITE_ENABLE
	LDA RANDOM_1                                                 ; USE RANDOM 1 TO SET SRAM RANDOM 1
	CLC                                                          ;
	ADC SAVED_RANDOM_1                                                   ; 
	STA SAVED_RANDOM_1                                                    ;
	LDA RANDOM_2                                                      ; USE RANDOM 2 TO SET SRAM RANDOM 2
	ADC SAVED_RANDOM_2                                                    ;
	STA SAVED_RANDOM_2                                                    ;
	LDA RANDOM_3                                                 ; USE RANDOM 3 TO SET SRAM RANDOM 3
	ADC SAVED_RANDOM_3                                                     ;
	STA SAVED_RANDOM_3                                                    ;
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN
	
_F}_SAVE_CURRENT_RANDOM_VALUES_IN_SRAM

_F{_DRAW_SCREEN_SKIP_IF_BUTTON_PRESSED                           			; DONE

DRAW_SCREEN_SKIP_IF_B:                                           ; DRAW SCREEN (A= SCREEN ID, X= BANK), CHECK FOR B PRESS TO SKIP 
	JSR END_OLD_SCENE_DRAW_NEW_SCENE                             ; DRAW SCREEN(A= INDEX, X= BANK)

@loop_until_scene_done_b_press:
 	
_WHILE VALUE_CLEAR												 ; 
	RETURN_1_FRAME  
	LDA DRAW_SCRIPT_TASK + TASK_STATUS                           ; LOAD TASK 2 STATUS
	BEQ @cutscene_done                                           ; TASK DONE? YES-> EXIT
	BIT JOY_PRESS_BOTH                                           ; CHECK P1/P2 PRESS
_END_WHILE
	JSR END_DRAW_FADE_OUT_STOP_SOUND_CLEAR_SCREEN                ; END TASKS, FADE OUT PALLETE, STOP MUSIC, CLEAR NAMETABLES, CLEAR SPRITES()
	SEC                                                          ; SET CARRY = CUTSCENE SKIPPED
	RTS                                                          ; RETURN

@cutscene_done:                                                  ; CUTSCENE FINISHED EXIT 
	CLC                                                          ; CLEARED CARRY = CUTSCENE FINISHED
	RTS                                                          ; RETURN
	
_F}_DRAW_SCREEN_SKIP_IF_B_PRESSED

_F{_FADE_OUT_CLEAR_BG_AND_SPR_CLEAR_IRQ0						 			; DONE

FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0:                             ; FADE OUT PAL, CLEAR IRQ0 XSCROLL, IRQ 0 COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES()
	JSR SET_BG_SPR_FULLY_FADED_OUT                               ; FADE OUT PALLETE()
	LDA #$00                                                     ; CLEAR IRQ0 SPLIT XSCROLL AND COUNTER
	STA IRQ_0_XSCROLL                                            ;
	STA IRQ_0_NAMETABLE	                                         ;
	STA IRQ_0_COUNTER                                            ;
	JSR CLEAR_ALL_NAMETABLES                                     ; CLEAR NAMETABLES()
	JMP SET_ALL_SPR_OFFSCREEN                                    ; CLEAR SPRITES() AND RETURN

_F}_FADE_OUT_CLEAR_BG_AND_SPR_CLEAR_IRQ0 

_F{_CONTINUE_SCENE_UNLESS_B_PRESSED							    			; DONE
	
	
CONTINUE_SCENE_UNLESS_B_PRESSED:                                 ; WAIT X FRAMES OR CONTINUE IF B PRESSED(X= FRAMES TO WAIT), FADE OUT PALLETTE()
	
_WHILE NOT_EQUAL
	
	RETURN_1_FRAME  
	BIT JOY_PRESS_BOTH                                           ; IS P1/P2 PRESS = B PRESSED?
	BVS @exit                                                     ; YES-> 
	DEX                                                          ; FRAMES TO WAIT-- 
	
_END_WHILE
	
	JSR FADE_OUT_BG_SPR_PAL                                      ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	RTS                                                          ; RETURN
	
@exit:                                                          ; 
	JSR END_ALL_DRAWING_TASKS_CLEAR_YSCROLL                      ; END TASKS 2,3,4,5, CLEAR Y SCROLL()
	JMP FADE_OUT_CLR_SPR_NAMETBL_RESET_IRQ0                      ; FADE IN PALLETE, CLEAR IRQ0 XSCROLL AND IRQ 0 COUNTER, CLEAR NAMETABLES(), CLEAR SPRITES() AND RETURN

_F}_CONTINUE_SCENE_UNLESS_B_PRESSED
	
_F{_DRAW_PLAYOFF_BRACKET_SINGLE_SCREEN							 			; DONE

playoff_team_id									= LOCAL_8

helmet_table_index								= SEGMENT_VAR_8E
current_playoff_match_index						= SEGMENT_VAR_90
current_scroll_offset							= SEGMENT_VAR_92

SIZE_OF_PLAYOFF_HELMET_TABLE					= $18
AFC_BRACKET_NAME_TABLE							= $00
NFC_BRACKET_NAME_TABLE							= $01

AFC_BRACKET_STARTING_X_LOC						= $10 
NFC_BRACKET_STARTING_X_LOC						= $E0 

PLAYOFF_MATCH_HOME_SCORES[]						= PLAYOFF_RESULTS_START[] + 2
PLAYOFF_MATCH_AWAY_SCORES[]						= PLAYOFF_RESULTS_START[] + 3

DRAW_ONE_SIDE_OF_PLAYOFF_BRACKET:                                ; DRAW PLAYOFF BRACKET SINGLE SCREEN()
	LDA #$00                                                     ; SET CURRENT X,Y LOCATION = 00,00
	STA current_scroll_offset                                    ;
	STA current_scroll_offset+1                                  ;
	JSR SAVE_MINI_HELMET_ATTR_TABLES_IN_SRAM                     ; SAVE ATTRIBUTE TABLE IN SRAM(), SET CHR 1800,1C00 BANKS, SET $B8()
	LDA #$00                                                     ;  
	STA helmet_table_index                                 ;
	STA current_playoff_match_index	                                       ;
	
_WHILE CC                                                        ; DRAW INITIAL PLAYOFF MATCHUP HELMETS SINGLE SCREEN
	JSR GET_PLAYOFF_BRACKET_HELMET_SPR_LOCATION                  ; GET HELMET X,Y LOCATION()
	JSR SAVE_MINI_HELMET_DATA_TO_BG_BUFFER                       ; SAVE MINI HELMET DATA TO BUFFER ( $45=HELMET INDEX, Y,A = COORDINATES, X= NAMETABLE)  
	
@check_all_games_drawn: 	
	LDA helmet_table_index                              	     ; ALL GAMES DRAWN?
	CMP #SIZE_OF_PLAYOFF_HELMET_TABLE                            ; 

_END_WHILE
	
	LDA CURRENT_GAME_IN_WEEK                                     ; IS CURRENT GAME = FIRST GAME 
	BEQ @fade_in_screen                                          ; YES->FADE IN SCREEN	
	STA helmet_table_index                             	 ; SAVE CURRENT GAME
	

@draw_playoff_winners:
	
_WHILE NOT_EQUAL                                                 ; DRAW PLAYOFF WINNERS HELMETS SINGLE SCREEN
	JSR SET_HLEMET_ID_AND_LOC_FOR_PLAYOFF_WINNER                                                ; SET HELMET TEAM ID AND LOCATION FOR PLAYOFF WINNERS (8E= CURRENT MATCHUP)
	BCS @fade_in_screen                                          ; ALL HELMETS DRAWN? YES-> FADE IN SCREEN
	
@save_helmet_data_to_buffer:	
	JSR SAVE_MINI_HELMET_DATA_TO_BG_BUFFER                       ; SAVE MINI HELMET DATA TO BUFFER ( $45=HELMET INDEX, Y,A = COORDINATES, X= NAMETABLE)  
	LDA current_playoff_match_index	                                       ; LOAD NEXT MATCHUP INDEX
	DEC helmet_table_index                              	     ;  NUMBER OF MATCHUPS TO DRAW--
	
_END_WHILE
	
@fade_in_screen:                                                 ; FADE IN SCREEN
	JSR LOAD_BG_ATTR_VALUES_BOTH_SCREENS_FROM_SRAM               ; UPDATE PPU ATTRIBUTE TABLES FROM SRAM BUFFER()
	LDA #PLAYOFF_BRACKET_BG_PAL_INDEX                            ; SET BG PAL
	LDX #PLAYOFF_BRACKET_SPR_PAL_INDEX                           ; SET SPR PAL
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	RTS                                                          ; RETURN
	

	
UPDATE_PLAYOFF_BRACKET_HELMET_TILES:                             ; UPDATE SPECIAL MINI HELMET SPRITES()
	LDA #$00                                                     ;
	STA helmet_table_index                                       ; SET NUMBER OF GAMES = ZERO
	STA current_playoff_match_index	                                       ; SET PLAYOFF MATCHUP INDEX = FIRST MATCHUP
	
_WHILE CC                                                        ; DRAW INITIAL PLAYOFF MATCHUP HELMETS
	JSR GET_PLAYOFF_BRACKET_HELMET_SPR_LOCATION                  ; GET HELMET X,Y LOCATION()
	JSR DRAW_PLAYOFF_BRACKET_MINI_HELMET                         ; DRAW PLAYOFF BRACKET MINI HELMET SPRITE()
	LDA helmet_table_index                                       ; ALL TILES DRAWN?
	CMP #SIZE_OF_PLAYOFF_HELMET_TABLE                   ; 
	
_END_WHILE                                                       ; NO->DRAW INITIAL PLAYOFF MATCHUP HELMETS

	LDA CURRENT_GAME_IN_WEEK                                     ; IS CURRENT GAME = FIRST GAME
	BEQ @exit                                                    ; YES->EXIT
	STA helmet_table_index                                       ; SAVE GAME INDEX
	
_WHILE NOT_EQUAL                                                 ; DRAW PLAYOFF WINNER HELMETS() 
	JSR SET_HLEMET_ID_AND_LOC_FOR_PLAYOFF_WINNER                 ; SET HELMET TEAM ID AND LOCATION FOR PLAYOFF WINNERS (8E= CURRENT MATCHUP)
	BCS @exit                                                    ; ALL HELMETS DRAWN? YES->EXIT
	JSR DRAW_PLAYOFF_BRACKET_MINI_HELMET                         ; DRAW PLAYOFF BRACKET MINI HELMET SPRITE()
	LDA current_playoff_match_index	                                      ; LOAD NEXT MATCHUP INDEX
	DEC helmet_table_index                                       ; NUMBER OF MATCHUPS TO DRAW--
	
_END_WHILE                                                       ; DONE? NO->DRAW PLAYOFF WINNER HELMETS()
	
@exit:                                                           ; EXIT 
	RTS                                                          ; RETURN

GET_PLAYOFF_BRACKET_HELMET_SPR_LOCATION:                         ; GET HELMET X,Y LOCATION()
	LDX helmet_table_index                                       ; LOAD MATCHUP INDEX
	LDY PLAYOFF_HELMETS,X                                        ; LOAD PLAYOFF GAME INDEX
	LDA PLAYOFF_RESULTS_START[],Y                                ; LOAD HELMET TEAM ID 
	STA playoff_team_id                                          ;
	LDA PLAYOFF_HELMETS+1,X                                      ; LOAD HELMET Y LOCATION
	PHA                                                          ;
	CPX #$0C                                                     ; DOES MATCHUP = NFC MATCHUP
	BCS @set_nfc_screen_location                                 ; YES-> NFC MATCHUP
	
@set_afc_screen_location:	
	LDA #AFC_BRACKET_STARTING_X_LOC                              ; = AFC HELMET STARTING SCREEN LOCATION 
	LDX #AFC_BRACKET_NAME_TABLE                                  ; SET NAMETABLE = FIRST NAMETABLE
	JMP @set_x_location
	
@set_nfc_screen_location:                                        ; NFC MATCHUP 
	LDA #NFC_BRACKET_STARTING_X_LOC                              ; = NFC HELMET STARTING SCREEN LOCATION
	LDX #NFC_BRACKET_NAME_TABLE                                  ; SET NAMETABLE = 2ND NAMETABLE
	
@set_x_location:                                                 ; SET X LOCATION
	CLC                                                          ; = STARTING LOCATION + SCROLL LOCATION
	ADC current_scroll_offset                                    ;
	TAY                                                          ;
	TXA                                                          ;
	ADC current_scroll_offset+1                                  ;
	TAX                                                          ; SAVE HELMET X LOCATION
	PLA                                                          ; LOAD HELMET Y LOCATION
	INC helmet_table_index                                       ; SET PLAYOFF MATCHUP HELMET INDEX  += OFFSET TO NEXT INDEX
	INC helmet_table_index                                       ;
	RTS                                                          ; RETURN

SET_HLEMET_ID_AND_LOC_FOR_PLAYOFF_WINNER:                        ; SET HELMET TEAM ID AND LOCATION FOR PLAYOFF WINNERS (X= MATCHUP INDEX)
	LDX current_playoff_match_index	                             ;
	LDY PLAYOFF_HELMET_WINNERS_TABLE,X                                 ; LOAD GAME ID
	BMI @exit                                                    ; ALL HELMETS DRAWN? YES->ALL PLAYOFF WINNER HELMETS DRAWN 

@check_who_won:	
	LDA PLAYOFF_MATCH_HOME_SCORES[],Y                            ; HOME SCORE > 
	CMP PLAYOFF_MATCH_AWAY_SCORES[],Y                            ; AWAY SCORE
	BCS @set_helmet_id_and_location                              ; YES-
	INY                                                          ; SET INDEX TO AWAY TEAM
	
@set_helmet_id_and_location:                                    ; DRAW HELMET
	LDA PLAYOFF_RESULTS_START[],Y                               ; SAVE TEAM ID FROM PLAYOFF MATCHUP WINNER
	STA playoff_team_id                                          ;
	LDA PLAYOFF_HELMET_WINNERS_TABLE+1,X                               ; LOAD HELMET Y LOCATION
	PHA                                                          ;
	LDA PLAYOFF_HELMET_WINNERS_TABLE+2,X                               ; LOAD HELMET X LOCATION
	CLC                                                          ;
	ADC current_scroll_offset                                    ; 
	TAY                                                          ;
	LDA PLAYOFF_HELMET_WINNERS_TABLE+3,X                               ; LOAD NAMETABLE PAGE 
	ADC current_scroll_offset +1                                 ; 
	TAX                                                          ;
	LDA current_playoff_match_index	                             ; PLAYOFF MATCHUP INDEX += OFFSET TO NEXT PLAYOFF WINNERS
	CLC                                                          ;
	ADC #$04                                                     ;
	STA current_playoff_match_index	                             ;
	PLA                                                          ; LOAD HELMET Y LOCATION
	CLC                                                          ; CLC= MORE HELMETS TO DRAW
	RTS                                                          ; RETURN
	
@exit:                                                           ; ALL PLAYOFF WINNER HELMETS DRAWN
	SEC                                                          ; SEC= ALL HELMETS DRAWN
	RTS                                                          ; RETURN

_F}_DRAW_MINI_HELMETS_PLAYOFF_BRACKET 
	
_F{_DO_TEAM_YARDAGE_RANKINGS												; DONE

yardage_type_choice			= SEGMENT_VAR_8E
team_yards_for_array		= SEGMENT_VAR_8E
num_teams_to_sort			= SEGMENT_VAR_8E
current_yardage_index		= SEGMENT_VAR_8E

current_team_to_draw		= SEGMENT_VAR_A7		
first_team_id_to_sort		= SEGMENT_VAR_A8
last_team_id_to_sort		= SEGMENT_VAR_A9

offense_defense_choice		= SEGMENT_VAR_AA
ranking_choice				= SEGMENT_VAR_AB



current_team				= SEGMENT_VAR_8F
times_thru_yardage_loop		= SEGMENT_VAR_8F
team_id						= SEGMENT_VAR_91
current_team_index			= SEGMENT_VAR_91
array_index					= SEGMENT_VAR_92
teams_drawn					= SEGMENT_VAR_93	
yardage_function_addr		= SEGMENT_VAR_94
ppu_addr					= SEGMENT_VAR_94

starting_team_id			= SEGMENT_VAR_A7
first_team_conference		= SEGMENT_VAR_A8
last_team_conference		= SEGMENT_VAR_A9
yardage_result				= LOCAL_8	

FIRST_RANKING_CHOICE		= $00
LAST_RANKING_CHOICE			= $02
TEAMS_PER_PAGE				= $0B

DO_TEAM_RANKINGS:                                                ; TEAM RANKINGS START
	LDA MENU_Y                                                   ; CONVERT MENU CHOICE TO RANKING SCREEN INDEX
	ASL                                                          ;
	CLC                                                          ;
	ADC MENU_Y                                                   ;
	STA offense_defense_choice                                   ; 
	CLC                                                          ;
	ADC MENU_X                                                   ; 
	STA yardage_type_choice                                                      ; SAVE RANKINGS MENU CHOICE
	CLC                                                          ; + OFFSET TO TEAM RANKINGS SCREEN(S)
	ADC #TEAM_RANKINGS_SCREEN_IDS_START                          ; 
	LDX #MENU_DRAW_SCRIPT_BANK                                   ; SET BANK = 16
	JSR DRAW_SCENE_UNTIL_ENDED                                   ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)


@initialize_rankings_Arrow_sprite
	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] RANKINGS_POINTER_SPRITE_DATA, MENU_ARROW_SPR_INFO, $04
	
	
	LDA #TEAM_RANKINGS_BG_PAL_INDEX                              ; SET RANKINGS BG PALLETE INDEX
	LDX #TEAM_RANKINGS_SPR_PAL_INDEX                             ; SET RANKINGS SPR PALLETE INDEX
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN                        ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE) 
	LDA yardage_type_choice                                      ; LOAD RANKINGS MENU CHOICE
	SHIFT_LEFT_2
	TAX                                                          ;
	LDA TOTAL_YARDS_SORTING_TABLE,X                              ; SET FIRST TEAM AND CURRENT START TEAM FROM RANKINGS FUNCTIONS TABLE
	STA first_team_id_to_sort                                    ;
	STA current_team_to_draw                                     ;
	LDA TOTAL_YARDS_SORTING_TABLE+1,X                            ; LOAD LAST TEAM RANKINGS FUNCTIONS TABLE
	STA last_team_id_to_sort                                     ;
	LDY TOTAL_YARDS_SORTING_TABLE+2,X                            ; LOAD RANKINGS FUNCTION
	LDA TOTAL_YARDS_SORTING_TABLE+3,X                            ;
	TAX                                                          ; 
	JSR GET_YARDS_AND_SORT_TEAMS                                 ; SET DISPLAY ORDER(X,Y= FUNCTION ADDR)
	JSR DRAW_TEXT_AND_HELMETS_TEAM_RANKINGS                      ; DRAW HELMETS, NAMES, YARDS()
	
	LDA #FIRST_RANKING_CHOICE                                    ; SET CURRENT RANKINGS ARROW LOCATION = FIRST CHOICE = TOTAL 
	STA ranking_choice                                           ; 

@team_ranking_yardage_input_loop:                                ; RANKINGS INPUT LOOP
	RETURN_1_FRAME  
	BIT JOY_PRESS_BOTH                                           ; “ B” PRESSED? 
	BVS EXIT_TEAM_RANKINGS                                       ; YES-> EXIT TEAM RANKINGS
	
@check_right_pressed:	
	LDA JOY_PRESS_BOTH
	LSR 
	BCS @right_pressed_ranking_yardage                           ; YES->RIGHT PRESSED ON RANKINGS

@check_left_pressed:	
	LSR                                                          ; IS LEFT PRESSED?
	BCS @left_pressed_ranking_yardage                            ; YES-> LEFT PRESSED ON RANKINGS
	
@check_down_pressed:	
	LSR                                                          ; IS DOWN PRESSED?
	BCS @down_pressed_ranking_yardage:                           ; YES-> DOWN PRESSED ON RANKINGS

@up_pressed_ranking_yardage:	
	LSR                                                          ; IS UP PRESSED
	BCC @team_ranking_yardage_input_loop                         ; NO-> RANKINGS INPUT LOOP
	LDA current_team_to_draw                                     ; IS CURRENT START TEAM = FIRST TEAM
	CMP first_team_id_to_sort                                    ;
	BEQ @team_ranking_yardage_input_loop                         ; YES AT FIRST PAGE-> RANKINGS INPUT LOOP

@go_to_previous_page: 	
	SEC                                                          ;
	SBC #TEAMS_PER_PAGE                                          ;
	JMP @redraw_after_up_or_down                                 ;
	
@down_pressed_ranking_yardage:                                   ; DOWN PRESSED ON RANKINGS
	LDA current_team_to_draw                                     ; ALREADY ON LAST PAGE OF TEAMS TO DRAW?
	CLC                                                          ;
	ADC #TEAMS_PER_PAGE                                          ;
	CMP last_team_id_to_sort                                     ;
	BCS @team_ranking_yardage_input_loop                         ; YES-> RANKINGS INPUT LOOP
	
@redraw_after_up_or_down:                                        ; REDRAW RANKINGS AFTER UP OR DOWN
	STA current_team_to_draw                                     ; SAVE TEAM # INDEX 
	JSR SET_SPECIAL_HELMET_SPRITES_OFFSCREEN                     ; SET SPECIAL HELMET SPRITES OFFSCREEN DURING RANKING TYPE CHANGE()
	JSR DRAW_TEXT_AND_HELMETS_TEAM_RANKINGS                      ; DRAW HELMETS, NAMES, YARDS TEAM RANKINGS()
	JMP @team_ranking_yardage_input_loop                         ; JUMP-> RANKINGS INPUT LOOP
	
@left_pressed_ranking_yardage:                                   ; LEFT PRESSED ON RANKINGS
	DEC ranking_choice                                           ; CURRENT RANKINGS CHOICE--
	BPL @move_ranking_arrow_redraw_teams                         ; ALREADY AT FIRST CHOICE? NO-> MOVE RANKINGS ARROW
	
@keep_at_first_choice:	
	LDA #FIRST_RANKING_CHOICE                                    ; ELSE KEEP RANKINGS ARROW AT FIRST CHOICE
	STA ranking_choice                                           ; 
	JMP @team_ranking_yardage_input_loop                         ; JUMP->RANKINGS INPUT LOOP
	
@right_pressed_ranking_yardage:                                  ; RIGHT PRESSED ON RANKINGS
	INC ranking_choice                                           ; CURRENT RANKINGS CHOICE++
	LDA ranking_choice                                           ;
	CMP #LAST_RANKING_CHOICE +1                                  ; ALREADY AT LAST CHOICE? 
	BCC @move_ranking_arrow_redraw_teams                         ; NO-> MOVE RANKINGS ARROW

@keep_at_last_choice:	
	LDA #LAST_RANKING_CHOICE                                     ; ELSE KEEP RANKINGS ARROW AT LAST CHOICE
	STA ranking_choice                                            ;
	JMP @team_ranking_yardage_input_loop                         ; JUMP->RANKINGS INPUT LOOP
	
@move_ranking_arrow_redraw_teams:                                ; MOVE RANKINGS ARROW AND REDRAW TEAMS AND YARDS
	LDA first_team_id_to_sort                                    ; SAVE CURRENT TEAM ARRAY INDEX
	STA current_team_to_draw                                     ;
	LDX ranking_choice                                           ; LOAD CURRENT RANKINGS CHOICE
	LDA RANKING_ARROW_X_LOCATIONS,X                              ; LOAD SPRITE X LOCATION FROM RANKINGS ARROW X LOCATIONS
	STA MENU_ARROW_SPR_X                                         ; SAVE ARROW X LOCATION
	LDA offense_defense_choice                                    ; LOAD OFFENSE OR DEFENSE
	CLC                                                          ;
	ADC ranking_choice                                           ; + RANKINGS CHOICE (TOTAL, PASS, RUSH)
	ASL                                                          ; SHIFT SINCE EACH ADDRESS IS TWO BYTES
	TAX                                                          ;
	LDY TEAM_YARDS_RANKING_FUNCTION_ADDR_TABLE,X                 ; LOAD ADDRESS FROM TEAM RANKINGS STAT FUNCTION ADDRESSES
	LDA TEAM_YARDS_RANKING_FUNCTION_ADDR_TABLE+1,X               ;
	TAX                                                          ;
	JSR GET_YARDS_AND_SORT_TEAMS                                 ; SET TEAM RANKINGS DISPLAY ORDER(X,Y= ADDR)   
	JSR SET_SPECIAL_HELMET_SPRITES_OFFSCREEN                     ; SET SPECIAL HELMET SPRITES OFFSCREEN DURING RANKING TYPE CHANGE()
	JSR DRAW_TEXT_AND_HELMETS_TEAM_RANKINGS                      ; DRAW HELMETS, NAMES, YARDS TEAM RANKINGS()
	JMP @team_ranking_yardage_input_loop                         ; JUMP->RANKINGS INPUT LOOP

SET_SPECIAL_HELMET_SPRITES_OFFSCREEN:                            ; SET SPECIAL HELMET SPRITES OFFSCREEN DURING RANKING TYPE CHANGE()
	
	
	SET_RAM_Y_INDEX[start_length_value] SPECIAL_HELMET_SPRITES_SPR_INFO[], $F0, SPRITE_OFFSCREEN + 1
	RTS                                                          ; RETURN

EXIT_TEAM_RANKINGS:                                                       ; EXIT TEAM RANKINGS
	RTS                                                          ; RETURN



	
GET_YARDS_AND_SORT_TEAMS:                                        ; GET TEAM YARDS AND SORT(X,Y= YARDAGE FUNCTION ADDR)
	STY yardage_function_addr                                    ; SAVE YARDAGE FUNCTION ADDR
	STX yardage_function_addr+1                                  ; 
	LDA current_team_to_draw                                     ; SET FIRST TEAM = CURRENT TEAM 
	STA team_id                                                  ;
	
	CLEAR_RAM_Y_INDEX[start_length]  TEAM_YARDAGE_SORTED_INFO[], $70 
	
	
	LDA #$00                                                     ; SET CURRENT TEAM INDEX = FIRST TEAM
	STA array_index                                              ;

@sort_yards:
	
_WHILE CC                                                        ; GET TEAM YARDS LOOP
	LDA team_id                                                  ; SET CURRENT TEAM = TEAM ID
	STA CURRENT_TEAM                                             ;
	LDA #>@Loop3                                                 ; SAVE RETURN LOCATION ON STACK 
	PHA                                                          ;
	LDA #<@Loop3-1                                               ;
	PHA                                                          ;
	JMP (yardage_function_addr)                                  ; JUMP TO YARDAGE FUNCTION ADDR

@Loop3:
	LDA array_index                                              ; = TEAM INDEX SHIFT BY 4 SINCE EACH TEAM STATS 4 BYTES LONG
	ASL                                                          ;
	ASL                                                          ;
	TAX                                                          ;

@save_yards_to_array:	
	LDA team_yards_for_array                                     ; SAVE YARDS 
	STA TEAM_YARDAGE_SORTED_INFO[]+2,X                           ;
	LDA team_yards_for_array+1                                   ;
	STA TEAM_YARDAGE_SORTED_INFO[]+3,X                           ;

@save_team_id_to_array:	
	LDA team_id                                                  ; SAVE TEAM ID
	STA TEAM_YARDAGE_SORTED_INFO[]+1,X                           ;
	INC team_id                                                  ; TEAM ID++
	INC array_index                                              ; CURRENT TEAM INDEX++
	CMP last_team_id_to_sort                                     ; IS CURRENT TEAM < LAST TEAM + 1
	
_END_WHILE                                                  	; YES->GET TEAM YARDS LOOP
																 ; 
	LDA last_team_id_to_sort                                     ;
	SEC                                                          ;
	SBC first_team_id_to_sort                                    ;
	SEC                                                          ;
	SBC #$01                                                     ;
	STA times_thru_yardage_loop                                  ;
	
_WHILE NOT_EQUAL                                                 ;
	LDA times_thru_yardage_loop                                  ; SET CURRENT TEAM = TEAM TO CHECK AGAINST
	STA num_teams_to_sort                                        ; 
	
	LDX #$00                                                     ; SET TEAM INDEX = TOP TEAM
@compare_yardage:                                                          ; 
	LDA TEAM_YARDAGE_SORTED_INFO[]+2,X                           ; = CURRENT TEAM YARDS -  NEXT TEAM YARDS
	SEC                                                          ;
	SBC TEAM_YARDAGE_SORTED_INFO[]+6,X                           ;
	TAY                                                          ;
	LDA TEAM_YARDAGE_SORTED_INFO[]+3,X                           ;
	SBC TEAM_YARDAGE_SORTED_INFO[]+7,X                           ;
	STA yardage_result                                           ;
	BNE @move_team_up_down_depending_on_sort                     ; TEAM 1- TEAM 2 YARDS NOT EQUAL->MOVE TEAM UP DEPENDING ON SORT TYPE AND YARDAGE (OFFENSE/DEFENSE)
	TYA                                                          ;
	BNE @move_team_up_down_depending_on_sort                     ; TEAM 1- TEAM 2 YARDS NOT EQUAL->MOVE TEAM UP DEPENDING ON SORT TYPE AND YARDAGE (OFFENSE/DEFENSE)
	LDA #$FF                                                     ; SET TEAM YARDS ARE EQUAL INDICATOR
	STA TEAM_YARDAGE_SORTED_INFO[]+4,X                           ;
	JMP @set_team_index_to_next                                  ; JUMP->CHECK NEXT TEAM
	
@move_team_up_down_depending_on_sort:                            ; MOVE TEAM UP DEPENDING ON SORT TYPE AND YARDAGE (OFFENSE/DEFENSE)
	LDA MENU_Y                                                   ; 
	ROR                                                          ;
	ROR                                                          ;
	EOR yardage_result                                           ; 
	BPL @set_team_index_to_next                                  ;

	JSR MOVE_TEAM_YARDAGE_INFO_UP_ONE_IN_ARRAY                   ; MOVE TEAM BYTES UP ONE IN SORT ORDER(X= CURRENT STAT INDEX)
	JSR MOVE_TEAM_YARDAGE_INFO_UP_ONE_IN_ARRAY                   ; MOVE TEAM BYTES UP ONE IN SORT ORDER(X= CURRENT STAT INDEX)
	JSR MOVE_TEAM_YARDAGE_INFO_UP_ONE_IN_ARRAY                   ; MOVE TEAM BYTES UP ONE IN SORT ORDER(X= CURRENT STAT INDEX)
	JSR MOVE_TEAM_YARDAGE_INFO_UP_ONE_IN_ARRAY                   ; MOVE TEAM BYTES UP ONE IN SORT ORDER(X= CURRENT STAT INDEX)
	JMP @check_team_vs_all_others
	
@set_team_index_to_next:                                          ; CHECK NEXT TEAM
	INX                                                          ; TEAM INDEX += OFFSET TO NEXT TEAM
	INX                                                          ;
	INX                                                          ;
	INX                                                          ;
	
@check_team_vs_all_others:                                       ; CHECK ALL TEAMS VS ALL OTHERS
	DEC num_teams_to_sort                                        ; TEAMS LEFT TO CHECK--
	BNE @compare_yardage                                         ;


	DEC times_thru_yardage_loop                                  ; CURRENT TEAM--
	
_END_WHILE                                                       ;
	
	
	LDA last_team_conference                                     ;
	SEC                                                          ;
	SBC first_team_conference                                    ;
	TAY                                                          ; SAVE NUMBER OF TEAMS TO RANK
	LDX #$00                                                     ; SET OFFSET = TOP TEAM
_WHILE NOT_EQUAL                                                 ; SET TEAM RANKING NUMBER LOOP
	LDA TEAM_YARDAGE_SORTED_INFO[],X                             ; IS TEAM TIED WITH PREVIOUS TEAM?
	BMI @set_team_ranking                                        ; YES->SET TEAM RANKING
	
	STX current_yardage_index                                    ; SET TEAM INDEX = CURRENT TEAM INDEX
@set_team_ranking:                                               ; SET TEAM RANKING
	LDA current_yardage_index                                    ; LOAD TEAM INDEX
	LSR                                                          ; CONVERT TO RANK
	LSR                                                          ;
	CLC                                                          ;
	ADC #$01                                                     ;
	STA TEAM_YARDAGE_SORTED_INFO[],X                             ;  SAVE RANK 
	INX                                                          ; CURRENT TEAM INDEX += OFFSET TO NEXT TEAM
	INX                                                          ;
	INX                                                          ;
	INX                                                          ;
	DEY                                                          ; NUMBER OF TEAMS TO RANK--
_END_WHILE                                                       ; DONE->
	RTS                                                          ; RETURN

MOVE_TEAM_YARDAGE_INFO_UP_ONE_IN_ARRAY:                          ; MOVE TEAM BYTES UP ONE IN SORT ORDER(X= CURRENT STAT INDEX)
	LDA TEAM_YARDAGE_SORTED_INFO[],X                             ; 
	LDY TEAM_YARDAGE_SORTED_INFO[]+4,X                           ;
	STA TEAM_YARDAGE_SORTED_INFO[]+4,X                           ;
	TYA                                                          ;
	STA TEAM_YARDAGE_SORTED_INFO[],X                             ;
	INX                                                          ; STAT INDEX++ 
	RTS                                                          ; RETURN

	


DRAW_TEXT_AND_HELMETS_TEAM_RANKINGS:                             ; DRAW HELMETS, NAMES, YARDS TEAM RANKINGS()

num_rows				= LOCAL_1
tiles_per_row			= LOCAL_2
ranking_number			= LOCAL_7
team_name_length	    = LOCAL_8
current_team_id			= LOCAL_8
	


CURRENT_SORTED_RANKING_NUMBER[] =  TEAM_YARDAGE_SORTED_INFO[]
CURRENT_SORTED_TEAM_ID[]		=  TEAM_YARDAGE_SORTED_INFO[] + 1
TEAMS_PER_PAGE					= $0B
TEAM_NAME_MAX_CHARACTERS		= $0A

PPU_OFFSET_TO_TEAM_NAME			= $25 
PPU_OFFSET_TO_TOTAL_YARDS		= PPU_OFFSET_TO_TEAM_NAME	+ 11 
PPU_OFFSET_TO_PASS_YARDS		= PPU_OFFSET_TO_TOTAL_YARDS + 5 
PPU_OFFSET_TO_RUN_YARDS			= PPU_OFFSET_TO_PASS_YARDS  + 5 

SIZE_OF_RANKING_NUMBER			= $02 								; max of two tiles	
ROWS_TO_CLEAR					= $1E






	LDA starting_team_id                                         ; = STARTING TEAM INDEX ON PAGE
	SEC                                                          ;
	SBC first_team_conference                                   ; - FIRST TEAM TO DRAW
	STA current_team_index                                       ; SAVE CURRENT TEAM INDEX
	JSR SAVE_MINI_HELMET_ATTR_TABLES_IN_SRAM                     ; SAVE ATTRIBUTE TABLE IN SRAM(), SET CHR 1800,1C00 BANKS, SET $B8()
	LDA #<TEAM_YARDAGE_RANK_NO_STARTING_PPU_ADDR                 ; SET PPU ADDRESS = $20C1 = RANKING NUMBER LOCATION
	STA ppu_addr                                                 ;
	LDA #>TEAM_YARDAGE_RANK_NO_STARTING_PPU_ADDR                 ;
	STA ppu_addr+1                                               ;
	LDA #$00                                                     ; SET NUMBER OF TEAMS DRAWN = 0 
	STA teams_drawn                                              ;
	
_WHILE ALWAYS                                                    ; DRAW TEAM HELMET AND YARDS LOOP 
	LDA current_team_index                                       ; = CURRENT TEAM INDEX
	CLC                                                          ;
	ADC first_team_conference                                                      ; + OFFSET TO TEAM CONFERENCE
	CMP last_team_conference                                     ; IS TEAM = LAST TEAM IN CONFERENCE? 
	BCC @do_team_yardage_stats                                   ; NO

@blank_out_remainder_of_screen	
	JMP @clear_helmets_remainder_of_screen:                      ; YES-> BLANK OUT REMAINDER OF SCREEN
	
@do_team_yardage_stats:                                          ;
	LDA current_team_index                                       ; LOAD CURRENT TEAM INDEX
	SHIFT_LEFT_2                                                 ;
	TAX                                                          ;
	LDA CURRENT_SORTED_TEAM_ID[],X                               ; SET CURRENT TEAM FROM SORTED TEAMS
	STA CURRENT_TEAM                                             ;
	LDA CURRENT_SORTED_RANKING_NUMBER[],X                        ; LOAD RANKING NUMBER HEX
	JSR HEX_TO_2_DIGIT_DEC                                       ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDA #LENGTH_OF_ONE_ROW                                       ; SET PPU ADDR = NEXT ROW
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA ranking_number                                           ; LOAD RANKING NUMBER DECIMAL
	JSR CONVERT_2_DIG_NUM_TILES                                  ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(X,Y= PPUADDR, A=NUMBER)
	LDA CURRENT_TEAM                                             ; SAVE CURRENT TEAM
	STA current_team_id	                                         ;
	LDY #$20                                                     ; SET X COORD FOR MINI HELMET 
	LDX #<NAMETABLE1_START                                       ; SET NAMETABLE =$2000 
	LDA teams_drawn                                              ; = NUMBER OF TEAMS DRAWN * 16
	SHIFT_LEFT_4
	CLC                                                          ;
	ADC #$30                                                     ; + OFFSET TO FIRST HELEMET = Y COORDINATE FOR MINI HELEMET
	JSR SAVE_MINI_HELMET_DATA_TO_BG_BUFFER                       ; SAVE MINI HELMET DATA TO BUFFER ( $45=HELMET INDEX, Y,A = COORDINATES, X= NAMETABLE)   
	LDA #TEAM_NAME_MAX_CHARACTERS                                ; SET TEAM NAME LENGTH = 10 CHARACTERS     
	STA team_name_length                                         ;
	LDA #PPU_OFFSET_TO_TEAM_NAME                                 ; = OFFSET TO TEAM NAME LOCATION = ONE ROW + 5 TILES
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	CLC                                                          ;  
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                          ; + OFFSET TO TEAM NAME 
	JSR DRAW_TEAM_INFO_CENTERED                                  ; DRAW TEAM NAMES SMALL LETTERS CENTER JUSTIFY (X,Y =PPUADDRESS, A= TEAM ID + OFFSET)
	LDA MENU_Y                                                   ; IS MENU CHOICE = DEFENSE
	BNE @draw_defensive_yards                                    ;
	
@draw_offensive_yards: 	
	JSR GET_OFFENSE_TOTAL_YARDS                                  ; GET TEAM OFFENSE TOTAL YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	LDA #PPU_OFFSET_TO_TOTAL_YARDS                               ; = PPU OFFSET TO TOTAL YARDS
	JSR CONVERT_TEAM_YARD_VALUE_TO_DEC_SAVE_IN_DRAW_BUFFER       ; CONVERT 2 BYTE NUMBER TO BCD AND SAVE IN DRAW BUFFER(A= PPU ADDR OFFSET)
	
	JSR GET_OFFENSE_PASS_YARDS                                   ; GET TEAM OFFENSE PASSING YARDS( $6E= TEAM)
	LDA #PPU_OFFSET_TO_PASS_YARDS                                ; = PPU OFFSET TO PASS YARDS
	JSR CONVERT_TEAM_YARD_VALUE_TO_DEC_SAVE_IN_DRAW_BUFFER       ; CONVERT 2 BYTE NUMBER TO BCD AND SAVE IN DRAW BUFFER(A= PPU ADDR OFFSET)
	
	JSR GET_OFFENSE_RUSH_YARDS                                   ; GET TEAM OFFENSE RUSH YARDS( $6E= TEAM)
	LDA #PPU_OFFSET_TO_RUN_YARDS                                 ; = PPU OFFSET TO RUSH YARDS
	JSR CONVERT_TEAM_YARD_VALUE_TO_DEC_SAVE_IN_DRAW_BUFFER       ; CONVERT 2 BYTE NUMBER TO BCD AND SAVE IN DRAW BUFFER(A= PPU ADDR OFFSET)
	JMP @go_to_next_team
	
@draw_defensive_yards:                                           ; DRAW DEFENSIVE YARDS
	JSR GET_DEFENSE_TOTAL_YARDS                           	 ; GET TEAM DEFENSIVE TOTAL YARDS( $6E= TEAM)  
	LDA #PPU_OFFSET_TO_TOTAL_YARDS                               ; = PPU OFFSET TO TOTAL YARDS
	JSR CONVERT_TEAM_YARD_VALUE_TO_DEC_SAVE_IN_DRAW_BUFFER       ; CONVERT 2 BYTE NUMBER TO BCD AND SAVE IN DRAW BUFFER(A= PPU ADDR OFFSET)
	JSR GET_DEFENSE_PASSING_YARDS                   		 ; GET TEAM DEFENSIVE PASSING YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	LDA #PPU_OFFSET_TO_PASS_YARDS                                                      ; = PPU OFFSET TO PASS YARDS
	JSR CONVERT_TEAM_YARD_VALUE_TO_DEC_SAVE_IN_DRAW_BUFFER       ; CONVERT 2 BYTE NUMBER TO BCD AND SAVE IN DRAW BUFFER(A= PPU ADDR OFFSET)
	JSR GET_DEFENSE_RUSHING_YARDS                         ; GET TEAM DEFENIVE RUSHING YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	LDA #PPU_OFFSET_TO_RUN_YARDS                                                      ; = PPU OFFSET TO RUSH YARDS
	JSR CONVERT_TEAM_YARD_VALUE_TO_DEC_SAVE_IN_DRAW_BUFFER       ; CONVERT 2 BYTE NUMBER TO BCD AND SAVE IN DRAW BUFFER(A= PPU ADDR OFFSET)
	JMP @go_to_next_team                                         ; JUMP-> GO TO NEXT TEAM FOR STANDINGS DRAW

@clear_helmets_remainder_of_screen:                              ; DONE BLANK OUT REMAINDER OF SCREEN
	LDY ppu_addr                                                 ; LOAD CURRENT PPU LOCATION
	LDX ppu_addr+1                                               ;
	LDA #SIZE_OF_RANKING_NUMBER                                  ; SET LENGTH =2 
	STA tiles_per_row
	LDA #ROWS_TO_CLEAR                                           ; SET NUM ROWS= MOST OF SCREEN 
	STA num_rows                                                 ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                              ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	
@go_to_next_team:                                                ; GO TO NEXT TEAM FOR STANDINGS DRAW
	LDA ppu_addr                                                 ; CURRENT PPU LOCATION += TWO ROWS
	CLC                                                          ;
	ADC #(LENGTH_OF_ONE_ROW *2 )                                 ;
	STA ppu_addr                                                 ;
	LDA ppu_addr + 1                                             ;
	ADC #$00                                                     ;
	STA ppu_addr + 1                                             ;
	INC current_team_index                                       ; CURRENT TEAM INDEX ++
	INC teams_drawn                                              ; NUMBER OF TEAMS DRAWN++
	LDA teams_drawn                                              ;
	CMP #TEAMS_PER_PAGE                                          ; ALL TEAMS ON PAGE DRAWN? (11 PER PAGE)
	BCS @exit                                                    ; YES-> UPDATE ATTRIBUTE TABLE AND RETURN
	
_END_WHILE                                                       ; NO-> DRAW TEAM HELMET AND YARDS LOOP

@exit:                                                          ; UPDATE ATTRIBUTE TABLE AND RETURN
	JSR LOAD_BG_ATTR_VALUES_BOTH_SCREENS_FROM_SRAM               ; UPDATE PPU ATTRIBUTE TABLES FROM SRAM BUFFER()
	RTS                                                          ; RETURN

	
temp_result				= LOCAL_3
hex_value_to_convert	= LOCAL_7
dec_result_for_draw		= LOCAL_7
hex_argument_value		= SEGMENT_VAR_8E
	
CONVERT_TEAM_YARD_VALUE_TO_DEC_SAVE_IN_DRAW_BUFFER:             ; CONVERT 2 BYTE NUMBER TO BCD AND SAVE IN DRAW BUFFER(A= PPU ADDR OFFSET)
	PHA                                                          ; SAVE PPU ADDR OFFSET
	LDA hex_argument_value                                      ; LOAD TWO BYTE VALUE
	STA hex_value_to_convert                                     ; 
	LDA hex_argument_value+1                                     ;
	STA hex_value_to_convert+1                                   ;
	JSR HEX_TO_3_DIGIT_DEC                                       ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)
	LDA temp_result                                              ; MOVE NUMBER TO $44,45
	STA dec_result_for_draw	                                          ;
	LDA temp_result+1                                            ;
	STA dec_result_for_draw	+1                                        ;
	PLA                                                          ; LOAD PPU ADDR OFFSET
	JSR ADD_VALUE_TO_TEMP_PPU_ADDR[value]                        ; ADD VALUE TO PPU ADDR (A= VALUE) SAVE IN X,Y
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES                          ; SAVE 4 DIGIT NUMBER TO BUFFER(X,Y= PPU ADDR, $44,45= NUMBER)
	RTS                                                          ; RETURN

_F}_DO_TEAM_YARDAGE_RANKINGS	
	
_F{_GET_YARDS_FOR_TEAM_RANKINGS_FUNCTIONS						 			; DONE

temp_total_yards			= SEGMENT_VAR_8E							 ; 2 bytes
current_roster_id	= SEGMENT_VAR_90
player_yards		= LOCAL_7
	
GET_OFFENSE_TOTAL_YARDS:                                         ; GET TEAM OFFENSE TOTAL YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	JSR GET_OFFENSE_PASS_YARDS                                   ; GET TEAM OFFENSE PASSING YARDS( $6E= TEAM)
	JMP ADD_OFFENSE_RUSH_YARDS                                   ; GET TEAM OFFENSE RUSHING YARDS( $6E= TEAM)

GET_OFFENSE_PASS_YARDS:                                          ; GET TEAM OFFENSE PASSING YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	LDA #$00                                                     ; CLEAR YARDS
	STA temp_total_yards                                               ;
	STA temp_total_yards+1                                             ;
	LDA #QB1_ROSTER_ID                                           ; SET ROSTER ID = QB1
	LDX #QB_PASS_YDS_SEASON_STAT_INDEX                           ; SET STAT ID = QB PASSING YARDS
	JSR ADD_PLAYER_STATS_TO_TOTAL_YARDS                          ; ADD PLAYER STAT TO TOTAL( A= PLAYER ROSTER ID, X= STAT TO GET)
	LDA #QB2_ROSTER_ID                                           ; SET ROSTER ID = QB2
	LDX #QB_PASS_YDS_SEASON_STAT_INDEX                           ; SET STAT ID = QB PASSING YARDS
	JMP ADD_PLAYER_STATS_TO_TOTAL_YARDS                          ; JMP->ADD PLAYER STAT TO TOTAL( A= PLAYER ROSTER ID, X= STAT TO GET)


GET_OFFENSE_RUSH_YARDS:                                          ; GET TEAM OFFENSE RUSHING YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	LDA #$00                                                     ; CLEAR YARDS
	STA temp_total_yards                                               ;
	STA temp_total_yards +1                                            ;
ADD_OFFENSE_RUSH_YARDS:                                          ; GET QB RUSHING YARDS
	LDA #QB1_ROSTER_ID                                           ; SET ROSTER ID = QB1
	LDX #QB_RUSH_YDS_SEASON_STAT_INDEX                           ; SET STAT ID = QB RUSHING YARDS
	JSR ADD_PLAYER_STATS_TO_TOTAL_YARDS                          ; ADD PLAYER STAT TO TOTAL( A= PLAYER ROSTER ID, X= STAT TO GET)
	LDA #QB2_ROSTER_ID                                           ; SET ROSTER ID = QB2
	LDX #QB_RUSH_YDS_SEASON_STAT_INDEX                           ; SET STAT ID = QB RUSHING YARDS
	JSR ADD_PLAYER_STATS_TO_TOTAL_YARDS                          ; ADD PLAYER STAT TO TOTAL( A= PLAYER ROSTER ID, X= STAT TO GET)
	
	
	LDA #RB1_ROSTER_ID                                           ; SET ROSTER ID = RB1
	STA current_roster_id                                        ; 
_WHILE CC                                                        ; GET SKILL PLAYER RUSHING YARDS

	LDA current_roster_id                                        ; LOAD ROSTER ID
	LDX #SKILL_RUN_YDS_SEASON_STAT_INDEX                         ; SET STAT ID = SKILL PLAYER RUSHING YARDS
	JSR ADD_PLAYER_STATS_TO_TOTAL_YARDS                          ; ADD PLAYER STAT TO TOTAL( A= PLAYER ROSTER ID, X= STAT TO GET)
	INC current_roster_id                                        ;
	LDA current_roster_id                                        ;
	CMP #C_ROSTER_ID                                             ; ALL OFFENSIVE SKILL PLAYERS CHECKED? NO-> GET SKILL PLAYER RUSHING YARDS
	
_END_WHILE                                                 		 ;
	RTS                                                          ; RETURN

ADD_PLAYER_STATS_TO_TOTAL_YARDS:                                 ; ADD PLAYER STAT TO TOTAL( A= PLAYER ROSTER ID, X= STAT TO GET)
	JSR SWAP_AND_GET_PLAYER_SEASON_STATS                         ; GET 3 DIGIT PLAYER STATS()
	LDA temp_total_yards                                               ; YARDS TOTAL = YARDS TOTAL + PLAYER YARDS
	CLC                                                          ;
	ADC player_yards                                             ;
	STA temp_total_yards                                               ;
	LDA temp_total_yards+1                                             ;
	ADC player_yards+1                                           ;
	STA temp_total_yards+1                                             ;
	RTS                                                          ; RETURN


team_sram_addr 		=	LOCAL_1	
defensive_yards		= 	LOCAL_7
	
GET_DEFENSE_TOTAL_YARDS:                                  ; GET TEAM DEFENIVE TOTAL YARDS( $6E= TEAM)  RET $8E,8F= YARDS 
	JSR GET_DEFENSE_PASSING_YARDS                         ; GET TEAM DEFENSIVE PASSING YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	LDA temp_total_yards                                               ;
	STA defensive_yards                                                      ;
	LDA temp_total_yards+1                                             ;
	STA defensive_yards+1                                                      ;
	JSR GET_DEFENSE_RUSHING_YARDS                         ; GET TEAM DEFENSIVE RUSHING YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	LDA temp_total_yards                                               ; = DEF PASS YARDS + DEF RUSH YARDS
	CLC                                                          ; 
	ADC defensive_yards                                                      ;
	STA temp_total_yards                                               ;
	LDA temp_total_yards+1                                             ;
	ADC defensive_yards+1                                                      ;
	STA temp_total_yards+1                                              ;
	RTS                                                          ; RETURN

GET_DEFENSE_PASSING_YARDS:                          ; GET TEAM DEFENIVE PASSING YARDS( $6E= TEAM)  RET $8E,8F= YARDS 
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #PASS_YDS_ALLOWED_SEASON_STATS_OFFSET                    ; LOAD TEAM DEFENSIVE PASS YARDS FROM SRAM
	LDA (team_sram_addr),Y                                       ;
	STA temp_total_yards                                         ;
	INY                                                          ;
	LDA (team_sram_addr),Y                                       ;
	STA temp_total_yards+1                                       ;
	BPL @exit                                                   ;

@set_yards_to_zero_if_negative:	
	LDA #$00                                                     ; SET DEFENSIVE PASS YARDS TO 0 IF NEGATIVE
	STA temp_total_yards                                         ;
	STA temp_total_yards+1                                       ;
@exit:                                                          ; EXIT
	RTS                                                          ; RETURN

GET_DEFENSE_RUSHING_YARDS:                                       ; GET TEAM DEFENSIVE RUSHING YARDS( $6E= TEAM)  RET $8E,8F= YARDS
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                                ; LOAD TEAM SEASON STATS SRAM LOCATION IN 3E 3F(A= TEAM ID)
	LDY #RUSH_YDS_ALLOWED_SEASON_STATS_OFFSET                    ; LOAD TEAM DEFENSIVE RUSH YARDS FROM SRAM
	LDA (team_sram_addr),Y                                       ;
	STA temp_total_yards                                                       ; SAVE IN 
	INY                                                          ;
	LDA (team_sram_addr),Y                                       ;
	STA temp_total_yards+1                                                     ;
	BPL @exit                                                   ; SET DEFENSIVE RUSH YARDS TO 0 IF NEGATIVE
	
@set_yards_to_zero_if_negative:		
	LDA #$00                                                     ;
	STA temp_total_yards                                                      ;
	STA temp_total_yards+1                                                     ;
@exit:                                                          ; EXIT
	RTS                                                          ; RETURN
	
_F}_GET_YARDS_FOR_TEAM_RANKINGS_FUNCTIONS	

_F{_SAVE_SEASON_STARTERS_IN_SRAM 							      			; DONE

sram_starter_addr 				= LOCAL_1
temp_starter_byte 				= LOCAL_3

status_check	  				= LOCAL_4								         ; position players checked for starter and injury, kr/pr checked for injury onle				

current_player_id 				= LOCAL_6

offensive_skill_players_info[]	= SEGMENT_VAR_9E								 ; all skill players




OFFSET_TO_QB_SUB_TABLE				= $00
OFFSET_TO_RB_SUB_TABLE				= RB_SUB_ORDER 				- SUB_ORDER_TABLE
OFFSET_TO_WR_SUB_TABLE				= WR_SUB_ORDER 				- SUB_ORDER_TABLE
OFFSET_TO_THREE_FOUR_WR_SUB_TABLE	= THREE_FOUR_WR_SUB_ORDER 	- SUB_ORDER_TABLE
OFFSET_TO_TE_SUB_TABLE				= TE_SUB_ORDER				- SUB_ORDER_TABLE
OFFSET_TO_KR_PR_SUB_TABLE			= KR_PR_SUB_ORDER			- SUB_ORDER_TABLE		

OFFSET_TO_FIRST_STARTERS_BYTE		= P1_GM_STARTERS_START		- P1_GAME_STATS_START   	
OFFSET_TO_SECOND_STARTERS_BYTE		= P1_GM_STARTERS_START		- P1_GAME_STATS_START	+ 1
OFFSET_TO_THIRD_STARTERS_BYTE		= P1_GM_STARTERS_START		- P1_GAME_STATS_START	+ 2
OFFSET_TO_FOURTH_STARTERS_BYTE		= P1_GM_STARTERS_START		- P1_GAME_STATS_START	+ 3


UPDATE_STARTERS_SRAM:                                            ; SET STARTERS IN SRAM BASED ON INJURIES()
	MMC3_SRAM_WRITE_ENABLE 
	JSR GET_P1_P2_GAME_STATS_ADDR                                ; LOAD PLAYER GAME STATS SRAM LOCATION IN 3E 3F()
	LDA #QB1_ROSTER_ID                                          ; SET CURRENT PLAYER = QB1 
	STA current_player_id                                        ;

_WHILE CC                                                        ; SAVE INJURY STATUS IN $9E THROUGH $A9 LOOP
	LDA current_player_id                                        ; LOAD CURRENT PLAYER
	JSR CHECK_IF_PLAYER_INJURED                                  ; CHECK IF PLAYER IS INJURED(A= PLAYER INDEX)

@save_injury_status:	
	LDA #$00                                                     ; SAVE INJURY STATUS (HIGH NIBBLE)+ PLAYER ID(LOW NIBBLE) IN 9E THROUGH A9
	ROR                                                          ;
	ORA current_player_id                                        ;
	LDX current_player_id                                        ;
	STA offensive_skill_players_info[],X                                                    ;
	
@go_to_next_player_check_if_done:	
	INC current_player_id                                        ; CURRENT PLAYER++
	LDA current_player_id                                        ; IS CURRENT PLAYER > LAST OFFENSIVE PLAYER
	CMP #C_ROSTER_ID                                             ; 
	
_END_WHILE                                                       ; NO->LOOP BACK TO SAVE INJURY STATUS IN $9E THROUGH A9 LOOP'
	
	LDA #(PLAYER_IS_INJURED_BITFLAG + PLAYER_IS_STARTER_BITFLAG)                                                     ;
	STA status_check                                             ;
	LDY #OFFSET_TO_QB_SUB_TABLE                                  ; LOAD QB1 DEFAULT SUB ORDER INDEX
	LDA #QB1_ROSTER_ID                                          ; LOAD QB1 ROSTER INDEX
	JSR SET_STARTER_UPPER_NIBBLE                                 ; SET STARTER FIRST NIBBLE ( Y= DEFAULT STARTER INDEX,, A= ROSTER ID START)
	LDY #OFFSET_TO_RB_SUB_TABLE                                  ; LOAD RB1 DEFAULT SUB ORDER INDEX
	LDA #RB1_ROSTER_ID                                           ; LOAD RB1 ROSTER INDEX 
	JSR SET_STARTER_LOWER_NIBBLE                                 ; SET STARTER SECOND NIBBLE( Y= DEFAULT STARTER INDEX, A= ROSTER ID START)
	LDY #OFFSET_TO_FIRST_STARTERS_BYTE                           ; SAVE FIRST STARTER BYTE IN SRAM
	STA (sram_starter_addr),Y                                    ;
	
@check_for_three_four_wr_teams	
	LDA CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	CMP #HOU_TEAM_ID                                                ; IS TEAM == HOUSTON
	BEQ @three_four_wr_sub_check                                 ;
	CMP #SD_TEAM_ID                                               ; IS TEAM = SAN DIEGO
	BEQ @three_four_wr_sub_check                                 ;
	CMP #WAS_TEAM_ID                                              ; IS TEAM = WASHINGTON
	BEQ @three_four_wr_sub_check                                 ;
	CMP #PHX_TEAM_ID                                                  ; IS TEAM = PHOENIX
	BEQ @three_four_wr_sub_check                                 ;
	CMP #DET_TEAM_ID                                                 ; IS TEAM = DETROIT
	BEQ @three_four_wr_sub_check                                 ;
	CMP #ATL_TEAM_ID                                                 ; IS TEAM = ATLANTA
	BEQ @three_four_wr_sub_check                                 ;

	
	LDY #OFFSET_TO_RB_SUB_TABLE                                  ; LOAD RB1 DEFAULT SUB ORDER INDEX
	LDA #RB2_ROSTER_ID                                           ; LOAD RB2 ROSTER INDEX 
	JSR SET_STARTER_UPPER_NIBBLE                                 ; SET STARTER FIRST NIBBLE ( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	LDY #OFFSET_TO_WR_SUB_TABLE                                  ; LOAD WR1 DEFAULT SUB ORDER INDEX
	LDA #WR1_ROSTER_ID                                           ; LOAD WR1 ROSTER ID 
	JSR SET_STARTER_LOWER_NIBBLE                                 ; SET STARTER SECOND NIBBLE( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	LDY #OFFSET_TO_SECOND_STARTERS_BYTE                          ; SAVE SECOND STARTER BYTE IN SRAM
	STA (sram_starter_addr),Y                                    ;
	LDY #OFFSET_TO_WR_SUB_TABLE                                  ; LOAD WR2 DEFAULT SUB ORDER INDEX
	LDA #WR2_ROSTER_ID                                           ; LOAD WR2 ROSTER ID   
	JSR SET_STARTER_UPPER_NIBBLE                                 ; SET STARTER FIRST NIBBLE ( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	JMP @set_wr2_te_starters                                     ;

@three_four_wr_sub_check:                                        ; 3 and 4 WR FORMATIONS CHECK
	LDY #OFFSET_TO_RB_SUB_TABLE                                  ; LOAD RB1 DEFAULT SUB ORDER INDEX
	LDA #RB2_ROSTER_ID                                           ; LOAD RB2 ROSTER INDEX
	JSR SET_STARTER_UPPER_NIBBLE                                 ; SET STARTER FIRST NIBBLE ( Y= DEFAULT STARTER INDEX, A= STARTER ID START
	LDY #OFFSET_TO_THREE_FOUR_WR_SUB_TABLE                       ; LOAD TE DEFAULT SUB ORDER INDEX
	LDA #WR1_ROSTER_ID                                           ; LOAD WR1 ROSTER ID
	JSR SET_STARTER_LOWER_NIBBLE                                 ; SET STARTER SECOND NIBBLE( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	LDY #OFFSET_TO_SECOND_STARTERS_BYTE                          ; SAVE SECOND STARTER BYTE IN SRAM
	STA (sram_starter_addr),Y                                    ; 
	LDY #OFFSET_TO_THREE_FOUR_WR_SUB_TABLE                       ; LOAD TE DEFAULT SUB ORDER INDEX
	LDA #WR2_ROSTER_ID                                           ; LOAD WR2 ROSTER ID
	JSR SET_STARTER_UPPER_NIBBLE                                 ; SET STARTER FIRST NIBBLE ( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	
@set_wr2_te_starters:
	LDY #OFFSET_TO_TE_SUB_TABLE                                  ; 
	LDA #TE1_ROSTER_ID                                           ; LOAD TE ROSTER ID
	JSR SET_STARTER_LOWER_NIBBLE                                 ; SET STARTER SECOND NIBBLE( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	LDY #OFFSET_TO_THIRD_STARTERS_BYTE                           ; SAVE THIRD STARTER BYTE IN SRAM
	STA (sram_starter_addr),Y                                    ;
	
	
	LDA #PLAYER_IS_INJURED_BITFLAG                               ;
	STA status_check                                             ;
	LDX CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	LDA DEFAULT_TEAM_KR_PR_TABLE,X                               ; LOAD DEFAULT KR FROM DEFAULT TEAM KR/PR TABLE
	LOG_SHIFT_RIGHT_4											 ; SHIFT OUT PR 
	LDY #OFFSET_TO_KR_PR_SUB_TABLE                               ; LOAD KR/PR DEFAULT SUB ORDER INDEX
	JSR SET_STARTER_UPPER_NIBBLE                                 ; SET STARTER FIRST NIBBLE ( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	LDX CURRENT_TEAM                                             ; LOAD CURRENT TEAM
	LDA DEFAULT_TEAM_KR_PR_TABLE,X                               ; LOAD DEFAULT PR FROM DEFAULT TEAM KR/PR TABLE
	AND #$0F                                                     ; MASK OUT KR NIBBLE
	LDY #OFFSET_TO_KR_PR_SUB_TABLE                               ; LOAD KR/PR DEFAULT SUB ORDER INDEX
	JSR SET_STARTER_LOWER_NIBBLE                                 ; SET STARTER SECOND NIBBLE( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	LDY #OFFSET_TO_FOURTH_STARTERS_BYTE                          ; SAVE FOURTH STARTER BYTE IN SRAM
	STA (sram_starter_addr),Y                                    ;
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                          ; RETURN

	

	
SET_STARTER_UPPER_NIBBLE:                                        ; SET STARTER FIRST NIBBLE ( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	JSR CHECK_STARTER_INJURED_SAVE_STARTER_STATUS                ; CHECK FOR STARTER INJURED()
	SHIFT_LEFT_4                                                 ; SHIFT PLAYER ID INTO HIGH NIBBLE OF TEMP STARTER BYTE
	STA temp_starter_byte                                        ; 
	RTS                                                          ; RETURN

SET_STARTER_LOWER_NIBBLE:                                        ; SET STARTER SECOND NIBBLE( Y= DEFAULT STARTER INDEX, A= STARTER ID START)
	JSR CHECK_STARTER_INJURED_SAVE_STARTER_STATUS                ; CHECK FOR STARTER INJURED()
	ORA temp_starter_byte                                        ; SAVE STARTER ID IN LOW NIBBLE TEMP STARTER BYTE (EACH STARTER IS ONE NIBBLE)
	RTS                                                          ; RETURN

CHECK_STARTER_INJURED_SAVE_STARTER_STATUS:                       ; CHECK FOR STARTER INJURED 
	TAX                                                          ; LOAD PLAYER INDEX
	LDA offensive_skill_players_info[],X                                                    ; IS STARTER STATUS = INJURED
	BPL @set_starter_status                                      ; NO->SET PLAYER INJURED/STARTER STATUS AS STARTER
	
_WHILE NOT_EQUAL

	INY                                                          ; DEFAULT STARTER INDEX++
	LDX SUB_ORDER_TABLE-1,Y                                      ; LOAD NEXT POSSIBLE STARTER FROM DEFAULT SUBSTITUTION ORDER
	LDA offensive_skill_players_info[],X                                                    ; IS PLAYER ALREADY A STARTER / injured. KRPR only checks for injury
	AND status_check                                             ; 
	
_END_WHILE

@set_starter_status:                                             ; SAVE PLAYER INJURED/STARTER STATUS AS STARTER
	LDA offensive_skill_players_info[],X                         ; SET PLAYER STATUS TO STARTER
	ORA #PLAYER_IS_STARTER_BITFLAG                               ;
	STA offensive_skill_players_info[],X                          ;
	AND #$1F                                                     ; MASK OUT STATUS 
	RTS                                                          ; RETURN 

_F}_SAVE_SEASON_STARTERS_IN_SRAM 

_F{_DATA														  			; DONE                
	
RANKINGS_POINTER_SPRITE_DATA:							         ; RANKINGS_POINTER_SPRITE
	.BYTE $28                                                    ; Y LOCATION
	.BYTE $00,$02                                                ; ATTRIBUTES, PAL
	.BYTE $78                                                    ; X LOCATION DEFAULT = TOTAL
	
RANKING_ARROW_X_LOCATIONS
	.BYTE $78, $A8, $D0                                          ; X LOCATIONS (TOTAL, PASS, RUSH)

TOTAL_YARDS_SORTING_TABLE:                                        ; FIRST TEAM, LAST TEAM +1, FUNCTION ADDR

@offense_nfl
	.BYTE BUF_TEAM_ID,ATL_TEAM_ID+1
	.WORD GET_OFFENSE_TOTAL_YARDS               
	
@offense_afc:	
	.BYTE BUF_TEAM_ID,SEA_TEAM_ID+1
	.WORD GET_OFFENSE_TOTAL_YARDS                
	
@offense_nfc:	
	.BYTE WAS_TEAM_ID,ATL_TEAM_ID+1 
	.WORD GET_OFFENSE_TOTAL_YARDS                
	
@defense_nfl:	
	.BYTE BUF_TEAM_ID,ATL_TEAM_ID+1 
	.WORD GET_DEFENSE_TOTAL_YARDS     			

@defense_afc:	
	.BYTE BUF_TEAM_ID,SEA_TEAM_ID+1 
	.WORD GET_DEFENSE_TOTAL_YARDS  				
	
@defense_nfc:	
	.BYTE WAS_TEAM_ID,ATL_TEAM_ID+1 
	.WORD GET_DEFENSE_TOTAL_YARDS    			           
	

	
TEAM_YARDS_RANKING_FUNCTION_ADDR_TABLE:                          ; TEAM RANKINGS STAT FUNCTION ADDRESSES
																 ; SORT ORDER FUNCTION ADDR
	.WORD GET_OFFENSE_TOTAL_YARDS                                ; OFF TOTAL YARDS
	.WORD GET_OFFENSE_PASS_YARDS                                 ; OFF PASS YARDS
	.WORD GET_OFFENSE_RUSH_YARDS                                 ; OFF RUSH YARDS
		
	.WORD GET_DEFENSE_TOTAL_YARDS                              ; DEF TOTAL YARDS
	.WORD GET_DEFENSE_PASSING_YARDS                 		 ; DEF PASS YARDS
	.WORD GET_DEFENSE_RUSHING_YARDS                       ; DEF RUSH YARDS


SUB_ORDER_TABLE:                                                ; DEFAULT SUBSTITUTION ORDER

QB_SUB_ORDER:																; QB SUB ORDER
	.DB QB2_ROSTER_ID
	
RB_SUB_ORDER:																; RB SUBS ORDER
	.DB RB3_ROSTER_ID , RB4_ROSTER_ID , WR3_ROSTER_ID, WR4_ROSTER_ID, TE2_ROSTER_ID, RB1_ROSTER_ID, RB2_ROSTER_ID, WR1_ROSTER_ID, WR2_ROSTER_ID, TE1_ROSTER_ID

WR_SUB_ORDER:																; WR SUBS ORDER
	.DB WR3_ROSTER_ID, WR4_ROSTER_ID, TE2_ROSTER_ID, RB3_ROSTER_ID, RB4_ROSTER_ID, RB1_ROSTER_ID, RB2_ROSTER_ID, WR1_ROSTER_ID, WR2_ROSTER_ID, TE1_ROSTER_ID

THREE_FOUR_WR_SUB_ORDER:													; 3 AND 4 WR SUBS ORDER
	.DB WR4_ROSTER_ID, TE2_ROSTER_ID, RB3_ROSTER_ID, RB4_ROSTER_ID, WR3_ROSTER_ID, RB1_ROSTER_ID, RB2_ROSTER_ID, WR1_ROSTER_ID, WR2_ROSTER_ID, TE1_ROSTER_ID
	
TE_SUB_ORDER:																; TE SUBS ORDER
	.DB TE2_ROSTER_ID, RB3_ROSTER_ID, RB4_ROSTER_ID, WR3_ROSTER_ID, WR4_ROSTER_ID, RB1_ROSTER_ID, RB2_ROSTER_ID, WR1_ROSTER_ID, WR2_ROSTER_ID, TE1_ROSTER_ID

KR_PR_SUB_ORDER																; KR/PR SUBS ORDER
	.DB RB3_ROSTER_ID, RB4_ROSTER_ID, WR3_ROSTER_ID, WR4_ROSTER_ID, TE2_ROSTER_ID, WR1_ROSTER_ID, WR2_ROSTER_ID, TE1_ROSTER_ID, RB1_ROSTER_ID, RB2_ROSTER_ID

DEFAULT_TEAM_KR_PR_TABLE:                                        ; TEAM DEFAULT KR,PR (each nibble)
	.DB $59
	.DB $88
	.DB $49
	.DB $96
	.DB $88
	.DB $58
	.DB $37
	.DB $BB
	.DB $97
	.DB $66
	.DB $48
	.DB $88
	.DB $88
	.DB $55
	.DB $89
	.DB $33
	.DB $97
	.DB $55
	.DB $96
	.DB $55
	.DB $55
	.DB $89
	.DB $28
	.DB $89
	.DB $46
	.DB $46
	.DB $55
	.DB $57

MAIN_MENU_OPTIONS_DATA:                                          ; MAIN_MENU_SELECT ARROW ATTRIBUTES AND Y LOCATIONS
	.DB $00,$00,$28                                              ; ARROW TILE, PAL, X
	.DB $04                                                      ; # CHOICES 
	.DB $50, $60, $70, $80                                       ; Y LOCATIONS

PRESEASON_MENU_OPTIONS_DATA:                                     ; PRESEASON_MENU ARROW ATTRIBUTES AND Y LOCATIONS
	.DB $00,$00,$30                                              ; ARROW TILE, PAL, X
	.DB $06                                                      ; # CHOICES              
	.DB $60, $70, $80, $90, $A0, $B0                             ; Y LOCATIONS

SEASON_MENU_OPTIONS_DATA:                                        ; SEASON_MENU_SELECT
	.DB $00,$00,$68                                              ; ARROW TILE, PAL, X
	.DB $07                                                      ; # CHOICES 
	.DB $50, $60, $70, $80, $90, $A0, $B0                        ; Y LOCATIONS

SCHEDULE_MENU_OPTIONS_DATA:                                      ; SCHEDULE_MENU_OPTIONS_DATA
	.DB $00,$00,$18                                              ; ARROW TILE, PAL, X
	.DB $03                                                      ; # CHOICES 
	.DB $30, $40, $50                                            ; Y LOCATIONS

SCHEDULE_RESET_MENU_OPTIONS_DATA:                                ; SCHEDULE_RESET_MENU_OPTIONS_DATA
	.DB $00,$00,$68                                              ; ARROW TILE, PAL, X
	.DB $02                                                      ; # CHOICES 
	.DB $80, $90                                                 ; Y LOCATIONS 

SCHEDULE_RESET_VERIFY_MENU_OPTIONS_DATA:                         ; SCHEDULE_RESET_VERIFY_MENU_OPTIONS_DATA
	.DB $00,$00,$B8                                              ; ARROW TILE, PAL, X
	.DB $02                                                      ; # CHOICES
	.DB $A0, $B0                                                 ; Y LOCATIONS 


PRO_BOWL_MENU_OPTIONS_DATA:                                      ; PRO_BOWL_MENU_OPTIONS_DATA
	.DB $00,$00,$30                                              ; ARROW TILE, PAL, X
	.DB $06                                                      ; # CHOICES
	.DB $80, $90, $A0, $B0, $C0, $D0                             ; Y LOCATIONS 

TEAM_DATA_MENU_OPTIONS_DATA:                                     ; TEAM_DATA_MENU_OPTIONS_DATA:                
	.DB $00,$00,$80                                              ; ARROW TILE, PAL, X
	.DB $04                                                      ; # CHOICES
	.DB $50, $58, $60, $68                                       ; Y LOCATIONS

TEAM_PLAYER_SELECT_PG1_PG3_MENU_OPTIONS_DATA: 
																; TEAM_PLAYER_SELECT1
	.DB $00,$00,$38                                              ; ARROW TILE, PAL, X
	.DB $0B                                                      ; # CHOICES
	.DB $88, $90, $98, $A0, $A8, $B0, $B8, $C0, $C8, $D0, $D8    ; Y LOCATIONS

TEAM_PLAYER_SELECT_PG2_MENU_OPTIONS_DATA:
																; TEAM_PLAYER_SELECT2
	.DB $00,$00,$38                                              ; ARROW TILE, PAL, X
	.DB $08                                                      ; # CHOICES
	.DB $88, $90, $98, $A0, $A8, $B0, $C8, $D8                   ; Y LOCATIONS



TWO_WR_STARTER_MENU_OPTIONS_DATA:								 ; TWO_BACK_STARTER_SELECT
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $09                                                      ; # CHOICES															
	.DB $50, $60, $70, $78, $88, $90, $A0, $C0, $D0				 ; Y LOCATIONS

FOUR_WR_STARTER_MENU_OPTIONS_DATA:								 ; RUN_AND_SHOOT_STARTER_SELECT
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $09                                                      ; # CHOICES															
	.DB $50, $60, $70, $80, $88, $90, $98, $C0, $D0				 ; Y LOCATIONS

THREE_WR_STARTER_MENU_OPTIONS_DATA:								 ; THREE_WIDE_STARTER_SELECT
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $09                                                      ; # CHOICES
	.DB $50, $60, $70, $80, $88, $90, $A0, $C0, $D0				 ; Y LOCATIONS

STARTER_RESET_SELECT_MENU_DATA:									; STARTER_RESET_SELECT_MENU_DATA
	.DB $80,$00,$30                                              ; ARROW TILE, PAL, X
	.DB $02                                                      ; # CHOICES 															 
	.DB $70, $80												 ; Y LOCATIONS   

QB_RESERVE_ARROW_SPR_DATA:									; QB_RESERVE_ARROW_SPR_DATA
	.DB $60                                                      ; Y LOCATION
	.DB $80,$00,$98                                              ; ARROW TILE, PAL, X


TWO_WR_RESERVE_MENU_OPTIONS_DATA: 								 ; TWO_BACK_RESERVE_SELECT
	.DB $80,$00,$98                                              ; ARROW TILE, PAL, X
	.DB $05                                                      ; # CHOICES
    .DB $78, $80, $A0, $A8, $C8									 ; Y LOCATIONS

FOUR_WR_RESERVE_MENU_OPTIONS_DATA: 							 	; RUN_AND_SHOOT_RESERVE_SELECT
	.DB $80,$00,$98                                              ; ARROW TILE, PAL, X
	.DB $05                                                      ; # CHOICES
	.DB $78, $80, $88, $A0, $A8									 ; Y LOCATIONS

THREE_WR_RESERVE_MENU_OPTIONS_DATA: 							; THREE_WIDE_RESERVE_SELECT
	.DB $80,$00,$98                                              ; ARROW TILE, PAL, X
	.DB $05                                                      ; # CHOICES
	.DB $78, $80, $88, $A0, $C8									 ; Y LOCATIONS

TWO_WR_RETURNER_MENU_OPTIONS_DATA:								 ; TWO_BACK_RETURNER_SELECT
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $05                                                      ; # CHOICES
	.DB $70, $78, $88, $90, $A0									; Y LOCATIONS

THREE_WR_RETURNER_MENU_OPTIONS_DATA:							; THREE_WIDE_RETURNER_SELECT
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $05                                                      ; # CHOICES
	.DB $70, $80, $88, $90, $A0  								 ; Y LOCATIONS 

FOUR_WR_RETURNER_MENU_OPTIONS_DATA								; RUN_AND_SHOOT_RETURNER_SELECT
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $05                                                      ; # CHOICES
	.DB $70, $80, $88, $90, $98                                  ; Y LOCATIONS

TWO_WR_IN_GAME_STARTER_MENU_OPTIONS_DATA:						 ; TWO_BACK_GAME_STARTER_SELECT
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $08                                                      ; # CHOICES
	.DB $60, $70, $78, $88, $90, $A0, $C0, $D0 					 ; Y LOCATIONS

FOUR_WR_IN_GAME_STARTER_MENU_OPTIONS_DATA:						 ; RUN_AND_SHOOT_GAME_STARTER_SELECT
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $08                                                      ; # CHOICES
	.DB $60, $70, $80, $88, $90, $98, $C0, $D0					 ; Y LOCATIONS

THREE_WR_IN_GAME_STARTER_MENU_OPTIONS_DATA:
	.DB $80,$00,$20                                              ; ARROW TILE, PAL, X
	.DB $08                                                      ; # CHOICES 
	.DB $60, $70, $80, $88, $90, $A0, $C0, $D0					 ; Y LOCATIONS

STANDINGS_MENU_OPTIONS_DATA:									; STANDINGS_MENU_OPTIONS_DATA
	.DB $00,$00                                                  ; ARROW TILE, PAL
	.DB $03,$03                                                  ; MENU SIZE Y,X

	.DB $A0,$48                                                  ; ARROW DESTINATIONS
	.DB $A0,$78
	.DB $A0,$C0
	.DB $B0,$48
	.DB $B0,$78
	.DB $B0,$C0
	.DB $C0,$48
	.DB $FF,$FF
	.DB $FF,$FF

RANKINGS_MENU_OPTIONS_DATA:										; RANKINGS_MENU
	.DB $00,$00                                                  ; ARROW TILE, PAL
	.DB $02,$03                                                  ; MENU SIZE Y,X

	.DB $B0,$70                                                  ; ARROW DESTINATIONS
	.DB $B0,$98
	.DB $B0,$C0
	.DB $D0,$70
	.DB $D0,$98
	.DB $D0,$C0

LEADERS_MENU_OPTIONS_DATA:										; LEADERS_MENU_OPTIONS_DATA
	.DB $00,$00                                                  ; ARROW TILE, PAL     
	.DB $0C,$03                                                  ; MENU SIZE Y,X
						
	.DB $30,$18                                                  ; ARROW DESTINATIONS
	.DB $30,$68
	.DB $30,$C0
	.DB $38,$18
	.DB $38,$68
	.DB $38,$C0
	.DB $40,$18
	.DB $40,$68
	.DB $40,$C0
	.DB $60,$18
	.DB $FF,$FF
	.DB $60,$C0
	.DB $68,$18
	.DB $FF,$FF
	.DB $68,$C0
	.DB $70,$18
	.DB $FF,$FF
	.DB $70,$C0
	.DB $90,$18
	.DB $FF,$FF
	.DB $90,$C0
	.DB $98,$18
	.DB $FF,$FF
	.DB $98,$C0
	.DB $A0,$18
	.DB $FF,$FF
	.DB $A0,$C0
	.DB $C0,$28
	.DB $FF,$FF
	.DB $C0,$98
	.DB $C8,$28
	.DB $FF,$FF
	.DB $C8,$98
	.DB $D0,$28
	.DB $FF,$FF
	.DB $D0,$98

MINI_HELMET_ARROW_MENU_INFO:                                     ; TEAM_DATA ROSTER_MENU
	.DB $00,$02                                                  ; ARROW TILE, PAL
	.DB $0C,$03                                                  ; MENU SIZE Y,X
																 ; ARROW DESTINATIONS
																 
	.DB $20,$20                 								 ; AFC PRO BOWL                                   
	.DB $FF,$FF
	.DB $FF,$FF

	.DB $30,$20													 ; NFC PRO BOWL	
	.DB $FF,$FF
	.DB $FF,$FF

	.DB $48,$20													 ; BUF
	.DB $48,$70													 ; CIN
	.DB $48,$C0													 ; DEN

	.DB $58,$20													 ; IND
	.DB $58,$70													 ; CLE
	.DB $58,$C0													 ; K.C		

	.DB $68,$20 	                                             ; MIA
	.DB $68,$70													 ; HOU	
	.DB $68,$C0													 ; RAI

	.DB $78,$20													 ; N.E
	.DB $78,$70													 ; PIT
	.DB $78,$C0													 ; SD

	.DB $88,$20													 ; JETS
	.DB $FF,$FF													 ; N/A
	.DB $88,$C0													 ; SEA

	.DB $98,$20													 ; WAS
	.DB $98,$70													 ; CHI
	.DB $FF,$FF													 ; N/A

	.DB $A8,$20													 ; NYG	
	.DB $A8,$70													 ; DET
	.DB $A8,$C0													 ; SF

	.DB $B8,$20													 ; PHI
	.DB $B8,$70													 ; GB 
	.DB $B8,$C0													 ; RAMS	

	.DB $C8,$20													 ; PHX 
	.DB $C8,$70													 ; MIN
	.DB $C8,$C0													 ; NO 

	.DB $D8,$20													 ; DAL
	.DB $D8,$70												     ; TB
	.DB $D8,$C0													 ; ATL

END_OF_GAME_SCROEBOARD_IRQ_INFO:	
SMALL_LARGE_LETTERS_LOGO_IRQ_INFO:                               ; IRQ SPLIT SCREEN DEFAULT BG CHR BANKS
	.DB $00                                                      ; XSCROLL  
	.DB $00
	.DB $18                                                      ; BG_CHAR BANK 0000
	.DB $1A                                                      ; BG_CHAR BANK 0800
	.DB $00                                                      ; IRQ COUNTER

IRQ_DATA_RUN_PB_CHANGE:                                          ; IRQ SPLIT SCREEN RUN PLAYBOOK CHANGE
	.DB $00                                                      ; XSCROLL     
	.DB $00                                                      ;
	.DB $20                                                      ; BG_CHAR BANK 0000
	.DB $22                                                      ; BG_CHAR BANK 0800
	.DB $90                                                      ; IRQ COUNTER 
	
	.DB $20                                                      ; XSCROLL  
	.DB $00                                                      ;
	.DB $20                                                      ; BG_CHAR BANK 0000
	.DB $22                                                      ; BG_CHAR BANK 0800
	.DB $00                                                      ; IRQ COUNTER

IRQ_DATA_PASS_PB_CHANGE:                                         ; IRQ SPLIT SCREEN PASS PLAYBOOK CHANGE
	.DB $00                                                      ; XSCROLL
	.DB $00                                                      ;
	.DB $20                                                      ; BG_CHAR BANK 0000
	.DB $22                                                      ; BG_CHAR BANK 0800
	.DB $20                                                      ; IRQ COUNTER
	
	.DB $20                                                      ; XSCROLL
	.DB $00                                                      ;
	.DB $20                                                      ; BG_CHAR BANK 0000
	.DB $22                                                      ; BG_CHAR BANK 0800
	.DB $50                                                      ; IRQ COUNTER

	.DB $00                                                      ; XSCROLL
	.DB $00                                                      ;
	.DB $20                                                      ; BG_CHAR BANK 0000
	.DB $22                                                      ; BG_CHAR BANK 0800
	.DB $00                                                      ; IRQ COUNTER

IRQ_DATA_MATCHUP_SCREEN:                                         ; IRQ SPLIT SCREEN FOR PRE-GAME MATCHUP SCREEN

																 ; HOME TEAM HELMET
	.DB $00                                                      ; X SCROLL
	.DB $00                                                      ;
	.DB $18                                                      ; CHR $0000 BANK
	.DB $2A                                                      ; CHR $0800 BANK
	.DB $48                                                      ; IRQ COUNTER

																; HOME TEAM TEXT
	.DB $00                                                      ;
	.DB $00
	.DB $18
	.DB $1A
	.DB $30

	.DB $00                                                      ; AWAY TEAM HELMET
	.DB $00
	.DB $18
	.DB $2A
	.DB $40

	.DB $00                                                      ; AWAY TEAM TEXT
	.DB $00
	.DB $18
	.DB $1A

																; MINI_HELMETS TILE INDEXES + BACKGROUND PALLETE TABLE 
																; (TOP LEFT, TOP RIGHT, BOTTOM LEFT, BOTTOM RIGHT, SPECIAL TILE?)
MINI_HELMETS_BG_TILES_TABLE:																
	.DB $94,$95,$96,$8B,$00   
	.DB $88,$89,$8A,$8B,$00
	.DB $C0,$C1,$AB,$83,$07
	.DB $90,$99,$9A,$9B,$00
	.DB $BC,$BD,$97,$8B,$3B
	.DB $A8,$A9,$AA,$8B,$01
	.DB $CC,$CD,$CE,$00,$09
	.DB $98,$99,$9A,$9B,$00
	.DB $8F,$89,$8A,$8B,$0D
	.DB $9E,$9F,$A2,$8B,$00
	.DB $9C,$9D,$97,$8B,$00
	.DB $B0,$B1,$B2,$9B,$01
	.DB $BA,$BB,$82,$83,$02
	.DB $86,$87,$82,$83,$10
	.DB $93,$A1,$A2,$8B,$16
	.DB $A0,$A1,$A2,$8B,$00
	.DB $BE,$BF,$97,$00,$1B
	.DB $8C,$8D,$8E,$83,$1C
	.DB $80,$81,$82,$83,$00
	.DB $8F,$89,$8A,$8B,$21
	.DB $84,$85,$82,$83,$00
	.DB $A3,$A7,$B7,$9B,$27
	.DB $D2,$D3,$00,$00,$2A
	.DB $AE,$AF,$B3,$83,$2D
	.DB $A4,$A5,$A6,$83,$30
	.DB $B4,$B5,$B6,$83,$02
	.DB $AC,$AD,$A2,$8B,$31
	.DB $8F,$89,$8A,$8B,$35

MINI_HELMET_SPECIAL_SIZE_TABLE																; MINI_HELMET_SPECIAL_SIZE:
																; INDEX TO TILE START 
	.DB <MHS_1-$51, <MHS_2-$51, <MHS_3-$51, <MHS_4-$51, <MHS_5-$51
	.DB <MHS_6-$51, <MHS_7-$51, <MHS_8-$51, <MHS_9-$51, <MHS_A-$51
	.DB <MHS_B-$51, <MHS_C-$51, <MHS_D-$51, <MHS_E-$51, <MHS_F-$51

																; MINI_HELMET_SPECIAL TILES:
MINI_HELMET_SPR_TILES_TABLE:								    ; Y OFFSET,TILE,PAL/LAY,X OFFSET

MHS_1: .DB $00,$C7,$01,$00
MHS_2: .DB $00,$B9,$03,$00, $00,$A1,$03,$08, $08,$A2,$03,$00, $08,$8B,$03,$08
MHS_3: .DB $01,$D0,$02,$FC, $00,$D1,$02,$04
MHS_4: .DB $00,$C2,$00,$00
MHS_5: .DB $00,$CB,$21,$00, $00,$C9,$21,$08, $08,$CA,$21,$00
MHS_6: .DB $00,$C3,$00,$06, $08,$CF,$00,$00, $08,$9B,$00,$08
MHS_7: .DB $00,$C6,$01,$00
MHS_8: .DB $00,$C4,$01,$00
MHS_9: .DB $00,$C8,$22,$00, $00,$C9,$22,$08, $08,$CA,$22,$00
MHS_A: .DB $00,$8F,$20,$00, $00,$89,$20,$08, $08,$8A,$20,$00, $08,$8B,$20,$08
MHS_B: .DB $00,$C8,$23,$00, $00,$C9,$23,$08, $08,$CA,$23,$00
MHS_C: .DB $00,$C8,$22,$00, $00,$C9,$22,$08, $08,$CA,$22,$00
MHS_D: .DB $00,$C5,$03,$01
MHS_E: .DB $00,$FC,$01,$00, $00,$FD,$01,$08, $08,$FE,$01,$00, $08,$FF,$01,$08
MHS_F:

MINI_HELMETS_TEAM_CONTROL_SELECT_SPR_Y_X:                              ; MINI_HELMETS_TEAM_CONTROL(Y,X LOCATIONS)
	.DB $30,$08
	.DB $40,$08
	.DB $50,$08
	.DB $60,$08
	.DB $70,$08

	.DB $30,$30
	.DB $40,$30
	.DB $50,$30
	.DB $60,$30

	.DB $30,$58
	.DB $40,$58
	.DB $50,$58
	.DB $60,$58
	.DB $70,$58

	.DB $90,$08
	.DB $A0,$08
	.DB $B0,$08
	.DB $C0,$08
	.DB $D0,$08

	.DB $90,$30
	.DB $A0,$30
	.DB $B0,$30
	.DB $C0,$30
	.DB $D0,$30

	.DB $90,$58
	.DB $A0,$58
	.DB $B0,$58
	.DB $C0,$58

MINI_HELMET_SPR_LOCATIONS:                                       ; TEAM DATA,SKP MODE MINI_HELMETS_TEAM_CONTROL(Y,X LOCATIONS)
	.DB $40,$08                                                  ; BUF
	.DB $50,$08                                                  ; IND
	.DB $60,$08                                                  ; MIA
	.DB $70,$08                                                  ; NE
	.DB $80,$08                                                  ; NYJ
	
	.DB $40,$30                                                  ; CIN
	.DB $50,$30                                                  ; CLE
	.DB $60,$30                                                  ; HOU
	.DB $70,$30                                                  ; PIT
	
	.DB $40,$58                                                  ; DEN
	.DB $50,$58                                                  ; KC
	.DB $60,$58                                                  ; RAI
	.DB $70,$58                                                  ; SD
	.DB $80,$58                                                  ; SEA
	
	.DB $90,$08                                                  ; WAS
	.DB $A0,$08                                                  ; GIA
	.DB $B0,$08                                                  ; PHI
	.DB $C0,$08                                                  ; PHX
	.DB $D0,$08                                                  ; DAL
	
	.DB $90,$30                                                  ; CHI
	.DB $A0,$30                                                  ; DET
	.DB $B0,$30                                                  ; GB
	.DB $C0,$30                                                  ; MIN
	.DB $D0,$30                                                  ; TB
	
	.DB $A0,$58                                                  ; SF
	.DB $B0,$58                                                  ; RAMS
	.DB $C0,$58                                                  ; NO 
	.DB $D0,$58                                                  ; ATL

	.DB $0F,$25,$0F,$30, $0F,$0F,$0F,$29, $0F,$0F,$0F,$0F, $0F,$0F,$0F,$0F
	.DB $0F,$0F,$0F,$0F, $0F,$0F,$0F,$0F, $0F,$0F,$0F,$30, $0F,$0F,$0F,$25

LARGE_HELMET_COLORS:                                            ; LARGE HELMET_COLORS
																; BG shell lining inner, BG shell lining middle, BG shell lining color outer, SPR facemask outline, SPR facemask middle, SPR logo 1, SPR logo 2, SPR logo 3
	.DB $30,$16,$12,$10,$30,$30,$12,$26
	.DB $12,$30,$12,$10,$30,$12,$00,$00
	.DB $2C,$30,$26,$1C,$2C,$2C,$26,$00
	.DB $25,$30,$12,$15,$25,$12,$25,$00
	.DB $2B,$1B,$0B,$0F,$00,$30,$00,$00
	.DB $26,$16,$0F,$0F,$00,$26,$00,$30
	.DB $02,$26,$30,$10,$30,$36,$30,$00
	.DB $25,$30,$21,$15,$25,$25,$21,$00
	.DB $12,$02,$18,$02,$12,$28,$30,$25
	.DB $30,$12,$15,$10,$30,$22,$15,$30
	.DB $26,$16,$06,$10,$30,$0F,$30,$00
	.DB $32,$10,$00,$00,$10,$10,$30,$0F
	.DB $22,$12,$02,$12,$22,$28,$30,$00
	.DB $30,$31,$10,$11,$21,$11,$30,$2A
	.DB $30,$15,$18,$18,$28,$0F,$30,$27
	.DB $15,$12,$05,$10,$30,$22,$00,$30
	.DB $2B,$1B,$0B,$10,$30,$32,$30,$31
	.DB $30,$30,$10,$10,$31,$06,$0F,$28
	.DB $12,$31,$30,$00,$31,$12,$30,$22
	.DB $12,$02,$01,$02,$12,$15,$30,$22
	.DB $11,$10,$30,$11,$21,$32,$30,$11
	.DB $0B,$28,$30,$0B,$1B,$0B,$1B,$30
	.DB $23,$13,$03,$03,$13,$28,$30,$23
	.DB $15,$30,$26,$15,$26,$15,$26,$00
	.DB $15,$27,$30,$10,$30,$0F,$30,$15
	.DB $28,$03,$13,$03,$13,$13,$38,$23
	.DB $0F,$18,$30,$0F,$00,$0F,$30,$28
	.DB $12,$02,$01,$02,$12,$22,$30,$12

HELMET_SHELLS:															
	.DB $40, $40, $40, $40, $41, $43, $40, $40, $41, $40, $41, $41, $41, $41
	.DB $40, $40, $41, $40, $40, $41, $40, $40, $41, $40, $40, $42, $40, $40

HELMET_DECALS:														
	.DB $3E, $3D, $3F, $40, $31, $32, $33, $34, $35, $36, $37, $41, $42, $3A
	.DB $45, $3C, $43, $44, $3B, $46, $47, $48, $49, $4A, $4E, $4C, $4D, $4B

TEAM_MATCHUP_SELECT_MENU_INFO:												
	.DB $27,$02                                                  ; LEFT RECTAGNLE OF ARROW TILE, PALLETE

	.DB $0A,$03                                                  ; Y MENU SIZE, X MENU SIZE
	
	.DB $38,$18                                                  ; ARROW DESTINATIONS
	.DB $38,$68
	.DB $38,$B8
	.DB $48,$18
	.DB $48,$68
	.DB $48,$B8
	.DB $58,$18
	.DB $58,$68
	.DB $58,$B8
	.DB $68,$18
	.DB $68,$68
	.DB $68,$B8
	.DB $78,$18
	.DB $FF,$FF
	.DB $78,$B8
	.DB $98,$18
	.DB $98,$68
	.DB $98,$B8
	.DB $A8,$18
	.DB $A8,$68
	.DB $A8,$B8
	.DB $B8,$18
	.DB $B8,$68
	.DB $B8,$B8
	.DB $C8,$18
	.DB $C8,$68
	.DB $C8,$B8
	.DB $D8,$18
	.DB $D8,$68
	.DB $FF,$FF

MAN_V_MAN_TEAM_CHOICE_ARROWS_SPR_TABLE:                          ;  MAN VS MAN ARROW SPRITE TABLE
	.DB $48,$2C,$02,$18                                          ;  Y, P1 ARROW TILE, ATTRIB, X     
	.DB $48,$2D,$02,$20                                          ;  Y, P2 ARROW TILE, ATTRIB, X
	

NFL_SHIELD_SPRITE_TABLE:                                         ; NFL_SHIELD_SPRITE TABLE
																; TWO BYTE ENTRIES (TILE ID, TILE ATTRIBS)   
	.DB $80,$00,$80,$00,$00,$18,$00,$19,$80,$00,$80,$00,$80,$00
	.DB $00,$1A,$00,$1B,$02,$46,$02,$47,$00,$1E,$00,$1F,$80,$00
	.DB $00,$1C,$00,$49,$00,$4C,$00,$4D,$00,$58,$00,$0C,$00,$14
	.DB $00,$1D,$00,$4B,$00,$4E,$00,$4F,$00,$4B,$00,$73,$00,$15
	.DB $00,$0E,$01,$60,$01,$61,$01,$64,$01,$65,$00,$5A,$00,$15
	.DB $00,$0E,$01,$62,$01,$63,$01,$66,$01,$67,$00,$5A,$00,$15
	.DB $00,$0E,$01,$51,$01,$63,$01,$54,$01,$55,$00,$5A,$00,$15
	.DB $00,$0F,$01,$56,$01,$57,$01,$59,$01,$5C,$00,$5D,$00,$15
	.DB $80,$00,$00,$0D,$00,$76,$00,$77,$00,$71,$00,$13,$00,$16
	.DB $80,$00,$80,$00,$00,$17,$00,$10,$00,$11,$00,$12,$80,$00

PLAYBOOK_FLASH_CONTROLLER_TILE_DATA:							; PLAYBOOK_FLASH_CONTROLLER (SPR_TILE, )
	.DB $50,$51,$54,$55,$52,$53,$BA,$BB

																; DIVISIONS_INFO_TABLE
DIVISIONS_INFO_TABLE:													; FIRST TEAM IN DIVISION ID, # OF TEAMS
	.DB BUF_TEAM_ID, 		AFCE_NUM_TEAMS
	.DB CIN_TEAM_ID, 		AFCC_NUM_TEAMS
	.DB DEN_TEAM_ID, 		AFCW_NUM_TEAMS
	.DB WAS_TEAM_ID, 		NFCE_NUM_TEAMS
	.DB CHI_TEAM_ID, 		NFCC_NUM_TEAMS
	.DB SF_TEAM_ID,			NFCW_NUM_TEAMS

PLAYOFF_HELMETS:
	
@afc_helmet_matchup_table										 ; MATCHUP INDEX, Y COORDINATE
	.DB $10, $30
	.DB $00, $50
	.DB $01, $70
	.DB $09, $90
	.DB $08, $B0
	.DB $18, $D0

@nfc_helmet_matchup_table	
	.DB $14, $30
	.DB $04, $50
	.DB $05, $70
	.DB $0D, $90
	.DB $0C, $B0
	.DB $1C, $D0

																; PLAYOFF_HELMET_WINNERS_TABLE
PLAYOFF_HELMET_WINNERS_TABLE:									; PLAYOFF GAME INDEX, HELMET Y, HELMET X, AFC/NFC (nametable page)_
	.DB $00, $60, $90, $00
	.DB $04, $60, $60, $01
	.DB $08, $A0, $90, $00
	.DB $0C, $A0, $60, $01
	.DB $10, $50, $B0, $00
	.DB $14, $50, $40, $01

	.DB $18, $C0, $B0, $00
	.DB $1C, $C0, $40, $01
	.DB $20, $80, $D0, $00
	.DB $24, $80, $20, $01
	.DB $FF

ROSTER_PAGE_SCROLL_INFO:                                         ; ROSTER PAGE FINAL X SCROLL LOCATION
	.DB $00, $A0, $50, $00                                       ; PAGE 1, PAGE 2, PAGE 3
	.DB $00, $01												 ; NAMETABLES 

ROSTER_ARROW_SPR_INFO:                                          ; ROSTER PAGE ARROW SPRITE STARTING LOCATION
	.DB $50, $00, $01, $80

																;
PLAY_CHANGE_ARROWS_SPR_DATA:						; LEFT ARROW 4 TILE META- SPRITE
	.DB $B0, $94, $01, $58
	.DB $B0, $95, $01, $60
	.DB $B8, $9D, $01, $58
	.DB $B8, $97, $01, $60

	.DB $B0, $9F, $01, $98                                       ; RIGHT ARROW 4 TILE META- SPRITE 
	.DB $B0, $B5, $01, $A0
	.DB $B8, $BD, $01, $98
	.DB $B8, $B7, $01, $A0

_F}_DATA

.PAD $C000, $FF
