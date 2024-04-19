
_F{_MATH_MACROS

.MACRO ABS_A 
      BPL Exit    	
      EOR #$FF
      CLC
      ADC #$01  
      Exit:
.ENDM

.MACRO ABS_X[]
	  TXA  
      BPL Exit 
      EOR #$FF
      CLC
      ADC #$01
      TAX
      Exit:
.ENDM

.MACRO ABS_Y[]
	  TYA  
      BPL Exit 
      EOR #$FF
      CLC
      ADC #$01
      TAY
      Exit:
.ENDM



.MACRO ADD_ZP1_ZP2 zp1, zp2
	LDA zp1
	CLC	     		
    ADC zp2        
.ENDM



.MACRO ADD_8_BIT_CONST_TO_8BIT_ADDR[addr_val]   addr, value
	LDA addr						
	CLC							
	ADC #value						
	STA addr										
.ENDM



.MACRO ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val]   addr, value
	LDA addr						
	CLC							
	ADC #value						
	STA addr				
	LDA addr+1					
	ADC #$00						
	STA addr+1						
.ENDM

.MACRO ADD_16_BIT_ZP_TO_16BIT_ZP[source_dest]   source, dest
	LDA source						
	CLC							
	ADC dest						
	STA source				
	LDA source + 1					
	ADC dest + 1						
	STA source + 1						

.ENDM

.MACRO ADD_16_BIT_VAL_TO_24BIT_VAL_RAM[addr16_addr24]   addr16, addr24
	LDA addr24						
	CLC							
	ADC addr16						
	STA addr24				
	LDA addr24+1													
	ADC addr16+1						
	STA addr24+1
	LDA addr24+2												
	ADC #$00						
	STA addr24+2	

.ENDM




.MACRO ADD_Y_TO_16BIT_ADDR   addr 
	TYA						
	CLC							
	ADC addr						
	STA addr				
	LDA addr+1					
	ADC #$00						
	STA addr+1						

.ENDM

.MACRO ADD_A_TO_16BIT_ADDR   addr					
	CLC							
	ADC addr						
	STA addr				
	LDA addr+1					
	ADC #$00						
	STA addr+1						

.ENDM

.MACRO ADD_16BIT_CONST_TO_ZP[val_addr]  value, addr
	LDA addr					
	CLC							
	ADC #<value						
	STA addr					
	LDA addr+1					
	ADC #>value						
	STA addr+1						

.ENDM

.MACRO DIVIDE_2_SIGNED
      CMP #$80
      ROR	
.ENDM

.MACRO DIVIDE_4
      LSR
      LSR	
.ENDM

.MACRO DIVIDE_4_16BIT_ZP low,high
      LDA high
      LSR 
      LDA low
      ROR
      LSR 	
.ENDM

.MACRO DIVIDE_8
      LSR
      LSR
      LSR 
.ENDM

.MACRO UNSIGNED_DIVIDE_8[zp] mem
    LSR mem						                                                                ;
	ROR							                                                                ;
	LSR mem						                                                                ;
	ROR							                                                                ;
	LSR mem						                                                                ;	
	ROR							                                                                ; 
.ENDM

.MACRO UNSIGNED_16_BIT_DIVIDE_8[zp] mem
    LSR mem +1						                                                                ;
	ROR	mem						                                                                ;
	LSR mem +1						                                                                ;
	ROR	mem						                                                                ;
	LSR mem +1							                                                                ;	
	ROR	mem						                                                                ; 
.ENDM


.MACRO DIVIDE_16 
      LSR
      LSR
      LSR
      LSR 
.ENDM



.MACRO MOV16_ROM_TO_ZP_Y_INDEX source,dest				; moves value from 16 bit rom address to zp memory
     TAY							                             
	  LDA source,Y						       
	  STA dest					           
	  LDA source+1,Y						    
	  STA dest+1						         
.ENDM



.MACRO BIT_SHIFT_LEFT amnt
      
      REPT amnt
      ASL 
      ENDR        

.ENDM

.MACRO SHIFT_LEFT_2
	ASL
    ASL
.ENDM				   

.MACRO SHIFT_LEFT_4
      ASL
      ASL
      ASL
      ASL 
.ENDM

.MACRO LOG_SHIFT_RIGHT_2
      LSR
      LSR
.ENDM

.MACRO LOG_SHIFT_RIGHT_3
      LSR
      LSR
	  LSR
.ENDM

.MACRO LOG_SHIFT_RIGHT_4
      LSR
      LSR
      LSR
      LSR 
.ENDM


.MACRO DEC16 num
	lda num
	bne Low_only
	dec num+1
	Low_only:
	dec num
.ENDM


.MACRO INC_16 addr
	inc addr
	bne @exit
	inc addr+1
	@exit:
.ENDM

.MACRO NEGATE_A
	EOR #$FF
        CLC
	ADC #$01
.ENDM

.MACRO NEGATE_8_ZP zp_addr
	LDA #$00
 	SEC 
	SBC zp_addr
    STA zp_addr  
.ENDM

MACRO NEGATE_16_ZP zp_addr
	LDA #$00
 	SEC 
	SBC zp_addr
    STA zp_addr
	LDA #$00 
	SBC zp_addr+1
    STA zp_addr+1  
.ENDM



.MACRO SUBTRACT_ZP1_by_ZP2 zp1, zp2						; *** not used
	LDA zp1
	SEC	     		
    SBC zp2        
.ENDM

MACRO SUBTRACT_BY_ONE value
	SEC
	LDA value	     		
    SBC #$01  
	STA value       
.ENDM 



; = 16 bit value - 8 bit value
;

MACRO SUBTRACT_16BIT_MEM_BY_ONE addr
	LDA addr						
	SEC							
	SBC #$01						
	STA addr				
	LDA addr+1					
	SBC #$00						
	STA addr+1						

.ENDM

.MACRO SUB_16_BIT_MEM_BY_8BIT_MEM[mem1_mem12]   mem16, mem8
	LDA mem16						
	SEC							
	SBC mem8						
	STA mem16				
	LDA mem16+1					
	SBC #$00						
	STA mem16+1						
.ENDM


.MACRO SUBTRACT_16BIT_MEM_MINUS_8_BIT_CONST  addr, value
	LDA addr						
	SEC							
	SBC #value						
	STA addr				
	LDA addr+1					
	SBC #$00						
	STA addr+1						

.ENDM

; = 16 bit value - 16 bit value
;
.MACRO SUBTRACT_16BIT_MEM_MINUS_16_BIT_CONST  addr, value
	LDA addr						
	SEC							
	SBC #<value						
	STA addr				
	LDA addr+1					
	SBC #>value						
	STA addr+1						

.ENDM

.MACRO SUB_16_BIT_VAL_FROM_24BIT_VAL_RAM[addr16_addr24]   addr16, addr24
	LDA addr24						
	SEC							
	SBC addr16						
	STA addr24				
	LDA addr24+1													
	SBC addr16+1						
	STA addr24+1
	LDA addr24+2													
	SBC #$00						
	STA addr24+2	

.ENDM



.MACRO SUBTRACT_16BIT_ZP_SAVE_RESULT zp_1, zp_2, result
	LDA zp_1						
	SEC							
	SBC zp_2						
	STA result				
	LDA zp_1+1					
	SBC zp_2+1						
	STA result+1						

.ENDM

_F}_MATH_MACROS
