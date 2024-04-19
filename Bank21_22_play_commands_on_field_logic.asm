
_F{_PLAYER_ON_FIELD_CONSTANTS

COM_VS_COM_OFF_HP_THRESH_1                          = $10                                           ; 25 HP
COM_VS_COM_OFF_HP_THRESH_2                          = $20                                           ; 50 HP

COM_VS_COM_DEF_HP_THRESH_1                          = $F0                                           ; 25 HP
COM_VS_COM_DEF_HP_THRESH_2                          = $E0                                           ; 50 HP

MAN_VS_COM_POPCORN_THRESHOLD		                = $20		                                    ; 50 HP differential	

															                              

JUMPING_DEFENDER_WHIFF_THRESHOLD		            = $0F
JUMPING_DEFENDER_INT_THRESHOLD			            = $03

                                                                                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

END_OF_ONSIDES_METER	                            = $20
ONSIDE_BASE_DISTANCE	                            = $70									        ; 14 yards
	

KICKOFF_BASE_DISTANCE	                            = $D8                           				; + 27 YARDS = RANGE FROM 27-75 YARDS
KICK_METER_MULTIPLIER	                            = $06									        ;  = 6 x (KICK METER – $20) = 0 TO 48 YARDS
KICK_METER_SUBTRACT_VAL                             = $20                           				; WE USE THIS SINCE THE FIRST PART OF THE BAR IS ONSIDES


MINIMUM_PUNT_DISTANCE			                    = $F0								            ; 15 YARDS
PUNT_METER_MULTIPLIER			                    = $04							                ; 4  * 0 TO 12 YARDS 
PUNT_METER_HALF_FULL_VALUE		                    = $30
PUNT_FINAL_Y_LOCATION			                    = $80

                                                                                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

COM_BALL_CARRIER_TURN_AMOUNT				        = $08						                    ; ~11 DEGREES	

P1_COM_BALL_CARRIER_MAX_UP_ANGLE			        = $50						                    ; 112 DEGREES = UP-RIGHT
P1_COM_BALL_CARRIER_MAX_DOWN_ANGLE			        = $B0						                    ; 247.5 DEGREES = DOWN-RIGHT
P1_COM_BALL_CARRIER_UP_TOWARDS_MID_ANGLE	        = $78						                    ; 169 DEGREES
P1_COM_BALL_CARRIER_DOWN_TOWARDS_MID_ANGLE          = $88  					                        ; 191 DEGREES		
P1_COM_BALL_CARRIER_TOWARDS_MID_ANGLE		        = $80						                    ; 180 DEGREES = lRIGHT

P2_COM_BALL_CARRIER_MAX_UP_ANGLE			        = $30						                    ; 67.5 DEGREES = UP-LEFT
P2_COM_BALL_CARRIER_MAX_DOWN_ANGLE			        = $D0						                    ; 292.5 DEGREES = DOWN-LEFT
P2_COM_BALL_CARRIER_UP_TOWARDS_MID_ANGLE	        = $08						                    ; ~11 DEGREES	
P2_COM_BALL_CARRIER_DOWN_TOWARDS_MID_ANGLE          = $F8  						                    ; ~348 DEGREES
P2_COM_BALL_CARRIER_TOWARDS_MID_ANGLE		        = $00						                    ; 0 DEGREES = LEFT


                                                                                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUNT_ADDITIONAL_DELAY_CHANCE		                = $BF

BOUNCE_OFF_PLAYER_CHANCE                            = $03                                           ; 25% beause and checks for 2 bits set out of 8
MEDIUM_COM_COM_OL_THROW_CHANCE                      = $AA                                           ; 33% dont throw                                                                  
HIGH_COM_COM_OL_THROW_CHANCE                        = $CD 	                                        ; 20% dont throw
OFF_ON_GROUND_AFTER_THROW_MED_CHANCE                = $55		                                    ;   
OFF_ON_GROUND_AFTER_THROW_HIGH_CHANCE               = $33		                                    ;	

MEDIUM_COM_COM_DEF_THROW_CHANCE                     = $AA                                           ; 66% chance player busts in vs continue grapple                                                                  
HIGH_COM_COM_DEF_THROW_CHANCE                       = $CD 		                                    ; 20% dont throw
DEF_ON_GROUND_AFTER_THROW_MED_CHANCE                = $55		                                    ;
DEF_ON_GROUND_AFTER_THROW_HIGH_CHANCE               = $33			                                ; 	
QB_DEFENDER_FUMBLE_CHANCE  			                = $0C 		                                    ; = 12/256
PASS_BLOCK_CUTSCENE_CHANCE			                = $20

                                                                                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                                                                    ;;;;;;   FRAME DELAYS  ;;;;;;;;;;;;;;;;;;;;;;;;
MINIMUM_COM_WAIT_FRAMES_KICKOFF		                = $1E			
MAXIMUM_COM_ADD_WAIT_FRAME_KICKOFF	                = $3F

MINIMUM_COM_WAIT_FRAMES_NOT_ONSIDE	                = $01			
MAXIMUM_COM_ADD_WAIT_FRAME_NOT_ONSIDE	            = $0F

MINIMUM_COM_WAIT_FRAMES_ONSIDE		                = $01			
MAXIMUM_COM_ADD_WAIT_FRAME_ONSIDE	                = $07 

MAXIMUM_COM_FRAMES_AFTER_HALF_FULL	                = $0F
MAXIMUM_COM_FRAMES_FINAL_PUNT_DELAY	                = $1F


MINIMUM_COM_WAIT_FRAMES_PUNT		                = $0A			
MAXIMUM_COM_FRAMES_INIT_PUNT_DELAY	                = $1F
MAXIMUM_COM_FRAMES_AFTER_HALF_FULL	                = $0F
MAXIMUM_COM_FRAMES_FINAL_PUNT_DELAY	                = $1F

MINIMUM_COM_WAIT_FRAMES_FG			                = $0A			                                ; 10 frames
MAXIMUM_COM_ADD_FRAME_DELAY_FG		                = $1F			                                ; bitmask of random to limit to 31 frames

PLAYER_SHAKE_HEAD_DELAY_FRAMES		                = $48		                                    ; 72 frames  ~ 1.2 seconds
PLAYER_GET_UP_DELAY_FRAMES		  	                = $20			                                ; 32 frames ~ 0.53 seconds
PLAYER_NOT_COLLIDED_COL_CHECK_DELAY	                = $05
PLAYER_MOVE_AFTER_SNAP_DELAY		                = $09			                                ; plus random amount of frames

CHOP_BLOCK_SEARCH_DELAY_FRAMES 	                    = $08			                                ; delay before looking for new player to block
START_CHOP_BLOCK_DELAY_FRAMES		                = $08			                                ; delay before looking for new player to block

HANDOFF_ICON_CHANGE_DELAY_FRAMES  	                =  $26                                          ; 38 frames


QB_START_OF_HANDOFF_DELAY_FRAMES	                =  $07                                          ; 07 frames
QB_END_OF_HANDOFF_DELAY_FRAMES		                =  $17	                                        ; 26 frames 
RUNNER_START_OF_HANDOFF_DELAY_FRAMES	            =  $0C
RUNNER_END_OF_HANDOFF_DELAY_FRAMES		            =  $10 	

START_DIVE_TACKLE_DELAY_FRAMES			            = $07
START_TO_STAND_FROM_DIVE_TACK_DELAY_FRAMES			= $1E			                                ; 30 frames
STANDING_UP_FROM_DIVE_TACK_DELAY_FRAMES				= $0A			                                ; 10 frames 
REGAIN_CONTROL_DIVE_TACK_FRAME_DELAY				= $14			                                ; 20 frames

DEFENDER_MAN_INPUT_FG_XP_DELAY_FRAMES               = $03                                           ; PLUS AND ADDIITIONAL 0-3 FRAMES
DEFENDER_MAN_INPUT_RECOVER_FG_BLOCK_DELAY_FRAMES    = $07

PASS_BLOCK_DELAY_FRAMES						        = $09                                           ; frames  until check near collision again
UPDATE_BLOCKER_DIRECTION_DELAY	  		            = $08 		                                    ; frames 	

INIT_MIRROR_BC_DELAY_FRAMES                         = $03                                           ; initial mirror delay
MIRROR_BC_DELAY_FRAMES                              = $0D                                           ; delay after player has reached ball carrier


DEFENDER_SLOW_DOWN_DELAY_FRAMES                     = $1E                                           ; 30 frames. defender slowed 0.5 sec after snap
MINIMUM_RUSHING_POWER_AFTER_SLOWDOWN                = $40                                           ; $40 = RUSHING POEWR SKILL 4 SINCE ITS IN THE UPPER HALF OF THE BYTE
RUSHING_POWER_TO_SUBTRACT_MAN_DEF_SLOWDOWN          = $30
MAX_SPEED_TO_SUBTRACT_MAN_DEF_SLOWDOW               = $F9 
                                                                                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MAX_PLAYERS_CAN_COLLIDE_WITH			            = $04

                                                                                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                                                                    ;;;;;;          LIMIT CHECKS  ;;;;;;;;;;;;;;;;;;;;;;;;
BLOCK_DIVE_NEAR_TARGET_Y_DIST_LIMIT                 = $06                                           ; 1.25 yards 
BLOCK_DIVE_NEAR_TARGET_X_DIST_LIMIT                 = $08                                           ; 1 yard  

FUMBLE_DIVE_CATCH_Z_LIMIT                           = $03                                           ; 0.375 yards
FUMBLE_DIVE_CATCH_XY_LIMIT                          = $0A                                           ; 1.25 yards 

KICK_BLOCK_LIMIT_X                                  = $16   										; 2.75 yards                         
KICK_BLOCK_LIMIT_Y                                  = $16                            				; 2.75 yards 

PASS_BLOCK_LIMIT_X                                  = $18                                           ; 3 yards
PASS_BLOCK_LIMIT_Y                                  = $18                                           ; 3 yards

PASS_JUMP_CHECK_X_LOC_UPPER_LIMIT                   = $4C                                           ; 9.5 yards
PASS_JUMP_CHECK_X_LOC_LOWER_LIMIT                   = $3C                                           ; 8.5 yards

PASS_DIVE_CHECK_X_LOC_UPPER_LIMIT                   = $3A                                           ; 7.75 yards
PASS_DIVE_CHECK_X_LOC_LOWER_LIMIT                   = $20                                           ; 4 yards

PASS_DIVE_TIME_UPPER_LIMIT                          = $18											; 24 frames
PASS_DIVE_TIME_LOWER_LIMIT                          = $16											; 22 frames
					
PASS_DIVE_LIMIT_X                                   = $06                                           ; 0.75 yards check after done with dive 
PASS_DIVE_LIMIT_Y                                   = $06                                           ; 0.75 yards

PASS_JUMP_TIP_CATCH_LIMIT_X                         = $0A                                           ; 1.25 yards check after jump for pass  
PASS_JUMP_TIP_CATCH_LIMIT_Y                         = $0A                                           ; 1.25 yards
PASS_JUMP_TIP_CATCH_LIMIT_Z                         = $0A                                           ; 1.25 yards

CLOSE_ENOUGH_JUMP_LIMIT_X                           = $0A                                           ; 1.25 yards
CLOSE_ENOUGH_JUMP_LIMIT_Y                           = $08                                           ; 1 yards

TIGHT_COVERAGE_LIMIT_X                              = $0A                                           ; 1.25 yards
TIGHT_COVERAGE_LIMIT_Y                              = $0A                                           ; 1.25 yards

LOOSE_COVERAGE_LIMIT_X                              = $10                                           ; 2 yards
LOOSE_COVERAGE_LIMIT_Y                              = $10                                           ; 2yards

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;   BALL SPEED & GRAVITY  ;;;;;;;;;;;;;;;;;;;;;;;;

ONSIDE_KICK_BALL_GRAVITY_INDEX                      = $0F

KICKOFF_BALL_GRAVITY_INDEX                          = $00
KICKOFF_BALL_SPEED                                  = $3C        

PUNT_BALL_GRAVITY					                = $02 
PUNT_BALL_SPEED							            = $33

PITCH_BALL_GRAVITY_INDEX                            = $06
PITCH_BALL_SPEED                                    = $40
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;   PASS OUTCOME   ;;;;;;;;;;;;;;;;;;;;;;;;

COVERED_INTERCEPTION_THRESHOLD		                = $33
UNCOVERED_RECEPTION_THRESHOLD		                = $4F						
COVERED_RECEPTION_THRESHOLD			                = $50
TARGET_NOT_CLOSE_INT_THRESHOLD		                = $0E



BALL_BLOCKED_ROUTINE				                = $900C							; bank 23 **
BALL_BOUNCING_ON_GROUND_ROUTINE		                = $900F 						; bank 23
			

_F}_PLAYER_ON_FIELD_CONSTANTS


.BASE $8000
						
BANK_JUMP_DO_NEXT_PLAYER_COMMAND: 
	JMP DO_NEXT_PLAYER_COMMAND                                    ; DO PLAYER COMMAND
	
BANK_JUMP_DO_MOVEMENT_COLL_LOGIC: 
	JMP RESET_CURRENT_SPEED_RP_TO_INITIAL_VALUES                   ; UPDATE SPEED/DO COLLISION LOGIC

BANK_JUMP_WR_JUMP_DIVE_CHECK_PASS: 
	JMP OFFENSE_JUMP_DIVE_CATCH_PASS_START                        ; CHECK FOR OFFENSIVE JUMP AND DIVE

BANK_JUMP_DEF_JUMP_DIVE_CHECK_PASS: 
	JMP DEFENSE_JUMP_DIVE_CATCH_PASS_START                        ; CHECK FOR DEFENSIVE JUMP AND DIVE

JUMP_CHECK_FOR_TACKLE:                                            ; *** UNEEDED could use direct
	JMP PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER               ; 

JUMP_PLAYER_NO_LONGER_COLLIDED:                                   ; *** UNEEDED could use direct
	JMP PLAYER_NO_LONGER_COLLIDED                                 ; DO PLAYER NO LONGER COLLIDED


	.DB $00
	.DB $00
	.DB $00
	.DB $00
	.DB $00
	.DB $00
	
MAN_CONTROL_PLAYER_CODE:	
	.DB $E4                                                       ; MAN PLAY CODE ADDRESS $8018
	
PAUSE_PLAYER_PLAY_CODE:	
	.DB $F4                                                       ; MAN PLAY CODE ADDRESS $8019
	.DB $00

_F{_PLAYER_COMMAND_PROCESSING                                     ; DONE


																  ; LOCAL VARIABLES
play_code_ptr_temp    = LOCAL_1                                   
PLAYER_SCRIPTS_BANK_OFFSET = OFF_PLAYER_SCRIPTS_BANK      

DO_NEXT_PLAYER_COMMAND:                 
	LOAD_CUR_PLAYER_POSITION_ID
	EOR POSSESSION_STATUS                                         ; SET BANK TO USE FOR PLAY COMMANDS
	ROL                                                           ; = OFFENSE =0, DEFENSE =1 + BANK OFFSET
	LDA #$00                                                      ;
	ADC #PLAYER_SCRIPTS_BANK_OFFSET                               ; = BANK 4(OFFENSE) OR BANK 5(DEFENSE)
	TAX                                                           ;
	JSR SWAP_A000_BANK                                            ; SWAP A000-BFFF BANK (X= BANK TO SWAP IN)  
	LDY #PLAY_CODE_ADDR                                           ; SAVE PLAYER PLAY CODE ADDRESS IN 3E,3F
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA play_code_ptr_temp                                        ; 
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA play_code_ptr_temp+1                                      ; 
	LDY #$00                                                      ; LOAD PLAYER SCRIPT DATA  FROM PLAYER PLAY CODE ADDRESS
	LDA (play_code_ptr_temp),Y                                    ;
	CMP #$C0                                                      ; IS PLAYER COMMAND SINGLE PLAYER COMMAND? 
	BCS @single_command_type                                      ; YES->SINGLE COMMAND TYPE
	
@group_command: 
	AND #$F0                                                      ; SET X = GROUP PLAY CODE TYPE
	LSR                                                           ;
	LSR                                                           ;
	LSR                                                           ;
	PHA                                                           ; SAVE INDEX INTO GROUP COMMAND TABLE
	LSR                                                           ;
	TAX                                                           ;
	LDA (play_code_ptr_temp),Y                                    ; SET $DC= FIRST COMMAND ARGUMENT
	AND #$0F                                                      ;
	STA PLAYER_COMMAND_ARG1                                       ;
	INY                                                           ; 
	LDA (play_code_ptr_temp),Y                                    ; SET $DD= SECOND COMMAND ARGUMENT
	STA PLAYER_COMMAND_ARG2                                       ;
	INY                                                           ; 
	LDA (play_code_ptr_temp),Y                                    ; SET $DE= THIRD COMMAND ARGUMENT
	STA PLAYER_COMMAND_ARG3                                       ;
	LDA MULTI_PLAYER_COMMAND_LENGTH_TABLE,X                       ; LOAD GROUP PLAY COMMAND LENGTH FROM MULTI PLAYER COMMAND LENGTH TABLE
	BMI @jump_to_group_command                                    ; IS COMMAND LENGH = PASS PLAY LENGTH? YES
	
	
	LDY #PLAY_CODE_ADDR                                           ; SET PLAYER PLAY CODE ADDRESS = CURRENT PLAY CODE ADDRESS + LAST COMMAND LEGTH
	CLC                                                           ;
	ADC play_code_ptr_temp                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$00                                                      ;
	ADC play_code_ptr_temp+1                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	
@jump_to_group_command:                                           ; GROUP COMMAND TYPE
	LDX #PLAYER_SCRIPT_COMMANDS_LOGIC_BANK_2	                       ; SET BANK = BANK 22
	JSR SWAP_A000_BANK                                            ; SWAP A000-BFFF BANK (X= BANK TO SWAP IN)
	PLA                                                           ; LOAD GROUP PLAY COMMAND TABLE INDEX
	TAX                                                           ; PUSH PLAY COMMAND ADDR FROM GROUP_PLAY_COMMAND TABLE
	JUMP_TO_ADDR_VIA_RTS[addr] GROUP_COMMAND_TABLE

@single_command_type:                                             ; SINGLE COMMAND TYPE
	SEC                                                           ; SET SINGLE COMMAND TABLE INDEX
	SBC #$C0                                                      ; subtract offset to single player commands
	TAX                                                           ;
	ASL                                                           ; 
	PHA                                                           ;
	INY                                                           ; 
	LDA (play_code_ptr_temp),Y                                    ; SET $DC= FIRST COMMAND ARGUMENT
	STA PLAYER_COMMAND_ARG1                                       ;
	INY                                                           ; 
	LDA (play_code_ptr_temp),Y                                    ; SET $DD= SECOND COMMAND ARGUMENT
	STA PLAYER_COMMAND_ARG2                                       ;
	INY                                                           ; 
	LDA (play_code_ptr_temp),Y                                    ; SET $DE= SECOND COMMAND ARGUMENT
	STA PLAYER_COMMAND_ARG3                                       ;
	LDA SINGLE_PLAYER_COMMAND_LENGTH_TABLE,X                      ; LOAD SINGLE PLAY COMMAND LENGTH FROM SINGLE PLAY COMMAND LENGTH TABLE
	LDY #PLAY_CODE_ADDR                                           ; SET PLAYER PLAY CODE ADDRESS = CURRENT PLAY CODE ADDRESS + CURRENT COMMAND LEGTH
	CLC                                                           ;
	ADC play_code_ptr_temp                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$00                                                      ;
	ADC play_code_ptr_temp+1                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDX #PLAYER_SCRIPT_COMMANDS_LOGIC_BANK_2	                       ; SET BANK = BANK 22
	JSR SWAP_A000_BANK                                            ; SWAP A000-BFFF BANK (X= BANK TO SWAP IN) 
	PLA                                                           ; LOAD SINGLE PLAYER COMMAND TABLE INDEX 
	TAX                                                           ; PUSH PLAY COMMAND ADDR FROM SINGLE_PLAYER_COMMAND TABLE 
	LDA SINGLE_COMMAND_TABLE+1,X                                  ; 
	PHA                                                           ;
	LDA SINGLE_COMMAND_TABLE,X                                    ;
	PHA                                                           ;
	RTS                                                           ; JUMP TO COMMAND


GROUP_COMMAND_TABLE:                                              ; GROUP_PLAY_COMMAND TABLE    

	.WORD MAN_COVERAGE_TIGHT_COMMAND_START-1                           ;0X MAN TO MAN            
	.WORD MAN_COVERAGE_LOOSE_COMMAND_START-1                           ;1X MAN TO MAN 
	.WORD RANDOM_COMMAND_START-1                                       ;2X RANDOM THEN JUMP
	.WORD BLOCK_COMMAND_START-1                                       ;3X BLOCK
	.WORD CHOP_BLOCK_COMMAND_START-1                                   ;4X CHOP BLOCK
	.WORD HANDOFF_COMMAND_START-1                                      ;5X HANDOFF 
	.WORD FAKE_HANDOFF_COMMAND_START-1                                 ;6X FAKE HANDOFF
	.WORD PITCH_BALL_COMMAND_START-1                                   ;7X PITCH
	.WORD PRE_SNAP_MOTION_COMMAND_START-1                              ;8X MOTION PRE SNAP 
	.WORD COM_PASS_COMMAND_START-1                                     ;9X PASS (CHANCE/REECEIVERS)
	.WORD SET_TARGET_ORDER_COMMAND-1                                   ;AX SET TARGET PRIORITY 
	.WORD SET_AND_MOVE_KICKOFF_COMMAND_START-1                          ;BX SET/MOVE KICK 

		
SINGLE_COMMAND_TABLE:                                             ; SINGLE_PLAYER_COMMAND TABLE

	.WORD QB_DROPBACK_COMMAND_START-1                                  ; CO QB DROPBACK
	.WORD COM_WAIT_TO_PASS_COMMAND_START-1                             ; C1 PASS TIMING/TAKE SACK 
	.WORD INIFITE_LOOP_COMMAND_START-1                                 ; C2 INFINITE LOOP NOT USED 
	.WORD INIFITE_LOOP_COMMAND_START-1                                 ; C3 INFINITE LOOP NOT USED
	.WORD CELEBRATE_COMMAND_START-1                                    ; C4 CELEBRATE
	.WORD CRY_COMMAND_START-1                                          ; C5 CRY
	.WORD INIFITE_LOOP_COMMAND_START-1                                 ; C6 INFINITE LOOP NOT USED
	.WORD DO_ACTION_IF_COM_COMMAND_START-1                             ; C7 COM JUMP TO POINTER
	.WORD COM_JUMP_BASED_ON_JUICE_COMMAND_START-1                      ; C8 COM JUMP TO POINTER (RANDOM)
	.WORD COVER_NEARBY_PLAYERS_COMMAND_START_UNUSED-1                  ; C9 WAIT TO COVER RECEIVER UNTIL CLOSE TO COLLISION NOT USED
	.WORD IF_COM_JUMP_COMMAND_START-1                                  ; CA COA JUMP TO
	.WORD INIFITE_LOOP_COMMAND_START-1                                 ; CB UNUSED INFINITE LOOP
	.WORD PASS_BLOCK_COMMAND_START-1                                   ; CC BLOCK
	.WORD MOVE_AND_BLOCK_RELATIVE_COMMAND_START-1                      ; CD PULL-BLOCK RELATIVE
	.WORD MOVE_AND_BLOCK_HASH_COMMAND_START-1                          ; CE PULL-BLOCK BALL 
	.WORD MOVE_AND_BLOCK_REL_BALL_CARRIER_COMMAND_START-1              ; CF PULL-BLOCK MIDDLE

	.WORD SET_SNAP_LOC_RELATIVE_TO_BALL_COMMAND-1                      ; D0 SET POSTITION REALTIVE TO BALL 
	.WORD SET_SNAP_LOC_RELATIVE_TO_MID_COMMAND-1                       ; D1 SET POSITION RELATIVE TO MIDDLE
	.WORD CENTER_HIKE_COMMAND_START-1                                  ; D2 HIKE UNDER CENTER 
	.WORD SHOTGUN_HIKE_COMMAND_START-1                                 ; D3 HIKE SHOTGUN
	.WORD RECEIVE_SNAP_CENTER_COMMAND_START-1                          ; D4 TAKE SNAP CENTER
	.WORD RECEIVE_SNAP_SHOTGUN_COMMAND_START-1                         ; D5 TAKE SNAP SHOTGUN
	.WORD RECEIVE_SNAP_FG_XP_COMMAND_START-1                           ; D6 TAKE SNAP KICK 
	.WORD MOVE_RELATIVE_COMMAND_START-1                                ; D7 MOVE X,Y
	.WORD MOVE_ABS_VS_SNAP_LOC_COMMAND_START-1                         ; D8 MOVE ABS RELATIVE TO BALL
	.WORD MOVE_ABS_VS_MIDDLE_COMMAND_START-1                           ; D9 MOVE ABS REALATIVE TO MIDDLE
	.WORD CHASE_BALL_AGRESSIVE_COMMAND_START-1                         ; DA CHASE BALL LIGHT 
	.WORD MIRROR_BALL_CARRIER_WHILE_BEHIND_LOS_COMMAND_START-1         ; DB MIRROR BALL CARRIER IF BEHIND LINE
	.WORD DC_COMMAND_UNUSED-1                                          ; DC LOOP UNTIL BALL ABOUT TO COLLIDE) NOT USED
	.WORD CHASE_BALL_CARRIER_CONSERVATIVE_COMMAND_START-1              ; DD CHASE BALL CARRIER AGRESSIVE
	.WORD INIFITE_LOOP_COMMAND_START-1                                ; DE UNUSED INFINITE LOOP 
	.WORD COM_CONTROL_BALL_CARRIER_COMMAND_START-1                     ; DF COM TAKE CONTROL 

	.WORD SET_RS_COMMAND_START-1                                       ; EO SET RS
	.WORD SET_MS_COMMAND_START-1                                       ; E1 SET MS
	.WORD INCR_DECR_RS_COMMAND_START-1                                 ; E2 BOOST RS
	.WORD INCR_DECR_MS_COMMAND_START-1                                 ; E3 BOOST MS
	.WORD MAN_TAKE_CONTROL_COMMAND_START-1                             ; E4 MAN CONTROL
	.WORD KICKOFF_COMMAND_START-1                                     ; E5 KICKOFF
	.WORD PUNT_COMMAND_START-1                                         ; E6 PUNT
	.WORD KICK_FG_COMMAND_START-1                                      ; E7 FIELD GOAL
	.WORD KICK_XP_COMMAND_START-1                                      ; E8 XP
	.WORD WAIT_RANDOM_TIME_AFTER_SNAP_COMMAND_START_UNUSED-1           ; E9 WAIT RANDOM TIME TILL AFTER BALL SNAPPED NOT USED
	
	.WORD THREE_PT_STANCE_COMMAND_START-1                              ; EA 3PT STANCE 
	.WORD FORMATION_SHIFT_COMMAND_START-1                              ; EB SHIFT
	.WORD TWO_PT_STANCE_COMMAND_START-1                                ; EC 2PT STANCE 
	.WORD OFF_MOTION_COMMAND_START-1                                   ; ED MOTION TIME
	.WORD QB_PRE_SNAP_STANCE_COMMAND_START-1                           ; EE QB STANCE
	
	.WORD RETURN_KICK_PUNT_COMMAND_START-1                             ; EF CHANGE ICON TO RET
	
	.WORD FACE_LOS_COMMAND_START-1                                     ; F0 FACE DIRECTION
	.WORD UNUSED_COMMAND_START-1                                       ; F1 UNUSED INFINITE LOOP
	.WORD UNUSED_COMMAND_START-1                                       ; F2 UNUSED INFINITE LOOP
	.WORD STAND_COMMAND_START-1                                        ; F3 STAND (TIME)
	.WORD TURN_COMMAND_START-1                                         ; F4 TURN (TIME) 
	.WORD WAIT_COMMAND_START-1                                         ; F5 WAIT (MIN, MAX)
	.WORD SET_HITTING_POWER_COMMAND_START-1                            ; F6 SET HP
	.WORD CHANGE_HITTING_POWER_COMMAND_START-1                         ; F7 BOOST HP 
	.WORD UNUSED_COMMAND_START-1                                       ; F8 UNUSED INFINTE LOOP
	.WORD UNUSED_COMMAND_START-1                                       ; F9 UNUSED INFINTE LOOP
	.WORD RECOVER_BALL_COMMAND_START-1                                 ; FA RECOVER BALL
	.WORD CAN_COLLIDE_COMMAND_START-1                                  ; FB SET TO GRAPPLE
	.WORD CAN_COLLIDE_COMMAND_START-1                                  ; FC SET TO GRAPPLE
	.WORD CAN_BLOCK_COMMAND_START-1                                    ; FD SET TO BLOCK
	.WORD BRANCH_COMMAND_START-1                                       ; FE JUMP (1 byte) 
	.WORD JUMP_COMMAND_START-1                                          ; FF JUMP (2 byte)

_F}_PLAYER_COMMAND_PROCESSING 
	
_F{_RESET_CURRENT_SPEED_TO_INITIAL								  ; DONE	

RESET_CURRENT_SPEED_RP_TO_INITIAL_VALUES:                          ; INITIALIZE PLAYER RUSHING POWER AND CURRENT SPEED TO DEFAULT VALUES 
	LOAD_CUR_PLAYER_RP_RS_INDEXES 
	TAX                                                           ;                   
	LOG_SHIFT_RIGHT_4
	TAY                                                           ;
	LDA RUSHING_POWER_VALUES_TABLE,Y                              ; SET PLAYER RUSHING POWER COUNTER  FROM RUSHING POWER TABLE ADDR  + SKILL INDEX OFFSET
	SET_CUR_PLAYER_RUSHING_PWR_CTR
	TXA                                                           ; LOAD PLAYER RUNNING SPEED SKILL INDEX 
	AND #$0F                                                      ;  
	TAY                                                           ;
	LDA RUNNING_SPEED_VALUES_TABLE,Y                              ; SET PLAYER RUSHING CURRENT SPEED = STARTING SPEED TABLE ADDR + SKILL INDEX OFFSET
	SET_CUR_PLAYER_SPEED

_F}_RESET_CURRENT_SPEED_TO_INITIAL	

_F{_UPDATE_CURRENT_SPEED_AND_ACCEL_COUNTER   					  ; DONE
							
UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK:                      ; CHECK FOR PLAYER MOVING AND UPDATE SPEED. IF MOVING RP= RP - 1
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	
@check_for_player_moving:	
	LOAD_CUR_PLAYER_MOVEMENT_STATUS
	BPL COLL_CHECK_START                                          ; NO->COLLISION CHECK START
	
@player_moving_update_acceleration_timer:	
	LOAD_CUR_PLAYER_RUSHING_PWR_CTR
	SEC                                                           ;
	SBC #$01                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BNE COLL_CHECK_START                                          ; RUSHING POWER COUNTER > 0 YES->COLLISION CHECK START. 
	
@if_acceleration_counter_zero_reload_accel_counter				  ; IF RP CURRENT VALUE =0 RELOAD RUSHING POWER COUNTDOWN VALUE AND UPDATE CURRENT SPEED
	DEY                                                           ; LOAD PLAYER RP_RS TABLE INDEX
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LOG_SHIFT_RIGHT_4
	TAX                                                           ; 
	LDA RUSHING_POWER_VALUES_TABLE,X                              ; SET PLAYER RUSHING POWER COUNTER = FROM RUSHING POWER TABLE ADDR + SKILL INDEX OFFSET
	INY                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	
@update_player_speed_if_not_at_max_speed	
	INY                                                           ; LOAD PLAYER CURRENT SPEED 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ; LOAD PLAYER MAX SPEED 
	CMP (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER CURRENT SPEED >= MAX SPEED? 
	BCS COLL_CHECK_START                                          ; YES->COLLISION CHECK START

@update_speed_by_one:	
	CLC                                                           ; NO->PLAYER CURRENT SPEED++
	ADC #$01                                                      ; 
	DEY                                                           ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR ADD_VELOCITY_BASED_ON_DIRECTION                           ; UPDATE PLAYER VELOCITY VALUES BASED ON CURRENT DIRECTION()

_F}_UPDATE_CURRENT_SPEED_AND_ACCEL_COUNTER

_F{_CHECK_COLLISION_TYPE										  ; DONE
	
off_player_ram_addr = LOCAL_1 

	
COLL_CHECK_START:                                                 ; COLLISION CHECK START
	LOAD_CUR_PLAYER_COLLISION_STATUS                              ; IS PLAYER COLLIDING? 
	BPL UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; NO-> CHECK FOR PLAYER MOVING/UPDATE SPEED
	AND #$7F                                                      ; YES->SET PLAYER COLLISION = NOT COLLIDING
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LOAD_CUR_PLAYER_POSITION_ID
	EOR POSSESSION_STATUS                                         ; IS PLAYER ON OFFENSE? YES->OFFENSE COLLIDING START
	BPL @offense_coll_check_start								      ;

@def_coll_start:                                                  ; DEFENSE COLLIDING START
	JSR CHECK_IF_DEF_COLLIDED                                     ; UPDATE CAN COLLIDE BITMASK AND CHECK IF DEFENSIVE PLAYER CAN COLLIDE    
	BCC UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; PLAYER CAN COLLIDE? NO->CHECK FOR PLAYER MOVING/UPDATE SPEED
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDY #$00                                                      ; DOES OFFENSIVE PLAYER COLLISION = JUMPING OR DIVING FOR PASS
	LDA (off_player_ram_addr),Y                                   ;
	AND #(PLAYER_JUMPING_BITFLAG+PLAYER_ON_GROUND_BITFLAG)        ; 
	BNE UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; YES->CHECK FOR PLAYER MOVING/UPDATE SPEED
	LDA (off_player_ram_addr),Y                                   ; DOES OFFENSIVE PLAYER COLLISION = COLLIDED
	AND #PLAYER_COLLIDED_BITFLAG                                  ; 
	BEQ UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; NO->CHECK FOR PLAYER MOVING/UPDATE SPEED
	JMP PLAYER_COLLIDING_COLLIDED_PLAYERS                         ; YES->PLAYER COLLIDING WITH EXISITING COLLISION START

 
	
@offense_coll_check_start:                                        ;

def_player_ram_addr = LOCAL_1

	LOAD_CUR_PLAYER_COLLISION_STATUS                              ;  
	AND #PLAYER_JUMPING_BITFLAG                                   ; 
	BNE UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; YES->CHECK FOR PLAYER MOVING/UPDATE SPEED
	JSR CHECK_IF_OFFENSE_COLLIDED                              ; CHECK FOR PLAYERS CAN COLLIDE WITH()
	BCC UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; PLAYER CAN COLLIDE? NO->CHECK FOR PLAYER MOVING/UPDATE SPEED
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDY #COLLISION_STATUS                                         ; DOES DEFENDER COLLISION = JUMPING OR DIVING FOR PASS?
	LDA (def_player_ram_addr),Y                                   ; 
	AND #(PLAYER_JUMPING_BITFLAG+PLAYER_ON_GROUND_BITFLAG)        ; 
	BNE UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; YES-> CHECK FOR PLAYER MOVING/UPDATE SPEED
	LDA #COLLISSION_SOUND                                         ; SAVE SPRITES COLLIDING SOUND INDEX INTO TEMP $682
	STA COLL_SOUND_TO_PLAY                                        ; 
	LDY #$00                                                      ; DOES DEFENDER COLLISION = COLLIDED 
	LDA (def_player_ram_addr),Y                                   ; 
	AND #PLAYER_COLLIDED_BITFLAG                                  ; 
	BEQ @offense_colliding_defender                               ; NO->OFFENSIVE PLAYER COLLIDING WITH DEFENDER START
	JMP PLAYER_COLLIDING_COLLIDED_PLAYERS                         ; YES->PLAYER COLLIDING WITH EXISITING COLLISION

@offense_colliding_defender:                                      ;                                                       ; /OFFENSIVE PLAYER COLLIDING WITH DEFENDER START/
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER DIVING FOR TACKLE/ CHOP BLOCKING?  
	AND #(PLAYER_DIVE_TACKLE_BITFLAG+PLAYER_CHOP_BLOCK_BITFLAG)                                                
	CMP #PLAYER_DIVE_TACKLE_BITFLAG                               ; 
	BNE @offense_colliding_chop_block                             ; NO->OFFENSIVE CHOP BLOCK COLLISION CHECK
	JMP OFFENSE_DIVING_FOR_TACKLE                                 ; YES->OFFENSE PLAYER DIVING FOR TACKLE COLLISION

@offense_colliding_chop_block:                                    ;                                                       ; / OFFENSIVE CHOP BLOCK COLLISION CHECK/
	CMP #PLAYER_CHOP_BLOCK_BITFLAG                                ; DOES OFFENSIVE PLAYER MOVEMENT = CHOP BLOCKING?
	BNE @check_for_offense_chop_block_tackle                      ; NO -> OFFENSIVE CHOP BLOCK FOR TACKLE COLLISION CHECK
	JMP OFFENSIVE_CHOP_BLOCK_COLLISION                            ; YES-> OFFENSIVE PLAYER CHOP BLOCK

@check_for_offense_chop_block_tackle:                             ; OFFENSIVE CHOP BLOCK FOR TACKLE COLLISION CHECK 
	CMP #(PLAYER_DIVE_TACKLE_BITFLAG+PLAYER_CHOP_BLOCK_BITFLAG)                                               
	BNE @check_defender_diving_chop_block                         ; NO-> OFFENSIVE COLLIDE CHECK FOR DEFENDER DIVING OR CHOPPING
	JMP CHECK_COL_TYPE_MAN_OR_COM                                 ; YES->CHECK COLLISION TYPE (MAN,COM)*** DON’T THINK CONDITION IS POSSIBLE)                    

	
@check_defender_diving_chop_block:                                ; CHECK FOR DEFENDER DIVING OR CHOPPING
	LDA (defender_addr),Y                                         ; DOES DEFENDER MOVEMENT = DIVING FOR TACKLE OR CHOP BLOCKING?
	AND #(PLAYER_DIVE_TACKLE_BITFLAG+PLAYER_CHOP_BLOCK_BITFLAG)                                              
	BEQ START_OF_NORMAL_COLLISION_OFF_DEF                         ; NO-> NORMAL PLAYER COLLISION

@check_for_dive_tackle: 
	CMP #PLAYER_DIVE_TACKLE_BITFLAG                               ; DOES DEFENDER MOVEMENT =  DEFENDER DIVING
	BNE @defender_chop_block_check                                ; NO->CHECK FOR DEFENSIVE PLAYER CHOP BLOCK
	JMP DEFENDER_DIVE_TACKLES_OFFENSE                             ; YES->OFFENSIVE PLAYER FLATTENED SAVE DEFENDER IN OFF PLAYER RAM

@defender_chop_block_check:                                       ; CHECK FOR DEFENSIVE PLAYER CHOP BLOCK 
	CMP #PLAYER_CHOP_BLOCK_BITFLAG                                ; DOES DEFENDER MOVEMENT =  CHOP BLOCKING
	BNE @defender_error_condition                                 ; NO-> CHECK COLLISION TYPE (MAN,COM)
	JMP DEFENDER_CHOP_BLOCK_TACKLE                                ; YES->DEFENDER CHOP BLOCK *** (DON’T THINK YES CONDITION IS POSSIBLE)                    

@defender_error_condition:                                        ; CHECK COLLISION TYPE (MAN,COM) *** (DON’T THINK YES CONDITION IS POSSIBLE)
	JMP CHECK_COL_TYPE_MAN_OR_COM                                 ; JUMP->CHECK COLLISION TYPE (MAN,COM)(

_F}_CHECK_COLLISION_TYPE	

_F{_INITIALIZE_COLLISION_ADDRESSES								  ; DONE
	
START_OF_NORMAL_COLLISION_OFF_DEF:                                ; NORMAL OFF AND DEF PLAYER COLLISION
	LDY #COMMAND_COUNTER                                          ; SET DEFENDER PLAY COMMAND TIMER =0 = DO FOREVER UNTIL CHANGED
	LDA #$00                                                      ;                       
	STA (defender_addr),Y                                         ; 
	LDY #<(CHECK_COL_TYPE_MAN_OR_COM-1)                           ; SET COLLISION ADDR = CHECK COLLISION TYPE (MAN,COM)
	LDX #>(CHECK_COL_TYPE_MAN_OR_COM-1)                     
	JSR UPDATE_CURRENT_PLAYER_COMMAND_ADDR                        ; SET COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $AE $AF)                    
	LDY #COLLISION_COUNTER                                        ; SET OPPOSING  COLLISION LOGIC COUNTER = 1 FRAME          
	LDA #$01                                                      ; 
	STA (defender_addr),Y                                         ; 
	INY                                                           ; SET OPPOSING PLAYER COLLISION LOGIC ADDRESS = SET GRAPPLES PRESSES TO ZERO, CHECK FOR MAN OR COM -1 
	LDA #<(COUNT_PRESSES_GRAPPLE_IF_MAN-1)                        ; 
	STA (defender_addr),Y                                         ; 
	INY                                                           ; 
	LDA #>(COUNT_PRESSES_GRAPPLE_IF_MAN-1)                        ; 
	STA (defender_addr),Y                                         ; 
	JSR SAVE_LOCAL_PLAYER_IN_CURRENT_PLAYER_RAM                   ; SAVE TARGET PLAYER POINTER ($3E,3F) IN CURRENT PLAYER ($AE,AF) RAM $1E/1F()
	JSR SAVE_CURRENT_PLAYER_IN_LOCAL_PLAYER_RAM                   ; SAVE CURRENT PLAYER POINTER ($AE,AF) IN TARGET PLAYER ($3E,3F) RAM $1E/1F()
	
	
@set_player_status_not_on_ground_and_collided:                    ; SET PLAYERS TO COLLIDED, NOT ON GROUND
	LOAD_CUR_PLAYER_COLLISION_STATUS
	AND #$EF                                                      ; SET OFFENSIVE PLAYER COLLISION = NOT ON GROUND 
	ORA #PLAYER_COLLIDED_BITFLAG                                  ; SET OFFENSIVE PLAYER COLLISION  = COLLIDED
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDA (defender_addr),Y                                         ;
	AND #$EF                                                      ; SET DEFENSIVE PLAYER COLLISION  = NOT ON GROUND 
	ORA #PLAYER_COLLIDED_BITFLAG                                  ; SET DEFENSIVE PLAYER COLLISION = COLLIDED
	STA (defender_addr),Y                                         ; 

_F}_INITIALIZE_COLLISION_ADDRESSES	
	
_F{_COUNT_PRESSES_IF_MAN										  ; DONE	
	
presses = EXTRA_PLAYER_RAM_3

COUNT_PRESSES_GRAPPLE_IF_MAN:                                     ; SET GRAPPLES PRESSES TO ZERO, CHECK FOR MAN OR COM   
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$00                                                      ; SET COLLISION PRESSES  =  ZERO
	LDY #presses                                                  ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER MAN CONTROLLED? 
	AND #PLAYER_MAN_COM_BITFLAG                                   ; 
	BEQ @pause_com_during_man_com_grapple                         ; NO->COM GRAPPLE COLLISION CHECK WAIT

@count_man_a_presses:                                             ; GRAPPLE COLLISION MAN BUTTON PRESS LOOP                         
	RETURN_PLAYER_ACTIONS_IN_1_FRAME                           
	JSR GET_PLAYER_JOY_PRESS                                      ; GET P1 OR P2 JOYPAD PRESS()
	BPL @count_man_a_presses                                      ; “A” PRESS? NO->GRAPPLE COLLISION MAN BUTTON PRESS LOOP
	LDY #presses                                                  ; PRESSES++
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ; 
	ADC #$01                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JMP @count_man_a_presses                                      ; JUMP->GRAPPLE COLLISION MAN BUTTON PRESS LOOP


@pause_com_during_man_com_grapple:                                ; COM GRAPPLE COLLISION CHECK WAIT
	PAUSE_PLAYER_ACTIONS

_F}_COUNT_PRESSES_IF_MAN		

_F{_COLLIDE_WITH_COLLIDED_PLAYERS								  ; DONE

	
PLAYER_COLLIDING_COLLIDED_PLAYERS:                                ; PLAYER COLLIDING WITH EXISITING COLLISION START
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER BALL CARRIER?
	AND #PLAYER_BALL_CARRIER_BITFLAG                              ; 
	BNE PLAYER_BOUNCES_BACKWARDS_IF_MOVING                        ; YES->BALL CARRIER COLLIDING WITH EXISISTING COLLISION BOUNCES BACKWARDS

opponent_addr  = LOCAL_1 
	
@non_ball_carrier_collides_collided_players:                      ; 
	LDA RANDOM_1                                                  ; MAKE RANDOM # = 0-3 FROM RAND3B
	AND #BOUNCE_OFF_PLAYER_CHANCE                                 ; 
	BEQ PLAYER_FALLS_TO_GROUND_OFF_COLLIDED_PLAYERS               ; 25%->PLAYER BOUNCES OFF EXISISTING COLLISION AND IS ON GROUND

@player_frees_collided_players: 
	LDY #<(PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE-1)                 ; SET COMMAND ADDR = PLAYER THROWN SHORT RAND (0,3,6)
	LDX #>(PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE-1)                 ;            
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	JSR SET_PLAYER_NOT_COLLIDED_IF_VALID_STILL_COLLIDED           ; SET PLAYER TO NOT COLLIDED($3E,$3F = PLAYER ADDR)

@if_freed_player_ball_carrier_tackled: 
	LDY #MOVEMENT_STATUS                                          ; DOES OPPONENT MOVEMENT = PLAYER IS BALL CARRIER?
	LDA (opponent_addr),Y                                         ; 
	AND #PLAYER_BALL_CARRIER_BITFLAG                              ; 
	BNE PLAYER_TACKLES_COLLIDED_BALL_CARRIER                      ; YES->PLAYER TACKLES PLAYER IN EXISITING COLLISION

PLAYER_BOUNCES_BACKWARDS_IF_MOVING:                               ; BALL CARRIER COLLIDING WITH EXISISTING COLISSION BOUNCES BACKWARDS
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; DOES PLAYER MOVEMENT  = NOT MOVING
	BPL @end_of_ball_carrier_bounces_backwards                     ; YES->CHECK FOR PLAYER MOVING/UPDATE SPEED

@invert_velocity_for_bounce_effect                                ; INVERT VELOCITIES SO PLAYER BOUNCES
	LDY #X_VELOCITY                                               ; LOAD X VELOCITY INDEX
	JSR INVERT_PLAYER_VELOCITY                                    ; INVERT VELOCITY(Y= DIRECTION (X OR Y) TO INVERT
@invert_y_velocity 
	INY                                                           ; LOAD Y VELOCITY INDEX 
	JSR INVERT_PLAYER_VELOCITY                                    ; INVERT VELOCITY(Y= DIRECTION (X OR Y) TO INVERT
	
@pause_command_update: 
	LDY #COMMAND_COUNTER                                          ; SET PLAYER COMMAND COUNTER = 0 = WAIT UNTIL CHANGED 
	LDA #$00                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 6                 ;

@resume_command_update: 
	LDY #COMMAND_COUNTER                                          ; SET PLAYER COMMAND COUNTER = 1
	LDA #$01                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

@end_of_ball_carrier_bounces_backwards:
	JMP UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; JUMP->CHECK FOR PLAYER MOVING/UPDATE SPEED

PLAYER_FALLS_TO_GROUND_OFF_COLLIDED_PLAYERS:                      ; PLAYER BOUNCES OFF EXISISTING COLLISION AND IS ON GROUND             
	LDY #<(PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE-1)                 ; SET ADDR = PLAYER THROWN SHORT RAND (0,3,6)  
	LDX #>(PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE-1)                 ; 
	JSR UPDATE_CURRENT_PLAYER_COMMAND_ADDR                        ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $AE $AF)
	PAUSE_PLAYER_ACTIONS

PLAYER_TACKLES_COLLIDED_BALL_CARRIER:                             ; PLAYER TACKLES PLAYER IN EXISITING COLLISION
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	LDA #$00                                                      ; SET PLAYER COLLISION COUNTER 0 = DISABLE COLLISION UPDATE 
	LDY #COMMAND_COUNTER                                          ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	PAUSE_PLAYER_ACTIONS

INVERT_PLAYER_VELOCITY:                                           ; INVERT VELOCITY(Y=velocity index) 
	LDA #$00                                                      ; = 16 BIT (–velocity) 
	SEC                                                           ; 
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$00                                                      ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN
	
_F}_COLLIDE_WITH_COLLIDED_PLAYERS	

_F{_DIVE_TACKLE_CHOP_BLOCK_COLLISIONS							  ; DONE

OFFENSE_DIVING_FOR_TACKLE:                                        ; OFFENSE PLAYER DIVING FOR TACKLE COLLISION
	JSR SAVE_CURRENT_PLAYER_IN_LOCAL_PLAYER_RAM                   ; SAVE CURRENT PLAYER POINTER ($AE,AF) IN TARGET PLAYER ($3E,3F) RAM $1E/1F()
	LDY #<(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ; SET COMMAND ADDR = PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE
	LDX #>(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ;
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; JUMP->CHECK FOR PLAYER MOVING/UPDATE SPEED

OFFENSIVE_CHOP_BLOCK_COLLISION:                                   ; OFFENSIVE PLAYER CHOP BLOCK    
	JSR SAVE_CURRENT_PLAYER_IN_LOCAL_PLAYER_RAM                   ; SAVE CURRENT PLAYER POINTER ($AE,AF) IN TARGET PLAYER ($3E,3F) RAM $1E/1F()
	LDY #<(DO_CHOP_BLOCK_TUMBLE-1)                                ; SET COMMAND ADDR = = CHOP BLOCK TUMBLE ANIMATION(6-9 YARDS), CHECK FOR TACKLE 
	LDX #>(DO_CHOP_BLOCK_TUMBLE-1)                                ;
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP UPDATE_RP_CNT_AND_CUR_SPEED_THEN_COLL_CHECK               ; JUMP->CHECK FOR PLAYER MOVING/UPDATE SPEED

DEFENDER_DIVE_TACKLES_OFFENSE:                                    ; OFFENSIVE PLAYER FLATTENED SAVE DEFENDER IN RAM
	JSR SAVE_LOCAL_PLAYER_IN_CURRENT_PLAYER_RAM                   ; SAVE TARGET PLAYER POINTER ($3E,3F) IN CURRENT PLAYER ($AE,AF) RAM $1E/1F()
	LDY #<(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ; SET COMMAND ADDR =  PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE
	LDX #>(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ; 
	JSR UPDATE_CURRENT_PLAYER_COMMAND_ADDR                        ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $AE $AF)                    
	PAUSE_PLAYER_ACTIONS

DEFENDER_CHOP_BLOCK_TACKLE:                                       ; DEFENDER CHOP BLOCK? ***DON’T THINK THIS EVER GETS EXECUTED
	JSR SAVE_LOCAL_PLAYER_IN_CURRENT_PLAYER_RAM                   ; SAVE TARGET PLAYER POINTER ($3E,3F) IN CURRENT PLAYER ($AE,AF) RAM $1E/1F()
	LDY #<(DO_CHOP_BLOCK_TUMBLE-1)                                ; SET ADDR = CHOP BLOCK TUMBLE ANIMATION(6-9 YARDS), CHECK FOR TACKLE 
	LDX #>(DO_CHOP_BLOCK_TUMBLE-1)                                ;
	JSR UPDATE_CURRENT_PLAYER_COMMAND_ADDR                        ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $AE $AF)                    
	PAUSE_PLAYER_ACTIONS

_F}_DIVE_TACKLE_CHOP_CLOCK_COLLISIONS	

_F{_CHECK_PLAYER_CONTROL_COLLISION_TYPE							  ; DONE 
	
defense_addr   = LOCAL_1
	
CHECK_COL_TYPE_MAN_OR_COM:                                        ; CHECK COLLISION TYPE (MAN,COM)                     
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF()                   
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER MAN CONTROLLED? 
	AND #PLAYER_MAN_COM_BITFLAG                                   ; 
	BEQ @com_vs_com_check                                         ; NO->CHECK FOR MAN DEFENDER

@check_target_is_man:
	LDA (defense_addr),Y                                          ; DOES DEF MOVEMENT =  MAN CONTROLLED?
	AND #PLAYER_MAN_COM_BITFLAG                                   ; 
	BEQ @man_vs_com_jump_popcorn_check                            ; NO->MAN VS COM POPCORN CHECK JUMP
	
@if_yes: 
	JMP MAN_VS_MAN_GRAPPLE_START                                  ; YES->MAN V MAN GRAPPLE START

@man_vs_com_jump_popcorn_check:                                   ; MAN VS COM POPCORN CHECK JUMP  
	JMP MAN_VS_COM_POPCORN_CHECK                                  ; JUMP->MAN VS COM POPCORN CHECK

@com_vs_com_check:                                                ; CHECK FOR MAN DEFENDER GRAPPLE
	LDA (defense_addr),Y                                          ; DOES DEF MOVEMENT =  MAN CONTROLLED?
	AND #PLAYER_MAN_COM_BITFLAG                                   ; 
	BEQ COM_V_COM_COLLIDED_START                                  ; NO->COM V COM GRAPPLE START
	JMP PAUSE_COLL_CHECK_RECHECK_COLL_TYPE                         ; *** should never reach here


_F}_CHECK_PLAYER_CONTROL_COLLISION_TYPE

_F{_COM_VS_COM_COLLISION_LOGIC									  ; DONE
	
COM_V_COM_COLLIDED_START:                                         ; COM VS COM GRAPPLE START 
	LOAD_CUR_PLAYER_HITTING_POWER                                 ; PLAYER HP- TARGET HP 
	SEC                                                           ; 
	SBC (defense_addr),Y                                          ; 
	BCC COM_DEF_HP_MORE_THAN_OFF                                  ; DEFENSE HP > OFFENSE HP? YES-> DEFENSE HP > OFFENSE
							

COM_OFF_HP_GREATER_OR_EQUAL_TO_DEF:                               ; OFFENSE HP >= DEFENSE  

@check_less_than_25_hp_diff:   
	CMP #COM_VS_COM_OFF_HP_THRESH_1                               ; OFFENSE HP > DEFENSE HP BY >= 4 NOTCHES (25HP)?
	BCC COM_VS_COM_LONG_GRAPPLE_START                             ; NO-> COM V COM NORMAL GRAPPLE

@check_50_hp_diff_or_more 
	CMP #COM_VS_COM_OFF_HP_THRESH_2                               ; OFFENSE HP > DEFENSE HP BY >=8 NOTCHES (50HP)?
	BCS @jump_high_chance_def_thrown                              ; YES->OFFENSE HP > DEFENSE HP 8+ NOTCHES
	JMP MEDIUM_CHANCE_DEF_COM_THROWN                              ; NO-> MEDIUM CHANCE DEFENSIVE PLAYER THROWN

@jump_high_chance_def_thrown:                                     ; OFFENSE HP > DEFENSE HP BY 8>= NOTCHES
	JMP HIGH_CHANCE_DEF_COM_THROWN                                ; JUMP TO HIGH CHANCE DEFENSIVE PLAYER THROWN

COM_DEF_HP_MORE_THAN_OFF:                                         ; DEFENSE HP > OFFENSE 

@check_less_than_25_hp_diff:   
	CMP #COM_VS_COM_DEF_HP_THRESH_1 +1                            ; DEFENSE HP < 4 NOTCHES GREATER? 
	BCS COM_VS_COM_LONG_GRAPPLE_START                             ; YES->COM V COM NORMAL GRAPPLE

@check_50_hp_diff_or_more 
	CMP #COM_VS_COM_DEF_HP_THRESH_2 +1                            ; DEFENSE HP >= 8 NOTCHES MORE THAN OFFENSE HP
	BCC @jump_high_chance_off_thrown:                             ; YES->DEFENSE HP > OFFENSE BY 8+ NOTCHES
	JMP MEDIUM_CHANCE_OFF_COM_THROWN                              ; NO-> MEDIUM CHANCE OFFENSIVE PLAYER THROWN

@jump_high_chance_off_thrown::                                    ; DEFENSE HP > OFFENSE BY 8+ NOTCHES
	JMP HIGH_CHANCE_OFF_COM_THROWN                                ; JUMP->HIGH CHANCE OFFENSIVE PLAYER THROWN

COM_VS_COM_LONG_GRAPPLE_START:                                    ; COM V COM NORMAL GRAPPLE
	JSR TURN_PLAYERS_TOWARDS_EACH_OTHER_COLL                      ; UPDATE DIRECTIONS FOR COLLIDED SPRITES()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR SET_COLL_SPRITES_NOT_MOVING_UPDATE_SPRITE                 ; KEEP BOTH PLAYERS PAUSED VELOCITY ZERO UPDATE SPRITE GRAPHIC AND INDEX()

COM_VS_COM_SET_RANDOM_GRAPPLE_TIME:                               ; NORMAL GRAPPLE TIME DELAY START
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	JSR UPDATE_RANDOM_1                                           ; UPDATE RANDOM $3B AND LOAD VALUE() = SET FRAMES TO WAIT = RANDOM 0-0xFF FRAMES (0-4.2 sec) 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JSR UPDATE_RANDOM_2                                           ; UPDATE RANDOM $3C AND LOAD VALUE() = SET FRAMES TO WAIT = RANDOM 0-0xFF FRAMES (0-4.2 sec)
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JSR UPDATE_RANDOM_3                                           ; UPDATE RANDOM $3D AND LOAD VALUE() = SET FRAMES TO WAIT = RANDOM 0-0x3F FRAMES frames (0-1 sec)
	AND #$3F                                                      ; 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JSR UPDATE_RANDOM_1                                           ; UPDATE RANDOM $3B AND LOAD VALUE() 
	BMI DEFENSE_WINS_COM_COM_GRAPPLE                               ; 50%->COM V COM DEFENDER WINS, BUSTS IN WITH OFFENSE RANDOMLY THROWN ON GROUND
							
@offense_wins_com_com_grapple									  ; COM VS COM OFFENSE WINS
	JSR UPDATE_RANDOM_2                                           ; UPDATE RANDOM $3C AND LOAD VALUE() = SET FRAMES TO WAIT =  RANDOM 0-0x3F FRAMES (0-1 sec)
	AND #$3F                                                      ; 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
							
																  ; LOAD ROLL ANIMATION ADDR INTO DEFENDER
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER $3E/3F()                   
	LDY #<(PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE-1)                 ; SET COMMAND ADDR = PLAYER THROWN SHORT RAND (0,3,6)
	LDX #>(PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE-1)                 ; 
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                  ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    

@check_outcome_of_offense:	
	LDA RANDOM_3                                                  ; LOAD RANDOM 3D
	BPL @offense_on_ground_after_winning                          ; 50% ->COM v COM PLAYER OFFENSIVE PLAYER WINS GRAPPLE AND IS FLATTENED 

@offense_free_after_winning	
	JMP PLAYER_NO_LONGER_COLLIDED                                 ; 50% ->PLAYER NO LONGER COLLIDED

@offense_on_ground_after_winning:                                 ; COM V COM OFFENSIVE PLAYER WINS GRAPPLE AND IS FLATTENED 
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER               ; JUMP ->PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE 

DEFENSE_WINS_COM_COM_GRAPPLE:                                     ; COM V COM DEFENDER WINS, BUSTS IN WITH OFFENSE RANDOMLY THROWN ON GROUND
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF()                   
	LDY #<(PLAYER_NO_LONGER_COLLIDED-1)                           ; SET COMMAND ADDR = PLAYER NO LONGER COLLIDED 
	LDX #>(PLAYER_NO_LONGER_COLLIDED-1)                           ; 
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE                       ; JUMP-> PLAYER THROWN SHORT RAND (0,3,6)




MEDIUM_CHANCE_DEF_COM_THROWN:                                     ; OFFENSE HP > DEFENSE BY > 4 NOTCHES <8
	JSR TURN_PLAYERS_TOWARDS_EACH_OTHER_COLL                      ; UPDATE DIRECTIONS FOR COLLIDED SPRITES()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR SET_COLL_SPRITES_NOT_MOVING_UPDATE_SPRITE                 ; KEEP BOTH PLAYERS PAUSED VELOCITY ZERO UPDATE SPRITE GRAPHIC AND INDEX
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	JSR UPDATE_RANDOM_3                                           ; UPDATE RANDOM $3D AND LOAD VALUE()
	CMP #MEDIUM_COM_COM_OL_THROW_CHANCE                           ; 
	BCC @defender_thrown                                          ; 60% -> COM DEFENDER THROWN, OFFENSIVE PLAYER FLATTENED OR STAYS STANDING 
	JMP COM_VS_COM_SET_RANDOM_GRAPPLE_TIME                        ; 40% -> COM V COM NORMAL GRAPPLE

@defender_thrown:                                                 ; COM DEFENDER THROWN, OFFENSIVE PLAYER FLATTENED OR STANDING
	JSR UPDATE_RANDOM_1                                           ; UPDATE RANDOM $3B AND LOAD VALUE() 
	AND #$3F                                                      ; SET FRAMES TO WAIT =  RANDOM (10-4F FRAMES)  ~0.5 TO 1.3 SECONDS
	CLC                                                           ;
	ADC #$10                                                      ;
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF()                   
	LDY #<(PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE-1)                 ; SET COMMAND ADDR  = PLAYER THROWN SHORT RAND (0,3,6)
	LDX #>(PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE-1)                 ;
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    

@check_outcome_of_OL:	
	LDA RANDOM_2                                                  ; LOAD RANDOM NUMBER 3C
	CMP #OFF_ON_GROUND_AFTER_THROW_MED_CHANCE                                                       ; 
	BCC @offense_on_ground:                             		  ; 33% ->PLAYER GETS FLATTENED + 1 FRAME DELAY
	
@offense_free:	
	JMP PLAYER_NO_LONGER_COLLIDED                                 ; 66% ->PLAYER NO LONGER COLLIDED

@offense_on_ground:                                        ; PLAYER GETS FLATTENED + 1 FRAME DELAY
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER               ; JUMP->PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE

HIGH_CHANCE_DEF_COM_THROWN:                                       ; OFFENSE HP > DEFENSE BY 8 NOTCHES
	JSR TURN_PLAYERS_TOWARDS_EACH_OTHER_COLL                      ; UPDATE DIRECTIONS FOR COLLIDED SPRITES()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR SET_COLL_SPRITES_NOT_MOVING_UPDATE_SPRITE                 ; KEEP BOTH PLAYERS PAUSED VELOCITY ZERO UPDATE SPRITE GRAPHIC AND INDEX()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	JSR UPDATE_RANDOM_3                                           ; UPDATE RANDOM $3D AND LOAD VALUE()
	CMP #HIGH_COM_COM_OL_THROW_CHANCE                                                      ; 
	BCS DELAY_THEN_NORMAL_GRAPPLE                                 ; 25% ->64(1 SEC) FRAME DELAY THEN JUMP TO NORMAL GRAPPLE
	
@defender_thrown:
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF()                   
	LDY #<(PLAYER_THROWN_LONG_LARGE_COM_POP-1)                    ; SET COLL ADDR =  PLAYER THROWN LONG RAND (6,6,11)
	LDX #>(PLAYER_THROWN_LONG_LARGE_COM_POP-1)                    ;
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    

@check_outcome_of_OL:	
	JSR UPDATE_RANDOM_1                                           ; UPDATE RANDOM $3B AND LOAD VALUE()
	CMP #OFF_ON_GROUND_AFTER_THROW_HIGH_CHANCE                    ;
	BCC @offense_on_ground:                                       ; 20%->PLAYER GETS FLATTENED 2 ****UNEEDED COULD HAVE USED 8407 ADDRESS

@offense_free:		
	JMP PLAYER_NO_LONGER_COLLIDED                                 ; 80%->JUMP TO PLAYER NO LONGER COLLIDED

@offense_on_ground:                                               ; OFFENSIVE PLAYER GETS FLATTENED 2 NOT NEEDED
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER               ; JUMP ->PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE

DELAY_THEN_NORMAL_GRAPPLE:                                      ; 64 (~1 SEC) FRAME DELAY THEN JUMP TO COM V COM GRAPPLE
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 64
	JMP COM_VS_COM_SET_RANDOM_GRAPPLE_TIME                        ; JUMP -> COM V COM NORMAL GRAPPLE

MEDIUM_CHANCE_OFF_COM_THROWN:                                     ; DEFENSE HP > OFFFENSE BY > 4 NOTCHES <8
	JSR TURN_PLAYERS_TOWARDS_EACH_OTHER_COLL                      ; UPDATE DIRECTIONS FOR COLLIDED SPRITES()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR SET_COLL_SPRITES_NOT_MOVING_UPDATE_SPRITE                 ; KEEP BOTH PLAYERS PAUSED VELOCITY ZERO UPDATE SPRITE GRAPHIC AND INDEX
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	JSR UPDATE_RANDOM_3                                           ; UPDATE RANDOM $3D AND LOAD VALUE()
	CMP #MEDIUM_COM_COM_DEF_THROW_CHANCE                          ; 
	BCC @offense_thrown                                           ; 66%-> DEFENDER WINS GRAPPLE OFFENSIVE PLAYER THROWN
	
@do_normal_grapple:	
	JMP COM_VS_COM_SET_RANDOM_GRAPPLE_TIME                        ; 33%-> NORMAL GRAPPLE TIME DELAY START

@offense_thrown:                                                        ; DEFENDER WINS GRAPPLE OFFENSIVE PLAYER THROWN
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF()                    
	JSR UPDATE_RANDOM_2                                           ; UPDATE RANDOM $3C AND LOAD VALUE()
	CMP #DEF_ON_GROUND_AFTER_THROW_MED_CHANCE                     ; 
	BCS @defender_free_after_throw                                ; 66%-> PLAYER BUSTS IN NO FALL DOWN WITH RANDOM THROW

@defender_on_ground_after_throw:	
	LDY #<(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ; 33%-> SET COMMAND ADDR = PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE
	LDX #>(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ;  
	JMP @do_medium_throw_of_offense                               ; JUMP->LOAD COMMAND ADDRESS AND RANDOM THROW

@defender_free_after_throw:                                       ; DEFENDER BUSTS IN NO FALL DOWN WITH OFFENSIVE PLAYER RANDOMLY THROW
	LDY #<(PLAYER_NO_LONGER_COLLIDED-1)                           ; SET DEFENDER COMMAND ADDR = PLAYER NO LONGER COLLIDED ADDRESS
	LDX #>(PLAYER_NO_LONGER_COLLIDED-1)                           ;

@do_medium_throw_of_offense:                                      ; LOAD COMMAND ADDRESS AND RANDOW THROW
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP PLAYER_THROWN_MED_AFTER_DEF_POP                           ; JUMP->PLAYER THROWN MEDIUM RAND(3,6,6,11)

HIGH_CHANCE_OFF_COM_THROWN:                                       ; OFFENSIVE PLAYER THROWN DEFENSE HP > OFFFENSE BY > 8 NOTHCES
	JSR TURN_PLAYERS_TOWARDS_EACH_OTHER_COLL                      ; UPDATE DIRECTIONS FOR COLLIDED SPRITES()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR SET_COLL_SPRITES_NOT_MOVING_UPDATE_SPRITE                 ; KEEP BOTH PLAYERS PAUSED VELOCITY ZERO UPDATE SPRITE GRAPHIC AND INDEX() 
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	JSR UPDATE_RANDOM_3                                           ; UPDATE RANDOM $3D AND LOAD VALUE()
	CMP #HIGH_COM_COM_DEF_THROW_CHANCE                            ; 
	BCS DELAY_THEN_NORMAL_GRAPPLE                                 ; 20% ->(~1 SEC) FRAME DELAY THEN JUMP TO COM V COM GRAPPLE
	
@offense_thrown: 	
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF()                   
	JSR UPDATE_RANDOM_2                                           ; UPDATE RANDOM $3C AND LOAD VALUE()
	CMP #DEF_ON_GROUND_AFTER_THROW_HIGH_CHANCE                    ; 
	BCS @defender_free_after_throw                                ; 
	
@defender_on_ground_after_throw:	
	LDY #<(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ; SET COMMAND ADDR = PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE
	LDX #>(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ;
	JMP @do_long_throw_of_offense                                 ;

@defender_free_after_throw:                                       ; DEFENDER BUSTS IN NO FALL DOWN, OFFENSIVE PLAYER THROWN LONG RAND
	LDY #<(PLAYER_NO_LONGER_COLLIDED-1)                           ; LOAD PLAYER NO LONGER COLLIDED ADDRESS
	LDX #>(PLAYER_NO_LONGER_COLLIDED-1)                           ;

@do_long_throw_of_offense:
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP PLAYER_THROWN_LONG_LARGE_COM_POP                          ; JUMP->PLAYER THROWN LONG RAND (6,6,11)

PAUSE_COLL_CHECK_RECHECK_COLL_TYPE:                               ; *** should never reach here
	LDY #<(CHECK_COL_TYPE_MAN_OR_COM-1)                           ; SET COMMAND ADDR = CHECK COLLISION TYPE (MAN,COM)
	LDX #>(CHECK_COL_TYPE_MAN_OR_COM-1)                           ; 
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	PAUSE_PLAYER_ACTIONS                                          ; PAUSE COLLISION CHECK

_F}_COM_VS_COM_COLLISION_LOGIC
	
_F{_MAN_VS_COM_POPCORN_OR_GRAPPLE								  ; DONE

com_addr          = LOCAL_1
players_taps      = EXTRA_PLAYER_RAM_3
com_total_taps    = $02

MAN_VS_COM_POPCORN_CHECK:                                         ; MAN VS COM POPCORN CHECK
																  ; DEFENDER THROWN IMMEDIATELY “POPCORN” CHECK
	LDY #HP_INDEX                                                 ; MAN HP - COM HP 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;   
	SEC                                                           ;
	SBC (com_addr ),Y                                             ; 
	BCC @man_vs_com_grapple_check                                 ; COM HP >MAN? YES->MAN VS COM GRAPPLE CHECK
	CMP #MAN_VS_COM_POPCORN_THRESHOLD                             ; MAN HP 50 HP MORE THAN COM? 
	BCS @com_popcorned_or_outapped                                            ; YES->COM THROWN

@man_vs_com_grapple_check:                                        ; MAN VS COM GRAPPLE CHECK
	JSR TURN_PLAYERS_TOWARDS_EACH_OTHER_COLL                      ; UPDATE DIRECTIONS FOR COLLIDED SPRITES()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR SET_COLL_SPRITES_NOT_MOVING_UPDATE_SPRITE                 ; KEEP BOTH PLAYERS PAUSED VELOCITY ZERO UPDATE SPRITE GRAPHIC AND INDEX()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 64
	LDY #players_taps                                             ; LOAD MAN PRESSES
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CMP #com_total_taps                                           ; MAN PRESSES > (COM PRESSES = 2)
	BCC @com_outapped_man                                         ; NO->MAN THROWN, YES-> COM THROWN

@com_popcorned_or_outapped:                                       ; COM THROWN (MAN VS COM)
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF()                   
	LDY #<(MAN_GRAPPLE_THROWS-1)                                  ; SET COMMAND ADDR =  PLAYER THROWN ALL POSSIBLE OUTCOMES (0,3,6,6,11)+ TACKLE CHECK
	LDX #>(MAN_GRAPPLE_THROWS-1)                                  ;
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	JMP PLAYER_NO_LONGER_COLLIDED                                 ; JUMP->PLAYER NO LONGER COLLIDED

@com_outapped_man:                                                ; MAN THROWN (COM VS MAN) 
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF()                   
	LDY #<(PLAYER_NO_LONGER_COLLIDED-1)                           ; PLAYER NO LONGER COLLIDED 
	LDX #>(PLAYER_NO_LONGER_COLLIDED-1)                           ; 
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE                       ; JUMP->PLAYER THROWN SHORT RAND (0,3,6)

_F}_MAN_VS_COM_POPCORN_OR_GRAPPLE

_F{_MAN_VS_MAN_GRAPPLE											  ; DONE

players_taps      = EXTRA_PLAYER_RAM_3
defender_addr     = LOCAL_1

MAN_VS_MAN_GRAPPLE_START:                                         ; MAN V MAN GRAPPLE START
	JSR TURN_PLAYERS_TOWARDS_EACH_OTHER_COLL                      ; UPDATE DIRECTIONS FOR COLLIDED SPRITES()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR SET_COLL_SPRITES_NOT_MOVING_UPDATE_SPRITE                 ; KEEP BOTH PLAYERS PAUSED VELOCITY ZERO UPDATE SPRITE GRAPHIC AND INDEX()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 64
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/3F(); 
	LDY #players_taps                                             ; DEFENSE PRESSES >= OFFENSE PRESSES 
	LDA (defender_addr),Y                                         ; 
	CMP (CURRENT_PLAYER_ADDR),Y                                   ; 
	BCS @defense_wins_man_man_grapple                             ; YES->DEFENSE WINS GRAPPLE

@offense_wins_man_man_grapple
	LDY #<(MAN_GRAPPLE_THROWS-1)                                  ; SET COMMAND ADDR = PLAYER THROWN ALL POSSIBLE OUTCOMES (0,3,6,6,11)+ TACKLE CHECK
	LDX #>(MAN_GRAPPLE_THROWS-1)                                  ; 
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	JMP PLAYER_NO_LONGER_COLLIDED                                 ; JUMP->PLAYER NO LONGER COLLIDED

@defense_wins_man_man_grapple:                                    ; DEFENSE WINS MAN GRAPPLE
	TAX                                                           ; DID DEFENSE TIE OFFENSE?  
	BEQ @defense_wins_man_man_grapple_equal_presses               ; YES->DEFENSE WINS GRAPPLE EQUAL PRESSES
	LDY #<(PLAYER_NO_LONGER_COLLIDED-1)                           ; SET DEFENDER COMMAND ADDR = PLAYER NO LONGER COLLIDED ADDRESS
	LDX #>(PLAYER_NO_LONGER_COLLIDED-1)                           ;
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP MAN_GRAPPLE_THROWS                                        ; JUMP->PLAYER THROWN ALL POSSIBLE OUTCOMES (0,3,6,6,11)+ TACKLE CHECK

@defense_wins_man_man_grapple_equal_presses:                      ; DEFENSE TIES MAN GRAPPLE EQUAL PRESSES
	LDY #<(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ; SET DEFENDER COMMAND ADDR = PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE 
	LDX #>(PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER-1)         ;
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER               ; JUMP->PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE  

_F}_MAN_VS_MAN_GRAPPLE

_F{_PLAYER_THROWN_RANDOMIZATION									  ; NEED ROLL ANIMATION ADDRESSES


PLAYER_THROWN_SHORT_0_3_6_CHK_TCKLE:                              ; PLAYER THROWN SHORT RAND (0,3,6)
	JSR UPDATE_RANDOM_1                                           ; UPDATE RANDOM $3B AND LOAD VALUE()
	CMP #$55                                                      ;
	BCC PLAYER_ON_GROUND_16_DIR                                   ; 33%-> PLAYER FLATTENED RANDOM DIRECTION + TACKLE CHECK
	CMP #$AB                                                      ;
	BCC FLY_BACK_8_DIR_3_YARDS                                    ; 33%->FLY BACK TO GROUND 8 POSSIBLE DIRECTIONS (~3 YARDS) + TACKLE CHECK
	JMP ROLLING_TUMBLE_16_DIR                                     ; 33%->ROLLING TUMBLE 16 POSSIBLE DIRECTIONS (~6 YARDS) + TACKLE CHECK
	

							
PLAYER_THROWN_MED_AFTER_DEF_POP:                                  ; PLAYER THROWN MEDIUM RAND(3,6,6,11)
	JSR UPDATE_RANDOM_2                                           ; UPDATE RANDOM $3C AND LOAD VALUE()
	CMP #$40                                                      ;
	BCC FLY_BACK_8_DIR_3_YARDS                                    ; 25%->FLY BACK TO GROUND 8 POSSIBLE DIRECTIONS (~3 YARDS) + TACKLE CHECK
	CMP #$80                                                      ;
	BCC ROLLING_TUMBLE_16_DIR                                     ; 25%->ROLLING TUMBLE 16 POSSIBLE DIRECTIONS (~6 YARDS) + TACKLE CHECK
	CMP #$C0                                                      ;
	BCS @longest_throw                                            ; 25%-> FLY BACK TO GROUND + ROLLING TUMBLE 8 POSSIBLE DIRECTIONS (~11 YARDS) + TACKLE CHECK 
	JMP FLY_BACK_8_DIR_6_YARDS                                    ; 25%-> FLY BACK TO GROUND 8 POSSIBLE DIRECTIONS (~6 YARDS) + TACKLE CHECK 
@longest_throw:                                                   ; 
	JMP FLY_BACK_AND_ROLL_TUMBLE_8_DIR                            ; JUMP->FLY BACK TO GROUND + ROLLING TUMBLE 8 POSSIBLE DIRECTIONS (~11 YARDS) + TACKLE CHECK


PLAYER_THROWN_LONG_LARGE_COM_POP:                                 ; PLAYER THROWN LONG RAND (6,6,11) + TACKLE CHECK
	JSR UPDATE_RANDOM_3                                           ; UPDATE RANDOM $3D AND LOAD VALUE()
	CMP #$55                                                      ;
	BCC ROLLING_TUMBLE_16_DIR                                     ; 33%->ROLLING TUMBLE 16 POSSIBLE DIRECTIONS (~6 YARDS) + TACKLE CHECK
	CMP #$AB                                                      ;
	BCC FLY_BACK_8_DIR_6_YARDS                                    ; 33%-> FLY BACK TO GROUND 8 POSSIBLE DIRECTIONS (~6 YARDS) + TACKLE CHECK 
	JMP FLY_BACK_AND_ROLL_TUMBLE_8_DIR                            ; 33%-> FLY BACK TO GROUND + ROLLING TUMBLE 8 POSSIBLE DIRECTIONS (~11 YARDS) + TACKLE CHECK

																; ***USED FOR MAN VS COM AND MAN VS MAN THROWS***
MAN_GRAPPLE_THROWS:                                               ; PLAYER THROWN ALL POSSIBLE OUTCOMES (0,3,6,6,11) + TACKLE CHECK
	JSR UPDATE_RANDOM_2                                           ; UPDATE RANDOM $3C AND LOAD VALUE()
	CMP #$33                                                      ; 
	BCC PLAYER_ON_GROUND_16_DIR                                   ; 20% ->PLAYER FLATTENED RANDOM DIRECTION + TACKLE CHECK
	CMP #$66                                                      ;
	BCC FLY_BACK_8_DIR_3_YARDS                                    ; 20% ->FLY BACK TO GROUND 8 POSSIBLE DIRECTIONS (~3 YARDS) + TACKLE CHECK
	CMP #$9A                                                      ;
	BCC ROLLING_TUMBLE_16_DIR                                     ; 20% -> ROLLING TUMBLE 16 POSSIBLE DIRECTIONS (~6 YARDS) + TACKLE CHECK
	CMP #$C0                                                      ;
	BCC FLY_BACK_8_DIR_6_YARDS                                    ; 15% ->FLY BACK TO GROUND 8 POSSIBLE DIRECTIONS (~6 YARDS) + TACKLE CHECK 
	JMP FLY_BACK_AND_ROLL_TUMBLE_8_DIR                            ; 25% ->FLY BACK TO GROUND + ROLLING TUMBLE 8 POSSIBLE DIRECTIONS (~11 YARDS) + TACKLE CHECK

PLAYER_ON_GROUND_16_DIR:                                          ; PLAYER FLATTENED RANDOM DIRECTION + TACKLE CHECK
	JSR IF_PLAYER_IS_BALL_CARRIER_TACKLE_OR_FUMBLE                ; CHECK FOR PLAYER IS IS BALL CARRIER, IF YES DO TACKLE CHECK() 
	LDA RANDOM_3                                                  ; SET PLAYER DIRECTION = RANDOM DIRECTION = ONE OF 16 POSSIBLE DIRECTIONS
	AND #$E0                                                      ; 
	SET_CUR_PLAYER_DIRECTION

PLAYER_ON_GRND_CHECK_TACKLE_IF_BALL_CARRIER:                      ; PLAYER FLATTENED,IF PLAYER BALL CARRIER CHECK FOR TACKLE
	JSR IF_PLAYER_IS_BALL_CARRIER_TACKLE_OR_FUMBLE                ; CHECK FOR PLAYER IS BALL CARRIER IF YES CHECK FOR TACKLE()

PLAYER_ON_GRND_NO_TACKLE_CHECK:                                   ; PLAYER FLATTENED 2 SEC GET UP DELAY, NO CHECK FOR TACKLE
	JSR PAUSE_COLL_CHECK_SET_PLAYER_NOT_COLL                      ; PAUSE COLLISION CHECK AND SET PLAYER COLLISION=NOT COLLIDED, ON GROUND()
	LDY #<(FLAT_ON_GROUND_SPRITE_DATA)                            ; SET SPR ADDR = LYING FLAT ON GROUND/DIVE 
	LDX #>(FLAT_ON_GROUND_SPRITE_DATA)                            ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 60
	LDA #$40                                                      ; LOAD 64 FRAMES
	JMP PLAYER_STANDING_UP                                        ; JUMP to PLAYER GET UP (A= FRAME DELAY TILL GET UP)

FLY_BACK_8_DIR_3_YARDS:                                           ; FLY BACK TO GROUND 8 POSSIBLE DIRECTIONS (~3 YARDS), CHECK FOR TACKLE
	JSR IF_PLAYER_IS_BALL_CARRIER_TACKLE_OR_FUMBLE                ; CHECK FOR PLAYER IS BALL CARRIER IF YES DO TACKLE CHECK
	JSR PAUSE_COLL_CHECK_SET_PLAYER_NOT_COLL                      ; PAUSE COLLISION CHECK AND SET PLAYER COLLISION=NOT COLLIDED, ON GROUND()
	LDA RANDOM_2                                                  ; SET PLAYER DIRECTION = PLAYER DIRECTION + RANDOOM (+135 to 225) = PLAYER THROWN BACKWARDS
	AND #$3F                                                      ; 
	LDY #CURRENT_DIRECTION                                        ; 
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ;
	ADC #$60                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE NEW DIRECTION
	LDY #<$B000                                                   ; SET TUMBLE ANIMATION TABLE ADDR = $B000
	LDX #>$B000                                                   ; 
	JMP DO_TUMBLE_ANIMATION_8_DIR[xy_addr]                        ; JUMP ->PLAYER THROWN ROLLING START (X,Y= TUMBLE POINTER TABLE)

ROLLING_TUMBLE_16_DIR:                                            ; ROLLING TUMBLE 16 POSSIBLE DIRECTIONS (~6 YARDS), CHECK FOR TACKLE
	JSR IF_PLAYER_IS_BALL_CARRIER_TACKLE_OR_FUMBLE                ; CHECK FOR PLAYER IS BALL CARRIER IF YES DO TACKLE CHECK
	JSR PAUSE_COLL_CHECK_SET_PLAYER_NOT_COLL                      ; PAUSE COLLISION CHECK AND SET PLAYER COLLISION=NOT COLLIDED, ON GROUND()
	LDA RANDOM_1                                                  ; SET PLAYER DIRECTION = PLAYER DIRECTION + RANDOOM (+135 to 225) = PLAYER THROWN BACKWARDS
	AND #$3F                                                      ; 
	LDY #CURRENT_DIRECTION                                        ; 
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ;
	ADC #$60                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE PLAYER DIRECTION
	LDY #<$B010                                                   ; SET TUMBLE ANIMATION TABLE ADDR = $B010
	LDX #>$B010                                                   ; 
	JMP DO_TUMBLE_ANIMATION_16_DIR[xy_addr]                       ; JUMP -> PLAYER THROWN ROLLING START (X,Y= TUMBLE POINTER TABLE)

FLY_BACK_8_DIR_6_YARDS:                                           ; FLY BACK TO GROUND 8 POSSIBLE DIRECTIONS (~6 YARDS), CHECK FOR TACKLE    

	JSR IF_PLAYER_IS_BALL_CARRIER_TACKLE_OR_FUMBLE                ; CHECK FOR PLAYER IS BALL CARRIER IF YES DO TACKLE CHECK
	JSR PAUSE_COLL_CHECK_SET_PLAYER_NOT_COLL                      ; PAUSE COLLISION CHECK AND SET PLAYER COLLISION=NOT COLLIDED, ON GROUND()
	LDA RANDOM_3                                                  ; SET PLAYER DIRECTION =  ONE OF 8 POSSIBLE RANDOM DIRECTIONS
	AND #$E0                                                      ; 
	SET_CUR_PLAYER_DIRECTION
	LDY #<$B030                                                    ; SET TUMBLE ANIMATION TABLE ADDR =$B030
	LDX #>$B030                                                    ;
	JMP DO_TUMBLE_ANIMATION_8_DIR[xy_addr]                        ; JUMP ->PLAYER THROWN ROLLING START (X,Y= TUMBLE POINTER TABLE)

FLY_BACK_AND_ROLL_TUMBLE_8_DIR:                                   ; FLY BACK TO GROUND + ROLLING TUMBLE 8 POSSIBLE DIRECTIONS (~11 YARDS), CHECK FOR TACKLE     


	JSR IF_PLAYER_IS_BALL_CARRIER_TACKLE_OR_FUMBLE                ; CHECK FOR PLAYER IS BALL CARRIER IF YES DO TACKLE CHECK()
	JSR PAUSE_COLL_CHECK_SET_PLAYER_NOT_COLL                      ; PAUSE COLLISION CHECK AND SET PLAYER COLLISION=NOT COLLIDED, ON GROUND()
	LDA RANDOM_3                                                  ; SET PLAYER DIRECTION = ONE OF 8 POSSIBLE RANDOM DIRECTIONS
	AND #$E0                                                      ;
	SET_CUR_PLAYER_DIRECTION
	LDY #<$B040                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B040
	LDX #>$B040                                                   ;
	JMP DO_TUMBLE_ANIMATION_8_DIR[xy_addr]                        ; JUMP->PLAYER THROWN ROLLING START (X,Y= TUMBLE POINTER TABLE)

DO_CHOP_BLOCK_TUMBLE:                                             ; CHOP BLOCK TUMBLE ANIMATION(6-9 YARDS), CHECK FOR TACKLE
					
	JSR IF_PLAYER_IS_BALL_CARRIER_TACKLE_OR_FUMBLE                ; CHECK FOR PLAYER IS BALL CARRIER IF YES DO TACKLE CHECK()
	JSR PAUSE_COLL_CHECK_SET_PLAYER_NOT_COLL                      ; PAUSE COLLISION CHECK AND SET PLAYER COLLISION=NOT COLLIDED, ON GROUND()
	LDY #<$B050                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B050
	LDX #>$B050                                                   ;
	JMP DO_TUMBLE_ANIMATION_8_DIR[xy_addr]                        ; JUMP->PLAYER THROWN ROLLING START (X,Y= TUMBLE POINTER TABLE)

_F}_PLAYER_THROWN_RANDOMIZATION

_F{_UNUSED_THROWS												  ; NEED UNUSED TUMBLE ANIMATION ADDRESSES	

UNUSED_TUMBLE_ONE:                                                ; LEFT OR RIGHT 5 YARDS  ***UNUSED
	LDY #<$B060                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B060
	LDX #>$B060                                                   ;
	JMP DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]                ; JUMP->TUMBLE ANIMATION 2 DIRECTIONS ONLY(X,Y= TUMBLE POINTER TABLE)

UNUSED_TUMBLE_TWO:                                                        ; UP OR DOWN 7 YARDS  ***UNUSED
	LDY #<$B064                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B064
	LDX #>$B064                                                   ; 
	JMP DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]                ; JUMP->TUMBLE ANIMATION 2 DIRECTIONS ONLY(X,Y= TUMBLE POINTER TABLE)

UNUSED_TUMBLE_THREE:                                                        ; UP-RIGHT OR UP-LEFT 2 YARDS  ***UNUSED
	LDY #<$B068                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B068
	LDX #>$B068                                                   ;
	JMP DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]                ; JUMP->TUMBLE ANIMATION 2 DIRECTIONS ONLY(X,Y= TUMBLE POINTER TABLE)

		
UNUSED_TUMBLE_FOUR:                                                        ; DOWN 2 YARDS    ***UNUSED
	LDY #<$B06C                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B068
	LDX #>$B06C                                                   ;
	JMP DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]                ; JUMP->TUMBLE ANIMATION 2 DIRECTIONS ONLY(X,Y= TUMBLE POINTER TABLE)

UNUSED_TUMBLE_FIVE:                                                         ; UNFINISHED PLAYER TOSS ANIMATION  ***UNUSED
	LDY #<$B070                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B070
	LDX #>$B070
	JMP DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]                ; JUMP TO ROLL ANIMATION WITH DIRECTION FOR ANIMATION SET TO LEFT OR RIGHT()

UNUSED_TUMBLE_SIX:                                                         ; UNFINISHED PLAYER TOSS ANIMATION ***UNUSED
	LDY #<$B074                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B074 
	LDX #>$B074                                                   ;
	JMP DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]                ; JUMP->TUMBLE ANIMATION 2 DIRECTIONS ONLY(X,Y= TUMBLE POINTER TABLE)

UNUSED_TUMBLE_SEVEN:                                                         ; UNFINISHED PLAYER TOSS ANIMATION ***UNUSED
	LDY #<$B078                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B078
	LDX #>$B078                                                   ;
	JMP DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]                ; JUMP->TUMBLE ANIMATION 2 DIRECTIONS ONLY(X,Y= TUMBLE POINTER TABLE)
	
UNUSED_TUMBLE_EIGHT:                                              ; UNFINISHED PLAYER TOSS ANIMATION ***UNUSED
	LDY #<$B07C                                                   ; SET TUMBLE ANIMATION TABLE ADDR =$B07C
	LDX #>$B07C                                                   ;
	JMP DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]                ; JUMP->TUMBLE ANIMATION 2 DIRECTIONS ONLY(X,Y= TUMBLE POINTER TABLE)

_F}_UNUSED_THROWS

_F{_CHECK_FOR_TACKLE_OR_FUMBLE									  ; DONE

skill_player_position_bitmask		= $0F
special_teams_starter_id			= LOCAL_8

IF_PLAYER_IS_BALL_CARRIER_TACKLE_OR_FUMBLE:                       ; CHECK FOR PLAYER IS BALL CARRIER IF YES DO TACKLE CHECK()
	IF_CURRENT_PLAYER_BALL_CARRIER[ADDR] CHECK_FOR_TACKLE_OR_FUMBLE

@ELSE:
	RTS                                                           ; RETURN

tackler_addr = LOCAL_1
	
CHECK_FOR_TACKLE_OR_FUMBLE:                                       ; PLAYER TACKLED, CHECK FOR FUMBLE OR PLAY OVER
	PLA                                                           ; REMOVE RETURN ADDRESS
	PLA                                                           ; 
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; GET OPPOSING/CLOSEST DEFENDER STICK ADDRESS INTO 3E 3F
	LDY #POSITION_ID                                              ;
	LDA (tackler_addr),Y                                          ; LOAD DEFENDER ID
	ORA #TACKLED_PLAYER_BITFLAG                                   ;
	STA TACKLER_ID                                                ; SAVE TACKLER 
	LOAD_CUR_PLAYER_COLLISION_STATUS                              ; 
	ORA #PLAYER_ON_GROUND_BITMASK                                 ;  
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; SET PLAYER MOVEMENT  = PLAYER NOT BALL CARRIER
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	AND #PLAYER_NOT_BALL_CARRIER_BITMASK                          ;  
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = PLAY OVER/OOB
	BMI @play_over_player_tackled                                 ; YES->PLAY OVER

@check_for_prior_fumble:
	LDA BALL_STATUS_SPECIAL                                       ; DOES SPECIAL BALL STATUS = BALL RECOVERED?
	AND #BALL_RECOVERED_BITFLAG                                   ;  
	BNE @play_over_player_tackled                                 ; YES->PLAY OVER
	
	LOAD_CUR_PLAYER_POSITION_ID
	TAX                                                           ; 
	

	
@fumble_logic_start:                                              ; START OF FUMBLE CHECK LOGIC
	LDA POSSESSION_STATUS                                         ; IS PLAY TYPE = XP/FG?
	AND #FG_XP_PUNT_BITMASK                                       ; 
	CMP #FG_XP_ATT_BITMASK                                           ; 

@play_is_xp:	
	BCS @play_over_player_tackled                                 ; YES->PLAY OVER

@check_for_kickoff_punt:	
	CMP #KICKOFF_BITMASK                                          ; IS PLAY TYPE =  KICKOFF/PUNT?
	BCS @kickoff_pr_fumble_check                                  ; YES->FUM CHECK FOR KICKOFF/ PUNT RETURN

@check_player_type:	
	TXA                                                           ; IS BALL CARRIER  =  DEFENDER? 
	EOR POSSESSION_STATUS                                         ; 
	
@if_player_is_defender:	
	BMI @qb_def_pr_fumble_check                                   ; YES-> QB,OL,DEF,PR FUMBLE CHECK

@check_if_player_is_qb:	
	TXA                                                           ; IS BALL CARRIER  =  QB?
	AND #skill_player_position_bitmask                             ; 
	BEQ @qb_def_pr_fumble_check                                   ; YES-> QB,OL,DEF,OL,PR SKILL FUMBLE CHECK

@check_if_player_is_OL:
	CMP #C_POSITION_ID                                            ; IS BALL CARRIER ID  =  OL?
	BCS @qb_def_pr_fumble_check                                   ; YES-> QB,OL,DEF,PR FUMBLE CHECK

@get_skill_player_starter_id:	
	TXA                                                           ; LOAD BALL CARRIER POSITION ID
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID                          ; GET ACTUAL PLAYER AND TEAM(A=POSITION ID) RET X=TEAM A= PLAYER 
	JMP @skill_player_kr_fumble_check                             ; JUMP ->SKILL PLAYER, KR FUMBLE  CHECK

@kickoff_pr_fumble_check:                                         ; FUM CHECK FOR KICKOFF/ PUNT RETURN
	CMP #$0A                                                      ; IS PUNT? *** could change to 0C to make more sense  
	BCS @qb_def_pr_fumble_check                                   ; YES->QB,DEF,PR SKILL PLAYER FUMBLE CHECK

@convert_kr_to_starter_id:
	ORA #$10                                                      ; OFFSET TO KR ** could just load KR STARTER ID
	STA special_teams_starter_id                                  ; 
	TXA                                                           ; LOAD BALL CARRIER POSITION ID
	AND #$80                                                      ;
	ORA special_teams_starter_id                                  ; 
	JSR GET_TEAM_AND_STARTER_FROM_STARTER_ID                      ; GET STARTER ID AND TEAM ID (A= POSITION ID)

@skill_player_kr_fumble_check:                                    ; SKILL PLAYER, KR FUMBLE  CHECK
	LDY #BALL_CONTROL_INDEX                                       ; SET SKILL INDEX = BALL CONTROL
	JSR GET_PLAYER_SKILL_OR_FACE                                  ; GET SKILL RATING(A=PLAYER, Y=SKILL TO GET, X=TEAM)
	TAY                                                           ; 
	LDA RANDOM_3                                                  ; IS RAND # > BALL CONTROL VALUE FROM BALL CONTROL TABLE
	CMP BALL_CONTROL_VALUES_TABLE,Y                               ; 
	BCS @play_over_player_tackled                                 ; YES-> PLAY OVER
	JMP @do_fumble                                                ; NO-> FUMBLE START *** could use CC instead of jump

@qb_def_pr_fumble_check:                                          ; QB,OL DEF,PR FUMBLE CHECK
	LDA RANDOM_3                                                  ; IS RAND# > 12 = 4.6% CHANCE OF FUMBLE
	CMP #QB_DEFENDER_FUMBLE_CHANCE                                ; 
	BCS @play_over_player_tackled                                 ; YES->PLAY OVER

@do_fumble:                                                       ; FUMBLE START
	SET_CURRENT_PLAYER_NOT_BALL_CARRIER[]
	JSR SET_BALL_FUMBLED_DO_FUMBLE_ANI                            ; STORE FUMBLED BALL CODE AND START FUMBLE TASK
	JMP PLAYER_ON_GRND_NO_TACKLE_CHECK                            ; JUMP to PLAYER FLATTENED 2 SECOND GET UP DELAY, NO CHECK FOR TACKLE

@play_over_player_tackled:                                        ; PLAY OVER
	SET_PLAY_STATUS_PLAY_OVER[] 
	JMP PLAYER_ON_GRND_NO_TACKLE_CHECK                            ; JUMP -> PLAYER FLATTENED 2 SEC GET UP DELAY, NO CHECK FOR TACKLE

_F}_CHECK_FOR_TACKLE_OR_FUMBLE

_F{_SWAP_CURRENT_TARGET_PLAYER									  ; DONE

player_collided_with = EXTRA_PLAYER_RAM_4
target_player_addr  = LOCAL_1

SAVE_LOCAL_PLAYER_IN_CURRENT_PLAYER_RAM:                          ; SAVE TARGET PLAYER POINTER ($3E,3F) IN CURRENT PLAYER ($AE,AF) RAM $1E/1F
	LDY #player_collided_with                                     ; 
	LDA target_player_addr                                        ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; 
	LDA target_player_addr +1                                     ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RTS                                                           ; RETURN

SAVE_CURRENT_PLAYER_IN_LOCAL_PLAYER_RAM:                          ; STORE CURRENT PLAYER POINTER ($AE,AF) IN TARGET ($3E,3F) PLAYER RAM $1E/1F
	LDY #player_collided_with                                     ; 
	LDA CURRENT_PLAYER_ADDR                                       ; 
	STA (target_player_addr),Y                                    ;  
	INY                                                           ; 
	LDA CURRENT_PLAYER_ADDR +1                                    ; 
	STA (target_player_addr),Y                                    ;
	RTS                                                           ; RETURN
	
_F}_SWAP_CURRENT_TARGET_PLAYER	

_F{_PLAYER_GETTING_UP_OR_NOT_COLLIDED							  ; DONE

PLAYER_SHAKING_HEAD_GET_OFF_GROUND:                               ; PLAYER SHAKING HEAD AND GET UP (1.5 Seconds)
	LDY #<(PLAYER_SHAKING_HEAD_SPRITE_INFO)                       ; SET ADDR = PLAYER SHAKING HEAD ADDRESS
	LDX #>(PLAYER_SHAKING_HEAD_SPRITE_INFO)                       ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] PLAYER_SHAKE_HEAD_DELAY_FRAMES
	LDA #PLAYER_GET_UP_DELAY_FRAMES                               ; LOAD 32 frames (0.53 seconds) 

PLAYER_STANDING_UP:                                               ; PLAYER GET UP (A= GET UP DELAY IN FRAMES)
	PHA                                                           ; SAVE FRAMES 
	LDY #<(PLAYER_STANDING_UP_SPRITE_INFO)                        ; SET ADDR =  PLAYER STANDING UP ADDR
	LDX #>(PLAYER_STANDING_UP_SPRITE_INFO)                        ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR
	PLA                                                           ; LOAD PLAYER STAND UP DELAY 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)

PLAYER_NO_LONGER_COLLIDED:                                        ; PLAYER NO LONGER COLLIDED
	IF_PLAY_TOUCHDOWN[ADDR] PLAYER_NOT_COLLIDED_TD

	LOAD_CUR_PLAYER_COLLISION_STATUS 
	AND #PLAYER_NOT_COLLIDED_BITMASK                              ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #COLLISION_COUNTER                                        ; SET COLLISION COUNTER = 5 FRAMES
	LDA #PLAYER_NOT_COLLIDED_COL_CHECK_DELAY                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; SET CURRENT COLLISION CHECK ADDRESS = COLLISION CHECK START ADDRESS ($8145) 
	LDA #<(RESET_CURRENT_SPEED_RP_TO_INITIAL_VALUES-1)            ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; 
	LDA #>(RESET_CURRENT_SPEED_RP_TO_INITIAL_VALUES-1)            ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;      
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 4

PLAYER_NOT_COLLIDED_TD:                                           ; CLEAR COLLISION AND CHOP and DO NEXT COMMAND       
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; SET PLAYER MOVEMENT = NOT DIVING/ NOT CHOPPING
	AND #PLAYER_NOT_CHOP_NOT_DIVE_BITMASK                         ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	DEY                                                           ;   
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; DOES PLAYER COLLISION VALUE = CAN COLLIDE WITH BALL
	AND #CAN_KICK_BALL_BITFLAG                                    ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BEQ @do_next_command                                          ; NO-> DO NEXT PLAYER COMMAND
	JSR SET_PLAYER_CANT_KICK_BALL                                 ; SET PLAYER COLLISION TO CAN’T COLLIDE WITH BALL()

@do_next_command:                                                 ; DO NEXT PLAYER COMMAND
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP ->DO NEXT PLAYER COMMAND    

_F}_PLAYER_GETTING_UP_OR_NOT_COLLIDED


_F{_PLAYER_COMMAND_LENGTH_TABLES                                  ; DONE
	
MULTI_PLAYER_COMMAND_LENGTH_TABLE:                                ; MULTI PLAYER COMMAND LENGTH TABLE
	.DB $02,$02,$03,$01,$01,$01,$01,$01,$01,$FF,$01,$03

SINGLE_PLAYER_COMMAND_LENGTH_TABLE:                               ; SINGLE PLAYER COMMAND LENGTH
	.DB $03,$04,$00,$00,$02,$02,$00,$03,$04,$01,$03,$00,$01,$03,$03,$03
	.DB $03,$03,$01,$01,$01,$01,$01,$03,$03,$03,$01,$01,$01,$01,$01,$01
	.DB $02,$02,$02,$02,$00,$01,$01,$01,$01,$01,$01,$02,$01,$02,$01,$01
	.DB $02,$01,$01,$02,$02,$03,$02,$02,$03,$01,$01,$01,$03,$03,$00,$00

_F}_PLAYER_COMMAND_LENGTH_TABLES 


_F{_MAN_COVERAGE_COMMAND										  ; DONE

player_to_defend  			= PLAYER_COMMAND_ARG1
defend_time   				= PLAYER_COMMAND_ARG2 
looser_coverage_flag 		= $80

player_to_defend_index		= EXTRA_PLAYER_RAM_1
defend_time_index			= EXTRA_PLAYER_RAM_3	

MAN_COVERAGE_TIGHT_COMMAND_START:                                 ; 0X MAN VS MAN PASS DEFENSE WITH TIME 
	LDA player_to_defend                                          ; LOAD PLAYER TO DEFEND

SET_MAN_COVERAGE_DEFEND_TIME:                                     ; SAVE PLAYER TO DEFEND AND TIME
	LDY #player_to_defend_index                                   ; SAVE PLAYER TO DEFEND  IN PLAYER RAM 0B
	STA (CURRENT_PLAYER_ADDR),Y                                   ;  
	LDA defend_time                                               ; SAVE MAN VS MAN TIME  IN PLAYER RAM 1D
	LDY #defend_time_index                                        ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JMP DEFNDER_MAN_TO_MAN_PASS_COVERAGE_START                    ; JUMP to DEFENDER COVER MAN LOGIC START

MAN_COVERAGE_LOOSE_COMMAND_START:                                 ; 1X MAN VS MAN DEFENSE WITH TIME (DIFFERENCE NOT NOTICEABLE)
	LDA player_to_defend                                          ; LOAD PLAYER TO DEFEND
	ORA #looser_coverage_flag                                     ; 
	JMP SET_MAN_COVERAGE_DEFEND_TIME                              ; JUMP to SAVE PLAYER TO DEFEND AND TIME

_F}_MAN_COVERAGE_COMMAND	

_F{_RANDOM_ACTION_COMMAND										  ; DONE
random_chance 			= PLAYER_COMMAND_ARG1
script_addr 			= PLAYER_COMMAND_ARG2
																  ; 00 = do next command always, 0F= do jump command 
RANDOM_COMMAND_START:                                             ; 2X RANDOM BRANCHING TO DIFFERENT PLAY COMMAND
	LDA RANDOM_1                                                  ; MAKE RAND # RANGE 0-15
	AND #$0F                                                      ; 
	CMP random_chance                                             ; IS RANDOM # (0-15) < PLAY COMMAND ARGUMENT
	BCC @do_next_script_command                                   ; YES-> JUMP TO PROCESS NEXT INSTRUCTION AFTER 1 FRAME 
							
@jump_to_other_script_instruction:
	LDY #PLAY_CODE_ADDR                                           ; SET PLAYER COMMAND ADDRESS = NEW ADDR
	LDA script_addr                                               ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA script_addr+1                                             ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
@do_next_script_command:                                          ; PROCESS NEXT INSTRUCTION AFTER 1 FRAME   
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP ->DO NEXT PLAYER COMMAND 

_F}_RANDOM_ACTION_COMMAND

_F{_BLOCK_COMMAND										          ; DONE

pos_id_to_block 			= PLAYER_COMMAND_ARG1	
pos_id_to_block_index		= EXTRA_PLAYER_RAM_3

BLOCK_COMMAND_START:                                              ; 3X BLOCK PLAYER COMMAND
	LDA pos_id_to_block                                           ; LOAD PLAYER TO BLOCK 

BLOCK_PLAYER:                                                     ; BLOCK PLAYER (A= [PLAYER TO BLOCK)
	LDY #pos_id_to_block_index                                    ; SAVE PLAYER TO BLOCK in PLAYER RAM $1D
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR SET_PLAYER_ABLE_TO_COLLIDE_SINGLE_DEFENDER                       ; UPDATE CAN COLLIDE STATUS (A= PLAYER TO BLOCK) 
	
_WHILE ALWAYS

@check_player_ready_to_block	
	LDA #UPDATE_BLOCKER_DIRECTION_DELAY                         ; SET BLOCK DELAY = 8 FRAMES (RANGE 8-11 DUE TO NEXT INSTRUCTION)
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                          
	LDY #pos_id_to_block_index                                    ; LOAD PLAYER TO BLOCK 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET TARGET PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	JSR WAIT_FOR_TARGET_OFF_GROUND_NOT_DIVING                     ; WAIT FOR PLAYER TO STOP DIVING OR BE OFF GROUND TO BLOCK()
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASED ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F)
	BCS @check_player_ready_to_block                              ; SHOULD BE IMPOSSIBLE TO REACH. FOR GLITCHES?

@update_player_direction:	
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION() 
	
_END_WHILE

_F}_BLOCK_COMMAND

_F{_CHOP_BLOCK_COMMAND										      ; DONE
pos_id_to_chop 				= PLAYER_COMMAND_ARG1	
pos_id_to_chop_index		= EXTRA_PLAYER_RAM_3

CHOP_BLOCK_COMMAND_START:                                         ; 4X CHOP BLOCK 
	LDA pos_id_to_block                                           ; SAVE PLAYER TO CHOP in PLAYER RAM $1D
	LDY #pos_id_to_block_index                                    ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR SET_PLAYER_ABLE_TO_COLLIDE_SINGLE_DEFENDER                ; UPDATE CAN COLLIDE STATUS ROUTINE(A= PLAYER TO BLOCK)
	LDY #pos_id_to_block_index                                    ; LOAD PLAYER TO CHOP
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	JSR SET_OFF_CAN_CHOP_BLOCK_STATUS                             ; UPDATE DEFENDER STATUS TO CAN COLLIDE(A= PLAYER)
	JMP CHOP_BLOCK_LOGIC_LOOP                                     ; JUMP -> CHOP BLOCK START 

_F}_CHOP_BLOCK_COMMAND	

_F{_HANDOFF_COMMANDS										      ; DONE	

handoff_position_id 				= PLAYER_COMMAND_ARG1
fake_handoff_bit_flag				= $80	
	
HANDOFF_COMMAND_START:                                            ; 5X HANDOFF COMMAND
	LDA handoff_position_id                                       ; LOAD PLAYER TO HANDOFF TO
	JMP HANDOFF_COMMAND_LOGIC                                     ; JUMP -> HANDOFF START

FAKE_HANDOFF_COMMAND_START:                                       ; 6X FAKE HANDOFF COMMAND
	LDA handoff_position_id                                       ; LOAD PLAYER TO FAKE TO
	ORA #fake_handoff_bit_flag                                    ; SET HANDOFF TYPE =  FAKE HANDOFF
	JMP HANDOFF_COMMAND_LOGIC                                     ; JUMP -> HANDOFF START

_F}_HANDOFF_COMMANDS	

_F{_PITCH_BALL_COMMAND										      ; DONE

pitch_position_id 				= PLAYER_COMMAND_ARG1
PLAYER_RAM_PITCH_ID_INDEX		= EXTRA_PLAYER_RAM_3
								
PITCH_BALL_COMMAND_START:                                         ; 7x PITCH COMMAND
	LDA pitch_position_id                                         ; SAVE PLAYER TO PITCH TO IN RAM 1D
	LDY #PLAYER_RAM_PITCH_ID_INDEX                                ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JMP PITCH_COMMAND_LOGIC                                       ; JUMP -> PITCH START

_F}_PITCH_BALL_COMMAND	
	
_F{_MIRROR_OFF_MOTION_PRE_SNAP_COMMAND							  ; DONE	

position_id_to_mirror 				= PLAYER_COMMAND_ARG1
PLAYER_RAM_MIRROR_ID_INDEX			= EXTRA_PLAYER_RAM_3
target_addr							= LOCAL_1

DEFENDER_FOLLOW_OFF_PRE_SNAP_DELAY	= $09 
DEFENDER_NEAR_MOTION_PLAYER_Y_LIMIT	= $0A
	
PRE_SNAP_MOTION_COMMAND_START:                                    ; 8X PRE-SNAP DEFENDER FOLLOWS PLAYER MOTION
	LDA position_id_to_mirror                                     ; SAVE PLAYER TO FOLLOW in PLAYER RAM 1D
	LDY #PLAYER_RAM_MIRROR_ID_INDEX                               ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 

PLAYER_FOLLOW_LOOP:                                               ; FOLLOW OFFENSIVE PLAYER PRESNAP LOOP
	_WHILE PLUS

	LDA #DEFENDER_FOLLOW_OFF_PRE_SNAP_DELAY                       ; LOAD 9 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                          
	
	IF_BALL_SNAPPED[ADDR] EXIT_FOLLOW_MOTION
	LDY #PLAYER_RAM_MIRROR_ID_INDEX                               ; LOAD PLAYER TO FOLLOW
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDY #Y_POS + 1                                                ; LOAD TARGET Y POSITION 
	LDA (target_addr),Y                                           ; 
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; =TARGET Y LOCATION – DEFENDER Y LOCATION
	CLC                                                           ;
	ADC #$05                                                      ;  
	CMP #DEFENDER_NEAR_MOTION_PLAYER_Y_LIMIT                      ; DEFENDER WITHIN  +/- 0.5 YARD (Y-AXIS)?
	BCS @move_defender_towards_target                             ; NO-> MOVE DEFENDER
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER MOVING? 
	
	_END_WHILE
	
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT                           ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	SET_CUR_PLAYER_DIRECTION
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	JMP PLAYER_FOLLOW_LOOP                                        ; JUMP->FOLLOW OFFENSIVE PLAYER PRESNAP LOOP

@move_defender_towards_target:                                    ; MOVE DEFENDER IN Y DIRECTION
	LDA (target_addr),Y                                           ; SET DEFENDER DIRECTION = UP OR DOWN BASED ON TARGET LOCATION 
	CMP (CURRENT_PLAYER_ADDR),Y                                   ;   
	LDA #$80                                                      ;
	ROR                                                           ;
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)    
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	JMP PLAYER_FOLLOW_LOOP                                         ; JUMP-> FOLLOW OFFENSIVE PLAYER PRESNAP LOOP

EXIT_FOLLOW_MOTION:                                                           ; EXIT
	LDA #$01                                                      ; LOAD 1 FRAME
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                          
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND

_F}_MIRROR_OFF_MOTION_PRE_SNAP_COMMAND

_F{_COM_PASS_COMMAND_START										  ; DONE

number_of_targets		= PLAYER_COMMAND_ARG1	
	
play_code_ptr_temp  	= LOCAL_1 
pass_chance_random		= LOCAL_6

offset_to_next_command	= $04
first_target_index			= $00
	
COM_PASS_COMMAND_START:                                           ; 9X COM PASS COMMAND
																  ; CHECK FOR QB HAS BALL
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER BALL CARRIER 
	AND #PLAYER_BALL_CARRIER_BITFLAG                              ; 
	BNE @qb_has_ball_can_pass                                     ; YES->QB HAS BALL
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP COM_PASS_COMMAND_START                                    ; *** could fix this 

@qb_has_ball_can_pass:                                            ; QB HAS BALL
	LDX #OFF_PLAYER_SCRIPTS_BANK                                  ; SET BANK = BANK 5 = OFFENSIVE COMMAND BANK
	JSR SWAP_A000_BANK                                            ; SWAP A000 BANK (X= BANK TO SWAP TO)
	LDY number_of_targets                                         ; LOAD NUMBER OF PASS TARGETS-1 
	INY                                                           ;
	INY                                                           ; SAVE LAST RECEIVER TO CHECK ADDRESS IN EB,EC
	LDA (play_code_ptr_temp),Y                                    ; 
	STA TARGET_PLAY_CODE_ADDR                                     ; Typically saving B248 play code = man/com control 
	INY                                                           ;
	LDA (play_code_ptr_temp),Y                                    ;
	STA  TARGET_PLAY_CODE_ADDR +1                                 ; 
	LDA RANDOM_1                                                  ; LOAD RANDOM NUMBER 3B              
	AND #$F0                                                      ; make random 10-F0
	CLC                                                           ;
	ADC #$10                                                      ;
	STA pass_chance_random                                        ; SAVE in $43
	LDY #first_target_index	                                      ; SET CURRENT TARGET INDEX = FIRST TARGET

@check_if_target_thrown_to	

_WHILE CC                                                         ; CHECK WR’s TO SEE IF THROWN TO
	INY                                                           ; CURRENT TARGET INDEX ++
	LDA (play_code_ptr_temp),Y                                    ; LOAD TARGET THROW CHANCE + PLAYER TO THROW TO
	AND #$F0                                                      ; MASK OUT PLAYER TO THROW TO
	ORA #$08                                                      ; 
	CLC                                                           ;
	ADC pass_chance_random                                        ; 
	STA pass_chance_random                                        ; WR CHANCE + RANDOM > 255 SETS CARRY
	
_END_WHILE                                                        ; PLAYER THROWN TO? NO-> CHECK WR’s TO SEE IF THROWN TO
	
@throw_to_target:	
	LDA (play_code_ptr_temp),Y                                    ; LOAD WR THROW CHANCE + PLAYER TO THROW TO
	AND #$0F                                                      ; MASK OUT WR THROW CHANCE NIBBLE
	TAY                                                           ; SAVE PLAYER TO THROW TO IN Y 
	LDX #PLAYER_SCRIPT_COMMANDS_LOGIC_BANK_2                      ; LOAD BANK 22
	JSR SWAP_A000_BANK                                            ; SWAP A000-BFFF BANK (X= BANK TO SWAP IN)   
	TYA                                                           ; LOAD TARGET POSITION ID
	JSR GET_TARGET_RAM_ADDR_AND_SAVE_IN_LOCAL                     ; GET PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDA number_of_targets                                         ; LOAD NUMBER OF RECEIVERS-1
	CLC                                                           ;
	ADC #offset_to_next_command	                                  ; = NUMBER OF RECEIVERS-1+ 4 BYTES
	JSR UPDATE_CUR_PLAYER_PLAY_CODE_ADDR_BY_AMT                   ; UPDATE CURRENT PLAY CODE ADDRESS (A= Number of bytes) 
	JSR START_OF_PASS_ATTEMPT                                     ; DO PASS ATTEMPT ROUTINE 
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND
	
_F}_COM_PASS_COMMAND_START	

_F{_ROUTE_ORDER_COMMAND											  ; DONE
	
target_priority = PLAYER_COMMAND_ARG1
first_target = $01
	
SET_TARGET_ORDER_COMMAND:                                         ; AX ROUTE COMMAND 
	LDX target_priority                                           ; LOAD ROUTE #
	LOAD_CUR_PLAYER_POSITION_ID 
	STA PASS_TARGETS,X                                            ; SAVE PLAYER INTO PASS TARGET ARRAY
	CPX #$00                                                      ; IS TARGET = FIRST TARGET?
	BNE @exit                                                     ; NO-> EXIT
	LDA #first_target                                             ; YES-> SET PLAYER TARGET INDEX  to FIRST TARGET  
	STA CURRENT_PASS_TARGET                                       ; SAVE FIRST TARGET in CURRENT PASS TARGET
@exit:                                                            ; EXIT
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND
	
_F}_ROUTE_ORDER_COMMAND 

_F{_SET_KICKOFF_LOC_MOD_KICKOFF_COMMMANDS						  ; DONE

set_or_move_kickoff 				= PLAYER_COMMAND_ARG1
move_multiplier						= PLAYER_COMMAND_ARG1

y_snap_loc_kickoff					= PLAYER_COMMAND_ARG2
y_move_loc_kickoff					= PLAYER_COMMAND_ARG2

x_snap_loc_kickoff					= PLAYER_COMMAND_ARG3
x_move_loc_kickoff 					= PLAYER_COMMAND_ARG3
x_snap_loc_save     				= PLAYER_COMMAND_ARG2

x_kickoff_snap_distance_bitmask  	= $03

kickoff_move_multi_player_ram_index	= EXTRA_PLAYER_RAM_3
kickoff_y_move_player_ram_index		= EXTRA_PLAYER_RAM_4
kickoff_x_move_player_ram_index		= EXTRA_PLAYER_RAM_5



x_dist_to_move_temp					= LOCAL_5
y_dist_to_move_temp					= LOCAL_7

SET_AND_MOVE_KICKOFF_COMMAND_START:                               ; B0,B1 SET POSITION BEFORE KICKOFF
	LDA set_or_move_kickoff                                       ; DOES ARGUMENT = 0X04
	CMP #$04                                                      ; 
	BCS @move_player_during_kickoff_command_start                 ; YES-> JUMP TO B4 COMMAND MOVE PLAYER DURING KICKOFF

@set_player_location_kickoff:	
	AND #x_kickoff_snap_distance_bitmask                          ;
	TAX                                                           ; SET X= X DISTANCE MODIFIER = HIGH BYTE DISTANCE 
	LDA y_move_loc_kickoff                                        ; A= Y DISTANCE + LOS Y
	LDY x_snap_loc_kickoff                                        ; SAVE X DISTANCE IN $DD
	STY x_snap_loc_save                                           ;
	CLC                                                           ;
	ADC LOS_Y                                                     ; + LINE OF SCRIMMAGE Y 
	JMP SET_PLAYER_SNAP_LOC_RELATIVE_TO_LOC                       ; JUMP TO SET PLAYER LOCATION RELATIVE TO LOS(DD= X DISTANCE LOW, A= Y LOCATION, X = X HIGH BYTE DISTANCE)

@move_player_during_kickoff_command_start:                        ; B4 COMMAND MOVE PLAYER RELATIVE TO BALL DURING KICKOFF
	LDA move_multiplier	                                          ; SAVE MOVE MULTIPLIER DURING KICKOFF SHOULD ALWAYS BE 0. 
	LDY #kickoff_move_multi_player_ram_index                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; 
	LDA y_move_loc_kickoff                                        ; SAVE Y LOCATION TO MOVE RELATIVE TO BALL
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ; SAVE X LOCATION TO MOVE RELATIVE TO BALL
	LDA x_move_loc_kickoff                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	
_WHILE EQUAL                                                      ; CHECK FOR BALL KICKED LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = BALL KICKED
	AND #$02                                                      ; 

_END_WHILE

@set_y_dist_to_move_kickoff:
	LDY #kickoff_y_move_player_ram_index                          ; Y DISTANCE LEFT TO TO MOVE ($44,45) = Y LOCATION TO MOVE RELATIVE TO BALL – CURRENT Y LOCATION
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDY #Y_POS + 1                                                ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA y_dist_to_move_temp	                                      ;
	LDA #$00                                                      ;
	SBC #$00                                                      ;
	STA y_dist_to_move_temp	+1                                    ;
	
@set_x_dist_to_move_kickoff:	
	LDY #kickoff_x_move_player_ram_index                          ; TEMP X DISTANCE LEFT TO MOVE LOW = X LOCATION LOW TO MOVE RELATIVE TO BALL – CURRENT X LOCATION LOW
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA  x_dist_to_move_temp	                                 ;
	LDY #kickoff_move_multi_player_ram_index                      ; IS DISTANCE MODIFIER <03
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	AND #$03                                                      ; SHOULD ALWAYS BE 0 
	CMP #$02                                                      ;
	BCC @save_x_high_byte                                         ; YES-> KICKOFF DISTANCE MODIFIER < 3

@add_kick_off_distance_modifier: 	
	ADC #$FB                                                      ; 

@save_x_high_byte:                                                ; KICKOFF DISTANCE MODIFIER < 3
	STA x_dist_to_move_temp + 1                                  ;
	LOAD_CUR_PLAYER_POSITION_ID
	BPL @set_final_x_location                                     ; YES->SET FINAL LOCATIONS TO MOVE TO

@p2_invert_x_location
	LDA #$00                                                      ; IF PLAYER 2,  X LOCATION = 1- X LOCATION
	SEC                                                           ;
	SBC x_dist_to_move_temp                                       ;
	STA x_dist_to_move_temp                                       ;
	LDA #$00                                                      ;
	SBC x_dist_to_move_temp +1                                    ;
	STA x_dist_to_move_temp +1                                    ;
	



@set_final_x_location:                                            ; SET FINAL LOCATIONS TO MOVE TO

kickoff_x_move_player_ram_index		= EXTRA_PLAYER_RAM_4		  ;

	LDY #kickoff_x_move_player_ram_index	                                                      ;
	LDA FINAL_BALL_X                                              ; SAVE FINAL X LOCATION  = X LOCATION LOW TO MOVE RELATIVE TO BALL + FINAL BALL X – CURRENT PLAYER LOCATION
	CLC                                                           ; IN 1E,1F
	ADC x_dist_to_move_temp                                       ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA FINAL_BALL_X + 1                                          ;
	ADC x_dist_to_move_temp +1                                    ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	
	DEY                                                           ; X DISTANCE LEFT TO MOVE ($42,$43) = FINAL X LOCATION TO MOVE TO – CURRENT X LOCATION
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDY #X_POS + 1                                                ;  
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA x_dist_to_move_temp                                       ; 
	LDY #kickoff_x_move_player_ram_index +1	                                                     ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	
	LDY #X_POS + 2                                                ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA  x_dist_to_move_temp+1                                     ;
	
@set_player_direction: 	
	JSR GET_NEW_DIRECTION_BASED_ON_DISTANCE                       ; GET A NEW DIRECTION BASED ON PLAYER X,Y DISTANCE TO MOVE( X= 42,43, Y=44,45)
	BCS PLAYER_REACHED_FINAL_KICK_COVERAGE_LOC                   ; AT FINAL LOCATION? YES-> PLAYER REACHED KR LOCATION
	
@check_for_speed_change_if_turning:	
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

_WHILE CC                                                ; CHECK IF PLAYER HAS REACHED FINAL LOC OR BACK OF ENDZONE

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	
_END_WHILE

PLAYER_REACHED_FINAL_KICK_COVERAGE_LOC:                           ; PLAYER REACHED KR LOCATION
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT:                          ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()

_WHILE VALUE_CLEAR:                                               ; WAIT FOR BALL COLLIDED LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL STATUS =  BALL COLLIDED?  
	
_END_WHILE

	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP-> DO NEXT PLAYER COMMAND
	
_F}_SET_KICKOFF_LOC_MOD_KICKOFF_COMMMANDS	

_F{_QB_DROPBACK_COMMAND                                           ; DONE

y_dropback_loc                = PLAYER_COMMAND_ARG1
x_dropback_loc                = PLAYER_COMMAND_ARG2
y_dropback_temp               = LOCAL_8 
time_between_ani_sprites      = $0C
ANIMATION_TIME      = EXTRA_PLAYER_RAM_3


QB_DROPBACK_COMMAND_START:                                        ; C0 QB DROP BACK COMMAND
	LDA y_dropback_loc                                            ; SAVE FINAL Y LOCATION FOR DROPBACK 
	STA y_dropback_temp                                           ; 
	LDX x_dropback_loc                                            ; LOAD DROP BACK DISTANCE
	JSR INVERT_VALUE_IF_PLAYER_2                                  ; INVERT X VALUE IF PLAYER 2()
	LDY y_dropback_temp                                           ; LOAD FINAL Y LOCATION FOR DROPBACK
	JSR SAVE_FINAL_X_OR_Y_LOC_PLAYER_RAM[x_y]                     ; PUT FINAL LOCATION IN PLAYER RAM 1E 1F BASED ON LARGEST CHANGE (X,Y)
	LDY y_dropback_temp                                           ; 
	JSR GET_PLAYER_DIRECTION_TOWARDS_LOC                          ; GET NEW PLAYER DIRECTION(X= X DIST, Y = Y DIST) 
	BCS @drop_back_exit                                           ; INVALID CALCULATION? YES-> DROPBACK EXIT
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; SAVE PLAYER DIRECTION AND UPDATE RS RP DEPENDING ON DIRECTION CHANGE
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

@qb_dropback_main_loop:                                           ; DROP BACK LOOP
	LDY #<QB_DROPBACK_1_SPRITE_INFO                               ; SET SPRITE ADDR =  QB DROPBACK 1 
	LDX #>QB_DROPBACK_1_SPRITE_INFO                               ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)   
	LDA #time_between_ani_sprites                                 ; SET QB FEET ANIMATION MOVEMENT TIMER to 12 FRAMES IN PLAYER RAM 1D
	LDY #ANIMATION_TIME                                           ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
@drop_ani_loop_1:                                                 ; DROPBACK ANIMATION LOOP 1
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	BCS @drop_back_exit                                           ; YES?->DROPBACK EXIT
	
@update_animation_time_left 
	LDY #ANIMATION_TIME                                           ; QB FEET ANIMATION MOVEMENT TIMER--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ;
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BNE @drop_ani_loop_1                                           ; TIMER DONE? NO-> DROPBACK ANIMATION LOOP 1

@set_set_next_sprite_in_ani
	LDY #<QB_DROPBACK_2_SPRITE_INFO                               ; SET SPRITE ADDR =  QB DROPBACK 2 SPRITE ADDRESS 
	LDX #>QB_DROPBACK_2_SPRITE_INFO                               ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR
	LDA #time_between_ani_sprites                                 ; SET QB FEET ANIMATION MOVEMENT TIMER 2 to 12 FRAMES IN PLAYER RAM 1D
	LDY #ANIMATION_TIME                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 

@drop_ani_loop_2:                                                 ; CHECK FOR QB REACHED FINAL DROPBACK LOCATION
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	BCS @drop_back_exit                                           ; YES-> DROPBACK EXIT
	LDY #ANIMATION_TIME                                           ; QB FEET ANIMATION MOVEMENT TIMER 2--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ;
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	BNE @drop_ani_loop_2                                          ; TIMER DONE? NO-> CHECK FOR QB REACHED FINAL DROPBACK LOCATION
	JMP @qb_dropback_main_loop                                    ; JUMP->DROP BACK LOOP 

@drop_back_exit:                                                  ; DROPBACK EXIT
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

_F}_QB_DROPBACK_COMMAND

_F{_QB_WAIT_TO_PASS_COMMAND                                       ; DONE

wait_to_pass_frames  = EXTRA_PLAYER_RAM_3
take_sack_chance  = PLAYER_COMMAND_ARG3

COM_WAIT_TO_PASS_COMMAND_START:                                   ; C1 COM PASS TIMING TAKE SACK
	JSR GET_RAND_WAIT_TIME_WITHIN_LIMITS                          ; GET ACTUAL TIME FROM TIMING WINDOW ARGUMENTS()
	LDY #wait_to_pass_frames                                      ; SAVE TIME UNTIL PASS TIMER in $1D 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDA RANDOM_1                                                  ; RANDOM < TAKE SACK CHANCE
	CMP take_sack_chance                                          ; 
	BCC @com_throw_if_def_near_or_time_up                         ; YES-> THROW IF DEFENDER NEAR LOOP
	
@wait_until_com_throw_timer_done: 
	_WHILE NOT_EQUAL
	
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR @reduce_time_left_by_one_frame                            ; DECREMENT PASS TIMER VALUE()
	_END_WHILE
	
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

@com_throw_if_def_near_or_time_up:                                ; THROW IF DEFENDER NEAR LOOP

	_WHILE NOT_EQUAL
	
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                          ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER 
	BCS @exit                                                     ; QB CLOSE TO COLLISION? YES->EXIT TO THROW
	JSR @reduce_time_left_by_one_frame                            ; DECREMENT PASS TIMER VALUE()
	
	_END_WHILE
	
	
@exit:                                                            ; EXIT TO THROW
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

@reduce_time_left_by_one_frame:                                   ; DECREMENT PASS TIMER VALUE()
	LDY #wait_to_pass_frames                                      ; PASS TIMER VALUE--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SEC                                                           ;
	SBC #$01                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE PASS TIMER VALUE
	RTS                                                           ; RETURN

_F}_QB_WAIT_TO_PASS_COMMAND 

_F{_CELEBRATE_COMMAND                                             ; DONE

frames_until_celebrate    = PLAYER_COMMAND_ARG1 
celebrate_ani_change_delay   =  $14                               ; 20 frames = 1/3 second
	
CELEBRATE_COMMAND_START:                                          ; C4 CELEBRATE COMMAND
	JSR CHECK_PLAYER_MOVING_COLL_JUMP_DIVE                        ; CHECK FOR CELEBRATE/CRY PLAYER MOVING OR COLLIDED/JUMP/DIVE
	BCS @do_animation                                             ; 

@check_various_conditions 
	BVS @wait_to_do_animation:                                    ; PLAYER JUMPING,DIVING, COLLIDED? YES-> BRANCH TO CELEBRATE PLAYER JUMPING OR DIVING

@turn_player_if_stopped: 
	LDY #<(CELEBRATE_1_SPRITE_INFO)                               ; SET SPRITE ADDR =   PLAYER CELEBRATE 1 SPRITE ADDRESS
	LDX #>(CELEBRATE_1_SPRITE_INFO)                               ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)

@wait_to_do_animation::                                           ; CELEBRATE PLAYER JUMPING,DIVING, COLLIDED
	LDA frames_until_celebrate                                    ; LOAD WAIT UNTIL CELEBRATE TIME 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        

@do_animation:                                                    ; 
	LOAD_CUR_PLAYER_POSITION_ID
	AND #$80                                                      ; SAVE P1/P2 INFO IN X
	TAX                                                           ;
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER BALL CARRIER? 
	AND #PLAYER_BALL_CARRIER_BITFLAG                              ;
	BNE @set_player_direction_left_or_right                       ; NO->CELEBRATING PLAYER COLLIDED
	TXA                                                           ; SET PLAYER DIRECTION = RIGHT FOR P1, LEFT FOR P2
	EOR #$80                                                      ;
	TAX                                                           ;
	
@set_player_direction_left_or_right:                              ; CELEBRATING PLAYER COLLIDED
	TXA                                                           ; SAVE PLAYER DIRECTION = RIGHT FOR P1, LEFT FOR P2 
	SET_CUR_PLAYER_DIRECTION
	
@celebrate_animation_loop:                                        ; PLAYER CELBRATE ANIMATION LOOP 
	LDY #<(CELEBRATE_1_SPRITE_INFO)                               ; SET SPRITE ADDR =    PLAYER CELEBRATE 1 SPRITE ADDR
	LDX #>(CELEBRATE_1_SPRITE_INFO)                               ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	LDA #celebrate_ani_change_delay                               ; SET DELAY TO 20 FRAMES = 1/3 SEC
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES TO WAIT)
	LDY #<(CELEBRATE_2_SPRITE_INFO)                               ; SET SPRITE ADDR = ARMS IN AIR CELEBRATE SPRITE GRAPHIC ADDR
	LDX #>(CELEBRATE_2_SPRITE_INFO)                               ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 20
	JMP @celebrate_animation_loop:                                ; JUMP->PLAYER CELEBRATE ANIMATION LOOP

_F}_CELEBRATE_COMMAND 

_F{_CRY_COMMAND                                                   ; DONE

frames_until_cry     = PLAYER_COMMAND_ARG1
frames_until_sprite_change   = PLAYER_COMMAND_ARG1
	
CRY_COMMAND_START:                                                ; C5 PLAYER CRY COMMAND
	JSR CHECK_PLAYER_MOVING_COLL_JUMP_DIVE                        ; CHECK FOR CELEBRATE/CRY PLAYER MOVING OR COLLIDED/JUMP/DIVE
	BCS @update_player_sprite_to_head_down                        ;
	BVC @update_player_sprite_to_head_down                        ; PLAYER NOT MOVING, COLLIDED, JUMPING, DIVING, ON GROUND? YES->SET PLAYER GRAPHIC TO HEAD DOWN 

@wait_for_dive_chop_animation_to_finish: 
	LDA frames_until_cry                                          ; SET # OF FRAMES = FRAMES UNTIL DOING HEAD DOWN POSE
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES TO WAIT)

@update_player_sprite_to_head_down:                               ; SET PLAYER GRAPHIC TO HEAD DOWN 
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                         
	LDY #<(HEAD_DOWN_CRY_SPRITE_INFO)                             ; SET SPRITE ADDR = = HEAD DOWN SPRITE GRAPHIC ADDR
	LDX #>(HEAD_DOWN_CRY_SPRITE_INFO)                             ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	PAUSE_PLAYER_ACTIONS


CHECK_PLAYER_MOVING_COLL_JUMP_DIVE:                               ; CHECK FOR CELEBRATE/CRY PLAYER MOVING OR COLLIDED/JUMP/DIVE
	LDA #$00                                                      ; 
	LDY #COLLISION_COUNTER                                        ; SET COLLISION LOGIC COUNTER = WAIT FOREVER
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER MOVING 
	BMI @cry_cel_player_still_moving                              ; YES->CRY/CELEBRATE PLAYER MOVING
	
		
@check_if_player_diving_chop_blocking: 
	AND #(PLAYER_DIVE_TACKLE_BITFLAG+PLAYER_CHOP_BLOCK_BITFLAG)                                                
	BNE @set_value_to_wait_to_do_animation                        ; YES->INDICATE OKAY TO DO HEAD DOWN POSE 
	DEY                                                           ;  
@check 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	AND #(PLAYER_COLLIDED_BITFLAG + PLAYER_ON_GROUND_BITFLAG + PLAYER_JUMPING_BITFLAG + COLLIDED_BALL_BITFLAG)                                               
	BNE @set_value_to_wait_to_do_animation                        ;

@okay_to_do_animation 
	CLC                                                           ; CLEAR CARRY AND CLEAR VALUE = OK TO DO ANIMATION
	CLV                                                           ; 
	RTS                                                           ; RETURN
	
@set_value_to_wait_to_do_animation:                               ; SET VALUES TO INDICATE WAIT TO DO ANIMATION
	CLC                                                           ; CLEAR CARRY AND SET VALUE = WAIT TO DO ANIMATION 
	BIT $FFF9                                                     ; 
	RTS                                                           ; RETURN

@cry_cel_player_still_moving:                                     ; CRY/CELEBRATE PLAYER MOVING

ani_wait_frames  = EXTRA_PLAYER_RAM_3 

	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	LDA frames_until_sprite_change                                ; SAVE WAIT UNTIL CRY TIME IN 1D
	LDY #ani_wait_frames                                          ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES TO WAIT)

@decrease_player_speed_until_condition:                           ; DECREASE PLAYER SPEED LOOP UNTIL < 4, OR PLAYER OUT OF BOUNDS, OR AT BACK OF ENDZONE
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 2
	
@check_if_OOB: 
	LDY #Y_POS + 1                                                ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	CMP #OUT_OF_BOUNDS_TOP_Y + ONE_YARD                           ; IS PLAYER ABOVE  TOP OUT OF BOUNDS?
	BCC @stop_player_ok_to_do_cry_pose                            ; YES-> SET PLAYER SPEED TO ZERO,NOT MOVING, SET OK TO DO CRY POSE 
	CMP #OUT_OF_BOUNDS_BOT_Y + ONE_YARD                           ; IS PLAYER BELOW  BOTTOM OUT OF BOUNDS?
	BCS @stop_player_ok_to_do_cry_pose                            ; YES-> SET PLAYER SPEED TO ZERO,NOT MOVING, SET OK TO DO CRY POSE 

@check_if_at_back_of_endzone:  
	LOAD_CUR_PLAYER_COLLISION_STATUS                              ;
	LSR                                                           ;
	BCS @stop_player_ok_to_do_cry_pose                            ; YES-> SET PLAYER SPEED TO ZERO,NOT MOVING, SET OK TO DO CRY POSE 
	LOAD_CUR_PLAYER_SPEED                                         ;
	CMP #$04                                                      ;
	BCC @stop_player_ok_to_do_cry_pose                            ; YES-> SET PLAYER SPEED TO ZERO,NOT MOVING, SET OK TO DO CRY POSE

@decrease_speed:  
	SEC                                                           ; CURRENT SPEED--
	SBC #$01                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE CURRENT SPEED
	JSR INIT_PLAYER_VELOCITY_NEW_SPEED[speed]                    ; SET X/Y VELOCITY BASED ON GIVEN SPEED & PLAYER DIRECTION (A=SPEED)
	JMP @decrease_player_speed_until_condition                    ; JUMP->DECREASE PLAYER SPEED LOOP UNTIL < 4, OR PLAYER OUT OF BOUNDS, OR AT BACK OF ENDZONE

@stop_player_ok_to_do_cry_pose:                                   ; SET PLAYER SPEED TO ZERO,NOT MOVING, SET OK TO DO CRY POSE 
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	SEC                                                           ; SET CARRY = INDICATE AT BACK OF ENDZONE = OK TO DO CRY POSE
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F ()

_F}_CRY_COMMAND 

_F{_COM_CONTROLLED_TEAM_BRANCH_COMMANDS							  ; DONE

cpu_boost_level_compare			= PLAYER_COMMAND_ARG3	
team1_bitmask					= $F0
team2_bitmask					= $0F
	
DO_ACTION_IF_COM_COMMAND_START:                                   ; C7 COM JUMP TO POINTER COMMAND
	JSR CHECK_IF_MAN_VS_COM                                       ; CHECK IF PLAYER IS MAN()
	BCS @do_com_command                                           ; NO->  DO COM/COA COMMAND 
	JMP DO_NEXT_PLAYER_COMMAND                                    ; YES-> DO NEXT PLAYER COMMAND

@do_com_command:                                                  ; DO COM/COA COMMAND
	JMP JUMP_COMMAND_START                                        ; JUMP-> 0XFF JUMP TO PLAY CODE ADDRESSS(DC,DD= PLAY CODE ADDRESS)

COM_JUMP_BASED_ON_JUICE_COMMAND_START:                            ; 0XC8 COM JUMP TO POINTER BASED ON RANDOM AND JUICE LEVEL (COM V MAN) ONLY
	JSR CHECK_IF_MAN_VS_COM                                       ; CHECK IF PLAYER IS MAN()
	BCC @do_next_command                                          ; YES->EXIT
	LDA CPU_BOOST_INDEX                                           ; IS CPU JUICE LEVEL (0-F) < CHANCE
	CMP cpu_boost_level_compare                                   ; 
	BCC @do_next_command                                          ; YES->EXIT

@do_com_command:  
	JMP JUMP_COMMAND_START                                        ; NO-> 0XFF JUMP TO PLAY CODE ADDRESSS(DC,DD= PLAY CODE ADDRESS)
	
@do_next_command:                                                 ; EXIT
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND

CHECK_IF_MAN_VS_COM:                                              ; CHECK IF OPPOSING DEFENSE IS MAN()
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @player_two_on_offense                                    ; YES->PLAYER 2 ON OFFENSE
	
@player_one_on_offense 
	LDA TEAM_CONTROL_TYPES                                        ; DOES TEAM 1 CONTROL = MAN?
	AND #team1_bitmask                                                      ; 
	BEQ @set_dont_do_juice_command                                ; YES->EXIT
	LDA TEAM_CONTROL_TYPES                                        ; DOES TEAM 2 CONTROL = COA/COM?
	AND #team2_bitmask                                                      ; 
	BNE @set_dont_do_juice_command                                ; YES->EXIT
	SEC                                                           ; INDICATE PLAYER TYPE  =  COM
	RTS                                                           ; RETURN

@player_two_on_offense:                                           ; PLAYER 2 ON OFFENSE 
	LDA TEAM_CONTROL_TYPES                                        ; DOES TEAM CONTROL = PLAYER 2 TEAM MAN?
	AND #team2_bitmask                                                     ; 
	BEQ @set_dont_do_juice_command                                ; YES-> EXIT
	LDA TEAM_CONTROL_TYPES                                        ; DOES TEAM CONTROL = PLAYER 1 TEAM MAN?
	AND #team1_bitmask                                                      ; 
	BNE @set_dont_do_juice_command                                ; YES->EXIT
	SEC                                                           ; INDICATE PLAYER TYPE  = COM
	RTS                                                           ; RETURN

@set_dont_do_juice_command:                                       ; EXIT
	CLC                                                           ; INDICATE PLAYER TYPE  = MAN
	RTS                                                           ; RETURN
	
_F}_COM_CONTROLLED_TEAM_BRANCH_COMMANDS	

_F{_COVER_NEARBY_PLAYERS_UNUSED_COMMAND							  ; DONE

target_addr			= LOCAL_1
player_to_cover 	= PLAYER_COMMAND_ARG1
time_to_cover 		= PLAYER_COMMAND_ARG2
	
COVER_NEARBY_PLAYERS_COMMAND_START_UNUSED:                        ; C9 COMMAND (NOT USED)
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	
@check_players_close_collision:                                   ; CHECK FOR CAN COLLIDE LOOP
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 3
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                          ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	BCC @check_players_close_collision                            ; NO PLAYERS CLOSE->CHECK FOR CAN COLLIDE LOOP
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDY #POSITION_ID	                                         ; LOAD TARGET POSITION ID 
	LDA (target_addr),Y                                           ; 
	AND #$0F                                                      ; MASK OUT POSSESSION NIBBLE
	STA player_to_cover                                            ; SAVE PLAYER TO COVER in $DC
	LDA #$00                                                      ; 
	STA time_to_cover                                             ; SAVE TIME TO COVER in $DD
	JMP SET_MAN_COVERAGE_DEFEND_TIME                              ; 

_F}_COVER_NEARBY_PLAYERS_UNUSED_COMMAND		

_F{_IF_OPP_COM_DO_COMMAND										  ; DONE
	
IF_COM_JUMP_COMMAND_START:                                        ; CA (JUMP TO POINTER IF PLAYER NOT MAN)
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @p2_command                                               ; P2-> PLAYER 2
	LDA TEAM_CONTROL_TYPES                                        ; IS PLAYER 1 TEAM MAN CONTROLLED?
	AND #$F0                                                      ;
	BEQ @do_next_player_command                                   ; YES->EXIT
	JMP JUMP_COMMAND_START                                        ; JUMP -> 0XFF JUMP TO PLAY CODE ADDRESSS(DC,DD= PLAY CODE ADDRESS)

@p2_command:                                                        ; PLAYER 2
	LDA TEAM_CONTROL_TYPES                                        ; IS PLAYER 2 TEAM MAN CONTROLLED?
	AND #$0F                                                      ;
	BEQ @do_next_player_command                                   ; YES->EXIT
	JMP JUMP_COMMAND_START                                        ; JUMP to JUMP TO PLAY CODE ADDRESSS(DC,DD= PLAY CODE ADDRESS)
	
@do_next_player_command :                                         ; EXIT
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP TO DO NEXT PLAYER COMMAND

_F}_IF_OPP_COM_DO_COMMAND		
	
_F{_PASS_BLOCK_COMMAND                                            ; DONE

defender_addr 		= LOCAL_1
	
PASS_BLOCK_COMMAND_START:                                         ; CC BLOCK (BLOCK POSSIBLE PLAYERS DEFINED BY SET TO BLOCK)
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	
_WHILE CC:                                                        ; COLLISION CHECK LOOP
	LDA #PASS_BLOCK_DELAY_FRAMES                                  ; LOAD 9 FRAMES 
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                         
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                       ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	
_END_WHILE

@get_target_pos_id_and_do_block:	
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDY #POSITION_ID                                              ; LOAD POSITION ID
	LDA (defender_addr),Y                                         ;  
	JMP BLOCK_PLAYER                                              ; JUMP-> 3X COMMAND BLOCK PLAYER JUMP POINT

_F}_PASS_BLOCK_COMMAND	

_F{_MOVE_AND_BLOCK_RELATIVE_COMMAND 							  ; DONE

y_dist_to_move 			= PLAYER_COMMAND_ARG1
x_dist_to_move 			= PLAYER_COMMAND_ARG2

player_to_block_addr	= LOCAL_1
y_dist_to_move_save		= LOCAL_8
	
MOVE_AND_BLOCK_RELATIVE_COMMAND_START:                            ; CD MOVE TO LOCATION AND BLOCK PLAYERS NEARBY
	LDA y_dist_to_move                                            ; SAVE Y DISTANCE TO MOVE
	STA y_dist_to_move_save                                       ; 
	LDX x_dist_to_move                                            ; LOAD X DISTANCE TO MOVE
	JSR INVERT_VALUE_IF_PLAYER_2                                  ; INVERT X VALUE IF PLAYER 2()
	
MOVE_ALONG_PATH_CHECK_FOR_PLAYER_TO_BLOCK:                                                        ; MOVE AND BLOCK ON PATH START
	LDY y_dist_to_move_save                                       ; LOAD Y DISTANCE TO MOVE
	JSR SAVE_FINAL_X_OR_Y_LOC_PLAYER_RAM[x_y]                     ; PUT FINAL LOCATION IN PLAYER RAM 1E 1F BASED ON LARGEST CHANGE (X,Y)
	LDY y_dist_to_move_save                                       ; LOAD Y DISTANCE TO MOVE
	JSR GET_PLAYER_DIRECTION_TOWARDS_LOC                          ; GET NEW PLAYER DIRECTION(X= X DIST, Y = Y DIST)
	BCS @check_for_players_to_block                               ; INVALID CALCULATION? YES-> CHECK FOR PLAYERS TO BLOCK LOOP
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

@check_for_players_to_block:
	
_WHILE CC                                               ; CHECK FOR PLAYERS TO BLOCK LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                          ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	BCS @block_player_nearby                                      ; ANY PLAYERS CAN COLLIDE-> YES->BLOCK PLAYER
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	
_END_WHILE 
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND
	
@block_player_nearby:                                             ; BLOCK PLAYER
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDY #POSITION_ID                                              ; LOAD PLAYER TO BLOCK ID
	LDA (player_to_block_addr),Y                                  ; 
	JMP BLOCK_PLAYER                                              ; JUMP->3X COMMAND BLOCK PLAYER JUMP POINT
	

MOVE_AND_BLOCK_HASH_COMMAND_START:                                ; CE MOVE RELATIVE TO BALL PLACEMENT AND BLOCK PLAYERS NEARBY
	LDA y_dist_to_move                                            ;
	CLC                                                           ;
	ADC LOS_Y                                                     ; = MOVE VALUE + LINE OF SCRIMMAGE Y – PLAYER Y LOC
	LDY #Y_POS + 1                                                ; 
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA y_dist_to_move_save                                       ;
	LDX x_dist_to_move                                            ; SAVE Y LOCATION IN $45
	JSR INVERT_VALUE_IF_PLAYER_2                                  ; INVERT X VALUE IF PLAYER 2()
	TXA                                                           ;
	CLC                                                           ;
	ADC LOS_X                                                     ; = MOVE VALUE + LINE OF SCRIMMAGE X – PLAYER X LOCATION
	LDY #X_POS + 1                                                ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ; SAVE X LOCATION 
	JMP MOVE_ALONG_PATH_CHECK_FOR_PLAYER_TO_BLOCK                 ; JUMP->MOVE AND BLOCK ON PATH START

ball_carrier_addr 			= LOCAL_3
P1_or_P2_side_bit_mask	  	= $02   

MOVE_AND_BLOCK_REL_BALL_CARRIER_COMMAND_START:                    ; CF MOVE RELATIVE TO MIDDLE OF FIELD AND BLOCK PLAYERS NEARBY
	LDA POSSESSION_STATUS                                         ; SET INDEX =  P1 OR P2
	AND #P1_or_P2_side_bit_mask                                   ;
	TAX                                                           ;
	LDA_ABS_X_ZP BALL_CARRIER_P1_P2_ADDR                          ; SET $40,41 = P1 or P2 BALL CARRIER ADDR  *** game uses long LDA 0000,X function rather than zp
	STA ball_carrier_addr                                         ;
	LDA_ABS_X_ZP BALL_CARRIER_P1_P2_ADDR+1                        ; *** game use long LDA 0000,X function rather than zp
	STA ball_carrier_addr +1                                      ;
	LDA y_dist_to_move                                            ; = BALL CARRIER Y LOC + COMMAND Y DIST – CURRENT PLAYER Y LOC  
	LDY #Y_POS + 1                                                ;
	CLC                                                           ;
	ADC (ball_carrier_addr),Y                                     ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA y_dist_to_move_save                                       ; SAVE Y DISTANCE
	LDX x_dist_to_move                                            ; 
	JSR INVERT_VALUE_IF_PLAYER_2                                  ; INVERT X VALUE FOR PLAYER 2()
	TXA                                                           ;
	LDY #X_POS + 1                                                ; = BALL CARRIER X LOC + COMMAND X DIST – CURRENT PLAYER Y LOC  
	CLC                                                           ;
	ADC (ball_carrier_addr),Y                                     ; 
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	JMP MOVE_ALONG_PATH_CHECK_FOR_PLAYER_TO_BLOCK                 ; JUMP->MOVE AND BLOCK ON PATH START
	
	
_F}_MOVE_AND_BLOCK_RELATIVE_COMMAND 	

_F{_SET_SNAP_LOCATION_COMMANDS 									  ; DONE	

y_offset_from_los 			= PLAYER_COMMAND_ARG1

SET_SNAP_LOC_RELATIVE_TO_BALL_COMMAND:                            ; D0 COMMAND SET PLAYER Y,X (FROM HIKE LOCATION)
	LDX #$00                                                      ;
	LDA y_offset_from_los                                         ; = Y OFFSET FROM LOS 
	CLC                                                           ; 
	ADC LOS_Y                                                     ; + CURRENT LOS LOC Y
	JMP SET_PLAYER_SNAP_LOC_RELATIVE_TO_LOC                       ; JUMP->SET PLAYER LOCATION RELATIVE TO FIXED LOC(DD= X DIST LOW, A= Y LOC, 45= X HIGH BYTE DIST)

SET_SNAP_LOC_RELATIVE_TO_MID_COMMAND:                             ; D1 SET PLAYER Y,X (FROM CENTER OF FIELD)
	LDX #$00                                                      ;
	LDA y_offset_from_los                                         ; 
	JMP SET_PLAYER_SNAP_LOC_RELATIVE_TO_LOC                       ; JUMP->SET PLAYER LOCATION RELATIVE TO FIXED LOC(DD= X DIST LOW, A= Y LOC, 45= X HIGH BYTE DIST)

_F}_SET_SNAP_LOCATION_COMMANDS 	
	
_F{_HIKE_COMMANDS                                                 ; DONE

snap_delay_frames   = $04                                         ;
shotgun_snap_delay_frames = $1E                                   ; 30 seconds

CENTER_HIKE_COMMAND_START:                                        ; D2 HIKE BALL FROM CENTER
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT:                          ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(CENTER_HIKE_SPRITE_DATA)                               ; SET SPR ADDR =  CENTER HIKE SPRITE ADDR
	LDX #>(CENTER_HIKE_SPRITE_DATA)                               ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	

@check_for_normal_snap:                                           ; CHECK FOR SNAP CENTER 
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES BALL STATUS = BALL SNAPPED
	AND #$04                                                      ;   
	BEQ @check_for_normal_snap                                    ; NO-> CHECK FOR SNAP CENTER
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE GRAPHIC (MAN,AI STANCE/STANDING STILL/MOVING)
	LDA #snap_delay_frames                                        ; LOAD 4 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                         
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND



SHOTGUN_HIKE_COMMAND_START:                                       ; D3 SHOTGUN HIKE
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT:                          ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(CENTER_HIKE_SPRITE_DATA)                               ; SET SPR ADDR =  CENTER HIKE SPRITE ADDR
	LDX #>(CENTER_HIKE_SPRITE_DATA)                               ;  
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	LDA #$80                                                      ; SET BALL INFO = BALL READY TO LEAVE PLAYERS HAND
	STA BALL_COLLISION                                            ; 
	LDY #Y_POS + 1                                                ; SET BALL Y LOC  = PLAYER Y LOC 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA BALL_Y + 1                                                ; 
	LDY #X_POS + 1                                                ; SET BALL X LOC  = PLAYER X LOC
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA BALL_X + 1                                                ;
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA BALL_X + 2                                                ; 
@check_shotgun_snap:                                              ; CHECK FOR SNAP CENTER SHOTGUN
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES BALL STATUS = BALL SNAPPED
	AND #$04                                                      ; 
	BEQ @check_shotgun_snap                                       ; NO-> CHECK FOR SNAP CENTER SHOTGUN
	LDA #SNAP_TOSS_SOUND                                          ; SET SOUND TO PLAY = SHOTGUN SNAP SOUND
	JSR PLAY_SOUND                                                ; PLAY SOUND IF NOTHING IS PLAYING ELSE WAIT TO PLAY(A=SOUND)  
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW
	LDA #shotgun_snap_delay_frames                                ; SET FRAMES TO WAIT =  SHOTGUN SNAP EXCHANGE TIMING FRAMES (30) 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

_F}_HIKE_COMMANDS

_F{_RECEIVE_SNAP_COMMANDS                                         ; DONE

receive_snap_delay  = $04

RECEIVE_SNAP_CENTER_COMMAND_START:                                ; D4 TAKE SNAP FROM UNDER CENTER 
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	JSR UPDATE_P1_OR_P2_DISPLAYED_NAME                            ; UPDATE PLAYER 1 OR PLAYER 2 ICON ABOVE HEAD()  

@check_for_snap_center_hike:                                      ; CHECK FOR SNAP UNDER CENTER
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES BALL STATUS = BALL SNAPPED 
	AND #$04                                                      ; 
	BEQ @check_for_snap_center_hike                               ; NO->CHECK FOR SNAP UNDER CENTER
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	LDA #receive_snap_delay                                       ; LOAD 4 FRAMES  
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                          
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

						

RECEIVE_SNAP_SHOTGUN_COMMAND_START:                               ; D5 SHOTGUN RECIEVE HIKE
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	JSR UPDATE_P1_OR_P2_DISPLAYED_NAME                            ; UPDATE P1 OR P2 PLAYER ICON ABOVE HEAD() 

@check_shotgun_snap:                                              ; CHECK FOR SNAP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES BALL STATUS = BALL SNAPPED
	AND #$04                                                      ; 
	BEQ @check_shotgun_snap                                       ; NO-> CHECK FOR SNAP
	JSR SET_SHOTGUN_LOCATION_DO_ANIMATION                         ; SET SHOTGUN BALL SPEED LOFT AND FINAL LOCATION. DO BALL ANIMATION ()

@check_ball_collided_with_qb:                                     ; CHECK FOR BALL COLLIDED WITH QB
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL COLLIDED 
	BVC @check_ball_collided_with_qb                              ; NO-> CHECK FOR BALL COLLIDED WITH QB
																; END BALL ANIMATION
	JSR PLAY_CATCH_SOUND_END_BALL_ANI                             ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION =NOT MOVING & NOT BEING PITCHED()
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()  
	LDA #receive_snap_delay                                       ; LOAD 4 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                         
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> PROCESS NEXT PLAYER COMMAND LOOP

shotgun_hike_loft  = $06
shotgun_hike_speed  = $40
							
SET_SHOTGUN_LOCATION_DO_ANIMATION:                                ; SET LONG SNAP BALL SPEED ,LOFT, AND FINAL LOCATION. DO BALL ANIMATION ()
	LDY #Y_POS + 1                                                ; SET FINAL BALL Y  = PLAYER Y 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA FINAL_BALL_Y                                              ; SET FINAL BALL X  = PLAYER X 
	LDY #X_POS + 1                                                ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA FINAL_BALL_X                                              ; 
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA FINAL_BALL_X + 1                                          ; 
	LDA #shotgun_hike_loft                                        ; SET BALL LOFT  = SHOTGUN HIKE LOFT
	STA BALL_GRAVITY_INDEX                                        ; 
	LDA #shotgun_hike_speed                                       ; SET BALL SPEED  = SHOTGUN HIKE LOFT 
	STA BALL_SPEED                                                ; 
	LDA #BALL_UPDATE_SCROLL_BITFLAG                               ; SET BALL INFO = UPDATE SCREEN SCROLL
	JSR SET_BALL_STATUS_MOVING_START_BALL_TASK                    ; UPDATE BALL STATUS BYTE AND START BALL ANIMATION TASK(A=BALL STATUS TO ADD TO BALL MOVING) 
	SET_BALL_STATUS_SPECIAL_SHOTGUN_SNAP
	RTS                                                           ; RETURN


_F}_RECEIVE_SNAP_COMMANDS

_F{_FG_XP_SNAP_COMMAND                                            ; DONE

RECEIVE_SNAP_FG_XP_COMMAND_START:                                 ; D6 TAKE SNAP FG/XP
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT:                          ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(KICK_HOLDER_WAIT_FOR_BALL_SPRITE_DATA)                 ; SET SPR ADDR = TAKE FG/XP SPRITE SNAP ADDR
	LDX #>(KICK_HOLDER_WAIT_FOR_BALL_SPRITE_DATA)                 ;   
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
		
WAIT_FOR_FG_SNAP:                                                 ; BALL SNAPPED CHECK 
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	IF_BALL_NOT_SNAPPED[ADDR] WAIT_FOR_FG_SNAP
	JSR SET_SHOTGUN_LOCATION_DO_ANIMATION                         ; SET LONG SNAP BALL SPEED LOFT AND FINAL LOCATION. DO BALL ANIMATION ()

WAIT_UNTIL_HOLDER_HAS_BALL:                                       ; WAIT UNTIL HOLDER HAS BALL LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	IF_BALL_HAS_NOT_COLLIDED[ADDR] WAIT_UNTIL_HOLDER_HAS_BALL
	JSR PLAY_CATCH_SOUND_END_BALL_ANI                             ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION =NOT MOVING & NOT BEING PITCHED() 
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	LDY #<(KICK_HOLDER_HAS_BALL_SPRITE_DATA)                      ; SET SPR INFO ADDR =  QB HOLDING BALL FOR FG/XP 
	LDX #>(KICK_HOLDER_HAS_BALL_SPRITE_DATA)                      ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)

	
after_kick_delay = $3C                                            ; = 60 frames = 1 second 

WAIT_FOR_KICK_LOOP:                                               ; WAIT FOR KICKER TO KICK BALL LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	IF_BALL_NOT_KICKED[ADDR] WAIT_FOR_KICK_LOOP

	JSR SET_PLAYER_NOT_MAN_NOT_BALL_CARRIER                       ; SET PLAYER MOVEMENT TO COM CONTROL AND PLAYER NOT BALL CARRIER()
	JSR SET_PLAYER_COLLIDED_WITH_BALL                             ; SET PLAYER COLLIDED WITH BALL()
	LDA #after_kick_delay                                         ; SET FRAMES TO WAIT = 60 FRAMES (1 SECOND DELAY)
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JSR SET_PLAYER_NOT_COLLIDED_WITH_BALL                         ; SET PLAYER COLLISION = NOT COLLIDED WITH BALL()
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP ->DO NEXT PLAYER COMMAND




_F}_FG_XP_SNAP_COMMAND 

_F{_MOVE_RELATIVE_COMMAND                                         ; DONE    

y_distance_relative_save       = LOCAL_8
y_distance_relative            = PLAYER_COMMAND_ARG1
x_distance_relative            = PLAYER_COMMAND_ARG2

MOVE_RELATIVE_COMMAND_START:                                      ; D7 MOVE RELATIVE TO CURRENT LOCATION
	LDA y_distance_relative                                       ; SAVE Y DISTANCE IN $45
	STA y_distance_relative_save                                  ; 
	LDX x_distance_relative                                       ; LOAD X DISTANCE
	JSR INVERT_VALUE_IF_PLAYER_2                                  ; INVERT X VALUE IF PLAYER 2() 
SAVE_LOCATION_TO_MOVE_PLAYER_RAM:                                 ; SAVE FINAL Y OR X LOCATION TO MOVE TO IN PLAYER RAM
	LDY y_distance_relative_save                                  ; LOAD Y DISTANCE
	JSR SAVE_FINAL_X_OR_Y_LOC_PLAYER_RAM[x_y]                     ; PUT FINAL LOCATION IN PLAYER RAM 1E 1F BASED ON LARGEST CHANGE (X,Y)
	LDY y_distance_relative_save                                  ; LOAD Y DISTANCE
	JSR GET_PLAYER_DIRECTION_TOWARDS_LOC                          ; GET NEW PLAYER DIRECTION(X= X DIST, Y = Y DIST)
	BCS @exit                                                     ; INVALID CALCULATION? YES->MOVE RELATIVE EXIT
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME 
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
@check_player_reached_location:                                   ; HAS PLAYER REACHED LOCATION LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	BCC @check_player_reached_location                            ; NO-> HAS PLAYER REACHED LOCATION LOOP
@exit:                                                            ; MOVE RELATIVE EXIT
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND


_F}_MOVE_RELATIVE_COMMAND   

_F{_MOVE_VS_HASH_COMMAND                                          ; DONE 

y_distance_hash_save       = LOCAL_8
y_distance_hash            = PLAYER_COMMAND_ARG1
x_distance            = PLAYER_COMMAND_ARG2
	
MOVE_ABS_VS_SNAP_LOC_COMMAND_START:                               ; D8 MOVE PLAYER RELATIVE TO SNAP PLACEMENT                      
	LDA y_distance_hash                                           ; = Y DISTANCE TO MOVE  
	CLC                                                           ;
	ADC LOS_Y                                                     ; + LOS LOCATION Y
	
SET_ABSOLUTE_MOVE_LOCATION:                                       ; SUBTRACT PLAYERS CURRENT Y LOCATION
	LDY #Y_POS + 1                                                ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; - PLAYER CURRENT Y LOCATION
	STA y_distance_hash_save                                      ;
	LDX x_distance                                                ; = X DISTANCE TO MOVE
	JSR INVERT_VALUE_IF_PLAYER_2                                  ; INVERT X VALUE IF PLAYER 2() 
	TXA                                                           ; = X DISTANCE TO MOVE
	CLC                                                           ;
	ADC LOS_X                                                     ; + LOS LOCATION X
	LDY #X_POS +1                                                 ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; - PLAYER CURRENT X LOCATION
	TAX                                                           ;
	JMP SAVE_LOCATION_TO_MOVE_PLAYER_RAM                          ; JUMP -> SAVE FINAL Y OR X LOCATION TO MOVE TO IN PLAYER RAM

	
_F}_MOVE_VS_HASH_COMMAND   

_F{_MOVE_VS_MIDDLE_COMMAND                                        ; DONE 

y_distance            = PLAYER_COMMAND_ARG1 
	
MOVE_ABS_VS_MIDDLE_COMMAND_START:                                 ; D9 MOVE PLAYER RELATIVE TO THE MIDDLE OF THE FIELD
	LDA y_distance                                                ; = Y DISTANCE TO MOVE 
	JMP SET_ABSOLUTE_MOVE_LOCATION                                ; JUMP TO SUBTRACT PLAYERS CURRENT Y LOCATION


_F}_MOVE_VS_MIDDLE_COMMAND 
	
_F{_CHASE_BALL_CARRIER_AGRESSIVE_COMMAND                          ; DONE

dive_delay_frames = $05 
dive_chance   = $99                                               ; 60% chance
		
CHASE_BALL_AGRESSIVE_COMMAND_START:                               ; DA PLAYER CHASE BALL (AGGRESSIVE HIGH DIVE CHANCE) START
	JSR GET_PLAYER_DIRECTION_TOWARDS_BALL                         ; UPDATE PLAYER DIRECTION BASED ON LOCATION VS CURRENT BALL LOCATION 
	BCS @chase_error                                              ; HERE FOR RANDOM ERRORS? SEEMS IMPOSSIBLE TO GET SET
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME 
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	LDA #dive_delay_frames                                        ; LOAD 5 FRAMES 
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                          
	LDX #dive_chance                                              ; SET DIVE CHANCE = 60%                   
	JSR CHECK_FOR_DIVE[chance]                                    ; CHECK FOR DIVE(X= DIVE CHANCE) 
	BCC CHASE_BALL_AGRESSIVE_COMMAND_START                        ; DIVE NOT ATTEMPTED-> PLAYER CHASE BALL CARRIER (AGRESSIVE) START
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 30
	JMP CHASE_BALL_AGRESSIVE_COMMAND_START                        ; JUMP to PLAYER CHASE BALL CARRIER (AGRESSIVE) START
	
@chase_error:                                                     ; HERE FOR GLITCHES? 
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 5
	JMP CHASE_BALL_AGRESSIVE_COMMAND_START                        ; JUMP->PLAYER CHASE BALL CARRIER (AGRESSIVE) START

_F}_CHASE_BALL_CARRIER_AGRESSIVE_COMMAND

_F{_MIRROR_BALL_CARRIER_BEHIND_LOS_COMMAND                        ; DONE


half_yard               =  ONE_YARD/2
	
MIRROR_BALL_CARRIER_WHILE_BEHIND_LOS_COMMAND_START:               ; DB COMMAND (VERTICALLY MIRROR BALL CARRIER)

_WHILE CS                                                         ; PLAYER VS BALL LOCATION (Y) CHECK START

	LDA BALL_Y + 1                                                ; BALL Y- PLAYER Y
	LDY #Y_POS + 1                                                ; 
	SEC                                                           ; 
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDA #$80                                                      ;
	ROR                                                           ; BALL Y > PLAYER Y? = SET  NEW DIRECTION DOWN, ELSE  UP 
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	LDA #INIT_MIRROR_BC_DELAY_FRAMES                                        ; LOAD 3 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+  (RAND 0 to 3))
	JSR @player_within_half_yard_ball_check                       ; CHECK FOR PLAYER WITHIN 0.5 YARDS OF BALL IN Y DIRECTION() 
	
_END_WHILE 

@stop_player: 
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT                           ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	SET_CUR_PLAYER_DIRECTION
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()

_WHILE CC

	LDA #MIRROR_BC_DELAY_FRAMES                                      ; LOAD 13 FRAMES = REACTION DELAY
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+  (RAND 0 to 3))
	JSR @player_within_half_yard_ball_check                       ; CHECK FOR PLAYER WITHIN 0.5 YARDS OF BALL IN Y DIRECTION()
	
_END_WHILE  
	
	JMP MIRROR_BALL_CARRIER_WHILE_BEHIND_LOS_COMMAND_START        ; NO->  PLAYER VS BALL LOCATION (Y) CHECK START

@player_within_half_yard_ball_check:                              ; CHECK FOR PLAYER WITHIN 0.5 YARDS OF BALL IN Y DIRECTION()
	LDA BALL_Y + 1                                                ; CURRENT BALL Y - DEFENDER Y
	LDY #Y_POS + 1                                                ; 
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ;
	ADC #half_yard                                                ;
	CMP #ONE_YARD                                                 ; PLAYER WITHIN 0.5 YARDS? SEC = YES, CLC=NO
	RTS                                                           ; RETURN
	
_F}_MIRROR_BALL_CARRIER_BEHIND_LOS_COMMAND  

_F{_DC_COMMAND_UNUSED                                             ; DONE

DC_COMMAND_UNUSED:                                                ; DC (LOOP UNTIL BALL ABOUT TO COLLIDE) NOT USED
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT                           ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
@ball_near_player_check:                                          ; CHECK FOR BALL NEAR PLAYER
	LDA #$07                                                      ; LOAD 7 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+  (RAND 0 to 3))
	BIT BALL_COLLISION                                            ; DOES BALL STATUS =  BALL COLLIDED
	BVC @ball_near_player_check                                   ; NO->CHECK FOR BALL NEAR PLAYER   
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND
	
_F}_DC_COMMAND_UNUSED 

_F{_CONSERVATIVE_CHASE_BALL_COMMAND								  ; DONE

direction_to_target			= LOCAL_8
new_player_direction		= LOCAL_8
ball_carrier_addr			= LOCAL_1

CHASE_BALL_CARRIER_CONSERVATIVE_COMMAND_START:                    ; DD DEFENDER CHASE BALL (CONSERVATIVE)
																  ; PLAYER CHASE BALL START
@check_for_ball_moving																  
	LDA BALL_COLLISION											  ; *** used this instead of macro due to non jumping to local labels	                  
    BPL @move_towards_ball_carrier

@else:	
	JSR GET_PLAYER_DIRECTION_TOWARDS_BALL                         ; UPDATE PLAYER DIRECTION BASED ON LOCATION VS CURRENT BALL LOCATION
	JMP @move_towards_ball                                         ;
	
@move_towards_ball_carrier:                                        ; MOVE TOWARDS PLAYER WITH BALL 
	JSR COPY_MAN_PLAYER_ADDR_TO_TEMP                              ; COPY OFFENSE ACTIVE PLAYER POINTER TO 3E/3F()
	LDY #MOVEMENT_STATUS	                                      ; LOAD TARGET MOVEMENT VALUE
	LDA (ball_carrier_addr),Y                                     ; 
	BPL @ball_carrier_not_moving                                  ; TARGET MOVING?? NO->TARGET NOT MOVING 

@target_moving:
	LDY #CURRENT_DIRECTION                                        ; SAVE TARGET DIRECTION
	LDA (ball_carrier_addr),Y                                     ; 
	PHA                                                           ;  
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASED ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F) 
	STA direction_to_target                                       ; SAVE NEW DEFENDER DIRECTION IN $45
	PLA                                                           ; LOAD TARGET DIRECTION
	BCS @direction_error                                          ; here for glitches
	SEC                                                           ; 
	SBC direction_to_target                                       ; TARGET DIRECTION – NEW DEFENDER DIRECTION
	CLC                                                           ; MAKE INDEX INTO TABLE ONE OF 16 POSSIBLE VALUES
	ADC #$08                                                      ; 
	LOG_SHIFT_RIGHT_4										      ;
	TAX                                                           ; 
	LDA CHASE_CONSERVATIVE_TURN_TABLE,X                           ; 
	CLC                                                           ;
	ADC new_player_direction                                      ; = NEW DEFENDER DIRECTION + ADJUSTMENT (TRIES TO KEEP DIRECTION CHANGES SMALLER)
	JMP @update_player_dir_speed_vel                              ; JUMP ->UPDATE DIRECTION

@ball_carrier_not_moving:                                         ; TARGET NOT MOVING  
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASE ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F)

@move_towards_ball:                                                ; BALL IN AIR / NO PLAYER HAS BALL
	BCS @check_for_dive                                           ; PLAYER ALEADY IN THE RIGHT DIRECTION? YES= DIVE CHECK ELSE

@update_player_dir_speed_vel:                                     ; UPDATE DIRECTION
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	
@check_for_dive:                                                  ; DIVE CHECK
	LDA #$05                                                      ; LOAD 5 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+  (RAND 0 to 3))
	LDX #$99                                                      ; SET DIVE CHANCE = 60%
	JSR CHECK_FOR_DIVE[chance]                                    ; CHECK FOR DIVE(X=DIVE CHANCE)
	BCC CHASE_BALL_CARRIER_CONSERVATIVE_COMMAND_START             ; DIVE not attempted-> JUMP to PLAYER CHASE BALL START
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 30
	JMP CHASE_BALL_CARRIER_CONSERVATIVE_COMMAND_START             ; JUMP to PLAYER CHASE BALL START

@direction_error:                                                 ; NEVER REACHES HERE?
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 5
	JMP CHASE_BALL_CARRIER_CONSERVATIVE_COMMAND_START             ; JUMP to PLAYER CHASE BALL START

_F}_CONSERVATIVE_CHASE_BALL_COMMAND

_F{_COM_BALL_CARRIER_MOVE_AI									  ; DONE
	
COM_CONTROL_BALL_CARRIER_COMMAND_START:                           ; DF COM TAKE CONTROL
	LDA BALL_STATUS                                               ; DOES BALL STATUS = INTERCEPTED? 
	BMI COM_BALL_CARRIER_MOVE_AI_START                            ; YES->COM IS BALL CARRIER START
	
@check_if_com_p1_p2:	
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @com_is_p2                                                ; YES->PLAYER 2
	
	LDA TEAM_CONTROL_TYPES                                        ; DOES TEAM CONTROL = P1 MAN CONTROLLED?
	AND #$0F                                                      ; 
	BNE COM_BALL_CARRIER_MOVE_AI_START                            ; NO->COM IS BALL CARRIER START    
	JMP @add_com_boosts                                           ; 

@com_is_p2:                                                       ; PLAYER 2
	LDA TEAM_CONTROL_TYPES                                        ; DOES TEAM CONTROL = P2 MAN CONTROLLED?
	AND #$F0                                                      ;
	BNE COM_BALL_CARRIER_MOVE_AI_START                            ; NO->COM IS BALL CARRIER START

@add_com_boosts:                                                  ; COM TAKE CONTROL ADD RS,RP,MS BOOSTS
	LDY #MAX_SPEED                                                ; LOAD PLAYER MAX SPEED
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ; 
	ADC CPU_OFF_MS_BOOST                                          ; PLAYER MAX SPEED = PLAYER MAX SPEED + OFF JUICE VALUE 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE PLAYER MAX SPEED
	LOAD_CUR_PLAYER_RP_RS_INDEXES
	AND #$0F                                                      ; MASK OUT RP SKILL
	CLC                                                           ;
	ADC CPU_OFF_MS_BOOST                                          ; BOOSTED RS INDEX = RS INDEX + OFF JUICE VALUE 
	CMP #MAX_PLAYER_SKILL_RATING  +1                                             ; IS NEW RS INDEX > MAX ALLOWED VALUE
	BCC @save_boosted_rs                                          ; NO-> SAVE RS INDEX AND ADD RP BOOST
	
	LDA #MAX_PLAYER_SKILL_RATING                                                 ; YES NEW RS INDEX = MAX ALLOWED VALUE

@save_boosted_rs:                                                 ; SAVE RS INDEX AND ADD RP BOOST

rs_rp_index_temp = LOCAL_8

	STA rs_rp_index_temp                                          ; SAVE BOOSTED RS INDEX 
	TAX                                                           ; SET X = BOOSTED RS INDEX
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; LOAD RP/RS SKILL INDEXES
	AND #$F0                                                      ; MASK OUT RS
	CLC                                                           ; BOOSTED RP INDEX = RS INDEX + OFF JUICE VALUE 
	ADC CPU_OFF_MS_BOOST                                          ; IS NEW RS INDEX > MAX ALLOWED VALUE? 
	BCC @save_boosted_rp                                           ; NO->SAVE BOOSTED RP INDEXES AND SET BOOSTED RUNNING SPEED

@set_to_maximum_rp:	
	LDA #$F0                                                      ; YES-> SET TO MAX ALLOWED VALUE

@save_boosted_rp:                                                 ; SAVE BOOSTED RP INDEXES AND SET BOOSTED RUNNING SPEED
	ORA rs_rp_index_temp                                          ; SET PLAYER RP/RS INDEX = BOOSTED RP/RS INDEX
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDA RUNNING_SPEED_VALUES_TABLE,X                              ; LOAD BOOSTED RUNNING SPEED VALUE FROM RUNNING SPEED TABLE 
	SET_CUR_PLAYER_SPEED

COM_BALL_CARRIER_MOVE_AI_START:                                   ; COM IS BALL CARRIER START
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT                           ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	LOAD_CUR_PLAYER_POSITION_ID
	BPL P1_SIDE_COM_BALL_CARRIER_MOVE_LOOP                        ; YES-> PLAYER 1 SIDE COM MOVEMENT DECISION LOOP
	JMP P2_SIDE_COM_BALL_CARRIER_MOVE_LOOP                        ; JUMP->PLAYER 2 SIDE COM MOVEMENT DECISION LOOP


defenders_above_below				= LOCAL_7


	
P1_SIDE_COM_BALL_CARRIER_MOVE_LOOP:                               ; PLAYER 1 SIDE COM HAS BALL MOVEMENT DECISION LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME

@check_near_oob:	
	JSR CHECK_IF_COM_BALL_CARRIER_NEAR_OOB                        ; CHECK FOR PLAYER (NEAR) OUT OF BOUNDS() 
	BCS @p1_com_ball_carrier_moves_right                          ; NEAR OUT OF BOUNDS? YES->COM PLAYER MOVES RIGHT 

@check_near_collision:	
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                          ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	BCC @p1_com_ball_carrier_moves_towards_middle                 ; ANY PLAYERS CLOSE? NO-> COM MOVES TOWARDS MIDDLE

@check_where_more_defenders_are:	
	JSR CHECK_IF_MORE_DEF_ABOVE_BELOW_COM_RUNNER                  ; CHECK NUMBER OF DEFENDERS IN PATH ABOVE VS BELOW() RET: 0= none in path, plus= more above, minus =more below 
	LDA defenders_above_below                                     ; LOAD NUMBER OF DEFENDERS CLOSE TO COLLISSION ABOVE OR BELOW

@equal:	
	BEQ @p1_com_ball_carrier_moves_towards_middle                 ; EQUAL NUMBER ABOVE AND BELOW COM OR ALL BEHIND COM? YES->BRANCH TO COM MOVES TOWARDS MIDDLE
	
@more_above:	
	BPL @adjust_p1_com_ball_carrier_downward_slightly             ; YES->ADJUST COM DIRECTION DOWNWARD 11 DEGRESS  

@more_below:	
	
@adjust_p1_com_ball_carrier_upward_slightly						  ; ADJUST COM DIRECTION UPWARD 11 DEGRESS  
	LOAD_CUR_PLAYER_DIRECTION
	SEC                                                           ; 
	SBC #COM_BALL_CARRIER_TURN_AMOUNT                             ; + ~11 DEGREES 
	CMP #P1_COM_BALL_CARRIER_MAX_UP_ANGLE                         ; IS PLAYER DIRECTION VALUE >= ~112 degrees? (0x40= 90 degrees= up)
	BCS @turn_com_ball_carrier_update_velocity                    ; YES-> UPDATE COM PLAYER 1 MOVEMENT AND SPEED
	
@set_p1_angle_to_max_up:	
	LDA #P1_COM_BALL_CARRIER_MAX_UP_ANGLE                         ; else keep direction at >= ~112 degrees
	JMP @turn_com_ball_carrier_update_velocity                    ; JUMP to UPDATE COM PLAYER 1 MOVEMENT AND SPEED

@adjust_p1_com_ball_carrier_downward_slightly:                    ; ADJUST COM DIRECTION DOWNWARD 11 DEGRESS  
	LOAD_CUR_PLAYER_DIRECTION
	CLC                                                           ; 
	ADC #COM_BALL_CARRIER_TURN_AMOUNT                        ; 
	CMP #P1_COM_BALL_CARRIER_MAX_DOWN_ANGLE                       ; IS PLAYER DIRECTION VALUE < ~158 degrees? (0xC0= 180 degrees= down)
	BCC @turn_com_ball_carrier_update_velocity                    ; YES-> UPDATE COM PLAYER1 MOVEMENT AND SPEED

@set_p1_angle_to_max_down:	
	LDA #P1_COM_BALL_CARRIER_MAX_DOWN_ANGLE                       ; NO-> SET PLAYER DIRECTION VALUE = 158 
	JMP @turn_com_ball_carrier_update_velocity                    ; JUMP to UPDATE COM PLAYER 1 MOVEMENT AND SPEED

@p1_com_ball_carrier_moves_towards_middle:                        ; COM MOVES TOWARDS MIDDLE
	LDY #Y_POS + 1                                                ; LOAD PLAYER Y 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ;
	ADC #COM_BALL_CARRIER_TURN_AMOUNT                             ; = PLAYER Y + 0.5 YARDS
	AND #$F0                                                      ; 
	CMP #BALL_MIDDLE_OF_FIELD_Y                                   ; PLAYER Y + 0.5 YARDS  == MIDDLE OF FIELD?
	BEQ @set_p1_com_direction_to_straight                         ; YES?->PLAYER 1 COM AT MIDFIELD  
	BCS @turn_p1_com_slightly_up_towards_middle                   ; 

@turn_p1_com_slightly_down_towards_middle
	LDA #P1_COM_BALL_CARRIER_DOWN_TOWARDS_MID_ANGLE               ; SET DIRECTION = PLAYER MOVES SLIGHT DOWNWARD
	JMP @update_p1_com_direction_towards_middle                   ;  JUMP->UPDATE DIRECTION IF NEEDED AND SPEED *** could use branch

@turn_p1_com_slightly_up_towards_middle:                          ; SET DIRECTION TO SLIGHLTY UP 
	LDA #P1_COM_BALL_CARRIER_UP_TOWARDS_MID_ANGLE                 ; SET DIRECTION TO 168.75 degrees or RIGHT AND SLIGHTLY UP
	JMP @update_p1_com_direction_towards_middle                   ;  JUMP to UPDATE COM PLAYER 1 MOVEMENT AND SPEED *** could use branch

@set_p1_com_direction_to_straight:                                ; PLAYER 1 COM AT MIDFIELD  
	LDA #P1_COM_BALL_CARRIER_TOWARDS_MID_ANGLE                    ; SET DIRECTION TO 180 degrees or RIGHT    

@update_p1_com_direction_towards_middle:                                                        ; UPDATE DIRECTION IF NEEDED AND SPEED
	JSR CHANGE_COM_BALL_CARRIER_DIRECTION_MAX_OF_NINE_DEGREES     ; KEEP DIRECTION SAME OR ADJUST BY +/-9 degrees(A=NEW DIRECTION)
	JMP @turn_com_ball_carrier_update_velocity                    ; JUMP to UPDATE COM PLAYER 1 MOVEMENT AND SPEED

@p1_com_ball_carrier_moves_right:                                 ; COM PLAYER MOVES RIGHT
	LDA #P1_COM_BALL_CARRIER_TOWARDS_MID_ANGLE                     ; SET DIRECTION TO 180 degrees or RIGHT 
	
@turn_com_ball_carrier_update_velocity:                           ; UPDATE COM PLAYER 1 MOVEMENT AND SPEED
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION() 
	JMP P1_SIDE_COM_BALL_CARRIER_MOVE_LOOP                        ; JUMP-> PLAYER 1 SIDE COM MOVEMENT DECISION LOOP

defenders_above_below		= LOCAL_7
	
P2_SIDE_COM_BALL_CARRIER_MOVE_LOOP:                               ; PLAYER 2 SIDE COM HAS BALL MOVEMENT DECISION LOOP

@check_p2_near_oob:
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_IF_COM_BALL_CARRIER_NEAR_OOB                        ; CHECK FOR PLAYER (NEAR?) OUT OF BOUNDS()
	BCS @p2_com_moves_left                                        ; NEAR OUT OF BOUNDS?YES-> COM PLAYER MOVES LEFT

@check_p2_com_near_collision:
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                       ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	BCC @p2_com_moves_towards_middle                              ; ANY PLAYERS CLOSE? NO-> COM MOVES TOWARDS MIDDLE

@check_where_more_defenders_are:	
	JSR CHECK_IF_MORE_DEF_ABOVE_BELOW_COM_RUNNER                  ; CHECK NUMBER OF DEFENDERS IN PATH ABOVE VS BELOW() RET: 0= none in path, plus= more above, minus =more below
	LDA defenders_above_below                                     ; LOAD NUMBER OF DEFENDERS CLOSE TO COLLISSION ABOVE OR BELOW
	BEQ @p2_com_moves_towards_middle                              ; EQUAL NUMBER ABOVE AND BELOW COM OR ALL BEHIND COM? YES->P2 COM MOVES TOWARDS MIDDLE
	BPL @adjust_p2_com_down_11_degrees                            ; MORE DEFENDERS ABOVE? YES->ADJUST P2 COM DIRECTION DOWNWARD 11 DEGRESS  

@adjust_p2_com_up_11_degrees:                                     ; ADJUST P2 COM DIRECTION UPWARD 11 DEGRESS   
	LOAD_CUR_PLAYER_DIRECTION
	CLC                                                           ;
	ADC #COM_BALL_CARRIER_TURN_AMOUNT                             ; + ~11 DEGREES
	CMP #P2_COM_BALL_CARRIER_MAX_UP_ANGLE                         ; IS PLAYER DIRECTION VALUE < ~67 degrees? (0x40= 90 degrees= up)
	BCC @p2_com_update_sprite_and_speed                           ; YES-> UPDATE COM PLAYER 1 MOVEMENT AND SPEED
	LDA #P2_COM_BALL_CARRIER_MAX_UP_ANGLE                         ; ELSE SET DIRECTION = 67 DEGRESS = LEFT AND UP
	JMP @p2_com_update_sprite_and_speed                           ; JUMP->UPDATE COM PLAYER 2 MOVEMENT AND SPEED

@adjust_p2_com_down_11_degrees:                                   ; ADJUST P2 COM DIRECTION DOWNWARD 11 DEGRESS  
	LOAD_CUR_PLAYER_DIRECTION
	SEC                                                           ;
	SBC #COM_BALL_CARRIER_TURN_AMOUNT                             ;
	CMP #P2_COM_BALL_CARRIER_MAX_DOWN_ANGLE                       ; IS PLAYER DIRECTION VALUE > ~202 degrees? (0xC0= 180 degrees= down)
	BCS @p2_com_update_sprite_and_speed                           ; YES-> UPDATE COM PLAYER 2 MOVEMENT AND SPEED
	LDA #P2_COM_BALL_CARRIER_MAX_DOWN_ANGLE                       ; NO-> SET PLAYER DIRECTION VALUE = 202
	JMP @p2_com_update_sprite_and_speed                           ; JUMP-> UPDATE COM PLAYER 2 MOVEMENT AND SPEED

@p2_com_moves_towards_middle:                                     ; P2 COM MOVES TOWARDS MIDDLE
	LDY #Y_POS + 1                                                ; = PLAYER Y LOC 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	CLC                                                           ;
	ADC #COM_BALL_CARRIER_TURN_AMOUNT                             ; + 1 YARD 
	AND #$F0                                                      ; DOES PLAYER Y POSITION = MIDFIELD
	CMP #BALL_MIDDLE_OF_FIELD_Y                                   ; 

@p2_com_runner_at_midfield	
	BEQ @p2_com_runner_at_midfield_turn_left                      ; YES?-> PLAYER 2 COM AT MIDFIELD  

@p2_com_runner_below_midfield	
	BCS @p2_com_runner_below_midfield_turn_upwards                ; BELOW MIDFIELD? YES->SET P2 COM DIRECTION TO SLIGHLTY UP 
	
@p2_com_runner_above_midfield_turn_downwards	
	LDA #P2_COM_BALL_CARRIER_DOWN_TOWARDS_MID_ANGLE                ; SET DIRECTION = LEFT AND SLIGHTLY DOWN  
	JMP @update_p2_com_direction_towards_middle                    ;
	
@p2_com_runner_below_midfield_turn_upwards:                     ; SET P2 COM DIRECTION TO SLIGHLTY UP 
	LDA #P2_COM_BALL_CARRIER_UP_TOWARDS_MID_ANGLE                 ; SET DIRECTION = LEFT AND SLIGHTLY UP  
	JMP @update_p2_com_direction_towards_middle                    ; JUMP-> PLAYER 2 COM AT MIDFIELD  

@p2_com_runner_at_midfield_turn_left:                             ; PLAYER 2 COM AT MIDFIELD  
	LDA #P2_COM_BALL_CARRIER_TOWARDS_MID_ANGLE                    ; SET NEW DIRECTION TO LEFT

@update_p2_com_direction_towards_middle:                          ; UPDATE P2 DIRECTION AND SPEED IF NEEDED
	JSR CHANGE_COM_BALL_CARRIER_DIRECTION_MAX_OF_NINE_DEGREES     ; KEEP DIRECTION SAME OR ADJUST BY +/-9 degrees(A=NEW DIRECTION)
	JMP @p2_com_update_sprite_and_speed                           ; BRANCH TO UPDATE COM PLAYER 2 MOVEMENT AND SPEED

@p2_com_moves_left:                                               ; PLAYER 2 COM MOVES LEFT
	LDA #P2_COM_BALL_CARRIER_TOWARDS_MID_ANGLE                     ; SET NEW DIRECTION TO LEFT

@p2_com_update_sprite_and_speed:                                  ; UPDATE COM PLAYER 2 MOVEMENT AND SPEED
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	JMP P2_SIDE_COM_BALL_CARRIER_MOVE_LOOP                        ; JUMP->PLAYER 2 SIDE COM MOVEMENT DECISION LOOP

num_defenders_above_runner  = LOCAL_7 
defender_addr    = LOCAL_1
			
CHECK_IF_MORE_DEF_ABOVE_BELOW_COM_RUNNER:                         ; CHECK NUMBER OF DEFENDERS IN PATH ABOVE VS BELOW() RET: 0= none in path, plus= more above, minus =more below
	LDA #$00                                                      ; SET NUMBER OF DEFENDERS BELOW RUNNER =0 
	STA num_defenders_above_runner                                ; 
	
@check_all_defenders_loop:                                        ; CHECK DEFENDERS LOCATION LOOP  
	LDX NUM_PLAYERS_CAN_COLLIDE                                   ; LOAD NUMBER OF PLAYERS CAN COLLIDE
	LDA PLAYERS_CAN_COLLIDE_WITH[]-1,X                            ; LOAD POSITION ID OF CURRENT PLAYER BEING CHECKED
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	
@check_player_past_defender: 
	LDY #X_POS +1                                                 ; IS PLAYER X LOC PAST DEFENDER X LOC? 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CMP (defender_addr),Y                                         ; 
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SBC (defender_addr),Y                                         ; 
	ROR                                                           ;
	LDY #POSITION_ID                                              ; 
	EOR (CURRENT_PLAYER_ADDR),Y                                   ; 
	BMI @check_next_player_exit_if_done                           ; YES->CHECK NEXT PLAYER,EXIT IF DONE
	
@check_y_location: 
	LDY #Y_POS +1                                                 ; IS PLAYER Y BELOW DEFENDER Y?
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CMP (defender_addr),Y                                         ; 
	BCS @increase_num_defenders_above_runner                      ; YES- COM RUNNER BELOW DEFENDER
	
@decrease_num_defenders_above_runner: 
	DEC num_defenders_above_runner                                ; SET NUMBER OF DEFENDERS += 1 BELOW RUNNER
	JMP @check_next_player_exit_if_done                           ; JUMP->CHECK NEXT PLAYER,EXIT IF DONE

@increase_num_defenders_above_runner:                             ; COM RUNNER BELOW DEFENDER
	INC num_defenders_above_runner                                ; SET NUMBER OF DEFENDERS += 1 ABOVE RUNNER
	
@check_next_player_exit_if_done:                                  ; CHECK NEXT PLAYER,EXIT IF DONE
	DEC NUM_PLAYERS_CAN_COLLIDE                                   ; NUMBER OF PLAYERS TO CHECK --
	BNE @check_all_defenders_loop                                 ; DONE? NO->CHECK DEFENDERS LOCATION LOOP  
	RTS                                                           ; RETURN 

HALF_YARD = $04 
	
CHECK_IF_COM_BALL_CARRIER_NEAR_OOB:                               ; CHECK FOR PLAYER NEAR OUT OF BOUNDS  CARRY SET= NEAR OUT OF BOUNDS
	LDY #Y_POS +1                                                 ; IS PLAYER Y LOCATION
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CMP #OUT_OF_BOUNDS_TOP_Y +  HALF_YARD                         ; < NEAR TOP OUT OF BOUNDS?
	BCC @com_near_oob                                             ; YES->PLAYER NEAR OUT OF BOUNDS
	CMP #OUT_OF_BOUNDS_BOT_Y -  HALF_YARD                         ; > NEAR BOTTOM OUT OF BOUNDS?
	BCC @com_not_near_oob                                         ; NO->PLAYER NOT NEAR OUT OF BOUNDS

@com_near_oob:                                                    ; PLAYER NEAR OUT OF BOUNDS
	SEC                                                           ; SET CARRY = NEAR OUT OF BOUNDS 
	
@com_not_near_oob:                                                 ; PLAYER NOT NEAR OUT OF BOUNDS
	RTS                                                           ; RETURN 


FOUR_DEGREES = $02	
NINE_DEGREES = $04
	
CHANGE_COM_BALL_CARRIER_DIRECTION_MAX_OF_NINE_DEGREES:            ; KEEP COM DIRECTION SAME OR ADJUST BY +/-9 degrees(A=NEW DIRECTION)
	TAX                                                           ; SAVE NEW DIRECTION in X
	LDY #CURRENT_DIRECTION                                        ; PLAYER NEW DIRECTION – CURRENT DIRECTION
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	TAY                                                           ; 
	CLC                                                           ; 
	ADC #FOUR_DEGREES                                             ; 
	CMP #NINE_DEGREES                                             ; IS NEW DIRECTION WITHIN 9 DEGREES OF OLD ONE?
	BCC @player_direction_equals_new_direction                    ; YES->LOAD NEW DIRECTION and RETURN
	
	TYA                                                           ; IS DIRECTION CHANGE DOWNWARD?
	BMI @player_direction_upward_nine_degreees                    ; YES->DIRECTION CHANGE DOWNWARD

@player_direction_downward_nine_degreees
	LOAD_CUR_PLAYER_DIRECTION                                     ; PLAYER DIRECTION = PLAYER DIRECTION  + 9 DEGREES
	CLC                                                           ;
	ADC #NINE_DEGREES                                                      ;
	RTS                                                           ; RETURN

@player_direction_upward_nine_degreees:                           ; DIRECTION CHANGE DOWNWARD
	LOAD_CUR_PLAYER_DIRECTION                                     ; PLAYER DIRECTION = PLAYER DIRECTION  - 9 DEGREES
	SEC                                                           ;
	SBC #NINE_DEGREES                                              ;
	RTS                                                           ;

@player_direction_equals_new_direction:                                                        ; PLAYER DIRECTION=NEW DIRECTION
	TXA                                                           ;
	RTS                                                           ; RETURN

_F}_COM_BALL_CARRIER_MOVE_AI
	
INIFITE_LOOP_COMMAND_START:                                       ; UNUSED
	JMP INFINITE_LOOP                                             ; infinite loop

_F{_CHASE_CONSERVATIVE_TURN_TABLE								  ; DONE *** COULD MOVE RIGHT AFTER CHASE FUNCTION
																  ; FOR DD COMMAND KEEPS DEFENDERS FROM MAKING LARGER ADJUSTMENTS AND SLOWING DOWN
CHASE_CONSERVATIVE_TURN_TABLE:                                    ; DEFENDER CHASE ADJUST TABLE
	
																  ; TURN RIGHT
	.DB $00                                                       ; 0  DEGREES 
	.DB $08                                                       ; 11 DEGREES 
	.DB $10                                                       ; 22 DEGREES 
	.DB $18                                                       ; 33 DEGREES 
	.DB $20                                                       ; 45 DEGREES 
	.DB $18                                                       ; 33 DEGREES
	.DB $10                                                       ; 22 DEGREES
	.DB $08                                                       ; 11 DEGREES
	
	.DB $00                                                       ; TURN LEFT
	.DB $F8                                                       ; -11 DEGREES 
	.DB $F0                                                       ; -22 DEGREES
	.DB $E8                                                       ; -33 DEGREES
	.DB $E0                                                       ; -45 DEGREES
	.DB $E8                                                       ; -33 DEGREES
	.DB $F0                                                       ; -22 DEGREES
	.DB $F8                                                       ; -11 DEGREES



_F}_CHASE_CONSERVATIVE_TURN_TABLE

_F{_SET_OR_CHANGE_CURRENT_AND_MAX_SPEED_COMMANDS				  ; DONE
	
	new_rs_value = PLAYER_COMMAND_ARG1 
	
SET_RS_COMMAND_START:                                             ; E0 SET RS
	LOAD_CUR_PLAYER_RP_RS_INDEXES 
	AND #$F0                                                      ; MASK OUT RS SKILL INDEX NIBBLE
	ORA new_rs_value                                              ; = OLD RP INDEX + NEW RS INDEX
	JMP SAVE_RS_RP_INDEX_SET_CUR_SPEED_AND_VEL                     ; JUMP-> SAVE RS/RP INDEX VALUES AND UPDATE CURRENT SPEED AND VELOCITY 

new_max_speed_value = PLAYER_COMMAND_ARG1                         ; 0 = reset to initial offensive value 
	
SET_MS_COMMAND_START:                                             ; E1 SET MS + COM JUICE
	LDA new_max_speed_value                                       ; IS NEW MS VALUE = RESET
	BEQ @reset_max_speed_to_normal_value                          ; YES->RESET MS TO ACTUAL VALUE

	
	JSR CHECK_IF_PLAYER_ON_OFF_OR_DEF                             ; CHECK IF PLAYER IS ON OFFENSE DEFENSE (CC =OFF, CS =DEF)
	LDX new_max_speed_value                                       ; 
	BCC @set_offensive_max_speed                                  ; IS PLAYER ON OFFENSE? YES->SET OFFENSIVE SPEED VALUE + BOOST
	
@set_defensive_max_speed: 
	LDA DEF_MAX_SPEED_VALS,X                                      ; LOAD MAX SPEED VALUE FROM DEFENSIVE SPEED VALUES
	CLC                                                           ;
	ADC CPU_DEF_MS_BOOST                                          ; + DEF MS JUICE AMOUNT
	JMP @save_player_max_speed_value                              ; JUMP->SAVE MS
	
@reset_max_speed_to_normal_value:                                 ; RESET MS TO ACTUAL VALUE
	LOAD_CUR_PLAYER_POSITION_ID
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID                          ; GET ACTUAL PLAYER AND TEAM(A=POSITION ID) RET X=TEAM A= PLAYER 
	LDY #MAX_SPEED_INDEX                                          ; SET SKILL INDEX TO GET = MAX SPEED 
	JSR GET_PLAYER_SKILL_OR_FACE                                  ; GET SKILL RATING INDEX(Y=SKILL TO GET)
	TAX                                                           ; 
	
@set_offensive_max_speed:                                         ; SET OFFENSIVE MAX SPEED VALUE + BOOST(IF APPLICIABLE)
	LDA OFF_MAX_SPEED_VALS,X                                      ; LOAD MAX SPEED VALUE FROM OFFENSIVE SPEED VALUES
	CLC                                                           ;
	ADC CPU_OFF_MS_BOOST                                          ; + DEF MS JUICE AMOUNT 
	
@save_player_max_speed_value:                                     ; SAVE MS
	SET_CUR_PLAYER_MAX_SPEED
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP to DO NEXT PLAYER COMMAND

	
rp_index				= LOCAL_8
amount_to_boost_RS		= PLAYER_COMMAND_ARG1

INCR_DECR_RS_COMMAND_START:                                       ; E2 BOOST RS AND RESET CURRENT SPEED
	LOAD_CUR_PLAYER_RP_RS_INDEXES
	AND #$F0                                                      ; 
	STA rp_index                                                  ; SAVE RP NIBBLE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; = PLAYER RS INDEX
	AND #$0F                                                      ; 
	CLC                                                           ;
	ADC amount_to_boost_RS                                        ; + AMOUNT TO BOOST INDEX
	BPL @check_if_past_max_allowed_skill                          ; 

@set_skill_index_to_min		
	LDA #MIN_SKILL                                                ; SET MIN RS INDEX = 0

@check_if_past_max_allowed_skill:                                 ; CHECK FOR RS SKILL INDEX > MAX INDEX
	CMP #MAX_PLAYER_SKILL_RATING+1                                              ; IS RS SKILL INDEX < MAX INDEX
	BCC @combine_new_rs_skill_with_rp_index                       ; YES->SAVE NEW RS SKILL INDEX

@set_skill_index_to_max	
	LDA #MAX_PLAYER_SKILL_RATING                                                ; 

@combine_new_rs_skill_with_rp_index:                              ; SAVE NEW RS SKILL INDEX
	ORA rp_index                                                  ;
	
SAVE_RS_RP_INDEX_SET_CUR_SPEED_AND_VEL:                           ; SAVE RS/RP INDEX VALUES AND UPDATE CURRENT SPEED AND VELOCITY
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE NEW RS_RP INDEX
	AND #$0F                                                      ; LOAD RUNNING SPEED INDEX
	TAY                                                           ;
	LDA RUNNING_SPEED_VALUES_TABLE,Y                              ; LOAD RUNNING SPEED FROM RUNNING SPEED VALUES
	SET_CUR_PLAYER_SPEED
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND



change_max_speed_value = PLAYER_COMMAND_ARG1 
	
INCR_DECR_MS_COMMAND_START:                                       ; E3 CHANGE MS (AMOUNT)
	LOAD_CUR_PLAYER_MAX_SPEED
	CLC                                                           ; 
	ADC change_max_speed_value                                    ; + AMOUNT TO BOOST MAX SPEED
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE PLAYER MAX SPEED
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JMUP-> DO NEXT PLAYER COMMAND

_F}_SET_OR_CHANGE_CURRENT_AND_MAX_SPEED_COMMANDS
		
_F{_MAN_CONTROL                                                	  ; DONE

NO_DIRECTION_BY_MAN     = $FF
current_dir_ram_index  = EXTRA_PLAYER_RAM_5


MAN_TAKE_CONTROL_COMMAND_START:                                   ; E4 MAN TAKE CONTROL
	JSR GET_TEAM_CONTROL_TYPE                                     ; GET PLAYER 1 OR PLAYER 2 PLAYER TYPE ( MAN, COA, COM)
	BEQ MAN_CONTROL_START                                         ; DOES PLAYER TYPE = MAN? YES-> MAN CONTROL START
	JMP SKIP_PAST_MAN_CONTROL_COMMAND                              ; NO->SET COMMAND ADDRESS FORWARD BY ONE BYTE()

MAN_CONTROL_START:                                               ; MAN CONTROL START
	LDA #NO_DIRECTION_BY_MAN                                      ; SET BUTTON INPUT = NOT CHECKED
	LDY #current_dir_ram_index                                    ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDA POSSESSION_STATUS                                         ; IS PLAYER ON OFFENSE OR  ON DEFENSE
	ASL                                                           ; 
	LDY #POSITION_ID                                              ;
	EOR (CURRENT_PLAYER_ADDR),Y                                   ;
	ASL                                                           ;
	BCS MAN_CONTROL_DEFENSE_START                                 ; DEFENSE? YES->MAN CONTROL DEFENSE
	JSR SET_PLAYER_STATUS_TO_MAN_CTRL                             ; SET PLAYER STATUS TO MAN CONTROLLED()

@check_for_qb_has_ball:	

_WHILE VALUE_CLEAR 												  ; MAN CONTROL OFFENSE LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_DIR_VEL_UNLESS_FG_XP                               ; CHECK FOR FG OR XP, PROCESS JOYSTICK INPUT
	BIT PLAY_STATUS                                               ; DOES PLAY STATUS = RECEIVERS AVAILABLE
	
_END_WHILE

	SET_POSSESSION_STATUS_QB_HAS_BALL[]
	
_WHILE EQUAL                                                      ; MAN CONTROL PASS ATTEMPT LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_DIR_VEL_UNLESS_FG_XP                               ; CHECK FOR FG OR XP, PROCESS JOYSTICK INPUT
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER BALL CARRIER
	AND #PLAYER_BALL_CARRIER_BITFLAG                              ;
	BEQ @check_for_qb_has_ball                       			  ; NO->MAN CONTROL OFFENSE LOOP
	
	BIT PLAY_STATUS                                               ; DOES PLAY STATUS = PASS ATTEMPT
	BVC @check_for_qb_has_ball                                    ; NO->MAN CONTROL OFFENSE LOOP
	BMI @check_for_qb_has_ball                                    ; DOES PLAY STATUS = PLAY OVER? YES->MAN CONTROL OFFENSE LOOP *** bug
	
@check_for_man_pass_attempt	
	JSR GET_PLAYER_JOY_PRESS                                      ; GET P1 OR P2 JOYPAD PRESS()   
	AND #B_BUTTON                                                 ; DOES PRESS = “B BUTTON” 
	
_END_WHILE                                                        ; NO->MAN CONTROL PASS ATTEMPT LOOP

wait_time_after_pass = PLAYER_COMMAND_ARG1	
	
	LDX CURRENT_PASS_TARGET                                       ; LOAD CURRENT TARGET FROM PASS TARGETS
	LDA PASS_TARGET_INFO,X                                        ; 
	JSR GET_P1_P2_RAM_ADDR                                        ; GET PLAYER POINTER(A= POSITION ID + P1 OR P2 INFO)
	
	LDA #<MAN_CONTROL_PLAYER_CODE                                 ;
	STA TARGET_PLAY_CODE_ADDR                                     ;
	LDA #>MAN_CONTROL_PLAYER_CODE                                 ;
	STA TARGET_PLAY_CODE_ADDR+1                                   ; SAVE MAN CONTROL CODE ADDRESS IN EB EC
	JSR START_OF_PASS_ATTEMPT                                     ; MAN/COM PLAYER PASS INITIAL CALCULATIONS
	LDA #$00                                                      ; SET TIME = INFINITE
	STA wait_time_after_pass                                      ; 
	JMP TURN_COMMAND_START                                        ; JUMP->F4 TURN TOWARDS BALL (TIME)

	
slowdown_timer_index    = EXTRA_PLAYER_RAM_3
defender_rp_rs_temp     = LOCAL_8

MAN_CONTROL_DEFENSE_START:                                       ; MAN CONTROL DEFENSE
	LDA BALL_STATUS                                               ; DOES BALL STATUS = INTERCEPTED, DEFLECTED, CAUGHT, FUMBLED, RECOVERED
	AND #$F8                                                      ;     
	BNE @set_defender_can_collide_be_blocked_by_all               ; YES->SET DEFENDER CAN COLLIDE WITH ALL PLAYERS
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER MAN CONTROLLED? 
	ASL                                                           ;
	BMI @man_defender_input_loop                                  ; YES->MAN DEFENDER INPUT LOOP
	JSR SET_PLAYER_STATUS_TO_MAN_CTRL                             ; SET PLAYER STATUS TO MAN CONTROLLED()
	LDA #DEFENDER_SLOW_DOWN_DELAY_FRAMES                          ; SET DEFENDER SPEED TIMER = 30 FRAMES = 0.5 SECONDS
	LDY #slowdown_timer_index                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;

@wait_to_slow_down_man_defender:
	
_WHILE NOT_EQUAL                                                 ; DEFNDER SPEED 0.5 SECOND TIMER LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_DIR_VEL_UNLESS_FG_XP                               ; CHECK FOR FG OR XP, PROCESS JOYSTICK INPUT
	LDY #slowdown_timer_index                                     ; DEFENDER SPEED TIMER--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ;
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	
_END_WHILE                                                        ; TIMER DONE? NO->DEFENDER SPEED 0.5 SECOND TIMER LOOP

	LOAD_CUR_PLAYER_RP_RS_INDEXES
	AND #$F0                                                      ;
	CMP #MINIMUM_RUSHING_POWER_AFTER_SLOWDOWN                     ; 
	BCS @reduce_defender_rp_and_max_speed                         ; YES->DROP DEFENDER RP 3 SKILL LEVELS   

@set_defender_rp_to_31: 
	LDA #MINIMUM_RUSHING_POWER_AFTER_SLOWDOWN                      ; SET MIN MAN DEFNEDER RP = 31


@reduce_defender_rp_and_max_speed:                               ; DROP MAN DEFENDER RP 3 SKILL LEVELS, MAX SPEED 7 SKILL LEVELS
	SEC                                                           ; SET DEFENDER RP = DEFENDER RP – 3 SKILL LEVELS
	SBC #RUSHING_POWER_TO_SUBTRACT_MAN_DEF_SLOWDOWN               ; 
	STA defender_rp_rs_temp                                       ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	AND #$0F                                                      ; 
	ORA defender_rp_rs_temp                                       ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #MAX_SPEED	                                                ; SET DEFENDER MAX SPEED = SPEED VALUE – 7 SKILL LEVELS
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ;
	ADC #MAX_SPEED_TO_SUBTRACT_MAN_DEF_SLOWDOW                    ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDX #$01                                                      ; SET TEAM ON OFFENSE = P2
	LOAD_CUR_PLAYER_POSITION_ID                                   ;
	BPL @set_def_collision_based_on_play_call                     ; YES->PASS OR RUN PLAY CHECK

@set_team_on_offense_p1	
	DEX                                                           ; SET TEAM ON OFFENSE = P1

@set_def_collision_based_on_play_call:                           ; PASS OR RUN PLAY CHECK
	LDA PLAY_CALLS,X                                              ; 
	CMP #PASS_CALL_ID                                             ; DOES OFFENSE PLAY CALL = RUN?
	BCC @set_defender_can_collide_be_blocked_by_all               ; YES->SET DEFENDER CAN COLLIDE WITH ALL PLAYERS
	CMP #PUNT_PLAY_CALL_ID                                        ; DOES OFFENSE PLAY CALL = FG OR PUNT? 
	BCS @set_defender_can_collide_be_blocked_by_all               ; YES->SET DEFENDER CAN COLLIDE WITH ALL PLAYERS
	
@pass_call_set_defender_collision: 
	SET_COLLIDE_BITMASK_ALL_BUT_SKILL_PLAYERS
	JSR SET_CAN_COLLIDE_USING_PLAYERS_BITMASK                      ; UPDATE CAN COLLIDE (X,Y= BITMASK OF CAN COLLIDE)
	SET_COLLIDE_BITMASK_ALL_BUT_SKILL_PLAYERS
	JSR SET_CAN_BLOCK_STATUSES                                    ; UPDATE PLAYERS TO BLOCK(X,Y= BITMASK OF PLAYERS TO BLOCK)
	JMP @man_defender_input_loop                                  ; JUMP->MAN DEFENDER INPUT LOOP

@set_defender_can_collide_be_blocked_by_all:                      ; SET DEFENDER CAN COLLIDE WITH ALL PLAYERS 
	JSR SET_CAN_COLLIDE_CAN_BLOCK_ALL                             ; SET PLAYER CAN COLLIDE AND CAN BLOCK ALL PLAYERS()

	
	
@man_defender_input_loop:                                         ; MAN DEFENDER INPUT LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_DIR_VEL_UNLESS_FG_XP                               ; CHECK FOR FG OR XP, PROCESS JOYSTICK INPUT     
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER BALL CARRIER? 
	AND #PLAYER_BALL_CARRIER_BITFLAG                                                      ; 
	BNE @man_defender_input_loop                                  ; YES->MAN DEFENDER INPUT LOOP

@defender_doesnt_have_ball:	
	JSR SET_DEF_VEL_ZERO_IF_NEAR_TOP_BOT_SCREEN                   ; SET Y VELOCITY TO ZERO IF PLAYER NEAR EDGE OF SCREEN()
	JSR GET_PLAYER_JOY_PRESS                                      ; GET P1 OR P2 JOYPAD PRESS() 
	AND #B_BUTTON                                                 ; DOES PRESS =  B BUTTON
	BEQ @man_defender_input_loop                                  ; NO-> MAN DEFENDER INPUT LOOP 
	LDX #$FF                                                      ; SET DIVE CHANCE TO 100%   
	JSR CHECK_FOR_DIVE[chance]                                    ; DIVE CHECK ROUTINE(X=DIVE CHANCE)
	JMP @man_defender_input_loop                                  ; JUMP->MAN DEFENDER INPUT LOOP

UPDATE_DIR_VEL_UNLESS_FG_XP:                                     ; CHECK FOR FG OR XP, PROCESS JOYSTICK INPUT 
	LDA POSSESSION_STATUS                                         ; DOES PLAY STATUS = FG OR XP ATTEMPT
	AND #FG_BITMASK                                               ; 
	BNE FG_XP_MAN_CTRL                                            ; YES->FG OR XP ATTEMPT
	JMP UPDATE_MAN_DIRECTION_VELOCITY                             ; JUMP->MAN CONTROL INPUT LOOP()



FG_XP_MAN_CTRL:                                                   ; FG OR XP ATTEMPT
	PLA                                                           ; REMOVE COMMAND RETURN LOCATION 
	PLA                                                           ; 
	
_WHILE CC                                                        ; FG MAN CONTROL LOOP
	LDA #DEFENDER_MAN_INPUT_FG_XP_DELAY_FRAMES                    ; LOAD 3 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES + RAND 0-3 )3-6 frames
	JSR UPDATE_MAN_DIRECTION_VELOCITY                             ; MAN CONTROL INPUT LOOP()
	JSR CHECK_IF_BALL_CAN_BE_RECOVERED                            ; CHECK FOR FUMBLE RECOVERY()

_END_WHILE	
	
	JSR BLOCKED_KICK_FUMBLED_BALL_RECOVERED                       ; DO FUMBLE RECOVERY()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] DEFENDER_MAN_INPUT_RECOVER_FG_BLOCK_DELAY_FRAMES
	JMP MAN_TAKE_CONTROL_COMMAND_START                            ; JUMP->MAN TAKE CONTROL START

SKIP_PAST_MAN_CONTROL_COMMAND:                                    ; SKIP PAST MAN CONTROL BYTE()
	LDA #$01                                                      ; SET AMOUNT = 1 BYTE
	JSR UPDATE_CUR_PLAYER_PLAY_CODE_ADDR_BY_AMT                   ; UPDATE PLAY COMMAND ADDRESS(A= AMOUNT)
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND 

SET_PLAYER_STATUS_TO_MAN_CTRL:                                    ; SET PLAYER STATUS TO MAN CONTROLLED
	SET_CURRENT_PLAYER_MAN_CONTROLLED[]
	RTS                                                           ; RETURN

_F}_MAN_CONTROL 

_F{_KICKOFF_COMMAND                                               ; DONE
	
KICKOFF_COMMAND_START:                                            ; E5 (KICKOFF COMMAND)

@set_kicker_sprite:
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT:                          ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(PLAYER_STANDING_SPRITE_DATA)                           ; SET SPR ADDR = PLAYER STANDING SPRITE ADDRESS
	LDX #>(PLAYER_STANDING_SPRITE_DATA)                           ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)

@start_kick_bar:
	LDY #<(UPDATE_KICK_POWER_BAR-1)                               ; SET COLL ADDR = KICKOFF COLLISION LOGIC
	LDX #>(UPDATE_KICK_POWER_BAR-1)                               ; 
	JSR UPDATE_PLAYER_COLL_ADDR                                   ; UPDATE COLLISION LOGIC ADDRESS AND COLLISION COUNTER(X,Y=Address)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 3

@set_ball_sprite_info:
	LDA LOS_Y                                                     ; SET CURRENT BALL Y== LOS Y
	STA BALL_Y + 1                                                ; 
	SEC                                                           ; 
	SBC #$0E                                                      ; SET BALL SPRITE Y = CURRENT BALL Y - 1.75 YARDS
	STA BALL_SPR_Y                                                ; 
	CLC                                                           ;
	ADC #$04                                                      ; SET BALL SHADOW SPRITE Y = CURRENT BALL Y - 1.25 YARDS
	STA BALL_SHADOW_SPR_Y                                         ;
	LDA #VERTICAL_BALL_TILE_ID                                     
	STA BALL_SPR_TILE                                             ; SET BALL TILE ID = VERTICAL BALL
	STA BALL_SHADOW_SPR_TILE                                      ; SET BALL SHADOW TILE ID = VERTICAL BALL
	LDA #$00                                                      ; SET BALL PALLETE 
	STA BALL_SPR_ATTR                                             ;
	LDA #$01                                                      ; SET BALL SHADOW PALLETE 
	STA BALL_SHADOW_SPR_ATTR                                      ;
	LDA LOS_X                                                     ; SET BALL SPRITE X and BALL SHADOW SPRITE X to LOS X LOW- SCROLL X LOW - 0.5 YARDS
	SEC                                                           ;
	SBC CURR_X_SCROLL                                             ;
	SBC #$04                                                      ;
	STA BALL_SPR_X                                                ;
	STA BALL_SHADOW_SPR_X                                         ;

@change_tile_bank_for_kick:
	LDA #HOLDER_AND_KICKER_CHR_BANK                               ; SET SPR 1800 TILE BANK = HOLDER AND KICKER SPRITES 
	STA SOFT_CHR_1800_BANK                                        ;

@update_displayed_name:
	LDA #KICKER_STARTER_ID                                        ; LOAD KICKER VALUE
	JSR SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; UPDATE P1 OR P2 ICON(A= PLAYER VALUE)
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 16                ; 
	JSR GET_TEAM_CONTROL_TYPE                                     ; GET PLAYER 1 OR PLAYER 2 PLAYER TYPE ( MAN, COA, COM)
	BNE @com_kick_off_start                                       ; DOES PLAYER TYPE  = COM/COA-> COM KICK OFF START
	
@man_kick_off_start:                                              

_WHILE PLUS                                                        ; MAN WAIT FOR KICK LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR GET_PLAYER_JOY_PRESS                                    	; GET P1 OR P2 JOYPAD PRESS()

_END_WHILE                                                        ; “A” PRESSED? NO->MAN WAIT FOR KICK LOOP

	JSR GET_PLAYER_JOY_INPUT_RAW                                  ; GET P1 OR P2 JOYPAD RAW()    
	JMP DO_KICKER_KICKOFF                                        ; JUMP->KICKOFF ROUTINE (A= KICKOFF DIRECTION)


@com_kick_off_start:                                              ; COM KICK OFF START

kick_meter_value		= EXTRA_PLAYER_RAM_3

	LDA RANDOM_1                                                  ; SET COM KICKOFF TIMING = 0x1E to 0x5D FRAMES = 0.5 to 1.5 seconds
	AND #MAXIMUM_COM_ADD_WAIT_FRAME_KICKOFF                       ;
	CLC                                                           ;
	ADC #MINIMUM_COM_WAIT_FRAMES_KICKOFF	                      ;
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	LDA BALL_STATUS_SPECIAL                                       ; DOES SPECIAL BALL STATUS = ONSIDES KICK? 
	AND #$04                                                      ;
	BNE @com_onsides_kick                                         ; YES->SET COM RANDOM ONSIDES KICK BAR VALUE

_WHILE CC                                                         ; MAKE SURE COM KICK IS NOT ONSIDES 
	JSR HEAVIER_RANDOMIZE                                         ; UPDATE RANDOMS AND GET RANDOM NUMBER SAVE INTO A REGISTER()
	AND #MAXIMUM_COM_ADD_WAIT_FRAME_NOT_ONSIDE                    ; 
	CLC                                                           ;
	ADC #MINIMUM_COM_WAIT_FRAMES_NOT_ONSIDE                        ; 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	LDY #kick_meter_value                                         ; LOAD KICK BAR VALUE 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	CMP #END_OF_ONSIDES_METER                                     ; KICK BAR VALUE  > ONSIDES VALUE? 

_END_WHILE                                                       ; NO->MAKE SURE COM KICK IS NOT ONSIDES

	JMP @com_set_random_kick_direction                            ; YES->SET RANDOM KICKOFF DIRECTION AND JUMP TO KICKOFF START

@com_onsides_kick:                                               ; SET COM RANDOM ONSIDES KICK BAR VALUE
	JSR HEAVIER_RANDOMIZE                                         ; GET MORE RANDOM RANDOM NUMBER SAVE INTO A REGISTER()
	AND #MAXIMUM_COM_ADD_WAIT_FRAME_ONSIDE                                                     ;
	CLC                                                           ;
	ADC #MINIMUM_COM_WAIT_FRAMES_ONSIDE                                                      ; SET COM ONSIDE TIMING =  1 TO 8 FRAMES 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	LDY #kick_meter_value                                         ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	CMP #END_OF_ONSIDES_METER                                      ; IS CURRENT KICKOFF BAR LOCATION > ONSIDES? 
	BCS @com_onsides_kick                                         ; YES->SET COM RANDOM ONSIDES KICK BAR VALUE

@com_set_random_kick_direction:                                  ; SET RANDOM KICKOFF DIRECTION AND JUMP TO KICKOFF START
	LDA RANDOM_2                                                  ; RANDOM COM KICKOFF DIRECTION = RAND 1 && RAND 2
	AND RANDOM_3                                                  ;
	JMP DO_KICKER_KICKOFF                                         ; JUMP->KICKOFF ROUTINE (A= KICKOFF DIRECTION)

_F}_KICKOFF_COMMAND 
	
_F{_PUNT_COMMAND 												   ; DONE

special_punter_sprite			= $01 

punt_meter_index	=  EXTRA_PLAYER_RAM_3
punt_skill_value	= LOCAL_6
punt_meter_value	= LOCAL_7									  ; 0 to 48 yards
punt_meter_index	= EXTRA_PLAYER_RAM_3

frames_for_com_to_wait_for_punt		= EXTRA_PLAYER_RAM_1	
return_command_addr					= EXTRA_PLAYER_RAM_4

PUNT_COMMAND_START:                                               ; E6 PUNT PLAY COMMAND
	LDY #HP_INDEX                                                 ; SAVE PUNTER HP 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA PUNTER_HP                                                 ; 
	LDA #$01                                          			  ; SET PLAYER MOVEMENT VALUE = SPECIAL PUNT SPRITE INFO
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT                           ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(PLAYER_STANDING_SPRITE_DATA)                           ; SET SPR ADDR =  PLAYER STANDING SPRITE ADDRESS
	LDX #>(PLAYER_STANDING_SPRITE_DATA)                           ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)

@check_for_punt_snap

_WHILE EQUAL                                                        ; BALL SNAP CHECK
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = BALL SNAPPED
	AND #$04                                                      ;     

_END_WHILE                                                       ; NO->BALL SNAP CHECK

																  ; BALL SNAPPED
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR SET_SHOTGUN_LOCATION_DO_ANIMATION                         ; DO BALL SNAP MOVEMENT CALCULATION AND CREATE THREAD()
	SET_CLOCK_SPEED_TO_PUNT[]
	JSR CLEAR_BANNER_KICKBAR_AREA                                 ; CLEAR PPU(2040 to 205F, 2060 to 207F), CLEAR PLAYER RAM 1D, UPDATE BANNER SCENE
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8

@update_punter_name:
	LDA #PUNTER_STARTER_ID                                         ; SET TEAM POSITION ID = PUNTER
	JSR SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; UPDATE P1 OR P2 ICON(A= PLAYER POSITION)
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()

_WHILE VALUE_CLEAR                                               ; WAIT FOR HOLDER TO GET BALL LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PUNT_POWER_BAR                                     ; UPDATE PUNT BAR GRAPHIC AND VALUE ()
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL HAS COLLIDED
	
_END_WHILE                                                       ; NO-> WAIT FOR HOLDER TO GET BALL LOOP

@punter_receives_punt_snap:
	JSR PLAY_CATCH_SOUND_END_BALL_ANI                             ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION =NOT MOVING & NOT BEING PITCHED()
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL() 
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR GET_TEAM_CONTROL_TYPE                                     ; GET PLAYER 1 OR PLAYER 2 PLAYER TYPE ( MAN, COA, COM)
	BNE @com_punt_start                                           ; NOT MAN?-> COM PUNT, HOLDER HAS BALL STATRT

@wait_for_man_to_press_a_to_punt:
	
_WHILE PLUS                                                        ; MAN PUNT, HOLDER HAS BALL START

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PUNT_POWER_BAR                                      ; UPDATE PUNT BAR VALUE
	JSR GET_PLAYER_JOY_PRESS                                       ; GET P1 OR P2 JOYPAD PRESS()
	
_END_WHILE                                                         ; A PRESSED? NO-> MAN PUNT, HOLDER HAS BALL START

	JMP @calculate_punt_distance                                  ; YES->START PUNT
	
	
@com_punt_start:                                                  ; COM PUNT, HOLDER HAS BALL START
	JSR HEAVIER_RANDOMIZE                                         ; MAKE RANDOM # MORE RANDOM NUMBER SAVE INTO A REGISTER
	AND #MAXIMUM_COM_FRAMES_INIT_PUNT_DELAY                       ; SETS TIME= BAR 3/4 FULL TO 1/2 FULL NEW CYCLE
	CLC                                                           ;
	ADC #MINIMUM_COM_WAIT_FRAMES_PUNT                             ; 
	JSR @save_wait_frames_punt_and_update_punt_bar                ; UPDATE PUNT BAR GRAPHIC AND DECREMENT TIMERS(A=TIME)
	
	LDA RANDOM_1                                                  ; LOAD RANDOM NUMBER
	CMP #PUNT_ADDITIONAL_DELAY_CHANCE                             ;
	BCS @do_additional_punt_delay_than_punt                       ; 25% CHANCE-> RANDOM DELAY (0-32 frame kick delay ~ 0.5 sec)  


	
_WHILE CC                                                         ; CHECK FOR COM PUNT BAR AT LEAST HALF FULL LOOP
	LDA RANDOM_2                                                  ; SET TIME CHECK = 15 FRAMES =0.25 SECONDS
	AND #MAXIMUM_COM_FRAMES_AFTER_HALF_FULL                       ; 
	JSR @save_wait_frames_punt_and_update_punt_bar                ; UPDATE PUNT BAR GRAPHIC AND DECREMENT TIMERS(A=TIME)
	LDY #punt_meter_index                                         ; IS PUNT BAR VALUE > HALF FULL
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CMP #PUNT_METER_HALF_FULL_VALUE                               ; 
_END_WHILE                                                        ; NO-> CHECK FOR COM PUNT BAR AT LEAST HALF FULL LOOP

	JMP @calculate_punt_distance                                  ; JUMP->START PUNT

@do_additional_punt_delay_than_punt:                              ; RANDOM DELAY (0-32 frame kick delay ~ 0.5 sec)   
	LDA RANDOM_2                                                  ; MAKE COM PUNT DELAY TIME = RANDOM 0.0 - 0.5 SECONDS
	AND #MAXIMUM_COM_FRAMES_FINAL_PUNT_DELAY                      ; 
	JSR @save_wait_frames_punt_and_update_punt_bar                ; UPDATE PUNT BAR GRAPHIC AND DECREMENT TIMERS(A=TIME)

	

	
@calculate_punt_distance:                                         ; START PUNT
	JSR SET_PLAYER_NOT_MAN_NOT_BALL_CARRIER                       ; SET PLAYER MOVEMENT TO COM CONTROL AND PLAYER NOT BALL CARRIER()
	LDY #PUNTING_ABILITY_INDEX                                    ; SET SKILL INDEX = PUNT SKILL
	LDA #PUNTER_STARTER_ID                                        ; SET PLAYER ID  =  PUNTER 
	JSR GET_KICKER_PUNTER_SKILL_VALUE                             ; GET KICKER PUNTER SKILL VALUE(Y= SKILL INDEX A=PLAYER) 
	ASL                                                           ; SKILL DISTANCE TO ADD = PUNT SKILL * 8 = (0 TO 15 YARDS)
	ASL                                                           ;
	ASL                                                           ;
	STA punt_skill_value                                          ; SAVE in $43 

	LDY #punt_meter_index                                         ; LOAD KICK METER VALUE (RANGE 0 to 0x5E = 0 TO 12 YARDS)
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDX #PUNT_METER_MULTIPLIER                                     ; SET AMOUNT TO MULTIPLY BY = 4
	JSR MULTIPLY_A_TIMES_X                                        ; MULTIPLY (A * X) = KICK METER VALUE * 4 
	LDA punt_meter_value                                          ; DISTANCE BASED ON METER = (RANGE = 0 TO 48 YARDS)
	CLC                                                           ;
	ADC #MINIMUM_PUNT_DISTANCE                                    ; + MINIMUM PUNT DISTANCE = (15 yards)
	TAY                                                           ; 
	LDA punt_meter_value +1                                       ; 
	ADC #$00                                                      ;
	TAX                                                           ;
	TYA                                                           ;
	CLC                                                           ;
	ADC punt_skill_value                                          ; + PLAYER SKILL (0-15 yards) 
	TAY                                                           ;
	TXA                                                           ;
	ADC #$00                                                      ; = KICK METER(0-48YD) +MINIMUM PUNT DISTANCE(15 yards) + PUNTER SKILL (0-15 YARDS)
	TAX                                                           ; RANGE (15-78 YARDS) 

@set_punt_speed_and_gravity:
	LDA #PUNT_BALL_GRAVITY                                         ; SET BALL LOFT = PUNT LOFT 
	STA BALL_GRAVITY_INDEX                                         
	LDA #PUNT_BALL_SPEED                                          ; SET BALL SPEED  = PUNT SPEED 
	STA BALL_SPEED                                                ; 

@do_punt_animation:
	LDA #PUNT_FINAL_Y_LOCATION                                    ; LOAD PUNT FINAL Y LOCATION 
	JSR SET_FINAL_KICK_LOCATION_START_ANIMATION                   ; KICK/PUNT DISTANCE CALCULATION
	JSR UPDATE_PLAY_STATUS_TO_BALL_KICKED                         ; SET PLAY STATUS = BALL KICKED()
	LDA #$01                                                      ; LOAD PUNT CUTSCENE 
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE                             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) 
	LDY #HP_INDEX                                                 ; RESTORE PUNTER HP 
	LDA PUNTER_HP                                                ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND


	
@save_wait_frames_punt_and_update_punt_bar:                       ; UPDATE PUNT BAR GRAPHIC AND DECREMENT TIMERS(A= TIME BEFORE COM PUNTS)
	CLC                                                           ; PUNT GRAPHIC TIMER = RANDOM TIME + 1 FRAME 
	ADC #$01                                                      ; 
	LDY #frames_for_com_to_wait_for_punt                          ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE IN PLAYER RAM
	PLA                                                           ; SAVE COMMAND RETURN ADDRESS IN 1E/1F
	LDY #return_command_addr                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	PLA                                                           ;
	INY                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;

_WHILE NOT_EQUAL 
                                                                 ; PUNT BAR GRAPHIC TIMER LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PUNT_POWER_BAR                                     ; UPDATE PUNT BAR GRAPHIC()
	LDY #frames_for_com_to_wait_for_punt                          ; PUNT TIMER--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ;
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	
_END_WHILE                                                        ; PUNT BAR FULL? NO->PUNT BAR TIMER LOOP 
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F ()

	
_F}_PUNT_LOGIC 

_F{_FG_XP_LOGIC

FG_KICK_TYPE	= $00
XP_KICK_TYPE	= $FF

kick_type						= LOCAL_8
kicker_skill_value_index		= EXTRA_PLAYER_RAM_1

KICK_FG_COMMAND_START:                                            ; E7 FG PLAY COMMAND
	LDA #FG_KICK_TYPE                                              ; SET KICK TYPE = FG
	JMP START_OF_FG_XP_KICK                                      ; *** could be BPL
	
KICK_XP_COMMAND_START:                                            ; E8 XP PLAY COMMAND
	LDA #XP_KICK_TYPE                                             ; SET KICK TYPE = XP

START_OF_FG_XP_KICK:                                             ; FG OR XP START(A=KICK TYPE)
	STA kick_type                                                 ; SAVE KICK TYPE in $45
	LDA #KICKER_STARTER_ID                                        ; SET PLAYER VALUE = KICKER 
	JSR SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; UPDATE P1 OR P2 ICON(A= PLAYER VALUE)
	JSR SET_PLAYER_CAN_KICK_BALL                                  ; SET PLAYER COLLISION TO CAN KICK  BALL()
	LDA kick_type                                                 ; SAVE KICK TYPE IN MEMORY
	STA KICK_TYPE_SAVE,X                                          ; 
	LDY #KICKING_ABILITY_INDEX                                    ; SET SKILL INDEX = KICKING ABILITY
	LDA #KICKER_STARTER_ID                                        ; SET PLAYER INDEX = KICKER
	JSR GET_KICKER_PUNTER_SKILL_VALUE                             ; GET KICKER PUNTER SKILL VALUE(Y= SKILL INDEX, A=PLAYER)
	TAX                                                           ; SAVE KICKING ABILITY INDEX IN X
	LDY #kicker_skill_value_index                                 ; ALWAYS ZERO NOT USED
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAY                                                           ;
	TXA                                                           ; RESTORE KICKING ABILITY 
	STA KICKING_ABILITY_TEMP,Y                                    ; SAVE in $661 + index (BAD CODE but works) ***
	LDY #AVOID_KICK_BLOCK_INDEX                                   ; SET SKILL INDEX = AVOID KICK BLOCK SKILL 
	LDA #KICKER_STARTER_ID                                        ; SET TEAM POSITION ID =  KICKER 
	JSR GET_KICKER_PUNTER_SKILL_VALUE                             ; GET KICKER/PUNTER SKILL VALUE(Y= SKILL INDEX, A=PLAYER)
	STA AVOID_BLOCK_TEMP,X                                        ; SAVE in $662(*** BUG, X INDEX NOT = 0) 
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT:                          ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(PLAYER_STANDING_SPRITE_DATA)                           ; SET SPR ADDR =  PLAYER STANDING SPRITE ADDRESS
	LDX #>(PLAYER_STANDING_SPRITE_DATA)                           ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)

@wait_for_fg_snap:	
_WHILE EQUAL:                                                     ; CHECK FOR SNAP LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = BALL SNAPPED?
	AND #$04                                                      ; 
	
_END_WHILE                                                        ; NO?-> CHECK FOR SNAP LOOP


	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()

@wait_for_holder_receive_ball:	
_WHILE VALUE_CLEAR                                                 ; CHECK FOR BALL COLLIDED WITH HOLDER LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL COLLIDED? 

_END_WHILE                                                 ; NO-> CHECK FOR BALL COLLIDED WITH HOLDER LOOP
	
@set_collision_addr_to_fg_arrow:
	
	LDY #<(UPDATE_FG_ARROW_START-1)                               ; SET COLLISION ADDR = FG ARROW TASK ADDRESS
	LDX #>(UPDATE_FG_ARROW_START-1)                               ;
	JSR UPDATE_PLAYER_COLL_ADDR                                   ; UPDATE COLLISION LOGIC ADDRESS AND COLLISION COUNTER(X,Y=Address)
	JSR GET_TEAM_CONTROL_TYPE                                     ; GET PLAYER 1 OR PLAYER 2 PLAYER TYPE (MAN, COA, COM)
	BNE @start_of_com_kick_fg                                     ; DOES PLAYER TYPE = COM/COA? YES->COM/COA FG         

@wait_for_man_kick	
_WHILE PLUS                                                        ; MAN FG WAIT FOR KICK LOOP 

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR GET_PLAYER_JOY_PRESS                                       ; GET P1 OR P2 JOYPAD PRESS()
	
_END_WHILE 
                                                        ; A PRESSED? NO->MAN FG WAIT FOR KICK LOOP 
	JMP @move_player_towards_ball                                  ; YES->START OF FG

@start_of_com_kick_fg:                                            ; COM/COA FG 
	LDY #kicker_skill_value_index                                 ; NOT USED
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;     
	TAY                                                           ;
	LDA KICKING_ABILITY_TEMP,Y                                    ; LOAD KICKING ABILITY SKILL *** should fix to one variable
	CLC                                                           ;
	ADC #$04                                                      ; + COM FG ACCURACY BOOST
	CMP #MAX_PLAYER_SKILL_RATING                                  ; KICKING ABILITY SKILL > MAX
	BCC @save_com_kick_skill_wait_to_kick                         ; NO->COM KICK DELAY AND SAVE KICK ABILITY 


@set_kicking_ability_to_max	
	LDA #MAX_PLAYER_SKILL_RATING                                  ; SET KICKING ABILITY SKILL = MAX ABILITY
	
@save_com_kick_skill_wait_to_kick:                                ; COM KICK DELAY AND SAVE KICK ABILITY
	STA KICKING_ABILITY_TEMP,Y                                    ; SAVE KICKING ABILITY *** should fix to one variable
	LDA RANDOM_1                                                  ; SET RANDOM COM KICK DELAY =  10 to 41 FRAMES
	AND #MAXIMUM_COM_ADD_FRAME_DELAY_FG	                          ; 0-31 frames
	CLC                                                           ;
	ADC #MINIMUM_COM_WAIT_FRAMES_FG                               ; + 10 frames
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)


@move_player_towards_ball:                                        ; START OF FG 
	LDY #<(RESET_CURRENT_SPEED_RP_TO_INITIAL_VALUES-1)             ; SET COLLISION ADDR = UPDATE SPEED/DO NORMAL COLLISION LOGIC
	LDX #>(RESET_CURRENT_SPEED_RP_TO_INITIAL_VALUES-1)             ;
	JSR UPDATE_PLAYER_COLL_ADDR                                   ; UPDATE COLLISION LOGIC ADDRESS AND COLLISION COUNTER(X,Y=ADDR)
	JSR SET_FINAL_KICKER_LOCATION                                 ; UPDATE AMOUNT NEED TO MOVE TO KICK BALL AND STORE IN 1E 1F()
	JSR SET_PLAYER_STATUS_TO_MOVING_INIT_RS_RP                    ; CHANGE PLAYER TO MOVING AND INITIALIZE RS AND RP()
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

_WHILE CC                                                        ; CHECK FOR KICKER REACHED BALL LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	
_END_WHILE                                                        ; KICKER REACHED BALL? NO-> CHECK FOR KICKER REACHED BALL LOOP
	
holder_addr			= LOCAL_1	
	
@check_for_kicker_tackled:	
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = KICKER TACKLED? 
	BPL @do_kick                                                 ; NO->  KICKER KICKED BALL
	JMP KICK_HOLDER_TACKLED                                       ; YES-> KICKER TACKLED 

@do_kick:                                                         ; KICKER KICKED BALL
	JSR COPY_MAN_PLAYER_ADDR_TO_TEMP                              ; COPY OFFENSE ACTIVE PLAYER POINTER TO 3E/3F()
	LDY #MOVEMENT_STATUS                                          ; SET HOLDER VALUE = PLAYER NOT BALL CARRIER
	LDA (holder_addr),Y                                           ;
	AND #PLAYER_NOT_BALL_CARRIER_BITMASK                          ;
	STA (holder_addr),Y                                           ; 
	SET_PLAY_STATUS_BALL_KICKED[]
	
@check_players_close_enoug_to_block:	
	JSR CHECK_PLAYER_CLOSE_ENOUGH_BLOCK_KICK                      ; CHECK FOR PLAYER CLOSE ENOUGH TO BLOCK KICK()
	LDA $E1                                                       ; $E1 >=1 =YES, 0=NO
	BEQ @set_normal_fg_cutscne_id                                 ; NO-> NO KICK BLOCK 
	
@check_if_kick_is_block	
	LDY #kicker_skill_value_index                                  ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	TAX                                                           ;
	LDY AVOID_BLOCK_TEMP,X                                        ; GET AVOID KICK BLOCK SKILL BUG ALWAYS 0 = USES WORST AVOID KICK BLOCK
	LDA RANDOM_3                                                  ; LOAD RANDOM NUMBER 3D
	CMP AVOID_KICK_BLOCK_VALUES_TABLE,Y                           ; IS RANDOM # > AVOID KICK BLOCK VALUE FROM AVOID KICK BLOCK TABLE
	BCS @set_kick_block_miss_cutscene_id                          ; YES->KICK BLOCK MISS 
	JMP KICK_BLOCKED                                              ; NO-> KICK BLOCKED

@set_kick_block_miss_cutscene_id:                                 ; KICK BLOCK MISS 
	LDA #$0A                                                      ; LOAD MISS KICK BLOCK CUTSCENE OFFSET               
	JMP @save_cutscene_sequence_index                             ;

@set_normal_fg_cutscne_id:                                         ; NO KICK BLOCK
	LDA #$00                                                      ; LOAD NO BLOCK CUTSCENE OFFSET

@save_cutscene_sequence_index:                                     ; DO NOT BLOCKED CUTSCENE(A = CUTSCENE ID)
	STA $B2                                                       ; SAVE CUTSCENE OFFSET(0= NONE, 0x0A= MISS)
	

MINIMUM_KICK_RANGE				= $0190							      ; = 50 yards
P1_FG_CROSSBAR_LOCATION			= FRONT_RIGHT_ENDZONE				  ; crossbar set to the front of the endzone
P2_FG_CROSSBAR_LOCATION			= FRONT_LEFT_ENDZONE				  ;	
KICK_DISTANCE_SKILL_MULTIPLER	= $06								  ; makes kicker skill range from  0.75 TO 12 YARDS 
RANDOM_KICK_DISTANCE_LIMIT		= $3F								  ; bitmasks rnadom to limit to 0 to 8 yards 

distance_to_crossbar			= LOCAL_3	
kick_distance					= LOCAL_7
	
kick_arrow_location_save	= LOCAL_8	
kick_arrow_location_index	= EXTRA_PLAYER_RAM_3	
cutscene_lookup_offset		= LOCAL_8

	
@load_kicker_skill_value	
	LDY #kicker_skill_value_index                                ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ;
	LDA KICKING_ABILITY_TEMP,X                                    ; LOAD KICKER SKILL VALUE *** NO NEED TO USE ARRAY
	CLC                                                           ;
	ADC #$01                                                      ; 
	LDX #KICK_DISTANCE_SKILL_MULTIPLER                            ;
	JSR MULTIPLY_A_TIMES_X                                        ; MULTIPLY (A * X) = (KICKER SKILL + 1) * 6) = RANGE OF 6 TO 60 = 0.75 TO 11.25 YARDS 
	LDA RANDOM_2                                                  ; MAKE RANDOM # =  0 to 3F = 0 TO 8 YARDS
	AND #RANDOM_KICK_DISTANCE_LIMIT                               ;
	CLC                                                           ;
	ADC kick_distance                                             ;
	STA kick_distance                                             ;
	LDA kick_distance+1                                           ;
	ADC #$00                                                      ;
	STA kick_distance+1                                           ;
	LDA kick_distance                                             ;
	CLC                                                           ;
	ADC #<MINIMUM_KICK_RANGE	                                  ; ADD  0X0190 = 50 YARDS = MINIMUM KICK RANGE
	STA kick_distance                                             ;
	LDA kick_distance+1                                           ;
	ADC #>MINIMUM_KICK_RANGE	                                  ; 
	STA kick_distance+1                                           ; = SKILL(0.75 to to 11.25 YARDS) + RAND(0-8) + 50 = (MAX RANGE 70) BECAUSE CROSSBAR WRONG
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @set_player_two_distance_to_crossbar                      ; YES->PLAYER 2 FG CHECK
	
	
@set_player_one_distance_to_crossbar							  ; PUT P1 CROSSBAR(X)- BALL (X) in $40 $41 
	LDA #<P1_FG_CROSSBAR_LOCATION	                              ; SET P1 CROSSBAR X LOW = CROSS BAR SET TO FRONT OF ENDZONE = WRONG
	SEC                                                           ;
	SBC BALL_X + 1                                                ;
	STA distance_to_crossbar                                      ;
	LDA #>P1_FG_CROSSBAR_LOCATION	                              ; SET P1 CROSSBAR X HIGH
	SBC BALL_X + 2                                                ;
	STA distance_to_crossbar+1                                    ;
	JMP @check_if_fg_long_enough                                  ; JUMP->CHECK IF FG HAS ENOUGH DISTANCE


@set_player_two_distance_to_crossbar:                             ; PUT BALL(X)- P2 CROSSBAR (X) in $40 $41
	LDA BALL_X + 1                                                ;
	SEC                                                           ;
	SBC #<P2_FG_CROSSBAR_LOCATION                                 ; P2 CROSSBAR X LOW = CROSS BAR SET TO FRONT OF ENDZONE WRONG
	STA distance_to_crossbar                                      ;
	LDA BALL_X + 2                                                ;
	SBC #>P2_FG_CROSSBAR_LOCATION                                 ; P2 CROSSBAR X HIGH
	STA distance_to_crossbar+1


	
@check_if_fg_long_enough:                                         ; CHECK IF FG HAS ENOUGH DISTANCE
	LDA kick_distance                                             ; COMPARE KICK DISTANCE (44,45) VS DISTANCE FROM HOLDER TO CROSSBAR (40,41)
	CMP distance_to_crossbar                                      ;
	LDA kick_distance+1                                           ;
	SBC distance_to_crossbar+1                                    ;
	BCS @check_if_fg_accurate                                     ; ENOUGH DISTANCE? YES->CHECK ARROW LOCATION FOR FG MAKE 
	JMP DO_FG_IS_SHORT                                            ; NO->FG IS SHORT
	
@check_if_fg_accurate:                                            ; CHECK ARROW LOCATION FOR FG MAKE
	LDY #kick_arrow_location_index                                ; SAVE ARROW VALUE IN $45
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA kick_arrow_location_save	                              ;
	LDY #Y_POS + 1                                                ; = HOLDER Y LOC - ARROW SPRITE+ 3
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ;
	ADC #$03                                                      ;  + PLAYER TO SPRITE COORDINATE OFFSET 
	SEC                                                           ;
	SBC FG_ARROW_SPR_Y                                            ; = (HOLDER Y LOC + PLAYER TO SPRITE COORDINATE OFFSET) – ARROW SPRITE Y LOC
	BEQ @fg_down_middle                                           ; PERFECT ARROW LOCATION? YES->FG KICK IS DOWN THE MIDDLE 
	
@check_arrow_Above_or_below_holder:	
	PHP                                                           ; SAVE ARROW ABOVE OR ARROW BELOW  
	BCS @calculate_how_far_kick_is_from_center                    ; ARROW ABOVE HOLDER?->CALCULATE Y DISTANCE OFFSET FOR FG
	
@arrow_below_do_abs_value	
	EOR #$FF                                                      ; ABS (ARROW OFFSET)
	CLC                                                           ;
	ADC #$01                                                      ;

@calculate_how_far_kick_is_from_center:                           ; CALCULATE Y DISTANCE OFFSET FOR FG
	ASL kick_arrow_location_save                                  ; = ARROW OFFSET TIMES 4, $45= SUB YARD VALUE
	ROL                                                           ;
	ASL kick_arrow_location_save                                  ;
	ROL                                                           ;
	LDY distance_to_crossbar                                      ; LOAD DISTANCE TO CROSSBAR
	LDX distance_to_crossbar+1                                    ; 
	JSR MULTIPLY_A_TIMES_X_Y                                      ; =MULTIPLY(A* X,Y) =  (ARROW OFFSET * 4) * DISTANCE TO CROSSBAR
	LDY $43                                                       ;
	LDX $44                                                       ;
	LDA #$80                                                      ; SET MULTIPLIER = 0X80
	JSR MULTIPLY_A_TIMES_X_Y                                      ; MULTIPLY(A* X,Y)= 0x80 * (ARROW OFFSET * 4 * DISTANCE TO CROSSBAR)
	LDY #Y_POS + 1                                                ; LOAD Y LOS LOCATION
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	LSR                                                           ; = (Y LOS LOCATION /2) + MAX ARROW DISTANCE
	CLC                                                           ;
	ADC #$3C                                                      ; 
	PLP                                                           ; CHECK FOR BALL ABOVE OR BELOW LOS
	BCS @arrow_above_holder                                       ; ABOVE? YES-> ARROW ABOVE LOS


	
@arrow_below_holder: 	
	CLC                                                           ;
	ADC kick_arrow_location_save                                  ; = LOS + OFFSET FROM LOS
	JMP @check_ball_within_left_upright                           ; JUMP->CHECK FOR BALL WITHIN LEFT UPRIGHT (p1 viewpoint)

@arrow_above_holder:                                              ; ARROW ABOVE LOS
	SEC                                                           ; = 1 - VALUE
	SBC kick_arrow_location_save                                  ;
	JMP @check_ball_within_left_upright                           ; JUMP->CHECK FOR BALL WITHIN LEFT UPRIGHT

@fg_down_middle:                                                  ; FG KICK IS DOWN THE MIDDLE
	LDA #$78                                                      ; 

@check_ball_within_left_upright:                                  ; CHECK FOR BALL WITHIN LEFT UPRIGHT 
	CMP #$68                                                       ; IS THE ARROW LOCATION CLOSE TO THE LEFT UPRIGHT?
	BCS @check_ball_within_right_upright                          ; NO-> CHECK FOR BALL WITHIN RIGHT UPRIGHT
	LDA #$64                                                      ; SET CUTSCENE ID =  WIDE LEFT CUTSCENE

@check_ball_within_right_upright :                                ; CHECK FOR BALL WITHIN RIGHT UPRIGHT
	CMP #$89                                                      ; IS ARROW LOCATION CLOSE TO RIGHT UPRIGHT? 
	BCC @set_cutscene_seq_table_index                             ; NO->
	
	LDA #$8B                                                      ; SET CUTSCENE ID  = WIDE RIGHT CUTSCENE

	
	
@set_cutscene_seq_table_index:                                     ;        
	SEC                                                           ; = ARROW VALUE - FG_UPRIGHT_LEFT
	SBC #$64                                                      ; 
	LSR                                                           ;
	LSR                                                           ;
	CLC                                                           ;
	ADC $B2                                                       ; LOAD CUTSCENE OFFSET (0= NONE, 0X0A = MISS BLOCK)
	STA cutscene_lookup_offset                                    ;
	LDY #$1B                                                      ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAY                                                           ;

@set_cutscene_seq_byte_to_fg:	
	LDX #$00                                                      ; SET KICK TYPE = FG

@check_if_xp_or_fg:	
	LDA KICK_TYPE_SAVE,Y                                          ; IS KICK = XP?
	BPL @do_fg_cutscene                                           ; NO->FINISH FG WITH CUTSCENE
	
@set_kick_type_cutscene_byte_to_xp	
	LDX #$28                                                      ; YES-> SET KICK TYPE = XP 

@do_fg_cutscene:                                                        ; FINISH FG WITH CUTSCENE
	LOAD_CUR_PLAYER_POSITION_ID
	BPL load_cutscene_byte                                        ; P1-> LOAD BALL STATUS AND CUTSCENE BYTE START
	TXA                                                           ;
	CLC                                                           ;
	ADC #$14                                                      ; + OFFSET TO PLAYER 2 cutscene bytes
	TAX                                                           ;
	
load_cutscene_byte:                                               ; LOAD BALL STATUS AND CUTSCENE BYTE START      
	TXA                                                           ; 
	CLC                                                           ;
	ADC cutscene_lookup_offset                                    
	TAX                                                           ;
	LDA FG_XP_CUTSCENCE_SEQUENCE_INDEX_TABLE,X                    ; LOAD CUTSCENE VALUE FROM FG/XP CUTSCENE AND BALL STATUS TABLE
	TAY                                                           ; SAVE CUTSCENE + BALL STATUS
	ASL                                                           ;
	LDA #$00                                                      ;
	ROL                                                           ;
	ROL                                                           ;
	ORA BALL_STATUS                                               ; SET BALL STATUS
	STA BALL_STATUS                                               ;
	TYA                                                           ; LOAD CUTSCENE TYPE
	AND #$7F                                                      ; MASK OUT BALL STATUS BIT
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE                             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) 
	JSR SET_PLAYER_CANT_KICK_BALL                                 ; SET PLAYER COLLISION TO CANT COLLIDE WITH BALL()
	PAUSE_PLAYER_ACTIONS

DO_FG_IS_SHORT:                                                   ; FG IS SHORT
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @set_p2_fg_is_short                                      ; IS P2->LOAD P2 FG is SHORT CUTSCENE INDEX

@set_p1_fg_is_short:
	LDA #$1A                                                      ; SET CUTSCENE ID = P1 FG SHORT
	JMP @check_for_missed_block_attempt

@set_p2_fg_is_short:                                               ; LOAD P2 FG is SHORT CUTSCENE INDEX
	LDA #$1F                                                      ; SET CUTSCENE ID = P2 FG SHORT

@check_for_missed_block_attempt:                                                        ; 
	LDX $B2                                                       ; WAS BLOCK ATTEMPT MISSED? 
	BNE @finish_fg_normal                                         ; NO-> FINISH KICK NORMAL
	CLC                                                           ;
	ADC #$0F                                                      ; SET CUTSCENE ID +=  KICK BLOCK MISS OFFSET

@finish_fg_normal:                                                        ; FINISH KICK NORMAL
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE                             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) 
	JSR SET_PLAYER_CANT_KICK_BALL                                 ; SET PLAYER COLLISION TO CAN’T COLLIDE WITH BALL()
	PAUSE_PLAYER_ACTIONS

KICK_HOLDER_TACKLED:                                              ; HOLDER TACKLED
	LDA #$0A                                                      ; LOAD 10 FRAMES
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	JSR SET_PLAYER_CANT_KICK_BALL                                 ; SET PLAYER COLLISION TO CAN’T COLLIDE WITH BALL()
	PAUSE_PLAYER_ACTIONS

KICK_BLOCKED:                                                      ; KICK BLOCKED
	JSR SET_PLAYER_COLLIDED_WITH_BALL                             ; SET PLAYER COLLISION = COLLIDED WITH BALL()
	SET_BALL_BLOCKED[]
	JSR GET_TEAM_CONTROL_TYPE                                     ; GET PLAYER 1 OR 2 PLAYER TYPE (MAN, COA, COM)
	BNE @kick_blocked_coach_com_control                           ; COM/COA? YES->COA/COM PLAYER
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; SET PLAYER MOVEMENT = MAN CONTROLLED?  
	ORA #$40                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #$09                                                      ; SET PLAY CODE ADDRESS = SPECIAL MAN CONTROL ADDRESS
	LDA #<MAN_CONTROL_PLAYER_CODE                                 ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA #>MAN_CONTROL_PLAYER_CODE                                 ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	
@kick_blocked_coach_com_control:                                                        ; COA/COM PLAYER
	LDY #$0B                                                      ; NOT USED   
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ;
	LDA KICK_TYPE_SAVE,X                                          ; IS FG OR XP? 
	BMI @et_kick_blocked_cutscene_offset                          ; XP-> LOAD XP KICK BLOCKED OFFSET 
	
	
	LDA #$10                                                      ; LOAD FG KICK BLOCK CUTSCENE OFFSET
	JMP @finish_fg_xp_blocked                                     ; JUMP ->FINISH KICK BLOCKED

@et_kick_blocked_cutscene_offset:                                 ; LOAD XP KICK BLOCKED OFFSET
	LDA #$30                                                      ; LOAD XP KICK BLOCK CUTSCENE OFFSET

@finish_fg_xp_blocked:                                            ; FINISH KICK BLOCKED 
	PHA                                                           ; SAVE CUTSCENE TO PLAY
	JSR DO_BALL_BLOCKED_ANI                                       ; START BALL BLOCKED THREAD()
	PLA                                                           ; LOAD CUTSCENE TO PLAY
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE                             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) 
	JSR SET_PLAYER_CANT_KICK_BALL                                 ; SET PLAYER COLLISION TO CAN’T KICK BALL()
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 60
	JSR SET_PLAYER_NOT_COLLIDED_WITH_BALL                         ; SET PLAYER COLLISION = NOT COLLIDED WITH BALL()
	JMP MAN_TAKE_CONTROL_COMMAND_START                            ; JUMP-> MAN TAKE CONTROL

_F}_FG_XP_LOGIC 

_F{_WAIT_RANDOM_TIME_UNUSED                                       ; DONE
	
WAIT_RANDOM_TIME_AFTER_SNAP_COMMAND_START_UNUSED:                 ; E9 WAIT RANDOM TIME TILL AFTER BALL SNAPPED NOT USED
																  ; LOOP START 
	LDA #$03                                                      ; LOAD 3 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = BALL SNAPPED?
	AND #$04                                                      ; 
	BEQ WAIT_RANDOM_TIME_AFTER_SNAP_COMMAND_START_UNUSED          ; NO->LOOP START 
	LDA #$03                                                      ; LOAD 3 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP-> DO NEXT PLAYER COMMAND

_F}_WAIT_RANDOM_TIME_UNUSED
	
_F{_PLAYER_STANCE_COMMANDS										  ; DONE

time_until_motion_arg		= PLAYER_COMMAND_ARG1
time_until_motion_index		= EXTRA_PLAYER_RAM_3
						
THREE_PT_STANCE_COMMAND_START:                                    ; EA (3 PT STANCE PLAY DESIGN COMMAND)
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT                           ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(THREE_PT_SPRITE_DATA)                                       ; SET SPR ADDR =  3PT STANCE SPRITE 
	LDX #>(THREE_PT_SPRITE_DATA)                                       ; 
	JMP WAIT_FOR_SNAP                                                 ; JUMP -> UPDATE SPRITE, SET VELOCITY TO ZERO WAIT FOR SNAP START

FORMATION_SHIFT_COMMAND_START:                                    ; EB (SHIFT STANCE PLAY DESIGN COMMAND)
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT                           ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(THREE_PT_SPRITE_DATA)                                       ; SET SPR ADDR =  3PT STANCE SPRITE 
	LDX #>(THREE_PT_SPRITE_DATA)                                       ;
	JMP DO_PLAYER_FORMATION_SHIFT                                                 ; JUMP -> UPDATE SPRITE DO MOTION, SET VELOCITY TO ZERO WAIT FOR SNAP START

TWO_PT_STANCE_COMMAND_START:                                      ; EC (2PT stance)
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT:                          ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(PLAYER_STANDING_SPRITE_DATA)                           ; SET SPR ADDR = PLAYER STANDING SPRITE
	LDX #>(PLAYER_STANDING_SPRITE_DATA)                           ; 

WAIT_FOR_SNAP:                                                        ; UPDATE SPRITE, SET VELOCITY TO ZERO WAIT FOR SNAP START
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING() 
	
_WHILE EQUAL                                                  ; 2PT STANCE WAIT UNTIL SNAP LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = BALL SNAPPED?
	AND #$04 

_END_WHILE

	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO MOVING,STANDING,READY TO THROW()
	LDA #PLAYER_MOVE_AFTER_SNAP_DELAY                                                      ; LOAD 9 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND

OFF_MOTION_COMMAND_START:                                         ; ED MOTION
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT:                          ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(PLAYER_STANDING_SPRITE_DATA)                           ; SET SPR ADDR = PLAYER STANDING SPRITE
	LDX #>(PLAYER_STANDING_SPRITE_DATA)                           ; 
	
DO_PLAYER_FORMATION_SHIFT:                                        ; UPDATE SPRITE DO MOTION, SET VELOCITY TO ZERO WAIT FOR SNAP START
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	LDA time_until_motion_arg                                     ; SAVE MOTION TIMER VALUE in PLAYER RAM 1D
	LDY #time_until_motion_index                                  ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	
_WHILE NOT_EQUAL
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = BALL SNAPPED?
	AND #$04                                                      ; 
	BNE @ball_snapped                                             ; YES->BALL SNAPPED MOTION IN PROGRESS
	LDY #time_until_motion_index                                  ; MOTION TIMER--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ;
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 

_END_WHILE
	JMP DO_NEXT_PLAYER_COMMAND                                    ; YES-> DO NEXT PLAYER COMMAND
	
@ball_snapped:                                                        ; BALL SNAPPED MOTION IN PROGRESS
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW
	LDA #PLAYER_MOVE_AFTER_SNAP_DELAY                                                      ; LOAD 9 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND

																; ***COULD UPDATE THE POINTER TO GET RID OF THIS JUMP 
QB_PRE_SNAP_STANCE_COMMAND_START:                                 ; 0XEE QB STANCE JUMP
	JMP DO_QB_HUT_ANI_CHECK_FOR_HIKE                              ; JUMP->QB STANCE START

_F}_PLAYER_STANCE_COMMANDS 

_F{_KICK_PUNT_RETURN_LOGIC										  ; DONE
	
RETURN_KICK_PUNT_COMMAND_START:                                   ; EF CHANGE ICON TO RETURNER 
	LDX #KR_STARTER_ID                                            ; SET ICON VALUE = KR
	IF_PLAY_KICKOFF[ADDR] UPDATE_PLAYER_NAME_MAN_CTRL_FOR_RETURN
	
@set_icon_to_pr:	
	INX                                                           ; NO-> SET ICON VALUE = PR

UPDATE_PLAYER_NAME_MAN_CTRL_FOR_RETURN:                           ; UPDATE ICON AND PLAYER POINTER 
	TXA                                                           ; LOAD ICON VALUE
	JSR SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; UPDATE P1 OR P2 ICON(A= TEAM POSITION VALUE)
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	
_WHILE EQUAL                                                      ; WAIT FOR KICKOFF

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS =  BALL KICKED
	AND #$02                                                      ; 
	
_END_WHILE
	
	
	LDA #$00                                                      ; CLEAR RAM 1D
	LDY #EXTRA_PLAYER_RAM_3                                       ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	JSR DO_ADJUST_PLAYER_FINAL_LOCATION_PASS                         ; SET FINAL PLAYER LOCATION AND RETURN DIRECTION()
	BCS @turn_returner_towards_ball                               ; PLAYER AT FINAL LOCATION? YES-> TURN PLAYER TOWARDS BALL 
	
@turn_player_towards_endzone	
	SET_CUR_PLAYER_DIRECTION                                      ; SET PLAYER CURRENT DIRECTION  = NEW DIRECTION

@set_current_speed_to_top_speed	
	LDY #MAX_SPEED                                                ; SET CURRENT SPEED = TOP SPEED
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	DEY                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	
@set_player_moving:	
	SET_CURRENT_PLAYER_MOVING[]
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

@check_for_playerat_final_location:
	
_WHILE CC

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	
_END_WHILE
	
@turn_returner_towards_ball:                                      ; TURN PLAYER TOWARDS BALL 
	LDA BALL_ANGLE                                                ; SET PLAYER DIRECTION TO BALL ANGLE + 180
	CLC                                                           ; 
	ADC #$80                                                      ;
	SET_CUR_PLAYER_DIRECTION
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()

_WHILE VALUE_CLEAR                                               ; HAS RETURNER RECEIVED BALL LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL COLLIDED?

_END_WHILE
	
	SET_BALL_CAUGHT
	JSR PLAY_CATCH_SOUND_END_BALL_ANI                             ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION =NOT MOVING & NOT BEING PITCHED()
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND

_F}_KICK_PUNT_RETURN_LOGIC

_F{_FACE_LOS_COMMAND											  ; DONE

direction_to_face   = PLAYER_COMMAND_ARG1                         ; *** kind of a pointless command could jump from stance

FACE_LOS_COMMAND_START:                                           ; F0 FACE LINE OF SCRIMMAGE 
	LDX direction_to_face                                         ; SAVE DIRECTION VALUE IN x
	LOAD_CUR_PLAYER_POSITION_ID
	BPL @save_direction                                           ; DOES PLAYER SIDE =P1? YES-> SAVE DIRECITION

@invert_direction_for_side_two:	
	TXA                                                           ; INVERT DIRECTION FOR PLAYER 2 SIDE
	EOR #$7F                                                      ;
	TAX                                                           ;
	INX                                                           ; 
	
@save_direction:                                                  ; SAVE DIRECTION
	TXA                                                           ; SAVE PLAYER DIRECTION
	SET_CUR_PLAYER_DIRECTION
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

_F}_FACE_LOS_COMMAND	
	
_F{_STAND_FOR_TIME_COMMAND										  ; DONE
	
stand_frames = PLAYER_COMMAND_ARG1 

STAND_COMMAND_START:                                              ; F3 STAND (TIME)
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	LDA stand_frames                                              ; LOAD # OF FRAMES TO WAIT
	BEQ @stand_until_inturrupted                                  ; IF 0 = JUMP TO  WAIT FOREVER  

@else_wait_number_of_frames: 
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP ->DO NEXT PLAYER COMMAND
	
@stand_until_inturrupted:                                         ; WAIT FOREVER 
	PAUSE_PLAYER_ACTIONS

_F}_STAND_FOR_TIME_COMMAND	

_F{_TURN_TOWARDS_BALL_COMMAND									  ; DONE
	
turn_frames   = PLAYER_COMMAND_ARG1  
turn_frames_left = EXTRA_PLAYER_RAM_5
TURN_COMMAND_START:                                               ; F4 TURN TOWARDS BALL (TIME) 
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	LDA turn_frames                                               ; SAVE # OF FRAMES TO WAIT TIMER IN PLAYER RAM 1F
	LDY #turn_frames_left                                         ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 

@turn_player_on_multiple_of_sixteen_check:                        ; WAIT 1 FRAME AND CHECK FOR TIME TO TURN
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA FRAME_COUNTER                                             ; LOAD FRAME COUNTER
	AND #$0F                                                      ; 
	BNE @update_turn_timer_check_if_done                          ; FRAME COUNTER = ZERO? NO-> DECREMENT TIME AND CHECK FOR ZERO

	JSR GET_PLAYER_DIRECTION_TOWARDS_BALL                         ; UPDATE PLAYER DIRECTION BASED ON LOCATION VS CURRENT BALL LOCATION()
	BCS @update_turn_timer_check_if_done                          ; SHOULD BE IMPOSSBLE TO REACH. FOR GLITCHES?

@turn_player:  
	SET_CUR_PLAYER_DIRECTION
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW(A= DIRECTION)

@update_turn_timer_check_if_done:                                ; DECREMENT TIMER AND CHECK FOR ZERO
	LDY #turn_frames_left                                         ; DOES # OF FRAMES TO WAIT UNTIL TURN TIMER = ZERO = DONE?
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BEQ @turn_player_on_multiple_of_sixteen_check                 ; YES->UPDATE FRAME AND CHECK FOR TIME TO TURN
	SEC                                                           ; # OF FRAMES TO WAIT UNTIL TURN TIMER-- 
	SBC #$01                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE # OF FRAMES TO WAIT UNTIL TURN TIMER
	BNE @turn_player_on_multiple_of_sixteen_check                 ; DONE->WAIT 1 FRAME AND CHECK FOR TIME TO TURN
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP to DO NEXT PLAYER COMMAND

_F}_TURN_TOWARDS_BALL_COMMAND	

_F{_WAIT_RANDOM_TIME_COMMAND									  ; DONE

WAIT_COMMAND_START:                                               ; F5 WAIT COMMAND (MIN TO MAX)
	JSR GET_RAND_WAIT_TIME_WITHIN_LIMITS                          ; GET RANDOM TIME WITHIN LIMITS ($DC=MIN $DD= MAX)
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

min_time  = PLAYER_COMMAND_ARG1
max_time  = PLAYER_COMMAND_ARG2

min_time_temp = LOCAL_6                                           ; *** unneeded? 
range        = LOCAL_7
random_num  = LOCAL_8 
random_frames = LOCAL_5



GET_RAND_WAIT_TIME_WITHIN_LIMITS:                                 ; GET RANDOM TIME WITHIN LIMITS ($DC=MIN $DD= MAX)
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	LDA min_time                                                  ; *** unneeded save
	STA min_time_temp                                             ;
	LDA max_time                                                  ; = MAX TIME - MIN TIME
	SEC                                                           ;
	SBC min_time_temp                                             ;
	STA range                                                     ; $44 = MAX- MIN
	JSR HEAVIER_RANDOMIZE                                         ; UPDATE RANDOM NUMBER VALUES AND MAKE VALUE RETURNED MORE RANDOM
	STA random_num                                                ; SAVE RANDOM NUMBER 
	JSR DIVIDE_8_BIT                                              ; 8 BIT DIVIDE ($45/$44) QUOTIENT $45 REMAINDER $42 = 
	LDA random_frames                                             ; SET # OF FRAMES TO WAIT = MIN TIME  +  RANDOM (0  TO MAX-MIN)
	CLC                                                           ;
	ADC min_time_temp                                             ; 
	RTS                                                           ; RETURN

_F}_WAIT_RANDOM_TIME_COMMAND	
	
_F{_SET_CHANGE_HP_COMMANDS										  ; DONE				
	
hp_skill_index  = PLAYER_COMMAND_ARG1



SET_HITTING_POWER_COMMAND_START:                                  ; F6 SET HP
	LDX hp_skill_index                                            ; LOAD NEW HP FROM HITTING POWER VALUES
	LDA HITTING_POWER_VALS,X                                      ; 
	LDY #HP_INDEX                                                 ; SET PLAYER RAM INDEX =  PLAYER HP 
	JMP SAVE_HITTING_POWER                                        ; *** could use BPL? JUMP->SAVE HP VALUE IN PLAYER RAM WAIT 1 FRAME 

hp_change_value  = PLAYER_COMMAND_ARG1
	
CHANGE_HITTING_POWER_COMMAND_START:                               ; F7 BOOST HP
	LDA hp_change_value                                           ; = AMOUNT TO BOOST HP + CURRENT HP
	LDY #HP_INDEX                                                 ;
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 

SAVE_HITTING_POWER:                                              ; SAVE HP VALUE IN PLAYER RAM AND WAIT 1 FRAME 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SET PLAYER RAM VALUE = NEW VALUE  
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

_F}_SET_CHANGE_HP_COMMANDS	

	
RECOVER_BALL_COMMAND_START:                                       ; 0XFA (RECOVER BALL)  
	JMP RECOVER_BALL_LOOP                                         ; *** could just update pointer JUMP->RECOVER BALL

	
_F{_CAN_COLLIDE_CAN_BLOCK_COMMANDS								   ; DONE		
	
collide_bitmask      = PLAYER_COMMAND_ARG1 	
	
CAN_COLLIDE_COMMAND_START:                                        ; 0XFC (SET CAN COLLIDE WITH)
	LDX collide_bitmask                                           ; LOAD COLLISION BITMASK
	LDY collide_bitmask +1                                        ; 
	JSR SET_CAN_COLLIDE_USING_PLAYERS_BITMASK                     ; UPDATE CAN COLLIDE (X,Y= BITMASK OF CAN COLLIDE)
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND

block_bitmask      = PLAYER_COMMAND_ARG1 
	
CAN_BLOCK_COMMAND_START:                                          ; 0XFD (SET TO BLOCK)
	LDX block_bitmask                                             ; LOAD BLOCKING BITMASK
	LDY block_bitmask +1                                          ;
	JSR SET_CAN_BLOCK_STATUSES                                    ; UPDATE PLAYERS TO BLOCK(X,Y= BITMASK OF PLAYERS TO BLOCK)
	JMP CAN_COLLIDE_COMMAND_START                                 ; JUMP->SET CAN COLLIDE WITH

_F}_CAN_COLLIDE_CAN_BLOCK_COMMANDS	

_F{_BRANCH_AND_JUMP_COMMANDS								      ; DONE	
	
current_script_addr  = LOCAL_1 
branch_bytes    = PLAYER_COMMAND_ARG1

BRANCH_COMMAND_START:                                             ; 0XFE JUMP  TO NEW COMMANDS ADDRESS (1 BYTE)
	LDA branch_bytes                                              ; = LOW ADDR BYTE + COMMAND VALUE
	CLC                                                           ;   
	ADC current_script_addr                                       ;
	TAX                                                           ;
	LDA branch_bytes                                              ; IS VALUE POSITIVE=  JUMP FORWARD?
	AND #$80                                                      ; 
	BPL @add_to_high_byte                                         ; YES->UPDATE HIGH BYTE OF COMMAND BYTE
	ORA #$FF                                                      ; 
@add_to_high_byte:                                                ; UPDATE HIGH BYTE OF COMMAND BYTE
	ADC current_script_addr+1                                     ; 
	JMP SAVE_NEW_SCRIPT_ADDR                                      ; JUMP->UPDATE PLAY COMMAND ADDRESS

new_play_code_addr = PLAYER_COMMAND_ARG1

JUMP_COMMAND_START:                                               ; 0XFF (JUMP 2 byte)
	LDX new_play_code_addr                                        ; LOAD  NEW PLAY COMMAND ADDRESS
	LDA new_play_code_addr +1                                     ;
SAVE_NEW_SCRIPT_ADDR:                                             ; UPDATE PLAY COMMAND ADDRESS(X,A = ADDR)
	LDY #PLAY_CODE_ADDR +1                                        ; SAVE PLAY COMMAND ADDRESS
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	DEY                                                           ;
	TXA                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND


_F}_BRANCH_AND_JUMP_COMMANDS	
	
_F{_GET_KICKER_PUNTER_SKILL									      ; DONE

skill_index		= LOCAL_6
starter_id		= LOCAL_8


GET_KICKER_PUNTER_SKILL_VALUE:                                    ; GET KICKER PUNTER SKILL VALUE(Y= SKILL INDEX X=PLAYER)
	STY skill_index                                               ; SAVE SKILL INDEX
	STA starter_id                                                ; SAVE PLAYER TEAM POSITION ID
	LOAD_CUR_PLAYER_POSITION_ID
	AND #$80                                                      ; 
	ORA starter_id                                                ; = PLAYER SIDE + PLAYER TEAM POSITION ID
	JSR GET_TEAM_AND_STARTER_FROM_STARTER_ID                      ; GET STARTER ID AND TEAM ID (A= POSITION ID)
	LDY skill_index                                               ;
	JSR GET_PLAYER_SKILL_OR_FACE                                  ; GET SKILL RATING(A=PLAYER, Y=SKILL TO GET, X=TEAM)
	RTS                                                           ; RETURN

_F}_GET_KICKER_PUNTER_SKILL 

UNUSED_COMMAND_START:                                             ; 0XF1,0XF2, 0XF8, 0XF9 UNUSED INFINITE LOOP
	JMP INFINITE_LOOP
																  ; 
_F{_INITIAL_PASS_ON_TARGET_LOGIC 								  ; DONE 

temp_targ_addr						= LOCAL_1
overthrow_temp						= LOCAL_5
underthrow_temp						= LOCAL_5
misthrow_temp						= LOCAL_5

random_temp							= LOCAL_8
misthrow_target_current_speed		= $08						  ; 25 RS

																  ; target addr loaded before routine
START_OF_PASS_ATTEMPT:                                            ; MAN/COM PLAYER PASS INITIAL CALCULATIONS
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	LDA temp_targ_addr                                            ; SAVE TARGET PLAYER POINTER in E6,E7
	STA CURRENT_TARGET_ADDR                                       ;  
	LDA temp_targ_addr +1                                         ;
	STA CURRENT_TARGET_ADDR+1                                     ;
	LDY #RP_COUNTER                                               ; SET TARGET RP COUNTER TO FF =  dont update speed
	LDA #$FF                                                      ; 
	STA (CURRENT_TARGET_ADDR),Y                                   ; 
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASE ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F)
	SET_CUR_PLAYER_DIRECTION
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	JSR SET_CUR_BALL_LOC_FINAL_EQU_TO_TARGET                      ; SET CURRENT BALL LOCATION, SET FINAL BALL LOCATION BASED ON TARGET LOCATION(PLAYER AE, AF, TARGET 3E 3F)  
	JSR SET_BALL_PASS_SPEED_AND_GRAVITY                           ; GET PASS SPEED AND LOFT VALUES STORE IN A9/ AB()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDY #<(QB_ARM_IN_MOTION_SPRITE_DATA_8DIR)                     ; SET SPR ADDR =  QB ARM IN MOTION 
	LDX #>(QB_ARM_IN_MOTION_SPRITE_DATA_8DIR)                     ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	LOAD_CUR_PLAYER_POSITION_ID
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID                          ; GET ACTUAL PLAYER AND TEAM(A=POSITION ID) RET X=TEAM A= PLAYER 
	JSR GET_PASS_CONTROL_SKILL_VALUE                              ; GET PLAYER PASSING ABILITY INDEX() 
	ASL                                                           ; SHIFT by 4 FOR PC TABLE SINCE EACH SKILL ENTRY IS 4 BYTES LONG
	ASL                                                           ; 
	STA PC_TABLE_INDEX                                            ; SAVE PC TABLE INDEX in $E8
	LDY #MOVEMENT_STATUS                                          ; DOES TARGER MOVEMENT VALUE = PLAYER IS MOVING
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	BMI PASS_TO_MOVING_TARGET                                     ; YES-> PASS TO MOVING TARGET             
	JMP PASS_TO_STOPPED_TARGET                                    ; NO->PASS TO STATIONARY TARGET             

PASS_TO_MOVING_TARGET:                                            ; PASS TO MOVING TARGET             
	LDA #BALL_LEAVING_HAND_BITFLAG                                ; SET BALL INFO = BALL LEAVING HAND
	JSR SET_BALL_STATUS_MOVING_START_BALL_TASK                    ; SET BALL INFO TO BALL MOVING, START SLIDEBAR TASK (A= ADDITIONAL BALL INFO)

_WHILE NOT_EQUAL                                                  ; HAS BALL LEFT HAND CHECK 

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA BALL_COLLISION                                            ; DOES BALL STATUS =  BALL LEFT HAND?
	AND #BALL_LEAVING_HAND_BITFLAG                                ;
	
_END_WHILE

	LDX PC_TABLE_INDEX                                            ; LOAD PC TABLE INDEX
	LDA RANDOM_1                                                  ; IS RAND # > ON TARGET CHANCE FROM PASS CONTROL TABLE BYTE 1
	CMP PASS_CONTROL_VALUES_TABLE,X                               ; 
	BCC BALL_NOT_ON_TARGET_PLAYER_MOVING                          ; NO->BALL NOT ON TARGET PLAYER MOVING
	JMP BALL_ON_TARGET_PLAYER_MOVING                              ; YES-> BALL ON TARGET PLAYER MOVING

	
overthrow_table_value		= LOCAL_7
unerthrow_table_value		= LOCAL_7
	
BALL_NOT_ON_TARGET_PLAYER_MOVING:                                 ; BALL NOT ON TARGET PLAYER MOVING
	LDA RANDOM_2                                                  ; IS RANDOM < UNDERTHROW CHANCE FROM  PASS CONTROL TABLE BYTE 2
	CMP PASS_CONTROL_VALUES_TABLE+1,X                             ; 
	BCC @ball_underthrown_wrong_direction                                        ; 

@ball_overthrown:	
	LDA PASS_CONTROL_VALUES_TABLE+2,X                             ; = MAX OVERTHROW 
	STA overthrow_table_value                                     ; 
	LDA RANDOM_3                                                  ; = RAND
	STA random_temp	                                              ; 
	JSR DIVIDE_8_BIT                                              ; DIVIDE ($45/$44), QUOTIENT $45 REMAINDER $42 = RAND / MAX OVERTHROW
	LDA overthrow_temp                                            ; LOAD REM = (RANDOM FROM 0 TO PC_VALUES 3RD BYTE) 
	JSR CALULATE_FINAL_BALL_LOC_WITH_OVERTHROW[rand]              ; CALCULATE FINAL BALL LOCATION BASED ON PLAYER SPEED (A= OVERTHROW AMOUNT INDEX)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 3
	JMP DO_QB_ARM_ANIMATION_CHECK_DEF_NEAR_BLOCK                  ; JUMP->FINISH PASS ANIMATION 

@ball_underthrown_wrong_direction:                                ; PLAYER MOVING MISTHROW with SMALL FINAL DISTANCE ADJUST  
	LDY #CURRENT_DIRECTION                                        ; SAVE CURRENT TARGET DIRECTION in E9 
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	STA CURRENT_TARGET_DIRECTION                                  ; 
	LDA RANDOM_3                                                  ; SET CURRENT TARGET DIRECTION == RANDOM DIRECTION
	STA (CURRENT_TARGET_ADDR),Y                                   ; 
	JSR SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET                      ; SWAP E6 WITH AE, E7 WITH AF() TO PUT TARGET IN AE/AF FOR NEXT FUNCTION
	LDA #misthrow_target_current_speed                            ; SET CURRENT SPEED = 08 = SLOWER THAN 06 rs = MISTHROW TARGET SPEED
	JSR INIT_PLAYER_VELOCITY_NEW_SPEED[speed]                     ; SET X/Y VELOCITY BASED ON GIVEN SPEED & PLAYER DIRECTION (A=SPEED) 
	JSR SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET                      ; SWAP E6 WITH AE, E7 WITH AF() RESTORES TARGET TO E6/E7
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDX PC_TABLE_INDEX                                            ; LOAD MAX OVERTHROW RANGE FROM PASS CONTROL TABLE BYTE 3
	LDA PASS_CONTROL_VALUES_TABLE+3,X                             ;
	STA unerthrow_table_value                                     ; 
	LDA RANDOM_2                                                  ; = RANDOM / PASS CONTROL MISTHROW
	STA random_temp	                                              ;
	JSR DIVIDE_8_BIT                                              ; = DIVIDE ($45/$44), QUOTIENT $45 REMAINDER $42 = RAND / MAX OVERTHROW
	LDA underthrow_temp                                           ; LOAD REMAINDER= (Random # from 0 to PC 4th byte)
	JSR CALULATE_FINAL_BALL_LOC_WITH_OVERTHROW[rand]              ; CALCULATE FINAL BALL LOCATION BASED ON PLAYER SPEED (A= OVERTHROW AMOUNT INDEX)
	LDA CURRENT_TARGET_DIRECTION                                  ; SET PASS TARGET DIRECTION = ORIGINAL TARGET DIRECTION 
	LDY #CURRENT_DIRECTION                                        ;
	STA (CURRENT_TARGET_ADDR),Y                                   ;
	JSR SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET                      ; SWAP E6 WITH AE, E7 WITH AF (MAKE TARGET CURRENT PLAYER)
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION() 
	JSR SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET                      ; SWAP E6 WITH AE, E7 WITH AF (MAKE PASSER CURRENT PLAYER)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 2
	JMP DO_QB_ARM_ANIMATION_CHECK_DEF_NEAR_BLOCK                  ; JUMP-> FINISH PASS ANIMATION

PASS_TO_STOPPED_TARGET:                                           ; PASS TO STATIONARY TARGET           
	LDX PC_TABLE_INDEX                                            ; LOAD PC TABLE INDEX
	LDA RANDOM_1                                                  ; IS RAND # > ON TARGET CHANCE FROM PASS CONTROL TABLE BYTE 1
	CMP PASS_CONTROL_VALUES_TABLE,X                               ; 
	BCS PASS_ON_TARGET_PLAYER_STOPPED                             ; YES->BALL ON TARGET PLAYER NOT MOVING

	
	LDA RANDOM_2                                                  ; IS RAND # > MISTHROW CHANCE FROM PASS CONTROL TABLE BYTE 2
	CMP PASS_CONTROL_VALUES_TABLE+1,X                             ; 
	BCS PASS_ON_TARGET_PLAYER_STOPPED
	
PASS_TO_STOPPED_TARGET_MISTHROW:	
	LDA #BALL_LEAVING_HAND_BITFLAG                                ; SET BALL INFO = BALL LEAVING HAND 
	JSR SET_BALL_STATUS_MOVING_START_BALL_TASK                    ; UPDATE BALL STATUS BYTE AND START BALL ANIMATION TASK(A=BALL STATUS TO ADD TO BALL MOVING)

_WHILE	NOT_EQUAL

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA BALL_COLLISION                                            ; DOES BALL STATUS = BALL LEFT HAND?
	AND #BALL_LEAVING_HAND_BITFLAG                                ; 

_END_WHILE

misthrow_table_value		= LOCAL_7

@set_misthrow_amount                                              ;
	LDY #CURRENT_DIRECTION                                        ; SAVE TARGET DIRECTION IN $E9
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	STA CURRENT_TARGET_DIRECTION                                  ;   
	LDA RANDOM_3                                                  ; LOAD RANDOM NUMBER
	STA (CURRENT_TARGET_ADDR),Y                                   ; SAVE in TARGET DIRECTION
	JSR SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET                      ; SWAP E6,E7 WITH AE,AF (MAKE TARGET CURRENT PLAYER)
	LDA #misthrow_target_current_speed                            ; SET CURRENT SPEED = 0X08 = 25 RS
	JSR INIT_PLAYER_VELOCITY_NEW_SPEED[speed]                     ; UPDATE X/Y VELOCITY BASED ON GIVEN SPEED & PLAYER DIRECTION (A=SPEED) 
	JSR SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET                      ; SWAP E6 WITH AE, E7 WITH AF (make passer current player)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDX PC_TABLE_INDEX                                            ; LOAD MAX MISTHROW RANGE FROM PASS CONTROL TABLE BYTE 4 
	LDA PASS_CONTROL_VALUES_TABLE+3,X                             ; 
	STA misthrow_table_value                                      ;  
	LDA RANDOM_2                                                  ; LOAD RANDOM #
	STA random_temp                                               ; 
	JSR DIVIDE_8_BIT                                              ; = DIVIDE ($45/$44), QUOTIENT $45 REMAINDER $42 = RAND / MAX OVERTHROW
	LDA misthrow_temp                                             ; LOAD OVERTHROW AMOUNT INDEX
	JSR CALULATE_FINAL_BALL_LOC_WITH_OVERTHROW[rand]              ; CALCULATE FINAL BALL LOCATION BASED ON PLAYER SPEED (A= OVERTHROW AMOUNT INDEX)
	LDA CURRENT_TARGET_DIRECTION                                  ; RESTORE TARGET DIRECTION 
	LDY #CURRENT_DIRECTION                                        ; 
	STA (CURRENT_TARGET_ADDR),Y                                    ; 
	JSR SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET                      ; SWAP E6 WITH AE, E7 WITH AF (MAKE the TARGET the current player)
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()  
	JSR SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET                      ; SWAP E6 WITH AE, E7 WITH AF (MAKE THE PASSER THE CURRENT PLAYER)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_QB_ARM_ANIMATION_CHECK_DEF_NEAR_BLOCK                  ; JUMP->FINISH PASS ANIMATION 

PASS_ON_TARGET_PLAYER_STOPPED:                                   ; BALL ON TARGET PLAYER NOT MOVING
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 5
	JMP DO_QB_ARM_ANIMATION_CHECK_DEF_NEAR_BLOCK                  ; JUMP-> FINISH PASS ANIMATION    

BALL_ON_TARGET_PLAYER_MOVING:                                     ; BALL ON TARGET PLAYER MOVING
	JSR CALULATE_FINAL_BALL_LOC_ON_TARGET                         ; CALCULATE FINAL BALL LOCATION BASED ON PLAYER SPEED NO OVERTHROW
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 4

_F}_INITIAL_PASS_ON_TARGET_LOGIC

_F{_QB_ARM_ANIMATION_DEFENDERS_CLOSE_TO_BLOCK_CHECK				  ; DONE 	
	
animation_timer				= EXTRA_PLAYER_RAM_3
arm_extended_frames			= $14
PLAYER_CANT_PASS_BITMASK	= $BF
PASS_ATTEMPTED_BITFLAG		= $20
	
DO_QB_ARM_ANIMATION_CHECK_DEF_NEAR_BLOCK:                         ; FINISH PASS ANIMATION
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA PLAY_STATUS                                               ; SET PLAY STATUS  
	AND #PLAYER_CANT_PASS_BITMASK                                 ; 
	ORA #PASS_ATTEMPTED_BITFLAG	                                  ; 
	STA PLAY_STATUS                                               ; 
	JSR SET_DEFENDERS_JUMPING_TO_BLOCK_PASS                       ; CHECK FOR DEFENDERS WHO CAN BLOCK PASS()
	LDA #BALL_UPDATE_SCROLL_BITFLAG                               ; SET BALL STATUS = UPDATE SCREEN SCROLL
	JSR SET_BALL_STATUS_MOVING_START_BALL_TASK                    ; UPDATE BALL STATUS BYTE AND START BALL ANIMATION TASK(A=BALL STATUS TO ADD TO BALL MOVING)
	JSR SET_PLAYER_NOT_MAN_NOT_BALL_CARRIER                       ; SET PLAYER MOVEMENT TO COM CONTROL AND PLAYER NOT BALL CARRIER()
	LDA #THROW_SOUND                                              ; LOAD PASS SOUND
	JSR PLAY_SOUND                                                ; PLAY SOUND IF NONE IS PLAYING ELSE WAIT(A=SOUND)
	JSR SET_DISPLAYED_NAME_TO_PASS_TARGET                         ; CHANGE P1/P2 ICON FOR PLAYER GETTING BALL()
	LDY #<QB_ARM_EXTENDED_PASS_SPRITE_INFO                        ; SET SPR ADR = QB ABOUT TO RELEASE BALL
	LDX #>QB_ARM_EXTENDED_PASS_SPRITE_INFO                        ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER MAN CONTROLLED? 
	ASL                                                           ; 
	BPL @start_arm_animation                                      ; NO-> PLAYER ARM EXTENDED ANIMATION START
	
@set_man_player_pause_forever	
	LDY #PLAY_CODE_ADDR                                           ; SET PLAYER PLAY CODE ADDR = $8019 = PAUSE PLAYER FOREVER
	LDA #<PAUSE_PLAYER_PLAY_CODE                                  ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA #>PAUSE_PLAYER_PLAY_CODE                                  ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;

@start_arm_animation:                                             ; PLAYER ARM EXTENDED ANIMATION START
	LDA #arm_extended_frames                                      ; SET ARM EXTENDED TIMER =  20 FRAMES
	LDY #animation_timer                                          ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	
_WHILE NOT_EQUAL                                                   ; ARM EXTENDED TIMIMG LOOP
	
	RETURN_PLAYER_ACTIONS_IN_1_FRAME

@check_correct_chr_bank:	
	LDA SOFT_CHR_1400_BANK                                        ; DOES SPRITE $1400 CHR BANK = DIVE CRY CELEBRATE SPRITES? 
	CMP #DIVE_CELEBRATE_CRY_CHR_BANK                              ; 
	BEQ @decrease_animation_timer                                  ; YES-> DECREASE TIMER LOOP
	
@set_correct_chr_bank:	
	LDA #DIVE_QB_ARM_EXTENDED_CHR_BANK                            ; SET SPRITE $1400 CHR BANK = NORMAL $1400 BANK USED FOR ON FILED SPRITES
	STA SOFT_CHR_1400_BANK                                        ;

@decrease_animation_timer:                                        ; DECREASE TIMER LOOP
	LDY #animation_timer                                          ; TIMER--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ;
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	
_END_WHILE
	
	LDA #DIVE_QB_DROPBACK_CHR_BANK                                ; SET SPRITE $1400 CHR BANK = QB DROPBACK SPRITE BANK
	STA SOFT_CHR_1400_BANK                                        ;
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; JUMP->RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F ()

_F}_QB_ARM_ANIMATION_DEFENDERS_CLOSE_TO_BLOCK_CHECK

_F{_OFFENSE_PASS_DIVE_JUMP_PASS_COLL							  ; DONE


temp_target_addr			= LOCAL_1	
	
OFFENSE_JUMP_DIVE_CATCH_PASS_START:                               ; WR JUMP/DIVE CHECK START 
	LDA #$03                                                      ; SET TARGET RUSHING POWER COUNTER = 3
	SET_CUR_PLAYER_RUSHING_PWR_CTR
	JSR DO_ADJUST_PLAYER_FINAL_LOCATION_PASS                         ; SET FINAL PLAYER LOCATION AND RETURN DIRECTION()
	BCC @update_dir_sprite_velocity                               ; DON’T NEED TO UPDATE DIRECTION? HERE for GITCHES?  
	JMP PASS_BALL_COLLIDING_WITH_PLAYER                           ; YES->BALL COLLIDING WITH PLAYER

@update_dir_sprite_velocity:                                      ; UPDATE WR DIRECTION, VELOCITY AND SPRITE GRAPHIC 
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

_WHILE CC                                                         ; PASS TARGET JUMP/DIVE CHECK LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	
@check_ball_colliding:	
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL COLLIDED?
	BVS PASS_BALL_COLLIDING_WITH_PLAYER                           ; YES->BALL COLLIDING WITH PLAYER

@check_for_dive:	
	JSR GET_LARGER_BALL_DIST_FOR_PASS_DIVE_JUMP_CHECK             ; GET GREATER REAMAINING BALL DISTANCE(X,Y) RET=A=DIST
	CMP #PASS_JUMP_CHECK_X_LOC_UPPER_LIMIT                        ; FINAL BALL VS BALL (X/Y) > 9.75 YARDS OF FINAL BALL LOCATION
	BCS @do_target_dive_check                                     ; YES > PASS TARGET DIVE CHECK
	CMP #PASS_JUMP_CHECK_X_LOC_LOWER_LIMIT                        ; FINAL BALL VS BALL (X/Y) < 7.75 YARDS OF FINAL BALL LOCATION
	BCC @do_target_dive_check                                     ; YES ->PASS TARGET DIVE CHECK
	
@check_for_jump:	
    JSR CHECK_IF_PLAYER_CLOSE_ENOUGH_TO_JUMP_FOR_BALL             ; CHECK IF PLAYER IS CLOSE ENOUGH TO BALL TO JUMP FOR IT()
	BCC @do_target_dive_check                                     ; NO-> PASS TARGET DIVE CHECK
	JMP DO_PASS_TARGET_JUMP                                       ; YES-> PASS TARGET JUMP

@do_target_dive_check:                                            ; PASS TARGET DIVE CHECK      
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS                             ; ARE ANY DEFENDERS PASS STATUS = CLOSE TO PLAYER?
	AND PLAYERS_CAN_COLLIDE_BALL_PASS+1                           ;
	AND PLAYERS_CAN_COLLIDE_BALL_PASS+2                           ;
	AND #NO_PASS_COLLISION_STATUS                                 ; 
	BEQ @check_target_back_of_endzone                             ; YES-> TARGET BACK OF ENDZONE CHECK
	
@check_frames_remaining_for_dive:	
	LDA BALL_ANI_FRAMES_LEFT + 1                                  ; LOAD PASS TIMER HIGH BYTE
	BNE @check_target_back_of_endzone                             ; TOO MUCH TIME LEFT->BACK OF ENDZONE CHECK
	LDA BALL_ANI_FRAMES_LEFT                                      ; LOAD PASS TIMER LOW BYTE
	CMP #PASS_DIVE_TIME_UPPER_LIMIT                               ; PASS TIMER > 0x18 FRAMES
	BCS @check_target_back_of_endzone                             ; YES-> BACK OF ENDZONE CHECK
	CMP #PASS_DIVE_TIME_LOWER_LIMIT                               ; PASS TIMER  < 0x16 FRAMES
	BCC @check_target_back_of_endzone                             ; YES-> BACK OF ENDZONE CHECK
	
@check_player_vs_final_ball	
	LDA CURRENT_PLAYER_ADDR                                       ; PUT TARGET PLAYER POINTER in 3E,3F 
	STA temp_target_addr                                          ;
	LDA CURRENT_PLAYER_ADDR +1                                    ;
	STA temp_target_addr +1                                       ;
	JSR COMPARE_PLAYER_FINAL_BALL                                 ; GET GREATER OF PLAYER X,Y DISTANCE TO FINAL BALL LOCATION(3E,3F= PLAYER POINTER)
	CMP #PASS_DIVE_CHECK_X_LOC_UPPER_LIMIT                        ; PLAYER DISTANCE FROM BALL > 7.25 YARDS AWAY     
	BCS @check_target_back_of_endzone                             ; YES-> BACK OF ENDZONE CHECK
	CMP #PASS_DIVE_CHECK_X_LOC_LOWER_LIMIT                        ; PLAYER DISTANCE FROM BALL < 4 YARDS AWAY
	BCC @check_target_back_of_endzone                             ; YES-> BACK OF ENDZONE CHECK
	JMP DO_RECEIVER_PASS_DIVE                                     ; NO->PASS TARGET DIVE

@check_target_back_of_endzone:                                    ; BACK OF ENDZONE CHECK
	LOAD_CUR_PLAYER_COLLISION_STATUS
	LSR                                                           ; 
	BCS @stop_target_and_turn_towards_ball                        ; YES->STOP PLAYER AND TURN PLAYER TOWARDS BALL

@check_player_at_final_location: 
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	
_END_WHILE
	
	
	LDA #AT_FINAL_LOC_PASS_COLLISION_STATUS                       ; SET PASS STATUS =  STOPPED 
	LDX #TARGET_PASS_COLL_INDEX                                   ; LOAD PASS TARGET 
	JSR SET_TARGET_PASS_STATUS                                    ; SET PASS PLAYER STATUS in E6-E9 (X= PLAYER, A= STATUS CODE)

@stop_target_and_turn_towards_ball:                               ; STOP PLAYER AND TURN PLAYER TOWARDS BALL
	LDA BALL_ANGLE                                                ; SET PLAYER DIRECTION  = OPPOSITE DIRECTION OF BALL ANGLE
	EOR #$80                                                      ; 
	SET_CUR_PLAYER_DIRECTION
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()

_WHILE VALUE_CLEAR                                                ; STATIONARY TARGET WAIT UNTIL BALL NEAR PLAYER LOOP
	
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL COLLIDED?

_END_WHILE	

PASS_BALL_COLLIDING_WITH_PLAYER:                                  ; BALL COLLIDING WITH PLAYER
	LDA #$03                                                      ; SET BALL ANIMATION TASK = wait 3 frames
	STA BALL_MOVEMENT_TASK + TASK_COUNTER                         ; 
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 2
	LDA BALL_STATUS                                               ; DOES PASS STATUS = CAUGHT, TIPPED, INTERCEPTED
	AND #(BALL_INTERCEPTED_BITFLAG + BALL_DEFLECTED_BITFLAG + BALL_CAUGHT_BITFLAG + BALL_FUMBLED_BITFLAG )                              
	BNE @pass_result_already                                      ; YES->PASS (COMPLETE/ DEFENDED/ INTERCEPTED)

@check_for_cutscene_offense	
	LDA CUTSCENE_CHANCE                                           ; 12% CHANCE OF CUTSCENE 
	BMI DO_NORMAL_PASS_RESULT_WITH_CUTSCENES                      ; YES->PASS RESULT WITH CUTSCENES
	JSR NORMAL_PASS_RESULT_CALCULATION                            ; DO PASS CALCULATIONS()
	BCC @pass_caught_by_target                                    ; PASS CAUGHT? YES->PASS CAUGHT BY TARGET
	BVS @pass_intercepted_by_defender                             ; PASS INTERCEPTED? YES->PASS INTERCEPTED

@pass_result_already:                                             ; PASS (TIPPED)
	LDA #$0F                                                      ; LOAD 15 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	PAUSE_PLAYER_ACTIONS

@pass_intercepted_by_defender:                                    ; PASS INTERCEPTED BY DEFENDER
	LDA #INT_SONG                                                 ; LOAD INTERCEPTION SOUND 
	JSR PLAY_SOUND                                                ; PLAY SOUND(A=SOUND)  
	PAUSE_PLAYER_ACTIONS

@pass_caught_by_target:                                           ; PASS CAUGHT BY TARGET
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND


DO_NORMAL_PASS_RESULT_WITH_CUTSCENES:                             ; PASS RESULT WITH CUTSCENES
	JSR NORMAL_PASS_RESULT_CALCULATION                            ; DO PASS CALCULATIONS()
	LDA #$00                                                      ; SET CUTSCENE TABLE OFFSET = PASS CAUGHT
	BCC @check_target_close_to_ball_pass_cutscene                 ; 
	LDA #$08                                                      ; SET CUTSCENE TABLE OFFSET = PASS INTERECPTED
	BVS @check_target_close_to_ball_pass_cutscene                 ; 
	LDA #$10                                                      ; SET CUTSCENE TABLE OFFSET = PASS INCOMPLETE

@check_target_close_to_ball_pass_cutscene:                        ; TARGET CLOSE ENOUGH TO BALL CUTSCENE
	BIT TARGET_PASS_COLL_STATUS                                   ; CHECK FOR TARGET CLOSE TO COLLISION
	BVS @set_cutscene_for_pass_result                         ; NO->SET FINAL PASS RESULT CUTSCENE INDEX
	CLC                                                           ;
	ADC #$04                                                      ; CUTSCENE TABLE OFFSET += PLAYER CLOSE TO BALL OFFSET


	
@set_cutscene_for_pass_result:                                    ; SET FINAL PASS RESULT CUTSCENE INDEX

cutscene_sequence_id = LOCAL_8	

	STA cutscene_sequence_id                                      ; SAVE CUTSCENE OFFSET
	JSR CHECK_FOR_DEFENDERS_IN_CUTSCENE                           ; CHECK IF DEFENDERS NEED TO BE IN PASS RESULT CUTSCENE (C= YES OR NO, RET DEFENDER ICON ID)
	LSR                                                           ; SHIFT STATUS BYTES INTO FIRST NIBBLE 
	LSR                                                           ;
	LSR                                                           ;
	LSR                                                           ;
	ORA cutscene_sequence_id                                       ; FINAL CUTSCENE INDEX = CUTSCENE OFFSET + DEFENDER STATUS
	TAX                                                           ;
	LDA PASS_RESULT_CUTSCENE_INDEX_TABLE,X                        ; LOAD FINAL CUTSCENE ID FROM PASS RESULT CUTSCENE INDEX TABLE
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1 
	RETURN_PLAYER_ACTIONS_IN_1_FRAME

																  ; THIS IS A JUMP FROM THE OFFENSIVE RECEIVER CHECKS
CHECK_FOR_INT_AFTER_WR_MISS_DIVE_CATCH:                           ; CHECK FOR PASS CAUGHT OR INT
	LDA BALL_STATUS                                               ; DOES PASS STATUS = CAUGHT 
	AND #BALL_CAUGHT_BITFLAG                                      ; PASS? 
	BEQ @pause_player_if_not_intercepted                          ; NO-> PASS DEFELECTED OR OUT OF BOUNDS
	JMP DO_NEXT_PLAYER_COMMAND                                    ; YES->DO NEXT PLAYER COMMAND

@pause_player_if_not_intercepted:                                 ; PASS DEFELECTED OR OUT OF BOUNDS
	PAUSE_PLAYER_ACTIONS
																  ; *** not sure jump_dive_cutscenes_needed	
PASS_RESULT_CUTSCENE_INDEX_TABLE:                                 ; PASS RESULT CUTSCENE INDEX TABLE
	.DB OFF_REG_CATCH_CUT_SEQ_INDEX                               ; CATCH *** should be impossible to reach these
	.DB OFF_REG_CATCH_CUT_SEQ_INDEX                               ; CATCH 
	.DB OFF_REG_CATCH_CUT_SEQ_INDEX                               ; CATCH 
	.DB OFF_REG_CATCH_CUT_SEQ_INDEX                               ; CATCH 

	.DB OFF_REG_CATCH_CUT_SEQ_INDEX                               ; CATCH
	.DB OFF_REG_CATCH_CUT_SEQ_INDEX                               ; CATCH 
	.DB DEF_DIVE_MISS_OFF_REG_CATCH_CUT_SEQ_INDEX                 ; DEFENDER DIVE AND MISS OFFENSE CATCH
	.DB DEF_DIVE_MISS_OFF_REG_CATCH_CUT_SEQ_INDEX                 ; DEFENDER DIVE AND MISS OFFENSE CATCH *** used dive cutscene for nearby
	
																  ; 0X08-0X0B
	.DB DEF_REG_INT_CUT_SEQ_INDEX_DUPE                            ; INT NORMAL
	.DB DEF_JUMP_INT_CUT_SEQ_INDEX                                ; JUMP INT
	.DB DEF_DIVE_INT_CUT_SEQ_INDEX                                ; DEF DIVE INT
	.DB DEF_REG_INT_CUT_SEQ_INDEX_DUPE                            ; INT NORMAL
	
																  ; 0X0C-0X0F
	.DB DEF_REG_INT_CUT_SEQ_INDEX_DUPE                            ; INT NORMAL
	.DB DEF_JUMP_INT_CUT_SEQ_INDEX                                ; JUMP INT
	.DB DEF_DIVE_INT_CUT_SEQ_INDEX                                ; DIVE INT
	.DB DEF_REG_INT_CUT_SEQ_INDEX_DUPE                            ; INT NORMAL

																  ; 0X10-0X13
	.DB BALL_HIT_GROUND_REF_INC_CUT_SEQ_INDEX                     ; BALL HITS GROUND 
	.DB DEF_JUMP_MIS_CUT_SEQ_INDEX                                ; DEFENDER JUMP MISS BALL HITS GROUND
	.DB DEF_DIVE_MISS_CUT_SEQ_INDEX                               ; DEFENDER DIVE MISS BALL HITS GROUND
	.DB DEF_REG_BOUNCE_HANDS_CUT_SEQ_INDEX                        ; BALL BOUNCES OFF DEFENDERS HANDS

																  ; 0X14-0X18
	.DB OFF_REG_BOUNCE_HANDS_CUT_SEQ_INDEX                        ; BALL BOUNCES OFF OFFENSE HANDS
	.DB DEF_JUMP_MISS_BOUNCE_OFF_WR_HANDS_CUT_SEQ_INDEX           ; DEFNDER JUMP WHIFF BALL BOUNCES OFF OFFENSE HANDS
	.DB DEF_DIVE_MISS_BOUNCE_OFF_WR_HANDS_CUT_SEQ_INDEX           ; DEFENDER DIVE WHIFF BALL BOUNCE OFF OFFENSE HANDS
	.DB DEF_DIVE_MISS_BOUNCE_OFF_WR_HANDS_CUT_SEQ_INDEX           ; DEFENDER DIVE WHIFF BALL BOUNCE OFF OFFENSE HANDS *** used dive cutscne for nearby

DO_RECEIVER_PASS_DIVE:                                            ; OFFENSIVE PLAYER DIVE START
	LDA #DIVING_PASS_COLLISION_STATUS	                          ; LOAD DIVING STATUS
	LDX #TARGET_PASS_COLL_INDEX                                   ; LOAD PASS TARGET INDEX
	JSR SET_TARGET_PASS_STATUS                                    ; SET (E6-E9 STATUS, A= STATUS TYPE X= INDEX) 
	JSR DO_PASS_DIVE_ANI_AND_BALL_COLL_CHECK                      ; DO DIVE ANIMATION AND CHECK IF PLAYER NEAR BALL()
	LDA BALL_STATUS                                               ; WAS THERE A PASS RESULT ALREADY?
	AND #(BALL_INTERCEPTED_BITFLAG + BALL_DEFLECTED_BITFLAG + BALL_CAUGHT_BITFLAG + BALL_FUMBLED_BITFLAG )                                                       ; 
	BNE @pass_result_already_cant_catch                           ; YES->DIVE PASS RESULT ALREADY
	
@check_for_dive_cutscene:	
	LDA CUTSCENE_CHANCE                                           ; ~11% CHANCE OF CUTSCENE
	BMI DO_RECEIVER_PASS_DIVE_WITH_CUTSCENE                       ; YES-> DO DIVING WITH CUTSCENES
	BCC @diving_target_not_close_enough                           ; PLAYER NOT CLOSE ENOUGH?->OFFENSIVE PLAYER NOT CLOSE AFTER DIVING TO  CATCH 
	JSR TARGET_JUMP_DIVE_PASS_CALC_START                                 ; PASS TARGET JUMP/DIVE CALCULATIONS() IF PASS RESULT ALREADY RET AND SEC & ClV

@pass_result_already_cant_catch:                                  ; DIVE PASS RESULT ALREADY
	JSR END_OF_PASS_DIVE_CANT_CATCH_BALL                          ; DO END OF PASS DIVE()
	JMP CHECK_FOR_INT_AFTER_WR_MISS_DIVE_CATCH                    ; JUMP->CHECK FOR PASS CAUGHT OR INT

@diving_target_not_close_enough:                                  ; OFFENSIVE PLAYER NOT CLOSE ENOUGH AFTER DIVING TO CATCH
	JSR PASS_CALCULATION_TARGET_NOT_CLOSE_TO_BALL                 ; CHECK IF DEFENDERS CAN INTERCEPT TARGET NOT CLOSE ENOUGH() BUGGED
	JSR END_OF_PASS_DIVE_CANT_CATCH_BALL                          ; DO END OF PASS DIVE()
	JMP CHECK_FOR_INT_AFTER_WR_MISS_DIVE_CATCH                    ; JUMP->CHECK FOR PASS CAUGHT OR INT


DO_RECEIVER_PASS_DIVE_WITH_CUTSCENE:                              ; DO DIVING WITH CUTSCENE 
	BCC @check_int_target_not_close_cut                           ; PLAYER NOT CLOSE ENOUGH?->OFFENSIVE PLAYER NOT CLOSE AFTER DIVING TO CATCH CUTSCENE 
	JSR TARGET_JUMP_DIVE_PASS_CALC_START                                 ; PASS TARGET JUMP/DIVE CALCULATIONS() IF PASS RESULT ALREADY RET AND SEC & CLV
	BCC @do_pass_dive_catch_cutscene                              ; PASS CAUGHT ->DIVING CATCH CUTSCENE
	BVC @do_pass_dive_miss_cutscene                               ; BALL INTERCEPTED? NO->DIVE RESULT DO DIVING MISS CUTSCENE

@pass_intercepted_target_close_enough:	
	JSR END_OF_PASS_DIVE_BALL_INTERCEPTED                         ; SET PLAYER COLLISION = NOT DIVING, COLLIDED WITH GROUND, DO END OF DIVE()
	JMP CHECK_FOR_INT_AFTER_WR_MISS_DIVE_CATCH                    ; JUMP-> CHECK FOR PASS CAUGHT OR INT

@check_int_target_not_close_cut:                                   ; OFFENSIVE PLAYER NOT CLOSE ENOUGH AFTER DIVING TO CATCH CUTSCENE
	JSR PASS_CALCULATION_TARGET_NOT_CLOSE_TO_BALL                 ; CHECK IF DEFENDERS CAN INTERCEPT TARGET NOT CLOSE ENOUGH() BUGGED
	BVS @pass_intercepted_target_close_enough_dupe               ; IS BALL INTERCEPTED? YES->BALL INTECERCEPTED 


@do_pass_dive_miss_cutscene:                                      ; DIVE RESULT DO DIVING MISS CUTSCENE
	LDA RANDOM_1                                                  ; LOAD RANDOM #
	LSR                                                           ;
	LDA #OFF_DIVE_MISS_CUT_SEQ_INDEX                              ; 50% CHANCE SET CUTSCENE ID = OFFENSE DIVE MISS
	BCS @do_pass_dive_cutscene                                    ;
	LDA #OFF_DIVE_BOUNCE_OFF_HANDS_CUT_SEQ_INDEX                  ; 50% CHANCE SET CUTSCENE ID = OFFENSE DIVE OFF HANDS
	JMP @do_pass_dive_cutscene                                    ; JUMP->DO DIVING CUTSCENE (A= DIVE CUTSECNE ID)

@do_pass_dive_catch_cutscene:                                     ; DIVING CATCH CUTSCENE
	LDA #OFF_DIVE_CATCH_CUT_SEQ_INDEX                             ; SET CUTSCENE ID = OFFENSE DIVE CATCH

@do_pass_dive_cutscene:                                           ; DO DIVING CUTSCENE (A= DIVE CUTSECNE ID)
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1   

@pass_intercepted_target_close_enough_dupe:                       ; *** REDUNDANT COULD HAVE USED SAME SECTION BEFORE 9AE0 
	JSR END_OF_PASS_DIVE_BALL_INTERCEPTED                         ; SET PLAYER COLLISION =NOT DIVING, COLLIDED WITH GROUND, DO END OF DIVE()
	JMP CHECK_FOR_INT_AFTER_WR_MISS_DIVE_CATCH                    ; JUMP->CHECK FOR PASS CAUGHT OR INT

DO_PASS_TARGET_JUMP:                                              ; PASS TARGET JUMP START
	LDA #JUMPING_PASS_COLLISION_STATUS                            ; SET STATUS = JUMPING      
	LDX #TARGET_PASS_COLL_INDEX                                   ; SET INDEX = PASS TARGET
	JSR SET_TARGET_PASS_STATUS                                    ; SET (E6-E9 STATUS, A= STATUS TYPE X= INDEX) 
	JSR JUMP_UP_FOR_BALL                                          ; JUMP UP ANIMATION()
	LDA BALL_STATUS                                               ; DOES BALL STATUS = INT, DEFELECT, CATCH, FUMBLE
	AND #(BALL_INTERCEPTED_BITFLAG + BALL_DEFLECTED_BITFLAG + BALL_CAUGHT_BITFLAG + BALL_FUMBLED_BITFLAG )                                                       ; 
	BNE @pass_not_catchable_after_off_jump                       ; YES->PASS RESULT ALREADY   SHOULD GO TO 9B2F

@check_for_pass_jump_cutscene:	
	BIT CUTSCENE_CHANCE                                           ; 25% CHANCE OF CUTSCENE
	BVS PASS_TARGET_JUMP_WITH_CUTSCENE                            ; YES->PASS TARGET JUMP WITH CUTSCENE
	JSR CHECK_IF_BALL_CATCHABLE_AFTER_JUMP                        ; CHECK FOR BALL OOB, OR NOT CATCHABLE AFTER JUMPING()
	BCS @check_if_ball_caught_after_off_jump                      ; BALL CATCHABLE-> CHECK IF BALL CAUGHT JUMP

@pass_not_catchable_after_off_jump:                              ; PASS RESULT ALREADY OR ADDITIONAL 4 FRAME DELAY
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 4
	JSR CHECK_IF_BALL_CATCHABLE_AFTER_JUMP                        ; CHECK FOR BALL OOB, OR NOT CATCHABLE AFTER JUMPING() WHY??
	BCC OFF_LAND_FROM_JUMP_WAIT_BALL_COLLIDE                      ; BALL NOT CATCHABLE->LAND FROM JUMP WITH PASS RESULT ALREADY OR DEFLECTION

@check_if_ball_caught_after_off_jump:                             ; CHECK IF BALL CAUGHT JUMP
	LDA #$03                                                      ; SET BALL ANIMATION TASK WAIT TIME =  3 FRAMES
	STA BALL_MOVEMENT_TASK + TASK_COUNTER                         ;
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 2
	JSR TARGET_JUMP_DIVE_PASS_CALC_START                          ; PASS TARGET JUMP/DIVE CALCULATIONS() IF PASS RESULT ALREADY RET AND SEC & ClV
	BCC DO_LAND_FROM_JUMP_ANIMATION                               ; IS PASS COMPLETED? YES-> LAND FROM JUMP CATCH OR INT AND CONTINUE
	BVS DO_LAND_FROM_JUMP_ANIMATION                               ; IS PASS INTERCEPTED? YES-> LAND FROM JUMP CATCH OR INT AND CONTINUE

OFF_LAND_FROM_JUMP_WAIT_BALL_COLLIDE:                                                        ; LAND FROM JUMP WITH PASS RESULT ALREADY OR DEFLECTION
	JSR LAND_FROM_JUMP                                            ; LAND FROM JUMP ANIMATION()

_WHILE VALUE_CLEAR                                               ; WAIT UNTIL BALL COLLIDES WITH GROUND LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL HIT GROUND?
	
_END_WHILE                                                       ; NO->WAIT UNTIL BALL COLLIDES LOOP

	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 2
	JSR PASS_CALCULATION_TARGET_NOT_CLOSE_TO_BALL                 ; CHECK IF DEFENDERS CAN INTERCEPT TARGET NOT CLOSE ENOUGH()
	LDA #$08                                                      ; LOAD 8 FRAMES
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

DO_LAND_FROM_JUMP_ANIMATION:                                     ; LAND FROM JUMP, CATCH OR INT 
	JSR LAND_FROM_JUMP                                            ; LAND FROM JUMP ANIMATION()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP -> DO NEXT PLAYER COMMAND

PASS_TARGET_JUMP_WITH_CUTSCENE:                                   ; PASS TARGET JUMP WITH CUTSCENE
	LDA #$03                                                      ; SET TASK 4 CUTSCENE/TEMP BALL COUNTER TO 3 FRAMES
	STA BALL_MOVEMENT_TASK + TASK_COUNTER                         ;
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 2
	JSR TARGET_JUMP_DIVE_PASS_CALC_START                                 ; PASS TARGET JUMP/DIVE CALCULATIONS() IF PASS RESULT ALREADY RET AND SEC & ClV
	BCC @do_jump_catch_cutscene                                   ; JUMP CATCH->OFFENSE JUMP CATCH CUTSCENE

@check_for_non_catch_cutscene_type_after_jump
	BVS DO_LAND_FROM_JUMP_ANIMATION                               ; JUMP INT->LAND FROM JUMP CATCH OR INT 
	JSR CHECK_FOR_DEFENDERS_IN_CUTSCENE                           ; CHECK IF DEFENDERS NEED TO BE IN PASS RESULT CUTSCENE (C= YES OR NO, RET DEFENDER ICON ID)
	CMP #JUMPING_PASS_COLLISION_STATUS                            ; DEFENDER JUMPING?
	BNE @do_random_jump_miss_no_def_cutscene                      ; N0-> DO DEFENDER NOT JUMPING OFFENSE DOESN’T CATCH CUTSCENE
	
@do_random_jump_miss_cutscene:	
	LDA RANDOM_3                                                  ; LOAD RANDOM NUMBER 3D
	ASL                                                           ; 
	LDA #DOUBLE_JUMP_OFF_WHIFF_CUT_SEQ_INDEX                      ; SET CUTSCENE ID = DOUBLE JUMP OFF WHIFF
	BCS @end_of_both_player_whiff_cutscene                                                 ;

@check_pass_reult_already_cutscene
	LDA BALL_STATUS                                               ; DOES BALL STATUS = INT, DEFELECT, CATCH, FUMBLE
	AND #(BALL_INTERCEPTED_BITFLAG + BALL_DEFLECTED_BITFLAG + BALL_CAUGHT_BITFLAG + BALL_FUMBLED_BITFLAG )                                                      ;
	BNE @end_of_pass_result_already_cutscene                      ; YES->LAND FROM JUMP WITH PASS RESULT ALREADY *** branch to a jump could branch direct

@do_ball_tipped_cutscene: 	
	JSR DO_BALL_BLOCKED_ANI                                       ; NO->START BALL BLOCKED THREAD()	
	LDA #DOUBLE_JUMP_BOUNCE_DEF_HANDS_CUT_SEQ_INDEX               ; SET CUTSCENE ID = DEFENDER JUMP TIP

@end_of_both_player_whiff_cutscene:
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1 
	
@end_of_pass_result_already_cutscene:                                                        ;
	JMP OFF_LAND_FROM_JUMP_WAIT_BALL_COLLIDE                      ; JUMP TO LAND FROM JUMP WITH PASS RESULT ALREADY

@do_random_jump_miss_no_def_cutscene:                             ; DO DEFENDER NOT JUMPING OFFENSE DOESN’T CATCH CUTSCENE
	LDA RANDOM_3                                                  ; LOAD RANDOM NUMBER 3D
	AND #$01                                                      ; SET CUTSCNE ID = OFFENSE JUMP MISS OR OFFENSE JUMP TIP
	CLC                                                           ;
	ADC #OFF_JUMP_MISS_CUT_SEQ_INDEX                              ;
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1 
	JMP OFF_LAND_FROM_JUMP_WAIT_BALL_COLLIDE                                                 ; JUMP ->LAND FROM JUMP WITH PASS RESULT ALREADY

@do_jump_catch_cutscene:                                          ; OFFENSE JUMP CATCH CUTSCENE
	JSR CHECK_FOR_DEFENDERS_IN_CUTSCENE                           ; CHECK IF DEFENDERS NEED TO BE IN PASS RESULT CUTSCENE (C= YES OR NO, RET DEFENDER ICON ID)
	CMP #JUMPING_PASS_COLLISION_STATUS                            ; IS DEFENDER STATUS =  JUMPING?
	BNE @do_normal_jump_cutscene_catch_and_land:                  ; NO-> DO NORMAL OFFENSE JUMP CATCH CUTSCENE

@do_double_jump_cutsscne_and_land:	
	LDA #DOUBLE_JUMP_OFF_CATCH_CUT_SEQ_INDEX                      ; SET CUTSCENE ID = DOUBLE JUMP CATCH
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1 
	JMP DO_LAND_FROM_JUMP_ANIMATION                               ; JUMP->LAND FROM JUMP CATCH OR INT

@do_normal_jump_cutscene_catch_and_land:                          ; DO NORMAL OFFENSE JUMP CATCH CUTSCENE
	LDA #OFF_JUMP_CATCH_CUT_SEQ_INDEX_DUPE                        ; SET CUTSCENE ID = OFFENSE JUMP CATCH
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1 
	JMP DO_LAND_FROM_JUMP_ANIMATION                               ; JUMP->LAND FROM JUMP CATCH OR INT
	
_F}_OFFENSE_PASS_DIVE_JUMP_PASS_COLL	

_F{_DEFENSE_PASS_DIVE_JUMP_PASS_COLL							  ; DONE

temp_target_addr			= LOCAL_1

DEFENSE_JUMP_DIVE_CATCH_PASS_START:                               ; DEFENSIVE JUMPING AND DIVE CHECK START
	JSR DO_ADJUST_PLAYER_FINAL_LOCATION_PASS                         ; SET FINAL PLAYER LOCATION AND RETURN DIRECTION()
	BCS @check_if_pass_defender_at_final_location                 ;
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO MAN READY TO MOVE /MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

	
_WHILE CC                                                         ; DEFENDER JUMP AND DIVE CHECK LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME

@check_ball_colliding_defender:	
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL COLLIDED?
	BVS CHECK_DEFENDER_CLOSE_TO_PASS_BALL_COLLIDING                          ; YES-> BALL ABOUT TO COLLIDE WITH PLAYER 

@check_for_defender_dive_jump:	
	JSR GET_LARGER_BALL_DIST_FOR_PASS_DIVE_JUMP_CHECK             ; GET GREATER REMAINING BALL DISTANCE(X,Y) RET=A=DIST 
	CMP #PASS_JUMP_CHECK_X_LOC_UPPER_LIMIT                        ; FINAL BALL VS BALL (X/Y) > 9.75 YARDS?
	BCS @do_defender_dive_check                                   ; YES->DEFENSIVE DIVE CHECK
	CMP #PASS_JUMP_CHECK_X_LOC_LOWER_LIMIT                        ; FINAL BALL VS BALL (X/Y)< 7.75 YARDS AWAY FROM BALL?
	BCC @do_defender_dive_check                                    ; YES->DEFENSIVE DIVE CHECK
	
@check_for_defender_jump:	
	JSR CHECK_IF_PLAYER_CLOSE_ENOUGH_TO_JUMP_FOR_BALL             ; CHECK IF PLAYER IS CLOSE ENOUGH TO BALL TO JUMP FOR IT()
	BCC @do_defender_dive_check                                   ; NO->DEFENSIVE DIVE CHECK
	JMP DO_DEFENDER_JUMP_FOR_PASS                                 ; YES->DEFENDER JUMP

@do_defender_dive_check:                                          ; DEFENSIVE DIVE CHECK
	LDA BALL_ANI_FRAMES_LEFT + 1                                  ; PASS TIMER>256 FRAMES 
	BNE @check_if_pass_defender_at_final_location                 ; YES-> CHECK IF DEFENDER HAS REACHED FINAL LOCATION, SET TO STOPPED IF THEY HAVE

@check_ball_animation_within_dive_limits:	
	LDA BALL_ANI_FRAMES_LEFT                                      ; PASS TIMER> 24 FRAMES 
	CMP #PASS_DIVE_TIME_UPPER_LIMIT                               ;
	BCS @check_if_pass_defender_at_final_location                 ; YES->CHECK IF DEFENDER HAS REACHED FINAL LOCATION, SET TO STOPPED IF THEY HAVE
	CMP #PASS_DIVE_TIME_LOWER_LIMIT                               ; PASS TIMER< 22 FRAMES 
	BCC @check_if_pass_defender_at_final_location                 ; YES->CHECK IF DEFENDER HAS REACHED FINAL LOCATION, SET TO STOPPED IF THEY HAVE
	
@check_defender_close_enough_to_dive:	
	LDA CURRENT_PLAYER_ADDR                                       ; PUT TARGET PLAYER POINTER in 3E,3F 
	STA temp_target_addr                                          ;
	LDA CURRENT_PLAYER_ADDR +1                                    ;
	STA temp_target_addr +1                                       ;
	JSR COMPARE_PLAYER_FINAL_BALL                                 ; GET GREATER OF PLAYER X,Y DISTANCE TO FINAL BALL LOCATION(3E,3F= PLAYER POINTER)
	CMP #PASS_DIVE_CHECK_X_LOC_UPPER_LIMIT                        ; DEFENDER X/Y DISTANCE FROM BALL > 7.25 YARDS AWAY 
	BCS @check_if_pass_defender_at_final_location                 ; YES->CHECK IF DEFENDER HAS REACHED FINAL LOCATION, SET TO STOPPED IF THEY HAVE
	CMP #PASS_DIVE_CHECK_X_LOC_LOWER_LIMIT                        ; DEFENDER X/Y DISTANCE FROM BALL > 4 YARDS AWAY
	BCS DO_DEFENDER_DIVE_FOR_PASS                                 ; YES-> DEFENSIVE PLAYER PASS DIVE START

@check_if_pass_defender_at_final_location:                        ; CHECK IF DEFENDER HAS REACHED FINAL LOCATION, SET TO STOPPED IF THEY HAVE
	JSR CHECK_DEFENDER_REACHED_FINAL_LOC_PASS                     ; CHECK IF DEFENDER REACHED FINAL LOCATION, IF AT BACK OF ENDZONE SET LOC TO FINAL BALL Y()
	
_END_WHILE

@set_pass_defender_at_final_location:
	LDA #AT_FINAL_LOC_PASS_COLLISION_STATUS                       ; SET DEFENDER PASS STATUS = PLAYER HAS REACHED FINAL LOCATION
	JSR SET_DEFENDER_PASS_STATUS                                  ; SET DEFENDER PASS STATUS(E6-E8, A= STATUS TYPE X= PRIORITY INDEX)

@stop_defender_and_turn_towards_ball:	
	LDA BALL_ANGLE                                                ; SET PLAYER DIRECTION = OPPOSITE DIRECTION OF BALL ANGLE
	EOR #$80                                                      ; 
	SET_CUR_PLAYER_DIRECTION
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()

_WHILE VALUE_CLEAR                                                ; DEFENDER CHECK FOR BALL COLLIDED/ PASS RESULT LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA BALL_STATUS                                               ; PASS RESULT?
	AND #(BALL_INTERCEPTED_BITFLAG + BALL_DEFLECTED_BITFLAG + BALL_CAUGHT_BITFLAG + BALL_FUMBLED_BITFLAG )                                                      ;
	BNE PASS_RESULT_ALREADY_DO_NEXT_DEF_COMMAND                    ; YES->END OF JUMP/DIVE CHECK
	BIT BALL_COLLISION                                            ; HAS BALL COLLIDED?

_END_WHILE                                                 ; NO-> DEFENDER CHECK FOR BALL COLLIDED/ PASS RESULT LOOP

DEFENDER_WAIT_AFTER_PASS_BALL_COLLIDE_DELAY_FRAMES		= $09     ; + 0 to 3 random 

CHECK_DEFENDER_CLOSE_TO_PASS_BALL_COLLIDING:                      ; BALL COLLIDING, CHECK IF DEFNDER IS CLOSE TO BALL
	JSR CHECK_PLAYER_CLOSE_ENOUGH_TO_BALL                         ; IS PLAYER CLOSE ENOUGH TO BALL()
	BCC @defender_not_close_enough_to_ball                        ; NO->9 FRAME DELAY THEN GO TO END OF PASS DIVE
	
@set_player_close_to_ball: 	
	JSR SET_DEFENDER_PASS_STATUS_NEAR_BALL                        ; SAVE POSITION ID IN PLAYER PASS STATUS, SET PLAYER NEAR BALL

@defender_not_close_enough_to_ball:                               ; 9 FRAME DELAY THEN GO TO END OF PASS DIVE
	LDA #DEFENDER_WAIT_AFTER_PASS_BALL_COLLIDE_DELAY_FRAMES         ; LOAD 9 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	
PASS_RESULT_ALREADY_DO_NEXT_DEF_COMMAND:                           ; END OF PASS DIVE
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP-> DO NEXT PLAYER COMMAND

DO_DEFENDER_DIVE_FOR_PASS:                                        ; DEFENSIVE PLAYER PASS DIVE START
	LDA #DIVING_PASS_COLLISION_STATUS                             ; SET DEFENDER PASS STATUS = DIVING PASS STATUS
	JSR SET_DEFENDER_PASS_STATUS                                  ; SET DEFENDER PASS STATUS(E6-E8, A= STATUS TYPE X= PRIORITY INDEX)
	JSR DO_PASS_DIVE_ANI_AND_BALL_COLL_CHECK                      ; DO DIVE ANIMATION AND CHECK IF PLAYER NEAR BALL()
	BCC @end_of_defender_dive_for_pass                            ; NEAR BALL? NO->DO END OF DIVE DEFENDER

@set_defender_status_near_ball:	
	JSR SET_DEFENDER_PASS_STATUS_NEAR_BALL                        ; SAVE POSITION ID IN PLAYER PASS STATUS, SET PLAYER PASS STATUS = NEAR BALL

@end_of_defender_dive_for_pass:                                   ; DO END OF DIVE DEFENDER
	JSR END_OF_PASS_DIVE_CANT_CATCH_BALL                          ; DO END OF DIVE()
	JSR SET_DEFENDER_ON_GROUND_AFTER_PASS_DIVE                    ; SET PASS DEFENDER STATUS TO NOT DIVING, NOT JUMPING, NOT STOPPED()
	JMP DO_NEXT_PLAYER_COMMAND                                    ; JUMP->DO NEXT PLAYER COMMAND
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

JUMPING_DEFENDER_AFTER_FIRST_CHECK_FRAME_DELAY	= $04			  ; IF DEFENDER NOT CLOSE ENOUGH ON INITIAL CHECK or whiffs on first check 
DEFENDER_GET_CONTROL_AFTER_LANDING_FRAME_DELAY	= $03

DO_DEFENDER_JUMP_FOR_PASS:                                        ; DEFENDER JUMP FOR PASS
	LDA #JUMPING_PASS_COLLISION_STATUS                            ; SET DEFENDER PASS STATUS = JUMPING PASS STATUS
	JSR SET_DEFENDER_PASS_STATUS                                  ; SET DEFENDER PASS STATUS(E6-E8, A= STATUS TYPE X= PRIORITY INDEX)
	JSR JUMP_UP_FOR_BALL                                          ; JUMP UP ANIMATION()
	JSR CHECK_IF_BALL_CATCHABLE_AFTER_JUMP                        ; CHECK FOR BALL OOB, OR NOT CATCHABLE AFTER JUMPING()
	BCS @check_defender_jump_int_close_on_first_check                                                 ; YES->DO DEFENDER JUMP,TIP WHIFF CHECK WITH 4 FRAME DELAY AFTER
	
@check_again_in_four_frames
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] JUMPING_DEFENDER_AFTER_FIRST_CHECK_FRAME_DELAY
	JSR CHECK_IF_BALL_CATCHABLE_AFTER_JUMP                        ; CHECK FOR BALL OOB, OR NOT CATCHABLE AFTER JUMPING()
	BCC @defender_land_from_jump_not_catchable                    ; NO->DO END OF DEFENDER JUMP

@do_jumping_defender_calculations	
	JSR DEFENDER_JUMPING_INT_TIP_WHIFF_CHECK                      ; DEFENDER JUMP,TIP WHIFF CHECK()

@defender_whiffs_on_pass:	
	JMP @defender_land_from_jump_not_catchable                    ; JUMP->DO END OF DEFENDER JUMP

@check_defender_jump_int_close_on_first_check:                    ; DO DEFENDER JUMP,TIP WHIFF CHECK WITH 4 FRAME DELAY AFTER 
	JSR DEFENDER_JUMPING_INT_TIP_WHIFF_CHECK                      ; DEFENDER JUMPING,TIP WHIFF CHECK()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] JUMPING_DEFENDER_AFTER_FIRST_CHECK_FRAME_DELAY

@defender_land_from_jump_not_catchable:                           ; DO END OF DEFENDER JUMP
	JSR LAND_FROM_JUMP                                            ; LAND FROM JUMP ANIMATION()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] DEFENDER_GET_CONTROL_AFTER_LANDING_FRAME_DELAY
	JMP DO_NEXT_PLAYER_COMMAND                                    ; DO NEXT PLAYER COMMAND

_F}_DEFENSE_PASS_DIVE_JUMP_PASS_COLL	

_F{_DEFENSE_JUMPING_INT_CALCULATION								  ; DONE

PASS_CONTROL_VALUE						= PLAYER_COMMAND_ARG1

		
DEFENDER_JUMPING_INT_TIP_WHIFF_CHECK:                              ; DEFENDER JUMPING ,TIP WHIFF CHECK

@check_if_ball_already_has_status:
	LDA BALL_STATUS                                               ; IS BALL STATUS = TIP,COMPLETE, OR FUMBLED 
	AND #(BALL_DEFLECTED_BITFLAG + BALL_CAUGHT_BITFLAG + BALL_FUMBLED_BITFLAG )                                                     ; 
	BNE @def_whiffs_on_tip_attempt                                ; YES?->DEFENDER JUMPS WITHOUT COLLIDING WITH BALL

	
	JSR ADD_PASS_CONTROL_SKILL_AND_REC_SKILL                      ; LOAD PC+REC, PC in $DC, PC+REC in $DD()
	LDX PASS_CONTROL_VALUE                                         ; LOAD PC VALUE
	LOAD_CUR_PLAYER_POSITION_ID
	JSR PC_REC_INT_ADJUST_BY_RAND_FOR_PASS_OUTCOME                ; PC,REC,INT CALCULATION ROUTINE (A=DEFENDER VALUE, $43=PC OR PC+REC)
	BIT CUTSCENE_CHANCE                                           ; 25% CHANCE OF CUTSCENE?   
	BVS @def_jump_tip_whiff_with_cutscene                          ; YES->CUTSCENE JUMP INT, WHIFF, TIP START
	
	
	CMP #JUMPING_DEFENDER_WHIFF_THRESHOLD                         ; VALUE > WHIFF THRESHOLD ? 
	BCS @def_whiffs_on_tip_attempt                                ; YES->DEFENDER JUMPS WITHOUT COLLIDING WITH BALL

	CMP #JUMPING_DEFENDER_INT_THRESHOLD                            ; VALUE > JUMPING INT THRESHOLD? 
	BCS @def_jump_tips_pass                                       ; YES-> DEFENDER TIPS PASS 

@defender_jump_intercepts_pass	
	JSR DO_END_OF_DEFENDER_JUMP_INTERCEPTS_PASS                   ; NO-> DEFENDER JUMPING INT
	RTS
	
@def_jump_tips_pass:                                              ; DEFENDER TIPS PASS 
	LDA #BALL_HIT_HAND_SOUND                                      ; LOAD TIPPED BALL SOUND 
	JSR PLAY_SOUND                                                ; LOAD SOUND IF NONE IS PLAYING ELSE WAIT(A=SOUND) 
	JSR CHECK_IF_PASS_INTD_CAUGHT_FUMBLED                           ; CHECK IF PASS INTERCEPTED OR BLOCKED. SET PASS TO BLOCKED IF NOT()

@def_whiffs_on_tip_attempt:                                       ; DEFENDER JUMPS WITHOUT COLLIDING WITH BALL
	RTS                                                           ; RETURN
				
@def_jump_tip_whiff_with_cutscene:                                ; CUTSCENE JUMP INT, WHIFF, TIP START (A= PASS CALCULATION RESULT)
	TAX                                                           ;
	LOAD_CUR_PLAYER_POSITION_ID									  ;
	AND #$0F                                                      ; MASK OUT PLAYER SIDE
	CLC                                                           ;
	ADC #OFFSET_TO_DEFENDER_STARTERS                              ; + OFFSET TO DEFENDERS FOR TEAM PLAYER ID
	STA DEF_SACK_BALL_BLOCK_STARTER_ID                            ; SAVE DEFENDER ID


	CPX #JUMPING_DEFENDER_WHIFF_THRESHOLD                         ; IS RESULT > JJ WHIFF THRESHOLD 
	BCS @set_cut_def_jump_whiff                                   ; YES-> SET DEFENDER JJ WHIFF CUTSCENE ID
	
	CPX #JUMPING_DEFENDER_INT_THRESHOLD                           ; IS RESULT > JJ INT THRESHOLD
	BCS @set_cut_def_jump_tip_do_cut                              ; YES-> SET DEFENDER JJ TIP CUTSCENE ID
	
	JSR DO_END_OF_DEFENDER_JUMP_INTERCEPTS_PASS                   ; SET BALL STATUS TO INTERCEPTED, END BALL ANIMATION UPDATE PLAYER COLLISION()
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS+3                           ; DOES TARGET STATUS = JUMPING/DIVING
	AND #(DIVING_PASS_COLLISION_STATUS+ JUMPING_PASS_COLLISION_STATUS)                                                     
	CMP #JUMPING_PASS_COLLISION_STATUS                            ;  
	BNE @set_cut_def_jump_int_do_cut                              ; NO->SET CUTSCENE ID= JUMPING DEFENDER INT 

@set_cut_double_jump_do_cut: 	
	LDA #DOUBLE_JUMP_DEF_INT_CUT_SEQ_INDEX                         ; SET CUTSCENE ID = DEFENDER + WR JUMP INT
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1
	RTS                                                           ; RETURN

@set_cut_def_jump_int_do_cut:                                     ; SET CUTSCENE ID= JUMPING DEFENDER INT  
	LDX #DEF_JUMP_INT_CUT_SEQ_INDEX                                                      ; SET CUTSCENE ID = DEFENDER JUMPING INT 
	JMP @check_target_jumping_diving                              ; JUMP->PLAY CUTSCENE IF WR NOT JUMPING OR DIVING

@set_cut_def_jump_tip_do_cut:                                     ; SET DEFENDER CUTSCENE ID = JJ TIP
	JSR CHECK_IF_PASS_INTD_CAUGHT_FUMBLED                           ; CHECK IF PASS INTERCEPTED OR BLOCKED. SET PASS TO BLOCKED IF NOT()
	LDX #DEF_JUMP_BOUNCE_HANDS_CUT_SEQ_INDEX                      ; SET CUTSCENE ID = DEFENDER JUMPING TIP
	JMP @check_target_jumping_diving                              ; JUMP->PLAY CUTSCENE IF WR NOT JUMPING OR DIVING

@set_cut_def_jump_whiff:                                          ; SET DEFENDER CUTSCENE ID = JJ WHIFF
	LDX #DEF_JUMP_MIS_CUT_SEQ_INDEX                               ; SET CUTSCENE ID = DEFENDER JUMPING WHIFF

@check_target_jumping_diving:                                     ; PLAY CUTSCENE IF WR NOT JUMPING OR DIVING
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS+3                           ; DOES TARGET STATUS = JUMPING OR DIVING
	AND #(DIVING_PASS_COLLISION_STATUS+ JUMPING_PASS_COLLISION_STATUS)  ; *** should only and with diving status                                                   
	BNE @dont_do_jumping_def_cutscene                              ; YES->EXIT PASS RESULT CUTSCENE
	
@do_cutscene:	
	TXA                                                           ; LOAD CUTSCENE ID
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1
	
@dont_do_jumping_def_cutscene:                                     ; EXIT PASS RESULT CUTSCENE
	RTS                                                           ; RETURN

	
	
DO_END_OF_DEFENDER_JUMP_INTERCEPTS_PASS:                          ; SET BALL STATUS TO INTERCEPTED, END BALL ANIMATION UPDATE PLAYER COLLISION
	SET_BALL_INTERCEPTED[]
	JMP DO_END_OF_RECEPTION_INTERCEPTION                          ; KILL BALL ANI, SET BALL TO COLLIDED, UPDATE PLAYER COLLIDE BITMASKS, UPDATE ICONS, UPDATE BALL STATUS


_F}_DEFENSE_JUMPING_INT_CALCULATION

_F{_SET_DEFENDER_PASS_STATUS_TO_NEAR_BALL						  ; DONE
	
pass_priority_index						= EXTRA_PLAYER_RAM_3
DEFENDER_NEAR_PASSED_BALL_BITMASK		= $BF
																  ; set player_near_ball at end of dive or if close to ball not dive or jump
SET_DEFENDER_PASS_STATUS_NEAR_BALL:                               ; SAVE DEFENDER POSITION ID IN PLAYER PASS STATUS, SET PLAYER NEAR BALL
	LDY #pass_priority_index                                      ; COPY PLAYER PASS PRIORITY TO X 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	TAX                                                           ; 
	LOAD_CUR_PLAYER_POSITION_ID                                   ; 
	ORA PLAYERS_CAN_COLLIDE_BALL_PASS,X                           ;
	AND #DEFENDER_NEAR_PASSED_BALL_BITMASK                        ; SET DEFENDER PASS STATUS = DEFENDER NEAR BALL
	STA PLAYERS_CAN_COLLIDE_BALL_PASS,X                           ;
	RTS                                                           ; RETURN
	
_F}_SET_DEFENDER_PASS_STATUS_TO_NEAR_BALL

_F{_CHECK_FOR_DEFENDERS_IN_CUTSCENE								  ; DONE

	
CHECK_FOR_DEFENDERS_IN_CUTSCENE:                                  ; CHECK IF DEFENDERS NEED TO BE IN PASS RESULT CUTSCENE (C= YES OR NO, RET DEFENDER ICON ID)

@check_first_defender:
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS                             ; DOES 1ST PRIORITY DEFENDER STATUS = NEW PASS STATUS 
	CMP #NO_PASS_COLLISION_STATUS                                 ; 
	BNE @save_defender_id_for_cutscene                            ; YES->SAVE POSITION ID + DEFENDER OFFSET IN $680 AND RETURN STATUS
	
@check_second_defender:	
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS+1                           ; DOES 2ND PRIORITY DEFENDER STATUS = NEW PASS STATUS
	CMP #NO_PASS_COLLISION_STATUS                                 ; 
	BNE @save_defender_id_for_cutscene                            ; YES->SAVE POSITION ID + DEFENDER OFFSET IN $680 AND RETURN STATUS
	
@check_third_defender:	
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS+2                           ; DOES 3RD PRIORITY DEFENDER STATUS = NEW PASS STATUS
	CMP #NO_PASS_COLLISION_STATUS                                 ;
	BNE @save_defender_id_for_cutscene                            ; YES-> SAVE POSITION ID + DEFENDER OFFSET IN $680 AND RETURN STATUS

@no_defender_in_cutscene:	
	LDA #$00                                                      ; SET DEFENDER ID = NONE
	CLC                                                           ; CLEAR CARRY = NO DEFENDER HAD NEW STATUS 
	RTS                                                           ; RETURN

@save_defender_id_for_cutscene:                                   ; SAVE POSITION ID + DEFENDER OFFSET IN $680 AND RETURN STATUS
	TAX                                                           ; SAVE PASS STATUS
	AND #$0F                                                      ; MASK OUT PASS STATUS
	CLC                                                           ;
	ADC #OFFSET_TO_DEFENDER_STARTERS                              ; + OFFSET TO DEFENDERS
	STA DEF_SACK_BALL_BLOCK_STARTER_ID                            ; SAVE DEFENDER MAKING PLAY
	TXA                                                           ;
	AND #$30                                                      ; MAKE SURE PASS STATUS IS BETWEEN 0 AND 30 
	SEC                                                           ; SET CARRY = DEFENDER STATUS
	RTS                                                           ; RETURN

_F}_CHECK_FOR_DEFENDERS_IN_CUTSCENE	

_F{_SET_PASS_STATUS_FUNCTIONS									 ; DONE
	
SET_DEFENDER_PASS_STATUS:                                         ; SET DEFENDER PASS STATUS(E6-E8, A= STATUS TYPE X= PRIORITY INDEX)
	PHA                                                           ; SAVE PASS STATUS VALUE
	LDY #PASS_PRIORITY_PLAYER_RAM                                 ; LOAD PLAYER PRIORITY
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;  
	TAX                                                           ;
	PLA                                                           ; LOAD PASS STATUS VALUE

SET_TARGET_PASS_STATUS:                                           ; SET PASS TARGET STATUS AND POSITION ID(A= STATUS TYPE X= INDEX) 
	ORA PLAYERS_CAN_COLLIDE_BALL_PASS,X                           ; SAVE PASS STATUS TYPE
	STA PLAYERS_CAN_COLLIDE_BALL_PASS,X                           ;
	LOAD_CUR_PLAYER_POSITION_ID 
	AND #$0F                                                      ;
	ORA PLAYERS_CAN_COLLIDE_BALL_PASS,X                           ;
	STA PLAYERS_CAN_COLLIDE_BALL_PASS,X                           ; 
	RTS                                                           ; RETURN


	
SET_DEFENDER_ON_GROUND_AFTER_PASS_DIVE:                           ; SET PASS DEFENDER STATUS = NOT DIVING, NOT JUMPING, NOT STOPPED()
	LDY #PASS_PRIORITY_PLAYER_RAM                                 ; LOAD PLAYER PRIORITY INDEX
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	TAX                                                           ; 
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS,X                           ; SET DEFENDER PASS STATUS = ON GROUND AFTER DIVE
	AND #$0F                                                      ;
	STA PLAYERS_CAN_COLLIDE_BALL_PASS,X                           ;
	RTS                                                           ; RETURN

_F}_SET_PASS_STATUS_FUNCTIONS	

_F{_START_OF_PASS_CALCULATIONS								     ; DONE


PASS_CONTROL_VALUE				    = PLAYER_COMMAND_ARG1		 ; *** could maybe use local 
PC_PLUS_RECEPTION					= PLAYER_COMMAND_ARG2		 ; *** could maybe use local 
	
NORMAL_PASS_RESULT_CALCULATION:                                   ; NORMAL PASS TARGET CALCULATIONS()
	JSR CHECK_FOR_PASS_RESULT_ALREADY                             ; CHECK BALL STATUS FOR PASS RESULT. SET CARRY AND CLEAR VALUE AND RETURN IF PASS RESULT()  

																  ; CHECK FOR TARGET CLOSE ENOUGH TO BALL
	JSR CHECK_PLAYER_CLOSE_ENOUGH_TO_BALL                         ; IS PLAYER CLOSE ENOUGH TO BALL()
	BCC PASS_CALCULATION_TARGET_NOT_CLOSE_TO_BALL                 ; NO->CHECK IF DEFENDERS CAN INTERCEPT TARGET NOT CLOSE ENOUGH()
	
@target_close_to_ball	
	LOAD_CUR_PLAYER_POSITION_ID
	STA PLAYERS_CAN_COLLIDE_BALL_PASS+3                           ; Save target ID
	JMP CHECK_ANY_DEFENDER_CAN_AFFECT_PASS                       ; JUMP->CHECK IF ANY DEFENDER CAN IMPACT PASS

TARGET_JUMP_DIVE_PASS_CALC_START:                                 ; PASS TARGET JUMP/DIVE CALCULATIONS() IF PASS RESULT ALREADY RET AND SEC & ClV
	JSR CHECK_FOR_PASS_RESULT_ALREADY                             ; CHECK BALL STATUS. SET CARRY AND CLEAR VALUE IF PASS RESULT ALREADY()

CHECK_ANY_DEFENDER_CAN_AFFECT_PASS:                                ; CHECK IF ANY DEFENDER CAN IMPACT PASS
	JSR ADD_PASS_CONTROL_SKILL_AND_REC_SKILL                      ; GET PC TABLE VALUE, REC TABLE VALUE, PC VAL in $DC, PC+REC VAL in $DD()
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS                             ; DO ALL DEFENDERS PASS STATUSES = TOO FAR AWAY, JUMPING, OR DIVING? 
	AND PLAYERS_CAN_COLLIDE_BALL_PASS+1                           ; 
	AND PLAYERS_CAN_COLLIDE_BALL_PASS+2                           ; 
	AND #NO_PASS_COLLISION_STATUS	                              ;
	BEQ PASS_RESULT_CALCS_DEFENDER_NEAR                           ; NO-> DEFENDER(S) NEAR
	
_F}_START_OF_PASS_CALCULATIONS								     ; DONE	

_F{_PASS_CALCS_ONLY_WR_NEAR_BALL								   ; DONE	

PASS_RESULT_CALCS_NO_DEFENDER_NEAR:	
	
qb_to_wr_check_value	= LOCAL_8
	
@qb_to_wr_no_def_near:                                            ; QB TO WR BY THEMSELF
	LDA RANDOM_3                                                  ; MAKE RAND # 3D RANGE = 0X80 TO 0XFF
	ORA #$80                                                      ; 
	LDX PC_PLUS_RECEPTION                                         ; LOAD PC+REC
	JSR MULTIPLY_A_TIMES_X                                        ; MULTIPLY (A * X) (X-1 to X/2 Stored in $45)
	LDA qb_to_wr_check_value                                      ; RANGE = PC+REC-1 to (PC+REC-1)/2
	CMP #UNCOVERED_RECEPTION_THRESHOLD                            ; VALUE > RECEPTION THRESHOLD
	BCS RECEPTION_NORMAL                                          ; YES->RECEPTION

@qb_to_wr_incomplete:	
	JMP BALL_TIPPED_OR_INCOMPLETE                                 ; NO-> BALL INCOMPLETE
	

_F}_PASS_CALCS_ONLY_WR_NEAR_BALL	

_F{_PASS_CALCS_WR_AND_DEFENDER_NEAR_BALL						  ; DONE	

PASS_RESULT_CALCS_DEFENDER_NEAR:	
	
@check_1st_def_wr_near:                                           ; DEFENDER(S) NEAR
	LDX PC_PLUS_RECEPTION                                         ; LOAD X WITH PC+REC TABLE VALS
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS                             ; LOAD 1st PRIORITY DEFENDER 
	JSR PC_REC_INT_ADJUST_BY_RAND_FOR_PASS_OUTCOME                ; PC,REC,INT CALCULATION ROUTINE (A=DEFENDER VALUE, X=PC OR PC+REC)
	BCC @check_2nd_def_wr_near                                    ; 1ST DEFENDER CANT DEFEND->2ND DEFENDER WITH WR CHECK
	LDY PLAYERS_CAN_COLLIDE_BALL_PASS                             ; LOAD DEFENDER ID+ STATUS IN CASE OF INTERCEPTION

@check_for_interception_1st_def:	
	CMP #COVERED_INTERCEPTION_THRESHOLD                           ; VALUE < INTERCEPTION THRESHOLD 
	BCC INTERCEPTION_NORMAL                                       ; YES-> BALL INTERCEPTED

@check_for_defelection_1st_def:	
	CMP #COVERED_RECEPTION_THRESHOLD                              ; VALUE > RECEPTION THRESHOLD
	BCC BALL_TIPPED_OR_INCOMPLETE                                 ; NO->BALL INCOMPLETE

@check_2nd_def_wr_near:                                           ; 2ND DEFENDER WITH WR CHECK
	LDX PC_PLUS_RECEPTION                                         ; LOAD X WITH PC+REC TABLE VALS
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS+1                           ; LOAD 2ND PRIORITY DEFENDER (if value minus (no defender)
	JSR PC_REC_INT_ADJUST_BY_RAND_FOR_PASS_OUTCOME                ; PC,REC,INT CALCULATION ROUTINE (A=DEFENDER VALUE, X=PC OR PC+REC
	BCC @check_3nd_def_wr_near                                    ; 2ND DEFENDER CANT DEFEND ->3RD DEFENDER WITH WR CHECK
	LDY PLAYERS_CAN_COLLIDE_BALL_PASS+1                           ; LOAD DEFENDER ID + STATUS IN CASE OF INTERCEPTION
	
@check_for_interception_2nd_def:	
	CMP #COVERED_INTERCEPTION_THRESHOLD                           ; VALUE < INTERCEPTION THRESHOLD
	BCC INTERCEPTION_NORMAL                                       ; YES-> BALL INTERCEPTED

@check_for_defelection_2nd_def:	
	CMP #COVERED_RECEPTION_THRESHOLD                              ; VALUE > RECEPTION THRESHOLD
	BCC BALL_TIPPED_OR_INCOMPLETE                                 ; NO-> BALL INCOMPLETE

@check_3nd_def_wr_near:                                           ; 3RD DEFENDER WITH WR CHECK
	LDX PC_PLUS_RECEPTION                                          ; LOAD X WITH PC+REC TABLE VALS
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS+2                           ; LOAD 3RD PRIORITY DEFENDER 
	JSR PC_REC_INT_ADJUST_BY_RAND_FOR_PASS_OUTCOME                ; PC,REC,INT CALCULATION ROUTINE (A=DEFENDER VALUE, X=PC OR PC+REC 
	BCC RECEPTION_NORMAL
	
	LDY PLAYERS_CAN_COLLIDE_BALL_PASS+2                           ; LOAD DEFENDER ID + STATUS IN CASE OF INTERCEPTION 
	CMP #COVERED_INTERCEPTION_THRESHOLD                           ; VALUE < INTERCEPTION THRESHOLD
	BCC INTERCEPTION_NORMAL                                       ; BRANCH TO BALL INTERCEPTED
	CMP #COVERED_RECEPTION_THRESHOLD                              ; VALUE > RECEPTION THRESHOLD
	BCC BALL_TIPPED_OR_INCOMPLETE                                 ; BRANCH TO  BALL INCOMPLETE
	
@else_reception:	
	JMP RECEPTION_NORMAL                                          ; JUMP->RECEPTION

_F}_PASS_CALCS_WR_AND_DEFENDER_NEAR_BALL		
	
_F{_PASS_CALCULATIONS_WR_NOT_NEAR_BALL							  ; DONE
																  ; ***MAJOR BUG!! $DC NOT LOADED WITH PASS CONTROL VALUE
																  ; WILL BE WHATEVER COMMAND ARGUMENT BYTE WAS IN THERE LAST
PASS_CALCULATION_TARGET_NOT_CLOSE_TO_BALL:                        ; CHECK IF DEFENDERS CAN INTERCEPT TARGET NOT CLOSE ENOUGH()
	JSR CHECK_FOR_PASS_RESULT_ALREADY                             ; CHECK BALL STATUS FOR PASS RESULT. SET CARRY AND CLEAR VALUE IF PASS RESULT()
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS                             ; DO ALL DEFENDERS PASS STATUSES = TOO FAR AWAY, JUMPING, OR DIVING? 
	AND PLAYERS_CAN_COLLIDE_BALL_PASS+1                           ;
	AND PLAYERS_CAN_COLLIDE_BALL_PASS+2                           ;
	AND #NO_PASS_COLLISION_STATUS                                 ;
	BNE BALL_TIPPED_OR_INCOMPLETE                                 ; YES->BALL INCOMPLETE

																  ; 1ST DEFENDER NO WR CHECK
	LDX PASS_CONTROL_VALUE                                        ; LOAD X WITH PC VALUE *** BUG
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS                             ; LOAD 1ST PRIORITY DEFENDER STATUS + ID
	JSR PC_REC_INT_ADJUST_BY_RAND_FOR_PASS_OUTCOME                ; PC,REC,INT CALCULATION ROUTINE (A=DEFENDER VALUE, X=PC OR PC+REC)
	BCC @check_2nd_def_no_wr_near                                 ; NO DEFENDER? -> 2ND DEFENDER CHECK
	LDY PLAYERS_CAN_COLLIDE_BALL_PASS                             ; LOAD 1ST PRIORITY DEFENDER STATUS + ID IN CASE OF INT
	CMP #TARGET_NOT_CLOSE_INT_THRESHOLD                           ; VALUE < NO WR INTERCEPTION THRESHOLD 
	BCC INTERCEPTION_NORMAL                                       ; YES->INTERCEPTION

@check_2nd_def_no_wr_near:                                        ; 2ND DEFENDER NO WR CHECK
	LDX PASS_CONTROL_VALUE                                        ; LOAD X WITH PC VALUE *** BUG
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS+1                           ; LOAD 2ND PRIORITY DEFENDER STATUS + ID 
	JSR PC_REC_INT_ADJUST_BY_RAND_FOR_PASS_OUTCOME                ; PC,REC,INT CALCULATION ROUTINE (A=DEFENDER VALUE, X=PC OR PC+REC)
	BCC @check_3nd_def_no_wr_near                                 ;
	LDY PLAYERS_CAN_COLLIDE_BALL_PASS+1                           ; LOAD 2ND PRIORITY DEFENDER STATUS + ID IN CASE OF INT
	CMP #TARGET_NOT_CLOSE_INT_THRESHOLD                           ; VALUE < NO WR INTERCEPTION THRESHOLD 
	BCC INTERCEPTION_NORMAL                                       ; YES->INTERCEPTION

@check_3nd_def_no_wr_near:                                        ; 3RD DEFENDER NO WR CHECK
	LDX PASS_CONTROL_VALUE                                        ; LOAD X WITH PC VALUE *** BUG
	LDA PLAYERS_CAN_COLLIDE_BALL_PASS+2                           ; LOAD 3RD PRIORITY DEFENDER STATUS + ID
	JSR PC_REC_INT_ADJUST_BY_RAND_FOR_PASS_OUTCOME                ; PC,REC,INT CALCULATION ROUTINE (A=DEFENDER VALUE, X=PC OR PC+REC)
	BCC BALL_TIPPED_OR_INCOMPLETE                                 ; NO DEFENDER-> BALL INCOMPLETE
	LDY PLAYERS_CAN_COLLIDE_BALL_PASS+2                           ; LOAD 3RD PRIORITY DEFENDER STATUS + ID IN CASE OF INT
	CMP #TARGET_NOT_CLOSE_INT_THRESHOLD                           ; VALUE < NO WR INTERCEPTION THRESHOLD 
	BCC INTERCEPTION_NORMAL                                       ; YES->BALL INTERCEPTED
	JMP BALL_TIPPED_OR_INCOMPLETE                                 ; NO-> BALL TIPPED OR INCOMPLETE
	
_F}_PASS_CALCULATIONS_WR_NOT_NEAR_BALL
	
_F{_PASS_CAUGHT													  ; DONE
	
RECEPTION_NORMAL:                                                 ; RECEPTION
	JSR DO_END_OF_RECEPTION_INTERCEPTION                          ; KILL BALL ANI, SET BALL TO COLLIDED, UPDATE PLAYER COLLIDE BITMASKS, UPDATE ICONS, UPDATE BALL STATUS
	CLC                                                           ; CLC = BALL CAUGHT
	RTS                                                           ; RETURN

_F}_PASS_CAUGHT

_F{_PASS_TIPPED_OR_INCOMPLETE					                  ; DONE
	
BALL_TIPPED_OR_INCOMPLETE:                                        ; BALL TIPPED OR INCOMPLETE
	SEC                                                           ; SEC, CLV = BALL TIPPED OR INCOMPLETE
	CLV                                                           ;
	RTS                                                           ; RETURN
	
_F}_PASS_TIPPED_OR_INCOMPLETE	

_F{_PASS_INTERCEPTED						  					  ; DONE	

OFFSET_TO_PLAYER_TWO_RAM_ADDR = PLAYER2_RAM_ADDR_TABLE - PLAYER1_RAM_ADDR_TABLE	

save_off_player_addr	= LOCAL_1
	
INTERCEPTION_NORMAL:                                              ; INTERCEPTION
	LDA BALL_STATUS                                               ; IS BALL (CAUGHT, TIPPED OR FUMBLED)?
	AND #(BALL_DEFLECTED_BITFLAG + BALL_CAUGHT_BITFLAG + BALL_FUMBLED_BITFLAG)                                                    
	BNE BALL_TIPPED_OR_INCOMPLETE                                 ; YES->BALL TIPPED OR INCOMPLETE
	
@set_defender_id:	
	TYA                                                           ; LOAD DEFENDER
	AND #$8F                                                      ; MASK AND SHIFT FOR  DEFENDER ID
	ASL                                                           ; 
	BCC @do_end_of_interception                                   ; IS PLAYER 1-> INTERCEPTION END
	
@add_offset_to_player2_pointers:	
	ADC #(OFFSET_TO_PLAYER_TWO_RAM_ADDR -1)                       ; CARRY + OFFSET TO PLAYER 2 PLAYER POINTERS rather than add #$16

	
	
@do_end_of_interception:                                          ; INTERCEPTION END (A= OFFSET TO PLAYER POINTER)
	TAY                                                           ; 
    COPY_16_BIT_A[var1_var2] CURRENT_PLAYER_ADDR, save_off_player_addr	

	LDA PLAYER_RAM_ADDR_TABLES,Y                                  ; SET CURRENT OFFENSIVE PLAYER POINTER  = DEFENDER WHO INTERCEPTED BALL FROM PLAYER POINTER TABLE
	STA CURRENT_PLAYER_ADDR                                       ;
	LDA PLAYER_RAM_ADDR_TABLES+1,Y                                ;
	STA CURRENT_PLAYER_ADDR+1                                     ;
	JSR PLAY_CATCH_SOUND_END_BALL_ANI                             ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION = NOT MOVING & NOT BEING PITCHED()
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	JSR UPDATE_P1_OR_P2_DISPLAYED_NAME                            ; UPDATE PLAYER ICON()
	
@restore_previous_player_to_current_player:	
	COPY_16_BIT_A[var1_var2] save_off_player_addr, CURRENT_PLAYER_ADDR 	
	SET_BALL_INTERCEPTED[]
	SEC                                                           ; SET CARRY 
	BIT SET_VALUE_LOCATION                                         ; SET VALUE 
	RTS                                                           ; RETURN

_F}_PASS_INTERCEPTED	

_F{_CHECK_FOR_PASS_RESULT_OCCURED_ALREADY						  ; DONE 


CHECK_FOR_PASS_RESULT_ALREADY:                                    ; CHECK BALL STATUS. SET CARRY AND CLEAR VALUE AND RETURN TO CALL LOCATION IF PASS RESULT()
	LDA BALL_STATUS                                               ; DOES BALL STATUS = INTERCEPTION, RECEPTION, TIP, FUMBLE
	AND #(BALL_INTERCEPTED_BITFLAG+ BALL_DEFLECTED_BITFLAG + BALL_CAUGHT_BITFLAG +BALL_FUMBLED_BITFLAG )                                                     ; 
	BNE @pass_result_already                                      ; YES-> ASS RESULT ALREADY OCCURED
	RTS                                                           ; RETURN

@pass_result_already:                                             ; PASS RESULT ALREADY OCCURED
	PLA                                                           ; REMOVE RETURN ADDRESS
	PLA                                                           ;
	SEC                                                           ; SET CARRY AND CLEAR VALUE  = PASS RESULT OCCURRED ALREADY
	CLV                                                           ;
	RTS                                                           ; RETURN

_F}_CHECK_FOR_PASS_RESULT_OCCURED_ALREADY	

_F{_ADD_PASS_CONTROL_AND_RECEPTION_SKILL						  ; DONE 
	
	
ADD_PASS_CONTROL_SKILL_AND_REC_SKILL:                             ; GET PC TABLE VALUE, REC TABLE VALUE, PC VAL in $DC, PC+REC VAL in $DD()
	LDA POSSESSION_STATUS                                         ; SET PLAYER POSITION = CURRENT QB ON OFFENSE
	AND #$80                                                      ; 
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID                          ; GET ACTUAL PLAYER AND TEAM(A=PLAYER POSITION) RET X=TEAM A= ACTUAL PLAYER 
	JSR GET_PASS_CONTROL_SKILL_VALUE                              ; GET PLAYER PASSING CONTROL INDEX()
	TAY                                                           ; SET  PASSING ABILITY TABLE INDEX
	LDA PASSING_VALUES_TABLE,Y                                    ; LOAD PASS CONTROL ABILITY VALUE FROM PASSING ABILITY TABLE
	STA PASS_CONTROL_VALUE                                                       ; 
	LOAD_CUR_PLAYER_POSITION_ID									  ; 
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID                          ; GET ACTUAL PLAYER AND TEAM(A=POSITION ID) RET X=TEAM A= ACTUAL PLAYER 
	LDY #RECEPTION_INDEX                                          ; SET SKILL INDEX = RECEPTTION
	JSR GET_PLAYER_SKILL_OR_FACE                                  ; GET SKILL RATING(A=PLAYER, Y=SKILL TO GET, X=TEAM)
	TAY                                                           ;
	LDA POSSESSION_STATUS                                         ; DO WE NEED TO ADD COM JUICE?
	EOR IN_GAME_COM_COA_SKP_SIDE                                  ; 
	BPL @add_pass_control_to_rec_skill                            ; NO->ADD RECEPTION SKILL VALUE TO PASS CONTROL VALUE SAVE IN $DD AND RETURN
	TYA                                                           ; = PASS CONTROL VALUE
	CLC                                                           ; 
	ADC CPU_RECEPTION_BOOST                                       ; + PASS CONTROL COM JUICE BOOST
	TAY                                                           ;
	CPY #MAX_PLAYER_SKILL_RATING +1                                             ; VALUE > MAX SKILL?
	BCC @add_pass_control_to_rec_skill                            ; NO-> ADD RECEPTION SKILL VALUE TO PASS CONTROL VALUE SAVE IN $DD AND RETURN
	LDY #MAX_PLAYER_SKILL_RATING                                                ; ELSE SET PASS CONTROL VALUE = MAX SKILL

@add_pass_control_to_rec_skill:                                   ; ADD RECEPTION SKILL VALUE TO PASS CONTROL VALUE SAVE IN $DD AND RETURN
	LDA RECEPTION_VALUES_TABLE,Y                                  ; LOAD RECEIVING ABILITY VALUE FROM PASSING ABILITY TABLE
	CLC                                                           ;
	ADC PASS_CONTROL_VALUE                                        ; + PASS CONTROL VALUE
	STA PC_PLUS_RECEPTION                                         ; 
	RTS                                                           ; RETURN  

_F}_ADD_PASS_CONTROL_AND_RECEPTION_SKILL	

_F{_PASS_CONTROL_REC_INT_CALC_RANDOM_OUTCOME					  ; DONE
	
pc_rec_value = LOCAL_6 
pc_rec_int_result = LOCAL_8		
	
PC_REC_INT_ADJUST_BY_RAND_FOR_PASS_OUTCOME:                       ; PC,REC,INT CALCULATION ROUTINE (A=DEFENDER VALUE, X=PC OR PC+REC)
	STX pc_rec_value                                             ; STORE PC + REC OR PC
	ROL                                                           ; DEFENDER NEAR?
	BMI @set_no_defender_near                                      ; NO->CLEAR CARRY TO INDICATE NO DEFENDER
	
@get_defender_id	
	ROR                                                           ; CONVERT DEFENDER INFO INTO POSITION ID + SIDE
	AND #$8F                                                      ; 
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID                          ; GET ACTUAL PLAYER AND TEAM(A=POSITION ID) RET X=TEAM A= PLAYER 
	LDY #INTERCEPTION_INDEX                                       ; SET SKILL INDEX = INTERCEPTTION
	JSR GET_PLAYER_SKILL_OR_FACE                                  ; GET PLAYER INT SKILL INDEX(Y= SKILL TO GET)
	TAY                                                           ; Y= INT VALUE 

@check_if_defender_team_is_com_controlled:	
	LDA POSSESSION_STATUS                                         ; DO WE NEED TO ADD COM JUICE?
	EOR IN_GAME_COM_COA_SKP_SIDE                                  ; 
	BMI @load_interception_value                                  ; NO->DO CALCULATION WITH NO JUICE  

@add_com_season_int_boost	
	TYA                                                           ; = INT SKILL INDEX
	CLC                                                           ;
	ADC CPU_DEF_INT_BOOST                                         ; + INT COM JUICE BOOST
	TAY                                                           ; 
	CPY #MAX_PLAYER_SKILL_RATING +1                               ; VALUE > MAX SKILL?
	BCC @load_interception_value                                  ; NO-> DO FINAL PASS CALCULATION
	LDY #MAX_PLAYER_SKILL_RATING                                  ; ELSE SET INT SKILL INDEX = MAX SKILL

	
@load_interception_value:                                         ; DO FINAL PASS CALCULATION
	LDA pc_rec_value                                              ; LOAD PC+REC OR JUST PC
	SEC                                                           ;
	SBC INTERCEPTION_VALUES_TABLE,Y                               ; - INT VALUE VALUE FROM INT ABILITY TABLE
	BCS @get_final_calculation_value                              ;
	LDA #$00                                                      ; MAKES ALWAYS AN INT 


@get_final_calculation_value:                                     ;
	TAX                                                           ;
	JSR HEAVIER_RANDOMIZE                                         ; MORE RANDOM RANDOM # SAVE INTO A REGISTER()
	ORA #$80                                                      ; MAKE RAND # RANGE (80-FF)
	JSR MULTIPLY_A_TIMES_X                                        ; MULTIPLY (A * X)  
	LDA pc_rec_int_result                                         ; RANGE= X-1 to X/2   X = (PC+REC-INT)
	SEC                                                           ; SET CARRY = DEFNDER EXISTS
	RTS                                                           ; RETURN
	
@set_no_defender_near:                                            ; CLEAR CARRY TO INDICATE NO DEFENDER    
	CLC                                                           ; SET CARRY = NO DEFNDER 
	RTS                                                           ; RETURN

_F}_PASS_CONTROL_REC_INT_CALC_RANDOM_OUTCOME 

_F{_PLAYER_THROWN_ANIMATION_LOGIC								  ; DONE 

roll_anim_addr_temp  = LOCAL_1

DO_TUMBLE_ANIMATION_LEFT_OR_RIGHT[xy_addr]:                       ; ROLL ANIMATION WITH DIRECTION FOR ANIMATION SET TO LEFT OR RIGHT()
	STY roll_anim_addr_temp                                       ; SAVE ROLL ANIMATION POINTER
	STX roll_anim_addr_temp+1                                     ;
	LOAD_CUR_PLAYER_DIRECTION                                     ; CONVERT PLAYER DIRECTION TO SPRITE ANIMATION INDEX = LEFT OR RIGHT                                  
	CLC                                                           ;
	ADC #$40                                                      ; 
	ASL                                                           ; 
	LDA #$00                                                      ;
	ROL                                                           ;
	ROL                                                           ;
	JSR INITIALIZE_PLAYER_TUMBLE_DATA_ADDR_2_DIR                  ; SAVE ANIMATION POINTER IN $44,45 AND 1E,1F OF PLAYER RAM AND RETURN
	JMP PLAYER_THROWN_ANIMATION_LOOP                              ; JUMP ->PLAYER THROWN (ROLLING) LOOP   
	
DO_TUMBLE_ANIMATION_16_DIR[xy_addr]:                              ; MAKE PLAYER DIRECTION ONE OF 16 DIRECTIONS
	STY roll_anim_addr_temp                                       ;
	STX roll_anim_addr_temp+1                                     ;
	LOAD_CUR_PLAYER_DIRECTION                                     ; LOAD PLAYER CURRENT DIRECTION
	CLC                                                           ;
	ADC #$08                                                      ;
	AND #$F0                                                      ;
	JSR INITIALIZE_PLAYER_TUMBLE_DATA_ADDR_16_DIR                 ;
	JMP PLAYER_THROWN_ANIMATION_LOOP                              ; JUMP->PLAYER THROWN (ROLLING) LOOP

DO_TUMBLE_ANIMATION_8_DIR[xy_addr]:                               ; PLAYER THROWN ROLLING START
	JSR INITIALIZE_PLAYER_TUMBLE_DATA_ADDR_8_DIR                  ; LOAD ROLL ANIMATION POINTER INTO PLAYER RAM(X,Y=POINTER TABLE START)
	
PLAYER_THROWN_ANIMATION_LOOP:                                     ; PLAYER THROWN (ROLLING) LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR DO_PLAYER_TUMBLE_ANIMATION                                ; DO ONE FRAME OF PLAYER ROLL ANIMATION()
	BCC PLAYER_THROWN_ANIMATION_LOOP                              ; ANIMATION DONE? NO->PLAYER THROWN (ROLLING) LOOP
	JMP PLAYER_SHAKING_HEAD_GET_OFF_GROUND                        ; JUMP TO PLAYER SHAKING HEAD AND GET OFF GROUND

INITIALIZE_PLAYER_TUMBLE_DATA_ADDR_8_DIR:                        ; LOAD ROLL ANIMATION POINTER INTO PLAYER RAM(X,Y=POINTER TABLE START)
	STY roll_anim_addr_temp                                       ; SAVE ANIMATION POINTER START LOCATION
	STX roll_anim_addr_temp+1                                     ;
	LOAD_CUR_PLAYER_DIRECTION                                     ; LOAD PLAYER CURRENT DIRECTION         
	CLC                                                           ;
	ADC #$10                                                      ; 
	AND #$E0                                                      ; 
	LSR                                                           ; 
	
INITIALIZE_PLAYER_TUMBLE_DATA_ADDR_16_DIR:                        ;
	LSR                                                           ;
	LSR                                                           ;
	LSR                                                           ;

starting_data_addr		= LOCAL_1
current_data_addr		= LOCAL_7
animation_timer			= EXTRA_PLAYER_RAM_3
	
INITIALIZE_PLAYER_TUMBLE_DATA_ADDR_2_DIR:                         ; SAVE ANIMATION POINTER IN $44,45 AND 1E,1F OF PLAYER RAM AND RETURN
	TAY                                                           ; SAVE ANIMATION POINTER DIRECTION OFFSET IN Y
	LDX #THROWN_PLAYER_ANI_SCRIPT_BANK                            ; LOAD BANK 14    
	JSR SWAP_A000_BANK                                            ; SWAP A000 BANK (X= BANK TO SWAP)   
	LDA (starting_data_addr),Y                                    ; SAVE ROLL ANIMATION POINTER BASED ON DIRECTION in $44/$45
	STA current_data_addr                                         ;  
	INY                                                           ;
	LDA (starting_data_addr),Y                                    ;
	STA current_data_addr+1                                       ;  
	LDY #animation_timer                                          ; SET ANIMATION TIMER == 1 FRAME
	LDA #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA current_data_addr                                         ; SAVE ANIMATION POINTER -1  IN PLAYER RAM 1E/1F
	SEC                                                           ;
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA current_data_addr +1                                      ;
	SBC #$00                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDX #PLAYER_SCRIPT_COMMANDS_LOGIC_BANK_2                      ; LOAD BANK 22 
	JMP SWAP_A000_BANK                                            ; JUMP->SWAP A000 BANK (X= BANK TO SWAP)  
	

																; COMMAND STRUCTURE

																; (HIGH NIBBLE = Y DISTANCE, LOW NIBBLE X DISTANCE)
																; 0x00 THROUGH 0X7F = PLAYER MOVING DOWN 
																; 0x90 THROUGH 0XFF = PLAYER MOVING UP 
																; 0x81-0x8F = NUMBER FOF FRAMES TO DO CURRENT COMMAND
																; 0x80 HH LL = CHANGE SPRITE GRAPHIC ( ADDR = HH LL) 

animation_frames_left = EXTRA_PLAYER_RAM_3              
roll_anim_addr_index = EXTRA_PLAYER_RAM_4
roll_animation_index = LOCAL_8
														
DO_PLAYER_TUMBLE_ANIMATION:                                       ; DO PLAYER ROLL ANIMATION()
	LDY #roll_anim_addr_index                                     ; LOAD ANIMATION POINTER INTO 3E/3F
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA roll_anim_addr_temp                                       ;
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA roll_anim_addr_temp+1                                     ;
	LDX #THROWN_PLAYER_ANI_SCRIPT_BANK                            ; LOAD BANK 14 
	JSR SWAP_A000_BANK                                            ; SWAP A000 BANK (X= BANK TO SWAP)   
	LDA #$00                                                      ; SET ANIMATION COMMAND INDEX == FIRST COMMAND
	STA roll_animation_index                                      ;
	LDY #animation_frames_left                                    ; ANIMATION TIMER--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ;
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	BNE @do_current_animation_command                             ; IS ANIMATION TIMER = ZERO? NO BRANCH TO DO CURRENT ANIMATION COMMAND 
	LDA #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
@set_to_next_animation_command:                                   ; SET ANIMATION COMMAND INDEX TO NEXT COMMAND
	INC roll_animation_index                                      ; ANIMATION COMMAND INDEX ++

@do_current_animation_command:                                    ; DO CURRENT ANIMATION COMMAND
	LDY roll_animation_index                                      ; LOAD ANIMATION COMMAND 
	LDA (roll_anim_addr_temp),Y                                   ; 
	TAX                                                           ; SAVE in X
	BPL @player_moving_down                                       ; VALUE <80= BRANCH TO PLAYER MOVING DOWN
	CMP #$90                                                      ; 
	BCS @player_moving_up                                         ; VALUE >=90= BRANCH TO PLAYER MOVING UP
	AND #$0F                                                      ; VALUE = 81-8F= DELAY TIME
	BEQ @set_animation_time_and_change_spr                        ; 
	LDY #animation_frames_left                                    ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	JMP @set_to_next_animation_command:                           ;
	
@player_moving_down:                                              ; PLAYER MOVING DOWN
	LOG_SHIFT_RIGHT_4
	JMP @update_player_y_loc                                      ; JUMP TO CHECK TO ADD TO PLAYER Y LOCATION
	
@player_moving_up:                                                ; PLAYER MOVING UP
	LOG_SHIFT_RIGHT_4                                             ;
	ORA #$F0                                                      ; MAKE NEGATIVE SINCE MOVING UP

@update_player_y_loc:                                             ; CHECK TO ADD TO PLAYER Y LOCATION
	LDY #Y_POS + 1                                                ; =PLAYER Y LOCATION + Y AMOUNT
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	CMP #$10                                                      ; IS NEW LOCATION OFF SCREEN TOP?
	BCC @update_player_x_loc                                      ; YES-> CHECK TO ADD TO PLAYER X LOCATION
	CMP #$F0                                                      ; IS NEW LOCATION OFF SCREEN BOTTOM
	BCS @update_player_x_loc                                      ; YES-> CHECK TO ADD TO PLAYER X LOCATION
	STA (CURRENT_PLAYER_ADDR),Y                                   ; UPDATE PLAYER Y LOCATION

@update_player_x_loc:                                             ; CHECK TO ADD TO PLAYER X LOCATION
	LDY #X_POS + 1                                                ;
	TXA                                                           ;
	AND #$0F                                                      ; MASK OUT Y DISTANCE
	CMP #$08                                                      ; 
	BCS @player_moving_left_update                                ; YES->PLAYER MOVING LEFT
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; UPDATE PLAYER X LOW LOCATION
	LDA #$00                                                      ;
	JMP @player_moving_right_update                               ; JUMP->PLAYER MOVING RIGHT

@player_moving_left_update:                                       ; PLAYER MOVING LEFT
	ORA #$F0                                                      ;
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; UPDATE PLAYER X LOW LOCATION
	LDA #$FF
@player_moving_right_update:                                      ; PLAYER MOVING RIGHT
	INY                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; UPDATE PLAYER X HIGH LOCATION
	JMP @update_player_animation_addr                             ; JUMP->UPDATE PLAYER ANIMATION POINTER LOCATION

@set_animation_time_and_change_spr:                               ; CHANGE SPRITE FOR ANIMATION
	INY                                                           ; LOAD NEXT PLAYER THROWN ANIMATION BYTE
	LDA (roll_anim_addr_temp),Y                                   ; 
	CMP #$FF                                                      ; IS ANIMATION SEQUENCE DONE?
	BEQ @roll_animation_done                                      ; YES->ROLL ANIMATION DONE
	STA TEMP_PLAYER_SPR_ADDR+1                                    ; SAVE SPRITE INFO ADDRESS IN B2,B3
	INY                                                           ;
	LDA (roll_anim_addr_temp),Y                                   ;
	STA TEMP_PLAYER_SPR_ADDR                                      ;
	STY roll_animation_index                                      ; 
	LDX #PLAYER_SCRIPT_COMMANDS_LOGIC_BANK_2	                       ; LOAD BANK 22 
	JSR SWAP_A000_BANK                                            ; SWAP A000 BANK (X= BANK TO SWAP) 
	JSR UPDATE_CURRENT_PLAYER_SPRITE_TILES                        ; SELECT CORRECT TILE BANK AND UPDATE SPRITE(B2,B3)
	LDX #THROWN_PLAYER_ANI_SCRIPT_BANK                            ; LOAD BANK 14
	JSR SWAP_A000_BANK                                            ; SWAP A000 BANK (X= BANK TO SWAP) 

@update_player_animation_addr:                                    ; UPDATE PLAYER ANIMATION POINTER LOCATION
	LDY #roll_anim_addr_index                                     ;
	LDA roll_animation_index                                      ;
	CLC                                                           ;
	ADC roll_anim_addr_temp                                       ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$00                                                      ;
	ADC roll_anim_addr_temp+1                                     ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDX #PLAYER_SCRIPT_COMMANDS_LOGIC_BANK_2	                       ; SET BANK  = BANK 22
	JSR SWAP_A000_BANK                                            ; SWAP A000 BANK (X= BANK TO SWAP) 
	CLC                                                           ; CLEAR CARRY = ANIMATION NOT DONE
	RTS                                                           ; RETURN

@roll_animation_done:                                             ; PLAYER THROWN ANIMATION DONE
	LDX #PLAYER_SCRIPT_COMMANDS_LOGIC_BANK_2	                       ; SET BANK  = BANK 22 
	JSR SWAP_A000_BANK                                            ; SWAP A000-BFFF BANK (X= BANK TO SWAP IN)              ; 
	SEC                                                           ; SET CARRY = ANIMATION DONE
	RTS                                                           ; RETURN
	
_F}_PLAYER_THROWN_ANIMATION_LOGIC 

_F{_GET_PASS_CONTROL_SKILL										  ; DONE 

GET_PASS_CONTROL_SKILL_VALUE:                                     ; GET PLAYER PASSING CONTROL SKILL VALUE()
	LDY #PASS_CONTROL_INDEX                                       ; LOAD PASS CONTROL SKILL INDEX
	JSR GET_PLAYER_SKILL_OR_FACE                                  ; GET SKILL RATING(A=PLAYER, Y=SKILL TO GET, X=TEAM)
	TAY                                                           ; SAVE PASS CONTROL 
	LDA POSSESSION_STATUS                                         ; NEED TO ADD COM BOOST?
	EOR IN_GAME_COM_COA_SKP_SIDE                                  ;
	BPL @save_pc_value_exit                                        ; NO-> TRANSFER PASS CONTROL VALUE TO A AND EXIT

@add_com_boost_to_pc_value
	TYA                                                           ; LOAD PASS CONTROL  
	CLC                                                           ; PASS CONTROL = PASS CONTROL + COM PASS CONTROL BOOST VALUE
	ADC CPU_PASS_CONTROL_BOOST                                    ; ADD COM PASS CONTROL BOOST
	CMP #(MAX_PLAYER_SKILL_RATING + 1 )                           ; PASS CONTROL > MAX SKILL ? 
	BCC @com_boost_exit                                           ; YES-> EXIT
	LDA #MAX_PLAYER_SKILL_RATING                                  ; SET PASS CONTROL TO MAX SKILL  
@com_boost_exit:                                                  ; EXIT
	RTS                                                           ; RETURN

@save_pc_value_exit:                                               ; TRANSFER PASS CONTROL VALUE TO A AND EXIT
	TYA                                                           ; SAVE PASS CONTROL IN A
	RTS                                                           ; RETURN

PAD $A000, $FF 
	
_F}_GET_PASS_CONTROL_SKILL
	
_F{_PLAYER_LOCATION_VS_THINGS_LIMIT_FUCTIONS                      ; DONE 

temp_player_addr  = LOCAL_1

double_limit     = 2 * FUMBLE_DIVE_CATCH_XY_LIMIT
	
CHECK_PLAYER_CLOSE_ENOUGH_TO_BALL:                                ; IS PLAYER CLOSE ENOUGH TO BALL 
	LDA CURRENT_PLAYER_ADDR                                       ; SAVE PLAYER POINTER IN 3E/EF
	STA temp_player_addr                                          ;
	LDA CURRENT_PLAYER_ADDR +1                                    ;
	STA temp_player_addr +1                                       ;

@check_play_over_ball_oob: 
	JSR CHECK_PLAY_OVER_PLAYER_OOB                                ; CHECK FOR PLAY OVER OR PLAYER OUT OF BOUNDS()
	BCS @player_not_close_enough_to_ball                          ; YES->BALL NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS

@check_ball_loft: 
	LDA BALL_Z+2                                                  ; CHECK 3RD BALL Z BYTE (SHOULD ALWAYS BE ZERO)
	BNE @player_not_close_enough_to_ball                          ; NOT ZERO-> BALL NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS
	LDA BALL_Z+1                                                  ; CHECK 2ND BALL Z BYTE
	CMP #FUMBLE_DIVE_CATCH_Z_LIMIT                                ; BALL LOFT < 3
	BCS @player_not_close_enough_to_ball                          ; NO->BALL NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS

@check_player_withing_y_limit 
	LDY #Y_POS +1                                                 ; CHECK IF PLAYER Y LOC WITHIN +/-1.25 YARDS OF BALL
	LDA (temp_player_addr),Y                                      ; 
	SEC                                                           ;
	SBC #FUMBLE_DIVE_CATCH_XY_LIMIT                               ;  -  1.25 YARDS
	CMP BALL_Y + 1                                                ; (PLAYER Y LOCATION- 1.25 YARDS)> BALL Y LOC
	BCS @player_not_close_enough_to_ball                          ; NO-> BALL NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS  
	ADC #double_limit
	CMP BALL_Y + 1                                                ; (PLAYER Y LOCATION+ 1.25 YARDS) < BALL Y LOC
	BCC @player_not_close_enough_to_ball                          ; YES-> NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS
	
@check_player_withing_x_limit 
	LDY #X_POS +1                                                 ; PLAYER X LOCATION – BALL X LOCATION
	LDA (temp_player_addr),Y                                      ; 
	SEC                                                           ;
	SBC BALL_X + 1                                                ; 
	TAX                                                           ; SAVE LOW BYTE SUBTRACTION IN X
	INY                                                           ;
	LDA (temp_player_addr),Y                                      ; 
	SBC BALL_X + 2                                                ; 
	BMI @check_negative_result                                    ; MINUS= JUMP TO PLAYER BEHIND BALL OR PLAYER 2 SIDE SUBTRACT
	
	BNE @player_not_close_enough_to_ball                          ; PLAYER TOO FAR->BALL NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS 
	TXA                                                           ; 
	CMP #FUMBLE_DIVE_CATCH_XY_LIMIT                               ; -> BRANCH TO BALL NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS
	BCS @player_not_close_enough_to_ball                          ;
	SEC                                                           ;
	RTS                                                           ;
	
@check_negative_result:                                           ; PLAYER BEHIND BALL OR PLAYER 2 SIDE SUBTRACT 
	CMP #$FF
	BNE @player_not_close_enough_to_ball                          ; -> BRANCH TO BALL NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS
	TXA                                                           ;
	CLC                                                           ; 
	ADC #FUMBLE_DIVE_CATCH_XY_LIMIT                               ;
	BCC @player_not_close_enough_to_ball                          ;

@player_close_enough_to_ball:                                     ; 
	SEC                                                           ; 
	RTS                                                           ;
	
@player_not_close_enough_to_ball:                                 ; BALL NOT CLOSE ENOUGH TO PLAYER OR BALL OUT OF BOUNDS
	CLC                                                           ;
	RTS                                                           ;

	
target_player_addr    = LOCAL_1
double_limit       = 2 * BLOCK_DIVE_NEAR_TARGET_Y_DIST_LIMIT
 
	
CHECK_PLAYER_NEAR_BLOCK_DIVE_TACKLE_TARGET:                   ; CHECK PLAYER WITHIN( 1 X, 0.75 Y YDS of target, RET Carry 0=NO, 1=YES

@check_y_location: 
	LDY #Y_POS +1                                                 ; LOAD PLAYER Y LOCATION
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SEC                                                           ; 
	SBC #BLOCK_DIVE_NEAR_TARGET_Y_DIST_LIMIT                      ; PLAYER Y LOCATION– 0.75 yards
	CMP (target_player_addr),Y                                    ; PLAYER > 0.75 YARD BELOW TARGET
	BCS @player_not_close_enough_exit                             ; YES-> BRANCH TO PLAYER NOT CLOSE ENOUGH EXIT
	ADC #double_limit                                             ; 
	CMP (target_player_addr),Y                                    ; CHECK PLAYER WITHIN 0.75 YARD BELOW TARGET
	BCC @exit                                                     ; *** could use clear carry exit NO-> BRANCH TO PLAYER NOT CLOSE ENOUGH EXIT

@check_x_location: 
	LDY #X_POS +1                                                 ; PLAYER X LOCATION - TARGET X LOCATION 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SBC (target_player_addr),Y                                    ;  
	TAX                                                           ; SAVE LOW BYTE SUBTRACTION in X
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SBC (target_player_addr),Y                                    ; 
	BMI @check_negative_result                                    ; 

@check_positive_result: 
	BNE @player_not_close_enough_exit                             ; PLAYER TOO FAR RIGHT? YES-> EXIT
	TXA                                                           ; LOAD mid byte distance
	CMP #BLOCK_DIVE_NEAR_TARGET_X_DIST_LIMIT                      ; CHECK PLAYER WITHIN 1 YARD TO RIGHT OF TARGET
	BCS @player_not_close_enough_exit                              ; NO-> CLEAR carry and return

@player_close_enough: 
	SEC                                                           ; YES->SET carry
	RTS                                                           ; PLAYER IS CLOSE ENOUGH EXIT

@check_negative_result:
	CMP #$FF    
	BNE @player_not_close_enough_exit                              ; PLAYER TOO FAR LEFT? YES-> EXIT
	TXA
	CLC
	ADC #BLOCK_DIVE_NEAR_TARGET_X_DIST_LIMIT                      ; CHECK PLAYER WITHIN 1 YARD TO LEFT OF TARGET
	RTS
	
@player_not_close_enough_exit:                                    ; PLAYER NOT CLOSE ENOUGH CLEAR CARRY EXIT
	CLC                                                           ; 
@exit:                                                            ; PLAYER NOT CLOSE ENOUGH EXIT
	RTS                                                           ; RETURN

	
check_x_loc  = LOCAL_1
player_x_loc = LOCAL_3

check_y_loc  = LOCAL_5
player_y_loc = LOCAL_6
y_limit   = LOCAL_7 
x_limit   = LOCAL_8
	
CHECK_IS_PLAYER_WITHIN_LIMITS_OF_LOC:                             ; PLAYER WITHIN LIIMTS (X= X LIMIT, Y= Y LIMIT, 3E/3F= X TO CHECK VS, $42= Y TO CHECK VS )
	STY y_limit                                                   ; SAVE Y IN Y LIMIT
	LDY #Y_POS + 1                                                ; SAVE PLAYER Y LOCATION IN $43
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA player_y_loc                                              ; 
	LDY #X_POS + 1                                                ; SAVE PLAYER X LOCATION IN $40,$41
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA player_x_loc                                              ; 
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;  
	STA player_x_loc +1                                           ; 
	LDY y_limit                                                   ; LOAD Y LIMIT

																  ; PASS BLOCK AND KICK BLOCK DISTANCE CHECK
PASS_BLOCK_KICK_BLOCK_LIMIT_CHECK:                                                        ; (X= X LIMIT, Y= Y LIMIT, $3E,3F/$42=X/Y PLAYER LOCATION, $40,$41/$43= LOCATION TO CHECK VS )
	
@save_limits: 
	STY y_limit                                                   ; SAVE Y IN Y LIMIT
	STX x_limit                                                   ; SAVE X IN X LIMIT
	
@check_player_vs_y_loc_and_limit:  
	LDA player_y_loc                                              ; PLAYER WITHIN - Y LIMIT of Y LOCATION TO CHECK
	SEC                                                           ;
	SBC y_limit                                                   ; 
	CMP check_y_loc                                               ;  
	BCS @player_not_within_limit                                  ; NO-> EXIT (CARRY = CLEAR = NOT WITHIN LIMIT)
	LDA player_y_loc                                              ; PLAYER WITHIN + Y LIMIT of Y LOCATION TO CHECK
	ADC y_limit                                                   ;
	CMP check_y_loc                                               ;
	BCC @exit                                                     ; *** could use not_within limits NO->PLAYER NOT WITHIN LIMIT
	
@check_player_vs_x_loc_and_limit: 
	LDA player_x_loc                                              ; PLAYER LOCATION - X LOCATION  
	SBC check_x_loc                                               ;
	TAX                                                           ;
	INY                                                           ;
	LDA player_x_loc + 1                                          ;
	SBC check_x_loc+1                                             ;
	BMI @check_negative_result                                    ; 
	BNE @player_not_within_limit                                  ; PLAYER BEHIND LOCATION-> PLAYER NOT WITHIN LIMIT
	TXA                                                           ;
	CMP x_limit                                                   ; IS PLAYER WITHIN X LIMIT? 
	BCS @player_not_within_limit                                  ; NO-> PLAYER NOT WITHIN LIMIT
	SEC                                                           ; SEC= PLAYER WITHIN LIMIT
	RTS                                                           ; RETURN
	
@check_negative_result:                                           ;
	CMP #$FF                                                      ; PLAYER BEHIND LOCATION?
	BNE @player_not_within_limit                                  ; YES-> PLAYER NOT WITHIN LIMIT 
	TXA                                                           ; = LOW BYTE OF X VALUE + X LIMIT DISTANCE
	CLC                                                           ; CARRY = SET IF PLAYER WITHIN DISTANCE
	ADC x_limit                                                   ; 
	RTS                                                           ; RETURN
	
@player_not_within_limit:                                         ; PLAYER NOT WITHIN LIMIT 
	CLC                                                           ; CLC= PLAYER NOT WITHIN LIMIT
@exit:                                                            ; EXIT
	RTS                                                           ; RETURN

CHECK_PLAY_OVER_PLAYER_OOB:                                       ; CHECK FOR PLAY OVER OR PLAYER OUT OF BOUNDS()
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS= PLAY OVER? 
	BMI @play_over_or_oob                                         ; YES-> PLAY OVER OR PLAYER OUT OF BOUNDS
	LDY #Y_POS + 1                                                ; IS PLAYER Y PAST TOP OUT OF BOUNDS LINE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CMP #OUT_OF_BOUNDS_TOP_Y                                      ; 
	BCC @play_over_or_oob                                         ; YES-> BRANCH PLAY OVER OR PLAYER OUT OF BOUNDS
	CMP #OUT_OF_BOUNDS_BOT_Y +1                                   ; PAST BOTTOM OUT OF BOUNDS?
	BCC @not_out_of_bounds                                        ; CLC = NOT OUT OF BOUNDS
	
@play_over_or_oob:                                                ; PLAY OVER OR PLAYER OUT OF BOUNDS
	SEC                                                           ; SEC= PLAY OVER OR PLAY OUT OF BOUNDS

@not_out_of_bounds:                                               ; EXIT
	RTS                                                           ; RETURN

	
SET_DEF_VEL_ZERO_IF_NEAR_TOP_BOT_SCREEN:                          ; SET Y VEL = 0 IF PLAYER AT OUT OF BOUNDS LINE()    
	LDY #Y_POS + 1                                                ; SAVE PLAYER Y LOCATION IN X
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ; 
	LOAD_CUR_PLAYER_DIRECTION                                     ; LOAD PLAYER CURRENT DIRECTION is moving down?
	BMI @check_vs_bottom_of_screen                                ; YES->PLAYER MOVING DOWN
	
@check_vs_top_of_screen:  
	CPX #OUT_OF_BOUNDS_TOP_Y - ONE_YARD                           ; IS PLAYER Y =  TOP OF CROWD
	BCC @set_defender_y_velocity_to_zero                          ; YES->SET Y VELOCITY TO ZERO
	RTS                                                           ; RETURN
	
@check_vs_bottom_of_screen:                                       ; PLAYER MOVING DOWN
	CPX #OUT_OF_BOUNDS_BOT_Y + ONE_YARD                           ; IS PLAYER Y =  BOTTOM OF BOTTOM OOB
	BCS @set_defender_y_velocity_to_zero                          ; YES->SET Y VELOCITY TO ZERO
	RTS                                                           ; RETURN

@set_defender_y_velocity_to_zero:                                 ; SET Y VELOCITY TO ZERO
	LDA #$00                                                      ; SET VELOCITY VALUE = 0
	LDY #Y_VELOCITY                                               ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN

_F}_PLAYER_LOCATION_VS_THINGS_LIMIT_FUCTIONS  

_F{_GET_JOY_RAW_OR_PRESS_FUNCTIONS                                ; DONE
	
GET_PLAYER_JOY_INPUT_RAW:                                         ; GET APPROPRIATE PLAYER JOYPAD RAW()
	LOAD_CUR_PLAYER_POSITION_ID
	BMI GET_P2_JOY_RAW                                            ; IS PLAYER 2? YES->PLAYER 2 JOY RAW

GET_P1_JOY_RAW: 
	LDA JOY_RAW_1                                                 ; LOAD PLAYER 1 RAW JOYPAD
	RTS                                                           ; RETURN

GET_P2_JOY_RAW:                                                   ; PLAYER 2 JOY RAW
	LDA JOY_RAW_2                                                 ; LOAD PLAYER 2 RAW JOYPAD
	RTS                                                           ; RETURN

GET_PLAYER_JOY_PRESS:                                             ; GET P1 OR P2 JOYPAD PRESS()
	LOAD_CUR_PLAYER_POSITION_ID
	BMI GET_P2_JOY_PRESS                                          ; IS PLAYER 2? YES->PLAYER 2 BUTTON PRESS

GET_P1_JOY_PRESS: 
	LDA JOY_PRESS_1                                               ; LOAD PLAYER 1 PRESS
	RTS                                                           ; RETURN  

GET_P2_JOY_PRESS:                                                 ; PLAYER 2 BUTTON PRESS
	LDA JOY_PRESS_2                                               ; LOAD PLAYER 2 PRESS
	RTS                                                           ; RETURN
	

_F}_GET_JOY_RAW_OR_PRESS_FUNCTIONS 

_F{_MAN_INPUT_LOGIC                                               ; DONE

button_dir_bitmask   = $0F
current_dir_ram_index  = EXTRA_PLAYER_RAM_5

UPDATE_MAN_DIRECTION_VELOCITY:                                    ; MAN CONTROL INPUT LOOP
	JSR GET_PLAYER_JOY_INPUT_RAW                                  ; GET APPROPRIATE PLAYER JOYPAD RAW()
	AND #button_dir_bitmask                                       ; IS BUTTON DIRECTION = PLAYER CURRENT DIRECTION? 
	LDY #current_dir_ram_index                                    ;     
	CMP (CURRENT_PLAYER_ADDR),Y                                   ;  
	BEQ MAN_INPUT_EXIT                                            ; YES-> MAN INPUT LOOP EXIT
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SAVE BUTTON INDEX in X
	TAX                                                           ; 
	BEQ @no_direction_pressed                                     ; DIRECTION EQUAL 0-> BRANCH TO NO DIRECTION PRESSED
	
@convert_direction_update_player: 
	LDA DPAD_TO_ANGLE_LOOKUP_TABLE,X                              ; CONVERT BUTTON VALUE TO DIRECTION/ANGLE VALUE
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION() 
	JMP UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW

@no_direction_pressed:                                            ; NO DIRECTION PRESSED
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER BALL CARRIER? 
	AND #PLAYER_BALL_CARRIER_BITFLAG                              ; 
	BEQ @set_man_standing_still                                   ; NO-> SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	
@update_player_direction_default_for_side: 
	LDA POSSESSION_STATUS                                         ; SET PLAYER DIRECTION = DEFAULT DIRECTION TOWARDS ENDZONE 
	EOR #$FF                                                      ;
	ASL                                                           ;
	AND #$80                                                      ;
	SET_CUR_PLAYER_DIRECTION
	
@set_man_standing_still:                                          ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	JMP STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	
MAN_INPUT_EXIT:                                                   ; MAN INPUT LOOP EXIT
	RTS                                                           ; RETURN

_F}_PLAYER_INPUT_FUNCTIONS 

_F{_COPY_PLAYER_POINTER_FUNCTIONS                                 ; DONE

position_id_temp   = LOCAL_2 
opp_position_id_temp  = LOCAL_2
side_bitmask   = $0F
side_bitmask_2   = $7F                                            ; *** not sure why use 7f 
	
GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL:                        ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	AND #side_bitmask                                             ; SAVE OPP POSITION ID IN $3F
	STA opp_position_id_temp                                      ; 
	LOAD_CUR_PLAYER_POSITION_ID
	EOR #$FF                                                      ; 
	AND #$80                                                      ; 
	ORA_ABS_A_ZP position_id_temp                                 ; = OPP P1 OR P2 INFO + OPP POSITION ID *** uses long version of ORA uneeded
	JMP GET_P1_P2_RAM_ADDR                                        ; JUMP-> GET PLAYER POINTER(A= POSITION ID + P1 OR P2 INFO)

GET_TARGET_RAM_ADDR_AND_SAVE_IN_LOCAL:                            ; GET PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	AND #side_bitmask_2                                           ; MASK OUT P1/P2 INFO BIT IN CASE
	STA position_id_temp                                          ; SAVE in $3F
	LOAD_CUR_PLAYER_POSITION_ID
	AND #$80                                                      ; get P1 OR P2 INFO
	ORA_ABS_A_ZP position_id_temp                                 ; = P1 OR P2 INFO + OPOSITION ID *** uses long version of ORA uneeded
	JMP GET_P1_P2_RAM_ADDR                                        ; JUMP-> GET PLAYER POINTER(A= POSITION ID + P1 OR P2 INFO)

_F}_COPY_PLAYER_POINTER_FUNCTIONS 
	
_F{_CHECK_COLLIDED_OR_CLOSE_TO_FUNCTIONS                          ; DONE

player_collision_byte_temp	=  LOCAL_8
	
GET_FOUR_CLOSESET_PLAYERS_IF_NOT_COLLIDED:                        ; CHECK IF COLLIDING WITH PLAYERS()
	JSR CHECK_IF_PLAYER_ON_OFF_OR_DEF                             ; CHECK IF PLAYER IS ON OFFENSE DEFENSE (CC =OFF, CS =DEF)
	BCS CHECK_IF_DEF_COLLIDED                                     ; *** SEEMS IMPOSSIBLE TO TRIGGER. 
	
CHECK_IF_OFFENSE_COLLIDED:                                        ; PLAYER ON OFFENSE
	LOAD_CUR_PLAYER_POSITION_ID
	ASL                                                           ; SHIFT SINCE EACH PLAYER COLLISION MASK IS TWO BYTES
	TAX                                                           ;

CHECK_IF_OFFENSE_CLOSE_TO_COLLISION: 	
	
@check_first_collision_byte:                                      ; FIRST COLLISION BITMASK BYTE CHECK
	LDY #$00                                                      ; LOAD FIRST COLLISION BYTE VALUE
	LDA COLLIDED_STATUS_OFFENSE,X                                 ;
	BEQ @check_second_collision_byte                              ; CAN COLLIDE WITH ANYONE? NO-> CHECK SECOND BYTE


	STA player_collision_byte_temp                                  ; SAVE PLAYER COLLISION SETTINGS 
	LDA #$00                                                       ; SET DEFENDERS CHECKED = ZERO
	
_WHILE CC                                                         ; FIND DEFENDERS CAN COLLIDE BYTE 1 (RE thru RCB)
	ASL player_collision_byte_temp                                 ; CHECK NEXT PLAYER NIBBLE IN BYTE
	BCC @go_to_next_player_check_if_done                          ; CAN COLLIDE? NO->INCREMENT TO NEXT PLAYER
	
	INY                                                           ; 
	STA NUM_PLAYERS_CAN_COLLIDE,Y                                 ; SAVE PLAYER CAN COLLIDE WITH IN $E2-$E5
	CPY #MAX_PLAYERS_CAN_COLLIDE_WITH                             ; FOUND 4 PLAYERS ALREADY? 
	BCS @save_num_players_can_collide                             ; YES->BRANCH TO SAVE NUMBER OF PLAYERS IN $E1, LOAD 1st PLAYER AND EXIT

@go_to_next_player_check_if_done:                                ; INCREMENT TO NEXT PLAYER
	ADC #$01                                                      ; PLAYER COUNTER++
	CMP #NUM_DEFENDERS_ON_FIELD -3                                ; All 8 PLAYERS CHECKED?
	
_END_WHILE

@check_second_collision_byte:                                     ; SECOND COLLISION BITMASK BYTE CHECK   
	LDA COLLIDED_STATUS_OFFENSE+1,X                               ; LOAD SECOND COLLISION BYTE VALUE
	BEQ @save_num_players_can_collide                             ; CAN COLLIDE WITH ANYONE? NO->SAVE NUM OF PLAYERS IN $E1, LOAD 1st PLAYER AND EXIT
	STA player_collision_byte_temp                                ; SAVE in $45
	LDA #NUM_DEFENDERS_ON_FIELD -3                                ; SET DEFENDERS CHECKED = EIGHT

_WHILE CC                                                        ; FIND DEFENDERS CAN COLLIDE BYTE 2 (LCB thru SS)
	ASL player_collision_byte_temp                               ; CHECK NEXT PLAYER PLAYER NIBBL IN BYTE
	BCC @go_to_next_player_check_if_done_byte_two                ; CAN COLLIDE? NO-> INCREMENT TO NEXT PLAYER BYTE 2


	INY                                                           ;
	STA NUM_PLAYERS_CAN_COLLIDE,Y                                 ; SAVE PLAYER CAN COLLIDE WITH IN $E2-$E5
	CPY #MAX_PLAYERS_CAN_COLLIDE_WITH                             ; FOUND 4 PLAYERS ALREADY? 
	BCS @save_num_players_can_collide                             ; YES-> SAVE NUM OF PLAYERS IN $E1, LOAD 1st PLAYER AND EXIT 

@go_to_next_player_check_if_done_byte_two:                        ; INCREMENT TO NEXT PLAYER BYTE 2
	ADC #$01                                                      ; PLAYER COUNTER++
	CMP #NUM_DEFENDERS_ON_FIELD                                   ; All 11 PLAYERS CHECKED?
	
_END_WHILE                                                      ; NO-> FIND DEFENDERS CAN COLLIDE BYTE 2 (LCB thru SS)

@save_num_players_can_collide:                                   ; SAVE NUMBER OF PLAYERS IN $E1, LOAD FIRST PLAYER IN $E2 AND EXIT
	STY NUM_PLAYERS_CAN_COLLIDE                                    ; SAVE NUM PLAYERS CAN COLLIDE $E1
	CPY #$01                                                      ; NUM PLAYERS CAN COLLIDE >=1 YES->CARRY SET
	LDA PLAYERS_CAN_COLLIDE_WITH[]                                 ; LOAD FIRST PLAYER
	RTS                                                           ; RETURN

current_position_checked	= LOCAL_6	
player_collision_bitmask	= LOCAL_7	
	
CHECK_IF_DEF_COLLIDED:                                           ;  CHECK IF DEFENDER COLLIDED ITH OFFENIVE PLAYERS () 
	LDX #$00                                                      ; SET OFFSET   =  COLLISION STATUS OFFSET 

CHECK_IF_DEFENSE_CLOSE_TO_COLLISION:                              ; CHECK IF DEFENDER IS CLOSE TO COLLIDING WITH OFFENIVE PLAYERS()
	LOAD_CUR_PLAYER_POSITION_ID 
	ASL                                                           ; SHIFT SINCE INDEX IS TWO BYTES PER
	TAY                                                           ; 
	LDA DEFENDER_BITMASK_TABLE,Y                                  ; LOAD COLLIDE BIT MASK  FROM COLLISION BITMASK TABLE AND SAVE IN $44,$45
	STA player_collision_bitmask                                  ; 
	LDA DEFENDER_BITMASK_TABLE +1 ,Y                              ; 
	STA player_collision_bitmask+1                                ; 
	LDY #$00                                                      ; SET PLAYERS CHECKED = ZERO
	STY current_position_checked                                  ; 

_WHILE CC                                                       ; IS DEFENDER COLLIDED WITH OFFENSIVE PLAYER LOOP

	LDA COLLIDED_STATUS_OFFENSE,X                                 ; IS DEFENDER COLLIDED WITH OFFENSIVE PLAYER BYTE1(QB,RG,LG)
	AND player_collision_bitmask                                  ; 
	BEQ @check_second_status_byte                                 ; NO->CHECK 2ND BYTE OF BITMASK 

@save_player_can_collide_with
	INY                                                           ;
	LDA current_position_checked                                  ;
	STA PLAYERS_CAN_COLLIDE_WITH[]-1,Y                            ; YES-> SAVE PLAYER CAN COLLIDE WITH   
	CPY #MAX_PLAYERS_CAN_COLLIDE_WITH                             ; IS NUMBER OF PLAYERS CAN COLLIDE >= FOUR
	BCS @exit_coll_check                                           ; YES->SAVE NUMBER OF PLAYERS CAN COLLIDE AND LOAD PLAYER IN E2, EXIT

@check_second_status_byte:                                       ; CHECK 2ND BYTE OF BITMASK
	LDA COLLIDED_STATUS_OFFENSE+1,X                               ; CAN DEFENDER COLLIDE WITH OFFENSIVE PLAYER (LT,RT)
	AND player_collision_bitmask+1                                ; 
	BEQ @set_index_to_next_player                                 ; NO->CHECK NEXT OFFENSIVE PLAYER

@save_player_can_collide_with_two
	INY                                                           ; PLAYERS TO COLLIDE WITH INDEX++
	LDA current_position_checked                                  ; SAVE POSITION ID IN COLLISION ARRAY
	STA PLAYERS_CAN_COLLIDE_WITH[]-1,Y                            ;
	CPY #MAX_PLAYERS_CAN_COLLIDE_WITH                             ; IS NUMBER OF PLAYERS CAN COLLIDE >= FOUR
	BCS @exit_coll_check                                          ; YES->SAVE NUMBER OF PLAYERS CAN COLLIDE AND LOAD PLAYER IN E2, EXIT

@set_index_to_next_player:                                       ; CHECK NEXT OFFENSIVE PLAYER 
	INX                                                           ; COLLISION INDEX += OFFSET TO NEXT OFFENSIVE PLAYER 
	INX                                                           ;
	INC current_position_checked                                  ; PLAYERS CHECKED COUNTER ++  
	LDA current_position_checked                                  ; PLAYERS CHECKED COUNTER< 11 = ALL PLAYERS NOT CHECKED  
	CMP #NUM_DEFENDERS_ON_FIELD                                    ; 

_END_WHILE                                                       ; YES-> CAN DEFENDER COLLIDE WITH OFFENSIVE PLAYER LOOP

@exit_coll_check:                                                ; SAVE NUMBER OF PLAYERS CAN COLLIDE AND LOAD PLAYER IN E2, EXIT
	STY NUM_PLAYERS_CAN_COLLIDE                                   ; SAVE NUMBER OF PLAYERS CAN COLLIDE( MAX= 4)
	CPY #$01                                                      ; NUMBER OF PLAYER > 1 
	LDA PLAYERS_CAN_COLLIDE_WITH[]                                ; LOAD FIRST PLAYER THAT CAN BE COLLIDED WITH
	RTS                                                           ; RETURN

CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION:                             ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	JSR CHECK_IF_PLAYER_ON_OFF_OR_DEF                            ; CHECK IF PLAYER IS ON OFFENSE DEFENSE (CC =OFF, CS =DEF)
	BCS @player_on_defense                                        ; PLAYER ON DEFENSE? YES->SET OFFSET = CLOSE TO COLLISION, DO DEFENDER CLOSE TO COLL CHECK

@player_on_offense	
	LOAD_CUR_PLAYER_POSITION_ID
	ASL                                                           ;
	CLC                                                           ;
	ADC #OFFSET_TO_CLOSE_COLL_STATUS                              ; + OFFSET TO CLOSE TO COLLISION 
	TAX                                                           ;
	JMP CHECK_IF_OFFENSE_CLOSE_TO_COLLISION                        ; JUMP->FIRST COLLISION BITMASK BYTE CHECK

@player_on_defense:                                              ; SET OFFSET = CLOSE TO COLLISION, DO DEFENDER CLOSE TO COLL CHECK
	LDX #OFFSET_TO_CLOSE_COLL_STATUS                              ; SET OFFSET   =  CLOSE TO COLLISION STATUS OFFSET 
	JMP CHECK_IF_DEFENSE_CLOSE_TO_COLLISION                        ; JUMP->CHECK IF DEFENDER IS CLOSE TO COLLIDING WITH OFFENIVE PLAYERS()

_F}_CHECK_COLLIDED_OR_CLOSE_TO_FUNCTIONS 

_F{_UPDATE_CAN_COLLIDE_CAN_BLOCK                                  ; NOT DONE

players_left_to_check      = LOCAL_3
defender_bitmask           = LOCAL_5
status_bitmask             = LOCAL_7

SET_CAN_COLLIDE_USING_PLAYERS_BITMASK:                           ; UPDATE CAN COLLIDE BITMASKS (X,Y= OFF OR DEF BITMASK)
	STY status_bitmask                                            ; SAVE DEFENDERS BITMASK  = CURRENT BITMASK
	STX status_bitmask+1                                          ; 
	JSR CHECK_IF_PLAYER_ON_OFF_OR_DEF                             ; CHECK IF PLAYER IS OFFENSE OR DEFENSE()
	BCS SET_DEFENDER_CAN_COLLIDE_USING_PLAYERS_BITMASK            ; PLAYERS IS DEFENSE? YES->SET DEFENDER CAN COLLIDE ($45,$44 = OFF PLAYER BITMASK)

@get_offensive_player_position:
	LOAD_CUR_PLAYER_POSITION_ID 
	ASL                                                           ; 
	TAX                                                           ; 

                                                                  ; LABELED THIS WAY SINCE ONLY FUNCTION THAT JUMPS TO IT SETS x TO BLOCK OFFSET. 
SET_CAN_BLOCK_USING_PLAYERS_BITMASK:                              ; UPDATE OFFENSE CAN COLLIDE OR CAN BLOCK (X=OFFSET TO CAN COLLIDE OR CAN BLOCK)
	LDA status_bitmask+1                                          ; SET OFFENSIVE PLAYER  CAN COLLIDE STATUS OR CAN BLOCK STATUS = DEFENDER BITMASK
	STA CAN_COLLIDE_STATUS_OFFENSE,X                              ;  
	LDA status_bitmask                                            ;
	STA CAN_COLLIDE_STATUS_OFFENSE+1,X                            ; 
	RTS                                                           ; RETURN 

SET_DEFENDER_CAN_COLLIDE_USING_PLAYERS_BITMASK:                 ; CHECK IF DEFENDER CAN COLLIDE($45,$44 = OFF PLAYER BITMASK)
	LDX #$00                                                      ; SET INDEX = CAN COLLIDE STATUS

SET_DEFENDER_CAN_BLOCK_USING_PLAYERS_BITMASK:                    ; LABELED THIS WAY SINCE ONLY FUNCTION THAT JUMPS TO IT SETS x REGISTER TO BLOCK OFFSET. 
	LOAD_CUR_PLAYER_POSITION_ID 
	ASL                                                           ; 
	TAY                                                           ; 
	LDA DEFENDER_BITMASK_TABLE,Y                                  ; SET DEFENDER BITMASK FROM DEFENDER BITMASK TABLE
	EOR #$FF                                                      ; 
	STA defender_bitmask +1                                       ; 
	LDA DEFENDER_BITMASK_TABLE +1 ,Y                              ;  
	EOR #$FF                                                      ; 
	STA defender_bitmask                                          ; 
	LDA #NUM_OFFENSIVE_PLAYERS_ON_FIELD                           ; SET # OF OFF PLAYERS TO SET = 11 
	STA players_left_to_check                                     ; 

_WHILE NOT_EQUAL                                                  ; CHECK ALL PLAYERS LOOP
	ASL status_bitmask                                             ; DOES CURRENT BITMASK BIT = DEFENDER CAN COLLIDE WITH CURRENT OFFENSIVE PLAYER
	ROL status_bitmask+1                                           ;   
	BCC @go_to_next_player_check_done                             ; NO-> SET TO NEXT PLAYER, EXIT IF DONE

@save_status:
	LDA CAN_COLLIDE_STATUS_OFFENSE,X                              ; SET OFF PLAYER CAN COLLIDE WITH DEFENDER STATUS = TRUE
	AND defender_bitmask +1                                                       ; = CURRENT OFF PLAYER CAN COLLIDE STATUS & DEFENDER BITMASK
	ORA DEFENDER_BITMASK_TABLE,Y                                  ; 
	STA CAN_COLLIDE_STATUS_OFFENSE,X                              ; 
	LDA CAN_COLLIDE_STATUS_OFFENSE+1,X                            ; 
	AND defender_bitmask                                                       ; 
	ORA DEFENDER_BITMASK_TABLE +1 ,Y                              ;
	STA CAN_COLLIDE_STATUS_OFFENSE+1,X                             ; 

@go_to_next_player_check_done:                                   ; SET TO NEXT PLAYER, EXIT IF DONE
	INX                                                           ; CURRENT OFFENSIVE PLAYER += OFFSET TO NEXT PLAYER
	INX                                                           ; 
	DEC players_left_to_check                                     ; NUMBER OF OFFENSIVE PLAYERS TO SET--

_END_WHILE                                                		 ; DONE? NO-> CHECK ALL PLAYERS LOOP
	
   RTS                                                           ; RETURN

SET_CAN_BLOCK_STATUSES:                                           ; UPDATE PLAYERS TO BLOCK(X,Y= BITMASK OF PLAYERS TO BLOCK) 
	STY status_bitmask                                            ; SAVE DEFENDERS BITMASK  IN $44,45
	STX status_bitmask+1                                          ;
	JSR CHECK_IF_PLAYER_ON_OFF_OR_DEF                             ; CHECK IF PLAYER IS ON OFFENSE DEFENSE (CC =OFF, CS =DEF)
	BCS @set_can_be_blocked_defender                              ; PLAYER ON DEFENSE? YES->SET CAN BLOCK DEFENDER STATUS
	LOAD_CUR_PLAYER_POSITION_ID
	ASL                                                           ;
	CLC                                                           ;
	ADC #OFFSET_TO_CAN_BLOCK_STATUS                               ;
	TAX                                                           ;
	JMP SET_CAN_BLOCK_USING_PLAYERS_BITMASK                       ; JUMP->UPDATE OFFENSE CAN COLLIDE OR CAN BLOCK (X=OFFSET TO CAN COLLIDE OR CAN BLOCK)

@set_can_be_blocked_defender:                                     ; SET CAN BLOCK DEFENDER STATUS      
	LDX #OFFSET_TO_CAN_BLOCK_STATUS                               ; SET COLLISION OFFSET =  CAN BLOCK STATUS
	JMP SET_DEFENDER_CAN_BLOCK_USING_PLAYERS_BITMASK              ; JUMP->CHECK IF DEFENDER CAN BLOCK (X= COLL OFFSET)

SET_PLAYER_ABLE_TO_COLLIDE_SINGLE_DEFENDER:                       ; UPDATE CAN COLLIDE STATUS ROUTINE(A= DEFENDER TO BLOCK)
	ASL                                                           ; SHIFT PLAYER ID SINCE EACH TABLE ENTRY IS TWO BYTES LONG
	TAX                                                           ; 
	LDA DEFENDER_BITMASK_TABLE,X                                 ; GET 1ST BITMASK BYTE FROM PLAYER BITMASK TABLE
	STA status_bitmask+1                                         ; 
	LDA DEFENDER_BITMASK_TABLE+1,X                               ; GET 2ND BITMASK BYTE FROM PLAYER BITMASK TABLE
	STA status_bitmask                                            ; 
	JSR CHECK_IF_PLAYER_ON_OFF_OR_DEF                             ; CHECK IF PLAYER IS ON OFFENSE DEFENSE (CC =OFF, CS =DEF)
	BCS UPDATE_DEFENDER_CAN_COLLIDE                                                 ; PLAYER ON DEFENSE? YES-> PLAYER ON DEFENSE
	LOAD_CUR_PLAYER_POSITION_ID 
	ASL                                                           ; SHIFT LEFT SINCE EACH ENTRY IS TWO BYTES LONG 
	TAX                                                           ;

ADD_CAN_BLOCK_USING_PLAYERS_BITMASK:                              ; SAVE PLAYER CAN COLLIDE/CAN BLOCK BITMASK(X= OFFSET TO PLAYER + COLLIDE/BLOCK)
	LDA COLL_RAM_START,X                                          ;
	ORA status_bitmask+1                                          ;
	STA COLL_RAM_START,X                                          ;
	LDA COLL_RAM_START+1,X                                        ;
	ORA status_bitmask                                            ;
	STA COLL_RAM_START+1,X                                        ;
	RTS                                                           ; RETURN

UPDATE_DEFENDER_CAN_COLLIDE:                                                        ; UPDATE CAN COLLIDE STATUS OF OFFENSIVE PLAYER FOR DEFENDER
	LDX #$00                                                      ; SET INDEX OFFSET = CAN COLLIDE STATUS

UPDATE_DEFENDER_CAN_BE_BLOCKED:                                   ; UPDATE CAN BLOCK/COLLIDE STATUS PLAYER IS ON DEFENSE (X= OFFSET TO COLL/BLOCK)

offensive_players_left_update	= LOCAL_6

	LOAD_CUR_PLAYER_POSITION_ID
	ASL                                                           ; SHIFT LEFT SINCE EACH ENTRY IS TWO BYTES LONG
	TAY                                                           ; SAVE INDEX
	LDA #NUM_OFFENSIVE_PLAYERS_ON_FIELD                           ; SET NUMBER OF PLAYERS TO CHECK = 11 
	STA offensive_players_left_update                                                       ; 

_WHILE NOT_EQUAL                                                  ; UPDATE OFFENSIVE PLAYERS COLLISION OR BLOCK STATUS LOOP
	ASL status_bitmask                                            ; CAN CURRENT OFFENSIVE PLAYER COLLIDE WITH DEFENDER?
	ROL status_bitmask+1                                          ;
	BCC @go_to_next_player                                        ; NO->GO TO NEXT OFFENSIVE PLAYER AND CHECK
	
	LDA CAN_COLLIDE_STATUS_OFFENSE,X                              ; CURRENT OFFENSIVE PLAYER COLLISION OR BLOCK STATUS ORED WITH DEFENDER BITMASK 
	ORA DEFENDER_BITMASK_TABLE,Y                                  ; 
	STA CAN_COLLIDE_STATUS_OFFENSE,X                              ;
	LDA CAN_COLLIDE_STATUS_OFFENSE+1,X                            ;
	ORA DEFENDER_BITMASK_TABLE+1,Y                                ;
	STA CAN_COLLIDE_STATUS_OFFENSE+1,X                           ;

@go_to_next_player:                                               ; GO TO NEXT OFFENSIVE PLAYER AND CHECK
	INX                                                           ; OFF PLAYER COLLISION INDEX++
	INX                                                           ;
	DEC offensive_players_left_update                             ; NUMBER OF PLAYERS TO CHECK--

_END_WHILE                                                		  ; DONE? NO->UPDATE OFFENSIVE PLAYERS COLLISION STATUS LOOP

	RTS                                                           ; RETURN

SET_OFF_CAN_CHOP_BLOCK_STATUS:                                    ; UPDATE CAN BLOCK STATUS ROUTINE(A= PLAYER TO CHOP BLOCK)
	ASL                                                           ; SHIFT PLAYER ID SINCE EACH TABLE ENTRY IS TWO BYTES LONG
	TAX                                                           ;
	LDA DEFENDER_BITMASK_TABLE,X                                  ; GET 1ST BITMASK BYTE FROM PLAYER BITMASK TABLE
	STA status_bitmask+1                                          ;
	LDA DEFENDER_BITMASK_TABLE+1,X                                ; GET 2ND BITMASK BYTE FROM PLAYER BITMASK TABLE
	STA status_bitmask                                            ;
	JSR CHECK_IF_PLAYER_ON_OFF_OR_DEF                             ; CHECK IF PLAYER IS ON OFFENSE DEFENSE (CC =OFF, CS =DEF)
	BCS @chop_blocker_on_def                                      ; PLAYER ON DEFENSE? YES->UPDATE CAN BLOCK STATUS PLAYER IS ON DEFENSE
	LOAD_CUR_PLAYER_POSITION_ID
	ASL                                                           ;
	CLC                                                           ;
	ADC #OFFSET_TO_CAN_BLOCK_STATUS                               ; + OFFSET TO CAN BLOCK STATUS
	TAX                                                           ; SAVE CAN BLOCK INDEX
	JMP ADD_CAN_BLOCK_USING_PLAYERS_BITMASK                                                 ; JUMP->SAVE PLAYER CAN COLLIDE/CAN BLOCK BITMASK(X= OFFSET TO PLAYER + COLLIDE/BLOCK)

@chop_blocker_on_def:                                             ; UPDATE CAN CHOP BLOCK STATUS PLAYER IS ON DEFENSE should be hard to reach
	LDX #OFFSET_TO_CAN_BLOCK_STATUS                               ; + OFFSET TO CAN BLOCK STATUS 
	JMP UPDATE_DEFENDER_CAN_BE_BLOCKED                                                 ; JUMP->UPDATE CAN BLOCK/COLLIDE STATUS PLAYER IS ON DEFENSE (X= OFFSET TO COLL/BLOCK)

CHECK_IF_PLAYER_ON_OFF_OR_DEF:                                    ; CHECK IF PLAYER IS ON OFFENSE DEFENSE (CC =OFF, CS =DEF)
	LOAD_CUR_PLAYER_POSITION_ID                                   ;
	EOR POSSESSION_STATUS                                         ; 
	ASL                                                           ;
	RTS                                                           ; RETURN

_F}_UPDATE_CAN_COLLIDE_CAN_BLOCK

_F{_GET_TEAM_CONTROL_TYPE									       ; DONE

GET_TEAM_CONTROL_TYPE:                                            ; GET PLAYER 1 OR PLAYER 2 PLAYER TYPE (MAN,COA,COM) 
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @get_player_2_team_control_type                           ; YES->GET PLAYER 2 TYPE (MAN, COA,COM,SKP) 

@get_player_1_team_control_type:
	LDA TEAM_CONTROL_TYPES                                        ; 
	AND #$F0                                                      ; MASK OUT P2 PLAYER TYPE
	RTS                                                           ; RETURN

@get_player_2_team_control_type:                                   ; GET PLAYER 2 TYPE (MAN, COA,COM,SKP)  
	LDA TEAM_CONTROL_TYPES                                        ;
	AND #$0F                                                      ; MASK OUT P1 PLAYER TYPE
	RTS                                                           ; RETURN

_F}_GET_TEAM_CONTROL_TYPE
	
_F{_DEFENDER_COVERAGE_LOGIC 									 ; DONE

coverage_delay				= $08									; used after speed changes

target_addr     			= LOCAL_1
target_x_loc    			= LOCAL_1

target_y_loc				= LOCAL_5	

speed_div_16				= LOCAL_8
defender_direction_temp  	= LOCAL_8

x_dist_to_move			= LOCAL_5
y_dist_to_move			= LOCAL_7

coverage_info   = EXTRA_PLAYER_RAM_1
time_to_cover	 = EXTRA_PLAYER_RAM_3
	
DEFNDER_MAN_TO_MAN_PASS_COVERAGE_START:                           ; DEFENDER COVER LOGIC START
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR @update_coverage_time_left_check_if_done                  ; MAN VS MAN CHECK IF COVERAGE DONE()
	JSR LOAD_PLAYER_TO_COVER_ADDR                                ; LOAD PLAYER TO COVER AND SAVE PLAYER POINTER IN 3E/3F()
	LDY #$01                                                      ; LOAD PLAYER TO COVER MOVEMENT VALUE
	LDA (target_addr),Y                                           ; 
	BMI @cover_moving_target                                      ; MOVING? YES->COVER MOVING TARGET
	JMP @cover_stationary_target                                  ; NO->COVER STATIONARY TARGET

@cover_moving_target:                                             ; COVER MOVING TARGET
	LDY #CURRENT_DIRECTION                                        ; LOAD TARGET CURRENT DIRECTION
	LDA (target_addr),Y                                           ; 
	EOR #$80                                                      ; INVERT DIRECTION
	JSR GET_DISTANCE_TO_GO_PAST_TARGET                            ; GET DISTANCE TO GO PAST TARGET (A= DIRECTION)
	JSR GET_NEW_DIRECTION_BASED_ON_DISTANCE                       ; GET A NEW DIRECTION BASED ON PLAYER X,Y DISTANCE TO MOVE( X= 42,43, Y=44,45)
	BCS @resume_coverage_after_8_to_11_delay                                                 ; SHOULD BE IMPOSSIBLE TO TRIGGER. HERE FOR GLITCHES? 
	STA defender_direction_temp                                   ; SAVE DEFENDER NEW DIRECTION IN $45
	JSR LOAD_PLAYER_TO_COVER_ADDR                                ; LOAD PLAYER TO COVER AND SAVE PLAYER POINTER IN 3E/3F
	LDY #CURRENT_DIRECTION                                        ; LOAD TARGET CURRENT DIRECTION
	LDA (target_addr),Y                                           ; 
	SEC                                                           ;
	SBC defender_direction_temp                                   ; TARGET DIRECTION – (DEFENDER NEW DIRECTION)  
	CLC                                                           ;
	ADC #$A0                                                      ;
	
	CMP #$40                                                      ; IS DIRECTION CHANGE > 135 DEGREES
	BCC @stop_player_and_wait_5_frames_to_resume                 ; YES-> 5 FRAME DELAY THEN RETURN TO COVER MAN LOGIC START
	

	
@update_defender_direction_and_sprite: 
	LDA defender_direction_temp                                   ; LOAD DEFENDER NEW DIRECTION
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW
	
	JSR LOAD_PLAYER_TO_COVER_ADDR                                ; LOAD PLAYER TO COVER AND SAVE PLAYER POINTER IN 3E/3F()
	LDY #Y_POS + 1                                                ; SET Y LOC TO CHECK VS ($42) = TARGET Y 
	LDA (target_addr),Y                                           ; 
	STA target_y_loc                                              ; 
	LDY #X_POS + 1                                                ; SET X LOC TO CHECK VS ($3E,$3F) = TARGET X
	LDA (target_addr),Y                                           ; 
	TAX                                                           ;
	INY                                                           ;
	LDA (target_addr),Y                                           ;
	STA target_x_loc +1                                           ;
	STX target_x_loc                                              ;
	LDY #coverage_info                                            ; CHECK COVERAGE TYPE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BMI @looser_coverage_limits                                   ; LOOSER COVERAGE? YES->1x COMMAND COVERAGE LIMITS
	
																  ; 0x COMMAND COVERAGE LIMITS
@tighter_coverage_limits:                 
	LDX #TIGHT_COVERAGE_LIMIT_X                                   ; LOAD X LIMIT (1.25 YARDS)
	LDY #TIGHT_COVERAGE_LIMIT_Y                                   ; LOAD Y LIMIT (1.25 YARDS)
	JMP @slow_down_defender_if_within_limits
	
@looser_coverage_limits:                                          ; 1x COMMAND COVERAGE LIMITS
	LDX #LOOSE_COVERAGE_LIMIT_X                                   ; LOAD X LIMIT (2 YARDS)
	LDY #LOOSE_COVERAGE_LIMIT_Y                                    ; LOAD Y LIMIT (2 YARDS)

@slow_down_defender_if_within_limits:                             ; SLOW DOWN DEFENDER IF THEY ARE WITHIN COVERAGE LIMITS (X,Y = LIMITS)
	JSR CHECK_IS_PLAYER_WITHIN_LIMITS_OF_LOC                      ; CHECK IF PLAYER WITHIN LIIMTS(X= X LIMIT, Y= Y LIMIT, 3E/3F= X TO CHECK VS, $42= Y TO CHECK VS )
	LOAD_CUR_PLAYER_SPEED                                         ; 
	BCC @update_defender_velocity                                 ; PLAYER WITHIN LIMITS? NO->UPDATE VELOCITY
	
@slow_player_down
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; = CURRENT SPEED - CURRENT SPEED/16
	DIVIDE_16
	STA speed_div_16                                              ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SEC                                                           ;
	SBC speed_div_16                                              ; 

@update_defender_velocity:                                        ; UPDATE VELOCITY
	JSR INIT_PLAYER_VELOCITY_NEW_SPEED[speed]                     ; SET X/Y VELOCITY BASED ON GIVEN SPEED & PLAYER DIRECTION (A=SPEED)
	
@resume_coverage_after_8_to_11_delay:                             ; 8-11 FRAME DELAY THEN COVER MAN LOGIC START
	LDA #coverage_delay                                           ; LOAD 8 FRAMES (CHANGE DIRECTION/CHANGE VELOCITY DELAY)
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	JMP DEFNDER_MAN_TO_MAN_PASS_COVERAGE_START                    ; JUMP-> DEFENDER COVER MAN LOGIC START
	
@stop_player_and_wait_5_frames_to_resume:                         ; 5 FRAME DELAY THEN RETURN TO COVER MAN LOGIC START
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 5
	JMP DEFNDER_MAN_TO_MAN_PASS_COVERAGE_START                    ; JUMP -> DEFENDER COVER  LOGIC START

@cover_stationary_target:                                         ; COVER STATIONARY TARGET
	JSR GET_PLAYER_DIRECTION_TOWARDS_BALL                         ; UPDATE PLAYER DIRECTION BASED ON LOCATION VS CURRENT BALL LOCATION()
	BCS @set_defender_not_moving_turn_towards_ball                                                 ; DEFENDER WITHIN LIMIT? YES-> SET DEFENDER TO NOT MOVING
	SET_CUR_PLAYER_DIRECTION                                      ;
	RETURN_PLAYER_ACTIONS_IN_1_FRAME                              ;
	JSR LOAD_PLAYER_TO_COVER_ADDR                                ; LOAD PLAYER TO COVER AND SAVE PLAYER POINTER IN 3E/3F()
	LDY #CURRENT_DIRECTION                                        ; LOAD PLAYER DIRECTION
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR GET_DISTANCE_TO_GO_PAST_TARGET                            ; GET MAX DISTANCE TO GO PAST TARGET (A= DIRECTION)
	LDY y_dist_to_move                                            ; LOAD Y DIST
	LDX x_dist_to_move                                            ; LOAD X DIST
	JSR SAVE_FINAL_X_OR_Y_LOC_PLAYER_RAM[x_y]                     ; PUT FINAL LOCATION IN PLAYER RAM 1E 1F BASED ON LARGEST CHANGE (X,Y)
	JSR GET_NEW_DIRECTION_BASED_ON_DISTANCE                       ; GET A NEW DIRECTION BASED ON PLAYER X,Y DISTANCE TO MOVE( X= 42,43, Y=44,45)
	BCS @set_defender_not_moving_turn_towards_ball                                                 ; 
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

@target_reached_final_location_loop:	

_WHILE CC                                                       ; HAS DEFENDER REACHED TARGET LOCATION? LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR LOAD_PLAYER_TO_COVER_ADDR                                ; LOAD PLAYER TO COVER AND SAVE PLAYER POINTER IN 3E/3F()
	LDY #$01                                                      ; DOES TARGET MOVEMENT = MOVING?
	LDA (target_addr),Y                                           ; 
	BPL @target_not_moving


	JMP DEFNDER_MAN_TO_MAN_PASS_COVERAGE_START                    ; YES-> DEFENDER COVER MAN LOGIC START

@target_not_moving:                                               ; TARGET NOT MOVING
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER AT/JUST PAST FINAL LOCATION, OR AT BACK OF ENDZONE()
	
_END_WHILE

@set_defender_not_moving_turn_towards_ball:                       ; SET DEFENDER TO NOT MOVING AND SAME DIRECTION AS TARGET
	LDY #CURRENT_DIRECTION                                        ; SAVE TARGET DIRECTION INTO DEFENDER DIRECTION 
	LDA (target_addr),Y                                           ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()

_WHILE PLUS:                                                       ; CHECK FOR TARGET MOVING
	
@check_for_target_moving_again	
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR @update_coverage_time_left_check_if_done                  ; MAN VS MAN CHECK IF COVERAGE DONE()
	JSR LOAD_PLAYER_TO_COVER_ADDR                                ; LOAD PLAYER TO COVER AND SAVE PLAYER POINTER IN 3E/3F()
	LDY #$01                                                      ; DOES TARGET MOVEMENT = MOVING?
	LDA (target_addr),Y                                           ; 

_END_WHILE

	JMP DEFNDER_MAN_TO_MAN_PASS_COVERAGE_START                    ; YES-> DEFENDER COVER MAN LOGIC START

@update_coverage_time_left_check_if_done:                         ; MAN VS MAN CHECK IF COVERAGE DONE
	LDY #time_to_cover                                            ; LOAD TIME LEFT TO COVER
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BEQ @continue_coverage                                        ; Time = 0 = jump to CONTINUE COVERAGE
	SEC                                                           ; TIME LEFT TO COVER-- 
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BEQ @coverage_done                                            ; DONE? YES->COVERAGE DONE GO BACK TO COMMAND PROCESSING
	
@continue_coverage:                                               ; CONTINUE COVERAGE
	RTS                                                           ; RETURN

@coverage_done:                                                   ; COVERAGE DONE GO BACK TO PLAY CODE PROCESSING
	PLA                                                           ; REMOVE RETURN ADDRESS
	PLA                                                           ;
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; JUMP ->DO NEXT PROCESS NEXT PLAY CODE COMMAND FOR PLAYER

LOAD_PLAYER_TO_COVER_ADDR:                                        ; LOAD PLAYER TO COVER AND SAVE PLAYER POINTER IN 3E/3F
	LDY #coverage_info                                            ; LOAD PLAYER TO COVER 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JMP GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)   

	
x_distance_adjust		= LOCAL_4


GET_DISTANCE_TO_GO_PAST_TARGET:                                   ; GET DISTANCE TO GO PAST TARGET (A= DIRECTION)
	CLC                                                           ; MAKE DIRECTION ONE OF 16 POSSIBLE DIRECTIONS FOR INDEX INTO TABLE 
	ADC #$08                                                      ; 
	AND #$F0                                                      ; 
	LSR                                                           ; 
	LSR                                                           ;
	LSR                                                           ;
	TAX                                                           ; SAVE DIRECTION INDEX in X
	LDY #coverage_info                                            ; DOES COVERAGE TYPE = 2ND COVERAGE TYPE 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BMI @looser_coverage                                          ; YES->SET 2ND CONVERAGE TPYE FINAL DISTANCE ADJUST VALUES
	
@tighter_coverage:	
	LDA TIGHTER_COVERAGE_FINAL_LOC_ADJ_TABLE +1,X                 ; LOAD X AMOUNT TO GO PAST TARGET FROM COVERAGE TABLE 1
	STA x_distance_adjust                                         ;
	LDA TIGHTER_COVERAGE_FINAL_LOC_ADJ_TABLE ,X                   ; LOAD Y AMOUNT TO GO PAST TARGET FROM COVERAGE TABLE 1
	JMP @set_y_distance                              			  ; JUMP-> SET FINAL DISTANCE AMOUNTS

@looser_coverage:                                                 ; SET 2ND CONVERAGE TPYE FINAL DISTANCE ADJUST VALUES
	LDA LOOSER_COVERAGE_FINAL_LOC_ADJ_TABLE +1,X                  ; LOAD X AMOUNT TO GO PAST TARGET FROM COVERAGE TABLE 1
	STA x_distance_adjust                                    	  ;
	LDA LOOSER_COVERAGE_FINAL_LOC_ADJ_TABLE ,X                    ; LOAD Y AMOUNT TO GO PAST TARGET FROM COVERAGE TABLE 1 

@set_y_distance:                                     			  ; SET FINAL COVERAGE DISTANCE AMOUNTS
	LDY #Y_POS + 1                                                ; = TARGET Y POS  +  Y AMNT TO GO PAST TARGET
	CLC                                                           ;
	ADC (target_addr),Y                                           ; 
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; - DEFENDER Y POS
	STA y_dist_to_move                                            ; SAVE Y DISTANCE IN $44,45
	LDA #$00                                                      ;
	SBC #$00                                                      ; 
	STA y_dist_to_move +1                                         ;

@set_x_distance	
	LDA x_distance_adjust                                         ; 
	LDY #X_POS + 1                                                ; = TARGET X POS  +  X AMNT TO GO PAST TARGET
	CLC                                                           ;
	ADC (target_addr),Y                                           ;
	STA x_dist_to_move                                            ;
	INY                                                           ;
	LDA x_distance_adjust                                         ;
	AND #$80                                                      ;
	BPL @save_x_distance_to_move                                   ;
	ORA #$FF                                                      ;

@save_x_distance_to_move:
	ADC (target_addr),Y                                           ;
	STA x_dist_to_move +1                                         ;
	DEY                                                           ;
	LDA x_dist_to_move                                            ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA x_dist_to_move                                            ;
	INY                                                           ;
	LDA x_dist_to_move +1                                         ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA x_dist_to_move +1                                         ; SAVE X DISTANCE IN $42,43
	RTS                                                           ; RETURN

_F}_DEFENDER_COVERAGE_LOGIC  
	
_F{_SET_FINAL_KICKER_LOCATION									  ; DONE

kicker_adjust_value	= $0C										  ; keeps kicker 1.5 yards from ball so it looks like kicker kicking it

SET_FINAL_KICKER_LOCATION:                                        ; SET FINAL KICKER LOCATION()
	LDA BALL_X + 1                                                ; = BALL X - PLAYER X
	LDY #X_POS + 1                                                ; 
	SEC                                                           ; 
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	TAX                                                           ; 
	LOAD_CUR_PLAYER_DIRECTION                                     ; 
	BPL @kicker_is_p1                                             ; YES-> P1 KICKER
	
@kicker_is_p2:												      ; P2 KICKER
	TXA                                                           ; SET X DISTANCE = BALL X - PLAYER X - 1.5 YARDS
	SEC                                                           ;
	SBC #kicker_adjust_value                                                      ; 
	TAX                                                           ; 
	LDY #$00                                                      ; SET Y DISTANCE  = 0
	JMP SAVE_FINAL_X_OR_Y_LOC_PLAYER_RAM[x_y]                     ; PUT FINAL LOCATION IN PLAYER RAM 1E 1F BASED ON LARGEST CHANGE (X,Y)


@kicker_is_p1:                                                    ; P1 KICKER
	TXA                                                           ; SET X DISTANCE = BALL X - PLAYER X + 1.5 YARDS
	CLC                                                           ;
	ADC #kicker_adjust_value                                                      ; 
	TAX                                                           ;
	LDY #$00                                                      ; SET Y DISTANCE  = 0
	JMP SAVE_FINAL_X_OR_Y_LOC_PLAYER_RAM[x_y]                     ; PUT FINAL LOCATION IN PLAYER RAM 1E 1F BASED ON LARGEST DISTANCE (X,Y)
	
_F}_SET_FINAL_KICKER_LOCATION	

_F{_SET_KICKOFF_LOCATION_DO_ANIMATION							 ; DONE	

kick_meter_value		= EXTRA_PLAYER_RAM_3
kick_meter_div_by_2		= LOCAL_7
kick_direction_bitmask	= $0C

kick_distance			= LOCAL_7 
kicker_ani_timer		= EXTRA_PLAYER_RAM_3
end_of_animation		= $80
	
DO_KICKER_KICKOFF:                                                ; START OF KICKOFF SEQUENCE
	AND #kick_direction_bitmask                                   ; DOES KICKOFF HAVE DIRECTION?
	BEQ @kick_going_middle                                        ; NO-> NO DIRECTION FOR KICKOFF
	TAX                                                           ;
	LDY #kick_meter_value                                         ; = KICK METER / 2 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	LSR                                                           ;
	STA kick_meter_div_by_2	                                      ;

@check_kick_direction:	
	TXA                                                           ; IS KICK DIRECTION = UP
	AND #$08                                                      ; KICK UP TOP
	BNE @kick_going_down                                          ; 

@kick_going_up:	
	LDA #BALL_MIDDLE_OF_FIELD_Y                                   ; SET FINAL BALL Y = MIDDLE OF FIELD + (KICK METER/2)
	CLC                                                           ;
	ADC kick_meter_div_by_2	                                      ;
	JMP @save_final_ball_y                                        ;

@kick_going_down:                                                 ; KICK UP TOP
	LDA #BALL_MIDDLE_OF_FIELD_Y                                   ; SET FINAL BALL Y = MIDDLE OF FIELD – (KICK METER/2)
	SEC                                                           ;
	SBC kick_meter_div_by_2                                       ;
	JMP @save_final_ball_y                                        ;

@kick_going_middle:                                               ; NO DIRECTION FOR KICKOFF
	LDA #BALL_MIDDLE_OF_FIELD_Y                                   ; SET FINAL BALL Y = MIDDLE OF FIELD

@save_final_ball_y:
	STA FINAL_BALL_Y                                              ; SAVE FINAL BALL Y
	
@pause_kicker_collision_check:	
	LDA #$00                                                      ; SET KICKER COLLISION COUNTER = PAUSED
	LDY #COLLISION_COUNTER                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;

@set_starting_ball_x:	
	LDA LOS_X                                                     ; SET BALL X = LOS X
	STA BALL_X + 1                                                ;
	LDA LOS_X + 1                                                 ;
	STA BALL_X + 2                                                ; 

@start_kicker_towards_ball:
	JSR SET_FINAL_KICKER_LOCATION                                 ; SET FINAL KICKER LOCATION()
	JSR SET_PLAYER_STATUS_TO_MOVING_INIT_RS_RP                    ; CHANGE PLAYER TO MOVING AND INITIALIZE RS AND RP()
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW()
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 24
	
@set_ball_snapped	
	SET_PLAY_STATUS_BALL_SNAPPED[]
	
_WHILE CC                                                ; HAS KICKER REACHED BALL LOOP

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE                ; CHECK IF PLAYER HAS REACHED FINAL LOCATION in PLAYER RAM 1E/1F() or BACK OF ENDZONE

_END_WHILE 
	
@set_kicker_sprite_toabout_to_kick:	
	LDY #<(KICKER_ABOUT_TO_KICK_SPRITE_DATA)                      ; LOAD ABOUT TO KICK SPRITE ADDR
	LDX #>(KICKER_ABOUT_TO_KICK_SPRITE_DATA)                      ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)   
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	
@check_for_onsides_kick:
	LDY #kick_meter_value                                         ; LOAD KICK METER
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CMP #END_OF_ONSIDES_METER                                     ; IS KICK ONSIDES?
	BCS @set_regular_kick_values                                  ; NO-> CALCULATE KICK DISTANCE
	
@set_onsides_kick_values	
	LSR                                                           ; = KICK METER/2 + 14 YARDS = 14 TO 16 YARDS
	CLC                                                           ;
	ADC #ONSIDE_BASE_DISTANCE                                     ;
	TAY                                                           ;
	LDA #$00                                                      ;
	ADC #$00                                                      ;
	TAX                                                           ; 
	LDA #ONSIDE_KICK_BALL_GRAVITY_INDEX                           ; SET BALL LOFT = ONSIDES KICK BALL LOFT   
	STA BALL_GRAVITY_INDEX                                        ; 
	SET_BALL_STATUS_ONSIDES_KICK
	JMP @set_kick_speed_and_start_animation                       ; JUMP-> SET KICK SPEED AND SET FINAL KICK LOCATION

@set_regular_kick_values:                                        ; CALCULATE KICK DISTANCE
	SEC                                                           ; = KICK METER - 20
	SBC #KICK_METER_SUBTRACT_VAL                                  ;
	LDX #KICK_METER_MULTIPLIER                                    ; = 6 x (KICK METER – 20) = 0 TO 48 YARDS
	JSR MULTIPLY_A_TIMES_X                                        ;
	LDA kick_distance                                             ;
	CLC                                                           ;
	ADC #KICKOFF_BASE_DISTANCE                                     ; + 27 YARDS = RANGE FROM 27-75 YARDS
	TAY                                                           ;
	LDA kick_distance +1                                          ;
	ADC #$00                                                      ;
	TAX                                                           ; 
	LDA #KICKOFF_BALL_GRAVITY_INDEX                               ; SET BALL GRAVITY
	STA BALL_GRAVITY_INDEX                                        ;

@set_kick_speed_and_start_animation                               ; SET KICK SPEED AND SET FINAL KICK LOCATION
	LDA #KICKOFF_BALL_SPEED                                       ; SET BALL SPEED = KICKOFF SPEED
	STA BALL_SPEED                                                ; 
	LDA FINAL_BALL_Y                                              ; LOAD FINAL BALL Y 
	JSR SET_FINAL_KICK_LOCATION_START_ANIMATION                   ; START MAIN KICK ROUTINE(X,Y= KICK DISTANCE, A= Y LOC)
	JSR UPDATE_PLAY_STATUS_TO_BALL_KICKED                         ; SET PLAY STATUS = BALL KICKED()
	JSR SET_PLAYER_NOT_MAN_NOT_BALL_CARRIER                       ; SET PLAYER MOVEMENT TO COM CONTROL AND PLAYER NOT BALL CARRIER()
	JMP @finish_kick_animation                                    ; JUMP-> FINISH KICK *** pointless

@finish_kick_animation:                                           ; FINISH KICK
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 2
	LDY #<(KICKER_FOOT_90_SPRITE_DATA)                            ; SET SPR ADDR = FOOT 90 DEGREES SPRITE 
	LDX #>(KICKER_FOOT_90_SPRITE_DATA)                            ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)

@initialize_kicker_animation_timer:
	LDA #$FF                                                      ;
	LDY #kicker_ani_timer                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;

_WHILE ALWAYS

	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDY #kicker_ani_timer                                         ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	CLC                                                           ;
	ADC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ;
	LDA KICKER_SPR_Y_ADJUST_ARRAY,X                               ; LOAD Y DISTANCE FROM KICKING ANIMATION Y DISTANCE ARRAY
	CMP #end_of_animation                                          ; ARRAY DONE?
	BEQ @end_of_kicker_animation                                  ; YES->EXIT KICK ANIMATION
	LDY #Y_POS + 1                                                ; = KICKER Y + KICKING ANIMATION Y DISTANCE
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;

_END_WHILE

@end_of_kicker_animation:                                         ; EXIT KICK ANIMATION
	LDY #<(BANK_JUMP_DO_MOVEMENT_COLL_LOGIC-1)                    ; SET ADDR = UPDATE SPEED/DO COLLISION LOGIC, *** could replace with actual
	LDX #>(BANK_JUMP_DO_MOVEMENT_COLL_LOGIC-1)                    ;
	JSR UPDATE_PLAYER_COLL_ADDR                                   ; UPDATE COLLISION LOGIC ADDRESS AND COLLISION COUNTER(X,Y=ADDR)
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; JUMP -> DO NEXT PLAYER COMMAND

_F}_SET_KICKOFF_LOCATION_DO_ANIMATIONC

_F{_UPDATE_KICK_PUNT_BAR                                          ; DONE
	
kickoff_type_kick_bar  = $00
punt_type_kick_bar   = $80
kick_bar_type    = LOCAL_6
tiles_left_in_bar   = LOCAL_7
cur_bar_pos_temp   = LOCAL_8
total_tiles_in_bar   = $0C
total_bar_length   = $0E 
current_bar_pos    = EXTRA_PLAYER_RAM_3
beg_of_bar     = $00
end_of_bar     = $60 
bar_update_per_frame  = $02                                       ; equals 1/4 of a tile  
size_of_onsides    = $03
size_of_red_kickoff   = total_tiles_in_bar - size_of_onsides  
	
UPDATE_KICK_POWER_BAR:                                            ; KICKOFF BAR START
	JSR CLEAR_BANNER_KICKBAR_AREA                                 ; CLEAR PPU(2040 to 205F, 2060 to 207F), CLEAR PLAYER RAM 1D, UPDATE BANNER SCENE
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 16

UPDATE_KICK_BAR_LOOP:                                             ; KICKOFF BAR LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME                              ;
	LDA #kickoff_type_kick_bar                                    ;
	JSR UPDATE_PUNT_OR_KICKOFF_POWER_BAR                          ;
	IF_PLAY_NOT_OVER[ADDR] UPDATE_KICK_BAR_LOOP                   ;
	PAUSE_PLAYER_ACTIONS


							
						
UPDATE_PUNT_POWER_BAR:                                            ; UPDATE PUNT GRAPHIC START
	LDA #punt_type_kick_bar                                       ; 
	
UPDATE_PUNT_OR_KICKOFF_POWER_BAR:                                 ; UPDATE KICKOFF GRAPHIC START
	STA kick_bar_type                                             ;
	LDY #current_bar_pos                                          ; KICK/PUNT BAR TIMER IN PLAYER RAM + OFFSET TO NEXT TIME AMOUNT 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	CLC                                                           ;
	ADC #bar_update_per_frame                                     ;
	CMP #end_of_bar                                               ; AT END OF BAR?
	BCC @save_bar_location                                        ; NO->FILL KICK BAR WITH COLOR

@reset_bar_loc_to_start: 
	LDA #beg_of_bar                                               ; SET TIMER = 0 = BEGINNING OF BAR
	
@save_bar_location:                                               ; FILL KICK BAR WITH COLOR(A= TIMER VALUE)
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SET PLAYER RAM = NEW  BAR TIMER VALUE 
	STA cur_bar_pos_temp                                          ; SET TEMP BAR TIMER = BAR TIMER VALUE
	LDA #total_tiles_in_bar                                       ; SET TILES LEFT TO UPDATE IN BAR = 12  
	STA tiles_left_in_bar                                         ; 
	LOAD_CUR_PLAYER_POSITION_ID
	BMI UPDATE_P2_KICK_BAR                                        ; YES->P2 PUNT/KICKOFF BAR FILL

UPDATE_P1_KICK_BAR:
	
@init_p1_kick_bar_buffer_space: 
	LDY #<P1_KICK_BAR_PPU_ADDR                                    ; SET PPU ADDRESS = $2050 = P1 KICK/PUNT BAR LOCATION
	LDX #>P1_KICK_BAR_PPU_ADDR                                    ;
	LDA #total_bar_length                                         ; SET LENGTH = 14 TILES
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                         ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDA #LEFT_KICKBAR_BORDER_TILE_ID                              ; SET TILE = LEFT BAR OUTLINE
	STA CURRENT_BG_BUFFER_LOC,X                                   ; 
	INX                                                           ;
	LDA kick_bar_type                                             ; IS BAR TYPE = PUNT BAR?
	BMI @start_of_p1_punt_bar_check                               ; YES->CHECK FOR BEGINNING OF P1 BAR

@check_for_p1_onsides_blue_fill 
	_WHILE CS
	
	LDA cur_bar_pos_temp                                          ; IS BAR LOC = BEGINNING OF BAR
	BEQ @fill_remaining_p1_bar_black                              ; YES->SET PUNT/KICK BAR FILL COLOR TO BLACK()
	
@check_for_partial_blue_tiles: 
	SEC                                                           ; BAR LOC TEMP- 0X08
	SBC #SIZE_OF_TILE                                             ;
	BCC @add_blue_tiles_to_p1_bar                                 ;  
	STA cur_bar_pos_temp                                          ; 
	LDA #KB_BLUE_FULL_TILE_ID                                     ; SET TILE = BAR OUTLINE WITH BLUE FILL FULL
	STA CURRENT_BG_BUFFER_LOC,X                                   ; SAVE IN BUFFER
	INX                                                           ; BUFFER INDEX++
	DEC tiles_left_in_bar                                         ; TILES LEFT TO UPDATE IN BAR--
	LDA tiles_left_in_bar                                         ;
	CMP #size_of_red_kickoff                                      ; TILES LEFT TO UPDATE IN BAR >= 9
	
	_END_WHILE
	
	
	JMP @p1_bar_fill_red                                          ; JUMP->P1 RED FILL LOOP

@start_of_p1_punt_bar_check:                                      ; CHECK FOR BEGINNING OF P1 BAR
	LDA cur_bar_pos_temp                                          ; IS BAR LOCATION = BEGINNING OF BAR
	BEQ @fill_remaining_p1_bar_black                              ; YES->SET PUNT/KICK BAR FILL COLOR TO BLACK()

@p1_bar_fill_red:                                                 ; P1 RED FILL LOOP

	_WHILE NOT_EQUAL
	LDA cur_bar_pos_temp                                          ; IS BAR LOCATION IN BLUE SECTION OF BAR? 
	SEC                                                           ;
	SBC #SIZE_OF_TILE                                             ;
	BCC @add_red_tiles_to_p1_bar                                  ; ADD CURRENT BLUE POWER METER TILE TO BUFFER
	STA cur_bar_pos_temp                                          ;
	LDA #KB_RED_FULL_TILE_ID                                      ;
	STA CURRENT_BG_BUFFER_LOC,X                                   ;
	INX                                                           ; BUFFER INDEX++
	DEC tiles_left_in_bar                                         ;
	
	_END_WHILE
	
	JMP @set_end_of_p1_bar                                        ; YES->SET END OF BAR

@add_blue_tiles_to_p1_bar:                                        ; P1 SIDE, ADD BLUE POWER METER TILE TO BUFFER
	LSR cur_bar_pos_temp                                          ;
	LDY cur_bar_pos_temp                                          ;
	LDA P1_BLUE_KICK_METER_TILES,Y                                ; SAVE TILE ID FROM BLUE KICK POWER METER TILES P1 IN BUFFER 
	STA CURRENT_BG_BUFFER_LOC,X                                   ;
	INX                                                           ; BUFFER INDEX++
	DEC tiles_left_in_bar                                         ; TILES LEFT TO UPDATE IN BAR--
	JMP @fill_remaining_p1_bar_black                              ; JUMP->SET PP1 UNT/KICK BAR FILL COLOR TO BLACK()

@add_red_tiles_to_p1_bar:                                         ; ADD CURRENT RED POWER METER TILE TO BUFFER
	LSR cur_bar_pos_temp                                          ;
	LDY cur_bar_pos_temp                                          ;
	LDA P1_RED_KICK_METER_TILES,Y                                 ; SAVE TILE ID FROM RED KICK POWER METER TILES P1 IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                   ; 
	INX                                                           ;
	DEC tiles_left_in_bar                                         ;
	BEQ @set_end_of_p1_bar                                        ; YES->SET END OF BAR

@fill_remaining_p1_bar_black:
	
_WHILE NOT_EQUAL                                                  ; SET P1 PUNT/KICK BAR FILL COLOR TO BLACK

	LDA #KICK_BAR_BLACK_FILL_TILE_ID                              ; SET TILE = BAR OUTLINE WITH BLACK FILL
	STA CURRENT_BG_BUFFER_LOC,X                                   ; SAVE IN BUFFER
	INX                                                           ; BUFFER INDEX++ 
	DEC tiles_left_in_bar                                         ; TILES LEFT TO UPDATE--
	
_END_WHILE

@set_end_of_p1_bar:                                               ; SET END OF BAR P1
	LDA #RIGHT_KICKBAR_BORDER_TILE_ID                             ; SET TILE = RIGHT EDGE OF BAR FILL COLOR = BLACK
	STA CURRENT_BG_BUFFER_LOC,X                                   ; SAVE IN BUFFER
	INX                                                           ; BUFFER INDEX++ 
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                     ; SET BUFFER LENGTH AND SET BUFFER STATUS TO READY(X= LENGTH)


UPDATE_P2_KICK_BAR:                                               ; P2 PUNT/KICKOFF BAR FILL

@init_p2_kick_bar_buffer_space: 
	LDY #<P2_KICK_BAR_PPU_ADDR                                    ; SET PPU ADDRESS = $2044 = P2 KICK/PUNT BAR LOCATION
	LDX #>P2_KICK_BAR_PPU_ADDR                                    ;
	LDA #total_bar_length                                         ; SET LENGTH = 14 TILES
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                         ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	TXA                                                           ; 
	CLC                                                           ;
	ADC #$0D                                                      ;
	TAX                                                           ;
	LDA #RIGHT_KICKBAR_BORDER_TILE_ID                             ; SET TILE = RIGHT BAR OUTLINE
	STA CURRENT_BG_BUFFER_LOC,X                                   ;
	DEX                                                           ; BUFFER INDEX--
	LDA kick_bar_type                                             ; IS BAR TYPE = PUNT BAR?
	BMI @start_of_p2_punt_bar_check                               ; YES->CHECK FOR END OF BAR
	
@check_for_p2_onsides_blue_fill:                                  ; P2 BLUE FILL LOOP 

	_WHILE CS
	
	LDA cur_bar_pos_temp                                          ; IS BAR LOC = BEGINNING OF BAR
	BEQ @fill_remaining_p2_bar_black:                             ; YES->SET PUNT/KICK BAR FILL COLOR TO BLACK()  
	SEC                                                           ; BAR LOCATION -= SIZE OF ONE TILE
	SBC #SIZE_OF_TILE                                             ;
	BCC @add_blue_tiles_to_p2_bar                                 ; YES-> FILL P2 KICK BAR WITH BLUE TILES()
	STA cur_bar_pos_temp                                          ;
	LDA #KB_BLUE_FULL_TILE_ID                                     ; SET TILE ID = FULL RED TILE WITH BAR OUTLINE
	STA CURRENT_BG_BUFFER_LOC,X                                   ; SAVE IN BUFFER
	DEX                                                           ; BUFFER INDEX--
	DEC tiles_left_in_bar                                         ; TILES LEFT TO UPDATE IN BAR--
	LDA tiles_left_in_bar                                         ; 
	CMP #size_of_red_kickoff                                      ; TILES LEFT TO UPDATE IN BAR > 9
	
	_END_WHILE
	
	JMP @p2_bar_fill_red:                                         ; NO-> P2 RED FILL LOOP

@start_of_p2_punt_bar_check :                                     ; P2 CHECK FOR END OF BAR, ELSE FILL WITH RED
	LDA cur_bar_pos_temp                                          ; AT END OF BAR?
	BEQ @fill_remaining_p2_bar_black:                             ; YES->FILL P2 KICK BAR WITH BLACK TILES() 

@p2_bar_fill_red:
																; P2 RED FILL LOOP
	_WHILE NOT_EQUAL
	LDA cur_bar_pos_temp                                          ; TEMP BAR LOCATION – BAR INCREMENT
	SEC                                                           ;
	SBC #SIZE_OF_TILE                                             ;
	BCC @add_red_tiles_to_p2_bar:                                 ; DRAW FULL TILE? NO->FILL P2 KICK BAR WITH PARTIALLY FULL RED TILES()
	STA cur_bar_pos_temp                                          ; SAVE TEMP BAR LOCATION
	LDA #KB_RED_FULL_TILE_ID                                      ; SET TILE ID = FULL RED TILE WITH BAR OUTLINE
	STA CURRENT_BG_BUFFER_LOC,X                                   ; SAVE IN BUFFER
	DEX                                                           ; BUFFER INDEX--
	DEC tiles_left_in_bar                                         ; TILES LEFT TO UPDATE IN BAR--
	
	_END_WHILE
	
	JMP @set_end_of_p2_bar                                        ; YES->SET END OF BAR TILE P2 AND BUFFER TILES

@add_blue_tiles_to_p2_bar:                                        ; FILL P2 KICK BAR WITH PARTIALLY FULL BLUE TILES()
	LSR cur_bar_pos_temp                                          ; GET INDEX INTO KICK METER TILES
	LDY cur_bar_pos_temp                                          ; 
	LDA P2_BLUE_KICK_METER_TILES,Y                                ; SET TILE ID FROM BLUE KICK POWER METER TILES P2
	STA CURRENT_BG_BUFFER_LOC,X                                   ; SAVE IN BUFFER 
	DEX                                                           ; BUFFER INDEX--
	DEC tiles_left_in_bar                                         ; TILES LEFT TO UPDATE--
	JMP @fill_remaining_p2_bar_black:                             ; FILL P2 KICK BAR WITH BLACK TILES()
	
@add_red_tiles_to_p2_bar:                                         ; FILL P2 KICK BAR WITH PARTIALLY FULL RED TILES()
	LSR cur_bar_pos_temp                                          ; GET INDEX INTO KICK METER TILES
	LDY cur_bar_pos_temp                                          ;
	LDA P2_RED_KICK_METER_TILES,Y                                 ; SET TILE ID FROM RED KICK POWER METER TILES P2
	STA CURRENT_BG_BUFFER_LOC,X                                   ; SAVE IN BUFFER
	DEX                                                           ; BUFFER INDEX--
	DEC tiles_left_in_bar                                         ; TILES LEFT TO UPDATE--
	BEQ @set_end_of_p2_bar                                        ; DONE? YES->SET END OF BAR TILE P2 AND BUFFER TILES
	
@fill_remaining_p2_bar_black::                                    ; FILL P2 KICK BAR WITH BLACK TILES() 

	_WHILE NOT_EQUAL
	
	LDA #KICK_BAR_BLACK_FILL_TILE_ID                              ; SET TILE ID = BLACK BAR WITH WHITE OUTLINE
	STA CURRENT_BG_BUFFER_LOC,X                                   ;
	DEX                                                           ; BUFFER INDEX--
	DEC tiles_left_in_bar                                         ; TILES LEFT TO UPDATE--
	
	_END_WHILE


@set_end_of_p2_bar:                                               ; SET END OF BAR TILE P2 AND BUFFER TILES
	LDA #LEFT_KICKBAR_BORDER_TILE_ID                              ; SET TILE ID = END OF BAR
	STA CURRENT_BG_BUFFER_LOC,X                                   ;
	TXA                                                           ; = CURRENT INDEX + 14 TILES
	CLC                                                           ;
	ADC #$0E                                                      ; 
	TAX                                                           ;
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                     ; JUMP-> SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)

_F}_UPDATE_KICK_PUNT_BAR

_F{_CLEAR_ONSCREEN_BANNER_SCROLL_IN                               ; DONE
	
num_tiles   = LOCAL_1 
num_rows   = LOCAL_2
banner_rows   = $02   
current_bar_pos  = EXTRA_PLAYER_RAM_3    

CLEAR_BANNER_KICKBAR_AREA:                                        ; CLEAR FIRST TWO ROWS OF PPU FOR BANNER, CLEAR PLAYER RAM 1D, UPDATE BANNER SCENE
	LDY #<ONSCREEN_BANNER_PPU_ADDR                                ; SET PPU ADDR = $2040
	LDX #>ONSCREEN_BANNER_PPU_ADDR                                ;
	LDA #banner_rows                                              ; SET NUM ROWS = 2
	STA num_rows                                                  ;
	LDA #LENGTH_OF_ONE_ROW                                        ; SET LENGTH = LENGTH OF WHOLE ROW = 32 TILES
	STA num_tiles                                                 ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                               ; CLEAR PPU(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)

@clear_bar_position:                                              ; 
	LDA #$00                                                      ; SET PLAYER RAM $1D = ZERO
	LDY #current_bar_pos                                          ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
@scroll_in_banner: 
	LOAD_CUR_PLAYER_POSITION_ID                                   ;
	AND #$80                                                      ; 
	ORA #SCROLL_IN_ONSCR_BANNER_ID                                ; 
	STA_ABS_A_ZP BANNER_ID                                        ; *** uneeded
	RTS                                                           ; RETURN

_F}_CLEAR_ONSCREEN_BANNER_SCROLL_IN 

_F{_UPDATE_FG_XP_ARROW                                            ; DONE

upper_arrow_y_temp   = LOCAL_2 
max_arrow_distance   = LOCAL_8
skill_bitmask    = $0F
arrow_index     = EXTRA_PLAYER_RAM_3
lower_arrow_y    = EXTRA_PLAYER_RAM_4
upper_arrow_y    = EXTRA_PLAYER_RAM_5
	
UPDATE_FG_ARROW_START:                                            ; FG ARROW ROUTINE
	LDY #$0B                                                      ; NOT USED COULD HAVE BEEN USED TO MODIFY ARROW DISTANCE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ;
	
@get_max_arrow_move_distance: 
	LDA KICKING_ABILITY_TEMP,X                                    ; LOAD KICKING ABILITY 
	AND #skill_bitmask                                            ; MAKE SURE ABILITY IS 0x00 to 0x0F
	TAX                                                           ;
	LDA FG_ARROW_MAX_DISTANCE_ARRAY,X                             ; SAVE MAX DISTANCE TO MOVE ARROW in $45 FROM FG MAX ARROW DISTANCE
	STA max_arrow_distance                                        ;
	
@set_and_save_lower_arrow_y:  
	LDY #Y_POS + 1                                                ; SET PLAYER RAM 1F= PLAYER Y + 0x03 + MAX ARROW DISTANCE  = LOWEST POINT OF ARRROW  
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	CLC                                                           ;
	ADC #$03                                                      ;
	TAX                                                           ; = PLAYER Y + 0x03
	CLC                                                           ;
	ADC max_arrow_distance                                        ;
	LDY #upper_arrow_y                                            ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;

@set_and_save_upper_arrow_y:  
	TXA                                                           ; SET PLAYER RAM 1E= PLAYER Y - MAX ARROW DISTANCE  = HIGHEST POINT OF ARRROW 
	SEC                                                           ;
	SBC max_arrow_distance                                        ;
	DEY                                                           ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA upper_arrow_y_temp                                        ; 
	
@randomize_arrow_start_location: 
	LDA max_arrow_distance                                        ; RANDOMIZE ARROW START LOCATION TO +/- MAX ARROW DISTANCE
	ASL                                                           ; 2 * MAX ARROW DISTANCE
	JSR RANDOMIZE_ARROW_LOCATION                                  ; 
	CLC                                                           ; = 0 to 2* MAX ARROW DISTANCE
	ADC upper_arrow_y_temp                                        ; = 0 to 2* MAX ARROW DISTANCE – ARROW DISTANCE
	STA FG_ARROW_SPR_Y                                            ; SET ARROW SPRITE Y LOCATION
	LDY #arrow_index                                              ; SET ARROW TIMER TO ZERO
	LDA #$00                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDX PLAYER_SPR_INDEX_TEMP                                     ; LOAD BALL X LOCATION SPRITE INDEX OFFSET
	LDA #FG_XP_ARROW_TILE_ID                                      ; SET ARROW SPRITE TILE 
	STA FG_ARROW_SPR_TILE                                         ;
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @set_p2_arrow_spr_info                                    ; IS PLAYER 2? YES->BRANCH TO SET ARROW PLAYER 2

@set_p1_arrow_spr_info
	LDY #$00                                                      ; LOAD PLAYER 1 PALLETE AND MIRRORING
	LDA #$30                                                      ; LOAD ARROW X OFFSET =  6 YARDS
	JMP set_fg_arrow_attr_and_x_loc

@set_p2_arrow_spr_info :                                          ; SET KICK ARROW ATTRIBUTES PLAYER 2
	LDY #$42                                                      ; LOAD PLAYER 2 PALLETE AND MIRRORING  
	LDA #$D0                                                      ; LOAD ARROW X OFFSET = -6 YARDS

set_fg_arrow_attr_and_x_loc:                                      ; SET KICK ARROW ATTRIBUTES (PALLETE AND MIRRORING)& X LOCATION 
	STY FG_ARROW_SPR_ATTR                                         ; SET ARROW ATTRIBUTES (PALLETE AND MIRRORING)
	CLC                                                           ; SET ARROW SPRITE X = ARROW X OFFSET + BALL LOCATION 
	ADC CUR_SPRITE_X,X                                            ;
	STA FG_ARROW_SPR_X                                            ;

arrow_speed  = LOCAL_7 
	
@arrow_moving_down_loop:                                          ; ARROW MOVING DOWN LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR GET_FG_ARROW_SPEED                                        ; GET FG ARROW SPEED AND SAVE IN (44,45)
	LDY #arrow_index                                              ; ARROW TIMER = ARROW TIMER + ARROW SPEED (DISTANCE PER FRAME) LOW BYTE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	CLC                                                           ;
	ADC arrow_speed                                               ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDA FG_ARROW_SPR_Y                                            ; ARROW SPRITE Y LOCATION=   
	ADC arrow_speed + 1                                           ; ARROW SPEED (DISTANCE PER FRAME) HIGH BYTE + ARROW SPRITE Y LOCATION + CARRY
	STA FG_ARROW_SPR_Y                                            ; 
	LDY #upper_arrow_y                                            ; 
	CMP (CURRENT_PLAYER_ADDR),Y                                   ; ARROW SPRITE Y LOCATION > LOWEST POSSIBLE POINT OF ARROW
	BEQ @arrow_moving_down_loop                                   ; NO->ARROW MOVING DOWN LOOP
	BCC @arrow_moving_down_loop                                   ;
	
@arrow_moving_up_loop:                                            ; ARROW MOVING UP LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR GET_FG_ARROW_SPEED                                        ; GET FG ARROW SPEED AND SAVE IN (44,45)
	LDY #arrow_index                                              ; ARROW TIMER = ARROW TIMER - ARROW SPEED (DISTANCE PER FRAME) LOW BYTE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ;
	SBC arrow_speed                                               ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; ARROW SPRITE Y LOCATION=   
	LDA FG_ARROW_SPR_Y                                            ; ARROW SPEED (DISTANCE PER FRAME) HIGH BYTE + ARROW SPRITE Y LOCATION + CARRY
	SBC arrow_speed+1                                             ;
	STA FG_ARROW_SPR_Y                                            ;
	INY                                                           ; 
	CMP (CURRENT_PLAYER_ADDR),Y                                   ; ARROW SPRITE Y LOCATION > HIGHEST POSSIBLE POINT OF ARROW
	BCS @arrow_moving_up_loop                                     ; NO-> ARROW MOVING UP LOOP
	JMP @arrow_moving_down_loop                                   ; YES->ARROW MOVING DOWN LOOP

GET_FG_ARROW_SPEED:                                               ; GET FG ARROW SPEED()
	LDY #$0B                                                      ; ***NOT USED COULD HAVE BEEN USED TO MODIFY ARROW DISTANCE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ;
	LDA KICKING_ABILITY_TEMP,X                                    ; LOAD KICKING ABILITY INDEX
	AND #skill_bitmask                                            ; MAKE SURE ABILITY IS BETWEEN 0x00 - 0x0F
	TAX                                                           ; 
	LDA FG_ARROW_SPEED_ARRAY,X                                    ; LOAD FG ARROW SPEED FROM FG ARROW SPEED TABLE
	ASL                                                           ; 
	STA arrow_speed                                               ; SAVE FG ARROW SPEED * 2 in $44,45
	LDA #$00                                                      ;
	ROL                                                           ;
	STA arrow_speed +1                                            ;
	RTS                                                           ; RETURN

	
FG_ARROW_SPEED_ARRAY:                                             ; FG ARROW SPEED TABLE *** speed modifies accruacy bug with math with 50ka kicker 
	.DB $B8,$B0,$A8,$A0,$98,$90,$88,$80,$78,$70,$68,$60,$58,$50,$48,$40

FG_ARROW_MAX_DISTANCE_ARRAY:                                      ; FG MAX ARROW DISTANCE
	.DB $0E,$0E,$0D,$0D,$0C,$0C,$0B,$0B,$0A,$0A,$09,$09,$08,$08,$07,$07

																; VELOCITY (PIXELS PER FRAME) = (VELOCITY VAL)/256  
																; VELOCITY (YARDS PER FRAME) = (PIXELS/ FRAME)/(8 PIXELS/1 YARD)  = (VELOCITY VAL)/(256 *8)  

_F}_UPDATE_FG_XP_ARROW

_F{_CALCULATE_FINAL_BALL_LOCATION_LOGIC							  ; DONE	

; speed adjust index = (target speed * 2) - passing speed + table_lookup_constant
; adjust value = speed adjust value + overthrow angle adjust value
; frames to reach player at current loc += pass animation delay
; new frames = 4 * (adjust value * frames)
; Each hex digit in the overthrow table results in the following
; ((overthrow value - base value) * ball speed )/2 
; 
 


overthrow_table_bitmask  		= $F8                              ; table are 8 entries long. 
overthrow_table_index  			= LOCAL_8
overthrow_frame_adj_value		= LOCAL_8
final_frame_adj_value			= LOCAL_7
passing_animation_frame_delay   = $08							 ; think that is what this constant is for

ball_animation_frames			= LOCAL_6
												
CALULATE_FINAL_BALL_LOC_ON_TARGET:                                ; CALCULATE FINAL BALL LOCATION MOVING PLAYER, BALL ON TARGET
	LDA #$00
CALULATE_FINAL_BALL_LOC_WITH_OVERTHROW[rand]:                     ; CALCULATE FINAL BALL LOCATION MOVING PLAYER (A= OVERTHROW AMOUNT INDEX)
	AND #overthrow_table_bitmask                                  ; MAKE RANDOM OFFSET INCREMENTS OF 8 BYTES
	STA overthrow_table_index                                     ; 
	LOAD_CUR_TARGET_DIRECTION[]                                   ;
	SEC                                                           ;
	SBC BALL_ANGLE                                                ;  - BALL DIRECTION
	CLC                                                           ;
	ADC #$08                                                      ;  SET MINIMIUM INDEX = 0 FOR SMALL NEGATIVE ANGLES 
	BPL @get_contant_angular_frame_adjustment                     ; = ABSOLUTE VALUE (TARGET DIRECTION - BALL DIRECTION + MINIMUM INDEX ADJUST)
	EOR #$FF                                                      ; 

@get_contant_angular_frame_adjustment:                            ;
	DIVIDE_16
	CLC                                                           ;
	ADC overthrow_table_index                                     ; ANGLE INDEX + RANDOM ROW OFFSET 
	TAX                                                           ; SAVE TABLE INDEX
	LDA OVERTHROW_ADJUST_TABLE,X                                  ; SAVE OVERTHROW ADJUST IN $45 FROM OVERTHROW ADJUST TABLE BASED ON PASSING ANGLE
	STA overthrow_frame_adj_value                                 ; 
																  ; CALCULATE PASSING SPEED VS PLAYER SPEED DIFFERENTIAL AND MAKE VALUE 0 TO 0X20
																  ; (TARGET SPEED * 2 )+ OFFSET = MAKE SLOWEST max SPEED 0X10 LESS THAN SLOWEST PASS SPEED 
	LOAD_CUR_TARGET_SPEED[]                                       ;
	ASL                                                           ; 
	CLC                                                           ;
	ADC #$16                                                      ; 
	SEC                                                           ;
	SBC BALL_SPEED                                                ; - BALL SPEED
	PHA                                                           ; 
	ASL                                                           ; 
	PLA                                                           ; 
	ROR                                                           ; 
	CLC                                                           ;
	ADC #$10                                                      ; SETS INDEX INTO TABLE FROM 0 TO 20
	TAX                                                           ; SET X= DISTANCE ADJUST TABLE INDEX 
	LDA PASS_SPEED_VS_TARGET_SPEED_ADJUST_TABLE,X                 ; LOAD ADJUSTMENT FROM PASSING VS TARGET SPEED ADJUSTMENT TABLE 
	CLC                                                           ; TIME TO REACH PLAYER ADJUST = OVERTHROW ADJUST + PASS VS TARGET SPEED ADJUST
	ADC overthrow_frame_adj_value                                 ;  
	STA final_frame_adj_value                                     ; 

@set_frames_to_reach_target_at_current_location:
	LDA BALL_ANI_FRAMES_LEFT                                      ; TOTAL FRAMES = TIME REACH PLAYER AT CURRENT LOC (AC,AD) + FRAME DELAY UNTIL BALL MOVES 
	CLC                                                           ;
	ADC #passing_animation_frame_delay                            ;
	TAY                                                           ; 
	LDA BALL_ANI_FRAMES_LEFT + 1                                  ; 
	ADC #$00                                                      ; 
	TAX                                                           ;
	LDA final_frame_adj_value                                     ; 
																  ; (TIME TO REACH PLAYER ADJUST) * (PASS TIMER + FRAMES UNTIL BALL STARTS MOVING) 
	JSR MULTIPLY_A_TIMES_X_Y                                      ; = A * (X,Y) RESULT IN in $45(HIGH) $44 $43(SUB FRAMES) 
	LDA ball_animation_frames+2                                   ; TOTAL TIME = 4 * TEMP TIME VALUE (FRAMES)
	ASL ball_animation_frames                                     ;
	ROL ball_animation_frames+1                                   ;
	ROL                                                           ;
	ASL ball_animation_frames                                     ;
	ROL ball_animation_frames+1                                   ;
	ROL                                                           ;
	STA TEMP_TOTAL_PASS_FRAMES +1                                 ; SAVE TOTAL PASS FRAMES 
	LDA ball_animation_frames+1                                   ;
	STA TEMP_TOTAL_PASS_FRAMES                                    ; 
	
target_y_velocity		= LOCAL_7
target_x_velocity		= LOCAL_7
total_pass_frames		= LOCAL_5	
ball_offscreen			= $FF
																  ; CALCULATE TOTAL Y DISTANCE BASED ON Y VELOCITY
	LDY #Y_VELOCITY                                               ; SAVE TARGET Y VELOCITY IN $44,$45 
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	STA target_y_velocity                                         ; 
	INY                                                           ; 
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	STA target_y_velocity+1                                       ; 
	LDA TEMP_TOTAL_PASS_FRAMES                                    ; RESTORE TOTAL PASS FRAMES
	STA total_pass_frames                                         ;
	LDA TEMP_TOTAL_PASS_FRAMES+1                                  ;
	STA total_pass_frames+1                                       ;
	JSR MULTIPLY_16_BIT_RESULT_32_BIT                             ; FINAL BALL Y DISTANCE ADJUST = TARGET Y VELOCITY * TIME(#TOTAL PASS FRAMES)
	
y_distance			 = LOCAL_6
x_distance			 = LOCAL_6

@check_for_pass_far_off_screen	
	LDA y_distance +2                                             ;
	BEQ @check_target_y_velocity                                  ;
	
@set_y_distance_offscreen	
	LDA #ball_offscreen	                                          ;
	STA y_distance                                                ;
	
@check_target_y_velocity:                                         ;
	LDY #Y_VELOCITY+1                                             ; IS TARGET Y VELOCITY = NEGATIVE
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	BMI @target_moving_up                                         ; YES-> TARGET MOVING UP

@target_moving_down:
	LDY #Y_POS + 1                                                ; = TARGET Y LOC + Y DISTANCE
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	CLC                                                           ;
	ADC y_distance                                                ;
	BCC @save_final_ball_y_loc                                    ; DOES PLAYER LOCATION + DISTANCE = ON SCREEN?

@set_location_to_bottom_of_screen	
	LDA #BOTTOM_OF_SCREEN                                         ; NO-> SET FINAL Y LOCATION = BOTTOM OF SCREEN
	JMP @save_final_ball_y_loc                                    ; JUMP->SAVE FINAL BALL LOC Y, CALCULATE FINAL BALL LOC X 

@target_moving_up:                                                ; TARGET MOVING UP
	LDY #Y_POS + 1                                                ; TARGET Y LOC + Y DISTANCE
	LDA (CURRENT_TARGET_ADDR),Y                                   ;
	CLC                                                           ;
	ADC y_distance                                                 ;
	BCS @save_final_ball_y_loc                                    ; DOES PLAYER LOCATION + DISTANCE = ON SCREEN?

@set_location_to_top_of_screen:	
	LDA #TOP_OF_SCREEN                                            ; NO-> SET FINAL LOCATION = TOP OF SCREEN

@save_final_ball_y_loc:                                           ; SAVE FINAL BALL LOC Y, CALCULATE FINAL BALL X LOC    
	STA FINAL_BALL_Y                                              ; SAVE FINAL BALL Y VALUE
	
	LDA TEMP_TOTAL_PASS_FRAMES                                    ; SAVE PASS TIME REMAINING IN $42,$43
	STA total_pass_frames                                         ;
	LDA TEMP_TOTAL_PASS_FRAMES+1                                  ;
	STA total_pass_frames+1                                       ; 
	LDY #X_VELOCITY+1                                               ; IS TARGET X VELOCITY = NEGATIVE? 
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	BMI @target_moving_left                                       ; YES-> TARGET MOVING LEFT

@target_moving_right: 
	LDY #X_VELOCITY                                               ; SAVE TARGET X VELOCITY IN $44,45
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	STA target_x_velocity                                         ; 
	INY                                                           ;
	LDA (CURRENT_TARGET_ADDR),Y                                   ;
	STA target_x_velocity+1                                       ; 

@calculate_x_distance:	
	JSR MULTIPLY_16_BIT_RESULT_32_BIT                             ; FINAL BALL X DISTANCE ADJUST= (TARGET X VELOCITY * TIME) 
	LDY #X_POS + 1                                                ; FINAL BALL X= PLAYER CURRENT X LOCATION +  ADDITIONAL DISTANCE 
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	CLC                                                           ; 
	ADC x_distance                                                ; 
	STA FINAL_BALL_X                                              ; 
	TAX                                                           ; 
	INY                                                           ; 
	LDA (CURRENT_TARGET_ADDR),Y                                   ; 
	ADC x_distance+1                                              ; 
	STA FINAL_BALL_X + 1                                          ; 
	TAY                                                           ; 
	
@check_if_ball_past_back_of_right_endzone:	
	CPX #<(BACK_RIGHT_ENDZONE - ONE_YARD)                         ; IS FINAL BALL LOCATION > 1 yd from back fo endzone? 
	TYA                                                           ;
	SBC #>(BACK_RIGHT_ENDZONE - ONE_YARD)                         ; 
	BCC @exit                                                     ; NO-> EXIT

@set_random_ball_location_past_right_endzone	
	LDA RANDOM_1                                                  ; SET FINAL BALL X LOCATION = RAND (-1 to 1 YARDS) PAST ENDZONE
	AND #$0F                                                      ; = RAND (0-2 YARDS)
	CLC                                                           ;
	ADC #<(BACK_RIGHT_ENDZONE - ONE_YARD)                         ; + BACK OF P1/RIGHT ENDZONE LOCATION
	STA FINAL_BALL_X                                              ; 
	LDA #$00                                                      ;
	ADC #>(BACK_RIGHT_ENDZONE - ONE_YARD)                        ;  
	STA FINAL_BALL_X + 1                                          ; 
@exit:                                                            ; EXIT
	RTS                                                           ; RETURN 

@target_moving_left:                                              ; TARGET MOVING LEFT
	LDY #X_VELOCITY                                               ; SAVE AND INVERT TARGET X VELOCITY IN $44,45
	LDA #$00                                                      ; 
	SEC                                                           ;
	SBC (CURRENT_TARGET_ADDR),Y                                   ;
	STA target_x_velocity                                          ;
	INY                                                           ;
	LDA #$00                                                      ;
	SBC (CURRENT_TARGET_ADDR),Y                                   ;
	STA target_x_velocity+1										  ;
	
@calculate_x_distance_moving_left:
	JSR MULTIPLY_16_BIT_RESULT_32_BIT                             ; FINAL BALL X DISTANCE ADJUST= (TARGET X VELOCITY * TIME) 
	LDY #X_POS + 1                                                ; FINAL BALL X = PLAYER CURRENT X LOCATION -  ADDITIONAL DISTANCE
	LDA (CURRENT_TARGET_ADDR),Y                                   ;
	SEC                                                           ;
	SBC x_distance                                                ;
	STA FINAL_BALL_X                                              ;
	TAX                                                           ;
	INY                                                           ;
	LDA (CURRENT_TARGET_ADDR),Y                                   ;
	SBC x_distance+1                                              ;
	STA FINAL_BALL_X + 1                                          ; DOES FINAL BALL LOCATION = PAST BACK OF P2 ENDZONE (0X0628) -1 YARD
	TAY

@check_if_ball_past_back_of_left_endzone:                         ; IS FINAL BALL LOCATION > 1 yd from back fo endzone? 
	CPX #(<BACK_LEFT_ENDZONE + ONE_YARD)                                        ; 
	TYA                                                           ;
	SBC #>(BACK_LEFT_ENDZONE + ONE_YARD)                                       ;
	BCS target_moving_left_exit                                   ; NO->EXIT
	
@set_random_ball_location_past_left_endzone	
	LDA RANDOM_1                                                  ; SET FINAL BALL X LOCATION = RAND (0 -2 YARDS) PAST ENDZONE
	ORA #$F0                                                      ; = RAND (-0 TO -2 YARDS)
	CLC                                                           ;
	ADC #<(BACK_LEFT_ENDZONE + ONE_YARD)                          ; + BACK OF P2/LEFT ENDZONE LOCATION
	STA FINAL_BALL_X                                              ;
	LDA #$FF                                                      ;
	ADC #>(BACK_LEFT_ENDZONE + ONE_YARD)                          ;
	STA FINAL_BALL_X + 1                                          ;
target_moving_left_exit:                                          ; EXIT
	RTS                                                           ; RETURN

_F}_CALCULATE_FINAL_BALL_LOCATION_LOGIC

_F{_SWAP_PLAYER_AND_TARGET_ADDR									  ; DONE

SWAP_CURRENT_PLAYER_ADDR_WITH_TARGET:                             ; SWAP E6,E7 WITH AE,AF() 
	LDX CURRENT_PLAYER_ADDR                                       ;            
	LDY CURRENT_TARGET_ADDR                                       ; 
	STY CURRENT_PLAYER_ADDR                                       ;
	STX CURRENT_TARGET_ADDR                                       ;
	LDX CURRENT_PLAYER_ADDR +1                                    ;
	LDY CURRENT_TARGET_ADDR +1                                    ;
	STY CURRENT_PLAYER_ADDR +1                                    ;
	STX CURRENT_TARGET_ADDR +1                                    ;
	RTS                                                           ; RETURN
	
 _F}_SWAP_PLAYER_AND_TARGET_ADDR

_F{_HANDOFF_LOGIC 												  ; DONE

player_getting_handoff 					=  EXTRA_PLAYER_RAM_3
handoff_target_addr  					=  LOCAL_1
icon_not_changing_bitmask				=  $BF

HANDOFF_COMMAND_LOGIC:                                            ; CONTINUATION OF HANDOFF COMMAND

@save_player_getting_handoff
	LDY #player_getting_handoff                                   ; SAVE PLAYER TO HANDOFF TO
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        

@set_icon_change_delay: 
	LDA #HANDOFF_ICON_CHANGE_DELAY_FRAMES                         ; SET ICON CHANGE TIMER = 38 FRAMES
	STA HANDOFF_ICON_CHANGE_TIMER                                 ; 
	JSR CLEAR_P1_OR_P2_DISPLAYED_NAME                             ; SET P1 or P2 ICON VALUE TO NONE() 

	
	LDY #player_getting_handoff                                   ; LOAD PLAYER TO HAND OFF TO
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR GET_TARGET_RAM_ADDR_AND_SAVE_IN_LOCAL                     ; GET PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASE ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F)
	SET_CUR_PLAYER_DIRECTION
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDY #<(HANDOFF_TOSS_START_SPRITE_INFO)                        ; LOAD QB HANDOFF/TOSS SPRITE GRAPHIC ADDRESS
	LDX #>(HANDOFF_TOSS_START_SPRITE_INFO)                        ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDY #player_getting_handoff                                   ; DOES PLAYER TO HAND OFF TO HIGH BIT = FAKE HANDOFF?
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BMI @do_fake_handoff                                          ; YES->FAKE HANDOFF
	
@do_regular_handoff                                               ; HANDOFF 
	JSR GET_TARGET_RAM_ADDR_AND_SAVE_IN_LOCAL                     ; GET PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDY #COLLISION_STATUS                                         ; DOES TARGET COLLISION = COLLIDED OR ON GROUND
	LDA (handoff_target_addr),Y                                   ; 
	AND #(PLAYER_ON_GROUND_BITFLAG + PLAYER_COLLIDED_BITFLAG)     ; 
	BNE @qb_handoff_delay                                         ; YES-> END OF HANDOFF DELAY BEFORE RETURNING TO NEXT COMMAND
	
@player_receives_handoff	
	JSR SET_PLAYER_NOT_MAN_NOT_BALL_CARRIER                       ; SET PLAYER MOVEMENT TO COM CONTROL AND PLAYER NOT BALL CARRIER()
	LDY #<(RB_RECEIVES_HANDOFF_START-1)                           ; LOAD RB TAKES BALL COMMAND ADDRESS
	LDX #>(RB_RECEIVES_HANDOFF_START-1)                           ; 
	JMP @save_command_addr                                        ; JUMP->LOAD COMMAND ADDRESS AND START OF HANDOFF TIME

@do_fake_handoff:                                                 ; FAKE HANDOFF
	JSR GET_TARGET_RAM_ADDR_AND_SAVE_IN_LOCAL                     ; GET PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	JSR UPDATE_P1_OR_P2_DISPLAYED_NAME                            ; UPDATE P1 OR P2 PLAYER ICON()
	LDA P1_MAN_POS_ID_ICON_STATUS                                         ; SET ICON VALUE STATUS = NOT CHANGING 
	AND #icon_not_changing_bitmask                                ;
	STA P1_MAN_POS_ID_ICON_STATUS                                         ;
	LDA P2_MAN_POS_ID_ICON_STATUS                                         ;
	AND #icon_not_changing_bitmask                                ;
	STA P2_MAN_POS_ID_ICON_STATUS                                         ;
	LDY #<(RB_FAKE_HANDOFF_ANIMATION-1)                           ; SET COMMAND ADDR = RB FAKE TAKE BALL ANIMATION COMMAND ADDRESS
	LDX #>(RB_FAKE_HANDOFF_ANIMATION-1)                           ; 
	
@save_command_addr:                                               ; LOAD COMMAND ADDRESS AND START OF HANDOFF TIME
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER (X,Y= ADDR, TARGET: $3E $3F)                    
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] QB_START_OF_HANDOFF_DELAY_FRAMES
	LDY #<(ARMS_EXTENDED_BALL_SPRITE_INFO)                        ; LOAD QB HANDOFF/TOSS ARMS EXTENDED SPRITE GRAPHIC ADDRESS 
	LDX #>(ARMS_EXTENDED_BALL_SPRITE_INFO)                        ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)

@qb_handoff_delay:                                                ; END OF HANDOFF DELAY BEFORE RETURNING TO NEXT COMMAND 
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] QB_END_OF_HANDOFF_DELAY_FRAMES
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; jump to DO NEXT PLAYER COMMAND

RB_RECEIVES_HANDOFF_START:                                        ; RB TAKES BALL CODE TO DO BEFORE RETURNING

position_bitmask		= $1F

	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @set_player_two_man_pos_id                                ; IS PLAYER 2? YES-> SET PLAYER 2 ICON HANDOFF

@set_plyayer_one_man_pos_id: 
	STA P1_MAN_POS_ID_ICON_STATUS                                        ; SET PLAYER 1 ICON VALUE = PLAYER ID
	JMP @rb_takes_handoff_animation                               ;    

@set_player_two_man_pos_id:                                       ; SET PLAYER 2 ICON HANDOFF
	AND #position_bitmask                                         ; SET PLAYER 2 ICON VALUE = PLAYER ID
	STA P2_MAN_POS_ID_ICON_STATUS                                           ; 
	
@rb_takes_handoff_animation:                                      ; 
	LDY #<(RB_TAKES_HANDFOFF_ANI_1_SPRITE_INFO)                   ; SET SPR ADDR =  RB TAKES HANDOFF SPRITE     
	LDX #>(RB_TAKES_HANDFOFF_ANI_1_SPRITE_INFO)                   ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] RUNNER_START_OF_HANDOFF_DELAY_FRAMES
	LDY #<(RB_TAKES_HANDFOFF_ANI_2_SPRITE_INFO)                   ; SET SPR ADDR =   RB TAKES HANDOFF SPRITE 2 
	LDX #>(RB_TAKES_HANDFOFF_ANI_2_SPRITE_INFO)                   ; 
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] RUNNER_END_OF_HANDOFF_DELAY_FRAMES
	JMP JUMP_DO_NEXT_PLAYER_COMMAND

RB_FAKE_HANDOFF_ANIMATION:                                        ; *** UNEEEDED IN CURRENT FORMAT RB FAKE TAKE BALL ANIMATION
	LDY #<(RB_TAKES_HANDFOFF_ANI_1_SPRITE_INFO)                   ; SET SPR ADDR =  RB TAKES HANDOFF SPRITE 
	LDX #>(RB_TAKES_HANDFOFF_ANI_1_SPRITE_INFO)                   ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] RUNNER_START_OF_HANDOFF_DELAY_FRAMES
	LDY #<(RB_TAKES_HANDFOFF_ANI_2_SPRITE_INFO)                   ; SET SPR ADDR =   RB TAKES HANDOFF SPRITE 2 
	LDX #>(RB_TAKES_HANDFOFF_ANI_2_SPRITE_INFO)                   ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] RUNNER_END_OF_HANDOFF_DELAY_FRAMES
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; JUMP-> DO NEXT PLAYER COMMAND

_F}_HANDOFF_LOGIC 

_F{_PITCH_BALL_LOGIC											  ; DONE			
		
target_addr 					= LOCAL_1
pitch_target					= EXTRA_PLAYER_RAM_3
	
PITCH_COMMAND_LOGIC:                                              ; 9x PITCH COMMAND CONT

@stop_qb_and_set_as_ball_carrier:
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	
@turn_qb_towards_target	
	LDY #pitch_target                                             ; LOAD PITCH TARGET
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR GET_TARGET_RAM_ADDR_AND_SAVE_IN_LOCAL                     ; GET PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	COPY_16_BIT_A[var1_var2] target_addr, CURRENT_TARGET_ADDR
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASED ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F)
	SET_CUR_PLAYER_DIRECTION                                      ; SAVE NEW DIRECTION IN PLAYER CURRENT DIRECTION 
	RETURN_PLAYER_ACTIONS_IN_1_FRAME

@update_qb_sprite:	
	LDY #<(HANDOFF_TOSS_START_SPRITE_INFO)                        ; LOAD QB HANDOFF/TOSS ADDR
	LDX #>(HANDOFF_TOSS_START_SPRITE_INFO)                        ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 8
	
@set_ball_movement_info_and_start_ani:	
	COPY_16_BIT_A[var1_var2] CURRENT_TARGET_ADDR, target_addr
	JSR SET_CUR_BALL_LOC_FINAL_EQU_TO_TARGET                      ; SET CURRENT BALL LOCATION, SET ADJUSTED FINAL BALL LOC BASED ON TARGET LOC(PLAYER AE, AF, TARGET 3E 3F)  
	LDA #PITCH_BALL_GRAVITY_INDEX                                 ; SET PITCH LOFT AMOUNT = 0x06
	STA BALL_GRAVITY_INDEX                                        ; 
	LDA #PITCH_BALL_SPEED                                         ; SET PITCH SPEED VALUE = 0x40
	STA BALL_SPEED                                                ; 
	LDA #BALL_LEAVING_HAND_BITFLAG                                ; SET BALL STATUS = BALL LEAVING HAND
	JSR SET_BALL_STATUS_MOVING_START_BALL_TASK                    ; UPDATE BALL STATUS BYTE AND START BALL ANIMATION TASK(A=BALL STATUS TO ADD TO BALL MOVING)    

_WHILE NOT_EQUAL:                                                 ; CHECK FOR PITCH GOING TO TARGET
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA BALL_COLLISION                                            ; DOES BALL STATUS = BALL LEAVING HAND?
	AND #BALL_LEAVING_HAND_BITFLAG                                ; 

_END_WHILE
	
@calculate_final_ball_location:	
	JSR CALULATE_FINAL_BALL_LOC_ON_TARGET                         ; CALCULATE FINAL BALL LOCATION BASED ON PLAYER SPEED NO OVERTHROW
	LDA #BALL_UPDATE_SCROLL_BITFLAG                               ; SET BALL STATUS =  UPDATE SCREEN SCROLL  
	JSR SET_BALL_STATUS_MOVING_START_BALL_TASK                    ; UPDATE BALL STATUS BYTE AND START BALL ANIMATION TASK(A=BALL STATUS TO ADD TO BALL MOVING)
	
@set_qb_no_longer_ball_carrier:	
	JSR SET_PLAYER_NOT_MAN_NOT_BALL_CARRIER                       ; SET PLAYER MOVEMENT TO COM CONTROL AND PLAYER NOT BALL CARRIER()
	SET_BALL_STATUS_SPECIAL_PITCH_IN_PROGRESS

@update_qb_sprite_arms_extended:
	LDY #<(ARMS_EXTENDED_BALL_SPRITE_INFO)                        ; SET SPR ADDR = QB HANDOFF/TOSS ARMS EXTENDED ADDR
	LDX #>(ARMS_EXTENDED_BALL_SPRITE_INFO)                        ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 3
	

	LDA #HANDOFF_CHR_BANK                                         ; SET CHAR 1800 SPRITE BANK TO #$0B
	STA SOFT_CHR_1800_BANK                                        ; 
	LDY #pitch_target                                             ; LOAD TARGET ID
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JSR GET_TARGET_RAM_ADDR_AND_SAVE_IN_LOCAL                     ; GET PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDY #COLLISION_STATUS                                         ; DOES TARGET COLLISION = COLLIDED OR ON GROUND
	LDA (target_addr),Y                                           ; 
	AND #PLAYER_COLLIDED_BITFLAG + PLAYER_ON_GROUND_BITFLAG       ; 
	BNE @pitch_complete                                           ; YES->FINISH PITCH DELAY
	
@update_target_command_addr_to_receive_pitch:	
	LDY #<(WAIT_FOR_PLAYER_RECEIVES_PITCH-1)                      ; SET COMMAND ADDR=  PLAYER RECEIVES PITCH 
	LDX #>(WAIT_FOR_PLAYER_RECEIVES_PITCH-1)                      ; 
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                          ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                    

@pitch_complete:                                                  ; FINISH PITCH DELAY
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 20
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; JUMP-> DO NEXT PLAYER COMMAND

							
WAIT_FOR_PLAYER_RECEIVES_PITCH:                                   ; PLAYER RECEIVES PITCH

_WHILE VALUE_CLEAR

	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	JSR UPDATE_P1_OR_P2_DISPLAYED_NAME                            ; UPDATE P1 OR P2 PLAYER ICON ABOVE HEAD()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL INFO = BALL COLLIDED 

_END_WHILE

@player_caught_pitch 
	JSR PLAY_CATCH_SOUND_END_BALL_ANI                             ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION =NOT MOVING & NOT BEING PITCHED()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; JUMP -> DO NEXT PLAY CODE

	
_F}_PITCH_BALL_LOGIC 

_F{_DIVE_TACKLE_LOGIC 											  ; DONE	

ball_carrier_addr 				= LOCAL_1
position_bitmask	 			= $0F
dive_speed_index				= EXTRA_PLAYER_RAM_3
end_of_dive_array				= $FF
collided_player_addr			= EXTRA_PLAYER_RAM_4


CHECK_FOR_DIVE[chance]:                                           ; CHECK FOR COM CONTROLLED PLAYER DIVE START (X= DIVE CHANCE)

@check_for_play_over	
	LDA PLAY_STATUS                                               ; DOES PLAY STATUS = PLAY OVER
	BMI @player_dive_tackle_start                                 ; YES->PLAYER DIVE START   BUG

@check_if_player_close_enough_to_dive_at	
	LOAD_CUR_PLAYER_COLLISION_STATUS                              ; IS PLAYER CLOSE ENOUGHT TO DIVE AT
	AND #PLAYER_NEAR_DIVE_BITFLAG                                 ; 
	BEQ @no_dive_exit                                             ; NO->NO DIVE EXIT
	
@set_player_not_close_enough_to_dive:	
	SET_CUR_PLAYER_NOT_CLOSE_TO_DIVE[] 
	CPX RANDOM_1                                                  ; DIVE CHANCE < RAND #?  
	BCC @no_dive_exit                                             ; YES->NO DIVE EXIT

@player_dive_tackle_start:                                       ; PLAYER DIVE START (OR MAN PRESSES B)
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                       ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	BCC @no_dive_exit                                             ; ANY PLAYERS CLOSE? NO->NO DIVE EXIT
	
	JSR COPY_MAN_PLAYER_ADDR_TO_TEMP                              ; COPY OFFENSE ACTIVE PLAYER POINTER TO 3E/3F()
	LDY #POSITION_ID                                              ; LOAD ACTIVE BALL CARRIER ID
	LDA (ball_carrier_addr),Y                                     ; 
	AND #position_bitmask                                          ; MASK OUT PLAYER 1/2 INFO
	
	LDX NUM_PLAYERS_CAN_COLLIDE                                   ; LOAD # OF COLLISION TARGETS
@check_if_col_targets_match_ball_carrier:                        ; CHECK IF ANY COLLISION TARGETS MATCH BALL CARRIER
	CMP PLAYERS_CAN_COLLIDE_WITH[]-1,X                                       ; DOES POSSIBLE COLLISION TARGET = ACTIVE BALL CARRIER
	BEQ @player_dive_for_tackle                                   ; YES->PLAYER DIVE FOR TACKLE START
	DEX                                                           ; # OF COLLISION TARGETS--  
	BNE @check_if_col_targets_match_ball_carrier                  ; ALL PLAYERS CHECKED? NO-> CHECK IF ANY COLLISION TARGETS MATCH BALL CARRIER

@no_dive_exit:                                                    ; NO DIVE EXIT
	RTS                                                           ; RETURN

@player_dive_for_tackle:                                          ; PLAYER DIVE FOR TACKLE START
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM                            ; SAVES to LAST two RAM slots  
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASED ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F)
	SET_CUR_PLAYER_DIRECTION                                      ; SET DEFENDER DIRECTION  = NEW DIRECTION
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDY #<(READY_TO_DIVE_SPRITE_DATA)                             ; LOAD READY TO DIVE ADDR
	LDX #>(READY_TO_DIVE_SPRITE_DATA)                             ; 
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] START_DIVE_TACKLE_DELAY_FRAMES
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; 
	AND #PLAYER_NOT_CHOP_NOT_DIVE_BITMASK                         ; SET TO NOT CHOP DIVE *** ONLY NEEDS EF ****
	ORA #PLAYER_DIVE_TACKLE_BITFLAG                               ; SET TO PLAYER DIVING FOR TACKLE
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #<(FLAT_ON_GROUND_SPRITE_DATA)                            ; SET SPR ADDR = PLAYER LYING FLAT ON GROUND/DIVE 
	LDX #>(FLAT_ON_GROUND_SPRITE_DATA)                            ; 
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	LDA #$00                                                      ; INITIALIZE DIVE SPEED INDEX TO 0
	LDY #dive_speed_index                                         ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 

@update_dive_speed_loop:                                          ; UPDATE DIVE SPEED UNTIL PLAYER HITS TARGET OR DIVE DONE
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR COPY_MAN_PLAYER_ADDR_TO_TEMP                              ; COPY OFFENSE ACTIVE PLAYER POINTER TO 3E/3F()
	JSR CHECK_PLAYER_NEAR_BLOCK_DIVE_TACKLE_TARGET            ; CHECK PLAYER WITHIN( 1 X, 0.75 Y YDS of target, RET C 0=NO, 1=YES
	BCS @diving_tackler_collided                                  ; YES-> DIVING DEFENDER ABOUT TO HIT TARGET
																  ; PLAYER NOT CLOSE ENOUGH
	LDY #dive_speed_index                                         ; DIVE SPEED INDEX++
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	TAX                                                           ; 
	CLC                                                           ;
	ADC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDA DIVE_TACKLE_SPEED_TABLE,X                                 ; LOAD DIVE SPEED VALUE FROM DIVE TACKLE SPEED ARRAY
	BMI @check_if_done_with_dive                                  ; IS VALUE NEGATIVE? YES-> CHECK IF AT END OF DIVE SPEED ARRAY

@update_player_dive_speed 
	SET_CUR_PLAYER_SPEED
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	JMP @update_dive_speed_loop                                   ; JUMP BACK TO UPDATE DIVE SPEED UNTIL PLAYER HITS TARGET OR DIVE DONE

@check_if_done_with_dive:                                         ; CHECK IF AT END OF DIVE SPEED ARRAY
	CMP #end_of_dive_array                                        ; AT END OF ARRAY?
	BNE @update_dive_speed_loop                                   ; NO->UPDATE DIVE SPEED UNTIL PLAYER HITS TARGET OR DIVE DONE
	JMP @end_of_dive_tackle_attempt                               ; JUMP-> END OF DIVE FOR TACKLE

@diving_tackler_collided:                                         ; DIVING DEFENDER ABOUT TO HIT TARGET
	LDY #<(JUMP_CHECK_FOR_TACKLE-1)                               ; SET COMMAND ADDR = CHECK FOR TACKLE COMMAND ADDRESS *** don't need jump addr
	LDX #>(JUMP_CHECK_FOR_TACKLE)                                 ; 
	JSR UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID                 ; LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER ( TARGET: $3E $3F)                     
	LDY #$00                                                      ; DOES TARGET COLLISION STATUS = PLAYER COLLIDED
	LDA (ball_carrier_addr),Y                                     ; 
	AND #PLAYER_COLLIDED_BITFLAG                                  ; 
	BEQ @target_not_collided_yet                                  ; NO->TARGET NOT COLLIDED LOAD TARGET POINTER IN DEFENDER RAM 1E 1F
	
@else_set_target_not_collided:	
	JSR SET_PLAYER_NOT_COLLIDED_IF_VALID_STILL_COLLIDED           ; SET TACKLET TARGET TO NOT COLLIDED($3E,$3F = PLAYER ADDR)

@target_not_collided_yet:                                         ; TARGET NOT COLLIDED LOAD TARGET POINTER IN DEFENDER RAM 1E 1F
	LDY #collided_player_addr                                     ; 
	LDA CURRENT_PLAYER_ADDR                                       ; 
	STA (ball_carrier_addr),Y                                     ;
	INY                                                           ;
	LDA CURRENT_PLAYER_ADDR+1                                     ;
	STA (ball_carrier_addr),Y                                     ; 

@end_of_dive_tackle_attempt:                                      ; END OF DIVE FOR TACKLE
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 2
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; SET PLAYER NOT DIVING FOR TACKLE, NOT CHOP DIVING
	AND #PLAYER_NOT_CHOP_NOT_DIVE_BITMASK                         ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	TAX                                                           ; 
	LOAD_CUR_PLAYER_COLLISION_STATUS                              ; 
	ORA #PLAYER_ON_GROUND_BITFLAG                                 ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	TXA                                                           ; DOES PLAYER MOVEMENT = PLAYER IS MAN
	AND #PLAYER_MAN_COM_BITFLAG                                   ;
	BNE @player_stand_up_delay                                    ; YES->20 FRAME DELAY AND SET PLAYER STATUS = NOT ON GROUND

@get_up_ground_delay	
	LDA #START_TO_STAND_FROM_DIVE_TACK_DELAY_FRAMES               ; LOAD 30 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	LDY #<(PLAYER_STANDING_UP_SPRITE_INFO)                        ; SET SPR ADDR =  PLAYER STANDING UP ADDR
	LDX #>(PLAYER_STANDING_UP_SPRITE_INFO)                        ;
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	LDA #STANDING_UP_FROM_DIVE_TACK_DELAY_FRAMES                  ; LOAD 10 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )

@player_stand_up_delay:                                           ; 20 FRAME DELAY AND SET PLAYER STATUS = NOT ON GROUND
	LDA #REGAIN_CONTROL_DIVE_TACK_FRAME_DELAY                     ; LOAD 20 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3) )
	LOAD_CUR_PLAYER_COLLISION_STATUS
	AND #PLAYER_NOT_ON_GROUND_BITMASK                             ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;  
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F ()
	
_F}_DIVE_TACKLE_LOGIC
	
_F{_SET_PLAYER_NOT_COLLIDED_IF_VALID_STILL_COLLIDED				 ; DONE  

colliding_player_addr  = LOCAL_1
other_player_addr_temp  = LOCAL_3
player_addr_index   = EXTRA_PLAYER_RAM_4

SET_PLAYER_NOT_COLLIDED_IF_VALID_STILL_COLLIDED:                  ; SET TACKLE TARGET TO NOT COLLIDED($3E,$3F = PLAYER ADDR)
	LDY #player_addr_index                                        ; SAVE TARGET ADDRESS IN $40,41 FROM 
	LDA (colliding_player_addr),Y                                 ;
	STA other_player_addr_temp                                    ;
	INY                                                           ;
	LDA (colliding_player_addr),Y                                 ; IS ADDR NOT VALID PLAYER RAM ADDR? 
	STA other_player_addr_temp +1                                 ;
	
@check_if_valid_addr: 
	BMI @exit                                                     ; YES->EXIT

@check_if_collided_still: 
	LDY #$00                                                      ; DOES PLAYER COLLISION = PLAYER COLLIDED
	LDA (other_player_addr_temp),Y                                ; 
	AND #PLAYER_COLLIDED_BITFLAG                                  ;
	BEQ @exit                                                     ; NO->EXIT
	
	
	LDY #COMMAND_COUNTER                                          ; SET COMMAND COUNTER TO 1 FRAME
	LDA #$01                                                      ;
	STA (other_player_addr_temp),Y                                ;
	INY                                                           ;
	LDA #<(JUMP_PLAYER_NO_LONGER_COLLIDED-1)                      ; *** Could use direct address rather than a jump to a jump
	STA (other_player_addr_temp),Y                                ;
	INY                                                           ;
	LDA #>(JUMP_PLAYER_NO_LONGER_COLLIDED-1)                      ;
	STA (other_player_addr_temp),Y                                ;
	LDY #COLLISION_COUNTER                                        ; SET TARGET COLLISION COUNTER = 0 FRAMES = WAIT UNTIL CHANGED
	LDA #$00                                                      ;
	STA (other_player_addr_temp),Y                                ;
@exit:                                                            ; EXIT
	RTS                                                           ; RETURN

_F}_SET_PLAYER_NOT_COLLIDED_IF_VALID_STILL_COLLIDED 
	
_F{_SET_PLAYER_SNAP_LOC_RELATIVE_TO_LOC							; DONE  

x_dist_high   = LOCAL_8                              
x_dist_low   = PLAYER_COMMAND_ARG2 
	
SET_PLAYER_SNAP_LOC_RELATIVE_TO_LOC:                              ; SET PLAYER LOCATION RELATIVE TO FIXED LOC(DD= X DIST LOW, A= Y LOC, X =HIGH BYTE DIST)
	STX x_dist_high                                               ; SAVE X DISTANCE HIGH BYTE
	LDY #Y_POS + 1                                                ; SAVE PLAYER Y LOCATION = Y LOCATION
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	DEY                                                           ; 
	LDA #$00                                                      ;  
	STA (CURRENT_PLAYER_ADDR),Y                                   ;  
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @set_player_two_x_loc                                     ; YES-> BRANCH TO PLAYER 2 SET X LOCATION

@set_player_one_x_loc:  
	LDA LOS_X                                                     ; PLAYER X LOW LOCATION = LOS X LOW LOCATION - X LOW DISTANCE
	SEC                                                           ;
	SBC x_dist_low                                                ;                            
	LDY #X_POS + 1                                                ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDA LOS_X + 1                                                 ; PLAYEX HIGH = LOS X HIGH LOCATION – X DISTANCE HIGH
	SBC x_dist_high                                               ; 
	JMP @set_player_x_loc_high                                    ; JUMP TO SAVE X HIGH BYTE LOCATION AND RETURN TO PROCESS NEXT PLAYER PLAY CODE
	
@set_player_two_x_loc:                                            ; PLAYER 2 SET X LOCATION
	LDA x_dist_low                                                ;  PLAYER X LOW LOCATION = X LOW DISTANCE + LOS X LOCATION
	CLC                                                           ;
	ADC LOS_X                                                     ;
	LDY #X_POS + 1                                                ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDA LOS_X +1                                                  ;
	ADC x_dist_high                                               ;
@set_player_x_loc_high:                                           ; SAVE X HIGH BYTE LOCATION AND RETURN TO PROCESS NEXT PLAYER PLAY CODE
	INY                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; JUMP TO PROCESS NEXT PLAYER PLAY CODE

_F}_SET_PLAYER_SNAP_LOC_RELATIVE_TO_LOC

_F{_QB_HIKE_ANIMATION                                             ; DONE  

head_animation_time     = EXTRA_PLAYER_RAM_3
head_turn_time_frames   = $12
delay_after_snap        = $07
	
DO_QB_HUT_ANI_CHECK_FOR_HIKE:                                     ; QB STANCE
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	JSR UPDATE_P1_OR_P2_DISPLAYED_NAME                            ; UPDATE PLAYER 1 OR PLAYER 2 ICON ABOVE HEAD()
	JSR SET_PLAYER_FACING_LEFT_OR_RIGHT                           ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)    
	LDY #<(QB_HEAD_FACING_DOWN_SPRITE_DATA)                       ; LOAD QB STANCE ADDR
	LDX #>(QB_HEAD_FACING_DOWN_SPRITE_DATA)                       ; 
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 15
	LDA #READY_DMC                                                ; LOAD READY SOUND INDEX
	JSR PLAY_SOUND                                                ; PLAY SOUND(A=SOUND)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 31
	LDA #DOWN_DMC                                                 ; LOAD DOWN SOUND INDEX
	JSR PLAY_SOUND                                                ; PLAY SOUND(A=SOUND) 
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 12
	
@qb_head_animation_loop:                                          ; QB TURNING HEAD ANIMATION START
	LDY #<(QB_HEAD_FACING_DOWN_SPRITE_DATA)                       ; SET ADDR =  QB HEAD FACING DOWN 
	LDX #>(QB_HEAD_FACING_DOWN_SPRITE_DATA)                       ;
	JSR @update_sprite_play_hut_check_snap                        ; UPDATE SPRITE, PLAY HUT SOUND, CHECK FOR SNAP(X,Y= ADDR)
	LDY #<(QB_SNAP_FACING_FORWARD_SPRITE_DATA)                    ; SET ADDR =   QB HEAD FACING MIDDLE  
	LDX #>(QB_SNAP_FACING_FORWARD_SPRITE_DATA)                    ;
	JSR @update_sprite_play_hut_check_snap                        ; UPDATE SPRITE, PLAY HUT SOUND, CHECK FOR SNAP(X,Y= ADDR)
	LDY #<(QB_SNAP_FACING_UP_SPRITE_DATA)                         ; SET ADDR =  QB HEAD FACING UP 
	LDX #>(QB_SNAP_FACING_UP_SPRITE_DATA)                         ;
	JSR @update_sprite_play_hut_check_snap                        ; UPDATE SPRITE, PLAY HUT SOUND, CHECK FOR SNAP(X,Y= ADDR)
	LDY #<(QB_SNAP_FACING_FORWARD_SPRITE_DATA)                    ; SET ADDR =  QB HEAD FACING MIDDLE 
	LDX #>(QB_SNAP_FACING_FORWARD_SPRITE_DATA)                    ;
	JSR @update_sprite_play_hut_check_snap                        ; UPDATE SPRITE, PLAY HUT SOUND, CHECK FOR SNAP(X,Y= ADDR)
	JMP @qb_head_animation_loop                                   ; JUMP TO QB TURNING HEAD ANIMATION START

@update_sprite_play_hut_check_snap:                               ; UPDATE SPRITE, PLAY HUT SOUND, CHECK FOR SNAP()
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	LDY #head_animation_time                                      ; SAVE HEAD TURN ANIMATION AND HUT SOUND TIMER  = 12 FRAMES 
	LDA #head_turn_time_frames                                    ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
@check_snap_head_turn_loop:                                       ; CHECK FOR SNAP AND HEAD TURN ANIMATION LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	IF_BALL_SNAPPED[ADDR] BALL_SNAPPED_QB
	LDY #head_animation_time                                      ; HEAD TURN ANIMATION AND HUT SOUND TIMER -- 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ; 
	SBC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BNE @check_snap_head_turn_loop                                ; TIMER=0? NO->CHECK FOR SNAP AND HEAD TURN ANIMATION LOOP
	LDA #HUT_DMC                                                  ; SET SOUND = HUT SOUND 
	JSR PLAY_SOUND                                                ; PLAY SOUND(A=SOUND)
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; JUMP->RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F ()

BALL_SNAPPED_QB:                                                  ; BALL SNAPPED
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE PLAYER SPRITE (MAN CONTROL READY TO MOVE, MOVING, STANDING STILL)
	LDA #delay_after_snap                                         ; LOAD 7 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3))
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; RETURN TO PROCESS NEXT PLAYE CODE COMMAND FOR PALYER

_F}_QB_HIKE_ANIMATION 

_F{_JUMP_TO_BLOCK_PASS_CHECK 										; DONE  

defender_addr 		= LOCAL_1
defender_x_loc		= LOCAL_1	
defender_y_loc		= LOCAL_5

SET_DEFENDERS_JUMPING_TO_BLOCK_PASS:                              ; CHECK IF THERE ARE ANY PLAYERS WHO CAN BLOCK PASS
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                       ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	BCS @pass_block_check_start                                   ; NO PLAYERS CLOSE->PLAYER PASS BLOCK LOOP START  
	RTS                                                           ; RETURN

@pass_block_check_start:                                                        ; PLAYER PASS BLOCK LOOP START
	JSR SET_PLAYER_FINAL_LOC_AFTER_KICK_PASS_BLOCK                 ; SET PLAYER FINAL X AND Y BLOCK LOCATION BASED ON DIRECTION(A=DIR) RET 43= Y, 41,40= X 
	
_WHILE NOT_EQUAL:                                                 ; CHECK CURRENT PLAYER
	LDX NUM_PLAYERS_CAN_COLLIDE                                   ; SET PLAYERS TO CHECK INDEX
	LDA PLAYERS_CAN_COLLIDE_WITH[]-1,X                                       ; LOAD CURRENT PLAYER TO CHECK
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPP PLAYER POINTER AND STORE IN 3E 3F(A=POSITION ID)
	LDA defender_addr                                             ; SAVE DEFENDER POINTER in $B2,$B3
	STA TEMP_PASS_BLOCK_DEF_ADDR                                  ;
	LDA defender_addr+1                                           ;
	STA TEMP_PASS_BLOCK_DEF_ADDR+1                                ;
	LDY #Y_POS + 1                                                ; SAVE DEFENDER Y LOC IN $42
	LDA (TEMP_PASS_BLOCK_DEF_ADDR),Y                              ; 
	STA defender_y_loc                                                       ; 
	LDY #X_POS + 1                                                ; SAVE DEFENDER X LOC IN $3E,$3F
	LDA (TEMP_PASS_BLOCK_DEF_ADDR),Y                              ; 
	STA defender_x_loc	                                          ; 
	INY                                                           ;
	LDA (TEMP_PASS_BLOCK_DEF_ADDR),Y                              ; 
	STA defender_x_loc +1	                                      ; 
	
@check_player_within_limits	
	LDY #PASS_BLOCK_LIMIT_X                                       ; LOAD Y PASS BLOCK LIMIT = 3 YARDS
	LDX #PASS_BLOCK_LIMIT_Y                                       ; LOAD X PASS BLOCK LIMIT = 3 YARDS
	JSR PASS_BLOCK_KICK_BLOCK_LIMIT_CHECK                         ; (X= X LIMIT, Y= Y LIMIT, $3E,3F/$42=X/Y PLAYER LOCATION, $40,$41/$43= LOCATION TO CHECK VS )
	BCC @check_next_defender                                      ; WITHIN LIMITS? NO-> CHECK NEXT DEFENDER OR EXIT IF DONE
	
@do_pass_block:
	LDA TEMP_PASS_BLOCK_DEF_ADDR                                  ; RESTORE DEFENDER POINTER 
	STA defender_addr                                             ;
	LDA TEMP_PASS_BLOCK_DEF_ADDR+1                                  ;
	STA defender_addr +1                                          ;
	LDY #<(CHECK_FOR_PASS_BLOCK-1)                                ; SET COMMAND ADDR = PASS BLOCK ROUTINE
	LDX #>(CHECK_FOR_PASS_BLOCK-1)                                ; 
	JSR UPDATE_PLAYER_COMMAND_ADDR_NOT_COL_JUMP_ON_GROUND         ; IF PLAYER IS VALID PLAYER POINTER LOAD COMMAND ADDRESS()

	

@check_next_defender:                                             ; CHECK NEXT DEFENDER OR EXIT IF DONE
	DEC NUM_PLAYERS_CAN_COLLIDE                                   ; PLAYERS TO CHECK INDEX --
	
_END_WHILE                                                        ; DONE? NO->CHECK CURRENT PLAYER

@exit:
	RTS                                                           ; RETURN

_F}_JUMP_TO_BLOCK_PASS_CHECK 

_F{_KICK_BLOCK_CHECK 											 ; DONE 
	
defender_addr 		= LOCAL_1	
defender_x_loc		= LOCAL_1
defender_y_loc		= LOCAL_5
O
	
CHECK_PLAYER_CLOSE_ENOUGH_BLOCK_KICK:                             ; CHECK FOR PLAYER CLOSE ENOUGH TO BLOCK KICK()
	LOAD_CUR_PLAYER_POSITION_ID
	AND #$80                                                      ;
	EOR #$80                                                      ;
	JSR GET_P1_P2_RAM_ADDR                                        ; GET PLAYER POINTER(A= POSITION ID + P1 OR P2 INFO)
	LDA defender_addr                                             ; SAVE FIRST DEFENDER (RE) PLAYER POINTER IN B2,B3
	STA TEMP_KICK_BLOCK_DEF_ADDR                                  ;
	LDA defender_addr +1                                          ;
	STA TEMP_KICK_BLOCK_DEF_ADDR +1                               ;
	JSR SET_PLAYER_FINAL_LOC_AFTER_KICK_PASS_BLOCK                ; SET PLAYER FINAL X AND Y BLOCK LOCATION BASED ON DIRECTION(A=DIR) RET 43= Y, 41,40= X 
	
	LDA #$00                                                      ; SET CURRENT PLAYER BEING CHECKED = FIRST PLAYER
	STA CURRENT_KICK_BLOCK_DEFENDER                               ;
	LDA #NUM_DEFENDERS_ON_FIELD                                   ; SET NUMBER OF PLAYER LEFT TO CHECK = ALL = 11 
	STA NUM_KICK_BLOCK_PLAYERS_TO_CHECK                           ; 
	
_WHILE NOT_EQUAL   
     
@check_player_loc_vs_kick_block_limits:	 
	LDY #Y_POS + 1                                                ; SET $42=  DEFENDER Y LOCATION 
	LDA (TEMP_KICK_BLOCK_DEF_ADDR),Y                              ;
	STA defender_y_loc                                            ;
	LDY #X_POS + 1                                                ; SET $3F,3E= DEFENDER X LOCATION 
	LDA (TEMP_KICK_BLOCK_DEF_ADDR),Y                              ;
	STA defender_x_loc                                            ;
	INY                                                           ;
	LDA (TEMP_KICK_BLOCK_DEF_ADDR),Y                              ;
	STA defender_x_loc+1                                          ;
	LDY #KICK_BLOCK_LIMIT_Y                                       ; LOAD KICK BLOCK Y LIMIT = 2.75 YARDS 
	LDX #KICK_BLOCK_LIMIT_X                                       ; LOAD KICK BLOCK X LIMIT = 2.75 YARDS
	JSR PASS_BLOCK_KICK_BLOCK_LIMIT_CHECK                         ; (X= X LIMIT, Y= Y LIMIT, $3E,3F/$42=X/Y PLAYER LOCATION, $40,$41/$43= LOCATION TO CHECK VS ) 
	BCC @set_to_next_defender:                                    ; CAN’T BLOCK->CHECK NEXT DEFENDER OR EXIT IF DONE

@save_player_starter_id	
	LDY #POSITION_ID                                              ; = PLAYER ID + DEFENDER OFFSET 
	LDA (TEMP_KICK_BLOCK_DEF_ADDR),Y                              ;
	CLC                                                           ;
	ADC #OFFSET_TO_FIRST_DEFENSIVE_STARTER                        ; = ROSTER ID
	AND #$1F                                                      ; MASK OUT P1/P2 SIDE INFO
	STA DEF_SACK_BALL_BLOCK_STARTER_ID                            ; SET CUTSCENE PLAYER = ROSTER ID
	INC CURRENT_KICK_BLOCK_DEFENDER                               ; CURRENT PLAYER BEING CHECKED++

@set_to_next_defender:                                            ; CHECK NEXT DEFENDER OR EXIT IF DONE
	LDA TEMP_KICK_BLOCK_DEF_ADDR                                  ; DEFENDER PLAYER POINTER += OFFSET TO NEXT PLAYER 
	CLC                                                           ;
	ADC #SIZE_OF_EACH_PLAYER_RAM                                  ;
	STA TEMP_KICK_BLOCK_DEF_ADDR                                   ;
	LDA TEMP_KICK_BLOCK_DEF_ADDR+1                                ;
	ADC #$00                                                      ;
	STA  TEMP_KICK_BLOCK_DEF_ADDR+1                               ;

@check_if_done	
	DEC NUM_KICK_BLOCK_PLAYERS_TO_CHECK                           ; NUMBER OF PLAYER LEFT TO CHECK--

_END_WHILE

	RTS                                                           ; RETURN

_F}_KICK_BLOCK_CHECK	

_F{_SET_FINAL_KICK_BLOCK_LOC 											 ; DONE 	

direction_bitmask			= $E0	
final_x_loc					= LOCAL_3
final_y_loc					= LOCAL_6
	
SET_PLAYER_FINAL_LOC_AFTER_KICK_PASS_BLOCK:                       ; SET PLAYER FINAL X AND Y BLOCK LOCATION BASED ON DIRECTION(A=DIR) RET 43= Y, 41,40= X
	LOAD_CUR_PLAYER_DIRECTION
	CLC                                                           ; 
	ADC #$10                                                      ; 
	AND #direction_bitmask                                        ; 
	DIVIDE_16
	TAX                                                           ;
	LDA PASS_KICK_BLOCK_PLAYER_LOC_ADJUST_TABLE,X                 ; LOAD FINAL Y LOCATION ADJUSTMENT FROM BLOCK PASS OR KICK ADJUST DISTANCE TABLE
	LDY #Y_POS + 1                                                ; =  DEFENDER Y + Y ADJUST VALUE 
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA final_y_loc                                                       ; SAVE in $43
	
@set_final_x_location: 	
	LDA PASS_KICK_BLOCK_PLAYER_LOC_ADJUST_TABLE+1,X               ;   
	LDY #X_POS + 1                                                ; SET 41,40 = DEFENDER X + X ADJUST VALUE FROM BLOCK PASS OR KICK ADJUST DISTANCE TABLE
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA final_x_loc                                          ; 
	INY                                                           ;  
	LDA PASS_KICK_BLOCK_PLAYER_LOC_ADJUST_TABLE+1,X               ; 
	AND #$80                                                      ; 
	BEQ @save_high_byte                                           ;
	LDA #$FF                                                      ; SUBTRACT 1 FROM HIGH BYTE IF ADJUST IS NEGATIVE VALUE

@save_high_byte:                                                  ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA final_x_loc+1                                        ; SAVE in $41
	RTS                                                           ; RETURN


_F}_SET_FINAL_KICK_BLOCK_LOC

_F{_FINAL_KICK_PASS_BLOCK_CHECKS_AND_ANIMATIONS						; DONE
	
qb_addr = LOCAL_1	


CHECK_FOR_PASS_BLOCK:                                             ; PASS BLOCK ROUTINE
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 4
	JSR JUMP_UP_FOR_BALL                                                   ; JUMP UP ANIMATION()
	JSR COPY_MAN_PLAYER_ADDR_TO_TEMP                              ; COPY OFFENSE ACTIVE PLAYER POINTER TO 3E/3F()
	LDY #POSITION_ID                                              ; LOAD QB ID
	LDA (qb_addr),Y                                               ; 
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID                          ; GET ACTUAL PLAYER AND TEAM(A=POSITION ID) RET X=TEAM A= PLAYER 
	LDY #AVOID_PASS_BLOCK_INDEX                                   ; LOAD AVOID PASS BLOCK SKILL INDEX
	JSR GET_PLAYER_SKILL_OR_FACE                                  ; GET SKILL RATING(A=PLAYER, Y=SKILL TO GET, X=TEAM)
	LDA CUTSCENE_CHANCE                                           ; 
	AND #PASS_BLOCK_CUTSCENE_CHANCE                               ; 
	BNE @pass_block_check_with_cutscene                           ; 25% to check for block with cutscene

																  ; PASS BLOCK CHECK NO CUTSCENE
	LDA RANDOM_3                                                  ; IS RANDOM NUMBER > PASS BLOCK VALUE FROM PASS BLOCK TABLE
	CMP AVOID_PASS_BLOCK_VALUES_TABLE,Y                           ;
	BCS @no_pass_block_no_cutscene                                ; YES- NO PASS BLOCK NO CUTSCENE
	JSR @check_if_ball_blocked_already                            ; CHECK IF PASS BLOCKED ALREADY BY ANOTHER PLAYER AND IF PLAYER CLOSE ENOUGH()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 3
	JSR @check_if_ball_blocked_already                            ; CHECK IF PASS BLOCKED ALREADY BY ANOTHER PLAYER AND IF PLAYER CLOSE ENOUGH()
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP @land_from_jump                                           ; JUMP->LAND FROM JUMP START


	
@no_pass_block_no_cutscene:                                       ; NO PASS BLOCK NO CUTSCENE
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 4

@land_from_jump:                                                  ; LAND FROM JUMP START
	JSR LAND_FROM_JUMP                                            ; LAND FROM JUMP ANIMATION()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 3
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET DEFENDER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 30
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; JUMP TO DO NEXT PLAYER COMMAND

@pass_block_check_with_cutscene:                                  ; PASS BLOCK CHECK WITH CUTSCENE
	LOAD_CUR_PLAYER_POSITION_ID									  ; 
	CLC                                                           ; 
	ADC #OFFSET_TO_FIRST_DEFENSIVE_STARTER                        ;                  
	AND #$1F                                                      ; MASK OUT P1 PR P2 SIDE INFO
	STA DEF_SACK_BALL_BLOCK_STARTER_ID                             ; SET CUTSCENE PLAYER = DEFENDER ID =PASS BLOCKER 
	LDA RANDOM_3                                                  ; IS RANDOM NUMBER > PASS BLOCK VALUE FROM PASS BLOCK TABLE
	CMP AVOID_PASS_BLOCK_VALUES_TABLE,Y                           ; 
	BCS @set_to_pass_block_miss_cutscene                          ; YES-> PASS BLOCK MISS CUTSCENE 
	JSR @check_if_ball_blocked_already                            ; CHECK IF PASS BLOCKED ALREADY BY ANOTHER PLAYER AND IF PLAYER CLOSE ENOUGH()
	BCC @set_to_pass_block_miss_cutscene                          ; 
	
@set_to_pass_block_cutscene	
	LDA #BLOCK_BALL_SCENE_ID                                      ; SET CUTSCENE =  PASS BLOCK MISS CUTSCENE
	JMP @play_cutscene_land_from_jump                             ; JUMP->PLAY CUTSCENE AND GO TO LAND FROM JUMP
@set_to_pass_block_miss_cutscene:                                 ; PASS BLOCK MISS CUTSCENE
	LDA #BLOCK_MISS_SCENE_ID                                      ; SET CUTSCENE =  PASS BLOCK MISS CUTSCENE 

@play_cutscene_land_from_jump:                                    ; PLAY CUTSCENE AND GO TO LAND FROM JUMP
	JSR SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0             ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCNE RAND TO 1
	JMP @land_from_jump                                           ; JUMP-? LAND FROM JUMP START

@check_if_ball_blocked_already:                                   ; CHECK IF PASS BLOCKED ALREADY BY ANOTHER PLAYER AND IF PLAYER CLOSE ENOUGH()
	BIT BALL_STATUS                                               ; IS  PASS ALREADY BLOCKED
	BVS @no_block_exit                                            ; YES-> CAN’T BLOCK BALL EXIT
	JSR CHECK_IF_BALL_CATCHABLE_AFTER_JUMP                        ; CHECK FOR BALL OOB, OR NOT CATCHABLE AFTER JUMPING()
	BCC @no_block_exit                                            ; NO->CAN’T BLOCK BALL EXIT
	JSR CHECK_IF_PASS_INTD_CAUGHT_FUMBLED                           ; CHECK IF PASS INTERCEPTED OR BLOCKED. SET PASS TO BLOCKED IF NOT()
	RTS                                                           ; RETURN

@no_block_exit:                                                   ; CAN’T BLOCK BALL EXIT
	CLC                                                           ; CLC= CAN’T BLOCK BALL
	RTS                                                           ; RETURN

CHECK_IF_PASS_INTD_CAUGHT_FUMBLED:                                  ; CHECK IF PASS INTERCEPTED OR BLOCKED. SET PASS TO BLOCKED IF NOT()
	LDA BALL_STATUS                                               ; DOES PASS STATUS = TIPPED OR INTERCEPTED?
	AND #(BALL_INTERCEPTED_BITFLAG + BALL_CAUGHT_BITFLAG + BALL_FUMBLED_BITFLAG)      ;  
	BNE @cant_block_ball_exit                                     ; YES-> CAN’T BLOCK BALL EXIT
	JSR SET_BALL_BLOCKED_DO_BLOCKED_ANI                           ; STORE BALL BLOCKED CODE AND CREATE THREAD()              
	SEC                                                           ; SET CARRY = CAN BLOCK BALL
	RTS                                                           ; RETURN
	
@cant_block_ball_exit:                                                        ; CAN’T BLOCK BALL EXIT
	CLC                                                           ; CLC= CAN’T BLOCK BALL
	RTS                                                           ; RETURN

_F}_FINAL_KICK_PASS_BLOCK_CHECKS_AND_ANIMATIONS
	
_F{_FUMBLE_KICK_BLOCK_RECOVERY_LOGIC							  ; DONE

player_recover_delay       	= $03 
player_adjust_delay_frames 	= $05                                  ; ends up being a multplier of the recover delay
recover_chance       		= $3F
player_adjust_time_left    	= EXTRA_PLAYER_RAM_3

RECOVER_BALL_LOOP:                                                ; FA RECOVER BALL COMMAND continued
																; ADJUST PLAYER DIRECTION TOWARDS BALL FUMBLE
	JSR GET_PLAYER_DIRECTION_TOWARDS_FINAL_BALL                   ; CHECK FOR FINAL BALL LOCATION VS PLAYER()
	BCS @reset_player_dir_adjust_delay                            ; 
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME 
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE GRAPHIC (MAN/COM AI STANDING, STANDING STILL, MOVING) 
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

@reset_player_dir_adjust_delay:                                   ; INITIALIZE DIRECTION CHANGE TIMER
	LDA #player_adjust_delay_frames                               ; SET PLAYER CHANGE DIRECTION TOWARDS FUMBLED BALL TIMER = 5 FRAMES
	LDY #player_adjust_time_left                                  ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 

_WHILE NOT_EQUAL                                                  ; FUMBLE RECOVER CHECK LOOP
	LDA #player_recover_delay                                     ; LOAD 3 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3)              
	JSR CHECK_IF_BALL_CAN_BE_RECOVERED                            ; CHECK FOR FUMBLE RECOVERY() 
	BCS @do_player_recovered_fumble                               ; RECOVERED? YES->FUMBLE RECOVERED START

@decrement_dir_change_timer: 
	LDY #player_adjust_time_left                                  ; ADJUST DIRECTION TIMER--
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SEC                                                           ; 
	SBC #$01                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 

_END_WHILE
	
JMP RECOVER_BALL_LOOP                                          ; YES->ADJUST PLAYER DIRECTION TOWARDS BALL FUMBLE

@do_player_recovered_fumble:                                      ; FUMBLE RECOVERED START
	JSR BLOCKED_KICK_FUMBLED_BALL_RECOVERED                                                 ; FINISH FUMBLE/ BLOCK KICK RECOVERY()
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 7
	JMP JUMP_DO_NEXT_PLAYER_COMMAND                               ; JUMP TO DO NEXT COMMAND CODE

CHECK_IF_BALL_CAN_BE_RECOVERED:                                   ; FUMBLE RECOVERY CHECK
	IF_BALL_CAN_BE_RECOVERED[ADDR] BALL_NOT_RECOVERED 
	JSR CHECK_PLAYER_CLOSE_ENOUGH_TO_BALL                         ; PLAYER CLOSE ENOUGH TO BALL()? 
	BCC BALL_NOT_RECOVERED                                        ; NO->BALL CAN’T BE RECOVERED
	LDA RANDOM_1                                                  ; IS RANDOM >0X3F = 25% CHANCE FOR RECOVERY
	CMP #recover_chance                                           ; 
	BCC BALL_RECOVERED                                            ; RECOVERED? YES->BALL RECOVERED

@check_ball_still_fumbled: 
	IF_BALL_NOT_FUMBLED[ADDR] BALL_NOT_RECOVERED 
	JSR DO_FUMBLE_ANI                                             ; START BALL BOUNCING ANIMATION THREAD()
	
BALL_NOT_RECOVERED:                                               ; BALL CAN’T BE RECOVERED
	CLC                                                           ; CLEAR CARRY = BALL CAN’T BE RECOVERED
	RTS                                                           ; RETURN
	
BALL_RECOVERED:                                                  ; BALL RECOVERED
	SEC                                                           ; SET CARRY = BALL RECOVERED
	RTS                                                           ; RETURN

recovery_player         = LOCAL_5
recovery_play_type      = LOCAL_6

BLOCKED_KICK_FUMBLED_BALL_RECOVERED:                              ; FINISH FUMBLE/ BLOCK KICK RECOVERY
	JSR PLAY_CATCH_SOUND_END_BALL_ANI                             ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION =NOT MOVING & NOT BEING PITCHED()
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	LDA #GET_RECOVERY_TYPE_BANK                                   ; SET BANK = 26 
	LDY #<BANK_JUMP_CHECK_FUMBLE_RECOVERY_TYPE                    ; SET ADDR =CHECK RECOVERY TYPE() *** can use direct address
	LDX #>BANK_JUMP_CHECK_FUMBLE_RECOVERY_TYPE                    ; 
	JSR SWAP_8000_BANK_AND_JUMP_RETURN
	LDA recovery_play_type                                        ; IS RECOVERY TYPE = KICK,PUNT OR FG?
	BMI @kickoff_punt_fg_recovery                                 ; YES-> KICKOFF, PUNT OR FG BLOCK RECOVERY 
	JSR UPDATE_P1_OR_P2_DISPLAYED_NAME                            ; UPDATE PLAYER 1 OR PLAYER 2 ICON ABOVE HEAD()
	JMP @set_fumble_recovery_team_and_ball_recovered              ; JUMP-> END OF FUMBLE OR BLOCK KICK RECOVERY

@kickoff_punt_fg_recovery:                                        ; KICKOFF, PUNT OR FG BLOCK RECOVERY 
	LDA recovery_player                                           ; LOAD RECOVERY PLAYER ICON VALUE
	JSR SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; UPDATE P1 OR P2 ICON(A= PLAYER VALUE)

@set_fumble_recovery_team_and_ball_recovered:                     ; END OF FUMBLE OR BLOCK KICK RECOVERY
	JSR SET_BALL_HIT_GROUND_AND_WHO_TOUCHED_LAST                  ; SET BALL STATUS TO BALL HIT GROUND AND SET BALL STATUS WHO RECOVERED BALL()
	SET_BALL_STATUS_SPECIAL_BALL_RECOVERED[]  
	RTS                                                           ; RETURN
	
_F}_FUMBLE_KICK_BLOCK_RECOVERY_LOGIC 

_F{_CHOP_BLOCK_LOGIC                                              ; DONE

position_bitmask  = $0F 
target_addr    = LOCAL_1
chop_block_position_id = EXTRA_PLAYER_RAM_3
current_chop_speed  = EXTRA_PLAYER_RAM_4
dive_completed   = $FF 

CHOP_BLOCK_LOGIC_LOOP:                                            ; CHOP BLOCK START CHECK FOR TARGET CLOSE ENOUGH
	
@load_player_to_chop_block 
	LDY #chop_block_position_id                                   ; LOAD TARGET TO CHOP 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	
@check_if_blocker_in_direction_of_target:
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPPONENT POINTER LOCATION AND PUT IN 3E 3F(A=POSITION ID)
	JSR WAIT_FOR_TARGET_OFF_GROUND_NOT_DIVING                     ; WAIT FOR PLAYER TO STOP DIVING OR BE OFF GROUND TO BLOCK()
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASED ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F)  
	BCS @check_for_players_close_to_collision                     ; ALREADY IN CORRECT DIRECTION? YES-> DO CHOP BLOCK
	
@move_blocker_in_direction_of_target:  
	JSR UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE             ; UPDATE PLAYER DIRECTION AND RS RP DEPENDING ON DIRECTION CHANGE(A=DIRECTION)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE GRAPHICS (QB READY/ STANDING STILL, RUNNING)
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()

@check_for_players_close_to_collision:                            ; CHECK FOR PLAYERS CLOSE TO COLLIDING CHOP BLOCK
	LDA #CHOP_BLOCK_SEARCH_DELAY_FRAMES                           ; LOAD 8 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                          ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES+ RAND(0 to 3))
	JSR CHECK_OFF_OR_DEF_CLOSE_TO_COLLISION                          ; CHECK PLAYERS CLOSE TO COLLISION STATUS() RET $E1=  # PLYRS CAN COLLIDE A=FIRST PLAYER
	BCC CHOP_BLOCK_LOGIC_LOOP                                     ; NO PLAYERS CLOSE->CHOP BLOCK START, CHECK FOR TARGET CLOSE ENOUGH
	
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET OPPONENT POINTER LOCATION AND PUT IN 3E 3F(A=POSITION ID)
	
@is_blocker_on_ground_check:  
	LOAD_CUR_PLAYER_COLLISION_STATUS                              ; 
	AND #PLAYER_ON_GROUND_BITFLAG                                 ; 
	BNE CHOP_BLOCK_LOGIC_LOOP                                     ; YES-> CHOP BLOCK START CHECK FOR TARGET CLOSE ENOUGH
	
@does_closest_target_match_player_to_chop: 
	LDY #POSITION_ID                                              ; DOES TARGET POSITION ID = PLAYER TO CHOP
	LDA (target_addr),Y                                           ; 
	AND #position_bitmask                                         ; 
	LDY #chop_block_position_id                                   ; 
	CMP (CURRENT_PLAYER_ADDR),Y                                   ; 
	BNE CHOP_BLOCK_LOGIC_LOOP                                     ; NO->CHOP BLOCK START CHECK FOR TARGET CLOSE ENOUGH 
	
@start_chop_block                                                 ; START CHOP BLOCK
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	LDY #<(READY_TO_DIVE_SPRITE_DATA)                             ; SET SPR ADDR = READY TO DIVE SPRITE
	LDX #>(READY_TO_DIVE_SPRITE_DATA)                             ; 
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] START_CHOP_BLOCK_DELAY_FRAMES                 
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; 
	AND #$E7                                                      ; SET TO NOT CHOP BLOCKING , NOT DIVING FOR TACKLE ***only neeeD F7****
	ORA #PLAYER_CHOP_BLOCK_BITFLAG                                ; SET TO OFFENSE CHOP BLOCKING 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 

@rotate_player_90_degrees:  
	LOAD_CUR_PLAYER_DIRECTION                                     ; SET PLAYER DIRECTION = DIRECTION + 90 DEGREES
	CLC                                                           ; 
	ADC #$40                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #<(FLAT_ON_GROUND_SPRITE_DATA)                            ; SET SPR ADDR =LYING FLAT ON GROUND/DIVE
	LDX #>(FLAT_ON_GROUND_SPRITE_DATA)                            ; 
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)

@restore_player_direction: 
	LOAD_CUR_PLAYER_DIRECTION                                     ; 
	SEC                                                           ;
	SBC #$40                                                      ; SET PLAYER DIRECTION = DIRECTION - 90 DEGREES (RESTORES original direction)
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	
@set_chop_speed_to_zero:  
	LDA #$00                                                      ; INITIALIZE CHOP DIVE SPEED = ZERO
	LDY #current_chop_speed                                       ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	
@chop_dive_speed_and_col_check_loop:                              ; CHOP DIVE SPEED AND COLLISION CHECK LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR GET_FOUR_CLOSESET_PLAYERS_IF_NOT_COLLIDED                 ; CHECK IF COLLIDING WITH PLAYERS ()
	BCC @update_player_chop_dive_speed                            ; NO PLAYERS->UPDATE PLAYER SPEED DURING CHOP DIVE
	
	
	LDY #chop_block_position_id                                   ; DOES PLAYER TO CHOP = CLOSEST PLAYER CAN COLLIDE
	CMP (CURRENT_PLAYER_ADDR),Y                                   ; 
	BEQ @player_collided_set_speed_to_zero                        ; YES->PLAYER COLLIDED WITH TARGET, SET VELOCITY TO ZERO, 1 SEC DELAY TILL NEXT CHOP CHECK

@update_player_chop_dive_speed:                                   ; UPDATE PLAYER SPEED DURING CHOP DIVE
	LDY #current_chop_speed                                       ; SAVE CURRENT CHOP DIVE SPEED ARRAY INDEX
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ; 
	CLC                                                           ; CHOP DIVE SPEED ARRAY INDEX ++ FOR NEXT RUN THROUGH
	ADC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDA CHOP_BLOCK_DIVE_SPEED_ARRAY,X                             ; LOAD SPEED VALUE FROM CHOP DIVE ARRAY
	BMI @check_for_chop_block_dive_done                           ; IS VALUE NEGATIVE? YES->CHECK FOR CHOP DIVE COMPLETED

@save_updated_speed 
	SET_CUR_PLAYER_SPEED
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	JMP @chop_dive_speed_and_col_check_loop                       ; JUMP TO CHOP DIVE SPEED AND COLLISION CHECK LOOP

@check_for_chop_block_dive_done:                                  ; CHECK FOR CHOP DIVE COMPLETED
	CMP #dive_completed                                           ; 
	BNE @chop_dive_speed_and_col_check_loop                       ; NO->CHOP DIVE LOOP
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 60
	JMP CHOP_BLOCK_LOGIC_LOOP                                     ; JUMP TO CHOP BLOCK START CHECK FOR TARGET CLOSE ENOUGH

@player_collided_set_speed_to_zero:                               ; PLAYER COLLIDED WITH TARGET, SET VELOCITY TO ZERO, 1 SEC DELAY TILL NEXT CHOP CHECK
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 60
	JMP CHOP_BLOCK_LOGIC_LOOP                                     ; JUMP TO CHOP BLOCK START CHECK FOR TARGET CLOSE ENOUGH

_F}_CHOP_BLOCK_LOGIC 

_F{_DIVE_SPEED_TABLE                                              ; DONE
	
DIVE_TACKLE_SPEED_TABLE:                                          ; DEFENSE DIVE SPEED ARRAY (exponential decay?)
	.DB $40                                                       ; SET CURRENT SPEED = 0X40 = 
	.DB $80                                                       ; WAIT 12 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $2C                                                       ; SET CURRENT SPEED = 0X2C = 50 DEFENSE MS = 150 MS
	.DB $80                                                       ; WAIT 8 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $18                                                       ; SET CURRENT SPEED = 0X18 = 25 OFFENSE MS
	.DB $80                                                       ; WAIT 6 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $0E                                                       ; SET CURRENT SPEED = 0X0E = 06 RS
	.DB $80                                                       ; WAIT 4 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $08                                                       ; SET CURRENT SPEED = 0X08 
	.DB $80                                                       ; WAIT 4 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $00                                                       ; SET CURRENT SPEED = 0X00
	.DB $FF                                                       ; DIVE OVER
	
_F}_DIVE_SPEED_TABLE

_F{_KICK_METER_TILE_INFO                                          ; DONE

P1_BLUE_KICK_METER_TILES:                                         ; BLUE KICK POWER METER TILES P1
	.DB KB_BLUE_FULL_TILE_ID                                      ; BLUE FULLY FILLED
	.DB P1_KB_BLUE_ONE_QTR_FILL_TILE_ID                           ; BLUE 1/4 FILLED LEFT TO RIGHT
	.DB P1_KB_BLUE_HALF_FULL_TILE_ID                              ; BLUE 1/2 FILLED LEFT TO RIGHT
	.DB P1_KB_BLUE_THREE_QTR_FILL_TILE_ID                         ; BLUE 3/4 FILLED LEFT TO RIGHT

P1_RED_KICK_METER_TILES:                                          ; RED KICK POWER METER TILES P1 
	.DB P1_KB_RED_ONE_QTR_FILL_TILE_ID                            ; TILE 1/4 RED FILLED LEFT TO RIGHT
	.DB P1_KB_RED_HALF_FULL_TILE_ID                               ; TILE 1/2 RED FILLED LEFT TO RIGHT
	.DB P1_KB_RED_THREE_QTR_FILL_TILE_ID                          ; TILE 3/4 RED FILLED LEFT TO RIGHT
	.DB KB_RED_FULL_TILE_ID                                       ; TILE FULLY RED FILLED 

P2_BLUE_KICK_METER_TILES:                                         ; BLUE KICK POWER METER TILES P2 
	.DB KB_BLUE_FULL_TILE_ID                                      ; BLUE FULLY FILLED 
	.DB P2_KB_BLUE_ONE_QTR_FILL_TILE_ID                           ; BLUE 1/4 FILLED RIGHT TO LEFT
	.DB P2_KB_BLUE_HALF_FULL_TILE_ID                              ; BLUE 1/2 FILLED RIGHT TO LEFT
	.DB P2_KB_BLUE_THREE_QTR_FILL_TILE_ID                         ; BLUE 3/4 FILLED RIGHT TO LEFT

P2_RED_KICK_METER_TILES:                                          ; RED KICK POWER METER TILES P2
	.DB P2_KB_RED_ONE_QTR_FILL_TILE_ID                            ; TILE 1/4 RED FILLED RIGHT TO LEFT
	.DB P2_KB_RED_HALF_FULL_TILE_ID                               ; TILE 1/2 RED FILLED RIGHT TO LEFT
	.DB P2_KB_RED_THREE_QTR_FILL_TILE_ID                          ; TILE 3/4 RED FILLED RIGHT TO LEFT
	.DB KB_RED_FULL_TILE_ID                                       ; TILE FULLY RED FILLED 

_F}_KICK_METER_TILE_INFO 

_F{_MAN_COVERAGE_ADJUST_TABLE                                     ; DONE

TIGHTER_COVERAGE_FINAL_LOC_ADJ_TABLE:                             ; 0X00 DEFENDER MAN COVERAGE TIGHTER COVERAGE (1/4 YARD)
.DB $00 , $FA                                                   ; Y FINAL LOC ADJUST, X FINAL LOC ADJUST
.DB $FE , $FB
.DB $FC , $FC
.DB $FB , $FE
.DB $FA , $00
.DB $FB , $02
.DB $FC , $04
.DB $FE , $05
.DB $00 , $06
.DB $02 , $05
.DB $04 , $04
.DB $05 , $02
.DB $06 , $00
.DB $05 , $FE
.DB $04 , $FC
.DB $02 , $FB
							

LOOSER_COVERAGE_FINAL_LOC_ADJ_TABLE :                             ; 0X10 DEFNDER MAN COVERAGE LOOSER COVERAGE (3/4 YARD)
																; Y FINAL LOC ADJUST, X FINAL LOC ADJUST
.DB $00 , $F4                                                   ;
.DB $FC , $F6
.DB $F8 , $F8
.DB $F6 , $FC
.DB $F4 , $00
.DB $F6 , $04
.DB $F8 , $08
.DB $FC , $0A
.DB $00 , $0C
.DB $04 , $0A
.DB $08 , $08
.DB $0A , $04
.DB $0C , $00
.DB $0A , $FC
.DB $08 , $F8
.DB $04 , $F6

_F}_MAN_COVERAGE_ADJUST_TABLE

_F{_DPAD_TO_DIRECTION_ANGLE_TABLE                                 ; DONE

DPAD_TO_ANGLE_LOOKUP_TABLE:                                       ; DIRECTION PAD TO ANGLE LOOKUP
	.DB $00                                                       ; no direction
	.DB $80                                                       ; 1= RIGHT= #80
	.DB $00                                                       ; 2= LEFT = #00
	.DB $00                                                       ; IMPOSSIBLE 
	.DB $C0                                                       ; 4= DOWN= #C0
	.DB $A0                                                       ; 5= DOWN+ RIGHT= #A0
	.DB $E0                                                       ; 6= DOWN+ LEFT = #E0
	.DB $00                                                       ; IMPOSSIBLE 
	.DB $40                                                       ; 8= UP= #40
	.DB $60                                                       ; 9= UP + RIGHT
	.DB $20                                                       ; 10=UP + LEFT
	.DB $00                                                       ; IMPOSSIBLE
	.DB $00                                                       ; IMPOSSIBLE
	.DB $00                                                       ; IMPOSSIBLE
	.DB $00                                                       ; IMPOSSIBLE
	.DB $00                                                       ; IMPOSSIBLE

_F}_DPAD_TO_DIRECTION_ANGLE_TABLE

_F{_DEFENDER_BITMASK_TABLE                                       ; DONE
		
DEFENDER_BITMASK_TABLE:                                          ; PLAYER POSITION TO SET TO COLLIDE/BLOCK BITMASK LOOKUP TABLE

.DB $80, $00                                                      ; Index=0= QB/RE
.DB $40, $00                                                      ; Index=1= RB1/NT
.DB $20, $00                                                      ; Index=2= RB2/LE
.DB $10, $00                                                      ; Index=3= WR1/ROLB
.DB $08, $00                                                      ; Index=4= WR2/RILB
.DB $04, $00                                                      ; Index=5= TE1/LILB 
.DB $02, $00                                                      ; Index=6= C/LOLB
.DB $01, $00                                                      ; Index=7= LG/RCB
.DB $00, $80                                                      ; Index=8= RG/LCB
.DB $00, $40                                                      ; Index=9= LT/FS
.DB $00, $20                                                      ; Index=10= RT/SS

_F}_DEFENDER_BITMASK_TABLE  

_F{_CHOP_BLOCK_DIVE_SPEED_ARRAY                                   ; DONE

CHOP_BLOCK_DIVE_SPEED_ARRAY:                                      ; CHOP BLOCK DIVE SPEED ARRAY
	.DB $3E                                                       ; SET PLAYER CURRENT SPEED = 0X3E 
	.DB $80                                                       ; WAIT 7 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $20                                                       ; SET PLAYER CURRENT SPEED = 0X20
	.DB $80                                                       ; WAIT 5 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $10                                                       ; SET PLAYER CURRENT SPEED = 0X10
	.DB $80                                                       ; WAIT 3 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ; 
	.DB $08                                                       ; SET PLAYER CURRENT SPEED = 0X08
	.DB $80                                                       ; WAIT 4 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $00                                                       ; SET PLAYER CURRENT SPEED = 0X00
	.DB $FF                                                       ; END OF DIVE

_F}_CHOP_BLOCK_DIVE_SPEED_ARRAY  
		
_F{_PASS_KICK_BLOCK_PLAYER_ADJUST_TABLE                           ; DONE

PASS_KICK_BLOCK_PLAYER_LOC_ADJUST_TABLE:                          ; BLOCKED PASS/KICK PLAYER LOCATION ADJUSTMENT TABLE
	
																  ; Y ADJ   X ADJ
.DB $00, $E8
.DB $EE, $EE
.DB $E8, $00
.DB $EE, $12
.DB $00, $18
.DB $12, $12
.DB $18, $00
.DB $12, $EE 

_F}_PASS_KICK_BLOCK_PLAYER_ADJUST_TABLE

_F{_KICK_ANIMATION_SPRITE_ADJUST_ARRAY                            ; DONE


KICKER_SPR_Y_ADJUST_ARRAY:                                        ; KICKING Y LOCA ADJUSTMENT ARRAY FOR KICK ANIMATION      
	.DB $FF                                                       ; UP 1/8 YARD
	.DB $00                                                       ;
	.DB $FF                                                       ; UP 1/8 YARD
	.DB $00                                                       ;
	.DB $00                                                       ;
	.DB $FF                                                       ; UP 1/8 YARD
	.DB $00                                                       ;
	.DB $00                                                       ;
	.DB $00                                                       ;
	.DB $00                                                       ;
	.DB $01                                                       ; DOWN 1/8 YARD
	.DB $00                                                       ;
	.DB $00                                                       ;
	.DB $01                                                       ; DOWN 1/8 YARD
	.DB $00                                                       ;
	.DB $01                                                       ; DOWN 1/8 YARD
	.DB $80                                                       ; ANIMATION DONE
	
_F}_KICK_ANIMATION_SPRITE_ADJUST_ARRAY

_F{_TARGET_SPEED_VS_PASS_SPEED_ARRAY                              ; DONE
	
PASS_SPEED_VS_TARGET_SPEED_ADJUST_TABLE:                          ; TARGET SPEED x2 vs PASS SPEED ADJUSTMENT TABLE
							
	.DB $E0                                                       ; 0x00
	.DB $E2                                                       ;
	.DB $E4                                                       ;
	.DB $E6                                                       ;
	.DB $E8                                                       ;
	.DB $EA                                                       ;
	.DB $EC                                                       ;
	.DB $EE                                                       ;
	.DB $F0                                                       ;
	.DB $F2                                                       ;
	.DB $F4                                                       ;
	.DB $F6                                                       ;
	.DB $F8                                                       ;
	.DB $FA                                                       ;
	.DB $FC                                                       ;
	.DB $FE                                                       ;
	
	.DB $00                                                       ; 0x10
	
	.DB $01                                                       ; 
	.DB $02                                                       ; 
	.DB $03                                                       ;
	.DB $05                                                       ;
	.DB $06                                                       ;
	.DB $07                                                       ;
	.DB $08                                                       ;
	.DB $09                                                       ;
	.DB $0A                                                       ;
	.DB $0B                                                       ;
	.DB $0C                                                       ;
	.DB $0E                                                       ;
	.DB $0F                                                       ;
	.DB $10                                                       ;
	.DB $11                                                       ; 0x1F
	
_F}_TARGET_SPEED_VS_PASS_SPEED_ARRAY 

_F{_RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                              ; DONE
	
num_frames = LOCAL_8

RETURN_IN_NUM_FRAMES_PLUS_0_TO_3:                                 ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES AFTER CHECK ALL PLAYERS)
	STA num_frames                                                ; SAVE # FRAMES
	LDA PLAYERS_LEFT_TO_UPDATE                                    ; = PLAYERS LEFT TO UPDATE 
	CLC                                                           ;
	ADC FRAME_COUNTER                                             ; + FRAME COUNTER 
	AND #$03                                                      ; MAKE VALUE BETWEEN 0-3
	CLC                                                           ;
	ADC num_frames                                                ;
	JMP WAIT_UPDATE_PLAYER_NUM_FRAMES                             ; UPDATE PLAYER LOCATIONS AND RETURN IN (#FRAMES)

_F}_RETURN_IN_NUM_FRAMES_PLUS_0_TO_3 

_F{_SET_PLAYER_CAN_CANT_KICK_BALL								; DONE

																;EXTRA_PLAYER_RAM_1
												   ; *** routines way to long since $065F not used       
SET_PLAYER_CAN_KICK_BALL:                          ; SET PLAYER COLLISION TO CAN KICK  BALL()
	LDX #$00                                       ; 
	LDA UNUSED_KICK_MEMORY                         ;
	
_WHILE CC                                          ;
	ASL                                            ; 065F ALWAYS = 80 
	BCC @end                                       ; check for 
	INX                                            ; NEVER REACHES HERE
	CPX #$08                                       ;
_END_WHILE                                         ;
	JMP INFINITE_LOOP                              ; infinite loop

@end:                                              ; 
	LDA UNUSED_KICK_MEMORY                         ; 065F NEVER USED FOR ANYYTHING ALWAYS SET TO 80
	ORA UNUSED_KICK_MEMORY_ARRAY,X                 ; X will always be 0 
	STA UNUSED_KICK_MEMORY                         ; LOAD 80
	TXA                                            ;     
	ASL                                            ;
	ASL                                            ; 
	LDY #EXTRA_PLAYER_RAM_1                        ;
	STA (CURRENT_PLAYER_ADDR),Y                    ;
	TAX                                            ;
	LOAD_CUR_PLAYER_COLLISION_STATUS
	ORA #CAN_KICK_BALL_BITFLAG                     ;
	STA (CURRENT_PLAYER_ADDR),Y                    ;
	RTS                                            ; RETURN

SET_PLAYER_CANT_KICK_BALL:                        ; SET PLAYER COLLISION TO CANT KICK  BALL()
	LDY #EXTRA_PLAYER_RAM_1                                       ; DON’T THINK THIS IS USED
	LDA (CURRENT_PLAYER_ADDR),Y                    ;
	LSR                                            ;
	LSR                                            ;
	TAX                                            ;
	LDA UNUSED_KICK_MEMORY_ARRAY,X                 ;
	EOR #$FF                                       ;
	AND UNUSED_KICK_MEMORY                         ;
	STA UNUSED_KICK_MEMORY                          ;
	LOAD_CUR_PLAYER_COLLISION_STATUS
	AND #CANT_KICK_BALL_BITMASK                    ; 
	STA (CURRENT_PLAYER_ADDR),Y                    ; 
	RTS                                            ; RETURN

_F}_SET_PLAYER_CAN_CANT_KICK_BALL 

_F{_UNUSED_KICK_ARRAY                                             ; DONE NOT NEEDED

UNUSED_KICK_MEMORY_ARRAY:                                                  
	.DB $80
	.DB $40
	.DB $20
	.DB $10
	.DB $08
	.DB $04
	.DB $02
	.DB $01
	
_F}_UNUSED_KICK_MEMORY_ARRAY

_F{_WAIT_TO_BLOCK_FUNCTION                                        ; DONE

block_target_addr   = LOCAL_1
check_off_ground_delay  = $09
position_to_block   = EXTRA_PLAYER_RAM_3
final_block_delay   = $11 

WAIT_FOR_TARGET_OFF_GROUND_NOT_DIVING:                            ; WAIT FOR PLAYER TO STOP DIVING OR BE OFF GROUND TO BLOCK()
	LDY #COLLISION_STATUS                                         ; DOES TARGET COLLISION = PLAYER ON GROUND 
	LDA (block_target_addr),Y                                     ; 
	AND #PLAYER_ON_GROUND_BITFLAG                                 ; 
	BNE @check_player_close_enough_to_block                       ; YES?->PLAYER DIVING OR ON GROUND
	INY                                                           ; 
	LDA (block_target_addr),Y                                     ; DOES TARGET MOVEMENT = PLAYER CHOP BLOCKING/ DEFENDER DIVING 
	AND #(PLAYER_CHOP_BLOCK_BITFLAG + PLAYER_DIVE_TACKLE_BITFLAG)                                               
	BEQ @cant_block_player                                        ; NO-> EXIT
	
@check_player_close_enough_to_block:                              ; PLAYER DIVING OR ON GROUND
	JSR CHECK_PLAYER_NEAR_BLOCK_DIVE_TACKLE_TARGET            ; CHECK PLAYER WITHIN( 1 X, 0.75 Y YDS of target, RET C 0=NO, 1=YES)
	BCS @set_current_player_to_standing_still                     ; IS PLAYER CLOSE ENOUGH? YES->PLAYER CLOSE ENOUGH TO BLOCK
	
@cant_block_player:                                               ; EXIT
	RTS                                                           ; RETURN

@set_current_player_to_standing_still:                            ; PLAYER CLOSE ENOUGH TO BLOCK
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()

	_WHILE NOT_EQUAL                                              ; WAIT UNTIL TARGET OFF GROUND LOOP
	
@check_if_player_off_ground: 
	LDA #check_off_ground_delay                                   ; LOAD 9 FRAMES 
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                         
	LDY #position_to_block                                        ; LOAD PLAYER TO BLOCK
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	JSR GET_OPP_PLAYER_RAM_ADDR_AND_SAVE_IN_LOCAL                 ; GET DEFENDER POINTER LOCATION AND PUT IN 3E 3F() 
	LDY #COLLISION_STATUS                                         ; DOES TARGET COLLISION = ON GROUND?
	LDA (block_target_addr),Y                                     ; 
	AND #PLAYER_ON_GROUND_BITFLAG                                 ; 
	
	_END_WHILE                                                    ; YES->WAIT UNTIL TARGET OFF GROUND LOOP

@check_if_player_diving_chop_blocking: 
	INY                                                           ;
	LDA (block_target_addr),Y                                     ; DOES TARGET MOVEMENT = PLAYER CHOP BLOCKING/ DEFENDER DIVING
	AND #(PLAYER_CHOP_BLOCK_BITFLAG + PLAYER_DIVE_TACKLE_BITFLAG) ;
	_END_WHILE                                                    ; YES->WAIT UNTIL TARGET OFF GROUND LOOP
	
	LDA #final_block_delay                                        ; LOAD 17 FRAMES
	JSR RETURN_IN_NUM_FRAMES_PLUS_0_TO_3                                        
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F ()

_F}_WAIT_TO_BLOCK_FUNCTION 
	
_F{_JUMP_FORWARD_BY_AMOUNT_PLAY_CODE_ADDR                         ; DONE 
	
UPDATE_CUR_PLAYER_PLAY_CODE_ADDR_BY_AMT:                          ; UPDATE PLAY CODE ADDRESS POINTER BY AMOUNT(A= AMOUNT)
	LDY #PLAY_CODE_ADDR                                           ; SAVE PLAYER PLAYER CODE ADDRESS + AMOUNT
	CLC                                                           ; 
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	ADC #$00                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RTS                                                           ; RETURN 

_F}_JUMP_FORWARD_BY_AMOUNT_PLAY_CODE_ADDR 
	
_F{_COPY_MAN_PLAY_PTR_TO_TEMP_FUNCTIONS                           ; DONE

man_player_addr_temp = LOCAL_1

COPY_MAN_PLAYER_ADDR_TO_TEMP:                                     ; COPY OFFENSE ACTIVE PLAYER POINTER TO 3E/3F()
	BIT POSSESSION_STATUS                                         ; IS P2 ON OFFENSE? 
	BVS @copy_p2_man_player_addr_to_temp                          ; YES->P2 ON OFFENSE

@copy_p1_man_player_addr_to_temp: 
	COPY_16_BIT_A[var1_var2] P1_MAN_PLAYER_ADDR, man_player_addr_temp
	RTS                                                
	
@copy_p2_man_player_addr_to_temp:                                 ; P2 ON OFFENSE
	COPY_16_BIT_A[var1_var2] P2_MAN_PLAYER_ADDR, man_player_addr_temp
	RTS                                                           ; RETURN

_F}_COPY_MAN_PLAY_PTR_TO_TEMP_FUNCTIONS 

_F{_SET_PLAYER_IS_BALL_CARRIER_FUNCTIONS                          ; DONE

SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS:                          ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL
	JSR SET_PLAYER_IS_BALL_CARRIER_CAN_COLLIDE_CAN_BLOCK_ALL      ; SET PLAYER IS BALL CARRIER, SET PLAYER CAN COLLIDE AND CAN BLOCK ALL DEFENDERS()
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @set_player_two_has_ball                                  ; YES->SET POSSESION TO PLAYER 2

@set_player_one_has_ball:  
	SET_POSSESSION_STATUS_P1_HAS_BALL
	RTS                                                           ; RETURN
	
@set_player_two_has_ball:                                         ; SET POSSESION TO PLAYER 2
	SET_POSSESSION_STATUS_P2_HAS_BALL
	RTS                                                           ; RETURN

_F}_SET_PLAYER_IS_BALL_CARRIER_FUNCTIONS 

_F{_UPDATE_MAN_CONTROLLED_PLAYER_ADDR                             ; DONE
	
UPDATE_MAN_CONTROL_PLAYER_PTR:                                    ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @update_p2_man_controlled_addr                            ; IS PLAYER 2? YES- CURRENT PLAYER TO PLAYER 2

@update_p1_man_controlled_addr:   
	COPY_16_BIT_XY[var1_var2] CURRENT_PLAYER_ADDR, P1_MAN_PLAYER_ADDR
	RTS                                                           ; RETURN
	
@update_p2_man_controlled_addr:                                   ; CURRENT PLAYER TO PLAYER 2
	COPY_16_BIT_XY[var1_var2] CURRENT_PLAYER_ADDR, P2_MAN_PLAYER_ADDR
	RTS                                                           ; RETURN

_F}_UPDATE_MAN_CONTROLLED_PLAYER_ADDR 

_F{_UPDATE_DISPLAYED_NAME                                         ; DONE

player_side_bitmask  = $1F
pass_target_addr  = CURRENT_TARGET_ADDR

UPDATE_P1_OR_P2_DISPLAYED_NAME:                                   ; UPDATE P1 OR P2 NAME ABOVE HEAD AFTER CHANGE OF BALL()
	LOAD_CUR_PLAYER_POSITION_ID
	EOR POSSESSION_STATUS                                         ; 
	BPL @offense_displayed_name_change                            ; YES-> OFFENSE NAME CHANGE
							
@defense_displayed_name_change:                                   ; DEFENSE NAME CHANGE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; LOAD POSITION ID 
	AND #player_side_bitmask                                      ; MASK OUT PLAYER ID SIDE INFO
	CLC                                                           ; + OFFSET TO DEFENSE
	ADC #RE_STARTER_ID                                            ; 
	JMP SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; UPDATE P1 OR P2 NAME VALUE(A= PLAYER ID)

@offense_displayed_name_change:                                   ; OFFENSE NAME CHANGE
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; LOAD POSITION ID 
	AND #player_side_bitmask                                      ; MASK OUT PLAYER SIDE
	JMP SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; UPDATE P1 OR P2 NAME(A= PLAYER ID)

SET_DISPLAYED_NAME_TO_PASS_TARGET:                                ; CHANGE P1/P2 NAME VALUE TO PLAYER GETTING BALL   
	LDY #POSITION_ID                                              ; DOES PLAYER SIDE = OFFENSE?
	LDA (pass_target_addr),Y                                      ; 
	EOR POSSESSION_STATUS                                         ; 
	BPL @set_displayed_name_to_pass_target                        ; YES->OFFENSE TARGET NAME CHANGE

@set_displayed_name_to_defender:                                  ; *** should be impossible to reach can't target defender
	LDA (pass_target_addr),Y                                      ; MASK OUT TARGET ID SIDE INFO
	AND #player_side_bitmask                                      ; 
	CLC                                                           ;
	ADC #RE_STARTER_ID                                            ; + OFFSET TO DEFENSE
	JMP SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; UPDATE P1 OR P2 NAME(A= PLAYER VALUE)

@set_displayed_name_to_pass_target:                               ; OFFENSE TARGET NAME CHANGE
	LDA (pass_target_addr),Y                                      ; LOAD TARGET ID
	AND #player_side_bitmask                                      ; MASK OUT POSESSION
	JMP SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE                  ; *** UNEEDED JUMP SINCE ITS NEXT INSTRUCTION 

SET_P1_OR_P2_DISPLAYED_NAME_NEEDS_CHANGE:                         ; UPDATE P1 OR P2 NAME VALUE(A= PLAYER ID)
	TAX                                                           ; SAVE PLAYER ID    
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @set_p2_displayed_name_to_needs_change                    ; YES->SET CHANGING PLAYER 2 NAME (X= PLAYER ID)

@set_p1_displayed_name_to_needs_change:
	TXA                                                           ; DOES PLAYER ID = P1 CURRENT NAME
	CMP P1_MAN_POS_ID_ICON_STATUS                                         ; 
	BEQ @p1_exit                                                     ; YES->EXIT
	ORA #$40                                                      ; ELSE SAVE PLAYER ID VALUE + 0X40 INDICATING NAME CHANGE
	STA P1_MAN_POS_ID_ICON_STATUS                                        ; 
@p1_exit:                                                            ; *** wasteful 
	RTS                                                           ; RETURN

@set_p2_displayed_name_to_needs_change:                           ; SET CHANGING PLAYER 2 NAME (X= PLAYER ID)
	TXA                                                           ; 
	CMP P2_MAN_POS_ID_ICON_STATUS                                         ; IS PLAYER ID = P2 CURRENT NAME
	BEQ @p2_exit                                                     ; YES->EXIT
	ORA #$40                                                      ; ELSE SAVE PLAYER ID VALUE +  0X40 INDICATING NAME CHANGE
	STA P2_MAN_POS_ID_ICON_STATUS                                        ;
@p2_exit:                                                            ; EXIT
	RTS                                                           ; RETURN

CLEAR_P1_OR_P2_DISPLAYED_NAME:                                    ; SET OFFENSE OVERHEAD NAME VALUE TO NONE
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @clear_p2_displayed_name:                                 ; IS PLAYER 2? YES->PLAYER 2 ICON VALUE CHANGE 

@clear_p1_displayed_name:  
	LDA #$FF                                                      ; SET P1 ICON VALUE == CHANGING
	STA P1_MAN_POS_ID_ICON_STATUS                                         ; 
	RTS                                                           ; RETURN
	
@clear_p2_displayed_name:                                         ; PLAYER 2 ICON VALUE CHANGE 
	LDA #$FF                                                      ; SET P2 ICON VALUE == CHANGING
	STA P2_MAN_POS_ID_ICON_STATUS                                        ;
	RTS                                                           ; RETURN

_F}_UPDATE_DISPLAYED_NAME

_F{_SET_PLAYER_BALL_CARRIER_COLLIDE_ALL                           ; DONE

SET_PLAYER_IS_BALL_CARRIER_CAN_COLLIDE_CAN_BLOCK_ALL:             ; SET PLAYER IS BALL CARRIER, SET PLAYER CAN COLLIDE AND CAN BLOCK ALL DEFENDERS
	SET_CURRENT_PLAYER_IS_BALL_CARRIER[]
	
SET_CAN_COLLIDE_CAN_BLOCK_ALL:                                    ; SET PLAYER CAN COLLIDE AND CAN BLOCK ALL DEFENDERS
	SET_COLLIDE_BITMASK_ALL_PLAYERS
	JSR SET_CAN_COLLIDE_USING_PLAYERS_BITMASK                     ; UPDATE CAN COLLIDE BITMASKS (X,Y= OFF OR DEF BITMASK)
	SET_COLLIDE_BITMASK_ALL_PLAYERS
	JMP SET_CAN_BLOCK_STATUSES                                    ; UPDATE PLAYERS TO BLOCK (X,Y= BITMASK OF PLAYERS TO BLOCK) REDUNDANT?

_F}_SET_PLAYER_BALL_CARRIER_COLLIDE_ALL
	
_F{_SET_PLAYER_TO_COM_CONTROL_NOT_BALL_CARRIER                    ; DONE

SET_PLAYER_NOT_MAN_NOT_BALL_CARRIER:                              ; SET PLAYER MOVEMENT =COM CONTROL, PLAYER NOT BALL CARRIER
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; SET PLAYER COM CONTROL, NOT BALL CARRIER
	AND #$9F                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RTS                                                           ; RETURN
	
_F}_SET_PLAYER_TO_COM_CONTROL_NOT_BALL_CARRIER

_F{_SET_PLAYER_TO_CANT_COLLIDE_ON_GROUND                          ; DONE	 

PAUSE_COLL_CHECK_SET_PLAYER_NOT_COLL:                             ; PAUSE COLLISION CHECK AND SET PLAYER COLLISION=NOT COLLIDED, ON GROUND
	LDY #COLLISION_COUNTER                                        ; SET COLLISION COUNTER == 0 = COLLISION CHECK PAUSED
	LDA #$00                                                      ;  
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LOAD_CUR_PLAYER_COLLISION_STATUS                              ; 
	AND #PLAYER_NOT_COLLIDED_BITMASK                              ; SET PLAYER COLLISION = PLAYER NOT COLLIDED
	ORA #PLAYER_ON_GROUND_BITFLAG                                 ; SET PLAYER COLLISION = PLAYER ON GROUND
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	JMP SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        

_F}_SET_PLAYER_TO_CANT_COLLIDE_ON_GROUND   

_F{_UPDATE_COLLIDED_SPRITE_FUNCTIONS                              ; DONE

defender_addr   = LOCAL_1
collided_player_addr = EXTRA_PLAYER_RAM_4
	
TURN_PLAYERS_TOWARDS_EACH_OTHER_COLL:                             ; UPDATE DIRECTIONS FOR COLLIDED SPRITES()
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/3F()                   
	JSR GET_DIRECTION_TO_TARGET                                   ; GET DIRECTION TOWARDS TARGET BASE ON TARGET LOCATION (PLAYER AE, AF, TARGET 3E 3F)
	SET_CUR_PLAYER_DIRECTION
	JSR COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL                        ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/3F() 
	LOAD_CUR_PLAYER_DIRECTION                                     ; SET PLAYER DIRECTION  == OPPOSITE DIRECTION  
	EOR #$80                                                      ; 
	STA (defender_addr),Y                                         ; 
	RTS                                                           ; RETURN

SET_COLL_SPRITES_NOT_MOVING_UPDATE_SPRITE:                        ; KEEP PLAYER PAUSED/UPDATE SPRITE GRAPHIC AND INDEX BOTH PLAYERS
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY = ZERO, STATUS TO NOT MOVING()
	LDY #<(COLLIDED_PLAYERS_SPRITE_INFO)                          ; SET ADDR = PLAYER GRAPPLING ADDR
	LDX #>(COLLIDED_PLAYERS_SPRITE_INFO)                          ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	COPY_16_BIT_A[var1_var2] CURRENT_PLAYER_ADDR, defender_addr
	LDY #collided_player_addr                                     ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ;
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA CURRENT_PLAYER_ADDR+1                                     ;
	STX CURRENT_PLAYER_ADDR                                       ;

@set_defender_to_not_moving_update_sprite: 
																; SET OTHER PLAYER TO NOT MOVING AND UPDATE SPRITE GRAPHIC
	JSR @save_sprite_indexes                                      ; SAVE SPRITE INDEX AND EXTRA SPRITE INDEX IN $B8,B9() 
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY = ZERO, STATUS TO NOT MOVING()                        
	LDY #<(COLLIDED_PLAYERS_SPRITE_INFO)                          ; SET ADDR = PLAYER GRAPPLING ADDR
	LDX #>(COLLIDED_PLAYERS_SPRITE_INFO)                          ;
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	COPY_16_BIT_A[var1_var2] defender_addr, CURRENT_PLAYER_ADDR, 
	JSR @save_sprite_indexes                                      ; UPDATE SPRITE INDEX AND EXTRA SPRITE INDEX() FOR FIRST PLAYER
	CLC                                                           ; 
	RTS                                                           ; RETURN

@save_sprite_indexes:                                             ; SAVE SPRITE INDEX AND EXTRA SPRITE INDEX IN $B8,B9()
	LDY #SPRITE_INDEX                                             ; SET $B8= SPRITE INDEX 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA PLAYER_SPR_INDEX_TEMP                                     ; 
	INY                                                           ; SET $B9= EXTRA SPRITE INDEX 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	STA EXTRA_SPR_INDEX_TEMP                                      ;
	RTS                                                           ; RETURN

_F}_UPDATE_COLLIDED_SPRITE_FUNCTIONS 
	
_F{_UPDATE_PLAYER_RAM_ADDR_FUNCTIONS                              ; DONE

return_addr = EXTRA_PLAYER_RAM_4
player_addr = LOCAL_1

COPY_ADDR_FROM_PLAYER_RAM_TO_LOCAL:                               ; SAVE PLAYER RAM 1E/1F VALUES IN PLAYER POINTER 3E/EF
	LDY #return_addr                                              ; SET PLAYER RAM (1E,1F) = PLAYER POINTER (3E,3F) 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA player_addr                                               ; 
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA player_addr+1                                               ; 
	RTS                                                           ; RETURN

UPDATE_CURRENT_PLAYER_COMMAND_ADDR:                               ;  LOAD COMMAND ADDRESS AND UPDATE COMMAND COUNTER (X,Y= ADDR TARGET ) 
	TYA                                                           ; SET PLAYER COMMAND ADDRESS = NEW COMMAND ADDRESS
	LDY #COMMAND_ADDR                                             ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; 
	TXA                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #COMMAND_COUNTER                                          ; SET PLAYER COMMAND COUNTER = 1 FRAME
	LDA #$01                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RTS                                                           ; RETURN

UPDATE_PLAYER_COLL_ADDR:                                          ; UPDATE COLLISION LOGIC ADDRESS AND COLLISION COUNTER(X,Y= ADDR TARGET= AE POINTER)
	TYA                                                           ; SET PLAYER COLLISION ADDRESS = NEW COLLISION ADDRESS 
	LDY #COLLISION_ADDR                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	TXA                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDY #COLLISION_COUNTER                                        ; SET PLAYER COLLISION COUNTER TO 1 FRAME 
	LDA #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN

	
player_addr  = LOCAL_1
low_byte_addr = LOCAL_8

UPDATE_PLAYER_COMMAND_ADDR_NOT_COL_JUMP_ON_GROUND:                ; LOAD COMMAND ADDRESS IF PLAYER IS NOT COLLIDED, ON GROUND JUMPING
	STY low_byte_addr                                             ; SAVE LOW BYTE OF ADDRESS
	LDY #$00                                                      ; DOES PLAYER COLLISION = COLLIDED,ON GROUND, OR JUMPING
	LDA (player_addr),Y                                           ; 
	AND #(PLAYER_COLLIDED_BITFLAG + PLAYER_ON_GROUND_BITFLAG + PLAYER_JUMPING_BITFLAG)                                            
	BEQ @ok_to_update_addr                                        ; NO-> LOAD COMMAND ADDRESS INTO PLAYER IF POINTER IS VALID PLAYER()
	RTS                                                           ; RETURN
	
@ok_to_update_addr:                                               ;
	LDY low_byte_addr                                             ; RESTORE LOW BYTE OF ADDRESS

	
UPDATE_LOCAL_PLAYER_COMMAND_ADDR_IF_VALID						; LOAD COMMAND ADDRESS INTO PLAYER IF POINTER IS VALID PLAYER($3E,$3f)
	LDA player_addr +1                                            ; 
	CMP #$02                                                      ; POINTER HIGH BYTE <2? = NOT PLAYER RAM?
	BCC @player_addr_not_valid_exit                               ; YES->DON’T LOAD ADDRESS EXIT
	CMP #$07                                                      ; POINTER HIGH BYTE >7? = NOT PLAYER RAM?          
	BCS @player_addr_not_valid_exit                               ; YES->DON’T LOAD ADDRESS EXIT 
	TYA                                                           ; SET TARGET COMMAND ADDR (3E,3F)=  TEMP COMMAND ADDR
	LDY #COMMAND_ADDR                                             ; 
	STA (player_addr),Y                                           ;
	INY                                                           ; 
	TXA                                                           ;
	STA (player_addr),Y                                           ; 
	LDY #COMMAND_COUNTER                                          ; SET COMMAND COUNTER = 1 FRAME
	LDA #$01                                                      ; 
	STA (player_addr),Y                                           ; 
	RTS                                                           ; RETURN       

@player_addr_not_valid_exit:                                      ; DON’T LOAD ADDRESS EXIT
	RTS                                                           ; RETURN

_F}_UPDATE_PLAYER_RAM_ADDR_FUNCTIONS 

_F{_ADJUST_PLAYER_FINAL_LOCATION_FOR_PASS                         ; DONE EXCEPT ADDR
	
DO_ADJUST_PLAYER_FINAL_LOCATION_PASS:                                ; SET FINAL PLAYER LOCATION AND RETURN DIRECTION
	LDA #ADJUST_FINAL_PLAYER_LOCATION_ON_PASS_BANK                ; SET BANK = BANK 26
	LDY #<BANK_JUMP_ADJUST_PLAYER_FINAL_LOCATION_PASS             ; SET ADDR = FINAL PLAYER LOCATION PASS COVERAGE ADJUSTMENT() = 8036 *** can jump direct
	LDX #>BANK_JUMP_ADJUST_PLAYER_FINAL_LOCATION_PASS             ;
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                            ; SWAP $8000 BANK AND JUMP(Y,X= ADDRESS, A= BANK TO SWAP TO)
	JSR GET_NEW_DIRECTION_BASED_ON_DISTANCE                       ; GET A NEW DIRECTION BASED ON PLAYER X,Y DISTANCE TO MOVE( X= 42,43, Y=44,45)
	RTS                                                           ; RETURN

_F}_ADJUST_PLAYER_FINAL_LOCATION_FOR_PASS 

_F{_KICKOFF_ANIMATION_LOGIC                                       ; DONE

SET_FINAL_KICK_LOCATION_START_ANIMATION:                          ; SET FINAL KICKOFF LOCATION AND START KICK ANIMATION (X,Y= KICK DISTANCE, A= Y LOC)
	STA FINAL_BALL_Y                                              ; SAVE FINAL BALL Y
	STY FINAL_BALL_X                                              ; SAVE KICK DISTANCE LOW 
	LDY #Y_POS + 1                                                ; SET BALL Y= PLAYER Y
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA BALL_Y + 1                                                ; 
	LDY #X_POS + 1                                                ; SET BALL X= PLAYER X
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA BALL_X + 1                                                ;
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA BALL_X + 2                                                ; 
	LOAD_CUR_PLAYER_POSITION_ID
	BMI @set_p2_kick_final_location                               ; YES->P2 KICK

@set_p1_kick_final_location: 
	LDA BALL_X + 1                                                ; FINAL BALL X= + BALL X + KICK DISTANCE
	CLC	
	ADC FINAL_BALL_X                                              ; 
	STA FINAL_BALL_X                                              ; 
	TXA                                                           ; 
	ADC BALL_X + 2                                                ; 
	STA FINAL_BALL_X + 1                                          ; 
	JMP DO_BALL_KICKED_ANIMATION                                  ; JUMP -> DO KICK ANIMATION TASK

@set_p2_kick_final_location:                                      ; P2 KICK *** part of onsides bug?
	LDA BALL_X + 1                                                ; BALL X = BALL X – 1 yard
	SEC                                                           ; 
	SBC #ONE_YARD                                                 ; 
	STA BALL_X + 1                                                ;
	LDA BALL_X + 2                                                ;
	SBC #$00                                                      ;
	STA BALL_X + 2                                                ;
	STX FINAL_BALL_X + 1                                          ;
	LDA BALL_X + 1                                                ; BALL X FINAL = BALL X  - KICK DISTANCE
	SEC                                                           ;
	SBC FINAL_BALL_X                                              ;
	STA FINAL_BALL_X                                              ;
	LDA BALL_X + 2                                                ;
	SBC FINAL_BALL_X + 1                                          ;
	STA FINAL_BALL_X + 1                                          ;
	
DO_BALL_KICKED_ANIMATION:                                        ; DO KICK ANIMATION TASK
	LDA #(BALL_UPDATE_SCROLL_BITFLAG + BALL_BACKWARDS_ROT_BITFLAG);
	JMP SET_BALL_STATUS_MOVING_START_BALL_TASK                    ; JUMP->UPDATE BALL STATUS BYTE AND START BALL ANIMATION TASK(A=BALL STATUS TO ADD TO BALL MOVING)

UPDATE_PLAY_STATUS_TO_BALL_KICKED:                                ; SET PLAY STATUS = BALL KICKED
	SET_PLAY_STATUS_BALL_KICKED[]
	RTS                                                           ; RETURN

_F}_KICKOFF_ANIMATION_LOGIC 

_F{_PLAY_CATCH_SOUND_CLEAR_SPRITES_SET_BALL_NOT_MOVING            ; DONE

PLAY_CATCH_SOUND_END_BALL_ANI:                                    ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION =NOT MOVING & NOT BEING PITCHED
	LDA #CATCH_SOUND                                              ; SET SOUND TO PLAY = RECEIVE BALL SOUND
	JSR PLAY_SOUND                                                ; PLAY SOUND(A=SOUND)
	LDX #BALL_MOVEMENT_TASK                                       ; LOAD TASK 4 INDEX
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS                    ; END TASK (X= TASK INDEX)
	LDA #SPRITE_OFFSCREEN                                         ; 
	STA BALL_SPR_Y                                                ; SET BALL SPRITE = OFFSCREEN
	STA BALL_SHADOW_SPR_Y                                         ;
	STA PASS_TGT_INDICATOR_SPR_Y                                  ; SET TARGET INDICATOR = OFFSCREEN
	STA BALL_MARKER_SPR_Y                                         ; 
	SET_BALL_COLLISION_NOT_MOVING
	SET_BALL_STATUS_SPECIAL_SNAP_DONE
	RTS                                                           ; RETURN

_F}_PLAY_CATCH_SOUND_CLEAR_SPRITES_SET_BALL_NOT_MOVING 
	
_F{_SET_FINAL_BALL_LOCATION_TO_TARGET                             ; DONE

target_ram_addr = LOCAL_1

SET_CUR_BALL_LOC_FINAL_EQU_TO_TARGET:                             ; SET CURRENT BALL LOCATION, SET FINAL BALL LOCATION = CURRENT TARGET LOCATION  
	LOAD_CUR_PLAYER_DIRECTION                                     ; CONVERT PLAYER CURRENT DIRECTION INTO TABLE INDEX 
	CLC                                                           ;
	ADC #$10                                                      ; 
	LOG_SHIFT_RIGHT_4                                             ;
	AND #$0E                                                      ; 
	TAX                                                           ; 
	LDY #Y_POS + 1                                                ; SET BALL Y = Y ADJUST FROM BALL LEAVING HAND Y/X EXTRA SPRITE ADJUSTMENT TABLE + PLAYER Y
	LDA BALL_LEAVE_HAND_SPR_ADJ_TABLE,X                           ;
	CLC                                                           ; 
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA BALL_Y+1                                                  ; 
	LDA (target_ram_addr),Y                                       ; SET FINAL BALL Y = TARGET Y
	STA FINAL_BALL_Y                                              ;    
	LDY #X_POS + 1                                                ; SET X ADJUST FROM BALL LEAVING HAND Y/X EXTRA SPRITE ADJUSTMENT TABLE
	LDA BALL_LEAVE_HAND_SPR_ADJ_TABLE+1,X                         ;
	CLC                                                           ; SET BALL X = 16 BIT PLAYER X + X SPRITE ADJUST
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA BALL_X+1                                                  ; 
	INY                                                           ;
	LDA BALL_LEAVE_HAND_SPR_ADJ_TABLE+1,X                         ;
	AND #$80                                                      ;
	BPL @save_final_ball_x_location                               ;
	LDA #$FF                                                      ;
@save_final_ball_x_location:                                      ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA BALL_X+2                                                  ; 
	DEY                                                           ;
	LDA (target_ram_addr),Y                                       ; SET 16BIT FINAL BALL X = 16 BIT TARGET X
	STA FINAL_BALL_X                                              ;
	INY                                                           ;
	LDA (target_ram_addr),Y                                       ;
	STA FINAL_BALL_X+1                                            ;
	RTS                                                           ; RETURN

_F}_SET_FINAL_BALL_LOCATION_TO_TARGET 

_F{_BALL_SPEED_LOFT_BASED_ON_QB_PS                                ; DONE

SET_BALL_PASS_SPEED_AND_GRAVITY:                                  ; SET QB PASS SPEED AND LOFT()
	LOAD_CUR_PLAYER_POSITION_ID
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID                          ; SET ACTUAL PLAYER AND TEAM(A=POSITION ID) RET X=TEAM A= PLAYER 
	LDY #PASSING_SPEED_INDEX                                      ; SET SKILL INDEX  = PASSING SPEED INDEX
	JSR GET_PLAYER_SKILL_OR_FACE                                  ; GET SKILL RATING(X=TEAM, A=PLAYER, Y=SKILL TO GET)
	TAY                                                           ; 
	LDA PASSING_SPEED_VALUES_TABLE,Y                              ; SET PASSING SPEED FROM PASSING SPEED TABLE 
	STA BALL_SPEED                                                ; 
	LDA PASSING_GRAVITY_VALUES_TABLE,Y                            ; SET PASSING LOFT FROM PASSING LOFT TABLE 
	STA BALL_GRAVITY_INDEX                                        ;  
	RTS                                                           ; RETURN

_F}_BALL_SPEED_LOFT_BASED_ON_QB_PS 
	
_F{_GET_ABS_VALUE_IF_P2_PLAYER                                    ; DONE
	
INVERT_VALUE_IF_PLAYER_2:                                         ; INVERT X VALUE IF PLAYER 2()
	LOAD_CUR_PLAYER_POSITION_ID
	BPL @exit                                                     ; YES->EXIT
	TXA                                                           ; X= (X * -1)
	EOR #$FF                                                      ;
	CLC                                                           ;
	ADC #$01                                                      ;
	TAX                                                           ;
@exit:                                                            ; EXIT
	RTS                                                           ; RETURN

_F}_GET_ABS_VALUE_IF_P2_PLAYER 

_F{_VARIOUS_JUMP_FUNCTIONS                                        ; DONE

temp_ball_loc = LOCAL_1
ball_true_Y  = LOCAL_5 

CHECK_IF_BALL_CATCHABLE_AFTER_JUMP:                               ; CHECK IF BALL CAN BE TIPPED OR CAUGHT AFTER JUMPING()

@check_within_one_yard_of_OOB_lines:
	LDA BALL_Y + 1                                                ; IS CURRENT BALL Y < TOP OF OOB ? *** investigate limits
	CMP #(OUT_OF_BOUNDS_TOP_Y  + ONE_YARD)                        ; 
	BCC @ball_not_catchable_exit                                  ; YES-> BALL NOT CATCHABLE
	CMP #(OUT_OF_BOUNDS_BOT_Y + ONE_YARD)                         ; IS CURRENT BALL Y >= BOTTOM OF OOB *** investigate limits
	BCS @ball_not_catchable_exit                                  ; YES-> BALL NOT CATCHABLE

@set_true_ball_Y: 
	SEC                                                           ; 
	SBC BALL_Z +1                                                 ; ball_true_Y = BALL Y – BALL Z + 1.25 YARDS
	CLC                                                           ;
	ADC #PASS_JUMP_TIP_CATCH_LIMIT_Z                              ; 
	STA ball_true_Y                                               ;

@set_ball_X: 
	LDA BALL_X + 1                                                ;
	STA temp_ball_loc                                             ;
	LDA BALL_X + 2                                                ; 
	STA temp_ball_loc +1                                          ;
	
	LDX #PASS_JUMP_TIP_CATCH_LIMIT_X                              ; SET X LIMIT= 1.25 YARDS
	LDY #PASS_JUMP_TIP_CATCH_LIMIT_Y                              ; SET Y LIMIT= 1.25 YARDS
	JSR CHECK_IS_PLAYER_WITHIN_LIMITS_OF_LOC                      ; PLAYER WITHIN LIIMTS (X= X LIM, Y= Y LIM, 3E/3F= X TO CHECK VS, $42= Y TO CHECK VS )
	RTS                                                           ; RETURN   

@ball_not_catchable_exit:                                         ; BALL NOT CATCHABLE
	CLC                                                           ; CLEAR CARRY = BALL IS NOT CATCHABLE
	RTS                                                           ; RETURN
	


JUMP_UP_FOR_BALL:                                                          ; JUMP UP ANIMATION()
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	SET_CUR_PLAYER_JUMPING[]
	LDA BALL_COLLISION                                            ; SET PLAYER CURRENT DIRECTION = OPPOSITE OF BALL DIRECTION   
	CLC                                                           ;
	ADC #$80                                                      ;
	SET_CUR_PLAYER_DIRECTION                                      ;
	SET_ADDR_XY[addr] JUMPING_PLAYER_SPRITE_INFO
	JSR UPDATE_SPRITE_JUMPING                                     ; UPDATE PLAYER SPRITE FOR JUMPING(Y,X=Address)
	
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$FD                                                      ; SET AMOUNT =   3/8 YARD UP       
	JSR UPDATE_PLAYER_Y_BY_AMNT                                   ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$FE                                                      ; SET AMOUNT =   2/8 YARD UP 
	JSR UPDATE_PLAYER_Y_BY_AMNT                                   ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$FF                                                      ; SET AMOUNT =   1/8 YARD UP 
	JSR UPDATE_PLAYER_Y_BY_AMNT                                   ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$FF                                                      ; SET AMOUNT =   1/8 YARD UP 
	JSR UPDATE_PLAYER_Y_BY_AMNT                                   ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; JUMP->RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F()


LAND_FROM_JUMP:                                                   ; LAND FROM JUMP ANIMATION()
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 9
	LDA #$01                                                      ; SET AMOUNT = 1/8 YARD DOWN
	JSR UPDATE_PLAYER_Y_BY_AMNT                                   ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$02                                                      ; SET AMOUNT =  1/4 YARD DOWN 
	JSR UPDATE_PLAYER_Y_BY_AMNT                                   ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$02                                                      ; SET AMOUNT =   1/4 YARD DOWN 
	JSR UPDATE_PLAYER_Y_BY_AMNT                                   ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$03                                                      ; SET AMOUNT =   3/8 YARD DOWN
	JSR UPDATE_PLAYER_Y_BY_AMNT                                   ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD)
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 4
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE()
	LOAD_CUR_PLAYER_COLLISION_STATUS
	AND #$F7                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; JUMP->RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F ()

UPDATE_PLAYER_Y_BY_AMNT:                                          ; UPDATE PLAYER Y LOCATION(A= VALUE TO ADD) 
	LDY #Y_POS + 1                                                ; PLAYER Y LOC = PLAYER Y LOC + VALUE
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;  
	RTS                                                           ; RETURN

ball_x_after_jump   = LOCAL_1
ball_y_after_jump = LOCAL_5

temp_distance_2  = LOCAL_7                                        ; *** uneeded *** could use 8 again
temp_distance   = LOCAL_8 
sprite_y_offset  = $04 
	
CHECK_IF_PLAYER_CLOSE_ENOUGH_TO_JUMP_FOR_BALL:                    ; CHECK FOR PLAYER CLOSE ENOUGH TO BALL TO JUMP FOR IT()

@get_ball_y_after_jump:
	LDA BALL_VELOCITY_Y                                           ; = (BALL Y VELOCITY * 4 FRAMES( LENGTH OF JUMP ANIMATION) + 0.5 YARD(JUMPING SPRITE OFFSET) 
	STA temp_distance                                             ;
	LDA BALL_VELOCITY_Y+1                                         ; 
	ASL                                                           ;
	ROL temp_distance                                             ;
	ASL                                                    
	ROL temp_distance                                             ;
	CLC                                                           ;
	ADC #sprite_y_offset                                          ;
	BIT BALL_DIRECTION                                            ; DOES BALL DIRECTION = MOVING UP OR DOWN?
	BVS @set_ball_y_after_jump                                    ; = ABS[(BALL Y VELOCITY * 4 FRAMES)+ 0.5 YARDS]
	
@abs_value_ball_moving_up 
	EOR #$FF                                                      ; 
	
@set_ball_y_after_jump:                                           ; 
	CLC                                                           ;
	ADC BALL_Y + 1                                                ; + BALL LOCATION Y      
	STA ball_y_after_jump                                         ; SAVE IN $42 FOR LIMIT CHECK
	
@get_ball_x_after_jump: 
	LDA BALL_VELOCITY_X                                           ; = (BALL X VELOCITY *4 FRAMES)
	STA temp_distance                                             ;
	LDA BALL_VELOCITY_X+1                                         ; 
	ASL                                                           ;
	ROL temp_distance                                             ;
	ASL                                                           ;
	ROL temp_distance                                             ;
	BIT BALL_DIRECTION                                            ; IS BALL MOVING LEFT?
	BPL @ball_moving_left_set_ball_x_after_jump                    ; YES-> JUMP TO BALL MOVING LEFT

@ball_moving_right_set_ball_x_after_jump: 
	CLC                                                           ; 3E,3F= BALL X + (BALL X VELOCITY * 4 FRAMES(LENGTH OF JUMP ANIMATION)  
	ADC BALL_X + 1                                                ;  
	STA ball_x_after_jump                                         ;
	LDA #$00                                                      ;
	ADC BALL_X + 2                                                ;  
	STA ball_x_after_jump+1                                       ;
	JMP @check_player_vs_limits                                   ; JUMP->DO LIMIT CHECK AND RETURN

@ball_moving_left_set_ball_x_after_jump:                          ; BALL MOVING RIGHT TO LEFT
	STA temp_distance_2                                           ; ball_x_after_jump = BALL X - (BALL X VELOCITY *4)  
	LDA BALL_X + 1                                                ; 
	SEC                                                           ;
	SBC temp_distance_2                                           ;
	STA ball_x_after_jump                                         ;
	LDA BALL_X + 2                                                ;
	SBC #$00                                                      ;
	STA ball_x_after_jump+1                                       ;
	
@check_player_vs_limits:                                          ; DO LIMIT CHECK AND RETURN
	LDX #CLOSE_ENOUGH_JUMP_LIMIT_X                                ; SET CLOSE ENOUGH TO BALL X LIM = 1.25 YARDS 
	LDY #CLOSE_ENOUGH_JUMP_LIMIT_Y                                ; SET CLOSE ENOUGH TO BALL Y LIM  = 1 YARD
	JMP CHECK_IS_PLAYER_WITHIN_LIMITS_OF_LOC                      ; PLAYER WITHIN LIIMTS (X= X LIMIT, Y= Y LIMIT, 3E/3F= X TO CHECK VS, $42= Y TO CHECK VS )

_F}_JUMP_UP_LAND_AND_CHECK_FOR_JUMP_FUNCTIONS 
	
_F{_DIVE_FOR_PASS_LOGIC                                           ; DONE	

dive_array_index  = EXTRA_PLAYER_RAM_1
ball_x_temp   = LOCAL_1
ball_y_temp   = LOCAL_5

DO_PASS_DIVE_ANI_AND_BALL_COLL_CHECK:                             ; PLAYER DIVING FOR PASS START
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM                            ;
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; SET PLAYER STATUS = NOT MOVING 
	AND #PLAYER_NOT_MOVING_BITMASK                                ;  
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	DEY                                                           ; SET PLAYER COLLISION = ON GROUND
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	ORA #PLAYER_ON_GROUND_BITMASK                                 ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	
	SET_ADDR_XY[addr] READY_TO_DIVE_SPRITE_DATA 
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 4
	
	SET_ADDR_XY[addr] FLAT_ON_GROUND_SPRITE_DATA 
	JSR UPDATE_SPRITE_8_DIRECTION                                 ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)
	LDA #$00                                                      ; CLEAR DIVE ARRAY COUNTER
	LDY #dive_array_index                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
@dive_loop:                                                       ; UPDATE DIVE SPEED AND CHECK IF BALL ABOUT TO COLLIDE WITH PLAYER LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL COLLIDED? 
	BVS @check_if_player_collided_with_ball                       ; YES-> CHECK FOR PLAY OVER AND PLAYER WITHIN 0.75 YARDS OF BALL()
	LDY #dive_array_index                                         ; DIVE ARRAY COUNTER++
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ; 
	CLC                                                           ;
	ADC #$01                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDA PASS_DIVE_SPEED_ARRAY,X                                   ; DOES DIVE SPEED ARRAY VALUE = NEGATIVE
	BMI @check_for_end_of_dive                                    ; YES->CHECK FOR END OF PASS DIVE
	SET_CUR_PLAYER_SPEED
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION() 
	JMP @dive_loop                                                ; JUMP ->UPDATE DIVE SPEED AND CHECK IF BALL ABOUT TO COLLIDE WITH PLAYER LOOP

@check_for_end_of_dive:                                           ; CHECK FOR END OF PASS DIVE
	CMP #$FF                                                      ; DOES DIVE SPEED ARRAY VALUE = END OF ARRAY
	BNE @dive_loop                                                ; NO-> UPDATE DIVE SPEED AND CHECK IF BALL ABOUT TO COLLIDE WITH PLAYER LOOP
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; YES->SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        

@wait_for_ball_to_collide_dive_done:                              ; WAIT FOR BALL TO COLLIDE LOOP
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	BIT BALL_COLLISION                                            ; DOES BALL STATUS = BALL COLLIDED?
	BVS @wait_for_ball_to_collide_dive_done                       ; NO->WAIT FOR BALL TO COLLIDE LOOP

@check_if_player_collided_with_ball:                              ; BALL COLLIDING, CHECK IF PLAY OVER, PLAYER OOB, OR IF BALL IS CATCHABLE()
	JSR CHECK_PLAY_OVER_PLAYER_OOB                                ; CHECK FOR PLAY OVER OR PLAYER OUT OF BOUNDS()
	BCS @player_OOB_or_play_over                                  ; YES-> PLAYER OUT OF BOUNDS OR PLAY OVER 
	LDA BALL_Y+1                                                  ; SET Y LIMIT LOCATION = BALL Y LOCATION
	STA ball_y_temp                                               ;
	LDA BALL_X+1                                                  ;
	STA ball_x_temp                                               ; SET X LIMIT LOCATION = BALL X LOCATION
	LDA BALL_X+2                                                  ;
	STA ball_x_temp+1                                             ;
	LDX #PASS_DIVE_LIMIT_X                                        ; LOAD X DIVE LIMIT = 0.75 YARDS
	LDY #PASS_DIVE_LIMIT_Y                                        ; LOAD Y DIVE LIMIT = 0.75 YARDS
	JSR CHECK_IS_PLAYER_WITHIN_LIMITS_OF_LOC                      ; PLAYER WITHIN LIIMTS (X= X LIMIT, Y= Y LIMIT, 3E/3F= X TO CHECK VS, $42= Y TO CHECK VS )
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; CLC=NO, SEC=YES JUMP->RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F


@player_OOB_or_play_over:                                         ; PLAYER OUT OF BOUNDS OR PLAY OVER
	CLC                                                           ; CLEAR CARRY = PLAYER NOT CLOSE ENOUGH
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; JUMP->RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F

END_OF_PASS_DIVE_CANT_CATCH_BALL:                                 ; END OF PASS DIVE
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	LOAD_CUR_PLAYER_COLLISION_STATUS
	AND #$EF                                                      ; 
	ORA #$04                                                      ; SET COLLISION STATUS  = PLAYER COLLIDED WITH BALL ??
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LOAD_CUR_PLAYER_SPEED                                         ;
	BEQ GET_UP_FROM_DIVE                                          ; YES->END OF DIVE PLAYER SPEED ALREADY ZERO

@update_player_dive_speed:                                        ; ADJUST SPEED DIVE LOOP
	_WHILE NOT_EQUAL
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDY #dive_array_index                                         ; CONVERT DIVE COUNTER INTO DIVE SPEED ARRAY INDEX
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	TAX                                                           ; 
	CLC                                                           ;
	ADC #$01                                                      ; DIVE COUNTER++ 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDA PASS_DIVE_SPEED_ARRAY,X                                   ; DOES DIVE SPEED ARRAY VALUE = NEGATIVE
	BMI @check_dive_done                                          ; YES->CHECK FOR DIVE DONE
@save_speed: 
	SET_CUR_PLAYER_SPEED
	JSR INIT_PLAYER_VELOCITY_CUR_SPEED                            ; SET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	JMP @update_player_dive_speed                                 ; JUMP->ADJUST SPEED DIVE LOOP

@check_dive_done:                                                 ; CHECK FOR DIVE DONE
	CMP #$FF                                                      ; DOES DIVE SPEED ARRAY VALUE = END OF ARRAY?
	
	_END_WHILE

@dive_done 
	JMP SET_PLAYER_SPEED_ZERO_END_OF_DIVE                         ; YES-> END OF DIVE
							
																; FIX FOR INFINITE GRAPPLE GLITCH ON INT NEED TO RE-ENABLE MAN CONTROL BEFORE THIS
END_OF_PASS_DIVE_BALL_INTERCEPTED:                                ; SET PLAYER COLLISION =NOT DIVING, COLLIDED WITH GROUND, DO END OF DIVE
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	LOAD_CUR_PLAYER_COLLISION_STATUS
	AND #$EF                                                      ;
	ORA #$04                                                      ; SET COLLISION STATUS  = NOT DIVING, COLLIDED WITH GROUND, DO END OF DIVE
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	
SET_PLAYER_SPEED_ZERO_END_OF_DIVE:                                ; END OF DIVE
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING()                        

GET_UP_FROM_DIVE:                                                 ; END OF DIVE PLAYER SPEED ALREADY ZERO
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 30                ;
	LOAD_CUR_PLAYER_COLLISION_STATUS                              ;
	AND #$FB                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	SET_ADDR_XY[addr] PLAYER_SHAKING_HEAD_SPRITE_INFO
	
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 10
	
	SET_ADDR_XY[addr] PLAYER_STANDING_UP_SPRITE_INFO
	JSR UPDATE_SPRITE_LEFT_OR_RIGHT                               ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	
	RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] 10
	
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; JUMP->RETURN TO ADDRESS STORED IN PLAYER RAM 1E/1F ()

_F}_DIVE_FOR_PASS_LOGIC

_F{_BALL_CAUGHT_RECOVERD_BALL_STATUS_FUNCTIONS                    ; DONE

DO_END_OF_RECEPTION_INTERCEPTION:                                 ; KILL BALL ANI, SET BALL COLLIDED, UPDATE COLLIDE BITMASKS, UPDATE ICONS, UPDATE BALL STATUS
	JSR PLAY_CATCH_SOUND_END_BALL_ANI                             ; PLAY CATCH SOUND, END BALL ANIMATION, SET BALL COLLISION =NOT MOVING & NOT BEING PITCHED() 
	JSR SET_PLAYER_BALL_CARR_UPDATE_POSS_STATUS                   ; SET PLAYER IS BALL CARRIER, SET PLAYER TO CAN COLLIDE ALL, SET WHICH SIDE HAS BALL()
	JSR UPDATE_MAN_CONTROL_PLAYER_PTR                             ; SET P1 OR P2 MAN CONTROLLED PLAYER POINTER = CURRENT PLAYER()
	JSR UPDATE_P1_OR_P2_DISPLAYED_NAME                            ; UPDATE PLAYER 1 OR PLAYER 2 ICON ABOVE HEAD 

	IF_PASS_TIPPED[ADDR] SET_BALL_HIT_GROUND_AND_WHO_TOUCHED_LAST
	
@else: 
	SET_BALL_CAUGHT
	RTS                                                           ; RETURN

SET_BALL_HIT_GROUND_AND_WHO_TOUCHED_LAST:                         ; SET BALL STATUS TO BALL HIT GROUND, AND SET BALL STATUS = WHO RECOVERED BALL() 
	LOAD_CUR_PLAYER_POSITION_ID                                   ; 
	ASL                                                           ; 
	LDA #$01                                                      ; SET BALL STATUS = BALL HIT GROUND 
	ROL                                                           ;
	ROL                                                           ;
	ROL                                                           ;
	ORA BALL_STATUS                                               ; + POSSESSION INFO INTO $72 = (0x08 for P1,  0x0C for P2)
	STA BALL_STATUS                                               ; 
	RTS                                                           ; RETURN

_F}_BALL_CAUGHT_RECOVERD_BALL_STATUS_FUNCTIONS 

_F{_UPDATE_PLAYER_DIRECTION_FUNCTIONS                             ; DONE

temp_y_dist     			= LOCAL_5
larger_distance      	 	= LOCAL_5 
smaller_distance    		= LOCAL_8
divide_result    			= LOCAL_7
ACRTAN_FINAL_VALUE_OFFSET  	= $100 
ANGLE_TEMP     			= DIRECTION_TEMP

GET_PLAYER_DIRECTION_TOWARDS_LOC:                                 ; GET NEW PLAYER DIRECTION(X= X DIST, Y = Y DIST)
	LDA #$00                                                      ; CLEAR TEMP VARIABLES 
	STA LOCAL_7                                                   ;
	STA LOCAL_6                                                   ;

@abs_y_and_set_y_direction 
	TYA                                                           ; IS NEW Y DISTANCE UP OR DOWN? 
	ROL                                                           ; SET $B2 Y BIT  01=UP, 00= DOWN
	LDA #$00                                                      ; 
	ROL                                                           ; 
	STA DIRECTION_TEMP                                            ; 
	ABS_Y[]

@abs_x_and_set_x_direction :                                      ; CHECK IF X DISTANCE IS POSTIVE OR NEGATIVE
	TXA                                                           ; IS NEW XLOCATION TO RIGHT OR LEFT  
	ASL                                                           ; SET B2 X BIT SET $B2  0=RIGHT, 1=LEFT
	ROL DIRECTION_TEMP                                            ; 
	ABS_X[] 
															
	STY temp_y_dist                                               ; 
	
@get_angle_based_on_direction_index 
	LDY DIRECTION_TEMP                                            ; 
	LDA FOUR_DIRECTION_TABLE,Y                                    ; GET MAJOR DIRECTION FROM DIRECTION TABLE(4 DIRECTIONS)
	STA ANGLE_TEMP                                                ; 

@check_x_vs_y: 
	CPX temp_y_dist                                               ; ABS(X) >= ABS(Y)
	BCS @x_greater_than_y                                         ; YES-> X DIST >= Y DISTANCE
	
@y_greater_than_x 
	LDY temp_y_dist                                               ; Y=0
	BEQ zero_distance_pause_player                                ; 
	STX smaller_distance                                          ; = X DIST / Y DIST
	JSR DIVIDE_16_BIT_16_BIT_RESULT                               ; 16 BIT DIVIDE ($45,$44 /  $43,42) RESULT $45,44
	LDA divide_result + 1                                         ;
	BNE @y_greater_but_x_large                                    ; SHOULD BE  IMPOSSIBLE TO TRIGGER
	
@set_arctan_angle:  
	LDX divide_result                                             ; 
	LDA ARCTAN_TABLE,X                                            ; LOAD ANGLE TO ADD FROM ANGLE TABLE
	BIT ANGLE_TEMP                                                ; IS DIRECTION = LEFT OR RIGHT? 	
	BVC @invert_value                                             ; YES->INVERT VALUE	
	JMP @save_final_angle                                         ; JUMP->FINALIZE DIRECTION

@y_greater_but_x_large:                                           ; Y > X BUT X IS LARGE SHOULD BE  IMPOSSIBLE TO TRIGGER
	LDA ARCTAN_TABLE + ACRTAN_FINAL_VALUE_OFFSET                  ; SET DIRECTION = RIGHT ***COULD HAVE JUST DONE LDA #$80 
	BIT ANGLE_TEMP                                                ; IS DIRECTION = LEFT OR RIGHT?
	BVC @invert_value                                             ; YES-> INVERT VALUE
	JMP @save_final_angle                                         ; JUMP->FINALIZE DIRECTION

@x_greater_than_y:                                                ; X DIST >= Y DISTANCE
	LDA temp_y_dist                                               ;
	STA smaller_distance                                          ;
	STX larger_distance                                           ; = Y DIST / X DIST
	JSR DIVIDE_16_BIT_16_BIT_RESULT                               ; 16 BIT DIVIDE ($45,$44 /  $43,42) RESULT $45,44
	LDA divide_result + 1                                         ;
	BNE @x_much_greater_than_y                                    ;

@set_arctan_angle_x_greater_than_y: 
	LDX divide_result                                             ;
	LDA ARCTAN_TABLE,X                                            ; LOAD ANGLE TO ADD FROM ARC TAN TABLE
	BIT ANGLE_TEMP                                                ; IS DIRECTION = UP OR DOWN?
	BVS @invert_value                                             ; YES->INVERT VALUE
	JMP @save_final_angle                                         ; No-> FINALIZE DIRECTION

@x_much_greater_than_y:                                           ; X > Y BUT X IS LARGE
	LDA ARCTAN_TABLE + ACRTAN_FINAL_VALUE_OFFSET                  ;  ***COULD HAVE JUST DONE LDA #$80
	BIT ANGLE_TEMP                                                ; IS DIRECTION LEFT OR RIGHT?
	BVC @save_final_angle                                         ; YES->FINALIZE DIRECTION

@invert_value:                                                    ; INVERT VALUE
	EOR #$FF                                                      ; 

@save_final_angle:                                                ; FINALIZE DIRECTION 
	DIVIDE_4                                                      ; =0-180 degrees  divided by 4
	ADC ANGLE_TEMP                                                ; = MAJOR DIRECTION + 0 TO 45
	CLC                                                           ; CLC= DIRECTION WAS CHANGED
	RTS                                                           ; RETURN

zero_distance_pause_player:                                       ; PAUSE SPRITE SHOULD BE IMPOSSIBLE TO TRIGGER
	JSR STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL               ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE() 
	SEC                                                           ; SET CARRY = SPRITE PAUSED 
	RTS                                                           ; RETURN

FOUR_DIRECTION_TABLE:                                             ; DIRECTION TABLE (RIGHT,DOWN,UP,LEFT)
	.DB RIGHT_DIRECTION                                           ; FACING RIGHT (00) DOWN + RIGHT = RIGHT
	.DB DOWN_DIRECTION                                            ; FACING DOWN  (01) DOWN + LEFT  = DOWN
	.DB UP_DIRECTION                                              ; FACING UP    (10) UP + RIGHT = UP
	.DB LEFT_DIRECTION                                            ; FACING LEFT  (11) UP + LEFT = LEFT

	
target_ram_addr = LOCAL_1
x_dist_temp  = LOCAL_5 
y_dist_temp  = LOCAL_7 

GET_DIRECTION_TO_TARGET:                                          ; GET DIRECTION TOWARDS TARGET BASED ON DISTANCE TO TARGET (PLAYER AE, AF, TARGET 3E 3F)                
																; PLAYER 2 – PLAYER 1 LOCATIONS (42=X_MID, 43=X_HIGH, 44=Y_HIGH 45= Y_REM)
@target_minus_player_y 
	LDY #Y_POS + 1                                                ; TARGET Y – PLAYER Y
	LDA (target_ram_addr),Y                                       ; 
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA y_dist_temp                                               ;
	LDA #$00                                                      ;
	SBC #$00                                                      ;
	STA y_dist_temp +1                                            ; 

@target_minus_player_x 
	LDY #X_POS + 1                                                ; TARGET X – PLAYER X
	LDA (target_ram_addr),Y                                       ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA x_dist_temp                                               ;
	INY                                                           ;
	LDA (target_ram_addr),Y                                       ; 
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;  
	STA x_dist_temp +1                                            ;
							
																; (  42=X_MID, 43=X_HIGH, 44=Y_HIGH 45= Y_REM)
GET_NEW_DIRECTION_BASED_ON_DISTANCE:                              ; GET A NEW DIRECTION BASED ON DISTANCE TO MOVE ( X= 43,42, Y=44,45= REM) 
																; CHECK X DISTANCE            
	LDA y_dist_temp  +1                                           ; Y DISTANCE > HALF OF FIELD?  
	EOR y_dist_temp                                               ; 
	AND #$80                                                      ; 
	BEQ @divide_until_less_than_32_yds                            ; NO-> CHECK X DISTANCE

@signed_divide_by_two: 
	LDA y_dist_temp +1                                            ; DIVIDE Y AND X DISTANCE BY 2
	ASL                                                           ; 
	ROR y_dist_temp +1                                            ; 
	ROR y_dist_temp                                               ; 
	LDA x_dist_temp +1                                            ;
	ASL                                                           ;
	ROR x_dist_temp +1                                            ;
	ROR x_dist_temp                                               ;

@divide_until_less_than_32_yds:                                   ; DIVIDE X/Y DISTANCE UNTIL X LESS THAN 32 YARDS 
	LDA x_dist_temp +1                                            ; X DISTANCE > +32 YARDS
	BEQ @check_distance_low_byte                                  ; NO->CHECK X DISTANCE LOW BYTE
	CMP #$FF                                                      ; X DISTANCE > -32 YARDS
	BNE @signed_divide_by_two_then_jump                           ; YES->DIVIDE X AND Y DISTANCE BY 2
	
@check_distance_low_byte:                                         ; CHECK X DISTANCE LOW BYTE
	EOR x_dist_temp                                               ; X DISTANCE > +/- 16 YARDS
	AND #$80                                                      ;
	BEQ @calculate_new_direction                                  ; NO-> SET X AND Y DISTANCE JUMP TO CALCULATE DIRECTION

@signed_divide_by_two_then_jump 
	LDA y_dist_temp +1                                            ; DIVIDE Y AND X DISTANCE BY 2
	ASL                                                           ; 
	ROR y_dist_temp +1                                            ; 
	ROR y_dist_temp                                               ; 
	LDA x_dist_temp +1                                            ;
	ASL                                                           ;
	ROR x_dist_temp +1                                            ;
	ROR x_dist_temp                                               ;
	JMP @divide_until_less_than_32_yds                            ; CHECK X DISTANCE

@calculate_new_direction:                                         ; SET X AND Y DISTANCE JUMP TO CALCULATE DIRECTION
	LDY y_dist_temp                                               ; SET Y = Y DIST
	LDX x_dist_temp                                               ; SET X = X DIST
	JMP GET_PLAYER_DIRECTION_TOWARDS_LOC                          ; JUMP->SET NEW PLAYER DIRECTION(X= X DIST, Y = Y DIST)

SET_PLAYER_FACING_LEFT_OR_RIGHT:                                  ; SET DEFAULT PLAYER DIRECTION(P1=RIGHT, P2= LEFT)                                  
	LOAD_CUR_PLAYER_POSITION_ID
	EOR #$FF                                                      ; SET PLAYER DIRECTION = 0X80(RIGHT) FOR P1, 0X00(LEFT) FOR P2                      
	AND #$80                                                      ;
	SET_CUR_PLAYER_DIRECTION                                      ;
	RTS                                                           ; RETURN

	
player_x_loc  = LOCAL_5 
player_y_loc  = LOCAL_7 

GET_PLAYER_DIRECTION_TOWARDS_BALL:                                ; UPDATE PLAYER DIRECTION BASED ON LOCATION VS CURRENT BALL LOCATION()
	LDA BALL_Y + 1                                                ; 44,45 = BALL Y – PLAYER Y 
	LDY #Y_POS + 1                                                ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA player_y_loc                                              ;
	LDA #$00                                                      ;
	SBC #$00                                                      ;
	STA player_y_loc + 1                                          ; 0 IF BALL IS HIGHER THAN PLAYER, ELSE FF 
	LDA BALL_X + 1                                                ; 43,42 = BALL X – PLAYER X 
	LDY #X_POS + 1                                                ;    
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA player_x_loc                                              ; 
	INY                                                           ;
	LDA BALL_X + 2                                                ; 
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA player_x_loc +1                                           ; 
	JMP GET_NEW_DIRECTION_BASED_ON_DISTANCE                       ; JUMP->GET ANGLE BASED ON DISTANCE ( X= 43,42, Y=44,45)

GET_PLAYER_DIRECTION_TOWARDS_FINAL_BALL:                          ; UPDATE PLAYER DIRECTION BASED ON LOCATION VS FINAL BALL LOCATION()
	LDA FINAL_BALL_Y                                              ; 44,45 = FINAL BALL Y – PLAYER Y 
	LDY #Y_POS + 1                                                ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	STA player_y_loc                                              ; 
	LDA #$00                                                      ;
	SBC #$00                                                      ;
	STA player_y_loc + 1                                          ; 0 IF BALL IS HIGHER THAN PLAYER, ELSE FF
	LDA FINAL_BALL_X                                              ; 43,42 = BALL X – PLAYER X
	LDY #X_POS + 1                                                ;
	SEC                                                           ;
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA player_x_loc                                              ; 
	INY                                                           ;
	LDA FINAL_BALL_X + 1                                          ; 
	SBC (CURRENT_PLAYER_ADDR),Y                                   ;
	STA player_x_loc +1                                           ; 
	JMP GET_NEW_DIRECTION_BASED_ON_DISTANCE                       ; JUMP->GET ANGLE BASED ON DISTANCE ( X= 43,42, Y=44,45)

_F}_UPDATE_PLAYER_DIRECTION_FUNCTIONS
	
_F{_UPDATE_PLAYER_SPRITE_FUNCTIONS                                ; DONE
	
UPDATE_PLAYER_SPRITE_NORMAL:                                      ; PLAYER SPRITE (READY TO MOVE, MOVING, STANDING STILL)
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER MOVING? 
	BMI @player_running                                           ; YES->PLAYER RUNNING
	AND #PLAYER_BALL_CARRIER_BITFLAG                              ; 
	BNE @ball_carrier_stopped                                      ; IS PLAYER BALL CARRIER? YES->PLAYER IS BALL CARRIER NOT MOVING
	
@player_stopped:
	LDY #<(PLAYER_STANDING_STILL_SPR_INFO)                        ; SET SPRITE ADDR = PLAYER STANDING ADDR
	LDX #>(PLAYER_STANDING_STILL_SPR_INFO)                        ;
	JMP UPDATE_SPRITE_8_DIRECTION                                 ; JUMP-> UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)

@player_running:                                                  ; PLAYER RUNNING
	LDY #<(PLAYER_RUNNING_SPR_INFO)                               ; SET SPRITE ADDR =  PLAYER RUNNING
	LDX #>(PLAYER_RUNNING_SPR_INFO)                               ;
	JMP UPDATE_SPRITE_8_DIRECTION                                 ; JUMP->UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = SPR INFO ADDR)

@ball_carrier_stopped:                                            ; PLAYER IS BALL CARRIER NOT MOVING
	LDY #<(BALL_CARRIER_STOPPED_SPRITE_DATA)                      ; SET SPRITE ADDR = BALL CARRIER NOT MOVING
	LDX #>(BALL_CARRIER_STOPPED_SPRITE_DATA)                      ;
	JMP UPDATE_SPRITE_LEFT_OR_RIGHT                               ; JUMP->UPDATE SPRITE GRAPHIC 2 POSSIBLE DIRECTIONS (X,Y = ADDR)   

UPDATE_SPRITE_8_DIRECTION:                                        ; UPDATE SPRITE GRAPHIC 8 POSSIBLE DIRECTIONS (X,Y = ADDR)
	STY TEMP_PLAYER_SPR_ADDR                                      ; SET SPRITE ADDR = TEMP SPRITE ADDR
	STX TEMP_PLAYER_SPR_ADDR+1                                    ; 
	LOAD_CUR_PLAYER_DIRECTION                                     ; CONVERT PLAYER DIRECTION INTO DIRECTION OFFSET (0 LEFT,0X04 = LEFT-UP, ETC)
	CLC                                                           ;
	ADC #$10                                                      ; 
	LSR                                                           ; 
	LSR                                                           ;
	LSR                                                           ;
	AND #$3C                                                      ; 
	JMP UPDATE_CURRENT_PLAYER_SPRITE_TILES[dir_offset]            ; JUMP-> UPDATE PLAYER SPRITE TILES (B2/B3 = GRAPHIC INFO POINTER, , A= DIRECTION OFFSET)

UPDATE_SPRITE_LEFT_OR_RIGHT:                                      ; UPDATE SPRITE GRAPHIC FACING LEFT OR RIGHT (X,Y = ADDR)
	STY TEMP_PLAYER_SPR_ADDR                                      ; SET SPRITE ADDR = TEMP SPRITE ADDR
	STX TEMP_PLAYER_SPR_ADDR+1                                    ; 
	LOAD_CUR_PLAYER_DIRECTION                                     ; CONVERT PLAYER DIRECTION TO LEFT OR RIGHT DIRECTION OFFSET
	CLC                                                           ;
	ADC #$40                                                      ;
	ROL                                                           ;
	ROL                                                           ;
	ROL                                                           ;
	ROL                                                           ;
	AND #$04                                                      ; 
	JMP UPDATE_CURRENT_PLAYER_SPRITE_TILES[dir_offset]            ; JUMP-> UPDATE PLAYER SPRITE TILES (B2/B3 = GRAPHIC INFO POINTER, A= DIRECTION OFFSET)

UPDATE_SPRITE_JUMPING:                                            ; UPDATE SPRITE GRAPHIC FOR JUMPING (Y=LOW BYTE, X=HIGH BYTE)
	STY TEMP_PLAYER_SPR_ADDR                                      ; SET SPRITE ADDR = TEMP SPRITE ADDR
	STX TEMP_PLAYER_SPR_ADDR+1                                    ; 
	LOAD_CUR_PLAYER_DIRECTION                                     ;  CONVERT PLAYER DIRECTION INTO JUMP SPRITE OFFSET  
	CLC                                                           ;
	ADC #$08                                                      ;
	LSR                                                           ;
	LSR                                                           ;
	LSR                                                           ;
	LSR                                                           ;
	TAX                                                           ;
	LDA JUMP_SPRITE_OFFSET_TABLE,X                                ;
	JMP UPDATE_CURRENT_PLAYER_SPRITE_TILES[dir_offset]            ; JUMP-> UPDATE PLAYER SPRITE TILES (B2/B3 = GRAPHIC INFO POINTER, A= DIRECTION OFFSET)

JUMP_SPRITE_OFFSET_TABLE:                                         ; JUMP SPRITE GRAPHIC OFFSET TABLE
	.DB $00, $00                                                  ; LEFT       JUMP SPRITE #1 
	.DB $04, $04                                                  ; LEFT-UP    JUMP SPRITE #2 
	.DB $08, $08                                                  ; UP         JUMP SPRITE #2 MIRRORED
	.DB $0C, $0C                                                  ; UP-RIGHT   JUMP SPRITE #1 MIRRORED
	.DB $0C, $0C                                                  ; RIGHT      JUMP SPRITE #1 MIRRORED
	.DB $10, $10                                                  ; RIGHT-DOWN  JUMP SPRITE #3 MIRRORED
	.DB $12, $12                                                  ; DOWN  JUMP SPRITE #3
	.DB $00, $00                                                  ; DOWN-LEFT  JUMP SPRITE #1

UPDATE_CURRENT_PLAYER_SPRITE_TILES[dir_offset]:                   ; UPDATE PLAYER SPRITE TILES (B2/B3 = GRAPHIC INFO POINTER, A= DIRECTION OFFSET)
	ADD_A_TO_16BIT_ADDR TEMP_PLAYER_SPR_ADDR
	
UPDATE_CURRENT_PLAYER_SPRITE_TILES:                               ; SET CORRECT TILE BANK TO USE FOR SPRITE
	LDY #$03                                                      ; 
	LDA (TEMP_PLAYER_SPR_ADDR),Y                                  ; 
	TAY                                                           ; 
	AND #$78                                                      ; 
	LOG_SHIFT_RIGHT_2
	
@check_for_spr_1400_chang:
	TAX                                                           ;
	LDA X400_X800_CHR_BANKS_SPR_CHG_TABLE,X                       ; SET NEW SPR $1400 BANK  FROM (1400, 1800 CHR BAN) SPRITE PLAYER GRAPHIC TABLE
	BEQ CHECK_FOR_SPR_1800_CHANGE                                 ; 

@set_1400_spr_bank:  
	STA SOFT_CHR_1400_BANK                                        ; SET RAM $1400 SPRITE CHR BANK = NEW SPR $1400 BANK  
	IF_BALL_SNAPPED[ADDR] CHECK_FOR_SPR_1800_CHANGE
	
@set_pre_snap_sprite_bank: 
	LDA #$34                                                      ; SET SPR $1400 BANK =  HIKE SPRITES
	STA SOFT_CHR_1400_BANK                                        ; 
	
CHECK_FOR_SPR_1800_CHANGE:                                        ; SET SPR TILE BANK 
	LDA X400_X800_CHR_BANKS_SPR_CHG_TABLE+1,X                     ; SET NEW SPR $1800 BANK  FROM (1400, 1800 CHR BAN) SPRITE PLAYER GRAPHIC TABLE
	BEQ @set_spr_tiles_mirroring                                  ; 
	STA SOFT_CHR_1800_BANK                                        ; SET RAM $1800 SPRITE CHR BANK = NEW SPR $1800 BANK  
@set_spr_tiles_mirroring:                                         ; 
	TYA                                                           ; SAVE HORIZONTAL MIRRORING INFO IN $B4 
	LSR                                                           ;
	AND #$40                                                      ; 
	STA TEMP_PLAYER_SPR_MIRR                                      ; 
	LDX_ABS_ZP PLAYER_SPR_INDEX_TEMP                             ; LOAD SPRITE INDEX *** uses long 0000 instruction uneeded
	LDY #$00                                                      ; SET TOP OF PLAYER SPRITE TILE == FIRST TABLE ENTRY
	LDA (TEMP_PLAYER_SPR_ADDR),Y                                  ;
	STA CUR_PLAYER_SPR_TILE_LEFT,X                                ; 
	LDA CUR_PLAYER_SPR_ATTR_LEFT,X                                ; LOAD TOP OF SPRITE ATTRIBUTES 
	AND #$1F                                                      ; CLEAR HORIZONTAL/VERT MIRRORING AND SPRITE PRIORITY
	ORA TEMP_PLAYER_SPR_MIRR                                      ; SET TOP OF PLAYER SPRITE ATTR  =  HORIZONATAL MIRRORING 
	STA CUR_PLAYER_SPR_ATTR_LEFT,X                                ;
	INY                                                           ;
	LDA (TEMP_PLAYER_SPR_ADDR),Y                                  ; SET BOTTOM OF PLAYER SPRITE TILE == SECOND TABLE ENTRY
	STA CUR_PLAYER_SPR_TILE_RIGHT,X                               ; 
	LDA CUR_PLAYER_SPR_ATTR_RIGHT,X                               ; LOAD BOTTOM OF SPRITE ATTRIBUTES
	AND #$3F                                                      ; CLEAR HORIZONTAL/VERT MIRRORING
	ORA TEMP_PLAYER_SPR_MIRR                                      ; 
	STA CUR_PLAYER_SPR_ATTR_RIGHT,X                               ; SET TOP OF PLAYER SPRITE HORIZONATAL MIRRORING 
	INY                                                           ;
	LDA (TEMP_PLAYER_SPR_ADDR),Y                                  ; DOES THIRD TABLE ENTRY = DIVE OR JUMP GRAPHIC?
	BEQ @clear_third_sprite                                       ; NO->SET EXTRA PLAYER SPRITE OFFSCREEN IF NEEDED
	LDX_ABS_ZP EXTRA_SPR_INDEX_TEMP                                ; DOES EXTRA SPRITE INDEX = NONE *** uses long 0000 instruction uneeded
	BNE @player_has_third_sprite                                  ; NO->UPDATE EXTRA SPRITE (FOR DIVING JUMPING)
	LDX #$10                                                      ; SET OFFSET=  EXTRA SPRITES

@check_sprite_offscreen:                                          ; CHECK FOR TOP OF PLAYER SPRITE OFFSCREEN LOOP
	LDA CUR_SPRITE_Y,X                                            ; IS TOP OF PLAYER SPRITE Y LOCATION == OFFSCREEN
	CMP #SPRITE_OFFSCREEN                                         ; 
	BCS @sprite_offscreen                                         ; YES->TOP OF PLAYER SPRITE OFFSCREEN
	SET_X_INDEX_NEXT_SPRITE                                       ;
	CPX #$30                                                      ; HAVE WE CHECKED ALL SPRITES?
	BNE @check_sprite_offscreen                                   ; NO-> CHECK FOR TOP OF PLAYER SPRITE OFFSCREEN LOOP
	RTS                                                           ; RETURN

@sprite_offscreen:                                                ; TOP OF PLAYER SPRITE OFFSCREEN
	TXA                                                           ; SET EXTRA SPRITE INDEX = SPRITE INDEX 
	STA EXTRA_SPR_INDEX_TEMP                                      ;
	LDY #EXTRA_SPRITE_INDEX                                       ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDY #$02                                                      ; LOAD THIRD TABLE ENTRY FROM SPRITE GRAPHIC INFO ADDR
	LDA (TEMP_PLAYER_SPR_ADDR),Y                                  ;
@player_has_third_sprite:                                         ; UPDATE EXTRA SPRITE (FOR DIVING JUMPING)
	STA CUR_SPRITE_TILE,X                                         ; SAVE EXTRA PLAYER SPRITE TILE
	LDY PLAYER_SPR_INDEX_TEMP                                     ; SET MAIN SPRITE ATTRIBS = MAIN SPRITE PAL 
	LDA CUR_SPRITE_ATTR,Y                                         ; 
	AND #$03                                                      ; 
	ORA TEMP_PLAYER_SPR_MIRR                                      ; + HORIZONTAL MIRRORING INFO
	STA CUR_SPRITE_ATTR,X                                         ;
	LDY #$03                                                      ; LOAD 4TH TABLE ENTRY
	LDA (TEMP_PLAYER_SPR_ADDR),Y                                  ;
	AND #$07                                                      ; MASK OUT CHR BANKS AND MIRRORING 
	STA TEMP_PLAYER_SPR_MIRR                                      ; SAVE SPECIAL SPRITE INFO IN $B4
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; SET SPECIAL SPRITE INFO IN PLAYER MOVEMENT
	AND #$F8                                                      ;
	ORA TEMP_PLAYER_SPR_MIRR                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RTS                                                           ; RETURN

@clear_third_sprite:                                              ; SET EXTRA PLAYER SPRITE OFFSCREEN IF IT EXISTS AND CLEAR EXTRA SPRITE INDEXES
	LDX EXTRA_SPR_INDEX_TEMP                                      ; DOES EXTRA SPRITE INDEX = NONE
	BEQ @exit                                                     ; YES->EXIT
	LDA #SPRITE_OFFSCREEN                                         ; SET SPRITE Y = OFFSCREEN
	STA CUR_SPRITE_Y,X                                            ;
	LDA #$00                                                      ; 
	LDY ##EXTRA_SPRITE_INDEX                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; SET PLAYER RAM SPECIAL SPRITE INDEX = NONE
	STA EXTRA_SPR_INDEX_TEMP                                      ; SET SPECIAL SPRITE INDEX = NONE
@exit:                                                            ; EXIT
	RTS                                                           ; RETURN

_F}_UPDATE_PLAYER_SPRITE_FUNCTIONS

_F{_SET_CHECK_PLAYER_FINAL_LOCATION_FUNCTIONS                     ; DONE

x_distance   = LOCAL_3
final_location  = EXTRA_PLAYER_RAM_4

SAVE_FINAL_X_OR_Y_LOC_PLAYER_RAM[x_y]:                            ; PUT FINAL LOCATION IN PLAYER RAM 1E 1F BASED ON LARGEST CHANGE (X,Y)
	TXA                                                           ; =ABS(X DISTANCE)
	ABS_A 
	STA x_distance                                                ; SAVE ABS(X DISTANCE)in $40
	TYA                                                           ; =ABS(Y DISTANCE)
	ABS_A
@check_y_greater_x
	CMP x_distance                                                ; ABS (Y DIST) > ABS (X DIST) ?
	BCC @save_final_x_location                                    ; NO-> SAVE FINAL X VALUE
	
@save_final_y_location: 
	TYA                                                           ; FINAL Y LOCATION = CURRENT Y LOCATION + Y DISTANCE
	LDY #Y_POS + 1                                                ; 
	CLC                                                           ;
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #final_location                                           ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ; 
	LDA #$FF                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RTS                                                           ; RETURN
	
@save_final_x_location:                                           ; SAVE FINAL X VALUE
	TXA                                                           ; FINAL X LOCATION = CURRENT X LOCATION + X DISTANCE
	LDY #X_POS + 1                                                ; 
	CLC                                                           ; 
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #final_location                                           ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;

@signed_add:                                                      ; add 1 or -1 if needed 
	TXA                                                           ; 
	AND #$80                                                      ; 
	BPL @save_x_high_byte                                         ; 
	ORA #$FF                                                      ; 
	
@save_x_high_byte:                                                ; 
	LDY #X_POS + 2                                                ; 
	ADC (CURRENT_PLAYER_ADDR),Y                                   ; 
	LDY #final_location +1                                        ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RTS                                                           ; RETURN

CHECK_IF_PLAYER_FINAL_LOCK_BACK_OF_ENDZONE:                       ; CHECK IF PLAYER IS AT OR JUST PAST FINAL LOCATION in PLAYER RAM 1E/1F()
	LOAD_CUR_PLAYER_COLLISION_STATUS 
	LSR                                                           ; 
	BCC CHECK_IF_PLAYER_AT_FINAL_LOCATION                         ; NO-> PLAYER AT FINAL MOVE LOCATION CHECK
	ASL                                                           ; SET PLAYER COLLISION = NOT COLLIDED WITH BACK OF ENDZONE
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	SEC                                                           ; SET CARRY = PLAYER COLLIDED WITH BACK OF ENDZONE
	RTS                                                           ; RETURN

CHECK_IF_PLAYER_AT_FINAL_LOCATION:                                ; PLAYER AT FINAL MOVE LOCATION CHECK
	LDY #final_location +1                                        ; IS HIGH BYTE IN PLAYER RAM POSITIVE?
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	BPL @check_x_location                                         ; YES->FINAL LOCATION IS X LOCATION
	DEY                                                           ; PLAYER FINAL Y LOCATION == PLAYER CURRENT Y LOCATION
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDY #Y_POS + 1                                                ;   
	CMP (CURRENT_PLAYER_ADDR),Y                                   ;
	BEQ @player_at_final_loc                                      ; YES->PLAYER DONE MOVING
																; CARRY SET IF PLAYER BELOW FINAL BALL LOCATION
	LOAD_CUR_PLAYER_DIRECTION
	ROR                                                           ;
	AND #$C0                                                      ;
	BEQ @player_not_at_final_loc                                  ; ->PLAYER NOT AT FINAL LOCATION
	CMP #$C0                                                      ;
	BEQ @player_not_at_final_loc                                  ; ->PLAYER NOT AT FINAL LOCATION

@player_at_final_loc:                                             ; PLAYER DONE MOVING
	SEC                                                           ; SET CARRY = PLAYER AT FINAL LOCATION
	RTS                                                           ; RETURN

@check_x_location:                                                ; FINAL LOCATION IS X LOCATION
	TAX                                                           ; SAVE PLAYER FINAL X HIGH IN X
	DEY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER FINAL X LOW == PLAYER CURRENT X LOW?
	LDY #X_POS + 1                                                ;
	CMP (CURRENT_PLAYER_ADDR),Y                                   ;
	BEQ @check_player_at_final_x_loc_high                         ; YES-> CHECK PLAYER FINAL X HIGH == PLAYER CURRENT X HIGH

@player_past_location:                                            ; PLAYER PAST LOCATION
	INY                                                           ; 
	TXA                                                           ; = CARRY + PLAYER FINAL X HIGH -  PLAYER CURRENT X HIGH
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	ROR PAST_LOC_CARRY_TEMP                                       ; USE SPRITE INFO ADDR AS TEMP STORAGE FOR CARRY
	LOAD_CUR_PLAYER_DIRECTION                                     ;
	ASL                                                           ;
	EOR (CURRENT_PLAYER_ADDR),Y                                   ; 
	EOR PAST_LOC_CARRY_TEMP                                       ;
	ASL                                                           ; SET CARRY = PLAYER PAST FINAL LOCATION
	RTS                                                           ; RETURN

@check_player_at_final_x_loc_high:                                ; CHECK PLAYER FINAL X HIGH == PLAYER CURRENT X HIGH
	INY                                                           ; PLAYER FINAL X HIGH  == PLAYER CURRENT X HIGH?
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	LDY #final_location +1                                        ;
	CMP (CURRENT_PLAYER_ADDR),Y                                   ;
	BNE @player_not_at_final_loc                                  ; NO-> PLAYER NOT AT FINAL LOCATION
	SEC                                                           ; SET CARRY = PLAYER AT FINAL LOCATION
	RTS                                                           ; RETURN
	
@player_not_at_final_loc:                                         ; PLAYER NOT AT FINAL LOCATION
	CLC                                                           ; CLEAR CARRY = PLAYER NOT AT FINAL LOCATION
	RTS                                                           ; RETURN

CHECK_DEFENDER_REACHED_FINAL_LOC_PASS:                            ; CHECK IF DEFENDER REACHED FINAL LOCATION, IF AT BACK OF ENDZONE SET LOC TO FINAL BALL Y()
	LOAD_CUR_PLAYER_COLLISION_STATUS 
	LSR                                                           ;
	BCC CHECK_IF_PLAYER_AT_FINAL_LOCATION                         ; NO-> PLAYER AT FINAL LOCATION CHECK
	LDA FINAL_BALL_Y                                              ; SAVE FINAL BALL Y IN 1E/1F
	LDY #final_location                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$FF                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	JMP CHECK_IF_PLAYER_AT_FINAL_LOCATION                         ; JUMP->PLAYER AT FINAL LOCATION CHECK

_F}_SET_CHECK_PLAYER_FINAL_LOCATION_FUNCTIONS 

_F{_UPDATE_PLAYER_VELOCITY_FUNCTIONS                              ; DONE

STOP_PLAYER_UPDATE_SPRITE_TO_STANDING_STILL:                      ; SET (AE) PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING, UPDATE SPRITE
	JSR SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING                     ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING() 
	JMP UPDATE_PLAYER_SPRITE_NORMAL                               ; UPDATE SPRITE TO STANDING/MOVING/ QB READY TO THROW

SET_PLAYER_VEL_ZERO_STATUS_NOT_MOVING:                            ; SET PLAYER VELOCITY TO ZERO, STATUS TO NOT MOVING                        
	LDA #$00                                                      ; SET PLAYER X VELOCITY = ZERO
	LDY #X_VELOCITY                                               ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; SET PLAYER Y VELOCITY = ZERO
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SET_CURRENT_PLAYER_NOT_MOVING
	RTS                                                           ; RETURN


vel_table_addr   = LOCAL_1
temp_velocity_1   = LOCAL_3
current_player_speed = LOCAL_5 
temp_velocity_2   = LOCAL_7
temp_velocity           = LOCAL_7

offset_to_second_velocity_index  =  $0200 
up_right_down_bitmask = $C0
	
INIT_PLAYER_VELOCITY_CUR_SPEED:                                   ; SET/RESET X/Y VELOCITY BASED ON PLAYER CURRENT SPEED & DIRECTION()
	LOAD_CUR_PLAYER_SPEED 
INIT_PLAYER_VELOCITY_NEW_SPEED[speed]:                           ; SET/RESET X/Y VELOCITY BASED ON NEW SPEED & PLAYER DIRECTION (A=SPEED)    
	STA current_player_speed                                      ; SAVE CURRENT SPEED $42 
	LOAD_CUR_PLAYER_DIRECTION                                     ;	
	ASL                                                           ; 
	ASL                                                           ;
	ASL                                                           ;
	PHP                                                           ;
	CLC                                                           ;
	ADC #<ANG_VEL_TABLE                                           ; ANGULAR VELOCITY TABLE START ADDR ($C6EE) + TABLE OFFSET 
	STA vel_table_addr                                            ;
	LDA #$00                                                      ;
	ADC #>ANG_VEL_TABLE                                           ;
	PLP                                                           ;
	ADC #$00                                                      ;
	STA vel_table_addr+1                                          ;
	LDY #$01                                                      ; 
	LDA (vel_table_addr),Y                                        ; SET X VELOCITY FROM ANGULAR VELOCITY TABLE 
	TAX                                                           ; 
	DEY                                                           ;
	LDA (vel_table_addr),Y                                        ; SET Y VELOCITY FROM ANGULAR VELOCITY TABLE
	TAY                                                           ; 
	LDA current_player_speed                                      ; LOAD PLAYER CURRENT SPEED
	JSR MULTIPLY_A_TIMES_X_Y                                      ; PLAYER CURRENT SPEED * X,Y VELOCITY (result in $44 $45)
	LDA temp_velocity                                             ; SAVE FIRST VELOCITY VALUE IN $40,41
	STA temp_velocity_1                                           ;
	LDA temp_velocity+1                                           ;
	STA temp_velocity_1+1                                         ;
	LDA vel_table_addr                                            ; = CURRENT VELOCITY TABLE ADDRESS + OFFSET TO SECOND VELOCITY VALUE (0X0200)
	CLC                                                           ;
	ADC #<offset_to_second_velocity_index                         ;
	STA vel_table_addr                                            ;
	LDA vel_table_addr+1                                          ;
	ADC #>offset_to_second_velocity_index                         ;
	STA vel_table_addr+1                                          ;
	LDY #$01                                                      ;
	LDA (vel_table_addr),Y                                        ;
	TAX                                                           ; SET X VELOCITY FROM TABLE
	DEY                                                           ;
	LDA (vel_table_addr),Y                                        ;
	TAY                                                           ; SET Y VELOCITY FROM TABLE
	LDA current_player_speed                                      ; LOAD CURRENT SPEED
	JSR MULTIPLY_A_TIMES_X_Y                                      ; = CURRENT SPEED * CURRENT VELOCITY (result in $44 $45)
	LOAD_CUR_PLAYER_DIRECTION                                     ;
	LDY #X_VELOCITY                                               ; SET PLAYER OBJECT INDEX = PLAYER X VELOCITY
	AND #up_right_down_bitmask                                    ; PLAYER MOVING LEFT?
	BEQ @player_moving_mostly_left                                ; YES-> PLAYER MOSTLY MOVING LEFT    
	CMP #UP_DIRECTION                                             ; PLAYER MOVING UP?
	BEQ @player_moving_mostly_up                                  ; YES-> PLAYER MOSTLY MOVING UP
	CMP #RIGHT_DIRECTION                                          ; PLAYER MOVING RIGHT?
	BEQ @player_moving_mostly_right                               ; YES-> PLAYER MOSTLY MOVING RIGHT

@player_moving_mostly_down                                        ; PLAYER MOSTLY MOVING DOWN
	LDA #$00                                                      ; PLAYER X VELOCITY =  - VELOCITY VALUE 1
	SEC                                                           ;
	SBC temp_velocity_1                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA #$00                                                      ;
	SBC temp_velocity_1+1                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ; PLAYER Y VELOCITY = VELOCITY VALUE 2
	LDA temp_velocity_2                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA temp_velocity_2+1                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN

@player_moving_mostly_right:                                      ; PLAYER MOSTLY MOVING RIGHT
	LDA temp_velocity_2                                           ; PLAYER X VELOCITY = VELOCITY VALUE2
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA temp_velocity_2+1                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; PLAYER Y VELOCITY = VELOCITY VALUE1
	LDA temp_velocity_1                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA temp_velocity_1+1                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	RTS                                                           ; RETURN

@player_moving_mostly_up :                                        ; PLAYER MOSTLY MOVING UP
	LDA temp_velocity_1                                           ; PLAYER X VELOCITY = VELOCITY VALUE1
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA temp_velocity_1+1                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ; PLAYER Y VELOCITY = VELOCITY VALUE2
	LDA #$00                                                      ;
	SEC                                                           ;
	SBC temp_velocity_2                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$00                                                      ;
	SBC temp_velocity_2+1                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN

@player_moving_mostly_left:                                       ; PLAYER MOVING LEFT
	LDA #$00                                                      ; PLAYER X VELOCITY = – VELOCITY VALUE2
	SEC                                                           ;
	SBC temp_velocity_2                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$00                                                      ;
	SBC temp_velocity_2+1                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$00                                                      ; PLAYER Y VELOCITY = – VELOCITY VALUE1
	SEC                                                           ;
	SBC temp_velocity_1                                           ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA #$00                                                      ;
	SBC temp_velocity_1+1                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN

																; EXAMPLE PLAYER MOVING COMPLETELY LEFT
																; DIRECTION VALUE =
																; TABLE LOADS 00  FOR VALUE 1
																; TABLE LOADS 08 FOR VALUE 2 
																; X VELOCITY= CURRENT VELOCITY –  08  
																; Y VELOCITY = CURRENT VELOCITY – 00 
																; only uses most upper i=bbt

temp_velocity_1   = LOCAL_1
temp_velocity_2   = LOCAL_3

velocity_val_1 = LOCAL_1
velocity_val_2 = LOCAL_3										  ;   
														          ; ONLY CALLED WHEN ACCELERATION TIMER IS DONE
ADD_VELOCITY_BASED_ON_DIRECTION:                                  ; UPDATE PLAYER VELOCITY BASED ON CURRENT DIRECTION 
	LOAD_CUR_PLAYER_DIRECTION
	TAX                                                           ;
	ASL                                                           ; 
	ASL                                                           ;
	ASL                                                           ; 
	PHP                                                           ; 
	CLC                                                           ; 
	ADC #<(ANG_VEL_TABLE+1)                                       ; = TABLE OFFSET +  ANGULAR VELOCITY TABLE START ADDR ($C6EF)
	STA temp_velocity_1                                           ; 
	LDA #$00                                                      ; 
	ADC #>(ANG_VEL_TABLE+1)                                       ; 
	PLP                                                           ; 
	ADC #$00                                                      ; 
	STA temp_velocity_1+1                                         ; SAVE VELOCITY TABLE ADDR $C6EF + TABLE OFFSET in 3E,3F FOR VELOCITY VALUE 1
	LDA temp_velocity_1                                           ;
	CLC                                                           ;
	ADC #<offset_to_second_velocity_index                         ;
	STA temp_velocity_2                                           ; SAVE VELOCITY TABLE ADDR $C6EF + OFFSET TO 2ND VELOCITY TABLE ($200) in 40,41 FOR VELVALUE 2
	LDA temp_velocity_1+1                                         ;
	ADC #>offset_to_second_velocity_index                         ;
	STA temp_velocity_2+1                                         ; 

@load_player_direction:	
	TXA                                                           ; LOAD PLAYER DIRECTION
	LDX #$00                                                      ; 
	LDY #X_VELOCITY                                               ; LOAD X VELOCITY RAM INDEX
	AND #up_right_down_bitmask                                    ; IS PLAYER DIRECTION MOSTLY LEFT?
	BEQ @update_velocity_mostly_left                              ; YES-> PLAYER MOVING MOSTLY LEFT 
	CMP #UP_DIRECTION                                             ; IS PLAYER DIRECTION MOSTLY UP?
	BEQ @update_velocity_mostly_up                                ; YES-> PLAYER MOVING MOSTLY UP
	CMP #RIGHT_DIRECTION                                          ; IS PLAYER DIRECTION MOSTLY RIGHT?
	BEQ @update_velocity_mostly_right                             ; YES-> PLAYER MOVING MOSTLY RIGHT
																  ;       

														
@update_velocity_mostly_down:                                     ; UPDATE PLAYER MOVING MOSTLY DOWN
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER X VELOCITY =PLAYER X VELOCITY - VELOCITY VALUE1
	SEC                                                           ; 
	SBC (velocity_val_1,X)                                        ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; 
	SBC #$00                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER Y VELOCITY =PLAYER Y VELOCITY + VELOCITY VALUE2
	CLC                                                           ;
	ADC (velocity_val_2,X)                                        ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	ADC #$00                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; RETURN
	RTS

@update_velocity_mostly_right:                                    ; PLAYER MOVING MOSTLY RIGHT
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER X VELOCITY =PLAYER X VELOCITY + VELOCITY VALUE2
	CLC                                                           ;
	ADC (velocity_val_2,X)                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	ADC #$00                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER Y VELOCITY =PLAYER Y VELOCITY + VELOCITY VALUE1
	CLC                                                           ;
	ADC (velocity_val_1,X)                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	ADC #$00                                                      ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN

@update_velocity_mostly_up:                                       ; PLAYER MOVING MOSTLY UP
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER X VELOCITY =PLAYER X VELOCITY + VELOCITY VALUE1
	CLC                                                           ;
	ADC (velocity_val_1,X)                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	ADC #$00                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER Y VELOCITY =PLAYER Y VELOCITY – VELOCITY VALUE2
	SEC                                                           ;
	SBC (velocity_val_2,X)                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SBC #$00                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN

@update_velocity_mostly_left:                                     ; PLAYER MOVING MOSTLY LEFT
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER X VELOCITY =PLAYER X VELOCITY – VELOCITY VALUE2
	SEC                                                           ;
	SBC (velocity_val_2,X)                                        ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SBC #$00                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ; 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; PLAYER Y VELOCITY =PLAYER Y VELOCITY – VELOCITY VALUE1
	SEC                                                           ;
	SBC (velocity_val_1,X)                                        ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	INY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	SBC #$00                                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                   ;
	RTS                                                           ; RETURN

	
forty_five_degrees   = $20 
	
UPDATE_DIR_RESET_SPEED_GRTR_THAN_45DEG_CHANGE:                    ; UPDATE PLAYER DIRECTION AND RESET RS/RP IF CHANGE GREATER THAN 45 d(A=DIRECTION)
	TAX                                                           ; SAVE NEW PLAYER DIRECTION 
	LOAD_CUR_PLAYER_MOVEMENT_STATUS                               ; IS PLAYER MOVING
	BPL @reset_to_intial_speed                                    ; YES->RESET CURRENT SPEED AND RUSHING POWER COUNTER AND SET DIRECTION(X= DIRECTION)
	TXA                                                           ; DIRECTION CHANGE = NEW DIRECTION - CURRENT PLAYER DIRECTION
	LDY #CURRENT_DIRECTION                                        ; 
	SEC                                                           ; 
	SBC (CURRENT_PLAYER_ADDR),Y                                   ; 
	BEQ @exit                                                     ; DIRECTION CHANGE =0?  YES->RETURN
	BPL @check_for_more_than_45                                   ; ABS (DIRECTION)
	EOR #$FF                                                      ; 
	CLC                                                           ;
	ADC #$01                                                      ;
@check_for_more_than_45:                                          ; CHECK FOR GREATER THAN 45 DEGREE ANGLE CHANGE
	CMP #forty_five_degrees + 1                                   ; DIRECTION CHANGE >= 46 DEGREES
	BCS @reset_to_intial_speed                                    ; YES-> RESET CURRENT SPEED AND RUSHING POWER COUNTER AND SET DIRECTION(X= DIRECTION)
	TXA                                                           ; SAVE NEW DIRECTION
	SET_CUR_PLAYER_DIRECTION
@exit:                                                            ; EXIT
	RTS                                                           ; RETURN

@reset_to_intial_speed:                                           ; RESET CURRENT SPEED AND RUSHING POWER COUNTER AND SET DIRECTION(X= DIRECTION)
	TXA                                                           ; SET CURRENT PLAYER DIRECTION = NEW DIRECTION
	SET_CUR_PLAYER_DIRECTION                                      ; 
SET_PLAYER_STATUS_TO_MOVING_INIT_RS_RP:                           ; SET PLAYER TO MOVING, SET RS AND RP TO INTIIAL VALUE
	SET_CURRENT_PLAYER_MOVING[] 
	LOAD_CUR_PLAYER_RP_RS_INDEXES                                 ;
	PHA                                                           ; SAVE RP_RS SKILL INDEXES  ON STACK
	LOG_SHIFT_RIGHT_4
	TAY                                                           ; RESET PLAYER RUSHING POWER and CURRENT SPEED (RS) TO INITIAL VALUE 
	LDA RUSHING_POWER_VALUES_TABLE,Y                              ; LOAD RUSHING POWER FROM RUSHING_POWER_VALUES
	SET_CUR_PLAYER_RUSHING_PWR_CTR
	PLA                                                           ; RESTORE RP_RS SKILL INDEXE 
	AND #$0F                                                      ; MASK OUT RUSHING POWER INDEX
	TAY                                                           ; 
	LDA RUNNING_SPEED_VALUES_TABLE,Y                              ; LOAD RUNNING SPEED FROM RUNNING SPEED_VALUES
	SET_CUR_PLAYER_SPEED
	RTS                                                           ; RETURN

_F}_UPDATE_PLAYER_VELOCITY_FUNCTIONS 

_F{_GET_GREATER_REMAINING_BALL_DISTANCE_X_OR_Y                    ; DONE
																; Gets the greater remaining distance X/Y for the pass dive/jump check
																; max distance = 32 yards.
temp_x_distance  = LOCAL_8
thirty_two_yards = $FF

GET_LARGER_BALL_DIST_FOR_PASS_DIVE_JUMP_CHECK:                    ; GET GREATER REMAINING BALL DISTANCE(X,Y) 
	LDA BALL_X+1                                                  ; BALL X- FINAL BALL X
	SEC                                                           ; 
	SBC FINAL_BALL_X                                              ; 
	STA temp_x_distance                                           ; 
	LDA BALL_X+2                                                  ; 
	SBC FINAL_BALL_X+1                                            ; 
	BMI @check_x_greater_32                                       ; IS VALUE NEGATIVE? YES->CHECK IF X IS MORE THAN 32 YARDS 
	
	BEQ @check_y_distance                                         ; DISTANCE <32 YARDS? ->Y DISTANCE CHECK

@check_x_greater_32:                                              ; CHECK IF X IS MORE THAN 32 YARDS       
	CMP #thirty_two_yards                                         ; IS X DISTANCE > 32 YARDS?  
	BNE @set_x_distance_32_yards                                  ; YES->SET X DISTANCE TO 32 YARDS

@negate_x: 
	LDA #$00                                                      ;  = -X 
	SEC                                                           ;
	SBC temp_x_distance                                           ;
	STA temp_x_distance                                           ; SAVE FINAL X DISTANCE IN $45 
	JMP @check_y_distance                                         ; BRANCH TO  Y DISTANCE CHECK
	
@set_x_distance_32_yards:                                         ; SET X DISTANCE TO 32 YARDS
	LDA #thirty_two_yards                                         ; SET X DISTANCE = MAX YARDAGE = 32 YARDS
	STA temp_x_distance                                           ; 
	
@check_y_distance:                                                ; Y DISTANCE CHECK
	LDA BALL_Y+1                                                  ; BALL Y- FINAL BALL Y
	SEC                                                           ;
	SBC FINAL_BALL_Y                                              ; 
	ABS_A                                                         ; ABS (BALL Y- FINAL BALL Y) 
	
@check_larger_x_or_y:                                             ; CHECK FOR LARGER DISTANCE X OR Y
	CMP temp_x_distance                                           ; ABS(BALL Y- FINAL BALL Y) >  ABS(BALL X- FINAL BALL X)  
	BCS @exit                                                     ; YES-> KEEP Y DIST AND EXIT

@use_x_distance: 
LDA temp_x_distance                                            ; NO-> LOAD X DIST
@exit:                                                            ; EXIT
	RTS                                                           ; RETURN

_F}_GET_GREATER_REMAINING_BALL_DISTANCE_X_OR_Y 

_F{_SET_CUTSCENE_TO_PLAY                                          ; DONE
	
no_cutscene = $01
	
SAVE_PLAYER_ADDR_SET_CUTSCENE_SET_CHANCE_TO_0:                    ; SET CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE) SET CUTSCENE RAND TO 1  
	LDX #no_cutscene                                              ; SET CUTSCENE RANDOM = DON’T DO CUTSCENE
	STX CUTSCENE_CHANCE                                           ;
	
SAVE_PLAYER_ADDR_SET_CUTSCENE:                                    ; LOAD CUTSCENE TO PLAY AND WAIT UNTIL CUTSCENE DONE(A=CUTSCENE)   
	STA CUTSCENE_TO_DRAW                                          ; SAVE CUTSCENE TO PLAY
	SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	
@wait_for_scene_to_finish:                                        ; WAIT FOR CUTSCENE TO FINISH
	RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA CUTSCENE_TO_DRAW                                          ; IS CURRENT CUTSCENE = NONE = DONE
	BNE @wait_for_scene_to_finish                                 ; NO-> WAIT FOR CUTSCENE TO FINISH   
	JMP RETURN_TO_SAVED_COMMAND_ADDR                              ; YES-> RETURN TO COMMAND ADDRESS STORED IN PLAYER RAM 1E/1F ()

_F}_SET_CUTSCENE_TO_PLAY 

_F{_RETURN_TO_PREVIOUS_COMMAND_ADDR                               ; DONE
return_addr_index = EXTRA_PLAYER_RAM_4

RETURN_TO_SAVED_COMMAND_ADDR:                                     ; RETURN TO COMMAND ADDR STORED IN PLAYER RAM 1E/1F()
	LDY #return_addr_index +1                                     ; LOAD RETURN ADDRESS FROM PLAYER RAM 1E/1F 
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	BPL @pause_player_actions                                     ; pause player actions if return address not legitmate
	PHA                                                           ; 
	DEY                                                           ;
	LDA (CURRENT_PLAYER_ADDR),Y                                   ;
	PHA                                                           ;
	RTS                                                           ; RETURN TO COMMAND ADDR 
@pause_player_actions:                                            ; LIKELY UNREACHABLE (OR VERY VERY RARE)
	PAUSE_PLAYER_ACTIONS

_F}_RETURN_TO_PREVIOUS_COMMAND_ADDR 

_F{_SET_UNSET_PLAYER_COLLISION_WITH_BALL                          ; DONE
	
	
SET_PLAYER_COLLIDED_WITH_BALL:                                    ; SET PLAYER COLLISION = COLLIDED WITH BALL()
	SET_CUR_PLAYER_COLLIDED_WITH_BALL[]
	RTS                                                           ; RETURN

SET_PLAYER_NOT_COLLIDED_WITH_BALL:                                ; SET PLAYER COLLISION = NOT COLLIDED WITH BALL()
	SET_CUR_PLAYER_NOT_COLLIDED_WITH_BALL[]
	RTS                                                           ; RETURN

_F}_SET_UNSET_PLAYER_COLLISION_WITH_BALL 

	
_F{_SET_BALL_FUMBLED_BLOCKED_FUNCTIONS                            ; DONE 
	
SET_BALL_FUMBLED_DO_FUMBLE_ANI:                                   ; SET BALL STATUS TO FUMBLED AND START BALL ANIMATION THREAD()
	SET_BALL_FUMBLED[] 
DO_FUMBLE_ANI:                                                    ; START BALL BOUNCING ANIMATION THREAD
	LDA #BALL_ANIMATION_BANK                                      ; SET TASK 4 A000 BANK = BANK 23
	STA DRAWING_TASK+TASK_BANK_A000                               ;  
	LDY #<(BALL_BOUNCING_ON_GROUND_ROUTINE-1)                     ; SET TASK ADDR =  BALL BOUNCING ON GROUND
	LDA #>(BALL_BOUNCING_ON_GROUND_ROUTINE)                       ; 
	LDX #BALL_ANIMATION_BANK                                      ; LOAD BANK 22
	JSR CREATE_TASK                                               ; CREATE TASK (X=BANK, A,Y=ADDRESS)
	RTS                                                           ; RETURN

SET_BALL_BLOCKED_DO_BLOCKED_ANI:                                  ; SET BALL STATUS TO BLOCKED AND START BALL BLOCKED THREAD()
	SET_BALL_DEFLECTED[]
DO_BALL_BLOCKED_ANI:                                              ; START BALL BLOCKED THREAD()
	LDA #BALL_ANIMATION_BANK                                      ; SET TASK 4 A000 BANK = BANK 23
	STA DRAWING_TASK+TASK_BANK_A000                               ; 
	LDY #<(BALL_BLOCKED_ROUTINE-1)                                ; SET TASK ADDR = BALL BLOCKED TASK ADDRESS
	LDA #>(BALL_BLOCKED_ROUTINE)                                   ;
	LDX #BALL_ANIMATION_BANK                                      ; SET BANK  = BANK 22
	JSR CREATE_TASK                                               ; CREATE TASK (X=BANK, A,Y=ADDRESS)
	RTS                                                           ; RETURN
	
	
_F}_SET_BALL_FUMBLED_BLOCKED_FUNCTIONS
		
_F{_BALL_LEAVING_HAND_SPRITE_ADJUST_TABLE                         ; DONE 
						
BALL_LEAVE_HAND_SPR_ADJ_TABLE:                                    ; BALL LEAVING HAND Y AND X BALL XTRA SPRITE ADJUSTMENT TABLE
																; Y       X
	.DB $FE , $FA                                              ; LEFT    
	.DB $F8 , $F8                                              ; LEFT UP  
	.DB $FC , $00                                              ; UP
	.DB $00 , $00                                              ; UP RIGHT  
	.DB $00 , $02                                              ; RIGHT
	.DB $00 , $FC                                              ; RIGHT DOWN
	.DB $00 , $F8                                              ; DOWN
	.DB $00 , $FE                                              ; DOWN LEFT

_F}_BALL_LEAVING_HAND_SPRITE_ADJUST_TABLE 

_F{_1400_1800_CHR_BANK_TABLES_FOR_PLAYER_SPRITE_CHANGES           ; DONE 

X400_X800_CHR_BANKS_SPR_CHG_TABLE:                                ; (1400, 1800 CHR BAN) SPRITE PLAYER GRAPHIC TABLE
																                  ; 1400 BANK, 1800 BANK
	.DB $00  , $00                                              ; DON’T CHANGE CHR BANKS
	.DB $06  , $00                                              ; PLAYER THROWING ARM FULLY EXTENDED+ DIVING, 0X41810
	.DB $09  , $00                                              ; QB HOLDING BALL+ SAME AS CHR6, 0X42410
	.DB $0D  , $00                                              ; CELEBRATE + CRY + DIVE       0X43410
	.DB $00  , $07                                              ; STANDARD, ON GRND + ANGLE THROW + JUMP+ MARKER 0X41C10-0X42C
	.DB $00  , $0A                                              ; BALL + JUMPING + KICKING     0X42810
	.DB $00  , $0B                                              ; HANDOFF + TUMBLE + DEF CHASE 0X42C10
	.DB $00  , $0C                                              ; QB DROPBACK + TUMBLE   0X43010
	.DB $00  , $0E                                              ; JUMP PLUS ARM IN MOTION      0X43810
	.DB $09  , $07                                              ;
	.DB $06  , $07                                              ; 
	.DB $34  , $00                                              ; CROWD+ REF+ HIKE+ KICK HOLD TILES 0X4D010

_F}_1400_1800_CHR_BANK_TABLES_FOR_PLAYER_SPRITE_CHANGES
	
_F{_PASS_DIVE_SPEED_ARRAY                                         ; DONE 
	
PASS_DIVE_SPEED_ARRAY:                                            ; PLAYER DIVING FOR PASS DIVE SPEED
	.DB $38                                                       ; SET PLAYER CURRENT SPEED = 0X38     
	.DB $80                                                       ; WAIT 5 FRAMES   
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $30                                                       ; SET PLAYER CURRENT SPEED = 0X30 
	.DB $80                                                       ; WAIT 5 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $28                                                       ; SET PLAYER CURRENT SPEED = 0X28 
	.DB $80                                                       ; WAIT 4 FRAMES
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $20                                                       ; SET PLAYER CURRENT SPEED = 0X20 
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $18                                                       ; SET PLAYER CURRENT SPEED = 0X18 
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $10                                                       ; SET PLAYER CURRENT SPEED = 0X10 
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $08                                                       ; SET PLAYER CURRENT SPEED = 0X08 
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $04                                                       ; SET PLAYER CURRENT SPEED = 0X04 
	.DB $80                                                       ;
	.DB $80                                                       ;
	.DB $00                                                       ; SET PLAYER CURRENT SPEED = 0X00 
	.DB $FF                                                       ; END OF DIVE SPEED ARRAY

_F}_PASS_DIVE_SPEED_ARRAY 

_F{_EIGHT_DIRECTION_SPRITE_DATA                                   ; DONE    

FORMAT                                                            ; TOP_TILE_ID, BOTTOM_TILE_ID, EXTRA TILE_ID, SPRITE TILE BANK TABLES + MIRRORING INFO
																; DIRECTION ORDER: LEFT, LEFT-UP, UP, RIGHT-UP,RIGHT,RIGHT-DOWN, DOWN, LEFT-DOWN
																; B14 = BANK FOR $1400 SPR CHR BANK 
																; B18 = BANK FOR $1800 SPR CHR BANK
																; HM= SPR HORIZONTAL MIRRORING SETTING 
																; DC = DON’T CHANGE
																; BANK $1000 CHR CYCLES THROUGH 0-5 TO DO RUNNING ANIMATIONS
																; BANK $1400 DEFAULT =6 , BANK $1800 DEFAULT =7, BANK $1C00 DEFAULT =8


												
PLAYER_STANDING_STILL_SPR_INFO:                                   ; PLAYER STANDING STILL
.DB $51,$53,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $5D,$5F,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $55,$57,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $5F,$5D,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $53,$51,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $73,$71,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $59,$5B,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $71,$73,$00,$10                                               ; B14: 9 BK18: DC HM:OFF

																; THESE ARE THE INDEXES TO THE TOP ROW
																; THE CHR BANK LOOPS EVERY 6TH FRAME
PLAYER_RUNNING_SPR_INFO:                                          ; PLAYER RUNNING 
.DB $01,$03,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $0D,$0F,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $05,$07,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $0F,$0D,$00,$80                                               ; BK14: DC BK18: DC HM:ON
.DB $03,$01,$00,$80                                               ; BK14: DC BK18: DC HM:ON
.DB $13,$11,$00,$80                                               ; BK14: DC BK18: DC HM:ON
.DB $09,$0B,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $11,$13,$00,$00                                               ; BK14: DC BK18: DC HM:OFF

			

READY_TO_DIVE_SPRITE_DATA:                                        ; READY TO DIVE
.DB $69,$6B,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $45,$47,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $6D,$6F,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $47,$45,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $6B,$69,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $4B,$49,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $41,$43,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $49,$4B,$00,$10                                               ; B14: 9 BK18: DC HM:OFF


FLAT_ON_GROUND_SPRITE_DATA:                                       ; LYING FLAT ON GROUND/DIVE SPRITE
.DB $61,$63,$65,$13                                               ; B14: 9 BK18: DC HM:OFF
.DB $7D,$7F,$67,$14                                               ; B14: 9 BK18: DC HM:OFF
.DB $4D,$4F,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $7F,$7D,$67,$95                                               ; B14: 9 BK18: DC HM:ON
.DB $63,$61,$65,$92                                               ; B14: 9 BK18: DC HM:ON
.DB $C3,$C1,$C5,$92                                               ; B14: 9 BK18: DC HM:ON
.DB $79,$7B,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $C1,$C3,$C5,$13                                               ; B14: 9 BK18: DC HM:OFF


QB_ARM_IN_MOTION_SPRITE_DATA_8DIR:                                ; QB ARM IN MOTION
.DB $BD,$BF,$B7,$41                                               ; BK14: DC BK18:14 HM:OFF
.DB $A5,$A7,$B3,$41                                               ; BK14: DC BK18:14 HM:OFF
.DB $A9,$AB,$00,$40                                               ; BK14: DC BK18:14 HM:OFF
.DB $A7,$A5,$B3,$C0                                               ; BK14: DC BK18:14 HM:ON
.DB $BF,$BD,$B7,$C0                                               ; BK14: DC BK18:14 HM:ON
.DB $A3,$A1,$AD,$C0                                               ; BK14: DC BK18:14 HM:ON
.DB $B9,$BB,$B1,$40                                               ; BK14: DC BK18:14 HM:OFF
.DB $A1,$A3,$AD,$41                                               ; BK14: DC BK18:14 HM:OFF


QB_ARM_EXTENDED_PASS_SPRITE_INFO:                                 ; QB ARM EXTENDED
.DB $75,$77,$00,$50                                               ; B14: 6 BK18:7 HM:OFF
.DB $B9,$BB,$00,$20                                               ; BK14: DC BK18:7 HM:OFF
.DB $B1,$B3,$00,$20                                               ; BK14: DC BK18:7 HM:OFF
.DB $BB,$B9,$00,$A0                                               ; BK14: DC BK18:7 HM:ON
.DB $77,$75,$00,$D0                                               ; B14: 6 BK18:7 HM:ON
.DB $BF,$BD,$00,$A0                                               ; BK14: DC BK18:7 HM:ON
.DB $B5,$B7,$00,$20                                               ; BK14: DC BK18:7 HM:OFF
.DB $BD,$BF,$00,$20                                               ; BK14: DC BK18:7 HM:OFF

COLLIDED_PLAYERS_SPRITE_INFO:                                     ; SPRITES GRAPPLING (8 DIRECTIONS)
.DB $19,$1B,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $21,$23,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $15,$17,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $23,$21,$00,$80                                               ; BK14: DC BK18: DC HM:ON
.DB $1B,$19,$00,$80                                               ; BK14: DC BK18: DC HM:ON
.DB $27,$25,$00,$80                                               ; BK14: DC BK18: DC HM:ON
.DB $1D,$1F,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $25,$27,$00,$00                                               ; BK14: DC BK18: DC HM:OFF

RB_TAKES_HANDFOFF_ANI_1_SPRITE_INFO:                              ; RB TAKES HANDOFF SPRITE 1
.DB $99,$9B,$00,$30                                               ; BK14: DC BK18:11 HM:OFF
.DB $B5,$B7,$00,$30                                               ; BK14: DC BK18:11 HM:OFF
.DB $B9,$BB,$00,$30                                               ; BK14: DC BK18:11 HM:OFF
.DB $B7,$B5,$00,$B0                                               ; BK14: DC BK18:11 HM:ON
.DB $9B,$99,$00,$B0                                               ; BK14: DC BK18:11 HM:ON
.DB $B3,$B1,$00,$B0                                               ; BK14: DC BK18:11 HM:ON
.DB $9D,$9F,$00,$30                                               ; BK14: DC BK18:11 HM:OFF
.DB $B1,$B3,$00,$30                                               ; BK14: DC BK18:11 HM:OFF

RB_TAKES_HANDFOFF_ANI_2_SPRITE_INFO:                              ; RB TAKES HANDOFF SPRITE 2
.DB $69,$6B,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $45,$47,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $6D,$6F,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $47,$45,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $6B,$69,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $AF,$49,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $41,$43,$00,$10                                               ; B14: 9 BK18: DC HM:OFF
.DB $49,$AF,$00,$10                                               ; B14: 9 BK18: DC HM:OFF

					
JUMPING_PLAYER_SPRITE_INFO:                                       ; JUMPING PLAYER (EXTRA SPRITE FOR JUMPING GETS SHIFTED) 
.DB $91,$93,$95,$26                                               ; BK14: DC BK18:7 HM:OFF
.DB $9D,$9F,$AF,$26                                               ; BK14: DC BK18:7 HM:OFF 
.DB $9F,$9D,$AF,$A6                                               ; BK14: DC BK18:7 HM:ON 
.DB $93,$91,$95,$A6                                               ; BK14: DC BK18:7 HM:ON
.DB $9B,$99,$97,$A6                                               ; BK14: DC BK18:7 HM:ON  
.DB $99,$9B,$97,$26                                               ; BK14: DC BK18:7 HM:OFF
.DB $00,$00,$00,$00                                               ; BK14: DC BK18: DC HM:OFF *** not used here for space***
.DB $00,$00,$00,$00                                               ; BK14: DC BK18: DC HM:OFF

				
HEAD_DOWN_CRY_SPRITE_INFO:                                        ; HEAD DOWN SPRITE
.DB $69,$6B,$00,$18                                               ; B14: 13 BK18: DC HM:OFF
.DB $45,$47,$00,$18                                               ; B14: 13 BK18: DC HM:OFF
.DB $6D,$6F,$00,$18                                               ; B14: 13 BK18: DC HM:OFF
.DB $47,$45,$00,$98                                               ; B14: 13 BK18: DC HM:ON
.DB $6B,$69,$00,$98                                               ; B14: 13 BK18: DC HM:ON
.DB $4B,$49,$00,$98                                               ; B14: 13 BK18: DC HM:ON
.DB $41,$43,$00,$18                                               ; B14: 13 BK18: DC HM:OFF
.DB $49,$4B,$00,$18                                               ; B14: 13 BK18: DC HM:OFF

_F}_EIGHT_DIRECTION_SPRITE_DATA 

_F{_TWO_DIRECTION_SPRITE_DATA                                     ; DONE EXCEPT UNUSED

THREE_PT_SPRITE_DATA:                                             ; 3 PT STANCE SPRITE
.DB $51,$53,$00,$58                                               ; B14: 34 BK18: DC HM:OFF
.DB $53,$51,$00,$D8                                               ; B14: 34 BK18: DC HM:ON

PLAYER_STANDING_SPRITE_DATA:                                      ; 2PT/PLAYER STANDING SPRITE
.DB $61,$63,$00,$58                                               ; B14: 34 BK18: DC HM:OFF
.DB $63,$61,$00,$D8                                               ; B14: 34 BK18: DC HM:ON

CENTER_HIKE_SPRITE_DATA:                                          ; CENTER HIKE SPRITE
.DB $55,$57,$00,$58                                               ; B14: 34 BK18: DC HM:OFF
.DB $57,$55,$00,$D8                                               ; B14: 34 BK18: DC HM:ON

BALL_CARRIER_STANDING_STILL_DUPLICATE_SPRITE_DATA:                            ; FG/XP HOLDER SNAP SPRITE DUPLICATE NOT USED
.DB $71,$73,$00,$58                                               ; B14: 34 BK18: DC HM:OFF
.DB $73,$71,$00,$D8                                               ; B14: 34 BK18: DC HM:ON

QB_HEAD_FACING_DOWN_SPRITE_DATA:                                  ; QB SNAP HEAD TURN SIDE 1 
.DB $5D,$5B,$00,$58                                               ; B14: 34 BK18: DC HM:OFF
.DB $5B,$5D,$00,$D8                                               ; B14: 34 BK18: DC HM:ON

QB_SNAP_FACING_FORWARD_SPRITE_DATA:                               ; QB SNAP HEAD TURS
.DB $59,$5B,$00,$58                                               ; B14: 34 BK18: DC HM:OFF
.DB $5B,$59,$00,$D8                                               ; B14: 34 BK18: DC HM:ON

QB_SNAP_FACING_UP_SPRITE_DATA:                                    ; QB SNAP HEAD TURN SIDE 2
.DB $5F,$5B,$00,$58                                               ; B14: 34 BK18: DC HM:OFF
.DB $5B,$5F,$00,$D8                                               ; B14: 34 BK18: DC HM:ON

BALL_CARRIER_STOPPED_SPRITE_DATA:                                 ; BALL CARRIER STANDING STILL
.DB $75,$77,$00,$48                                               ; B14: 9 BK18:7 HM:OFF
.DB $77,$75,$00,$C8                                               ; B14: 9 BK18:7 HM:ON

												
QB_ARM_EXTENDED_DUPLICATE_SPRITE_DATA:                            ; QB ABOUT TO RELEASE BALL DUPLICATE *** NOT USED 
.DB $B1,$B3,$00,$20                                               ; BK14: DC BK18:7 HM:OFF
.DB $B3,$B1,$00,$A0                                               ; BK14: DC BK18:7 HM:ON

KICKER_ABOUT_TO_KICK_SPRITE_DATA:                                 ; ABOUT TO KICK SPRITE KICK
.DB $B5,$B7,$00,$28                                               ; BK14: DC BK18:10 HM:OFF
.DB $B7,$B5,$00,$A8                                               ; BK14: DC BK18:10 HM:ON

KICKER_FOOT_90_SPRITE_DATA:                                       ; FOOT 90 DEGREES SPRITE
.DB $B1,$B3,$00,$28                                               ; BK14: DC BK18:10 HM:OFF
.DB $B3,$B1,$00,$A8                                               ; BK14: DC BK18:10 HM:ON

HANDOFF_TOSS_START_SPRITE_INFO:                                   ; QB ABOUT TO HANDOFF/TOSS SPRITE
.DB $93,$91,$00,$B0                                               ; BK14: DC BK18:11 HM:ON
.DB $91,$93,$00,$30                                               ; BK14: DC BK18:11 HM:OFF

KICKER_FOOT_90_DUPLICATE_SPRITE_DATA:                             ; FOOT 90 DEGREES SPRITE *** NOT USED 
.DB $B1,$B3,$00,$28                                               ; BK14: DC BK18:10 HM:OFF
.DB $B3,$B1,$00,$A8                                               ; BK14: DC BK18:10 HM:ON

KICK_HOLDER_WAIT_FOR_BALL_SPRITE_DATA:                            ; FG/XP HOLDER WAITING FOR SNAP SPRITE
.DB $B9,$BB,$00,$28                                               ; BK14: DC BK18:10 HM:OFF
.DB $BB,$B9,$00,$A8                                               ; BK14: DC BK18:10 HM:ON

KICK_HOLDER_HAS_BALL_SPRITE_DATA:                                 ; FG/XP HOLDER HAS BALL SPRITE
.DB $BD,$BF,$00,$28                                               ; BK14: DC BK18:10 HM:OFF
.DB $BF,$BD,$00,$A8                                               ; BK14: DC BK18:10 HM:ON


SUPERMAN_TUMBLE_LEFT_SPRITE_DATA:                               			  ; *** UNUSED “SUPER MAN” DIVE/TUMBLE SPRITES
.DB $99,$9B,$9D,$3B                                               ; BK14: DC BK18:12 HM:OFF
SUPERMAN_TUMBLE_RIGHT_SPRITE_DATA: 
.DB $9B,$99,$9D,$BA                                               ; BK14: DC BK18:12 HM:ON


CHOP_BLOCK_LEFT_SPRITE_DATA: 
.DB $C9,$CB,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
CHOP_BLOCK_RIGHT_SPRITE_DATA: 
.DB $CB,$C9,$00,$80                                               ; BK14: DC BK18: DC HM:ON

SPIN_HEAD_DIAG_BOT_RIGHT_SPRITE_DATA:
.DB $95,$97,$00,$38                                               ; BK14: DC BK18:12 HM:OFF
SPIN_HEAD_DIAG_BOT_LEFT_SPRITE_DATA:
.DB $97,$95,$00,$B8                                               ; BK14: DC BK18:12 HM:ON

LYING_ON_GROUND_HEAD_UP_RIGHT_SPRITE_DATA:
.DB $91,$93,$9F,$3B                                               ; BK14: DC BK18:12 HM:OFF
LYING_ON_GROUND_HEAD_UP_LEFT_SPRITE_DATA:
.DB $93,$91,$9F,$BA                                               ; BK14: DC BK18:12 HM:ON



PLAYER_SHAKING_HEAD_SPRITE_INFO:                                  ; PLAYER SHAKING HEAD SPRITE 
.DB $35,$37,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $37,$35,$00,$80                                               ; BK14: DC BK18: DC HM:ON

PLAYER_STANDING_UP_SPRITE_INFO:                                   ; PLAYER GETTING UP SPRITE
.DB $CD,$CF,$00,$00                                               ; BK14: DC BK18: DC HM:OFF
.DB $CF,$CD,$00,$80                                               ; BK14: DC BK18: DC HM:ON

ARMS_EXTENDED_BALL_SPRITE_INFO:                                   ; PLAYER PITCH ARM EXTENDED SPRITE
.DB $97,$95,$00,$B0                                               ; BK14: DC BK18:11 HM:ON
.DB $95,$97,$00,$30                                               ; BK14: DC BK18:11 HM:OFF


UNUSED_TUMBLE_3_SPRITE_DATA
																  ; UNUSED 3 SPRITE TUMBLE
SPIN_HEAD_DIAG_TOP_LEFT_SPRITE_DATA:																	; 
.DB $B9,$BB,$00,$38                                               ; BK14: DC BK18:12 HM:OFF
SPIN_HEAD_DIAG_TOP_RIGHT_SPRITE_DATA:
.DB $BB,$B9,$00,$B8                                               ; BK14: DC BK18:12 HM:ON

SPIN_HEAD_DIAG_BOT_LEFT_FACING_DOWN_SPRITE_DATA:
.DB $BD,$BF,$00,$38                                               ; BK14: DC BK18:12 HM:OFF
SPIN_HEAD_DIAG_BOT_RIGHT_FACING_DOWN_SPRITE_DATA:
.DB $BF,$BD,$00,$B8                                               ; BK14: DC BK18:12 HM:ON

SPIN_HEAD_DIAG_TOP_RIGHT_FACING_UP_SPRITE_DATA:
.DB $B5,$B7,$00,$38                                               ; BK14: DC BK18:12 HM:OFF
SPIN_HEAD_DIAG_TOP_LEFT_FACING_UP_SPRITE_DATA:
.DB $B7,$B5,$00,$B8                                               ; BK14: DC BK18:12 HM:ON


QB_DROPBACK_1_SPRITE_INFO:                                        ; QB DROPBACK 1 SPRITE
.DB $77,$75,$00,$90                                               ; B14: 9 BK18: DC HM:ON
.DB $75,$77,$00,$10                                               ; B14: 9 BK18: DC HM:OFF

QB_DROPBACK_2_SPRITE_INFO:                                        ; QB DROPBACK 2 SPRITE
.DB $B3,$B1,$00,$B8                                               ; BK14: DC BK18:12 HM:ON
.DB $B1,$B3,$00,$38                                               ; BK14: DC BK18:12 HM:OFF

CELEBRATE_1_SPRITE_INFO:                                          ; STANDING STILL SPRITE
.DB $51,$53,$00,$18                                               ; B14: 13 BK18: DC HM:OFF
.DB $53,$51,$00,$98                                               ; B14: 13 BK18: DC HM:ON

CELEBRATE_2_SPRITE_INFO:                                          ; ARMS IN AIR CELEBRATE P2 SPRITE
.DB $75,$77,$00,$18                                               ; B14: 13 BK18: DC HM:OFF
.DB $77,$75,$00,$98                                               ; B14: 13 BK18: DC HM:ON

_F}_TWO_DIRECTION_SPRITE_DATA

_F{_THROWN_ON_TO_BACK_SPRITE_DATA 								  ; DONE
																	; ALL USE DEAFULT BANKS
																	;	LOCATIONS ARE ONLY REFERENCED IN BANK 14
																	; PLAYER THROWN ON TO BACK SPRITE INFO (2-3 SPRITES)
THROWN_TO_BACK_LEFT_1:     
.DB $D5,$D7,$00,$00                                               ; HM:OFF
THROWN_TO_BACK_LEFT_2:
.DB $D1,$D3,$00,$00                                               ; HM:OFF

THROWN_TO_BACK_UP_LEFT_1:
.DB $E9,$EB,$00,$00                                               ; HM:OFF
THROWN_TO_BACK_UP_LEFT_2:
.DB $ED,$EF,$00,$00                                               ; HM:OFF

THROWN_TO_BACK_UP_1:
.DB $D9,$DB,$00,$00                                               ; HM:OFF
THROWN_TO_BACK_UP_2: 
.DB $DD,$DF,$00,$00                                               ; HM:OFF

THROWN_TO_BACK_UP_RIGHT_1:
.DB $EB,$E9,$00,$80                                               ; HM:ON
THROWN_TO_BACK_UP_RIGHT_2:
.DB $EF,$ED,$00,$80                                               ; HM:ON

THROWN_TO_BACK_RIGHT_1:
.DB $D7,$D5,$00,$80                                               ; HM:ON
THROWN_TO_BACK_RIGHT_2:
.DB $D3,$D1,$00,$80                                               ; HM:ON

THROWN_TO_BACK_DOWN_RIGHT_1:
.DB $FF,$FD,$00,$80                                               ; HM:ON
THROWN_TO_BACK_DOWN_RIGHT_2:
.DB $F7,$F5,$00,$80                                               ; HM:ON

THROWN_TO_BACK_DOWN_1:
.DB $E1,$E3,$00,$00                                               ; HM:OFF
THROWN_TO_BACK_DOWN_2:
.DB $E5,$E7,$00,$00                                               ; HM:OFF

THROWN_TO_BACK_DOWN_LEFT_1:
.DB $FD,$FF,$00,$00                                               ; HM:OFF
THROWN_TO_BACK_DOWN_LEFT_2:
.DB $F5,$F7,$00,$00                                               ; HM:OFF

DOWN_RIGHT_TUMBLE_START:
.DB $F3,$F1,$00,$80                                               ; HM:ON
DOWN_LEFT_TUMBLE_START:
.DB $F1,$F3,$00,$00                                               ; HM:OFF

LYING_ON_GROUND_LEFT_SIDE:
.DB $F9,$FB,$00,$00                                               ; HM:OFF
LYING_ON_GROUND_RIGHT_SIDE:
.DB $FB,$F9,$00,$80                                               ; HM:ON

_F}_THROWN_ON_TO_BACK_SPRITE_DATA

_F{_TUMBLING_SPRITE_DATA										  ; DONE	

																; PLAYER THROWN TUMBLING (6 FRAME ANIMATION LIKE RUNNING THEN FINAL SPRITE)

ROLLING_TUMBLE_LEFT:                                              ; 6 FRAME HORIZONTAL TUMBLE LEFT
.DB $29,$2B,$00,$00                                               ; HM:OFF
ROLLING_TUMBLE_ON_GROUND_LEFT:                                     ; ENDING SPRITE
.DB $85,$87,$00,$00                                               ; HM:OFF


ROLLING_TUMBLE_UP_LEFT:                                            ; 6 FRAME VERITCAL TUMBLE LEFT-UP
.DB $3D,$3F,$00,$00                                               ; HM:OFF
ROLLING_TUMBLE_ON_GROUND_UP_LEFT:                                 ; ENDING SPRITE
.DB $8D,$8F,$00,$00                                               ; HM:OFF


ROLLING_TUMBLE_UP_RIGHT:                                          ; 6 FRAME VERITCAL TUMBLE RIGHT-UP
.DB $3F,$3D,$00,$80                                               ; HM:ON
ROLLING_TUMBLE_ON_GROUND_UP_RIGHT:                                ; ENDING SPRITE
.DB $8F,$8D,$00,$80                                               ; HM:ON


ROLLING_TUMBLE_RIGHT:                                             ; 6 FRAME HORIZONTAL TUMBLE RIGHT
.DB $2B,$29,$00,$80                                               ; HM:ON
ROLLING_TUMBLE_RIGHT_ON_GROUND:                                  ; ENDING SPRITE
.DB $87,$85,$00,$80                                               ; HM:ON

ROLLING_TUMBLE_DOWN_LEFT:                                         ; 6 FRAME HORIZONTAL TUMBLE LEFT-DOWN
.DB $39,$3B,$00,$00                                               ; HM:OFF
ROLLING_TUMBLE_ON_GROUND_DOWN_LEFT:                                 ; ENDING SPRITE 
.DB $89,$8B,$00,$00                                               ; HM:OFF

ROLLING_TUMBLE_DOWN_RIGHT:                                        ; 6 FRAME HORIZONTAL TUMBLE RIGHT-DOWN
.DB $3B,$39,$00,$80                                               ; HM:ON
ROLLING_TUMBLE_ON_GROUND_DOWN_RIGHT:                                                        ; ENDING SPRITE 
.DB $8B,$89,$00,$80                                               ; HM:ON

_F}_TUMBLING_SPRITE_DATA

_F{_PASS_CONTROL_OVERTHROW_MISTHROW_TABLES                        ; DONE
                                                                  ; GOING DOWN A COLLUMN BIGGER VALUE = MORE OVERTHROWN
                                                                  ; FIRST COLLUMN = ON TARGET
OVERTHROW_ADJUST_TABLE:                                           ; MOVING TARGET OVERTHROW ADJUST DISTANCE BASED ON ANGLE TABLE 
	                                                              ; COMPARE TO FIRST ROW TO DETERMINE OVERTHROW AMOUNT		
                                                                  ; OVERTHROW AMOUNT = [(VALUE - ROW ONE VALUE) * BALL SPEED] /2
																  
                                                                  ; ANGLE DIFFERENCE (DEG) BETWEEN BALL AND TARGET CALCULATED CLOCKWISE
                                                                  ;   0,45,90,135,180,225,270,315,
	.DB $67, $66, $60, $5B, $48, $39, $2C, $1D                    ;   
	.DB $6E, $6D, $67, $62, $4D, $3D, $2F, $1F                    ;  
	.DB $73, $72, $6C, $66, $50, $3F, $32, $21                    ;
	.DB $75, $74, $6E, $68, $52, $40, $33, $21                    ; 
	.DB $77, $76, $70, $6A, $53, $42, $33, $22                    ;
	.DB $7B, $7A, $73, $6D, $56, $44, $35, $23                    ;
	.DB $7D, $7C, $75, $6F, $58, $45, $36, $23                    ;
	.DB $7F, $7E, $77, $71, $59, $46, $37, $24                    ;

	.DB $81, $80, $79, $73, $5A, $47, $38, $25                    ; WORST POSSIBLE 94/100 PC OVERTHROW
	.DB $84, $83, $7C, $75, $5D, $49, $39, $25                    ; WORST POSSIBLE 88/81 PC OVERTHROW
	.DB $86, $85, $7E, $77, $5E, $4A, $3A, $26                    ; WORST POSSIBLE 75/69 PC OVERTHROW
	.DB $8A, $89, $82, $7B, $61, $4C, $3C, $27                    ; WORST POSSIBLE 63/56 PC OVERTHROW
	.DB $93, $92, $8A, $83, $67, $51, $40, $2A                    ; WORST POSSIBLE 50/44 PC OVERTHROW
	.DB $9E, $9D, $95, $8D, $6F, $57, $45, $2D                    ; WORST POSSIBLE 38/31 PC OVERTHROW
	.DB $B3, $B2, $A9, $A0, $7E, $63, $4E, $33                    ; WORST POSSIBLE 25/19 PC OVERTHROW 
	.DB $E6, $E4, $D8, $CD, $A1, $7F, $64, $42                    ; WORST POSSIBLE 13/06 PC OVERTHROW 

OVERTHROW_ADJUST_TABLE_END: 	
	
PASS_CONTROL_VALUES_TABLE:                                        ;PASS_CONTROL_VALUES:



																; OVERTHROW VALUES IN MULTIPLES OF 8 DUE TO EACH 
																; ENTRY ABOVE IN 8 BYTE ARRAYS
																; NOT ON TARGET %, SMALL MISTHROW/UNDERTHROW %, MAX OVERTHROW ,  STOPPED TARGET/UNDERTHROW
	.DB $F7, $34, $80, $80                                        ;(6PC) 96%, 20%, FULL TABLE RANGE, FULL TABLE RANGE
	.DB $EE, $32, $80, $80                                        ;(13PC) 
	.DB $E5, $30, $80, $78                                        ;(19PC)
	.DB $DC, $2E, $80, $78                                        ;(25PC)
	.DB $D3, $2C, $78, $70                                        ;(31PC)
	.DB $CA, $2A, $78, $70                                        ;(38PC)
	.DB $C1, $28, $78, $68                                        ;(44PC)
	.DB $B8, $26, $78, $68                                        ;(50PC)
	.DB $AF, $24, $70, $60                                        ;(56PC)
	.DB $A6, $22, $70, $60                                        ;(63PC)
	.DB $9D, $20, $70, $58                                        ;(69PC)
	.DB $94, $1E, $70, $58                                        ;(75PC)
	.DB $8B, $1C, $70, $50                                        ;(81PC)
	.DB $82, $1A, $70, $50                                        ;(88PC)
	.DB $79, $18, $70, $48                                        ;(94PC)
	.DB $70, $16, $68, $48                                        ;(100PC)

_F}_PASS_CONTROL_OVERTHROW_MISTHROW_TABLE

_F{_PLAYER_SKILL_TABLES_AND_FG_XP_CUTSCENE_INDEX                  ; DONE
	
PASSING_SPEED_VALUES_TABLE:                                       ;PASSING_SPEED_VALUES
	.DB $44,$46,$48,$4A,$4C,$4E,$50,$52,$54,$56,$58,$5A,$5C,$5E,$60,$62

PASSING_GRAVITY_VALUES_TABLE:                                     ;PASS_LOFT_VALUES
	.DB $30,$30,$31,$31,$32,$32,$33,$33,$34,$34,$35,$35,$36,$37,$38,$39

RUSHING_POWER_VALUES_TABLE:                                       ;RUSHING_POWER_VALUES
	.DB $0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$03,$02,$02,$01,$01

RUNNING_SPEED_VALUES_TABLE:                                       ;RUNNING_SPEED_VALUES
	.DB $0E,$0F,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D

FG_XP_CUTSCENCE_SEQUENCE_INDEX_TABLE:                             ; P1 FG AND XP CUTSCENE POINTERS
	.DB $27
	.DB $25
	.DB $A1
	.DB $A0
	.DB $A0
	.DB $A0
	.DB $A0
	.DB $A2
	.DB $26
	.DB $28
	.DB $18
	.DB $16
	.DB $92
	.DB $91
	.DB $91
	.DB $91
	.DB $91
	.DB $93
	.DB $17
	.DB $19
	.DB $2C
	.DB $2A
	.DB $A3
	.DB $8D
	.DB $8D
	.DB $8D
	.DB $8D
	.DB $A4
	.DB $2B
	.DB $2D
	.DB $1D
	.DB $1B
	.DB $94
	.DB $8C
	.DB $8C
	.DB $8C
	.DB $8C
	.DB $95
	.DB $1C
	.DB $1E

P2_FG_FG_XP_CUTSCENCE_SEQUENCE_BYTES:
	.DB $47                                                       ; P2 FG AND XP CUTSCENE POINTERS
	.DB $45
	.DB $C1
	.DB $C0
	.DB $C0
	.DB $C0
	.DB $C0
	.DB $C2
	.DB $46
	.DB $48
	.DB $38
	.DB $36
	.DB $B2
	.DB $B1
	.DB $B1
	.DB $B1
	.DB $B1
	.DB $B3
	.DB $37
	.DB $39
	.DB $4C
	.DB $4A
	.DB $C3
	.DB $8F
	.DB $8F
	.DB $8F
	.DB $8F
	.DB $C4
	.DB $4B
	.DB $4D
	.DB $3D
	.DB $3B
	.DB $B4
	.DB $8E
	.DB $8E
	.DB $8E
	.DB $8E
	.DB $B5
	.DB $3C
	.DB $3E
	
AVOID_PASS_BLOCK_VALUES_TABLE:                                    ; AVOID_PASS_BLOCK_VALUES
	.DB $50,$4C,$48,$44,$40,$3C,$38,$34,$30,$2C,$28,$24,$20,$1C,$18,$14
	
AVOID_KICK_BLOCK_VALUES_TABLE:                                    ; AVOID_KICK_BLOCK_VALUES:
	.DB $34,$32,$30,$2E,$2C,$2A,$28,$26,$24,$22,$20,$1E,$1C,$1A,$18,$16
	
BALL_CONTROL_VALUES_TABLE:                                        ; BALL_CONTROL_VALUES:
	.DB $12,$11,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03
	
PASSING_VALUES_TABLE:                                             ; PASSING_VALUES
	.DB $3D,$3F,$41,$43,$45,$47,$49,$4B,$4D,$4F,$51,$53,$55,$57,$59,$5B
	
RECEPTION_VALUES_TABLE:                                           ; RECEPTION_VALUES
	.DB $3D,$3F,$41,$43,$45,$47,$49,$4B,$4D,$4F,$51,$53,$55,$57,$59,$5B
	
INTERCEPTION_VALUES_TABLE:                                        ; INTERCEPTION_VALUES
	.DB $33,$35,$37,$39,$3B,$3D,$3F,$41,$43,$45,$47,$49,$4B,$4D,$4F,$51

_F}_PLAYER_SKILL_TABLES_AND_FG_XP_CUTSCENE_INDEX 

PAD $C000, $FF	
