_F{_JOYPAD_MACROS

.MACRO  IF_EITHER_JOY_PRESSED_B[ADDR] ADDR
   BIT JOY_PRESS_BOTH                                      
   BVS ADDR    
 .ENDM 
 
 .MACRO  IF_NEITHER_JOY_PRESSED_B[ADDR] ADDR
   BIT JOY_PRESS_BOTH                                      
   BVC ADDR    
 .ENDM 

 .MACRO  IF_NEITHER_JOY_HELD_RIGHT[ADDR] ADDR
   LDA JOY_RAW_BOTH                                      
   AND #$01
   BEQ ADDR   
 .ENDM 
 
.MACRO IF_NEITHER_JOY_HELD_LEFT[ADDR] ADDR
   LDA JOY_RAW_BOTH                                      
   AND #$02
   BEQ ADDR   
 .ENDM 
 
_F}_JOYPAD_MACROS 