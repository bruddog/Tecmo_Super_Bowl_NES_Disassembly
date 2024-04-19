.BASE $9000


_F{_SKIP_MODE_CONSTANTS

FUMBLE_CHANCE_SIM				= $00													; injuryy chance 1/256
INJURY_CHANCE_SIM_MULT_ONE		= $11													; chance is the multiplication of 10/256 * 17/256 = 0.25% 
INJURY_CHANCE_SIM_MULT_TWO		= $0A	

MAX_SCORE_LIMIT_SIM				= $99
YARDS_FOR_FIRST_SIM				= $0A

SECONDS_PER_QUARTER_SIM			= $00
MINUTES_PER_QUARTER_SIM			= $06
LENGTH_OF_FIELD_YARDS_SIM		= $64													; in yards $64 = 100 decimal
XP_KICK_DISTANCE_SIM			= $02													; in yards
																						
PASS_SIM_PLAY_TYPE				= $00
NORMAL_RUN_SIM_PLAY_TYPE		= $01
QB_SCRAMBLE_SIM_PLAY_TYPE		= $02
QB_SACKED_SIM_PLAY_TYPE			= $03
										                                                ; ADD  $62A = P1 CONDITIONS .DSB 8
SIM_GAME_STATUS_GAME_OVER_BITFLAG	= $80
SIM_GAME_STATUS_OVERTIME_BITFLAG	= $40									                            

_F}_SKIP_MODE_CONSTANTS

_F{_SKIP_MODE_MACROS

.MACRO SET_SIM_PLAY_TIME[min_max_rand] MIN, MAX, RAND
	LDA RAND					      		                                            ;
	LDX #(MAX - MIN)						
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX	  	                                            ; SET VALUE TO (0 TO X-1)
	CLC							          	                                            ;
	ADC #MIN						      	                                            ; +  SECONDS
	STA SIM_TIME_PLAY_USED				  	                                            ; SET TIME TO SUBTRACT FROM CLOCK
.ENDM

.MACRO SET_ADJUSTED_SKILL_VALUE[min_max_rand] MIN, MAX, RAND

	player_sim_value 	= LOCAL_8
	adjusted_sim_val	= LOCAL_1
	LDA RAND								                                            ;
	LDX #(MAX - MIN)						                                            ;
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					
	CLC							    		                                            ;
	ADC #MIN								                                            ; 
	LDX player_sim_value					                                            ;  LOAD PLAYER SIM VALUE 
	JSR SIM_A_TIMES_X_SAVE_IN_LOCAL_1					                                ;  MULTIPLY( A * X) RESULT $3E,3F
	LDA #$64						                                                    ;  LOAD 100
	LDX adjusted_sim_val					                                            ;  LOAD RESULT
	LDY adjusted_sim_val +1					                                            ;
	JSR DIVIDE_ADJUSTED_SIM_VAL					                                        ; DIVIDE (3F,3E / A)  RESULT $3E,3F

.ENDM	

_F}_SKIP_MODE_MACROS

BANK_JUMP_COM_PLAY_CALL_LOGIC_START:
	JMP COM_PLAY_CALL_LOGIC_START				                                ; CPU PLAY LOGIC($9E)

BANK_JUMP_CHECK_FOR_COM_ONSIDES_KICK:
	JMP CHECK_FOR_COM_ONSIDES_KICK				                                ; CPU ONSIDE KICK LOGIC()

BANK_JUMP_GET_PLAYER_SEASON_STAT:
	JMP GET_PLAYER_SEASON_STAT				                                    ; GET SEASON STATS

BANK_JUMP_GET_CURRENT_GAME_STATS:
	JMP GET_CURRENT_GAME_STATS	                                                ; GET CURRENT GAME STATS()

BANK_JUMP_ADD_STAT_TO_SEASON_STAT:
	JMP ADD_STAT_TO_SEASON_STAT[stat_function_index]				            ; ADD CURRENT STATS TO SEASON STATS()

BANK_JUMP_UPDATE_IN_GAME_STATS_WITH_ERROR_CHECK
	JMP UPDATE_IN_GAME_STATS_WITH_ERROR_CHECK				                    ; UPDATE PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE)

BANK_JUMP_ADD_ALL_GAME_STATS_TO_SEASON_STATS
	JMP ADD_ALL_GAME_STATS_TO_SEASON_STATS				                        ; ADD ALL CURRENT GAME STATS TO SEASON STATS


	
_F{_CLEAR_AND_INIT_SIM_MEMORY															; DONE

SIMULATION_SKIP_MODE_SEASON_START:							                                    ; SKP VS SKP MODE SIMULATION START()
	
	
@clear_sim_memory:	
	LDA #$00						                                                    ; SET VALUE TO WRITE INTO RAM
	TAX							                                                        ;
_WHILE NOT_EQUAL

	STA START_OF_SIM_RAM[],X						                                                    ;
	INX		

_END_WHILE

	JSR LOAD_SIM_VALUES_FROM_ROM_TO_RAM					                                ; TRANSFER SIM VALUES TO RAM()

@init_vars:
	LDA #$00						                                                    ; 
	STA QUARTER					                                                        ; SET QUARTER = FIRST QUARTER
	STA CLOCK_SECONDS			                                                        ; SET SECONDS = 00
	STA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM INDEX = PLAYER 1
	STA DOWN						                                                    ; SET DOWN? =0 
	LDA #MINUTES_PER_QUARTER_SIM							                            ; SET MINUTES =6
	STA CLOCK_MINUTES						                                            ; 
	LDA #YARDS_FOR_FIRST_SIM						                                    ; SET YARDS NEEDED FOR FIRST DOWN = 10
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;
	
_F}_CLEAR_AND_INIT_SIM_MEMORY	
	
_F{_DO_INITIAL_SIM_KICKOFF																; DONE
	
@do_kickoff:	
	JSR DO_SIM_KICKOFF					                                                ; DO SIM KICK-OFF()
	
	
	LDA #YARDS_FOR_FIRST_SIM						                                    ; SET YARDS NEEDED FOR FIRST DOWN = 10
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; WAS THERE A TURNOVER
	EOR SIM_LAST_TEAM_WITH_BALL 						                                ;
	BEQ @set_injury_false						                                        ; NO-> SET POSSIBLE PLAYER INJURY = FALSE AND DO END OF PLAY
	
@swap_possesion:	
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET CURRENT TEAM WITH POSSESSION  = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_CURRENT_TEAM_WITH_BALL						                                ;
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM INDEX TO OTHER TEAM = SWAP POSSESSION 
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	LDA #LENGTH_OF_FIELD_YARDS_SIM							                            ; SET DISTANCE FROM ENDZONE = 100 YARDS - DISTANCE FROM ENDZONE
	SEC							                                                        ;
	SBC SIM_DISTANCE_FROM_ENDZONE						                                ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;

@set_injury_false:							                                            ; SET POSSIBLE PLAYER INJURY = FALSE AND DO END OF PLAY
	LDA #$00						                                                    ; SET PLAYER INJURY STATUS = FALSE
	STA SIM_INJURY_BOOL						                                            ;

																						; END OF PLAY START 	
_F}_DO_INITIAL_SIM_KICKOFF	

_F{_MAIN_SIM_LOOP																		; DONE

MAIN_SIM_LOOP: 

current_team_id					= LOCAL_7
current_position_id				= LOCAL_8
TEAM_SCORES_FOR_CPU_LOGIC[]		= SEGMENT_VAR_9F

_WHILE ALWAYS
	LDA SIM_INJURY_BOOL						                                            ; DOES PLAYER INJURED = TRUE
	BEQ @clear_play_variables						                                     ; NO-> CLEAR PLAY VARIABLES, CHECK FOR GAME OVER


@do_player_injured_skp_mode:	
	LDA TEAM_ON_OFFENSE						                                            ; SAVE CURRENT TEAM
	PHA							                                                        ; 
	LDA SIM_CURRENT_POSITION_ID						                                    ; SAVE POSITION ID
	STA current_position_id							                                    ;
	LDA SIM_CURRENT_TEAM						                                    ; SAVE P1/P2 TEAM INDEX
	STA current_team_id							                                        ;
	JSR SWAP_AND_DO_SKP_MODE_INJURY						                                ; SIM MODE INJURY CHECK() IN $9EB8 BANK  19
	JSR LOAD_SIM_VALUES_FROM_ROM_TO_RAM					                                ; TRANSFER SIM VALUES TO RAM()
	PLA							                                                        ; 
	STA TEAM_ON_OFFENSE						                                            ; RESTORE CURRENT TEAM

@clear_play_variables:							                                        ; CLEAR PLAY VARIABLES, CHECK FOR GAME OVER
	LDA #$00						                                                    ; SET PLAYER TACKLED  = FALSE 
	STA SIM_PLAYER_TACKLED_BOOL						                                    ;
	STA SIM_PLAY_YARDAGE						                                        ; SET PLAY YARDAGE = 0
	STA SIM_TIME_PLAY_USED						                                        ; SET TIME TO SUBTRACT FROM CLOCK = ZERO
	STA SIM_INJURY_BOOL						                                            ; SET POSSBILE PLAYER INJURY = FALSE
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; 
	STA SIM_LAST_TEAM_WITH_BALL 						                                ; SET LAST TEAM WITH POSSESSION = P1 = CURRENT TEAM WITH POSESSION
	LDA SIM_GAME_STATUS						                                            ; DOES GAME STATUS = GAME OVER
	BPL @check_for_kickoff_or_play						                                 ; NO-> CHECK FOR KICKOFF OR NORMAL PLAY
	
@game_over:	
	RTS							                                                        ; RETURN

@check_for_kickoff_or_play:							                                    ; CHECK FOR KICKOFF OR NORMAL PLAY
	LDA SIM_DO_KICKOFF_BOOL						                                        ; IS DO KICKOFF  = TRUE
	BEQ SIM_DO_NORMAL_PLAY						                                        ; NO-> NORMAL PLAY START
	

	
	LDA #$00						                                                    ; SET DO KICKOFF = FALSE
	STA SIM_DO_KICKOFF_BOOL						                                        ;
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET CURRENT TEAM WITH POSESSION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_CURRENT_TEAM_WITH_BALL						                                ;
	STA SIM_LAST_TEAM_WITH_BALL 						                                ; SET LAST TEAM WITH POSSESION = OTHER TEAM
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM INDEX = OTHER TEAM = SWAP POSESSION
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	LDA #FIRST_DOWN						                                                ; SET DOWN = FIRST DOWN 
	STA DOWN						                                                    ;
	LDA #YARDS_FOR_FIRST_SIM						                                     ; SET YARDS NEEDED FOR FIRST DOWN  = 10
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;
	LDX TEAM_ON_OFFENSE						                                            ; 
	LDA P2_TOTAL_SCORE						                                            ; SET KICKING TEAM SCORE AND OPPOSING TEAM SCORE 
	
@set_team_scores_for_cpu_kick_logic:													;

onside_boolean = LOCAL_3
	
	STA TEAM_SCORES_FOR_CPU_LOGIC[],X						                            ;
	TXA							                                                        ;
	EOR #$01						                                                    ;
	TAX							                                                        ;
	LDA P1_TOTAL_SCORE						                                            ;
	STA TEAM_SCORES_FOR_CPU_LOGIC[],X						                            ;
	JSR CHECK_FOR_COM_ONSIDES_KICK					                                    ; DO CPU ONSIDE KICK LOGIC()
	BIT onside_boolean						                                            ; DO ONSIDE KICK?
	BMI @do_onsides_kick						                                        ; YES->DO ONSIDE KICK START
	JSR DO_SIM_KICKOFF					                                                ; DO SIM KICKOFF
	JMP @kickoff_over						                                            ; JUMP-> KICKOFF COMPLETED

@do_onsides_kick:							                                                        ; DO ONSIDE KICK START
	JSR DO_SIM_ONSIDES_KICK					                                            ; DO SIM ONSIDE KICK()

@kickoff_over:							                                                ; KICKOFF COMPLETED
	LDA SIM_DO_KICKOFF_BOOL						                                        ; IS DO KICKOFF = TRUE
	BNE @exit_to_sim_loop						                                        ; YES-> END OF PLAY START
	
	
	LDA #YARDS_FOR_FIRST_SIM							                                ; SET YARDS NEEDED FOR FIRST DOWN = 10
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; DOES CURRENT TEAM WITH POSSESSION = LAST TEAM WITH POSESSION
	EOR SIM_LAST_TEAM_WITH_BALL 						                                ;
	BNE @swap_possession_of_ball						                                ; NO->NEW TEAM HAS POSESSION OF BALL

_END_WHILE						                                                    	; YES->SIM LOOP

@swap_possession_of_ball:							                                     ; NEW TEAM HAS POSESSION OF BALL 
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET CURRENT TEAM WITH POSSESSION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_CURRENT_TEAM_WITH_BALL						                                ;
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = OTHER TEAM = SWAP POSESSION 
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	LDA #LENGTH_OF_FIELD_YARDS_SIM						                                ; SET DISTANCE FROM ENDZONE = 100 - DISTANCE FROM ENDZONE
	SEC							                                                        ;
	SBC SIM_DISTANCE_FROM_ENDZONE						                                ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;

@exit_to_sim_loop:							                                            ; 
	JMP MAIN_SIM_LOOP						                                            ; JUMP-> SIM LOOP

_F}_MAIN_SIM_LOOP

_F{_GET_AND_DO_SIM_PLAY_TYPE															; DONE

SIM_DO_NORMAL_PLAY:							                                            ; NORMAL PLAY START

IN_GAME_KICKER_ROSTER_ID		= P1_K_STARTER + 1 

	LDX TEAM_ON_OFFENSE						                                            ; IS CURRENT TEAM  = P1
	BEQ @save_qb_id						                                                    ; YES->CHECK FOR PLAY CALL
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; ADD OFFSET TO PLAYER 2 STARTERS

@save_qb_id:							                                                ; CHECK FOR PLAY CALL
	LDA GAME_PLAYERS[]+1,X						                                        ; LOAD CURRENT TEAM  QB ID
	STA SIM_QB_ID						                                                ; 
	JSR GET_SIM_PLAY_CALLS					                                            ; GET P1 AND P2 PLAY CALL()
	LDX TEAM_ON_OFFENSE						                                            ;
	LDA SIM_PLAY_CALLS[],X						                                        ; IS OFFENSE PLAY CALL  >= PASS PLAY CALL
	CMP #PASS_CALL_ID						                                            ; 
	BCS @check_for_fg_or_punt					                                        ; YES->CHECK FOR PASS PLAY, FG, PUNT 
	
@do_sim_run_play	
	LDA #NORMAL_RUN_SIM_PLAY_TYPE						                                                    ; SET PLAY TYPE = RUN	
	STA SIM_PLAY_TYPE						                                            ; 
	JSR DO_SIM_RUN_PLAY					                                                ; DO RUN PLAY()
	JMP @do_end_of_play					                                                    ; 

@check_for_fg_or_punt:							                                        ; CHECK FOR PASS PLAY, FG, PUNT 
	CMP #PUNT_PLAY_CALL_ID						                                                    ; IS OFFENSE PLAY CALL  = PUNT OR FG?
	BCS @check_for_punt					                                                ; YES-> HECK FOR PUNT = 0X08
	

@do_sim_pass: 	
	LDA #PASS_SIM_PLAY_TYPE						                                                    ; SET PLAY TYPE = PASS
	STA SIM_PLAY_TYPE						                                            ;
	JSR DO_SIM_PASS_PLAY					                                            ; DO PASS PLAY ()
	JMP @do_end_of_play	

@check_for_punt:							                                             ; CHECK FOR PUNT = 0X08
	CMP #FG_PLAY_CALL_ID						                                                    ; IS PLAY CALL >= FG
	BCS @check_for_fg					                                                ;
	
@do_sim_punt:	
	JSR DO_SIM_PUNT					                                                    ; DO PUNT()	
	JMP @do_end_of_play							                                         ; JUMP->DO END OF PLAY

@check_for_fg:							                                                ; CHECK FOR FG = 0X09
	CMP #FG_PLAY_CALL_ID +1 						                                    ; IS PLAY CALL = ?
	BEQ @do_sim_fake_fg_unused						                                                    ;	
	
@do_sim_field_goal:	
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM INDEX 
	BEQ @save_kicker_id						                                                    ;
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; ADD OFFSET TO PLAYER 2 STARTERS

@save_kicker_id:
	LDA IN_GAME_KICKER_ROSTER_ID,X						                                ; SET TEMP PLAYER ID = KICKER ID
	STA SIM_CURRENT_STARTER_ID						                                    ; 
	LDX #UPDATE_FG_ATT_IN_GAME_INDEX						                            ; SET STAT TO UPDATE = FG ATT
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	JSR CHECK_FOR_XP_FG_MAKE_OR_MISS					                                ; CHECK FOR XP/FG MAKE OR MISS()
	BCS @sim_fg_missed						                                            ;
	

@sim_fg_made:	
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD KICKER ID	
	LDX #UPDATE_FG_MADE_IN_GAME_INDEX						                                                    ; SET STAT TO UPDATE = FG MADE
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA #FG_POINTS						                                                ; SET PTS TO ADD TO QUARTER SCORE = FG POINTS
	STA SIM_PTS_TO_ADD_TO_SCORE						                                    ; 
	JSR SIM_UPDATE_QTR_TOTAL_SCORE					                                    ; UPDATE TEAM QTR AND TOTAL SCORE($6F= P1 OR P2 TEAM INDEX)
	JSR SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()
	JMP @do_end_of_play						                                            ; JUMP->DO END OF PLAY

@sim_fg_missed:							                                                ; FG MISS 
	LDA #$00						                                                    ; SET DO KICKOFF = FALSE
	STA SIM_DO_KICKOFF_BOOL						                                        ;
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET LAST TEAM WITH POSSESION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_LAST_TEAM_WITH_BALL 						                                ;
	JSR SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()
	JMP @do_end_of_play						                                            ; JUMP->DO END OF PLAY

@do_sim_fake_fg_unused:							                                        ; PLAY CALL IS FAKE FG/ PUNT? NOT USED	
	LDA #PASS_SIM_PLAY_TYPE							                                    ; SET PLAY TYPE = PASS
	STA SIM_PLAY_TYPE						                                            ;
	JSR DO_SIM_FAKE_PUNT_FG_PASS_NOT_USED					                            ; FAKE/FG PUNT PASS()  NOT USED	

@do_end_of_play:							                                            ; DO END OF PLAY
	LDA SIM_DO_KICKOFF_BOOL						                                        ; IS DO KICKOFF = TRUE
	BNE @exit_to_sim_loop					                                            ; NO->GO TO START OF SIM LOOP
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; IS CURRENT TEAM WITH POSSESSION = LAST TEAM WITH POSSESSION
	CMP SIM_LAST_TEAM_WITH_BALL 						                                ;
	BNE @sim_stop_on_downs_or_turnover						                            ; NO->STOP ON DOWNS OR TURNOVER
	INC DOWN						                                                    ; DOWN ++
	LDX DOWN						                                                    ;
	CPX #FOURTH_DOWN +1						                                                    ; IS DOWN = DOWN 5
	BEQ @sim_stop_on_downs_or_turnover						                            ; YES->STOP ON DOWNS OR TURNOVER

@exit_to_sim_loop:							                                            ; GO TO START OF SIM LOOP
	JMP MAIN_SIM_LOOP						                                            ; JUMP->SIM GAME LOOP

@sim_stop_on_downs_or_turnover:							                                                    ; STOP ON DOWNS OR TURNOVER
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET TEAM WITH CURRENT POSESSION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_CURRENT_TEAM_WITH_BALL						                                ;
	LDA TEAM_ON_OFFENSE						                                            ; SET TEAM INDEX = OTHER TEAM
	EOR #$01						                                                    ; 
	STA TEAM_ON_OFFENSE						                                            ;
	LDA #LENGTH_OF_FIELD_YARDS_SIM						                                ; SET DISTANCE FROM ENDZONE = 100 - DISTANCE FROM ENDZONE
	SEC							                                                        ;
	SBC SIM_DISTANCE_FROM_ENDZONE						                                ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;
	LDA #$00						                                                    ; SET DOWN = FIRST DOWN
	STA DOWN						                                                    ;
	LDA #YARDS_FOR_FIRST_SIM						                                    ; SET YARDS NEED FOR FIRST DOWN  = 10
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;
	JMP MAIN_SIM_LOOP						                                                    ; JUMP->SIM GAME LOOP

_F}_GET_AND_DO_SIM_PLAY_TYPE

_F{_LOAD_SIM_DATA																		; DONE

team_side_index							= LOCAL_1
current_data_index						= LOCAL_2

temp_sim_data_value_one					= LOCAL_3	
temp_sim_data_value_two					= LOCAL_4


in_game_starter_index					= LOCAL_5
team_sim_data_addr						= LOCAL_7

QB_STARTER_ROSTER_IDS[]					= GAME_PLAYERS[] + 1
SKILL_STARTER_ROSTER_IDS[]				= GAME_PLAYERS[] + 3

SIZE_OF_QB_SIM_DATA_VALUES  			= $04
SIZE_OF_SKILL_PLAYER_SIM_DATA_VALUES	= $14
SIZE_OF_DEFENDER_SIM_DATA_VALUES		= $16

OFFSET_TO_P2_SIM_MEMORY_VALUES			= $05


LOAD_SIM_VALUES_FROM_ROM_TO_RAM:							                            ; TRANSFER SIM VALUES FROM ROM TO RAM()
	LDA #$00						                                                    ; 
	STA in_game_starter_index						                                    ; SET PLAYER INDEX = FIRST PLAYER
	STA team_side_index						                                            ; SET TEAM INDEX = PLAYER 1


LOAD_SIM_VALUES_FROM_ROM_TO_RAM_LOOP:	
	LDX team_side_index						                                            ; LOAD CURRENT TEAM
	LDA TEAM_IDS_IN_GAME[],X						                                    ;
	ASL							                                                        ; SHIFT SINCE EACH POINTER IS TWO BYTES
	TAX							                                                        ;

@load_team_sim_data_addr:	
	LDA TEAM_SIM_DATA_POINTER_TABLE,X				                                    ; SAVE CURRENT TEAM SIM ADDRESS FROM TEAMS SIM ADDR TABLE
	STA team_sim_data_addr						                                        ;
	LDA TEAM_SIM_DATA_POINTER_TABLE+1,X			                                        ;
	STA team_sim_data_addr + 1						                                    ;

	
	LDX in_game_starter_index					                                        ; LOAD QB STARTER ID
	LDA QB_STARTER_ROSTER_IDS[],X						                                   ;
	STA SIM_TEMP_VARIABLE_ONE						                                    ; SAVE IN $3BC
	ASL							                                                        ; SHIFT FOR TWO BYTE INDEX TO TEAM SIM DATA
	TAY							                                                        ; 
	JSR SIM_GET_CONDITION_MODIFIER_VALUE					                            ; SAVE CONDITION VALUE MODIFIER -2 TO 4 IN $3BC BASED ON CONDITION()
	
	
@load_first_two_sim_bytes:	
	LDA (team_sim_data_addr),Y						                                    ; SAVE NEXT TWO TEAM SIM BYTES IN $40,$41
	STA temp_sim_data_value_one						                                    ;
	INY							                                                        ;
	LDA (team_sim_data_addr),Y						                                    ;
	STA temp_sim_data_value_two						                                    ;
	LDX team_side_index						                                            ; LOAD CURRENT TEAM INDEX

@load_qb_rushing_sim_value:	
	LDA temp_sim_data_value_one						                                    ; LOAD SIM BYTE
	LOG_SHIFT_RIGHT_4																	; SHIFT OUT SECOND NIBBLE
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ;
	LDA SIM_YARDAGE_VALUES,Y			                                                ; SAVE QB SIM RUSHING VALUE IN QBS SIM RUSHING VALUES 
	STA SIM_QB_RUSHING_SIM_VALUE[],X						                            ;

@load_qb_passing_sim_value:	
	LDA temp_sim_data_value_one						                                     ; MASK OUT FIRST NIBBLE
	AND #$0F						                                                    ;
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                     ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ; 
	LDA SIM_PASS_REC_VALUES,Y			                                                ; SAVE SIM PASSING VALUE IN QBS SIM PASSING VALUES
	STA SIM_QB_PASS_SIM_VALUE[],X						                                ; 

@load_qb_scramble_sim_value:	
	LDY temp_sim_data_value_two						                                    ;
	LDA SIM_POCKET_VALUES,Y				                                                ; SAVE SIM POCKET VALUE IN QBS SIM POCKET VALUES
	AND #$03						                                                    ; bitmask to keep sim scramble values from 0-3 
	STA SIM_QB_SCRAMBLE_SIM_VALUE[],X						                            ;
	
	
	LDA #$00						                                                    ; SET SKILL PLAYER INDEX = FIRST SKILL PLAYER STARTER
	STA current_data_index						                                        ;
	LDA team_sim_data_addr						                                        ; = CURRENT TEAM SEAM VALUE ADDRESS + 4 BYTES = 
	CLC							                                                        ; GO TO START OF SKILL SIM PLAYER SIM VALUES
	ADC #SIZE_OF_QB_SIM_DATA_VALUES						                     ;
	STA team_sim_data_addr						                                        ;
	BCC @transfer_skill_player_values						                            ;
	INC team_sim_data_addr + 1						                                    ;

@transfer_skill_player_values:							                                ; TRANSFER SKILL PLAYER SIM VALUES TO RAM LOOP
	
_WHILE NOT_EQUAL	
	LDA current_data_index						                                        ;
	ASL							                                                        ;
	CLC							                                                        ;
	ADC in_game_starter_index						                                    ;
	TAX							                                                        ; 
	LDA SKILL_STARTER_ROSTER_IDS[],X						                            ; SAVE SKILL PLAYER STARTER ID
	STA SIM_TEMP_VARIABLE_ONE						                                    ;
	SEC							                                                        ;
	SBC #$02						                                                    ; 
	ASL							                                                        ;
	TAY							                                                        ;
	JSR SIM_GET_CONDITION_MODIFIER_VALUE					                            ; SAVE CONDITION VALUE MODIFIER -2 TO 4 IN $3BC BASED ON CONDITION()
	LDA team_side_index						                                            ; IS CURRENT TEAM = P1
	BEQ @get_next_two_sim_bytes						                                    ; YES BRANCH TO
	LDA #OFFSET_TO_P2_SIM_MEMORY_VALUES						                            ; ADD OFFSET TO PLAYER 2 

@get_next_two_sim_bytes:							                                    ;
	CLC							                                                        ;
	ADC_ABS_ZP current_data_index						                                        ;
	TAX							                                                        ;
	LDA (team_sim_data_addr),Y						                                    ; SAVE NEXT TWO TEAM SIM BYTES IN $40,$41
	STA temp_sim_data_value_one						                                    ;
	INY							                                                        ;
	LDA (team_sim_data_addr),Y						                                    ;
	STA temp_sim_data_value_two						                                    ;
	
	LDA temp_sim_data_value_one						                                    ;
	LOG_SHIFT_RIGHT_4
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ;
	LDA SIM_YARDAGE_VALUES,Y			                                                ; SAVE PLAYER SIM RUSHING VALUE IN PLAYERS SIM RUSH YD VALUES 
	STA SIM_SKILL_RUSHING_SIM_VALUE[],X						                            ;
	
	LDA temp_sim_data_value_one						                                    ; LOAD PLAYER RECEIVING SKILL
	AND #$0F						                                                    ; MASK OUT UPPER NIBBLE
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ; 
	LDA SIM_PASS_REC_VALUES,Y			                                                ; SAVE PLAYER SIM RECEIVING VALUE IN PLAYERS SIM RECEiv VALUES 
	STA SIM_SKILL_REC_SIM_VALUE[] ,X						                            ;
	
	LDA temp_sim_data_value_two						                                    ; 
	LOG_SHIFT_RIGHT_4
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ;
	LDA SIM_YARDAGE_VALUES,Y			                                                ; SAVE PLAYER SIM YARDAGE VALUE IN PLAYERS SIM RECEIVING VALUES 
	STA SIM_SKILL_REC_YARD_SIM_VALUE[],X						                        ;
	
	LDA temp_sim_data_value_two						                                     ;
	AND #$0F						                                                    ; MASK OUT UPPER NIBBLE
	TAY							                                                        ;
	LDA SIM_TARGET_VALUES,Y				                                                ; SAVE PLAYER SIM TARGET CHANCE FROM SIM TARGET CHANCE TABLE
	STA SIM_TARGET_CHANCE_SIM_VALUE[],X						                            ; 
	INC current_data_index						                                        ; PLAYER INDEX++
	LDA current_data_index						                                        ; IS PLAYER INDEX > LAST SKILL PLAYER STARTER
	CMP #NUMBER_OF_NON_QB_SKILL_STARTERS						                        ;

_END_WHILE						                                                    	; NO ->TRANSFER SKILL PLAYER SIM VALUES TO RAM LOOP

@load_kick_returner_sim_values:		
	LDX in_game_starter_index						                                    ;
	LDA CURRENT_IN_GAME_KR_ID,X						                                    ; LOAD KICK RETURNER STARTER ID
	STA SIM_TEMP_VARIABLE_ONE						                                    ;
	ASL							                                                        ;
	TAY							                                                        ;
	JSR SIM_GET_CONDITION_MODIFIER_VALUE					                            ; SAVE CONDITION VALUE MODIFIER -2 TO 4 IN $3BC BASED ON CONDITION()
	LDX team_side_index						                                            ;
	LDA (team_sim_data_addr),Y						                                    ;
	LOG_SHIFT_RIGHT_4
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ;
	LDA SIM_YARDAGE_VALUES,Y			                                                ; SAVE SIM KICK RETURN VALUE  IN SIM KICK RETURN VALUES 
	STA SIM_KR_SIM_VALUE[],X						                                ;
	
@load_punt_returner_sim_values:	
	LDX in_game_starter_index						                                    ;
	LDA CURRENT_IN_GAME_PR_ID,X						                                   ; LOAD PUNT RETURNER STARTER ID
	STA SIM_TEMP_VARIABLE_ONE						                                    ;
	ASL							                                                        ;
	TAY							                                                        ;
	JSR SIM_GET_CONDITION_MODIFIER_VALUE					                            ; SAVE CONDITION VALUE MODIFIER -2 TO 4 IN $3BC BASED ON CONDITION()
	LDX team_side_index						                                            ;
	LDA (team_sim_data_addr),Y						                                    ;
	LOG_SHIFT_RIGHT_4
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ;
	LDA SIM_YARDAGE_VALUES,Y			                                                ;
	STA SIM_PR_SIM_VALUE[],X						                                    ;
	LDA team_sim_data_addr						                                        ; SIM STATS ADDRESS =  SIM STATS ADDRESS + LENGTH OF SKILL PLAYERS SIM VALUES
	CLC							                                                        ;
	ADC #SIZE_OF_SKILL_PLAYER_SIM_DATA_VALUES						                        ;
	STA team_sim_data_addr						                                        ;
	BCC @check_team_side_for_defenders						                            ;
	INC team_sim_data_addr + 1						                                    ;
	
@check_team_side_for_defenders:
	LDX team_side_index						                                            ; IS CURRENT TEAM = P1
	BEQ @load_sim_def_sack_values						                                ; YES->LOAD DEFENSIVE PLAYER SIM SACK VALUES ($410 -$41A, $41B-425)
	LDX #NUM_DEFENDERS_ON_FIELD						                            		; ADD OFFSET TO PLAYER 2 DEFENSIVE SIM VALUES

@load_sim_def_sack_values:							                                    ; LOAD DEFENSIVE PLAYER SIM SACK VALUES ($410 -$41A, $41B-425)
	LDY #$00						                                                    ; SET PLAYER INDEX = FIRST DEFENDER

_WHILE NOT_EQUAL							                                            ; 
	
	LDA (team_sim_data_addr),Y						                                    ; 
	STA SIM_DEF_SACK_SIM_VALUE[],X						                                ; SAVE SIM SACK VALUE IN PLAYER SIM SACK VALUES 
	INX							                                                        ; SIM DATA ADDRESS++ 
	INY							                                                        ; PLAYER INDEX++
	CPY #NUM_DEFENDERS_ON_FIELD						                            ; HAVE WE LOADED ALL DEFENDERS? NO -> LOOP BACK TO LOAD DEFENSIVE PLAYER SIM SACK VALUES

_END_WHILE						                                                        ;

	LDX team_side_index						                                            ; IS CURRENT TEAM = P1
	BEQ @load_sim_def_int_values:						                                ;
	LDX #NUM_DEFENDERS_ON_FIELD						                            ;

@load_sim_def_int_values:	

_WHILE NOT_EQUAL						                                                ; LOAD DEFENSIVE PLAYER SIM INT VALUES ($426 -$430, $431-$43B)

	LDA (team_sim_data_addr),Y						                                    ;
	STA SIM_DEF_INT_SIM_VALUE[],X						                                ; SAVE SIM INT VALUE IN PLAYER SIM INT VALUES 
	INX							                                                        ; SIM DATA ADDRESS++
	INY							                                                        ; PLAYER INDEX++
	CPY #(NUM_DEFENDERS_ON_FIELD * 2 )						                        ;

_END_WHILE					                                                            ; HAVE WE LOADED ALL DEFENDERS? NO -> LOOP BACK TO LOAD DEFENSIVE PLAYER SIM INT VALUES
	

@update_sim_data_addr_after_defenders	
	LDA team_sim_data_addr						                                        ;
	CLC							                                                        ;
	ADC #SIZE_OF_DEFENDER_SIM_DATA_VALUES						                        ;
	STA team_sim_data_addr						                                        ; SIM STATS ADDRESS =  SIM STATS ADDRESS + LENGTH OF DEFENSIVE PLAYERS SIM VALUES
	BCC @load_sim_fg_xp_values						                                    ;
	INC team_sim_data_addr + 1						                                    ;

@load_sim_fg_xp_values:							                                        ; LOAD SIM KICKING PUNTING AND DEFENSE VALUES ()
	LDX in_game_starter_index						                                    ; LOAD CURRENT PLAYER INDEX
	LDA CURRENT_IN_GAME_KICKER_ID,X						                                                    ; LOAD KICKER ID 
	STA SIM_TEMP_VARIABLE_ONE						                                    ;
	JSR SIM_GET_CONDITION_MODIFIER_VALUE					                            ; SAVE CONDITION VALUE MODIFIER -2 TO 4 IN $3BC BASED ON CONDITION()
	LDX team_side_index						                                            ;
	LDY #$00						                                                    ;
	LDA (team_sim_data_addr),Y						                                    ; LOAD KICKING SIM VALUE
	STA temp_sim_data_value_one					                                        ;
	LOG_SHIFT_RIGHT_4						                                            ;
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ;
	LDA SIM_KICKING_VALUES,Y			                                                ; SAVE SIM KICKING VALUE IN PLAYERS SIM KICKING VALUES FROM SIM KICKING TABLE
	STA SIM_FG_XP_SIM_VALUE[],X						                                    ;
	
@load_sim_punting_values	
	LDX in_game_starter_index						                                    ;
	LDA CURRENT_IN_GAME_PUNTER_ID,X						                                ; LOAD PUNTER ID
	STA SIM_TEMP_VARIABLE_ONE						                                    ;
	JSR SIM_GET_CONDITION_MODIFIER_VALUE					                            ; SAVE CONDITION VALUE MODIFIER -2 TO 4 IN $3BC BASED ON CONDITION()
	LDX team_side_index						                                            ;
	LDA temp_sim_data_value_one						                                    ;
	AND #$0F						                                                    ; 
	JSR SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX					                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	TAY							                                                        ;
	LDA SIM_PUNTING_VALUES,Y			                                                ; SAVE SIM PUNTING VALUE IN PLAYERS SIM PUNTING VALUES FROM SIM PUNTING TABLE
	STA SIM_PUNT_YARD_SIM_VALUE[],X						                                ;
	
@load_sim_team_defense_values	
	LDY #$01						                                                    ; LOAD DEFENSE/DEFENSE SIM VALUE
	LDA (team_sim_data_addr),Y						                                    ; 
	STA temp_sim_data_value_one						                                    ; 
	LOG_SHIFT_RIGHT_4						                                            ;
	TAY							                                                        ; 
	LDA SIM_RUN_DEFENSE_VALUES,Y			                                            ; SAVE SIM RUSH DEFENSE VALUE IN SIM RUSH DEFENSE VALUES FROM SIM DEFENSE TABLE
	STA SIM_RUN_DEFENSE_SIM_VALUE[],X						                            ; 
	LDA temp_sim_data_value_one						                                     ; 
	AND #$0F						                                                    ; MASK OUT DEFENSE BIT 	
	TAY							                                                        ;
	LDA SIM_PASS_DEFENSE_VALUES,Y			                                            ; SAVE SIM PASS DEFENSE VALUE IN SIM PASS DEFENSE VALUESFROM SIM DEFENSE TABLE
	STA SIM_PASS_DEFENSE_SIM_VALUE[],X						                            ; 
	

number_of_run_plays_left 		= LOCAL_3
	
	LDA #NUM_RUN_PLAYS						                                            ;  
	STA number_of_run_plays_left					                                    ;
	LDX team_side_index						                                            ; IS CURRENT TEAM = P1
	BEQ @save_player_id_run_play						                                ;
	LDX #$04						                                                    ; SET NUMBER OF RUN PLAYS = 4
	
@save_player_id_run_play:							                                    ; SAVE PLAYER IDS FOR RUN PLAYS

_WHILE NOT_EQUAL
	
	LDA SIM_RUN_PLAY_POSITION_IDS[],X						                            ; LOAD POSITIONAL ID FOR RUN PLAY
	ASL							                                                        ;
	CLC							                                                        ;
	ADC in_game_starter_index						                                    ; 
	TAY							                                                        ;
	LDA CURRENT_IN_GAME_RUNNER_ID[],Y						                            ; SAVE PLAYER ID IN RUN PLAYS PLAYER IDS
	STA SIM_RUN_PLAY_STARTER_IDS[],X						                            ; 
	INX							                                                        ; RUN PLAY INDEX++
	DEC number_of_run_plays_left					                                    ; RUN PLAYS LEFT--

_END_WHILE 						                                						; ALL RUN PLAY PLAYERS TRANSFERED? NO-> LOOP BACK TO SAVE PLAYER IDS FOR RUN PLAYS

	LDA #P2_GAME_PLAYERS_OFFSET						                                    ; SET OFFSET TO P2 TEAM STARTERS
	STA in_game_starter_index						                                    ;
	INC team_side_index						                                            ; TEAM INDEX++ 
	LDA team_side_index						                                            ; 
	CMP #$02						                                                    ;
	BEQ @exit_load_sim_data						                                        ; BOTH TEAMS SIM VALUES TRANSFERRED
    JMP LOAD_SIM_VALUES_FROM_ROM_TO_RAM_LOOP
																						; NO-> LOOP BACK TO TRANSFER SIM VALUES FROM ROM TO RAM()

@exit_load_sim_data:
	RTS							                                                        ; RETURN

_F}_LOAD_SIM_DATA

_F{_GET_SIM_CONDITION_MODIFIER															; DONE

team_side_index					= LOCAL_1
P2_SIDE_SIM_CONDITION_INDEX		= $08

SIM_GET_CONDITION_MODIFIER_VALUE:							                           ; SAVE CONDITION VALUE MODIFIER -2 TO 4 IN $3BC BASED ON CONDITION()
	LDX team_side_index						                                            ; DOES TEAM INDEX = PLAYER 1 INDEX
	BEQ @get_condition						                                            ; YES->GET CONDITION

@set_p2_side_index	
	LDX #P2_SIDE_SIM_CONDITION_INDEX						                           ; = SET OFFSET = PLAYER 2 OFFSET

@get_condition:							                                                 ; GET CONDITION
	STX SIM_TEMP_VARIABLE_TWO						                                    ; SET INDEX INTO PLAYER SIM DATA LENGTH
	LDA SIM_TEMP_VARIABLE_ONE						                                    ; LOAD PLAYER ID
	LOG_SHIFT_RIGHT_2
	CLC							                                                        ;
	ADC SIM_TEMP_VARIABLE_TWO						                                    ;
	TAX							                                                        ;
	LDA SIM_CONDITIONS[],X						                                        ; LOAD CONDITION BYTE
	STA SIM_TEMP_VARIABLE_TWO						                                    ;
	LDA SIM_TEMP_VARIABLE_ONE						                                    ; LOAD PLAYER ID
	AND #$03						                                                    ; 
	TAX							                                                        ;
	LDA SIM_TEMP_VARIABLE_TWO						                                    ;

_WHILE NOT_EQUAL							                                            ;
	CPX #$03						                                                    ;
	BEQ @add_condition_modifier						                                    ;
	LOG_SHIFT_RIGHT_2						                                            ;
	INX							                                                        ;

_END_WHILE					                                                    		;

@add_condition_modifier:							                                    ;
	AND #$03						                                                    ;
	ASL							                                                        ; SHIFT FOR INDEX INTO TABLE
	STA SIM_TEMP_VARIABLE_TWO						                                    ;
	LDA RANDOM_1						                                                ; LOAD RANDOM 3B()
	AND #$01						                                                    ;
	CLC							                                                        ;
	ADC SIM_TEMP_VARIABLE_TWO						                                    ;
	TAX							                                                        ;
	LDA SIM_CONDITION_MODIFIER_TABLE,X					                                ; SET VALUE BETWEEN -2 AND 4
	STA SIM_TEMP_VARIABLE_ONE						                                    ;
	JMP SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE () 
	
_F}_GET_SIM_CONDITION_MODIFIER	

_F{_ADD_SIM_CONDITION_MODIFIER_TO_SKILL_INDEX											; DONE

SIM_ADD_CONDITION_MODIFIER_TO_SKILL_INDEX:							                    ; ADD CONDITION MODIFIER TO SKILL INDEX WITH MAX AND MIN(A= SKILL INDEX, $3BC= COND MODIFIER)
	CLC							                                                        ; 
	ADC SIM_TEMP_VARIABLE_ONE						                                    ; = SIM VALUE SKILL INDEX + CONDITION MODIFIER
	BPL @check_if_exceeds_max						                                    ;
	LDA #$00						                                                    ; SET MINIMUM SKILL INDEX = 0
	RTS							                                                        ;

@check_if_exceeds_max:							                                         ; 
	CMP #MAX_SKILL						                                                ; SET MAXIMUM SKILL INDEX = MAX SKILL
	BCC @exit						                                                    ;
	LDA #MAX_SKILL						                                                    ;

@exit:							                                                        ; 
	RTS							                                                        ; RETURN

_F}_ADD_SIM_CONDITION_MODIFIER_TO_SKILL_INDEX	

_F{_GET_SIM_PLAY_CALL																	; DONE

cpu_play_call			= LOCAL_3
temp_field_yards 		= LOCAL_7
temp_yards_for_first	= LOCAL_5

GET_SIM_PLAY_CALLS:							                                            ; GET P1 AND P2 PLAY CALL()


@convert_sim_yards_to_field_yards:
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; LOAD DISTANCE FROM ENDZONE 
	STA temp_field_yards					                                            ;
	LDA #$00						                                                    ;
	
@yards_times_eight:	
	ASL temp_field_yards						                                        ;
	ROL							                                                        ;
	ASL temp_field_yards						                                        ;
	ROL							                                                        ;
	ASL temp_field_yards						                                        ;
	ROL							                                                        ;
	STA temp_field_yards +1						                                        ;
	
	LDA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ; LOAD YARDS NEEDED FOR A FIRST DOWN
	STA temp_yards_for_first						                                    ;
	LDA #$00						                                                    ;
	ASL temp_yards_for_first						                                    ;
	ROL							                                                        ;
	ASL temp_yards_for_first						                                    ;
	ROL							                                                        ;
	ASL temp_yards_for_first						                                    ;
	ROL							                                                        ;
	STA temp_yards_for_first+1						                                    ;
	
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SAVE TEAM WITH POSESSION IN 9E
	STA CPU_SIDE_SAME_AS_OFF_BOOL						                                
	
	LDA P1_TOTAL_SCORE						                                            ; SAVE P1 TOTAL SCORE IN $9F
	STA CPU_OFF_SCORE						                                            ;
	
	LDA P2_TOTAL_SCORE						                                            ; SAVE P2 TOTAL SCORE IN $A0
	STA CPU_OPP_SCORE						                                            ;
	
	LDA P1_TEAM_OFFENSIVE_STYLE						                                    ; LOAD P1 OFFENSIVE PREFERENCE
	STA OFFENSIVE_STYLE						                                            ;
	JSR COM_PLAY_CALL_LOGIC_START					                                            ; DO COM PLAY CALL LOGIC ()
	
	LDA cpu_play_call						                                            ; SAVE OFFENSE PLAY CALL DECISION IN $3B3
	STA SIM_PLAY_CALLS[]						                                        ; SAVE OFFENSE PLAY CALL


@swap_to_get_defense_play_call	
	LDA CPU_SIDE_SAME_AS_OFF_BOOL						                                ; SWAP TEAM WITH POSESSION() 
	EOR #$80						                                                    ;
	STA CPU_SIDE_SAME_AS_OFF_BOOL						                                ;
	
	LDA CPU_OFF_SCORE						                                            ;
	TAX							                                                        ;
	LDA CPU_OPP_SCORE						                                            ;
	STA CPU_OFF_SCORE						                                            ;
	STX CPU_OPP_SCORE						                                            ;
	LDA P2_TEAM_OFFENSIVE_STYLE						                                    ; LOAD P2 OFFENSIVE PREFERENCE
	STA OFFENSIVE_STYLE						                                            ;
	JSR COM_PLAY_CALL_LOGIC_START					                                            ; DO COM PLAY CALL LOGIC ()
	LDA cpu_play_call						                                             ;
	STA SIM_PLAY_CALLS[]	+1					                                        ; SAVE DEFENSE PLAY CALL
	RTS							                                                        ; RETURN

_F}_GET_SIM_PLAY_CALL

_F{_DO_SIM_RUN_PLAY																		; DONE
											                                            ; EACH RUSH SIM VALUE OF 0X05 ADDS ~0.5 YARD PER CARRY
																						; EACH DEF RUSH SIM VALUE OF 0X10 SUBTRACTS ~0.25 YARDS PER CARRY 
																						
cond_adjust_sim_value			= LOCAL_1																						
sim_run_play_call 				= LOCAL_7
sim_rush_value					= LOCAL_8
sim_run_def_value				= LOCAL_8

final_sim_run_compare_value		= LOCAL_1




OFFSET_TO_P2_RUNNER_IDS			= $04	
OFFSET_TO_P2_SIM_RUSH_VALUES	= $05
											                                           
DO_SIM_RUN_PLAY:						                                                ; DO RUN PLAY()
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM INDEX
	LDA SIM_PLAY_CALLS[],X						                                        ; SAVE PLAY CALL
	STA sim_run_play_call						                                        ;
	LDA TEAM_ON_OFFENSE						                                            ; SAVE P1 OR P2 TEAM INDEX
	STA SIM_CURRENT_TEAM						                                    ; 
	BEQ @get_runner_starter_id						                                    ;
	
@set_to_side_two_runners:	
	LDA #OFFSET_TO_P2_RUNNER_IDS							                             ; SET OFFSET TO PLAYER 2 RUN PLAY STARTER IDS

@get_runner_starter_id:
	CLC							                                                        ;
	ADC sim_run_play_call						                                        ;
	TAX							                                                        ; 
	LDA SIM_RUN_PLAY_STARTER_IDS[],X						                            ; LOAD RUN PLAY STARTER ID
	STA SIM_CURRENT_STARTER_ID						                                    ; SAVE PLAYER ID
	CMP SIM_QB_ID						                                                ; IS RUNNER = QB 
	BNE @skill_player_run						                                         ; NO-> RUNNER IS NOT QB

@qb_run:
	LDX #UPDATE_QB_RUSH_ATT_IN_GAME_INDEX						                        ; LOAD INCREASE QB RUSHING ATTEMPT COMMAND
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDX TEAM_ON_OFFENSE						                                            ;
	LDA SIM_QB_RUSHING_SIM_VALUE[],X						                            ; LOAD QB SIM RUSHING VALUE
	STA sim_rush_value						                                            ;
	LDA #QB_SCRAMBLE_SIM_PLAY_TYPE						                                 ; SET PLAY TYPE = QB RUN
	STA SIM_PLAY_TYPE						                                            ;
	BNE DO_SIM_RUN_OR_QB_SCRAMBLE_PLAY					                                ; BRANCH->SET TIME TAKEN AND RUSHING YARDS GAINED ON THE SIM RUN PLAY

@skill_player_run:							                                           ; RUNNER IS NOT QB
	LDA SIM_RUN_PLAY_POSITION_IDS[],X						                            ; SAVE RUN PLAY POSITION ID IN POSITION ID
	STA SIM_CURRENT_POSITION_ID						                                    ;
	LDX TEAM_ON_OFFENSE						                                            ; DOES CURRENT TEAM INDEX  = P1
	BEQ @get_sim_rush_value						                                                    ; YES- LOAD SIM RUSHING VALUE AND ADD RUSHING ATTEMPT
	

@add_offset_to_player_2_sim_values	
	CLC							                                                        ;
	ADC #OFFSET_TO_P2_SIM_RUSH_VALUES						                            ; ADD OFFSET TO P2 RUSH SIM VALUE

@get_sim_rush_value:							                                                        ; LOAD SIM RUSHING VALUE AND ADD RUSHING ATTEMPT
	TAX							                                                        ; LOAD CURRENT TEAM INDEX
	DEX							                                                        ; 
	LDA SIM_SKILL_RUSHING_SIM_VALUE[],X						                            ; LOAD PLAYER SIM RUSHING VALUE 
	STA sim_rush_value						                                                        ;
	
@add_rushing_attempt_to_in_game_stat:	
	LDX #UPDATE_RUN_ATT_IN_GAME_INDEX						                            ; LOAD INCREASE SKILL PLAYER RUSHING ATTEMPT COMMAND
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES

DO_SIM_RUN_OR_QB_SCRAMBLE_PLAY:							                                ; SET TIME TAKEN AND RUSHING YARDS GAINED ON THE SIM RUN PLAY
	INC SIM_PLAYER_TACKLED_BOOL						                                    ; SET PLAYER TACKLED = TRUE
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM INDEX
	INC SIM_TEAM_RUSHING_ATT[],X						                                ; TEAM RUSHING ATTEMPT++
								                                                        ; SET RUSH PLAY TIME = 10  TO 40 SECONDS
	SET_SIM_PLAY_TIME[min_max_rand] 10,40,RANDOM_1							
	
	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 80,100,RANDOM_2  
	
	LDA cond_adjust_sim_value						                                    ; SAVE SIM VALUE
	STA SIM_TEMP_VARIABLE_ONE						                                    ; 
	
	LDA TEAM_ON_OFFENSE						                                            ;
	EOR #$01						                                                    ;
	TAX							                                                        ;
	LDA SIM_RUN_DEFENSE_SIM_VALUE[],X						                            ; LOAD TEAM SIM RUN DEFENSE VALUE
	STA sim_run_def_value						                                        ;
	JSR SET_DEFENSE_SIM_VALUE_BASED_ON_PLAY_CALL					                    ; SET FINAL VALUE BASED ON PLAY CALL ($45= RUN OR PASS DEFENSE SIM VALUE)
	
	LDA final_sim_run_compare_value+1						                            ;
	BNE @set_to_minimum_run_outcome						                                ;
	LDA SIM_TEMP_VARIABLE_ONE						                                    ; = OFFENSE VALUE - DEFENSE VALUE
	SEC							                                                        ;
	SBC final_sim_run_compare_value						                                ;
	BCS @check_for_run_range_one						                                ;
	LDA #$00						                                                    ;
	
								                                                        ; CHECK VALUE TO SET POSSIBLE OUTCOME FOR THE SIM RUN
@check_for_run_range_one:							                                    ; 
	CMP #$34						                                                    ; 
	BCS @check_for_run_range_two						                                ;

@set_to_minimum_run_outcome:							                                ; SET YARDAGE = -3 TO 1 	
	LDY #$FD						                                                    ; SET MIN YARDAGE =  -3
	LDX #$04						                                                    ; SET MAX ADDITIONAL RANGE = 4
	BNE @calculate_run_yardage						                                                    ;

@check_for_run_range_two:							                                    ;
	CMP #$67
	BCS @check_for_run_range_three

@set_to_run_outcome_two:								                                ; SET RUN YARDAGE = 1 TO 6
	LDY #$01						                                                    ; SET MIN YARDAGE =  1				
	LDX #$05						                                                    ; SET MAX ADDITIONAL RANGE = 5
	BNE @calculate_run_yardage

@check_for_run_range_three:
	CMP #$9A
	BCS @check_for_run_range_four

@set_to_run_outcome_three:								                                ; SET RUN YARDAGE = 4 TO 12
	LDY #$04						                                                    ; SET MIN YARDAGE =  4	
	LDX #$08						                                                    ; SET MAX ADDITIONAL RANGE = 8
	BNE @calculate_run_yardage

@check_for_run_range_four:
	CMP #$CD
	BCS @check_for_run_range_five

@set_to_run_outcome_four:									                            ; SET RUN YARDAGE = 7 TO 25
	LDY #$07						                                                    ; SET MIN YARDAGE =  7					
	LDX #$12						                                                    ; SET MAX ADDITIONAL RANGE = 18
	BNE @calculate_run_yardage

@check_for_run_range_five:
	LDA RANDOM_1						                                                ;
	CMP #$10						                                                    ; = 6.2% CHANCE BRANCH TO SET RUN YARDAGE = 10 TO 100 
	BCC @set_to_run_outcome_six						                                    ; 

@set_to_run_outcome_five:								                                ; SET RUN YARDAGE = 10 TO 45
	LDY #$0A						                                                    ; SET MIN YARDAGE =  10	
	LDX #$23						                                                    ; SET MAX ADDITIONAL RANGE = 35
	BNE @calculate_run_yardage

@set_to_run_outcome_six:							                                                        ; SET RUN YARDAGE = 10 TO 100
	LDY #$0A						                                                    ; SET MIN YARDAGE =  10	
	LDX #$5A						                                                    ; SET MAX ADDITIONAL RANGE = 90


@calculate_run_yardage:							                                        ; CALULATE RUN YARDAGE (X= MAX ADDITIONAL YARDS, Y= MIN)

min_yardage 			= LOCAL_7
abs_of_lost_yardage		= LOCAL_7

	STY min_yardage					                                                    ; SAVE MIN VALUE 
	LDA RANDOM_2						                                                ;
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC							                                                        ; = (RAND % * X)
	ADC min_yardage						                                                ; +  MIN YARDAGE
	STA SIM_PLAY_YARDAGE						                                        ; SAVE RUN YARDAGE IN PLAY YARDS
	LDA TEAM_ON_OFFENSE						                                            ; SET INDEX INTO TEAMS RUSH YARDS
	ASL							                                                        ;
	TAX							                                                        ;
	
@check_for_loss:	
	LDA SIM_PLAY_YARDAGE						                                        ; IS RUN YARDAGE NEGATIVE?
	BMI @sim_run_goes_for_loss						                                    ; YES-> SIM RUN PLAY GOES FOR LOSS
	
	
	CMP SIM_DISTANCE_FROM_ENDZONE						                                ; IS RUN YARDAGE < DISTANCE FROM ENDZONE 
	BCC @save_rush_yards						                                        ; YES->SIM RUN PLAY GOES FOR GAIN
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; PLAY YARDAGE = DISTANCE FROM ENDZONE

@save_rush_yards:							                                            ; SIM RUN PLAY GOES FOR GAIN
	CLC							                                                        ;
	ADC SIM_TEAM_RUSHING_YDS[],X						                                ; = TEAM RUN YARDS+ PLAY YARDAGE
	STA SIM_TEAM_RUSHING_YDS[],X						                                ;
	BCC @exit_save_rush						                                            ;
	INC SIM_TEAM_RUSHING_YDS[]+1,X						                                ;

@exit_save_rush
	JMP @update_game_state						                                        ; JUMP -> END OF RUN

@sim_run_goes_for_loss:							                                        ; SIM RUN PLAY GOES FOR LOSS
	EOR #$FF						                                                    ; ABSOLUTE VALUE (PLAY YARDAGE)
	CLC							                                                        ;
	ADC #$01						                                                    ;
	STA abs_of_lost_yardage							                                    ;
	LDA SIM_TEAM_RUSHING_YDS[],X						                                ; = TEAM RUN YARDS- PLAY YARDAGE
	SEC							                                                        ;
	SBC abs_of_lost_yardage							                                    ;
	STA SIM_TEAM_RUSHING_YDS[],X						                                ;
	BCS @update_game_state						                                        ;
	DEC SIM_TEAM_RUSHING_YDS[]+1,X						                                ;

@update_game_state:							                                            ; END OF SIM RUN 
	JSR SIM_CHECK_FOR_FD_TD_FUMBLE_INJURY					                                                    ; CHECK FOR FD, TD, STOP ON DOWNS, INJURY()
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()
	
_F}_DO_SIM_RUN_PLAY	

_F{_DO_SIM_PASS_PLAY																	; DONE

DO_SIM_PASS_PLAY:							                                            ; DO PASS PLAY()

sim_target_offset					= LOCAL_7
sim_rush_value						= LOCAL_8
OFFSET_TO_P2_TARGET_SIM_VALUES		= $05
OFFSET_TO_P2_TARGET_STARTER_IDS		= $2A												; = (P2_SKILL_STARTERS + 2) - P1_OL_STARTERS
MAX_PASS_OUTCOME_INDEX				= $02												; COMPLETE, INCOMPLET, SACK 

	LDX TEAM_ON_OFFENSE						                                            ; SAVE CURRENT TEAM INDEX
	STX SIM_CURRENT_TEAM						                                    ;
	LDA RANDOM_1						                                                ; 
	CMP SIM_QB_SCRAMBLE_SIM_VALUE[],X						                            ; IS RANDOM > SIM POCKET VALUE
	BCS @calculate_play_time						                                    ; YES-> TRIES TO PASS

@qb_scrambles: 	
	LDA SIM_QB_RUSHING_SIM_VALUE[],X						                            ; LOAD QB SIM RUSHING VALUE
	STA sim_rush_value						                                            ;
	LDA #PASS_SIM_PLAY_TYPE						                                        ; SET PLAY CALL = PASS PLAY FOR DEFENSE CALCULATION PURPOSES
	STA SIM_PLAY_CALLS[],X						                                        ;
	LDX #UPDATE_QB_RUSH_ATT_IN_GAME_INDEX						                        ; LOAD QB RUSHING ATTEMPT STAT COMMAND
	LDA SIM_QB_ID						                                                ; SET PLAYER ID = QB ID
	STA SIM_CURRENT_STARTER_ID						                                    ;
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA #QB_POSITION_ID						                                            ; SET POSITION ID = QB
	STA SIM_CURRENT_POSITION_ID						                                    ; 
	LDA #QB_SCRAMBLE_SIM_PLAY_TYPE						                                ; SET PLAY TYPE = QB RUN
	STA SIM_PLAY_TYPE						                                            ;
	JMP DO_SIM_RUN_OR_QB_SCRAMBLE_PLAY


@calculate_play_time:							                                        ; QB TRIES TO PASS
								                                                        ; SET PASS PLAY TIME = 5 TO 25 SECONDS
								
	SET_SIM_PLAY_TIME[min_max_rand] 5,25,RANDOM_2 							

	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDY #MAX_TARGETS						                                            ; SET NUMBER OF TARGETS TO CHECK = 5
	LDX TEAM_ON_OFFENSE						                                            ; IS CURRENT TEAM = P1?
	BEQ @save_index						                                                ; YES->CHECK FOR PASS TO TARGET LOOP
	LDX #OFFSET_TO_P2_TARGET_SIM_VALUES						                            ; SET OFFSET INTO PLAYER 2 TARGET LIKLIHOOD

@save_index:							                                                ;
	STX sim_target_offset					                                            ;
	LDA RANDOM_3

_WHILE NOT_EQUAL							                                            ; CHECK FOR PASS TO TARGET LOOP

	CMP SIM_TARGET_CHANCE_SIM_VALUE[],X						                            ; IS TARGET VALUE < RANDOM 
	BCC @save_target_index						                                        ; YES-> CHECK FOR PASS TO TARGET
	SEC							                                                        ;
	SBC SIM_TARGET_CHANCE_SIM_VALUE[],X						                            ; = RANDOM - TARGET LIKLIHOOD
	INX							                                                        ; CURRENT TARGET INDEX++
	DEY							                                                        ; NUMBER OF TARGETS TO CHECK--

_END_WHILE						                                                        ;

@pick_random_target:								                                    ; SET RANDOM TARGET TO THROW TO
	LDA RANDOM_1						                                                ; THROW TO RANDOM TARGET
	LDX #MAX_TARGETS-1						                                            ; *** BUG WILL NEVER THROW TO LAST TARGET SHOULD BE #$05
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC							                                                        ;
	ADC sim_target_offset						                                        ;
	TAX							                                                        ; SET TARGET INDEX

@save_target_index:							                                            ; CHECK FOR PASS TO TARGET
	STX SIM_TARGET_INDEX						                                        ; SAVE TARGET INDEX
	TXA							                                                        ;
	ASL							                                                        ; SHIFT SINCE STARTER ID ARRAY IS TWO BYTES PER STARTER
	STA SIM_CURRENT_STARTER_ID						                                    ; SAVE STARTER ID INDEX
	LDA TEAM_ON_OFFENSE						                                            ; IS CURRENT TEAM =  PLAYER 1
	BEQ CHECK_FOR_SIM_COMPLETION						                                ; YES->CHECK FOR SIM COMPLETION
	LDA #OFFSET_TO_P2_TARGET_STARTER_IDS						                        ; ADD PLAYER 2 STARTERS OFFSET = 42 BYTES

CHECK_FOR_SIM_COMPLETION:							                                    ; CHECK FOR SIM COMPLETION

adjusted_qb_sim_value			= LOCAL_1
adjusted_target_skill_value		= LOCAL_1

qb_pass_sim_value				= LOCAL_8
target_skill_value				= LOCAL_8
	


	CLC							                                                        ;
	ADC SIM_CURRENT_STARTER_ID						                                    ; = STARTER INDEX + P1/P2 OFFSET
	TAX							                                                        ;
	LDA CURRENT_IN_GAME_TARGET_ID[],X						                            ; LOAD ACTUAL PLAYER ID
	STA SIM_CURRENT_STARTER_ID						                                    ; SAVE ROSTER ID
	LDA SIM_TARGET_INDEX						                                        ; SET SIM RECEIVING TARGET INDEX = TARGET INDEX  - TEAM TARGET OFFSET
	SEC							                                                        ; 
	SBC sim_target_offset						                                        ;
	STA SIM_CURRENT_POSITION_ID						                                    ; 

@calculate_adjusted_qb_sim_value:	
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDX TEAM_ON_OFFENSE						                                            ; 
	LDA SIM_QB_PASS_SIM_VALUE[],X						                                ; LOAD QB SIM PASS_REC VALUE
	STA qb_pass_sim_value						                                        ; SAVE IN QB SIM PASS_REC VALUE 
	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 80,100,RANDOM_1								; SET ADJUST QB PASS SIM VALUE 
	LDA adjusted_qb_sim_value						                                    ;
	STA SIM_TEMP_VARIABLE_ONE						                                    ; SAVE QB SIM VALUE 

@calculate_adjusted_target_sim_value:	
	LDX SIM_TARGET_INDEX						                                        ; LOAD SIM RECEIVING TARGET INDEX
	LDA SIM_SKILL_REC_SIM_VALUE[],X						                                ; LOAD PLAYER SIM RECEIVING VALUE
	STA target_skill_value		                                                        ;
	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 70,100,RANDOM_1
	

@calculate_final_reception_sim_value	
	LDA SIM_TEMP_VARIABLE_ONE						                                    ; = QB ADJUSTED SIM VALUE + WR ADJUSTED SIM VALUE
	CLC							                                                        ;
	ADC adjusted_target_skill_value						                                ;
	BCC GET_SIM_PASS_DEFENSE_SIM_VALUE						                            ; VALUE < 0XFF? YES->

@set_max_reception_sim_value:	
	LDA #$FF						                                                    ;  SET PASS OFFENSE SIM VALUE = MAX

GET_SIM_PASS_DEFENSE_SIM_VALUE:							                                ; DO OFFENSIVE PASS SIM - DEFENSIVE PASS SIM 

adjusted_defense_value			= LOCAL_1
defense_sim_value				= LOCAL_8

@get_adjusted_defense_value:
	STA SIM_TEMP_VARIABLE_ONE						                                    ; SAVE QB + WR COMPLETION SIM VALUE 
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA TEAM_ON_OFFENSE						                                            ; LOAD OPPOSING TEAM INDEX
	EOR #$01						                                                    ;
	TAX							                                                        ;
	LDA SIM_PASS_DEFENSE_SIM_VALUE[],X						                            ; LOAD TEAM PASS DEFENSE VALUE
	STA defense_sim_value						                                         ;
	JSR SET_DEFENSE_SIM_VALUE_BASED_ON_PLAY_CALL					                    ; SET FINAL VALUE BASED ON PLAY CALL ($45= RUN OR PASS DEFENSE SIM VALUE)

@save_adjusted_defense_value:
	COPY_16_BIT_A[var1_var2] adjusted_defense_value, SIM_TEMP_VARIABLE_TWO				; SAVE PLAY CALL ADJUSTED PASS DEFENSE VALUE IN 3BD,3BE 
	
@check_if_high_byte_set_adjusted_defense
	BNE set_to_10pct_complete_chance					                                ; YES->10% COMPLETION CHANCE
	
@do_offense_minus_defense
	LDA SIM_TEMP_VARIABLE_ONE						                                    ; = QB + WR COMPLETION SIM VALUE
	SEC							                                                        ; - 
	SBC adjusted_defense_value						                                    ; PASS DEFENSE VALUE
	BCS CHECK_FOR_10PCT_COMPLETE_CHANCE					                            ; > 0? YES->CHECK FOR 10% COMPLETION CHANCE

@set_value_to_minimum																			
	LDA #$00						                                                    ; *** could have done BCC   SET VALUE TO = DO 10% COMPLETION CHANCE	


CHECK_FOR_10PCT_COMPLETE_CHANCE:							                            ; CHECK FOR 10% COMPLETION CHANCE
	CMP #$34						                                                    ; VALUE > 52
	BCS check_for_30pct_complete_chance					                             ; YES-> CHECK FOR 30% COMPLETION CHANCE

set_to_10pct_complete_chance: 							                               								; 10% COMPLETION CHANCE	
	LDX #$00						                                                    ; SET INDEX = 10% COMPLETION CHANCE
	BEQ calculate_final_pass_play_outcome					                            ; BRANCH->CHECK FOR SIM PASS PLAY COMPLETE, SACK , INT

check_for_30pct_complete_chance: 							                           ; CHECK FOR 30% COMPLETION CHANCE
	CMP #$67						                                                    ; VALUE > 103
	BCS check_for_50pct_complete_chance					                            ; YES->CHECK FOR 50% COMPLETION CHANCE

set_to_30pct_complete_chance:	
	LDX #$03						                                                    ; SET INDEX = 30% COMPLETION CHANCE
	BNE calculate_final_pass_play_outcome					                            ; BRANCH->CHECK FOR SIM PASS PLAY COMPLETE, SACK , INT

check_for_50pct_complete_chance:							                             ; CHECK FOR 50% COMPLETION CHANCE	
    CMP #$9A						                                                    ; VALUE > 154
	BCS check_for_70pct_complete_chance					                                                    ; YES->CHECK FOR 70% COMPLETION CHANCE

set_to_50pct_complete_chance:
	LDX #$06						                                                    ; SET INDEX = 50% COMPLETION CHANCE
	BNE calculate_final_pass_play_outcome					                            ; BRANCH->CHECK FOR SIM PASS PLAY COMPLETE, SACK , INT

check_for_70pct_complete_chance:							                                                    ; CHECK FOR 70% COMPLETION CHANCE	
	CMP #$CD						                                                    ; VALUE > 205
	BCS set_to_90pct_complete_chance					                                                    ; YES->90% COMPLETION CHANCE	
	
set_to_70pct_complete_chance:	
	LDX #$09						                                                    ; SET INDEX = 70% COMPLETION CHANCE
	BNE calculate_final_pass_play_outcome					                            ; BRANCH->CHECK FOR SIM PASS PLAY COMPLETE, SACK , INT

set_to_90pct_complete_chance:							                                                    ; 90% COMPLETION CHANCE	
	LDX #$0C						                                                    ; SET INDEX = 90% COMPLETION CHANCE

calculate_final_pass_play_outcome: 							                             ; CHECK FOR SIM PASS PLAY COMPLETE, SACK , INT
	LDY #$00						                                                    ; SET PASS OUTCOME COUNTER/TYPE = ZERO/COMPLETE 
	LDA RANDOM_2						                                                ; 

_WHILE NOT_EQUAL							                                            ; COMPLETE,INC, SACK INT CHANCE LOOP
	
	CMP SIM_PASS_OUTCOME_TABLE,X					                                    ;  IS VALUE < (COMPLETE, INC, SACK, INT ) 
	BCC @pass_complete						                                            ; YES->PASS RESULT CHECK FOR PASS COMPLETE
	SEC							                                                        ; = VALUE - CHANCE
	SBC SIM_PASS_OUTCOME_TABLE,X					                                    ; 
	INX							                                                        ; CHANCE INDEX++
	INY							                                                        ; PASS OUTCOME COUNTER++
	CPY #MAX_PASS_OUTCOME_INDEX +1						                                ; ALL OUTCOMES CHECKED 3 outcome chance in table, last is implied

_END_WHILE						                                                    	; NO->COMPLETE,INC, SACK INT CHANCE LOOP

@pass_complete:							                                                ; PASS RESULT CHECK FOR PASS COMPLETE
	TYA							                                                        ; IS PASS RESULT TYPE = COMPLETE
	BEQ DO_SIM_PASS_COMPLETE						                                    ; 
	JMP DO_SIM_PASS_CHECK_FOR_INT_SACK						                            ; NO->SIM PASS RESULT IS INCOMPLETE/SACK/INT

_F}_DO_SIM_PASS_PLAY

_F{_DO_SIM_PASS_COMPLETE																; DONE

DO_SIM_PASS_COMPLETE:							                                        ; PASS COMPLETE

sim_yardage_value	= LOCAL_8
	
@set_player_tackled:	
	INC SIM_PLAYER_TACKLED_BOOL						                                    ; SET PLAYER TACKLED = TRUE
	LDX #UPDATE_QB_PASS_ATT_IN_GAME_INDEX						                        ; SET STAT TO UPDATE = PASS ATTEMPT
	
@update_qb_stats:	
	LDA SIM_QB_ID						                                                ; LOAD QB PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDX #UPDATE_QB_PASS_COMP_IN_GAME_INDEX						                        ; SET STAT TO UPDATE = PASS COMPLETION
	LDA SIM_QB_ID						                                                ; LOAD QB PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	
@update_target_stats:	
	LDX #UPDATE_REC_IN_GAME_INDEX						                                ; SET STAT TO UPDATE = RECEPTION
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD PASS TARGET PLAYER ID 
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDX SIM_TARGET_INDEX						                                         ; LOAD TARGET INDEX
	LDA SIM_SKILL_REC_YARD_SIM_VALUE[],X						                        ; LOAD TARGET SIM RECEIVING YARDAGE VALUE
	STA sim_yardage_value						                                                        ;
									                                                    ; SET REC YARDAGE VALUE 
									
	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 80,100,RANDOM_1 
	

	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA SIM_TEMP_VARIABLE_THREE						                                    ; IS PLAY CALL ADJUSTED TEAM PASS DEFENSE VALUE HIGH BYTE >0
	BNE @set_min_rec_yards_outcome						                                                    ; YES->MIN PASS PLAY YARDAGE OUTCOME
	
	LDA $3E						                                                        ; = ADJUSTED RECEIVING SIM VALUE - PLAY CALL ADJUSTED TEAM PASS DEFENS				
	SEC							                                                        ;
	SBC SIM_TEMP_VARIABLE_TWO						                                    ;
	CMP #$34						                                                    ; VALUE > 52
	BCS @check_outcome_two					                                                    ; YES->CHECK FOR PASSING OUTCOME START

@set_min_rec_yards_outcome:							                                        ; MIN PASS PLAY YARDAGE OUTCOME
	LDY #$00						                                                    ; SET PASS PLAY YARDADE RANGE = (0-10 YARDS)
	LDX #$0A						                                                    ;
	BNE CALCULATE_FINAL_SIM_PASS_YARDAGE						                                                    ; JUMP->CALCULATE FINAL PASS PLAY YARDAGE

@check_outcome_two:							                                                    ; CHECK FOR 5-35 YARDS OUTCOME
	CMP #$67						                                                    ; VALUE >= 103
	BCS @check_outcome_three					                                                    ;

@set_outcome_two_range:	
	LDY #$05						                                                    ; SET PASS PLAY YARDADE RANGE = (5-35 YARDS)
	LDX #$1E						                                                    ;
	BNE CALCULATE_FINAL_SIM_PASS_YARDAGE						                                                    ; JUMP->CALCULATE FINAL PASS PLAY YARDAGE

@check_outcome_three:							                                                    ; CHECK FOR 7-45 YARDS OUTCOME
	CMP #$9A						                                                    ; VALUE > 154
	BCS @check_outcome_four

@set_outcome_three_range:	
	LDY #$07						                                                    ; SET PASS PLAY YARDADE RANGE = (7-45 YARDS)
	LDX #$26						                                                    ;
	BNE CALCULATE_FINAL_SIM_PASS_YARDAGE						                                                    ; JUMP->CALCULATE FINAL PASS PLAY YARDAGE

@check_outcome_four:							                                                    ; CHECK FOR 10-55 YARDS OUTCOME
	CMP #$CD						                                                    ; VALUE > 205
	BCS @check_outcome_five						                                                    ;

@set_outcome_four_range:
	LDY #$0A						                                                    ; SET PASS PLAY YARDADE RANGE = (10-55 YARDS)
	LDX #$2D						                                                    ;
	BNE CALCULATE_FINAL_SIM_PASS_YARDAGE					                                                    ; JUMP->CALCULATE FINAL PASS PLAY YARDAGE


@check_outcome_five:							                                                    ; CHECK FOR 15-70 YARDS OUTCOME
	LDA RANDOM_1						                                                ;
	CMP #$20						                                                    ;
	BCC @set_max_outcome_range					                                                    ; 12% CHANCE->CHECK FOR 20-100 YARDS OUTCOME
	
@set_outcome_five_range:	
	LDY #$0F						                                                    ; SET PASS PLAY YARDADE RANGE = (15-70 YARDS)
	LDX #$37						                                                    ;
	BNE CALCULATE_FINAL_SIM_PASS_YARDAGE						                                                    ; JUMP->CALCULATE FINAL PASS PLAY YARDAGE

@set_max_outcome_range:							                                                    ; CHECK FOR 20-100 YARDS OUTCOME
	LDY #$14						                                                    ; SET PASS PLAY YARDADE RANGE = (20-100 YARDS)
	LDX #$50

CALCULATE_FINAL_SIM_PASS_YARDAGE:							                            ; CALCULATE FINAL PASS PLAY YARDAGE

minimum_yardage = LOCAL_7

	STY minimum_yardage						                                            ; SAVE MINIMUM YARDAGE
	LDA RANDOM_2						                                                ; LOAD RANDOM NUMBER
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO RANDOM BETWEEN (0 TO X-1)
	CLC							                                                        ; PLAY YARDAGE = RANDOMIZED VALUE FROM PASS PLAY RANGE
	ADC minimum_yardage						                                            ; + MINIMUM VALUE
	STA SIM_PLAY_YARDAGE						                                        ; SAVE PLAY YARDAGE
	LDA TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM AND SHIFT FOR INDEX
	ASL							                                                        ;
	TAX							                                                        ;
	LDA SIM_PLAY_YARDAGE						                                        ; IS PLAY YARDAGE < DISTANCE FROM ENDZONE
	CMP SIM_DISTANCE_FROM_ENDZONE						                                ;  
	BCC @save_yards_to_team_pass_yards						                                                    ; YES->ADD YARDS TO TEAM PASSING YARDS
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; SET PLAY YARDAGE = DISTANCE FROM ENDZONE 

@save_yards_to_team_pass_yards:							                                                    ; ADD YARDS TO TEAM PASSING YARDS
	CLC							                                                        ; CURRENT TEAM PASSING YARDS  += CURRENT PASSING PLAY YARDS 
	ADC SIM_TEAM_PASSING_YDS[],X						                                ;
	STA SIM_TEAM_PASSING_YDS[],X						                                ;
	BCC @do_end_of_rec						                                            ;
	INC SIM_TEAM_PASSING_YDS[]+1,X						                                ;

@do_end_of_rec:							                                               ; END OF SIM PASS
	JSR SIM_CHECK_FOR_FD_TD_FUMBLE_INJURY					                            ; CHECK FOR FD, TURNOVER, TD, STOP ON DOWNS, INJURY()
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()
	
_F}_DO_SIM_PASS_COMPLETE	

_F{_DO_SIM_PASS_CHECK_FOR_INT_SACK														; DONE

DO_SIM_PASS_CHECK_FOR_INT_SACK:							                                ; SIM PASS RESULT IS INCOMPLETE/SACK/INT
	DEY							                                                        ; DOES SIM PASS RESULT = INCOMPLETE?
	BNE @pass_was_int					                                                ; NO -> CHECK FOR IS PASS RESULT SACK OR INT
	LDX #UPDATE_QB_PASS_ATT_IN_GAME_INDEX						                        ; SET STAT TO UPDATE = PASS ATTEMPT
	LDA SIM_QB_ID						                                                ; LOAD QB ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                                ; TIME AND QUARTER UPDATE, END OF GAME CHECK()

@pass_was_int:							                                                    ; CHECK FOR IS PASS RESULT SACK OR INT
	DEY							                                                        ; DOES SIM PASS RESULT = SACK?
	BNE DO_SIM_PASS_INTERCEPTION					                                    ; NO ->PASS INTERCEPTED
	
_F}_DO_SIM_PASS_CHECK_FOR_INT_SACK	

_F{_DO_SIM_PASS_SACK																	; DONE			

SIM_SACK_YARDAGE_MAX							= $0A
OFFSET_TO_P2_SIM_SACK_VALUES					= $0B
sim_sack_value_index							= LOCAL_7
OFFSET_TO_P2_GAME_PLAYERS_FROM_P1_DEFENDERS		= P2_GM_PLAYERS - P1_DEF_STARTERS
	
@set_player_tackled_to_Qb	
	INC SIM_PLAYER_TACKLED_BOOL						                                    ; SET PLAYER TACKLED = TRUE
	LDA #$00						                                                    ; SET POSITION ID = QB
	STA SIM_CURRENT_POSITION_ID						                                    ; 
	
@set_max_sack_yardage	
	LDA RANDOM_1						                                                ; LOAD RANDOM #	
	LDX #SIM_SACK_YARDAGE_MAX						                                    ; SET MAX YARDAGE = 9 YARDS
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	EOR #$FF						                                                    ; SET PLAY YARDAGE = 0 TO -9 YARDS
	CLC							                                                        ;
	ADC #$01						                                                    ;
	STA SIM_PLAY_YARDAGE						                                        ; 

@set_play_type:	
	LDA #QB_SACKED_SIM_PLAY_TYPE						                                ; SET PLAY TYPE = SACK 
	STA SIM_PLAY_TYPE						                                            ;
	
@update_game_state:	
	JSR SIM_CHECK_FOR_FD_TD_FUMBLE_INJURY					                            ; CHECK FOR FD, TURNOVER, TD, STOP ON DOWNS, INJURY()
	
@swap_possession:	
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = DEFENSIVE TEAM
	EOR #$01						                                                    ; 
	STA TEAM_ON_OFFENSE						                                            ;
	
	LDY #(NUM_DEFENDERS_ON_FIELD - 1)						                            ; SET NUM PLAYERS TO CHECK = 11
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM INDEX
	BEQ @save_offset						                                                    ;
	
	
	LDX #OFFSET_TO_P2_SIM_SACK_VALUES						                            ; = SET OFFSET TO PLAYER 2 SIM SACK VALUES


@save_offset:
	STX sim_sack_value_index					                                        ; SAVE OFFSET TO P1/P2 SIM SACK VALUES
	LDA RANDOM_3						                                                ; LOAD RANDOM NUMBER

								                                                        ; SACK VALUES FOR ENTIRE TEAM ADD UP TO 255
_WHILE NOT_EQUAL:							                                            ; CHECK FOR WHICH PLAYER GOT SACK LOOP

	CMP SIM_DEF_SACK_SIM_VALUE[],X						                                ; IS VALUE< CURRENT PLAYER SIM SACK VALUE
	BCC @save_player_id						                                            ; YES-> ADD SACK TO IN GAME PLAYER STATS
	SEC							                                                        ; = CURRENT VALUE - SACK CHANCE
	SBC SIM_DEF_SACK_SIM_VALUE[],X						                                ;
	INX							                                                        ; PLAYER SIM SACK VALUE INDEX++
	DEY							                                                        ; PLAYERS LEFT TO CHECK-- 

_END_WHILE 					                                                    		; DONE? NO-> CHECK FOR WHICH PLAYER GOT SACK LOOP

@save_player_id:							                                            ; ADD SACK TO IN GAME PLAYER STATS
	TXA							                                                        ;
	ASL							                                                        ;
	STA SIM_CURRENT_STARTER_ID						                                    ; SAVE IN TEMP PLAYER ID
	LDA_ABS_A_ZP TEAM_ON_OFFENSE						                                ; *** could use zero page IS CURRENT TEAM = P1
	BEQ @get_defender_roster_id						                                                    ;

	
	LDA #OFFSET_TO_P2_GAME_PLAYERS_FROM_P1_DEFENDERS						            ; = OFFSET TO P2 PLAYER IDS

@get_defender_roster_id:
	CLC							                                                        ; =  P1/P2 OFFSET
	ADC SIM_CURRENT_STARTER_ID						                                    ;  + TEMP PLAYER ID
	TAX							                                                        ;
	LDA CURRENT_IN_GAME_DEFENDER_ID[],X						                            ; LOAD PLAYER ID
	STA SIM_CURRENT_STARTER_ID						                                    ; SAVE IN TEMP PLAYER ID
	
@update_player_sacks	
	LDX #UPDATE_DEF_SACKS_IN_GAME_INDEX						                            ; SET STAT TO UPDATE = DEFENDER SACKS
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES

@swap_possesion_back:	
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = OFFENSIVE TEAM
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()

_F}_DO_SIM_PASS_SACK

_F{_DO_SIM_PASS_INTERCEPTION															; DONE

DO_SIM_PASS_INTERCEPTION:							                                    ; PASS INTERCEPTED

temp_return_yards							= LOCAL_7
OFFSET_TO_PLAYER_TWO_INT_SIM_VALUES			= $0B
	
@set_player_tackled:	
	INC SIM_PLAYER_TACKLED_BOOL						                                    ; SET PLAYER TACKLED = TRUE

@update_qb_pass_attempts:
	LDX #UPDATE_QB_PASS_ATT_IN_GAME_INDEX						                        ; SET STAT TO UPDATE = PASS ATTEMPT	
	LDA SIM_QB_ID						                                                ; LOAD QB PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES

@update_qb_pass_interceptions:	
	LDA SIM_QB_ID						                                                ; LOAD QB PLAYER ID 
	LDX #UPDATE_QB_PASS_INT_IN_GAME_INDEX						                        ; SET STAT TO UPDATE = PASS INTERECPTIONS
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	
@swap_who_last_had_possession:	
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET TEAM WHO LAST HAD POSESSION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_LAST_TEAM_WITH_BALL 						                                ;

@set_minimum_int_return_range:	
	LDX #$0F						                                                    ; SET MAX INT RETURN YARDS TO ADD = 15 
	LDY #$00						                                                    ; SET MIN INT RETURN YARDS = 0
	
@check_return_range_two:	
	LDA_ABS_A_ZP RANDOM_1						                                        ; *** uses non zeropage instruction
	CMP #$10						                                                    ; RANDOM > 16 = 94% CHANCE?
	BCS @calculate_int_return_yardage					                                                    ; YES-> CALCULATE INT RETURN YARDS

@set_maximum_int_return_range:								                            ; LONG INT RETURN
	LDY #$0F						                                                    ; SET MIN INT RETURN YARDS = 15 
	LDX #$55						                                                    ; SET MAX INT RETURN YARDS TO ADD = 85

@calculate_int_return_yardage:							                                ; CALCULATE INT RETURN YARDS
	STY temp_return_yards					                                            ;
	LDA RANDOM_2						                                                ;
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC							                                                        ; = DEFINED RANDOM RANGE YARDS TO ADD + 
	ADC temp_return_yards						                                        ; MIN INT RETURN YARDS
	STA SIM_PLAY_YARDAGE						                                        ; SAVE IN PLAY YARDAGE

@swap_offensive_team: 	
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = DEFENSIVE TEAM
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	
	LDY #NUM_DEFENDERS_ON_FIELD - 1						                                ; SET NUMBER OF DEFENDERS TO CHECK = 11
	LDX TEAM_ON_OFFENSE						                                            ;
	BEQ @get_player_who_gets_int					                                                    ;
	LDX #OFFSET_TO_PLAYER_TWO_INT_SIM_VALUES						                    ; SET INDEX INTO PLAYER 2 INT SIM VALUES 

@get_player_who_gets_int:
	LDA RANDOM_3						                                                ; LOAD RANDOM # FOR WHO GETS INTERCEPTION

								                                                        ; INT VALUES FOR ENTIRE TEAM ADD UP TO 255\
_WHILE NOT_EQUAL							                                                    ; CHECK WHICH PLAYER GETS INTERCEPTION LOOP
	
	CMP SIM_DEF_INT_SIM_VALUE[],X						                                ; CURRENT VALUE  <  PLAYER INT SIM VALUE
	BCC @save_player_who_gets_int						                                ; YES-> ADD INT TO PLAYERS IN GAME STATS
	SEC							
	SBC SIM_DEF_INT_SIM_VALUE[],X						                                ;
	INX							                                                        ; DEFENDER INDEX ++
	DEY							                                                        ; NUMBER OF DEFENDERS TO CHECK --

_END_WHILE					                                                            ; DONE? NO->CHECK WHICH PLAYER GETS INTERCEPTION LOOP

@save_player_who_gets_int:							                                                    ; SAVE PLAYER ID AND GET OFFSET TO IN GAME INT STATS
	TXA							                                                        ;
	ASL							                                                        ;
	STA SIM_CURRENT_STARTER_ID						                                    ; SAVE IN TEMP PLAYER ID
	LDA_ABS_A_ZP TEAM_ON_OFFENSE						                                            ; IS P1 
	BEQ @get_defender_roster_id						                                                    ; YES-> ADD INT TO PLAYERS IN GAME STATS
	
	LDA #OFFSET_TO_P2_GAME_PLAYERS_FROM_P1_DEFENDERS						            ; SAVE OFFSET TO PLAYER 2 DEFENDER STARTER IDS

@get_defender_roster_id:							                                     ; ADD INT TO PLAYERS IN GAME STATS
	CLC							                                                        ;
	ADC SIM_CURRENT_STARTER_ID						                                    ; = TEMP PLAYER ID + OFFSET TO DEFNDER STARTER IDS
	TAX							                                                        ;
	LDA CURRENT_IN_GAME_DEFENDER_ID[],X						                                                    ; SET PLAYER ID = CURRENT DEFENDER
	STA SIM_CURRENT_STARTER_ID						                                    ; 

@update_defender_interceptions:
	LDX #UPDATE_DEF_INTS_IN_GAME_INDEX						                            ; SET STAT TO UPDATE = INTERCEPTIONS
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	JSR DO_SIM_INT_RETURN_YARDS					                                        ; *** could inline SAVE INT RETURN YARDS AND CHECK IF RETURNED FOR TD()
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; JUMP-> TIME AND QUARTER UPDATE, END OF GAME CHECK()
	
_F}_DO_SIM_PASS_INTERCEPTION	

_F{_DO_SIM_PASS_INT_RETURN																; DONE

int_return_yards	= LOCAL_7

DO_SIM_INT_RETURN_YARDS:							                                    ; SAVE INT RETURN YARDS AND CHECK IF RETURNED FOR TD()
	
@check_distance_from_endzone:	
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; IS DISTANCE FROM ENDZONE < 20
	CMP #$14						                                                    ;
	BCC @pass_intercepted_for_touchback						                            ; YES->DISTANCE FROM ENDZONE < 20, PASS INTERCEPTED IN ENDZONE FOR TOUCHBACK
	
	
	LDX #UPDATE_DEF_INT_YDS_IN_GAME_INDEX						                        ; SET STAT TO UPDATE = INTERCEPTION YARDS	
	LDA #$64						                                                    ; DISTANCE FROM ENDZONE = 100 - DISTANCE FROM ENDZONE
	SEC							                                                        ;
	SBC SIM_DISTANCE_FROM_ENDZONE						                                ;
	CLC							                                                        ;
	ADC #$14						                                                    ; + 20 YARDS (DISTANCE OF THROW)
	CMP SIM_PLAY_YARDAGE						                                        ; INT RETURN YARDS < (DEFENDER DISTANCE FROM ENDZONE + 20 YARDS)
	BCC @save_return_yards						                                        ; YES->ADD INTCERCEPTION RETURN YARDAGE TO STATS
	LDA SIM_PLAY_YARDAGE						                                        ; ELSE YARDAGE = RETURN YARDAGE

@save_return_yards:							                                                        ; ADD INTCERCEPTION RETURN YARDAGE TO STATS
	STA int_return_yards						                                        ; SAVE INT RETURN YARDAGE
	LDA #$00						                                                    ;
	STA int_return_yards+1						                                        ;
	
@save_yards_to_in_game_stats:	
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD DEFENDER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	

@check_for_return_for_td	
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; DISTANCE FROM ENDZONE - 20 YARDS 
	SEC							                                                        ;
	SBC #$14						                                                    ; 
	CLC							                                                        ;
	ADC SIM_PLAY_YARDAGE						                                        ; + INT RETURN YARDAGE 
	STA SIM_DISTANCE_FROM_ENDZONE						                                ; 
	CMP #$64						                                                    ; > 100?
	BCS @pass_intercepted_for_touchdown						                            ; YES-> INTERCEPTION RETURNED FOR TD

@swap_possession:
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = OFFENSIVE TEAM
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	RTS							                                                        ;

@pass_intercepted_for_touchback:							                            ; DISTANCE FROM ENDZONE < 20, PASS INTERCEPTED IN ENDZONE FOR TOUCHBACK
	LDA #$14						                                                    ; SET DISTANCE FROM ENDZONE = TOUCHBACK
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;
	LDA #$00						                                                    ; SET DOWN = FIRST DOWN
	STA DOWN						                                                    ;
	LDA #YARDS_FOR_FIRST_SIM						                                    ; SET YARDS NEEDED FOR A FIRST DOWN = 10
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = OFFENSIVE TEAM
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	RTS							                                                        ; RETURN

@pass_intercepted_for_touchdown:							                            ; INTERCEPTION RETURNED FOR TD
	INC SIM_DO_KICKOFF_BOOL						                                        ; SET DO KICKOFF = TRUE
	LDA #TD_POINTS						                                                ; LOAD 6 POINTS
	STA SIM_PTS_TO_ADD_TO_SCORE						                                    ; SCORE TO ADD TO QUARTER SCORE
	LDX #UPDATE_DEF_INT_TDS_IN_GAME_INDEX						                        ; SET STAT TO UPDATE = DEFENSIVE TD
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	
@check_for_overtime:	
	BIT SIM_GAME_STATUS						                                            ; DOES  GAME STATUS = SUDDEN DEATH OVERTIME 
	BVS @update_score						                                                    ; YES-> GAME IN SUDDEN DEAtH OVERTIME OR  XP MISSED
	
	LDX TEAM_ON_OFFENSE						                                            ; IS PLAYER 1 
	BEQ @do_sim_int_td_xp_try						                                    ; YES->DO XP TRY
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; SET OFFSET INTO PLAYER 2 KICKER
	

@do_sim_int_td_xp_try:							                                        ; DO XP TRY
	LDA CURRENT_IN_GAME_KICKER_ID,X						                                ; SET TEMP PLAYER ID = KICKER ID
	STA SIM_CURRENT_STARTER_ID						                                    ; 
	LDX #UPDATE_XP_ATT_IN_GAME_INDEX						                            ; LOAD UPDATE XP TRY STAT COMMAND
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA #XP_KICK_DISTANCE_SIM						                                    ; SET DISTANCE FROM ENDZONE = XP TRY
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;
	JSR CHECK_FOR_XP_FG_MAKE_OR_MISS					                                ; CHECK FOR XP/FG MAKE OR MISS()
	BCS @update_score						                                            ;
	LDA SIM_CURRENT_STARTER_ID						                                    ; SAVE IN TEMP PLAYER ID
	LDX #UPDATE_XP_MADE_IN_GAME_INDEX						                             ; LOAD UPDATE XP MAKE STAT COMMAND
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	INC SIM_PTS_TO_ADD_TO_SCORE						                                    ; SCORE TO ADD TO QUARTER SCORE ++

@update_score:							                                                ; GAME IN SUDDEN DEAtH OVERTIME OR  XP MISSED
	JSR SIM_UPDATE_QTR_TOTAL_SCORE					                                    ; UPDATE TEAM QTR AND TOTAL SCORE($6F= P1 OR P2 TEAM INDEX)
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET TEAM WITH CURRENT POSESSION = OTHER TEAM = TEAM WHO THREW INT
	EOR #$80						                                                    ;
	STA SIM_CURRENT_TEAM_WITH_BALL						                                ;
	RTS							                                                        ; RETURN
	
_F}_DO_SIM_PASS_INT_RETURN_YARDS	

_F{_SET_SIM_DEFENSE_BASED_ON_PLAY_CALL													; DONE

SET_DEFENSE_SIM_VALUE_BASED_ON_PLAY_CALL:							                    ; SET FINAL RUN OR PASS DEFENSIVE SIM VALUE BASED ON PLAY CALL ($45= OFFENSE OR DEFENSE SIM VALUE)

offense_play_call		= LOCAL_3
defense_play_call		= LOCAL_4
defensive_sim_value		= LOCAL_1

defense_adjust_index	= LOCAL_7
defense_adjust_value	= LOCAL_8


.ENUM $00

BAD_DEF_ADJUST_INDEX				.dsb 1 												; play calls dont match
WEAKER_DEF_ADJUST_INDEX 			.dsb 1												; same play type but more than 1 play slot away
MODERATE_DEF_ADJUST_INDEX 			.dsb 1												; same play type only 1 play slot away
BLITZ_DEF_ADJUST_INDEX 				.dsb 1												; exact match
.ENDE

@load_offense_play_call:
	LDX TEAM_ON_OFFENSE						                                            ; LOAD OFFENSE PLAY CALL 
	LDA SIM_PLAY_CALLS[],X						                                        ;
	STA offense_play_call						                                        ;

@load_defense_play_call:	
	TXA							                                                        ;
	EOR #$01						                                                    ;
	TAX							                                                        ;
	LDA SIM_PLAY_CALLS[],X						                                        ; LOAD DEFENSE PLAY CALL
	STA defense_play_call						                                        ;
	
@check_exact_match_play_call:	
	CMP offense_play_call						                                        ;
	BNE @check_for_opposite_play_type						                            ; ARE PLAY CALLS MATCHING? NO->CHECK FOR PLAY CALLS ARE OPPOSITE (RUN VS PASS, PASS VS RUN)

@set_defense_adjust_to_blitz_index	
	LDA #BLITZ_DEF_ADJUST_INDEX						                                    ; SET INDEX = MATCHING PLAY CALL = BLITZ
	BNE @save_def_adust_index						                                    ; BRANCH->GET DEFENSIVE ADJUSTMENT()

@check_for_opposite_play_type:							                                ; CHECK FOR PLAY CALLS ARE OPPOSITE (RUN VS PASS, PASS VS RUN)
	EOR offense_play_call						                                        ; IS CALL PASS VS RUN OR RUN VS PASS? 
	AND #$04						                                                    ;
	BEQ @check_within_one_slot						                                    ; NO->PLAY TYPES CLOSE
	
@set_adjust_for_different_play_Type	
	LDA #$00						                                                    ; SET INDEX = DIFFERENT PLAY CALL TYPE 
	BEQ @save_def_adust_index						                                                    ; BRANCH->GET DEFENSIVE ADJUSTMENT()

@check_within_one_slot:							                                                        ; PLAY TYPES CLOSE
	LDA defense_play_call						                                                        ; = DEFENSE CALL - OFFENSE CALL
	SEC							                                                        ;
	SBC_ABS_ZP offense_play_call						                                ; *** uses non zero page instruction 
	AND #$01						                                                    ; WITHIN ONE TYPE OF EACH OTHER (EX PASS1 VS PASS 2)?
	BEQ @set_to_weaker_adjust_index						                                                    ; NO->MODERATE DEFENSE ADJUST 

@set_to_moderate_adjust_index:	
	LDA #MODERATE_DEF_ADJUST_INDEX						                                ; SET INDEX = MODERATE DEFENSE ADJUST
	BNE @save_def_adust_index						                                                    ; BRANCH->GET DEFENSIVE ADJUSTMENT()

@set_to_weaker_adjust_index:							                                                        ; MODERATE DEFENSE ADJUST
	LDA #WEAKER_DEF_ADJUST_INDEX 						                                ; SET INDEX = WEAK DEFENSE ADJUST

@save_def_adust_index:							                                        ; GET DEFENSIVE ADJUSTMENT()
	STA defense_adjust_index						                                    ; SAVE ADJUSTMENT INDEX
	
@get_adjust_value	
	LDY defense_adjust_index						                                    ;
	LDA SIM_DEFENSE_ADJUST_VALUE_TO_ADD_TABLE,Y					                        ; GET MAX AMOUNT TO ADD FROM PLAY CALL DEFENSE ADJUST MAX VALUE TO ADD
	TAX							                                                        ;
	LDA RANDOM_1						                                                ; LOAD RANDOM #
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	
@add_adjust_value_to_base_value:	
	LDY defense_adjust_index						                                    ; 
	CLC							                                                        ; SET MINIMUM VALUE TO ADD FROM PLAY CALL DEFENSE ADJUST MIN VALUE TO ADD
	ADC SIM_DEFENSE_BASE_VALUE,Y					                                    ;
	LDX defense_adjust_value						                                    ; LOAD SIM VALUE
	JSR SIM_A_TIMES_X_SAVE_IN_LOCAL_1					                                ;  MULTIPLY( A * X) RESULT $3E,3F
	
	LDA #$64						                                                    ; SET DIVIDE BY = 100
	LDX defensive_sim_value						                                        ; LOAD PLAY CALL ADJUSTED DEFENSIVE SIM VALUE
	LDY defensive_sim_value+1						                                    ;
	JSR DIVIDE_ADJUSTED_SIM_VAL					                                        ; DIVIDE (3F,3E / A)  RESULT $3E,3F
	JMP SIM_RANDOMIZE_MORE					                                            ; JUMP-> MORE EXTENSIVE RANDOM NUMBER UPDATE ()

_F}_SET_SIM_DEFENSE_BASED_ON_PLAY_CALL	

_F{_DO_SIM_FAKE_PUNT_FG_PASS_NOT_USED													; DONE

DO_SIM_FAKE_PUNT_FG_PASS_NOT_USED:							                            ; FAKE FG/PUNT?_NOT USED

adjusted_sim_value			= LOCAL_1
sim_target_chance_index		= LOCAL_7
qb_sim_value				= LOCAL_8
target_rec_sim_value		= LOCAL_8
defense_sim_value			= LOCAL_8

    SET_SIM_PLAY_TIME[min_max_rand] 5,25,RANDOM_2
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDY #MAX_TARGETS						                                            ; SET NUMBER OF TARGETS = 5
	LDX TEAM_ON_OFFENSE						                                            ; SAVE CURRENT TEAM
	STX SIM_CURRENT_TEAM						                                    ;
	BEQ @save_target_chance_index					                                    ; IS CURRENT TEAM = P1? YES->SAVE OFFSET AND LOAD RANDOM NUM
	
	LDX #OFFSET_TO_P2_TARGET_SIM_VALUES						                            ; SET INDEX = P2 TARGET CHANCES

@save_target_chance_index:							                                           ; SAVE OFFSET AND LOAD RANDOM NUM
	STX sim_target_chance_index						                                        ; SAVE TARGET CHANCE INDEX
	LDA RANDOM_3						                                                ; LOAD RANDOM #

_WHILE NOT_EQUAL							                                            ; CHECK WHICH TARGET PASSED TO FAKE FG/PUNT LOOP 
	
	CMP SIM_TARGET_CHANCE_SIM_VALUE[],X						                            ; VALUE < TARGET CHANCE
	BCC @save_target						                                                    ; YES-> SAVE TARGET INDEX AND GET PLAYER ID
	SEC							                                                        ; = VALUE - TARGET CHANCE
	SBC SIM_TARGET_CHANCE_SIM_VALUE[],X						                            ;
	INX							                                                        ; TARGET CHANCE INDEX++
	DEY							                                                        ; PLAYERS LEFT TO CHECK--

_END_WHILE						                                                         ; ALL TARGETS CHECKED? NO-> CHECK WHICH TARGET PASSED TO FAKE FG/PUNT LOOP


@choose_random_target								                                    ; CREATE RANDOM TARGET FROM TOP 4 TARGETS
	LDA RANDOM_1						                                                ; LOAD RANDOM #
	LDX #(MAX_TARGETS -1)						                                        ;
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC							                                                        ;
	ADC sim_target_chance_index						                                    ; + INDEX TO P1 OR P2 TARGETS
	TAX							                                                        ;

@save_target:							                                                ; SAVE TARGET INDEX AND GET PLAYER ID
	STX SIM_TARGET_INDEX						                                        ;
	TXA							                                                        ;
	ASL							                                                        ;
	STA SIM_CURRENT_STARTER_ID						                                    ; SAVE IN TEMP PLAYER ID
	LDA TEAM_ON_OFFENSE						                                            ; IS CURRENT TEAM = P1? 
	BEQ @save_starter_offset						                                    ; YES->SAVE OFFSET AND LOAD RANDOM NUM
	LDA #OFFSET_TO_P2_TARGET_STARTER_IDS						                        ; = OFFSET TO PLAYER 2 QB

@save_starter_offset:							                                        ; CHECK FOR FAKE FG/PUNT PASS COMPLETION
	CLC							                                                        ;
	ADC SIM_CURRENT_STARTER_ID						                                    ; +  TEMP PLAYER ID

@get_roster_id:	
	TAX							                                                        ;
	LDA CURRENT_IN_GAME_TARGET_ID[],X						                            ; SET TEMP PLAYER ID = TARGET 
	STA SIM_CURRENT_STARTER_ID						                                    ; 

@get_position_id	
	LDA SIM_TARGET_INDEX						                                        ; SET SIM RECEIVING TARGET INDEX = TARGET INDEX  - TEAM TARGET OFFSET
	SEC							                                                        ;
	SBC sim_target_chance_index						                                    ; 
	STA SIM_CURRENT_POSITION_ID						                                    ; SAVE TARGET POSITION ID
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM SIM PASSING VALUE
	LDA SIM_QB_PASS_SIM_VALUE[] ,X						                                ; 
	STA qb_sim_value						                                             ;
	                                                                                    ; SET FAKE FG PASS SIM VALUE
	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 80,100,RANDOM_1 
	
	LDA adjusted_sim_value						                                        ; SAVE RANDOMIZED SIM PASSING VALUE
	STA SIM_TEMP_VARIABLE_ONE						                                    ;
	LDX SIM_TARGET_INDEX  						                                        ; LOAD PLAYER SIM RECEIVING VALUE FROM SIM RECEIVING VALUES
	LDA SIM_SKILL_REC_SIM_VALUE[],X						                                ; 
	STA target_rec_sim_value						                                    ;
								                                                        ; SET FAKE FG REC SIM VALUE
	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 70,100,RANDOM_1 
	LDA SIM_TEMP_VARIABLE_ONE						                                    ; = RANDOMIZED SIM PASSING VALUE +  RANDOMIZED SIM RECEIVING VALUE
	CLC							                                                        ;
	ADC adjusted_sim_value						                                        ;
	BCC @save_fake_fg_pass_sim_value						                                                    ; < 255

@set_pass_offense_sim_value_to_max:	
	LDA #$FF						                                                    ; ELSE SET TO MEX VALUE

@save_fake_fg_pass_sim_value:
	STA SIM_TEMP_VARIABLE_ONE						                                    ; SAVE RANDOMIZED SIM PASSING VALUE +  RANDOMIZED SIM RECEIVING VALUE
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA #$00						                                                    ;
	STA SIM_TEMP_VARIABLE_THREE						                                    ;
	
@get_pass_defense_sim_value:	
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = DEFENSIVE TEAM
	EOR #$01						                                                    ;
	TAX							                                                        ;
	LDA SIM_PASS_DEFENSE_SIM_VALUE[],X						                            ; LOAD TEAM PASS DEFENSE VALUE
	STA defense_sim_value					                                            ; = TEAM PASS DEFENSE VALUE
	SEC							                                                        ;
	SBC RANDOM_1						                                                ; - RANDOM
	STA adjusted_sim_value						                                        ;
	STA SIM_TEMP_VARIABLE_TWO						                                    ;
	JMP CHECK_FOR_10PCT_COMPLETE_CHANCE					                                ; JUMP->SET PASS PLAY RESULT START
	
_F}_DO_SIM_FAKE_PUNT_FG_PASS_NOT_USED	

_F{_DO_SIM_KICKOFF																		; DONE

DO_SIM_KICKOFF:							                                                ; DO SIM KICKOFF()

SIM_KICK_OFF_MIN_DISTANCE		= $32													; 50 yards
SIM_KICK_OFF_MAX_DISTANCE		= $3C													; 60 yards

adjusted_kick_return_sim_value	= LOCAL_1
final_kick_return_sim_value		= LOCAL_1
kick_off_distance				= LOCAL_7
kick_off_recieve_loc			= LOCAL_7
kick_return_sim_value			= LOCAL_8
kick_return_defense_value		= LOCAL_8

@get_kickoff_time:
	SET_SIM_PLAY_TIME[min_max_rand] 20,45,RANDOM_1
	
@get_kickoff_distance:								                                    ; 
	LDA RANDOM_2						                                                ; LOAD RANDOM
	LDX #(SIM_KICK_OFF_MAX_DISTANCE	- SIM_KICK_OFF_MIN_DISTANCE)					    ; SET MAX VALUE=  9
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC							                                                        ; 
	ADC #SIM_KICK_OFF_MIN_DISTANCE						                                ; SET MIN AMOUNT = 50 
	STA kick_off_distance						                                        ; SAVE RANGE = (50-59)
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	
@set_dkickoff_rec_loc:		
	LDA #$41						                                                    ; = 65- (50 TO 59)
	SEC							                                                        ;
	SBC kick_off_distance						                                        ;
	STA kick_off_recieve_loc						                                     ; = 6 TO 15 

@set_distance_from_opp_endzone:	
	LDA #LENGTH_OF_FIELD_YARDS_SIM						                                                    ; = 100 - (6 TO 15)
	SEC							                                                        ;
	SBC kick_off_recieve_loc						                                    ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ; SET DISTANCE FROM ENDZONE = 85 TO 94
	LDA #KR_STARTER_ID						                                            ; SET POSITION ID = KICK RETURNER 
	STA SIM_CURRENT_POSITION_ID						                                    ;
	LDX TEAM_ON_OFFENSE						                                            ; IS CURRENT TEAM  = P1
	STX SIM_CURRENT_TEAM						                                    ;
	BEQ @get_kr_id						                                                ; YES->SAVE KR INDEX AND GET KR YARDAGE 
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; SET TEAM STARTERS OFFSET = P2 STARTERS

@get_kr_id:							                                                    ; SAVE KR INDEX AND GET KR YARDAGE
	LDA CURRENT_IN_GAME_KR_ID,X						                                    ; SET TEMP PLAYER ID =KICK RETURNER ID
	STA SIM_CURRENT_STARTER_ID						                                    ; LOAD KR ID
	LDX #UPDATE_KR_ATT_IN_GAME_INDEX							                        ; SET STAT TO UPDATE = KR ATT
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM
	LDA SIM_KR_SIM_VALUE[],X						                                ; SAVE SIM KICK RETURN VALUE IN $45 
	STA kick_return_sim_value						                                                        ;
	
	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 99,100,RANDOM_1
	
	LDA TEAM_ON_OFFENSE						                                            ; SET DEFENSIVE TEAM INDEX
	EOR #$01						                                                    ;
	TAX							                                                        ;
	LDA SIM_RUN_DEFENSE_SIM_VALUE[],X						                            ; = SIM RUN DEFENSE VALUE - RAND
	SEC							                                                        ;
	SBC RANDOM_2						                                                ; 
	STA kick_return_defense_value						                                ;
	LDA adjusted_kick_return_sim_value					                                ; = KICK RETURN VALUE - (SIM KICK RETURN - RANDOMIZED SIM RUN D)
	SEC							                                                        ;
	SBC kick_return_defense_value						                                ;
	STA final_kick_return_sim_value						                                ;
	BCS @check_range_0_to_15						                                    ; VALUE IS POSITIVE? YES->CHECK FOR SET 0-15 YARD RANGE

@set_range_to_min_value																	; *** could also do BCC to set range
	LDA #$00						                                                    ; SET VALUE = MIN VALUE = 0-15 YARD KR RANGE
	STA final_kick_return_sim_value					                                     ;

@check_range_0_to_15:							                                        ; CHECK FOR 0-15 YARD KR
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA final_kick_return_sim_value						                                ; RETURN YARDAGE VALUE - (SIM DEFENSE VALUE - RAND)
	CMP #$34						                                                    ; VALUE  > 52
	BCS @check_range_10_to_30						                                    ;

@set_kr_range_0_to_15:								                                    ; 0-15 YARD KR  	
    LDY #$00						                                                    ; SET MIN YARDAGE = 0
	LDX #$0F						                                                    ; SET ADDITIONAL RANGE = 15 YARDS
	BNE CALCULATE_SIM_KR_YARDAGE						                                                    ; 

@check_range_10_to_30:							                                                        ; CHECK FOR 10-30 YARD KR
	CMP #$67						                                                    ; VALUE  > 103
	BCS @check_range_15_to_40						                                                    ;

@set_kr_range_10_to_30:	
	LDY #$0A						                                                    ; SET MIN YARDAGE = 10 
	LDX #$14						                                                    ; SET ADDITIONAL RANGE = 20 YARDS
	BNE CALCULATE_SIM_KR_YARDAGE

@check_range_15_to_40:							                                                        ; CHECK FOR 15-40 YARD KR
	CMP #$9A						                                                    ; VALUE > 154
	BCS @check_range_25_to_50

@set_kr_range_15_to_40:	
	LDY #$0F						                                                    ; SET MIN YARDAGE = 15
	LDX #$19						                                                    ; SET ADDITIONAL RANGE = 25 YARDS
	BNE CALCULATE_SIM_KR_YARDAGE

@check_range_25_to_50:							                                        ; CHECK FOR SET 20-50 YARD KR
	CMP #$CD						                                                    ; VALUE > 205
	BCS @check_range_25_to_60						                                    ; 

@set_kr_range_20_to_50:		
	LDY #$14						                                                    ; SET MIN YARDAGE = 20
	LDX #$1E						                                                    ; SET ADDITIONAL RANGE = 30 YARDS
	BNE CALCULATE_SIM_KR_YARDAGE

@check_range_25_to_60:							                                        ; CHECK FOR SET 25-60 YARD KR
	LDA RANDOM_1						                                                ; LOAD RANDOM # 
	CMP #$20						                                                    ; < 32 (12.5%)
	BCC @set_kr_range_60_to_100						                                    ; YES->60-100 YARD KR

@set_kr_range_25_to_60:	
	LDY #$19						                                                    ; SET MIN YARDAGE = 25
	LDX #$23						                                                    ; SET ADDITIONAL RANGE = 35 YARDS
	BNE CALCULATE_SIM_KR_YARDAGE

@set_kr_range_60_to_100:							                                                        ; 60-100 YARD KR 
	LDY #$3C						                                                    ; SET MIN YARDAGE = 60
	LDX #$28						                                                    ; SET ADDITIONAL RANGE = 40 YARDS

CALCULATE_SIM_KR_YARDAGE:							                                    ; CALCULATE KR YARDAGE (Y= MIN, X = MAX ADDED YARDS)

min_yardage 			= LOCAL_7

	STY min_yardage						                                                ; 
	LDA RANDOM_1						                                                ;
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC							                                                        ; = RANDOM (0 TO MAX YARDS) 
	ADC min_yardage						                                                ; + ADDED RANGE
	STA SIM_PLAY_YARDAGE						                                        ; SAVE YARDAGE IN $3B5
	JSR DO_SIM_KICK_RETURN					                                            ; DO KICK RETURN
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()
	
_F}_DO_SIM_KICKOFF	

_F{_DO_SIM_KICK_RETURN																	; DONE

DO_SIM_KICK_RETURN:							                                            ; *** COULD INLINE CHECK FOR KR INJURY, FUMBLE, AND KR TOUCHDOWN

SIM_KICK_RETURN_INJURY_CHANCE_BYTE_1	= $11											; works out to about 0.3%
SIM_KICK_RETURN_INJURY_CHANCE_BYTE_2	= $0A	

sim_kick_return_yardage	= LOCAL_7


	LDA RANDOM_1						                                                ; SET SIM KICK RETURN INJURY CHANCE = 0.3%
	CMP #SIM_KICK_RETURN_INJURY_CHANCE_BYTE_1						                                                    ;
	BCS @check_for_kr_fumble						                                    ;
	
	LDA RANDOM_2						                                                ;
	CMP #SIM_KICK_RETURN_INJURY_CHANCE_BYTE_2						                    ;
	BCS @check_for_kr_fumble						                                    ; INJURED? NO->CHECK FOR KR FUMBLE AND KR TOUCHDOWN
	INC SIM_INJURY_BOOL						                                            ; SET PLAYER INJURED = TRUE

@check_for_kr_fumble:							                                        ; CHECK FOR KR FUMBLE AND KR TOUCHDOWN
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	JSR CHECK_FOR_FUMBLE_SIM					                                        ; CHECK FOR FUMBLE, IF YES ADD TIME AND CHECK FOR FUMBLE LOST ()
	LDX #UPDATE_KR_YDS_IN_GAME_INDEX						                            ; 
	LDA #$00						                                                    ;
	STA sim_kick_return_yardage + 1						                                ;
	
@check_if_yardage_greater_than_distance_from_endzone:	
	LDA SIM_PLAY_YARDAGE						                                        ; IS KICK RETURN YARDAGE < DISTANCE FROM ENDZONE
	CMP SIM_DISTANCE_FROM_ENDZONE						                                ; 
	BCC @save_kick_rturn_yardage						                                ; YES->SAVE SIM KICK RETURN YARDAGE 
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; SET RETURN YARDAGE= DISTANCE FROM ENDZONE

@save_kick_rturn_yardage:							                                    ; SAVE SIM KICK RETURN YARDAGE
	STA sim_kick_return_yardage						                                    ; SAVE YARDAGE				
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD KR PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; WAS KICK RETURN YARDAGE >= DISTANCE FROM ENDZONE
	SEC							                                                        ;					
	SBC SIM_PLAY_YARDAGE						                                        ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ; 
	BEQ DO_SIM_KICK_RETURN_TOUCHDOWN						                            ; YES-> SIM KICK RETURN TOUCHDOWN
	BMI DO_SIM_KICK_RETURN_TOUCHDOWN						                            ;
	RTS							                                                        ; RETURN 

_F}_DO_SIM_KICK_RETURN

_F{_DO_SIM_KICK_RETURN_TOUCHDOWN														; DONE

DO_SIM_KICK_RETURN_TOUCHDOWN:							                                  ; SIM KICK RETURN TOUCHDOWN
	LDA #TD_POINTS						                                                ; SET POINTS = TOUCHDOWN POINTS
	STA SIM_PTS_TO_ADD_TO_SCORE						                                    ; SCORE TO ADD TO QUARTER SCORE
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD TEMP PLAYER ID
	LDX #UPDATE_KR_TDS_IN_GAME_INDEX						                            ; 
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	
@check_over_time:	
	BIT SIM_GAME_STATUS						                                            ; DOES GAME STATUS = SUDDEN DEATH OVERTIME
	BVS @exit_kick_return_touchdown						                                ; YES->KR TD IN SUDDEN DEATH OVERTIME OR KR XP MISSED
	
	LDX TEAM_ON_OFFENSE						                                            ; IS CURRENT TEAM = P1?
	BEQ @kr_td_xp_try:						                                                    ; YES-> KR TD XP TRY
	
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; = OFFSET TO PLAYER 2 KICKER ID

@kr_td_xp_try:							                                                        ; KR TD XP TRY
	LDA CURRENT_IN_GAME_KICKER_ID,X						                                ; SET TEMP PLAYER ID = KICKER ID
	STA SIM_CURRENT_STARTER_ID						                                    ;
	LDX #UPDATE_XP_ATT_IN_GAME_INDEX						                            ; SET STAT TO UPDATE = XP ATT
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA #XP_KICK_DISTANCE_SIM						                                    ; SET DISTANCE FROM ENDZONE = XP TRY
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;
	JSR CHECK_FOR_XP_FG_MAKE_OR_MISS					                                ; CHECK FOR XP/FG MAKE OR MISS()
	BCS @exit_kick_return_touchdown						                                ; MISSED? YES->KR TD IN SUDDEN DEATH OVERTIME OR KR XP MISSED
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD KICKER ID
	LDX #UPDATE_XP_MADE_IN_GAME_INDEX						                            ; SET STAT TO UPDATE = XP MADE
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	INC SIM_PTS_TO_ADD_TO_SCORE						                                    ; SCORE TO ADD TO QUARTER SCORE ++

@exit_kick_return_touchdown:							                               ; KR TD IN SUDDEN DEATH OVERTIME OR KR XP MISSED
	JSR SIM_UPDATE_QTR_TOTAL_SCORE					                                    ; UPDATE TEAM QTR AND TOTAL SCORE($6F= P1 OR P2 TEAM INDEX)
	RTS							                                                        ; RETURN
	
_F}_DO_SIM_KICK_RETURN_TOUCHDOWN	

_F{_DO_SIM_ONSIDES_KICK																	; DONE

DO_SIM_ONSIDES_KICK:							                                        ; DO SIM ONSIDES KICK ()

SIM_ONSIDES_STARTING_LOCATION		= $41												; 65 YARDS
SIM_MIN_DISTANCE_TO_SUBTRACT		= $0A												; 10 YARDS
SIM_MAX_DISTANCE_TO_SUBTRACT		= $14 												; 20 YARDS

sim_distance_to_subtract				= LOCAL_7

    SET_SIM_PLAY_TIME[min_max_rand] 10,25,RANDOM_1
	
@get_random_distance_to_subtract:	
	LDA RANDOM_2						                                                ; LOAD RANDOM #
	LDX #(SIM_MAX_DISTANCE_TO_SUBTRACT	- SIM_MIN_DISTANCE_TO_SUBTRACT)					; SET MAX VALUE = 9 
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC							                                                        ;
	ADC #SIM_MIN_DISTANCE_TO_SUBTRACT						                             ; SET MIN VALUE = 10
	STA sim_distance_to_subtract						                                                        ; SAVE VALUE = (10 TO 19) 
    JSR SIM_RANDOMIZE_MORE					                                        ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()			
	LDA #SIM_ONSIDES_STARTING_LOCATION						                                                    ; = 65 -( 10 TO 19)
	SEC							                                                        ;
	SBC sim_distance_to_subtract						                                                        ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ; SET DISTANCE FROM ENDZONE = 55 TO 46

@check_if_onsides_recovered																; 50% chance onside recovery	
	LDA RANDOM_3						                                                ; LOAD RANDOM #
	BPL @exit_onsides						                                                    ; ONSIDE RECOVERED(50%)? NO-> ONSIDE NOT RECOVERED
	
@swap_possession:	
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET WHO TEAM LAST HAD POSSESSION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_LAST_TEAM_WITH_BALL 						                                ;

@exit_onsides:							                                                        ; ONSIDE NOT RECOVERED
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()
	
_F}_DO_SIM_ONSIDES_KICK	

_F{_DO_SIM_PUNT																			; DONE

DO_SIM_PUNT:							                                                ; DO SIM PUNT()		

MAX_SIM_PUNT_YARDS_TO_ADD		= $14													; 20 yards
SIM_YARDLINE_AFTER_TOUCH_BACK	= $14													; 20 yardline
punt_yards						= LOCAL_7
			
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM INDEX
	BEQ @load_sim_punter_id						                                        ; 
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; ADD OFFSET TO P2 STARTERS	

@load_sim_punter_id:							                                        ;
	LDA CURRENT_IN_GAME_PUNTER_ID,X						                                ; LOAD PUNTER ID
	STA SIM_PUNTER_ID						                                            ;
	
@update_punt_attempts:	
	LDX #UPDATE_PUNTS_IN_GAME_INDEX						                                ; LOAD PUNT INCREASE PUNT ATTEMPT 
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES

@set_play_time:	
	SET_SIM_PLAY_TIME[min_max_rand] 20,45,RANDOM_1

@get_sim_punt_yards:
	LDA RANDOM_2						                                                ; LOAD RANDOM #
	LDX #MAX_SIM_PUNT_YARDS_TO_ADD						                                ; SET MAXIMUM ADDITIONAL PUNT YARDAGE = 20
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	LDX TEAM_ON_OFFENSE						                                            ; LOAD PUNT SIM VALUE
	CLC							                                                        ;
	ADC SIM_PUNT_YARD_SIM_VALUE[],X						                                ; = PUNT SIM VALUE(30 TO 45 YARDS) PLUS 20 YARDS
	STA SIM_PUNT_YARDS						                                            ;
	STA punt_yards						                                                ;
	
	
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; IS DISTANCE FROM ENDZONE > PUNT DISTANCE
	CMP SIM_PUNT_YARDS						                                            ;
	BCS @update_punt_yards						                                        ; YES->UPDATE PUNTER PUNT YARDAGE

@set_punt_yards_equal_to_dist_from_endzone:
	STA punt_yards					                                                    ; SAVE DISTANCE FROM ENDZONE IN PUNT DISTANCE

@update_punt_yards:							                                            ; UPDATE PUNTER PUNT YARDAGE
	LDA #$00						                                                    ; 	
	STA punt_yards+1						                                            ;
	LDA SIM_PUNTER_ID						                                            ; LOAD PUNTER ID
	LDX #UPDATE_PUNT_YDS_IN_GAME_INDEX						                            ; SET STAT TO UPDATE =  PUNT YARDAGE 
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	
@swap_who_last_had_ball:	
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET WHO TEAM LAST HAD POSSESSION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_LAST_TEAM_WITH_BALL 						                                ;
	
@check_for_punt_return	
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; IS DISTANCE FROM ENDZONE >= PUNT DISTANCE
	CMP SIM_PUNT_YARDS						                                            ;
	BEQ @punt_was_touchback						                                                    ; NO-> PUNT WENT INTO ENDZONE TOUCHBACK
	BCS DO_SIM_PUNT_RETURN						                                        ; YES->PUNT RETURN RECEIVED BY PUNT RETURNER

@punt_was_touchback:							                                        ; PUNT WENT INTO ENDZONE TOUCHBACK
	LDA #SIM_YARDLINE_AFTER_TOUCH_BACK						                            ; SET YARDLINE = 20 YARDLINE
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;
	LDA #FIRST_DOWN						                                                ; SET DOWN = FIRST DOWN
	STA DOWN						                                                    ;
	LDA #YARDS_FOR_FIRST_SIM						                                    ; SET YARDS NEEDED FOR FIRST DOWN = 10
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; JUMP-> TIME AND QUARTER UPDATE, END OF GAME CHECK()
	
_F}_DO_SIM_PUNT	

_F{_DO_SIM_PUNT_RETURN																	; DONE


DO_SIM_PUNT_RETURN:							                                            ; PUNT RETURN RECEIVED BY PUNT RETURNER

final_sim_return_value			= LOCAL_1
adjusted_sim_return_value		= LOCAL_1 
sim_return_value				= LOCAL_8
adjusted_sim_defense_value		= LOCAL_8

 
@update_field_location:
    LDA SIM_DISTANCE_FROM_ENDZONE						                                ; DISTANCE FROM ENDZONE  -= PUNT DISTANCE
	SEC							                                                        ;
	SBC SIM_PUNT_YARDS						                                            ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;

@swap_posession:	
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = OTHER TEAM = PUNT RETURN TEAM
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	STA SIM_CURRENT_TEAM						                                    ;
	
	
	LDA #PR_STARTER_ID						                                            ; SET POSITION ID = PUNT RETURNER
	STA SIM_CURRENT_POSITION_ID						                                    ;
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM
	BEQ @update_punt_return_stat						                                ;
	
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; ADD OFFSET TO P2 STARTERS

@update_punt_return_stat:							                                    ; 
	LDA CURRENT_IN_GAME_PR_ID,X						                                    ; SET TEMP PLAYER ID= PUNT RETURNER ID
	STA SIM_CURRENT_STARTER_ID						                                    ;
	LDX #UPDATE_PR_ATT_IN_GAME_INDEX						                            ; LOAD INCREASE PUNT RETURN ATTEMPT STAT INDEX
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM PUNT RETURNER SIM VALUE
	LDA SIM_KR_SIM_VALUE[],X						                                    ; *** bug uses kr value
	STA sim_return_value		                                                        ;
	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 90,100,RANDOM_1
	

	LDA TEAM_ON_OFFENSE						                                            ; = CURRENT DEFENSIVE TEAM SIM RUN DEFENSE - RANDOM
	EOR #$01						                                                    ;
	TAX							                                                        ;
	LDA SIM_RUN_DEFENSE_SIM_VALUE[],X						                            ;
	SEC							                                                        ; 
	SBC RANDOM_2						                                                ; 	
	STA adjusted_sim_defense_value						                                ; SAVE RANDOMIZED SIM RUN DEFENSE
	
	LDA adjusted_sim_return_value						                                ; = RANDOMIZE SIM PUNT RETURN - RANDOMIZED SIM RUN DEFENSE
	SEC							                                                        ; 
	SBC adjusted_sim_defense_value						                                ; 
	STA final_sim_return_value						                                    ; 	
	BCS @check_for_0_to_14_yard_range						                            ; VALUE > 0 YES-> SET PUNT RETURN YARDAGE OUTCOME

@set_return_value_to_worst_range:	
	LDA #$00						                                                    ; SET VALUE = MIN VALUE = WORST PR RANGE
	STA final_sim_return_value						                                     ;

@check_for_0_to_14_yard_range:							                                ; SET PUNT RETURN YARDAGE OUTCOME
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA final_sim_return_value						                                    ; LOAD RANDOMIZE SIM PUNT RETURN - RANDOMIZED SIM RUN DEFENSE
	CMP #$34						                                                    ; > 52
	BCS @check_for_0_to_19_yard_range						                            ;

@set_punt_return_range_0_to_14:									                        ; PUNT RETURN YARDAGE 0-14	
    LDX #$0F						                                                    ; SET MAX PUNT RETURN YARDS = 14
	BNE SET_SIM_PUNT_RETURN_YARDAGE						                                ; BRANCH->SET PUNT RETURN YARDAGE

@check_for_0_to_19_yard_range:							                                ; CHECK FOR PUNT RETURN YARDAGE 0-19	
	CMP #$67						                                                    ; > 103
	BCS @check_for_0_to_24_yard_range						                                                    ; 

@set_punt_return_range_0_to_19:		
	LDX #$14						                                                    ; SET MAX PUNT RETURN YARDS = 19
	BNE SET_SIM_PUNT_RETURN_YARDAGE						                                ; BRANCH->SET PUNT RETURN YARDAGE

@check_for_0_to_24_yard_range:							                                ; CHECK FOR PUNT RETURN YARDAGE 0- 24	
	CMP #$9A						                                                    ; > 154
	BCS @check_for_0_to_29_yard_range						                            ;

@set_punt_return_range_0_to_24:		
	LDX #$19						                                                    ; SET MAX PUNT RETURN YARDS = 24
	BNE SET_SIM_PUNT_RETURN_YARDAGE						                                ; BRANCH->SET PUNT RETURN YARDAGE

@check_for_0_to_29_yard_range:							                                ; CHECK FOR PUNT RETURN YARDAGE 0- 29	
	CMP #$CD						                                                    ; > 205
	BCS @check_for_0_to_34_yard_range					                                                    ; 

@set_punt_return_range_0_to_29:	
	LDX #$1E						                                                    ; SET MAX PUNT RETURN YARDS = 29
	BNE SET_SIM_PUNT_RETURN_YARDAGE						                                ; BRANCH->SET PUNT RETURN YARDAGE

@check_for_0_to_34_yard_range:							                                ; CHECK FOR PUNT RETURN YARDAGE 0-34
	LDA RANDOM_1						                                                ; RANDOM < 32 (12.5%)
	CMP #$20						                                                    ;	
	BCC @return_td					                                                    ; YES->

@set_punt_return_range_0_to_34:	
	LDX #$23						                                                    ; SET MAX PUNT RETURN YARDS = 34
	BNE SET_SIM_PUNT_RETURN_YARDAGE						                                ; BRANCH->SET PUNT RETURN YARDAGE

@return_td:							                                                    ; PUNT RETURN YARDAGE 0-99
	LDX #LENGTH_OF_FIELD_YARDS_SIM						                                ; SET MAX PUNT RETURN YARDS = 99

SET_SIM_PUNT_RETURN_YARDAGE:							                                ; SET PUNT RETURN YARDAGE(X= MAX VALUE)

sim_punt_return_yardage		= LOCAL_7

	LDA RANDOM_3						                                                ; LOAD RANDOM #
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	STA SIM_PLAY_YARDAGE						                                        ; SAVE RETURN YARDAGE 
	STA sim_punt_return_yardage						                                    ;
	LDA #LENGTH_OF_FIELD_YARDS_SIM						                                ; = 100 - PUNT DISTANCE
	SEC							                                                        ;
	SBC SIM_DISTANCE_FROM_ENDZONE						                                ;
	CMP SIM_PLAY_YARDAGE						                                        ; > PUNT RETURN YARDAGE
	BCS @save_punt_return_yards						                                    ; YES->SAVE PUNT RETURN YARDS
	STA sim_punt_return_yardage						                                    ; SET PR YARDS = DISTANCE FROM ENDZONE WHEN PUNT RECEIEVED

@save_punt_return_yards:							                                                    ; SAVE PUNT RETURN YARDS
	LDA #$00						                                                    ; 
	STA sim_punt_return_yardage +1 						                                ;
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD PR PLAYER ID
	LDX #UPDATE_PR_YDS_IN_GAME_INDEX						                           ; SET STAT TO UPDATE = PR YARDS
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM = PR TEAM
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	JSR DO_SIM_PUNT_RETURN_INJURY_FUMBLE_CHECK											; ***  could have been inlined 
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()
	
_F}_DO_SIM_PUNT_RETURN	

_F{_DO_SIM_PUNT_RETURN_INJURY_FUMBLE_TD_CHECK											; DONE

DO_SIM_PUNT_RETURN_INJURY_FUMBLE_CHECK:							                        ; CHECK FOR PR INJURY,FUMBLE, TD

SIM_PUNT_RETURN_INJURY_CHANCE_BYTE_ONE		= $11
SIM_PUNT_RETURN_INJURY_CHANCE_BYTE_TWO		= $0A

	LDA RANDOM_1						                                                ; IS PLAYER INJURED? (0.25% CHANCE)
	CMP #SIM_PUNT_RETURN_INJURY_CHANCE_BYTE_ONE						                    ;
	BCS @check_for_pr_fumble						                                    ;
	LDA RANDOM_2						                                                ;
	CMP #SIM_PUNT_RETURN_INJURY_CHANCE_BYTE_TWO						                    ;
	BCS @check_for_pr_fumble						                                    ; NO->CHECK FOR PR FUMBLE
	INC SIM_INJURY_BOOL						                                            ; SET PLAYER INJURED = TRUE

@check_for_pr_fumble:							                                        ; CHECK FOR PR FUMBLE
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	JSR CHECK_FOR_FUMBLE_SIM					                                        ; CHECK FOR FUMBLE, IF YES ADD TIME AND CHECK FOR FUMBLE LOST ()

@check_for_touchdown
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; DISTANCE FROM ENDZONE +=  PLAY YARDAGE
	CLC							                                                        ; 
	ADC SIM_PLAY_YARDAGE						                                        ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ; 
	CMP #LENGTH_OF_FIELD_YARDS_SIM						                                ; PAST ENDZONE?  
	BCS @sim_pr_was_touchdown						                                    ; YES->SIM PR WAS TOUCHDOWN
	
@check_fumble_recovered:	
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; WAS THERE FUMBLE RECOVERED BY PUNTING TEAM?
	EOR SIM_LAST_TEAM_WITH_BALL 						                                ;
	BNE @exit						                                                    ; NO-> EXIT
	LDA #$00						                                                    ; SET DO KICKOFF = FALSE
	STA SIM_DO_KICKOFF_BOOL						                                        ;	

@exit:							                                                        ; EXIT
	RTS							                                                        ; RETURN

@sim_pr_was_touchdown:							                                        ; SIM PR WAS TOUCHDOWN
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM INDEX = OTHER TEAM
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	INC SIM_DO_KICKOFF_BOOL						                                        ; SET DO KICKOFF = TRUE
	LDA #TD_POINTS						                                                ; SET POINTS   = TOUCHDOWN POINTS
	STA SIM_PTS_TO_ADD_TO_SCORE						                                    ; SAVE POINTS IN  POINTS TO ADD TO QUARTER SCORE
	LDX #UPDATE_PR_TDS_IN_GAME_INDEX						                            ; 
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD TEMP PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	
@check_in_overtime:	
	BIT SIM_GAME_STATUS						                                            ; DOES GAME STATUS = SUDDEN DEATH OVERTIME
	BVS @update_score						                                            ; YES->GAME IN SUDDEN DEATH OR XP

@check_side:	
	LDX TEAM_ON_OFFENSE						                                            ; IS CURRENT TEAM = P1?
	BEQ @do_xp_try						                                                    ; YES->GET KICKER ID AND DO XP TRY
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; = OFFSET TO PLAYER 2 INFO

@do_xp_try:							                                                        ; GET KICKER ID AND DO XP TRY
	LDA CURRENT_IN_GAME_KICKER_ID,X						                                ; SET TEMP PLAYER ID = KICKER ID
	STA SIM_CURRENT_STARTER_ID						                                    ; 
	LDX #UPDATE_XP_ATT_IN_GAME_INDEX						                            ; 
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA #XP_KICK_DISTANCE_SIM						                                    ; SET DISTANCE FROM ENDZONE = XP TRY
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;
	JSR CHECK_FOR_XP_FG_MAKE_OR_MISS					                                ; CHECK FOR XP/FG MAKE OR MISS()
	BCS @update_score						                                                    ;
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD KICKER ID
	LDX #UPDATE_XP_MADE_IN_GAME_INDEX						                                                    ;
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	INC SIM_PTS_TO_ADD_TO_SCORE						                                    ; SCORE TO ADD TO QUARTER SCORE ++ 

@update_score:							                                                ; GAME IN SUDDEN DEATH OR XP MISSED 
	JSR SIM_UPDATE_QTR_TOTAL_SCORE					                                    ; UPDATE TEAM QTR AND TOTAL SCORE($6F= P1 OR P2 TEAM INDEX)
	LDA SIM_CURRENT_TEAM_WITH_BALL						                                ; SET TEAM WITH CURRENT POSESSION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_CURRENT_TEAM_WITH_BALL						                                ;
	INC SIM_DO_KICKOFF_BOOL						                                        ; SET DO KICKOFF = TRUE 
	RTS							                                                        ; RETURN
	
_F}_DO_SIM_PUNT_RETURN_INJURY_FUMBLE_TD_CHECK	

_F{_DO_SIM_FG_XP_TRY																	; DONE

CHECK_FOR_XP_FG_MAKE_OR_MISS:							                                ; CHECK FOR FG/XP MAKE OR MISS() 

sim_data_side_index			= LOCAL_7
temp_sim_fg_value			= LOCAL_8

adjusted_sim_value			= LOCAL_1
modified_distance			= LOCAL_8

final_sim_fg_chance			= LOCAL_1

FG_XP_TIME_MINIMUM			= $0C
FX_XP_MAX_TIME_TO_ADD		= $03 

	INC SIM_DO_KICKOFF_BOOL								                                ; SET NEED TO DO KICKOFF= TRUE 
	LDA RANDOM_1										                                ; 
	LDX #FX_XP_MAX_TIME_TO_ADD											                ; SET MAX VALUE TO ADD =3 
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC													                                ;
	ADC #FG_XP_TIME_MINIMUM											                    ; SET MIN VALUE = 12
	CLC													                                ;
	ADC SIM_TIME_PLAY_USED								                                ; 
	STA SIM_TIME_PLAY_USED								                                ; = ADD 12-14 SECONDS TO TIME TO SUBTRACT FROM CURRENT TIME	
	
@load_fg_sim_value:	
	LDX TEAM_ON_OFFENSE									                                ; LOAD CURRENT TEAM INDEX 
	STX sim_data_side_index												                ; 
	LDA SIM_FG_XP_SIM_VALUE[],X							                                ; LOAD SIM KICKING VALUE 
	STA temp_sim_fg_value												                ;

	SET_ADJUSTED_SKILL_VALUE[min_max_rand] 70,100,RANDOM_2
	
	
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; = (2 * DISTANCE FROM ENDZONE) + DISTANCE FROM ENDZONE
	ASL							                                                        ;
	CLC							                                                        ;
	ADC SIM_DISTANCE_FROM_ENDZONE						                                ;
	STA modified_distance						                                        ; 
	BCS @set_to_worst_fg_xp_chance						                                    ; DISTANCE GREATER THAN 85 YARDS? YES->WORST FG CHANCE	
	
	
	LDA adjusted_sim_value						                                        ; = ADJUSTED SIM KICKING VALUE - ADJUSTED DISTANCE > 0
	SEC							                                                        ;
	SBC modified_distance						                                        ;
	STA adjusted_sim_value						                                        ;
	BCS @start_fg_xp_try						                                                    ; YES->CHECK FOR FG MAKE()

@set_to_worst_fg_xp_chance:							                                    ; DO WORST FG CHANCE
	LDA #$00						                                                    ;
	STA adjusted_sim_value						                                        ;

@start_fg_xp_try:							                                            ; CHECK FOR FG MAKE()
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDX RANDOM_3						                                                ;
	
	LDA adjusted_sim_value						                                        ;
	
@check_30pct_chance:	
	CMP #$24						                                                    ; 
	BCS @check_50pct_chance						                                                    ;  

@do_30pct_chance:
	CPX #$4D						                                                    ; SET FG > 55 CHANCE = 30%
	RTS							                                                        ; RETURN

@check_50pct_chance:							                                                        ; FG MAKE 50% CHANCE
	CMP #$4A
	BCS @check_70pct_chance	

@do_50pct_chance:
	CPX #$80						                                                    ; SET  FG CHANCE = 50%
	RTS							                                                        ; RETURN

@check_70pct_chance:							                                                        ; FG MAKE 70% CHANCE
	CMP #$70						                                                    ;
	BCS @check_80pct_chance						                                                    ;

@do_70pct_chance:	
	CPX #$B3						                                                    ; SET  FG CHANCE = 70%	
	RTS							                                                        ; RETURN

@check_80pct_chance:							                                        ; FG MAKE 80% CHANCE
	CMP #$97						                                                    ;
	BCS @do_95pct_chance						                                        ;

@do_80pct_chance:	
	CPX #$CC						                                                    ; SET  FG CHANCE = 80%	
	RTS							                                                        ; RETURN

						                                                        ; FG MAKE 95% CHANCE
@do_95pct_chance:	
	CPX #$F2						                                                    ; SET FG/XP CHANCE = 95%
	RTS							                                                        ; RETURN

_F}_DO_SIM_FG_XP_TRY		
	
_F{_CHECK_FOR_SIM_FUMBLE																; DONE

CHECK_FOR_FUMBLE_SIM:							                                        ; CHECK FOR FUMBLE, IF YES ADD TIME AND CHECK FOR FUMBLE LOST ()
	LDA RANDOM_3						                                                ; IS RANDOM GREATER THAN FUMBLE CHANCE = 1/256 = 
	CMP #FUMBLE_CHANCE_SIM						                                                    ;
	BCC DO_SIM_FUMBLE						                                            ; YES->DO SIM FUMBLE()
	RTS							                                                        ; RETURN
	
_F}_CHECK_FOR_SIM_FUMBLE

_F{_DO_SIM_FUMBLE																		; DONE

MAX_FUMBLE_TIME_SIM		= $0A 

DO_SIM_FUMBLE:							                                                ; DO SIM FUMBLE() CAN NEVER REACH HERE
	LDA RANDOM_2						                                                ; LOAD RANDOM 3C
	LDX #MAX_FUMBLE_TIME_SIM						                                    ; SET MAX ADDITION ALL TIME TO SUBTRACT FROM CLOCK = 10 
	JSR GET_RAND_VAL_FROM_ZERO_TO_MAX					                                ; SET VALUE TO (0 TO X-1)
	CLC							                                                        ;
	ADC SIM_TIME_PLAY_USED						                                        ; TIME TO SUBTRACT FROM CLOCK + = 0 TO 10
	STA SIM_TIME_PLAY_USED						                                        ;
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA RANDOM_1						                                                ; IS FUMBLE LOST (50% CHANCE)
	BPL @exit_sim_fumble						                                        ; NO-> FUMBLE NOT LOST END OF PLAY 
	
@swap_who_last_had_ball: 	
	LDA SIM_LAST_TEAM_WITH_BALL 						                                ; SET WHO TEAM LAST HAD POSSESSION = OTHER TEAM
	EOR #$80						                                                    ;
	STA SIM_LAST_TEAM_WITH_BALL 						                                ; 

@exit_sim_fumble:							                                            ; FUMBLE NOT LOST END OF PLAY 
	JMP SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER					                            ; TIME AND QUARTER UPDATE, END OF GAME CHECK()
	
_F}_DO_SIM_FUMBLE	

_F{_DO_SIM_CHECK_FOR_FD_TD_STOP_ON_DOWNS_INJURY											; DONE

SIM_CHECK_FOR_FD_TD_FUMBLE_INJURY:							                            ; CHECK FOR FD, TD, STOP ON DOWNS, FUMBLE SET INJURY STATUS()

play_yardage		= LOCAL_7
	
@check_for_injury:	
	LDA RANDOM_1						                                                ;
	CMP #INJURY_CHANCE_SIM_MULT_ONE						                                ;
	BCS @check_for_fumble_if_tackled						                            ;
	LDA RANDOM_2						                                                ;
	CMP_ABS_ZP $05						                                                ; *** bug and also uses non zero page instruction 
	BCS @check_for_fumble_if_tackled						                            ;
	INC SIM_INJURY_BOOL						                                            ; SET PLAYER INJURED  = TRUE

@check_for_fumble_if_tackled:							                                ;
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA SIM_PLAYER_TACKLED_BOOL						                                    ; DOES PLAYER TACKLED = TRUE?
	BEQ @check_for_pass_play						                                    ; NO->PLAYER NOT TACKLED
	JSR CHECK_FOR_FUMBLE_SIM					                                        ; CHECK FOR FUMBLE, IF YES ADD TIME AND CHECK FOR FUMBLE LOST ()

@check_for_pass_play:							                                        ; PLAYER NOT TACKLED
	LDY SIM_PLAY_TYPE						                                            ; IS PLAY TYPE = SACKED
	CPY #QB_SACKED_SIM_PLAY_TYPE						                                ;
	BEQ @update_yards_left_for_first_down						                        ; 


@get_yardage_stat_index:	
	LDA YARDAGE_SEASON_STAT_INDEX_TABLE,Y					                            ; LOAD YARDAGE STAT INDEX FROM PLAY YARDAGE STAT INDEXES
	TAX							                                                        ;
	
@check_if_play_positive_yards:	
	LDY #$00						                                                    ;
	STY play_yardage +1							                               			;
	LDA SIM_PLAY_YARDAGE						                                        ; IS PLAY YARDAGE = POSITIVE?
	BPL @check_for_td						                                            ; YES->CHECK FOR TD
	
@set_yardage_to_negative:	
	STA play_yardage						                                            ; 
	LDY #$FF						                                                    ;
	STY play_yardage+1						                                            ;
	BNE @update_player_stats						                                    ; BRANCH-> UPDATE STATS

@check_for_td:							                                                ; CHECK FOR TD
	CMP SIM_DISTANCE_FROM_ENDZONE						                                ; IS PLAY YARDAGE < DISTANCE FROM ENDZONE 
	BCC @save_play_yardage						                                        ; YES->SAVE YARDAGE TO ADD TO STATS
	
@set_play_yardage_to_distance_from_endzone:	
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; NO-> LOAD DISTANCE FROM ENDZONE 

@save_play_yardage:							                                            ; SAVE YARDAGE TO ADD TO STATS
	STA play_yardage						                                            ;
	



@update_player_stats:							                                        ; UPDATE STATS
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA SIM_PLAY_TYPE						                                            ; IS PLAY TYPE = PASS
	BNE @update_yards_left_for_first_down						                        ; NO->CHECK FOR FIRST DOWN
	
@update_qb_pass_yards_if_pass:	
	LDA SIM_QB_ID						                                                ; LOAD QB ID
	LDX #UPDATE_QB_PASS_YDS_IN_GAME_INDEX						                        ; SET STAT TO UPDATE = PASSING YARDS
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES

@update_yards_left_for_first_down:							                            ; CHECK FOR FIRST DOWN
	LDA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ; YARDS NEEDED FOR A FIRST DOWN = YARDS NEEDED FOR A FIRST DOWN - PLAY YARDAGE
	SEC							                                                        ;
	SBC SIM_PLAY_YARDAGE						                                        ;
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;
	BEQ @update_team_first_downs						                                ; YARDS = 0? YES->TEAM GOT FIRST DOWN
	BPL @check_for_touchdown						                                    ; YARDS > 0 CHECK FOR OFFENSIVE TD OR SAFETY

@update_team_first_downs:							                                    ; TEAM GOT FIRST DOWN
	LDX TEAM_ON_OFFENSE						                                            ; CURRENT TEAM FIRST DOWNS ++
	INC SIM_TEAM_FIRST_DOWNS[],X						                                ; 
	LDA #$FF						                                                    ; SET DOWN = NEW SET OF DOWNS WILL GET INCREMENTED TO FIRST DOWN
	STA DOWN						                                                    ;
	LDA #YARDS_FOR_FIRST_SIM						                                    ; SET YARDS NEEDED FOR FIRST DOWN = 10
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ; 

@check_for_touchdown:							                                        ; CHECK FOR OFFENSIVE TD OR SAFETY
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; DISTANCE FROM ENDZONE  = DISTANCE FROM ENDZONE  - PLAY YARDAGE
	SEC							                                                        ;
	SBC SIM_PLAY_YARDAGE						                                        ;
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;					
	BEQ @team_scored_touchdown						                                    ; DISTANCE FROM ENDZONE <=0? YES->TEAM SCORED TD
	BMI @team_scored_touchdown						                                    ;
	CMP #LENGTH_OF_FIELD_YARDS_SIM						                                ; IS DISTANCE FROM ENDZONE >  100
	BCC @check_if_distance_to_endzone_less_than_first_down_yardage						; NO-> CHECK FOR DISTANCE FROM ENDZONE LESS THAN FIRST DOWN YARDAGE 
								

@team_was_saftied	                                                                    ; TEAM SAFETIED
    LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM INDEX = OTHER TEAM = SWAP POSSESSION
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	LDA #SAFETY_POINTS						                                             ; LOAD TWO POINTS
	STA SIM_PTS_TO_ADD_TO_SCORE						                                    ; SCORE TO ADD TO QUARTER SCORE
	JSR SIM_UPDATE_QTR_TOTAL_SCORE					                                    ; UPDATE TEAM QTR AND TOTAL SCORE($6F= P1 OR P2 TEAM INDEX)
	LDA TEAM_ON_OFFENSE						                                            ; SET CURRENT TEAM INDEX = OTHER TEAM = SWAP POSSESSION 
	EOR #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	INC SIM_DO_KICKOFF_BOOL						                                        ; SET DO KICKOFF = TRUE
	RTS							                                                        ; RETURN

@check_if_distance_to_endzone_less_than_first_down_yardage:							     ; CHECK FOR DISTANCE FROM ENDZONE LESS THAN FIRST DOWN YARDAGE
	LDA SIM_DISTANCE_FROM_ENDZONE						                                ; DISTANCE FROM ENDZONE > YARDS NEEDED FOR FIRST DOWN 
	CMP SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ;  
	BCS @exit						                                                    ; YES->EXIT
	
@set_yards_for_first_equal_to_distance_from_endzone	
	STA SIM_YARDS_LEFT_FOR_FIRST_DOWN 						                            ; ELSE SAVE DISTANCE FROM ENDZONE  IN YARDS NEEDED FOR FIRST DOWN

@exit:							                                                       ; EXIT 
	RTS							                                                        ; RETURN

@team_scored_touchdown:							                                        ; TEAM SCORED TD
	LDA #TD_POINTS 						                                                ; SET SCORE TO ADD TO QUARTER SCORE = TOUCHDOWN POINTS
	STA SIM_PTS_TO_ADD_TO_SCORE						                                    ; 
	LDY SIM_PLAY_TYPE						                                            ; LOAD PLAY TYPE
	
@update_skill_player_td_stat:	
	LDA TOUCHDOWN_SEASON_STAT_INDEX_TABLE,Y					                            ; GET TD STAT INDEX BASED ON PLAY TYPE FROM PLAY TYPE TD STAT INDEXES
	TAX							                                                        ;
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD PLAYER ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDY SIM_PLAY_TYPE						                                            ; IS PLAY TYPE = PASS
	BNE @check_for_sudden_death					                                                    ; NO->CHECK FOR SUDDEN DEATH OVERTIME
	
@update_qb_td_stat_if_pass:	
	LDX #UPDATE_QB_PASS_TD_IN_GAME_INDEX						                         ; SET STAT TO UPDATE = PASSING TD
	LDA SIM_QB_ID						                                                ; LOAD QB ID
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES

@check_for_sudden_death:							                                    ; CHECK FOR SUDDEN DEATH OVERTIME
	BIT SIM_GAME_STATUS						                                            ; DOES  GAME STATUS = SUDDEN DEATH OVERTIME
	BVS @update_score_and_exit						                                    ; YES->TD IN SUDDEN DEATH OVERTIME OR XP MISSED
	LDX TEAM_ON_OFFENSE						                                            ; IS CURRENT TEAM = P1 
	BEQ @update_xp_attempt_stat						                                                ; YES->GET KICKER ID AND DO XP TRY
	LDX #P2_GAME_PLAYERS_OFFSET						                                    ; SET KICKER INDEX = P2 KICKER INDEX

@update_xp_attempt_stat:							                                                    ; GET KICKER ID AND DO XP TRY
	LDA CURRENT_IN_GAME_KICKER_ID,X						                                ; SET CURRENT PLAYER ID = CURRENT KICKER ID
	STA SIM_CURRENT_STARTER_ID						                                    ;
	LDX #UPDATE_XP_ATT_IN_GAME_INDEX						                            ; SET STAT TO UPDATE = XP ATT
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	LDA #XP_KICK_DISTANCE_SIM						                                     ; SET DISTANCE FROM ENDZONE = XP TRY
	STA SIM_DISTANCE_FROM_ENDZONE						                                ;
	JSR CHECK_FOR_XP_FG_MAKE_OR_MISS					                                ; CHECK FOR XP/FG MAKE OR MISS()
	BCS @update_score_and_exit					                                        ; XP MISSSED? YES->TD IN SUDDEN DEATH OVERTIME OR XP MISSED
	
@update_xp_made_stat:	
	LDA SIM_CURRENT_STARTER_ID						                                    ; LOAD CURRENT KICKER ID
	LDX #UPDATE_XP_MADE_IN_GAME_INDEX						                            ; SET STAT TO UPDATE = XP MAKE
	JSR SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS					                    ; UPDATE IN GAME PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES
	INC SIM_PTS_TO_ADD_TO_SCORE						                                    ; SCORE TO ADD TO QUARTER SCORE++

@update_score_and_exit:							                                        ; TD IN SUDDEN DEATH OVERTIME OR XP MISSED
	JSR SIM_UPDATE_QTR_TOTAL_SCORE					                                    ; UPDATE TEAM QTR AND TOTAL SCORE($6F= P1 OR P2 TEAM INDEX)
	RTS							                                                        ; RETURN
	
_F}_DO_SIM_CHECK_FOR_FD_TD_STOP_ON_DOWNS_INJURY		

_F{_DO_SIM_UPDATE_CLOCK_CHECK_GAME_OR_QUARTER_OVER										; DONE

SIM_UPDATE_TIME_QTR_CHECK_GAME_OVER:							                        ; TIME AND QUARTER UPDATE()

SIXTY_SECONDS			= $3C

play_seconds_used		= LOCAL_5
play_minutes_used		= LOCAL_6	

	LDA SIM_GAME_STATUS						                                            ; DOES GAME STATUS =  GAME OVER?
	BPL @update_clock_qtr_start:						                                ; NO->UPDATE TIME AND QUARTER START
	RTS							                                                        ; RETURN

@update_clock_qtr_start:	                                                            ; UPDATE TIME AND QUARTER START
	LDA #$00						                                                    ; SET TIMER = ZERO
	STA play_minutes_used						                                                        ;
	LDA SIM_TIME_PLAY_USED	                                                            ; LOAD TIME TO SUBTRACT FROM CLOCK 

_WHILE NOT_EQUAL:							                                            ; TIME SUBTRACT LOOP
	
	CMP #SIXTY_SECONDS						                                            ; TIME < 60 SECONDS
	BCC @save_seconds_used				                                                ; YES-> UPDATE TIME LEFT ON SIM CLOCK
	SBC #$60						                                                    ; HERE FOR ERROR CHECKING TO GET CLOCK TO NORMAL LEVEL
	INC play_minutes_used						                                        ; *** kind of odd choice

_END_WHILE					                                                            ; 

@save_seconds_used:							                                            ; UPDATE TIME LEFT ON SIM CLOCK
	STA play_seconds_used					                                            ;  
	
@update_sim_clock:	
	LDA CLOCK_SECONDS						                                            ; CURRENT TIME - TIME TO SUBTRACT FROM CLOCK
	SEC							                                                        ;
	SBC play_seconds_used						                                        ;
	STA CLOCK_SECONDS						                                            ;
	LDA CLOCK_MINUTES						                                            ;
	SBC play_minutes_used						                                        ;
	STA CLOCK_MINUTES						                                            ;
	LDA CLOCK_SECONDS						                                            ;
	CMP #SIXTY_SECONDS						                                            ;
	BCC @check_for_overtime						                                        ; DOES TIME LEFT = < 60 SECONDS
	CLC							                                                        ;
	ADC #SIXTY_SECONDS						                                            ; ADD 60 SECONDS SINCE TO GET CLOCK TO RIGHT VALUE
	STA CLOCK_SECONDS						                                            ; 

@check_for_overtime:							                                        ; CHECK FOR SUDDEN DEATH OVERTIME OR END OF QUARTER
	BIT SIM_GAME_STATUS						                                            ; DOES  GAME STATUS = SUDDEN DEATH OVERTIME
	BVC @check_for_end_of_quarter						                                ; NO-> CHECK FOR END OF QUARTER
	

@check_for_end_of_overtime:	
	LDA P1_TOTAL_SCORE						                                            ; DOES P1 SCORE = P2 SCORE 
	EOR P2_TOTAL_SCORE						                                            ;
	BEQ @check_for_end_of_quarter						                                ; YES->CHECK FOR END OF QUARTER

@set_sim_game_overtime_over:	
	LDA #SIM_GAME_STATUS_GAME_OVER_BITFLAG						                        ; SET GAME STATUS  = GAME OVER
	STA SIM_GAME_STATUS						                                            ;
	LDA #OVERTIME_QUARTER +1						                                    ; SET QUARTER = OVERTIME OR END OF GAME			
	STA QUARTER						                                                    ;
	RTS							                                                        ; RETURN

@check_for_end_of_quarter:							                                    ; CHECK FOR END OF QUARTER
	LDA CLOCK_MINUTES						                                            ; DOES MINUTES= END OF QUARTER
	BMI @go_to_next_quarter						                                        ; YES-> BRANCH TO UPDATE QUARTER AND CHECK FOR END OF GAME
	RTS							                                                        ; RETURN

@go_to_next_quarter:							                                        ; UPDATE QUARTER AND CHECK FOR END OF GAME
	INC QUARTER						                                                    ; QUARTER ++
	LDX QUARTER						                                                    ;
	DEX							                                                        ;
	BNE @check_for_third_quarter						                                ; QUARTER = SECOND QUARTER? NO-> BRANCH TO CHECK FOR THIRD QUARTER

@reset_sim_clock_and_clear_scoreboard:							                        ; SET QUARTER TIME, UPDATE SCOREBOARD AND TRANSFER SIM VALUES()
	LDA #SECONDS_PER_QUARTER_SIM						                                ; SET QUARTER TIME = 06:00
	STA CLOCK_SECONDS						                                            ;
	LDA #MINUTES_PER_QUARTER_SIM							                            ;
	STA CLOCK_MINUTES						                                            ;
	JSR SWAP_AND_CLEAR_SCOREBOARD						                                ; SWAP TO BANKS 17/18 (8000/A000), DO UPDATE SCOREBOARD, CLEAR SCORES, RETURN TO BANKS 12/13
	JMP LOAD_SIM_VALUES_FROM_ROM_TO_RAM					                                ; TRANSFER SIM VALUES TO RAM()

@check_for_third_quarter:							                                    ; CHECK FOR THIRD QUARTER
	DEX							                                                        ; IS QUARTER = THIRD QUARTER
	BNE @check_for_fourth_quarter						                                ; NO-> CHECK FOR FOURTH  QUARTER
	LDA #$00						                                                    ; CLEAR 
	STA SIM_CURRENT_TEAM_WITH_BALL						                                ;
	STA TEAM_ON_OFFENSE						                                            ; SET CURRENT POSSESION = HOME TEAM
	INC SIM_DO_KICKOFF_BOOL						                                        ; SET NEED TO DO KICKOFF = TRUE
	JMP @reset_sim_clock_and_clear_scoreboard						                    ; JUMP -> SET QUARTER TIME, UPDATE SCOREBOARD AND TRANSFER SIM VALUES()

@check_for_fourth_quarter:							                                    ; CHECK FOR FOURTH QUARTER
	DEX							                                                        ; IS QUARTER >= FOURTH QUARTER
	BEQ @reset_sim_clock_and_clear_scoreboard						                    ; YES-> SET QUARTER TIME, UPDATE SCOREBOARD AND TRANSFER SIM VALUES()
	
@check_for_overtime_one:	
	BIT SIM_GAME_STATUS						                                            ; DOES GAME STATUS = OVERTIME
	BVS @check_end_of_reg_season_overtime					                    		; YES-> TEAMS STILL TIED AT END OF SUDDEN DEATH OVERTIME
	
@check_for_tied_at_end_of_fourth: 	
	LDA P1_TOTAL_SCORE						                                            ; DOES P1 SCORE = P2 SCORE
	EOR P2_TOTAL_SCORE					                                                ;
	BEQ @set_game_status_to_overtime					                                    ; YES->TEAMS STILL TIED AT END OF REGULATION
	
@set_game_over:	
	LDA #SIM_GAME_STATUS_GAME_OVER_BITFLAG						                         ; SET GAME STATUS= GAME OVER
	STA SIM_GAME_STATUS						                                            ;
	RTS							                                                        ; RETURN

@set_game_status_to_overtime:							                                ; TEAMS STILL TIED AT END OF REGULATION
	LDA #SIM_GAME_STATUS_OVERTIME_BITFLAG						                        ; SET GAME STATUS = OVERTIME 
	STA SIM_GAME_STATUS						                                            ; 
	
@get_random_	
	LDX #P1_SIDE_ID						                                                ;
	LDA RANDOM_1						                                                ; SET CURRENT TEAM POSSESION = %50 P1, 50% P2 
	AND #$01						                                                    ;
	BEQ @save_overtime_first_with_ball					                                ;
	
@set_away_team_with_ball	
	LDX #P2_SIDE_ID						                                                ; SET CURRENT TEAM POSSESION  = P2
	LDA #$80						                                                    ;

@save_overtime_first_with_ball:							                                ;
	STA SIM_CURRENT_TEAM_WITH_BALL						                                ; 
	STX TEAM_ON_OFFENSE						                                            ; SAVE CURRENT TEAM POSSESION  
	INC SIM_DO_KICKOFF_BOOL						                                        ; SET NEED TO DO KICKOFF = TRUE
	LDX #MINUTES_PER_QUARTER_SIM						                                ; SET OVERTIME MINUTES = 6
	LDA SIM_IS_IS_PLAYOFFS_BOOL						                                    ; DOES GAME TYPE = SEASON
	BEQ @save_minutes						                                            ;
	
@set_playoff_minutes_to_really_long	
	LDX #$7F						                                                    ; SET MINUTES =  REALLY LONG FOR MUST HAVE WINNER PLAYOFFS

@save_minutes:
	STX CLOCK_MINUTES						                                            ; SAVE MINUTES 
	LDA #SECONDS_PER_QUARTER_SIM						                                ; SET SECONDS = ZERO
	STA CLOCK_SECONDS						                                            ; 
	JSR SWAP_AND_CLEAR_SCOREBOARD						                                ; SWAP TO BANKS 17/18 (8000/A000), DO UPDATE SCOREBOARD, CLEAR SCORES, RETURN TO BANKS 12/13
	JMP LOAD_SIM_VALUES_FROM_ROM_TO_RAM					                                ; TRANSFER SIM VALUES TO RAM()

@check_end_of_reg_season_overtime:							                            ; TEAMS STILL TIED AT END OF SUDDEN DEATH OVERTIME/
	LDA SIM_IS_IS_PLAYOFFS_BOOL						                                    ; DOES GAME TYPE = SEASON 
	BEQ @set_game_to_over						                                        ; YES->SET GAME STATUS TO GAME OVER, QUARTER = 6TH QUARTER/END OF GAME
	
@check_tied_playoff_over_time:															; *** redundant
	LDA P1_TOTAL_SCORE						                                            ; DOES P1 SCORE = P2 SCORE
	EOR P2_TOTAL_SCORE						                                            ;
	BNE @set_game_to_over						                                        ; NO -> SET GAME STATUS TO GAME OVER, QUARTER = 6TH QUARTER/END OF GAME


@set_random_winner_for_playoff_over_time:								                ; GIVE TEAM SAFETY TO END GAME IN PLAYOFF OVERTIME
	LDA #OVERTIME_QUARTER						                                                    ; RESET QUARTER = OVERTIME	
	STA QUARTER						                                                    ; 
	LDA RANDOM_1						                                                ; RANDOMIZE WHICH TEAM SCORES (50%)
	AND #$01						                                                    ;
	STA TEAM_ON_OFFENSE						                                            ;
	LDA #SAFETY_POINTS						                                            ; SET SCORE TO ADD = SAFTEY
	STA SIM_PTS_TO_ADD_TO_SCORE						                                    ; SCORE TO ADD TO QUARTER SCORE
	JSR SIM_UPDATE_QTR_TOTAL_SCORE					                                    ; UPDATE TEAM QTR AND TOTAL SCORE($6F= P1 OR P2 TEAM INDEX)

@set_game_to_over:							                                            ; SET GAME STATUS TO GAME OVER, QUARTER = 6TH QUARTER/END OF GAME
	LDA #$80						                                                    ; GAME STATUS = GAME OVER
	STA SIM_GAME_STATUS						                                            ;
	LDA #OVERTIME_QUARTER +1						                                     ; SET QUARTER = 6TH QUARTER = END OF GAME 
	STA QUARTER						                                                    ;
	RTS							                                                        ; RETURN
	
_F}_DO_SIM_UPDATE_CLOCK_CHECK_GAME_OR_QUARTER_OVER	

_F{_DO_SIM_RANDOMIZE_MORE																; DONE

SIM_RANDOMIZE_MORE:						                                                ; RANDOMIZE RANDOM NUMBERS MORE AND SAVE RANDOM NUMBERS ()
	LDA RANDOM_1						                                                ;
	ADC RANDOM_1						                                                ;
	CLC							                                                        ;
	ADC RANDOM_1						                                                ;	
	CLC							                                                        ;
	ADC #$11						                                                    ;
	STA RANDOM_1						                                                ;
	LDA RANDOM_2						                                                ;
	ADC RANDOM_2						                                                ;
	CLC							                                                        ;
	ADC RANDOM_2						                                                ;
	CLC							                                                        ;
	ADC RANDOM_2						                                                ;
	CLC							                                                        ;
	ADC RANDOM_2						                                                ;
	CLC							                                                        ;
	ADC #$13						                                                    ;
	STA RANDOM_2						                                                ;
	LDA RANDOM_3						                                                ;
	ADC RANDOM_3						                                                ;
	CLC							                                                        ;
	ADC RANDOM_3						                                                ;
	CLC							                                                        ;
	ADC RANDOM_3						                                                ;
	CLC							                                                        ;
	ADC RANDOM_3						                                                ;
	CLC							                                                        ;
	ADC RANDOM_3						                                                ;
	CLC							                                                        ;
	ADC RANDOM_3						                                                ;
	CLC							                                                        ;
	ADC #$AD						                                                    ;
	STA RANDOM_3						                                                ;
	RTS							                                                        ; RETURN
	
_F}_DO_SIM_RANDOMIZE_MORE	

_F{_DO_SIM_SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS									; DONE


SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS:							                ; UPDATE PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE), BUFFER TEMP VARIABLES $44-4A
	STA SIM_ROSTER_ID_UPDATE_STATS						                                ; SAVE PLAYER ID
	STX SIM_STAT_TO_UPDATE						                                        ; SAVE STAT COMMAND
	
	LDX #$07						                                                    ; *** WHY IS THIS NEEDEDED  SHOULD START WITH 3E AND NOT 44 
	
_WHILE PLUS

	LDA LOCAL_7,X						                                                ; SAVE TEMP VARIABLES IN BUFFER
	STA SIM_SAVE_LOCAL_VARS[],X						                                    ;
	DEX							                                                        ;

_END_WHILE					                                                   	 		;

	LDA SIM_ROSTER_ID_UPDATE_STATS						                                ; LOAD PLAYER ID
	LDX SIM_STAT_TO_UPDATE						                                        ; LOAD STAT COMMAND		 
	JSR UPDATE_IN_GAME_STATS_WITH_ERROR_CHECK					                        ; UPDATE PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE)
	
   LDX #$07
_WHILE PLUS

	LDA SIM_SAVE_LOCAL_VARS[],X						                                    ; RESTORE TEMP VARIABLES FROM BUFFER
	STA LOCAL_7,X						                                                ;
	DEX							                                                        ;

_END_WHILE						                                                        ;
	RTS							                                                        ; RETURN
	
_F}_DO_SIM_SAVE_SIM_PLAY_STATS_TO_IN_GAME_PLAYER_STATS	

_F{_SIM_MATH_FUNCTIONS																	; DONE

SIM_A_TIMES_X_SAVE_IN_LOCAL_1:	                                                        ; MULTIPLY( A * X) RESULT $3E,3F same as fixed ank but moves result to local,1,2 for divide

result 				= LOCAL_1
player_sim_value	= LOCAL_3
rand_pct			= LOCAL_4

	STA player_sim_value		                                                        ;
	STX rand_pct				                                                        ;
	LDA #$00					                                                        ;
	STA result						                                                    ;
	LDX #$08						                                                    ; SET BITS = 8

_WHILE NOT_EQUAL

	LSR player_sim_value						                                        ;
	BCC @save_and_go_to_next_bit						                                                    ;
	CLC							                                                        ;
	ADC rand_pct						                                                ;

@save_and_go_to_next_bit:	
	ROR							                                                        ;
	ROR result					                                                        ;
	DEX							                                                        ;

_END_WHILE
						                                                    ;
	STA result+1						                                                ;
	RTS							                                                        ; RETURN


	
													                                    ; A= RANDOM VALUE, X=MAX VALUE+1
GET_RAND_VAL_FROM_ZERO_TO_MAX:						                                    ; SET VALUE TO (0 TO X-1) RESULT: A

rand_value 				= LOCAL_1
max_value 				= LOCAL_2

	STA rand_value					                                                    ;
	STX max_value 					                                                    ;
	LDA #$00						                                                    ;
	LDX #$08						                                                    ; SET BITS = 8
	ASL rand_value					                                                    ;

_WHILE NOT_EQUAL

	ROL							                                                        ;
	CMP max_value 						                                                ;
	BCC @save_and_go_to_next_bit					                                                        ;
	SBC max_value 						                                                ;

@save_and_go_to_next_bit:
	ROL rand_value						                                                ;
	DEX							                                                        ; BITS LEFT TO CHECK--

_END_WHILE			                                                            ;

	RTS							                                                        ; RETURN

adjusted_sim_value	= LOCAL_1
result				= LOCAL_1	
divisor				= LOCAL_3
	
DIVIDE_ADJUSTED_SIM_VAL:							                                    ; DIVIDE (3F,3E / A)  RESULT $3E,3F
	STA divisor						                                                    ;
	STX adjusted_sim_value		                                                        ;
	STY adjusted_sim_value+1	                                                        ;
	LDX #$10					                                                        ; SET BITS = 16 
	LDA #$00					                                                        ;
	ASL adjusted_sim_value		                                                        ;
	ROL adjusted_sim_value+1	                                                        ;
@Loop1:
	ROL							                                                        ;
	CMP divisor					                                                        ;
	BCC @Loop2					                                                        ;
	SBC divisor					                                                        ;
@Loop2:
	ROL result					                                                        ;
	ROL result+1				                                                        ;
	DEX							                                                        ; BITS LEFT TO CHECK--
	BNE @Loop1						                                                    ;
	RTS							                                                        ; RETURN

_F}_SIM_MATH_FUNCTIONS	

_F{_SIM_UPDATE_QTR_TOTAL_SCORE															; DONE
	
TEAM_QTR_SCORE[]			= P1_QTR_SCORES  	
TEAM_TOTAL_SCORE[] 			= P1_TOTAL_SCORE
team_score_qtr_total_offset	= LOCAL_7
OFFSET_TO_P2_SCORES			= P2_QTR_SCORES - P1_QTR_SCORES
	
SIM_UPDATE_QTR_TOTAL_SCORE:			                                                    ; UPDATE TEAM QTR AND TOTAL SCORE($6F= P1 OR P2 TEAM INDEX)
	LDX TEAM_ON_OFFENSE						                                            ; LOAD CURRENT TEAM INDEX
	BEQ @update_scores				                                                    ;

@set_p2_scores_offset: 	
	LDX #OFFSET_TO_P2_SCORES		                                                    ; SET TEAM SCORE START INDEX TO PLAYER 2
	
@update_scores:
	STX team_score_qtr_total_offset						                                ; SAVE TEAM START INDEX
	LDA QUARTER						                                                    ; TEAM SCORE INDEX = TEAM SCORE START INDEX INDEX + QUARTER OFFSET
	AND #$03						                                                    ;
	CLC							                                                        ;
	ADC team_score_qtr_total_offset						                                ;
	TAY							                                                        ;
	LDA TEAM_TOTAL_SCORE[],X						                                    ; LOAD CURRENT TOTAL SCORE
	JSR ADD_CURRENT_SCORE_TO_QTR_OR_TOTAL					                            ; ADD CURRENT SCORE TO QUARTER OR TEAM SCORE, MAX VALUE = 99()
	STA TEAM_TOTAL_SCORE[],X						                                    ; SAVE CURRENT TEAM TOTAL SCORE
	LDA TEAM_QTR_SCORE[],Y						                                        ; 
	JSR ADD_CURRENT_SCORE_TO_QTR_OR_TOTAL					                            ; ADD CURRENT SCORE TO QUARTER OR TEAM SCORE, MAX VALUE = 99()
	STA P1_QTR_SCORES,Y						                                            ; SAVE CURRENT TEAM TR SCORE
	LDA #$00						                                                    ; CLEAR SCORE TO ADD TO QUARTER SCORE = 0
	STA SIM_PTS_TO_ADD_TO_SCORE						                                    ;
	RTS							                                                        ; RETURN


	
ADD_CURRENT_SCORE_TO_QTR_OR_TOTAL:							                            ; ADD CURRENT SCORE TO QUARTER OR TEAM SCORE, MAX VALUE = 99()

qtr_or_total_score	= LOCAL_7
score_upper_digit 	= LOCAL_8	

	STA qtr_or_total_score						                                        ; 
	AND #$F0						                                                    ; 
	STA score_upper_digit						                                        ; 
	LDA qtr_or_total_score						                                        ;
	AND #$0F						                                                    ;
	CLC							                                                        ;
	ADC SIM_PTS_TO_ADD_TO_SCORE						                                    ; + SCORE TO ADD TO QUARTER SCORE
	CMP #$0A						                                                    ;
	BCC @add_to_upper_digit						                                        ;
	SEC							                                                        ;
	SBC #$0A						                                                    ;
	STA qtr_or_total_score						                                        ;
	LDA score_upper_digit						                                        ;
	CLC							                                                        ;
	ADC #$10						                                                    ;
	ORA qtr_or_total_score						                                        ;
	BNE @check_for_score_greater_than_two_digits						                    ;
	
@add_to_upper_digit:
	ORA score_upper_digit						                                        ;
	
@check_for_score_greater_than_two_digits:							                    ; CHECK FOR VALUE GREATER THAN 99 AND SET TO 99 IF SO
	CMP #MAX_SCORE_LIMIT_SIM +1 						                                    ;
	BCC @exit						                                                    ;
	LDA #MAX_SCORE_LIMIT_SIM						                                        ;
@exit:							                                                        ; EXIT
	RTS							                                                        ; RETURN

_F}_SIM_UPDATE_QTR_TOTAL_SCORE	

_F{_SIM_STAT_INDEX_TABLES																; DONE
	
YARDAGE_SEASON_STAT_INDEX_TABLE:							                            ; PLAY YARDAGE STAT INDEXES
	.DB SKILL_REC_YDS_SEASON_STAT_INDEX 						                        ; PASS PLAY
	.DB SKILL_RUN_YDS_SEASON_STAT_INDEX							                        ; RUN PLAY
	.DB QB_RUSH_YDS_SEASON_STAT_INDEX						                            ; QB RUN
	.DB QB_RUSH_YDS_SEASON_STAT_INDEX							                        ; QB SACKED

TOUCHDOWN_SEASON_STAT_INDEX_TABLE:							                            ; INDEX TO TD STAT COMMANDS
	.DB SKILL_REC_TD_SEASON_STAT_INDEX								                    ; PASS PLAY 
    .DB SKILL_RUN_TD_SEASON_STAT_INDEX 						                            ; RUN PLAY
    .DB QB_RUSH_TD_SEASON_STAT_INDEX							                        ; QB RUN
 
_F}_SIM_STAT_INDEX_TABLES
 
 _F{_SIM_CONDITION_AND_DEFENSE_AND_PASS_OUTCOME_TABLES									; DONE
 
SIM_CONDITION_MODIFIER_TABLE:							                                ; CONDITION MODIFIERS
	.DB	$FE, $FF 					                                                    ; BAD CONDITION -1 OR -2
	.DB	$00, $00 					                                                    ; AVERAGE CONDITION 0
	.DB	$01, $02 					                                                    ; GOOD CONDITION 1 OR 2
	.DB	$03, $04					                                                    ; EXCELLENT CONDTIION 3 OR 4

SIM_DEFENSE_ADJUST_VALUE_TO_ADD_TABLE:							                        ; PLAY CALL DEFENSE ADJUST MAX VALUE TO ADD
	.DB $32, $41, $50, $32			                                                    ; DIFFERENT TYPE, SAME TYPE 1, SAME TYPE2, BLITZ  

SIM_DEFENSE_BASE_VALUE:							                                        ; PLAY CALL DEFENSE ADJUST MIN VALUE
	.DB $00, $00, $14, $64			                                                    ; DIFFERENT TYPE, SAME TYPE 1, SAME TYPE2, BLITZ  

SIM_PASS_OUTCOME_TABLE:							                                        ; SIM_PASSING SKILL_VALUES					
								                                                        ;                   COMPLETE %, INC%,SACK%, INT% (= 100%- THREE OTHERS)
	.DB $1A,$80,$40					                                                    ; OUTCOME RANGE 1     10%    ,  50%, 25%,  15%
	.DB $4D,$66,$33					                                                    ; OUTCOME RANGE 2     30%    ,  40%, 20%,  10%
	.DB $80,$4D,$26					                                                    ; OUTCOME RANGE 3     50%    ,  30%, 15%,   5%  
	.DB $B3,$26,$1F					                                                    ; OUTCOME RANGE 4     70%    ,  15%, 12%,   3%
	.DB $E6,$0A,$0D					                                                    ; OUTCOME RANGE 5     90%    ,   4%,  5%,   0.5%
 
 _F}_SIM_CONDITION_AND_DEFENSE_AND_PASS_OUTCOME_TABLES

 _F{_TEAM_SIM_DATA_VALUE_LOOKUP															; DONE

SIM_YARDAGE_VALUES:							                                            ; SIM_RUSHING YARD_VALUES, SIM RECEPTION YARD VALUES
	.DB $B4,$B9,$BE,$C3,$C8,$CD,$D2,$D7,$DC,$E1,$E6,$EB,$F0,$F5,$FA,$FF
	
SIM_PASS_REC_VALUES:							                                        ; SIM_PASS_COMP_VALUES, SIM_PASS_REC_VALUES
	.DB $5F,$62,$65,$68,$6B,$6E,$71,$74,$77,$7A,$7D,$80,$83,$86,$89,$96
	
SIM_RUN_DEFENSE_VALUES:							                                        ; SIM_RUN DEFENSE_VALUES
	.DB $5F,$69,$70,$7A,$A4,$A6,$A8,$AA,$AC,$AE,$B0,$BC,$BE,$C0,$C2,$E3
	
SIM_PASS_DEFENSE_VALUES:							                                    ; SIM_PASS DEFENSE_VALUES
	.DB $74,$76,$78,$90,$94,$A2,$A6,$B2,$B0,$B2,$B4,$B6,$B8,$CA,$CC,$DD
	
SIM_KICKING_VALUES:							                                            ; SIM_KICKING_VALUES
	.DB $D2,$D5,$D8,$DB,$DE,$E1,$E4,$E7,$EA,$ED,$F0,$F3,$F6,$F9,$FC,$FF
	
SIM_PUNTING_VALUES:							                                            ; SIM_PUNTING_VALUES
	.DB $1E,$1F,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D
	
SIM_POCKET_VALUES:							                                            ; SIM QB_POCKET_VALUES
	.DB $33,$19,$0D,$08
	
SIM_TARGET_VALUES:							                                            ; SIM_TARGET_VALUES
	.DB $00,$14,$19,$21,$26,$2E,$33,$3B,$40,$47,$4C,$54,$59,$66,$73,$80
	
 _F}_TEAM_SIM_DATA_VALUE_LOOKUP	

_F{_TEAM_SIM_VALUES																		; DONE
	
TEAM_SIM_DATA_POINTER_TABLE:
	.WORD BUFFALO_SIM_DATA, INDIANAPOLIS_SIM_DATA, MIAMI_SIM_DATA, NEW_ENGLAND_SIM_DATA, NEW_YORK_JETS_SIM_DATA
	.WORD CINCINNATI_SIM_DATA, CLEVELAND_SIM_DATA, HOUSTON_SIM_DATA, PITTSBURGH_SIM_DATA
	.WORD DENVER_SIM_DATA, KANSAS_CITY_SIM_DATA, LOS_ANGELES_RAIDERS_SIM_DATA, SAN_DIEGO_SIM_DATA, SEATTLE_SIM_DATA
	.WORD WASHINGTON_SIM_DATA, NEW_YORK_GIANTS_SIM_DATA, PHILADELPHIA_SIM_DATA, PHOENIX_SIM_DATA, DALLAS_SIM_DATA
	.WORD CHICAGO_SIM_DATA, DETROIT_SIM_DATA, GREEN_BAY_SIM_DATA, MINNESOTA_SIM_DATA, TAMPA_BAY_SIM_DATA
	.WORD SAN_FRANCISCO_SIM_DATA, LOS_ANGELES_RAMS_SIM_DATA, NEW_ORLEANS_SIM_DATA, ATLANTA_SIM_DATA
	.WORD UNUSED_ONE_SIM_DATA, UNUSED_TWO_SIM_DATA
  
BUFFALO_SIM_DATA:  																			; BUFFALO_SIM
	.DB $3C,$03, $33,$02								                                ; QB1-QB2 SIM VALUES	running skill, passing skill, scramble (max 03)		
	.DB $A7,$88, $53,$62, $52,$72, $33,$82					                            ; RB1-RB4 SIM VALUES    runskill, rec skill, rec yards, target chance	
	.DB $18,$D6, $19,$AA, $14,$D2, $14,$72					                            ; WR1-WR4 SIM VALUES
	.DB $16,$76, $13,$52								                                ; TE1-TE2 SIM VALUES
	.DB $74, $1E, $19, $19, $0D, $0D, $1D, $00, $00, $02, $02		                    ; DEFENDER SIM SACK VALUES (MUST ADD TO 255)
	.DB $07, $07, $12, $19, $0A, $0D, $07, $19, $40, $27, $28		                    ; DEFENDER SIM INT VALUES (MUST ADD TO 255)	
	.DB $63										                                        ; K AND P SIM VALUE
	.DB $AB										                                        ; RUN DEFENSE AND PASS DEFENSE SIM VALUE 

INDIANAPOLIS_SIM_DATA:                                                                                     
	.DB $14,$03, $22,$02
	.DB $32,$22, $55,$4A, $31,$32, $41,$22
	.DB $15,$5A, $14,$7A, $13,$62, $13,$72
	.DB $12,$52, $11,$42
	.DB $1F, $0D, $45, $26, $0D, $26, $2B, $00, $00, $05, $05
	.DB $05, $05, $06, $19, $08, $19, $0A, $12, $19, $40, $40
	.DB $5B
	.DB $24
 
MIAMI_SIM_DATA 																		
	.DB $1A,$03, $24,$02
	.DB $72,$90, $45,$76, $52,$70, $34,$70
	.DB $15,$A6, $16,$B8, $19,$80, $18,$A2
	.DB $16,$A4, $69,$86
	.DB $56, $08, $26, $10, $08, $08, $31, $08, $08, $08, $10
	.DB $05, $00, $00, $05, $05, $06, $05, $0D, $40, $4C, $4C
	.DB $AB
	.DB $7C
 
NEW_ENGLAND_SIM_DATA																	
	.DB $13,$02, $22,$02
	.DB $32,$50, $53,$54, $32,$62, $32,$30
	.DB $15,$8A, $14,$76, $14,$62, $13,$72
	.DB $14,$58, $13,$40
	.DB $26, $19, $4C, $2E, $0D, $07, $19, $00, $00, $00, $19
	.DB $00, $00, $00, $07, $00, $00, $06, $40, $59, $40, $19
	.DB $94
	.DB $03
 
NEW_YORK_JETS_SIM_DATA 																	
	.DB $24,$02, $22,$02
	.DB $43,$54, $42,$62, $32,$50, $22,$50
	.DB $15,$7A, $14,$88, $13,$62, $13,$70
	.DB $14,$66, $13,$40
	.DB $26, $2B, $0D, $08, $6C, $0C, $08, $02, $02, $09, $0E
	.DB $00, $00, $00, $03, $07, $26, $03, $26, $26, $4D, $33
	.DB $BA
	.DB $44

CINCINNATI_SIM_DATA:                                                                                       
	.DB $49,$02, $23,$02
	.DB $A4,$82, $73,$72, $52,$70, $42,$60
	.DB $17,$CA, $17,$B6, $15,$72, $15,$A2
	.DB $17,$A6, $13,$A2
	.DB $07, $26, $26, $75, $07, $07, $07, $00, $00, $1B, $07
	.DB $03, $26, $30, $00, $07, $00, $00, $26, $26, $4D, $33
	.DB $96
	.DB $54

CLEVELAND_SIM_DATA:                                                                                        
	.DB $23,$02, $22,$02
	.DB $43,$46, $35,$46, $31,$40, $31,$30
	.DB $15,$86, $14,$76, $13,$70, $14,$76
	.DB $13,$52, $11,$60
	.DB $0C, $0C, $41, $19, $19, $26, $42, $00, $00, $05, $07
	.DB $00, $00, $00, $33, $19, $19, $0C, $19, $19, $1C, $0C
	.DB $53
	.DB $38

HOUSTON_SIM_DATA:                                                                                      
	.DB $5B,$03, $22,$02
	.DB $45,$80, $1A,$C8, $32,$70, $32,$40
	.DB $1A,$C8, $1A,$C8, $32,$40, $16,$C0
	.DB $18,$B7, $65,$A0
	.DB $59, $14, $3B, $0C, $07, $05, $3B, $00, $00, $00, $04
	.DB $00, $00, $00, $03, $01, $01, $00, $6F, $33, $33, $19
	.DB $5A
	.DB $A8
 
PITTSBURGH_SIM_DATA:
	.DB $23,$02, $22,$02
	.DB $64,$58, $54,$50, $42,$50, $22,$60
	.DB $15,$6A, $14,$74, $14,$60, $14,$72
	.DB $14,$64, $13,$54
	.DB $21, $40, $33, $33, $14, $0C, $0C, $00, $00, $05, $07
	.DB $02, $02, $07, $16, $15, $0C, $0C, $4C, $26, $26, $19
	.DB $95
	.DB $6E

DENVER_SIM_DATA:                                                                                    
	.DB $57,$01, $23,$02
	.DB $94,$62, $35,$82, $42,$71, $34,$82
	.DB $16,$9A, $18,$AA, $14,$A2, $15,$92
	.DB $15,$74, $13,$42
	.DB $19, $14, $21, $2E, $14, $02, $66, $00, $00, $00, $07
	.DB $00, $00, $00, $14, $0C, $07, $19, $33, $33, $33, $26
	.DB $AC
	.DB $67
 
KANSAS_CITY_SIM_DATA: 
	.DB $16,$03, $22,$02
	.DB $81,$50, $61,$60, $34,$86, $33,$62
	.DB $14,$76, $16,$8A, $14,$60, $15,$76
	.DB $12,$50, $12,$50
	.DB $14, $1E, $18, $89, $06, $05, $11, $00, $00, $00, $00
	.DB $00, $01, $05, $05, $05, $05, $05, $66, $33, $33, $19
	.DB $C4
	.DB $87
  
LOS_ANGELES_RAIDERS_SIM_DATA:  
	.DB $25,$02, $24,$02
	.DB $C1,$90, $63,$92, $53,$70, $41,$70
	.DB $16,$BA, $15,$DA, $54,$A2, $12,$D2
	.DB $54,$96, $11,$C0
	.DB $47, $15, $26, $33, $33, $01, $0C, $01, $07, $01, $01
	.DB $14, $01, $01, $01, $01, $14, $14, $26, $33, $33, $33
	.DB $84
	.DB $7C
 
SAN_DIEGO_SIM_DATA:
	.DB $32,$02, $21,$02
	.DB $72,$42, $41,$50, $33,$30, $44,$48
	.DB $14,$72, $16,$6C, $13,$62, $13,$40
	.DB $13,$54, $12,$42
	.DB $40, $07, $33, $59, $05, $02, $14, $00, $00, $00, $11
	.DB $01, $00, $01, $0C, $01, $01, $14, $23, $80, $14, $14
	.DB $BA
	.DB $78
 
SEATTLE_SIM_DATA: 
	.DB $46,$02, $24,$02
	.DB $68,$7C, $62,$62, $32,$60, $32,$40
	.DB $16,$78, $16,$98, $15,$82, $15,$B2
	.DB $13,$80, $13,$90
	.DB $1F, $10, $58, $37, $10, $10, $06, $04, $04, $05, $0E
	.DB $01, $00, $01, $0C, $00, $33, $0C, $19, $40, $40, $19
	.DB $66
	.DB $88
	
WASHINGTON_SIM_DATA:                                                                                  
	.DB $25,$03, $23,$02
	.DB $84,$84, $18,$A8, $61,$70, $34,$82
	.DB $4A,$99, $65,$A1, $32,$40, $17,$96
	.DB $13,$71, $13,$A1
	.DB $14, $07, $40, $33, $05, $21, $3E, $02, $02, $07, $02
	.DB $00, $01, $02, $0C, $01, $01, $01, $33, $73, $26, $21
	.DB $73
	.DB $98

NEW_YORK_GIANTS_SIM_DATA:                                                                                       
	.DB $2A,$03, $54,$00
	.DB $73,$74, $76,$86, $42,$82, $54,$76
	.DB $18,$D6, $18,$D6, $15,$72, $15,$92
	.DB $16,$96, $13,$A2
	.DB $26, $19, $02, $73, $21, $02, $0C, $01, $01, $01, $19
	.DB $00, $00, $00, $06, $06, $26, $02, $59, $21, $0C, $45
	.DB $7C
	.DB $DB
 
PHILADELPHIA_SIM_DATA: 
	.DB $B9,$00, $24,$03
	.DB $39,$8C, $63,$72, $52,$72, $32,$70
	.DB $17,$D4, $16,$B4, $15,$A2, $15,$70
	.DB $18,$A6, $12,$80
	.DB $30, $0C, $61, $09, $07, $05, $30, $05, $05, $0C, $07
	.DB $03, $0D, $0E, $03, $03, $0C, $0C, $2F, $2F, $4C, $19
	.DB $77
	.DB $E3
 
PHOENIX_SIM_DATA:
	.DB $54,$00, $22,$02
	.DB $73,$62, $14,$9A, $31,$30, $32,$50
	.DB $16,$8A, $14,$92, $41,$40, $13,$76
	.DB $11,$50, $12,$52
	.DB $19, $07, $40, $66, $14, $07, $14, $01, $07, $01, $01
	.DB $01, $01, $02, $07, $19, $05, $0C, $3B, $21, $22, $4C
	.DB $2B
	.DB $1A
 
DALLAS_SIM_DATA:
	.DB $45,$02, $22,$02
	.DB $73,$63, $44,$65, $31,$31, $51,$41
	.DB $15,$7A, $13,$81, $14,$61, $14,$71
	.DB $17,$7A, $12,$61
	.DB $2E, $26, $40, $0F, $07, $40, $0D, $02, $02, $02, $02
	.DB $02, $02, $02, $09, $07, $02, $07, $21, $4F, $21, $4F
	.DB $68
	.DB $6B
 
CHICAGO_SIM_DATA: 
	.DB $35,$02, $23,$02
	.DB $65,$78, $85,$87, $41,$50, $53,$50
	.DB $15,$95, $15,$96, $15,$81, $14,$94
	.DB $11,$92, $12,$81
	.DB $66, $21, $54, $00, $01, $07, $01, $00, $14, $00, $07
	.DB $02, $02, $02, $14, $02, $07, $14, $35, $19, $66, $14
	.DB $64
	.DB $CA
 
DETROIT_SIM_DATA: 
	.DB $63,$02, $43,$01
	.DB $C3,$86, $14,$74, $31,$60, $64,$72
	.DB $17,$5A, $16,$88, $32,$40, $13,$72
	.DB $13,$82, $13,$81
	.DB $21, $14, $21, $68, $05, $14, $14, $03, $07, $07, $03
	.DB $01, $01, $01, $0F, $05, $0C, $07, $19, $3D, $26, $59
	.DB $47
	.DB $16
 
GREEN_BAY_SIM_DATA: 
	.DB $35,$02, $22,$02
	.DB $43,$62, $52,$61, $41,$30, $34,$30
	.DB $18,$9C, $15,$78, $14,$71, $54,$84
	.DB $13,$84, $12,$81
	.DB $30, $09, $3D, $50, $0B, $09, $09, $07, $05, $07, $09
	.DB $01, $01, $01, $03, $09, $02, $33, $47, $14, $19, $47
	.DB $83
	.DB $55

MINNESOTA_SIM_DATA:                                                                                     
	.DB $25,$02, $43,$02
	.DB $74,$74, $32,$40, $52,$52, $42,$51
	.DB $15,$96, $17,$9A, $13,$71, $14,$83
	.DB $15,$86, $12,$30
	.DB $4F, $3B, $2E, $14, $14, $01, $01, $01, $01, $07, $14
	.DB $2E, $07, $07, $0C, $03, $04, $0C, $19, $19, $0C, $66
	.DB $73
	.DB $4C

TAMPA_BAY_SIM_DATA:                                                                                      
	.DB $54,$00, $22,$02
	.DB $66,$56, $55,$36, $32,$40, $32,$31
	.DB $17,$78, $16,$76, $15,$52, $15,$62
	.DB $15,$64, $13,$40
	.DB $09, $26, $0C, $40, $08, $19, $57, $03, $03, $03, $03
	.DB $01, $01, $01, $01, $07, $01, $01, $59, $26, $40, $33
	.DB $A5
	.DB $24
 
SAN_FRANCISCO_SIM_DATA 
	.DB $3C,$02, $46,$02
	.DB $67,$72, $59,$64, $65,$72, $64,$81
	.DB $6B,$C4, $1B,$DE, $17,$91, $17,$B1
	.DB $19,$A4, $14,$60
	.DB $40, $07, $2E, $07, $02, $03, $7A, $01, $01, $01, $01
	.DB $00, $00, $00, $01, $01, $07, $01, $33, $0C, $33, $73
	.DB $82
	.DB $FF
 
LOS_ANGELES_RAMS_SIM_DATA: 
	.DB $47,$01, $23,$02
	.DB $84,$62, $42,$50, $32,$70, $36,$76
	.DB $6B,$CA, $1A,$D6, $15,$81, $15,$B1
	.DB $17,$86, $13,$60
	.DB $16, $16, $2A, $18, $0E, $0E, $60, $05, $05, $06, $05
	.DB $01, $01, $01, $04, $04, $04, $04, $66, $07, $19, $66
	.DB $23
	.DB $81
 
NEW_ORLEANS_SIM_DATA: 
	.DB $26,$02, $23,$02
	.DB $73,$64, $52,$72, $62,$82, $53,$84
	.DB $17,$9C, $15,$76, $14,$81, $14,$A4
	.DB $13,$82, $13,$81
	.DB $33, $21, $19, $47, $05, $03, $26, $05, $02, $14, $02
	.DB $01, $01, $01, $03, $03, $03, $03, $4C, $0C, $4C, $4C
	.DB $89
	.DB $B6
   
ATLANTA_SIM_DATA   
	.DB $24,$03, $22,$02
	.DB $52,$51, $14,$74, $42,$52, $31,$51
	.DB $15,$66, $19,$9C, $31,$50, $13,$72
	.DB $14,$66, $12,$61
	.DB $4C, $21, $2E, $19, $03, $03, $21, $01, $01, $21, $01
	.DB $01, $01, $01, $04, $04, $04, $04, $3B, $3B, $3B, $3B
	.DB $39
	.DB $80

UNUSED_ONE_SIM_DATA                                                                    ; BEST TEAM SIM DATA
	.DB $FF,$03, $FF,$03
	.DB $FF,$F4, $FF,$F4, $FF,$F4, $FF,$F4
	.DB $FF,$F7, $FF,$F7, $FF,$F7, $FF,$F7
	.DB $FF,$F4, $FF,$F4
	.DB $74, $1E, $19, $19, $0D, $0D, $1D, $00, $00, $02, $02
	.DB $07, $07, $12, $19, $0A, $0D, $07, $19, $40, $27, $28
	.DB $FF
	.DB $FF
 
UNUSED_TWO_SIM_DATA                                                                    ; WORST TEAM SIM DATA
	.DB $00,$03, $00,$03
	.DB $00,$04, $00,$04, $00,$04, $00,$04
	.DB $00,$07, $00,$07, $00,$07, $00,$07
	.DB $00,$04, $00,$04
	.DB $1F, $0D, $45, $26, $0D, $26, $2B, $00, $00, $05, $05
	.DB $05, $05, $06, $19, $08, $19, $08, $08, $19, $59, $33
	.DB $00
	.DB $00
	
_F}_TEAM_SIM_VALUES
   


   
_F{_COM_PLAY_CALL_LOGIC_MACROS															; DONE

com_play_call			= LOCAL_3
yards_to_go				= LOCAL_5
yards_from_endzone		= LOCAL_7
.MACRO IF_YARDS_TO_GO_GREATER_THAN[amount_true] amount, true_addr

IF amount < 32

	LDA yards_to_go						                                                ; IS YARDS TO GO <= 1
	CMP #(amount * ONE_YARD) + 1						                                ;
	LDA yards_to_go + 1						                                            ;
	SBC #$00	
    BCC +					                                                    	 							                                                    
	JMP true_addr						                                                ;
    +:

ELSE
	LDA yards_to_go						                                                ; IS YARDS TO GO <= 1
	CMP #(amount%32 * ONE_YARD) + 1						                                ;
	LDA yards_to_go + 1						                                            ;
	SBC #(amount/32)	
    BCC +					                                                    	 							                                                    
	JMP true_addr	
	+:
ENDIF

.ENDM


.MACRO IF_YARDS_TO_GO_LESS_THAN_EQUAL_TO[amount_true] amount, true_addr

IF amount < 32

	LDA yards_to_go						                                             
	CMP #(amount * ONE_YARD) + 1						                            
	LDA yards_to_go + 1						                                          
	SBC #$00	
    BCS +					                                                    	 							                                                    
	JMP true_addr						                                              
    +:

ELSE
	LDA yards_to_go						                                               
	CMP #(amount%32 * ONE_YARD) + 1						                              
	LDA yards_to_go + 1						                                          
	SBC #(amount/32)	
    BCS +					                                                    	 							                                                    
	JMP true_addr	
	+:
ENDIF

.ENDM

.MACRO IF_YARDS_FROM_ENDZONE_GREATER_THAN[amount_true] amount, true_addr
	
	

IF amount < 32 

	LDA yards_from_endzone							                              
	CMP #(amount * ONE_YARD) 						                             
	LDA yards_from_endzone	 + 1						                                     
	SBC #$00	
    BCC +					                                                    	 							                                                    
	JMP true_addr						                                             
    +:

ELSE
	LDA yards_from_endzone							                                           
	CMP #(amount%32 * ONE_YARD) 					                            
	LDA yards_from_endzone	 + 1						                              
	SBC #(amount/32)	
    BCC +					                                                    	 							                                                    
	JMP true_addr	
	+:
ENDIF

.ENDM


.MACRO IF_YARDS_FROM_ENDZONE_LESS_THAN[amount_true] amount, true_addr

IF amount < 32

	LDA yards_from_endzone						                                       
	CMP #(amount * ONE_YARD) + 1						                             
	LDA yards_from_endzone + 1						                                          
	SBC #$00	
    BCS +					                                                    	 							                                                    
	JMP true_addr						                                           
    +:

ELSE
	LDA yards_from_endzone						                                        
	CMP #(amount%32 * ONE_YARD) + 1						                         
	LDA yards_from_endzone + 1						                                      
	SBC #(amount/32)	
    BCS +					                                                    	 							                                                    
	JMP true_addr	
	+:
ENDIF

.ENDM

_F}_COM_PLAY_CALL_LOGIC_MACROS

_F{_COM_PLAY_CALL_LOGIC_START															; DONE

COM_PLAY_CALL_LOGIC_START:							                                     ; COM GO FOR IT LOGIC

	LDA #$00						                                                    ;
	STA LOCAL_3						                                            ; CLEAR COM PLAY CALL VALUE
	STA LOCAL_4					                                                        ;
	STA LOCAL_1							                                                ;
	STA LOCAL_2						                                                    ;
	LDA CPU_SIDE_SAME_AS_OFF_BOOL						                                ; IS COM ON OFFENSE?
	BPL COM_OFFENSE_TIMEOUT_CHECK						                                ; YES-> COM ON OFFENSE TIMEOUT CHECK
	JMP CHECK_IF_COM_TAKES_TIMEOUT_ON_DEFENSE					                        ; NO-> COM ON DEFENSE TIMEOUT CHECK

_F}_COM_PLAY_CALL_LOGIC_START

_F{_COM_OFFENSE_TIMEOUT_LOGIC															; DONE

COM_OFFENSE_TIMEOUT_CHECK:							                                    ; COM ON OFFENSE TIMEOUT CHECK
								                                                        ; CHECK FOR 1ST QUARTER
	LDA QUARTER						                                                    ; IS QTR = FIRST QTR ?
	CMP #FIRST_QUARTER						                                            ;
	BNE @check_3rd_quarter						                                        ; NO->CHECK FOR 3RD QUARTER
	JMP COM_OFFENSE_PLAY_CALL_LOGIC_START						                                                    ; YES->CHECK DOWN AND DISTANCE

@check_3rd_quarter:							                                            ; CHECK FOR 3RD QUARTER
	CMP #THIRD_QUARTER						                                            ; IS QTR = THIRD QTR ?
	BNE @check_clock_running						                                    ; NO->CHECK FOR CLOCK RUNNING
	JMP COM_OFFENSE_PLAY_CALL_LOGIC_START						                                                    ; YES->CHECK DOWN AND DISTANCE

@check_clock_running:							                                        ; CHECK FOR CLOCK RUNNING(2ND AND 4TH QTR) 
	LDA CLOCK_RUN_TYPE						                                            ; DOES CLOCK STATUS = STOPPED
	BPL COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START					            ; YES->CHECK FOR FG, PUNT, NORMAL PLAY START
	
@check_timeouts_left:	
	LDA CPU_OFF_TIMEOUTS						                                        ; DOES CPU TIMEOUTS = 0
	BEQ COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START					            ; YES->CHECK FOR FG, PUNT, NORMAL PLAY START
	
@check_second_quarter:	
	LDA QUARTER						                                                    ; IS QTR = SECOND QTR ?
	CMP #SECOND_QUARTER						                                            ;
	BNE CHECK_COM_OFF_TIMEOUT_TRAILING_LATE_4TH					                                ; NO->CHECK FOR COM TRAILING UNDER TWO MIN 4TH
	
@check_less_than_two_minutes_left	
	LDA CLOCK_MINUTES						                                            ; IS MINUTES LEFT >= 2? 
	CMP #$02						                                                    ;
	BCS COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START					                ; YES->CHECK FOR FG, PUNT, NORMAL PLAY START
	BCC COM_75PCT_OFFENSIVE_TIMEOUT						                                ; NO->CHECK FOR TIMEOUT 25% NO, 75% YES

EXIT_COM_PLAY_CALL:							                                            ; EXIT COM LOGIC
	RTS							                                                        ; RETURN
 
CHECK_COM_OFF_TIMEOUT_TRAILING_LATE_4TH:							                    ; TIMEOUT CHECK FOR COM TRAILING UNDER TWO MIN 4TH
	LDA CLOCK_MINUTES						                                            ; IS MINUTES LEFT >= 2?
	CMP #$02						                                                    ;
	BCS CHECK_COM_OFF_TIMEOUT_TRAILING_EARLY_4TH						                ; YES->
	LDA CPU_OPP_SCORE 						                                            ; OPPONENT SCORE < COM TEAM SCORE					
    CMP CPU_OFF_SCORE 						                                                    ;  
	BCC COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START					                ; YES->CHECK FOR FG, PUNT, NORMAL PLAY START
	BCS COM_94PCT_OFFENSIVE_TIMEOUT						                                ; NO->CHECK FOR OFF TIMEOUT 7.3% NO, 93.7% YES

CHECK_COM_OFF_TIMEOUT_TRAILING_EARLY_4TH:							                    ; 2ND OR 4TH QTR, CHECK FOR COM BEHIND <3 MINUTES
	LDA CLOCK_MINUTES						                                            ; IS MINUTES LEFT >= 3?
	CMP #$03						                                                    ;
	BCS COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START					                ; YES->CHECK FOR 4TH DOWN
	LDA CPU_OPP_SCORE 						                                                    ; OPPONENT SCORE < COM TEAM SCORE
	CMP CPU_OFF_SCORE 						                                                    ;  
	BCC COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START					                ; YES->CHECK FOR 4TH DOWN
	BCS COM_75PCT_OFFENSIVE_TIMEOUT						                                ; NO->CHECK FOR TIMEOUT 25% NO, 75% YES

COM_75PCT_OFFENSIVE_TIMEOUT:							                                 ; CHECK FOR OFF TIMEOUT 25% NO, 75% YES
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	CMP #$C0						                                                    ; RAND >=C0
	BCS COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START					                ; 25% CHANCE-> CHECK FOR 4TH DOWN
	BCC COM_TAKES_OFFENSIVE_TIMEOUT						                                 ; 75% CHANCE-> COM TAKE TIMEOUT ON OFFENSE

COM_94PCT_OFFENSIVE_TIMEOUT:							                                ; CHECK FOR OFF TIMEOUT 7.3% NO, 93.7% YES
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	CMP #$F0
	BCS COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START					                                                    ; YES->CHECK FOR 4TH DOWN

COM_TAKES_OFFENSIVE_TIMEOUT:							                                ; COM TAKE TIMEOUT ON OFFENSE
	LDA CLOCK_RUN_TYPE						                                            ; SET CLOCK STATUS = STOPPED
	AND #$7F						                                                    ;
	STA CLOCK_RUN_TYPE						                                            ;
	DEC CPU_OFF_TIMEOUTS						                                        ; COM TIMEOUTS--
	
_F}_COM_OFFENSE_TIMEOUT_LOGIC	

_F{_COM_DOWN_PLAY_CALL_LOGIC															; DONE

COM_SECOND_OR_FOURTH_QTR_OFFENSIVE_LOGIC_START:							                ; CHECK FOR FG, PUNT, NORMAL PLAY START
	LDA DOWN						                                                    ; IS DOWN = 4TH
	CMP #FOURTH_DOWN						                                            ;
	BEQ COM_OFFENSE_PLAY_CALL_LOGIC_START						                        ; YES->CHECK FOR PUNT OR FG, HEAVY RUN LATE OR CLOSE SITUATIONS
	LDA yards_from_endzone						                                        
	CMP #(40%32 * ONE_YARD) + 1						                         
	LDA yards_from_endzone + 1						                                      
	SBC #(40/32)	
	BCS CHECK_WITHIN_5_YARDS_OF_EITHER_ENDZONE				                                                    	 							                                                    
	JMP CHECK_FOR_COM_FG_NOT_4TH_DOWN	
	

CHECK_2ND_DOWN_YARDS_TO_GO:							                                ; 2ND DOWN CHECK FOR YARDS TO GO (<=1)
	IF_YARDS_TO_GO_GREATER_THAN[amount_true] 1, DO_OFFENSIVE_STYLE_UNLESS_LATE_IN_GAME 
	JMP HEAVY_RUN_80PCT_COM_PLAY_CALL						                            ; JUMP-> HEAVILY RANDOMIZED PLAY CALL 80% RUN, 20% PASS

COM_GET_PLAY_CALL_BASED_ON_YARDS_TO_GO:							                        ; GET PLAY CALL BASED ON TO YARDS TO GO
	
	IF_YARDS_TO_GO_LESS_THAN_EQUAL_TO[amount_true] 3, HEAVY_RUN_80PCT_COM_PLAY_CALL 
								                                                    ; CHECK FOR MORE THAN 7 YARDS TO GO
	IF_YARDS_TO_GO_LESS_THAN_EQUAL_TO[amount_true] 7, DO_OFFENSIVE_STYLE_UNLESS_LATE_IN_GAME
	JMP DO_HEAVY_PASS_80PCT_COM_PLAY_CALL						                        ; YES->HEAVILY RANDOMIZED PLAY CALL 20% RUN, 80% PASS 

COM_OFFENSE_PLAY_CALL_LOGIC_START:							                            ; CHECK FOR PUNT OR FG, HEAVY RUN LATE OR CLOSE SITUATIONS
	LDA DOWN						                                                    ; IS DOWN = 4TH DOWN
	CMP #FOURTH_DOWN						                                            ; 
	BNE @check_close_to_own_opp_endzone						                            ; NO->CHECK FOR WITHIN 3 YARDS OF SCORING 	
	LDA yards_from_endzone						                                        ; IS DISTANCE FROM ENDZONE >= 41 YARDS 
	CMP #$48						                                                    ;
	LDA yards_from_endzone + 1						                                    ;
	SBC #$01						                                                    ;
	BCS CHECK_FOR_COM_PUNT						                                        ; YES->  CHECK FOR PUNT
	JMP CHECK_FOR_FG_4TH_DOWN_WITHIN_41_YARDS						                                                    ; YES->  CHECK FOR FIELD GOAL

@check_close_to_own_opp_endzone:							                            ; CHECK FOR WITHIN 3 YARDS OF SCORING
	IF_YARDS_FROM_ENDZONE_LESS_THAN[amount_true] 3, DO_CLOSE_TO_ENDZONE_COM_PLAY_CALL

CHECK_WITHIN_5_YARDS_OF_EITHER_ENDZONE:																																		
    IF_YARDS_FROM_ENDZONE_LESS_THAN[amount_true] 5, HEAVY_RUN_80PCT_COM_PLAY_CALL                                                                             
																			
	IF_YARDS_FROM_ENDZONE_GREATER_THAN[amount_true]  95, HEAVY_RUN_80PCT_COM_PLAY_CALL
	

@check_for_1st_down:
	LDA DOWN						                                                    ; IS DOWN = 1ST DOWN
	BNE @check_for_2nd_down						                                                    ; NO-> CHECK FOR SECOND DOWN
	JMP DO_OFFENSIVE_STYLE_UNLESS_LATE_IN_GAME						                    ; YES->DO TEAM BASED OFFENSIVE PLAY CALL, UNLESS TRAILING,LEADING WITH 2 MIN LEFT

@check_for_2nd_down:							                                        ; CHECK FOR SECOND DOWN
	CMP #SECOND_DOWN						                                            ; IS DOWN = 2ND DOWN
	BEQ CHECK_2ND_DOWN_YARDS_TO_GO						                                ; YES->2ND DOWN CHECK FOR YARDS TO GO (<=1)
	BNE COM_GET_PLAY_CALL_BASED_ON_YARDS_TO_GO						                    ; NO->GET PLAY CALL BASED ON TO YARDS TO GO

_F}_COM_DOWN_PLAY_CALL_LOGIC

_F{_COM_PUNT_LOGIC																		; DONE

CHECK_FOR_COM_PUNT:							                                            ; CHECK FOR PUNT
	LDA QUARTER						                                                    ; IS QTR = FOURTH QTR ?
	CMP #FOURTH_QUARTER						                                            ;
	BNE @check_for_2nd_4th_qtr_overtime_punt						                        ; NO->CHECK FOR 2ND QTR OVERTIME PUNT
	

@check_2_minutes_or_less_in_4th_quarter								                    ; CHECK FOR PUNT 4TH QUARTER
	LDA CLOCK_MINUTES						                                            ; IS MINUTES LEFT >= 2
	CMP #$02						                                                    ;
	BCS DO_COM_PUNT_IF_MORE_THAN_50_YARDS_AWAY_AND_AHEAD_OR_TRAIL_LESS_10				; YES->NORMAL PUNT CHECKS	
	LDA CPU_OPP_SCORE 						                                            ; IS OPPONENT SCORE < COM TEAM SCORE
	CMP CPU_OFF_SCORE 						                                            ;  
	BCC DO_COM_PUNT_IF_MORE_THAN_50_YARDS_AWAY						                    ; YES-> CHECK FOR FIELD GOAL OR GO FOR IT IF TRAILING BY 10 OR MORE
	BCC @check_for_2nd_4th_qtr_overtime_punt					                        ; *** IMPOSSIBLE
	JMP COM_ALTERNATE_FG_OR_GO_CHECK						                            ; NO->CHECK FOR FIELD GOAL, OR GO FOR IT

@check_for_2nd_4th_qtr_overtime_punt:							                        ; CHECK FOR 2ND QTR OVERTIME PUNT
	LDA QUARTER						                                                    ; IS QTR = 2ND QTR ?
	CMP #SECOND_QUARTER						                                            ;
	BEQ CHECK_FOR_COM_PUNT_2nd_QUARTER_OR_OVERTIME				                        ; YES->2ND QTR OR OVERTIME PUNT, FG OR GO FOR IT
	CMP #OVERTIME_QUARTER						                                        ; IS QTR = OVERTIME ?
	BNE DO_COM_PUNT_IF_MORE_THAN_50_YARDS_AWAY						                    ; NO->NORMAL PUNT CHECKS


CHECK_FOR_COM_PUNT_2nd_QUARTER_OR_OVERTIME:							                    ; 2ND QTR PUNT, FG, GO FOR IT CHECKS
	
@check_2_minutes_or_less_in_2nd_quarter		
	LDA CLOCK_MINUTES						                                            ; IS MINUTES LEFT >= 2
	CMP #$02						                                                    ;
	BCS DO_COM_PUNT_IF_MORE_THAN_50_YARDS_AWAY					                        ; YES->NORMAL PUNT CHECKS

@check_yards_from_endzone
	IF_YARDS_FROM_ENDZONE_LESS_THAN[amount_true] 50, COM_ALTERNATE_FG_OR_GO_CHECK	


SET_COM_PLAY_CALL_TO_PUNT:							                                                    ; SET COM PLAY CALL = PUNT
	LDA #PUNT_PLAY_CALL_ID						                                        ; SET PLAY CALL = PUNT
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> EXIT COM LOGIC

DO_COM_PUNT_IF_MORE_THAN_50_YARDS_AWAY_AND_AHEAD_OR_TRAIL_LESS_10:						; CHECK FOR FIELD GOAL OR GO FOR IT IF TRAILING BY 10 OR MORE
	LDA CPU_OPP_SCORE 						                                            ; =  OPPONENT SCORE
	SEC							                                                        ;
	SBC CPU_OFF_SCORE 						                                            ; -  COM TEAM SCORE
	BCC DO_COM_PUNT_IF_MORE_THAN_50_YARDS_AWAY						                    ; OPP TRAILING? YES->NORMAL PUNT CHECKS
	CMP #$0A						                                                    ; OPP AHEAD BY < 10 
	BCC DO_COM_PUNT_IF_MORE_THAN_50_YARDS_AWAY						                    ; YES->NORMAL PUNT CHECKS
	JMP COM_ALTERNATE_FG_OR_GO_CHECK						                            ; NO->CHECK FOR FIELD GOAL, OR GO FOR IT

DO_COM_PUNT_IF_MORE_THAN_50_YARDS_AWAY:							                    ; NORMAL PUNT CHECKS
	LDA yards_from_endzone 						                                        ; IS YARDS FROM ENDZONE > 50
	CMP #$91						                                                    ;
	LDA yards_from_endzone + 1 						                                    ; 
	SBC #$01						                                                    ;
	BCS SET_COM_PLAY_CALL_TO_PUNT						                                ; YES-> SET COM PLAY CALL = PUNT
	
	LDA yards_to_go						                                                ; YARDS TO GO <=5
	CMP #$29						                                                    ;
	LDA yards_to_go + 1						                                            ;
	SBC #$00						                                                    ;
	BCC COM_50PCT_PUNT_CHANCE							                                ; YES->50% PUNT CHANCE
	
	LDA QUARTER						                                                    ; IS QUARTER = 4
	CMP #OVERTIME_QUARTER						                                                    ; 
	BNE SET_COM_PLAY_CALL_TO_PUNT						                                                    ; YES-> SET COM PLAY CALL = PUNT
	LDA CLOCK_MINUTES						                                                        ; MINUTES LEFT < 2?
	CMP #$02						                                                    ;
	BCC SET_COM_PLAY_CALL_TO_PUNT						                                                    ; YES-> SET COM PLAY CALL = PUNT

COM_50PCT_PUNT_CHANCE:							                                        ; 50% PUNT CHANCE
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_TWO					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3C
	CMP #$80						                                                    ;
	BCC SET_COM_PLAY_CALL_TO_PUNT						                                                    ; YES-> SET COM PLAY CALL = PUNT
	JMP COM_ALTERNATE_FG_OR_GO_CHECK						                                                    ; NO-> CHECK FOR FIELD GOAL, OR GO FOR IT

SET_COM_PLAY_CALL_TO_FIELD_GOAL:							                            ; SET COM PLAY CALL = FIELD GOAL 
	LDA #FG_PLAY_CALL_ID						                                        ; SET PLAY CALL = FIELD GOAL
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> EXIT COM LOGIC

CHECK_FOR_FG_4TH_DOWN_WITHIN_41_YARDS:							                        ; CHECK FOR FIELD GOAL, 4TH DOWN, WITHIN 41 YARDS OF ENDZONE
	LDA QUARTER						                                                    ; IS QTR = 4TH QTR
	CMP #FOURTH_QUARTER						                                            ;
	BNE NORMAL_COM_4TH_DOWN_GO_OR_FG_CHECK						                        ; NO-> NORMAL FG CHECKS

_F}_COM_PUNT_LOGIC

_F{_COM_4TH_DOWN_4TH_QUARTER_FG_CHECK													; DONE

COM_4TH_DOWN_4TH_QUARTER_FG_CHECK	
	
@check_trailing:	
	LDA CPU_OPP_SCORE 						                                            ; = OPPONENT SCORE
	SEC							                                                        ;
	SBC CPU_OFF_SCORE 						                                            ; -  COM TEAM SCORE
	BCC NORMAL_COM_4TH_DOWN_GO_OR_FG_CHECK						                        ; TRAILING BY 3 OR LESS? YES-> NORMAL FG CHECKS

@check_trailing_by_3_or_less:	
	CMP #FG_POINTS + 1						                                            ;
	BCC NORMAL_COM_4TH_DOWN_GO_OR_FG_CHECK						                        ; 

@check_less_than_2_minutes:
	LDA CLOCK_MINUTES						                                            ; 	< 2 MINUTES LEFT ?
	CMP #$02						                                                    ;
	BCC @check_if_close_to_either_endzone						                        ; YES->CHECK HOW CLOSE TO ENDZONE

@check_yards_to_go_less_than_2:	
	LDA yards_to_go						                                                ; YARDS TO GO <=2 
	CMP #$11						                                                    ;
	LDA yards_to_go + 1						                                            ;
	SBC #$00						                                                    ;
	BCC @check_if_close_to_either_endzone						                        ; YES->CHECK HOW CLOSE TO ENDZONE
	BCC @check_if_close_to_either_endzone						                        ; *** REDUNDANT
	JMP COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; JUMP->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO


								                                                        ; CHECK HOW CLOSE TO ENDZONE
@check_if_close_to_either_endzone:							                            ; CHECK FOR WITHIN 3 YARDS OF ENDZONE
	IF_YARDS_FROM_ENDZONE_LESS_THAN[amount_true] 3, DO_CLOSE_TO_ENDZONE_COM_PLAY_CALL
						                                                  
	IF_YARDS_FROM_ENDZONE_LESS_THAN[amount_true] 5, HEAVY_RUN_80PCT_COM_PLAY_CALL
							                                                  
	IF_YARDS_FROM_ENDZONE_GREATER_THAN[amount_true] 95, HEAVY_RUN_80PCT_COM_PLAY_CALL

@else_go							                                                   ; JUMP-> GET PLAY CALL BASED ON TO YARDS TO GO
	BCS NORMAL_COM_4TH_DOWN_GO_OR_FG_CHECK						                       ; *** IMPOSSIBLE
	JMP COM_GET_PLAY_CALL_BASED_ON_YARDS_TO_GO						                   ; NO->GET PLAY CALL BASED ON TO YARDS TO GO

_F}_COM_4TH_DOWN_4TH_QUARTER_FG_CHECK	

_F{_NORMAL_COM_4TH_DOWN_GO_OR_FG_CHECK													; DONE

NORMAL_COM_4TH_DOWN_GO_OR_FG_CHECK:							                            ; NORMAL FG CHECKS
	
@check_yards_to_go_more_than_1:	
	LDA yards_to_go						                                                ; YARDS TO GO >= 1
	CMP #$09						                                                    ;
	LDA yards_to_go + 1						                                            ;
	SBC #$00						                                                    ;
	BCS @check_yards_to_go_more_than_2						                            ; YES-> FG CHECK IF YARDS TO GO > 1  

@check_trailing_less_than_1_yard:	
	LDA CPU_OPP_SCORE 						                                            ; OPPONENT SCORE < COM TEAM SCORE
	CMP CPU_OFF_SCORE 						                                            ; 
	BCC SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; YES->SET COM PLAY CALL = FIELD GOAL

@if_leading_do_50pct_fg_if_within_10_yards
	LDA yards_from_endzone 						                                        ; IS YARDS FROM ENDZONE <= 10 
	CMP #$A1						                                                    ; 
	LDA yards_from_endzone + 1 						                                    ; 
	SBC #$00						                                                    ;
	BCS SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; YES->SET COM PLAY CALL = FIELD GOAL
	BCS @check_yards_to_go_more_than_2						                            ; *** IMPOSSIBLE
	JMP COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; JUMP->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO

@check_yards_to_go_more_than_2:							                                ; FG CHECK IF YARDS TO GO > 1 
	LDA yards_to_go						                                                ; YARDS TO GO < 2
	CMP #$10						                                                    ;
	LDA yards_to_go + 1						                                            ;
	SBC #$00						                                                    ;
	BCC @check_trailing_less_1_to_2_yard						                        ; NO-> FG YARDS TO GO >2, CHECK IF TRAILING 
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; YES->SET COM PLAY CALL = FIELD GOAL

@check_trailing_less_1_to_2_yard:							                            ; FG YARDS TO GO >2, CHECK IF TRAILING 
	LDA CPU_OPP_SCORE 						                                            ; OPPONENT SCORE >= COM TEAM SCORE
	SEC							                                                        ;
	SBC CPU_OFF_SCORE 						                                            ; 
	BCS @check_trailing_17_or_more					                                    ; YES->FG YARDS TO GO >2,TRAILING, CHECK IF TRAILING BY MORE THAN 17

@leading_take_fg:
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; NO->SET COM PLAY CALL = FIELD GOAL

@check_trailing_17_or_more:							                                    ; FG YARDS TO GO >2,TRAILING, CHECK IF TRAILING BY MORE THAN 17
	CMP #$11						                                                    ; TRAILING 17 OR MORE
	BCS @do_50pct_chance_fg						                                        ; YES->50% CHANCE OF FG, ELSE DO 3RD AND 4TH DOWN CHECKS
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; NO->SET COM PLAY CALL = FIELD GOAL

@do_50pct_chance_fg:							                                                    ; 
	BCS COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; BRANCH->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO

_F}_NORMAL_COM_4TH_DOWN_GO_OR_FG_CHECK

_F{_COM_ALTERNATE_FG_OR_GO_CHECK														; DONE

COM_ALTERNATE_FG_OR_GO_CHECK:							                                 ; CHECK FOR FIELD GOAL, OR GO FOR IT
	
@check_yards_from_endzone:	
	LDA yards_from_endzone 						                                        ; IS YARDS FROM ENDZONE >43
	CMP #$91						                                                    ;
	LDA yards_from_endzone + 1 						                                    ; 
	SBC #$01						                                                    ;
	BCS @check_if_to_far_for_fg					                                        ; YES->3RD AND 4TH DOWN CHECK FOR YARDS TO GO (<3 OR >7)			

@check_4th_qtr:		
	LDA QUARTER						                                                    ; IS QUARTER = 4TH QUARTER
	CMP #FOURTH_QUARTER						                                            ;
	BNE @check_if_2nd_qtr_or_OT						                                    ; NO-> CHECK FOR SECOND QTR OR OVERTIME	

@check_less_2min_4th_qtr:		
	LDA CLOCK_MINUTES						                                            ; MINUTES LEFT >= 2
	CMP #$02						                                                    ;
	BCS COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; YES->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO
	
@check_less_2min_4th_qtr_and_trailing:	
	LDA CPU_OPP_SCORE 						                                            ; OPPONENT SCORE > COM TEAM SCORE
	SEC							                                                        ;
	SBC CPU_OFF_SCORE 						                                            ;   
	BCS @check_less_2min_4th_qtr_and_trailing_margin					                ; YES->CHECK FOR OPPONENT WINNING BY 4 OR MORE
	JMP COM_GET_PLAY_CALL_BASED_ON_YARDS_TO_GO						                    ; NO-> GET PLAY CALL BASED ON TO YARDS TO GO

@check_less_2min_4th_qtr_and_trailing_margin:							                ; CHECK FOR OPPONENT WINNING BY 4 OR MORE
	CMP #FG_POINTS + 1						                                            ; OPPONENT MARGIN >=4 ?
	BCS @impossible_branch						                                        ; YES-> GET PLAY CALL BASED ON TO YARDS TO GO
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; NO->SET COM PLAY CALL = FIELD GOAL

@impossible_branch:
	BCC @check_if_2nd_qtr_or_OT						                                     ; *** IMPOSSIBLE TO TRIGGER
	JMP COM_GET_PLAY_CALL_BASED_ON_YARDS_TO_GO						                     ; NO-> GET PLAY CALL BASED ON TO YARDS TO GO

@check_if_2nd_qtr_or_OT:							                                    ; CHECK FOR SECOND QTR OR OVERTIME	
	LDA QUARTER						                                                    ; IS QUARTER = 2ND QUARTER
	CMP #SECOND_QUARTER						                                            ;
	BEQ @check_for_2nd_quarter_less_two_min_fg						                    ; YES->2ND QTR CHECK FOR > 2 MIN LEFT
	CMP #OVERTIME_QUARTER						                                        ; IS QUARTER = OVERTIME
	BNE COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; NO->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO

@check_for_2nd_quarter_less_two_min_fg:							                         ; 2ND QTR CHECK FOR > 2 MIN LEFT
	LDA CLOCK_MINUTES						                                            ; MINUTES LEFT >= 2
	CMP #$02						                                                    ;
	BCS @branch_do_50_pct_fg					                                                    ; *** could branch direct
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; NO->SET COM PLAY CALL = FIELD GOAL

@branch_do_50_pct_fg:
	BCS COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; *** uneeded 

@check_if_to_far_for_fg:							                                    ; IS YARDS FROM ENDZONE <52 THIS SEEMS POINTLESS CHECKED AT BEG OF LOOP 40
	IF_YARDS_FROM_ENDZONE_GREATER_THAN[amount_true] 51, COM_GET_PLAY_CALL_BASED_ON_YARDS_TO_GO	 
	
@check_if_4th_quarter:							                                        ;  
	LDA QUARTER						                                                    ; IS QUARTER = FOURTH QTR
	CMP #FOURTH_QUARTER						                                            ;
	BNE COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; NO->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO

@check_if_2_min_left_or_less:	
	LDA CLOCK_MINUTES						                                            ; IS TIME LEFT =  2:00 TO 2:59?
	CMP #$02						                                                    ;
	BNE COM_50_PCT_FG_CHANCE_ELSE_GO						                                                    ; NO->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO

@check_if_trailing_by_3_or_less:	
	LDA CPU_OPP_SCORE 						                                            ; IS OPPONENT SCORE -  COM TEAM SCORE = OPPONENT LOSING
	SEC							                                                        ;
	SBC CPU_OFF_SCORE 						                                            ; 
	BCC COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; YES->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO
	CMP #FG_POINTS +1 						                                            ; IS COM WINNING BY LESS THAN 4?
	BCC COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; YES->50% CHANCE OF FG, ELSE GET PLAY CALL BASED ON YARDS TO GO
	BCC COM_50_PCT_FG_CHANCE_ELSE_GO						                            ; *** UNEEDED
	JMP COM_GET_PLAY_CALL_BASED_ON_YARDS_TO_GO						                    ; NO-> GET PLAY CALL BASED ON TO YARDS TO GO

COM_50_PCT_FG_CHANCE_ELSE_GO:							                                ; 50% CHANCE OF FG, ELSE GET PLAY CALL
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	CMP #$80						                                                    ; *** com go for it chance
	BCS @com_goes_on_4th						                                        ;
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; NO->SET COM PLAY CALL = FIELD GOAL

@com_goes_on_4th:
	JMP COM_GET_PLAY_CALL_BASED_ON_YARDS_TO_GO						                     ; NO-> GET PLAY CALL BASED ON TO YARDS TO GO

_F}_COM_ALTERNATE_FG_OR_GO_CHECK

_F{_COM_FG_NOT_4TH_DOWN_CHECK															; DONE

CHECK_FOR_COM_FG_NOT_4TH_DOWN:							                                 ; DO FG IF >< 30 SECONDS LEFT AND NOT 4TH QUARTER  
	
@check_less_than_30_seconds:	
	LDA CLOCK_MINUTES						                                            ; IS TIME LEFT >= 30 SECONDS
	BNE @check_for_overtime						                                         ; YES->CHECK FOR FG >30 SEC LEFT IN OT
	LDA CLOCK_SECONDS						                                            ;
	CMP #$30						                                                    ; 
	BCS @check_for_overtime						                                        ; YES->CHECK FOR FG >30 SEC LEFT IN OT

@check_4th_quarter:	
	LDA QUARTER						                                                    ; IS QTR = 4TH QUARTER
	CMP #FOURTH_QUARTER						                                            ;
	BEQ @check_if_trailing						                                        ; YES->CHECK FOR PLAY CALL WITH 30-59 SEC LEFT IN 4TH
	
@do_fg_if_less_30_in_4th:	
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; NO->SET COM PLAY CALL = FIELD GOAL


@check_if_trailing:							                                            ; CHECK FOR WITH 30-59 SEC LEFT IN 4TH
	LDA CPU_OPP_SCORE 						                                            ; OPPONENT SCORE -  COM TEAM SCORE
	SEC							                                                        ;
	SBC CPU_OFF_SCORE 						                                            ; OPPONENT WINNING?
	BCS @check_if_fg_can_tie						                                      ; YES-> CHECK FOR OPP LEADING BY >=4 PTS
	JMP COM_OFFENSE_PLAY_CALL_LOGIC_START						                        ; NO->  CHECK FOR PUNT OR FG, HEAVY RUN LATE OR CLOSE SITUATIONS

@check_if_fg_can_tie:							                                        ; CHECK FOR OPP LEADING BY >=4 PTS
	CMP #FG_POINTS + 1						                                            ; OPP WINNING BY >=4 PTS? 
	BCS @no_do_play_call					                                            ; YES->JUMP TO LATE AND CLOSE CHECKS 

@yes_do_field_goal:	
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; NO->SET COM PLAY CALL = FIELD GOAL

@no_do_play_call:							                                                    ; JUMP TO LATE AND CLOSE CHECKS
	JMP COM_OFFENSE_PLAY_CALL_LOGIC_START						                        ; JUMP->CHECK FOR PUNT OR FG, HEAVY RUN LATE OR CLOSE SITUATIONS

@check_for_overtime:							                                        ; CHECK FOR FG >30 SEC LEFT IN OT
	LDA QUARTER						                                                    ; IS QTR = OVERTIME
	CMP #OVERTIME_QUARTER						                                        ;
	BEQ @check_if_in_redzone					                                                    ; YES-> CHECK FOR FG >1 MIN LEFT IN OT WITHIN 20 YARDS
	JMP COM_OFFENSE_PLAY_CALL_LOGIC_START						                        ; NO->  CHECK FOR PUNT OR FG, HEAVY RUN LATE OR CLOSE SITUATIONS

@check_if_in_redzone:							                                                    ; CHECK FOR FG >1 MIN LEFT IN OT WITHIN 20 YARDS
	LDA yards_from_endzone							                              
	CMP #(20 * ONE_YARD) +1																; *** cant use macro because 1/8 of yard could fix to 20						                             
	LDA yards_from_endzone	 + 1						                                     
	SBC #$00	
	BCC @kick_fg_in_redzone_of_overtime					                                                    	 							                                                    
	JMP COM_OFFENSE_PLAY_CALL_LOGIC_START	
	

@kick_fg_in_redzone_of_overtime:							                                                    ; KICK FIELD GOAL IN OT
	JMP SET_COM_PLAY_CALL_TO_FIELD_GOAL						                            ; JUMP->SET COM PLAY CALL = FIELD GOAL


_F}_COM_FG_NOT_4TH_DOWN_CHECK

_F{_OFFENSIVE_STYLE_SPECIAL_SITUATIONS													; DONE

temp_rand_value		= LOCAL_1

DO_CLOSE_TO_ENDZONE_COM_PLAY_CALL:							                            ; HEAVILY RANDOMIZED PLAY CALL 40% RANDOM RUN, 40% RUN 4 , 20% PASS
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	STA temp_rand_value + 1						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	CLC							                                                        ;
	ADC temp_rand_value + 1						                                                        ;
	STA temp_rand_value + 1						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_TWO					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3C
	STA temp_rand_value						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                     ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	CLC							                                                        ;
	ADC temp_rand_value						                                                        ;
	CMP #$CD						                                                    ; IS RAND # > 0XCD? (20% CHANCE) 
	BCS DO_RANDOM_COM_PASS_PLAY					                                                    ; 20%->DO RANDOM PASS PLAY
	LDA temp_rand_value + 1						                                                        ; IS RAND # > 0X80? (50% CHANCE)
	CMP #$80						                                                    ;
	BCS DO_RANDOM_COM_RUN_PLAY						                                                    ; YES->DO RANDOM RUN PLAY
	LDA #$03						                                                    ; SET PLAY = RUN 4
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> EXIT COM LOGIC




DO_RANDOM_COM_RUN_PLAY:							                                        ; DO RANDOM RUN PLAY
	LDA temp_rand_value + 1						                                        ;
	AND #$03						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> EXIT COM LOGIC

	
	
DO_RANDOM_COM_PASS_PLAY:							                                    ; DO RANDOM PASS PLAY
	LDA temp_rand_value + 1						                                        ;
	AND #$0C						                                                    ;
	LSR							                                                        ;
	LSR							                                                        ;
	CLC							                                                        ;
	ADC #$04						                                                    ;
	STA com_play_call						                                                        ;
	JMP EXIT_COM_PLAY_CALL						                                                    ; JUMP-> EXIT COM LOGIC

DO_HEAVY_PASS_80PCT_COM_PLAY_CALL:							                            ; HEAVILY RANDOMIZED PLAY CALL 80% PASS, 20% RUN
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	STA temp_rand_value + 1							                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	CLC							                                                        ;
	ADC temp_rand_value + 1							                                                        ;
	STA temp_rand_value + 1							                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_TWO					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3C
	STA temp_rand_value						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                     ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	CLC							                                                        ;
	ADC temp_rand_value						                                                        ;
	CMP #$CD						                                                    ; RAND # < 0XCD = 80% CHANCE PASS PLAY, 20% RUN
	BCC @call_random_com_pass_play						                                                    ;YES->CALL RANDOM PASS PLAY

@call_random_com_run_play								                                ; CALL RANDOM RUN PLAY
	LDA temp_rand_value + 1							                                    ; *** duplicate
	AND #$03						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ;JUMP-> COM PLAY CALL EXIT
	
@call_random_com_pass_play:							                                    ;CALL RANDOM PASS PLAY
	LDA temp_rand_value + 1					                                            ; *** duplicate
	AND #$0C						                                                    ;
	LSR							                                                        ;
	LSR							                                                        ;
	CLC							                                                        ;
	ADC #$04						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> COM PLAY CALL EXIT

HEAVY_RUN_80PCT_COM_PLAY_CALL:							                                ; HEAVILY RANDOMIZED PLAY CALL 80% RUN, 20% PASS
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	STA temp_rand_value + 1						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	CLC							                                                        ;
	ADC temp_rand_value + 1						                                                        ;
	STA temp_rand_value + 1						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_TWO					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3C
	STA temp_rand_value						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                   ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	CLC							                                                        ;
	ADC temp_rand_value					                                                        ;
	CMP #$CD						                                                    ; RAND # < 0XCD = 80% CHANCE RUN PLAY, 20% PASS
	BCC @call_random_com_run_play						                                                    ; YES->CALL RANDOM RUN PLAY
								                                                        ; *** duplicate  REDUNDANT 
@call_random_com_pass_play								                                ; CALL RANDOM PASS PLAY
	LDA temp_rand_value + 1							                                    ; MAKE PLAY CALL = RANDOM PASS PLAY CALL(4-7)
	AND #$0C						                                                    ;
	LSR							                                                        ;
	LSR							                                                        ;
	CLC							                                                        ;
	ADC #$04						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> COM PLAY CALL EXIT

								                                                        ; *** duplicate   SAME AS LOOP ABOVE COULD BE REFACTORED
@call_random_com_run_play:							                                    ; CALL RANDOM RUN PLAY
	LDA temp_rand_value + 1							                                ; MAKE PLAY CALL = RANDOM RUN PLAY CALL (0-3)
	AND #$03						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> COM PLAY CALL EXIT
	
_F}_OFFENSIVE_STYLE_SPECIAL_SITUATIONS	
	
_F{_OFFENSIVE_STYLE_LOGIC																; DONE

OFFENSIVE_STYLES_TABLE:							                                         ; OFFENSIVE STYLES
       .WORD OFFENSIVE_STYLE_RANDOM					                                     ; RANDOM
       .WORD OFFENSIVE_STYLE_60PCT_RUN_40PCT_PASS					                     ; 60% RUN, 40% PASS
       .WORD OFFENSIVE_STYLE_40PCT_RUN_60PCT_PASS 					                     ; 40% RUN, 60% PASS
       .WORD OFFENSIVE_STYLE_30PCT_RUN_70PCT_PASS					                    ; 30% RUN, 70% PASS
       
DO_OFFENSIVE_STYLE_UNLESS_LATE_IN_GAME:							                        ; DO TEAM BASED OFFENSIVE PLAY CALL, UNLESS TRAILING,LEADING WITH 2 MIN LEFT 

play_call_one_random		= LOCAL_3
play_call_two_random		= LOCAL_4


	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_TWO					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3C
	STA play_call_one_random						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	CLC							                                                        ;
	ADC play_call_one_random						                                                        ;
	STA play_call_one_random						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE					                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	STA play_call_two_random						                                                        ;
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	CLC							                                                        ;
	ADC play_call_two_random						                                                        ;
	STA play_call_two_random						                                                        ;
	
@check_quarter_time_and_score:	
	LDA QUARTER						                                                    ; IS QTR =  OT OR 4TH?  
	CMP #FOURTH_QUARTER						                                                    ;
	BCC DO_COM_TEAM_OFFENSIVE_STYLE						                                ; NO->DO TEAM OFFENSIVE STYLE
	
	LDA CLOCK_MINUTES						                                            ; MINUTES LEFT <2 
	CMP #$02						                                                    ;
	BCS DO_COM_TEAM_OFFENSIVE_STYLE						                                ; NO->DO TEAM OFFENSIVE STYLE
	
	LDA CPU_OPP_SCORE 						                                            ; OPPONENT SCORE < COM TEAM SCORE
	CMP CPU_OFF_SCORE 						                                            ; 
	BCC OFFENSIVE_STYLE_60PCT_RUN_40PCT_PASS						                    ; YES-> 60% RUN, 40% PASS
	BCS OFFENSIVE_STYLE_30PCT_RUN_70PCT_PASS						                    ; NO-> 30% RUN, 70% PASS

DO_COM_TEAM_OFFENSIVE_STYLE:							                                ; DO TEAM OFFENSIVE STYLE

style_addr = LOCAL_1
play_call_one_random			= LOCAL_3
play_call_two_random			= LOCAL_4

OFFENSIVE_STYLE_2_RUN_CHANCE	= $99 													; 60pct
OFFENSIVE_STYLE_3_PASS_CHANCE	= $99													; 60 pct
OFFENSIVE_STYLE_4_PASS_CHANCE	= $B3													; 70 pct

	LDA OFFENSIVE_STYLE						                                            ; LOAD TEAM OFFENSIVE STYLE
	ASL							                                                        ; SHIFT TO GET INDEX INTO PTR TABLE
	TAX							                                                        ;
	LDA OFFENSIVE_STYLES_TABLE,X					                                    ; LOAD OFF STYLE ADDR FROM OFFENSIVE STYLE PTR TABLE
	STA style_addr						                                                        ;
	LDA OFFENSIVE_STYLES_TABLE+1,X					                                     ;
	STA style_addr+1						                                                        ;
	JMP (style_addr)						                                                    ; JUMP-> OFFENSTIVE STYLE LOCATION

OFFENSIVE_STYLE_RANDOM:							                                        ; RANDOM PLAY CALL
	LDA play_call_one_random						                                                        ;
	AND #$07						                                                    ;
	STA com_play_call						                                             ;
	JMP EXIT_COM_PLAY_CALL						                                                    ; JUMP-> COM LOGIC EXIT

OFFENSIVE_STYLE_60PCT_RUN_40PCT_PASS:							                        ; 60% RUN, 40% PASS
	LDA play_call_one_random						                                    ;
	CMP #OFFENSIVE_STYLE_2_RUN_CHANCE						                                                    ;
	BCC @do_random_run_play						                                        ;
	
@call_random_pass_play:	
	LDA play_call_two_random						                                    ; CALL RANDOM PASS PLAY
	AND #$03						                                                    ;
	CLC							                                                        ;
	ADC #$04						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ;

@do_random_run_play:							                                        ; CALL RANDOM RUN PLAY *** redundant 
	LDA play_call_two_random						                                    ;
	AND #$03						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> COM LOGIC EXIT

OFFENSIVE_STYLE_40PCT_RUN_60PCT_PASS:							                        ; 40% RUN, 60% PASS 
	LDA play_call_one_random						                                                        ;
	CMP #OFFENSIVE_STYLE_3_PASS_CHANCE						                                                    ;
	BCC @do_random_pass_play						                                                    ;
	
@do_random_run_play:																	; *** redundant
	LDA play_call_two_random						                                    ; CALL RANDOM RUN PLAY
	AND #$03						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ;JUMP-> COM LOGIC EXIT

@do_random_pass_play:							                                        ; *** redundant 
	LDA play_call_two_random						                                    ;
	AND #$03						                                                    ;
	CLC							                                                        ;
	ADC #$04						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                       ; JUMP-> COM LOGIC EXIT

OFFENSIVE_STYLE_30PCT_RUN_70PCT_PASS:							                        ; 30% RUN, 70% PASS 
	LDA play_call_one_random					                                        ;
	CMP #OFFENSIVE_STYLE_4_PASS_CHANCE						                                                    ;
	BCC @do_random_pass_play					                                        ;
	

@do_random_run_play:	
	LDA play_call_two_random						                                    ; CALL RANDOM RUN PLAY
	AND #$03						                                                    ;
	STA com_play_call						                                            ;
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP-> COM LOGIC EXIT

@do_random_pass_play:							                                                    ; CALL RANDOM PASS PLAY
	LDA play_call_two_random						                                                        ;
	AND #$03						                                                    ;
	CLC							                                                        ;
	ADC #$04						                                                    ;
	STA com_play_call						                                              ;
	JMP EXIT_COM_PLAY_CALL						                                                    ; JUMP-> COM LOGIC EXIT
	
_F}_OFFENSIVE_STYLE_LOGIC		

_F{_COM_DEFENSIVE_TIMEOUT_LOGIC															; DONE

CHECK_IF_COM_TAKES_TIMEOUT_ON_DEFENSE:							                       ; COM ON DEFENSE CHECK IF TIMEOUTS NEEDED

COM_DEFENSE_TIMEOUT_CHANCE_ONE		= $C0
COM_DEFENSE_TIMEOUT_CHANCE_TWO		= $F0 	

@check_if_clock_stopped:
	LDA CLOCK_RUN_TYPE						                                            ; IS CLOCK STATUS = RUNNING
	BPL DO_COM_DEFENSIVE_PLAY_CALL						                                ; NO->CHECK FOR COM DEFENSIVE PLAY CALL

@check_if_timeouts_left:	
	LDA CPU_OFF_TIMEOUTS						                                        ; TIMEOUTS LEFT > 0
	BEQ DO_COM_DEFENSIVE_PLAY_CALL						                                  ; NO->CHECK FOR COM DEFENSIVE PLAY CALL
	
@check_4th_or_overtime:
	LDA QUARTER						                                                    ; IS QTR  = 4TH QTR
	CMP #FOURTH_QUARTER						                                            ;
	BEQ @check_if_leading						                           			   ; YES->CHECK FOR TIMEOUT IN 4TH
	CMP #OVERTIME_QUARTER						                                        ; IS QTR = OVERTIME
	BNE DO_COM_DEFENSIVE_PLAY_CALL					                                    ; NO->CHECK FOR COM DEFENSIVE PLAY CALL

@check_if_leading:							                                            ; CHECK FOR TIMEOUT IN 4TH QTR OR OT
	LDA CPU_OFF_SCORE 						                                            ; COM TEAM SCORE >= OPPONENT SCORE
	CMP CPU_OPP_SCORE						                                            ; 
	BCS DO_COM_DEFENSIVE_PLAY_CALL					                                    ; YES->CHECK FOR COM DEFENSIVE PLAY CALL


@check_if_more_than_three_min_left:	
	LDA CLOCK_MINUTES						                                            ; IS MINUTES LEFT >=3
	CMP #$03						                                                    ;
	BCS DO_COM_DEFENSIVE_PLAY_CALL						                                ; YES->CHECK FOR COM DEFENSIVE PLAY CALL
	
	
	CMP #$02						                                                    ; IS MINUTES LEFT <2
	BCC @check_time_out_trailing_less_two_min						                                                    ;
	

@check_time_out_trailing_two_to_three_min:	
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	CMP #COM_DEFENSE_TIMEOUT_CHANCE_ONE						                            ; RAND <0XC0 = 75% CHANCE 
	BCS DO_COM_DEFENSIVE_PLAY_CALL						                                ; 25% CHANCE -> CHECK FOR COM DEFENSIVE PLAY CALL
	BCC @com_takes_time_def_timeout					                                    ; 75% CHANCE->COM TAKE TIMEOUT ON DEFENSE

@check_time_out_trailing_less_two_min:							                        ; CHECK FOR DEF TIMEOUT TRAILING LESS THAN 2 MIN
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	CMP #COM_DEFENSE_TIMEOUT_CHANCE_TWO						                            ; RAND >0XF0 = 93% CHANCE of timeout 
	BCS DO_COM_DEFENSIVE_PLAY_CALL						                                ; 

@com_takes_time_def_timeout:							                                ; COM TAKE TIMEOUT ON DEFENSE
	LDA CLOCK_RUN_TYPE						                                            ; *** dont need and SET CLOCK STATUS = STOPPED
	AND #$7F						                                                    ;
	STA CLOCK_RUN_TYPE						                                            ; 
	DEC CPU_OFF_TIMEOUTS						                                        ; COM TIMEOUTS--

_F}_COM_DEFENSIVE_TIMEOUT_LOGIC	

_F{_COM_DEFENSIVE_LOGIC																	; DONE

DO_COM_DEFENSIVE_PLAY_CALL:							                                    ; CHECK FOR COM DEFENSIVE PLAY CALL
	LDA #$00						                                                    ; CLEAR COM PLAY CALL VALUE AGAIN?
	STA com_play_call						                                            ;
	LDA DOWN						                                                    ; IS DOWN = 3RD DOWN
	CMP #THIRD_DOWN						                                                ;
	BEQ @check_yards_less_three_third_or_fourth_down					                ; YES->CHECK FOR YDS TO GO <3 ON 3RD ANF 4TH DOWN
	CMP #FOURTH_DOWN						                                            ; IS DOWN = 4TH DOWN
	BEQ @check_yards_less_three_third_or_fourth_down						            ; YES->CHECK FOR YDS TO GO <3 ON 3RD ANF 4TH DOWN


@do_random_defensive_play_call:							                                ; RANDOM PLAY CALL
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_TWO					                        ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3C
	AND #$07						                                                    ; MAKE RAND # 0 THRU 7 = EQUAL CHANCE OF ANY PLAY
	STA com_play_call						                                            ; SAVE IN COM PLAY CALL
	JMP EXIT_COM_PLAY_CALL						                                        ; JUMP->EXIT

@check_yards_less_three_third_or_fourth_down:							                ; CHECK FOR YDS TO GO <3 ON 3RD AND 4TH DOWN
	LDA yards_to_go						                                                ; IS YARDS TO FIRST >= 3
	CMP #$19						                                                    ;
	LDA yards_to_go + 1						                                            ;
	SBC #$00						                                                    ;
	BCS @check_yards_to_go_greater_than_7					                            ; YES->
	JMP HEAVY_RUN_80PCT_COM_PLAY_CALL						                            ; JUMP-> HEAVILY RANDOMIZED PLAY CALL 80% RUN, 20% PASS

@check_yards_to_go_greater_than_7:							                             ; CHECK FOR YDS TO GO >7 ON 3RD AND 4TH DOWN
	CMP #$39						                                                    ; IS YARDS TO FIRST > 7?
	BCC @yards_between_3_and_7_do_random					                                                    ; NO->RANDOM PLAY CALL
	JMP DO_HEAVY_PASS_80PCT_COM_PLAY_CALL						                        ; YES->HEAVILY RANDOMIZED PLAY CALL 80% PASS, 20% RUN

@yards_between_3_and_7_do_random:							                                                    ; POINTLESS COULD BRANCH ABOVE
	BCC @do_random_defensive_play_call					                                 ; NO->RANDOM PLAY CALL

_F}_COM_DEFENSIVE_LOGIC	

_F{_COM_ONSIDES_LOGIC																	; DONE

; RULES
; 1. 75% COM DOES ONSIDES IN OVERTIME WITH LESS THAN 2 MINUTES LEFT ( SHOULD BE IMPOSSIBLE SINCE ALL OT IS SUDDEN DEATH)
; 2. 75% COM DOES ONSIDES IN 4th TRAILING WITH LESS THAN 2 MINUTES LEFT 
; 3. 75% COM DOES ONSIDES IN 4th TRAILING by 8 OR MORE with 2-5 MINUTES LEFT
	
CHECK_FOR_COM_ONSIDES_KICK:							                                    ; ONSIDES KICK LOGIC 

com_kickoff_type					= LOCAL_3

COM_DOES_REGULAR_KICKOFF_TRUE		= $00
COM_DOES_REGULAR_KICKOFF_FALSE		= $80

COM_TRAIL_POINTS_4TH				= $08												; 
COM_ONSIDE_KICK_CHANCE				= $C0 												; 75% chance of onside (192/256)

@check_for_fourth_quarter:	
	LDA QUARTER						                                                    ; IS QUARTER = 4TH QUARTER
	CMP #FOURTH_QUARTER						                                            ;
	BNE @check_for_over_time						                                    ; NO-> CHECK FOR OVERTIME

@check_for_less_than_two_minutes_left	
	LDA CLOCK_MINUTES						                                            ; MORE THAN TWO MINUTES LEFT 
	CMP #$02						                                                    ;
	BCS @check_if_opp_score_greater						                                ; YES-> CHECK SCORE
	
@check_if_trailing_in_fourth	
	LDA CPU_OFF_SCORE						                                            ; IS COM SCORE > OPPONENT SCORE
	CMP CPU_OPP_SCORE						                                            ;
	BCS @com_does_regular_kickoff						                                ; YES->DO NORMAL KICKOFF

@com_does_onsides:							                                            ; DO ONSIDES KICK 
	LDA #COM_DOES_REGULAR_KICKOFF_FALSE						                            ; SET KICK = ONSIDES KICK 
	STA com_kickoff_type						                                        ; USED FOR ON FIELD COM
	SEC							                                                        ; USED FOR SKP MODE
	JMP @exit_com_onsides						                                        ; JUMP TO END OF ONSIDES KICK LOGIC 

@com_does_regular_kickoff:							                                    ; DO NORMAL KICKOFF
	LDA #COM_DOES_REGULAR_KICKOFF_TRUE						                            ; SET KICK =  NORMAL KICK 
	STA com_kickoff_type						                                        ; USED FOR ON FIELD COM
	CLC							                                                        ; USED FOR SKP MODE
	JMP @exit_com_onsides						                                        ; JUMP -> END OF ONSIDES KICK LOGIC

@check_if_opp_score_greater:							                                 ; CHECK SCORE LESS THAN 2 MINUTES IN 4TH 
	LDA CPU_OPP_SCORE 						                                            ; = OPPONENT SCORE - COM TEAM SCORE				
	SEC							                                                        ;
	SBC CPU_OFF_SCORE 						                                            ;					
	BCC @com_does_regular_kickoff						                                ; TEAM SCORE> OPP? YES->DO NORMAL KICKOFF
	CMP #COM_TRAIL_POINTS_4TH						                                     ; 
	BCS @check_for_random_onsides				                                    ;
	JMP @com_does_regular_kickoff						                                ; DOWN BY LESS THAN 8? YES->DO NORMAL KICKOFF

@check_for_over_time:							                                        ; CHECK FOR OVERTIME
	LDA QUARTER						                                                    ; IS QUARTER = OVER TIME
	CMP #OVERTIME_QUARTER						                                        ; 
	BNE @com_does_regular_kickoff						                                ; NO->DO NORMAL KICKOFF
	
	LDA CLOCK_MINUTES						                                            ; MORE THAN TWO MINUTES LEFT? 
	CMP #$02						                                                    ;
	BCS @com_does_regular_kickoff						                                ; JUMP TO DO NORMAL KICKOFF

@check_for_random_onsides:							                                    ; 
	JSR UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE					                        ; UPDATE RANDOM()  
	CMP #COM_ONSIDE_KICK_CHANCE						                                    ; 
	BCS @com_does_regular_kickoff						                                ; 25% CHANCE -> DO NORMAL KICKOFF
	BCC @com_does_onsides						                                        ; 75% CHANCE -> DO ONSIDES KICK

@exit_com_onsides:							                                           ; END OF ONSIDES KICK LOGIC 
	RTS							                                                        ; RETURN

_F}_COM_ONSIDES_LOGIC

_F{_UPDATE_RANDOMS_FOR_SIM_OR_COM_LOGIC													; DONE

UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_ONE:							                                                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3B
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA RANDOM_1						                                                        ;
	RTS							                                                        ; RETURN

UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_TWO:							                                                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3C
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA RANDOM_2						                                                        ;	
	RTS							                                                        ; RETURN

UPDATE_ALL_RANDOMS_SIM_LOAD_RANDOM_THREE:							                                                    ; EXTENSIVE RANDOM NUMBER UPDATE(), RET= RAND_3D
	JSR SIM_RANDOMIZE_MORE					                                            ; MORE EXTENSIVE RANDOM NUMBER UPDATE ()
	LDA RANDOM_3						                                                        ;
	RTS							                                                        ; RETURN

_F}_UPDATE_RANDOMS_FOR_SIM_OR_COM_LOGIC	



	
_F{_GET_SEASON_STAT_FUNCTION_TABLE														; DONE
	
	
GET_SEASON_STAT_PTR_TABLE:                                                              ; GET SEASON STATS COMMAND POINTERS
.WORD GET_SEASON_QB_PASS_ATT                                                            ; 0X00 GET QB PASS ATTEMPTS()
.WORD GET_SEASON_QB_PASS_COMP                                                           ; 0X01 GET QB PASS COMPLETIONS()
.WORD GET_SEASON_QB_PASS_TD                                                             ; 0X02 GET QB PASS TDS()
.WORD GET_SEASON_QB_PASS_INT                                                            ; 0X03 GET QB PASS INTS()
.WORD GET_SEASON_QB_PASS_YARDS                                                          ; 0X04 GET QB PASS YARDS()
.WORD GET_SEASON_QB_RUSH_ATT                                                            ; 0X05 GET QB RUSH ATT()
.WORD GET_SEASON_QB_RUSH_YARDS                                                          ; 0X06 GET QB RUSH YARDS()
.WORD GET_SEASON_QB_RUSH_TDS                                                            ; 0X07 GET QB RUSH TDS()
	
.WORD GET_SEASON_SKILL_PLAYER_RECS                                                      ; 0X08 GET SKILL PLAYER REC()
.WORD GET_SEASON_SKILL_PLAYER_REC_YARDS                                                 ; 0X09 GET SKILL PLAYER REC YARDS()
.WORD GET_SEASON_SKILL_PLAYER_REC_TDS                                                   ; 0X0A GET SKILL PLAYER REC TDS()
.WORD GET_SEASON_SKILL_PLAYER_KR_ATT                                                    ; 0X0B GET SKILL PLAYER KR ATT()
.WORD GET_SEASON_SKILL_PLAYER_KR_YARDS                                                  ; 0X0C GET SKILL PLAYER KR YDS()
.WORD GET_SEASON_SKILL_PLAYER_KR_TDS                                                    ; 0X0D GET SKILL PLAYER KR TDS()
.WORD GET_SEASON_SKILL_PLAYER_PR_ATT                                                    ; 0X0E GET SKILL PLAYER PR ATT()
.WORD GET_SEASON_SKILL_PLAYER_PR_YARDS                                                  ; 0X0F GET SKILL PLAYER PR YDS()
.WORD GET_SEASON_SKILL_PLAYER_PR_TDS                                                    ; 0X10 GET SKILL PLAYER PR TDS()
.WORD GET_SEASON_SKILL_PLAYER_RUSH_ATT                                                  ; 0X11 GET SKILL PLAYER RUSHING ATT()
.WORD GET_SEASON_SKILL_PLAYER_RUSH_YARDS                                                ; 0X12 GET SKILL PLAYER RUSHING YARDS()
.WORD GET_SEASON_SKILL_PLAYER_RUSH_TD                                                   ; 0X13 GET SKILL PLAYER RUSHING TDS()

.WORD GET_SEASON_DEFENDER_SACKS                                                         ; 0X14 GET DEFENDER SACKS()
.WORD GET_SEASON_DEFENDER_INTS                                                          ; 0X15 GET DEFENDER INTS()
.WORD GET_SEASON_DEFENDER_INT_YARDS                                                     ; 0X16 GET DEFENDER INT YARDS()
.WORD GET_SEASON_DEFENDER_INT_TDS                                                       ; 0X17 GET DEFENDER INT TDS()

.WORD GET_SEASON_KICKER_XP_ATT                                                          ; GET KICKER XP ATT()  
.WORD GET_SEASON_KICKER_XP_MADE                                                         ; GET KICKER XP MADE()
.WORD GET_SEASON_KICKER_FG_ATT                                                          ; GET KICKER FG ATT()
.WORD GET_SEASON_KICKER_FG_MADE                                                         ; GET KICKER FG MADE()

.WORD GET_SEASON_KICKER_PUNT_ATT                                                        ; GET PUNTER PUNTS()
.WORD GET_SEASON_KICKER_PUNT_YARDS                                                      ; GET PUNTER YARDS()

_F}_GET_SEASON_STAT_FUNCTION_TABLE

_F{_GET_GAME_STAT_FUNCTION_TABLE														; DONE

GET_CURRENT_GAME_STAT_PTR_TABLE:                                                        ; GET CURRENT GAME STATS COMMAND POINTERS
.WORD GET_CURRENT_GAME_QB_PASS_ATTEMPTS                                                 ; GET CURRENT GAME QB PASS ATTEMPTS()
.WORD GET_CURRENT_GAME_QB_PASS_CONPLETIONS                                              ; GET CURRENT GAME QB PASS COMPLETIONS()
.WORD GET_CURRENT_GAME_QB_PASS_TOUCHDOWNS                                               ; GET CURRENT GAME QB PASS TDS()
.WORD GET_CURRENT_GAME_QB_PASS_INTERCEPTIONS                                            ; GET CURRENT GAME QB PASS INTS()
.WORD GET_CURRENT_GAME_QB_PASS_YARDS                                                    ; GET CURRENT GAME QB PASS YARDS()
.WORD GET_CURRENT_GAME_QB_RUSH_ATT                                                      ; GET CURRENT GAME QB RUSH ATT()
.WORD GET_CURRENT_GAME_QB_RUSH_YARDS                                                    ; GET CURRENT GAME QB RUSH YARDS()
.WORD GET_CURRENT_GAME_QB_RUSH_TD                                                       ; GET CURRENT GAME QB RUSH TDS()
	
.WORD GET_CURRENT_GAME_SKILL_RECEPTIONS                                                                         ; GET CURRENT GAME SKILL PLAYER REC()
.WORD GET_CURRENT_GAME_SKILL_REC_YARDS                                                                         ; GET CURRENT GAME SKILL PLAYER REC YARDS()   
.WORD GET_CURRENT_GAME_SKILL_REC_TOUCHDOWNS                                                                         ; GET CURRENT GAME SKILL PLAYER REC TDS()
.WORD GET_CURRENT_GAME_SKILL_KR_ATT                                                                         ; GET CURRENT GAME SKILL PLAYER KR ATT() 
.WORD GET_CURRENT_GAME_SKILL_KR_YARDS                                                                         ; GET CURRENT GAME SKILL PLAYER KR YDS() 
.WORD GET_CURRENT_GAME_SKILL_KR_TOUCHDOWNS                                                                         ; GET CURRENT GAME SKILL PLAYER KR TDS()
.WORD GET_CURRENT_GAME_SKILL_PR_ATT                                                                         ; GET CURRENT GAME SKILL PLAYER PR ATT()
.WORD GET_CURRENT_GAME_SKILL_PR_YARDS                                                                         ; GET CURRENT GAME SKILL PLAYER PR YDS()
.WORD GET_CURRENT_GAME_SKILL_PR_TOUCHDOWNS                                                                         ; GET CURRENT GAME SKILL PLAYER PR TDS()
.WORD GET_CURRENT_GAME_SKILL_RUSH_ATT                                                                         ; GET CURRENT GAME SKILL PLAYER RUSHING ATT()
.WORD GET_CURRENT_GAME_SKILL_RUSH_YARDS                                                                          ; GET CURRENT GAME SKILL PLAYER RUSHING YARDS() 
.WORD GET_CURRENT_GAME_SKILL_RUSH_TOUCHDOWNS                                                                         ; GET CURRENT GAME SKILL PLAYER RUSHING TDS()
	
.WORD GET_CURRENT_GAME_DEFENDER_SACKS                                                                         ; GET CURRENT GAME DEFENDER SACKS()
.WORD GET_CURRENT_GAME_DEFENDER_INTS                                                                         ; GET CURRENT GAME DEFENDER INTS()
.WORD GET_CURRENT_GAME_DEFENDER_INT_YARDS                                                                         ; GET CURRENT GAME DEFENDER INT YARDS()
.WORD GET_CURRENT_GAME_DEFENDER_INT_TOCUHDOWNS                                                                         ; GET CURRENT GAME DEFENDER INT TDS()
	
.WORD GET_CURRENT_GAME_KICKER_XP_ATT                                                                         ; GET CURRENT GAME KICKER XP ATT()
.WORD GET_CURRENT_GAME_KICKER_XP_MADE                                                                         ; GET CURRENT GAME KICKER XP MADE()
.WORD GET_CURRENT_GAME_KICKER_FG_ATT                                                                         ; GET CURRENT GAME KICKER FG ATT()
.WORD GET_CURRENT_GAME_KICKER_FG_MADE                                                                         ; GET CURRENT GAME KICKER FG MADE()

.WORD GET_CURRENT_GAME_PUNTER_PUNTS                                                                         ; GET CURRENT GAME PUNTER PUNTS()
.WORD GET_CURRENT_GAME_PUNTER_YARDS                                                                         ; GET CURRENT GAME PUNTER YARDS()

_F}_GET_GAME_STAT_FUNCTION_TABLE

_F{_ADD_GAME_STAT_TO_SEASON_FUNCTION_TABLE												; DONE
	
ADD_STAT_TO_SEASON_STAT_PTR_TABLE:                                                      ; ADD CURRENT STATS TO SEASON STATS COMMAND POINTERS
.WORD ADD_CURRENT_GAME_TO_SEASON_QB_PASS_ATTEMPTS                                                                         ; ADD CURRENT GAME TO SEASON QB PASS ATTEMPTS()
.WORD ADD_CURRENT_GAME_TO_SEASON_QB_PASS_COMPLETIONS                                                                         ; ADD CURRENT GAME TO SEASON QB PASS COMPLETIONS()
.WORD ADD_CURRENT_GAME_TO_SEASON_QB_PASS_TOUCHDOWNS                                                                         ; ADD CURRENT GAME TO SEASON QB PASS TDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_QB_PASS_INTERCEPTIONS                                                                         ; ADD CURRENT GAME TO SEASON QB PASS INTS()
.WORD ADD_CURRENT_GAME_TO_SEASON_QB_PASS_YARDS                                                                         ; ADD CURRENT GAME TO SEASON QB PASS YARDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_QB_RUSH_ATT                                                                         ; ADD CURRENT GAME TO SEASON QB RUSH ATT()
.WORD ADD_CURRENT_GAME_TO_SEASON_QB_RUSH_YARDS                                                                         ; ADD CURRENT GAME TO SEASON QB RUSH YARDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_QB_RUSH_TOUCHDOWNS                                                                         ; ADD CURRENT GAME TO SEASON QB RUSH TDS()
	
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_RECEPTIONS                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER REC()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_REC_YARDS                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER REC YARDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_REC_TOUCHDOWNS                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER REC TDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_KR_ATT                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER KR ATT()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_KR_YARDS                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER KR YDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_KR_TOUCHDOWNS                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER KR TDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_PR_ATT                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER PR ATT()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_PR_YARDS                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER PR YDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_PR_TOUCHDOWNS                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER PR TDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_RUSH_ATT                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER RUSHING ATT()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_RUSH_YARDS                                                                        ; ADD CURRENT GAME TO SEASON SKILL PLAYER RUSHING YARDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_SKILL_RUSH_TOUCHDOWNS                                                                         ; ADD CURRENT GAME TO SEASON SKILL PLAYER RUSHING TDS()
	
.WORD ADD_CURRENT_GAME_TO_SEASON_DEFENDER_SACKS                                                                         ; ADD CURRENT GAME TO SEASON DEFENDER SACKS()
.WORD ADD_CURRENT_GAME_TO_SEASON_DEFENDER_INTS                                                                         ; ADD CURRENT GAME TO SEASON DEFENDER INTS()
.WORD ADD_CURRENT_GAME_TO_SEASON_DEFENDER_INT_YARDS                                                                         ; ADD CURRENT GAME TO SEASON DEFENDER INT YARDS()
.WORD ADD_CURRENT_GAME_TO_SEASON_DEFENDER_INT_TOUCHDOWNS                                                                         ; ADD CURRENT GAME TO SEASON DEFENDER INT TDS()

.WORD ADD_CURRENT_GAME_TO_SEASON_KICKER_XP_ATT                                                                         ; ADD CURRENT GAME TO SEASON KICKER XP ATT()
.WORD ADD_CURRENT_GAME_TO_SEASON_KICKER_XP_MADE                                                                         ; ADD CURRENT GAME TO SEASON KICKER XP MADE()
.WORD ADD_CURRENT_GAME_TO_SEASON_KICKER_FG_ATT                                                                         ; ADD CURRENT GAME TO SEASON KICKER FG ATT()
.WORD ADD_CURRENT_GAME_TO_SEASON_KICKER_FG_MADE                                                                         ; ADD CURRENT GAME TO SEASON KICKER FG MADE()
		
.WORD ADD_CURRENT_GAME_TO_SEASON_PUNTER_PUNTS                                                                         ; ADD CURRENT GAME TO SEASON PUNTER PUNTS()
.WORD ADD_CURRENT_GAME_TO_SEASON_PUNTER_YARDS                                                                         ; ADD CURRENT GAME TO SEASON PUNTER YARDS()

_F}_ADD_GAME_STAT_TO_SEASON_FUNCTION_TABLE

_F{_ADD_PLAY_STAT_TO_GAME_FUNCTION_TABLE												; DONE

ADD_CURRENT_PLAY_STATS_TO_CURRENT_GAME_STATS_FUNCTION_TABLE:							; ADD CURRENT PLAY STATS TO CURRENT GAME STATS
	.WORD INCREMENT_CURRENT_GAME_QB_PASS_ATTEMPTS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME QB PASS ATTEMPTS()
       .WORD INCREMENT_CURRENT_GAME_QB_PASS_COMPLETIONS					                                                ; ADD CURRENT PLAY TO CURRENT GAME QB PASS COMPLETIONS()
       .WORD INCREMENT_CURRENT_GAME_QB_PASS_TOUCHDOWNS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME QB PASS TDS()
       .WORD INCREMENT_CURRENT_GAME_QB_PASS_INTERCEPTIONS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME QB PASS INTS()
       .WORD ADD_YARDS_TO_CURRENT_GAME_QB_PASS_YARDS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME QB PASS YARDS()
       .WORD INCREMENT_CURRENT_GAME_QB_RUSH_ATT 					                                                ; ADD CURRENT PLAY TO CURRENT GAME QB RUSH ATT()
       .WORD ADD_YARDS_TO_CURRENT_GAME_QB_RUSH_YARDS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME QB RUSH YARDS()
       .WORD INCREMENT_CURRENT_GAME_QB_RUSH_TOUCHDOWNS					                                                ; ADD CURRENT PLAY TO CURRENT GAME QB RUSH TD()
       
	.WORD INCREMENT_CURRENT_GAME_SKILL_PLAYER_RECEPTIONS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER REC()
       .WORD ADD_YARDS_TO_CURRENT_GAME_SKILL_PLAYER_REC_YARDS					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER REC YARDS()
       .WORD INCREMENT_CURRENT_GAME_SKILL_PLAYER_REC_TOUCHDOWNS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER REC TDS()
       .WORD INCREMENT_CURRENT_GAME_SKILL_PLAYER_KR_aTT 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER KR ATT()
       .WORD ADD_YARDS_TO_CURRENT_GAME_SKILL_PLAYER_KR_YARDS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER KR YARDS()
       .WORD INCREMENT_CURRENT_GAME_SKILL_PLAYER_KR_TOUCHDOWNS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER KR TDS()
       .WORD INCREMENT_CURRENT_GAME_SKILL_PLAYER_PR_ATT 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER PR ATT()
       .WORD ADD_YARDS_TO_CURRENT_GAME_SKILL_PLAYER_PR_YARDS					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER PR YARDS()
	.WORD INCREMENT_CURRENT_GAME_SKILL_PLAYER_PR_TOUCHDOWNS					                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER PR TDS()
       .WORD INCREMENT_CURRENT_GAME_SKILL_PLAYER_RUSH_ATT 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER RUSH ATT()
       .WORD ADD_YARDS_TO_CURRENT_GAME_SKILL_PLAYER_RUSH_YARDS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER RUSH YARDS()
       .WORD INCREMENT_CURRENT_GAME_SKILL_PLAYER_RUSH_TOUCHDOWNS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER RUSH TDS()
       
       .WORD INCREMENT_CURRENT_GAME_DEFENDER_SACKS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME DEFENDER SACKS ()
       .WORD INCREMENT_CURRENT_GAME_DEFENDER_INTS 					                                                ; ADD CURRENT PLAY TO CURRENT GAME DEFENDER INTS ()
       .WORD INCREMENT_CURRENT_GAME_DEFENDER_INT_YARDS					                                                ; ADD CURRENT PLAY TO CURRENT GAME DEFENDER INT YARDS ()
       .WORD INCREMENT_CURRENT_GAME_DEFENDER_INT_TOUCHDOWNS					                                                ; ADD CURRENT PLAY TO CURRENT GAME DEFENDER INT TDS ()
       
	.WORD INCREMENT_CURRENT_GAME_KICKER_XP_ATT 					                                                ; ADD CURRENT PLAY TO CURRENT GAME KICKER XP ATT()
       .WORD INCREMENT_CURRENT_GAME_KICKER_XP_MADE 					                                                ; ADD CURRENT PLAY TO CURRENT GAME KICKER XP MADE()
       .WORD INCREMENT_CURRENT_GAME_KICKER_FG_ATT 					                                                ; ADD CURRENT PLAY TO CURRENT GAME KICKER FG ATT()
       .WORD INCREMENT_CURRENT_GAME_KICKER_FG_MADE 					                                                ; ADD CURRENT PLAY TO CURRENT GAME KICKER FG MADE()
       
       .WORD INCREMENT_CURRENT_GAME_PUNTER_PUNTS					                                                ; ADD CURRENT PLAY TO CURRENT GAME PUNTER PUNTS()
       .WORD INCREMENT_CURRENT_GAME_PUNTER_YARDS					                                                ; ADD CURRENT PLAY TO CURRENT GAME PUNTER PUNT YARDS()
       
_F}_ADD_PLAY_STAT_TO_GAME_FUNCTION_TABLE

_F{_GET_TEAM_SEASON_STATS_STARTING_ADDR													; DONE

GET_TEAM_SRAM_STATS_ADDR:							                                    ; SAVE SEASON TEAM SRAM STAT ADDRESS IN $42,$43(A= TEAM ID)

sram_addr = LOCAL_5

	ASL							                                                        ; SHIFT TEAM ID TO GET INDEX INTO TABLE
	TAY							                                                        ;
	LDA SEASON_STATS_TEAM_SRAM_ADDR_TABLE,Y					                            ; SAVE SRAM ADDR IN $42,43
	STA sram_addr						                                                        ;
	LDA SEASON_STATS_TEAM_SRAM_ADDR_TABLE+1,Y					                        ;
	STA sram_addr + 1						                                                        ;
	RTS							                                                        ; RETURN

SEASON_STATS_TEAM_SRAM_ADDR_TABLE:							                            ; SEASON TEAM SRAM STATS STARTING ADDRESS
       .WORD TEAM_1_SEASON_INFO 					                                                    ; BUF
       .WORD TEAM_2_SEASON_INFO 					                                                    ; IND
       .WORD TEAM_3_SEASON_INFO 					                                                    ; MIA
       .WORD TEAM_4_SEASON_INFO 					                                                    ; NE
       .WORD TEAM_5_SEASON_INFO 					                                                    ; JET

       .WORD TEAM_6_SEASON_INFO						                                                ; CIN 
       .WORD TEAM_7_SEASON_INFO 					                                                    ; CLE
       .WORD TEAM_8_SEASON_INFO						                                                ; HOU
       .WORD TEAM_9_SEASON_INFO 					                                                ; PIT
       
								                                                        ; EMPTY SRAM SPACE FROM 6EFD TO 7002

       .WORD TEAM_10_SEASON_INFO 					                                                    ; DEN
       .WORD TEAM_11_SEASON_INFO 					                                                    ; KC
       .WORD TEAM_12_SEASON_INFO 					                                                    ; RAI
       .WORD TEAM_13_SEASON_INFO 					                                                    ; SD
       .WORD TEAM_14_SEASON_INFO 					                                                    ; SEA

       .WORD TEAM_15_SEASON_INFO 					                                                    ; WAS
       .WORD TEAM_16_SEASON_INFO 						                                                ; NYG
	   .WORD TEAM_17_SEASON_INFO  					                                                    ; PHI
       .WORD TEAM_18_SEASON_INFO  					                                                    ; PHX	
       .WORD TEAM_19_SEASON_INFO 						                                                ; DAL

       .WORD TEAM_20_SEASON_INFO 					                                                    ; CHI
       .WORD TEAM_21_SEASON_INFO  					                                                    ; DET
       .WORD TEAM_22_SEASON_INFO 						                                                ; G.B
       .WORD TEAM_23_SEASON_INFO 						                                                ; MIN
       .WORD TEAM_24_SEASON_INFO 						                                                ; T.B

	   .WORD TEAM_25_SEASON_INFO  					                                                    ; S.F
       .WORD TEAM_26_SEASON_INFO  					                                                    ; RAM
       .WORD TEAM_27_SEASON_INFO  					                                                    ; N.O
       .WORD TEAM_28_SEASON_INFO 						                                                ; ATL

_F}_TEAM_SEASON_STATS_ADDR_TABLE       

_F{_IN_GAME_STATS_ADDR_TABLE															; DONE

P1_AND_P2_IN_GAME_STATS_STARTING_ADDR_TABLE:							                ; IN GAME P1/P2 SRAM STAT ADDRESSES
       .WORD P1_GAME_STATS_START						                                ; PLAYER 1 START ADDRESS
       .WORD P2_GAME_STATS_START						                                ; PLAYER 2 START ADDRESS
	   
_F}_IN_GAME_STATS_ADDR_TABLE	   

_F{_GET_PLAYER_SEASON_STAT_OFFSET														; DONE

GET_PLAYER_SEASON_STAT_SRAM_ADDRESS:							                        ; ADD PLAYER OFFSET TO SEASON SRAM STAT ADDRESS(Y=PLAYER ID, $42,43= SRAM ADDRESS)

sram_addr = LOCAL_5

	LDA INDEX_TO_PLAYER_SEASON_STAT_TABLE,Y					                            ; LOAD PLAYER OFFSET TO SEASON STAT		
	CLC							                                                        ;
	ADC sram_addr						                                                ; = SEASON SRAM ADDRESS + PLAYER OFFSET TO SEASON STAT
	STA sram_addr						                                                ;
	LDA #$00						                                                    ;
	ADC sram_addr + 1						                                            ;
	STA sram_addr + 1						                                            ;
	RTS							                                                        ; RETURN

INDEX_TO_PLAYER_SEASON_STAT_TABLE:	                                                    ; PLAYER OFFSETS TO SEASON STATS
	.DB QB1_SEASON_STATS_OFFSET, QB2_SEASON_STATS_OFFSET					                                                   
	.DB RB1_SEASON_STATS_OFFSET, RB2_SEASON_STATS_OFFSET, RB3_SEASON_STATS_OFFSET, RB4_SEASON_STATS_OFFSET 			                                                 
	.DB WR1_SEASON_STATS_OFFSET, WR2_SEASON_STATS_OFFSET, WR3_SEASON_STATS_OFFSET, WR4_SEASON_STATS_OFFSET
	.DB TE1_SEASON_STATS_OFFSET, TE2_SEASON_STATS_OFFSET					                ; 
	.DB $00, $00, $00, $00, $00 		                                                ; 
	.DB RE_SEASON_STATS_OFFSET, NT_SEASON_STATS_OFFSET, LE_SEASON_STATS_OFFSET 				                                                   
    .DB ROLB_SEASON_STATS_OFFSET, RILB_SEASON_STATS_OFFSET, LILB_SEASON_STATS_OFFSET, LOLB_SEASON_STATS_OFFSET	
	.DB RCB_SEASON_STATS_OFFSET, LCB_SEASON_STATS_OFFSET, FS_SEASON_STATS_OFFSET, SS_SEASON_STATS_OFFSET			                                             
	.DB K_SEASON_STATS_OFFSET, P_SEASON_STATS_OFFSET					                                                 

_F}_GET_PLAYER_SEASON_STAT_OFFSET

_F{_GET_PLAYER_IN_GAME_STAT_OFFSET														; DONE

sram_addr = LOCAL_3

GET_PLAYER_IN_GAME_STAT_SRAM_ADDRESS:							                        ; ADD PLAYER OFFSET TO IN GAME SRAM STAT ADDRESS(Y=PLAYER ID, $42,43= SRAM ADDRESS)
	LDA INDEX_TO_PLAYER_IN_GAME_STAT_TABLE,Y					                        ; LOAD PLAYER OFFSET
	CLC							                                                        ;
	ADC sram_addr						                                                ; = IN GAME SRAM ADDRESS + PLAYER OFFSET
	STA sram_addr						                                                ;
	LDA #$00						                                                    ;
	ADC sram_addr + 1						                                            ;
	STA sram_addr + 1						                                            ;
	RTS							                                                        ; RETURN

INDEX_TO_PLAYER_IN_GAME_STAT_TABLE:							                            ; PLAYER OFFSETS TO IN-GAME STATS
	.DB (P1_QB_0_GM_STATS_START-P1_GAME_STATS_START), (P1_QB_1_GM_STATS_START-P1_GAME_STATS_START)					                                                 
	.DB (P1_RB_1_GM_STATS_START-P1_GAME_STATS_START), (P1_RB_2_GM_STATS_START-P1_GAME_STATS_START), (P1_RB_3_GM_STATS_START-P1_GAME_STATS_START), (P1_RB_4_GM_STATS_START-P1_GAME_STATS_START)
	.DB (P1_WR_1_GM_STATS_START-P1_GAME_STATS_START), (P1_WR_2_GM_STATS_START-P1_GAME_STATS_START), (P1_WR_3_GM_STATS_START-P1_GAME_STATS_START), (P1_WR_4_GM_STATS_START-P1_GAME_STATS_START)                               
	.DB (P1_TE_1_GM_STATS_START-P1_GAME_STATS_START), (P1_TE_2_GM_STATS_START-P1_GAME_STATS_START)					                                               
	.DB $00, $00, $00, $00, $00	                                                      
	.DB (P1_RE_GM_STATS_START-P1_GAME_STATS_START), (P1_NT_GM_STATS_START-P1_GAME_STATS_START), (P1_LE_GM_STATS_START-P1_GAME_STATS_START)                                                                 
    .DB (P1_ROLB_GM_STATS_START-P1_GAME_STATS_START), (P1_RILB_GM_STATS_START-P1_GAME_STATS_START), (P1_LILB_GM_STATS_START-P1_GAME_STATS_START), (P1_LOLB_GM_STATS_START-P1_GAME_STATS_START)                              
    .DB (P1_RCB_GM_STATS_START-P1_GAME_STATS_START), (P1_LCB_GM_STATS_START-P1_GAME_STATS_START), (P1_FS_GM_STATS_START-P1_GAME_STATS_START), (P1_SS_GM_STATS_START-P1_GAME_STATS_START)                                   	
	.DB (P1_K_GM_STATS_START-P1_GAME_STATS_START), (P1_P_GM_STATS_START-P1_GAME_STATS_START)  

_F}_GET_PLAYER_IN_GAME_STAT_OFFSET	

_F{_GET_PLAYER_SEASON_STATS_FUNCTIONS													; DONE									
																						; *** could use enum for stat indexes 
GET_PLAYER_SEASON_STAT:							                                        ; GET SEASON STATS(A= PLAYER ID, 6E= TEAM ID, X= COMMAND)

command_addr		= LOCAL_1
sram_stat_addr		= LOCAL_5

roster_id			= LOCAL_8

stat_value			= LOCAL_7

	STA roster_id						                                                ; SAVE PLAYER ID
	LDA CURRENT_TEAM						                                            ; LOAD TEAM ID
	JSR GET_TEAM_SRAM_STATS_ADDR					                                    ; SAVE SEASON TEAM SRAM STAT ADDRESS IN $42,$43(A= TEAM ID)
	LDY roster_id						                                                ; LOAD PLAYER ID
	JSR GET_PLAYER_SEASON_STAT_SRAM_ADDRESS					                            ; ADD PLAYER OFFSET TO SRAM STAT ADDRESS(Y=PLAYER ID, $42,43= SRAM ADDRESS)
	TXA							                                                        ; SET STAT TO GET INDEX
	ASL							                                                        ;
	TAY							                                                        ;
	LDA GET_SEASON_STAT_PTR_TABLE,Y					                                    ; SAVE COMMAND ADDRESS IN 3E,3F
	STA command_addr						                                            ;
	LDA GET_SEASON_STAT_PTR_TABLE+1,Y					                                ; 
	STA command_addr+1						                                            ;
	MMC3_SRAM_WRITE_DISABLE
	JMP (command_addr)						                                            ; JUMP TO COMMAND

GET_SEASON_QB_PASS_ATT:							                                        ; GET QB PASS ATTEMPTS(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$00						                                                    ; SET STAT INDEX = PASSING ATTEMPTS
	JMP GET_SEASON_PASS_ATT_OR_COMPLETIONS					                            ; JUMP->GET PLAYER STAT AND MULTIPLIER TWO BYTES AWAY(Y = STAT INDEX)

GET_SEASON_QB_PASS_COMP:							                                    ; GET QB PASS COMPLETIONS(), RET $44 = STAT, $45= MULTIPLIER	 
	LDY #$01						                                                    ; SET STAT INDEX = PASSING COMPLETIONS 
	JMP GET_SEASON_PASS_ATT_OR_COMPLETIONS					                                                    ; JUMP->GET PLAYER STAT AND MULTIPLIER TWO BYTES AWAY(Y = STAT INDEX)

GET_SEASON_QB_PASS_TD:							                                        ; GET QB PASS TDS(), RET $44 = STAT, $45= MULTIPLIER
	LDY #$02						                                                    ; SET STAT INDEX = PASSING TD'S
	JMP GET_SEASON_STAT_UPPER_6_BITS					                                                    ; JUMP-> GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)

GET_SEASON_QB_PASS_INT:							                                        ; GET QB PASS INTS(), RET $44 = STAT, $45= MULTIPLIER
	LDY #$03						                                                    ; SET STAT INDEX = PASSING INTS 
	JMP GET_SEASON_STAT_UPPER_6_BITS					                                                    ; JUMP-> GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)

GET_SEASON_QB_PASS_YARDS:							                                    ; GET QB PASS YDS() RET $44 = STAT, $45= MULTIPLIER
	LDY #$04						                                                    ; SET STAT INDEX = PASSING YARDS
	LDA (sram_stat_addr),Y						                                                    ;
	STA stat_value						                                                        ; 
	LDY #$07						                                                    ; SET STAT INDEX = PASSING YARD MULTIPLIER
	LDA (sram_stat_addr),Y						                                                    ; 
	LSR							                                                        ; SHIFT OUT LOWER 3 BITS
	LSR							                                                        ;
	LSR							                                                        ;
	STA stat_value + 1						                                                        ; SAVE PASSING YARDS MULTIPLIER (MAX VAL =32)
	RTS							                                                        ; RETURN

GET_SEASON_QB_RUSH_ATT:							                                        ; GET QB RUSH ATT(), RET $44 = STAT, $45= MULTIPLIER
	LDY #$05						                                                    ; SET STAT INDEX = QB RUSH ATT 
	JMP GET_SEASON_STAT_SINGLE_BYTE					                                                    ; JUMP->GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)

GET_SEASON_QB_RUSH_YARDS:							                                    ; GET QB RUSH YARD(), RET $44 = STAT, $45= MULTIPLIER
	LDY #$06						                                                    ; SET STAT INDEX = QB RUSH YARDS
	JMP GET_SEASON_QB_RUSH_YARDS_OR_KR_YARDS					                                                    ; JUMP->GET PLAYER STAT AND MULTIPLIER ONE BYTE AWAY(Y = STAT INDEX)

GET_SEASON_QB_RUSH_TDS:							                                        ; GET QB RUSH TD(), RET $44 = STAT, $45= MULTIPLIER
	LDY #$08						                                                    ; SET STAT INDEX = QB RUSH TD
	JMP GET_SEASON_STAT_UPPER_6_BITS					                                                    ; JUMP-> GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)

GET_SEASON_SKILL_PLAYER_RUSH_YARDS:							                            ; GET SKILL PLAYER RUSHING YARDS(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$0A						                                                    ; SET STAT INDEX = SKILL PLAYER BASE RUSH YARDS
	LDA (sram_stat_addr),Y						                                        ;
	STA stat_value						                                                ; SAVE BASE RUSHING YARDS
	LDY #$06						                                                    ;
	LDA (sram_stat_addr),Y						                                        ;
	AND #$03						                                                    ;
	STA stat_value + 1						                                            ;
	LDY #$0B						                                                    ;
	LDA (sram_stat_addr),Y						                                        ;
	AND #$03						                                                    ;
	ASL							                                                        ;
	ASL							                                                        ;
	ORA stat_value + 1						                                            ;
	STA stat_value + 1						                                            ;
	RTS							                                                        ; RETURN

GET_SEASON_SKILL_PLAYER_RUSH_ATT:							                            ; GET SKILL PLAYER RUSHING ATT(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$09						                                                    ; SET STAT INDEX = SKILL PLAYER RUSHING ATT 
	JMP GET_SEASON_STAT_SINGLE_BYTE					                                    ; JUMP->GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)

GET_SEASON_SKILL_PLAYER_RUSH_TD:							                            ; GET SKILL PLAYER RUSHING TD(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$0B						                                                    ; SET STAT INDEX = SKILL PLAYER TD
	JMP GET_SEASON_STAT_UPPER_6_BITS					                                                    ; JUMP-> GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)

GET_SEASON_SKILL_PLAYER_RECS:							                                ; GET SKILL PLAYER REC(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$00						                                                    ; SET STAT INDEX = SKILL PLAYER REC
	JMP GET_SEASON_STAT_SINGLE_BYTE					                                                    ; JUMP->GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)

GET_SEASON_SKILL_PLAYER_REC_YARDS:							                            ; GET SKILL PLAYER REC YARDS(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$01						                                                    ; SET STAT INDEX = SKILL PLAYER BASE RECEIVING YARDS
	LDA (sram_stat_addr),Y						                                                    ;
	STA stat_value						                                                        ;
	LDY #$08						                                                    ; SET STAT INDEX = RECEIVING YARDS MULTIPLIER
	LDA (sram_stat_addr),Y						                                                    ;
	AND #$0F						                                                    ;
	STA stat_value + 1						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_SKILL_PLAYER_REC_TDS:							                            ; GET SKILL PLAYER REC TDS (), RET $44, = STAT, $45= MULTIPLIER
	LDY #$02						                                                    ; SET STAT INDEX = REC TD
	JMP GET_SEASON_STAT_UPPER_6_BITS					                                                    ; JUMP-> GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)

GET_SEASON_SKILL_PLAYER_KR_ATT:							                                ; GET SKILL PLAYER KR ATT (), RET $44, = STAT, $45= MULTIPLIER
	LDY #$03						                                                    ; SET STAT INDEX = KICK RET ATT
	JMP GET_SEASON_STAT_UPPER_7_BITS					                                                    ; JUMP->GET PLAYER STAT UPPER 7 BITS (Y= STAT INDEX)

GET_SEASON_SKILL_PLAYER_KR_YARDS:							                            ; GET SKILL PLAYER KR YDS (), RET $44, = STAT, $45= MULTIPLIER 
	LDY #$04						                                                    ; SET STAT INDEX = KICK RETURN BASE YARDS
	JMP GET_SEASON_QB_RUSH_YARDS_OR_KR_YARDS					                                                    ; JUMP->GET PLAYER STAT AND MULTIPLIER ONE BYTE AWAY(Y = STAT INDEX)

GET_SEASON_SKILL_PLAYER_KR_TDS:							                                ; GET SKILL PLAYER KR TD (), RET $44, = STAT, $45= MULTIPLIER
	LDY #$05						                                                    ; SET STAT INDEX = KICK RET TD
	LDA (sram_stat_addr),Y						                                                    ;
	AND #$F8						                                                    ; MASK OUT KR YD MULTIPLIER BITS
	LSR							                                                        ; SHIFT TO GET VALUE
	LSR							                                                        ;
	LSR							                                                        ; 
	STA stat_value						                                                        ; SAVE STAT VALUE
	LDA #$00						                                                    ; SET STAT MULTIPLIER = 0
	STA stat_value + 1						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_SKILL_PLAYER_PR_ATT :							                            ; GET SKILL PLAYER PR ATT  (), RET $44, = STAT, $45= MULTIPLIER
	LDY #$06						                                                    ;
	JMP GET_SEASON_STAT_UPPER_6_BITS					                                ; JUMP-> GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)

GET_SEASON_SKILL_PLAYER_PR_YARDS:							                            ; GET SKILL PLAYER PR YDS (), RET $44, = STAT, $45= MULTIPLIER
	LDY #$07						                                                    ; SET STAT INDEX = PUNT RETURN BASE YARDS
	LDA (sram_stat_addr),Y						                                                    ;
	STA stat_value						                                                        ;
	LDY #$02						                                                    ; SET STAT INDEX = PUNT RETURN YDS MULTIPLIER
	LDA (sram_stat_addr),Y						                                                    ;
	AND #$03						                                                    ; KEEP ONLY PR MULTIPLIER BITS
	STA stat_value + 1						                                                        ; SAVE IN STAT MULTIPLIER
	RTS							                                                        ; RETURN

GET_SEASON_SKILL_PLAYER_PR_TDS:
	LDY #$08						                                                    ; GET SKILL PLAYER PR TDS (), RET $44, = STAT, $45= MULTIPLIER
	JMP GET_SEASON_STAT_UPPER_4_BITS					                                                    ; GET PLAYER STAT UPPER 4 BITS (Y= STAT INDEX

GET_SEASON_DEFENDER_SACKS:							                                    ; GET DEFENDER SACKS (), RET $44, = STAT, $45= MULTIPLIER
	LDY #$00						                                                    ; SET STAT INDEX = DEFENDER SACKS
	JMP GET_SEASON_STAT_UPPER_7_BITS					                                                    ; JUMP->GET PLAYER STAT UPPER 7 BITS (Y= STAT INDEX)

GET_SEASON_DEFENDER_INTS:							                                    ; GET DEFENDER INTs(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$01						                                                    ; SET STAT INDEX = DEFENDER INTS
	JSR GET_SEASON_STAT_UPPER_4_BITS					                                                    ; GET PLAYER STAT UPPER 4 BITS (Y= STAT INDEX)
	DEY							                                                        ; SRAM OFFSET-- 
	LDA (sram_stat_addr),Y						                                                    ; LOAD INT MULTIPLIER
	AND #$01						                                                    ; MASK OUT OTHER STATS
	ASL							                                                        ; SHIFT TO SET TO MULTIPLIER = * 16 
	ASL							                                                        ;
	ASL							                                                        ;
	ASL							                                                        ;
	ORA stat_value						                                                        ; = INT VALUE  + (16 * INT MUTIPLIER)
	STA stat_value						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_DEFENDER_INT_YARDS:							                                ; GET DEFENDER INT YARDS(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$02						                                                    ; SET STAT INDEX = DEFENDER BASE INT YARDS
	LDA (sram_stat_addr),Y						                                                    ;
	STA stat_value						                                                        ;
	DEY							                                                        ; SRAM OFFSET-- 
	LDA (sram_stat_addr),Y						                                                    ; LOAD YARDS MULTIPLIER = BIT * 256
	AND #$01						                                                    ; MASK OUT OTHER STATS
	STA stat_value + 1						                                                        ; SAVE YARDS MULTIPLIER 
	RTS							                                                        ; RETURN

GET_SEASON_DEFENDER_INT_TDS:							                                ; GET DEFENDER INT TDS(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$01						                                                    ; SET STAT INDEX = DEFENDER BASE INT TDS
	LDA (sram_stat_addr),Y						                                                    ;
	AND #$0F						                                                    ; MASK AND SHIFT TO GET INT TDS = (BITS 1,2,3= MAX VAL OF 7)
	LSR							                                                        ;
	STA stat_value						                                                        ;
	LDA #$00						                                                    ; SET MULTIPLIER = 0
	STA stat_value + 1						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_KICKER_XP_ATT:							                                    ; GET KICKER XP ATT(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$00						                                                    ; SET STAT INDEX = KICKER XP ATT
	JMP GET_SEASON_STAT_SINGLE_BYTE					                                                    ; JUMP->GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)

GET_SEASON_KICKER_XP_MADE:							                                    ; GET KICKER XP MADE(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$01						                                                    ; SET STAT INDEX = KICKER XP MADE
	JMP GET_SEASON_STAT_SINGLE_BYTE					                                                    ; JUMP->GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)

GET_SEASON_KICKER_FG_ATT:							                                    ; GET KICKER FG ATT(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$02						                                                    ; SET STAT INDEX = FG ATT
	JMP GET_SEASON_STAT_SINGLE_BYTE					                                                    ; JUMP->GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)

GET_SEASON_KICKER_FG_MADE:							                                    ; GET KICKER FG MADE(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$03						                                                    ; SET STAT INDEX = FG MADE
	JMP GET_SEASON_STAT_SINGLE_BYTE					                                                    ; JUMP->GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)


GET_SEASON_KICKER_PUNT_ATT:							                                    ; GET PUNTER PUNTS(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$00						                                                    ; SET STAT INDEX = PUNTS
	JMP GET_SEASON_STAT_SINGLE_BYTE					                                                    ; JUMP->GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)

GET_SEASON_KICKER_PUNT_YARDS:							                                ; GET PUNTER PUNT YARDS(), RET $44, = STAT, $45= MULTIPLIER
	LDY #$01						                                                    ; SET STAT INDEX = BASE PUNT YARDSS
	LDA (sram_stat_addr),Y						                                                    ;
	STA stat_value						                                                        ;
	INY							                                                        ; SRAM OFFSET++
	LDA (sram_stat_addr),Y						                                                    ; LOAD PUNT YARDS MULTIPLIER = BIT * 256
	AND #$0F						                                                    ;
	STA stat_value + 1						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_STAT_UPPER_7_BITS:							                                ; GET PLAYER STAT UPPER 7 BITS (Y= STAT INDEX)
	LDA (sram_stat_addr),Y						                                                    ;
	LSR							                                                        ;
	STA stat_value						                                                        ;
	LDA #$00						                                                    ; SET MULTIPLIER = 0
	STA stat_value + 1						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_STAT_UPPER_4_BITS:							                                ; GET PLAYER STAT UPPER 4 BITS (Y= STAT INDEX) 
	LDA (sram_stat_addr),Y						                                                    ; 
	LOG_SHIFT_RIGHT_4
	STA stat_value						                                                        ;
	LDA #$00						                                                    ; SET MULTIPLIER = 0
	STA stat_value + 1						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_QB_RUSH_YARDS_OR_KR_YARDS:							                                                    ; GET PLAYER STAT AND MULTIPLIER ONE BYTES AWAY(Y = STAT INDEX)
	LDA (sram_stat_addr),Y						                                                    ; SAVE PLAYER BASE STAT VALUE IN TEMP STAT VALUE
	STA stat_value						                                                        ;
	INY							                                                        ; SRAM ADDR ++
	LDA (sram_stat_addr),Y						                                                    ;
	AND #$07						                                                    ; MASK OUT UNEEDED BITS
	STA stat_value + 1						                                                        ; SAVE MULTIPLIER
	RTS							                                                        ; RETURN

GET_SEASON_STAT_SINGLE_BYTE:							                                ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX) 
	LDA (sram_stat_addr),Y						                                                    ; SAVE PLAYER STAT VALUE IN TEMP STAT VALUE
	STA stat_value						                                                        ;
	LDA #$00						                                                    ; SET MULTIPLIER = 0
	STA stat_value + 1						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_STAT_UPPER_6_BITS:							                                ; GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)
	LDA (sram_stat_addr),Y						                                                    ;
	LOG_SHIFT_RIGHT_2																	; SHIFT OUT ATTEMPTS MODIFIER BITS
	STA stat_value						                                                        ; SAVE TEMP STAT VALUE
	LDA #$00						                                                    ; SET MULTIPLIER = 0
	STA stat_value + 1						                                                        ;
	RTS							                                                        ; RETURN

GET_SEASON_PASS_ATT_OR_COMPLETIONS:							                                                    ; GET PLAYER STAT AND MULTIPLIER TWO BYTES AWAY(Y = STAT INDEX)
	LDA (sram_stat_addr),Y						                                                    ; SAVE PLAYER BASE STAT VALUE IN TEMP STAT VALUE
	STA stat_value						                                                        ; 
	INY							                                                        ; SRAM ADDR += 2 BYTES
	INY							                                                        ;
	LDA (sram_stat_addr),Y						                                                    ; LOAD MULTIPLIER BYTE
	AND #$03						                                                    ; MASK OUT UNEEDED BITS
	STA stat_value + 1						                                                        ; SAVE MULTIPLIER
	RTS							                                                        ; RETURN

_F}_GET_PLAYER_SEASON_STATS_FUNCTIONS	
		
_F{_GET_CURRENT_GAME_STATS																; DONE

stat_command_addr			= LOCAL_1
in_game_sram_addr			= LOCAL_3
roster_id					= LOCAL_8

	
GET_CURRENT_GAME_STATS:							                                        ; GET CURRENT GAME STATS (A= PLAYER ID, X= STAT TO GET, $6F = P1 OR P2)
	STA roster_id						                                                ;
	

@get_starting_sram_address:	
	LDA TEAM_ON_OFFENSE						                                            ; LOAD TEAM IF
	ASL							                                                        ;
	TAY							                                                        ; 
	LDA P1_AND_P2_IN_GAME_STATS_STARTING_ADDR_TABLE,Y					                ; SET P1 OR P2 STAT ADDRESS FROM IN GAME P1/P2 SRAM STAT ADDRESSES
	STA in_game_sram_addr						                                                        ;
	LDA P1_AND_P2_IN_GAME_STATS_STARTING_ADDR_TABLE+1,Y					                ;
	STA in_game_sram_addr+1						                                                        ;

@get_player_stat_offset:	
	LDY roster_id					                                                    ; LOAD PLAYER ID
	JSR GET_PLAYER_IN_GAME_STAT_SRAM_ADDRESS					                        ; ADD PLAYER OFFSET TO IN GAME SRAM STAT ADDRESS(Y=PLAYER ID, $41,42= SRAM ADDRESS)
	TXA							                                                        ;
	ASL							                                                        ;
	TAY							                                                        ; 
	LDA GET_CURRENT_GAME_STAT_PTR_TABLE,Y					                            ; SAVE STAT COMMAND ADDRESS IN $3E, $3F
	STA stat_command_addr						                                                        ;
	LDA GET_CURRENT_GAME_STAT_PTR_TABLE+1,Y					                            ;
	STA stat_command_addr+1						                                                        ; 
	MMC3_SRAM_WRITE_DISABLE
	JMP (stat_command_addr)						                                                    ; JUMP TO COMMNND
	


GET_CURRENT_GAME_QB_PASS_ATTEMPTS:							                            ; GET CURRENT GAME QB PASS ATTEMPTS()
	LDY #QB_PASS_ATTEMPTS_IN_GAME_STAT_INDEX							                                                    ; SET STAT INDEX = CURRENT GAME QB PASS ATT
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_QB_PASS_CONPLETIONS:							                        ; GET CURRENT GAME QB PASS COMPLETIONS()
	LDY #QB_PASS_COMPLETIONS_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = CURRENT GAME QB PASS COMPLETIONS
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_QB_PASS_TOUCHDOWNS:							                        ; GET CURRENT GAME QB PASS TDS()
	LDY #QB_PASS_TD_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = CURRENT GAME QB PASS TDS
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_QB_PASS_INTERCEPTIONS:							                        ; GET CURRENT GAME QB PASS INTS()
	LDY #QB_PASS_INT_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = CURRENT GAME QB PASS INTS
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_QB_PASS_YARDS:							                                ; GET CURRENT GAME QB PASS YARDS()
	LDY #QB_PASS_YDS_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = CURRENT GAME QB PASS YARDS
	JMP GET_TWO_BYTE_STAT					                                                    ; JUMP-> GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_QB_RUSH_ATT:							                                ; GET CURRENT GAME QB RUSH ATT()
	LDY #QB_RUSH_ATTEMPTS_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = CURRENT GAME QB RUSH ATT
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_QB_RUSH_YARDS:							                                ; GET CURRENT GAME QB RUSH YARDS()
	LDY #QB_RUSH_YDS_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = CURRENT GAME QB RUSH YDS
	JMP GET_TWO_BYTE_STAT					                                                    ; JUMP-> GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_QB_RUSH_TD:							                                ; GET CURRENT GAME QB RUSH TDS()
	LDY #QB_RUSH_TD_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = CURRENT GAME QB RUSH TDS
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

								

GET_CURRENT_GAME_SKILL_RUSH_YARDS :							                                                    ; GET CURRENT GAME SKILL PLAYER RUSH YARDS()
	LDY #SKILL_RUN_YDS_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = CURRENT GAME SKILL PLAYER REC
	JMP GET_TWO_BYTE_STAT					                                                    ; JUMP-> GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_SKILL_RUSH_ATT:							                                                    ; GET CURRENT GAME SKILL PLAYER RUSH ATT()
	LDY #SKILL_RUN_ATT_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_SKILL_RUSH_TOUCHDOWNS:							                                                    ; GET CURRENT GAME SKILL PLAYER RUSH TDS()
	LDY #SKILL_RUN_TD_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_SKILL_RECEPTIONS:							                                                    ; GET CURRENT GAME SKILL PLAYER REC ()
	LDY #SKILL_REC_IN_GAME_STAT_INDEX
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_SKILL_REC_YARDS:							                                                    ; GET CURRENT GAME SKILL PLAYER REC YARDS ()
	LDY #SKILL_REC_YDS_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_TWO_BYTE_STAT					                                                    ; JUMP-> GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_SKILL_REC_TOUCHDOWNS:							                                                    ; GET CURRENT GAME SKILL PLAYER REC TDS()
	LDY #SKILL_REC_TD_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_SKILL_KR_ATT:							                                                    ; GET CURRENT GAME SKILL PLAYER KR ATT()
	LDY #SKILL_KR_ATT_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

GET_CURRENT_GAME_SKILL_KR_YARDS:							                                                    ; GET CURRENT GAME SKILL PLAYER KR YARDS()
	LDY #SKILL_KR_YDS_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_TWO_BYTE_STAT					                                                    ; JUMP-> GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED

GET_CURRENT_GAME_SKILL_KR_TOUCHDOWNS:							                                                    ; GET CURRENT GAME SKILL PLAYER KR TDS()
	LDY #SKILL_KR_TD_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED

GET_CURRENT_GAME_SKILL_PR_ATT:							                                                    ; GET CURRENT GAME SKILL PLAYER PR ATT()
	LDY #SKILL_PR_ATT_IN_GAME_STAT_INDEX						                                                    ; 
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED

GET_CURRENT_GAME_SKILL_PR_YARDS:							                                                    ; GET CURRENT GAME SKILL PLAYER PR YARDS()
	LDY #SKILL_PR_YDS_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_TWO_BYTE_STAT					                                                    ; JUMP-> GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED		

GET_CURRENT_GAME_SKILL_PR_TOUCHDOWNS:							                                                    ; GET CURRENT GAME SKILL PLAYER PR TDS()
	LDY #SKILL_PR_TD_IN_GAME_STAT_INDEX						                                                    ; 
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED


GET_CURRENT_GAME_DEFENDER_SACKS:							                                                    ; GET CURRENT GAME DEFENDER SACKS()
	LDY #DEF_SACKS_IN_GAME_STAT_INDEX						                                                    ;
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED

GET_CURRENT_GAME_DEFENDER_INTS:							                                ; GET CURRENT GAME DEFENDER INTS()
	LDY #DEF_INTS_IN_GAME_STAT_INDEX						                            ;
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED

GET_CURRENT_GAME_DEFENDER_INT_YARDS:							                        ; GET CURRENT GAME DEFENDER INT YARDS()
	LDY #DEF_INT_YDS_IN_GAME_STAT_INDEX						                            ; 
	JMP GET_TWO_BYTE_STAT					                                            ; JUMP-> GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS

GET_CURRENT_GAME_DEFENDER_INT_TOCUHDOWNS:							                    ; GET CURRENT GAME DEFENDER INT TDS()
	LDY #DEF_INT_TDS_IN_GAME_STAT_INDEX							                    	; 
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED

GET_CURRENT_GAME_KICKER_XP_ATT:							                                                    ; GET CURRENT GAME KICKER XP ATT ()
	LDY #XP_ATT_IN_GAME_STAT_INDEX
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS

GET_CURRENT_GAME_KICKER_XP_MADE:							                                                    ; GET CURRENT GAME KICKER XP MADE ()
	LDY #XP_MADE_IN_GAME_STAT_INDEX
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS							                                                        ; UNEEDED

GET_CURRENT_GAME_KICKER_FG_ATT:							                                                    ; GET CURRENT GAME KICKER FG ATT ()
	LDY #FG_ATT_IN_GAME_STAT_INDEX
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS

GET_CURRENT_GAME_KICKER_FG_MADE:							                                                    ; GET CURRENT GAME KICKER FG MADE ()
	LDY #FG_MADE_IN_GAME_STAT_INDEX
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS

GET_CURRENT_GAME_PUNTER_PUNTS:							                                                    ; GET CURRENT GAME PUNTER PUNTS ()
	LDY #PUNTS_IN_GAME_STAT_INDEX						                                                    ; 
	JMP GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS

GET_CURRENT_GAME_PUNTER_YARDS:							                                                    ; GET CURRENT GAME PUNTER PUNTING YARDS ()
	LDY #PUNT_YDS_IN_GAME_STAT_INDEX	
	JMP GET_TWO_BYTE_STAT					                                            ; JUMP-> GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	RTS

GET_TWO_BYTE_STAT:							                                            ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)

sram_addr 		= LOCAL_3
return_value	= LOCAL_7

	LDA (sram_addr),Y						                                                    ; SET CURRENT STAT = SRAM VALUE
	STA return_value						                                                        ;
	INY							                                                        ; SRAM OFFSET++
	LDA (sram_addr),Y						                                                    ; SET STAT MULTIPLIER = SRAM VALUE
	STA return_value+1						                                                        ;
	RTS							                                                        ; RETURN	

GET_SINGLE_BYTE_STAT:							                                        ; LOAD SINGLE BYTE STAT IN ($44,45)
	LDA (sram_addr),Y						                                                    ; SET CURRENT STAT = SRAM STAT
	STA return_value						                                                        ;
	LDA #$00						                                                    ; SET STAT MULTIPLIER = 0
	STA return_value+1							                                                        ;
	RTS							                                                        ; RETURN

_F}_GET_CURRENT_GAME_STATS

_F{_ADD_GAME_TO_SEASON_STAT_MACROS														; DONE

.MACRO  ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]

game_stat_value		= LOCAL_1
season_value		= LOCAL_7

	LDA season_value						                                                        ; = SEASON PASS ATTEMPTS + IN GAME PASS ATTEMPTS (16 BIT)
	CLC							                                                        	;
	ADC game_stat_value						                                                        ;
	STA season_value						                                                        ;
	LDA season_value+1						                                                        ;
	ADC game_stat_value+1						                                                        ;
	STA season_value+1								                                                    ;
.ENDM

.MACRO  ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]

game_stat_value		= LOCAL_1
season_value		= LOCAL_7

	LDA season_value						                                                        ; = SEASON SKILL PLAYER RUSH TD  + IN GAME SKILL PLAYER RUSH TD
	CLC
	ADC game_stat_value
	STA season_value							                                                    ;
.ENDM

.MACRO CHECK_IF_TWO_BYTE_QB_SEASON_VALUE_OVER_LIMIT[limit] limit


	CMP #>(limit+1)						                                                ; < high byte
	BCC @exit						                                                    ; YES-> EXIT
	
@set_max_attempts:	
	LDA #<limit							                                        ; ELSE SET ATTEMPTS TO MAX VALUE -1 
	STA season_value						                                            ;
	LDA #>limit							                                            ;
	STA season_value + 1						                                        ;
@exit:							                                                        ; EXIT
	RTS							                                                        
.ENDM

.MACRO CHECK_IF_ONE_BYTE_QB_SEASON_VALUE_OVER_LIMIT[limit] limit


	
	CMP #(limit+1)						                                                ; < high byte
	BCC @exit						                                                    ; YES-> EXIT
	
@set_max_attempts:	
	LDA #limit							                                        ; ELSE SET ATTEMPTS TO MAX VALUE -1 
	STA season_value						                                            ;																						;
@exit:
	LDA #$00					                                            			;
	STA season_value + 1							                                    ; EXIT
	RTS							                                                        
.ENDM

.MACRO CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[] 


	BEQ @exit						                                                    ; YES-> EXIT
@set_max_attempts:	
	LDA #$00							                                        ; ELSE SET ATTEMPTS TO MAX VALUE -1 
	STA season_value + 1						                                            ;																						;
	LDA #$FF					                                            			;
	STA season_value + 0							                                    ; EXIT
@exit	
	RTS							                                                        
.ENDM

.MACRO CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] limit 


	
	CMP #(limit + 1) 						                                                    ; SET MAX RUSH TD  = 63
	BCC @exit
	LDA #limit
	STA season_value
@exit:
	RTS	
	; RETURN
.ENDM

.MACRO CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] limit 


	
	BPL @check_over_max						                                                    ; SAVE YARDS AND MULTIPLIER AND CHECK FOR LIMITS = 4095 YARDS
	LDA multiplier_save
	BPL @set_max_value

@set_zero_if_neg	
	LDA #$00
	STA season_value
	STA season_value+1
	JMP @exit

@check_over_max:
	LDA season_value+1
	CMP #>(limit+1)
	BCC @exit

@set_max_value:
	LDA #<(limit)
	STA season_value
	LDA #>(limit)
	STA season_value+1
@exit:
	RTS							                                                        ; RETURN


.ENDM

_F}_ADD_GAME_TO_SEASON_STAT_MACROS	

_F{_ADD_GAME_STATS_TO_SEASON_FUNCTIONS													; DONE

ADD_STAT_TO_SEASON_STAT[stat_function_index]:							                ; ADD CURRENT STATS TO SEASON STATS(X= STAT TO ADD)

season_stat_command_addr	= LOCAL_1
in_game_stat_addr			= LOCAL_3
roster_id					= LOCAL_8

	STA roster_id						                                                        ; SAVE PLAYER ID
	LDA TEAM_ON_OFFENSE						                                            ; LOAD P1 OR P2 TEAM INDEX
	ASL							                                                        ; SHIFT FOR INDEX INTO TABLE
	TAY							                                                        ;
	
@get_side_stat_addr:	
	LDA P1_AND_P2_IN_GAME_STATS_STARTING_ADDR_TABLE,Y					                ; SET P1/P2 TEAM STAT ADDRESS FROM IN GAME P1/P2 SRAM STAT ADDRESSES
	STA in_game_stat_addr						                                        ;
	LDA P1_AND_P2_IN_GAME_STATS_STARTING_ADDR_TABLE+1,Y					                ;
	STA in_game_stat_addr+1						                                          ;
	
@get_player_in_game_stat_sram_addr:
	LDY roster_id						                                                ; LOAD PLAYER ID
	JSR GET_PLAYER_IN_GAME_STAT_SRAM_ADDRESS					                        ; ADD PLAYER OFFSET TO IN GAME SRAM STAT ADDRESS(Y=PLAYER ID, $42,43= SRAM ADDRESS)
	LDA CURRENT_TEAM						                                            ; LOAD TEAM ID
	JSR GET_TEAM_SRAM_STATS_ADDR					                                    ; SAVE SEASON TEAM SRAM STAT ADDRESS IN $42,$43(A= TEAM ID)
	
@get_player_season_stat_sram_addr:	
	LDY roster_id						                                                        ;
	JSR GET_PLAYER_SEASON_STAT_SRAM_ADDRESS					                            ; ADD PLAYER OFFSET TO SRAM STAT ADDRESS(A=PLAYER ID, $42,43= SRAM ADDRESS)
	TXA							                                                        ; CONVERT STAT TO ADD INTO STAT FUNCTION INDEX 
	ASL							                                                        ; SHIFT SINCE EACH ENTRY IS TWO BYTES LONG
	TAY							                                                        ; 
	LDA ADD_STAT_TO_SEASON_STAT_PTR_TABLE,Y					                            ; GET ADDR FROM ADD CURRENT STATS TO SEASON STATS COMMAND POINTERS
	STA season_stat_command_addr						                                                        ;
	LDA ADD_STAT_TO_SEASON_STAT_PTR_TABLE+1,Y					                        ;
	STA season_stat_command_addr+1						                                                        ;
	MMC3_SRAM_WRITE_DISABLE
	JMP (season_stat_command_addr)						                                ; JUMP TO ADDR




season_stat_save		= LOCAL_1
season_sram_addr		= LOCAL_5
season_value			= LOCAL_7
multiplier_save			= SEGMENT_VAR_8F

ADD_CURRENT_GAME_TO_SEASON_QB_PASS_ATTEMPTS:							                ; ADD CURRENT GAME TO SEASON QB PASS ATTEMPTS()



	LDY #$00						                                                    ; SET STAT INDEX = PASS ATTEMPTS
	JSR GET_SEASON_PASS_ATT_OR_COMPLETIONS					                            ; GET PLAYER STAT AND MULTIPLIER TWO BYTES AWAY(Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	
	LDY #QB_PASS_ATTEMPTS_IN_GAME_STAT_INDEX						                    ;
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]									; = SEASON PASS ATTEMPTS + IN GAME PASS ATTEMPTS (16 BIT)
	CHECK_IF_TWO_BYTE_QB_SEASON_VALUE_OVER_LIMIT[limit] 1023 


ADD_CURRENT_GAME_TO_SEASON_QB_PASS_COMPLETIONS:							                                                    ; ADD CURRENT GAME TO SEASON QB PASS COMPLETIONS()
	LDY #$01						                                                    ; SET STAT INDEX = PASS COMPLETIONS
	JSR GET_SEASON_PASS_ATT_OR_COMPLETIONS					                            ; GET PLAYER STAT AND MULTIPLIER TWO BYTES AWAY(Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	
	LDY #QB_PASS_COMPLETIONS_IN_GAME_STAT_INDEX						                    ;
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]									;  = SEASON PASS COMPLETIONS + IN GAME PASS COMPLETIONS (16 BIT)
	CHECK_IF_TWO_BYTE_QB_SEASON_VALUE_OVER_LIMIT[limit] 1023 

ADD_CURRENT_GAME_TO_SEASON_QB_PASS_TOUCHDOWNS:							                ; ADD CURRENT GAME TO SEASON QB PASS TDS()
	LDY #$02						                                                    ; SET STAT INDEX = PASSING TD'S
	JSR GET_SEASON_STAT_UPPER_6_BITS					                                ; GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #QB_PASS_TD_IN_GAME_STAT_INDEX						                            ;
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]					                ; = SEASON PASS TDS + IN GAME PASS TDS 
	CHECK_IF_ONE_BYTE_QB_SEASON_VALUE_OVER_LIMIT[limit] 63

ADD_CURRENT_GAME_TO_SEASON_QB_PASS_INTERCEPTIONS:							             ; ADD CURRENT GAME TO SEASON QB PASS INTS()
	LDY #$03						                                                    ; SET STAT INDEX = SEASON PASSING INTS
	JSR GET_SEASON_STAT_UPPER_6_BITS					                                ; GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #QB_PASS_INT_IN_GAME_STAT_INDEX						                            ; SET STAT INDEX = IN-GAME PASSING INTS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]						            ; = SEASON PASS INTS + IN GAME PASS INTSS
	CHECK_IF_ONE_BYTE_QB_SEASON_VALUE_OVER_LIMIT[limit] 63

ADD_CURRENT_GAME_TO_SEASON_QB_PASS_YARDS:							                    ; ADD CURRENT GAME TO SEASON QB PASS YARDS()
	LDY #$04						                                                    ; SET STAT INDEX = SEASON PASSING YARDS BASE
	LDA (season_sram_addr),Y						                                                    ;
	STA season_stat_save						                                                        ;
	LDY #$07						                                                    ; SET STAT INDEX = SEASON PASSING YARDS MULTIPLIER
	LDA (season_sram_addr),Y						                                                    ;	
	LSR							                                                        ;
	LSR							                                                        ;
	LSR							                                                        ;
	STA season_stat_save+1					                                                        ;
	LDY #QB_PASS_YDS_IN_GAME_STAT_INDEX						                            ; SET STAT INDEX = PASSING YARDS BASE
	JSR GET_TWO_BYTE_STAT					                                            ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	STA multiplier_save						                                                        ; SAVE MULTIPLER
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]									;  = SEASON PASSING YARDS + IN GAME PASSING YARDS
	CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] 8191
	

ADD_CURRENT_GAME_TO_SEASON_QB_RUSH_ATT:							                        ; ADD CURRENT GAME TO SEASON QB RUSH ATT()
	LDY #$05						                                                    ; SET STAT INDEX = SEASON QB RUSHING ATT
	JSR GET_SEASON_STAT_SINGLE_BYTE					                                    ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #QB_RUSH_ATTEMPTS_IN_GAME_STAT_INDEX						                    ; SET STAT INDEX = IN-GAME QB RUSHING ATT
	JSR GET_SINGLE_BYTE_STAT					                                        ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]									; = SEASON RUSH ATT  + IN GAME RUSH ATT
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[] 

ADD_CURRENT_GAME_TO_SEASON_QB_RUSH_YARDS:							                    ; ADD CURRENT GAME TO SEASON QB RUSH YARDS()
	LDY #$06						                                                    ; SET STAT INDEX = SEASON QB RUSH YARDS
	JSR GET_SEASON_QB_RUSH_YARDS_OR_KR_YARDS					                        ; GET PLAYER STAT AND MULTIPLIER ONE BYTE AWAY(Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #QB_RUSH_YDS_IN_GAME_STAT_INDEX						                            ; SET STAT INDEX = IN-GAME QB RUSHING YARDS
	JSR GET_TWO_BYTE_STAT					                                            ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	STA multiplier_save						                                                        ; SAVE MULTIPLIER
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]  									; = SEASON QB RUSH YARDS  + IN GAME QB RUSH YARDS
	
	CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] 2047

ADD_CURRENT_GAME_TO_SEASON_QB_RUSH_TOUCHDOWNS:							                ; ADD CURRENT GAME TO SEASON QB RUSH TDS()
	LDY #$08						                                                    ; SET STAT INDEX = SEASON QB RUSH TDS
	JSR GET_SEASON_STAT_UPPER_6_BITS					                                ; GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #QB_RUSH_TD_IN_GAME_STAT_INDEX						                             ; SET STAT INDEX = IN-GAME QB RUSH TDS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]									; = SEASON QB RUSH TDS  + IN GAME QB RUSH TDS
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 63

ADD_CURRENT_GAME_TO_SEASON_SKILL_RUSH_YARDS:							                ; ADD CURRENT GAME TO SEASON SKILL PLAYER RUSH YDS()
	LDY #$0A						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER BASE RUSH YARDS
	LDA (season_sram_addr),Y
	STA season_stat_save
	LDY #$06						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER RUSH YARD MULTIPLIER
	LDA (season_sram_addr),Y
	AND #$03
	STA season_stat_save + 1
	LDY #$0B						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER RUSH YARD MULTIPLIER 2
	LDA (season_sram_addr),Y						                                                    ; FINAL SEASON RUSH YARDS MULTIPLIER = MULT1 + (4 * MULTI2)
	AND #$03
	ASL
	ASL
	ORA season_stat_save + 1
	STA season_stat_save + 1						                                                        ;
	LDY #SKILL_RUN_YDS_IN_GAME_STAT_INDEX						                        ; SET STAT INDEX =  IN GAME PLAYER RUSH YARDS
	JSR GET_TWO_BYTE_STAT					                                            ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	STA multiplier_save						                                                        ; SAVE MULTIPLIER
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]					                ; = SEASON SKILL PLAYER RUSH YARDS  + IN GAME SKILL PLAYER RUSH YARDS
	CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] 4095				; RETURN

ADD_CURRENT_GAME_TO_SEASON_SKILL_RUSH_ATT:							                                                    ; ADD CURRENT GAME TO SEASON SKILL PLAYER RUSH ATT()
	LDY #$09						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER RUSH ATT
	JSR GET_SEASON_STAT_SINGLE_BYTE					                                    ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #SKILL_RUN_ATT_IN_GAME_STAT_INDEX						                        ; SET STAT INDEX =  IN-GAME SKILL PLAYER RUSH ATT
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]									; = SEASON SKILL PLAYER RUSH ATT  + IN GAME SKILL PLAYER RUSH ATT
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[] 

ADD_CURRENT_GAME_TO_SEASON_SKILL_RUSH_TOUCHDOWNS:							            ; ADD CURRENT GAME TO SEASON SKILL PLAYER RUSH TD()
	LDY #$0B						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER RUSH TD
	JSR GET_SEASON_STAT_UPPER_6_BITS					                                ; GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #SKILL_RUN_TD_IN_GAME_STAT_INDEX						                        ; SET STAT INDEX =  IN-GAME SKILL PLAYER RUSH TD
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]						            ; = SEASON SKILL PLAYER RUSH TD  + IN GAME SKILL PLAYER RUSH TD
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 63

ADD_CURRENT_GAME_TO_SEASON_SKILL_RECEPTIONS:							                                                    ; ADD CURRENT GAME TO SEASON SKILL PLAYER REC 
	LDY #$00						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER REC
	JSR GET_SEASON_STAT_SINGLE_BYTE					                                                    ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #SKILL_REC_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER REC
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]					                             ; = SEASON SKILL PLAYER REC  + IN GAME SKILL PLAYER REC 
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[] 						                                                        ; RETURN

ADD_CURRENT_GAME_TO_SEASON_SKILL_REC_YARDS:							                    ; ADD CURRENT GAME TO SEASON SKILL PLAYER REC YARDS 
	LDY #$01						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER BASE REC YARDS
	LDA (season_sram_addr),Y
	STA season_stat_save
	LDY #$08						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER REC YARDS MULTIPLIER
	LDA (season_sram_addr),Y
	AND #$0F
	STA season_stat_save + 1
	LDY #SKILL_REC_YDS_IN_GAME_STAT_INDEX						                        ; SET STAT INDEX =  IN-GAME SKILL PLAYER REC YARDS
	JSR GET_TWO_BYTE_STAT					                                            ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	STA multiplier_save						                                                        ; SAVE MULTIPLIER
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]					                            ; = SEASON SKILL PLAYER REC YARDS  + IN GAME SKILL PLAYER REC YARDS
	CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] 4095

ADD_CURRENT_GAME_TO_SEASON_SKILL_REC_TOUCHDOWNS:							            ; ADD CURRENT GAME TO SEASON SKILL PLAYER REC TDS
	LDY #$02						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER REC TDS
	JSR GET_SEASON_STAT_UPPER_6_BITS					                                ; GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #SKILL_REC_TD_IN_GAME_STAT_INDEX						                        ; SET STAT INDEX =  IN-GAME SKILL PLAYER REC TDS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]					                 ; = SEASON SKILL PLAYER REC TD + IN GAME SKILL PLAYER REC TD 
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 63

ADD_CURRENT_GAME_TO_SEASON_SKILL_KR_ATT:							                    ; ADD CURRENT GAME TO SEASON SKILL PLAYER KR ATT
	LDY #$03						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER KR ATT
	JSR GET_SEASON_STAT_UPPER_7_BITS					                                ; GET PLAYER STAT UPPER 7 BITS (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #SKILL_KR_ATT_IN_GAME_STAT_INDEX						                        ; SET STAT INDEX =  IN-GAME SKILL PLAYER KR ATT
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]						            ; = SEASON SKILL PLAYER KR ATT  + IN GAME SKILL PLAYER KR ATT
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 127

ADD_CURRENT_GAME_TO_SEASON_SKILL_KR_YARDS:							                    ; ADD CURRENT GAME TO SEASON SKILL PLAYER KR YDS
	LDY #$04						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER KR YARDS
	JSR GET_SEASON_QB_RUSH_YARDS_OR_KR_YARDS					                        ; GET PLAYER STAT AND MULTIPLIER ONE BYTE AWAY(Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #SKILL_KR_YDS_IN_GAME_STAT_INDEX						                        ; SET STAT INDEX =  IN-GAME SKILL PLAYER KR YARDS
	JSR GET_TWO_BYTE_STAT					                                            ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	STA multiplier_save						                                                        ; SAVE MULTIPLIER	
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]						                         ; = SEASON SKILL PLAYER KR YDS  + IN GAME SKILL PLAYER KR YDS

	CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] 2047

ADD_CURRENT_GAME_TO_SEASON_SKILL_KR_TOUCHDOWNS:							                                                    ; ADD CURRENT GAME TO SEASON SKILL PLAYER KR TDS
	LDY #$05						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER KR TD
	LDA (season_sram_addr),Y						                                                    ;
	AND #$F8						                                                    ;
	LSR
	LSR
	LSR
	STA season_stat_save
	LDA #$00
	STA season_stat_save + 1
	LDY #SKILL_KR_TD_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX =  IN-GAME SKILL PLAYER KR TD
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]						             ; = SEASON SKILL PLAYER KR TD  + IN GAME SKILL PLAYER KR TD
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 31

ADD_CURRENT_GAME_TO_SEASON_SKILL_PR_ATT:							                                                    ; ADD CURRENT GAME TO SEASON SKILL PLAYER PR ATT
	LDY #$06						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER PR ATT
	JSR GET_SEASON_STAT_UPPER_6_BITS					                                                    ; GET PLAYER STAT UPPER 6 BITS (Y = STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #SKILL_PR_ATT_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX =  IN-GAME SKILL PLAYER PR ATT
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]					                ; = SEASON SKILL PLAYER PR ATT  + IN GAME SKILL PLAYER PR ATT
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 63

ADD_CURRENT_GAME_TO_SEASON_SKILL_PR_YARDS:							                    ; ADD CURRENT GAME TO SEASON SKILL PLAYER PR YARDS
	LDY #$07						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER BASE PR YARDS
	LDA (season_sram_addr),Y
	STA season_stat_save
	LDY #$02						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER BASE PR YARD MULTIPLIER
	LDA (season_sram_addr),Y
	AND #$03
	STA season_stat_save + 1
	LDY #SKILL_PR_YDS_IN_GAME_STAT_INDEX						                        ; SET STAT INDEX =  IN-GAME SKILL PLAYER PR YARDS
	JSR GET_TWO_BYTE_STAT					                                            ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	STA multiplier_save						                                                        ; SAVE MULTIPLIER		
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]							        ;  = SEASON SKILL PLAYER PR YARDS + IN GAME SKILL PLAYER PR YARDS
	CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] 1023

ADD_CURRENT_GAME_TO_SEASON_SKILL_PR_TOUCHDOWNS:							                ; ADD CURRENT GAME TO SEASON SKILL PLAYER PR TD
	LDY #$08						                                                    ; SET STAT INDEX =  SEASON SKILL PLAYER PR TDS
	JSR GET_SEASON_STAT_UPPER_4_BITS					                                ; GET PLAYER STAT UPPER 4 BITS (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #SKILL_PR_TD_IN_GAME_STAT_INDEX						                            ; SET STAT INDEX =  IN-GAME SKILL PLAYER PR TDS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]					                ; = SEASON SKILL PLAYER PR TD + IN GAME SKILL PLAYER PR TD
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 15

ADD_CURRENT_GAME_TO_SEASON_DEFENDER_SACKS:							                                                    ; ADD CURRENT GAME TO SEASON DEFENDER SACKS()
	LDY #$00						                                                    ; SET STAT INDEX = SEASON DEFENDER SACKS
	JSR GET_SEASON_STAT_UPPER_7_BITS					                                                    ; GET PLAYER STAT UPPER 7 BITS (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #DEF_SACKS_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = IN-GAME DEFENDER SACKS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]						            ; = SEASON DEFNDER SACKS + IN GAME DEFENDER SACKS
    CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 127

ADD_CURRENT_GAME_TO_SEASON_DEFENDER_INTS:							                                                    ; ADD CURRENT GAME TO SEASON DEFENDER INTS()
	JSR GET_SEASON_DEFENDER_INTS					                                    ; GET DEFENDER INTS()
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #DEF_INTS_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = IN-GAME DEFENDER INTS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]						            ; = SEASON DEFNDER INTS + IN GAME DEFENDER INTS
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 31

ADD_CURRENT_GAME_TO_SEASON_DEFENDER_INT_YARDS:							                                                    ; ADD CURRENT GAME TO SEASON DEFENDER INT YARDS()
	LDY #$02						                                                    ; SET STAT INDEX = DEFENDER SEASON BASE INT YARDS
	LDA (season_sram_addr),Y
	STA season_stat_save
	DEY							                                                        ; SET STAT INDEX = IN-GAME DEFENDER INT YARDS MULTIPLIER
	LDA (season_sram_addr),Y
	AND #$01
	STA season_stat_save + 1
	LDY #DEF_INT_YDS_IN_GAME_STAT_INDEX						                            ; SET STAT INDEX =   DEFENDER IN GAME INT YARDS
	JSR GET_TWO_BYTE_STAT					                                            ; GET STAT AND MULTIPLIER ONE BYTE AWAY(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	STA multiplier_save						                                                        ; = SEASON DEFNDER INT YARDS  + IN GAME DEFENDER INT YARDS
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]	
	CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] 511

ADD_CURRENT_GAME_TO_SEASON_DEFENDER_INT_TOUCHDOWNS:							            ; ADD CURRENT GAME TO SEASON DEFENDER INT TDS ()
	LDY #$01						                                                    ; SET STAT INDEX = DEFENDER SEASON INT TDS
	LDA (season_sram_addr),Y
	AND #$0F
	LSR
	STA season_stat_save
	LDA #$00
	STA season_stat_save + 1
	LDY #DEF_INT_TDS_IN_GAME_STAT_INDEX						                            ; SET STAT INDEX = DEFENDER IN-GAME INT TDS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_SINGLE_BYTE[]					                ; = SEASON DEFNDER INT TDS + IN GAME DEFENDER INT TDS 
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_LIMIT[limit] 7

ADD_CURRENT_GAME_TO_SEASON_KICKER_XP_ATT:							                    ; ADD CURRENT GAME TO SEASON KICKER XP ATTS ()
	LDY #$00						                                                    ; SET STAT INDEX = KICKER SEASON XP ATTS
	JSR GET_SEASON_STAT_SINGLE_BYTE					                                    ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #XP_ATT_IN_GAME_STAT_INDEX						                                ; SET STAT INDEX = KICKER IN-GAME XP ATTS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]									; = SEASON XP ATT + IN GAME XP ATT
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[]

ADD_CURRENT_GAME_TO_SEASON_KICKER_XP_MADE:							                     ; ADD CURRENT GAME TO SEASON KICKER XPS MADE ()
	LDY #$01						                                                    ; SET STAT INDEX = KICKER SEASON XP MADE
	JSR GET_SEASON_STAT_SINGLE_BYTE					                                    ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #XP_MADE_IN_GAME_STAT_INDEX						                                ; SET STAT INDEX = KICKER IN-GAME XP MADE
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]					                ;  = SEASON XP MADE  + IN GAME XP MADE
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[]

ADD_CURRENT_GAME_TO_SEASON_KICKER_FG_ATT:							                                                    ; ADD CURRENT GAME TO SEASON KICKER FG ATT ()
	LDY #$02						                                                    ; SET STAT INDEX = KICKER SEASON FG ATT
	JSR GET_SEASON_STAT_SINGLE_BYTE					                                                    ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #FG_ATT_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = KICKER IN-GAME FG ATT
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]						                                                        ; = SEASON FG ATT   + IN GAME FG ATT
    CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[]

ADD_CURRENT_GAME_TO_SEASON_KICKER_FG_MADE:							                    ; ADD CURRENT GAME TO SEASON KICKER FG MADE()
	LDY #$03						                                                    ; SET STAT INDEX = KICKER SEASON FG MADE
	JSR GET_SEASON_STAT_SINGLE_BYTE					                                    ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #FG_MADE_IN_GAME_STAT_INDEX						                                ;  SET STAT INDEX = KICKER IN-GAME FG MADE
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]						                                                        ; = SEASON FG MADE  + IN GAME FG MADE 
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[]

ADD_CURRENT_GAME_TO_SEASON_PUNTER_PUNTS:							                                                    ; ADD CURRENT GAME TO SEASON PUNTER PUNTS()
	LDY #$00						                                                    ; SET STAT INDEX = PUNTER SEASON PUNTS
	JSR GET_SEASON_STAT_SINGLE_BYTE					                                                    ; GET PLAYER STAT NO MULTIPLIER (Y= STAT INDEX)
	COPY_16_ZP_TO_ZP[source_dest] season_value, season_stat_save
	LDY #PUNTS_IN_GAME_STAT_INDEX						                                                    ; SET STAT INDEX = PUNTER IN-GAME PUNTS
	JSR GET_SINGLE_BYTE_STAT					                                        ; LOAD SINGLE BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]					                                                        ; = SEASON PUNTS  + IN GAME PUNTS
	CHECK_IF_ONE_BYTE_SEASON_VALUE_OVER_255[]

ADD_CURRENT_GAME_TO_SEASON_PUNTER_YARDS:							                    ; ADD CURRENT GAME TO SEASON PUNTER PUNTING YARDAGE()
	LDY #$01						                                                    ; SET STAT INDEX = PUNTER SEASON PUNTING YARDS
	LDA (season_sram_addr),Y
	STA season_stat_save
	INY							                                                        ; SET STAT INDEX = PUNTER SEASON PUNTING YARDS MULTIPLIER
	LDA (season_sram_addr),Y
	AND #$0F
	STA season_stat_save + 1
	LDY #PUNT_YDS_IN_GAME_STAT_INDEX						                             ; SET STAT INDEX = PUNTER IN-GAME PUNTING YARDS
	JSR GET_TWO_BYTE_STAT					                                             ; LOAD TWO BYTE STAT(Y= STAT INDEX, $40,41 = ADDRESS) RET IN ($44,45)
	STA multiplier_save
	ADD_CURRENT_GAME_STAT_VALUE_TO_SEASON_TWO_BYTE[]						                                                        ; = SEASON PUNTER YARDAGE + IN GAME PUNT YARDAGE
	CHECK_IF_TWO_BYTE_SEASON_VALUE_OVER_LIMIT_WITH_MULTIPLIER[limit] 4095

_F}_ADD_GAME_STATS_TO_SEASON_FUNCTIONS	

_F{_ADD_PLAY_STATS_TO_GAME_STATS_IF_VALID												; DONE

UPDATE_IN_GAME_STATS_WITH_ERROR_CHECK:                      			                ; UPDATE IN GAME PLAYER STATS WITH ERROR CHECKING(A= PLAYER ID, 6F= P1/P2, X=STAT TO UPDATE COMMAND INDEX)

roster_id	= LOCAL_5

@check_for_valid_team_index
	STA roster_id						                                                ; SAVE PLAYER ID
	LDA TEAM_ON_OFFENSE						                                            ; DOES CURRENT TEAM INDEX = P1 OR P2
	CMP #$02						                                                    ;
	BCS @not_valid_exit						                                            ; NO-> CHECK FOR UPDATE PLAYER STATS EXIT
	
@check_for_qb_roster_id
	LDA roster_id						                                                ; LOAD PLAYER ID
	LDY #$00						                                                    ; SET TEAM ID INDEX  = QB 1
	CMP #RB1_ROSTER_ID					                                                 ; IS PLAYER ID = QB
	BCC @check_if_stat_valid_for_position						                        ; YES-> DO STAT COMMAND IF VALID FOR POSITION (A, = PLAYER ID, Y=POSITION INDEX, X = COMMAND)

@check_for_rb_wr_te_roster_id:
	INY							                                                        ; SET TEAM ID INDEX  = RB,WR,TE INDEX
	INY							                                                        ;
	CMP #C_ROSTER_ID						                                            ; IS PLAYER ID = RB,WR,TE
	BCC @check_if_stat_valid_for_position						                        ; YES-> DO STAT COMMAND IF VALID FOR POSITION (A, = PLAYER ID, Y=POSITION INDEX, X = COMMAND)

@check_for_ol_roster_id:	
	CMP #RE_ROSTER_ID						                                            ; IS PLAYER ID < FIRST DEFENDER
	BCC @not_valid_exit						                                            ; YES-> CHECK FOR UPDATE PLAYER STATS EXIT
	
@check_for_defender_roster_id:	
	INY							                                                        ;
	INY							                                                        ;
	CMP #KICKER_ROSTER_ID						                                        ; IS PLAYER ID < KICKER
	BCC @check_if_stat_valid_for_position						                        ; YES-> BRANCH TO DO STAT COMMAND IF VALID FOR POSITION (A, = PLAYER ID, Y=POSITION INDEX, X = COMMAND)
	
@check_for_kicker_roster_id:	
	INY							                                                        ;					 
	INY							                                                        ;
	CMP #KICKER_ROSTER_ID						                                        ; IS PLAYER ID = KICKER
	BEQ @check_if_stat_valid_for_position						                        ; YES-> BRANCH TO DO STAT COMMAND IF VALID FOR POSITION (A, = PLAYER ID, Y=POSITION INDEX, X = COMMAND)

@check_for_punter_roster_id:
	INY							                                                        ;
	INY							                                                        ;
	CMP #PUNTER_ROSTER_ID						                                        ; IS PLAYER ID = PUNTER
	BEQ @check_if_stat_valid_for_position						                        ; YES-> DO STAT COMMAND IF VALID FOR POSITION (A, = PLAYER ID, Y=POSITION INDEX, X = COMMAND)
	
@else_not_valid:	
	JMP @not_valid_exit						                                            ; NO-> YES-> CHECK FOR UPDATE PLAYER STATS EXIT

@check_if_stat_valid_for_position:							                            ; DO STAT COMMAND IF VALID FOR POSITION (A, = PLAYER ID, Y=POSITION INDEX, X = COMMAND)
	TXA							                                                        ; CHECK POSITION STAT INDEX VS VALID STAT INDEXES BY POSITION TABLE
	CMP IN_GAME_VALID_STAT_INDEX_TABLE,Y					                            ;
	BCC @not_valid_exit					                                                    ; TOO LOW =  NOT VALID->CHECK FOR UPDATE PLAYER STATS EXIT
	CMP IN_GAME_VALID_STAT_INDEX_TABLE+1,Y					                            ;
	BCS @not_valid_exit						                                                    ; TOO HIGH = NOT VALID->CHECK FOR UPDATE PLAYER STATS EXIT
	
	LDA roster_id						                                                ; LOAD PLAYER ID
	JMP ADD_PLAY_STATS_TO_GAME_STATS					                                                    ; JUMp->GET TEAM SRAM ADDRESS AND ADD CURRENT PLAY STATS TO CURRENT GAME STATS (X= STAT INDEX)

@not_valid_exit:							                                              ; CHECK FOR UPDATE PLAYER STATS EXIT
	RTS							                                                        ; RETURN

_F}_ADD_PLAY_STATS_TO_GAME_STATS_IF_VALID			
	
_F{_DO_CRASH_HANDLER																	; DONE
	
DO_CRASH_HANDLER:							                                                ; PROGRAM CRASH
	LDA #$29						                                                    ;
	STA NES_PPU_CTRL						                                            ;
	LDA #$06						                                                    ;
	STA PROGRAM_CRASH_CODE						                                        ; SET PROGRAM CRASH CODE
	LDA #SET_BANK_TO_8000_MMC3						                                    ; SET BANK SELECT = $8000 BANK
	STA BANK_SELECT_MMC3						                                        ;
	LDA #CRASH_HANDLER_BANK 						                                    ; SET BANK DATA = BANK 27
	STA BANK_DATA_MMC3						                                            ;
	JMP CRASH_HANDLER_START					                                                    ; JUMP->CRASH HANDLER()
	
_F}_DO_CRASH_HANDLER			

_F{_ADD_PLAY_STATS_TO_GAME_STATS														; DONE

IN_GAME_VALID_STAT_INDEX_TABLE:							                                ; VALID STAT INDEXES BY POSITION TABLE 
																						; VALID STAT START, STAT OUT OF BOUNDS
	.DB UPDATE_QB_PASS_ATT_IN_GAME_INDEX, UPDATE_REC_IN_GAME_INDEX 						; VALID QB STAT COMMANDS
	.DB UPDATE_REC_IN_GAME_INDEX, UPDATE_DEF_SACKS_IN_GAME_INDEX	 				    ; VALID RB,WR,TE STAT COMMAND ID
	.DB UPDATE_DEF_SACKS_IN_GAME_INDEX	, UPDATE_XP_ATT_IN_GAME_INDEX 				    ; VALID DEFENDER STAT COMMAND ID
	.DB UPDATE_XP_ATT_IN_GAME_INDEX, UPDATE_PUNTS_IN_GAME_INDEX 				        ; VALID KICK STAT COMMAND ID
	.DB UPDATE_PUNTS_IN_GAME_INDEX, UPDATE_PUNT_YDS_IN_GAME_INDEX+1				        ; VALID PUNTER STAT COMMAND ID

	

ADD_PLAY_STATS_TO_GAME_STATS:							                                ; GET TEAM SRAM ADDRESS AND ADD CURRENT PLAY STATS TO CURRENT GAME STATS (X= STAT INDEX)

add_stats_function_addr		= LOCAL_1
game_stats_addr				= LOCAL_3
roster_id					= LOCAL_5

	STA roster_id					                                                    ; SAVE PLAYER ID
	LDA TEAM_ON_OFFENSE						                                            ;			
	ASL							                                                        ;
	TAY							                                                        ;
	LDA P1_AND_P2_IN_GAME_STATS_STARTING_ADDR_TABLE,Y					                ; GET AND SAVE IN GAME TEAM SRAM STAT ADDRESS FROM IN GAME P1/P2 SRAM STAT ADDRESSES
	STA game_stats_addr						                                            ;
	LDA P1_AND_P2_IN_GAME_STATS_STARTING_ADDR_TABLE+1,Y					                ;
	STA game_stats_addr + 1 						                                    ;
	LDY roster_id						                                                ;
	JSR GET_PLAYER_IN_GAME_STAT_SRAM_ADDRESS					                        ; ADD PLAYER OFFSET TO IN GAME SRAM STAT ADDRESS(Y=PLAYER ID, $42,43= SRAM ADDRESS)
	TXA							                                                        ; SHIFT STAT INDEX TO GET STAT COMMAND ADDR
	ASL							                                                        ;
	TAY							                                                        ;
	LDA ADD_CURRENT_PLAY_STATS_TO_CURRENT_GAME_STATS_FUNCTION_TABLE,Y					; LOAD COMMAND ADDR FROM  ADD CURRENT PLAY STATS TO CURRENT GAME STATS POINTER TABLE
	STA add_stats_function_addr						                                    ;
	LDA ADD_CURRENT_PLAY_STATS_TO_CURRENT_GAME_STATS_FUNCTION_TABLE+1,Y					;
	STA add_stats_function_addr+1						                                ;
	MMC3_SRAM_WRITE_ENABLE
	JMP (add_stats_function_addr)						                                ; JUMP->(COMMAND ADDRESS)


								                                                        ; CURRENT PLAY TO CURRENT GAME FUNCTIONS
								                                                        ; Y= INDEX TO STAT WITHIN TYPE

INCREMENT_CURRENT_GAME_QB_PASS_ATTEMPTS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME QB PASS ATTEMPTS()
	LDY #QB_PASS_ATTEMPTS_IN_GAME_STAT_INDEX		
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_QB_PASS_COMPLETIONS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME QB PASS COMPLETIONS()
	LDY #QB_PASS_COMPLETIONS_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_QB_PASS_TOUCHDOWNS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME QB PASS TDS()
	LDY #QB_PASS_TD_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_QB_PASS_INTERCEPTIONS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME QB PASS INTS()
	LDY #QB_PASS_INT_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

ADD_YARDS_TO_CURRENT_GAME_QB_PASS_YARDS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME QB PASS YARDS()

pass_yards = LOCAL_7

	LDY #QB_PASS_YDS_IN_GAME_STAT_INDEX						                                                    ;
	LDA pass_yards + 1						                                                        							; IA PASSING YARDAGE NEGATIVE? 
	BPL @exit						                                                    							; NO->ADD PASSING YARDS
	RTS							                                                        							; RETURN

@exit:							                                                        ; ADD PASSING YARDS
	JMP ADD_YARDS_TO_CURRENT_GAME_YARDS					                                                    ; JUMP-> ADD YARDS TO CURRENT YARDS ($40,$41 = ADDR, $45,$44 = YARDS)

INCREMENT_CURRENT_GAME_QB_RUSH_ATT:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME QB RUSH ATT()
	LDY #QB_RUSH_ATTEMPTS_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

ADD_YARDS_TO_CURRENT_GAME_QB_RUSH_YARDS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME QB RUSH YARDS()
	LDY #QB_RUSH_YDS_IN_GAME_STAT_INDEX
	JMP ADD_YARDS_TO_CURRENT_GAME_YARDS					                                                    ; JUMP-> ADD YARDS TO CURRENT YARDS ($40,$41 = ADDR, $45,$44 = YARDS)

INCREMENT_CURRENT_GAME_QB_RUSH_TOUCHDOWNS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME QB RUSH TDS()
	LDY #QB_RUSH_TD_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)


ADD_YARDS_TO_CURRENT_GAME_SKILL_PLAYER_RUSH_YARDS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER RUSH YARDS()
	LDY #SKILL_RUN_YDS_IN_GAME_STAT_INDEX
	JMP ADD_YARDS_TO_CURRENT_GAME_YARDS					                                                    ; JUMP-> ADD YARDS TO CURRENT YARDS ($40,$41 = ADDR, $45,$44 = YARDS)

INCREMENT_CURRENT_GAME_SKILL_PLAYER_RUSH_ATT:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER RUSH ATT()
	LDY #SKILL_RUN_ATT_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_SKILL_PLAYER_RUSH_TOUCHDOWNS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER RUSH TD()
	LDY #SKILL_RUN_TD_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_SKILL_PLAYER_RECEPTIONS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER REC ()
	LDY #SKILL_REC_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

ADD_YARDS_TO_CURRENT_GAME_SKILL_PLAYER_REC_YARDS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER REC YARDS()

rec_yards = LOCAL_7

	LDY #SKILL_REC_YDS_IN_GAME_STAT_INDEX						                                                    ;
	LDA rec_yards + 1						                                                        ; IS YARDAGE NEGATIVE? 
	BPL @exit						                                                    ; NO->ADD RECEIVING YARDAGE
	RTS							                                                        ; YES->RETURN
@exit:							                                                        ; ADD RECEIVING YARDAGE
	JMP ADD_YARDS_TO_CURRENT_GAME_YARDS					                                                    ; JUMP-> ADD YARDS TO CURRENT YARDS ($40,$41 = ADDR, $45,$44 = YARDS)

INCREMENT_CURRENT_GAME_SKILL_PLAYER_REC_TOUCHDOWNS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER REC TDS()
	LDY #SKILL_REC_TD_IN_GAME_STAT_INDEX	
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_SKILL_PLAYER_KR_aTT:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER KR ATT()
	LDY #SKILL_KR_ATT_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

ADD_YARDS_TO_CURRENT_GAME_SKILL_PLAYER_KR_YARDS:							            ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER KR YARDS()
	LDY #SKILL_KR_YDS_IN_GAME_STAT_INDEX
	JMP ADD_YARDS_TO_CURRENT_GAME_YARDS					                                                    ; JUMP-> ADD YARDS TO CURRENT YARDS (Y= STAT INDEX, $40,$41 = ADDR, $45,$44 = YARDS)

INCREMENT_CURRENT_GAME_SKILL_PLAYER_KR_TOUCHDOWNS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER KR TDS()
	LDY #SKILL_KR_TD_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_SKILL_PLAYER_PR_ATT:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER PR ATT()
	LDY #SKILL_PR_ATT_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

ADD_YARDS_TO_CURRENT_GAME_SKILL_PLAYER_PR_YARDS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER PR YARDS()
	LDY #SKILL_PR_YDS_IN_GAME_STAT_INDEX	
	JMP ADD_YARDS_TO_CURRENT_GAME_YARDS					                                                    ; JUMP-> ADD YARDS TO CURRENT YARDS (Y= STAT INDEX, $40,$41 = ADDR, $45,$44 = YARDS)

INCREMENT_CURRENT_GAME_SKILL_PLAYER_PR_TOUCHDOWNS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME SKILL PLAYER PR TDS()
	LDY #SKILL_PR_TD_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_DEFENDER_SACKS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME DEFENDER SACKS()
	LDY #DEF_SACKS_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_DEFENDER_INTS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME DEFENDER INTS()
	LDY #DEF_INTS_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_DEFENDER_INT_YARDS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME DEFENDER INT YARDS()
	LDY #DEF_INT_YDS_IN_GAME_STAT_INDEX
	JMP ADD_YARDS_TO_CURRENT_GAME_YARDS					                                                    ; JUMP-> ADD YARDS TO CURRENT YARDS (Y= STAT INDEX, $40,$41 = ADDR, $45,$44 = YARDS)

INCREMENT_CURRENT_GAME_DEFENDER_INT_TOUCHDOWNS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME DEFENDER INT TDS()
	LDY #DEF_INT_TDS_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_KICKER_XP_ATT:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME KICKER XP ATTS()
	LDY #XP_ATT_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_KICKER_XP_MADE:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME KICKER XP MADE()
	LDY #XP_MADE_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_KICKER_FG_ATT:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME KICKER FG ATTS()
	LDY #FG_ATT_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_KICKER_FG_MADE:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME KICKER FG MADE()
	LDY #FG_MADE_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_PUNTER_PUNTS:							                                                    ; ADD CURRENT PLAY TO CURRENT GAME PUNTER PUNTS()
	LDY #PUNTS_IN_GAME_STAT_INDEX
	JMP INCREMENT_CURRENT_GAME_STAT_BY_ONE					                                                    ; JUMP->ADD ONE TO CURRENT STAT(Y= STAT INDEX, $40,$41 = ADDR)

INCREMENT_CURRENT_GAME_PUNTER_YARDS:							                                                    ; ;ADD CURRENT PLAY TO CURRENT GAME PUNTER PUNTING YARDS)
	LDY #PUNT_YDS_IN_GAME_STAT_INDEX
	JMP ADD_YARDS_TO_CURRENT_GAME_YARDS					                                                    ; JUMP-> ADD YARDS TO CURRENT YARDS (Y= STAT INDEX, $40,$41 = ADDR, $45,$44 = YARDS)

ADD_YARDS_TO_CURRENT_GAME_YARDS:							                             ; ADD YARDS TO CURRENT YARDS ($40,$41 = ADDR, $45,$44 = YARDS)

sram_addr 	= LOCAL_3
yards 		= LOCAL_7

	LDA (sram_addr),Y						                                            ; = YARDS + CURRENT YARDS
	CLC							                                                        ;
	ADC yards 						                                                        ;
	STA (sram_addr),Y						                                                    ;
	INY							                                                        ;
	LDA (sram_addr),Y						                                                    ;
	ADC yards +1						                                                        ;
	STA (sram_addr),Y						                                                    ;
	RTS							                                                        ; RETURN

INCREMENT_CURRENT_GAME_STAT_BY_ONE:							                            ; ADD ONE TO CURRENT STAT($40,$41 = ADDR)

sram_addr 	= LOCAL_3

	LDA (sram_addr),Y						                                            ; VALUE AT ADDR++
	CLC							                                                        ;
	ADC #$01						                                                    ;
	BCS @exit						                                                    ; VALUE = 255? YES->EXIT
	STA (sram_addr),Y						                                            ;
@exit:							                                                        ; EXIT
	RTS							                                                        ; RETURN

_F}_ADD_PLAY_STATS_TO_GAME_STATS	

_F{_ADD_ALL_GAME_STATS_TO_SEASON_STATS													; DONE

ADD_ALL_GAME_STATS_TO_SEASON_STATS:							                            ; ADD ALL CURRENT GAME STATS TO SEASON STATS()

sram_addr               = LOCAL_5
current_stat_value      = LOCAL_7
CURRENT_ROSTER_ID		= SEGMENT_VAR_8E
multiplier_save			= SEGMENT_VAR_8F
	LDA #$00						                                                    ; SET CURRENT PLAYER = QB1 
	STA CURRENT_ROSTER_ID						                                        ; 


ADD_ALL_QB_GAME_STATS_TO_QB_SEASON_STATS:
	
_WHILE ALWAYS							                                                ; ADD QB CURRENT GAME STATS TO SEASON STATS

@save_pass_attempts:	
	LDX #QB_PASS_ATTEMPTS_SEASON_STAT_INDEX							                    ; SET STAT INDEX = QB PASS ATT
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$00						                                                    ; SAVE BASE SEASON QB PASS ATT
	LDA current_stat_value
	STA (sram_addr),Y
	INY							                                                        ; SRAM ADDR+=2
	INY
	LDA (sram_addr),Y						                                            ; SAVE SEASON QB PASS ATT MULTIPLIER
	AND #$FC
	ORA current_stat_value + 1
	STA (sram_addr),Y							

@save_pass_completions:	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT QB
	LDX #QB_PASS_COMPLETIONS_SEASON_STAT_INDEX						                    ; SET STAT INDEX = QB PASS COMP
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$01						                                                    ; SAVE BASE SEASON QB PASS COMP
	LDA current_stat_value						                                        ;
	STA (sram_addr),Y
	INY							                                                        ; SRAM ADDR+=2
	INY	
	LDA (sram_addr),Y						                                            ; SAVE SEASON QB PASS COMP MULTIPLIER
	AND #$FC
	ORA current_stat_value + 1
	STA (sram_addr),Y

@save_pass_touchdowns:		
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT QB
	LDX #QB_PASS_TD_SEASON_STAT_INDEX						                            ; SET STAT INDEX = QB PASS TD
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$02						                                                    ; SAVE SEASON QB PASS TDS
	ASL current_stat_value
	ASL current_stat_value
	LDA (sram_addr),Y
	AND #$03
	ORA current_stat_value
	STA (sram_addr),Y

@save_pass_interceptions:	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT QB
	LDX #QB_PASS_INT_SEASON_STAT_INDEX						                            ; SET STAT INDEX = QB PASS INTS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$03						                                                    ; SAVE SEASON QB PASS INTS
	ASL current_stat_value
	ASL current_stat_value
	LDA (sram_addr),Y
	AND #$03
	ORA current_stat_value
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT QB
	
	LDX #QB_PASS_YDS_SEASON_STAT_INDEX						                            ; SET STAT INDEX = QB PASS YARDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$04						                                                    ; SAVE BASE SEASON QB PASS YARDS
	ASL current_stat_value + 1
	ASL current_stat_value + 1
	ASL current_stat_value + 1
	LDA current_stat_value
	STA (sram_addr),Y
	INY							                                                        ; SRAM ADDR+=3
	INY							                                                        ;
	INY							                                                        ;
	LDA (sram_addr),Y						                                            ; SAVE SEASON QB PASS YARDS MULTIPLIER
	AND #$07						                                                    ;
	ORA current_stat_value + 1						                                    ;
	STA (sram_addr),Y						                                            ;

@save_qb_rush_att:	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT QB
	LDX #QB_RUSH_ATTEMPTS_SEASON_STAT_INDEX						                        ; SET STAT INDEX = QB RUSH ATT
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDA current_stat_value						                                        ; SAVE SEASON QB RUSH YARDS
	LDY #$05
	STA (sram_addr),Y

@save_qb_rush_yards:	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT QB
	LDX #QB_RUSH_YDS_SEASON_STAT_INDEX						                            ; SET STAT INDEX = QB RUSH YARDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$06						                                                    ; SAVE BASE SEASON QB RUSH YARDS
	LDA current_stat_value						                                        ;
	STA (sram_addr),Y						                                            ;
	INY							                                                        ; SRAM ADDR+++
	LDA (sram_addr),Y						                                            ; SAVE SEASON QB RUSH YARD MULTIPLIER
	AND #$F8						                                                    ;
	ORA current_stat_value + 1						                                    ;
	STA (sram_addr),Y						                                            ;
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT QB

@save_qb_rush_tds:	
	LDX #QB_RUSH_TD_SEASON_STAT_INDEX						                            ; SET STAT INDEX = QB RUSH TD
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$08						                                                    ; SAVE SEASON QB RUSH TD
	ASL current_stat_value
	ASL current_stat_value
	LDA (sram_addr),Y
	AND #$03
	ORA current_stat_value
	STA (sram_addr),Y
	INC CURRENT_ROSTER_ID						                                        ; CURRENT PLAYER++
	LDA CURRENT_ROSTER_ID						                                        ;
	CMP #$02						                                                    ; IS CURRENT PLAYER = RB1?
	BCS ADD_ALL_SKILL_GAME_STATS_TO_SKILL_SEASON_STATS						            ; YES->ADD SKILL PLAYER CURRENT GAME STATS TO SEASON STATS

_END_WHILE					                                                            ; NO-> ADD QB CURRENT GAME STATS TO SEASON STATS

ADD_ALL_SKILL_GAME_STATS_TO_SKILL_SEASON_STATS:							                ; ADD SKILL PLAYER CURRENT GAME STATS TO SEASON STATS
	
_WHILE ALWAYS	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	
	LDX #SKILL_REC_SEASON_STAT_INDEX						                            ; SET STAT TO GET = RECEPTIONS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDA current_stat_value						                                        ; SAVE SEASON RECEPTIONS
	LDY #$00
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID
	
	LDX #SKILL_REC_YDS_SEASON_STAT_INDEX							                    ; SET STAT TO GET = REC YARDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$01						                                                    ; SAVE BASE SEASON REC YARDS
	LDA current_stat_value
	STA (sram_addr),Y
	LDY #$08						                                                    ; SAVE SEASON REC YARDS MULTIPLIER
	LDA (sram_addr),Y
	AND #$F0
	ORA current_stat_value + 1
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	
	LDX #SKILL_REC_TD_SEASON_STAT_INDEX						                            ; SET STAT TO GET = REC TDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$02						                                                    ; SAVE SEASON REC TDS 
	ASL current_stat_value
	ASL current_stat_value
	LDA (sram_addr),Y
	AND #$03
	ORA current_stat_value
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	
	LDX #SKILL_KR_ATT_SEASON_STAT_INDEX						                            ; SET STAT TO GET = KR ATT
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	ASL current_stat_value						                                        ; SAVE SEASON KR ATT
	LDY #$03
	LDA (sram_addr),Y
	AND #$01
	ORA current_stat_value
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	
	LDX #SKILL_KR_YDS_SEASON_STAT_INDEX						                            ; SET STAT TO GET = KR YARDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$04						                                                    ; SAVE SEASON BASE KR YARDS
	LDA current_stat_value
	STA (sram_addr),Y
	INY							                                                        ; SAVE SEASON KR YARD MULTIPLIER
	LDA (sram_addr),Y
	AND #$F8
	ORA current_stat_value + 1
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	
	LDX #SKILL_KR_TDS_SEASON_STAT_INDEX						                            ; SET STAT TO GET = KR TDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$05						                                                    ; SAVE SEASON KR TDS
	ASL current_stat_value
	ASL current_stat_value
	ASL current_stat_value
	LDA (sram_addr),Y
	AND #$07
	ORA current_stat_value
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	
	LDX #SKILL_PR_ATT_SEASON_STAT_INDEX						                            ; SET STAT TO GET = PR ATT
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$06						                                                    ; SAVE SEASON PR ATT
	ASL current_stat_value
	ASL current_stat_value
	LDA (sram_addr),Y
	AND #$03
	ORA current_stat_value
	STA (sram_addr),Y
	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	LDX #SKILL_PR_YDS_SEASON_STAT_INDEX						                            ; SET STAT TO GET = PR YARDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$07						                                                    ; SAVE SEASON BASE PR YARDS
	LDA current_stat_value
	STA (sram_addr),Y
	LDY #$02						                                                    ; SAVE SEASON PR YARD MULTIPLIER
	LDA (sram_addr),Y
	AND #$FC
	ORA current_stat_value + 1
	STA (sram_addr),Y
	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	LDX #SKILL_PR_TDS_SEASON_STAT_INDEX						                            ; SET STAT TO GET = PR TDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	ASL current_stat_value						                                        ; SAVE SEASON PR TDS
	ASL current_stat_value
	ASL current_stat_value
	ASL current_stat_value
	LDY #$08
	LDA (sram_addr),Y
	AND #$0F
	ORA current_stat_value
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	LDX #$11						                                                    ; SET STAT TO GET = RUSH ATT
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDA current_stat_value						                                        ; SAVE SEASON RUSH ATT
	LDY #$09
	STA (sram_addr),Y
	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	LDX #SKILL_RUN_YDS_SEASON_STAT_INDEX						                        ; SET STAT TO GET = RUSH YARDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDA current_stat_value						                                        ; SAVE SEASON BASE RUSH YARDS ATT
	LDY #$0A
	STA (sram_addr),Y
	LDA current_stat_value+1
	AND #$03
	STA multiplier_save
	LDY #$06
	LDA (sram_addr),Y
	AND #$FC
	ORA multiplier_save
	STA (sram_addr),Y
	LSR current_stat_value+1
	LSR current_stat_value+1
	LDY #$0B
	LDA (sram_addr),Y
	AND #$FC
	ORA current_stat_value+1
	STA (sram_addr),Y
	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD CURRENT SKILL PLAYER
	LDX #SKILL_RUN_TD_SEASON_STAT_INDEX						                            ; SET STAT TO GET = RUSH TDSS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$0B
	ASL current_stat_value
	ASL current_stat_value
	LDA (sram_addr),Y
	AND #$03
	ORA current_stat_value
	STA (sram_addr),Y
	INC CURRENT_ROSTER_ID						                                        ; CURRENT PLAYER ID ++
	LDA CURRENT_ROSTER_ID						                                        ;
	CMP #$0C						                                                    ; IS CURRENT PLAYER = CENTER
	BEQ ADD_ALL_DEFENDER_GAME_STATS_TO_DEFENDER_SEASON_STATS						    ; YES-> SET CURRENT PLAYER TO FIRST DEFENDER

_END_WHILE						                                                        ; NO->

ADD_ALL_DEFENDER_GAME_STATS_TO_DEFENDER_SEASON_STATS:							        ; SET CURRENT PLAYER TO FIRST DEFENDER
	LDA #$11						                                                    ; SET CURRENT PLAYER = RIGHT DEFENSIVE END	
	STA CURRENT_ROSTER_ID						                                        ;

_WHILE ALWAYS								                                            ; ADD CURRENT GAME DEFENDER STATS TO SEASON DEFENDER STATS


@save_sacks:	
	LDX #DEF_SACKS_SEASON_STAT_INDEX						                            ; SET SEASON STAT INDEX = DEFENDER SACKS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	ASL current_stat_value						                                        ; SAVE STATS
	LDY #$00						                                                    ;
	LDA (sram_addr),Y						                                            ;
	AND #$01						                                                    ;
	ORA current_stat_value						                                        ;
	STA (sram_addr),Y						                                            ;
	
@save_interceptions:	
	LDA CURRENT_ROSTER_ID						                                        ; ; LOAD PLAYER ID
	LDX #DEF_INTS_SEASON_STAT_INDEX						                                ; SET SEASON STAT INDEX = INT'S 
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDA current_stat_value						                                        ; SAVE INT BASE VALUE
	STA multiplier_save
	ASL current_stat_value
	ASL current_stat_value
	ASL current_stat_value
	ASL current_stat_value
	LDY #$01
	LDA (sram_addr),Y
	AND #$0F
	ORA current_stat_value
	STA (sram_addr),Y						                                            ;
	LDA multiplier_save						                                                        ; SAVE INT MULTIPLIER
	LSR multiplier_save
	LSR multiplier_save
	LSR multiplier_save
	LSR multiplier_save
	DEY
	LDA (sram_addr),Y
	AND #$FE
	ORA multiplier_save
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD PLAYER ID
	LDX #DEF_INT_YDS_SEASON_STAT_INDEX						                            ; SET STAT INDEX = INT YARDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$02						                                                    ; SAVE INT YARDS
	LDA current_stat_value
	STA (sram_addr),Y
	DEY
	LDA (sram_addr),Y						                                            ; SAVE INT YARDS MULTIPLIER
	AND #$FE
	ORA current_stat_value+1
	STA (sram_addr),Y
	
@save_intecepions:	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD PLAYER ID
	LDX #DEF_INT_TDS_SEASON_STAT_INDEX						                            ; SET STAT INDEX = INT TDS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	ASL current_stat_value						                                        ; SAVE INT TDS 
	LDY #$01
	LDA (sram_addr),Y
	AND #$F1
	ORA current_stat_value
	STA (sram_addr),Y
	INC CURRENT_ROSTER_ID						                                        ; CURRENT PLAYER ++
	LDA CURRENT_ROSTER_ID						                                        ; IS CURRENT PLAYER = LAST DEFENDER?
	CMP #$1C						                                                    ; 
	BEQ ADD_ALL_KICK_GAME_STATS_TO_KICK_SEASON_STATS					                ; YES->CURRENT GAME KICKING STATS TO SEASON STATS

_END_WHILE						                                                        ; NO-> ADD CURRENT GAME DEFENDER STATS TO SEASON DEFENDER STATS

ADD_ALL_KICK_GAME_STATS_TO_KICK_SEASON_STATS:							                ; ADD CURRENT GAME KICKING STATS TO SEASON STATS
	
	LDX #XP_ATT_SEASON_STAT_INDEX						                                ; SET STAT INDEX = XP ATT 
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$00						                                                    ; SAVE STATS
	LDA current_stat_value
	STA (sram_addr),Y
	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD PLAYER ID
	LDX #XP_MADE_SEASON_STAT_INDEX						                                ; SET STAT INDEX = XP MADE 
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$01						                                                    ; SAVE STATS
	LDA current_stat_value
	STA (sram_addr),Y
	LDA CURRENT_ROSTER_ID						                                        ; LOAD PLAYER ID
	
	LDX #FG_ATT_SEASON_STAT_INDEX						                                ; SET STAT INDEX = FG ATT 
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$02						                                                    ; SAVE STATS
	LDA current_stat_value
	STA (sram_addr),Y
	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD PLAYER ID		
	LDX #FG_MADE_SEASON_STAT_INDEX						                                ; SET STAT INDEX = FG MADE
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX)
	MMC3_SRAM_WRITE_ENABLE
	LDY #$03						                                                    ; SAVE STATS
	LDA current_stat_value
	STA (sram_addr),Y

@set_to_punter_roster_id:								                                ; ADD CURRENT GAME PUNTING STATS TO SEASON STATS
	INC CURRENT_ROSTER_ID						                                        ; SET CURRENT PLAYER = PUNTER	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD PLAYER ID
	
@save_punts:	
	LDX #PUNTS_SEASON_STAT_INDEX						                                ; SET STAT INDEX = PUNTS
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX) STATS= $44,$45
	MMC3_SRAM_WRITE_ENABLE
	LDY #$00					
	LDA current_stat_value
	STA (sram_addr),Y						
	
@save_punt_yards:	
	LDA CURRENT_ROSTER_ID						                                        ; LOAD PLAYER ID
	LDX #PUNT_YDS_SEASON_STAT_INDEX						                                ;
	JSR ADD_STAT_TO_SEASON_STAT[stat_function_index]					                ; ADD CURRENT STATS TO SEASON STATS(X= STAT INDEX) STATS= $44,$45
	MMC3_SRAM_WRITE_ENABLE
	LDY #$01						                                                    ; SAVE STATS	
	LDA current_stat_value
	STA (sram_addr),Y
	INY
	LDA current_stat_value+1
	STA (sram_addr),Y
	RTS							                                                        ; RETURN

_F}_ADD_ALL_GAME_STATS_TO_SEASON_STATS

.PAD $C000, $FF
