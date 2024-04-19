.BASE $A000

_F{_SPRITE_SCRIPT_MACROS

.MACRO JUMP_SPRITE_SCRIPT[ADDR] spriteaddr
		.DB >spriteaddr, <spriteaddr
.ENDM

.MACRO DO_TILE_DATA[ADDR] tileaddr
		.DB >tileaddr -$20, <tileaddr
.ENDM

.MACRO DO_SUBROUTINE[ADDR] routineaddr
		.DB >routineaddr +$20, <routineaddr
.ENDM


.MACRO LOOP_START[]
		loop_addr = $
.ENDM

.MACRO LOOP_END[]
		.DB >loop_addr, <loop_addr
.ENDM

.MACRO RETURN_FROM_SCRIPT_SUBROUTINE[]
		.DB $FE
.ENDM

loop_addr = $A000

_F}_SPRITE_SCRIPT_MACROS

_F{_SPRITE_SCRIPT_POINTER_TABLE_ONE

SPRITE_SCENE_POINTERS_FIRST_BANK:
																; BANK 9 0X10000
		.WORD PLAYER_JUMP_MISS_SPRITE_SCRIPT                      ; 0x00 PLAYER JUMP AND WHIFF
		.WORD SMALL_BALL_ACROSS_SCREEN_SPRITE_SCRIPT              ; 0x01 BALL FLYING ACROSS
		.WORD DIVING_CATCH_SPRITE_SCRIPT                          ; 0x02 PLAYER DIVING CATCH
		.WORD BALL_BOUNCE_OFF_PLAYER_SPRITE_SCRIPT                ; 0x03 BALL HITS PLAYER GROUND SIDWAYS SPIN 1
		.WORD BALL_LEFT_RIGHT_DIVING_CATCH_SPRITE_SCRIPT          ; 0x04 BALL MOVING ANGLED DOWN-RIGHT
		.WORD PLAYER_LAND_FROM_JUMP_SPRITE_SCRIPT                 ; 0x05 PLAYER LANDING FROM JUMP SPRITE
		.WORD PLAYER_NORMAL_CATCH_SPRITE_SCRIPT                   ; 0x06 PLAYER CATCH SPRITE
		.WORD BALL_OFF_PLAYER_HANDS_SPRITE_SCRIPT                 ; 0x07 BALL HITS PLAYER GROUND SIDEWAYS SPIN 2
		.WORD BALL_NORMAL_CATCH_LEFT_RIGHT_SPRITE_SCRIPT          ; 0x08 BALL MOVING ANGLED DOWN-RIGHT
		.WORD PLAYER_LOOKING_AT_BALL_CHAIN_MEAS_SPRITE_SCRIPT     ; 0x09 PLAYER LOOKING AT BALL, BALL, AND REFERREE CHAIN MEASURE SPRITES
		.WORD EMPTY_ONE_SPRITE_SCRIPT                             ; 0x0A UNUSED
		.WORD QB_ABOUT_THROW_BALL_SPRITE_SCRIPT                   ; 0x0B QB ABOUT TO THROW BALL MOVING
		.WORD BIG_BALL_BOUNCE_SPRITE_SCRIPT                       ; 0x0C BIG BALL BOUNCE
		.WORD CHEERLEADER_PANTY_SPRITE_SCRIPT                     ; 0x0D CHEELEADER PANTY ANIMATION
		.WORD DEFNDER_SACK_SPRITE_SCRIPT                          ; 0x0E PLAYER SACK ANIMATION
		.WORD MOVING_HAND_MISS_BALL_SPRITE_SCRIPT                 ; 0x0F MOVING HAND FOR CATCH STAYS OPEN
		.WORD MOVING_HAND_CATCH_BALL_SPRITE_SCRIPT                ; 0x10 MOVING HAND FOR CATCH STAYS HAND CLOSES
		.WORD BALL_DEF_INT_SPRITE_SCRIPT                          ; 0x11 MOVING BIG BALL POINTED DOWN RIGHT
		.WORD NFL_LOGO_SPRITE_SCRIPT                              ; 0x12 NFL LOGO
		.WORD HAND_THROWING_MOTION_SPRITE_SCRIPT                  ; 0x13 HAND THROWING MOTION
		.WORD BALL_FOR_QB_THROWING_SPRITE_SCRIPT                  ; 0x14 BALL POINTED UP LEFT TO RIGHT MOVING
		.WORD UNUSED_ONE_SPRITE_SCRIPT                            ; 0x15 PART OF STADIUM 1 UNUSED
		.WORD UNUSED_TWO_SPRITE_SCRIPT                            ; 0x16 PART OF STADIUM 2 UNUSED
		.WORD BALL_SNAP_SPRITE_SCRIPT                             ; 0x17 BALL LEFT TO RIGHT SNAP FOR INTRO
		.WORD HAND_SNAP_BALL_SPRITE_SCRIPT                        ; 0x18 HAND SNAPPING BALL
		.WORD PLAYER_DIVE_BLOCK_BALL_SPRITE_SCRIPT                ; 0x19 PLAYER DIVING TO BLOCK BALL
		.WORD BALL_MISSED_BLOCK_SPRITE_SCRIPT                     ; 0x1A FAST SPINNING BALL FG ANI UPPER LEFT TO UPPER RIGHT
		.WORD BALL_BLOCKED_SPRITE_SCRIPT                          ; 0x1B FAST SPINNING BALL FG HIT CROSSBAR/BLOCKED
		.WORD PUNTER_HEAD_TO_FOOT_SPRITE_SCRIPT                   ; 0x1C PUNTER SCROLL HEAD TO FOOT
		.WORD BALL_DROPPING_FOR_PUNT_SPRITE_SCRIPT                ; 0x1D BALL MOVE DOWN FOR PUNT
		.WORD PARACHUTER_HALFTIME_SPRITE_SCRIPT                   ; 0x1E PARACHUTER
		.WORD BOMJACK_CAPE_HALFTIME_SPRITE_SCRIPT                 ; 0x1F PART OF CAPE FOR BOMBJACK
		.WORD PUNTER_LEG_HORIZONTAL_SPRITE_SCRIPT                 ; 0x20 PUNTER WITH LEG AT 90 ANIMATION RIGHT TO LEFT
		.WORD BALL_SPINNING_PUNT_SPRITE_SCRIPT                    ; 0x21 FAST SPINNING BALL FG ANI BOT TO UPPER RIGHT
		.WORD UNUSED_THREE_SPRITE_SCRIPT                          ; 0x22 UNUSED
		.WORD FOOT_KICKING_BALL_SPRITE_SCRIPT                     ; 0x23 FOOT KICKING BALL
		.WORD SKY_STADIUM_INTRO_SPRITE_SCRIPT                     ; 0x24 PART OF SKY AND STAIDUM +TSB TEXT (VERTICAL SCROLL INTRO)
		.WORD FLAGS_SCOREBOARD_INTRO_SPRITE_SCRIPT                ; 0x25 RIGHT FLAGS AND PART OF SCOREBOARD  (VERTICAL SCROLL INTRO)
		.WORD CHEERLEADERS_PLAYERS_INTRO_SPRITE_SCRIPT            ; 0x26 CHEERLEADERS AND PLAYERS (VERTICAL SCROLL INTRO)
		.WORD BALL_BLOCKED_TOWARDS_PLAYER_SPRITE_SCRIPT           ; 0x27 BALL BEING BLOCKED TOWARDS PLAYER
		.WORD RUNNING_PLAYER_HAND_NUMBER_ONE_SPRITE_SCRIPT        ; 0x28 PLAYER RUNNING SPIKE BALL, HAND#1 SIGN IN AIR
		.WORD BALL_HIT_GROUND_AFTER_SPIKE_SPRITE_SCRIPT           ; 0x29 BALL HITS GROUND TOP TO BOTTOM
		.WORD DEFENDER_TACKLE_BARRY_SPRITE_SCRIPT                 ; 0x2A BACK OF DEFNDER TRYING TO TACKLE BARRY (INTRO)
		.WORD KICKING_CHEER_LEFT_SPRITE_SCRIPT                    ; 0x2B KICKING CHEERLEADER STARTING FAR LEFT
		.WORD KICKING_CHEER_MIDDLE_SPRITE_SCRIPT                  ; 0x2C KICKING CHEERLEADER STARTING MIDDLE
		.WORD FACES_SCREEN_ONE_DIV_CHAMP_SPRITE_SCRIPT            ; 0x2D PLAYER FACES IN HELMETS OFFSCREEN
		.WORD FACES_SCREEN_TWO_DIV_CHAMP_SPRITE_SCRIPT            ; 0x2E PLAYER FACES IN HELMETS ONSCREEN
		.WORD BALL_SPINNING_LEADING_PUNTERS_SPRITE_SCRIPT         ; 0x2F BALL ALL HORIZONATAL MIDDLE OF SCREEN TO RIGHT
		.WORD PLAYER_JUMPING_TD_SPRITE_SCRIPT                     ; 0x30 PLAYER JUMPING HOLDING HAND IN AIR
		.WORD NY_JETS_LH_LOGO_SPRITE_SCRIPT                       ; 0x31 NY_JETS_LH_LOGO
		.WORD CIN_LH_LOGO_SPRITE_SCRIPT                           ; 0x32 CINCINNATI_LH_LIGHTING
		.WORD CLE_LH_LOGO_SPRITE_SCRIPT                           ; 0x33 CLEVELAND_LH_ LIGHTING
		.WORD HOU_LH_LOGO_SPRITE_SCRIPT                           ; 0x34 HOUSTON_LH_LOGO
		.WORD PIT_LH_LOGO_SPRITE_SCRIPT                           ; 0x35 PITTSBURGH_LH_LOGO
		.WORD DEN_LH_LOGO_SPRITE_SCRIPT                           ; 0x36 DENVER_LH_LOGO
		.WORD KC_LH_LOGO_SPRITE_SCRIPT                            ; 0x37 KANSAS_CITY_LH_LOGO
		.WORD CARRY_INJURED_PLAYER_SPRITE_SCRIPT                  ; 0x38 CARRYING INJURED PLAYER
		.WORD BALL_LEFT_TO_RIGHT_SHRINKING_SIZE_SPRITE_SCRIPT     ; 0x39 FOOTBALL LEFT TO RIGHT LARGE TO SMALL PERSPECTIVE
		.WORD SEA_LH_LOGO_SPRITE_SCRIPT                           ; 0x3A SEATTLE_LH_LOGO
		.WORD DAL_LH_LOGO_SPRITE_SCRIPT                           ; 0x3B DALLAS_LH_LOGOS
		.WORD NYG_LH_LOGO_SPRITE_SCRIPT                           ; 0x3C NEW_YORK_GIANTS_LH_ LIGHTING
		.WORD IND_LH_LOGO_SPRITE_SCRIPT                           ; 0x3D INDY_LH_LOGO
		.WORD BUF_LH_LOGO_SPRITE_SCRIPT                           ; 0x3E BUFFALO_LH_LOGO
		.WORD MIA_LH_LOGO_SPRITE_SCRIPT                           ; 0x3F MIAMI_LH_LOGO
		.WORD NE_LH_LOGO_SPRITE_SCRIPT                            ; 0x40 NEW_ENGLAND_LH_LOGO
		.WORD OAK_LH_LOGO_SPRITE_SCRIPT                           ; 0x41 RAIDERS_LH_LOGO
		.WORD SD_LH_LOGO_SPRITE_SCRIPT                            ; 0x42 SAN_DIEGO_LH_LOGO
		.WORD PHI_LH_LOGO_SPRITE_SCRIPT                           ; 0x43 EAGLES_LH_LOGO
		.WORD PHX_LH_LOGO_SPRITE_SCRIPT                           ; 0x44 PHOENIX_LH_LOGO
		.WORD WAS_LH_LOGO_SPRITE_SCRIPT                           ; 0x45 WASHINGTON_LH_LOGO
		.WORD CHI_LH_LOGO_SPRITE_SCRIPT                           ; 0x46 CHICAGO_LH_LOGO
		.WORD DET_LH_LOGO_SPRITE_SCRIPT                           ; 0x47 DETROIT_LH_LOGO
		.WORD GB_LH_LOGO_SPRITE_SCRIPT                            ; 0x48 GREEN_BAY_LH_LOGO
		.WORD MIN_LH_LOGO_SPRITE_SCRIPT                           ; 0x49 MINNESOTA_LH_LOGO
		.WORD TB_LH_LOGO_SPRITE_SCRIPT                            ; 0x4A TAMPA_BAY_LH_LOGO
		.WORD ATL_LH_LOGO_SPRITE_SCRIPT                           ; 0x4B ATLANTA_LH_LOGO
		.WORD RAM_LH_LOGO_SPRITE_SCRIPT                           ; 0x4C RAMS_LH_LIGHTING
		.WORD NO_LH_LOGO_SPRITE_SCRIPT                            ; 0x4D NEW_ORLEANS_LH_LOGO
		.WORD SF_LH_LOGO_SPRITE_SCRIPT                            ; 0x4E SAN_FRANCISCO_LH_LOGO
		.WORD LH_FACEMASK_SPRITE_SCRIPT                           ; 0x4F FACEMASK
		.WORD LINEMAN_INTRO_ONE_SPRITE_SCRIPT                     ; 0x50 3PT LINEMAN 1 (INTRO)
		.WORD LINEMAN_INTRO_TWO_SPRITE_SCRIPT                     ; 0x51 3PT LINEMAN 2 (INTRO)
		.WORD LINEMAN_INTRO_THREE_SPRITE_SCRIPT                   ; 0x52 3PT LINEMAN 3 (INTRO)
		.WORD BIG_BALL_FOR_FG_SPRITE_SCRIPT                       ; 0x53 BIG BALL
		.WORD BALL_LEADING_SCORERS_SPRITE_SCRIPT                  ; 0x54 BALL SPINNING
		.WORD LT_OVER_PLAYER_ONE_SPRITE_SCRIPT                    ; 0x55 LT STANDING OVER PLAYER 3 (INTRO)
		.WORD LT_OVER_PLAYER_TWO_SPRITE_SCRIPT                    ; 0x56 LT STANDING OVER PLAYER FILL MATERIAL (INTRO)
		.WORD BALL_INTERCEPTION_LEADERS_SPRITE_SCRIPT             ; 0x57 BALL ALL HORIZONATAL LEFT OF SCREEN TO MIDDLE
		.WORD KICKOFF_ARM_P2_SPRITE_SCRIPT                        ; 0x58 KICKOFF ARM IN AIR P2
		.WORD SPIKE_BALL_TD_SPRITE_SCRIPT                         ; 0x59 PLAYER COMING UP TO SPIKE BALL TD
		.WORD HUG_JUMPIMG_PLAYER_TD_SPRITE_SCRIPT                 ; 0x5A CATCH PLAYER RUSHING TD ANIMATION
		.WORD BALL_MID_TO_UPPER_RIGHT_SPRITE_SCRIPT               ; 0x5B BALL MIDDLE TO UPPER RIGHT
		.WORD BALL_TOWARDS_FG_POSTS_PLAYER_PERS_SPRITE_SCRIPT     ; 0x5C BALL TOWARDS FG PLAYER PERSPECTIVE
		.WORD BOTH_PLAYERS_JUMP_SPRITE_SCRIPT                     ; 0x5D DOUBLE JUMP
		.WORD PLAYER_TRYING_TO_CATCH_SPRITE_SCRIPT                ; 0x5E PLAYER TRYING TO CATCH
		.WORD MOVING_HAND_LEFT_TO_RIGHT_SPRITE_SCRIPT             ; 0x5F MOVING HAND FOR CATCH LEFT TO RIGHT OPEN
		.WORD BALL_HIT_GROUND_SPRITE_SCRIPT                       ; 0x60 BALL HIT GROUND BIG TO SMALL VERTICAL PERSPECTIVE
		.WORD DUMMY_TILES_HIDE_GLITCHES_LT_SPRITE_SCRIPT          ; 0x61 LT STANDING OVER PLAYER 2 TO COVER SCROLLING GLITCHES(INTRO)
		.WORD DIVING_DROP_SPRITE_SCRIPT                           ; 0x62 PLAYER DIVING FOR BALL DROP
		.WORD BALL_FOR_DIVE_LEFT_TO_RIGHT_SPRITE_SCRIPT           ; 0x63 BALL ANIMATION DIVE TOP LEFT TO UPPER RIGHT
		.WORD DIVING_MISS_SPRITE_SCRIPT                           ; 0x64 PLAYER DIVING FOR BALL MISS
		.WORD BIG_BALL_LEFT_TO_RIGHT_SPRITE_SCRIPT                ; 0x65 BIG BALL LEFT TO RIGHT
		.WORD OPEN_HAND_CATCH_SPRITE_SCRIPT                       ; 0x66 OPEN HAND FOR CATCH
		.WORD PLAYER_JUMPING_CATCH_STILL_SPRITE_SCRIPT            ; 0x67 PLAYER JUMPING NO ANIMATION
		.WORD BALL_REC_LEADERS_SPRITE_SCRIPT                      ; 0x68 BALL SPRITE FOR NFL LEADING RECEIVERS
		.WORD QB_THROWING_PASS_LEADERS_SPRITE_SCRIPT              ; 0x69 QB THROWING FOR NFL LEADING PASSERS
		.WORD PLAYER_CATCHING_SILL_REC_LEADERS_SPRITE_SCRIPT      ; 0x6A PLAYER CATCHING FOR NFL LEADING RECEIVERS
		.WORD KICKER_SILL_SCORE_LEADERS_SPRITE_SCRIPT             ; 0x6B KICKER SPRITE FOR NFL LEADING SCORERS
		.WORD PUNTER_SILL_PUNT_LEADERS_SPRITE_SCRIPT              ; 0x6C PUNTER SPRITE FOR NFL LEADING PUNTERS
		.WORD JUMPING_DEF_SILL_INT_LEADERS_SPRITE_SCRIPT          ; 0x6D DEFENDER SPRITE FOR NFL INTERCEPTION LEADERS
		.WORD DIVING_DEF_SILL_SACK_LEADERS_SPRITE_SCRIPT          ; 0x6E DEFENDER SPRITE FOR NFL SACK LEADERS
		.WORD RETURNER_SILL_LEADERS_SPRITE_SCRIPT                 ; 0x6F DEFENDER SPRITE FOR KR/PR LEADERS
		.WORD QB_THROWING_CREDITS_SPRITE_SCRIPT                   ; 0x70 QB THROWING SCROLL FROM OFFSCREEN (CREDITS)
		.WORD RUNNING_PLAYER_HAND_NUMBER_ONE_CREDITS_SPRITE_SCRIPT; 0x71 PLAYER RUNNING HAND IN AIR (CREDITS)
		.WORD UNUSED_FOUR_SPRITE_SCRIPT                           ; 0x72 UNUSED
		.WORD BALL_FROM_OFFSCREEN_CREDITS_SPRITE_SCRIPT           ; 0x73 BALL COMING FROM OFFSCREEN SCROLLING DOWN RIGHT (CREDITS)?
		.WORD PLAYER_CATCH_BALL_CREDITS_SPRITE_SCRIPT             ; 0x74 PLAYER CATCHING BALL(CREDITS)
		.WORD KICKOFF_ARM_P1_SPRITE_SCRIPT                        ; 0x75 PLAYER ARM IN AIR FOR KICKOFF
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x76 CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x77 CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x78 CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x79 CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x7A CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x7B CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x7C CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x7D CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x7E CLEAR SPRITES
		.WORD END_OF_SCRIPT_SPRITE_SCRIPT                         ; 0x7F CLEAR SPRITES  actuaL INDEX USED

_F}_SPRITE_SCRIPT_POINTER_TABLE_ONE

_F{_PLAYER_JUMP_MISS_SPRITE_SCRIPTS

PLAYER_JUMP_MISS_SPRITE_SCRIPT:                                   ; 0X00 PLAYER JUMP AND WHIFF
.DB $F6,$31,$57,$32,$33                                        ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$56,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 172, X: 124
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	DO_TILE_DATA[ADDR] JUMP_PLYER_SPR_TILE_DATA
	.DB $FB,$A0,$00,$D0,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -10,X PIXELS/FRM: 0, Y SPEED INC/FRM: 48 , XSPEED INC/FRM:: 0
	.DB $11                                                       ; SCROLL OR WAIT FOR: 34 FRAMES
	DO_TILE_DATA[ADDR] JUMPING_PLAYER_STILL_SPR_TILE_DATA

	.DB $03                                                       ; SCROLL OR WAIT FOR: 6 FRAMES
LOOP_START[]                                                      ; JUMPING PLAYER LOOP
	DO_TILE_DATA[ADDR] JUMP_PLYER_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] JUMPING_PLAYER_STILL_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
LOOP_END[]

SMALL_BALL_ACROSS_SCREEN_SPRITE_SCRIPT:                           ; 0X01 SMALL BALL FLYING ACROSS TOP OF SCREEN
	.DB $F6,$31,$57,$32,$33                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$0A,$FE                                               ; SET SPRITE STARTING LOCATION= Y: 20, X: 236 OFFSCREEN
	DO_TILE_DATA[ADDR] TINY_BALL_TOP_SCREEN_SPR_TILE_DATA
	.DB $09                                                       ; SCROLL OR WAIT FOR: 18 FRAMES
	.DB $FB,$04,$70,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.25,X PIXELS/FRM: 7, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $19                                                       ; SCROLL OR WAIT FOR: 50 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_PLAYER_JUMP_MISS_SPRITE_SCRIPTS	

_F{_DIVING_CATCH_SPRITE_SCRIPT

DIVING_CATCH_SPRITE_SCRIPT:                                       ; 0X02 PLAYER DIVING CATCH
	.DB $F6,$3A,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$22,$36                                               ; SET SPRITE STARTING LOCATION= Y: 68, X: 108
	DO_TILE_DATA[ADDR] PLAYER_DIVING_BALL_SPR_TILE_DATA
	.DB $FB,$08,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.5,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	DO_TILE_DATA[ADDR] HANDS_HOLDING_BALL_SPR_TILE_DATA
	
_F}_DIVING_CATCH_SPRITE_SCRIPT	

_F{_END_OF_CATCHES_SPRITE_SCRIPT

END_OF_CATCHES_SPRITE_SCRIPT:
	.DB $E2                                                       ; SET NUMBER OF TIMES TO LOOP = 2
	.DB $FB,$10,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 1,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $FB,$F0,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $F7                                                       ; LOOP TIMER--
	.DB $FB,$02,$06,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.125, X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_END_OF_CATCHES_SPRITE_SCRIPT	

_F{_BALL_BOUNCE_OFF_PLAYER_SPRITE_SCRIPT

BALL_BOUNCE_OFF_PLAYER_SPRITE_SCRIPT:                             ; 0X03 BALL HITS PLAYER/GROUND SIDWAYS SPIN 1
	DO_SUBROUTINE[ADDR] SCROLL_BALL_DOWN_RIGHT_SPRITE_SUB
	.DB $FB,$E0,$30,$F0,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -14,X PIXELS/FRM: 3, Y SPEED INC/FRM: 16 , XSPEED INC/FRM:: 0
LOOP_START[]                                                      ; BALL SPINNING LOOP
	.DB $F9                                                       ; SWITCH CUTSCENE SIDE
	DO_TILE_DATA[ADDR] LARGE_BALL_DIVE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $FA                                                       ; SAVE CUTSCENE SIDE IN SPR RAM
	DO_TILE_DATA[ADDR] LARGE_BALL_DIVE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
LOOP_END[]

_F}_BALL_BOUNCE_OFF_PLAYER_SPRITE_SCRIPT

_F{_SCROLL_BALL_DOWN_RIGHT_SPRITE_SUB

SCROLL_BALL_DOWN_RIGHT_SPRITE_SUB:                                ; SCROLL BALL DOWN RIGHT ROUTINE
	.DB $F6,$3A,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$16,$2A                                               ; SET SPRITE STARTING LOCATION= Y: 44, X: 84
	DO_TILE_DATA[ADDR] LARGE_BALL_DIVE_SPR_TILE_DATA
	.DB $FB,$16,$60,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 1.375, X PIXELS/FRM: 6, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_SCROLL_BALL_DOWN_RIGHT_SPRITE_SUB	

_F{_BALL_LEFT_RIGHT_DIVING_CATCH_SPRITE_SCRIPT

BALL_LEFT_RIGHT_DIVING_CATCH_SPRITE_SCRIPT:                       ; 0X04 BALL MOVING ANGLED DOWN-RIGHT
	DO_SUBROUTINE[ADDR] SCROLL_BALL_DOWN_RIGHT_SPRITE_SUB
	.DB $FF                                                       ; END OF SPRITE DATA
	
_F}_BALL_LEFT_RIGHT_DIVING_CATCH_SPRITE_SCRIPT

_F{_PLAYER_LAND_FROM_JUMP_SPRITE_SCRIPT

PLAYER_LAND_FROM_JUMP_SPRITE_SCRIPT:                              ; 0X05 PLAYER LANDING FROM JUMP SPRITE FACING SCREEN
	.DB $F6,$28,$29,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$DE,$3E                                               ; SET SPRITE STARTING LOCATION= Y: -188, X: 124 OFFSCREEN
	DO_TILE_DATA[ADDR] LAND_FROM_JUMP_SPR_TILE_DATA
	.DB $FB,$70,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 7,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT

_F}_PLAYER_LAND_FROM_JUMP_SPRITE_SCRIPT

_F{_PLAYER_NORMAL_CATCH_SPRITE_SCRIPT

PLAYER_NORMAL_CATCH_SPRITE_SCRIPT:                                ; 0X06 PLAYERS SIDEWAYS CATCH SPRITE BALL INTO STOMACH
	.DB $F6,$36,$37,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$22,$36                                               ; SET SPRITE STARTING LOCATION= Y: 68, X: 108
	DO_TILE_DATA[ADDR] PLAYER_ATTEMPT_CATCH_SPR_TILE_DATA
	.DB $FB,$08,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.5,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	DO_TILE_DATA[ADDR] PLAYER_CATCH_BALL_NORMAL_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] END_OF_CATCHES_SPRITE_SCRIPT
	
_F}_PLAYER_NORMAL_CATCH_SPRITE_SCRIPT	

_F{_BALL_OFF_PLAYER_HANDS_SPRITE_SCRIPT

BALL_OFF_PLAYER_HANDS_SPRITE_SCRIPT:                              ; 0X07 BALL HITS PLAYER GROUND SIDEWAYS SPIN 2
	.DB $F6,$36,$37,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$1A,$22                                               ; SET SPRITE STARTING LOCATION= Y: 52, X: 68
	DO_TILE_DATA[ADDR] BALL_COMING_FROM_OFFSCREEN_SPR_TILE_DATA
	.DB $FB,$18,$60,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 1.5,X PIXELS/FRM: 6, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	.DB $FB,$D0,$30,$E8,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -13,X PIXELS/FRM: 3, Y SPEED INC/FRM: 24 , XSPEED INC/FRM:: 0

LOOP_START[]                                                      ; BALL SPIN 2 LOOP
	DO_TILE_DATA[ADDR] BALL_OFF_HANDS_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] BALL_COMING_FROM_OFFSCREEN_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
LOOP_END[]

_F}_BALL_OFF_PLAYER_HANDS_SPRITE_SCRIPT

_F{_BALL_NORMAL_CATCH_LEFT_RIGHT_SPRITE_SCRIPT

BALL_NORMAL_CATCH_LEFT_RIGHT_SPRITE_SCRIPT:                       ; 0X08 BALL MOVING ANGLED DOWN-RIGHT
	.DB $F6,$36,$37,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$1A,$22                                               ; SET SPRITE STARTING LOCATION= Y: 52, X: 68
	DO_TILE_DATA[ADDR] BALL_COMING_FROM_OFFSCREEN_SPR_TILE_DATA
	.DB $FB,$18,$60,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 1.5,X PIXELS/FRM: 6, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	.DB $FF                                                       ; END OF SPRITE DATA
	
_F}_BALL_NORMAL_CATCH_LEFT_RIGHT_SPRITE_SCRIPT	

_F{_PLAYER_LOOKING_AT_BALL_CHAIN_MEAS_SPRITE_SCRIPT

PLAYER_LOOKING_AT_BALL_CHAIN_MEAS_SPRITE_SCRIPT:                  ; 0X09 PLAYER LOOKING AT BALL, BALL, AND REFERREE CHAIN MEASURE SPRITES
	.DB $F6,$31,$00,$3B,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F1,$00,$FD                                               ; SET SPRITE BOTTOM OFFSCREEN THRESHOLD TO: 253
	.DB $F8,$28,$40                                               ; SET SPRITE STARTING LOCATION= Y: 80, X: 128
	DO_TILE_DATA[ADDR] CHAIN_MEASURE_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT

_F}_PLAYER_LOOKING_AT_BALL_CHAIN_MEAS_SPRITE_SCRIPT

EMPTY_ONE_SPRITE_SCRIPT:                                          ; 0X0A *** UNUSED
	.DB $FF                                                       ; END OF SPRITE DATA


_F{_QB_ABOUT_THROW_BALL_SPRITE_SCRIPT

QB_ABOUT_THROW_BALL_SPRITE_SCRIPT:                                ; 0X0B QB ABOUT TO THROW BALL MOVING
	.DB $F6,$38,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$24,$16                                               ; SET SPRITE STARTING LOCATION= Y: 72, X: 44
	DO_TILE_DATA[ADDR] QB_THROWING_SPR_TILE_DATA
	.DB $FB,$00,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	JUMP_SPRITE_SCRIPT[ADDR] SCROLL_FOREVER_SCRIPT
	
_F}_QB_ABOUT_THROW_BALL_SPRITE_SCRIPT	

_F{_BIG_BALL_BOUNCE_SPRITE_SCRIPT

BIG_BALL_BOUNCE_SPRITE_SCRIPT:                                    ; 0X0C BIG BALL (PLAYER TIPS BALL)
	.DB $F6,$39,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$24,$FE                                               ; SET SPRITE STARTING LOCATION= Y: 72, X: 184 OFFSCREEN
	DO_TILE_DATA[ADDR] BIG_BALL_INT_TIP_NORMAL_SPR_TILE_DATA
	.DB $FB,$0C,$70,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.75,X PIXELS/FRM: 7, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	.DB $F9                                                       ; SWITCH CUTSCENE SIDE
	.DB $FB,$F4,$70,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15.25,X PIXELS/FRM: 7, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0

LOOP_START[]                                                      ; SPINNING EFFECT LOOP
	.DB $FA                                                       ; SAVE CUTSCENE SIDE IN SPR RAM
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $F9                                                       ; SWITCH CUTSCENE SIDE
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
LOOP_END[]

_F}_BIG_BALL_BOUNCE_SPRITE_SCRIPT

_F{_CHEERLEADER_PANTY_SPRITE_SCRIPT

CHEERLEADER_PANTY_SPRITE_SCRIPT:                                  ; 0X0D CHEELEADER PANTY ANIMATION
	.DB $F6,$31,$65,$66,$67                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$44                                                   ; SET SPRITE PALLETE INDEX  TO: 68
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	.DB $F8,$63,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 198, X: 116
	.DB $12                                                       ; SCROLL OR WAIT FOR: 36 FRAMES
	.DB $FB,$A0,$04,$E0,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -10,X PIXELS/FRM: 0, Y SPEED INC/FRM: 32 , XSPEED INC/FRM:: 0
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	DO_TILE_DATA[ADDR] CHEER_PANTY_ONE_SPR_TILE_DATA
	.DB $19                                                       ; SCROLL OR WAIT FOR: 50 FRAMES
	DO_TILE_DATA[ADDR] CHEER_PANTY_TWO_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] CHEER_PANTY_THREE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_CHEERLEADER_PANTY_SPRITE_SCRIPT	

_F{_DEFENDER_SACK_SPRITE_SCRIPT

DEFNDER_SACK_SPRITE_SCRIPT:                                       ; 0X0E PLAYER SACK ANIMATION
	.DB $F6,$31,$39,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$54,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 168, X: 124
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	DO_TILE_DATA[ADDR] PLAYER_SACK_SPR_TILE_DATA
	.DB $FB,$E0,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -14,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $14                                                       ; SCROLL OR WAIT FOR: 40 FRAMES
	.DB $E4                                                       ; SET NUMBER OF TIMES TO LOOP = 4
	.DB $FB,$0C,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.75,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	.DB $FB,$F4,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15.25,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	.DB $F7                                                       ; LOOP TIMER--
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}DEFENDER_SACK_SPRITE_SCRIPT	

_F{_MOVING_HAND_MISS_BALL_SPRITE_SCRIPT

MOVING_HAND_MISS_BALL_SPRITE_SCRIPT:                              ; 0X0F MOVING HAND FOR CATCH STAYS OPEN
	.DB $F6,$39,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$30,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 96, X: 116
	DO_TILE_DATA[ADDR] HAND_ATTEMPT_TO_CATCH_SPR_TILE_DATA
	.DB $FB,$00,$10,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES


END_OF_MOVING_HAND_CATCH_OR_MISS_SCRIPT:
	.DB $E2                                                       ; SET NUMBER OF TIMES TO LOOP = 2
	.DB $FB,$00,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $FB,$00,$C0,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -12, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $F7                                                       ; LOOP TIMER--
	.DB $FB,$00,$08,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_MOVING_HAND_MISS_BALL_SPRITE_SCRIPT	

_F{_MOVING_HAND_CATCH_BALL_SPRITE_SCRIPT

MOVING_HAND_CATCH_BALL_SPRITE_SCRIPT:                             ; 0X10 MOVING HAND FOR CATCH STAYS HAND CLOSES
	.DB $F6,$39,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$30,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 96, X: 116
	DO_TILE_DATA[ADDR] OPEN_HAND_FOR_CATCH_SPR_TILE_DATA
	.DB $FB,$00,$10,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	DO_TILE_DATA[ADDR] HAND_CLOSED_FOR_CATCH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] END_OF_MOVING_HAND_CATCH_OR_MISS_SCRIPT
	
_F}_MOVING_HAND_CATCH_BALL_SPRITE_SCRIPT	

_F{_BALL_DEF_INT_SPRITE_SCRIPT

BALL_DEF_INT_SPRITE_SCRIPT:                                       ; 0X11 MOVING BIG BALL POINTED DOWN RIGHT
	.DB $F6,$39,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$24,$FE                                               ; SET SPRITE STARTING LOCATION= Y: 72, X: 184 OFFSCREEN
	DO_TILE_DATA[ADDR] BIG_BALL_INT_TIP_NORMAL_SPR_TILE_DATA
	.DB $FB,$0C,$70,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.75,X PIXELS/FRM: 7, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] END_OF_MOVING_HAND_CATCH_OR_MISS_SCRIPT
	
_F}_BALL_DEF_INT_SPRITE_SCRIPT	

_F{_NFL_LOGO_SPRITE_SCRIPT

NFL_LOGO_SPRITE_SCRIPT:                                           ; 0X12 NFL LOGO
	.DB $F6,$24,$25,$2B,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$01                                                   ; SET SPRITE PALLETE INDEX  TO: 1
	.DB $F8,$34,$4C                                               ; SET SPRITE STARTING LOCATION= Y: 104, X: 152
	DO_TILE_DATA[ADDR] NFL_LOGO_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_NFL_LOGO_SPRITE_SCRIPT	

_F{_HAND_THROWING_MOTION_SPRITE_SCRIPT

HAND_THROWING_MOTION_SPRITE_SCRIPT:                               ; 0X13 HAND THROWING MOTION BALL RELEASED
	.DB $F6,$30,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$34,$2E                                               ; SET SPRITE STARTING LOCATION= Y: 104, X: 92
	DO_TILE_DATA[ADDR] HAND_THROWING_ONE_SPR_TILE_DATA
	.DB $FB,$00,$10,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] HAND_THROWING_THREE_SPR_TILE_DATA
	.DB $FB,$00,$10,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT

_F}_HAND_THROWING_MOTION_SPRITE_SCRIPT	

_F{_BALL_FOR_QB_THROWING_SPRITE_SCRIPT	
	

BALL_FOR_QB_THROWING_SPRITE_SCRIPT:                              ; 0X14 BALL POINTED UP, MOVING RIGHT
	.DB $F6,$30,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$32,$2E                                               ; SET SPRITE STARTING LOCATION= Y: 100, X: 92
	DO_TILE_DATA[ADDR] HAND_THROWING_TWO_SPR_TILE_DATA
	.DB $FB,$00,$10,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	.DB $FB,$F0,$70,$F8,$70                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15,X PIXELS/FRM: 7, Y SPEED INC/FRM: 8 , XSPEED INC/FRM:: 112
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	.DB $FF                                                       ; END
	
_F}_BALL_FOR_QB_THROWING_SPRITE_SCRIPT		

UNUSED_ONE_SPRITE_SCRIPT:                                         ; 0X15 UNFINISHED? ***
	.DB $FC,$22                                                   ; SET SPRITE PALLETE INDEX  TO: 34
	.DB $F8,$0A,$00                                               ; SET SPRITE STARTING LOCATION= Y: 20, X: 0
UNUSED_HIDE_TILES_SCRIPT:
	DO_TILE_DATA[ADDR] BLANK_TILES_HIDE_GLITCHES_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT

UNUSED_TWO_SPRITE_SCRIPT:                                         ; 0X16 UNFINISHED? ***
	.DB $FC,$22                                                   ; SET SPRITE PALLETE INDEX  TO: 34
	.DB $F8,$40,$00                                               ; SET SPRITE STARTING LOCATION= Y: 128, X: 0
	JUMP_SPRITE_SCRIPT[ADDR] UNUSED_HIDE_TILES_SCRIPT

_F{_HAND_AND_BALL_FOR_LINEMAN_INTRO_SPRITE_SCRIPTS

BALL_SNAP_SPRITE_SCRIPT:                                          ; 0X17 BALL LEFT TO RIGHT LINEMAN SNAP
	.DB $F6,$31,$00,$30,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$24,$46                                               ; SET SPRITE STARTING LOCATION= Y: 72, X: 140
	DO_TILE_DATA[ADDR] HAND_SNAP_BALL_THREE_SPR_TILE_DATA
	.DB $FB,$00,$F0,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -15, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	.DB $FB,$00,$81,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -8, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	.DB $FF                                                       ; END

HAND_SNAP_BALL_SPRITE_SCRIPT:                                     ; 0X18 HAND SNAPPING BALL
	.DB $F6,$31,$00,$30,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$24,$46                                               ; SET SPRITE STARTING LOCATION= Y: 72, X: 140
	.DB $F9                                                       ; SWITCH CUTSCENE SIDE
	DO_TILE_DATA[ADDR] HAND_SNAP_BALL_ONE_SPR_TILE_DATA
	.DB $FB,$00,$F0,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -15, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] HAND_SNAP_BALL_TWO_SPR_TILE_DATA
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_HAND_AND_BALL_FOR_LINEMAN_INTRO_SPRITE_SCRIPTS	

_F{_PLAYER_DIVE_BLOCK_BALL_SPRITE_SCRIPT

PLAYER_DIVE_BLOCK_BALL_SPRITE_SCRIPT:                             ; 0X19 PLAYER DIVING TO BLOCK BALL
	.DB $F6,$28,$29,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$26,$76                                               ; SET SPRITE STARTING LOCATION= Y: 76, X: 236
	DO_TILE_DATA[ADDR] DIVE_BLOCK_BALL_SPR_TILE_DATA
	.DB $FB,$EC,$B0,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -14.75,X PIXELS/FRM: -11, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $14                                                       ; SCROLL OR WAIT FOR: 40 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_PLAYER_DIVE_BLOCK_BALL_SPRITE_SCRIPT	

_F{_BALL_MISSED_FG_BLOCK_SPRITE_SCRIPT

BALL_MISSED_BLOCK_SPRITE_SCRIPT:                                  ; 0X1A FAST SPINNING BALL FG ANI UPPER LEFT TO UPPER RIGHT
	.DB $F6,$28,$29,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$26,$FE                                               ; SET SPRITE STARTING LOCATION= Y: 76, X: 180 OFFSCREEN
	.DB $FB,$E8,$60,$FC,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -14.5,X PIXELS/FRM: 6, Y SPEED INC/FRM: 4 , XSPEED INC/FRM:: 0

SPINNING_BALL_SCRIPT:
LOOP_START[]                                                      ; SPINNING BALL FG LOOP
	DO_TILE_DATA[ADDR] SPIN_BALL_FG_ONE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SPIN_BALL_FG_TWO_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
LOOP_END[]

_F}_BALL_MISSED_FG_BLOCK_SPRITE_SCRIPT

_F{_BALL_BLOCKED_FG_SPRITE_SCRIPT

BALL_BLOCKED_SPRITE_SCRIPT:                                       ; 0X1B FAST SPINNING BALL FG HIT CROSSBAR/BLOCKED
	.DB $F6,$28,$29,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$26,$FE                                               ; SET SPRITE STARTING LOCATION= Y: 76, X: 180 OFFSCREEN
	.DB $FB,$E8,$60,$FC,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -14.5,X PIXELS/FRM: 6, Y SPEED INC/FRM: 4 , XSPEED INC/FRM:: 0
	.DB $E5                                                       ; SET NUMBER OF TIMES TO LOOP = 5
	DO_TILE_DATA[ADDR] SPIN_BALL_FG_ONE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SPIN_BALL_FG_TWO_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $F7                                                       ; LOOP TIMER--
	.DB $FB,$C0,$E0,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -12,X PIXELS/FRM: -14, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	JUMP_SPRITE_SCRIPT[ADDR] SPINNING_BALL_SCRIPT
	
_F}_BALL_BLOCKED_FG_SPRITE_SCRIPT	

_F{_PUNTER_HEAD_TO_FOOT_AND_BALL_SPRITE_SCRIPTS

PUNTER_HEAD_TO_FOOT_SPRITE_SCRIPT:                                ; 0X1C PUNTER SCROLL HEAD TO FOOT
	.DB $F6,$31,$00,$00,$3C                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F1,$00,$38                                               ; SET SPRITE BOTTOM OFFSCREEN THRESHOLD TO: 56
	.DB $F1,$01,$70                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 112
	.DB $F8,$32,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 100, X: 124
	DO_TILE_DATA[ADDR] PUNTER_HEAD_FOOT_SPR_TILE_DATA
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	.DB $FB,$F0,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $14                                                       ; SCROLL OR WAIT FOR: 40 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

BALL_DROPPING_FOR_PUNT_SPRITE_SCRIPT:                             ; 0X1D BALL MOVE DOWN TO FOOT FOR PUNT
	.DB $F6,$31,$00,$00,$3C                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$2E,$46                                               ; SET SPRITE STARTING LOCATION= Y: 92, X: 140
	DO_TILE_DATA[ADDR] BALL_FOR_PUNT_SPR_TILE_DATA
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	.DB $FB,$01,$00,$03,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0625,X PIXELS/FRM: 0, Y SPEED INC/FRM: 3 , XSPEED INC/FRM:: 0
	.DB $14                                                       ; SCROLL OR WAIT FOR: 40 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_PUNTER_HEAD_TO_FOOT_AND_BALL_SPRITE_SCRIPTS	

_F{_PARACHUTER_HALFTIME_SPRITE_SCRIPT

PARACHUTER_HALFTIME_SPRITE_SCRIPT:                                ; 0X1E PARACHUTER
	.DB $F6,$69,$65,$66,$67                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$34                                                   ; SET SPRITE PALLETE INDEX  TO: 52
	.DB $F8,$EE,$8A                                               ; SET SPRITE STARTING LOCATION= Y: -220, X: 476 OFFSCREEN
	.DB $FB,$08,$F4,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.5,X PIXELS/FRM: -15, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $EF                                                       ; SET NUMBER OF TIMES TO LOOP = 15
	DO_TILE_DATA[ADDR] PARACHUTER_ONE_SPR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] PARACHUTER_TWO_SPR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	.DB $F7                                                       ; LOOP TIMER--
	.DB $FB,$04,$F4,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.25,X PIXELS/FRM: -15, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
LOOP_START[]                                                      ; PARACHUTER FLOAT LOOP
	DO_TILE_DATA[ADDR] PARACHUTER_ONE_SPR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] PARACHUTER_TWO_SPR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
LOOP_END[]

_F}_PARACHUTER_HALFTIME_SPRITE_SCRIPT

_F{_BOMJACK_CAPE_HALFTIME_SPRITE_SCRIPT

BOMJACK_CAPE_HALFTIME_SPRITE_SCRIPT:                              ; 0X1F PART OF CAPE FOR BOMBJACK
	.DB $F6,$69,$65,$66,$67                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$34                                                   ; SET SPRITE PALLETE INDEX  TO: 52
	.DB $F8,$36,$7E                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 252
	.DB $1E                                                       ; SCROLL OR WAIT FOR: 60 FRAMES
	.DB $FB,$00,$F6,$00,$01                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -15, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 1
	DO_TILE_DATA[ADDR] BOMJACK_CAPE_SPR_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] SCROLL_FOREVER_SCRIPT
	
_F}_BOMJACK_CAPE_HALFTIME_SPRITE_SCRIPT	

_F{_PUNTER_LEG_HORIZONTAL_SPRITE_SCRIPT

PUNTER_LEG_HORIZONTAL_SPRITE_SCRIPT:                              ; 0X20 PUNTER WITH LEG AT 90 ANIMATION RIGHT TO LEFT
	.DB $F6,$3E,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$2A,$2E                                               ; SET SPRITE STARTING LOCATION= Y: 84, X: 92
	DO_TILE_DATA[ADDR] LEG_NINETY_PUNT_SPR_TILE_DATA
	.DB $FB,$00,$E8,$00,$08                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -14, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 8
	.DB $19                                                       ; SCROLL OR WAIT FOR: 50 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_PUNTER_LEG_HORIZONTAL_SPRITE_SCRIPT	

_F{_BALL_SPINNING_PUNT_SPRITE_SCRIPT

BALL_SPINNING_PUNT_SPRITE_SCRIPT:                                 ; 0X21 FAST SPINNING BALL FG ANI BOT TO UPPER RIGHT
	.DB $F6,$3E,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$2E,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 92, X: 116

BALL_SPIN_PUNT_SCRIPT:                                            ; SET FAST BALL SPIN SPEED  FOR FG AND LOOP
	.DB $FB,$DC,$40,$FB,$10                                      ; SET SCROLL SPEED Y PIXELS/FRM: -13.75,X PIXELS/FRM: 4, Y SPEED INC/FRM: 5 , XSPEED INC/FRM:: 16
LOOP_START[]                                                      ; FG BALL SPIN LOOP
	DO_TILE_DATA[ADDR] SPIN_BALL_ONE_PUNT_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SPIN_BALL_TWO_PUNT_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
LOOP_END[]

_F}_BALL_SPINNING_PUNT_SPRITE_SCRIPT

UNUSED_THREE_SPRITE_SCRIPT:                                       ; 0X22 ? FLAG TILE/BLANK TILES? DOESN'T APPEAR USED
	.DB $F6,$31,$18,$39,$3C                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$10                                                   ; SET SPRITE PALLETE INDEX  TO: 16
	.DB $F8,$2C,$FE                                               ; SET SPRITE STARTING LOCATION= Y: 88, X: 168 OFFSCREEN
	DO_TILE_DATA[ADDR] UNUSED_FOUR_BY_5_BLANK_SPR_TILE_DATA
	.DB $F1,$00,$38                                               ; SET SPRITE BOTTOM OFFSCREEN THRESHOLD TO: 56
	.DB $F1,$01,$70                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 112
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

_F{_FOOT_KICKING_BALL_SPRITE_SCRIPT

FOOT_KICKING_BALL_SPRITE_SCRIPT:                                  ; 0X23 FOOT KICKING BALL
	.DB $F6,$36,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$28,$36                                               ; SET SPRITE STARTING LOCATION= Y: 80, X: 108
	.DB $FB,$00,$10,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] FOOT_KICK_BALL_ONE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] FOOT_KICK_BALL_TWO_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] FOOT_KICK_BALL_THREE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] FOOT_KICK_BALL_FOUR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	.DB $FF                                                       ; END
	
_F}_FOOT_KICKING_BALL_SPRITE_SCRIPT	

_F{_SKY_STADIUM_INTRO_SPRITE_SCRIPT

SKY_STADIUM_INTRO_SPRITE_SCRIPT:                                  ; 0X24 PART OF SKY AND STADIUM +TSB TEXT (VERTICAL SCROLL INTRO)
	.DB $F6,$18,$00,$3E,$3F                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$3C                                                   ; SET SPRITE PALLETE INDEX  TO: 60
	.DB $F8,$8D,$00                                               ; SET SPRITE STARTING LOCATION= Y: -26, X: 0 OFFSCREEN
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	DO_TILE_DATA[ADDR] SKY_STADIUM_INTRO_SPR_TILE_DATA


STADIUM_SCROLL_INTRO_SCRIPT:                                      ; STADIUM SCROLL LOOP
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $3E                                                       ; SCROLL OR WAIT FOR: 124 FRAMES
	.DB $FB,$F0,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $7F                                                       ; SCROLL OR WAIT FOR: 254 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_SKY_STADIUM_INTRO_SPRITE_SCRIPT	

_F{_FLAGS_SCOREBOARD_CHEERLEADERS_PLAYERS_INTRO_SPRITE_SCRIPTS


FLAGS_SCOREBOARD_INTRO_SPRITE_SCRIPT:                             ; 0X25 RIGHT FLAGS AND PART OF SCOREBOARD  (VERTICAL SCROLL INTRO)
	.DB $F6,$18,$00,$3E,$3F                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$3C                                                   ; SET SPRITE PALLETE INDEX  TO: 60
	.DB $F8,$9D,$40                                               ; SET SPRITE STARTING LOCATION= Y: -58, X: 128 OFFSCREEN
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	DO_TILE_DATA[ADDR] FLAGS_SCORE_INTRO_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STADIUM_SCROLL_INTRO_SCRIPT

CHEERLEADERS_PLAYERS_INTRO_SPRITE_SCRIPT:                         ; 0X26 CHEERLEADERS AND PLAYERS (VERTICAL SCROLL INTRO)
	.DB $F6,$18,$00,$3E,$3F                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$3C                                                   ; SET SPRITE PALLETE INDEX  TO: 60
	.DB $F8,$CD,$40                                               ; SET SPRITE STARTING LOCATION= Y: -154, X: 128 OFFSCREEN
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	DO_TILE_DATA[ADDR] CHEER_PLAYER_INTRO_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STADIUM_SCROLL_INTRO_SCRIPT
	
_F}_FLAGS_SCOREBOARD_CHEERLEADERS_PLAYERS_INTRO_SPRITE_SCRIPTS	

_F{_BALL_BLOCKED_TOWARDS_PLAYER_SPRITE_SCRIPT

BALL_BLOCKED_TOWARDS_PLAYER_SPRITE_SCRIPT:                        ; 0X27 BALL BEING BLOCKED TOWARDS PLAYER
	.DB $F6,$2C,$2D,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$36,$6E                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 220
	.DB $FB,$B0,$D0,$D0,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -11,X PIXELS/FRM: -13, Y SPEED INC/FRM: 48 , XSPEED INC/FRM:: 0
	DO_SUBROUTINE[ADDR] LARGE_BALL_SPRITE_SUB
	DO_SUBROUTINE[ADDR] SMALL_BALL_SPRITE_SUB
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_BALL_BLOCKED_TOWARDS_PLAYER_SPRITE_SCRIPT	

_F{_LARGE_AND_SMALL_BALL_SPRITE_SCRIPT_SUB

LARGE_BALL_SPRITE_SUB:                                            ; LARGE BALL SUBROUTINE
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_ONE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_TWO_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_THREE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_FOUR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_FIVE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_SIX_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_SEVEN_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_EIGHT_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN FROM ROUTINE

SMALL_BALL_SPRITE_SUB:                                            ; SMALL BALL BALL SUBROUTINE
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_ONE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_TWO_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_THREE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_FOUR_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_FIVE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_SIX_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_SEVEN_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_EIGHT_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_NINE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN FROM ROUTINE
	
_F}_LARGE_AND_SMALL_BALL_SPRITE_SCRIPT_SUB	

_F{_RUNNING_PLAYER_SPIKE_BALL_AND_HAND_NUMBER_ONE_SPRITE_SCRIPTS

RUNNING_PLAYER_HAND_NUMBER_ONE_SPRITE_SCRIPT:                     ; 0X28 PLAYER RUNNING SPIKE BALL, HAND#1 SIGN IN AIR
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_SPIKE_SPRITE_SUB
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_NUM_ONE_SPRITE_SUB


LOOP_START[]                                                      ; PLAYER RUNNING LOOP
	.DB $FB,$04,$04,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.25,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] PLAYER_NUM_ONE_HAND_ONE_SPR_TILE_DATA
	.DB $05                                                       ; SCROLL OR WAIT FOR: 10 FRAMES
	.DB $FB,$FC,$04,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15.75,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] PLAYER_NUM_ONE_HAND_TWO_SPR_TILE_DATA
	.DB $05                                                       ; SCROLL OR WAIT FOR: 10 FRAMES
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_NUM_ONE_SPRITE_SUB
LOOP_END[]

PLAYER_RUNNING_SPIKE_SPRITE_SUB:                                 ; START PLAYER RUNNING SUBROUTINE
	.DB $F6,$31,$00,$54,$55                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$31,$36                                               ; SET SPRITE STARTING LOCATION= Y: 98, X: 108
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	.DB $FB,$04,$04,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.25,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] PLAYER_RUN_SPIKE_TD_ONE_SPR_TILE_DATA
	.DB $05                                                       ; SCROLL OR WAIT FOR: 10 FRAMES
	.DB $FB,$FC,$04,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15.75,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] PLAYER_RUN_SPIKE_TD_TWO_SPR_TILE_DATA
	.DB $05                                                       ; SCROLL OR WAIT FOR: 10 FRAMES
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN

PLAYER_RUNNING_NUM_ONE_SPRITE_SUB:                                ; PLAYER RUNNING 2 SUBROUTINE
	.DB $FB,$04,$04,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.25,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] PLAYER_RUNNING_AFTER_TD_ONE_SPR_TILE_DATA
	.DB $05                                                       ; SCROLL OR WAIT FOR: 10 FRAMES
	.DB $FB,$FC,$04,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15.75,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] PLAYER_RUNNING_AFTER_TD_TWO_SPR_TILE_DATA
	.DB $05                                                       ; SCROLL OR WAIT FOR: 10 FRAMES
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN

BALL_HIT_GROUND_AFTER_SPIKE_SPRITE_SCRIPT:                        ; 0X29 BALL BOUNCING UP FROM GROUND
	.DB $F6,$31,$00,$54,$55                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$32,$40                                               ; SET SPRITE STARTING LOCATION= Y: 100, X: 128
	.DB $05                                                       ; SCROLL OR WAIT FOR: 10 FRAMES
	.DB $FB,$40,$E0,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 4,X PIXELS/FRM: -14, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_SUBROUTINE[ADDR] BALL_HIT_GROUND_SPIKE_SPRITE_SUB
	.DB $F8,$30,$C0                                               ; SET SPRITE STARTING LOCATION= Y: 96, X: 160 OFFSCREEN
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	.DB $FB,$C0,$E8,$E0,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -12,X PIXELS/FRM: -14, Y SPEED INC/FRM: 32 , XSPEED INC/FRM:: 0
	.DB $F8,$3E,$26                                               ; SET SPRITE STARTING LOCATION= Y: 124, X: 76
	.DB $EB                                                       ; SET NUMBER OF TIMES TO LOOP = 11
	DO_SUBROUTINE[ADDR] BALL_HIT_GROUND_SPIKE_SPRITE_SUB
	.DB $F7                                                       ; LOOP TIMER--
	.DB $FF                                                       ; END

BALL_HIT_GROUND_SPIKE_SPRITE_SUB:                                 ; DRAW BALL FOR BALL HIT GROUND SUBROUTINE
	DO_TILE_DATA[ADDR] BALL_HIT_GROUND_SPIKE_ONE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] BALL_HIT_GROUND_SPIKE_TWO_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] BALL_HIT_GROUND_SPIKE_THREE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_RUNNING_PLAYER_SPIKE_BALL_AND_HAND_NUMBER_ONE_SPRITE_SCRIPTS	

_F{_DEFENDER_TACKLE_BARRY_SPRITE_SCRIPT

DEFENDER_TACKLE_BARRY_SPRITE_SCRIPT:                              ; 0X2A BACK OF DEFENDER TRYING TO TACKLE BARRY INTRO
	.DB $F6,$48,$49,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$3B                                                   ; SET SPRITE PALLETE INDEX  TO: 59
	.DB $F8,$2C,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 88, X: 116
	DO_TILE_DATA[ADDR] BACK_OF_DEF_TACKLING_BARRY_SPR_TILE_DATA
	.DB $FB,$00,$F0,$00,$FC                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -15, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 4
	.DB $14                                                       ; SCROLL OR WAIT FOR: 40 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_DEFENDER_TACKLE_BARRY_SPRITE_SCRIPT	

_F{_KICKING_CHEER_SPRITE_SCRIPTS

KICKING_CHEER_LEFT_SPRITE_SCRIPT:                                 ; 0X2B KICKING CHEERLEADER STARTING FAR LEFT
	.DB $F6,$64,$65,$52,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$33                                                   ; SET SPRITE PALLETE INDEX  TO: 51
	.DB $F8,$22,$1E                                               ; SET SPRITE STARTING LOCATION= Y: 68, X: 60



																; CHEERLEADER SANIMATION
	.DB $FB,$00,$02,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
KICK_CHEER_LOOP:
LOOP_START[]
	DO_TILE_DATA[ADDR] KICKING_CHEER_ONE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_TWO_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_THREE_SPR_TILE_DATA
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_TWO_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_ONE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_FOUR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_FIVE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_SIX_SPR_TILE_DATA
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_FIVE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] KICKING_CHEER_FOUR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
LOOP_END[]

KICKING_CHEER_MIDDLE_SPRITE_SCRIPT:                               ; 0X2C KICKING CHEERLEADER STARTING MIDDLE
	.DB $F6,$64,$65,$52,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$33                                                   ; SET SPRITE PALLETE INDEX  TO: 51
	.DB $F8,$22,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 68, X: 124
	.DB $FB,$00,$02,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	JUMP_SPRITE_SCRIPT[ADDR] KICK_CHEER_LOOP
	
_F}_KICKING_CHEER_SPRITE_SCRIPTS	

_F{_FACES_DIV_CHAMP_SPRITE_SCRIPTS

FACES_SCREEN_ONE_DIV_CHAMP_SPRITE_SCRIPT:                         ; 0X2D PLAYER FACES IN HELMETS  DIVISION CHAMP OFFSCREEN
	.DB $F6,$50,$00,$52,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$32                                                   ; SET SPRITE PALLETE INDEX  TO: 50
	.DB $F8,$2C,$C8                                               ; SET SPRITE STARTING LOCATION= Y: 88, X: 168 OFFSCREEN
	DO_TILE_DATA[ADDR] OFFSCREEN_DIV_CHAMP_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] FLIP_SCROLL_DIR_AND_SCROLL_FOREVER_SCRIPT

FACES_SCREEN_TWO_DIV_CHAMP_SPRITE_SCRIPT:                         ; 0X2E PLAYER FACES IN HELMETS  DIVISION CHAMP ONSCREEN
	.DB $F6,$50,$00,$52,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$32                                                   ; SET SPRITE PALLETE INDEX  TO: 50
	.DB $F8,$2C,$48                                               ; SET SPRITE STARTING LOCATION= Y: 88, X: 144
	DO_TILE_DATA[ADDR] ONSCREEN_DIV_CHAMP_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] FLIP_SCROLL_DIR_AND_SCROLL_FOREVER_SCRIPT

_F}_FACES_DIV_CHAMP_SPRITE_SCRIPTS	

_F{_BALL_SPINNING_LEADING_PUNTERS_SPRITE_SCRIPT	

BALL_SPINNING_LEADING_PUNTERS_SPRITE_SCRIPT:                      ; 0X2F
	.DB $F6,$31,$00,$00,$3C                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$29                                                   ; SET SPRITE PALLETE INDEX  TO: 41
	.DB $F8,$4C,$EA                                               ; SET SPRITE STARTING LOCATION= Y: 152, X: 104 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] BALL_FOR_PUNT_SPR_TILE_DATA
	.DB $FB,$00,$70,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 7, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0D                                                       ; SCROLL OR WAIT FOR: 26 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_BALL_SPINNING_LEADING_PUNTERS_SPRITE_SCRIPT		

_F{_PLAYER_JUMPING_HOLDING_HAND_IN_AIR_TD_SPRITE_SCRIPT

PLAYER_JUMPING_TD_SPRITE_SCRIPT:                                  ; 0X30 PLAYER JUMPING HOLDING HAND IN AIR
	.DB $F6,$31,$00,$4C,$4D                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$2E,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 92, X: 124
	.DB $FB,$D0,$00,$DC,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -13,X PIXELS/FRM: 0, Y SPEED INC/FRM: 36 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] JUMPING_HAND_IN_AIR_AFTER_TD_ONE_SPR_TILE_DATA
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] JUMPING_HAND_IN_AIR_AFTER_TD_TWO_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_PLAYER_JUMPING_HOLDING_HAND_IN_AIR_TD_SPRITE_SCRIPT	


_F{_LARGE_HELMET_1_SPRITE_SCRIPTS
																; ******** HELMET LOGOS ********

NY_JETS_LH_LOGO_SPRITE_SCRIPT:                                    ; 0X31 NY_JETS_LH_LOGO
	.DB $F6,$70,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$06                                                   ; SET SPRITE PALLETE INDEX  TO: 6
	.DB $F8,$3A,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 116, X: 116
	DO_TILE_DATA[ADDR] NYJ_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

CIN_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X32 CIN_LH_LOGO
	.DB $F6,$70,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$07                                                   ; SET SPRITE PALLETE INDEX  TO: 7
	.DB $F8,$32,$42                                               ; SET SPRITE STARTING LOCATION= Y: 100, X: 132
	DO_TILE_DATA[ADDR] CIN_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

CLE_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X33 CLE_LH_LOGO
	.DB $F6,$70,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$08                                                   ; SET SPRITE PALLETE INDEX  TO: 8
	.DB $F8,$36,$42                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 132
	DO_TILE_DATA[ADDR] CLE_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

HOU_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X34 HOU_LH_LOGO
	.DB $F6,$70,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$09                                                   ; SET SPRITE PALLETE INDEX  TO: 9
	.DB $F8,$37,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 110, X: 116
	DO_TILE_DATA[ADDR] HOU_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

PIT_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X35 PIT_LH_LOGO
	.DB $F6,$71,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$0A                                                   ; SET SPRITE PALLETE INDEX  TO: 10
	.DB $F8,$36,$3B                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 118
	DO_TILE_DATA[ADDR] PIT_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

DEN_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X36 DEN_LH_LOGO
	.DB $F6,$71,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$0B                                                   ; SET SPRITE PALLETE INDEX  TO: 11
	.DB $F8,$36,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 116
	DO_TILE_DATA[ADDR] DEN_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

KC_LH_LOGO_SPRITE_SCRIPT:                                         ; 0X37 KC_LH_LOGO
	.DB $F6,$71,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$0C                                                   ; SET SPRITE PALLETE INDEX  TO: 12
	.DB $F8,$36,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 116
	DO_TILE_DATA[ADDR] KC_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT

_F}_LARGE_HELMET_SPRITE_SCRIPTS

_F{_CARRY_INJURED_PLAYER_SPRITE_SCRIPT

CARRY_INJURED_PLAYER_SPRITE_SCRIPT:                               ; 0X38 CARRYING INJURED PLAYER
	.DB $F6,$31,$00,$50,$53                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$30,$46                                               ; SET SPRITE STARTING LOCATION= Y: 96, X: 140
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	DO_TILE_DATA[ADDR] CARRY_INJURED_PLAYER_SPR_TILE_DATA



LOOP_START[]                                                      ; INJURED PLAYER SCROLL LOOP
	.DB $FB,$01,$FA,$00,$00                                      ; SET SCROLL SPEED Y PIXELS/FRM: 0625,X PIXELS/FRM: -15, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $14                                                       ; SCROLL OR WAIT FOR: 40 FRAMES
	.DB $FB,$FF,$02,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15.9375,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $14                                                       ; SCROLL OR WAIT FOR: 40 FRAMES
LOOP_END[]

_F}_CARRY_INJURED_PLAYER_SPRITE_SCRIPT

_F{_BALL_LEFT_TO_RIGHT_SHRINKING_SIZE_SPRITE_SCRIPT

BALL_LEFT_TO_RIGHT_SHRINKING_SIZE_SPRITE_SCRIPT:                  ; 0X39 FOOTBALL LEFT TO RIGHT LARGE TO SMALL
	.DB $F6,$2C,$2D,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$36,$06                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 12
	.DB $FB,$B0,$30,$D0,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -11,X PIXELS/FRM: 3, Y SPEED INC/FRM: 48 , XSPEED INC/FRM:: 0
	.DB $F9                                                       ; SWITCH CUTSCENE SIDE
	DO_SUBROUTINE[ADDR] LARGE_BALL_SPRITE_SUB
	DO_SUBROUTINE[ADDR] SMALL_BALL_SPRITE_SUB
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_BALL_LEFT_TO_RIGHT_SHRINKING_SIZE_SPRITE_SCRIPT	

_F{_LARGE_HELMET_2_SPRITE_SCRIPTS

SEA_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X3A SEA_LH_LOGO
	.DB $F6,$72,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$0F                                                   ; SET SPRITE PALLETE INDEX  TO: 15
	.DB $F8,$3B,$36                                               ; SET SPRITE STARTING LOCATION= Y: 118, X: 108
	DO_TILE_DATA[ADDR] SEA_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

DAL_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X3B DALLAS_LH_LOGO
	.DB $F6,$72,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$10                                                   ; SET SPRITE PALLETE INDEX  TO: 16
	.DB $F8,$36,$38                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 112
	DO_TILE_DATA[ADDR] DAL_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

NYG_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X3C NYG_LH_LOGO
	.DB $F6,$72,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$11                                                   ; SET SPRITE PALLETE INDEX  TO: 17
	.DB $F8,$38,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 112, X: 116
	DO_TILE_DATA[ADDR] NYG_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

IND_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X3D INDY_LH_LOGO
	.DB $F6,$70,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$02                                                   ; SET SPRITE PALLETE INDEX  TO: 2
	.DB $F8,$36,$39                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 114
	DO_TILE_DATA[ADDR] IND_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

BUF_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X3E BUF_LH_LOGO
	.DB $F6,$70,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$03                                                   ; SET SPRITE PALLETE INDEX  TO: 3
	.DB $F8,$36,$39                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 114
	DO_TILE_DATA[ADDR] BUF_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

MIA_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X3F MIA_LH_LOGO
	.DB $F6,$70,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$04                                                   ; SET SPRITE PALLETE INDEX  TO: 4
	.DB $F8,$36,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 116
	DO_TILE_DATA[ADDR] MIA_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

NE_LH_LOGO_SPRITE_SCRIPT:                                         ; 0X40 NE_LH_LOGO
	.DB $F6,$70,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$05                                                   ; SET SPRITE PALLETE INDEX  TO: 5
	.DB $F8,$37,$39                                               ; SET SPRITE STARTING LOCATION= Y: 110, X: 114
	DO_TILE_DATA[ADDR] NE_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

OAK_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X41 OAK_LH_LOGO
	.DB $F6,$71,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$0D                                                   ; SET SPRITE PALLETE INDEX  TO: 13
	.DB $F8,$36,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 116
	DO_TILE_DATA[ADDR] OAK_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

SD_LH_LOGO_SPRITE_SCRIPT:                                         ; 0X42 SD LH_LOGO
	.DB $F6,$72,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$0E                                                   ; SET SPRITE PALLETE INDEX  TO: 14
	.DB $F8,$32,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 100, X: 124
	DO_TILE_DATA[ADDR] SD_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

PHI_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X43 PHI LH_LOGO
	.DB $F6,$72,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$12                                                   ; SET SPRITE PALLETE INDEX  TO: 18
	.DB $F8,$34,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 104, X: 124
	DO_TILE_DATA[ADDR] PHI_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

PHX_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X44 PHX LH_LOGO
	.DB $F6,$72,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$13                                                   ; SET SPRITE PALLETE INDEX  TO: 19
	.DB $F8,$37,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 110, X: 116
	DO_TILE_DATA[ADDR] PHX_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

WAS_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X45 WAS LH_LOGO
	.DB $F6,$71,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$14                                                   ; SET SPRITE PALLETE INDEX  TO: 20
	.DB $F8,$36,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 116
	DO_TILE_DATA[ADDR] WAS_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

CHI_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X46 CHI LH_LOGO
	.DB $F6,$71,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$15                                                   ; SET SPRITE PALLETE INDEX  TO: 21
	.DB $F8,$37,$3C                                               ; SET SPRITE STARTING LOCATION= Y: 110, X: 120
	DO_TILE_DATA[ADDR] CHI_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

DET_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X47 DET LH_LOGO
	.DB $F6,$73,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$16                                                   ; SET SPRITE PALLETE INDEX  TO: 22
	.DB $F8,$37,$38                                               ; SET SPRITE STARTING LOCATION= Y: 110, X: 112
	DO_TILE_DATA[ADDR] DET_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

GB_LH_LOGO_SPRITE_SCRIPT:                                         ; 0X48 GB LH_LOGO
	.DB $F6,$74,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$17                                                   ; SET SPRITE PALLETE INDEX  TO: 23
	.DB $F8,$36,$3C                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 120
	DO_TILE_DATA[ADDR] GB_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

MIN_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X49 MIN LH_LOGO
	.DB $F6,$74,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$18                                                   ; SET SPRITE PALLETE INDEX  TO: 24
	.DB $F8,$3A,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 116, X: 116
	DO_TILE_DATA[ADDR] MIN_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

TB_LH_LOGO_SPRITE_SCRIPT:                                         ; 0X4A TB LH_LOGO
	.DB $F6,$73,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$19                                                   ; SET SPRITE PALLETE INDEX  TO: 25
	.DB $F8,$35,$36                                               ; SET SPRITE STARTING LOCATION= Y: 106, X: 108
	DO_TILE_DATA[ADDR] TB_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

ATL_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X4B ATL LH_LOGO
	.DB $F6,$74,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$1A                                                   ; SET SPRITE PALLETE INDEX  TO: 26
	.DB $F8,$35,$3C                                               ; SET SPRITE STARTING LOCATION= Y: 106, X: 120
	DO_TILE_DATA[ADDR] ATL_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

RAM_LH_LOGO_SPRITE_SCRIPT:                                        ; 0X4C RAM LH_LOGO
	.DB $F6,$71,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$1B                                                   ; SET SPRITE PALLETE INDEX  TO: 27
	.DB $F8,$32,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 100, X: 116
	DO_TILE_DATA[ADDR] RAM_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT

NO_LH_LOGO_SPRITE_SCRIPT:                                         ; 0X4D NO LH_LOGO
	.DB $F6,$73,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$1C                                                   ; SET SPRITE PALLETE INDEX  TO: 28
	.DB $F8,$36,$3B                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 118
	DO_TILE_DATA[ADDR] NO_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

SF_LH_LOGO_SPRITE_SCRIPT:                                         ; 0X4E SF LH_LOGO
	.DB $F6,$73,$FF,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$1D                                                   ; SET SPRITE PALLETE INDEX  TO: 29
	.DB $F8,$35,$3B                                               ; SET SPRITE STARTING LOCATION= Y: 106, X: 118
	DO_TILE_DATA[ADDR] SF_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

LH_FACEMASK_SPRITE_SCRIPT:                                        ; 0X4F FACEMASK
	.DB $F6,$FF,$73,$FF,$FF                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$02                                                   ; SET SPRITE PALLETE INDEX  TO: 2
	.DB $F8,$42,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 132, X: 124
	DO_TILE_DATA[ADDR] FACEMASK_LH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT

_F}_LARGE_HELMET_2_SPRITE_SCRIPTS

_F{_LINEMAN_INTRO_SPRITE_SCRIPTS

LINEMAN_INTRO_ONE_SPRITE_SCRIPT:                                  ; 0X50 3PT LINEMAN SNAP 1 INTRO
	.DB $F6,$43,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$1E                                                   ; SET SPRITE PALLETE INDEX  TO: 30
	.DB $F8,$38,$33                                               ; SET SPRITE STARTING LOCATION= Y: 112, X: 102
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LINEMAN_INTRO_ONE_SPR_TILE_DATA
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $23                                                       ; SCROLL OR WAIT FOR: 70 FRAMES
	.DB $FB,$00,$10,$00,$02                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 2
	.DB $05                                                       ; SCROLL OR WAIT FOR: 10 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

LINEMAN_INTRO_TWO_SPRITE_SCRIPT:                                  ; 0X51 3PT LINEMAN SNAP 2 INTRO
	.DB $F6,$43,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$1E                                                   ; SET SPRITE PALLETE INDEX  TO: 30
	.DB $F8,$34,$30                                               ; SET SPRITE STARTING LOCATION= Y: 104, X: 96
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LINEMAN_INTRO_TWO_SPR_TILE_DATA
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $1E                                                       ; SCROLL OR WAIT FOR: 60 FRAMES
	.DB $FB,$00,$12,$00,$03                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 3
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

LINEMAN_INTRO_THREE_SPRITE_SCRIPT:                                ; 0X52 3PT LINEMAN SNAP 3 INTRO
	.DB $F6,$43,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$1E                                                   ; SET SPRITE PALLETE INDEX  TO: 30
	.DB $F8,$38,$32                                               ; SET SPRITE STARTING LOCATION= Y: 112, X: 100
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LINEMAN_INTRO_THREE_SPR_TILE_DATA
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $19                                                       ; SCROLL OR WAIT FOR: 50 FRAMES
	.DB $FB,$00,$14,$00,$04                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 4
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT

_F}_LINEMAN_INTRO_SPRITE_SCRIPTS                                  ;

_F{_BIG_BALL_FOR_FG_SPRITE_SCRIPT

BIG_BALL_FOR_FG_SPRITE_SCRIPT:                                    ; 0X53 BIG BALL FOR FG KICK
	.DB $F6,$36,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$26,$26                                               ; SET SPRITE STARTING LOCATION= Y: 76, X: 76
	.DB $FB,$10,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 1,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] FOOT_KICK_BALL_THREE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	.DB $FF                                                       ; END
	
_F}_BIG_BALL_FOR_FG_SPRITE_SCRIPT

_F{_BALL_LEADING_SCORERS_SPRITE_SCRIPT

BALL_LEADING_SCORERS_SPRITE_SCRIPT:                               ; 0X54 FOOTBALL FOR LEADING SCORERS
	.DB $F6,$3E,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$28                                                   ; SET SPRITE PALLETE INDEX  TO: 40
	.DB $F8,$3A,$42                                               ; SET SPRITE STARTING LOCATION= Y: 116, X: 132
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	.DB $FB,$E8,$20,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -14.5,X PIXELS/FRM: 2, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $E7                                                       ; SET NUMBER OF TIMES TO LOOP = 7
	DO_TILE_DATA[ADDR] SPIN_BALL_ONE_PUNT_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SPIN_BALL_TWO_PUNT_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $F7                                                       ; LOOP TIMER--
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_BALL_LEADING_SCORERS_SPRITE_SCRIPT	

_F{_LT_OVER_PLAYER_SPRITE_SCRIPTS

LT_OVER_PLAYER_ONE_SPRITE_SCRIPT:                                 ; 0X55 LT STANDING OVER PLAYER 3 (INTRO)
	.DB $F6,$31,$47,$46,$45                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$21                                                   ; SET SPRITE PALLETE INDEX  TO: 33
	.DB $F8,$2A,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 84, X: 124
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	DO_TILE_DATA[ADDR] LT_OVER_PLAYER_ONE_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

LT_OVER_PLAYER_TWO_SPRITE_SCRIPT:                                 ; 0X56 LT STANDING OVER PLAYER FILL MATERIAL (INTRO)
	.DB $F6,$31,$47,$46,$45                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$21                                                   ; SET SPRITE PALLETE INDEX  TO: 33
	.DB $F8,$3A,$40                                               ; SET SPRITE STARTING LOCATION= Y: 116, X: 128
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	DO_TILE_DATA[ADDR] LT_OVER_PLAYER_TWO_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_LT_OVER_PLAYER_SPRITE_SCRIPTS	

_F{_BALL_INTERCEPTION_LEADERS_SPRITE_SCRIPT

BALL_INTERCEPTION_LEADERS_SPRITE_SCRIPT:                          ; 0X57 BALL FROM OFFSCREEN TO MIDDLE INTERCEPTION LEADERS
	.DB $F6,$32,$57,$00,$33                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$2A                                                   ; SET SPRITE PALLETE INDEX  TO: 42
	.DB $F8,$1A,$D2                                               ; SET SPRITE STARTING LOCATION= Y: 52, X: 204 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] INT_LEADERS_BALL_SPR_TILE_DATA
	.DB $FB,$04,$70,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.25,X PIXELS/FRM: 7, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0D                                                       ; SCROLL OR WAIT FOR: 26 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_BALL_INTERCEPTION_LEADERS_SPRITE_SCRIPT	

_F{_KICKOFF_ARM_P2_SPRITE_SCRIPT

KICKOFF_ARM_P2_SPRITE_SCRIPT:                                     ; 0X58 KICKOFF ARM IN AIR P2
	.DB $F6,$31,$00,$00,$2E                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$30,$46                                               ; SET SPRITE STARTING LOCATION= Y: 96, X: 140

KICKOFF_SCROLL_SPRITE_SCRIPT                                      ; KICK OFF SCROLL START
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	DO_TILE_DATA[ADDR] KICKOFF_ARM_SPR_TILE_DATA

.DB $FB,$00,$00,$00,$00                                        ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $04                                                       ; SCROLL OR WAIT FOR: 8 FRAMES
	.DB $FB,$F0,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $04                                                       ; SCROLL OR WAIT FOR: 8 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_KICKOFF_ARM_P2_SPRITE_SCRIPT	

_F{_SPIKE_BALL_AND_HUG_RUSHING_TD_SPRITE_SCRIPT


SPIKE_BALL_TD_SPRITE_SCRIPT:                                      ; 0X59 PLAYER COMING UP TO SPIKE BALL TD
	.DB $F6,$31,$3D,$4B,$33                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$59,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 178, X: 124
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	DO_TILE_DATA[ADDR] PLAYER_COMING_UP_TO_SPIKE_SPR_TILE_DATA
	.DB $08                                                       ; SCROLL OR WAIT FOR: 16 FRAMES
	.DB $FB,$EA,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -14.625,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $23                                                       ; SCROLL OR WAIT FOR: 70 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

HUG_JUMPIMG_PLAYER_TD_SPRITE_SCRIPT:                              ; 0X5A HOLDING JUMPING PLAYER RUSHING TD ANIMATION
	.DB $F6,$31,$00,$4C,$4D                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$2E,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 92, X: 124
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	.DB $FB,$08,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.5,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] HUG_JUMPING_PLAYER_ONE_SPR_TILE_DATA
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	DO_TILE_DATA[ADDR] HUG_JUMPING_PLAYER_TWO_SPR_TILE_DATA
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	DO_TILE_DATA[ADDR] HUG_JUMPING_PLAYER_THREE_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT
	
_F}_SPIKE_BALL_AND_HUG_RUSHING_TD_SPRITE_SCRIPT	

_F{_BALL_MID_TO_UPPER_RIGHT_SPRITE_SCRIPT

BALL_MID_TO_UPPER_RIGHT_SPRITE_SCRIPT:                            ; 0X5B BALL MIDDLE TO UPPER RIGHT
	.DB $F6,$3E,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$32,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 100, X: 116
	JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_PUNT_SCRIPT

_F}_BALL_MID_TO_UPPER_RIGHT_SPRITE_SCRIPT	

_F{_BALL_TOWARDS_FG_POSTS_PLAYER_PERS_SPRITE_SCRIPT

BALL_TOWARDS_FG_POSTS_PLAYER_PERS_SPRITE_SCRIPT:                  ; 0X5C BALL TOWARDS FG PLAYER PERSPECTIVE
	.DB $F6,$2C,$2D,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$62,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 196, X: 116
	.DB $FB,$88,$E8,$D8,$F2                                       ; SET SCROLL SPEED Y PIXELS/FRM: -8.5,X PIXELS/FRM: -14, Y SPEED INC/FRM: 40 , XSPEED INC/FRM:: 14
	DO_SUBROUTINE[ADDR] LARGE_BALL_SPRITE_SUB
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_ONE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_TWO_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_THREE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_FOUR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_FIVE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_SIX_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_SEVEN_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_EIGHT_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_NINE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

_F}_BALL_TOWARDS_FG_POSTS_PLAYER_PERS_SPRITE_SCRIPT

_F{_BOTH_PLAYERS_JUMP_SPRITE_SCRIPT

BOTH_PLAYERS_JUMP_SPRITE_SCRIPT:                                  ; 0X5D DOUBLE JUMP
	.DB $F6,$31,$57,$32,$33                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$3E,$36                                               ; SET SPRITE STARTING LOCATION= Y: 124, X: 108
	.DB $F1,$01,$80                                               ; SET SPRITE TOP OFFSCREEN THRESHOLD TO: 128
	DO_TILE_DATA[ADDR] JUMP_PLYER_SPR_TILE_DATA
	.DB $FB,$88,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -8.5,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0A                                                       ; SCROLL OR WAIT FOR: 20 FRAMES
	.DB $F8,$5A,$56                                               ; SET SPRITE STARTING LOCATION= Y: 180, X: 172
	DO_TILE_DATA[ADDR] JUMPING_PLAYER_STILL_SPR_TILE_DATA
	.DB $FB,$90,$E0,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -9,X PIXELS/FRM: -14, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	.DB $FF                                                       ; END
	
_F}_BOTH_PLAYERS_JUMP_SPRITE_SCRIPT	

_F{_PLAYER_TRYING_TO_CATCH_SPRITE_SCRIPT

PLAYER_TRYING_TO_CATCH_SPRITE_SCRIPT:                             ; 0X5E PLAYER TRYING TO CATCH LEGS OUT BACK TO SIDE OF SCREEN
	.DB $F6,$36,$37,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$22,$36                                               ; SET SPRITE STARTING LOCATION= Y: 68, X: 108
	DO_TILE_DATA[ADDR] PLAYER_ATTEMPT_CATCH_SPR_TILE_DATA
	.DB $FB,$08,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.5,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] END_OF_CATCHES_SPRITE_SCRIPT
	
_F}_PLAYER_TRYING_TO_CATCH_SPRITE_SCRIPT	

_F{_MOVING_HAND_LEFT_TO_RIGHT_SPRITE_SCRIPT

MOVING_HAND_LEFT_TO_RIGHT_SPRITE_SCRIPT:                          ; 0X5F MOVING HAND FOR CATCH LEFT TO RIGHT OPEN
	.DB $F6,$39,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$30,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 96, X: 116
	DO_TILE_DATA[ADDR] HAND_ATTEMPT_TO_CATCH_SPR_TILE_DATA

END_OF_MOVING_HAND_SCRIPT:
	.DB $FB,$00,$10,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 1, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $19                                                       ; SCROLL OR WAIT FOR: 50 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_MOVING_HAND_LEFT_TO_RIGHT_SPRITE_SCRIPT	

_F{_BALL_HIT_GROUND_BIG_TO_SMALL_SPRITE_SCRIPT

BALL_HIT_GROUND_SPRITE_SCRIPT:                                    ; 0X60 BALL HIT GROUND BIG TO SMALL VERTICAL
	.DB $F6,$2C,$2D,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$2E,$36                                               ; SET SPRITE STARTING LOCATION= Y: 92, X: 108
	.DB $FB,$40,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 4,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_SEVEN_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] LARGE_BALL_FG_EIGHT_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	.DB $FB,$D0,$10,$E0,$FC                                       ; SET SCROLL SPEED Y PIXELS/FRM: -13,X PIXELS/FRM: 1, Y SPEED INC/FRM: 32 , XSPEED INC/FRM:: 4
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_ONE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_TWO_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_THREE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_FOUR_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_FIVE_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_SIX_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_SEVEN_SPR_TILE_DATA
	.DB $02                                                       ; SCROLL OR WAIT FOR: 4 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_EIGHT_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	DO_TILE_DATA[ADDR] SMALL_BALL_SPIN_NINE_SPR_TILE_DATA
	.DB $01                                                       ; SCROLL OR WAIT FOR: 2 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_BALL_HIT_GROUND_BIG_TO_SMALL_SPRITE_SCRIPT	

_F{_DUMMY_TILES_HIDE_GLITCHES_LT_SPRITE_SCRIPT

DUMMY_TILES_HIDE_GLITCHES_LT_SPRITE_SCRIPT:                       ; 0X61 8 BLANK TILES TO HIDE SCANLINE GLITCHES LT SACK (INTRO)
	.DB $FC,$21                                                   ; SET SPRITE PALLETE INDEX  TO: 33
	.DB $F8,$28,$00                                               ; SET SPRITE STARTING LOCATION= Y: 80, X: 0
	.DB $F1,$00,$50                                               ; SET SPRITE BOTTOM OFFSCREEN THRESHOLD TO: 80
	.DB $F5                                                       ; SET SPRITE SIZE = 8X16
	DO_TILE_DATA[ADDR] BLANK_TILES_HIDE_GLITCHES_SPR_TILE_DATA
	.DB $FD                                                       ; START SCROLLING AND FLIP SCROLL DIRECTION
	.DB $1B                                                       ; SCROLL OR WAIT FOR: 54 FRAMES
	.DB $F1,$00,$40                                               ; SET SPRITE BOTTOM OFFSCREEN THRESHOLD TO: 64
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	.DB $F1,$00,$30                                               ; SET SPRITE BOTTOM OFFSCREEN THRESHOLD TO: 48
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	.DB $F1,$00,$20                                               ; SET SPRITE BOTTOM OFFSCREEN THRESHOLD TO: 32
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	.DB $F1,$00,$10                                               ; SET SPRITE BOTTOM OFFSCREEN THRESHOLD TO: 16
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] SCROLL_FOREVER_SCRIPT
	
_F}_DUMMY_TILES_HIDE_GLITCHES_LT_SPRITE_SCRIPT	

_F{_DIVING_DROP_SPRITE_SCRIPT

DIVING_DROP_SPRITE_SCRIPT:                                       ; 0X62 PLAYER DIVING FOR BALL CATCH
	.DB $F6,$3A,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$22,$36                                               ; SET SPRITE STARTING LOCATION= Y: 68, X: 108
	DO_TILE_DATA[ADDR] PLAYER_DIVING_BALL_SPR_TILE_DATA
	.DB $FB,$08,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.5,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $07                                                       ; SCROLL OR WAIT FOR: 14 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] END_OF_CATCHES_SPRITE_SCRIPT
	
_F}_DIVING_DROP_SPRITE_SCRIPT	

_F{_BALL_FOR_DIVE_LEFT_TO_RIGHT_SPRITE_SCRIPT

BALL_FOR_DIVE_LEFT_TO_RIGHT_SPRITE_SCRIPT:                        ; 0X63 BALL ANIMATION DIVE TOP LEFT TO UPPER RIGHT
	.DB $F6,$3A,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$16,$2A                                               ; SET SPRITE STARTING LOCATION= Y: 44, X: 84
	DO_TILE_DATA[ADDR] LARGE_BALL_DIVE_SPR_TILE_DATA
	.DB $FB,$16,$60,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 1.375,X PIXELS/FRM: 6, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	.DB $FF                                                       ; END
	
_F}_BALL_FOR_DIVE_LEFT_TO_RIGHT_SPRITE_SCRIPT	

_F{_DIVING_MISS_SPRITE_SCRIPT

DIVING_MISS_SPRITE_SCRIPT:                                        ; 0X64 PLAYER DIVING FOR BALL MISS
	.DB $F6,$3A,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$22,$36                                               ; SET SPRITE STARTING LOCATION= Y: 68, X: 108
	DO_TILE_DATA[ADDR] PLAYER_DIVING_BALL_SPR_TILE_DATA
	.DB $FB,$04,$20,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.25,X PIXELS/FRM: 2, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_DIVING_MISS_SPRITE_SCRIPT	

_F{_BIG_BALL_LEFT_TO_RIGHT_SPRITE_SCRIPT

BIG_BALL_LEFT_TO_RIGHT_SPRITE_SCRIPT:                             ; 0X65 BIG BALL LEFT TO RIGHT
	.DB $F6,$39,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$1A,$FE                                               ; SET SPRITE STARTING LOCATION= Y: 52, X: 204 OFFSCREEN
	DO_TILE_DATA[ADDR] BIG_BALL_INT_TIP_NORMAL_SPR_TILE_DATA
	.DB $FB,$08,$60,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.5,X PIXELS/FRM: 6, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $19                                                       ; SCROLL OR WAIT FOR: 50 FRAMES
	.DB $FF                                                       ; END

_F}_BIG_BALL_LEFT_TO_RIGHT_SPRITE_SCRIPT	

_F{_OPEN_HAND_CATCH_SPRITE_SCRIPT

OPEN_HAND_CATCH_SPRITE_SCRIPT:                                    ; 0X66 OPEN HAND FOR CATCH
	.DB $F6,$39,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$30,$3A                                               ; SET SPRITE STARTING LOCATION= Y: 96, X: 116
	DO_TILE_DATA[ADDR] OPEN_HAND_FOR_CATCH_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] END_OF_MOVING_HAND_SCRIPT
	
_F}_OPEN_HAND_CATCH_SPRITE_SCRIPT	

_F{_PLAYER_JUMPING_CATCH_STILL_SPRITE_SCRIPT

PLAYER_JUMPING_CATCH_STILL_SPRITE_SCRIPT:                         ; 0X67 PLAYER JUMPING FOR CATCH NO ANIMATION
	.DB $F6,$31,$57,$32,$33                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$2E,$3E                                               ; SET SPRITE STARTING LOCATION= Y: 92, X: 124
	DO_TILE_DATA[ADDR] JUMPING_PLAYER_STILL_SPR_TILE_DATA
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;
	
_F}_PLAYER_JUMPING_CATCH_STILL_SPRITE_SCRIPT	

_F{_LEADERS_SPRITE_SCRIPTS


BALL_REC_LEADERS_SPRITE_SCRIPT:                                   ; 0X68 BALL SPRITE FOR NFL LEADING RECEIVERS
	.DB $F6,$36,$37,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$26                                                   ; SET SPRITE PALLETE INDEX  TO: 38
	.DB $F8,$1C,$F8                                               ; SET SPRITE STARTING LOCATION= Y: 56, X: 200 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] BALL_COMING_FROM_OFFSCREEN_SPR_TILE_DATA
	.DB $FB,$20,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 2,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0D                                                       ; SCROLL OR WAIT FOR: 26 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

QB_THROWING_PASS_LEADERS_SPRITE_SCRIPT:                           ; 0X69 QB THROWING FOR NFL LEADING PASSERS
	.DB $F6,$38,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$26                                                   ; SET SPRITE PALLETE INDEX  TO: 38
	.DB $F8,$64,$93                                               ; SET SPRITE STARTING LOCATION= Y: 200, X: 56 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] QB_THROWING_SPR_TILE_DATA

LEADERS_SCROLL_IN_FROM_OFFSCREEN_SCRIPT:                          ;SCROLL IN X FROM OFFSCREEN LOOP
	.DB $FB,$00,$90,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -9, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0D                                                       ; SCROLL OR WAIT FOR: 26 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

PLAYER_CATCHING_SILL_REC_LEADERS_SPRITE_SCRIPT:                   ; 0X6A PLAYER CATCHING FOR LEADING RECEIVERS
	.DB $F6,$36,$37,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$26                                                   ; SET SPRITE PALLETE INDEX  TO: 38
	.DB $F8,$40,$9B                                               ; SET SPRITE STARTING LOCATION= Y: 128, X: 128 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LEADING_WR_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] LEADERS_SCROLL_IN_FROM_OFFSCREEN_SCRIPT

KICKER_SILL_SCORE_LEADERS_SPRITE_SCRIPT:                          ; 0X6B KICKER FOR LEADING SCORERS
	.DB $F6,$3E,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$28                                                   ; SET SPRITE PALLETE INDEX  TO: 40
	.DB $F8,$36,$36                                               ; SET SPRITE STARTING LOCATION= Y: 108, X: 108
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LEADING_SCORES_SPR_TILE_DATA
	.DB $FB,$00,$E8,$00,$08                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: -14, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 8
	.DB $0E                                                       ; SCROLL OR WAIT FOR: 28 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

PUNTER_SILL_PUNT_LEADERS_SPRITE_SCRIPT:                           ; 0X6C PUNTER FOR LEADING SCORERS
	.DB $F6,$31,$00,$00,$3C                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$29                                                   ; SET SPRITE PALLETE INDEX  TO: 41
	.DB $F8,$43,$EE                                               ; SET SPRITE STARTING LOCATION= Y: 134, X: 122 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LEADING_PUNTER_SPR_TILE_DATA
	.DB $FB,$00,$60,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 6, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0D                                                       ; SCROLL OR WAIT FOR: 26 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

JUMPING_DEF_SILL_INT_LEADERS_SPRITE_SCRIPT:                       ; 0X6D DEFENDER FOR INTERCEPTION LEADERS
	.DB $F6,$32,$57,$00,$33                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$2A                                                   ; SET SPRITE PALLETE INDEX  TO: 42
	.DB $F8,$96,$34                                               ; SET SPRITE STARTING LOCATION= Y: -44, X: 104 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LEADING_INT_SPR_TILE_DATA
	.DB $FB,$90,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -9,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0D                                                       ; SCROLL OR WAIT FOR: 26 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

DIVING_DEF_SILL_SACK_LEADERS_SPRITE_SCRIPT:                       ; 0X6E DIVING DEFENDER FOR SACK LEADERS
	.DB $F6,$28,$29,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$2B                                                   ; SET SPRITE PALLETE INDEX  TO: 43
	.DB $F8,$43,$93                                               ; SET SPRITE STARTING LOCATION= Y: 134, X: 122 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LEADING_SACK_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] LEADERS_SCROLL_IN_FROM_OFFSCREEN_SCRIPT

RETURNER_SILL_LEADERS_SPRITE_SCRIPT:                              ; 0X6F PLAYER FOR PR LEADERS
	.DB $F6,$28,$29,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$2C                                                   ; SET SPRITE PALLETE INDEX  TO: 44
	.DB $F8,$E8,$38                                               ; SET SPRITE STARTING LOCATION= Y: -208, X: 112 OFFSCREEN
	.DB $F3                                                       ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
	DO_TILE_DATA[ADDR] LEADING_RETURNER_SPR_TILE_DATA
	.DB $FB,$70,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 7,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0D                                                       ; SCROLL OR WAIT FOR: 26 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

_F}_LEADERS_SPRITE_SCRIPTS

_F{_CREDITS_SPRITE_SCRIPTS

QB_THROWING_CREDITS_SPRITE_SCRIPT:                                ; 0X70 QB THROWING SCROLL FROM OFFSCREEN (CREDITS)
	.DB $F6,$38,$00,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$4C                                                   ; SET SPRITE PALLETE INDEX  TO: 76
	.DB $F8,$24,$EE                                               ; SET SPRITE STARTING LOCATION= Y: 72, X: 184 OFFSCREEN
	DO_TILE_DATA[ADDR] QB_THROWING_SPR_TILE_DATA
	.DB $FB,$00,$40,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 4, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $14                                                       ; SCROLL OR WAIT FOR: 40 FRAMES
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

RUNNING_PLAYER_HAND_NUMBER_ONE_CREDITS_SPRITE_SCRIPT:             ; 0X71 PLAYER RUNNING HAND IN AIR #1 SIGN  (CREDITS)
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_SPIKE_SPRITE_SUB
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_NUM_ONE_SPRITE_SUB
	.DB $E2                                                       ; SET NUMBER OF TIMES TO LOOP = 2
	.DB $FB,$04,$04,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0.25,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] PLAYER_NUM_ONE_HAND_ONE_SPR_TILE_DATA
	.DB $04                                                       ; SCROLL OR WAIT FOR: 8 FRAMES
	.DB $FB,$FC,$04,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: -15.75,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	DO_TILE_DATA[ADDR] PLAYER_NUM_ONE_HAND_TWO_SPR_TILE_DATA
	.DB $04                                                       ; SCROLL OR WAIT FOR: 8 FRAMES
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_NUM_ONE_SPRITE_SUB
	.DB $F7                                                       ; LOOP TIMER-
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

UNUSED_FOUR_SPRITE_SCRIPT:                                        ; 0X72 UNUSED??????
	.DB $F6,$31,$00,$3B,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$18,$06                                               ; SET SPRITE STARTING LOCATION= Y: 48, X: 12
	DO_TILE_DATA[ADDR] UNUSED_BAAC_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] STOP_SCROLLING_AND_LOOP_SCRIPT       ;

BALL_FROM_OFFSCREEN_CREDITS_SPRITE_SCRIPT:                        ; 0X73 BALL COMING FROM OFFSCREEN SCROLLING DOWN RIGHT(CREDITS)
	.DB $F6,$36,$37,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$4C                                                   ; SET SPRITE PALLETE INDEX  TO: 76
	.DB $F8,$0A,$FE                                               ; SET SPRITE STARTING LOCATION= Y: 20, X: 236 OFFSCREEN
	DO_TILE_DATA[ADDR] BALL_COMING_FROM_OFFSCREEN_SPR_TILE_DATA
	.DB $FB,$1D,$58,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 1.8125,X PIXELS/FRM: 5, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	.DB $FF                                                       ; END

PLAYER_CATCH_BALL_CREDITS_SPRITE_SCRIPT:                          ; 0X74 PLAYER CATCHING BALL (CREDITS)
	.DB $F6,$36,$37,$00,$00                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$4C                                                   ; SET SPRITE PALLETE INDEX  TO: 76
	.DB $F8,$22,$36                                               ; SET SPRITE STARTING LOCATION= Y: 68, X: 108
	DO_TILE_DATA[ADDR] PLAYER_ATTEMPT_CATCH_SPR_TILE_DATA
	.DB $FB,$00,$20,$04,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 2, Y SPEED INC/FRM: 4 , XSPEED INC/FRM:: 0
	.DB $0F                                                       ; SCROLL OR WAIT FOR: 30 FRAMES
	DO_TILE_DATA[ADDR] PLAYER_CATCH_BALL_NORMAL_SPR_TILE_DATA
	JUMP_SPRITE_SCRIPT[ADDR] END_OF_CATCHES_SPRITE_SCRIPT

_F}_CREDITS_SPRITE_SCRIPTS

_F{_KICKOFF_ARM_P1_SPRITE_SCRIPT

KICKOFF_ARM_P1_SPRITE_SCRIPT:                                     ; 0X75 P1 KICKER HAND IN AIR
	.DB $F6,$31,$00,$00,$2E                                       ; SET SPRITE CHR BANKS (CHR 1000, CHR 1400, CHR 1800, CHR 1C00)
	.DB $FC,$00                                                   ; SET SPRITE PALLETE INDEX  TO: 0
	.DB $F8,$30,$36                                               ; SET SPRITE STARTING LOCATION= Y: 96, X: 108
	.DB $F9                                                       ; SWITCH CUTSCENE SIDE
	JUMP_SPRITE_SCRIPT[ADDR] KICKOFF_SCROLL_SPRITE_SCRIPT

_F}_KICKOFF_ARM_P1_SPRITE_SCRIPT

END_OF_SCRIPT_SPRITE_SCRIPT:                                      ; 0X76-0X7F   UNUSED
	.DB $FF                                                       ; END OF SPRITE DATA

STOP_SCROLLING_AND_LOOP_SCRIPT:                                   ; STOP SCROLLING AND LOOP INDEFINITELY
	.DB $FB,$00,$00,$00,$00                                       ; SET SCROLL SPEED Y PIXELS/FRM: 0,X PIXELS/FRM: 0, Y SPEED INC/FRM: 0 , XSPEED INC/FRM:: 0

SCROLL_FOREVER_SCRIPT:

LOOP_START[]                                                      ; SCROLL INDEFINITELY
	.DB $78                                                       ; SCROLL OR WAIT FOR: 240 FRAMES
LOOP_END[]


FLIP_SCROLL_DIR_AND_SCROLL_FOREVER_SCRIPT:                        ; STOP SCROLLING AND LOOP INDEFINITELY
	.DB $FD                                                       ; START SCROLLING AND FLIP SCROLL DIRECTION
	JUMP_SPRITE_SCRIPT[ADDR]  SCROLL_FOREVER_SCRIPT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SPRITE TILE DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_F{_JUMP_PLYER_SPR_TILE_DATA

JUMP_PLYER_SPR_TILE_DATA:                                         ; JUMP PLAYER SPRITE TILE DATA
	DO_SUBROUTINE[ADDR] JUMPING_PLAYER_HEAD_SPR_TILE_DATA_SUB
	DO_SUBROUTINE[ADDR] JUMPING_PLAYER_FEET_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] PLAYER_TORSO_JUMP_SPR_TILE_DATA

_F}_JUMP_PLYER_SPR_TILE_DATA	

_F{_TINY_BALL_TOP_SCREEN_SPR_TILE_DATA	

TINY_BALL_TOP_SCREEN_SPR_TILE_DATA:                               ; SMALL BALL TILE DATA
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $03,$BA                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:BA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $43,$BA                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:BA
	.DB $FF                                                       ; END
	
_F}_TINY_BALL_TOP_SCREEN_SPR_TILE_DATA		

_F{_PLAYER_DIVING_BALL_SPR_TILE_DATA

PLAYER_DIVING_BALL_SPR_TILE_DATA:                                 ; PLAYER DIVING FOR BALL TILE DATA
																; RIGHT SIDE OF HELMET AND HAND DATA
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $35,$16                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:16
	.DB $39,$1C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:1C
	.DB $3C,$1E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:1E
	.DB $00,$34                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:34
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $34,$17                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:17
	.DB $38,$1D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:1D
	.DB $3C,$1F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $00,$35                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:35
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $34,$37                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:37
	.DB $38,$3D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:3D
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	JUMP_SPRITE_SCRIPT[ADDR] DIVING_PLAYER_BODY_SPR_TILE_DATA
	
_F}_PLAYER_DIVING_BALL_SPR_TILE_DATA	

_F{_HANDS_HOLDING_BALL_SPR_TILE_DATA

HANDS_HOLDING_BALL_SPR_TILE_DATA:                                 ; DIVING PLAYER CAUGHT BALL TILE DATA
																; HANDS HOLDING BALL TILE DATA
	.DB $FC,$23                                                   ; SET SPR Y OFFSET= 3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $37,$10                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:10
	.DB $3B,$3C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:3C
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $37,$0E                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:0E
	.DB $3B,$24                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:24
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $35,$0A                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:0A
	.DB $39,$20                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:20
	.DB $3C,$22                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:22
	.DB $00,$28                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:28
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $38,$0B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:0B
	.DB $3C,$21                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:21
	.DB $00,$23                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:23
	JUMP_SPRITE_SCRIPT[ADDR] DIVING_PLAYER_BODY_SPR_TILE_DATA

_F}_HANDS_HOLDING_BALL_SPR_TILE_DATA	

_F{_LARGE_BALL_DIVE_SPR_TILE_DATA

LARGE_BALL_DIVE_SPR_TILE_DATA:                                    ; LARGE BALL TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$10                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:10
	.DB $03,$14                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:14
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$11                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:11
	.DB $03,$15                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:15
	.DB $FF                                                       ; END

_F}_LARGE_BALL_DIVE_SPR_TILE_DATA	
	
_F{_LAND_FROM_JUMP_SPR_TILE_DATA

LAND_FROM_JUMP_SPR_TILE_DATA:                                     ; PLAYER LANDING FROM JUMP TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $13,$7C                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:7C
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $13,$7D                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:7D
	.DB $17,$7F                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:7F
	JUMP_SPRITE_SCRIPT[ADDR] LANDING_CATCH_BODY_SPR_TILE_DATA
	
_F}_LAND_FROM_JUMP_SPR_TILE_DATA	

_F{_PLAYER_ATTEMPT_CATCH_SPR_TILE_DATA

PLAYER_ATTEMPT_CATCH_SPR_TILE_DATA:                               ; SIDEWAYS PLAYER ATTEMPTING TO CATCH BALL TILES(CREDITS)
	DO_SUBROUTINE[ADDR] PLAYER_HANDS_NORMAL_CATCH_SPR_TILE_DATA_SUB
	DO_SUBROUTINE[ADDR] PLAYER_FEET_NORMAL_CATCH_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] NORMAL_CATCH_PLAYER_BODY_SPR_TILE_DATA
	
_F}_PLAYER_ATTEMPT_CATCH_SPR_TILE_DATA	

_F{_PLAYER_CATCH_BALL_NORMAL_SPR_TILE_DATA

PLAYER_CATCH_BALL_NORMAL_SPR_TILE_DATA:                           ; SIDEWAYS PLAYER CAUGHT BALL TILES(CREDITS)
	DO_SUBROUTINE[ADDR] PLAYER_HANDS_NORMAL_CAUGHT_BALL_SPR_TILE_DATA_SUB:
	DO_SUBROUTINE[ADDR] PLAYER_FEET_NORMAL_CATCH_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] NORMAL_CATCH_PLAYER_BODY_SPR_TILE_DATA
	
_F}_PLAYER_CATCH_BALL_NORMAL_SPR_TILE_DATA	

_F{_BALL_COMING_FROM_OFFSCREEN_SPR_TILE_DATA

BALL_COMING_FROM_OFFSCREEN_SPR_TILE_DATA:                         ; BALL COMING FROM OFFSCREEN SCROLLING DOWN RIGHT(CREDITS) TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$58                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:58
	.DB $03,$5A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:5A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$59                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:59
	.DB $03,$5B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:5B
	.DB $FF                                                       ; END

_F}_BALL_COMING_FROM_OFFSCREEN_SPR_TILE_DATA	

_F{_CHAIN_MEASURE_SPR_TILE_DATA

CHAIN_MEASURE_SPR_TILE_DATA:                                      ; PLAYER LOOKING AT BALL, BALL, AND REFERREE CHAIN MEASURE TILE DATA
																; PLAYER LOOKING AT BALL
	.DB $9A                                                       ; SET SPRITE X OFFSET = -6 TILES
	.DB $3E,$8B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:8B
	.DB $02,$A1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:A1
	.DB $06,$A3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:A3
	.DB $0A,$A9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:A9
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $38,$8C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:8C
	.DB $3E,$8E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:8E
	.DB $02,$A4                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:A4
	.DB $06,$A6                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:A6
	.DB $0A,$AC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:AC
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $36,$80                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:80
	.DB $38,$82                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:82
	.DB $3C,$88                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:88
	.DB $00,$8A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:8A
	.DB $05,$A0                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:A0
	.DB $09,$A2                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:A2
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $36,$81                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:81
	.DB $3A,$83                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:83
	.DB $3C,$89                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:89
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $36,$84                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:84
	.DB $39,$86                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:86
	.DB $FC,$34                                                   ; SET SPR X OFFSET= 4 PIXELS
	.DB $9A                                                       ; SET SPRITE X OFFSET = -6 TILES
	.DB $0E,$A7                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:A7
	.DB $13,$AD                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:AD
	.DB $17,$AF                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:AF
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $0E,$B2                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:B2
	.DB $13,$B8                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:B8
	.DB $17,$BA                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:BA
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $17,$AE                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:AE
																; START OF REFERREE
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $37,$85                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:85
	.DB $07,$A5                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:A5
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $37,$90                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:90
	.DB $3B,$92                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:92
	.DB $3F,$98                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:98
	.DB $03,$9A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:9A
	.DB $07,$B0                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:B0
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $07,$B4                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:B4
	.DB $0B,$B6                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:B6
	.DB $0F,$BC                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:BC
	.DB $13,$BE                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID0BE
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $3B,$97                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:97
	.DB $3F,$9D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:9D
	.DB $03,$9F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:9F
	.DB $07,$B5                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:B5
	.DB $0B,$B7                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:B7
	.DB $0F,$BD                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:BD
	.DB $13,$BF                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:BF
	.DB $85                                                       ; SET SPRITE X OFFSET = 5 TILES
	.DB $03,$95                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:95
	.DB $07,$B1                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:B1
	.DB $0B,$B3                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:B3
	.DB $0F,$B9                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:B9
	.DB $13,$BB                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:BB
	.DB $FC,$3B                                                   ; SET SPR X OFFSET= -5 PIXELS
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $17,$AA                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:AA
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $17,$AB                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:AB
	.DB $85                                                       ; SET SPRITE X OFFSET = 5 TILES
	.DB $17,$8F                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:8F
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
																; BALL TILE DATA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $17,$A8                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:A8
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $57,$A8                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:A8
	.DB $FF                                                       ; END

_F}_CHAIN_MEASURE_SPR_TILE_DATA

_F{_QB_THROWING_SPR_TILE_DATA

QB_THROWING_SPR_TILE_DATA:                                        ; QB THROWING TILE DATA
	.DB $FC,$2F                                                   ; SET SPR Y OFFSET= -1 PIXELS
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $33,$2E                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:2E
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $33,$30                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:30
	.DB $FC,$2C                                                   ; SET SPR Y OFFSET= -4 PIXELS
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $34,$21                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:21
	.DB $38,$23                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:23
	.DB $3C,$29                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:29
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $34,$24                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:24
	.DB $38,$26                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:26
	.DB $3C,$2C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:2C
	.DB $FC,$20                                                   ; SET SPR Y OFFSET= 0 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $0E,$2D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:2D
	.DB $12,$2F                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:2F
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $34,$10                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:10
	.DB $38,$12                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:12
	.DB $3C,$18                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:18
	.DB $02,$1A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:1A
	.DB $0A,$32                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:32
	.DB $0E,$38                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:38
	.DB $12,$3A                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:3A
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $31,$0B                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:0B
	.DB $35,$11                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:11
	.DB $38,$13                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:13
	.DB $3E,$12                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:12
	.DB $02,$1B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:1B
	.DB $06,$31                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:31
	.DB $0A,$33                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:33
	.DB $0E,$39                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:39
	.DB $12,$3B                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:3B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $31,$0E                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:0E
	.DB $35,$14                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:14
	.DB $38,$16                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:16
	.DB $3E,$12                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:12
	.DB $02,$1E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:1E
	.DB $06,$34                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:34
	.DB $0A,$36                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:36
	.DB $0E,$19                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:19
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $34,$15                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:15
	.DB $38,$12                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:12
	.DB $3E,$1D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:1D
	.DB $02,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:1F
	.DB $06,$35                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:35
	.DB $0A,$37                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:37
	.DB $0E,$3D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:3D
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $30,$20                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:20
	.DB $34,$22                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:22
	.DB $38,$28                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:28
	.DB $3C,$2A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:2A
	.DB $0A,$0F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:0F
	.DB $0E,$25                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:25
	.DB $12,$27                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:27
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $38,$0A                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:0A
	.DB $3C,$2B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:2B
	.DB $0E,$3C                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:3C
	.DB $12,$3E                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:3E
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $12,$3F                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:3F
	.DB $FF                                                       ; END
	
_F}_QB_THROWING_SPR_TILE_DATA	

AC9C:
	.DB $FF                                                       ; END *** unused

_F{_BALL_OFF_HANDS_SPR_TILE_DATA

BALL_OFF_HANDS_SPR_TILE_DATA:                                     ; BALL SPIN 2 LOOP TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $7F,$59                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:59
	.DB $43,$5B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:5B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $7F,$58                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:58
	.DB $43,$5A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:5A
	.DB $FF                                                       ; END

_F}_BALL_OFF_HANDS_SPR_TILE_DATA

_F{_CHEER_PLAYER_INTRO_SPR_TILE_DATA

CHEER_PLAYER_INTRO_SPR_TILE_DATA:                                 ; CHEELEADERS AND PLAYERS VERTICAL SCROLL INTRO TILES
	.DB $91                                                       ; SET SPRITE X OFFSET = -15 TILES
	.DB $0F,$EB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:EB
	.DB $93                                                       ; SET SPRITE X OFFSET = -13 TILES
	.DB $0F,$ED                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:ED
	.DB $95                                                       ; SET SPRITE X OFFSET = -11 TILES
	.DB $0F,$D3                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:D3
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $05,$DD                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:DD
	.DB $0A,$DF                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:DF
	.DB $86                                                       ; SET SPRITE X OFFSET = 6 TILES
	.DB $06,$D5                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:D5
	.DB $8D                                                       ; SET SPRITE X OFFSET = 13 TILES
	.DB $05,$DD                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:DD
	.DB $0A,$DF                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:DF
	.DB $FC,$28                                                   ; SET SPR Y OFFSET= -8 PIXELS
	.DB $92                                                       ; SET SPRITE X OFFSET = -14 TILES
	.DB $0F,$E5                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:E5
	.DB $13,$E7                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:E7
	.DB $94                                                       ; SET SPRITE X OFFSET = -12 TILES
	.DB $0F,$EF                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:EF
	.DB $13,$D1                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:D1
	.DB $96                                                       ; SET SPRITE X OFFSET = -10 TILES
	.DB $0F,$D9                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:D9
	.DB $13,$DB                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:DB
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $0A,$F5                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:F5
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $09,$F7                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:F7
	.DB $0E,$FD                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:FD
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $05,$D7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:D7
	.DB $89                                                       ; SET SPRITE X OFFSET = 9 TILES
	.DB $0A,$F5                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:F5
	.DB $8A                                                       ; SET SPRITE X OFFSET = 10 TILES
	.DB $09,$F7                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:F7
	.DB $0E,$FD                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:FD
	.DB $8C                                                       ; SET SPRITE X OFFSET = 12 TILES
	.DB $05,$D7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:D7
	.DB $FF                                                       ; END
	
_F}_CHEER_PLAYER_INTRO_SPR_TILE_DATA	

_F{_PLAYER_SACK_SPR_TILE_DATA

PLAYER_SACK_SPR_TILE_DATA:                                        ; PLAYER SACK ANIMATION TILES
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $2C,$40                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:40
	.DB $30,$42                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:42
	.DB $34,$48                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:48
	.DB $38,$4A                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4A
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $2C,$41                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:41
	.DB $30,$43                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:43
	.DB $34,$49                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:49
	.DB $38,$4B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4B
	.DB $3C,$61                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:61
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $34,$4C                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:4C
	.DB $38,$4E                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4E
	.DB $3C,$67                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:67
	.DB $00,$66                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:66
	.DB $04,$6C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:6C
	.DB $08,$6E                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:6E
	.DB $0E,$68                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:68
	.DB $12,$6A                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:6A
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $35,$4D                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:4D
	.DB $39,$4F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:4F
	.DB $3C,$65                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:65
	.DB $00,$67                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:67
	.DB $04,$67                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:67
	.DB $0A,$63                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:63
	.DB $0E,$69                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:69
	.DB $12,$6B                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:6B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $35,$58                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:58
	.DB $39,$5A                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:5A
	.DB $3E,$70                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:70
	.DB $00,$67                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:67
	.DB $06,$6D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:6D
	.DB $0A,$64                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:64
	.DB $0E,$60                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:60
	.DB $12,$62                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:62
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $74,$4C                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:4C
	.DB $78,$4E                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4E
	.DB $7C,$67                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:67
	.DB $40,$66                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:66
	.DB $44,$6C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:6C
	.DB $48,$6E                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:6E
	.DB $4E,$68                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:68
	.DB $52,$6A                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:6A
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $6C,$41                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:41
	.DB $70,$43                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:43
	.DB $74,$49                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:49
	.DB $78,$4B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4B
	.DB $7C,$61                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:61
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $6C,$40                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:40
	.DB $70,$42                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:42
	.DB $74,$48                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:48
	.DB $78,$4A                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4A
	.DB $FF                                                       ; END
	
_F}_PLAYER_SACK_SPR_TILE_DATA	

_F{_HAND_ATTEMPT_TO_CATCH_SPR_TILE_DATA

HAND_ATTEMPT_TO_CATCH_SPR_TILE_DATA:                              ; MOVING HAND FOR CATCH LEFT TO RIGHT OPEN TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $00,$10                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:10
	.DB $04,$12                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:12
	.DB $FC,$3F                                                   ; SET SPR X OFFSET= -1 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $38,$04                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4
	.DB $3C,$06                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:6
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $38,$05                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:5
	.DB $3C,$07                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:7
	.DB $FF                                                       ; END
	
_F}_HAND_ATTEMPT_TO_CATCH_SPR_TILE_DATA	

_F{_OPEN_HAND_FOR_CATCH_SPR_TILE_DATA

OPEN_HAND_FOR_CATCH_SPR_TILE_DATA:                                ; OPEN HAND FOR CATCH TILES
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $38,$11                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:11
	.DB $3C,$13                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:13
	.DB $00,$19                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:19
	.DB $04,$1B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:1B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $38,$14                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:14
	.DB $3C,$16                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:16
	.DB $00,$1C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1C
	.DB $04,$1E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:1E
	.DB $FF                                                       ; END
	
_F}_OPEN_HAND_FOR_CATCH_SPR_TILE_DATA	

_F{_BIG_BALL_INT_TIP_NORMAL_SPR_TILE_DATA

BIG_BALL_INT_TIP_NORMAL_SPR_TILE_DATA:                            ; BIG BALL TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3F,$31                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:31
	.DB $03,$33                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:33
	.DB $07,$39                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:39
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$34                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:34
	.DB $03,$36                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:36
	.DB $07,$3C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:3C
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$37                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:37
	.DB $03,$27                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:27
	.DB $07,$3D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:3D
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3F,$15                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:15
	.DB $03,$17                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:17
	.DB $07,$1D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:1D
	.DB $FF                                                       ; END
	
_F}_BIG_BALL_INT_TIP_NORMAL_SPR_TILE_DATA	

_F{_HAND_CLOSED_FOR_CATCH_SPR_TILE_DATA

HAND_CLOSED_FOR_CATCH_SPR_TILE_DATA:                              ; MOVING HAND FOR CATCH STAYS HAND CLOSES TILES
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $00,$19                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:19
	.DB $04,$1B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:1B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $00,$1C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1C
	.DB $04,$1E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:1E
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $38,$32                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:32
	.DB $3C,$38                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:38
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $38,$2F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:2F
	.DB $3C,$3A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3A
	.DB $FF                                                       ; END
	
_F}_HAND_CLOSED_FOR_CATCH_SPR_TILE_DATA	

_F{_HAND_THROWING_SPR_TILE_DATA

HAND_THROWING_ONE_SPR_TILE_DATA:                                  ; HAND THROWING MOTION BALL RELEASED TILES 1
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $38,$0A                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:0A
	.DB $3C,$20                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:20
	.DB $00,$22                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:22
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $38,$0B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:0B
	.DB $3C,$21                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:21
	.DB $00,$23                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:23
	.DB $FF                                                       ; END

HAND_THROWING_TWO_SPR_TILE_DATA:                                  ; BALL POINTED UP TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $03,$2A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $03,$2B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $03,$2E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2E
	.DB $FC,$31                                                   ; SET SPR X OFFSET= 1 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$28                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:28
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$29                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:29
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3F,$2C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:2C
	.DB $FF                                                       ; END

HAND_THROWING_THREE_SPR_TILE_DATA:                                ; HAND THROWING MOTION BALL RELEASED TILES 1
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $00,$26                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:26
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $3C,$0E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0E
	.DB $00,$24                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:24
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $3C,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0F
	.DB $00,$25                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:25
	.DB $FF                                                       ; END
	
_F}_HAND_THROWING_SPR_TILE_DATA	

_F{_HAND_SNAP_BALL_SPR_TILE_DATA

HAND_SNAP_BALL_ONE_SPR_TILE_DATA:                                 ; LINEMAN HAND SNAPPING BALL TILES INTRO
	.DB $FC,$00                                                   ; SET FLIP VERTICAL = TRUE
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3C,$A2                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:A2
	.DB $00,$A0                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A0
	.DB $04,$8A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:8A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3C,$A3                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:A3
	.DB $00,$A1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A1
	.DB $04,$8B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:8B
	.DB $FC,$10                                                   ; SET FLIP VERTICAL = FALSE
	.DB $FF                                                       ; END

HAND_SNAP_BALL_THREE_SPR_TILE_DATA:                               ; LINEMAN HAND SNAPPING BALL TILES 3INTRO
	.DB $FC,$00                                                   ; SET FLIP VERTICAL = TRUE
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $03,$AA                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:AA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $03,$AB                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:AB
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $03,$AE                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:AE
	.DB $FC,$31                                                   ; SET SPR X OFFSET= 1 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $07,$A8                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:A8
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $07,$A9                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:A9
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $07,$AC                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:AC
	.DB $FC,$10                                                   ; SET FLIP VERTICAL = FALSE
	.DB $FF                                                       ; END

HAND_SNAP_BALL_TWO_SPR_TILE_DATA:                                 ; LINEMAN HAND SNAPPING BALL TILES 2 INTRO
	.DB $FC,$00                                                   ; SET FLIP VERTICAL = TRUE
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3C,$A6                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0A6
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $3C,$A4                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0A4
	.DB $00,$8E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:8E
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $3C,$A5                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0A5
	.DB $00,$8F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:8F
	.DB $FC,$10                                                   ; SET FLIP VERTICAL = FALSE
	.DB $FF                                                       ; END
	
_F}_HAND_SNAP_BALL_SPR_TILE_DATA	

_F{_DIVE_BLOCK_BALL_SPR_TILE_DATA

DIVE_BLOCK_BALL_SPR_TILE_DATA:                                    ; PLAYER DIVING TO BLOCK BALL TILES
																; DRAW FEET
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $0F,$6D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:6D
	.DB $13,$6B                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:6B
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $0B,$72                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:72
	.DB $0F,$78                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:78
	.DB $13,$6E                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:6E
	.DB $85                                                       ; SET SPRITE X OFFSET = 5 TILES
	.DB $0B,$73                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:73
	.DB $0F,$79                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:79
	JUMP_SPRITE_SCRIPT[ADDR] DIVING_DEFENDER_BODY_SPR_TILE_DATA
	
_F}_DIVE_BLOCK_BALL_SPR_TILE_DATA	

_F{_SPIN_BALL_FG_SPR_TILE_DATA

SPIN_BALL_FG_ONE_SPR_TILE_DATA:                                   ; SPINNING BALL FG TILES 1
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$6F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:6F
	.DB $03,$7B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:7B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$7A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:7A
	.DB $03,$7E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:7E
	.DB $FF                                                       ; END

SPIN_BALL_FG_TWO_SPR_TILE_DATA:                                   ; SPINNING BALL FG TILES 2
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$48                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:48
	.DB $03,$4A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:4A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$49                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:49
	.DB $03,$4B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:4B
	.DB $FF                                                       ; END
	
_F}_SPIN_BALL_FG_SPR_TILE_DATA	

_F{_PUNTER_HEAD_FOOT_SPR_TILE_DATA

PUNTER_HEAD_FOOT_SPR_TILE_DATA:                                   ; PUNTER SCROLL HEAD TO FOOT TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $13,$E0                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:E0
	.DB $17,$E2                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:E2
	.DB $1B,$E8                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 3, TILE ID:E8
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $13,$EA                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:EA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $13,$F0                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:F0
	.DB $17,$F2                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:F2
	.DB $1B,$F8                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 3, TILE ID:F8
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $1B,$FA                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 3, TILE ID:FA
	JUMP_SPRITE_SCRIPT[ADDR] LEADING_PUNTER_BODY_SPR_TILE_DATA

_F}_PUNTER_HEAD_FOOT_SPR_TILE_DATA	

_F{_DIV_CHAMP_SPR_TILE_DATA

ONSCREEN_DIV_CHAMP_TILE_DATA:                                     ; PLAYER FACES IN HELMETS  DIVISION CHAMP ONSCREEN
	.DB $91                                                       ; SET SPRITE X OFFSET = -15 TILES
	.DB $0F,$9E                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $94                                                       ; SET SPRITE X OFFSET = -12 TILES
	.DB $33,$9E                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $99                                                       ; SET SPRITE X OFFSET = -7 TILES
	.DB $37,$9E                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $0F,$9E                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $2F,$9E                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $33,$9E                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $89                                                       ; SET SPRITE X OFFSET = 9 TILES
	.DB $3F,$9E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $8B                                                       ; SET SPRITE X OFFSET = 11 TILES
	.DB $2F,$9F                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 3, TILE ID:9F
	.DB $FF                                                       ; END

OFFSCREEN_DIV_CHAMP_TILE_DATA:                                    ; PLAYER FACES IN HELMETS  DIVISION CHAMP OFFSCREEN
	.DB $94                                                       ; SET SPRITE X OFFSET = -12 TILES
	.DB $33,$9E                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $33,$9E                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:9E
	.DB $01,$AA                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:AA
	.DB $FC,$34                                                   ; SET SPR X OFFSET= 4 PIXELS
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $05,$9C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:9C
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $39,$94                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:94
	.DB $3D,$96                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:96
	.DB $01,$03                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $FC,$34                                                   ; SET SPR X OFFSET= 4 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $05,$8D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:8D
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $09,$8F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:8F
	.DB $0D,$A5                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:A5
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $35,$95                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:95
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $39,$03                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $3D,$97                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:97
	.DB $01,$AB                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:AB
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $2E,$8A                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 2, TILE ID:8A
	.DB $33,$A0                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:A0
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $35,$A2                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:A2
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $39,$A8                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:A8
	.DB $3D,$03                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $01,$AE                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:AE
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $2A,$89                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 2, TILE ID:89
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $2E,$8B                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 2, TILE ID:8B
	.DB $33,$A1                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:A1
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $37,$A3                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:A3
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $39,$A9                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:A9
	.DB $3D,$03                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $01,$90                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:90
	.DB $05,$92                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:92
	.DB $09,$98                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:98
	.DB $0D,$9A                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:9A
	.DB $11,$B0                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1, TILE ID:B0
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $2A,$8C                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 2, TILE ID:8C
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $2E,$8E                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 2, TILE ID:8E
	.DB $33,$A4                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:A4
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $37,$A6                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:A6
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $39,$AC                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:AC
	.DB $3D,$03                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $01,$03                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $05,$03                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $09,$03                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $0D,$03                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $11,$9D                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1, TILE ID:9D
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $35,$A7                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:A7
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $39,$AD                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:AD
	.DB $3D,$AF                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:AF
	.DB $02,$91                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:91
	.DB $05,$93                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:93
	.DB $09,$99                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:99
	.DB $0D,$9B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:9B
	.DB $11,$B1                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1, TILE ID:B1
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $2F,$9F                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 3, TILE ID:9F
	.DB $88                                                       ; SET SPRITE X OFFSET = 8 TILES
	.DB $37,$9F                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:9F
	.DB $8D                                                       ; SET SPRITE X OFFSET = 13 TILES
	.DB $3F,$9F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:9F
	.DB $FF                                                       ; END
	
_F}_DIV_CHAMP_SPR_TILE_DATA	

_F{_PUNT_SPR_TILE_DATA

BALL_FOR_PUNT_SPR_TILE_DATA:                                      ; BALL PARRALEL TO GROUND FOR PUNT TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $03,$F1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:F1
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $43,$F1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:F1
	.DB $FC,$34                                                   ; SET SPR X OFFSET= 4 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $07,$F4                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:F4
	.DB $FF                                                       ; END

LEG_NINETY_PUNT_SPR_TILE_DATA:                                    ; PUNTER WITH LEG AT 90 ANIMATION RIGHT TO LEFT TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0F,$28                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:28
	.DB $13,$2A                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:2A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $13,$2B                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:2B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $03,$0A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:0A
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3F,$0E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:0E
	.DB $03,$0B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:0B
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $3F,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:0F
	JUMP_SPRITE_SCRIPT[ADDR] KICKER_PUNTER_BODY_SPR_TILE_DATA

SPIN_BALL_ONE_PUNT_SPR_TILE_DATA:                                 ; SPINNING BALL 1 TILES = BALL IN ONE DIRECTION
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$26                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:26
	.DB $03,$2C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2C
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$25                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:25
	.DB $03,$2E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2E
	.DB $FF                                                       ; END

SPIN_BALL_TWO_PUNT_SPR_TILE_DATA:                                 ; SPINNING BALL 2 TILES = BALL IN ANOTHER DRIECTION
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $7F,$25                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:25
	.DB $43,$2E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2E
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $7F,$26                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:26
	.DB $43,$2C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2C
	.DB $FF                                                       ; END
	
_F}PUNT_SPR_TILE_DATA	

_F{_FG_SPR_TILE_DATA


FOOT_KICK_BALL_ONE_SPR_TILE_DATA:                                 ; FOOT KICKING BALL 1 TILES
	.DB $99                                                       ; SET SPRITE X OFFSET = -7 TILES
	.DB $3B,$0A                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:0A
	.DB $3F,$20                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:20
	.DB $03,$22                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:22
	.DB $07,$28                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:28
	.DB $0B,$2A                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:2A
	.DB $9A                                                       ; SET SPRITE X OFFSET = -6 TILES
	.DB $3B,$0B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:0B
	.DB $3F,$21                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:21
	.DB $03,$23                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:23
	.DB $07,$29                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:29
	.DB $0B,$2B                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:2B
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $3B,$0E                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:0E
	.DB $3F,$24                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:24
	.DB $FF                                                       ; END

FOOT_KICK_BALL_TWO_SPR_TILE_DATA:                                 ; FOOT KICKING BALL 2 TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3B,$0F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:0F
	.DB $3F,$25                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:25
	.DB $03,$27                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:27
	.DB $07,$2D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:2D
	.DB $0B,$2F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:2F
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3B,$30                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:30
	.DB $3F,$30                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:30
	.DB $03,$32                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:32
	.DB $07,$38                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:38
	.DB $0B,$3A                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:3A
	.DB $0F,$1A                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:1A
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $03,$33                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:33
	.DB $07,$39                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:39
	.DB $0B,$3B                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:3B
	.DB $0F,$1B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:1B
	.DB $13,$31                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:31
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $03,$36                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:36
	.DB $07,$3C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:3C
	.DB $0B,$3E                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:3E
	.DB $0F,$1E                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:1E
	.DB $FF                                                       ; END

FOOT_KICK_BALL_THREE_SPR_TILE_DATA:                               ; FOOT KICKING BALL 3 TILES
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $03,$26                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:26
	.DB $07,$2C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:2C
	.DB $0B,$2E                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:2E
	.DB $85                                                       ; SET SPRITE X OFFSET = 5 TILES
	.DB $03,$10                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:10
	.DB $07,$12                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:12
	.DB $0B,$18                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:18
	.DB $86                                                       ; SET SPRITE X OFFSET = 6 TILES
	.DB $03,$11                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:11
	.DB $07,$39                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:39
	.DB $0B,$19                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:19
	.DB $87                                                       ; SET SPRITE X OFFSET = 7 TILES
	.DB $03,$13                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:13
	.DB $07,$16                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $0B,$1C                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:1C
	.DB $FF                                                       ; END

FOOT_KICK_BALL_FOUR_SPR_TILE_DATA:                                ; FOOT KICKING BALL 4 TILES
	.DB $8A                                                       ; SET SPRITE X OFFSET = 10 TILES
	.DB $7F,$13                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:13
	.DB $43,$16                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $47,$1C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:1C
	.DB $8B                                                       ; SET SPRITE X OFFSET = 11 TILES
	.DB $7F,$11                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:11
	.DB $43,$39                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:39
	.DB $47,$19                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:19
	.DB $FF                                                       ; END

LARGE_BALL_FG_ONE_SPR_TILE_DATA:                                  ; LARGE BALL TOWARDS GOALPOST 1 TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3B,$12                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:12
	.DB $3F,$18                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:18
	.DB $03,$1A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:1A
	.DB $07,$30                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:30
	.DB $0B,$32                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:32
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $37,$11                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:11
	.DB $3B,$13                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:13
	.DB $3F,$16                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $03,$16                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $07,$16                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $0B,$33                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:33
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $37,$14                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:14
	.DB $3B,$16                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $3F,$16                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $03,$1E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:1E
	.DB $07,$34                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:34
	.DB $0B,$36                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:36
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $37,$15                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:15
	.DB $3B,$17                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:17
	.DB $3F,$1D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:1D
	.DB $03,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:1F
	.DB $07,$35                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:35
	.DB $FF                                                       ; END

LARGE_BALL_FG_TWO_SPR_TILE_DATA:                                  ; LARGE BALL TOWARDS GOALPOST 2 TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3F,$0A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:0A
	.DB $03,$20                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:20
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$0B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:0B
	.DB $03,$21                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:21
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$0E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:0E
	.DB $03,$16                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3F,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:0F
	.DB $03,$25                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:25
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3B,$1B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:1B
	.DB $07,$24                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:24
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3B,$19                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:19
	.DB $07,$26                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:26
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3B,$1C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:1C
	.DB $07,$27                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:27
	.DB $FF                                                       ; END

LARGE_BALL_FG_THREE_SPR_TILE_DATA:                                ; LARGE BALL TOWARDS GOALPOST 3 TILES
	.DB $FC,$3B                                                   ; SET SPR X OFFSET= -5 PIXELS
	.DB $FC,$2C                                                   ; SET SPR Y OFFSET= -4 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3B,$22                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:22
	.DB $3F,$28                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:28
	.DB $03,$2A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3B,$23                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:23
	.DB $3F,$29                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:29
	.DB $03,$2B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3B,$2D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:2D
	.DB $3F,$2C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:2C
	.DB $03,$2E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2E
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $03,$2F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:2F
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $07,$38                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:38
	.DB $0B,$3A                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:3A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $07,$39                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:39
	.DB $0B,$3B                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:3B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $07,$3C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:3C
	.DB $0B,$3E                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:3E
	.DB $FF                                                       ; END

LARGE_BALL_FG_FOUR_SPR_TILE_DATA:                                 ; LARGE BALL TOWARDS GOALPOST 4 TILES
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3B,$40                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:40
	.DB $3F,$42                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:42
	.DB $03,$48                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:48
	.DB $07,$4A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:4A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $37,$43                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:43
	.DB $3B,$41                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:41
	.DB $3F,$16                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $03,$16                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:16
	.DB $07,$4B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:4B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3B,$44                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:44
	.DB $3F,$46                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:46
	.DB $03,$4C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:4C
	.DB $07,$4E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:4E
	.DB $FF                                                       ; END

LARGE_BALL_FG_FIVE_SPR_TILE_DATA:                                 ; LARGE BALL TOWARDS GOALPOST 5 TILES
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$37                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:37
	.DB $03,$3D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:3D
	.DB $07,$3F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:3F
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$62                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:62
	.DB $03,$68                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:68
	.DB $07,$6A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:6A
	.DB $FC,$21                                                   ; SET SPR Y OFFSET= 1 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3F,$61                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:61
	.DB $03,$63                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:63
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3F,$64                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:64
	.DB $03,$66                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:66
	.DB $FF                                                       ; END

LARGE_BALL_FG_SIX_SPR_TILE_DATA:                                  ; LARGE BALL TOWARDS GOALPOST 6 TILES
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3F,$45                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:45
	.DB $03,$47                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:47
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$50                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:50
	.DB $03,$52                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:52
	.DB $07,$58                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:58
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$51                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:51
	.DB $03,$53                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:53
	.DB $07,$59                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:59
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3B,$54                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:54
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3B,$55                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:55
	.DB $FF                                                       ; END

LARGE_BALL_FG_SEVEN_SPR_TILE_DATA:                                ; LARGE BALL TOWARDS GOALPOST 7 TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3B,$56                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:56
	.DB $3F,$5C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:5C
	.DB $03,$5E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:5E
	.DB $07,$74                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:74
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3B,$57                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:57
	.DB $3F,$5D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:5D
	.DB $03,$5F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:5F
	.DB $07,$75                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:75
	.DB $FF                                                       ; END

LARGE_BALL_FG_EIGHT_SPR_TILE_DATA:                                ; LARGE BALL TILES 8
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$4F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:4F
	.DB $03,$65                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:65
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$5A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:5A
	.DB $03,$70                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:70
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_ONE_SPR_TILE_DATA:                                ; SMALL BALL SPINNING TILES 1
	.DB $FC,$2E                                                   ; SET SPR Y OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$76                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:76
	.DB $03,$7C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:7C
	.DB $07,$7E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:7E
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$77                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:77
	.DB $03,$7D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:7D
	.DB $07,$7F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:7F
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_TWO_SPR_TILE_DATA:                                ; SMALL BALL SPINNING TILES 2
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$69                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:69
	.DB $03,$6B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:6B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$6C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:6C
	.DB $03,$6E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:6E
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_THREE_SPR_TILE_DATA:                              ; SMALL BALL SPINNING TILES 3
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$72                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:72
	.DB $03,$78                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:78
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$73                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:73
	.DB $03,$79                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:79
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_FOUR_SPR_TILE_DATA:                               ; SMALL BALL SPINNING TILES 4
	.DB $FC,$34                                                   ; SET SPR X OFFSET= 4 PIXELS
	.DB $FC,$2C                                                   ; SET SPR Y OFFSET= -4 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$67                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:67
	.DB $03,$6D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:6D
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $03,$10                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:10
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_FIVE_SPR_TILE_DATA:                               ; SMALL BALL SPINNING TILES 5
	.DB $FC,$3D                                                   ; SET SPR X OFFSET= -3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$5B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:5B
	.DB $03,$71                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:71
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_SIX_SPR_TILE_DATA:                                ; SMALL BALL SPINNING TILES 6
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $03,$31                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:31
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_SEVEN_SPR_TILE_DATA:                              ; SMALL BALL SPINNING TILES 7
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $03,$60                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:60
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_EIGHT_SPR_TILE_DATA:                              ; SMALL BALL SPINNING TILES 8
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $03,$49                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:49
	.DB $FF                                                       ; END

SMALL_BALL_SPIN_NINE_SPR_TILE_DATA:                               ; SMALL BALL SPINNING TILES 9
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $03,$4D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:4D
	.DB $FF                                                       ; END
	
_F}_FG_SPR_TILE_DATA	

_F{_RUSHING_TD_SCENE_SPR_TILE_DATA

PLAYER_RUN_SPIKE_TD_ONE_SPR_TILE_DATA:                            ; PLAYER RUNNING HAND IN AIR 1
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $0F,$AB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:AB
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $0A,$AC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:AC
	.DB $0F,$AE                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:AE
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $36,$C8                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:C8
	.DB $3A,$E4                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:E4
	.DB $0A,$A2                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:A2
	.DB $0E,$A8                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:A8
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $2F,$DA                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 3, TILE ID:DA
	.DB $33,$F0                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:F0
	.DB $35,$F2                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:F2
	.DB $38,$F8                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:F8
	.DB $3C,$FA                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:FA
	.DB $0A,$A3                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:A3
	.DB $0E,$A9                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:A9
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $2F,$DB                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 3, TILE ID:DB
	.DB $33,$F1                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:F1
	.DB $34,$F3                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:F3
	.DB $38,$F9                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:F9
	.DB $3C,$FB                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:FB
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_LEGS_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] PLAYER_RUNNING_TORSO_TWO_SPR_TILE_DATA

PLAYER_RUN_SPIKE_TD_TWO_SPR_TILE_DATA:                            ; PLAYER RUNNING HAND IN AIR 2 TILE DATA
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $36,$80                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:80
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $35,$E6                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:E6
	.DB $3A,$EC                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:EC
	.DB $3C,$EE                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:EE
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $35,$E7                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:E7
	.DB $39,$ED                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:ED
	.DB $3C,$EF                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:EF
	.DB $0A,$BC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:BC
	.DB $0E,$BE                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:BE
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3F,$C9                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:C9
	.DB $03,$CB                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:CB
	JUMP_SPRITE_SCRIPT[ADDR] PLAYER_RUNNING_SPIKE_TORSO_SPR_TILE_DATA


BALL_HIT_GROUND_SPIKE_ONE_SPR_TILE_DATA:                          ; BALL HIT GROUND TILES 1
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$C5                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:C5
	.DB $03,$C7                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:C7
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$D0                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:D0
	.DB $03,$D2                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:D2
	.DB $FF                                                       ; END

BALL_HIT_GROUND_SPIKE_TWO_SPR_TILE_DATA:                          ; BALL HIT GROUND TILES 2
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$C1                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:C1
	.DB $03,$C3                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:C3
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$C4                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:C4
	.DB $03,$C6                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:C6
	.DB $FF                                                       ; END

BALL_HIT_GROUND_SPIKE_THREE_SPR_TILE_DATA:                        ; BALL HIT GROUND TILES 3
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$95                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:95
	.DB $03,$97                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:97
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3F,$C0                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:C0
	.DB $03,$C2                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:C2
	.DB $FF                                                       ; END
	
_F}_RUSHING_TD_SCENE_SPR_TILE_DATA	

_F{_LARGE_HELMET_SPRITE_TILE_DATA

IND_LH_SPR_TILE_DATA:                                             ; INDY_LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$00                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:00
	.DB $01,$02                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:02
	.DB $05,$08                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:08
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $05,$09                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:09
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $01,$03                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $05,$0C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:0C
	.DB $FC,$3D                                                   ; SET SPR X OFFSET= -3 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$01                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:01
	.DB $FF                                                       ; END

BUF_LH_SPR_TILE_DATA:                                             ; BUF_LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $01,$06                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:6
	.DB $05,$0D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:0D
	.DB $09,$14                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:14
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$07                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:7
	.DB $05,$18                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:18
	.DB $09,$15                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:15
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $01,$12                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:12
	.DB $05,$19                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:19
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $01,$13                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:13
	.DB $05,$1C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:1C
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $01,$16                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:16
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$04                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:4
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$05                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:5
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$10                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:10
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3D,$11                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:11
	.DB $FF                                                       ; END

MIA_LH_SPR_TILE_DATA:                                             ; MIA_LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$0A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0A
	.DB $01,$20                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:20
	.DB $05,$22                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:22
	.DB $09,$28                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:28
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$0B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0B
	.DB $01,$21                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:21
	.DB $05,$23                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:23
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$0E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0E
	.DB $01,$24                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:24
	.DB $05,$26                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:26
	.DB $FF                                                       ; END

NE_LH_SPR_TILE_DATA:                                              ; NE_LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$25                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:25
	.DB $05,$27                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:27
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $01,$30                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:30
	.DB $05,$32                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:32
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $01,$31                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:31
	.DB $05,$33                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:33
	.DB $FC,$31                                                   ; SET SPR X OFFSET= 1 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0F
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$1A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1A
	.DB $FC,$34                                                   ; SET SPR X OFFSET= 4 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $39,$1B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:1B
	.DB $FF                                                       ; END

NYJ_LH_SPR_TILE_DATA:                                             ; NYJ LH LOGO TILE DATA
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$29                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:29
	.DB $01,$2B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2B
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$2C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:2C
	.DB $01,$2E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2E
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$2D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:2D
	.DB $01,$2F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2F
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$38                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:38
	.DB $01,$3A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:3A
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $39,$2A                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:2A
	.DB $FF                                                       ; END

CIN_LH_SPR_TILE_DATA:                                             ; CIN_LH_LOGO TILES
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $01,$1D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1D
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$17                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:17
	.DB $FF                                                       ; END

CLE_LH_SPR_TILE_DATA:                                             ; CLE_LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$3B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:3B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$3E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:3E
	.DB $01,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:3F
	.DB $FF                                                       ; END

HOU_LH_SPR_TILE_DATA:                                             ; HOU_LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $39,$1E                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:1E
	.DB $3D,$34                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:34
	.DB $01,$36                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:36
	.DB $05,$3C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3C
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $39,$1F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:1F
	.DB $3D,$35                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:35
	.DB $01,$37                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:37
	.DB $05,$3D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3D
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $05,$39                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:39
	.DB $FF                                                       ; END

PIT_LH_SPR_TILE_DATA:                                             ; PIT_LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$00                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:00
	.DB $01,$02                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:02
	.DB $05,$08                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:08
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$01                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:01
	.DB $01,$03                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $05,$09                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:09
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$04                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:04
	.DB $01,$06                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:06
	.DB $05,$0C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:0C
	.DB $FC,$36                                                   ; SET SPR X OFFSET= 6 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$0A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0A
	.DB $FF                                                       ; END

DEN_LH_SPR_TILE_DATA:                                             ; DEN_LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$07                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:07
	.DB $05,$0D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:0D
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $01,$12                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:12
	.DB $05,$18                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:18
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $01,$13                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:13
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$05                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:05
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$10                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:10
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$11                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:11
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3D,$14                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:14
	.DB $FF                                                       ; END

KC_LH_SPR_TILE_DATA:                                              ; KC_LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $01,$0B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:0B
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$0E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:0E
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $01,$0F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:0F
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $01,$1A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1A
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3D,$0A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0A
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$20                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:20
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$21                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:21
	.DB $FC,$34                                                   ; SET SPR X OFFSET= 4 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $05,$24                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:24
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $05,$25                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:25
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $05,$30                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:30
	.DB $FF                                                       ; END

OAK_LH_SPR_TILE_DATA:                                             ; OAK_LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$16                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:16
	.DB $01,$19                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:19
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$17                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:17
	.DB $01,$1C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1C
	.DB $05,$1E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:1E
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$15                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:15
	.DB $01,$1D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1D
	.DB $05,$1F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:1F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3D,$0A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0A
	.DB $FF                                                       ; END

SD_LH_SPR_TILE_DATA:                                              ; SD LH_LOGO TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $01,$00                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:00
	.DB $05,$02                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:02
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $01,$01                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:01
	.DB $FC,$2F                                                   ; SET SPR Y OFFSET= -1 PIXELS
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $05,$03                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $09,$09                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:09
	.DB $FC,$2F                                                   ; SET SPR Y OFFSET= -1 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $01,$04                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:04
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$05                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:05
	.DB $FC,$24                                                   ; SET SPR Y OFFSET= 4 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $01,$06                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:06
	.DB $05,$0C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:0C
	.DB $FF                                                       ; END

SEA_LH_SPR_TILE_DATA:                                             ;SEA LH LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$0D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0D
	.DB $01,$07                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:07
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$10                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:10
	.DB $01,$12                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:12
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$11                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:11
	.DB $01,$13                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:13
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$14                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:14
	.DB $01,$16                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:16
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3D,$15                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:15
	.DB $01,$17                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:17
	.DB $FF                                                       ; END

DAL_LH_SPR_TILE_DATA:                                             ; DALLAS LH LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $01,$29                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:29
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$0A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0A
	.DB $01,$20                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:20
	.DB $05,$22                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:22
	.DB $09,$28                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:28
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$0B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0B
	.DB $01,$21                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:21
	.DB $05,$23                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:23
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$0E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0E
	.DB $01,$24                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:24
	.DB $05,$26                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:26
	.DB $09,$08                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:8
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3D,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0F
	.DB $01,$25                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:25
	.DB $FF                                                       ; END

NYG_LH_SPR_TILE_DATA:                                             ; NYG_LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $01,$2C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2C
	.DB $05,$2E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:2E
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$27                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:27
	.DB $01,$2D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2D
	.DB $05,$2F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:2F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3D,$2A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:2A
	.DB $FC,$2E                                                   ; SET SPR Y OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$38                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:38
	.DB $05,$3A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3A
	.DB $FC,$22                                                   ; SET SPR Y OFFSET= 2 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $39,$2B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:2B
	.DB $3D,$39                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:39
	.DB $01,$3B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:3B
	.DB $FF                                                       ; END

PHI_LH_SPR_TILE_DATA:                                             ; PHI LH_LOGO TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $3D,$18                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:18
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$19                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:19
	.DB $01,$1B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$1C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1C
	.DB $01,$1E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1E
	.DB $05,$1A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:1A
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $01,$1D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1D
	.DB $05,$1F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:1F
	.DB $FC,$25                                                   ; SET SPR Y OFFSET= 5 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$30                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:30
	.DB $01,$32                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:32
	.DB $FF                                                       ; END

PHX_LH_SPR_TILE_DATA:                                             ; PHX LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$31                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:31
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$34                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:34
	.DB $01,$36                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:36
	.DB $05,$3C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3C
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$35                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:35
	.DB $01,$37                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:37
	.DB $05,$3D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3D
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$33                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:33
	.DB $01,$3E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:3E
	.DB $05,$3F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3F
	.DB $FF                                                       ; END

WAS_LH_SPR_TILE_DATA:                                             ; WAS LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$22                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:22
	.DB $01,$28                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:28
	.DB $05,$2A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:2A
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$23                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:23
	.DB $01,$29                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:29
	.DB $05,$2B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:2B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$26                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:26
	.DB $01,$2C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2C
	.DB $05,$2E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:2E
	.DB $FC,$31                                                   ; SET SPR X OFFSET= 1 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $09,$2F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:2F
	.DB $FC,$3F                                                   ; SET SPR X OFFSET= -1 PIXELS
	.DB $FC,$23                                                   ; SET SPR Y OFFSET= 3 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$27                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:27
	.DB $01,$2D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2D
	.DB $FF                                                       ; END

CHI_LH_SPR_TILE_DATA:                                             ; CHI LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$32                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:32
	.DB $01,$38                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:38
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$33                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:33
	.DB $01,$39                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:39
	.DB $05,$3B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$36                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:36
	.DB $01,$3C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:3C
	.DB $05,$3E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3E
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$3A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:3A
	.DB $FF                                                       ; END

DET_LH_SPR_TILE_DATA:                                             ; DET LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$0D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0D
	.DB $01,$18                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:18
	.DB $05,$39                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:39
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $39,$10                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:10
	.DB $3D,$12                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:12
	.DB $01,$19                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:19
	.DB $05,$3C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3C
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $39,$11                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:11
	.DB $3D,$13                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:13
	.DB $01,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1F
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3D,$14                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:14
	.DB $01,$15                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:15
	.DB $FC,$2F                                                   ; SET SPR Y OFFSET= -1 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $01,$05                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:5
	.DB $FF                                                       ; END

GB_LH_SPR_TILE_DATA:                                              ; GB LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$10                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:10
	.DB $01,$12                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:12
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$11                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:11
	.DB $01,$13                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:13
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$14                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:14
	.DB $01,$16                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:16
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$15                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:15
	.DB $01,$17                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:17
	.DB $FC,$31                                                   ; SET SPR X OFFSET= 1 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $05,$0D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:0D
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $05,$18                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:18
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $05,$19                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:19
	.DB $FF                                                       ; END

MIN_LH_SPR_TILE_DATA:                                             ; MIN LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$1A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1A
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$1B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1B
	.DB $01,$31                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:31
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$1E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1E
	.DB $01,$34                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:34
	.DB $05,$30                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:30
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $39,$1C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:1C
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $39,$1D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:1D
	.DB $FC,$2C                                                   ; SET SPR Y OFFSET= -4 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $3D,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0F
	.DB $FC,$23                                                   ; SET SPR Y OFFSET= 3 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$1F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1F
	.DB $01,$35                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:35
	.DB $FF                                                       ; END

TB_LH_SPR_TILE_DATA:                                              ; TB LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$20                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:20
	.DB $01,$22                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:22
	.DB $09,$2A                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:2A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$21                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:21
	.DB $01,$23                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:23
	.DB $09,$2B                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:2B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$2C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:2C
	.DB $01,$2E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2E
	.DB $09,$2F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:2F
	.DB $FC,$3D                                                   ; SET SPR X OFFSET= -3 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $05,$28                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:28
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $05,$29                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:29
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $05,$2D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:2D
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $05,$38                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:38
	.DB $FF                                                       ; END

ATL_LH_SPR_TILE_DATA:                                             ; ATL LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$27                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:27
	.DB $01,$2D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2D
	.DB $05,$2F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:2F
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$32                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:32
	.DB $01,$38                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:38
	.DB $05,$3A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$33                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:33
	.DB $01,$39                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:39
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$36                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:36
	.DB $01,$3C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:3C
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $09,$25                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:25
	.DB $FF                                                       ; END

RAM_LH_SPR_TILE_DATA:                                             ; RAM LH_LOGO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$1B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1B
	.DB $01,$31                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:31
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$35                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:35
	.DB $01,$37                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:37
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$3D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:3D
	.DB $01,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:3F
	.DB $FC,$2F                                                   ; SET SPR Y OFFSET= -1 PIXELS
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $01,$34                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:34
	.DB $FF                                                       ; END

NO_LH_SPR_TILE_DATA:                                              ; NO LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$33                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:33
	.DB $01,$34                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:34
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $39,$36                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:36
	.DB $3D,$35                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:35
	.DB $01,$37                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:37
	.DB $05,$3D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:3D
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $39,$3F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:3F
	.DB $3D,$16                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:16
	.DB $01,$1C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1C
	.DB $05,$1E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:1E
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$17                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:17
	.DB $01,$1D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1D
	.DB $FF                                                       ; END

SF_LH_SPR_TILE_DATA:                                              ; SF LH_LOGO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$0E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0E
	.DB $01,$24                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:24
	.DB $05,$26                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:26
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0F
	.DB $01,$25                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:25
	.DB $05,$27                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:27
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$1A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1A
	.DB $01,$30                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:30
	.DB $05,$32                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:32
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$1B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1B
	.DB $01,$31                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:31
	.DB $FF                                                       ; END

FACEMASK_LH_SPR_TILE_DATA:                                        ; FACEMASK TILES
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3C,$42                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:42
	.DB $00,$48                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:48
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3C,$43                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:43
	.DB $00,$49                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:49
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $00,$4C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:4C
	.DB $08,$46                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:46
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $00,$40                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:40
	.DB $08,$47                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:47
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $38,$41                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:41
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $38,$44                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:44
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $04,$4A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:4A
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $04,$4B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:4B
	.DB $FF                                                       ; END

_F}_LARGE_HELMET_SPRITE_SCRIPT_DATA

_F{_LINEMAN_INTRO_SPRITE_TILE_DATA


LINEMAN_INTRO_ONE_SPR_TILE_DATA:                                  ; 3PT LINEMAN SNAP 1 INTRO TILES
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $0F,$21                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:21
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $0B,$2D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:2D
	.DB $0F,$2F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:2F
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $07,$26                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:26
	.DB $0B,$2C                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:2C
	.DB $0F,$2E                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:2E
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$0A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0A
	.DB $01,$20                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:20
	.DB $05,$22                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:22
	.DB $09,$28                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:28
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $30,$00                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:00
	.DB $34,$02                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:02
	.DB $39,$08                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:08
	.DB $3D,$0B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0B
	.DB $05,$23                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:23
	.DB $09,$29                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:29
	.DB $0D,$2B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:2B
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $30,$01                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:01
	.DB $34,$03                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:03
	.DB $39,$09                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:09
	.DB $0D,$2A                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:2A
	.DB $FF                                                       ; END

LINEMAN_INTRO_TWO_SPR_TILE_DATA:                                  ; 3PT LINEMAN SNAP 2 INTRO TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $0F,$3A                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:3A
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $0F,$3B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:3B
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $01,$0F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:0F
	.DB $05,$25                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:25
	.DB $09,$27                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:27
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $34,$04                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:04
	.DB $38,$06                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:06
	.DB $3D,$0C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0C
	.DB $01,$0E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:0E
	.DB $05,$24                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:24
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $34,$05                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:05
	.DB $38,$07                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:07
	.DB $3D,$0D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:0D
	.DB $FF                                                       ; END

LINEMAN_INTRO_THREE_SPR_TILE_DATA:                                ; 3PT LINEMAN SNAP 3 INTRO TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3D,$14                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:14
	.DB $02,$16                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:16
	.DB $06,$1C                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:1C
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $34,$10                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:10
	.DB $38,$12                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:12
	.DB $3E,$18                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:18
	.DB $02,$1A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:1A
	.DB $06,$30                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:30
	.DB $0A,$32                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:32
	.DB $0E,$38                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:38
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $34,$11                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:11
	.DB $38,$13                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:13
	.DB $3E,$19                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:19
	.DB $02,$1B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:1B
	.DB $0A,$33                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:33
	.DB $0E,$39                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:39
	.DB $FF                                                       ; END

_F}_LINEMAN_INTRO_SPRITE_SCRIPT_DATA

_F{_INJURED_PLAYER_SPRITE_TILE_DATA

CARRY_INJURED_PLAYER_SPR_TILE_DATA:                               ; CARRYING INJURED PLAYER TILES
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $31,$C1                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:C1
	.DB $37,$DC                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:0DC
	.DB $35,$C3                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:C3
	.DB $3B,$D7                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:D7
	.DB $39,$C9                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:C9
	.DB $3C,$CB                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:CB
	.DB $03,$E1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:E1
	.DB $07,$E3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:E3
	.DB $0B,$E9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:E9
	.DB $0D,$EB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:EB
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $31,$C0                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:C0
	.DB $37,$D9                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:D9
	.DB $35,$C2                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:C2
	.DB $3B,$DB                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:DB
	.DB $39,$C8                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:C8
	.DB $3F,$CA                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:CA
	.DB $03,$E0                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:E0
	.DB $07,$E2                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:E2
	.DB $0B,$E8                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:E8
	.DB $0F,$EA                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:EA
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $39,$F3                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:F3
	.DB $3F,$C5                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:C5
	.DB $01,$D4                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:D4
	.DB $05,$D6                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:D6
	.DB $0F,$F1                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:F1
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $3F,$C4                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:C4
	.DB $01,$D1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:D1
	.DB $05,$D3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:D3
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $37,$C6                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:C6
	.DB $3B,$CC                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:CC
	.DB $3F,$CE                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:CE
	.DB $03,$E4                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:E4
	.DB $07,$E6                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:E6
	.DB $09,$EC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:EC
	.DB $0D,$EE                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:EE
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $34,$C7                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:C7
	.DB $3B,$CD                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:CD
	.DB $3F,$CF                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:CF
	.DB $03,$E5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:E5
	.DB $07,$E7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:E7
	.DB $0B,$ED                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:ED
	.DB $0F,$EF                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:EF
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $34,$D2                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:D2
	.DB $38,$D8                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:D8
	.DB $3C,$D0                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:D0
	.DB $3C,$D0                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:D0
	.DB $00,$D5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:D5
	.DB $03,$F0                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:F0
	.DB $07,$83                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:83
	.DB $0B,$F8                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:F8
	.DB $0F,$FA                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:FA
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $07,$F2                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:F2
	.DB $0B,$F9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:F9
	.DB $0F,$FB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:FB
	.DB $FF                                                       ; END

_F}_INJURED_PLAYER_SPRITE_TILE_DATA

_F{_NFL_LOGO_SPRITE_TILE_DATA

NFL_LOGO_SPR_TILE_DATA:                                           ; NFL LOGO TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $06,$B4                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:B4
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3A,$3F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:3F
	.DB $3E,$B1                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:B1
	.DB $02,$B3                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:B3
	.DB $06,$B6                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:B6
	.DB $0A,$B5                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:B5
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $36,$3D                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:3D
	.DB $3A,$62                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:62
	.DB $3E,$68                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:68
	.DB $02,$63                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:63
	.DB $06,$66                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:66
	.DB $0A,$67                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:67
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3A,$70                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:70
	.DB $02,$72                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:72
	.DB $06,$73                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:73
	.DB $0A,$74                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:74
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3A,$71                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:71
	.DB $02,$76                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:76
	.DB $06,$75                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:75
	.DB $0A,$77                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:77
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $02,$37                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:37
	.DB $FC,$21                                                   ; SET SPR Y OFFSET= 1 PIXELS
	.DB $FC,$35                                                   ; SET SPR X OFFSET= 5 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $02,$37                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:37
	.DB $FC,$22                                                   ; SET SPR Y OFFSET= 2 PIXELS
	.DB $FC,$33                                                   ; SET SPR X OFFSET= 3 PIXELS
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3E,$37                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:37
	.DB $FF                                                       ; END

_F}_NFL_LOGO_SPRITE_TILE_DATA

_F{_LT_OVER_PLAYER_SPRITE_TILE_DATA

LT_OVER_PLAYER_ONE_SPR_TILE_DATA:                                 ; LT STANDING OVER PLAYER 3 (INTRO) TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $01,$43                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:43
	.DB $07,$45                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:45
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $03,$69                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:69
	.DB $3D,$73                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:73
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$6B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:6B
	.DB $03,$6F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:6F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $02,$F9                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:F9
	.DB $07,$FD                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:FD
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $0B,$FF                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:0FF
	.DB $FC,$28                                                   ; SET SPR Y OFFSET= -8 PIXELS
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $0D,$BB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:BB
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $06,$41                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:41
	.DB $0B,$BF                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:BF
	.DB $0F,$BD                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:BD
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $38,$49                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:49
	.DB $3C,$47                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:47
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $38,$4D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4D
	.DB $3C,$4B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:4B
	.DB $01,$4F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:4F
	.DB $02,$61                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:61
	.DB $07,$65                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:65
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $38,$63                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:63
	.DB $3C,$67                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:67
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $38,$6D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:6D
	.DB $3C,$79                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:79
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $38,$7B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:7B
	.DB $3C,$E3                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:E3
	.DB $01,$E7                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:E7
	.DB $03,$F3                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:F3
	.DB $07,$F7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:F7
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $38,$E9                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:E9
	.DB $3C,$ED                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:ED
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $06,$EB                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:EB
	.DB $0B,$EF                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:EF
	.DB $0F,$FB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:FB
	.DB $FF                                                       ; END

LT_OVER_PLAYER_TWO_SPR_TILE_DATA:                                 ; LT STANDING OVER PLAYER FILL MATERIAL (INTRO) TILES
	.DB $FC,$21                                                   ; SET SPR Y OFFSET= 1 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $03,$A9                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:A9
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $03,$AB                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:AB
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $03,$AD                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:AD
	.DB $FC,$29                                                   ; SET SPR Y OFFSET= -7 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $03,$AF                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:AF
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $03,$B9                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:B9
	.DB $FF                                                       ; END

_F}_LT_OVER_PLAYER_SPRITE_TILE_DATA

_F{_LEADING_SACK_SPR_TILE_DATA

LEADING_SACK_SPR_TILE_DATA:                                       ; DIVING DEFENDER FOR SACK LEADERS TILES
																; DRAW FEET
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $0C,$6D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:6D
	.DB $10,$6B                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:6B
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $08,$72                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:72
	.DB $0C,$78                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:78
	.DB $10,$6E                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:6E
	.DB $85                                                       ; SET SPRITE X OFFSET = 5 TILES
	.DB $08,$73                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:73
	.DB $0C,$79                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:79
	JUMP_SPRITE_SCRIPT[ADDR] DIVING_DEFENDER_BODY_SPR_TILE_DATA
	
_F}_LEADING_SACK_SPR_TILE_DATA	

_F{_KICKOFF_ARM_P2_SPR_TILE_DATA

KICKOFF_ARM_SPR_TILE_DATA:                                        ; KICKOFF ARM IN AIR P2 TILES
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $24,$D0                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 0, TILE ID:D0
	.DB $28,$D2                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:D2
	.DB $2C,$D8                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:D8
	.DB $31,$DA                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:DA
	.DB $35,$F0                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:F0
	.DB $39,$F2                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:F2
	.DB $3C,$F8                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:F8
	.DB $00,$CA                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:CA
	.DB $04,$E0                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:E0
	.DB $08,$E2                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:E2
	.DB $0E,$E8                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:E8
	.DB $12,$EA                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:EA
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $28,$D3                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:D3
	.DB $2C,$D9                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:D9
	.DB $31,$DB                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:DB
	.DB $35,$F1                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:F1
	.DB $39,$F3                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:F3
	.DB $3C,$F9                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:F9
	.DB $00,$CB                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:CB
	.DB $04,$E1                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:E1
	.DB $08,$E3                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:E3
	.DB $0C,$E9                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:E9
	.DB $12,$EB                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:EB
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $31,$DE                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:DE
	.DB $35,$F4                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:F4
	.DB $3A,$F6                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:F6
	.DB $3C,$FC                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:FC
	.DB $00,$CE                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:CE
	.DB $04,$E4                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:E4
	.DB $08,$E6                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:E6
	.DB $0C,$EC                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:EC
	.DB $10,$EE                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:EE
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3C,$D1                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:D1
	.DB $00,$CF                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:CF
	.DB $04,$E5                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:E5
	.DB $08,$E7                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:E7
	.DB $0C,$ED                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:ED
	.DB $10,$EF                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:EF
	.DB $FC,$23                                                   ; SET SPR Y OFFSET= 3 PIXELS
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $04,$D6                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:D6
	.DB $08,$DC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:DC
	.DB $FF                                                       ; END
	
_F}_KICKOFF_ARM_P2_SPR_TILE_DATA	

_F{_PLAYER_COMING_UP_TO_SPIKE_SPR_TILE_DATA

PLAYER_COMING_UP_TO_SPIKE_SPR_TILE_DATA:                          ; PLAYER COMING UP TO SPIKE BALL TD TILES
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $0A,$91                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:91
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $04,$97                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:97
	.DB $08,$99                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:99
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $38,$9D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:9D
	.DB $3C,$9B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:9B
	.DB $02,$9F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:9F
	.DB $04,$B1                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:0B1
	.DB $08,$B5                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:0B5
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $38,$B3                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:0B3
	.DB $3C,$B7                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0B7
	.DB $02,$B9                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:0B9
	.DB $04,$BD                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:0BD
	.DB $08,$BB                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:0BB
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3E,$8F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:8F
	.DB $02,$A5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:A5
	.DB $04,$BD                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:BD
	.DB $08,$A7                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:A7
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $37,$AD                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:AD
	.DB $3B,$AF                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:AF
	.DB $02,$75                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:75
	.DB $04,$77                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:77
	.DB $08,$7D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:7D
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $37,$7B                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3, TILE ID:7B
	.DB $3B,$7F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:7F
	.DB $01,$D5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:D5
	.DB $05,$D7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:D7
	.DB $08,$DD                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:DD
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $01,$DF                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:DF
	.DB $05,$F5                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:F5
	.DB $FC,$28                                                   ; SET SPR Y OFFSET= -8 PIXELS
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $0A,$95                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:95
	.DB $0E,$93                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:93
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3B,$BF                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:BF
	.DB $3D,$8B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:8B
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $05,$F7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:0F7
	.DB $FC,$2B                                                   ; SET SPR Y OFFSET= -5 PIXELS
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $3B,$FD                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:0FD
	.DB $FF                                                       ; END
	
_F}_PLAYER_COMING_UP_TO_SPIKE_SPR_TILE_DATA	

_F{_HUG_JUMPING_PLAYER_SPRITE_TILE_DATA

HUG_JUMPING_PLAYER_ONE_SPR_TILE_DATA:                             ; HOLDING JUMPING PLAYER RUSHING TD ANIMATION TILES 1
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $38,$89                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:89
	.DB $3C,$8B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:8B
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $38,$82                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:82
	.DB $3C,$88                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:88
	.DB $00,$8A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:8A
	.DB $04,$A0                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:A0
	.DB $0A,$A2                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:A2
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $35,$81                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:81
	.DB $3A,$83                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:83
	.DB $3C,$A1                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:A1
	.DB $00,$A1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A1
	.DB $04,$A1                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:A1
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $36,$84                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:84
	.DB $3A,$86                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:86
	.DB $3C,$A1                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:A1
	.DB $00,$8E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:8E
	.DB $04,$A4                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:A4
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3A,$87                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:87
	.DB $3C,$8D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:8D
	.DB $00,$8F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:8F
	.DB $12,$AF                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:AF
	JUMP_SPRITE_SCRIPT[ADDR] HOLDING_PLAYER_BOTTOM_TORSO_SPR_TILE_DATA

HUG_JUMPING_PLAYER_TWO_SPR_TILE_DATA:                             ; HOLDING JUMPING PLAYER RUSHING TD ANIMATION TILES 2
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $34,$85                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:85
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $34,$90                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:90
	.DB $38,$92                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:92
	.DB $3C,$98                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:98
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $38,$93                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:93
	.DB $3C,$99                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:99
	.DB $00,$9B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:9B
	.DB $04,$91                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:91
	.DB $0A,$80                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:80
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $34,$94                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:94
	.DB $38,$96                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:96
	.DB $3C,$9C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:9C
	.DB $00,$A1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A1
	.DB $04,$9E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:9E
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $36,$95                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:95
	.DB $3A,$97                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:97
	.DB $3C,$9D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:9D
	.DB $00,$A1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A1
	.DB $04,$9F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:9F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $36,$C0                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:C0
	.DB $3A,$C2                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:C2
	.DB $3C,$C8                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:C8
	.DB $00,$CA                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:CA
	JUMP_SPRITE_SCRIPT[ADDR] HOLDING_PLAYER_BOTTOM_TORSO_SPR_TILE_DATA

HUG_JUMPING_PLAYER_THREE_SPR_TILE_DATA:                           ; HOLDING JUMPING PLAYER RUSHING TD ANIMATION TILES 3
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $38,$B3                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:B3
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $30,$9A                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:9A
	.DB $38,$B2                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:B2
	.DB $3C,$B8                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:B8
	.DB $00,$BA                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:BA
	.DB $04,$91                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:91
	.DB $0A,$80                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:80
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $30,$B9                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:0B9
	.DB $38,$96                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:96
	.DB $3C,$9C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:9C
	.DB $00,$A1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A1
	.DB $04,$9E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:9E
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3A,$97                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:97
	.DB $3C,$9D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:9D
	.DB $00,$A1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:0A1
	.DB $04,$9F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:9F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3A,$A5                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:A5
	.DB $3C,$A7                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:A7
	.DB $00,$AD                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:AD
	.DB $FC,$34                                                   ; SET SPR X OFFSET= 4 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $34,$B1                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:B1
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $34,$B0                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:B0
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $36,$BB                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:BB
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $36,$F7                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:F7
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	JUMP_SPRITE_SCRIPT[ADDR] HOLDING_PLAYER_BOTTOM_TORSO_SPR_TILE_DATA

_F}_HUG_JUMPING_PLAYER_SPRITE_TILE_DATA

_F{_JUMPING_HAND_IN_AIR_AFTER_TD_SPRITE_TILE_DATA

JUMPING_HAND_IN_AIR_AFTER_TD_ONE_SPR_TILE_DATA:                   ; PLAYER JUMPING HOLDING HAND IN AIR TILES 1
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $33,$8C                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:8C
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $33,$CC                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:CC
	.DB $34,$E1                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:E1
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $34,$E4                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:E4
	.DB $38,$C1                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:C1
	JUMP_SPRITE_SCRIPT[ADDR] HOLDING_JUMPING_PLAYER_MAIN_SPR_TILE_DATA

JUMPING_HAND_IN_AIR_AFTER_TD_TWO_SPR_TILE_DATA:                   ; PLAYER JUMPING HOLDING HAND IN AIR TILES 2
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $2B,$E0                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 3, TILE ID:E0
	.DB $2F,$E2                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 3, TILE ID:E2
	.DB $30,$E8                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:E8
	.DB $34,$EA                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:EA
	.DB $38,$BF                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:BF
	JUMP_SPRITE_SCRIPT[ADDR] HOLDING_JUMPING_PLAYER_MAIN_SPR_TILE_DATA
	
_F}_JUMPING_HAND_IN_AIR_AFTER_TD_TILE_DATA	

_F{_PLAYER_NUM_ONE_HAND_SPRITE_TILE_DATA

PLAYER_NUM_ONE_HAND_ONE_SPR_TILE_DATA:                            ; PLAYER RUNNING HAND IN AIR #1 SIGN (CREDITS) TILES 1
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $0A,$AC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:AC
	.DB $0F,$AE                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:AE
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0A,$A2                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:A2
	.DB $0E,$A8                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:A8
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0A,$A3                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:A3
	.DB $0E,$A9                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:A9
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $34,$84                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:84
	.DB $38,$86                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:86
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_HEAD_ARM_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] PLAYER_RUNNING_TORSO_TWO_SPR_TILE_DATA

PLAYER_NUM_ONE_HAND_TWO_SPR_TILE_DATA:                            ; PLAYER RUNNING HAND IN AIR #1 SIGN (CREDITS) TILES 2
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3C,$8F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:8F
	.DB $00,$A5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A5
	.DB $06,$A7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:A7
	.DB $0A,$AD                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:AD
	.DB $0E,$AF                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:AF
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3A,$98                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:98
	.DB $3C,$9A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:9A
	.DB $00,$B0                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B0
	.DB $06,$B2                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:B2
	.DB $0A,$B8                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:B8
	.DB $0E,$BA                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:BA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $00,$B1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B1
	.DB $06,$B3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:B3
	.DB $0A,$B9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:B9
	.DB $0E,$BB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:BB
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $00,$B4                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:0B4
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_HEAD_ARM_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] PLAYER_RUNNING_SHOULDER_ARM_SPR_TILE_DATA
	
_F}_PLAYER_NUM_ONE_HAND_SPRITE_TILE_DATA	

_F{_PLAYER_RUNNING_AFTER_PASSING_TD_SPR_TILE_DATA

PLAYER_RUNNING_AFTER_TD_ONE_SPR_TILE_DATA:                        ; PLAYER RUNNING 2 TILES 1
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $0A,$91                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:91
	.DB $0F,$A6                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:A6
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0A,$8D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:8D
	.DB $0E,$8D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:8D
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0A,$94                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:94
	.DB $0E,$93                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:93
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $34,$84                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:84
	.DB $38,$86                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:86
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_HEAD_ARM_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] PLAYER_RUNNING_TORSO_TWO_SPR_TILE_DATA

PLAYER_RUNNING_AFTER_TD_TWO_SPR_TILE_DATA:                        ; PLAYER RUNNING 2 TILES 2
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $38,$9F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:9F
	.DB $3C,$B5                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:B5
	.DB $00,$B6                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B6
	.DB $06,$B7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:B7
	.DB $0A,$BD                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:BD
	.DB $0E,$BF                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:BF
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3A,$CA                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:CA
	.DB $3C,$E0                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:E0
	.DB $00,$B0                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B0
	.DB $06,$E2                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:E2
	.DB $0A,$8D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:8D
	.DB $0E,$EA                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:EA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $00,$E1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:E1
	.DB $06,$E3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:E3
	.DB $0A,$E9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:E9
	.DB $0E,$EB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:EB
	DO_SUBROUTINE[ADDR] PLAYER_RUNNING_HEAD_ARM_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] PLAYER_RUNNING_SHOULDER_ARM_SPR_TILE_DATA
	
_F}_PLAYER_RUNNING_AFTER_PASSING_TD_SPR_TILE_DATA	

_F{_UNUSED_FOUR_BY_5_BLANK_SPR_TILE_DATA

UNUSED_FOUR_BY_5_BLANK_SPR_TILE_DATA:                             ; 4X5 TRIGGER 8 SPRITE LIMIT WITH BLANK TILES *** unused
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $30,$3F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $0C,$3F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $FF                                                       ; END
	
_F}_UNUSED_FOUR_BY_5_BLANK_SPR_TILE_DATA	

_F{_LEADING_RETURNER_SPR_TILE_DATA

LEADING_RETURNER_SPR_TILE_DATA:                                   ; PLAYER LANDING FROM CATCH FOOT TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $10,$7C                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:7C
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $10,$7D                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:7D
	.DB $14,$7F                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 0, TILE ID:7F
	JUMP_SPRITE_SCRIPT[ADDR] LANDING_CATCH_BODY_SPR_TILE_DATA
	
_F}_LEADING_RETURNER_SPR_TILE_DATA	

_F{_KICKING_CHEER_SPR_TILE_DATA

KICKING_CHEER_SIX_SPR_TILE_DATA:                                  ; KICKING CHEERLEADER TILES 6
	DO_SUBROUTINE[ADDR] FOOT_CHEER_SPR_TILE_DATA_SUB
	DO_SUBROUTINE[ADDR] KICKING_CHEER_HEAD_ARMS_POMS_OUT_SPR_TILE_DATA_SUB
	.DB $FC,$2C                                                   ; SET SPR Y OFFSET= -4 PIXELS
	JUMP_SPRITE_SCRIPT[ADDR] KICKING_CHEERLEADER_TORSO_SPR_TILE_DATA

KICKING_CHEER_THREE_SPR_TILE_DATA:                                ; KICKING CHEERLEADER TILES 3
	DO_SUBROUTINE[ADDR] FOOT_CHEER_SPR_TILE_DATA_SUB
	DO_SUBROUTINE[ADDR] KICKING_CHEER_HEAD_ARMS_POMS_IN_SPR_TILE_DATA_SUB
	.DB $FC,$2C                                                   ; SET SPR Y OFFSET= -4 PIXELS
	JUMP_SPRITE_SCRIPT[ADDR] KICKING_CHEERLEADER_TORSO_SPR_TILE_DATA

KICKING_CHEER_TWO_SPR_TILE_DATA:                                  ; KICKING CHEERLEADER TILES 2
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0D,$43                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:43
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0F,$45                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:45
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	DO_SUBROUTINE[ADDR] KICKING_CHEER_HEAD_ARMS_POMS_IN_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] KICKING_CHEERLEADER_TORSO_SPR_TILE_DATA

KICKING_CHEER_ONE_SPR_TILE_DATA:                                  ; KICKING CHEERLEADER TILES 1
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $06,$29                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:29
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$05                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:05
	.DB $06,$2F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:2F
	.DB $0B,$31                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:31
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0D,$43                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:43
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $06,$41                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:41
	.DB $0B,$33                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:33
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0F,$45                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:45
	DO_SUBROUTINE[ADDR] KICK_CHEER_POM_POM_ARMS_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] KICKING_CHEERLEADER_TORSO_SPR_TILE_DATA

KICKING_CHEER_FOUR_SPR_TILE_DATA:                                 ; KICKING CHEERLEADER TILES 4
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $01,$27                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:27
	.DB $06,$3B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:3B
	.DB $0D,$4D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:4D
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $06,$37                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:37
	.DB $FC,$3F                                                   ; SET SPR X OFFSET= -1 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0B,$3F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:3F
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0F,$3D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:3D
	DO_SUBROUTINE[ADDR] KICK_CHEER_POM_POM_ARMS_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] KICKING_CHEERLEADER_TORSO_SPR_TILE_DATA

KICKING_CHEER_FIVE_SPR_TILE_DATA:                                 ; KICKING CHEERLEADER TILES 5
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0D,$4D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:4D
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0F,$3D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:3D
	DO_SUBROUTINE[ADDR] KICKING_CHEER_HEAD_ARMS_POMS_OUT_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] KICKING_CHEERLEADER_TORSO_SPR_TILE_DATA
	
_F}_KICKING_CHEER_SPR_TILE_DATA	

_F{_CHEER_PANTY_SPR_TILE_DATA

CHEER_PANTY_ONE_SPR_TILE_DATA:                                    ; CHEELEADER PANTY ANIMATION TILES PART 1
.DB $9D                                                        ; SET SPRITE X OFFSET = -3 TILES
	.DB $06,$81                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:81
	.DB $08,$89                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:89
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $06,$83                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:83
	.DB $08,$8B                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:8B
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $06,$85                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:85
	.DB $08,$8D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:8D
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $06,$87                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:87
	.DB $08,$8F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:8F
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $06,$91                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:91
	DO_SUBROUTINE[ADDR] PANTY_CHEER_TOP_AND_ARMS_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] CHEERLEADER_HEAD_SPR_TILE_DATA

CHEER_PANTY_TWO_SPR_TILE_DATA:                                    ; CHEELEADER PANTY ANIMATION TILES PART 2
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $06,$81                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:81
	.DB $08,$89                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:89
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $06,$83                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:83
	.DB $08,$8B                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:8B
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $06,$9F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:9F
	.DB $08,$A7                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:A7
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $04,$99                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:99
	.DB $08,$77                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:77
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $06,$9D                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:9D
	DO_SUBROUTINE[ADDR] PANTY_CHEER_TOP_AND_ARMS_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] CHEERLEADER_HEAD_SPR_TILE_DATA

CHEER_PANTY_THREE_SPR_TILE_DATA:                                  ; CHEELEADER PANTY ANIMATION TILES PART 3
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $04,$39                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:39
	.DB $08,$3D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:3D
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $04,$3B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:3B
	.DB $08,$35                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:35
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $04,$E1                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:0E1
	.DB $08,$37                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:37
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $04,$E3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:0E3
	.DB $08,$77                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:77
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $04,$97                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:97
	DO_SUBROUTINE[ADDR] PANTY_CHEER_TOP_AND_ARMS_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] CHEERLEADER_HEAD_SPR_TILE_DATA
	
_F}_CHEER_PANTY_SPR_TILE_DATA	

_F{_PARACHUTER_SPR_TILE_DATA

PARACHUTER_ONE_SPR_SPR_TILE_DATA:                                 ; PARACHUTER FLOAT TILES 1
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0E,$B0                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:B0
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $0E,$B1                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:B1
	JUMP_SPRITE_SCRIPT[ADDR] PARACHUTER_BODY_SPR_TILE_DATA

PARACHUTER_TWO_SPR_SPR_TILE_DATA:                                 ; PARACHUTER FLOAT TILES 2
	.DB $FC,$2D                                                   ; SET SPR Y OFFSET= -3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0E,$B2                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:B2
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $0E,$B3                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:B3
	JUMP_SPRITE_SCRIPT[ADDR] PARACHUTER_BODY_SPR_TILE_DATA
	
_F}_PARACHUTER_SPR_TILE_DATA	

_F{_BOMJACK_CAPE_SPR_SPR_TILE_DATA

BOMJACK_CAPE_SPR_SPR_TILE_DATA:                                   ; PART OF CAPE FOR BOMBJACK TILES  *** could move to near other bombjack tile
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $00,$C7                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:C7
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $00,$C8                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:C8
	.DB $FF                                                       ; END
	
_F}_BOMJACK_CAPE_SPR_SPR_TILE_DATA	

_F{_BACK_OF_DEF_TACKLING_BARRY_SPR_TILE_DATA

BACK_OF_DEF_TACKLING_BARRY_SPR_TILE_DATA:                         ; BACK OF DEFENDER TACKLING BARRY TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $36,$62                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:62
	.DB $39,$68                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:68
	.DB $3D,$6A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:6A
	.DB $02,$44                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:44
	.DB $06,$46                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:46
	.DB $0C,$4F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:4F
	.DB $10,$75                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:75
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $2C,$44                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:44
	.DB $30,$60                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:60
	.DB $35,$69                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:69
	.DB $39,$69                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:69
	.DB $3D,$69                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:69
	.DB $02,$45                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:45
	.DB $06,$47                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:47
	.DB $08,$4C                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:4C
	.DB $0C,$5A                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:5A
	.DB $10,$76                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:76
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $2D,$4B                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1, TILE ID:4B
	.DB $30,$61                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:61
	.DB $35,$63                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:63
	.DB $39,$69                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:69
	.DB $3D,$69                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:69
	.DB $01,$50                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:50
	.DB $04,$52                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:52
	.DB $08,$4D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:4D
	.DB $0C,$5B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:5B
	.DB $10,$77                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:77
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $2D,$4E                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1, TILE ID:4E
	.DB $31,$64                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:64
	.DB $35,$66                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:66
	.DB $39,$6C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:6C
	.DB $3D,$6E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:6E
	.DB $01,$69                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:69
	.DB $04,$53                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:53
	.DB $08,$58                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:58
	.DB $0C,$5E                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:5E
	.DB $10,$7C                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:7C
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $31,$65                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:65
	.DB $35,$67                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:67
	.DB $39,$6D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:6D
	.DB $3D,$6F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:6F
	.DB $01,$51                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:51
	.DB $05,$56                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:56
	.DB $09,$59                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:59
	.DB $0C,$5F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:5F
	.DB $10,$7D                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:7D
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $31,$70                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:70
	.DB $35,$72                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:72
	.DB $39,$78                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:78
	.DB $3D,$7A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:7A
	.DB $01,$69                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:69
	.DB $05,$57                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:57
	.DB $09,$5C                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:5C
	.DB $0C,$71                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:71
	.DB $10,$69                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:69
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $36,$73                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:73
	.DB $3A,$79                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:79
	.DB $3E,$7B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:7B
	.DB $02,$54                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:54
	.DB $05,$55                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:55
	.DB $09,$5D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:5D
	.DB $0C,$74                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:74
	.DB $10,$7E                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:7E
	.DB $FF                                                       ; END
	
_F}_BACK_OF_DEF_TACKLING_BARRY_SPR_TILE_DATA	

_F{_SKY_STADIUM_INTRO_SPR_TILE_DATA

SKY_STADIUM_INTRO_SPR_TILE_DATA:                                  ; PART OF SKY AND STADIUM VERTICAL SCROLL (INTRO) TILES
	.DB $FC,$23                                                   ; SET SPR Y OFFSET= 3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $00,$B1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B1
	.DB $04,$BB                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:BB
	.DB $08,$B5                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:B5
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $00,$B1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B1
	.DB $04,$BB                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:BB
	.DB $08,$B7                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:B7
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $00,$B1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B1
	.DB $04,$BB                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:BB
	.DB $08,$B5                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:B5
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $00,$B1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B1
	.DB $04,$BB                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:BB
	.DB $08,$B7                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:B7
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $00,$B3                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B3
	.DB $04,$B9                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:B9
	.DB $89                                                       ; SET SPRITE X OFFSET = 9 TILES
	.DB $0A,$CD                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:CD
	.DB $FC,$22                                                   ; SET SPR Y OFFSET= 2 PIXELS
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $1D,$BD                                                   ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1, TILE ID:BD
	.DB $85                                                       ; SET SPRITE X OFFSET = 5 TILES
	.DB $1D,$BF                                                   ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1, TILE ID:BF
	.DB $86                                                       ; SET SPRITE X OFFSET = 6 TILES
	.DB $1D,$C1                                                   ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1, TILE ID:C1
	.DB $87                                                       ; SET SPRITE X OFFSET = 7 TILES
	.DB $1D,$C3                                                   ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1, TILE ID:C3
	.DB $88                                                       ; SET SPRITE X OFFSET = 8 TILES
	.DB $1D,$C9                                                   ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1, TILE ID:C9
	.DB $89                                                       ; SET SPRITE X OFFSET = 9 TILES
	.DB $1D,$CB                                                   ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1, TILE ID:CB
	.DB $8A                                                       ; SET SPRITE X OFFSET = 10 TILES
	.DB $1E,$C5                                                   ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 2, TILE ID:C5
	.DB $8B                                                       ; SET SPRITE X OFFSET = 11 TILES
	.DB $1E,$C7                                                   ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 2, TILE ID:C7
	.DB $8C                                                       ; SET SPRITE X OFFSET = 12 TILES
	.DB $1A,$CF                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2, TILE ID:CF
	.DB $8D                                                       ; SET SPRITE X OFFSET = 13 TILES
	.DB $1A,$E1                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2, TILE ID:0E1
	.DB $8E                                                       ; SET SPRITE X OFFSET = 14 TILES
	.DB $1A,$E3                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2, TILE ID:0E3
	.DB $8F                                                       ; SET SPRITE X OFFSET = 15 TILES
	.DB $1A,$E9                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2, TILE ID:0E9
	.DB $FF                                                       ; END
	
_F}_SKY_STADIUM_INTRO_SPR_TILE_DATA	

_F{_FLAGS_SCORE_INTRO_SPR_TILE_DATA

FLAGS_SCORE_INTRO_SPR_TILE_DATA:                                  ; FLAGS AND SCOREBOARD TILES (INTRO)
	.DB $FC,$23                                                   ; SET SPR Y OFFSET= 3 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $02,$CD                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:CD
	.DB $87                                                       ; SET SPRITE X OFFSET = 7 TILES
	.DB $02,$CD                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:CD
	.DB $8F                                                       ; SET SPRITE X OFFSET = 15 TILES
	.DB $02,$CD                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:CD
	.DB $FC,$21                                                   ; SET SPR Y OFFSET= 1 PIXELS
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $12,$F1                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0F1
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $12,$F3                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0F3
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $12,$F9                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0F9
	.DB $85                                                       ; SET SPRITE X OFFSET = 5 TILES
	.DB $12,$FB                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0FB
	.DB $FF                                                       ; END
	
_F}_FLAGS_SCORE_INTRO_SPR_TILE_DATA	

_F{_BLANK_TILES_HIDE_GLITCHES_SPR_TILE_DATA

BLANK_TILES_HIDE_GLITCHES_SPR_TILE_DATA:                          ; BLANK TILES TO HIDE SCROLLING GLITCHES
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $00,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $00,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $00,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $00,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $00,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $00,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $3C,$3F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $00,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $00,$3F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $FF                                                       ; END
	
_F}_BLANK_TILES_HIDE_GLITCHES_SPR_TILE_DATA	

_F{_JUMPING_PLAYER_STILL_SPR_TILE_DATA

JUMPING_PLAYER_STILL_SPR_TILE_DATA:                               ; JUMPING PLAYER NO ANIMATION
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $28,$73                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:73
	.DB $2C,$79                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:79
	.DB $30,$7B                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:7B
	.DB $36,$7A                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:7A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $28,$76                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:76
	.DB $2C,$7C                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:7C
	.DB $30,$7E                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:7E
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $28,$77                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:77
	.DB $31,$7F                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:7F
	DO_SUBROUTINE[ADDR] JUMPING_PLAYER_FEET_SPR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] PLAYER_TORSO_JUMP_SPR_TILE_DATA
	
_F}_JUMPING_PLAYER_STILL_SPR_TILE_DATA	

_F{_LEADING_WR_SPR_TILE_DATA

LEADING_WR_SPR_TILE_DATA:                                         ; PLAYER CATCHING FOR LEADING WR'S TILES
	DO_SUBROUTINE[ADDR] PLAYER_HANDS_NORMAL_CATCH_SPR_TILE_DATA_SUB
	DO_SUBROUTINE[ADDR] PLAYER_LEGS_LEADING_WR_TILE_DATA_SUB
	JUMP_SPRITE_SCRIPT[ADDR] NORMAL_CATCH_PLAYER_BODY_SPR_TILE_DATA

_F}_LEADING_WR_SPR_TILE_DATA

_F{_LEADING_PUNTER_SPR_TILE_DATA

LEADING_PUNTER_SPR_TILE_DATA:                                     ; LEADING PUNTER TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $10,$E0                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:E0
	.DB $14,$E2                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 0, TILE ID:E2
	.DB $18,$E8                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 0, TILE ID:E8
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $10,$EA                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:EA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $10,$F0                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:F0
	.DB $14,$F2                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 0, TILE ID:F2
	.DB $18,$F8                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 0, TILE ID:F8
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $18,$FA                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 0, TILE ID:FA
	JUMP_SPRITE_SCRIPT[ADDR] LEADING_PUNTER_BODY_SPR_TILE_DATA
	
_F}_LEADING_PUNTER_SPR_TILE_DATA	

_F{_LEADING_INT_SPR_TILE_DATA

LEADING_INT_SPR_TILE_DATA:                                        ; INTERCEPTION LEADER TILES
	DO_SUBROUTINE[ADDR] HEAD_AND_ARMS_INT_LEADERS_SPR_TILE_DATA_SUB
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0C,$CA                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:CA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0C,$CB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:CB
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $0C,$CE                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:CE
	.DB $10,$E4                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:E4
	.DB $14,$E1                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 0, TILE ID:E1
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $10,$C4                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:C4
	.DB $14,$C6                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 0, TILE ID:C6
	JUMP_SPRITE_SCRIPT[ADDR] BODY_INT_LEADERS_SPR_TILE_DATA
	
_F}_LEADING_INT_SPR_TILE_DATA	

_F{_UNUSED_BAAC_SPR_TILE_DATA

UNUSED_BAAC_SPR_TILE_DATA:                                        ; *** UNUSED
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $00,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $00,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $00,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $00,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $00,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $00,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $FF                                                       ; END
	
_F}_UNUSED_BAAC_SPR_TILE_DATA	

_F{_LEADING_SCORERS_SPR_TILE_DATA

LEADING_SCORES_SPR_TILE_DATA:                                     ; LEADING SCORERS KICKER TILE DATA
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0C,$28                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:28
	.DB $10,$2A                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:2A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $10,$2B                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:2B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $00,$0A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:0A
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $3C,$0E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0E
	.DB $00,$0B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:0B
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $3C,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0F
	JUMP_SPRITE_SCRIPT[ADDR] KICKER_PUNTER_BODY_SPR_TILE_DATA
	
_F}_LEADING_SCORERS_SPR_TILE_DATA	

_F{_LEADING_INT_BALL_SPR_TILE_DATA

INT_LEADERS_BALL_SPR_TILE_DATA:                                   ; BALL FOR INTERCEPTIONS LEADERS ***  could move to after leading int
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $03,$3A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:3A
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $43,$3A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:3A
	.DB $FF                                                       ; END

_F}_LEADING_INT_BALL_SPR_TILE_DATA	

_F{_DIVING_PLAYER_BODY_SPR_TILE_DATA

DIVING_PLAYER_BODY_SPR_TILE_DATA:                                 ; DIVING PLAYER BODY + HELMET TILE DATA
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $0F,$2A                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:2A
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $0A,$29                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:29
	.DB $0E,$2B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:2B
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $06,$26                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:26
	.DB $0A,$2C                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:2C
	.DB $0E,$2E                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:2E
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $38,$12                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:12
	.DB $3C,$0F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0F
	.DB $00,$25                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:25
	.DB $06,$27                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:27
	.DB $0A,$2D                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:2D
	.DB $0E,$2F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:2F
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $38,$18                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:18
	.DB $3C,$1A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:1A
	.DB $00,$30                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:30
	.DB $06,$32                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:32
	.DB $0A,$38                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:38
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $35,$13                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:13
	.DB $39,$19                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:19
	.DB $3C,$1B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:1B
	.DB $00,$31                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:31
	.DB $06,$33                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:33
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $06,$36                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:36
	.DB $FC,$3D                                                   ; SET SPR X OFFSET= -3 PIXELS
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $13,$3A                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:3A
	.DB $17,$39                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:39
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $13,$3B                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:3B
	.DB $FF                                                       ; END

_F}_DIVING_PLAYER_BODY_SPR_TILE_DATA

_F{_NORMAL_CATCH_PLAYER_BODY_SPR_TILE_DATA

NORMAL_CATCH_PLAYER_BODY_SPR_TILE_DATA:                           ; DRAW REST OF SIDEWAYS PLAYER CATCHING BALL
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $06,$55                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:55
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $06,$54                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:54
	.DB $0A,$56                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:56
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $06,$4F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:4F
	.DB $0A,$65                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:65
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $32,$15                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2, TILE ID:15
	.DB $36,$17                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:17
	.DB $38,$1D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:1D
	.DB $06,$37                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:37
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $32,$40                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2, TILE ID:40
	.DB $34,$42                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:42
	.DB $38,$39                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:39
	.DB $3C,$4A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:4A
	.DB $01,$60                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:60
	.DB $06,$62                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:62
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $32,$41                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2, TILE ID:41
	.DB $36,$43                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:43
	.DB $38,$49                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:49
	.DB $3C,$4B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:4B
	.DB $01,$61                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:61
	.DB $06,$63                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:63
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $34,$46                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:46
	.DB $38,$4C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:4C
	.DB $3C,$4E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:4E
	.DB $01,$64                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:64
	.DB $04,$66                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:66
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $FF                                                       ; END
	
_F}_NORMAL_CATCH_PLAYER_BODY_SPR_TILE_DATA	

_F{_CHEERLEADER_PANTY_HEAD_SPR_TILE_DATA

CHEERLEADER_HEAD_SPR_TILE_DATA:                                   ; DRAW CHEERLEADER HEAD
	.DB $FC,$23                                                   ; SET SPR Y OFFSET= 3 PIXELS
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $09,$65                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:65
	.DB $FC,$2B                                                   ; SET SPR Y OFFSET= -5 PIXELS
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $09,$7F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:7F
	.DB $0D,$6F                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:6F
	.DB $FC,$20                                                   ; SET SPR Y OFFSET= 0 PIXELS
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $35,$55                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:55
	.DB $39,$59                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:59
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3D,$7F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:7F
	.DB $01,$7F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:7F
	.DB $07,$7F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3, TILE ID:7F
	.DB $09,$7F                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:7F
	.DB $0D,$79                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:79
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $35,$57                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:57
	.DB $39,$5B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:5B
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$75                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:75
	.DB $01,$7D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:7D
	.DB $09,$73                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:73
	.DB $0D,$7B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:7B
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $35,$5F                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:5F
	.DB $39,$5D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:5D
	.DB $FF                                                       ; END
	
_F}_CHEERLEADER_PANTY_HEAD_SPR_TILE_DATA

_F{_PARACHUTER_BODY_SPR_TILE_DATA

PARACHUTER_BODY_SPR_TILE_DATA:                                    ; MAIN PARACHUTER TILES *** could move to near other parachuter
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $24,$A8                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 0, TILE ID:A8
	.DB $28,$AA                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:AA
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $24,$A9                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 0, TILE ID:A9
	.DB $28,$AB                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:AB
	.DB $2D,$E4                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1, TILE ID:E4
	.DB $0D,$C0                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:C0
	.DB $11,$C2                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1, TILE ID:C2
	.DB $15,$C4                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 1, TILE ID:C4
	.DB $19,$C6                                                   ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 1, TILE ID:C6
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $24,$2C                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 0, TILE ID:2C
	.DB $28,$AE                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:AE
	.DB $2D,$E5                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1, TILE ID:E5
	.DB $35,$E5                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:E5
	.DB $3D,$28                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:28
	.DB $01,$2A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2A
	.DB $05,$B4                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:B4
	.DB $09,$B6                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1, TILE ID:B6
	.DB $0D,$C1                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:C1
	.DB $11,$C3                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1, TILE ID:C3
	.DB $15,$C5                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 1, TILE ID:C5
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $27,$AD                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3, TILE ID:AD
	.DB $28,$AF                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:AF
	.DB $01,$2B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:2B
	.DB $05,$53                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1, TILE ID:53
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $27,$B8                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3, TILE ID:B8
	.DB $28,$BA                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:BA
	.DB $2D,$53                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1, TILE ID:53
	.DB $35,$29                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:29
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $27,$B9                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3, TILE ID:B9
	.DB $2B,$BB                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 3, TILE ID:BB
	.DB $2D,$27                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1, TILE ID:27
	.DB $31,$2D                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:2D
	.DB $35,$29                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:29
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $27,$BC                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3, TILE ID:BC
	.DB $28,$BE                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:BE
	.DB $31,$29                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:29
	.DB $84                                                       ; SET SPRITE X OFFSET = 4 TILES
	.DB $27,$BD                                                   ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3, TILE ID:BD
	.DB $2B,$BF                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 3, TILE ID:BF
	.DB $2C,$AC                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:AC
	.DB $FF                                                       ; END
	
_F}_PARACHUTER_BODY_SPR_TILE_DATA	

_F{_HOLDING_PLAYER_SPR_TILE_DATA

HOLDING_PLAYER_BOTTOM_TORSO_SPR_TILE_DATA:                        ; HOLDING JUMPING PLAYER RUSHING BOTTOM RIGHT TORSO TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0E,$A8                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:0A8
	.DB $12,$AA                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0AA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0A,$A3                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:0A3
	.DB $0E,$A9                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:0A9
	.DB $12,$AB                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0AB
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $0A,$A6                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:0A6
	.DB $0E,$AC                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:0AC
	.DB $12,$AE                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0AE
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $12,$AF                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0AF
	.DB $FF                                                       ; END

HOLDING_JUMPING_PLAYER_MAIN_SPR_TILE_DATA:
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3C,$C3                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:C3
	.DB $00,$C9                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:C9
	.DB $04,$CB                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:CB
	.DB $0A,$B4                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:0B4
	.DB $0E,$B6                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:0B6
	.DB $12,$BC                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2, TILE ID:0BC
	.DB $16,$BE                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2, TILE ID:0BE
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $39,$C4                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:C4
	.DB $3C,$C6                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:C6
	.DB $00,$96                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:96
	.DB $04,$CE                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:CE
	.DB $0A,$B5                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:0B5
	.DB $0E,$B7                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:0B7
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $39,$C5                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:C5
	.DB $3C,$C7                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:C7
	.DB $00,$CD                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:CD
	.DB $04,$CF                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:CF
	.DB $08,$BD                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:0BD
	.DB $FF                                                       ; END
	
_F}_HOLDING_PLAYER_SPR_TILE_DATA	

_F{_KICKING_CHEERLEADER_SPR_TILE_DATA

KICKING_CHEERLEADER_TORSO_SPR_TILE_DATA:                          ; KICKING CHEERLEADER (BACK OF TORSO)
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3D,$01                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:01
	.DB $01,$09                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:09
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3D,$03                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:03
	.DB $01,$0B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:0B
	.DB $FF                                                       ; END

KICKING_CHEER_HEAD_ARMS_POMS_IN_SPR_TILE_DATA_SUB:                ; HEAD, ARMS LEGS, POM POMS IN
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3B,$0D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:0D
	.DB $3F,$15                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:15
	.DB $03,$1D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3, TILE ID:1D
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $35,$07                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:07
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $39,$0F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:0F
	.DB $3C,$17                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:17
	.DB $00,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $35,$11                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:11
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $39,$19                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:19
	.DB $06,$41                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:41
	.DB $0A,$49                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:49
	.DB $FC,$3C                                                   ; SET SPR X OFFSET= -4 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $35,$13                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:13
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $39,$1B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:1B
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN FROM TILE ROUTINE

KICKING_CHEER_HEAD_ARMS_POMS_OUT_SPR_TILE_DATA_SUB:               ; HEAD, ARMS LEGS, POM POMS STRETCHED OUT
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $35,$21                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:21
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $35,$23                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:23
	.DB $39,$2B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:2B
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $39,$B3                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:B3
	.DB $3C,$BB                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:BB
	.DB $00,$B5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B5
	.DB $06,$B7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:B7
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $39,$B9                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:B9
	.DB $06,$BD                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:BD
	.DB $FC,$3F                                                   ; SET SPR X OFFSET= -1 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0A,$BF                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:BF
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $35,$47                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:47
	.DB $39,$4F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:4F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $35,$51                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:51
	.DB $FC,$20                                                   ; SET SPR Y OFFSET= 0 PIXELS
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN FROM TILE ROUTINE
	
_F}_KICKING_CHEERLEADER_SPR_TILE_DATA	

_F{_PLAYER_TORSO_JUMP_SPR_TILE_DATA

PLAYER_TORSO_JUMP_SPR_TILE_DATA:                                  ; DOUBLE JUMP PLAYER TORSO
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3A,$B6                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:B6
	.DB $3E,$BB                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:BB
	.DB $02,$C0                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:C0
	.DB $06,$C2                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:C2
	.DB $0A,$C8                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:C8
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $36,$EA                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:EA
	.DB $38,$B9                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:B9
	.DB $3E,$BE                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:BE
	.DB $02,$C1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:C1
	.DB $06,$C3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:C3
	.DB $0A,$C9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:C9
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $36,$EB                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:EB
	.DB $38,$BC                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:BC
	.DB $0A,$CC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:CC
	.DB $FF                                                       ; END
	
_F}_PLAYER_TORSO_JUMP_SPR_TILE_DATA	

_F{_PLAYER_RUNNING_TD_SCENES_SPR_TILE_DATA

PLAYER_RUNNING_HEAD_ARM_SPR_TILE_DATA_SUB:                        ; PLAYER RUNNING HAND IN HEAD AND ARM 2
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $36,$80                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:80
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $36,$81                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:81
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $30,$87                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:87
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $2F,$90                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 3, TILE ID:90
	.DB $30,$92                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:92
	.DB $33,$AA                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3, TILE ID:AA
	.DB $34,$85                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:85
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN

PLAYER_RUNNING_TORSO_TWO_SPR_TILE_DATA:                           ; PLAYER RUNNING HAND IN AIR (TORSO 2)
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3C,$8E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:8E
	.DB $00,$A4                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A4
	.DB $06,$80                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:80
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3A,$82                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:82
	.DB $3C,$88                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:88
	.DB $00,$8A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:8A
	.DB $06,$A0                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:A0
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3A,$83                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:83
	.DB $3C,$89                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:89
	.DB $00,$8B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:8B
	.DB $06,$A1                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:A1
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3C,$8C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:8C
	.DB $FF                                                       ; END

PLAYER_RUNNING_SHOULDER_ARM_SPR_TILE_DATA:                        ; PLAYER RUNNING HAND IN AIR (RIGHT SHOULDER AND ARM 2)
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3A,$99                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:99
	.DB $3C,$9B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:9B
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $34,$96                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:96
	.DB $38,$9C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:9C
	.DB $3C,$8C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:8C
	.DB $0A,$BC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:0BC
	.DB $0E,$BE                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:0BE
	.DB $FF                                                       ; END

PLAYER_RUNNING_LEGS_SPR_TILE_DATA_SUB:                            ; PLAYER RUNNING HAND IN AIR (LEGS 1)
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $0F,$AB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:AB
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $0A,$AC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:AC
	.DB $0F,$AE                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:AE
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0A,$A2                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:A2
	.DB $0E,$A8                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:A8
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0A,$A3                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:A3
	.DB $0E,$A9                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:A9
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; END

PLAYER_RUNNING_SPIKE_TORSO_SPR_TILE_DATA:                         ; PLAYER RUNNING HAND IN AIR (BALL SPIKE TORSO)
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3C,$8F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:8F
	.DB $00,$A5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:A5
	.DB $06,$A7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:A7
	.DB $0A,$AD                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:AD
	.DB $0E,$AF                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:AF
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3A,$98                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:98
	.DB $3C,$9A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:9A
	.DB $00,$B0                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B0
	.DB $06,$B2                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:B2
	.DB $0A,$B8                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:B8
	.DB $0E,$BA                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:BA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $00,$B1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B1
	.DB $06,$B3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:B3
	.DB $0A,$B9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:B9
	.DB $0E,$BB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:BB
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $00,$B4                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:B4
	.DB $FF                                                       ; END

_F}_PLAYER_RUNNING_TD_SCENES_SPR_TILE_DATA	

_F{_KICK_CHEER_POM_POM_ARMS_EXTENDED_SPR_TILE_DATA	

KICK_CHEER_POM_POM_ARMS_SPR_TILE_DATA_SUB:                        ; KICKING CHEERLEADER POM POMS AND ARMS EXTENDED NO FOOT
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $FC,$20                                                   ; SET SPR Y OFFSET= 0 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $35,$21                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:21
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $35,$23                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:23
	.DB $39,$2B                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:2B
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $39,$2D                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:2D
	.DB $3D,$25                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:25
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $39,$B9                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:B9
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $35,$47                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:47
	.DB $39,$4F                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:4F
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $35,$51                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:51
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_KICK_CHEER_POM_POM_ARMS_EXTENDED_SPR_TILE_DATA		

_F{_PANTY_CHEER_TOP_AND_ARMS_SPR_TILE_DATA

PANTY_CHEER_TOP_AND_ARMS_SPR_TILE_DATA_SUB:                       ; DRAW PANTY CHEERLEADER TOP AND ARMS
	.DB $FC,$28                                                   ; SET SPR Y OFFSET= -8 PIXELS
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $02,$9B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:9B
	.DB $06,$A1                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:A1
	.DB $FC,$20                                                   ; SET SPR Y OFFSET= 0 PIXELS
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $3E,$61                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:61
	.DB $02,$69                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:69
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $38,$95                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:95
	.DB $3E,$93                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:93
	.DB $02,$6B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:6B
	.DB $0C,$6D                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:6D
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3C,$63                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:63
	.DB $02,$A3                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:0A3
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $3C,$67                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:67
	.DB $02,$A5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:0A5
	.DB $FC,$25                                                   ; SET SPR Y OFFSET= 5 PIXELS
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3E,$71                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:71
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_PANTY_CHEER_TOP_AND_ARMS_SPR_TILE_DATA	

_F{_RAISED_FOOT_SPR_TILE_DATA

FOOT_CHEER_SPR_TILE_DATA_SUB:                                     ; RAISED FOOT CHEERLEADER SUBROUTINE
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $FC,$2C                                                   ; SET SPR Y OFFSET= -4 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0D,$35                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1, TILE ID:35
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0F,$4B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:4B
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_RAISED_FOOT_SPR_TILE_DATA	

_F{_PLAYER_HANDS_FEET_NORMAL_CAUGHT_BALL_SPR_TILE_DATA

PLAYER_HANDS_NORMAL_CATCH_SPR_TILE_DATA_SUB:                      ; PLAYERS HANDS FOR CATCHING BALL (SIDEWAYS PLAYER)
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $3C,$44                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:44
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $38,$45                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:45
	.DB $3C,$47                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:47
	.DB $01,$4D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:4D
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3C,$1F                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:1F
	.DB $01,$35                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:35
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN

PLAYER_FEET_NORMAL_CATCH_SPR_TILE_DATA_SUB:                       ; PLAYERS FEET FOR CATCHING BALL (SIDEWAYS PLAYER)
	.DB $99                                                       ; SET SPRITE X OFFSET = -7 TILES
	.DB $0F,$14                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:14
	.DB $9A                                                       ; SET SPRITE X OFFSET = -6 TILES
	.DB $0B,$48                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:48
	.DB $0F,$34                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:34
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $0B,$50                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:50
	.DB $0F,$52                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:52
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $0B,$51                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:51
	.DB $0F,$53                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:53
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0B,$68                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:68
	.DB $13,$3D                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:3D
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $0B,$69                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3, TILE ID:69
	.DB $13,$3F                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:3F
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0F,$6A                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:6A
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $0F,$6B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:6B
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_PLAYER_HANDS_FEET_NORMAL_CAUGHT_BALL_SPR_TILE_DATA	

_F{_PLAYER_LEGS_LEADING_WR_SPR_TILE_DATA

PLAYER_LEGS_LEADING_WR_TILE_DATA_SUB:                             ; PLAYERS LEGS FOR LEADING WR'S
	.DB $99                                                       ; SET SPRITE X OFFSET = -7 TILES
	.DB $0C,$14                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:14
	.DB $9A                                                       ; SET SPRITE X OFFSET = -6 TILES
	.DB $08,$48                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:48
	.DB $0C,$34                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:34
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $08,$50                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:50
	.DB $0C,$52                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:52
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $08,$51                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:51
	.DB $0C,$53                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:53
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $08,$68                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:68
	.DB $10,$3D                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:3D
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $08,$69                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:69
	.DB $10,$3F                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0, TILE ID:3F
	.DB $FC,$3E                                                   ; SET SPR X OFFSET= -2 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0C,$6A                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:6A
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $0C,$6B                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0, TILE ID:6B
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_PLAYER_LEGS_LEADING_WR_SPR_TILE_DATA	

_F{_PLAYER_HANDS_NORMAL_CAUGHT_BALL_CREDITS_SPR_TILE_DATA

PLAYER_HANDS_NORMAL_CAUGHT_BALL_SPR_TILE_DATA_SUB:                ; PLAYERS HANDS FOR BALL CAUGHT SIDEWAYS PLAYER (CREDITS)
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $E4,$03,$57                                               ; MOVE SPRITE 4 PIXELS X,OFFSET Y BY: 0 PIXELS USE SPR PAL: 3, TILE ID:57
	.DB $3F,$5C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:5C
	.DB $39,$67                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1, TILE ID:67
	.DB $3D,$6D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:6D
	.DB $01,$6F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:6F
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3F,$5D                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:5D
	.DB $3C,$6C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:6C
	.DB $01,$6E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:6E
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_PLAYER_HANDS_NORMAL_CAUGHT_BALL_CREDITS_SPR_TILE_DATA	

_F{_LEADING_PUNTER_BODY_SPR_TILE_DATA

LEADING_PUNTER_BODY_SPR_TILE_DATA:                                ; DRAW LEADING PUNTERS BODY TILES
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $0E,$CA                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:CA
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $30,$D0                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:D0
	.DB $36,$D2                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:D2
	.DB $3A,$D8                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:D8
	.DB $3E,$CB                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:CB
	.DB $02,$E1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:E1
	.DB $06,$E3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:E3
	.DB $0A,$E9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:E9
	.DB $0E,$EB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:EB
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $30,$D1                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:D1
	.DB $34,$D3                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:D3
	.DB $38,$D9                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:D9
	.DB $3C,$CE                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:CE
	.DB $02,$E4                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:E4
	.DB $06,$E6                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:E6
	.DB $0A,$EC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:EC
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $2E,$DE                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 2, TILE ID:DE
	.DB $31,$D4                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:D4
	.DB $34,$D6                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:D6
	.DB $38,$DC                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:DC
	.DB $3C,$CF                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:CF
	.DB $02,$E5                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:E5
	.DB $06,$E7                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:E7
	.DB $0A,$ED                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:ED
	.DB $0E,$EF                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:EF
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $2E,$DF                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 2, TILE ID:0DF
	.DB $32,$D5                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2, TILE ID:0D5
	.DB $34,$D7                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:0D7
	.DB $38,$DD                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:0DD
	.DB $3C,$F5                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0F5
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $38,$EE                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:0EE
	.DB $3C,$DB                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:0DB
	.DB $FF                                                       ; END
	
_F}_LEADING_PUNTER_BODY_SPR_TILE_DATA	

_F{_JUMPING_PLAYER_FEET_SPR_TILE_DATA

JUMPING_PLAYER_FEET_SPR_TILE_DATA_SUB:                            ; DOUBLE JUMP PLAYER FEET SPRITES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $0F,$CA                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:CA
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0F,$CB                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:CB
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $0F,$CE                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3, TILE ID:CE
	.DB $13,$E4                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:E4
	.DB $17,$E1                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:E1
	.DB $FC,$32                                                   ; SET SPR X OFFSET= 2 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $13,$C4                                                   ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3, TILE ID:C4
	.DB $17,$C6                                                   ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3, TILE ID:C6
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_JUMPING_PLAYER_FEET_SPR_TILE_DATA	

_F{_DIVING_DEFENDER_BODY_SPR_TILE_DATA

DIVING_DEFENDER_BODY_SPR_TILE_DATA:                               ; BODY FOR DIVING DEFENDER TILES
	.DB $9B                                                       ; SET SPRITE X OFFSET = -5 TILES
	.DB $30,$28                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:28
	.DB $34,$2A                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:2A
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $34,$2B                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:2B
	.DB $38,$3C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:3C
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $34,$0A                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:0A
	.DB $38,$20                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:20
	.DB $3C,$22                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:22
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $36,$0B                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:0B
	.DB $38,$21                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:21
	.DB $3E,$23                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:23
	.DB $02,$29                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:29
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $30,$3D                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3D
	.DB $35,$3F                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:3F
	.DB $38,$24                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:24
	.DB $3C,$26                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:26
	.DB $02,$2C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:2C
	.DB $06,$2E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:2E
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $38,$68                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:68
	.DB $3C,$6A                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:6A
	.DB $02,$2D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:2D
	.DB $06,$2F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:2F
	.DB $0A,$62                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:62
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $02,$38                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:38
	.DB $06,$3A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:3A
	.DB $0A,$63                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:63
	.DB $0E,$69                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:69
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $02,$39                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:39
	.DB $06,$3B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:3B
	.DB $0A,$66                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:66
	.DB $0E,$6C                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:6C
	.DB $83                                                       ; SET SPRITE X OFFSET = 3 TILES
	.DB $06,$3E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:3E
	.DB $0A,$67                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:67
	.DB $FF                                                       ; END
	
_F}_DIVING_DEFENDER_BODY_SPR_TILE_DATA		

_F{_LANDING_CATCH_BODY_SPR_TILE_DATA

LANDING_CATCH_BODY_SPR_TILE_DATA:                                 ; PLAYER LANDING FROM CATCH BODY TILES
	.DB $9C                                                       ; SET SPRITE X OFFSET = -4 TILES
	.DB $02,$4D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:4D
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $3F,$46                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:46
	.DB $38,$50                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:50
	.DB $3D,$52                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:52
	.DB $02,$58                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:58
	.DB $04,$5A                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:5A
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $3B,$45                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3, TILE ID:45
	.DB $3F,$47                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3, TILE ID:47
	.DB $36,$65                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:65
	.DB $38,$51                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:51
	.DB $3E,$53                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:53
	.DB $02,$59                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:59
	.DB $06,$5B                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:5B
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $35,$70                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1, TILE ID:70
	.DB $3A,$54                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:54
	.DB $3E,$56                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:56
	.DB $02,$5C                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:5C
	.DB $06,$5E                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:5E
	.DB $0A,$74                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:74
	.DB $0E,$76                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:76
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $36,$71                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:71
	.DB $3A,$55                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:55
	.DB $3E,$57                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:57
	.DB $02,$5D                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:5D
	.DB $06,$5F                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:5F
	.DB $0A,$75                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:75
	.DB $0E,$77                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:77
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $3A,$15                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:15
	.DB $3E,$17                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:17
	.DB $00,$40                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:40
	.DB $04,$42                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:42
	.DB $08,$44                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0, TILE ID:44
	.DB $82                                                       ; SET SPRITE X OFFSET = 2 TILES
	.DB $00,$41                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:41
	.DB $04,$43                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0, TILE ID:43
	.DB $FF                                                       ; END
	
_F}_LANDING_CATCH_BODY_SPR_TILE_DATA	

_F{_JUMPING_PLAYER_HEAD_SPR_TILE_DATA

JUMPING_PLAYER_HEAD_SPR_TILE_DATA_SUB:                            ; JUMPING PLAYER HEAD TILES
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $28,$B5                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:B5
	.DB $2C,$B7                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:B7
	.DB $30,$BD                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:BD
	.DB $36,$BF                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:BF
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $28,$E0                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:E0
	.DB $2C,$E2                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:E2
	.DB $30,$E8                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:E8
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $2C,$E3                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:E3
	.DB $31,$E9                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:E9
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN
	
_F}_JUMPING_PLAYER_HEAD_SPR_TILE_DATA	

_F{_INT_LEADERS_SPR_TILE_DATA

HEAD_AND_ARMS_INT_LEADERS_SPR_TILE_DATA_SUB:                      ; HEAD AND HANDS FOR INTERCEPTION LEADERS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $28,$35                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:35
	.DB $2C,$37                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:37
	.DB $30,$3D                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:3D
	.DB $36,$3F                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:3F
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $28,$E0                                                   ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0, TILE ID:E0
	.DB $2C,$E2                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:E2
	.DB $30,$E8                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0, TILE ID:E8
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $2C,$E3                                                   ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0, TILE ID:E3
	.DB $31,$E9                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1, TILE ID:E9
	RETURN_FROM_SCRIPT_SUBROUTINE[]                               ; RETURN

BODY_INT_LEADERS_SPR_TILE_DATA:                                   ; BODY FOR INTERCEPTION LEADERS
	.DB $FC,$30                                                   ; SET SPR X OFFSET= 0 PIXELS
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $3A,$36                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2, TILE ID:36
	.DB $3E,$3B                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:3B
	.DB $02,$C0                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:C0
	.DB $06,$C2                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:C2
	.DB $0A,$C8                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:C8
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $36,$EA                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:EA
	.DB $38,$39                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:39
	.DB $3E,$3E                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:3E
	.DB $02,$C1                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:C1
	.DB $06,$C3                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:C3
	.DB $0A,$C9                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:C9
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $36,$EB                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:EB
	.DB $38,$3C                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:3C
	.DB $0A,$CC                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:CC
	.DB $FF                                                       ; END
	
_F}_INT_LEADERS_SPR_TILE_DATA	

_F{_KICKER_PUNTER_BODY_SPR_TILE_DATA

KICKER_PUNTER_BODY_SPR_TILE_DATA:                                 ; KICKER AND PUNTER BODY TILE DATA
	.DB $9D                                                       ; SET SPRITE X OFFSET = -3 TILES
	.DB $34,$10                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0, TILE ID:10
	.DB $38,$12                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:12
	.DB $3C,$18                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0, TILE ID:18
	.DB $00,$1A                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0, TILE ID:1A
	.DB $9E                                                       ; SET SPRITE X OFFSET = -2 TILES
	.DB $32,$15                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2, TILE ID:15
	.DB $36,$11                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:11
	.DB $38,$13                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:13
	.DB $3E,$19                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2, TILE ID:19
	.DB $01,$1B                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1, TILE ID:1B
	.DB $06,$21                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:21
	.DB $9F                                                       ; SET SPRITE X OFFSET = -1 TILES
	.DB $32,$1D                                                   ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2, TILE ID:1D
	.DB $36,$14                                                   ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2, TILE ID:14
	.DB $38,$16                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:16
	.DB $3D,$1C                                                   ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1, TILE ID:1C
	.DB $02,$1E                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:1E
	.DB $06,$20                                                   ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2, TILE ID:20
	.DB $0A,$22                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:22
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $38,$17                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:17
	.DB $02,$1F                                                   ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2, TILE ID:1F
	.DB $81                                                       ; SET SPRITE X OFFSET = 1 TILES
	.DB $38,$24                                                   ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0, TILE ID:24
	.DB $FC,$2E                                                   ; SET SPR Y OFFSET= -2 PIXELS
	.DB $80                                                       ; SET SPRITE X OFFSET = 0 TILES
	.DB $0A,$23                                                   ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2, TILE ID:23
	.DB $0E,$29                                                   ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2, TILE ID:29
	.DB $FF                                                       ; END

_F}_KICKER_PUNTER_BODY_SPR_TILE_DATA

.PAD $C000, $FF
