
.BASE $8000

BANK_JUMP_DRAW_SCHEDULE:
	JMP DRAW_SCHEDULE
 
BANK_JUMP_FLASH_CURRENT_GAME_IN_SCHEDULE: 
	JMP FLASH_CURRENT_GAME_IN_SCHEDULE 
 
BANK_JUMP_RESET_SCHEDULE_RANDOMIZE_ORDER: 
	JMP RESET_SCHEDULE_RANDOMIZE_ORDER 

BANK_JUMP_GET_NUMBER_OF_GAMES_IN_WEEK:                     
	JMP GET_NUMBER_OF_GAMES_IN_WEEK 

BANK_JUMP_CLEAR_SEASON_INFO:   
	JMP CLEAR_SEASON_INFO 
 
BANK_JUMP_RESET_TEAM_PLAYBOOK_TO_DEFAULT_SAVE_CHECKSUM: 
	JMP RESET_TEAM_PLAYBOOK_TO_DEFAULT_SAVE_CHECKSUM  

BANK_JUMP_RESET_AFC_STARTERS
	JMP RESET_AFC_STARTERS    

BANK_JUMP_RESET_NFC_STARTERS
	JMP RESET_NFC_STARTERS    

BANK_JUMP_DRAW_ROSTER_SCREEN
	JMP DRAW_ROSTER_SCREEN    									; *** change bank name to roster screen

BANK_JUMP_DRAW_DEFENSIVE_STARTERS_SCREEN
	JMP DRAW_DEFENSIVE_STARTERS_SCREEN
 
BANK_JUMP_DRAW_TEAM_CONTROL_TYPE_SCREEN
	JMP DRAW_TEAM_CONTROL_TYPE_SCREEN    

BANK_JUMP_SAVE_DEFAULT_AFC_PLAYERS_W_CHECKSUM  	
	JMP SAVE_DEFAULT_AFC_PLAYERS_W_CHECKSUM                        ; SET AFC STARTER DEFAULTS (NOT USED)

BANK_JUMP_SAVE_DEFAULT_NFC_PLAYERS_W_CHECKSUM 	
	JMP SAVE_DEFAULT_NFC_PLAYERS_W_CHECKSUM                        ; SET NFC STARTER DEFAULTS (NOT USED)

BANK_JUMP_CHECK_FUMBLE_RECOVERY_TYPE: 
	JMP CHECK_FUMBLE_RECOVERY_TYPE  
	
BANK_JUMP_GET_TEAM_1_RUSHING_YARDS
	JMP GET_TEAM_1_RUSHING_YARDS    

BANK_JUMP_GET_TEAM_2_RUSHING_YARDS
	JMP GET_TEAM_2_RUSHING_YARDS    

BANK_JUMP_GET_TEAM_1_PASSING_YARDS
	JMP GET_TEAM_1_PASSING_YARDS     

BANK_JUMP_GET_TEAM_2_PASSING_YARDS
	JMP GET_TEAM_2_PASSING_YARDS    

BANK_JUMP_ADJUST_PLAYER_FINAL_LOCATION_PASS: 
	JMP ADJUST_PLAYER_FINAL_LOCATION_PASS
	
BANK_26_UNUSED:  
	JMP BANK_26_UNUSED                    
														

_F{_DRAW_SCHEDULE								; DONE


schedule_addr						= SEGMENT_VAR_8E
current_week						= SEGMENT_VAR_90
current_game_in_week				= SEGMENT_VAR_91
number_of_weeks_on_page_drawn		= SEGMENT_VAR_92
games_per_week						= SEGMENT_VAR_93
current_row_of_week					= SEGMENT_VAR_94
current_schedule_page				= SEGMENT_VAR_96

WEEKS_PER_PAGE			=   $04	

data_addr_temp			= 	LOCAL_1
ppu_addr_temp			=   LOCAL_3

num_rows				= 	LOCAL_2
num_tiles				= 	LOCAL_1
home_team				=	LOCAL_8
away_team				=   LOCAL_7

OFFSET_TO_DIVIDING_LINE							= 	$17 				; number of tiles 
NUMBER_OF_ROWS_TO_CLEAR_SHOW_SINGLE_WEEK		=   $12					; 18 rows

DRAW_SCHEDULE:                                  ; DRAW SCHEDULE START
	LDX #DRAW_SCHEDULE_SCRIPT_BANK              ; SET BANK = BANK 16
	JSR SWAP_A000_BANK                          ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDA #$00                                    ;
	STA number_of_weeks_on_page_drawn           ; SET CURRENT WEEKLY MATCHUP = FIRST MATCHUP
	STA current_row_of_week                     ; SET NUMBER OF WEEKS DRAWN = ZERO
	
@draw_4_weeks_of_schedule_loop:                 ; DRAW 4 WEEKS OF SCHEDULE LOOP
	LDA current_week                            ; DOES WEEK INDEX = CURRENT SEASON WEEK
	CMP CURRENT_WEEK_IN_SEASON                  ; 
	BEQ @set_schedule_loc_sram                  ; YES->SET CURRENT WEEK MATCHUPS SRAM LOCATION
	ASL                                         ; SET INDEX INTO SCHEDULE POINTER TABLE
	TAX                                         ;
	LDA WEEKLY_SCHEDULE_PTR_TABLE,X             ; SET SCHEDULE LOCATION FROM WEEKLY SCHEDULE POINTER TABLE
	STA schedule_addr                           ;
	LDA WEEKLY_SCHEDULE_PTR_TABLE+1,X           ;
	STA schedule_addr+1                         ;
	JMP @draw_dates_dividing_lines                                  ; JUMP->DRAW WEEK DATES AND DIVIDING LINES

@set_schedule_loc_sram::                                         ; SET CURRENT WEEK MATCHUPS SRAM LOCATION
	LDA #<WEEKLY_MATCHUPS_START                 ; SET SCHEDULE LOCATION = SRAM CURRENT WEEK MATCHUPS 
	STA schedule_addr                           ;
	LDA #>WEEKLY_MATCHUPS_START                 ;
	STA schedule_addr +1                        ;

@draw_dates_dividing_lines:                                         ; DRAW WEEK DATES AND DIVIDING LINES 
	LDA number_of_weeks_on_page_drawn           ; LOAD CURRENT WEEKLY MATCHUP
	ASL                                         ;
	TAX                                         ;
	LDY SCHEDULE_DATE_PPU_ADDR_TABLE,X          ; LOAD WEEK/DATE PPU LOCATIONS FROM SCHEDULE DATE PPU LOCATIONS
	LDA SCHEDULE_DATE_PPU_ADDR_TABLE+1,X        ; 
	TAX                                         ;
	LDA current_week                            ; LOAD WEEK INDEX
	JSR DRAW_DATE_HEADERS_AND_DIVIDING_LINES    ; DRAW WEEK DATES AND DIVIDING LINES()
	LDX current_week                            ; SET NUMBER OF GAMES TO DRAW = GAMES IN CURRENT WEEK
	LDA GAMES_PER_WEEK_ARRAY,X                  ; 
	STA games_per_week                          ;
	LDA #$00                                    ; SET CURRENT WEEKLY MATCHUP INDEX  = FIRST MATCHUP
	STA current_game_in_week                    ;
	
@draw_next_matchup_in_week:                                         ; DRAW NEXT WEEKLY MATCHUP
	LDA current_game_in_week                    ; LOAD CURRENT WEEKLY MATCHUP INDEX  
	ASL                                         ; SHIFT SINCE EACH MATCHUP IS TWO BYTES
	TAY                                         ;
	LDA (schedule_addr),Y                       ; LOAD HOME TEAM
	STA home_team                               ;
	INY                                         ; DATA INDEX++ 
	LDA (schedule_addr),Y                       ; LOAD AWAY TEAM
	STA away_team                               ;
	LDA current_row_of_week                     ; LOAD WEEK INDEX
	ASL                                         ;
	TAY                                         ; 
	LDA SCHEDULE_PPU_ADDR_TABLE,Y               ; LOAD WEEKLY MATCHUP PPU LOCATION FROM WEEKLY SCHEDULE PPU LOCATIONS
	LDX SCHEDULE_PPU_ADDR_TABLE+1,Y             ;
	TAY                                         ;
	LDA current_game_in_week                    ; IS CURRENT WEEKLY MATCHUP INDEX > # OF GAMES IN WEEK? 
	CMP games_per_week                          ; 
	BCS @clear_dividing_line                    ; YES-> CLEAR DIVIDING ROW WITH WEEK AND DATE

	JSR DRAW_WEEKLY_MATCHUPS                    ; DRAW WEEKLY MATCHUPS(X,Y = PPU ADDR, $45= HM TEAM, $44= AWAY TEAM)
	JMP @go_to_next_matchup                      ; JUMP -> GO TO NEXT MATCHUP CHECK IF DONE

@clear_dividing_line:                           ; CLEAR DIVIDING ROW WITH WEEK AND DATE
	LDA #$01                                    ; SET ROWS = 1 
	STA num_rows                                ;
	LDA #$07                                    ; SET LENGTH = 7 
	STA num_tiles                               ;
	JSR FILL_SCREEN_BLANK_TILE_AREA             ; SET BUFFER TO BLANK TILE(X,Y= PPU ADDR, 3F= NUM ROWS, 3E= length)

@go_to_next_matchup:                            ; GO TO NEXT MATCHUP CHECK IF DONE
	INC current_row_of_week                     ;
	INC current_game_in_week                    ; CURRENT WEEKLY MATCHUP++
	
@check_done_with_week:
	LDA current_game_in_week                    ; IS CURRENT WEEKLY MATCHUP > MAX GAMES PER WEEK 
	CMP #MAX_GAMES_PER_WEEK                     ;
	BCC @draw_next_matchup_in_week              ; NO-> DRAW NEXT WEEKLY MATCHUP

@set_week_to_next_week:	
	INC current_week                            ; CURRENT WEEK INDEX++
	INC number_of_weeks_on_page_drawn			; NUMBER OF WEEKS DRAWN++
	LDA current_week                            ; IS CURRENT WEEK INDEX >17
	CMP #FIRST_WEEK_OF_PLAYOFFS                     ;
	BCS @clear_last_three_week_area             ; YES->CLEAR BOTTOM PART OF SCHEDULE TO ONLY SHOW WEEK 17
	LDA number_of_weeks_on_page_drawn           ; DOES NUMBER OF WEEKS DRAWN = 4 WEEKS
	CMP #WEEKS_PER_PAGE                         ;
	BCS @exit_jump                              ; ***could branch exit draw  YES->DRAW SCHEDULE RETURN
	JMP @draw_4_weeks_of_schedule_loop          ; NO->DRAW 4 WEEKS OF SCHEDULE LOOP
	
@exit_jump:                                     ; WASTE OF CODE
	JMP @exit_draw_schedule                     ; 

@clear_last_three_week_area:                    ; CLEAR BOTTOM PART OF SCHEDULE TO ONLY SHOW WEEK 17
	LDY #<SECOND_WEEK_SCHEDULE_START            ; SET PPU ADDRESS TO CLEAR = $2140
	LDX #>SECOND_WEEK_SCHEDULE_START            ;
	LDA #NUMBER_OF_ROWS_TO_CLEAR_SHOW_SINGLE_WEEK                                    ; SET ROWS = 18
	STA num_rows                                ;
	LDA #LENGTH_OF_ONE_ROW                      ; SET LENGTH = 32
	STA num_tiles                               ;
	JSR FILL_SCREEN_BLANK_TILE_AREA             ; SET BUFFER TO BLANK TILE(X,Y= PPU ADDR, 3F= NUM ROWS, 3E= length)
	
@exit_draw_schedule:                            ; DRAW SCHEDULE RETURN
	LDX #MAIN_GAME_BANK_2                      ; LOAD BANK 18
	JSR SWAP_A000_BANK                          ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	RTS                                         ; RETURN

DRAW_DATE_HEADERS_AND_DIVIDING_LINES:           ; DRAW WEEK DATES AND DIVIDING LINES(X,Y =PPU ADDRESS, A= WEEK)

week_num_bcd			=   LOCAL_7
current_week			= 	LOCAL_6

	STY ppu_addr_temp                           ; SAVE PPU ADDRESS
	STX ppu_addr_temp+1                         ;
	STA current_week                            ; SAVE WEEK NUMBER
	LDA #<WEEK_AND_DIVIDING_LINE_DATA           ; SET DRAW COMMAND DATA ADDRESS = WEEK AND MOST OF DIVIDING LINE  = $WEEK_AND_DIVIDING_LINE_DATA
	STA data_addr_temp                          ;
	LDA #>WEEK_AND_DIVIDING_LINE_DATA           ;
	STA data_addr_temp +1                       ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS  ; TRANSFER DATA TO PPU VIA BUFFER OR DIRECT DEPENDING ON PALLETE FADE (X,Y=PPU ADDR, 3E,3F DRAW COMMAND ADDR)
	LDA current_week                            ; LOAD WEEK NUMBER
	ASL                                         ;
	ASL                                         ;
	ASL                                         ;
	CLC                                         ;
	ADC #<SCHEDULE_DATE_HEADERS_TABLE           ; SET DRAW COMMAND DATA ADDRESS = DATE AND REST OF DIVIDING LINE= $8743
	STA data_addr_temp                          ;
	LDA #$00                                    ;
	ADC #>SCHEDULE_DATE_HEADERS_TABLE           ;
	STA data_addr_temp+1                       ;
	LDA_ABS_A_ZP ppu_addr_temp                 ; SET PPU ADDRESS = PPU ADDRESS + OFFSET TO REST OF DIVIDING LINE *** doesn't use ZP instruction can fix
	CLC                                         ;
	ADC #OFFSET_TO_DIVIDING_LINE                 ;
	TAY                                         ; 
	LDX ppu_addr_temp+1                         ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS  ; TRANSFER DATA TO PPU VIA BUFFER OR DIRECT DEPENDING ON PALLETE FADE (X,Y=PPU ADDR, 3E,3F DRAW COMMAND ADDR)
	LDA current_week                             ; WEEK NUMBER++
	CLC                                         ;
	ADC #$01                                    ; 
	JSR HEX_TO_2_DIGIT_DEC                      ; CONVERT HEX NUMBER TO DECIMAL() 
	LDY ppu_addr_temp                           ;
	LDX ppu_addr_temp+1                         ;
	INY                                         ; PPU ADDRESS++
	LDA week_num_bcd							; IS WEEK NUMBER <  1 DIGIT?  
	CMP #$0A                                    ;
	BCC @draw_week_number                       ; YES->TRANSFER WEEK NUMBER BUFFER INFO TO BUFFER INFO
	JMP CONVERT_2_DIG_NUM_TILES                 ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
@draw_week_number:                              ; TRANSFER WEEK NUMBER BUFFER INFO TO BUFFER INFO
	INY                                         ; PPU ADDRESS++
	LDA #$01                                    ; SET LENGTH
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE       ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDA week_num_bcd                            ; CONVERT SECOND DIGIT TO TILE
	CLC                                         ;
	ADC #OFFSET_TO_NUMBER_TILES                 ;
	STA CURRENT_BG_BUFFER_LOC,X                 ; SAVE SECOND DIGIT TILE IN BUFFER
	INX                                         ; BUFFER INDEX++
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY   ; JUMP->SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY()

_F}_DRAW_SCHEDULE	

_F{_DRAW_WEEKLY_MATCHUP_TEXT					; DONE

matchup_text_length		= $07
team_abrev_addr			= LOCAL_1
home_team				= LOCAL_8
away_team				= LOCAL_7
abbrev_length			= $03 

	
DRAW_WEEKLY_MATCHUPS:                           ; DRAW WEEKLY MATCHUPS(X,Y = PPU ADDR, $45= HM TEAM, $44= AWAY TEAM))
	LDA #matchup_text_length	                ; SET DATA LENGTH
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE       ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDA home_team                               ; LOAD HOME TEAM
	JSR CONVERT_TEAM_ID_TO_TEXT_ABBREV          ; CONVERT TEAM ID TO TEXT AND SAVE IN BUFFER(A= TEAM ID)
	LDA #MATCHUP_X_TILE_ID                           ; SET TILE BETWEEN TEAMS = STAR TILE
	STA CURRENT_BG_BUFFER_LOC,X                                 ;
	INX                                         ; BUFFER INDEX ++
	LDA away_team                               ;
	JSR CONVERT_TEAM_ID_TO_TEXT_ABBREV          ;
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY   ; JUMP TO SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY()

CONVERT_TEAM_ID_TO_TEXT_ABBREV:                 ; SAVE 3 LETTER TEAM ABBREVIATION IN TEXT BUFFER (A= TEAM ID)
	ASL                                         ; SHIFT TEAM ID TO GET OFFFSET INTO TABLE 
	TAY                                         ;
	LDA TEAM_ABBREVIATION_POINTERS,Y                ; SET TEAM ABBR ADRR =  TEAM ABBREVIATION TABLE  + TEAM OFFSET = $BC00 IN BANK 16
	STA team_abrev_addr                         ;
	LDA TEAM_ABBREVIATION_POINTERS+1,Y              ; 
	STA team_abrev_addr+1                       ;
	LDY #$00                                    ; SET DATA INDEX TO START
	
@copy_letters_to_buffer	
_WHILE CC

	LDA (team_abrev_addr),Y                     ; SAVE LETTER IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                 ; 
	INY                                         ; DATA ADDR++
	INX                                         ; BUFFER INDEX ++
	CPY #abbrev_length                          ; ALL 3 LETTERS SAVED? 
	
_END_WHILE 

	RTS                                         ; RETURN

_F}_DRAW_WEEKLY_MATCHUP_TEXT	

_F{_BLINK_CURRENT_GAME_IN_WEEK					; DONE

WEEKS_PER_PAGE					= $04
ROWS_PER_MATCHUP_BLINK			= $01
TILES_PER_MATCHUP_BLINK			= $07
	
schedule_page_bitmask			= $FC 
num_tiles						= LOCAL_1
num_rows						= LOCAL_2

offset_to_game_in_week			= LOCAL_7

ppu_addr_temp					= LOCAL_1
home_team						= LOCAL_8
away_team						= LOCAL_7 
	
FLASH_CURRENT_GAME_IN_SCHEDULE:                 ; BLINK CURRENT GAME IN SCHEDULE

@check_for_playoffs:
	LDA CURRENT_WEEK_IN_SEASON                  ; LOAD CURRENT SEASON WEEK
	CMP #FIRST_WEEK_OF_PLAYOFFS                 ; IS CURRENT SEASON WEEK > 17 
	BCS @exit                                   ; YES-> EXIT WITHOUT BLINKING

@check_if_on_right_schedule_page:	
	AND #schedule_page_bitmask                  ; 
	CMP current_schedule_page                    ;
	BNE @exit
	
@get_matchup_ppu_addr:
	LDA CURRENT_WEEK_IN_SEASON                  ; LOAD CURRENT SEASON WEEK
	AND #(WEEKS_PER_PAGE -1)                    ; SET WEEKS = MULTIPLE OF 4 WEEKS
	LDX #NUMBER_OF_TEAMS_IN_LEAGUE              ; SET TEAMS = 28
	JSR MULTIPLY_A_TIMES_X                      ; MULTIPLY (A * X)  RESULT IN $44,45
	LDA CURRENT_GAME_IN_WEEK	                ; LOAD CURRENT SEASON GAME INDEX
	ASL                                         ; SHIFT SINCE TWO BYTES FOR MATCHUP
	CLC                                         ;
	ADC offset_to_game_in_week                  ; ADD OFFSET TO CURRENT GAME
	TAX                                         ;
	LDA SCHEDULE_PPU_ADDR_TABLE,X               ; SET PPU ADDR = WEEKLY MATCHUP PPU LOCATION TABLE + GAME OFFSET + WEEK OFFSET
	STA ppu_addr_temp                           ;
	LDA SCHEDULE_PPU_ADDR_TABLE+1,X             ;
	STA ppu_addr_temp+1                         ;
	
@blink_delay_every_eight_frames:	
	LDA FRAME_COUNTER                           ; IS FRAME = NOT DRAW FRAME = 7 FRAMES
	AND #$07                                    ;
	BNE @exit                                   ; BRANCH-> EXIT WITHOUT BLINKING
	LDA FRAME_COUNTER                           ;
	AND #$08                                    ; IS FRAME = DRAW FRAME = 8 FRAMES
	BEQ @draw_text_for_blinking_effect          ; YES-> DRAW MATCHUP TILES FOR BLINKING
	
@clear_text_for_blinking_effect:	
	LDY ppu_addr_temp                           ; SET PPU ADDR = MATCHUP TO DRAW BLANK TILES INTO
	LDX ppu_addr_temp +1                        ;
	LDA #ROWS_PER_MATCHUP_BLINK                           ; SET NUM ROWS =1
	STA num_rows                                ;
	LDA #TILES_PER_MATCHUP_BLINK                          ; SET LENGTH =7
	STA num_tiles                               ;
	JSR FILL_SCREEN_BLANK_TILE_AREA             ; SET BUFFER TO BLANK TILE(X,Y= PPU ADDR, 3F= NUM ROWS, 3E= length)
	RTS                                         ; RETURN
	
@draw_text_for_blinking_effect:                 ; DRAW MATCHUP TILES FOR BLINKING
	LDX #DRAW_SCHEDULE_SCRIPT_BANK              ; LOAD BANK 16
	JSR SWAP_A000_BANK                          ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDA CURRENT_GAME_IN_WEEK	                ; LOAD SEASON WEEKLY GAME INDEX
	ASL                                         ;
	TAX                                         ;
	LDA WEEKLY_MATCHUPS_START,X                 ; LOAD HOME TEAM FROM CURRENT WEEK MATCHUPS SRAM
	STA home_team                               ;
	LDA WEEKLY_MATCHUPS_START+1,X               ; LOAD AWAY TEAM FROM CURRENT WEEK MATCHUPS SRAM
	STA away_team                               ;
	LDY ppu_addr_temp                           ;
	LDX ppu_addr_temp+1                         ;
	JSR DRAW_WEEKLY_MATCHUPS                    ; DRAW WEEKLY MATCHUPS(X,Y = PPU ADDR, $45= HM TEAM, $44= AWAY TEAM)
	LDX #MAIN_GAME_BANK_2                       ; LOAD BANK 18
	JSR SWAP_A000_BANK                          ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	
@exit:                                          ;  DISPLAY MATCHUP RETURN
	RTS                                         ; RETURN

_F}_BLINK_CURRENT_GAME_IN_WEEK
	
_F{_RESET_RANOMIZE_SCHED						; DONE

games_per_week_temp			= LOCAL_1
num_times_schuff_sched		= LOCAL_2	
current_week_sched_addr		= LOCAL_7	


	
RESET_SCHEDULE_RANDOMIZE_ORDER:                 ; RESET SCHEDULE AND RANDOMIZE GAME ORDER
	MMC3_SRAM_WRITE_ENABLE
	LDA CURRENT_WEEK_IN_SEASON                  ; LOAD CURRENT SEASON WEEK
	ASL                                         ;
	TAX                                         ;
	LDA WEEKLY_SCHEDULE_PTR_TABLE,X             ; SET SCHEDULE LOCATION = SCHEDULE START + WEEK OFFSET
	STA current_week_sched_addr                 ;
	LDA WEEKLY_SCHEDULE_PTR_TABLE+1,X           ;
	STA current_week_sched_addr +1              ;
	LDX CURRENT_WEEK_IN_SEASON                  ; LOAD CURRENT SEASON WEEK
	LDA GAMES_PER_WEEK_ARRAY,X                  ; LOAD GAMES IN CURRENT WEEK FROM GAMES IN WEEK TABLE
	STA games_per_week_temp                     ; SAVE GAMES IN CURRENT WEEK
	ASL                                         ; MULTPLY BY 2 SINCE TWO TEAMS PER GAME
	TAX                                         ; TEAMS TO TRANSFER
	
@save_weeks_matchups_in_sram:	
	LDY #$00                                    ; SET TO FIRST MATCHUP
@save_matchups:                                 ; SAVE GAME MATCHUPS IN SRAM GAME MATCHUPS
	LDA (current_week_sched_addr),Y             ; 
	STA WEEKLY_MATCHUPS_START,Y                 ;
	INY                                         ; WEEKLY MATCHUP DATA ADDR++
	DEX                                         ; TEAMS TO TRANSFER--
	BNE @save_matchups                          ; DONE TRANSFERRING MATCHUPS?  NO-> SAVE GAME MATCHUPS IN SRAM GAME MATCHUPS
	
@set_number_of_times_to_shuffle	
	JSR HEAVIER_RANDOMIZE                       ; UPDATE RANDOM NUMBER VALUES AND MAKE VALUE RETURNED MORE RANDOM
	AND #$0F                                    ; MAKE RANDOM = 11-26
	CLC                                         ; 
	ADC #$0B                                    ; 
	STA num_times_schuff_sched                  ;

_WHILE NOT_EQUAL
	
	rand_matchup_index			= LOCAL_5
	games_per_week_temp_two		= LOCAL_7
	rand_value					= LOCAL_8
	 
	JSR HEAVIER_RANDOMIZE                       ; UPDATE RANDOM NUMBER VALUES AND MAKE VALUE RETURNED MORE RANDOM
	STA rand_value                              ;
	LDA games_per_week_temp                     ; LOAD NUMBER OF GAMES IN WEEK
	STA games_per_week_temp_two                 ;
	JSR DIVIDE_8_BIT                            ; 8 BIT DIVIDE ($45/$44) QUOTIENT $45 REMAINDER $42
	LDA rand_matchup_index                      ; SET MATCHUP INDEX 
	ASL                                         ;
	TAX                                         ;
	LDY WEEKLY_MATCHUPS_START,X                 ; SWAP RANDOM MATCHUP WITH FIRST MATCHUP
	LDA WEEKLY_MATCHUPS_START                   ;
	STY WEEKLY_MATCHUPS_START                   ;
	STA WEEKLY_MATCHUPS_START,X                 ;
	LDY WEEKLY_MATCHUPS_START + 1,X             ;
	LDA WEEKLY_MATCHUPS_START + 1               ;
	STY WEEKLY_MATCHUPS_START + 1               ;
	STA WEEKLY_MATCHUPS_START + 1,X             ;
	DEC num_times_schuff_sched                  ; NUMBER OF TIMES TO SHUFFLE--

_END_WHILE

@save_checksum_exit:	
	JSR GET_SAVE_CHECKSUM                       ; CALCULATE AND STORE SRAM CHECKSUM
	MMC3_SRAM_WRITE_DISABLE
	RTS                                         ; RETURN
	
_F}_RESET_RANOMIZE_SCHED		

_F{_GET_GAMES_IN_WEEK							; DONE
	
games_in_week					= LOCAL_8	

GET_NUMBER_OF_GAMES_IN_WEEK:                    ; GET GAMES IN WEEK() RET $45= NUM GAMES
	LDA CURRENT_GAME_IN_WEEK	                ; POINTLESS CODE
	LDX CURRENT_WEEK_IN_SEASON                  ; LOAD SEASON CURRENT WEEK INDEX FROM SRAM
	LDA GAMES_PER_WEEK_ARRAY,X                  ; LOAD GAMES IN CURRENT WEEK
	STA games_in_week                           ; SAVE IN $45 
	RTS                                         ; RETURN

_F}_GET_GAMES_IN_WEEK							; DONE
	
_F{_CLEAR_SEASON_INFO							; DONE

data_addr_low		= LOCAL_7
current_team		= LOCAL_6					; 0 indexed
SKP_TEAM_CTRL		= $03 


CLEAR_SEASON_INFO:                             ; CLEAR SEASON STATS/WINNERS,SET DEFAULT PLAYBOOKS, STARTERS, CONDITIONS, INJURIES
	MMC3_SRAM_WRITE_ENABLE
	LDA #<SIZE_OF_SEASON_INFO             		; SET SIZE TO CLEAR = $18B2 -1 
	LDX #>SIZE_OF_SEASON_INFO             		;
	LDY #<SEASON_INFO_START             		; SET SRAM DATA ADDR = $66C0
	STY data_addr_low                           ;
	LDY #>SEASON_INFO_START            			;
	JSR CLEAR_RAM                               ; CLEAR RAM (X * 0x100 + A , $44,Y= DATA ADDR)
	LDA #$00                                    ; SET CURRENT TEAM = FIRST TEAM
	STA current_team                            ;

_WHILE CC                              ; RESET TO DEFAULT TEAM INFO (STARTERS, CONDITIONS, PLAYBOOKS, INJURIES) LOOP

	LDA current_team                            ; LOAD CURRENT TEAM
	JSR RESET_STARTERS_INJURIES_CONDITIONS      ; RELOAD STARTERS, CONDITIONS, INJURIES(A= TEAM ID)
	LDA current_team                            ;
	JSR RESET_TEAM_PLAYBOOK_TO_DEFAULT                               ; RELOAD DEFAULT PLAYBOOKS(A= TEAM ID)
	INC current_team                            ; CURRENT TEAM ++
	LDA current_team                            ;
	CMP #NUMBER_OF_TEAMS_IN_LEAGUE              ; ALL 28 TEAMS DONE?
	
_END_WHILE
	
@set_playoff_teams_to_none:
	
	SET_RAM_Y_INDEX[start_length_value] PLAYOFF_TEAMS[], NUM_OF_PLAYOFF_TEAMS, $FF
	
@set_all_team_ctrl_to_skip:

	SET_RAM_Y_INDEX[start_length_value] TEAM_TYPE_SEASON, NUMBER_OF_TEAMS_IN_LEAGUE , SKP_TEAM_CTRL 
	
	
	JSR SAVE_DEFAULT_AFC_PLAYERS_SRAM           ; SAVE DEFAULT AFC PRO BOWL PLAYERS INTO SRAM()
	JSR SAVE_DEFAULT_AFC_STARTERS_SRAM          ;
	JSR SAVE_DEFAULT_NFC_PLAYERS_SRAM           ; SAVE DEFAULT NFC PRO BOWL PLAYERS INTO SRAM()
	JSR SAVE_DEFAULT_NFC_STARTERS_SRAM          ;
												; RESET PROBOWL PLAYBOOKS
	LDA #AFC_TEAM_ID                            ; SET CURRENT TEAM = AFC
	STA current_team                            ;
	JSR RESET_TEAM_PLAYBOOK_TO_DEFAULT          ; RELOAD DEFAULT PLAYBOOKS(A= TEAM ID)
	LDA #NFC_TEAM_ID                            ; SET CURRENT TEAM = NFC
	STA current_team                            ;
	JSR RESET_TEAM_PLAYBOOK_TO_DEFAULT          ; RELOAD DEFAULT PLAYBOOKS(A= TEAM ID)
	JSR GET_SAVE_CHECKSUM                       ; 
	MMC3_SRAM_WRITE_DISABLE
	RTS                                         ; RETURN

team_sram_addr_temp			= LOCAL_1
offset_to_kr_pr_starter		= $03
QB1_RB1_starter_byte		= $02  
RB1_WR1_starter_byte		= $36 
WR2_TE1_starter_byte		= $7A
  
	
RESET_STARTERS_INJURIES_CONDITIONS:              ; LOAD DEFAULT STARTERS, CONDITIONS, INJURIES INTO SRAM(A= TEAM ID)
	TAX                                         ; SET INDEX = SHIFT TEAM ID SINCE EACH TABLE ENTRY TWO BYTES
	ASL                                         ;
	TAY                                         ; 
	LDA TEAM_STAT_SRAM_ADDR,Y                   ; LOAD TEAM SRAM START LOCATION FROM TEAM SRAM START LOCATIONS
	STA team_sram_addr_temp                     ;
	LDA TEAM_STAT_SRAM_ADDR+1,Y                 ;
	STA team_sram_addr_temp +1                  ;

@set_default_kr_and_pr	
	LDA DEFAULT_KR_PR_TABLE,X                   ; LOAD KR/PR STARTERS FROM DEFAULT KR/PR TABLE 
	LDY #STARTERS_SEASON_STATS_OFFSET + offset_to_kr_pr_starter                                 
	STA (team_sram_addr_temp),Y                 ;
	
@set_defuault_skill_season_starters:	
	LDY #STARTERS_SEASON_STATS_OFFSET           ; SET QB1, RB1 AS DEFAULT STARTERS
	LDA #QB1_RB1_starter_byte                   ;
	STA (team_sram_addr_temp),Y                 ;
	INY                                         ; DATA ADDR++
	LDA #RB1_WR1_starter_byte                   ; SET RB2, WR1 AS DEFAULT STARTERS
	STA (team_sram_addr_temp),Y                 ;
	INY                                         ; DATA ADDR++
	LDA #WR2_TE1_starter_byte                   ; SET WR2, TE1 AS DEFAULT STARTERS
	STA (team_sram_addr_temp),Y                 ;
	
@set_all_players_not_inured:					; only skill players can be injured	
	LDY #INJURIES_SEASON_STATS_OFFSET           ;
	LDA #$00                                    ; SET PLAYER INJURIES = NOT INJURED
	STA (team_sram_addr_temp),Y                 ;
	INY                                         ;
	STA (team_sram_addr_temp),Y                 ;
	INY                                         ;
	STA (team_sram_addr_temp),Y                 ;
		

	LDY #CONDITIONS_SEASON_STATS_OFFSET         ; *** could use different loop SET CONDITION VALUE = AVERAGE CONDITION
	LDA #ALL_AVERAGE_CONDITION                  ;
@set_conditions:                                ; SET ALL PLAYERS CONDITIONS LOOP
	STA (team_sram_addr_temp),Y                 ;
	INY                                         ; CONDITION BYTE INDEX++
	CPY #$D0                                    ;
	BCC @set_conditions                         ; DONE? NO-> SET ALL PLAYERS CONDITIONS LOOP
	RTS                                         ; RETURN

_F}_CLEAR_SEASON_INFO	
	
_F{_RESET_SINGLE_TEAM_PLAYBOOK					; DONE
	
RESET_TEAM_PLAYBOOK_TO_DEFAULT_SAVE_CHECKSUM:   ; LOAD DEFAULT PLAYBOOKS INTO SEASON SRAM AND CALCULATE CHECKSUM($43= TEAM)
	MMC3_SRAM_WRITE_ENABLE
	JSR RESET_TEAM_PLAYBOOK_TO_DEFAULT          ; 
	JSR GET_SAVE_CHECKSUM                       ; CALCULATE AND STORE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	RTS                                         ; RETURN

team_sram_addr		= LOCAL_1	
team_id				= LOCAL_6 

RESET_TEAM_PLAYBOOK_TO_DEFAULT:                 ; LOAD DEFAULT PLAYBOOKS INTO SEASON SRAM($43 = TEAM)
	LDX #TEAM_DEFAULT_PLAYBOOKS_BANK            ; LOAD BANK 15
	JSR SWAP_A000_BANK                          ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDA team_id	                                ; LOAD TEAM ID
	CMP #AFC_TEAM_ID                            ; IS TEAM ID = PROBOWL TEAM
	BCS @check_afc_or_nfc_probowl_team          ; SET INDEX = SHIFT TEAM ID SINCE EACH TABLE ENTRY TWO BYTES

@set_regular_team_sram_addr:	
	TAX                                         ; 
	ASL                                         ;
	TAY                                         ;
	LDA TEAM_STAT_SRAM_ADDR,Y                   ; SET TEAM SRAM START LOCATION FROM TEAM SRAM START LOCATIONS + TEAM INDEX
	STA team_sram_addr                          ;
	LDA TEAM_STAT_SRAM_ADDR+1,Y                 ;
	STA team_sram_addr+1                        ;
	TXA                                         ; LOAD TEAM ID = SHIFT BY 4 SINCE EACH PLAYBOOK ENTRY = 4 BYTES = 8 PLAYS
	SHIFT_LEFT_2								; 
	TAX                                         ;

@save_default_playbook_into_sram:	
	LDY #PLAYBOOK_SEASON_STATS_OFFSET           ; = OFFSET TO TEAM PLAYBOOKS 
	LDA TEAM_PLAYBOOKS,X               ; SET FIRST PLAYBOOK BYTE = DEFAULT PLAYBOOK TABLE (0X1D310)+ TEAM OFFSET
	STA (team_sram_addr),Y                      ;
	INY                                         ;
	LDA TEAM_PLAYBOOKS+1,X             ; SET SECOND PLAYBOOK BYTE
	STA (team_sram_addr),Y                      ;
	INY                                         ;
	LDA TEAM_PLAYBOOKS+2,X             ; SET THIRD PLAYBOOK BYTE
	STA (team_sram_addr),Y                      ;
	INY                                         ;
	LDA TEAM_PLAYBOOKS+3,X             ; SET FOURTH PLAYBOOK BYTE
	STA (team_sram_addr),Y                      ;
	JMP @exit                                  ; JUMP-> SET $A000 BANK = BANK 18 AND RETURN
	
@check_afc_or_nfc_probowl_team:                 ; CHECK PROBOWL TEAM PLAYBOOK TO RESET
	CMP #NFC_TEAM_ID                            ; IS TEAM = AFC PROBOWL
	BEQ @set_nfc_default_playbook                ; NO-> RESET NFC PROBOWL PLAYBOOK
	
@set_afc_default_playbook:
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] AFC_PLAYBOOK_PLAY_IDS_DATA, SRAM_AFC_PLAYBOOK, SIZE_OF_EACH_PLAYBOOK
	JMP @exit                                   ; JUMP-> SET $A000 BANK = BANK 18 AND RETURN  

@set_nfc_default_playbook:                      ; RESET NFC PROBOWL PLAYBOOK
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] NFC_PLAYBOOK_PLAY_IDS_DATA, SRAM_NFC_PLAYBOOK, SIZE_OF_EACH_PLAYBOOK
	
@exit:                      					; SET $A000 BANK = BANK 18 AND RETURN  
	LDX #MAIN_GAME_BANK_2                       ; LOAD BANK 18
	JSR SWAP_A000_BANK                          ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	RTS                                         ; RETURN

_F}_RESET_SINGLE_TEAM_PLAYBOOK	
	
_F{_RESET_PROBOWL_PLAYERS_STARTERS				; DONE
	
RESET_AFC_STARTERS:                             ; RESET AFC PROBOWL STARTERS
	MMC3_SRAM_WRITE_ENABLE
	JSR SAVE_DEFAULT_AFC_PLAYERS_SRAM           ; SAVE DEFAULT AFC STARTERS INTO SRAM() 
	JSR SAVE_DEFAULT_AFC_STARTERS_SRAM           ;
	JSR GET_SAVE_CHECKSUM                       ;
	MMC3_SRAM_WRITE_DISABLE
	RTS                                         ; RETURN

RESET_NFC_STARTERS:                             ; RESET NFC PROBOWL STARTERS
	MMC3_SRAM_WRITE_ENABLE
	JSR SAVE_DEFAULT_NFC_PLAYERS_SRAM           ;
	JSR SAVE_DEFAULT_NFC_STARTERS_SRAM          ;
	JSR GET_SAVE_CHECKSUM                       ;
	MMC3_SRAM_WRITE_DISABLE
	RTS                                         ; RETURN
	
SAVE_DEFAULT_AFC_PLAYERS_SRAM:                  ; SAVE DEFAULT AFC PRO BOWL PLAYERS INTO SRAM()
	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] DEFAULT_AFC_PB_PLAYERS, AFC_PLAYER_INFO, SIZE_OF_PRO_BOWL_PLAYER_INFO
	RTS                                         ; RETURN

SAVE_DEFAULT_NFC_PLAYERS_SRAM:                  ; SAVE DEFAULT NFC PRO BOWL PLAYERS INTO SRAM()
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] DEFAULT_NFC_PB_PLAYERS, NFC_PLAYER_INFO, SIZE_OF_PRO_BOWL_PLAYER_INFO
	RTS                                         ; RETURN

SAVE_DEFAULT_AFC_PLAYERS_W_CHECKSUM:            ; SAVE DEFAULT AFC PRO BOWL OFFENSIVE STARTERS INTO SRAM AND UPDATE CHECKSUM()
	MMC3_SRAM_WRITE_ENABLE
	JSR SAVE_DEFAULT_AFC_STARTERS_SRAM          ; SAVE DEFAULT AFC PRO BOWL OFFENSIVE STARTERS INTO SRAM()
	JSR GET_SAVE_CHECKSUM                       ; UPDATE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	RTS                                         ; RETURN

SAVE_DEFAULT_NFC_PLAYERS_W_CHECKSUM:            ; SAVE DEFAULT NFC PRO BOWL OFFENSIVE STARTERS INTO SRAM AND UPDATE CHECKSUM()
	MMC3_SRAM_WRITE_ENABLE
	JSR SAVE_DEFAULT_NFC_STARTERS_SRAM          ; SAVE DEFAULT NFC PRO BOWL OFFENSIVE STARTERS INTO SRAM()
	JSR GET_SAVE_CHECKSUM                       ; UPDATE SRAM CHECKSUM()
	MMC3_SRAM_WRITE_DISABLE
	RTS                                         ; RETURN

SAVE_DEFAULT_AFC_STARTERS_SRAM:                 ; SAVE DEFAULT AFC PRO BOWL OFFENSIVE STARTERS INTO SRAM()
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] DEFAULT_PB_STARTERS, SRAM_AFC_STARTERS, SIZE_OF_PRO_BOWL_STARTERS
	RTS                                         ; RETURN

SAVE_DEFAULT_NFC_STARTERS_SRAM:                 ; SAVE DEFAULT NFC PRO BOWL OFFENSIVE STARTERS INTO SRAM()
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] DEFAULT_PB_STARTERS, SRAM_NFC_STARTERS, SIZE_OF_PRO_BOWL_STARTERS
	RTS                                         ; RETURN

_F}_RESET_PROBOWL_PLAYERS_STARTERS	
	
_F{_DRAW_ROSTER_SCREEN_BACKGROUND			; DONE
	
team_stats_sram_addr		= LOCAL_1
	
DRAW_ROSTER_SCREEN:                          ; DRAW TEAM DATA SCREEN AND WINS,LOSSES, TIES

@draw_screen_background:
	LDA #ROSTER_SCREEN_ID                       ; LOAD TEAM DATA SCREEN DRAW EVENT INDEX 
	LDX #DRAW_ROSTER_SCRIPT_BANK	            ; SET DRAW BANK = BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                  ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	
@get_stats_sram_addr	
	LDA CURRENT_TEAM                            ; LOAD CURRENT TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR               ; LOAD TEAM SEASON SRAM LOCATION IN 3E 3F()

@draw_wins: 	
	LDY #WINS_SEASON_STATS_OFFSET               ; LOAD TEAM WINS FROM SRAM
	LDA (team_stats_sram_addr),Y                ; 
	JSR HEX_TO_2_DIGIT_DEC                      ; CONVERT HEX NUMBER TO DECIMAL()
	LOAD_ADDR_XY[mem_loc] TEAM_DATA_WINS_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES                 ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)

@draw_losses:
	LDY #LOSSES_SEASON_STATS_OFFSET             ; LOAD TEAM LOSSES FROM SRAM
	LDA (team_stats_sram_addr),Y                ; 
	JSR HEX_TO_2_DIGIT_DEC                      ; CONVERT HEX NUMBER TO DECIMAL()
	LOAD_ADDR_XY[mem_loc] TEAM_DATA_LOSSES_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES                 ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
@draw_ties:	
	LDY #TIES_SEASON_STATS_OFFSET               ; LOAD TEAM TIES FROM SRAM
	LDA (team_stats_sram_addr),Y                 ;
	JSR HEX_TO_2_DIGIT_DEC                      ; CONVERT HEX NUMBER TO DECIMAL()
	LOAD_ADDR_XY[mem_loc] TEAM_DATA_TIES_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES                 ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	RTS                                         ; RETURN

_F}__DRAW_ROSTER_SCREEN_BACKGROUND

_F{_DRAW_DEF_STARTERS_SCREEN					; DONE

num_tiles				= LOCAL_1
num_rows		 		= LOCAL_2

current_roster_id_temp	= LOCAL_7
current_temp_temp		= LOCAL_8

player_jersey_number	= LOCAL_8

current_def_starter					= SEGMENT_VAR_8E
empty_def_starter					= SEGMENT_VAR_8F
current_team						= SEGMENT_VAR_90 
current_roster_id					= SEGMENT_VAR_91 



SIZE_OF_DEF_STARTER_SPRITE_TABLE_ENTRY			= $08
SIZE_OF_DEF_STARTER_SPRITE_TABLE							= SIZE_OF_DEF_STARTER_SPRITE_TABLE_ENTRY * NUM_DEFENDERS_ON_FIELD	
	
DRAW_DEFENSIVE_STARTERS_SCREEN:                 ; DRAW DEFENSIVE STARTERS SCREEN
	LDA #$00                                    ; CLEAR IRQ_SPLIT1 COUNTER
	STA IRQ_0_COUNTER                           ; 
	LDA #DEFENSIVE_STARTERS_SCREEN_ID           ; LOAD TEAM DEFENSIVE STARTER DRAW EVENT INDEX
	LDX #MENU_DRAW_SCRIPT_BANK                  ; SET DRAW BANK = BANK 16
	JSR DRAW_SCENE_UNTIL_ENDED                  ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= DRAW EVENT INDEX, X = BANK)
	LDA CURRENT_TEAM                            ; LOAD CURRENT TEAM
	CLC                                         ;
	ADC #OFFSET_TO_TEAM_NAME                     ; + OFFSET TO TEAM NAME
	LDY #<TEAM_NAME_DEF_STARTER_PPU_ADDR        ; SET PPU ADDRESS = $2054
	LDX #>TEAM_NAME_DEF_STARTER_PPU_ADDR        ;
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT           ; DRAW TEAM NAME((X,Y =PPUADDRESS, A= TEAM ID + OFFSET)
	

@set_jersey_sprite_locations: 	
	LDY #$00                                 	; SET TABLE INDEX = FIRST LOCATION
	LDX #$00                                 	; SET SPRITE INDEX = FIRST SPRITE

_WHILE CC                              			; SET DEFENSIVE NUMBERS OVER ARROWS LOCATIONS

@set_sprites_y_location:
	LDA DEFENSIVE_STARTER_NUM_SPR_Y_X_TABLE,Y   ; LOAD PLAYER JERSEY NUMBER Y LOCATION FROM DEFENSIVE STARTER NUMBER ON TRIANGLE TABLE
	STA CUR_JERSEY_NUM_FIRST_DIG_SPR_Y,X         ; SET FIRST  DIGIT Y LOCATION
	STA CUR_JERSEY_NUM_SECOND_DIG_SPR_Y,X        ; SET SECOND DIGIT Y LOCATION 
	LDA DEFENSIVE_STARTER_NUM_SPR_Y_X_TABLE+1,Y ; LOAD PLAYER JERSEY NUMBER X LOCATION FROM DEFENSIVE STARTER NUMBER ON TRIANGLE TABLE

@set_sprites_x_location:	
	STA CUR_JERSEY_NUM_FIRST_DIG_SPR_X,X         ; SET FIRST DIGIT X LOCATION
	CLC                                         ;
	ADC #SIZE_OF_TILE                           ; SET SECOND DIGIT X LOCATION = FIRST + ONE TILE
	STA CUR_JERSEY_NUM_SECOND_DIG_SPR_X,X        ;
	
@set_sprites_attributes:	
	LDA #$00                                    ; SET MIRRORING AND PALLETE
	STA CUR_JERSEY_NUM_FIRST_DIG_SPR_ATTR,X          ;
	STA CUR_JERSEY_NUM_SECOND_DIG_SPR_ATTR,X         ;
	INY                                         ; TABLE INDEX++
	INY                                         ;

@set_to_next_table_entry:	
	TXA                                         ; SPRITE INDEX = SPRITE INDEX + LENGTH OF TWO SPRITES
	CLC                                         ; 
	ADC #SIZE_OF_DEF_STARTER_SPRITE_TABLE_ENTRY	            ;
	
@check_if_done:	
	TAX                                         ;
	CPX #SIZE_OF_DEF_STARTER_SPRITE_TABLE                   ; ALL 11  PLAYERS NUMBERS DONE?
_END_WHILE                                  	; NO-> DRAW DEFENSIVE NUMBERS OVER ARROWS LOOP

	LDA #$00                                    ; CLEAR IRQ_SPLIT1 COUNTER
	STA IRQ_0_COUNTER                           ;
	STA current_def_starter	                    ; SET CURRENT DEFENSIVE STARTER  = FIRST STARTER = RE
	
_WHILE CC                              			; DRAW DEFENSIVE STARTER NUMBERS ON TRIANGLE AND NUMBER AND NAME LOOP 

	LDA current_def_starter	                    ;
	CLC                                         ;
	ADC #OFFSET_TO_FIRST_DEFENDER               ;
	ASL                                         ;
	TAX                                         ;
	LDA DEF_STARTER_PLAYERS,X                   ;  LOAD PLAYER TEAM
	STA current_team                            ;
	STA current_temp_temp                       ;
	LDA DEF_STARTER_PLAYERS+1,X                 ;  LOAD ROSTER ID
	STA current_roster_id_temp                  ;
	STA current_roster_id                       ;
	LDA current_def_starter	                    ;
	ASL                                         ;
	TAX                                         ; SET PLAYER NUMBER AND NAME PPU LOCATION FROM DEFENSIVE STARTER NUMBER/NAME LOCATION TABLE 
	LDY DEFENSIVE_STARTER_PPU_ADDR_TABLE,X      ; 
	LDA DEFENSIVE_STARTER_PPU_ADDR_TABLE+1,X    ;
	TAX                                         ;
	JSR DRAW_NUMBER_LAST_NAME_11_CHAR           ; TRANSFER NUMBERS AND NAMES TO BUFFER DEFENSIVE STARTERS()
	LDA current_team                            ; LOAD TEAM
	LDX current_roster_id                       ; LOAD STARTER
	JSR GET_PLAYER_NUMBER                       ; GET NEXT PLAYER NUMBER FOR STARTERS(A=TEAM, X=PLAYER) RET A= NUMBER
	STA player_jersey_number                    ; SAVE PLAYER JERSEY NUMBER
	LDA current_def_starter	                    ; SHIFT BY EIGHT SINCE EACH SPRITE IS 
	ASL                                         ;
	ASL                                         ;
	ASL                                         ;
	TAX                                         ; SAVE STARTER INDEX
	LDA player_jersey_number                    ; LOAD PLAYER JERSEY NUMBER
	LOG_SHIFT_RIGHT_4
	ORA #OFFSET_TO_NUMBER_TILES                 ; = ADD OFFSET TO NUMBER TILES
	BNE @save_player_jersey_numer_sprite        ; IF DIGIT IS ZERO SKIP

@if_zero_dont_draw: 	
	LDA #SPRITE_OFFSCREEN                       ; SET Y LOCATION = OFFSCREEN
	STA CUR_JERSEY_NUM_FIRST_DIG_SPR_Y,X 
	
@save_player_jersey_numer_sprite:                                         
	STA CUR_JERSEY_NUM_FIRST_DIG_SPR_TILE,X                             
	LDA player_jersey_number                    ; LOAD PLAYER JERSEY NUMBER
	AND #$0F                                    ; MASK OUT FIRST DIGIT
	ORA #OFFSET_TO_NUMBER_TILES                               
	STA CUR_JERSEY_NUM_SECOND_DIG_SPR_TILE,X                         
	INC current_def_starter                     ; CURRENT STARTER ++
	LDA current_def_starter                     ; 
	CMP #NUM_DEFENDERS_ON_FIELD                  ; ALL 11 DEFENDERS DONE?

_END_WHILE 
	
	LDX #MAIN_GAME_BANK_2                       ; LOAD BANK 18
	JSR SWAP_A000_BANK                          ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDA #$02                                    ; LOAD 2 FRAMES
	JSR DELAY_TASK                              ; SWITCH TASKS (A= NUMBER OF FRAMES BEFORE RETURNING)

@clear_dashes_between_num_name_dl:			    ; CLEAR DASHES BETWEEN NUMBER AND NAME
	LDY #<DL_DASH_DEF_STARTER_PPU_ADDR          ; SET PPU LOCATION = $21B4
	LDX #>DL_DASH_DEF_STARTER_PPU_ADDR          ;
	LDA #NUMBER_OF_DL                           ; SET ROWS = 3 = NUMBER OF DEFENSIVE LINEMAN
	STA num_rows                                ;
	LDA #$01                                    ; SET LENGTH =1 
	STA num_tiles                               ;
	JSR FILL_SCREEN_BLANK_TILE_AREA             ; SET BUFFER TO BLANK TILE(X,Y= PPU ADDR, 3F= NUM ROWS, 3E= length)
	
@clear_dashes_between_num_name_lb:
	LDY #<LB_DASH_DEF_STARTER_PPU_ADDR          ; SET PPU LOCATION = $222A
	LDX #>LB_DASH_DEF_STARTER_PPU_ADDR          ;
	LDA #NUMBER_OF_LB                           ; SET ROWS = 4 = NUMBER OF LINEBACKERS
	STA num_rows                                ;
	LDA #$01                                    ; SET LENGTH =1
	STA num_tiles                               ;
	JSR FILL_SCREEN_BLANK_TILE_AREA             ; SET BUFFER TO BLANK TILE(X,Y= PPU ADDR, 3F= NUM ROWS, 3E= length)
	
@clear_dashes_between_num_name_db:	
	LDY #<DB_DASH_DEF_STARTER_PPU_ADDR          ; SET PPU LOCATION = $2310
	LDX #>DB_DASH_DEF_STARTER_PPU_ADDR          ; 
	LDA ##NUMBER_OF_DB                          ; SET ROWS = 4 = NUMBER OF DEFENSIVE BACKS
	STA num_rows                                ;
	LDA #$01                                    ; SET LENGTH =1
	STA num_tiles                               ;
	JSR FILL_SCREEN_BLANK_TILE_AREA             ; SET BUFFER TO BLANK TILE(X,Y= PPU ADDR, 3F= NUM ROWS, 3E= length)
												; UPDATE TILE BANKS TO USE
@upate_chr_banks_and_set_pallete:												
	LDA #NUMBERS_CHR_BANK_ID                    ; SET SOFT CHR BANK $1000 = BANK 32
	STA SOFT_CHR_1000_BANK                      ;
	LDA #LETTERS_CHR_BANK_ID	                ; SET SOFT CHR BANK $1400 = BANK 33
	STA SOFT_CHR_1400_BANK                      ;
	LDA #DEF_STARTERS_BG_PAL_INDEX              ; LOAD BACKGROUND PALLETE INDEX
	LDX #DEF_STARTERS_SPR_PAL_INDEX             ; LOAD SPRITE PALLETE INDEX
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN       ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE)
	
_WHILE EQUAL                                    ; CHECK FOR A OR B PRESS TO EXIT
	RETURN_1_FRAME
	LDA JOY_PRESS_BOTH                          ; IS P1/P2 PRESS = A OR B
	AND #(A_BUTTON + B_BUTTON)                    ;

_END_WHILE

	RTS                                         ; RETURN


DEFENSIVE_STARTER_PPU_ADDR_TABLE:               ; DEFENSIVE STARTER NUMBER/NAME LOCATION TABLE 
	.WORD RE_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR 
	.WORD NT_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR 
	.WORD LE_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR 
	
	.WORD ROLB_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR	
	.WORD RILB_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR	
	.WORD LILB_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR	
	.WORD LOLB_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR	

	.WORD RCB_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR	
	.WORD LCB_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR	
	.WORD FS_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR		
	.WORD SS_NUMBER_BOT_SCRN_DEF_STARTER_PPU_ADDR		
	
          

DEFENSIVE_STARTER_NUM_SPR_Y_X_TABLE:            ; DEFENSIVE STARTER NUMBER ON TRIANGLE LOCATION
												; Y,X
	.DB LE_DEF_STARTER_TRIANGLE_SPR_Y, LE_DEF_STARTER_TRIANGLE_SPR_X   
	.DB NT_DEF_STARTER_TRIANGLE_SPR_Y, NT_DEF_STARTER_TRIANGLE_SPR_X 
	.DB RE_DEF_STARTER_TRIANGLE_SPR_Y, RE_DEF_STARTER_TRIANGLE_SPR_X 
	
	.DB LOLB_DEF_STARTER_TRIANGLE_SPR_Y, LOLB_DEF_STARTER_TRIANGLE_SPR_X	
	.DB LILB_DEF_STARTER_TRIANGLE_SPR_Y, LILB_DEF_STARTER_TRIANGLE_SPR_X	
	.DB RILB_DEF_STARTER_TRIANGLE_SPR_Y, RILB_DEF_STARTER_TRIANGLE_SPR_X	
	.DB ROLB_DEF_STARTER_TRIANGLE_SPR_Y, ROLB_DEF_STARTER_TRIANGLE_SPR_X
	
	.DB LCB_DEF_STARTER_TRIANGLE_SPR_Y, LCB_DEF_STARTER_TRIANGLE_SPR_X	
	.DB RCB_DEF_STARTER_TRIANGLE_SPR_Y, RCB_DEF_STARTER_TRIANGLE_SPR_X	
	.DB FS_DEF_STARTER_TRIANGLE_SPR_Y, FS_DEF_STARTER_TRIANGLE_SPR_X	
	.DB SS_DEF_STARTER_TRIANGLE_SPR_Y,	SS_DEF_STARTER_TRIANGLE_SPR_X	

	
_F}_DRAW_DEF_STARTERS_SCREEN

_F{_DRAW_TEAM_CONTROL_SCREEN					; DONE

current_team_index		= LOCAL_8
current_team_ctrl		= LOCAL_7
team_control_bitmask	= $03					; 00 =man, 01=coa, 02=com, 03= skp 			
	
temp_arrow_attr			= LOCAL_8


	
DRAW_TEAM_CONTROL_TYPE_SCREEN:                  ; MAN,COM,COA,SKP CONTROL MODE SCREEN()
	LDA #$00                                    ; SET TEAMS DRAWN = 0
	STA current_team_index                      ; 
_WHILE  NOT_EQUAL                               ; DRAW ALL TEAMS CONTROL TYPE LOOP
	LDX current_team_index                      ;
	LDA TEAM_TYPE_SEASON,X                      ; SET TEAM TYPE = SRAM SEASON TEAM TYPES + TEAM INDEX
	STA current_team_ctrl                       ;
	JSR DRAW_MAN_SKP_COA_COM_TEXT               ; DRAW MAN,SKP COA, COM TEXT (X=TEAM ID, $44 = TEAM TYPE)
	INC current_team_index                      ; TEAMS DRAWN++
	LDA current_team_index                      ;
	CMP #NUMBER_OF_TEAMS_IN_LEAGUE              ; ALL TEAMS DONE?
	
_END_WHILE

	LDA #TEAM_CONTROL_BG_PAL_INDEX              ; SET BACKGROUND PALLETE INDEX = 0X14
	LDX #TEAM_CONTROL_SPR_PAL_INDEX             ; SET SPRITE PALLETE INDEX = 0X23
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN       ; UPDATE PALLETES,SOFT PALLETE AND SET PALLETE FADE TO FADED IN(A= BACKGROUND, X = SPRITE)
	RETURN_IN_NUM_FRAMES 2
	LDA #$00                                    ; 
	STA MENU_Y                                  ; SET MENU Y INDEX = FIRST OPTION
	STA MENU_X                                  ; SET MENU X INDEX = FIRST OPTION
	LDY #<TEAM_CONTROL_MENU_OPTIONS_MAP         ; SET MAN,SKP,COA,COM MENU OPTIONS DATA ADDRESS 
	LDX #>TEAM_CONTROL_MENU_OPTIONS_MAP         ;
	LDA #BOTH_JOYPADS                           ; SET PLAYER JOY = BOTH
	JSR INIT_MENU_OPTIONS                       ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)

TEAM_CTRL_CHANGE_LOOP:                          ;
	RETURN_1_FRAME
	JSR CHECK_INPUT_MENU                        ; CHECK FOR MOVE ARROW ON MENU X OR Y()

@cycle_between_four_colors	
	LDA MENU_ARROW_SPR_ATTR                     ; SWITCH ARROW PALLETE BETWEEN 4 COLORS FOR FLASHING EFFECT
	AND #$FC                                    ;
	STA temp_arrow_attr                         ;
	LDA FRAME_COUNTER                           ;
	LSR                                         ;
	AND #$03                                    ;
	ORA temp_arrow_attr                         ;
	STA MENU_ARROW_SPR_ATTR                     ;
	JSR SET_MENU_ARROW_X_Y                      ;
	IF_NEITHER_JOY_PRESSED_B[ADDR] CHECK_CHANGE_TEAM_CTRL_TYPE ; ***  could jump to exit direct

@else_exit: 
	JMP TEAM_CTRL_TYPE_EXIT                                   ; YES->EXIT
	
CHECK_CHANGE_TEAM_CTRL_TYPE:                    ; CHECK FOR UPDATE SEASON TEAM TYPE
	BPL TEAM_CTRL_CHANGE_LOOP                   ; IS “A” PRESSED?
	JSR GET_MENU_INDEX_X_Y                      ; GET INDEX INTO MENU ARROW MAP (RET=A)
	JSR GET_TEAM_ID_FOR_TEAM_CONTROL            ; LOAD TEAM CONTROL TEAM ID (A= MENU INDEX)
	TAX                                         ; SAVE TEAM ID

@change_team_control_type_sram:	
	MMC3_SRAM_WRITE_ENABLE
	LDA TEAM_TYPE_SEASON,X                      ; LOAD SEASON TEAM TYPE FROM SEASON TEAM TYPE + TEAM ID 
	CLC                                         ;  
	ADC #$01                                    ; SEASON TEAM TYPE = NEXT TEAM TYPE
	AND #team_control_bitmask                   ; 
	STA TEAM_TYPE_SEASON,X                      ; SAVE SEASON TEAM TYPE
	STA current_team_ctrl                       ;
	JSR DRAW_MAN_SKP_COA_COM_TEXT               ; DRAW MAN,SKP COA, COM TEXT (X=TEAM ID, $44 = TEAM TYPE) 
	MMC3_SRAM_WRITE_DISABLE
	JMP TEAM_CTRL_CHANGE_LOOP                   ;

TEAM_CTRL_TYPE_EXIT:                            ; YES->EXIT
	RTS                                         ; RETURN

DRAW_MAN_SKP_COA_COM_TEXT:                      ; DRAW MAN,SKP COA, COM TEXT (X=TEAM ID, $44 = TEAM TYPE)
	TXA                                         ; SHIFT TEAM ID FOR INDEX INTO TABLE
	ASL                                         ;
	TAX                                         ;
	LDY TEAM_CONTROL_TEXT_PPU_ADDR_TABLE,X      ; LOAD TEAM MODE PPU LOCATION FROM  TEAM MAN, SKP, COA, COM PPU TEAM LOCATION TABLE
	LDA TEAM_CONTROL_TEXT_PPU_ADDR_TABLE + 1,X  ;
	TAX                                         ;
	LDA current_team_ctrl                       ; LOAD TEAM TYPE
	AND #team_control_bitmask                  ; MAKE SURE ITS MAN, SKP, COA, COM
	CLC                                         ; 
	ADC #OFFSET_TO_TEAM_CTRL_TEXT               ; ADD OFFSET TO TO MAN, SKP, COA, COM TEXT
	JMP DRAW_TEAM_NAME_CITY_CONF_TEXT           ; DRAW ABREV TEAM CITY/NAME/CONFERENCE/MODE ON TEAM DATA(X,Y =PPUADDRESS, A= OFFSET TO INFO)

GET_TEAM_ID_FOR_TEAM_CONTROL:                   ; LOAD TEAM CONTROL TEAM ID (A= MENU INDEX)
	TAX                                         ;
	LDA TEAM_CONTROL_TEAM_ID_MAP,X              ; LOAD TEAM ID FROM TEAM CONTROL TYPE MENU COORDINATE TO TEAM ID TABLE
	RTS                                         ; RETURN

TEAM_CONTROL_TEAM_ID_MAP:                       ; TEAM CONTROL TYPE MENU COORDINATE TO TEAM ID TABLE
												; AFC E, AFC C, AFW C
	.DB BUF_TEAM_ID, CIN_TEAM_ID, DEN_TEAM_ID
	.DB IND_TEAM_ID, CLE_TEAM_ID, KC_TEAM_ID
	.DB MIA_TEAM_ID, HOU_TEAM_ID, LAR_TEAM_ID
	.DB NE_TEAM_ID,  PIT_TEAM_ID, SD_TEAM_ID
	.DB NYJ_TEAM_ID, $00        , SEA_TEAM_ID
	
	.DB WAS_TEAM_ID, CHI_TEAM_ID, SF_TEAM_ID
	.DB NYG_TEAM_ID, DET_TEAM_ID, LAM_TEAM_ID
	.DB PHI_TEAM_ID, GB_TEAM_ID , NO_TEAM_ID
	.DB PHX_TEAM_ID, MIN_TEAM_ID, ATL_TEAM_ID
	.DB DAL_TEAM_ID, TB_TEAM_ID, $00
	
_F}_DRAW_TEAM_CONTROL_SCREEN	
	
_F{_CHECK_RECOVERY_TYPE							; DONE

side_and_position_id		= LOCAL_5
recover_fumble				= LOCAL_6

own_team_recovered			= $00
opp_recovered				= $FF 

kicker_punter_position_id	= QB_POSITION_ID
fg_xp_kicker_position_id	= RB1_POSITION_ID	

CHECK_FUMBLE_RECOVERY_TYPE:                     ; CHECK IF KICKER, PUNTER OR NORMAL PLAYER RECOVERED FUMBLE()
	LOAD_CUR_PLAYER_POSITION_ID					; 
	TAX                                         ; 
	EOR POSSESSION_STATUS                       ; 
	STA side_and_position_id                    ; SAVE TURNOVER STATUS AN POSITION ID
	TXA                                         ; SAVE PLAYER POSITION IN X
	AND #$0F                                    ; 
	TAX                                         ; 
	
	LDA POSSESSION_STATUS                       ; LOAD POSSESION STATUS
	AND #$1C                                    ; MASK OUT POSSESION INFO 
	CMP #KICKOFF_BITMASK                        ; DOES PLAY TYPE = KICKOFF
	BEQ @kickoff_onsides                        ; YES->KICKOFF FUMBLE RECOVERY
	
	CMP #PUNT_BITMASK                           ; DOES PLAY TYPE = PUNT
	BEQ @punt                                   ; YES->PUNT FUMBLE RECOVERY
	
	CMP #FG_BITMASK                             ; DOES PLAY TYPE = FG?
	BEQ @kick_block                             ; YES->FG/XP BLOCK RECOVERY
	
	CMP #XP_BITMASK                             ; DOES PLAY TYPE = XP
	BEQ @kick_block                             ; YES->FG/XP BLOCK RECOVERY

@normal_player_recovered:                       ; OFFENSE/DEFENSE PLAYER RECOVERED FUMBLE
	LDA #own_team_recovered                     ; SET RECOVERY TYPE = FUMBLE TEAM RECOVERED
	STA recover_fumble                          ;
	RTS                                         ; RETURN
	
@kickoff_onsides:                               ; KICKOFF FUMBLE/ONSIDES RECOVERY
	LDA side_and_position_id                    ; WAS THEIR A TURNOVER?
	BPL @normal_player_recovered                ; NO->NORMAL FUMBLE RECOVERY
	CPX #kicker_punter_position_id              ; DOES PLAYER POSITION = KICKER 
	BNE @normal_player_recovered                ; NO->OFFENSE/DEFENSE PLAYER RECOVERED FUMBLE
	
	LDA #KICKER_STARTER_ID                      ; SET PLAYER ID = KICKER
	JMP @special_teams_player_recovered        ; BRANCH TO KICKER/PUNTER RECOVERED BALL
	
@punt:                                          ; PUNT FUMBLE RECOVERY
	LDA side_and_position_id                    ; WAS THEIR A TURNOVER? 
	BMI @normal_player_recovered                ; YES-> NORMAL FUMBLE RECOVERY
	CPX #kicker_punter_position_id              ; DOES PLAYER POSITION = PUNTER
	BNE @normal_player_recovered                ; NO-> OFFENSE/DEFENSE PLAYER RECOVERED FUMBLE
	LDA #PUNTER_STARTER_ID                      ; SET PLAYER ID = PUNTER
	JMP @special_teams_player_recovered        ; BRANCH TO KICKER/PUNTER RECOVERED BALL
	
@kick_block:                                    ; FG BLOCK RECOVERY
	LDA side_and_position_id                    ; WAS THEIR A TURNOVER?
	BMI @normal_player_recovered                ; NO-> NORMAL FUMBLE RECOVERY
	CPX #fg_xp_kicker_position_id               ; DOES PLAYER POSITION = KICKER
	BNE @normal_player_recovered                ; NO-> OFFENSE/DEFENSE PLAYER RECOVERED FUMBLE
	
	LDA #KICKER_STARTER_ID                      ; SET PLAYER ID = KICKER

@special_teams_player_recovered:               ; KICKER/PUNTER RECOVERED BALL
	STA side_and_position_id                    ; SAVE POSITION ID
	LDA #opp_recovered                          ; SET RECOVERY TYPE = OPPOSING TEAM RECOVERED
	STA recover_fumble                          ;
	RTS                                         ; RETURN

_F}_CHECK_RECOVERY_TYPE

_F{_ADJUST_PLAYER_FINAL_LOCATION_PASS			; DONE
	
player_priority   	= EXTRA_PLAYER_RAM_3
final_location	  	= EXTRA_PLAYER_RAM_4

abs_x_distance		= LOCAL_1
abs_y_distance		= LOCAL_3

x_dist_to_move		= LOCAL_5
y_dist_to_move		= LOCAL_7
	
ADJUST_PLAYER_FINAL_LOCATION_PASS:              ; ADJUST PLAYER FINAL LOCATION TO MOVE BASED ON PRIORITY AND BALL ANGLE()
	LDA BALL_ANGLE                              ; CONVERT BALL ANGLE INTO ONE OF 8 DIRECTIONS
	EOR #$80                                    ; 
	AND #$E0                                    ;
	DIVIDE_4 									; 
	TAX                                         ; SAVE BALL ANGLE INDEX
	LDY #player_priority                        ; LOAD PLAYER PRIORITY
	LDA (CURRENT_PLAYER_ADDR),Y                 ; IS PLAYER PRIORITY= HIGHEST
	BEQ @set_location_adjustment                ; 

@check_second_closest: 
	CMP #$01      
	BEQ @second_closest_player_to_final_ball
    
@check_third_closest:  
	CMP #$02     
	BEQ @third_closest_player_to_final_ball 
	
@fourth_closest_player:
	TXA      
	CLC       
	ADC #$06     
	TAX      
	JMP @set_location_adjustment                ;

@third_closest_player_to_final_ball:      
	TXA      
	CLC       
	ADC #$04      
	TAX       
	JMP @set_location_adjustment 
	
@second_closest_player_to_final_ball:       
	INX
	INX
	
@set_location_adjustment:                       ; HIGHEST PRIORITY PLAYER/GET FINAL LOCATION ADJUSTMENT

@set_adjusted_y:
	LDA FINAL_LOC_ADJUST_TABLE,X                ;  LOAD Y VALUE TO ADJUST FROM FINAL LOCATION ADJUST TABLE FOR PASS BASED ON ANGLE AND PRIORITY (Y,X) YARDS
	CLC                                         ;
	ADC FINAL_BALL_Y                            ; + FINAL BALL LOCATION Y
	TAY                                         ;
	ROR                                         ; 
	EOR FINAL_LOC_ADJUST_TABLE,X                ; 
	BPL @save_adjusted_y                        ;

	
	LDY FINAL_BALL_Y                            ; 
	
@save_adjusted_y:                               ; BALL 
	STY FINAL_Y_LOC_AFTER_ADJUST_PASS           ; SAVE ADJUSTED FINAL Y LOCATION

@set_adjusted_x:	
	LDA FINAL_LOC_ADJUST_TABLE +1,X             ; SET FINAL X LOCATION IN $B3,$B4     
	CLC                                         ; =  FINAL BALL LOCATION 
	ADC FINAL_BALL_X                            ; + FINAL LOCATION ADJUST TABLE FOR PASS BASED ON ANGLE AND PRIORITY (Y,X) YARD
	STA FINAL_X_LOC_AFTER_ADJUST_PASS           ; 
	LDA FINAL_LOC_ADJUST_TABLE +1,X             ;
	AND #$80                                    ;
	BPL @Loop5                                  ;
	LDA #$FF                                    ; 
@Loop5:                                         ; CALCULATE PLAYER ADJUSTED X DISTANCE TO MOVE
	ADC FINAL_BALL_X +1                         ;
	STA FINAL_X_LOC_AFTER_ADJUST_PASS +1                                
	
@save_player_adjusted_y_loc:	
	LDA FINAL_Y_LOC_AFTER_ADJUST_PASS           ; Y DISTANCE TO MOVE = ADJUSTED FINAL Y LOC – CURRENT PLAYER Y LOC
	LDY #Y_POS +1                               ; 
	SEC                                         ;
	SBC (CURRENT_PLAYER_ADDR),Y                 ;
	STA y_dist_to_move                          ;
	BCC @make_y_value_positive                  ; Y DISTANCE TO  = NEGATIVE? Y->INVERT Y VALUE
	STA abs_y_distance                                     ;
	LDA #$00                                    ;
	STA y_dist_to_move+1                        ;
	JMP @set_x_distance_to_move                 ; JUMP TO CALCULATE PLAYER FINAL X LOCATION
	
@make_y_value_positive:                         ; INVERT Y VALUE 
	EOR #$FF                                    ;
	CLC                                         ;
	ADC #$01                                    ;
	STA abs_y_distance                          ; SET $40 =  Y DISTANCE TO MOVE
	LDA #$FF                                    ; SET Y DIRECTION = MOVING UP
	STA y_dist_to_move+1                        ;
	
@set_x_distance_to_move:                        ; CALCULATE PLAYER ADJUSTED X DISTANCE TO MOVE 
	LDA FINAL_X_LOC_AFTER_ADJUST_PASS           ; X DISTANCE TO MOVE = ADJUSTED FINAL X LOC – CURRENT PLAYER X LOC
	LDY #X_POS +1                               ;
	SEC                                         ;
	SBC (CURRENT_PLAYER_ADDR),Y                 ;
	STA x_dist_to_move                          ;
	TAX                                         ;
	INY                                         ;
	LDA FINAL_X_LOC_AFTER_ADJUST_PASS +1        ; 
	SBC (CURRENT_PLAYER_ADDR),Y                 ;
	STA x_dist_to_move+1                        ;
	BMI @invert_x_value                         ; IS X DISTANCE TO MOVE= NEGATIVE? YES->INVERT X DISTANCE VALUE
	STA abs_x_distance+1                        ;
	STX abs_x_distance                          ;
	JMP @check_x_greater_than_32_yards          ; JUMP-> SET PLAYER FINAL X OR Y LOCATION

@invert_x_value:                                ; INVERT X DISTANCE VALUE
	LDA #$00                                    ;
	SEC                                         ;
	SBC x_dist_to_move                          ; SET 3E,3F = X DISTANCE TO MOVE
	STA abs_x_distance                          ;
	LDA #$00                                    ;
	SBC x_dist_to_move + 1                      ;
	STA abs_x_distance + 1                      ;
	
@check_x_greater_than_32_yards:                 ; SET PLAYER FINAL X OR Y LOCATION
	LDA abs_x_distance + 1                      ; IS X DISTANCE GREATER THAN 32 YARDS?
	BNE @use_x_distance                         ; YES-> SET PLAYER FINAL X LOCATION

@check_x_greater_than_y_yards:	
	LDA abs_x_distance                          ; IS X DISTANCE > Y DISTANCE
	CMP abs_y_distance                          ; YES-> SET PLAYER FINAL X LOCATION
	BCS @use_x_distance                         ;  
	
@use_y_distance:	
	LDA FINAL_Y_LOC_AFTER_ADJUST_PASS           ; SAVE FINAL Y LOCATION IN PLAYER FINAL Y LOCATION MOVE 
	LDY #final_location                         ;
	STA (CURRENT_PLAYER_ADDR),Y                 ;
	INY                                         ;
	LDA #$FF                                    ;
	STA (CURRENT_PLAYER_ADDR),Y                 ;
	RTS                                         ; RETURN

@use_x_distance:                                ; SET PLAYER FINAL X LOCATION 
	LDY #final_location                         ; SAVE FINAL X LOCATION IN PLAYER FINAL X LOCATION 
	LDA FINAL_X_LOC_AFTER_ADJUST_PASS           ;
	STA (CURRENT_PLAYER_ADDR),Y                 ;
	INY                                         ;
	LDA FINAL_X_LOC_AFTER_ADJUST_PASS+1         ;
	STA (CURRENT_PLAYER_ADDR),Y                 ; 
	RTS                                         ; RETURN

_F}_ADJUST_PLAYER_FINAL_LOCATION_PASS	
	
_F{_GET_TEAM_RUSH_PASS_YARDS					; DONE


total_yards								= SEGMENT_VAR_8E
stat_index								= SEGMENT_VAR_90
unused									= SEGMENT_VAR_91
players_left_to_sum						= SEGMENT_VAR_92
current_roster_id						= SEGMENT_VAR_93


yards_to_add							= LOCAL_7
NUMBER_OF_QBS_ON_TEAM					= RB1_ROSTER_ID - QB1_ROSTER_ID 
NUMBER_OF_SKILL_POS_PLAYERS_ON_TEAM		= C_ROSTER_ID - RB1_ROSTER_ID

GET_TEAM_1_RUSHING_YARDS:                       ; CALCULATE PLAYER 1 TEAM RUSHING YARDS
	LDA #P1_SIDE_ID                             ; SET PLAYER TO PLAYER 1 
	JMP GET_TEAM_RUSHING_YARDS
	
GET_TEAM_2_RUSHING_YARDS:                       ; CALCULATE PLAYER 2 TEAM RUSHING YARDS
	LDA #P2_SIDE_ID	                            ; SET PLAYER TO PLAYER 2
	
GET_TEAM_RUSHING_YARDS:
	LDX #GET_QB_RUSH_YDS_IN_GAME_INDEX          ; SET STAT INDEX = QB RUSHING YARDS INDEX
	JSR SUM_ALL_QB_YARDS                        ; SUM QB PLAYER STATS (A= P1/P2, X= STAT INDEX)
	LDX #GET_RUN_YDS_IN_GAME_INDEX              ; SET STAT INDEX = SKILL PLAYER RUSHING YARDS INDEX
	JSR SUM_ALL_SKILL_PLAYER_RUSHING_YARDS      ; SUM SKILL PLAYER STATS (A= P1/P2, X= STAT INDEX)
	RTS                                         ; RETURN

GET_TEAM_1_PASSING_YARDS:                       ; CALCULATE PLAYER 1 TEAM PASSING YARDS
	LDA #P1_SIDE_ID                             ; SET PLAYER TO PLAYER 1
	JMP GET_TEAM_PASSING_YARDS

GET_TEAM_2_PASSING_YARDS:                       ; CALCULATE PLAYER 2 TEAM PASSING YARDS     
	LDA #P2_SIDE_ID	                            ; SET PLAYER TO PLAYER 2

GET_TEAM_PASSING_YARDS:                         ; CALCULATE PASSING YARDS (A= PLAYER SIDE)
	LDX #GET_QB_PASS_YDS_IN_GAME_INDEX           ; SET STAT INDEX = QB PASSING YARDS INDEX
	JSR SUM_ALL_QB_YARDS                        ; SUM QB PLAYER STATS (A= P1/P2, X= STAT INDEX)
	RTS                                         ;

SUM_ALL_QB_YARDS:                               ; SUM QB PLAYER STATS (A= P1/P2, X= STAT INDEX)
	STA TEAM_ON_OFFENSE                 		; SET CURRENT TEAM = PLAYER 1 OR PLAYER 2 
	LDA #$00                                    ; SET YARDS SUM = 0
	STA total_yards                             ;
	STA total_yards+1                           ;
	LDA #NUMBER_OF_QBS_ON_TEAM	                        ; SET NUMBER OF PLAYERS LEFT TO CHECK = 2 = BOTH QBS
	STA players_left_to_sum	                    ;
	LDA #$00                                    ; SET CURRENT PLAYER = QB1
	STA current_roster_id                       ;
	JMP SUM_ALL_PLAYERS_YARDAGE                 ;
	
SUM_ALL_SKILL_PLAYER_RUSHING_YARDS:             ; SUM SKILL PLAYER STATS (A= P1/P2, X= STAT INDEX)
	LDA #NUMBER_OF_SKILL_POS_PLAYERS_ON_TEAM              ; SET NUMBER OF PLAYERS LEFT TO CHECK = 10 = ALL SKILL PLAYERS
	STA players_left_to_sum	                    ;
	LDA #RB1_ROSTER_ID                          ; SET CURRENT PLAYER = RB1
	STA current_roster_id                       ;

SUM_ALL_PLAYERS_YARDAGE:                        ; SUM PLAYER STATS(X=STAT INDEX, 8E,8F= YARDS, 92= NUM PLAYERS 93 = PLAYER TO START WITH)
	STX stat_index                              ; SAVE STAT INDEX
@Loop1:
	LDA current_roster_id                       ; LOAD CURRENT PLAYER
	LDX stat_index                              ; LOAD STAT INDEX
	JSR SWAP_AND_GET_CURRENT_GAME_STATS         ; GET IN GAME STATS(A= ACTUAL PLAYER, X= STAT INDEX)

@skip_add_for_negative_yards:	
	LDA yards_to_add +1                         ;
	BMI @go_to_next_player                      ;
	LDA total_yards                             ; YARDS SUM = YARDS SUM + PLAYER YARDS
	CLC                                         ;
	ADC yards_to_add                            ;
	STA total_yards                             ;
	LDA total_yards+1                           ;
	ADC yards_to_add +1                         ;
	STA total_yards+1                           ;
	
@go_to_next_player:                             ;
	INC current_roster_id                       ; CURRENT PLAYER++
	DEC players_left_to_sum	                    ; PLAYERS LEFT TO CHECK--
	BNE @Loop1
	RTS                                         ; RETURN
	
_F}_GET_TEAM_RUSH_PASS_YARDS

_F{_SCHEDULE_DISPLAY_DATA						; DONE



SCHEDULE_DATE_PPU_ADDR_TABLE:                   ; SCHEDULE DATE PPU LOCATIONS
	.WORD SCHEDULE_DATE_WEEK_A_PPU_ADDR
	.WORD SCHEDULE_DATE_WEEK_B_PPU_ADDR
	.WORD SCHEDULE_DATE_WEEK_C_PPU_ADDR  
	.WORD SCHEDULE_DATE_WEEK_D_PPU_ADDR 
	
WEEK_AND_DIVIDING_LINE_DATA:                    ; WEEK AND MOST OF DIVIDING LINE DRAW COMMANDS
	.DB $07                                     ; DATA LENGTH
	.DB SCHEDULE_LINE_TILE_ID, SCHEDULE_LINE_TILE_ID                                
	.DB " WEEK"                                  ; 
	.DB $99, SCHEDULE_LINE_TILE_ID              ; REPEAT ACROSS 9 TIMES (LINE TILE)
	.DB $FF                                     ; END OF DATA

SCHEDULE_DATE_HEADERS_TABLE:                    ; DATE AND REST OF DIVIDING LINE DRAW COMMANDS 
												; data length, data, end of data
	.DB $06, "SEP.1", SCHEDULE_LINE_TILE_ID, $FF
	.DB $06, "SEP.8", SCHEDULE_LINE_TILE_ID, $FF
	.DB $06, "SEP.15", $FF
	.DB $06, "SEP.22", $FF
	.DB $06, "SEP.29", $FF
	.DB $06, "OCT.6", SCHEDULE_LINE_TILE_ID, $FF
	.DB $06, "OCT.13", $FF
	.DB $06, "OCT.20", $FF
	.DB $06, "OCT.27", $FF
	.DB $06, "NOV.3", SCHEDULE_LINE_TILE_ID, $FF
	.DB $06, "NOV.10", $FF
	.DB $06, "NOV.17", $FF
	.DB $06, "NOV.24", $FF
	.DB $06, "DEC.1", SCHEDULE_LINE_TILE_ID, $FF
	.DB $06, "DEC.8", SCHEDULE_LINE_TILE_ID, $FF
	.DB $06, "DEC.15", $FF
	.DB $06, "DEC.22", $FF
	.DB $06, "DEC.29", $FF

SCHEDULE_PPU_ADDR_TABLE:                        ; WEEKLY SCHEDULE PPU LOCATIONS 

@first_week_on_page: 
												
	.WORD WEEK_A_MATCH_1_PPU_ADDR                               
	.WORD WEEK_A_MATCH_2_PPU_ADDR
	.WORD WEEK_A_MATCH_3_PPU_ADDR
	.WORD WEEK_A_MATCH_4_PPU_ADDR
	.WORD WEEK_A_MATCH_5_PPU_ADDR
	
	.WORD WEEK_A_MATCH_6_PPU_ADDR
	.WORD WEEK_A_MATCH_7_PPU_ADDR
	.WORD WEEK_A_MATCH_8_PPU_ADDR
	.WORD WEEK_A_MATCH_9_PPU_ADDR
	.WORD WEEK_A_MATCH_10_PPU_ADDR
	
	.WORD WEEK_A_MATCH_11_PPU_ADDR
	.WORD WEEK_A_MATCH_12_PPU_ADDR
	.WORD WEEK_A_MATCH_13_PPU_ADDR
	.WORD WEEK_A_MATCH_14_PPU_ADDR

@second_week_on_page:   
                                   
	.WORD WEEK_B_MATCH_1_PPU_ADDR                               
	.WORD WEEK_B_MATCH_2_PPU_ADDR
	.WORD WEEK_B_MATCH_3_PPU_ADDR
	.WORD WEEK_B_MATCH_4_PPU_ADDR
	.WORD WEEK_B_MATCH_5_PPU_ADDR
	
	.WORD WEEK_B_MATCH_6_PPU_ADDR
	.WORD WEEK_B_MATCH_7_PPU_ADDR
	.WORD WEEK_B_MATCH_8_PPU_ADDR
	.WORD WEEK_B_MATCH_9_PPU_ADDR
	.WORD WEEK_B_MATCH_10_PPU_ADDR
	
	.WORD WEEK_B_MATCH_11_PPU_ADDR
	.WORD WEEK_B_MATCH_12_PPU_ADDR
	.WORD WEEK_B_MATCH_13_PPU_ADDR
	.WORD WEEK_B_MATCH_14_PPU_ADDR

@third_week_on_page: 
                                      
	.WORD WEEK_C_MATCH_1_PPU_ADDR                               
	.WORD WEEK_C_MATCH_2_PPU_ADDR
	.WORD WEEK_C_MATCH_3_PPU_ADDR
	.WORD WEEK_C_MATCH_4_PPU_ADDR
	.WORD WEEK_C_MATCH_5_PPU_ADDR
	
	.WORD WEEK_C_MATCH_6_PPU_ADDR
	.WORD WEEK_C_MATCH_7_PPU_ADDR
	.WORD WEEK_C_MATCH_8_PPU_ADDR
	.WORD WEEK_C_MATCH_9_PPU_ADDR
	.WORD WEEK_C_MATCH_10_PPU_ADDR
	
	.WORD WEEK_C_MATCH_11_PPU_ADDR
	.WORD WEEK_C_MATCH_12_PPU_ADDR
	.WORD WEEK_C_MATCH_13_PPU_ADDR
	.WORD WEEK_C_MATCH_14_PPU_ADDR
	
@fourth_week_on_page:                                       
	                                  
	.WORD WEEK_D_MATCH_1_PPU_ADDR                               
	.WORD WEEK_D_MATCH_2_PPU_ADDR
	.WORD WEEK_D_MATCH_3_PPU_ADDR
	.WORD WEEK_D_MATCH_4_PPU_ADDR
	.WORD WEEK_D_MATCH_5_PPU_ADDR
	
	.WORD WEEK_D_MATCH_6_PPU_ADDR
	.WORD WEEK_D_MATCH_7_PPU_ADDR
	.WORD WEEK_D_MATCH_8_PPU_ADDR
	.WORD WEEK_D_MATCH_9_PPU_ADDR
	.WORD WEEK_D_MATCH_10_PPU_ADDR
	
	.WORD WEEK_D_MATCH_11_PPU_ADDR
	.WORD WEEK_D_MATCH_12_PPU_ADDR
	.WORD WEEK_D_MATCH_13_PPU_ADDR
	.WORD WEEK_D_MATCH_14_PPU_ADDR

_F}_SCHEDULE_DISPLAY_DATA	

_F{_PRO_BOWL_DATA								; DONE

DEFAULT_AFC_PB_PLAYERS:                        ; DEFAULT AFC PRO BOWL PLAYERS
												; TEAM , PLAYER
	.DB BUF_TEAM_ID	 , QB1_ROSTER_ID                      
	.DB HOU_TEAM_ID	 , QB1_ROSTER_ID                    
	.DB LAR_TEAM_ID , RB1_ROSTER_ID                       
	.DB BUF_TEAM_ID	, RB1_ROSTER_ID                       
	.DB DEN_TEAM_ID , RB1_ROSTER_ID                      
	.DB CIN_TEAM_ID , RB1_ROSTER_ID
	.DB BUF_TEAM_ID	 , WR2_ROSTER_ID
	.DB HOU_TEAM_ID	 , WR2_ROSTER_ID
	.DB SD_TEAM_ID , WR2_ROSTER_ID
	.DB HOU_TEAM_ID	 , RB2_ROSTER_ID						; actually wr
	.DB CIN_TEAM_ID , TE1_ROSTER_ID
	.DB MIA_TEAM_ID , TE1_ROSTER_ID
	.DB BUF_TEAM_ID	 , C_ROSTER_ID 
	.DB HOU_TEAM_ID	 , LG_ROSTER_ID
	.DB LAR_TEAM_ID , LG_ROSTER_ID
	.DB CIN_TEAM_ID ,  LT_ROSTER_ID
	.DB NE_TEAM_ID ,  LT_ROSTER_ID
	.DB BUF_TEAM_ID , RE_ROSTER_ID
	.DB KC_TEAM_ID , NT_ROSTER_ID
	.DB LAR_TEAM_ID , RE_ROSTER_ID
	.DB KC_TEAM_ID , ROLB_ROSTER_ID 
	.DB PIT_TEAM_ID	 , RILB_ROSTER_ID
	.DB MIA_TEAM_ID , LILB_ROSTER_ID
	.DB BUF_TEAM_ID , LOLB_ROSTER_ID
	.DB PIT_TEAM_ID	 , RCB_ROSTER_ID
	.DB KC_TEAM_ID , LCB_ROSTER_ID
	.DB DEN_TEAM_ID , FS_ROSTER_ID
	.DB CIN_TEAM_ID , SS_ROSTER_ID
	.DB KC_TEAM_ID , KICKER_ROSTER_ID
	.DB IND_TEAM_ID , PUNTER_ROSTER_ID

DEFAULT_NFC_PB_PLAYERS:                         ; DEFAULT NFC PRO BOWL PLAYERS
	
	.DB SF_TEAM_ID , QB1_ROSTER_ID      
	.DB PHI_TEAM_ID , QB1_ROSTER_ID
	.DB DET_TEAM_ID , RB1_ROSTER_ID
	.DB WAS_TEAM_ID , RB1_ROSTER_ID
	.DB DAL_TEAM_ID , RB1_ROSTER_ID
	.DB PHX_TEAM_ID , RB1_ROSTER_ID
	.DB SF_TEAM_ID , WR2_ROSTER_ID
	.DB ATL_TEAM_ID , WR2_ROSTER_ID
	.DB GB_TEAM_ID , WR1_ROSTER_ID
	.DB WAS_TEAM_ID , WR2_ROSTER_ID
	.DB PHI_TEAM_ID , TE1_ROSTER_ID
	.DB MIN_TEAM_ID , TE1_ROSTER_ID
	.DB CHI_TEAM_ID , C_ROSTER_ID 
	.DB MIN_TEAM_ID , LG_ROSTER_ID
	.DB CHI_TEAM_ID , LG_ROSTER_ID
	.DB WAS_TEAM_ID ,LT_ROSTER_ID 
	.DB LAM_TEAM_ID, RT_ROSTER_ID
	.DB MIN_TEAM_ID , RE_ROSTER_ID
	.DB DET_TEAM_ID , NT_ROSTER_ID
	.DB PHI_TEAM_ID , LE_ROSTER_ID
	.DB NYG_TEAM_ID , ROLB_ROSTER_ID
	.DB CHI_TEAM_ID , LILB_ROSTER_ID
	.DB NYG_TEAM_ID , RILB_ROSTER_ID 
	.DB SF_TEAM_ID , LOLB_ROSTER_ID
	.DB WAS_TEAM_ID , RCB_ROSTER_ID
	.DB MIN_TEAM_ID ,LCB_ROSTER_ID
	.DB SF_TEAM_ID , FS_ROSTER_ID
	.DB MIN_TEAM_ID , SS_ROSTER_ID
	.DB NO_TEAM_ID , KICKER_ROSTER_ID
	.DB NYG_TEAM_ID , PUNTER_ROSTER_ID

DEFAULT_PB_STARTERS:                          ; DEFAULT STARTERS PROBOWL
										      ; every 0x02 = next player. 00= qb 1, 02 = qb 2, 04= rb1 etc
	.DB $00                                   ; QB 1
	.DB $04                                   ; RB 1
	.DB $06                                   ; RB 2
	.DB $0C                                   ; WR 1
	.DB $0E                                   ; WR 2 
	.DB $14                                   ; TE 1
	.DB $08                                   ; KR = RB 3
	.DB $0A                                   ; PR = RB 4

DEFAULT_KR_PR_TABLE:                          ; DEFAULT KR/PR TABLE
	.DB $59                                   ; KR= RB4, PR = WR4 BUF
	.DB $88                                   ; KR= WR3, PR = WR3 
	.DB $49                                   ; KR= RB3, PR = WR4
	.DB $96                                   ; KR= WR4, PR = WR1
	.DB $88                                   ; KR= WR3, PR = WR3
	.DB $58                                   ; KR= RB4, PR = WR3
	.DB $37                                   ; KR= RB2, PR = WR2
	.DB $BB                                   ; KR= TE2, PR = TE2
	.DB $97                                   ; KR= WR4, PR = WR2
	.DB $66                                   ; KR= WR1, PR = WR1
	.DB $48                                   ; KR= RB3, PR = WR3
	.DB $88                                   ; KR= WR3, PR = WR3
	.DB $88                                   ; KR= WR3, PR = WR3
	.DB $55                                   ; KR= RB4, PR = RB4
	.DB $89                                   ; KR= WR3, PR = WR4
	.DB $33                                   ; KR= RB2, PR = RB2
	.DB $97                                   ; KR= WR4, PR = WR2  
	.DB $55                                   ; WR= RB4, PR = RB4
	.DB $96                                   ; KR= WR4, PR = WR1
	.DB $55                                   ; WR= RB4, PR = RB4
	.DB $55                                   ; WR= RB4, PR = RB4
	.DB $89                                   ; KR= WR3, PR = WR4
	.DB $28                                   ; KR= RB1, PR = WR3
	.DB $89                                   ; KR= WR3, PR = WR4
	.DB $46                                   ; KR= RB3, PR = WR1
	.DB $46                                   ; KR= RB3, PR = WR1
	.DB $55                                   ; KR= RB4, PR = RB4
	.DB $57                                   ; WR= RB4, PR = WR2 ATL
	
_F}_PRO_BOWL_DATA	

_F{_TEAM_CONTROL_DATA							; DONE

TEAM_CONTROL_MENU_OPTIONS_MAP:                  ; MAN,SKP,COA,COM MENU OPTIONS X,Y  MAP
												; TEAM ORDER BY RIGHT TO LEFT THEN TOP TO BOTTOM
	.DB $00, $02                        ; STARTING_Y, STARTING_X 
	.DB $0A, $03                        ; MAX_Y, MAX_X 
	
	.DB $37, $28                        ; BUF
	.DB $37, $78						; HOU
	.DB $37, $C8						; KC
	.DB $47, $28
	.DB $47, $78
	.DB $47, $C8
	.DB $57, $28
	.DB $57, $78
	.DB $57, $C8
	.DB $67, $28
	.DB $67, $78
	.DB $67, $C8
	.DB $77, $28
	.DB $FF, $FF					    ; EMPTY LOCATION NOT CHOOSEABLE
	.DB $77, $C8
	
	.DB $97, $28
	.DB $97, $78
	.DB $97, $C8
	.DB $A7, $28
	.DB $A7, $78
	.DB $A7, $C8
	.DB $B7, $28
	.DB $B7, $78
	.DB $B7, $C8
	.DB $C7, $28
	.DB $C7, $78
	.DB $C7, $C8
	.DB $D7, $28
	.DB $D7, $78
	.DB $FF, $FF							; EMPTY LOCATION NOT CHOOSEABLE

TEAM_CONTROL_TEXT_PPU_ADDR_TABLE:               ; MAN, SKP, COA, COM PPU TEXT LOCATION
												; AFC EAST
	.WORD BUF_TEAM_CONTROL_PPU_ADDR                                 ; BUFFALO 
	.WORD IND_TEAM_CONTROL_PPU_ADDR
	.WORD MIA_TEAM_CONTROL_PPU_ADDR
	.WORD NE_TEAM_CONTROL_PPU_ADDR
	.WORD NYJ_TEAM_CONTROL_PPU_ADDR
												; AFC CENT
	.WORD CIN_TEAM_CONTROL_PPU_ADDR
	.WORD CLE_TEAM_CONTROL_PPU_ADDR
	.WORD HOU_TEAM_CONTROL_PPU_ADDR
	.WORD PIT_TEAM_CONTROL_PPU_ADDR
												; AFC WEST
	.WORD DEN_TEAM_CONTROL_PPU_ADDR
	.WORD KC_TEAM_CONTROL_PPU_ADDR
	.WORD LAR_TEAM_CONTROL_PPU_ADDR
	.WORD SD_TEAM_CONTROL_PPU_ADDR
	.WORD SEA_TEAM_CONTROL_PPU_ADDR
												; NFC EAST
	.WORD WAS_TEAM_CONTROL_PPU_ADDR
	.WORD NYG_TEAM_CONTROL_PPU_ADDR
	.WORD PHI_TEAM_CONTROL_PPU_ADDR
	.WORD PHX_TEAM_CONTROL_PPU_ADDR
	.WORD DAL_TEAM_CONTROL_PPU_ADDR
												; NFC CENT
	.WORD CHI_TEAM_CONTROL_PPU_ADDR 
	.WORD DET_TEAM_CONTROL_PPU_ADDR 
	.WORD GB_TEAM_CONTROL_PPU_ADDR 
	.WORD MIN_TEAM_CONTROL_PPU_ADDR 
	.WORD TB_TEAM_CONTROL_PPU_ADDR 
												; NFC WEST
	.WORD SF_TEAM_CONTROL_PPU_ADDR
	.WORD LAM_TEAM_CONTROL_PPU_ADDR
	.WORD NO_TEAM_CONTROL_PPU_ADDR
	.WORD ATL_TEAM_CONTROL_PPU_ADDR                              ; FALCONS

_F}_TEAM_CONTROL_DATA	

_F{_PASS_ADJUST_DATA							; DONE
		
FINAL_LOC_ADJUST_TABLE:                         ; FINAL PLAYER LOCATION ADJUST TABLE FOR PASS (Y,X) YARDS 
		
												; BALL 90-134 = BALL MOVING RIGHT TO DOWN RIGHT
		.DB $00, $00                            ; 1ST PRIORTY= 0,0           
		.DB $FE, $FC                            ; 2ND PRIORTY= -0.25,-0.5   
		.DB $02, $FC                            ; 3RD PRIORTY= +0.25, -0.5      
		.DB $00, $F9                            ; 4TH PRIORTY= 0, -1 
								
												; BALL 135-179 = BALL MOVING DOWN RIGHT TO DOWN 
		.DB $00, $00                            ; 1ST PRIORTY= 0,0         
		.DB $FC, $FE                            ; 2ND PRIORTY= -0.5,-0.25  
		.DB $FE, $FC                            ; 3RD PRIORTY= -0.25, -0.5      
		.DB $FB, $FB                            ; 4TH PRIORTY= -0.5, -0.5
		
												; BALL 180-224 = BALL MOVING DOWN TO DOWN LEFT
		.DB $00, $00                             ; 1ST PRIORTY= 0,0         
		.DB $FC, $02                             ; 2ND PRIORTY= -0.5, 0.25  
		.DB $FC, $FE                             ; 3RD PRIORTY= -0.5, -0.25      
		.DB $F9, $00                             ; 4TH PRIORTY= -1, 0
		
												; BALL 225-269 = BALL MOVING DOWN LEFT TO LEFT
		.DB $00, $00                            ; 1ST PRIORTY= 0,0         
		.DB $FE, $04                            ; 2ND PRIORTY= -0.25, 0.5  
		.DB $FC, $02                            ; 3RD PRIORTY= -0.5, 0.25      
		.DB $FB, $05                            ; 4TH PRIORTY= -0.5, 0.5
		
												; BALL 270-314 = BALL MOVING LEFT TO UP LEFT
		.DB $00, $00                            ; 1ST PRIORTY= 0,0         
		.DB $02, $04                            ; 2ND PRIORTY= 0.25, 0.5  
		.DB $FE, $04                            ; 3RD PRIORTY= -0.25, 0.5       
		.DB $00, $07                            ; 4TH PRIORTY= 0, 1
								
												; BALL 315-359 = BALL MOVING UP LEFT TO UP 
		.DB $00, $00                            ; 1ST PRIORTY= 0,0         
		.DB $04, $02                            ; 2ND PRIORTY= 0.5, 0.25  
		.DB $02, $04                            ; 3RD PRIORTY= 0.25, 0.5       
		.DB $05, $05                            ; 4TH PRIORTY= 0.5, 0.5

												; BALL 0-44 = BALL MOVING UP TO UP RIGHT 
		.DB $00, $00                            ; 1ST PRIORTY= 0,0         
		.DB $04, $FE                            ; 2ND PRIORTY= 0.5, -0.25  
		.DB $04, $02                            ; 3RD PRIORTY= 0.5, 0.25       
		.DB $07, $00                            ; 4TH PRIORTY= 1, 0

												; BALL 45-89 = BALL MOVING UP RIGHT TO RIGHT
		.DB $00, $00                            ; 1ST PRIORTY= 0,0         
		.DB $02, $FC                            ; 2ND PRIORTY= 0.25, -0.5 
		.DB $04, $FE                            ; 3RD PRIORTY= 0.5, -0.25       
		.DB $05, $FB                            ; 4TH PRIORTY= 0.5, -0.5

_F}_PASS_ADJUST_DATA		

_F{_WEEKLY_SCHEDULE_DATA                        ; DONE

WEEKLY_SCHEDULE_PTR_TABLE:                      ; WEEKLY SCHEDULE POINTER TABLE
	.WORD WEEK_1_SCHED
	.WORD WEEK_2_SCHED
    .WORD WEEK_3_SCHED
	.WORD WEEK_4_SCHED
	.WORD WEEK_5_SCHED
	.WORD WEEK_6_SCHED
	.WORD WEEK_7_SCHED
	.WORD WEEK_8_SCHED
	.WORD WEEK_9_SCHED
	.WORD WEEK_10_SCHED
	.WORD WEEK_11_SCHED
	.WORD WEEK_12_SCHED
	.WORD WEEK_13_SCHED
	.WORD WEEK_14_SCHED
	.WORD WEEK_15_SCHED
	.WORD WEEK_16_SCHED
	.WORD WEEK_17_SCHED

GAMES_PER_WEEK_ARRAY:                           ; GAMES_PER_WEEK


	.DB $0E                                     ; WEEK 1 = 14 GAME
	.DB $0E
	.DB $0E
	.DB $0E 
	.DB $0C 
	.DB $0C 
	.DB $0B 
	.DB $0C 
	.DB $0C 
	.DB $0C 
	.DB $0E 
	.DB $0E 
	.DB $0E 
	.DB $0D 
	.DB $0E 
	.DB $0E 
	.DB $0E                                     ; WEEK 17 = 14 GAMES
	.DB $FF


	
	
WEEK_1_SCHED:                                   ; WEEK 1
	.DB BUF_TEAM_ID, MIA_TEAM_ID
	.DB IND_TEAM_ID, NE_TEAM_ID
	.DB NYJ_TEAM_ID, TB_TEAM_ID
	.DB CIN_TEAM_ID, DEN_TEAM_ID
	.DB CLE_TEAM_ID, DAL_TEAM_ID
	.DB HOU_TEAM_ID, LAR_TEAM_ID
	.DB PIT_TEAM_ID, SD_TEAM_ID
	.DB KC_TEAM_ID, ATL_TEAM_ID
	.DB SEA_TEAM_ID, NO_TEAM_ID
	.DB WAS_TEAM_ID, DET_TEAM_ID
	.DB NYG_TEAM_ID, SF_TEAM_ID
	.DB PHI_TEAM_ID, GB_TEAM_ID
	.DB CHI_TEAM_ID, MIN_TEAM_ID
	.DB PHX_TEAM_ID, LAM_TEAM_ID
	
WEEK_2_SCHED:       
	.DB BUF_TEAM_ID, PIT_TEAM_ID
	.DB IND_TEAM_ID, MIA_TEAM_ID
	.DB NE_TEAM_ID, CLE_TEAM_ID
	.DB NYJ_TEAM_ID, SEA_TEAM_ID
	.DB CIN_TEAM_ID, HOU_TEAM_ID
	.DB DEN_TEAM_ID, LAR_TEAM_ID
	.DB KC_TEAM_ID, NO_TEAM_ID
	.DB SD_TEAM_ID, SF_TEAM_ID
	.DB WAS_TEAM_ID, DAL_TEAM_ID
	.DB NYG_TEAM_ID, LAM_TEAM_ID
	.DB PHI_TEAM_ID, PHX_TEAM_ID
	.DB CHI_TEAM_ID, TB_TEAM_ID
	.DB DET_TEAM_ID, GB_TEAM_ID
	.DB MIN_TEAM_ID, ATL_TEAM_ID
	
WEEK_3_SCHED:
	.DB BUF_TEAM_ID, NYJ_TEAM_ID
	.DB IND_TEAM_ID, LAR_TEAM_ID
	.DB NE_TEAM_ID, PIT_TEAM_ID
	.DB MIA_TEAM_ID, DET_TEAM_ID
	.DB CIN_TEAM_ID, CLE_TEAM_ID
	.DB HOU_TEAM_ID, KC_TEAM_ID
	.DB DEN_TEAM_ID, SEA_TEAM_ID
	.DB SD_TEAM_ID, ATL_TEAM_ID
	.DB WAS_TEAM_ID, PHX_TEAM_ID
	.DB NYG_TEAM_ID, CHI_TEAM_ID
	.DB PHI_TEAM_ID, DAL_TEAM_ID
	.DB GB_TEAM_ID, TB_TEAM_ID
	.DB MIN_TEAM_ID, SF_TEAM_ID
	.DB LAM_TEAM_ID, NO_TEAM_ID
	
WEEK_4_SCHED:
	.DB BUF_TEAM_ID, TB_TEAM_ID
	.DB IND_TEAM_ID, DET_TEAM_ID
	.DB MIA_TEAM_ID, GB_TEAM_ID
	.DB NE_TEAM_ID, HOU_TEAM_ID
	.DB NYJ_TEAM_ID, CHI_TEAM_ID
	.DB CIN_TEAM_ID, WAS_TEAM_ID
	.DB CLE_TEAM_ID, NYG_TEAM_ID
	.DB PIT_TEAM_ID, PHI_TEAM_ID
	.DB DEN_TEAM_ID, SD_TEAM_ID
	.DB KC_TEAM_ID, SEA_TEAM_ID
	.DB PHX_TEAM_ID, DAL_TEAM_ID
	.DB MIN_TEAM_ID, NO_TEAM_ID
	.DB LAR_TEAM_ID, ATL_TEAM_ID
	.DB SF_TEAM_ID, LAM_TEAM_ID
	
WEEK_5_SCHED:
	.DB BUF_TEAM_ID, CHI_TEAM_ID
	.DB IND_TEAM_ID, SEA_TEAM_ID
	.DB MIA_TEAM_ID, NYJ_TEAM_ID
	.DB NE_TEAM_ID, PHX_TEAM_ID
	.DB DEN_TEAM_ID, MIN_TEAM_ID
	.DB KC_TEAM_ID, SD_TEAM_ID
	.DB LAR_TEAM_ID, SF_TEAM_ID
	.DB WAS_TEAM_ID, PHI_TEAM_ID
	.DB NYG_TEAM_ID, DAL_TEAM_ID
	.DB DET_TEAM_ID, TB_TEAM_ID
	.DB GB_TEAM_ID, LAM_TEAM_ID
	.DB NO_TEAM_ID, ATL_TEAM_ID
	
WEEK_6_SCHED:
	.DB BUF_TEAM_ID, KC_TEAM_ID
	.DB IND_TEAM_ID, PIT_TEAM_ID
	.DB MIA_TEAM_ID, NE_TEAM_ID
	.DB NYJ_TEAM_ID, CLE_TEAM_ID
	.DB CIN_TEAM_ID, SEA_TEAM_ID
	.DB HOU_TEAM_ID, DEN_TEAM_ID
	.DB LAR_TEAM_ID, SD_TEAM_ID
	.DB WAS_TEAM_ID, CHI_TEAM_ID
	.DB NYG_TEAM_ID, PHX_TEAM_ID
	.DB PHI_TEAM_ID, TB_TEAM_ID
	.DB DAL_TEAM_ID, GB_TEAM_ID
	.DB DET_TEAM_ID, MIN_TEAM_ID
	
WEEK_7_SCHED:
	.DB BUF_TEAM_ID, IND_TEAM_ID
	.DB MIA_TEAM_ID, KC_TEAM_ID
	.DB NYJ_TEAM_ID, HOU_TEAM_ID
	.DB CIN_TEAM_ID, DAL_TEAM_ID
	.DB CLE_TEAM_ID, WAS_TEAM_ID
	.DB PIT_TEAM_ID, NYG_TEAM_ID
	.DB LAR_TEAM_ID, SEA_TEAM_ID
	.DB SD_TEAM_ID, LAM_TEAM_ID
	.DB PHI_TEAM_ID, NO_TEAM_ID
	.DB PHX_TEAM_ID, MIN_TEAM_ID
	.DB SF_TEAM_ID, ATL_TEAM_ID
	
WEEK_8_SCHED:
	.DB BUF_TEAM_ID, CIN_TEAM_ID
	.DB IND_TEAM_ID, NYJ_TEAM_ID
	.DB MIA_TEAM_ID, HOU_TEAM_ID
	.DB NE_TEAM_ID, MIN_TEAM_ID
	.DB CLE_TEAM_ID, SD_TEAM_ID
	.DB PIT_TEAM_ID, SEA_TEAM_ID
	.DB DEN_TEAM_ID, KC_TEAM_ID
	.DB LAR_TEAM_ID, LAM_TEAM_ID
	.DB PHX_TEAM_ID, ATL_TEAM_ID
	.DB CHI_TEAM_ID, GB_TEAM_ID
	.DB DET_TEAM_ID, SF_TEAM_ID
	.DB TB_TEAM_ID, NO_TEAM_ID
	
WEEK_9_SCHED:
	.DB NE_TEAM_ID, DEN_TEAM_ID
	.DB CIN_TEAM_ID, HOU_TEAM_ID
	.DB CLE_TEAM_ID, PIT_TEAM_ID
	.DB KC_TEAM_ID, LAR_TEAM_ID
	.DB SD_TEAM_ID, SEA_TEAM_ID
	.DB WAS_TEAM_ID, NYG_TEAM_ID
	.DB PHI_TEAM_ID, SF_TEAM_ID
	.DB PHX_TEAM_ID, MIN_TEAM_ID
	.DB DAL_TEAM_ID, DET_TEAM_ID
	.DB CHI_TEAM_ID, NO_TEAM_ID
	.DB GB_TEAM_ID, TB_TEAM_ID
	.DB LAM_TEAM_ID, ATL_TEAM_ID
	
WEEK_10_SCHED:
	.DB BUF_TEAM_ID, NE_TEAM_ID
	.DB IND_TEAM_ID, MIA_TEAM_ID
	.DB NYJ_TEAM_ID, GB_TEAM_ID
	.DB CIN_TEAM_ID, CLE_TEAM_ID
	.DB HOU_TEAM_ID, WAS_TEAM_ID
	.DB PIT_TEAM_ID, DEN_TEAM_ID
	.DB NYG_TEAM_ID, PHI_TEAM_ID
	.DB PHX_TEAM_ID, DAL_TEAM_ID
	.DB CHI_TEAM_ID, DET_TEAM_ID
	.DB MIN_TEAM_ID, TB_TEAM_ID
	.DB SF_TEAM_ID, ATL_TEAM_ID
	.DB LAM_TEAM_ID, NO_TEAM_ID
	
WEEK_11_SCHED:
	.DB BUF_TEAM_ID, GB_TEAM_ID
	.DB IND_TEAM_ID, NYJ_TEAM_ID
	.DB MIA_TEAM_ID, NE_TEAM_ID
	.DB CIN_TEAM_ID, PIT_TEAM_ID
	.DB CLE_TEAM_ID, PHI_TEAM_ID
	.DB HOU_TEAM_ID, DAL_TEAM_ID
	.DB DEN_TEAM_ID, LAR_TEAM_ID
	.DB KC_TEAM_ID, LAM_TEAM_ID
	.DB SD_TEAM_ID, SEA_TEAM_ID
	.DB WAS_TEAM_ID, ATL_TEAM_ID
	.DB NYG_TEAM_ID, PHX_TEAM_ID
	.DB SF_TEAM_ID, NO_TEAM_ID
	.DB CHI_TEAM_ID, MIN_TEAM_ID
	.DB DET_TEAM_ID, TB_TEAM_ID
	
WEEK_12_SCHED:
	.DB BUF_TEAM_ID, MIA_TEAM_ID
	.DB IND_TEAM_ID, CHI_TEAM_ID
	.DB NE_TEAM_ID, NYJ_TEAM_ID
	.DB CIN_TEAM_ID, PHI_TEAM_ID
	.DB CLE_TEAM_ID, HOU_TEAM_ID
	.DB PIT_TEAM_ID, WAS_TEAM_ID
	.DB DEN_TEAM_ID, KC_TEAM_ID
	.DB LAR_TEAM_ID, SEA_TEAM_ID
	.DB SD_TEAM_ID, NO_TEAM_ID
	.DB NYG_TEAM_ID, DAL_TEAM_ID
	.DB PHX_TEAM_ID, SF_TEAM_ID
	.DB DET_TEAM_ID, LAM_TEAM_ID
	.DB GB_TEAM_ID, MIN_TEAM_ID
	.DB TB_TEAM_ID, ATL_TEAM_ID
	
WEEK_13_SCHED:
	.DB BUF_TEAM_ID, NE_TEAM_ID
	.DB IND_TEAM_ID, GB_TEAM_ID
	.DB MIA_TEAM_ID, CHI_TEAM_ID
	.DB NYJ_TEAM_ID, SD_TEAM_ID
	.DB CIN_TEAM_ID, LAR_TEAM_ID
	.DB CLE_TEAM_ID, KC_TEAM_ID
	.DB HOU_TEAM_ID, PIT_TEAM_ID
	.DB DEN_TEAM_ID, SEA_TEAM_ID
	.DB WAS_TEAM_ID, DAL_TEAM_ID
	.DB NYG_TEAM_ID, TB_TEAM_ID
	.DB PHI_TEAM_ID, PHX_TEAM_ID
	.DB DET_TEAM_ID, MIN_TEAM_ID
	.DB SF_TEAM_ID, LAM_TEAM_ID
	.DB NO_TEAM_ID, ATL_TEAM_ID
	
WEEK_14_SCHED:
	.DB BUF_TEAM_ID, NYJ_TEAM_ID
	.DB IND_TEAM_ID, CLE_TEAM_ID
	.DB MIA_TEAM_ID, TB_TEAM_ID
	.DB NE_TEAM_ID, DEN_TEAM_ID
	.DB CIN_TEAM_ID, NYG_TEAM_ID
	.DB HOU_TEAM_ID, PHI_TEAM_ID
	.DB KC_TEAM_ID, SEA_TEAM_ID
	.DB LAR_TEAM_ID, SD_TEAM_ID
	.DB WAS_TEAM_ID, LAM_TEAM_ID
	.DB PIT_TEAM_ID, DAL_TEAM_ID
	.DB CHI_TEAM_ID, DET_TEAM_ID
	.DB GB_TEAM_ID, ATL_TEAM_ID
	.DB SF_TEAM_ID, NO_TEAM_ID
	
WEEK_15_SCHED:
	.DB BUF_TEAM_ID, LAR_TEAM_ID
	.DB IND_TEAM_ID, NE_TEAM_ID
	.DB MIA_TEAM_ID, CIN_TEAM_ID
	.DB NYJ_TEAM_ID, DET_TEAM_ID
	.DB CLE_TEAM_ID, DEN_TEAM_ID
	.DB HOU_TEAM_ID, PIT_TEAM_ID
	.DB KC_TEAM_ID, SD_TEAM_ID
	.DB SEA_TEAM_ID, SF_TEAM_ID
	.DB WAS_TEAM_ID, PHX_TEAM_ID
	.DB NYG_TEAM_ID, PHI_TEAM_ID
	.DB DAL_TEAM_ID, NO_TEAM_ID
	.DB CHI_TEAM_ID, GB_TEAM_ID
	.DB MIN_TEAM_ID, TB_TEAM_ID
	.DB LAM_TEAM_ID, ATL_TEAM_ID
	
WEEK_16_SCHED:
	.DB BUF_TEAM_ID, IND_TEAM_ID
	.DB MIA_TEAM_ID, SD_TEAM_ID
	.DB NE_TEAM_ID, NYJ_TEAM_ID
	.DB CIN_TEAM_ID, PIT_TEAM_ID
	.DB CLE_TEAM_ID, HOU_TEAM_ID
	.DB DEN_TEAM_ID, PHX_TEAM_ID
	.DB KC_TEAM_ID, SF_TEAM_ID
	.DB LAR_TEAM_ID, NO_TEAM_ID
	.DB SEA_TEAM_ID, ATL_TEAM_ID
	.DB WAS_TEAM_ID, NYG_TEAM_ID
	.DB PHI_TEAM_ID, DAL_TEAM_ID
	.DB CHI_TEAM_ID, TB_TEAM_ID
	.DB DET_TEAM_ID, GB_TEAM_ID
	.DB MIN_TEAM_ID, LAM_TEAM_ID
	
WEEK_17_SCHED:
	.DB BUF_TEAM_ID, DET_TEAM_ID
	.DB IND_TEAM_ID, TB_TEAM_ID
	.DB MIA_TEAM_ID, NYJ_TEAM_ID
	.DB NE_TEAM_ID, CIN_TEAM_ID
	.DB CLE_TEAM_ID, PIT_TEAM_ID
	.DB HOU_TEAM_ID, NYG_TEAM_ID
	.DB DEN_TEAM_ID, SD_TEAM_ID
	.DB KC_TEAM_ID, LAR_TEAM_ID
	.DB SEA_TEAM_ID, LAM_TEAM_ID
	.DB WAS_TEAM_ID, PHI_TEAM_ID
	.DB PHX_TEAM_ID, NO_TEAM_ID
	.DB DAL_TEAM_ID, ATL_TEAM_ID
	.DB CHI_TEAM_ID, SF_TEAM_ID
	.DB MIN_TEAM_ID, GB_TEAM_ID
	
_F}_WEEKLY_SCHEDULE_DATA

.PAD $A000, $FF