
_F{_SET_GAME_STATUS_MACROS

;GAME STATUS		
;Bit 7= players on field 0=no, 1=yes
;Bit 6= vertical/horizontal mirroring (0= vertical, 1= horizontal)
;Bit 5= cutscene side/horizontal flip 0=p1, 1=p2= true
;Bit 4= got first half kickoff 0= p1, 1=p2 
;Bit 3= quarter over 0=no 1= yes
;Bit 2= 
;Bit 1 = set = season
;Bit 0 = set = pro bowl 






.MACRO SET_GAME_STATUS_PLAYERS_ON_FIELD[]
    LDA GAME_STATUS 		                                        
	ORA #%10000000			            ; hex $80				                            
	STA GAME_STATUS 
.ENDM 

.MACRO SET_GAME_STATUS_P1_SIDE_CUTSCENE[]
    LDA GAME_STATUS 		                                        
	AND #%11011111			            ; hex $DF				                            
	STA GAME_STATUS 
.ENDM 

.MACRO SET_GAME_STATUS_P2_SIDE_CUTSCENE[]
    LDA GAME_STATUS 		                                        
	ORA #%00100000			            ; hex $20				                            
	STA GAME_STATUS 
.ENDM 


.MACRO SET_GAME_STATUS_P2_GOT_OPENING_KICKOFF[]
    LDA GAME_STATUS 		                                        
	ORA #%00010000			            ; hex $10				                            
	STA GAME_STATUS 
.ENDM 

.MACRO SET_GAME_STATUS_P1_GOT_OPENING_KICKOFF[]
    LDA GAME_STATUS 		                                        
	AND #%11101111			            ; hex $EF				                            
	STA GAME_STATUS 
.ENDM 

.MACRO SET_GAME_STATUS_QTR_OVER[]
    LDA GAME_STATUS  		                                        
	ORA #%00001000			            ; hex $08				                            
	STA GAME_STATUS  
.ENDM 

.MACRO SET_GAME_STATUS_QTR_NOT_OVER[]
    LDA GAME_STATUS  		                                        
	AND #%11110111			            ; hex $F7				                            
	STA GAME_STATUS  
.ENDM 


.MACRO SET_GAME_STATUS_PLAYOFF_MODE[]
    LDA GAME_STATUS                                                                                         
	ORA #%00000011                                              
	STA GAME_STATUS                                              
.ENDM 

.MACRO SET_GAME_STATUS_SEASON_MODE[]
    LDA GAME_STATUS                                             
	AND #%11111100                                             
	ORA #%00000010                                              
	STA GAME_STATUS                                              
.ENDM 

.MACRO SET_GAME_STATUS_PRO_BOWL_MODE[]
    LDA GAME_STATUS                                             
	AND #%11111100                                             
	ORA #%00000001                                              
	STA GAME_STATUS                                              
.ENDM 

.MACRO SET_GAME_STATUS_PRE_SEASON_MODE[]
    LDA GAME_STATUS                                             
	AND #%11111100                                                                                          
	STA GAME_STATUS                                              
.ENDM

_F}_SET_GAME_STATUS_MACROS

_F{_SET_CLOCK_STATUS_MACROS


;;;		CLOCK				;;;

; CLOCK CONOUNTDOWN TYPES
RUNNING 			= $80 				; FULL SPEED
PLAY_SELECT 		= $40 				; SLOWER
PUNT_CLOCK 			= $20				; SLOWEST
STOPPED 			= $00 


.MACRO SET_CLOCK_TO_RUNNING
	LDA #RUNNING						                               
	STA CLOCK_RUN_TYPE 
.ENDM 

.MACRO SET_CLOCK_TO_PLAY_SELECT
	LDA CLOCK_RUN_TYPE						                               
	ORA #PLAY_SELECT
	STA CLOCK_RUN_TYPE
.ENDM 

.MACRO SET_CLOCK_SPEED_TO_PUNT[]
	LDA CLOCK_RUN_TYPE						                               
	ORA #PUNT_CLOCK
	STA CLOCK_RUN_TYPE
.ENDM 

.MACRO SET_CLOCK_TO_STOPPED
	LDA #STOPPED						                               
	STA CLOCK_RUN_TYPE 
.ENDM 

.MACRO CLEAR_CLOCK_SPEED_PUNT
    LDA CLOCK_RUN_TYPE		                                        
	AND #%11011111			; hex $DF				                            
	STA CLOCK_RUN_TYPE
.ENDM 


_F}_SET_CLOCK_STATUS_MACROS

_F{_SET_POSESSION_STATUS_MACROS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;POSESSION STATUS
;BIT 7= SET = LAST HAD BALL      			= 0x80 ns = p1,      set= p2
;BIT 6= SET = HAS BALL	 		         	= 0x40 ns = p1,      set= p2	
;BIT 5= SET = QB_HAS_BALL         	        = 0x20 ns = false	   set= true
;BIT 4= SET = FG_ATT  				     	= 0x10 ns = false	   set= true
;BIT 3= SET = KICK	 			        	= 0x08 ns = false	   set= true
;BIT 2= SET = SPECIAL	 			      	= 0x04 (SET WITH KICK =PUNT, SET WITH FG= XP, SET ON PASS PLAY)
;BIT 1=      = PALLETE TO USE	 	      	= 0x02 ns = p1,      set= p2
;BIT 0=      = JOYPAD INDEX    	 	   		= 0x01 ns = p1,      set= p2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


FG_XP_ATT_BITMASK								= $10
FG_XP_PUNT_BITMASK								= $1C
KICKOFF_BITMASK									= $08

.MACRO SET_POSSESSION_STATUS_P1_HAS_BALL
   LDA POSSESSION_STATUS 		                                        
	AND #%10111111			            ; hex $BF				                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO SET_POSSESSION_STATUS_P2_HAS_BALL
   LDA POSSESSION_STATUS 		                                        
	ORA #%01000000			            ; hex $40				                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO SET_POSSESSION_STATUS_P1_HAS_BALL_HAD_BALL
   LDA POSSESSION_STATUS 		                                        
	AND #%00111100			            ; hex $3C				                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO SET_POSSESSION_STATUS_P2_HAS_BALL_HAD_BALL
   LDA POSSESSION_STATUS 		                                        
	ORA #%11000011		            ; hex $C3				                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO SET_POSSESSION_STATUS_QB_HAS_BALL[]
   LDA POSSESSION_STATUS 		                                        
	ORA #%00100000			            ; hex $20				                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P1_RUN
   LDA #%00000000	                  ; 	hex $00		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P2_RUN[]
   LDA #%11000011	                  ; 	hex $C3		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P1_NEW_PLAY[]
   LDA #%00000000	                  ; 	hex $00		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P2_NEW_PLAY[]
   LDA #%11000011	                  ; 	hex $C3		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 



.MACRO INIT_POSSESSION_STATUS_P1_PASS[]
   LDA #%00000100	                  ; 	hex $04		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P2_PASS[]
   LDA #%11000111	                  ; 	hex $C7		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P1_PUNT
   LDA #%00001100	                  ; 	hex $0C		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P2_PUNT
   LDA #%11001111	                  ; 	hex $CF		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P1_XP
   LDA #%00010100	                  ; 	hex $14		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P2_XP
   LDA #%11010111	                  ; 	hex $D7		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P1_KICKOFF
   LDA #%10001011	                  ; 	hex $8B		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P2_KICKOFF
   LDA #%01001000	                  ; 	hex $48		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 


.MACRO INIT_POSSESSION_STATUS_P1_FG_ATT
   LDA #%00010000	                  ; 	hex $10		                                        		                            
	STA POSSESSION_STATUS 
.ENDM 

.MACRO INIT_POSSESSION_STATUS_P2_FG_ATT
   LDA #%11010000			            ; 	hex $D0		                            
	STA POSSESSION_STATUS 
.ENDM 

_F}_SET_POSESSION_STATUS_MACROS

_F{_SET_PLAY_STATUS_MACROS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PLAY STATUS set = true

;BIT 7= SET = PLAY OVER      				= 0x80
;BIT 6= SET = MAN_CAN_PASS_BALL			    = 0x40	
;BIT 5= SET = PASS ATTEMPTED				= 0x20	
;BIT 4= SET = TOUCHDOWN     				= 0x10 
;BIT 3= SET = BEHIND LOS          			= 0x08  
;BIT 2= SET = BALL SNAPPED   				= 0x04
;BIT 1= SET = BALL KICKED     				= 0x02 
;BIT 0= SET = SACK      	 				= 0x01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



.MACRO SET_PLAY_STATUS_MAN_CANT_PASS[]
    LDA PLAY_STATUS		                                        
	AND #%10111111			         	; hex $BF				                            
	STA PLAY_STATUS
.ENDM 

 

.MACRO SET_PLAY_STATUS_PLAY_OVER[]
    LDA PLAY_STATUS		                                        
	ORA #%10000000			         	; hex $80				                            
	STA PLAY_STATUS
.ENDM

.MACRO SET_PLAY_STATUS_MAN_CAN_PASS[]
    LDA PLAY_STATUS		                                        
	ORA #%01000000			         	; hex $40				                            
	STA PLAY_STATUS
.ENDM

.MACRO SET_PLAY_STATUS_PASS_ATTEMPTED[]
    LDA PLAY_STATUS		                                        
	ORA #%00100000			         	; hex $20				                            
	STA PLAY_STATUS
.ENDM 

.MACRO SET_PLAY_STATUS_TOUCHDOWN[]
    LDA PLAY_STATUS		                                        
	ORA #%00010000			         	; hex $10				                            
	STA PLAY_STATUS
.ENDM 

.MACRO SET_PLAY_STATUS_PAST_LOS[]
	LDA PLAY_STATUS                             ; SET PLAY STATUS = PAST LOS 
	ORA #%00001000			         	; hex $08
	STA PLAY_STATUS                             ;
.ENDM 

.MACRO SET_PLAY_STATUS_BALL_SNAPPED[]
    LDA PLAY_STATUS		                                        
	ORA #%00000100			         	; hex $04				                            
	STA PLAY_STATUS
.ENDM 

.MACRO SET_PLAY_STATUS_BALL_KICKED[]
    LDA PLAY_STATUS		                                        
	ORA #%00000010			         	; hex $02				                            
	STA PLAY_STATUS
.ENDM 

.MACRO SET_PLAY_STATUS_SACK[]
    LDA PLAY_STATUS		                                        
	ORA #%00000001			         	; hex $01				                            
	STA PLAY_STATUS
.ENDM 

_F}_SET_PLAY_STATUS_MACROS

_F{_SET_BALL_STATUS_MACROS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;BIT 7= SET = BALL INTERCEPTED     	= 0x80
;BIT 6= SET = BALL DEFLECTED       	= 0x40		
;BIT 5= SET = BALL CAUGHT	        = 0x20
;BIT 4= SET = BALL FUMBLED          = 0x10
;BIT 3= SET = BALL RECOVERED       	= 0x08 (SET AFTER KICK/FUM RECOVERY/PASS BLOCK
;BIT 2= SET = WHO TOUCHED BALL LAST	= 0x04 (NOT SET=P1, SET = P2)
;BIT 1= SET = XP/FG GOOD		 	= 0x02
;BIT 0= SET = ONSIDES KICK			= 0x01
;;;		BALL_STATUS				;;;;;;;;;;;

BALL_INTERCEPTED_BITFLAG     	= $80
BALL_DEFLECTED_BITFLAG        	= $40		
BALL_CAUGHT_BITFLAG 	        = $20
BALL_FUMBLED_BITFLAG            = $10

.MACRO SET_BALL_INTERCEPTED[]
    LDA BALL_STATUS		                                        
	ORA #%10000000			         ; hex $80				                            
	STA BALL_STATUS
.ENDM 

.MACRO SET_BALL_DEFLECTED[]
    LDA BALL_STATUS		                                        
	ORA #%01000000			         ; hex $40				                            
	STA BALL_STATUS
.ENDM 

.MACRO SET_BALL_BLOCKED[]
    LDA BALL_STATUS		                                        
	ORA #%01000000			         ; hex $40				                            
	STA BALL_STATUS
.ENDM 


.MACRO SET_BALL_FUMBLED[]
    LDA BALL_STATUS		                                        
	ORA #%00010000			         ; hex $10				                            
	STA BALL_STATUS
.ENDM 

.MACRO SET_BALL_NOT_FUMBLED
   LDA BALL_STATUS		                                        
	AND #%11100011			         ; hex $E3				                            
	STA BALL_STATUS
.ENDM 

.MACRO SET_BALL_CAUGHT
    LDA BALL_STATUS		                                        
	ORA #%00100000			        ; hex $20				                            
	STA BALL_STATUS
.ENDM 


.MACRO SET_BALL_STATUS_ONSIDES_KICK
    LDA BALL_STATUS		                                        
	ORA #%00000001			        ; hex $01				                            
	STA BALL_STATUS
.ENDM 

_F}_SET_BALL_STATUS_MACROS

_F{_SET_BALL_STATUS_SPECIAL_MACROS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  BALL_STATUS SPECIAL	


BALL_OOB_BITFLAG					    = $80
BALL_SAFETY_BITFLAG					    = $40
BALL_RECOVERED_BITFLAG					= $20
BALL_TOUCHBACK_BITFLAG					= $10
BALL_SHOTGUN_SNAP_BITFLAG				= $08
BALL_ONSIDES_BITFLAG					= $04

.MACRO SET_BALL_STATUS_SPECIAL_BALL_SNAP_TOSS_DONE[]
    LDA BALL_STATUS_SPECIAL		                                        
	AND #%11110111			         ; hex $F7			                            
	STA BALL_STATUS_SPECIAL
.ENDM 



.MACRO SET_BALL_STATUS_SPECIAL_BALL_OOB[]
    LDA BALL_STATUS_SPECIAL		                                        
	ORA #%10000000			         ; hex $80			                            
	STA BALL_STATUS_SPECIAL
.ENDM 


.MACRO SET_BALL_STATUS_SPECIAL_SAFETY[]
    LDA BALL_STATUS_SPECIAL		                                        
	ORA #%01000000			         ; hex $40			                            
	STA BALL_STATUS_SPECIAL
.ENDM 

.MACRO SET_BALL_STATUS_SPECIAL_BALL_RECOVERED[]
    LDA BALL_STATUS_SPECIAL		                                        
	ORA #%00100000			         ; hex $20			                            
	STA BALL_STATUS_SPECIAL
.ENDM


.MACRO SET_BALL_STATUS_SPECIAL_TOUCHBACK[]
    LDA BALL_STATUS_SPECIAL	                                        
	ORA #%00010000			         ; hex $10			                            
	STA BALL_STATUS_SPECIAL
.ENDM 

.MACRO SET_BALL_STATUS_SPECIAL_SHOTGUN_SNAP
    LDA BALL_STATUS_SPECIAL		                                        
	ORA #%00001000			         ; hex $08			                            
	STA BALL_STATUS_SPECIAL
.ENDM 

.MACRO SET_BALL_STATUS_SPECIAL_PITCH_IN_PROGRESS
    LDA BALL_STATUS_SPECIAL		                                        
	ORA #%00001000			         ; hex $08			                            
	STA BALL_STATUS_SPECIAL
.ENDM 

.MACRO SET_BALL_STATUS_SPECIAL_SNAP_DONE
    LDA BALL_STATUS_SPECIAL		                                        
	AND #%11110111			         ; hex $F7		                            
	STA BALL_STATUS_SPECIAL
.ENDM


.MACRO SET_BALL_STATUS_SPECIAL_ONSIDES_KICK
    LDA BALL_STATUS_SPECIAL		                                        
	ORA #%00000100			         ; hex $04			                            
	STA BALL_STATUS_SPECIAL
.ENDM 

_F}_SET_BALL_STATUS_SPECIAL_MACROS

_F{_SET_BALL_COLLISION_STATUS_MACROS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BALL COLLISON 0x8E
;Bit 7= ball moving in air   		= 0x80
;Bit 6= ball collided  				= 0x40 
;Bit 5= ball moving up z  			= 0x20 1=no, 0=yes (for pitches, passes) 0x20
;Bit 4= ball leaving hand  			= 0x10 (for pass or pitch) 
;Bit 3=
;Bit 2= update screen scroll    	= 0x04 
;Bit 1= do collision ani            = 0x02 = (for fumbles, tips, ball, hits ground) 
;Bit 0= do backwards ball rotation	= 0x01 = ball rotates backwards (punt/kick)

BALL_MOVING_BITFLAG					= $80
BALL_COLLIDED_BITFLAG				= $40
BALL_MOVING_UP_Z_BITFLAG			= $20
BALL_LEAVING_HAND_BITFLAG			= $10


BALL_UPDATE_SCROLL_BITFLAG			= $04
BALL_DO_COLL_ANI_BITFLAG			= $02
BALL_BACKWARDS_ROT_BITFLAG			= $01

.MACRO SET_BALL_COLLISION_NOT_MOVING
    LDA BALL_COLLISION		                                        
	AND #%01111111			         ; hex $7F			                            
	STA BALL_COLLISION
.ENDM

.MACRO SET_BALL_COLLISION_BALL_COMING_DOWN[]
    LDA BALL_COLLISION		                                        
	ORA #%00100000			         ; hex $20			                            
	STA BALL_COLLISION
.ENDM 

.MACRO SET_BALL_COLLISION_BALL_COLLIDED_DO_COLLIDED_ANI[]
    LDA BALL_COLLISION		                                        
	ORA #%01000010			         ; hex $42			                            
	STA BALL_COLLISION
.ENDM 


.MACRO SET_BALL_COLLISION_NOT_MOVING_LEAVING_HAND[]
    LDA BALL_COLLISION		                                        
	AND #%01101111			         ; hex $6F			                            
	STA BALL_COLLISION
.ENDM 

.MACRO SET_BALL_COLLISION_BALL_DONT_DO_BALL_COLLISON_OR_BACKWARDS_ROT[]
    LDA BALL_COLLISION		                                        
	AND #%11111100			         ; hex $FB			                            
	STA BALL_COLLISION
.ENDM 

_F}_SET_BALL_COLLISION_STATUS_MACROS

_F{_SET_PLAYER_COLLISION_STATUS_MACROS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.MACRO SET_COLLIDE_BITMASK_ALL_PLAYERS
	LDY #$E0                                               ; SET BITMASK = CAN COLLIDE WITH ALL PLAYERS BITMASK
	LDX #$FF                                               ;
.ENDM 

.MACRO SET_COLLIDE_BITMASK_ALL_BUT_SKILL_PLAYERS
	LDY #$E0                                               ; SET BITMASK = CAN COLLIDE WITH ALL PLAYERS BITMASK
	LDX #$83                                               ;
.ENDM 

_F}_SET_PLAYER_COLLISION_STATUS_MACROS
