

.MACRO COPY_16_ZP_TO_ZP[source_dest] source, dest
   LDA source                                             ; SET $3E/$3F = BALL X
	STA dest                                                ;
	LDA source + 1                                         ;
	STA dest+1                                                ;
.ENDM

;;; FIXES FOR RANDOM USES OF NONZERO PAGE INSTUCTIONS

.MACRO ADC_ABS_ZP zp_addr
	.db  $6D
	.db zp_addr
	.db  $00

.ENDM

.MACRO SBC_ABS_ZP zp_addr
	.db  $ED
	.db zp_addr
	.db  $00

.ENDM

.MACRO CMP_ABS_ZP zp_addr
	.db  $CD
	.db zp_addr
	.db  $00

.ENDM


.MACRO LDX_ABS_ZP zp_addr
	.db  $AE
	.db zp_addr
	.db  $00

.ENDM


.MACRO LDA_ABS_A_ZP zp_addr
	.db  $AD
	.db zp_addr
	.db  $00

.ENDM

.MACRO STA_ABS_A_ZP zp_addr
	.db  $8D
	.db zp_addr
	.db  $00

.ENDM

.MACRO STA_ABS_X_ZP zp_addr
	.db  $9D
	.db zp_addr
	.db  $00

.ENDM

.MACRO LDA_ABS_X_ZP zp_addr
	.db  $BD
	.db zp_addr
	.db  $00
	
.ENDM

.MACRO ORA_ABS_A_ZP zp_addr
	.db  $0D
	.db zp_addr
	.db  $00

.ENDM


.MACRO LDA_ABS_Y_ZP zp_addr
	.db  $B9
	.db zp_addr
	.db  $00
	
.ENDM


.MACRO COPY_16_BIT_A[var1_var2] mem1, mem2 
		LDA mem1                                              
		STA mem2                                               
		LDA mem1 +1                                              
		STA mem2 +1  
	
.ENDM


.MACRO COPY_16_BIT_XY[var1_var2] mem1, mem2 
	LDY mem1                                              
	LDX mem1 +1                                              
	STY mem2                                               
	STX mem2 +1                                               
	
.ENDM


.MACRO SAVE_ADDR16_TO_ZP_VAR[addr_zp] addr,zerop_addr				; *** could refactor
      LDA #<addr
      STA zerop_addr
      LDA #>addr
      STA zerop_addr+1
.ENDM

.MACRO SAVE_16_BIT_ZP_TO_SRAM[zp_sram] zp, sram_dest				; *** could refactor
      LDA zp
      STA sram_dest
      LDA zp + 1
      STA sram_dest+1
.ENDM

.MACRO SAVE_16_BIT_SRAM_TO_ZP[sram_zp] sram_dest, zp_dest 
      LDA sram_dest
      STA zp_dest
      LDA sram_dest + 1
      STA zp_dest + 1
.ENDM


.MACRO SAVE_ADDR16_Y_TO_ZEROPAGE addr,zerop_addr
      LDA (addr),Y
      STA zerop_addr
      LDA (addr+1),Y
      STA zerop_addr+1
.ENDM

.MACRO JUMP_TO_ADDR_VIA_RTS[addr] table_addr
      LDA table_addr+1,X
      PHA 
      LDA table_addr,X
      PHA   		  		
      RTS    
.ENDM


.MACRO FILL_BUFFER_Y_INDEX start, end, value
	length = start-end
	LDA #value
	LDY #length-1	
 @clear_loop:			
	STA  dest,Y
	DEY
	BPL @clear_loop 
ENDM  

.MACRO FILL_DEST_Y_INDEX dest, length, value
	LDY #length
	LDA #value	
 @clear_loop:			
	STA  dest,Y
	DEY
	BPL @clear_loop 
.ENDM       		



.MACRO CLEAR_ZP_Y_INDEX start,length
    end = start + length 

	LDA #$00
	LDY #length
 @clear_loop:			
	STA end,Y
	DEY
	BPL @clear_loop  
.ENDM


.MACRO CLEAR_RAM_Y_INDEX[start_length] start,len						; *** could maybe use one clear macro?

	new_length	= $100 - len 
	
	IF (start < $100 )
	new_index = $FFFF - (new_length - start - 1 ) 
	ELSE 
    new_index =  start - new_length
	ENDIF

    
    
	LDA #$00
	LDY #new_length
 @clear_loop:			
	STA new_index,Y
	INY
	BNE @clear_loop  
.ENDM

.MACRO SET_RAM_Y_INDEX[start_length_value] start,len, value
    new_length	= $100 - len
	
	IF (start < $100 )
	addr = $FFFF - (new_length - start - 1 ) 
	ELSE 
    addr =  start - new_length
	ENDIF
	
	LDA #value
	LDY #new_length
 @clear_loop:			
	STA addr,Y
	INY
	BNE @clear_loop  
.ENDM


.MACRO CLEAR_DEST_X_INDEX start_addr, end_addr
      	length = start_addr - end_addr
	LDA #$00
	LDY #length
 @clear_loop:			
	STA  dest,x
	DEY
	BPL @clear_loop  
.ENDM   


.MACRO TRANSFER_RAM_TO_SRAM_Y_INDEX[source_dest_length] source, dest, len

   new_length = (256 - len )
   
   IF (source - 256 ) < 0
      new_source = $FFFF + (source - 255) + len
   ELSE
      new_source = ( source - new_length )
   ENDIF 
   
   new_dest = ( dest - new_length ) 

	LDY #new_length
 @loop:
	LDA  new_source,Y	
	STA  new_dest,Y
	INY
	BNE @loop  
	
.ENDM 

.MACRO TRANSFER_SRAM_TO_RAM_Y_INDEX[source_dest_length] source, dest, len
   new_length = (256 - len ) 
   IF (dest - 256 ) < 0
      new_dest = $FFFF + (dest - 255) + len
   ELSE
      new_dest = ( dest - new_length )
   ENDIF 
   new_source = ( source - new_length ) 


	LDY #new_length
 @loop:
	LDA  new_source,Y	
	STA  new_dest,Y
	INY
	BNE @loop  
.ENDM 

.MACRO COPY_SRAM_TO_SRAM_Y_INDEX[source_dest_length] source, dest, len
   new_length = (256 - len ) 
   new_dest = ( dest - new_length )
   new_source = ( source - new_length ) 


	LDY #new_length
 @loop:
	LDA  new_source,Y	
	STA  new_dest,Y
	INY
	BNE @loop  
.ENDM 



.MACRO COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] source, dest, len
   new_length = (256 - len ) 
   IF (dest - 256 ) < 0
      new_dest = $FFFF + (dest - 255) + len
   ELSE
      new_dest = ( dest - new_length )
   ENDIF 
  
    IF (source - 256 ) < 0
      new_source = $FFFF + (source - 255) + len
   ELSE
      new_source = ( source - new_length )
   ENDIF 
 

	LDY #new_length
 @loop:
	LDA  new_source,Y	
	STA  new_dest,Y
	INY
	BNE @loop  
.ENDM 


   						