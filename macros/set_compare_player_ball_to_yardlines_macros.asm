; Left endzone Front:  high =0x06, low = 0x70
;Right endzone Front: high =0x09, low = 0x90

.MACRO  SAVE_LOS_X
	STY LOS_X                  			                          
	STX LOS_X+1
.ENDM


.MACRO  SAVE_YARDLINE_TO_LOS_X yardline_decimal
       temp_yardline = yardline_decimal * 8 
	   temp_yardline = temp_yardline + $0670  
		
		LDA #<temp_yardline						                                
		STA LOS_X						                                 
		LDA #>temp_yardline						                               
		STA LOS_X+1
.ENDM


.MACRO  SET_YARDLINE_X yardline_decimal
       temp_yardline = yardline_decimal * 8 
	   temp_yardline = temp_yardline + $0670  
	   LDY #<temp_yardline						                                					                                 
	   LDX #>temp_yardline	

.ENDM

.MACRO  SET_LOS_X_EQUAL_TO_BALL_X
   LDA BALL_X+1 
	STA LOS_X				                                					                                 
	LDA BALL_X+2 
	STA LOS_X+1
.ENDM

.MACRO  SET_BALL_X_EQUAL_TO_LOS_X
   LDA LOS_X                                    
   STA BALL_X+1	                                  
   LDA LOS_X +1                                   
   STA BALL_X+2	                                  
.ENDM

.MACRO  SET_BALL_X_EQUAL_TO_LOCATION[name] location
   LDA #<(location)                                  
   STA BALL_X+1	                                  
   LDA #>(location)                                   
   STA BALL_X+2	                                  
.ENDM

.MACRO COMPARE_LOS_X_TO_LOCATION[name] location
	LDA LOS_X	                             
	CMP #<(location)                  
	LDA LOS_X+1	                           
	SBC #>(location)                  
.ENDM	

.MACRO COMPARE_BALL_X_TO_LOCATION[name] location
	LDA BALL_X+1	                             
	CMP #<(location)                  
	LDA BALL_X+2	                           
	SBC #>(location)                  
.ENDM	

.MACRO COMPARE_P1_BALL_CARRIER_TO_LOCATION[name] location
	LDY #$14                                  
	LDA (P1_MAN_PLAYER_ADDR),Y                  
    CMP #<(location)                  
    INY                                      
    LDA (P1_MAN_PLAYER_ADDR ),Y              
    SBC #>(location)                                      
.ENDM

.MACRO COMPARE_P2_BALL_CARRIER_TO_LOCATION[name] location
	LDY #$14                                  
	LDA (P2_MAN_PLAYER_ADDR),Y                  
    CMP #<(location)                   
    INY                                      
    LDA (P2_MAN_PLAYER_ADDR ),Y              
    SBC #>(location)                                     
.ENDM

.MACRO  COMPARE_BALL_X_TO_YARDLINE yardline_decimal
    temp_yardline = yardline_decimal * 8 
	temp_yardline = temp_yardline + $0670  
	LDA BALL_X+1					                                   
	CMP #<temp_yardline							                                
	LDA BALL_X+2						                                   
	SBC #>temp_yardline	

.ENDM

						                                