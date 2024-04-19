_F{_FIELD_SCROLL_LIMIT_MACROS

LEFT_SCROLL_LIMIT_P2_KICKOFF				= $80       ; middle of screen 
RIGHT_SCROLL_LIMIT_P2_KICKOFF				= $F0		; 2yds from right screen edge
CURRENT_SCROLL_P2_KICKOFF					= $A8		; slightly left of center


LEFT_SCROLL_LIMIT_P1_KICKOFF				= $10       ; 2yds from left screen edge 
RIGHT_SCROLL_LIMIT_P1_KICKOFF				= $80		; middle of screen
CURRENT_SCROLL_P1_KICKOFF					= $58		; slightly left of center

LEFT_SCROLL_LIMIT_P1_KICK_RETURN			= $10		; 2yds from left screen edge
RIGHT_SCROLL_LIMIT_P1_KICK_RETURN			= $80		; middle of screen

LEFT_SCROLL_LIMIT_P2_KICK_RETURN			= $80		; middle of screen
RIGHT_SCROLL_LIMIT_P2_KICK_RETURN			= $F0		; 2yds from right screen edge

LEFT_SCROLL_LIMIT_P1_TURNOVER				= $80		; middle of screen
RIGHT_SCROLL_LIMIT_P1_TURNOVER				= $F0		; 2yds from right screen edge

LEFT_SCROLL_LIMIT_P2_TURNOVER				= $10		;2yds from left screen edge
RIGHT_SCROLL_LIMIT_P2_TURNOVER				= $80		; middle of screen

LEFT_SCROLL_LIMIT_P1_PUNT_RETURN			= $10		; 2yds from left screen edge
RIGHT_SCROLL_LIMIT_P1_PUNT_RETURN			= $80		; middle of screen

LEFT_SCROLL_LIMIT_P2_PUNT_RETURN			= $80		; middle of screen
RIGHT_SCROLL_LIMIT_P2_PUNT_RETURN			= $F0		; 2yds from right screen edge

LEFT_SCROLL_LIMIT_P1_PLAY_START				= $10       ; 2yds from left screen edge
RIGHT_SCROLL_LIMIT_P1_PLAY_START			= $C0		; 1/4 from right screen edge
CURRENT_SCROLL_P1_PLAY_START				= $58		; slightly left of center

LEFT_SCROLL_LIMIT_P2_PLAY_START				= $40       ; 1/4 from left screen edge
RIGHT_SCROLL_LIMIT_P2_PLAY_START			= $F0		; 2yds from right screen edge
CURRENT_SCROLL_P2_PLAY_START				= $A8		; slightly right of center


LEFT_SCROLL_LIMIT_P1_FG_XP					= $10       ; 2yds from left screen edge
RIGHT_SCROLL_LIMIT_P1_FG_XP					= $C0		; 1/4 from right screen edge
CURRENT_SCROLL_P1_FG_XP						= $80		; middle of screen

LEFT_SCROLL_LIMIT_P2_FG_XP	 				= $40 	                                   
RIGHT_SCROLL_LIMIT_P2_FG_XP	                = $F0     	           
CURRENT_SCROLL_P2_FG_XP	 					= $80

LEFT_SCROLL_LIMIT_P1_PUNT					= $10       ; 2yds from left screen edge
RIGHT_SCROLL_LIMIT_P1_PUNT					= $80		; middle of screen
CURRENT_SCROLL_P1_PUNT						= $58		; slightly left of center

LEFT_SCROLL_LIMIT_P2_PUNT					= $80       ; middle of screen
RIGHT_SCROLL_LIMIT_P2_PUNT					= $F0		; 2yds from right screen edge
CURRENT_SCROLL_P2_PUNT						= $A8		; slightly right of center 




.MACRO SET_P1_KICKOFF_SCROLL_LIMITS[]
   LDX #LEFT_SCROLL_LIMIT_P1_KICKOFF                                    
   LDY #RIGHT_SCROLL_LIMIT_P1_KICKOFF                                   
   LDA #CURRENT_SCROLL_P1_KICKOFF                                           
.ENDM 

.MACRO SET_P2_KICKOFF_SCROLL_LIMITS[]
   LDX #LEFT_SCROLL_LIMIT_P2_KICKOFF                                    
   LDY #RIGHT_SCROLL_LIMIT_P2_KICKOFF                                   
   LDA #CURRENT_SCROLL_P2_KICKOFF                                           
.ENDM 

.MACRO SET_P1_KR_SCROLL_LIMITS[]
   LDA #LEFT_SCROLL_LIMIT_P1_KICK_RETURN                                  
   STA LEFT_SCROLL_LIM_FIELD                    
   LDA #RIGHT_SCROLL_LIMIT_P1_KICK_RETURN	                                    
   STA RIGHT_SCROLL_LIM_FIELD                   
.ENDM 

.MACRO SET_P2_KR_SCROLL_LIMITS[]
   LDA #LEFT_SCROLL_LIMIT_P2_KICK_RETURN                                  
   STA LEFT_SCROLL_LIM_FIELD                    
   LDA #RIGHT_SCROLL_LIMIT_P2_KICK_RETURN	                                    
   STA RIGHT_SCROLL_LIM_FIELD                   
.ENDM  

.MACRO SET_P1_PR_SCROLL_LIMITS[]
   LDA #LEFT_SCROLL_LIMIT_P1_PUNT_RETURN                                  
   STA LEFT_SCROLL_LIM_FIELD                    
   LDA #RIGHT_SCROLL_LIMIT_P1_PUNT_RETURN 	                                    
   STA RIGHT_SCROLL_LIM_FIELD                   
.ENDM 

.MACRO SET_P2_PR_SCROLL_LIMITS[]
   LDA #LEFT_SCROLL_LIMIT_P2_PUNT_RETURN                                  
   STA LEFT_SCROLL_LIM_FIELD                    
   LDA #RIGHT_SCROLL_LIMIT_P2_PUNT_RETURN 	                                    
   STA RIGHT_SCROLL_LIM_FIELD                   
.ENDM    

.MACRO SET_P1_PLAY_START_SCROLL_LIMITS[]
   LDX #LEFT_SCROLL_LIMIT_P1_PLAY_START	                                    
   LDY #RIGHT_SCROLL_LIMIT_P1_PLAY_START                                  
   LDA #CURRENT_SCROLL_P1_PLAY_START                                           
.ENDM 

.MACRO SET_P2_PLAY_START_SCROLL_LIMITS[]
   LDX #LEFT_SCROLL_LIMIT_P2_PLAY_START	                                    
   LDY #RIGHT_SCROLL_LIMIT_P2_PLAY_START                                  
   LDA #CURRENT_SCROLL_P2_PLAY_START                                           
.ENDM  
  
.MACRO SET_P1_FG_XP_SCROLL_LIMITS[]
   LDX #LEFT_SCROLL_LIMIT_P1_FG_XP	                                    
   LDY #RIGHT_SCROLL_LIMIT_P1_FG_XP	                                
   LDA #CURRENT_SCROLL_P1_FG_XP	                                         
.ENDM 

.MACRO SET_P2_FG_XP_SCROLL_LIMITS[]
   LDX #LEFT_SCROLL_LIMIT_P2_FG_XP	                                    
   LDY #RIGHT_SCROLL_LIMIT_P2_FG_XP	                                
   LDA #CURRENT_SCROLL_P2_FG_XP	                                         
.ENDM 


.MACRO SET_P1_PUNT_START_SCROLL_LIMITS[]
   LDX #LEFT_SCROLL_LIMIT_P1_PUNT	                                    
   LDY #RIGHT_SCROLL_LIMIT_P1_PUNT	                                
   LDA #CURRENT_SCROLL_P1_PUNT	                                         
.ENDM  

.MACRO SET_P2_PUNT_START_SCROLL_LIMITS[]
   LDX #LEFT_SCROLL_LIMIT_P2_PUNT	                                    
   LDY #RIGHT_SCROLL_LIMIT_P2_PUNT	                                
   LDA #CURRENT_SCROLL_P2_PUNT	                                         
.ENDM  


.MACRO SET_P1_INT_PR_FUM_SCROLL_LIMITS[]
   LDA #LEFT_SCROLL_LIMIT_P1_TURNOVER
   STA LEFT_SCROLL_LIM_FIELD                   
   LDA #RIGHT_SCROLL_LIMIT_P1_TURNOVER                                  
   STA RIGHT_SCROLL_LIM_FIELD                                                           
.ENDM  

.MACRO SET_P2_INT_PR_FUM_SCROLL_LIMITS[]
   LDA #LEFT_SCROLL_LIMIT_P2_TURNOVER
   STA LEFT_SCROLL_LIM_FIELD                   
   LDA #RIGHT_SCROLL_LIMIT_P2_TURNOVER                                  
   STA RIGHT_SCROLL_LIM_FIELD                                                           
.ENDM 

_F}_FIELD_SCROLL_LIMIT_MACROS
 
