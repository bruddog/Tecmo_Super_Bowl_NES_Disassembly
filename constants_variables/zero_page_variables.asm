    
                                   
_F{_TASK_STATUS_ZERO_PAGE_VARIABLES

   TASK_STATUS              = $00 
   TASK_COUNTER             = $01 
   TASK_ADDR                = $02 
   TASK_BANK                = $04 


   TASK_STACK_INDEX         = $02 
   TASK_BANK_8000           = $03 
   TASK_BANK_A000           = $04 



   TASK_EMPTY               = $00
   TASK_SUSPENDED_RUNNING   = $02
   TASK_SUSPENDED           = $03
   TASK_SLEEPING            = $11
   TASK_RUNNING             = $12
   TASK_WAITING             = $13
   TASK_CREATED             = $14

   LAST_TASK_INDEX          =  $25

   TASK_SIZE                = $05 
   NUMBER_OF_TASKS          = $08

 .ENUM $0000 
   CURRENT_TASK                     .dsb 1
   TASK_CHECK                       .dsb 1 

   FIRST_TASK					    .dsb 0	
   GAME_MENU_TASK                   .dsb 0
   UPDATE_CLOCK_TASK                .dsb 5   ; 0x02
    
                   
   OFFENSE_PLAYCALL_TASK            .dsb 0	; 0x07 
   GAMEPLAY_TASK                    .dsb 5   ; 0x07
  
   DEFENSE_PLAYCALL_TASK            .dsb 0   ; 0x0c
   GAMEFIELD_TASK                   .dsb 0 
   DRAW_SCRIPT_TASK                 .dsb 5   ; 0x0c
   
   BANNER_TASK                      .dsb 0   ; 0x11
   SCROLL_TASK 					    .dsb 0 			   	
   METATILE_TASK				    .dsb 5	
   
   BALL_MOVEMENT_TASK			    .dsb 0
   DRAWING_TASK                     .dsb 5   ; 0x16
    
   COLLISION_CHECK_TASK             .dsb 0    ; 0x1B
   READY_SELECT_YARDLINE_TASK       .dsb 0
   SCROLL_BG_TASK				    .dsb 0
   UPDATE_PALLETE_TASK              .dsb 5   
   
   UPDATE_PLAYERS_TASK              .dsb 5   ; 0x20
   
   FLICKER_PLAYERS_TASK			    .dsb 0
   DRAW_PLAYERS_TASK                .dsb 5   ; 0x25
   
   TASK_BUSY_FLAG                   .dsb 1   ; 0x80 = task switch in progress


_F}_TASK_STATUS_ZERO_PAGE_VARIABLES
   
_F{_BUFFER_AND_BANK_FLAG_ZERO_PAGE_VARIABLES 
 
   PPU_BUFFER_FLAG                 .dsb 1    ; 0x80 = busy, 0x40 =full 
   BANK_FLAG                       .dsb 1    ; 0x80 = bank swap in progress
 
 _F}_BUFFER_AND_BANK_FLAG_ZERO_PAGE_VARIABLES 
   
   GAME_STATUS                     .dsb 1	 ; *** random location	
   SEASON_MODE_BITFLAG				= $02 
   
 _F{_PPU_BANK_FRAME_COUNTER_ZERO_PAGE_VARIABLES  
 
   SOFT_8000_BANK                 .dsb 1 
   SOFT_A000_BANK                  .dsb 1
   
   FRAME_COUNTER                   .dsb 1
   SOFT_PPU_CTRL                   .dsb 1 
   SOFT_PPU_MASK                   .dsb 1
   SOFT_MODE_8000                  .dsb 1
   SOFT_BANK_SELECT                .dsb 1

 _F}_PPU_BANK_FRAME_COUNTER_ZERO_PAGE_VARIABLES  
   
_F{_JOYPAD_ZERO_PAGE_VARIABLES  

   CURR_JOY_RAW                    .dsb 0            ; 35
   JOY_RAW_1                       .dsb 1			 ; 35
   JOY_RAW_2                       .dsb 1			 ; 36	
   JOY_RAW_BOTH                    .dsb 1			 ; 37
   CURR_JOY_PRESS                  .dsb 0			 ; 38	
   JOY_PRESS_1                     .dsb 1			 ; 38	
   JOY_PRESS_2                     .dsb 1			 ; 39	
   JOY_PRESS_BOTH                  .dsb 1			 ; 3A

 _F}_JOYPAD_ZERO_PAGE_VARIABLES  

_F{_RANDOM_NUMBER_ZERO_PAGE_VARIABLES 

   RANDOM_1                        .dsb 1            ; 3B           
   RANDOM_2                        .dsb 1
   RANDOM_3                        .dsb 1 

_F}_RANDOM_NUMBER_ZERO_PAGE_VARIABLES  

_F{_SCRATCHPAD_LOCAL_ZERO_PAGE_VARIABLES 

   LOCAL_1                         .dsb 1                  ; keep fixed at $3E-$45
   LOCAL_2                         .dsb 1     
   LOCAL_3                         .dsb 1 
   LOCAL_4                         .dsb 1 
   LOCAL_5                         .dsb 1 
   LOCAL_6                         .dsb 1 
   LOCAL_7                         .dsb 1 
   LOCAL_8                         .dsb 1 
   SIZE_OF_LOCALS   				= LOCAL_8 - LOCAL_1 + 1

_F}_SCRATCHPAD_LOCAL_ZERO_PAGE_VARIABLES 

   TEMP_JOY_DATA                   .dsb 1
   JOY_CHECK                       .dsb 1
   NMI_BANK_SELECT                 .dsb 0
   LAST_JOY                        .dsb 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
   IRQ_Y_SCROLL                    .dsb 1
   IRQ_NAMETABLE                   .dsb 1

_F{_SPR_CHR_BANKS_ZERO_PAGE_VARIABLES   
 
   SOFT_CHR_BANKS                  .dsb 0
   SOFT_CHR_1000_BANK              .dsb 1
   SOFT_CHR_1400_BANK              .dsb 1
   SOFT_CHR_1800_BANK              .dsb 1
   SOFT_CHR_1C00_BANK              .dsb 1

_F}_SPR_CHR_BANKS_ZERO_PAGE_VARIABLES  

   UNUSED_1                        .dsb 1 ; 4F

_F{_PALLETE_ZERO_PAGE_VARIABLES   

   PAL_INDEX                      .dsb 0
   BG_PAL_INDEX                    .dsb 1  
   SPR_PAL_INDEX                   .dsb 1 
   BG_FADE                         .dsb 1 
   SPR_FADE                        .dsb 1 

_F}_PALLETE_ZERO_PAGE_VARIABLES  

 _F{_X_AND_Y_SCROLL_ZERO_PAGE_VARIABLES  
 
   CURR_X_SCROLL                   .dsb 2
   LAST_FIELD_COL_INDEX            .dsb 1  
   CURR_Y_SCROLL                   .dsb 2
   X_SCROLL_AMOUNT				   .dsb 0
   Y_SCROLL_DIST                   .dsb 1  
   X_SCROLL_DIST                   .dsb 1 
   
 
 _F}_X_AND_Y_SCROLL_ZERO_PAGE_VARIABLES   

 _F{_METATILE_ZERO_PAGE_VARIABLES     
   METATILE_HEIGHT                 .dsb 1
   ATTRIBUTE_ADDR                  .dsb 2
   METATILE_PPU_ADDR               .dsb 2
   METATILE_ADDR                   .dsb 2
   METATILE_BANK                   .dsb 1
   
 _F}_METATILE_ZERO_PAGE_VARIABLES      
   
   PLAYER_ANIMATION_TIMER          .dsb 1	; *** could put with sideline timer

_F{_PPU_ADDR_AND_STATUS_ZERO_PAGE_VARIABLES   

   PPU_TRANSFER_STATUS             .dsb 1
   PPU_ADDR_TEMP				   .dsb 2
.ENDE

.ENUM $65
	SEGMENT_BYTES_LEFT				.dsb 1
	BUFFER_INDEX_TEMP				.dsb 1
.ENDE 

.ENUM $65
	TEAM_TEXT_ADDR_INJURY_RETURN	.dsb 2
.ENDE 

.ENUM $67
   BUFFER_LOCAL1				   .dsb 1
   BUFFER_LOCAL2				   .dsb 1
   
 _F}_PPU_ADDR_AND_STATUS_ZERO_PAGE_VARIABLES    
   
_F{_CLOCK_ZERO_PAGE_VARIABLES    
   
   CLOCK_RUN_TYPE                  .dsb 1
   CLOCK_SECONDS                   .dsb 1
   CLOCK_MINUTES                   .dsb 1

_F}_CLOCK_ZERO_PAGE_VARIABLES   

_F{_TEAM_ID_ZERO_PAGE_VARIABLES   

   TEAM_IDS_IN_GAME[]			   .dsb 0	
   P1_TEAM                         .dsb 1
   P2_TEAM                         .dsb 1
   CONF_CHAMP_SB_WINNING_TEAM	   .dsb 0
   CURRENT_TEAM                    .dsb 1
   
   CURRENT_TEAM_FOR_DRAW_CONF	   .dsb 0
   LEADERS_MENU_CHOICE			   .dsb 0  ; 00 = afc, 01 = nfc 02 = nfl 
   PLAYER_DATA_SCREEN_TEAM		   .dsb 0 
   CURRENT_PRO_BOWL_TEAM           .dsb 0 
   SUB_CONTROL_TYPE				   .dsb 0    ; 00= MAN/COA, FF= COM 
   INJURY_CONTROL_TYPE			   .dsb 0	 ; 00= MAN/COA, FF= COM 
   PLAYOFF_LOSING_TEAM			   .dsb 0
   END_OF_GAME_STATS_TEAM_UNUSED   .dsb 0    ; *** unused function in bank 27 
   TEAM_ON_OFFENSE                 .dsb 1    ; 0 = p1, 1= p2 
   P1_ON_OFFENSE = $00
   P2_ON_OFFENSE = $01 	

_F}_TEAM_ID_ZERO_PAGE_VARIABLES   

_F{_GAMEPLAY_STATUS_ZERO_PAGE_VARIABLES 

   POSSESSION_STATUS               .dsb 1   ; 70 
   PLAY_STATUS                     .dsb 1 
   BALL_STATUS                     .dsb 1 
   BALL_STATUS_SPECIAL             .dsb 1  
   FUM_LAST_TEAM_POSS              .dsb 1   

_F}_GAMEPLAY_STATUS_ZERO_PAGE_VARIABLES 

_F{_TEAM_CONTROL_ZERO_PAGE_VARIABLES 

	P1_TEAM_MAN_CTRL = $00 
	P1_TEAM_COA_CTRL = $10 
	P1_TEAM_COM_CTRL = $20 
	P1_TEAM_SKP_CTRL = $30
	
	P2_TEAM_MAN_CTRL = $00 
	P2_TEAM_COA_CTRL = $01 
	P2_TEAM_COM_CTRL = $02 
	P2_TEAM_SKP_CTRL = $03


	TEAM_CONTROL_TYPES              .dsb 1   ; NIBBLE 1 = P1, NIBBLE 2 = P2 
	
	
_F}_TEAM_CONTROL_ZERO_PAGE_VARIABLES 	
   
_F{_QUARTER_DOWN_ZERO_PAGE_VARIABLES 

   QUARTER                         .dsb 1  
   DOWN                            .dsb 1  
   
_F}_QUARTER_DOWN_ZERO_PAGE_VARIABLES    
   
_F{_PLAY_CALL_ZERO_PAGE_VARIABLES  
 
   PLAY_CALLS					   .dsb 0  
   P1_PLAY_CALL                    .dsb 1  
   P2_PLAY_CALL                    .dsb 1
   TEMP_BALL_LOC  				   .dsb 0    ; used during cpu injury player change
   OFF_PLAY_INDEX				   .dsb 0
   OFF_PLAY_ADDR                   .dsb 2
   				   	
_F}_PLAY_CALL_ZERO_PAGE_VARIABLES 
 
_F{_BANNER_ID_ZERO_PAGE_VARIABLES
  
   BANNER_ID                       .dsb 1 
   
_F}_BANNER_ID_ZERO_PAGE_VARIABLES     
   
_F{_FIELD_SCROLL_LIMITS_ZERO_PAGE_VARIABLES  

   LEFT_SCROLL_LIM_FIELD           .dsb 1 
   RIGHT_SCROLL_LIM_FIELD          .dsb 1 
   
_F}_FIELD_SCROLL_LIMITS_ZERO_PAGE_VARIABLES    

_F{_LOS_AND_FD_MARKER_ZERO_PAGE_VARIABLES  

   LOS_X                           .dsb 2
   LOS_Y                           .dsb 1
   FD_MARKER_X                     .dsb 2    ; where the first down started at 

_F}_LOS_AND_FD_MARKER_ZERO_PAGE_VARIABLES  
   
_F{_MAN_CONTROLLED_PLAYER_ZERO_PAGE_VARIABLES 
 
   BALL_CARRIER_P1_P2_ADDR		   .dsb 0 
   P1_MAN_PLAYER_ADDR              .dsb 2
   P2_MAN_PLAYER_ADDR              .dsb 2
   PLAYER_POSTION_ID			   .dsb 0
   P1_MAN_POS_ID_ICON_STATUS       .dsb 1    ; player name to display FF = CLEAR, 40 = CHANGE 
   P2_MAN_POS_ID_ICON_STATUS       .dsb 1    ; player name to display
    INIT_ICON_BITFLAG		= $80
	ICON_CHANGE_BITFLAG		= $40

 _F}_MAN_CONTROLLED_PLAYER_ZERO_PAGE_VARIABLES

_F{_SIDELINE_ANIMATION_ZERO_PAGE_VARIABLES 

   SIDELINE_SCROLL_X               .dsb 1  
   SIDELINE_ANI_TIMER              .dsb 1
   JUMPING_CHEERLEADER_SIDELINE_ID	= $01
   EXCITED_CROWD_SIDELINE_ID        = $02

_F}_SIDELINE_ANIMATION_ZERO_PAGE_VARIABLES 

_F{_TIMEOUTS_ZERO_PAGE_VARIABLES 

   P1_TIMEOUTS                     .dsb 1
   P2_TIMEOUTS                     .dsb 1
 .ENDE 
 
_F}_TIMEOUTS_ZERO_PAGE_VARIABLES  
 
_F{_BALL_LOC_SPEED_COLLISION_ZERO_PAGE_VARIABLES 	; SHARED
 
 .ENUM $8E
   BALL_MOVING      = $80
   
   BALL_COLLISION                  .dsb 1
   BALL_Y                          .dsb 3
   BALL_X                          .dsb 3
   FINAL_BALL_Y                    .dsb 2
   FINAL_BALL_X                    .dsb 2
   Y_DIST_REMAIN_BALL              .dsb 2
   X_DIST_REMAIN_BALL              .dsb 2
   BALL_VELOCITY_Y                 .dsb 2
   BALL_VELOCITY_X                 .dsb 2
   
   BALL_Z                          .dsb 3
   BALL_VELOCITY_Z                 .dsb 3
   BALL_GRAVITY                    .dsb 2
   BALL_DIRECTION				   .dsb 0 
   BALL_GRAVITY_INDEX              .dsb 1

   BALL_ANGLE                      .dsb 1
   BALL_SPEED                      .dsb 1
   BALL_ANI_FRAMES_LEFT            .dsb 2	; AC
   
 _F}_BALL_LOC_SPEED_COLLISION_ZERO_PAGE_VARIABLES   
 
_F{_CURRENT_PLAYER_ADDR_ZERO_PAGE_VARIABLE 
 
   CURRENT_PLAYER_ADDR             .dsb 2
 .ENDE 

_F}_CURRENT_PLAYER_ADDR_ZERO_PAGE_VARIABLE  
 
_F{_SEGMENT_ZERO_PAGE_VARIABLES 					; SHARED
 
 .ENUM $8E
	SEGMENT_VAR_8E					 .dsb 1
	SEGMENT_VAR_8F					 .dsb 1
	SEGMENT_VAR_90					 .dsb 1
	SEGMENT_VAR_91					 .dsb 1
	SEGMENT_VAR_92					 .dsb 1
	SEGMENT_VAR_93					 .dsb 1
	SEGMENT_VAR_94					 .dsb 1	
	SEGMENT_VAR_95					 .dsb 1
	SEGMENT_VAR_96					 .dsb 1	
	SEGMENT_VAR_97					 .dsb 1
	SEGMENT_VAR_98					 .dsb 1
	SEGMENT_VAR_99					 .dsb 1
	SEGMENT_VAR_9A					 .dsb 1
	SEGMENT_VAR_9B					 .dsb 1
	SEGMENT_VAR_9C					 .dsb 1
	SEGMENT_VAR_9D					 .dsb 1	
	SEGMENT_VAR_9E					 .dsb 1
	SEGMENT_VAR_9F					 .dsb 1
	SEGMENT_VAR_A0					 .dsb 1	
	SEGMENT_VAR_A1					 .dsb 1	
	SEGMENT_VAR_A2					 .dsb 1
	SEGMENT_VAR_A3					 .dsb 1	
	SEGMENT_VAR_A4					 .dsb 1
	SEGMENT_VAR_A5					 .dsb 1
	SEGMENT_VAR_A6					 .dsb 1
	SEGMENT_VAR_A7					 .dsb 1
	SEGMENT_VAR_A8					 .dsb 1
	SEGMENT_VAR_A9					 .dsb 1
	SEGMENT_VAR_AA					 .dsb 1	
	SEGMENT_VAR_AB					 .dsb 1
	SEGMENT_VAR_AC					 .dsb 1	
	SEGMENT_VAR_AD					 .dsb 1	
	SEGMENT_VAR_AE					 .dsb 1	
	SEGMENT_VAR_AF					 .dsb 1
 .ENDE  
 
_F}_SEGMENT_ZERO_PAGE_VARIABLES 					
 


   CPU_P1_PLAY_CALL					= SEGMENT_VAR_8E
   CPU_P2_PLAY_CALL					= SEGMENT_VAR_8F
  
   
.ENUM $9E
   CPU_SIDE_SAME_AS_OFF_BOOL		.dsb 1			  ; 0 = TRUE, 80= false	
   CPU_OFF_SCORE					.dsb 1
   CPU_OPP_SCORE					.dsb 1
   CPU_OFF_TIMEOUTS					.dsb 1 
   OFFENSIVE_STYLE					.dsb 1
   
.ENDE 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;; RANKINGS MENU
.ENUM $8E
	RANKINGS_MENU_CHOICE			.dsb 1
.ENDE	

;; SHARED SPACE
.ENUM $8E 
   PLAYER_CHANGE_WHERE                .dsb 1
.ENDE
;; SHARED SPACE
.ENUM $8F
; 00 = 2WR, 01 =4WR, 02, =3WR         
   FORMATION_TYPE                  .dsb 1
.ENDE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;; SHARED ZP SPACE                     ;;;
.ENUM $8E                                        
   REF_INJURY_ANI_INDEX            .dsb 1 
   STRETCHER_INJURY_ANI_INDEX        .dsb 1
   SPRITE_ANI_TIMER                 .dsb 1
.ENDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SHARED ZP SPACE                     ;;;
.ENUM $8E
WEEKLY_MATCHUPS_SRAM_ADDR			.dsb 2
SCHEDULE_PAGE_FOR_DRAW				.dsb 1 
.ENDE

.ENUM $96
TEMP_SCHEDULE_PAGE					.dsb 1 
.ENDE

.ENUM $AD
TEMP_CURRENT_TEAM					.dsb 1
.ENDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ENUM $8F  
        

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;for draw palybook
.ENUM $AC
CURRENT_PLAY_INDEX					.dsb 1
CURRRENT_PLAY_IMAGE					.dsb 1 
.ENDE
 
 .ENUM $B0
   PLAYERS_LEFT_TO_UPDATE          .dsb 1
   COMMAND_OR_COLL_INDEX           .dsb 1
   
   DIRECTION_TEMP				   .dsb 0
   PAST_LOC_CARRY_TEMP			   .dsb 0	; only used in one function
.ENDE
   
.ENUM $00B2 
   TEMP_PLAYER_SPR_ADDR            .dsb 2
   TEMP_PLAYER_SPR_MIRR            .dsb 1
 .ENDE   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
.ENUM $00B2 
   FINAL_Y_LOC_AFTER_ADJUST_PASS   .dsb 1
   FINAL_X_LOC_AFTER_ADJUST_PASS   .dsb 2
 .ENDE  
 
 .ENUM $00B2 
   TEMP_PASS_BLOCK_DEF_ADDR   .dsb 2
 .ENDE  
 
  .ENUM $00B2 
   TEMP_KICK_BLOCK_DEF_ADDR   .dsb 2
 .ENDE  
 
.ENUM $00B2 
   TEMP_TOTAL_PASS_FRAMES  			.dsb 2
 .ENDE
 
_F{_SACK_AND_TACKLER_ROSTER_ID_ZERO_PAGE_VARIABLES 

.ENUM $00B5 
   DEF_SACK_PASS_BLOCK_ROSTER_ID   .dsb 0
   TACKLER_ID                      .dsb 1
   TACKLED_PLAYER_BITFLAG			= $40
   
_F}_SACK_AND_TACKLER_ROSTER_ID_ZERO_PAGE_VARIABLES    
 
_F{_CUTSCENE_ZERO_PAGE_VARIABLES 

   CUTSCENE_CHANCE                 .dsb 1
   CUTSCENE_TO_DRAW                .dsb 1
   
_F}_CUTSCENE_ZERO_PAGE_VARIABLES   

_F{_SPRITE_INDEX_ZERO_PAGE_VARIABLES	

   SPR_INDEX_TEMP				   .dsb 0
   PLAYER_SPR_INDEX_TEMP           .dsb 1
   EXTRA_SPR_INDEX_TEMP            .dsb 1
   
_F}_SPRITE_INDEX_ZERO_PAGE_VARIABLES	  

_F{_COLLISON_CHECK_ZERO_PAGE_VARIABLES	

   CURR_OFF_COLL_ADDR              .dsb 2
   CURR_DEF_COLL_ADDR              .dsb 2

   OFF_CLOSE_COLL_ADDR             .dsb 2
   DEF_CLOSE_COLL_ADDR             .dsb 2
   
.ENDE 

_F}_COLLISON_CHECK_ZERO_PAGE_VARIABLES	

_F{_BG_AND_SPR_SCRIPT_ZERO_PAGE_VARIABLES				; SHARED 

.ENUM $00C2
     DRAW_SCRIPT_ID                .dsb 1
     DRAW_SCRIPT_BANK              .dsb 1
.ENDE  
  
.ENUM $00C2
   CURR_BG_SCRIPT_ADDR             			.dsb 2 ; c2,c3
   BG_SCRIPT_RETURN_ADDR           			.dsb 2 ; c4 c5
   CURR_BG_SCRIPT_PPU_ADDR         			.dsb 2 ; c6 c7
   NUM_FRAMES_DRAW_SCRIPT          			.dsb 1 ; c8   
   CURR_SPR_SCRIPT_ADDR            			.dsb 2 ; c9 ca
   CURR_SPR_RAM_ADDR               			.dsb 2 ; cb cc 
   SPRITE_RAM_INDEX                			.dsb 0 ; cd    
   SPRITE_SIZE                     			.dsb 1 ; cd
   SPRITE_SCRIPT_SPRITE_INDEX				.dsb 0 ; sprite ram index divided by 4 so tha sprite size flag can be added
   SPRITE_SCRIPT_ADDR_INDEX               	.dsb 1
   SPRITE_SCRIPT_COUNTER		   			.dsb 1
   SPR_SCRIPT_TOP_OF_SCREEN_THRESHOLD		.dsb 0
   SPR_SCRIPT_SPR_Y                			.dsb 1		;;; *** think can remove
   SPR_SCRIPT_BOTTOM_OF_SCREEN_THRESHOLD	.dsb 0
   NUM_SPRITES_SCRIPT              .dsb 1
   NUM_SPLIT_SCREENS               .dsb 1
   BG_CHR_BANK_OFFSET              .dsb 1
   DATA_ADDR_TEMP                  .dsb 2
.ENDE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;; for large helmet script
.ENUM $00C4
NUM_SPRITE_SCRIPTS_LARGE_HELMET				.dsb 1
LARGE_HELMET_SCRIPT_ID_ONE					.dsb 1 
LARGE_HELMET_SCRIPT_ID_TWO					.dsb 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; for METATILE 
.ENUM $00D4
   METATILE_INDEX             		.dsb 0
   TEMP_METATILE_DATA_ADDR			.dsb 2
   TEMP_METATILE_PPU_ADDR			.dsb 2
   NUM_METATILE_ROWS				.dsb 1
   NUM_METATILE_COLS				.dsb 1
 .ENDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ENUM $00D4
   Y_SCROLL_PER_FRAME              .dsb 1
   X_SCROLL_PER_FRAME              .dsb 1
   Y_SCROLL_INC_PER_FRAME          .dsb 1
   X_SCROLL_INC_PER_FRAME         .dsb 1
   NUM_FRAMES_TO_SCROLL			  .dsb 0 
   SCROLL_DISTANCE                .dsb 2 
   CHANGING_PALLETE_INDEX         .dsb 1
 .ENDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_F}_BG_AND_SPR_SCRIPT_ZERO_PAGE_VARIABLES

.ENUM $00DB 
   UNUSED_ZP_2                       .dsb 1 
   
_F{_PLAYER_COMMAND_ZERO_PAGE_VARIABLES
	   
   PLAYER_COMMAND                  .dsb 0
   PLAYER_COMMAND_ARG1             .dsb 1
   PLAYER_COMMAND_ARG2             .dsb 1
   PLAYER_COMMAND_ARG3             .dsb 1  
   HANDOFF_ICON_CHANGE_TIMER       .dsb 1
   
.ENDE 
_F}_PLAYER_COMMAND_ZERO_PAGE_VARIABLES

.ENUM $00E0
   UNUSED_ZP_3                        .dsb 1
.ENDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ENUM $00E1          
   CURRENT_KICK_BLOCK_DEFENDER		.dsb 1
   NUM_KICK_BLOCK_PLAYERS_TO_CHECK	.dsb 1
 .ENDE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 .ENUM $00EB
  PUNTER_HP				   .dsb 1 	 ; $EB  
.ENDE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_F{_PASS_TARGET_AND_COLLISION_ZERO_PAGE_VARIABLES		; SHARED 

.ENUM $00E1
   
   TARGET_PASS_COLL_INDEX				= $03  
   NO_PASS_COLLISION_STATUS				= $40 
   AT_FINAL_LOC_PASS_COLLISION_STATUS	= $30
   DIVING_PASS_COLLISION_STATUS			= $20
   JUMPING_PASS_COLLISION_STATUS		= $10
   
   NUM_PLAYERS_CAN_COLLIDE         .dsb 1
   PLAYERS_CAN_COLLIDE_WITH[]	    .dsb 4	
   PLAYERS_CAN_COLLIDE_BALL_PASS   .dsb 4
   
   DEFENDER_ONE_PASS_COLL_STATUS		= PLAYERS_CAN_COLLIDE_BALL_PASS 
   DEFENDER_TWO_PASS_COLL_STATUS		= PLAYERS_CAN_COLLIDE_BALL_PASS +1
   DEFENDER_THREE_PASS_COLL_STATUS		= PLAYERS_CAN_COLLIDE_BALL_PASS +2
   TARGET_PASS_COLL_STATUS				= PLAYERS_CAN_COLLIDE_BALL_PASS +3
.ENDE 

.ENUM $00EB
   TARGET_PLAY_CODE_ADDR		   .dsb 2 ; $EB
   PASS_TIMER_DIV_BY_4             .dsb 1
.ENDE  
 
 .ENUM $00E6 
   CURRENT_TARGET_ADDR				.dsb 0	
   CURRENT_DEFNDER_ADDR				.dsb 2
   PC_TABLE_INDEX					.dsb 1
   CURRENT_TARGET_DIRECTION			.dsb 1    
.ENDE 

_F}_PASS_TARGET_AND_COLLISION_ZERO_PAGE_VARIABLES   

 .ENUM $00EE   
   UNUSED_4                        .dsb 1
 .ENDE  
 
 .ENUM $00EF   
   PROGRAM_CRASH_CODE              .dsb 1
 .ENDE 

 






_F{_MENU_ZERO_PAGE_VARIABLES						; SHARED 


.ENUM $00E1
   MENU_INDEX                      .dsb 0
   P1_MENU_INDEX				   .dsb 0	   
   MENU_Y                          .dsb 1
   MENU_X                          .dsb 1 
   MENU_OPTIONS_ADDR               .dsb 2 
   MENU_JOYPAD_P1_OR_P2            .dsb 1
   MENU_INPUT_DELAY                .dsb 1
   
   RETURNER_MENU_ADDR[]			   .dsb 0  
   RETURNER_STARTER_MENU_ADDR      .dsb 2
   RETURNER_RESERVE_MENU_ADDR      .dsb 2
   
   
   PREV_MENU_Y                     .dsb 1
   PREV_MENU_X                     .dsb 1
   
   ON_RESERVES_BOOL				   .dsb 1
   ALL_STARTERS_INJ_FLAG           .dsb 1
.ENDE 

.ENUM $00E7
   P2_MENU_INDEX				   .dsb 0
   P2_MENU_Y                          .dsb 1
   P2_MENU_X                          .dsb 1 
   P2_MENU_OPTIONS_ADDR               .dsb 2 
   P2_MENU_JOYPAD_P1_OR_P2            .dsb 1
.ENDE 

.ENUM $00E7
   SECOND_MENU_INDEX				  .dsb 0
   SECOND_MENU_Y                      .dsb 1
   SECOND_MENU_X                      .dsb 1 
   SECOND_MENU_OPTIONS_ADDR           .dsb 2 
   SECOND_MENU_JOYPAD_P1_OR_P2        .dsb 1
.ENDE 

.ENUM $00E1
   P1_MENU_INFO[]					.dsb 6
   P2_MENU_INFO[]					.dsb 6
   MENU_INFO_LENGTH = P2_MENU_INFO[] - P1_MENU_INFO[]
.ENDE 

_F}_MENU_ZERO_PAGE_VARIABLES
                         
_F{_SOUND_ENGINE_ZERO_PAGE_VARIABLES

 .ENUM $00F0
   CURR_SONG_ADDR                  .dsb 2			; f0, f1
   CURR_SOUND_CHANNEL_INDEX        .dsb 0			; f2
   SOUND_CHANNELS_LEFT             .dsb 1			; f2
   SOUND_ENGINE_LOCAL_1            .dsb 1			; f3
   SOUND_ENGINE_LOCAL_2			   .dsb 1			; f4
   SOUND_ENGINE_LOCAL_3			   .dsb 1			; f5
   SOUND_ENGINE_LOCAL_4			   .dsb 1			; f6
   SOUND_ENGINE_LOCAL_5			   .dsb 1			; 	
 .ENDE   

CURR_SONG_CHANNEL_ADDR				= SOUND_ENGINE_LOCAL_2
APU_CHANNEL_OFFSET 					= SOUND_ENGINE_LOCAL_4 
VOLUME_ENEVELOPE_ADDR   			= SOUND_ENGINE_LOCAL_4 
CURR_SOUND_COMMAND_ADDR				= SOUND_ENGINE_LOCAL_4 
 
 .ENUM $F8
   SILENCE_ALL_CHANNELS_BOOLEAN    .dsb 1			; f8
   PITCH_ADJUST_VALUE              .dsb 1			; f9
   
   TEMP_VIBRATO_VALUE			   .dsb 0 			; fa
   VIBRATO_ADDR                    .dsb 2			; fa fb
   UNUSED_ZP_6					   .dsb 1			; fc 
   TEMP_VOLUME_OFFSET              .dsb 1           ; fd 
   CHANNEL_ACTIVE                  .dsb 1			; fE
   
_F}_SOUND_ENGINE_ZERO_PAGE_VARIABLES
   
   UNUSED_ZP_7                     .dsb 1			; ff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


