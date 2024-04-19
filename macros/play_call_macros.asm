_F{_PLAY_CALL_MACROS

.MACRO IF_P1_PLAY_NOT_SPECIAL_TEAMS[ADDR] ADDR
   LDA P1_PLAY_CALL                            ; IS P1 PLAY = FG/PUNT?
   CMP #$08                                    ;  	
   BCC ADDR
.ENDM
   
.MACRO IF_P1_PLAY_RUN[ADDR] ADDR
   LDA P1_PLAY_CALL                            ; IS P1 PLAY = FG/PUNT?
   CMP #$04                                    ;  	
   BCC ADDR   
.ENDM   

.MACRO IF_P1_PLAY_PUNT[ADDR] ADDR
   LDA P1_PLAY_CALL                            ; IS P1 PLAY = FG/PUNT?
   CMP #$09                                    ;  	
   BCC ADDR    
 .ENDM  
   
.MACRO IF_P2_PLAY_NOT_SPECIAL_TEAMS[ADDR] ADDR
   LDA P2_PLAY_CALL                            ; IS P1 PLAY = FG/PUNT?
   CMP #$08                                    ;  	
   BCC ADDR
 .ENDM
 
.MACRO IF_P2_PLAY_RUN[ADDR] ADDR
   LDA P2_PLAY_CALL                            ; IS P1 PLAY = FG/PUNT?
   CMP #$04                                    ;  	
   BCC ADDR   
.ENDM
  
.MACRO IF_P2_PLAY_PUNT[ADDR] ADDR
   LDA P2_PLAY_CALL                            ; IS P1 PLAY = FG/PUNT?
   CMP #$09                                    ;  	
   BCC ADDR       
.ENDM   

_F}_PLAY_CALL_MACROS