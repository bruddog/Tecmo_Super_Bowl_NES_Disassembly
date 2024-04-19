.BASE $8000

_F{_BLANK_COLOR_BANK_0_TILES:

                               		; 0x00 = BLANK TILE COLOR SET 1 
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00

                              		; 0x01 = BLANK TILE COLOR SET 2
	.DB $55,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01

                               		; 0x02 = BLANK TILE COLOR SET 3 *** NOT USED
	.DB $AA,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02

                              		; 0x03 = BLANK TILE COLOR SET 4 *** NOT USED
	.DB $FF,$03,$03,$03,$03
	.DB     $03,$03,$03,$03
	.DB     $03,$03,$03,$03
	.DB     $03,$03,$03,$03

_F}_BLANK_COLOR_BANK_0_TILES:	
	
_F{_STADIUM_FOR_CATCH_SIDE_VIEW_TOP_DECK_TILES

                             		; 0x04 DOUBLE DECKER STADIUM WITH GRASS FAR AWAY PERSPECTIVE TOP DECK
	.DB $00,$01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
	.DB     $AD,$AC,$BA,$BB
	.DB     $AE,$AF,$BE,$BF
                              		; 0x05
	.DB $00,$01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
	.DB     $AC,$AD,$AD,$9F
	.DB     $AE,$AE,$AE,$B5			; END
	
_F}_STADIUM_FOR_CATCH_SIDE_VIEW_TOP_DECK_TILES	

_F{_CLOUDS_AND_SKY_MULITIPLE_USE_TILES

                              		; 0x06 SMALL CLOUD PLUS TOP OF STADIUM
	.DB $00,$01,$85,$95,$C0
	.DB     $01,$A5,$98,$C8
	.DB     $01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
                              		; 0x07 SKY PLUS TOP OF STADIUM
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
                               		; 0x08
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $85,$90,$95,$C0
                               		; 0x09 MEDIUM CLOUD PLUS TOP OF STADIUM
	.DB $00,$A5,$98,$B0,$C8
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
	
_F}_CLOUDS_AND_SKY_MULITIPLE_USE_TILES	

_F{_FLAGS_SCOREBOARD_COIN_TOSS_STADIUM_TILES
	
                              		; 0x0A TINY FLAGS AND SCOREBOARD ON TOP OF STADIUM
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$A7,$A7
	.DB     $01,$01,$B2,$B3
	.DB     $A6,$A6,$B8,$B9
                               		; 0x0B
	.DB $00,$01,$01,$01,$01
	.DB     $A7,$A7,$01,$01
	.DB     $B3,$B6,$01,$01
	.DB     $B9,$BC,$A6,$A6				; END
	
_F}_FLAGS_SCOREBOARD_COIN_TOSS_STADIUM_TILES	

_F{_SMALL_CLOUD_MULTIPLE_USE_TILES
                              		; 0x0C SMALL CLOUD PLUS TOP OF STADIUM
	.DB $00,$01,$01,$01,$01
	.DB     $85,$9A,$9E,$01
	.DB     $A5,$B0,$C8,$01
	.DB     $A6,$A6,$A6,$A6
	
_F}_SMALL_CLOUD_MULTIPLE_USE_TILES	

_F{_STADIUM_FOR_CATCH_SIDE_VIEW_BOT_DECK_TILES	
	
                              		; 0x0D DOUBLE DECKER STADIUM WITH GRASS FAR AWAY PERSPECTIVE BOT DECK
	.DB $50,$BA,$BB,$AD,$AC
	.DB     $BE,$BF,$AE,$AE
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                              		; 0x0E
	.DB $50,$AC,$9F,$AD,$AC
	.DB     $AF,$B5,$AE,$AF
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01						; END
	
_F}_STADIUM_FOR_CATCH_SIDE_VIEW_BOT_DECK_TILES	

_F{_STADIUM_MULITIPLE_USE_TILES	

                              		; 0x0F DOUBLE DECKER STADIUM 
	.DB $AA,$AD,$AC,$BA,$BB
	.DB     $AE,$AF,$BE,$BF
	.DB     $BA,$BB,$AD,$AC
	.DB     $BE,$BF,$AE,$AE
                              		; 0x10
	.DB $AA,$AC,$AD,$AD,$9F
	.DB     $AE,$AE,$AE,$B5
	.DB     $AC,$9F,$AD,$AC
	.DB     $AF,$B5,$AE,$AF				; END
	
_F}_STADIUM_MULITIPLE_USE_TILES		

_F{_AWNING_FOR_STADIUM_MULITIPLE_USE_TILES	
													; 0x11 AWNING FOR DOUBLE DECKER STADIUM MULTIPLE USES
	.DB $5A,$64,$65,$64,$70
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$7B
	.DB     $79,$79,$79,$7A
	
_F}_AWNING_FOR_STADIUM_MULITIPLE_USE_TILES		

_F{_TINY_PUFFY_CLOUDFOR_PASS_SCENES_TILES

                              		; 0x12 PUFFY CLOUD TINY
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$8F,$9A,$9E
	.DB     $01,$A5,$B1,$B4				; END
	
_F}_TINY_PUFFY_CLOUDFOR_PASS_SCENES_TILES	

_F{_DOUBLE_DECKER_STADIUM_WITH_FG_POSTS_TILES

                             		; 0x13 LARGE PUFFY CLOUD
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$85,$90
	.DB     $01,$01,$87,$92
	.DB     $01,$01,$8D,$98
                               		; 0x14
	.DB $00,$01,$01,$01,$01
	.DB     $91,$94,$95,$C0
	.DB     $93,$96,$97,$C2
	.DB     $99,$9C,$9D,$C8				; END

                               		; 0x15 FG POSTS TOP WITH SKY FOR DOUBLE DECKER
	.DB $00,$01,$01,$01,$01
	.DB     $01,$FA,$01,$01
	.DB     $01,$B7,$01,$01
	.DB     $01,$B7,$01,$01
                               		; 0x16
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$FA,$01
	.DB     $01,$01,$B7,$01
	.DB     $01,$01,$B7,$01				; END
	
_F}_DOUBLE_DECKER_STADIUM_WITH_FG_POSTS_TILES	

_F{_UNUSED_1_BANK_0_TILES	

                              		; 0x17 UNUSED
	.DB $00,$01,$01,$01,$01
	.DB     $85,$90,$90,$91
	.DB     $87,$92,$93,$93
	.DB     $8D,$98,$99,$9C
                              		; 0x18 UNUSED
	.DB $00,$01,$01,$01,$01
	.DB     $91,$94,$C0,$01
	.DB     $97,$93,$C2,$01
	.DB     $99,$9C,$C8,$01

_F}_UNUSED_1_BANK_0_TILES	
	
_F{_DOUBLE_DECKER_STADIUM_WITH_SCOREBOARD_TILES
												; SMALL SCOREBOARD DOUBLE DECKER STADIUM
												; 0x19
	.DB $00,$01,$01,$B2,$B3
	.DB     $A6,$A6,$B8,$B9
	.DB     $AC,$AC,$AD,$9F
	.DB     $AE,$AE,$AE,$B5
												; 0x1A
	.DB $00,$B3,$B6,$01,$01
	.DB     $B9,$BC,$A6,$A6
	.DB     $AD,$AC,$BA,$BB
	.DB     $AE,$AF,$BE,$BF						; END
	
_F}_DOUBLE_DECKER_STADIUM_WITH_SCOREBOARD_TILES	

_F{_SMALL_PUFFY_CLOUD_FOR_DOUBLE_DECKER_TILES

												; 0x1B SMALL PUFFY CLOUD
	.DB $00,$01,$8F,$9A,$9E
	.DB     $01,$A5,$B1,$B4
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01

_F}_SMALL_PUFFY_CLOUD_FOR_DOUBLE_DECKER_TILES

_F{_FIELD_GOAL_POSTS_TILES
												; FIELD GOAL POSTS WITH SKY FOR DOUBLE DECKER
                         ; 0x1C
	.DB $00,$01,$B7,$01,$01
	.DB     $01,$B7,$01,$01
	.DB     $01,$B7,$01,$01
	.DB     $01,$B7,$01,$01
                               		; 0x1D
	.DB $00,$01,$01,$B7,$01
	.DB     $01,$01,$B7,$01
	.DB     $01,$01,$B7,$01
	.DB     $01,$01,$B7,$01						; END

                               		; 0x1E FIELD GOAL POSTS WITH STADIUM
	.DB $00,$01,$B7,$01,$01
	.DB     $A6,$BD,$A6,$A6
	.DB     $AC,$CA,$AC,$9F
	.DB     $AF,$E0,$AF,$B5
                               		; 0x1F
	.DB $00,$01,$01,$B7,$01
	.DB     $A6,$A6,$BD,$A6
	.DB     $AD,$AC,$C9,$BB
	.DB     $AE,$AE,$CB,$BF				       ; END
	
_F}_FIELD_GOAL_POSTS_TILES	

_F{_STRIPED_FIELD_FACING_FG_POSTS_TILES

											; STRIPED FIELD, FACING FG VIEW
                              		; 0x20
	.DB $50,$BA,$BB,$AD,$AC
	.DB     $BE,$BF,$AE,$AE
	.DB     $C1,$C1,$C1,$C1
	.DB     $C4,$C4,$C4,$C4
                              		; 0x21
	.DB $50,$AC,$9F,$AC,$AD
	.DB     $AF,$B5,$AF,$AE
	.DB     $C1,$C1,$C1,$C1
	.DB     $C4,$C4,$C4,$C4
                              		; 0x22
	.DB $50,$AC,$E2,$E3,$EA
	.DB     $AF,$B5,$AF,$E8
	.DB     $C1,$C1,$C1,$C1
	.DB     $C4,$C4,$C4,$C4
                               		; 0x23
	.DB $50,$EB,$C3,$E1,$AC
	.DB     $E9,$BF,$AE,$AE
	.DB     $C1,$C1,$C1,$C1
	.DB     $C4,$C4,$C4,$C4				; END
	
_F}_STRIPED_FIELD_FACING_FG_POSTS_TILES	

_F{_STRIPED_FIELD_AFTER_KICK_TOP_TILES
												; STRIPED FIELD, FG KICK MOSTLY FIELD 
                              		; 0x24
	.DB $55,$C6,$C6,$C6,$C6
	.DB     $CC,$CC,$CC,$CC
	.DB     $CE,$CE,$CE,$CE
	.DB     $E4,$E4,$E4,$E4
                               		; 0x25
	.DB $55,$CE,$CE,$CE,$CE
	.DB     $E6,$E6,$E6,$E6
	.DB     $EC,$EC,$EC,$EC
	.DB     $C7,$C7,$C7,$C7						; END
	
_F}_STRIPED_FIELD_AFTER_KICK_TOP_TILES	

_F{_UNUSED_2_BANK_0_TILES	

                               		; 0x26 UNUSED CLOUDS SLIGHTLY DIFFERENT LOC
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$85
	.DB     $01,$01,$01,$87
	.DB     $01,$01,$01,$8D
                               		; 0x27 UNUSED CLOUDS SLIGHTLY DIFFERENT LOC
	.DB $00,$01,$01,$01,$01
	.DB     $91,$90,$91,$94
	.DB     $92,$93,$96,$97
	.DB     $98,$99,$99,$9C
                               		; 0x28 UNUSED CLOUDS SLIGHTLY DIFFERENT LOC
	.DB $00,$01,$01,$01,$01
	.DB     $95,$C0,$01,$01
	.DB     $96,$C2,$01,$01
	.DB     $9D,$C8,$01,$01
	
_F}_UNUSED_2_BANK_0_TILES		

_F{_STRIPED_FIELD_2_FACING_FG_POSTS_TILES



								; STRIPED FIELD, FG KICK MOSTLY FIELD, BARRIER BETWEEN FIELD AND BLACK 
                              		; 0x29
	.DB $55,$EE,$EE,$EE,$EE
	.DB     $C5,$C5,$C5,$C5
	.DB     $CD,$CD,$CD,$CD
	.DB     $EE,$EE,$EE,$EE				; END
	
_F}_STRIPED_FIELD_2_FACING_FG_POSTS_TILES	

_F{_MISC_CLOUDS_TILES

                              		; 0x2A PUFFY CLOUD MEDIUM
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$85,$90
	.DB     $01,$01,$87,$92
                              		; 0x2B
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $94,$95,$C0,$01
	.DB     $96,$97,$C2,$01				; END

                               		; 0x2C PUFFY CLOUD LARGE
	.DB $00,$01,$01,$01,$01
	.DB     $85,$90,$91,$94
	.DB     $87,$92,$93,$96
	.DB     $8D,$98,$99,$9C
                               		; 0x2D
	.DB $00,$01,$01,$01,$01
	.DB     $95,$C0,$01,$01
	.DB     $97,$C2,$01,$01
	.DB     $9D,$C8,$01,$01				; END

                              		; 0x2E SKY WITH TOP OF LARGE CLOUD
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $85,$90,$91,$94
                               		; 0x2F CLOUD SMALL TOP
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $91,$C0,$01,$01
                               		; 0x30 BOTTOM LEFT PUFFY CLOUD MEDIUM
	.DB $00,$01,$01,$8D,$98
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0x31 BOTTOM RIGHT PUFFY CLOUD MEDIUM
	.DB $00,$99,$9D,$C8,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01				; END


                              		; 0x32 PUFFY CLOUD SMALL 1
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $8F,$90,$95,$9E
	.DB     $A5,$B0,$9D,$B4
                               		; 0x33  PUFFY CLOUD LARGE MIDDLE
	.DB $00,$87,$92,$93,$93
	.DB     $8D,$98,$99,$9D
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                              		; 0x34 CLOUD SMALL BOTTOM
	.DB $00,$96,$C2,$01,$01
	.DB     $99,$C8,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                              		; 0x35 PUFFY CLOUD LARGE TOP OF SCREEN
	.DB $00,$85,$90,$91,$94
	.DB     $87,$92,$93,$93
	.DB     $8D,$98,$99,$9D
	.DB     $01,$01,$01,$01
                              		; 0x36
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $8F,$9A,$9E,$01
	.DB     $A5,$B1,$B4,$01
                             		; 0x37 PUFFY CLOUD LARGE TOP OF SCREEN
	.DB $00,$95,$C0,$01,$01
	.DB     $96,$C2,$01,$01
	.DB     $99,$C8,$01,$01
	.DB     $01,$01,$01,$01
                              		; 0x38 PUFFY CLOUD SMALL 2
	.DB $00,$01,$01,$01,$01
	.DB     $8F,$90,$95,$C0
	.DB     $8D,$B1,$9D,$B4
	.DB     $01,$01,$01,$01
	
_F}_MISC_CLOUDS_TILES	

_F{_SMALL_FLAGS_ON_SCOREBOARD_CREDITS_TILES

                               		; 0x39 SMALL FLAGS ON TOP OF SCOREBOARD DOUBLE DECKER STADIUM
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$A7,$A7
                               		; 0x3A
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $A7,$A7,$01,$01						; END
	
_F}_SMALL_FLAGS_ON_SCOREBOARD_CREDITS_TILES	

_F{_FACING_FG_BOTTOM_OF_SCREEN_TILES 

                              		; 0x3B CLOUDS PLUS TOP OF STADIUM
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $8F,$9A,$9B,$9E
                               		; 0x3C
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
	.DB     $AD,$AC,$BA,$BB
                             		; 0x3D
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
	.DB     $AC,$AC,$AD,$9F
	
_F}_FACING_FG_BOTTOM_OF_SCREEN 	
	
_F{_PART_OF_STADIUM_FOR_PUNT_FG_TILES 	
           												; 0x3E
	.DB $FF,$00,$00,$00,$00
	.DB     $FB,$00,$FB,$FE
	.DB     $6A,$F5,$6A,$6B
	.DB     $6E,$F5,$6E,$6F
		
_F}_PART_OF_STADIUM_FOR_PUNT_FG_TILES 	

_F{_FACING_FG_BOTTOM_OF_SCREEN_2_TILES 	
                               		; 0x3F
	.DB $00,$A5,$B1,$B0,$B4
	.DB     $01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
	.DB     $AC,$AC,$AD,$9F						; END
	
_F}_FACING_FG_BOTTOM_OF_SCREEN_2_TILES	

_F{_HALFTIME_BLIMP_TILES	
												; HALFTIME BLIMP WITH GOALPOSTS 
                           ; 0x40
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$10
	.DB     $01,$01,$20,$03
	.DB     $01,$01,$22,$03
												; 0x41
	.DB $C0,$01,$01,$12,$13
	.DB     $11,$14,$03,$03
	.DB     $03,$03,$0B,$0F
	.DB     $03,$03,$3F,$41
                               		; 0x42
	.DB $F0,$16,$17,$17,$18
	.DB     $03,$03,$03,$03
	.DB     $39,$1D,$37,$3D
	.DB     $42,$43,$44,$03
                               		; 0x43
	.DB $F0,$19,$1C,$01,$01
	.DB     $03,$03,$15,$40
	.DB     $3E,$0B,$0F,$03
	.DB     $45,$46,$47,$48
                              		; 0x44
	.DB $CC,$01,$01,$01,$01
	.DB     $32,$33,$36,$01
	.DB     $03,$03,$3C,$01
	.DB     $03,$04,$05,$01
                              		; 0x45
	.DB $00,$01,$01,$28,$29
	.DB     $01,$01,$2A,$2B
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0x46
	.DB $00,$03,$03,$03,$03
	.DB     $2C,$2D,$38,$1B
	.DB     $2E,$2F,$3A,$3B
	.DB     $01,$01,$01,$01
                              		; 0x47
	.DB $00,$03,$03,$03,$03
	.DB     $1A,$0E,$0E,$1A
	.DB     $21,$24,$25,$30
	.DB     $23,$26,$27,$00
                              		; 0x48
	.DB $00,$03,$03,$03,$03
	.DB     $1B,$1E,$1F,$08
	.DB     $31,$34,$35,$0A
	.DB     $01,$01,$01,$01
                               		; 0x49
	.DB $0C,$03,$06,$07,$01
	.DB     $09,$0C,$0D,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0x4A
	.DB $00,$01,$01,$01,$01
	.DB     $01,$49,$4C,$4D
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0x4B
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $4A,$4B,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0x4C
	.DB $00,$01,$55,$01,$01
	.DB     $01,$57,$01,$01
	.DB     $01,$5D,$01,$01
	.DB     $5E,$5F,$01,$01
                               		; 0x4D
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$4A,$4B
	.DB     $01,$54,$01,$01
                               		; 0x4E
	.DB $00,$50,$01,$01,$01
	.DB     $52,$53,$51,$01
	.DB     $01,$01,$58,$59
	.DB     $01,$01,$01,$01
                               		; 0x4F
	.DB $00,$01,$56,$01,$01
	.DB     $01,$5C,$01,$01
	.DB     $5B,$60,$61,$01
	.DB     $01,$4E,$4F,$5A				;END
	
_F}_HALFTIME_BLIMP_TILES	

_F{_CHEERLEADER_WINK_TILES	
												; CHEERLEADER ARM IN AIR
                        ; 0x50
	.DB $6A,$01,$01,$01,$01
	.DB     $01,$81,$84,$01
	.DB     $82,$83,$01,$01
	.DB     $88,$89,$01,$01
                               		; 0x51
	.DB $48,$8A,$8B,$01,$01
	.DB     $A0,$A1,$01,$01
	.DB     $A2,$A3,$86,$87
	.DB     $A8,$A9,$8C,$8D
                               		; 0x52
	.DB $55,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $92,$01,$01,$01
	.DB     $98,$99,$01,$01
                               		; 0x53
	.DB $8A,$01,$01,$B6,$B7
	.DB     $01,$E4,$E1,$E5
	.DB     $03,$D7,$E3,$01
	.DB     $D9,$E0,$01,$01
                             		; 0x54
	.DB $55,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$85
	.DB     $01,$01,$93,$94
                               		; 0x55
	.DB $99,$AA,$AB,$8E,$8F
	.DB     $A4,$A5,$00,$00
	.DB     $03,$90,$A6,$A7
	.DB     $95,$C0,$AC,$AD
                               		; 0x56
	.DB $31,$9A,$9B,$03,$D2
	.DB     $B0,$B1,$BF,$91
	.DB     $B2,$B3,$B4,$00
	.DB     $B8,$00,$00,$B5
                               		; 0x57
	.DB $44,$00,$E2,$01,$01
	.DB     $00,$BD,$01,$01
	.DB     $BE,$03,$01,$01
	.DB     $03,$03,$01,$01				; END

_F}_CHEERLEADER_WINK_TILES

_F{_GRASS_PARACHUTER_HALFTIME_TILES  							
												; GRASS FOR FIELD  USED ON WITH STADIUM ON TOP 1/8 OF SCREEN
                              		; 0x58
	.DB $00,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02

_F}_GRASS_PARACHUTER_HALFTIME_TILES  	

_F{_CHEERLEADER_BELLY_TILES	
										; CHEERLEADER UPPER TORSO AND BELLY
                               		; 0x59
	.DB $AC,$9C,$9D,$C8,$C9
	.DB     $9E,$9F,$CA,$CB
	.DB     $C5,$D0,$D1,$D4
	.DB     $C7,$03,$D3,$D6
                               		; 0x5A
	.DB $67,$CC,$BB,$80,$80
	.DB     $CE,$00,$00,$00
	.DB     $D5,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x5B
	.DB $55,$80,$80,$80,$80
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x5C
	.DB $0E,$CD,$D8,$02,$DC
	.DB     $CF,$DA,$DB,$DE
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x5D
	.DB $07,$DD,$00,$00,$00
	.DB     $DF,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00

_F}_CHEERLEADER_BELLY_TILES			
	
_F{_BAND_HALFTIME_TILES												; BAND FOR HALFTIME

                               		; 0x5E
	.DB $75,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $04,$05,$01,$01
	.DB     $01,$07,$01,$01
                               		; 0x5F
	.DB $CA,$0C,$01,$0D,$01
	.DB     $01,$0A,$01,$01
	.DB     $0B,$09,$0C,$01
	.DB     $03,$03,$0D,$0E
                               		; 0x60
	.DB $D5,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$06,$01
                               		; 0x61
	.DB $55,$01,$01,$24,$0C
	.DB     $22,$23,$26,$01
	.DB     $28,$29,$2C,$2D
	.DB     $2A,$2B,$00,$2F
                               		; 0x62
	.DB $75,$01,$01,$01,$35
	.DB     $01,$01,$36,$37
	.DB     $0C,$39,$3C,$3D
	.DB     $3A,$3B,$3E,$3F
                              		; 0x63
	.DB $57,$0F,$01,$64,$01
	.DB     $62,$01,$66,$01
	.DB     $68,$69,$6C,$6D
	.DB     $6A,$6B,$6E,$6F
                               		; 0x64
	.DB $57,$01,$08,$01,$01
	.DB     $01,$73,$01,$01
	.DB     $78,$79,$7C,$7D
	.DB     $7A,$7B,$7E,$7F
                               		; 0x65
	.DB $A6,$10,$00,$14,$15
	.DB     $12,$13,$00,$17
	.DB     $18,$19,$00,$1D
	.DB     $1A,$1B,$00,$1F
                               		; 0x66
	.DB $67,$40,$41,$44,$45
	.DB     $00,$00,$46,$00
	.DB     $48,$49,$00,$00
	.DB     $03,$2E,$00,$00
                               		; 0x67
	.DB $55,$50,$51,$54,$55
	.DB     $52,$53,$56,$00
	.DB     $00,$59,$5C,$5D
	.DB     $00,$5B,$01,$5F
                               		; 0x68
	.DB $AA,$00,$76,$77,$75
	.DB     $58,$5E,$57,$71
	.DB     $5A,$80,$81,$84
	.DB     $4C,$00,$00,$86
                               		; 0x69
	.DB $AA,$30,$00,$00,$1E
	.DB     $32,$00,$00,$34
	.DB     $38,$00,$00,$31
	.DB     $20,$21,$00,$33
                               		; 0x6A
	.DB $AA,$03,$03,$00,$16
	.DB     $03,$42,$43,$1C
	.DB     $03,$03,$03,$4A
	.DB     $03,$03,$60,$61
                               		; 0x6B
	.DB $AA,$00,$00,$74,$00
	.DB     $00,$00,$00,$00
	.DB     $4B,$00,$00,$00
	.DB     $63,$00,$47,$32
                               		; 0x6C
	.DB $AA,$4E,$4D,$00,$03
	.DB     $00,$4F,$00,$03
	.DB     $25,$65,$70,$82
	.DB     $27,$67,$72,$83				; END
	
_F}_BAND_HALFTIME_TILES									

_F{_BOTTOM_OF_STADIUM_LARGE_CROWD_TILES
												; BOTTOM OF STADIUM AND CROWD (LARGE LOWER DECK VIEW)
                              		; 0x6D
	.DB $0A,$F1,$F4,$FD,$FD
	.DB     $F3,$F6,$F3,$F6
	.DB     $E6,$E6,$E6,$E6
	.DB     $02,$02,$02,$02
                               		; 0x6E
	.DB $0A,$FD,$FD,$FD,$FD
	.DB     $F3,$F6,$F3,$F6
	.DB     $E6,$E6,$E6,$E6
	.DB     $02,$02,$02,$02
                               		; 0x6F
	.DB $0A,$FD,$FD,$FD,$FD
	.DB     $00,$FF,$FF,$00
	.DB     $E6,$E6,$E6,$E6
	.DB     $02,$02,$02,$02
                              		; 0x70
	.DB $FF,$6A,$6B,$6A,$6B
	.DB     $6E,$6F,$6E,$6F
	.DB     $6A,$6B,$6A,$6B
	.DB     $EF,$FA,$F9,$FC
                               		; 0x71
	.DB $FF,$6A,$F5,$6A,$6B
	.DB     $6E,$F5,$6E,$6F
	.DB     $6A,$F5,$6A,$6B
	.DB     $F9,$F7,$F9,$FC						; END
	
_F}_BOTTOM_OF_STADIUM_LARGE_CROWD_TILES	

_F{_WISPY_CLOUD_TOP_TILES

                               		; 0x72 WISPY CLOUD TOP OF METATILE 
	.DB $00,$62,$63,$66,$67
	.DB     $68,$69,$6C,$6D
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01

_F}_WISPY_CLOUD_TOP_TILES
		
_F{_STADIUM_LIGHTS_DOUBLE_DECKER_TILES                               		; 0x73 STADIUM LIGHTS LEFT DOUBLE DECKER
	.DB $80,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$71,$74
	.DB     $01,$01,$73,$76
                               		; 0x74 STADIUM LIGHTS RIGHT DOUCBLE DECKER
	.DB $A0,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $75,$74,$75,$72
	.DB     $77,$76,$77,$01
	
_F}_STADIUM_LIGHTS_DOUBLE_DECKER_TILES  	
	
_F{_WISPY_CLOUD_BOTTOM_TILES
	
WISPY_CLOUD_BOTTOM_TILES:                               		; 0x75 WISPY CLOUD BOTTOM OF METATILE 
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $62,$63,$66,$67
	.DB     $68,$69,$6C,$6D

_F}_WISPY_CLOUD_BOTTOM_TILES	

_F{_STADIUM_AND_SKY_TILES
                              		; 0x76 = PART OF STADIUM AND SKY
	.DB $55,$7D,$F0,$7D,$7D
	.DB     $7F,$F2,$7F,$7E
	.DB     $00,$F8,$00,$00
	.DB     $00,$7C,$00,$00
	
_F}_STADIUM_AND_SKY_TILES	
	
_F{_STADIUM_CROWD_TILES                               		; 0x77 CROWD IN STADIUM 

	.DB $F5,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $FB,$FE,$FB,$FE
	
_F}_STADIUM_CROWD_TILES                               			

_F{_CHEERLEADER_KISS_HALFTIME_TILES				; 

                              		; 0x78
	.DB $55,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$88,$89,$8C
	.DB     $01,$8A,$8B,$8E
                               		; 0x79
	.DB $A9,$01,$01,$01,$01
	.DB     $01,$01,$93,$96
	.DB     $8D,$98,$99,$9C
	.DB     $8F,$9A,$9B,$9E
                               		; 0x7A
	.DB $A9,$01,$01,$01,$C4
	.DB     $97,$C2,$01,$C6
	.DB     $9D,$C8,$C9,$CC
	.DB     $9F,$00,$CB,$CE
                               		; 0x7B
	.DB $55,$C5,$D0,$01,$01
	.DB     $02,$D2,$01,$01
	.DB     $02,$C7,$01,$01
	.DB     $02,$C7,$01,$01
                              		; 0x7C
	.DB $55,$01,$A0,$01,$A4
	.DB     $01,$01,$01,$A6
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0x7D
	.DB $66,$A5,$B0,$00,$00
	.DB     $A7,$B2,$B3,$B6
	.DB     $AD,$00,$00,$00
	.DB     $AF,$00,$00,$00
                               		; 0x7E
	.DB $65,$00,$E0,$E1,$E4
	.DB     $B7,$E2,$E3,$E4
	.DB     $00,$D8,$D9,$DC
	.DB     $BF,$DA,$DB,$DE
                              		; 0x7F
	.DB $55,$02,$C7,$01,$01
	.DB     $02,$C7,$01,$01
	.DB     $02,$CF,$01,$01
	.DB     $02,$E5,$01,$01
                               		; 0x80
	.DB $55,$01,$AC,$00,$A1
	.DB     $01,$AE,$A2,$A3
	.DB     $01,$B8,$A8,$A9
	.DB     $B9,$BA,$AA,$AB
                              		; 0x81
	.DB $55,$85,$90,$91,$94
	.DB     $87,$92,$D1,$D4
	.DB     $B1,$B4,$B5,$D6
	.DB     $00,$00,$95,$C0
                               		; 0x82
	.DB $55,$02,$C7,$01,$01
	.DB     $02,$DD,$01,$01
	.DB     $02,$01,$01,$01
	.DB     $C1,$01,$01,$01
                               		; 0x83
	.DB $55,$BB,$00,$CA,$00
	.DB     $D3,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x84
	.DB $55,$00,$00,$CD,$E7
	.DB     $00,$00,$00,$BC
	.DB     $00,$00,$00,$BE
	.DB     $E6,$DF,$D5,$D7
                               		; 0x85
	.DB $55,$C3,$01,$01,$01
	.DB     $BD,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01				; END

_F}_CHEERLEADER_KISS_HALFTIME_TILES	

_F{_SKY_BANK_0_TILES	

                              		; 0x86 BLANK TILE 
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01

_F}_SKY_BANK_0_TILES		

_F{_GRASS_AND_CHAIN_TILES
	
												; 0x87 BLANK TILE + CHAIN LINK 
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $AA,$AA,$AA,$AA
	
_F}_GRASS_AND_CHAIN_TILES	

_F{_COLOR_1_THEN_0_TILES                               		
												; 0x88 TWO COLOR BLANK TILE BARRIER USED FOR SPLIT SCREEN (REF, LT TACKLE INTRO)
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00

_F}_COLOR_1_THEN_0_TILES	
	
_F{_CHAIN_MARKER_PART_OF_REF_TILES	
												; FIRST DOWN MARKER AND PART OF REF
                              		; 0x89 
	.DB $00,$01,$01,$01,$80
	.DB     $01,$01,$01,$82
	.DB     $01,$01,$01,$88
	.DB     $01,$01,$01,$01
                               		; 0x8A
	.DB $00,$81,$84,$01,$01
	.DB     $83,$86,$01,$01
	.DB     $89,$8C,$01,$01
	.DB     $8B,$8E,$2A,$39
                               		; 0x8B
	.DB $00,$A1,$A4,$3A,$3B
	.DB     $A3,$8A,$56,$57
	.DB     $A9,$A0,$70,$55
	.DB     $AB,$01,$01,$01
                              		; 0x8C
	.DB $00,$A2,$01,$01,$01
	.DB     $A2,$01,$01,$01
	.DB     $A2,$01,$01,$01
	.DB     $A8,$01,$01,$01				; END

_F}_CHAIN_MARKER_PART_OF_REF_TILES	

_F{_OFFENSIVE_LINEMAN_INTRO_TILES
																
                               		; 0x8D
	.DB $F0,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$87
	.DB     $88,$89,$8C,$8D
                               		; 0x8E
	.DB $70,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $92,$93,$96,$97
	.DB     $98,$99,$9C,$9D
                               		; 0x8F
	.DB $10,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $84,$00,$00,$00
	.DB     $86,$00,$00,$00
                               		; 0x90
	.DB $55,$8A,$8B,$8E,$01
	.DB     $A0,$A1,$A4,$A5
	.DB     $00,$A3,$A6,$A7
	.DB     $00,$A9,$AC,$AD
                               		; 0x91
	.DB $13,$9A,$9B,$9E,$9F
	.DB     $B0,$B1,$B4,$B5
	.DB     $B2,$B3,$B6,$B7
	.DB     $B8,$B9,$BC,$BD
                               		; 0x92
	.DB $00,$8F,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $A2,$00,$00,$00
	.DB     $A8,$00,$00,$00
                               		; 0x93
	.DB $08,$00,$00,$00,$00
	.DB     $00,$00,$00,$85
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                              		; 0x94
	.DB $0A,$AA,$AB,$AE,$AF
	.DB     $90,$91,$94,$95
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0x95
	.DB $02,$BA,$00,$BE,$BF
	.DB     $00,$00,$00,$BB
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01				
                               		; 0x96
	.DB $00,$00,$00,$00,$00
	.DB     $83,$00,$00,$00
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01				;  END

_F}_OFFENSIVE_LINEMAN_INTRO_TILES	

_F{_COLOR_0_THEN_1_TILES   
                              		; 0x97 = TWO COLOR BARRIER
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	
_F}_COLOR_0_THEN_1_TILES  	

_F{_LINEBACKER_FOR_TACKLE_INTRO_TILES
								; LINEBACKER COMING FOR TACKLE (INTRO_
                               		; 0x98
	.DB $50,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$80,$81
                               		; 0x99
	.DB $50,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $00,$00,$00,$00
	.DB     $84,$85,$90,$91
                               		; 0x9A
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$9B
	.DB     $00,$00,$00,$B1
	.DB     $00,$00,$B0,$B3
                               		; 0x9B
	.DB $65,$00,$00,$82,$83
	.DB     $9E,$9F,$88,$89
	.DB     $B4,$B5,$8A,$8B
	.DB     $B6,$B7,$A0,$A1			

                              		; 0x9C
	.DB $19,$86,$87,$92,$93
	.DB     $8C,$8D,$98,$99
	.DB     $8E,$8F,$00,$00
	.DB     $A4,$00,$00,$00
                               		; 0x9D
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$AB
	.DB     $00,$00,$94,$95
	.DB     $00,$9C,$96,$97
                               		; 0x9E
	.DB $AF,$00,$AD,$B8,$B9
	.DB     $AE,$AF,$BA,$BB
	.DB     $C0,$C1,$A8,$A9
	.DB     $C2,$C3,$AA,$9A
                               		; 0x9F
	.DB $26,$BC,$BD,$00,$A3
	.DB     $BE,$BF,$00,$00
	.DB     $AC,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0xA0
	.DB $AA,$A6,$A7,$B2,$00
	.DB     $A2,$A5,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00				; END
	
_F}_LINEBACKER_FOR_TACKLE_INTRO_TILES	

_F{_COLOR_1_THEN_0_VERTICAL_TILES

                               		; 0xA1 = TWO COLOR VERTICAL BARRIER FOR PUNT SCREEN
	.DB $55,$01,$01,$00,$00
	.DB     $01,$01,$00,$00
	.DB     $01,$01,$00,$00
	.DB     $01,$01,$00,$00
	
_F}_COLOR_1_THEN_0_VERTICAL_TILES	

_F{_PLAYER_ON_GROUND_AFTER_SACK_INTRO_TILES
												; PLAYER LAYING ON GROUND
                             		; 0xA2
	.DB $0F,$00,$CC,$E0,$E1
	.DB     $00,$9D,$C8,$C9
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                              		; 0xA3
	.DB $00,$C6,$C7,$D2,$D3
	.DB     $00,$CD,$D8,$D9
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0xA4
	.DB $06,$D6,$D7,$DE,$00
	.DB     $DC,$DD,$F4,$00
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0xA5
	.DB $08,$00,$00,$00,$00
	.DB     $00,$00,$00,$CE
	.DB     $00,$00,$00,$E4
	.DB     $00,$00,$CA,$CB
                               		; 0xA6
	.DB $82,$00,$00,$00,$00
	.DB     $CF,$00,$00,$00
	.DB     $E5,$F0,$00,$00
	.DB     $C4,$C5,$D0,$D1
                               		; 0xA7
	.DB $40,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$DA,$DB,$00
	.DB     $D4,$D5,$F1,$00				; END

_F}_PLAYER_ON_GROUND_AFTER_SACK_INTRO_TILES

_F{_DIVISION_CHAMP_TILES								
												; DIVISION CHAMP CELEBRATION
                            ; 0xA8
	.DB $95,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$04,$05
                               		; 0xA9
	.DB $D5,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$10
	.DB     $00,$00,$00,$00
                               		; 0xAA
	.DB $75,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $11,$00,$00,$00
	.DB     $13,$00,$00,$50
                               		; 0xAB
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $1A,$1B,$00,$00
                               		; 0xAC
	.DB $D9,$00,$00,$06,$07
	.DB     $00,$00,$0C,$0D
	.DB     $00,$00,$00,$40
	.DB     $00,$00,$00,$42
                               		; 0xAD
	.DB $76,$12,$00,$00,$00
	.DB     $18,$00,$00,$00
	.DB     $41,$00,$00,$00
	.DB     $13,$00,$00,$50
                               		; 0xAE
	.DB $15,$00,$00,$00,$00
	.DB     $00,$00,$81,$00
	.DB     $00,$82,$83,$00
	.DB     $00,$00,$80,$00
                               		; 0xAF
	.DB $59,$00,$00,$06,$07
	.DB     $00,$00,$0C,$0D
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$08,$09
                               		; 0xB0
	.DB $AA,$12,$00,$00,$00
	.DB     $18,$16,$17,$00
	.DB     $00,$1C,$1D,$48
	.DB     $0F,$1E,$00,$4A
                               		; 0xB1
	.DB $83,$19,$44,$00,$52
	.DB     $43,$46,$00,$00
	.DB     $49,$4C,$16,$17
	.DB     $4B,$4E,$1C,$1D
                               		; 0xB2
	.DB $ED,$00,$00,$10,$11
	.DB     $00,$00,$56,$57
	.DB     $00,$00,$5C,$5D
	.DB     $5A,$5B,$5E,$5F
                               		; 0xB3
	.DB $48,$30,$31,$16,$17
	.DB     $00,$00,$1C,$1D
	.DB     $45,$4D,$00,$00
	.DB     $47,$4F,$00,$00
                               		; 0xB4
	.DB $AA,$00,$00,$00,$00
	.DB     $5A,$16,$17,$55
	.DB     $00,$1C,$1D,$48
	.DB     $0F,$1E,$00,$4A
                               		; 0xB5
	.DB $43,$19,$44,$00,$52
	.DB     $43,$46,$00,$00
	.DB     $49,$4C,$00,$00
	.DB     $4B,$4E,$00,$00
                               		; 0xB6
	.DB $6E,$00,$00,$00,$75
	.DB     $51,$54,$00,$77
	.DB     $53,$00,$7C,$7D
	.DB     $59,$7B,$7E,$7F
                              		; 0xB7
	.DB $05,$00,$0A,$0B,$02
	.DB     $00,$20,$21,$24
	.DB     $00,$22,$23,$26
	.DB     $00,$28,$29,$00
                               		; 0xB8
	.DB $55,$25,$34,$35,$60
	.DB     $27,$32,$01,$62
	.DB     $33,$36,$37,$68
	.DB     $39,$3C,$3D,$6A
                               		; 0xB9
	.DB $55,$61,$00,$1E,$00
	.DB     $63,$25,$34,$35
	.DB     $69,$27,$0E,$01
	.DB     $6B,$02,$01,$6F
                               		; 0xBA
	.DB $55,$70,$71,$74,$00
	.DB     $72,$73,$00,$00
	.DB     $78,$79,$00,$00
	.DB     $7A,$00,$00,$00
                               		; 0xBB
	.DB $55,$00,$00,$00,$2E
	.DB     $00,$00,$2A,$2B
	.DB     $00,$00,$14,$15
	.DB     $00,$39,$3E,$00
                               		; 0xBC
	.DB $55,$25,$34,$35,$60
	.DB     $27,$32,$01,$62
	.DB     $33,$36,$6F,$68
	.DB     $39,$3C,$2D,$6A
                               		; 0xBD
	.DB $59,$61,$00,$16,$17
	.DB     $58,$00,$1C,$1D
	.DB     $00,$00,$1E,$00
	.DB     $63,$25,$34,$35
                               		; 0xBE
	.DB $DF,$00,$10,$11,$00
	.DB     $00,$00,$13,$00
	.DB     $70,$71,$19,$44
	.DB     $72,$73,$2F,$3A
                              		; 0xBF
	.DB $59,$00,$00,$16,$17
	.DB     $00,$00,$1C,$1D
	.DB     $00,$00,$1E,$00
	.DB     $00,$00,$34,$35
                               		; 0xC0
	.DB $55,$3B,$3E,$3F,$00
	.DB     $14,$15,$00,$00
	.DB     $70,$71,$00,$00
	.DB     $72,$73,$00,$00
                              		; 0xC1
	.DB $55,$00,$39,$2C,$2D
	.DB     $00,$3B,$3E,$3F
	.DB     $00,$14,$15,$08
	.DB     $00,$00,$0A,$0B
                               		; 0xC2
	.DB $59,$38,$00,$16,$17
	.DB     $00,$00,$1C,$1D
	.DB     $09,$00,$1E,$00
	.DB     $02,$25,$34,$35
                               		; 0xC3
	.DB $55,$00,$14,$15,$00
	.DB     $00,$00,$00,$00
	.DB     $70,$71,$00,$00
	.DB     $72,$73,$00,$00
                               		; 0xC4
	.DB $15,$3B,$3E,$3F,$0A
	.DB     $14,$15,$00,$20
	.DB     $00,$00,$00,$22
	.DB     $00,$00,$00,$00
                              		; 0xC5
	.DB $45,$0B,$27,$0E,$01
	.DB     $21,$33,$36,$6F
	.DB     $23,$39,$6D,$2D
	.DB     $00,$3B,$3E,$3F
                              		; 0xC6
	.DB $55,$78,$79,$00,$00
	.DB     $7A,$00,$00,$00
	.DB     $38,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xC7
	.DB $75,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $64,$00,$00,$00
	.DB     $66,$00,$00,$00
                               		; 0xC8
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$81
	.DB     $00,$00,$82,$83
                              		; 0xC9
	.DB $15,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$50
	.DB     $1A,$1B,$00,$52
                               		; 0xCA
	.DB $57,$6C,$00,$00,$00
	.DB     $6E,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$08,$09
                               		; 0xCB
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$16,$17,$00
	.DB     $00,$1C,$1D,$5A
	.DB     $0F,$1E,$00,$4A
                               		; 0xCC
	.DB $88,$30,$31,$00,$00
	.DB     $00,$00,$00,$51
	.DB     $45,$4D,$00,$53
	.DB     $87,$4F,$00,$00
                               		; 0xCD
	.DB $AA,$00,$00,$00,$00
	.DB     $54,$16,$17,$55
	.DB     $00,$1C,$1D,$48
	.DB     $0F,$1E,$00,$4A
                               		; 0xCE
	.DB $43,$19,$44,$00,$52
	.DB     $43,$46,$00,$00
	.DB     $49,$4C,$00,$00
	.DB     $4B,$00,$00,$00
                               		; 0xCF
	.DB $AF,$6C,$00,$00,$00
	.DB     $6E,$00,$00,$82
	.DB     $00,$16,$17,$00
	.DB     $00,$1C,$1D,$5A
                               		; 0xD0
	.DB $FF,$81,$10,$11,$00
	.DB     $83,$56,$57,$00
	.DB     $80,$5C,$5D,$00
	.DB     $5B,$5E,$5F,$00
                               		; 0xD1
	.DB $55,$25,$34,$35,$60
	.DB     $27,$32,$01,$62
	.DB     $33,$36,$65,$68
	.DB     $39,$3C,$67,$6A
                              		; 0xD2
	.DB $55,$61,$00,$00,$2E
	.DB     $58,$00,$2A,$2B
	.DB     $00,$00,$14,$15
	.DB     $00,$88,$3E,$00
                              		; 0xD3
	.DB $55,$25,$34,$35,$60
	.DB     $27,$32,$01,$62
	.DB     $33,$01,$37,$68
	.DB     $39,$2C,$3D,$6A
                              		; 0xD4
	.DB $55,$61,$00,$00,$00
	.DB     $58,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xD5
	.DB $55,$39,$84,$85,$00
	.DB     $00,$86,$36,$63
	.DB     $00,$14,$76,$69
	.DB     $00,$00,$1F,$6B
                               		; 0xD6
	.DB $55,$00,$1E,$00,$70
	.DB     $25,$34,$35,$72
	.DB     $27,$0E,$01,$68
	.DB     $02,$36,$37,$6A
                              		; 0xD7
	.DB $59,$71,$74,$16,$17
	.DB     $73,$00,$1C,$1D
	.DB     $00,$00,$1E,$00
	.DB     $63,$25,$34,$35
                               		; 0xD8
	.DB $55,$3B,$3E,$3F,$00
	.DB     $14,$15,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xD9
	.DB $55,$00,$14,$15,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xDA
	.DB $15,$39,$6D,$3D,$0A
	.DB     $3B,$3E,$3F,$20
	.DB     $14,$15,$00,$22
	.DB     $00,$00,$00,$00
                               		; 0xDB
	.DB $45,$0B,$27,$0E,$01
	.DB     $21,$33,$36,$7A
	.DB     $23,$39,$6D,$7A
	.DB     $00,$3B,$3E,$3F				; END
	
_F}_DIVISION_CHAMP_TILES	

_F{_STADIUM_OVERHANG_MULTIPLE_USE_TILES	

           ; 0xDC  STADIUM OVERHANG FOR KICKING CHEERLEADERS
	.DB $55,$7D,$7D,$7D,$7D
	.DB     $7F,$7F,$7F,$7E
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00						; END
	
_F}_STADIUM_OVERHANG_MULTIPLE_USE_TILES		

_F{_BOTTOM_OF_DOUBLE_DECKER_FOR_FG_ATTEMPT_TILES

                               		; 0XDD STADIUM TILE FOR STADIUM WITH FG POST SCREEN
	.DB $00,$01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
	.DB     $AD,$AC,$BA,$BB
	.DB     $AE,$AE,$BE,$BF
                               		; 0xDE
	.DB $00,$01,$01,$01,$01
	.DB     $A6,$A6,$A6,$A6
	.DB     $AC,$AD,$AC,$9F
	.DB     $AF,$AE,$AF,$B5						; END
	
_F}_BOTTOM_OF_DOUBLE_DECKER_FOR_FG_ATTEMPT_TILES	

_F{_SINGLE_COLOR_FOR_CHEER_LEADER_WINK_TILES               
																; 0xDF = BLANK TILE USED IN CHEERLADER ONE ARM, 
	.DB $00,$03,$03,$03,$03
	.DB     $03,$03,$03,$03
	.DB     $03,$03,$03,$03
	.DB     $03,$03,$03,$03
	
_F}_SINGLE_COLOR_FOR_CHEER_LEADER_WINK_TILES	

_F{_STADIUM_EXIT_DOORS_TILES     
												; 0xE0 STADIUM EXIT DOORS
	.DB $F5,$00,$F8,$00,$00
	.DB     $00,$7C,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $FB,$00,$FB,$FE						; END
	
_F}_STADIUM_EXIT_DOORS_TILES 	

_F{_UPPER_DECK_OF_STADIUM_MULTIPLE_USES_TILES

                               		; 0xE1 UPPER DECK OF STADIUM
	.DB $F5,$00,$00,$7B,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $FB,$FE,$FB,$FE
                              		; 0xE2
	.DB $F5,$00,$00,$00,$7B
	.DB     $00,$7C,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $FB,$00,$FB,$FE
                               		; 0xE3 TOP OF STADIUM BEFORE SKY
	.DB $5A,$64,$65,$70,$64
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$7B,$00
	.DB     $78,$79,$7A,$78						; END
	
_F}_UPPER_DECK_OF_STADIUM_MULTIPLE_USES_TILES	

_F{_UNUSED_3_BANK_0_TILES

												; 0xE4 *** NOT USED
	.DB $FF,$6A,$6B,$6A,$6B
	.DB     $6E,$6F,$6E,$6F
	.DB     $6A,$6B,$6A,$6B
	.DB     $6E,$6F,$6E,$6F

_F}_UNUSED_3_BANK_0_TILES	
	
_F{_GRASS_STRIPING_PUNT_FG_TILES	         
												   ; 0xE5
	.DB $55,$00,$01,$01,$01
	.DB     $00,$01,$01,$01
	.DB     $00,$01,$01,$01
	.DB     $00,$01,$01,$01
	
_F}_GRASS_STRIPNIG_PUNT_FG_TILES	

_F{_UNUSED_4_BANK_0_TILES	
                             		; 0xE6 NOT USED
	.DB $55,$00,$00,$01,$01
	.DB     $00,$00,$01,$01
	.DB     $00,$00,$01,$01
	.DB     $00,$00,$01,$01

_F}_UNUSED_4_BANK_0_TILES	

_F{_STADIUM_BOTTOM_LARGE_MULTIPLE_USE_TILES
	
         ; 0xE7 STADIUM CROWD AND BARRIER BETWEEN UPPER AND LOWER DECK
	.DB $5F,$6A,$6B,$6A,$6B
	.DB     $EF,$FA,$F9,$FC
	.DB     $7D,$7D,$7D,$7D
	.DB     $7F,$7F,$7F,$7E
                               		; 0xE8
	.DB $5F,$6A,$F5,$6A,$6B
	.DB     $F9,$F7,$F9,$FC
	.DB     $7D,$F0,$7D,$7D
	.DB     $7F,$F2,$7F,$7E						; END
	
_F}_STADIUM_BOTTOM_LARGE_MULTIPLE_USE_TILES

_F{_STADIUM_MULTIPLE_USE_TILES
												; CROWD AND STADIUM PUNT,FG, CREDITS, CHEER HALFTIME
         ; 0xE9
	.DB $00,$E6,$E6,$E6,$E6
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
                               		; 0xEA
	.DB $AF,$6A,$6B,$6A,$6B
	.DB     $EF,$FA,$F9,$FC
	.DB     $F1,$F4,$FD,$FD
	.DB     $F3,$F6,$F3,$F6
                              		; 0xEB
	.DB $AF,$6A,$F5,$6A,$6B
	.DB     $F9,$F7,$F9,$FC
	.DB     $FD,$FD,$FD,$FD
	.DB     $F3,$F6,$F3,$F6
                              		; 0xEC
	.DB $AF,$6A,$6B,$6A,$6B
	.DB     $EF,$FA,$F9,$FC
	.DB     $FD,$FD,$FD,$FD
	.DB     $00,$FF,$FF,$00				
                               		; 0xED
	.DB $FF,$00,$00,$00,$00
	.DB     $FB,$FE,$FB,$FE
	.DB     $6A,$6B,$6A,$6B
	.DB     $6E,$6F,$6E,$6F		    ; END
	
_F}_STADIUM_MULTIPLE_USE_TILES	

_F{_GRASS_AND_BLACK_COIN_TOSS_TILES
                               		; 0XEE GRASS AND BLACK PORTION OF SCREEN
	.DB $05,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	
_F}GRASS_AND_BLACK_COIN_TOSS_TILES	
		

.PAD $9000, $FF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_F{_SINGLE_COLOR_BANK_1_TILES
								
                               		; 0x00 bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x01 bank offset: 1
	.DB $55,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                                		; 0x02 bank offset: 1
	.DB $AA,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
                               		; 0x03 bank offset: 1
	.DB $FF,$03,$03,$03,$03
	.DB     $03,$03,$03,$03
	.DB     $03,$03,$03,$03
	.DB     $03,$03,$03,$03
	
_F}_SINGLE_COLOR_BANK_1_TILES	

_F{_CITY_SKYLINE_TOP_INTRO_TILES

								; CITY SKYLINE TOP (0X04-0X1F)

                               		; 0x04 bank offset: 1
	.DB $FF,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$40,$41
                              		; 0x05 bank offset: 1
	.DB $FF,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $44,$45,$49,$4C
                               		; 0x06 bank offset: 1
	.DB $FF,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $4D,$02,$02,$02
                               		; 0x07 bank offset: 1
	.DB $FF,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$15,$02,$02
	.DB     $02,$17,$02,$02
                               		; 0x08 bank offset: 1
	.DB $FF,$02,$02,$02,$02
	.DB     $04,$02,$02,$04
	.DB     $06,$06,$06,$06
	.DB     $05,$05,$07,$05
                               		; 0x09 bank offset: 1
	.DB $FF,$02,$02,$02,$02
	.DB     $02,$02,$04,$02
	.DB     $06,$06,$06,$06
	.DB     $07,$05,$07,$07
                               		; 0x0A bank offset: 1
	.DB $FF,$02,$14,$02,$02
	.DB     $02,$16,$02,$04
	.DB     $18,$19,$06,$05
	.DB     $1A,$1B,$1C,$05
                               		; 0x0B bank offset: 1
	.DB $FF,$02,$02,$02,$02
	.DB     $02,$04,$02,$02
	.DB     $06,$06,$06,$06
	.DB     $05,$05,$05,$07
                              		; 0x0C bank offset: 1
	.DB $77,$02,$02,$42,$43
	.DB     $04,$04,$47,$48
	.DB     $06,$06,$4F,$46
	.DB     $08,$08,$4E,$4B
                               		; 0x0D bank offset: 1
	.DB $55,$46,$00,$4B,$46
	.DB     $00,$00,$4B,$00
	.DB     $4B,$00,$00,$54
	.DB     $46,$00,$4B,$54
                               		; 0x0E bank offset: 1
	.DB $FF,$00,$02,$02,$02
	.DB     $58,$40,$41,$44
	.DB     $00,$5A,$46,$00
	.DB     $59,$5B,$00,$46
                               		; 0x0F bank offset: 1
	.DB $5F,$02,$17,$02,$02
	.DB     $45,$4A,$4C,$4D
	.DB     $4B,$4B,$00,$00
	.DB     $00,$46,$64,$65
                              		; 0x10 bank offset: 1
	.DB $FF,$09,$0A,$09,$09
	.DB     $0C,$0D,$10,$11
	.DB     $01,$0C,$12,$13
	.DB     $01,$01,$00,$00
                               		; 0x11 bank offset: 1
	.DB $FF,$0A,$0B,$09,$0B
	.DB     $0D,$0C,$0C,$0D
	.DB     $0C,$01,$01,$0C
	.DB     $01,$01,$01,$01
                               		; 0x12 bank offset: 1
	.DB $DF,$2C,$2D,$2F,$30
	.DB     $2E,$2D,$32,$31
	.DB     $34,$35,$38,$33
	.DB     $36,$37,$3A,$39
                               		; 0x13 bank offset: 1
	.DB $FF,$0A,$09,$0B,$09
	.DB     $0E,$0D,$0D,$0D
	.DB     $0F,$0C,$0C,$0C
	.DB     $01,$01,$01,$01
                               		; 0x14 bank offset: 1
	.DB $77,$0A,$09,$00,$4B
	.DB     $0D,$0D,$50,$52
	.DB     $0C,$0C,$4E,$46
	.DB     $01,$01,$00,$51
                               		; 0x15 bank offset: 1
	.DB $55,$4B,$53,$4B,$56
	.DB     $46,$46,$46,$63
	.DB     $00,$46,$54,$4B
	.DB     $4B,$46,$56,$56
                               		; 0x16 bank offset: 1
	.DB $77,$00,$5C,$4E,$4B
	.DB     $58,$5E,$00,$46
	.DB     $00,$5D,$46,$00
	.DB     $59,$5F,$50,$46
                               		; 0x17 bank offset: 1
	.DB $55,$53,$00,$00,$56
	.DB     $46,$46,$46,$63
	.DB     $46,$00,$66,$67
	.DB     $53,$54,$00,$68
                               		; 0x18 bank offset: 1
	.DB $77,$23,$23,$1E,$1D
	.DB     $24,$24,$1F,$20
	.DB     $82,$83,$86,$00
	.DB     $00,$00,$84,$A5
                               		; 0x19 bank offset: 1
	.DB $FF,$23,$23,$23,$29
	.DB     $24,$24,$24,$2B
	.DB     $88,$89,$27,$21
	.DB     $00,$00,$28,$22
                               		; 0x1A bank offset: 1
	.DB $55,$6A,$6B,$6F,$7A
	.DB     $6A,$6B,$00,$00
	.DB     $6A,$00,$6F,$7A
	.DB     $00,$00,$00,$00
                              		; 0x1B bank offset: 1
	.DB $FF,$23,$23,$23,$23
	.DB     $24,$24,$24,$24
	.DB     $26,$25,$26,$26
	.DB     $72,$3B,$3B,$3B
                               		; 0x1C bank offset: 1
	.DB $77,$23,$23,$00,$56
	.DB     $24,$24,$4F,$4B
	.DB     $26,$26,$6D,$00
	.DB     $3B,$80,$00,$C7
                               		; 0x1D bank offset: 1
	.DB $55,$4B,$00,$00,$4B
	.DB     $00,$53,$46,$56
	.DB     $00,$69,$6C,$68
	.DB     $D0,$A1,$A4,$00
                              		; 0x1E bank offset: 1
	.DB $77,$00,$60,$4B,$46
	.DB     $58,$62,$50,$46
	.DB     $00,$61,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x1F bank offset: 1
	.DB $55,$4B,$EA,$E5,$EF
	.DB     $53,$E9,$E5,$BB
	.DB     $46,$EB,$E7,$B5
	.DB     $53,$E9,$00,$70				; END
								;
								
_F}_CITY_SKYLINE_TOP_INTRO_TILES								

_F{_TECMO_SPORTS_NEWS_TILES

												; TECMO SPORTS NEWS SPLIT SCREEN UNDER SCOREBOARD
                              		; 0x20 bank offset: 1 = TECMO SPORTS NEWS
	.DB $00,$00,$00,$00,$00
	.DB     $00,$54,$45,$43
	.DB     $00,$00,$53,$50
	.DB     $00,$00,$00,$4E
                               		; 0x21 bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $4D,$4F,$00,$00
	.DB     $4F,$52,$54,$53
	.DB     $45,$57,$53,$00
                               		; 0x22 bank offset: 1
	.DB $A0,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $DC,$DD,$C4,$C5
	.DB     $DE,$DF,$C6,$C7
                               		; 0x23 bank offset: 1
	.DB $A0,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $94,$91,$C0,$C1
	.DB     $96,$93,$C2,$C3
                               		; 0x24 bank offset: 1
	.DB $A0,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $90,$91,$00,$00
	.DB     $92,$93,$00,$00
                               		; 0x25 bank offset: 1 = BLUE AND WHITE UNDERLINE
	.DB $0A,$00,$00,$00,$00
	.DB     $5D,$5D,$5D,$5D
	.DB     $6B,$6B,$6B,$6B
	.DB     $00,$00,$00,$00
								; "NFL" LARGE LETTERS SPLIT SCREEN UNDER SCOREBOARD
                              		; 0x26 bank offset: 1
	.DB $00,$8C,$99,$C0,$C1
	.DB     $8E,$9B,$CA,$A4
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x27 bank offset: 1
	.DB $00,$84,$00,$00,$00
	.DB     $96,$AA,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00				; END
	
_F}_TECMO_SPORTS_NEWS_TILES	

_F{_CITY_SKYLINE_AND_STADIUM_INTRO_TILES

           ; 0x28 PART OF CITY SKYLINE UPPER LEFT 
	.DB $55,$AA,$A3,$A4,$00
	.DB     $AB,$A7,$AC,$AE
	.DB     $A2,$00,$86,$A5
	.DB     $A8,$A9,$A6,$AF
	
                               		; 0x29  *** UNUSED
	.DB $55,$00,$9A,$00,$57
	.DB     $00,$9A,$00,$57
	.DB     $90,$98,$71,$00
	.DB     $92,$B0,$73,$57				

												; STADIUM VERTICAL SCROLL INTRO
                               		; 0x2A bank offset: 1
	.DB $55,$BA,$93,$9E,$9D
	.DB     $B8,$93,$9C,$9D
	.DB     $BA,$93,$96,$97
	.DB     $B8,$93,$9B,$95
                               		; 0x2B bank offset: 1
	.DB $55,$C0,$CA,$9C,$B3
	.DB     $C8,$00,$9E,$B9
	.DB     $00,$00,$96,$9D
	.DB     $C0,$C3,$9C,$C1
                               		; 0x2C bank offset: 1
	.DB $57,$79,$7F,$C6,$CE
	.DB     $7B,$7E,$00,$00
	.DB     $B4,$B7,$C6,$CD
	.DB     $B6,$98,$C6,$CD
                               		; 0x2D bank offset: 1
	.DB $55,$A0,$A3,$A6,$A5
	.DB     $A2,$00,$D1,$A5
	.DB     $D8,$00,$00,$00
	.DB     $00,$00,$86,$00
                              		; 0x2E bank offset: 1
	.DB $55,$90,$9A,$00,$DB
	.DB     $92,$98,$DA,$D9
	.DB     $00,$B0,$DA,$DF
	.DB     $00,$00,$DA,$D5
                               		; 0x2F bank offset: 1
	.DB $55,$6E,$00,$00,$00
	.DB     $E0,$00,$00,$00
	.DB     $E1,$00,$E5,$8C
	.DB     $E2,$EC,$ED,$8F
                              		; 0x30 bank offset: 1
	.DB $05,$A2,$A3,$A6,$A5
	.DB     $A2,$A1,$A4,$AF
	.DB     $04,$05,$04,$05
	.DB     $10,$07,$06,$07
                               		; 0x31 bank offset: 1
	.DB $05,$92,$9A,$76,$57
	.DB     $90,$9A,$77,$B2
	.DB     $04,$05,$04,$05
	.DB     $10,$07,$06,$07
                               		; 0x32 bank offset: 1
	.DB $05,$B8,$99,$9E,$9D
	.DB     $BA,$91,$9C,$97
	.DB     $04,$05,$04,$05
	.DB     $10,$07,$06,$07
                               		; 0x33 bank offset: 1
	.DB $05,$C8,$C9,$9E,$9D
	.DB     $00,$CB,$9C,$B9
	.DB     $04,$05,$04,$05
	.DB     $10,$07,$06,$07
                               		; 0x34 bank offset: 1
	.DB $05,$BC,$BD,$C5,$CF
	.DB     $BE,$BF,$00,$00
	.DB     $04,$05,$04,$05
	.DB     $10,$07,$06,$07
                               		; 0x35 bank offset: 1
	.DB $05,$00,$A9,$A4,$AF
	.DB     $00,$A7,$D3,$AF
	.DB     $04,$05,$04,$05
	.DB     $10,$07,$06,$07
                               		; 0x36 bank offset: 1
	.DB $05,$00,$00,$DA,$D7
	.DB     $92,$9A,$00,$DD
	.DB     $04,$05,$04,$05
	.DB     $10,$07,$06,$07
                               		; 0x37 bank offset: 1
	.DB $05,$E3,$EE,$E5,$00
	.DB     $E8,$E9,$00,$00
	.DB     $04,$05,$04,$05
	.DB     $10,$07,$06,$07
                               		; 0x38 bank offset: 1
	.DB $00,$A0,$A1,$A4,$A5
	.DB     $A2,$A3,$A4,$AF
	.DB     $A2,$00,$86,$AF
	.DB     $A8,$A9,$A6,$A5
                               		; 0x39 bank offset: 1
	.DB $00,$08,$00,$12,$00
	.DB     $0A,$00,$00,$00
	.DB     $20,$00,$0B,$21
	.DB     $22,$00,$28,$29
                               		; 0x3A bank offset: 1
	.DB $00,$00,$00,$12,$00
	.DB     $00,$00,$00,$00
	.DB     $09,$09,$0C,$0E
	.DB     $29,$29,$29,$29
                               		; 0x3B bank offset: 1
	.DB $00,$00,$00,$12,$00
	.DB     $00,$00,$00,$00
	.DB     $23,$0C,$24,$23
	.DB     $29,$29,$29,$29
                               		; 0x3C bank offset: 1
	.DB $00,$00,$00,$12,$00
	.DB     $00,$00,$00,$00
	.DB     $0C,$23,$24,$0C
	.DB     $2C,$26,$0D,$2C
                               		; 0x3D bank offset: 1
	.DB $00,$00,$00,$12,$00
	.DB     $00,$00,$00,$00
	.DB     $09,$0B,$0B,$0E
	.DB     $26,$2C,$2C,$26
                               		; 0x3E bank offset: 1
	.DB $00,$00,$00,$12,$00
	.DB     $00,$00,$00,$00
	.DB     $23,$0C,$24,$24
	.DB     $2C,$2C,$26,$2C
                               		; 0x3F bank offset: 1
	.DB $00,$00,$00,$12,$00
	.DB     $00,$00,$00,$00
	.DB     $0C,$0E,$23,$0C
	.DB     $2C,$26,$0F,$0D
                               		; 0x40 bank offset: 1
	.DB $00,$00,$00,$12,$00
	.DB     $00,$00,$00,$00
	.DB     $24,$09,$0E,$0B
	.DB     $26,$0F,$0D,$0D
                               		; 0x41 bank offset: 1
	.DB $00,$00,$00,$2A,$2B
	.DB     $00,$00,$00,$11
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x42 bank offset: 1
	.DB $00,$2B,$2B,$2B,$2B
	.DB     $14,$15,$40,$41
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x43 bank offset: 1
	.DB $00,$2B,$2B,$2B,$2E
	.DB     $44,$45,$50,$51
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x44 bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$12,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x45 bank offset: 1
	.DB $00,$25,$25,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$12,$00,$19
	.DB     $00,$00,$00,$19
                               		; 0x46 bank offset: 1
	.DB $00,$00,$00,$33,$39
	.DB     $00,$00,$1C,$1D
	.DB     $1C,$34,$1C,$1D
	.DB     $1C,$36,$1C,$1D
                               		; 0x47 bank offset: 1
	.DB $00,$3C,$33,$3D,$25
	.DB     $48,$1C,$68,$00
	.DB     $48,$62,$43,$00
	.DB     $48,$1C,$43,$00
                              		; 0x48 bank offset: 1
	.DB $00,$13,$16,$17,$42
	.DB     $00,$00,$00,$00
	.DB     $00,$12,$00,$12
	.DB     $00,$00,$00,$00
                               		; 0x49 bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$21
	.DB     $00,$2D,$2F,$18
	.DB     $00,$00,$63,$69
                               		; 0x4A bank offset: 1
	.DB $00,$00,$09,$00,$00
	.DB     $27,$09,$09,$09
	.DB     $3A,$3B,$32,$38
	.DB     $6B,$46,$4C,$4E
                               		; 0x4B bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $0B,$0B,$09,$27
	.DB     $18,$18,$3E,$3E
	.DB     $64,$64,$66,$6C
                               		; 0x4C bank offset: 1
	.DB $00,$00,$09,$00,$00
	.DB     $27,$0F,$0F,$09
	.DB     $1A,$3A,$3F,$30
	.DB     $64,$6C,$6C,$64
                               		; 0x4D bank offset: 1
	.DB $00,$00,$00,$00,$19
	.DB     $27,$09,$00,$1B
	.DB     $3B,$3B,$6A,$31
	.DB     $6C,$66,$6E,$47
                               		; 0x4E bank offset: 1
	.DB $00,$1C,$36,$1C,$4A
	.DB     $1E,$1F,$35,$60
	.DB     $61,$61,$61,$61
	.DB     $47,$47,$47,$47
                              		; 0x4F bank offset: 1
	.DB $00,$48,$1C,$43,$09
	.DB     $37,$1E,$49,$0F
	.DB     $61,$61,$4B,$30
	.DB     $47,$47,$47,$52
                              		; 0x50 bank offset: 1
	.DB $00,$09,$0B,$0B,$0E
	.DB     $27,$0F,$0F,$27
	.DB     $3B,$3B,$6A,$18
	.DB     $6E,$66,$6E,$6E
                               		; 0x51 bank offset: 1
	.DB $55,$00,$00,$4D,$58
	.DB     $00,$4F,$02,$02
	.DB     $65,$67,$02,$02
	.DB     $67,$02,$02,$02
                              		; 0x52 bank offset: 1
	.DB $99,$6D,$6F,$72,$73
	.DB     $7A,$78,$01,$54
	.DB     $02,$02,$01,$53
	.DB     $02,$02,$01,$01
                               		; 0x53 bank offset: 1
	.DB $AA,$76,$76,$76,$70
	.DB     $55,$5D,$5D,$5D
	.DB     $56,$57,$5B,$5E
	.DB     $59,$5C,$5F,$77
                               		; 0x54 bank offset: 1
	.DB $AA,$71,$71,$71,$74
	.DB     $5D,$5D,$5D,$5D
	.DB     $5B,$5E,$5E,$5E
	.DB     $77,$77,$77,$77
                               		; 0x55 bank offset: 1
	.DB $AA,$75,$76,$76,$76
	.DB     $5D,$5D,$5D,$5D
	.DB     $5E,$5E,$5E,$5E
	.DB     $77,$77,$77,$77
                              		; 0x56 bank offset: 1
	.DB $AA,$76,$76,$76,$76
	.DB     $5D,$5D,$5D,$5D
	.DB     $5E,$5E,$5E,$5E
	.DB     $77,$77,$77,$77				; END
	
_F}_CITY_SKYLINE_AND_STADIUM_INTRO_TILES	

_F{_FLAG_POLES_LARGE_SCOREBOARD_TILES                              		; 0x57 bank offset: 1 = FLAG POLES SCOREBOARD
	.DB $00,$01,$90,$01,$01
	.DB     $01,$90,$01,$01
	.DB     $01,$90,$01,$01
	.DB     $01,$90,$01,$01
	
_F}_FLAG_POLES_LARGE_SCOREBOARD_TILES 	
	
_F{_CITY_SKYLINE_2_TILES                               		; 0x58 bank offset: 1 = PART OF CITY SKYLINE

	.DB $55,$00,$9A,$00,$57
	.DB     $00,$9A,$00,$57
	.DB     $90,$98,$71,$00
	.DB     $92,$B0,$73,$57
	
_F}_CITY_SKYLINE_2_TILES	

_F{_LARGE_SCOREBOARD_TILES

								; LARGE SCOREBOARD
                              		; 0x59 bank offset: 1
	.DB $00,$01,$92,$9A,$9A
	.DB     $01,$92,$B0,$B0
	.DB     $9A,$9A,$C1,$00
	.DB     $B0,$B0,$C1,$00
                              		; 0x5A bank offset: 1
	.DB $F0,$9A,$9A,$9A,$9A
	.DB     $B0,$B0,$B0,$B0
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x5B bank offset: 1
	.DB $04,$00,$C3,$B8,$9E
	.DB     $00,$C3,$B8,$C8
	.DB     $00,$C3,$AF,$AF
	.DB     $00,$C3,$00,$00
                               		; 0x5C bank offset: 1
	.DB $A1,$9B,$A7,$C1,$00
	.DB     $9D,$AD,$C1,$00
	.DB     $B3,$B6,$B7,$E2
	.DB     $B9,$BC,$BD,$E8
                               		; 0x5D bank offset: 1
	.DB $AF,$00,$00,$CB,$CE
	.DB     $00,$00,$00,$00
	.DB     $E3,$E6,$D5,$DD
	.DB     $E9,$EC,$D7,$DF
                               		; 0x5E bank offset: 1
	.DB $AF,$CB,$CE,$CB,$CE
	.DB     $00,$00,$00,$00
	.DB     $BA,$E0,$BB,$BF
	.DB     $B5,$E1,$BE,$E4
                               		; 0x5F bank offset: 1
	.DB $AF,$CB,$CE,$CB,$CE
	.DB     $00,$00,$00,$00
	.DB     $EA,$EE,$D5,$DD
	.DB     $EB,$B1,$D7,$DF
                               		; 0x60 bank offset: 1
	.DB $00,$9A,$9A,$98,$01
	.DB     $B0,$B0,$98,$01
	.DB     $00,$C3,$9A,$9A
	.DB     $00,$C3,$B0,$B0
                              		; 0x61 bank offset: 1
	.DB $10,$C4,$C6,$C1,$00
	.DB     $99,$99,$C1,$00
	.DB     $9B,$A7,$C1,$00
	.DB     $9C,$AD,$C1,$00
                              		; 0x62 bank offset: 1
	.DB $40,$00,$C3,$C6,$C4
	.DB     $00,$C3,$99,$99
	.DB     $00,$C3,$B2,$9B
	.DB     $00,$C3,$B8,$B4
                               		; 0x63 bank offset: 1
	.DB $01,$9E,$AD,$C1,$00
	.DB     $9D,$AD,$C1,$00
	.DB     $AF,$AF,$C1,$00
	.DB     $00,$00,$C1,$00
                               		; 0x64 bank offset: 1
	.DB $FF,$00,$00,$00,$00
	.DB     $00,$00,$9F,$CA
	.DB     $00,$00,$9F,$CA
	.DB     $00,$00,$C9,$CC
                               		; 0x65 bank offset: 1
	.DB $FF,$00,$00,$00,$00
	.DB     $9F,$CA,$9F,$CA
	.DB     $CA,$CA,$9F,$CA
	.DB     $C9,$CC,$C9,$CC
                              		; 0x66 bank offset: 1
	.DB $FF,$00,$00,$00,$00
	.DB     $9F,$9F,$CA,$CA
	.DB     $9F,$CA,$9F,$CA
	.DB     $C9,$CC,$C9,$CC
                               		; 0x67 bank offset: 1
	.DB $FF,$00,$00,$00,$00
	.DB     $9F,$C5,$D0,$D1
	.DB     $CA,$C7,$D2,$D3
	.DB     $CC,$CD,$D8,$D9
                              		; 0x68 bank offset: 1
	.DB $FF,$00,$00,$00,$00
	.DB     $D4,$9F,$C5,$D0
	.DB     $D6,$CA,$C7,$D2
	.DB     $DC,$CC,$CD,$D8
                               		; 0x69 bank offset: 1
	.DB $FF,$00,$00,$00,$00
	.DB     $D1,$D4,$00,$00
	.DB     $D3,$D6,$00,$00
	.DB     $D9,$DC,$00,$00
                               		; 0x6A bank offset: 1
	.DB $AF,$CE,$CF,$DA,$DB
	.DB     $00,$00,$00,$00
	.DB     $BA,$E0,$B3,$B6
	.DB     $B5,$E1,$B9,$BC
                               		; 0x6B bank offset: 1
	.DB $AF,$DE,$CE,$CF,$DA
	.DB     $00,$00,$00,$00
	.DB     $B7,$E2,$E3,$E6
	.DB     $BD,$E8,$E9,$EC
                               		; 0x6C bank offset: 1
	.DB $AF,$DB,$DE,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $D5,$DD,$BA,$E0
	.DB     $D7,$DF,$B5,$E1
                               		; 0x6D bank offset: 1
	.DB $A4,$00,$C3,$B2,$9B
	.DB     $00,$C3,$B8,$9D
	.DB     $BB,$BF,$EA,$EE
	.DB     $BE,$E4,$EB,$B1
                              		; 0x6E bank offset: 1
	.DB $50,$C4,$C6,$C6,$C4
	.DB     $99,$99,$99,$99
	.DB     $A7,$B2,$9C,$9B
	.DB     $AD,$B8,$B4,$9E
                              		; 0x6F bank offset: 1
	.DB $50,$C4,$C6,$C6,$C4
	.DB     $99,$99,$99,$99
	.DB     $9C,$9B,$9C,$9B
	.DB     $B4,$B4,$9C,$B4				;END
	
_F}_LARGE_SCOREBOARD_TILES	

_F{_TOP_VIEW_GOALPOSTS_P2_TILES
								; TOP VIEW GOALPOSTS P2 
                              		; 0x70 bank offset: 1
	.DB $44,$D2,$D2,$D4,$03
	.DB     $D3,$D0,$D6,$03
	.DB     $D0,$D1,$D4,$03
	.DB     $D2,$D3,$D6,$03
                               		; 0x71 bank offset: 1
	.DB $99,$03,$03,$DB,$02
	.DB     $03,$03,$DB,$02
	.DB     $03,$DA,$DC,$02
	.DB     $03,$D8,$DD,$F0
                               		; 0x72 bank offset: 1
	.DB $44,$D1,$D2,$D4,$03
	.DB     $D2,$D0,$D6,$03
	.DB     $D0,$D2,$D4,$03
	.DB     $D3,$D0,$D6,$03
                               		; 0x73 bank offset: 1
	.DB $99,$03,$D8,$E0,$02
	.DB     $D5,$CD,$E4,$02
	.DB     $D7,$CF,$E1,$02
	.DB     $03,$D8,$E0,$02
                               		; 0x74 bank offset: 1
	.DB $44,$D2,$D3,$D4,$03
	.DB     $D1,$D0,$D6,$03
	.DB     $D2,$D3,$D4,$03
	.DB     $D0,$D1,$D6,$03
                               		; 0x75 bank offset: 1
	.DB $99,$03,$D8,$DF,$E5
	.DB     $03,$D9,$DE,$02
	.DB     $03,$03,$DB,$02
	.DB     $03,$03,$DB,$02				; END
	
_F}_TOP_VIEW_GOALPOSTS_P2_TILES	

_F{_TOP_VIEW_GOALPOSTS_P1_TILES

								; TOP VIEW GOALPOSTS P1
                               		; 0x76 bank offset: 1
	.DB $77,$02,$EF,$03,$03
	.DB     $02,$EF,$03,$03
	.DB     $02,$F2,$BB,$03
	.DB     $EB,$E6,$BF,$03
                               		; 0x77 bank offset: 1
	.DB $77,$02,$EC,$BF,$03
	.DB     $02,$E7,$E2,$E3
	.DB     $02,$ED,$E8,$E9
	.DB     $02,$EC,$BF,$03
                              		; 0x78 bank offset: 1
	.DB $77,$EA,$EE,$BF,$03
	.DB     $02,$F8,$BE,$03
	.DB     $02,$EF,$03,$03
	.DB     $02,$EF,$03,$03
                               		; 0x79 bank offset: 1
	.DB $11,$03,$B3,$BC,$BC
	.DB     $03,$B9,$B6,$BD
	.DB     $03,$B3,$BD,$B6
	.DB     $03,$B9,$B7,$BC
                               		; 0x7A bank offset: 1
	.DB $11,$03,$B3,$BC,$B7
	.DB     $03,$B9,$B6,$BC
	.DB     $03,$B3,$BC,$B6
	.DB     $03,$B9,$B6,$BD
                              		; 0x7B bank offset: 1
	.DB $11,$03,$B3,$BD,$BC
	.DB     $03,$B9,$B6,$B7
	.DB     $03,$B3,$BD,$BC
	.DB     $03,$B9,$B7,$B6				; END
	
_F}_TOP_VIEW_GOALPOSTS_P1_TILES	

_F{_NFLPA_FOOTBALL_TILES
								; NFL PLAYERS ASSOCIATION FOOTBALL
                              		; 0x7C bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$C4,$C4
	.DB     $00,$00,$83,$83
	.DB     $00,$00,$83,$83
                               		; 0x7D bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $C4,$C4,$C4,$C4
	.DB     $83,$84,$85,$90
	.DB     $86,$87,$92,$93
                               		; 0x7E bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $C4,$C4,$C4,$C4
	.DB     $91,$94,$95,$83
	.DB     $96,$97,$C2,$C3
                               		; 0x7F bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $C4,$C4,$00,$00
	.DB     $83,$83,$00,$00
	.DB     $83,$83,$00,$00
                               		; 0x80 bank offset: 1
	.DB $00,$00,$00,$83,$83
	.DB     $00,$00,$83,$83
	.DB     $00,$00,$83,$83
	.DB     $00,$00,$83,$83
                               		; 0x81 bank offset: 1
	.DB $00,$88,$89,$8C,$8D
	.DB     $C0,$C1,$82,$82
	.DB     $E0,$8A,$8B,$82
	.DB     $83,$8E,$8F,$9A
                               		; 0x82 bank offset: 1
	.DB $00,$98,$99,$9C,$9D
	.DB     $82,$82,$C8,$C9
	.DB     $82,$9F,$CB,$E1
	.DB     $9B,$9E,$CA,$83
                               		; 0x83 bank offset: 1
	.DB $00,$83,$83,$00,$00
	.DB     $83,$83,$00,$00
	.DB     $83,$83,$00,$00
	.DB     $83,$83,$00,$00				; END
	
_F}_NFLPA_FOOTBALL_TILES	

_F{_NFL_SHIELD_PART1_INTRO_TILES
								; TEAM +NFL SHIELD INTRO PART 1 
                              		; 0x84 bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$46,$45,$50
	.DB     $00,$4F,$47,$52
                               		; 0x85 bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $51,$54,$54,$54
	.DB     $53,$56,$57,$20
                               		; 0x86 bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $54,$54,$55,$54
	.DB     $21,$24,$25,$30
                               		; 0x87 bank offset: 1
	.DB $55,$00,$4F,$02,$58
	.DB     $00,$4F,$02,$5A
	.DB     $00,$64,$65,$65
	.DB     $00,$00,$00,$00				; END

_F}_NFL_SHIELD_PART1_INTRO_TILES	
								
_F{_RECOVERY_HOSPITAL_TILES
												; RECOVERY HOSPITAL (DOESN'T GO LEFT TO RIGHT)
						; 0x88 bank offset: 1
	.DB $F5,$2D,$2D,$2D,$2D
	.DB     $02,$5B,$2F,$2F
	.DB     $5B,$00,$53,$54
	.DB     $02,$02,$02,$02

                               		; 0x89 bank offset: 1
	.DB $00,$00,$00,$00,$FD
	.DB     $00,$00,$00,$F8
	.DB     $00,$00,$00,$F8
	.DB     $00,$00,$00,$FA

                               		; 0x8A bank offset: 1
	.DB $00,$FC,$FC,$F6,$F7
	.DB     $03,$03,$F8,$03
	.DB     $FE,$FE,$F8,$03
	.DB     $03,$03,$FA,$03

                               		; 0x8B bank offset: 1
	.DB $00,$F7,$F7,$F7,$F7
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01

                               		; 0x8C bank offset: 1
	.DB $00,$F7,$F7,$F9,$FC
	.DB     $FF,$F8,$FF,$03
	.DB     $FF,$F8,$FF,$FE
	.DB     $FF,$FA,$FF,$03

                               		; 0x8D bank offset: 1
	.DB $00,$FC,$FD,$01,$00
	.DB     $03,$F8,$01,$00
	.DB     $FE,$F8,$01,$00
	.DB     $03,$FA,$01,$00

                               		; 0x8E bank offset: 1
	.DB $30,$00,$00,$00,$00
	.DB     $00,$00,$00,$F5
	.DB     $00,$00,$00,$F8
	.DB     $00,$00,$00,$F8

                               		; 0x8F bank offset: 1
	.DB $00,$00,$00,$FA,$F3
	.DB     $F5,$F5,$F6,$F7
	.DB     $03,$03,$F8,$F1
	.DB     $FE,$FE,$FA,$F3

                              		; 0x90 bank offset: 1
	.DB $A0,$03,$F3,$F3,$03
	.DB     $F7,$F7,$F7,$F7
	.DB     $03,$E5,$F0,$03
	.DB     $03,$E7,$F2,$03

                               		; 0x91 bank offset: 1
	.DB $00,$F3,$FA,$01,$00
	.DB     $F7,$F7,$F4,$F5
	.DB     $F1,$F8,$FF,$03
	.DB     $F3,$FA,$FF,$FE

                               		; 0x92 bank offset: 1
	.DB $00,$00,$00,$00,$00
	.DB     $F5,$F5,$FB,$00
	.DB     $03,$F8,$01,$00
	.DB     $FE,$F8,$01,$00

                               		; 0x93 bank offset: 1
	.DB $55,$2D,$2D,$2D,$2D
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02

                               		; 0x94 bank offset: 1
	.DB $25,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$F6,$F7
	.DB     $00,$00,$F8,$F1

                               		; 0x95 bank offset: 1
	.DB $05,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $F7,$F7,$F7,$F7
	.DB     $03,$F1,$F1,$03

                               		; 0x96 bank offset: 1
	.DB $05,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $F7,$F7,$FB,$00
	.DB     $F1,$F8,$01,$00

                               		; 0x97 bank offset: 1
	.DB $F5,$2D,$2D,$2D,$2D
	.DB     $2F,$2F,$2F,$2F
	.DB     $41,$44,$49,$55
	.DB     $02,$02,$02,$02

_F}_RECOVERY_HOSPITAL_TILES

_F{_NFL_SHIELD_TOP_LEFT_TILES	
								; NFL SHIELD TOP LEFT CORNER
                               		; 0x98 bank offset: 1
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$B7,$E2,$E3
	.DB     $00,$BD,$E8,$E9
                               		; 0x99 bank offset: 1
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $E6,$00,$00,$00
	.DB     $EC,$00,$00,$00
                               		; 0x9A bank offset: 1
	.DB $AA,$00,$BF,$EA,$EB
	.DB     $00,$B6,$B8,$B9
	.DB     $00,$AF,$BA,$BB
	.DB     $00,$00,$E0,$E1
                              		; 0x9B bank offset: 1
	.DB $AA,$EE,$00,$00,$00
	.DB     $BC,$00,$00,$00
	.DB     $BE,$00,$00,$00
	.DB     $00,$00,$00,$00				; END
	
_F}_NFL_SHIELD_TOP_LEFT_TILES	

_F{_LARGE_RB_CUTTING_TILES	

								; LARGE RB CUTTING (BARRY SANDERS INTRO) 
	                               		; 0x9C bank offset: 1
	.DB $00,$80,$81,$84,$85
	.DB     $82,$83,$86,$87
	.DB     $90,$90,$90,$90
	.DB     $01,$01,$01,$01
                               		; 0x9D bank offset: 1
	.DB $00,$80,$81,$84,$85
	.DB     $82,$83,$86,$87
	.DB     $90,$88,$89,$8C
	.DB     $01,$8A,$8B,$8E
                              		; 0x9E bank offset: 1
	.DB $00,$80,$81,$84,$85
	.DB     $82,$83,$86,$87
	.DB     $90,$90,$90,$90
	.DB     $91,$01,$01,$01
                              		; 0x9F bank offset: 1
	.DB $F0,$01,$01,$01,$01
	.DB     $00,$00,$00,$00
	.DB     $94,$94,$94,$94
	.DB     $01,$01,$01,$01
                               		; 0xA0 bank offset: 1
	.DB $40,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$95
                               		; 0xA1 bank offset: 1
	.DB $F4,$01,$01,$01,$92
	.DB     $00,$00,$00,$00
	.DB     $94,$94,$94,$93
	.DB     $01,$01,$01,$96
                               		; 0xA2 bank offset: 1
	.DB $16,$A0,$A1,$A4,$A5
	.DB     $A2,$A3,$A6,$A7
	.DB     $A8,$A9,$AC,$AD
	.DB     $AA,$01,$AE,$AF
                               		; 0xA3 bank offset: 1
	.DB $5A,$B0,$B1,$01,$01
	.DB     $B2,$B3,$B6,$01
	.DB     $B8,$B9,$BC,$BD
	.DB     $BA,$BB,$BE,$01
                               		; 0xA4 bank offset: 1
	.DB $F0,$01,$8D,$98,$99
	.DB     $AB,$8F,$9A,$9B
	.DB     $9C,$9D,$97,$B5
	.DB     $9E,$9F,$B4,$B7
                              		; 0xA5 bank offset: 1
	.DB $F0,$C0,$C1,$01,$01
	.DB     $C2,$C3,$00,$00
	.DB     $C8,$C9,$94,$94
	.DB     $BF,$01,$01,$01				; END

_F}_LARGE_RB_CUTTING_TILES	

_F{_CITY_SKYLINE_SINGLE_COLOR_TILES 	

												; 0xA6 bank offset: 1 SAME AS B8
	.DB $FF,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	
_F}_CITY_SKYLINE_3_TILES 	
												
_F{_RUSHING_TD_TILES                          	
								; RUSHING TOUCHDOWN REF HANDS IN AIR
								
									; 0xA7 bank offset: 1				
	.DB $AA,$80,$81,$84,$85
	.DB     $82,$83,$86,$87
	.DB     $01,$01,$01,$01
	.DB     $88,$88,$89,$88
                               		; 0xA8 bank offset: 1
	.DB $AA,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$88,$89
                               		; 0xA9 bank offset: 1
	.DB $55,$01,$01,$8A,$01
	.DB     $01,$01,$8A,$01
	.DB     $01,$01,$8A,$8B
	.DB     $01,$01,$A0,$A1
                               		; 0xAA bank offset: 1
	.DB $55,$01,$01,$01,$01
	.DB     $01,$01,$8B,$8E
	.DB     $8E,$8F,$9A,$8D
	.DB     $A4,$A5,$B0,$01
                              		; 0xAB bank offset: 1
	.DB $55,$01,$8B,$8E,$A2
	.DB     $A2,$8C,$AB,$A8
	.DB     $A4,$A5,$A9,$AA
	.DB     $01,$01,$01,$A3
                              		; 0xAC bank offset: 1
	.DB $AA,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $80,$81,$84,$85
	.DB     $82,$83,$86,$87

								; BOTTOM OF STADIUM ONLY 
                              		; 0xAD bank offset: 1
	.DB $FF,$A6,$A6,$A6,$A6
	.DB     $AC,$AC,$AC,$AC
	.DB     $AC,$AC,$AC,$AC
	.DB     $A6,$A6,$A6,$A6
                               		; 0xAE bank offset: 1
	.DB $FF,$A6,$A6,$A6,$A6
	.DB     $AC,$AC,$AC,$AC
	.DB     $AC,$AC,$AD,$AC
	.DB     $A6,$A6,$A6,$A6
                              		; 0xAF bank offset: 1
	.DB $AF,$AC,$A7,$AC,$AC
	.DB     $AC,$AD,$AC,$AC
	.DB     $B2,$B2,$B2,$B2
	.DB     $B8,$B8,$B8,$B8
                               		; 0xB0 bank offset: 1
	.DB $00,$AE,$AE,$AE,$AE
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
                               		; 0xB1 bank offset: 1
	.DB $AF,$AC,$AC,$AC,$AC
	.DB     $AC,$AC,$AC,$AC
	.DB     $B2,$B2,$B2,$B2
	.DB     $B8,$B8,$B8,$B8				

                              		; 0xB2 bank offset: 1
	.DB $00,$C0,$C1,$C4,$C5
	.DB     $C2,$C3,$C6,$01
	.DB     $C8,$C9,$CC,$B3
	.DB     $AF,$BA,$BB,$B9
                              		; 0xB3 bank offset: 1
	.DB $AF,$B4,$B5,$E0,$A7
	.DB     $B6,$B7,$E2,$E3
	.DB     $BC,$BD,$E8,$E9
	.DB     $BE,$BF,$EA,$EB
                               		; 0xB4 bank offset: 1
	.DB $AF,$AC,$AC,$AC,$B1
	.DB     $AC,$AC,$AC,$AC
	.DB     $B2,$B2,$B2,$B2
	.DB     $B8,$B8,$B8,$B8
                               		; 0xB5 bank offset: 1
	.DB $FF,$94,$95,$A6,$A6
	.DB     $AC,$97,$AC,$AC
	.DB     $AC,$9D,$96,$AC
	.DB     $98,$9F,$9C,$A6
                               		; 0xB6 bank offset: 1
	.DB $FF,$A6,$A6,$90,$91
	.DB     $AC,$AC,$92,$93
	.DB     $AC,$AC,$AC,$99
	.DB     $A6,$A6,$A6,$9B
                              		; 0xB7 bank offset: 1
	.DB $55,$01,$01,$8A,$01
	.DB     $01,$01,$8A,$01
	.DB     $01,$01,$8A,$01
	.DB     $01,$01,$8A,$01				; END
	
_F}_RUSHING_TD_TILES  	

_F{_CITY_SKYLINE_SINGLE_COLOR_DUPLICATE_TILES
													; 0xB8 bank offset: 1 = BLANK TILE PINK SKY, GRASS TOP VIEW FG
	.DB $FF,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	
_F}_CITY_SKYLINE_SINGLE_COLOR_DUPLICATE_TILES  
 	
_F{_SKY_OR_GRASS_SINGLE_COLOR_TILES:                               		
																; 0xB9 bank offset: 1 = BLANK TILE, LARGE SCOREBOARD SKY, GRASS BOOTOM OF STADIUM
	.DB $00,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	
_F}_SKY_OR_GRASS_SINGLE_COLOR_TILES: 	

_F{_CONFERENCE_CHAMPIONSHIP_TILES
												; CONFERENCE CHAMPIONSHIP SCREEN
                              		; 0xBA bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $E0,$E1,$E0,$E1
	.DB     $E2,$E3,$E2,$E3
                               		; 0xBB bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $E0,$BB,$E0,$E1
	.DB     $BE,$BF,$E2,$E3
                               		; 0xBC bank offset: 1
	.DB $59,$00,$B3,$00,$B3
	.DB     $00,$B9,$00,$B9
	.DB     $E0,$E1,$E0,$E1
	.DB     $E2,$E3,$E2,$E3
                               		; 0xBD bank offset: 1
	.DB $55,$90,$00,$00,$00
	.DB     $92,$00,$85,$00
	.DB     $00,$00,$87,$00
	.DB     $00,$00,$00,$00
                               		; 0xBE bank offset: 1
	.DB $55,$00,$00,$B6,$B6
	.DB     $00,$00,$BC,$BC
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xBF bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$B5,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xC0 bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$B5
	.DB     $00,$00,$00,$00
                               		; 0xC1 bank offset: 1
	.DB $55,$B7,$B7,$B7,$B6
	.DB     $BD,$BD,$BD,$BC
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xC2 bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$B5,$00,$00
	.DB     $00,$00,$00,$85
                               		; 0xC3 bank offset: 1
	.DB $D4,$81,$84,$00,$00
	.DB     $83,$86,$AB,$AE
	.DB     $91,$94,$00,$8D
	.DB     $93,$96,$8E,$8F
                               		; 0xC4 bank offset: 1
	.DB $75,$00,$00,$80,$00
	.DB     $00,$00,$B2,$82
	.DB     $98,$00,$B8,$01
	.DB     $9A,$00,$00,$8A
                              		; 0xC5 bank offset: 1
	.DB $54,$81,$84,$00,$E0
	.DB     $83,$86,$00,$00
	.DB     $89,$8C,$8D,$98
	.DB     $8B,$8E,$8F,$9A
                               		; 0xC6 bank offset: 1
	.DB $55,$E0,$E1,$E0,$BB
	.DB     $E2,$E3,$BE,$BF
	.DB     $E0,$BB,$E0,$E0
	.DB     $BE,$BF,$E2,$E4
                               		; 0xC7 bank offset: 1
	.DB $55,$E0,$E1,$E0,$E1
	.DB     $E2,$E3,$E2,$E3
	.DB     $E4,$E0,$E3,$00
	.DB     $E2,$E4,$BE,$00
                               		; 0xC8 bank offset: 1
	.DB $55,$E0,$BB,$E0,$E1
	.DB     $BE,$BF,$E2,$E3
	.DB     $85,$00,$E2,$BF
	.DB     $87,$00,$00,$00
                              		; 0xC9 bank offset: 1
	.DB $D5,$E0,$E0,$00,$87
	.DB     $E2,$BE,$00,$00
	.DB     $00,$C5,$00,$D9
	.DB     $00,$C7,$00,$01
                              		; 0xCA bank offset: 1
	.DB $62,$00,$00,$81,$84
	.DB     $D6,$D7,$83,$86
	.DB     $DC,$DD,$00,$8C
	.DB     $DE,$DF,$00,$00
                               		; 0xCB bank offset: 1
	.DB $8D,$99,$9C,$A4,$A5
	.DB     $9B,$02,$A6,$A7
	.DB     $02,$02,$AC,$AD
	.DB     $88,$01,$01,$AF
                               		; 0xCC bank offset: 1
	.DB $27,$B0,$00,$00,$A0
	.DB     $00,$00,$00,$A2
	.DB     $00,$00,$00,$A8
	.DB     $BA,$00,$00,$AA
                              		; 0xCD bank offset: 1
	.DB $05,$A1,$A4,$A5,$B0
	.DB     $A3,$A6,$A7,$00
	.DB     $A9,$AC,$AD,$00
	.DB     $01,$01,$AF,$BA
                              		; 0xCE bank offset: 1
	.DB $55,$00,$00,$85,$00
	.DB     $00,$00,$87,$00
	.DB     $00,$00,$00,$97
	.DB     $00,$00,$00,$9D
                               		; 0xCF bank offset: 1
	.DB $44,$00,$00,$00,$C5
	.DB     $C0,$C1,$00,$C7
	.DB     $C2,$C3,$C6,$00
	.DB     $C8,$C8,$CC,$00
                               		; 0xD0 bank offset: 1
	.DB $51,$00,$00,$C0,$C1
	.DB     $00,$97,$C2,$C3
	.DB     $00,$9D,$C8,$C8
	.DB     $00,$D0,$D1,$D1
                              		; 0xD1 bank offset: 1
	.DB $8D,$00,$00,$00,$95
	.DB     $C6,$00,$00,$C9
	.DB     $CC,$00,$CD,$D8
	.DB     $D4,$00,$CF,$DA
                               		; 0xD2 bank offset: 1
	.DB $FF,$02,$02,$C4,$D5
	.DB     $D2,$D3,$9E,$9F
	.DB     $CA,$CB,$CE,$00
	.DB     $DB,$02,$B1,$B4				; END

_F}_CONFERENCE_CHAMPIONSHIP_TILES

_F{_NFL_SHIELD_PART2_INTRO_TILES
								; TEAM WITH NFL SHIELD PART 2
                               		; 0xD3 bank offset: 1
	.DB $55,$59,$5C,$5D,$22
	.DB     $5B,$5E,$5F,$28
	.DB     $65,$65,$65,$65
	.DB     $00,$00,$00,$00
                               		; 0xD4 bank offset: 1
	.DB $55,$23,$26,$27,$32
	.DB     $29,$2C,$03,$38
	.DB     $2D,$2A,$03,$03
	.DB     $00,$2E,$34,$35
                               		; 0xD5 bank offset: 1
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $54,$54,$4C,$00
	.DB     $31,$02,$4D,$00
                               		; 0xD6 bank offset: 1
	.DB $55,$33,$36,$4D,$00
	.DB     $39,$3C,$4D,$00
	.DB     $2B,$65,$4E,$00
	.DB     $F9,$FB,$00,$00				; END
	
_F}_NFL_SHIELD_INTRO_TILES	

_F{_SKYLINE_AND_STADIUM_INTRO_TILES
								; CITY SKYLINE + STADIUM INTRO
                             		; 0xD7 bank offset: 1
	.DB $55,$00,$9A,$70,$55
	.DB     $90,$B0,$70,$57
	.DB     $92,$B0,$70,$57
	.DB     $00,$00,$70,$57
                               		; 0xD8 bank offset: 1
	.DB $55,$B8,$99,$96,$97
	.DB     $BA,$91,$9C,$9D
	.DB     $B8,$93,$96,$97
	.DB     $B8,$93,$93,$95
                               		; 0xD9 bank offset: 1
	.DB $5D,$C0,$00,$74,$75
	.DB     $C2,$00,$00,$00
	.DB     $9F,$CA,$94,$B7
	.DB     $00,$C1,$96,$C1
                               		; 0xDA bank offset: 1
	.DB $77,$3F,$81,$C6,$CE
	.DB     $03,$7D,$00,$00
	.DB     $03,$7D,$C5,$CE
	.DB     $03,$7D,$00,$00
                               		; 0xDB bank offset: 1
	.DB $55,$D2,$00,$D1,$00
	.DB     $A2,$A1,$A4,$AF
	.DB     $D8,$00,$00,$00
	.DB     $AB,$A7,$AC,$AF
                               		; 0xDC bank offset: 1
	.DB $55,$00,$00,$DA,$D9
	.DB     $00,$00,$00,$DB
	.DB     $90,$9A,$00,$DB
	.DB     $92,$98,$DA,$D9
                               		; 0xDD bank offset: 1
	.DB $55,$D4,$E9,$E5,$8C
	.DB     $D6,$E9,$00,$BB
	.DB     $D6,$E9,$E5,$00
	.DB     $D6,$E9,$E5,$00				; END
	
_F}_SKYLINE_AND_STADIUM_INTRO_TILES	

_F{_TODAY_LARGE_LETTERS_FINAL_STATS_TILES
												; TODAY'S LARGE LETTERS SPLIT SCREEN UNDER SCOREBOARD
         ; 0xDE bank offset: 1 = LARGE T
	.DB $00,$00,$00,$D8,$D9
	.DB     $00,$00,$DA,$DB
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xDF bank offset: 1 = LARGE 0 AND D
	.DB $00,$90,$91,$94,$91
	.DB     $92,$93,$96,$93
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0xE0 bank offset: 1= LARGE A AND Y
	.DB $00,$90,$91,$A0,$A1
	.DB     $86,$87,$DA,$DB
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0xE1 bank offset: 1 = LARGE S AND SPACE
	.DB $00,$CC,$9D,$00,$00
	.DB     $9E,$CF,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00				; END
	
_F}_TODAY_LARGE_LETTERS_FINAL_STATS_TILES	

_F{_RECOVERY_HOSPITAL_2_TILES

                               		; 0xE2 bank offset: 1 = USED IN RECOVERY HOSPITAL
	.DB $75,$2D,$2D,$2D,$2D
	.DB     $2F,$2F,$02,$02
	.DB     $4D,$00,$02,$02
	.DB     $02,$02,$02,$02
	
_F}_RECOVERY_HOSPITAL_2_TILES	
	
_F{_FLASHING_STARS_UNUSED_SCREEN_TILES	
												; SPECIAL UNUSED SCREEN (100YD DAY ETC)
                  ; 0xE3 bank offset: 1
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$01,$02,$01
	.DB     $00,$02,$00,$00
                               		; 0xE4 bank offset: 1
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $02,$01,$02,$01
	.DB     $00,$00,$00,$00
                               		; 0xE5 bank offset: 1
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $02,$01,$02,$00
	.DB     $00,$00,$01,$00
                               		; 0xE6 bank offset: 1
	.DB $66,$00,$01,$00,$00
	.DB     $00,$02,$00,$00
	.DB     $00,$01,$00,$00
	.DB     $00,$02,$00,$00
                               		; 0xE7 bank offset: 1
	.DB $99,$00,$00,$02,$00
	.DB     $00,$00,$01,$00
	.DB     $00,$00,$02,$00
	.DB     $00,$00,$01,$00
                               		; 0xE8 bank offset: 1
	.DB $A2,$00,$01,$00,$00
	.DB     $00,$02,$00,$00
	.DB     $00,$01,$00,$00
	.DB     $00,$02,$01,$02
                               		; 0xE9 bank offset: 1
	.DB $A0,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $01,$02,$01,$02
                               		; 0xEA bank offset: 1
	.DB $A8,$00,$00,$02,$00
	.DB     $00,$00,$01,$00
	.DB     $00,$00,$02,$00
	.DB     $01,$02,$01,$00				; END
	
_F}_FLASHING_STARS_UNUSED_SCREEN_TILES	

_F{_LARGE_SCOREBOARD_BLACK_TILES                               		
												; 0xEB bank offset: 1 = BLANK TILE, LARGE SCOREBOARD BLK BG, 
	.DB $FF,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	
_F}_LARGE_SCOREBOARD_BLACK_TILES  	

_F{_TODAYS_SPORTS_NEWS_APOST_TILES                                 		
													; 0xEC bank offset: 1 BLUE AND WHITE LINE WITH "'" FOR TODAY'S NFL
	.DB $0A,$00,$00,$00,$00
	.DB     $5D,$5D,$5D,$5D
	.DB     $6B,$6B,$6B,$6B
	.DB     $5C,$00,$00,$00
	
_F}_TODAYS_SPORTS_NEWS_APOST_TILES 	
	
.PAD $A000, $FF	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 2 

_F{_SINGLE_COLOR_TILES_BANK_2

          ; 0x00 bank offset: 2 BLANK TILE COLOR SET 1
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	
          ; 0x01 bank offset: 2 *** NOT USED
	.DB $55,$01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01
	.DB     $01,$01,$01,$01

                              		; 0x02 bank offset: 2 *** NOT USED
	.DB $AA,$02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	.DB     $02,$02,$02,$02
	
                              		; 0x03 bank offset: 2 *** NOT USED
	.DB $FF,$03,$03,$03,$03
	.DB     $03,$03,$03,$03
	.DB     $03,$03,$03,$03
	.DB     $03,$03,$03,$03
	
_F}_SINGLE_COLOR_TILES	

_F{_QB_THROWING_CREDITS_TILES
								; HORIZONTAL LINES QB THROWING (CREDITS)
                               		; 0x04 bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E5,$E5,$E5
	.DB     $E7,$E7,$E7,$E7
                               		; 0x05 bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E7,$E5
                               		; 0x06 bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E5,$E5,$E5,$E5
	.DB     $E7,$E7,$E5,$E7
	.DB     $E5,$E7,$E7,$E7
                               		; 0x07 bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E5,$E5,$E5,$E5
	.DB     $E7,$E7,$E5,$E5
	.DB     $E7,$E7,$E7,$E7
                               		; 0x08 bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E5,$E5,$E5,$E7
	.DB     $E5,$E7,$E7,$E7
	.DB     $E7,$E7,$E7,$E7
                               		; 0x09 bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E5,$E5
	.DB     $E7,$E7,$E7,$E7
                               		; 0x0A bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E5,$E5,$E5,$E5
	.DB     $E7,$E7,$E7,$E7
	.DB     $E5,$E5,$E5,$E7
                               		; 0x0B bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E5,$E5,$E5,$E5
	.DB     $E7,$E7,$E7,$E7
	.DB     $E5,$E5,$E5,$E7
                              		; 0x0C bank offset: 2
	.DB $00,$ED,$ED,$ED,$ED
	.DB     $ED,$ED,$ED,$ED
	.DB     $F2,$F2,$F2,$F2
	.DB     $F0,$F0,$F0,$F0
                              		; 0x0D bank offset: 2
	.DB $00,$ED,$EF,$EF,$EF
	.DB     $ED,$ED,$ED,$ED
	.DB     $F2,$F0,$F0,$F0
	.DB     $F2,$F2,$F2,$F2
                               		; 0x0E bank offset: 2
	.DB $00,$ED,$ED,$EF,$EF
	.DB     $ED,$ED,$ED,$ED
	.DB     $F0,$F2,$F2,$F2
	.DB     $F2,$F2,$F0,$F0
                               		; 0x0F bank offset: 2
	.DB $00,$EF,$EF,$EF,$EF
	.DB     $ED,$ED,$ED,$ED
	.DB     $F2,$F2,$F0,$F0
	.DB     $F0,$F2,$F2,$F2
                               		; 0x10 bank offset: 2
	.DB $00,$EF,$EF,$ED,$ED
	.DB     $ED,$ED,$ED,$ED
	.DB     $F0,$F0,$F0,$F0
	.DB     $F2,$F2,$F2,$F2
                              		; 0x11 bank offset: 2
	.DB $00,$ED,$ED,$EF,$EF
	.DB     $ED,$ED,$ED,$ED
	.DB     $F0,$F2,$F2,$F2
	.DB     $F0,$F0,$F0,$F0
                               		; 0x12 bank offset: 2
	.DB $00,$EF,$EF,$EF,$EF
	.DB     $ED,$ED,$ED,$ED
	.DB     $F2,$F2,$F2,$F0
	.DB     $F0,$F2,$F2,$F2
                              		; 0x13 bank offset: 2
	.DB $00,$EF,$EF,$EF,$EF
	.DB     $ED,$ED,$ED,$ED
	.DB     $F0,$F0,$F0,$F0
	.DB     $F2,$F2,$F2,$F2
                              		; 0x14 bank offset: 2
	.DB $00,$F0,$F0,$F0,$F0
	.DB     $ED,$ED,$ED,$ED
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E5,$E7
                              		; 0x15 bank offset: 2
	.DB $00,$F0,$F0,$F0,$F0
	.DB     $EF,$EF,$EF,$EF
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E7,$E7
                               		; 0x16 bank offset: 2
	.DB $00,$F0,$F0,$F0,$F0
	.DB     $EF,$ED,$ED,$ED
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E7,$E7
                               		; 0x17 bank offset: 2
	.DB $00,$F0,$F0,$F0,$F0
	.DB     $ED,$EF,$EF,$EF
	.DB     $E7,$E7,$E7,$E7
	.DB     $E5,$E5,$E7,$E7
                               		; 0x18 bank offset: 2
	.DB $00,$F0,$F0,$F0,$F0
	.DB     $EF,$EF,$EF,$EF
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E7,$E7
                               		; 0x19 bank offset: 2
	.DB $00,$F0,$F0,$F0,$F0
	.DB     $ED,$EF,$EF,$EF
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E7,$E5
                              		; 0x1A bank offset: 2
	.DB $00,$F0,$F0,$F0,$F0
	.DB     $ED,$EF,$EF,$EF
	.DB     $E7,$E7,$E7,$E7
	.DB     $E7,$E7,$E7,$E5
                              		; 0x1B bank offset: 2
	.DB $00,$F0,$F0,$F0,$F0
	.DB     $EF,$EF,$EF,$ED
	.DB     $E7,$E7,$E7,$E7
	.DB     $E5,$E5,$E5,$E5
                               		; 0x1C bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x1D bank offset: 2
	.DB $00,$E5,$E7,$E7,$E7
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x1E bank offset: 2
	.DB $00,$E7,$E7,$E7,$E7
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x1F bank offset: 2
	.DB $00,$E7,$E7,$E5,$E5
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x20 bank offset: 2
	.DB $00,$E5,$E5,$E7,$E7
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00				; END
	
_F}_QB_THROWING_CREDITS_TILES	

_F{_QB_THROWING_IN_GAME_TILES
												;HORIZONTAL LINES FOR QB THROWING (IN GAME) ,PLAYER MISSING BALL 
                 ; 0x21 bank offset: 2
	.DB $00,$E5,$E5,$E5,$E5
	.DB     $ED,$ED,$ED,$ED
	.DB     $F2,$F2,$F0,$F0
	.DB     $F0,$F0,$F0,$F0
                              		; 0x22 bank offset: 2
	.DB $00,$E5,$E5,$E7,$E7
	.DB     $ED,$ED,$ED,$ED
	.DB     $F0,$F0,$F0,$F2
	.DB     $F2,$F2,$F2,$F2
                             		; 0x23 bank offset: 2
	.DB $00,$E7,$E7,$E5,$E5
	.DB     $ED,$ED,$ED,$ED
	.DB     $F2,$F2,$F2,$F2
	.DB     $F2,$F0,$F0,$F0
                              		; 0x24 bank offset: 2
	.DB $00,$E5,$E5,$E7,$E7
	.DB     $ED,$EF,$EF,$EF
	.DB     $F2,$F2,$F2,$F2
	.DB     $F2,$F2,$F2,$F0
                               		; 0x25 bank offset: 2
	.DB $00,$E7,$E7,$E7,$E5
	.DB     $ED,$EF,$EF,$EF
	.DB     $F2,$F2,$F2,$F2
	.DB     $F2,$F2,$F2,$F0
                               		; 0x26 bank offset: 2
	.DB $00,$E5,$E5,$E7,$E7
	.DB     $EF,$EF,$EF,$EF
	.DB     $F2,$F2,$F0,$F0
	.DB     $F0,$F0,$F0,$F0
                               		; 0x27 bank offset: 2
	.DB $00,$E5,$E7,$E7,$E7
	.DB     $ED,$ED,$ED,$ED
	.DB     $F0,$F0,$F0,$F0
	.DB     $F2,$F2,$F2,$F2
                               		; 0x28 bank offset: 2
	.DB $00,$E7,$E7,$E7,$E7
	.DB     $ED,$ED,$ED,$ED
	.DB     $F2,$F2,$F2,$F2
	.DB     $F2,$F2,$F0,$F0
                              		; 0x29 bank offset: 2
	.DB $00,$EF,$ED,$ED,$ED
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x2A bank offset: 2
	.DB $00,$ED,$ED,$EF,$EF
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x2B bank offset: 2
	.DB $00,$EF,$EF,$EF,$ED
	.DB     $E7,$E7,$E7,$E7
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x2C bank offset: 2
	.DB $00,$ED,$ED,$ED,$EF
	.DB     $E7,$E7,$E7,$E7
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x2D bank offset: 2
	.DB $00,$EF,$EF,$EF,$EF
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x2E bank offset: 2
	.DB $00,$EF,$EF,$EF,$EF
	.DB     $E5,$E5,$E5,$E5
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x2F bank offset: 2
	.DB $00,$EF,$EF,$EF,$EF
	.DB     $E7,$E5,$E7,$E7
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00				; END

_F}_QB_THROWING_IN_GAME_TILES

_F{_SUPER_CHAMPION_LIFTING_COACH_TILES
												; SUPER_CHAMPION_LIFTING_COACH
                              		; 0x30 bank offset: 2
	.DB $20,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $A7,$A7,$00,$00
                               		; 0x31 bank offset: 2
	.DB $80,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$A7,$A7
	.DB     $00,$00,$00,$00
                              		; 0x32 bank offset: 2
	.DB $20,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $A7,$A7,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x33 bank offset: 2
	.DB $FF,$00,$00,$00,$00
	.DB     $BA,$BB,$BA,$BB
	.DB     $B5,$B5,$B5,$B5
	.DB     $B7,$B7,$B7,$B7
                               		; 0x34 bank offset: 2
	.DB $DF,$00,$00,$00,$00
	.DB     $BA,$00,$BA,$BB
	.DB     $80,$00,$B5,$B5
	.DB     $82,$00,$00,$B7
                               		; 0x35 bank offset: 2
	.DB $FF,$00,$00,$00,$00
	.DB     $BA,$BB,$BA,$00
	.DB     $B5,$B5,$B5,$00
	.DB     $B7,$B7,$B7,$BC
                               		; 0x36 bank offset: 2
	.DB $40,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$9C,$00
	.DB     $00,$00,$9E,$9F
                               		; 0x37 bank offset: 2
	.DB $04,$00,$00,$94,$95
	.DB     $00,$00,$96,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x38 bank offset: 2
	.DB $08,$00,$00,$AB,$AE
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x39 bank offset: 2
	.DB $02,$AE,$AB,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x3A bank offset: 2
	.DB $10,$81,$84,$00,$85
	.DB     $83,$00,$86,$87
	.DB     $88,$89,$8C,$8D
	.DB     $8A,$02,$02,$8F
                               		; 0x3B bank offset: 2
	.DB $44,$90,$91,$00,$00
	.DB     $92,$93,$00,$A8
	.DB     $98,$99,$00,$00
	.DB     $9A,$9B,$00,$00
                               		; 0x3C bank offset: 2
	.DB $00,$81,$84,$00,$00
	.DB     $83,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                              		; 0x3D bank offset: 2
	.DB $10,$00,$00,$A4,$A5
	.DB     $00,$00,$A6,$01
	.DB     $00,$A9,$AC,$AD
	.DB     $AA,$02,$02,$AF
                               		; 0x3E bank offset: 2
	.DB $00,$B0,$00,$00,$00
	.DB     $B2,$B3,$00,$00
	.DB     $B8,$B9,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x3F bank offset: 2
	.DB $03,$00,$00,$97,$00
	.DB     $00,$9D,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x40 bank offset: 2
	.DB $40,$8B,$8E,$00,$00
	.DB     $A1,$00,$00,$00
	.DB     $00,$00,$00,$A0
	.DB     $00,$00,$00,$A2
                               		; 0x41 bank offset: 2
	.DB $11,$00,$00,$00,$00
	.DB     $B1,$B4,$00,$00
	.DB     $02,$B6,$00,$00
	.DB     $A3,$00,$00,$00				; END
	
_F}_SUPER_CHAMPION_LIFTING_COACH_TILES	

_F{_TECMO_SUPER_BOWL_LARGE_LETTERS_TILES
								
          ; 0x42 bank offset: 2
	.DB $40,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$88
                              		; 0x43 bank offset: 2
	.DB $50,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $9A,$00,$00,$00
	.DB     $89,$8C,$8D,$98
                              		; 0x44 bank offset: 2
	.DB $5F,$80,$81,$84,$85
	.DB     $82,$83,$86,$87
	.DB     $00,$00,$00,$00
	.DB     $99,$9C,$A7,$B2
                              		; 0x45 bank offset: 2
	.DB $5F,$90,$91,$94,$95
	.DB     $92,$93,$96,$97
	.DB     $00,$00,$00,$00
	.DB     $B3,$B6,$B7,$E2
                              		; 0x46 bank offset: 2
	.DB $5F,$00,$00,$00,$00
	.DB     $EE,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $E3,$9D,$C8,$C9
                               		; 0x47 bank offset: 2
	.DB $55,$00,$00,$00,$8A
	.DB     $00,$00,$00,$A0
	.DB     $00,$00,$00,$A2
	.DB     $00,$00,$00,$00
                               		; 0x48 bank offset: 2
	.DB $55,$8B,$8E,$8F,$00
	.DB     $A1,$A4,$8F,$00
	.DB     $A3,$A6,$A5,$B0
	.DB     $00,$00,$00,$00
                               		; 0x49 bank offset: 2
	.DB $55,$00,$9E,$AD,$B8
	.DB     $00,$9E,$AD,$BA
	.DB     $B1,$B4,$AF,$BE
	.DB     $00,$00,$00,$00
                               		; 0x4A bank offset: 2
	.DB $55,$B9,$BC,$BD,$E8
	.DB     $BB,$00,$BF,$EA
	.DB     $00,$AA,$AB,$AE
	.DB     $00,$00,$00,$00
                              		; 0x4B bank offset: 2
	.DB $55,$00,$9F,$CA,$CB
	.DB     $00,$B5,$E0,$E1
	.DB     $EB,$C0,$C1,$C4
	.DB     $00,$00,$00,$00
                               		; 0x4C bank offset: 2
	.DB $10,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $C5,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x4D bank offset: 2
	.DB $AA,$C2,$C6,$C7,$D2
	.DB     $8F,$CC,$CD,$D8
	.DB     $8F,$CE,$CF,$DA
	.DB     $C3,$E4,$E5,$F0
                               		; 0x4E bank offset: 2
	.DB $AA,$D3,$D6,$D7,$E6
	.DB     $00,$00,$DD,$EC
	.DB     $00,$00,$DF,$D0
	.DB     $F1,$F4,$F5,$00
                               		; 0x4F bank offset: 2
	.DB $AA,$E7,$F2,$F3,$F6
	.DB     $ED,$F8,$F9,$FC
	.DB     $D1,$D4,$D5,$E9
	.DB     $9B,$DB,$DE,$00
                               		; 0x50 bank offset: 2
	.DB $AA,$D9,$DC,$00,$00
	.DB     $00,$AC,$00,$00
	.DB     $00,$AC,$00,$00
	.DB     $AA,$AB,$A8,$A9				; END
	
_F}_TECMO_SUPER_BOWL_LARGE_LETTERS_TILES	

_F{_BENGALS_HELMET_TEAM_DATA_TILES_AND_P1_MATCHUP_TILES
								; BENGALS HELMET SHELL TEAM DATA
        ; 0x51 bank offset: 2
	.DB $FF,$D9,$DC,$80,$80
	.DB     $DB,$DE,$80,$80
	.DB     $D0,$D1,$D4,$80
	.DB     $D2,$D3,$B8,$80
                             		; 0x52 bank offset: 2
	.DB $CF,$C8,$C9,$CC,$CD
	.DB     $CA,$CB,$CE,$CF
	.DB     $DD,$DF,$B3,$B6
	.DB     $80,$80,$80,$80
	
_F}_BENGALS_HELMET_TEAM_DATA_TILES_AND_P1_MATCHUP_TILES

_F{_HELMET_GENERIC_TEAM_DATA_TILES												
												; HELMET SHELL MOST COMMON (TEAM DATA)
                ; 0x53 bank offset: 2
	.DB $FF,$80,$89,$8C,$8D
	.DB     $88,$8B,$82,$82
	.DB     $8A,$82,$82,$82
	.DB     $A0,$82,$82,$82
                               		; 0x54 bank offset: 2
	.DB $FF,$8E,$8F,$80,$80
	.DB     $82,$A5,$80,$80
	.DB     $82,$A7,$B2,$80
	.DB     $82,$82,$B8,$80
                              		; 0x55 bank offset: 2
	.DB $CF,$A2,$82,$A3,$A6
	.DB     $A8,$A1,$A9,$AC
	.DB     $DD,$DF,$AB,$AE
	.DB     $80,$80,$80,$80				; END
	
_F}_HELMET_GENERIC_TEAM_DATA_TILES		

_F{_FACEMASK_GENERIC_TEAM_DATA_TILES								
								; FACEMASK FOR HELMET TEAM DATA
                              		; 0x56 bank offset: 2
	.DB $FF,$AD,$80,$80,$80
	.DB     $AD,$80,$80,$80
	.DB     $AF,$80,$80,$80
	.DB     $80,$80,$80,$80				; END
	
_F}_FACEMASK_GENERIC_TEAM_DATA_TILES	

_F{_HELMET_REFLECTIVE_TEAM_DATA_TILES	

								; HELMET SHELL REFLECTIOM (TEAM DATA)
                              		; 0x57 bank offset: 2
	.DB $FF,$80,$91,$94,$95
	.DB     $90,$93,$82,$82
	.DB     $92,$82,$82,$82
	.DB     $98,$82,$82,$82
                               		; 0x58 bank offset: 2
	.DB $FF,$96,$97,$80,$80
	.DB     $9C,$9D,$80,$80
	.DB     $82,$9F,$B5,$80
	.DB     $82,$82,$B8,$80
                               		; 0x59 bank offset: 2
	.DB $CF,$9A,$82,$9B,$9E
	.DB     $B0,$99,$B1,$B4
	.DB     $DD,$DF,$B3,$B6
	.DB     $80,$80,$80,$80				; END
	
_F}_HELMET_REFLECTIVE_TEAM_DATA_TILES		

_F{_RAMS_HELMET_SHELL_P2_MATCHUP_TILES	

												; RAMS HELMET SHELL TEAM DATA
            ; 0x5A bank offset: 2
	.DB $FF,$80,$E0,$E1,$E4
	.DB     $B7,$E2,$E3,$81
	.DB     $BD,$E8,$E9,$E6
	.DB     $BF,$EA,$82,$EC
                              		; 0x5B bank offset: 2
	.DB $FF,$E5,$97,$80,$80
	.DB     $E7,$F2,$80,$80
	.DB     $ED,$F8,$B5,$80
	.DB     $82,$FA,$B8,$80
                              		; 0x5C bank offset: 2
	.DB $CF,$9A,$BC,$EB,$EE
	.DB     $B0,$BE,$F9,$FC
	.DB     $DD,$DF,$FB,$FE
	.DB     $80,$80,$80,$80
                               		; 0x5D bank offset: 2
	.DB $FF,$EF,$80,$80,$80
	.DB     $FD,$80,$80,$80
	.DB     $FF,$80,$80,$80
	.DB     $80,$80,$80,$80				; END
	
_F}_RAMS_HELMET_SHELL_P2_MATCHUP_TILES	

_F{_BENGALS_HELMET_TEAM_DATA_TILES_AND_P1_MATCHUP_PART_2_TILES
								; BENGALS HELMET SHELL TEAM DATA
                               		; 0x5E bank offset: 2
	.DB $FF,$80,$84,$85,$D8
	.DB     $A4,$86,$87,$DA
	.DB     $C0,$C1,$C4,$C5
	.DB     $C2,$C3,$C6,$C7
	
_F}_BENGALS_HELMET_TEAM_DATA_TILES_AND_P1_MATCHUP_PART_2_TILES	

_F{_UNUSED_1_METATILE_BANK_2_TILES	

										; 0x5F bank offset: 2 *** NOT USED
	.DB $00,$80,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	
_F}_UNUSED_1_METATILE_BANK_2_TILES

_F{_SUPER_CHAMPION_LIFTING_COACH_2_TILES
												; 0x60 bank offset: 2
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$03,$03

_F}_SUPER_CHAMPION_LIFTING_COACH_2_TILES	
		
_F{_PLAYERS_BEFORE_GATORADE_CREDITS_TILES	
												; QB BEING INTERVIEWED CREDITS
                              		; 0x61 bank offset: 2
	.DB $20,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$04,$05
	.DB     $00,$13,$06,$07
                               		; 0x62 bank offset: 2
	.DB $80,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $10,$00,$00,$00
	.DB     $12,$13,$16,$00
                               		; 0x63 bank offset: 2
	.DB $20,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $42,$43,$00,$00
                               		; 0x64 bank offset: 2
	.DB $F9,$08,$09,$0C,$0D
	.DB     $0A,$0B,$0E,$0F
	.DB     $20,$21,$24,$25
	.DB     $22,$23,$26,$27
                               		; 0x65 bank offset: 2
	.DB $6A,$18,$19,$1C,$1D
	.DB     $1A,$1B,$1E,$1F
	.DB     $30,$31,$34,$35
	.DB     $32,$33,$02,$37
                               		; 0x66 bank offset: 2
	.DB $AA,$48,$49,$00,$00
	.DB     $4A,$00,$00,$00
	.DB     $60,$61,$14,$15
	.DB     $62,$63,$11,$17
                               		; 0x67 bank offset: 2
	.DB $F7,$00,$00,$40,$41
	.DB     $44,$45,$50,$51
	.DB     $46,$47,$52,$53
	.DB     $4C,$4D,$58,$59
                               		; 0x68 bank offset: 2
	.DB $DC,$28,$29,$2C,$2D
	.DB     $2A,$2B,$2E,$2F
	.DB     $80,$81,$84,$00
	.DB     $02,$3A,$3B,$36
                              		; 0x69 bank offset: 2
	.DB $07,$4B,$4E,$64,$65
	.DB     $00,$00,$66,$67
	.DB     $00,$00,$6C,$6D
	.DB     $00,$00,$6E,$6F
                               		; 0x6A bank offset: 2
	.DB $0F,$70,$71,$02,$75
	.DB     $72,$73,$02,$77
	.DB     $78,$79,$7C,$7D
	.DB     $7A,$7B,$7E,$7F
                              		; 0x6B bank offset: 2
	.DB $3F,$4F,$5A,$5B,$5E
	.DB     $54,$55,$74,$02
	.DB     $56,$00,$76,$57
	.DB     $00,$00,$5C,$5D				; END

_F}_PLAYERS_BEFORE_GATORADE_CREDITS_TILES		
	
_F{_PLAYERS_AFTER_GATORADE_CREDITS_TILES	
												; GATORADE BATH 
                              		; 0x6C bank offset: 2
	.DB $F9,$08,$09,$0C,$82
	.DB     $0A,$0B,$0E,$88
	.DB     $20,$21,$24,$25
	.DB     $22,$23,$26,$27
                               		; 0x6D bank offset: 2
	.DB $6A,$83,$19,$1C,$1D
	.DB     $89,$1B,$1E,$1F
	.DB     $30,$31,$34,$35
	.DB     $85,$90,$02,$37
                              		; 0x6E bank offset: 2
	.DB $AE,$48,$91,$94,$6B
	.DB     $86,$87,$92,$69
	.DB     $8C,$8D,$98,$3C
	.DB     $8E,$8F,$9A,$02
                               		; 0x6F bank offset: 2
	.DB $F7,$5F,$00,$40,$41
	.DB     $8A,$8B,$50,$51
	.DB     $A0,$A1,$A4,$53
	.DB     $A2,$A3,$A6,$59
                              		; 0x70 bank offset: 2
	.DB $E0,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $42,$3F,$6A,$00
                               		; 0x71 bank offset: 2
	.DB $37,$00,$3D,$64,$68
	.DB     $00,$00,$66,$67
	.DB     $00,$00,$6C,$6D
	.DB     $00,$00,$6E,$6F
                               		; 0x72 bank offset: 2
	.DB $0F,$A5,$B0,$02,$3E
	.DB     $A7,$B2,$02,$77
	.DB     $78,$79,$7C,$7D
	.DB     $7A,$7B,$7E,$7F
                               		; 0x73 bank offset: 2
	.DB $37,$38,$00,$39,$5E
	.DB     $54,$55,$74,$02
	.DB     $56,$00,$76,$57
	.DB     $00,$00,$5C,$5D				; END
	
_F}_PLAYERS_AFTER_GATORADE_CREDITS_TILES	

_F{_SUPERBOWL_STADIUM_TILES	
												; SUPER BOWL STADIUM WITH COPS AND CHEERLEADERS
                              		; 0x74 bank offset: 2
	.DB $00,$C1,$C4,$C4,$C4
	.DB     $C2,$C2,$C2,$C2
	.DB     $00,$C3,$00,$C6
	.DB     $00,$00,$00,$C7
                              		; 0x75 bank offset: 2
	.DB $00,$C4,$C4,$C4,$C1
	.DB     $C2,$C2,$C2,$C2
	.DB     $00,$C3,$00,$C6
	.DB     $00,$00,$C7,$D5
                              		; 0x76 bank offset: 2
	.DB $00,$C3,$C3,$C3,$C3
	.DB     $C2,$C2,$C2,$C2
	.DB     $00,$C3,$00,$C6
	.DB     $C7,$00,$00,$00				

                               		; 0x77 bank offset: 2 *** NOT USED
	.DB $00,$C5,$C5,$D0,$D1
	.DB     $C2,$C2,$C2,$C2
	.DB     $00,$C3,$00,$C6
	.DB     $C7,$00,$00,$00
                               		; 0x78 bank offset: 2 *** NOT USED
	.DB $00,$D4,$C5,$C5,$C5
	.DB     $C2,$C2,$C2,$C2
	.DB     $00,$C3,$00,$C6
	.DB     $C7,$00,$C7,$D5
                              		; 0x79 bank offset: 2 *** NOT USED
	.DB $00,$D0,$D1,$D4,$C5
	.DB     $C2,$C2,$C2,$C2
	.DB     $00,$C3,$00,$C6
	.DB     $C7,$00,$00,$C7
								
                               		; 0x7A bank offset: 2
	.DB $0D,$D5,$C7,$00,$C7
	.DB     $D5,$00,$D5,$C7
	.DB     $C5,$C5,$D0,$D1
	.DB     $C2,$C2,$C2,$C2
                               		; 0x7B bank offset: 2
	.DB $07,$D5,$C7,$C7,$00
	.DB     $C7,$D5,$D5,$D2
	.DB     $D4,$C5,$C5,$C5
	.DB     $C2,$C2,$C2,$C2
                               		; 0x7C bank offset: 2
	.DB $03,$C7,$D5,$C7,$C7
	.DB     $D5,$C7,$00,$00
	.DB     $D0,$D1,$D4,$C5
	.DB     $C2,$C2,$C2,$C2
                               		; 0x7D bank offset: 2
	.DB $07,$D5,$D5,$C7,$CC
	.DB     $D5,$C7,$C7,$D2
	.DB     $C5,$C5,$D0,$D1
	.DB     $C2,$C2,$C2,$C2
                               		; 0x7E bank offset: 2
	.DB $07,$00,$C7,$C7,$00
	.DB     $00,$00,$D5,$D2
	.DB     $D4,$C5,$C5,$C5
	.DB     $C2,$C2,$C2,$C2
                               		; 0x7F bank offset: 2
	.DB $0F,$C7,$D5,$C7,$C7
	.DB     $D5,$D2,$D5,$D2
	.DB     $D0,$D1,$D4,$C5
	.DB     $C2,$C2,$C2,$C2
                             		; 0x80 bank offset: 2
	.DB $05,$00,$C7,$00,$00
	.DB     $D5,$00,$D5,$C7
	.DB     $C5,$C5,$D0,$D1
	.DB     $C2,$C2,$C2,$C2
                               		; 0x81 bank offset: 2
	.DB $0F,$00,$C7,$C7,$00
	.DB     $00,$00,$D5,$D2
	.DB     $D4,$C5,$C5,$C5
	.DB     $C2,$C2,$C2,$C2
                              		; 0x82 bank offset: 2 *** NOT USED
	.DB $50,$00,$C6,$00,$C6
	.DB     $C6,$00,$C6,$00
	.DB     $D8,$00,$00,$00
	.DB     $DA,$00,$D3,$D6
                               		; 0x83 bank offset: 2 *** NOT USED
	.DB $60,$00,$C6,$00,$C6
	.DB     $00,$00,$C6,$00
	.DB     $00,$00,$00,$D7
	.DB     $D3,$00,$D6,$DD
                               		; 0x84 bank offset: 2
	.DB $A0,$00,$C6,$00,$C6
	.DB     $00,$00,$C6,$00
	.DB     $00,$C8,$C9,$CC
	.DB     $D3,$CA,$CB,$CE
                              		; 0x85 bank offset: 2
	.DB $60,$00,$C6,$00,$C6
	.DB     $00,$00,$C6,$00
	.DB     $CD,$D8,$D7,$00
	.DB     $CF,$DA,$DD,$00
                               		; 0x86 bank offset: 2
	.DB $90,$00,$C6,$00,$C6
	.DB     $00,$00,$C6,$00
	.DB     $00,$00,$00,$00
	.DB     $D3,$D6,$00,$D3
                               		; 0x87 bank offset: 2
	.DB $50,$00,$C6,$00,$C6
	.DB     $00,$00,$C6,$00
	.DB     $00,$00,$C8,$C9
	.DB     $D3,$D6,$CA,$CB
                              		; 0x88 bank offset: 2
	.DB $50,$00,$C6,$00,$C6
	.DB     $00,$00,$C6,$00
	.DB     $CC,$CD,$D8,$00
	.DB     $CE,$CF,$DA,$00
                               		; 0x89 bank offset: 2 *** NOT USED
	.DB $5D,$F0,$00,$D9,$DC
	.DB     $F2,$00,$00,$F1
	.DB     $F8,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x8A bank offset: 2 *** NOT USED
	.DB $0D,$D9,$00,$DC,$DF
	.DB     $F1,$00,$F1,$F1
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x8B bank offset: 2
	.DB $FE,$D9,$E0,$E1,$E4
	.DB     $00,$E2,$E3,$E6
	.DB     $00,$E8,$E9,$EC
	.DB     $00,$EA,$EB,$EE
                               		; 0x8C bank offset: 2
	.DB $FF,$E5,$F0,$DF,$00
	.DB     $E7,$F2,$00,$00
	.DB     $ED,$F8,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x8D bank offset: 2
	.DB $5F,$D9,$DC,$00,$D9
	.DB     $00,$F1,$00,$F1
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
                               		; 0x8E bank offset: 2
	.DB $55,$D9,$DC,$E0,$E1
	.DB     $00,$F1,$E2,$E3
	.DB     $00,$00,$E8,$E9
	.DB     $00,$00,$EA,$EB
                               		; 0x8F bank offset: 2
	.DB $55,$E4,$E5,$F0,$00
	.DB     $E6,$E7,$F2,$00
	.DB     $EC,$ED,$F8,$00
	.DB     $EE,$00,$00,$00				; END
	
_F}_SUPERBOWL_STADIUM_TILES		

_F{_AFC_PRO_BOWL_TILES
								; AFC NFC PRO BOWL
                               		; 0x90 bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$CE
	.DB     $00,$00,$00,$E4
	.DB     $00,$00,$00,$E7
                               		; 0x91 bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $CF,$DA,$DB,$DE
	.DB     $E5,$F0,$F1,$F4
	.DB     $00,$F2,$F3,$F6
                              		; 0x92 bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $DF,$E7,$CB,$00
	.DB     $F5,$E0,$E1,$00
	.DB     $F7,$00,$CF,$00
                              		; 0x93 bank offset: 2
	.DB $AA,$00,$00,$00,$00
	.DB     $D0,$D1,$D4,$D5
	.DB     $D2,$D3,$D6,$D7
	.DB     $D8,$D9,$DC,$DD				; END

_F}_AFC_PRO_BOWL_TILES

_F{_PODIUM_CREDITS_TILES
										; PODIUM SCENE CREDITS
               ; 0x94 bank offset: 2
	.DB $00,$02,$81,$02,$81
	.DB     $82,$83,$82,$83
	.DB     $02,$81,$02,$81
	.DB     $82,$83,$82,$83
                               		; 0x95 bank offset: 2
	.DB $00,$02,$81,$02,$81
	.DB     $82,$83,$82,$83
	.DB     $02,$81,$02,$81
	.DB     $82,$83,$82,$84
                              		; 0x96 bank offset: 2
	.DB $00,$02,$81,$02,$81
	.DB     $82,$83,$82,$83
	.DB     $02,$81,$02,$81
	.DB     $85,$90,$91,$83
                               		; 0x97 bank offset: 2
	.DB $00,$02,$81,$89,$03
	.DB     $82,$88,$03,$03
	.DB     $80,$8A,$8B,$8E
	.DB     $00,$00,$00,$00
                               		; 0x98 bank offset: 2
	.DB $00,$03,$92,$93,$81
	.DB     $8D,$98,$99,$83
	.DB     $00,$9A,$9B,$81
	.DB     $00,$B0,$82,$83
                               		; 0x99 bank offset: 2
	.DB $A0,$A0,$A1,$A1,$A4
	.DB     $00,$86,$87,$00
	.DB     $00,$00,$00,$B7
	.DB     $00,$A2,$00,$00
                               		; 0x9A bank offset: 2
	.DB $63,$00,$00,$00,$00
	.DB     $E0,$00,$00,$00
	.DB     $E2,$00,$94,$95
	.DB     $E8,$00,$96,$97
                               		; 0x9B bank offset: 2
	.DB $40,$00,$00,$A1,$A5
	.DB     $00,$00,$86,$87
	.DB     $00,$00,$BA,$03
	.DB     $00,$00,$03,$03
                               		; 0x9C bank offset: 2
	.DB $90,$A1,$B1,$03,$8C
	.DB     $86,$87,$8F,$00
	.DB     $CE,$00,$00,$9C
	.DB     $E4,$E5,$00,$9E
                               		; 0x9D bank offset: 2
	.DB $AA,$00,$00,$A6,$A7
	.DB     $00,$00,$AC,$AD
	.DB     $9D,$00,$AE,$AF
	.DB     $9F,$CA,$BE,$BF
                               		; 0x9E bank offset: 2
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$A3
	.DB     $00,$00,$A8,$A9
	.DB     $00,$00,$AA,$AB
                               		; 0x9F bank offset: 2
	.DB $AA,$00,$00,$00,$B4
	.DB     $00,$00,$B3,$B6
	.DB     $00,$B8,$B9,$BC
	.DB     $00,$00,$BB,$02
                              		; 0xA0 bank offset: 2
	.DB $55,$00,$00,$03,$03
	.DB     $00,$00,$E3,$03
	.DB     $BD,$00,$E9,$E3
	.DB     $02,$EA,$00,$E9
                               		; 0xA1 bank offset: 2
	.DB $D5,$03,$03,$C8,$C6
	.DB     $03,$03,$C9,$CC
	.DB     $03,$E6,$C0,$C1
	.DB     $8F,$EC,$C2,$C3
                               		; 0xA2 bank offset: 2
	.DB $B9,$C7,$E1,$00,$00
	.DB     $CD,$00,$00,$ED
	.DB     $CF,$EB,$EE,$03
	.DB     $00,$00,$00,$EC
                               		; 0xA3 bank offset: 2
	.DB $FA,$B5,$03,$03,$CB
	.DB     $03,$03,$03,$E1
	.DB     $03,$B2,$C1,$00
	.DB     $E9,$C2,$C3,$00				; END
	
_F}_PODIUM_CREDITS_TILES	

_F{_NFL_SUPER_PRO_FOOTBALL_1_TILES
								; NFL SUPER PRO FOOTBALL TEXT INTRO PT 1
                               		; 0xA4 bank offset: 2
	.DB $AA,$90,$91,$00,$00
	.DB     $92,$93,$00,$00
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                               		; 0xA5 bank offset: 2
	.DB $FF,$C0,$C1,$90,$91
	.DB     $CA,$A4,$92,$93
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                               		; 0xA6 bank offset: 2
	.DB $FF,$90,$91,$D8,$D9
	.DB     $92,$93,$DA,$DB
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                              		; 0xA7 bank offset: 2
	.DB $FF,$C0,$CD,$90,$91
	.DB     $C2,$CF,$86,$87
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                               		; 0xA8 bank offset: 2
	.DB $FF,$84,$00,$84,$00
	.DB     $96,$AA,$96,$AA
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00				;END
	
_F}_NFL_SUPER_PRO_FOOTBALL_TILES	

_F{_BENGALS_HELMET_SHELL_BOT_LEFT_P1_MATCHUP_TILES	

												; PART OF CINCY HELMET P1 MATCHUP
                               		; 0xA9 
	.DB $04,$DD,$DF,$B3,$B6
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	
_F}_BENGALS_HELMET_SHELL_BOT_LEFT_P1_MATCHUP_TILES		

_F{_UNUSED_2_BANK_2_TILES                               		
										; 0xAA  *** NOT USED
	.DB $01,$AF,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	
_F}_UNUSED_2_METATILE_BANK_2_TILES: 	

_F{_TECMO_SUPER_BOWL_LARGE_LETTERS_2_TILES

                              		; 0xAB bank offset: 2 PART OF TECMO SUPER BOWL LARGE LETTERS
	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $EF,$FA,$00,$00						; END
	
_F}_TECMO_SUPER_BOWL_LARGE_LETTERS_2_TILES	

_F{_NFL_SUPER_PRO_FOOTBALL_2_TILES
								; NFL SUPER PRO FOOTBALL TEXT INTRO PT 2
                               		; 0xAC bank offset: 2 
	.DB $FF,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00				
                            		; 0xAD bank offset: 2
	.DB $AA,$8C,$99,$C0,$C1
	.DB     $8E,$9B,$CA,$A4
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                              		; 0xAE bank offset: 2
	.DB $AA,$84,$00,$00,$00
	.DB     $96,$AA,$00,$00
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                              		; 0xAF bank offset: 2
	.DB $AA,$CC,$9D,$84,$85
	.DB     $9E,$CF,$92,$93
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                               		; 0xB0 bank offset: 2
	.DB $AA,$94,$A9,$C0,$C1
	.DB     $86,$AB,$C2,$C3
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                               		; 0xB1 bank offset: 2
	.DB $AA,$94,$A9,$00,$00
	.DB     $86,$88,$00,$00
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00
                               		; 0xB2 bank offset: 2
	.DB $AA,$94,$A9,$94,$A9
	.DB     $86,$AB,$86,$88
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00				; END
	
_F}_NFL_SUPER_PRO_FOOTBALL_2_TILES	

_F{_TECMO_PRESENTS_TILES
								; TECMO PRESENTS (INTRO)
                              		; 0xB3 bank offset: 2
	.DB $FF,$00,$80,$81,$84
	.DB     $00,$82,$83,$86
	.DB     $00,$00,$00,$00
	.DB     $00,$50,$52,$45
                               		; 0xB4 bank offset: 2
	.DB $FF,$85,$90,$91,$94
	.DB     $87,$92,$93,$96
	.DB     $00,$00,$00,$00
	.DB     $53,$45,$4E,$54
                               		; 0xB5 bank offset: 2
	.DB $FF,$95,$00,$00,$00
	.DB     $97,$EE,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $53,$00,$00,$00
	
_F}_TECMO_PRESENTS_TILES	
												
_F{_NFL_SUPER_PRO_FOOTBALL_3_TILES                               		
															; PART OF NFL SUPER PRO FOOTBALL TEXT INTRO 
															; 0xB6 bank offset: 2


	.DB $AA,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $5D,$5D,$5D,$5D
	.DB     $00,$00,$00,$00						; END
	
_F}_NFL_SUPER_PRO_FOOTBALL_3_TILES:	

_F{_UNUSED_3_BANK_2_TILES                               		
														; 0xB7 UNUSED


	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	
_F}_UNUSED_3_BANK_2_TILES

_F{_UNUSED_4_BANK_2_TILES 
	
                            		; 0xB8 UNUSED
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $00,$00,$00,$00
	
_F}_UNUSED_4_BANK_2_TILES 	
	
_F{_BENGALS_HELMET_SHELL_TOP_RIGHT_P1_MATCHUP_TILES	
														; PART OF CINCY HELMET P1 MATCHUP
       ; 0xB9 bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $D9,$DC,$80,$80
	.DB     $DB,$DE,$80,$80
	
_F}_BENGALS_HELMET_SHELL_TOP_RIGHT_P1_MATCHUP_TILES	

_F{_BENGALS_HELMET_SHELL_MID_LEFT_P1_MATCHUP_TILES
		
                             		; 0xBA bank offset: 2
	.DB $55,$C0,$C1,$C4,$C5
	.DB     $C2,$C3,$C6,$C7
	.DB     $C8,$C9,$CC,$CD
	.DB     $CA,$CB,$CE,$CF						; END
	
_F}_BENGALS_HELMET_SHELL_MID_LEFT_P1_MATCHUP_TILES	

_F{_GENERIC_HELMET_SHELL_P1_MATCHUP_TILES
												; GENERIC HELMET SHELL P1 MATCH 
                              		; 0xBB bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $80,$89,$8C,$8D
	.DB     $88,$8B,$82,$82
                              		; 0xBC bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $8E,$8F,$80,$80
	.DB     $82,$A5,$80,$80
                               		; 0xBD bank offset: 2
	.DB $55,$8A,$82,$82,$82
	.DB     $A0,$82,$82,$82
	.DB     $A2,$82,$A3,$A6
	.DB     $A8,$A1,$A9,$AC
	
_F}_GENERIC_HELMET_SHELL_P1_MATCHUP_TILES		

_F{_HELMET_SHELL_MID_RIGHT_P1_MATCHUP_TILES	
                               		; 0xBE bank offset: 2
	.DB $55,$82,$A7,$B2,$80
	.DB     $82,$82,$B8,$80
	.DB     $AD,$80,$80,$80
	.DB     $AD,$80,$80,$80				; END
	
_F}_HELMET_SHELL_MID_RIGHT_P1_MATCHUP_TILES		
	
_F{_HELMET_SHELL_W_REFLECTION_P1_MATCHUP_TILES
												; HELMET SHELL REFLECT P1 MATCH
                              		; 0xBF bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $80,$91,$94,$95
	.DB     $90,$93,$82,$82
                               		; 0xC0 bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $96,$97,$80,$80
	.DB     $9C,$9D,$80,$80
                               		; 0xC1 bank offset: 2
	.DB $55,$92,$82,$82,$82
	.DB     $98,$82,$82,$82
	.DB     $9A,$82,$9B,$9E
	.DB     $B0,$99,$B1,$B4				; END
	
_F}_HELMET_SHELL_W_REFLECTION_P1_MATCHUP_TILES	

_F{_RAMS_HELMET_SHELL_P1_MATCHUP_TILES
										; RAMS HELMET SHELL P1 MATCHUP
                              		; 0xC2 bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $80,$E0,$E1,$E4
	.DB     $B7,$E2,$E3,$81
                               		; 0xC3 bank offset: 2
	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $E5,$97,$80,$80
	.DB     $E7,$F2,$80,$80
                               		; 0xC4 bank offset: 2
	.DB $55,$BD,$E8,$E9,$E6
	.DB     $BF,$EA,$82,$EC
	.DB     $9A,$BC,$EB,$EE
	.DB     $B0,$BE,$F9,$FC
                               		; 0xC5 bank offset: 2
	.DB $55,$ED,$F8,$B5,$80
	.DB     $82,$FA,$B8,$80
	.DB     $EF,$80,$80,$80
	.DB     $FD,$80,$80,$80				; END
	
_F}_RAMS_HELMET_SHELL_P1_MATCHUP_TILES	
												
_F{_BENGALS_HELMET_SHELL_TOP_LEFT_P1_MATCHUP_TILES:                               		
														; 0xC6 bank offset: 2
														; PART OF CINCY HELMET P1 MATCHUP

	.DB $55,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $80,$84,$85,$D8
	.DB     $A4,$86,$87,$DA
	
_F}_BENGALS_HELMET_SHELL_TOP_LEFT_P1_MATCHUP_TILES: 	

_F{_FACEMASK_AND_BLACK_FOR_P1_MATCHUP_TILES	
	
												; FACEMASK AND BLACK FOR P1 MATCHUP
                              		; 0xC7 bank offset: 2
	.DB $04,$DD,$DF,$AB,$AE
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80						; END	
												; 0xC8 bank offset: 2
	.DB $05,$AF,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	
_F}_FACEMASK_AND_BLACK_FOR_P1_MATCHUP_TILES	
	
_F{_RAMS_HELMET_SHELL_BOTTM_LEFT_P1_MATCHUP_TILES:                               		

												; 0xC9 bank offset: 2
	.DB $04,$DD,$DF,$FB,$FE
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	
_F}_RAMS_HELMET_SHELL_BOTTM_LEFT_P1_MATCHUP_TILES:	
											
_F{_BENGALS_AND_RAMS_HELMET_SHELL_BOTTOM_RIGHT_P1_MATCHUP_TILES: 
                                		
			; 0xCA bank offset: 2
	.DB $05,$FF,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80
	.DB     $80,$80,$80,$80

_F}_BENGALS_AND_RAMS_HELMET_SHELL_BOTTOM_RIGHT_P1_MATCHUP_TILES:

_F{_BENGALS_HELMET_SHELL_MID_RIGHT_P1_MATCHUP_TILES:
	
                              		; 0xCB bank offset: 2
	.DB $55,$D0,$D1,$D4,$80
	.DB     $D2,$D3,$B8,$80
	.DB     $AD,$80,$80,$80
	.DB     $AD,$80,$80,$80				; END

_F}_BENGALS_HELMET_SHELL_MID_RIGHT_P1_MATCHUP_TILES:
	
_F{_LARGE_LETTERS_1991_ROSTER_TILES
												; 1991 ROSTER LARGE LETTERS
               
	
	
	.DB $00,$00,$00,$00,$00						; 0xCC bank offset: 2
	.DB     $00,$00,$00,$00
	.DB     $00,$AE,$A8,$CC
	.DB     $00,$C6,$C7,$9E
											; 0xCD bank offset: 2
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $D1,$CC,$D1,$AE
	.DB     $D3,$9E,$D3,$C6
                               		; 0xCE bank offset: 2
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $A8,$00,$00,$94
	.DB     $C7,$00,$00,$86
                               		; 0xCF bank offset: 2
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $A9,$90,$91,$CC
	.DB     $88,$92,$93,$9E
                               		; 0xD0 bank offset: 2
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $9D,$D8,$D9,$C0
	.DB     $CF,$DA,$DB,$C2
										; 0xD1 bank offset: 2
	.DB $00,$00,$00,$00,$00
	.DB     $00,$00,$00,$00
	.DB     $C1,$94,$A9,$00
	.DB     $C3,$86,$88,$00				; END
	
_F}_LARGE_LETTERS_1991_ROSTER_TILES	

.PAD $B000, $FF
