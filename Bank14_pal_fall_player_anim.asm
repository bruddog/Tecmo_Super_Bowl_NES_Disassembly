

.BASE $A000

_F{_PALLETTE_DATA

BACKGROUND_PALLETE_TABLE:
.INCBIN "TSB.nes", $1A010, $3C0
.PAD $A600, $FF

SPRITE_PALLETE_TABLE:
.INCBIN "TSB.nes", $1A610, $530
.PAD $AC00, $FF

CHANGING_PALLETE_POINTERS:

.WORD CHANGING_PAL_1_DATA
.WORD CHANGING_PAL_2_DATA
.WORD CHANGING_PAL_3_DATA
.WORD CHANGING_PAL_4_DATA
.WORD CHANGING_PAL_5_DATA
.WORD CHANGING_PAL_6_DATA
.WORD CHANGING_PAL_7_DATA
.WORD CHANGING_PAL_8_DATA
.WORD CHANGING_PAL_9_DATA
.WORD CHANGING_PAL_10_DATA
.WORD CHANGING_PAL_11_DATA
.WORD CHANGING_PAL_12_DATA
.WORD CHANGING_PAL_13_DATA
.WORD CHANGING_PAL_14_DATA
.WORD CHANGING_PAL_15_DATA
.WORD CHANGING_PAL_16_DATA


CHANGING_PAL_1_DATA:
.INCBIN "TSB.nes", $1AC30, $90

CHANGING_PAL_2_DATA:
.INCBIN "TSB.nes", $1ACC0, $16

CHANGING_PAL_3_DATA:
.INCBIN "TSB.nes", $1ACD6, $07

CHANGING_PAL_4_DATA:
.INCBIN "TSB.nes", $1ACDD, $19

CHANGING_PAL_5_DATA:
.INCBIN "TSB.nes", $1ACF6, $25

CHANGING_PAL_6_DATA:
.INCBIN "TSB.nes", $1AD1B, $0A

CHANGING_PAL_7_DATA:
.INCBIN "TSB.nes", $1AD25, $88

CHANGING_PAL_8_DATA:
.INCBIN "TSB.nes", $1ADAD, $25

CHANGING_PAL_9_DATA:
.INCBIN "TSB.nes", $1ADD2, $50

CHANGING_PAL_10_DATA:
.INCBIN "TSB.nes", $1AE22, $2E

CHANGING_PAL_11_DATA:
.INCBIN "TSB.nes", $1AE50, $13

CHANGING_PAL_12_DATA:
.INCBIN "TSB.nes", $1AE63, $0B

CHANGING_PAL_13_DATA:
.INCBIN "TSB.nes", $1AE6E, $07

CHANGING_PAL_14_DATA:
.INCBIN "TSB.nes", $1AE75, $07

CHANGING_PAL_15_DATA:
.INCBIN "TSB.nes", $1AE7C, $04

CHANGING_PAL_16_DATA:
.INCBIN "TSB.nes", $1AE80, $49

.PAD $B000, $FF 

_F}_PALLETTE_DATA

.MACRO SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] addr
	  
	  .DB $80 ,>addr , <addr  

.ENDM

_F{_THROWN_PLAYER_POINTER_TABLES
									                                             										                                         										                                      																				
																							 ; THROWN PLAYER ROLL ANIMATIONS POINTERS AT 0X1B010 
																							 ; ALL GO IN CLOCKWISE ORDER FROM LEFT TO RIGHT 
FLY_BACK_TO_GROUND_8_DIR_SHORT_POINTER_TABLE: 					                             ; B000		~ 4 YARDS
		.WORD FLY_BACK_TO_GROUND_SHORT_LEFT                                                  ; LEFT
        .WORD FLY_BACK_TO_GROUND_SHORT_UP_LEFT                                               ; UP-LEFT
        .WORD FLY_BACK_TO_GROUND_SHORT_UP                                                    ; UP
        .WORD FLY_BACK_TO_GROUND_SHORT_UP_RIGHT                                              ; UP-RIGHT
        .WORD FLY_BACK_TO_GROUND_SHORT_RIGHT                                                 ; RIGHT
        .WORD FLY_BACK_TO_GROUND_SHORT_DOWN_RIGHT                                            ; DOWN-RIGHT
        .WORD FLY_BACK_TO_GROUND_SHORT_DOWN                                                  ; DOWN
        .WORD FLY_BACK_TO_GROUND_SHORT_DOWN_LEFT                                             ; DOWN-LEFT

ROLLING_TUMBLE_16_DIR_MEDIUM_POINTER_TABLE:						                             ;  (0XB010)  ~ 6 YARDS
        .WORD ROLLING_TUMBLE_MEDIUM_LEFT                                                     ; LEFT 		
        .WORD ROLLING_TUMBLE_MEDIUM_LEFT_UP                                                  ; LEFT-UP			
        .WORD ROLLING_TUMBLE_MEDIUM_DIAG_UP_LEFT                                             ; DIAG-UP-LEFT
        .WORD ROLLING_TUMBLE_MEDIUM_DIAG_LEFT_UP                                             ; UP-LEFT
        .WORD ROLLING_TUMBLE_MEDIUM_UP                                                       ; UP 
        .WORD ROLLING_TUMBLE_MEDIUM_UP_RIGHT                                                 ; UP-RIGHT
        .WORD ROLLING_TUMBLE_MEDIUM_DIAG_UP_RIGHT                                            ; DIAG-UP-RIGHT
        .WORD ROLLING_TUMBLE_MEDIUM_RIGHT_UP                                                 ; RIGHT-UP
        .WORD ROLLING_TUMBLE_MEDIUM_RIGHT                                                    ; RIGHT
        .WORD ROLLING_TUMBLE_MEDIUM_RIGHT_DOWN                                               ; RIGHT_DOWN
        .WORD ROLLING_TUMBLE_MEDIUM_DIAG_DOWN_RIGHT                                          ; DIAG-DOWN-RIGHT
        .WORD ROLLING_TUMBLE_MEDIUM_DOWN_RIGHT                                               ; DOWN-RIGHT
        .WORD ROLLING_TUMBLE_MEDIUM_DOWN                                                     ; DOWN
        .WORD ROLLING_TUMBLE_MEDIUM_DOWN_LEFT                                                ; DOWN-LEFT
        .WORD ROLLING_TUMBLE_MEDIUM_DIAG_DOWN_LEFT                                           ; DIAG-DOWN-LEFT
        .WORD ROLLING_TUMBLE_MEDIUM_LEFT_DOWN                                                ; LEFT-DOWN

FLY_BACK_TO_GROUND_8_DIR_MEDIUM_POINTER_TABLE:						                         ;  (5-7 YARDS) (0XB030) FROM BANK 21
        .WORD FLY_BACK_TO_GROUND_MEDIUM_LEFT                                                 ; LEFT
        .WORD FLY_BACK_TO_GROUND_MEDIUM_UP_LEFT                                              ; UP-LEFT
        .WORD FLY_BACK_TO_GROUND_MEDIUM_UP                                                   ; UP
        .WORD FLY_BACK_TO_GROUND_MEDIUM_UP_RIGHT                                             ; UP-RIGHT
        .WORD FLY_BACK_TO_GROUND_MEDIUM_RIGHT                                                ; RIGHT
        .WORD FLY_BACK_TO_GROUND_MEDIUM_DOWN_RIGHT                                           ; DOWN-RIGHT
        .WORD FLY_BACK_TO_GROUND_MEDIUM_DOWN                                                 ; DOWN
        .WORD FLY_BACK_TO_GROUND_MEDIUM_DOWN_LEFT                                            ; DOWN-LEFT

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_8_DIR_POINTER_TABLE:						 		         ;    8 DIRECTION FLY BACK ON TO GROUND W/ROLLING TUMBLE (8-12 YARDS) (0XB040) FROM BANK 21
        .WORD FLY_BACK_TO_GROUND_ROLLING_TUMBLE_LEFT                                         ; LEFT
        .WORD FLY_BACK_TO_GROUND_ROLLING_TUMBLE_UP_LEFT                                      ; UP-LEFT
        .WORD FLY_BACK_TO_GROUND_ROLLING_TUMBLE_UP                                           ; UP
        .WORD FLY_BACK_TO_GROUND_ROLLING_TUMBLE_UP_RIGHT                                     ; UP-RIGHT
        .WORD FLY_BACK_TO_GROUND_ROLLING_TUMBLE_RIGHT                                        ; RIGHT
        .WORD FLY_BACK_TO_GROUND_ROLLING_TUMBLE_DOWN_RIGHT                                   ; DOWN-RIGHT
        .WORD FLY_BACK_TO_GROUND_ROLLING_TUMBLE_DOWN                                         ; DOWN
        .WORD FLY_BACK_TO_GROUND_ROLLING_TUMBLE_DOWN_LEFT                                    ; DOWN-LEFT

CHOP_BLOCK_8_DIR_POINTER_TABLE:						 		                                 ; 8 DIRECTION CHOP BLOCK TUMBLES (4-8 YARDS) (0XB050) FROM BANK 21
        .WORD CHOP_BLOCK_TUMBLE_LEFT                                                         ; LEFT 
        .WORD CHOP_BLOCK_TUMBLE_UP_LEFT                                                      ; UP-LEFT
        .WORD CHOP_BLOCK_TUMBLE_UP                                                           ; UP 
        .WORD CHOP_BLOCK_TUMBLE_UP_RIGHT                                                     ; UP-RIGHT
        .WORD CHOP_BLOCK_TUMBLE_RIGHT                                                        ; RIGHT
        .WORD CHOP_BLOCK_TUMBLE_DOWN_RIGHT                                                   ; DOWN-RIGHT
        .WORD CHOP_BLOCK_TUMBLE_DOWN                                                         ; DOWN
        .WORD CHOP_BLOCK_TUMBLE_DOWN_LEFT                                                    ; DOWN-LEFT

UNUSED_2_DIR_SUPERMAN_TUMBLES			                                                     ; 2 DIRECTION "SUPERMAN" TUMBLE ONTO BACK  UNUSED 
	    .WORD UNUSED_SUPERMAN_TUMBLE_LEFT                                                    ; LEFT  (~5 YARDS) 
	    .WORD UNUSED_SUPERMAN_TUMBLE_RIGHT                                                   ; RIGHT

UNUSED_2_DIR_THROWN_TO_BACK_LAND_ON_BACK		
	    .WORD UNUSED_THROWN_TO_BACK_LAND_ON_BACK_RIGHT                                       ; DOWN (~7 YARDS) 
	    .WORD UNUSED_THROWN_TO_BACK_LAND_ON_BACK_LEFT                                        ; UP       						 

UNUSED_2_DIR_TOSS_ON_TO_BACK																 ; 2 DIRECTION TOSS ONTO BACK DIF SPRITE  UNUSED (1.5 YARDS)
        .WORD UNUSED_DIAG_SPIN_TO_LAY_ON_BACK_RIGHT                                          ; DIAG-RIGHT
        .WORD UNUSED_DIAG_SPIN_TO_LAY_ON_BACK_LEFT                                           ; DIAG-LEFT
        
UNUSED_2_DIR_SPIN_ON_TO_BACK							                                     ; MULTI SPIN ONTO BACK DIRECTION  UNUSED (0 yards x, ~1.5 yards y) 
        .WORD SPIN_ON_TO_BACK_RIGHT                                                          ; LEFT
        .WORD SPIN_ON_TO_BACK_LEFT                                                           ; RIGHT

UNUSED_TUMBLES						                                                         ; OTHER UNUSED TUMBLES
    	.WORD FIVE_SPRITE_TUMBLE_LAND_ON_BACK_LEFT                                           ; 5 SPRITE TUMBLE (1 YARD)
   	    .WORD FIVE_SPRITE_TUMBLE_LAND_ON_BACK_RIGHT                                          ; 5 SPRITE TUMBLE (1 YARD)
       
		.WORD BROKEN_TUMBLE_ONE                                                              ; SPINNING BROKEN DUE TO LANDING SPRITE BEING QB
        .WORD BROKEN_TUMBLE_TWO                                                                      ; SPINNING BROKEN DUE TO LANDING SPRITE BEING QB
        
		.WORD EMPTY_TUMBLE_SEQUENCE                                                          ; EMPTY *** can remove
        .WORD EMPTY_TUMBLE_SEQUENCE                                                          ; EMPTY *** 
        .WORD EMPTY_TUMBLE_SEQUENCE                                                          ; EMPTY *** 
        .WORD EMPTY_TUMBLE_SEQUENCE                                                          ; EMPTY ***
		
_F}_THROWN_PLAYER_POINTER_TABLES		

_F{_FLY_BACK_TO_GROUND_SHORT_ANIMATION_DATA


FLY_BACK_TO_GROUND_SHORT_LEFT:						; FLY BACK ON TO GROUND LEFT
.DB $0D             				; 0 yards Y, left 3/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_LEFT_1  				; Set sprite info addr to:BD04
.DB $FD             				; up 1/8 yards, left 3/8 yards
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $0E             				; 0 yards Y, left 2/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_LEFT_2
.DB $0C             				; 0 yards Y, left 4/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $2E             				; down 2/8 yards, left 2/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FD             				; up 1/8 yards, left 3/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0E             				; 0 yards Y, left 2/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_LEFT_SIDE
.DB $2B             				; down 2/8 yards, left 5/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 80
 							; Spr changes: 3
 							; Tot y yards: 0.25
 							; Tot x yards: -4.125
							; TOT YARDS: 4.1

FLY_BACK_TO_GROUND_SHORT_UP_LEFT:						; FLY BACK ON TO GROUND UP-LEFT
.DB $DE             				; up 3/8 yards, left 2/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_1   				
.DB $DE             				; up 3/8 yards, left 2/8 yards
.DB $EF             				; up 2/8 yards, left 1/8 yards
.DB $84 ,$FF         				; For 4 frames  up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_2
.DB $DE             				; up 3/8 yards, left 2/8 yards
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $83 ,$FF         				; For 3 frames  up 1/8 yards, left 1/8 yards
.DB $85 ,$00         				; For 5 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 78
 							; Spr changes: 2
 							; Tot y yards: -2.375
 							; Tot x yards: -2.5
							; TOT YARDS: 3.4

FLY_BACK_TO_GROUND_SHORT_UP:		; FLY BACK ON TO GROUND UP
.DB $E0             				; up 2/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_1
.DB $C0             				; up 4/8 yards,  0 yards X
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $84 ,$F0         				; For 4 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_2
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$E0         				; For 2 frames  up 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 80
 							; Spr changes: 2
 							; Tot y yards: -2.25
 							; Tot x yards: 0
							; TOT YARDS: 2.25

FLY_BACK_TO_GROUND_SHORT_UP_RIGHT:	; FLY BACK ON TO GROUND UP-RIGHT
.DB $D2             				; up 3/8 yards, right 2/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_1
.DB $D2             				; up 3/8 yards, right 2/8 yards
.DB $E1             				; up 2/8 yards, right 1/8 yards
.DB $84 ,$F1         				; For 4 frames  up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_2

.DB $D2             				; up 3/8 yards, right 2/8 yards
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $83 ,$F1         				; For 3 frames  up 1/8 yards, right 1/8 yards
.DB $85 ,$00         				; For 5 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 78
 							; Spr changes: 2
 							; Tot y yards: -2.375
 							; Tot x yards: 2.5
							; TOT YARDS: 3.4

FLY_BACK_TO_GROUND_SHORT_RIGHT:						; FLY BACK ON TO GROUND RIGHT
.DB $03             				; 0 yards Y, right 3/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_RIGHT_1

.DB $F3             				; up 1/8 yards, right 3/8 yards
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $02             				; 0 yards Y, right 2/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_RIGHT_2

.DB $04             				; 0 yards Y, right 4/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $22             				; down 2/8 yards, right 2/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F3             				; up 1/8 yards, right 3/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $02             				; 0 yards Y, right 2/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_RIGHT_SIDE

.DB $25             				; down 2/8 yards, right 5/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 80
 							; Spr changes: 3
 							; Tot y yards: 0.25
 							; Tot x yards: 4.125
       ; TOT YARDS: 4.1

FLY_BACK_TO_GROUND_SHORT_DOWN_RIGHT:						; FLY BACK ON TO GROUND DOWN-RIGHT
.DB $01             				; 0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_RIGHT_1 
   				
.DB $02             				; 0 yards Y, right 2/8 yards
.DB $82 ,$22         				; For 2 frames  down 2/8 yards, right 2/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_RIGHT_2

.DB $33             				; down 3/8 yards, right 3/8 yards
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $02             				; 0 yards Y, right 2/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$11         				; For 4 frames  down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 72
 							; Spr changes: 2
 							; Tot y yards: 2.75
 							; Tot x yards: 2.875
							; TOT YARDS: 4.0

FLY_BACK_TO_GROUND_SHORT_DOWN:		; FLY BACK ON TO GROUND DOWN
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_1

.DB $E0             				; up 2/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_2

.DB $40             				; down 4/8 yards,  0 yards X
.DB $82 ,$30         				; For 2 frames  down 3/8 yards,  0 yards X
.DB $82 ,$20         				; For 2 frames  down 2/8 yards,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$10         				; For 4 frames  down 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 82
 							; Spr changes: 2
 							; Tot y yards: 3.375
 							; Tot x yards: 0
							; TOT YARDS: 3.375

FLY_BACK_TO_GROUND_SHORT_DOWN_LEFT:						; FLY BACK ON TO GROUND DOWN-LEFT
.DB $0F             				; 0 yards Y, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_LEFT_1
.DB $0E             				; 0 yards Y, left 2/8 yards
.DB $82 ,$2E         				; For 2 frames  down 2/8 yards, left 2/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_LEFT_2
.DB $3D             				; down 3/8 yards, left 3/8 yards
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $0E             				; 0 yards Y, left 2/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$1F         				; For 4 frames  down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 71
 							; Spr changes: 2
 							; Tot y yards: 2.75
 							; Tot x yards: -2.875
							; TOT YARDS: 4.0 
							
_F}_FLY_BACK_TO_GROUND_SHORT_ANIMATION_DATA							

_F{_ROLLING_TUMBLE_MEDIUM_ANIMATION_DATA

ROLLING_TUMBLE_MEDIUM_LEFT:						; ROLLING TUMBLE LEFT
.DB $0F             				; 0 yards Y, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_LEFT_1

.DB $FB             				; up 1/8 yards, left 5/8 yards
.DB $FC             				; up 1/8 yards, left 4/8 yards
.DB $FD             				; up 1/8 yards, left 3/8 yards
.DB $0E             				; 0 yards Y, left 2/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_LEFT

.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards
.DB $8F ,$0F         				; For 15 frames  0 yards Y, left 1/8 yards
.DB $89 ,$0F         				; For 9 frames  0 yards Y, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_LEFT
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 92
 							; Spr changes: 3
 							; Tot y yards: 0.125
 							; Tot x yards: -6.25
							; TOT YARDS: 6.3

ROLLING_TUMBLE_MEDIUM_LEFT_UP:
.DB $0F             				; 0 yards Y, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_LEFT_1

.DB $DB             				; up 3/8 yards, left 5/8 yards
.DB $EC             				; up 2/8 yards, left 4/8 yards
.DB $FD             				; up 1/8 yards, left 3/8 yards
.DB $0E             				; 0 yards Y, left 2/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_LEFT

.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_LEFT

.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 92
 							; Spr changes: 3
 							; Tot y yards: -1.5
 							; Tot x yards: -6.25
							; TOT YARDS: 6.4
ROLLING_TUMBLE_MEDIUM_DIAG_UP_LEFT:
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_1  
 				
.DB $CE             				; up 4/8 yards, left 2/8 yards
.DB $CD             				; up 4/8 yards, left 3/8 yards
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_LEFT

.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_LEFT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 97
 							; Spr changes: 3
 							; Tot y yards: -3.25
 							; Tot x yards: -4.5
							; TOT YARDS: 5.6

ROLLING_TUMBLE_MEDIUM_DIAG_LEFT_UP:
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_1  
 				
.DB $CF             				; up 4/8 yards, left 1/8 yards
.DB $C0             				; up 4/8 yards,  0 yards X
.DB $EF             				; up 2/8 yards, left 1/8 yards
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_LEFT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_LEFT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 96
 							; Spr changes: 3
 							; Tot y yards: -3.5
 							; Tot x yards: -1.5
							; TOT YARDS: 3.8

ROLLING_TUMBLE_MEDIUM_UP:
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_1
   				
.DB $82 ,$C0         				; For 2 frames  up 4/8 yards,  0 yards X
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_LEFT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_LEFT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 94
 							; Spr changes: 3
 							; Tot y yards: -3. 5
 							; Tot x yards: -0
							;  TOT YARDS: -3.5

ROLLING_TUMBLE_MEDIUM_UP_RIGHT:
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_1

.DB $C1             				; up 4/8 yards, right 1/8 yards
.DB $C0             				; up 4/8 yards,  0 yards X
.DB $E1             				; up 2/8 yards, right 1/8 yards
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_RIGHT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_RIGHT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 96
 							; Spr changes: 3
 							; Tot y yards: -3.5
 							; Tot x yards: 1.5
							; TOT YARDS: 3.8

ROLLING_TUMBLE_MEDIUM_DIAG_UP_RIGHT:
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_1

.DB $C2             				; up 4/8 yards, right 2/8 yards
.DB $C3             				; up 4/8 yards, right 3/8 yards
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_RIGHT

.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_RIGHT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 97
 							; Spr changes: 3
 							; Tot y yards: -3.25
 							; Tot x yards: 4.5
							; TOT YARDS: 5.6

ROLLING_TUMBLE_MEDIUM_RIGHT_UP:
.DB $01             				; 0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_RIGHT_1
    				
.DB $D5             				; up 3/8 yards, right 5/8 yards
.DB $E4             				; up 2/8 yards, right 4/8 yards
.DB $F3             				; up 1/8 yards, right 3/8 yards
.DB $02             				; 0 yards Y, right 2/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT

.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT_ON_GROUND

.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 92
 							; Spr changes: 3
 							; Tot y yards: -1.5
 							; Tot x yards: 6.25
							; TOT YARDS: 6.4

ROLLING_TUMBLE_MEDIUM_RIGHT:
.DB $01             				; 0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_RIGHT_1 
   				
.DB $F5             				; up 1/8 yards, right 5/8 yards
.DB $F4             				; up 1/8 yards, right 4/8 yards
.DB $F3             				; up 1/8 yards, right 3/8 yards
.DB $02             				; 0 yards Y, right 2/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT

.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards
.DB $8F ,$01         				; For 15 frames  0 yards Y, right 1/8 yards
.DB $89 ,$01         				; For 9 frames  0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT_ON_GROUND

.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 92
 							; Spr changes: 3
 							; Tot y yards: -0.125
 							; Tot x yards: 6.25
							; TOT YARDS: 6.3

ROLLING_TUMBLE_MEDIUM_RIGHT_DOWN:
.DB $01             				; 0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_RIGHT_1
    				
.DB $F5             				; up 1/8 yards, right 5/8 yards
.DB $F4             				; up 1/8 yards, right 4/8 yards
.DB $03             				; 0 yards Y, right 3/8 yards
.DB $02             				; 0 yards Y, right 2/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT

.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT_ON_GROUND

.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 94
 							; Spr changes: 3
 							; Tot y yards: 2.215
 							; Tot x yards: 6.375
							; TOT YARDS: 6.7

ROLLING_TUMBLE_MEDIUM_DIAG_DOWN_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_RIGHT_TUMBLE_START

.DB $E1             				; up 2/8 yards, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $31             				; down 3/8 yards, right 1/8 yards
.DB $42             				; down 4/8 yards, right 2/8 yards
.DB $63             				; down 6/8 yards, right 3/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_RIGHT

.DB $8F ,$11         				; For 15 frames  down 1/8 yards, right 1/8 yards
.DB $86 ,$11         				; For 6 frames  down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_RIGHT

.DB $11						; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 92
 							; Spr changes: 3
 							; Tot y yards: 4.75
 							; Tot x yards: 4.875
							; TOT YARDS: 6.8

ROLLING_TUMBLE_MEDIUM_DOWN_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_RIGHT_TUMBLE_START

.DB $F0             				; up 1/8 yards,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $31             				; down 3/8 yards, right 1/8 yards
.DB $51             				; down 5/8 yards, right 1/8 yards
.DB $62             				; down 6/8 yards, right 2/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_RIGHT

.DB $E0             				; up 2/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_RIGHT

.DB $11 							; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 94
 							; Spr changes: 3
 							; Tot y yards: 5.125
 							; Tot x yards: 2.625
							; TOT YARDS: 5.8



ROLLING_TUMBLE_MEDIUM_DOWN:
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_LEFT_TUMBLE_START

.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
.DB $50             				; down 5/8 yards,  0 yards X
.DB $70             				; down 7/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_LEFT

.DB $E0             				; up 2/8 yards,  0 yards X
.DB $8F ,$10         				; For 15 frames  down 1/8 yards,  0 yards X
.DB $89 ,$10         				; For 9 frames  down 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_LEFT

.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 97
 							; Spr changes: 3
 							; Tot y yards: 5.625
 							; Tot x yards: 0
							; TOT YARDS: -3.5
ROLLING_TUMBLE_MEDIUM_DOWN_LEFT:
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_LEFT_TUMBLE_START

.DB $F0             				; up 1/8 yards,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $3F             				; down 3/8 yards, left 1/8 yards
.DB $5F             				; down 5/8 yards, left 1/8 yards
.DB $6E             				; down 6/8 yards, left 2/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_LEFT

.DB $E0             				; up 2/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_LEFT

.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 94
 							; Spr changes: 3
 							; Tot y yards: 5.125
 							; Tot x yards: -2.625
							; TOT YARDS: 5.8

ROLLING_TUMBLE_MEDIUM_DIAG_DOWN_LEFT:
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_LEFT_TUMBLE_START

.DB $EF             				; up 2/8 yards, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $3F             				; down 3/8 yards, left 1/8 yards
.DB $4E             				; down 4/8 yards, left 2/8 yards
.DB $6D             				; down 6/8 yards, left 3/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_LEFT

.DB $8F ,$1F         				; For 15 frames  down 1/8 yards, left 1/8 yards
.DB $86 ,$1F         				; For 6 frames  down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_LEFT

.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 92
 							; Spr changes: 3
 							; Tot y yards: 4.75
 							; Tot x yards: -4.875
							; TOT YARDS: 6.8

ROLLING_TUMBLE_MEDIUM_LEFT_DOWN:
.DB $0F             				; 0 yards Y, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_LEFT_1

.DB $FB             				; up 1/8 yards, left 5/8 yards
.DB $FC             				; up 1/8 yards, left 4/8 yards
.DB $0D             				; 0 yards Y, left 3/8 yards
.DB $0E             				; 0 yards Y, left 2/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_LEFT

.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_LEFT

.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 94
 							; Spr changes: 3
 							; Tot y yards: 2.125
 							; Tot x yards: -6.375
							; TOT YARDS: 6.7
							
_F}_ROLLING_TUMBLE_MEDIUM_ANIMATION_DATA							

_F{_FLY_BACK_TO_GROUND_MEDIUM_ANIMATION_DATA

FLY_BACK_TO_GROUND_MEDIUM_LEFT:
.DB $CB             				; up 4/8 yards, left 5/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_LEFT_1

.DB $DD             				; up 3/8 yards, left 3/8 yards
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $84 ,$FF         				; For 4 frames  up 1/8 yards, left 1/8 yards
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $84 ,$0F         				; For 4 frames  0 yards Y, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_LEFT_2

.DB $DF             				; up 3/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $84 ,$1F         				; For 4 frames  down 1/8 yards, left 1/8 yards
.DB $2E             				; down 2/8 yards, left 2/8 yards
.DB $3D             				; down 3/8 yards, left 3/8 yards
.DB $4E             				; down 4/8 yards, left 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $DD             				; up 3/8 yards, left 3/8 yards
.DB $ED             				; up 2/8 yards, left 3/8 yards
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $83 ,$0E         				; For 3 frames  0 yards Y, left 2/8 yards
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $1E             				; down 1/8 yards, left 2/8 yards
.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_LEFT_SIDE

.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 83
 							; Spr changes: 3
 							; Tot y yards: 0.25
 							; Tot x yards: -6.875
							; TOT YARDS: -6.9

FLY_BACK_TO_GROUND_MEDIUM_UP_LEFT:
.DB $BD             				; up 5/8 yards, left 3/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_1 
  				
.DB $CE             				; up 4/8 yards, left 2/8 yards
.DB $82 ,$DF         				; For 2 frames  up 3/8 yards, left 1/8 yards
.DB $85 ,$EF         				; For 5 frames  up 2/8 yards, left 1/8 yards
.DB $83 ,$FF         				; For 3 frames  up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_2

.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$1F         				; For 3 frames  down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $82 ,$2F         				; For 2 frames  down 2/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$CE         				; For 2 frames  up 4/8 yards, left 2/8 yards
.DB $82 ,$DF         				; For 2 frames  up 3/8 yards, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $3E             				; down 3/8 yards, left 2/8 yards
.DB $CE             				; up 4/8 yards, left 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$FF         				; For 2 frames  up 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $88 ,$00         				; For 8 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_RIGHT_SIDE

.DB $0D             				; 0 yards Y, left 3/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 105
 							; Spr changes: 3
 							; Tot y yards: -4.375
 							; Tot x yards: -5.875
							; TOT YARDS: 7.3

FLY_BACK_TO_GROUND_MEDIUM_UP:
.DB $B0             				; up 5/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_1

.DB $C0             				; up 4/8 yards,  0 yards X
.DB $82 ,$D0         				; For 2 frames  up 3/8 yards,  0 yards X
.DB $85 ,$E0         				; For 5 frames  up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $87 ,$00         				; For 7 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_2

.DB $E0             				; up 2/8 yards,  0 yards X
.DB $85 ,$10         				; For 5 frames  down 1/8 yards,  0 yards X
.DB $82 ,$20         				; For 2 frames  down 2/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$C0         				; For 2 frames  up 4/8 yards,  0 yards X
.DB $82 ,$D0         				; For 2 frames  up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
.DB $C0             				; up 4/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_LEFT_SIDE

.DB $00             				; 0 yards Y,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$F0         				; For 2 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 101
 							; Spr changes: 3
 							; Tot y yards: -5.0
 							; Tot x yards: 0.0
							; TOT YARDS: 5.0
FLY_BACK_TO_GROUND_MEDIUM_UP_RIGHT:
.DB $B3             				; up 5/8 yards, right 3/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_1

.DB $C2             				; up 4/8 yards, right 2/8 yards
.DB $82 ,$D1         				; For 2 frames  up 3/8 yards, right 1/8 yards
.DB $85 ,$E1         				; For 5 frames  up 2/8 yards, right 1/8 yards
.DB $83 ,$F1         				; For 3 frames  up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_2

.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$11         				; For 3 frames  down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $82 ,$21         				; For 2 frames  down 2/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$C2         				; For 2 frames  up 4/8 yards, right 2/8 yards
.DB $82 ,$D1         				; For 2 frames  up 3/8 yards, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $32             				; down 3/8 yards, right 2/8 yards
.DB $C2             				; up 4/8 yards, right 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$F1         				; For 2 frames  up 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $88 ,$00         				; For 8 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_LEFT_SIDE

.DB $03             				; 0 yards Y, right 3/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 105
 							; Spr changes: 3
 							; Tot y yards: -4.375
 							; Tot x yards: 5.875
							; TOT YARDS: 7.3

FLY_BACK_TO_GROUND_MEDIUM_RIGHT:
.DB $C5             				; up 4/8 yards, right 5/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_RIGHT_1

.DB $D3             				; up 3/8 yards, right 3/8 yards
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $84 ,$F1         				; For 4 frames  up 1/8 yards, right 1/8 yards
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $84 ,$01         				; For 4 frames  0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_RIGHT_2

.DB $D1             				; up 3/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $84 ,$11         				; For 4 frames  down 1/8 yards, right 1/8 yards
.DB $22             				; down 2/8 yards, right 2/8 yards
.DB $33             				; down 3/8 yards, right 3/8 yards
.DB $42             				; down 4/8 yards, right 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $D3             				; up 3/8 yards, right 3/8 yards
.DB $E3             				; up 2/8 yards, right 3/8 yards
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $83 ,$02         				; For 3 frames  0 yards Y, right 2/8 yards
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $12             				; down 1/8 yards, right 2/8 yards
.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_RIGHT_SIDE

.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 83
 							; Spr changes: 3
 							; Tot y yards: 0.25
 							; Tot x yards: 6.875
							; TOT YARDS: 6.9

FLY_BACK_TO_GROUND_MEDIUM_DOWN_RIGHT:
.DB $D1             				; up 3/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_RIGHT_TUMBLE_START

.DB $82 ,$E1         				; For 2 frames  up 2/8 yards, right 1/8 yards
.DB $82 ,$F1         				; For 2 frames  up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $83 ,$11         				; For 3 frames  down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_RIGHT_2

.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards
.DB $83 ,$21         				; For 3 frames  down 2/8 yards, right 1/8 yards
.DB $83 ,$31         				; For 3 frames  down 3/8 yards, right 1/8 yards
.DB $83 ,$41         				; For 3 frames  down 4/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$F1         				; For 2 frames  up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $83 ,$11         				; For 3 frames  down 1/8 yards, right 1/8 yards
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $82 ,$31         				; For 2 frames  down 3/8 yards, right 1/8 yards
.DB $83 ,$11         				; For 3 frames  down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_RIGHT_SIDE

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 86
 							; Spr changes: 3
 							; Tot y yards: 4.375
 							; Tot x yards: 4.25
							; TOT YARDS: 6.1

FLY_BACK_TO_GROUND_MEDIUM_DOWN:
.DB $E0             				; up 2/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_1

.DB $E0             				; up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_2

.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $83 ,$20         				; For 3 frames  down 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $83 ,$30         				; For 3 frames  down 3/8 yards,  0 yards X
.DB $84 ,$40         				; For 4 frames  down 4/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $84 ,$10         				; For 4 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $82 ,$30         				; For 2 frames  down 3/8 yards,  0 yards X
.DB $83 ,$10         				; For 3 frames  down 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_LEFT_SIDE

.DB $20             				; down 2/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 95
 							; Spr changes: 3
 							; Tot y yards: 5.125
 							; Tot x yards: 0.0
							; TOT YARDS: 5.1
FLY_BACK_TO_GROUND_MEDIUM_DOWN_LEFT:
.DB $DF             				; up 3/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_LEFT_TUMBLE_START

.DB $82 ,$EF         				; For 2 frames  up 2/8 yards, left 1/8 yards
.DB $82 ,$FF         				; For 2 frames  up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $83 ,$1F         				; For 3 frames  down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_LEFT_2

.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards
.DB $83 ,$2F         				; For 3 frames  down 2/8 yards, left 1/8 yards
.DB $83 ,$3F         				; For 3 frames  down 3/8 yards, left 1/8 yards
.DB $83 ,$4F         				; For 3 frames  down 4/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$FF         				; For 2 frames  up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $83 ,$1F         				; For 3 frames  down 1/8 yards, left 1/8 yards
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $82 ,$3F         				; For 2 frames  down 3/8 yards, left 1/8 yards
.DB $83 ,$1F         				; For 3 frames  down 1/8 yards, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_LEFT_SIDE
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 86
 							; Spr changes: 3
 							; Tot y yards: 4.375
 							; Tot x yards: -4.25
							; TOT YARDS: 6.1
							
_F}_FLY_BACK_TO_GROUND_MEDIUM_ANIMATION_DATA

_F{_FLY_BACK_TO_GROUND_ROLLING_TUMBLE_ANIMATION_DATA

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_LEFT:
.DB $CB             				; up 4/8 yards, left 5/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_LEFT_1 
  				
.DB $DD             				; up 3/8 yards, left 3/8 yards
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $84 ,$FF         				; For 4 frames  up 1/8 yards, left 1/8 yards
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $84 ,$0F         				; For 4 frames  0 yards Y, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_LEFT_2

.DB $DF             				; up 3/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $84 ,$1F         				; For 4 frames  down 1/8 yards, left 1/8 yards
.DB $2E             				; down 2/8 yards, left 2/8 yards
.DB $3D             				; down 3/8 yards, left 3/8 yards
.DB $4E             				; down 4/8 yards, left 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $DD             				; up 3/8 yards, left 3/8 yards
.DB $ED             				; up 2/8 yards, left 3/8 yards
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $83 ,$0E         				; For 3 frames  0 yards Y, left 2/8 yards
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $1E             				; down 1/8 yards, left 2/8 yards
.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_LEFT_1

.DB $0D             				; 0 yards Y, left 3/8 yards
.DB $0E             				; 0 yards Y, left 2/8 yards
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_LEFT

.DB $8E ,$0F         				; For 14 frames  0 yards Y, left 1/8 yards
.DB $8F ,$0F         				; For 15 frames  0 yards Y, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_LEFT

.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 128
 							; Spr changes: 5
 							; Tot y yards: 0.375
 							; Tot x yards: -12.25
							; TOT YARDS: 12.3

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_UP_LEFT:
.DB $BD             				; up 5/8 yards, left 3/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_1 
  				
.DB $CE             				; up 4/8 yards, left 2/8 yards
.DB $82 ,$DF         				; For 2 frames  up 3/8 yards, left 1/8 yards
.DB $85 ,$EF         				; For 5 frames  up 2/8 yards, left 1/8 yards
.DB $83 ,$FF         				; For 3 frames  up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_2

.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$1F         				; For 3 frames  down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $82 ,$2F         				; For 2 frames  down 2/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$CE         				; For 2 frames  up 4/8 yards, left 2/8 yards
.DB $82 ,$DF         				; For 2 frames  up 3/8 yards, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $3E             				; down 3/8 yards, left 2/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_LEFT_1  
 				
.DB $DD             				; up 3/8 yards, left 3/8 yards
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $82 ,$FF         				; For 2 frames  up 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_LEFT

.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_LEFT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 132
 							; Spr changes: 5
 							; Tot y yards: -7.0
 							; Tot x yards: -9.375
							; TOT YARDS: 11.7

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_UP:
.DB $B0             				; up 5/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_1

.DB $C0             				; up 4/8 yards,  0 yards X

.DB $82 ,$D0         				; For 2 frames  up 3/8 yards,  0 yards X
.DB $85 ,$E0         				; For 5 frames  up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $87 ,$00         				; For 7 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_2

.DB $E0             				; up 2/8 yards,  0 yards X

.DB $85 ,$10         				; For 5 frames  down 1/8 yards,  0 yards X
.DB $82 ,$20         				; For 2 frames  down 2/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$C0         				; For 2 frames  up 4/8 yards,  0 yards X
.DB $82 ,$D0         				; For 2 frames  up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_LEFT

.DB $83 ,$C0         				; For 3 frames  up 4/8 yards,  0 yards X
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_LEFT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 130
 							; Spr changes: 4
 							; Tot y yards: -8.25
 							; Tot x yards: 0.0
							; TOT YARDS: 8.2

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_UP_RIGHT:
.DB $B3             				; up 5/8 yards, right 3/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_1

.DB $C2             				; up 4/8 yards, right 2/8 yards

.DB $82 ,$D1         				; For 2 frames  up 3/8 yards, right 1/8 yards
.DB $85 ,$E1         				; For 5 frames  up 2/8 yards, right 1/8 yards
.DB $83 ,$F1         				; For 3 frames  up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_2

.DB $F1             				; up 1/8 yards, right 1/8 yards

.DB $83 ,$11         				; For 3 frames  down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $82 ,$21         				; For 2 frames  down 2/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$C2         				; For 2 frames  up 4/8 yards, right 2/8 yards
.DB $82 ,$D1         				; For 2 frames  up 3/8 yards, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $32             				; down 3/8 yards, right 2/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_UP_RIGHT_1

.DB $D3             				; up 3/8 yards, right 3/8 yards
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $82 ,$F1         				; For 2 frames  up 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_RIGHT

.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_RIGHT

.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 132
 							; Spr changes: 5
 							; Tot y yards: -7.0
 							; Tot x yards: 9.375
							; TOT YARDS: 11.7

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_RIGHT:
.DB $C5             				; up 4/8 yards, right 5/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_RIGHT_1

.DB $D3             				; up 3/8 yards, right 3/8 yards
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $84 ,$F1         				; For 4 frames  up 1/8 yards, right 1/8 yards
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $84 ,$01         				; For 4 frames  0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_RIGHT_2

.DB $D1             				; up 3/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $84 ,$11         				; For 4 frames  down 1/8 yards, right 1/8 yards
.DB $22             				; down 2/8 yards, right 2/8 yards
.DB $33             				; down 3/8 yards, right 3/8 yards
.DB $42             				; down 4/8 yards, right 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $D3             				; up 3/8 yards, right 3/8 yards
.DB $E3             				; up 2/8 yards, right 3/8 yards
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $83 ,$02         				; For 3 frames  0 yards Y, right 2/8 yards
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $12             				; down 1/8 yards, right 2/8 yards
.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_RIGHT_1 
   				
.DB $03             				; 0 yards Y, right 3/8 yards
.DB $02             				; 0 yards Y, right 2/8 yards
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT

.DB $8E ,$01         				; For 14 frames  0 yards Y, right 1/8 yards
.DB $8F ,$01         				; For 15 frames  0 yards Y, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT_ON_GROUND

.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 128
 							; Spr changes: 5
 							; Tot y yards: -0.375
 							; Tot x yards: 12.25
							; TOT YARDS: 12.3

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_DOWN_RIGHT:
.DB $D1             				; up 3/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_RIGHT_TUMBLE_START

.DB $82 ,$E1         				; For 2 frames  up 2/8 yards, right 1/8 yards
.DB $82 ,$F1         				; For 2 frames  up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $83 ,$11         				; For 3 frames  down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_RIGHT_2

.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards
.DB $83 ,$21         				; For 3 frames  down 2/8 yards, right 1/8 yards
.DB $83 ,$31         				; For 3 frames  down 3/8 yards, right 1/8 yards
.DB $83 ,$41         				; For 3 frames  down 4/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$F1         				; For 2 frames  up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $83 ,$11         				; For 3 frames  down 1/8 yards, right 1/8 yards
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $82 ,$31         				; For 2 frames  down 3/8 yards, right 1/8 yards
.DB $83 ,$11         				; For 3 frames  down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_RIGHT_TUMBLE_START

.DB $44             				; down 4/8 yards, right 4/8 yards
.DB $22             				; down 2/8 yards, right 2/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_RIGHT

.DB $8F ,$11         				; For 15 frames  down 1/8 yards, right 1/8 yards
.DB $86 ,$11         				; For 6 frames  down 1/8 yards, right 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_RIGHT
.DB $11						; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 122
 							; Spr changes: 5
 							; Tot y yards: 8.375
 							; Tot x yards: 8.25
							; TOT YARDS: 11.8

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_DOWN:
.DB $E0             				; up 2/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_1

.DB $E0             				; up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_2

.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $83 ,$20         				; For 3 frames  down 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $83 ,$30         				; For 3 frames  down 3/8 yards,  0 yards X
.DB $84 ,$40         				; For 4 frames  down 4/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $84 ,$10         				; For 4 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $82 ,$30         				; For 2 frames  down 3/8 yards,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_LEFT_TUMBLE_START

.DB $40             				; down 4/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_LEFT

.DB $8F ,$10         				; For 15 frames  down 1/8 yards,  0 yards X
.DB $89 ,$10         				; For 9 frames  down 1/8 yards,  0 yards X

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_LEFT
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 130
 							; Spr changes: 5
 							; Tot y yards: 8.75
 							; Tot x yards: 0.0
							; TOT YARDS: 8.75

FLY_BACK_TO_GROUND_ROLLING_TUMBLE_DOWN_LEFT:
.DB $DF             				; up 3/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_LEFT_TUMBLE_START

.DB $82 ,$EF         				; For 2 frames  up 2/8 yards, left 1/8 yards
.DB $82 ,$FF         				; For 2 frames  up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $83 ,$1F         				; For 3 frames  down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_DOWN_LEFT_2

.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards
.DB $83 ,$2F         				; For 3 frames  down 2/8 yards, left 1/8 yards
.DB $83 ,$3F         				; For 3 frames  down 3/8 yards, left 1/8 yards
.DB $83 ,$4F         				; For 3 frames  down 4/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$FF         				; For 2 frames  up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $83 ,$1F         				; For 3 frames  down 1/8 yards, left 1/8 yards
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $82 ,$3F         				; For 2 frames  down 3/8 yards, left 1/8 yards
.DB $83 ,$1F         				; For 3 frames  down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] DOWN_LEFT_TUMBLE_START

.DB $4C             				; down 4/8 yards, left 4/8 yards
.DB $2E             				; down 2/8 yards, left 2/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_LEFT

.DB $8F ,$1F         				; For 15 frames  down 1/8 yards, left 1/8 yards
.DB $86 ,$1F         				; For 6 frames  down 1/8 yards, left 1/8 yards

SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_LEFT

.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 126
 							; Spr changes: 5
 							; Tot y yards: 7.5
 							; Tot x yards: -7.75
							; TOT YARDS: 10.8
							
_F}_FLY_BACK_TO_GROUND_ROLLING_TUMBLE_ANIMATION_DATA						

_F{_CHOP_BLOCK_TUMBLE_ANIMATION_DATA

CHOP_BLOCK_TUMBLE_LEFT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] FLAT_ON_GROUND_SPRITE_DATA    				; Set sprite info addr to:BB1C
.DB $CB             				; up 4/8 yards, left 5/8 yards
.DB $DC             				; up 3/8 yards, left 4/8 yards
.DB $ED             				; up 2/8 yards, left 3/8 yards
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] CHOP_BLOCK_LEFT_SPRITE_DATA    				; Set sprite info addr to:BC9C
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $3E             				; down 3/8 yards, left 2/8 yards
.DB $4D             				; down 4/8 yards, left 3/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_LEFT
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards
.DB $8F ,$0F         				; For 15 frames  0 yards Y, left 1/8 yards
.DB $89 ,$0F         				; For 9 frames  0 yards Y, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_LEFT
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 111
 							; Spr changes: 4
 							; Tot y yards: 0.25
 							; Tot x yards: -7.5
							; TOT YARDS: 7.5

CHOP_BLOCK_TUMBLE_UP_LEFT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] (FLAT_ON_GROUND_SPRITE_DATA + $04)   			
.DB $BC             				; up 5/8 yards, left 4/8 yards
.DB $BD             				; up 5/8 yards, left 3/8 yards
.DB $CD             				; up 4/8 yards, left 3/8 yards
.DB $82 ,$EF         				; For 2 frames  up 2/8 yards, left 1/8 yards
.DB $84 ,$FF         				; For 4 frames  up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_LEFT
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $3F             				; down 3/8 yards, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_LEFT
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 116
 							; Spr changes: 3
 							; Tot y yards: -4.125
 							; Tot x yards: -5.375
							; TOT YARDS: 6.8

CHOP_BLOCK_TUMBLE_UP:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] (FLAT_ON_GROUND_SPRITE_DATA +$08)  				; Set sprite info addr to:BB24 
.DB $82 ,$C0         				; For 2 frames  up 4/8 yards,  0 yards X
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $85 ,$00         				; For 5 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] (READY_TO_DIVE_SPRITE_DATA +$08)    				; Set sprite info addr to:BB04
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_LEFT 
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_LEFT
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 113
 							; Spr changes: 4
 							; Tot y yards: -3.625
 							; Tot x yards: 0.0
							; TOT YARDS: 3.6

CHOP_BLOCK_TUMBLE_UP_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] (FLAT_ON_GROUND_SPRITE_DATA +$0C)   				; Set sprite info addr to:BB28
.DB $B4             				; up 5/8 yards, right 4/8 yards
.DB $B3             				; up 5/8 yards, right 3/8 yards
.DB $C3             				; up 4/8 yards, right 3/8 yards
.DB $82 ,$E1         				; For 2 frames  up 2/8 yards, right 1/8 yards
.DB $84 ,$F1         				; For 4 frames  up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_UP_RIGHT
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $10             				; down 1/8 yards,  0 yards X
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $31             				; down 3/8 yards, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_UP_RIGHT
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 116
 							; Spr changes: 3
 							; Tot y yards: -4.125
 							; Tot x yards: -5.375
							; TOT YARDS: 6.8

CHOP_BLOCK_TUMBLE_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] (FLAT_ON_GROUND_SPRITE_DATA +$10)    				; Set sprite info addr to:BB2C
.DB $C5             				; up 4/8 yards, right 5/8 yards
.DB $D4             				; up 3/8 yards, right 4/8 yards
.DB $E3             				; up 2/8 yards, right 3/8 yards
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] CHOP_BLOCK_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BCA0
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $32             				; down 3/8 yards, right 2/8 yards
.DB $43             				; down 4/8 yards, right 3/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards
.DB $8F ,$01         				; For 15 frames  0 yards Y, right 1/8 yards
.DB $89 ,$01         				; For 9 frames  0 yards Y, right 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_RIGHT_ON_GROUND
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 111
 							; Spr changes: 4
 							; Tot y yards: 0.125
 							; Tot x yards: 7.5
							; TOT YARDS: 7.5
CHOP_BLOCK_TUMBLE_DOWN_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] (FLAT_ON_GROUND_SPRITE_DATA +$14)    				; Set sprite info addr to:BB30
.DB $A6             				; up 6/8 yards, right 6/8 yards
.DB $03             				; 0 yards Y, right 3/8 yards
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $85 ,$01         				; For 5 frames  0 yards Y, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$21         				; For 2 frames  down 2/8 yards, right 1/8 yards
.DB $30             				; down 3/8 yards,  0 yards X
.DB $31             				; down 3/8 yards, right 1/8 yards
.DB $40             				; down 4/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] CHOP_BLOCK_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BCA0
.DB $82 ,$50         				; For 2 frames  down 5/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_RIGHT
.DB $8F ,$11         				; For 15 frames  down 1/8 yards, right 1/8 yards
.DB $86 ,$11         				; For 6 frames  down 1/8 yards, right 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_RIGHT
.DB $11 						; down 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 102
 							; Spr changes: 3
 							; Tot y yards: 5.5
 							; Tot x yards: 6.0
							; TOT YARDS: 8.1

CHOP_BLOCK_TUMBLE_DOWN:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_LEFT
.DB $B0             				; up 5/8 yards,  0 yards X
.DB $D0             				; up 3/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] (FLAT_ON_GROUND_SPRITE_DATA +$18)   				; Set sprite info addr to:BB34
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $83 ,$10         				; For 3 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
.DB $50             				; down 5/8 yards,  0 yards X
.DB $60             				; down 6/8 yards,  0 yards X
.DB $70             				; down 7/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_LEFT
.DB $00             				; 0 yards Y,  0 yards X
.DB $8F ,$10         				; For 15 frames  down 1/8 yards,  0 yards X
.DB $89 ,$10         				; For 9 frames  down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_LEFT
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 108
 							; Spr changes: 3
 							; Tot y yards: 5.875
 							; Tot x yards: 0
							; TOT YARDS: 5.9

CHOP_BLOCK_TUMBLE_DOWN_LEFT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] (FLAT_ON_GROUND_SPRITE_DATA +$1C)   				; Set sprite info addr to:BB38
.DB $AA             				; up 6/8 yards, left 6/8 yards
.DB $0D             				; 0 yards Y, left 3/8 yards
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $85 ,$0F         				; For 5 frames  0 yards Y, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$2F         				; For 2 frames  down 2/8 yards, left 1/8 yards
.DB $30             				; down 3/8 yards,  0 yards X
.DB $3F             				; down 3/8 yards, left 1/8 yards
.DB $40             				; down 4/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] CHOP_BLOCK_LEFT_SPRITE_DATA    				; Set sprite info addr to:BC9C
.DB $82 ,$50         				; For 2 frames  down 5/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_DOWN_LEFT
.DB $8F ,$1F         				; For 15 frames  down 1/8 yards, left 1/8 yards
.DB $86 ,$1F         				; For 6 frames  down 1/8 yards, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] ROLLING_TUMBLE_ON_GROUND_DOWN_LEFT
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 102
 							; Spr changes: 4
 							; Tot y yards: 5.5
 							; Tot x yards: -6.0
							; TOT YARDS: 8.1
							
_F}_CHOP_BLOCK_TUMBLE_ANIMATION_DATA							

_F{_UNUSED_SUPERMAN_TUMBLES

UNUSED_SUPERMAN_TUMBLE_LEFT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SUPERMAN_TUMBLE_LEFT_SPRITE_DATA    				
.DB $BC             				; up 5/8 yards, left 4/8 yards
.DB $DD             				; up 3/8 yards, left 3/8 yards
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $83 ,$FF         				; For 3 frames  up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $82 ,$1F         				; For 2 frames  down 1/8 yards, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] CHOP_BLOCK_LEFT_SPRITE_DATA    				
.DB $33             				; down 3/8 yards, right 3/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $84 ,$1F         				; For 4 frames  down 1/8 yards, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_SPRITE_DATA   				
.DB $86 ,$1F         				; For 6 frames  down 1/8 yards, left 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BCAC
.DB $0C             				; 0 yards Y, left 4/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 100
 							; Spr changes: 4
 							; Tot y yards: 0.125
 							; Tot x yards: -4.75
							; TOT YARDS: 4.8

UNUSED_SUPERMAN_TUMBLE_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SUPERMAN_TUMBLE_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BC98 
.DB $B4             				; up 5/8 yards, right 4/8 yards
.DB $D3             				; up 3/8 yards, right 3/8 yards
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $83 ,$F1         				; For 3 frames  up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $82 ,$11         				; For 2 frames  down 1/8 yards, right 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] CHOP_BLOCK_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BCA0 
.DB $3D             				; down 3/8 yards, left 3/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $84 ,$11         				; For 4 frames  down 1/8 yards, right 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCA8 
.DB $86 ,$11         				; For 6 frames  down 1/8 yards, right 1/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCB0 
.DB $04             				; 0 yards Y, right 4/8 yards
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 100
 							; Spr changes: 4
 							; Tot y yards: 0.125
 							; Tot x yards: 4.75
							; TOT YARDS: 4.8
							
_F}_UNUSED_SUPERMAN_TUMBLE							

_F{_UNUSED_THROWN_TO_BACK_LAND_ON_BACK_TUMBLES

UNUSED_THROWN_TO_BACK_LAND_ON_BACK_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_RIGHT_1
.DB $D4             				; up 3/8 yards, right 4/8 yards
.DB $E3             				; up 2/8 yards, right 3/8 yards
.DB $F2             				; up 1/8 yards, right 2/8 yards
.DB $82 ,$F1         				; For 2 frames  up 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $82 ,$01         				; For 2 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_RIGHT_2
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $84 ,$11         				; For 4 frames  down 1/8 yards, right 1/8 yards
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $31             				; down 3/8 yards, right 1/8 yards
.DB $52             				; down 5/8 yards, right 2/8 yards
.DB $63             				; down 6/8 yards, right 3/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $C4             				; up 4/8 yards, right 4/8 yards
.DB $D3             				; up 3/8 yards, right 3/8 yards
.DB $E2             				; up 2/8 yards, right 2/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $83 ,$01         				; For 3 frames  0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $21             				; down 2/8 yards, right 1/8 yards
.DB $31             				; down 3/8 yards, right 1/8 yards
.DB $42             				; down 4/8 yards, right 2/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BCAC
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 103
 							; Spr changes: 3
 							; Tot y yards: 1.25
 							; Tot x yards: 6.75
							; TOT YARDS: 6.9

UNUSED_THROWN_TO_BACK_LAND_ON_BACK_LEFT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_LEFT_1
.DB $DC             				; up 3/8 yards, left 4/8 yards
.DB $ED             				; up 2/8 yards, left 3/8 yards
.DB $FE             				; up 1/8 yards, left 2/8 yards
.DB $82 ,$FF         				; For 2 frames  up 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $82 ,$0F         				; For 2 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] THROWN_TO_BACK_LEFT_2
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $84 ,$1F         				; For 4 frames  down 1/8 yards, left 1/8 yards
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $3F             				; down 3/8 yards, left 1/8 yards
.DB $5E             				; down 5/8 yards, left 2/8 yards
.DB $6D             				; down 6/8 yards, left 3/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $CC             				; up 4/8 yards, left 4/8 yards
.DB $DD             				; up 3/8 yards, left 3/8 yards
.DB $EE             				; up 2/8 yards, left 2/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $83 ,$0F         				; For 3 frames  0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $2F             				; down 2/8 yards, left 1/8 yards
.DB $3F             				; down 3/8 yards, left 1/8 yards
.DB $4E             				; down 4/8 yards, left 2/8 yards
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCB0
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 103
 							; Spr changes: 3
 							; Tot y yards: 1.25
 							; Tot x yards: -6.75
							; TOT YARDS: 6.9
							
_F}_UNUSED_THROWN_TO_BACK_LAND_ON_BACK_TUMBLES							

_F{_UNUSED_2_SPR_CHANGE_TUMBLES

UNUSED_DIAG_SPIN_TO_LAY_ON_BACK_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_SPRITE_DATA   				; Set sprite info addr to:BCA4
.DB $E3             				; up 2/8 yards, right 3/8 yards
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $01             				; 0 yards Y, right 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $11             				; down 1/8 yards, right 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $84 ,$10         				; For 4 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BCAC
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 114
 							; Spr changes: 2
 							; Tot y yards: 1.375
 							; Tot x yards: 1.0
							; TOT YARDS: 1.7

UNUSED_DIAG_SPIN_TO_LAY_ON_BACK_LEFT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCA8
.DB $ED             				; up 2/8 yards, left 3/8 yards
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $00             				; 0 yards Y,  0 yards X
.DB $0F             				; 0 yards Y, left 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $1F             				; down 1/8 yards, left 1/8 yards
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $84 ,$10         				; For 4 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCB0
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 114
 							; Spr changes: 2
 							; Tot y yards: 1.375
 							; Tot x yards: -1
							; TOT YARDS: 1.7
_F}_UNUSED_2_SPR_CHANGE_TUMBLES							
							
_F{_UNUSED_DIAG_SPINNING_ON_TO_BACK_TUMBLES						

SPIN_ON_TO_BACK_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_LEFT_SPRITE_DATA     				
.DB $82 ,$C0         				; For 2 frames  up 4/8 yards,  0 yards X
.DB $D0             				; up 3/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_FACING_DOWN_SPRITE_DATA   				; Set sprite info addr to:BCD4 
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_SPRITE_DATA   			
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $87 ,$00         				; For 7 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_RIGHT_FACING_UP_SPRITE_DATA 
.DB $88 ,$00         				; For 8 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_LEFT_SPRITE_DATA     			
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_FACING_DOWN_SPRITE_DATA   				; Set sprite info addr to:BCD4 
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_SPRITE_DATA   				; Set sprite info addr to:BCA4
.DB $88 ,$10         				; For 8 frames  down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_RIGHT_FACING_UP_SPRITE_DATA
.DB $83 ,$10         				; For 3 frames  down 1/8 yards,  0 yards X
.DB $83 ,$20         				; For 3 frames  down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
.DB $40             				; down 4/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BCAC
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 140
 							; Spr changes: 9
 							; Tot y yards: 1.5
 							; Tot x yards: 0
							; TOT YARDS: 1.5

SPIN_ON_TO_BACK_LEFT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_RIGHT_SPRITE_DATA  				; Set sprite info addr to:BCD0 
.DB $82 ,$C0         				; For 2 frames  up 4/8 yards,  0 yards X
.DB $D0             				; up 3/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_FACING_DOWN_SPRITE_DATA   				; Set sprite info addr to:BCD8 
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCA8 
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $87 ,$00         				; For 7 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_LEFT_FACING_UP_SPRITE_DATA 
.DB $88 ,$00         				; For 8 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_RIGHT_SPRITE_DATA  				; Set sprite info addr to:BCD0 
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $84 ,$00         				; For 4 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_FACING_DOWN_SPRITE_DATA   				; Set sprite info addr to:BCD8
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCA8
.DB $88 ,$10         				; For 8 frames  down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_LEFT_FACING_UP_SPRITE_DATA 
.DB $83 ,$10         				; For 3 frames  down 1/8 yards,  0 yards X
.DB $83 ,$20         				; For 3 frames  down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
.DB $40             				; down 4/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCB0 
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 140
 							; Spr changes: 9
 							; Tot y yards: 1.5
 							; Tot x yards: 0.0
							; TOT YARDS: 1.5
							
_F}_UNUSED_DIAG_SPINNING_ON_TO_BACK_TUMBLES									

_F{_UNUSED_5_SPR_CHANGE_TUMBLES		

FIVE_SPRITE_TUMBLE_LAND_ON_BACK_LEFT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_LEFT_SPRITE_DATA     				; Set sprite info addr to:BCCC
.DB $C0             				; up 4/8 yards,  0 yards X
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $E0             				; up 2/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SUPERMAN_TUMBLE_LEFT_SPRITE_DATA    				; Set sprite info addr to:BC94
.DB $FB             				; up 1/8 yards, left 5/8 yards
.DB $82 ,$F0         				; For 2 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $FF             				; up 1/8 yards, left 1/8 yards
.DB $85 ,$00         				; For 5 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] CHOP_BLOCK_LEFT_SPRITE_DATA    				; Set sprite info addr to:BC9C
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_SPRITE_DATA   				; Set sprite info addr to:BCA4
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
.DB $40             				; down 4/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_RIGHT_SPRITE_DATA    				; Set sprite info addr to:BCAC
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 108
 							; Spr changes: 5
 							; Tot y yards: 0.125
 							; Tot x yards: -0.75
							; TOT YARDS: 0.8

FIVE_SPRITE_TUMBLE_LAND_ON_BACK_RIGHT:
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_RIGHT_SPRITE_DATA  			
.DB $C0             				; up 4/8 yards,  0 yards X
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $E0             				; up 2/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SUPERMAN_TUMBLE_RIGHT_SPRITE_DATA    			
.DB $F5             				; up 1/8 yards, right 5/8 yards
.DB $82 ,$F0         				; For 2 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F1             				; up 1/8 yards, right 1/8 yards
.DB $85 ,$00         				; For 5 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] CHOP_BLOCK_RIGHT_SPRITE_DATA    				
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCA8
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
.DB $40             				; down 4/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] LYING_ON_GROUND_HEAD_UP_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCB0
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 108
 							; Spr changes: 5
 							; Tot y yards: 0.125
 							; Tot x yards: 0.75
							; TOT YARDS: 0.8

_F}_UNUSED_5_SPR_CHANGE_TUMBLES		

_F{_BROKEN_TUMBLES							

BROKEN_TUMBLE_ONE:						; BROKEN 
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_RIGHT_FACING_UP_SPRITE_DATA 
.DB $B0             				; up 5/8 yards,  0 yards X
.DB $C0             				; up 4/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_SPRITE_DATA   				
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_FACING_DOWN_SPRITE_DATA   				
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_LEFT_SPRITE_DATA     				
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_RIGHT_FACING_UP_SPRITE_DATA 
.DB $86 ,$00         				; For 6 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_SPRITE_DATA   				
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_FACING_DOWN_SPRITE_DATA   				
.DB $86 ,$10         				; For 6 frames  down 1/8 yards,  0 yards X
.DB $83 ,$20         				; For 3 frames  down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] QB_DROPBACK_1_SPRITE_INFO
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 129
 							; Spr changes: 8
 							; Tot y yards: 0
 							; Tot x yards: 0

BROKEN_TUMBLE_TWO:					; *** BROKEN
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_LEFT_FACING_UP_SPRITE_DATA
.DB $B0             				; up 5/8 yards,  0 yards X
.DB $C0             				; up 4/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCA8
.DB $E0             				; up 2/8 yards,  0 yards X
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_FACING_DOWN_SPRITE_DATA   				; Set sprite info addr to:BCD8
.DB $83 ,$F0         				; For 3 frames  up 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_RIGHT_SPRITE_DATA  				; Set sprite info addr to:BCD0
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_TOP_LEFT_FACING_UP_SPRITE_DATA
.DB $86 ,$00         				; For 6 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_LEFT_SPRITE_DATA   				; Set sprite info addr to:BCA8
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $82 ,$00         				; For 2 frames  0 yards Y,  0 yards X
.DB $10             				; down 1/8 yards,  0 yards X
.DB $00             				; 0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[] SPIN_HEAD_DIAG_BOT_RIGHT_FACING_DOWN_SPRITE_DATA   				; Set sprite info addr to:BCD8
.DB $86 ,$10         				; For 6 frames  down 1/8 yards,  0 yards X
.DB $83 ,$20         				; For 3 frames  down 2/8 yards,  0 yards X
.DB $30             				; down 3/8 yards,  0 yards X
SET_ROLLING_TUMBLE_SPRITE_INFO_ADDR[]  (QB_DROPBACK_1_SPRITE_INFO + $04)
.DB $D0             				; up 3/8 yards,  0 yards X
.DB $F0             				; up 1/8 yards,  0 yards X
.DB $83 ,$00         				; For 3 frames  0 yards Y,  0 yards X
.DB $82 ,$10         				; For 2 frames  down 1/8 yards,  0 yards X
.DB $20             				; down 2/8 yards,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $8F ,$00         				; For 15 frames  0 yards Y,  0 yards X
.DB $80 ,$FF         				; End of sequence

							; Summary: 
 							; Tot frames: 129
 							; Spr changes: 8
 							; Tot y yards: 0
 							; Tot x yards: 0
							
_F}_BROKEN_TUMBLES								

_F{_EMPTY_TUMBLE_SEQUENCE			; *** can remove

EMPTY_TUMBLE_SEQUENCE:
.DB $80 ,$FF         				; End of sequence

 							; Summary: 
 							; Tot frames: 0
 							; Spr changes: 0
 							; Tot y yards: 0.0
 							; Tot x yards: 0.0
							
_F}_EMPTY_TUMBLE_SEQUENCE							
							
.PAD $C000, $FF							

