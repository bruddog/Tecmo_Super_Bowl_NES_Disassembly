.BASE $8000

													; 0x34000
BANK_JUMP_SOUND_MODE_START: 
	JMP SOUND_MODE_SCREEN_START    

BANK_JUMP_SET_CUTSCENE_UNIFORM_AND_SKIN_COLOR: 
	JMP SET_CUTSCENE_UNIFORM_AND_SKIN_COLOR    

BANK_JUMP_SET_DIVISION_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL: 
	JMP SET_DIVISION_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL    

BANK_JUMP_SET_CONFERENCE_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL:
	JMP SET_CONFERENCE_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL    

BANK_JUMP_SET_SUPER_BOWL_CUTSCENE_TEAM_UNIFORM_PAL:
	JMP SET_SUPER_BOWL_CUTSCENE_TEAM_UNIFORM_PAL    

BANK_JUMP_SET_COMPUTER_BOOST_VALUES: 
	JMP SET_COMPUTER_BOOST_VALUES            ; SET COMPUTER JUICE VALUES()   

BANK_JUMP_INIT_PLAYER_RAM_SCRIPT_COLL_ADDR: 
	JMP INIT_PLAYER_RAM_SCRIPT_COLL_ADDR     ; INITIALIZE PLAYER RAM ADDR, SPR PAL, START COLL THREAD, START DRAW THREAD, INIT NAMETABLES()

UNUSED_B27_JUMP_1: 
	JMP UNUSED_B27_JUMP_1                           ; UNUSED DEAD END LOOP
	
BANK_JUMP_SET_ALL_PLAYER_RAM_SKILLS:  
	JMP SET_ALL_PLAYER_RAM_SKILLS    		; SET ALL PLAYER SKILLS()

BANK_JUMP_SET_OFFENSIVE_PLAYER_SKILLS: 
	JMP SET_OFFENSIVE_PLAYER_SKILLS          ; SET SKILLS IN PLAYER()

UNUSED_B27_JUMP_2: 
	JMP UNUSED_B27_JUMP_2                           ; UNUSED DEAD END LOOP
	
UNUSED_B27_JUMP_3: 
	JMP UNUSED_B27_JUMP_3                           ; UNUSED DEAD END LOOP
	
UNUSED_B27_JUMP_4: 
	JMP UNUSED_B27_JUMP_4                           ; UNUSED DEAD END LOOP

BANK_JUMP_DRAW_ALL_END_OF_GAME_STATS_UNUSED: 
	JMP DRAW_ALL_END_OF_GAME_STATS_UNUSED        		; DRAW END OF GAME PLAYER STATS UNUSED 

BANK_JUMP_DRAW_SRAM_IN_GAME_PLAYER_STATS_UNUSED: 
	JMP DRAW_SRAM_IN_GAME_PLAYER_STATS_UNUSED		; SHOW CURRENT YARDS FOR IN GAME PLAYER(AFTER PLAY) UNUSED 

;BANK_JUMP_DO_NEXT_PLAYER_COMMAND		= $8000				 *** can be replaced on full build
;BANK_JUMP_DO_MOVEMENT_COLL_LOGIC		= $8003				 *** can be replaced on full build

;BANK_JUMP_FLICKER_SPRITES_TASK			= $9000				*** can be replaced on full build with direct		
;BANK_JUMP_START_COLL_CHECK_TASK		= $9006


;COM_BOOST_TABLE					= $BF00

_F{_SOUND_MODE_SCREEN_								; DONE

current_sound_id_decimal		= LOCAL_7
update_number_frame_delay		= $14
joy_held_frame_delay			= $08
last_sound_table_index			= END_OF_SONG_TABLE - SOUND_SCREEN_SONG_TABLE - 1 

SOUND_MODE_SCREEN_START:                            ; DRAW SOUND MODE
	JSR FADE_OUT_BG_SPR_PAL                         ; FADE OUT PALLETE()
	LDA #SOUND_MODE_SCENE_ID                        ; SET DRAW EVENT = SOUND MODE SCREEN 
	LDX #CUTSCENE_DRAW_SCRIPT_BANK                  ; LOAD BANK 7
	JSR END_OLD_SCENE_DRAW_NEW_SCENE                ;
	LDA #$00                                        ; SET CURRENT SOUND OPTION = FIRST SOUND OPTION
	STA MENU_Y                                      ; 
	
@sound_mode_input_loop:                             ; SOUND MODE CHECK FOR JOYPAD INPUT
	RETURN_1_FRAME

@exit_if_start_pressed:	
	LDA JOY_PRESS_1                                 ; DOES P1 PRESS = START
	AND #START_BUTTON                               ;
	BNE @stop_song_and_exit                          ; YES-> EXIT SOUND MODE SCREEN

@play_song_if_a_press:	
	BIT JOY_PRESS_1                                 ;
	BMI @play_sound                                 ; DOES P1 PRESS = “A” YES-> PLAY SOUND	

@stop_song_if_b_press:	
	BVS @stop_sound                                 ; DOES P1 PRESS = “B” YES-> STOP SOUND
	
@check_for_up_down:	
	LDA JOY_RAW_1                                   ; DOES P1 RAW = UP OR DOWN
	AND #(UP_DPAD + DOWN_DPAD)                       ;
	BEQ @sound_mode_input_loop                      ; NO->SOUND MODE CHECK FOR JOYPAD INPUT

@change_sound_number:		
	JSR CHANGE_SOUND_NUMBER                         ; CHECK FOR SOUND OPTION CHANGE AND DRAW NEW NUMBER IF CHANGED()
	LDX #update_number_frame_delay                  ; SET DELAY BETWEEN UPDATING NUMBER TIMER = 1/3 OF A SECOND

@update_if_held_delay:	
_WHILE NOT_EQUAL                                    ; UPDATE NUMBER WAIT LOOP
	RETURN_1_FRAME
	LDA JOY_RAW_1                                   ; DOES P1 RAW = UP OR DOWN
	AND #(UP_DPAD + DOWN_DPAD)                      ;
	BEQ @sound_mode_input_loop                      ; NO->SOUND MODE CHECK FOR JOYPAD INPUT
	DEX                                             ; DELAY BETWEEN UPDATING NUMBER TIMER--
_END_WHILE

	JSR CHANGE_SOUND_NUMBER                         ; CHECK FOR SOUND OPTION CHANGE AND DRAW NEW NUMBER IF CHANGED()
	LDX #joy_held_frame_delay                        ; SET DELAY BETWEEN UPDATING NUMBER TIMER = 8 FRAMES
	JMP @update_if_held_delay                       ; JUMP->UPDATE NUMBER WAIT LOOP

@play_sound:                                        ; PLAY SOUND
	LDX MENU_Y                                      ; SET SOUND TO PLAY FROM SOUND ID TABLE TABLE
	LDA SOUND_SCREEN_SONG_TABLE,X                   ;
	STA SOUND_ID_TO_PLAY                            ;
	JMP @sound_mode_input_loop                      ; SOUND MODE CHECK FOR JOYPAD INPUT

@stop_sound:                                        ; STOP SOUND AND RETURN TO CHECK JOYPAD LOOP
	LDA #STOP_SONG_SOUND_ID                         ; SET SOUND TO PLAY = END CURRENTLY PLAYING SOUND ID
	STA SOUND_ID_TO_PLAY                            ;
	JMP @sound_mode_input_loop                      ; JUMP-> SOUND MODE CHECK FOR JOYPAD INPUT
	
@stop_song_and_exit:                                ; EXIT SOUND MODE SCREEN
	LDA #STOP_SONG_SOUND_ID                         ; SET SOUND TO PLAY = END CURRENTLY PLAYING SOUND ID
	STA SOUND_ID_TO_PLAY                             ;
	LDX #UPDATE_PALLETE_TASK                        ; LOAD 
	JSR END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS      ; END TASK( X= TASK INDEX)
	JSR FADE_OUT_BG_SPR_PAL                         ;
	RETURN_IN_NUM_FRAMES $04
	RTS                                             ; RETURN

CHANGE_SOUND_NUMBER:                                ; CHECK FOR SOUND OPTION CHANGE AND DRAW NEW NUMBER IF CHANGED()
	LDA JOY_RAW_1                                   ; DOES P1 JOY RAW = UP
	AND #UP_DPAD                                    ;
	BEQ @check_down_held                             ; NO-> CHECK FOR JOY1 DOWN PRESSED

@up_held:	
	INC MENU_Y                                      ; CURRENT SOUND OPTION++
	LDA MENU_Y                                      ;
	CMP #last_sound_table_index +1                  ; DOES CURRENT SOUND OPTION = LAST SOUND OPTION?
	BCC @update_song_num                            ; NO->UPDATE SOUND OPTION NUMBER AND DRAW NUMBER TO SCREEN

@set_back_to_first_sound:	
	LDA #$00                                        ; SET CURRENT SOUND OPTION = FIRST SOUND OPTION
	STA MENU_Y                                      ;
	JMP @update_song_num                            ; JUMP- UPDATE SOUND OPTION NUMBER AND DRAW NUMBER TO SCREEN

@check_down_held:                                ; CHECK FOR JOY1 DOWN PRESSED
	LDA JOY_RAW_1                                   ; DOES P1 JOY RAW = DOWN
	AND #DOWN_DPAD                                  ;
	
@if_both_error:	
	BEQ @exit                                       ; BRANCH TO EXIT 

@down_pressed: 	
	DEC MENU_Y                                      ; CURRENT SOUND OPTION--
	BPL @update_song_num                            ; DOES CURRENT SOUND OPTION = FIRST SOUND OPTION? NO->UPDATE SOUND OPTION NUMBER AND DRAW NUMBER TO SCREEN

@set_to_last_sound:	
	LDA #last_sound_table_index                     ; SET OPTION TO LAST SOUND OPTION
	STA MENU_Y                                      ;

@update_song_num:                                   ; UPDATE SOUND OPTION NUMBER AND DRAW NUMBER TO SCREEN
	LDA MENU_Y                                      ; A= CURRENT SOUND OPTION +1 FOR CONVERSION TO DECIMAL 
	CLC                                             ;
	ADC #$01                                        ;
	JSR HEX_TO_2_DIGIT_DEC                          ; CONVERT HEX NUMBER TO BCD(A= HEX)
	LDA current_sound_id_decimal                    ; LOAD SOUND ID NUMBER
	LDY #<SOUND_MODE_SONG_NUMBER_PPU_ADDR           ; SET PPU ADDRESS = $22B1
	LDX #>SOUND_MODE_SONG_NUMBER_PPU_ADDR           ;
	JMP CONVERT_2_DIG_NUM_TILES                     ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)

@exit:                                              ; EXIT
	RTS                                             ; RETURN
	

_F}_SOUND_MODE_SCREEN_START	

_F{_SET_COM_ATTRIBUTE_BOOSTS						; DONE	

team_sram_addr				= LOCAL_1
game_mode_bitmask			= $03

boost_side_is_P1			= $00
boost_side_is_P2			= $FF

com_coa_skp_vs_p2_man		= $03
p1_man_vs_com_coa_skp		= $30

SET_COMPUTER_BOOST_VALUES:                          ; SET COMPUTER JUICE VALUES()
	MMC3_SRAM_WRITE_ENABLE 
	LDX #COM_BOOST_BANK                             ; LOAD BANK 15
	JSR SWAP_A000_BANK                              ; SWAP $A000 BANK (X= BANK TO SWAP)
	LDA GAME_STATUS                                 ;
	AND #game_mode_bitmask                          ;
	CMP #SEASON_MODE_BITFLAG                        ; IS GAME MODE = SEASON
	BCC @check_for_preseason_boost                  ; NO-> CHECK FOR PRE-SEASON COM BOOST
	
@check_for_season_mode_boost_if_one_team_man:
	
	JSR CHECK_FOR_MAN_VS_COA_COM_SKP                ; CHECK IF PLAYER TYPES ARE MAN, COM, COA ELSE SET TO SKP RET IN $45
	CMP #com_coa_skp_vs_p2_man                      ; 
	BEQ @com_coa_skp_vs_man                         ; YES->SET P1 TEAM

	CMP #p1_man_vs_com_coa_skp                      ; IS P2 TYPE = SKP 
	BNE @set_com_boosts_to_none                     ;
	
@man_vs_com_coa_skp:	
	LDX #boost_side_is_P2                           ; SET IN GAME TEAM = P2
	LDA P2_TEAM                                     ; LOAD P2 TEAM
	JMP @save_in_game_boost_side                     ;

@com_coa_skp_vs_man:                                ; SET P1 TEAM
	LDX #boost_side_is_P1                           ; SET IN GAME TEAM = P1
	LDA P1_TEAM                                     ; LOAD P1 TEAM
	
@save_in_game_boost_side:                           ; SAVE IN GAME COM,COA,SKP TEAM 
	STX IN_GAME_COM_COA_SKP_SIDE                    ; SAVE IN GAME TEAM
	JSR GET_TEAM_SEASON_SRAM_ADDR                   ; LOAD TEAM SEASON SRAM LOCATION IN 3E 3F(A= TEAM ID)

@team_wins_minus_losses:	
	LDY #WINS_SEASON_STATS_OFFSET                   ;  COM BOOST INDEX = SEASON WINS – SEASON LOSSES 
	LDA (team_sram_addr),Y                          ;
	LDY #LOSSES_SEASON_STATS_OFFSET                 ;
	SEC                                             ;
	SBC (team_sram_addr),Y                           ; WINS > LOSSES?

@if_wins_greater_than_losses:	
	BCS @save_boost_index                            ; YES->LOAD AND SAVE COM BOOSTS FROM BOOST TABLE 
	
@else:	
	JMP @set_boost_index_to_minimum                 ; NO->SET COM BOOSTS TO WEAKEST POSSIBLE 

@check_for_preseason_boost:                         ; CHECK FOR PRE-SEASON COM BOOST 
	JSR CHECK_FOR_MAN_VS_COA_COM_SKP                ; CHECK IF PLAYER TYPES ARE MAN, COM, COA ELSE SET TO SKP RET IN $45
	CMP #p1_man_vs_com_coa_skp                      ; IS P1 TYPE = SKP
	BEQ @set_boost_index_to_minimum                 ; YES->SET COM BOOSTS TO WEAKEST POSSIBLE
	CMP #com_coa_skp_vs_p2_man                      ; IS P2 TYPE = SKP
	BNE @set_com_boosts_to_none                     ; NO->SET COMPUTER BOOSTS TO NONE

@set_boost_index_to_minimum:                        ; SET COM BOOSTS TO WEAKEST POSSIBLE
	LDA #$00                                        ; SET COM BOOST INDEX = WEAKEST JUICE

@save_boost_index:                                  ; LOAD AND SAVE COM BOOSTS FROM BOOST TABLE
	STA CPU_BOOST_INDEX                             ;
	ASL                                             ;
	ASL                                             ;
	CLC                                             ;
	ADC CPU_BOOST_INDEX                             ;
	TAX                                             ; LOAD BOOST INDEX 
	LDA COM_BOOST_TABLE,X                           ; SET DEFENSIVE SPEED BOOST = BOOST TABLE + DEF 
	STA CPU_DEF_MS_BOOST                            ; 
	LDA COM_BOOST_TABLE+1,X                         ; SET OFFENSIVE SPEED BOOST = BOOST TABLE + OFF
	STA CPU_OFF_MS_BOOST                            ; 
	LDA COM_BOOST_TABLE+2,X                         ; SET INTERCEPTION BOOST = BOOST TABLE + INT
	STA CPU_DEF_INT_BOOST                           ;
	LDA COM_BOOST_TABLE+3,X                                     ; SET RECEPTION BOOST = BOOST TABLE + REC
	STA CPU_PASS_CONTROL_BOOST                      ;
	LDA COM_BOOST_TABLE+4,X                                     ; SET PASS CONTROL BOOST = BOOST TABLE + PC
	STA CPU_RECEPTION_BOOST                         ;
	JMP @disable_sram_and_return                    ; JUMP-> SET SRAM TO NOT WRITEABLE AND RETURN
	
@set_com_boosts_to_none:                            ; SET COMPUTER BOOSTS TO NONE
	LDA #$00
	STA CPU_DEF_MS_BOOST                            ; SET DEFENSIVE SPEED BOOST = NONE
	STA CPU_OFF_MS_BOOST                            ; SET OFFENSIVE SPEED BOOST = NONE 
	STA CPU_DEF_INT_BOOST                           ; SET INTERCEPTION BOOST = NONE 
	STA CPU_PASS_CONTROL_BOOST                      ; SET RECEPTION BOOST = NONE 
	STA CPU_RECEPTION_BOOST                         ; SET PASS CONTROL BOOST = NONE 
	
@disable_sram_and_return:                           ; SET SRAM TO NOT WRITEABLE AND RETURN 
	MMC3_SRAM_WRITE_DISABLE
	LDX #MAIN_GAME_BANK_2                           ; LOAD BANK 18
	JSR SWAP_A000_BANK                              ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	RTS                                             ; RETURN

_F}_SET_COM_ATTRIBUTE_BOOSTS		
	
_F{_CHECK_TEAM_TYPE_FOR_BOOSTS						; DONE

team_type_temp		= LOCAL_8
p1_side_bitmask		= $F0	
p2_side_bitmask		= $0F

	
CHECK_FOR_MAN_VS_COA_COM_SKP:             			; CHECK IF PLAYER TYPES ARE MAN, COM, COA ELSE SET TO SKP RET IN $45
	LDA TEAM_CONTROL_TYPES                          ; IS P1 TYPE = MAN,COA,COM
	AND #p1_side_bitmask	                        ; 
	BEQ @Loop1                                      ; YES->SAVE P1 AND CHECK P2
	LDA #p1_man_vs_com_coa_skp                      ; SET P1 TYPE = SKP
	
@Loop1:                                             ; SAVE P1 AND CHECK P2
	STA team_type_temp                              ; SAVE P1 TYPE
	LDA TEAM_CONTROL_TYPES                          ; IS P2 TYPE = MAN,COA,COM
	AND #p2_side_bitmask	                        ;
	BEQ @save_and_exit                               ; YES-> SAVE P2 TYPE AND RETURN
	LDA #com_coa_skp_vs_p2_man                      ;

@save_and_exit:                                     ; SAVE P2 TYPE AND RETURN
	ORA team_type_temp                              ;
	RTS                                             ; RETURN

_F}_CHECK_TEAM_TYPE_FOR_BOOSTS		
	
_F{_SET_CUTSCENE_UNIFORM_AND_SKIN_COLOR				; DONE

offensive_player_boolean 	= LOCAL_5
previous_A000_bank			= LOCAL_6
roster_id_bitmask			= $1F 
	
SET_CUTSCENE_UNIFORM_AND_SKIN_COLOR:                ; SET CUTSCENE UNIFORM AND SKIN COLORS($42= TEAM/POSITION)
	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] CUTSCENE_DEFAULT_SPR_PALLETES, SPR_PAL_BUFFER_START, $10
	
@save_bank_to_return_to:
	LDA SOFT_A000_BANK                              ; SET PREVIOUS $A000 BANK = CURRENT  $A000 BANK
	STA previous_A000_bank                          ;
	
@check_for_def_st_player:
	LDA offensive_player_boolean                    ; IS PLAYER TYPE  = DEFENSE/ SPECIAL TEAMS
	BMI @player_is_not_on_offense                   ; YES-> 

	LDA POSSESSION_STATUS							; IS CURRENT OFFENSE TEAM = P2?
	BMI @p2_on_offense                                ; YES-> P2 ON OFFENSE

@else_P1_on_offense:	
	LDA P1_MAN_POS_ID_ICON_STATUS                   ; LOAD P1 ACTIVE PLAYER
	JMP @get_player_1_skin_color                     ; JUMP-> LOAD P1 SIDE PLAYER AND TEAM

@p2_on_offense:                                     ; P2 ON OFFENSE
	LDA P2_MAN_POS_ID_ICON_STATUS                   ; LOAD P2 ACTIVE PLAYER 
	JMP @get_player_2_skin_color                    ; JUMP-> LOAD P2 SIDE  PLAYER AND TEAM

@player_is_not_on_offense:                          ; PLAYER IS DEFENDER/SPECIAL TEAMS PLAYER
	LDA DEF_SACK_BALL_BLOCK_STARTER_ID              ; LOAD DEFENDER PLAYER ID

@check_which_team_on_offense:	
	LDX POSSESSION_STATUS 							; IS CURRENT OFFENSE TEAM = P1? 
	BPL @get_player_2_skin_color                    ; YES->LOAD P2 SIDE  PLAYER AND TEAM

@get_player_1_skin_color:                           ; LOAD P1 SIDE PLAYER AND TEAM 
	AND #roster_id_bitmask                          ; KEEP ONLY PLAYER INFORMATION
	ASL                                             ; SHIFT FOR TWO BYTE TABLE ENTRY
	TAY                                             ;
	LDA P1_PLAYER_ROSTER_ID ,Y                      ; LOAD ACTUAL PLAYER FROM P1 IN GAME SRAM PLAYER DATA
	LDX P1_PLAYER_TEAM_ID,Y                         ; LOAD TEAM FROM P1 IN GAME SRAM TEAM DATA
	LDY #PLAYER_FACE_INDEX                          ; LOAD PLAYER FACE INDEX
	CLC                                             ;
	JSR GET_PLAYER_SKILL_OR_FACE                    ; GET PLAYER SKILL OR FACE (A=ACTUAL PLAYER, X=TEAM, Y=FACE OR SKILL)
	TAY                                             ; SAVE FACE ID
	LDA P1_TEAM                                     ; SET OFFENSE = P1 TEAM
	LDX P2_TEAM                                     ; SET DEFENSE = P2 TEAM
	JMP @set_uniform_color_based_on_matchup         ; JUMP-> SET UNIFORM PALLETE AND MATCHUP LOGIC ADDRESS AND SET SKIN COLOR

@get_player_2_skin_color:                           ; LOAD P2 SIDE  PLAYER AND TEAM 
	AND #roster_id_bitmask                          ; KEEP ONLY PLAYER INFORMATION
	ASL                                             ; SHIFT FOR TWO BYTE TABLE ENTRY
	TAY                                             ;
	LDA P2_PLAYER_ROSTER_ID,Y                       ; LOAD ACTUAL PLAYER FROM P2 IN GAME SRAM PLAYER DATA
	LDX P2_PLAYER_TEAMID,Y                          ; LOAD ACTUAL TEAM P1 IN GAME SRAM TEAM DATA
	LDY #PLAYER_FACE_INDEX                          ; LOAD PLAYER FACE INDEX
	SEC                                             ; 
	JSR GET_PLAYER_SKILL_OR_FACE                    ; GET PLAYER SKILL OR FACE (A=ACTUAL PLAYER, X=TEAM, Y=FACE OR SKILL)
	TAY                                             ; SAVE FACE ID
	LDA P2_TEAM                                     ; SET OFFENSE = P2 TEAM
	LDX P1_TEAM                                     ; SET DEFENSE = P1 TEAM

	
	
@set_uniform_color_based_on_matchup:                ; SET UNIFORM PALLETE AND MATCHUP LOGIC ADDRESS AND SET SKIN COLOR

uniform_info_address = LOCAL_7

	ASL                                             ; SHIFT SINCE EACH PALLETE ENTRY IS 8 BYTES
	ASL                                             ;
	ASL                                             ;
	CLC                                             ;
	ADC #<CUTSCENE_UNIFORM_PALLETES_AND_LOGIC       ; SET ADRRESS= CUTSCREEN TEAM UNIFORM PALLETES PRI, SEC AND COLOR LOGIC+ TEAM OFFSET
	STA uniform_info_address                        ;
	LDA #$00                                        ;
	ADC #>CUTSCENE_UNIFORM_PALLETES_AND_LOGIC       ;
	STA uniform_info_address +1                     ;
	TYA                                             ; LOAD FACE ID
	BMI @set_skin_color_dark                        ; IS FACE DARK? YES->SET SKIN COLOR TO DARK

@set_skin_color_light	
	LDA #LIGHT_SKIN_COLOR                           ; LOAD LIGHT SKIN COLOR  
	JMP @save_skin_color                            ; *** could be branch JUMP->SAVE SKIN COLOR

@set_skin_color_dark:                               ; SET SKIN COLOR TO DARK
	LDA #DARK_SKIN_COLOR	                        ; LOAD DARK SKIN COLOR

@save_skin_color:                                   ; SAVE SKIN COLOR
	STA CUTSCENE_SKIN_COLOR_A                       ; SAVE SKIN COLOR PALLETE IN SPRITE PALLETE BUFFER
	STA CUTSCENE_SKIN_COLOR_B                       ; SAVE SKIN COLOR PALLETE IN SPRITE PALLETE BUFFER
	TXA                                             ; LOAD DEFENSE TEAM
	LDY #$04                                        ; SET INDEX = FIRST COLOR LOGIC BYTE OF CUTSCENE JERSEY COLOR LOGIC 

_WHILE ALWAYS                                       ; GET INDEX TO UNIFORM CHOICE BYTE LOOP
	CMP #$08                                        ; IS OPPOSING TEAM ID = IN CURRENT MATCHUP BYTE?
	BCC @get_matchup_uniform_logic                  ; YES->DO CUT SCENE UNI COLORS MATCHUP DEPENDENCY LOGIC
	SBC #$08                                        ; 
	INY                                             ; DATA INDEX++

_END_WHILE                                      	; JUMP->GET INDEX TO UNIFORM CHOICE BYTE LOOP

@get_matchup_uniform_logic:                         ; DO CUT SCENE UNI COLORS MATCHUP DEPENDENCY LOGIC
	TAX                                             ; 
	LDA (uniform_info_address),Y                    ; LOAD COLOR LOGIC  BYTE     
	AND MATCHUP_LOGIC_BITMASK_TABLE,X               ; & WITH MASK BYTE FROM CUTSCENE JERSEY MATCHUP TEAM NIBBLE MASK
	BNE @set_to_use_secondary_uniform               ; USE JERESEY 2? YES-> USE 2ND  JERSEY

@set_to_use_primary_uniform:	
	LDY #$00                                        ; SET UNIFORM COLORS = PRIMARY COLORS
	JMP @save_uniform_colors_in_buffer              ; JUMP->SAVE UNIFORM COLORS IN PALLETE BUFFER

@set_to_use_secondary_uniform:                      ; USE 2ND  JERSEY
	LDY #$02                                        ; SET UNIFORM COLORS = SECONDARY COLORS

@save_uniform_colors_in_buffer:                     ; SAVE UNIFORM COLORS IN PALLETE BUFFER
	LDA (uniform_info_address),Y                    ; TRANSFER PANTS/HELMET COLOR INTO PALLETE BUFFER
	STA CUTSCENE_PANTS_HELMET_COLOR_A               ;
	STA CUTSCENE_PANTS_HELMET_COLOR_B               ;
	INY                                             ; DATA INDEX++
	LDA (uniform_info_address),Y                    ; TRANSFER JERSEY COLOR INTO PALLETE BUFFER
	STA CUTSCENE_JERSEY_COLOR_A                     ;
	STA CUTSCENE_JERSEY_COLOR_B                     ;
	LDX previous_A000_bank                          ; LOAD PREVIOUS BANK
	JMP SWAP_A000_BANK                              ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)

MATCHUP_LOGIC_BITMASK_TABLE:                                            ; CUTSCENE JERSEY MATCHUP TEAM NIBBLE MASK
	.DB $80, $40, $20, $10, $08, $04, $02, $01

CUTSCENE_DEFAULT_SPR_PALLETES:                      ; CUTSCENE BACKGROUND AND OUTLINE PALLETES
	.DB COLOR_BLACK_2, COLOR_BLACK_2, COLOR_DARK_GREY, COLOR_DARK_GREY
	.DB COLOR_BLACK_2, COLOR_BLACK_2, COLOR_DARK_GREY, COLOR_DARK_GREY
	.DB COLOR_BLACK_2, COLOR_BLACK_2, COLOR_DARK_GREY, COLOR_DARK_GREY
	.DB COLOR_BLACK_2, COLOR_BLACK_2, COLOR_MEDIUM_ORANGE, COLOR_WHITE

_F}_SET_CUTSCENE_UNIFORM_AND_SKIN_COLOR		

_F{_SET_DIV_CHAMP_TEAM_PALLETES						; DONE

GLOVES_COLOR_BUFFER					=  BG_PAL_BUFFER_START  + 2 
JERSEY_COLOR_BUFFER					=  BG_PAL_BUFFER_START  + 5
JERSEY_GLOVES_2_COLOR_BUFFER		=  BG_PAL_BUFFER_START  + 6
HELMET_SHADOW_COLOR_BUFFER			=  BG_PAL_BUFFER_START + 9
HELMET_FILL_COLOR_BUFFER			=  BG_PAL_BUFFER_START + 10


SET_DIVISION_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL:       ; SET DIVISION CHAMP PALLETE()
	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] DEFAULT_DIV_CHAMP_BG_SPR_PAL_TABLE, PALLETE_BUFFER_START, PALLETTE_BUFFER_LENGTH

@set_index_into_table_based_on_team_id:				; 
	LDA CURRENT_TEAM                                ; SET INDEX INTO TABLE BASED ON CURRENT TEAM
	ASL                                             ; EACH ENTRY IS 5 BYTES LONG
	ASL                                             ;
	CLC                                             ;
	ADC CURRENT_TEAM                                ;
	TAX                                             ;
	
@save_colors_to_pallete_buffer: 	
	LDA DIVISION_CHAMP_TEAM_BG_PAL_TABLE,X          ; SET BG BUFFER PALLETE VALUE 3 = GLOVES COLOR FROM DIVISION CHAMP PALLETE TABLE
	STA GLOVES_COLOR_BUFFER	                        ; 
	
	LDA DIVISION_CHAMP_TEAM_BG_PAL_TABLE+1,X        ; SET BG BUFFER PALLETE VALUE 6 = JERSEY NEAR NUMBER COLOR FROM DIVISION CHAMP PALLETE TABLE
	STA JERSEY_COLOR_BUFFER                         ; 
	
	LDA DIVISION_CHAMP_TEAM_BG_PAL_TABLE+2,X        ; SET BG BUFFER PALLETE VALUE 7 = JERSEY SHOULDER AND GLOVES2 COLOR FROM DIVISION CHAMP PALLETE TABLE
	STA JERSEY_GLOVES_2_COLOR_BUFFER                ;
	
	LDA DIVISION_CHAMP_TEAM_BG_PAL_TABLE+3,X        ; SET BG BUFFER PALLETE VALUE 10 = HELMET SHADOW COLOR FROM DIVISION CHAMP PALLETE TABLE
	STA HELMET_SHADOW_COLOR_BUFFER                  ;
	
	LDA DIVISION_CHAMP_TEAM_BG_PAL_TABLE+4,X        ; SET BG BUFFER PALLETE VALUE 11 = HELMET FILL COLOR FROM DIVISION CHAMP PALLETE TABLE
	STA HELMET_FILL_COLOR_BUFFER                    ;
	RTS                                             ; RETURN

_F}_SET_DIV_CHAMP_PALS	
	
_F{_SET_CONF_CHAMP_TEAM_PALLETES					; DONE
													; *** losing team sprite palletes not used. 
	
helmet_fill_bg_color_buffer						= 	BG_PAL_BUFFER_START + 9
helmet_fill_spr_color_buffer					= 	SPR_PAL_BUFFER_START + 9

helmet_stripe_bg_color_buffer					= 	BG_PAL_BUFFER_START + 10
helmet_stripe_spr_color_buffer					= 	SPR_PAL_BUFFER_START + 10

left_jersey_bg_color_buffer						= 	BG_PAL_BUFFER_START + 13
left_jersey_spr_color_buffer					= 	SPR_PAL_BUFFER_START + 13

right_jersey_bg_color_buffer					= 	BG_PAL_BUFFER_START + 14
right_jersey_spr_color_buffer					= 	SPR_PAL_BUFFER_START + 14

	
SET_CONFERENCE_CHAMP_CUTSCENE_TEAM_UNIFORM_PAL:     ; SET CONFERENCE CHAMP PALLETE()

	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] DEFAULT_CONF_CHAMP_BG_SPR_PAL_TABLE, PALLETE_BUFFER_START, PALLETTE_BUFFER_LENGTH 

@set_index_into_table_based_on_team_id:
	LDA PLAYOFF_LOSING_TEAM                      	; SET INDEX INTO TABLE BASED ON LOSING TEAM
	SHIFT_LEFT_2									; EACH ENTRY 4 BYTES
	TAX 
	
@set_losing_team_palletes:	
	
@set_helmet_fill:	
	LDA CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE,X          ; 
	STA helmet_fill_bg_color_buffer                 ; SET BACKGROUND BUFFER PALLETE VALUE 10 = HELMET SOLID COLOR  FROM CONFERENCE CHAMP PALLETE TABLE 
	STA helmet_fill_spr_color_buffer                ; SET SPRITE BUFFER PALLETE VALUE 10 = HELMET SOLID COLOR  FROM CONFERENCE CHAMP PALLETE TABLE
	
	LDA CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE+1,X        ;
	STA helmet_stripe_bg_color_buffer               ; SET BACKGROUND BUFFER PALLETE VALUE 11 = HELMET STRIPE OUTLINE COLOR  FROM CONFERENCE CHAMP PALLETE TABLE
	STA helmet_stripe_spr_color_buffer              ; SET SPRITE BUFFER PALLETE VALUE 11 = HELMET STRIPE OUTLINE COLOR  FROM CONFERENCE CHAMP PALLETE TABLE
	
	LDA CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE+2,X        ;
	STA left_jersey_bg_color_buffer                 ; SET BACKGROUND BUFFER PALLETE VALUE 14 = JERSEY LEFT COLOR FROM CONFERENCE CHAMP PALLETE TABLE
	STA left_jersey_spr_color_buffer                ; SET SPRITE BUFFER PALLETE VALUE 14 = JERSEY LEFT  COLOR FROM CONFERENCE CHAMP PALLETE TABLE
	
	LDA CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE+3,X        ;
	STA right_jersey_bg_color_buffer                ; SET BACKGROUND BUFFER PALLETE VALUE 15 = JERSEY RIGHT COLOR FROM CONFERENCE CHAMP PALLETE TABLE
	STA right_jersey_spr_color_buffer               ; SET SPRITE BUFFER PALLETE VALUE 15 = JERSEY RIGHT COLOR FROM CONFERENCE CHAMP PALLETE TABLE

SET_SB_CONF_CHAMP_WINNING_TEAM_PALLETES:            ; LOAD TEAM SPECIFIC CONFERENCE CHAMP BG AND SPR PALLETE INTO PALLETE BUFFER

@set_index_into_table_based_on_team_id:
	LDA CONF_CHAMP_SB_WINNING_TEAM                  ; LOAD WINNING TEAM 
	SHIFT_LEFT_2									; EACH ENTRY 4 BYTES
	TAX                                             ; 

@set_winning_team_palletes:	

win_helmet_pants_bg_color_buffer						= 	BG_PAL_BUFFER_START + 1
win_helmet_pants_spr_color_buffer						= 	SPR_PAL_BUFFER_START + 1

win_jersey_bottom_bg_color_buffer						= 	BG_PAL_BUFFER_START + 2
win_jersey_bottom_spr_color_buffer						= 	SPR_PAL_BUFFER_START + 2

win_left_jersey_bg_color_buffer							= 	BG_PAL_BUFFER_START + 5
win_left_jersey_spr_color_buffer						= 	SPR_PAL_BUFFER_START + 5

win_right_jersey_bg_color_buffer						= 	BG_PAL_BUFFER_START + 6
win_right_jersey_spr_color_buffer						= 	SPR_PAL_BUFFER_START + 6
	
	LDA CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE,X          ; LOAD HELMET AND PANTS COLOR FROM CONFERENCE CHAMP PALLETE TABLE
	STA win_helmet_pants_bg_color_buffer            ; SET BACKGROUND PALLETE BUFFER VAL 2 = VAL
	STA win_helmet_pants_spr_color_buffer           ; SET SPRITE PALLETE BUFFER VAL 2 = VAL
	
	LDA CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE+1,X        ; LOAD JERSEY BOTTOM COLOR FROM CONFERENCE CHAMP PALLETE TABLE
	STA win_jersey_bottom_bg_color_buffer           ; SET BACKGROUND PALLETE BUFFER VAL 3 = VAL
	STA win_jersey_bottom_spr_color_buffer	        ; SET SPRITE PALLETE BUFFER VAL 3 = VAL
	
	LDA CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE+2,X        ; LOAD JERSEY LEFT COLOR FROM CONFERENCE CHAMP PALLETE TABLE
	STA win_left_jersey_bg_color_buffer	            ; SET BACKGROUND PALLETE BUFFER VAL 4 = VAL
	STA win_left_jersey_spr_color_buffer             ; SET SPRITE PALLETE BUFFER VAL 4 = VAL
	
	LDA CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE+3,X        ; LOAD JERSEY RIGHT COLOR FROM CONFERENCE CHAMP PALLETE TABLE
	STA win_right_jersey_bg_color_buffer            ; SET BACKGROUND PALLETE BUFFER VAL 5 = VAL
	STA win_right_jersey_spr_color_buffer           ; SET BACKGROUND PALLETE BUFFER VAL 5 = VAL
	RTS                                             ; RETURN

SET_SUPER_BOWL_CUTSCENE_TEAM_UNIFORM_PAL:           ; SET SUPER BOWL CHAMP PALLETE()

    COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] DEFAULT_SUPER_BOWL_BG_SPR_PAL_TABLE, PALLETE_BUFFER_START, PALLETTE_BUFFER_LENGTH 
	JMP SET_SB_CONF_CHAMP_WINNING_TEAM_PALLETES 
	
_F}_SET_CONF_CHAMP_TEAM_PALLETES
	
_F{_CUTSCENE_UNI_PAL_DATA							; DONE	

CUTSCENE_UNIFORM_PALLETES_AND_LOGIC:                ; CUTSCREEN TEAM UNIFORM PALLETES PRI, SEC AND COLOR LOGIC
													; PANTS/HELM1,JERSEY1,PANTS/HELM1,JERSEY2, MATCHUP LOGIC (4 BYTES)   
													; MATCHUP LOGIC (4 BYTES)   EACH BIT CORRESPONDS TO A TEAM 
													; PRIMARY PANTS/HELM, PRIMARY JERSEY
													; SECONDARY PANTS/HELM, SECONDARY JERSEY													
BUF_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_PURPLE_RED		,COLOR_MEDIUM_GREY_BLUE                                    	
	.DB COLOR_MEDIUM_PURPLE_RED		,COLOR_MEDIUM_GREY_BLUE                                   	
	
@matchup_logic:	
	.HEX 00000000  

IND_CUTSCENE_COLORS:
	.DB COLOR_WHITE					,COLOR_DARK_GREY_BLUE 
	.DB COLOR_WHITE					,COLOR_DARK_GREY_BLUE
	
@matchup_logic:	
	.HEX 00000000
	
MIA_CUTSCENE_COLORS:
	.DB COLOR_WHITE					,COLOR_MEDIUM_AQUA 
	.DB COLOR_WHITE					,COLOR_MEDIUM_AQUA
	
@matchup_logic:	
	.HEX 50006C20
	
NE_CUTSCENE_COLORS:    
	.DB COLOR_WHITE					,COLOR_MEDIUM_PURPLE_RED 
	.DB COLOR_WHITE					,COLOR_MEDIUM_PURPLE 
@matchup_logic:	
	.HEX 86224180
	
NYJ_CUTSCENE_COLORS:
	.DB COLOR_WHITE					,COLOR_DARK_YELLOW_GREEN 
	.DB COLOR_DARK_YELLOW_GREEN		,COLOR_WHITE
@matchup_logic:		
	.HEX F55C69A0
	
CIN_CUTSCENE_COLORS:
	.DB COLOR_LIGHT_RED				,COLOR_BLACK_2 
	.DB COLOR_LIGHT_RED				,COLOR_WHITE
@matchup_logic:		
	.HEX D0D00430
	
CLE_CUTSCENE_COLORS:
	.DB COLOR_LIGHT_RED				,COLOR_WHITE 
	.DB COLOR_WHITE_RED				,COLOR_MEDIUM_ORANGE
@matchup_logic:	
	.HEX 80209300
	
HOU_CUTSCENE_COLORS:
	.DB COLOR_WHITE					,COLOR_LIGHT_GREY_BLUE 
	.DB COLOR_WHITE_GREY_BLUE		,COLOR_WHITE
@matchup_logic:	
	.HEX 700449A0
	
PIT_CUTSCENE_COLORS:
	.DB COLOR_BLACK_2				,COLOR_LIGHT_YELLOW 
	.DB COLOR_LIGHT_YELLOW			,COLOR_BLACK_2
@matchup_logic:		
	.HEX 00629240
	
DEN_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_RED 
	.DB COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_RED
@matchup_logic:		
	.HEX C0010060
	
KC_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_PURPLE_RED		,COLOR_WHITE 
	.DB COLOR_LIGHT_PURPLE_RED		,COLOR_DARK_PURPLE_RED 
@matchup_logic:	
	.HEX 10020100
	
RAI_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_GREY			,COLOR_BLACK_2
	.DB COLOR_MEDIUM_GREY			,COLOR_WHITE
@matchup_logic:		
	.HEX 40842C30
	
SD_CUTSCENE_COLORS:
	.DB COLOR_WHITE_YELLOW			,COLOR_DARK_BLUE
	.DB COLOR_DARK_GREY_BLUE		,COLOR_WHITE
@matchup_logic:		
	.HEX F7DD6DFF
	
SEA_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_GREY			,COLOR_MEDIUM_GREY_BLUE 
	.DB COLOR_WHITE_GREY_BLUE		, COLOR_WHITE
@matchup_logic:	
	.HEX E0C12C60

WAS_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_RED			,COLOR_WHITE 
	.DB COLOR_MEDIUM_RED			,COLOR_WHITE 
@matchup_logic:		
	.HEX 00000000
	
GIA_CUTSCENE_COLORS:
	.DB COLOR_BLACK_2				,COLOR_MEDIUM_GREY_BLUE 
	.DB COLOR_DARK_GREY_BLUE		,COLOR_WHITE 
@matchup_logic:		
	.HEX 84D02CB0
	
PHI_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_YELLOW_GREEN	,COLOR_WHITE 
	.DB COLOR_MEDIUM_YELLOW_GREEN	,COLOR_WHITE
@matchup_logic:		
	.HEX 00000000
	
PHX_CUTSCENE_COLORS:
	.DB COLOR_WHITE					,COLOR_DARK_PURPLE_RED 
	.DB COLOR_WHITE_GREY_BLUE		,COLOR_DARK_PURPLE_RED
@matchup_logic:		
	.HEX 52220100
	
DAL_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_GREY			,COLOR_DARK_GREY_BLUE	 
	.DB COLOR_MEDIUM_GREY			,COLOR_DARK_GREY_BLUE	
@matchup_logic:		
	.HEX 00000000
	
CHI_CUTSCENE_COLORS:
	.DB COLOR_BLACK_2				,COLOR_WHITE 
	.DB COLOR_BLACK_2				,COLOR_WHITE
@matchup_logic:		
	.HEX 00000000
	
DET_CUTSCENE_COLORS:
	.DB COLOR_WHITE_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE 
	.DB COLOR_MEDIUM_GREY			,COLOR_DARK_GREY_BLUE
@matchup_logic:		
	.HEX 21040000
	
GB_CUTSCENE_COLORS:
	.DB COLOR_WHITE_YELLOW			,COLOR_DARK_YELLOW_GREEN 
	.DB COLOR_LIGHT_YELLOW			,COLOR_WHITE
@matchup_logic:		
	.HEX 48800020
	
MIN_CUTSCENE_COLORS:
	.DB COLOR_DARK_PURPLE			,COLOR_WHITE 
	.DB COLOR_DARK_PURPLE			,COLOR_WHITE
@matchup_logic:		
	.HEX 00000000
	
TB_CUTSCENE_COLORS:
	.DB COLOR_WHITE					,COLOR_LIGHT_ORANGE 
	.DB COLOR_WHITE					,COLOR_LIGHT_RED 
@matchup_logic:		
	.HEX 02000000
	
SF_CUTSCENE_COLORS:
	.DB COLOR_WHITE_RED_YELLOW		,COLOR_MEDIUM_RED	 
	.DB COLOR_WHITE_RED_YELLOW		,COLOR_MEDIUM_RED	
@matchup_logic:		
	.HEX 92200540
	
RAM_CUTSCENE_COLORS:
	.DB COLOR_DARK_GREY_BLUE		,COLOR_LIGHT_YELLOW 
	.DB COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_YELLOW
@matchup_logic:		
	.HEX 40492400
	
NO_CUTSCENE_COLORS:
	.DB COLOR_WHITE_YELLOW			,COLOR_BLACK_2 
	.DB COLOR_LIGHT_BROWN			,COLOR_WHITE
@matchup_logic:		
	.HEX 80C03010
	
ATL_CUTSCENE_COLORS:
	.DB COLOR_BLACK_2				,COLOR_DARK_GREY
	.DB COLOR_DARK_GREY				,COLOR_WHITE
@matchup_logic:	
	.HEX 08802000
	
AFC_CUTSCENE_COLORS:
	.DB COLOR_MEDIUM_PURPLE_RED,COLOR_WHITE
	.DB COLOR_MEDIUM_PURPLE_RED,COLOR_WHITE
@matchup_logic:		
	.HEX 00000000
	
NFC_CUTSCENE_COLORS:
	.DB COLOR_WHITE,COLOR_DARK_GREY_BLUE 
	.DB COLOR_WHITE,COLOR_DARK_GREY_BLUE
@matchup_logic:		
	.HEX 00000000

_F}_CUTSCENE_UNI_PAL_DATA

_F{_DIV_CHAMP_SCENE_PAL_DATA						; DONE

DEFAULT_DIV_CHAMP_BG_SPR_PAL_TABLE: 

; BACKGROUND PALLETES                                        
	.DB COLOR_BLACK_2			,COLOR_MEDIUM_AQUA		,COLOR_DARK_GREY		,COLOR_WHITE                             
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY		,COLOR_DARK_GREY		,COLOR_WHITE     
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY		,COLOR_DARK_GREY		,COLOR_WHITE
	.DB COLOR_BLACK_2			,COLOR_WHITE_RED		,COLOR_LIGHT_RED		,COLOR_WHITE 
	
; SPRITE PALLETES		
	.DB COLOR_BLACK_2			,COLOR_WHITE			,COLOR_MEDIUM_GREY_BLUE	,COLOR_MEDIUM_PURPLE_RED                          
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY		,COLOR_MEDIUM_GREY		,COLOR_WHITE     
	.DB COLOR_BLACK_2			,COLOR_DARK_PURPLE_RED	,COLOR_LIGHT_PURPLE_RED ,COLOR_WHITE     
	.DB COLOR_BLACK_2			,COLOR_WHITE_RED_YELLOW ,COLOR_LIGHT_ORANGE		,COLOR_WHITE



DIVISION_CHAMP_TEAM_BG_PAL_TABLE:                   ; DIVISION CHAMP TEAM SPECIFIC PALLETE TABLE
													; GLOVES , JERSEY FRONT NUMBERS, GLOVES AND JERSEY SHOULDER, HELMET SHADOW, HELMET SOLID

BUF_DIV_CHAMP_CUT_PAL:													
	.DB COLOR_DARK_GREY_BLUE	,COLOR_MEDIUM_GREY_BLUE		,COLOR_DARK_GREY_BLUE		,COLOR_LIGHT_PURPLE_RED		,COLOR_MEDIUM_PURPLE_RED                         

IND_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_GREY_BLUE	,COLOR_MEDIUM_GREY_BLUE		,COLOR_DARK_GREY_BLUE		,COLOR_WHITE				,COLOR_WHITE_GREY_BLUE

MIA_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_AQUA			,COLOR_LIGHT_AQUA			,COLOR_MEDIUM_AQUA			,COLOR_WHITE				,COLOR_WHITE_GREY_BLUE

NE_DIV_CHAMP_CUT_PAL:		
	.DB COLOR_DARK_PURPLE_RED	,COLOR_LIGHT_PURPLE_RED		,COLOR_MEDIUM_PURPLE_RED	,COLOR_WHITE				,COLOR_WHITE_GREY_BLUE
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NYJ_DIV_CHAMP_CUT_PAL:
	.DB COLOR_DARK_GREEN		,COLOR_MEDIUM_GREEN			,COLOR_DARK_GREEN			,COLOR_MEDIUM_YELLOW_GREEN	,COLOR_DARK_YELLOW_GREEN

CIN_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_BLACK_2				,COLOR_LIGHT_RED			,COLOR_MEDIUM_RED
	
CLE_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY			,COLOR_LIGHT_RED			,COLOR_MEDIUM_RED	

HOU_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_GREY_BLUE	,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE		,COLOR_WHITE				,COLOR_WHITE_GREY_BLUE
	
PIT_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_BLACK_2				,COLOR_DARK_GREY			,COLOR_BLACK_2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
DEN_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_RED			,COLOR_LIGHT_RED			,COLOR_DARK_RED				,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE	

KC_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_PURPLE_RED	,COLOR_MEDIUM_PURPLE_RED	,COLOR_DARK_PURPLE_RED		,COLOR_LIGHT_PURPLE_RED		,COLOR_MEDIUM_PURPLE_RED

LAR_DIV_CHAMP_CUT_PAL:
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_BLACK_2				,COLOR_WHITE_GREY_BLUE		,COLOR_MEDIUM_GREY
	
SD_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_BLUE			,COLOR_MEDIUM_BLUE			,COLOR_DARK_BLUE			,COLOR_MEDIUM_BLUE			,COLOR_DARK_BLUE
	
SEA_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_GREY_BLUE	,COLOR_MEDIUM_GREY_BLUE		,COLOR_DARK_GREY_BLUE		,COLOR_WHITE				,COLOR_WHITE_GREY_BLUE
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
WAS_DIV_CHAMP_CUT_PAL:
	.DB COLOR_DARK_PURPLE_RED	,COLOR_MEDIUM_PURPLE_RED	,COLOR_DARK_PURPLE_RED		,COLOR_LIGHT_PURPLE_RED		,COLOR_MEDIUM_PURPLE_RED  

NYG_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_GREY_BLUE	,COLOR_MEDIUM_GREY_BLUE		,COLOR_DARK_GREY_BLUE		,COLOR_DARK_GREY_BLUE		,COLOR_BLACK_2

PHI_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_YELLOW_GREEN	,COLOR_LIGHT_YELLOW_GREEN	,COLOR_MEDIUM_YELLOW_GREEN	,COLOR_LIGHT_YELLOW_GREEN	,COLOR_MEDIUM_YELLOW_GREEN

PHX_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_PURPLE_RED	,COLOR_MEDIUM_PURPLE_RED	,COLOR_DARK_PURPLE_RED		,COLOR_WHITE				,COLOR_MEDIUM_GREY

DAL_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_GREY_BLUE	,COLOR_MEDIUM_GREY_BLUE		,COLOR_DARK_GREY_BLUE		,COLOR_WHITE				,COLOR_MEDIUM_GREY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CHI_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_BLACK_2				,COLOR_DARK_GREY			,COLOR_BLACK_2
	
DET_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_GREY_BLUE	,COLOR_MEDIUM_GREY_BLUE		,COLOR_DARK_GREY_BLUE		,COLOR_MEDIUM_GREY			,COLOR_DARK_GREY
	
GB_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_BLACK_2			,COLOR_DARK_YELLOW_GREEN	,COLOR_BLACK_2				,COLOR_WHITE_YELLOW			,COLOR_LIGHT_YELLOW

MIN_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_BLUE_PURPLE	,COLOR_LIGHT_BLUE_PURPLE	,COLOR_MEDIUM_BLUE_PURPLE	,COLOR_LIGHT_BLUE_PURPLE	,COLOR_MEDIUM_BLUE_PURPLE	

TB_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_RED 			,COLOR_LIGHT_RED			,COLOR_MEDIUM_RED			,COLOR_WHITE				,COLOR_WHITE_GREY_BLUE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SF_DIV_CHAMP_CUT_PAL:
	.DB COLOR_DARK_PURPLE_RED	,COLOR_MEDIUM_PURPLE_RED	,COLOR_DARK_PURPLE_RED		,COLOR_WHITE				,COLOR_LIGHT_YELLOW  

LAM_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_BROWN		,COLOR_WHITE_YELLOW			,COLOR_LIGHT_YELLOW			,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE
	
NO_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_BLACK_2				,COLOR_LIGHT_YELLOW			,COLOR_LIGHT_BROWN

ATL_DIV_CHAMP_CUT_PAL:	
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_BLACK_2				,COLOR_DARK_GREY			,COLOR_BLACK_2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_F}_DIV_CHAMP_SCENE_PAL_DATA	

_F{_CONF_CHAMP_SCENE_PAL_DATA						; DONE
	
DEFAULT_CONF_CHAMP_BG_SPR_PAL_TABLE: 
	; BG PALS                                         				
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_DARK_GREY			,COLOR_WHITE                           
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_DARK_GREY			,COLOR_WHITE
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_DARK_GREY			,COLOR_WHITE
	.DB COLOR_BLACK_2			,COLOR_DARK_GREY			,COLOR_DARK_GREY			,COLOR_WHITE

	; SPR PALS  	
	.DB COLOR_BLACK_2			,COLOR_DARK_BLUE			,COLOR_DARK_PURPLE_RED		,COLOR_WHITE                           
	.DB COLOR_BLACK_2			,COLOR_DARK_BLUE			,COLOR_DARK_PURPLE_RED		,COLOR_WHITE
	.DB COLOR_BLACK_2			,COLOR_WHITE				,COLOR_MEDIUM_GREY			,COLOR_MEDIUM_PURPLE_RED
	.DB COLOR_BLACK_2			,COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_GREY_BLUE		,COLOR_WHITE
	
CONF_CHAMP_TEAM_BG_SPR_PAL_TABLE:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BUF_CONF_CHAMP_CUT_PAL:                                          
	.DB COLOR_LIGHT_PURPLE_RED	,COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE
	
IND_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_WHITE				,COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE

MIA_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_WHITE				,COLOR_MEDIUM_AQUA			,COLOR_LIGHT_AQUA			,COLOR_MEDIUM_AQUA
	
NE_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_WHITE				,COLOR_MEDIUM_PURPLE_RED	,COLOR_LIGHT_PURPLE_RED		,COLOR_MEDIUM_PURPLE_RED
	
NYJ_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_MEDIUM_GREEN		,COLOR_MEDIUM_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CIN_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_LIGHT_RED			,COLOR_MEDIUM_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY                            

CLE_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_LIGHT_RED			,COLOR_MEDIUM_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY

HOU_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_WHITE				,COLOR_LIGHT_GREY_BLUE		,COLOR_WHITE_GREY_BLUE		,COLOR_LIGHT_GREY_BLUE

PIT_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_BLACK_2			,COLOR_LIGHT_YELLOW			,COLOR_WHITE_YELLOW			,COLOR_LIGHT_YELLOW
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DEN_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_MEDIUM_GREY_BLUE	,COLOR_MEDIUM_RED			,COLOR_LIGHT_RED			,COLOR_MEDIUM_RED

KC_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_MEDIUM_PURPLE_RED	,COLOR_DARK_PURPLE_RED		,COLOR_MEDIUM_PURPLE_RED	,COLOR_DARK_PURPLE_RED

LAR_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_MEDIUM_GREY		,COLOR_BLACK_2				,COLOR_DARK_GREY			,COLOR_BLACK_2

SD_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_DARK_BLUE			,COLOR_MEDIUM_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY
	
SEA_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_WHITE_GREY_BLUE	,COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
WAS_CONF_CHAMP_CUT_PAL:
	.DB COLOR_MEDIUM_PURPLE_RED	,COLOR_MEDIUM_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY 

NYG_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_BLACK_2			,COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE

PHI_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_LIGHT_GREEN		,COLOR_MEDIUM_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY

PHX_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_WHITE				,COLOR_MEDIUM_PURPLE_RED	,COLOR_LIGHT_PURPLE_RED		,COLOR_MEDIUM_PURPLE_RED

DAL_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_MEDIUM_GREY		,COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

CHI_CONF_CHAMP_CUT_PAL:
	.DB COLOR_BLACK_2			,COLOR_MEDIUM_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY 
	
DET_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_WHITE_GREY_BLUE	,COLOR_MEDIUM_GREY_BLUE		,COLOR_LIGHT_GREY_BLUE		,COLOR_MEDIUM_GREY_BLUE
	
GB_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_LIGHT_YELLOW		,COLOR_DARK_YELLOW_GREEN	,COLOR_MEDIUM_YELLOW_GREEN	,COLOR_DARK_YELLOW_GREEN
	
MIN_CONF_CHAMP_CUT_PAL:			
	.DB COLOR_MEDIUM_BLUE_PURPLE,COLOR_MEDIUM_GREY			,COLOR_WHITE				,COLOR_MEDIUM_GREY

TB_CONF_CHAMP_CUT_PAL:	
	.DB COLOR_WHITE				,COLOR_MEDIUM_RED			,COLOR_LIGHT_RED			,COLOR_MEDIUM_RED	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
SF_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_LIGHT_YELLOW,COLOR_MEDIUM_PURPLE_RED,COLOR_LIGHT_PURPLE_RED,COLOR_MEDIUM_PURPLE_RED 
	
LAM_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_MEDIUM_GREY_BLUE,COLOR_LIGHT_YELLOW, COLOR_WHITE_YELLOW,COLOR_LIGHT_YELLOW
	
NO_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_LIGHT_YELLOW,COLOR_BLACK_2,COLOR_DARK_GREY,COLOR_BLACK_2
	
ATL_CONF_CHAMP_CUT_PAL:		
	.DB COLOR_BLACK_2,COLOR_MEDIUM_GREY,COLOR_WHITE,COLOR_MEDIUM_GREY

_F}_CONF_CHAMP_SCENE_PAL_DATA						; DONE	

_F{_DEFAULT_SUPER_BOWL_PAL_DATA						; DONE
	
DEFAULT_SUPER_BOWL_BG_SPR_PAL_TABLE:  

; BACKGROUND PALLETES                                        
	.DB COLOR_BLACK_2	,COLOR_DARK_GREY	,COLOR_DARK_GREY		,COLOR_WHITE                             
	.DB COLOR_BLACK_2	,COLOR_DARK_GREY	,COLOR_DARK_GREY		,COLOR_WHITE
	.DB COLOR_BLACK_2	,COLOR_LIGHT_BLUE	,COLOR_LIGHT_ORANGE		,COLOR_WHITE
	.DB COLOR_BLACK_2	,COLOR_DARK_GREY	,COLOR_MEDIUM_GREY		,COLOR_WHITE
	
; SPRITE PALLETES
	.DB COLOR_BLACK_2	,COLOR_DARK_GREY	,COLOR_DARK_GREY		,COLOR_WHITE                             
	.DB COLOR_BLACK_2	,COLOR_DARK_GREY	,COLOR_DARK_GREY		,COLOR_WHITE
	.DB COLOR_BLACK_2	,COLOR_LIGHT_ORANGE	,COLOR_WHITE_RED_YELLOW	,COLOR_WHITE
	.DB COLOR_BLACK_2	,COLOR_DARK_GREY	,COLOR_MEDIUM_GREY		,COLOR_WHITE
	
_F}_DEFAULT_SUPER_BOWL_PAL_DATA	

_F{_INIT_PLAYER_RAM_FUNCTION_ADDRESSES			    ; DONE 

players_left_to_init		= LOCAL_6
current_sprite_index		= LOCAL_7
ppu_ctrl_8_by_16_bit_flag	= $20					; sets player sprites to 8x16


INIT_PLAYER_RAM_SCRIPT_COLL_ADDR:                   ; INTIALIZE PLAYER COMMAND, COLLISION, PLAY CODE ADDRESS, AND PLAYER SPRITE PALLETE SETS 
	LDA #<PLAYER_RAM_START                          ; LOAD P1 QB/RE PLAYER POINTER INTO PLAYER RAM POINTER 
	STA CURRENT_PLAYER_ADDR                         ;
	LDA #>PLAYER_RAM_START                          ;
	STA CURRENT_PLAYER_ADDR +1                      ;
	LDA #OFFSET_TO_START_OF_FIELD_PLAYER_SPRITES    ; SET CURRENT SPRITE INDEX = 48
	STA current_sprite_index                        ; 
	LDA #TOTAL_NUM_PLAYERS_ON_FIELD                 ; SET PLAYER COUNTER = 22
	STA players_left_to_init                        ; 
	
_WHILE NOT_EQUAL                                    ; INTIALIZE PLAYER COMMAND, COLLISION, PLAY CODE ADDRESS, AND SPRITE PALLETE LOOP 

	SET_PLAYER_COMMAND_ADDR[frame_delay_rom_addr] $01, (BANK_JUMP_DO_NEXT_PLAYER_COMMAND)
	
@set_to_coll_index:
	INY 
	LDA #$01                                     	; SET COMMAND COUNTER TO 1 FRAME
	STA (CURRENT_PLAYER_ADDR),Y                     ; 
	INY                                             ; SET COMMAND ADDRESS = PROCESS PLAY CODE COMMAND() = $8000-1 BANK 21
	LDA #<(BANK_JUMP_DO_MOVEMENT_COLL_LOGIC -1)            ; 
	STA (CURRENT_PLAYER_ADDR),Y                     ;
	INY                                             ;
	LDA #>(BANK_JUMP_DO_MOVEMENT_COLL_LOGIC -1)            ;
	STA (CURRENT_PLAYER_ADDR),Y                     ; 


@set_current_sprite_index:	
	LDA current_sprite_index                        ; SET PLAYER RAM SPRITE INDEX = CURRENT SPRITE INDEX
	SET_CUR_PLAYER_SPRITE_INDEX						;
	TAX                                             ; SAVE CURRENT SPRITE INDEX 

@set_pallete_to_use_based_on_side

@shift_side_bitflag_for_setting_pallete	
	LOAD_CUR_PLAYER_POSITION_ID
	ROL                                             ; rotate side bit into carry

@shift_near_collision_bitflag:  	
	LOAD_CUR_PLAYER_COLLISION_STATUS				;  
	ROL                                             ; 
	ROL                                             ; 

@save_in_sprite_attr	
	AND #$03                                        ; 
	STA CUR_PLAYER_SPR_ATTR_LEFT,X                  ; SAVE PALLETE SET TO USE IN  PLAYER TOP SPRITE 
	STA CUR_PLAYER_SPR_ATTR_RIGHT,X                 ; SAVE PALLETE SET TO USE IN  PLAYER BOTTOM SPRITE 

@set_sprite_index_to_next_player_sprite:	
	TXA                                             ; CURRENT SPRITE INDEX += 0X08
	CLC                                             ;
	ADC #OFFSET_TO_NEXT_8_BY_16_SPRITE              ; 
	STA	current_sprite_index                        ;

@set_player_ram_addr_tonext_player:	
	SET_PLAYER_RAM_ADDR_TO_NEXT_PLAYER[player_addr] CURRENT_PLAYER_ADDR 

@check_if_done:	
	DEC players_left_to_init                        ; PLAYER COUNTER--

_END_WHILE                                     		; ALL PLAYERS UPDATED? No-> INTIALIZE PLAYER COMMAND, COLLISION, PLAY CODE ADDRESS, SPR PALLETE LOOP


@start_collision_task:
	LDA #COLLISION_LOGIC_BANK                       ; SET COLLISION TASK (TASK 5) BANK = BANK 23
	STA COLLISION_CHECK_TASK + TASK_BANK            ; 
	LDY #<(BANK_JUMP_START_COLL_CHECK_TASK -1)           		; LOAD PLAYER COLLISION CHECK TASK ADDRESS() -1  = $9006-1 = BANK 23 
	LDA #>(BANK_JUMP_START_COLL_CHECK_TASK -1)          	    ;
	LDX #COLLISION_CHECK_TASK                       ; SET TASK INDEX = TASK 5 = COLLISION CHECK TASK
	JSR CREATE_TASK                                 ; CREATE TASK(Y,A= ADDRESS, X=TASK INDEX) 
	
@start_flicker_players_task:
	LDA #SPRITE_FLICKERING_LOGIC_BANK               ; SET FLICKER PLAYERS TASK (TASK 7) BANK = BANK 23
	STA FLICKER_PLAYERS_TASK + TASK_BANK            ; 
	LDY #<(BANK_JUMP_FLICKER_SPRITES_TASK -1)                 ;
	LDA #>(BANK_JUMP_FLICKER_SPRITES_TASK -1)                      ; 
	LDX #FLICKER_PLAYERS_TASK	                    ; SET TASK INDEX = TASK 7 = FLICKER PLAYERS TASK
	JSR CREATE_TASK                                 ; CREATE TASK(Y,A= ADDRESS, X=TASK INDEX) 
	
@initialize_player_sprite_banks_and_timer: 
	LDA #NUM_ANI_FRAMES_PLAYER_SPRITES              ; SET PLAYER ANIMATION TIMER  = 06 FRAMES
	STA PLAYER_ANIMATION_TIMER                      ; 
	LDA #TUMBLE_X_MARKER_CHR_BANK                   ; SET SOFT_1C00_NAME_TABLE_CHR_BANK = 08 
	STA SOFT_CHR_1C00_BANK                          ; 
	LDA #JUMP_THROW_ON_GROUND_CHR_BANK              ; SET SOFT_1800_NAME_TABLE_CHR_BANK = 07 
	STA SOFT_CHR_1800_BANK                          ; 
	LDA #PLAYER_ANI_START_CHR_BANK                  ; SET SOFT_1000_NAME_TABLE_CHR_BANK = 00 
	STA SOFT_CHR_1000_BANK                          ; 
	LDA SOFT_PPU_CTRL                               ; SET SOFT_PPUMASK = ENABLE SPRITES IN LEFTMOST 8 PIXELS
	ORA #ppu_ctrl_8_by_16_bit_flag                  ; 
	STA SOFT_PPU_CTRL                               ; 
	LDA #$00                                        ; SET SIDELINE ANIMATION TIMER = 0 
	STA SIDELINE_ANI_TIMER                          ; 
	RTS                                             ; RETURN

_F}_INIT_PLAYER_RAM_FUNCTION_ADDRESSES	

_F{_LOAD_PLAYER_SKILLS_INTO_PLAYER_RAM				; DONE 	
	
curr_player_addr		= LOCAL_3

current_position_id		= LOCAL_6

	
SET_ALL_PLAYER_RAM_SKILLS:                 			; SET PLAYER SKILLS()
	LDA #<PLAYER_RAM_START                          ; SET PLAYER POINTER = P1 TEAM FIRST PLAYER =$039F
	STA curr_player_addr                            ;
	LDA #>PLAYER_RAM_START                          ; 
	STA curr_player_addr+1                          ;
	LDA #$00                                        ; SET CURRENT P1 POSITION ID = FIRST P1 SIDE PLAYER
	STA current_position_id                         ; 


SET_P1_SIDE_SKILLS: 
	
_WHILE CC                                  ; SET PLAYER 1 SIDE PLAYER SKILLS LOOP 
	LDA current_position_id                         ; SET P1 POSITION ID = CURRENT P1 POSITION ID
	LDY #POSITION_ID                                ;
	STA (curr_player_addr),Y                        ;
	BIT POSSESSION_STATUS                           ; IS P1 ON DEFENSE?
	BMI @p1_on_defense                              ; YES-> P1 ON DEFENSE
	
@set_p1_offensive_skills:	
	JSR SET_OFFENSIVE_PLAYER_SKILLS                 ; SET OFFENSIVE PLAYER SKILLS ($40 = PLAYER POINTER)
	JMP @check_done_p1                                 ; JUMP TO CHECK IF DONE WITH PLAYER 1 SKILLS

@p1_on_defense:                                     ; P1 ON DEFENSE
	
@check_p1_man:	
	LDA TEAM_CONTROL_TYPES                          ; IS P1 PLAYER TYPE = MAN
	AND #$F0                                        ;
	BEQ @set_p1_defensive_skills                       ; YES->SET NORMAL DEFENSE SKILLS
	
	LDA TEAM_CONTROL_TYPES                          ; IS P2 PLAYER TYPE = COA,COM, SKP
	AND #$0F                                        ;
	BNE @set_p1_defensive_skills                       ; YES->SET NORMAL DEFENSE SKILLS
	
@add_com_boosts_to_p1_defense	
	JSR SET_DEFENSIVE_SKILLS_WITH_COM_BOOST          ; SET BOOSTED COM DEFENSIVE RS,RP,MS AND NORMAL HP($40 = PLAYER POINTER)
	JMP @check_done_p1                                 ; JUMP TO CHECK IF DONE WITH PLAYER 1 SKILLS

@set_p1_defensive_skills:                             ; SET P1 NORMAL DEFENSE SKILLS
	JSR SET_DEFENSIVE_PLAYER_SKILLS                 ; SET DEFENSIVE PLAYER SKILLS NORMAL($40 = PLAYER POINTER)

@check_done_p1:                                        ; CHECK IF DONE WITH PLAYER 1 SKILLS
	LDA current_position_id                           ; IS CURRENT P1 POSITION ID > LAST P1 PLAYER
	CMP #NUM_PLAYERS_ON_FIELD                       ;
	
_END_WHILE                                 			; NO-> SET PLAYER 1 SIDE PLAYER SKILLS LOOP


SET_P2_SIDE_SKILLS:		
	LDA #P2_SIDE_BITFLAG                            ; SET CURRENT P2 POSITION ID = FIRST P2 SIDE PLAYER
	STA current_position_id
_WHILE CC                                           ; SET PLAYER 2 SIDE PLAYER SKILLS LOOP
	
	LDA current_position_id                         ; SET POSITION ID = CURRENT P2 POSITION ID
	LDY #POSITION_ID                                ;
	STA (curr_player_addr),Y                        ;
	BIT POSSESSION_STATUS                           ; IS P1 ON DEFENSE?
	BPL @p2_on_defense                              ;
	
@set_p2_offensive_skills:	
	JSR SET_OFFENSIVE_PLAYER_SKILLS                 ; SET OFFENSIVE PLAYER SKILLS ($40 = PLAYER POINTER)
	JMP @check_done_p2                              ; JUMP->CHECK IF DONE WITH PLAYER 2 SKILLS

@p2_on_defense:                                          ; P2 ON DEFENSE
	LDA TEAM_CONTROL_TYPES                          ; IS P2 PLAYER TYPE = MAN
	AND #$0F                                        ;
	BEQ @set_p2_defensive_skills                    ;
	
	LDA TEAM_CONTROL_TYPES                          ; IS P1 PLAYER TYPE = COA,COM, SKP
	AND #$F0                                        ;
	BNE @set_p2_defensive_skills                    ; YES-> SET NORMAL DEFENSE SKILLS

@add_com_boosts_to_p2_defense	
	JSR SET_DEFENSIVE_SKILLS_WITH_COM_BOOST         ; SET BOOSTED COM DEFENSIVE RS,RP,MS AND NORMAL HP($40 = PLAYER POINTER)
	JMP @check_done_p2                              ; JUMP->CHECK IF DONE WITH PLAYER 2 SKILLS

@set_p2_defensive_skills:                            ; SET P2 NORMAL DEFENSE SKILLS
	JSR SET_DEFENSIVE_PLAYER_SKILLS                 ; SET DEFENSIVE PLAYER SKILLS NORMAL($40 = PLAYER POINTER)

@check_done_p2:                                     ; CHECK IF DONE WITH PLAYER 2 SKILLS
	LDA current_position_id                         ; IS CURRENT P2 POSITION ID > LAST P2 PLAYER
	CMP #(NUM_PLAYERS_ON_FIELD + P2_SIDE_BITFLAG)   ;

_END_WHILE                                   		; NO->SET PLAYER 2 SIDE PLAYER SKILLS LOOP
	
	RTS                                             ; RETURN 


SET_OFFENSIVE_PLAYER_SKILLS:                        ; SET OFFENSIVE PLAYER SKILLS ($40 = PLAYER POINTER)
rushing_power_and_running_speed_temp	= LOCAL_8

													; SET OFFENSIVE SPEED
	LDY #MAX_SPEED_INDEX                            ; SET SKILL INDEX = MAX SPEED INDEX 
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	LDA OFF_MAX_SPEED_VALS,Y                        ; LOAD SPEED VALUE FROM OFFENSIVE MAX SPEED TABLE
	JMP SET_PLAYER_RUNNING_SPEED                    ; JUMP->SET PLAYER SPEED

SET_DEFENSIVE_PLAYER_SKILLS:                        ; SET DEFENSIVE PLAYER SKILLS NORMAL($40 = PLAYER POINTER)
	LDY #MAX_SPEED_INDEX                            ; SET SKILL INDEX = MAX SPEED INDEX
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	LDA DEF_MAX_SPEED_VALS,Y                        ; LOAD SPEED VALUE FROM DEFENSIVE MAX SPEED TABLE

SET_PLAYER_RUNNING_SPEED:                           ; SET PLAYER SPEED
	LDY #MAX_SPEED                                  ; SET CURRENT PLAYER MAX SPEED = MAX SPEED VALUE
	STA (curr_player_addr),Y                        ; 
	LDY #RUSHING_POWER_INDEX                        ; SET SKILL INDEX = RUSHING POWER INDEX
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	SHIFT_LEFT_4
	PHA                                             ; SAVE RUSHING POWER 
	LDY #RUNNING_SPEED_INDEX                        ; SET SKILL INDEX = RUNNING SPEED
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	STA rushing_power_and_running_speed_temp        ; COMBINE RP AND RS INTO BYTE
	PLA                                             ;
	ORA rushing_power_and_running_speed_temp        ;
	LDY #RP_RS_INDEXES                              ; SET CURRENT PLAYER RP/RS = RP/RS VALUE
	STA (curr_player_addr),Y                        ;
	JMP SET_PLAYER_HP_AND_SKIN_COLOR                ; JUMP->SET PLAYER HITTING POWER

SET_DEFENSIVE_SKILLS_WITH_COM_BOOST:                ; SET BOOSTED COM DEFENSIVE RS,RP,MS AND NORMAL HP($40 = PLAYER POINTER)
	LDY #MAX_SPEED_INDEX                            ; SET SKILL INDEX = MAX SPEED INDEX
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	LDA DEF_MAX_SPEED_VALS,Y                        ; LOAD SPEED VALUE FROM DEFENSIVE MAX SPEED TABLE 
	CLC                                             ;
	ADC CPU_DEF_MS_BOOST                            ; + DEFENSIVE COM MAXIMUM SPEED BOOST
	LDY #MAX_SPEED                                  ; 
	STA (curr_player_addr),Y                        ; 
	LDY #RUSHING_POWER_INDEX                        ; LOAD RUSHING POWER SKILL INDEX 
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	JSR ADD_COM_DEF_MS_BOOST                                   ; ADD COM DEFENSIVE RS,RP,MS BOOST INDEX, SET TO MAX VALUE IF TO LARGE(A= MAX SPEED INDEX)
	SHIFT_LEFT_4
	PHA                                             ; SAVE RUSHING POWER NIBBLE
	LDY #RUNNING_SPEED_INDEX                        ; LOAD RUNNING SPEED SKILL INDEX
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	JSR ADD_COM_DEF_MS_BOOST                                   ; ADD COM DEFENSIVE RS,RP,MS BOOST INDEX, SET TO MAX VALUE IF TO LARGE(A= MAX SPEED INDEX)
	STA rushing_power_and_running_speed_temp        ; COMBINE RP AND RS INTO BYTE
	PLA                                             ;
	ORA rushing_power_and_running_speed_temp        ;
	LDY #$0F                                        ; SET CURRENT PLAYER RP/RS = RP/RS VALUE
	STA (curr_player_addr),Y                        ;

SET_PLAYER_HP_AND_SKIN_COLOR:                       ; SET PLAYER HITTING POWER
	LDY #HITTING_POWER_INDEX                        ; SET SKILL INDEX = HITTING POWER INDEX
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	TAX                                             ;
	LDA HITTING_POWER_VALS,X                        ; LOAD HITTING POWER FROM HITTING POWER TABLE
	LDY #HP_INDEX                                   ; SET CURRENT PLAYER HITTING POWER  = HITTING POWER
	STA (curr_player_addr),Y                        ; 
	
	LDY #PLAYER_FACE_INDEX                          ; SET SKILL INDEX = FACE INDEX
	JSR GET_PLAYER_SKILL                            ; GET PLAYER SKILL ( Y= SKILL INDEX)
	AND #$80                                        ; 
	LDY #$00                                        ; SAVE SKIN COLOR
	STA (curr_player_addr),Y                        ;
	
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] curr_player_addr, SIZE_OF_EACH_PLAYER_RAM 
	INC current_position_id                          ; PLAYER ID ++
	RTS                                             ; RETURN

GET_PLAYER_SKILL:                                   ; GET PLAYER SKILL ( Y= SKILL INDEX, $43= PLAYER ID)

starter_or_position_id		= LOCAL_6
position_id					= LOCAL_6
starter_id					= LOCAL_6
skill_index 				= LOCAL_8

	STY skill_index                                 ; SAVE PLAYER SKILL INDEX
	LDA starter_or_position_id                                  ; LOAD POSITION ID
	AND #$1F                                        ; MASK OUT P1/P2 SIDE
	CMP #KICKER_STARTER_ID                          ; IS PLAYER ID = KR,PR,K,P
	BCS @get_special_teams_player_roster_id         ; YES->GET SPECIAL TEAMS PLAYER ACTUAL PLAYER ID
	
	LDA position_id                                 ; LOAD POSITION ID
	JSR GET_TEAM_AND_STARTER_FROM_POS_ID            ; GET STARTER ID AND TEAM ID (A= POSITION ID)
	JMP @load_skill                                 ;

@get_special_teams_player_roster_id:                ; GET SPECIAL TEAMS PLAYER ACTUAL PLAYER
	LDA starter_id                                  ; LOAD POSITION ID
	JSR GET_TEAM_AND_STARTER_FROM_STARTER_ID        ; GET STARTER ID AND TEAM ID (A= POSITION ID) RET X= TEAM, A = ACTUAL PLAYER

@load_skill:                         				; LOAD PLAYER SKILL/FACE
	LDY skill_index                                 ; LOAD PLAYER SKILL INDEX
	JSR GET_PLAYER_SKILL_OR_FACE                    ; GET PLAYER SKILL OR FACE (A=ACTUAL PLAYER, X=TEAM, Y=FACE OR SKILL)
	TAX                                             ; SAVE SKILL/FACE
	RTS                                             ; RETURN

ADD_COM_DEF_MS_BOOST:                               ; ADD COM DEFENSIVE SPEED BOOST INDEX, SET TO MAX VALUE IF TO LARGE(A= MAX SPEED INDEX)
	CLC                                             ; = MAX SPEED INDEX
	ADC CPU_DEF_MS_BOOST                            ; +  COM DEFENSIVE SPEED BOOST INDEX
	CMP #MAX_SKILL + 1                               ; IS INDEX < MAX INDEX?
	BCC @exit                                       ; YES-> EXIT
	
	LDA #MAX_SKILL                                  ; SET MAXIMUM SPEED SKILL INDEX = MAX INDEX

@exit:                                          ; EXIT
	RTS                                          	; RETURN

_F}_LOAD_PLAYER_SKILLS_INTO_PLAYER_RAM	

_F{_SOUND_MODE_SONG_TABLE							; DONE

SOUND_SCREEN_SONG_TABLE:                            ; SOUND INDEX TABLE FOR SOUND MODE SCREEN


													; SONGS
	.DB INTRO_ALT_SONG    
	.DB INTRO_PT1_SONG    
	.DB INTRO_PT2_SONG   
	.DB P1_PROBOWL_SONG    
	.DB P2_PROBOWL_SONG    
	.DB P1_PLAYOFF_SONG     
	.DB P2_PLAYOFF_SONG    
	.DB P1_SEASON_SONG   
	.DB P2_SEASON_SONG    
	.DB P1_PRE_SEASON_SONG   
	.DB P2_PRE_SEASON_SONG   
	.DB SB_WINNGER_SONG    
	.DB SB_CREDITS_SONG    
													; SHORT SONGS
								
	.DB KICKOFF_SONG    
	.DB RUSHING_TD_SONG    
	.DB SAFETY_SONG     
	.DB TOUCHBACK_SONG    
	.DB INT_SONG     
	.DB CHANGE_SIDE_SONG   
	.DB P1_FD_SONG     
	.DB P2_FD_SONG     
	.DB MADE_FG_SONG    
	.DB MISSED_FG_SONG         
	.DB INJURY_SONG     
	.DB END_QTR_SONG    
	.DB HALFTIME_SONG    
	.DB CHAINS_SONG     
	.DB STATS_SONG      
	.DB CONF_CHAMP_SONG    
	.DB DIV_CHAMP_SONG    
	.DB STANDINGS_SONG     
	.DB UNUSED_SONG     
	.DB INJURY_RETURN_SONG   
	.DB PASSING_TD_SONG    
	.DB SACK_SONG 
													; SOUND EFFECTS
	.DB FUMBLE_SOUND            
	.DB THROW_SOUND       
	.DB SNAP_TOSS_SOUND	
	.DB KICK_SOUND
	.DB CATCH_SOUND
	.DB BALL_BOUNCE_SOUND        
	.DB WHISTLE_SOUND
	.DB BALL_HIT_HAND_SOUND
	.DB TWO_MIN_WARN_SOUND
	.DB CLOCK_TICK_SOUND       
	.DB GUNSHOT_SOUND
	.DB CROSSBAR_HIT_SOUND
	.DB START_SOUND
	.DB COIN_TOSS_CHOOSE_SOUND
	.DB COIN_TOSS_SELECT_SOUND
	.DB SCHEDULE_SELECT_SOUND
	.DB COLLISSION_SOUND
	.DB WHOOSHING_AIR_SOUND

							
													; DMC SAMPLES
	.DB CROWD_RUN_TD_SOUND                          ; CROWD TD
	.DB CROWD_PASS_TD_SOUND                         ; CROWD
	.DB CROWD_MADE_XP_SOUND                         ; XP CROWD
	.DB READY_DMC                                   ; “SET” 
	.DB DOWN_DMC                                    ; “DOWN”
	.DB HUT_DMC                                     ; “HUT”
	.DB TOUCHDOWN_DMC                               ; “TOUCHDOWN”
     
	 END_OF_SONG_TABLE: 
	 
_F}_SOUND_MODE_SONG_TABLE 
	
_F{_DRAW_ALL_GAME_STATS_UNUSED						; DONE	*** unused

roster_id				= SEGMENT_VAR_8E
current_stat_index		= SEGMENT_VAR_8F
stat_table_index		= SEGMENT_VAR_90
number_of_stats_left	= SEGMENT_VAR_92
current_stat_ppu_addr	= SEGMENT_VAR_9E

temp_value				= LOCAL_3
decimal_value			= LOCAL_7

END_FOF_GAME_STATS_UNUSED_TEAM_ID_PPU_ADDR			= $20CA
END_FOF_GAME_STATS_UNUSED_ROSTER_ID_PPU_ADDR		= $20CD
END_FOF_GAME_STATS_UNUSED_STAT_VALUE_PPU_ADDR		= $2128
	
DRAW_ALL_END_OF_GAME_STATS_UNUSED:                      ; DRAW SRAM PLAYER STATS 

@reset_team_id_to_p1:
	LDA #P1_SIDE_ID                                 ; SET CURRENT TEAM = P1
	STA END_OF_GAME_STATS_TEAM_UNUSED               ;

@reset_roster_id_stat_index:                         ; SET CURRENT PLAYER TO FIRST PLAY AND RESET STAT TABLE INDEX
	LDA #$00                                        ; 
	STA roster_id                                   ; SET CURRENT SEASON PLAYER ID = FIRST PLAYER
	STA stat_table_index                            ; SET STAT TO GET = FIRST STAT

@clear_screen:                                             ; CLEAR NAMETABLES AND DRAW CURRENT PLAYER STATS
	JSR SET_BG_SPR_FULLY_FADED_OUT                  ; SET PALLETES TO FULLY FADED OUT()
	JSR CLEAR_ALL_NAMETABLES                        ; CLEAR NAMETABLES $2000-$2BFF()
	LDA #$00                                        ; SET BACKGROUND PALLETE INDEX
	LDX #$00                                        ; SET SPRITE PALLETE INDEX
	JSR SET_BG_SPR_PAL_SET_FULLY_FADED_IN           ; UPDATE PALLETES,SOFT PALLETES AND SET PALLETE FADE TO FULLY FADED IN(A= BACKGROUND, X = SPRITE)
	

@draw_team_id:	
	LDA END_OF_GAME_STATS_TEAM_UNUSED                ; LOAD CURRENT TEAM
	SET_ADDR_XY[addr] END_FOF_GAME_STATS_UNUSED_TEAM_ID_PPU_ADDR                                     ; SET CURRENT TEAM PPU LOCATION = $20CA
	JSR CONVERT_2_DIG_NUM_TILES                     ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)

@draw_roster_id:
	LDA roster_id                                   ; LOAD CURRENT SEASON PLAYER ID
	JSR HEX_TO_2_DIGIT_DEC                          ; CONVERT 8 BIT HEX NUMBER TO BINARY DECIMAL (A= HEX)
	LDA decimal_value                               ; LOAD CURRENT PLAYER
	SET_ADDR_XY[addr] END_FOF_GAME_STATS_UNUSED_ROSTER_ID_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES                     ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)

@set_stat_draw_loc:	
	LDA #<END_FOF_GAME_STATS_UNUSED_STAT_VALUE_PPU_ADDR                                     ; SET STAT ID DRAW LOC = $2128
	STA current_stat_ppu_addr                       ;
	LDA #>END_FOF_GAME_STATS_UNUSED_STAT_VALUE_PPU_ADDR                                     ;
	STA current_stat_ppu_addr + 1                   ;
	
@init_stat_to_Get_and_num_stats:	
	LDX stat_table_index                            ; LOAD STAT INDEX
	LDA UNUSED_STAT_INDEX_TABLE,X                   ; SET FIRST STAT INDEX FROM STAT INDEX TABLE
	STA current_stat_index                          ;
	
	LDA UNUSED_STAT_INDEX_TABLE+1,X                 ; SET NUMBER OF STATS FOR PLAYER TYPE FROM STAT INDEX TABLE
	STA number_of_stats_left                                         ; 

_WHILE NOT_EQUAL                                     ; DRAW END OF GAME PLAYER STATS CURRENT PLAYER
	LDA roster_id                                   ; LOAD PLAYER ID
	
	LDX current_stat_index                           ; LOAD STAT TO GET
	JSR SWAP_AND_GET_CURRENT_GAME_STATS             ; GET CURRENT GAME STATS
	JSR HEX_TO_3_DIGIT_DEC                          ; CONVERT 16 BIT HEX NUMBER TO BINARY DECIMAL () RET $40,$41
	COPY_16_ZP_TO_ZP[source_dest] temp_value, decimal_value
	LDA current_stat_ppu_addr                       ; SET PPU ADDR += 5 TILES
	CLC                                             ;
	ADC #$05                                        ;
	TAY                                             ;
	LDX_ABS_ZP current_stat_ppu_addr+1              ; *** can fix  
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES             ; SAVE 4 DIGIT NUMBER TO BUFFER($44,45)
	
	
	LDA current_stat_index                          ; LOAD CURRENT STAT TO GET
	JSR HEX_TO_2_DIGIT_DEC                          ; CONVERT 8 BIT HEX NUMBER TO BINARY DECIMAL (A= HEX)
	
	LDY current_stat_ppu_addr                       ; LOAD PPU ADDR
	LDX current_stat_ppu_addr+1                     ;
	LDA decimal_value                               ; LOAD STAT ID
	JSR CONVERT_2_DIG_NUM_TILES                     ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] current_stat_ppu_addr, LENGTH_OF_ONE_ROW
    
	INC current_stat_index                          ; STAT TO GET++
	DEC number_of_stats_left                       ; NUMBER OF STATS TO GET--

_END_WHILE                                      	; DONE WITH DRAWING STATS? NO-> DRAW END OF GAME PLAYER STATS CURRENT PLAYER

_WHILE EQUAL:                                       ; CHECK FOR JOYPAD INPUT LOOP

	RETURN_1_FRAME
	LDA JOY_PRESS_1                                 ; IS "A" PRESSED
	BMI @a_pressed                                  ; YES->INCREMENT TO NEXT PLAYER SKIP IF OL
	AND #START_BUTTON                               ; IS START PRESSED

_END_WHILE                                      	; NO->CHECK FOR JOYPAD INPUT LOOP
	RTS                                             ; RETURN

@a_pressed:                                         ; INCREMENT TO NEXT PLAYER SKIP IF OL
	LDX roster_id                                   ; CURRENT PLAYER ++ 
	INX                                             ;
	CPX #C_ROSTER_ID                                ; IS CURRENT PLAYER = CENTER?
	BNE @save_roster_id                            ; NO-> SAVE CURRENT PLAYER AND UPDATE TABLE ADDRESS

@set_to_first_defender_roster_id	
	LDX #RE_ROSTER_ID                               ; SET CURRENT PLAYER = FIRST DEFENSIVE PLAYER

@save_roster_id:                                    ; SAVE CURRENT PLAYER AND UPDATE TABLE ADDRESS
	STX roster_id                                   ; SAVE CURRENT PLAYER 
	INC stat_table_index                            ; SET STAT TABLE ADDRESS = NEXT ENTRY
	INC stat_table_index                            ;
	LDX stat_table_index                            ;
	LDA UNUSED_STAT_INDEX_TABLE,X                   ; AT END OF STATS TABLE?
	BMI @go_to_next_player_side_team                ; YES->SET IN GAME TEAM
	JMP @clear_screen                               ; JUMP->CLEAR NAMETABLES AND DRAW CURRENT PLAYER STATS

@go_to_next_player_side_team:                       ; SET IN GAME TEAM 
	INC END_OF_GAME_STATS_TEAM_UNUSED               ; CURRENT TEAM ++
	LDA END_OF_GAME_STATS_TEAM_UNUSED               ; IS CURRENT TEAM > P2 
	CMP #P2_SIDE_ID + 1                             ; 
	BCS @reset_to_p1                                 ; YES->RESET TO FIRST PLAYER ON P1 TEAM
	JMP @reset_roster_id_stat_index                 ; JUMP-> SET CURRENT PLAYER TO FIRST PLAYER AND RESET STAT TABLE INDEX

@reset_to_p1:                                        ; RESET TO FIRST PLAYER ON P1 TEAM
	JMP @reset_team_id_to_p1               			; JUMP -> DRAW END OF GAME PLAYER STATS 

UNUSED_STAT_INDEX_TABLE:                           			; STAT INDEX TABLE
															; FIRST STAT TO GET, NUMBER OF STATS TO GET
	.DB $00 , $08                                           ; QB0
	.DB $00 , $08                                           ; QB1
	.DB $08 , $0C                                           ; RB1
	.DB $08 , $0C                                           ; RB2
	.DB $08 , $0C                                           ; RB3
	.DB $08 , $0C                                           ; RB4
	.DB $08 , $0C                                           ; WR1
	.DB $08 , $0C                                           ; WR2
	.DB $08 , $0C                                           ; WR3
	.DB $08 , $0C                                           ; WR4
	.DB $08 , $0C                                           ; TE1
	.DB $08 , $0C                                           ; TE2
	.DB $14 , $04                                           ; DL1 
	.DB $14 , $04                                           ; DL2 
	.DB $14 , $04                                           ; DL3  
	.DB $14 , $04                                           ; LB1
	.DB $14 , $04                                           ; LB2
	.DB $14 , $04                                           ; LB3
	.DB $14 , $04                                           ; LB4
	.DB $14 , $04                                           ; DB1
	.DB $14 , $04                                           ; DB2
	.DB $14 , $04                                           ; DB3
	.DB $14 , $04                                           ; DB4
	.DB $18 , $04                                           ; K 
	.DB $1C , $02                                           ; P 
	.DB $FF                                             ; END OF TABLE

_F}_DRAW_SEASON_STATS_UNUSED	

_F{_DRAW_CURRENT_PLAY_STATS_UNUSED					; DONE	*** unused

text_data_addr							= LOCAL_1
temp_result								= LOCAL_3
decimal_value							= LOCAL_7

TEXT_PPU_ADDR							= $210A 
PLAY_YARDAGE_CURRENT_TEAM_PPU_ADDR		= $2173
PLAY_YARDAGE_ROSTER_ID_PPU_ADDR			= $21B3
PLAY_YARDAGE_PLAY_TYPE_PPU_ADDR			= $21F3
PLAY_YARDAGE_NEG_SIGN_PPU_ADDR			= $2230
PLAY_YARDAGE_YARDS_PPU_ADDR				= $2231




DRAW_SRAM_IN_GAME_PLAYER_STATS_UNUSED:              ; SHOW CURRENT YARDS FOR IN GAME PLAYER(AFTER PLAY) UNUSED
	SUSPEND_TASK_DIRECT[task] UPDATE_CLOCK_TASK
	
	JSR SET_BG_SPR_FULLY_FADED_OUT                  ; SET PALLETES TO FULLY FADED OUT()
	JSR CLEAR_ALL_NAMETABLES                        ; CLEAR ALL NAMETABLES $2000-$2BFF()
	JSR SET_ALL_SPR_OFFSCREEN                       ; SET ALL SPRITE Y POSITIONS TO OFFSCREEN ()

@clear_scroll:	
	LDA #$00                                        ; SET IRQ0 X SCROLL = TOP LEFT OF SCREEN = 0,0
	STA IRQ_0_XSCROLL                               ; 
	STA CURR_IRQ_NAMETABLE                          ;
	STA IRQ_0_COUNTER                               ; SET IRQ0 COUNTER = 0 
	LDA #$18                                        ; SET IRQ0_BG_$0000_CHR_BANK = 24 
	STA IRQ_0_BG_0000                               ;

@draw_bg_text:		
	SET_ADDR_XY[addr] TEXT_PPU_ADDR					; SET PPU ADDR  = SCREEN TEXT DRAW LOC
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] CURRENT_PLAY_TEXT_DATA, text_data_addr
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS    ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES


@draw_team_id:	
	LDA_ABS_A_ZP TEAM_ON_OFFENSE                    ; LOAD CURRENT TEAM *** uses macro to match original rom output 
	SET_ADDR_XY[addr] PLAY_YARDAGE_CURRENT_TEAM_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES                     ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	

@draw_roster_id:	
	LDA PLAY_YARDAGE_ROSTER_ID                      ; LOAD PLAYER ID
	JSR HEX_TO_2_DIGIT_DEC                          ; CONVERT HEX NUMBER TO BCD(A= HEX
	LDA decimal_value                               ; LOAD DECIMAL PLAYER ID
	SET_ADDR_XY[addr] PLAY_YARDAGE_ROSTER_ID_PPU_ADDR	
	JSR CONVERT_2_DIG_NUM_TILES                     ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)

@draw_stat_type_id:	
	LDA PLAY_YARDAGE_PLAY_TYPE                      ; LOAD STAT TYPE *** guess since function not used
	JSR HEX_TO_2_DIGIT_DEC                          ; CONVERT HEX NUMBER TO BCD(A= HEX
	LDA decimal_value                               ; LOAD DECIMAL STAT TYPE?
	SET_ADDR_XY[addr] PLAY_YARDAGE_PLAY_TYPE_PPU_ADDR
	JSR CONVERT_2_DIG_NUM_TILES                     ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)

temp_yardage = LOCAL_7
	
	LDA PLAY_YARDAGE_VALUE                          ; SAVE TEMP YARDAGE VALUE = DEBUG YARDAGE VALUE
	STA temp_yardage                                ;
	LDA PLAY_YARDAGE_VALUE+1                        ;
	STA temp_yardage+1                              ;
	BMI @draw_negative_sign_and_negate_value        ; IS VALUE NEGATIVE? YES-> TAKE ABSOLUTE VALUE AND DRAW NEGATIVE SIGN
	JMP @convert_yadrage_to_dec                     ; NO-> CONVERT YARDAGE VALUE TO DECIMAL AND DRAW

@draw_negative_sign_and_negate_value:               ; TAKE ABSOLUTE VALUE AND DRAW NEGATIVE SIGN
	SET_ADDR_XY[addr] PLAY_YARDAGE_NEG_SIGN_PPU_ADDR ;  SET PPU ADDR  = NEGATIVE SIGN 
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] NEGATIVE_SIGN_TEXT_DATA , text_data_addr
	JSR TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS    ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES

@negate_value_16_bit:	
	LDA #$00                                        ; = ABS (VALUE) = 1 – (NEGATIVE VALUE)
	SEC                                             ;
	SBC PLAY_YARDAGE_VALUE                          ;
	STA temp_yardage                                ;
	LDA #$00                                        ;
	SBC PLAY_YARDAGE_VALUE +1                       ;
	STA temp_yardage+1                              ;

@convert_yadrage_to_dec:                            ; CONVERT YARDAGE VALUE TO DECIMAL AND DRAW
	JSR HEX_TO_3_DIGIT_DEC                          ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)
	COPY_16_ZP_TO_ZP[source_dest] temp_result, decimal_value
	SET_ADDR_XY[addr] PLAY_YARDAGE_YARDS_PPU_ADDR
	JSR CONVERT_4_DIGIT_NUMBER_TO_TILES             ; SAVE 4 DIGIT NUMBER TO BUFFER
	JSR SET_BG_SPR_FULLY_FADED_IN                   ; SET PALLETES TO FULLY FADED IN()

_WHILE EQUAL                                         ; CHECK FOR A OR B TO EXIT LOOP

	LDA JOY_PRESS_BOTH                               ; DOES JOY PRESS = A/B?
	AND #(A_BUTTON +B_BUTTON)                        ;

_END_WHILE                                          ; NO->CHECK FOR A OR B TO EXIT LOOP

@fade_out
	JSR SET_BG_SPR_FULLY_FADED_OUT                  ; SET PALLETES TO FULLY FADED OUT()

@resume_clock:	
	LDX #UPDATE_CLOCK_TASK                          ; SET TASK INDEX = UPDATE CLOCK
	JSR RESUME_TASK                                 ; RESUME TASK (X= TASK INDEX)
	LDA #$20                                        ; SET IRQ0 COUNTER = 32 
	STA IRQ_0_COUNTER                               ;
	RTS                                             ; RETURN

CURRENT_PLAY_TEXT_DATA:                              ; SCREEN TEXT INFO
	.DB $0C                                         ; SET DATA LENGTH = 12  
	.DB "BACK UP DATA"                           	;
	.DB $A3                                         ; DOWN 3 ROWS
	.DB $05                                      	; SET DATA LENGTH = 5
	.DB " TEAM"                                  	;
	.DB $A2                                         ; DOWN 2 ROWS
	.DB $07                                      	; SET DATA LENGTH = 7
	.DB " PLAYER"                                	; 
	.DB $A2                                         ; DOWN 2 ROWS
	.DB $05                                      	; SET DATA LENGTH = 5
	.DB " WORK"                                  	;
	.DB $A2                                         ; DOWN 2 ROWS
	.DB $05                                      	; SET DATA LENGTH = 5
	.DB " YARD"                                  	;
	.DB $FF                                         ; END OF DATA

NEGATIVE_SIGN_TEXT_DATA:                            ; DASH TEXT INFO
	.DB $01                                         ; SET LENGTH = 1
	.DB $5D                                     	; SET TILE ID = DASH
	.DB $FF                                         ; END OF DATA


	.PAD $9A00,$FF                                  ; FILL ROM 

_F}_DRAW_CURRENT_PLAY_STATS_UNUSED

_F{_CRASH_HANDLER									; DONE	

cur_ram_location					= LOCAL_1
cur_ram_ppu_addr					= LOCAL_3
values_left_in_row					= LOCAL_7

button_pressed						= LOCAL_8
	
OFFSET_TO_LETTER_TILES				= $07
END_OF_CRASH_PPU_DATA				= $FF 

CRASH_SCREEN_TITLE_PPU_ADDR			= $2068
CRASH_SCREEN_TEXT_TEXT_PPU_ADDR		= $20B0
CRASH_SCREEN_MEM_LABEL_PPU_ADDR		= $2101

NUMBER_OF_MEM_VALUES_PER_ROW		= $08
NUMBER_OF_MEMORY_ROWS_PER_SCREEN	= $08 
	
CRASH_HANDLER_START:                                ; CRASH HANDLER, DIISPLAY CURRENT RAM CONTENTS
	JMP @disable_irqs                                ; *** POINTLESS

@disable_irqs:
	MMC3_IRQ_DISABLE
	LDA #$80                                        ; SET BANK SELECT = FOUR 1KB BANKS($0000-$0FFF),  TWO 2KB BANKS($1000-$1FFF),  
	STA BANK_SELECT_MMC3                            ; 
	LDA #$18                                        ; SET BANK DATA =
	STA BANK_DATA_MMC3                              ; 
	LDA #$00                                        ; SET DMC IRQ = DISABLED
	STA APU_DMC_IRQ_FREQ                            ; 
	LDA #$40                                        ; SET APU IRQ = DISABLED
	STA APU_FRAME_COUNTER                           ; 
	LDA #$10                                        ; SET PPUCTRL = NT $2000, ACROSS, DEFUALT PATTERN TABLE, 8X8 SIZE, NMI ON 
	STA NES_PPU_CTRL                                 ; 
	LDA #$00                                        ; SET PPU MASK = DISABLE BG AND SPR RENDERING
	STA NES_PPU_MASK                                ; 
	STA NES_PPU_SCROLL                              ; SET PPU SCROLL LOC = 0,0
	STA NES_PPU_SCROLL                              ; 
	LDA NES_PPU_STATUS                              ; CLEAR VBLANK LATCH
	LDA #>$2000                                     ; SET PPU ADDR = $2000 = TOP LEFT CORNER
	STA NES_PPU_ADDR                                ;
	LDA #<$2000                                     ;
	STA NES_PPU_ADDR                                ;
	
@clear_ppu_data	
	LDY #$04                                        ; SET 0X100 BYTE PAGES TO CLEAR = 4
	LDA #$00                                        ; SET TILE TO DRAW = BLANK TILE
	TAX                                             ; SET INDEX = FIRST TILE
@clear_loop:                                        ; CLEAR NAME TABLE 1 ($2000-23FF)
	STA NES_PPU_DATA                                ; SET PPUDATA = TILE TO DRAW
	INX                                             ; PPU CURRENT ADDRESS++
	BNE @clear_loop                                 ;
	DEY                                             ; 0X100 BYTE PAGES TO CLEAR --
	BNE @clear_loop                                 ; 
	
	SET_ADDR_XY[addr] CRASH_SCREEN_TITLE_PPU_DATA		; DRAW TITLE TEXT, STACK LOCATION AND ERROR CODE 
	JSR CRASH_SCREEN_WRITE_DATA_TO_PPU              ; WRITE DATA TO PPU(X,Y= PPU DATA ADDR)
	

@draw_error_code:	
	LDA PROGRAM_CRASH_CODE                          ; LOAD ERROR CODE NUMBER
	CLC                                             ;
	ADC #OFFSET_TO_NUMBER_TILES                     ; ADD OFFSET TO NUMBER TILE
	STA NES_PPU_DATA                                ; 
	SET_ADDR_XY[addr] STACK_TEXT_PPU_DATA
	JSR CRASH_SCREEN_WRITE_DATA_TO_PPU              ; WRITE DATA TO PPU(X,Y= PPU DATA ADDR)
	
	
	TSX                                             ; LOAD CURRENT STACK LOCATION
	TXA                                             ;
	JSR CRASH_SCREEN_DRAW_HEX_VALUE     ; CONVERT HEX BYTE TO TILE IDS(A= BYTE)
	SET_ADDR_XY[addr] CRASH_SCREEN_PAL_DATA
	JSR CRASH_SCREEN_WRITE_DATA_TO_PPU              ; WRITE DATA TO PPU(X,Y= PPU DATA ADDR)

_WHILE ALWAYS                                       ; DRAW NEW PAGE
	
@set_memory_to_begin:	
	LDA #$00                                        ; SET ram location = $0000
	STA cur_ram_location                            ;
	STA cur_ram_location+1                            ;


	LDA #$20          								; *** pointless SET NUMBER OF ROWS = 32
	STA LOCAL_8                                     ;

@set_ppu_addr:                                      ; DRAW MEMORY LOCATION LABEL
	LDA #<CRASH_SCREEN_MEM_LABEL_PPU_ADDR           ; SET FIRST MEMORY LABEL PPU ADDR = $2101
	STA cur_ram_ppu_addr                            ;
	LDA #>CRASH_SCREEN_MEM_LABEL_PPU_ADDR           ;
	STA cur_ram_ppu_addr+1                          ;
	LDA #NUMBER_OF_MEM_VALUES_PER_ROW               ; BYTES LEFT TO DRAW = 8
	STA values_left_in_row                          ;

@set_ppu_addr_for_next_mem_label:                   ; DRAW ROW OF 8 BYTES
	LDA cur_ram_ppu_addr+1                          ; SET PPUADDR = TEMP PPU ADDR
	STA NES_PPU_ADDR                                ;
	LDA cur_ram_ppu_addr                            ; 
	STA NES_PPU_ADDR                                ;

@draw_mem_location:									; DRAWS MEMORY LOC LABEL FOR NEXT 8 BYTES	
	LDA cur_ram_location +1                         ; 
	JSR CRASH_SCREEN_DRAW_HEX_VALUE                 ; CONVERT HEX BYTE TO TILE IDS AND SAVE IN PPU(A= BYTE)
	LDA cur_ram_location                            ;
	JSR CRASH_SCREEN_DRAW_HEX_VALUE                 ; CONVERT HEX BYTE TO TILE IDS AND SAVE IN PPU(A= BYTE)
	LDA #$00                                        ; DUMMY WRITE
	STA NES_PPU_DATA                                ;
	STA NES_PPU_DATA                                ;
	LDY #$00                                        ; SET DATA INDEX = 0

@draw_eight_memory_values:
	LDA (cur_ram_location),Y                        ; LOAD DATA VALUE
	JSR CRASH_SCREEN_DRAW_HEX_VALUE    			    ; CONVERT HEX BYTE TO TILE IDS AND SAVE IN PPU(A= BYTE)
	LDA #$00                                        ;
	STA NES_PPU_DATA                                ;
	INY                                             ;
	CPY #NUMBER_OF_MEM_VALUES_PER_ROW               ;
	BNE @draw_eight_memory_values                   ;
	
	LDA cur_ram_location                            ; CURRENT LABEL VALUE  = CURRENT LABEL VALUE  +0X08
	CLC                                             ; 
	ADC ##NUMBER_OF_MEM_VALUES_PER_ROW              ;
	STA cur_ram_location                            ;
	LDA cur_ram_location+1                          ;
	ADC #$00                                        ;
	AND #$07                                        ; dont draw anything past 07FF 
	STA cur_ram_location+1                          ;
	
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] cur_ram_ppu_addr, (LENGTH_OF_ONE_ROW * 2)  
	DEC values_left_in_row                          ; BYTES LEFT TO DRAW-- 
	BNE @set_ppu_addr_for_next_mem_label            ; DONE WITH ROW OF 8 BYTES? NO->DRAW ROW OF 8 BYTES

	
	JSR CRASH_SCREEN_GET_P1_JOYPAD                  ; GET P1 JOYPAD()
	DEC button_pressed                              ; *** VALUE OVERWRITTEN BY JOYPAD LOOP
	BNE @set_ppu_addr                               ; if button pressed draw next page

_END_WHILE                                      	 ; JUMP->DRAW NEW PAGE

CRASH_SCREEN_WRITE_DATA_TO_PPU:                     ; WRITE DATA TO PPU(X,Y= PPU DATA ADDR)

ppu_addr_temp = LOCAL_1

	STY ppu_addr_temp                               ; SET TEMP PPU DATA ADDR = PPU DATA ADDR
	STX ppu_addr_temp +1                            ; 
	LDA NES_PPU_STATUS                              ; CLEAR VBLANK LATCH
	LDY #$01                                        ; SET PPU ADDR = ADDR AT DATA LOCATION
	LDA (ppu_addr_temp),Y                           ;
	STA NES_PPU_ADDR                                ;
	DEY                                             ;
	LDA (ppu_addr_temp),Y                           ;
	STA NES_PPU_ADDR                                ;
	
	LDY #$02                                        ; SET INDEX = START OF PPU DATA
_WHILE ALWAYS                                       ; SAVE DATA IN PPU LOOP
	LDA (ppu_addr_temp),Y                           ; DOES DATA VALUE = END OF DATA? 
	CMP #END_OF_CRASH_PPU_DATA                      ;
	BEQ @exit                                       ; YES-> EXIT
	
@save_data_in_ppu:	
	STA NES_PPU_DATA                                ; SAVE DATA IN PPU DATA
	INY                                             ; DATA ADDR++
_END_WHILE                                          ; JUMP-> SAVE DATA IN PPU LOOP

@exit:                                              ; EXIT
	RTS                                             ; RETURN

CRASH_SCREEN_DRAW_HEX_VALUE:           				; CONVERT HEX BYTE TO TILE IDS(A= BYTE)
	TAX                                             ; CONVERT UPPER DIGIT TO TILE
	LOG_SHIFT_RIGHT_4								; 
	CLC                                             ;
	ADC #OFFSET_TO_NUMBER_TILES                     ;
	CMP #LAST_NUMBER_TILE_ID + 1	                ; IS HEX DIGIT 0-9?
	BCC @draw_upper_digit                        ; YES->SAVE UPPER HEX DIGIT AND COVERT LOWER
	CLC                                             ; ADD OFFSET TO LETTERS AND SYMBOLS
	ADC #OFFSET_TO_LETTER_TILES                                        ;

@draw_upper_digit:                               ; SAVE UPPER HEX DIGIT AND COVERT LOWER
	STA NES_PPU_DATA                                ; SAVE TILE ID IN PPUDATA
	
@convert_lower_digit:	
	TXA                                             ; CONVERT LOWER DIGIT TO TILE
	AND #$0F                                        ;
	CLC                                             ;
	ADC #OFFSET_TO_NUMBER_TILES                     ;
	CMP #LAST_NUMBER_TILE_ID + 1                    ; IS HEX DIGIT 0-9?
	BCC @save_lower_digit                           ; YES-> SAVE DIGIT IN PPU DATA AND EXIT
	CLC                                             ; ADD OFFSET TO LETTERS AND SYMBOLS
	ADC #OFFSET_TO_LETTER_TILES                      ;

@save_lower_digit:                                  ; SAVE DIGIT IN PPU DATA AND EXIT
	STA NES_PPU_DATA                                ; SAVE TILE ID IN PPUDATA
	RTS                                             ; RETURN

joypad_state			= LOCAL_8	
	
CRASH_SCREEN_GET_P1_JOYPAD:                         ; GET P1 JOYPAD()
	LDA #$08                                        ; SET PPU MASK = SHOW BACKGROUND
	STA NES_PPU_MASK                                ;
	LDA #$00                                        ; SET PPU SCROLL = 0,0
	STA NES_PPU_SCROLL                              ;
	STA NES_PPU_SCROLL                              ;
	
_WHILE EQUAL                                        ; SHORT TIMED WAIT LOOP FOR JOYPAD CHECK

	LDX #$00                                        ;
	LDY #$00                                        ;
@tiny_wait:                                         ;
	DEY                                             ;
	BNE @tiny_wait                                  ;
	DEX                                             ;
	BNE @tiny_wait                                  ;
	
	STROBE_JOYPAD
	LDA #$00                                        ; CLEAR TEMP JOYPAD STATE
	STA joypad_state                                ;
	LDY #NUM_BUTTONS_TO_READ                        ; SET NUMBER OF JOYPAD BITS TO READ = 8 
@read_joypad_one:                                   ; GET P1 JOYPAD BUTTONS STATE
	LDA JOYPAD_1                                    ; READ CURRENT P1 JOYPAD BIT
	AND #$01                                        ;
	ORA joypad_state                                ; TEMP JOYPAD STATE = TEMP JOYPAD STATE + LATEEST JOYPAD BIT
	ROL                                             ; SHIFT LEFT
	STA joypad_state                                ; 
	DEY                                             ; NUMBER OF JOYPAD BITS TO READ--
	BNE @read_joypad_one                            ; DONE? NO-> GET P1 JOYPAD BUTTONS STATE
	TAX                                             ;

_END_WHILE                                     		; BUTTONS PRESSED? NO->SHORT TIMED WAIT LOOP FOR JOYPAD CHECK

@hide_background:									; 
	LDA #$00                                        ;
	STA NES_PPU_MASK                                ;
	STA NES_PPU_SCROLL                              ;
	STA NES_PPU_SCROLL                              ;
	RTS                                             ; RETURN

CRASH_EXTRA_READ_JOYPAD								; IMPPOSIBLE TO REACH
	STROBE_JOYPAD
	LDA #$00                                        ; CLEAR TEMP JOYPAD STATE
	STA joypad_state                                ;
	LDY #NUM_BUTTONS_TO_READ                        ; SET NUMBER OF JOYPAD BITS TO READ = 8
@read_joypad_one:                                   ; GET P2 JOYPAD BUTTONS STATE
	LDA JOYPAD_1                                    ; READ CURRENT P2 JOYPAD BIT
	AND #$01                                        ;
	ORA joypad_state                                ; TEMP JOYPAD STATE = TEMP JOYPAD STATE + LATEEST JOYPAD BIT
	ROL                                             ;
	STA joypad_state                                ;
	DEY                                             ; NUMBER OF JOYPAD BITS TO READ--
	BNE @read_joypad_one                            ; DONE? NO-> GET P2 JOYPAD BUTTONS STATE
	RTS                                             ; RETURN

CRASH_SCREEN_TITLE_PPU_DATA:                        ; SCREEN TITLE INFO
	.WORD CRASH_SCREEN_TITLE_PPU_ADDR               ; PPU ADDR
	.DB "PROGRAM ERROR   CODE "                       ; 
	.DB END_OF_CRASH_PPU_DATA                       ; END OF DATA

STACK_TEXT_PPU_DATA:                                ; STACK TEXT INFO
	.WORD CRASH_SCREEN_TEXT_TEXT_PPU_ADDR            	; PPU ADDR
	.DB "STACK "                                    ; 
	.DB END_OF_CRASH_PPU_DATA                       ; END OF DATA

CRASH_SCREEN_PAL_DATA:                             ; RAM VIEWER PALLETE TABLE 
	
	.WORD PPU_PALLETE_START                         ; PPU ADDRESS = PALLETE TABLE
	
	.DB COLOR_BLACK_2, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE                          ; BG PALLETE VALUES
	.DB COLOR_BLACK_2, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE 
	.DB COLOR_BLACK_2, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE 
	.DB COLOR_BLACK_2, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE

	.DB COLOR_BLACK_2, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE                          ; SPR PALLETE VALUES
	.DB COLOR_BLACK_2, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE
	.DB COLOR_BLACK_2, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE 
	.DB COLOR_BLACK_2, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE
	.DB END_OF_CRASH_PPU_DATA                                         ; END OF DATA
	
_F}_CRASH_HANDLER	

UNUSED_INF_LOOP_BANK_27:                            ; *** UNUSED INFINITE LOOP
	JMP UNUSED_INF_LOOP_BANK_27

.PAD $A000, $FF
