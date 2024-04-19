
.BASE $8000
.ORG  $8000

BANK_JUMP_DRAW_METATILE_COLLUMN:
	JMP DRAW_METATILE_COLLUMN 												; DRAW METATILE ()
	
BANK_JUMP_DRAW_GAME_FIELD:
	JMP DRAW_GAME_FIELD                                              ; DRAW GAME FIELD()

BANK_JUMP_SET_TEAM_UNIFORM_COLORS:	
	JMP SET_UNIFORM_COLORS                                           ; SET UNIFORM COLORS




SOUND_ENGINE_START = $8000

_F{_DRAW_GAME_FIELD															; DONE

metatile_4_by_24_addr  					= LOCAL_1
num_metatile_cols   					= LOCAL_7
num_metatile_rows  						= LOCAL_8

num_metatile_col_whole_field			= $10							    ; 0x08 for onscreen +0x08 for offscreen

dist_to_meta_tile_col 					= $60 
METATILE_TILE_HEIGHT_FIELD   			= $04
NUM_METATILES_PER_COL_FIELD 			= $06 

offset_to_special_side_end_pal_index 	= $05
X_SCROLL_BITMASK_4YD					= $E0							    ; looks up field location in 4 yard increments	


CROWD_END_IRQ_BG_0000	= IRQ_2_BG_0000
LENGTH_OF_LOCAL_VARS 	= LOCAL_8 - LOCAL_1 + 1 

DRAW_GAME_FIELD:                                                            ; DRAW GAME FIELD()
	LDX #DRAW_GAMEFIELD_STACK_INDEX                                         ; SET STACK LOC = GAME FIELD STACK START
	TXS                                                                                                                                   ; 
	
	LDA #$00																; *** deviates from normal clear routines can fix 
	LDY #$F8																; SET LOCATION TO $3E
@clear_vars:																; CLEAR LOCAL VARIABLES ($3E-$45)LOOP
	STA $FF46,Y																; 
	INY																		; 
	BNE @clear_vars															; DONE? NO->CLEAR LOCAL VARIABLES ($3E-$45)LOOP


@set_mirr_vert_disable_nmi 
	JSR SET_MMC3_VERT_MIRROR                                                ; SET GAME STATUS AND MMC3 MIRRORING TO VERTICAL()
	JSR DISABLE_INTERRUPTS_RENDERING                                        ; DISABLE NMI, SPRITES, BACKGROUND, DISABLE MMC3 INTERRUPTS()
	LDA #SOUND_ENGINE_BANK                                                  ; SET BANK = BANK 28 
	LDY #<SOUND_ENGINE_START                                                             ; SET ADDR = SOUND PROCESSING()
	LDX #>SOUND_ENGINE_START                                                            ;
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                                      ; SWAP $8000 BANK AND JUMP(Y,X= ADDRESS, A= BANK TO SWAP TO)
	LDX #DRAW_GAME_FIELD_BANK                                               ; SET BANK = BANK 23
	JSR SWAP_A000_BANK                                                      ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	SUBTRACT_16BIT_MEM_MINUS_16_BIT_CONST  CURR_X_SCROLL, dist_to_meta_tile_col
	LDA #num_metatile_col_whole_field                                       ; SET NUMBER OF METATILE COLLUMNS = 16
	STA num_metatile_cols                                                   ;
	
@draw_field_metatile_col:                                                   ; GET NAMETABLE ADDR, RESET NUMBER OF ROWS 
	LDY CURR_X_SCROLL                                                       ; LOAD METATILE START LOCATION
	LDX CURR_X_SCROLL+1                                                     ; 
	JSR CONVERT_FIELD_LOC_TO_PPU_ADDR                                       ; GET NAMETABLE (X,Y= FIELD LOC)
	LDA #NUM_METATILES_PER_COL_FIELD                                         ; SET NUMBER OF METATILES = 6
	STA num_metatile_rows                                                   ; 
	
@draw_metatile_row:                                                         ; DRAW METATILE ROW
	JSR GET_FIELD_META_ATTR_TABLE_ADDR                                      ; SET METATILE ATTRIBUTE TABLE ADDRESS() 
	LDA #METATILE_TILE_HEIGHT_FIELD                                         ; SET METATILE_HEIGHT = 4 
	STA METATILE_HEIGHT                                                     ; 
	JSR DRAW_METATILE_COLLUMN                                                       ; DRAW COLLUMN( A= HEIGHT)     
	INC metatile_4_by_24_addr                                               ; METATILE DATA ADDR++
	BNE @check_all_rows_done                                                ; 

@update_higher_byte_of_addr 	
	INC metatile_4_by_24_addr+1                                             ;
	
@check_all_rows_done:                                                       ; CHECK FOR ALL ROWS DRAWN
	DEC num_metatile_rows                                                   ; METATILE ROWS--     
	BNE @draw_metatile_row:                                                 ; DONE? NO-> DRAW METATILE ROW
																			; CURRENT FIELD CAMERA LOCATION += DISTANCE TO NEXT COLUMN = 4 YARDS
	ADD_16BIT_CONST_TO_ZP[val_addr] LENGTH_OF_ONE_ROW, CURR_X_SCROLL
	DEC num_metatile_cols                                                   ; NUMBER OF METATILE COLLUMNS--
	BNE @draw_field_metatile_col:                                           ; DONE? NO-> GET NAMETABLE ADDR, RESET NUMBER OF ROWS
																			; RESTORE ORIGINAL SCROLL LOCATION
																			; SCROLL LOC = SCROLL LOC– 2 X FIELD SIZE (1 FOR ONSCREEN, 1 FOR OFFSCREEN) 
	SUBTRACT_16BIT_MEM_MINUS_16_BIT_CONST  CURR_X_SCROLL, $01A0
	
DO_SOUND_UPDATE:                                                            ; DO SOUND UPDATE
	LDA #SOUND_ENGINE_BANK                                                  ; SET BANK = BANK 28 
	LDY #<SOUND_ENGINE_START                                                ; SET ADDR = SOUND PROCESSING()
	LDX #>SOUND_ENGINE_START                                                ;
	JSR SWAP_8000_BANK_AND_JUMP_RETURN                                      ; SWAP $8000 BANK AND JUMP(Y,X= ADDRESS, A= BANK TO SWAP TO)
	LDX #DRAW_GAME_FIELD_BANK                                               ; SET BANK =  23 = DRAW BANK
	JSR SWAP_A000_BANK                                                      ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	
@load_all_screen_splits:                                                    ; LOAD SPLIT SCREEN IRQ INFO
	JSR UPDATE_PPUCTRL                                                      ; UPDATE PPUCTRL() = RE-ENABLE INNTERRUPTS
	LDY #<GAME_FIELD_IRQ_SPLITS                                             ; SET IRQ ADDR = GAME FIELD IRQ INFO
	LDX #>GAME_FIELD_IRQ_SPLITS                                             ; 
	JSR LOAD_IRQ_SPLIT_DATA                                                 ; LOAD IRQ SPLIT INFO (5 DATA POINTS PER SPLIT)
	
@set_side_line_endzone_chr_bank_0000										; set sideline and crowd_chr bnk
	LDA CURR_X_SCROLL + 1                                                   ;
	EOR #$FF                                                                ;
	AND #$08                                                                ;
	LSR                                                                     ;
	ORA #$10                                                                ;
	STA CROWD_END_IRQ_BG_0000                                               ;
	
@set_all_game_field_colors:                                                 ; LOAD GAME FIELD COLORS
	JSR SET_UNIFORM_COLORS                                                  ; SET P1 AND P2 TEAM UNIFORM COLORS IN SPR PALLETE BUFFER() 
	

	
COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] GAME_FIELD_BG_COLOR_TABLE, PALLETE_BUFFER_START, $10	
	

	
@check_special_color_load_near_right_endzone
	LDA CURR_X_SCROLL                                                       ; IS SCREEN CAMERA LOCATION =  NEAR RIGHT ENDZONE   
	CMP #<(FRONT_RIGHT_ENDZONE - $140)                                                            ;
	LDA CURR_X_SCROLL+1                                                     ;
	SBC #>(FRONT_RIGHT_ENDZONE - $140)                                                             ;
	BCC @set_field_col                                                      ; NO-> SET COLUMN
	LDA #COLOR_MEDIUM_GREEN                                                 ; SETS PART OF RIGHT ENDZONE SIDELINE AND BACK OF RIGHT ENDZONE PALLETE
	STA PALLETE_BUFFER_START + offset_to_special_side_end_pal_index         ;                                                     
	
@set_field_col:                                                             ; SET COLUMN
	LDA CURR_X_SCROLL                                                       ; SET COLLUMN X LOC = UPPER BITS OF FIELD CAMERA X LOC 
	AND #X_SCROLL_BITMASK_4YD                                                ;
	STA LAST_FIELD_COL_INDEX 												; SET LAST DRAW LOCATION UPPER BITS = CURRENT DRAW LOCATION UPPER BITS
	LDA #$00                                                                ; SET DIRECTION = CLEAR DIRECTION 
	STA X_SCROLL_AMOUNT                                                     ;
	
CHECK_DRAW_NEW_COL:                                                         ; CHECK FOR DRAW NEW COLLUMN 
	RETURN_1_FRAME
	LDA CURR_X_SCROLL                                                       ; DOES CURRENT DRAW LOCATION UPPER BITS = LAST DRAW LOCATION UPPER BITS
	AND #X_SCROLL_BITMASK_4YD                                               ;
	CMP LAST_FIELD_COL_INDEX                                                ;
	BEQ CHECK_DRAW_NEW_COL                                                  ; YES->CHECK FOR DRAW NEW COLLUMN
	
@set_col_index	
	STA LAST_FIELD_COL_INDEX                                                ; SET LAST DRAW LOCATION UPPER BITS = CURRENT DRAW LOCATION UPPER BITS
	LDX X_SCROLL_AMOUNT	                                                    ; IS X SCROLL DIRECTION/ AMOUNT = LEFT
	BMI @scrolling_left                                                     ; YES->
																			; *** EVERYTHING REFERENCED TO 0,0 ***
@scrolling_right:                                                           ; SCROLLING RIGHT
	CLC                                                                     ; = CAMERA LOCATION + DISTANCE TO EDGE OF RIGHT NAMETABLE
	ADC #$80                                                                ;
	TAY                                                                     ;
	LDA CURR_X_SCROLL + 1                                                   ;
	ADC #$01                                                                ;
	JMP @convert_field_loc_to_ppu_addr                                      ; JUMP-> START OF DRAW COLLUMN

@scrolling_left:                                                            ; SCROLLING LEFT
	SEC                                                                     ; = CAMERA LOCATION – SIZE OF ONE COLUMN
	SBC #$60                                                                ;
	TAY                                                                     ;
	LDA CURR_X_SCROLL + 1                                                   ;
	SBC #$00                                                                ;

@convert_field_loc_to_ppu_addr:                                             ; START OF DRAW COLLUMN
	TAX                                                                     ; SET DIRECTION = CLEAR DIRECTION
	LDA #$00                                                                ; 
	STA X_SCROLL_AMOUNT                                                     ; 
	JSR CONVERT_FIELD_LOC_TO_PPU_ADDR                                       ; GET NAMETABLE (X,Y= FIELD LOC IN 0x20 INCREMENTS)
	RETURN_1_FRAME
	LDY #NUM_METATILES_PER_COL_FIELD                                         ; SET # OF METATILE ROWS = 6 = FIELD HEIGHT

@do_metatile_rows_loop:                                                     ; DO METATILE ROWS LOOP 
	JSR GET_FIELD_META_ATTR_TABLE_ADDR                                      ; SET METATILE ATTRIBUTE TABLE ADDRESS()  
	LDA #METATILE_TILE_HEIGHT_FIELD                                          ; SET METATILE HEIGHT =4
	STA METATILE_HEIGHT                                                     ; 
	RETURN_1_FRAME															; 
	INC metatile_4_by_24_addr                                               ; METATILE DATA ADDR++
	BNE @check_done_or_special_command                                      ;
	INC metatile_4_by_24_addr +1                                            ; 
	
@check_done_or_special_command:                                             ; 
	DEY                                                                     ; # OF METATILE ROWS--
	BNE @do_metatile_rows_loop                                              ; DONE? NO-> DO ROWS LOOP 
	LDY #$01                                                                ; DOES DATA = SPECIAL FIELD ACTION
	LDA (metatile_4_by_24_addr),Y                                           ;
	BEQ CHECK_DRAW_NEW_COL                                                  ; 
	ASL                                                                     ; SHIFT FOR COMMAND TABLE
	TAX                                                                     ;
	JUMP_TO_ADDR_VIA_RTS[addr] FIELD_COMMAND_TABLE
	

																			; THESE ARE NEEDED WHEN SCROLLING FROM ONE END OF THE FILED TO ANOTHER
																			; FIELD COMMAND TABLE
								
special_color_pal_ = PALLETE_BUFFER_START + $05

FIELD_COMMAND_TABLE: 
	.WORD CHECK_DRAW_NEW_COL-1                                           ; CHECK FOR DRAW NEW COLLUMN REDUNDANT SINCE ITS CHECKED ALREADY
	.WORD LEFT_ENDZONE_BG_CHR-1                                          ; LEFT_ENDZONE_BG-1, 
	.WORD RIGHT_ENDZONE_BG_CHR-1                                         ; RIGHT_ENDZONE_BG-1, 
	.WORD MID_FIELD_LOGO_COLOR-1                                         ; MID_FIELD_COLOR-1, 
	.WORD RIGHT_ENDZONE_GRASS_COL-1                                      ; RIGHT_ENDZONE_GRASS NEAR CROWD -1

LEFT_ENDZONE_BG_CHR:                                                        ; LEFT_ENDZONE_BG       
	LDA #LEFT_ENDZONE_CROWD_CHR_BANK	                                    ; SET IRQ 2 BG CHR 0000 = LEFT ENDZONE BANK  
	STA IRQ_2_BG_0000                                                       ;
	JMP CHECK_DRAW_NEW_COL                                                  ; JUMP-> CHECK FOR NEXT COLLUMN

RIGHT_ENDZONE_BG_CHR:                                                       ; RIGHT_ENDZONE_BG       
	LDA #RIGHT_ENDZONE_CROWD_CHR_BANK                                       ; SET IRQ 2 BG CHR 0000 = RIGHT ENDZONE BANK  
	STA IRQ_2_BG_0000                                                       ; 
	JMP CHECK_DRAW_NEW_COL                                                  ; JUMP-> CHECK FOR NEXT COLLUMN

MID_FIELD_LOGO_COLOR:                                                       ; 0X03 MID_FIELD_COLOR     
	LDA #COLOR_MEDIUM_GREY_BLUE                                             ; SET PALLETE COLOR = BLUE
	STA PALLETE_BUFFER_START + $05                                          ;
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                                   ;
	JMP CHECK_DRAW_NEW_COL                                                  ; JUMP-> CHECK FOR NEXT COLLUMN

RIGHT_ENDZONE_GRASS_COL:                                                    ; 0X04 RIGHT_ENDZONE_GRASS NEAR CROWD      
	LDA #COLOR_MEDIUM_GREEN                                                 ; SET PALLETE COLOR = MEDIUM GREEN 
	STA PALLETE_BUFFER_START + $05                                          ;
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                                   ;
	JMP CHECK_DRAW_NEW_COL                                                  ; JUMP-> CHECK FOR NEXT COLLUMN


temp_metatile_data_addr				= LOCAL_1
OFFSET_TO_24_192_GAMEFIELD_TABLE	= (GAME_FIELD_24x192_META - GAME_FIELD_BG_COLOR_TABLE) + 1
	
CONVERT_FIELD_LOC_TO_PPU_ADDR:       
																			; GET NAMETABLE (X,Y= FIELD LOC FIELD LOC IN 0x20 INCREMENTS)      
	TYA                                                                     ; CONVERT FIELD LOC TO NAMETABLE ADDR (5E,5F)
	AND #$E0                                                                ; 
	TAY                                                                     ; 
	LSR                                                                     ;
	LSR                                                                     ;
	LSR                                                                     ;
	CLC                                                                     ;
	ADC #$80                                                                ; 
	STA METATILE_PPU_ADDR                                                   ; 
	TXA                                                                     ;
	AND #$01                                                                ;
	ASL                                                                     ;
	ASL                                                                     ;
	ADC #OFFSET_TO_24_192_GAMEFIELD_TABLE                                   ; + offset to 24 x 192 TABLE
	STA METATILE_PPU_ADDR+1                                                 ; 
	STY temp_metatile_data_addr	                                            ; CONVERT FIELD LOC TO GAME FIELD 24 x 192 INDEX
	TXA                                                                     ;
	ASL temp_metatile_data_addr	                                            ;
	ROL                                                                     ;
	ASL temp_metatile_data_addr	                                            ;
	ROL                                                                     ;
	ASL temp_metatile_data_addr	                                            ;
	ROL                                                                     ;
	TAX                                                                     ; 
	LDA GAME_FIELD_24x192_META-$20,X                                        ; GET GAME FIELD 4x24 INDEX FROM GAME FIELD 32x192 TABLE
	LDX #$00                                                                ; CONVERT GAME FIELD 4x24 INDEX TO GAME FIELD 4x24 OFFSET 
	STX temp_metatile_data_addr +1                                          ; 
	ASL                                                                     ;
	ROL temp_metatile_data_addr +1                                          ;
	ASL                                                                     ;
	ROL temp_metatile_data_addr +1                                          ;
	ASL                                                                     ;
	ROL temp_metatile_data_addr +1                                          ;
	CLC                                                                     ;
	ADC #<GAME_FIELD_24x4_META_TBL                                          ; GAME FIELD 4x24 INDEX ADDR = GAME FIELD 
	STA temp_metatile_data_addr                                             ;
	LDA temp_metatile_data_addr +1                                          ;
	ADC #>GAME_FIELD_24x4_META_TBL                                          ;
	STA temp_metatile_data_addr +1                                           ;
	RTS                                                                     ; RETURN

GET_FIELD_META_ATTR_TABLE_ADDR:                                             ; SET METATILE ATTRIBUTE TABLE ADDRESS()    
	LDX #$00                                                                ; LOAD 4X24 METATILE INDEX FROM 4X24 METATILE TABLE
	LDA (temp_metatile_data_addr,X)                                         ; 
	STA METATILE_ADDR                                                       ; CONVERT 4X24 METATILE INDEX TO 4X4 GAME FIELD OFFSET
	STX METATILE_ADDR + 1                                                   ;
	ASL                                                                     ;
	ROL METATILE_ADDR + 1                                                   ;
	ASL                                                                     ;
	ROL METATILE_ADDR + 1                                                   ;
	ASL                                                                     ;
	ROL METATILE_ADDR + 1                                                   ;
	ASL                                                                     ;
	ROL METATILE_ADDR + 1                                                   ;
	CLC                                                                     ;
	ADC METATILE_ADDR                                                       ;
	STA METATILE_ADDR                                                       ;
	LDA METATILE_ADDR + 1                                                   ;
	ADC #$00                                                                ;
	STA METATILE_ADDR + 1                                                   ;
	LDA METATILE_ADDR                                                       ; 4X4 METATILE ID = 4X4 GAME FIELD ADDRESS ($8580) + 4X4 GAME FIELD OFFSET
	CLC                                                                     ;
	ADC #<GAME_FIELD_4x4_ATTR_TILE_TBL                                      ; 
	STA METATILE_ADDR                                                       ;
	LDA METATILE_ADDR + 1                                                   ;
	ADC #>GAME_FIELD_4x4_ATTR_TILE_TBL                                      ;
	STA METATILE_ADDR + 1                                                   ;
																			; CONVERT CURRENT NAMETABLE LOCATION TO ATTRIBUTE TABLE LOCATION
	LDA METATILE_PPU_ADDR                                                     ; $5C,$5D= CURRENT ATTRBIUTE TABLE ADDR , $5E,5F = CURRENT NAME TABLE ADDR
	AND #%10011100                                                          ;
	LSR                                                                     ;
	LSR                                                                     ;
	STA ATTRIBUTE_ADDR                                                      ;
	AND #%00100000                                                          ;
	LSR                                                                     ;
	LSR                                                                     ;
	ORA ATTRIBUTE_ADDR                                                      ;
	AND #%00001111                                                          ;
	STA ATTRIBUTE_ADDR                                                      ;
	LDA METATILE_PPU_ADDR+ 1                                                ;
	ASL                                                                     ;
	ASL                                                                     ;
	ASL                                                                     ;
	ASL                                                                     ;
	AND #%00110000                                                          ;
	CLC                                                                     ;
	ADC #<OFFSET_TO_ATTR_TABLE                                              ; CURRENT ATTR TABLE ADDR = OFFSET TO ATTRIB TABLE START + ATTR TABLE INDEX
	ORA ATTRIBUTE_ADDR                                                      ;
	STA ATTRIBUTE_ADDR                                                      ;
	LDA METATILE_PPU_ADDR+ 1                                                ;
	AND #%11111100                                                          ;
	ADC #>OFFSET_TO_ATTR_TABLE                                              
	STA ATTRIBUTE_ADDR +1                                                   ;
	LDA #DRAW_GAME_FIELD_BANK                                               ; SET METATILE BANK = GAME FIELD BANK = BANK 23
	STA METATILE_BANK                                                       ;
	RTS                                                                     ; RETURN

_F}_DRAW_GAME_FIELD

_F{_DRAW_METATILE_COLLUMN															; DONE

metatile_height = $04                                                       ; 4 rows high
								
DRAW_METATILE_COLLUMN:                                                              ; DRAW METATILE ()
	LDA #SET_BANK_TO_A000_MMC3                                              ; SET MMC3 BANK = $A000 
	STA BANK_SELECT_MMC3                                                    ; 
	LDA_ABS_A_ZP METATILE_BANK                                              ; SET MMC3 BANK NUMBER = METATILE BANK *** original uses uneeded instruction can fix to normal LDA
	STA BANK_DATA_MMC3                                                      ;
	LDA ATTRIBUTE_ADDR+1                                                    ; SET PPU ADDR = METATILE ATTRIBUTE TABLE ADDRESS
	STA NES_PPU_ADDR                                                        ;
	LDA ATTRIBUTE_ADDR                                                      ;
	STA NES_PPU_ADDR                                                        ;
	LDY #$00                                                                ; SET ATTRIBUTE TABLE VALUE
	LDA (METATILE_ADDR),Y                                                   ;
	STA NES_PPU_DATA                                                        ;
	INY                                                                     ; DATA ADDR ++
	
@draw_next_row:                                                             ; SET ROW WIDTH
	LDX #metatile_height                                                    ; SET METATILE HEIGHT = 4 TILES
	LDA METATILE_PPU_ADDR+1                                                 ; SET PPU ADDR = METATILE PPU ADDR
	STA NES_PPU_ADDR                                                        ;
	LDA METATILE_PPU_ADDR                                                   ;
	STA NES_PPU_ADDR                                                        ;
	
@copy_tiles_to_ppu:                                                         ; DRAW 4 TILE METATILE ROW
	LDA (METATILE_ADDR),Y                                                   ; LOAD TILE FROM METATILE DATA
	STA NES_PPU_DATA                                                        ;
	INY                                                                     ; DATA ADDR++
	DEX                                                                     ; TILES IN ROW TO DRAW--
	BNE @copy_tiles_to_ppu:                                                 ; DONE? NO-> DRAW 4 TILE METATILE ROW
	LDA METATILE_PPU_ADDR                                                   ; SET METATILE DRAW ADDR = NEXT ROW
	CLC                                                                     ;
	ADC #<LENGTH_OF_ONE_ROW                                                 ; = ADDR + 0X20
	STA METATILE_PPU_ADDR                                                   ;
	LDA METATILE_PPU_ADDR+1                                                 ;
	ADC #>LENGTH_OF_ONE_ROW                                                 ;
	STA METATILE_PPU_ADDR+1                                                 ;
	DEC METATILE_HEIGHT                                                     ; NUMBER OF ROWS TO DRAW--
	BNE @draw_next_row                                                      ; DONE NO->draw next row
	
@exit: 
	RTS                                                                     ; RETURN

_F}_DRAW_METATILE_COLLUMN
	
_F{_SET_TEAM_UNIFORM_COLORS												    ; DONE

pal_buf_index_p1 = $10
pal_buf_index_p2 = $18  

opponent_team_id    = LOCAL_5
p1_p2_pallete_index   = LOCAL_6
team_colors_addr   = LOCAL_7

size_of_team_color_entry = $0A
offset_to_color_logic  = $06

first_uniform_offset  = $00 
second_uniform_offset  = $03
third_uniform_offset  = $06                                                 ; KC ONLY

player_trans_pal_index_l   = PALLETE_BUFFER_START 
player_trans_pal_index_d   = PALLETE_BUFFER_START + $04

helmet_pants_pal_index_l  = PALLETE_BUFFER_START + $01 
helmet_pants_pal_index_d  = PALLETE_BUFFER_START + $05

light_skin_pal_index   = PALLETE_BUFFER_START + $02 
dark_skin_pal_index    = PALLETE_BUFFER_START + $06 

jersey_pal_index_l    = PALLETE_BUFFER_START + $03 
jersey_pal_index_d    = PALLETE_BUFFER_START + $07	

	
SET_UNIFORM_COLORS:                                                         ; GET P1 AND P2 TEAM UNIFORM COLORS  
	LDA P1_TEAM                                                             ; LOAD P1 TEAM      
	LDY P2_TEAM                                                             ; LOAD P2 TEAM
	LDX #pal_buf_index_p1                                                   ; SET PALLETE BUFFER INDEX = HOME TEAM
	JSR @get_team_uniform_colors                                            ; GET TEAM UNIFORM COLORS(A= OWN TEAM, Y=OPP TEAM, X = PAL INDEX) 
	LDA P2_TEAM                                                             ; LOAD P2 TEAM     ---------------------
	LDY P1_TEAM                                                             ; LOAD P1 TEAM
	LDX #pal_buf_index_p2                                                   ; SET PALLETE BUFFER INDEX = AWAY TEAM
	JSR @get_team_uniform_colors                                            ; GET TEAM UNIFORM COLORS(A= OWN TEAM, Y=OPP TEAM, X = PAL INDEX
	RTS                                                                     ; RETURN



@get_team_uniform_colors:                                                   ; GET TEAM UNIFORM COLORS(A= OWN TEAM, Y=OPP TEAM, X = PAL INDEX) 
	STX p1_p2_pallete_index                                                 ; SAVE PALLETE INDEX 
	CMP #KC_TEAM_ID                                                         ; IS TEAM = KANSAS CITY 
	BEQ @set_kansas_city_colors:                                            ; YES-> GET KANSAS CITY COLORS
	
@get_team_color_entry_addr: 
	STY opponent_team_id                                                    ; SAVE OPPONENT TEAM ID
	LDX #size_of_team_color_entry                                           ; SET SIZE PER TEAM = 10 BYTES
	JSR MULTIPLY_A_TIMES_X                                                  ; =X * A = 10 ENTRIES PER TEAM * TEAM ID  
	LDA team_colors_addr                                                    ; SET PAL ADDR= TEAM OFFSET(44,45) + TEAM UNIFORM COLORS START ADDR($82D4) 
	CLC                                                                     ;
	ADC #<TEAM_COLORS_TABLE                                                 ; 
	STA team_colors_addr                                                    ;
	LDA team_colors_addr+1                                                  ;
	ADC #>TEAM_COLORS_TABLE                                                 ; 
	STA team_colors_addr+1                                                  ;
	LDA opponent_team_id                                                    ; LOAD OPP TEAM ID 
	LDY #offset_to_color_logic                                             ; SET INDEX = FIRST BYTE
	
@set_team_index_into_color_logic:                                           ; FIND INDEX INTO COLOR LOGIC LOOP
	CMP #$08                                                                ; IS OPP TEAM ID IN CURRENT BYTE?
	BCC @check_first_or_sec_uniform:                                        ; YES->SET PALLETE
	SBC #$08                                                                ; 
	INY                                                                     ; DATA INDEX++
	JMP @set_team_index_into_color_logic:                                   ; JUMP-> FIND INDEX INTO COLOR LOGIC LOOP

@check_first_or_sec_uniform:                                                ; CHECK FOR PRIMARY OR SECONDARY COLOR
	STA opponent_team_id                                                    ; 
	LDA (team_colors_addr),Y                                                ; LOAD COLOR BYTE 
	LDY opponent_team_id                                                    ;
	AND BIT_MASK_ARRAY,Y                                                    ; DOES COLOR BYTE & TEAM MASK = USE SECONDARY COLOR = TRUE
	BNE @use_secondary_uniform                                              ; YES->SET INDEX TO SECONDARY UNIFORM PALLETE
	LDY #first_uniform_offset                                               ; SET PAL OFFSET  = PRIMARY UNIFORM COLOR
	JMP @save_colors_in_buffer                                              ; JUMP-> SAVE UNIFORM PALLETE VALUES (Y = PAL OFFSET)

@use_secondary_uniform:                                                     ; SET INDEX TO SECONDARY UNIFORM PALLETE 
	LDY #second_uniform_offset                                              ; SET PAL OFFSET  = SECONDARY UNIFORM COLOR
	JMP @save_colors_in_buffer                                              ; JUMP-> SAVE UNIFORM PALLETE VALUES (Y = PAL OFFSET)

@set_kansas_city_colors:                                                    ; SET KANSAS CITY COLORS
	LDA #<KC_COLOR_TABLE                                                    ; SET PAL PTR = KANSAS CITY COLORS
	STA team_colors_addr                                                    ;
	LDA #>KC_COLOR_TABLE                                                    ;
	STA team_colors_addr+1                                                  ;
	
@check_for_second_kc_uniform 
	TYA                                                                     ; LOAD OPPONENT TEAM
	LDY #second_uniform_offset                                              ; SET INDEX = PINK PANTS/ RED JERSEY = UNI #2
	CMP #NE_TEAM_ID                                                         ; IS OPPONENT TEAM = NEW ENGLAND
	BEQ @save_colors_in_buffer                                              ; YES-> SAVE UNIFORM PALLETE VALUES (Y = DATA OFFSET)
	CMP #WAS_TEAM_ID                                                        ; IS OPPONENT TEAM = WASHINGTON
	BEQ @save_colors_in_buffer                                              ; YES-> SAVE UNIFORM PALLETE VALUES (Y = DATA OFFSET)
	CMP #MIN_TEAM_ID                                                        ; IS OPPONENT TEAM = MINNESOTA
	BEQ @save_colors_in_buffer                                              ; YES-> SAVE UNIFORM PALLETE VALUES (Y = DATA OFFSET)
	CMP #TB_TEAM_ID                                                         ; IS OPPONENT TEAM = TAMPA BAY
	BEQ @save_colors_in_buffer                                              ; YES-> SAVE UNIFORM PALLETE VALUES (Y = DATA OFFSET)

@check_for_third_kc_uniform 
	LDY #third_uniform_offset                                               ; SET INDEX = DARK PINK PANTS/ WHITE JERSEY = UNI #3
	CMP #BUF_TEAM_ID                                                        ; IS OPPONENT TEAM = BUFFALO
	BEQ @save_colors_in_buffer                                              ; YES-> SAVE UNIFORM PALLETE VALUES (Y = DATA OFFSET)
	CMP #CIN_TEAM_ID                                                        ; IS OPPONENT TEAM = CINCY
	BEQ @save_colors_in_buffer                                              ; YES-> SAVE UNIFORM PALLETE VALUES (Y = DATA OFFSET)
	CMP #CLE_TEAM_ID                                                        ; IS OPPONENT TEAM = CLE
	BEQ @save_colors_in_buffer                                              ; YES-> SAVE UNIFORM PALLETE VALUES (Y = DATA OFFSET)

@use_first_kc_uniform 
	LDY #$00                                                                ; ELSE SET INDEX= PINK PANTS/ WHITE JERSEY

	

@save_colors_in_buffer:                                                     ; SAVE UNIFORM PAL VALS IN PAL BUFFER (Y = HOME/AWAY OFFSET, $44=TEAM PAL ADDR )
	LDX p1_p2_pallete_index                                                 ; LOAD PAL BUFFER INDEX (HOME OR AWAY)
@set_transparent_color: 
	LDA #COLOR_BLACK_2                                                      ; SET TRANSPARENT COLOR
	STA player_trans_pal_index_l,X                                          ;
	STA player_trans_pal_index_d,X                                          ;
	
@set_light_skin_color: 
	LDA #LIGHT_SKIN_COLOR                                                   ; SET LIGHT SKIN COLOR 
	STA light_skin_pal_index,X                                              ;
	
@set_helmet_pants_color: 
	LDA (team_colors_addr),Y                                                ; SET HELMET/PANTS COLOR FROM ON_FIELD_UNIFORM_COLORS
	STA helmet_pants_pal_index_l,X                                          ;
	STA helmet_pants_pal_index_d,X                                          ;
	INY                                                                     ; DATA INDEX++
	
@set_dark_skin_color: 
	LDA (team_colors_addr),Y                                                ; SET DARK SKIN COLOR FROM ON_FIELD_UNIFORM_COLORS
	STA dark_skin_pal_index,X                                               ;
	INY                                                                     ; DATA INDEX++
	LDA (team_colors_addr),Y                                                ;
	STA jersey_pal_index_l,X                                                ; SET JERSEY COLOR FROM ON_FIELD_UNIFORM_COLORS
	STA jersey_pal_index_d,X                                                ;
	RTS                                                                     ; RETURN

BIT_MASK_ARRAY:                                                             ; BIT MASK ARRAY    
	.DB $80,$40,$20,$10,$08,$04,$02,$01

TEAM_COLORS_TABLE:                                                          ; ON_FIELD_UNIFORM_COLORS 
																			; HOME( HELMET/PANTS, DARK SKIN, JERSEY), AWAY(SAME), JERSEY SELECTION LOGC(4 BYTES)
	.DB $25,$06,$11, $15,$06,$21, $00,$00,$00,$00                           ; BUF 
	.DB $30,$06,$11, $30,$06,$11, $00,$00,$00,$00                           ; IND
	.DB $30,$16,$1C, $30,$06,$2C, $50,$10,$6C,$20                           ; MIA
	.DB $30,$06,$25, $30,$06,$24, $86,$22,$41,$80                           ; NE
	.DB $30,$16,$09, $09,$16,$30, $F5,$5C,$69,$A0                           ; NYJ
	
	.DB $26,$06,$0F, $26,$06,$30, $D0,$D0,$04,$30                           ; CIN
	.DB $26,$06,$30, $36,$06,$17, $80,$20,$93,$00                           ; CLE
	.DB $30,$06,$21, $21,$06,$30, $70,$04,$49,$A0                           ; HOU
	.DB $0F,$16,$28, $28,$16,$0F, $00,$62,$92,$40                           ; PIT
	
	.DB $11,$06,$26, $01,$06,$26, $C0,$01,$00,$60                           ; DEN
	.DB $25,$0F,$30, $25,$0F,$16, $00,$00,$00,$00                           ; UNUSED
	.DB $31,$16,$0F, $10,$16,$30, $40,$84,$2C,$30                           ; OAK
	.DB $38,$06,$11, $01,$16,$30, $F7,$DD,$6D,$FF                           ; SD
	.DB $31,$16,$11, $31,$06,$30, $E0,$C1,$2C,$60                           ; SEA

	.DB $16,$0F,$30, $06,$0F,$30, $02,$00,$00,$00                           ; WAS
	.DB $0F,$16,$11, $11,$06,$30, $84,$D0,$2C,$B0                           ; NYG
	.DB $29,$06,$30, $29,$06,$30, $00,$00,$00,$00                           ; PHI
	.DB $30,$0F,$16, $31,$0F,$16, $52,$22,$01,$00                           ; PHX
	.DB $10,$16,$01, $10,$16,$01, $00,$00,$00,$00                           ; DAL
	
	.DB $0F,$16,$30, $0F,$16,$30, $00,$00,$00,$00                           ; CHI
	.DB $31,$06,$21, $10,$06,$11, $21,$04,$00,$00                           ; DET
	.DB $38,$06,$09, $38,$06,$30, $48,$80,$00,$20                           ; GB
	.DB $14,$06,$30, $14,$06,$30, $00,$00,$00,$00                           ; MIN
	.DB $30,$06,$27, $30,$06,$27, $00,$00,$00,$00                           ; TB
	
	.DB $38,$06,$25, $28,$06,$15, $92,$20,$05,$40                           ; SF
	.DB $11,$06,$38, $21,$06,$38, $40,$49,$24,$00                           ; LA
	.DB $28,$16,$0F, $28,$06,$30, $80,$C0,$30,$10                           ; NO
	.DB $0F,$16,$00, $10,$0F,$30, $08,$80,$20,$00                           ; ATL

	.DB $25,$06,$30, $25,$06,$30, $00,$00,$00,$00                           ; AFC PRO BOWL
	.DB $30,$16,$11, $30,$16,$11, $00,$00,$00,$00                           ; NFC PRO BOWL

KC_COLOR_TABLE:                                                             ; TEAM_0A_FIELD_COLORS:    
	.DB $25,$0F,$30, $25,$0F,$16, $15,$0F,$30
	
_F}_SET_TEAM_UNIFORM_COLORS 

_F{_GAME_FIELD_DATA_METATILE_TABLES											; DONE

GAME_FIELD_BG_COLOR_TABLE:                                                  ; GAME_FIELD_BG PAL COLORS
																			; BLACK, SKY-BLUE, PINK, WHITE 
																			; BLACK, SEA-BLUE, PINK, WHITE
																			; BLACK, MEDIUM-GREEN, SEA-BLUE, WHITE
																			; BLACK, WHITE-ORANGE, PURPLE-PINK, WHITE

	.DB $0F,$21,$25,$30                                                 	; BG, POM POMS LEFT, CROWD/SCORE OUTLINE,YARD MARKERS/CHEER SHIRT, 			
																			; CROWD OUTLINE/CLOCK AND BANNER TEXT
	.DB $0F,$11,$25,$30                                                  	; BG, NFL SHIELD TINY , NFL SHIELD TEXT2/RIGHT ENDZONE, SHIELD TEXT AND RIGHT ENDZONE LETTERING
	.DB $0F,$1A,$11,$30                                                  ; BG, FIELD, LEFT ENDZONE, YARDLINES/ENDZONE LETTERS AND TECMO BALLS ON FIELD
	.DB $0F,$37,$24,$30                                                  ; BG, CROWD3, CROWD4, CROWD OUTLINE

GAME_FIELD_IRQ_SPLITS:                                                      ; GAME_FIELD_IRQ_SPLITS   
																			; $54, $55, BG CHAR BANK 0, BG CHAR BANK 1, IRQ COUNTER
	.DB $00,$00,$18,$1A,$20                                                 ; BANNER SPLIT
	.DB $00,$00,$10,$30,$16                                                 ; CROWD SPLT
	.DB $00,$00,$00,$1C,$00                                                 ; FIELD 

GAME_FIELD_24x192_META:                                                     ; GAME FIELD 24 x 192 (H x W) 
	.DB $00,$00,$00,$00,$00,$00,$00,$00                                     ; LEFT ENDZONE STADIUM CROWD + EXTRA CROWD
	.DB $00,$00,$00,$00,$00,$00,$00,$01                                     ; 

	.DB $02,$03,$04,$05,$06,$07,$08,$09                                     ; MAIN GAME FIELD + ENDZONES
	.DB $0A,$0B,$0C,$0D,$0E,$0F,$10,$11                                     ;
	.DB $12,$13,$14,$15,$16,$17,$18,$19                                     ;
	.DB $1A,$1B,$1C,$1D,$1E,$1F,$20,$21                                     ;

	.DB $22,$22,$22,$22,$22,$22,$22,$22                                     ; RIGHT ENDZONE STADIUM CROWD + EXTRA CROWD
	.DB $22,$22,$22,$22,$22,$22,$22,$22

GAME_FIELD_24x4_META_TBL:                                                   ; GAME_FIELD_24 x 4 (H x W)
																			; METATILE 1-6, EMPTY, SPECIAL COMMAND (SET ENDZONE BACKGROUND OR COLOR)
	
	.DB $00,$01,$02,$03,$02,$03, $00,$00                                    ; $00;LEFT ENDZONE CROWD 
	.DB $04,$05,$06,$07,$06,$07, $00,$00                                    ; $01

	.DB $08,$09,$0A,$0B,$0C,$0D, $00,$00                                    ; $02;LEFT ENDZONE 
	.DB $0E,$0F,$10,$11,$12,$13, $00,$00                                    ; $03
	.DB $14,$15,$16,$17,$18,$19, $00,$01                                    ; $04
		
	.DB $91,$1B,$1C,$1D,$1B,$1E, $00,$00                                    ; $05; 0-19
	.DB $86,$20,$21,$22,$23,$24, $00,$00                                    ; $06;
	.DB $87,$26,$27,$28,$29,$2A, $00,$00                                    ; $07;
	.DB $88,$2C,$2D,$2E,$2C,$2F, $00,$00                                    ; $08;
	.DB $30,$31,$32,$33,$34,$35, $00,$00                                    ; $09;

	.DB $36,$37,$38,$39,$3A,$3B, $00,$00                                    ; $0A; 20-39
	.DB $5F,$20,$21,$22,$23,$24, $00,$00                                    ; $0B
	.DB $60,$3C,$27,$28,$29,$3D, $00,$00                                    ; $0C
	.DB $2B,$2C,$2D,$3E,$2C,$2F, $00,$00                                    ; $0D
	.DB $3F,$40,$41,$42,$43,$44, $00,$00                                    ; $0E

	.DB $1A,$45,$46,$47,$1B,$48, $00,$00                                    ; $0F; 40-59
	.DB $1F,$20,$49,$4A,$23,$24, $00,$03                                    ; $10
	.DB $4B,$4C,$4D,$4E,$4F,$50, $00,$00                                    ; $11
	.DB $89,$51,$52,$53,$2C,$54, $00,$00                                    ; $12
	.DB $8A,$55,$41,$56,$43,$57, $00,$00                                    ; $13

	.DB $8B,$58,$46,$59,$1B,$5A, $00,$00                                    ; $14; 60-79
	.DB $8C,$23,$21,$5B,$23,$5C, $00,$00                                    ; $15
	.DB $61,$3C,$27,$28,$29,$3D, $00,$00                                    ; $16
	.DB $65,$51,$2D,$2E,$2C,$54, $00,$00                                    ; $17
	.DB $5D,$5E,$32,$33,$34,$62, $00,$00                                    ; $18

	.DB $63,$64,$38,$39,$3A,$68, $00,$00                                    ; $19; 80-99
	.DB $8D,$23,$21,$22,$23,$5C, $00,$00                                    ; $1A
	.DB $8E,$26,$27,$28,$29,$2A, $00,$00                                    ; $1B
	.DB $8F,$51,$2D,$2E,$2C,$54, $00,$00                                    ; $1C
	.DB $90,$43,$66,$69,$43,$6A, $00,$00                                    ; $1D

	.DB $6B,$6C,$6D,$6E,$6F,$70, $00,$02                                    ; $1E; RIGHT ENDZONE 
	.DB $71,$72,$73,$74,$75,$76, $00,$00                                    ; $1F
	.DB $77,$78,$79,$7A,$7B,$7C, $00,$00                                    ; $20

	.DB $7D,$7E,$7F,$80,$7F,$80, $00,$04                                    ; $21; RIGHT ENDZONE CROWD
	.DB $82,$83,$84,$85,$84,$85, $00,$04                                    ; $22


																			; 01 = blank tile
GAME_FIELD_4x4_ATTR_TILE_TBL:                                               ; GAME_FIELD_4x4 METATILES    
	.DB $A8, $04,$05,$08,$09,$06,$07,$0A,$0B,$01,$01,$01,$01,$52,$4C,$4C,$4C; $00
	.DB $C0, $50,$40,$41,$44,$50,$53,$56,$57,$50,$59,$5C,$5D,$50,$5B,$5E,$5F; $01
	.DB $8C, $50,$51,$54,$55,$50,$53,$56,$57,$50,$59,$5C,$5D,$50,$5B,$5E,$5F; $02
	.DB $33, $50,$51,$54,$55,$50,$53,$56,$57,$50,$59,$5C,$5D,$50,$5B,$5E,$5F; $03
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$4C,$4C,$58,$01; $04
	.DB $88, $45,$45,$5A,$01,$46,$47,$42,$43,$54,$55,$4D,$01,$56,$57,$4D,$01; $05
	.DB $8A, $5C,$5D,$4D,$01,$5E,$5F,$4D,$01,$54,$55,$4D,$01,$56,$57,$4D,$01; $06
	.DB $8B, $5C,$5D,$4D,$01,$5E,$5F,$4D,$01,$54,$55,$4D,$01,$56,$57,$4D,$01; $07    
	.DB $A8, $04,$05,$08,$09,$06,$07,$0A,$0B,$01,$01,$01,$01,$01,$BC,$B8,$B2; $08
	.DB $AA, $01,$BD,$B7,$60,$01,$BD,$B7,$62,$01,$BE,$B7,$68,$01,$BD,$B7,$6A; $09
	.DB $AA, $01,$BD,$B7,$02,$49,$BD,$B7,$02,$1E,$BD,$B7,$02,$F8,$4A,$4B,$02; $0A
	.DB $AA, $FA,$28,$29,$02,$48,$2A,$29,$02,$01,$1F,$2B,$02,$01,$01,$B7,$02; $0B
	.DB $AA, $01,$01,$B7,$02,$01,$01,$B7,$02,$01,$01,$B7,$60,$01,$01,$B7,$62; $0C
	.DB $AA, $01,$01,$B7,$68,$01,$01,$B7,$6A,$01,$01,$BA,$B3,$01,$01,$01,$01; $0D
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$B2,$B2,$B2,$B2; $0E
	.DB $AA, $61,$64,$65,$65,$02,$02,$02,$69,$02,$02,$02,$78,$6B,$6E,$6F,$7A; $0F
	.DB $AA, $38,$25,$25,$25,$3A,$27,$27,$27,$20,$21,$24,$25,$22,$23,$26,$27; $10
	.DB $AA, $38,$2E,$02,$02,$3A,$27,$27,$27,$3C,$02,$30,$02,$3E,$27,$32,$27; $11
	.DB $AA, $31,$34,$34,$34,$33,$36,$36,$36,$61,$64,$65,$70,$02,$02,$02,$72; $12
	.DB $AA, $02,$02,$02,$69,$6B,$6E,$6F,$6F,$B3,$B3,$B3,$B3,$01,$01,$01,$01; $13
	.DB $A3, $04,$05,$84,$85,$06,$07,$86,$87,$01,$01,$8C,$8D,$B2,$B2,$B2,$B9; $14
	.DB $AA, $4E,$67,$02,$B6,$63,$6C,$71,$B6,$79,$7C,$7D,$B6,$02,$7E,$7F,$B6; $15
	.DB $AA, $25,$39,$02,$B6,$27,$3B,$02,$B6,$25,$2D,$02,$B6,$27,$2C,$02,$B6; $16
	.DB $AA, $2F,$39,$02,$B6,$27,$3B,$02,$B6,$02,$3D,$02,$B6,$27,$3F,$02,$B6; $17
	.DB $AA, $34,$35,$02,$B6,$36,$37,$02,$B6,$02,$74,$75,$B6,$73,$76,$77,$B6; $18
	.DB $AA, $63,$66,$7B,$B6,$4F,$6D,$02,$B6,$B3,$B3,$B3,$BB,$01,$01,$01,$01; $19
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$85,$85,$85,$85; $1A
	.DB $AA, $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01; $1B
	.DB $AA, $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$95,$95,$95,$95; $1C
	.DB $AA, $01,$95,$01,$01,$01,$94,$01,$01,$94,$94,$94,$94,$01,$01,$01,$01; $1D
	.DB $AA, $01,$01,$01,$01,$01,$01,$01,$01,$87,$87,$87,$87,$01,$01,$01,$01; $1E
	.DB $A8, $04,$05,$08,$09,$06,$07,$0A,$0B,$01,$01,$01,$01,$84,$85,$85,$85; $1F
	.DB $AA, $98,$01,$01,$01,$98,$01,$01,$9D,$98,$01,$01,$01,$98,$01,$01,$01; $20
	.DB $AA, $98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$8C,$8D,$95,$95; $21
	.DB $AA, $98,$01,$01,$01,$98,$01,$01,$01,$8E,$8F,$94,$94,$98,$01,$01,$01; $22
	.DB $AA, $98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01; $23
	.DB $AA, $98,$01,$01,$9D,$98,$01,$01,$01,$86,$87,$87,$87,$01,$01,$01,$01; $24
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$85,$84,$85,$85; $25
	.DB $AA, $01,$98,$01,$01,$B0,$B1,$97,$01,$01,$98,$01,$01,$01,$98,$01,$01; $26
	.DB $AA, $01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$95,$8C,$8D,$95; $27
	.DB $AA, $01,$98,$01,$01,$01,$98,$01,$01,$94,$8E,$8F,$94,$01,$98,$01,$01; $28
	.DB $AA, $01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$01; $29
	.DB $AA, $01,$96,$B4,$B5,$01,$98,$01,$01,$87,$86,$87,$87,$01,$01,$01,$01; $2A
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$85,$85,$84,$85; $2B
	.DB $AA, $01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01; $2C
	.DB $AA, $01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$95,$95,$8C,$8D; $2D
	.DB $AA, $01,$01,$98,$01,$01,$01,$98,$01,$94,$94,$8E,$8F,$01,$01,$98,$01; $2E
	.DB $AA, $01,$01,$98,$01,$01,$01,$98,$01,$87,$87,$86,$87,$01,$01,$01,$01; $2F
	.DB $A3, $0C,$0D,$84,$85,$0E,$0F,$86,$87,$01,$01,$8C,$8D,$85,$85,$85,$90; $30
	.DB $AA, $01,$01,$01,$9A,$01,$9D,$B0,$9E,$01,$01,$01,$9A,$01,$01,$01,$9A; $31
	.DB $AA, $01,$01,$01,$9A,$01,$01,$01,$9A,$01,$01,$01,$9A,$95,$95,$95,$88; $32
	.DB $AA, $01,$01,$01,$9A,$01,$01,$01,$9A,$94,$94,$94,$8A,$01,$01,$01,$9A; $33
	.DB $AA, $01,$01,$01,$9A,$01,$01,$01,$9A,$01,$01,$01,$9A,$01,$01,$01,$9A; $34
	.DB $AA, $01,$9D,$AA,$AB,$01,$01,$01,$9A,$87,$87,$87,$92,$01,$01,$01,$01; $35
	.DB $A0, $04,$05,$84,$85,$06,$07,$86,$87,$01,$01,$8C,$8D,$91,$85,$85,$85; $36
	.DB $AA, $9B,$01,$01,$01,$AE,$AF,$01,$01,$9B,$01,$01,$01,$9B,$01,$01,$01; $37
	.DB $AA, $9B,$01,$01,$01,$9B,$01,$01,$01,$9B,$01,$01,$01,$89,$95,$95,$95; $38
	.DB $AA, $9B,$01,$01,$01,$9B,$01,$01,$01,$8B,$94,$94,$94,$9B,$01,$01,$01; $39
	.DB $AA, $9B,$01,$01,$01,$9B,$01,$01,$01,$9B,$01,$01,$01,$9B,$01,$01,$01; $3A
	.DB $AA, $9F,$B5,$01,$01,$9B,$01,$01,$01,$93,$87,$87,$87,$01,$01,$01,$01; $3B
	.DB $AA, $01,$98,$01,$01,$B0,$B1,$AC,$AD,$01,$98,$01,$01,$01,$98,$01,$01; $3C
	.DB $AA, $A8,$A9,$B4,$B5,$01,$98,$01,$01,$87,$86,$87,$87,$01,$01,$01,$01; $3D
	.DB $AA, $01,$E8,$E9,$EC,$01,$EA,$EB,$EE,$94,$94,$8E,$8F,$01,$01,$98,$01; $3E
	.DB $A8, $04,$05,$08,$09,$06,$07,$0A,$0B,$01,$01,$01,$01,$85,$85,$85,$84; $3F
	.DB $AA, $01,$01,$01,$98,$01,$9D,$B0,$B1,$01,$01,$01,$98,$01,$01,$01,$98; $40
	.DB $AA, $01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$95,$95,$95,$8C; $41
	.DB $AA, $ED,$01,$01,$98,$EF,$01,$01,$98,$94,$94,$94,$8E,$01,$01,$01,$98; $42
	.DB $AA, $01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98; $43
	.DB $AA, $01,$9D,$A2,$A3,$01,$01,$01,$98,$87,$87,$87,$86,$01,$01,$01,$01; $44
	.DB $AA, $01,$01,$01,$01,$A6,$A7,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01; $45
	.DB $AA, $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$8D,$95,$95,$95; $46
	.DB $AA, $01,$01,$01,$01,$01,$01,$01,$01,$8F,$94,$94,$94,$01,$01,$01,$01; $47
	.DB $AA, $B4,$B5,$01,$01,$01,$01,$01,$01,$87,$87,$87,$87,$01,$01,$01,$01; $48
	.DB $AA, $98,$01,$01,$01,$98,$01,$01,$C2,$98,$01,$01,$C8,$8C,$8D,$95,$CA; $49
	.DB $AA, $98,$01,$01,$F0,$98,$01,$01,$F0,$8E,$8F,$94,$F0,$98,$01,$01,$D3; $4A
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$85,$90,$91,$85; $4B
	.DB $AA, $01,$9A,$9B,$01,$B0,$9E,$A4,$A5,$01,$9A,$9B,$01,$01,$9A,$9B,$01; $4C
	.DB $AA, $01,$C4,$C5,$01,$C3,$C6,$C7,$C0,$C9,$CC,$CD,$D8,$CB,$CE,$CF,$CB; $4D
	.DB $55, $E0,$E1,$E4,$E5,$E2,$E3,$E6,$E7,$D1,$E3,$D4,$D5,$D6,$D7,$D9,$DC; $4E
	.DB $AA, $DB,$DE,$DF,$F1,$01,$9A,$9B,$01,$01,$9A,$9B,$01,$01,$9A,$9B,$01; $4F
	.DB $AA, $A0,$A1,$9F,$B5,$01,$9A,$9B,$01,$87,$92,$93,$87,$01,$01,$01,$01; $50
	.DB $AA, $01,$01,$98,$01,$9C,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$01; $51
	.DB $AA, $01,$01,$98,$01,$C1,$01,$98,$01,$D0,$01,$98,$01,$D2,$95,$8C,$8D; $52
	.DB $AA, $DA,$01,$98,$01,$DA,$01,$98,$01,$F2,$94,$8E,$8F,$DD,$01,$98,$01; $53
	.DB $AA, $9C,$01,$98,$01,$01,$01,$98,$01,$87,$87,$86,$87,$01,$01,$01,$01; $54
	.DB $AA, $01,$01,$01,$98,$01,$01,$B0,$B1,$01,$01,$01,$98,$01,$01,$01,$98; $55
	.DB $AA, $01,$01,$01,$98,$01,$01,$01,$98,$94,$94,$94,$8E,$01,$01,$01,$98; $56
	.DB $AA, $01,$01,$A2,$A3,$01,$01,$01,$98,$87,$87,$87,$86,$01,$01,$01,$01; $57
	.DB $AA, $01,$01,$01,$01,$A6,$A7,$9C,$01,$01,$01,$01,$01,$01,$01,$01,$01; $58
	.DB $AA, $01,$01,$01,$E8,$01,$01,$01,$EA,$8F,$94,$94,$94,$01,$01,$01,$01; $59
	.DB $AA, $B4,$B5,$9C,$01,$01,$01,$01,$01,$87,$87,$87,$87,$01,$01,$01,$01; $5A
	.DB $AA, $E9,$EC,$ED,$01,$EB,$EE,$EF,$01,$8E,$8F,$94,$94,$98,$01,$01,$01; $5B
	.DB $AA, $98,$01,$01,$01,$98,$01,$01,$01,$86,$87,$87,$87,$01,$01,$01,$01; $5C
	.DB $A3, $80,$81,$0C,$0D,$82,$83,$0E,$0F,$88,$89,$01,$01,$85,$85,$85,$90; $5D
	.DB $AA, $01,$01,$01,$9A,$01,$01,$B0,$9E,$01,$01,$01,$9A,$01,$01,$01,$9A; $5E
	.DB $A3, $0C,$0D,$84,$85,$0E,$0F,$86,$87,$01,$01,$8C,$8D,$84,$85,$85,$85; $5F
	.DB $A0, $04,$05,$84,$85,$06,$07,$86,$87,$01,$01,$8C,$8D,$85,$84,$85,$85; $60
	.DB $A3, $80,$81,$04,$05,$82,$83,$06,$07,$88,$89,$01,$01,$85,$84,$85,$85; $61
	.DB $AA, $01,$01,$AA,$AB,$01,$01,$01,$9A,$87,$87,$87,$92,$01,$01,$01,$01; $62
	.DB $A3, $80,$81,$10,$11,$82,$83,$12,$13,$88,$89,$01,$01,$91,$85,$85,$85; $63
	.DB $AA, $9B,$01,$01,$01,$AE,$AF,$9C,$01,$9B,$01,$01,$01,$9B,$01,$01,$01; $64
	.DB $A3, $80,$81,$08,$09,$82,$83,$0A,$0B,$88,$89,$01,$01,$85,$85,$84,$85; $65
	.DB $AA, $01,$01,$01,$98,$01,$01,$01,$98,$01,$01,$01,$98,$95,$95,$95,$98; $66
	.DB $55, $9B,$01,$01,$01,$9B,$01,$01,$01,$9B,$01,$01,$01,$9B,$01,$01,$01; $67
	.DB $AA, $9F,$B5,$9C,$01,$9B,$01,$01,$01,$93,$87,$87,$87,$01,$01,$01,$01; $68
	.DB $AA, $01,$95,$01,$98,$01,$94,$01,$98,$94,$94,$94,$98,$01,$01,$01,$98; $69
	.DB $AA, $01,$01,$01,$98,$01,$01,$01,$98,$87,$87,$87,$86,$01,$01,$01,$01; $6A
	.DB $5F, $80,$81,$08,$09,$82,$83,$0A,$0B,$88,$89,$01,$01,$B2,$B2,$B2,$B2; $6B
	.DB $55, $02,$02,$72,$5B,$02,$64,$79,$76,$02,$68,$69,$6C,$02,$6A,$6B,$02; $6C
	.DB $55, $02,$02,$20,$21,$02,$02,$22,$23,$02,$02,$28,$30,$02,$02,$2A,$02; $6D
	.DB $55, $02,$02,$2C,$30,$02,$02,$2E,$3A,$02,$02,$38,$30,$02,$02,$39,$32; $6E
	.DB $55, $02,$02,$2C,$30,$02,$02,$2E,$32,$02,$60,$61,$02,$02,$62,$63,$66; $6F
	.DB $55, $02,$6E,$73,$76,$02,$02,$78,$5A,$B3,$B3,$B3,$B3,$01,$01,$01,$01; $70
	.DB $53, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$B2,$B2,$B2,$B2; $71
	.DB $55, $70,$70,$71,$74,$7C,$02,$02,$02,$6D,$02,$02,$02,$6F,$7A,$7B,$7E; $72
	.DB $55, $21,$21,$21,$24,$23,$23,$23,$26,$30,$25,$30,$29,$02,$27,$02,$2B; $73
	.DB $55, $30,$30,$30,$2D,$02,$02,$3B,$2F,$30,$31,$34,$35,$32,$33,$36,$37; $74
	.DB $55, $30,$30,$30,$2D,$32,$32,$32,$2F,$65,$70,$71,$74,$67,$02,$02,$02; $75
	.DB $55, $7C,$02,$02,$02,$7A,$7A,$7B,$7E,$B3,$B3,$B3,$B3,$01,$01,$01,$01; $76
	.DB $58, $04,$05,$08,$09,$06,$07,$0A,$0B,$01,$01,$01,$01,$B2,$B9,$BC,$01; $77
	.DB $55, $75,$B6,$BD,$01,$77,$B6,$BD,$01,$7D,$B6,$BE,$01,$7F,$B6,$BD,$01; $78
	.DB $95, $02,$B6,$BD,$01,$02,$B6,$BD,$5C,$02,$B6,$BD,$1E,$02,$5E,$5F,$F8; $79
	.DB $59, $02,$3C,$3D,$FA,$02,$3C,$3F,$5D,$02,$3E,$1F,$01,$02,$B6,$01,$01; $7A
	.DB $55, $02,$B6,$01,$01,$02,$B6,$01,$01,$75,$B6,$01,$01,$77,$B6,$01,$01; $7B
	.DB $55, $7D,$B6,$01,$01,$7F,$B6,$01,$01,$B3,$BB,$01,$01,$01,$01,$01,$01; $7C
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$01,$4D,$59,$59; $7D
	.DB $D1, $01,$4F,$50,$50,$56,$57,$52,$53,$01,$58,$40,$41,$01,$58,$42,$43; $7E
	.DB $D1, $01,$58,$48,$49,$01,$58,$4A,$4B,$01,$58,$40,$41,$01,$58,$42,$43; $7F
	.DB $15, $01,$58,$48,$49,$01,$58,$4A,$4B,$01,$58,$40,$41,$01,$58,$42,$43; $80
	.DB $00, $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00; $81
	.DB $A8, $04,$05,$08,$09,$06,$07,$0A,$0B,$01,$01,$01,$01,$59,$59,$59,$47; $82
	.DB $90, $51,$54,$55,$45,$42,$43,$46,$45,$48,$49,$4C,$45,$4A,$4B,$4E,$45; $83
	.DB $C3, $40,$41,$44,$45,$42,$43,$46,$45,$48,$49,$4C,$45,$4A,$4B,$4E,$45; $84
	.DB $38, $40,$41,$44,$45,$42,$43,$46,$45,$48,$49,$4C,$45,$4A,$4B,$4E,$45; $85
	.DB $A0, $04,$05,$84,$85,$06,$07,$86,$87,$01,$01,$8C,$8D,$84,$85,$85,$85; $86
	.DB $A3, $0C,$0D,$84,$85,$0E,$0F,$86,$87,$01,$01,$8C,$8D,$85,$84,$85,$85; $87
	.DB $A0, $04,$05,$84,$85,$06,$07,$86,$87,$01,$01,$8C,$8D,$85,$85,$84,$85; $88
	.DB $A8, $04,$05,$08,$09,$06,$07,$0A,$0B,$01,$01,$01,$01,$85,$85,$84,$85; $89
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$85,$85,$85,$84; $8A
	.DB $A0, $04,$05,$08,$09,$06,$07,$0A,$0B,$01,$01,$01,$01,$85,$85,$85,$85; $8B
	.DB $A3, $0C,$0D,$10,$11,$0E,$0F,$12,$13,$01,$01,$01,$01,$84,$85,$85,$85; $8C
	.DB $A3, $80,$81,$04,$05,$82,$83,$06,$07,$88,$89,$01,$01,$84,$85,$85,$85; $8D
	.DB $A3, $80,$81,$08,$09,$82,$83,$0A,$0B,$88,$89,$01,$01,$85,$84,$85,$85; $8E
	.DB $A3, $80,$81,$0C,$0D,$82,$83,$0E,$0F,$88,$89,$01,$01,$85,$85,$84,$85; $8F
	.DB $A3, $80,$81,$10,$11,$82,$83,$12,$13,$88,$89,$01,$01,$85,$85,$85,$84; $90
	.DB $A0, $0C,$0D,$84,$85,$0E,$0F,$86,$87,$01,$01,$8C,$8D,$85,$85,$85,$85; $91

.PAD $9000, $FF 

_F}_GAME_FIELD_DATA_METATILE_TABLES 

BANK_JUMP_FLICKER_SPRITES_TASK: 
	JMP FLICKER_PLAYER_SPRITES_TASK_START                            ; CYCLE SPRITE PRIORITY (FLICKER SPRITES)

BANK_JUMP_BANNER_TASK_START: 
	JMP BANNER_TASK_START                                            ; BANNER TASK() 

BANK_JUMP_START_COLL_CHECK_TASK: 
	JMP COLL_CHECK_TASK_START                                         ; DO COLLISON CHECK()

BANK_JUMP_START_BALL_ANIMATION: 
	JMP START_BALL_ANIMATION                                         ; DO BALL ANIMATION (KICKOFF/PASS)

BANK_JUMP_START_BALL_BLOCKED_TIPPED_ANIMATION: 
	JMP START_BALL_BLOCKED_TIPPED_ANIMATION                          	; DO BALL BLOCKED/TIPPED 

BANK_JUMP_START_BALL_FUMBLE_ANIMATION
	JMP START_BALL_FUMBLE_ANIMATION                                  	; DO BALL FUMBLE
	
BANK_JUMP_UNUSED_BALL_GOING_UP: 
	JMP UNUSED_BALL_ANIMATION_START                                                    	; START BALL GOING UP ANIMATION(3F= TIME) *** UNUSED
							

_F{_FLICKER_PLAYER_SPRITES     												; DONE
																			; OF ONLY 8 SPRITES PER SCANLINE 
											
REG_PLAYER_SPRITES_INDEX 		= $30  									   ; 
LAST_SPRITE_INDEX				= $D8
OFFSET_TO_NEXT_8_BY_16_SPRITE   = $08  
SIZE_OF_8_BY_16_SPR_INFO		= $08 
PLAYER_RAM_SPR_INDEX_OFFSET		= $0C

first_spr_ram_addr				= LOCAL_1
second_spr_ram_addr				= LOCAL_3
									
first_spr_ram_addr_index		= LOCAL_2
second_spr_ram_addr_index		= LOCAL_4
	
bytes_to_swap					= LOCAL_3 
player_ram_addr					= LOCAL_3 

cur_spr_index					= LOCAL_4

number_of_players_to_check_vs	= LOCAL_5
number_of_players_to_check		= LOCAL_6

CUR_PLAYER_SPRITE_INFO[]		= CUR_PLAYER_SPR_Y_LEFT
NEXT_PLAYER_SPRITE_INFO[]		= NEXT_PLAYER_SPR_Y_LEFT

							
FLICKER_PLAYER_SPRITES_TASK_START:                                          ; CYCLE SPRITE PRIORITY (FLICKER SPRITES)
	LDX #FLICKER_SPRITES_STACK_INDEX                                        ; SET STACK = DRAW SPRITE MEMORY
	TXS                                                                     ;
	LDX #REG_PLAYER_SPRITES_INDEX                                         ; SET CURRENT SPRITE INDEX  = 13TH SPRITE = PLAYERS
	LDY #$00                                                                ; 
@update_sprite_attributes:                                                  ; UPDATE SPRITE ATTRIBUTES LOOP
	TYA                                                                     ;
	SHIFT_LEFT_2															; shift for offset into player ram table
	AND #$1C                 							                    ;
	CPY #$6F                                                                ; *** Uneeded
	ORA CUR_PLAYER_SPR_ATTR_LEFT,X                                          ; 
	STA CUR_PLAYER_SPR_ATTR_LEFT,X                                         ;
	TYA                                                                     ;
	AND #$18                                                                ;
	ORA CUR_PLAYER_SPR_ATTR_RIGHT,X                                         ;
	STA CUR_PLAYER_SPR_ATTR_RIGHT,X                                         ;
	INY                                                                     ;
	TXA                                                                     ; CURRENT SPRITE INDEX += OFFSET TO NEXT PLAYER (2 SPRITES) 
	CLC                                                                     ;
	ADC #OFFSET_TO_NEXT_8_BY_16_SPRITE                                      ;
	TAX                                                                     ;
	CPX #(LAST_SPRITE_INDEX +  OFFSET_TO_NEXT_8_BY_16_SPRITE)               ; ALL PLAYERS SPRITE ATTRIBUTES UPDATED?
	BNE @update_sprite_attributes                                           ; NO-> UPDATE SPRITE AATRIBUTES LOOP

@reset_sprite_cycling:                                                      ; CYCLE SPRITE PRIORTY AND SET OFFSCREEN IF NEEDED 
	JSR SET_SPRITES_OFFSCREEN_IF_NEEDED                                     ;
	LDA #(TOTAL_NUM_PLAYERS_ON_FIELD -1)                                    ; SET NUMBER OF PLAYERS TO CHECK VS = 22 -1 (zero indexed) 
	STA number_of_players_to_check                                          ;

@reset_sprite_index_to_start:                                               ; 
	LDA number_of_players_to_check                                          ;
	STA number_of_players_to_check_vs                                       ; SET CURRENT PLAYER BEING CHECKED 
	LDX #REG_PLAYER_SPRITES_INDEX                                           ; SET SPRITE INDEX = $230
@swap_order_of_sprites:                                                     ; swap sprite order and info
	LDA CUR_PLAYER_SPR_Y_LEFT,X                                             ; 
	CMP NEXT_PLAYER_SPR_Y_LEFT,X                                            ;
	BCS @set_spr_index_to_next_player                                       ; YES->GO TO NEXT PLAYER SPRITE
	
	LDA CUR_PLAYER_SPR_ATTR_LEFT,X                                          ; CONVERT CURRENT SPRITE ATTRIBS TO 
	LSR                                                                     ;
	AND #$0E                                                                ;
	STA first_spr_ram_addr_index                                            ;
	LDA CUR_PLAYER_SPR_ATTR_RIGHT,X                                         ;
	ASL                                                                     ;
	AND #$30                                                                ;
	ORA first_spr_ram_addr_index                                            ;
	TAY                                                                     ; PLAYER RAM POSITION INDEX
	LDA PLAYER_RAM_ADDR_TABLES,Y                                            ; SAVE PTR TO CURRENT SPRITE PLAYER RAM FROM PLAYER RAM PTR TABLE
	STA first_spr_ram_addr	                                                ;
	LDA PLAYER_RAM_ADDR_TABLES+1,Y                                          ;
	STA first_spr_ram_addr	+ 1                                             ;
	
	LDA NEXT_PLAYER_SPR_ATTR_LEFT,X                                         ; CONVERT NEXT SPRITE ATTRIBS TO
	LSR                                                                     ;
	AND #$0E                                                                ;
	STA second_spr_ram_addr_index                                           ;
	LDA NEXT_PLAYER_SPR_ATTR_RIGHT,X                                         ;
	ASL                                                                     ;
	AND #$30                                                                ;
	ORA second_spr_ram_addr_index                                           ;
	TAY                                                                     ; PLAYER RAM POSITION INDEX
	LDA PLAYER_RAM_ADDR_TABLES,Y                                                             ; SAVE PTR TO NEXT SPRITE PLAYER RAM FROM PLAYER RAM PTR TABLE
	STA second_spr_ram_addr	                                                ;
	LDA PLAYER_RAM_ADDR_TABLES+1,Y                                                             ;
	STA second_spr_ram_addr	 + 1                                            ;
	SEC                                                                     ; SET BANK SWAP STATUS = LOCKED
	ROR BANK_FLAG                                                           ; 
	TXA                                                                     ; SWAP SPRITE INDEXES SAVED IN PLAYER RAM
	LDY #PLAYER_RAM_SPR_INDEX_OFFSET	                                    ; SAVE CURRENT PLAYER RAM SPRITE INDEX IN NEXT PLAYER SPRITE INDEX
	STA (second_spr_ram_addr),Y                                             ;
	CLC                                                                     ;
	ADC #OFFSET_TO_NEXT_8_BY_16_SPRITE                                      ; SAVE NEXT PLAYER SPRITE INDEX IN CURRENT PLAYER RAM SPRITE INDEX
	STA (first_spr_ram_addr),Y                                              ;
	LDA #SIZE_OF_8_BY_16_SPR_INFO                                           ; SET NUMBER OF BYTES TO SWAP = TWO SPRITES
	STA bytes_to_swap                                                       ;

@swap_spr_info_loop:                                                        ; SWAP SPRITE DATA LOOP

_WHILE NOT_EQUAL

	LDY CUR_PLAYER_SPRITE_INFO[],X                                          ;
	LDA NEXT_PLAYER_SPRITE_INFO[],X                                         ;
	STA CUR_PLAYER_SPRITE_INFO[],X                                          ;
	TYA                                                                     ;
	STA NEXT_PLAYER_SPRITE_INFO[],X                                         ;
	INX                                                                     ; SPRITE INFO INDEX++
	DEC bytes_to_swap                                                       ; NUMBER OF BYTES TO SWAP-- 
	
_END_WHILE

	LSR BANK_FLAG                                                           ; SET BANK SWAP STATUS = AVIALABLE
	STX cur_spr_index                                                       ; SAVE SPRITE INDEX 
	JSR SET_SPRITES_OFFSCREEN_IF_NEEDED                                     ; CHECK IF SPRITES NEED TO GO OFFSCREEN()
	LDX cur_spr_index                                                       ; RESTORE SPRITE INDEX
	JMP @check_done_all_players                                             ; JUMP->CHECK IF DONE WITH ALL PLAYERS 

@set_spr_index_to_next_player:                                              ; GO TO NEXT PLAYER SPRITE
	TXA                                                                     ; SPRITE INDEX += OFFSET TO NEXT PLAYER SPRITE
	CLC                                                                     ;
	ADC #OFFSET_TO_NEXT_8_BY_16_SPRITE                                      ;
	TAX                                                                     ;
@check_done_all_players:                                                    ; CHECK IF DONE WITH ALL PLAYERS
	DEC number_of_players_to_check_vs                                                                 ; PLAYERS TO CHECK--?
	BEQ @check_if_sprites_need_to_go_offscreen                              ; DONE? YES->CHECK IF SPRITES NEED TO GO OFFSCREEEN
	JMP @swap_order_of_sprites                                              ; NO-> 

@check_if_sprites_need_to_go_offscreen:                                     ;
	JSR SET_SPRITES_OFFSCREEN_IF_NEEDED                                     ; CHECK IF SPRITES NEED TO GO OFFSCREEN()
	DEC number_of_players_to_check                                          ; PLAYERS TO CHECK--? 
	BEQ @jump_to_reset_sprite_cycling                                       ;
	JMP @reset_sprite_index_to_start                                        ;
	
@jump_to_reset_sprite_cycling:
	JMP @reset_sprite_cycling                                               ; JUMP->CYCLE SPRITE PRIORTY AND SET OFFSCREEN IF NEEDED LOOP

_F}_FLICKER_PLAYER_SPRITES 
	
_F{_COUNT_SPRITES_PER_AREA													; DONE
	
sprite_cycling_index 		= LOCAL_7
sprite_y_offset				= LOCAL_8 

max_cycle_types_bitmask		= $03	
max_offset_bitmask			= $0F											; max offset 2 tiles = height of sprite
y_offset_increment			= $04

SPRITE_SUBSET_START_1 		= SPRITE_START + $10
SPRITE_SUBSET_END_1 		= SPRITE_START + $74
SPRITE_SUBSET_START_2 		= SPRITE_START + $78
SPRITE_SUBSET_END_2 		= SPRITE_START + $DC
SPRITE_SUBSET_START_3		= SPRITE_START + $30
	
SET_SPRITES_OFFSCREEN_IF_NEEDED:                                            ; CHECK IF SPRITES NEED TO GO OFFSCREEN()
	RETURN_1_FRAME															; 
	
	CLEAR_RAM_Y_INDEX[start_length] SPRITE_PER_AREA_COUNTER_START, $10
	
	LDA P1_INDICATOR_SPR_Y                                                  ; LOAD PLAYER 1 INDICATOR SPR Y
	JSR UPDATE_SPRITE_COUNTER                                               ; UPDATE SPRITE COUNTER (A= SPR Y VALUE)
	
	LDA P2_INDICATOR_SPR_Y                                                  ; LOAD PLAYER 2 INDICATOR SPR Y
	JSR UPDATE_SPRITE_COUNTER                                               ; UPDATE SPRITE COUNTER (A= SPR Y VALUE)
	
	LDA BALL_SPR_Y                                                          ; LOAD BALL SPR Y 
	JSR UPDATE_SPRITE_COUNTER                                               ; UPDATE SPRITE COUNTER (A= SPR Y VALUE)
	INC sprite_cycling_index                                                ; SPRITE ORDER COUNTER++
	LDA sprite_cycling_index                                                ;
	AND #max_cycle_types_bitmask                                            ; MAKES COUNTER GO FROM 0-3 
	
	BEQ CHECK_SPRITES_ORDER_1                                         		; 1ST ORDERING? YES->CHECK SPRITES INC ORDER
	
	CMP #$01                                                                ;	
	BEQ CHECK_SPRITES_ORDER_2_CHANGE_Y_OFFSET                               ; 2ND  ORDERING? YES->CHECK SPRITES DEC ORDER
	
	CMP #$02                                                                ;	
	BEQ CHECK_SPRITES_ORDER_3                                               ; 3RD ORDERING? YES->CHECK SPRITES INC ORDER (non man controlled) 
	
	JMP CHECK_SPRITES_ORDER_4_CHANGE_Y_OFFSET                               ; 4TH-> CHECK SPRITES DEC ORDER, TOP OF SPRITES THEN BOT OF SPRITES

CHECK_SPRITES_ORDER_1:                                                 		; CHECK SPRITES INC ORDER, 
	JSR COUNT_SPR_FIRST_SUBSET_FORWARD                                      ; CHECK SPRITES ($210-$274) AND SET OFF SCREEN IF TOO MANY IN QUADRANT 
	JSR COUNT_SPR_SECOND_SUBSET_FORWARD                                     ; CHECK SPRITES ($278-$2DF) AND SET OFF SCREEN IF TOO MANY IN QUADRANT
	RTS                                                                     ; RETURN

CHECK_SPRITES_ORDER_2_CHANGE_Y_OFFSET:                                      ; CHECK SPRITES DEC ORDER, 
	JSR COUNT_SPR_SECOND_SUBSET_BACKWARD                                    ; CHECK SPRITES ($2DF-$278) AND SET OFF SCREEN IF TOO MANY IN QUADRANT 
	JSR COUNT_SPR_THIRD_SUBSET_BACKWARD                              	    ; CHECK SPRITES ($274-$230) AND SET OFF SCREEN IF TOO MANY IN QUADRANT 
	JMP CHANGE_SPR_Y_OFFSET                                                 ; 

CHECK_SPRITES_ORDER_3:                                                      ; CHECK SPRITES INC ORDER, BOTTOM OF SPRITES THEN TOP OF SPRITES
	JSR COUNT_SPR_SECOND_SUBSET_FORWARD                                     ; CHECK SPRITES ($278-$2DC) AND SET OFF SCREEN IF TOO MANY IN QUADRANT
	JSR COUNT_SPR_FIRST_SUBSET_FORWARD                                      ; CHECK SPRITES ($210-$278) AND SET OFF SCREEN IF TOO MANY IN QUADRANT
	RTS                                                                     ; RETURN

CHECK_SPRITES_ORDER_4_CHANGE_Y_OFFSET:                                      ; CHECK SPRITES DEC ORDER, TOP OF SPRITES THEN BOTTOM TOF SPRITES 
	JSR COUNT_SPR_THIRD_SUBSET_BACKWARD                                     ; CHECK SPRITES ($274-$230) AND SET OFF SCREEN IF TOO MANY IN QUADRANT
	JSR COUNT_SPR_SECOND_SUBSET_BACKWARD                                    ; CHECK SPRITES ($2DC-$278) AND SET OFF SCREEN IF TOO MANY IN QUADRANT

	


	
CHANGE_SPR_Y_OFFSET:                                                        ; SET OFFSET FROM TOP OF PLAYER
	LDA sprite_y_offset                                                     ; = CURRENT OFFSET VALUE
	CLC                                                                     ;
	ADC #y_offset_increment                                                 ; + 0.5 TILE
	AND #max_offset_bitmask                                                 ; KEEP VALUE < 0X10
	STA sprite_y_offset                                                     ;
	RTS                                                                     ; RETURN

OFFSET_TO_NEXT_SPRITE	= $04	

	
COUNT_SPR_FIRST_SUBSET_FORWARD:                                             ; CHECK SPRITES ($210-$278)AND SET OFF SCREEN IF TOO MANY IN QUADRANT
	LDY #<SPRITE_SUBSET_START_1                                             ; SET SPRITE INDEX= $210
@count_sprites_area_loop:                                                   ; CHECK SPRITE LOCATION AND UPDATE SPRITE COUNT ON QUADRANT
	LDA CUR_SPRITE_Y,Y                                                      ; LOAD CURRENT SPRITE Y
	CLC                                                                     ;
	ADC sprite_y_offset                                                     ; + OFFSET VALUE
	LOG_SHIFT_RIGHT_4														;
	TAX                                                                     ; 
	INC SPRITE_PER_AREA_COUNTER_START,X                                     ; NUMBER OF SPRITES IN AREA ++
	LDA SPRITE_PER_AREA_COUNTER_START,X                                     ;
	CMP #MAX_SPRITES_PER_SCANLINE + 1                                       ; NUMBER OF SPRITES IN AREA < 9
	BCC @increment_to_next_sprite                                           ; YES->GO TO NEXT SPRITE
	LDA #SPRITE_OFFSCREEN                                                   ; SET SPRITE = OFFSCREEN
	STA CUR_SPRITE_Y,Y                                                      ;
@increment_to_next_sprite:                                                  ; GO TO NEXT SPRITE
	TYA                                                                     ; SPRITE INDEX += OFFSET TO NEXT SPRITE
	CLC                                                                     ;
	ADC #OFFSET_TO_NEXT_SPRITE                                              ;
	TAY                                                                     ;
	CPY #<(SPRITE_SUBSET_END_1 + OFFSET_TO_NEXT_SPRITE)                     ; ALL SPRITES CHECKED? 
	BCC @count_sprites_area_loop                                            ; NO->CHECK SPRITE LOCATION AND UPDATE SPRITE COUNT ON QUADRANT
	RTS                                                                     ; RETURN

COUNT_SPR_SECOND_SUBSET_FORWARD:                                            ; CHECK SPRITES ($278-$2DC) AND SET OFF SCREEN IF TOO MANY IN QUADRANT
	LDY #<SPRITE_SUBSET_START_2                                             ; SET SPRITE INDEX= $210
@count_sprites_area_loop:                                                   ; CHECK SPRITE LOCATION AND UPDATE SPRITE COUNT ON QUADRANT
	LDA CUR_SPRITE_Y,Y                                                      ; LOAD CURRENT SPRITE Y
	CLC                                                                     ;
	ADC sprite_y_offset                                                      ; + OFFSET VALUE
	LOG_SHIFT_RIGHT_4
	TAX                                                                     ; SET SPRITE COUNTER INDEX
	INC SPRITE_PER_AREA_COUNTER_START,X                                     ; NUMBER OF SPRITES IN AREA ++
	LDA SPRITE_PER_AREA_COUNTER_START,X                                     ; NUMBER OF SPRITES IN AREA < 9
	CMP ##MAX_SPRITES_PER_SCANLINE + 1                                      ;
	BCC @increment_to_next_sprite                                           ; YES->GO TO NEXT SPRITE
	LDA #SPRITE_OFFSCREEN                                                   ; SET CURRENT SPRITE Y = OFFSCREEN
	STA CUR_SPRITE_Y,Y                                                      ;
@increment_to_next_sprite:                                                  ; GO TO NEXT SPRITE
	TYA                                                                     ;
	CLC                                                                     ;
	ADC #OFFSET_TO_NEXT_SPRITE                                              ; SPRITE INDEX += OFFSET TO NEXT SPRITE
	TAY                                                                     ;
	CPY #<(SPRITE_SUBSET_END_2+ OFFSET_TO_NEXT_SPRITE)                      ; ALL  SPRITES CHECKED? 
	BCC @count_sprites_area_loop                                            ; NO->CHECK SPRITE LOCATION AND UPDATE SPRITE COUNT ON QUADRANT
	RTS                                                                     ; RETURN

COUNT_SPR_SECOND_SUBSET_BACKWARD:                                           ; CHECK SPRITES ($2DC-$278) AND SET OFF SCREEN IF TOO MANY IN QUADRANT 
	LDY #<SPRITE_SUBSET_END_2                                                             ; SET SPRITE INDEX= $2DC
@count_sprites_area_loop:                                                   ; CHECK SPRITE LOCATION AND UPDATE SPRITE COUNT IN QUADRANT
	LDA CUR_SPRITE_Y,Y                                                      ; LOAD CURRENT SPRITE Y
	CLC                                                                     ;
	ADC sprite_y_offset                                                ; + OFFSET VALUE
	LOG_SHIFT_RIGHT_4
	TAX                                                                     ; SET SPRITE COUNTER INDEX
	INC SPRITE_PER_AREA_COUNTER_START,X                                     ; NUMBER OF SPRITES IN AREA ++
	LDA SPRITE_PER_AREA_COUNTER_START,X                                     ; NUMBER OF SPRITES IN AREA < 9
	CMP #MAX_SPRITES_PER_SCANLINE + 1                                       ;
	BCC @decrement_to_next_sprite                                           ; YES->GO TO NEXT SPRITE
	LDA #SPRITE_OFFSCREEN                                                   ; SET CURRENT SPRITE Y = OFFSCREEN
	STA CUR_SPRITE_Y,Y                                                      ;
@decrement_to_next_sprite:                                                  ; GO TO NEXT SPRITE
	TYA                                                                     ; SPRITE INDEX -= OFFSET TO NEXT SPRITE
	SEC                                                                     ;
	SBC #OFFSET_TO_NEXT_SPRITE                                              ;
	TAY                                                                     ; SAVE SPRITE INDEX
	CPY #<(SPRITE_SUBSET_START_2- OFFSET_TO_NEXT_SPRITE)                                    ; ALL SPRITES CHECKED? 
	BNE @count_sprites_area_loop                                            ; NO-> CHECK SPRITE LOCATION AND UPDATE SPRITE COUNT IN QUADRANT 
	RTS                                                                     ; RETURN

COUNT_SPR_THIRD_SUBSET_BACKWARD:                                             ; CHECK SPRITES ($274-$230) AND SET OFF SCREEN IF TOO MANY IN QUADRANT 
	LDY #<SPRITE_SUBSET_END_1                                                             ; SET SPRITE INDEX =$274
@count_sprites_area_loop:                                                   ; CHECK SPRITE LOCATION AND UPDATE SPRITE COUNT IN QUADRANT 
	LDA CUR_SPRITE_Y,Y                                                      ; LOAD CURRENT SPRITE Y
	CLC                                                                     ;
	ADC sprite_y_offset                                                     ;
	LOG_SHIFT_RIGHT_4
	TAX                                                                     ; SET SPRITE COUNTER INDEX
	INC SPRITE_PER_AREA_COUNTER_START,X                                     ; NUMBER OF SPRITES IN AREA ++
	LDA SPRITE_PER_AREA_COUNTER_START,X                                     ; NUMBER OF SPRITES IN AREA < 9
	CMP #MAX_SPRITES_PER_SCANLINE + 1                                       ; 
	BCC @decrement_to_next_sprite                                           ; YES->GO TO NEXT SPRITE
	LDA #SPRITE_OFFSCREEN                                                   ; SET CURRENT SPRITE Y = OFFSCREEN
	STA CUR_SPRITE_Y,Y                                                      ;
@decrement_to_next_sprite:                                                  ; GO TO NEXT SPRITE
	TYA                                                                     ; SPRITE INDEX -= OFFSET TO NEXT SPRITE
	SEC                                                                     ;
	SBC #OFFSET_TO_NEXT_SPRITE                                                                                                              ;
	TAY                                                                     ; SAVE SPRITE INDEX
	CPY #<(SPRITE_SUBSET_START_3- OFFSET_TO_NEXT_SPRITE)                    ; ALL SPRITES CHECKED?
	BNE @count_sprites_area_loop                                            ; NO-> CHECK SPRITE LOCATION AND UPDATE SPRITE COUNT IN QUADRANT 
	RTS                                                                     ; RETURN

UPDATE_SPRITE_COUNTER:                                                      ; UPDATE SPRITE PER Y AREA XOUNTER (A= SPR Y VALUE)
	CLC                                                                     ;  SPR Y LOC
	ADC sprite_y_offset                                                ;  + SCREEN SUB QUADRANT
	LOG_SHIFT_RIGHT_4
	TAX                                                                     ; SET SPRITE COUNTER INDEX
	INC SPRITE_PER_AREA_COUNTER_START,X                                     ; SPRITE COUNTER++
	RTS                                                                     ; ETURN
	
_F}_COUNT_SPRITES_PER_AREA
	
_F{_UPDATE_SCORE_INFO_BANNER												; DONE


single_digit_bitmask    				= $0F
roster_id_bitmask            			= $1F                                          ; keeps only roster id info 
remove_possesion_bitmask				= $7F

OFFSET_TO_BANNER_ID_PTRS				= $40
start_of_special_text_messages			= $10 
end_of_special_text_messages			= $26	

p1_in_game_team_id_start_SRAM    		= P1_GM_PLAYERS
p1_in_game_roster_id_start_SRAM    		= P1_GM_PLAYERS + $01
p2_in_game_team_id_start_SRAM    		= P2_GM_PLAYERS
p2_in_game_roster_id_start_SRAM   		= P2_GM_PLAYERS + $01

data_addr								= LOCAL_1
roster_id             					= LOCAL_7  
team_id               					= LOCAL_8

text_align_value						= LOCAL_8


BANNER_TASK_START:                                                          ; BANNER TASK 
	LDX #BANNER_STACK_INDEX                                                 ; SET STACK = $8B
	TXS                                                                     ; 
	
UPDATE_BANNER_LOOP:                                                         ; UPDATE BANNER LOOP
	RETURN_1_FRAME
	JSR UPDATE_P1_P2_CONTROLLED_PLAYER_NAMES                                ; UPDATE PLAYER NAMES BANNER()
	LDA BANNER_ID                                                           ; DOES BANNER STATUS= NEW BANNER TO DRAW?
	BEQ UPDATE_BANNER_LOOP                                                  ; NO-> UPDATE BANNER LOOP
@check_for_special_banner_command:	
	AND #remove_possesion_bitmask                                           ; DOES BANNER VALUE = NON-SPECIAL TEXT UPDATE?
@if_between:	
	CMP #start_of_special_text_messages	                                    ;
	BCC @check_type_banner_command                                          ; YES->CHECK FOR TYPE OF BANNER UPDATE
	CMP #end_of_special_text_messages + 1                                   ; DOES BANNER VALUE = TEXT SCROLLING UPDATE?
	BCS @check_type_banner_command                                          ; NO-> CHECK FOR TYPE OF BANNER UPDATE

@else_do_special_text_message:	
	LDA IRQ_0_NAMETABLE                                                     ; DOES SCROLL NAMETABLE = NAMETABLE 1 = OFFSCREEN
	LSR                                                                     ;
	BCC @check_type_banner_command                                          ; NO-> CHECK FOR TYPE OF BANNER UPDATE
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	RETURN_IN_NUM_FRAMES 8
	LDA BANNER_ID                                                           ; CONVERT BANNER SCENE INDEX INTO DRAW INDEX
	AND #remove_possesion_bitmask                                           ; MASK OUT POSSESSION
	CLC                                                                     ;
	ADC #OFFSET_TO_BANNER_ID_PTRS                                           ; = BANNER SCENE INDEX + OFFSET TO BANNER EVENTS
	LDX #MESSAGE_BAR_DRAW_SCRIPT_BANK                                       ; SET BANK = 16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                    ; DO DRAWING TASK, SWAP $A000 BANKS, SET TO 8X8 TEXT (A= DRAW ID, X = BANK)
	RETURN_IN_NUM_FRAMES 20
	LDA #$00                                                                ; SET BANNER SCENE TO DRAW  = NONE 
	STA BANNER_ID                                                           ; 
	JMP UPDATE_BANNER_LOOP                                                  ; JUMP->UPDATE BANNER LOOP

@check_type_banner_command:                                                 ; CHECK FOR TYPE OF NAME, TEAM, CLOCK BANNER UPDATE
	LDA BANNER_ID                                                           ; DOES BANNER STATUS= NUMBER AND NAMES + CLOCK?
	AND #remove_possesion_bitmask                                           ;
	CMP #$0E                                                                ; 
	BCC @check_for_banner_command_or_scroll_text                            ;
	BEQ @redraw_clock_background                                            ; YES->UPDATE BANNER NAMES, NUMBER AND CLOCK

@clear_off_screen_banner_for_down_and_distance	
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()

@redraw_clock_background:                                                   ; UPDATE BANNER NAMES, NUMBER AND CLOCK
	LDA BANNER_ID                                                           ; LOAD BANNER VALUE
	AND #remove_possesion_bitmask                                           ; MASK OUT POSESSION BIT
	CLC                                                                     ;
	ADC #OFFSET_TO_BANNER_ID_PTRS                                           ; + OFFSET TO CLOCK BACKGROUND
	LDX #MESSAGE_BAR_DRAW_SCRIPT_BANK                                       ; SET BANK = BANK 16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                    ; DO DRAWING TASK SWAP $A000 BANKS AND SET TO 8X8 TEXT (A= DRAW ID, X = BANK)
	LDA BANNER_ID                                                           ; LOAD BANNER VALUE

@check_for_banner_command_or_scroll_text:                                   ; LOAD BANNER COMMAND ADDRESS START
	AND #remove_possesion_bitmask                                           ; MASK OUT POSESSION BIT
	CMP #start_of_special_text_messages                                     ; IS COMMAND LESS THAN 0X0F
	BCC @do_banner_command                                                  ; YES->LOAD BANNER COMMAND ADDRESS AND JUMP

@scroll_text_in_from_offscreen												; should be impossible to reach
	JMP SCROLL_BANNER_IN_FROM_OFFSCREEN                                     ; 

@do_banner_command:                                                         ; LOAD BANNER COMMAND ADDRESS AND JUMP
	SEC                                                                     ;
	SBC #$01                                                                ;
	PUSH_TABLE_ADDR[tableAddr] BANNER_COMMAND_PTR_TABLE

BANNER_COMMAND_PTR_TABLE:                                                   ; COMMAND ID BEFORE SUBTRACT, FUNCTION
	.WORD DRAW_LARGE_SCORE_ONSCREEN_BANNER-1                                         ; 0X01 DRAW LARGE SCORE CURRENT SCREEN
	.WORD DRAW_RECOVER_SCROLL_P1_NAME_BANNER-1                              ; 0X02 DRAW RECOVER AND SCROLL IN P1 NAME
	.WORD DRAW_RECOVER_SCROLL_P2_NAME_BANNER-1                              ; 0X03 DRAW RECOVER AND SCROLL IN P2 NAME
	.WORD DRAW_LRG_SCORE_OFFSCREEN_BAN_SCROLL_IN-1                          ; 0X04 DRAW LARGE SCORE CURRENT OFF SCREEN
	.WORD CLEARN_ON_SCREEN_BANNER-1                                         ; 0X05 CLEAR NORMALLY ON SCREEN BANNER NAMETABLE 0
	.WORD CLEARN_OFF_SCREEN_BANNER-1                                        ; 0X06 CLEAR NORMALLY OFF SCREEN BANNER NAMETABLE 1
	.WORD RESET_SCROLL_SCROLL_IN_OFFSCREEN_BANNER-1                         ; 0X07 SET SCROLL LOCATION  TO CUR SCREEN AND SCROLL IN BANNER
	.WORD SET_SCROLL_OFFSC_SCROLL_IN_ONSCREEN_BANNER-1                      ; 0X08 SET SCROLL LOCATION  TO NEXT SCREEN AND SCROLL IN BANNER
	.WORD REDRAW_CLOCK_SCORE_ONLY-1                                         ; 0X09 REDRAW CLOCK AND SCORE
	.WORD DRAW_P1_TEAM_MASCOT_ONSCREEN_BANNER-1                               ; 0X0A DRAW P1 TEAM CITY LARGE 
	.WORD DRAW_P2_TEAM_MASCOT_ONSCREEN_BANNER-1                               ; 0X0B DRAW P2 TEAM CITY LARGE
	.WORD SCROLL_IN_P1_NAME_BANNER-1                                        ; 0X0C SCROLL IN P1 PLAYER NAME BANNER 
	.WORD SCROLL_IN_P2_NAME_BANNER-1                                        ; 0X0D SCROLL IN P2 PLAYER NAME BANNER
	.WORD SCROLL_IN_CLOCK_SCORE_BANNER-1                                    ; 0X0E SCROLL IN CLOCK AND SCORE
	.WORD SCROLL_IN_DOWN_DIST_BANNER-1                                      ; 0X0F SCROLL IN DOWN AND DISTANCE WITH YARD MARKERS

DRAW_LARGE_SCORE_ONSCREEN_BANNER:                                                    ; 0X01 DRAW LARGE SCORE CURRENT SCREEN
	JSR CLEAR_ONSCREEN_BANNER                                               ; CLEAR $2040 VRAM()
	JSR SAVE_P1_P2_BANNER_LARGE_SCORE_BUFFER                                      ; SAVE P1 AND P2 SCORE IN BUFFER()
	LDY #<BANNER_LARGE_SCORE_PPU_ADDR                                       ; SET PPU LOCATION = START OF LARGE SCORE DISPLAY
	LDX #>BANNER_LARGE_SCORE_PPU_ADDR                                       ; 
	JMP DRAW_LARGE_SCORE_BANNER                                              ; JUMP-> DRAW LARGE TEXT

DRAW_RECOVER_SCROLL_P1_NAME_BANNER:                                         ; 0X02 DRAW RECOVER AND SCROLL IN P1 NAME
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	RETURN_IN_NUM_FRAMES 8
	LDA #RECOVER_MESSAGE_BAR_ID                                                                ; SET SCENE ID  = SCROLLING RECOVER
	LDX #MENU_DRAW_SCRIPT_BANK                                              ; SET BANK = 16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                    ; DO DRAWING TASK SWAP $A000 BANKS , SET TO 8X8 TEXT (A= DRAW ID, X = BANK)
	RETURN_IN_NUM_FRAMES 30
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	RETURN_IN_NUM_FRAMES 8
	LDA P1_TEAM                                                             ; LOAD PLAYER 1 TEAM
	JSR DRAW_TEAM_MASCOT_OFFSCREEN_BANNER                                     ; DRAW TEAM CITY OFFSCREEN (A= TEAM ID)
	RETURN_IN_NUM_FRAMES 30
	LDA #$00                                                                ; SET BANNER SCENE TO PLAY = NONE
	STA BANNER_ID                                                           ;
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	JSR REDRAW_CLOCK_SCORE_PLAYER_NAMES                                     ; REDRAW CLOCK AND SCORE SET P1,P2 OVERHEAD ICONS TO CHANGING()
	LDX #$08                                                                ; SET SCROLL DELAY = = 8 FRAMES
	JSR RETURN_ONCE_BANNER_DONE_CLEAR_OFFSCREEN[frames]                     ; RETURN AFTER (X FRAMES) IF NO BANNER SCENE , ELSE CLEAR 2440 AND SET IRQ()
	LDA P1_MAN_POS_ID_ICON_STATUS                                           ; CONVERT P1 ICON VALUE TO P1 SRAM PLAYER INDEX
	AND #roster_id_bitmask                                                  ;
	ASL                                                                     ;
	TAX                                                                     ; 
	LDA p1_in_game_team_id_start_SRAM,X                                     ; SET TEAM ID =  PLAYER 1 TEAM ID
	STA team_id                                                             ;
	LDA p1_in_game_roster_id_start_SRAM,X                                   ; SET PLAYER = PLAYER 1  ACTUAL PLAYER
	STA roster_id                                                           ;
	JSR DRAW_PLAYER_NAME_LARGE_CENT_OFFSCREEN                               ;
	LDX #$1E                                                                ; SET SCROLL DELAY = 0.5 SECONDS = 30 FRAMES
	JSR RETURN_ONCE_BANNER_DONE_CLEAR_OFFSCREEN[frames]                     ; RETURN AFTER (X FRAMES) IF NO BANNER SCENE TO PLAY ELSE CLEAR 2440 AND SET IRQ()
	LDA #$FF                                                                ; SET SCROLL DIRECTION = LEFT 
	JMP SCROLL_BANNER_IN[direction]                                         ; JUMP->SCROLL BANNER IN FROM OFFSCREEN (A= BANNER ID)

	
DRAW_RECOVER_SCROLL_P2_NAME_BANNER:                                         ; 0X03 DRAW RECOVER AND SCROLL IN P2 NAME
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	RETURN_IN_NUM_FRAMES 8
	LDA #RECOVER_MESSAGE_BAR_ID                                             ; SET SCENE ID  = SCROLLING RECOVER      
	LDX #MENU_DRAW_SCRIPT_BANK                                             ; SET BANK = 16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                    ; DO DRAWING TASK SWAP $A000 BANKS,SET TO 8X8 TEXT (A= DRAW ID, X = BANK)
	RETURN_IN_NUM_FRAMES 30
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	RETURN_IN_NUM_FRAMES 8
	LDA P2_TEAM                                                             ; LOAD PLAYER 2 TEAM
	JSR DRAW_TEAM_MASCOT_OFFSCREEN_BANNER                                     ; DRAW TEAM CITY OFFSCREEN (A= TEAM ID)
	RETURN_IN_NUM_FRAMES 30
	LDA #$00                                                                ; SET BANNER SCENE = NONE
	STA BANNER_ID                                                           ; 
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	JSR REDRAW_CLOCK_SCORE_PLAYER_NAMES                                     ; REDRAW CLOCK AND SCORE SET P1,P2 OVERHEAD ICONS TO CHANGING()
	LDX #$08                                                                ; SET SCROLL DELAY  = 8 FRAMES
	JSR RETURN_ONCE_BANNER_DONE_CLEAR_OFFSCREEN[frames]                     ; RETURN AFTER (X FRAMES) IF NO NEW BANNER, ELSE CLEAR 2440 AND SET IRQ()
	LDA P2_MAN_POS_ID_ICON_STATUS                                                   ; CONVERT P2 ICON VALUE TO P1 SRAM PLAYER INDEX
	AND #roster_id_bitmask                                                  ;
	ASL                                                                     ;
	TAX                                                                     ;
	LDA p2_in_game_team_id_start_SRAM,X                                     ; SET TEAM ID =  PLAYER 2 TEAM ID
	STA team_id                                                             ; 
	LDA p2_in_game_roster_id_start_SRAM,X                                   ; SET PLAYER = PLAYER 2 ACTUAL PLAYER
	STA roster_id                                                           ; 
	JSR DRAW_PLAYER_NAME_LARGE_CENT_OFFSCREEN                               ; DRAW LARGE TEXT($45= TEAM ID, $44= ACTUAL PLAYER)
	LDX #$1E                                                                ; SET SCROLL DELAY = 0.5 SECONDS = 30 FRAMES
	JSR RETURN_ONCE_BANNER_DONE_CLEAR_OFFSCREEN[frames]                     ; RETURN AFTER (X FRAMES) IF NO NEW BANNER, ELSE CLEAR 2440 AND SET IRQ() 
	LDA #$00                                                                ; SET SCROLL DIRECTION = righht 
	JMP SCROLL_BANNER_IN[direction]                                         ; JUMP->SCROLL BANNER IN FROM OFFSCREEN (A= BANNER ID)

DRAW_PLAYER_NAME_LARGE_CENT_OFFSCREEN:                                      ; DRAW PLAYER NAME LARGE OFFSCREEN
	LDA PPU_TRANSFER_STATUS                                                 ; SET TEXT SIZE =  LARGE
	ORA #$40                                                                ;
	STA PPU_TRANSFER_STATUS                                                 ;
	LDY #<OFFSCREEN_BANNER_PPU_ADDR                                         ; SET PPU ADDR = $2440
	LDX #>OFFSCREEN_BANNER_PPU_ADDR                                         ;
	JMP DRAW_PLAYER_NAME_CENTERED                                           ; JUMP-> DRAW LARGE PLAYER TEXT CENTERED

RETURN_ONCE_BANNER_DONE_CLEAR_OFFSCREEN[frames]:                            ; RETURN AFTER (X FRAMES) IF NO NEW BANNER, ELSE CLEAR 2440 AND SET ) 
	RETURN_1_FRAME
	LDA BANNER_ID                                                           ; DOES BANNER SCENE = SOMETHING TO PLAY
	BNE @clear_off_banner_set_nametable_to_onscreen                         ; YES->CLEAR 2440 PPU, SET IRQ NAMETABLE TO ONSCREEN, RETURN UPDATE BANNER 
	DEX                                                                     ; FRAMES TO WAIT--
	BNE RETURN_ONCE_BANNER_DONE_CLEAR_OFFSCREEN[frames]                     ; RETURN AFTER (X FRAMES) ONCE BANNER DONE, CLEAR 2440 AND SET IRQ()
	RTS                                                                     ; RETURN

@clear_off_banner_set_nametable_to_onscreen:                                ; CLEAR 2440 PPU, SET IRQ NAMETABLE TO ONSCREEN, RETURN UPDATE BANNER
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 PPU()
	LDA #$00                                                                ; SET IRQ SCROLL NAMETABLE = NAMETABLE 0 = ONSCREEN 
	STA IRQ_0_NAMETABLE                                                               ;
	PLA                                                                     ;
	PLA                                                                     ;
	JMP UPDATE_BANNER_LOOP                                                  ; JUMP-> UPDATE BANNER LOOP

REDRAW_CLOCK_SCORE_PLAYER_NAMES:                                            ; REDRAW CLOCK AND SCORE SET P1,P2 OVERHEAD ICONS TO CHANGING
	JSR CLEAR_ONSCREEN_BANNER                                               ; CLEAR $2040 VRAM()
	LDA #CLOCK_BACKGROUND_SCREEN_ID                                         ; SET BACKGROUND ID = CLOCK BACKGROUND
	LDX #MENU_DRAW_SCRIPT_BANK                                              ; SET BANK = 16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                    ; DO DRAWING TASK SWAP $A000 BANKS AND SET TO 8X8 TEXT (A= DRAW EVENT, X = BANK)
	JSR SAVE_CLOCK_TIME_TO_BUFFER                                           ; SAVE CLOCK DATA TO DRAW TO BUFFER
	JSR DRAW_BANNER_SCORE                                                   ; REDRAW BANNER SCORE PPU
	LDA P1_MAN_POS_ID_ICON_STATUS                                           ; SET P1 ICON STATUS = ICON VALUE CHANGING
	ORA #$40                                                                ;
	STA P1_MAN_POS_ID_ICON_STATUS                                           ;
	LDA P2_MAN_POS_ID_ICON_STATUS                                           ; SET P2 ICON STATUS = ICON VALUE CHANGING
	ORA #$40                                                                ;
	STA P2_MAN_POS_ID_ICON_STATUS                                           ;
	RTS                                                                     ; RETURN

DRAW_LRG_SCORE_OFFSCREEN_BAN_SCROLL_IN:                                     ; 0X04 DRAW LARGE SCORE OFFSCREEN
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	JSR SAVE_P1_P2_BANNER_LARGE_SCORE_BUFFER                                      ; SAVE P1 AND P2 SCORE IN BUFFER()
	LDY #<OFFSCREEN_BANNER_LRG_SCORE_PPU_ADDR                               ; SET PPU ADDR = 244B = LARGE SCORE ADDR
	LDX #>OFFSCREEN_BANNER_LRG_SCORE_PPU_ADDR                               ;
	
DRAW_LARGE_SCORE_BANNER:                                                    ; DRAW LARGE TEXT

LENGTH_OF_SCORE_TEXT		= $05

	LDA #<SCORE_BUFFER                                                      ; SET DATA ADDR = TEXT BUFFER DATA ADDR = $037F
	STA data_addr                                                           ; 
	LDA #>SCORE_BUFFER                                                      ;
	STA data_addr +1                                                          ;
	LDA #LENGTH_OF_SCORE_TEXT                                               ; SET DATA LENGTH = 5 TILES
	JSR DRAW_LARGE_TEXT                                                     ; BUFFER_LARGE_TEXT(X,Y= PPU ADDR, 3E,3F= DATA ADDR, A= LENGTH)
	JSR SET_NAME_BUFFER_READY                                               ; SET BUFFER STATUS($37E) TO READY()
	JMP SCROLL_BANNER_IN_FROM_OFFSCREEN                                     ; JUMP->SCROLL BANNER IN FROM OFFSCREEN

CLEARN_ON_SCREEN_BANNER:                                                    ; 0X05 CLEAR NORMALLY ON SCREEN BANNER
	JSR CLEAR_ONSCREEN_BANNER                                               ; CLEAR $2040 VRAM()
	JMP CLEAR_BANNER_ID_RETURN_TO_UPDATE                                    ; JUMP->SET BANNER SCENE TO NONE AND REUTRN TO UPDATE BANNER LOOP

CLEARN_OFF_SCREEN_BANNER:                                                   ; 0X06 CLEAR NORMALLY OFF-SCREEN BANNER
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	JMP CLEAR_BANNER_ID_RETURN_TO_UPDATE                                    ; JUMP->SET BANNER SCENE TO NONE AND REUTRN TO UPDATE BANNER LOOP

RESET_SCROLL_SCROLL_IN_OFFSCREEN_BANNER:                                    ; 0X07 SET SCROLL LOCATION  TO CUR SCREEN AND SCROLL IN BANNER
	LDA #$00                                                                ; SET SCROLL LOCATION = CUR SCREEN
	STA IRQ_0_XSCROLL                                                       ;
	STA IRQ_0_NAMETABLE                                                     ;
	JMP SCROLL_BANNER_IN_FROM_OFFSCREEN                                     ; JUMP->SCROLL BANNER IN FROM OFFSCREEN

SET_SCROLL_OFFSC_SCROLL_IN_ONSCREEN_BANNER:                                 ; 0X08 SET SCROLL LOCATION  TO NEXT SCREEN AND SCROLL IN BANNER
	LDA #$00                                                                ; SET SCROLL LOCATION = NEXT SCREEN
	STA IRQ_0_XSCROLL                                                       ;
	LDA #$01                                                                ;
	STA IRQ_0_NAMETABLE                                                     ;
	JMP SCROLL_BANNER_IN_FROM_OFFSCREEN                                     ; JUMP->SCROLL BANNER IN FROM OFFSCREEN

REDRAW_CLOCK_SCORE_ONLY:                                                    ; 0X09 REDRAW CLOCK AND SCORE
	LDA ##CLOCK_BACKGROUND_SCREEN_ID                                        ; SET BACKGROUND ID = CLOCK BACKGROUND
	LDX #MENU_DRAW_SCRIPT_BANK                                              ; SET BANK = 16
	JSR DRAW_SCENE_RETURN_PREV_8000_BANK                                    ; DO DRAWING TASK SWAP $A000 BANKS AND SET TO 8X8 TEXT (A= DRAW EVENT, X = BANK)
	JSR SAVE_CLOCK_TIME_TO_BUFFER                                           ; SAVE CLOCK DATA TO DRAW TO BUFFER()  
	JSR DRAW_BANNER_SCORE                                                   ; REDRAW BANNER SCORE PPU
	LDA #$00                                                                ; SET SCROLL LOCATION = CUR SCREEN
	STA IRQ_0_XSCROLL                                                       ;
	STA IRQ_0_NAMETABLE                                                     ;
	JMP CLEAR_BANNER_ID_RETURN_TO_UPDATE                                    ; JUMP-> SET BANNER SCENE TO NONE AND RETURN TO UPDATE BANNER LOOP

DRAW_P1_TEAM_MASCOT_ONSCREEN_BANNER:                                          ; 0X0A DRAW P1 TEAM CITY LARGE BANNER
	JSR CLEAR_ONSCREEN_BANNER                                               ; CLEAR $2040 PPU()
	LDA P1_TEAM                                                             ; SET TEAM = P1 TEAM
	JMP DRAW_TEAM_MASCOT_ONSCREEN_BANNER                                             ; JUMP-> DRAW P1 TEAM NAME BANNER

DRAW_P2_TEAM_MASCOT_ONSCREEN_BANNER:                                          ; 0X0B DRAW P2 TEAM CITY LARGE BANNER
	JSR CLEAR_ONSCREEN_BANNER                                               ; CLEAR $2040 PPU()
	LDA P2_TEAM                                                             ; SET TEAM = P2 TEAM

DRAW_TEAM_MASCOT_ONSCREEN_BANNER:                                           ; DRAW P1 TEAM NAME BANNER

TEAM_MASCTOR_BANNER_TEXT_ALIGN			= $10								; Center alignment (0 = left, 20 = right) 

	CLC                                                                     ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                                     ; = TEAM ID + OFFSET TO TEAM CITY
	LDX #TEAM_MASCTOR_BANNER_TEXT_ALIGN                                     ; SET TEXT ALIGNMENT = CENTER
	STX text_align_value                                                    ;
	LDY #<ONSCREEN_BANNER_PPU_ADDR                                          ; SET PPU ADDR = $2040 = ON SCREEN BANNER START
	LDX #>ONSCREEN_BANNER_PPU_ADDR                                          ;
	JSR DRAW_TEAM_INFO_LARGE_JUSTIFY                                        ; DRAW TEXT (A= POINTER OFFSET, X,Y =PPU ADDR, $45 = TEXT JUSTIFY )
	JMP SCROLL_BANNER_IN_FROM_OFFSCREEN                                     ; JUMP->SCROLL BANNER IN FROM OFFSCREEN

SCROLL_IN_P1_NAME_BANNER:                                                   ; 0X0C SCROLL IN P1 PLAYER NAME BANNER  
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	LDA P1_MAN_POS_ID_ICON_STATUS                                                   ; CONVERT P1 ICON TO P1 ACTUAL PLAYER SRAM INDEX
	AND #roster_id_bitmask                                                  ;
	ASL                                                                     ;
	TAX                                                                     ;
	LDA p1_in_game_team_id_start_SRAM,X                                     ; SET TEAM ID =  PLAYER 1 TEAM ID
	STA team_id                                                             ;
	LDA p1_in_game_roster_id_start_SRAM,X                                   ; SET PLAYER = PLAYER 1  ACTUAL PLAYER
	STA roster_id                                                           ;
	JMP DRAW_SCROLL_IN_PLAYER_NAME_CENT                                     ; JUMP->DRAW AND SCROLL IN PLAYER NAME BANNER

SCROLL_IN_P2_NAME_BANNER:                                                   ; 0X0D SCROLL IN P2 PLAYER NAME BANNER
	JSR CLEAR_OFFSCREEN_BANNER                                              ; CLEAR $2440 VRAM()
	LDA P2_MAN_POS_ID_ICON_STATUS                                                   ; CONVERT P2 ICON TO P2 ACTUAL PLAYER SRAM INDEX
	AND #roster_id_bitmask                                                  ;
	ASL                                                                     ;
	TAX                                                                     ;
	LDA p2_in_game_team_id_start_SRAM,X                                     ; SET TEAM ID =  PLAYER 2 TEAM ID
	STA team_id                                                             ;
	LDA p2_in_game_roster_id_start_SRAM,X                                   ; SET PLAYER = PLAYER 2  ACTUAL PLAYER
	STA roster_id                                                           ;
	
DRAW_SCROLL_IN_PLAYER_NAME_CENT:                                           ; DRAW AND SCROLL IN PLAYER NAME BANNER
	LDY #<OFFSCREEN_BANNER_PPU_ADDR                                         ; SET PPU ADDR = $2440 = OFF SCREEN BANNER START
	LDX #>OFFSCREEN_BANNER_PPU_ADDR                                         ;
	JSR DRAW_PLAYER_NAME_CENTERED                                           ; DRAW LARGE PLAYER TEXT CENTERED (X,Y =PPU ADDR ,$44=PLAYER $45 = TEAM)  
	JMP SCROLL_BANNER_IN_FROM_OFFSCREEN                                     ; JUMP->SCROLL BANNER IN FROM OFFSCREEN

SCROLL_IN_CLOCK_SCORE_BANNER:                                               ; 0X0E SCROLL IN CLOCK AND SCORE
	JSR SAVE_CLOCK_TIME_TO_BUFFER                                           ; SAVE CLOCK DATA TO DRAW TO BUFFER
	JSR DRAW_BANNER_SCORE                                                   ; REDRAW BANNER SCORE PPU
	JMP SCROLL_BANNER_IN_FROM_OFFSCREEN                                     ; JUMP->SCROLL BANNER IN FROM OFFSCREEN

SCROLL_IN_DOWN_DIST_BANNER:                                                 ; 0X0F SCROLL IN DOWN AND DISTANCE 
	LDA DOWN                                                                ; INFO TO DRAW OFFSET =  DOWN
	CLC                                                                     ;
	ADC #OFFSET_TO_DOWN_TEXT_POINTERS                                       ; + OFFSET TO DOWN TEXT POINTERS
	LDY #<DOWN_DISTANCE_BAN_PPU_ADDR                                        ; SET PPU LOCATION = DOWN AND DISTANCE = 246A
	LDX #>DOWN_DISTANCE_BAN_PPU_ADDR                                        ;
	JSR DRAW_TEAM_NAME_CITY_CONF_TEXT                                       ; DRAW TEXT (X,Y =PPUADDRESS, A= OFFSET TO TEXT)
	JMP SCROLL_BANNER_IN_FROM_OFFSCREEN                                     ; JUMP->SCROLL BANNER IN FROM OFFSCREEN

SCROLL_BANNER_IN_FROM_OFFSCREEN:                                            ; SCROLL BANNER IN FROM OFFSCREEN

BANNER_SCROLL_SPEED_PER_FRAME		= $08

	LDA BANNER_ID                                                           ; LOAD BANNER SCENE
SCROLL_BANNER_IN[direction]:
	BMI @scroll_banner_left                                                 ; IS BANNER SCENE SCROLL TYPE = SCROLL LEFT? YES-> SCROLL BANNER LEFT
	LDX #LENGTH_OF_ONE_ROW                                                  ; SET NUMBER OF FRAMES TO SCROLL = ONE SCREEN
@scroll_banner_right_loop:                                                  ; SCROLL BANNER RIGHT BY MOVING CAMERA LEFT LOOP
	RETURN_1_FRAME
	LDA IRQ_0_XSCROLL                                                       ; = CURRENT SCROLL LOCATION – 1 TILE
	SEC                                                                     ;
	SBC #BANNER_SCROLL_SPEED_PER_FRAME                                      ;
	STA IRQ_0_XSCROLL                                                       ;
	LDA IRQ_0_NAMETABLE                                                     ;
	SBC #$00                                                                ;
	AND #$01                                                                ;
	STA IRQ_0_NAMETABLE                                                     ;
	DEX                                                                     ; NUMBER OF FRAMES TO SCROLL--
	BNE @scroll_banner_right_loop                                           ; DONE SCROLLING? NO-> SCROLL BANNER RIGHT BY MOVING CAMERA LEFT LOOP
	LDA #$00                                                                ; SET BANNER SCENE = NONE
	STA BANNER_ID                                                           ;
	JMP UPDATE_BANNER_LOOP                                                  ; JUMP->UPDATE BANNER LOOP

@scroll_banner_left:                                                        ; SCROLL BANNER LEFT
	LDX #LENGTH_OF_ONE_ROW                                                  ; SET NUMBER OF FRAMES TO SCROLL = ONE SCREEN
@scroll_banner_left_loop:                                                   ; SCROLL BANNER LEFT BY MOVING CAMERA RIGHT LOOP
	RETURN_1_FRAME															; 
	LDA IRQ_0_XSCROLL                                                       ; = CURRENT SCROLL LOCATION + 1 TILE
	CLC                                                                     ;
	ADC #BANNER_SCROLL_SPEED_PER_FRAME                                      ;
	STA IRQ_0_XSCROLL                                                       ;
	LDA IRQ_0_NAMETABLE                                                     ;
	ADC #$00                                                                ;
	AND #$01                                                                ;
	STA IRQ_0_NAMETABLE                                                      ;
	DEX                                                                     ; NUMBER OF FRAMES TO SCROLL--
	BNE @scroll_banner_left_loop                                            ; DONE SCROLLING? NO->SCROLL BANNER FROM RIGHT TO LEFT LOOP

CLEAR_BANNER_ID_RETURN_TO_UPDATE:                                           ; SET BANNER SCENE TO NONE AND REUTRN TO UPDATE BANNER LOOP
	LDA #$00                                                                ; SET BANNER SCENE = NONE
	STA BANNER_ID                                                           ;
	JMP UPDATE_BANNER_LOOP                                                  ; JUMP->UPDATE BANNER LOOP

_F}_UPDATE_SCORE_INFO_BANNER

_F{_CLEAR_BANNERS 															; DONE
		
num_rows_banner  = $02
	
CLEAR_ONSCREEN_BANNER:                                                      ; CLEAR $2040 PPU BACKGROUND()
	LDX #>ONSCREEN_BANNER_PPU_ADDR                                          ; 
	JMP CLEAR_BANNER                                                        ; JUMP->CLEAR PPU (X= PPU HIGH ADDR)
CLEAR_OFFSCREEN_BANNER:                                                     ; CLEAR $2440 PPU BACKGROUND()
	LDX #>OFFSCREEN_BANNER_PPU_ADDR                                         ;

CLEAR_BANNER:                                                               ; CLEAR PPU (X= PPU HIGH ADDR) 
	LDY #LOWER_BYTE_OF_BANNER_PPU_ADDR                                      ;
	LDA #num_rows_banner                                                    ; SET NUM ROWS = 2 
	STA num_rows                                                            ;
	LDA #LENGTH_OF_ONE_ROW                                                  ; SET LENGTH = 32 TILES = FULL SCREEN 
	STA num_tiles                                                           ;
	JMP FILL_SCREEN_BLANK_TILE_AREA                                         ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH

_F}_CLEAR_BANNERS  

_F{_SAVE_P1_P2_BANNER_LARGE_SCORE_BUFFER													; DONE
	

SAVE_P1_P2_BANNER_LARGE_SCORE_BUFFER:                                             ; SAVE P1 AND P2 SCORE IN BUFFER
	JSR WAIT_UNTIL_NAME_BUFFER_READY                                        ; WAIT UNTIL $37E TEXT BUFFER IS READY()
	
	SET_RAM_Y_INDEX[start_length_value] SCORE_BUFFER, LENGTH_OF_SCORE_TEXT, SPACE_TILE_ID 

	
	LDA P1_TOTAL_SCORE                                                      ; LOAD P1 TOTAL SCORE
	LOG_SHIFT_RIGHT_4                                                       ;
	BEQ @set_ones_digit_P1_score                                            ; IS DIGIT = ZERO? YES->SET SECOND DIGIT OF P1 SCORE
	CLC                                                                     ; SET 1ST TILE ID = P1 SCORE UPPER DIGIT VALUE + OFFSET TO DIGIT TILES
	ADC #OFFSET_TO_NUMBER_TILES                                             ; 
	STA SCORE_BUFFER                                                        ;

@set_ones_digit_P1_score:                                                   ; SET SECOND DIGIT OF P1 SCORE
	LDA P1_TOTAL_SCORE                                                      ; LOAD P1 TOTAL SCORE
	AND #single_digit_bitmask                                               ; MASK OUT UPPER DIGIT
	CLC                                                                     ;
	ADC #OFFSET_TO_NUMBER_TILES                                             ;
	STA SCORE_BUFFER + 1                                                    ; SET 2ND TILE ID = P1 SCORE LOWER DIGIT VALUE + OFFSET TO DIGIT TILES
	LDA #LARGE_SCORE_DASH_TILE_ID                                           ; SET 3RD TILE ID = LARGE “DASH” TILE
	STA SCORE_BUFFER + 2                                                    ;
	LDA P2_TOTAL_SCORE                                                      ; LOAD P2 TOTAL SCORE
	LOG_SHIFT_RIGHT_4
	BEQ @set_ones_digit_P2_score                                            ; IS DIGIT = ZERO? YES->SET SECOND DIGIT OF P2 SCORE
	CLC                                                                     ;
	ADC #OFFSET_TO_NUMBER_TILES                                             ;
	STA SCORE_BUFFER + 3                                                    ; SET 4TH TILE ID = P2 SCORE UPPER DIGIT VALUE + OFFSET TO DIGIT TILES
	LDA P2_TOTAL_SCORE                                                      ;
	AND #single_digit_bitmask                                               ;
	CLC                                                                     ;
	ADC #OFFSET_TO_NUMBER_TILES                                             ;
	STA SCORE_BUFFER + 4                                                    ; 
	RTS                                                                     ; RETURN

@set_ones_digit_P2_score:                                                   ; SET SECOND DIGIT OF P2 SCORE
	LDA P2_TOTAL_SCORE                                                      ; LOAD P2 TOTAL SCORE
	AND #single_digit_bitmask                                               ; MASK OUT UPPER DIGIT
	CLC                                                                     ;
	ADC #OFFSET_TO_NUMBER_TILES                                             ;
	STA SCORE_BUFFER + 3                                                    ; SET 5TH TILE ID = P2 SCORE LOWER DIGIT VALUE + OFFSET TO DIGIT TILES
	RTS                                                                     ; RETURN

_F}_SAVE_P1_P2_BANNER_LARGE_SCORE_BUFFER

_F{_DRAW_TEAM_MASCOT_OFFSCREEN												; DONE

text_just_amount   				=  LOCAL_8
TEAM_MASCOT_TEXT_JUSTIFY		=  $10											; centered 

	
DRAW_TEAM_MASCOT_OFFSCREEN_BANNER:                                          ; DRAW TEAM CITY OFFSCREEN (A= TEAM ID)
	CLC                                                                     ;
	ADC #OFFSET_TO_TEAM_MASCOT_POINTERS                                     ; + OFFSET TO TEAM CITY 
	LDX #TEAM_MASCOT_TEXT_JUSTIFY                                                                ; SET TEXT JUSTIFICATION = CENTER
	STX text_just_amount                                                    ;
	LDY #<OFFSCREEN_BANNER_PPU_ADDR                                         ; SET PPU ADDR = START OF OFFSCREEN BANNER = $2440
	LDX #>OFFSCREEN_BANNER_PPU_ADDR                                         ;
	JMP DRAW_TEAM_INFO_LARGE_JUSTIFY                                        ; DRAW TEXT (A= POINTER OFFSET, X,Y =PPU ADDR, $45 = TEXT JUSTIFY )
	
_F}_DRAW_TEAM_MASCOT_OFFSCREEN 

_F{_SAVE_CLOCK_TIME_TO_BUF													; DONE

NUM_OF_TILES_CLOCK  	=  $05


SAVE_CLOCK_TIME_TO_BUFFER:                                                  ; SAVE CLOCK DATA TO DRAW TO BUFFER  
	LDY #<CLOCK_PPU_ADDR                                                    ; SET PPU ADDR = CLOCK START
	LDX #>CLOCK_PPU_ADDR                                                    ;
	LDA #NUM_OF_TILES_CLOCK                                                ; SET LENGTH = 5 TILES
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                                   ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS, A= LENGTH)
	LDA CLOCK_MINUTES                                                       ; LOAD MINUTES
	LOG_SHIFT_RIGHT_4                                                       ;
	BEQ @finish_time_to_tile_conversion                                     ; IS DIGIT = 0? YES->FINISH TIME TO TILE ID CONVERSION
	CLC                                                                     ;
	ADC #OFFSET_TO_NUMBER_TILES                                             ;
	
@finish_time_to_tile_conversion:                                            ; FINISH TIME TO TILE ID CONVERSION
	STA CURRENT_BG_BUFFER_LOC,X                                             ; SAVE MINUTES UPPER DIGIT TILE ID IN BUFFER
	INX                                                                     ; BUFFER INDEX ++ 
	LDA CLOCK_MINUTES                                                       ; LOAD MINUTES
	JSR @set_digit_in_buffer                                                ; CONVERT AND SAVE DIGIT IN BUFFER (A= DIGIT)
	LDA #COLON_TILE_ID                                                         ; SAVE “COLON” TILE ID IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                             ; 
	INX                                                                     ; BUFFER INDEX ++
	LDA CLOCK_SECONDS                                                       ; GET SECONDS UPPER DIGIT
	LOG_SHIFT_RIGHT_4
	JSR @set_digit_in_buffer                                                ; CONVERT AND SAVE DIGIT IN BUFFER (A= DIGIT)
	LDA CLOCK_SECONDS                                                       ; LOAD SECONDS 
	JSR @set_digit_in_buffer                                                ; CONVERT AND SAVE DIGIT IN BUFFER (A= DIGIT)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                               ; JUMP->SET BUFFER LENGTH AND SET BUFFER STATUS TO READY(X= LENGTH)

@set_digit_in_buffer:                                                       ; SET LOWER DIGIT IN BUFFER
	AND #$0F                                                                ;
	CLC                                                                     ;
	ADC #OFFSET_TO_NUMBER_TILES                                             ;
	STA CURRENT_BG_BUFFER_LOC,X                                             ;
	INX                                                                     ;
	RTS                                                                     ; RETURN

_F}SAVE_CLOCK_TIME_TO_BUF

_F{_UPDATE_P1_P2_CONTROLLED_PLAYER_NAMES									; DONE
	
UPDATE_P1_P2_CONTROLLED_PLAYER_NAMES:                                       ; UPDATE PLAYER NAMES BANNER()

NAME_NEEDS_ERASING_VALUE    = $FF
NAME_ERASED_VALUE           = $80
num_rows_player_name      	= $01
length_player_name       	= $0B

num_tiles        			= LOCAL_1
num_rows        			= LOCAL_2

	LDA PLAY_STATUS                                                         ; DOES PLAY STATUS = PLAY OVER
	BMI @exit                                                               ; YES-> EXIT
	
@check_p1_needs_name_change: 
	BIT P1_MAN_POS_ID_ICON_STATUS                                                   ; DOES P1 ICON STATUS = NEEDS NAME CHANGE? 
	BVC @check_p2_needs_name_change                                         ; NO->CHECK PLAYER 2 ICON
	
@check_p1_erase_name:
	LDA P1_MAN_POS_ID_ICON_STATUS                                                   ; DOES P1 ICON STATUS = CLEAR NAME
	CMP #NAME_NEEDS_ERASING_VALUE                                                 ;
	BEQ @erase_p1_name_banner                                                      ; YES-> CLEAR P1 BANNER NAME
	
@set_p1_name: 
	AND #roster_id_bitmask                                                  ; CLEAR NEEDS NAME CHANGE STATUS FROM P1 ICON STATUS
	STA P1_MAN_POS_ID_ICON_STATUS                                                   ; CONVERT P1 ICON VALUE TO PLAYER INDEX
	ASL                                                                     ;
	TAX                                                                     ;
	LDA p1_in_game_team_id_start_SRAM,X                                     ; LOAD PLAYER 1 TEAM ID
	STA team_id                                                             ;
	LDA p1_in_game_roster_id_start_SRAM,X                                   ; LOAD PLAYER 1 ROSTER ID
	STA roster_id                                                           ;
	LDY #<P1_BANNER_NAME_PPU_ADDR                                           ; SET PPU ADDR = P1 BANNER NAME START
	LDX #>P1_BANNER_NAME_PPU_ADDR                                           ;
	JMP DRAW_NUMBER_LAST_NAME_11_CHAR                                       ; TRANSFER NUMBERS AND NAMES TO BUFFER (X,Y= PPU ADDR, $44 = PLAYER ID, $45=TEAM ID)

@erase_p1_name_banner:                                                      ; CLEAR P1 BANNER NAME
	LDY #<P1_BANNER_NAME_PPU_ADDR                                           ; SET PPU ADDR = P1 BANNER NAME START = $2041
	LDX #>P1_BANNER_NAME_PPU_ADDR                                           ;
	LDA #num_rows_player_name                                               ; SET NUM ROWS = 1
	STA num_rows                                                            ;
	LDA #length_player_name                                                 ; SET LENGTH = 11 TILES
	STA num_tiles                                                           ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                                         ; FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	LDA #NAME_ERASED_VALUE                                                        ; SET P1 ICON VALUE = READY FOR NEW PLAYER
	STA P1_MAN_POS_ID_ICON_STATUS                                                   ;
	RTS                                                                     ; RETURN

@check_p2_needs_name_change:                                                ; CHECK PLAYER 2 ICON
	BIT P2_MAN_POS_ID_ICON_STATUS                                                   ; DOES P2 ICON STATUS = NEEDS NAME CHANGE?
	BVC @exit                                                               ; NO->EXIT
	LDA P2_MAN_POS_ID_ICON_STATUS                                                   ; DOES P2 ICON STATUS = CLEAR NAME 
	CMP #NAME_NEEDS_ERASING_VALUE                                                 ;
	BEQ @erase_p2_name_banner                                               ; YES-> CLEAR P2 BANNER NAME

@set_p2_name:
	AND #roster_id_bitmask                                                  ; CLEAR NEEDS NAME CHANGE STATUS FROM P2 ICON STATUS
	STA P2_MAN_POS_ID_ICON_STATUS                                                   ;
	ASL                                                                     ; CONVERT P2 ICON VALUE TO PLAYER INDEX
	TAX                                                                     ;
	LDA p2_in_game_team_id_start_SRAM,X                                     ; LOAD PLAYER 2 TEAM ID
	STA team_id                                                  
	LDA p2_in_game_roster_id_start_SRAM ,X                                  ; LOAD PLAYER 2 ROSTER ID 
	STA roster_id                                                           ;
	LDY #<P2_BANNER_NAME_PPU_ADDR                                           ; SET PPU ADDR = P2 BANNER NAME START
	LDX #>P2_BANNER_NAME_PPU_ADDR                                           ;
	JMP DRAW_NUMBER_LAST_NAME_11_CHAR                                       ; TRANSFER NUMBERS AND NAMES TO BUFFER (X,Y= PPU ADDR, $44 = PLAYER ID, $45=TEAM ID)

@erase_p2_name_banner:                                                      ; CLEAR P2 BANNER NAME
	LDY #<P2_BANNER_NAME_PPU_ADDR                                           ; SET PPU ADDR = P2 BANNER NAME START = $2054 
	LDX #>P2_BANNER_NAME_PPU_ADDR                                           ;
	LDA #num_rows_player_name                                               ; SET NUM ROWS = 1
	STA num_rows                                                            ;
	LDA ##length_player_name                                                ; SET LENGTH = 11 TILES
	STA num_tiles                                                           ;
	JSR FILL_SCREEN_BLANK_TILE_AREA                                         ; 
	LDA #NAME_ERASED_VALUE                                                        ; SET P2 ICON VALUE = READY FOR NEW PLAYER
	STA P2_MAN_POS_ID_ICON_STATUS                                                   ;
@exit:                                                                      ; EXIT
	RTS                                                                     ; RETURN

_F}_UPDATE_P1_P2_CONTROLLED_PLAYER_NAMES 
	
_F{_PLAYER_COLLISION_CHECK 													; DONE
	

							 	; 11 defenders

INITIAL_OFF_POS_TO_CHECK				= RT_POSITION_ID + 1				; add one due to way loop works
INITIAL_DEF_POS_TO_CHECK				= SS_POSITION_ID + 1 				; add one due to way loop works

def_players_left_check  				= LOCAL_1
current_def_player   					= LOCAL_2
current_defender						= LOCAL_3 
current_off_player   					= LOCAL_4
off_plyr_check_per_frame 				= LOCAL_6

collision_bitmask						= LOCAL_7
offset_to_player_collision_byte			= LOCAL_8

OFF_PLAYERS_TO_CHECK_PER_FRAME_COLL		= $02 
COLL_LIMIT_Y							= $06 
COLL_LIMIT_X							= $08
																				
COLL_CHECK_TASK_START:                                                        ; COLLISION CHECK START 
	SET_STACK[loc] COLLISION_STACK_INDEX
	LDA PLAY_STATUS                                                           ; DOES PLAY STATUS = BALL SNAPPED OR BALL KICKED
	AND #(BALL_SNAPPED_PLAY_STATUS_BITFLAG + BALL_KICKED_PLAY_STATUS_BITFLAG) ; YES->
	BNE @init_current_players                                                 ;

@clear_all_collision_ram:	
	CLEAR_RAM_Y_INDEX[start_length] COLL_RAM_START, SIZE_OF_ENTIRE_COLL_STATUS_RAM
	
@init_current_players:                                                      ; COLLISION CHECK CURRENT PLAYER INITIALIZE
	LDA #$01                                                                ; 
	STA current_off_player                                                  ; SET CURRENT OFFENSIVE PLAYER = FIRST OFFENSIVE PLAYER
	STA current_def_player                                                  ; SET CURRENT DEFENSIVE PLAYER = FIRST DEFENSIVE PLAYER

COLL_CHECK_MAIN_LOOP:                                                       ; COLLISION CHECK LOOP 
	RETURN_1_FRAME       
	LDA #OFF_PLAYERS_TO_CHECK_PER_FRAME_COLL                                ; SET # OFFENSIVE PLAYERS TO CHECK PER FRAME = 2
	STA off_plyr_check_per_frame                                            ; 
																			; CHECKS TWO OFFENSIVE PLAYERS VS ALL 12 DEFENDERS PER FRAME
																			
CHECK_TWO_OFF_PLAYER_LOOP:                                                  ; OFFENSIVE COLLISION LOOP
																			; SET CUR OFF PLAYER POINTER  += OFFSET TO NEXT PLAYER 
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] CURR_OFF_COLL_ADDR, SIZE_OF_EACH_PLAYER_RAM   	
	DEC current_off_player                                                  ; CURRENT OFFENSIVE PLAYER--     
	BNE SET_CUR_DEFENDER_RAM_ADDR                                           ;   
	
	LDA #INITIAL_OFF_POS_TO_CHECK                                         ; SET NUMBER OF OFFENSIVE PLAYERS TO CHECK = 11 
	STA current_off_player                                                  ;
	LDA POSSESSION_STATUS                                                   ; DOES POSSESSION STATUS = P2 ON OFFENSE 
	BMI @set_off_coll_addr_to_p2_ram_start                                  ; 
																			; CAN OPTIMIZE
@set_off_coll_addr_to_p1_ram_start:                                         ; SET CURRENT OFFENSE PTR = P1 PLAYER RAM START
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] PLAYER_1_RAM_START, CURR_OFF_COLL_ADDR	; SET CURRENT OFFENSIVE PLAYER PTR = FIRST PLAYER 1 PLAYER
	JMP SET_CUR_DEFENDER_RAM_ADDR                                           ; 

@set_off_coll_addr_to_p2_ram_start:                                         ; SET CURRENT OFFENSE PTR = P2 PLAYER RAM START
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] PLAYER_2_RAM_START, CURR_OFF_COLL_ADDR	; SET CURRENT OFFENSIVE PLAYER PTR = FIRST PLAYER 2 PLAYER


SET_CUR_DEFENDER_RAM_ADDR:                                                  ; SET CURRENT DEFENSE PTR 
	LDA POSSESSION_STATUS                                                   ; DOES POSSESSION STATUS = P2 ON OFFENSE
	BMI @set_def_coll_addr_to_p1_ram_start                                  ; YES->SET CURRENT DEFENSE PTR = P1 PLAYER RAM START

@set_def_coll_addr_to_p2_ram_start:                                         ; SET CURRENT DEFENSE PTR = P2 PLAYER RAM START
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] PLAYER_2_RAM_START, CURR_DEF_COLL_ADDR	; SET CURRENT DEFENSIVE PLAYER PTR = FIRST PLAYER 2 PLAYER
	JMP @set_number_of_defenders_to_check_vs                                ; JUMP to SET NUMBER OF DEFNDERS TO CHECK TO 11

@set_def_coll_addr_to_p1_ram_start:                                         ; SET CURRENT DEFENSE PTR = P1 PLAYER RAM START
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] PLAYER_1_RAM_START, CURR_DEF_COLL_ADDR	; SET CURRENT DEFENSIVE PLAYER PTR = FIRST PLAYER 2 PLAYER

@set_number_of_defenders_to_check_vs:                                       ; SET NUMBER OF DEFNDERS TO CHECK TO 11
	LDA #INITIAL_DEF_POS_TO_CHECK                                           ; SET NUMBER OF DEFENSIVE PLAYERS TO CHECK = 11
	STA current_defender	                                                ; 

CHECK_OFF_PLAYER_VS_ALL_DEF_LOOP:                                           ; CHECK FOR COLLISION LOOP
	LDY current_off_player                                                  ; LOAD OFFSET TO OFF PLAYER COLL BYTE FROM COLLISION_OFFSET_TABlE    
	LDA OFFSET_TO_COLL_BYTE_TABLE-1,Y                                       ; 
	LDY current_defender                                                                 ; + OFFSET TO DEFENDER BYTE ( EITHER 0 OR 1)
	CLC                                                                     ;
	ADC DEFENDER_BYTE_TABLE-1,Y                                             ; 
	STA offset_to_player_collision_byte                                     ; SAVE COLLISION RAM OFFSET
	TAX                                                                     ; 
	LDA PLAYER_BITMASK_TABLE-1,Y                                           ; SET DEFENSIVE PLAYER BITMASK
	STA collision_bitmask                                                   ; 
	LDA CAN_COLLIDE_STATUS_OFFENSE,X                                        ; IS OFFENSIVE PLAYER SET TO BE ABLE COLLIDE WITH DEFENSIVE PLAYER?
	AND collision_bitmask                                                   ; 
	BEQ @set_off_player_not_colliding_with_defender                         ; NO->SET OFFENSIVE PLAYER NOT COLLIDING SPECIFIC DEFENDER

@check_bottom_collision:                                                                  ; CHECK BOTTOM COLLISION
	LDY #Y_POS+1                                                            ;  IS DEFENSE Y < 6 PIXELS (3/4 YD) BELOW OFFENSE PLAYER Y 
	LDA (CURR_DEF_COLL_ADDR),Y                                              ;
	SEC                                                                     ;
	SBC #COLL_LIMIT_Y                                                       ;
	CMP (CURR_OFF_COLL_ADDR),Y                                              ;
	BCS @set_off_player_not_colliding_with_defender                         ; NO->SET OFFENSIVE PLAYER NOT COLLIDING SPECIFIC DEFENDER

@check_top_collision:                                                       ; CHECK TOP COLLISION
	ADC #(COLL_LIMIT_Y *2)                                                  ; IS DEFENSE Y > 6 PIXELS (3/4 YD) ABOVE OFFENSE PLAYER Y 
	CMP (CURR_OFF_COLL_ADDR),Y                                              ; 
	BCC @set_off_player_not_colliding_with_defender                         ; NO->SET OFFENSIVE PLAYER NOT COLLIDING SPECIFIC DEFENDER

@check_right_bounding_box:                                                  ; CHECK RIGHT BOUNDING BOX
	LDY #X_POS +1                                                           ; = DEFENSE X (16BIT)- OFFENSE X
	LDA (CURR_DEF_COLL_ADDR),Y                                              ;
	SBC (CURR_OFF_COLL_ADDR),Y                                              ;
	TAX                                                                     ;
	INY                                                                     ;
	LDA (CURR_DEF_COLL_ADDR),Y                                              ;
	SBC (CURR_OFF_COLL_ADDR),Y                                              ;

@if_not_to_right_of_player:	
	BMI @check_left_bounding_box                                            ; IS DEFENDER LEFT OF OFFENSIVE PLAYER? YES->CHECK LEFT BOUNDING BOX

@if_too_far_away:	
	BNE @set_off_player_not_colliding_with_defender                         ; DEFENDER TO FAR RIGHT? YES->SET OFF PLAYER NOT COLLIDING SPECIFIC DEFENDER

@within_one_yard_right_check:	
	TXA                                                                     ; IS DEFENDER <1 YARD (8 PIXELS) AWAY TO THE RIGHT ? 
	CMP #COLL_LIMIT_X                                                                ;
	BCS @set_off_player_not_colliding_with_defender                         ; NO->SET OFFENSIVE PLAYER NOT COLLIDING SPECIFIC DEFENDER
	JMP @players_colliding                                                  ; YES->SET OFFENSIVE PLAYER COLLIDING SPECIFIC DEFENDER


@check_left_bounding_box:                                                   ; CHECK LEFT BOUNDING BOX
	CMP #$FF                                                                ; IS DEFENDER TOO FAR AWAY ON THE LEFT?
	BNE @set_off_player_not_colliding_with_defender                         ; YES->SET OFFENSIVE PLAYER NOT COLLIDING SPECIFIC DEFENDER
	TXA                                                                     ; IS DEFENDER <1 YARD (8 PIXELS) AWAY TO THE LEFT ? 
	CLC                                                                     ;
@within_one_yard_left_check	
	ADC #COLL_LIMIT_X                                                       ;
	BCC @set_off_player_not_colliding_with_defender                         ; NO-> SET OFFENSIVE PLAYER NOT COLLIDING SPECIFIC DEFENDER

@players_colliding:                                                         ; SET OFFENSIVE PLAYER COLLIDING SPECIFIC DEFENDER
	LDX offset_to_player_collision_byte                                     ; DOES CUR OFFENSIVE PLAYER COLLISION STATUS = COLLIDED WITH DEFENDER
	LDA COLLIDED_STATUS_OFFENSE,X                                           ;
	AND collision_bitmask                                                   ;
	BNE @set_def_player_ram_to_next_player                                  ; YES->SET DEFENDER TO NEXT DEFENDER AND CHECK IF ALL DEFENDERS CHECKED
	
@set_off_and_def_player_coll_status_collided:	
	LDA COLLIDED_STATUS_OFFENSE,X                                           ; SET OFENSIVE PLAYER COLLISION STATUS = COLLIDED WITH DEFENDER
	ORA collision_bitmask                                                   ;
	STA COLLIDED_STATUS_OFFENSE,X                                           ;
	LDY #$00                                                                ; SET CURRENT OFFENSIVE PLAYER COLLISION STATUS = COLLIDING
	LDA (CURR_OFF_COLL_ADDR),Y                                              ;
	ORA #PLAYER_COLLIDING_BITFLAG                                           ;
	STA (CURR_OFF_COLL_ADDR),Y                                              ;
	LDA (CURR_DEF_COLL_ADDR),Y                                              ; SET CURRENT DEFENSIVE PLAYER COLLISION STATUS = COLLIDING
	ORA #PLAYER_COLLIDING_BITFLAG                                           ;
	STA (CURR_DEF_COLL_ADDR),Y                                              ;
	JMP @set_def_player_ram_to_next_player

@set_off_player_not_colliding_with_defender:                                ; SET OFFENSIVE PLAYER NOT COLLIDING SPECIFIC DEFENDER
	LDX offset_to_player_collision_byte	                                    ; LOAD OFFSET TO OFFENSIVE PLAYER COLLISION BYTE
	LDA collision_bitmask                                                   ; SET OFFENSIVE PLAYER COLL STATUS = NOT COLLIDING WITH SPECFIC DEFENDER
	EOR #$FF                                                                ;
	AND COLLIDED_STATUS_OFFENSE,X                                           ;
	STA COLLIDED_STATUS_OFFENSE,X                                           ; SAVE IN OFFENSIVE PLAYER COLLISION STATUS 

@set_def_player_ram_to_next_player:                                         ; SET CURRENT DEFENDER TO NEXT DEFENDER AND CHECK IF ALL DEFENDERS CHECKED
	LDA CURR_DEF_COLL_ADDR                                                  ; =CURRENT DEFENSIVE PLAYER PTR += OFFSET TO NEXT PLAYER = 0X20  
	CLC                                                                     ;
	ADC #SIZE_OF_EACH_PLAYER_RAM                                            ;
	STA CURR_DEF_COLL_ADDR                                                  ;
	LDA CURR_DEF_COLL_ADDR + 1                                              ;
	ADC #$00                                                                ;
	STA CURR_DEF_COLL_ADDR + 1                                              ;
	
@check_if_done_checking_all_defenders	
	DEC current_defender                                             ; DEFENSIVE PLAYERS LEFT TO CHECK --
	BEQ @check_if_done_coll_check                                           ; ALL DEF PLAYERS CHECKED? YES->CHECK NEXT OFFENSIVE PLAYER EXIT IF DONE
	JMP CHECK_OFF_PLAYER_VS_ALL_DEF_LOOP                                    ; NO->CHECK FOR COLLISION LOOP 

@check_if_done_coll_check:                                                  ; CHECK NEXT OFFENSIVE PLAYER EXIT IF DONE
	DEC off_plyr_check_per_frame                                            ; NUMBER OF OFFENSIVE PLAYERS TO CHECK --
	BEQ PLAYER_NEARBY_CHECK                                             	; DONE? YES->CHECK FOR CLOSE TO COLLISION LOOP
	JMP CHECK_TWO_OFF_PLAYER_LOOP                                           ; NO->OFFENSIVE COLLISION LOOP

_F}_PLAYER_COLLISION_CHECK

_F{_PLAYER_NEARBY_CHECK														; DONE
						
PLAYER_NEARBY_CHECK:                                                    	; CHECK FOR CLOSE TO COLLISION START 

current_def_player_to_check				= LOCAL_1
current_off_player_to_check				= LOCAL_2
collision_status_player_bitmask			= LOCAL_7
collision_status_byte_index				= LOCAL_8

INITIAL_OFF_POS_TO_CHECK				= RT_POSITION_ID + 1				; add one due to way loop works
INITIAL_DEF_POS_TO_CHECK				= SS_POSITION_ID + 1 				; add one due to way loop works

Y_CLOSE_COLL_LIMIT						= $1A								; 2.25 YARDS
X_CLOSE_COLL_LIMIT						= $1C								; 2.5 YARDS 

	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] OFF_CLOSE_COLL_ADDR, SIZE_OF_EACH_PLAYER_RAM 
	DEC current_off_player_to_check                                         ; NUMBER OF OFFENSIVE PLAYERS LEFT TO CHECK--  
	BNE @reset_def_player_ram_addr                                          ; DONE? NO-> RESET DEFENSIVE PLAYER PTR TO FIRST ADDR
	
@reset_number_of_offensive_players_to_check	
	LDA #INITIAL_OFF_POS_TO_CHECK                                           ; SET NUMBER OF OFFENSIVE PLAYERS TO CHECK = 11
	STA current_off_player_to_check                                 		;
	
@reset_off_player_ram_addr:	
	LDA POSSESSION_STATUS                                                   ; IS P2 ON OFFENSE?
	BMI @set_off_to_p2_first_player_ram                                     ; YES-> SET PLAYER 2 OFF PTR

@set_off_to_p1_first_player_ram 	
	LDA #<P1_RAM_FIRST_PLAYER                                               ; SET PLAYER 1 OFF PTR 
	STA OFF_CLOSE_COLL_ADDR                                                 ; SET CUR OFF PTR = FIRST P1 PLAYER ADDR = $039F
	LDA #>P1_RAM_FIRST_PLAYER                                               ;
	STA OFF_CLOSE_COLL_ADDR + 1                                                ;
	JMP @reset_def_player_ram_addr                                          ;

@set_off_to_p2_first_player_ram:                                            ; SET PLAYER 2 OFF PTR
	LDA #<P2_RAM_FIRST_PLAYER                                               ; SET CUR OFF PTR = FIRST P2 PLAYER ADDR = $04FF
	STA OFF_CLOSE_COLL_ADDR                                                 ;
	LDA #>P2_RAM_FIRST_PLAYER                                               ;
	STA OFF_CLOSE_COLL_ADDR + 1                                              ;

@reset_def_player_ram_addr:                                                 ; RESET DEFENSIVE PLAYER PTR  TO FIRST ADDR
	LDA POSSESSION_STATUS                                                   ; IS P1 ON DEFENSE? 
	BMI @set_def_to_p1_first_player_ram:                                    ; YES->SET DEFENSIVE PLAYER PTR TO P1 START
								

@set_def_to_p2_first_player_ram: 											; SET DEFENSIVE PLAYER PTR TO P2 START 
	LDA #<P2_RAM_FIRST_PLAYER                                               ; SET CUR DEF PTR = FIRST P2 PLAYER ADDR = $04FF    
	STA DEF_CLOSE_COLL_ADDR                                                 ; 
	LDA #>P2_RAM_FIRST_PLAYER                                               ;
	STA DEF_CLOSE_COLL_ADDR + 1                                               ;
	JMP @set_defenders_to_check                                              ; JUMP-> SET NUMBER OF PLAYERS TO CHECK

@set_def_to_p1_first_player_ram:                                            ; SET DEFENSIVE PLAYER PTR TO P1 START
	LDA #<P1_RAM_FIRST_PLAYER                                               ; SET CUR DEF PTR = FIRST P1 PLAYER ADDR = $039F
	STA  DEF_CLOSE_COLL_ADDR                                                ;
	LDA #>P1_RAM_FIRST_PLAYER                                               ;
	STA  DEF_CLOSE_COLL_ADDR + 1                                              ;

@set_defenders_to_check:                                                    ; SET NUMBER OF DEF PLAYERS TO CHECK
	LDA #INITIAL_DEF_POS_TO_CHECK                                                                ; SET NUMBER OF DEF PLAYERS TO CHECK = 11
	STA current_def_player_to_check

_WHILE ALWAYS                                                               ; CHECK FOR CLOSE TO COLLISION
	
@set_collistion_byte_index:	
	LDY current_off_player_to_check                                          ; GET CLOSE TO COLLISION OFFSET FOR CURRENT OFF PLAYER FROM PLAYER_BYTE_OFFSET
	LDA OFFSET_TO_COLL_BYTE_TABLE-1,Y                                      ;
	LDY current_def_player_to_check                                         ; GET DEFENDER BYTE OFFSET (0 OR 1) FOR CURRENT DEF PLAYER FROM DEFENDER_BYTE
	CLC                                                                     ;
	ADC DEFENDER_BYTE_TABLE-1,Y                                            ;
	STA collision_status_byte_index                                         ; = OFFENSIVE PLAYER OFFSET + DEFENDER BYTE OFFSET   
	TAX              
	
@set_defender_bitmask		
	LDA PLAYER_BITMASK_TABLE-1,Y                                            ; SAVE CURRENT DEFENDER BITMASK FROM BITMASK TABLE
	STA collision_status_player_bitmask                                     ;
	
	LDA CAN_BLOCK_STATUS_OFFENSE,X                                          ; CAN CURRENT OFFENSIVE PLAYER BLOCK CURRENT DEFENSIVE PLAYER
	AND collision_status_player_bitmask                                     ;
	BEQ @off_def_not_close_to_collision                                     ; NO->SET DEFENDER NOT CLOSE TO COLLISION AND CHECK NEXT DEFENDER 
								

@bottom_close_to_block_dive_check											; BOTTOM CLOSE TO COLLISION CHECK
	LDY #(Y_POS+1)                                                          ; DEFENDER Y – OFFENSIVE PLAYER Y
	LDA (DEF_CLOSE_COLL_ADDR),Y                                             ;
	SEC                                                                     ;
	SBC #Y_CLOSE_COLL_LIMIT                                                 ;
	CMP (OFF_CLOSE_COLL_ADDR),Y                                             ; IS DEFENDER > 2.5 YARDS BELOW (26 PIXELS)  OFFENSIVE PLAYER
	BCS @off_def_not_close_to_collision                                     ; YES->SET DEFENDER NOT CLOSE TO COLLISION AND CHECK NEXT DEFENDER
	
@top_close_to_block_dive_check
	ADC #(2 * Y_CLOSE_COLL_LIMIT)                                           ; TOP CLOSE TO COLLISION CHECK
	CMP (OFF_CLOSE_COLL_ADDR),Y                                             ; IS DEFENDER > 2.5 YARDS ABOVE (26 PIXELS)  OFFENSIVE PLAYER
	BCC @off_def_not_close_to_collision                                     ; YES->SET DEFENDER NOT CLOSE TO COLLISION AND CHECK NEXT DEFENDER


@right_close_to_block_dive_check:											; RIGHT CLOSE TO COLLISION CHECK
	LDY #(X_POS+1)                                                          ; (16BIT) DEFENDER X – OFFENSIVE PLAYER X
	LDA (DEF_CLOSE_COLL_ADDR),Y                                             ;
	SBC (OFF_CLOSE_COLL_ADDR),Y                                             ;
	TAX                                                                     ;
	INY                                                                     ;
	LDA (DEF_CLOSE_COLL_ADDR),Y                                             ;
	SBC (OFF_CLOSE_COLL_ADDR),Y                                             ;
	BMI @left_close_to_block_dive_check                                     ; IS DEFENDER LEFT OF PLAYER? YES->LEFT CLOSE TO COLLISION CHECK
	BNE @off_def_not_close_to_collision                                     ; DEFENDER (>32 YARDS RIGHT)? YES->SET DEFENDER NOT CLOSE TO COLLISION AND CHECK NEXT DEFENDER	
	TXA                                                                     ; IS DEFENDER > 2.75 YARDS (28 PIXELS) RIGHT OF OFFENSIVE PLAYER
	CMP #X_CLOSE_COLL_LIMIT                                                 ;
	BCS @off_def_not_close_to_collision                                     ; YES->SET DEFENDER NOT CLOSE TO COLLISION AND CHECK NEXT DEFENDER
	JMP @update_close_to_block_dive_status                                  ; 

@left_close_to_block_dive_check:                                            ; LEFT CLOSE TO COLLISION CHECK
	CMP #$FF                                                                ; IS DEFENDER TO FAR AWAY ON THE LEFT (>32 YARDS)
	BNE @off_def_not_close_to_collision                                     ; YES->SET DEFENDER NOT CLOSE TO COLLISION AND CHECK NEXT DEFENDER
	TXA                                                                     ; 
	CLC                                                                     ;
	ADC #X_CLOSE_COLL_LIMIT                                                 ; IS DEFENDER > 2.75 YARDS (28 PIXELS) LEFT OF OFFENSIVE PLAYER
	BCC @off_def_not_close_to_collision                                     ; YES->SET DEFENDER NOT CLOSE TO COLLISION AND CHECK NEXT DEFENDER

@update_close_to_block_dive_status:                                                                  ; SET OFFENSIVE PLAYER CLOSE TO COLLIDING WITH DEFENSIVE PLAYER
	LDX collision_status_byte_index                                         ; LOAD OFFSET TO OFFENSIVE PLAYER BYTE THAT CONTAINS DEFENDER
	LDA CLOSE_COLL_STATUS_OFFENSE,X                                                             ;
	AND collision_status_player_bitmask                                     ; IS OFFENSIVE PLAYER ALREADY CLOSE TO CLOSE TO COLLISION
	BNE @set_to_next_player_check_if_done_close_coll                        ; YES-> SET TO NEXT DEFENSIVE PLAYER ADDR AND CHECK IF DONE
	
@update_close_block_dive_status_player_ram	
	LDA CLOSE_COLL_STATUS_OFFENSE,X                                                             ; SET OFFENSIVE PLAYER CLOSE TO COLLISION STATUS = TRUE FOR SPECIFIC DEFNDER (BIT)
	ORA collision_status_player_bitmask                                     ;
	STA CLOSE_COLL_STATUS_OFFENSE,X                                                             ;  
	LDY #$00                                                                ;
	LDA (OFF_CLOSE_COLL_ADDR),Y                                             ; SET CURRENT OFFENSIVE PLAYER COLLISION STATUS = CLOSE TO COLLISION
	ORA #PLAYER_NEAR_COLLISION_BITFLAG                                      ;
	STA (OFF_CLOSE_COLL_ADDR),Y                                             ;
	LDA (DEF_CLOSE_COLL_ADDR),Y                                             ; SET CURRENT DEFENSIVE PLAYER COLLISION STATUS = CLOSE TO COLLISION
	ORA #PLAYER_NEAR_COLLISION_BITFLAG                                      ;
	STA (DEF_CLOSE_COLL_ADDR),Y                                             ;
	JMP @set_to_next_player_check_if_done_close_coll                        ; JUMP->SET TO NEXT DEFENSIVE PLAYER ADDR AND CHECK IF DONE

@off_def_not_close_to_collision:                                            ; SET DEFENDER NOT CLOSE TO COLLISION
	LDX collision_status_byte_index                                         ; LOAD OFFSET TO COLLISION BYTE
	LDA collision_status_player_bitmask                                     ; LOAD DEFENDER BITMASK 
	EOR #$FF                                                                ; SET SPECIFIC DEFENDER STATUS BIT = 0 = NOT CLOSE TO COLLISION
	AND CLOSE_COLL_STATUS_OFFENSE,X                                         ;
	STA CLOSE_COLL_STATUS_OFFENSE,X                                         ; 
	
@set_to_next_player_check_if_done_close_coll:                               ; SET TO NEXT DEFENSIVE PLAYER ADDR AND CHECK IF DONE
																			; = CURRENT DEFENSIVE PLAYER PTR += OFFSET TO NEXT PLAYER = 0X20  
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] DEF_CLOSE_COLL_ADDR, SIZE_OF_EACH_PLAYER_RAM
	DEC current_def_player_to_check                                         ; NUMBER OF DEFENSIVE PLAYERS TO CHECK --
	BEQ @back_to_main_collision                                             ; DONE? YES->JUMP TO COLLISION CHECK
_END_WHILE                                                                  ; NO->CHECK FOR CLOSE TO COLLISION LOOP

@back_to_main_collision:                                                    ; JUMP TO COLLISION CHECK
	JMP COLL_CHECK_MAIN_LOOP                                                ; JUMP->COLLISION CHECK LOOP

																			; PLAYER_BYTE_OFFSET
OFFSET_TO_COLL_BYTE_TABLE:
	.DB $14,$12,$10,$0E,$0C,$0A,$08,$06,$04,$02,$00

DEFENDER_BYTE_TABLE:                                                        ; DEFENDER_BYTE
	.DB $01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00

PLAYER_BITMASK_TABLE:                                                       ; PLAYER_BIT_MASK 
	.DB $20,$40,$80,$01,$02,$04,$08,$10,$20,$40,$80

UNUSED_COLL_TABLE:                                                                  ; ***UNUSED/ERROR
	.DB $02,$04,$08,$01,$02,$04,$08,$10,$20,$40,$80
	
_F}_CHECK_CLOSE_TO_DIVE 

_F{_BALL_ANIMATION															; DONE

BALL_ANIMATION_TOO_SHORT_DISTANCE			= $04							; 0.5 yards
BALL_SHADOW_INITAL_SPR_Y_OFFSET				= $08 

START_BALL_ANIMATION:                                                       ; BALL MOVEMENT CALCULATION
	LDX #BALL_ANIMATION_STACK_INDEX                                         ; SET STACK = BALL ANIMATION STACK
	TXS                                                                     ;
	LDA #BALL_X_MARKER_TILE_ID                                              ; SET BALL “X” MARKER TILE ID
	STA BALL_MARKER_SPR_TILE                                                ;
	LDA POSSESSION_STATUS                                                   ; SET BALL “X” MARKER PAL BASED ON CURRENT POSSESSION
	AND #$02                                                                ;
	STA BALL_MARKER_SPR_ATTR                                                ;
	
@clear_vars:	
	LDA #$00                                                                ; 
	STA BALL_Y                                                              ; CLEAR BALL Y
	STA BALL_Y + 2                                                          ; CLEAR BALL Y HIGH
	STA BALL_X                                                              ; CLEAR BALL X LOW
	STA FINAL_BALL_Y + 1                                                    ; CLEAR FINAL BALL HIGH Y
	RETURN_1_FRAME
	ASL BALL_DIRECTION                                                      ; CLEAR BALL DIRECTION
	ASL BALL_DIRECTION                                                      ;
	LDA FINAL_BALL_Y                                                        ; Y DIST TO MOVE BALL = FINAL BALL Y  - CURRENT BALL Y 
	SEC                                                                     ;
	SBC BALL_Y + 1                                                          ; 
	STA Y_DIST_REMAIN_BALL                                                  ; 
	LDA FINAL_BALL_Y + 1                                                    ;
	SBC BALL_Y + 2                                                          ;
	STA Y_DIST_REMAIN_BALL + 1                                              ;
	BCS @save_ball_direction_y                                              ; BALL GOING FROM TOP TO BOTTOM? YES-> FINAL BALL X- BALL X
	
@invert_y_dist_remain	
	LDA #$00                                                                ; ELSE 
	SEC                                                                     ; Y DIST TO MOVE BALL = 1 - Y DIS TO MOVE BALL
	SBC Y_DIST_REMAIN_BALL                                                  ;
	STA Y_DIST_REMAIN_BALL                                                  ; 
	LDA #$00                                                                ;
	SBC Y_DIST_REMAIN_BALL + 1                                              ;
	STA Y_DIST_REMAIN_BALL + 1                                              ;
	CLC
@save_ball_direction_y:                                                     ; FINAL BALL X  - CURRENT BALL X
	ROR BALL_DIRECTION                                                      ; SAVE BALL DIRECTION AND LOFT Y DIRECTION 
	
@set_x_dist_remain	
	LDA FINAL_BALL_X                                                        ; X DIST TO MOVE BALL = FINAL BALL X  - CURRENT BALL X 
	SEC                                                                     ;
	SBC BALL_X + 1                                                          ;
	STA X_DIST_REMAIN_BALL                                                  ; 
	LDA FINAL_BALL_X + 1                                                    ;
	SBC BALL_X + 2                                                          ;
	STA X_DIST_REMAIN_BALL + 1                                              ;
	BCS @check_Y_vs_X_dist                                                  ; BALL MOVING RIGHT? YES-> Y vs X DISTANCE COMPARISON 
	
@invert_x_dist_remain														; invert distance if ball moving left 
	LDA #$00                                                                ; X DIST TO MOVE BALL = 1 - X DIST TO MOVE BALL
	SEC                                                                     ; 
	SBC X_DIST_REMAIN_BALL                                                  ;
	STA X_DIST_REMAIN_BALL                                                  ; 
	LDA #$00                                                                ;
	SBC X_DIST_REMAIN_BALL + 1                                              ;
	STA X_DIST_REMAIN_BALL + 1                                              ;
	CLC                                                                     ;
	
@check_Y_vs_X_dist                                                          ; Y vs X DISTANCE COMPARISON 
	ROR BALL_DIRECTION                                                      ; SAVE BALL DIRECTION AND LOFT X DIRECTION
	LDA Y_DIST_REMAIN_BALL                                                  ; IS Y DIST TO MOVE BALL > X DIST TO MOVE BALL
	CMP X_DIST_REMAIN_BALL                                                  ;
	LDA Y_DIST_REMAIN_BALL + 1                                              ;
	SBC X_DIST_REMAIN_BALL + 1                                              ; 
	BCS @y_dist_greater_x                                                   ; YES-> Y DIST > X DIST
	JMP X_BALL_DIST_GREATER_THAN_Y                                          ; NO->X DIST > Y DIST

@y_dist_greater_x:                                                          ; Y DIST > X DIST
	LDA Y_DIST_REMAIN_BALL                                                  ; IS Y DIST TO MOVE LESS THAN 0.5 YARDS?
	CMP #BALL_ANIMATION_TOO_SHORT_DISTANCE                                  ;
	LDA Y_DIST_REMAIN_BALL + 1                                              ;
	SBC #$00                                                                ; 
	BCS @set_ball_angle                                                     ; NO-> SAVE BALL DISTANCES AND CALCULATE ANGULAR VELOCITIES
	JMP BALL_DISTANCE_LESS_THAN_HALF_YARD                                   ; YES->BALL DISTANCE LESS THAN 0.5 YARD 


@set_ball_angle:                                                            ; SAVE BALL DISTANCES AND CALCULATE ANGULAR VELOCITIES

vel_table_addr			= LOCAL_1
vel_val_temp			= LOCAL_7

y_dist_temp				= LOCAL_3
x_dist_temp				= LOCAL_7
arctan_index			= LOCAL_6
max_arctan_index		= $100 	

dist_temp				= LOCAL_7


	LDA Y_DIST_REMAIN_BALL                                                  ; SAVE Y DISTANCE TO MOVE BALL 
	STA y_dist_temp	                                                        ;
	LDA Y_DIST_REMAIN_BALL + 1                                              ;
	STA y_dist_temp	+ 1                                                     ;
	LDA X_DIST_REMAIN_BALL                                                  ;
	STA x_dist_temp                                                         ; SAVE X DISTANCE TO MOVE BALL
	LDA X_DIST_REMAIN_BALL + 1                                              ;
	STA x_dist_temp+1                                                       ;
	JSR DIVIDE_16_BIT_FRACTIONAL                                            ; 3 $44,$45) DIVIDE BY ($40,$41) ($43,$44,$45)
	RETURN_1_FRAME
	LDA arctan_index +1                                                     ;
	BEQ @set_ball_angle_from_table											; 

@set_ball_angle_to_max	
	LDA (ARCTAN_TABLE + max_arctan_index)                                   ; SET BALL ANGLE TO MAX. ***COULD DO LOAD #$80 and BMI
	JMP @save_ball_angle                                                    ; 

@set_ball_angle_from_table:													; 
	LDX arctan_index                                                        ; LOAD ARCTAN ANGLE INDEX
	LDA ARCTAN_TABLE,X                                                     ; SET BALL ANGLE FROM ARCTAN ANGLE LOOKUP  
@save_ball_angle:                                                           ; SAVE BALL ANGLE AND CALCULATE BALL VELOCITY
	STA BALL_ANGLE                                                          ; SAVE BALL ANGLE
@set_velocity_index_x:	
	ASL                                                                     ; 
	TAX                                                                     ; CONVERT TEMP ANGLE TO ANGULAR VELOCITY TABLE X VEL INDEX 	
	LDA #$00                                                                ;
	ADC #$00                                                                ; 
	TAY                                                                     ;  
	TXA                                                                     ;
	CLC                                                                     ;
	ADC #<ANG_VEL_TABLE                                                     ; = VELOCITY TABLE START(C6EE) + ANGULAR VELOCITY TABLE X VEL INDEX
	STA vel_table_addr                                                      ; SAVE PTR IN $3E,$3F
	TYA                                                                     ;
	ADC #>ANG_VEL_TABLE                                                     ;
	STA vel_table_addr +1                                                   ; 
@load_x_velocity_value	
	LDY #$01                                                                ; LOAD X ANGULAR VELOCITY 
	LDA (vel_table_addr),Y                                                  ; 
	TAX                                                                     ;
	DEY                                                                     ;
	LDA (vel_table_addr),Y                                                  ;
	TAY                                                                     ;
@ball_speed_times_X_ang_velocity:	
	LDA BALL_SPEED                                                          ; LOAD BALL SPEED = VELOCITY TABLE MULTIPLIER
	JSR MULTIPLY_A_TIMES_X_Y                                                ; = A * (X,Y) = BALL SPEED TIMES ANGULAR VELOCITY
	
@save_ball_velocity_X:	
	LDA vel_val_temp                                                        ; SAVE BALL VELOCITY X
	STA BALL_VELOCITY_X                                                     ;
	LDA vel_val_temp + 1                                                    ;
	STA BALL_VELOCITY_X + 1                                                 ;
@set_velocity_index_y:	
	LDA vel_table_addr                                                      ;SET Y ANGULAR VELOCITY INDEX = 0X200 + CURRENT VELOCTY TABLE INDEX
	CLC                                                                     ;
	ADC #$00                                                                ;
	STA vel_table_addr                                                      ;
	LDA vel_table_addr + 1                                                  ;
	ADC #$02                                                                ;
	STA vel_table_addr +1                                                   ;
@load_y_velocity_value:	
	LDY #$01                                                                ;
	LDA (vel_table_addr),Y                                                             ;
	TAX                                                                     ;
	DEY                                                                     ;
	LDA (vel_table_addr),Y                                                             ;
	TAY                                                                     ;
@ball_speed_times_y_ang_velocity:	
	LDA BALL_SPEED                                                          ; LOAD BALL SPEED = VELOCITY TABLE MULTIPLIER
	JSR MULTIPLY_A_TIMES_X_Y                                                ; = A * (X,Y) = BALL SPEED TIMES ANGULAR VELOCITY 

@save_ball_velocity_Y:	
	LDY vel_val_temp                                                        ;
	LDX vel_val_temp + 1                                                    ;
	STY BALL_VELOCITY_Y                                                     ; SAVE BALL VELOCITY Y
	STX BALL_VELOCITY_Y + 1                                                 ;

	
	
	
@set_pass_ani_frames_init_ball_Z:
	LDA Y_DIST_REMAIN_BALL                                                  ; LOAD Y DISTANCE TO MOVE
	STA dist_temp                                                         ;
	LDA Y_DIST_REMAIN_BALL + 1                                              ;
	STA dist_temp + 1                                                     ;
	JSR SET_PASS_FRAMES_INIT_BALL_Z_SPEED_AND_BALL_GRAV                     ; SET PASS TIME AND LOFT DISTANCE AND LOFT VELOCTIY($44,$45 = DISTANCE) 
	BCC @invert_ball_angle                                                  ; 
	JMP BALL_DISTANCE_LESS_THAN_HALF_YARD                                   ; NO->BALL DISTANCE LESS THAN 0.5 YARD

@invert_ball_angle:                                                         ; INVERT BALL ANGLE
	LDA BALL_ANGLE                                                          ; = -(BALL ANGLE) 
	EOR #$FF                                                                ; 
	STA BALL_ANGLE                                                          ;
	JMP SET_BALL_SPR_INFO                                                   ; JUMP->SET SPRITE TILES

y_dist_temp				= LOCAL_7
x_dist_temp				= LOCAL_3	

X_BALL_DIST_GREATER_THAN_Y:                                                 ; X BALL DISTANCE TO MOVE GREATER THAN Y 
	LDA X_DIST_REMAIN_BALL                                                  ; IS X DISTANCE TO MOVE BALL > 0.5 YARDS?
	CMP #BALL_ANIMATION_TOO_SHORT_DISTANCE                                  ;
	LDA X_DIST_REMAIN_BALL + 1                                              ;
	SBC #$00                                                                ;
	BCS @calculate_ball_angle_index                                         ; YES-> SET BALL DISTANCE AND BALL VELOCITY
	JMP BALL_DISTANCE_LESS_THAN_HALF_YARD                                   ; NO->BALL DISTANCE LESS THAN 0.5 YARD
	
@calculate_ball_angle_index:                                                ; SET BALL DISTANCE AND BALL VELOCITY
	LDA Y_DIST_REMAIN_BALL                                                  ; SET Y DISTANCE =  Y DISTANCE TO MOVE BALL
	STA y_dist_temp                                                         ;
	LDA Y_DIST_REMAIN_BALL + 1                                              ;
	STA y_dist_temp + 1                                                     ;
	LDA X_DIST_REMAIN_BALL                                                  ; SET X DISTANCE =  X DISTANCE TO MOVE BALL
	STA x_dist_temp	                                                        ;
	LDA X_DIST_REMAIN_BALL + 1                                              ;
	STA x_dist_temp	+ 1                                                     ;
	JSR DIVIDE_16_BIT_FRACTIONAL                                            ; 3 $44,$45) DIVIDE BY ($40,$41) ($43,$44,$45)
	RETURN_1_FRAME
	LDA arctan_index + 1                                                    ; IS BALL MOVING TOTALLY IN Y DIRECTION?
	BEQ @set_ball_angle                                                           ; NO->BALL MOVING AT ANGLE
	LDA (ARCTAN_TABLE + max_arctan_index)                                   ; THIS CASE SHOULD BE IMPOSSIBLE
	JMP @save_ball_angle                                                    ;

@set_ball_angle:                                                                  ; BALL MOVING AT ANGLE
	LDX arctan_index                                                        ; 
	LDA ARCTAN_TABLE,X                                                      ; LOAD ANGLE FROM ARCTAN ANGLE LOOKUP

@save_ball_angle:                                                            ; SAVE BALL ANGLE AND CALCULATE VELOCITY 
	STA BALL_ANGLE                                                          ; SAVE BALL ANGLE  
@set_velocity_index_y:	
	ASL                                                                     ; SHIFT SINCE EACH VELOCITY ENTRY IS 2 BYTES
	TAX                                                                     ; GET Y VELOCITY PER FRAME FROM ANGULAR VELOCITY TABLE
	LDA #$00                                                                ;
	ADC #$00                                                                ;
	TAY                                                                     ;
	TXA                                                                     ;
	CLC                                                                     ;
	ADC #<ANG_VEL_TABLE                                                     ;
	STA vel_table_addr                                                      ;
	TYA                                                                     ;
	ADC #>ANG_VEL_TABLE                                                     ;
	STA vel_table_addr + 1                                                  ;
@load_velocity_value	
	LDY #$01                                                                ;
	LDA (vel_table_addr),Y                                                  ; 
	TAX                                                                     ;
	DEY                                                                     ;
	LDA (vel_table_addr),Y                                                  ;
	TAY                                                                     ;
@ball_speed_times_y_ang_velocity:	
	LDA BALL_SPEED                                                          ; LOAD BALL SPEED = VELOCITY TABLE MULTIPLIER
	JSR MULTIPLY_A_TIMES_X_Y                                                ; = A * (X,Y) = BALL SPEED TIMES Y VELOCITY

@save_ball_velocity_Y:	
	LDA vel_val_temp                                                        ; SAVE  BALL Y VELOCITY 
	STA BALL_VELOCITY_Y                                                     ;
	LDA vel_val_temp + 1                                                    ;
	STA BALL_VELOCITY_Y + 1                                                 ;
@set_velocity_index_X:	
	LDA vel_table_addr                                                      ; SET X ANGULAR VELOCITY INDEX = 0X200 + CURRENT VELOCTY TABLE INDEX
	CLC                                                                     ; 
	ADC #$00                                                                ;
	STA vel_table_addr                                                      ;
	LDA vel_table_addr + 1                                                  ;
	ADC #$02                                                                ;
	STA vel_table_addr + 1                                                  ;
	LDY #$01                                                                ;
	LDA (vel_table_addr ),Y                                                 ;
	TAX                                                                     ;
	DEY                                                                     ;
	LDA (vel_table_addr ),Y                                                 ;
	TAY                                                                     ;
@ball_speed_times_x_ang_velocity:
	LDA BALL_SPEED                                                          ; LOAD BALL SPEED = VELOCITY TABLE MULTIPLIER
	JSR MULTIPLY_A_TIMES_X_Y                                                ; = A * (X,Y) = BALL SPEED TIMES X VELOCITY
	
@save_ball_velocity_X:	
	LDY vel_val_temp                                                        ;
	LDX vel_val_temp + 1                                                    ;
	STY BALL_VELOCITY_X                                                     ; SAVE BALL VELOCITY X
	STX BALL_VELOCITY_X + 1                                                 ;
	LDA X_DIST_REMAIN_BALL                                                  ; LOAD X DISTANCE TO MOVE
	STA dist_temp                                                           ;
	LDA X_DIST_REMAIN_BALL + 1                                              ;
	STA dist_temp + 1                                                       ;
	JSR SET_PASS_FRAMES_INIT_BALL_Z_SPEED_AND_BALL_GRAV                     ; SET PASS TIME AND LOFT DISTANCE AND LOFT VELOCTIY($44,$45 = DISTANCE) 
	BCS BALL_DISTANCE_LESS_THAN_HALF_YARD                                   ; DISTANCE LESS THAN 0.5 YARD? YES->BALL DISTANCE LESS THAN 0.5 YARD

SET_BALL_SPR_INFO:                                                          ; SET BALL SPRITE TILES
	LDA BALL_ANI_FRAMES_LEFT + 1                                            ; = PASS FRAMES / 4
	LSR                                                                     ;
	LDA BALL_ANI_FRAMES_LEFT                                                ;
	ROR                                                                     ;
	LSR                                                                     ;
	STA PASS_TIMER_DIV_BY_4                                                 ; SAVE IN PASS FRAMES / 4

@convert_ball_direction	
	LDA BALL_DIRECTION                                                      ; GET MAIN DIRECION BALL IS MOVING FROM UPPER TWO BITS
	ROL                                                                     ;
	ROL                                                                     ;
	ROL                                                                     ;
	AND #$03                                                                ; MAKE DIRECTION ONE OF 4 DIRECTIONS 
	TAX                                                                     ;
	LDA PLAYER_DIRECTIONS_TABLE,X                                           ; LOAD DIRECTION ANGLE FROM DIRECTIONS ANGLES
	ASL                                                                     ;
	ASL                                                                     ;
	LDA BALL_ANGLE                                                          ; LOAD BALL ANGLE
	BCC @save_final_ball_angle                                               ; IS BALL MOVING MOSTLY X DIR? YES-> SET BALL/ BALL SHADOW SPR INFO
@invert_ball_angle	
	EOR #$FF                                                                ; INVERT BALL ANGLE

@save_final_ball_angle:                                                     ; SET BALL SPRITE AND BALL SHADOW TILES AND ATTRIBUTES
	LSR                                                                     ; RESTORE BALL ANGLE
	LSR                                                                     ;
	CLC                                                                     ;
	ADC PLAYER_DIRECTIONS_TABLE,X                                           ;
	STA BALL_ANGLE                                                          ; SAVE FINAL BALL ANGLE
	
@check_for_backwards_ball_rotation:	
	LDA BALL_COLLISION                                                      ; DOES BALL STATUS = BALL KICKED OFF
	LSR                                                                     ; 
	BCS @check_ball_leaving_hand_or_foot                                    ; YES->BALL ABOUT TO BE KICKED OFF

@convert_ball_angle
	LDA BALL_ANGLE                                                          ; CONVERT BALL ANGLE INTO BALL SPRITE INDEX (8 POSSIBLE DIRECTIONS)
	CLC                                                                     ; 
	ADC #$10                                                                ;
	LOG_SHIFT_RIGHT_4
	AND #$0E                                                                ;
	TAX                                                                     ; SAVE BALL SPRITE INDEX 
	LDA PASS_BALL_SPRITE_TABLE_EIGHT_DIR,X                                  ; LOAD TILE ID FROM BALL SPRITES TABLE
	STA BALL_SPR_TILE                                                       ; SET BALL SPRITE TILE = TILE ID
	STA BALL_SHADOW_SPR_TILE                                                ; SET BALL SHADOW TILE = TILE ID
	LDA PASS_BALL_SPRITE_TABLE_EIGHT_DIR+1,X                                ; LOAD SPRITE ATTRIBUTES FROM BALL SPRITES TABLE
	STA BALL_SPR_ATTR                                                       ; SET BALL SPRITE ATTRIBUTE = SPRITE ATTRIBUTE
	ORA #$01                                                                ;
	STA BALL_SHADOW_SPR_ATTR                                                ; SET BALL SHADOW ATTRIBUTE = SPRITE ATTRIBUTE

@check_ball_leaving_hand_or_foot:                                           ; CHECK FOR PASS OR RUN TOSS BALL ABOUT TO LEAVE HAND
	LDA BALL_COLLISION                                                      ; DOES BALL STATUS = BALL ABOUT TO LEAVE HAND/FOOT PASS OR TOSS
	AND #BALL_LEAVING_HAND_BITFLAG                          				;
	BEQ @set_chr_banks                                                  ; NO->SWITCH SUB CHR BANK IF NOT SWITCHED
	
	
	SET_BALL_COLLISION_NOT_MOVING_LEAVING_HAND[] 							; SET BALL STATUS = NOT MOVING, NOT LEAVING HAND
	JMP END_CURRENT_TASK                                                    ; END CURRENT TASK()

@set_chr_banks:                                                               ; SWITCH SUB CHR BANK IF NOT SWITCHED
	LDA SOFT_CHR_1800_BANK                                                  ; DOES SPR SOFT CHR $1800 BANK = ARM IN MOTION SPRITE BANK?
	CMP #QB_THROW_JUMP_NO_TIP_BALL_CHR_BANK                                 ;
	BNE @start_ball_animation                                               ; NO->ANIMATE PASS
	LDA #DEFAULT_PLAYER_ANI_1800_CHR_BANK                                   ; SET SPR SOFT CHR $1800 BANK = ARM FULLY EXTENDED SPRITE CHR BANK
	STA SOFT_CHR_1800_BANK                                                  ;



@start_ball_animation:                                                      ; ANIMATE PASS

ball_shadow_spr_y_offset =  LOCAL_1

	LDA #BALL_SHADOW_INITAL_SPR_Y_OFFSET                                    ; SET BALL SPR SHADOW Y ADJUST = 1 TILE = 1 YD
	STA ball_shadow_spr_y_offset                                            ;
	JSR ANIMATE_BALL_SPRITE_START                                           ; ANIMATE BALL SPRITE LOOP BALL GOING UP()
	JMP BALL_HITS_GROUND_NORMAL                                             ; JUMP->BALL HITS GROUMD NORMAL PASS

_F}_BALL_ANIMATION

_F{_BALL_ANIMATION_LESS_THAN_HALF_YARD									    ; DONE

BALL_DISTANCE_LESS_THAN_HALF_YARD:                                          ; BALL DISTANCE LESS THAN 0.5 YARD 

START_OF_BALL_VARS_TO_CLEAR			= Y_DIST_REMAIN_BALL
END_OF_BALL_VARS_TO_CLEAR			= BALL_GRAVITY + 1 
SIZE_OF_BALL_VARS_TO_CLEAR			= END_OF_BALL_VARS_TO_CLEAR - START_OF_BALL_VARS_TO_CLEAR + 1	



	LDA BALL_COLLISION                                                      ; DOES BALL STATUS = BALL LEAVING HAND
	AND #BALL_LEAVING_HAND_BITFLAG                                          ; 
	BEQ @ball_hits_ground_moves_short_dist                                  ; NO->BALL HITS GROUND, BALL MOVED SHORT DISTANCE

@clear_ball_location_vars													; CLEAR BALL VARIABLES (DISTANCE, VELOCITY, LOFT)
																			; *** could use zp clear macro instead
	CLEAR_RAM_Y_INDEX[start_length] START_OF_BALL_VARS_TO_CLEAR, SIZE_OF_BALL_VARS_TO_CLEAR 										
	 
@clear_pass_frames: 	
	LDA #$00                                                                ; CLEAR PASS TIMER
	STA BALL_ANI_FRAMES_LEFT                                                ;
	STA BALL_ANI_FRAMES_LEFT + 1                                            ;

@set_ball_coll_status: 	
	SET_BALL_COLLISION_NOT_MOVING_LEAVING_HAND[]
	JMP END_CURRENT_TASK                                                    ; JUMP->END CURRENT TASK()

								
@ball_hits_ground_moves_short_dist:                                         ; BALL HITS GROUND BALL MOVED SHORT DISTANCE
	LDA SOFT_CHR_1800_BANK                                                  ; DOES SPR SOFT CHR $1800 BANK = ARM IN MOTION SPRITE BANK?
	CMP #QB_THROW_JUMP_NO_TIP_BALL_CHR_BANK                                 ;
	BNE @set_distances                                                      ; NO->SET DISTANCES AND TIME FOR BALL HITTING GROUND
	LDA #DEFAULT_PLAYER_ANI_1800_CHR_BANK                                   ; SET SPR SOFT CHR $1800 BANK = ARM FULLY EXTENDED SPRITE CHR BANK
	STA SOFT_CHR_1800_BANK                                                  ;

@set_distances:                                                             ; SET DISTANCES AND TIME FOR BALL HITTING GROUND
	LDA #$04                                                                ; SET PASS TIMER/4 = 4 FRAMES
	STA PASS_TIMER_DIV_BY_4                                                 ;
	SET_BALL_COLLISION_BALL_COLLIDED_DO_COLLIDED_ANI[] 
	LDA #$20                                                                ; SET DISTANCE TO MOVE = 4 YARDS
	STA Y_DIST_REMAIN_BALL                                                  ; SET Y DIST TO MOVE  = DISTANCE TO MOVE = 4 YARDS
	STA X_DIST_REMAIN_BALL                                                  ; SET X DIST TO MOVE  = DISTANCE TO MOVE = 4 YARDS
	LDA #$00                                                                ;
	STA Y_DIST_REMAIN_BALL + 1                                              ;
	STA X_DIST_REMAIN_BALL + 1                                              ;
	RETURN_IN_NUM_FRAMES 4

_F}_BALL_ANIMATION_LESS_THAN_HALF_YARD

_F{_BALL_HITS_GROUND_NORMAL													; DONE

BALL_HITS_GROUND_BALL_SHADOW_OFFSET_INIT_VALUE		= $03 
ball_shadow_spr_y_offset							= LOCAL_1


BALL_HITS_GROUND_NORMAL:                                                    ; BALL HITS GROUND NORMAL PASS
	LDA #SPRITE_OFFSCREEN                                                   ; SET LANDING MARKER “X”  SPR Y LOC  = OFFSCREEN
	STA BALL_MARKER_SPR_Y                                                   ;
	SET_BALL_COLLISION_BALL_COLLIDED_DO_COLLIDED_ANI[]
	RETURN_1_FRAME

@set_random_ball_angle_after_colliding_ground:                              ; SET RANDOM ANGLE FOR BALL HITTING GROUND
	LDA RANDOM_3                                                            ; *** change for onsides BALL ANGLE = ANGLE + ( RANDOM -45 TO 45 DEGREES) USED IN ONSIDE KICK
	AND #$3F                                                                ;
	SEC                                                                     ;
	SBC #$20                                                                ;
	CLC                                                                     ;
	ADC BALL_ANGLE                                                          ;
	STA BALL_ANGLE                                                          ;
	JSR PLAY_BALL_BOUNCE_SOUND_SET_BALL_ANI_INFO                            ; PLAY BOUNCE SOUND, ADJ FINAL BALL LOCATIONS, MAKE RANDOM BALL LOFT, ADJ BALL VELOCITY() 
	BCS BALL_ROLL_ON_GROUND_LESS_THAN_HALF_YARD                             ; DIST TO MOVE 0.5 YARD OR LESS? YES->BALL ROLL ON GROUND ANIMATION START
	LDA #BALL_HITS_GROUND_BALL_SHADOW_OFFSET_INIT_VALUE                     ; 
	STA ball_shadow_spr_y_offset                                            ; 
	JSR ANIMATE_BALL_SPRITE_START                                           ; ANIMATE BALL SPRITE LOOP BALL GOING UP()

_F}_BALL_HITS_GROUND_NORMAL

_F{_BALL_TIPPED_ROLL_ON_GROUND_ANIMATION_LOOP								; DONE
	
ball_shadow_offset				= LOCAL_1
loop_counter					= LOCAL_2

FINAL_BALL_MOVE_FRAMES_DIV_2	= $08
BALL_SHADOW_OFFSET_ON_GROUND	= $04

BALL_ROLLING_ON_GROUND_TIPPED_ANI_START:                                           ; BALL ROLLING ON GROUND ANIMATION LOOP
	
_WHILE ALWAYS	
	LDA RANDOM_2                                                            ; SET BALL DIRECTION =  RANDOM DIRECTION ($3C)
	STA BALL_ANGLE                                                          ; 
	JSR PLAY_BALL_BOUNCE_SOUND_SET_BALL_ANI_INFO                            ; PLAY BOUNCE SOUND, ADJ FINAL BALL LOCATIONS, MAKE RANDOM BALL LOFT, ADJ BALL VELOCITY() 
	BCS BALL_ROLL_ON_GROUND_LESS_THAN_HALF_YARD                             ; DIST TO MOVE 0.5 YARD OR LESS? YES->BALL ROLL ON GROUND CONTINUE
	LDA #BALL_SHADOW_OFFSET_ON_GROUND                                                                ;
	STA ball_shadow_offset                                                  ;
	JSR ANIMATE_BALL_SPRITE_START                                           ; ANIMATE BALL SPRITE LOOP BALL GOING UP()
_END_WHILE 


BALL_ROLL_ON_GROUND_LESS_THAN_HALF_YARD:                                    ; BALL ROLL ON GROUND CONTINUE
	LDA #$00                                                                ; CLEAR BALL Z
	STA BALL_Z + 1                                                          ;
	STA BALL_Z + 2                                                          ;
	RETURN_1_FRAME
	DEC ball_shadow_offset                                                  ; BALL SHADOW OFFSET--
	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; UPDATE BALL LOC AND BALL SPRITE SHADOW AND BALL LOC()
	RETURN_1_FRAME
	DEC ball_shadow_offset                                                  ; BALL SHADOW OFFSET--
	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; UPDATE BALL LOC AND BALL SPRITE SHADOW AND BALL LOC()
	RETURN_1_FRAME
	LDA #FINAL_BALL_MOVE_FRAMES_DIV_2                                       ; SET FINAL ANIMATION LOOPS = 8 TIMES 
	STA loop_counter                                                       ;

_WHILE NOT_EQUAL                                                            ; FINAL BALL MOVE UPDATE

	RETURN_IN_NUM_FRAMES 2
	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; *** why 2 frames UPDATE BALL LOC AND BALL SPRITE SHADOW AND BALL LOC()
	DEC loop_counter                                                		; 16 FRAMES WORTH DONE?

_END_WHILE                                                                  ; NO->FINAL BALL MOVE UPDATE
	SET_BALL_COLLISION_BALL_DONT_DO_BALL_COLLISON_OR_BACKWARDS_ROT[]		; SET BALL STATUS =  DON’T TO BALL KICKED ANIMATION, DON’T DO FUMBLE/INCOMPLETE ANIMATION
	LDA #HORIZONTAL_BALL_TILE_ID                                            ; SET BALL TILE = HORIZONTAL BALL TILE
	STA BALL_SPR_TILE                                                       ;
	STA BALL_SHADOW_SPR_TILE                                                ;
	LDA #$00                                                                ; 
	STA BALL_VELOCITY_Y                                                     ; SET BALL Y VELOCITY = ZERO
	STA BALL_VELOCITY_Y + 1                                                 ;
	STA BALL_VELOCITY_X                                                     ; SET BALL X VELOCITY = ZERO
	STA BALL_VELOCITY_X + 1                                                 ;

_WHILE ALWAYS                                                               ; UPDATE BALL SPRITE TILL THREAD STOPPED

	RETURN_1_FRAME
	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; UPDATE BALL LOC AND BALL SPRITE SHADOW AND BALL LOC()
	
_END_WHILE                                                                  ; JUMP->ANIMATE BALL TILL DONE

PLAY_BALL_BOUNCE_SOUND_SET_BALL_ANI_INFO:                                    ; PLAY BOUNCE SOUND, ADJ FINAL BALL LOCATIONS, MAKE RANDOM BALL LOFT, ADJ BALL VELOCITY() 
	LDA #BALL_BOUNCE_SOUND                                                  ; LOAD BALL BOUNCE SOUND
	JSR PLAY_SOUND                                                          ; PLAY SOUND(A=SOUND)

SET_BALL_ANI_INFO_AFTER_COLLISION:                                          ; ADJ FINAL BALL LOCATIONS, MAKE RANDOM BALL LOFT, ADJ BALL VELOCITY()

distance_left_temp									= LOCAL_7
MAX_FRAMES_AFTER_BALL_HITS_GROUND_TIPPED			= $50
BALL_GRAVITY_AFTER_TIP_HIT_GROUND_CONSTANT			= $10
BALL_GRAVITY_AFTER_TIP_HIT_GROUND_RAND				= $0F					

	LDA RANDOM_3                                                            ; SET BALL LOFT = 0x00 to 0x0F BASED ON RANDOM 3D
	AND #BALL_GRAVITY_AFTER_TIP_HIT_GROUND_RAND                             ; 
	ORA #BALL_GRAVITY_AFTER_TIP_HIT_GROUND_CONSTANT                         ;
	STA BALL_GRAVITY_INDEX                                                  ; SAVE IN BALL LOFT
	LDA Y_DIST_REMAIN_BALL                                                  ; Y BALL DIST REMAIN > X BALL DIST REMAIN? 
	CMP X_DIST_REMAIN_BALL                                                  ;
	LDA Y_DIST_REMAIN_BALL + 1                                              ;
	SBC X_DIST_REMAIN_BALL + 1                                              ;
	BCC @x_dist_greater                                                           ; NO-> BRANCH TO X DISTANCE GREATER OR EQUAL

@y_dist_greater																; Y DISTANCE GREATER
	LDA Y_DIST_REMAIN_BALL                                                  ; SET FRAMES AND $44,45 = DIST REMAIN
	STA BALL_ANI_FRAMES_LEFT                                                ; 
	STA distance_left_temp                                                  ;
	LDA Y_DIST_REMAIN_BALL + 1                                              ;
	STA BALL_ANI_FRAMES_LEFT + 1                                            ;
	STA distance_left_temp+1                                                ;
	JMP @check_if_distance_less_than_half_yard                              ; JUMP->DISTANCE CHECK

@x_dist_greater:                                                            ; X DISTANCE GREATER OR EQUAL    
	LDA X_DIST_REMAIN_BALL                                                  ; SET FRAMES AND $44,45 = DIST REMAIN
	STA BALL_ANI_FRAMES_LEFT                                                ;
	STA distance_left_temp                                                  ;
	LDA X_DIST_REMAIN_BALL + 1                                              ;
	STA BALL_ANI_FRAMES_LEFT + 1                                            ;
	STA distance_left_temp + 1                                                 ;

@check_if_distance_less_than_half_yard:                                     ; DISTANCE CHECK
	LDA BALL_ANI_FRAMES_LEFT                                                ; IS DISTANCE 0.5 YARD OR LESS?
	CMP #$05                                                                ;
	LDA BALL_ANI_FRAMES_LEFT + 1                                            ;
	SBC #$00                                                                ;
	BCS @divide_distance_by_four                                            ; NO->CONTINUE
	JMP SET_FLAG_DISTANCE_REMAIN_LESS_THAN_HALF_YARD                        ; *** uneedded jump could put code right after.  YES-> DISTANCE  0.5 YARD OR LESS

@divide_distance_by_four:                                                   ; =  DIVIDE  / 4
	LSR distance_left_temp+1                                                ;
	ROR distance_left_temp                                                  ;
	LSR distance_left_temp+1                                                ;
	ROR distance_left_temp                                                  ;
	
	LDA BALL_ANI_FRAMES_LEFT                                                ; FRAMES = DISTANCE – ¼ DISTANCE 
	SEC                                                                     ;
	SBC distance_left_temp                                                  ;
	STA BALL_ANI_FRAMES_LEFT                                                ;
	LDA BALL_ANI_FRAMES_LEFT + 1                                            ;
	SBC distance_left_temp+1                                               ;
	STA BALL_ANI_FRAMES_LEFT + 1                                            ;
	
	LDA BALL_ANI_FRAMES_LEFT                                                ; ARE FRAMES < 0X50?
	CMP #MAX_FRAMES_AFTER_BALL_HITS_GROUND_TIPPED                           ;
	LDA BALL_ANI_FRAMES_LEFT + 1                                            ;
	SBC #$00                                                                ;
	BCC SET_BALL_VELOCITY_AFTER_COLLISION                                                   ; YES->SET BALL VELOCITY X/Y
	LDA #MAX_FRAMES_AFTER_BALL_HITS_GROUND_TIPPED                           ; SET MAX NUMBER OF FRAMES AFTER BALL HITS GROUND = 80 = 1.3 SEC
	STA BALL_ANI_FRAMES_LEFT                                                ;
	LDA #$00                                                                ;
	STA BALL_ANI_FRAMES_LEFT + 1                                            ;

SET_BALL_VELOCITY_AFTER_COLLISION:                                          ; SET BALL VELOCITY X/Y

velocity_table_addr				= LOCAL_1
distance_temp					= LOCAL_7
OFFSET_TO_NEXT_VEL_TABLE_ENTRY	= $0200

	LDA BALL_ANGLE                                                          ; LOAD BALL ANGLE
	ASL                                                                     ; CONVERT BALL ANGLE INTO ANGULAR VELOCITY TABLE OFFSET 
	ASL                                                                     ;
	ASL                                                                     ;
	TAX                                                                     ;
	LDA #$00                                                                ;
	ROL                                                                     ;
	TAY                                                                     ;
	TXA                                                                     ;
	CLC                                                                     ;
	ADC #<ANG_VEL_TABLE                                                     ; 
	STA velocity_table_addr                                                 ;
	TYA                                                                     ;
	ADC #>ANG_VEL_TABLE                                                     ;
	STA velocity_table_addr+1                                               ;
	LDY #$00                                                                ;
	LDA (velocity_table_addr),Y                                             ; LOAD BALL VEL Y FROM ANGULAR VELOCITY TABLE $C6EE + ANGULAR VELOCITY TABLE OFFSET
	STA BALL_VELOCITY_Y                                                     ; = VEL /16
	INY                                                                     ;
	LDA (velocity_table_addr),Y                                             ;
	LSR                                                                     ;
	ROR BALL_VELOCITY_Y                                                     ;
	LSR                                                                     ;
	ROR BALL_VELOCITY_Y                                                     ;
	LSR                                                                     ;
	ROR BALL_VELOCITY_Y                                                     ;
	LSR                                                                     ;
	ROR BALL_VELOCITY_Y                                                     ; 
	STA BALL_VELOCITY_Y + 1                                                 ; SET Y VEL = VEL /16
	
	ADD_16BIT_CONST_TO_ZP[val_addr] OFFSET_TO_NEXT_VEL_TABLE_ENTRY, velocity_table_addr 

	DEY                                                                     ;
	LDA (velocity_table_addr),Y                                             ; LOAD BALL VEL Y FROM ANGULAR VELOCITY TABLE CURRENT LOCATION  +0X200
	STA BALL_VELOCITY_X                                                     ; = VEL /16
	INY                                                                     ;  
	LDA (velocity_table_addr),Y                                             ;
	LSR                                                                     ;
	ROR BALL_VELOCITY_X                                                     ;
	LSR                                                                     ;
	ROR BALL_VELOCITY_X                                                     ;
	LSR                                                                     ;
	ROR BALL_VELOCITY_X                                                     ;
	LSR                                                                     ;
	ROR BALL_VELOCITY_X                                                     ; 
	STA BALL_VELOCITY_X + 1                                                 ; SET X VEL = VEL /16
	
@calculate_y_dist_left	
	LDA BALL_ANI_FRAMES_LEFT                                                ; LOAD PASS TIMER
	LDY BALL_VELOCITY_Y                                                     ; LOAD Y VEL
	LDX BALL_VELOCITY_Y + 1                                                 ; 
	JSR MULTIPLY_A_TIMES_X_Y                                                ; Y DIST = A * (X,Y) = Y VEL TIMES # FRAMES
	COPY_16_ZP_TO_ZP[source_dest] distance_temp, Y_DIST_REMAIN_BALL
	
	
@calculate_x_dist_left	
	LDA BALL_ANI_FRAMES_LEFT                                                ; LOAD PASS TIMER
	LDY BALL_VELOCITY_X                                                     ; LOAD X VEL
	LDX BALL_VELOCITY_X + 1                                                 ;
	JSR MULTIPLY_A_TIMES_X_Y                                                ; X DIST = A * (X,Y) = X VEL TIMES # FRAMES
	LDA BALL_ANGLE                                                          ; CONVERT BALL ANGLE INTO 8 DIRECTION INDEX
	AND #$E0                                                                ;
	LOG_SHIFT_RIGHT_4                                                       ; 
	TAX                                                                     ; PUSH ROUTINE ADDR ON STACK
	LDA BALL_ANGLE_ROUTINE_TABLE+1,X                                        ;
	PHA                                                                     ;
	LDA BALL_ANGLE_ROUTINE_TABLE,X                                           ;
	PHA                                                                     ;
	RTS                                                                     ; JUMP->ADDR PUSHED ON STACK

BALL_ANGLE_ROUTINE_TABLE: 
	.WORD BALL_ANGLE_316_TO_0_ROUTINE-1                                                    	 ; BALL ANGLE 316-0 DEGRESS ROUTINE
	.WORD BALL_ANGLE_1_TO_45_ROUTINE-1                                                   	 ; BALL ANGLE 1-45 DEGRESS ROUTINE
	.WORD BALL_ANGLE_46_TO_90_ROUTINE-1                                                    	; BALL ANGLE 46-90 DEGRESS ROUTINE
	.WORD BALL_ANGLE_91_TO_135_ROUTINE-1                                                    ;	 BALL ANGLE 91-135 DEGRESS ROUTINE
	.WORD BALL_ANGLE_180_TO_224_ROUTINE-1                                                    ; BALL ANGLE 136-180 DEGRESS ROUTINE
	.WORD BALL_ANGLE_181_TO_225_ROUTINE-1                                                    ; BALL ANGLE 181-225 DEGRESS ROUTINE
	.WORD BALL_ANGLE_226_TO_270_ROUTINE-1                                                    ; BALL ANGLE 226-270 DEGRESS ROUTINE
	.WORD BALL_ANGLE_271_TO_315_ROUTINE-1                                                    ; BALL ANGLE 271-315 DEGRESS ROUTINE

BALL_ANGLE_316_TO_0_ROUTINE:                                                                  ; BALL ANGLE 316-0 DEGRESS ROUTINE
	JSR SET_X_DIST_REMAIN_TO_MOVE_BALL                                                           ; SAVE X DISTANCE TO MOVE BALL($44,45)
	JSR CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_X                                                           ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY()
	JSR SET_FINAL_BALL_Y_LOC_BALL_MOVING_UP                                                           ; SET FINAL BALL Y LOCATION, SET BALL MOVING UP()
	JMP SET_FINAL_BALL_X_LOC_BALL_MOVING_LEFT                                                           ; SET FINAL BALL X LOCATION, SET BALL MOVING LEFT()

BALL_ANGLE_1_TO_45_ROUTINE:                                                                  ; BALL ANGLE 45-89 DEGRESS ROUTINE
	JSR SET_X_DIST_REMAIN_TO_MOVE_BALL                                                           ; SAVE X DISTANCE TO MOVE BALL($44,45)
	JSR CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_Y                                                           ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY()
	JSR SET_FINAL_BALL_Y_LOC_BALL_MOVING_UP                                                           ; SET FINAL BALL Y LOCATION, SET BALL MOVING UP()
	JMP SET_FINAL_BALL_X_LOC_BALL_MOVING_LEFT                                                           ; SET FINAL BALL X LOCATION BALL MOVING LEFT()

BALL_ANGLE_46_TO_90_ROUTINE:                                                                  ; BALL ANGLE 91-135 DEGRESS ROUTINE
	JSR SWAP_X_Y_REMAIN_DISTANCE_AND_VELOCITIES                                                           ; SWAP X AND Y BALL VELOCITIES AND DISTANCES()
	JSR CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_Y                                                           ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY()
	JSR SET_FINAL_BALL_Y_LOC_BALL_MOVING_UP                                                           ; SET FINAL BALL Y LOCATION, SET BALL MOVING UP()
	JMP SET_FINAL_BALL_X_LOC_BALL_MOVING_RIGHT                                                           ; SET FINAL BALL X LOCATION BALL MOVING RIGHT()

BALL_ANGLE_91_TO_135_ROUTINE:                                                                  ; BALL ANGLE 136-180 DEGRESS ROUTINE
	JSR SWAP_X_Y_REMAIN_DISTANCE_AND_VELOCITIES                                                           ; SWAP X AND Y BALL VELOCITIES AND DISTANCES()
	JSR CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_X                                                           ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY()
	JSR SET_FINAL_BALL_Y_LOC_BALL_MOVING_UP                                                           ; SET FINAL BALL Y LOCATION, SET BALL MOVING UP()
	JMP SET_FINAL_BALL_X_LOC_BALL_MOVING_RIGHT                                                           ; SET FINAL BALL X LOCATION BALL MOVING RIGHT()

BALL_ANGLE_180_TO_224_ROUTINE:                                                                  ; BALL ANGLE 180 DEGRESS ROUTINE
	JSR SET_X_DIST_REMAIN_TO_MOVE_BALL                                      ; SAVE X DISTANCE TO MOVE BALL ($44,45) 
	JSR CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_X                                                           ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY()
	JSR SET_FINAL_BALL_Y_LOC_BALL_MOVING_DOWN                                                           ; SET FINAL BALL Y LOCATION, SET BALL MOVING DOWN()
	JMP SET_FINAL_BALL_X_LOC_BALL_MOVING_RIGHT                                                           ; SET FINAL BALL X LOCATION BALL MOVING RIGHT()
	

BALL_ANGLE_181_TO_225_ROUTINE:                                                                  ; BALL ANGLE 225 DEGRESS ROUTINE
	JSR SET_X_DIST_REMAIN_TO_MOVE_BALL                                                           ; SAVE X DISTANCE TO MOVE BALL($44,45)
	JSR CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_Y                                                           ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY()
	JSR SET_FINAL_BALL_Y_LOC_BALL_MOVING_DOWN                                                           ; SET FINAL BALL Y LOCATION, SET BALL MOVING DOWN()
	JMP SET_FINAL_BALL_X_LOC_BALL_MOVING_RIGHT                                                           ; SET FINAL BALL X LOCATION, BALL MOVING RIGHT()

BALL_ANGLE_226_TO_270_ROUTINE:                                                                  ; BALL ANGLE 270 DEGRESS ROUTINE
	JSR SWAP_X_Y_REMAIN_DISTANCE_AND_VELOCITIES                             ; SWAP X AND Y BALL VELOCITIES AND DISTANCES()
	JSR CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_Y                                                           ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY()
	JSR SET_FINAL_BALL_Y_LOC_BALL_MOVING_DOWN                               ; SET FINAL BALL Y LOCATION, SET BALL MOVING DOWN()
	JMP SET_FINAL_BALL_X_LOC_BALL_MOVING_LEFT                               ; SET FINAL BALL X LOCATION BALL MOVING LEFT()

BALL_ANGLE_271_TO_315_ROUTINE:                                                                  ; BALL ANGLE 315 DEGRESS ROUTINE
	JSR SWAP_X_Y_REMAIN_DISTANCE_AND_VELOCITIES                             ; SWAP X AND Y BALL VELOCITIES AND DISTANCES()
	JSR CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_X                                                           ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY()
	JSR SET_FINAL_BALL_Y_LOC_BALL_MOVING_DOWN                               ; SET FINAL BALL Y LOCATION, SET BALL MOVING DOWN()
	JMP SET_FINAL_BALL_X_LOC_BALL_MOVING_LEFT                               ; SET FINAL BALL X LOCATION BALL MOVING LEFT()

SET_FLAG_DISTANCE_REMAIN_LESS_THAN_HALF_YARD:                               ; REMAINING DISTANCE 0.5 YARD OR LESS SET CARRY
	SEC                                                                     ; 
	RTS                                                                     ; RETURN

SET_X_DIST_REMAIN_TO_MOVE_BALL:                                             ; SET X DISTANCE TO MOVE BALL($44,45)

distance_temp			= LOCAL_7

	LDA distance_temp                                                       ; SET X DIST = DISTANCE
	STA X_DIST_REMAIN_BALL                                                  ;
	LDA distance_temp +1                                                     ;
	STA X_DIST_REMAIN_BALL + 1                                              ;
	RTS                                                                     ; RETURN

SWAP_X_Y_REMAIN_DISTANCE_AND_VELOCITIES:                                    ; SWAP X AND Y BALL VELOCITIES AND DISTANCES
	LDY BALL_VELOCITY_Y                                                     ; LOAD BALL VEL Y
	LDX BALL_VELOCITY_Y + 1                                                 ;
	
	COPY_16_ZP_TO_ZP[source_dest] BALL_VELOCITY_X, BALL_VELOCITY_Y

	STY BALL_VELOCITY_X                                                     ; PUT BALL VEL Y IN BALL VEL X
	STX BALL_VELOCITY_X + 1                                                 ;
	
	COPY_16_ZP_TO_ZP[source_dest] Y_DIST_REMAIN_BALL, X_DIST_REMAIN_BALL	; SET X DIST = Y DIST 
	COPY_16_ZP_TO_ZP[source_dest] distance_temp, Y_DIST_REMAIN_BALL
	RTS                                                                     ;RETURN

																			; *** could replace these two functions with one
CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_Y:                                                                  ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY
	LDY BALL_VELOCITY_Y                                                     ; ***UNEEDED
	LDX BALL_VELOCITY_Y + 1                                                 ; ***UNEEDED
	JMP SET_NUM_FRAMES_TO_TOP_OF_BALL_ARC                                   ; JUMP->CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY


CALC_INITIAL_BALL_Z_SPEED_AND_FRAMES_TO_TOP_X:                              ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY
	LDY BALL_VELOCITY_X                                                     ; ***UNEEDED
	LDX BALL_VELOCITY_X+1                                                   ; ***UNEEDED  
	JMP SET_NUM_FRAMES_TO_TOP_OF_BALL_ARC                                   ; JUMP->CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY

SET_FINAL_BALL_Y_LOC_BALL_MOVING_UP:                                                                  ; ADJUST FINAL BALL Y LOCATION, SET BALL MOVING (RIGHT, UP)
	LDA #$00                                                                ; SET BALL MOVING = RIGHT AND UP 
	STA BALL_DIRECTION                                                      ; FINAL BALL Y = BALL Y - Y DISTANCE TO MOVE 
	LDA BALL_Y + 1                                                          ;
	SEC                                                                     ;
	SBC Y_DIST_REMAIN_BALL                                                  ;
	STA FINAL_BALL_Y                                                        ;
	LDA BALL_Y + 2                                                          ;
	SBC Y_DIST_REMAIN_BALL + 1                                              ;
	STA FINAL_BALL_Y + 1                                                    ; 
	RTS                                                                     ; RETURN

SET_FINAL_BALL_Y_LOC_BALL_MOVING_DOWN:                                                                  ; ADJUST FINAL BALL Y LOCATION, SET BALL MOVING (RIGHT, DOWN)
	LDA #$40                                                                ; SET BALL MOVING = DOWN
	STA BALL_DIRECTION                                                      ; FINAL BALL Y = BALL Y + Y DISTANCE TO MOVE 
	LDA BALL_Y + 1                                                          ;
	CLC                                                                     ;
	ADC Y_DIST_REMAIN_BALL                                                  ;
	STA FINAL_BALL_Y                                                        ;
	LDA BALL_Y + 2                                                          ;
	ADC Y_DIST_REMAIN_BALL + 1                                              ;
	STA FINAL_BALL_Y + 1                                                    ;
	RTS                                                                     ; RETURN

SET_FINAL_BALL_X_LOC_BALL_MOVING_LEFT:                                                                  ; ADJUST FINAL BALL X LOCATION BALL MOVING LEFT
	LDA BALL_X + 1                                                          ; FINAL BALL X = BALL X - X DISTANCE TO MOVE 
	SEC                                                                     ;
	SBC X_DIST_REMAIN_BALL                                                  ;
	STA FINAL_BALL_X                                                        ;
	LDA BALL_X + 2                                                          ;
	SBC X_DIST_REMAIN_BALL + 1                                              ;
	STA FINAL_BALL_X + 1                                                    ;
	CLC                                                                     ;
	RTS                                                                     ; RETURN

SET_FINAL_BALL_X_LOC_BALL_MOVING_RIGHT:                                                                  ; ADJUST FINAL BALL X LOCATION, SET BALL MOVING RIGHT 
	LDA BALL_DIRECTION                                                      ; SET BALL MOVING = RIGHT
	ORA #$80                                                                ;
	STA BALL_DIRECTION                                                      ;
	LDA BALL_X + 1                                                          ; FINAL BALL X = BALL X + X DISTANCE TO MOVE
	CLC                                                                     ;
	ADC X_DIST_REMAIN_BALL                                                  ;
	STA FINAL_BALL_X                                                        ;
	LDA BALL_X + 2                                                          ;
	ADC X_DIST_REMAIN_BALL + 1                                              ;
	STA FINAL_BALL_X + 1                                                    ;
	CLC                                                                     ;
	RTS                                                                     ; RETURN
	
_F}_BALL_ROLL_ON_GROUND_ANIMATION_LOOP	

_F{_MAIN_BALL_ANIMATION_LOOP												; DONE

ANIMATE_BALL_SPRITE_START:                                               ; ANIMATE BALL SPRITE LOOP BALL GOING UP

_WHILE CC

	RETURN_1_FRAME
	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; UPDATE BALL LOC AND BALL SPRITE SHADOW AND BALL LOC()
	JSR UPDATE_BALL_Z_AND_ANI_FRAMES_GOING_UP                               ; UPDATE BALL Z AND BALL TIMER BALL MOVING UP()
	
_END_WHILE                                       							; BALL STARTING TO COME DOWN?NO->ANIMATE BALL SPRITE LOOP BALL GOING UP
	JMP ANIMATE_BALL_SPRITE_GOING_DOWN                                      ; YES-> ANIMATE BALL SPRITE LOOP BALL GOING DOWN_2

_WHILE NOT_EQUAL                                                            ; ANIMATE BALL SPRITE LOOP BALL GOING DOWN
	RETURN_1_FRAME
	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; UPDATE BALL LOC AND BALL SPRITE SHADOW AND BALL LOC()

ANIMATE_BALL_SPRITE_GOING_DOWN:                                             ; ANIMATE BALL SPRITE LOOP BALL GOING DOWN_2
	JSR UPDATE_BALL_Z_AND_ANI_FRAMES_GOING_DOWN                             ; UPDATE BALL Z AND BALL TIMER BALL COMING DOWN()
_END_WHILE                                                                  ; TIMER DONE? NO->ANIMATE BALL SPRITE LOOP BALL GOING DOWN

																			; CHECK FOR BALL OUT OF BOUNDS OR PAST ENDZONE
	LDA #$00                                                                ; 
	STA BALL_Z + 1                                                          ; CLEAR BALL Z MID
	STA BALL_Z + 2                                                          ; CLEAR BALL Z HIGH
	LDA BALL_Y + 1                                                          ; LOAD BALL Y

@check_ball_oob:	
	CMP #(OUT_OF_BOUNDS_TOP_Y + $08)                                        ; BALL ABOVE TOP OOB? 
	BCC @set_ball_oob_stop_clock                                            ; YES->BALL OUT OF BOUNDS
	CMP #(OUT_OF_BOUNDS_BOT_Y + $08)                                        ; BALL BELOW BOTTOM OOB?
	BCS @set_ball_oob_stop_clock                                            ; YES->BALL OUT OF BOUNDS
	
@check_ball_past_left_endzone:	
	LDA BALL_X + 1                                                          ; IS BALL LOC < BACK OF P1 ENDZONE $0620?
	CMP #<BACK_LEFT_ENDZONE                                                 ;
	LDA BALL_X + 2                                                          ;
	SBC #>BACK_LEFT_ENDZONE                                                 ;
	BCC @set_ball_oob_stop_clock                                            ; YES->BALL OUT OF BOUNDS

@check_ball_past_right_endzone:	
	LDA BALL_X + 1                                                          ; IS BALL LOC >BACK OF P2 ENDZONE $09E0? 
	CMP #<BACK_RIGHT_ENDZONE                                                ; 
	LDA BALL_X + 2                                                          ;
	SBC #>BACK_RIGHT_ENDZONE                                                ;
	BCC @exit                                                               ; NO->BALL IN BOUNDS

@set_ball_oob_stop_clock:                                                   ; BALL OUT OF BOUNDS
	RETURN_IN_NUM_FRAMES 4
	LDA #$00                                                                ; SET CLOCK STATUS = STOPPED
	STA CLOCK_RUN_TYPE                                                      ; 
	SET_BALL_STATUS_SPECIAL_BALL_OOB[]
	SET_PLAY_STATUS_PLAY_OVER[]                                             ;

@exit:                                                                       ; BALL IN BOUNDS
	RTS                                                                     ; RETURN

_F}_MAIN_BALL_ANIMATION_LOOP

_F{_BALL_TIPPED_ANIMATION													; DONE

START_BALL_BLOCKED_TIPPED_ANIMATION:                                        ; START OF BALL BLOCKED/TIPPED

BALL_TIPPED_BALL_SPEED 				= $30 
BALL_TIPPED_MIN_DISTANCE			= $30
BALL_TIPPED_RANDOM_DISTANCE_MAX		= $3F

BALL_TIPPED_BALL_SHADOW_OFFSET		= $12 
current_ball_shadow_offset			= LOCAL_1

	LDX #BALL_ANIMATION_STACK_INDEX                                         ; SET STACK POINTER = BALL ANIMATION STACK
	TXS                                                                     ;
	LDA #(BALL_MOVING_BITFLAG + BALL_UPDATE_SCROLL_BITFLAG + BALL_DO_COLL_ANI_BITFLAG)	                                                                
	STA BALL_COLLISION                                                      ;
	LDA SOFT_CHR_1800_BANK                                                  ; DOES CHR $1800 BANK = JUMPING SPRITES
	CMP #QB_THROW_JUMP_NO_TIP_BALL_CHR_BANK                                 ; 
	BNE @set_tipped_ball_speed_distance                                     ; NO->SET TIPPED BALL SPEED AND RANDOM DISTANCE

	
	LDA #TIPPED_BALL_CHR_BANK                                               ; ELSE SET CHR $1800 BANK = NORMAL CHR 1800 BANK WITH TIPPED BALL ANIMATION
	STA SOFT_CHR_1800_BANK                                                  ;

@set_tipped_ball_speed_distance:                                            ; SET TIPPED BALL SPEED AND RANDOM DISTANCE
	LDA #BALL_TIPPED_BALL_SPEED                                             ; SET BALL SPEED = 30 = BALL BLOCKED SPEED
	STA BALL_SPEED                                                          ; 
	RETURN_1_FRAME    
	LDA RANDOM_2                                                            ; MAKE DISTANCE = RANDOM
	AND #BALL_TIPPED_RANDOM_DISTANCE_MAX                                    ; = (0 to 8 yards)
	CLC                                                                     ;
	ADC #BALL_TIPPED_MIN_DISTANCE                                           ; + 6 YARDS = (6 TO 14) 
	STA Y_DIST_REMAIN_BALL                                                  ; SAVE DISTANCE IN X AND Y DISTANCE REMAINING
	STA X_DIST_REMAIN_BALL                                                  ;
	LDA #$00                                                                ;
	ADC #$00                                                                ;
	STA Y_DIST_REMAIN_BALL + 1                                              ;
	STA X_DIST_REMAIN_BALL + 1                                              ;
	LDA RANDOM_2                                                            ; SET BALL ANGLE = RANDOM ANGLE 
	STA BALL_ANGLE                                                          ; 
	JSR SET_BALL_ANI_INFO_AFTER_COLLISION                                   ;
	BCC @do_ball_tipped_animation                                           ; DIST TO MOVE 0.5 YARD OR LESS? NO->
	JMP BALL_ROLL_ON_GROUND_LESS_THAN_HALF_YARD                                    ; YES->BALL ROLL ON GROUND ANIMATION START

@do_ball_tipped_animation:                                                  ; DO BALL TIP ANIMATION
	LDA #BALL_TIPPED_BALL_SHADOW_OFFSET                                     ; SET FINAL BALL ANIMATION TIMER / SHADOW OFFSET
	STA current_ball_shadow_offset                                                                 ; 
	JSR ANIMATE_BALL_SPRITE_START                                           ; ANIMATE BALL SPRITE LOOP BALL GOING UP()
	LDA BALL_VELOCITY_Z + 2                                                 ; IS BALL Z VELOCITY MAJOR BYTE >= 1 
	BNE @do_final_tip_animation                                             ; YES->DO FINAL MAX 18 FRAME(0.3SEC) TIP ANIMATION
	LDA #$01                                                                ; SET BALL Z VELOCITY MAJOR BYTE = 1
	STA BALL_VELOCITY_Z + 2                                                 ;

@do_final_tip_animation:                                                    ; DO FINAL MAX 18 FRAME(0.3SEC) TIP ANIMATION

_WHILE CS	
	RETURN_1_FRAME  
	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; UPDATE BALL ANIMATION SPRITES()
	LDA current_ball_shadow_offset                                          ; FINAL BALL ANIMATION TIMER -- 
	SEC                                                                     ;
	SBC BALL_VELOCITY_Z + 2                                                 ;
	STA current_ball_shadow_offset                                          ;
	BCC @tipped_ball_hit_ground                                             ; 
	CMP #$04                                                                ; DONE?
_END_WHILE                                                                  ; NO-> DO FINAL MAX 18 FRAME(0.3SEC) TIP ANIMATION

@tipped_ball_hit_ground:                                                    ;
	LDA #SPRITE_OFFSCREEN                                                   ; SET LANDING MARKER “X”  SPR Y LOC  = OFFSCREEN
	STA BALL_MARKER_SPR_Y                                                   ;
	LDA BALL_COLLISION                                                      ; SET BALL STATUS = BALL COLLIDED, DO FUMBLE/INCOMPLETE ANIMATION    
	ORA #(BALL_COLLIDED_BITFLAG + BALL_DO_COLL_ANI_BITFLAG)                 ; 
	STA BALL_COLLISION                                                      ;
	JMP BALL_ROLLING_ON_GROUND_TIPPED_ANI_START                             ; JUMP-> BALL ROLLING ON GROUND ANIMATION START

_F}_BALL_TIPPED_ANIMATION

_F{_BALL_FUMBLED_ANIMATION													; DONE 

START_BALL_FUMBLE_ANIMATION:                                                ; START OF FUMBLE ANIMATION

INITIAL_FUMBLE_DISTANCE		= $40											; 8 yards in x and y 

	LDX #BALL_ANIMATION_STACK_INDEX                                         ; SET STACK = BALL ANIMATION
	TXS                                                                     ;
	LDA #(BALL_MOVING_BITFLAG + BALL_COLLIDED_BITFLAG + BALL_UPDATE_SCROLL_BITFLAG + BALL_DO_COLL_ANI_BITFLAG)                                                               
	STA BALL_COLLISION                                                      ; 
	LDA SOFT_CHR_1800_BANK                                                  ; DOES SOFT SPRITE CHR $1800 = ARM IN MOTION?
	CMP #QB_THROW_JUMP_NO_TIP_BALL_CHR_BANK                                 ;
	BNE @set_init_fumble_dist                                               ; NO->SET INITIAL FUMBLE DISTANCE
	LDA #DEFAULT_PLAYER_ANI_1800_CHR_BANK                                   ; SET SOFT SPRITE CHR $1800 = NORMAL CHR 1800 BANK  
	STA SOFT_CHR_1800_BANK                                                  ;
	
@set_init_fumble_dist:                                                      ; SET INITIAL FUMBLE DISTANCE
	RETURN_1_FRAME
	LDA #INITIAL_FUMBLE_DISTANCE                                            ; 
	STA Y_DIST_REMAIN_BALL                                                  ; SET Y DISTANCE = 8 YARDS
	STA X_DIST_REMAIN_BALL                                                  ; SET X DISTANCE = 8 YARDS
	LDA #$00                                                                ;
	STA Y_DIST_REMAIN_BALL + 1                                              ;
	STA X_DIST_REMAIN_BALL + 1                                              ;
	JMP BALL_ROLLING_ON_GROUND_TIPPED_ANI_START                                    ; JUMP-> BALL ROLLING ON GROUND ANIMATION START

_F}_BALL_FUMBLED_ANIMATION

_F{_UNUSED_BALL_ANIMATION													;  DONE  *** UNUSED can remove 

UNUSED_BALL_ANIMATION_START:                                                ; BALL ANIMATION START
	STA LOCAL_2                                                             ; SAVE TIME IN $3F
	
_WHILE NOT_EQUAL                                                            ; BALL GOING UP ANIMATION LOOP

	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; UPDATE BALL SPRITE AND BALL SHADOW LOCATIONS()
	JSR UPDATE_BALL_Z_AND_ANI_FRAMES_GOING_UP                               ; UPDATE BALL Z AND BALL TIMER BALL MOVING UP()
	BCS @ball_going_down                                                    ; BALL STARTING TO COME DOWN? YES->UPDATE BALL SPRITE, LOFT, BALL TIMER(3F=Time)
	DEC LOCAL_2                                                             ;
	
_END_WHILE                                                                  ; 
	RTS                                                                     ; RETURN
							
@loop:                                                                  ; BALL GOING DOWN ANIMATION LOOP
	JSR UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC                                 ; UPDATE BALL LOC AND BALL SPRITE SHADOW AND BALL LOC()

@ball_going_down:                                                          ; BALL GOING DOWN ANIMATION LOOP START
	JSR UPDATE_BALL_Z_AND_ANI_FRAMES_GOING_DOWN                             ; UPDATE BALL Z AND BALL TIMER BALL COMING DOWN()
	DEC LOCAL_2                                                             ; TIMER DONE?
	BNE @loop                                                               ; NO-> UPDATE BALL SPRITE, LOFT, BALL TIMER LOOP START
	RTS                                                                     ; RETURN
																			; END OF UNUSED
_F}_UNUSED_BALL_ANIMATION	

_F{_UPDATE_BALL_AND_SHADOW_SPR_INFO											 ; DONE

UPDATE_BALL_LOC_AND_BALL_SHADOW_LOC:                                        ; UPDATE BALL LOCATION AND BALL SPRITE SHADOW AND BALL LOC()

ball_shadow_sprite_y_add_offset		= LOCAL_1
ball_tile_table_index				= LOCAL_8

	BIT BALL_DIRECTION                                                      ; IS BALL MOVING UP?
	BVC @update_ball_y_moving_up                                            ; YES-> BALL MOVING UP

@update_ball_y_moving_down                                                  ; BALL MOVING DOWN

	ADD_16_BIT_VAL_TO_24BIT_VAL_RAM[addr16_addr24] BALL_VELOCITY_Y, BALL_Y  
	JMP @update_ball_x                                                      ; JUMP TO UPDATE BALL X LOCATION
	
@update_ball_y_moving_up:                                                   ; BALL MOVING UP
	SUB_16_BIT_VAL_FROM_24BIT_VAL_RAM[addr16_addr24] BALL_VELOCITY_Y, BALL_Y
	
@update_ball_x:                                                             ; UPDATE BALL X LOCATION
	BIT BALL_DIRECTION                                                      ; IS BALL MOVING LEFT?
	BPL @update_ball_x_moving_left                                          ; YES-> BALL MOVING LEFT
	
@update_ball_x_moving_right 
    ADD_16_BIT_VAL_TO_24BIT_VAL_RAM[addr16_addr24] BALL_VELOCITY_X, BALL_X
	JMP @update_ball_sprite_locations                                       ;
	
@update_ball_x_moving_left:                                                 ; BALL MOVING LEFT
	SUB_16_BIT_VAL_FROM_24BIT_VAL_RAM[addr16_addr24] BALL_VELOCITY_X, BALL_X
	
@update_ball_sprite_locations:                                              ; UPDATE BALL,BALL SHADOW SPR SCREEN LOCATION
	LDA BALL_Y + 1                                                          ; SET BALL SHADOW SPR Y = BALL Y + 1 + 02  
	CLC                                                                     ;
	ADC #$02                                                                ;
	STA BALL_SHADOW_SPR_Y                                                   ; 
	SEC                                                                     ;
	SBC ball_shadow_sprite_y_add_offset                                     ; - BALL OFFSET
	SBC BALL_Z + 1                                                          ; - BALL LOFT
	BCS @save_ball_spr_y                                                    ; IS BALL OFFSCREEN? NO->
	LDA #SPRITE_OFFSCREEN                                                   ; SET BALL SPR Y = OFFSCREEN

@save_ball_spr_y:                                                           ; SET BALL SPR Y LOC 
	STA BALL_SPR_Y                                                          ; SAVE BALL SPR Y 
	
@check_for_update_screen_scroll:	
	LDA BALL_COLLISION                                                      ; DOES BALL STATUS = UPDATE SCREEN SCROLL?
	AND #(BALL_UPDATE_SCROLL_BITFLAG)                                       ;
	BEQ @calculate_ball_x_locations                                         ; NO->SET BALL SPR,SHADOW  X LOC
	
@update_screen_scroll:	
	LDY BALL_X + 1                                                          ; LOAD BALL X LOC
	LDX BALL_X + 2                                                          ;
	JSR UPDATE_SCROLL_LOCATION_DIRECTION                                    ; UPDATE SCROLL LOCATION AND DIRECTION(X,Y= BALL OR PLAYER HIGH,MID LOCATION)

@calculate_ball_x_locations:                                                ; SET BALL SPR,SHADOW  X LOC
	LDA BALL_X + 1                                                          ; BALL SHADOW SPR X  = BALL X – OFFSET TO MIDDLE OF BALL – SCROLL X LOCATION
	SEC                                                                     ;
	SBC #$04                                                                ;
	TAX                                                                     ;
	LDA BALL_X + 2                                                          ;
	SBC #$00                                                                ;
	TAY                                                                     ;
	TXA                                                                     ;
	SEC                                                                     ;
	SBC CURR_X_SCROLL                                                       ;
	TAX                                                                     ;
	TYA                                                                     ;
	SBC CURR_X_SCROLL + 1                                                   ;
	BNE @set_sprites_offscreen                                              ; IS BALL ONSCREEN? NO->SET BALL AND SHADOW SPR Y = OFFSCREEN
	
@set_sprite_x_locations: 
	STX BALL_SHADOW_SPR_X                                                    ; SAVE BALL SHADOW SPR X = X SCREEN LOCATION
	STX BALL_SPR_X                                                          ; SET BALL SPR X = X SCREEN LOCATION
	JMP @check_for_ball_sprite_ani_type                                     ; 
	
@set_sprites_offscreen:                                                     ; SET BALL AND SHADOW SPR Y = OFFSCREEN
	LDA #SPRITE_OFFSCREEN                                                   ;
	STA BALL_SHADOW_SPR_Y                                                   ; SET BALL SHADOW SPR Y = OFFSCREEN
	STA BALL_SPR_Y                                                          ; SET BALL SPR Y = OFFSCREEN

@check_for_ball_sprite_ani_type:                                            ; CHECK FOR BALL KICKED OFF

@check_for_ball_kicked: 
	LDA BALL_COLLISION                                                      ; DOES BALL STATUS = DO BALL KICKED ANIMATION
	LSR                                                                     ;
	BCS @invert_ball_angle                          						; YES->UPDATE BALL,BALL SHADOW, AND LANDING MARKER SPRITES BALL KICKED
	
@check_for_fumble_tip_ball_collide:	
	LSR                                                                     ; DOES BALL STATUS = DO FUMBLE/INCOMPLETE ANIMATION
	BCC SET_LANDING_MARKER_ON_OFF                                           ; NO->CHECK FOR BALL LANDING MARKER ONSCREEN OR OFFSCREEN
	
@update_ball_angle: 	
	LDA BALL_ANGLE                                                          ; = BALL ANGLE + SIZE OF BALL TABLE ENTRY 
	CLC                                                                     ;
	ADC #$10                                                                ;
	JMP @update_ball_shadow_and_marker_spr_info                             ; JUMP->UPDATE BALL,BALL SHADOW, AND LANDING MARKER SPRITES

@invert_ball_angle:                                                         ; UPDATE BALL,BALL SHADOW, AND LANDING MARKER SPRITES BALL KICKED
	LDA BALL_ANGLE                                                          ; INVERT BALL ANGLE
	EOR #$80                                                                ;

@update_ball_shadow_and_marker_spr_info:                                    ; UPDATE BALL,BALL SHADOW, AND LANDING MARKER SPRITES
	AND #$E0                                                                ; MAKE ANGLES 45 DEGREE INCREMENTS
	LSR                                                                     ; 
	STA ball_tile_table_index                                               ;
	LDA FRAME_COUNTER                                                       ; SET INDEX INTO ROTATING BALL SPR NFO TABLE  = FRAME COUNTER + BALL ANGLE
	AND #$0C                                                                ; offset to 
	CLC                                                                     ;
	ADC ball_tile_table_index                                               ; 
	TAX                                                                     ;
	LDA ROTATING_BALL_SPRITE_INFO_TABLE_EIGHT_DIR,X                         ; SET BALL SPRITE TILE FROM ROTATING BALL TILE INFO TABLE
	STA BALL_SPR_TILE                                                       ;
	LDA ROTATING_BALL_SPRITE_INFO_TABLE_EIGHT_DIR+1,X                       ; SET BALL SHADOW TILE FROM ROTATING BALL TILE INFO TABLE   
	STA BALL_SHADOW_SPR_TILE                                                ;
	LDA ROTATING_BALL_SPRITE_INFO_TABLE_EIGHT_DIR+2,X                       ; SET BALL SPRITE ATTR FROM ROTATING BALL TILE INFO TABLE  
	STA BALL_SPR_ATTR                                                       ; 
	ORA #$01                                                                ; SET BALL SHADOW ATTRIB
	STA BALL_SHADOW_SPR_ATTR                                                ;
	
SET_LANDING_MARKER_ON_OFF:                                                  ; CHECK FOR BALL LANDING MARKER ONSCREEN OR OFFSCREEN
	BIT BALL_COLLISION                                                      ; DOES BALL STATUS = BALL COLLIDED
	BVS @exit                                                               ; YES->EXIT
	LDA FINAL_BALL_X                                                        ; IS BALL FINAL X LOCATION =  ON SCREEN?
	SEC                                                                     ;
	SBC #$04                                                                ;
	TAX                                                                     ;
	LDA FINAL_BALL_X + 1                                                    ;
	SBC #$00                                                                ;
	TAY                                                                     ;
	TXA                                                                     ;
	SEC                                                                     ;
	SBC CURR_X_SCROLL                                                       ;
	TAX                                                                     ;
	TYA                                                                     ;
	SBC CURR_X_SCROLL + 1                                                   ;
	BNE @set_ball_marker_offscreen                                          ; NO->SET LANDING MARKER SPRITE OFFSCREEN
	STX BALL_MARKER_SPR_X                                                   ; SET LANDING MARKER “X”  SPR X LOC  
	LDA FINAL_BALL_Y                                                        ; SET LANDING MARKER “X”  SPR Y LOC  
	STA BALL_MARKER_SPR_Y                                                   ;
	RTS                                                                     ; RETURN
@set_ball_marker_offscreen:                                                 ; SET LANDING MARKER SPRITE OFFSCREEN
	LDA #SPRITE_OFFSCREEN                                                   ; SET LANDING MARKER “X”  SPR Y LOC  = OFFSCREEN
	STA BALL_MARKER_SPR_Y                                                   ;
@exit:                                                                  ; EXIT
	RTS                                                                     ; RETURN

_F}_UPDATE_BALL_AND_SHADOW_SPR_INFO

_F{_UPDATE_BALL_Z_SPEED_AND_LOC											    ; DONE

UPDATE_BALL_Z_AND_ANI_FRAMES_GOING_UP:                                      ; UPDATE BALL Z AND BALL TIMER BALL MOVING UP()
	SUB_16_BIT_VAL_FROM_24BIT_VAL_RAM[addr16_addr24] BALL_GRAVITY, BALL_VELOCITY_Z 
	
@set_ball_coming_down_if_vel_neg_zero                                       ; 
	BCC SET_BALL_STATUS_COMING_DOWN                                         ; BALL Z SPEED <= 0 YES->SET BALL STATUS = BALL COMING DOWN

@update_ball_z_loc: 
	ADD_16_BIT_VAL_TO_24BIT_VAL_RAM[addr16_addr24] BALL_VELOCITY_Z+1, BALL_Z ; BALL Z = BALL Z + BALL SPEED(DISTANCE/FRAME)

@update_animation_frames                                                    ; 
	
	LDA BALL_ANI_FRAMES_LEFT                                                ; PASS FRAMES LEFT --
	SEC                                                                     ;
	SBC #$01                                                                ;
	STA BALL_ANI_FRAMES_LEFT                                                ;
	LDA BALL_ANI_FRAMES_LEFT + 1                                            ;
	SBC #$00                                                                ;
	STA BALL_ANI_FRAMES_LEFT + 1                                            ;
	CLC                                                                     ;
	RTS                                                                     ; RETURN
	
SET_BALL_STATUS_COMING_DOWN:                                                ; SET BALL STATUS = BALL COMING DOWN
	SET_BALL_COLLISION_BALL_COMING_DOWN[]
	SEC                                                                     ; SEC= INDICATE BALL COMING DOWN 
	RTS                                                                     ; RETURN

UPDATE_BALL_Z_AND_ANI_FRAMES_GOING_DOWN:                                    ; UPDATE BALL Z AND BALL TIMER BALL COMING DOWN ()
    
@update_ball_velocity:														; update ball z velocity due to gravity	
	ADD_16_BIT_VAL_TO_24BIT_VAL_RAM[addr16_addr24] BALL_GRAVITY, BALL_VELOCITY_Z 
	
@update_ball_z_loc
	SUB_16_BIT_VAL_FROM_24BIT_VAL_RAM[addr16_addr24] BALL_VELOCITY_Z+1, BALL_Z ; BALL Z = BALL Z - BALL SPEED(DISTANCE/FRAME)
 
	
@update_animation_frames 
	LDA BALL_ANI_FRAMES_LEFT                                                ; PASS FRAMES LEFT --
	SEC                                                                     ;
	SBC #$01                                                                ;
	STA BALL_ANI_FRAMES_LEFT                                                ;
	LDA BALL_ANI_FRAMES_LEFT + 1                                            ;
	SBC #$00                                                                ;
	STA BALL_ANI_FRAMES_LEFT + 1                                            ;
	ORA BALL_ANI_FRAMES_LEFT                                                ;
	RTS                                                                     ; RETURN

_F}_UPDATE_BALL_Z_SPEED_AND_LOC

_F{_SET_FRAMES_TO_REACH_WR_AND_FINAL_LOC_INIT_BALL_Z_SPEED					; DONE
	
SET_PASS_FRAMES_INIT_BALL_Z_SPEED_AND_BALL_GRAV:                            ; CALCULATE PASS TIME

ball_velocity_temp 			= LOCAL_3
frames_to_top_of_ball_arc	= LOCAL_3
total_ball_ani_frames		= LOCAL_6 
ball_velocity_z_temp		= LOCAL_7
ball_gravity_temp			= LOCAL_6



	STY ball_velocity_temp                                                  ; SAVE VELOCITY 
	STX ball_velocity_temp + 1                                             	;
																			; FRAMES = DISTANCE/ VELOCITY
	JSR DIVIDE_16_BIT_FRACTIONAL                                            ;  ( $44,$45) DIVIDE BY 2 BYTE($40,$41) WITH FRACT REM $43,($44,$45) 
	RETURN_1_FRAME
	LDA total_ball_ani_frames + 1                                           ; SET PASS TIMER(AC,AD) = TOTAL # FRAMES
	STA BALL_ANI_FRAMES_LEFT + 1                                            ; SET 40,41 = TOTAL # FRAMES/2 = TIME TO PEAK OF BALL ARC
	LSR                                                                     ;
	STA frames_to_top_of_ball_arc + 1                                       ; 
	LDA total_ball_ani_frames                                               ;
	STA BALL_ANI_FRAMES_LEFT                                                ;
	ROR                                                                     ;
	STA frames_to_top_of_ball_arc                                           ; 
	
INIT_BALL_Z_SPEED_AND_GRAVITY:                                              ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY
	LDA #$00                                                                ;
	STA BALL_Z                                                              ; SET BALL Z LOC = ZERO
	STA BALL_Z + 1                                                          ;
	STA BALL_Z + 2                                                          ;
	STA BALL_VELOCITY_Z                                                     ;
	LDA BALL_GRAVITY_INDEX                                                  ; LOAD BALL LOFT INDEX
	AND #$0F                                                                ; MASK OUT UPPER BITS and SHIFT SINCE TABLE ENTRY TWO BYTES
	ASL                                                                     ;
	TAX                                                                     ;
	LDA BALL_Z_INITIAL_VEL_TABLE,X                                          ; SET BALL Z VELOCITY  FROM BALL Z EXIT VELOCITY TABLE
	STA BALL_VELOCITY_Z + 1                                                 ;
	STA ball_velocity_z_temp                                                ;
	LDA BALL_Z_INITIAL_VEL_TABLE+1,X                                        ; 
	STA BALL_VELOCITY_Z + 2                                                 ;
	STA ball_velocity_z_temp +1                                             ;
																			; BALL Z SPEED / FRAMES TO PEAK 
	JSR DIVIDE_16_BIT_FRACTIONAL                                            ; ( $44,$45) DIVIDE BY 2 BYTE($40,$41) WITH FRACT REM $43,($44,$45) 
	LDA ball_gravity_temp + 2                                               ;
	BNE @math_over_flow_distance_too_short                                  ;
	LDA ball_gravity_temp                                                   ; SAVE BALL Z  “GRAVITY” 
	STA BALL_GRAVITY                                                        ; 
	LDA ball_gravity_temp + 1                                               ;
	STA BALL_GRAVITY + 1                                                    ;
	CLC                                                                     ;
	RTS                                                                     ; RETURN
	
@math_over_flow_distance_too_short:                                           ; YES->NEED TO INVERT BALL ANGLE
	SEC                                                                     ;
	RTS                                                                     ; RETURN
	
SET_NUM_FRAMES_TO_TOP_OF_BALL_ARC:                                          ; CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY
	LDA BALL_ANI_FRAMES_LEFT + 1                                            ; SET $40,41 = PASS FRAMES /2= TOP OF BALL ARC 
	LSR                                                                     ;
	STA frames_to_top_of_ball_arc+1                                         ;
	LDA BALL_ANI_FRAMES_LEFT                                                ;
	ROR                                                                     ;
	STA frames_to_top_of_ball_arc                                           ;
	JMP INIT_BALL_Z_SPEED_AND_GRAVITY                                       ; JUMP->CALCULATE INITIAL BALL LOFT SPEED AND BALL GRAVITY
	
_F}_SET_FRAMES_TO_REACH_WR_AND_FINAL_LOC_INIT_BALL_Z_SPEED	

_F{_BALL_Z_INIT_VELOCITY_TABLE												; DONE

BALL_Z_INITIAL_VEL_TABLE:                                                   ; BALL Z EXIT VELOCITY TABLE

.DB $80 , $01                                                               ; 0X00 BALL LOFT FOR 6,13  PS  (KICKOFF)
.DB $64 , $01                                                               ; 0X01 BALL LOFT FOR 19,25 PS
.DB $48 , $01                                                               ; 0X02 BALL LOFT FOR 31,38 PS  (PUNT)
.DB $2C , $01                                                               ; 0X03 BALL LOFT FOR 44,50 PS
.DB $10 , $01                                                               ; 0X04 BALL LOFT FOR 56,63 PS
.DB $F4 , $00                                                               ; 0X05 BALL LOFT FOR 69,75 PS
.DB $D8 , $00                                                               ; 0X06 BALL LOFT FOR 81    PS  (SHOTGUN,PITCH)
.DB $BC , $00                                                               ; 0X07 BALL LOFT FOR 88    PS
.DB $72 , $01                                                               ; 0X08 BALL LOFT FOR 94    PS
.DB $54 , $01                                                               ; 0X09 BALL LOFT FOR 100   PS
.DB $36 , $01                                                               ; 0X0A 
.DB $18 , $01                                                               ; 0X0B 
.DB $FA , $00                                                               ; 0X0C 
.DB $DC , $00                                                               ; 0X0D 
.DB $BE , $00                                                               ; 0X0E 
.DB $A0 , $00                                                               ; 0X0F (ONSIDES KICK)

_F}_BALL_Z_INIT_VELOCITY_TABLE

_F{_PASS_BALL_AND_ROTATATING_BALL_TILE_TABLES								; DONE

PASS_BALL_SPRITE_TABLE_EIGHT_DIR:                                           ; BALL IN AIR TILE ID AND ATTRIB TABLE
																			; TILE ID, ATTRIBUTE
.DB HORIZONTAL_BALL_TILE_ID, $00                                            ; 0 degrees
.DB FORTY_FIVE_BALL_TILE_ID, $00                                            ; 45 degrees
.DB VERTICAL_BALL_TILE_ID, $00                                              ; 90 degrees
.DB FORTY_FIVE_BALL_TILE_ID, $40                                            ; 135 degrees
.DB HORIZONTAL_BALL_TILE_ID, $40                                            ; 180 degrees
.DB FORTY_FIVE_BALL_TILE_ID, $C0                                            ; 225 degrees
.DB VERTICAL_BALL_TILE_ID, $80                                              ; 270 degrees
.DB FORTY_FIVE_BALL_TILE_ID, $80                                            ; 315 degrees

								
ROTATING_BALL_SPRITE_INFO_TABLE_EIGHT_DIR:                                  ; FUMBLE/INCOM BALL SPRITE TILES AND ATTRIBUTES
																			; BALL TILE, BALL SHADOW TILE, ATTRIBUTE, UNUSED

.DB $A3,$AD,$40,$00                                                         ; 0 DEGREES POSSIBLE VALUES
.DB $A1,$A5,$00,$00
.DB $A3,$AD,$00,$00
.DB $A9,$A9,$00,$00

@forty_five_degree_ball_tiles: 
.DB $AD,$AD,$00,$00                                                         ; 45 DEGREES POSSIBLE VALUES
.DB $A7,$A7,$00,$00
.DB $AB,$AB,$00,$00
.DB $A3,$A3,$00,$00

@ninety_degree_ball_tiles:                                                   ; 90 DEGREES POSSIBLE VALUES
.DB $AB,$AD,$00,$00
.DB $A5,$A1,$00,$00
.DB $AB,$AD,$00,$00
.DB $A1,$A5,$00,$00

@one_thirty_five_degree_ball_tiles:                                          ; 135 DEGREES POSSIBLE VALUES
.DB $AD,$AD,$00,$00
.DB $A7,$A7,$00,$00
.DB $AB,$AB,$00,$00
.DB $A3,$A3,$00,$00

@one_eighty_degree_ball_tiles:                                              ; 180 DEGREES POSSIBLE VALUES
.DB $A9,$A9,$00,$00 
.DB $A3,$AD,$00,$00
.DB $A1,$A5,$00,$00
.DB $A3,$AD,$40,$00

@two_twenty_five_degree_ball_tiles:                                         ; 225 DEGREES POSSIBLE VALUES
.DB $A3,$A3,$00,$00
.DB $AB,$AB,$00,$00
.DB $A7,$A7,$00,$00
.DB $AD,$AD,$00,$00

@two_seventy_degree_ball_tiles:                                             ; 270 DEGREES POSSIBLE VALUES
.DB $A1,$A5,$00,$00
.DB $AB,$AD,$00,$00
.DB $A5,$A1,$00,$00
.DB $AB,$AD,$00,$00

@thre_fifteen_degree_ball_tiles:                                             ; 315 DEGREES POSSIBLE VALUES
.DB $A3,$A3,$00,$00
.DB $AB,$AB,$00,$00
.DB $A7,$A7,$00,$00
.DB $AD,$AD,$00,$00

.PAD $A000, $FF 	
_F}_PASS_BALL_AND_ROTATATING_BALL_TILE_TABLES	
      
	

