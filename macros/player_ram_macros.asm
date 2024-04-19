_F{_PLAYER_RAM_MACROS

									
.ENUM $00
	COLLISION_STATUS			.dsb 1	       
	MOVEMENT_STATUS				.dsb 1
	
	COMMAND_COUNTER				.dsb 1	
	COMMAND_ADDR				.dsb 2
	
	COLLISION_COUNTER			.dsb 1 
	COLLISION_ADDR				.dsb 2
	
	POSITION_ID					.dsb 1
	
	PLAY_CODE_ADDR				.dsb 2
	EXTRA_PLAYER_RAM_1			.dsb 1	
	SPRITE_INDEX				.dsb 1	
	EXTRA_SPRITE_INDEX			.dsb 1	
	CURRENT_DIRECTION			.dsb 1
	RP_RS_INDEXES				.dsb 1			
	RP_COUNTER					.dsb 1			
	CURRENT_SPEED				.dsb 1	
	MAX_SPEED					.dsb 1
	X_POS						.dsb 3
	Y_POS						.dsb 2	
	X_VELOCITY					.dsb 2
	Y_VELOCITY					.dsb 2
	HP_INDEX					.dsb 1
	PASS_PRIORITY_PLAYER_RAM	.dsb 0 
	EXTRA_PLAYER_RAM_3			.dsb 1
	EXTRA_PLAYER_RAM_4			.dsb 1			
	EXTRA_PLAYER_RAM_5			.dsb 1	
.ENDE 

; collision status bitflag masks
PLAYER_COLLIDING_BITFLAG		= $80
PLAYER_NEAR_COLLISION_BITFLAG 	= $40
PLAYER_NEAR_DIVE_BITFLAG		= $40
PLAYER_COLLIDED_BITFLAG			= $20
PLAYER_ON_GROUND_BITFLAG		= $10

PLAYER_JUMPING_BITFLAG			= $08
COLLIDED_BALL_BITFLAG			= $04
CAN_KICK_BALL_BITFLAG			= $02
BACK_OF_ENDZONE_BITFLAG			= $01


; collision status bitflag masks

PLAYER_NOT_ON_GROUND_BITMASK		= $EF
PLAYER_NOT_COLLIDED_BITMASK			= $DF
PLAYER_ON_GROUND_BITMASK			= $10 

CANT_KICK_BALL_BITMASK				= $FD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; movement status bitflag masks
PLAYER_MOVING_BITFLAG			= $80
PLAYER_MAN_COM_BITFLAG 			= $40
PLAYER_BALL_CARRIER_BITFLAG		= $20
PLAYER_CHOP_BLOCK_BITFLAG		= $10
PLAYER_DIVE_TACKLE_BITFLAG		= $08


PLAYER_NOT_CHOP_NOT_DIVE_BITMASK = $E7


; collision status bitflag masks

PLAYER_NOT_BALL_CARRIER_BITMASK		= $DF
PLAYER_NOT_CLOSE_DIVE_BITMASK		= $BF
PLAYER_NOT_MOVING_BITMASK			= $7F
PLAYER_MOVING_BITMASK				= $80 	

POSITION_BITMASK	= $1F			; masks 

TARGET_PLAYER_ADDR = LOCAL_1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MACRO SET_PLAYER_COMMAND_ADDR[frame_delay_rom_addr] frames, addr 
	LDA #frames                                     ; SET COMMAND COUNTER TO 1 FRAME
	LDY #COMMAND_COUNTER                            ; 
	STA (CURRENT_PLAYER_ADDR),Y                     ; 
	INY                                             ; SET COMMAND ADDRESS = PROCESS PLAY CODE COMMAND() = $8000-1 BANK 21
	LDA #<addr -1                                   ; 
	STA (CURRENT_PLAYER_ADDR),Y                     ;
	INY                                             ;
	LDA #>addr -1                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                     ; 
.ENDM

.MACRO SET_PLAYER_COLL_ADDR[frame_delay_rom_addr] frames, addr 
	LDA #frames                                     ; SET COMMAND COUNTER TO 1 FRAME
	LDY #COMMAND_COUNTER                            ; 
	STA (CURRENT_PLAYER_ADDR),Y                     ; 
	INY                                             ; SET COMMAND ADDRESS = PROCESS PLAY CODE COMMAND() = $8000-1 BANK 21
	LDA #<addr -1                                   ; 
	STA (CURRENT_PLAYER_ADDR),Y                     ;
	INY                                             ;
	LDA #>addr -1                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                     ; 
.ENDM

.MACRO SET_PLAYER_ADDR[frame_delay_rom_addr] frames, addr 
	LDA #frames                                     ; SET COMMAND COUNTER TO 1 FRAME
	STA (CURRENT_PLAYER_ADDR),Y                     ; 
	INY                                             ; SET COMMAND ADDRESS = PROCESS PLAY CODE COMMAND() = $8000-1 BANK 21
	LDA #<addr -1                                   ; 
	STA (CURRENT_PLAYER_ADDR),Y                     ;
	INY                                             ;
	LDA #>addr -1                                   ;
	STA (CURRENT_PLAYER_ADDR),Y                     ; 
.ENDM


.MACRO PAUSE_PLAYER_ACTIONS
	LDA #$00
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES
.ENDM

.MACRO RETURN_PLAYER_ACTIONS_IN_1_FRAME
	LDA #$01
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES
.ENDM

.MACRO RETURN_PLAYER_ACTIONS_IN_NUM_FRAMES[frames] frames
	LDA #frames
	JSR WAIT_UPDATE_PLAYER_NUM_FRAMES
.ENDM



.MACRO LOAD_CUR_PLAYER_COLLISION_STATUS
	LDY #COLLISION_STATUS				                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO SET_CUR_PLAYER_COLLISION_STATUS
	LDY #COLLISION_STATUS				                         
	STA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO SET_CUR_PLAYER_NOT_CLOSE_TO_DIVE[]
	LDA (CURRENT_PLAYER_ADDR),Y                                   ; SET PLAYER COLLISION = PLAYER NOT CLOSE TO COLLISION
	AND #PLAYER_NOT_CLOSE_DIVE_BITMASK                                                    ; 
	STA (CURRENT_PLAYER_ADDR),Y                                   ; 				      
.ENDM


.MACRO SET_CUR_PLAYER_COLLIDED_WITH_BALL[]
	LOAD_CUR_PLAYER_COLLISION_STATUS
	ORA #$04                                              
	STA (CURRENT_PLAYER_ADDR),Y                           
.ENDM

.MACRO SET_CUR_PLAYER_NOT_COLLIDED_WITH_BALL[]
	LOAD_CUR_PLAYER_COLLISION_STATUS
	AND #$FB                                              
	STA (CURRENT_PLAYER_ADDR),Y                           
.ENDM

.MACRO SET_CUR_PLAYER_JUMPING[]
	LOAD_CUR_PLAYER_COLLISION_STATUS
	ORA #PLAYER_JUMPING_BITFLAG                                              
	STA (CURRENT_PLAYER_ADDR),Y                           
.ENDM



.MACRO LOAD_CUR_PLAYER_MOVEMENT_STATUS
	LDY  #MOVEMENT_STATUS								                         
	LDA (CURRENT_PLAYER_ADDR),Y							      
.ENDM


.MACRO LOAD_P1_MAN_PLAYER_MOVEMENT_STATUS
	LDY  #MOVEMENT_STATUS								                         
	LDA (P1_MAN_PLAYER_ADDR),Y							      
.ENDM

.MACRO LOAD_P2_MAN_PLAYER_MOVEMENT_STATUS
	LDY  #MOVEMENT_STATUS								                         
	LDA (P2_MAN_PLAYER_ADDR),Y							      
.ENDM

.MACRO SET_CURRENT_PLAYER_MOVING[]
	LOAD_CUR_PLAYER_MOVEMENT_STATUS	                       
	ORA #PLAYER_MOVING_BITFLAG                                            
	STA (CURRENT_PLAYER_ADDR),Y                            
.ENDM

.MACRO SET_CURRENT_PLAYER_MAN_CONTROLLED[]
	LOAD_CUR_PLAYER_MOVEMENT_STATUS	                       
	ORA #PLAYER_MAN_COM_BITFLAG                                           
	STA (CURRENT_PLAYER_ADDR),Y                            
.ENDM

.MACRO SET_CURRENT_PLAYER_NOT_MOVING
	LOAD_CUR_PLAYER_MOVEMENT_STATUS	
    AND #$7F
	STA (CURRENT_PLAYER_ADDR),Y	 	
.ENDM

.MACRO IF_CURRENT_PLAYER_BALL_CARRIER[ADDR] ADDR
      LOAD_CUR_PLAYER_MOVEMENT_STATUS
	   AND #PLAYER_BALL_CARRIER_BITFLAG
	   BNE ADDR
.ENDM

.MACRO IF_P1_MAN_NOT_BALL_CARRIER[ADDR] ADDR
       LOAD_P1_MAN_PLAYER_MOVEMENT_STATUS
	   AND #PLAYER_BALL_CARRIER_BITFLAG
	   BEQ ADDR
.ENDM

.MACRO IF_P2_MAN_NOT_BALL_CARRIER[ADDR] ADDR
       LOAD_P2_MAN_PLAYER_MOVEMENT_STATUS
	   AND #PLAYER_BALL_CARRIER_BITFLAG
	   BEQ ADDR
.ENDM

.MACRO SET_CURRENT_PLAYER_IS_BALL_CARRIER[]
	LOAD_CUR_PLAYER_MOVEMENT_STATUS 
	ORA #PLAYER_BALL_CARRIER_BITFLAG
	STA (CURRENT_PLAYER_ADDR),Y  
.ENDM

.MACRO SET_CURRENT_PLAYER_NOT_BALL_CARRIER[]
	LOAD_CUR_PLAYER_MOVEMENT_STATUS 
	AND #$DF
	STA (CURRENT_PLAYER_ADDR),Y  
.ENDM

.MACRO SET_P1_MAN_NOT_BALL_CARRIER[]
	LDY #MOVEMENT_STATUS                        
	LDA (P1_MAN_PLAYER_ADDR),Y                   
	AND #$DF                                    
	STA (P1_MAN_PLAYER_ADDR),Y                 
.ENDM


.MACRO SET_P2_MAN_NOT_BALL_CARRIER[]
	LDY #MOVEMENT_STATUS                        
	LDA (P2_MAN_PLAYER_ADDR),Y                   
	AND #$DF                                    
	STA (P2_MAN_PLAYER_ADDR),Y                 
.ENDM


.MACRO SET_P1_AND_P2_MAN_NOT_BALL_CARRIER[]
	SET_P1_MAN_NOT_BALL_CARRIER[]
	LDA (P2_MAN_PLAYER_ADDR),Y                   
	AND #$DF                                    
	STA (P2_MAN_PLAYER_ADDR),Y   
.ENDM


.MACRO SAVE_CURR_PLAYER_COMM_OR_COLL_ADDR
	PLA							                       
	STA (CURRENT_PLAYER_ADDR),Y							                      
	INY							                         
	PLA							                         
	STA (CURRENT_PLAYER_ADDR),Y							                 					      
.ENDM


.MACRO LOAD_CUR_PLAYER_COMMAND_COUNTER
	LDY #COMMAND_COUNTER							                         
	LDA (CURRENT_PLAYER_ADDR),Y							      
.ENDM

.MACRO LOAD_CUR_PLAYER_COLLISION_COUNTER
	LDY #COLLISION_COUNTER							                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_PLAYER_POSITION_ID
	LDY #POSITION_ID						                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_P1_MAN_PLAYER_POSITION_ONLY
	LDY #POSITION_ID						                         
	LDA (P1_MAN_PLAYER_ADDR),Y
    AND #POSITION_BITMASK 	
.ENDM

.MACRO LOAD_P2_MAN_PLAYER_POSITION_ONLY
	LDY #POSITION_ID						                         
	LDA (P2_MAN_PLAYER_ADDR),Y
    AND #POSITION_BITMASK 	
.ENDM


.MACRO LOAD_CUR_PLAYER_SPRITE_INDEX
	LDY #SPRITE_INDEX						                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO SET_CUR_PLAYER_SPRITE_INDEX
	LDY #SPRITE_INDEX						                         
	STA (CURRENT_PLAYER_ADDR),Y						      
.ENDM



.MACRO LOAD_CUR_PLAYER_DIRECTION
	LDY #CURRENT_DIRECTION				                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_TARGET_DIRECTION[]
	LDY #CURRENT_DIRECTION				                         
	LDA (CURRENT_TARGET_ADDR),Y						      
.ENDM

.MACRO SET_CUR_PLAYER_DIRECTION
	LDY #CURRENT_DIRECTION				                         
	STA (CURRENT_PLAYER_ADDR),Y						      
.ENDM


.MACRO LOAD_CUR_PLAYER_RP_RS_INDEXES
	LDY #RP_RS_INDEXES				                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO SET_CUR_PLAYER_RP_RS_INDEXES
	LDY #RP_RS_INDEXES		                         
	STA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_PLAYER_RUSHING_PWR_CTR
	LDY #RP_COUNTER				                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO SET_CUR_PLAYER_RUSHING_PWR_CTR
	LDY #RP_COUNTER		                         
	STA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_PLAYER_SPEED
	LDY #CURRENT_SPEED				                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_TARGET_SPEED[]
	LDY #CURRENT_SPEED			                         
	LDA (CURRENT_TARGET_ADDR),Y						      
.ENDM

.MACRO SET_CUR_PLAYER_SPEED
	LDY #CURRENT_SPEED			                         
	STA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_PLAYER_MAX_SPEED
	LDY #MAX_SPEED				                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_P1_MAN_PLAYER_MAX_SPEED
	LDY #MAX_SPEED				                         
	LDA (P1_MAN_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_P2_MAN_PLAYER_MAX_SPEED
	LDY #MAX_SPEED				                         
	LDA (P2_MAN_PLAYER_ADDR),Y						      
.ENDM


.MACRO SET_CUR_PLAYER_MAX_SPEED
	LDY #MAX_SPEED			                         
	STA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_PLAYER_HITTING_POWER
	LDY #HP_INDEX						                         
	LDA (CURRENT_PLAYER_ADDR),Y							      
.ENDM



.MACRO LOAD_CUR_PLAYER_X_POS
	LDY #X_POS + 1						                         
	LDA (CURRENT_PLAYER_ADDR),Y							      
.ENDM

.MACRO LOAD_CUR_TARGET_X_POS
	LDY #X_POS + 1						                         
	LDA (TARGET_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_PLAYER_Y_POS
	LDY #Y_POS + 1						                         
	LDA (CURRENT_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_CUR_TARGET_Y_POS
	LDY #Y_POS + 1						                         
	LDA (TARGET_PLAYER_ADDR),Y						      
.ENDM

.MACRO LOAD_P1_MAN_PLAYER_Y_POS
	LDY #Y_POS + 1						                         
	LDA (P1_MAN_PLAYER_ADDR),Y				      
.ENDM


.MACRO LOAD_P2_MAN_PLAYER_Y_POS
	LDY #Y_POS + 1						                         
	LDA (P2_MAN_PLAYER_ADDR),Y				      
.ENDM


.MACRO SAVE_CUR_PLAYER_COMMAND_ADDR_TO_STACK
	LDY #( COMMAND_ADDR+1)							                         
	LDA (CURRENT_PLAYER_ADDR),Y	
	PHA							                             
	DEY							                             
	LDA (CURRENT_PLAYER_ADDR),Y		
	PHA							                             	
.ENDM


.MACRO SAVE_CUR_PLAYER_COLLISION_ADDR_TO_STACK
	LDY #( COLLISION_ADDR+1	)						                         
	LDA (CURRENT_PLAYER_ADDR),Y		
	PHA							                             
	DEY							                             
	LDA (CURRENT_PLAYER_ADDR),Y	
	PHA							                             	
.ENDM

.MACRO SAVE_RETURN_ADDR_TO_CUR_PLAYER_RAM
	PLA                                                    ; SAVE RETURN ADDRESS IN PLAYER RAM 1E,1F
	LDY #EXTRA_PLAYER_RAM_4                                ; 
	STA (CURRENT_PLAYER_ADDR),Y                            ; 
	PLA                                                    ; 
	INY                                                    ; 
	STA (CURRENT_PLAYER_ADDR),Y                            ; 
.ENDM

.MACRO RETURN_TO_ADDR_IN_CUR_PLAYER_RAM
	LDY #EXTRA_PLAYER_RAM_4                                ; 
	BPL @pause_player_actions                              ; pause player actions if return address not legitmate
	PHA                                                    ; 
	DEY                                                    ;
	LDA (CURRENT_PLAYER_ADDR),Y                            ;
	PHA                                                    ;
	RTS                                                    ; RETURN TO COMMAND ADDR 
@pause_player_actions:                                     ; LIKELY UNREACHABLE (OR V
.ENDM



.MACRO COPY_PLAY_CODE_ADDR_PLAYER_RAM[data_addr_ram_addr] dataaddr, ramaddr
   LDY #$00                                    ; SAVE CURRENT PLAY CODE POINTER IN PLAYER RAM PLAY CODE ADDRESS
   LDA (dataaddr),Y              			   ;
   LDY #PLAY_CODE_ADDR                         ;
   STA (ramaddr),Y                           ;
   LDY #$01                                    ;
   LDA (dataaddr),Y                           ;
   LDY #PLAY_CODE_ADDR+1                       ;
   STA (ramaddr),Y                            ; 
.ENDM



.MACRO SET_PLAYER_RAM_ADDR_TO_NEXT_PLAYER[player_addr] addr
   LDA addr                   					; PLAYER RAM PTR =  PLAYER RAM PTR +0X20 = NEXT PLAYER 
   CLC                                         ;
   ADC #$20                                    ;
   STA addr;
   LDA addr + 1                 				;
   ADC #$00                                    ;
   STA addr + 1                 				;   
 
.ENDM

_F}_PLAYER_RAM_MACROS