_F{_SCENE_SCRIPT_MACROS

	
	.MACRO SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] ppuaddr, dataddr									  
		   .DB >ppuaddr+$60, <ppuaddr, <dataddr, >dataddr		
	.ENDM

	.MACRO SET_BG_SCRIPT_PPU_ADDR[addr] ppuaddr									  
		   .DB >ppuaddr+$68 , <ppuaddr	
	.ENDM

	.MACRO DRAW_LINE_DOWN_AT_PPUADDR[addr_height_tile] ppuaddr, height, tile									  
		   .DB >ppuaddr+$70, <ppuaddr, height, tile	
	.ENDM

	.MACRO DRAW_LINE_ACROSS_AT_PPUADDR[addr_width_tile] ppuaddr, width, tile									  
		   .DB >ppuaddr+$78, <ppuaddr, width, tile	
	.ENDM

	.MACRO FILL_RECT_AT_PPUADDR[addr_height_width_tile] ppuaddr, height, width, tile									  
		   .DB >ppuaddr+$80, < ppuaddr, height, width, tile	
	.ENDM
	
	.MACRO DRAW_TILE_AT_PPUADDR[addr_tile] ppuaddr, tile									  
		   .DB >ppuaddr+$88, < ppuaddr,  tile	
	.ENDM
	
	.MACRO MOVE_DOWN_1_ROW[]									  
		.DB $B0																			
	.ENDM
	
	.MACRO MOVE_DOWN_2_ROWS[]									  
		.DB $B1																			
	.ENDM
	
	.MACRO MOVE_DOWN_3_ROWS[]									  
		.DB $B2																			
	.ENDM
	
	.MACRO MOVE_DOWN_4_ROWS[]									  
		.DB $B3																		
	.ENDM
	
	.MACRO MOVE_DOWN_6_ROWS[]									  
		.DB $B5																		
	.ENDM

	.MACRO SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] irq, counter, chr0Bank, chr1Bank						; SET IRQ (IRQ, COUNTER, CHR BANK 0, CHR BANK 1)											  
		.DB $C0, irq, counter, chr0Bank, chr1Bank 																	
	.ENDM
	
	.MACRO SET_IRQ_SCROLL[irq_counter_speed] irq, counter, speed					; irq can be 1,2,3 counter value is the scanline count from the last IRQ								  
		.DB $C0, irq+$10 , counter, speed																		
	.ENDM
	
	.MACRO SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] irq, counter, speed,chr0Bank, chr1Bank					; irq can be 1,2,3 counter value is the scanline count from the last IRQ								  
		.DB $C0, irq+$20 , counter, speed, chr0Bank,chr1Bank 																		
	.ENDM
	
	.MACRO SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] irq, counter, ppuaddr, chr0Bank, chr1Bank						; irq can be 1,2? 3? counter value is the scanline count from the last IRQ								  
		.DB $C0, irq+$40 , counter, <ppuaddr, >ppuaddr ,chr0Bank,chr1Bank 																		
	.ENDM
	
	.MACRO SET_IRQ_VERTICAL_SCROLL_SPEEED_AND_STOP[yspeed_ystop] y_speed, y_stop									  
		.DB $C0, $51, y_speed, y_stop																		
	.ENDM
	
	.MACRO CHANGE_IRQ_SCROLL_SPEEED[irq_speed] irq, speed									  
		.DB $C0, irq+$60 , speed																			
	.ENDM
	
	.MACRO SET_IRQ_XSCROLL_NAMETABLE[irq_xscroll_curnametable] irq, xscroll, nametable									  
		.DB $C0, irq+$70 , xscroll, nametable																		
	.ENDM
	
	.MACRO CLEAR_IRQS_END_PAL_UPDATE[]									  
		.DB $C1																			
	.ENDM
	
	.MACRO SET_SCROLLING[yspd_xspd_time] yspd, xspd, time									  
		.DB $C3, yspd, xspd, time														; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	.ENDM
	
	.MACRO DECREASE_SCROLL_SPEED[yspd_xspd] yspd, xspd	
		.DB $C4, yspd, xspd	
	.ENDM
	
	.MACRO INCREASE_SCROLL_SPEED[yspd_xspd] yspd, xspd									  
		.DB $C5, yspd, xspd														        ; SET SCROLL SPEED INCREASE (Y AMOUNT, X AMOUNT)
	.ENDM
	
	.MACRO RESET_X_Y_SCROLL_TO_ZERO[]									  
		.DB $C8																			; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.ENDM
	
	.MACRO CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]									  
		.DB $CC																			;
	.ENDM
	
	.MACRO CLEAR_2000_NAMETABLE[]									  
		.DB $CD, $00																			;
	.ENDM
	
	.MACRO CLEAR_OFFSCREEN_NAMETABLE_BASED_ON_MIRRORING[]									  
		.DB $CD, $01																			;
	.ENDM
	
	.MACRO SET_SPRITES_OFFSCREEN_AND_FILL_ALL_BG_NT_WITH_TILE[tile] tileId									  
		.DB $CD, $04, tileId																		;
	.ENDM
	
	
	.MACRO	SET_BG_CHR_BANKS[table0_table1] bank0, bank1
		.DB $D0, bank0, bank1 
	.ENDM
	
	.MACRO SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]
		.DB $D2
	.ENDM
	
	.MACRO DRAW_P1_TEAM_ABBREV_[] 
		.DB $D4																	
	.ENDM
	
	.MACRO DRAW_P2_TEAM_ABBREV_[] 
		.DB $D5																	
	.ENDM
	
	.MACRO GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] bgPal
		.DB $D7, bgPal 																		; GET OFFENSE SPR PAL (FADE TYPE + BG PAL)
	.ENDM
	
	.MACRO GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] bgPal
		.DB $D8, bgPal 																		; GET DEFENSE SPR PAL 
	.ENDM
	
	.MACRO GET_QB_UNI_COLOR_AND_SKIN_COLOR_SET_BG_AND_SPR_PAL_AND_FADE_IN[bg_pal] bgPal
		.DB $D9, bgPal	
	.ENDM
	
	.MACRO DRAW_CURRENT_TEAM_PPLAYER_NUMBER_NAME[roster_id] roster_id
		.DB $DB, roster_id
	.ENDM 
	
	.MACRO DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id] roster_id
		.DB $DC, roster_id
	.ENDM
	
	.MACRO START_CHANGING_PALLETE[pallete_id] pallete_id	
		.DB $DD,  pallete_id	
	.ENDM
	
	.MACRO DRAW_NUMBER_FROM_MEMORY_ADDR[mem_addr] memoryLoc
		.DB $DE,  <memoryLoc, >memoryLoc	
	.ENDM
	
	.MACRO SET_DRAW_DELAY_FOR_DATA[frames] frames												; sets delay used by FE command in data
		.DB $E1, frames
	.ENDM
	
	.MACRO CLEAR_OFFSCREEN_BANNER[]															  ; Used in status updates (fumble, interception, etc)
		.DB $E2
	.ENDM
	
	.MACRO SET_AND_FADE_IN_BG_PALLETE[BgPal] bgpal
		.DB $E3, bgpal
	.ENDM
	
	.MACRO SET_AND_FADE_IN_SPR_PALLETE[SprPal] sprpal
		.DB $E4, sprpal
	.ENDM
	
	.MACRO SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] bgpal, sprpal
		.DB $E5, bgpal, sprpal	
	.ENDM
	
	.MACRO FADE_IN_BG_AND_SPR_PALLETE[] 
		.DB $E5, $FF 
	.ENDM
	
	.MACRO END_PAL_TASK_AND_FADE_OUT_BG_PAL[]
		.DB $E6
	.ENDM
	
	.MACRO END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[] 
		.DB $E8	
	.ENDM
	
	.MACRO SET_BG_PALLETE_FULLY_FADED_IN[BgPal] bgpal 
		.DB $E9, bgpal 	
	.ENDM
	
	.MACRO SET_SPR_PALLETE_FULLY_FADED_IN[SprPal] sprpal
		.DB $EA, sprpal	
	.ENDM
	
	.MACRO SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] bgpal, sprpal
		.DB $EB, bgpal, sprpal	
	.ENDM
	
	
	.MACRO FADE_OUT_BG_AND_SPR_PALLETE[] 
		.DB $ED	
	.ENDM
	
	.MACRO SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] bgpal, sprpal, index, color
		.DB $EE, bgpal, sprpal, index, color	
	.ENDM
	
	.MACRO RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 
		.DB $EF	
	.ENDM
	
	.MACRO SET_SCENE_SIDE_BASED_ON_POSSESSION[]
		.DB $F0	
	.ENDM
	
	.MACRO SET_MIRRORING_TO_HORIZONTAL[]
		.DB $F1																		
	.ENDM
	
	.MACRO SET_MIRRORING_TO_VERTICAL[]
		.DB $F2																			
	.ENDM
	
	.MACRO PLAY_SOUND_BG[Sound] soundId
		.DB $F3, soundId	
	.ENDM
	
	.MACRO SET_SPRITE_SIZE_8_by_8[]
		.DB $F5	
	.ENDM
	
	.MACRO SET_SPRITE_SIZE_8_by_16[]
		.DB $F6	
	.ENDM

	.MACRO DRAW_BACKGROUND[bg_Id] bgID
		.DB $F7, bgID	
	.ENDM
	
	.MACRO DRAW_BACKGROUND_OFFSCREEN[bg_Id] bgID
		.DB $F8, bgID	
	.ENDM
	
	.MACRO DRAW_ONE_METASPRITE[spriteID] spriteID
		.DB $F9, $01, spriteID 	
	.ENDM
	
	.MACRO DRAW_TWO_METASPRITES[spID1_sprID2] spriteID_1, spriteID_2
		.DB $F9, $02, spriteID_1, spriteID_2 	
	.ENDM
	
	.MACRO DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] spriteID_1, spriteID_2, spriteID_3
		.DB $F9, $03, spriteID_1, spriteID_2, spriteID_3 	
	.ENDM
	
	.MACRO DRAW_P1_TEAM_CONF[] 
		.DB $FA, $00	
	.ENDM
	
	.MACRO DRAW_P2_TEAM_CONF[] 
		.DB $FA, $01	
	.ENDM
	
	.MACRO DRAW_CURRENT_TEAM_CONF[] 
		.DB $FA, $02	
	.ENDM
	
	.MACRO DRAW_P1_TEAM_DIVISION[] 
		.DB $FA, $03	
	.ENDM
	
	.MACRO DRAW_P2_TEAM_DIVISION[]
		.DB $FA, $04	
	.ENDM
	
	.MACRO DRAW_CURRENT_TEAM_DIVISION[]
		.DB $FA, $05	
	.ENDM
	
	.MACRO DRAW_P1_TEAM_NAME_CENTERED[] 
		.DB $FA, $06	
	.ENDM
	
	.MACRO DRAW_P2_TEAM_NAME_CENTERED[] 
		.DB $FA, $07	
	.ENDM
	
	.MACRO DRAW_CURRENT_TEAM_NAME_CENTERED[]
		.DB $FA, $08	
	.ENDM
	
	.MACRO DRAW_CURRENT_TEAM_CITY[]
		.DB $FA, $0A	
	.ENDM
	
	.MACRO DRAW_CURRENT_TEAM_MASCOT[]
		.DB $FA, $0B	
	.ENDM
	 
	 .MACRO DRAW_END_OF_GAME_STATS[]
		.DB $FA, $0D	
	.ENDM
	
	.MACRO SET_SCENE_SIDE_TO_P2[]
		.DB $FA, $0E	
	.ENDM
	
	.MACRO SET_SCENE_SIDE_TO_P1[]
		.DB $FA, $0F	
	.ENDM
	
	.MACRO CHECK_EXIT_SCREEN_IF_PLAY_ALL_GAMES_FLAG_OFF[]
		.DB $FA, $10	
	.ENDM
	
	.MACRO  P1_WINS_TOSS_UPDATE_USER_CHOICE_SPRITE[]
		.DB $FA, $11
	.ENDM
	
	.MACRO  P2_WINS_TOSS_UPDATE_USER_CHOICE_SPRITE[]
		.DB $FA, $12
	.ENDM
	
	.MACRO DRAW_CURRENT_OFF_ICON_NAME_CENTERED[] 
		.DB $FA, $13	
	.ENDM
	
	.MACRO DRAW_QB_NAME_CENTERED[] 
		.DB $FA, $14	
	.ENDM
	
	.MACRO DRAW_CURRENT_SCORE_LARGE_NUM[] 
		.DB $FA, $15	
	.ENDM
	
	.MACRO SET_PLAYER_AND_REF_UNIFORM_COLORS[]  
		.DB $FA, $17	
	.ENDM
	
	.MACRO DRAW_CURRENT_TEAM_CONFERENCE_ABREV[]  
		.DB $FA, $18	
	.ENDM
	
	.MACRO SET_DIV_CHAMP_SPR_PALLETE[] 
		.DB $FA, $19	
	.ENDM
	
	.MACRO SET_CONF_CHAMP_SPR_PALLETE[]  
		.DB $FA, $1A	
	.ENDM
	
	.MACRO SET_SUPER_BOWL_SPR_PALLETE[]  
		.DB $FA, $1B	
	.ENDM
	
	.MACRO DRAW_CURRENT_DEF_NAME_CENTERED[]  
		.DB $FA, $1D	
	.ENDM
	
	.MACRO WAIT_NUMBER_OF_FRAMES_BG[frames] frames
		.DB $FB, frames		
	.ENDM
	
	.MACRO JUMP_TO_SCENE[scene_addr] scene_addr
		.DB $FC, <scene_addr, >scene_addr
	.ENDM
	
	.MACRO DO_SCENE_SUBROUTINE[] scene_addr
		.DB $FD, <scene_addr, >scene_addr
	.ENDM
	
	.MACRO RETURN_FROM_BG_SUBSCRIPT[]
		.DB $FE	
	.ENDM
	
	.MACRO END_OF_SCRIPT_OR_DATA[]
		.DB $FF	
	.ENDM
	


_F}_SCENE_SCRIPT_MACROS

_F{_PPU_DATA_SCRIPT_MACROS
    .MACRO MOVE_DOWN_NUM_ROWS_DATA_SCRIPT[num_rows] rows
		.DB $A0 + rows 
	.ENDM
	
	.MACRO WAIT_CURRENT_DELAY_FRAMES_DATA_SCRIPT[] 
		.DB $FE
	.ENDM
	
	
_F}_PPU_DATA_SCRIPT_MACROS




.BASE $A000
.ORG  $A000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SCENE SCRIPTS ACTION SCENES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_F{_SCENE_SCRIPT_POINTER_TABLE

	.WORD INTRO_SCENE_SCRIPT						; 0X00 INTRO                    	
	.WORD START_SCREEN_SCRIPT						; 0X01 START_SCREEN                      	
	.WORD KICKOFF_WITH_KICKER_SCENE_SCRIPT                          	; 0X02 KICKOFF
	.WORD PUNT_SCENE_SCRIPT                         	; 0X03 PUNT SCREEN
	.WORD FG_SCENE_SCRIPT                         	; 0X04 FG_SCREEN                        
	.WORD DEFENSE_JUMP_MISS_SCENE_SCRIPT                         	; 0X05 DEFENSE_JUMP_MISS 
	.WORD DEFENSE_JUMP_TIP_SCENE_SCRIPT                         	; 0X06 DEFENSE_JUMP_TIPPED        
	.WORD DEFENSE_JUMP_NORMAL_SCENE_SCRIPT                         	; 0X07 DEFENSE_TIPPED             
	.WORD DEFENSE_DIVE_MISS_SCENE_SCRIPT                         	; 0X08 DEFENSE_DIVE_MISS          
	.WORD BALL_BLOCK_MISS_SCENE_SCRIPT                         	; 0X09 BLOCK_MISS                 
	.WORD BLOCKED_PUNT_SCENE_SCRIPT                         	; 0X0A BLOCK_PUNT                 
	.WORD BLOCKED_FG_SCENE_SCRIPT								; 0X0B BLOCK_FG                   	
	.WORD BLOCKED_XP_SCENE_SCRIPT						; 0X0C BLOCK_XP                   
	.WORD BLOCKED_PASS_SCENE_SCRIPT						; 0X0D BLOCK_PASS                 	
	.WORD KICK_TOWARDS_UPRIGHTS_SCENE_SCRIPT						; 0X0E KICK_TOWARDS_UPRIGHTS      	
	.WORD P1_KICK_THROUGH_UPRIGHTS_SCENE_SCRIPT						; 0X0F P1_KICK_THROUGH_UPRIGHTS
    .WORD P2_KICK_THROUGH_UPRIGHTS_SCENE_SCRIPT                               ; 0x10 P2_KICK_THROUGH_UPRIGHTS
	.WORD FG_GOOD_SCENE_SCRIPT                               ; 0x11 FG_GOOD
	.WORD P2_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x12 P2 FG GOING TOWARDS UPRIGHTS SIDE VIEW
	.WORD P1_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x13 P1 FG GOING TOWARDS UPRIGHTS SIDE VIEW
	.WORD P1_FG_LEFT_UR_GOOD_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x14 P1_LEFT_UPRIGHT_GOOD
	.WORD P1_FG_RIGHT_UR_GOOD_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x15 P1_RIGHT_UPRIGHT_GOOD  
	.WORD P1_FG_LEFT_UR_MISS_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x16 P1_LEFT_UPRIGHT_MISS  
	.WORD P1_RIGHT_UR_MISS_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x17 P1_RIGHT_UPRIGHT_MISS
	.WORD P1_LEFT_UR_WIDE_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x18 P1_LEFT_UPRIGHT_WIDE
	.WORD P1_RIGHT_UR_WIDE_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x19 P1_RIGHT_UPRIGHT_WIDE
	.WORD P1_FG_SHORT_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x1A P1_SHORT_UPRIGHT
	.WORD REF_NO_GOOD_SCENE_SCRIPT                               ; 0x1B REF_NO_GOOD_SIGNAL  
	.WORD P2_FG_RIGHT_UR_GOOD_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x1C P2_RIGHT_UPRIGHT_GOOD
	.WORD P2_FG_LEFT_UR_GOOD_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x1D P2_LEFT_UPRIGHT_GOOD
	.WORD P2_FG_LEFT_UR_MISS_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x1E P2_RIGHT_UPRIGHT_MISS
	.WORD P2_LEFT_UR_MISS_OVERHEAD_VIEW_SCENE_SCRIPT                                ; 0x1F P2_LEFT_UPRIGHT_MISS
	.WORD P2_RIGHT_UR_WIDE_OVERHEAD_VIEW_SCENE_SCRIPT                                ; 0x20 P2_RIGHT_UPRIGHT_WIDE
	.WORD P2_LEFT_UR_WIDE_OVERHEAD_VIEW_SCENE_SCRIPT                                ; 0x21 P2_LEFT_UPRIGHT_WIDE
	.WORD P2_FG_SHORT_OVERHEAD_VIEW_SCENE_SCRIPT                               ; 0x22 P2_SHORT_UPRIGHT
	.WORD SUCCESSFUL_TRY_SCENE_SCRIPT                               ; 0x23 XP_GOOD
	.WORD UNUSED1_SCENE_SCRIPT                               ; 0x24 UNUSED
	.WORD UNUSED1_SCENE_SCRIPT                               ; 0x25 UNUSED
	.WORD QB_SACK_SCENE_SCRIPT                               ; 0x26 QB_SACK
	.WORD QB_SACK_SIDE_CHANGE_SCENE_SCRIPT                               ; 0x27 QB_SACK_SIDE_CHANGE
	.WORD QB_SACK_SAFETY_SCENE_SCRIPT                               ; 0x28 QB_SACK_SAFETY
	.WORD QB_PASSING_BALL_SCENE_SCRIPT                               ; 0x29 PASS
	.WORD PLAYER_JUMPING_SCENE_SCRIPT                               ; 0x2A START OF PLAYER JUMPING UP TO CATCH PASS
	.WORD OFF_JUMP_CATCH_SCENE_SCRIPT                               ; 0x2B OFFENSE_JUMP_CATCH
	.WORD OFF_JUMP_MISS_SCENE_SCRIPT                               ; 0x2C OFFENSE_JUMP_MISS
	.WORD OFF_JUMP_TIP_SCENE_SCRIPT                               ; 0x2D OFFENSE_JUMP_TIPPED
	.WORD DOUBLE_JUMP_SCENE_SCRIPT                               ; 0x2E DOUBLE_JUMP
	.WORD OFF_CATCH_SIDE_VIEW_SCENE_SCRIPT                               ; 0x2F OFFENSE_CATCH_SIDEWAYS
	.WORD OFF_DROP_SIDE_VIEW_SCENE_SCRIPT                               ; 0x30 OFFENSE_TIP_SIDEWAYS
	.WORD PASS_HITS_GROUND_SCENE_SCRIPT                               ; 0x31 WHIFF_INCOMPLETE_PASS
	.WORD OFF_DIVING_CATCH_SCENE_SCRIPT                               ; 0x32 OFFENSE_DIVE_CATCH
	.WORD OFF_DIVING_MISS_SCENE_SCRIPT                               ; 0x33 OFFENSE_DIVE_MISS
	.WORD OFF_DIVE_DROP_SCENE_SCRIPT                               ; 0x34 OFFENSE_DIVE_TIPPED
	.WORD UNUSED2_SCENE_SCRIPT                               ; 0x35 UNUSED
	.WORD UNUSED2_SCENE_SCRIPT                               ; 0x36 UNUSED
	.WORD INJURY_SCENE_SCRIPT                               ; 0x37 INJURY
	.WORD RUSHING_TD_SCENE_SCRIPT                               ; 0x38 RUSHING_TOUCHDOWN
	.WORD PASSING_TD_SCENE_SCRIPT                               ; 0x39 PASSING_TOUCHDOWN
	.WORD AFC_CHAMP_SCENE_SCRIPT                               ; 0x3A AFC_CHAMPION
	.WORD SUPER_BOWL_CHAMP_SCENE_SCRIPT                               ; 0x3B SUPER BOWL CHAMPIONS + ROSTERS
	.WORD FIELD_DOUBLE_DECKER_STADIUM_SCENE_SCRIPT                               ; 0x3C FIELD PLUS DOUBLE DECKER STADIUM LARGE CROWD
	.WORD UNUSED3_SCENE_SCRIPT                               ; 0x3D UNUSED
	.WORD REF_ARM_FORWARD_FIRST_DOWN_SCENE_SCRIPT                               ; 0x3E FIRST DOWN ARM POINTING FORWARD
	.WORD REF_FIRST_DOWN_SCENE_SCRIPT                               ; 0x3F FIRST DOWN
	.WORD REF_SECOND_DOWN_SCENE_SCRIPT                               ; 0x40 SECOND DOWN
	.WORD REF_THIRD_DOWN_SCENE_SCRIPT                               ; 0x41 THIRD DOWN
	.WORD REF_FOURTH_DOWN_SCENE_SCRIPT                               ; 0x42 FOURTH DOWN
	.WORD DEF_JUMP_INT_SCENE_SCRIPT                               ; 0x43 DEFENSE_JUMP_INTERCEPTION
	.WORD DOUBLE_JUMP_OFF_CATCH_SCENE_SCRIPT                               ; 0x44 DEFENDED_JUMP_CATCH
	.WORD DOUBLE_JUMP_WHIFF_SCENE_SCRIPT                               ; 0x45 DEFENDED_JUMP_MISS
	.WORD DOUBLE_JUMP_DEF_TIP_SCENE_SCRIPT                               ; 0x46 DEFENDED_JUMP_TIPPED  
	.WORD DOUBLE_JUMP_INT_SCENE_SCRIPT                               ; 0x47 DEFENDED_JUMP_INTERCEPTION
	.WORD DEF_INT_SIDE_VIEW_SCENE_SCRIPT                               ; 0x48 DEFENSE_INTERCEPTION
	.WORD HALF_TIME_BLIMP_SCENE_SCRIPT                               ; 0x49 HALF_TIME_BLIMP
	.WORD HALF_TIME_WINKING_GIRL_SCENE_SCRIPT                               ; 0x4A HALF_TIME_GIRL_WINK
	.WORD HALF_TIME_BAND_SCENE_SCRIPT                               ; 0x4B HALF_TIME_BAND
	.WORD HALF_TIME_CHEER_PANTY_SCENE_SCRIPT                               ; 0x4C HALF_TIME_CHEERLEADER_TOSS
	.WORD HALF_TIME_PARACHUTE_WAVE_SCENE_SCRIPT                               ; 0x4D HALF_TIME_PARACHUTE_WAVE
	.WORD PLAYER_PORT_WITH_PASS_STAT_TXT_SCRIPT_UNUSED                               ; 0x4E DRAW PLAYER PORTAIT WITH SMALL COMP%, YD, TD UNUSED
	.WORD HALF_TIME_CHEER_KICK_SCENE_SCRIPT                               ; 0x4F HALF_TIME_CHEERLEADER_KICK
	.WORD HALF_TIME_KISS_SCENE_SCRIPT                               ; 0x50 HALF_TIME_GIRL_KISS
	.WORD DEF_DIVE_MISS_OFF_CATCH_SCENE_SCRIPT                               ; 0x51 DEFENSE_DIVE_MISS_WR_CATCH
	.WORD DEF_JUMP_WHIFF_OFF_CATCH_SCENE_SCRIPT                               ; 0x52 DEFENSE_JUMP_MISS_WR_CATCH
	.WORD DEF_DIVE_MISS_OFF_DROP_SCENE_SCRIPT                               ; 0x53 DEFENSE_DIVE_MISS_BOUNCE_OFF_WR_HANDS
	.WORD DEF_JUMP_WHIFF_OFF_DROP_SCENE_SCRIPT                               ; 0x54 DEFENSE_JUMP_MISS_B5BOUNCE_OFF_WR_HANDS
	.WORD DEF_DIVE_INT_SCENE_SCRIPT                               ; 0x55 DEFENSE_DIVE_INTERCEPTION
	.WORD DIVISION_CHAMP_SCENE_SCRIPT                               ; 0x56 DIVISION_CHAMP
	.WORD FLASH_START_GAME_SCENE_SCRIPT                               ; 0x57 FLASH_START_GAME
	.WORD MIGHTY_BOMBJACK_HALFTIME_SCENE_SCRIPT                               ; 0x58 MIGHTY_BOMBJACK_HALFTIME
	.WORD HALFTIME_SEQ1_SCENE_SCRIPT                               ; 0x59 HALFTIME 1 (BLIMP, WINK, BAND, KISS)
	.WORD HALFTIME_SEQ2_SCENE_SCRIPT                               ; 0x5A HALFTIME 2 (PARACHUTE, WAVE, KICKING, PANTY)
	.WORD HALFTIME_SEQ3_SCENE_SCRIPT                               ; 0x5B HALFTIME 3
	.WORD HALFTIME_SEQ4_SCENE_SCRIPT                               ; 0x5C HALFTIME 4
	.WORD RUSH_YARDS_SCENE_SCRIPT                               ; 0x5D YARDS RUSH TODAY UNUSED
	.WORD YARDS_RETURN_TODAY_SCENE_SCRIPT                               ; 0x5E YARDS RETURN TODAY UNUSED
	.WORD YARDS_RECEIVE_TODAY_SCENE_SCRIPT                               ; 0x5F YARDS RECEIVE TODAY UNUSED
	.WORD INTERCEPTION_TD_SCENE_SCRIPT                               ; 0x60 INT TD UNUSED
	.WORD DEFENSIVE_TD_SCENE_SCRIPT                               ; 0x61 DEFENSIVE TD UNUSED
	.WORD YARDS_RUSH_TODAY_SCENE_SCRIPT                               ; 0x62 YARDS RUSH TODAY UNUSED
	.WORD YARDS_REC_TODAY_SCENE_SCRIPT                               ; 0x63 YARDS REC TODAY UNUSED
	.WORD SACKS_TODAY_SCENE_SCRIPT                               ; 0x64 SACKS TODAY UNUSED
	.WORD INT_TODAY_SCENE_SCRIPT                               ; 0x65 INT TODAY UNUSED
	.WORD BLANK_YARDS_RUSHER_SCENE_SCRIPT                               ; 0x66 000 YARDS RUSHER UNUSED
	.WORD BLANK_YARDS_RECEIVER_SCENE_SCRIPT                               ; 0x67 000 YARDS RECEIVER UNUSED
	.WORD BLANK_YARDS_PASSER_SCENE_SCRIPT                               ; 0x68 000 YARDS PASSER UNUSED
	.WORD FALSE_START_SCENE_SCRIPT                               ; 0x69 FALSE START
	.WORD OFFSIDE_SCENE_SCRIPT                               ; 0x6A OFFSIDE  
	.WORD NFC_CHAMPION_SCENE_SCRIPT                               ; 0x6B CONFERENCE_CHAMPION
	.WORD UNUSED4_SCENE_SCRIPT                               ; 0x6C UNUSED
	.WORD UNUSED4_SCENE_SCRIPT                               ; 0x6D UNUSED
	.WORD CREDITS_SCENE_SCRIPT                               ; 0x6E CREDITS
	.WORD SOUND_MODE_SCENE_SCRIPT                               ; 0x6F SOUND_MODE
	.WORD P1_FIRST_DOWN_CHAINS_SCENE_SCRIPT                               ; 0x70 P1_CHAINS_FIRST_DOWN
	.WORD SECOND_DOWN_CHAINS_SCENE_SCRIPT                               ; 0x71 CHAINS_SECOND_DOWN
	.WORD THIRD_DOWN_CHAINS_SCENE_SCRIPT                               ; 0x72 CHAINS_THIRD_DOWN
	.WORD FOURTH_DOWN_CHAINS_SCENE_SCRIPT                               ; 0x73 CHAINS_FOURTH_DOWN
	.WORD CHANGE_SIDE_CHAINS_SCENE_SCRIPT                               ; 0x74 CHAINS_CHANGE_SIDE   
	.WORD P2_FIRST_DOWN_CHAINS_SCENE_SCRIPT                               ; 0x75 P2_CHAINS_FIRST_DOWN
	.WORD UNUSED5_SCENE_SCRIPT                               ; 0x76 UNUSED
	.WORD UNUSED5_SCENE_SCRIPT                               ; 0x77 UNUSED

_F}_SCENE_SCRIPT_POINTER_TABLE

	
_F{_INTRO_SCRIPT	
	
INTRO_SCENE_SCRIPT:							                                                                                        ; 0X01 INTRO

@tecmo_presents: 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $25					                                                                                    ; (TECMO PRESENTS)
	DRAW_ONE_METASPRITE[spriteID] $C2					                                                                            ; (BUNNY SPRITE)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					                                                                        ; WAIT 30 FRAMES = 0.5 SEC
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $1A, $4A					                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					                                                                        ; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            
	
@nfl_shield	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC
	DRAW_BACKGROUND[bg_Id] $13					                                                                                    ; (TEAM + NFL SHIELD) 
	DRAW_ONE_METASPRITE[spriteID] $12					                                                                            ;(NFL LOGO)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $0E, $01					                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					                                                                        ; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	
@nfl_pa_football	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC
	DRAW_BACKGROUND[bg_Id] $12					                                                                                    ;( NFL PA FOOTBALL ) 
	DRAW_ONE_METASPRITE[spriteID] $7F					                                                                            
	SET_SPRITE_SIZE_8_by_8[]					                                                                                    ; SET TEXT SIZE TO 8 X 8
	SET_BG_SCRIPT_PPU_ADDR[addr] $21AD
	.DB      $40, " 1991"				                                                                                            ;
	SET_BG_SCRIPT_PPU_ADDR[addr] $21E3
	.DB      " NATIONAL FOOTBALL LEAGUE"	                                                                                        ;	
	MOVE_DOWN_2_ROWS[]
	.DB      "   PLAYERS ASSOCIATION"		                                                                                        ;
	MOVE_DOWN_3_ROWS[]
	.DB      "OFFICIALLY LICENSED PRODUCT"	                                                                                        ;
	MOVE_DOWN_2_ROWS[]
	.DB      " OF THE NATIONAL FOOTBALL"	                                                                                        ;
	MOVE_DOWN_2_ROWS[]
	.DB      "LEAGUE PLAYERS ASSOCIATION"	                                                                                        ;
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $0E, $00					                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					                                                                        ; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            

@city_skyline:
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC 
	DRAW_BACKGROUND[bg_Id] $0F					                                                                                    ; (CITY SKYLINE TOP)
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $10					                                                                        ; (CITY SKYLINE BOTTOM) OFFSCREEN
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $EF, $2940, $78, $00	                            	; SET IRQ 1 SCROLL START (COUNTER VAL, PPU ADDR , CHR BANK 0, CHR BANK 1) 
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $2380, BOTTOM_TWO_ROWS_CITY_INTRO		                                                ; BOTTOM ROW OF CITY SKYLINE
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23F8, BOTTOM_TWO_ROWS_CITY_ATTRIBS_INTRO		                                    	; ATTRIB TABLE ATTRIB TABLE BOTTOM 2 ROWS OF CITY SKYLINE
	
@stadium:	
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $24, $25, $26			                                                            ; (MOVING STADIUM OVERLAY SPRITES)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $0C, $3C					                                                                
	PLAY_SOUND_BG[Sound] $3A					                                                                                    ; (PRE-INTRO SONG)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC 
	SET_SCROLLING[yspd_xspd_time] $F8, $00, $13				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $8F					                                                                        ; WAIT 143 FRAMES = 2.38 SEC
	PLAY_SOUND_BG[Sound] $1C					                                                                                    ; (CHEER NOISE)  
	SET_IRQ_VERTICAL_SCROLL_SPEEED_AND_STOP[yspeed_ystop] $F0, $50				                                                    ; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					                                                                        ; WAIT 180 FRAMES = 3 SEC 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					                                                                        ; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	CLEAR_IRQS_END_PAL_UPDATE[]					                                                                                    ; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	
@ready_and_lineman:	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					                                                                        ; WAIT 120 FRAMES = 2 SEC
	DRAW_ONE_METASPRITE[spriteID] $80					                                                                            ;("READY!")
	SET_BG_CHR_BANKS[table0_table1] $18, $1A					                                                                   ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $218A, READY_LARGE_TILES_INTRO 
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23DA, READY_LARGE_TILES_ATTRIB_INTRO 
	START_CHANGING_PALLETE[pallete_id] $00					                                                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $17					                                                                        ; WAIT 23 FRAMES = 0.38 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					                                                                                ; SET BG AND SPR PAL TO FULLY FADED OUT
	PLAY_SOUND_BG[Sound] $3B					                                                                                    ;(INTRO SONG) 
	SET_SPRITES_OFFSCREEN_AND_FILL_ALL_BG_NT_WITH_TILE[tile] $01					                                                
	DRAW_BACKGROUND[bg_Id] $0B					                                                                                    ; (LINEMAN GETTING READY TO BLOCK)
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $50, $51, $52			                                                            ; (MOVING LINEMAN ANIMATION)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $09, $1E					                                                                                            
	WAIT_NUMBER_OF_FRAMES_BG[frames] $37					                                                                        ; WAIT 55 FRAMES = 0.91 SEC
	SET_SCROLLING[yspd_xspd_time] $00, $FC, $01				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	INCREASE_SCROLL_SPEED[yspd_xspd] $00, $04					                                                                                            ; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)			
	WAIT_NUMBER_OF_FRAMES_BG[frames] $46					                                                                        ; WAIT 70 FRAMES = 1.16 SEC			
	FADE_OUT_BG_AND_SPR_PALLETE[]					                                                                                ; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	
@sf_qb_dropback:	
	SET_BG_CHR_BANKS[table0_table1] $18, $30					                                                                                            ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	DRAW_BACKGROUND[bg_Id] $1C					                                                                                    ; (STADIUM TOP HALF )
	SET_IRQ_SCROLL[irq_counter_speed] $01, $40, $88				                                                                                            ; SET IRQ 1 SCROLLING (SCROLL AMOUNT, COUNTER VAL)
	DRAW_TWO_METASPRITES[spID1_sprID2]  $18, $17				                                                                    ; DRAW 2 SPRITES (HAND SNAPPING BALL, BALL LEFT TO RIGHT SNAP)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $00					                                                                                            
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					                                                                        ; WAIT 20 FRAMES = 0.3 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					                                                                                ; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_IRQS_END_PAL_UPDATE[]					                                                                                    ; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	DRAW_BACKGROUND[bg_Id] $29					                                                                                    ; (BOTTOM OF STADIUM LARGE CROWD SHOT+ SOME FIELD) 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $80, $18, $1A			                                                                                            ; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	DRAW_ONE_METASPRITE[spriteID] $9B					                                                                            ;(QB DROPPING BACK)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $1F					                                                                                            
	SET_SCROLLING[yspd_xspd_time] $00, $08, $10				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	START_CHANGING_PALLETE[pallete_id] $04					                                                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					                                                                        ; WAIT 40 FRAMES = 0.66 SEC
	DECREASE_SCROLL_SPEED[yspd_xspd] $00, $00					                                                                                            ; DECREASE SCROLL SPEED (Y,X) SET SCROLL TIMER TO VERY LONG
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					                                                                        ; WAIT 30 FRAMES = 0.5 SEC 
	SET_SPRITE_SIZE_8_by_16[]					                                                                                                    ; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2263
	.DB      "SAN FRANCISCO"			                                                                                            ;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					                                                                        ; WAIT 40 FRAMES = 0.66 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CB
	.DB      "49ERS"					                                                                                            ;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					                                                                        ; WAIT 120 FRAMES = 2 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					                                                                                ; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	CLEAR_IRQS_END_PAL_UPDATE[]					                                                                                    ; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	
@Barry_Scene: 		
	DRAW_ONE_METASPRITE[spriteID] $9F					                                                                            ;( BARRY CUTTING ACROSS FAST)
	SET_SPR_PALLETE_FULLY_FADED_IN[SprPal] $00					                                                                                                ; SET SPR PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					                                                                                ; SET BG AND SPR PAL TO FULLY FADED OUT
	DRAW_BACKGROUND[bg_Id] $16					                                                                                    ; (LARGE RB CUTTING)
	SET_IRQ_SCROLL[irq_counter_speed] $01, $32, $E0				                                                                    ; SET IRQ 1 SCROLLING (COUNTER VAL, SCROLL SPEED)
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $02, $50, $18, $1A			                                                            ; SET IRQ 2 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	DRAW_ONE_METASPRITE[spriteID] $2A					                                                                            ;(BACK OF DEFNEDER TRYING TO TACKLE BARRY) 
	SET_SCROLLING[yspd_xspd_time] $00, $10, $05				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $10, $3B					                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1A					                                                                        ; WAIT 26 FRAMES = ~0.5 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					                                                                    ; STOP SCROLL
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					                                                                        ; WAIT 30 FRAMES = 0.5 SEC 
	SET_BG_SCRIPT_PPU_ADDR[addr] $2269
	.DB      "DETROIT"				                                                                                                ;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					                                                                        ; WAIT 40 FRAMES = 0.66 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CB
	.DB      "LIONS"					                                                                                            ;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					                                                                        ; WAIT 120 FRAMES = 2 SEC
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	CLEAR_IRQS_END_PAL_UPDATE[]					                                                                                    ; CLEAR IRQS AND END PAL UPDATE

@LT_Scene: 	
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	SET_MIRRORING_TO_VERTICAL[]					                                                                                                    
	SET_SPRITES_OFFSCREEN_AND_FILL_ALL_BG_NT_WITH_TILE[tile] $01					                                                
	DRAW_BACKGROUND[bg_Id] $0A					                                                                                    ; DRAW PLAYER COMING FOR TACKLE LEFT SIDE OF SCREEN 
	DRAW_ONE_METASPRITE[spriteID] $D0					                                                                            ; DRAW SPRITE( LT SACK MOVING LEFT TO RIGHT)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $08, $20					                                                                                            
	SET_SCROLLING[yspd_xspd_time] $00, $78, $30				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0A					                                                                        ; WAIT 10 FRAMES = 0.16 SEC
	DO_SCENE_SUBROUTINE[] CYCLE_PAL_COLORS_AFTER_SACK_INTRO																			; FLASH BG AND SPR PALLETES AFTER SACK                        
	DO_SCENE_SUBROUTINE[] CYCLE_PAL_COLORS_AFTER_SACK_INTRO
	DO_SCENE_SUBROUTINE[] CYCLE_PAL_COLORS_AFTER_SACK_INTRO
	DO_SCENE_SUBROUTINE[] CYCLE_PAL_COLORS_AFTER_SACK_INTRO
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					                                                                        ; WAIT 40 FRAMES = 0.66 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					                                                                                ; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_IRQS_END_PAL_UPDATE[]					                                                                                    ; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	SET_MIRRORING_TO_HORIZONTAL[]						                                                                            ; SET GAME STATUS AND PPUR MIRRORING TO HORIZONTAL
	SET_SPRITES_OFFSCREEN_AND_FILL_ALL_BG_NT_WITH_TILE[tile] $01					                                               
	DRAW_BACKGROUND[bg_Id] $37					                                                                                    ; (SKY TOP)
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $09					                                                                        ; (PLAYER LAYING ON GROUND) OFFSCREEN 
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $60, $2920, $18, $44	                            
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $56, $61, $55			                                                            ; (LT STANDING OVER PLAYER)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $07, $21					                                                                                            
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC 
	SET_SCROLLING[yspd_xspd_time] $F0, $00, $07				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					                                                                        ; WAIT 150 FRAMES = 2.5 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					                                                                                ; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	DRAW_BACKGROUND[bg_Id] $29					                                                                                    ; (BOTTOM OF STADIUM LARGE CROWD SHOT+ SOME FIELD) 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $80, $18, $1A			                                                            ; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	DRAW_ONE_METASPRITE[spriteID] $BB					                                                                            ;(LT STANDING UP WITH GLOVES)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $22					                                                                                            
	SET_SCROLLING[yspd_xspd_time] $00, $08, $10				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	INCREASE_SCROLL_SPEED[yspd_xspd] $00, $FF					                                                                                            ; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)	
	START_CHANGING_PALLETE[pallete_id] $04					                                                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $39					                                                                        ; WAIT 57 FRAMES =  ~ 1 SEC				
	DECREASE_SCROLL_SPEED[yspd_xspd] $00, $00					                                                                                            ; DECREASE SCROLL SPEED (Y,X) SET SCROLL TIMER TO VERY LONG
	INCREASE_SCROLL_SPEED[yspd_xspd] $00, $00					                                                                                            ; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					                                                                        ; WAIT 30 FRAMES = 0.5 SEC 
	SET_BG_SCRIPT_PPU_ADDR[addr] $2268
	.DB      "NEW YORK"				                                                                                                ;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					                                                                        ; WAIT 40 FRAMES = 0.66 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CA
	.DB     "GIANTS"					                                                                                            ;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					                                                                        ; WAIT 120 FRAMES = 2 SEC
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	CLEAR_IRQS_END_PAL_UPDATE[]					                                                                                    ; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	SET_MIRRORING_TO_VERTICAL[]					                                                                                                    
	
	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					                                                                        ; WAIT 30 FRAMES = 0.5 SEC 
	DRAW_BACKGROUND[bg_Id] $21					                                                                                    ; (LARGE FOOTBALL TEXT BLUE LINE) 
	DRAW_ONE_METASPRITE[spriteID] $7F					                                                                            
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $0A, $00					                                                                                            
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $0A, $00, $0F, $0F			                                                                                            ; SET BG AND SPR PAL AND SET TO FULLY FADED IN, SET PAL BUFFER TO COLOR (INDEX, COLOR)
	SET_SCROLLING[yspd_xspd_time] $00, $90, $20				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC 
	DECREASE_SCROLL_SPEED[yspd_xspd] $00, $00					                                                                                            ; DECREASE SCROLL SPEED (Y,X) SET SCROLL TIMER TO VERY LONG
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $0E, $00					                                                                                            
	SET_SCROLLING[yspd_xspd_time] $00, $E0, $60				                                                                        ; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					                                                                        ; WAIT 120 FRAMES = 2 SEC
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $0E, $00, $0F, $15			                                                                                            ; SET BG AND SPR PAL AND SET TO FULLY FADED IN, SET PAL BUFFER TO COLOR (INDEX, COLOR)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $87					                                                                        ; WAIT 135 FRAMES = 2.25 SEC
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $0A, $00					                                                                                            
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $0A, $00, $09, $15			                                                                                            ; SET BG AND SPR PAL AND SET TO FULLY FADED IN, SET PAL BUFFER TO COLOR (INDEX, COLOR)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					                                                                        ; WAIT 80 FRAMES = 1.33 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	DO_SCENE_SUBROUTINE[] SCROLL_IN_LARGE_TECMO_SUPER_BOWL_SCENE_SCRIPT			
	
	DRAW_ONE_METASPRITE[spriteID] $9D					                                                                            ;(NFL SHILED MOVING DOWN)
	SET_AND_FADE_IN_SPR_PALLETE[SprPal] $35					                                                                        ; SET AND FADE IN SPR PAL (PAL) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $FF					                                                                        ; WAIT 255 FRAMES = 4.25 SEC
	WAIT_NUMBER_OF_FRAMES_BG[frames] $FF					                                                                        ; WAIT 255 FRAMES = 4.25 SEC
	WAIT_NUMBER_OF_FRAMES_BG[frames] $FF					                                                                        ; WAIT 255 FRAMES = 4.25 SEC
	WAIT_NUMBER_OF_FRAMES_BG[frames] $64					                                                                        ; WAIT 100 FRAMES = 1.66 SEC
	START_CHANGING_PALLETE[pallete_id] $09					                                                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					                                                                        ; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	CLEAR_IRQS_END_PAL_UPDATE[]					                                                                                    ; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						                                                                                                    
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC 
	
	SET_BG_CHR_BANKS[table0_table1] $18, $1A					                                                                                            ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_8[]					                                                                                                    ; SET TEXT SIZE TO 8 X 8
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2144
	.DB      "TECMO IS A TRADEMARK OF"		                                                                                        ;
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2182
	.DB      "TECMO INC. SUPER BOWL AND NFL"	                                                                                    ;
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $21C2
	.DB      "SHIELD DESIGN ARE TRADEMARKS" 	                                                                                    ;
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2204
	.DB      "OF THE NATIONAL FOOTBALL"		                                                                                        ;
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2245
	.DB      "LEAGUE PROPERTIES INC."		                                                                                        ;
	
	DRAW_ONE_METASPRITE[spriteID] $7F					                                                                            
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $00, $00					                                                                
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					                                                                        ; WAIT 240 FRAMES = 4 SECONDS 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					                                                                        ; WAIT 240 FRAMES = 4 SECONDS
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						                                                                            
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					                                                                    
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					                                                                        ; WAIT 60 FRAMES = 1 SEC 
	JUMP_TO_SCENE[scene_addr] INTRO_SCENE_SCRIPT                                                                               ; JUMP->INTRO SCREEN LOOP

READY_LARGE_TILES_INTRO:								; "READY LARGE TILES"  
	.DB $08, $94, $A9, $C0, $C1, $90, $91, $94, $91		; length + tiles
	.DB $A1												; DOWN ONE ROW
	.DB $08, $86, $88, $C2, $C3, $86, $87, $96, $93		; length + tiles
	END_OF_SCRIPT_OR_DATA[]						

READY_LARGE_TILES_ATTRIB_INTRO:							; "READY LARGE TILES ATRRIB TABLE VALUE"  
	.DB $03, $00, $09, $03
	END_OF_SCRIPT_OR_DATA[]						

BOTTOM_TWO_ROWS_CITY_INTRO:								; BOTTOM 2 ROWS OF CITY SKYLINE
														; LENGTH, TILES
	.DB $20, $8D, $87, $85, $00, $AD, $98, $2A, $00, $B8, $91, $94, $00, $00, $3C, $3C, $3C, $3F, $81, $C4, $CC, $D2, $00, $86, $A5, $90, $98, $DA, $00, $00, $E4, $E5, $00
	.DB $A1
	.DB $20, $8A, $8B, $8E, $AE, $00, $9A, $00, $00, $00, $93, $94, $95, $00, $78, $3C, $3D, $3C, $81, $00, $00, $A2, $A1, $A6, $AF, $90, $B0, $DA, $00, $00, $E6, $ED, $8F
	END_OF_SCRIPT_OR_DATA[]						

BOTTOM_TWO_ROWS_CITY_ATTRIBS_INTRO:							; ATTRIB TABLE BOTTOM 2 ROWS OF CITY SKYLINE
	.DB $08, $05, $05, $05, $0F, $07, $05, $05, $05
	END_OF_SCRIPT_OR_DATA[]						

CYCLE_PAL_COLORS_AFTER_SACK_INTRO:							; FLASH BG AND SPR PALLETES INTRO (4 FRAMES)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $19, $3E					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $08, $20					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $19, $3E					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $08, $20					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	RETURN_FROM_BG_SUBSCRIPT[]					 
   
SCROLL_IN_LARGE_TECMO_SUPER_BOWL_SCENE_SCRIPT:							; SCROLL IN TECMO SUPER BOWL
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $23					; (TECMO SUPER BOWL LARGE) OFFSCREEN 
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $1A					; SET BG PAL AND SET TO FULLY FADED IN
	SET_SCROLLING[yspd_xspd_time] $00, $A0, $20				; SET SCROLLING (Y SCROLL SPEED, =/- X SCROLL SPEED, TIME)
	SET_IRQ_SCROLL[irq_counter_speed] $01, $36, $88				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $24, $78				; 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $03, $28, $00, $18, $1A		
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $1F					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $2C					; WAIT 44 FRAMES = 0.73 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $20					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1C					; WAIT 28 FRAMES = ~ 0.5 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $00					
	RETURN_FROM_BG_SUBSCRIPT[]					

_F}_INTRO_SCRIPT	

_F{_START_SCREEN_SCRIPT
	
START_SCREEN_SCRIPT:							; START SCREEN 
	DO_SCENE_SUBROUTINE[] DRAW_TSB_LARGE_START_SCREEN_SCRIPT			
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2247 
	.DB      $1B, $1C, $19 				; COLORED STARS
    .DB " START GAME "				;
    .DB 	$19, $1C, $1B				; COLORED STARS
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $22C5
	.DB      "TM AND @ TECMO", $5C, "LTD.1991"
	MOVE_DOWN_3_ROWS[]
	.DB      "NINTENDO OF AMERICA INC."			
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $230B
	.DB      "LICENSED BY"				
	
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $BE, $BF, $C0			; ( STARS1, STARS2, STARS3)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $20, $3F					
	START_CHANGING_PALLETE[pallete_id] $08					

START_SCREEN_LOOP_SCRIPT:							    ; ENDLESS START SCREEN LOOP 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SEC
	JUMP_TO_SCENE[scene_addr] START_SCREEN_LOOP_SCRIPT			; JUMP ->ENDLESS START SCREEN LOOP

DRAW_TSB_LARGE_START_SCREEN_SCRIPT:							; CLEAR NAMETABLES AND SPRITES AND DRAW TECMO SUPER BOWL LARGE LETTERS
	RESET_X_Y_SCROLL_TO_ZERO[]						; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	SET_MIRRORING_TO_VERTICAL[]					
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	DRAW_BACKGROUND[bg_Id] $23					; (TECMO SUPER BOWL LARGE LETTERS) 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $90, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	RETURN_FROM_BG_SUBSCRIPT[]					
	
_F}_START_SCREEN_SCRIPT	

_F{_KICKOFF_WITH_KICKER_SCENE_SCRIPT
	
KICKOFF_WITH_KICKER_SCENE_SCRIPT:							; 0x02 KICKOFF
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $29					;( BOTTOM OF STADIUM LARGE CROWD SHOT + SOME FIELD) 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $80, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2268
	.DB      "KICKOFF!"				; 
	DRAW_ONE_METASPRITE[spriteID] $58					; DRAW SPRITE( PLAYER KICKOFF ARM IN AIR)
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $B2					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)				
	START_CHANGING_PALLETE[pallete_id] $04					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_KICKOFF_WITH_KICKER_SCENE_SCRIPT	

_F{_PUNT_SCENE_SCRIPT
	
PUNT_SCENE_SCRIPT:							; 0x03 PUNT
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DO_SCENE_SUBROUTINE[] STADIUM_SPLIT_SCREEN_SCROLLING_SCRIPT			
	DRAW_TWO_METASPRITES[spID1_sprID2]  $1D, $1C				; DRAW 2 SPRITES ( BALL TO FOOT, PUNTER SCROLL DOWN)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $84					
	PLAY_SOUND_BG[Sound] $19					; (WHOOSHING AIR) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $46					; WAIT 70 FRAMES = 1.16 SECONDS
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_IRQS_END_PAL_UPDATE[]					; CLEAR IRQS AND END PAL UPDATE
	DRAW_BACKGROUND[bg_Id] $24					; (GRASS FOR PUNT/FG)
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $30					; (STADIUM OFFSCREEN) 
	DRAW_TWO_METASPRITES[spID1_sprID2]  $53, $23				; DRAW 2 SPRITES ( BIG BALL, FOOT KICKING BALL)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $B2					; GET P1 OR P2 SPR PALLETE, SET BG PAL AND FADE IN (BG PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $05					
	START_CHANGING_PALLETE[pallete_id] $02					; (GREEN+ WHITE)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $05					
	PLAY_SOUND_BG[Sound] $17					; (COLLISION) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $09					; WAIT 9 FRAMES
	DRAW_TWO_METASPRITES[spID1_sprID2]  $20, $21				; DRAW 2 SPRITES ( PLAYER KICKING FULL, SMALL BALL SPINNING)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_SCROLLING[yspd_xspd_time] $00, $90, $40				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	INCREASE_SCROLL_SPEED[yspd_xspd] $00, $20					; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $05					
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						
	


STADIUM_SPLIT_SCREEN_SCROLLING_SCRIPT:							; SET STADIUM SPLIT SCREENS AND SCROLLING
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $1C					; (STADIUM TOP HALF)
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $3C, $78, $18, $30		
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $40				; 
	SET_IRQ_SCROLL[irq_counter_speed] $3, $10, $78				; 
	RETURN_FROM_BG_SUBSCRIPT[]					 
	
_F}_PUNT_SCENE_SCRIPT	

_F{_FG_SCENE_SCRIPT
	
FG_SCENE_SCRIPT:							; 0x04 FG KICK 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $24					; (GRASS FOR PUNT/FG)
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $30					; (STADIUM OFFSCREEN)
	DRAW_TWO_METASPRITES[spID1_sprID2]  $53, $23				; DRAW 2 SPRITES ( BIG BALL, FOOT KICKING BALL)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $B2					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $05					
	START_CHANGING_PALLETE[pallete_id] $02					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $05					
	PLAY_SOUND_BG[Sound] $17					; (COLLISION) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $09					
	DRAW_TWO_METASPRITES[spID1_sprID2]  $20, $5B				; DRAW 2 SPRITES ( PLAYER KICKING FULL, SMALL BALL FG KICK)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_SCROLLING[yspd_xspd_time] $00, $F0, $40				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	INCREASE_SCROLL_SPEED[yspd_xspd] $00, $10					; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_FG_SCENE_SCRIPT	

_F{_DEFENSE_JUMP_SCENE_SCRIPTS
	
DEFENSE_JUMP_MISS_SCENE_SCRIPT:							; 0X05 DEFENSE_JUMP_MISS
	DO_SCENE_SUBROUTINE[] PLAYER_JUMP_WHIFF_SCENE_SCRIPT
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $85					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	JUMP_TO_SCENE[scene_addr] WAIT_ONE_SEC_THEN_FADE_OUT_SCENE_SCRIPT			
	
DEFENSE_JUMP_TIP_SCENE_SCRIPT:							; 0X06 DEFENSE_JUMP_TIP
	DO_SCENE_SUBROUTINE[] PLAYER_JUMPING_SCENE_SCRIPT			
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $85					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	JUMP_TO_SCENE[scene_addr] BALL_OFF_OF_HAND_AFTER_JUMP_SCRIPT
	
DEFENSE_JUMP_NORMAL_SCENE_SCRIPT:							; 0X07 DEFENSE_NORMAL TIP
	DO_SCENE_SUBROUTINE[] PLAYER_TRY_TO_CATCH_BALL_SIDE_VIEW_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $07, $5E				; DRAW 2 SPRITES ( BALL HITS PLAYER SIDEWAYS SPIN, PLAYER TRYING TO CATCH SIDEWAYS) 		
	DO_SCENE_SUBROUTINE[] SET_DEFENDER_PAL_AND_PLAY_BALL_COL_SOUND_SCRIPT
	DO_SCENE_SUBROUTINE[] CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT 
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	JUMP_TO_SCENE[scene_addr] WAIT_TWENTY_FRAMES_FADE_OUT_SCRIPT
	


SET_DEFENDER_PAL_AND_PLAY_BALL_COL_SOUND_SCRIPT:								; SET DEFENDER PALLETTE AND PLAY BALL COLLISION SOUND
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $80					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0F					; WAIT 15 FRAMES = 0.25 SEC 
	PLAY_SOUND_BG[Sound] $0D					; (BOUNCE 2)
	RETURN_FROM_BG_SUBSCRIPT[]						
	
_F}_DEFENSE_JUMP_SCENE_SCRIPTS		
	
_F{_DEFENSE_DIVE_MISS_SCENE_SCRIPTS	
	
DEFENSE_DIVE_MISS_SCENE_SCRIPT:							; 0X08 DEFENSE_DIVE_MISS
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $39					; (STADIUM WITH COULLMNS DOORS+ CLOUDS 2) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $10, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $08				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $16, $40				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $22					; (COULLMNS+ DOORS+ CLOUDS) OFFSCREEN
	DRAW_TWO_METASPRITES[spID1_sprID2]  $63, $64				; DRAW 2 SPRITES (BALL ANI ANGLED DIVE, PLAYER DIVING MISS)
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $80					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	JUMP_TO_SCENE[scene_addr] INC_PASS_REF_NO_GOOD_SCRIPT

_F}_DEFENSE_DIVE_MISS_SCENE_SCRIPTS		

_F{_FG_PUNT_BLOCK_MISS_SCENE_SCRIPTS	

BALL_BLOCK_MISS_SCENE_SCRIPT:							; 0X09 BLOCK_MISS_
	DO_SCENE_SUBROUTINE[] SCROLLING_STADIUM_FOR_BLOCKED_BALL_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $1A, $19				; DRAW 2 SPRITES ( BALL ANI FG, PLAYER DIVING TO BLOCK BALL)
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $80					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $23					; WAIT 35 FRAMES ~ 0.6 SEC.
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_FG_PUNT_BLOCK_MISS_SCENE_SCRIPTS	

_F{_BLOCKED_PUNT_OR_FG_SCENE_SCRIPT
	
BLOCKED_PUNT_SCENE_SCRIPT:							; 0X0A BLOCK_PUNT UUU- not used
	DO_SCENE_SUBROUTINE[] SCROLLING_STADIUM_FOR_BLOCKED_BALL_SCRIPT
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2664
	.DB      "BLOCKED PUNT"				; 
	JUMP_TO_SCENE[scene_addr] PLAYER_BLOCKING_BALL_SCRIPT 			

SCROLLING_STADIUM_FOR_BLOCKED_BALL_SCRIPT:							; DRAW STADIUM WITH CLOUDS FOR POSSIBLE BLOCK, START SCROLLING 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $39					;(STADIUM WITH COULLMNS DOORS, CLOUDS 2) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $F6, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $FA				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $18, $C0				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $02					; (STADIUM + CLOUDS BACKGROUND 2 OFFSCREEN)
	RETURN_FROM_BG_SUBSCRIPT[]					 

PLAYER_BLOCKING_BALL_SPRITES_SCRIPT :							; PLAYER BLOCKING BALL 
	DRAW_TWO_METASPRITES[spID1_sprID2]  $1B, $19				; DRAW 2 SPRITES ( BALL BLOCKED, PLAYER DIVING TO BLOCK BALL)
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $80					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	RETURN_FROM_BG_SUBSCRIPT[]					

SCROLL_BG_AND_DRAW_BALL_BLOCKED_TOWARDS_PLAYER_SCRIPT :							; DRAW FOOTBALL BEING BLOCKED TOWARDS PLAYER
	DRAW_ONE_METASPRITE[spriteID] $27					;(LARGE FOOTBALL GOING TOWARDS GOALPOSTS) 
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $F6, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $30, $FA				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $38, $D0				; 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $03, $20, $00, $18, $1A		
	RETURN_FROM_BG_SUBSCRIPT[]					

PLAYER_BLOCKING_BALL_SCRIPT :							; DRAW PLAYER BLOCKING BALL, PLAY BLOCK SOUND, BALL BEING BLOCKED
	DO_SCENE_SUBROUTINE[] PLAYER_BLOCKING_BALL_SPRITES_SCRIPT
	PLAY_SOUND_BG[Sound] $17					;( COLLISION)
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $07					; WAIT 7 FRAMES
	DO_SCENE_SUBROUTINE[] SCROLL_BG_AND_DRAW_BALL_BLOCKED_TOWARDS_PLAYER_SCRIPT 			
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						
	
BLOCKED_FG_SCENE_SCRIPT:							; 0X0B BLOCK_FG_
	DO_SCENE_SUBROUTINE[] SCROLLING_STADIUM_FOR_BLOCKED_BALL_SCRIPT
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2666
	.DB      "FIELD GOAL"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $26CA
	.DB      "BLOCK!"					;
	JUMP_TO_SCENE[scene_addr] PLAYER_BLOCKING_BALL_SCRIPT
	
BLOCKED_XP_SCENE_SCRIPT:							; 0X0C BLOCK_XP_
	DO_SCENE_SUBROUTINE[] SCROLLING_STADIUM_FOR_BLOCKED_BALL_SCRIPT
	DO_SCENE_SUBROUTINE[] PLAYER_BLOCKING_BALL_SPRITES_SCRIPT 
	PLAY_SOUND_BG[Sound] $17					;( COLLISION) 
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $07					; WAIT 7 FRAMES
	DO_SCENE_SUBROUTINE[] SCROLL_BG_AND_DRAW_BALL_BLOCKED_TOWARDS_PLAYER_SCRIPT 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					; (STADIUM 2 OFFSCREEN)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2268
	.DB      "NO GOOD!"				;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	JUMP_TO_SCENE[scene_addr] REF_NO_GOOD_SCENE_SCRIPT 
	
BLOCKED_PASS_SCENE_SCRIPT:							; 0x0D PASS BLOCKED_
	DO_SCENE_SUBROUTINE[] SCROLLING_STADIUM_FOR_BLOCKED_BALL_SCRIPT
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2665
	.DB      "PASS BLOCK!"				;
	JUMP_TO_SCENE[scene_addr] PLAYER_BLOCKING_BALL_SCRIPT 
	
_F}_BLOCKED_PUNT_OR_FG_SCENE_SCRIPT	

_F{_FG_XP_SCENE_SCRIPTS
	
KICK_TOWARDS_UPRIGHTS_SCENE_SCRIPT:							; 0X0E KICK_TOWARDS_UPRIGHTS
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $01					;( FACING FG GOALPOSTS )
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $17					; (VIEW OF FIELD FOR FG'S ONLY TINY PART OF STADIUM SHOWING) OFFSCREEN 
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $82, $2840, $24, $26	
	DRAW_ONE_METASPRITE[spriteID] $5C					;(BALL GOING TOWARDS GOALPOST FG PERSPECTIVE)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $00					
	SET_SCROLLING[yspd_xspd_time] $F0, $00, $07				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	START_CHANGING_PALLETE[pallete_id] $01					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	END_OF_SCRIPT_OR_DATA[]						
	
P1_KICK_THROUGH_UPRIGHTS_SCENE_SCRIPT:							; 0X0F P1_KICK_THROUGH_UPRIGHTS
	DO_SCENE_SUBROUTINE[] DRAW_STADIUM_P1_KICK_NO_GOOD_OFFSCREEN_SCRIPT
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $A7, $94, $A8			; (RIGHT UPRIGHT, BALL GOING THROUGH P1, LEFT UPRIGHT)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $05, $01					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $5A					; WAIT 90 FRAMES = 1.5 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						
	
P2_KICK_THROUGH_UPRIGHTS_SCENE_SCRIPT:							; 0X10 P2_KICK_THROUGH_UPRIGHTS 
	DO_SCENE_SUBROUTINE[] DRAW_STADIUM_P2_KICK_NO_GOOD_OFFSCREEN_SCRIPT
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $92, $AC, $93			; (LEFT UPRIGHT, BALL GOING THROUGH P2, RIGHT UPRIGHT)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $05, $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $05, $01, $16, $11			; SET BG AND SPR PAL AND SET TO FULLY FADED IN, SET PAL BUFFER TO COLOR (INDEX, COLOR)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $5A					; WAIT 90 FRAMES = 1.5 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						

FG_GOOD_SCENE_SCRIPT							; 0X11 FG_GOOD
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $29					;(BOTTOM OF STADIUM LARGE CROWD SHOT, SOME FIELD) 
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $90, $2E40, $18, $1A	
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2666
	.DB      "FIELD GOAL!"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $270B
	DRAW_CURRENT_SCORE_LARGE_NUM[] 					; DRAW CURRENT SCORE LARGE NUMBERS
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $30					; (SOMETHING STADIUM) OFFSCREEN 
	DRAW_TWO_METASPRITES[spID1_sprID2]  $8A, $B0				; DRAW TWO SPRITES (BLANK SPRITES, REF FG GOOD)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					
	START_CHANGING_PALLETE[pallete_id] $04					
	PLAY_SOUND_BG[Sound] $28					; (MADE FG MUSIC)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	PLAY_SOUND_BG[Sound] $1B					; (CROWD NOISE) 
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	DRAW_ONE_METASPRITE[spriteID] $75					; DRAW SPRITE(PLAYER ARM IN AIR FOR KICKOFF)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $B2
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $2666, $02, $16, $00	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2660
	DRAW_CURRENT_OFF_ICON_NAME_CENTERED[] 					; DRAW CURRENT OFFENSIVE ICON PLAYER NAME CENTERED 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						

P2_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0x12 P2 FG GOING TOWARDS UPRIGHTS SIDE VIEW
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $1D					; (STADIUM AND CROWD TOP) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $F6, $6A, $68		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $1E, $FA				; 	
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $F0				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $14					; (TOP VIEW GOALPOSTS P2) OFFSCREEN  
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $AC, $92, $93			; ( P2 BALL THROUGH POSTS, LEFT UPRIGHT P2, RIGHT UPRIGHT P2)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $05, $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $05, $01, $16, $11			; SET BG AND SPR PAL AND SET TO FULLY FADED IN, SET PAL BUFFER TO COLOR (INDEX, COLOR)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	RETURN_FROM_BG_SUBSCRIPT[]					

P1_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0x13 P1 FG GOING TOWARDS UPRIGHTS SIDE VIEW
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $1D					; (STADIUM AND CROWD TOP)
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $0A, $6A, $68		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $1E, $06				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $10				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $15					; (TOP VIEW GOALPOSTS P1) OFFSCREEN  
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $94, $A7, $A8			; ( P1 BALL THROUGH POSTS, RIGHT UPRIGHT P1, LEFT UPRIGHT P1)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $05, $01					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	RETURN_FROM_BG_SUBSCRIPT[]					

P1_FG_LEFT_UR_GOOD_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X14 P1_LEFT_UPRIGHT_GOOD
	DO_SCENE_SUBROUTINE[] P1_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $99, $95				; DRAW 2 SPRITES ( FLICKERING FOR LEFT POST P1, BALL BOUNCING OFF LEFT POST P1)

END_OF_HITS_CROSS_BAR_GOOD_SCRIPT:							; END OF FG HITS CROSSBAR AND IS GOOD
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $17, $35					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $24, $3C		
	DO_SCENE_SUBROUTINE[] FG_DOINK_FLASH_PAL_NO_GOOD_OFFSCREEN_SCRIPT
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						

FG_DOINK_FLASH_PAL_NO_GOOD_OFFSCREEN_SCRIPT:							; WAIT AND THEN PLAY FG DOINK SOUND WITH STADIUM BACKGROUND
	WAIT_NUMBER_OF_FRAMES_BG[frames] $2B					; WAIT 43 FRAMES = ~0.66 SEC
	PLAY_SOUND_BG[Sound] $12					; (FG DOINK)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $21, $47					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $17, $35					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $21, $47					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $17, $35					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					; (SOMETHNG STADIUM 2) OFFSCREEN  
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2268
	.DB      "NO GOOD!"			
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1D					; WAIT 29 FRAMES
	RETURN_FROM_BG_SUBSCRIPT[]					

P1_FG_RIGHT_UR_GOOD_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X15 P1_FG HITS RIGHT_UPRIGHT_GOOD
	DO_SCENE_SUBROUTINE[] P1_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $9A, $96				; DRAW 2 SPRITES ( FLICKERING FOR RIGHT POST P1, BALL BOUNCING OFF RIGHT POST P1)
	JUMP_TO_SCENE[scene_addr] END_OF_HITS_CROSS_BAR_GOOD_SCRIPT

P1_FG_LEFT_UR_MISS_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X16 P1_FG HITS LEFT UPRIGHT_NO GOOD MISS
	DO_SCENE_SUBROUTINE[] P1_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $99, $97				; DRAW 2 SPRITES ( FLICKERING FOR LEFT POST P1, BALL BOUNCING OFF LEFT POST P1)

END_OF_P1_HIT_CROSSBAR_NO_GOOD_SCRIPT:							; END OF P1 FG HITS CROSSBAR NO GOOD
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $17, $35					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $24, $3C		
	DO_SCENE_SUBROUTINE[] FG_DOINK_FLASH_PAL_NO_GOOD_OFFSCREEN_SCRIPT
	JUMP_TO_SCENE[scene_addr] REF_NO_GOOD_SCENE_SCRIPT 

P1_RIGHT_UR_MISS_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X17 P1_FG HITS RIGHT UPRIGHT_NO GOOD MISS
	DO_SCENE_SUBROUTINE[] P1_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $9A, $98				; DRAW 2 SPRITES ( FLICKERING FOR LEFT POST P1, BALL BOUNCING OFF LEFT POST P1)
	JUMP_TO_SCENE[scene_addr] END_OF_P1_HIT_CROSSBAR_NO_GOOD_SCRIPT

P1_LEFT_UR_WIDE_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X18 P1_FG WIDE LEFT  
	DO_SCENE_SUBROUTINE[] P1_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT	
	DRAW_ONE_METASPRITE[spriteID] $D1					; DRAW SPRITE( BALL WIDE LEFT OF GOALPOST)

END_OF_FG_WIDE_SCRIPT:							; END OF FG IS WIDE
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $17, $35					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $24, $3C		
	WAIT_NUMBER_OF_FRAMES_BG[frames] $2B					; WAIT 43 FRAMES = 0.66 SECONDS
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					; (SOMETHNG STADIUM 2) OFFSCREEN  
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2268
	.DB      "NO GOOD!"				;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1D					; WAIT 29 FRAMES = 0.5 SECONDS
	JUMP_TO_SCENE[scene_addr] REF_NO_GOOD_SCENE_SCRIPT			

DRAW_STADIUM_P1_KICK_NO_GOOD_OFFSCREEN_SCRIPT:							; DRAW STADIUM FOR KICK 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $1D					; (STADIUM AND CROWD TOP)
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $0A, $6A, $68		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $1E, $06				; 	
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $10				; 
	SET_IRQ_SCROLL[irq_counter_speed] $3, $58, $00				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					;(SOMETHNG STADIUM 2) OFFSCREEN
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16 SEEMS NOT NEEDED
	SET_BG_SCRIPT_PPU_ADDR[addr] $2668  ; *** SEEMS NOT NEEDED
	.DB      "NO GOOD!"				; *** SEEMS NOT NEEDED
	RETURN_FROM_BG_SUBSCRIPT[]					 


P1_RIGHT_UR_WIDE_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X19 P1_FG WIDE RIGHT   
	DO_SCENE_SUBROUTINE[] P1_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_ONE_METASPRITE[spriteID] $D2					;(SMALL BALL MOVING TOWARDS BOTTOM GOALPOST)
	JUMP_TO_SCENE[scene_addr] END_OF_FG_WIDE_SCRIPT

P1_FG_SHORT_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X1A P1_FG SHORT   
	DO_SCENE_SUBROUTINE[] DRAW_STADIUM_P1_KICK_NO_GOOD_OFFSCREEN_SCRIPT
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $AB, $A7, $A8			; DRAW 3 SPRITE (BALL SHORT FG,P1 RIGHT UPRIGHT MOVING, P1 LEFT UPRIGHT MOVING)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $05, $01					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $5A					; WAIT 90 FRAMES = 1.5 SECONDS
	JUMP_TO_SCENE[scene_addr] REF_NO_GOOD_SCENE_SCRIPT

REF_NO_GOOD_SCENE_SCRIPT:							; 0X1B REF_NO_GOOD_SIGNAL
	DRAW_ONE_METASPRITE[spriteID] $B3					;(REF NO GOOD SIGNAL)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]																 
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $6A, $68		
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	PLAY_SOUND_BG[Sound] $29					; (MISSED XP/FG MUSIC)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	PLAY_SOUND_BG[Sound] $1B					; (CROWD NOISE) 
	END_OF_SCRIPT_OR_DATA[]						

P2_FG_RIGHT_UR_GOOD_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X1C P2 BALL HITS RIGHT UPRIGHT AND IS GOOD   
	DO_SCENE_SUBROUTINE[] P2_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $90, $8C				; DRAW 2 SPRITES ( FLICKERING FOR RIGHT POST P2, BALL BOUNCING IN OFF RIGHT POST P2)
	JUMP_TO_SCENE[scene_addr] END_OF_HITS_CROSS_BAR_GOOD_SCRIPT

P2_FG_LEFT_UR_GOOD_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X1D P2 BALL HITS LEFT UPRIGHT AND IS GOOD   
	DO_SCENE_SUBROUTINE[] P2_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $91, $8D				; DRAW 2 SPRITES ( FLICKERING FOR LEFT POST P2, BALL BOUNCING IN OFF LEFT POST P2)
	JUMP_TO_SCENE[scene_addr] END_OF_HITS_CROSS_BAR_GOOD_SCRIPT

P2_FG_LEFT_UR_MISS_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X1E P2 BALL HITS RIGHT UPRIGHT AND IS NO GOOD   
	DO_SCENE_SUBROUTINE[] P2_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $90, $8E				; DRAW 2 SPRITES (FLICKERING FOR RIGHT POST P2, BALL BOUNCING OUT OFF LEFT POST P2)

END_OF_P2_MISS_FG_SCRIPT:							; UNNEEDED COULD JUMP TO END_OF_P1_HIT_CROSSBAR_NO_GOOD_SCRIPT
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $17, $35					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $24, $3C		
	DO_SCENE_SUBROUTINE[] FG_DOINK_FLASH_PAL_NO_GOOD_OFFSCREEN_SCRIPT		
	JUMP_TO_SCENE[scene_addr] REF_NO_GOOD_SCENE_SCRIPT			

P2_LEFT_UR_MISS_OVERHEAD_VIEW_SCENE_SCRIPT :							; 0X1F P2 BALL HITS LEFT UPRIGHT AND IS NO GOOD   
	DO_SCENE_SUBROUTINE[] P2_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $91, $8F				; DRAW 2 SPRITES (FLICKERING FOR LEFT POST P2, BALL BOUNCING OUT OFF LEFT POST P2)
	JUMP_TO_SCENE[scene_addr] END_OF_P2_MISS_FG_SCRIPT

P2_RIGHT_UR_WIDE_OVERHEAD_VIEW_SCENE_SCRIPT :							; 0X20 P2 FG WIDE RIGHT: 
	DO_SCENE_SUBROUTINE[] P2_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_ONE_METASPRITE[spriteID] $D3					; DRAW 1 SPRITE (P2 FG WIDE RIGHT)
	JUMP_TO_SCENE[scene_addr] END_OF_FG_WIDE_SCRIPT

DRAW_STADIUM_P2_KICK_NO_GOOD_OFFSCREEN_SCRIPT:							; DRAW STADIUM FOR P2 KICK 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $1D					; (STADIUM AND CROWD TOP) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $F6, $6A, $68		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $1E, $FA				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $F0				; 
	SET_IRQ_SCROLL[irq_counter_speed] $3, $58, $00				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					;(SOMETHNG STADIUM 2) OFFSCREEN
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16 SEEMS NOT NEEDED
	SET_BG_SCRIPT_PPU_ADDR[addr] $2668 ;SEEMS NOT NEEDED
	.DB      "NO GOOD!"				; SEEMS NOT NEEDED
	RETURN_FROM_BG_SUBSCRIPT[]					

P2_LEFT_UR_WIDE_OVERHEAD_VIEW_SCENE_SCRIPT :							; 0X21 P2 FG WIDE LEFT
	DO_SCENE_SUBROUTINE[] P2_FG_TOWARDS_UR_OVERHEAD_VIEW_SCENE_SCRIPT
	DRAW_ONE_METASPRITE[spriteID] $D4					; DRAW 1 SPRITE (P2 FG WIDE LEFT)
	JUMP_TO_SCENE[scene_addr] END_OF_FG_WIDE_SCRIPT

P2_FG_SHORT_OVERHEAD_VIEW_SCENE_SCRIPT:							; 0X21 P2 FG SHORT
	DO_SCENE_SUBROUTINE[] DRAW_STADIUM_P2_KICK_NO_GOOD_OFFSCREEN_SCRIPT
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $9C, $92, $93			; DRAW 3 SPRITE (BALL SHORT FG P2, P2 LEFT UPRIGHT MOVING, P2 RIGHT UPRIGHT MOVING)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $05, $01					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $05, $01, $16, $11			; SET BG AND SPR PAL AND SET TO FULLY FADED IN, SET PAL BUFFER TO COLOR (INDEX, COLOR)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $5A					;  WAIT 90 FRAMES = 1.5 SECONDS
	JUMP_TO_SCENE[scene_addr] REF_NO_GOOD_SCENE_SCRIPT

SUCCESSFUL_TRY_SCENE_SCRIPT:	; 0X23 XP GOOD
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $29					; (BOTTOM OF STADIUM LARGE CROWD SHOT+ SOME FIELD) 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2262
	.DB      "SUCCESSFUL TRY"			;
	SET_BG_SCRIPT_PPU_ADDR[addr] $230B
	DRAW_CURRENT_SCORE_LARGE_NUM[] 					; DRAW CURRENT SCORE LARGE NUMBERS
	DRAW_TWO_METASPRITES[spID1_sprID2]  $8A, $B0				; DRAW 2 SPRITES (BLANK TILES KICK GOOD, REF FG GOOD)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					
	START_CHANGING_PALLETE[pallete_id] $04					
	PLAY_SOUND_BG[Sound] $28					;(MADE XP/FG)  
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	PLAY_SOUND_BG[Sound] $1B					;(CROWD NOISE)  
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_FG_XP_SCENE_SCRIPTS	

UNUSED1_SCENE_SCRIPT:
	.DB $FF						; END

	
_F{_QB_SACK_SCENE_SCRIPTS	

QB_SACK_SCENE_SCRIPT:							; 0X26 QB_SACK
	DO_SCENE_SUBROUTINE[] DRAW_PLAYER_SACK_BG_AND_SPR_SCRIPT	
	DO_SCENE_SUBROUTINE[] DRAW_QB_SACK_TEXT_AND_MUSIC_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	END_OF_SCRIPT_OR_DATA[]						

DRAW_PLAYER_SACK_BG_AND_SPR_SCRIPT:							; DRAW PLAYER SACK BG AND SPRITES
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $29					;(BOTTOM OF STADIUM LARGE CROWD SHOT+ SOME FIELD) 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	DRAW_ONE_METASPRITE[spriteID] $0E					;(PLAYER SACK)
	RETURN_FROM_BG_SUBSCRIPT[]					 

DRAW_QB_SACK_TEXT_AND_MUSIC_SCRIPT:							; DRAW QB SACK TEXT, PLAYER NAME,PLAY SACK MUSIC
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2268
	.DB      "QB SACK!"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22E0
	DRAW_CURRENT_DEF_NAME_CENTERED[] 					; DRAW CURRENT DEFENDER NAME CENTERED
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $B2					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	PLAY_SOUND_BG[Sound] $36					; (SACK MUSIC)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	RETURN_FROM_BG_SUBSCRIPT[]					

QB_SACK_SIDE_CHANGE_SCENE_SCRIPT:							; 0X27 QB_SACK WITH SIDE CHANGE
	DO_SCENE_SUBROUTINE[] DRAW_PLAYER_SACK_BG_AND_SPR_SCRIPT
	DO_SCENE_SUBROUTINE[] DRAW_QB_SACK_TEXT_AND_MUSIC_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $22E0, $02, $20, $00
	SET_BG_SCRIPT_PPU_ADDR[addr] $22E5					
	.DB      "SIDE CHANGE"				;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	END_OF_SCRIPT_OR_DATA[]						

QB_SACK_SAFETY_SCENE_SCRIPT:							; 0X28 QB SACK WITH SAFETY 
	DO_SCENE_SUBROUTINE[] DRAW_PLAYER_SACK_BG_AND_SPR_SCRIPT
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2269
	.DB      "SAFETY!"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22E0
	DRAW_CURRENT_DEF_NAME_CENTERED[] 					; DRAW CURRENT DEFENDER NAME CENTERED
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $B2					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	PLAY_SOUND_BG[Sound] $22					; (SAFETY MUSIC)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_OF_SCRIPT_OR_DATA[]						
	
	
	
_F}_QB_SACK_SCENE_SCRIPT	

_F{_QB_PASSING_BALL_SCENE_SCRIPT	

QB_PASSING_BALL_SCENE_SCRIPT:							; 0X29 QB PASSING BALL 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $1B					; (STADIUM TOP HALF SCREEN) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $78, $18, $30		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $20, $40				; 	
	SET_IRQ_SCROLL[irq_counter_speed] $02, $30, $78				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $1C					;(HORIZONTAL LINES) OFFSCREEN  
	DRAW_ONE_METASPRITE[spriteID] $0B					;(QB ABOUT TO THROW BALL MOVING)
	GET_QB_UNI_COLOR_AND_SKIN_COLOR_SET_BG_AND_SPR_PAL_AND_FADE_IN[bg_pal] $1B					
	PLAY_SOUND_BG[Sound] $19					; (WHOOSHING AIR) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $18					; WAIT 24 FRAMES = ~0.33 SEC
	DRAW_TWO_METASPRITES[spID1_sprID2]  $13, $14				; DRAW 2 SPRITES (HAND THROWING MOTION, BALL PASS ANI)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $78, $18, $30		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $4C, $50				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $78				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $04					; WAIT 4 FRAMES = 0.3 SEC 
	PLAY_SOUND_BG[Sound] $07					;( THROW)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_QB_PASSING_BALL_SCENE_SCRIPT	

_F{_PLAYER_JUMPING_SCENE_SCRIPTS	

PLAYER_JUMPING_SCENE_SCRIPT:							; 0X2A PLAYER JUMPING UP FOR POSSIBLE CATCH START
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $1D					;(STADIUM AND CROWD TOP) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $28, $6A, $68		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $1E, $20				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $50				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $1C					;(HORIZONTAL LINES) OFFSCREEN  
	DRAW_TWO_METASPRITES[spID1_sprID2]  $00, $01				; DRAW 2 SPRITES (PLAYER JUMP UP TO CATCH, BALL FLYING ACROSS)
	RETURN_FROM_BG_SUBSCRIPT[]					 

OFF_JUMP_CATCH_SCENE_SCRIPT:							; 0X2B OFFENSE_JUMP_CATCH
	DO_SCENE_SUBROUTINE[] PLAYER_JUMPING_SCENE_SCRIPT
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $85					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $22					; WAIT 34 FRAMES = ~0.5 SEC
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $10, $11, $0F			; (MOVING HAND CLOSES, MOVING BIG BALL, MOVING HAND OPEN)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $40, $78, $18, $30		

END_OF_OFF_JUMP_CATCH_SCRIPT:							; END OF OFFFENSE CATCH
	PLAY_SOUND_BG[Sound] $19					; (WHOOSHING AIR) 
	DO_SCENE_SUBROUTINE[] WAIT_AND_PLAY_CATCH_SOUND_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_OFFSCREEN_NAMETABLE_BASED_ON_MIRRORING[]					; CLEAR OFFSCREEN NAMETABLE
	CLEAR_IRQS_END_PAL_UPDATE[]					; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	DRAW_BACKGROUND[bg_Id] $3A					; DRAW BACKGROUND(STADIUM WITH COULLMNS DOORS + CLOUDS 4) 
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $80, $2E00, $18, $1A	
	DRAW_ONE_METASPRITE[spriteID] $05					;(PLAYER LANDING FROM JUMP)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					
	SET_SCROLLING[yspd_xspd_time] $D8, $00, $06				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	PLAY_SOUND_BG[Sound] $0B					; (PLAYER LANDING)
	DO_SCENE_SUBROUTINE[] COMPLETE_PASS_TEXT_AND_WR_NAME_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0A					; WAIT 10 FRAMES = 0.16 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	END_OF_SCRIPT_OR_DATA[]						

WAIT_AND_PLAY_CATCH_SOUND_SCRIPT:							; WAIT 20 FRAMES AND PLAY CATCH SOUND
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	PLAY_SOUND_BG[Sound] $0A					; (CATCH)
	RETURN_FROM_BG_SUBSCRIPT[]					

FLASH_BG_PAL_8_FRAMES_SCRIPT:							; FLASH BACKGROUND PAL (8 TOTAL FRAMES)
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $21					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $00					; SET BG PAL AND SET TO FULLY FADED IN 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $21					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $00					; SET BG PAL AND SET TO FULLY FADED IN 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $21					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $00					; SET BG PAL AND SET TO FULLY FADED IN 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $21					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $00					; SET BG PAL AND SET TO FULLY FADED IN 
	RETURN_FROM_BG_SUBSCRIPT[]					 

FLASH_BG_PAL_END_CREDITS_SCRIPT:							; FLASH BG PAL 4 FRAMES
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $21					; SET BG PAL AND SET TO FULLY FADED IN (PAL INDEX)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					 
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $35					; SET BG PAL AND SET TO FULLY FADED IN (PAL INDEX)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					 
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $21					; SET BG PAL AND SET TO FULLY FADED IN (PAL INDEX)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					 
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $35					; SET BG PAL AND SET TO FULLY FADED IN (PAL INDEX)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					 
	RETURN_FROM_BG_SUBSCRIPT[]					

COMPLETE_PASS_TEXT_AND_WR_NAME_SCRIPT:							; DRAW COMPLETE PASS WITH OFFENSIVE NAME
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2663
	.DB      "COMPLETE PASS"			;
	SET_BG_SCRIPT_PPU_ADDR[addr] $26E0
	DRAW_CURRENT_OFF_ICON_NAME_CENTERED[]					; DRAW CURRENT OFFENSIVE ICON NAME CENTERED
	RETURN_FROM_BG_SUBSCRIPT[]					

OFF_JUMP_MISS_SCENE_SCRIPT:							; 0X2C OFFENSE_JUMP_MISS
	DO_SCENE_SUBROUTINE[] PLAYER_JUMP_WHIFF_SCENE_SCRIPT
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $85					

WAIT_ONE_SEC_THEN_FADE_OUT_SCENE_SCRIPT:							; WAIT ABOUT 1 SECOND AND FADE OUT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $32					; WAIT 50 FRAMES = 0.83 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						

PLAYER_JUMP_WHIFF_SCENE_SCRIPT:							; AND SPRITES FOR PLAYER JUMP AND WHIFF
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $1D					; (STADIUM AND CROWD TOP) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $28, $6A, $68		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $1E, $20				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $50				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $36					; (TOP OF STADIUM WITH CLOUDS) OFFSCREEN 
	DRAW_TWO_METASPRITES[spID1_sprID2]  $00, $01				; DRAW 2 SPRITES (PLAYER JUMP AND WHIFF, BALL FLYING ACROSS)
	RETURN_FROM_BG_SUBSCRIPT[]					 

OFF_JUMP_TIP_SCENE_SCRIPT:							; 0X2C JUMP CATCH_TIP
	DO_SCENE_SUBROUTINE[] PLAYER_JUMPING_SCENE_SCRIPT
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $85					

BALL_OFF_OF_HAND_AFTER_JUMP_SCRIPT:							; HAND TRYING TO CATCH BALL AND BOUNCING OFF ON JUMP
	WAIT_NUMBER_OF_FRAMES_BG[frames] $22					; WAIT 34 FRAMES = 0.56SEC
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $10, $0C, $0F			; (MOVING HAND CLOSES, BIG BALL BOUNCE, MOVING HAND OPEN) 
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $40, $78, $18, $30		
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $02					;( STADIUM + CLOUDS BACKGROUND 2) OFFSCREEN
	PLAY_SOUND_BG[Sound] $19					; (WHOOSHING AIR) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $10					; WAIT 16 FRAMES = 0.26 SEC
	PLAY_SOUND_BG[Sound] $0D					; (BOUNCE 2)
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	JUMP_TO_SCENE[scene_addr] FADE_OUT_FOOTBALL_BIG_TO_SMALL_SCRIPT			

DOUBLE_JUMP_SCENE_SCRIPT:							; 0X2E START OF DOUBLE JUMP
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $07					; (DOUBLE DECKER STADIUM ALL STADIUM) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $50, $6A, $68		
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $0E					; DRAW (BLUE SKY) OFFSCREEN 
	DRAW_ONE_METASPRITE[spriteID] $5D					; DRAW SPRITE(DOUBLE JUMP ANIMATION)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $85					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $85					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	START_CHANGING_PALLETE[pallete_id] $05					
	PLAY_SOUND_BG[Sound] $17					; (COLLISION) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	RETURN_FROM_BG_SUBSCRIPT[]					
	
_F}_PLAYER_JUMPING_SCENE_SCRIPTS	

_F{_PLAYER_CATCH_TIP_DROP_SCENE_SCRIPTS

OFF_CATCH_SIDE_VIEW_SCENE_SCRIPT:							; 0X2F OFFENSE_CATCH_NORMAL
	DO_SCENE_SUBROUTINE[] PLAYER_TRY_TO_CATCH_BALL_SIDE_VIEW_SCRIPT
	DO_SCENE_SUBROUTINE[] SET_PAL_PLAY_CATCH_SOUND_SCRIPT
	DO_SCENE_SUBROUTINE[] CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	DO_SCENE_SUBROUTINE[] COMPLATE_PASS_WITH_OFF_NAME_SCRIPT
	JUMP_TO_SCENE[scene_addr] WAIT_TWENTY_FRAMES_FADE_OUT_SCRIPT

PLAYER_TRY_TO_CATCH_BALL_SIDE_VIEW_SCRIPT:							; DRAW PLAYER ATTEMPTING TO CATCH BALL SIDEWAYS VIEW
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $36					; (TOP OF STADIUM WITH CLOUDS) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $20, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $40				;
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $02, $60, $00, $18, $1A	
	DRAW_TWO_METASPRITES[spID1_sprID2]  $08, $06				; DRAW 2 SPR ANIMATIONS( MOVING BALL , PLAYER CATCH ANIMATION) 
	RETURN_FROM_BG_SUBSCRIPT[]					 

SET_PAL_PLAY_CATCH_SOUND_SCRIPT:							; SET P1 OR P2 PAL AND PLAY CATCH SOUND
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0F					; WAIT 15 FRAMES = 0.25 SEC 
	PLAY_SOUND_BG[Sound] $0A					; (CATCH)
	RETURN_FROM_BG_SUBSCRIPT[]					 

SET_PAL_PLAY_BOUNCE_SOUND_SCRIPT:							; SET P1 OR P2 PAL AND PLAY BALL BOUNCE SOUND
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0F					; WAIT 15 FRAMES = 0.25 SEC 
	PLAY_SOUND_BG[Sound] $0D					; (BOUNCE)
	RETURN_FROM_BG_SUBSCRIPT[]					 

CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT:							; CHANGE/SET IRQ0 AND IRQ1 SCROLL SPEED TO 8 AND 20
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $00, $08					; CHANGE SCROLL SPEED IRQ0 (SCROLL SPEED) 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $14					 
	RETURN_FROM_BG_SUBSCRIPT[]					

WAIT_TWENTY_FRAMES_FADE_OUT_SCRIPT:							; WAIT 20 FRAMES AND FADE OUT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						

COMPLATE_PASS_WITH_OFF_NAME_SCRIPT:							; DRAW COMPLETE PASS TEXT WITH PLAYER NAME
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2263
	.DB      "COMPLETE PASS"			;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22E0
	DRAW_CURRENT_OFF_ICON_NAME_CENTERED[]					; DRAW CURRENT OFFENSIVE ICON NAME CENTERED
	RETURN_FROM_BG_SUBSCRIPT[]					

OFF_DROP_SIDE_VIEW_SCENE_SCRIPT: 							; 0X30 OFFENSE_DROP_NORMAL 
	DO_SCENE_SUBROUTINE[] PLAYER_TRY_TO_CATCH_BALL_SIDE_VIEW_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $07, $5E				; DRAW 2 SPRITES (BALL HITS PLAYER, PLAYER TRYING TO CATCH)
	DO_SCENE_SUBROUTINE[] SET_PAL_PLAY_BOUNCE_SOUND_SCRIPT
	DO_SCENE_SUBROUTINE[] CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT, >CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT			
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT, >FLASH_BG_PAL_8_FRAMES_SCRIPT			
	JUMP_TO_SCENE[scene_addr] WAIT_TWENTY_FRAMES_FADE_OUT_SCRIPT

PASS_HITS_GROUND_SCENE_SCRIPT: 							; 0X31 PASS INCOMPLETE BALL HITS GROUND 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $22					; (STADIUM WITH COULLMNS+ DOORS+ CLOUDS) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $08, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $38, $20				; 
	INCREASE_SCROLL_SPEED[yspd_xspd] $00, $E0					; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)	
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					; (STADIUM ZOOM VIEW) OFFSCREEN
	DRAW_ONE_METASPRITE[spriteID] $60					;(BALL HIT GROUND)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $00					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $06					; WAIT 6 FRAMES
	PLAY_SOUND_BG[Sound] $0B					;( BOUNCE)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	SET_SCENE_SIDE_TO_P1[]					; SET SCENE SIDE TO P1
	DRAW_ONE_METASPRITE[spriteID] $B3					;(REF NO GOOD SIGNAL)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $6A, $68		
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2666
	.DB      "INCOMPLETE"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $26CC
	.DB      "PASS"					;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_PLAYER_CATCH_TIP_DROP_SCENE_SCRIPTS	

_F{_PLAYER_DIVING_SCENE_SCRIPTS	

OFF_DIVING_CATCH_SCENE_SCRIPT: 							; 0X32 OFFENSE DIVING CATCH
	DO_SCENE_SUBROUTINE[] BG_AND_SPRITES_DIVING_CATCH_SCRIPT
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					
	DO_SCENE_SUBROUTINE[] PLAY_CATCH_SOUNDS_CHANGE_SCROLL_DIVE_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	DO_SCENE_SUBROUTINE[] COMPLATE_PASS_WITH_OFF_NAME_SCRIPT
	JUMP_TO_SCENE[scene_addr] WAIT_TWENTY_FRAMES_FADE_OUT_SCRIPT

BG_AND_SPRITES_DIVING_CATCH_SCRIPT:							; AND SPRITES FOR DIVING CATCH
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $39					; (STADIUM WITH COULLMNS DOORS+ CLOUDS 2) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $18, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $10				; 	
	SET_IRQ_SCROLL[irq_counter_speed] $02, $16, $40				; 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $03, $40, $00, $18, $1A		
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $36					; (TOP OF STADIUM WITH CLOUDS) OFFSCREEN
	DRAW_TWO_METASPRITES[spID1_sprID2]  $04, $02				; DRAW 2 SPRITES (BALL MOVING ANGLED, PLAYER DIVING CATCH)
	RETURN_FROM_BG_SUBSCRIPT[]					 

PLAY_CATCH_SOUNDS_CHANGE_SCROLL_DIVE_SCRIPT:							; PLAY CATCH SOUND AND CHANGE SCROLL SPEEDS
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0F					; WAIT 15 FRAMES = 0.25 SEC 
	PLAY_SOUND_BG[Sound] $0A					; ( CATCH SOUND) 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $00, $08					; CHANGE SCROLL SPEED IRQ0 (SCROLL SPEED)
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $04						
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $14					
	RETURN_FROM_BG_SUBSCRIPT[]					 

OFF_DIVING_MISS_SCENE_SCRIPT:							; 0X33 OFFENSE DIVING MISS 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $39					; (STADIUM WITH COULLMNS DOORS+ CLOUDS 2)
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $18, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $10				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $16, $40				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $22					; (TOP OF STADIUM WITH CLOUDS) OFFSCREEN
	DRAW_TWO_METASPRITES[spID1_sprID2]  $63, $64				; DRAW 2 SPRITES (BALL MOVING ANGLED, PLAYER DIVING MISS)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					

INC_PASS_REF_NO_GOOD_SCRIPT:							; DRAW INCOMPLETE PASS BALL HITTING GROUND WITH REF NO GOOD SIGNAL 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	DRAW_ONE_METASPRITE[spriteID] $60					;(BALL HITTING GROUND)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $08, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $38, $20				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $06					; WAIT 6 FRAMES
	PLAY_SOUND_BG[Sound] $0B					; (BOUNCE) 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					; (STADIUM2) OFFSCREEN 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	DRAW_ONE_METASPRITE[spriteID] $B3					;(REF NO GOOD SIGNAL)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $6A, $68		
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2266
	.DB      "INCOMPLETE"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CC
	.DB      "PASS"					;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	END_OF_SCRIPT_OR_DATA[]						

OFF_DIVE_DROP_SCENE_SCRIPT:							; 0X34 OFFENSE DIVING TIP
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $39					; (STADIUM WITH COULLMNS DOORS + CLOUDS 2) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $18, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $10				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $16, $40				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $02					; DRAW STADIUM + CLOUDS BACKGROUND 2 OFFSCREEN
	DRAW_TWO_METASPRITES[spID1_sprID2]  $03, $62				; DRAW 2 SPRITES (BALL HITS PLAYER, PLAYER DIVING CATCH)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0F					; WAIT 15 FRAMES = 0.25 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $00, $08					; CHANGE SCROLL SPEED IRQ0 (SCROLL SPEED)
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $06					 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $1E					
	PLAY_SOUND_BG[Sound] $0D					;(BALL HIT HAND BOUNCE) 
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0A					; WAIT 10 FRAMES = 0.16 SEC

FOOTBALL_BIG_TO_SMALL_SCRIPT:							; FOOTBALL BIG TO SMALL AFTER BOUNCE OFF HANDS 
	DRAW_ONE_METASPRITE[spriteID] $39					;(FOOTBALL BIG TO SMALL AFTER TIP) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $18, $26		
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $0A, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $30, $06				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $38, $20				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						

FADE_OUT_FOOTBALL_BIG_TO_SMALL_SCRIPT:							; FADE OUT PAL AND DO FOOTBALL BIG TO SMALL AFTER BOUNCE OFF HANDS
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	JUMP_TO_SCENE[scene_addr] FOOTBALL_BIG_TO_SMALL_SCRIPT
	
_F}_PLAYER_DIVING_SCENE_SCRIPTS		

UNUSED2_SCENE_SCRIPT:							; 0X35 AND 36     UNUSED
	.DB $FF						; END

_F{_INJURY_SCENE_SCRIPT

INJURY_SCENE_SCRIPT:							; 0X37 DRAW PLAYER CARRYING INJURED PLAYER 
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $31					; (SOMETHING STADIUM 2)
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $FC, $6A, $68		
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	DRAW_ONE_METASPRITE[spriteID] $38					;(CARRYING INJURED PLAYER)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2268
	.DB      "INJURED!"
	SET_BG_SCRIPT_PPU_ADDR[addr] $22E0
	DRAW_CURRENT_OFF_ICON_NAME_CENTERED[]					; DRAW CURRENT OFFENSIVE ICON NAME CENTERED
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $B2					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = ~ 4 SECONDS
	PLAY_SOUND_BG[Sound] $01					; (STOP SONG)
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_INJURY_SCENE_SCRIPT	

_F{_RUSHING_AND_PASSING_TD_SCENE_SCRIPTS

RUSHING_TD_SCENE_SCRIPT:							; 0X38 RUSHING_TOUCHDOWN
	RESET_X_Y_SCROLL_TO_ZERO[]						; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	SET_MIRRORING_TO_VERTICAL[]					
	SET_BG_CHR_BANKS[table0_table1] $18, $4A					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	DRAW_BACKGROUND[bg_Id] $1A					; (RUSHING TD BACKGROUND REF ONLY) 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $2B					; (BOTTOM OF STADIUM, SMALL CROWD, DOORS, LOTS OF FIELD) OFFSCREEN 
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $80, $2600, $74, $1A
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $2660, TOUCHDOWN_LARGE_LETTERS_SCRIPT	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2700
	DRAW_CURRENT_OFF_ICON_NAME_CENTERED[]					; DRAW CURRENT OFFENSIVE ICON NAME CENTERED
	DRAW_ONE_METASPRITE[spriteID] $59					;(PLAYER COMING UP TO SPIKE BALL TD)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $96					
	PLAY_SOUND_BG[Sound] $21					;( RUSHING TD MUSIC)
	START_CHANGING_PALLETE[pallete_id] $04					
	SET_SCROLLING[yspd_xspd_time] $FA, $00, $04				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	PLAY_SOUND_BG[Sound] $1B					; (CROWD NOISE)  
	DRAW_ONE_METASPRITE[spriteID] $82					;( BALL BEING SPIKED)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $2C					; (SOMETHING WITH STADIUM SCOREBOARD LIGHTS) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_TWO_METASPRITES[spID1_sprID2]  $5A, $30				; DRAW 2 SPRITES (CATCH PLAYER, PLAYER JUMPING HAND IN AIR)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_CHR_BANKS[table0_table1] $6A, $68					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $85					
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $2380, BLUE_SKY_TILES_SCRIPT		; BLUE SKY TOP ROW OF TILES
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23F8, BLUE_SKY_TILES_ATTR_VALUES		; BLUE SKY ATTRIBUTE TABLE VALUES	
	SET_SCROLLING[yspd_xspd_time] $08, $00, $04				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $2700, $02, $20, $00			
	SET_BG_SCRIPT_PPU_ADDR[addr] $270B
	DRAW_CURRENT_SCORE_LARGE_NUM[] 					; DRAW CURRENT SCORE LARGE 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SEC
	END_OF_SCRIPT_OR_DATA[]						

TOUCHDOWN_LARGE_LETTERS_SCRIPT:							; TOUCHDOWN LARGE LETTERS
	.DB $20 											; DATA LENGTH
	.DB $00, $01, $04, $05, $22, $23, $26, $02, $00, $03, $22, $23, $48, $02, $00, $03, $00, $40, $41, $26, $22, $23, $26, $02, $00, $03, $44, $45, $03, $00, $02, $00 				
   
	.DB $A1												; DOWN 1 ROW
	
	.DB $20  											; DATA LENGTH
	.DB $00, $00, $06, $00, $28, $00, $2C, $08, $00, $09, $28, $00, $00, $0B, $29, $0E, $00, $37, $00, $2C, $28, $00, $2C, $49, $4C, $4D, $46, $47, $4D, $00, $37, $00    
  
	.DB $A1												; DOWN 1 ROW
	
	.DB $20												; DATA LENGTH
	.DB $00, $00, $0C, $00, $2A, $2B, $2E, $2A, $2B, $2E, $2A, $2B, $4A, $21, $00, $24, $00, $42, $43, $2E, $2A, $2B, $2E, $3B, $3E, $3F, $21, $0A, $3F, $00, $3D, $00

	END_OF_SCRIPT_OR_DATA[]						

BLUE_SKY_TILES_SCRIPT:									; BLUE SKY TOP ROW OF TILES
	.DB $20
	.DB $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	
	.DB $A1						; DOWN 1 ROW
	
	.DB $20
	.DB $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	END_OF_SCRIPT_OR_DATA[]						

BLUE_SKY_TILES_ATTR_VALUES:							; BLUE SKY ATTRIBUTE TABLE VALUES
	.DB $08, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0
	END_OF_SCRIPT_OR_DATA[]						

PASSING_TD_SCENE_SCRIPT:							; 0X39 PASSING_TOUCHDOWN
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_BG_CHR_BANKS[table0_table1] $18, $4A					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $29					;(BOTTOM OF STADIUM LARGE CROWD  WITH COPS AND CHEERLEADERS) 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $1E					; (STADIUM FLASHING LIGHTS) OFFSCREEN
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $80, $2E00, $74, $1A	
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $2660, TOUCHDOWN_LARGE_LETTERS_SCRIPT		; SET PPU ADDR = $2660 AND DRAW TOUCHDOWN LARGE LETTERS
	SET_BG_SCRIPT_PPU_ADDR[addr] $2700 
	DRAW_CURRENT_OFF_ICON_NAME_CENTERED[]					; DRAW CURRENT OFFENSIVE ICON NAME CENTERED
	DRAW_TWO_METASPRITES[spID1_sprID2]  $29, $28				; DRAW 2 SPRITES (BALL HITS GROUND SPIKE, PLAYER RUNNING SPIKE BALL)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $B2					
	START_CHANGING_PALLETE[pallete_id] $04					
	PLAY_SOUND_BG[Sound] $35					; (PASSING TOUCHDOWN SONG)
	SET_SCROLLING[yspd_xspd_time] $00, $F8, $0A				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $2700, $02, $20, $00			
	SET_BG_SCRIPT_PPU_ADDR[addr] $270B
	DRAW_CURRENT_SCORE_LARGE_NUM[] 					; DRWA CURRENT SCORE LARGE
	PLAY_SOUND_BG[Sound] $1B					; PLAY  SOUND(CROWD NOISE) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	DECREASE_SCROLL_SPEED[yspd_xspd] $00, $00					; DECREASE SCROLL SPEED (Y,X) SET SCROLL TIMER TO VERY LONG
	DRAW_ONE_METASPRITE[spriteID] $BD					;(QB HANDS IN AIR PUMPS FIST)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	GET_QB_UNI_COLOR_AND_SKIN_COLOR_SET_BG_AND_SPR_PAL_AND_FADE_IN[bg_pal] $05					; GET P1/P2 QB UNIFORM AND SKIN COLOR, SET AND FADE IN BG PALLETE
	SET_SCROLLING[yspd_xspd_time] $00, $10, $07				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)	
	INCREASE_SCROLL_SPEED[yspd_xspd] $00, $0A					; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $2709, $02, $0A, $00			
	SET_BG_SCRIPT_PPU_ADDR[addr] $2700
	DRAW_QB_NAME_CENTERED[]					; DRAW CURRENT QB NAME CENTERED LARGE
	WAIT_NUMBER_OF_FRAMES_BG[frames] $A0					; WAIT 160 FRAMES =2.5 SEC
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_RUSHING_AND_PASSING_TD_SCENE_SCRIPTS	

_F{_AFC_CHAMP_SCENE_SCRIPT

AFC_CHAMP_SCENE_SCRIPT:				; 0X3A AFC_CHAMPION_SCREEN
	DO_SCENE_SUBROUTINE[] DO_CONF_CHAMP_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2244
	.DB      "AFC CHAMPION"				;
	
_F}_AFC_CHAMP_SCENE_SCRIPT	

_F{_CONFERENCE_CHAMP_SCENE_SCRIPT

TEAM_CITY_NAME_CONF_CHAMP_SONG_SCRIPT:							; DRAW TEAM CITY AND NAME, STADIUM AND FLASH BULB SPRITES CONF CHAMP
	DO_SCENE_SUBROUTINE[] DRAW_TEAM_CITY_NAME_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $C3, $AE				; DRAW 2 SPRITES ( VARIOUS STADIUM OVERLAYS ,FLASH BULBS) 
	SET_CONF_CHAMP_SPR_PALLETE[]					; SET CONF CHAMP PALLETE
	FADE_IN_BG_AND_SPR_PALLETE[]					; FADE IN BG AND SPR PAL()
	PLAY_SOUND_BG[Sound] $31					; (DIVISION CHAMP SONG) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	END_OF_SCRIPT_OR_DATA[]						

DRAW_TEAM_CITY_NAME_SCRIPT:							; DRAW TEAM CITY AND NAME
	SET_BG_SCRIPT_PPU_ADDR[addr] $22C0 
	DRAW_CURRENT_TEAM_CITY[]					; DRAW TEAM CITY
	MOVE_DOWN_3_ROWS[] 
	DRAW_CURRENT_TEAM_MASCOT[]					; DRAW TEAM NAME
	RETURN_FROM_BG_SUBSCRIPT[]					 

DO_CONF_CHAMP_BG_SCRIPT:							; DRAW CONFERENCE CHAMPION BG
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $19					; DRAW CONF CHAMPION STADIUM + PLAYERS 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	RETURN_FROM_BG_SUBSCRIPT[]					 
	
_F}_CONFERENCE_CHAMP_SCENE_SCRIPT	

_F{_SUPER_BOWL_CHAMP_AND_ROSTERS_SCENE_SCRIPT

SUPER_BOWL_CHAMP_SCENE_SCRIPT: 							; 0x3B SUPER BOWL CHAMPION AND ROSTER
	
@superbowl_and_coach:	
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $20					; (SUPER BOWL )
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	DRAW_TWO_METASPRITES[spID1_sprID2]  $B6, $B7				; DRAW 2 SPRITES (COACH, OVERLAY SPRITES COACH)

@draw_team_city_and_name:
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2242
	.DB      "SUPER CHAMPION"			;
	DO_SCENE_SUBROUTINE[] DRAW_TEAM_CITY_NAME_SCRIPT
	SET_SUPER_BOWL_SPR_PALLETE[]					; SET SUPER BOWL CHAMP PAL
	FADE_IN_BG_AND_SPR_PALLETE[]					; FADE IN BG AND SPR PAL() 
	PLAY_SOUND_BG[Sound] $44					; PLAY SONG (SB WINNER SONG)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SECONDS
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SECONDS 
	PLAY_SOUND_BG[Sound] $45					; PLAY SONG(SB CREDITS)
	SET_SCROLLING[yspd_xspd_time] $F8, $00, $1F				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	SET_IRQ_VERTICAL_SCROLL_SPEEED_AND_STOP[yspeed_ystop] $F8, $02				; SCROLL IRQ1 (Y SCROLL SPEED, SCROLL STOP)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4				    	; WAIT 180 FRAMES = 3 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_IRQS_END_PAL_UPDATE[]					; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	DRAW_BACKGROUND[bg_Id] $3E					;( BLANK SCREEN) 


@draw_1991_roster_text:
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $3D					; (1991 ROSTER LARGE LETTERS) OFFSCREEN
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $BE, $BF, $C0			; (STARS 1, STARS 2, STARS 3)  
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $00					; SET BG PAL AND SET TO FULLY FADED IN 
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $EF, $2800, $18, $1A	
	SET_IRQ_VERTICAL_SCROLL_SPEEED_AND_STOP[yspeed_ystop] $F8, $60				; SCROLL IRQ1 (Y SCROLL SPEED, SCROLL STOP)
	SET_SPR_PALLETE_FULLY_FADED_IN[SprPal] $50					; SET SPR PAL AND SET TO FULLY FADED IN 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0A					; WAIT 10 FRAMES = 0.16 SEC
	SET_SPR_PALLETE_FULLY_FADED_IN[SprPal] $51					; SET SPR PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0A					; WAIT 10 FRAMES = 0.16 SEC
	SET_SPR_PALLETE_FULLY_FADED_IN[SprPal] $3F					; SET SPR PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
    END_PAL_TASK_AND_FADE_OUT_BG_PAL[]							
    CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	CLEAR_IRQS_END_PAL_UPDATE[]					; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	SET_MIRRORING_TO_VERTICAL[]					
	
@draw_QB_names:	
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES		; ATTRIBUTE TABLE VALUES VARIOUS 1    
	SET_BG_SCRIPT_PPU_ADDR[addr] $20A4
	.DB      "QUARTERBACKS"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $2580
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $00					; DRAW PLAYER NAME(QB 1)
	MOVE_DOWN_6_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $01					; DRAW PLAYER NAME(QB 2)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $06, $3F					
	DO_SCENE_SUBROUTINE[] SCROLL_IN_NAME_CREDITS_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT
	
@draw_RB_names:		
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1   
	SET_BG_SCRIPT_PPU_ADDR[addr] $20A3
	.DB      "RUNNING BACKS"			;
	SET_BG_SCRIPT_PPU_ADDR[addr] $2540
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $02					; DRAW PLAYER NAME(RB 1)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $03					; DRAW PLAYER NAME(RB 2)	
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $04					; DRAW PLAYER NAME(RB 3)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $05					; DRAW PLAYER NAME(RB 4)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $3F					
	DO_SCENE_SUBROUTINE[] SCROLL_IN_NAME_CREDITS_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT
	
@draw_WR_names:		
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1     
	SET_BG_SCRIPT_PPU_ADDR[addr] $20A2
	.DB      "WIDE RECEIVERS"			;
	SET_BG_SCRIPT_PPU_ADDR[addr] $2540
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $06					; DRAW PLAYER NAME(WR 1)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $07					; DRAW PLAYER NAME(WR 2)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $08					; DRAW PLAYER NAME(WR 3)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $09					; DRAW PLAYER NAME(WR 4)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $3F					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $00, $3F, $07, $27			
	DO_SCENE_SUBROUTINE[] SCROLL_IN_NAME_CREDITS_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT
	
@draw_TE_names:	
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1   
	SET_BG_SCRIPT_PPU_ADDR[addr] $20A6
	.DB      "TIGHT ENDS"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $2580
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $0A					; DRAW PLAYER NAME(TE 1)
	.DB $B5						; MOVE DOWN 6 ROWS
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $0B					; DRAW PLAYER NAME(TE 2)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $3F					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $00, $3F, $07, $21			; SET BG AND SPR PAL AND SET TO FULLY FADED IN, SET PAL BUFFER TO COLOR (INDEX, COLOR)
	DO_SCENE_SUBROUTINE[] SCROLL_IN_NAME_CREDITS_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT
	
@draw_C_and_G_names:	
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1   
	SET_BG_SCRIPT_PPU_ADDR[addr] $20AA
	.DB      "CENTER"				
	SET_BG_SCRIPT_PPU_ADDR[addr] $2520
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $0C					; DRAW PLAYER NAME(CENTER)
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23E0, DEFAULT_BG_ATTR_TABLE_VALUES	;  ATTRIBUTE TABLE VALUES VARIOUS 1
	SET_BG_SCRIPT_PPU_ADDR[addr] $220A
	.DB      "GUARDS"					; 
	SET_BG_SCRIPT_PPU_ADDR[addr] $2680
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $0D					; DRAW PLAYER NAME(LEFT GAURD)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $0E					; DRAW PLAYER NAME(RIGHT GAURD)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $3F					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $00, $3F, $07, $29			
	SET_IRQ_SCROLL[irq_counter_speed] $01, $38, $6F				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $30, $00				; 
	SET_IRQ_SCROLL[irq_counter_speed] $3, $25, $91				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $26					; WAIT 38 FRAMES = 0.6 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $00					
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $3, $00					; CHANGE SCROLL SPEED IRQ3 (SCROLL SPEED) = STOP SCROLL
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT

@draw_tackle_names:
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1
	SET_BG_SCRIPT_PPU_ADDR[addr] $20A9
	.DB      "TACKLES"				
	SET_BG_SCRIPT_PPU_ADDR[addr] $2580
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $0F					; DRAW PLAYER NAME(LEFT TACKLE)
	MOVE_DOWN_6_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $10					; DRAW PLAYER NAME(RIGHT TACKLE)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $3F					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $00, $3F, $07, $2C			
	DO_SCENE_SUBROUTINE[] SCROLL_IN_NAME_CREDITS_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT
	
@draw_K_P_names:	
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1
	SET_BG_SCRIPT_PPU_ADDR[addr] $20AA
	.DB      "KICKER"					
	SET_BG_SCRIPT_PPU_ADDR[addr] $2520
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $1C					; DRAW PLAYER NAME(KICKER)
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23E0, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1   
	SET_BG_SCRIPT_PPU_ADDR[addr] $220A
	.DB      "PUNTER"					
	SET_BG_SCRIPT_PPU_ADDR[addr] $2680
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $1D					; DRAW PLAYER NAME(PUNTER)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $3F					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $00, $3F, $07, $26			
	SET_IRQ_SCROLL[irq_counter_speed] $01, $38, $6F				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $30, $00				; 
	SET_IRQ_SCROLL[irq_counter_speed] $3, $25, $91				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $26					; WAIT 38 FRAMES = 0.6 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $00					
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $3, $00					; CHANGE SCROLL SPEED IRQ3 (SCROLL SPEED) = STOP SCROLL
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT
	
@draw_DL_names:		
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1
	.SET_BG_SCRIPT_PPU_ADDR[addr] $20A2
	.DB      "DEFENSIVE LINE"			;
	SET_BG_SCRIPT_PPU_ADDR[addr] $2540
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $11					; DRAW PLAYER NAME(DL1)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $12					; DRAW PLAYER NAME(DL2)
	MOVE_DOWN_4_ROWS[] 
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $13					; DRAW PLAYER NAME(DL3)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $06, $3F					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	SET_IRQ_SCROLL[irq_counter_speed] $01, $40, $6F				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $25, $91				; 
	SET_IRQ_SCROLL[irq_counter_speed] $3, $20, $6F				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $26					; WAIT 38 FRAMES = 0.6 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $00					; STOP SCROLL
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $3, $00					; STOP SCROLL
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT

@draw_LB_names:		
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1
	SET_BG_SCRIPT_PPU_ADDR[addr] $20A4
	.DB      "LINE BACKERS"				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $2540
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $14					; DRAW PLAYER NAME(LB1)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $15					; DRAW PLAYER NAME(LB2)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $16					; DRAW PLAYER NAME(LB3)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $17					; DRAW PLAYER NAME(LB3)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $3F					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $00, $3F, $07, $24			
	DO_SCENE_SUBROUTINE[] SCROLL_IN_NAME_CREDITS_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT
	
@draw_DB_names:	
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES	; ATTRIBUTE TABLE VALUES VARIOUS 1
	SET_BG_SCRIPT_PPU_ADDR[addr] $20A1
	.DB      "DEFENSIVE BACKS"			
	SET_BG_SCRIPT_PPU_ADDR[addr] $2540
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $18					; DRAW PLAYER NAME(DB1)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $19					; DRAW PLAYER NAME(DB2)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $1A					; DRAW PLAYER NAME(DB3)
	MOVE_DOWN_4_ROWS[]
	DRAW_CURRENT_TEAM_PLAYER_NAME_LARGE_CENTERED[roster_id], $1B					; DRAW PLAYER NAME(DB4)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $3F					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN_CHANGE_PAL_COLOR[BgPal_SprPal_index_color] $00, $3F, $07, $38			
	DO_SCENE_SUBROUTINE[] SCROLL_IN_NAME_CREDITS_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT
	
@draw_large_TSB_letters:	
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $23					; DRAW (TECMO SUPER BOWL LARGE LETTERS) OFFSCREEN
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $1A					; SET BG PAL AND SET TO FULLY FADED IN
	SET_SCROLLING[yspd_xspd_time] $00, $A0, $20				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	SET_IRQ_SCROLL[irq_counter_speed] $01, $36, $88				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $24, $78				; 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $03, $28, $00, $18, $1A		
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3E					; WAIT 62 FRAMES  = ~1 SEC
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $1F					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $2A					; WAIT 42 FRAMES = ~0.66 SEC  
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	WAIT_NUMBER_OF_FRAMES_BG[frames] $26					; WAIT 38 FRAMES = ~0.6 SEC  
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $20					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $00					; STOP OR CHANGE SCROLL SPEED(IRQ INDEX, NEW SCROLL SPEED)

@draw_staff_text:
	SET_SPRITE_SIZE_8_by_8[]					; SET TEXT SIZE TO 8 X 8
	SET_BG_SCRIPT_PPU_ADDR[addr] $228B
	.DB      $6B, " STAFF ", $6B			; 	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
    END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						 
    CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	JUMP_TO_SCENE[scene_addr] CREDITS_SCENE_SCRIPT 			; *** uneeded jump could reorgnaize code. 
					

SCROLL_IN_NAME_CREDITS_SCRIPT:							; SCROLL IN NAMES 0.6 SECONDS
	SET_IRQ_SCROLL[irq_counter_speed] $01, $40, $6F				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $40, $91				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $26 					; WAIT 38 FRAMES = 0.63 SECONDS
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $00					
	RETURN_FROM_BG_SUBSCRIPT[]					

FLASH_PAL_CLEAR_SCREEN_CREDITS_SCRIPT:							; FLASH PALLETE AND FADE OUT 
	START_CHANGING_PALLETE[pallete_id] $0F				
	WAIT_NUMBER_OF_FRAMES_BG[frames] $AC				; WAIT 172 FRAMES = ~ 3 SECONDS
	END_PAL_TASK_AND_FADE_OUT_BG_PAL[]	
    CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	CLEAR_IRQS_END_PAL_UPDATE[]					; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	RETURN_FROM_BG_SUBSCRIPT[]					

FIELD_DOUBLE_DECKER_STADIUM_SCENE_SCRIPT:							; SET SCROLL LOC = 0,0 DRAW STADIUM, SET SPLIT SCREEN CHR BANKS FOR REF SIGNALS
	RESET_X_Y_SCROLL_TO_ZERO[]						; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	SET_MIRRORING_TO_VERTICAL[]					
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $31					; (STADIUM SOMETHING) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $00, $6A, $68		
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	RETURN_FROM_BG_SUBSCRIPT[]					 

_F}_SUPER_BOWL_CHAMP_AND_ROSTERS_SCENE_SCRIPT
UNUSED3_SCENE_SCRIPT:
	.DB $FF						; END ***


_F{_REF_DOWN_SIGNALS_SCENE_SCRIPTS	

REF_ARM_FORWARD_FIRST_DOWN_SCENE_SCRIPT:							; 0X3E FIRST DOWN REF ARM POINTING FORWARD 
	DO_SCENE_SUBROUTINE[] FIELD_DOUBLE_DECKER_STADIUM_SCENE_SCRIPT
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2266
	.DB      "FIRST DOWN"				;
	DRAW_ONE_METASPRITE[spriteID] $B2					;(REF ARM POINTING FORWARD)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_OF_SCRIPT_OR_DATA[]						

REF_FIRST_DOWN_SCENE_SCRIPT:							; 0X3F FIRST DOWN REF FINGER IN AIR 
	DO_SCENE_SUBROUTINE[] FIELD_DOUBLE_DECKER_STADIUM_SCENE_SCRIPT
	SET_SCENE_SIDE_TO_P1[]					; SET SCENE SIDE TO P1 
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2266
	.DB      "FIRST DOWN"				;
	DRAW_ONE_METASPRITE[spriteID] $B4					;(REF  1 FINGER)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_OF_SCRIPT_OR_DATA[]						

REF_SECOND_DOWN_SCENE_SCRIPT:							; 0X40 SECOND DOWN REF FINGERS IN AIR
	DO_SCENE_SUBROUTINE[] FIELD_DOUBLE_DECKER_STADIUM_SCENE_SCRIPT
	SET_SCENE_SIDE_TO_P1[]					; SET SCENE SIDE TO P1
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2265
	.DB      "SECOND DOWN"				;
	DRAW_ONE_METASPRITE[spriteID] $B5					;(REF "2" FINGER)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_OF_SCRIPT_OR_DATA[]						

REF_THIRD_DOWN_SCENE_SCRIPT:							; 0X41 THIRD DOWN REF FINGERS IN AIR
	DO_SCENE_SUBROUTINE[] FIELD_DOUBLE_DECKER_STADIUM_SCENE_SCRIPT
	SET_SCENE_SIDE_TO_P1[]					; SET SCENE SIDE TO P1
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2266
	.DB      "THIRD DOWN"				;
	DRAW_ONE_METASPRITE[spriteID] $A0					;(REF "3" FINGER)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_OF_SCRIPT_OR_DATA[]						

REF_FOURTH_DOWN_SCENE_SCRIPT:							; 0X42 Tfour DOWN REF FINGERS IN AIR
	DO_SCENE_SUBROUTINE[] FIELD_DOUBLE_DECKER_STADIUM_SCENE_SCRIPT
	SET_SCENE_SIDE_TO_P1[]					; SET SCENE SIDE TO P1
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2265
	.DB      "FOURTH DOWN"				;
	DRAW_ONE_METASPRITE[spriteID] $A1					;(REF "4" FINGER)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN	
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_REF_DOWN_SIGNALS_SCENE_SCRIPTS		

_F{_DEF_JUMP_INT_SCENE_SCRIPTS	

DEF_JUMP_INT_SCENE_SCRIPT:							; 0X43 DEFENSE JUMPING INTERCEPTION
	DO_SCENE_SUBROUTINE[] PLAYER_JUMPING_SCENE_SCRIPT
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $85					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $22					; WAIT 34 FRAMES = 0.6 SEC
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $10, $11, $0F			; (MOVING HAND CLOSES, MOVING BIG BALL, MOVING HAND OPEN)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $40, $70, $18, $30		

END_OF_JUMPING_INTERCEPTION_SCRIPT:							; END OF INTERCEPTION
	PLAY_SOUND_BG[Sound] $19					; (WHOOSHING AIR) 
	DO_SCENE_SUBROUTINE[] WAIT_AND_PLAY_CATCH_SOUND_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0A					; WAIT 10 FRAMES = 0.16 SEC
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	CLEAR_IRQS_END_PAL_UPDATE[]					; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	DRAW_BACKGROUND[bg_Id] $3A					; (STADIUM WITH COULLMNS DOORS + CLOUDS 4) 
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $80, $2C00, $18, $1A	
	DRAW_ONE_METASPRITE[spriteID] $05					;(PLAYER LANDING FROM JUMP) 
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $80					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	SET_SCROLLING[yspd_xspd_time] $D8, $00, $06				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	PLAY_SOUND_BG[Sound] $24					; (INTERCEPTION MUSIC)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2463
	.DB      "INTERCEPTION!"			;	
	SET_BG_SCRIPT_PPU_ADDR[addr] $24E0
	DRAW_CURRENT_DEF_NAME_CENTERED[] 					; DRAW CURRENT DEFENDER NAME CENTERED
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_DEF_JUMP_INT_SCENE_SCRIPTS		

_F{_DOUBLE_JUMP_SCENE_SCRIPTS	

DOUBLE_JUMP_OFF_CATCH_SCENE_SCRIPT:							; 0X44 DOUBLE JUMP OFFENSE CATCH 
	DO_SCENE_SUBROUTINE[] DOUBLE_JUMP_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] STADIUM_SPLIT_SCREEN_SCROLLING_SCRIPT
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $10, $11, $0F			; (MOVING HAND CLOSES, MOVING BIG BALL, MOVING HAND OPEN)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					
	JUMP_TO_SCENE[scene_addr] END_OF_OFF_JUMP_CATCH_SCRIPT

DOUBLE_JUMP_WHIFF_SCENE_SCRIPT:							; 0X45 DOUBLE JUMP MISS
	DO_SCENE_SUBROUTINE[] DOUBLE_JUMP_SCENE_SCRIPT
	DRAW_BACKGROUND[bg_Id] $1D					;( STADIUM AND CROWD TOP)
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $28, $6A, $68		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $1E, $20				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $10, $50				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $1F					; DRAW (TOP OF STADIUM WITH CLOUDS) OFFSCREEN  
	DRAW_TWO_METASPRITES[spID1_sprID2]  $00, $01				; DRAW 2 SPRITES (PLAYER JUMP AND WHIFF, BALL FLYING ACROSS)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $85					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $22					; WAIT 34 FRAMES = 0.6 SEC
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $65, $66, $5F			; (BIG BALL LEFT TO RIGHT, OPEN HAND FOR CATCH, MOVING HAND FOR CATCH LEFT TO RIGHT OPEN)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $20, $70, $18, $30		
	PLAY_SOUND_BG[Sound] $19					; (WHOOSHING AIR) 
	JUMP_TO_SCENE[scene_addr] WAIT_ONE_SEC_THEN_FADE_OUT_SCENE_SCRIPT


DOUBLE_JUMP_DEF_TIP_SCENE_SCRIPT:							; 0X46 DOUBLE JUMP TIP
	DO_SCENE_SUBROUTINE[] DOUBLE_JUMP_SCENE_SCRIPT
	DRAW_BACKGROUND[bg_Id] $1C					; (DOUBLE DECKER STADIUM TOP HALF OF SCREEN)  
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $70, $18, $30		
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $02					; DRAW (TINY PART OF STADIUM + LOTS OF CLOUDS BACKGROUND ) OFFSCREEN
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $10, $0C, $0F			; (MOVING HAND CLOSES, BIG BALL BOUNCE, MOVING HAND OPEN)
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $80					
	PLAY_SOUND_BG[Sound] $19					; (WHOOSHING AIR)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	PLAY_SOUND_BG[Sound] $0D					; (BOUNCE 2) 
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $0A					; WAIT 10 FRAMES = 0.16 SEC
	JUMP_TO_SCENE[scene_addr] FOOTBALL_BIG_TO_SMALL_SCRIPT

DOUBLE_JUMP_INT_SCENE_SCRIPT:							; 0X47 DOUBLE JUMP INT 
	DO_SCENE_SUBROUTINE[] DOUBLE_JUMP_SCENE_SCRIPT
	DRAW_BACKGROUND[bg_Id] $1C					;( STADIUM AND CROWD TOP
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $70, $18, $30		
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $10, $11, $0F			; (MOVING HAND CLOSES, MOVING BIG BALL, MOVING HAND OPEN)
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $80					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	JUMP_TO_SCENE[scene_addr] END_OF_JUMPING_INTERCEPTION_SCRIPT
	
_F}_DOUBLE_JUMP_SCENE_SCRIPTS	

_F{_DEF_NORMAL_INT_SCENE_SCRIPTS		

DEF_INT_SIDE_VIEW_SCENE_SCRIPT							; 0X48 NORMAL INTERCEPTION
	DO_SCENE_SUBROUTINE[] PLAYER_TRY_TO_CATCH_BALL_SIDE_VIEW_SCRIPT
	DO_SCENE_SUBROUTINE[] SET_DEFENDER_PAL_AND_PLAY_BALL_COL_SOUND_SCRIPT	
	DO_SCENE_SUBROUTINE[] CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT

END_OF_DIVE_NORMAL_INT_SCRIPT:							; END OF NON-JUMPING INTERCEPTION
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	PLAY_SOUND_BG[Sound] $24					; (INTERCEPTION MUSIC) 
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2263
	.DB      "INTERCEPTION!"			;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22E0
	DRAW_CURRENT_DEF_NAME_CENTERED[] 					; DRAW CURRENT DEFENDER NAME CENTERED
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_DEF_NORMAL_INT_SCENE_SCRIPTS	

_F{_HALF_TIME_BLIMP_SCENE_SCRIPT

HALF_TIME_BLIMP_SCENE_SCRIPT:							; 0X49 HALF TIME BLIMP AND BALLOONS WITH STADIUM 
	DRAW_BACKGROUND[bg_Id] $35					; (STADIUM WITH TECMO SUPER BOWL BLIMP) 

BALOONS_AND_BLIMP_SCENE_SCRIPT:							; HALF TIME BALLOONS AND BLIMP MOTOR SPRITES
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $FD, $6A, $6B		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $20, $04				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $41, $FA				; 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $03, $40, $00, $18, $1A		
	SET_BG_SCRIPT_PPU_ADDR[addr] $22E7
	.DB      "HALF TIME"				; 
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $87, $88, $86			; (BALLOONS1, BALLOONS2, AND BLIMP MOTOR)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $01, $3D					; SET AND BG AND SPR PALLETE AND FADE IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	RETURN_FROM_BG_SUBSCRIPT[]					
	
_F}_HALF_TIME_BLIMP_SCENE_SCRIPT	

_F{_HALF_TIME_WINKING_GIRL_SCENE_SCRIPT

HALF_TIME_WINKING_GIRL_SCENE_SCRIPT:							; 0X4A HALFTIME CHEERLEADER WINK 
	DRAW_BACKGROUND[bg_Id] $04					; (BIG CHEERLEADER ONE ARM VERTICAL ONE AT 45 DEG) 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $32					; (CHEERLEADER BELLY) OFFSCREEN
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $80, $2A00, $18, $1A	
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $2380, WINKING_GIRL_ATTR_VALUES		; SET PPU ADDR = $2380, BUFFER BOTTOM TWO ROWS OF HALF_TIME_GIRL_WINK_SCREEN 
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23F8, WINKING_GIRL_ATTR_VALUES_TWO		; SET PPU ADDR = $23F8= ATTRIB TABLE, BUFFER  ATTRIB TABLE FOR HALF_TIME_GIRL_WINK_SCREEN
	SET_BG_SCRIPT_PPU_ADDR[addr] $2667					;  OFFSCREEN
	.DB      "HALF TIME"				;
	DRAW_ONE_METASPRITE[spriteID] $9E					;(CHEERLEADER EYES)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $02, $3B					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	SET_SCROLLING[yspd_xspd_time] $E0, $00, $14				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	RETURN_FROM_BG_SUBSCRIPT[]					 

WINKING_GIRL_ATTR_VALUES:							; BOTTOM TWO ROWS OF HALF_TIME_GIRL_WINK_SCREEN
	.DB $20, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $93, $03, $C1, $C4, $AE, $AF, $BA, $00, $B9, $BC, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.DB $A1
	.DB $20, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $97, $96, $00, $C2, $C3, $C6, $EE, $BC, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	END_OF_SCRIPT_OR_DATA[]						

WINKING_GIRL_ATTR_VALUES_TWO:							; ATTRIB TABLE FOR BOTTOM TWO ROWS OF BOTTOM TWO ROWS OF HALF_TIME_GIRL_WINK_SCREEN
	.DB $08, $55, $55, $55, $5D, $57, $55, $55, $55
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_HALF_TIME_WINKING_GIRL_SCENE_SCRIPT	

_F{_HALF_TIME_BAND_SCENE_SCRIPT

HALF_TIME_BAND_SCENE_SCRIPT:							; 0X4B HALFTIME BAND 
	DRAW_BACKGROUND[bg_Id] $05					; (BAND IN UPPER 3/4 OF SCREEN) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $F8, $6C, $6E		
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	SET_BG_SCRIPT_PPU_ADDR[addr] $2267
	.DB      "HALF TIME"				;
	DRAW_ONE_METASPRITE[spriteID] $7F					
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $03, $00					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $00, $00					; CHANGE SCROLL SPEED IRQ0 (SCROLL SPEED) = STOP SCROLL
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	RETURN_FROM_BG_SUBSCRIPT[]					
	
_F}_HALF_TIME_BAND_SCENE_SCRIPT	

_F{_HALF_TIME_CHEER_PANTY_SCENE_SCRIPT

HALF_TIME_CHEER_PANTY_SCENE_SCRIPT:							; 0X4C HALFTIME CHEELEADER TOSS PANTY SHOT
	SET_MIRRORING_TO_VERTICAL[]					
	DRAW_BACKGROUND[bg_Id] $33					; (STADIUM WITH LOTS OF CLOUDS TOP 1/4 OF SCREEN) 
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $80, $2400, $18, $1A	
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $2380, BLUE_SKY_TILES_SCRIPT		; BLUE SKY TOP ROW OF TILES	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2467 
	.DB      "HALF TIME"				;
	DRAW_ONE_METASPRITE[spriteID] $0D					;(CHEELEADER JUMPING PANTY SHOT)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $00, $44					
	START_CHANGING_PALLETE[pallete_id] $07					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	SET_SCROLLING[yspd_xspd_time] $26, $00, $28				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	INCREASE_SCROLL_SPEED[yspd_xspd] $20, $00					; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3A					; WAIT 58 FRAMES = 0.96 SEC
	DECREASE_SCROLL_SPEED[yspd_xspd] $00, $00					; DECREASE SCROLL SPEED (Y,X) SET SCROLL TIMER TO VERY LONG            ;  why? 
	INCREASE_SCROLL_SPEED[yspd_xspd] $00, $00					; SET AMOUNT TO INCREASE SCROLL SPEED (Y,X)    ;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $66					; WAIT 102 FRAMES = 1.7 SEC
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	RETURN_FROM_BG_SUBSCRIPT[]					
	
_F}_HALF_TIME_CHEER_PANTY_SCENE_SCRIPT	

_F{_HALF_TIME_PARACHUTE_WAVE_SCENE_SCRIPT
	
HALF_TIME_PARACHUTE_WAVE_SCENE_SCRIPT:							; 0X4D HALFTIME PARACHUTE PLUS WAVE
	DRAW_BACKGROUND[bg_Id] $06					; (DOUBLE DECKER STADIUM SHOT HALF OF SCREEN IS SKY) 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $2F					; (BOTTOM OF STADIUM+ SMALL CROWD+ DOORS+ ALMOST ALL OF FIELD) OFFSCREEN
	SET_IRQ_CNTR_PPU_ADDR_AND_CHR[irq_counter_ppu_addr_ch0bk_ch1_bk] $01, $80, $2A00, $18, $1A	
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $2380, PARACHUTE_WAVE_ATTR_VALUES		; DRAW LAST TWO ROWS
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23F8, PARACHUTE_WAVE_ATTR_VALUES_TWO		; SET ATTRIBUTE TABLE DATA
	SET_BG_SCRIPT_PPU_ADDR[addr] $2667
	.DB      "HALF TIME"				;
	SET_SCROLLING[yspd_xspd_time] $F0, $20, $37				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	DRAW_TWO_METASPRITES[spID1_sprID2]  $1E, $1F				; DRAW 2 SPRITES (PARACHUTER, PART OF PARACHUTER)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $05, $34					
	START_CHANGING_PALLETE[pallete_id] $04					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $64					; WAIT 100 FRAMES = 1.66 SEC
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $32, $34					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	DRAW_BACKGROUND[bg_Id] $07					; (DOUBLE DECKER STADIUM ALL STADIUM)  
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	SET_BG_SCRIPT_PPU_ADDR[addr] $2267
	.DB      "HALF TIME"				;
	SET_SCROLLING[yspd_xspd_time] $00, $FA, $20				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	DRAW_TWO_METASPRITES[spID1_sprID2]  $A9, $AA				; DRAW 2 SPRITES (THE WAVE 1, THE WAVE 2)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $05, $36					
	START_CHANGING_PALLETE[pallete_id] $04					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	RETURN_FROM_BG_SUBSCRIPT[]					 

PARACHUTE_WAVE_ATTR_VALUES:							; BOTTOM TWO ROWS OF HALF_TIME_PARACHUTE_WAVE_SCREENS
	.DB $20												; DATA LENGTH 
	
	.DB $6A, $6B, $6A, $6B, $6A, $F5, $6A, $6B, $6A, $6B, $6A, $6B, $6A, $F5, $6A, $6B, $6A, $6B, $6A, $6B, $6A, $F5, $6A, $6B, $6A, $6B, $6A, $6B, $6A, $F5, $6A, $6B
	
	.DB $A1												; DOWN ONE ROW 
	
	.DB $20												; DATA LENGTH 
	
	.DB $6A, $6B, $6A, $6B, $6A, $F5, $6A, $6B, $6A, $6B, $6A, $6B, $6A, $F5, $6A, $6B, $6A, $6B, $6A, $6B, $6A, $F5, $6A, $6B, $6A, $6B, $6A, $6B, $6A, $F5, $6A, $6B
	END_OF_SCRIPT_OR_DATA[]						

PARACHUTE_WAVE_ATTR_VALUES_TWO:							; BOTTOM TWO ROWS ATTRIB VALS OF HALF_TIME_PARACHUTE_WAVE_SCREENS
	.DB $08, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_HALF_TIME_PARACHUTE_WAVE_SCENE_SCRIPT	

_F{_PLAYER_PORTRAIT_FOR_PENALTY_SCENE_SCRIPT

PLAYER_PORT_WITH_PASS_STAT_TXT_SCRIPT_UNUSED:														; DRAW PLAYER PORTAIT WITH SMALL COMP%, YD, TD
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_BG_CHR_BANKS[table0_table1] $40, $1A																				; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_16[]																		; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $22E2,PASSING_STAT_LABELS_SCRIPT 					; COMP%, YD, TD RED TEXT TILES
	DO_SCENE_SUBROUTINE[] DRAW_PLAYER_PORT_BG_FOR_PENALTY_SCRIPT
	DRAW_ONE_METASPRITE[spriteID] $7F																
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $36, $00					
	PLAY_SOUND_BG[Sound] $2C																		; (END OF QUARTER)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0															; WAIT 240 FRAMES = 4 SEC
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	END_OF_SCRIPT_OR_DATA[]						

DRAW_PLAYER_PORT_BG_FOR_PENALTY_SCRIPT:							; 0X4E DRAW PLAYER PORTRAIT BOX
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C8, DEFAULT_BG_ATTR_TABLE_VALUES		
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $2145, $08, $06, $97			; BLANK WHITE TILE(97)
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $2166, $04, $04, $75			; BLANK BLUE TILE (75)
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $21E6, $02, $04, $4A			;  BLANK GREY TILE (4a)
	DRAW_TILE_AT_PPUADDR[addr_tile] $21C6, $71									; LEFT SHOULDER PAD TILE
	DRAW_TILE_AT_PPUADDR[addr_tile] $21C9, $74									; RIGHT SHOULDER PAD TILE
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23D1, PLAYER_PORT_ATTR_VALUES						; SET PPU ADDR = 23D1 = PLAYER PORTRAIT ATTRIBUTE TABLE VALUES
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23D9, PLAYER_PORT_ATTR_VALUES_TWO					; SET PPU ADDR = 23D9 = ATTRIBUTE TABLE VALUES VARIOUS 2
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23E1, PLAYER_PORT_ATTR_VALUES_TWO					; SET PPU ADDR = 23E1 = ATTRIBUTE TABLE VALUES VARIOUS 2
	RETURN_FROM_BG_SUBSCRIPT[]					 

PLAYER_PORT_ATTR_VALUES:							; PLAYER PORTRAIT ATTRIBUTE TABLE VALUES 23D1
	.DB $03
	.DB $F0, $F0, $F0		; 
	END_OF_SCRIPT_OR_DATA[]						

PASSING_STAT_LABELS_SCRIPT:							; COMP%, YD, TD RED TEXT TILES
													; LENGTH, TILES		
	.DB $08
	.DB $53, $56, $57, $55, $5F, $5F, $5F, $5F
	.DB $09
	.DB $5F, $5F, $00, $00, $59, $5C, $5D, $5F, $5F
	.DB $09 
	.DB $5F, $5F, $5F, $00, $00, $5B, $5E, $5F, $5F
	END_OF_SCRIPT_OR_DATA[]						

DEFAULT_BG_ATTR_TABLE_VALUES:							; ATTRIBUTE TABLE VALUES VARIOUS 1   
	.DB $08
	.DB $55, $55, $55, $55, $55, $55, $55, $55
	END_OF_SCRIPT_OR_DATA[]						

PLAYER_PORT_ATTR_VALUES_TWO:							; ATTRIBUTE TABLE VALUES VARIOUS 2
	.DB $02
	.DB $FF, $FF
	END_OF_SCRIPT_OR_DATA[]						

_F}_PLAYER_PORTRAIT_FOR_PENALTY_SCENE_SCRIPT	
	
_F{_HALF_TIME_CHEER_KICK_SCENE_SCRIPT

HALF_TIME_CHEER_KICK_SCENE_SCRIPT:							; 0X4F HALTIME KICKING CHEELEADERS
	SET_BG_CHR_BANKS[table0_table1] $6A, $68					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	DRAW_BACKGROUND[bg_Id] $30					; DRAW SOMETHING STADIUM  
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	SET_BG_SCRIPT_PPU_ADDR[addr] $2267
	.DB      "HALF TIME"				;
	SET_SCROLLING[yspd_xspd_time] $00, $FC, $20				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	DRAW_TWO_METASPRITES[spID1_sprID2]  $2B, $2C				; DRAW 2 SPRITES (CHEERLEADER FAR LEFT, CHEERLEADER MIDDLE)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $32, $33					
	START_CHANGING_PALLETE[pallete_id] $04					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	RETURN_FROM_BG_SUBSCRIPT[]					
	
_F}_HALF_TIME_CHEER_KICK_SCENE_SCRIPT	

_F{_HALF_TIME_KISS_SCENE_SCRIPT

HALF_TIME_KISS_SCENE_SCRIPT:							; 0X50 HALFTIME CHEERLEADER KISS
	SET_MIRRORING_TO_VERTICAL[]					
	DRAW_BACKGROUND[bg_Id] $08					; (CHEERLEADER FACE CLOSEUP) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	SET_BG_SCRIPT_PPU_ADDR[addr] $2267
	.DB      "HALF TIME"				;
	DRAW_TWO_METASPRITES[spID1_sprID2]  $81, $89				; DRAW 2 SPRITES (KISSING CHEER EYES+ MOUTH, HAIR)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $04, $3B					
	SET_SCROLLING[yspd_xspd_time] $00, $E0, $18				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	RETURN_FROM_BG_SUBSCRIPT[]					
	
_F}_HALF_TIME_KISS_SCENE_SCRIPT	

_F{_DEF_DIVE_MISS_AND_JUMP_WHIFF_SCENE_SCRIPTS

DEF_DIVE_MISS_OFF_CATCH_SCENE_SCRIPT: 							; 0X51 DEFENSE DIVING MISS OFFENSE CATCH
	DO_SCENE_SUBROUTINE[] DEFENDER_DIVE_MISS_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $08, $06				; DRAW 2 SPRITES (BALL ANGLED DOWN, PLAYER SIDEWWAYS CATCH)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $20, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $40				; 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $02, $58, $00, $18, $1A		

END_OF_DEF_MISS_OFF_CATCH_SCRIPT:							; COMPLETE PASS SOUND AND TEXT, STOP SCROLLING AFTER DEFENDER MISS
	DO_SCENE_SUBROUTINE[] SET_PAL_PLAY_CATCH_SOUND_SCRIPT
	DO_SCENE_SUBROUTINE[] CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	DO_SCENE_SUBROUTINE[] COMPLETE_PASS_TEXT_AND_WR_NAME_SCRIPT
	JUMP_TO_SCENE[scene_addr] WAIT_TWENTY_FRAMES_FADE_OUT_SCRIPT

DEFENDER_DIVE_MISS_SCRIPT:							; DEFENDER DIVING AND MISSING BALL
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SCENE_SIDE_BASED_ON_POSSESSION[]						; SET CUTSCENE PLAYER SIDE
	DRAW_BACKGROUND[bg_Id] $39					; (STADIUM WITH COULLMNS DOORS, CLOUDS 2) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $10, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $08				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $16, $40				; 
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $36					; (TOP OF STADIUM WITH CLOUDS) OFFSCREEN
	DRAW_TWO_METASPRITES[spID1_sprID2]  $63, $64				; DRAW 2 SPRITES (BALL ANI ANGLED DIVE, PLAYER DIVING AND MISSING BALL)
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $80					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	RETURN_FROM_BG_SUBSCRIPT[]					 
	




DEF_JUMP_WHIFF_OFF_CATCH_SCENE_SCRIPT:							; 0X52 DEFENDER JUMPS AND MISSES PLAYER CATCHES
	DO_SCENE_SUBROUTINE[] PLAYER_JUMP_WHIFF_SCENE_SCRIPT
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $85					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $32					; WAIT 50 FRAMES
	DRAW_TWO_METASPRITES[spID1_sprID2]  $08, $06				; DRAW 2 SPRITES (BALL ANGLED DOWN, PLAYER SIDEWAYS CATCH)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_CHR_BANKS[table0_table1] $18, $26					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $40				; 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $02, $58, $00, $18, $1A		
	JUMP_TO_SCENE[scene_addr] END_OF_DEF_MISS_OFF_CATCH_SCRIPT

DEF_DIVE_MISS_OFF_DROP_SCENE_SCRIPT:							; 0X53 DEFENSE DIVE MISS, BOUNCE OFF WR 	
	DO_SCENE_SUBROUTINE[] DEFENDER_DIVE_MISS_SCRIPT
	DRAW_TWO_METASPRITES[spID1_sprID2]  $07, $5E				; DRAW 2 SPRITES( BALL BOUNCES OFF PLAYER/GROUND, PLAYER TRYING TO CATCH)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $20, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $40				; 
	DO_SCENE_SUBROUTINE[] SET_PAL_PLAY_BOUNCE_SOUND_SCRIPT
	DO_SCENE_SUBROUTINE[] CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	JUMP_TO_SCENE[scene_addr] WAIT_TWENTY_FRAMES_FADE_OUT_SCRIPT

DEF_JUMP_WHIFF_OFF_DROP_SCENE_SCRIPT:							; 0X54 DEFENSE JUMP MISS, BOUNCE OFF WR 
	DO_SCENE_SUBROUTINE[] PLAYER_JUMP_WHIFF_SCENE_SCRIPT			; DO-> DRAW BG AND SPRITES FOR PLAYER JUMP AND WHIFF
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $85					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $32					; WAIT 48 FRAMES
	DRAW_TWO_METASPRITES[spID1_sprID2]  $07, $5E				; DRAW 2 SPRITES( BALL BOUNCES OFF PLAYER/GROUND, PLAYER TRYING TO CATCH)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_CHR_BANKS[table0_table1] $18, $26					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $40				; 
	DO_SCENE_SUBROUTINE[] SET_PAL_PLAY_BOUNCE_SOUND_SCRIPT
	DO_SCENE_SUBROUTINE[] CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_8_FRAMES_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $01					
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $02					; (STADIUM + CLOUDS BACKGROUND 2) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	JUMP_TO_SCENE[scene_addr] FOOTBALL_BIG_TO_SMALL_SCRIPT
	
_F}_DEF_DIVE_MISS_AND_JUMP_WHIFF_SCENE_SCRIPTS	

_F{_DEF_DIVE_INT_SCENE_SCRIPT

DEF_DIVE_INT_SCENE_SCRIPT:							; 0X55 DIVING INTERCEPTION
	DO_SCENE_SUBROUTINE[] BG_AND_SPRITES_DIVING_CATCH_SCRIPT
	GET_DEFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal] $80					; GET SPECIAL TEAMS/DEFENDER PLAYER PALLETE, SET BG PAL AND FADE IN(PAL)
	DO_SCENE_SUBROUTINE[] PLAY_CATCH_SOUNDS_CHANGE_SCROLL_DIVE_SCRIPT			; DO-> PLAY CATCH SOUND AND CHANGE SCROLL SPEEDS
	JUMP_TO_SCENE[scene_addr] END_OF_DIVE_NORMAL_INT_SCRIPT
	
_F}_DEF_DIVE_INT_SCENE_SCRIPT	

_F{_DIVISION_CHAMP_SCENE_SCRIPT

DIVISION_CHAMP_SCENE_SCRIPT:							; 0X56 DIVISION CHAMP
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	RESET_X_Y_SCROLL_TO_ZERO[]						; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	SET_MIRRORING_TO_VERTICAL[]					
	DRAW_BACKGROUND[bg_Id] $0D					; (DIVISION CHAMP TEAM CELEBRATING) 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	DRAW_TWO_METASPRITES[spID1_sprID2]  $2D, $2E				; DRAW TWO SPRITES( PLAYER FACES IN HELMETS1, 2) 
	SET_SPRITE_SIZE_8_by_8[]					; SET TEXT SIZE TO 8 X 8
	SET_BG_SCRIPT_PPU_ADDR[addr] $222B
	DRAW_CURRENT_TEAM_CONF[] 					; DRAW CURRENT TEAM CONFERENCE
	SET_BG_SCRIPT_PPU_ADDR[addr] $2231
	DRAW_CURRENT_TEAM_DIVISION[]					; DRAW CURRENT TEAM DIVISION
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2262
	.DB      "DIVISION CHAMP"			;
	DO_SCENE_SUBROUTINE[] DRAW_TEAM_CITY_NAME_SCRIPT
	SET_DIV_CHAMP_SPR_PALLETE[]					; SET DIV CHAMP PAL
	FADE_IN_BG_AND_SPR_PALLETE[]					; FADE IN BG AND SPR PAL
	PLAY_SOUND_BG[Sound] $30					; (DIVISION CHAMP SONG)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	SET_SCROLLING[yspd_xspd_time] $00, $F6, $20				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SEC
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SEC
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_DIVISION_CHAMP_SCENE_SCRIPT	

_F{_FLASH_START_GAME_SCENE_SCRIPT

FLASH_START_GAME_SCENE_SCRIPT:							; 0X57 FLASH START GAME ON START PRESSED
	PLAY_SOUND_BG[Sound] $13					;( PRESS START)
START_PRESSED_LOOP_SCRIPT:							; START PRESSED LOOP
	DRAW_LINE_ACROSS_AT_PPUADDR[addr_width_tile] $224B, $0A, $00 ; BLANK TILE
	WAIT_NUMBER_OF_FRAMES_BG[frames] $07					; WAIT 7 FRAMES
	SET_BG_SCRIPT_PPU_ADDR[addr] $224B
	.DB      "START GAME"				;
	WAIT_NUMBER_OF_FRAMES_BG[frames] $07					; WAIT 7 FRAMES
	JUMP_TO_SCENE[scene_addr] START_PRESSED_LOOP_SCRIPT
	
_F}_FLASH_START_GAME_SCENE_SCRIPT	

_F{_SUPERBOWL_HALFTIME_SCENE_SCRIPTS

MIGHTY_BOMBJACK_HALFTIME_SCENE_SCRIPT:							; 0X58 SUPERBOWL HALFTIME MIGHTY BOMBJACK SHOW
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_BG_CHR_BANKS[table0_table1] $18, $1A					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	SET_BG_SCRIPT_PPU_ADDR[addr] $2167
	.DB " SPECIAL"
	MOVE_DOWN_3_ROWS[]
	.DB "HALF TIME"					;
	SET_AND_FADE_IN_BG_PALLETE[BgPal] $00					; SET AND FADE IN BG PALLETE (BG PAL INDEX)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	DRAW_BACKGROUND[bg_Id] $00					; (STADIUM PLUS SKY) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $F6, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $20, $FA				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $16, $00				; 
	SET_SPRITE_SIZE_8_by_8[]					; SET TEXT SIZE TO 8 X 8
	SET_BG_SCRIPT_PPU_ADDR[addr] $2264
	.DB      "THE MIGHTY BOMBJACK SHOW"		; 
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $C6, $C5, $C4			; (BOMB JACK FROM TOP, BOMBJACK RUN FROM LEFT, BOMBJACK RUN FROM RIGHT)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $4A					
	PLAY_SOUND_BG[Sound] $1A					;( CROWD TD )
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	PLAY_SOUND_BG[Sound] $05					; (HUT) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $13					; WAIT 19 FRAMES = 0.3 SEC
	PLAY_SOUND_BG[Sound] $40					;( IN GAME P2 )
	WAIT_NUMBER_OF_FRAMES_BG[frames] $FA					; WAIT 250 FRAMES = ~4.1 SEC
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	DO_SCENE_SUBROUTINE[] PLAY_HUT_THREE_TIMES_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SEC
	WAIT_NUMBER_OF_FRAMES_BG[frames] $10					; WAIT 16 FRAMES =0.26 SEC
	DO_SCENE_SUBROUTINE[] PLAY_HUT_THREE_TIMES_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $9A					; WAIT 154 FRAMES = ~2.5 SEC
	PLAY_SOUND_BG[Sound] $05					; (HUT)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $92					; WAIT 146 FRAMES = ~2.5 SEC
	PLAY_SOUND_BG[Sound] $05					; (HUT)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SEC
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	PLAY_SOUND_BG[Sound] $03					; (READY)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $8C					; WAIT 140 FRAMES = 2.2 SEC
	PLAY_SOUND_BG[Sound] $04					; (DOWN)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	PLAY_SOUND_BG[Sound] $05					; (HUT)
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_MIGHTY_BOMJACK_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_MIGHTY_BOMJACK_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $38					; WAIT 56 FRAMES = 0.93 SEC
	DO_SCENE_SUBROUTINE[] PLAY_DOWN_HUT_SCRIPT
	DO_SCENE_SUBROUTINE[] PLAY_DOWN_HUT_SCRIPT
	DO_SCENE_SUBROUTINE[] PLAY_DOWN_HUT_SCRIPT
	PLAY_SOUND_BG[Sound] $04					; (DOWN)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $09				  	; WAIT 9 FRAMES
	DO_SCENE_SUBROUTINE[] PLAY_HUT_THREE_TIMES_FAST_SCRIPT			
	DO_SCENE_SUBROUTINE[] PLAY_HUT_THREE_TIMES_FAST_SCRIPT			
	PLAY_SOUND_BG[Sound] $1B					; (CROWD NOISE) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $7C					; WAIT 124 FRAMES = ~2 SEC
	PLAY_SOUND_BG[Sound] $2C					; (END OF QUARTER GUN)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $8C					; WAIT 140 FRAMES = ~2.3 SEC  
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]												
	END_OF_SCRIPT_OR_DATA[]						

PLAY_HUT_THREE_TIMES_SCRIPT:							; PLAY HUT 3 TIMES
	PLAY_SOUND_BG[Sound] $05					; (HUT)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $10					; WAIT 16 FRAMES = 1 SEC
	PLAY_SOUND_BG[Sound] $05					; (HUT)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $10					; WAIT 16 FRAMES = 1 SEC
	PLAY_SOUND_BG[Sound] $05					; (HUT)
	RETURN_FROM_BG_SUBSCRIPT[]					 

PLAY_DOWN_HUT_SCRIPT:							; PLAY DOWN THEN HUT 2 SEC
	PLAY_SOUND_BG[Sound] $04					; PLAY "DOWN" SOUND 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $09					; WAIT 60 FRAMES = 1 SEC
	PLAY_SOUND_BG[Sound] $05					; PLAY "HUT" SOUND 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	RETURN_FROM_BG_SUBSCRIPT[]					

FLASH_BG_PAL_MIGHTY_BOMJACK_SCRIPT:							; FLASH BACKGROUND
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $21					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $04					; WAIT 4 FRAMES
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $00					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $04					; WAIT 4 FRAMES
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $21					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $04					; WAIT 4 FRAMES
	SET_BG_PALLETE_FULLY_FADED_IN[BgPal] $00					; SET BG PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $04					; WAIT 4 FRAMES
	RETURN_FROM_BG_SUBSCRIPT[]					

PLAY_HUT_THREE_TIMES_FAST_SCRIPT:							; PLAY HUT 3 TIMES FAST 24 FRAMES
	PLAY_SOUND_BG[Sound] $05					; PLAY "HUT" SOUND 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $08					; WAIT 8 FRAMES
	PLAY_SOUND_BG[Sound] $05					; PLAY "HUT" SOUND 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $08					; WAIT 8 FRAMES
	PLAY_SOUND_BG[Sound] $05					; PLAY "HUT" SOUND 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $08					; WAIT 8 FRAMES						
	RETURN_FROM_BG_SUBSCRIPT[]					
	
_F}_SUPERBOWL_HALFTIME_SCENE_SCRIPTS	
	
_F{_HALFTIME_SCENE_SCRIPTS

HALFTIME_SEQ1_SCENE_SCRIPT:							; 0x59 HALFTIME 1 (BLIMP + BALLOON, CHEER WINK, BAND, KISS)
	DO_SCENE_SUBROUTINE[] INIT_SCREEN_START_HALFTIME_SONG_SCRIPT
	DRAW_BACKGROUND[bg_Id] $03					; (GOALPOSTS WITH BLIMP) 
	DO_SCENE_SUBROUTINE[] BALOONS_AND_BLIMP_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_WINKING_GIRL_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_BAND_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_KISS_SCENE_SCRIPT
	END_OF_SCRIPT_OR_DATA[]						

INIT_SCREEN_START_HALFTIME_SONG_SCRIPT:							; SET SPLIT SCREEN LOCATION AND START HALFTIME SONG
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	PLAY_SOUND_BG[Sound] $2D					; PLAY SONG( HALFTIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $32					; WAIT 66 FRAMES = ~ 1 SEC
	RETURN_FROM_BG_SUBSCRIPT[]					



HALFTIME_SEQ2_SCENE_SCRIPT:							; 0x5A HALFTIME 2 (PARACHUTE+ WAVE, KICKING CHEER, BAND, KISS)
	DO_SCENE_SUBROUTINE[] INIT_SCREEN_START_HALFTIME_SONG_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_PARACHUTE_WAVE_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_CHEER_KICK_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_CHEER_PANTY_SCENE_SCRIPT
	END_OF_SCRIPT_OR_DATA[]						

HALFTIME_SEQ3_SCENE_SCRIPT:							; 0x5B HALFTIME 3 (KICKING CHEER, BAND, BLIMP+ BALLOONS, WINK)
	DO_SCENE_SUBROUTINE[] INIT_SCREEN_START_HALFTIME_SONG_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_CHEER_KICK_SCENE_SCRIPT
    DO_SCENE_SUBROUTINE[] HALF_TIME_BAND_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_BLIMP_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_WINKING_GIRL_SCENE_SCRIPT
	END_OF_SCRIPT_OR_DATA[]						

HALFTIME_SEQ4_SCENE_SCRIPT:							; 0x5C HALFTIME 4 (CHEER WINK, KICKING CHEER, PANTY, KISS)
	DO_SCENE_SUBROUTINE[] INIT_SCREEN_START_HALFTIME_SONG_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_WINKING_GIRL_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_CHEER_KICK_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_CHEER_PANTY_SCENE_SCRIPT
	DO_SCENE_SUBROUTINE[] HALF_TIME_KISS_SCENE_SCRIPT
	END_OF_SCRIPT_OR_DATA[]						

_F}_HALFTIME_SCENE_SCRIPTS

_F{_MILESTONES_UNUSED_SCENE_SCRIPTS					; UUU 

RUSH_YARDS_SCENE_SCRIPT:							; 0x5D YARDS RUSH TODAY UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT	
	DO_SCENE_SUBROUTINE[] DRAW_YARDS_TEXT_SCRIPT
	MOVE_DOWN_2_ROWS[]
	.DB      " RUSH!"

END_OF_YARDAGE_MILESTONE_SCRIPT:							; START BLINKING PALLETE WITH END OF QTR SOUND 
	DRAW_ONE_METASPRITE[spriteID] $7F					
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $36, $00					
	START_CHANGING_PALLETE[pallete_id] $0B					
	PLAY_SOUND_BG[Sound] $2C					; (END OF QUARTER) 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]												
	END_OF_SCRIPT_OR_DATA[]											

DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT:							; DRAW FLASHING STARS WITH PORTRAIT BACKGROUND
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $26																; DRAW FLASHING STARS SCREEN OUTLINE 
	DRAW_ONE_METASPRITE[spriteID] $7F					
	SET_SPRITE_SIZE_8_by_16[]																; SET TEXT SIZE TO 16X16 
	DRAW_LINE_ACROSS_AT_PPUADDR[addr_width_tile] $2102, $1C, $5F							;  5F = RED LINE TILE
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $21A6, $08, $06, $97						; DRAW PORTRAIT OUTLINE 
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $21C7, $04, $04, $75						; DRAW PORTRAIT SKY 
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $2247, $02, $04, $4A						; DRAW PORTRAIT GREY
	DRAW_TILE_AT_PPUADDR[addr_tile] $2227, $71												; DRAW LEFT PORTRAIT GREY TILE
	DRAW_TILE_AT_PPUADDR[addr_tile] $222A, $74												; DRAW RIGHT PORTRAIT GREY TILE
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23C9, YARDAGE_SCREEN_ATTR_VALS_1_DATA		; SET PPU ADDR = 23C9 = ATTRIBUTE TABLE
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23D9, YARDAGE_SCREEN_ATTR_VALS_2_DATA		; SET PPU ADDR = 23D9 = ATTRIBUTE TABLE 
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23E1, YARDAGE_SCREEN_ATTR_VALS_2_DATA		; SET PPU ADDR = 23E1 = ATTRIBUTE TABLE 
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23E9, YARDAGE_SCREEN_ATTR_VALS_3_DATA		; SET PPU ADDR = 23E9 = ATTRIBUTE TABLE
	RETURN_FROM_BG_SUBSCRIPT[]									

DRAW_YARDS_TEXT_SCRIPT:							; DRAW YARDS TEXT
	SET_BG_SCRIPT_PPU_ADDR[addr] $208A
	.DB "  YARDS"					;
	RETURN_FROM_BG_SUBSCRIPT[]					

YARDAGE_SCREEN_ATTR_VALS_1_DATA:							; SPECIAL SCREENS ATTIRBUTE TABLE VALS FOR 23C9
	.DB $06													; DATA LENGTH
	.DB $55, $55, $55, $55, $55, $55
	END_OF_SCRIPT_OR_DATA[]						

YARDAGE_SCREEN_ATTR_VALS_2_DATA:							; SPECIAL SCREENS ATTIRBUTE TABLE VALS FOR 23D9 AND 23E1
	.DB $02													; DATA LENGTH
	.DB $CC, $FF					;
	END_OF_SCRIPT_OR_DATA[]						

YARDAGE_SCREEN_ATTR_VALS_3_DATA:							; SPECIAL SCREENS ATTIRBUTE TABLE VALS FOR 23D9 AND 23E9
	.DB $02													; DATA LENGTH
	.DB $0C, $0F			
	END_OF_SCRIPT_OR_DATA[]						

YARDS_RETURN_TODAY_SCENE_SCRIPT:							; 0x5E YARDS RETURN TODAY UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	DO_SCENE_SUBROUTINE[] DRAW_YARDS_TEXT_SCRIPT
	MOVE_DOWN_2_ROWS[]
	.DB      "RETURN!"				;
	JUMP_TO_SCENE[scene_addr] END_OF_YARDAGE_MILESTONE_SCRIPT

YARDS_RECEIVE_TODAY_SCENE_SCRIPT:							; 0x5F YARDS RECEIVE TODAY UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	DO_SCENE_SUBROUTINE[] DRAW_YARDS_TEXT_SCRIPT
	MOVE_DOWN_2_ROWS[]
	.DB      "RECEIVE!"				;
	JUMP_TO_SCENE[scene_addr] END_OF_YARDAGE_MILESTONE_SCRIPT

INTERCEPTION_TD_SCENE_SCRIPT:							; 0x60 INTERCEPTION TOUCHDOWN UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2084
	.DB      "INTERCEPTION"				;

DRAW_TOUCHDOWN_TEXT_SCRIPT:							; DRAW TOUCHDOWN TEXT  THEN DO BLINKING PALLETE AND GUN SOUND 
	SET_BG_SCRIPT_PPU_ADDR[addr] $20C6
	.DB      "TOUCHDOWN!"				; 
	JUMP_TO_SCENE[scene_addr] END_OF_YARDAGE_MILESTONE_SCRIPT

DEFENSIVE_TD_SCENE_SCRIPT:							; 0x61 DEFENSIVE TOUCHDOWN UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2087
	.DB      "DEFENSIVE"				; 
	JUMP_TO_SCENE[scene_addr] DRAW_TOUCHDOWN_TEXT_SCRIPT

YARDS_RUSH_TODAY_SCENE_SCRIPT:							; 0x62 RUSHING YARDS TODAY UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2088
	.DB      "RUSHING"				;

DRAW_YARDS_TODAY_SCRIPT:							; DRAW YARDS TODAY TEXT
	SET_BG_SCRIPT_PPU_ADDR[addr] $20C8
	.DB      "YARDS TODAY"				;
	JUMP_TO_SCENE[scene_addr] END_OF_YARDAGE_MILESTONE_SCRIPT

YARDS_REC_TODAY_SCENE_SCRIPT:							; 0X63 RECEIVING YARDS TODAY UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2086
	.DB      "RECEIVING"				;
	JUMP_TO_SCENE[scene_addr] DRAW_YARDS_TODAY_SCRIPT

SACKS_TODAY_SCENE_SCRIPT:							; 0X64 SACKS TODAY UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $208C				
	.DB      "SACKS"					;

DRAW_TODAY_TEXT_SCRIPT:							; DRAW TODAY TEXT
	SET_BG_SCRIPT_PPU_ADDR[addr] $20CA
	.DB      "TODAY!"					;
	JUMP_TO_SCENE[scene_addr] END_OF_YARDAGE_MILESTONE_SCRIPT

INT_TODAY_SCENE_SCRIPT:							; 0X65 INTERCEPTIONS TODAY UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2084
	.DB      "INTERCEPTIONS"			;
	JUMP_TO_SCENE[scene_addr] DRAW_TODAY_TEXT_SCRIPT

BLANK_YARDS_RUSHER_SCENE_SCRIPT:							; 0X66 000 YARDS RUSHER UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	DO_SCENE_SUBROUTINE[] DRAW_000_YARDS_BG_SCRIPT			; DO->DRAW "000" YARDS	
	SET_BG_SCRIPT_PPU_ADDR[addr] $20C8
	.DB      "RUSHER!"				;
	JUMP_TO_SCENE[scene_addr] END_OF_YARDAGE_MILESTONE_SCRIPT

DRAW_000_YARDS_BG_SCRIPT:							; DRAW "000" YARDS 
	.SET_BG_SCRIPT_PPU_ADDR[addr] $2088					
	.DB      $30, $30, $30, "YARDS"		; "000" YARDS
	RETURN_FROM_BG_SUBSCRIPT[]					 

BLANK_YARDS_RECEIVER_SCENE_SCRIPT:							; 0X67 000 YARDS RECIEVER UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	DO_SCENE_SUBROUTINE[] DRAW_000_YARDS_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $20C6
	.DB      "RECEIVER!"				;
	JUMP_TO_SCENE[scene_addr] END_OF_YARDAGE_MILESTONE_SCRIPT	

BLANK_YARDS_PASSER_SCENE_SCRIPT:							; 0X68 000 YARDS PASSER UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YARDAGE_MILESTONE_SCREEN_BG_SCRIPT
	DO_SCENE_SUBROUTINE[] DRAW_000_YARDS_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $20C8
	.DB      "PASSER!"				;
	JUMP_TO_SCENE[scene_addr] END_OF_YARDAGE_MILESTONE_SCRIPT
	
_F}_MILESTONES_UNUSED_SCENE_SCRIPTS	

_F{_FALSE_START_AND_OFFSIDES_SCENE_SCRIPTS			; UUU

FALSE_START_SCENE_SCRIPT:							; 0X69 FALSE START UNUSED
	DO_SCENE_SUBROUTINE[] DRAW_YELLOW_FLAG_SCRIPT			
	DO_SCENE_SUBROUTINE[] DRAW_PLAYER_PORT_BG_FOR_PENALTY_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2305
	.DB      "FALSE START"				; 

PLAY_PENALTY_SONG_FLASH_PAL_SCRIPT:							; PLAY PENALTY SOUND SND START BLINKING PAL 4 SECONDS FOR PENALTIES
	DRAW_ONE_METASPRITE[spriteID] $7F					
	PLAY_SOUND_BG[Sound] $2A					; (NOTHING)
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $36, $00					
	START_CHANGING_PALLETE[pallete_id] $0C					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $F0					; WAIT 240 FRAMES = 4 SEC
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]												
	END_OF_SCRIPT_OR_DATA[]						


DRAW_YELLOW_FLAG_SCRIPT:							; DRAW YELLOW FLAG BG
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	SET_BG_CHR_BANKS[table0_table1] $40, $1A					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $20A1, $02, $02, $97			; $97 = YELLOW BOX
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $20BD, $02, $02, $97			; $97 = YELLOW BOX
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $2301, $02, $02, $97			; $97= YELLOW BOX
	FILL_RECT_AT_PPUADDR[addr_height_width_tile] $231D, $02, $02, $97			; $97= YELLOW BOX
	DRAW_LINE_ACROSS_AT_PPUADDR[addr_width_tile] $22C0, $20, $73				; $73= (THICK LINE)
	DRAW_LINE_ACROSS_AT_PPUADDR[addr_width_tile] $2345, $16, $5F				; $73= (SMALL THIN LINE)
	SET_BG_SCRIPT_PPU_ADDR[addr] $20A4
	.DB      "YELLOW FLAG!"				;
	SET_BG_SCRIPT_PPU_ADDR_AND_DATA[addr_data] $23F0, DEFAULT_BG_ATTR_TABLE_VALUES		; ATTRIBUTE TABLE VALUES VARIOUS 1   
	RETURN_FROM_BG_SUBSCRIPT[]					 

OFFSIDE_SCENE_SCRIPT:							; 0X6A OFFSIDE
	DO_SCENE_SUBROUTINE[] DRAW_YELLOW_FLAG_SCRIPT
	DO_SCENE_SUBROUTINE[] DRAW_PLAYER_PORT_BG_FOR_PENALTY_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2309
	.DB      "OFFSIDE"				;
	JUMP_TO_SCENE[scene_addr] PLAY_PENALTY_SONG_FLASH_PAL_SCRIPT

_F}_FALSE_START_AND_OFFSIDES_SCENE_SCRIPTS

_F{_NFC_CHAMPION_SCENE_SCRIPT

NFC_CHAMPION_SCENE_SCRIPT:							; 0X6B NFC CHAMPION_
	DO_SCENE_SUBROUTINE[] DO_CONF_CHAMP_BG_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2244
	.DB      "NFC CHAMPION"				;
	JUMP_TO_SCENE[scene_addr] TEAM_CITY_NAME_CONF_CHAMP_SONG_SCRIPT
	
_F}_NFC_CHAMPION_SCENE_SCRIPT	
UNUSED4_SCENE_SCRIPT:							; UNUSED
	.DB $FF		

_F{_PROGRAMMERS_CREDITS_SCENE_SCRIPT
CREDITS_SCENE_SCRIPT:							; 0X6E CREDITS
	RESET_X_Y_SCROLL_TO_ZERO[]
	SET_MIRRORING_TO_HORIZONTAL[]
	DRAW_BACKGROUND[bg_Id] $2A					; (BOTTOM OF STADIUM LARGE CROWD  WITH COPS AND CHEERLEADERS) 
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $20, $1A, $5A		
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	DRAW_ONE_METASPRITE[spriteID] $85					;(PLAYER HAND IN AIR)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $22, $41					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $00, $00					; CHANGE SCROLL SPEED IRQ0 (SCROLL SPEED) = STOP SCROLL
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	SET_BG_SCRIPT_PPU_ADDR[addr] $2269
	.DB      $6B, " PROGRAMMER ", $6B		;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CB
	.DB      "A.SHIMOJI"				;
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $1B					; (HORIZONTAL LINES FOR QB)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	DRAW_ONE_METASPRITE[spriteID] $70					; DRAW SPRITE( QB THROWING SCROLL FROM OFFSCREEN)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $35, $4C					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $78, $18, $30		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $20, $40				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $30, $78				; 
	SET_IRQ_SCROLL[irq_counter_speed] $3, $30, $00				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $00, $00					; CHANGE SCROLL SPEED IRQ0 (SCROLL SPEED) = STOP SCROLL
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $02, $00					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $2667
	.DB      $6B, " VISUAL DIRECTOR ", $6B	;
	SET_BG_SCRIPT_PPU_ADDR[addr] $26CD
	.DB      "K.UEDA"					;
	CLEAR_2000_NAMETABLE[]					
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $30					; (STADIUM) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	DRAW_ONE_METASPRITE[spriteID] $C1					;(LT WAVE)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $48					
	SET_BG_CHR_BANKS[table0_table1] $6A, $68					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	SET_SCROLLING[yspd_xspd_time] $00, $08, $04				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $64					; WAIT 100 FRAMES = 1.66 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $2265
	.DB      $6B, " ASSISTANT DIRECTOR ", $6B
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CC
	.DB      "T.KODAMA"				;
	CLEAR_OFFSCREEN_NAMETABLE_BASED_ON_MIRRORING[]					; CLEAR OFFSCREEN NAMETABLE ($2400 OR $2800)
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $36					; (TOP OF STADIUM WITH CLOUDS) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	DRAW_TWO_METASPRITES[spID1_sprID2]  $73, $74				; DRAW SPRITES (BALL, PLAYER CATCHING BALL)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $35, $4C					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $18, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $28, $40				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $60, $00				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	DO_SCENE_SUBROUTINE[] CHANGE_IRQ0_IRQ1_SCROLL_SPEED_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_END_CREDITS_SCRIPT
	DO_SCENE_SUBROUTINE[] FLASH_BG_PAL_END_CREDITS_SCRIPT
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1F					; WAIT 30 FRAMES = ~0.5 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $00, $00					; CHANGE SCROLL SPEED IRQ0 (SCROLL SPEED) = STOP SCROLL
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $2666
	.DB      $6B, " GRAPHIC DESIGNER ", $6B	
	SET_BG_SCRIPT_PPU_ADDR[addr] $26CC
	.DB      "K.TOMITA"				;
	MOVE_DOWN_2_ROWS[]
	.DB      "Y.IWAKAI"				;
	CLEAR_2000_NAMETABLE[]					; CLEAR $2000 NAMETABLE		
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $2D					; (PLAYERS FOR GATORADE 1) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	DRAW_ONE_METASPRITE[spriteID] $84					;(GATORADE CONTAINER+ LIQUID)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $31, $40					
	SET_BG_CHR_BANKS[table0_table1] $58, $5A					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	CLEAR_OFFSCREEN_NAMETABLE_BASED_ON_MIRRORING[]					; CLEAR OFFSCREEN NAMETABLE ($2400 OR $2800)
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $38					; (GATORADE BATH) OFFSCREEN 
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $36					; (TOP OF STADIUM WITH CLOUDS) OFFSCREEN 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $28					; WAIT 40 FRAMES = 0.66 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $2666
	.DB      $6B, " GRAPHIC DESIGNER ", $6B 	;
	SET_BG_SCRIPT_PPU_ADDR[addr] $26CA
	.DB      "Y.MIZUSHIMA"				;
	MOVE_DOWN_2_ROWS[]
	.DB      " M.MIZUTA"				;
	CLEAR_2000_NAMETABLE[]					; CLEAR $2000 NAMETABLE
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					; DRAW SOMETHING STAIDUM 2 OFFSCREEN 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	DRAW_ONE_METASPRITE[spriteID] $0E					; DRAW SPRITE( SACK ANIMATION)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $35, $4C					
	SET_BG_CHR_BANKS[table0_table1] $6A, $68					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	SET_BG_SCRIPT_PPU_ADDR[addr] $2267
	.DB      $6B, " MUSIC COMPOSER ", $6B	;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CB
	.DB      "K.YAMAGISHI"				;
	MOVE_DOWN_2_ROWS[]
	.DB      "  R.NITTA"				;
	CLEAR_OFFSCREEN_NAMETABLE_BASED_ON_MIRRORING[]					; CLEAR OFFSCREEN NAMETABLE ($2400 OR $2800)
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $34					; (PODIUM SCENE) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $B8, $B9, $BA			; (PLAYER FACE, MICS LEFT, MICS BOTTOM)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $33, $46					
	SET_BG_CHR_BANKS[table0_table1] $6A, $60					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	SET_BG_SCRIPT_PPU_ADDR[addr] $2669
	.DB      $6B, " ASSISTANT ", $6B		;
	SET_BG_SCRIPT_PPU_ADDR[addr] $26C4
	.DB      "K.WATANABE    M.IKURUMI"		;
	SET_BG_SCRIPT_PPU_ADDR[addr] $2712
	.DB      "K.MASUGI"				; 
	CLEAR_2000_NAMETABLE[]					; CLEAR $2000 NAMETABLE
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $31					; (STADIUM 2) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	DRAW_TWO_METASPRITES[spID1_sprID2]  $29, $71				; DRAW 2 SPRITES (BALL SPIKE,PLAYER RUNNING HAND IN AIR)
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $35, $4C					
	SET_BG_CHR_BANKS[table0_table1] $6A, $68					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	SET_SCROLLING[yspd_xspd_time] $00, $F8, $07				; SET SCROLLING (Y SCROLL SPEED, X SCROLL SPEED, TIME)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $8C					; WAIT 140 FRAMES = 2.4 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $2265
	.DB $6B, " EDITORIAL DESIGNER ", $6B	;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CC
	.DB      "K.TORAYA"				;
	MOVE_DOWN_2_ROWS[]
	.DB      "T.MIYAMAE"				;
	CLEAR_OFFSCREEN_NAMETABLE_BASED_ON_MIRRORING[]					; CLEAR OFFSCREEN NAMETABLE ($2400 OR $2800)
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $0E					; (BLUE SKY) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	DRAW_ONE_METASPRITE[spriteID] $7F					
	START_CHANGING_PALLETE[pallete_id] $05					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	DRAW_BACKGROUND[bg_Id] $30					; (STADIUM)
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $70, $6A, $68		
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $01, $88, $00, $18, $1A		
	DRAW_ONE_METASPRITE[spriteID] $83					;(PLAYER MOVE ACROSS SCREEN FAST HOLDING BALL)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $52					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	SET_SPR_PALLETE_FULLY_FADED_IN[SprPal] $37					; SET SPR PAL AND SET TO FULLY FADED IN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $15					; WAIT 21 FRAMES = 0.35 SEC
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $00, $00					; CHANGE SCROLL SPEED IRQ0 (SCROLL SPEED) = STOP SCROLL
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $35, $4C					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	SET_BG_SCRIPT_PPU_ADDR[addr] $2667
	.DB      $6B, " SPECIAL THANKS ", $6B	;
	SET_BG_SCRIPT_PPU_ADDR[addr] $26CC
	.DB      "H.MIYATA"				;
	MOVE_DOWN_2_ROWS[]
	.DB      " NOSUKE"				;
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $00					; (STADIUM PLUS SKY) OFFSCREEN
	WAIT_NUMBER_OF_FRAMES_BG[frames] $96					; WAIT 150 FRAMES = 2.5 SEC
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $C7, $C8, $C9			; (BOMJACK TOP WAVE, BOMJACK RIGHT WAVE, BOMJACK LEFT WAVE) 
	SWAP_SCROLL_NAMETABLE_ONCE_SPR_DRAW_IS_DONE[]					
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $00, $4A					
	SET_IRQ_SCROLL_AND_CHR[irq_counter_speed_ch0bk_ch1bk] $00, $00, $F6, $18, $26		
	SET_IRQ_SCROLL[irq_counter_speed] $01, $20, $FA				; 
	SET_IRQ_SCROLL[irq_counter_speed] $02, $16, $00				; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	SET_BG_SCRIPT_PPU_ADDR[addr] $226A
	.DB      $6B, " DIRECTOR ", $6B		;
	SET_BG_SCRIPT_PPU_ADDR[addr] $22CC
	.DB      "S.TOMIE" 				;
	SET_BG_SCRIPT_PPU_ADDR[addr] $230C
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						 
    CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					; CLEAR ALL NAMETABLES AND SET SPRITES OFFSCREEN
	CLEAR_IRQS_END_PAL_UPDATE[]					; CLEAR IRQS AND END PAL UPDATE
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	SET_BG_CHR_BANKS[table0_table1] $18, $1A					; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	SET_BG_SCRIPT_PPU_ADDR[addr] $21AA
	.DB      "PRESENTED BY"				;
	DRAW_ONE_METASPRITE[spriteID] $7F					;(CLEAR SPRITES)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $1E					; WAIT 30 FRAMES = 0.5 SEC 
	SET_AND_FADE_IN_BG_PALLETE[BgPal] $00					; SET AND FADE IN BG PALLETE (BG PAL INDEX)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_PAL_UPDATE_AND_FADE_OUT_BG_SPR_PAL[]						 
    CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					; CLEAR ALL NAMETABLES AND SET SPRITES OFFSCREEN
    DRAW_BACKGROUND[bg_Id] $25					; (TECMO PRESENTS) 
	DRAW_ONE_METASPRITE[spriteID] $C2					;(TECMO BUNNY)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	SET_AND_FADE_IN_BG_AND_SPR_PALLETE[BgPal_SprPal] $20, $4A					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	START_CHANGING_PALLETE[pallete_id] $09					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $FF					; WAIT 255 FRAMES = 4.25 SEC
	.DB $FA, $10					; CHECK FOR A OR B TO EXIT IF PLAY ALL GAMES FLAG OFF
	END_OF_SCRIPT_OR_DATA[]		
_F}_PROGRAMMERS_CREDITS_SCENE_SCRIPT

_F{_SOUND_MODE_SCENE_SCRIPT

SOUND_MODE_SCENE_SCRIPT:							; 0X6F SOUND_MODE
	DO_SCENE_SUBROUTINE[] DRAW_TSB_LARGE_START_SCREEN_SCRIPT
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $90, $18 , $20			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	SET_BG_SCRIPT_PPU_ADDR[addr] $2247
	.DB $1B, $1C, $19, " SOUND MODE ", $19, $1C, $1B
	SET_BG_SCRIPT_PPU_ADDR[addr] $22E9
	.DB 	"A  SOUND START"				;
	MOVE_DOWN_2_ROWS[]
	.DB 	"B  SOUND OFF"				;
	DRAW_TILE_AT_PPUADDR[addr_tile] $22A7, $2C					; TOP LEFT ROUND EDGE TILE
	DRAW_TILE_AT_PPUADDR[addr_tile] $22B8, $89					; TOP RIGHT ROUND EDGE TILE
	DRAW_TILE_AT_PPUADDR[addr_tile] $2347, $8A					; BOT LEFT ROUND EDGE TILE
	DRAW_TILE_AT_PPUADDR[addr_tile] $2358, $8B					; BOT LEFT ROUND EDGE TILE
	DRAW_LINE_DOWN_AT_PPUADDR[addr_height_tile] $22C7, $04, $8C
	DRAW_LINE_DOWN_AT_PPUADDR[addr_height_tile] $22D8, $04, $8E
	DRAW_LINE_ACROSS_AT_PPUADDR[addr_width_tile] $22A8, $10, $8D
	DRAW_LINE_ACROSS_AT_PPUADDR[addr_width_tile] $2348, $10, $8F
	
	SET_BG_SCRIPT_PPU_ADDR[addr] $22AD
	.DB      " NO. 1 "				;
	DRAW_THREE_METASPRITES[spID1_sprID2_sprID3] $BE, $BF, $C0			; (STARS 1, STARS2, STARS 3)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $2B, $3F					
	START_CHANGING_PALLETE[pallete_id] $06					
	JUMP_TO_SCENE[scene_addr] START_SCREEN_LOOP_SCRIPT
	
_F}_SOUND_MODE_SCENE_SCRIPT	

_F{_P1_FIRST_DOWN_CHAINS_SCENE_SCRIPT

P1_FIRST_DOWN_CHAINS_SCENE_SCRIPT 							; 0X70 P1_CHAINS_FIRST_DOWN_SCREEN
	DO_SCENE_SUBROUTINE[] DRAW_CHAIN_MEASURE_SCRIPT
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $FC					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	DO_SCENE_SUBROUTINE[] DRAW_BOT_STADIUM_CHAIN_MEASURE_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2266
	.DB      "FIRST DOWN!"				;	
	DRAW_ONE_METASPRITE[spriteID] $B2					;(REF POINT FORWARD P1)			
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					
	PLAY_SOUND_BG[Sound] $26					; PLAY P1 FIRST DOWN MUSIC
	START_CHANGING_PALLETE[pallete_id] $04					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_P1_FIRST_DOWN_CHAINS_SCENE_SCRIP	

_F{_DRAW_CHAIN_MEASURE_WITH_DOWN_SCRIPTS

DRAW_CHAIN_MEASURE_SCRIPT:							; DRAW CHAIN MEASURE WITH SOUND
	RESET_X_Y_SCROLL_TO_ZERO[]						; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	SET_MIRRORING_TO_VERTICAL[]					
	DRAW_BACKGROUND_OFFSCREEN[bg_Id] $0C					; REF HOLDING FD CHAIN MARKER P1 SIDE OFFSCREEN 
	DRAW_ONE_METASPRITE[spriteID] $09					;(PLAYER LOOKING AT BALL, BALL, AND REFERREE CHAIN MEASURE)
	SET_IRQ_SCROLL[irq_counter_speed] $01, $20, $00				; = STOP SCROLL 
	SET_IRQ_XSCROLL_NAMETABLE[irq_xscroll_curnametable] $00, $00, $00				;  LEFT EDGE
	SET_IRQ_XSCROLL_NAMETABLE[irq_xscroll_curnametable] $01, $00, $01				; LEFT EDGE OFFSCREEN
	GET_OFFENSE_PLAYER_SPR_PALLETE_AND_FADE_IN[bgPal], $8A					; P1 OR P2 SPR PALLETE, SET BG PAL AND FADE IN (BG PAL)
	PLAY_SOUND_BG[Sound] $2E					; (MEASURE CHAINS SONG)
	SET_IRQ_VERTICAL_SCROLL_SPEEED_AND_STOP[yspeed_ystop] $10, $60				; SCROLL IRQ1 (Y SCROLL SPEED, SCROLL STOP)
	WAIT_NUMBER_OF_FRAMES_BG[frames] $08					; WAIT 8 FRAMES = 0.13 SEC
	PLAY_SOUND_BG[Sound] $02					; (FADE VOLUME)
	RETURN_FROM_BG_SUBSCRIPT[]					 
	




DRAW_BOT_STADIUM_CHAIN_MEASURE_SCRIPT:							; WAIT ONE SECOND THEN DRAW BOTTOM OF STADIUM + CROWD
	WAIT_NUMBER_OF_FRAMES_BG[frames] $3C					; WAIT 60 FRAMES = 1 SEC 
	FADE_OUT_BG_AND_SPR_PALLETE[]					; SET BG AND SPR PAL TO FULLY FADED OUT
	CLEAR_NAMETABLES_SET_SPRITES_OFFSCREEN_BG[]					
	RESET_X_Y_SCROLL_AND_NAMETABLE_TO_ZERO[] 						
	DRAW_BACKGROUND[bg_Id] $29					; (BOTTOM OF STADIUM LARGE CROWD SHOT, SOME FIELD) 
	SET_IRQ_AND_CHR[irq_counter_ch0bk_ch1bk] $01, $88, $18, $1A			; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)	
	SET_SPRITE_SIZE_8_by_16[]					; SET TEXT SIZE TO 16 X 16
	RETURN_FROM_BG_SUBSCRIPT[]					

								; CAN COMBINE REPETITIVE COMMANDS
SECOND_DOWN_CHAINS_SCENE_SCRIPT:							; 0X71 CHAINS_SECOND_DOWN
	DO_SCENE_SUBROUTINE[] DRAW_CHAIN_MEASURE_SCRIPT
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $FC					 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	DO_SCENE_SUBROUTINE[] DRAW_BOT_STADIUM_CHAIN_MEASURE_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2264
	.DB      "SECOND DOWN!"				;
	DRAW_ONE_METASPRITE[spriteID] $B5					; DRAW SRRITE (REF 2 FINGERS)
	JUMP_TO_SCENE[scene_addr] FADE_IN_PAL_STOP_SONG_CHAIN_MEASURE_SCRIPT

THIRD_DOWN_CHAINS_SCENE_SCRIPT:							; 0X72 CHAINS_THIRD_DOWN			
	DO_SCENE_SUBROUTINE[] DRAW_CHAIN_MEASURE_SCRIPT
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $FC					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	DO_SCENE_SUBROUTINE[] DRAW_BOT_STADIUM_CHAIN_MEASURE_SCRIPT		
	SET_BG_SCRIPT_PPU_ADDR[addr] $2266
	.DB      "THIRD DOWN!"				;
	DRAW_ONE_METASPRITE[spriteID] $A0					; DRAW SRRITE (REF 3 FINGERS)				
	JUMP_TO_SCENE[scene_addr] FADE_IN_PAL_STOP_SONG_CHAIN_MEASURE_SCRIPT		

FOURTH_DOWN_CHAINS_SCENE_SCRIPT:							; 0X73 CHAINS_FOURTH_DOWN
	DO_SCENE_SUBROUTINE[] DRAW_CHAIN_MEASURE_SCRIPT
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $FC					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	DO_SCENE_SUBROUTINE[] DRAW_BOT_STADIUM_CHAIN_MEASURE_SCRIPT	
	SET_BG_SCRIPT_PPU_ADDR[addr] $2264
	.DB      "FOURTH DOWN!"				;
	DRAW_ONE_METASPRITE[spriteID] $A1					; DRAW SRRITE (REF 4 FINGERS)	
	JUMP_TO_SCENE[scene_addr] FADE_IN_PAL_STOP_SONG_CHAIN_MEASURE_SCRIPT

FADE_IN_PAL_STOP_SONG_CHAIN_MEASURE_SCRIPT:							; FADE IN AND STOP SONG THEN WAIT 1 SECOND
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	PLAY_SOUND_BG[Sound] $01					; (STOP SONG)
	START_CHANGING_PALLETE[pallete_id] $04					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $06					; WAIT 6 FRAMES = 0.1 SEC WHY TWO COMMANDS
	WAIT_NUMBER_OF_FRAMES_BG[frames] $36					; WAIT 54 FRAMES = 0.9 SEC
	END_OF_SCRIPT_OR_DATA[]						

CHANGE_SIDE_CHAINS_SCENE_SCRIPT:							; 0X74 CHAINS_CHANGE SIDE 
	DO_SCENE_SUBROUTINE[] DRAW_CHAIN_MEASURE_SCRIPT
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $FC					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $50					; WAIT 80 FRAMES = 1.33 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	DO_SCENE_SUBROUTINE[] DRAW_BOT_STADIUM_CHAIN_MEASURE_SCRIPT
	SET_BG_SCRIPT_PPU_ADDR[addr] $2265
	.DB      "CHANGE SIDE"				;
	DRAW_ONE_METASPRITE[spriteID] $B3					;(REF NO GOOD SIGNAL)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					; SET BG AND SPR PAL INDEX AND SET TO FULLY FADED IN
	PLAY_SOUND_BG[Sound] $25					; (CHANGE SIDE MUSIC)
	START_CHANGING_PALLETE[pallete_id] $04					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $B4					; WAIT 180 FRAMES = 3 SEC 
	END_OF_SCRIPT_OR_DATA[]						

P2_FIRST_DOWN_CHAINS_SCENE_SCRIPT:							; 0X75 P2 CHAINS_FIRST DOWN 
	DO_SCENE_SUBROUTINE[] DRAW_CHAIN_MEASURE_SCRIPT
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $FC					
	WAIT_NUMBER_OF_FRAMES_BG[frames] $14					; WAIT 20 FRAMES = 0.3 SEC 
	CHANGE_IRQ_SCROLL_SPEEED[irq_speed] $01, $00					; STOP SCROLL
	DO_SCENE_SUBROUTINE[] DRAW_BOT_STADIUM_CHAIN_MEASURE_SCRIPT			; DO->WAIT ONE SECOND THEN DRAW BOTTOM OF STADIUM + CROWD
	SET_BG_SCRIPT_PPU_ADDR[addr] $2266
	.DB      "FIRST DOWN!"				; 
	DRAW_ONE_METASPRITE[spriteID] $D5					;(REF P2 FIRST DOWN ARM POINTING)
	SET_BG_AND_SPR_PALLETE_FULLY_FADED_IN[BgPal_SprPal] $32, $43					; 
	PLAY_SOUND_BG[Sound] $27					;(P2 FIRST DOWN SONG) 
	START_CHANGING_PALLETE[pallete_id] $04					; 
	WAIT_NUMBER_OF_FRAMES_BG[frames] $78					; WAIT 120 FRAMES = 2 SEC
	END_OF_SCRIPT_OR_DATA[]						
	
_F}_DRAW_CHAIN_MEASURE_WITH_DOWN_SCRIPTS		
 
UNUSED5_SCENE_SCRIPT:
	.DB $FF						; END
	
.PAD $C000, $FF	
