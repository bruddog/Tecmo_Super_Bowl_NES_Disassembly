_F{_6502_STACK_JUMP_TABLE_MACROS

.MACRO SET_STACK[loc] stack_loc
	LDX #stack_loc
	TXS
.ENDM
	
.MACRO PUSH_TABLE_ADDR[tableAddr] tableAddr
	ASL                                                          ; LOAD COMMAND LOCATION FROM MAIN MENU COMMAND TABLE
	TAX                                                          ; PUSH MENU COMMAND ADDRESS ON STACK AND USE RTS 
	LDA tableAddr+1,X                              				 ;
	PHA                                                          ;
	LDA tableAddr,X                                				 ;
	PHA                                                          ;
	RTS                                                          ;

.ENDM	

.MACRO RTS_JUMP_TABLE[memVal_tableAddr] memVal, addr
	LDA memVal                                                   ; 
	PUSH_TABLE_ADDR[tableAddr] addr

.ENDM

_F}_6502_STACK_JUMP_TABLE_MACROS



