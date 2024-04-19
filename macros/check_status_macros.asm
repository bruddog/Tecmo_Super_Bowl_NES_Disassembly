_F{_CHECK_GAME_STATUS_MACROS

.MACRO IF_GAME_STATUS_END_OF_QTR[ADDR] ADDR
   LDA GAME_STATUS                        
   AND #$08                                  
   BNE ADDR       							
 .ENDM  

 .MACRO IF_GAME_STATUS_NOT_SEASON[ADDR] ADDR
   LDA GAME_STATUS                        
   AND #$03                                  
   CMP #$02 
   BCC ADDR   
 .ENDM  
 
.MACRO IF_GAME_STATUS_NOT_PLAYOFFS[ADDR] ADDR
   LDA GAME_STATUS                        
   AND #$03                                  
   CMP #$03 
   BNE ADDR   
 .ENDM 
 
 .MACRO IF_GAME_STATUS_P1_SCENE_SIDE[ADDR] ADDR
   LDA GAME_STATUS                        
   AND #$20                                  
   BEQ ADDR   
 .ENDM 
 
 _F}_CHECK_GAME_STATUS_MACROS
 
_F{_CHECK_OVERTIME_MACROS
 
 .MACRO IF_QTR_NOT_OVERTIME[ADDR] ADDR
   LDA QUARTER                                 ; IS QUARTER = OVERTIME?
   CMP #$04                                    ;        	
   BCC ADDR  
 .ENDM  

_F}_CHECK_OVERTIME_MACROS

_F{_CHECK_POSSESION_STATUS_MACROS


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

KICKOFF_BITMASK		= $08
PUNT_BITMASK		= $0C
FG_BITMASK			= $10
XP_BITMASK			= $14

.MACRO IF_P2_LAST_HAD_BALL[ADDR] ADDR
        LDA POSSESSION_STATUS                         
        BMI ADDR          
.ENDM



.MACRO IF_P1_HAS_BALL[ADDR] ADDR
        BIT POSSESSION_STATUS                         
        BVC ADDR          
.ENDM

.MACRO IF_P2_HAS_BALL[ADDR] ADDR
        BIT POSSESSION_STATUS                         
        BVS ADDR          
.ENDM

.MACRO IF_PLAY_KICKOFF[ADDR] ADDR
        LDA POSSESSION_STATUS                        ;  
		AND #$1C                                    ; 
		CMP #$08                                    ; WAS PLAY KICK OFF? 
		BEQ ADDR                        
.ENDM

.MACRO IF_PLAY_NOT_KICKOFF[ADDR] ADDR
        LDA POSSESSION_STATUS                        ;  
		AND #$1C                                    ; 
		CMP #$08                                    ; WAS PLAY KICK OFF? 
		BNE ADDR                        
.ENDM

_F}_CHECK_POSSESION_STATUS_MACROS

_F{_CHECK_PLAY_STATUS_MACROS

;PLAY STATUS set = true

;BIT 7= SET = PLAY OVER      				= 0x80
;BIT 6= SET = MAN_CAN_PASS_BALL			    = 0x40	
;BIT 5= SET = PASS ATTEMPTED				= 0x20	
;BIT 4= SET = TOUCHDOWN     				= 0x10 
;BIT 3= SET = BEHIND LOS          			= 0x08  
;BIT 2= SET = BALL SNAPPED   				= 0x04
;BIT 1= SET = BALL KICKED     				= 0x02 
;BIT 0= SET = SACK      	 				= 0x01

PLAY_OVER_PLAY_STATUS_BITFLAG      			= $80
MAN_CAN_PASS_BALL_PLAY_STATUS_BITFLAG   	= $40	
PASS_ATTEMPTED_PLAY_STATUS_BITFLAG   		= $20	
TOUCHDOWN_PLAY_STATUS_BITFLAG        		= $10 
BEHIND_LOS_PLAY_STATUS_BITFLAG             	= $08  
BALL_SNAPPED_PLAY_STATUS_BITFLAG      		= $04
BALL_KICKED_PLAY_STATUS_BITFLAG        		= $02 
SACK_KICKED_PLAY_STATUS_BITFLAG       	 	= $01


.MACRO IF_PLAY_OVER[ADDR] ADDR
       LDA PLAY_STATUS                    
       BMI ADDR
.ENDM

.MACRO IF_PLAY_NOT_OVER[ADDR] ADDR
       LDA PLAY_STATUS                    
       BPL ADDR
.ENDM


.MACRO IF_PASS_NOT_ATTEMPTED[ADDR] ADDR
       LDA PLAY_STATUS                    
       AND #PASS_ATTEMPTED_PLAY_STATUS_BITFLAG                                      
	   BEQ ADDR	
.ENDM


.MACRO IF_PASS_ATTEMPTED[ADDR] ADDR
       LDA PLAY_STATUS                    
       AND #PASS_ATTEMPTED_PLAY_STATUS_BITFLAG                                     
	   BNE ADDR	
.ENDM	   



.MACRO IF_PLAY_NOT_TOUCHDOWN[ADDR] ADDR
       LDA PLAY_STATUS                    
       AND #TOUCHDOWN_PLAY_STATUS_BITFLAG                                      
	   BEQ ADDR	
.ENDM

.MACRO IF_PLAY_TOUCHDOWN[ADDR] ADDR
       LDA PLAY_STATUS                  
       AND #TOUCHDOWN_PLAY_STATUS_BITFLAG                                     
	   BNE ADDR	
.ENDM	

.MACRO IF_PLAY_PAST_LOS[ADDR] ADDR
       LDA PLAY_STATUS                    
       AND #BEHIND_LOS_PLAY_STATUS_BITFLAG                                     
	   BEQ ADDR	
.ENDM

.MACRO IF_BALL_SNAPPED[ADDR] ADDR
       LDA PLAY_STATUS                  
       AND #BALL_SNAPPED_PLAY_STATUS_BITFLAG                                  
	   BNE ADDR	
.ENDM

.MACRO IF_BALL_NOT_SNAPPED[ADDR] ADDR
       LDA PLAY_STATUS                  
       AND #BALL_SNAPPED_PLAY_STATUS_BITFLAG                                  
	   BEQ ADDR	
.ENDM

.MACRO WHILE_BALL_NOT_SNAPPED_WAIT_ONE_FRAME[]
      
      _WHILE EQUAL	  
       RETURN_1_FRAME	   
       LDA PLAY_STATUS                  
       AND #BALL_SNAPPED_PLAY_STATUS_BITFLAG                                  
	  _END_WHILE	
.ENDM


.MACRO IF_BALL_NOT_KICKED[ADDR] ADDR
       LDA PLAY_STATUS                   
       AND #BALL_KICKED_PLAY_STATUS_BITFLAG                                  
	   BEQ ADDR	
.ENDM

.MACRO IF_QB_SACKED[ADDR] ADDR
       LDA PLAY_STATUS                   
       LSR
	   BCS  ADDR
.ENDM

_F}_CHECK_PLAY_STATUS_MACROS

_F{_CHECK_BALL_STATUS_MACROS

;;;;;;;;;;;;; BALL STATUS ;;;;;;;;;;;;;;;;;;;
;BIT 7= SET = BALL INTERCEPTED     	= 0x80
;BIT 6= SET = BALL DEFLECTED       	= 0x40		
;BIT 5= SET = BALL CAUGHT	        = 0x20
;BIT 4= SET = BALL FUMBLED          = 0x10
;BIT 3= SET = BALL RECOVERED       	= 0x08 (SET AFTER KICK/FUM RECOVERY/PASS BLOCK
;BIT 2= SET = WHO TOUCHED BALL LAST	= 0x04 (NOT SET=P1, SET = P2)
;BIT 1= SET = XP/FG GOOD		 	= 0x02
;BIT 0= SET = ONSIDES KICK			= 0x01

BALL_INTERCEPTED_BITFLAG     	= $80
BALL_DEFLECTED_BITFLAG       	= $40		
BALL_CAUGHT_BITFLAG	        	= $20
BALL_FUMBLED_BITFLAG          	= $10
BALL_RECOVERED_BITFLAG       	= $08  ;(SET AFTER KICK/FUM RECOVERY/PASS BLOCK



.MACRO IF_PASS_HAS_OUTCOME[ADDR] ADDR
       LDA BALL_STATUS
	   AND #$E0
	   BNE ADDR
.ENDM	

	   

.MACRO IF_PASS_NOT_INTERCEPTED[ADDR] ADDR
       LDA BALL_STATUS                                                       
	   BPL ADDR	
.ENDM	

.MACRO IF_PASS_INTERCEPTED[ADDR] ADDR
       LDA BALL_STATUS                                                     
	   BMI ADDR	
.ENDM

.MACRO IF_PASS_NOT_TIPPED[ADDR] ADDR
       BIT BALL_STATUS                   
       BVC ADDR	
.ENDM

.MACRO IF_PASS_TIPPED[ADDR] ADDR
       BIT BALL_STATUS                   
       BVS ADDR
.ENDM

.MACRO IF_KICK_NOT_BLOCKED[ADDR] ADDR
       BIT BALL_STATUS                   
       BVC ADDR	
.ENDM

.MACRO IF_KICK_BLOCKED[ADDR] ADDR
       BIT BALL_STATUS                   
       BVS ADDR
.ENDM

.MACRO IF_PASS_NOT_COMPLETED[ADDR] ADDR
       LDA BALL_STATUS                   
       AND #$20                                   
	   BEQ ADDR	
.ENDM	

.MACRO IF_PASS_COMPLETED[ADDR] ADDR
       LDA BALL_STATUS                  
       AND #$20                                  
	   BNE ADDR	
.ENDM

.MACRO IF_BALL_NOT_RECEIVED[ADDR] ADDR
       LDA BALL_STATUS                   
       AND #$20                                   
	   BEQ ADDR	
.ENDM	

.MACRO IF_BALL_FUMBLED[ADDR] ADDR
       LDA BALL_STATUS                  
       AND #$10                                  
	   BNE ADDR	
.ENDM

.MACRO IF_BALL_NOT_FUMBLED[ADDR] ADDR
       LDA BALL_STATUS                  
       AND #$10                                  
	   BEQ ADDR	
.ENDM

.MACRO IF_BALL_CAN_BE_RECOVERED[ADDR] ADDR
       LDA BALL_STATUS                  
       AND #$08                                  
	   BNE ADDR	
.ENDM

.MACRO IF_BALL_CANT_BE_RECOVERED[ADDR] ADDR
       LDA BALL_STATUS                  
       AND #08                                  
	   BEQ ADDR	
.ENDM



.MACRO IF_P2_TOUCHED_BALL_LAST[ADDR] ADDR
       LDA BALL_STATUS                   
       AND #$04                                   
	   BNE ADDR	
.ENDM



.MACRO IF_KICK_NOT_MADE[ADDR] ADDR
       LDA BALL_STATUS                   
       AND #$02                                   
	   BEQ ADDR	
.ENDM

.MACRO IF_KICK_ONSIDES[ADDR] ADDR
       LDA BALL_STATUS                   
       LSR                                   
	   BCS ADDR		
.ENDM	

.MACRO IF_KICK_NOT_ONSIDES[ADDR] ADDR
       LDA BALL_STATUS                   
       LSR                                   
	   BCC ADDR	
.ENDM

.MACRO IF_KICK_NOT_ONSIDES_LONG_VERSION[ADDR] ADDR         ;;; *** only needed for build verification
       LDA BALL_STATUS                   
       AND #$01                                   
	   BEQ ADDR	
.ENDM	

_F}_CHECK_BALL_STATUS_MACROS

_F{_CHECK_BALL_STATUS_SPECIAL_MACROS

;;;;;;;;;;;;; BALL STATUS SPECIAL;;;;;;;;;;;;;;;;;;;
;BALL_OOB_BITFLAG					    = $80
;BALL_SAFETY_BITFLAG				 	= $40
;BALL_RECOVERED_BITFLAG					= $20
;BALL_TOUCHBACK_BITFLAG					= $10
;BALL_SHOTGUN_SNAP_BITFLAG				= $08
;BALL_ONSIDES_BITFLAG					= $04



.MACRO IF_PLAY_SAFETY[ADDR] ADDR
       BIT BALL_STATUS_SPECIAL                  
       BVS ADDR
.ENDM


.MACRO IF_BALL_OOB_OR_RECOVERED[ADDR] ADDR
       LDA BALL_STATUS_SPECIAL                  
       BMI ADDR
	   AND #$20                                  
	   BNE ADDR	
.ENDM

.MACRO IF_BALL_OOB[ADDR] ADDR
       LDA BALL_STATUS_SPECIAL                  
       BMI ADDR
.ENDM


.MACRO IF_BALL_RECOVERED[ADDR] ADDR
       LDA BALL_STATUS_SPECIAL                  
       AND #$20                                  
	   BNE ADDR	
.ENDM

.MACRO IF_BALL_NOT_RECOVERED[ADDR] ADDR
       LDA BALL_STATUS_SPECIAL                 
      AND #$20                                  
	   BEQ ADDR	
.ENDM

.MACRO IF_PLAY_TOUCHBACK[ADDR] ADDR
       LDA BALL_STATUS_SPECIAL                     
       AND #$10                                    
	   BNE ADDR	
.ENDM

.MACRO IF_TOSS_SHOTGUN_SNAP_NOT_IN_PROGRESS[ADDR] ADDR
       LDA BALL_STATUS_SPECIAL                     
       AND #$08                                    
	   BEQ ADDR	
.ENDM

_F}_CHECK_BALL_STATUS_SPECIAL_MACROS

_F{_CHECK_FUMBLED_BALL_MACROS
;;;;;;;;;;;;; FUMBLED BALL STATUS ;;;;;;;;;;;;;;;;;;;


.MACRO IF_P2_FUMBLED_BALL[ADDR] ADDR
       BIT FUM_LAST_TEAM_POSS                 
       BVS ADDR
.ENDM

.MACRO IF_P1_FUMBLED_BALL[ADDR] ADDR
       BIT FUM_LAST_TEAM_POSS                 
       BVC ADDR
.ENDM

_F}_CHECK_FUMBLED_BALL_MACROS

_F{_CHECK_BALL_COLLISION_STATUS_MACROS

;;;;;;;;;;;;; BALL COLLISION STATUS ;;;;;;;;;;;;;;;;;;;

;Bit 7= ball moving in air   		= 0x80
;Bit 6= ball collided				= 0x40 
;Bit 5= ball moving up z  			= 0x20 0=no, 1=yes (for pitches, passes) 0x20
;Bit 4= ball leaving hand  			= 0x10 (for pass or pitch) 
;Bit 3=
;Bit 2= update screen scroll     	= 0x04 
;Bit 1= do collision ani            = 0x02 = (for fumbles, tips, ball, hits ground) 
;Bit 0= do backwards ball rotation	= 0x01 = ball rotates backwards (punt/kick)
	

.MACRO IF_BALL_HAS_NOT_COLLIDED[ADDR] ADDR
       BIT BALL_COLLISION                  
       BVC ADDR
.ENDM

.MACRO IF_BALL_NOT_MOVING[ADDR] ADDR
       BIT BALL_COLLISION                  
       BPL ADDR
.ENDM

_F}_CHECK_BALL_COLLISION_STATUS_MACROS

