.BASE $8000
.ORG  $8000


BANK_JUMP_DRAW_NFL_LEADERS_SCREEN:	
	JMP DRAW_NFL_LEADERS_SCREEN	
	
BANK_JUMP_DRAW_PLAYER_DATA_SCREEN:	
	JMP DRAW_PLAYER_DATA_SCREEN 
	
BANK_JUMP_DRAW_DRAW_PLAYER_POSITION_ABBREV_PRO_BOWL:	
	JMP DRAW_PLAYER_POSITION_ABBREV_PRO_BOWL 			                                           

_F{_LEADER_SCREEN_CONSTANTS

NUMBER_OF_PLAYERS_PER_LEADER_SCREEN					= $06
NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN	 	= $0A
OFFSET_TO_NEXT_RANKING_INDEX						= $06

SCROLL_TO_RIGHT_QB_LEADER_SCREEN_FRAMES				= $34
SCROLL_TO_LEFT_QB_LEADER_SCREEN_FRAMES				= $1C

SCROLL_TO_LEADER_SCREEN_FRAMES						= $1C

_F}_LEADER_SCREEN_CONSTANTS

_F{_LEADER_SCREEN_SEGMENT_VARIABLES

FIRST_ROSTER_ID					= SEGMENT_VAR_8E
LAST_ROSTER_ID					= SEGMENT_VAR_8F
FIRST_STAT_INDEX				= SEGMENT_VAR_90				                ; numerator in divides
SECOND_STAT_INDEX				= SEGMENT_VAR_91				                ; 
																				; 92,93,94 used for stats
CURRENT_ROSTER_ID				= SEGMENT_VAR_9D
NUM_OF_TEAMS_LEFT_TO_CHECK		= SEGMENT_VAR_9E
STAT_TO_SORT_ON					= SEGMENT_VAR_9F

CURRENT_LEADERS_PPU_ADDR		= SEGMENT_VAR_A6								;
CURRENT_LEADERS_ARRAY_INDEX		= SEGMENT_VAR_A8								; index into sorted stats array
SAVE_NUM_TEAMS_TO_CHECK			= SEGMENT_VAR_A9
SAVE_FIRST_TEAM_TO_CHECK		= SEGMENT_VAR_AA
PLAYERS_TO_LIST_PER_SCREEN		= SEGMENT_VAR_AB

_F}_LEADER_SCREEN_SEGMENT_VARIABLES

_F{_LEADER_SCREEN_MACROS

.MACRO DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] screen_id
	LDA #screen_id						                       				    ; SET SCREEN DRAW INDEX = NFL PASSING LEADERS
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK 		                        ; SET BANK = BANK 8
	JSR DRAW_SCENE_UNTIL_ENDED							                        ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	LDA #$0F											                        ; SET SOFT CHR 1800 = CHR SECTION WITH COLORED STARS
	STA SOFT_CHR_1800_BANK												        ; 
.ENDM 

.MACRO INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[]
																				;
	LDA #<INDIV_LEADER_SCREEN_STARTING_PPU_ADDR						            ; SET CURRENT PPU ADDR = START OF LEADERS TEXT
	STA CURRENT_LEADERS_PPU_ADDR							                    ;
	LDA #>INDIV_LEADER_SCREEN_STARTING_PPU_ADDR						            ;
	STA CURRENT_LEADERS_PPU_ADDR + 1							                ;
@set_players_to_list_per_screen:	
	LDA #NUMBER_OF_PLAYERS_PER_LEADER_SCREEN						                    ; SET PLAYERS PER SCREEN FOR QB RATING = 6 
	STA PLAYERS_TO_LIST_PER_SCREEN							                    ; 
.ENDM

.MACRO SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset] addr, offset
	LDA #<addr					                    							; SET DATA ADDR =  COLUMN NAMES DATA
	STA stat_label_data_addr							                        ;
	LDA #>addr					                    							;
	STA stat_label_data_addr +1 							                    ;
	LDX #offset																	; SET PPU OFFSET = START OF COLUMN NAMES
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)	
    JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						        ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(X,Y= PPU ADDR, 3E,3F=DATA ADDR)
.ENDM

.MACRO SET_LEADER_SCREEN_LABEL_DATA_ADDR_SCREEN_TWO[addr_offset] addr, offset
	LDA #<addr					                    							; SET DATA ADDR =  COLUMN NAMES DATA
	STA stat_label_data_addr							                        ;
	LDA #>addr					                    							;
	STA stat_label_data_addr +1 							                    ;
	LDX #offset																	; SET PPU OFFSET = START OF COLUMN NAMES
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR_SCREEN_TWO					                        ; UPDATE PPU ADDR (X= OFFSET)	
    JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						        ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(X,Y= PPU ADDR, 3E,3F=DATA ADDR)
.ENDM



.MACRO DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] skill, ppuaddr
	LDA #skill						                                            ; SET SKILL INDEX = INTERCEPTIONS 
	LDY #<ppuaddr						                                            ; SET PPU ADDR =   INTERCEPTION ABILITY PPU ADDR 
	LDX #>ppuaddr						                                            ;
	JSR DRAW_ATTRIBUTE_BAR_PLAYER_DATA					                        ; DRAW ATTRIBUTE BAR(X,Y=PPU NAMETABLE ADDRESS, A= SKILL TO DRAW)
.ENDM

.MACRO DRAW_SINGLE_STAT_LEADER_SCREEN_LABELS_BASED_ON_MENU_CHOICE[Stat_sort_Table_addr] sortIndex, tableloc
table_addr = LOCAL_1

	LDA MENU_Y						                                            ; STAT TO SORT ON = KR LEADERS MENU CHOICE
	CLC							                                                ;
	ADC #sortIndex					                    					    ; + KR LEADERS OFFSET
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER INDEX = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	LDA MENU_Y						                                            ; SHIFT MENU CHOICE FOR INDEX INTO TABLE
	ASL							                                                ;		
	TAX							                                                ; 
	LDA tableloc-2,X					        								; LOAD SCREEN LABEL DATA ADDR FROM PR AND KR LEADERS INDIVIDIUAL SCREENS LABEL POINTERS
	STA table_addr						                                        ;
	LDA tableloc-1,X					        								;
	STA table_addr + 1					                                        ; 
	LOAD_ADDR_XY[mem_loc] SINGLE_STAT_LEADER_SCREEN_TITLE_PPU_ADDR
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS
	.ENDM 
	
_F}_LEADER_SCREEN_MACROS	

_F{_DRAW_NFL_LEADERS_SCREEN			                                         



remainder						= LOCAL_5
divisor							= LOCAL_7
save_menu_y						= LOCAL_8

NUMBER_OF_LEADER_SORT_CHOICES	= $03	                                        ; NFL,AFC, NFC
AFC_LEADERS_MENU_CHOICE			= $01 

DRAW_NFL_LEADERS_SCREEN:			                                            ; DRAW NFL LEADER SCREEN(E1= MENU INDEX)
	JSR SET_MMC3_VERT_MIRROR		                                            ; SET GAME STATUS AND MMC3 MIRRORING TO VERTICAL()
	LDA MENU_Y						                                            ; SET TEMP Y MENU INDEX = Y MENU INDEX
	STA save_menu_y					                                            ;
	LDA #NUMBER_OF_LEADER_SORT_CHOICES						                    ;
	STA divisor					                                                ;
	JSR DIVIDE_8_BIT				                                            ; 8 BIT DIVIDE ($45/$44) QUOTIENT $45 REMAINDER $42 = MENU INDEX /3 
	LDA remainder				                                                ; SAVE REMAINDER IN $6F
	STA LEADERS_MENU_CHOICE			                                            ; 
	BEQ @all_of_nfl_menu_choice		                                            ; IS MENU CHOICE NFL? YES?-> ALL OF NFL
	
@check_for_afc	
	CMP #AFC_LEADERS_MENU_CHOICE	                                            ; IS MENU OPTION= AFC ONLY
	BEQ @afc_menu_choice			                                            ; YES->AFC MENU CHOICE	
							

@nfc_menu_choice:					                                            ; NFC MENU CHOICE	
    LDA #FIRST_TEAM_IN_NFC			                                            ; SET STATING TEAM = WASHINGTON
	TAX								                                            ; *** shortcut could make explicit SET NUMBER OF TEAMS = 14
	JMP @save_info

@afc_menu_choice:					                                            ; AFC MENU CHOICE						
	LDA #FIRST_TEAM_IN_AFC				                                        ; SET STARTING TEAM = BUFFALO
	LDX #NUMBER_OF_TEAMS_IN_EACH_CONFERENCE					                    ; SET NUMBER OF TEAMS = 14	
	JMP @save_info

@all_of_nfl_menu_choice:			                                            ; ALL OF NFL
	LDA #FIRST_TEAM_IN_AFC			                                            ; SET STARTING TEAM = BUFFALO
	LDX #NUMBER_OF_TEAMS_IN_LEAGUE	                                            ; SET NUMBER OF TEAMS = 28

@save_info:							                                            ; 
	STA CURRENT_TEAM				                                            ; SET CURRENT TEAM = STARTING TEAM
	STA SAVE_FIRST_TEAM_TO_CHECK	                                            ;
	STX NUM_OF_TEAMS_LEFT_TO_CHECK	                                            ; SET NUMBER OF TEAMS LEFT TO CHECK = NUMBER OF TEAMS
	STX SAVE_NUM_TEAMS_TO_CHECK		                                            ;
	LDA save_menu_y					                                            ; LOAD Y MENU INDEX
	LDX MENU_X						                                            ; LOAD X MENU INDEX
	BEQ @do_leaders_screen			                                            ;

@check_for_receiving_leaders	
	CPX #$01						                                            ; IS MENU CHOICE = 3RD COLLUMN OF CHOICE?
	BNE @choice_is_third_column						                            ; YES->MENU CHOICE IS 3RD COLLUMN OF CHOICES
	JMP DRAW_RECEIVING_LEADERS_SCREEN						                    ; ELSE JUMP->DRAW RECEIVING LEADERS

@choice_is_third_column:								                        ; MENU CHOICE IS 3RD COLLUMN OF CHOICES
	CLC								                                            ;
	ADC #$04						                                            ; SET MENU INDEX += 04 

@do_leaders_screen:					                                            ; CONVERT MENU INDEX AND JUMP TO MENU CHOICE OPTION(A= MENU CHOICE INDEX) 
	PUSH_TABLE_ADDR[tableAddr]	NFL_LEADER_SCREENS_TABLE

NFL_LEADER_SCREENS_TABLE:									                    ; NFL LEADERS CHOICES  
	.WORD DRAW_PASSING_LEADERS_SCREEN-1 					                    ; DRAW PASSING LEADERS
    .WORD DRAW_SCORING_LEADERS_SCREEN-1 					                    ; DRAW SCORING LEADERS 
    .WORD DRAW_INTERCEPTION_LEADERS_SCREEN-1 					                ; DRAW INTERCEPTIONS LEADERS 
    .WORD DRAW_PUNT_RETURN_LEADERS_SCREEN-1 					                ; DRAW PUNT RETURN LEADERS 
    .WORD DRAW_RUSHING_LEADERS_SCREEN-1 					                    ; DRAW RUSHING LEADERS 
    .WORD DRAW_PUNTING_LEADERS_SCREEN-1 					                    ; DRAW PUNTING LEADERS
    .WORD DRAW_SACKS_LEADERS_SCREEN-1 					                        ; DRAW SACKS LEADERS
    .WORD DRAW_KICK_RETURN_LEADERS_SCREEN-1					                    ; DRAW KICKOFF RETURN LEADERS
	   
_F}_DRAW_NFL_LEADERS_SCREEN	   

_F{_DRAW_PASSING_LEADERS_SCREEN												


num_tiles_per_row 				=	LOCAL_1
num_rows						= 	LOCAL_2

stat_label_data_addr			= LOCAL_1
temp_stat						= LOCAL_7



DRAW_PASSING_LEADERS_SCREEN:							                        ; DRAW NFL PASSING LEADERS
	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] LEADING_PASSERS_SCENE_ID
	
DRAW_STATS_PASSING_LEADERS_SCREEN:						                        ; DRAW NFL PASSING LEADERS BACKGROUND ALREADY DRAWN
	LDA #SORT_ON_QB_RATING_INDEX						                        ; SET STAT TO SORT BY = QB RATING
	JSR SORT_STATS_LEADERS[stat]					                            ; SORT STATS (A= STAT TO SORT BY)
	
@set_player_index_to_first_plaayer:	
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX							                    ;

@draw_one_page_of_passing_leaders:								                ; DRAW ONE PAGE OF PASSER RATING LEADERS
	INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[]	

@draw_screen_one_stat_labels:							                        ; DRAW STAT LABELS, RANKS, NAMES , TEAM ABBREV, STATS_LOOP
	SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset] PASSING_LEADERS_STAT_LABELS_DATA, OFFSET_TO_PASSING_LEADER_COLUMN_NAMES_SCREEN_ONE


	
@draw_screen_two_stat_labels:
	SET_LEADER_SCREEN_LABEL_DATA_ADDR_SCREEN_TWO[addr_offset] PASSING_LEADERS_SECOND_SCREEN_STAT_LABELS_DATA, OFFSET_TO_PASSING_LEADER_COLUMN_NAMES_SCREEN_TWO 	
	

@draw_ranks_player_name_team	
	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES					                 ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA
	BCC @draw_passing_stats			                                            ; AT END OF DATA? NO-> DRAW PASSING STATS
	JMP @clear_stats_if_no_players						                        ; YES->

@draw_passing_stats:				                                            ; DRAW PASSING STATS 

@draw_passing_att:
	LDX #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX							            ; SET STAT TO GET = PASSING ATTEMTS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_PASSING_LEADER_PASSING_ATTEMPTS						        ; SET DRAW OFFSET = PASSING ATTEMPTS
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
@draw_passing_comp:	
	LDX #QB_PASS_COMPLETIONS_SEASON_STAT_INDEX							        ; SET STAT TO GET = PASSING COMPLETIONS  
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_PASSING_LEADER_PASSING_COMPLETIONS						    ; SET DRAW OFFSET = PASSING COMPLETIONS  
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
@draw_comp_pct:		
	LDA #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX						                ; SET DIVISOR STAT INDEX = PASSING ATTEMPTS
	STA SECOND_STAT_INDEX							                            ;
	LDA #QB_PASS_COMPLETIONS_SEASON_STAT_INDEX						            ; SET NUMERATOR STAT INDEX = PASSING COMPLETIONS
	STA FIRST_STAT_INDEX							                            ;
	LDX CURRENT_LEADERS_ARRAY_INDEX							                    ; SET CURRENT TEAM = CURRENT TEAM FOR PLAYER STATS
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ;
	STA CURRENT_TEAM				                                            ;
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						            ; SET PLAYER ID = CURRENT PLAYER FOR PLAYER STATS
	STA CURRENT_ROSTER_ID							                            ;
	JSR CALCULATE_PERCENTAGE_LEADERS					                        ; CALCULATE PERCENTAGE ($90= NUMERATOR STAT INDEX, $91 = DIVISOR STAT INDEX, 6E= TEAM, 9D= PLAYER)
	JSR LEADERS_HEX_TO_DEC_ONE_PT_PRECISION					                    ; CONVERT HEX VALUE TO BCD, ONE DECIMAL PT PRECISION($43,$44,$45)
	LDX #OFFSET_TO_PASSING_LEADER_COMP_PCT_VALUE						        ; SET DRAW OFFSET = COMP %  
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	LDX #OFFSET_TO_PASSING_LEADER_PERCENT_SIGN						            ; SET DRAW OFFSET = PERCENTAGE SIGN   
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA #PERCENT_SIGN_LEADERS_TILE_ID						                    ; SET TILE ID = "%" 
	JSR ADD_SINGLE_TILE_TO_BG_BUFFER					                        ; BUFFER SINGLE TILE (A= TILE ID)
	
@draw_passing_yards:	
	LDX #QB_PASS_YDS_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = YARDS 
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                                            ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_PASSING_LEADER_PERCENT_YARDS						                                            ; SET DRAW OFFSET = YARDS   
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)
	
@draw_yards_per_attempt:	
	LDX #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX							            ; SET FIRST STAT = PASSING ATTEMPTS
	LDY #QB_PASS_YDS_SEASON_STAT_INDEX						                    ; SET SECOND STAT = PASSING YARDS
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS					        ; GET YARDS PER STAT LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LDX #OFFSET_TO_PASSING_LEADER_PERCENT_YARDS_PER_ATTEMPT						; SET DRAW OFFSET = AVERAGE PASSING YARDS   
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	
@draw_passing_tds:	
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	LDX #QB_PASS_TD_SEASON_STAT_INDEX						                    ; SET STAT INDEX = PASSING TDS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_PASSING_LEADER_PASSING_TDS						            ; SET PPU OFFSET = PASSING TDS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR_SCREEN_TWO					                ; UPDATE PPU ADDR TO SECOND SCREEN (X= OFFSET)
	LDA temp_stat							                                            ; LOAD PASSING TDS
	JSR CONVERT_2_DIG_NUM_TILES		                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
@draw_passing_ints:
	LDX #QB_PASS_INT_SEASON_STAT_INDEX						                     ; SET STAT INDEX = PASSING INTS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)					
	LDX #OFFSET_TO_PASSING_LEADER_PASSING_INTS						             ; SET PPU OFFSET = PASSING INTS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR_SCREEN_TWO					                ; UPDATE PPU ADDR TO SECOND SCREEN (X= OFFSET)
	LDA temp_stat							                              ; LOAD PASSING INTS
	JSR CONVERT_2_DIG_NUM_TILES		                                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	

@draw_passer_rating:	
	JSR TRANSFER_BCD_STAT_TO_TEMP_VARS					                        ; GET SORTED NUMBER()
	LDX #OFFSET_TO_PASSING_LEADER_PASSING_RATING							    ; SET PPU OFFSET = PASSER RATING DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR_SCREEN_TWO					        ; UPDATE PPU ADDR TO SECOND SCREEN (X= OFFSET)
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	JMP @update_ppu_addr_go_to_next_player						                ; JUMP->UPDATE PPU ADDR AND GO TO NEXT PLAYER

@clear_stats_if_no_players:							                            ; CLEAR SECOND SCREEN STATS IF AT END OF DATA
	LDX #OFFSET_TO_PASSING_LEADER_PASSING_TDS						            ; SET PPU OFFSET = PASSING TDS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR_SCREEN_TWO					                ; UPDATE PPU ADDR TO SECOND SCREEN (X= OFFSET)
	LDA #$01						                                            ; SET NUM ROWS = 1 
	STA num_rows							                                    ;
	LDA #$0C						                                            ; SET LENGTH = 12 TILES
	STA num_tiles_per_row							                            ;
	JSR FILL_SCREEN_BLANK_TILE_AREA						                        ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)

@update_ppu_addr_go_to_next_player:							                    ; UPDATE PPU ADDR AND GO TO NEXT PLAYER
	JSR SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER					    ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER()
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN --
	BEQ @set_array_index_back_to_first_player					                ; DONE? YES-> SET PLAYER INDEX BACK TO FIRST PLAYER
	JMP @draw_screen_one_stat_labels					                        ; NO->DRAW STAT LABELS, RANKS, NAMES , TEAM ABBREV, STATS_LOOP

@set_array_index_back_to_first_player:							                ; SET PLAYER INDEX BACK TO FIRST PLAYER
	LDA CURRENT_LEADERS_ARRAY_INDEX							                    ; PLAYER INDEX = PLAYER INDEX - LENGTH OF PLAYER DATA PER SCREEN
	SEC								                                            ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)			;
	STA CURRENT_LEADERS_ARRAY_INDEX							                    ;

_WHILE ALWAYS							                                        ; QB RATING WAIT FOR JOY PAD INPUT

@wait_for_joy_input	
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	; SET DISTANCE TO NEXT SET OF PLAYER DATA = 36 BYTES
	LDA #SCROLL_TO_RIGHT_QB_LEADER_SCREEN_FRAMES						        ; SET SCROLL TIMER = 48 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCS @right_pressed						                                    ; RIGHT PRESSED? YES->RIGHT PRESSED SCROLL TO MENU CHOICES
	JMP @draw_one_page_of_passing_leaders						                ; DRAW ONE PAGE OF PASSER RATING LEADERS

@right_pressed:							                                        ; RIGHT PRESSED SCROLL TO MENU CHOICES
	LDY #<PASSING_LEADERS_MENU_DATA					                            ; SET MENU INFO ADDR = PASSING LEADERS SCREEN MENU INFO
	LDX #>PASSING_LEADERS_MENU_DATA					                            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @wait_for_joy_input						                                ;
	LDA MENU_Y						                                            ; DOES MENU CHOICE = ANYTHING BUT FIRST CHOICE?
	BNE @do_qb_menu_choice			                                            ; YES->DO QB MENU CHOICE
	JSR LEFT_PRESSED_LEADERS_MENU					                                            ; NO->LEFT PRESSED 

_END_WHILE 						                                                 ; JUMP->QB RATING WAIT FOR JOY PAD INPUT

@do_qb_menu_choice:							                                    ; DO QB MENU CHOICE
	LDA MENU_Y						                                            ; LOAD MENU CHOICE
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #LEADING_PASSERS_MENU_SCENE_ID						                    ; SET SCREEN ID = NFL LEADING PASSERS SCREEN
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK 						        ; SET BANK = BANK 8
	JSR DRAW_SCENE_UNTIL_ENDED						                            ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= SCREEN ID, X = BANK)
	LDA MENU_Y						                                            ; CONVERT MENU CHOICE INTO TABLE INDEX
	ASL							                                                ;
	TAX							                                                ;
	LDA SINGLE_STAT_PASS_LEADER_LABEL_ADDR_TABLE-2,X					        ; LOAD SCREEN LABEL DATA ADDR FROM PASSING LEADERS INDIVIDIUAL SCREENS LABEL POINTERS
	STA stat_label_data_addr						                            ;
	LDA SINGLE_STAT_PASS_LEADER_LABEL_ADDR_TABLE-1,X					        ;
	STA stat_label_data_addr+1						                            ; 
	LOAD_ADDR_XY[mem_loc] SINGLE_STAT_LEADER_SCREEN_TITLE_PPU_ADDR
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						        ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(X,Y= PPU ADDR, 3E,3F=DATA ADDR)

	LDA #$00						                                            ; SET PLAYER INDEX = FIRST RANKED PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ; 

@single_stat_loop:							                                     ; DRAW RANK, NAME, TEAM, STAT FOR SINGLE STAT QB SCREEN 
	JSR DRAW_RANK_NAME_TEAM_STATS_BLUE_TEAM_TEXT					            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH BLUE TEAM TEXT()

@wait_for_joy_single_stat:							                                            ; QB SINGLE STAT SCREEN INPUT LOOP
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)						                                          
	LDA #SCROLL_TO_LEFT_QB_LEADER_SCREEN_FRAMES						            ; SET SCROLL TIMER = 28 BYTES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @single_stat_loop					                                    ; SCROLL TO NEW PLAYER STAT PAGE? YES->DRAW RANK, NAME, TEAM, STAT FOR SINGLE STAT QB SCREEN

@draw_qb_single_stat_menu:	
	LDY #<PASSING_LEADERS_SINGLE_SCREEN_MENU_DATA					            ; SET MENU INFO ADDR = PASSING LEADERS ALL OTHER QB STAT SCREENS MENU INFO
	LDX #>PASSING_LEADERS_SINGLE_SCREEN_MENU_DATA					            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @wait_for_joy_single_stat						                        ; NO INPUT->QB SINGLE STAT SCREEN INPUT LOOP
	LDA MENU_Y						                                            ; LOAD MENU CHOICE
	BNE @do_qb_menu_choice						                                ; IS CHOICE = QB RATING? NO->DO QB MENU CHOICE
	LDA #LEADING_PASSERS_HEADERS_SCENE_ID						                ; 
	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK 						        ; SET BANK = BANK 8
	JSR DRAW_SCENE_UNTIL_ENDED						                            ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= CUTSCENE INDEX, X = BANK)
	JMP DRAW_STATS_PASSING_LEADERS_SCREEN
						                                                        ; JUMP->DRAW NFL PASSING LEADERS BACKGROUND ALREADY DRAWN

_F}_DRAW_PASSING_LEADERS_SCREEN

_F{_DRAW_SCORING_LEADERS_SCREEN													

temp_stat_value				= LOCAL_7
CURRENT_TD_TOTAL			= SEGMENT_VAR_8E

DRAW_SCORING_LEADERS_SCREEN:							                        ; DRAW SCORING LEADERS

	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] LEADING_SCORERS_SCENE_ID 


DRAW_STATS_SCORING_LEADERS_SCREEN:							                    ; DRAW SCORING LEADERS TEXT FOR CURRENT PAGE
	LDY #<SCORING_LEADERS_ATTR_DATA_TABLE					                    ; SET ATTRIBUTE TABLE ADDR = SCORING LEADERS ATRRIBUTE TABLE DATA
	LDX #>SCORING_LEADERS_ATTR_DATA_TABLE					                    ; 
	JSR TRANSFER_LEADERS_SCREEN_ATTR_TABLE_DATA					                                            ; UPDATE ATTRIBUTE TABLE DEPENDING ON FADE (X,Y=DATA ADDRESS)
	LDA #SORT_ON_TOTAL_PTS_INDEX						                        ; SET STATS TO SORT ON = TOTAL PTS
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@draw_one_page_of_scoring_leaders:							                                            ; DRAW SCORING LEADERS STATS SORTED AND BACKGROUND DRAWN
	INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[]

@draw_screen_stat_labels:							                                            ; DRAW SCORING LEADERS LOOP
	SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset] SCORING_LEADERS_STAT_LABELS_DATA, OFFSET_TO_SCORING_LEADER_COLUMN_NAMES

@draw_ranks_player_name_team
	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES					                ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA
	BCC @draw_scoring_leader_stats						                        ; AT END OF DATA? NO->GET SCORING LEADER STATS
	JMP @check_done_drawing_player_stats

@draw_scoring_leader_stats:							                            ; GET AND DRAW SCORING LEADER STATS
	LDX CURRENT_LEADERS_ARRAY_INDEX						                        ; LOAD CURRENT PLAYER ID  FROM PLAYER ARRAY
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						                                            ;
	
	CMP #KICKER_ROSTER_ID						                                ; IS PLAYER ID = KICKER?
	BCS @get_kicker_points						                                            ; YES->DRAW FG KICKER STATS
	
	CMP #RE_ROSTER_ID						                                    ; IS PLAYER ID = DEFENDER?
	BCS @get_defender_tds					                                            ; YES->GET DEFENDER INT TD'S
	
	CMP #RB1_ROSTER_ID						                                    ; IS PLAYER ID = RB,WR,TE? 
	BCS @get_skill_player_scoring_stats						                                            ; YES-> GET SKILL PLAYER STATS
	
								                                                ; GET QB RUSHING TDS
	LDX #QB_RUSH_TD_SEASON_STAT_INDEX						        									; SET STAT TO GET = QB RUSHING TDS
	JSR GET_PLAYER_SEASON_STAT_HEX_VALUE_LEADER_SCREEN					        ; GET ONE BYTE (MAX 255) STAT (X= STAT INDEX)
	JMP @draw_number_of_touchdowns						                        ; JUMP->CONVERT HEX VALUE TO BCD AND DRAW VALUE

@get_skill_player_scoring_stats:							                    ; GET SKILL PLAYER STATS
	LDX #SKILL_REC_TD_SEASON_STAT_INDEX						                    ; SET STAT TO GET = SKILL PLAYER REC TDS
	JSR GET_PLAYER_SEASON_STAT_HEX_VALUE_LEADER_SCREEN					        ; GET ONE BYTE (MAX 255) STAT (X= STAT INDEX)
	STA CURRENT_TD_TOTAL							                                            ;
	LDX #SKILL_KR_TDS_SEASON_STAT_INDEX						                    ; SET STAT TO GET = SKILL PLAYER RUSH TDS
	JSR GET_PLAYER_SEASON_STAT_HEX_VALUE_LEADER_SCREEN					        ; GET ONE BYTE (MAX 255) STAT (X= STAT INDEX)
	CLC								                                            ;
	ADC CURRENT_TD_TOTAL							                                            ;
	STA CURRENT_TD_TOTAL							                                            ;
	LDX #SKILL_PR_TDS_SEASON_STAT_INDEX						                    ; SET STAT TO GET = SKILL PLAYER PR TDS
	JSR GET_PLAYER_SEASON_STAT_HEX_VALUE_LEADER_SCREEN					        ; GET ONE BYTE (MAX 255) STAT (X= STAT INDEX)
	CLC								                                            ;
	ADC CURRENT_TD_TOTAL							                                            ;
	STA CURRENT_TD_TOTAL							                                            ;
	LDX #SKILL_RUN_TD_SEASON_STAT_INDEX						                    ; SET STAT TO GET = SKILL PLAYER RUN TDS
	JSR GET_PLAYER_SEASON_STAT_HEX_VALUE_LEADER_SCREEN					        ; GET ONE BYTE (MAX 255) STAT (X= STAT INDEX)
	CLC								                                            ;
	ADC CURRENT_TD_TOTAL							                                            ; = SUM OF ALL TD'S
	JMP @draw_number_of_touchdowns						                        ; JUMP->CONVERT HEX VALUE TO BCD AND DRAW NUMBER OF TDS

@get_defender_tds:							                                    ; GET DEFENDER INT TD'S
	LDX #DEF_INT_TDS_SEASON_STAT_INDEX						                    ; SET STAT TO GET = DEF INT TDS
	JSR GET_PLAYER_SEASON_STAT_HEX_VALUE_LEADER_SCREEN					        ; GET ONE BYTE (MAX 255) STAT (X= STAT INDEX)

@draw_number_of_touchdowns:							                            ; CONVERT HEX VALUE TO BCD AND DRAW  NUMBER OF TDS
	JSR HEX_TO_2_DIGIT_DEC						                                ; CONVERT HEX TO DECIMAL (A= NUMBER TO CONVERT)
	LDX #OFFSET_TO_SCORING_LEADER_TOTAL_TDS						                                            ; SET PPU OFFSET = TOUCHDOWNS
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)
	JMP @draw_scoring_leader_total_points						                                            ; 

@get_kicker_points:							                                            ; DRAW FG KICKER STATS

	LDX #XP_MADE_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = MADE XP'S
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_SCORING_LEADER_XPS						                                            ; SET PPU OFFSET = MADE XP LOC
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA temp_stat_value						                                                ; LOAD MADE XP VALUE
	JSR CONVERT_2_DIG_NUM_TILES						                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	LDX #OFFSET_TO_SCORING_LEADER_XP_SLASH						                                            ; SET PPU OFFSET = XP SLASH LOCATION
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA #FG_XP_SLASH_LEADERS_TILE_ID						                                            ; SET TILE = " / "
	JSR ADD_SINGLE_TILE_TO_BG_BUFFER					                        ; BUFFER SINGLE TILE (A= TILE ID)
	
	LDX #XP_ATT_SEASON_STAT_INDEX						                        ; SET STAT TO GET = XP ATT
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_SCORING_LEADER_XP_ATT						                                            ; SET PPU OFFSET = XP ATT LOC
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA temp_stat_value						                                     ; LOAD XP ATT VALUE
	JSR CONVERT_2_DIG_NUM_TILES						                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	LDX #FG_MADE_SEASON_STAT_INDEX						                        ; SET STAT TO GET = MADE FG'S 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_SCORING_LEADER_FGS						                                            ; SET PPU OFFSET = MADE FG'S LOC
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA temp_stat_value						                                    ; LOAD MADE FG VALUE
	JSR CONVERT_2_DIG_NUM_TILES						                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	
	LDX #OFFSET_TO_SCORING_LEADER_FG_SLASH						                 ; SET PPU OFFSET = FG SLASH LOCATION
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA #FG_XP_SLASH_LEADERS_TILE_ID						                    ; SET TILE = " / "
	JSR ADD_SINGLE_TILE_TO_BG_BUFFER					                        ; BUFFER SINGLE TILE (A= TILE ID)
	
	LDX #FG_ATT_SEASON_STAT_INDEX						                        ; SET STAT TO GET = ATT FG'S 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_SCORING_LEADER_FG_ATT						                ; SET PPU OFFSET = FG ATT LOC
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA temp_stat_value						                                                ; LOAD FG ATT VALUE
	JSR CONVERT_2_DIG_NUM_TILES						                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)

@draw_scoring_leader_total_points:							                    ; DRAW TOTAL POINTS FOR SCORING LEADERS
	JSR TRANSFER_BCD_STAT_TO_TEMP_VARS					                        ; GET SORTED 3 DIGIT NUMBER()
	LDX #OFFSET_TO_SCORING_LEADER_TOTAL_PTS						                ; SET PPU OFFSET = TOTAL PTS LOC
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)

@check_done_drawing_player_stats:							                    ; CHECK FOR DONE DRAWING CURRENT SCROING LEADER PAGE 
	JSR SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER					    ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER()
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN--
	BEQ @set_index_to_beginning						                                            ; DONE?
	JMP @draw_screen_stat_labels						                        ; NO->DRAW SCORING LEADERS LOOP

@set_index_to_beginning:
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; PLAYER INDEX = PLAYER INDEX - OFFSET TO NEXT SCREEN OF PLAYER DATA
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@wait_for_joy_input:							                                ; SCORING LEADERS LEFT SCREEN
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	; SET DISTANCE TO NEXT SET OF PLAYER DATA = 36 BYTES
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                                            ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCS @right_pressed						                                    ; RIGHT PRESSED? YES->SCORING LEADERS RIGHT MENU 
	JMP @draw_one_page_of_scoring_leaders						                ; UP OR DOWN->DRAW SCORING LEADERS STATS SORTED AND BACKGROUND DRAWN

@right_pressed:							                                        ; SCORING LEADERS RIGHT MENU 
	LDY #<SCORING_LEADERS_MENU_DATA					                            ; SET MENU INFO ADDR = SCORING, RUSHING , RECEVING LEADERS MENU INFO
	LDX #>SCORING_LEADERS_MENU_DATA					                            ; 
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @wait_for_joy_input						                                ; LEFT PRESSED? YES->SCORING LEADERS LEFT SCREEN
	JMP @fade_out_do_menu_choice						                        ; "A" PRESSED->SCORING LEADER MENU CHOICE SELECTED 

@single_stat_menu_loop:							                                ; SCORING LEADER MENU CHOICE INPUT LOOP
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)						                                         
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                    ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @draw_next_page_single_stat						                        ; UP OR DOWN PRESSED? YES-> DRAW SINGLE STAT SCORING LEADER
	
	LDY #<SCORING_LEADERS_MENU_DATA					                            ; SET MENU INFO ADDR = SCORING, RUSHING , RECEVING LEADERS MENU INFO
	LDX #>SCORING_LEADERS_MENU_DATA					                            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @single_stat_menu_loop						                            ; NO INPUT->SCORING LEADER MENU CHOICE INPUT LOOP

@fade_out_do_menu_choice:							                                            ; SCORING LEADER MENU CHOICE SELECTED
	JSR FADE_OUT_CLEAR_ALL_SCREEN_BUT_TITLE_FADE_IN					            ; FADE OUT, KEEP BACKGROUND TITLE CLEAR REST, FADE IN	
	LDA MENU_Y						                                            ; IS MENU CHOICE = PTS
	BNE @do_scoring_leader_menu_choice						                    ;
	JMP DRAW_STATS_SCORING_LEADERS_SCREEN						                ; YES-> DRAW SCORING LEADERS TEXT FOR CURRENT PAGE

@do_scoring_leader_menu_choice:							                         ; DO SCORING LEADER MENU CHOICE
	DRAW_SINGLE_STAT_LEADER_SCREEN_LABELS_BASED_ON_MENU_CHOICE[Stat_sort_Table_addr] SORT_ON_TOTAL_PTS_INDEX, SINGLE_STAT_SCORING_LEADER_LABEL_ADDR_TABLE

@draw_next_page_single_stat:							                                            ; DRAW SINGLE STAT SCORING LEADER 
	JSR DRAW_RANK_NAME_TEAM_STATS_GREY_TEAM_TEXT					            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT()
	JMP @single_stat_menu_loop					                               ; JUMP-> SCORING LEADER MENU CHOICE SCREEN INPUT LOOP

_F}_DRAW_SCORING_LEADERS_SCREEN

_F{_DRAW_INTERCEPTION_LEADERS_SCREEN											

DRAW_INTERCEPTION_LEADERS_SCREEN:							                    ; DRAW INTERCEPTIONS LEADERS

	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] INTERCEPTION_LEADERS_SCENE_ID 

SORT_AND_DRAW_INT_LEADERS_STATS:							                                            ; DRAW AND SORT INTERCEPTIONS LEADERS BASED ON INTS 
	LDY #<INT_LEADERS_ATTR_TABLE_DATA					                                            ; SET ATTRIBUTE TABLE ADDR = INTERECEPTION LEADERS ATRRIBUTE TABLE DATA
	LDX #>INT_LEADERS_ATTR_TABLE_DATA					                                            ;
	JSR TRANSFER_LEADERS_SCREEN_ATTR_TABLE_DATA					                                            ; UPDATE ATTRIBUTE TABLE DEPENDING ON FADE (X,Y=DATA ADDRESS)
	LDA #SORT_ON_INTERCEPTIONS_INDEX						                    ; SET STAT TO SORT ON = INTERCEPTIONS
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                                                ;

@init_interception_leaders_screen:							                                            ; DRAW INTERCEPTIONS LEADERS LEFT SCREEN  
	INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[]

@draw_receiving_leader_labels:							                                            ; DRAW INTERCEPTION LEADERS LOOP
	SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset] INT_LEADERS_STAT_LABELS_DATA, OFFSET_TO_INTERCEPTION_LEADER_COLUMN_NAMES

@draw_ranks:	
	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES					                                            ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA
	BCS @check_done_drawing_player_stats						                                            ; AT END OF DATA? NO-> GET AND DRAW INTERCEPTION LEADER STATS 
	
@draw_interceptions: 	
	LDX #DEF_INTS_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = INTERCEPTIONS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_INTERCEPTION_LEADER_INTS						                                            ; SET PPU OFFSET = INTERCEPTIONS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #DEF_INT_YDS_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = INTERCEPTION YARDS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                                            ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_INTERCEPTION_LEADER_INT_YARDS						                                            ; SET PPU OFFSET = INTERCEPTION YARDS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)
	
	LDX #DEF_INTS_SEASON_STAT_INDEX						                                            ; SET SET DIVISOR STAT  = INTERCEPTIONS
    LDY #DEF_INT_YDS_SEASON_STAT_INDEX						                                            ; SET SET NUMERATOR STAT  = INTERCEPTION YARDS
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS					                                            ; GET YARDS PER STAT LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LDX #OFFSET_TO_INTERCEPTION_LEADER_INT_YARD_AVG						                                            ; SET PPU OFFSET = INT YARDS AVERAGE DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					                                            ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	
	LDX #DEF_INT_TDS_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = INT TDS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_INTERCEPTION_LEADER_INT_TDS						                                            ; SET PPU OFFSET = INT TDS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@check_done_drawing_player_stats:							                                            ; GET AND DRAW INTERCEPTION LEADER STATS
	JSR SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER					                                            ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER()
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN--
	BNE @draw_receiving_leader_labels						                                            ; DONE? NO->DRAW INTERCEPTION LEADERS LOOP
	LDA CURRENT_LEADERS_ARRAY_INDEX						                                                ; PLAYER INDEX = PLAYER INDEX - OFFSET TO NEXT SCREEN OF PLAYER DATA
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)						                                            ;
	STA CURRENT_LEADERS_ARRAY_INDEX						                                                ;

@check_for_joy_input_left_screen:							                                            ; LEFT INTERCEPTION SCREEN INPUT LOOPS START 
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	; SET DISTANCE TO NEXT SET OF PLAYER DATA = 36 BYTES
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                                            ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @init_interception_leaders_screen						                                            ; IS RIGHT PRESSED? NO->DRAW INTERCEPTIONS LEADERS LEFT SCREEN  

@init_interception_leaders_menu:	
	LDY #<INT_LEADERS_MENU_DATA					                                            ; SET MENU INFO ADDR = INTERCEPTION LEADERS MENU INFO
	LDX #>INT_LEADERS_MENU_DATA					                                            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					                                            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_left_screen						                                            ; LEFT PRESSED? YES->LEFT INTERCEPTION SCREEN INPUT LOOPS START 
	JMP @fade_out_and_do_menu_choice					                                            ; A PRESSED ON MENU CHOICE? YES->CHOICE PRESSED ON INTERCEPTION LEADERS MENU

@check_for_joy_input_single_stat_screen:							                                            ; WAIT FOR INPUT ON INTERCEPTION LEADERS MENU
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)				
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                                            ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @draw_next_page_of_leader_single_stat					                                            ;
	
	LDY #<INT_LEADERS_MENU_DATA					                                            ; SET MENU INFO ADDR = INTERCEPTION LEADERS MENU INFO
	LDX #>INT_LEADERS_MENU_DATA					                                            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					                                            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_single_stat_screen					                                            ; NO INPUT->WAIT FOR INPUT ON INTERCEPTION LEADERS MENU

@fade_out_and_do_menu_choice:							                                            ; CHOICE PRESSED ON INTERCEPTION LEADERS MENU
	JSR FADE_OUT_CLEAR_ALL_SCREEN_BUT_TITLE_FADE_IN					                                            ; FADE OUT, KEEP MENU AND TITLE CLEAR REST, FADE IN
	LDA MENU_Y						                                            ; IS MENU CHOICE = FIRST CHOICE? 
	BNE @do_menu_choice						                                            ; NO->DO INTERCEPTIONS LEADERS RIGHT SCREEN MENU CHOICE
	JMP SORT_AND_DRAW_INT_LEADERS_STATS						                                            ; YES->DRAW AND SORT INTERCEPTIONS LEADERS BASED ON INTS

@do_menu_choice:							                                            ; DO INTERCEPTIONS LEADERS RIGHT SCREEN MENU CHOICE
	DRAW_SINGLE_STAT_LEADER_SCREEN_LABELS_BASED_ON_MENU_CHOICE[Stat_sort_Table_addr] SORT_ON_INTERCEPTIONS_INDEX, SINGLE_STAT_INT_LEADER_LABEL_ADDR_TABLE
	
@draw_next_page_of_leader_single_stat:
	JSR DRAW_RANK_NAME_TEAM_STATS_GREY_TEAM_TEXT					            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT()
	JMP @check_for_joy_input_single_stat_screen					                                            ; JUMP->WAIT FOR INPUT ON INTERCEPTION LEADERS MENU

_F}_DRAW_INTERCEPTION_LEADERS_SCREEN

_F{_DRAW_PUNT_RETURN_LEADERS_SCREEN												

DRAW_PUNT_RETURN_LEADERS_SCREEN:							                    ; DRAW PUNT RETURN LEADERS
 
	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] PR_LEADERS_SCENE_ID


DRAW_AND_SORT_STATS_PUNT_RETURN_LEADERS_SCREEN:							        ; DRAW AND SORT PR LEADERS BASED ON AVG PR 
	LDY #<PUNT_RETURN_LEADERS_ATTR_TABLE_DATA					                ; SET ATTRIBUTE TABLE ADDR = KICKOFF AND PUNT RETURN LEADERS ATRRIBUTE TABLE DATA
	LDX #>PUNT_RETURN_LEADERS_ATTR_TABLE_DATA					                ;
	JSR TRANSFER_LEADERS_SCREEN_ATTR_TABLE_DATA					                ; UPDATE ATTRIBUTE TABLE DEPENDING ON FADE (X,Y=DATA ADDRESS)
	
@sort_pr_leader_stats: 	
	LDA #SORT_ON_PUNT_RET_AVERAGE_INDEX						                    ; SET STAT TO SORT ON = PUNT RTURN AVERAGE
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@draw_punt_return_leaders_left_screen:							                 ; DRAW PR LEADERS LEFT SCREEN  
	INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[]

@draw_punt_return_stat_labels:							                        ; DRAW PUNT RETURN LEADERS LOOP
	SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset] PUNT_RETURN_LEADERS_STAT_LABELS_DATA, OFFSET_TO_PUNT_RETURN_LEADER_COLUMN_NAMES

@draw_ranks:
	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES					                ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA
	BCS @check_done_drawing_player_stats						                ; AT END OF DATA? YES->GET AND DRAW PR LEADER STATS

@draw_pr_attempts:
	LDX #SKILL_PR_ATT_SEASON_STAT_INDEX						                                            ; SET STAT INDEX = PUNT RETURN ATTEMPTS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_PUNT_RETURN_LEADER_ATT						                                            ; SET PPU OFFSET = PUNT RETURN ATTEMPTS OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_pr_yards:	
	LDX #SKILL_PR_YDS_SEASON_STAT_INDEX						                                            ; SET STAT INDEX = PUNT RETURN YARDS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                                            ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_PUNT_RETURN_LEADER_YARDS						                                            ; SET PPU OFFSET = PUNT RETURN YARDS OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)

@draw_pr_yards_per_attempt:		
	LDX #SKILL_PR_ATT_SEASON_STAT_INDEX						                                            ; SET SET DIVISOR STAT  = PUNT RETURN ATTEMPTS
	LDY #SKILL_PR_YDS_SEASON_STAT_INDEX						                                            ; SET SET NUMERATOR STAT  = PUNT RETURN YARDS
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS					                                            ; GET YARDS PER STAT LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LDX #OFFSET_TO_PUNT_RETURN_LEADER_YARD_AVG						                                            ; SET PPU OFFSET = PUNT RETURN AVG OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					                                            ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)

@draw_pr_touchdowns:		
	LDX #SKILL_PR_TDS_SEASON_STAT_INDEX						                                            ; SET STAT INDEX = PUNT RETURN TDS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_PUNT_RETURN_LEADER_TDS						                                            ; SET PPU OFFSET = PUNT RETURN TD OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@check_done_drawing_player_stats:							                                            ; GET AND DRAW PR LEADER STATS
	JSR SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER					    ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER()
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN--
	BNE @draw_punt_return_stat_labels						                     ; DONE? NO->DRAW PUNT RETURN LEADERS LOOP
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; PLAYER INDEX = PLAYER INDEX - OFFSET TO NEXT SCREEN OF PLAYER DATA
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@wait_for_joy_input_left_screen:							                    ; LEFT PR SCREEN INPUT LOOP START
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	; SET DISTANCE TO NEXT SET OF PLAYER DATA = 36 BYTES
    LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                    ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					             ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCS @init_right_screen_menu_data						                    ; IS RIGHT PRESSED? YES->RIGHT PR SCREEN INPUT LOOP START
	JMP @draw_punt_return_leaders_left_screen						            ; UP/DOWN->DRAW PR LEADERS LEFT SCREEN  

@init_right_screen_menu_data:							                         ; RIGHT PR SCREEN INPUT LOOP START
	LDY #<PUNT_RETURN_LEADERS_MENU_DATA					                        ; SET MENU INFO ADDR = 4 MENU CHOICE INFO (PR/KR)
	LDX #>PUNT_RETURN_LEADERS_MENU_DATA					                        ; 
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @wait_for_joy_input_left_screen						                    ; LEFT PRESSED? YES-> LEFT PR SCREEN INPUT LOOP START
	JMP @fade_out_and_do_right_screen_menu_choice					            ; A PRESSED ON MENU CHOICE? YES->CHOICE PRESSED ON PR LEADERS MENU

@wait_for_joy_input_right_screen:							                    ; 
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)						                                            
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                    ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @draw_rank_team_name_player_name_grey						                                            ; 
	
	LDY #<PUNT_RETURN_LEADERS_MENU_DATA					                         ; SET MENU INFO ADDR = 4 MENU CHOICE INFO (PR/KR)
	LDX #>PUNT_RETURN_LEADERS_MENU_DATA					                         ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					              ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @wait_for_joy_input_right_screen

@fade_out_and_do_right_screen_menu_choice:							             ; CHOICE PRESSED ON PR LEADERS MENU
	JSR FADE_OUT_CLEAR_ALL_SCREEN_BUT_TITLE_FADE_IN					             ; FADE OUT, KEEP MENU AND TITLE CLEAR REST, FADE IN
	LDA MENU_Y						                                            ; IS MENU CHOICE = FIRST CHOICE?
	BNE @do_right_screen_menu_choice						                      ; NO->DO PR LEADERS RIGHT SCREEN MENU CHOICE
	JMP DRAW_AND_SORT_STATS_PUNT_RETURN_LEADERS_SCREEN						                                            ; YES->DRAW AND SORT PR LEADERS BASED ON PR AVG 

@do_right_screen_menu_choice:							                       ; DO PR LEADERS RIGHT SCREEN MENU CHOICE
	DRAW_SINGLE_STAT_LEADER_SCREEN_LABELS_BASED_ON_MENU_CHOICE[Stat_sort_Table_addr] SORT_ON_PUNT_RET_AVERAGE_INDEX, SINGLE_STAT_KR_PR_LEADER_LABEL_ADDR_TABLE

@draw_rank_team_name_player_name_grey:
	JSR DRAW_RANK_NAME_TEAM_STATS_GREY_TEAM_TEXT					            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT()
	JMP @wait_for_joy_input_right_screen						                   ; JUMP->RIGHT PR SCREEN INPUT LOOP START

_F}_DRAW_PUNT_RETURN_LEADERS_SCREEN

_F{_DRAW_RECEIVING_LEADERS_SCREEN												

DRAW_RECEIVING_LEADERS_SCREEN:							                        ; DRAW RECEIVING LEADERS
	
	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] LEADING_RECEIVERS_SCENE_ID



SORT_AND_DRAW_RECEIVING_LEADERS_STATS:							                                            ; DRAW AND SORT RECEIVING LEADERS BASED ON RECEPTIONS   
	LDY #<REC_LEADERS_ATTR_DATA_TABLE					                        ; SET ATTRIBUTE TABLE ADDR = RECEIVING LEADERS ATRRIBUTE TABLE DATA
	LDX #>REC_LEADERS_ATTR_DATA_TABLE					                        ;
	JSR TRANSFER_LEADERS_SCREEN_ATTR_TABLE_DATA					                ; UPDATE ATTRIBUTE TABLE DEPENDING ON FADE (X,Y=DATA ADDRESS)
	LDA #SORT_ON_RECEPTIONS_INDEX						                        ; SET STAT TO GET = RECEPTIONS
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                                                ;

@init_receiving_leaders_screen:							                                            ; DRAW RECEIVING  LEADERS LEFT SCREEN
	INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[]

@draw_receiving_leader_labels:							                                            ; DRAW RECEIVING LEADERS LOOP
	SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset] RECEIVING_LEADERS_STAT_LABELS_DATA, OFFSET_TO_RECEIVING_LEADER_COLUMN_NAMES


@draw_ranks: 	
	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES					                 ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA
	BCS @check_done_drawing_player_stats						                                            ; AT END OF PAGE? YES-> CHECK IF DONE AND SET OFFSET TO NEXT PAGE OF RECEIVING PLAYER DATA
	
	LDX #SKILL_REC_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = RECEPTIONS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_RECEIVING_LEADER_REC						                                            ; SET PPU OFFSET = RECEPTIONS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #SKILL_REC_YDS_SEASON_STAT_INDEX							                                            ; SET STAT TO GET = RECEIVING YARDS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                                            ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_RECEIVING_LEADER_REC_YDS						                                            ; SET PPU OFFSET = RECEIVING YARDS OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)
	
	LDX #SKILL_REC_SEASON_STAT_INDEX						                                            ; SET SET DIVISOR STAT  = RECEPTIONS
	LDY #SKILL_REC_YDS_SEASON_STAT_INDEX							                                            ; SET SET NUMERATOR STAT  = RECEIVING YARDS
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS					                                            ; GET YARDS PER STAT LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LDX #OFFSET_TO_RECEIVING_LEADER_REC_AVG						                                            ; SET PPU OFFSET = RECEIVING AVG OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
    
	LDX #SKILL_REC_TD_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = RECEIVING TDS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_RECEIVING_LEADER_REC_TDS						                                            ; SET PPU OFFSET = RECEIVING TDS OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@check_done_drawing_player_stats:							                                            ; CHECK IF DONE AND SET OFFSET TO NEXT PAGE OF RECEIVING PLAYER DATA
	JSR SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER					                                            ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER()
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN--
	BNE @draw_receiving_leader_labels						                     ; DONE? NO->DRAW RECEIVING LEADERS LOOP
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; PLAYER INDEX = PLAYER INDEX - OFFSET TO NEXT SCREEN OF PLAYER DATA
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)						                                            ;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@check_for_joy_input_left_screen:							                                            ; LEFT RECEIVING SCREEN INPUT LOOP START
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	; SET DISTANCE TO NEXT SET OF PLAYER DATA = 36 BYTES
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                                            ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCS @init_receiving_leaders_menu						                                            ; RIGHT PRESSED? YES->RIGHT RECEIVING SCREEN INPUT LOOP START
	JMP @init_receiving_leaders_screen						                                            ; UP/DOWN PRESSED? YES-> DRAW RECEIVING  LEADERS LEFT SCREEN

@init_receiving_leaders_menu:							                                            ; RIGHT RECEIVING SCREEN INPUT LOOP START
	LDY #<RECEIVING_LEADERS_MENU_DATA					                        ; SET MENU INFO ADDR = SCORING, RUSHING , RECEVING LEADERS MENU INFO
	LDX #>RECEIVING_LEADERS_MENU_DATA					                        ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					                                            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_left_screen						                                            ; LEFT PRESSED? YES-> LEFT RECEIVING SCREEN INPUT LOOP START
	JMP @fade_out_and_do_menu_choice						                                            ; A PRESSED ON MENU CHOICE? YES->CHOICE PRESSED ON PR LEADERS MENU

@check_for_joy_input_single_stat_screen:							            ; SINGLE STAT RECEIVING LEADERS MENU INPUT CHECK LOOP
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                   ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					             ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @draw_next_page_of_leader_single_stat						                                            ; UP/DOWN PRESSED YES->DRAW NEXT SET OF SINGLE STATS/RANKINGS RECEIVING LEADERS
	
	LDY #<RECEIVING_LEADERS_MENU_DATA					                        ; SET MENU INFO ADDR = SCORING, RUSHING , RECEVING LEADERS MENU INFO
	LDX #>RECEIVING_LEADERS_MENU_DATA					                        ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					                                            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_single_stat_screen						                                            ; A PRESSED? NO->SINGLE STAT RECEIVING LEADERS MENU INPUT CHECK LOOP

@fade_out_and_do_menu_choice:							                                            ; MENU CHOICE SELECTED ON RECEIVING LEADERS MENU
	JSR FADE_OUT_CLEAR_ALL_SCREEN_BUT_TITLE_FADE_IN					                                            ; FADE OUT, KEEP MENU AND TITLE CLEAR REST, FADE IN
	LDA MENU_Y						                                            ; IS MENU CHOICE = FIRST CHOICE?
	BNE @do_menu_choice					                                            ; NO->DO RECEIVING LEADERS RIGHT SCREEN MENU CHOICE
	JMP SORT_AND_DRAW_RECEIVING_LEADERS_STATS						                                            ; YES->DRAW AND SORT RECEIVING LEADERS BASED ON RECEPTIONS   

@do_menu_choice:							                                            ; DO RECEIVING LEADERS RIGHT SCREEN MENU CHOICE
	DRAW_SINGLE_STAT_LEADER_SCREEN_LABELS_BASED_ON_MENU_CHOICE[Stat_sort_Table_addr] SORT_ON_RECEPTIONS_INDEX, SINGLE_STAT_REC_LEADER_LABEL_ADDR_TABLE 
	
@draw_next_page_of_leader_single_stat:							                                            ; DRAW NEXT SET OF SINGLE STATS/RANKINGS RECEIVING LEADERS
	JSR DRAW_RANK_NAME_TEAM_STATS_BLUE_TEAM_TEXT					            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT()
	JMP @check_for_joy_input_single_stat_screen						                                            ; JUMP-> UP/DOWN PRESSED RIGHT RECEIVING LEADERS MENU

_F}_DRAW_RECEIVING_LEADERS_SCREEN

_F{_DRAW_RUSHING_LEADERS_SCREEN													

DRAW_RUSHING_LEADERS_SCREEN:							                        ; DRAW RUSHING LEADERS

	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] LEADING_RUSHERS_SCENE_ID

SORT_AND_DRAW_RUSHING_LEADERS_STATS:							                 ; DRAW AND SORT RUSHING LEADERS BASED ON RUSHING YARDS  
	LDY #<RUSH_LEADERS_ATTR_DATA_TABLE					                        ; SET ATTRIBUTE TABLE ADDR = RUSHING LEADERS ATRRIBUTE TABLE DATA
	LDX #>RUSH_LEADERS_ATTR_DATA_TABLE					                        ;
	JSR TRANSFER_LEADERS_SCREEN_ATTR_TABLE_DATA					                ; UPDATE ATTRIBUTE TABLE DEPENDING ON FADE (X,Y=DATA ADDRESS)
	LDA #SORT_ON_RUSH_YARDS_INDEX						                        ; SET STAT TO SORT ON = RUSHING YARDS
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@init_rushing_leaders_screen:							                        ; DRAW RUSHING LEADERS MAIN SCREEN
	INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[]

@draw_rushing_leader_labels:							                        ; DRAW RUSHING LEADERS LOOP
	SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset] RUSHING_LEADERS_STAT_LABELS_DATA, OFFSET_TO_RUSHING_LEADER_COLUMN_NAMES

@draw_ranks_names_teams:
	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES					                ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA
	BCS @check_done_drawing_player_stats						                ; AT END OF PAGE? YES-> CHECK IF DONE AND SET OFFSET TO NEXT PAGE OF RUSHING PLAYER DATA
	
	LDX CURRENT_LEADERS_ARRAY_INDEX						                        ; IS CURRENT PLAYER ID >= RB 
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						            ;
	CMP #RB1_ROSTER_ID						                                    ; 
	BCS @draw_skill_player_rushing_stats						                                            ; YES-> GET AND SORT SKILL PLAYERS RUSHING LEADERS LOOP

@draw_qb_rushing_stats:	
	

@draw_qb_rushing_att:	
	LDX #QB_RUSH_ATTEMPTS_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = QB RUSHING ATTEMPTS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_RUSHING_LEADER_RUSH_ATT						                                            ; SET PPU OFFSET = RUSHING ATTEMPTS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_qb_rushing_yards:	
	LDX #QB_RUSH_YDS_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = QB RUSHING YARDS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_RUSHING_LEADER_RUSH_YDS						                                            ; SET PPU OFFSET = QB RUSHING YARDS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)

@draw_qb_rushing_avg:		
	LDX #QB_RUSH_ATTEMPTS_SEASON_STAT_INDEX						                ; SET SET DIVISOR STAT  = QB RUSHING ATTEMPTS
	LDY #QB_RUSH_YDS_SEASON_STAT_INDEX						                     ; SET SET NUMERATOR STAT  = QB RUSHING YARDS
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS					        ; GET YARDS PER STAT LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LDX #OFFSET_TO_RUSHING_LEADER_RUSH_AVG						                                            ; SET PPU OFFSET = RUSHING YARDS AVG OFFSET	
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_qb_rushing_td:	
	LDX #QB_RUSH_TD_SEASON_STAT_INDEX						        ; SET STAT TO GET = QB RUSHING TDS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_RUSHING_LEADER_RUSH_TDS						                                            ; SET PPU OFFSET = RUSHING TDS OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	JMP @check_done_drawing_player_stats

@draw_skill_player_rushing_stats:

@draw_skill_rushing_att:							                                            ; GET AND SORT SKILL PLAYERS RUSHING LEADERS LOOP
	LDX #SKILL_RUN_ATT_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = SKILL PLAYER RUSHING ATTEMPTS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_RUSHING_LEADER_RUSH_ATT						                                            ; SET PPU OFFSET = RUSHING ATTEMPTS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_skill_rushing_yards:	
	LDX #SKILL_RUN_YDS_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = SKILL PLAYER RUSHING YARDS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_RUSHING_LEADER_RUSH_YDS						                                            ; SET PPU OFFSET = RUSHING YARDS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)

@draw_skill_rushing_avg:	
	LDX #SKILL_RUN_ATT_SEASON_STAT_INDEX						                                            ; SET SET DIVISOR STAT  = SKILL PLAYER RUSHING ATTEMPTS
	LDY #SKILL_RUN_YDS_SEASON_STAT_INDEX						                                            ; SET SET NUMERATOR STAT  = SKILL PLAYER RUSHING YARDS
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS					        ; GET YARDS PER STAT LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LDX #OFFSET_TO_RUSHING_LEADER_RUSH_AVG						                                            ; SET PPU OFFSET = RUSHING YARDS AVG OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_skill_rushing_td:	
	LDX #SKILL_RUN_TD_SEASON_STAT_INDEX						                                            ; SET STAT TO GET = SKILL PLAYER RUSHING TDS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_RUSHING_LEADER_RUSH_TDS						                                            ; SET PPU OFFSET = RUSHING TDS OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@check_done_drawing_player_stats:
	JSR SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER					    ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER()
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN--
	BEQ @set_index_back_one_page						                        ; DONE? YES->UPDATE RUSHING LEADERS PLAYER INDEX
	JMP @draw_rushing_leader_labels						                        ; NO->DRAW RECEIVING LEADERS LOOP

@set_index_back_one_page:							                                    ; UPDATE PLAYER INDEX
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; PLAYER INDEX = PLAYER INDEX - OFFSET TO NEXT SCREEN OF PLAYER DATA
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)						                                            ;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@check_for_joy_input_left_screen:							                    ; MAIN RUSHING LEADERS SCREEN INPUT LOOP
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	; SET DISTANCE TO NEXT SET OF PLAYER DATA = 36 BYTES
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                     ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCS @init_rushing_leaders_menu						                                            ; RIGHT PRESSED? YES->RIGHT RUSHING LEADERS SCREEN INPUT LOOP START
	JMP @init_rushing_leaders_screen						                                            ; UP/DOWN PRESSED? YES->DRAW RUSHING LEADERS MAIN SCREEN

@init_rushing_leaders_menu:							                                            ; RIGHT RUSHING LEADERS SCREEN INPUT LOOP START
	LDY #<RUSHING_LEADERS_MENU_DATA					                            ; SET MENU INFO ADDR = SCORING, RUSHING , RECEVING LEADERS MENU INFO
	LDX #>RUSHING_LEADERS_MENU_DATA					                            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_left_screen						                                            ; LEFT PRESSED? YES-> MAIN RUSHING LEADERS SCREEN INPUT LOOP
	JMP @fade_out_and_do_menu_choice						                                            ; A PRESSED ON MENU CHOICE? YES->CHOICE PRESSED ON RUSHING LEADERS MENU

@check_for_joy_input_single_stat_screen:							                                            ; SINGLE STAT RUSHING LEADERS MENU INPUT CHECK LOOP
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)	
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                                            ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @draw_next_page_of_leader_single_stat						                                            ; UP/DOWN PRESSED YES->DRAW NEXT SET OF SINGLE STATS/RANKINGS RUSHING LEADERS
	
	LDY #<RUSHING_LEADERS_MENU_DATA					                            ; SET MENU INFO ADDR = SCORING, RUSHING , RECEVING LEADERS MENU INFO
	LDX #>RUSHING_LEADERS_MENU_DATA					                            ; 
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					                                            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_single_stat_screen:					                                            ; A PRESSED? NO->SINGLE STAT RUSHING LEADERS MENU INPUT CHECK LOOP

@fade_out_and_do_menu_choice:							                                            ; MENU CHOICE SELECTED ON RUSHING LEADERS MENU
	JSR FADE_OUT_CLEAR_ALL_SCREEN_BUT_TITLE_FADE_IN					                                            ; FADE OUT, KEEP MENU AND TITLE CLEAR REST, FADE IN
	LDA MENU_Y						                                            ; IS MENU CHOICE = FIRST CHOICE?
	BNE @do_menu_choice						                                            ; NO->DO RECEIVING LEADERS RIGHT SCREEN MENU CHOICE
	JMP SORT_AND_DRAW_RUSHING_LEADERS_STATS						                                            ; YES->DRAW AND SORT RUSHING LEADERS BASED ON RUSHING YARDS

@do_menu_choice:
	DRAW_SINGLE_STAT_LEADER_SCREEN_LABELS_BASED_ON_MENU_CHOICE[Stat_sort_Table_addr] SORT_ON_RUSH_YARDS_INDEX, SINGLE_STAT_RUSH_LEADER_LABEL_ADDR_TABLE
	
@draw_next_page_of_leader_single_stat:							                                            ; DRAW NEXT SET OF SINGLE STATS/RANKINGS RUSHING LEADERS
	JSR DRAW_RANK_NAME_TEAM_STATS_GREY_TEAM_TEXT					            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT()
	JMP @check_for_joy_input_single_stat_screen						                                            ; JUMP-> SINGLE STAT RUSHING LEADERS MENU INPUT CHECK LOOP

_F}_DRAW_RUSHING_LEADERS_SCREEN

_F{_DRAW_PUNTING_LEADERS_SCREEN													

DRAW_PUNTING_LEADERS_SCREEN:							                        ; DRAW PUNTING LEADERS

table_addr = LOCAL_1

	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] LEADING_PUNTERS_SCENE_ID 

																				; 
SORT_AND_DRAW_PUNTING_LEADERS_STATS:							                ; DRAW AND SORT PUNTING LEADERS BASED ON PUNTING AVEAGE 
	LDY #<PUNTING_LEADERS_ATTR_TABLE_DATA					                    ; SET ATTRIBUTE TABLE ADDR = PUNTING LEADERS ATRRIBUTE TABLE DATA
	LDX #>PUNTING_LEADERS_ATTR_TABLE_DATA					                    ;
	JSR TRANSFER_LEADERS_SCREEN_ATTR_TABLE_DATA					                ; UPDATE ATTRIBUTE TABLE DEPENDING ON FADE (X,Y=DATA ADDRESS)
	LDA #SORT_ON_PUNTING_AVG_INDEX						                        ; SET STAT TO SORT ON = PUNTING AVERAGE 
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@init_punting_leaders_screen:							                        ; DRAW PUNTING LEADERS MAIN SCREEN
	INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[]

@draw_punting_leader_labels:							                        ; DRAW PUNTING LEADERS LOOP
	SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset]	PUNTING_LEADERS_STAT_LABEL_DATA, OFFSET_TO_PUNTING_LEADER_COLUMN_NAMES

@draw_ranks_names_teams:	
	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES					                ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA
	BCS @check_done_drawing_player_stats						                ; AT END OF PAGE? YES-> CHECK IF DONE AND SET OFFSET TO NEXT PAGE OF PUNTING PLAYER DATA
	
@draw_punts:	
	LDX #PUNTS_SEASON_STAT_INDEX							                    ; SET STAT TO GET = PUNTS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN				; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_PUNTING_LEADER_PUNTS						                    ; SET PPU OFFSET = PUNTS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					               ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_punt_yards:	
	LDX #PUNT_YDS_SEASON_STAT_INDEX						                       ; SET STAT TO GET = PUNTING YARDS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_PUNTING_LEADER_PUNT_YARDS							        ; SET PPU OFFSET = PUNTING YARDS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)

@draw_punt_average:	
	LDX #PUNTS_SEASON_STAT_INDEX							                    ; SET SET DIVISOR STAT  = PUNTS
	LDY #PUNT_YDS_SEASON_STAT_INDEX						                        ; SET SET NUMERATOR STAT  = PUNTING YARDS
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS					        ; GET YARDS PER STAT LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LDX #OFFSET_TO_PUNTING_LEADER_PUNT_AVG						                ; SET PPU OFFSET = PUNTING AVG DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@check_done_drawing_player_stats:							                    ; CHECK IF DONE AND SET OFFSET TO NEXT PAGE OF PUNTING PLAYER DATA
	JSR SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER					    ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER()
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN--
	BNE @draw_punting_leader_labels						                        ; DONE? NO-> DRAW PUNTING LEADERS LOOP
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; PLAYER INDEX = PLAYER INDEX - OFFSET TO NEXT SCREEN OF PLAYER DATA
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@check_for_joy_input_left_screen:							                    ; MAIN PUNTING SCREEN INPUT LOOP 
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	; SET DISTANCE TO NEXT SET OF PLAYER DATA = 36 BYTES
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                    ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCS @init_punting_leaders_menu						                        ; RIGHT PRESSED? YES->PUNTING LEADERS MENU SCREEN INPUT LOOP START
	JMP @init_punting_leaders_screen						                    ;

@init_punting_leaders_menu:							                            ; PUNTING LEADERS MENU SCREEN INPUT LOOP START
	LDY #<PUNTING_LEADERS_MENU_DATA					                            ; SET MENU INFO ADDR = PUNTING LEADERS MENU CHOICES
	LDX #>PUNTING_LEADERS_MENU_DATA					                            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_left_screen:						                ; LEFT PRESSED? YES-> MAIN PUNTING SCREEN INPUT LOOP
	JMP @fade_out_and_do_menu_choice						                    ; A PRESSED ON MENU CHOICE? YES->MENU CHOICE SELECTED ON PUNTING LEADERS MENU

@check_for_joy_input_single_stat_screen:							            ; SINGLE STAT PUNTING LEADERS INPUT CHECK LOOP
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)						                             
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                     ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @draw_next_page_of_leader_single_stat						            ; UP/DOWN PRESSED YES->DRAW NEXT SET OF SINGLE STATS/RANKINGS PUNTING LEADERS
	
	LDY #<PUNTING_LEADERS_MENU_DATA					                            ; SET MENU INFO ADDR = PUNTING LEADERS MENU CHOICES
	LDX #>PUNTING_LEADERS_MENU_DATA					                            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_single_stat_screen:						                                            ;

@fade_out_and_do_menu_choice:							                        ; MENU CHOICE SELECTED ON PUNTING LEADERS MENU
	JSR FADE_OUT_CLEAR_ALL_SCREEN_BUT_TITLE_FADE_IN					            ; FADE OUT, KEEP MENU AND TITLE CLEAR REST, FADE IN
	LDA MENU_Y						                                            ; IS MENU CHOICE = FIRST CHOICE?
	BNE @do_menu_choice						                                    ; NO->DO PUNTING LEADERS RIGHT SCREEN MENU CHOICE
	JMP SORT_AND_DRAW_PUNTING_LEADERS_STATS						                ; YES->DRAW AND SORT PUNTING LEADERS BASED ON PUNT AVG

@do_menu_choice:							                                    ; DO PUNTING LEADERS RIGHT SCREEN MENU CHOICE
	LDA MENU_Y						                                            ; STAT TO SORT ON = KR LEADERS MENU CHOICE
	CLC							                                                ;
	ADC #SORT_ON_PUNTING_AVG_INDEX					                    		; + KR LEADERS OFFSET
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER INDEX = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	LDA #<TOTAL_PUNTS_LEADERS_STAT_LABEL_DATA					        								
	STA table_addr						                                        ;
	LDA #>TOTAL_PUNTS_LEADERS_STAT_LABEL_DATA					        		;
	STA table_addr + 1					                                        ; 
	LOAD_ADDR_XY[mem_loc] SINGLE_STAT_LEADER_SCREEN_TITLE_PPU_ADDR
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS

@draw_next_page_of_leader_single_stat:							                ; DRAW NEXT SET OF SINGLE STATS/RANKINGS PUNTING LEADERS
	JSR DRAW_RANK_NAME_TEAM_STATS_GREY_TEAM_TEXT					            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT()
	JMP @check_for_joy_input_single_stat_screen:						        ; JUMP->SINGLE STAT PUNTING LEADERS INPUT CHECK LOOP

_F}_DRAW_PUNTING_LEADERS_SCREEN

_F{_DRAW_SACK_LEADERS_SCREEN												

DRAW_SACKS_LEADERS_SCREEN:							                            ; DRAW SACKS LEADERS
	
data_addr	= LOCAL_1	
	
	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] SACK_LEADERS_SCENE_ID


	LDA #SORT_ON_SACKS_INDEX						                            ; SET STAT TO SORT ON = SACKS
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	
	LDA #<SACK_LEADERS_STAT_LABELS_DATA					                        ; SET DATA ADDR = SACKS LEADERS COLUMN NAMES DATA
	STA data_addr						                                        ;
	LDA #>SACK_LEADERS_STAT_LABELS_DATA					                        ;
	STA data_addr + 1						                                    ;
	LDY #<SACK_LEADERS_STAT_LABEL_STARTING_PPU_ADDR						        ;
	LDX #>SACK_LEADERS_STAT_LABEL_STARTING_PPU_ADDR						        ;
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						        ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(X,Y= PPU ADDR, 3E,3F=DATA ADDR)

@draw_next_page_sack_leaders:							                        ; DRAW AND SORT SACK LEADERS ($A8= PLAYER INDEX)
	JSR DRAW_RANK_NAME_TEAM_STATS_GREY_TEAM_TEXT					            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT()

@check_for_joy_input_sack_leaders:							                     ; CHECK FOR UP/DOWN PRESSED SACK LEADERS INPUT LOOP
	RETURN_1_FRAME
	
@check_b_press:	
	BIT JOY_PRESS_BOTH						                                    ; IS B PRESSED?
	BVS @exit					  	                                            ; YES->EXIT
	
@check_down_press:	
	LDA JOY_PRESS_BOTH						                                        ; DOWN PRESSED?
	LSR							                                                ;
	LSR							                                                ;
	LSR							                                                ;
	BCS @down_pressed						                                    ; YES->DOWN PRESSED GO DOWN ONE PAGE OF SACKS LEADERS 
	LSR							                                                ; UP PRESSED?
	BCC @check_for_joy_input_sack_leaders						                ; NO->CHECK FOR UP/DOWN PRESSED SACK LEADERS INPUT LOOP
	
@up_pressed:	
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; PLAYER DATA OFFSET -= PLAYER DATA LENGTH PER PAGE 
	BEQ @check_for_joy_input_sack_leaders						                ; AT BEGINNING OF DATA ALREADY? YES->CHECK FOR UP/DOWN PRESSED SACK LEADERS INPUT LOOP
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)						                                            ;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	JMP @draw_next_page_sack_leaders					                        ; JUMP-> DRAW AND SORT SACK LEADERS ($A8= PLAYER INDEX)
	
@down_pressed:							                                        ; DOWN PRESSED GO DOWN ONE PAGE OF SACKS LEADERS 
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; LAYER DATA OFFSET += PLAYER DATA LENGTH PER PAGE
	CLC							                                                ;
	ADC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)						                                            ;
	CMP #LAST_LEADER_INDEX						                                ; AT END OF DATA ALREADY?
	BCS @check_for_joy_input_sack_leaders						                                            ; YES-> CHECK FOR UP/DOWN PRESSED SACK LEADERS INPUT LOOP
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	JMP @draw_next_page_sack_leaders					                        ; JUMP-> DRAW AND SORT SACK LEADERS ($A8= PLAYER INDEX)

@exit:							                                            	; EXIT
	RTS							                                                ; RETURN
	
_F}_DRAW_SACK_LEADERS_SCREEN

_F{_KICK_RETURN_LEADERS_SCREEN													

DRAW_KICK_RETURN_LEADERS_SCREEN:							                    ; DRAW KICKOFF RETURN LEADERS
	DRAW_SPECIFIC_LEADER_BACKGROUND_SCREEN[scene_id] KR_LEADERS_SCENE_ID 
	

SORT_AND_DRAW_KR_LEADERS_STATS:							                                            ; DRAW AND SORT KR LEADERS BASED ON KR AVG
	LDY #<KICK_RETURN_LEADERS_ATTR_TABLE_DATA					                ; *** uses same table as PR
	LDX #>KICK_RETURN_LEADERS_ATTR_TABLE_DATA					                ;
	JSR TRANSFER_LEADERS_SCREEN_ATTR_TABLE_DATA					                ; UPDATE ATTRIBUTE TABLE DEPENDING ON FADE (X,Y=DATA ADDRESS)
	LDA #SORT_ON_KICK_RET_AVERAGE_INDEX						                    ; SET STAT TO SORT ON = KR AVERAGE
	JSR SORT_STATS_LEADERS[stat]					                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	LDA #$00						                                            ; SET PLAYER DATA OFFSET = FIRST PLAYER
	STA CURRENT_LEADERS_ARRAY_INDEX						                                                ;

@init_kr_leaders_screen:							                                            ; DRAW KR LEADERS MAIN SCREEN
	INIT_LEADER_SCREEN_PPU_ADDR_NUM_PLAYERS_PER_SCREEN[] 

@draw_kr_leader_labels:
	SET_LEADER_SCREEN_LABEL_DATA_ADDR[addr_offset] KICK_RETURN_LEADERS_STAT_LABELS_DATA, OFFSET_TO_KICK_RETURN_LEADER_COLUMN_NAMES		
	
	
@draw_ranks_names_teams:	
	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES					                ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA
	BCS @check_done_drawing_player_stats					                                            ; PLAYER TO DRAW? NO->CHECK IF DONE AND SET OFFSET TO NEXT PAGE OF PUNTING PLAYER DATA 

@draw_kick_return_att:	
	LDX #SKILL_KR_ATT_SEASON_STAT_INDEX						                                            ; SET STAT INDEX = KR ATTEMPTS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_KICK_RETURN_LEADER_ATT						                                            ; SET PPU OFFSET = KR ATT DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_kick_return_yards:		
	LDX #SKILL_KR_YDS_SEASON_STAT_INDEX						                                            ; SET STAT INDEX = KR YARDS
	JSR CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS					                                            ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45
	LDX #OFFSET_TO_KICK_RETURN_LEADER_YARDS						                                            ; SET PPU OFFSET = KR YARDS DRAW OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)

@draw_kick_return_avg:	
	LDX #SKILL_KR_ATT_SEASON_STAT_INDEX						                                            ; SET DIVISOR STAT = KR ATTEMPTS
	LDY #SKILL_KR_YDS_SEASON_STAT_INDEX						                                            ; SET NUMERATOR STAT = KR YARDS
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS					        ; GET YARDS PER STAT LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LDX #OFFSET_TO_KICK_RETURN_LEADER_YARD_AVG						                                            ; SET PPU OFFSET = KR YARDS AVG OFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)

@draw_kick_return_tds:	
	LDX #SKILL_KR_TDS_SEASON_STAT_INDEX						                                            ; SET STAT INDEX = KR TDS
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN		; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)
	LDX #OFFSET_TO_KICK_RETURN_LEADER_TDS						                                            ; SET PPU OFFSET = KR YARDS TDOFFSET
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@check_done_drawing_player_stats:							                                            ; CHECK IF DONE AND SET OFFSET TO NEXT PAGE OF PUNTING PLAYER DATA
	JSR SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER					                                            ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER()
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN-
	BNE @draw_kr_leader_labels:					                                            ; DONE? NO-> DRAW PUNTING LEADERS LOOP
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; PLAYER INDEX = PLAYER INDEX - OFFSET TO NEXT SCREEN OF PLAYER DATA
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)						                                            ;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;

@check_for_joy_input_left_screen:							                                            ; MAIN KR LEADER SCREEN INPUT LOOP
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_LEADER_SCREEN)	; SET DISTANCE TO NEXT SET OF PLAYER DATA = 36 BYTES
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                                            ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCS @init_kr_leaders_menu					                                            ; RIGHT PRESSED? YES->KR LEADERS MENU SCREEN INPUT LOOP START
	JMP @init_kr_leaders_screen					                                            ; UP/DOWN PRESSED->DRAW KR LEADERS MAIN SCREEN

@init_kr_leaders_menu:							                                            ; KR LEADERS MENU SCREEN INPUT LOOP START
	LDY #<KICK_RETURN_LEADERS_MENU_DATA					                        ; SET MENU INFO ADDR = 4 MENU CHOICE INFO (PR/KR)
	LDX #>KICK_RETURN_LEADERS_MENU_DATA					                        ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_left_screen					                                            ; LEFT PRESSED? YES-> MAIN KR LEADER SCREEN INPUT LOOP
	JMP @fade_out_and_do_menu_choice					                                            ; A PRESSED ON MENU CHOICE? YES->MENU CHOICE SELECTED ON KR LEADERS MENU

@check_for_joy_input_single_stat_screen::							                                            ; SINGLE STAT KR LEADERS INPUT CHECK LOOP
	LDX #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)						                          
	LDA #SCROLL_TO_LEADER_SCREEN_FRAMES						                                            ; SET SCROLL TIMER = 28 FRAMES
	JSR WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN					            ; WAIT FOR JOYPAD INPUT (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)
	BCC @draw_next_page_of_leader_single_stat					                                            ; UP/DOWN PRESSED YES->DRAW NEXT SET OF SINGLE STATS/RANKINGS PUNTING LEADERS
	
	LDY #<KICK_RETURN_LEADERS_MENU_DATA					                                            ; SET MENU INFO ADDR = 4 MENU CHOICE INFO (PR/KR)
	LDX #>KICK_RETURN_LEADERS_MENU_DATA					                                            ;
	JSR INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT					                                            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	BVC @check_for_joy_input_single_stat_screen:					                                            ; LEFT PRESSED AT MENU? YES-> SINGLE STAT KR LEADERS INPUT CHECK LOOP 

@fade_out_and_do_menu_choice:							                                            ; MENU CHOICE SELECTED ON KR LEADERS MENU
	JSR FADE_OUT_CLEAR_ALL_SCREEN_BUT_TITLE_FADE_IN					                                            ; FADE OUT, KEEP MENU AND TITLE CLEAR REST, FADE IN
	LDA MENU_Y						                                            ; IS MENU CHOICE = FIRST CHOICE?
	BNE @do_menu_choice					                                            ; NO->DO KR LEADERS RIGHT SCREEN MENU CHOICE
	JMP SORT_AND_DRAW_KR_LEADERS_STATS					                                            ; YES->DRAW AND SORT KR LEADERS BASED ON KR AVG

@do_menu_choice:							                       ; DO KR LEADERS RIGHT SCREEN MENU CHOICE
	DRAW_SINGLE_STAT_LEADER_SCREEN_LABELS_BASED_ON_MENU_CHOICE[Stat_sort_Table_addr] SORT_ON_KICK_RET_AVERAGE_INDEX, SINGLE_STAT_KR_PR_LEADER_LABEL_ADDR_TABLE


@draw_next_page_of_leader_single_stat:							                                            ; DRAW NEXT SET OF SINGLE STATS/RANKINGS PUNTING LEADERS
	JSR DRAW_RANK_NAME_TEAM_STATS_GREY_TEAM_TEXT					                                            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT()
	JMP @check_for_joy_input_single_stat_screen:					                                            ; JUMP-> SINGLE STAT KR LEADERS INPUT CHECK LOOP
	
_F}_KICK_RETURN_LEADERS_SCREEN	
	
_F{_DRAW_RANK_TEAM_ABRREV_PLAYER_NAME_LEADERS								

OFFSET_TO_RANK				= $01
LENGTH_OF_RANK_NAME_TEAM	= $1E 

OFFSET_TO_STATS_LINE		= $44
LENGTH_OF_LEADERS_STATS		= $1C 
 

tiles_per_row				= LOCAL_1
num_rows					= LOCAL_2
temp_roster_id				= LOCAL_7
temp_team_id				= LOCAL_8



DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINES:							                ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA TWO LINES
	LDX CURRENT_LEADERS_ARRAY_INDEX						                        ; LOAD CURRENT PLAYER DATA OFFSET 
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ; DOES STAT DATA = VALID TEAM?
	BPL DRAW_RANK_TEAM_CITY_ABREV_PLAYER_NAME_LEADERS					                ; YES->DRAW RANK NUMBER, PLAYER LAST NAME, PLAYER CITY(A= PLAYER TEAM)
	
								                                                ; NO MORE STATS TO DRAW CLEAR POSSIBLE DATA FROM PREVIOUS SCREEN

       							                                                ; CLEAR RANK NAME AND TEAM
    LDX #OFFSET_TO_RANK						                                    ; SET TILE OFFSET = 1 TILE
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA #$01						                                            ; SET NUM ROWS =1
	STA num_rows						                                        ;
	LDA #LENGTH_OF_RANK_NAME_TEAM						                        ; SET LENGTH = 30 TILES
	STA tiles_per_row						                                    ;
	JSR FILL_SCREEN_BLANK_TILE_AREA						                        ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)

								                                                ; CLEAR STATS
	LDX #OFFSET_TO_STATS_LINE						                            ; SET OFFSET = DISTANCE TO NEXT LINE
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA #$01						                                            ; SET NUM ROWS =1 
	STA num_rows						                                        ;
	LDA #LENGTH_OF_LEADERS_STATS						                        ; SET LENGTH = 28 TILES
	STA tiles_per_row						                                    ;
	JSR FILL_SCREEN_BLANK_TILE_AREA						                        ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	SEC							                                                ; SEC = AT END OF DATA
	RTS							                                                ; RETURN

DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINE:							                ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE CLEAR DATA SINGLE LINE
	LDX CURRENT_LEADERS_ARRAY_INDEX						                        ; LOAD CURRENT PLAYER DATA OFFSET
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ; DOES STAT DATA = VALID TEAM?
	BPL DRAW_RANK_TEAM_CITY_ABREV_PLAYER_NAME_LEADERS					                ; YES->DRAW RANK NUMBER, PLAYER LAST NAME, PLAYER CITY(A= PLAYER TEAM)
								                                                ; CLEAR RANK, NAME,TEAM AND STAT
	LDX #$01						                                            ; SET TILE OFFSET = 1 TILE
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA #$01						                                            ; SET NUM ROWS =1
	STA num_rows						                                        ;
	LDA #LENGTH_OF_RANK_NAME_TEAM						                        ; SET LENGTH = 30 TILES
	STA tiles_per_row						                                    ;
	JSR FILL_SCREEN_BLANK_TILE_AREA						                        ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	SEC							                                                ; SEC = AT END OF DATA
	RTS							                                                ; RETURN

DRAW_RANK_TEAM_CITY_ABREV_PLAYER_NAME_LEADERS:							                ; DRAW RANK NUMBER, PLAYER LAST NAME, PLAYER CITY(A= PLAYER TEAM)
	STA CURRENT_TEAM						                                    ; SAVE CURRENT PLAYER TEAM
	LDA CURRENT_RANKING_ORDINAL[],X						                        ; LOAD CURRENT RANK # 
	LDX #$01						                                            ; SET OFFSET = 1 TILE
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_2_DIG_NUM_TILES						                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	LDA CURRENT_TEAM						                                    ; SET TEMP TEAM ID = CURRENT TEAM ID  
	STA temp_team_id						                                    ;
	LDX CURRENT_LEADERS_ARRAY_INDEX						                         ; LOAD PLAYER INDEX
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						            ; SET TEMP PLAYER ID = CURRENT PLAYER ID  
	STA temp_roster_id						                                    ; 
	LDX #$04						                                            ; SET OFFSET = 4 TILES
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_LAST_NAME_10_CHAR						                            ; DRAW PLAYER LAST NAME MAX LENGTH 10 CHAR(X,Y= PPU LOCATION,$44=PLAYER, $45=TEAM)
	LDA CURRENT_TEAM						                                    ;
	LDX #$10						                                            ; SET OFFSET = 16 TILES
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT						                    ; DRAW ABREV TEAM CITY/ TEAM CONFERENCE ON TEAM DATA(X,Y =PPUADDRESS, A= TEAM ID)
	CLC							                                                ;
	RTS							                                                ; RETURN

_F}_DRAW_RANK_TEAM_ABRREV_PLAYER_NAME_LEADERS

_F{_UPDATE_LEADERS_PPU_ADDR													

UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR:							                ; UPDATE PPU ADDR (X= OFFSET)
	PHA							                                                ;
	TXA							                                                ; = X + CURRENT PPU ADDR
	CLC							                                                ;
	ADC CURRENT_LEADERS_PPU_ADDR						                        ;
	TAY							                                                ;
	LDA CURRENT_LEADERS_PPU_ADDR + 1						                    ;
	ADC #$00						                                            ;
	TAX							                                                ;
	PLA							                                                ;
	RTS							                                                ; RETURN

UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR_SCREEN_TWO:							    ; UPDATE PPU ADDR TO SECOND SCREEN (X= OFFSET)
	PHA							                                                ;
	TXA							                                                ; = X + CURRENT PPU ADDR
	CLC							                                                ;
	ADC CURRENT_LEADERS_PPU_ADDR						                        ; 
	TAY							                                                ;
	LDA CURRENT_LEADERS_PPU_ADDR + 1						                    ; = CURRENT PPU HIGH BYTE + OFFSET TO NEXT SCREEN
	ADC #$04						                                            ;
	TAX							                                                ;
	PLA							                                                ;
	RTS							                                                ; RETURN

_F}_UPDATE_LEADERS_PPU_ADDR

_F{_DRAW_RANK_TEAM_ABRREV_PLAYER_NAME_LEADER_SINGLE_STAT_LEADERS			

DRAW_RANK_NAME_TEAM_STATS_BLUE_TEAM_TEXT:							            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH BLUE TEAM TEXT

attr_table_addr = LOCAL_1

	LDA #<BLUE_TEAM_TEXT_LEADERS_ATT_TABLE_DATA					                ; SET ATTRIBUTE TABLE ADDR = BLUE TEAM NAME ATTRIBUTE TABLE
	STA attr_table_addr 					                                    ;
	LDA #>BLUE_TEAM_TEXT_LEADERS_ATT_TABLE_DATA					                ;
	STA attr_table_addr + 1						                                ;
	JMP DRAW_RANK_NAME_TEAM_AND_SINGLE_STAT_LEADERS					            ; JUMP->DRAW RANK, NAME, TEAM AND STATS SINGLE STAT

DRAW_RANK_NAME_TEAM_STATS_GREY_TEAM_TEXT:							            ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT WITH GREY TEAM TEXT
	LDA #<GREY_TEAM_TEXT_LEADERS_ATT_TABLE_DATA					                ; SET ATTRIBUTE TABLE ADDR = GREY TEAM NAME ATTRIBUTE TABLE
	STA attr_table_addr 						                                ;
	LDA #>GREY_TEAM_TEXT_LEADERS_ATT_TABLE_DATA					                ;
	STA attr_table_addr + 1						                                 ;

DRAW_RANK_NAME_TEAM_AND_SINGLE_STAT_LEADERS:							                ; DRAW RANK, NAME, TEAM AND STATS SINGLE STAT
	LOAD_ADDR_XY[mem_loc] SINGLE_STAT_LEADER_SCREEN_STARTING_ATTR_ADDR
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						        ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(X,Y= PPU ADDR, 3E,3F=DATA ADDR)
	
	LDA #<SINGLE_STAT_LEADER_SCREEN_STARTING_PPU_ADDR						    ; SET CURRENT LEADER SCREEN PPU ADDR = $20E0
	STA CURRENT_LEADERS_PPU_ADDR						                        ;
	LDA #>SINGLE_STAT_LEADER_SCREEN_STARTING_PPU_ADDR							;
	STA CURRENT_LEADERS_PPU_ADDR + 1						                    ;
	LDA #NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN						; SET PLAYERS LEFT TO DRAW  = 10
	STA PLAYERS_TO_LIST_PER_SCREEN						                        ;

_WHILE NOT_EQUAL							                                    ; DRAW RANK,NAME,TEAM AND STATS LOOP 

	JSR DRAW_RANK_NAME_TEAM_ELSE_CLEAR_LINE					                    ; CHECK FOR DRAW RANK, NAME, TEAM ABBREV, OTHERWISE DRAW BLANK LINE()
	BCS @go_down_two_rows						                                ; DONE? YES-> GO TO NEXT SCREEN LOCATION AND PLAYER
	JSR ADD_LEADERS_STAT_TO_BG_BUFFER					                        ; DRAW STAT FOR SINGLE STAT PAGE BASED ON STAT TYPE()

@go_down_two_rows:							                                    ; GO TO NEXT SCREEN LOCATION AND PLAYER
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] CURRENT_LEADERS_PPU_ADDR, (LENGTH_OF_ONE_ROW * 2)
	ADD_8_BIT_CONST_TO_8BIT_ADDR[addr_val] CURRENT_LEADERS_ARRAY_INDEX,	OFFSET_TO_NEXT_RANKING_INDEX
	DEC PLAYERS_TO_LIST_PER_SCREEN						                        ; NUMBER OF PLAYERS TO DRAW PER SCREEN--

_END_WHILE 						                                            	; DONE? NO-> DRAW RANK,NAME,TEAM AND STATS LOOP

	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; SET PLAYER OFFSET = FIRST PLAYER
	SEC							                                                ;
	SBC #(OFFSET_TO_NEXT_RANKING_INDEX * NUMBER_OF_PLAYERS_PER_SINGLE_STAT_LEADER_SCREEN)						                                            ;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	RTS							                                                ; RETURN

_F}_DRAW_RANK_TEAM_ABRREV_PLAYER_NAME_LEADER_SINGLE_STAT_LEADERS

_F{_WAIT_FOR_JOY_INPUT_THEN_SCROLL_LEADERS										

WAIT_FOR_JOYPAD_INPUT_LEFT_LEADERS_SCREEN:							            ; WAIT FOR JOYPAD INPUT LEFT SCREEN (A= SCROLL TIMER, X= DISTANCE TO NEXT SET OF PLAYER DATA)

LEADERS_SCREEN_SCROLL_SPEED_PER_FRAME			= $04

offset_to_next_page_player_data					= LOCAL_6
scroll_to_left_screen_num_frames  				= LOCAL_7
scroll_to_right_screen_num_frames 				= LOCAL_8

	STA scroll_to_right_screen_num_frames						                ; SET SCROLL TO RIGHT SCREEN FRAMES = SCROLL TIMER 
	STA scroll_to_left_screen_num_frames						                ; SET SCROLL TO LEFT SCREEN FRAMES = SCROLL TIMER
	STX offset_to_next_page_player_data						                                                ; SAVE DISTANCE TO NEXT SET OF PLAYER DATE

_WHILE CS							                                            ; LOOP FOR JOYPAD INPUT

@wait_one_frame:
	RETURN_1_FRAME
	
@check_b_press:	
	BIT JOY_PRESS_BOTH						                                    ; IS "B" PRESSED?
	BVS @exit						                                            ; YES->EXIT SCREEN
	
@check_right_press:	
	LDA JOY_PRESS_BOTH						                                        ; IS RIGHT PRESSED? 
	LSR							                                                ;
	BCS @right_pressed						                                    ; YES->RIGHT PRESSED
	
@check_down_press:		
	LSR							                                                ;
	LSR							                                                ; IS DOWN PRESSED?
	BCS @down_pressed						                                    ;

@check_up_press:
	LSR							                                                ; IS UP PRESSED?
	BCC @wait_one_frame						                                    ; NO->LOOP FOR JOYPAD INPUT

								                                                ; UP PRESSED
    LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; ARE WE AT FIRST PLAYER? 
	BEQ @wait_one_frame						                                            ; YES->LOOP FOR JOYPAD INPUT
	SEC							                                                ;= CURRENT PLAYER OFFSET - OFFSET TO NEXT PLAYER SET
	SBC offset_to_next_page_player_data						                    ;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	CLC							                                                ;
	RTS							                                                ;

@down_pressed:							                                                ; DOWN PRESSED
	LDA CURRENT_LEADERS_ARRAY_INDEX						                        ; CURRENT PLAYER OFFSET + OFFSET TO NEXT PLAYER SET
	CLC							                                                ;
	ADC offset_to_next_page_player_data						                    ;
	CMP #LAST_LEADER_INDEX						                                ; AT LAST SET OF PLAYERS?

_END_WHILE

	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	CLC							                                                ;
	RTS							                                                ; RETURN

@right_pressed:

_WHILE NOT_EQUAL							                                   ; RIGHT PRESSED SCROLL SCREEN
	
	RETURN_1_FRAME
	LDA IRQ_0_XSCROLL						                                    ; CURRENT IRQ SCROLL POS += 0X04 
	CLC							                                                ;
	ADC #LEADERS_SCREEN_SCROLL_SPEED_PER_FRAME						                                            ;
	STA IRQ_0_XSCROLL						                                    ;
	LDA IRQ_0_NAMETABLE						                                    ;
	ADC #$00						                                            ;
	AND #$01						                                            ;
	STA IRQ_0_NAMETABLE						                                   ;
	DEC scroll_to_right_screen_num_frames						                ; SCROLL TIMER DONE?

_END_WHILE						                                            ; NO->RIGHT PRESSED SCROLL SCREEN 

	SEC							                                                ; SEC = RIGHT PRESSED
	RTS							                                                ; RETURN

@exit:							                                                ; EXIT SCREEN
	PLA							                                                ; REMOVE RETURN ADDRESS
	PLA							                                                ;
	RTS							                                                ; RETURN

INIT_LEADERS_MENU_DATA_WAIT_FOR_JOY_INPUT:							                                            ; WAIT FOR JOYPAD INPUT RIGHT MENU SCREEN (X,Y = MENU INFO ADDR)
	LDA #$00						                                            ; SET MENU CHOICE = FIRST CHOICE
	STA MENU_Y						                                            ;
	LDA #BOTH_JOYPADS						                                    ; SET PLAYER JOY = BOTH
	JSR SET_MENU_ARROW_OPTIONS						                            ; INITIALIZE Y MENU OPTIONS(X,Y= ADDRESS, A= PLAYER JOY)

_WHILE EQUAL							                                        ; LOOP FOR JOYPAD INPUT

	RETURN_1_FRAME
	JSR CHECK_MENU_ARROW_UP_DOWN						                        ; CHECK FOR MENU CURSOR MOVED UP OR DOWN() RET= CARRY SET= MOVED
	JSR UPDATE_MENU_ARROW_SPR_Y						                            ; UPDATE MENU ARROW SPRITE Y LOCATION()
							                                    ; IS B PRESSED?

@if_b_pressed:
	BIT JOY_PRESS_BOTH
	BVS SET_LEADER_MENU_ARROW_OFFSCREEN_EXIT_LEADER_SCREEN					    ; YES->SET MENU SPRITE OFFSCREEN AND EXIT LEADER SCREEN

@if_a_pressed:
	LDA JOY_PRESS_BOTH
	BMI SET_LEADER_MENU_ARROW_OFFSCREEN_INDICATE_MENU_CHOICE					; YES->A PRESSED ON MENU CHOICE 
	
@check_left_pressed:
	AND #LEFT_DPAD						                                        ; IS LEFT PRESSED?
	
_END_WHILE						                                                ; NO->LOOP FOR JOYPAD INPUT

LEFT_PRESSED_LEADERS_MENU:							                                            ; LEFT PRESSED
	LDA #SPRITE_OFFSCREEN 						                                ; SET MENU SPRITE = OFFSCREEN
	STA MENU_ARROW_SPR_Y						                                ;
	
_WHILE NOT_EQUAL							                                    ; SCROLL SCREEN BACK TO FIRST SCREEN LOOP

@scroll_screen:	
	RETURN_1_FRAME
	LDA IRQ_0_XSCROLL						                                    ; CURRENT IRQ SCROLL POS -= 0X04
	SEC							                                                ;
	SBC #LEADERS_SCREEN_SCROLL_SPEED_PER_FRAME						            ;
	STA IRQ_0_XSCROLL						                                    ;
	LDA IRQ_0_NAMETABLE						                                    ;
	SBC #$00						                                            ;
	AND #$01						                                            ;
	STA IRQ_0_NAMETABLE						                                    ;
	DEC scroll_to_left_screen_num_frames						                ; # FRAMES LEFT TO SCROLL--

_END_WHILE						                                            ; DONE SCROLLING? NO->SCROLL SCREEN BACK TO FIRST SCREEN LOOP
	CLV							                                                ;
	CLC							                                                ;
	RTS							                                                ; RETURN


SET_LEADER_MENU_ARROW_OFFSCREEN_INDICATE_MENU_CHOICE:							; A PRESSED ON MENU CHOICE
	LDA #SPRITE_OFFSCREEN						                                ; SET MENU SPRITE = OFFSCREEN
	STA MENU_ARROW_SPR_Y						                                ;
	BIT SET_VALUE_LOCATION						                                ; *** in bank 32
	CLC							                                                ; 
	RTS							                                                ; RETURN



SET_LEADER_MENU_ARROW_OFFSCREEN_EXIT_LEADER_SCREEN:							    ; SET MENU SPRITE OFFSCREEN AND EXIT LEADER SCREEN
	LDA #SPRITE_OFFSCREEN						                                ; SET MENU SPRITE = OFFSCREEN
	STA MENU_ARROW_SPR_Y						                                ;
	PLA							                                                ; REMOVE RETURN ADDRESS
	PLA							                                                ;
	RTS							                                                ; RETURN
	
_F}_WAIT_FOR_JOY_INPUT_THEN_SCROLL_LEADERS

_F{_TRANSFER_ATTR_TABLE_FADE_OUT_LEADERS									

TRANSFER_LEADERS_SCREEN_ATTR_TABLE_DATA:							            ; UPDATE ATTRIBUTE TABLE DEPENDING ON FADE (Y,X=DATA ADDRESS) 

data_addr 			= LOCAL_1 
	STY data_addr						                                        ; SAVE DATA ADRESS
	STX data_addr + 1						                                    ;
	LOAD_ADDR_XY[mem_loc] SINGLE_STAT_LEADER_SCREEN_STARTING_ATTR_ADDR
	JMP TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						        ; TRANSFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES

FADE_OUT_CLEAR_ALL_SCREEN_BUT_TITLE_FADE_IN:							        ; FADE OUT, CLEAR EVERYTHING BUT MENU AND TITLE AND COLORING, FADE IN

num_rows			= LOCAL_1
num_tiles_per_row	= LOCAL_2

	JSR SET_BG_SPR_FULLY_FADED_OUT						                        ; SET PALLETES TO FULLY FADED OUT()
	
@reset_scroll:	
	LDA #$00						                                            ; SET IRQ XCSROLL LOCATION = 00 00
	STA IRQ_0_XSCROLL						                                    ;
	STA IRQ_0_NAMETABLE						                                    ;
	
@clear_tiles:	
	LOAD_ADDR_XY[mem_loc] SINGLE_STAT_LEADER_SCREEN_TITLE_PPU_ADDR			                                            ; 
	LDA #$18						                                            ; SET LENGTH = 0X18
	STA num_tiles_per_row						                                ;
	LDA #$20						                                            ; SET NUM ROWS =0X20
	STA num_rows						                                        ; = CLEAR $2080 TO $23C8
	JSR FILL_SCREEN_BLANK_TILE_AREA						                        ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	
@clear_coloring: 	
	LOAD_ADDR_XY[mem_loc] SINGLE_STAT_LEADER_SCREEN_STARTING_ATTR_ADDR
	LDA #$06						                                            ; SET LENGTH = 0X06
	STA num_tiles_per_row						                                ;
	LDA #$08						                                            ; SET NUM ROWS =0X08
	STA num_rows						                                        ; 
	JSR FILL_SCREEN_BLANK_TILE_AREA						                        ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)

@fade_in:	
	JSR SET_BG_SPR_FULLY_FADED_IN						                        ; SET PALLETES TO FULLY FADED IN()
	RTS							                                                ; RETURN

_F}_TRANSFER_ATTR_TABLE_FADE_OUT_LEADERS

_F{_DRAW_PLAYER_DATA_SCREEN													

roster_id				= LOCAL_6

										                                        ; $43= PLAYER TO DRAW,$6E= CURRENT TEAM, 
										                                        ; $9D= PLAYER TO DRAW,$6F= CURRENT TEAM,  
 
DRAW_PLAYER_DATA_SCREEN:							                            ; DRAW PLAYER DATA SCREEN($43 = PLAYER, $6E=TEAM) 
	LDA roster_id						                                        ; SET CURRENT SEASON PLAYER ID = TEMP SEASON PLAYER 
	AND #$1F						                                            ; MASK OUT POSSESSION
	STA CURRENT_ROSTER_ID						                                ; 
	LDX CURRENT_TEAM						                                    ; SAVE CURRENT TEAM IN $6F
	STX PLAYER_DATA_SCREEN_TEAM						                            ; 
	
@check_for_punter	
	CMP #PUNTER_ROSTER_ID						                                ; IS CURRENT PLAYER ID = PUNTER
	BCC @check_for_kicker						                                ; NO->CHECK FOR KICKER
	JMP DRAW_PUNTER_PLAYER_DATA_SCREEN						                                            ; YES->DRAW PUNTER

@check_for_kicker:							                                    ; CHECK FOR KICKER 
	CMP #KICKER_ROSTER_ID						                                ; IS CURRENT PLAYER ID =  KICKER
	BCC @check_for_defender						                                ; NO-> CHECK FOR DEFENDER
	JMP DRAW_KICKER_PLAYER_DATA_SCREEN						                                            ; YES->DRAW KICKER

@check_for_defender:							                                ; CHECK FOR DEFENDER
	CMP #RE_ROSTER_ID						                        			; IS CURRENT PLAYER ID =  RE DEFENDER
	BCC @check_for_off_line						                                            ; NO->CHECK FOR OL
	JMP DRAW_DEFENDER_PLAYER_DATA_SCREEN						                                            ; YES->DRAW DEFENDER

@check_for_off_line:							                                ; CHECK FOR OL
	CMP #C_ROSTER_ID						                                    ; IS CURRENT PLAYER ID =  OL
	BCC @check_for_skill_player						                                            ; NO->CHECK FOR OL	 
	JMP DRAW_OL_PLAYER_DATA_SCREEN						                                            ; JUMP->DRAW OL 

@check_for_skill_player:							                                                ; CHECK FOR SKILL PLAYER (RB,WR,TE)
	CMP #RB1_ROSTER_ID						                                    ; IS CURRENT PLAYER ID =   SKILL PLAYER (RB,WR,TE)
	BCC DRAW_QB_PLAYER_DATA_SCREEN						                                            ; NO-> DRAW QB
	JMP DRAW_RB_WR_TE_PLAYER_DATA_SCREEN						                                            ; YES-> DRAW SKILL PLAYER

_F}_DRAW_PLAYER_DATA_SCREEN

_F{_DRAW_QB_PLAYER_DATA_SCREEN													

DRAW_QB_PLAYER_DATA_SCREEN:							                             ; DRAW QB

qb_rating_bcd		= LOCAL_6

	LDA #QB_DATA_SCREEN_ID						                                 ; SET DRAW POSITION
	JSR DRAW_COMMON_ATTRIBUTE_BARS_PLAYER_DATA					                ; DRAW PLAYER DATA SCREEN AND COMMON ATTRIBUTE BARS(A= POSITION SET TO DRAW)
	
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] PASSING_SPEED_INDEX, PASSING_SPEED_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] PASS_CONTROL_INDEX, PASS_CONTROL_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] PASSING_ABILITY_INDEX, PASS_ABILITY_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] AVOID_PASS_BLOCK_INDEX, AVOID_BLOCK_ABILITY_BAR_PPU_ADDR
	
	
	LDX #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX						                ; SET STAT INDEX =  PASS ATTEMPTS 
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] PASS_ATT_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #QB_PASS_COMPLETIONS_SEASON_STAT_INDEX						            ; SET STAT INDEX = PASS COMPLETIONS 
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] PASS_COMP_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #QB_PASS_TD_SEASON_STAT_INDEX						                    ; SET STAT INDEX =  PASSING TOUCHDOWNS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] PASS_TD_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #QB_PASS_INT_SEASON_STAT_INDEX						                    ; SET STAT INDEX =   PASSING INTERCEPTIONS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] PASS_INT_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #QB_PASS_YDS_SEASON_STAT_INDEX						                                            ; LOAD PASSING YARDS STAT INDEX
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] PASS_YARDS_PLAYER_DATA_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; DRAW 4 DIGIT NUMBER(X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX						                ; LOAD PASSING ATTEMPTS INDEX
	LDY #QB_PASS_YDS_SEASON_STAT_INDEX						                    ; LOAD PASSING YARDS INDEX
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA					    ; GET YARDS PER STAT, PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LOAD_ADDR_XY[mem_loc] PASS_YPA_PLAYER_DATA_PPU_ADDR
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	
	
	LDA #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX						                ; SET DIVISOR STAT INDEX = PASS ATT
	STA SECOND_STAT_INDEX						                                ;
	LDA #QB_PASS_COMPLETIONS_SEASON_STAT_INDEX						            ; SET NUMERAOT STAT INDEX = PASS ATT
	STA FIRST_STAT_INDEX 				      	                                ;
	JSR CALCULATE_PERCENTAGE_LEADERS					                        ; CALCULATE PERCENTAGE ($90= NUMERATOR STAT INDEX, $91 = DIVISOR STAT INDEX, 6E= TEAM, 9D= PLAYER)
	JSR LEADERS_HEX_TO_DEC_ONE_PT_PRECISION 					                ; CONVERT HEX VALUE TO BCD, ONE DECIMAL PT PRECISION($43,$44,$45)
	LOAD_ADDR_XY[mem_loc] PASS_COMP_PCT_PLAYER_DATA_PPU_ADDR
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					         ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	JSR CHECK_IF_CAN_CALCULATE_QB_RATING					                    ; *** could use other qb rating check CHECK IF PLAYER QUALIFIES FOR QB RATING PLAYER DATA
	BCS @set_qb_rating_to_zero						                            ; QUALIFIES? NO-> SET QB RATING TO ZERO	
	
@calculate_qb_rating:	
	JSR CACLULATE_QB_RATING					                                    ; CALCULATE QB RATING()
	JSR LEADERS_HEX_TO_DEC_ONE_PT_PRECISION					                    ; CONVERT HEX VALUE TO BCD, ONE DECIMAL PT PRECISION($43,$44,$45)
	JMP @draw_qb_rating						                                	; JUMP->DRAW REST OF QB STATS

@set_qb_rating_to_zero:							                            	; SET QB RATING TO ZERO
	LDA #$00						                                            ;
	STA qb_rating_bcd						                                    ;
	STA qb_rating_bcd + 1						                                ;
	STA qb_rating_bcd + 2 						                                ;

@draw_qb_rating:							                                    ; DRAW REST OF QB STATS
	LOAD_ADDR_XY[mem_loc] QB_RATING_PLAYER_DATA_PPU_ADDR
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	
	LDX #QB_RUSH_ATTEMPTS_SEASON_STAT_INDEX						                ; LOAD QB RUSHING ATTEMPT STAT INDEX
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN  ; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	
	LOAD_ADDR_XY[mem_loc] QB_RUSH_ATT_PLAYER_DATA_PPU_ADDR			
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #QB_RUSH_YDS_SEASON_STAT_INDEX						                                            ; LOAD QB RUSHING YARDS STAT INDEX
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] QB_RUSH_YARDS_PLAYER_DATA_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; DRAW 4 DIGIT NUMBER(X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #QB_RUSH_ATTEMPTS_SEASON_STAT_INDEX						                ; LOAD QB RUSHING ATTEMPT STAT INDEX
	LDY #QB_RUSH_YDS_SEASON_STAT_INDEX						                    ; LOAD QB RUSHING YARDS STAT INDEX
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA					    ; GET YARDS PER STAT, PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LOAD_ADDR_XY[mem_loc] QB_RUSH_YPA_PLAYER_DATA_PPU_ADDR
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	
	LDX #QB_RUSH_TD_SEASON_STAT_INDEX						        			; SET STAT INDEX = QB RUSHING TD 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] QB_RUSH_TD_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	JMP SET_BG_COLOR_PLAYER_DATA_SCREEN						                                            ; JUMP ->END OF DRAW PLAYER DATA SCEEN

_F}_DRAW_QB_PLAYER_DATA

_F{_DRAW_SKILL_PLAYER_DATA_SCREEN											

DRAW_RB_WR_TE_PLAYER_DATA_SCREEN:							                    ; DRAW SKILL PLAYER
	LDA #RB_WR_TE_DATA_SCREEN_ID						                        ; SET BG SCREEN ID = SKIIL PLAYER SCREEN
	JSR DRAW_COMMON_ATTRIBUTE_BARS_PLAYER_DATA					                ; DRAW PLAYER DATA SCREEN AND COMMON ATTRIBUTE BARS(A= POSITION SET TO DRAW)	
	
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] BALL_CONTROL_INDEX, BALL_CONTROL_ABILITY_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] RECEPTION_INDEX, RECEPTIONS_ABILITY_BAR_PPU_ADDR
	
@draw_rush_attempts:	
	LDX #SKILL_RUN_ATT_SEASON_STAT_INDEX						                ; SET STAT INDEX = RUSHING ATTEMPTS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; GET 3 DIGIT STAT (X= STAT INDEX)
	LOAD_ADDR_XY[mem_loc] SKILL_RUSH_ATT_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_rush_yards:	
	LDX #SKILL_RUN_YDS_SEASON_STAT_INDEX						                ; SET STAT INDEX = RUSHING YARDS 
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] SKILL_RUSH_YARDS_PLAYER_DATA_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; DRAW 4 DIGIT NUMBER(X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_rush_average:	
	LDX #SKILL_RUN_ATT_SEASON_STAT_INDEX						                ; SET STAT INDEX = RUSHING ATTEMPTS 
	LDY #SKILL_RUN_YDS_SEASON_STAT_INDEX						                ; SET STAT INDEX = RUSHING YARDS 
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA					    ; GET YARDS PER STAT, PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LOAD_ADDR_XY[mem_loc] SKILL_RUSH_YPA_PLAYER_DATA_PPU_ADDR
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_rushing_touchdowns:	
	LDX #SKILL_RUN_TD_SEASON_STAT_INDEX						                    ; SET STAT INDEX = RUSHING TDS STAT INDEX
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] SKILL_RUSH_TD_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_receptions:	
	LDX #SKILL_REC_SEASON_STAT_INDEX							                ; SET STAT INDEX =  RECEPTIONS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] SKILL_REC_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_receiving_yards:	
	LDX #SKILL_REC_YDS_SEASON_STAT_INDEX						                ; SET STAT INDEX = RECEIVING YARDS 
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] SKILL_REC_YARDS_PLAYER_DATA_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; DRAW 4 DIGIT NUMBER(X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_receiving_average:	
	LDX #SKILL_REC_SEASON_STAT_INDEX						                    ; SET STAT INDEX = RECEPTIONS 
	LDY #SKILL_REC_YDS_SEASON_STAT_INDEX						                ; SET STAT INDEX = RECEIVING YARDS 
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA					    ; GET YARDS PER STAT, PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LOAD_ADDR_XY[mem_loc] SKILL_REC_YPA_PLAYER_DATA_PPU_ADDR
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_receiving_touchdowns:	
	LDX #SKILL_REC_TD_SEASON_STAT_INDEX						                    ; SET STAT INDEX =  RECEIVING TD INDEX
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] SKILL_REC_TD_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_kick_returns:	
	LDX #SKILL_KR_ATT_SEASON_STAT_INDEX						                    ; LOAD KICK RETURNS STAT INDEX
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] SKILL_KR_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_kick_return_yards:	
	LDX #SKILL_KR_YDS_SEASON_STAT_INDEX						                    ; SET STAT INDEX =   KICK RETURN YARDS 
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] SKILL_KR_YARDS_PLAYER_DATA_PPU_ADDR 
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; DRAW 4 DIGIT NUMBER(X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_kick_return_average:	
	LDX #SKILL_KR_ATT_SEASON_STAT_INDEX						                    ; SET STAT INDEX =  KICK RETURNS 
	LDY #SKILL_KR_YDS_SEASON_STAT_INDEX						                    ; SET STAT INDEX =   KICK RETURN YARDS 
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA					    ; GET YARDS PER STAT, PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LOAD_ADDR_XY[mem_loc] SKILL_KR_YPA_PLAYER_DATA_PPU_ADDR 
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					         ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_kick_return_touchdowns:	
	LDX #SKILL_KR_TDS_SEASON_STAT_INDEX						                                            ; SET STAT INDEX =  KICK RETURN TDS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] SKILL_KR_TDS_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_punt_returns:	
	LDX #SKILL_PR_ATT_SEASON_STAT_INDEX						                    ; SET STAT INDEX = PUNT RETURNS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] SKILL_PR_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_punt_return_yards:	
	LDX #SKILL_PR_YDS_SEASON_STAT_INDEX						                    ; SET STAT INDEX =  PUNT RETURN YARDS 
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] SKILL_PR_YARDS_PLAYER_DATA_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; DRAW 4 DIGIT NUMBER(X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_punt_return_average:	
	LDX #SKILL_PR_ATT_SEASON_STAT_INDEX						                    ; SET STAT INDEX = PUNT RETURNS 
	LDY #SKILL_PR_YDS_SEASON_STAT_INDEX						                    ; SET STAT INDEX = PUNT RETURN YARDS 
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA					    ; GET YARDS PER STAT, PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LOAD_ADDR_XY[mem_loc] SKILL_PR_YPA_PLAYER_DATA_PPU_ADDR
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

@draw_punt_return_touchdowns:	
	LDX #SKILL_PR_TDS_SEASON_STAT_INDEX						                    ; SET STAT INDEX =  PUNT RETURN TDS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] SKILL_PR_TDS_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	JMP SET_BG_COLOR_PLAYER_DATA_SCREEN						                    ; JUMP ->END OF DRAW PLAYER DATA SCEEN

_F}_DRAW_SKILL_PLAYER_DATA_SCREEN

_F{_DRAW_OL_PLAYER_DATA_SCREEN												

DRAW_OL_PLAYER_DATA_SCREEN:							                                                ; DRAW OFFENSIVE LINEMAN
	LDA #OL_DATA_SCREEN_ID						                                            ; SET BG SCREEN ID = OL SCREEN
	JSR DRAW_COMMON_ATTRIBUTE_BARS_PLAYER_DATA					                                            ; DRAW PLAYER DATA SCREEN AND COMMON ATTRIBUTE BARS(A= POSITION SET TO DRAW)	
    JMP SET_BG_COLOR_PLAYER_DATA_SCREEN						                                        ; JUMP TO END OF DRAW PLAYER DATA SCEEN
	   
_F}_DRAW_OL_PLAYER_DATA_SCREEN

_F{_DRAW_DEFENDER_PLAYER_DATA_SCREEN											

DRAW_DEFENDER_PLAYER_DATA_SCREEN:							                    ; DRAW DEFENDER
	LDA #DEFENDER_DATA_SCREEN_ID						                        ; SET BG SCREEN ID = DEFENDER SCREEN
	JSR DRAW_COMMON_ATTRIBUTE_BARS_PLAYER_DATA					                ; DRAW PLAYER DATA SCREEN AND COMMON ATTRIBUTE BARS(A= POSITION SET TO DRAW)
	
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] INTERCEPTION_INDEX, INT_ABILITY_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] QUICKNESS_INDEX, QUICKNESS_ABILITY_BAR_PPU_ADDR
	
	LDX #DEF_SACKS_SEASON_STAT_INDEX						                    ; SET STAT INDEX = SACKS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] SACKS_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #DEF_INTS_SEASON_STAT_INDEX						                        ; SET STAT INDEX =   INTERCEPTIONS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] INT_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #DEF_INT_YDS_SEASON_STAT_INDEX						                     ; SET STAT INDEX =   INTERCEPTION YARDS 
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	 ; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] INT_YARDS_PLAYER_DATA_PPU_ADDR						                                            ;
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #DEF_INTS_SEASON_STAT_INDEX						                        ; SET STAT INDEX = INTERCEPTIONS STAT 
	LDY #DEF_INT_YDS_SEASON_STAT_INDEX						                    ; SET STAT INDEX = INTERCEPTION YARDS 
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA					    ; GET YARDS PER STAT, PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	
	LOAD_ADDR_XY[mem_loc] INT_YARD_AVG_PLAYER_DATA_PPU_ADDR						                                            ; 
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #DEF_INT_TDS_SEASON_STAT_INDEX						                     ; SET STAT INDEX = INTERCEPTION TD 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] INT_TDS_PLAYER_DATA_PPU_ADDR 
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	JMP SET_BG_COLOR_PLAYER_DATA_SCREEN						                    ; JUMP->END OF DRAW PLAYER DATA SCEEN

_F}_DRAW_DEFENDER_PLAYER_DATA_SCREEN

_F{_DRAW_KICKER_PLAYER_DATA_SCREEN												

DRAW_KICKER_PLAYER_DATA_SCREEN:							                        ; DRAW KICKER 
	
stat_value		= LOCAL_7	
	
	LDA #KICKER_DATA_SCREEN_ID						                            ; SET BG SCREEN ID = KICKER SCREEN
	JSR DRAW_COMMON_ATTRIBUTE_BARS_PLAYER_DATA					                ; DRAW PLAYER DATA SCREEN AND COMMON ATTRIBUTE BARS(A= POSITION SET TO DRAW)
	
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] KICKING_ABILITY_INDEX, KICKING_ABILITY_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] AVOID_KICK_BLOCK_INDEX, AVOID_KICK_BLOCK_BAR_PPU_ADDR
	
	
	LDX #XP_MADE_SEASON_STAT_INDEX						                        ; SET STAT INDEX =  EXTRA POINTS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] XP_MADE_PLAYER_DATA_PPU_ADDR	
    JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #XP_ATT_SEASON_STAT_INDEX						                        ; SET STAT INDEX = EXTRA POINTS ATTEMPTED 	
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] XP_ATT_PLAYER_DATA_PPU_ADDR
	LDA stat_value						                                        ;
	JSR CONVERT_2_DIG_NUM_TILES						                            ; CONVERT 1 BYTE STAT TO NUMBER AND DRAW / BEFORE NUMBER () 
	
	LDX #FG_MADE_SEASON_STAT_INDEX							                    ; SET STAT INDEX =  FIELD GOALS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] FG_MADE_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #FG_ATT_SEASON_STAT_INDEX						                        ; SET STAT INDEX =  FIELD GOALS ATTEMPED 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] FG_ATT_PLAYER_DATA_PPU_ADDR
	LDA stat_value						                                        ;
	JSR CONVERT_2_DIG_NUM_TILES						                            ; CONVERT 1 BYTE STAT TO NUMBER AND DRAW / BEFORE NUMBER ()
	
	LDX #FG_MADE_SEASON_STAT_INDEX							                    ; SET STAT INDEX =  FIELD GOALS STATS INDEX
	LDA CURRENT_ROSTER_ID						                                ;
	JSR SWAP_AND_GET_PLAYER_SEASON_STATS						                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT)
	LDA stat_value						                                        ;
	LDX #FG_POINTS						                                        ;
	JSR MULTIPLY_A_TIMES_X						                                ; 8 BIT MULTIPLY (A * X)  RESULT IN $44,45 = FG MADE * 3

total_points	= SEGMENT_VAR_96	
mult_result 	= LOCAL_7
	
	COPY_16_BIT_A[var1_var2] mult_result, total_points	
	LDX #XP_MADE_SEASON_STAT_INDEX						                        ; SET STAT INDEX =  EXTRA POINTS STAT INDEX
	LDA CURRENT_ROSTER_ID						                                ;
	JSR SWAP_AND_GET_PLAYER_SEASON_STATS						                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT)

result			= LOCAL_7 

	ADD_16_BIT_ZP_TO_16BIT_ZP[source_dest] result, total_points 
	JSR HEX_TO_3_DIGIT_DEC						                                ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)
	
result 			= LOCAL_3
number_to_draw	= LOCAL_7	

	COPY_16_BIT_A[var1_var2] result, number_to_draw
	LOAD_ADDR_XY[mem_loc] TOTAL_PTS_PLAYER_DATA_PPU_ADDR						; 
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	JMP SET_BG_COLOR_PLAYER_DATA_SCREEN					                                            ; JUMP->END OF DRAW PLAYER DATA SCEEN

_F}_DRAW_KICKER_PLAYER_DATA_SCREEN

_F{_DRAW_PUNTER_PLAYER_DATA_SCREEN												

DRAW_PUNTER_PLAYER_DATA_SCREEN:							                                            ; DRAW PUNTER
	LDA #PUNTER_DATA_SCREEN_ID						                            ; SET BG SCREEN ID = PUNTER POSITION
	JSR DRAW_COMMON_ATTRIBUTE_BARS_PLAYER_DATA					                ; DRAW PLAYER DATA SCREEN AND COMMON ATTRIBUTE BARS(A= POSITION SET TO DRAW)
	
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] PUNTING_ABILITY_INDEX, PUNTING_ABILITY_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] AVOID_KICK_BLOCK_INDEX, AVOID_KICK_BLOCK_BAR_PPU_ADDR
	
	
	LDX #PUNTS_SEASON_STAT_INDEX							                     ; SET STAT INDEX =   PUNTS 
	JSR GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44
	LOAD_ADDR_XY[mem_loc] PUNTS_PLAYER_DATA_PPU_ADDR
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #PUNT_YDS_SEASON_STAT_INDEX						                        ; SET STAT INDEX =  PUNT YARDS 
	JSR GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN	; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45
	LOAD_ADDR_XY[mem_loc] PUNT_YARDS_PLAYER_DATA_PPU_ADDR	
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; DRAW 4 DIGIT NUMBER(X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	
	LDX #PUNTS_SEASON_STAT_INDEX							                    ; SET STAT INDEX =  PUNTS 
	LDY #PUNT_YDS_SEASON_STAT_INDEX						                        ; SET STAT INDEX =   PUNT YARDS 
	JSR GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA					    ; GET YARDS PER STAT, PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	LOAD_ADDR_XY[mem_loc] PUNT_AVG_PLAYER_DATA_PPU_ADDR						    ;
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

_F}_DRAW_PUNTER_PLAYER_DATA_SCREEN

_F{_SET_BG_COLOR_PLAYER_DATA_SCREEN							                   
									                                            ; PLAYER DATA SCREEN PALLETE AT 
									                                            ; 0X1A2E0
									                                            ; BG COLOR
									                                            ; 0X28 STAT NAME TEXT COLOR 
									                                            ; 0X25 UNDERLINE COLOR AND ATTRIBUTE BAR COLOR
									                                            ; 0X30 MOST OF GENERAL TEXT COLOR


									                                            ; 0X0F FRAME SHADOW BEHIND PLAYER PICTURE
									                                            ; 0X21 DIFFERENT COLOR FOR UNIQUE ATTRIBUTE BARS
									                                            ; 0X30 REST OF GENERAL TEXT COLOR 

			
									                                            ; 0X21 PLAYER PORTRAIT BACKGROUND COLOR
									                                            ; 0X30 PLAYER SHOULDER PADS COLOR
									                                            ; 0X25 CONDITION TEXT COLOR
									
									
SET_BG_COLOR_PLAYER_DATA_SCREEN:							                    ; END OF DRAW PLAYER DATA SCEEN
	LDX #MAIN_GAME_BANK_2			                                            ; SET BANK = MAIN GAME BANK 2 
	JSR SWAP_A000_BANK				                                            ; SWAP $A000 BANK(X=BANK TO SWAP TO)
	LDA #PLAYER_DATA_BG_PAL_INDEX	                                            ; SET DEFAULT BACKGROUND PALLETE TO ? 
	STA BG_PAL_INDEX				                                            ; 	
	JSR GET_SAVE_BG_PAL_TO_BUFFER	                                            ; SET BACKGROUND PALLETE()
	JSR GET_SAVE_SPR_PAL_TO_BUFFER	                                            ; SET OAM PALLETTE()
	LDX PLAYER_DATA_SCREEN_TEAM							                        ; LOAD CURRENT TEAM
	LDA PLAYER_DATA_TEAM_BG_COLOR_TABLE,X					                    ; SET SCREEN BACKGROUND COLOR (X= TEAM OFFSET) FROM PLAYER DATA TEAM BACKGROUND COLOR
	
@set_bg_and_spr_transparent_color	
	STA BG_PAL_BUFFER_START						
	STA BG_PAL_BUFFER_START + 4						
	STA BG_PAL_BUFFER_START + 8						
	STA BG_PAL_BUFFER_START + 12

	STA SPR_PAL_BUFFER_START						
	STA SPR_PAL_BUFFER_START + 4						
	STA SPR_PAL_BUFFER_START + 8						
	STA SPR_PAL_BUFFER_START + 12		
	
	JSR SET_BG_SPR_FULLY_FADED_IN	                                            ; SET PALLETES TO FULLY FADED IN()
	
_F}_SET_BG_COLOR_PLAYER_DATA_SCREEN	

_F{_CHECK_FOR_EXIT_PLAYER_DATA_SCREEN										

	LDA PLAYER_DATA_SCREEN_TEAM							                        ; RESTOR TEAM INTO CURRENT TEAM
	STA CURRENT_TEAM							                                ; 
_WHILE EQUAL							                                            ; WAIT FOR A OR B PRESS TO RETURN TO ROSTER LIST

	RETURN_1_FRAME
	LDA JOY_PRESS_BOTH					                                            ; IS A OR B PRESSED?
	AND #(A_BUTTON + B_BUTTON )						                                            ; 

_END_WHILE						                                            ; NO->WAIT FOR A OR B PRESS TO RETURN TO ROSTER LIST

	RTS								                                            ; RETURN

_F}_CHECK_FOR_EXIT_PLAYER_DATA_SCREEN
					
_F{_DRAW_PLAYER_ATTR_BARS													

temp_roster_id			= LOCAL_7
temp_team_id			= LOCAL_8

ppu_addr				= LOCAL_7

DRAW_COMMON_ATTRIBUTE_BARS_PLAYER_DATA:							                ; DRAW PLAYER DATA SCREEN AND COMMON ATTRIBUTE BARS(A= SCENE ID)
	LDX #MENU_DRAW_SCRIPT_BANK						                            ; SET BANK =  MENU_DRAW_SCRIPT_BANK
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK						                ; DRAW PLAYER DATA SCREEN BACKGROUND()
	
@draw_player_number_name:	
	LDA CURRENT_ROSTER_ID						                                ; SAVE ACTUAL PLAYER IN $44
	STA temp_roster_id						                                                ;
	LDA CURRENT_TEAM						                                    ; SAVE TEAM IN $45
	STA temp_team_id						                                                ; 
	LOAD_ADDR_XY[mem_loc] PLAYER_NAME_PLAYER_DATA_PPU_ADDR 
	JSR DRAW_PLAYER_NUM_AND_NAME						                        ; DRAW PLAYER NUMBER AND NAME(X,Y= PPU LOCATION,$44=PLAYER, $45=TEAM)

@draw_player_face:	
	LDA CURRENT_ROSTER_ID					                                    ; LOAD CURRENT PLAYER
	LDX CURRENT_TEAM						                                    ; LOAD CURRENT TEAM
	LDY #PLAYER_FACE_INDEX						                                ; LOAD FACE INDEX
	CLC							                                                ;
	JSR GET_PLAYER_SKILL_OR_FACE						                        ; GET PLAYER SKILL OR FACE (A=ACTUAL PLAYER, X=TEAM, Y=FACE OR SKILL) 
	LDX #<PLAYER_FACE_PPU_ADDR						                            ; SET PLAYER FACE SPRITE PPU LOCATION TO 2020
	STX ppu_addr+1						                                        ;
	LDX #>PLAYER_FACE_PPU_ADDR						                             ;
	STX ppu_addr						                                        ;
	JSR SWAP_8000_DRAW_PLAYER_FACE_RETURN						                ; DRAW PLAYER FACE SPRITE(A=FACE SPRITE INDEX, 44,45=PPU LOCATION)

@draw_common_attributes:	
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] RUNNING_SPEED_INDEX, RUNNING_SPEED_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] RUSHING_POWER_INDEX, RUSHING_POWER_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] MAX_SPEED_INDEX, MAX_SPEED_BAR_PPU_ADDR
	DRAW_PLAYER_SKILL_BAR[skill_ppuaddr] HITTING_POWER_INDEX, HITTING_POWER_BAR_PPU_ADDR

@draw_player_position:		
	LDA CURRENT_ROSTER_ID						                                ; LOAD ACTUAL PLAYER
	LOAD_ADDR_XY[mem_loc] PLAYER_POS_PLAYER_DATA_PPU_ADDR
	JSR DRAW_PLAYER_POSITION_ABREV_TEAM_DATA					                ; DRAW PLAYER POSITION(A= PLAYER X,Y= PPU LOCATION)
	
@draw_player_condition:	
	LDA CURRENT_ROSTER_ID						                                ; LOAD ACTUAL PLAYER 
	JSR DRAW_CONDITION_TEXT_PLAYER_DATA					                        ; SET CONDITION TEXT TO DRAW()
	LOAD_ADDR_XY[mem_loc] CONDITION_PLAYER_DATA_PPU_ADDR	
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						        ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(X,Y= PPU ADDR, 3E,3F=DATA ADDR)
	
@set_condition_text_color:

attrib_data_addr		= LOCAL_1
condition_color_index	= LOCAL_8
	
	LDA condition_color_index						                            ; SET CONDITION TEXT COLOR
	CLC							                                                ; SET DATA LOCATION = CONDITION PALLETES + CONDITION OFFSET
	ADC #<CONDITION_ATTRIB_TABLE_DATA					                        ;
	STA attrib_data_addr						                                ;
	LDA #$00						                                            ;
	ADC #>CONDITION_ATTRIB_TABLE_DATA					                        ;
	STA attrib_data_addr +1						                                ;
	LOAD_ADDR_XY[mem_loc] CONDITION_PLAYER_DATA_ATTR_ADDR						; SET PPU LOCATION = ATTRIBUTE TABLE LOCATION $23CD
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS						        ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES(X,Y= PPU ADDR, 3E,3F=DATA ADDR)
	RTS							                                                ; RETURN

DRAW_ATTRIBUTE_BAR_PLAYER_DATA:				      		                        ; DRAW ATTRIBUTE BAR(X,Y=PPU NAMETABLE ADDRESS, A= SKILL TO DRAW)

ppu_addr					= LOCAL_3
skill_value					= LOCAL_7
remaining_skill_bar_value	= LOCAL_8				

LENGTH_OF_SKILL_BAR		= $0D
NUMBER_OF_TILES_IN_BAR	= $08 													; each skill point worth 1/2 a bar 
SKILL_NOTCHES_PER_TILE	= $02

@save_skill_bar_ppu_addr: 
	STY ppu_addr						                                        ; SAVE TEMP ATTRIBUTE BAR PPU ADDR
	STX ppu_addr + 1						                                    ;
	
@get_player_skill_value: 	
	TAY							                                                ; SAVE SKILL TO GET 
	LDA CURRENT_ROSTER_ID						                                ; LOAD ACTUAL PLAYER
	LDX CURRENT_TEAM						                                    ; LOAD CURRENT TEAM 
	CLC							                                                ; SET PLAYER SIDE = P1 BUG WILL ALWAYS DRAW P1 CONDITIONS
	JSR GET_PLAYER_SKILL_OR_FACE						                        ; GET PLAYER SKILL OR FACE (A=ACTUAL PLAYER, X=TEAM, Y=FACE OR SKILL, C= P1P2) 
	STA skill_value						                                        ; SAVE SKILL VALUE
	STA remaining_skill_bar_value						                        ;
	INC remaining_skill_bar_value						                        ; 
	LDY ppu_addr						                                        ; SET PPU ADDR = TEMP ATTRIBUTE BAR PPU ADDR
	LDX ppu_addr +1 						                                    ; 	
	LDA #LENGTH_OF_SKILL_BAR						                            ; SET LENGTH OF SKILL BAR = 13 TILES
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                ; BUFFER_DATA(X,Y= PPU ADDRESS, A= LENGTH)
	LDA #LEFT_END_OF_SKILL_BAR_TILE_ID						                    ; SET TILE ID = BLANK TILE
	STA CURRENT_BG_BUFFER_LOC,X						                            ;
	INX							                                                ; BUFFER INDEX++
	LDY #NUMBER_OF_TILES_IN_BAR						                            ; SET NUMBER OF TILES LEFT TO DRAW IN BAR = 8 

_WHILE NOT_EQUAL							                                    ; FILL SKILL BAR LOOP 
	
	LDA remaining_skill_bar_value						                        ; DOES ADJUST SKILL = 0? SHOULD BE IMPOSSIBLE
	BEQ @fill_bar_with_BG_color						                            ; YES->FILL REST OF CONDITION BAR WITH BG COLOR
	
	CMP #SKILL_NOTCHES_PER_TILE						                            ;
	BCC @draw_half_full_tile						                            ;

@draw_full_tile:	
	SEC							                                                ;
	SBC #SKILL_NOTCHES_PER_TILE						                            ;
	STA remaining_skill_bar_value						                        ;

	LDA #FULL_SKILL_BAR_TILE_ID						                                            ;
	STA CURRENT_BG_BUFFER_LOC,X						                            ;
	INX							                                                ; BUFFER INDEX++
	DEY							                                                ; NUMBER OF TILES LEFT TO DRAW IN BAR--
	
_END_WHILE						                                           		; DONE? NO->FILL SKILL BAR LOOP 
	
	JMP @draw_left_end_bar						                                ; YES->DRAW ATTRIBUTE VALUE NUMBER NEXT TO BAR
	
@draw_half_full_tile:							                                ; SET TILE = HALF FULL
	LDA #HALF_FULL_SKILL_BAR_TILE_ID							                ; SET TILE ID = 1/2 BG COLOR, 1/2 SKILL COLOR 
	STA CURRENT_BG_BUFFER_LOC,X						                            ;
	INX							                                                ; BUFFER INDEX++
	DEY							                                                ; NUMBER OF TILES LEFT TO DRAW IN BAR--
	BEQ @draw_left_end_bar						                                ; DONE? YES-> DRAW ATTRIBUTE VALUE NUMBER NEXT TO BAR 

@fill_bar_with_BG_color: 

_WHILE NOT_EQUAL							                                    ; FILL REST OF CONDITION BAR WITH BG COLOR 
	
	LDA #BG_COLOR_SKILL_BAR_TILE_ID						                                            ; SET TILE ID = TEAM BG COLOR TILE
	STA CURRENT_BG_BUFFER_LOC,X						                            ;
	INX							                                                ; BUFFER INDEX++
	DEY							                                                ; NUMBER OF TILES LEFT TO DRAW IN BAR--

_END_WHILE						                                                ; DONE? NO->FILL REST OF CONDITION BAR WITH BG COLOR

@draw_left_end_bar:							                                    ; DRAW ATTRIBUTE VALUE NUMBER NEXT TO BAR
	LDA #RIGHT_END_OF_SKILL_BAR_TILE_ID						                    ; LOAD BLANK TILE 
	STA CURRENT_BG_BUFFER_LOC,X						                            ;
	INX							                                                ; BUFFER INDEX++

@draw_skill_number:		
	LDA skill_value						                                        ; LOAD SKILL INDEX 
	ASL							                                                ; SHIFT SINCE EACH ENTRY IS TWO DIGITS 
	TAY							                                                ; LOAD FIRST DIGIT FROM SKILL VALUES
	LDA SKILL_NUMBER_VALUE_TABLE+1,Y					                        ; 
	CLC							                                                ; 
	JSR CONVERT_LOWER_DIGIT_TO_TILE_OMIT_LEAD_ZERO						        ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)

	LDA SKILL_NUMBER_VALUE_TABLE,Y					                            ; LOAD SECOND DIGIT FROM SKILL VALUES
	JSR CONVERT_UPPER_DIGIT_TO_TILE						                        ; CONVERT MID DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	
	LDA SKILL_NUMBER_VALUE_TABLE,Y					                            ; LOAD THIRD DIGIT FROM SKILL VALUES
	JSR CONVERT_LOWER_DIGIT_TO_TILE						                        ; CONVERT LOW DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						            ; SET CURRENT BUFFER LOCATION TO END AND SET BUFFER TO READY

_F}_DRAW_PLAYER_ATTR_BARS

_F{_DRAW_CONDITION_TEXT_PLAYER_DATA												

DRAW_CONDITION_TEXT_PLAYER_DATA:							                     ; SET CONDITION TEXT TO DRAW()

sram_addr				= LOCAL_1
temp_roster_id			= LOCAL_7

text_addr				= LOCAL_1
player_condition		= LOCAL_8
player_condition_index	= LOCAL_8

	STA temp_roster_id					                                        ; SAVE ACTUAL PLAYER  PLAYER IN $44
	LDA GAME_STATUS						                                        ; IS GAME TYPE = PRO-BOWL?
	AND #$03						                                            ; 
	CMP #$01						                                            ;
	BEQ @get_player_condition_pro_bowl						                    ; YES->GET PLAYER CONDITION START
	
	LDA temp_roster_id						                                    ; LOAD ACTUAL PLAYER
	JSR CHECK_IF_PLAYER_INJURED						                            ; CHECK FOR INJURY(A= PLAYER)
	BCS @player_injured						                                     ; PLAYER INJURED-> PLAYER INJURED
	
	LDA temp_roster_id						                                    ; LOAD ACTUAL PLAYER
	JSR GET_PLAYER_CONDITION						                            ; GET PLAYER CONDITION (A=STARTER ID)	
	JMP @get_player_condition_normal						                    ; JUMP->GET CONDITION TEXT AND PALLETE

@get_player_condition_pro_bowl:							                        ; GET PLAYER CONDITION START
	LDA CURRENT_TEAM						                                    ; LOAD CURRENT TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR						                        ; LOAD TEAM SEASON SRAM LOCATION IN 3E 3F()
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] sram_addr, CONDITIONS_SEASON_STATS_OFFSET 
	LDA temp_roster_id						                                    ; LOAD ACTUAL PLAYER 
	TAX							                                                ;
	LSR							                                                ; SHIFT BY 4 SINCE 4 PLAYERS PER BYTE
	LSR							                                                ;
	TAY							                                                ;
	LDA (sram_addr),Y					                                        ; LOAD CONDITION BYTE
	JSR GET_PLAYER_COND_INJURY_STATUS						                    ; GET PLAYER CONDITION OR INJURY FROM BYTE

@get_player_condition_normal:								                    ; GET CONDITION TEXT AND PALLETE



	STA player_condition						                                ; SAVE CONDITION IN $45
	ASL							                                                ;
	TAX							                                                ;
	LDA CONDITION_TEXT_PTR_TABLE,X					                            ; SET CONDITION TEXT ADDR FROM CONDITION TEXT PTR TABLE 
	STA text_addr						                                ;
	LDA CONDITION_TEXT_PTR_TABLE+1,X					                        ;
	STA text_addr +1 						                            ;
	LDA player_condition						                                ; SET CONDITION PALLETE INDEX FROM INDEX 
	ASL							                                                ; EACH ENTRY 5 BYTES LONG
	ASL							                                                ;
	CLC							                                                ;
	ADC player_condition						                                ;	
	STA player_condition_index						                            ;
	RTS							                                                ; RETURN

@player_injured:							                                                ; PLAYER INJURED
	LDA #<INJURED_TEXT_DATA					                                    ; SET CONDITION TEXT ADDR = PLAYER INJURED TEXT ADDR
	STA text_addr						                                        ;
	LDA #>INJURED_TEXT_DATA					                                    ;
	STA text_addr + 1						                                    ;
	LDA #$00						                                            ; SET CONDITION PALLETE INDEX = AVERAGE
	STA player_condition_index						                             ;
	RTS							                                                ; RETURN

_F}_DRAW_CONDITION_TEXT_PLAYER_DATA	

_F{_VARIOUS_BCD_CONVERSIONS_AND_NUMBER_DRAWING									

GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN:					; CONVERT 1 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45

hex_value = LOCAL_7
	
	LDA CURRENT_ROSTER_ID						                                ; LOAD ACTUAL PLAYER
	JSR SWAP_AND_GET_PLAYER_SEASON_STATS						                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT)
	LDA hex_value						                                        ; LOAD STAT HEX NUMBER
	JSR HEX_TO_2_DIGIT_DEC						                                ; CONVERT HEX TO DECIMAL (A= NUMBER TO CONVERT)
	RTS							                                                ; RETURN

GET_ONE_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_LEADER_SCREEN:						; GET ONE BYTE (MAX 255) STAT AND CONVERT TO DECIMAL(X = STAT INDEX)

hex_value = LOCAL_7

	LDY CURRENT_LEADERS_ARRAY_INDEX						                        ; LOAD INDEX TO CURRENT PLAYER
	LDA CURRENT_TEAM_LEADERS_RANKING[],Y					                    ; SAVE TEAM IN $6E 
	STA CURRENT_TEAM						                                    ;
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],Y					                ; LOAD PLAYER
	JSR SWAP_AND_GET_PLAYER_SEASON_STATS						                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT)
	LDA hex_value						                                        ; LOAD STAT HEX NUMBER
	JSR HEX_TO_2_DIGIT_DEC						                                ; CONVERT HEX TO DECIMAL (A= NUMBER TO CONVERT)
	RTS							                                                ; RETURN

GET_PLAYER_SEASON_STAT_HEX_VALUE_LEADER_SCREEN:							        ; GET ONE BYTE (MAX 255) STAT (X= STAT INDEX)
	
hex_value = LOCAL_7
	
	LDY CURRENT_LEADERS_ARRAY_INDEX						                        ; LOAD INDEX TO CURRENT PLAYER
	LDA CURRENT_TEAM_LEADERS_RANKING[],Y						                ; SAVE TEAM IN $6E
	STA CURRENT_TEAM						                                    ;
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],Y						            ; LOAD PLAYER
	JSR SWAP_AND_GET_PLAYER_SEASON_STATS						                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT)
	LDA hex_value						                                        ; STAT HEX NUMBER
	RTS							                                                ; RETURN

GET_TWO_BYTE_SEASON_STAT_CONVERT_TO_DECIMAL_PLAYER_DATA_SCREEN:			        ; CONVERT 2 BYTE STAT TO NUMBER (X= STAT INDEX) RET= $44,45

decimal_result	= LOCAL_3
decimal_return  = LOCAL_7

	LDA CURRENT_ROSTER_ID					                                    ; LOAD ACTUAL PLAYER
	JSR SWAP_AND_GET_PLAYER_SEASON_STATS						                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT)
	JSR HEX_TO_3_DIGIT_DEC						                                ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)
	LDA decimal_result						                                    ; SAVE NUMBER IN $44,$45
	STA decimal_return						                                    ;
	LDA decimal_result + 1						                                ; 
	STA decimal_return + 1						                                ;
	RTS							                                                ; RETURN

CONVERT_TWO_BYTE_STAT_TO_BCD_LEADERS:							                 ; GET 2 BYTE STAT (X= STAT INDEX) RET= $44,45

decimal_result	= LOCAL_3
decimal_return  = LOCAL_7

	LDY CURRENT_LEADERS_ARRAY_INDEX						                        ; SET TEAM ID = CURRENT TEAM ID
	LDA CURRENT_TEAM_LEADERS_RANKING[],Y						                ;
	STA CURRENT_TEAM						                                    ;
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],Y						            ; SET PLAYER ID =  CURRENT PLAYER ID
	JSR SWAP_AND_GET_PLAYER_SEASON_STATS						                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT)
	JSR HEX_TO_3_DIGIT_DEC						                                ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)
	LDA decimal_result						                                    ; SAVE NUMBER IN $44,$45
	STA decimal_return						                                    ;
	LDA decimal_result + 1						                                ; 
	STA decimal_return + 1						                                ;
	RTS							                                                ; RETURN


GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_PLAYER_DATA:							    ; GET YARDS PER ATTEMPT NUMBER PLAYER DATA SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	STX SECOND_STAT_INDEX						                                ; SET DIVISOR STAT INDEX
	STY FIRST_STAT_INDEX						                                ; SET NUMERATOR STAT INDEX	
	JSR DIVIDE_YARDS_BY_ATTEMPTS					                            ; DIVIDE STATS ($90 = NUMERATOR STAT INDEX, 91 = DIVISOR STAT INDEX)
	JSR LEADERS_HEX_TO_DEC_ONE_PT_PRECISION					                    ; CONVERT HEX VALUE TO BCD, ONE DECIMAL PT PRECISION($43,$44,$45)
	RTS							                                                ; RETURN

GET_YARDS_PER_ATTEMPT_CONVERT_TO_BCD_LEADERS:							        ; GET YARDS PER ATTEMPT NUMBER LEADERS SCREEN(X= ATT STAT INDEX, Y= YARDS STAT INDEX)
	STX SECOND_STAT_INDEX						                                ; SET DIVISOR STAT INDEX
	STY FIRST_STAT_INDEX						                                ;
	LDX CURRENT_LEADERS_ARRAY_INDEX						                        ; SET CURRENT TEAM = CURRENT TEAM FOR PLAYER STATS
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ;
	STA CURRENT_TEAM						                                    ;
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						            ; SET CURRENT PLAYER ID = CURRENT PLAYER FOR PLAYER STATS
	STA CURRENT_ROSTER_ID						                                ;	
	JSR DIVIDE_YARDS_BY_ATTEMPTS					                            ; DIVIDE STATS ($90 = NUMERATOR STAT INDEX, 91 = DIVISOR STAT INDEX) 			
	JSR LEADERS_HEX_TO_DEC_ONE_PT_PRECISION					                    ; CONVERT HEX VALUE TO BCD, ONE DECIMAL PT PRECISION($43,$44,$45)
	RTS							                                                ; RETURN

DRAW_3_DIGIT_NUMBER_PLAYER_STATS:							                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)

decimal_portion		= LOCAL_6
bcd_number			= LOCAL_7													;

	LDA #$03						                                            ; LOAD DATA LENGTH
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                ; BUFFER_DATA(X,Y= PPU ADDRESS, A= LENGTH)
	CLC							                                                ; 
	LDA bcd_number+1						                                    ; LOAD HIGH DIGIT
	JSR CONVERT_LOWER_DIGIT_TO_TILE_OMIT_LEAD_ZERO						        ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	LDA bcd_number						                                        ; LOAD MID DIGIT
	JSR CONVERT_UPPER_DIGIT_TO_TILE						                        ; CONVERT MID DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	LDA bcd_number						                                        ; LOAD LOW DIGIT
	JSR CONVERT_LOWER_DIGIT_TO_TILE						                        ; CONVERT LOW DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						            ; SET CURRENT BUFFER LOCATION TO END AND SET BUFFER TO READY

DRAW_ONE_DIGIT_NUM_NOT_USED:							                        ; DRAW 1 DIGIT NUMBER (X,Y = PPU LOCATION, A= NUMBER)	 ***NOT USED
    STA bcd_number						                                        ;
	LDA #$01						                                            ; SET LENGTH TO 1 
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                ; BUFFER_DATA(X,Y= PPU ADDRESS, A= LENGTH)
	LDA bcd_number						                                        ;
	JSR CONVERT_LOWER_DIGIT_TO_TILE						                        ; CONVERT LOW DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						            ; SET CURRENT BUFFER LOCATION TO END AND SET BUFFER TO READY AND RETURN

ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER:							    ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	LDA #$04						                                            ; SET DATA LENGTH TO 4 
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                ; BUFFER_DATA(X,Y= PPU ADDRESS, A= LENGTH)
	CLC							                                                ;
	JMP DRAW_NUMBER_PLUS_DECIMAL					                            ; JUMP->DRAW REMAINING DIGITS PLUS DECIMAL

ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER:							        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $45,$44,$43= NUMBER TO DRAW)
	LDA #$05						                                            ; SET DATA LENGTH TO 5
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                ; BUFFER_DATA(X,Y= PPU ADDRESS, A= LENGTH)
	CLC							                                                ;
	LDA bcd_number+1						                                    ; LOAD HIGH DIGIT
	JSR CONVERT_LOWER_DIGIT_TO_TILE_OMIT_LEAD_ZERO						        ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)

DRAW_NUMBER_PLUS_DECIMAL:							                            ; DRAW REMAINING DIGITS PLUS DECIMAL
	LDA bcd_number						                                        ; LOAD MID AND LOW DIGIT
	JSR CONVERT_UPPER_DIGIT_TO_TILE						                        ; CONVERT MID DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	LDA bcd_number						                                        ; LOAD MID AND LOW DIGIT
	JSR CONVERT_LOWER_DIGIT_TO_TILE						                        ; CONVERT LOW DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	LDA #DECIMAL_TILE_ID						                                ; SAVE DEMICAL PLACE TILE IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X						                            ;
	INX							                                                ;
	LDA decimal_portion						                                                ;  		
	SEC							                                                ;
	JSR CONVERT_UPPER_DIGIT_TO_TILE						                        ; CONVERT MID DIGIT TO TILE AND SAVE IN BUFFER(A= DIGIT)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						            ; SET CURRENT BUFFER LOCATION TO END AND SET BUFFER TO READY

_F}_VARIOUS_BCD_CONVERSIONS_AND_NUMBER_DRAWING

_F{_DRAW_PLAYER_POSITION_ABBREVIATION											

abrev_ppu_addr					= LOCAL_1
roster_id						= LOCAL_6
pos_text_index					= LOCAL_8
characters_left					= LOCAL_8

QB_ABREV_INDEX					= $00 
RB_ABREV_INDEX					= $01 
WR_ABREV_INDEX					= $02
TE_ABREV_INDEX					= $03

POS_ABREVIATION_LENGTH			= $04

DRAW_PLAYER_POSITION_ABBREV_PRO_BOWL:							                ; DRAW PLAYER POSITION PRO BOWL($43 = PLAYER ID)
	LDA roster_id						                                        ; LOAD CURRENT SEASON PLAYER ID  
	JMP DRAW_PLAYER_POSITION_ABREV					                            ; 
	
DRAW_PLAYER_POSITION_ABREV_TEAM_DATA:							                ; DRAW PLAYER POSITION(A= PLAYER X,Y= PPU LOCATION)
	STY abrev_ppu_addr						                                    ; SAVE PPU ADDR
	STX abrev_ppu_addr + 1						                                ;

DRAW_PLAYER_POSITION_ABREV:

@check_for_qb:
	CMP #RB1_ROSTER_ID						                                    ; IS CURRENT SEASON PLAYER ID  <= QB
	BCC @player_is_qb						                                    ; YES->PLAYER IS QB

@check_for_non_skill:	
	CMP #C_ROSTER_ID						                                    ; IS CURRENT SEASON PLAYER ID  >= CENTER
	BCS @player_is_not_skill_player						                        ; YES-> PLAYER IS NOT QB OR SKILL PLAYER


	TAX							                                                ; SAVE PLAYER ID
	LDA CURRENT_TEAM						                                    ; IS CURRENT TEAM = HOUSTON 
	
@check_for_4wr_team:		
	CMP #HOU_TEAM_ID					                                         ;	
	BEQ @get_4wr_team_pos_name						                            ; YES-> SKILL PLAYER ON 4 WR TEAM
	CMP #DET_TEAM_ID					                                         ; IS CURRENT TEAM = DET
	BEQ @get_4wr_team_pos_name						                            ; YES-> SKILL PLAYER ON 4 WR TEAM
	CMP #ATL_TEAM_ID					                                        ; IS CURRENT TEAM = ATL
	BEQ @get_4wr_team_pos_name						                            ; YES-> SKILL PLAYER ON 4 WR TEAM
	

@check_for_3wr_team:	
	CMP #WAS_TEAM_ID				                                            ; IS CURRENT TEAM = WAS
	BEQ @get_3wr_team_pos_name						                            ; YES-> SKILL PLAYER ON 3 WR TEAM
	CMP #PHX_TEAM_ID					                                        ; IS CURRENT TEAM = PHX
	BEQ @get_3wr_team_pos_name						                            ; YES-> SKILL PLAYER ON 3 WR TEAM
	

@get_2wr_team_pos_name:		
	LDA POS_NAME_2WR_TABLE-2,X					                                ; GET POSITION TYPE FROM SKILL POSITION NAMES OFFSETS 4 WR TEAM
	JMP @put_text_in_buffer						                                ; JUMP-> CONVERT POSITION INDEX AND LOAD POSITION NAME INTO BUFFER

@get_4wr_team_pos_name:							                                ; SKILL PLAYER ON 4 WR TEAM
	LDA POS_NAME_4WR_TABLE-2,X					                                ; GET POSITION TYPE FROM SKILL POSITION NAMES OFFSETS 4 WR TEAM
	JMP @put_text_in_buffer						                                ; JUMP-> CONVERT POSITION INDEX AND LOAD POSITION NAME INTO BUFFER 

@get_3wr_team_pos_name:							                                ; SKILL PLAYER ON 3 WR TEAM
	LDA POS_NAME_3WR_TABLE-2,X					                                ; GET POSITION TYPE FROM SKILL POSITION NAMES OFFSETS 3 WR TEAM
	JMP @put_text_in_buffer						                                ; JUMP-> CONVERT POSITION INDEX AND LOAD POSITION NAME INTO BUFFER

@player_is_qb:							                                        ; PLAYER IS QB 
	LDA #QB_ABREV_INDEX						                                            ; SET POSITION TYPE = QB 
	JMP @put_text_in_buffer						                                ; JUMP-> CONVERT POSITION INDEX AND LOAD POSITION NAME INTO BUFFER

@player_is_not_skill_player:							                        ; PLAYER IS NOT QB OR SKILL PLAYER
	CLC							                                                ; = PLAYER ID - LENGTH OF QB TO OL 
	ADC #$F8						                                            ; 

@put_text_in_buffer:							                                ; CONVERT POSITION INDEX AND LOAD POSITION NAME INTO BUFFER 
	ASL							                                                ;
	ASL							                                                ;
	STA pos_text_index						                                     ; 
	LDA #POS_ABREVIATION_LENGTH						                            ;
	LDY abrev_ppu_addr						                                    ;
	LDX abrev_ppu_addr +1						                                ;
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                ; BUFFER_DATA(X,Y= PPU ADDRESS, A= LENGTH)
	LDY pos_text_index						                                    ;
	LDA #POS_ABREVIATION_LENGTH							                        ; SET CHARACTERS LEFT = 4
	STA characters_left						                                    ; 

_WHILE NOT_EQUAL							                                    ; SAVE POSITION NAME INTO BUFFER LOOP

	LDA POSITION_ABBREV_TABLE,Y					                                ; SAVE POSITION NAME INTO BUFFER FROM POSITION NAMES
	STA CURRENT_BG_BUFFER_LOC,X						                            ;
	INX							                                                ; BUFFER INDEX++
	INY							                                                ; DATA INDEX++
	DEC characters_left						                                    ; CHARACTERS LEFT--
	
_END_WHILE	

	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						            ; SET CURRENT BUFFER LOCATION TO END AND SET BUFFER TO READY
	RTS							                                                ; RETURN

POS_NAME_2WR_TABLE:							                                   ; SKILL POSITION NAMES OFFSETS 2 WR TEAM
	.DB RB_ABREV_INDEX, RB_ABREV_INDEX, RB_ABREV_INDEX, RB_ABREV_INDEX 			; RB, RB, RB, RB  
    .DB WR_ABREV_INDEX, WR_ABREV_INDEX, WR_ABREV_INDEX, WR_ABREV_INDEX			; WR, WR, WR, WR  
    .DB TE_ABREV_INDEX, TE_ABREV_INDEX					                        ; TE, TE

POS_NAME_4WR_TABLE:							                                   ; SKILL POSITION NAMES OFFSETS 4 WR TEAM
	.DB RB_ABREV_INDEX, WR_ABREV_INDEX, RB_ABREV_INDEX, RB_ABREV_INDEX			; RB, WR, RB, RB  
    .DB WR_ABREV_INDEX, WR_ABREV_INDEX, RB_ABREV_INDEX, WR_ABREV_INDEX 			; WR, WR, RB, WR  
    .DB WR_ABREV_INDEX, WR_ABREV_INDEX					                        ; WR, WR

POS_NAME_3WR_TABLE:							                                    ; SKILL POSITION NAMES OFFSETS 3 WR TEAM
	.DB RB_ABREV_INDEX, WR_ABREV_INDEX, RB_ABREV_INDEX, RB_ABREV_INDEX			; RB, WR, RB, RB  
    .DB WR_ABREV_INDEX, WR_ABREV_INDEX, RB_ABREV_INDEX, WR_ABREV_INDEX 			; WR, WR, RB, WR  
    .DB TE_ABREV_INDEX, TE_ABREV_INDEX					                        ; TE, TE 

_F}_DRAW_PLAYER_POSITION_ABBREVIATION

_F{_VARIOUS_LEADER_STAT_TYPE_AND_PRECISION_FUNCTIONS_AND_TABLES					
	   

ADD_LEADERS_STAT_TO_BG_BUFFER:							                        ; DRAW STAT FOR SINGLE STAT PAGE BASED ON STAT TYPE()
	JSR TRANSFER_BCD_STAT_TO_TEMP_VARS					                        ; TRANSFER SORTED NUMBER TO $43,$44,45()
	LDX STAT_TO_SORT_ON						                                    ; GET NUMBER TYPE FROM NUMBER CONVERSION TYPE INDEX FOR SINGLE PAGE STATS
	LDA LEADERS_STAT_PRECISION_TABLE,X					                        ; 
	PUSH_TABLE_ADDR[tableAddr] LEADERS_STAT_NUMBER_TYPE_TABLE

LEADERS_STAT_NUMBER_TYPE_TABLE:							                        ;  DRAW NUMBER TABLE FOR SINGLE PAGE STATS 
	.WORD DRAW_TWO_DIGIT_NUMBER_LEADERS-1 					                    ; DRAW TWO DIGIT NUMBER FOR SINGLE STAT PAGE
    .WORD DRAW_THREE_DIGIT_NUMBER_LEADERS-1 					                ; DRAW THREE DIGIT NUMBER FOR SINGLE STAT PAGE
    .WORD DRAW_FOUR_DIGIT_NUMBER_LEADERS-1					                    ; DRAW FOUR DIGIT NUMBER FOR SINGLE STAT PAGE
    .WORD DRAW_THREE_DIGIT_AND_DECIMAL_NUMBER_LEADERS-1 					    ; DRAW THREE DIGIT + DECIMAL NUMBER FOR SINGLE STAT PAGE
    .WORD SORT_AND_DRAW_TWO_DIGIT_AND_DECIMAL_NUMBER_LEADERS-1					; DRAW TWO DIGIT + DECIMAL NUMBER FOR SINGLE STAT PAGE
       
DRAW_TWO_DIGIT_NUMBER_LEADERS:							                        ; DRAW TWO DIGIT NUMBER FOR SINGLE STAT PAGE

number	= LOCAL_7

	LDY STAT_TO_SORT_ON						                                    ; LOAD PPU STAT OFFSET FROM PPU OFFSETS FOR SINGLE STAT PAGES
	LDX LEADERS_SINGLE_STAT_PPU_OFFSET_TABLE,Y					                ; 
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	LDA number						                                                ; LOAD NUMBER
	JSR CONVERT_2_DIG_NUM_TILES						                            ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	RTS							                                                ; RETURN

DRAW_THREE_DIGIT_NUMBER_LEADERS:							                    ; DRAW THREE DIGIT NUMBER FOR SINGLE STAT PAGE
	LDY STAT_TO_SORT_ON						                                    ; LOAD PPU STAT OFFSET FROM PPU OFFSETS FOR SINGLE STAT PAGES
	LDX LEADERS_SINGLE_STAT_PPU_OFFSET_TABLE,Y					                ; 
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR DRAW_3_DIGIT_NUMBER_PLAYER_STATS					                    ; DRAW 3 DIGIT NUMBER (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	RTS							                                                ; RETURN

DRAW_FOUR_DIGIT_NUMBER_LEADERS:							                        ; DRAW FOUR DIGIT NUMBER FOR SINGLE STAT PAGE
	LDY STAT_TO_SORT_ON						                                    ; LOAD PPU STAT OFFSET FROM PPU OFFSETS FOR SINGLE STAT PAGES
	LDX LEADERS_SINGLE_STAT_PPU_OFFSET_TABLE,Y
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES						                    ; SAVE 4 DIGIT NUMBER TO BUFFER($44,$45 = NUM)
	RTS							                                                ; RETURN

DRAW_THREE_DIGIT_AND_DECIMAL_NUMBER_LEADERS:							        ; DRAW THREE DIGIT + DECIMAL NUMBER FOR SINGLE STAT PAGE
	LDY STAT_TO_SORT_ON						                                    ; LOAD PPU STAT OFFSET FROM PPU OFFSETS FOR SINGLE STAT PAGES
	LDX LEADERS_SINGLE_STAT_PPU_OFFSET_TABLE,Y					                ;
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_THREE_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 3 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCAITON $44,$45= NUMBER TO DRAW)
	RTS							                                                ; RETURN

SORT_AND_DRAW_TWO_DIGIT_AND_DECIMAL_NUMBER_LEADERS:							    ; DRAW TWO DIGIT + DECIMAL NUMBER FOR SINGLE STAT PAGE
	LDY STAT_TO_SORT_ON						                                    ; LOAD PPU STAT OFFSET FROM PPU OFFSETS FOR SINGLE STAT PAGES
	LDX LEADERS_SINGLE_STAT_PPU_OFFSET_TABLE,Y					                ;
	JSR UPDATE_LEADERS_PLAYER_STATS_PPU_ADDR					                        ; UPDATE PPU ADDR (X= OFFSET)
	JSR ADD_TWO_DIGIT_NUMBER_AND_DECIMAL_TO_BG_BUFFER					        ; DRAW 2 DIGIT NUMBER WITH DECIMAL (X,Y = PPU LOCATION)
	RTS

LEADERS_STAT_PRECISION_TABLE:							                         ; NUMBER CONVERSION TPYE FOR SINGLE PAGE STATS
	.DB $04, $04, $01, $01, $02, $04, $01, $04, $02, $02, $04, $01, $01, $01, $04, $01
	.DB $01, $01, $01, $01, $01, $01, $01, $02, $01, $01, $01, $02, $01, $01, $01, $02
	.DB $01, $01

LEADERS_SINGLE_STAT_PPU_OFFSET_TABLE:							                 ; PPU OFFSETS FOR SINGLE STAT PAGES
	.DB $16, $16, $16, $16, $16, $16, $15, $13, $16, $16, $15, $15, $16, $16, $15, $15
	.DB $15, $15, $15, $15, $16, $16, $16, $16, $15, $16, $16, $16, $16, $15, $16, $16
	.DB $16, $15

TRANSFER_BCD_STAT_TO_TEMP_VARS:							                         ; TRANSFER SORTED NUMBER TO $43,$44,45()

temp_stat_value		= LOCAL_6

	LDX CURRENT_LEADERS_ARRAY_INDEX					                            ; LOAD PLAYER INDEX
	LDA CURRENT_BCD_STAT_VALUE[],X						                        ; SAVE 3 BYTE BCD NUMBER IN $43,$44,$45
	STA temp_stat_value + 2					                                    ;
	LDA CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	STA temp_stat_value + 1						                                ;
	LDA CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	STA temp_stat_value						                                                ;
	RTS							                                                ; RETURN

SET_LEADER_PPU_ADDR_DOWN_4_ROW_GO_TO_NEXT_PLAYER:							     ; SET PPU ADDR DOWN 4 ROWS AND SET PLAYER INDEX TO NEXT PLAYER
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] CURRENT_LEADERS_PPU_ADDR, ( 4 * LENGTH_OF_ONE_ROW)
	
	LDA CURRENT_LEADERS_ARRAY_INDEX					                            ; PLAYER INDEX +=  OFFSET TO NEXT PLAYER(0X06)
	CLC							                                                ;
	ADC #OFFSET_TO_NEXT_RANKING_INDEX						                    ;
	STA CURRENT_LEADERS_ARRAY_INDEX						                        ;
	RTS							                                                ; RETURN

ADD_SINGLE_TILE_TO_BG_BUFFER:							                          ; BUFFER SINGLE TILE (A= TILE ID)

temp_tile_id	= LOCAL_8

	STA temp_tile_id						                                    ; SET TEMP TILE ID = TILE ID 
	LDA #$01						                                            ; SET DATA LENGTH = 1 
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE						                ; BUFFER_DATA(X,Y= PPU ADDRESS, A= LENGTH)
	LDA temp_tile_id						                                    ; SAVE TILE ID IN BG BUFFER 
	STA CURRENT_BG_BUFFER_LOC,X						                            ; 
	INX							                                                ; BG BUFFER INDEX++
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY						            ; SET CURRENT BUFFER LOCATION TO END AND SET BUFFER TO READY
	RTS							                                                ; RETURN

_F}_VARIOUS_LEADER_STAT_TYPE_AND_PRECISION_FUNCTIONS_AND_TABLES	

_F{_PLAYER_DATA_TEAM_BACKGROUND_COLORS											

PLAYER_DATA_TEAM_BG_COLOR_TABLE:							                    ; PLAYER DATA TEAM BACKGROUND COLOR
	.DB COLOR_DARK_RED						                                    ; BUF
	.DB COLOR_DARK_GREY_BLUE						                            ; 
	.DB COLOR_DARK_AQUA						                                    ;
	.DB COLOR_DARK_RED						                                    ;
	.DB COLOR_DARK_YELLOW_GREEN						                            ;
	
	.DB COLOR_DARK_RED						                                    ;
	.DB COLOR_DARK_RED						                                    ;
	.DB COLOR_DARK_GREY_BLUE						                            ;
	.DB COLOR_BLACK_2						                                    ;
	
	.DB COLOR_DARK_GREY_BLUE						                            ;
	.DB COLOR_DARK_RED						                                    ;
	.DB COLOR_DARK_GREY						                                    ;
	.DB COLOR_DARK_GREY_BLUE						                            ;
	.DB COLOR_DARK_GREY_BLUE						                            ;
	
	.DB COLOR_DARK_RED						                                    ;
	.DB COLOR_DARK_GREY_BLUE						                            ;
	.DB COLOR_DARK_YELLOW_GREEN						                            ;
	.DB COLOR_DARK_RED						                                    ;
	.DB COLOR_DARK_GREY_BLUE						                            ;
	
	.DB COLOR_BLACK_2						                                    ;
	.DB COLOR_DARK_GREY_BLUE						                            ;
	.DB COLOR_DARK_YELLOW_GREEN						                            ;
	.DB COLOR_DARK_PURPLE						                                ;
	.DB COLOR_DARK_RED						                                    ;
	
	.DB COLOR_DARK_RED						                                    ;
	.DB COLOR_DARK_GREY_BLUE						                            ;
	.DB COLOR_BLACK_2						                                    ;
	.DB COLOR_BLACK_2						                                    ; ATL
	
_F}_PLAYER_DATA_TEAM_BACKGROUND_COLORS	

_F{_PLAYER_DATA_TEXT_DATA														

SKILL_NUMBER_VALUE_TABLE:							                                            ; SKILL VALUES 
	.WORD $0006, $0013, $0019, $0025, $0031, $0038, $0044, $0050
	.WORD $0056, $0063, $0069, $0075, $0081, $0088, $0094, $0100

POSITION_ABBREV_TABLE:							                                ; POSITION NAMES
	.DB "QB  "
	.DB "RB  "
	.DB "WR  "
	.DB "TE  "
	.DB "C   "
	.DB "LG  "
	.DB "RG  "  
	.DB "LT  "  
	.DB "RT  "  
	.DB "RE  "
	.DB "NT  "
	.DB "LE  "
	.DB "ROLB" 
	.DB "RILB"
	.DB "LILB" 
	.DB "LOLB"
	.DB "RCB " 
	.DB "LCB "
	.DB "FS  "
	.DB "SS  "
	.DB "K   "
	.DB "P   "

CONDITION_TEXT_PTR_TABLE:							                           ; CONDITION TEXT POINTER TABLE
	.WORD BAD_TEXT_DATA 					                                        ; BAD
    .WORD AVERAGE_TEXT_DATA 					                                        ; AVERAGE
	.WORD GOOD_TEXT_DATA 					                                            ; GOOD
	.WORD EXCELLENT_TEXT_DATA					                                                ; EXCELLENT

BAD_TEXT_DATA:							                                            ; CONDITION TEXT
	.DB $03, "BAD", $FF

AVERAGE_TEXT_DATA:
	.DB $07, "AVERAGE", $FF

GOOD_TEXT_DATA:
	.DB $04, "GOOD", $FF

EXCELLENT_TEXT_DATA:
	.DB $09, "EXCELLENT", $FF

INJURED_TEXT_DATA:							                                    ; INJURED TEXT
	.DB $07, "INJURED", $FF

CONDITION_ATTRIB_TABLE_DATA:							                                            ; CONDITION PALLETES
								                                                ; LEN, PALLETE X3, END
	.DB $03, $80, $A0, $A0, $FF			                                        ; BAD PALLETE
	.DB $03, $00, $00, $00, $FF			                                        ; AVERAGE PALLETE	
	.DB $03, $00, $00, $00, $FF			                                        ; GOOD PALLETE	
	.DB $03, $C0, $F0, $F0, $FF         	                                    ; EXCELLENT PALLETE  

_F}_PLAYER_DATA_TEXT_DATA
	
_F{_LEADERS_MENU_INFO														


PASSING_LEADERS_MENU_DATA:							                            ; PASSING LEADERS QB RATING MENU INFO
	.DB $80,$03,$98					                                            ; MENU SPRITE TILE, MENU SPRITE ATTRIB, MENU SPRITE X LOC
	.DB $08						                                                ; NUMBER OF Y MENU CHOICES = 8
	.DB $40						                                                ; 
	.DB $50						                                                ;
	.DB $60						                                                ;
	.DB $70						                                                ;
	.DB $80						                                                ;
	.DB $90						                                                ;
	.DB $A0						                                                ;
	.DB $B0						                                                ; 

PASSING_LEADERS_SINGLE_SCREEN_MENU_DATA:							            ; PASSING LEADERS ALL OTHER QB STAT SCREENS MENU INFO
	.DB $80,$03,$98					                                            ; MENU SPRITE TILE, MENU SPRITE ATTRIB, MENU SPRITE X LOC
	.DB $08						                                                ; NUMBER OF Y MENU CHOICES = 8
	.DB $48						                                                ;
	.DB $58						                                                ;
	.DB $68						                                                ;
	.DB $78						                                                ;
	.DB $88						                                                ;
	.DB $98						                                                ;
	.DB $A8						                                                ;
	.DB $B8						                                                ; 

PUNTING_LEADERS_MENU_DATA:							                            ; PUNTING LEADERS MENU INFO
	.DB $80,$03,$98					                                            ; MENU SPRITE TILE, MENU SPRITE ATTRIB, MENU SPRITE X LOC
	.DB $02						                                                ; NUMBER OF Y MENU CHOICES = 2
	.DB $48
	.DB $58

INT_LEADERS_MENU_DATA:							                                ; INTERCEPTION LEADERS MENU INFO
	.DB $80,$03,$98					                                            ; MENU SPRITE TILE, MENU SPRITE ATTRIB, MENU SPRITE X LOC
	.DB $03						                                                ; NUMBER OF Y MENU CHOICES = 3
	.DB $48
	.DB $58
	.DB $68

RUSHING_LEADERS_MENU_DATA:
RECEIVING_LEADERS_MENU_DATA:
SCORING_LEADERS_MENU_DATA:
																				; SCORING, RUSHING , RECEVING LEADERS MENU INFO
	.DB $80,$03,$98					                                            ; MENU SPRITE TILE, MENU SPRITE ATTRIB, MENU SPRITE X LOC	
    .DB $04						                                            	; NUMBER OF Y MENU CHOICES = 4
	.DB $40
	.DB $50
	.DB $60
	.DB $70

KICK_RETURN_LEADERS_MENU_DATA:							                       
PUNT_RETURN_LEADERS_MENU_DATA:													; PUNT AND KICK RETURN MENU CHOICE INFO 
	.DB $80,$03,$98					                                            ; MENU SPRITE TILE, MENU SPRITE ATTRIB, MENU SPRITE X LOC	
	.DB $04						                                                ; NUMBER OF Y MENU CHOICES = 4
	.DB $48
	.DB $58
	.DB $68
	.DB $78
	
_F}_LEADERS_MENU_INFO	

_F{_LEADERS_STAT_LABELS_DATA													

PASSING_LEADERS_STAT_LABELS_DATA:							                    ; PASSING LEADER MAIN SCREEN COLLUMN LABELS
	.DB $19						                                                ; SET DATA LENGTH = 19 BYTES
	.DB $C8,$C9,$CA					                                            ; TILES FOR UNDERLINE "ATT"
	.DB $00						                                                ; SPACE
	.DB $CB,$CC,$CD					                                            ; TILES FOR UNDERLINE "COMP" 
	.DB $00,$00						                                            ; SPACE, SPACE
	.DB $C6,$CB,$CC,$CD,$CE				                                        ; TILES FOR UNDERLINE "COMP%"
	.DB $00						                                                ; SPACE
	.DB $C6,$CF,$D0,$D1				                                            ; TILES FOR UNDERLINE "YDS"
	.DB $00						                                                ; SPACE
	.DB $D2,$D3,$D4,$D0,$D1		 		                                        ; TILES FOR UNDERLINE "AVG YDS"						
	.DB $FF						                                                ; END OF DATA

PASSING_LEADERS_SECOND_SCREEN_STAT_LABELS_DATA:							        ; PASSING LEADER MAIN SCREEN OFFSCREEN COLLUMN LABELS
	.DB $0B						                                                ; SET DATA LENGTH = 11 
	.DB $D6,$D7						                                            ; TILES FOR UNDERLINE "TD"
	.DB $00						                                                ; SPACE
	.DB $D8,$D9						                                            ; TILES FOR UNDERLINE "INT
	.DB $00,$00						                                            ; SPACE X 2
	.DB $DA,$DB,$DC,$DD				                                            ; TILES FOR UNDERLINE "RATING"
	.DB $FF						                                                ; END OF DATA

SINGLE_STAT_PASS_LEADER_LABEL_ADDR_TABLE:							            ; PASSING LEADERS INDIVIDIUAL SCREENS LABELS
	.WORD COMP_PCT_LEADER_LABEL_DATA 					                        ; COMPLETION PERCENTAGE	LABELS
    .WORD PASS_ATT_LEADER_LABEL_DATA 					                        ; PASSING ATTEMPTS LABELS
    .WORD PASS_COMP_LEADER_LABEL_DATA 					                        ; PASSING COMPLETIONS LABELS
    .WORD PASS_YARDS_LEADER_LABEL_DATA					                        ; PASSING YARDS LABELS
 	.WORD PASS_YPA_LEADER_LABEL_DATA 					                        ; PASSING YARDS PER ATT LABELS
    .WORD PASS_TD_LEADER_LABEL_DATA 					                        ; TOUCHDOWN PASSES LABELS
    .WORD INT_PCT_LEADER_LABEL_DATA					                            ; INT PERCENTAGE LABELS
       
       							                                                ; COMPLETION PERCENTAGE	LABELS						
COMP_PCT_LEADER_LABEL_DATA:							                            ;
       .DB $E7 						                                            ; SET PPU ADDR = 7 TILES OVER  
       .DB $15						                                            ; SET DATA LENGTH = 21  
       .DB "COMPLETION PERCENTAGE" 			                                    ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
       .DB $05 						                                            ; SET DATA LENGTH = 5 
       .DB $C6,$CB,$CC,$CD,$CE				                                    ; TILES FOR UNDERLINE COMP%
       .DB $FF						                                            ; END OF DATA
	   
PASS_ATT_LEADER_LABEL_DATA:							                            ; PASSING ATTEMPTS LABELS
	.DB $EC 						                                            ; SET PPU ADDR = 12 TILES OVER  
       .DB $08 						                                            ; SET DATA LENGTH = 8  
       .DB "ATTEMPTS" 					                                        ;
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $03 						                                            ; SET DATA LENGTH = 3
       .DB $C8,$C9,$CA					                                        ; TILES FOR UNDERLINE ATT
       .DB $FF						                                            ; END OF DATA
	   
PASS_COMP_LEADER_LABEL_DATA:							                                            ; PASSING COMPLETIONS LABELS
	.DB $EA 						                                            ; SET PPU ADDR = 10 TILES OVER  
       .DB $0B 						                                            ; SET DATA LENGTH = 11  
       .DB "COMPLETIONS" 				                                        ;
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $03 						                                            ; SET DATA LENGTH = 3
       .DB $CB, $CC, $CD					                                    ; TILES FOR UNDERLINE ATT
       .DB $FF						                                            ; END OF DATA
	   
PASS_YARDS_LEADER_LABEL_DATA:							                        ; PASSING YARDS LABELS
	.DB $ED 						                                            ; SET PPU ADDR = 13 TILES OVER  
       .DB $05 						                                            ; SET DATA LENGTH = 5  
       .DB "YARDS" 					                                            ;
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $04 						                                            ; SET DATA LENGTH = 4
       .DB $C6,$CF,$D0,$D1				                                        ; TILES FOR UNDERLINE YDS
       .DB $FF						                                            ; END OF DATA
	   
PASS_YPA_LEADER_LABEL_DATA:							                            ; PASSING YARDS PER ATT LABELS
	.DB $E7 						                                            ; SET PPU ADDR = 13 TILES OVER  
       .DB $11 						                                            ; SET DATA LENGTH = 17  
       .DB "YARDS PER ATTEMPT" 			                                        ;
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $05 						                                            ; SET DATA LENGTH = 5
       .DB $D2,$D3,$D4,$D0,$D1				                                    ; TILES FOR UNDERLINE AVG YDS
       .DB $FF						                                            ; END OF DATA
	   
PASS_TD_LEADER_LABEL_DATA:							                                            ; PASSING YARDS PER ATT LABELS
	.DB $E8 						                                            ; SET PPU ADDR = 8 TILES OVER  
       .DB $10 						                                            ; SET DATA LENGTH = 16  
       .DB "TOUCHDOWN PASSES" 				                                    ;
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $02 						                                            ; SET DATA LENGTH = 4
       .DB $D6,$D7						                                        ; TILES FOR UNDERLINE TDS
       .DB $FF						                                            ; END OF DATA
	   
INT_PCT_LEADER_LABEL_DATA:							                                            ; INT PERCENTAGE LABELS
       .DB $1F 						                                            ; SET DATA LENGTH = 31 TILES  
       .DB " LOWEST INTERCEPTION PERCENTAGE" 	                                ;
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $02 						                                            ; SET DATA LENGTH = 4
       .DB $D8,$D9						                                        ; TILES FOR UNDERLINE INT%
       .DB $FF						                                            ; END OF DATA

RECEIVING_LEADERS_STAT_LABELS_DATA:							                ; RECEIVING LEADERS MAIN SCREEN LABELS
	.DB $08						                                                ; SET LENGTH = 8 TILES
	.DB $EE,$EF						                                            ; TILES FOR UNDERLINE "NO."
	.DB $00						                                                ; SPACE
	.DB $C6,$CF,$D0,$D1				                                            ; TILES FOR UNDERLINE "_YDS."
	.DB $00						                                                ; SPACE
	.DB $07						                                                ; SET LENGTH
	.DB $C6,$D2,$D3,$D5				                                            ; TILES FOR UNDERLINE "_AVG."
	.DB $00						                                                ; SPACE
	.DB $D6,$D7						                                            ; TILES FOR UNDERLINE "TD."
	.DB $FF						                                                ; END OF DATA

SINGLE_STAT_REC_LEADER_LABEL_ADDR_TABLE:
	.WORD REC_YARDS_LEADER_LABEL_DATA					                                            ; RECEIVING YARDS LABELS
    .WORD REC_YPREC_LEADER_LABEL_DATA					                                       	 	; RECEIVING YARDS/REC LABELS
    .WORD REC_TD_LEADER_LABEL_DATA					                                       	 ; RECEIVING TDS LABELS
       
REC_YARDS_LEADER_LABEL_DATA:							                                            ; RECEIVING YARDS LABELS
       .DB $ED 						                                            ; SET PPU ADDR = 13 TILES OVER  
       .DB $05						                                            ; SET DATA LENGTH = 5 TILES  
       .DB "YARDS" 					                                            ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
       .DB $04 						                                            ; SET DATA LENGTH = 54
       .DB $C6,$CF,$D0,$D1				                                        ; TILES FOR UNDERLINE "_YDS"
       .DB $FF						                                            ; END OF DATA

REC_YPREC_LEADER_LABEL_DATA:							                                            ; RECEIVING YARDS/REC LABELS
       .DB $E6 						                                            ; SET PPU ADDR = 6 TILES OVER  
       .DB $13						                                            ; SET DATA LENGTH = 19 TILES  
       .DB "YARDS PER RECEPTION" 			                                    ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
       .DB $04 						                                            ; SET DATA LENGTH = 4
       .DB $C6,$D2,$D3,$D5				                                        ; TILES FOR UNDERLINE "_AVG."
       .DB $FF						                                            ; END OF DATA
       		
REC_TD_LEADER_LABEL_DATA:							                                            ; RECEIVING TDS LABELS
       .DB $EB 						                                            ; SET PPU ADDR = 11 TILES OVER  
       .DB $0A						                                            ; SET DATA LENGTH = 10 TILES  
       .DB "TOUCHDOWNS" 					                                    ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
       .DB $02 						                                            ; SET DATA LENGTH = 4
       .DB $D6,$D7						                                        ; TILES FOR UNDERLINE "TD."
       .DB $FF						                                            ; END OF DATA

REC_LEADERS_ATTR_DATA_TABLE:							                        ; RECEIVING LEADERS ATRRIBUTE TABLE DATA
	.DB $E3						                                                ; CURR PPU ADDR + 2
    .DB $02,$F0,$05					                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                            ; CURR PPU ADDR + 2
    .DB $02,$F0,$05					                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                            ; CURR PPU ADDR + 2
    .DB $02,$F0,$05					                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                            ; CURR PPU ADDR + 2
    .DB $02,$F0,$05					                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                            ; CURR PPU ADDR + 2
    .DB $02,$F0,$05					                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                            ; CURR PPU ADDR + 2
     .DB $02,$F0,$05					                                        ; DATA LENGTH + ATRRIB DATA
	.DB $FF						                                                ; END OF DATA

RUSHING_LEADERS_STAT_LABELS_DATA:							                                            ; RUSHING LEADERS COLUMN NAMES DATA
	.DB $08						                                                ; SET LENGTH = 8 TILES
	.DB $C8,$C9,$CA					                                            ; TILES FOR UNDERLINE "ATT"
	.DB $00						                                                ; SPACE
	.DB $C6,$CF,$D0,$D1				                                            ; TILES FOR UNDERLINE "_YDS."
	.DB $08						                                                ; SET LENGTH 
	.DB $00						                                                ; SPACE
	.DB $C6,$D2,$D3,$D5				                                            ; TILES FOR UNDERLINE "_AVG."
	.DB $00						                                                ; SPACE
	.DB $D6,$D7						                                            ; TILES FOR UNDERLINE "TD."
	.DB $FF						                                                ; END OF DATA

SINGLE_STAT_RUSH_LEADER_LABEL_ADDR_TABLE:							                                            ; RUSHING LEADERS INDIVIDIUAL SCREENS LABEL POINTERS
	.WORD RUSH_ATT_LEADER_LABEL_DATA 					                                        ; RUSHING ATTEMPTS LABELS
	.WORD RUSH_YPA_LEADER_LABEL_DATA 					                                        ; RUSHING YARDS/ATT LABELS
	.WORD RUSH_TD_LEADER_LABEL_DATA					                                            ; RUSHING TDS LABELS


RUSH_ATT_LEADER_LABEL_DATA:							                            ; RUSHING ATTEMPTS LABELS (COULD BE REFACTORED SAME AS ATTEMPTS PASSING)
       .DB $EC 						                                            ; SET PPU ADDR = 12 TILES OVER  
       .DB $08 						                                            ; SET DATA LENGTH = 8  
       .DB "ATTEMPTS" 					                                        ;
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $03 						                                            ; SET DATA LENGTH = 3
       .DB $C8,$C9,$CA					                                        ; TILES FOR UNDERLINE ATT
       .DB $FF						                                            ; END OF DATA

RUSH_YPA_LEADER_LABEL_DATA:							                            ; RUSHING YARDS/ATT LABELS
		.DB $E7 						                                        ; SET PPU ADDR = 7 TILES OVER  
       .DB $11 						                                            ; SET DATA LENGTH = 17  
       .DB "YARDS PER ATTEMPT" 			                                        ;
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $04 						                                            ; SET DATA LENGTH = 4
       .DB $C6,$D2,$D3,$D5				                                        ; TILES FOR UNDERLINE "_AVG."
       .DB $FF						                                            ; END OF DATA

RUSH_TD_LEADER_LABEL_DATA:							                                            ; RUSHING TDS LABELS (COULD BE REFACTORED SAME AS RECEIVING)
       .DB $EB 						                                            ; SET PPU ADDR = 11 TILES OVER  
       .DB $0A						                                            ; SET DATA LENGTH = 10 TILES  
       .DB "TOUCHDOWNS" 					                                    ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
       .DB $02 						                                            ; SET DATA LENGTH = 4
       .DB $D6,$D7						                                        ; TILES FOR UNDERLINE "TD."
       .DB $FF						                                            ; END OF DATA



RUSH_LEADERS_ATTR_DATA_TABLE:							                        ; RUSHING LEADERS ATRRIBUTE TABLE DATA
	.DB $E4						                                                ; CURR PPU ADDR + 2
    .DB $02,$FA,$30					                                            ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                                ; CURR PPU ADDR + 2
    .DB $02,$FA,$30					                                            ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                                ; CURR PPU ADDR + 2
    .DB $02,$FA,$30					                                            ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                                ; CURR PPU ADDR + 2
    .DB $02,$FA,$30					                                            ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                                ; CURR PPU ADDR + 2
    .DB $02,$FA,$30					                                            ; DATA LENGTH + ATRRIB DATA
    .DB $E6						                                                ; CURR PPU ADDR + 2
    .DB $02,$FA,$30					                                            ; DATA LENGTH + ATRRIB DATA
	.DB $FF						                                                ; END OF DATA

SCORING_LEADERS_STAT_LABELS_DATA:							                                            ; SCORING LEADERS RATING SCREEN COLUMN NAMES DATA
	.DB $09						                                                ; SET DATA LENGTH = 9
	.DB $D6,$D7						                                            ; "TD" UNDERLINE TILE IDS
	.DB $00						                                                ; BLANK TILE
	.DB $DE,$DF,$C8,$C9,$CA				                                        ; "XP/ATT" UNDERLINE TILE IDS
	.DB $00						                                                ; BLANK TILE
	.DB $09						                                                ; SET DATA LENGTH = 9
	.DB $E0,$E1,$C8,$C9,$CA				                                        ; "FG/ATT" UNDERLINE TILE IDS 
	.DB $00						                                                ; BLANK TILE
	.DB $E6,$E7,$E8					                                            ; "PTS" UNDERLINE TILE IDS
       .DB $A1						                                            ; MOVE DOWN ONE ROW
	.DB $92,$00						                                            ; FILL WITH 18 BLANK TILES	 
	.DB $FF						                                                ; END OF DATA

SINGLE_STAT_SCORING_LEADER_LABEL_ADDR_TABLE:							                                            ; SCORING LEADERS INDIVIDIUAL SCREENS LABEL POINTERS
	.WORD TOUCHDOWN_LEADERS_LABEL_DATA					                        ; SCORING LEADERS TOUCHDOWN LABELS
    .WORD EXTRA_PT_LEADERS_LABEL_DATA 				                            ; EXTRA POINTS LEADERS LABELS
    .WORD FIELD_GOAL_LEADERS_LABEL_DATA 				                        ; FG LEADERS LABELS
    .WORD FIELD_GOAL_ATT_LEADERS_LABEL_DATA					                    ; FG ATTEMPT LEADERS LABELS

TOUCHDOWN_LEADERS_LABEL_DATA:							                        ; SCORING LEADERS TOUCHDOWN LABELS
    .DB $EB							                                            ; SET PPU ADDR = 11 TILES OVER  
	.DB $0A							                                            ; SET DATA LENTH = 10 TILES
	.DB "TOUCHDOWNS"				                                            ; 
    .DB $A2							                                            ; SET PPU ADDR = DOWN 2 ROWS 
    .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
    .DB $02							                                            ; SET DATA LENGTH = 2 
    .DB $D6,$D7 					                                            ; TILES FOR UNDERLINE "TD" 
	.DB $FF							                                            ; END OF DATA

EXTRA_PT_LEADERS_LABEL_DATA:							                        ; EXTRA POINTS LEADERS
    .DB $EA						                                                ; SET PPU ADDR = 10 TILES OVER  
	.DB $0C							                                            ; SET DATA LENTH = 12 TILES
	.DB "EXTRA POINTS"				                                            ; 
    .DB $A2						                                                ; SET PPU ADDR = DOWN 2 ROWS 
    .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
    .DB $02						                                                ; SET DATA LENGTH = 2 
    .DB $E2,$E3 					                                            ; TILES FOR UNDERLINE "XP." 
	.DB $FF						                                                ; END OF DATA

FIELD_GOAL_LEADERS_LABEL_DATA:							                        ; FG LEADERS LABELS
       .DB $EA						                                            ; SET PPU ADDR = 11 TILES OVER  
	.DB $0B						                                                ; SET DATA LENTH = 10 TILES
	.DB "FIELD GOALS"					                                        ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $02						                                            ; SET DATA LENGTH = 2 
       .DB $E4,$E5 					                                            ; TILES FOR UNDERLINE "FG." 
	.DB $FF						                                                ; END OF DATA

FIELD_GOAL_ATT_LEADERS_LABEL_DATA:							                    ; FG ATTEMPT LEADERS LABELS UNUSED SCREEN
       .DB $E7						                                            ; SET PPU ADDR = 7 TILES OVER  
	.DB $13						                                                ; SET DATA LENTH = 19 TILES
	.DB "FIELD GOAL ATTEMPTS"			                                        ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F5 						                                            ; SET PPU ADDR = 21 TILES OVER  
       .DB $03						                                            ; SET DATA LENGTH = 2 
       .DB $C8,$C9,$CA 					                                        ; TILES FOR UNDERLINE "ATT." 
	.DB $FF						                                                ; END OF DATA


SCORING_LEADERS_ATTR_DATA_TABLE:							                    ; SCORING LEADERS ATRRIBUTE TABLE DATA
	.DB $E4						                                                ; CURR PPU ADDR + 4 
       .DB $04,$0A,$00,$C0,$30				                                    ; DATA LENGTH + ATRRIB DATA 
       .DB $E4						                                            ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$CC,$33				                                    ; DATA LENGTH + ATRRIB DATA
       .DB $E4						                                            ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$CC,$33				                                    ; DATA LENGTH + ATRRIB DATA
       .DB $E4						                                            ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$CC,$33				                                    ; DATA LENGTH + ATRRIB DATA
	.DB $E4						                                                ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$CC,$33				                                    ; DATA LENGTH + ATRRIB DATA
       .DB $E4						                                            ; CURR PPU ADDR + 4
.DB $04,$0A,$00,$CC,$33				                                            ; DATA LENGTH + ATRRIB DATA
	.DB $FF						                                                ; END OF DATA

PUNTING_LEADERS_STAT_LABEL_DATA:							                    ; PUNTING LEADERS COLUMN NAMES DATA
    .DB $08						                                                ; SET LENGTH = 8 TILES
	.DB $EE,$EF						                                            ; TILES FOR UNDERLINE "NO."
	.DB $00						                                                ; SPACE
	.DB $C6,$CF,$D0,$D1				                                            ; TILES FOR UNDERLINE "_YDS."
	.DB $00						                                                ; SPACE
	.DB $04						                                                ; SET LENGTH
	.DB $C6,$D2,$D3,$D5				                                            ; TILES FOR UNDERLINE "_AVG."
	.DB $FF						                                                ; END OF DATA

TOTAL_PUNTS_LEADERS_STAT_LABEL_DATA:							                ; PUNTING LEADERS INDIVIDIUAL SCREEN LABELS
       .DB $ED 						                                            ; SET PPU ADDR = 13 TILES OVER  
       .DB $05						                                            ; SET DATA LENGTH = 5 TILES  
       .DB "PUNTS" 					                                            ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
       .DB $02 						                                            ; SET DATA LENGTH = 54
       .DB $EE,$EF						                                        ; TILES FOR UNDERLINE "NO."
       .DB $FF						                                            ; END OF DATA
	
PUNTING_LEADERS_ATTR_TABLE_DATA:							                    ; PUNTING LEADERS ATRRIBUTE TABLE DATA
       .DB $E4						                                            ; CURR PPU ADDR + 4 
       .DB $04,$0A,$00,$F0,$30				                                    ; DATA LENGTH + ATRRIB DATA 
       .DB $E4						                                            ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$FF,$33				                                    ; DATA LENGTH + ATRRIB DATA
       .DB $E4						                                            ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$FF,$33				                                    ; DATA LENGTH + ATRRIB DATA
       .DB $E4						                                            ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$FF,$33				                                    ; DATA LENGTH + ATRRIB DATA
	.DB $E4						                                                ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$FF,$33				                                    ; DATA LENGTH + ATRRIB DATA
       .DB $E4						                                            ; CURR PPU ADDR + 4
       .DB $04,$0A,$00,$FF,$33				                                    ; DATA LENGTH + ATRRIB DATA
	.DB $FF						                                                ; END OF DATA

INT_LEADERS_STAT_LABELS_DATA:							                        ; INTERCETPION LEADERS COLUMN NAMES DATA
	.DB $07						                                                ; SET LENGTH = 7 TILES
	.DB $EE,$EF						                                            ; TILES FOR UNDERLINE "NO."
	.DB $00						                                                ; SPACE
	.DB $CF,$D0,$D1					                                            ; TILES FOR UNDERLINE "YDS"
	.DB $00						                                                ; SPACE
	.DB $07						                                                ; SET LENGTH = 7 TILES
	.DB $C6,$D2,$D3,$D5				                                            ; TILES FOR UNDERLINE "_AVG."
	.DB $00						                                                ; SPACE
	.DB $D6,$D7						                                            ; TILES FOR UNDERLINE "TD."
	.DB $FF						                                                ; END OF DATA

SINGLE_STAT_INT_LEADER_LABEL_ADDR_TABLE:							            ;	INTERCEPTION LEADERS INDIVIDIUAL SCREENS LABEL POINTERS
	.WORD INT_YARDS_LEADER_STAT_LABELS_DATA					                                            ; INTERCEPTION YARDS LEADERS LABELS
    .WORD INT_TDS_LEADER_STAT_LABELS_DATA					                                            ; INTERCEPTION TOUCHDOWN LEADERS LABELS
       
INT_YARDS_LEADER_STAT_LABELS_DATA:							                                            ; INTERCEPTION YARDS LEADERS LABELS DUPLICATE COULD BE REFACTORED
       .DB $ED 						                                            ; SET PPU ADDR = 13 TILES OVER  
       .DB $05						                                            ; SET DATA LENGTH = 5 TILES  
       .DB "YARDS" 					                                            ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
       .DB $04 						                                            ; SET DATA LENGTH = 54
       .DB $C6,$CF,$D0,$D1				                                        ; TILES FOR UNDERLINE "_YDS"
       .DB $FF						                                            ; END OF DATA
	   
INT_TDS_LEADER_STAT_LABELS_DATA:							                                            ; INTERCEPTION TOUCHDOWN LEADERS LABELS DUPLICATE COULD BE REFACTORED
       .DB $EB						                                            ; SET PPU ADDR = 11 TILES OVER  
	.DB $0A						                                                ; SET DATA LENTH = 10 TILES
	.DB "TOUCHDOWNS"					                                        ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  
       .DB $02						                                            ; SET DATA LENGTH = 2 
       .DB $D6,$D7 					                                            ; TILES FOR UNDERLINE "TD" 
	.DB $FF						                                                ; END OF DATA

INT_LEADERS_ATTR_TABLE_DATA:							                        ; INTERECEPTION LEADERS ATRRIBUTE TABLE DATA
       .DB $E4						                                            ; CURR PPU ADDR + 4 
       .DB $01,$3A						                                        ; DATA LENGTH + ATRRIB DATA 
       .DB $E7						                                            ; CURR PPU ADDR + 7
       .DB $01,$3A						                                        ; DATA LENGTH + ATRRIB DATA 
       .DB $E7						                                            ; CURR PPU ADDR + 7
       .DB $01,$3A						                                        ; DATA LENGTH + ATRRIB DATA 
       .DB $E7						                                            ; CURR PPU ADDR + 7
       .DB $01,$3A						                                        ; DATA LENGTH + ATRRIB DATA 
       .DB $E7						                                            ; CURR PPU ADDR + 7
       .DB $01,$3A						                                        ; DATA LENGTH + ATRRIB DATA 
       .DB $E7						                                            ; CURR PPU ADDR + 7
       .DB $01,$3A						                                        ; DATA LENGTH + ATRRIB DATA 
	.DB $FF						                                                ; END OF DATA

SACK_LEADERS_STAT_LABELS_DATA:							                        ; SACKS LEADERS COLUMN NAMES DATA
	.DB $04						                                                ; SET DATA LENGTH = 4 TILES
	.DB $E9,$EA,$EB,$EC				                                            ; TILES FOR UNDERLINE "SACKS"
	.DB $FF						                                                ; END OF DATA


KICK_RETURN_LEADERS_STAT_LABELS_DATA								            ; **** DUPLICATE OF RECEIVING COULD BE REFACTORED
PUNT_RETURN_LEADERS_STAT_LABELS_DATA:							                ; PUNT AND KICK RETURN LEADERS COLUMN NAMES DATA 
     .DB $08						                                            ; SET LENGTH = 8 TILES
	.DB $EE,$EF						                                            ; TILES FOR UNDERLINE "NO."
	.DB $00						                                                ; SPACE
	.DB $C6,$CF,$D0,$D1				                                            ; TILES FOR UNDERLINE "_YDS."
	.DB $00						                                                ; SPACE
	.DB $07						                                                ; SET LENGTH
	.DB $C6,$D2,$D3,$D5				                                            ; TILES FOR UNDERLINE "_AVG."
	.DB $00						                                                ; SPACE
	.DB $D6,$D7						                                            ; TILES FOR UNDERLINE "TD."
	.DB $FF						                                                ; END OF DATA

SINGLE_STAT_KR_PR_LEADER_LABEL_ADDR_TABLE:							            ; PR AND KR LEADERS INDIVIDIUAL SCREENS LABEL POINTERS
	.WORD KR_PR_YARDS_LEADER_STAT_LABELS_DATA 					                ; PR AND KR YARDS LEADERS LABELS
    .WORD KR_PR_RETURNS_LEADER_STAT_LABELS_DATA					               ; PR AND KR RETURNS LEADERS LABELS
    .WORD KR_PR_TDS_LEADER_STAT_LABELS_DATA				                                       	 	; PR AND KR TOUCHDOWN LEADERS LABELS
       
       							                                                ; MULTIPLE YARDS SCREEN LABELS COULD BE REFACTORED
KR_PR_YARDS_LEADER_STAT_LABELS_DATA:							                                            ; PR AND KR YARDS LEADERS LABELS
       .DB $ED 						                                            ; SET PPU ADDR = 13 TILES OVER  
       .DB $05						                                            ; SET DATA LENGTH = 5 TILES  
       .DB "YARDS" 					                                            ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
       .DB $04 						                                            ; SET DATA LENGTH = 54
       .DB $C6,$CF,$D0,$D1				                                        ; TILES FOR UNDERLINE "_YDS"
       .DB $FF						                                            ; END OF DATA

KR_PR_RETURNS_LEADER_STAT_LABELS_DATA:							                                            ; PR AND KR RETURNS LEADERS LABELS
       .DB $EC 						                                            ; SET PPU ADDR = 13 TILES OVER  
       .DB $07						                                            ; SET DATA LENGTH = 5 TILES  
       .DB "RETURNS" 					                                        ; 
       .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
       .DB $F7 						                                            ; SET PPU ADDR = 21 TILES OVER  	 
       .DB $02 						                                            ; SET DATA LENGTH = 2
       .DB $EE,$EF						                                        ; TILES FOR UNDERLINE "NO."
       .DB $FF						                                            ; END OF DATA

								                                                ;
KR_PR_TDS_LEADER_STAT_LABELS_DATA:							                    ; PR AND KR TOUCHDOWN LEADERS LABELS
    .DB $EB 						                                            ; SET PPU ADDR = 11 TILES OVER  
    .DB $0A						                                            ; SET DATA LENGTH = 10 TILES  
    .DB "TOUCHDOWNS" 					                                    ; 
    .DB $A2						                                            ; SET PPU ADDR = DOWN 2 ROWS 
	.DB $F6 						                                            ; SET PPU ADDR = 22 TILES OVER  	 
    .DB $02 						                                            ; SET DATA LENGTH = 4
    .DB $D6,$D7						                                        ; TILES FOR UNDERLINE "TD."
    .DB $FF						                                            ; END OF DATA


PUNT_RETURN_LEADERS_ATTR_TABLE_DATA:
KICK_RETURN_LEADERS_ATTR_TABLE_DATA:							                ; KICKOFF AND PUNT RETURN LEADERS ATRRIBUTE TABLE DATA
    .DB $E4						                                            ; CURR PPU ADDR + 4 
    .DB $03,$0A,$C0,$F0				                                        ; DATA LENGTH + ATRRIB DATA 
    .DB $E5						                                            ; CURR PPU ADDR + 5
    .DB $03,$0A,$CC,$FF				                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E5						                                            ; CURR PPU ADDR + 5
    .DB $03,$0A,$CC,$FF				                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E5						                                            ; CURR PPU ADDR + 5
    .DB $03,$0A,$CC,$FF				                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E5						                                            ; CURR PPU ADDR + 5
    .DB $03,$0A,$CC,$FF				                                        ; DATA LENGTH + ATRRIB DATA
    .DB $E5						                                            ; CURR PPU ADDR + 5
    .DB $03,$0A,$CC,$FF				                                        ; DATA LENGTH + ATRRIB DATA
	.DB $FF						                                                ; END OF DATA

								                                                ; HIGHLIGHTS TEAM NAMES LIGHT BLUE
BLUE_TEAM_TEXT_LEADERS_ATT_TABLE_DATA:							                                            ; ATTRIBUTE TABLE TO SET TEAM NAMES LIGHT BLUE 
	.DB $10						                                                ; SET DATA LENGTH = 16 BYTES
    .DB $00,$00,$00,$00,$50,$00,$00,$00		                                ; ATTRIBUTE TABLE DATA
    .DB $00,$00,$00,$00,$55,$00,$00,$00		                                ;
    .DB $10 						                                            ; SET DATA LENGTH = 16 BYTES
    .DB $00,$00,$00,$00,$55,$00,$00,$00		                                ; ATTRIBUTE TABLE DATA
    .DB $00,$00,$00,$00,$55,$00,$00,$00		                                ;
    .DB $10						                                            ; SET DATA LENGTH = 16 BYTES
    .DB $00,$00,$00,$00,$55,$00,$00,$00		                                ; ATTRIBUTE TABLE DATA
    .DB $00,$00,$00,$00,$55,$00,$00,$00		                                ;
	.DB $FF						                                            ; END OF DATA
	
GREY_TEAM_TEXT_LEADERS_ATT_TABLE_DATA:							            ; ATTRIBUTE TABLE TO SET TEAM NAMES LIGHT GREY
	.DB $10						                                            ; SET DATA LENGTH = 16 BYTES
    .DB $00,$00,$00,$00,$A0,$00,$00,$00		                                ; ATTRIBUTE TABLE DATA
    .DB $00,$00,$00,$00,$AA,$00,$00,$00		                                ;
    .DB $10 						                                        ; SET DATA LENGTH = 16 BYTES
    .DB $00,$00,$00,$00,$AA,$00,$00,$00		                                ; ATTRIBUTE TABLE DATA
    .DB $00,$00,$00,$00,$AA,$00,$00,$00		                                ;
    .DB $10						                                            ; SET DATA LENGTH = 16 BYTES
    .DB $00,$00,$00,$00,$AA,$00,$00,$00		                                ; ATTRIBUTE TABLE DATA
    .DB $00,$00,$00,$00,$AA,$00,$00,$00		                                ;
	.DB $FF						                                            ; END OF DATA
	
_F}_LEADERS_STAT_LABELS_DATA	

_F{_GET_LEADERS_SORTING_FUNCTION												

sorting_func_addr		= LOCAL_7
SORT_INFO_MEMORY[]		= SEGMENT_VAR_8E

SORT_STATS_LEADERS[stat]:							                            ; GET AND SORT STATS (A= STAT TO SORT ON)
	STA STAT_TO_SORT_ON							                                ; SAVE STAT SORTING FUNCTION INDEX
	LDA SAVE_FIRST_TEAM_TO_CHECK						                        ; SET CURRENT TEAM = FIRST TEAM
	STA CURRENT_TEAM						                                    ;
	LDA SAVE_NUM_TEAMS_TO_CHECK						                            ; SET NUMBER OF TEAMS =  NUMBER OF TEAMS LEFT TO CHECK 
	STA NUM_OF_TEAMS_LEFT_TO_CHECK						                        ;
	JMP @clear_ranking_memory						                             ; *** NO NEED FOR JUMP

@clear_ranking_memory:
	JSR CLEAR_RANK_ARRAY_SET_RANK_INDEXES_TO_NOT_RANKED					        ; CLEAR RANKING MEMORY AND SET RANKING INDEXES = NOT RANKED()
	

@copy_ranking_table_info_to_memory:	
	LDA STAT_TO_SORT_ON						                                    ; LOAD STAT SORTING FUNCTION INDEX
	ASL							                                                ; SHIFT FOR INDEX INTO PLAYER RANGE AND STAT TYPE TABLE
	ASL							                                                ;
	TAX							                                                ; 
	
	LDY #$00						                                            ; SET DATA INDEX = 0 
_WHILE NOT_EQUAL							                                     ; LOAD PLAYER AND STAT INDEXES LOOP
	LDA PLAYER_RANGES_STAT_INDEXES_SORTING_TABLE,X					            ; GET PLAYER RANGES AND STAT INDEXES FROM PLAYER RANGES AND STAT INDEXES TABLE
	STA SORT_INFO_MEMORY[],Y						                            ; SAVE IN ($8E-$91)
	INX								                                            ;
	INY								                                            ;	
	CPY #$04						                                            ; DONE?

_END_WHILE						                                            ; NO->LOAD PLAYER AND STAT INDEXES LOOP
	
	
	LDA #>@exit					                                                ; SAVE RETURN ADDRESS
	PHA							                                                ;
	LDA #<@exit-1					                                            ;
	PHA							                                                ;
	LDA STAT_TO_SORT_ON						                                    ; LOAD STAT SORTING FUNCTION INDEX
	ASL							                                                ; SHIFT FOR INDEX INTO STAT CALCULATING AND SORTING POINTER TABLE 
	TAX							                                                ;
	LDA STAT_SORT_ADDR_TABLE,X					                                ; SAVE IN TEMP ADDR
	STA sorting_func_addr						                                ;
	LDA STAT_SORT_ADDR_TABLE+1,X					                            ;
	STA sorting_func_addr + 1						                            ;
	JMP (sorting_func_addr)						                                ; JUMP-> STAT CALCULATING AND SORTING ADDR

@exit:
	RTS							                                                ; RETURN
	

STAT_SORT_ADDR_TABLE:							                                                ; STAT CALCULATING AND SORTING POINTER TABLE
	.WORD CALCULATE_AND_SORT_QB_RATING					                        ; 0X00 QB RATING SORT  
	.WORD CALCULATE_AND_SORT_COMP_OR_INT_PCT 					                ; 0X01 QB COMP% SORT  
    .WORD GET_AND_SORT_LEADER_STAT 					                            ; 0X02 QB ATT SORT  
	.WORD GET_AND_SORT_LEADER_STAT 					                            ; 0X03 QB COMP SORT  
    .WORD GET_AND_SORT_LEADER_STAT 					                            ; 0X04 QB YARDS SORT  
    .WORD CALCULATE_AND_SORT_ON_YARDAGE_AVG 					                ; 0X05 QB YARDS/ATT SORT  
    .WORD GET_AND_SORT_LEADER_STAT 					                            ; 0X06 QB TDS SORT  
    .WORD CALCULATE_AND_SORT_COMP_OR_INT_PCT 					                ; 0X07 QB INT% SORT  
       
    .WORD GET_AND_SORT_LEADER_STAT					                            ; 0X08 RECEPTIONS SORT
	.WORD GET_AND_SORT_LEADER_STAT 					                            ; 0X09 RECEIVING YARDS SORT
    .WORD CALCULATE_AND_SORT_ON_YARDAGE_AVG					                    ; 0X0A YARDS/REC SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                             ; 0X0B RECEIVING TDS SORT
       
    .WORD GET_AND_SORT_LEADER_RUSHING_STAT					                                            ; 0X0C RUSHING YARDS SORT  
    .WORD GET_AND_SORT_LEADER_RUSHING_STAT 					                                        ; 0X0D RUSHING ATT SORT  
    .WORD CALCULATE_AND_SORT_ON_RUSH_AVG 					                    ; 0X0E RUSHING YARDS/ATT SORT  
    .WORD GET_AND_SORT_LEADER_RUSHING_STAT					                                            ; 0X0F RUSHING TDS SORT
        
    .WORD CALCULATE_AND_SORT_ON_TOTAL_PTS 					                 ; 0X10 POINTS SORT
    .WORD CALCULATE_AND_SORT_ON_TOTAL_TD					                     ; 0X11 RUSH,REC,KR,PR TOTAL TD SORT
	.WORD GET_AND_SORT_LEADER_STAT 					                         ; 0X12 EXTRA PTS SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                         ; 0X13 FG SORT
       
    .WORD CALCULATE_AND_SORT_ON_YARDAGE_AVG 					                ; 0X14 PUNTING AVERAGE SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                                        ; 0X15 PUNTS SORT
       
    .WORD GET_AND_SORT_LEADER_STAT 					                                        ; 0X16 INTERCEPTIONS SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                                        ; 0X17 INTERCEPTION YARDS SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                                        ; 0X18 INTERCEPTION TDS SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                                        ; 0X19 INTERCEPTION TDS SORT
       
    .WORD CALCULATE_AND_SORT_ON_YARDAGE_AVG					                ; 0X1A PUNT RETURN AVERAGE SORT
	.WORD GET_AND_SORT_LEADER_STAT					                                        ; 0X1B PUNT RETURN YARDS SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                                        ; 0X1C PUNT RETURNS SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                                        ; 0X1D PUNT RETURN TDS SORT
       
    .WORD CALCULATE_AND_SORT_ON_YARDAGE_AVG 					                ; 0X1E KICK RETURN AVERAGE SORT
    .WORD GET_AND_SORT_LEADER_STAT 					                                        ; 0X1F KICK RETURN YARDS SORT
    .WORD GET_AND_SORT_LEADER_STAT					                                        ; 0X20 KICK RETURNS SORT
    .WORD GET_AND_SORT_LEADER_STAT					                                        ; 0X21 KICK RETURN TDS SORT

PLAYER_RANGES_STAT_INDEXES_SORTING_TABLE:							            ; PLAYER RANGES AND STAT INDEXES TABLE
								                                                ; Stored into (8E,8F,90,91) FF= N/A DON'T CARE
								                                                ; TEAM PLAYER ID START, PLAYER ID END+1, NUMERATOR STAT INDEX, DIVISOR STAT INDEX
		.DB $FF,$FF,$FF,$FF				                                        ; 0X00 N/A 
		.DB $00,$02,$01,$00				                                        ; 0X01 QB0,QB1+1, PASS COMPLETIONS, PASS ATTEMPTS
		.DB $00,$02,$00,$FF				                                        ; 0X02 QB0,QB1+1, PASS ATTEMPTS,N/A
		.DB $00,$02,$01,$FF				                                        ; 0X03 QB0,QB1+1, PASS COMPLETIONS,N/A
       .DB $00,$02,$04,$FF				                                        ; 0X04 QB0,QB1+1, PASS YARDS,N/A
       .DB $00,$02,$04,$00				                                        ; 0X05 QB0,QB1+1, PASS YARDS, PASS ATTEMPTS
       .DB $00,$02,$02,$FF				                                        ; 0X06 QB0,QB1+1, PASS TDS,N/A
       .DB $00,$02,$03,$00				                                        ; 0X07 QB0,QB1+1, PASS INTS, PASS ATTEMPTS
       
       							                                                ; RECEPTION LEADERS PLAYER RANGES AND STAT INDEXES
       .DB $02,$0C,$08,$FF				                                        ; 0X08 RB1,TE2+1, RECEPTIONS, N/A
       .DB $02,$0C,$09,$FF				                                        ; 0X09 RB1,TE2+1, RECEPTION YARDS , N/A
       .DB $02,$0C,$09,$08				                                        ; 0X0A RB1,TE2+1, RECEPTION YARDS, RECEPTIONS
       .DB $02,$0C,$0A,$FF				                                        ; 0X0B RB1,TE2+1, RECEPTION TDS, N/A
       							
       							                                                ; RUSHING LEADERS PLAYER RANGES AND STAT INDEXES
       .DB $FF,$FF,$06,$12				                                        ; 0X0C ALL PLAYERS, QB RUSHING YARDS, SKILL PLAYER RUSHING YARDS
       .DB $FF,$FF,$05,$11				                                        ; 0X0D ALL PLAYERS, QB RUSHING ATT , SKILL PLAYER RUSHING ATT
       .DB $FF,$FF,$FF,$FF				                                        ; 0X0E N/A
       .DB $FF,$FF,$07,$13				                                        ; 0X0F ALL PLAYERS, QB RUSHING TD , SKILL PLAYER RUSHING TD
       
       							                                                ; SCORING LEADERS PLAYER RANGES AND STAT INDEXES
       .DB $FF,$FF,$FF,$FF				                                        ; 0X10 N/A
       .DB $FF,$FF,$FF,$FF				                                        ; 0X11 N/A
       .DB $1C,$1D,$19,$FF				                                        ; 0X12 KICKER,KICKER+1,XP MADE, N/A
       .DB $1C,$1D,$1B,$FF				                                        ; 0X13 KICKER,KICKER+1,FG MADE, N/A 
       
       							                                                ; PUNTING LEADERS PLAYER RANGES AND STAT INDEXES
       .DB $1D,$1E,$1D,$1C				                                        ; 0X14 PUNTER,PUNTER+1,PUNT YARDS, PUNTS
       .DB $1D,$1E,$1C,$FF				                                        ; 0X15 PUNTER,PUNTER+1,PUNTS, N/A
								
                                                                                ; INTERCEPTION LEADERS PLAYER RANGES AND STAT INDEXES
       .DB $11,$1C,$15,$FF				                                        ; 0X16 RE,SS+1,INTS,N/A
       .DB $11,$1C,$16,$FF				                                        ; 0X17 RE,SS+1,INT YARDS, NA
       .DB $11,$1C,$17,$FF				                                        ; 0X18 RE,SS+1,INT TDS, NA
       
                                                                                ; SACK LEADERS PLAYER RANGES AND STAT INDEXES
       .DB $11,$1C,$14,$FF				                                        ; 0X19 RE,KICKER,SACKS, N/a
       
                                                                                ; PUNT RETURN LEADERS PLAYER RANGES AND STAT INDEXES
       .DB $02,$0C,$0F,$0E				                                        ; 0X1A RB1,TE2+1,PR YARDS, PR ATT	
       .DB $02,$0C,$0F,$FF				                                        ; 0X1B RB1,TE2+1,PR ATT, N/A
       .DB $02,$0C,$0E,$FF				                                        ; 0X1C RB1,TE2+1,PR YARDS, N/A
       .DB $02,$0C,$10,$FF				                                        ; 0X1D RB1,TE2+1,PR TDS, N/A
                                                                                ; KICK RETURN LEADERS PLAYER RANGES AND STAT INDEXES
       .DB $02,$0C,$0C,$0B				                                        ; 0X1A RB1,TE2+1,KR YARDS, PR ATT	
       .DB $02,$0C,$0C,$FF				                                        ; 0X1B RB1,TE2+1,KR ATT, N/A
       .DB $02,$0C,$0B,$FF				                                        ; 0X1C RB1,TE2+1,KR YARDS, N/A
       .DB $02,$0C,$0D,$FF				                                        ; 0X1D RB1,TE2+1,KR TDS, N/A

_F}_GET_LEADERS_SORTING_FUNCTION	

_F{_CALCULATE_AND_SORT_COMP_OR_INT_PCT										

CALCULATE_AND_SORT_COMP_OR_INT_PCT:							                    ; CALCULATE QB COMP%/INT%



_WHILE NOT_EQUAL

	LDA FIRST_ROSTER_ID					                                       ; SET CURRENT TEAM PLAYER ID = STARTING TEAM PLAYER ID
	STA CURRENT_ROSTER_ID						                                ;	

@check_stat_type:							                                    ; CHECK IF QB QUALIFIES AND CALCULATE VALUES
	
@check_comp_pct:	
	LDA STAT_TO_SORT_ON						                                    ; IS STAT INDEX = COMP%
	CMP #SORT_ON_COMP_PCT_INDEX						                            ;
	BEQ @check_qb_qualify						                                ; YES->CHECK IF QB QUALIFIES FOR RANKING

@check_int_pct:	
	LDA STAT_TO_SORT_ON						                                    ; IS STAT INDEX = INT%
	CMP #SORT_ON_INT_PCT_INDEX						                            ;
	BNE @calculate_and_sort						                                ; NO (SHOULD BE IMPOSSIBLE)  	

@check_qb_qualify:							                                    ; CHECK IF QB QUALIFIES FOR RANKING
	JSR CHECK_IF_QB_QUALIFIES_FOR_RANKING					                    ; CHECK IF QB QUALIFIES FOR RANKING ( MIN 7 ATT/GAME)
	BCS @go_to_next_player						                                            ; DOESN'T QUALIFY->SET TO NEXT PLAYER AND CHECK IF DONE

@calculate_and_sort:							                                                ; CALCULATE AND SORT VALUE
	JSR CALCULATE_PERCENTAGE_LEADERS					                        ; CALCULATE PERCENTAGE ($90= NUMERATOR STAT INDEX, $91 = DIVISOR STAT INDEX, 6E= TEAM, 9D= PLAYER)
    JSR SORT_STAT_VALUES					                                    ; SORT VALUES()

@go_to_next_player:							                                                ; SET TO NEXT PLAYER AND CHECK IF DONE		
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ;
	CMP LAST_ROSTER_ID						                                    ; IS CURRENT TEAM PLAYER ID < LAST PLAYER TO CHECK + 1
	BCC @check_stat_type						                                ; YES->CHECK IF QB QUALIFIES AND CALCULATE VALUES

@go_to_next_team_and_check_if_done: 	
	INC CURRENT_TEAM						                                    ; CURRENT TEAM++
	DEC NUM_OF_TEAMS_LEFT_TO_CHECK						                        ; TEAMS LEFT TO CHECK--

_END_WHILE
	JSR SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL					    ; CONVERT SORTED VALUES TO DECIMAL AND SET RANKING ORDINALS()
	RTS							                                                ; RETURN

_F}_CALCULATE_AND_SORT_COMP_OR_INT_PCT	
	
_F{_CALCULATE_PERCENTAGE_LEADERS												

divisor_attempts		= LOCAL_3
numerator_completions	= LOCAL_7

temp_mult				= LOCAL_6
attempts				= LOCAL_7
completions				= LOCAL_7
comp_times_100			= SEGMENT_VAR_93

CALCULATE_PERCENTAGE_LEADERS:							                        ; CALCULATE PERCENTAGE ($90= NUMERATOR STAT INDEX, $91 = DIVISOR STAT INDEX, 6E= TEAM, 9D= PLAYER)
	LDX FIRST_STAT_INDEX						                                ; LOAD NUMERATOR STAT INDEX
	LDA CURRENT_ROSTER_ID						                                ; LOAD CURRENT SEASON PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0

@check_for_zero_completions:	
	LDA completions + 1						                                    ; IS NUMERATOR LOW BYTE = ZERO? 
	BNE @calc_percentage						                                ;
	LDA completions						                                        ; IS NUMERATOR = ZERO?
	BNE @calc_percentage						                                ; NO->  CONTINUE CALCULATION
	
	JMP @exit						                                            ; YES-> NUMERATOR IS ZERO

@calc_percentage:							                                    ; CONTINUE CALCULATION
	LDY completions						                                        ; LOAD STAT VALUE
	LDX completions+1						                                    ;
	LDA #$64						                                            ; SET MULTIPLY AMOUNT = 100 
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45 
	LDA temp_mult + 1						                                    ; *** odd way to store SAVE NUMERATOR STAT VALUE $93,$94
	STA comp_times_100						                                    ;
	LDA temp_mult						                                        ;
	STA comp_times_100 +1 						                                

	LDX SECOND_STAT_INDEX						                                ; LOAD DIVISOR STAT INDEX
	LDA CURRENT_ROSTER_ID						                                ; LOAD PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA attempts						                                        ; TRANSFER DIVISOR STAT VALUE TO $40,$41
	STA divisor_attempts						                                ;
	LDA attempts +1						                                        ;
	STA divisor_attempts+1						                                ;
	LDA comp_times_100						                                    ; TRANSFER NUMERATOR STAT VALUE TO $44,$45
	STA numerator_completions +1						                        ;
	LDA comp_times_100 +1					                                    ;
	STA numerator_completions						                            ;
	JSR DIVIDE_16_BIT_FRACTIONAL						                        ; 3 BYTE( $43,$44,$45) DIVIDE BY 2 BYTE($40,$41)

@exit:							                                                ; NUMERATOR IS ZERO
	RTS							                                                ; RETURN
	
_F}_CALCULATE_PERCENTAGE_LEADERS

_F{_CALCULATE_AND_SORT_ON_YARDAGE_AVG											

CALCULATE_AND_SORT_ON_YARDAGE_AVG:							                    ; GET YARDAGE AVERAGE($9F = STAT TO SORT ON)




_WHILE NOT_EQUAL
	
	LDA FIRST_ROSTER_ID						                                    ; SET CURRENT SEASON PLAYER ID = STARTING SEASON PLAYER ID
	STA CURRENT_ROSTER_ID						                                ; 

@check_all_players_loop:							                            ; GET YARDAGE AVERAGE FOR PLAYERS ON TEAM LOOP
	
@check_for_punt_ret_avg:	
	LDA STAT_TO_SORT_ON						                                    ; DOES STAT TO SORT ON = YARDS PER PUNT RETURN
	CMP #SORT_ON_PUNT_RET_AVERAGE_INDEX						                    ;
	BEQ @check_player_qualifies_return_avg						                    ; YES->GET KR/PR STAT AVERAGE IF PLAYER QUALIFIES ELSE GO TO NEXT PLAYER

@check_for_kick_ret_avg:	
	LDA STAT_TO_SORT_ON						                                    ; DOES STAT TO SORT ON = YARDS PER PUNT RETURN
	CMP #SORT_ON_KICK_RET_AVERAGE_INDEX						                    ;
	BNE @check_yards_per_pass_attempt						                                            ; NO->CHECK FOR SORT ON YARDS PER PASS ATTEMPT

@check_player_qualifies_return_avg:							                    ; GET KR/PR STAT AVERAGE IF PLAYER QUALIFIES ELSE GO TO NEXT PLAYER 
	JSR CHECK_IF_PLAYER_QUALIFIES_FOR_KR_PR_AVG					                ; CHECK IF KR/PR PLAYER QUALIFIES (MIN 1 ATT PER 2 GAMES)
	BCS @go_to_next_player						                                ; QUALIFIES? NO->GO TO NEXT PLAYER AND CHECK IF DONE
	JMP @get_yards_per_att_and_sort						                        ; YES-> GET STAT AVERAGE AND SORT

@check_yards_per_pass_attempt:							                        ; CHECK FOR SORT ON YARDS PER PASS ATTEMPT
	LDA STAT_TO_SORT_ON						                                    ; DOES STAT TO SORT ON = YARDS PER PASS ATTEMPT
	CMP #SORT_ON_PASS_YARDS_PER_ATT_INDEX						                 ;
	BEQ @check_player_qualifies_qb_yards_att						             ; YES->CHECK IF QB QUALIFIES FOR YARDS PER PASS ATT
	
	LDA STAT_TO_SORT_ON						                                    ; DOES STAT TO SORT ON = YARDS PER RECPTION
	CMP #SORT_ON_YARDS_PER_REC_INDEX							                ;
	BNE @get_yards_per_att_and_sort						                         ; NO->GET STAT AVERAGE AND SORT
	
@check_player_qualifies_reception_avg:	
	JSR CHECK_IF_PLAYER_QUALIFIES_FOR_REC_AVG					                ;
	BCS @go_to_next_player						                                ; QUALIFIES? NO->GO TO NEXT PLAYER AND CHECK IF DONE
	JMP @get_yards_per_att_and_sort						                                            ; YES-> GET STAT AVERAGE AND SORT

@check_player_qualifies_qb_yards_att:							                ; CHECK IF QB QUALIFIES FOR YARDS PER PASS ATT
	JSR CHECK_IF_QB_QUALIFIES_FOR_RANKING					                    ; CHECK IF QB QUALIFIES FOR RANKING ( MIN 7 ATT/GAME)
	BCS @go_to_next_player

@get_yards_per_att_and_sort:							                                                ; GET STAT AVERAGE AND SORT
	JSR DIVIDE_YARDS_BY_ATTEMPTS					                            ; DIVIDE STATS ($90 = NUMERATOR STAT INDEX, 91 = DIVISOR STAT INDEX)
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()

@go_to_next_player:							                                                ; GO TO NEXT PLAYER AND CHECK IF DONE
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID < LAST PLAYER TO CHECK + 1
	CMP LAST_ROSTER_ID						                                                ; 
	BCC @check_all_players_loop						                                            ; YES->GET YARDAGE AVERAGE FOR PLAYERS ON TEAM LOOP
	
@go_to_next_team	
	INC CURRENT_TEAM						                                    ; CURRENT TEAM ++
	DEC NUM_OF_TEAMS_LEFT_TO_CHECK						                        ; TEAMS LEFT TO CHECK--

_END_WHILE 

	JSR SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL					    ; CONVERT SORTED VALUES TO DECIMAL AND SET RANKING ORDINALS()
	RTS							                                                ; RETURN



DIVIDE_YARDS_BY_ATTEMPTS:							                            ; DIVIDE STATS ($90 = NUMERATOR STAT INDEX, 91 = DIVISOR STAT INDEX)

temp_stat			= LOCAL_7
yards				= SEGMENT_VAR_93
divisor_attempts	= LOCAL_3
numerator_yards		= LOCAL_7	

	LDX FIRST_STAT_INDEX						                                ; SET STAT TO GET = NUMERATOR STAT INDEX
	LDA CURRENT_ROSTER_ID						                                ; LOAD CURRENT SEASON PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	
@check_zero_yards:	
	LDA temp_stat+1						                                        ; IS NUMERATOR = 0?
	BNE @get_average						                                    ; LOW BYTE NO->CONTINUE CALCULATION
	LDA temp_stat						                                        ;
	BNE @get_average						                                    ; HIGH BYTE NO->CONTINUE CALCULATION
	JMP @exit						                                            ; YES->EXIT

@get_average:							                                        ; CONTINUE CALCULATION
	LDA temp_stat						                                        ; SAVE FIRST STAT VALUE IN $93,$94
	STA yards						                                            ;
	LDA temp_stat +1 						                                    ;
	STA yards +1 						                                        ;
	
	LDX SECOND_STAT_INDEX						                                ; SET STAT TO GET = DIVISOR STAT INDEX
	LDA CURRENT_ROSTER_ID						                                ; LOAD CURRENT SEASON PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA temp_stat						                                        ; TRANSFER SECOND STAT VALUE TO DIVISOR BYTES
	STA divisor_attempts						                                        ;
	LDA temp_stat + 1						                                    ;
	STA divisor_attempts +1 						                                    ;
	LDA yards						                                                ; TRANSFER FIRST STAT VALUE TO NUMERATOR BYTES
	STA numerator_yards						                                                ;
	LDA yards + 1						                                                ;
	STA numerator_yards + 1						                                                ; 
	JSR DIVIDE_16_BIT_FRACTIONAL						                        ; 3 BYTE( $43,$44,$45) DIVIDE BY 2 BYTE($40,$41)

@exit:							                                                ; EXIT
	RTS							                                                ; RETURN
	

_F}_CALCULATE_AND_SORT_ON_YARDAGE_AVG	

_F{_GET_AND_SORT_LEADER_STAT													

GET_AND_SORT_LEADER_STAT:							                             ; GET AND SORT ON SINGLE STAT()

decimal_value			= LOCAL_6

	LDA FIRST_ROSTER_ID							                                ; SET CURRENT SEASON PLAYER ID = FIRST SEASON PLAYER ID TO CHECK
	STA CURRENT_ROSTER_ID						                                ;

_WHILE CC

	JSR GET_SINGLE_SEASON_STAT_LEADERS					                                ; GET SINGLE STAT( $6E= CURRENT TEAM $90=STAT INDEX, $9D= SEASON PLAYER ID) 
	LDA #$00						                                            ; SET DECIMAL VALUE = 0 
	STA decimal_value						                                    ;
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; 
	CMP LAST_ROSTER_ID						                                    ; IS CURRENT SEASON PLAYER ID < LAST PLAYER TO CHECK + 1

_END_WHILE						                                                ;
	INC CURRENT_TEAM						                                    ; CURRENT TEAM ++
	DEC NUM_OF_TEAMS_LEFT_TO_CHECK						                        ; TEAMS LEFT TO CHECK--
	BNE GET_AND_SORT_LEADER_STAT					                            ; DONE? NO->GET AND SORT ON SINGLE STAT()
	JSR SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL					    ; CONVERT SORTED VALUES TO DECIMAL AND SET RANKING ORDINALS()
	RTS							                                                ; RETURN

GET_SINGLE_SEASON_STAT_LEADERS:							                        ; GET SINGLE STAT( $6E= CURRENT TEAM $90=STAT INDEX, $9D= SEASON PLAYER ID) 
	LDX FIRST_STAT_INDEX						                                ; LOAD STAT TO GET
	LDA CURRENT_ROSTER_ID						                                ; LOAD CURRENT SEASON PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	RTS							                                                ; RETURN

_F}_GET_AND_SORT_LEADER_STAT

_F{_GET_AND_SORT_LEADER_RUSHING_STAT											

GET_AND_SORT_LEADER_RUSHING_STAT:							                    ; GET QB AND SKILL PLAYER RUSHING STATS 

decimal_value			= LOCAL_6
 
	LDA #QB1_ROSTER_ID						                                    ; SET SEASON PLAYER ID = FIRST PLAYER = QB
	STA CURRENT_ROSTER_ID						                                ; 

_WHILE CC							                                            ; GET QB SINGLE STAT AND SORT LOOP

	JSR GET_SINGLE_SEASON_STAT_LEADERS					                                ; GET SINGLE STAT( $6E= CURRENT TEAM $90=STAT INDEX, $9D= SEASON PLAYER ID) 
	LDA #$00						                                            ; SET DECIMAL PORTION = 0
	STA decimal_value						                                    ;
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < RB1
	CMP #RB1_ROSTER_ID						                                    ; 

_END_WHILE						                                                ; YES->GET QB SINGLE STAT AND SORT LOOP
	
	LDA #RB1_ROSTER_ID						                                            ; SEEMS UNEEDED
	STA CURRENT_ROSTER_ID						                                ;

_WHILE CC							                                                ; GET SKILL PLAYER SINGLE STAT AND SORT LOOP
	LDA FIRST_STAT_INDEX						                                ; SAVE QB RUSHING STAT INDEX
	PHA							                                                ;
	LDA SECOND_STAT_INDEX						                               ; SET SEASON STAT TO GET = SKILL PLAYER RUSHING STAT INDEX
	STA FIRST_STAT_INDEX						                                ;
	JSR GET_SINGLE_SEASON_STAT_LEADERS				                                ; GET SINGLE SEASON STAT( $6E= CURRENT TEAM $90=STAT INDEX, $9D= SEASON PLAYER ID)
	PLA							                                                ; RESTORE QB RUSHING STAT INDEX
	STA FIRST_STAT_INDEX						                                                ;
	LDA #$00						                                            ; SET DECIMAL PORTION = 0
	STA decimal_value						                                                ;
	JSR SORT_STAT_VALUES					                                            ; SORT VALUES()
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID = OL1
	CMP #C_ROSTER_ID						                                            ;

_END_WHILE						                                            ; NO->GET SKILL PLAYER SINGLE STAT AND SORT LOOP
	
	INC CURRENT_TEAM						                                    ; CURRENT TEAM ++
	DEC NUM_OF_TEAMS_LEFT_TO_CHECK						                        ; TEAMS LEFT TO CHECK--
	BNE GET_AND_SORT_LEADER_RUSHING_STAT					                                            ; DONE? NO->GET QB AN SKILL PLAYER SINGLE STAT LOOP
	JSR SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL					    ; CONVERT SORTED VALUES TO DECIMAL AND SET RANKING ORDINALS()
	RTS							                                                ; RETURN

_F}_GET_AND_SORT_LEADER_RUSHING_STAT

_F{_CALCULATE_AND_SORT_QB_RATING											

CALCULATE_AND_SORT_QB_RATING:							                         ; GET QB RATING($6E = CUR TEAM, $9E= NUM TEAMS TO CHECK)
	
	LDA #QB1_ROSTER_ID						                                    ; SET TEAM PLAYER ID = QB 1
	STA CURRENT_ROSTER_ID					                                    ;

_WHILE CC							                                            ; GET QB RATING FOR BOTH QBS LOOP

	JSR CHECK_IF_QB_QUALIFIES_FOR_RANKING					                    ; CHECK IF QB QUALIFIES FOR RANKING ( MIN 7 ATT/GAME)
	BCS @go_to_next_player						                                ; DOESN'T QUALIFY->GO TO NEXT QB, CHECK IF AT RB'S, CHECK IF DONE
	
@get_and_sort:	
	JSR CACLULATE_QB_RATING					                                    ; CALCULATE QB RATING() 
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()

@go_to_next_player:							                                    ; GO TO NEXT QB, CHECK IF AT RB'S, CHECK IF DONE
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < RB1
	CMP #RB1_ROSTER_ID						                                            ; 

_END_WHILE 						                                            	; YES->GET QB RATING FOR BOTH QBS LOOP
	
	INC CURRENT_TEAM						                                    ; CURRENT TEAM ++
	DEC NUM_OF_TEAMS_LEFT_TO_CHECK						                        ; TEAMS LEFT TO CHECK--
	BNE CALCULATE_AND_SORT_QB_RATING					                                            ; DONE? NO->GET QB RATING($6E = CUR TEAM, $9E= NUM TEAMS TO CHECK)
	JSR SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL					    ; CONVERT SORTED VALUES TO DECIMAL AND SET RANKING ORDINALS()
	RTS							                                                ; RETURN

_F}_CALCULATE_AND_SORT_QB_RATING

_F{_CALCULATE_QB_RATING															

CACLULATE_QB_RATING:							                                ; CALCULATE QB RATING

temp_stat				= LOCAL_6
mult_value				= LOCAL_6
qb_rating_sum			= SEGMENT_VAR_95

QB_RATING_COMP_PCT_MULTIPLIER		= $05 
QB_RATING_COMP_PCT_SUBTRACT			= $96									; =150 gets divided by 100 	

QB_RATING_TD_PCT_MULTIPLIER			= $14 

QB_RATING_INT_PCT_MULTIPLIER		= $19
QB_RATING_INT_PCT_SUBTRACT			= $ED80			

QB_RATING_YPA_MULTIPLIER			= $19							  													
QB_RATING_YPA_SUBTRACT				= $4B

FINAL_QB_RATING_DIVIDE_VALUE		= $06 

@get_comp_pct_value:
	LDA #QB_PASS_COMPLETIONS_SEASON_STAT_INDEX						            ; SET NUMERATOR STAT INDEX = PASS COMPLETIONS 
	STA FIRST_STAT_INDEX						                                ; 
	LDA #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX							             ; SET DIVISOR STAT INDEX = PASS ATTEMPTS
	STA SECOND_STAT_INDEX						                                ;
	JSR CALCULATE_PERCENTAGE_LEADERS					                        ; CALCULATE PERCENTAGE ($90= NUMERATOR STAT INDEX, $91 = DIVISOR STAT INDEX, 6E= TEAM, 9D= PLAYER)
	LDX temp_stat +1						                                    ;  SAVE COMP% IN $43,$44
	LDY temp_stat						                                        ;
								                                                ; =  (comp% -30) *0.05  = (comp% * 0.05) - (30*5) = (comp% * 0.05) - 1.5
	LDA #QB_RATING_COMP_PCT_MULTIPLIER						                                            ;  SET AMOUNT TO MULTIPLY BY = 0.05 
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45 = COMP% * 5
	
@decimal_portion	
	LDA mult_value						                                        ; = (comp% * 0.05) 
	SEC							                                                ;
	SBC #$00						                                            ;
	STA qb_rating_sum + 2						                                ;
	
	LDA mult_value + 1							                                ; 
	SBC #QB_RATING_COMP_PCT_SUBTRACT						                    ; - 1.5 
	STA qb_rating_sum						                                    ;
	LDA mult_value + 2							                                ;
	SBC #$00						                                            ;
	STA qb_rating_sum +1						                                ;
	
@get_td_pct_value:	
	INC FIRST_STAT_INDEX						                                ; NUMERATOR STAT INDEX++ = TDS
	JSR CALCULATE_PERCENTAGE_LEADERS					                        ; CALCULATE PERCENTAGE ($90= NUMERATOR STAT INDEX, $91 = DIVISOR STAT INDEX, 6E= TEAM, 9D= PLAYER)
	LDX temp_stat +1						                                    ;  SAVE COMP% IN $43,$44
	LDY temp_stat						                                        ;
	LDA #QB_RATING_TD_PCT_MULTIPLIER						                      ; SET AMOUNT TO MULTIPLY BY = 0.20
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45
	
	
	LDA qb_rating_sum + 2						                                ; = CURRENT QB RATING SUM (95,96,97) + TD VALUE (43,44,45)
	CLC							                                                ;
	ADC mult_value						                                        ;
	STA qb_rating_sum + 2						                                ;
	
	LDA qb_rating_sum						                                    ;
	ADC mult_value + 1						                                    ;
	STA qb_rating_sum					                                        ;
	LDA qb_rating_sum + 1						                                ;
	ADC mult_value + 2						                                    ;
	STA qb_rating_sum + 1					                                    ;
	
@get_int_pct_value:	
	INC FIRST_STAT_INDEX						                                ; NUMERATOR STAT INDEX++ = INTERCEPTIONS
	JSR CALCULATE_PERCENTAGE_LEADERS					                        ; CALCULATE PERCENTAGE ($90= NUMERATOR STAT INDEX, $91 = DIVISOR STAT INDEX, 6E= TEAM, 9D= PLAYER)
	LDX temp_stat +1						                                    ; SAVE INT% IN $43,$44
	LDY temp_stat					                                            ; 
	LDA #QB_RATING_INT_PCT_MULTIPLIER						                    ; SET AMOUNT TO MULTIPLY BY = 0.25
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45
	LDA #<QB_RATING_INT_PCT_SUBTRACT						                    ; = 2.375 - (INT% *0.25)
	SEC							                                                ;
	SBC mult_value						                                        ;
	STA mult_value						                                        ;
	
	LDA #>QB_RATING_INT_PCT_SUBTRACT						                    ;
	SBC mult_value + 1						                                    ;
	STA mult_value + 1						                                    ;
	LDA #$00						                                            ;
	SBC mult_value + 2					                                        ;
	STA mult_value + 2						                                    ;
	
	
	LDA qb_rating_sum + 2						                                ; = CURRENT QB RATING SUM (95,96,97) + TD VALUE (43,44,45)
	CLC							                                                ;
	ADC mult_value						                                        ;
	STA qb_rating_sum + 2						                                ;
	
	LDA qb_rating_sum						                                    ;
	ADC mult_value + 1						                                    ;
	STA qb_rating_sum					                                        ;
	LDA qb_rating_sum + 1						                                ;
	ADC mult_value + 2						                                    ;
	STA qb_rating_sum + 1					                                    ;
	
@get_ypa_value:	

yards_per_attempt		= LOCAL_6

	INC FIRST_STAT_INDEX						                                ; NUMERATOR STAT INDEX++ = YARDS
	JSR DIVIDE_YARDS_BY_ATTEMPTS					                            ; DIVIDE STATS ($90 = NUMERATOR STAT INDEX, 91 = DIVISOR STAT INDEX) = YARDS/ATT
	LDX yards_per_attempt +1 						                            ; SAVE YARDS/ATTEMPT
	LDY yards_per_attempt						                                ;
	LDA #QB_RATING_YPA_MULTIPLIER						                        ; SET AMOUNT TO MULTIPLY BY = 0.25
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45
	
	LDA mult_value						                                        ; = YARDS PER ATTEMPT - (3 *0.25 = 0.75 )
	SEC							                                                ;
	SBC #$00						                                            ;
	STA mult_value						                                		;
	
	LDA mult_value + 1							                                ; 
	SBC #QB_RATING_YPA_SUBTRACT						                    		; -0.75 
	STA mult_value + 1						                                    ;
	LDA mult_value + 2							                                ;
	SBC #$00						                                            ;
	STA mult_value + 2						                                ;
	
	
@add_to_current_amount:	
	
final_qb_rating_sum_value		= LOCAL_6

	LDA qb_rating_sum + 2						                                ; = CURRENT QB RATING SUM (95,96,97) + YPA VALUE (43,44,45)
	CLC							                                                ;
	ADC mult_value						                                        ;
	STA final_qb_rating_sum_value						                        ;
	LDA qb_rating_sum						                                    ;
	ADC mult_value + 1						                                    ;
	STA final_qb_rating_sum_value +1						                    ;
	LDA qb_rating_sum +1						                                ;
	ADC mult_value + 2						                                    ;
	STA final_qb_rating_sum_value +2						                    ;

	LDA final_qb_rating_sum_value + 2						                    ;
	BPL @get_qb_rating_value						                            ; IS QB RATING SUM =POSITIVE? YES->CALULATE FINAL QB RATING VALUE

@set_qb_rating_zero_if_negative:	
	LDA #$00						                                            ; ELSE SET QB RATING = 0 
	STA final_qb_rating_sum_value						                        ;
	STA final_qb_rating_sum_value + 1						                    ;
	STA final_qb_rating_sum_value + 2						                    ;
	JMP EXIT_CALCULATE_QB_RATING						                        ; *** uneeded JUMP->EXIT QB RATING

@get_qb_rating_value:							                                ; CALULATE FINAL QB RATING VALUE 

divisor	= LOCAL_3 

	LDA #$00						                                            ;  = QB RATING PARTS SUM / 6
	STA divisor +1						                                        ;
	LDA #FINAL_QB_RATING_DIVIDE_VALUE						                    ;
	STA divisor						                                            ;
	JSR DIVIDE_32_BIT_BY_16_BIT					   	                            ; 3 BYTE( $43,$44,$45) DIVIDE BY 2 BYTE($40,$41) 

EXIT_CALCULATE_QB_RATING							                                                ; EXIT QB RATING
	RTS						   	                                                ; RETURN

_F}_CALCULATE_QB_RATING

_F{_CALCULATE_AND_SORT_ON_RUSH_AVG												

CALCULATE_AND_SORT_ON_RUSH_AVG:							                        ; SORT RUSHING YARDS/ATT
	LDA #QB1_ROSTER_ID						                                    ; SET CURRENT SEASON PLAYER ID = QB0
	STA CURRENT_ROSTER_ID					                                    ;
	LDA #QB_RUSH_YDS_SEASON_STAT_INDEX						                    ; SET NUMERATOR STAT INDEX = QB RUSH YARDS
	STA FIRST_STAT_INDEX						                                ;
	LDA #QB_RUSH_ATTEMPTS_SEASON_STAT_INDEX						                ; SET DIVISOR STAT INDEX = QB RUSH ATT
	STA SECOND_STAT_INDEX

_WHILE CC							                                            ; CHECK AND SORT QB RUSHING AVERAGE
	LDX SECOND_STAT_INDEX						                                ; SET STAT TO CHECK =  QB RUSH ATT
	JSR CHECK_IF_PLAYER_QUALIFIES_FOR_RUSHING_AVG					            ; CHECK IF PLAYER QUALIFIES FOR RUSHING AVERAGE(MIN 1 ATT PER GAME)
	BCS @go_to_next_qb						                                    ; QUALIFIES? NO->GO TO NEXT PLAYER AND CHECK IF AT RB1
	JSR DIVIDE_YARDS_BY_ATTEMPTS					                            ; DIVIDE STATS ($90 = NUMERATOR STAT INDEX, 91 = DIVISOR STAT INDEX)
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()

@go_to_next_qb:							                                        ; GO TO NEXT PLAYER AND CHECK IF AT RB1
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < RB1
	CMP #RB1_ROSTER_ID						                                    ;

_END_WHILE						                                            	; YES-> CHECK AND SORT QB RUSHING AVERAGE
	
@set_roster_id_to_rb1:	
	LDA #RB1_ROSTER_ID						                                    ; SET STARTING PLAYER = RB1  
	STA CURRENT_ROSTER_ID						                                ;
	LDA #SKILL_RUN_YDS_SEASON_STAT_INDEX						                ; SET NUMERATOR STAT INDEX = SKILL PLAYER RUSH YARDS
	STA FIRST_STAT_INDEX						                                ;
	LDA #SKILL_RUN_ATT_SEASON_STAT_INDEX						                ; SET DIVISOR STAT INDEX = SKILL PLAYER RUSH ATT
	STA SECOND_STAT_INDEX						                                ; 
	
_WHILE CC							                                            ; CHECK AND SORT SKILL PLAYER RUSHING AVERAGE
	LDX SECOND_STAT_INDEX						                                ; SET STAT TO CHECK =  SKILL PLAYER RUSH ATT
	JSR CHECK_IF_PLAYER_QUALIFIES_FOR_RUSHING_AVG					            ; CHECK IF PLAYER QUALIFIES FOR RUSHING AVERAGE(MIN 1 ATT PER GAME)
	BCS @go_to_next_skill_player						                        ; QUALIFIES? NO->GO TO NEXT PLAYER AND CHECK IF DONE
	
@calc_ypa:	
	JSR DIVIDE_YARDS_BY_ATTEMPTS					                            ; DIVIDE STATS ($90 = NUMERATOR STAT INDEX, 91 = DIVISOR STAT INDEX)
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	
@go_to_next_skill_player:							                            ; GO TO NEXT PLAYER AND CHECK IF DONE
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < CENTER
	CMP #C_ROSTER_ID						                                    ;
	
_END_WHILE						                                                ; YES->CHECK AND SORT SKILL PLAYER RUSHING AVERAGE
	
	INC CURRENT_TEAM						                                    ; CURRENT TEAM ++
	DEC NUM_OF_TEAMS_LEFT_TO_CHECK						                        ; TEAMS LEFT TO CHECK--
	BNE CALCULATE_AND_SORT_ON_RUSH_AVG					                        ; DONE? NO->SORT RUSHING YARDS/ATT
	JSR SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL					    ; CONVERT SORTED VALUES TO DECIMAL AND SET RANKING ORDINALS()
	RTS							                                                ; RETURN

_F}_CALCULATE_AND_SORT_ON_RUSH_AVG

_F{_CALCULATE_AND_SORT_ON_TOTAL_PTS												
	
CALCULATE_AND_SORT_ON_TOTAL_PTS:							                    ; GET AND SORT TOTAL POINTS

decimal_portion		= LOCAL_6
temp_stat_value		= LOCAL_7

mult_result			= LOCAL_6
sort_value			= LOCAL_6

total_touchdowns	= SEGMENT_VAR_92
total_points		= SEGMENT_VAR_92


@calc_kicker_points:
	LDX #FG_MADE_SEASON_STAT_INDEX						                        ; SET STAT TO GET = FG MADE
	LDA #KICKER_ROSTER_ID						                                ; SET CURRENT SEASON PLAYER ID = KICKER
	STA CURRENT_ROSTER_ID						                                ;
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDY temp_stat_value						                                    ; LOAD FG'S MADE
	LDX temp_stat_value +1						                                ;
	LDA #FG_POINTS						                                        ; SET FG MADE VALUE = 3
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45 = FG MADE *3 = FG PTS
	LDA mult_result						                                        ; SAVE FG PTS IN TEMP TOTAL PTS 
	STA total_points						                                    ;
	LDA mult_result + 1						                                    ;
	STA total_points + 1						                                ;
	
	LDX #XP_MADE_SEASON_STAT_INDEX						                        ; SET STAT TO GET = XP MADE
	LDA #KICKER_ROSTER_ID						                                ; SET CURRENT SEASON PLAYER ID = KICKER
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	ADD_16_BIT_ZP_TO_16BIT_ZP[source_dest] temp_stat_value, total_points		; = XP PTS + FG MADE PTS
	LDA #$00						                                            ;
	STA decimal_portion						                                                ;
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()

@calc_qb_points:	
	LDA #QB1_ROSTER_ID						                                    ; SET CURRENT SEASON PLAYER ID = QB1
	STA CURRENT_ROSTER_ID						                                ;

_WHILE CC							                                             ; GET AND SORT QB RUSHING TD POINTS

	LDX #QB_RUSH_TD_SEASON_STAT_INDEX					        			  ; SET STAT TO GET = QB RUSHING TD
	LDA CURRENT_ROSTER_ID					                                    ; LOAD CURRENT SEASON PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDY temp_stat_value						                                    ; LOAD QB RUSHING TDS
	LDX temp_stat_value + 1						                                ;
	LDA #TD_POINTS						                                        ; SET QB RUSHING TD VALUE = 6
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45
	LDA mult_result + 1						                                    ;
	STA sort_value + 2 						                                    ;
	LDA mult_result						                                        ;
	STA sort_value + 1 						                                    ;
	LDA #$00						                                            ;
	STA decimal_portion						                                    ;
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < RB1
	CMP #RB1_ROSTER_ID						                                    ;

_END_WHILE						                                                ; YES->GET AND SORT QB RUSHING TD POINTS
	
	LDA #RB1_ROSTER_ID						                                    ; SET CURRENT SEASON PLAYER ID = RB1
	STA CURRENT_ROSTER_ID						                                ;

@calc_skill_player_pts:							                                ; ADD UP SKILL PLAYER TDS (REC,KR,PR,RUSH) LOOP
	LDA #SKILL_REC_TD_SEASON_STAT_INDEX						                    ; SET STAT TO GET = RECEIVING TDS
	STA FIRST_STAT_INDEX						                                ;
	LDA #$00						                                            ; SET CURRENT POINTS = 0 
	STA total_points						                                    ;
	STA total_points + 1						                                ;

_WHILE CC 							                                            ; ADD UP CURRENT SKILL PLAYER TDS (REC,KR,PR,RUSH)
	LDX FIRST_STAT_INDEX						                                ; LAOD STAT TO GET
	LDA CURRENT_ROSTER_ID						                                ; LOAD CURRENT SEASON PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	
	LDA temp_stat_value						
	CLC							
	ADC total_touchdowns						
	STA total_touchdowns				
	LDA temp_stat_value + 1					
	ADC total_touchdowns + 1						
	STA total_touchdowns + 1	 	
	LDA FIRST_STAT_INDEX						                                ; SET STAT TO GET+ = OFFSET TO NEXT TD STAT
	CLC							                                                ;
	ADC #$03						                                            ;
	STA FIRST_STAT_INDEX						                                ;
	LDA FIRST_STAT_INDEX						                                ; DONE CHECKING ALL TOUCHDOWN STATS FOR CURRENT SKILL PLAYER?
	CMP #(SKILL_RUN_TD_SEASON_STAT_INDEX + 3 )						            ;
	
_END_WHILE					                                                    ; NO->ADD UP CURRENT  SKILL PLAYER TDS (REC,KR,PR,RUSH)
	
	LDX total_touchdowns +1						                                ; LOAD SKILL PLAYER TDS
	LDY total_touchdowns 						                                ;
	LDA #TD_POINTS						                                        ; SET SKILL PLAYER TD VALUE = 6
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45
	LDA mult_result + 1						                                    ;
	STA sort_value + 2 						                                    ;
	LDA mult_result						                                        ;
	STA sort_value + 1 						                                    ;
	LDA #$00						                                            ;
	STA decimal_portion						                                    ;
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < CENTER
	CMP #C_ROSTER_ID						                                    ;
	BCC @calc_skill_player_pts						                                            ; YES-> ADD UP SKILL PLAYER TDS (REC,KR,PR,RUSH) LOOP
	
	LDA #RE_ROSTER_ID						                                    ; SET CURRENT SEASON PLAYER ID = RE1 = FIRST DEFENDER
	STA CURRENT_ROSTER_ID						                                ;

_WHILE CC							                                                ; ADD UP DEFENDER TDS LOOP

	LDX #DEF_INT_TDS_SEASON_STAT_INDEX						                    ; SET STAT TO GET = INTERCEPTION TDS
	LDA CURRENT_ROSTER_ID						                                ;
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER SEASON STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDY temp_stat_value						                                    ; LOAD DEFENDER INT TDS
	LDX temp_stat_value + 1						                                ;
	LDA #TD_POINTS						                                            ; SET DEFENDER INT TD VALUE = 6
	JSR MULTIPLY_A_TIMES_X_Y						                            ; MULTIPLY (A * X,Y)  RESULT IN in $43 $44 $45
	LDA mult_result + 1						                                    ;
	STA sort_value + 2 						                                    ;
	LDA mult_result						                                        ;
	STA sort_value + 1 						                                    ;
	LDA #$00						                                            ;
	STA decimal_portion						                                    ;
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	INC CURRENT_ROSTER_ID					                                    ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < KICKER
	CMP #KICKER_ROSTER_ID						                                ;
	
_END_WHILE						                                                ; YES-> ADD UP DEFENDER TDS LOOP
	
	INC CURRENT_TEAM						                                    ; CURRENT TEAM ++
	DEC NUM_OF_TEAMS_LEFT_TO_CHECK						                        ; TEAMS LEFT TO CHECK--
	BEQ @rank_and_convert_to_decimal						                    ; DONE YES->CONVERT SORTED TOTAL POINTS TO DECIMAL
	JMP CALCULATE_AND_SORT_ON_TOTAL_PTS					                        ; JUMP->GET AND SORT TOTAL POINTS

@rank_and_convert_to_decimal:							                                                ; CONVERT SORTED TOTAL POINTS TO DECIMAL 
	JSR SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL					    ; CONVERT SORTED VALUES TO DECIMAL()
	RTS							                                                ; RETURN

_F}_CALCULATE_AND_SORT_ON_TOTAL_PTS

_F{_CALCULATE_AND_SORT_ON_TOTAL_TD												
	
CALCULATE_AND_SORT_ON_TOTAL_TD:							                        ; GET AND SORT TOUCHDOWNS (REC, KR, PR, RUSH)

decimal_portion 	= LOCAL_6
temp_td_value		= LOCAL_7
sort_value			= LOCAL_7
total_touchdowns	= SEGMENT_VAR_92
	
	LDA #QB1_ROSTER_ID						                                    ; SET CURRENT SEASON PLAYER ID = QB1
	STA CURRENT_ROSTER_ID						                                ;

_WHILE CC								                                        ; GET AND SORT QB RUSHING TDS

	LDX #LEADERS_SCOREBOARD_SCHED_DRAW_SCRIPT_BANK						        ; SET STAT TO GET = QB SEASON RUSHING TDS
	LDA CURRENT_ROSTER_ID						                                ;
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER SEASON STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA #$00						                                            ; SET DECIMAL VALUE = 0
	STA decimal_portion						                                                ; 
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < RB1
	CMP #RB1_ROSTER_ID							                                ;

_END_WHILE						                                                 ; YES->GET AND SORT QB RUSHING TDS
	
	LDA #RB1_ROSTER_ID						                                    ; SET CURRENT SEASON PLAYER ID = RB1 SEEMS UNEEDED
	STA CURRENT_ROSTER_ID						                                ;

_WHILE CC							                                                ; ADD SKILL PLAYER TDS LOOP
	LDA #$00						                                            ; SET TOTAL TDS = 0
	STA total_touchdowns						                                ;
	STA total_touchdowns + 1						                            ;
	LDA #SKILL_REC_TD_SEASON_STAT_INDEX						                    ; SET SEASON STAT TO GET = SEASON REC TDS
	STA FIRST_STAT_INDEX						                                ;

@sum_td_types_loop:							                                                ; ADD SKILL PLAYER ALL TD TYPES 
	LDX FIRST_STAT_INDEX						                                ; LOAD SEASON STAT TO GET
	LDA CURRENT_ROSTER_ID						                                ; LOAD CURRENT SEASON PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER SEASON STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA temp_td_value						
	CLC							
	ADC total_touchdowns						
	STA total_touchdowns				
	LDA temp_td_value + 1					
	ADC total_touchdowns + 1						
	STA total_touchdowns + 1
	
	LDA FIRST_STAT_INDEX						                                ; = CURRENT TD STAT INDEX += OFFSET TO NEXT TD STAT
	CLC							                                                ;
	ADC #$03						                                            ;
	STA FIRST_STAT_INDEX						                                ;
	LDA FIRST_STAT_INDEX						                                ;
	CMP #(SKILL_RUN_TD_SEASON_STAT_INDEX + 3 )						            ; DONE WITH ALL TD STATS?
	BNE @sum_td_types_loop						                                ; NO->ADD SKILL PLAYER ALL TD TYPES 
	
	LDA total_touchdowns						                                ; SET VALUE TO SORT = TOTAL TDS
	STA sort_value						                                                ;
	LDA total_touchdowns + 1						                                ;
	STA sort_value + 1						                                                ;
	LDA #$00						                                            ; SET DECIMAL VALUE = 0
	STA decimal_portion						                                    ;
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < CENTER
	CMP #C_ROSTER_ID						                                    ;
	
_END_WHILE						                                            ; YES-> ADD SKILL PLAYER TDS LOOP

	LDA #RE_ROSTER_ID						                                    ; SET CURRENT SEASON PLAYER ID= FIRST DEFENDER = RE
	STA CURRENT_ROSTER_ID						                                ;

_WHILE CC							                                             ; ADD DEFENDER TDS LOOP

	LDX #DEF_INT_TDS_SEASON_STAT_INDEX						                    ; SET STAT TO GET = DEFENDER INT TDS
	LDA CURRENT_ROSTER_ID						                                ;
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER SEASON STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA #$00						                                            ; SET DECIMAL VALUE = 0
	STA decimal_portion						                                    ;
	JSR SORT_STAT_VALUES					                                    ; SORT VALUES()
	INC CURRENT_ROSTER_ID						                                ; CURRENT SEASON PLAYER ID++
	LDA CURRENT_ROSTER_ID						                                ; IS CURRENT SEASON PLAYER ID < KICKER
	CMP #KICKER_ROSTER_ID						                                ;
	
_END_WHILE						                                            ; YES->ADD DEFENDER TDS LOOP
	
	INC CURRENT_TEAM						                                    ; CURRENT TEAM ++
	DEC NUM_OF_TEAMS_LEFT_TO_CHECK						                        ; TEAMS LEFT TO CHECK--
	BEQ @exit						                                            ; DONE? YES-> CONVERT VALUES TO DECIMAL AND EXIT
	JMP CALCULATE_AND_SORT_ON_TOTAL_TD					                        ; NO->GET AND SORT TOUCHDOWNS (REC, KR, PR, RUSH)

@exit:							                                                ; CONVERT VALUES TO DECIMAL AND EXIT
	JSR SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL					    ; CONVERT SORTED VALUES TO DECIMAL()
	RTS							                                                ; RETURN

_F}_CALCULATE_AND_SORT_ON_TOTAL_TD
	
_F{_SORT_LEADER_STAT_VALUES														

temp_stat_value		= LOCAL_6

SORT_STAT_VALUES:							                                    ; SORT VALUES()
	LDX #$00						                                            ; 
	LDA STAT_TO_SORT_ON						                                    ; IS STAT TO SORT ON = INT%?
	CMP #SORT_ON_INT_PCT_INDEX						                            ;
	BEQ @sort_on_lowest_value						                                            ; YES->SORT BY LOWEST VALUE

_WHILE CC 

@check_if_stat_value_zero:							                            ; CHECK IF VALUE > VALUE AT CURRENT INDEX
	LDA temp_stat_value +2							                            ; STAT VALUE >0
	BNE @check_team						                                        ; YES->
	LDA temp_stat_value +1						                                ;
	BNE @check_team						                                        ;
	LDA temp_stat_value						                                    ;
	BNE @check_team						                                        ; 
	JMP EXIT_SORT_LEADER_STAT_VALUES						                                            ; *** could use RTS NO->EXIT

@check_team:
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ; IS FIRST TEAM  = NONE
	CMP #$FF						                                            ;
	BEQ @save_sorted_value						                                ; YES->SAVE SORTED VALUE

@check_value_to_sort_greater_than_current_value:	
	LDA temp_stat_value +2						                                ; IS STAT VALUE TO SORT >= CURRENT VALUE
	CMP CURRENT_BCD_STAT_VALUE[],X						                        ;
	BEQ @check_next_byte						                                ;
	BCS @save_sorted_value						                                ; YES->SAVE SORTED VALUE
	JMP @go_to_next_index						                                ; NO-> STAT < CURRENT STAT, SET STAT INDEX = NEXT STAT, CHECK IF DONE

@check_next_byte:
	LDA temp_stat_value +1					                                    ;
	CMP CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	BEQ @check_last_byte						                                ;
	BCS @save_sorted_value						                                ; YES->SAVE SORTED VALUE
	JMP @go_to_next_index						                                ; NO-> STAT < CURRENT STAT, SET STAT INDEX = NEXT STAT, CHECK IF DONE

@check_last_byte:
	LDA temp_stat_value 					                                    ;
	CMP CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	BCS @save_sorted_value						                                ; YES->SAVE SORTED VALUE

@go_to_next_index:							                                    ; STAT LESS THAN CURRENT STAT, SET STAT INDEX = NEXT STAT, CHECK IF DONE 
	TXA							                                                ; CURRENT INDEX += OFFSET TO NEXT DATA SET
	CLC							                                                ;
	ADC #OFFSET_TO_NEXT_RANKING_INDEX						                    ;
	TAX							                                                ;
	CPX #LAST_LEADER_INDEX						                                ; AT END OF DATA ARRAY?
	
_END_WHILE  						                                            ; NO->CHECK IF VALUE > VALUE AT CURRENT INDEX
	JMP EXIT_SORT_LEADER_STAT_VALUES						                                            ; *** UNEEDED COULD USE RTS

@sort_on_lowest_value:							                                 ; SORT BY LOWEST VALUE
	
_WHILE CC 	
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ; IS FIRST TEAM  = NONE
	CMP #$FF						                                            ;
	BEQ @save_sorted_value						                                ; YES-> SAVE SORTED VALUE
	LDA temp_stat_value +2						                                ; IS STAT VALUE TO SORT <= CURRENT VALUE
	CMP CURRENT_BCD_STAT_VALUE[],X						                        ;
	BEQ @check_next_byte_reverse_sort						                    ;
	BCC @save_sorted_value						                                ; YES->SAVE SORTED VALUE
	JMP @go_to_next_index_reverse_sort						                    ; NO-> STAT > CURRENT STAT, SET STAT INDEX = NEXT STAT, CHECK IF DONE

@check_next_byte_reverse_sort:							                        ; 
	LDA temp_stat_value +1						                                ;
	CMP CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	BEQ @check_last_byte_reverse_sort						                    ;	
	BCC @save_sorted_value						                                ;
	JMP @go_to_next_index_reverse_sort						                    ; NO-> STAT > CURRENT STAT, SET STAT INDEX = NEXT STAT, CHECK IF DONE

@check_last_byte_reverse_sort:							                        ;
	LDA temp_stat_value 						                                ;
	CMP CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	BCC @save_sorted_value						                                 ;

@go_to_next_index_reverse_sort:							                                                ; STAT > CURRENT STAT, SET STAT INDEX = NEXT STAT, CHECK IF DONE
    TXA							                                                ; CURRENT INDEX += OFFSET TO NEXT DATA SET
	CLC							                                                ;
	ADC #OFFSET_TO_NEXT_RANKING_INDEX						                    ;
	TAX							                                                ;
	CPX #LAST_LEADER_INDEX						                                ; AT END OF DATA ARRAY?

_END_WHILE						                                                ;

	JMP EXIT_SORT_LEADER_STAT_VALUES						                    ; JUMP->SORT EXIT *** UNEEDED COULD USE RTS

@save_sorted_value:							                                    ; SAVE SORTED VALUE
	
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ; SAVE CURRENT TEAM IN TEMP TEAM
	STA LEADERS_SORTED_INFO_TEMP[] 						                            ;
	
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						            ; SAVE CURRENT SEASON PLAYER ID IN TEMP SEASON PLAYER ID
	STA LEADERS_SORTED_INFO_TEMP[]+1						                            ;
	
	LDA CURRENT_BCD_STAT_VALUE[],X						                        ; SAVE STAT VALUE IN TEMP STAT VALUE
	STA LEADERS_SORTED_INFO_TEMP[]+2							                        ;
	LDA CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	STA LEADERS_SORTED_INFO_TEMP[]+3						                            ;
	LDA CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	STA LEADERS_SORTED_INFO_TEMP[]+4						                            ;
	
	LDA CURRENT_TEAM						                                    ; SAVE CURRENT TEAM
	STA CURRENT_TEAM_LEADERS_RANKING[],X						                ;
	LDA_ABS_A_ZP CURRENT_ROSTER_ID						                        ; SAVE CURRENT SEASON PLAYER ID *** fix uses absolute mod in original
	STA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						            ;
	
	LDA temp_stat_value + 2							                            ; SAVE STAT VALUE
	STA CURRENT_BCD_STAT_VALUE[],X						                        ;
	LDA temp_stat_value + 1						                                ;
	STA CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	LDA temp_stat_value						                                    ;
	STA CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	TXA							                                                ; CURRENT INDEX += OFFSET TO NEXT DATA SET
	CLC							                                                ;
	ADC #OFFSET_TO_NEXT_RANKING_INDEX						                    ;
	TAX							                                                ;

@move_all_values_down_one_index
_WHILE CC							                                            ; MOVE ALL VALUES DOWN TILL AT END OF ARRY OR TEAM ID = NONE

SWAP_SORT_TEMP[]			= SEGMENT_VAR_98 

	LDA LEADERS_SORTED_INFO_TEMP[]						                        ; DOES SAVED TEAM = NONE
	CMP #$FF						                                            ; 
	BEQ EXIT_SORT_LEADER_STAT_VALUES						                    ; YES-> EXIT
	
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ; SAVE STAT VALUE SET DOWN ONE INDEX 
	STA SWAP_SORT_TEMP[]						                                ; 
	
	LDA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						            ;
	STA SWAP_SORT_TEMP[] + 1						                            ;
	
	LDA CURRENT_BCD_STAT_VALUE[],X						                        ;
	STA SWAP_SORT_TEMP[] + 2						                            ;
	LDA CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	STA SWAP_SORT_TEMP[] + 3					                                ;
	LDA CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	STA SWAP_SORT_TEMP[] + 4						                            ;
	
	LDA LEADERS_SORTED_INFO_TEMP[]						                        ; 
	STA CURRENT_TEAM_LEADERS_RANKING[],X						                ;
	
	LDA LEADERS_SORTED_INFO_TEMP[] + 1						                    ;
	STA CURRENT_ROSTER_ID_LEADERS_RANKING[],X						            ;
	
	LDA LEADERS_SORTED_INFO_TEMP[] + 2							                ;
	STA CURRENT_BCD_STAT_VALUE[],X						                        ;
	LDA LEADERS_SORTED_INFO_TEMP[] + 3						                    ;
	STA CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	LDA LEADERS_SORTED_INFO_TEMP[] + 4						                    ;		
	STA CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ; 
	
	LDA SWAP_SORT_TEMP[]						                                ; SAVE LAST VALUE IN TEMP VALUES
	STA LEADERS_SORTED_INFO_TEMP[] 						                                            ;
	LDA SWAP_SORT_TEMP[] + 1						                            ;
	STA LEADERS_SORTED_INFO_TEMP[] + 1						                                            ;
	LDA SWAP_SORT_TEMP[] + 2						                                                ;
	STA LEADERS_SORTED_INFO_TEMP[] + 2					                                            ;
	LDA SWAP_SORT_TEMP[] + 3						                                                ;
	STA LEADERS_SORTED_INFO_TEMP[] + 3					                                            ;
	LDA SWAP_SORT_TEMP[] + 4						                                                ;
	STA LEADERS_SORTED_INFO_TEMP[] + 4						                                            ;
	
	TXA							                                                ; CURRENT INDEX += OFFSET TO NEXT DATA SET
	CLC							                                                ;
	ADC #OFFSET_TO_NEXT_RANKING_INDEX						                    ;
	TAX							                                                ;
	CPX #LAST_LEADER_INDEX						                                            ; AT END OF DATA ARRAY?

_END_WHILE					                                            ; NO->MOVE ALL VALUES DOWN TILL AT END OF ARRY OR TEAM ID = NONE

EXIT_SORT_LEADER_STAT_VALUES:							                                            ; SORT EXIT
	RTS							                                                ; RETURN

_F}_SORT_LEADER_STAT_VALUES

_F{_CLEAR_RANK_ARRAY_SET_RANK_INDEXES_TO_NOT_RANKED								

CLEAR_RANK_ARRAY_SET_RANK_INDEXES_TO_NOT_RANKED:							    ; *** could inline CLEAR RANKING MEMORY AND SET RANKING INDEXES = NOT RANKED

OFF
	
	LDX #$00						                                            ; SET INDEX = FIRST MEMORY LOCATION TO CLEAR	
_WHILE NOT_EQUAL							                                    ; CLEAR STAT RANKING MEMORY LOOP ($3D7-$491)

	LDA #$00						                                            ;
	STA CURRENT_TEAM_LEADERS_RANKING[],X						                                            ;
	INX							                                                ;
	CPX #SIZE_OF_RANKING_DATA						                                            ; DONE CLEARING MEMORY?
	
_END_WHILE						                                            	; NO->CLEAR STAT RANKING MEMORY LOOP ($3D7-$491)
	
	LDX #$00						                                            ; SET INDEX = FIRST RANKING LOCATION	

_WHILE NOT_EQUAL							                                    ; SET RANKING INDEX = NOT RANKED ($3D7-$491)
	LDA #$FF						                                            ; SET VALUE = NOT RANKED/NONE
	STA CURRENT_TEAM_LEADERS_RANKING[],X						                                            ;
	TXA							                                                ; CURRENT INDEX += OFFSET TO NEXT RANKING
	CLC							                                                ;
	ADC #OFFSET_TO_NEXT_RANKING_INDEX						                    ;
	TAX							                                                ;
	CPX #SIZE_OF_RANKING_DATA						                                            ; DONE? NO-> SET RANKING INDEX = NOT RANKED ($3D7-$491)
_END_WHILE						                                            	;
	
	RTS							                                                ; RETURN

_F}_CLEAR_RANK_ARRAY_SET_RANK_INDEXES_TO_NOT_RANKED

_F{_SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL							
	
SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL:							    ; CONVERT SORTED VALUES TO DECIMAL AND SET RANKING ORDINALS()

array_index_one_save			= LOCAL_3
array_index_two_save			= LOCAL_4
bcd_value						= LOCAL_7
current_ordinal					= SEGMENT_VAR_96
ranking_ordinal					= SEGMENT_VAR_97
num_players_left_to_rank		= SEGMENT_VAR_98

NUMBER_OF_PLAYERS_TO_RANK		= 30 


	JSR COVERT_SORTED_STATS_FROM_HEX_TO_TO_DEC					                ; CONVERT SORTED STATS FROM HEX TO DECIMAL()
	LDX #$00						                                            ; SET INDEX = FIRST RANKING INDEX
	LDA #$01						                                            ; SET CURRENT ORIDINAL = 1
	STA current_ordinal							                                ;	
	STA ranking_ordinal							                                ; SET PREVIOUS ORIDINAL = 1
	LDA #NUMBER_OF_PLAYERS_TO_RANK						                        ; SET # OF PLAYERS LEFT TO RANK = 30
	STA num_players_left_to_rank							                    ;
	JMP @values_equal						                                    ;

_WHILE ALWAYS								                                    ; CHECK FOR SAME VALUES OR FOR NO MORE VALUES LEFT TO SORT
	TXA								                                            ; SAVE PREVIOUS RANKING #
	SEC								                                            ;
	SBC #OFFSET_TO_NEXT_RANKING_INDEX						                    ;
	TAY								                                            ;
	LDA CURRENT_TEAM_LEADERS_RANKING[],X						                ; DOES TEAM ID = NONE?
	CMP #$FF						                                            ;
	BNE @check_current_equal_previous						                    ; NO->

	JMP @exit						                                            ; YES-> EXIT *** uneeded

@check_current_equal_previous:
	LDA CURRENT_BCD_STAT_VALUE[],X						                        ; IS CURRENT VALUE = PREVIOUS VALUE (3 BYTES)
	CMP CURRENT_BCD_STAT_VALUE[],Y						                        ; 
	BNE @values_not_equal						                                ; NO->VALUES NOT EQUAL, ORDINAL = NEW ORIDINAL VALUE
	
	LDA CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	CMP CURRENT_BCD_STAT_VALUE[] +1 ,Y						                    ;
	BNE @values_not_equal						                                ; NO->VALUES NOT EQUAL, ORDINAL = NEW ORIDINAL VALUE
	
	LDA CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	CMP CURRENT_BCD_STAT_VALUE[] +2 ,Y						                    ;
	BNE @values_not_equal						                                ; NO->VALUES NOT EQUAL, ORDINAL = NEW ORIDINAL VALUE
	JMP @values_equal						                                    ; YES->CONVERT CURRENT ORDINAL TO DECIMAL AND SAVE

@values_not_equal:							                                    ; VALUES NOT EQUAL, ORDINAL = NEW ORIDINAL VALUE
	LDA current_ordinal						                                    ; SET PREVIOUS ORIDINAL = CURRENT ORIDINAL
	STA ranking_ordinal						                                    ;

@values_equal:							                                        ; CONVERT CURRENT ORDINAL TO DECIMAL AND SAVE
	LDA ranking_ordinal						                                    ; IS CURRENT RANKING ORDINAL < 10
	CMP #$0A						                                            ;
	BCC @save_rank_ordinal						                                ; YES->SAVE RANKING ORDINAL

@convert_rank_ordinal_great_ten_to_BCD	
	STX array_index_one_save						                            ;
	STY array_index_two_save						                            ;
	JSR HEX_TO_2_DIGIT_DEC						                                ; CONVERT HEX TO DECIMAL (A= NUMBER TO CONVERT)
	LDX array_index_one_save						                            ; RESTORE INDEX
	LDY array_index_two_save						                            ; LOAD PREVIOUS INDEX SEEMS UNEEDED
	LDA bcd_value						                                                ; 

@save_rank_ordinal:							                                    ; SAVE RANKING ORDINAL
	STA CURRENT_RANKING_ORDINAL[],X						                        ;
	INC current_ordinal						                                    ;  CURRENT ORDINAL ++ 
	TXA							                                                ; INDEX += OFFSET TO NEXT SET OF VALUES
	CLC							                                                ;		
	ADC #OFFSET_TO_NEXT_RANKING_INDEX						                    ;
	TAX							                                                ;
	DEC num_players_left_to_rank						                         ; # OF PLAYERS LEFT TO RANK--
	BEQ @exit						                                            ; DONE? YES->EXIT

_END_WHILE						                                            ; NO->CHECK FOR SAME VALUES OR FOR NO MORE VALUES LEFT TO SORT

@exit:							                                                ; EXIT
	RTS							                                                ; RETURN		

_F}_SET_RANKING_ORDINALS_AND_CONVERT_VALUES_TO_DECIMAL	

_F{_CONVERT_SORTED_STATS_FROM_HEX_TO_TO_DEC									

COVERT_SORTED_STATS_FROM_HEX_TO_TO_DEC:							                ; CONVERT SORTED STATS FROM HEX TO DECIMAL

temp_stat_value = LOCAL_6
OFFSET_TO_NEXT_RANKING_INDEX

	LDX #$00						                                            ; SET STAT SORT INDEX = FIRST VALUE TO CONVERT
	
_WHILE CC								                                        ; CONVERT SORTED STATS TO DECIMAL LOOP

	LDA CURRENT_BCD_STAT_VALUE[],X						                        ; LOAD VALUE TO CONVERT
	STA temp_stat_value + 2							                            ;
	LDA CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	STA temp_stat_value + 1							                            ;
	LDA CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	STA temp_stat_value						                                    ;
	TXA							                                                ; SAVE STAT SORT INDEX
	PHA							                                                ;
	JSR LEADERS_HEX_TO_DEC_ONE_PT_PRECISION					                    ; CONVERT HEX VALUE TO BCD, ONE DECIMAL PT PRECISION($43,$44,$45)
	PLA							                                                ; RESTORE STAT SORT INDEX
	TAX							                                                ;
	LDA temp_stat_value + 2							                            ; SET SORTED STAT VALUE = CONVERTED DECIMAL VALUE 
	STA CURRENT_BCD_STAT_VALUE[],X						                        ;
	LDA temp_stat_value + 1							                            ;
	STA CURRENT_BCD_STAT_VALUE[] +1 ,X						                    ;
	LDA temp_stat_value						                                    ;
	STA CURRENT_BCD_STAT_VALUE[] +2 ,X						                    ;
	TXA							                                                ; STAT SORT INDEX += OFFSET TO NEXT VALUE TO CONVERT
	CLC							                                                ;
	ADC #OFFSET_TO_NEXT_RANKING_INDEX						                                            ;
	TAX							                                                ;
	CPX #LAST_LEADER_INDEX						                                ; AT END OF STATS TO CONVERT?
	
_END_WHILE 						                                                ; NO->CONVERT SORTED STATS TO DECIMAL LOOP
	
	RTS							                                                ; RETURN

_F}_CONVERT_SORTED_STATS_FROM_HEX_TO_TO_DEC

_F{_CHECK_IF_QB_QUALIFIES_FOR_RANKING											

CHECK_IF_QB_QUALIFIES_FOR_RANKING:							                    ; CHECK IF QB QUALIFIES FOR RANKING ( MIN 7 ATT/GAME)

sram_addr 						= LOCAL_1
temp_stat 						= LOCAL_7
games_played					= SEGMENT_VAR_92
games_played_times_seven		= SEGMENT_VAR_92
pass_attempts					= SEGMENT_VAR_93

	LDX #$00						                                            ; SET STAT TO GET = PASSING ATTEMPTS
	LDA CURRENT_ROSTER_ID						                                ;
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA temp_stat						                                        ; SAVE STATS 
	STA pass_attempts						                                                ;
	LDA temp_stat + 1						                                    ;
	STA pass_attempts +1						                                                ;
	LDA CURRENT_TEAM						                                    ; LOAD CURRENT TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR						                        ; LOAD TEAM SEASON SRAM LOCATION IN 3E 3F($6E = CURRENT TEAM)
	LDY #WINS_SEASON_STATS_OFFSET						                        ; = WINS ***(COULD USE INY INSTEAD OF LDY)
	LDA (sram_addr),Y						                                    ;
	LDY #LOSSES_SEASON_STATS_OFFSET						                        ; + LOSSES
	CLC							                                                ;
	ADC (sram_addr),Y						                                    ;
	LDY #TIES_SEASON_STATS_OFFSET						                        ; + TIES
	CLC							                                                ;
	ADC (sram_addr),Y						                                    ;
	STA games_played						                                    ; SET GAMES PLAYED = WINS + LOSSES+ TIES
	ASL							                                                ; = 8 * GAMES PLAYED - GAMES PLAYED = 7 TIMES GAMES PLAYED
	ASL							                                                ;
	ASL							                                                ;
	SEC							                                                ; 
	SBC games_played						                                    ;
	STA games_played_times_seven						                        ;

@check_zero_games_played:	
	LDA games_played_times_seven						                        ; DOES GAMES PLAYED = 0? 
	BEQ @qb_doesnt_qualify						                                ; YES->PLAYER DOESN'T QUALIFY FOR QB RATING
	
@check_greater_255_attempts::	
	LDA pass_attempts +1 						                                ; IS PASSING ATTEMPTS >255  	
	BNE @qb_qualifies						                                    ; YES->PLAYER QUALIFIES FOR QB RATING
	
	LDA pass_attempts 						                                    ; IS PASSING ATTEMPTS > 7 ATTEMPTS PER GAME
	CMP games_played_times_seven						                        ;	
	BCC @qb_doesnt_qualify						                                ; NO->PLAYER DOESN'T QUALIFY FOR QB RATING

@qb_qualifies:							                                        ; PLAYER QUALIFIES FOR QB RATING
	CLC							                                                ; CLC = PLAYER QUALIFIES
	JMP @exit						                                            ; *** could use BCC

@qb_doesnt_qualify:							                                                ; PLAYER DOESN'T QUALIFY FOR QB RATING
	SEC							                                                ; SEC = PLAYER DOESN'T QUALIFY

@exit:							                                                ; EXIT
	RTS							                                                ; RETURN
	
_F}_CHECK_IF_QB_QUALIFIES_FOR_RANKING	

_F{_CHECK_IF_PLAYER_QUALIFIES_FOR_REC_LEADERS								

sram_addr 						= LOCAL_1
temp_stat 						= LOCAL_7
games_played					= SEGMENT_VAR_92
receptions						= SEGMENT_VAR_93

CHECK_IF_PLAYER_QUALIFIES_FOR_REC_AVG:							                ; *** could be inlined CHECK IF WR QUALIFIES FOR YDS/REC RANKING ( MIN 7 ATT/GAME)
    LDX #SKILL_REC_SEASON_STAT_INDEX							                ; SET STAT TO GET = SEASON RECEPTIONS
	LDA CURRENT_ROSTER_ID						                                ; LOAD CURRENT PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER SEASON STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	
@save_receptions:	
	LDA temp_stat						                                        ;
	STA receptions						                                        ;
	LDA temp_stat + 1						                                    ;
	STA receptions + 1					                                        ;
	
@get_games_played:	
	LDA CURRENT_TEAM						                                    ; LOAD CURRENT TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR						                        ; LOAD TEAM SEASON SRAM LOCATION IN 3E 3F()
	LDY #WINS_SEASON_STATS_OFFSET						                        ; GAMES PLAYED =  WINS
	LDA (sram_addr),Y						                                    ;
	LDY #LOSSES_SEASON_STATS_OFFSET						                        ;
	CLC							                                                ;
	ADC (sram_addr),Y						                                    ; + LOSSES
	LDY #TIES_SEASON_STATS_OFFSET						                        ;
	CLC							                                                ;
	ADC (sram_addr),Y						                                    ; + TIES
	STA games_played						                                    ;

@chcek_for_zero_games_played:	
	LDA games_played						                                    ; DOES GAMES PLAYED = 0?
	BEQ @player_doesnt_qualify						                            ; YES->PLAYER DOESN'T QUALIFY FOR WR RANKING

@check_for_rec_more_than_255:	
	LDA receptions +1 						                                    ; RECEPTIONS > 255
	BNE @player_qualifies						                                ; YES->PLAYER DOES QUALIFY FOR WR RANKING

@check_for_rec_greater_than_games_played	
	LDA receptions						                                        ; RECEPTIONS < GAMES PLAYED
	CMP games_played						                                    ;
	BCC @player_doesnt_qualify						                            ; YES-> PLAYER DOESN'T QUALIFY FOR WR RANKING

@player_qualifies:							                                    ; PLAYER DOES QUALIFY FOR WR RANKING
	CLC							                                                ; CLC = PLAYER QUALIFIES
	JMP @exit						                                            ; ***  could use bcc NO NEED FOR JUMP

@player_doesnt_qualify:							                                ; PLAYER DOESN'T QUALIFY FOR WR RANKING
	SEC							                                                ; SEC = PLAYER DOESN'T QUALIFY

@exit:							                                                ; EXIT
	RTS							                                                ; RETURN
	
_F}_CHECK_IF_PLAYER_QUALIFIES_FOR_REC_LEADERS	

_F{_CHECK_IF_CAN_CALULATE_QB_RATING												
					
CHECK_IF_CAN_CALCULATE_QB_RATING:							                    ; *** could be inlined rather than routine CHECK IF PLAYER QUALIFIES FOR QB RATING PLAYER DATA

temp_stat		= LOCAL_7
pass_attempts	= SEGMENT_VAR_93

	LDX #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX						                ; SET STAT TO GET = SEASON PASS ATTEMPTS
	LDA CURRENT_ROSTER_ID						                                ; 
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER SEASON STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA temp_stat						                                        ; SAVE SEASON PASS ATTEMPTS
	STA pass_attempts						                                    ;
	LDA temp_stat + 1						                                    ;
	STA pass_attempts +1						                                ;
	
@check_pass_attempts_greater_than_one											; *** could used saved values rather than LOCALS
	LDA temp_stat						                                                ; SEASON PASS ATTEMPTS > 1
	BNE @player_qualifies:						                                ; YES->QB QUALIFIES FOR QB RATING PLAYER DATA
	
	LDA temp_stat + 1						                                                ;
	BEQ @player_doesnt_qualify:						                            ; NO->QB DOESN'T QUALIFIES FOR QB RATING PLAYER DATA

@player_qualifies:							                                     ; QB QUALIFIES FOR QB RATING PLAYER DATA
	CLC							                                                ; CLC = PLAYER QUALIFIES
	JMP @exit						                                            ; *** could use BCC NO NEED FOR JUMP

@player_doesnt_qualify:							                                                ; QB DOESN'T QUALIFIES FOR QB RATING PLAYER DATA
	SEC							                                                ; SEC = PLAYER DOESN'T QUALIFY

@exit:							                                                ; EXIT
	RTS							                                                ; RETURN

_F}_CHECK_IF_CAN_CALULATE_QB_RATING	

_F{_CHECK_IF_PLAYER_QUALIFIES_FOR_RUSH_LEADERS								

sram_addr 						= LOCAL_1
temp_stat 						= LOCAL_7
games_played					= SEGMENT_VAR_92
rush_attempts					= SEGMENT_VAR_93

CHECK_IF_PLAYER_QUALIFIES_FOR_RUSHING_AVG:							            ; CHECK IF PLAYER QUALIFIES FOR RUSHING AVERAGE
	LDA CURRENT_ROSTER_ID						                                ; LOAD CURRENT SEASON PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA temp_stat						                                                ; SAVE SEASON RUSHING ATT
	STA rush_attempts						                                                ;	
	LDA temp_stat + 1						                                                ;
	STA rush_attempts + 1						                                                ;
	
@get_games_played:	
	LDA CURRENT_TEAM						                                    ; LOAD CURRENT TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR						                        ; LOAD TEAM SEASON SRAM LOCATION IN 3E 3F()
    LDY #WINS_SEASON_STATS_OFFSET						                                            ; GAMES PLAYED =  WINS
	LDA (sram_addr),Y						                                            ;
	LDY #LOSSES_SEASON_STATS_OFFSET						                                            ;
	CLC							                                                ;
	ADC (sram_addr),Y						                                            ; + LOSSES
	LDY #TIES_SEASON_STATS_OFFSET						                                            ;
	CLC							                                                ;
	ADC (sram_addr),Y															; + TIES
	ASL	
	STA games_played						                                                ;
	LDA games_played						                                                ; DOES GAMES PLAYED = 0?
	BEQ @player_doesnt_qualify						                                            ; YES->PLAYER DOESN'T QUALIFY FOR RUSH AVG RATING
	LDA rush_attempts + 1						                                                ; RUSH ATT  > 255
	
	BNE @player_qualifies:						                                            ; YES->PLAYER DOES QUALIFY FOR RUSH AVG RANKING
	LDA rush_attempts						                                                ; RUSH ATT  < 2* GAMES PLAYED
	CMP games_played						                                                ;
	BCC @player_doesnt_qualify						                                            ; YES-> PLAYER DOESN'T QUALIFY FOR RUSH AVG RANKING

@player_qualifies:							                                                ; PLAYER DOES QUALIFY FOR WR RANKING
	CLC							                                                ; CLC = PLAYER QUALIFIES
	JMP @exit						                                            ; NO NEED FOR JUMP

@player_doesnt_qualify:							                                                ; PLAYER DOESN'T QUALIFY FOR RUSH AVG RANKING
	SEC							                                                ; SEC = PLAYER DOESN'T QUALIFY

@exit:							                                                ; EXIT
	RTS							                                                ; RETURN

_F}_CHECK_IF_PLAYER_QUALIFIES_FOR_RUSH_LEADERS

_F{_CHECK_IF_PLAYER_QUALIFIES_FOR_KR_PR_LEADERS								

sram_addr 						= LOCAL_1
temp_stat 						= LOCAL_7
games_played					= SEGMENT_VAR_92
returns							= SEGMENT_VAR_93
returns_times_two				= SEGMENT_VAR_93

CHECK_IF_PLAYER_QUALIFIES_FOR_KR_PR_AVG:							            ; CHECK IF KR/PR PLAYER QUALIFIES (MIN 1 ATT PER 2 GAMES) 
	LDA STAT_TO_SORT_ON						                                    ; IS STAT TO SORT ON = PUNT RETURN AVERAGE	
	CMP #SORT_ON_PUNT_RET_AVERAGE_INDEX						                    ;
	BEQ @get_punt_returns						                                 ; YES-> SORT ON PUNT RETURN AVERAGE

@get_kick_returns:	
	LDX #SKILL_KR_ATT_SEASON_STAT_INDEX						                    ; SET STAT TO GET = SEASON KR ATT
	JMP @get_season_stats						                                ;

@get_punt_returns:							                                                ; SET STAT TO GET = SEASON PR ATT
	LDX #SKILL_PR_ATT_SEASON_STAT_INDEX						                    ; SET STAT TO GET = SEASON PR ATT

@get_season_stats:							                                                ; CHECK IF PLAYER HAS ENOUGH KR/PR ATT TO QUALIFY
	LDA CURRENT_ROSTER_ID						                                ; LOAD PLAYER ID
	JSR LEADERS_SCREEN_GET_PLAYER_SEASON_STATS					                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE $43 TO 0
	LDA temp_stat						                                        ; = 2 X ATT
	ASL							                                                ;
	STA returns_times_two						                                                ;
	LDA temp_stat +1						                                    ;
	ASL							                                                ;
	STA returns_times_two + 1						                                                ;
	
@get_games_played:	
	LDA CURRENT_TEAM						                                    ; LOAD CURRENT TEAM 
	JSR GET_TEAM_SEASON_SRAM_ADDR						                        ; LOAD TEAM SEASON SRAM LOCATION IN 3E 3F()
	LDY #WINS_SEASON_STATS_OFFSET						                        ; = TEAM WINS
	LDA (sram_addr),Y						                                    ;
	LDY #LOSSES_SEASON_STATS_OFFSET						                        ;
	CLC							                                                ;
	ADC (sram_addr),Y						                                    ; + TEAM LOSSES
	LDY #TIES_SEASON_STATS_OFFSET						                        ;
	CLC							                                                ;
	ADC (sram_addr),Y						                                    ; + TEAM TIES
	STA games_played						                                    ;
	
	LDA games_played						                                    ;
	BEQ @player_doesnt_qualify						                            ; DOES TOTAL GAMES = 0 YES->PLAYER DOESN'T QUALIFY KR/PR LEADER
	
	LDA returns_times_two + 1						                            ; YARDS > 255
	BNE @player_qualifies:						                                ; YES->PLAYER DOES QUALIFY KR/PR LEADER
	
	LDA returns_times_two						                                ; (2 X ATT) < GAMES PLAYED
	CMP games_played						                                    ;
	BCC @player_doesnt_qualify						                            ; YES->PLAYER DOESN'T QUALIFY KR/PR LEADER

@player_qualifies:							                                    ; PLAYER DOES QUALIFY KR/PR LEADER
	CLC							                                                ; CLC = DOES QUALIFY
	JMP @exit						                                            ; UNEEDED COULD USE RTS

@player_doesnt_qualify:							                                                ; PLAYER DOESN'T QUALIFY KR/PR LEADER
	SEC							                                                ; SEC = DOESN'T QUALIFY

@exit:							                                                ; EXIT
	RTS							                                                ; RETURN

_F}_CHECK_IF_PLAYER_QUALIFIES_FOR_KR_PR_LEADERS	

_F{_LEADERS_HEX_TO_DEC_ONE_PT_PRECISION											

LEADERS_HEX_TO_DEC_ONE_PT_PRECISION:							                ; CONVERT HEX VALUE TO BCD, ONE DECIMAL PT PRECISION($43,$44,$45)

decimal_result		= LOCAL_3
return_result		= LOCAL_7
decimal_portion		= LOCAL_6
temp_decimal_value  = SEGMENT_VAR_92

	JSR LEADERS_GET_VALUE_AFTER_DECIMAL_PT					                    ; *** could inline GET FIRST NUMBER AFTER DECIMAL POINT()
	JSR HEX_TO_3_DIGIT_DEC						                                ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)
	LDA decimal_result + 1						                                ; SAVE BINARY CODED DECIMAL VALUE OF WHOLE PART IN $44,45
	STA return_result + 1						                                ;
	LDA decimal_result						                                    ;
	STA return_result						                                    ;
	LDA temp_decimal_value						                                                ; ROUND DOWN DECIMAL NUMBER ( 0.15 = 0)
	AND #$F0						                                            ;
	STA decimal_portion						                                    ; SAVE BINARY CODED DECIMAL VALUE OF DECIMAL PART IN $43 
	RTS							                                                ; RETURN


hex_value						= LOCAL_7
decimal_part_to_multiply		= LOCAL_6
divide_value					= LOCAL_5

divide_result					= LOCAL_7
hex_to_dec_result				= LOCAL_7

LEADERS_GET_VALUE_AFTER_DECIMAL_PT:							                        ; GET FIRST NUMBER AFTER DECIMAL POINT($43,$44,$45= HEX NUM)
	LDA hex_value						                                        ; SAVE 16 BIT HEX NUMBER
	PHA							                                                ;
	LDA hex_value+1						                                        ;
	PHA							                                                ;
	LDX decimal_part_to_multiply						                        ;
	LDA #$64						                                            ; SET AMOUNT TO MULTIPLY BY = 100 
	JSR MULTIPLY_A_TIMES_X						                                ; 8 BIT MULTIPLY (A * X)  RESULT IN $44,45
	LDA #$00						                                            ; 
	STA divide_value+1						                                    ;
	LDA #$FF						                                            ; SET AMOUNT TO DIVIDE  BY = 255
	STA divide_value						                                    ; 
	JSR DIVIDE_16_BIT_16_BIT_RESULT						                        ; 16 BIT DIVIDE ($45,44/ $43,42) RESULT $45,44
	LDA divide_result					                                        ;
	JSR HEX_TO_2_DIGIT_DEC						                                ; CONVERT HEX TO DECIMAL (A= NUMBER TO CONVERT)
	LDA hex_to_dec_result						                                                ; SAVE BCD VALUE OF VALUE AFTER DECIMAL POINT IN $92
	STA temp_decimal_value						                                ;
	PLA							                                                ; RESTORE WHOLE PART OF NUMBER
	STA hex_value+1						                                        ;
	PLA							                                                ;
	STA hex_value						                                         ;
	RTS							                                                ; RETURN

_F}_LEADERS_HEX_TO_DEC_ONE_PT_PRECISION

_F{_LEADERS_SCREEN_GET_PLAYER_SEASON_STATS									

LEADERS_SCREEN_GET_PLAYER_SEASON_STATS:							                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT), SET HIGH BYTE TO 0

decimal_portion		= LOCAL_6

	JSR SWAP_AND_GET_PLAYER_SEASON_STATS						                ; GET PLAYER STATS(A= PLAYER, $6E = TEAM, X= STAT)
	LDA #$00						                                            ; SET DECIMAL PORTION = 0 
	STA decimal_portion						                                                ; 
	RTS							                                                ; RETURN

_F}_LEADERS_SCREEN_GET_PLAYER_SEASON_STATS	

_F{_UNUSED_LEADER_SCREEN_CODE												

UNUSED_LEADER_CODE:							                                    ; *** UNUSED CODE 9E19 appears to be a math routine for 4 byte number

	LDA_ABS_A_ZP LOCAL_4
	STA_ABS_A_ZP LOCAL_8
	LDA_ABS_A_ZP LOCAL_3
	STA_ABS_A_ZP LOCAL_7
	LDA_ABS_A_ZP LOCAL_2
	STA_ABS_A_ZP LOCAL_6
	LDA #$00
	STA_ABS_A_ZP LOCAL_5
	LDX_ABS_ZP LOCAL_1
	LDY #$18
@Loop1:
	ASL LOCAL_5
	ROL LOCAL_6
	ROL LOCAL_7
	ROL LOCAL_8
	BCC @Loop2
	TXA
	CLC
	ADC LOCAL_5
	STA LOCAL_5
	LDA LOCAL_6
	ADC #$00
	STA LOCAL_6
	LDA LOCAL_7
	ADC #$00
	STA LOCAL_7
	LDA LOCAL_8
	ADC #$00
	STA LOCAL_8
@Loop2:
	DEY
	BNE @Loop1
	RTS

_F}_UNUSED_LEADER_SCREEN_CODE


.PAD	$A000,$FF 
