_F{_PROGRAMMING_STRUCTURE_MACROS

for_loop 				= $0000
while_loop 				= $0000
else_addr 				= $0000
while_type 				= $0
if_type 				= $0
current_switch_bit 		= $0

.ENUM $0000

CC		.dsb 1
CS		.dsb 1
PLUS		.dsb 1
MINUS		.dsb 1
EQUAL		.dsb 1
NOT_EQUAL	.dsb 1
VALUE_CLEAR .dsb 1
VALUE_SET	.dsb 1
ALWAYS		.dsb 1 

.ENDE


.MACRO SWITCH_A_BIT[] mem_val
    current_switch_bit	= 7 
	LDA mem_val
    	
.ENDM

.MACRO CASE_BIT[bit_addr] bit_val, addr
    IF (bit_val == current_switch_bit)
    ASL 	
		IF ( ((addr - $) > 127) || (($ - addr) > 127) ) 
			BCC @NEXT 
			JMP addr
			@NEXT:	
		ELSE 
		BCC addr
		
		ENDIF
		
     ELSE
     ASL	 
	.REPT (current_switch_bit - bit_val)
	 ASL
	.ENDR
	 IF ( ((addr - $) > 127) || (($ - addr) > 127) ) 
			BCC @NEXT 
			JMP addr
			@NEXT:	
		ELSE 
		BCC addr
		
		ENDIF
	
	ENDIF
     current_switch_bit	= bit_val -1 	
.ENDM




.MACRO  _FOR_Y_UP_{ count_start
		LDY #count_start
		for_loop = $
.ENDM

.MACRO  _FOR_Y_UP_END
		INY
		BNE for_loop
.ENDM


.MACRO  _FOR_Y_DOWN_{ count_start			
		LDY #count_start
		for_loop = $
.ENDM

.MACRO  _FOR_Y_DOWN_END
		DEY
		BNE for_loop
.ENDM

.MACRO  _WHILE type
		while_loop = $
		while_type = type
.ENDM

.MACRO  _END_WHILE 
      IF while_type = CC
      BCC while_loop
		ELSEIF while_type = CS 
		BCS while_loop	
		ELSEIF while_type = PLUS 
		BPL while_loop		
		ELSEIF while_type = MINUS 
		BMI while_loop	
      ELSEIF while_type = EQUAL
		BEQ while_loop	
      ELSEIF while_type = NOT_EQUAL
		BNE while_loop	
		ELSEIF while_type = VALUE_CLEAR
		BVC while_loop	
		ELSEIF while_type = VALUE_SET
		BVS while_loop
		ELSEIF while_type = ALWAYS
		JMP while_loop			
		ENDIF 
.ENDM




.MACRO  _IF[type] if_type, addr
		IF if_type = CC
        BCC addr
		ELSEIF if_type = CS 
		BCS addr	
		ELSEIF if_type = PLUS 
		BPL addr		
		ELSEIF if_type = MINUS 
		BMI addr	
		 ELSEIF if_type = EQUAL
		BEQ addr
      ELSEIF if_type = NOT_EQUAL
		BNE addr
		ELSEIF if_type = VALUE_CLEAR
		BVC addr
		ELSEIF if_type = VALUE_SET
		BVS addr
		ENDIF
.ENDM

.MACRO  _THEN[] 
		then_addr = $ 		
		

.ENDM



.MACRO _IF_LESS_THAN[val_loc] value, location
	   
	   CMP #value
	   
	   IF (location - $) > 127	
	   BCS @next
       JMP location	
	   
	   ELSEIF (location - $) < -128
	   BCS @next
       JMP location
	   
	   
	   @next: 
       
.ENDM


_F}_PROGRAMMING_STRUCTURE_MACROS
