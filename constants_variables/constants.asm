;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
												PLAYER_ANI_FRAMES 			= $06

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LENGTH_OF_ONE_ROW      		        = $20

NUM_ROWS_IN_ATTRIB_TABLE	        = $02
NUM_ROWS_IN_NAME_TABLE		        = $1E
SIZE_OF_TILE		 		        = $08
MAX_SPRITES_PER_SCANLINE 	        = $08

;;; PALLETE ;;;;;;;;;;;;;;;;;;;;;;;
FULLY_FADED_OUT   			        = $00
FULLY_FADED_IN   			        = $0F
BOTH_PAL_FADED_IN       	        = 2 * FULLY_FADED_IN
SINGLE_PAL_BUFFER_LENGTH 	        = $10												; *** need to rename to single pallete
PALLETTE_BUFFER_LENGTH 		        = $20
;;; JOYPAD ;;;;;;;;;;;;;;;;;;;;;;;
TIMES_TO_CHECK_JOYPAD 		        = $04
NUM_BUTTONS_TO_READ     	        = $08
A_BUTTON     			 	        = $80
B_BUTTON    				        = $40
SELECT_BUTTON 				        = $20
START_BUTTON  				        = $10
UP_DPAD 					        = $08
DOWN_DPAD  					        = $04
LEFT_DPAD  					        = $02
RIGHT_DPAD 					        = $01
JOY_1 						        = $00
JOY_2 						        = $01 
BOTH_JOYPADS 				        = $02 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SRAM_START                          = $6000
PLAYER_NUMBER_OFFSET                = $00
 




LEFT_DIRECTION				        = $00
UP_DIRECTION				        = $40
RIGHT_DIRECTION				        = $80
DOWN_DIRECTION				        = $C0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECONDS_PER_QTR				        = $00
MINUTES_PER_QTR				        = $05

FIRST_QUARTER				        = $00
SECOND_QUARTER				        = $01
THIRD_QUARTER				        = $02
FOURTH_QUARTER				        = $03
OVERTIME_QUARTER			        = $04 


;;;;; DOWNS    ;;;;;;;;;;;


FIRST_DOWN					        = $00
SECOND_DOWN					        = $01
THIRD_DOWN					        = $02
FOURTH_DOWN					        = $03
  
;;; POINTS ;;;;;;;;;;;;;;;;;;;;;;;;
XP_PTS						        = $01
SAFETY_POINTS                       = $02
TD_POINTS                           = $06
FG_POINTS                           = $03
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BC_PAST_LOS_MAN_DEF_MS_BOOST        = $05

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NUM_RUN_PLAYS					    = $04
NUM_PASS_PLAYS					    = $04
TOTAL_NUM_PLAYS_IN_PLAYBOOK		    = NUM_RUN_PLAYS + NUM_PASS_PLAYS
OFFSET_TO_PASS_PLAY				    = $04
PLAY_NAME_LENGTH				    = $0F				; play name, play formation, 
PLAY_FORMATION					    = $01 
PLAY_POINTER_INDEXES			    = $08

PLAY_IMAGE_HEIGHT				    = $07
PLAY_IMAGE_LENGTH				    = $06

NUM_CHAR_RUN_PLAYER_NAME		    = $06 
NUM_TILES_PER_PLAY				    = PLAY_IMAGE_HEIGHT * PLAY_IMAGE_LENGTH
SIZE_OF_OFF_PLAY_INFO		        = PLAY_NAME_LENGTH + PLAY_FORMATION + PLAY_POINTER_INDEXES
RUN_PLAY_INDEX_START			    = $00
PASS_PLAY_INDEX_START			    = $20 				; play number 32
OFFSET_TO_RUN_PLAY_HEADER		    = $40				; two rows

PASS_CALL_ID	 					= $04
PUNT_PLAY_CALL_ID					= $08 	
FG_PLAY_CALL_ID	 					= $09


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


AFC_CONF_CHAMP_PLAYOFF_GAME_ID	    = $08				
NFC_CONF_CHAMP_PLAYOFF_GAME_ID	    = $09
SUPERBOWL_GAME_ID				    = $0A

TOTAL_GAMES_PER_TEAM			    = $10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
OFFSET_TO_FIRST_DEFENSIVE_STARTER	= $0B
OFFSET_TO_FIRST_DEFENDER 			= $0B
LAST_OFFENSIVE_SKILL_PLAYER 		= $0B
NUM_PLAYERS_ON_FIELD				= $0B
NUM_OFFENSIVE_PLAYERS_ON_FIELD      = $0B
NUM_DEFENDERS_ON_FIELD				= $0B

NUMBER_OF_DL						= $03
NUMBER_OF_LB						= $04
NUMBER_OF_DB						= $04
SIZE_OF_OFF_PLAY_INFO				= $18
TOTAL_NUM_PLAYERS_ON_FIELD			= NUM_PLAYERS_ON_FIELD * 2 
SIZE_OF_ALL_PLAY_POINTERS			= NUM_PLAYERS_ON_FIELD * 2 


SIZE_OF_ADDR						= $02
OFFSET_TO_NEXT_PLAYER_RAM			= $20 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BAD_CONDITION						= $00
AVERAGE_CONDITION					= $01
GOOD_CONDITION						= $02
EXCELLENT_CONDITION					= $03

PROBABLE_INJ_STATUS					= $01
QUEST_INJ_STATUS					= $02
DOUBTFUL_INJ_STATUS					= $03

ALL_AVERAGE_CONDITION				= $55 
MIN_SKILL 							= $00
MAX_SKILL						    = $0F
MAX_PLAYER_SKILL_RATING             = $0F
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MAX_TARGETS                         = $05

REGULAR_INJURY_CHANCE				= $02				; ~1%
KR_PR_INJURY_CHANCE					= $07				; ~3%


LENGTH_OF_PLAY_NAME					= $10

P1_SIDE_ID							= $00
P2_SIDE_ID							= $01 


NUM_ANI_FRAMES_PLAYER_SPRITES		= $06


DARK_SKIN_COLOR						= COLOR_DARK_RED
LIGHT_SKIN_COLOR					= COLOR_WHITE_RED 








