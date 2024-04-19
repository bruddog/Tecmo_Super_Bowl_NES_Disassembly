.BASE $A000


_F{_SPRITE_SCRIPT_POINTER_TABLE_TWO

SPRITE_SCENE_POINTERS_SECOND_BANK:

        .WORD EXLIMATION_POINT_SPRITE_SCRIPT             ; 0x80 EXLIMATION POINT
        .WORD KISS_CHEER_EYES_MOUTH_SPRITE_SCRIPT        ; 0x81 CHEERLEADER EYES AND MOUTH (KISS)
        .WORD BALL_BOUNCE_SPIKE_RUSH_TD_SPRITE_SCRIPT    ; 0x82 BALL BOUNCE (SPIKE RUSHING TD)
        .WORD PLAYER_ACROSS_SCREEN_CREDITS_SPRITE_SCRIPT ; 0x83 PLAYER MOVE ACROSS SCREEN (CREDITS)
        .WORD GATORADE_SUPERBOWL_SPRITE_SCRIPT           ; 0x84 GATORADE CONTAINER + LIQUID (CREDITS) 
        .WORD PLAYER_HAND_IN_AIR_CREDITS_SPRITE_SCRIPT   ; 0x85 PLAYER HAND IN AIR (CREDITS)
        .WORD BLIMP_MOTOR_SPRITE_SCRIPT                  ; 0x86 TINY BLIMP MOTOR
        .WORD BALOONS_ONE_SPRITE_SCRIPT                  ; 0x87 BALLOONS
        .WORD BALOONS_TWO_SPRITE_SCRIPT                  ; 0x88 BALLOONS
        .WORD KISS_CHEER_HAIR_SPRITE_SCRIPT              ; 0x89 CHEERLEADER HAIR (KISS)
        .WORD BLANK_TILES_FOR_REF_FG_GOODL_SPRITE_SCRIPT ; 0x8A BLANK TILES (FG GOOD)
        .WORD EMPTY_TWO_SPRITE_SCRIPT                    ; 0x8B *** EMPTY UNUSED 
        .WORD BALL_BOUNCE_IN_RT_UPRIGHT_P2_SPRITE_SCRIPT ; 0x8C BALL BOUNCING IN RIGHT UPRIGHT P1
        .WORD BALL_BOUNCE_IN_LT_UPRIGHT_P2_SPRITE_SCRIPT ; 0x8D BALL BOUNCING IN LEFT UPRIGHT P1
        .WORD BALL_BOUNCE_OUT_RT_UPRIGHT_P2_SPRITE_SCRIPT; 0x8E BALL BOUNCING OUT RIGHT UPRIGHT P1
        .WORD BALL_BOUNCE_OUT_LT_UPRIGHT_P2_SPRITE_SCRIPT; 0x8F BALL BOUNCING OUT LEFT UPRIGHT P1
        .WORD FLICKER_RIGHT_POST_P2_SPRITE_SCRIPT        ; 0x90 FLICKERING FOR BALL HITTING RIGHT POST P2
        .WORD FLICKER_LEFT_POST_P2_SPRITE_SCRIPT         ; 0x91 FLICKERING FOR BALL HITTING LEFT POST P2
        .WORD LEFT_POST_SCROLL_P2_SPRITE_SCRIPT          ; 0x92 LEFT UPRIGHT P2 MOVING
        .WORD RIGHT_POST_SCROLL_P2_SPRITE_SCRIPT         ; 0x93 RIGHT UPRIGHT P2 MOVING
        .WORD P1_BALL_THRU_UPRIGHT_BALL_SPRITE_SCRIPT    ; 0x94 BALL GOAING THROUGH GOALPOSTS P1
        .WORD BALL_BOUNCE_IN_LT_UPRIGHT_P1_SPRITE_SCRIPT ; 0x95 BALL BOUNCING IN LEFT UPRIGHT P1 
        .WORD BALL_BOUNCE_IN_RT_UPRIGHT_P1_SPRITE_SCRIPT ; 0x96 BALL BOUNCING IN RIGHT UPRIGHT P1
        .WORD BALL_BOUNCE_OUT_LT_UPRIGHT_P1_SPRITE_SCRIPT; 0x97 BALL BOUNCING OUT LEFT UPRIGHT P1
        .WORD BALL_BOUNCE_OUT_RT_UPRIGHT_P1_SPRITE_SCRIPT; 0x98 BALL BOUNCING OUT RIGHT UPRIGHT P1
        .WORD FLICKER_LEFT_POST_P1_SPRITE_SCRIPT         ; 0x99 FLICKERING FOR BALL HITTING  LEFT POST P1
        .WORD FLICKER_RIGHT_POST_P1_SPRITE_SCRIPT        ; 0x9A FLICKERING FOR BALL HITTING  RIGHT POST P1
        .WORD QB_DROPBACK_INTRO_SPRITE_SCRIPT            ; 0x9B QUARTERBACK DROPBACK INTRO
        .WORD P2_FG_SHORT_SPRITE_SCRIPT             ; 0x9C BALL FG IS SHORT P2 
        .WORD NFL_SHIELD_SCROLL_DOWN_SPRITE_SCRIPT       ; 0x9D SCROLLING DOWN NFL SHILED
        .WORD CHEER_EYES_WINK_SPRITE_SCRIPT              ; 0x9E CHEERLEADER EYES
        .WORD BARRY_SCROLL_INTRO_SPRITE_SCRIPT           ; 0x9F BARRY FAST SCROLL LEFT TO RIGHT
        .WORD REF_THIRD_DOWN_SPRITE_SCRIPT               ; 0xA0 REF THIRD DOWN 
        .WORD REF_FOURTH_DOWN_SPRITE_SCRIPT              ; 0xA1 REF FOURTH DOWN
        .WORD P2_POINT_KICK_CHOICE_SPRITE_SCRIPT         ; 0xA2 P2 POINTING AFTER KICKOFF CHOICE
        .WORD P1_POINT_KICK_CHOICE_SPRITE_SCRIPT         ; 0xA3 P1 POINTING AFTER KICKOFF CHOICE
        .WORD REF_COIN_TOSS_P1_CHOICE_SPRITE_SCRIPT      ; 0xA4 REFEREE COIN TOSS P1 WINS
        .WORD REF_COIN_TOSS_P2_CHOICE_SPRITE_SCRIPT      ; 0xA5 REFEREE COIN TOSS P2 WINS
        .WORD P1_RUNNING_AND_REF_COIN_TOSS_SPR_SCRIPT    ; 0xA6 P1 PLAYER RUNNING TOWARDS REF + COIN  IN AIR
        .WORD RIGHT_POST_SCROLL_P1_SPRITE_SCRIPT         ; 0xA7 RIGHT UPRIGHT P1 MOVING
        .WORD LEFT_POST_SCROLL_P1_SPRITE_SCRIPT          ; 0xA8 LEFT UPRIGHT P1 MOVING
        .WORD WAVE_ONE_HALFTIME_SPRITE_SCRIPT            ; 0xA9 WAVE 1 (HALFTIME) 
        .WORD WAVE_TWO_HALFTIME_SPRITE_SCRIPT            ; 0XAA WAVE 2 (HALFTIME)
        .WORD P1_FG_SHORT_BALL_SPRITE_SCRIPT             ; 0xAB P1 FG SHORT
        .WORD P2_BALL_THRU_UPRIGHT_BALL_SPRITE_SCRIPT    ; 0XAC BALL GOING THROUGH GOALPOSTS P2
        .WORD LEADING_RUSHER_SIL_SPRITE_SCRIPT           ; 0XAD LEADING RUSHERS SPRITE
        .WORD FLASH_LIGHTS_CONF_CHAMP_SPRITE_SCRIPT      ; 0XAE FLASH BULBS CONF CHAMPION
        .WORD REF_FALSE_START_SPR_SCRIPT                 ; 0XAF FALSE START
        .WORD REF_FG_GOOD_SPR_SCRIPT                     ; 0xB0 REF FG GOOD
        .WORD START_OF_REF_DOWN_SIGNAL_SPR_SCRIPT_SUB    ; 0xB1 REF START OF REF DOWN SIGNAL
        .WORD P1_REF_FIRST_DOWN_SPR_SCRIPT               ; 0xB2 REF P1 FIRST DOWN ARM POINTING FORWARD 
        .WORD REF_NO_GOOD_SIGNAL_SPR_SCRIPT              ; 0xB3 REF NO GOOD SIGNAL (CORRSING ARMS)
        .WORD REF_FIRST_DOWN_FINGERS_SPR_SCRIPT          ; 0xB4 REF FIRST DOWN WITH FINGERS 
        .WORD REF_SECOND_DOWN_FINGERS_SPR_SCRIPT         ; 0xB5 REF SECOND DOWN 
        .WORD COACH_ARM_SUPER_BOWL_SPR_SCRIPT            ; 0xB6 COACH WITH ARM IN AIR (CREDITS)
        .WORD COACH_MISC_SPRITES_SPR_SCRIPT              ; 0xB7 EXTRA SPRITES COACH (CREDITS)
        .WORD QB_FACE_SUPER_BOWL_SPR_SCRIPT              ; 0xB8 PLAYER FACE INTERVIEW (CREDITS)
        .WORD MICS_FROM_LEFT_SUPER_BOWL_SPR_SCRIPT       ; 0xB9 MICS FROM LEFT (CREDITS)
        .WORD MICS_FROM_RIGHT_SUPER_BOWL_SPR_SCRIPT      ; 0XBA MICS FROM RIGHT (CREDITS)
        .WORD LT_AFTER_SACK_INTRO_SPR_SCRIPT             ; 0XBB FULL LT SPRITE AFTER SCAK 
        .WORD SCOREBOARD_WAVING_FLAGS_SPR_SCRIPT         ; 0XBC 4 WAVING FLAGS
        .WORD QB_PUMP_FIST_PASS_TD_SPR_SCRIPT            ; 0XBD QB HANDS IN AIR PUMPS FIST (PASSING TD)
        .WORD SCROLLING_STARS_ONE_SPR_SCRIPT             ; 0XBE SCROLLING STARS 1 PLAYER NAMES (CREDITS)
        .WORD SCROLLING_STARS_TWO_SPR_SCRIPT             ; 0xBF SCROLLING STARS 2 PLAYER NAMES (CREDITS)
        .WORD SCROLLING_STARS_THREE_SPR_SCRIPT           ; 0xC0 SCROLLING STARS 3 PLAYER NAMES (CREDITS)
        .WORD LT_WAVE_CREDITS_SPR_SCRIPT                 ; 0xC1 LT WAVE (CREDITS)
        .WORD TECMO_BUNNY_SPR_SCRIPT                     ; 0xC2 TECMO BUNNY
        .WORD STADIUM_STUFF_CONF_CHAMP_SPR_SCRIPT        ; 0xC3 VARIOUS STADIUM OVERLAYS FOR CONF CHAMPION
        .WORD BOMJACK_RUN_FROM_RIGHT_DANCE_SPR_SCRIPT    ; 0xC4 BOMB JACK RUN FROM RIGHT
        .WORD BOMJACK_RUN_FROM_LEFT_DANCE_SPR_SCRIPT     ; 0xC5 BOMB JACK RUN FROM LEFT
        .WORD BOMJACK_DROP_IN_FROM_SKY_SPR_SCRIPT        ; 0xC6 BOMB JACK FROM TOP
        .WORD BOMJACK_FROM_TOP_WAVE_SPR_SCRIPT           ; 0xC7 BOMB JACK TOP WAVE
        .WORD BOMJACK_FROM_RIGHT_WAVE_SPR_SCRIPT         ; 0xC8 BOMB JACK FROM RIGHT WAVE
        .WORD BOMJACK_FROM_LEFT_WAVE_SPR_SCRIPT          ; 0xC9 BOMB JACK FROM LEFT WAVE
        .WORD PLAYER_RUN_RETURN_INJURY_SPR_SCRIPT        ; 0XCA FIELD PLAYER RUNNINGRETURN FROM INJURY
        .WORD COIN_TOSS_P2_RUNNING_SPR_SCRIPT            ; 0xCB COIN TOSS P2 PLAYER RUNNING + BOTH PLAYS STANDING STILL 
        .WORD UNUSED_COIN_TOSS_SPR_SCRIPT                ; 0XCC UNUSED
        .WORD NURSES_WAVING_SPR_SCRIPT                   ; 0XCD NURSES WAVING INJURYRETURN
        .WORD REF_POINTS_P1_COIN_TOSS_SPR_SCRIPT         ; 0XCE REF POINTS P1 SIDE 
        .WORD REF_POINTS_P2_COIN_TOSS_SPR_SCRIPT         ; 0xCF REF POINTS P2 SIDE
        .WORD QB_SACKED_BY_LT_SPR_SCRIPT                 ; 0xD0 QB GETTING SACKED BY LT SACK LEFT TO RIGHT
        .WORD P1_BALL_WIDE_LEFT_SPR_SCRIPT               ; 0xD1 P1 FG WIDE LEFT
        .WORD P1_BALL_WIDE_RIGHT_SPR_SCRIPT              ; 0xD2 P1 FG WIDE RIGHT
        .WORD P2_BALL_WIDE_RIGHT_SPR_SCRIPT              ; 0xD3 P2 FG WIDE RIGHT
        .WORD P2_BALL_WIDE_LEFT_SPR_SCRIPT               ; 0xD4 P2 FG WIDE LEFT
        .WORD P2_REF_FIRST_DOWN_SPR_SCRIPT               ; 0xD5 REF P2 FIRST DOWN ARM POINTING FORWARD
		
_F}_SPRITE_SCRIPT_POINTER_TABLE_TWO	

_F{_EXLIMATION_POINT_SPRITE_SCRIPT

EXLIMATION_POINT_SPRITE_SCRIPT:                          ; 0X80 EXLIMATION POINT 
   .DB $F6 , $18 , $19 , $1A , $1B                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $3D                                           ; SET SPRITE PALLETE INDEX  TO: 61
   .DB $F8 , $30 , $48                                       ; SET SPRITE STARTING LOCATION= Y: 96 ,  X: 144 
   DO_TILE_DATA[ADDR] EXLIMATION_PT_SPR_TILE_DATA               
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT 

_F}_EXLIMATION_POINT_SPRITE_SCRIPT   

_F{_KISS_CHEER_EYES_MOUTH_SPRITE_SCRIPT

KISS_CHEER_EYES_MOUTH_SPRITE_SCRIPT:                     ; 0X81 CHEERLEADER EYES AND MOUTH( KISS)
   .DB $F6 , $00 , $00 , $00 , $67                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $33                                           ; SET SPRITE PALLETE INDEX  TO: 51
   .DB $F8 , $18 , $9C                                       ; SET SPRITE STARTING LOCATION= Y: 48 ,  X: 208 OFFSCREEN
   .DB $FD                                               ; START SCROLLING AND FLIP SCROLL DIRECTION
   DO_TILE_DATA[ADDR] KISS_CHEER_EYES_MOUTH_SPR_TILE_DATA               
   .DB $1E                                               ; SCROLL OR WAIT FOR: 60 FRAMES
   DO_TILE_DATA[ADDR] KISS_CHEER_EYES_MOUTH_BLINK_SPR_TILE_DATA               
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   DO_TILE_DATA[ADDR] KISS_CHEER_EYES_MOUTH_SPR_TILE_DATA               
   .DB $23                                               ; SCROLL OR WAIT FOR: 70 FRAMES
   DO_TILE_DATA[ADDR] KISS_CHEER_EYES_MOUTH_KISS_SPR_TILE_DATA:                
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_KISS_CHEER_EYES_MOUTH_SPRITE_SCRIPT   

_F{_BALL_BOUNCE_SPIKE_RUSH_TD_SPRITE_SCRIPT

BALL_BOUNCE_SPIKE_RUSH_TD_SPRITE_SCRIPT:                 ; 0X82 BALL BOUNCE (SPIKE RUSHING TD)
   .DB $F6 , $4D , $00 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $00                                           ; SET SPRITE PALLETE INDEX  TO: 0
   .DB $F8 , $0E , $22                                       ; SET SPRITE STARTING LOCATION= Y: 28 ,  X: 68 
   .DB $FB , $70 , $50 , $70 , $70                               ; SET SCROLL SPEED Y PIXELS/FRM: 5 , X PIXELS/FRM: 7 ,  Y SPEED INC/FRM: 112  ,  XSPEED INC/FRM: 70
   DO_TILE_DATA[ADDR] BIG_BALL_SPIKE_FORTY_FIVE_SPR_TILE_DATA             
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BIG_BALL_SPIKE_ZERO_SPR_TILE_DATA               
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $FB , $90 , $70 , $00 , $35                               ; SET SCROLL SPEED Y PIXELS/FRM: 9 , X PIXELS/FRM: 7 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 35
   DO_TILE_DATA[ADDR] BIG_BALL_SPIKE_FORTY_FIVE_TWO_SPR_TILE_DATA                
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
   DO_TILE_DATA[ADDR] BIG_BALL_SPIKE_NINETY_SPR_TILE_DATA                
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
   DO_TILE_DATA[ADDR] BIG_BALL_SPIKE_FORTY_FIVE_SPR_TILE_DATA 
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
   DO_TILE_DATA[ADDR] BIG_BALL_SPIKE_FORTY_FIVE_TWO_SPR_TILE_DATA               
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
   .DB $FF                                               ; END 
 
_F}_BALL_BOUNCE_SPIKE_RUSH_TD_SPRITE_SCRIPT 

_F{_PLAYER_ACROSS_SCREEN_CREDITS_SPRITE_SCRIPT

PLAYER_ACROSS_SCREEN_CREDITS_SPRITE_SCRIPT:              ; 0X83 PLAYER TACKLING RB (CREDITS) 
   .DB $F6 , $32 , $00 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $52                                           ; SET SPRITE PALLETE INDEX  TO: 82
   .DB $F8 , $2E , $2E                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 92 
   DO_TILE_DATA[ADDR] DEFENDER_TRYING_TACKLE_BARRY_SPR_TILE_DATA               
   .DB $FB , $00 , $7F , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 8 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
   .DB $F6 , $28 , $00 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $37                                           ; SET SPRITE PALLETE INDEX  TO: 55
   .DB $F8 , $2C , $8E                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 168 OFFSCREEN
   DO_TILE_DATA[ADDR] BARRY_ACROSS_SCREEN_SPR_TILE_DATA              
   .DB $FB , $00 , $81 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 8 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_PLAYER_ACROSS_SCREEN_CREDITS_SPRITE_SCRIPT   

_F{_GATORADE_SUPERBOWL_SPRITE_SCRIPT


GATORADE_SUPERBOWL_SPRITE_SCRIPT:                        ; 0X84 GATORADE CONTAINER 
   .DB $F6 , $57 , $00 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $40                                           ; SET SPRITE PALLETE INDEX  TO: 64
   .DB $F8 , $20 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 64 ,  X: 128 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] GATORADE_ONE_SPR_TILE_DATA               
   .DB $16                                               ; SCROLL OR WAIT FOR: 44 FRAMES
   DO_TILE_DATA[ADDR] GATORADE_TWO_SPR_TILE_DATA         ; SET SPRITE DATA ADDR = AD2E = GATORADE CONTAINER AFTER DUMP TILES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_GATORADE_SUPERBOWL_SPRITE_SCRIPT   

_F{_PLAYER_HAND_IN_AIR_CREDITS_SPRITE_SCRIPT

PLAYER_HAND_IN_AIR_CREDITS_SPRITE_SCRIPT:                ; 0X85 PLAYER HAND IN AIR CREDITS
   .DB $F6 , $00 , $55 , $6F , $7F                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $41                                           ; SET SPRITE PALLETE INDEX  TO: 65
   .DB $F8 , $2C , $26                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 76 
    DO_TILE_DATA[ADDR] PLAYER_ARM_BENT_CREDITS_SPR_TILE_DATA                                        
   .DB $FB , $00 , $20 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 20  ,  XSPEED INC/FRM:: 0
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
    DO_TILE_DATA[ADDR] PLAYER_ARM_IN_AIR_CREDITS_SPR_TILE_DATA                                          
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_PLAYER_HAND_IN_AIR_CREDITS_SPRITE_SCRIPT   

_F{_BLIMP_MOTOR_SPRITE_SCRIPT

BLIMP_MOTOR_SPRITE_SCRIPT:                               ; 0X86 TINY BLIMP MOTOR
   .DB $F6 , $00 , $00 , $00 , $67                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $3D                                           ; SET SPRITE PALLETE INDEX  TO: 61
   .DB $F8 , $2C , $50                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 160 
   .DB $FB , $00 , $FC , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
  
 LOOP_START[] 
 
  DO_TILE_DATA[ADDR] BLIMP_MOTOR_ONE_SPR_TILE_DATA
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   DO_TILE_DATA[ADDR] BLIMP_MOTOR_TWO_SPR_TILE_DATA
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   
 LOOP_END[] 
 
_F}_BLIMP_MOTOR_SPRITE_SCRIPT 

_F{_BALOONS_SPRITE_SCRIPTS

BALOONS_ONE_SPRITE_SCRIPT:                               ; 0X87 BALOONS 1
   .DB $F6 , $00 , $00 , $00 , $67                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $3D                                           ; SET SPRITE PALLETE INDEX  TO: 61
   .DB $F8 , $3E , $36                                       ; SET SPRITE STARTING LOCATION= Y: 124 ,  X: 108 
   DO_TILE_DATA[ADDR] BALLOON_ONE_SPR_TILE_DATA        
   .DB $FB , $F8 , $04 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP                                         

BALOONS_TWO_SPRITE_SCRIPT:                               ; 0X88 BALOONS 2
   .DB $F6 , $00 , $00 , $00 , $67                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $3D                                           ; SET SPRITE PALLETE INDEX  TO: 61
   .DB $F8 , $3E , $36                                       ; SET SPRITE STARTING LOCATION= Y: 124 ,  X: 108 
   DO_TILE_DATA[ADDR] BALLOON_TWO_SPR_TILE_DATA
   .DB $FB , $FC , $02 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 
   
_F}_BALOONS_SPRITE_SCRIPTS   

_F{_KISS_CHEER_HAIR_SPRITE_SCRIPT

KISS_CHEER_HAIR_SPRITE_SCRIPT:                                                    ; 0X89 CHEERLEADER HAIR (KISS)
   .DB $F6 , $00 , $00 , $00 , $67                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $33                                           ; SET SPRITE PALLETE INDEX  TO: 51
   .DB $F8 , $3C , $98                                       ; SET SPRITE STARTING LOCATION= Y: 120 ,  X: 136 OFFSCREEN
   DO_TILE_DATA[ADDR] CHEER_TORSO_BRA_SPR_TILE_DATA               
   JUMP_SPRITE_SCRIPT[ADDR] FLIP_SCROLL_DIRECTION_AND_DO_ENDLESS_LOOP_SCRIPT

_F}_KISS_CHEER_HAIR_SPRITE_SCRIPT   

_F{_BLANK_TILES_FOR_REF_FG_GOOD_SPRITE_SCRIPT

BLANK_TILES_FOR_REF_FG_GOODL_SPRITE_SCRIPT:              ; 0X8A BLANK TILES (FG GOOD) 
   .DB $F6 , $5C , $5D , $10 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $43                                           ; SET SPRITE PALLETE INDEX  TO: 67
   .DB $F8 , $44 , $00                                       ; SET SPRITE STARTING LOCATION= Y: 136 ,  X: 0 
   DO_TILE_DATA[ADDR] BLANK_TILES_FOR_FG_GOOD_SPR_TILE_DATA                                          ; SET SPRITE DATA ADDR = B94A= BLANK TILES FOR FG GOOD
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

_F}_BLANK_TILES_FOR_REF_FG_GOOD_SPRITE_SCRIPT

A1A9:
   .DB $FF                                               ; END *** unused

EMPTY_TWO_SPRITE_SCRIPT:                                 ; 0X8B *** UNUSED
   .DB $FF                                               ; END


_F{_FG_BOUNCE_IN_OUT_SPRITE_SCRIPTS

BALL_BOUNCE_IN_RT_UPRIGHT_P2_SPRITE_SCRIPT:             ; 0X8C BALL BOUNCING IN P1 RIGHT UPRIGHT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $1E , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 60 ,  X: 188 
   .DB $FB , $FC , $E2 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:00
   DO_SUBROUTINE[ADDR] BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB
   .DB $FB , $14 , $E0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 1 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:00
   JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_AFTER_HIT_POST_GOING_IN_SPR_SCRIPT

BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB:              ; *** COULD COMBINE INTO ONE SUBROUTINE SPINNING BALL GOING TOWARDS GOALPOST
   .DB $E7                                               ; SET NUMBER OF TIMES TO LOOP = 7
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_ONE_SPR_TILE_DATA 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_TWO_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_THREE_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F7                                               ; TIMES TO LOOP--
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB:                       ; BALL HITTING GOALPOST STOP BALL SCROLL
   .DB $FB , $00 , $00 , $00 , $00                       ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BALL_HIT_GOAL_POST_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES 
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

BALL_SPIN_AFTER_HIT_POST_GOING_IN_SPR_SCRIPT:           ; SPINNING BALL AFTER HITTING GOALPOST AND GOES IN
   .DB $E4                                               ; SET NUMBER OF TIMES TO LOOP = 4 
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_ONE_SPR_TILE_DATA 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_TWO_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_THREE_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F7                                               ; TIMES TO LOOP--
   .DB $FF                                               ; END

BALL_SPIN_AFTER_HIT_POST_GOING_OUT_SPR_SCRIPT:                                                    ; SPINNING BALL AFTER HITTING GOALPOST AND GOES OUT
   .DB $E6                                               ; SET NUMBER OF TIMES TO LOOP = 6
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_ONE_SPR_TILE_DATA 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_TWO_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_THREE_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F7                                               ; TIMES TO LOOP--
   .DB $FF                                               ; END

BALL_BOUNCE_IN_LT_UPRIGHT_P2_SPRITE_SCRIPT:              ; 0X8D BALL BOUNCING IN P1 LEFT UPRIGHT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $2E , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 188 
   .DB $FB , $04 , $E2 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 14
   DO_SUBROUTINE[ADDR] BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB                                          
   .DB $FB , $EC , $E0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 14 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 14
   JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_AFTER_HIT_POST_GOING_IN_SPR_SCRIPT                                          

BALL_BOUNCE_OUT_RT_UPRIGHT_P2_SPRITE_SCRIPT :            ; 0X8E BALL BOUNCING OUT P2 RIGHT UPRIGHT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $1E , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 60 ,  X: 188 
   .DB $FB , $FC , $E2 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 14
   DO_SUBROUTINE[ADDR] BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB
   .DB $FB , $20 , $10 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 2 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_AFTER_HIT_POST_GOING_OUT_SPR_SCRIPT                                        

BALL_BOUNCE_OUT_LT_UPRIGHT_P2_SPRITE_SCRIPT :            ; 0X8F BALL BOUNCING OUT P2 LEFT UPRIGHT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $2E , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 188 
   .DB $FB , $04 , $E2 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 14
   DO_SUBROUTINE[ADDR] BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB
   .DB $FB , $E0 , $10 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 14 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_AFTER_HIT_POST_GOING_OUT_SPR_SCRIPT

FLICKER_RIGHT_POST_P2_SPRITE_SCRIPT:                     ; 0X90 FLICKERING FOR BALL HITTING P2 RIGHT POST
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $18 , $34                                       ; SET SPRITE STARTING LOCATION= Y: 48 ,  X: 104 
   DO_SUBROUTINE[ADDR] BALL_HITS_TOP_POST_SPR_SCRIPT_SUB                                        

LOOP_START[]                                                    ; BALL HITS TOP POST FLICKERING LOOP

   .DB $F8 , $18 , $B4                                   ; SET SPRITE STARTING LOCATION= Y: 48 ,  X: 208 OFFSCREEN
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F8 , $18 , $34                                       ; SET SPRITE STARTING LOCATION= Y: 48 ,  X: 104 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   
LOOP_END[]  

BALL_HITS_TOP_POST_SPR_SCRIPT_SUB:                                                    ; BALL HITS POST  TOP
   .DB $15                                               ; SCROLL OR WAIT FOR: 42 FRAMES
   DO_TILE_DATA[ADDR] TOP_POST_SPR_TILE_DATA                                         
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

FLICKER_LEFT_POST_P2_SPRITE_SCRIPT:                      ; 0X91 FLICKERING FOR BALL HITTING P2 LEFT POST
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $34 , $34                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 104 
   DO_SUBROUTINE[ADDR] BALL_HITS_BOT_POST_SPR_SCRIPT_SUB                                        

LOOP_START[]                                                   ; BALL HITS BOT POST FLICKERING LOOP

   .DB $F8 , $34 , $B4                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 152 OFFSCREEN
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F8 , $34 , $34                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 104 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   
LOOP_END[] 

BALL_HITS_BOT_POST_SPR_SCRIPT_SUB:                                                    ; BALL HITS POST BOT
   .DB $15                                               ; SCROLL OR WAIT FOR: 42 FRAMES
   DO_TILE_DATA[ADDR] BOT_POST_SPR_TILE_DATA                                          ; SET SPRITE DATA ADDR = AC03 = BALL/POST FLICKER TILE BOT
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

LEFT_POST_SCROLL_P2_SPRITE_SCRIPT:                       ; 0X92 P2 LEFT UPRIGHT MOVING
   .DB $F6 , $3C , $3D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $01                                           ; SET SPRITE PALLETE INDEX  TO: 1
   .DB $F8 , $2C , $0E                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 28 
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   .DB $FB , $00 , $14 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   JUMP_SPRITE_SCRIPT[ADDR] BOTTOM_UPRIGHT_LOOP_SPR_SCRIPT                                       

RIGHT_POST_SCROLL_P2_SPRITE_SCRIPT:                      ; 0X93 P2 RIGHT UPRIGHT MOVING
   .DB $F6 , $3C , $3D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $01                                           ; SET SPRITE PALLETE INDEX  TO: 1
   .DB $F8 , $2C , $12                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 36 
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   .DB $FB , $00 , $14 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
  JUMP_SPRITE_SCRIPT[ADDR] TOP_UPRIGHT_LOOP_SPR_SCRIPT                                        

P1_BALL_THRU_UPRIGHT_BALL_SPRITE_SCRIPT :                ; 0X94 BALL GOING THROUGH GOAL POSTS P1
   .DB $F6 , $3C , $3D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $01                                           ; SET SPRITE PALLETE INDEX  TO: 1
   .DB $F8 , $26 , $FE                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 180 OFFSCREEN
   .DB $FB , $F0 , $30 , $F8 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 3 ,  Y SPEED INC/FRM: 248  ,  XSPEED INC/FRM:: 3
  
 BALL_THRU_UPRIGHT_ANIMATION_LOOP_SPR_SCRIPT:
 
LOOP_START[]
   DO_TILE_DATA[ADDR] BALL_THRU_UPRIGHT_NINETY_SPR_TILE_DATA               
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] BALL_THRU_UPRIGHT_FORTY_FIVE_SPR_TILE_DATA              
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] BALL_THRU_UPRIGHT_ZERO_SPR_TILE_DATA             
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_TILE_DATA[ADDR] BALL_THRU_UPRIGHT_FORTY_FIVE_SPR_TILE_DATA 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $FA                                               ; SAVE CUTSCENE SIDE IN SPR RAM
   
LOOP_END[]

BALL_BOUNCE_IN_LT_UPRIGHT_P1_SPRITE_SCRIPT:              ; 0X95 BALL HITS P1 LEFT UPRIGHT AND GOES IN
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $1E , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 60 ,  X: 60 
   .DB $FB , $FC , $1E , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_SUBROUTINE[ADDR] BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB
   .DB $FB , $14 , $20 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 1 , X PIXELS/FRM: 2 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 2
   JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_AFTER_HIT_POST_GOING_IN_SPR_SCRIPT

BALL_BOUNCE_IN_RT_UPRIGHT_P1_SPRITE_SCRIPT:              ; 0X96 BALL HITS P2 LEFT UPRIGHT AND GOES IN
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $2E , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 60 
   .DB $FB , $04 , $1E , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_SUBROUTINE[ADDR] BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB
   .DB $FB , $EC , $20 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 14 , X PIXELS/FRM: 2 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 2
   JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_AFTER_HIT_POST_GOING_IN_SPR_SCRIPT

BALL_BOUNCE_OUT_LT_UPRIGHT_P1_SPRITE_SCRIPT:             ; 0X97 BALL HITS P1 LEFT UPRIGHT AND GOES OUT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $1E , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 60 ,  X: 60 
   .DB $FB , $FC , $1E , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_SUBROUTINE[ADDR] BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB
   .DB $FB , $20 , $F0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 2 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_AFTER_HIT_POST_GOING_OUT_SPR_SCRIPT

BALL_BOUNCE_OUT_RT_UPRIGHT_P1_SPRITE_SCRIPT:             ; 0X98 BALL HITS P1 RIGHT UPRIGHT AND GOES OUT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $2E , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 60 
   .DB $FB , $04 , $1E , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_SUBROUTINE[ADDR] BALL_SPIN_TWOARDS_GOAL_POST_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] BALL_HIT_GOAL_POST_SPR_SCRIPT_SUB
   .DB $FB , $E0 , $F0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 14 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   JUMP_SPRITE_SCRIPT[ADDR] BALL_SPIN_AFTER_HIT_POST_GOING_OUT_SPR_SCRIPT

FLICKER_LEFT_POST_P1_SPRITE_SCRIPT:                      ; 0X99 FLICKERING FOR BALL HITTING P1 LEFT POST
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $18 , $48                                       ; SET SPRITE STARTING LOCATION= Y: 48 ,  X: 144 
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_SUBROUTINE[ADDR] BALL_HITS_TOP_POST_SPR_SCRIPT_SUB
 
LOOP_START[] 
   .DB $F8 , $18 , $C8                                       ; SET SPRITE STARTING LOCATION= Y: 48 ,  X: 208 OFFSCREEN
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F8 , $18 , $48                                       ; SET SPRITE STARTING LOCATION= Y: 48 ,  X: 144 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
LOOP_END[]

FLICKER_RIGHT_POST_P1_SPRITE_SCRIPT:                     ; 0X9A FLICKERING FOR BALL HITTING P1 RIGHT POST
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $34 , $48                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 144 
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_SUBROUTINE[ADDR] BALL_HITS_BOT_POST_SPR_SCRIPT_SUB
  
LOOP_START[]  
   .DB $F8 , $34 , $C8                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 152 OFFSCREEN
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F8 , $34 , $48                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 144 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
LOOP_END[]

_F}_FG_BOUNCE_IN_OUT_SPRITE_SCRIPTS

_F{_QB_DROPBACK_INTRO_SPRITE_SCRIPT

QB_DROPBACK_INTRO_SPRITE_SCRIPT:                        ; 0X9B QUARTERBACK DROPBACK (INTRO)
   .DB $F6 , $42 , $00 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $1F                                           ; SET SPRITE PALLETE INDEX  TO: 31
   .DB $F8 , $30 , $46                                       ; SET SPRITE STARTING LOCATION= Y: 96 ,  X: 140 
   DO_TILE_DATA[ADDR] QB_DROPBACK_SPR_TILE_DATA              
   .DB $FB , $00 , $F0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   .DB $14                                               ; SCROLL OR WAIT FOR: 40 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT 
   
_F}_QB_DROPBACK_INTRO_SPRITE_SCRIPT  

_F{_P2_FG_SHORT_SPRITE_SCRIPT

P2_FG_SHORT_SPRITE_SCRIPT:                         				; 0X9C P2 FG BALL IS SHORT *** could move data near p1 
   .DB $F6 , $3C , $3D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $01                                           ; SET SPRITE PALLETE INDEX  TO: 1
   .DB $F8 , $26 , $76                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 236 
   .DB $FB , $F0 , $E0 , $F0 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 240  ,  XSPEED INC/FRM:: 14
   JUMP_SPRITE_SCRIPT[ADDR] FG_SHORT_LOOP_SPR_SCRIPT  

_F}_P2_FG_SHORT_SPRITE_SCRIPT   

_F{_NFL_SHIELD_SCROLL_DOWN_SPRITE_SCRIPT

NFL_SHIELD_SCROLL_DOWN_SPRITE_SCRIPT:                   ; 0X9D NFL SHIELD SCROLLING DOWN
   .DB $F6 , $18 , $19 , $0F , $1D                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $44 , $3F                                       ; SET SPRITE STARTING LOCATION= Y: 136 ,  X: 126 
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   DO_TILE_DATA[ADDR] NFL_SHIELD_SPR_TILE_DATA
   .DB $FB , $08 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $1E                                               ; SCROLL OR WAIT FOR: 60 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_NFL_SHIELD_SCROLL_DOWN_SPRITE_SCRIPT   

_F{_CHEER_EYES_WINK_SPRITE_SCRIPT

CHEER_EYES_WINK_SPRITE_SCRIPT:                          ; 0X9E CHEERLEADER EYES
   .DB $F6 , $31 , $00 , $66 , $67                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $3B                                           ; SET SPRITE PALLETE INDEX  TO: 59
   .DB $F8 , $40 , $3C                                       ; SET SPRITE STARTING LOCATION= Y: 128 ,  X: 120 
   .DB $F1 , $01 , $80                                       ; SET SPRITE TOPOFFSCREEN THRESHOLDTO: 128
   .DB $29                                               ; SCROLL OR WAIT FOR: 82 FRAMES
   DO_TILE_DATA[ADDR] CHEER_WINK_EYE_OPEN_SPR_TILE_DATA              
   .DB $FD                                               ; START SCROLLING AND FLIP SCROLL DIRECTION
   .DB $20                                               ; SCROLL OR WAIT FOR: 64 FRAMES
   DO_TILE_DATA[ADDR] CHEER_WINK_ONE_SPR_TILE_DATA
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   DO_TILE_DATA[ADDR] CHEER_WINK_TWO_SPR_TILE_DATA               
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_CHEER_EYES_WINK_SPRITE_SCRIPT   

_F{_BARRY_SCROLL_INTRO_SPRITE_SCRIPT

BARRY_SCROLL_INTRO_SPRITE_SCRIPT:                       ; 0X9F BARRY FAST SCROLL LEFT TO RIGHT
   .DB $F6 , $28 , $00 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $F8 , $26 , $FE                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 180 OFFSCREEN
   .DB $FB , $00 , $60 , $00 , $60                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 6 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 6
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_TILE_DATA[ADDR] BARRY_ACROSS_SCREEN_SPR_TILE_DATA
   DO_SUBROUTINE[ADDR] BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $0E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 28 
   DO_SUBROUTINE[ADDR] BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $FE                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 180 OFFSCREEN
   DO_SUBROUTINE[ADDR] BARRY_PAL_TWO_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 60 
   DO_SUBROUTINE[ADDR] BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $0E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 28 
   DO_SUBROUTINE[ADDR] BARRY_PAL_TWO_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $FE                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 180 OFFSCREEN
   DO_SUBROUTINE[ADDR] BARRY_PAL_THREE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $2E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 92 
   DO_SUBROUTINE[ADDR] BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 60 
    DO_SUBROUTINE[ADDR] BARRY_PAL_TWO_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $0E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 28 
   DO_SUBROUTINE[ADDR] BARRY_PAL_THREE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $FE                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 180 OFFSCREEN
   DO_SUBROUTINE[ADDR] BARRY_PAL_FOUR_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $3E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 124 
   DO_SUBROUTINE[ADDR] BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $2E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 92 
    DO_SUBROUTINE[ADDR] BARRY_PAL_TWO_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 60 
   DO_SUBROUTINE[ADDR] BARRY_PAL_THREE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $0E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 28 
  DO_SUBROUTINE[ADDR] BARRY_PAL_FOUR_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $4E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 156 
   DO_SUBROUTINE[ADDR] BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $3E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 124 
    DO_SUBROUTINE[ADDR] BARRY_PAL_TWO_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $2E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 92 
   DO_SUBROUTINE[ADDR] BARRY_PAL_THREE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 60 
   DO_SUBROUTINE[ADDR] BARRY_PAL_FOUR_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 188 
  DO_SUBROUTINE[ADDR] BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $4E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 156 
  DO_SUBROUTINE[ADDR] BARRY_PAL_TWO_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $3E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 124 
   DO_SUBROUTINE[ADDR] BARRY_PAL_THREE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $2E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 92 
   DO_SUBROUTINE[ADDR] BARRY_PAL_FOUR_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $6E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 220 
   DO_SUBROUTINE[ADDR] BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 188 
   DO_SUBROUTINE[ADDR] BARRY_PAL_TWO_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $4E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 156 
   DO_SUBROUTINE[ADDR] BARRY_PAL_THREE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $3E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 124 
   DO_SUBROUTINE[ADDR] BARRY_PAL_FOUR_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $7E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 252 
   DO_SUBROUTINE[ADDR] BARRY_PAL_THREE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $6E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 220 
   DO_SUBROUTINE[ADDR] BARRY_PAL_FOUR_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $8E                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 180 OFFSCREEN
   DO_SUBROUTINE[ADDR] BARRY_PAL_FOUR_FOR_TWO_FRAMES_SPR_SCRIPT_SUB
   .DB $FF                                               ; END

BARRY_PAL_ONE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB:             ; BARRY PALLETE (1) FOR 2 FRAMES   
   .DB $F0 , $37                                           ; SET SPRITE PALLETE INDEX TO 55 AND FULLY FADED IN
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN 

BARRY_PAL_TWO_FOR_TWO_FRAMES_SPR_SCRIPT_SUB:              ; BARRY PALLETE (2) FOR 2 FRAMES
   .DB $F0 , $38                                           ; SET SPRITE PALLETE INDEX TO 56 AND FULLY FADED IN
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN 

BARRY_PAL_THREE_FOR_TWO_FRAMES_SPR_SCRIPT_SUB:                                                    ; BARRY PALLETE (3) FOR 2 FRAMES
   .DB $F0 , $39                                           ; SET SPRITE PALLETE INDEX TO 57 AND FULLY FADED IN
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN 

BARRY_PAL_FOUR_FOR_TWO_FRAMES_SPR_SCRIPT_SUB:                                                    ; BARRY PALLETE (4) FOR 2 FRAMES 
   .DB $F0 , $3A                                           ; SET SPRITE PALLETE INDEX TO 58 AND FULLY FADED IN
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN
   
_F}_BARRY_SCROLL_INTRO_SPRITE_SCRIPT   

_F{_REF_THIRD_AND_FOURTH_DOWN_SPRITE_SCRIPTS

REF_THIRD_DOWN_SPRITE_SCRIPT:                           ; 0XA0 REF THIRD DOWN *** could move with other ref scripts
   DO_SUBROUTINE[ADDR] START_OF_REF_DOWN_SIGNAL_SPR_SCRIPT_SUB
   DO_TILE_DATA[ADDR] REF_THIRD_DOWN_SPR_TILE_DATA                                          ; SET SPRITE DATA ADDR = B31F
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

INIT_LARGE_REF_PAL_AND_LOC_SPR_SCRIPT_SUB:
   .DB $F6 , $5C , $5D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $43                                           ; SET SPRITE PALLETE INDEX  TO: 67
   .DB $F8 , $34 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 128 
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN 

REF_FOURTH_DOWN_SPRITE_SCRIPT :                          ; 0XA1 REF 4TH DOWN
   DO_SUBROUTINE[ADDR] START_OF_REF_DOWN_SIGNAL_SPR_SCRIPT_SUB
   DO_TILE_DATA[ADDR] REF_FOURTH_DOWN_SPR_TILE_DATA                                         
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_REF_THIRD_AND_FOURTH_DOWN_SPRITE_SCRIPTS   

_F{_POINT_KICK_CHOICE_SPRITE_SCRIPTS

P2_POINT_KICK_CHOICE_SPRITE_SCRIPT:                     ; 0XA2 P1 WITH P2 POINTING AFTER KICKOFF CHOICE
   .DB $F8 , $2F , $48                                       ; SET SPRITE STARTING LOCATION= Y: 94 ,  X: 144 
   DO_TILE_DATA[ADDR] P2_POINTING_KICK_CHOICE_SPR_TILE_DATA                                          
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

P1_POINT_KICK_CHOICE_SPRITE_SCRIPT:                     ; 0XA3 P1 POINTING WITH P2 AFTER KICKOFF CHOICE
   .DB $F8 , $2F , $48                                       ; SET SPRITE STARTING LOCATION= Y: 94 ,  X: 144 
   DO_TILE_DATA[ADDR] P1_POINTING_KICK_CHOICE_SPR_TILE_DATA                                          
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

_F}_POINT_KICK_CHOICE_SPRITE_SCRIPTS   
  
_F{_COIN_TOSS_SPRITE_SCRIPTS  

REF_COIN_TOSS_P1_CHOICE_SPRITE_SCRIPT:                   ; 0xA4 REFEREE COIN TOSS P1 WINS
   DO_SUBROUTINE[ADDR] INIT_REF_COIN_TOSS_SPR_SCRIPT_SUB
   DO_SUBROUTINE[ADDR] REF_FLIPS_COIN_SPR_SCRIPT_SUB                                          
   DO_TILE_DATA[ADDR] REF_POINTS_P1_COIN_TOSS_SPR_TILE_DATA                                         
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 

INIT_REF_COIN_TOSS_SPR_SCRIPT_SUB:                                                    ; INTIALIZE REF SPRITE
   .DB $F6 , $00 , $55 , $00 , $33                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $42                                           ; SET SPRITE PALLETE INDEX  TO: 66
   .DB $F8 , $29 , $3D                                       ; SET SPRITE STARTING LOCATION= Y: 82 ,  X: 122 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN 

REF_FLIPS_COIN_SPR_SCRIPT_SUB :                                                    ; REF ANIMATION FOR COIN TOSS
   DO_TILE_DATA[ADDR] REF_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA                                           ;
   .DB $5A                                               ; SCROLL OR WAIT FOR: 180 FRAMES
   DO_TILE_DATA[ADDR] REF_FLIP_COIN_SPR_TILE_DATA  
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
    DO_TILE_DATA[ADDR] REF_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA 
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
    DO_TILE_DATA[ADDR] REF_LOOKING_UP_COIN_TOSS_SPR_TILE_DATA 
   .DB $1E                                               ; SCROLL OR WAIT FOR: 60 FRAMES
    DO_TILE_DATA[ADDR] REF_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA 
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   DO_TILE_DATA[ADDR] REF_LOOKING_DOWN_COIN_TOSS_SPR_TILE_DATA 
   .DB $14                                               ; SCROLL OR WAIT FOR: 40 FRAMES
     DO_TILE_DATA[ADDR] REF_PICK_UP_COIN_SPR_TILE_DATA                                     
   .DB $14                                               ; SCROLL OR WAIT FOR: 40 FRAMES
    DO_TILE_DATA[ADDR]  REF_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA 
   .DB $26                                               ; SCROLL OR WAIT FOR: 76 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

REF_COIN_TOSS_P2_CHOICE_SPRITE_SCRIPT:                   ; 0xA5 REFEREE COIN TOSS P2 WINS
   DO_SUBROUTINE[ADDR] INIT_REF_COIN_TOSS_SPR_SCRIPT_SUB                                     
   DO_SUBROUTINE[ADDR] REF_FLIPS_COIN_SPR_SCRIPT_SUB
   DO_TILE_DATA[ADDR] REF_POINTS_P2_COIN_TOSS_SPR_TILE_DATA                                        
  JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 
  
  

P1_RUNNING_AND_REF_COIN_TOSS_SPR_SCRIPT:                 ; 0XA6 P1 PLAYER RUNNING TOWARD REF + COIN IN AIR
   .DB $F6 , $00 , $55 , $00 , $33                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $42                                           ; SET SPRITE PALLETE INDEX  TO: 66
   .DB $F8 , $2F , $F8                                       ; SET SPRITE STARTING LOCATION= Y: 94 ,  X: 162 OFFSCREEN
   DO_TILE_DATA[ADDR] P1_RUNNING_COIN_TOSS_SPR_TILE_DATA                                           
   .DB $FB , $00 , $10 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   
       .DB $E5                                           ; SET NUMBER OF TIMES TO LOOP = 5
   DO_SUBROUTINE[ADDR] SMALL_PLAYER_RUNNING_SPR_SCRIPT_SUB
   .DB $F7                                               ; TIMES TO LOOP--
   .DB $F8 , $2B , $3C                                       ; SET SPRITE STARTING LOCATION= Y: 86 ,  X: 120 
   DO_TILE_DATA[ADDR] COIN_FACING_DOWN_SPR_TILE_DATA 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $2D                                               ; SCROLL OR WAIT FOR: 90 FRAMES
   .DB $FB , $E0 , $00 , $F0 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 14 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 240  ,  XSPEED INC/FRM:: 0
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   DO_TILE_DATA[ADDR] COIN_SPIN_ONE_SPR_TILE_DATA                
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] COIN_SPIN_TWO_SPR_TILE_DATA
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] COIN_FACING_UP_SPR_TILE_DATA               
   .DB $06                                               ; SCROLL OR WAIT FOR: 12 FRAMES
   DO_TILE_DATA[ADDR] COIN_SPIN_TWO_SPR_TILE_DATA
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] COIN_SPIN_ONE_SPR_TILE_DATA 
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] COIN_FACING_DOWN_SPR_TILE_DATA
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $32                                               ; SCROLL OR WAIT FOR: 100 FRAMES
   .DB $FF                                               ; END
   
_F}_COIN_TOSS_SPRITE_SCRIPTS     

_F{_SCROLL_UPRIGHT_SPRITE_SCRIPTS  

RIGHT_POST_SCROLL_P1_SPRITE_SCRIPT:                      ; 0XA7 P1 RIGHT UPRIGHT MOVING
   .DB $F6 , $3C , $3D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $01                                           ; SET SPRITE PALLETE INDEX  TO: 1
   .DB $F8 , $2C , $66                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 204 
   .DB $FB , $00 , $EC , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0

BOTTOM_UPRIGHT_LOOP_SPR_SCRIPT:
   
LOOP_START[]
   DO_TILE_DATA[ADDR] UNEEDED_JUMP_TO_BOTTOM_UPRIGHT_SPR_TILE_DATA   ; *** DOES A JUMP TO JUMP                                        
   .DB $2D                                               ; SCROLL OR WAIT FOR: 90 FRAMES
LOOP_END[]

LEFT_POST_SCROLL_P1_SPRITE_SCRIPT:                       ; 0XA8 P1 LEFT UPRIGHT MOVING
   .DB $F6 , $3C , $3D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $01                                           ; SET SPRITE PALLETE INDEX  TO: 1
   .DB $F8 , $2C , $62                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 196 
   .DB $FB , $00 , $EC , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0

TOP_UPRIGHT_LOOP_SPR_SCRIPT:                             ; P1 LEFT UPRIGHT LOOP

LOOP_START[]
   DO_TILE_DATA[ADDR] TOP_UPRIGHT_SPR_TILE_DATA              
   .DB $2D                                               ; SCROLL OR WAIT FOR: 90 FRAMES
LOOP_END[]

_F}_SCROLL_UPRIGHT_SPRITE_SCRIPTS 

_F{_WAVE_HALFTIME_SPR_SCRIPTS

WAVE_ONE_HALFTIME_SPRITE_SCRIPT:                         ; 0XA9 WAVE 1 HALFTIME
   .DB $F6 , $31 , $00 , $66 , $67                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $36                                           ; SET SPRITE PALLETE INDEX  TO: 54
   .DB $F8 , $38 , $06                                       ; SET SPRITE STARTING LOCATION= Y: 112 ,  X: 12 
   .DB $F1 , $01 , $80                                       ; SET SPRITE TOPOFFSCREEN THRESHOLDTO: 128
   .DB $FB , $00 , $F8 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_SUBROUTINE[ADDR] WAVE_ANIMATION_SPR_SCRIPT_SUB			;*** COULD COMBINE INTO ONE SUBROUTINE
   DO_SUBROUTINE[ADDR] SET_WAVE_OFFSCREEN_SPR_SCRIPT_SUB                                       
   .DB $F8 , $38 , $2E                                       ; SET SPRITE STARTING LOCATION= Y: 112 ,  X: 92 
   DO_SUBROUTINE[ADDR] WAVE_ANIMATION_SPR_SCRIPT_SUB		;*** COULD COMBINE INTO ONE SUBROUTINE
   DO_SUBROUTINE[ADDR] SET_WAVE_OFFSCREEN_SPR_SCRIPT_SUB 
   .DB $F8 , $38 , $56                                       ; SET SPRITE STARTING LOCATION= Y: 112 ,  X: 172 
   DO_SUBROUTINE[ADDR] WAVE_ANIMATION_SPR_SCRIPT_SUB
   .DB $FF                                               ; END

WAVE_ANIMATION_SPR_SCRIPT_SUB:                                                    ; WAVE ANIMATION 
   DO_TILE_DATA[ADDR] HALFTIME_WAVE_ONE_SPR_TILE_DATA   
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] HALFTIME_WAVE_TWO_SPR_TILE_DATA  
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] HALFTIME_WAVE_THREE_SPR_TILE_DATA 
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] HALFTIME_WAVE_FOUR_SPR_TILE_DATA 
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] HALFTIME_WAVE_FIVE_SPR_TILE_DATA
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] HALFTIME_WAVE_SIX_SPR_TILE_DATA
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] HALFTIME_WAVE_SEVEN_SPR_TILE_DATA
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] HALFTIME_WAVE_EIGHT_SPR_TILE_DATA
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

SET_WAVE_OFFSCREEN_SPR_SCRIPT_SUB:
   .DB $F8 , $38 , $BE                                   ; SET SPRITE STARTING LOCATION= Y: 112 ,  X: 144 OFFSCREEN
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

WAVE_TWO_HALFTIME_SPRITE_SCRIPT:                         ; 0XAA WAVE 2 HALFTIME 
   .DB $F6 , $31 , $00 , $66 , $67                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $36                                           ; SET SPRITE PALLETE INDEX  TO: 54
   .DB $19                                               ; SCROLL OR WAIT FOR: 50 FRAMES
   .DB $F8 , $38 , $1A                                       ; SET SPRITE STARTING LOCATION= Y: 112 ,  X: 52 
   .DB $F1 , $01 , $80                                       ; SET SPRITE TOPOFFSCREEN THRESHOLDTO: 128
   .DB $FB , $00 , $F8 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_SUBROUTINE[ADDR] WAVE_ANIMATION_SPR_SCRIPT_SUB   			;*** COULD COMBINE INTO ONE SUBROUTINE                                  
  DO_SUBROUTINE[ADDR] SET_WAVE_OFFSCREEN_SPR_SCRIPT_SUB 
   .DB $F8 , $38 , $42                                       ; SET SPRITE STARTING LOCATION= Y: 112 ,  X: 132 
   DO_SUBROUTINE[ADDR] WAVE_ANIMATION_SPR_SCRIPT_SUB		 ; *** COULD COMBINE INTO ONE SUBROUTINE
  DO_SUBROUTINE[ADDR] SET_WAVE_OFFSCREEN_SPR_SCRIPT_SUB 
   .DB $F8 , $38 , $6A                                       ; SET SPRITE STARTING LOCATION= Y: 112 ,  X: 212 
   DO_SUBROUTINE[ADDR] WAVE_ANIMATION_SPR_SCRIPT_SUB
   .DB $FF                                               ; END
   
_F}_WAVE_HALFTIME_SPR_SCRIPTS   

_F{_P1_FG_SHORT_BALL_SPRITE_SCRIPT

P1_FG_SHORT_BALL_SPRITE_SCRIPT:                          ; 0XAB P1 FG SHORT 
   .DB $F6 , $3C , $3D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $01                                           ; SET SPRITE PALLETE INDEX  TO: 1
   .DB $F8 , $26 , $FE                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 180 OFFSCREEN
   .DB $FB , $F0 , $20 , $F0 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 2 ,  Y SPEED INC/FRM: 240  ,  XSPEED INC/FRM:: 0
 
FG_SHORT_LOOP_SPR_SCRIPT: 
   .DB $E7                                           ; SET NUMBER OF TIMES TO LOOP = 7
   DO_TILE_DATA[ADDR] BALL_THRU_UPRIGHT_NINETY_SPR_TILE_DATA              
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] BALL_THRU_UPRIGHT_FORTY_FIVE_SPR_TILE_DATA 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] BALL_THRU_UPRIGHT_ZERO_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_TILE_DATA[ADDR] BALL_THRU_UPRIGHT_FORTY_FIVE_SPR_TILE_DATA 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $FA                                               ; SAVE CUTSCENE SIDE IN SPR RAM
   .DB $F7                                               ; TIMES TO LOOP--
   .DB $FF                                           ; END
   
_F}_P1_FG_SHORT_BALL_SPRITE_SCRIPT  

_F{_P2_BALL_THRU_UPRIGHT_BALL_SPRITE_SCRIPT

P2_BALL_THRU_UPRIGHT_BALL_SPRITE_SCRIPT:                 ; 0XAC P2 BALL GOING THRU GOALPOSTS
   .DB $F6 , $3C , $3D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $01                                           ; SET SPRITE PALLETE INDEX  TO: 1
   .DB $F8 , $26 , $76                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 236 
   .DB $FB , $F0 , $D0 , $F8 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 13 ,  Y SPEED INC/FRM: 248  ,  XSPEED INC/FRM:: 0
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
    JUMP_SPRITE_SCRIPT[ADDR] BALL_THRU_UPRIGHT_ANIMATION_LOOP_SPR_SCRIPT     

_F}_P2_BALL_THRU_UPRIGHT_BALL_SPRITE_SCRIPT	

_F{_LEADING_RUSHER_SIL_SPRITE_SCRIPT

LEADING_RUSHER_SIL_SPRITE_SCRIPT:                        ; 0XAD LEADING RUSHERS PLAYER SILOUHETTE
   .DB $F6 , $28 , $00 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $27                                           ; SET SPRITE PALLETE INDEX  TO: 39
   .DB $F8 , $40 , $97                                       ; SET SPRITE STARTING LOCATION= Y: 128 ,  X: 128 OFFSCREEN
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   DO_TILE_DATA[ADDR] LEADING_RUSHER_SI_SPR_TILE_DATA                                        
   .DB $FB , $00 , $90 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 9 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $0D                                               ; SCROLL OR WAIT FOR: 26 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_LEADING_RUSHER_SIL_SPRITE_SCRIPT  

_F{_FLASH_LIGHTS_CONF_CHAMP_SPRITE_SCRIPT

FLASH_LIGHTS_CONF_CHAMP_SPRITE_SCRIPT:                   ; 0XAE FLASH BULBS CONFERENCE CHAMP
   .DB $F6 , $50 , $00 , $00 , $4F                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $31                                           ; SET SPRITE PALLETE INDEX  TO: 49
   
 LOOP_START[]  
   .DB $F8 , $27 , $38                                       ; SET SPRITE STARTING LOCATION= Y: 78 ,  X: 112 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] CONF_CHAMP_BULBS_SPR_TILE_DATA                                          
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_SPR_SCRIPT_SUB
   .DB $F8 , $2E , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 188 
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_DUPE_SPR_SCRIPT_SUB
   .DB $F8 , $0B , $6E                                       ; SET SPRITE STARTING LOCATION= Y: 22 ,  X: 220 
    DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_SPR_SCRIPT_SUB
   .DB $F8 , $31 , $17                                       ; SET SPRITE STARTING LOCATION= Y: 98 ,  X: 46 
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_DUPE_SPR_SCRIPT_SUB
   .DB $F8 , $0B , $3E                                       ; SET SPRITE STARTING LOCATION= Y: 22 ,  X: 124 
    DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_SPR_SCRIPT_SUB
   .DB $F8 , $2E , $46                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 140 
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_DUPE_SPR_SCRIPT_SUB
   .DB $F8 , $27 , $16                                       ; SET SPRITE STARTING LOCATION= Y: 78 ,  X: 44 
    DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_SPR_SCRIPT_SUB
   .DB $F8 , $1E , $60                                       ; SET SPRITE STARTING LOCATION= Y: 60 ,  X: 192 
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_DUPE_SPR_SCRIPT_SUB
   .DB $F8 , $0B , $6A                                       ; SET SPRITE STARTING LOCATION= Y: 22 ,  X: 212 
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_SPR_SCRIPT_SUB
   .DB $F8 , $26 , $17                                       ; SET SPRITE STARTING LOCATION= Y: 76 ,  X: 46 
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_DUPE_SPR_SCRIPT_SUB
   .DB $F8 , $0B , $26                                       ; SET SPRITE STARTING LOCATION= Y: 22 ,  X: 76 
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_SPR_SCRIPT_SUB
   .DB $F8 , $1E , $46                                       ; SET SPRITE STARTING LOCATION= Y: 60 ,  X: 140 
   DO_SUBROUTINE[ADDR] MOVE_LIGHT_OFFSCREEN_DUPE_SPR_SCRIPT_SUB
 LOOP_END[] 

MOVE_LIGHT_OFFSCREEN_SPR_SCRIPT_SUB:                            ; WAIT 2 FRAMES THEN MOVE OFFSCREEN
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F8 , $2E , $BE                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 164 OFFSCREEN
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

MOVE_LIGHT_OFFSCREEN_DUPE_SPR_SCRIPT_SUB:                ; ***UNEEDED SAME ROUTINE
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F8 , $2E , $BE                                       ; SET SPRITE STARTING LOCATION= Y: 92 ,  X: 164 OFFSCREEN
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN
   
_F}_FLASH_LIGHTS_CONF_CHAMP_SPRITE_SCRIPT

_F{_REF_FALSE_START_SPR_SCRIPT

REF_FALSE_START_SPR_SCRIPT:                              ; 0XAF REF FALSE START *** NOT IMPLEMENTED 
   DO_SUBROUTINE[ADDR] INIT_LARGE_REF_PAL_AND_LOC_SPR_SCRIPT_SUB                                        
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] REF_FALSE_START_SPR_TILE_DATA                
                                                         ; FALSE START SIGNAL LOOP
   .DB $E4                                               ; SET NUMBER OF TIMES TO LOOP = 4
   .DB $F8 , $34 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 128 
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   .DB $F8 , $34 , $3C                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 120 
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   .DB $FA                                               ; SAVE CUTSCENE SIDE IN SPR RAM
   .DB $F7                                               ; TIMES TO LOOP-

   .DB $F8 , $34 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 128 
   DO_TILE_DATA[ADDR] REF_ONE_ARM_NINETY_ONE_ARM_SIDE_SPR_DATA                                      
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_REF_FALSE_START_SPR_SCRIPT   

_F{_REF_FG_GOOD_SPR_SCRIPT

REF_FG_GOOD_SPR_SCRIPT:                                  ; 0XB0 REF FG GOOD
   .DB $F6 , $5C , $5D , $10 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $43                                           ; SET SPRITE PALLETE INDEX  TO: 67
   .DB $F8 , $38 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 112 ,  X: 128 
   .DB $FB , $F8 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] REF_ARMS_DOWN_SPR_TILE_DATA                
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] REF_HANDS_ON_HIPS_SPR_TILE_DATA              
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
    DO_TILE_DATA[ADDR] REF_ARMS_FG_GOOD_SPR_TILE_DATA    
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_REF_FG_GOOD_SPR_SCRIPT   

_F{_START_OF_REF_DOWN_SIGNAL_SPRITE_SCRIPT

START_OF_REF_DOWN_SIGNAL_SPR_SCRIPT_SUB:                     ; 0XB1 START OF REF DOWN SIGNAL
   .DB $F6 , $5C , $5D , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $43                                           ; SET SPRITE PALLETE INDEX  TO: 67
   .DB $F8 , $34 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 128 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] REF_ARMS_DOWN_SPR_TILE_DATA               
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] REF_ONE_ARM_NINETY_ONE_ARM_SIDE_SPR_DATA 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN
   
 _F}_START_OF_REF_DOWN_SIGNAL_SPRITE_SCRIPT  
   
A688:
   .DB $FF                                               ; END *** unused

_F{_P1_REF_FIRST_DOWN_SPR_SCRIPT

P1_REF_FIRST_DOWN_SPR_SCRIPT:                            ; 0XB2 REF P1 ARM POINTING FORWARD
   DO_SUBROUTINE[ADDR] INIT_LARGE_REF_PAL_AND_LOC_SPR_SCRIPT_SUB 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] REF_ARM_BENT_FIRST_DOWN_SPR_TILE_DATA               
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
   DO_TILE_DATA[ADDR] REF_ARM_FORWARD_FOR_FIRST_DOWN_SPR_TILE_DATA               
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_P1_REF_FIRST_DOWN_SPR_SCRIPT   

_F{_REF_NO_GOOD_SIGNAL_SPR_SCRIPT

REF_NO_GOOD_SIGNAL_SPR_SCRIPT:                           ; 0XB3 REF NO GOOD SIGNAL
   DO_SUBROUTINE[ADDR] INIT_LARGE_REF_PAL_AND_LOC_SPR_SCRIPT_SUB 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
    DO_TILE_DATA[ADDR] REF_ARMS_AT_SIDES_SPR_TILE_DATA                                          
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] REF_HANDS_ON_HIPS_SPR_TILE_DATA 
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   DO_TILE_DATA[ADDR] REF_HANDS_CROSSED_ON_BELT_SPR_DATA                                      
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
    DO_TILE_DATA[ADDR] REF_ARMS_AT_SIDES_SPR_TILE_DATA
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_REF_NO_GOOD_SIGNAL_SPR_SCRIPT   

_F{_REF_FIRST_AND_SECNOD_DOWN_FINGERS_SPR_SCRIPTS

REF_FIRST_DOWN_FINGERS_SPR_SCRIPT:                       ; 0XB4 REF FIRST DOWN 
   DO_SUBROUTINE[ADDR] START_OF_REF_DOWN_SIGNAL_SPR_SCRIPT_SUB
    DO_TILE_DATA[ADDR] REF_FIRST_DOWN_SPR_TILE_DATA              
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

REF_SECOND_DOWN_FINGERS_SPR_SCRIPT:                      ; 0XB5 REF SECOND DOWN
   DO_SUBROUTINE[ADDR] START_OF_REF_DOWN_SIGNAL_SPR_SCRIPT_SUB
   DO_TILE_DATA[ADDR] REF_SECOND_DOWN_SPR_TILE_DATA
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_REF_FIRST_AND_SECNOD_DOWN_FINGERS_SPR_SCRIPTS  

_F{_COACH_CREDITS_SPR_SCRIPTS

COACH_ARM_SUPER_BOWL_SPR_SCRIPT:                         ; 0XB6 COACH ARM IN AIR (CREDITS)
   .DB $F6 , $31 , $25 , $24 , $27                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $45                                           ; SET SPRITE PALLETE INDEX  TO: 69
   .DB $F1 , $01 , $80                                       ; SET SPRITE TOPOFFSCREEN THRESHOLDTO: 128
   .DB $F8 , $28 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 80 ,  X: 128 
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   DO_TILE_DATA[ADDR] COACH_ARM_SUPER_BOWL_SPR_TILE_DATA                                        
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $3C                                               ; SCROLL OR WAIT FOR: 120 FRAMES
   .DB $FB , $F8 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $10                                               ; SCROLL OR WAIT FOR: 32 FRAMES
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   JUMP_SPRITE_SCRIPT[ADDR] FLIP_SCROLL_DIRECTION_AND_DO_ENDLESS_LOOP_SCRIPT 

COACH_MISC_SPRITES_SPR_SCRIPT:                           ; 0XB7 EXTRA SPRITES COACH BG (CREDITS)
   .DB $F6 , $31 , $25 , $24 , $27                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $45                                           ; SET SPRITE PALLETE INDEX  TO: 69
   .DB $F8 , $20 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 64 ,  X: 128 
   DO_TILE_DATA[ADDR] COACH_MISC_SPRITES_SPR_TILE_DATA                                          
   JUMP_SPRITE_SCRIPT[ADDR] FLIP_SCROLL_DIRECTION_AND_DO_ENDLESS_LOOP_SCRIPT 
   
_F}_COACH_CREDITS_SPR_SCRIPTS   

_F{_QB_INTERVIEW_CREDITS_SPR_SCRIPTS

QB_FACE_SUPER_BOWL_SPR_SCRIPT:                           ; 0XB8 PLAYER FACE INTERVIEW (CREDITS)
   .DB $F6 , $60 , $61 , $6A , $6B                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $46                                           ; SET SPRITE PALLETE INDEX  TO: 70
   .DB $F8 , $1F , $40                                       ; SET SPRITE STARTING LOCATION= Y: 62 ,  X: 128 
   DO_TILE_DATA[ADDR]  QB_FACE_SUPER_BOWL_SPR_TILE_DATA                                      
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

MICS_FROM_LEFT_SUPER_BOWL_SPR_SCRIPT:                    ; 0XB9 MICS FROM LEFT (CREDITS)
   .DB $F6 , $60 , $61 , $6A , $6B                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $46                                           ; SET SPRITE PALLETE INDEX  TO: 70
   .DB $F8 , $2C , $1A                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 52 
   DO_TILE_DATA[ADDR] MICS_FROM_LEFT_SUPER_BOWL_SPR_TILE_DATA 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
   .DB $FB , $00 , $08 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

MICS_FROM_RIGHT_SUPER_BOWL_SPR_SCRIPT:                   ; 0XBA MICS FROM RIGHT (CREDITS)
   .DB $F6 , $60 , $61 , $6A , $6B                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $46                                           ; SET SPRITE PALLETE INDEX  TO: 70
   .DB $F8 , $3A , $3E                                       ; SET SPRITE STARTING LOCATION= Y: 116 ,  X: 124 
    DO_TILE_DATA[ADDR] MICS_FROM_RIGHT_SUPER_BOWL_SPR_TILE_DATA                                          
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
   .DB $FB , $F8 , $FC , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_QB_INTERVIEW_CREDITS_SPR_SCRIPTS   

_F{_LT_AFTER_SACK_INTRO_SPR_SCRIPT

LT_AFTER_SACK_INTRO_SPR_SCRIPT:                          ; 0XBB LAWRENCE TAYLOR SPRITE AFTER SACK (INTRO)
   .DB $F6 , $47 , $41 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $22                                           ; SET SPRITE PALLETE INDEX  TO: 34
   .DB $F8 , $2C , $46                                       ; SET SPRITE STARTING LOCATION= Y: 88 ,  X: 140 
   DO_TILE_DATA[ADDR] LT_AFTER_SACK_INTRO_SPR_TILE_DATA                                      
   .DB $FB , $00 , $F0 , $00 , $FC                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   .DB $1E                                               ; SCROLL OR WAIT FOR: 60 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_LT_AFTER_SACK_INTRO_SPR_SCRIPT   

_F{_SCOREBOARD_WAVING_FLAGS_SPR_SCRIPT

SCOREBOARD_WAVING_FLAGS_SPR_SCRIPT:                      ; 0XBC 4 WAVING FLAGS ()
   .DB $F6 , $43 , $18 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $47                                           ; SET SPRITE PALLETE INDEX  TO: 71
   .DB $F8 , $14 , $3C                                       ; SET SPRITE STARTING LOCATION= Y: 40 ,  X: 120 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   
 LOOP_START[]  
 
   DO_TILE_DATA[ADDR] WAVING_FLAGS_ONE_SPR_TILE_DATA 
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
   DO_TILE_DATA[ADDR] WAVING_FLAGS_TWO_SPR_TILE_DATA 
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
  DO_TILE_DATA[ADDR] WAVING_FLAGS_THREE_SPR_TILE_DATA 
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
   
 LOOP_END[]
 
 _F}_SCOREBOARD_WAVING_FLAGS_SPR_SCRIPT

_F{_QB_PUMP_FIST_PASS_TD_SPR_SCRIPT

QB_PUMP_FIST_PASS_TD_SPR_SCRIPT:                         ; 0XBD QB HANDS IN AIR PUMPS FIST (PASS TD CUTSCENE)
   .DB $F6 , $31 , $00 , $5E , $5F                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $00                                           ; SET SPRITE PALLETE INDEX  TO: 0
   .DB $F1 , $01 , $80                                       ; SET SPRITE TOPOFFSCREEN THRESHOLDTO: 128
   .DB $F8 , $34 , $3E                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 124 
   .DB $FB , $E0 , $F8 , $E0 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 14 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 224  ,  XSPEED INC/FRM:: 15
   DO_TILE_DATA[ADDR] QB_HANDS_IN_AIR_PASS_TD_SPR_TILE_DATA                                         
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
   .DB $FB , $F0 , $FA , $F0 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 240  ,  XSPEED INC/FRM:: 15
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
   .DB $FB , $00 , $E0 , $00 , $E0                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 14
   DO_TILE_DATA[ADDR] QB_ARM_COCKED_PASS_TD_SPR_TILE_DATA                                          
   .DB $0D                                               ; SCROLL OR WAIT FOR: 26 FRAMES
   DO_TILE_DATA[ADDR]  QB_PUMP_ARM_ONE_PASS_TD_SPR_TILE_DATA                                         
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   DO_TILE_DATA[ADDR]  QB_PUMP_ARM_TWO_PASS_TD_SPR_TILE_DATA                                       
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
  DO_TILE_DATA[ADDR]  QB_PUMP_ARM_THREE_PASS_TD_SPR_TILE_DATA                                            
   .DB $03                                               ; SCROLL OR WAIT FOR: 6 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
 
_F}_QB_PUMP_FIST_PASS_TD_SPR_SCRIPT 

_F{_SCROLLING_STARS_CREDITS_SPR_SCRIPTS

SCROLLING_STARS_ONE_SPR_SCRIPT:                          ; 0XBE SCROLLING STARS 1 (CREDITS)
   .DB $F6 , $00 , $00 , $33 , $4F                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $3F                                           ; SET SPRITE PALLETE INDEX  TO: 63
   .DB $F8 , $34 , $3E                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 124 
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   DO_TILE_DATA[ADDR] SCROLLING_STARS_ONE_CREDITS_SPR_TILE_DATA                                        
   .DB $FB , $00 , $07 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 

SCROLLING_STARS_TWO_SPR_SCRIPT:                          ; 0XBF SCROLLING STARS 2 (CREDITS)
   .DB $F6 , $00 , $00 , $33 , $4F                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $3F                                           ; SET SPRITE PALLETE INDEX  TO: 63
   .DB $F8 , $25 , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 74 ,  X: 60 
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   DO_TILE_DATA[ADDR] SCROLLING_STARS_TWO_CREDITS_SPR_TILE_DATA 
   .DB $FB , $00 , $05 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 

SCROLLING_STARS_THREE_SPR_SCRIPT:                        ; 0XC0 SCROLLING STARS 3 (CREDITS)
   .DB $F6 , $00 , $00 , $33 , $4F                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $3F                                           ; SET SPRITE PALLETE INDEX  TO: 63
   .DB $F8 , $46 , $FE                                       ; SET SPRITE STARTING LOCATION= Y: 140 ,  X: 116 OFFSCREEN
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   DO_TILE_DATA[ADDR] SCROLLING_STARS_THREE_CREDITS_SPR_TILE_DATA
   .DB $FB , $00 , $03 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 

_F}_SCROLLING_STARS_CREDITS_SPR_SCRIPTS   

_F{_LT_WAVE_CREDITS_SPR_SCRIPT

LT_WAVE_CREDITS_SPR_SCRIPT:                              ; 0XC1 LT WAVE (CREDITS)
   .DB $F6 , $58 , $35 , $5A , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $48                                           ; SET SPRITE PALLETE INDEX  TO: 72
   .DB $F8 , $1E , $46                                       ; SET SPRITE STARTING LOCATION= Y: 60 ,  X: 140 
   DO_TILE_DATA[ADDR] LT_WAVE_SPR_TILE_DATA                
   .DB $FB , $00 , $F8 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   .DB $20                                               ; SCROLL OR WAIT FOR: 64 FRAMES
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_LT_WAVE_CREDITS_SPR_SCRIPT   

_F{_TECMO_BUNNY_SPR_SCRIPT

TECMO_BUNNY_SPR_SCRIPT:                                  ; 0XC2 TECMO BUNNY (INTRO)
   .DB $F6 , $34 , $35 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $4A                                           ; SET SPRITE PALLETE INDEX  TO: 74
   .DB $F8 , $34 , $28                                       ; SET SPRITE STARTING LOCATION= Y: 104 ,  X: 80 
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   DO_TILE_DATA[ADDR] TECMO_BUNNY_SPR_TILE_DATA               
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_TECMO_BUNNY_SPR_SCRIPT   

_F{_STADIUM_STUFF_CONF_CHAMP_SPR_SCRIPT

STADIUM_STUFF_CONF_CHAMP_SPR_SCRIPT:                     ; 0XC3 STADIUM SPRITES (CONFERENCE CHAMP)
   .DB $F6 , $50 , $00 , $00 , $4F                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $31                                           ; SET SPRITE PALLETE INDEX  TO: 49
   .DB $F8 , $20 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 64 ,  X: 128 
   DO_TILE_DATA[ADDR] STADIUM_CONF_CHAMP_SPR_TILE_DATA 
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT
   
_F}_STADIUM_STUFF_CONF_CHAMP_SPR_SCRIPT   

_F{_BOMJACK_SPRITE_SCRIPTS

BOMJACK_RUN_FROM_RIGHT_DANCE_SPR_SCRIPT:                 ; 0XC4 BOMJACK RUN IN FROM RIGHT 
   DO_SUBROUTINE[ADDR] BOMJACK_RIGHT_SIDE_STARTING_SPR_SCRIPT_SUB 
   DO_SUBROUTINE[ADDR] BOMJACK_RUNNING_SPR_SCRIPT_SUB                                     
   DO_SUBROUTINE[ADDR] STOP_BOMJACK_WAIT_FOUR_SEC_SPR_SCRIPT_SUB  
   DO_SUBROUTINE[ADDR] BOMJACK_DANCE_SPR_SCRIPT_SUB
   .DB $FB , $F0 , $00 , $00 , $04                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BOMJACK_LOOKING_UP_SPR_TILE_DATA                                         
   .DB $3C                                               ; SCROLL OR WAIT FOR: 120 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_FLY_ACROSS_SKY_SPR_TILE_DATA                                          
   .DB $F8 , $0E , $86                                       ; SET SPRITE STARTING LOCATION= Y: 28 ,  X: 228 OFFSCREEN
   .DB $FB , $00 , $FF , $00 , $05                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   .DB $5A                                               ; SCROLL OR WAIT FOR: 180 FRAMES
   .DB $FB , $00 , $01 , $00 , $05                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_SUBROUTINE[ADDR] FLIP_IMAGE_HORIZONTAL_WAIT_3_SECONDS_SPR_SCRIPT_SUB 
   .DB $F8 , $32 , $78                                       ; SET SPRITE STARTING LOCATION= Y: 100 ,  X: 240 
   .DB $FB , $00 , $F0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   DO_SUBROUTINE[ADDR] BOMJACK_RUNNING_SPR_SCRIPT_SUB 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR]  BOMJACK_STANDING_STILL_SPR_TILE_DATA              
   .DB $1E                                               ; SCROLL OR WAIT FOR: 60 FRAMES
   .DB $FB , $00 , $F0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   JUMP_SPRITE_SCRIPT[ADDR] BOMJACK_RUNNING_FINAL_SPR_SCRIPT                                    

BOMJACK_RUNNING_SPR_SCRIPT_SUB:                                                    ; BOMBJACK RUNNING 
   .DB $EA                                               ; SET NUMBER OF TIMES TO LOOP = 10
   DO_TILE_DATA[ADDR] BOMJACK_RUN_ONE_SPR_TILE_DATA 
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_RUN_TWO_SPR_TILE_DATA               
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   .DB $F7                                               ; TIMES TO LOOP--
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN
   
STOP_BOMJACK_WAIT_FOUR_SEC_SPR_SCRIPT_SUB:                ; BOMBJACK STOPPED WAIT 4 SECONDS
   .DB $FB , $00 , $00 , $00 , $00                       ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR]  BOMJACK_STANDING_STILL_SPR_TILE_DATA 
   .DB $7D                                               ; SCROLL OR WAIT FOR: 250 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

BOMJACK_DANCE_SPR_SCRIPT_SUB:                                                    ; BOMBJACK DANCE
   .DB $EF                                               ; SET NUMBER OF TIMES TO LOOP = 15
   DO_TILE_DATA[ADDR] BOMJACK_DANCE_SPR_TILE_DATA                                         
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_WAVE_ONE_SPR_TILE_DATA               
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   .DB $F7                                               ; TIMES TO LOOP--
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

UNUSED_SPR_SCRIPT_SUB:                                    ; UNUSED *** CAN DELETE
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

FLIP_IMAGE_HORIZONTAL_WAIT_3_SECONDS_SPR_SCRIPT_SUB:     ; SWITCH SIDE AND WAIT 3 SECONDS
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   .DB $5A                                               ; SCROLL OR WAIT FOR: 180 FRAMES
   .DB $FA                                               ; SAVE CUTSCENE SIDE IN SPR RAM
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

BOMJACK_RUNNING_FINAL_SPR_SCRIPT:                                                    ; BOMJACK RUNNING FINAL 
   .DB $E4                                               ; SET NUMBER OF TIMES TO LOOP = 4
   DO_TILE_DATA[ADDR] BOMJACK_RUN_ONE_SPR_TILE_DATA
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_RUN_TWO_SPR_TILE_DATA
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   .DB $F7                                               ; TIMES TO LOOP--
   .DB $FF                                               ; END

BOMJACK_RIGHT_SIDE_STARTING_SPR_SCRIPT_SUB:             ; BOMBJACK RIGHT SIDE STARTING LOC
   .DB $F6 , $53 , $75 , $5A , $5B                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $4A                                           ; SET SPRITE PALLETE INDEX  TO: 74
   .DB $F8 , $32 , $78                                       ; SET SPRITE STARTING LOCATION= Y: 100 ,  X: 240 
   .DB $F5                                               ; SET SPRITE SIZE = 8X16 
   .DB $FB , $00 , $F0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

BOMJACK_RUN_FROM_LEFT_DANCE_SPR_SCRIPT:                  ; 0XC5 BOMJACK RUN IN FROM LEFT  
   DO_SUBROUTINE[ADDR] BOMJACK_LEFT_SIDE_STARTING_SPR_SCRIPT_SUB  
   DO_SUBROUTINE[ADDR] BOMJACK_RUNNING_SPR_SCRIPT_SUB 
   DO_SUBROUTINE[ADDR] STOP_BOMJACK_WAIT_FOUR_SEC_SPR_SCRIPT_SUB                                         
   DO_SUBROUTINE[ADDR] BOMJACK_DANCE_SPR_SCRIPT_SUB                                         
   .DB $FB , $F0 , $00 , $00 , $FC                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BOMJACK_LOOKING_UP_SPR_TILE_DATA 
   .DB $3C                                               ; SCROLL OR WAIT FOR: 120 FRAMES
   .DB $FA                                               ; SAVE CUTSCENE SIDE IN SPR RAM
   DO_TILE_DATA[ADDR] BOMJACK_FLY_ACROSS_SKY_SPR_TILE_DATA 
   .DB $F8 , $0E , $86                                       ; SET SPRITE STARTING LOCATION= Y: 28 ,  X: 228 OFFSCREEN
   .DB $FB , $00 , $FF , $00 , $06                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   .DB $5A                                               ; SCROLL OR WAIT FOR: 180 FRAMES
   .DB $FB , $00 , $01 , $00 , $06                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_SUBROUTINE[ADDR] FLIP_IMAGE_HORIZONTAL_WAIT_3_SECONDS_SPR_SCRIPT_SUB                                           
   .DB $F8 , $32 , $04                                       ; SET SPRITE STARTING LOCATION= Y: 100 ,  X: 8 
   .DB $FB , $00 , $10 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_SUBROUTINE[ADDR] BOMJACK_RUNNING_SPR_SCRIPT_SUB 
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR]  BOMJACK_STANDING_STILL_SPR_TILE_DATA 
   .DB $3C                                               ; SCROLL OR WAIT FOR: 120 FRAMES
   .DB $FB , $00 , $10 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   JUMP_SPRITE_SCRIPT[ADDR] BOMJACK_RUNNING_FINAL_SPR_SCRIPT                                       

BOMJACK_LEFT_SIDE_STARTING_SPR_SCRIPT_SUB:                                                    ; BOMBJACK LEFT SIDE STARTING LOC
   .DB $F6 , $53 , $75 , $5A , $5B                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $4A                                           ; SET SPRITE PALLETE INDEX  TO: 74
   .DB $F8 , $32 , $04                                       ; SET SPRITE STARTING LOCATION= Y: 100 ,  X: 8 
   .DB $F5                                               ; SET SPRITE SIZE = 8X16 
   .DB $FB , $00 , $10 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

BOMJACK_DROP_IN_FROM_SKY_SPR_SCRIPT:                     ; 0XC6 BOMJACK DROP IN FROM SKY  
   DO_SUBROUTINE[ADDR] BOMJACK_DROP_IN_FROM_SKY_SPR_SCRIPT_SUB                                        
   DO_SUBROUTINE[ADDR] STOP_BOMJACK_WAIT_FOUR_SEC_SPR_SCRIPT_SUB                                           

                                                         ; DANCE LOOP
   .DB $EF                                               ; SET TIMES TO LOOP = 15
   DO_TILE_DATA[ADDR] BOMJACK_LOOKING_UP_SPR_TILE_DATA 
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   DO_TILE_DATA[ADDR]  BOMJACK_STANDING_STILL_SPR_TILE_DATA 
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   .DB $F7                                               ; TIMES TO LOOP-

   .DB $FB , $F0 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BOMJACK_LOOKING_UP_SPR_TILE_DATA 
   .DB $3C                                               ; SCROLL OR WAIT FOR: 120 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_FLY_ACROSS_SKY_SPR_TILE_DATA 
   DO_SUBROUTINE[ADDR] SET_BOMJACK_FAST_FLYING_LOC_AND_SPEED_SPR_SCRIPT_SUB                                           
   DO_SUBROUTINE[ADDR] FLIP_IMAGE_HORIZONTAL_WAIT_3_SECONDS_SPR_SCRIPT_SUB                                           
   .DB $F8 , $00 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 0 ,  X: 128 
   .DB $FB , $14 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 1 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BOMJACK_DROP_FROM_SKY_SPR_TILE_DATA                                         
   .DB $28                                               ; SCROLL OR WAIT FOR: 80 FRAMES
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR]  BOMJACK_STANDING_STILL_SPR_TILE_DATA 
                                                         ; GROW TO GIANT BOMBJACK
   .DB $78                                               ; SCROLL OR WAIT FOR: 240 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_LOOKING_UP_SPR_TILE_DATA 
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_LARGE_LOOKING_UP_SPR_TILE_DATA                                          
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES

                                                         ; BIG BOMJACK DANCE
   .DB $E4                                               ; SET TIMES TO LOOP = 4 
  DO_TILE_DATA[ADDR] BOMJACK_LARGEST_LOOKING_UP_SPR_TILE_DATA                                       
   .DB $13                                               ; SCROLL OR WAIT FOR: 38 FRAMES
  DO_TILE_DATA[ADDR] BOMJACK_LARGEST_LOOKING_FORWARD_SPR_TILE_DATA                                          
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
   .DB $F7                                               ; TIMES TO LOOP-

   .DB $FB , $90 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 9 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BOMJACK_LARGEST_LOOKING_UP_SPR_TILE_DATA 
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_FLY_ACROSS_SKY_SPR_TILE_DATA 
   DO_SUBROUTINE[ADDR] SET_BOMJACK_FLYING_LOC_AND_SPEED_SPR_SCRIPT_SUB                                         
   .DB $F8 , $0E , $F6                                       ; SET SPRITE STARTING LOCATION= Y: 28 ,  X: 228 OFFSCREEN
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   DO_TILE_DATA[ADDR] BOMJACK_FLYING_SMALLER_SPR_TILE_DATA                                           
   .DB $FB , $00 , $70 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 7 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 7
   .DB $14                                               ; SCROLL OR WAIT FOR: 40 FRAMES
   .DB $FA                                               ; SAVE CUTSCENE SIDE IN SPR RAM
   DO_TILE_DATA[ADDR] BOMJACK_FLYING_SMALLEST_SPR_TILE_DATA                                         
   DO_SUBROUTINE[ADDR] SET_BOMJACK_FLYING_LOC_AND_SPEED_SPR_SCRIPT_SUB  
   .DB $FF                                               ; END

BOMJACK_DROP_IN_FROM_SKY_SPR_SCRIPT_SUB:                 ; BOMJACK DROP IN FROM SKY
   .DB $F6 , $53 , $75 , $5A , $5B                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $4A                                           ; SET SPRITE PALLETE INDEX  TO: 74
   .DB $F8 , $00 , $40                                       ; SET SPRITE STARTING LOCATION= Y: 0 ,  X: 128 
   .DB $F5                                               ; SET SPRITE SIZE = 8X16 
   .DB $FB , $14 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 1 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BOMJACK_DROP_FROM_SKY_SPR_TILE_DATA                                       
   .DB $28                                               ; SCROLL OR WAIT FOR: 80 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

SET_BOMJACK_FAST_FLYING_LOC_AND_SPEED_SPR_SCRIPT_SUB:    ; BOMBJACK FLY SUBROUTINE COULD HAVE BEEN PLACED INLINE
   .DB $F8 , $0E , $86                                   ; SET SPRITE STARTING LOCATION= Y: 28 ,  X: 228 OFFSCREEN
   .DB $FB , $00 , $FF , $00 , $07                       ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15
   .DB $5A                                               ; SCROLL OR WAIT FOR: 180 FRAMES
   .DB $FB , $00 , $01 , $00 , $07                       ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

SET_BOMJACK_FLYING_LOC_AND_SPEED_SPR_SCRIPT_SUB:          ; BOMJACK FLYING STARTING LOC AND SPEED 
   .DB $F8 , $0E , $86                                   ; SET SPRITE STARTING LOCATION= Y: 28 ,  X: 228 OFFSCREEN
   .DB $FB , $00 , $90 , $00 , $00                       ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 9 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 9
   .DB $14                                               ; SCROLL OR WAIT FOR: 40 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

BOMJACK_FROM_TOP_WAVE_SPR_SCRIPT:                        ; 0XC7 BOMJACK COME FROM TOP OF SCREEN WAVE  
   DO_SUBROUTINE[ADDR] BOMJACK_DROP_IN_FROM_SKY_SPR_SCRIPT_SUB 
   DO_SUBROUTINE[ADDR] STOP_BOMJACK_WAIT_ONE_SEC_SPR_SCRIPT_SUB   

LOOP_START[]                                              ; BOMJACK LOOK UP ENDLESS LOOP

   DO_TILE_DATA[ADDR] BOMJACK_LOOKING_UP_SPR_TILE_DATA 
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   DO_TILE_DATA[ADDR] BOMJACK_STANDING_STILL_SPR_TILE_DATA 
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   
 LOOP_END[] 

STOP_BOMJACK_WAIT_ONE_SEC_SPR_SCRIPT_SUB:                                                    ; STOP BOMJACK
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] BOMJACK_STANDING_STILL_SPR_TILE_DATA
   .DB $1E                                               ; SCROLL OR WAIT FOR: 60 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                                               ; RETURN

BOMJACK_FROM_RIGHT_WAVE_SPR_SCRIPT:                      ; 0XC8 BOMJACK WALK FROM RIGHT SIDE OF SCREEN WAVE  
   DO_SUBROUTINE[ADDR] BOMJACK_RIGHT_SIDE_STARTING_SPR_SCRIPT_SUB                                         
   DO_SUBROUTINE[ADDR] BOMJACK_RUNNING_SPR_SCRIPT_SUB 
   DO_SUBROUTINE[ADDR] STOP_BOMJACK_WAIT_ONE_SEC_SPR_SCRIPT_SUB                                     

BOMJACK_LEFT_RIGHT_ENDLESS_LOOP_SPR_SCRIPT:

LOOP_START[]
                                                    ; BOMJACK L/R WAVE ENDLESS LOOP
   DO_TILE_DATA[ADDR] BOMJACK_WAVE_ONE_SPR_TILE_DATA
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
    DO_TILE_DATA[ADDR] BOMJACK_WAVE_TWO_SPR_TILE_DATA               
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   
 LOOP_END[]                                              

BOMJACK_FROM_LEFT_WAVE_SPR_SCRIPT:                       ; 0XC9 BOMJACK WALK FROM LEFT SIDE OF SCREEN WAVE  
   DO_SUBROUTINE[ADDR] BOMJACK_LEFT_SIDE_STARTING_SPR_SCRIPT_SUB                                        
   DO_SUBROUTINE[ADDR] BOMJACK_RUNNING_SPR_SCRIPT_SUB 
   DO_SUBROUTINE[ADDR] STOP_BOMJACK_WAIT_ONE_SEC_SPR_SCRIPT_SUB   
  JUMP_SPRITE_SCRIPT[ADDR] BOMJACK_LEFT_RIGHT_ENDLESS_LOOP_SPR_SCRIPT 

_F}_BOMJACK_SPRITE_SCRIPTS  

_F{_PLAYER_RUN_RETURN_INJURY_SPR_SCRIPT

PLAYER_RUN_RETURN_INJURY_SPR_SCRIPT:                     ; 0XCA PLAYER RETURN FROM INJURY RUNNING 
   .DB $F6 , $00 , $55 , $00 , $33                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $4B                                           ; SET SPRITE PALLETE INDEX  TO: 75
   .DB $F8 , $5C , $5A                                       ; SET SPRITE STARTING LOCATION= Y: 184 ,  X: 180 
   .DB $F9                                               ; *** COULD HAVE USED P2 SCRIPT TURN MIRRORING ON TO FLIP IMAGE
    DO_TILE_DATA[ADDR] P1_RUNNING_COIN_TOSS_SPR_TILE_DATA    
   .DB $FB , $00 , $F0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM: 0
                        
                                                         ; PLAYER RUNNING LOOP
   .DB $EA                                               ; SET TIMES TO LOOP = 10
   DO_SUBROUTINE[ADDR] SMALL_PLAYER_RUNNING_SPR_SCRIPT_SUB
   .DB $F7                                               ; TIMES TO LOOP-
   .DB $FF                                               ; END
   
_F}_PLAYER_RUN_RETURN_INJURY_SPR_SCRIPT   

_F{_PLAYER_RUNNING_COIN_TOSS_SPR_SCRIPT

SMALL_PLAYER_RUNNING_SPR_SCRIPT_SUB:                                                    ; PLAYER RUNNING ANI
   .DB $F6 , $00 , $55 , $00 , $33                       ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   .DB $F6 , $01 , $55 , $00 , $33                       ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   .DB $F6 , $02 , $55 , $00 , $33                       ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   .DB $F6 , $03 , $55 , $00 , $33                       ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   .DB $F6 , $04 , $55 , $00 , $33                       ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
                                                         ; COULD BE 00
   .DB $F6 , $05 , $55 , $01 , $33                       ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $02                                               ; SCROLL OR WAIT FOR: 4 FRAMES
   RETURN_FROM_SCRIPT_SUBROUTINE[]                      ; RETURN
   
_F}_PLAYER_RUNNING_COIN_TOSS_SPR_SCRIPT   

_F{_P2_PLAYER_RUNNING_COIN_TOSS_SPR_SCRIPT


COIN_TOSS_P2_RUNNING_SPR_SCRIPT:                         ; 0XCB COIN TOSS P2 PLAYER RUNNING+ BOTH PLAYERS  STANDING STILL
   .DB $F6 , $00 , $55 , $00 , $33                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $42                                           ; SET SPRITE PALLETE INDEX  TO: 66
   .DB $F8 , $2F , $84                                       ; SET SPRITE STARTING LOCATION= Y: 94 ,  X: 162 OFFSCREEN
   DO_TILE_DATA[ADDR] P2_RUNNING_COIN_TOSS_SPR_TILE_DATA                                           
   .DB $FB , $00 , $F0 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 15 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 15

   .DB $E5                                               ; SET TIMES TO LOOP = 5
   DO_SUBROUTINE[ADDR] SMALL_PLAYER_RUNNING_SPR_SCRIPT_SUB                                       
   .DB $F7                                               ; TIMES TO LOOP--
   
   .DB $FB , $00 , $00 , $00 , $00                           ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] PLAYER_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA                                         
   .DB $32                                               ; SCROLL OR WAIT FOR: 100 FRAMES
   DO_TILE_DATA[ADDR] PLAYER_LOOKING_UP_COIN_TOSS_SPR_TILE_DATA                                           
   .DB $14                                               ; SCROLL OR WAIT FOR: 40 FRAMES
   DO_TILE_DATA[ADDR] PLAYER_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   DO_TILE_DATA[ADDR] PLAYER_LOOKING_DOWN_COIN_TOSS_SPR_TILE_DATA                                         
   .DB $3C                                               ; SCROLL OR WAIT FOR: 120 FRAMES
   DO_TILE_DATA[ADDR] PLAYER_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 
   
_F}_P2_PLAYER_RUNNING_COIN_TOSS_SPR_SCRIPT   

UNUSED_COIN_TOSS_SPR_SCRIPT:                               ; 0XCC *** UNUSED/BROKEN
   .DB $F8 , $2F , $48                                     ; SET SPRITE STARTING LOCATION= Y: 94 ,  X: 144 
   DO_TILE_DATA[ADDR] PLAYER_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

_F{_NURSES_WAVING_SPR_SCRIPT

NURSES_WAVING_SPR_SCRIPT:                                ; 0XCD NURSES WAVING INJURY ROUTINE
   .DB $F6 , $00 , $55 , $00 , $33                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $4B                                           ; SET SPRITE PALLETE INDEX  TO: 75
   .DB $F8 , $43 , $3C                                       ; SET SPRITE STARTING LOCATION= Y: 134 ,  X: 120 
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   
LOOP_START[] 
 
   DO_TILE_DATA[ADDR] NURSE_WAVE_ONE_SPR_TILE_DATA               
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   DO_TILE_DATA[ADDR] NURSE_WAVE_TWO_SPR_TILE_DATA 
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   
 LOOP_END[] 
 
_F}_NURSES_WAVING_SPR_SCRIPT 
   
_F{_REF_POINT_COIN_TOSS_WINNER_SPR_SCRIPT
   
REF_POINTS_P1_COIN_TOSS_SPR_SCRIPT:                      ; 0XCE REF POINTS P1 SIDE
   DO_SUBROUTINE[ADDR] INIT_REF_COIN_TOSS_SPR_SCRIPT_SUB
   DO_TILE_DATA[ADDR] REF_POINTS_P1_COIN_TOSS_SPR_TILE_DATA                                         
  JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 

REF_POINTS_P2_COIN_TOSS_SPR_SCRIPT:                      ; 0XCF REF POINTS P2 SIDE
   DO_SUBROUTINE[ADDR] INIT_REF_COIN_TOSS_SPR_SCRIPT_SUB
   DO_TILE_DATA[ADDR] REF_POINTS_P2_COIN_TOSS_SPR_TILE_DATA 
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP 
   
_F}_REF_POINT_COIN_TOSS_WINNER_SPR_SCRIPT   

LOOP_START[]:                                                    ; *** UNUSED LOOP
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   .DB $F8 , $30 , $A8                                       ; SET SPRITE STARTING LOCATION= Y: 96 ,  X: 160 OFFSCREEN
   .DB $04                                               ; SCROLL OR WAIT FOR: 8 FRAMES
   .DB $F8 , $30 , $28
LOOP_END[]

_F{_QB_SACKED_BY_LT_SPR_SCRIPT

QB_SACKED_BY_LT_SPR_SCRIPT:                              ; 0XD0 QB GETTING SACKED BY LT (INTRO)
   .DB $F6 , $46 , $00 , $00 , $00                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $20                                           ; SET SPRITE PALLETE INDEX  TO: 32
   .DB $F8 , $30 , $3A                                       ; SET SPRITE STARTING LOCATION= Y: 96 ,  X: 116 
   .DB $F3                                               ; SET SPRITE PRIORITY =  BEHIND BACKGROUND
   DO_TILE_DATA[ADDR] QB_SACKED_BY_LT_SPR_TILE_DATA               
   .DB $FB , $00 , $10 , $00 , $FB                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $05                                               ; SCROLL OR WAIT FOR: 10 FRAMES
   .DB $FB , $00 , $70 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 7 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 7
   .DB $0A                                               ; SCROLL OR WAIT FOR: 20 FRAMES
   .DB $FF                                               ; END
   
_F}_QB_SACKED_BY_LT_SPR_SCRIPT   

_F{_FG_BALL_WIDE_SPR_SCRIPTS

P1_BALL_WIDE_LEFT_SPR_SCRIPT:                            ; 0XD1 P1 FG WIDE LEFT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $1B , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 54 ,  X: 60 
   .DB $FB , $FC , $1E , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   
FG_WIDE_BALL_SPIN_SPR_SCRIPT:                                                    ; FG WIDE BALL SPIN LOOP
   .DB $EB                                               ; SET TIMES TO LOOP = 11
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_ONE_SPR_TILE_DATA 
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_TWO_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   DO_TILE_DATA[ADDR] OVERHEAD_FG_BALL_SPIN_THREE_SPR_TILE_DATA
   .DB $01                                               ; SCROLL OR WAIT FOR: 2 FRAMES
   .DB $F7                                               ; TIMES TO LOOP-

   .DB $FF                                               ; END

P1_BALL_WIDE_RIGHT_SPR_SCRIPT:                           ; 0XD2 P1 FG WIDE RIGHT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $31 , $1E                                       ; SET SPRITE STARTING LOCATION= Y: 98 ,  X: 60 
   .DB $FB , $04 , $1E , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 1 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 1
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   JUMP_SPRITE_SCRIPT[ADDR] FG_WIDE_BALL_SPIN_SPR_SCRIPT                                        

P2_BALL_WIDE_RIGHT_SPR_SCRIPT:                           ; 0XD3 P2 FG WIDE RIGHT
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $1B , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 54 ,  X: 188 
   .DB $FB , $FC , $E2 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 15 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 14
   JUMP_SPRITE_SCRIPT[ADDR] FG_WIDE_BALL_SPIN_SPR_SCRIPT 
   
P2_BALL_WIDE_LEFT_SPR_SCRIPT:                            ; 0XD4 P2 FG WIDE LEFT 
   .DB $F6 , $00 , $00 , $36 , $37                               ; SET SPRITE CHR BANKS (CHR 1000 ,  CHR 1400 ,  CHR 1800 ,  CHR ,  1C00
   .DB $FC , $35                                           ; SET SPRITE PALLETE INDEX  TO: 53
   .DB $F8 , $31 , $5E                                       ; SET SPRITE STARTING LOCATION= Y: 98 ,  X: 188 
   .DB $FB , $04 , $E2 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 14 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 14
   JUMP_SPRITE_SCRIPT[ADDR] FG_WIDE_BALL_SPIN_SPR_SCRIPT 
   
_F}_FG_BALL_WIDE_SPR_SCRIPTS   

_F{_P2_REF_FIRST_DOWN_SPR_SCRIPT

P2_REF_FIRST_DOWN_SPR_SCRIPT:                            ; 0XD5 P2 FIRST DOWN REF ARM POINTING FORWARD
   DO_SUBROUTINE[ADDR] INIT_LARGE_REF_PAL_AND_LOC_SPR_SCRIPT_SUB 
   .DB $F9                                               ; TURN MIRRORING ON TO FLIP IMAGE
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0
   DO_TILE_DATA[ADDR] REF_ARM_BENT_FIRST_DOWN_SPR_TILE_DATA
   .DB $0F                                               ; SCROLL OR WAIT FOR: 30 FRAMES
   DO_TILE_DATA[ADDR] REF_ARM_FORWARD_FOR_FIRST_DOWN_SPR_TILE_DATA 
   JUMP_SPRITE_SCRIPT[ADDR] SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT

SET_SCROLL_TO_ZERO_AND_LOOP_SPR_BANK_2_SCRIPT:                                                    ; SET SCROLL SPEED TO 0 AND LOOP FOREVER
   .DB $FB , $00 , $00 , $00 , $00                               ; SET SCROLL SPEED Y PIXELS/FRM: 0 , X PIXELS/FRM: 0 ,  Y SPEED INC/FRM: 0  ,  XSPEED INC/FRM:: 0

_F}_P2_REF_FIRST_DOWN_SPR_SCRIPT

BANK_10_ENDLESS_LOOP: 

LOOP_START[]
	.DB $78 												; SCROLL OR WAIT FOR: 240 FRAMES
LOOP_END[]
      
FLIP_SCROLL_DIRECTION_AND_DO_ENDLESS_LOOP_SCRIPT:        ; DO ENDLESS LOOP
   .DB $FD                                               ; START SCROLLING AND FLIP SCROLL DIRECTION
   JUMP_SPRITE_SCRIPT[ADDR] BANK_10_ENDLESS_LOOP                                         ;
   
   
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

_F{_COIN_TOSS_SPR_TILE_DATA

COIN_FACING_DOWN_SPR_TILE_DATA:                          ; COIN FACING DOWN TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $EC                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:EC
   .DB $FF                                               ; END
   
COIN_SPIN_ONE_SPR_TILE_DATA:                             ; COIN SPIN 1 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $EE                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:EE
   .DB $FF                                               ; END
   
COIN_SPIN_TWO_SPR_TILE_DATA:                             ; COIN SPIN 2 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $E7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E7
   .DB $FF                                               ; END
   
COIN_FACING_UP_SPR_TILE_DATA:                            ; COIN FACING UP TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $ED                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $FF                                               ; END
   
_F}_COIN_TOSS_SPR_TILE_DATA 

_F{_BLIMP_MOTOR_SPR_TILE_DATA

BLIMP_MOTOR_ONE_SPR_TILE_DATA:                           ; BLIMP MOTOR 1 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $01 , $F2                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:F2
   .DB $FF                                               ; END
BLIMP_MOTOR_TWO_SPR_TILE_DATA:                           ; BLIMP MOTOR 2 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $01 , $F3                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:F3
   .DB $FF                                               ; END
   
_F}_BLIMP_MOTOR_SPR_TILE_DATA   

_F{_BALLOONS_SPR_TILE_DATA


BALLOON_ONE_SPR_TILE_DATA:                               ; BALLOON 1 TILES 
   .DB $9A                                               ; SET SPRITE X OFFSET = -6 TILES
   .DB $3A , $F4                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:F4
   .DB $3E , $F6                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:F6
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $3A , $F5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:F5
   .DB $3E , $F7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:F7
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $0A , $F4                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:F4
   .DB $0E , $F6                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:F6
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $0A , $F5                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:F5
   .DB $0E , $F7                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:F7
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $02 , $F8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:F8
   .DB $06 , $FA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:FA
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3E , $F9                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:F9
   .DB $02 , $FA                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:FA
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $0A , $F4                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:F4
   .DB $0E , $F6                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:F6
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $0A , $F5                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:F5
   .DB $0E , $F7                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:F7
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $37 , $F8                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:F8
   .DB $3B , $FA                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:FA
   .DB $FF                                               ; END

BALLOON_TWO_SPR_TILE_DATA:                               ; BALLOON 2 TILES
   .DB $9A                                               ; SET SPRITE X OFFSET = -6 TILES
   .DB $3E , $F9                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:F9
   .DB $02 , $FA                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:FA
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $07 , $F8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:F8
   .DB $0B , $FA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:FA
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $0B , $F9                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:F9
   .DB $0F , $FA                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:FA
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $36 , $F8                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:F8
   .DB $3A , $FA                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:FA
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $0A , $F4                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:F4
   .DB $0E , $F6                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:F6
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $0A , $F5                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:F5
   .DB $0E , $F7                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:F7
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $0B , $F9                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:F9
   .DB $0F , $FA                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:FA
   .DB $FF                                               ; END

_F}_BALLOONS_SPR_TILE_DATA   

_F{_NFL_SHIELD_SPR_TILE_DATA   

NFL_SHIELD_SPR_TILE_DATA:                                ; NFL SHIELD TILES
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $36 , $9A                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:9A
   .DB $3A , $9C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:9C
   .DB $3E , $9D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:9D
   .DB $02 , $8E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:8E
   .DB $06 , $8E                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:8E
   .DB $0A , $8E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:8E
   .DB $0E , $8F                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:8F
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $36 , $9B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:9B
   .DB $3A , $C9                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:C9
   .DB $3E , $CB                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:CB
   .DB $03 , $E0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E0
   .DB $07 , $E2                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E2
   .DB $0B , $D1                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:D1
   .DB $0F , $D6                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:D6
   .DB $12 , $DB                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:DB
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $32 , $98                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:98
   .DB $36 , $C6                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:C6
   .DB $3A , $CC                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:CC
   .DB $3E , $CE                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:CE
   .DB $03 , $E1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E1
   .DB $07 , $E3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E3
   .DB $0B , $E3                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:E3
   .DB $0F , $D7                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:D7
   .DB $12 , $F6                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:F6
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $32 , $99                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:99
   .DB $36 , $C7                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:C7
   .DB $3A , $CD                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:CD
   .DB $3E , $CF                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:CF
   .DB $03 , $E4                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E4
   .DB $07 , $E6                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E6
   .DB $0B , $D4                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:D4
   .DB $0F , $D9                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:D9
   .DB $12 , $F9                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:F9
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $36 , $9E                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:9E
   .DB $3A , $D8                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:D8
   .DB $3E , $CB                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:CB
   .DB $03 , $E5                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E5
   .DB $07 , $E7                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E7
   .DB $0B , $D5                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:D5
   .DB $0F , $DC                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:DC
   .DB $12 , $FC                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:FC
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $36 , $9F                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:9F
   .DB $3A , $8C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:8C
   .DB $3E , $F3                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:F3
   .DB $02 , $DA                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:DA
   .DB $06 , $DA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:DA
   .DB $0A , $DA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:DA
   .DB $0E , $DD                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:DD
   .DB $FF                                               ; END
 
_F}_NFL_SHIELD_SPR_TILE_DATA  

_F{_CHEER_WINK_EYE_SPR_TILE_DATA     

CHEER_WINK_EYE_OPEN_SPR_TILE_DATA:                       ; CHEERLEADER EYES OPEN TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $FC                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FC
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $FD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FD
   .DB $FF                                               ; END
CHEER_WINK_ONE_SPR_TILE_DATA:                            ; CHEERLEADER EYES WINK START TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $FE                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $FF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FF
   .DB $FF                                               ; END
CHEER_WINK_TWO_SPR_TILE_DATA:                            ; CHEERLEADER EYES WINK END TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $FB                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FB
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $FD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FD
   .DB $FF                                               ; END
   
_F}_CHEER_WINK_EYE_SPR_TILE_DATA      

_F{_CHEER_WINK_TORSO_SPR_TILE_DATA   

CHEER_TORSO_BRA_SPR_TILE_DATA:                           ; CHEERLEADER BOTTOM LEFT TORSO AND BRA(CHEERLEADER KISS) TILES
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3F , $D9                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:D9
   .DB $03 , $DB                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:DB
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3F , $DC                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:DC
   .DB $03 , $DE                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:DE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3F , $DD                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:DD
   .DB $03 , $DF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:DF
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $03 , $DA                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:DA
   .DB $FF                                               ; END

_F}_CHEER_WINK_TORSO_SPR_TILE_DATA      

_F{_BARRY_ACROSS_SCREEN_SPR_TILE_DATA 

BARRY_ACROSS_SCREEN_SPR_TILE_DATA:                       ; BARRY SANDERS FAST SPRITE TILES (INTRO AND CREDITS)
                                                         ; FEET
   .DB $FC , $20                                           ; SET SPR Y OFFSET= 0 PIXELS
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $0B , $09                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:09
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $0B , $0C                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:0C
   .DB $0F , $0E                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:0E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $0F , $11                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:11
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $0F , $14                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:14
   .DB $13 , $16                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3 ,  TILE ID:16
   JUMP_SPRITE_SCRIPT[ADDR] BARRY_ALL_BUT_FEET_SPR_TILE_DATA 

_F}_BARRY_ACROSS_SCREEN_SPR_TILE_DATA    

_F{_KISS_CHEER_EYES_MOUTH_SPR_TILE_DATA   

KISS_CHEER_EYES_MOUTH_SPR_TILE_DATA:                     ; CHEERLEADER EYES AND MOUTH TILES 
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3B , $C9                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:C9
   .DB $03 , $D0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D0
   .DB $07 , $D2                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D2
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3B , $CC                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:CC
   .DB $03 , $D1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D1
   .DB $07 , $D3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D3
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3B , $CD                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:CD
   .DB $03 , $CF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:CF
   .DB $FF                                               ; END

KISS_CHEER_EYES_MOUTH_BLINK_SPR_TILE_DATA:               ; CHEERLEADER EYES AND MOUTH BLINK TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3B , $CA                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:CA
   .DB $03 , $D0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D0
   .DB $07 , $D2                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D2
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3B , $CB                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:CB
   .DB $03 , $D1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D1
   .DB $07 , $D3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D3
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3B , $CE                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:CE
   .DB $03 , $CF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:CF
   .DB $FF                                               ; END

KISS_CHEER_EYES_MOUTH_KISS_SPR_TILE_DATA:                ; CHEERLEADER EYES AND MOUTH KISS TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3B , $CA                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:CA
   .DB $03 , $D4                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D4
   .DB $07 , $D6                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D6
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3B , $CB                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:CB
   .DB $03 , $D5                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D5
   .DB $07 , $D7                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D7
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3B , $CE                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:CE
   .DB $03 , $D8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D8
   .DB $FF                                               ; END
   
_F}_KISS_CHEER_EYES_MOUTH_SPR_TILE_DATA      

_F{_EXLIMATION_PT_SPR_TILE_DATA

EXLIMATION_PT_SPR_TILE_DATA:                             ; EXLIMATION POINT TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $00 , $A0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:A0
   .DB $04 , $DA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:DA
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $00 , $A1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:A1
   .DB $04 , $DB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:DB
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $01 , $85                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:85
   .DB $05 , $A6                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:A6
   .DB $FF                                               ; END
   
_F}_EXLIMATION_PT_SPR_TILE_DATA   

_F{_OVERHEAD_FG_BALL_SPIN_SPR_TILE_DATA

OVERHEAD_FG_BALL_SPIN_ONE_SPR_TILE_DATA:                 ; FG BALL SPIN 1 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $00 , $F0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $04 , $FA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:FA
   .DB $FF                                               ; END

OVERHEAD_FG_BALL_SPIN_TWO_SPR_TILE_DATA:                 ; FG BALL SPIN 2 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $00 , $F1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $04 , $FA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:FA
   .DB $FF                                               ; END

OVERHEAD_FG_BALL_SPIN_THREE_SPR_TILE_DATA:               ; FG BALL SPIN 3 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $00 , $F2                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F2
   .DB $04 , $FB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:FB
   .DB $FF                                               ; END

_F}_OVERHEAD_FG_BALL_SPIN_SPR_TILE_DATA   

_F{_BALL_HIT_GOAL_POST_SPR_TILE_DATA 
 

BALL_HIT_GOAL_POST_SPR_TILE_DATA:                        ; BALL HIT GOALPOST TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $00 , $F8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F8
   .DB $04 , $F5                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:F5
   .DB $FF                                               ; END
   
_F}_BALL_HIT_GOAL_POST_SPR_TILE_DATA    

_F{_TOP_AND_BOT_POST_SPR_TILE_DATA 

TOP_POST_SPR_TILE_DATA:                                                    ; BALL/POST FLICKER TILE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $01 , $F4                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:F4
   .DB $FF                                               ; END

BOT_POST_SPR_TILE_DATA:                                                    ; BALL/POST FLICKER TILE BOT
   .DB $FC , $00                                           ; SET FLIP VERTICAL = TRUE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $01 , $F4                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:F4
   .DB $FC , $10                                           ; SET FLIP VERTICAL = FALSE
   .DB $FF                                               ; END
   
_F}_TOP_AND_BOT_POST_SPR_TILE_DATA   

_F{_TOP_UPRIGHT_SPR_TILE_DATA 

TOP_UPRIGHT_SPR_TILE_DATA:                           ; P1 LEFT UPRIGHT TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $2C , $42                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:42
   .DB $30 , $46                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $34 , $46                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $38 , $46                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $3C , $46                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $00 , $46                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $04 , $46                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $08 , $48                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:48
   .DB $0C , $4A                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:4A
   .DB $FF                                               ; END
   
 _F}_TOP_UPRIGHT_SPR_TILE_DATA   

_F{_BALL_THRU_UPRIGHT_SPR_TILE_DATA 

BALL_THRU_UPRIGHT_NINETY_SPR_TILE_DATA:                  ; BALL THROUGH UPRIGHT 90 DEGREE TILE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $40                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:40
   .DB $FF                                               ; END

BALL_THRU_UPRIGHT_FORTY_FIVE_SPR_TILE_DATA:              ; BALL THROUGH UPRIGHT 45 DEGREE ANGLE TILE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $41                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:41
   .DB $FF                                               ; END

BALL_THRU_UPRIGHT_ZERO_SPR_TILE_DATA:                    ; BALL THROUGH UPRIGHT 0 DEGREE TILE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $44                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:44
   .DB $FF                                               ; END
   
_F}_BALL_THRU_UPRIGHT_SPR_TILE_DATA    

_F{_DEFENDER_TRYING_TACKLE_BARRY_CREDITS_SPR_TILE_DATA

DEFENDER_TRYING_TACKLE_BARRY_SPR_TILE_DATA:              ; TACKLER TILES (CREDITS)
   .DB $99                                               ; SET SPRITE X OFFSET = -7 TILES
   .DB $0B , $0B                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:0B
   .DB $0F , $2A                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:2A
   .DB $9A                                               ; SET SPRITE X OFFSET = -6 TILES
   .DB $0B , $27                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:27
   .DB $0F , $2F                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:2F
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $07 , $0A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:0A
   .DB $0B , $20                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:20
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $06 , $22                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:22
   .DB $0A , $28                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:28
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $02 , $21                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:21
   .DB $06 , $23                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:23
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3E , $0E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:0E
   .DB $02 , $24                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:24
   .DB $06 , $26                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:26
   .DB $0B , $29                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:29
   .DB $0F , $2B                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:2B
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $36 , $1E                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:1E
   .DB $3A , $34                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:34
   .DB $3E , $0F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:0F
   .DB $02 , $25                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:25
   .DB $0B , $2C                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:2C
   .DB $0F , $2E                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:2E
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $32 , $10                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:10
   .DB $36 , $12                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:12
   .DB $3A , $18                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:18
   .DB $3E , $1A                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:1A
   .DB $02 , $30                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:30
   .DB $06 , $32                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:32
   .DB $0B , $2D                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:2D
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $32 , $11                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:11
   .DB $36 , $13                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:13
   .DB $3A , $19                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:19
   .DB $3E , $1B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:1B
   .DB $02 , $31                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:31
   .DB $06 , $33                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:33
   .DB $0A , $38                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:38
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $31 , $14                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:14
   .DB $36 , $16                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:16
   .DB $3A , $1C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:1C
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $30 , $15                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:15
   .DB $34 , $17                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:17
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $30 , $1D                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:1D
   .DB $34 , $1F                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:1F
   .DB $FF                                               ; END
 
_F}_DEFENDER_TRYING_TACKLE_BARRY_CREDITS_SPR_TILE_DATA 

_F{_BIG_BALL_SPIKE_SPR_TILE_DATA 

BIG_BALL_SPIKE_FORTY_FIVE_SPR_TILE_DATA:                 ; BIG BALL RUSHING TD SPIKE 45 DEGREES
   .DB $FC , $3C                                           ; SET SPR X OFFSET= -4 PIXELS
   .DB $FC , $2D                                           ; SET SPR Y OFFSET= -3 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3F , $23                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:23
   .DB $03 , $29                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:29
   .DB $07 , $2B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:2B
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3F , $26                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:26
   .DB $03 , $2C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:2C
   .DB $07 , $2E                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:2E
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3F , $27                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:27
   .DB $03 , $2D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:2D
   .DB $07 , $2F                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:2F
   .DB $FF                                               ; END

BIG_BALL_SPIKE_FORTY_FIVE_TWO_SPR_TILE_DATA:             ; BIG BALL RUSHING TD SPIKE 45 DEGREES AFTER HITTING GROUND
   .DB $FC , $3C                                           ; SET SPR X OFFSET= -4 PIXELS
   .DB $FC , $2C                                           ; SET SPR Y OFFSET= -4 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3F , $32                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:32
   .DB $03 , $38                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:38
   .DB $07 , $3A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:3A
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3F , $33                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:33
   .DB $03 , $39                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:39
   .DB $07 , $3B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:3B
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3F , $36                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:36
   .DB $03 , $3C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:3C
   .DB $07 , $3E                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:3E
   .DB $FF                                               ; END

BIG_BALL_SPIKE_NINETY_SPR_TILE_DATA:                     ; BIG BALL RUSHING TD SPIKE 90 DEGREES
   .DB $FC , $3F                                           ; SET SPR X OFFSET= -1 PIXELS
   .DB $FC , $2F                                           ; SET SPR Y OFFSET= -1 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3B , $1A                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:1A
   .DB $3F , $30                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:30
   .DB $03 , $1E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:1E
   .DB $07 , $34                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:34
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3B , $1B                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:1B
   .DB $3F , $31                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:31
   .DB $03 , $1F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:1F
   .DB $07 , $35                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:35
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3F , $25                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:25
   .DB $03 , $1D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:1D
   .DB $FF                                               ; END

BIG_BALL_SPIKE_ZERO_SPR_TILE_DATA:                       ; BIG BALL RUSHING TD SPIKE 0 DEGREES
   .DB $FC , $32                                           ; SET SPR X OFFSET= 2 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3F , $10                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:10
   .DB $03 , $12                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:12
   .DB $07 , $18                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:18
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3F , $11                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:11
   .DB $03 , $13                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:13
   .DB $07 , $19                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:19
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3F , $14                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:14
   .DB $03 , $16                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:16
   .DB $07 , $1C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:1C
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3F , $15                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:15
   .DB $03 , $17                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:17
   .DB $FF                                               ; END
   
_F}_BIG_BALL_SPIKE_SPR_TILE_DATA   

_F{_GATORADE_SPR_TILE_DATA 

GATORADE_ONE_SPR_TILE_DATA:                              ; GATORADE CONTAINER BEFORE DUMP TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $04 , $05                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:05
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3C , $00                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:00
   .DB $00 , $02                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:02
   .DB $04 , $08                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:08
   .DB $08 , $0A                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:0A
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $3C , $01                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:01
   .DB $00 , $03                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:03
   .DB $04 , $09                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:09
   .DB $04 , $0B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:0B
   .DB $0C , $21                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:21
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $3C , $04                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:04
   .DB $00 , $06                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:06
   .DB $04 , $0C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:0C
   .DB $08 , $0E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:0E
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $00 , $07                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:07
   .DB $04 , $0D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:0D
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $3D , $20                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:20
   .DB $01 , $22                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:22
   .DB $FC , $2C                                           ; SET SPR Y OFFSET= -4 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3D , $23                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:23
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3D , $26                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:26
   .DB $01 , $2C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:2C
   .DB $FF                                               ; END

GATORADE_TWO_SPR_TILE_DATA:                              ; GATORADE CONTAINER AFTER DUMP TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $39 , $29                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:29
   .DB $3D , $2B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:2B
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $38 , $10                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:10
   .DB $3C , $12                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:12
   .DB $00 , $18                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:18
   .DB $04 , $25                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:25
   .DB $12 , $38                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:38
   .DB $16 , $2F                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:2F
   .DB $1A , $25                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2 ,  TILE ID:25
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $38 , $11                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:11
   .DB $3C , $13                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:13
   .DB $00 , $19                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:19
   .DB $04 , $1B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:1B
   .DB $08 , $31                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:31
   .DB $0E , $0F                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:0F
   .DB $12 , $2D                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:2D
   .DB $16 , $2D                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:2D
   .DB $1A , $27                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2 ,  TILE ID:27
   .DB $1E , $25                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 2 ,  TILE ID:25
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $38 , $14                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:14
   .DB $3C , $16                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:16
   .DB $00 , $1C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:1C
   .DB $04 , $1E                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:1E
   .DB $08 , $34                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:34
   .DB $0E , $1A                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:1A
   .DB $12 , $2D                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:2D
   .DB $16 , $1A                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:1A
   .DB $1A , $2D                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2 ,  TILE ID:2D
   .DB $1E , $32                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 2 ,  TILE ID:32
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $3C , $17                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:17
   .DB $00 , $1D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:1D
   .DB $04 , $1F                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:1F
   .DB $0E , $24                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:24
   .DB $12 , $27                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:27
   .DB $16 , $2D                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:2D
   .DB $1A , $27                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2 ,  TILE ID:27
   .DB $1E , $25                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 2 ,  TILE ID:25
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $00 , $15                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:15
   .DB $04 , $35                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:35
   .DB $12 , $35                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:35
   .DB $16 , $30                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:30
   .DB $1A , $25                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2 ,  TILE ID:25
   .DB $1E , $35                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 2 ,  TILE ID:35
   .DB $86                                               ; SET SPRITE X OFFSET = 6 TILES
   .DB $16 , $25                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:25
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $3D , $28                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:28
   .DB $01 , $2A                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:2A
   .DB $FC , $23                                           ; SET SPR Y OFFSET= 3 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $2E                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:2E
   .DB $FF                                               ; END

_F}_GATORADE_SPR_TILE_DATA    
   
_F{_HALFTIME_WAVE_SPR_TILE_DATA   

HALFTIME_WAVE_ONE_SPR_TILE_DATA:                         ; WAVE TILES (HALFTIME) 1
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $04 , $E8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:E8
   .DB $08 , $EA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:EA
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $04 , $E9                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:E9
   .DB $08 , $EB                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:EB
   .DB $FF                                               ; END

HALFTIME_WAVE_TWO_SPR_TILE_DATA:                         ; WAVE TILES (HALFTIME) 2
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $00 , $E8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:E8
   .DB $04 , $EA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:EA
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $00 , $E9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:E9
   .DB $04 , $EB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:EB
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $05 , $E8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:E8
   .DB $09 , $EA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:EA
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $05 , $E9                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:E9
   .DB $09 , $EB                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:EB
   .DB $FF                                               ; END

HALFTIME_WAVE_THREE_SPR_TILE_DATA:                       ; WAVE TILES (HALFTIME) 3
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $38 , $F0                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $3C , $E6                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:E6
   .DB $00 , $EC                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:EC
   .DB $04 , $EE                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:EE
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $38 , $F1                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $3C , $E7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:E7
   .DB $00 , $ED                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:ED
   .DB $04 , $EF                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:EF
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $01 , $E8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:E8
   .DB $05 , $EA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:EA
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $01 , $E9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:E9
   .DB $05 , $EB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:EB
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $06 , $E8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:E8
   .DB $0A , $EA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EA
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $06 , $E9                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:E9
   .DB $0A , $EB                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EB
   .DB $FF                                               ; END

HALFTIME_WAVE_FOUR_SPR_TILE_DATA:                        ; WAVE TILES (HALFTIME) 4
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3C , $F0                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $00 , $E6                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:E6
   .DB $04 , $EC                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:EC
   .DB $08 , $EE                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:EE
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3C , $F1                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $00 , $E7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:E7
   .DB $04 , $ED                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:ED
   .DB $08 , $EF                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:EF
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $39 , $F0                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:F0
   .DB $3D , $E6                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:E6
   .DB $01 , $EC                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:EC
   .DB $05 , $EE                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:EE
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $39 , $F1                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:F1
   .DB $3D , $E7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:E7
   .DB $01 , $ED                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:ED
   .DB $05 , $EF                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:EF
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $02 , $E8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:E8
   .DB $06 , $EA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:EA
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $02 , $E9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:E9
   .DB $06 , $EB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:EB
   .DB $86                                               ; SET SPRITE X OFFSET = 6 TILES
   .DB $07 , $E8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $0B , $EA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:EA
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $07 , $E9                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E9
   .DB $0B , $EB                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:EB
   .DB $FF                                               ; END

HALFTIME_WAVE_FIVE_SPR_TILE_DATA:                        ; WAVE TILES (HALFTIME) 5
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $00 , $F0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $04 , $E6                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:E6
   .DB $08 , $EC                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:EC
   .DB $0C , $EE                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:EE
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $00 , $F1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $04 , $E7                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:E7
   .DB $08 , $ED                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:ED
   .DB $0C , $EF                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:EF
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $3D , $F0                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:F0
   .DB $01 , $E6                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:E6
   .DB $05 , $EC                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:EC
   .DB $09 , $EE                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:EE
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $3D , $F1                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:F1
   .DB $01 , $E7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:E7
   .DB $05 , $ED                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:ED
   .DB $09 , $EF                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:EF
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $3A , $F0                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:F0
   .DB $3E , $E6                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:E6
   .DB $02 , $EC                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:EC
   .DB $06 , $EE                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:EE
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $3A , $F1                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:F1
   .DB $3E , $E7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:E7
   .DB $02 , $ED                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:ED
   .DB $06 , $EF                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:EF
   .DB $86                                               ; SET SPRITE X OFFSET = 6 TILES
   .DB $03 , $E8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $07 , $EA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:EA
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $03 , $E9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E9
   .DB $07 , $EB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:EB
   .DB $FF                                               ; END

HALFTIME_WAVE_SIX_SPR_TILE_DATA:                         ; WAVE TILES (HALFTIME) 6
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $01 , $F0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:F0
   .DB $05 , $E6                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:E6
   .DB $09 , $EC                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:EC
   .DB $0D , $EE                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:EE
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $01 , $F1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:F1
   .DB $05 , $E7                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:E7
   .DB $09 , $ED                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:ED
   .DB $0D , $EF                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:EF
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $3E , $F0                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:F0
   .DB $02 , $E6                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:E6
   .DB $06 , $EC                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:EC
   .DB $0A , $EE                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EE
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $3E , $F1                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:F1
   .DB $02 , $E7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:E7
   .DB $06 , $ED                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:ED
   .DB $0A , $EF                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EF
   .DB $86                                               ; SET SPRITE X OFFSET = 6 TILES
   .DB $3B , $F0                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:F0
   .DB $3F , $E6                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:E6
   .DB $03 , $EC                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:EC
   .DB $07 , $EE                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:EE
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $3B , $F1                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:F1
   .DB $3F , $E7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:E7
   .DB $03 , $ED                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $07 , $EF                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:EF
   .DB $FF                                               ; END

HALFTIME_WAVE_SEVEN_SPR_TILE_DATA:                       ; WAVE TILES (HALFTIME) 7
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $02 , $F0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:F0
   .DB $06 , $E6                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:E6
   .DB $0A , $EC                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EC
   .DB $0E , $EE                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:EE
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $02 , $F1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:F1
   .DB $06 , $E7                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:E7
   .DB $0A , $ED                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:ED
   .DB $0E , $EF                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:EF
   .DB $86                                               ; SET SPRITE X OFFSET = 6 TILES
   .DB $3F , $F0                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:F0
   .DB $03 , $E6                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E6
   .DB $07 , $EC                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:EC
   .DB $0B , $EE                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:EE
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $3F , $F1                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:F1
   .DB $03 , $E7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E7
   .DB $07 , $ED                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $0B , $EF                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:EF
   .DB $FF                                               ; END

HALFTIME_WAVE_EIGHT_SPR_TILE_DATA:                       ; WAVE TILES (HALFTIME) 8
   .DB $86                                               ; SET SPRITE X OFFSET = 6 TILES
   .DB $03 , $F0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F0
   .DB $07 , $E6                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E6
   .DB $0B , $EC                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:EC
   .DB $0F , $EE                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:EE
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $03 , $F1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F1
   .DB $07 , $E7                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E7
   .DB $0B , $ED                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $0F , $EF                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:EF
   .DB $FF                                               ; END

_F}_HALFTIME_WAVE_SPR_TILE_DATA     

_F{_LT_AFTER_SACK_INTRO_SPR_TILE_DATA     

LT_AFTER_SACK_INTRO_SPR_TILE_DATA:                                                    ; LT SPRITE AFTER SACK (INTRO) TILES
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $35 , $16                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:16
   .DB $39 , $1C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:1C
   .DB $3C , $1E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1E
   .DB $00 , $34                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:34
   .DB $06 , $36                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:36
   .DB $0A , $3C                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:3C
   .DB $0E , $3E                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:3E
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $31 , $15                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:15
   .DB $35 , $17                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:17
   .DB $39 , $1D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:1D
   .DB $3C , $1F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1F
   .DB $01 , $35                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:35
   .DB $04 , $37                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:37
   .DB $0B , $3D                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:3D
   .DB $0F , $3F                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:3F
   .DB $13 , $45                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3 ,  TILE ID:45
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $2D , $1A                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1 ,  TILE ID:1A
   .DB $30 , $40                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:40
   .DB $34 , $42                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:42
   .DB $38 , $48                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:48
   .DB $3D , $4A                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:4A
   .DB $01 , $60                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:60
   .DB $04 , $62                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:62
   .DB $0B , $68                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:68
   .DB $0F , $6A                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:6A
   .DB $13 , $50                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3 ,  TILE ID:50
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $2D , $1B                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1 ,  TILE ID:1B
   .DB $E4 , $04 , $19                                       ; MOVE SPRITE 4 PIXELS X , OFFSET Y BY: 1 PIXELS USE SPR PAL: 0 ,  TILE ID:19
   .DB $32 , $41                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:41
   .DB $34 , $43                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:43
   .DB $38 , $49                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:49
   .DB $3D , $4B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:4B
   .DB $01 , $61                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:61
   .DB $04 , $63                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:63
   .DB $0B , $69                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:69
   .DB $0F , $6B                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:6B
   .DB $13 , $51                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3 ,  TILE ID:51
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $2D , $31                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1 ,  TILE ID:31
   .DB $31 , $44                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:44
   .DB $36 , $46                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:46
   .DB $39 , $4C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:4C
   .DB $3D , $4E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:4E
   .DB $01 , $64                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:64
   .DB $06 , $66                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:66
   .DB $0B , $6C                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:6C
   .DB $0F , $6E                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:6E
   .DB $13 , $54                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3 ,  TILE ID:54
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $35 , $47                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:47
   .DB $39 , $4D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:4D
   .DB $3D , $4F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:4F
   .DB $00 , $65                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:65
   .DB $05 , $67                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $0A , $6D                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:6D
   .DB $0E , $6F                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:6F
   .DB $12 , $11                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:11
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $35 , $52                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:52
   .DB $39 , $58                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:58
   .DB $3D , $5A                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5A
   .DB $01 , $70                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:70
   .DB $05 , $72                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:72
   .DB $0B , $78                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:78
   .DB $0E , $7A                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:7A
   .DB $12 , $14                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:14
   .DB $FF                                               ; END
   
_F}_LT_AFTER_SACK_INTRO_SPR_TILE_DATA      

_F{_QB_DROPBACK_INTRO_SPR_TILE_DATA    


QB_DROPBACK_SPR_TILE_DATA:                               ; QB DROPBACK (INTRO) TILES
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $32 , $10                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:10
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $08 , $05                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:05
   .DB $0C , $07                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:07
   .DB $32 , $11                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:11
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $28 , $00                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:00
   .DB $2C , $02                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:02
   .DB $E0 , $13 , $1D                                       ; MOVE SPRITE 0 PIXELS X , OFFSET Y BY: 4 PIXELS USE SPR PAL: 3 ,  TILE ID:1d
   .DB $31 , $08                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:08
   .DB $00 , $20                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:20
   .DB $04 , $22                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:22
   .DB $08 , $28                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:28
   .DB $0C , $2A                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:2A
   .DB $03 , $19                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:19
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $28 , $01                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:01
   .DB $2C , $03                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:03
   .DB $E2 , $13 , $1F                                       ; MOVE SPRITE 2 PIXELS X , OFFSET Y BY: 4 PIXELS USE SPR PAL: 3 ,  TILE ID:1f
   .DB $30 , $09                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:09
   .DB $00 , $21                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:21
   .DB $04 , $23                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:23
   .DB $08 , $29                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:29
   .DB $0C , $2B                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:2B
   .DB $03 , $1C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:1C
   .DB $07 , $1E                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:1E
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $28 , $04                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:04
   .DB $2C , $06                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:06
   .DB $30 , $0C                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:0C
   .DB $00 , $24                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:24
   .DB $04 , $26                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:26
   .DB $08 , $2C                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:2C
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $32 , $0D                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:0D
   .DB $00 , $25                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:25
   .DB $04 , $27                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:27
   .DB $08 , $2D                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:2D
   .DB $0C , $2F                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:2F
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $04 , $32                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:32
   .DB $08 , $38                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:38
   .DB $0C , $3A                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:3A
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $0C , $2E                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:2E
   .DB $FC , $3E                                           ; SET SPR X OFFSET= -2 PIXELS
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $35 , $0A                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:0A
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $35 , $0B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:0B
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $35 , $0E                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:0E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $36 , $0F                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:0F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $36 , $1A                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:1A
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $36 , $1B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:1B
   .DB $FC , $3C                                           ; SET SPR X OFFSET= -4 PIXELS
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $39 , $14                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:14
   .DB $3D , $18                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:18
   .DB $3F , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:37
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $39 , $15                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:15
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $12                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:12
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $39 , $13                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:13
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $39 , $16                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:16
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3A , $17                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:17
   .DB $FC , $32                                           ; SET SPR X OFFSET= 2 PIXELS
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3E , $30                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:30
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3E , $31                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:31
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3D , $34                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:34
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3D , $35                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:35
   .DB $FC , $24                                           ; SET SPR Y OFFSET= 4 PIXELS
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $33 , $33                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3 ,  TILE ID:33
   .DB $37 , $39                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:39
   .DB $3B , $3B                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:3B
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $33 , $36                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3 ,  TILE ID:36
   .DB $37 , $3C                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:3C
   .DB $3B , $3E                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:3E
   .DB $FF                                               ; END
 
_F}_QB_DROPBACK_INTRO_SPR_TILE_DATA    

_F{_GARBAGE_SPR_TILE_DATA   
 

GARBAGE_SPR_TILE_DATA:									 ; *** GARBAGE UNUSED DATA CAN BE DELETED	
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $79                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:79
   .DB $FF                                               ; END
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $7B                                         ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:7B
   .DB $FF                                               ; END
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $7D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:7D
   .DB $FF                                               ; END
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $7F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:7F
   .DB $FF                                               ; END
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $75                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:75
   .DB $FF                                               ; END
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $77                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:77
   .DB $FF                                               ; END
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $6D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:6D
   .DB $FF                                               ; END
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $6F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:6F
   .DB $FF                                               ; END
   
_F}GARBAGE_SPR_TILE_DATA     

_F{_PLAYER_ARM_BENT_CREDITS_SPR_TILE_DATA 


PLAYER_ARM_BENT_CREDITS_SPR_TILE_DATA:                                                    ; PLAYER ARM BENT (CREDITS) TILES
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $34 , $F5                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F5
   .DB $38 , $F7                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:F7
   .DB $3C , $FD                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:FD
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $34 , $FF                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:FF
   .DB $38 , $FE                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:FE
   .DB $3C , $FB                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:FB
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $38 , $F8                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:F8
   .DB $3C , $FA                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:FA
   JUMP_SPRITE_SCRIPT[ADDR] BODY_OF_QB_ARM_IN_AIR_CREDITS_SPR_TILE_DATA   

_F}_PLAYER_ARM_BENT_CREDITS_SPR_TILE_DATA    

_F{_PLAYER_ARM_IN_AIR_CREDITS_SPR_TILE_DATA 

PLAYER_ARM_IN_AIR_CREDITS_SPR_TILE_DATA:                                                    ; PLAYER ARM IN AIR (CREDITS) TILES  
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3C , $58                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:58
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $34 , $55                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:55
   .DB $38 , $4D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4D
   .DB $3C , $4F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $30 , $76                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:76
   .DB $34 , $54                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:54
   .DB $38 , $4C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4C
   .DB $3C , $4E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:4E
   .DB $FC , $3F                                           ; SET SPR X OFFSET= -1 PIXELS
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $24 , $65                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 0 ,  TILE ID:65
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $28 , $5F                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:5F
   .DB $2C , $75                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:75
   .DB $30 , $74                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:74
   .DB $34 , $51                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:51
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $28 , $5E                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:5E
   JUMP_SPRITE_SCRIPT[ADDR] BODY_OF_QB_ARM_IN_AIR_CREDITS_SPR_TILE_DATA 
   
_F}_PLAYER_ARM_IN_AIR_CREDITS_SPR_TILE_DATA    

_F{_PLAYER_LOOKING_COIN_TOSS_SPR_TILE_DATA 


PLAYER_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA:                                                    ; PLAYERS LOOKING FORWARD (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3A , $C5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:C5
   .DB $3E , $C7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:C7
   .DB $02 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:CD
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $78 , $C5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:C5
   .DB $7C , $C7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:C7
   .DB $40 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:CD
   .DB $FF                                               ; END

PLAYER_LOOKING_UP_COIN_TOSS_SPR_TILE_DATA:                                                    ; PLAYERS LOOKING UP (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3A , $CF                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:CF
   .DB $3E , $E5                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:E5
   .DB $02 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:CD
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $78 , $CF                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:CF
   .DB $7C , $E5                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:E5
   .DB $40 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:CD
   .DB $FF                                               ; END

PLAYER_LOOKING_DOWN_COIN_TOSS_SPR_TILE_DATA:                                                    ; PLAYERS LOOKING DOWN (COIN TOSS) TILES
   .DB $FC , $3F                                           ; SET SPR X OFFSET= -1 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3A , $C5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:C5
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3E , $E6                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:E6
   .DB $02 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:CD
   .DB $FC , $31                                           ; SET SPR X OFFSET= 1 PIXELS
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $78 , $C5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:C5
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $7C , $E6                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:E6
   .DB $40 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:CD
   .DB $FF                                               ; END
   
_F}_PLAYER_LOOKING_COIN_TOSS_SPR_TILE_DATA    

_F{_POINTING_KICK_CHOICE_SPR_TILE_DATA 


P2_POINTING_KICK_CHOICE_SPR_TILE_DATA:                   ; P2 POINTING WITH BOTH PLAYERS (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3A , $C5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:C5
   .DB $3E , $FA                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:FA
   .DB $02 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:CD
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $7E , $FB                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:FB
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $78 , $C5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:C5
   .DB $7C , $C7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:C7
   .DB $40 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:CD
   .DB $FF                                               ; END

P1_POINTING_KICK_CHOICE_SPR_TILE_DATA:                                                    ; P1 POINTING WITH BOTH PLAYERS (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3A , $C5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:C5
   .DB $3E , $C7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:C7
   .DB $02 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:CD
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $3C , $FB                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:FB
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $78 , $C5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:C5
   .DB $7C , $FA                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:FA
   .DB $40 , $CD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:CD
   .DB $FF                                               ; END
   
_F}_POINTING_KICK_CHOICE_SPR_TILE_DATA  

_F{_REF_COIN_TOSS_SPR_TILE_DATA 

REF_LOOKING_FORWARD_COIN_TOSS_SPR_TILE_DATA:                                                    ; REF LOOKING FORWARD (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $D0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D0
   .DB $07 , $D2                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D2
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $03 , $D1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D1
   .DB $07 , $D3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D3
   .DB $FF                                               ; END

REF_LOOKING_UP_COIN_TOSS_SPR_TILE_DATA:                                                    ; REF LOOKING UP (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $D8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D8
   .DB $07 , $D2                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D2
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $03 , $D1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D1
   .DB $07 , $D3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D3
   .DB $FF                                               ; END

REF_LOOKING_DOWN_COIN_TOSS_SPR_TILE_DATA:                                                    ; REF LOOKING DOWN (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $DA                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:DA
   .DB $07 , $D2                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D2
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $03 , $D1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D1
   .DB $07 , $D3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D3
   .DB $FF                                               ; END

REF_FLIP_COIN_SPR_TILE_DATA:                                                    ; REF FLIP COIN (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $D9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D9
   .DB $07 , $DB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:DB
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $03 , $D1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D1
   .DB $07 , $D3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:D3
   .DB $FF                                               ; END

REF_POINTS_P2_COIN_TOSS_SPR_TILE_DATA:                                                    ; REF POINTING TO P2 (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $F0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F0
   .DB $07 , $DB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:DB
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $03 , $F1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F1
   .DB $07 , $F3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:F3
   .DB $FF                                               ; END

REF_PICK_UP_COIN_SPR_TILE_DATA:                                                    ; REF PICK UP COIN (COIN TOSS) TILES
   .DB $FC , $22                                           ; SET SPR Y OFFSET= 2 PIXELS
   .DB $FC , $31                                           ; SET SPR X OFFSET= 1 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $F2                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F2
   .DB $07 , $F8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:F8
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $03 , $F9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F9
   .DB $07 , $EF                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:EF
   .DB $FF                                               ; END

REF_POINTS_P1_COIN_TOSS_SPR_TILE_DATA:                                                    ; REF POINTING TO P1 (COIN TOSS) TILES
   .DB $FC , $33                                           ; SET SPR X OFFSET= 3 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $43 , $F0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F0
   .DB $47 , $DB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:DB
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $43 , $F1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F1
   .DB $47 , $F3                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:F3
   .DB $FF                                               ; END
   
_F}_REF_COIN_TOSS_SPR_TILE_DATA    

_F{_LARGE_REF_SPR_TILE_DATA

REF_ARMS_DOWN_SPR_TILE_DATA:                             ; REF ARMS DOWN TILES
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3D , $61                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:61
   .DB $01 , $63                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:63
   .DB $05 , $69                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:69
   .DB $08 , $6B                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:6B
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $4E                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:4E
   .DB $3D , $64                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:64
   .DB $01 , $66                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:66
   .DB $05 , $6C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6C
   .DB $09 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $34 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $38 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $3D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $01 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $05 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $09 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $71 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $74 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $78 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $7D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $41 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $45 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $49 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $79 , $4E                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:4E
   .DB $7D , $64                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:64
   .DB $41 , $66                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:66
   .DB $45 , $6C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6C
   .DB $49 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $7D , $61                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:61
   .DB $41 , $63                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:63
   .DB $45 , $69                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:69
   .DB $48 , $6B                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:6B
   .DB $FF                                               ; END

REF_FALSE_START_SPR_TILE_DATA:                           ; REF FALSE START TILES
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3D , $0D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:0D
   .DB $01 , $0F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:0F
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $0C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:0C
   .DB $3D , $18                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:18
   .DB $01 , $1A                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:1A
   .DB $05 , $13                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:13
   .DB $09 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $34 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $38 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $3C , $19                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:19
   .DB $00 , $1B                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:1B
   .DB $05 , $16                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:16
   .DB $09 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $71 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $74 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $78 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $3C , $1C                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1C
   .DB $01 , $1E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:1E
   .DB $45 , $16                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:16
   .DB $49 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $39 , $17                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:17
   .DB $3D , $1D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:1D
   .DB $01 , $1F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:1F
   .DB $45 , $13                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:13
   .DB $49 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $39 , $42                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:42
   .DB $3D , $48                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:48
   .DB $01 , $4A                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:4A
   .DB $FF                                               ; END

REF_ARMS_FG_GOOD_SPR_TILE_DATA:                                                    ; REF ARMS IN AIR (FG GOOD) TILES
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $28 , $58                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:58
   .DB $2C , $5A                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:5A
   .DB $31 , $70                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:70
   .DB $35 , $72                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:72
   .DB $39 , $78                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:78
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $39 , $79                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:79
   .DB $3D , $7B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7B
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $7C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $3D , $7E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $01 , $7F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7F
   .DB $05 , $7A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $09 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $34 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $38 , $7D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:7D
   .DB $3D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $01 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $05 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $09 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $71 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $74 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $78 , $7D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:7D
   .DB $7D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $41 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $45 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $49 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $79 , $7C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $7D , $7E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $41 , $7F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7F
   .DB $45 , $7A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $49 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $79 , $79                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:79
   .DB $7D , $7B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7B
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $68 , $58                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:58
   .DB $6C , $5A                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:5A
   .DB $71 , $70                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:70
   .DB $75 , $72                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:72
   .DB $79 , $78                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:78
   .DB $FF                                               ; END

REF_HANDS_ON_HIPS_SPR_TILE_DATA:                         ; REF HANDS ON HIPS TILES
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $3D , $71                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:71
   .DB $01 , $73                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:73
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $39 , $5C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:5C
   .DB $3D , $5E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5E
   .DB $01 , $74                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:74
   .DB $04 , $76                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:76
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $5D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:5D
   .DB $3D , $5F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5F
   .DB $01 , $75                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:75
   .DB $04 , $77                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:77
   .DB $09 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $34 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $38 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $3D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $01 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $05 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $09 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $71 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $74 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $78 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $7D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $41 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $45 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $49 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $79 , $5D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:5D
   .DB $7D , $5F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5F
   .DB $41 , $75                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:75
   .DB $44 , $77                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:77
   .DB $49 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $79 , $5C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:5C
   .DB $7D , $5E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5E
   .DB $41 , $74                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:74
   .DB $44 , $76                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:76
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $7D , $71                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:71
   .DB $41 , $73                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:73
   .DB $FF                                               ; END

REF_ONE_ARM_NINETY_ONE_ARM_SIDE_SPR_DATA:                                                    ; REF ONE ARM DOWN ONE ARM AT 90 AT SIDE
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $04 , $51                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:51
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $01 , $53                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:53
   .DB $04 , $59                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:59
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3D , $54                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:54
   .DB $01 , $56                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:56
   .DB $05 , $5B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:5B
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $60                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:60
   .DB $3D , $55                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:55
   .DB $01 , $57                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:57
   .DB $05 , $7A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $09 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $34 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $38 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $3D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $01 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $05 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $09 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $71 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $74 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $78 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $7D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $41 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $45 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $49 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $79 , $4E                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:4E
   .DB $7D , $64                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:64
   .DB $41 , $66                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:66
   .DB $45 , $6C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6C
   .DB $49 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $7D , $61                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:61
   .DB $41 , $63                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:63
   .DB $45 , $69                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:69
   .DB $48 , $6B                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:6B
   .DB $FF                                               ; END

REF_HANDS_CROSSED_ON_BELT_SPR_DATA:                                                    ; REF HANDS CROSSED ON TOP OF BELT TILES
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3D , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:37
   .DB $01 , $3D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:3D
   .DB $05 , $3F                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:3F
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $60                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:60
   .DB $3D , $62                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:62
   .DB $01 , $68                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:68
   .DB $05 , $6A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6A
   .DB $09 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $34 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $38 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $3D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $01 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $04 , $05                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:05
   .DB $08 , $01                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:01
   .DB $09 , $07                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:07
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $71 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $74 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $78 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $7D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $41 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $04 , $10                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:10
   .DB $08 , $04                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:04
   .DB $09 , $12                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:12
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $79 , $60                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:60
   .DB $7D , $62                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:62
   .DB $41 , $68                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:68
   .DB $45 , $6A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6A
   .DB $49 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $7D , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:37
   .DB $41 , $3D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:3D
   .DB $45 , $3F                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:3F
   .DB $FF                                               ; END

REF_ARMS_AT_SIDES_SPR_TILE_DATA:                                                    ; REF BOTH ARMS OUT AT SIDE TILES
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $01 , $46                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:46
   .DB $04 , $4C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:4C
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3D , $45                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:45
   .DB $01 , $47                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:47
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $60                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:60
   .DB $3D , $50                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:50
   .DB $01 , $52                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:52
   .DB $05 , $7A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $09 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $34 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $38 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $3D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $01 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $05 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $09 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $71 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $74 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $78 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $7D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $41 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $45 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $49 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $79 , $60                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:60
   .DB $7D , $50                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:50
   .DB $41 , $52                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:52
   .DB $45 , $7A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $49 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $7D , $45                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:45
   .DB $41 , $47                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:47
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $41 , $46                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:46
   .DB $44 , $4C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:4C
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $44 , $4D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:4D
   .DB $FC , $2F                                           ; SET SPR Y OFFSET= -1 PIXELS
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $04 , $4D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:4D
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $44 , $4D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:4D
   .DB $FF                                               ; END

REF_FIRST_DOWN_SPR_TILE_DATA:                            ; REF HAND 1ST DOWN TILES 
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $28 , $25                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:25
   .DB $2C , $27                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:27
   JUMP_SPRITE_SCRIPT[ADDR] REF_BODY_DOWN_SIGNAL_SPR_TILE_DATA 
   
REF_SECOND_DOWN_SPR_TILE_DATA:                           ; REF HAND 2ND DOWN TILES
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $28 , $30                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:30
   .DB $2C , $32                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:32
   JUMP_SPRITE_SCRIPT[ADDR] REF_BODY_DOWN_SIGNAL_SPR_TILE_DATA 
   
REF_THIRD_DOWN_SPR_TILE_DATA:                                                    ; REF HAND 3RD DOWN TILES
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $28 , $2D                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:2D
   .DB $2C , $2F                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:2F
   JUMP_SPRITE_SCRIPT[ADDR] REF_BODY_DOWN_SIGNAL_SPR_TILE_DATA 
   
REF_FOURTH_DOWN_SPR_TILE_DATA:                                                    ; REF HAND 4TH DOWN TILES
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $28 , $38                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:38
   .DB $2C , $3A                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:3A
   JUMP_SPRITE_SCRIPT[ADDR] REF_BODY_DOWN_SIGNAL_SPR_TILE_DATA 

REF_ARM_BENT_FIRST_DOWN_SPR_TILE_DATA:                   ; REF ARM BENT FOR FIRST DOWN
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $31 , $02                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:02
   .DB $36 , $08                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:08
   .DB $39 , $0A                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:0A
   .DB $3D , $20                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:20
   .DB $01 , $22                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:22
   .DB $05 , $28                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:28
   .DB $09 , $2A                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:2A
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $03                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:03
   .DB $34 , $09                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:09
   .DB $39 , $0B                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:0B
   .DB $3D , $21                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:21
   .DB $01 , $23                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:23
   .DB $05 , $29                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:29
   .DB $09 , $2B                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:2B
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $2C , $31                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:31
   .DB $30 , $33                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:33
   .DB $35 , $39                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:39
   .DB $39 , $3B                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:3B
   .DB $3D , $24                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:24
   .DB $01 , $26                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:26
   .DB $05 , $2C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:2C
   .DB $09 , $2E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:2E
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $2C , $34                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:34
   .DB $30 , $36                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:36
   .DB $35 , $3C                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:3C
   .DB $39 , $3E                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:3E
   .DB $3D , $35                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:35
   .DB $FF                                               ; END

REF_ARM_FORWARD_FOR_FIRST_DOWN_SPR_TILE_DATA:            ; REF ARM POINTING FORWARD FOR FIRST DOWN
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $31 , $02                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:02
   .DB $36 , $08                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:08
   .DB $39 , $0A                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:0A
   .DB $3D , $20                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:20
   .DB $01 , $22                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:22
   .DB $05 , $28                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:28
   .DB $09 , $2A                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:2A
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $03                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:03
   .DB $34 , $09                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:09
   .DB $39 , $0B                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:0B
   .DB $3D , $21                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:21
   .DB $01 , $23                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:23
   .DB $05 , $29                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:29
   .DB $09 , $2B                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:2B
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $31 , $06                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:06
   .DB $39 , $0E                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:0E
   .DB $3D , $24                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:24
   .DB $01 , $26                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:26
   .DB $05 , $2C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:2C
   .DB $09 , $2E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:2E
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $39 , $11                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:11
   .DB $3D , $00                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:00
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $35 , $41                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:41
   .DB $39 , $14                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:14
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $34 , $44                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:44
   .DB $38 , $15                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:15
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $34 , $43                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:43
   .DB $38 , $40                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:40
   .DB $FF                                               ; END
   
_F}_LARGE_REF_SPR_TILE_DATA   

UNEEDED_JUMP_TO_BOTTOM_UPRIGHT_SPR_TILE_DATA:               ; *** UNNEEDED COULD JUMP DIRECT P1 RIGHT UPRIGHT TILES
   JUMP_SPRITE_SCRIPT[ADDR] BOTTOM_UPRIGHT_SPR_TILE_DATA                                 

_F{_COACH_ARM_SUPER_BOWL_SPR_TILE_DATA

COACH_ARM_SUPER_BOWL_SPR_TILE_DATA:                       ; COACH WITH ARM IN AIR TILES(CREDITS)
   .DB $97                                               ; SET SPRITE X OFFSET = -9 TILES
   .DB $19 , $69                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 1 ,  TILE ID:69
   .DB $1D , $6B                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1 ,  TILE ID:6B
   .DB $98                                               ; SET SPRITE X OFFSET = -8 TILES
   .DB $19 , $6C                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 1 ,  TILE ID:6C
   .DB $1D , $82                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1 ,  TILE ID:82
   .DB $99                                               ; SET SPRITE X OFFSET = -7 TILES
   .DB $19 , $6D                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $1D , $6F                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $9A                                               ; SET SPRITE X OFFSET = -6 TILES
   .DB $1A , $78                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2 ,  TILE ID:78
   .DB $1E , $7A                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 2 ,  TILE ID:7A
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $1A , $79                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2 ,  TILE ID:79
   .DB $1E , $7B                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 2 ,  TILE ID:7B
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $0F , $F2                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:F2
   .DB $13 , $F8                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3 ,  TILE ID:F8
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $03 , $CF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:CF
   .DB $07 , $E5                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:E5
   .DB $0B , $E7                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:E7
   .DB $0F , $ED                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $13 , $EF                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3 ,  TILE ID:EF
   .DB $17 , $D6                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3 ,  TILE ID:D6
   .DB $FC , $2C                                           ; SET SPR Y OFFSET= -4 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3A , $D2                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:D2
   .DB $3E , $D8                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:D8
   .DB $02 , $DA                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:DA
   .DB $07 , $83                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:83
   .DB $0B , $83                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:83
   .DB $0F , $83                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:83
   .DB $13 , $83                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 3 ,  TILE ID:83
   .DB $FC , $2D                                           ; SET SPR Y OFFSET= -3 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3A , $D3                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:D3
   .DB $3E , $D9                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:D9
   .DB $03 , $DB                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:DB
   .DB $07 , $83                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:83
   .DB $0B , $83                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:83
   .DB $0F , $83                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:83
   .DB $FC , $20                                           ; SET SPR Y OFFSET= 0 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3F , $DC                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:DC
   .DB $03 , $DE                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:DE
   .DB $07 , $F4                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:F4
   .DB $0B , $F6                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:F6
   .DB $0F , $F7                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 3 ,  TILE ID:F7
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3B , $D7                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:D7
   .DB $3F , $DD                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:DD
   .DB $03 , $DF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:DF
   .DB $10 , $6E                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $37 , $7C                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:7C
   .DB $3B , $7E                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:7E
   .DB $3F , $D4                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:D4
   .DB $03 , $D5                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:D5
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $33 , $F0                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3 ,  TILE ID:F0
   .DB $37 , $7D                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:7D
   .DB $3B , $7F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:7F
   .DB $3F , $D5                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:D5
   .DB $FC , $34                                           ; SET SPR X OFFSET= 4 PIXELS
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $2A , $BE                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 2 ,  TILE ID:BE
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $2E , $6A                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 2 ,  TILE ID:6A
   .DB $33 , $F1                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 3 ,  TILE ID:F1
   .DB $37 , $F3                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:F3
   .DB $FF                                               ; END

_F}_COACH_ARM_SUPER_BOWL_SPR_TILE_DATA   

_F{_COACH_MISC_SPRITES_SPR_TILE_DATA 

COACH_MISC_SPRITES_SPR_TILE_DATA:                                                    ; EXTRA SPRITES COACH BG (CREDITS) TILES
   .DB $94                                               ; SET SPRITE X OFFSET = -12 TILES
   .DB $1A , $AF                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 2 ,  TILE ID:AF
   .DB $98                                               ; SET SPRITE X OFFSET = -8 TILES
   .DB $16 , $BA                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:BA
   .DB $88                                               ; SET SPRITE X OFFSET = 8 TILES
   .DB $16 , $BB                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:BB
   .DB $FF                                               ; END

_F}_COACH_MISC_SPRITES_SPR_TILE_DATA    
 
_F{_QB_FACE_SUPER_BOWL_SPR_TILE_DATA 

QB_FACE_SUPER_BOWL_SPR_TILE_DATA:                                                    ; PLAYER FACE INTERVIEW (CREDITS) TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $38 , $50                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:50
   .DB $3C , $52                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:52
   .DB $00 , $58                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:58
   .DB $04 , $5A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:5A
   .DB $08 , $70                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:70
   .DB $0C , $72                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:72
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $38 , $51                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:51
   .DB $3C , $53                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:53
   .DB $00 , $59                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:59
   .DB $04 , $5B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:5B
   .DB $08 , $71                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:71
   .DB $0C , $73                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:73
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $38 , $54                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:54
   .DB $3C , $56                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:56
   .DB $00 , $5C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:5C
   .DB $04 , $5E                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:5E
   .DB $08 , $74                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:74
   .DB $0C , $76                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:76
   .DB $FC , $2B                                           ; SET SPR Y OFFSET= -5 PIXELS
   .DB $FC , $3B                                           ; SET SPR X OFFSET= -5 PIXELS
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $12 , $67                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:67
   .DB $FC , $2B                                           ; SET SPR Y OFFSET= -5 PIXELS
   .DB $FC , $3B                                           ; SET SPR X OFFSET= -5 PIXELS
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $16 , $6F                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:6F
   .DB $FC , $20                                           ; SET SPR Y OFFSET= 0 PIXELS
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $8C                                               ; SET SPRITE X OFFSET = 12 TILES
   .DB $04 , $44                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:44
   .DB $08 , $45                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:45
   .DB $FF                                               ; END
   
_F}_QB_FACE_SUPER_BOWL_SPR_TILE_DATA   

_F{_MICS_SUPER_BOWL_INTERVIEW_SPR_TILE_DATA 


MICS_FROM_LEFT_SUPER_BOWL_SPR_TILE_DATA:                                                    ; MIC'S FROM LEFT (CREDITS) TILES
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $01 , $78                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:78
   .DB $05 , $7A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $01 , $79                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:79
   .DB $05 , $7B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7B
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3E , $7E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:7E
   .DB $01 , $7C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3A , $7D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:7D
   .DB $3E , $7F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:7F
   .DB $FF                                               ; END

MICS_FROM_RIGHT_SUPER_BOWL_SPR_TILE_DATA:                                                    ; MIC'S FROM RIGHT (CREDITS) TILES
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $01 , $75                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:75
   .DB $05 , $77                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:77
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $01 , $5D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:5D
   .DB $05 , $5F                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:5F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3E , $55                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:55
   .DB $02 , $57                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:57
   .DB $8A                                               ; SET SPRITE X OFFSET = 10 TILES
   .DB $7E , $7D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:7D
   .DB $42 , $7F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:7F
   .DB $8B                                               ; SET SPRITE X OFFSET = 11 TILES
   .DB $42 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:7E
   .DB $45 , $7C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $8C                                               ; SET SPRITE X OFFSET = 12 TILES
   .DB $45 , $79                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:79
   .DB $49 , $7B                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:7B
   .DB $8D                                               ; SET SPRITE X OFFSET = 13 TILES
   .DB $45 , $78                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:78
   .DB $49 , $7A                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $FF                                               ; END

_F}_MICS_SUPER_BOWL_INTERVIEW_SPR_TILE_DATA    

_F{_LEADING_RUSHER_SILOUHETTE_SPR_TILE_DATA  
  

LEADING_RUSHER_SI_SPR_TILE_DATA:                                                    ; LEADING RUSHERS SILOUHETTE
                                                         ; FEET
   .DB $FC , $20                                           ; SET SPR Y OFFSET= 0 PIXELS
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $08 , $09                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:09
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $08 , $0C                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:0C
   .DB $0C , $0E                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:0E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $0C , $11                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:11
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $0C , $14                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:14
   .DB $10 , $16                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0 ,  TILE ID:16
   JUMP_SPRITE_SCRIPT[ADDR] BARRY_ALL_BUT_FEET_SPR_TILE_DATA
   
_F}_LEADING_RUSHER_SILOUHETTE_SPR_TILE_DATA    

_F{_WAVING_FLAGS_SPR_TILE_DATA  
   
WAVING_FLAGS_ONE_SPR_TILE_DATA:                                                    ; WAVING FLAGS 1 TILES
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $3C , $15                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:15
   .DB $00 , $17                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:17
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $3C , $1D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1D
   .DB $00 , $1F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:1F
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3C , $1E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1E
   .DB $00 , $31                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:31
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3C , $34                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:34
   .DB $00 , $35                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:35
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $3C , $36                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:36
   .DB $00 , $3C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:3C
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $3C , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:37
   .DB $00 , $3D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:3D
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $3C , $15                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:15
   .DB $00 , $17                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:17
   .DB $88                                               ; SET SPRITE X OFFSET = 8 TILES
   .DB $3C , $1D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1D
   .DB $00 , $1F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:1F
   .DB $FF                                               ; END

WAVING_FLAGS_TWO_SPR_TILE_DATA:                                                    ; WAVING FLAGS 2 TILES
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $3C , $1E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1E
   .DB $00 , $31                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:31
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $3C , $34                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:34
   .DB $00 , $35                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:35
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3C , $36                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:36
   .DB $00 , $3C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:3C
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3C , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:37
   .DB $00 , $3D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:3D
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $3C , $15                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:15
   .DB $00 , $17                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:17
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $3C , $1D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1D
   .DB $00 , $1F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:1F
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $3C , $1E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1E
   .DB $00 , $31                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:31
   .DB $88                                               ; SET SPRITE X OFFSET = 8 TILES
   .DB $3C , $34                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:34
   .DB $00 , $35                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:35
   .DB $FF                                               ; END

WAVING_FLAGS_THREE_SPR_TILE_DATA:                                                    ; WAVING FLAGS 3 TILES
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $3C , $36                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:36
   .DB $00 , $3C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:3C
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $3C , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:37
   .DB $00 , $3D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:3D
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3C , $15                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:15
   .DB $00 , $17                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:17
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3C , $1D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1D
   .DB $00 , $1F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:1F
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $3C , $1E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:1E
   .DB $00 , $31                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:31
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $3C , $34                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:34
   .DB $00 , $35                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:35
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $3C , $36                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:36
   .DB $00 , $3C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:3C
   .DB $88                                               ; SET SPRITE X OFFSET = 8 TILES
   .DB $3C , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:37
   .DB $00 , $3D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:3D
   .DB $FF                                               ; END
   
_F}_WAVING_FLAGS_SPR_TILE_DATA    

_F{_QB_PASS_TD_SCENE_SPR_TILE_DATA  


QB_HANDS_IN_AIR_PASS_TD_SPR_TILE_DATA:                                                    ; QB HANDS IN AIR(PASS TD) TILES
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $28 , $80                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $2C , $82                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:82
   .DB $30 , $88                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:88
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $2C , $83                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:83
   .DB $30 , $89                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:89
   .DB $34 , $8B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:8B
   .DB $38 , $A1                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:A1
   .DB $3C , $A3                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:A3
   .DB $00 , $A9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:A9
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $36 , $8E                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:8E
   .DB $3A , $A4                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:A4
   .DB $3C , $81                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $00 , $81                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $06 , $AE                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:AE
   .DB $0A , $A6                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:A6
   .DB $0E , $AC                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:AC
   .DB $12 , $AC                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:AC
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $2C , $87                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:87
   .DB $30 , $8D                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:8D
   .DB $35 , $8F                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:8F
   .DB $39 , $A5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:A5
   .DB $3C , $A7                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:A7
   .DB $00 , $AD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:AD
   .DB $06 , $AF                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:AF
   .DB $0A , $B2                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:B2
   .DB $0E , $B8                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:B8
   .DB $12 , $BA                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:BA
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $28 , $8A                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:8A
   .DB $2C , $A0                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:A0
   .DB $30 , $A2                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:A2
   .DB $35 , $A8                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:A8
   .DB $3A , $AA                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:AA
   .DB $3C , $84                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:84
   .DB $00 , $86                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:86
   .DB $06 , $8C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:8C
   .DB $0A , $B3                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:B3
   .DB $0E , $B9                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:B9
   .DB $12 , $BB                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:BB
   .DB $FF                                               ; END

QB_ARM_COCKED_PASS_TD_SPR_TILE_DATA:                                                    ; QB ARM COCKED (PASS TD) TILES
   .DB $FC , $24                                           ; SET SPR Y OFFSET= 4 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $30 , $90                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:90
   .DB $34 , $92                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:92
   .DB $38 , $98                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:98
   .DB $3C , $9A                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:9A
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $30 , $91                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:91
   .DB $36 , $93                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:93
   .DB $3A , $99                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:99
   .DB $3C , $9B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:9B
   .DB $00 , $B1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:B1
   .DB $04 , $BF                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:BF
   .DB $0A , $BE                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:BE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $36 , $96                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:96
   .DB $39 , $9C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:9C
   .DB $3C , $9E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:9E
   .DB $00 , $81                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $04 , $B6                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:B6
   .DB $0A , $BC                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:BC
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $36 , $97                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:97
   .DB $38 , $9D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:9D
   .DB $3C , $9F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:9F
   .DB $00 , $B5                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:B5
   .DB $04 , $B7                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:B7
   .DB $0A , $BD                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:BD
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $38 , $94                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:94
   .DB $3C , $B4                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:B4
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $38 , $95                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:95
   .DB $FF                                               ; END

QB_PUMP_ARM_ONE_PASS_TD_SPR_TILE_DATA:                                                    ; QB ARM PUMP ANI 1 (PASS TD) TILES
   .DB $FC , $24                                           ; SET SPR Y OFFSET= 4 PIXELS
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3C , $85                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:85
   .DB $00 , $B0                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $38 , $CA                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:CA
   .DB $3C , $E0                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:E0
   .DB $00 , $E2                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:E2
   .DB $04 , $E8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:E8
   .DB $0A , $EA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EA
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $35 , $C2                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:C2
   .DB $3A , $C8                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:C8
   .DB $3C , $81                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $00 , $81                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $04 , $81                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $0A , $EB                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EB
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $30 , $C3                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:C3
   .DB $35 , $C9                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:C9
   .DB $3A , $CB                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:CB
   .DB $3C , $E1                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:E1
   .DB $00 , $E3                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:E3
   .DB $04 , $E9                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:E9
   .DB $0A , $EE                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EE
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $30 , $C6                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:C6
   .DB $34 , $CC                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:CC
   .DB $38 , $CE                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:CE
   .DB $3C , $E4                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:E4
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $34 , $E6                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:E6
   .DB $38 , $EC                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:EC
   .DB $FF                                               ; END

QB_PUMP_ARM_TWO_PASS_TD_SPR_TILE_DATA:                                                    ; QB ARM PUMP ANI 2 (PASS TD) TILES
   .DB $FC , $24                                           ; SET SPR Y OFFSET= 4 PIXELS
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3C , $C0                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:C0
   .DB $00 , $C1                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:C1
   .DB $04 , $C4                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:C4
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3A , $DD                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:DD
   .DB $3C , $D0                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:D0
   .DB $00 , $D2                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:D2
   .DB $04 , $D8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:D8
   .DB $0A , $DA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:DA
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $36 , $C5                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:C5
   .DB $3A , $C7                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:C7
   .DB $3C , $81                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $00 , $81                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $04 , $F4                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:F4
   .DB $0A , $AB                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:AB
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $36 , $CD                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:CD
   .DB $3A , $CF                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:CF
   .DB $3C , $E5                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:E5
   .DB $00 , $E7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:E7
   .DB $04 , $ED                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:ED
   .DB $0A , $EF                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EF
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $38 , $D1                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:D1
   .DB $3C , $D3                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:D3
   .DB $00 , $D9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:D9
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $34 , $D4                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:D4
   .DB $38 , $D6                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:D6
   .DB $3C , $DC                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:DC
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $34 , $D5                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:D5
   .DB $38 , $D7                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:D7
   .DB $FF                                               ; END

QB_PUMP_ARM_THREE_PASS_TD_SPR_TILE_DATA:                                                    ; QB ARM PUMP ANI 3 (PASS TD) TILES
   .DB $FC , $24                                           ; SET SPR Y OFFSET= 4 PIXELS
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3C , $F0                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $00 , $F2                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F2
   .DB $04 , $F8                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:F8
   .DB $08 , $FA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:FA
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3A , $DB                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:DB
   .DB $3C , $F1                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $00 , $F3                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F3
   .DB $04 , $F9                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:F9
   .DB $0A , $FB                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:FB
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3A , $DE                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 2 ,  TILE ID:DE
   .DB $3C , $81                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:81
   .DB $00 , $F6                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F6
   .DB $04 , $FC                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:FC
   .DB $0A , $FE                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:FE
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $38 , $DF                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:DF
   .DB $3C , $F5                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:F5
   .DB $00 , $F7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:F7
   .DB $04 , $FD                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:FD
   .DB $0A , $FF                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:FF
   .DB $FF                                               ; END
   
_F}_QB_PASS_TD_SCENE_SPR_TILE_DATA    

_F{_SCROLLING_STARS_CREDITS_SCENE_SPR_TILE_DATA 

SCROLLING_STARS_ONE_CREDITS_SPR_TILE_DATA:                                                    ; SCROLLING STARS 1(CREDITS) TILES
   .DB $91                                               ; SET SPRITE X OFFSET = -15 TILES
   .DB $27 , $ED                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $04 , $ED                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:ED
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $1B , $ED                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $37 , $ED                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $8B                                               ; SET SPRITE X OFFSET = 11 TILES
   .DB $1F , $ED                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $8F                                               ; SET SPRITE X OFFSET = 15 TILES
   .DB $0C , $ED                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:ED
   .DB $FF                                               ; END

SCROLLING_STARS_TWO_CREDITS_SPR_TILE_DATA:                                                    ; SCROLLING STARS 2(CREDITS) TILES
   .DB $91                                               ; SET SPRITE X OFFSET = -15 TILES
   .DB $26 , $AC                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 2 ,  TILE ID:AC
   .DB $1C , $E8                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 0 ,  TILE ID:E8
   .DB $94                                               ; SET SPRITE X OFFSET = -12 TILES
   .DB $2D , $E8                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 1 ,  TILE ID:E8
   .DB $96                                               ; SET SPRITE X OFFSET = -10 TILES
   .DB $3F , $E8                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $98                                               ; SET SPRITE X OFFSET = -8 TILES
   .DB $09 , $E8                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:E8
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $17 , $E8                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $88                                               ; SET SPRITE X OFFSET = 8 TILES
   .DB $31 , $E8                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:E8
   .DB $8C                                               ; SET SPRITE X OFFSET = 12 TILES
   .DB $08 , $E8                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:E8
   .DB $8F                                               ; SET SPRITE X OFFSET = 15 TILES
   .DB $19 , $E8                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 1 ,  TILE ID:E8
   .DB $FF                                               ; END

SCROLLING_STARS_THREE_CREDITS_SPR_TILE_DATA:                                                    ; SCROLLING STARS 3(CREDITS) TILES
   .DB $91                                               ; SET SPRITE X OFFSET = -15 TILES
   .DB $30 , $E8                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:E8
   .DB $93                                               ; SET SPRITE X OFFSET = -13 TILES
   .DB $09 , $E8                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:E8
   .DB $96                                               ; SET SPRITE X OFFSET = -10 TILES
   .DB $36 , $AC                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:AC
   .DB $97                                               ; SET SPRITE X OFFSET = -9 TILES
   .DB $18 , $AC                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 0 ,  TILE ID:AC
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3B , $AC                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:AC
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $28 , $E8                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:E8
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $36 , $AC                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 2 ,  TILE ID:AC
   .DB $88                                               ; SET SPRITE X OFFSET = 8 TILES
   .DB $1F , $E8                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $8A                                               ; SET SPRITE X OFFSET = 10 TILES
   .DB $02 , $AC                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:AC
   .DB $8C                                               ; SET SPRITE X OFFSET = 12 TILES
   .DB $0D , $E8                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:E8
   .DB $8E                                               ; SET SPRITE X OFFSET = 14 TILES
   .DB $26 , $AC                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 2 ,  TILE ID:AC
   .DB $8F                                               ; SET SPRITE X OFFSET = 15 TILES
   .DB $16 , $AC                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 2 ,  TILE ID:AC
   .DB $FF                                               ; END
   
_F}_SCROLLING_STARS_CREDITS_SCENE_SPR_TILE_DATA   

_F{_LT_WAVE_CREDITS_SCENE_SPR_TILE_DATA 

LT_WAVE_SPR_TILE_DATA:                                   ; LT WAVING (CREDITS) TILES
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $38 , $48                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:48
   .DB $3C , $4A                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:4A
   .DB $06 , $9D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:9D
   .DB $08 , $54                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:54
   .DB $0E , $56                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:56
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $38 , $49                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:49
   .DB $3C , $4B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $00 , $93                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:93
   .DB $06 , $99                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:99
   .DB $0A , $55                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:55
   .DB $0E , $57                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:57
   .DB $FC , $33                                           ; SET SPR X OFFSET= 3 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $1F , $B5                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 3 ,  TILE ID:B5
   .DB $FC , $31                                           ; SET SPR X OFFSET= 1 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $30 , $44                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:44
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $34 , $46                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $38 , $4C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4C
   .DB $3C , $4E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:4E
   .DB $00 , $40                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:40
   .DB $06 , $42                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:42
   .DB $0A , $50                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:50
   .DB $0E , $52                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:52
   .DB $12 , $9B                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:9B
   .DB $17 , $B1                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3 ,  TILE ID:B1
   .DB $FC , $32                                           ; SET SPR X OFFSET= 2 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $1B , $B3                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 3 ,  TILE ID:B3
   .DB $FC , $33                                           ; SET SPR X OFFSET= 3 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $1F , $9F                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 3 ,  TILE ID:9F
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $34 , $47                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:47
   .DB $38 , $4D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4D
   .DB $3C , $4F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $00 , $41                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:41
   .DB $06 , $43                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:43
   .DB $0A , $51                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:51
   .DB $0E , $53                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:53
   .DB $12 , $9E                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 2 ,  TILE ID:9E
   .DB $17 , $B4                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3 ,  TILE ID:B4
   .DB $FC , $2E                                           ; SET SPR Y OFFSET= -2 PIXELS
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $38 , $96                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:96
   .DB $3C , $9C                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:9C
   .DB $FC , $22                                           ; SET SPR Y OFFSET= 2 PIXELS
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $30 , $45                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:45
   .DB $34 , $95                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:95
   .DB $3B , $97                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:97
   JUMP_SPRITE_SCRIPT[ADDR] REST_OF_LT_WAVE_CREDITS_SPR_TILE_DATA 

_F}_LT_WAVE_CREDITS_SCENE_SPR_TILE_DATA    

_F{_TECMO_BUNNY_INTRO_SCENE_SPR_TILE_DATA  

TECMO_BUNNY_SPR_TILE_DATA:                               ; TECMO BUNNY TILES(INTRO)
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $30 , $64                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:64
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $0D , $7D                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:7D
   .DB $0E , $75                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:75
   .DB $FC , $3E                                           ; SET SPR X OFFSET= -2 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $31 , $7C                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $34 , $60                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:60
   .DB $35 , $65                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $38 , $62                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:62
   .DB $39 , $67                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $3C , $68                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:68
   .DB $3D , $6D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $01 , $6F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $0C , $66                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:66
   .DB $0D , $7F                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:7F
   .DB $0E , $77                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:77
   .DB $FC , $3C                                           ; SET SPR X OFFSET= -4 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $00 , $6A                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:6A
   .DB $04 , $58                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:58
   .DB $08 , $5A                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:5A
   .DB $FC , $3A                                           ; SET SPR X OFFSET= -6 PIXELS
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $05 , $5C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:5C
   .DB $09 , $5E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:5E
   .DB $FC , $3E                                           ; SET SPR X OFFSET= -2 PIXELS
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $34 , $61                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:61
   .DB $35 , $70                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:70
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $38 , $63                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:63
   .DB $39 , $72                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:72
   .DB $3C , $69                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:69
   .DB $3D , $78                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:78
   .DB $01 , $7A                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $FC , $3C                                           ; SET SPR X OFFSET= -4 PIXELS
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $00 , $6B                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:6B
   .DB $04 , $59                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:59
   .DB $08 , $5B                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:5B
   .DB $FC , $3A                                           ; SET SPR X OFFSET= -6 PIXELS
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $05 , $5D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:5D
   .DB $09 , $5F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:5F
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $3C , $6C                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:6C
   .DB $3D , $79                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:79
   .DB $3E , $71                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:71
   .DB $01 , $7B                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7B
   .DB $02 , $73                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:73
   .DB $FC , $3C                                           ; SET SPR X OFFSET= -4 PIXELS
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $00 , $6E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:6E
   .DB $FF                                               ; END
   
_F}_TECMO_BUNNY_INTRO_SCENE_SPR_TILE_DATA    

_F{_STADIUM_CONF_CHAMP_SPR_TILE_DATA

STADIUM_CONF_CHAMP_SPR_TILE_DATA:                        ; STADIUM SPRITES CONF CHAMP TILES
   .DB $92                                               ; SET SPRITE X OFFSET = -14 TILES
   .DB $09 , $F8                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:F8
   .DB $0D , $02                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:02
   .DB $11 , $02                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1 ,  TILE ID:02
   .DB $15 , $FC                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 1 ,  TILE ID:FC
   .DB $19 , $FE                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 1 ,  TILE ID:FE
   .DB $1C , $FD                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 0 ,  TILE ID:FD
   .DB $93                                               ; SET SPRITE X OFFSET = -13 TILES
   .DB $09 , $02                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:02
   .DB $0D , $F9                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:F9
   .DB $11 , $FB                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1 ,  TILE ID:FB
   .DB $95                                               ; SET SPRITE X OFFSET = -11 TILES
   .DB $27 , $E8                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $1B , $E9                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 3 ,  TILE ID:E9
   .DB $1F , $EC                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 3 ,  TILE ID:EC
   .DB $97                                               ; SET SPRITE X OFFSET = -9 TILES
   .DB $27 , $E8                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $9A                                               ; SET SPRITE X OFFSET = -6 TILES
   .DB $3B , $ED                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $9B                                               ; SET SPRITE X OFFSET = -5 TILES
   .DB $3B , $ED                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $30 , $F0                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $34 , $F2                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F2
   .DB $1B , $EC                                           ; SET Y OFFSET TO: 6 TILES  USE SPR PAL: 3 ,  TILE ID:EC
   .DB $1F , $E9                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 3 ,  TILE ID:E9
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $27 , $E8                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $30 , $F1                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $34 , $F3                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F3
   .DB $1F , $EC                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 3 ,  TILE ID:EC
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $27 , $E8                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $70 , $F1                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $74 , $F3                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F3
   .DB $17 , $E9                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3 ,  TILE ID:E9
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $70 , $F0                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $74 , $F2                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F2
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $1F , $EC                                           ; SET Y OFFSET TO: 7 TILES  USE SPR PAL: 3 ,  TILE ID:EC
   .DB $85                                               ; SET SPRITE X OFFSET = 5 TILES
   .DB $27 , $E8                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $3B , $F4                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:F4
   .DB $86                                               ; SET SPRITE X OFFSET = 6 TILES
   .DB $3B , $F4                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:F4
   .DB $87                                               ; SET SPRITE X OFFSET = 7 TILES
   .DB $27 , $E8                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $3B , $F5                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:F5
   .DB $88                                               ; SET SPRITE X OFFSET = 8 TILES
   .DB $30 , $F0                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $34 , $F2                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F2
   .DB $89                                               ; SET SPRITE X OFFSET = 9 TILES
   .DB $30 , $F1                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $34 , $F3                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F3
   .DB $8A                                               ; SET SPRITE X OFFSET = 10 TILES
   .DB $17 , $E9                                           ; SET Y OFFSET TO: 5 TILES  USE SPR PAL: 3 ,  TILE ID:E9
   .DB $8C                                               ; SET SPRITE X OFFSET = 12 TILES
   .DB $70 , $F1                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:F1
   .DB $74 , $F3                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F3
   .DB $3B , $ED                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $8D                                               ; SET SPRITE X OFFSET = 13 TILES
   .DB $27 , $E8                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $70 , $F0                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:F0
   .DB $74 , $F2                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:F2
   .DB $3B , $ED                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:ED
   .DB $8E                                               ; SET SPRITE X OFFSET = 14 TILES
   .DB $0A , $EF                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:EF
   .DB $0E , $02                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:02
   .DB $8F                                               ; SET SPRITE X OFFSET = 15 TILES
   .DB $27 , $E8                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 3 ,  TILE ID:E8
   .DB $0A , $FA                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:FA
   .DB $0E , $02                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:02
   .DB $FF                                               ; END

_F}_STADIUM_CONF_CHAMP_SPR_TILE_DATA   

_F{_BOMJACK_RUN_DANCE_FLY_SPR_TILE_DATA   

BOMJACK_RUN_ONE_SPR_TILE_DATA:                           ; BOMJACK RUN ANI 1 TILES 
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $B9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:B9
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $BB                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:BB
   .DB $FF                                               ; END

BOMJACK_RUN_TWO_SPR_TILE_DATA:                           ; BOMJACK RUN ANI 2 TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $BD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:BD
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $BF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:BF
   .DB $FF                                               ; END

BOMJACK_STANDING_STILL_SPR_TILE_DATA:                    ; BOMJACK STOPPED TILES 
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $43 , $F7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F7
   JUMP_SPRITE_SCRIPT[ADDR] BOMJACK_STOPPED_OTHER_HALF_SPR_TILE_DATA                                       

BOMJACK_LOOKING_UP_SPR_TILE_DATA:                                                    ; BOMJACK LOOKING UP TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $FB                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FB
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $43 , $FB                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FB
   .DB $FF                                               ; END

BOMJACK_DANCE_SPR_TILE_DATA:                                                    ; BOMJACK DANCE 1 TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $FD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FD
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $FF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:FF
   .DB $FF                                               ; END

BOMJACK_DROP_FROM_SKY_SPR_TILE_DATA:                                                    ; BOMJACK DROP DOWN FROM SKY TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $AB                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:AB
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $43 , $AB                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:AB
   .DB $FF                                               ; END

BOMJACK_FLY_ACROSS_SKY_SPR_TILE_DATA:                                                    ; BOMJACK FLYING ACROSS SKY TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $AD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:AD
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $AF                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:AF
   .DB $FF                                               ; END
  
_F}_BOMJACK_RUN_DANCE_FLY_SPR_TILE_DATA     

_F{_CONF_CHAMP_BULBS_SPR_TILE_DATA  

CONF_CHAMP_BULBS_SPR_TILE_DATA:                                                    ; CONFERNCE CHAMP FLASHBULBS TILES
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $E6                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E6
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3F , $E5                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:E5
   .DB $03 , $E7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:E7
   .DB $FF                                               ; END
   
_F}_CONF_CHAMP_BULBS_SPR_TILE_DATA   

_F{_BOMJACK_GROW_SPR_TILE_DATA  

BOMJACK_LARGE_LOOKING_UP_SPR_TILE_DATA:                  ; BOMJACK LOOKING UP SIZE 1
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3F , $69                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:69
   .DB $03 , $6D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:6D
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3F , $6B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:6B
   .DB $03 , $6F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:6F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $7F , $6B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:6B
   .DB $43 , $6F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:6F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $7F , $69                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:69
   .DB $43 , $6D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:6D
   .DB $FF                                               ; END

BOMJACK_LARGEST_LOOKING_UP_SPR_TILE_DATA:                                                    ; BOMJACK LOOKING UP SIZE 2
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3F , $79                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:79
   .DB $03 , $7D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:7D
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3F , $7B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:7B
   .DB $03 , $7F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:7F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $7F , $7B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:7B
   .DB $43 , $7F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:7F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $7F , $79                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:79
   .DB $43 , $7D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:7D
   .DB $FF                                               ; END

BOMJACK_LARGEST_LOOKING_FORWARD_SPR_TILE_DATA:                                                    ; SIZE 2 BOMJACK NORMAL TILES
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $3F , $35                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:35
   .DB $03 , $3D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:3D
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $3F , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:37
   .DB $03 , $3F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:3F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $7F , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:37
   .DB $43 , $3F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:3F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $7F , $35                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:35
   .DB $43 , $3D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:3D
   .DB $FF                                               ; END

_F}_BOMJACK_GROW_SPR_TILE_DATA    

_F{_BOMJACK_SHRINK_FLY_SPR_TILE_DATA    

BOMJACK_FLYING_SMALLER_SPR_TILE_DATA:                                                    ; BOMJACK FLYING SMALL
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $63                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:63
   .DB $FF                                               ; END

BOMJACK_FLYING_SMALLEST_SPR_TILE_DATA:                                                    ; BOMJACK FLYING SMALLEST
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $03 , $1F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:1F

   .DB $FF                                               ; END
   
_F}_BOMJACK_SHRINK_FLY_SPR_TILE_DATA       

_F{_BOMJACK_WAVE_SPR_TILE_DATA   

BOMJACK_WAVE_ONE_SPR_TILE_DATA:                          ; BOMJACK HAND IN AIR WAVE TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $43 , $F5                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F5
   JUMP_SPRITE_SCRIPT[ADDR] BOMJACK_STOPPED_OTHER_HALF_SPR_TILE_DATA   

BOMJACK_WAVE_TWO_SPR_TILE_DATA:                          ; BOMJACK HAND DOWN WAVE TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $43 , $A9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:A9
   JUMP_SPRITE_SCRIPT[ADDR] BOMJACK_STOPPED_OTHER_HALF_SPR_TILE_DATA 

_F}_BOMJACK_WAVE_SPR_TILE_DATA    

_F{_PLAYERS_RUNNING_COIN_TOSS_SPR_TILE_DATA   

P2_RUNNING_COIN_TOSS_SPR_TILE_DATA:                                                    ; PLAYER 2 RUNNING (COIN TOSS) TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3E , $00                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:00
   .DB $02 , $01                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:01
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3E , $02                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:02
   .DB $02 , $03                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:03
   .DB $FF                                               ; END

P1_RUNNING_COIN_TOSS_SPR_TILE_DATA:                                                    ; PLAYER RUNNING
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $7C , $02                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:02
   .DB $40 , $03                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:03
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $7C , $00                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:00
   .DB $40 , $01                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:01
   .DB $FF                                               ; END
   
_F}_PLAYERS_RUNNING_COIN_TOSS_SPR_TILE_DATA    

_F{_NURSE_WAVING_SPR_TILE_DATA  

NURSE_WAVE_ONE_SPR_TILE_DATA:                            ; NURSES WAVING 1 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3D , $7C                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $8C                                               ; SET SPRITE X OFFSET = 12 TILES
   .DB $3D , $77                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:77
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $FC , $34                                           ; SET SPR X OFFSET= 4 PIXELS
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3D , $77                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:77
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $8D                                               ; SET SPRITE X OFFSET = 13 TILES
   .DB $3D , $7C                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $FF                                               ; END
   
NURSE_WAVE_TWO_SPR_TILE_DATA:                            ; NURSES WAVING 2 TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3D , $77                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:77
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $8C                                               ; SET SPRITE X OFFSET = 12 TILES
   .DB $3D , $7C                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $FC , $34                                           ; SET SPR X OFFSET= 4 PIXELS
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3D , $7C                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $8D                                               ; SET SPRITE X OFFSET = 13 TILES
   .DB $3D , $77                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:77
   .DB $01 , $7E                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $FF                                               ; END

_F}_NURSE_WAVING_SPR_TILE_DATA    

_F{_QB_SACKED_BY_LT_INTRO_SPR_TILE_DATA    

QB_SACKED_BY_LT_SPR_TILE_DATA:                           ; QB GETTING SACKED BY LT(INTRO) TILES  
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3C , $14                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:14
   .DB $01 , $15                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:15
   .DB $05 , $1C                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:1C
   .DB $0C , $1D                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:1D
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $38 , $00                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:00
   .DB $3C , $02                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:02
   .DB $00 , $08                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:08
   .DB $05 , $0A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:0A
   .DB $0A , $20                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:20
   .DB $0C , $22                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:22
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $39 , $01                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:01
   .DB $3C , $03                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:03
   .DB $00 , $09                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:09
   .DB $04 , $0B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:0B
   .DB $0A , $21                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:21
   .DB $0E , $23                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 2 ,  TILE ID:23
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $37 , $32                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:32
   .DB $3B , $04                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:04
   .DB $3F , $06                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:06
   .DB $02 , $0C                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:0C
   .DB $04 , $0E                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:0E
   .DB $09 , $24                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:24
   .DB $0D , $26                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:26
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $37 , $34                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:34
   .DB $3B , $05                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:05
   .DB $3F , $07                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:07
   .DB $02 , $0D                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:0D
   .DB $04 , $0F                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:0F
   .DB $09 , $25                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:25
   .DB $0D , $27                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 1 ,  TILE ID:27
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $38 , $10                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:10
   .DB $3C , $12                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:12
   .DB $00 , $18                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:18
   .DB $05 , $1A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:1A
   .DB $09 , $30                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:30
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $38 , $11                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:11
   .DB $3C , $13                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:13
   .DB $00 , $19                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:19
   .DB $05 , $1B                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:1B
   .DB $08 , $31                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:31
   .DB $0C , $33                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:33
   .DB $84                                               ; SET SPRITE X OFFSET = 4 TILES
   .DB $0C , $35                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:35
   .DB $FF                                               ; END
   
_F}_QB_SACKED_BY_LT_INTRO_SPR_TILE_DATA    

_F{_BLANK_TILES_FOR_FG_GOOD_SPR_TILE_DATA  

BLANK_TILES_FOR_FG_GOOD_SPR_TILE_DATA:                    ; BLANK TILES FOR FG GOOD *** TO PREVENT GLITCHING? 
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3C , $80                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $3C , $80                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $00 , $80                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $00 , $80                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3C , $80                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $3C , $80                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $00 , $80                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $00 , $80                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $3C , $80                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $3C , $80                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $00 , $80                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $00 , $80                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $3C , $80                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $3C , $80                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $00 , $80                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $00 , $80                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:80
   .DB $FF                                               ; END
   
_F}_BLANK_TILES_FOR_FG_GOOD_SPR_TILE_DATA     

_F{_BODY_OF_QB_ARM_IN_AIR_CREDITS_SPR_TILE_DATA 

BODY_OF_QB_ARM_IN_AIR_CREDITS_SPR_TILE_DATA:                                                    ; PLAYER ARM IN AIR BODY (CREDITS) TILES
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $00 , $A8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:A8
   .DB $04 , $AA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:AA
   .DB $08 , $B6                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:B6
   .DB $0C , $B3                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:B3
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $F2                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F2
   .DB $00 , $A9                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:A9
   .DB $04 , $B0                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $08 , $B0                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $0C , $B0                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $10 , $B0                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3B , $DF                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:DF
   .DB $39 , $53                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:53
   .DB $3F , $F1                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:F1
   .DB $3D , $59                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:59
   .DB $03 , $F3                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F3
   .DB $01 , $AC                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:AC
   .DB $07 , $F9                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:F9
   .DB $04 , $AE                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:AE
   .DB $08 , $B7                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:B7
   .DB $0C , $B0                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $10 , $B0                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $39 , $56                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:56
   .DB $3F , $F4                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:F4
   .DB $3D , $5C                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5C
   .DB $03 , $F6                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F6
   .DB $01 , $AD                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:AD
   .DB $07 , $FC                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 3 ,  TILE ID:FC
   .DB $04 , $AF                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:AF
   .DB $0B , $F0                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:F0
   .DB $08 , $B0                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $0C , $B0                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $10 , $B0                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $39 , $57                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:57
   .DB $3D , $5D                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5D
   .DB $01 , $B8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:B8
   .DB $04 , $BA                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:BA
   .DB $08 , $B0                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $0C , $B0                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:B0
   .DB $10 , $B1                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0 ,  TILE ID:B1
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $04 , $BB                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:BB
   .DB $08 , $AB                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:AB
   .DB $0C , $B5                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:B5
   .DB $10 , $B4                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0 ,  TILE ID:B4
   .DB $FF                                               ; END
   
_F}_BODY_OF_QB_ARM_IN_AIR_CREDITS_SPR_TILE_DATA    

_F{_BOTTOM_UPRIGHT_SPR_TILE_DATA

BOTTOM_UPRIGHT_SPR_TILE_DATA:                                                    ; P1 RIGHT UPRIGHT TILES
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $08 , $49                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:49
   .DB $0C , $4B                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $24 , $42                                           ; SET Y OFFSET TO: -7 TILES  USE SPR PAL: 0 ,  TILE ID:42
   .DB $28 , $46                                           ; SET Y OFFSET TO: -6 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $2C , $46                                           ; SET Y OFFSET TO: -5 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $30 , $46                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $34 , $46                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $38 , $46                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $3C , $46                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $00 , $46                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $04 , $46                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:46
   .DB $08 , $4C                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 0 ,  TILE ID:4C
   .DB $0C , $4E                                           ; SET Y OFFSET TO: 3 TILES  USE SPR PAL: 0 ,  TILE ID:4E
   .DB $11 , $43                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1 ,  TILE ID:43
   .DB $10 , $47                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 0 ,  TILE ID:47
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $11 , $45                                           ; SET Y OFFSET TO: 4 TILES  USE SPR PAL: 1 ,  TILE ID:45
   .DB $FF                                               ; END

_F}_BOTTOM_UPRIGHT_SPR_TILE_DATA   

_F{_REF_BODY_DOWN_SIGNAL_SPR_TILE_DATA  

REF_BODY_DOWN_SIGNAL_SPR_TILE_DATA:                      ; REF BODY FOR DOWN SIGNALS
   .DB $9C                                               ; SET SPRITE X OFFSET = -4 TILES
   .DB $31 , $70                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:70
   .DB $35 , $72                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 1 ,  TILE ID:72
   .DB $39 , $78                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:78
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $39 , $79                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:79
   .DB $3D , $7B                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7B
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $39 , $7C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:7C
   .DB $3D , $7E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:7E
   .DB $01 , $7F                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:7F
   .DB $05 , $7A                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:7A
   .DB $09 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $31 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $34 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $38 , $7D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:7D
   .DB $3D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $01 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $05 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $09 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $71 , $49                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 1 ,  TILE ID:49
   .DB $74 , $4B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:4B
   .DB $78 , $4F                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:4F
   .DB $7D , $65                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:65
   .DB $41 , $67                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:67
   .DB $45 , $6D                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 1 ,  TILE ID:6D
   .DB $49 , $6F                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6F
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $79 , $5D                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:5D
   .DB $7D , $5F                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5F
   .DB $41 , $75                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:75
   .DB $44 , $77                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:77
   .DB $49 , $6E                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 1 ,  TILE ID:6E
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $79 , $5C                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 1 ,  TILE ID:5C
   .DB $7D , $5E                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:5E
   .DB $41 , $74                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:74
   .DB $44 , $76                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 0 ,  TILE ID:76
   .DB $83                                               ; SET SPRITE X OFFSET = 3 TILES
   .DB $7D , $71                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:71
   .DB $41 , $73                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 1 ,  TILE ID:73
   .DB $FF                                               ; END
 
_F}_REF_BODY_DOWN_SIGNAL_SPR_TILE_DATA   

_F{_REST_OF_LT_WAVE_CREDITS_SPR_TILE_DATA

REST_OF_LT_WAVE_CREDITS_SPR_TILE_DATA:                                                    ; REST OF LT WAVING TILES (CREDITS)
   .DB $FC , $20                                           ; SET SPR Y OFFSET= 0 PIXELS
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3B , $B6                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:B6
   .DB $0B , $B7                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 3 ,  TILE ID:B7
   .DB $FC , $22                                           ; SET SPR Y OFFSET= 2 PIXELS
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $03 , $A8                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:A8
   .DB $FC , $20                                           ; SET SPR Y OFFSET= 0 PIXELS
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $37 , $B6                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 3 ,  TILE ID:B6
   .DB $3F , $03                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:03
   .DB $03 , $03                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:03
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $3F , $03                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 3 ,  TILE ID:03
   .DB $03 , $03                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:03
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $3B , $B7                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:B7
   .DB $FF                                               ; END
   
_F}_REST_OF_LT_WAVE_CREDITS_SPR_TILE_DATA   

_F{_BARRY_LEADING_RUSHER_ALL_BUT_FEET_SPR_TILE_DATA

BARRY_ALL_BUT_FEET_SPR_TILE_DATA:                          ; LEADING RUSHER/BARRY SANDERS EVERYTHING BUT FEET TILES
   .DB $FC , $32                                           ; SET SPR X OFFSET= 2 PIXELS
   .DB $FC , $22                                           ; SET SPR Y OFFSET= 2 PIXELS
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $3B , $08                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 3 ,  TILE ID:08
   .DB $FC , $30                                           ; SET SPR X OFFSET= 0 PIXELS
   .DB $FC , $20                                           ; SET SPR Y OFFSET= 0 PIXELS
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $02 , $00                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:00
   .DB $06 , $02                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:02
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $02 , $01                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:01
   .DB $06 , $03                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:03
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $02 , $04                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:04
   .DB $06 , $06                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:06
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $02 , $05                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:05
   .DB $06 , $07                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:07
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $02 , $10                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 2 ,  TILE ID:10
   .DB $06 , $12                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:12
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $06 , $13                                           ; SET Y OFFSET TO: 1 TILES  USE SPR PAL: 2 ,  TILE ID:13
   .DB $FC , $3E                                           ; SET SPR X OFFSET= -2 PIXELS
   .DB $9D                                               ; SET SPRITE X OFFSET = -3 TILES
   .DB $34 , $1A                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:1A
   .DB $38 , $30                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:30
   .DB $3C , $32                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:32
   .DB $9E                                               ; SET SPRITE X OFFSET = -2 TILES
   .DB $30 , $19                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 0 ,  TILE ID:19
   .DB $34 , $1B                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:1B
   .DB $38 , $31                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:31
   .DB $3C , $33                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:33
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $32 , $1C                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:1C
   .DB $34 , $1E                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:1E
   .DB $38 , $34                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:34
   .DB $3E , $36                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 2 ,  TILE ID:36
   .DB $80                                               ; SET SPRITE X OFFSET = 0 TILES
   .DB $32 , $1D                                           ; SET Y OFFSET TO: -4 TILES  USE SPR PAL: 2 ,  TILE ID:1D
   .DB $34 , $1F                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:1F
   .DB $38 , $35                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:35
   .DB $3D , $37                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 1 ,  TILE ID:37
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $34 , $0F                                           ; SET Y OFFSET TO: -3 TILES  USE SPR PAL: 0 ,  TILE ID:0F
   .DB $38 , $25                                           ; SET Y OFFSET TO: -2 TILES  USE SPR PAL: 0 ,  TILE ID:25
   .DB $3C , $27                                           ; SET Y OFFSET TO: -1 TILES  USE SPR PAL: 0 ,  TILE ID:27
   .DB $FC , $32                                           ; SET SPR X OFFSET= 2 PIXELS
   .DB $81                                               ; SET SPRITE X OFFSET = 1 TILES
   .DB $0A , $0D                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:0D
   .DB $82                                               ; SET SPRITE X OFFSET = 2 TILES
   .DB $0A , $18                                           ; SET Y OFFSET TO: 2 TILES  USE SPR PAL: 2 ,  TILE ID:18
   .DB $FF                                               ; END
   
_F}_BARRY_LEADING_RUSHER_ALL_BUT_FEET_SPR_TILE_DATA  

_F{_BOMJACK_STOPPED_OTHER_HALF_SPR_TILE_DATA

BOMJACK_STOPPED_OTHER_HALF_SPR_TILE_DATA:                                                    ; REST OF BOMJACK STANDING STILL
   .DB $9F                                               ; SET SPRITE X OFFSET = -1 TILES
   .DB $03 , $F7                                           ; SET Y OFFSET TO: 0 TILES  USE SPR PAL: 3 ,  TILE ID:F7
   .DB $FF                                                ;
   
_F}_BOMJACK_STOPPED_OTHER_HALF_SPR_TILE_DATA   

 .PAD $C000, $FF