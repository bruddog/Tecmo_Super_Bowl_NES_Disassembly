for_loop = $0000
while_loop = $0000
else_addr = $0000
while_type = $0
if_type = $0
current_switch_bit = 0

.ENUM $0000

CC		.dsb 1
CS		.dsb 1
PLUS		.dsb 1
MINUS		.dsb 1
EQUAL		.dsb 1
NOT_EQUAL	.dsb 1
VALUE_CLEAR .dsb 1
VALUE_SET	.dsb 1

.ENDE


.MACRO SWITCH_A_BIT[] mem_val
    current_switch_bit	= 7 
	LDA mem_val
	ASL	
.ENDM

.MACRO CASE_BIT bit_val, addr
    IF (bit_val == current_switch_bit) 
		IF ( (addr - $) > 255)
			BCC @NEXT 
			JMP addr
			@NEXT:	
		ELSE 
		BCC addr
		
		ENDIF
		
    ELSE 
	.REPT (current_switch_bit - bit_val)
	 ASL
	.ENDR
	current_switch_bit = bit_val
		IF ( (addr - $) > 255)
			BCC @NEXT 
			JMP addr
			@NEXT:	
		ELSE
		BCC addr
		
		ENDIF
	ENDIF	
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
		ENDIF 
.ENDM


.MACRO  _IF[type] type
		else_addr = $
		
.ENDM

.MACRO  _ELSE 
        IF if_type = CC
        BCC else_addr
		ELSEIF if_type = CS 
		BCS else_addr	
		ELSEIF if_type = PLUS 
		BPL else_addr		
		ELSEIF if_type = MINUS 
		BMI else_addr	
		ENDIF 
.ENDM

.org $0000
.base $8000
UPDATE_DIRECTION_RESET_SPEED_GRTR_THAN_45DEG_CHANGE:
lda #$01


