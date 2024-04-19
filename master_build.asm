;;;; MASTER BUILD ;;;;;;;;;;;;;

_F{_CONSTANTS

;;;            CONSTANTS             ;;;;;;;;;;;;;;;;;;;;;
.IGNORENL
.INCSRC constants_variables/bank_ids.asm
.INCSRC constants_variables/banner_ids.asm
.INCSRC constants_variables/chr_bank_names.asm
.INCSRC constants_variables/color_ids.asm
.INCSRC constants_variables/constants.asm
.INCSRC constants_variables/cutscene_sequence_ids.asm
.INCSRC constants_variables/def_starter_sprite_locations.asm
.INCSRC constants_variables/field_locations.asm
.INCSRC constants_variables/formation_ids.asm
.INCSRC constants_variables/menu_choices.asm
.INCSRC constants_variables/mmc3_registers.asm
.INCSRC constants_variables/nes_registers.asm
.INCSRC constants_variables/pallete_indexes.asm
.INCSRC constants_variables/coin_toss_ppu_locations.asm
.INCSRC constants_variables/end_of_game_stats_ppu_locations.asm
.INCSRC constants_variables/leader_screen_ppu_locations.asm
.INCSRC constants_variables/player_data_ppu_locations.asm
.INCSRC constants_variables/playoff_bracket_ppu_locations.asm
.INCSRC constants_variables/ppu_locations.asm
.INCSRC constants_variables/roster_positions_starter_ids.asm
.INCSRC constants_variables/scene_ids.asm
.INCSRC constants_variables/skill_indexes.asm
.INCSRC constants_variables/sprite_script_ids.asm
.INCSRC constants_variables/sound_ids.asm
.INCSRC constants_variables/stat_indexes.asm
.INCSRC constants_variables/team_ids_league_structure.asm
.INCSRC constants_variables/tile_id_constants.asm
.ENDINL
_F}_CONSTANTS

_F{_MEMORY


;;;   		RAM VARIABLES            ;;;;;;;;;;;;;;;;;;;;;
.INCSRC constants_variables/zero_page_variables.asm
.INCSRC constants_variables/ram_variables.asm
;;;   		SRAM VARIABLES            ;;;;;;;;;;;;;;;;;;;;;
.INCSRC constants_variables/sram_variables.asm

_F}_MEMORY

_F{_MACROS


;;;  MACROS  ;;;;;;;;;;;;;;;;;;;;;
.IGNORENL
.INCSRC macros/6502_macros.asm
.INCSRC macros/check_status_macros.asm
.INCSRC macros/field_scroll_limit_macros.asm
.INCSRC macros/joypad_macros.asm
.INCSRC macros/math_macros.asm
.INCSRC macros/memory_save_load_clear_macros.asm
.INCSRC macros/mmc3_macros.asm
.INCSRC macros/nes_macros.asm
.INCSRC macros/play_call_macros.asm
.INCSRC macros/player_ram_macros.asm
.INCSRC macros/set_compare_player_ball_to_yardlines_macros.asm
.INCSRC macros/set_init_status_macros.asm
.INCSRC macros/structure_macros.asm
.INCSRC macros/tecmo_macros.asm
.ENDINL
_F}_MACROS

_F{_GAME_DATA

;;;  GAME DATA ;;;;;;;;;;;;;;;;;;;;;
.INCSRC Bank1_2_team_data.asm										; PLAYER NUMBER NAMES AND ATTRIBUTES

.INCSRC Bank3_formation_metatile_data.asm							; OFFENSIVE FORMATION POINTERs AND BG SCENE METATILES
.INCSRC Bank4_def_spec_play_pointers_data.asm							; 
.INCSRC Bank5_6_off_def_play_data.asm								; SCRIPTS FOR EACH PLAYER FOR OFFENSIVE/ DEFENSIVE PLAYS AND FORMATIONS

.INCSRC Bank7_scene_scripts.asm										; CUTSCENE SCRIPTS
.INCSRC Bank8_scene_scripts.asm										; SEASON STATIC SCREEN SCRIPTS

.INCSRC Bank9_sprite_scripts.asm									; META-SPRITE SCRIPTS		
.INCSRC Bank10_sprite_scripts.asm

.INCSRC Bank11_12_BG_metatile_tiles.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_F}_GAME_DATA

_F{_GAME_CODE_SOME_DATA

.INCSRC Bank12_13_sim_update_stats.asm
.INCSRC Bank14_pal_fall_player_anim.asm
.INCSRC Bank15_faces_playbooks.asm
.INCSRC Bank16_menu_screens_slidebar.asm
.INCSRC Bank17_18_main_game_loop.asm
.INCSRC Bank19_20_on_field_gameplay_loop.asm
.INCSRC Bank20_playcall.asm
.INCSRC Bank21_22_play_commands_on_field_logic.asm
.INCSRC Bank23_draw_field_ball_ani_coll_check.asm
.INCSRC Bank24_draw_script_engine.asm
.INCSRC Bank25_leaders_player_data_pro_bowl_abbrev.asm
.INCSRC Bank26_misc.asm
.INCSRC Bank27_misc.asm
.INCSRC Bank28_sound_engine.asm
.INCSRC Bank29_sound_data.asm
.INCSRC Bank30_sound_data.asm
.INCSRC Bank31_fixed_bank.asm
.INCSRC Bank32_DMC_Samples_reset_vector.asm

_F}_GAME_CODE_SOME_DATA

_F{_GAME_GRAPHICS

.INCBIN "TSB.nes", $40010 , $400										; PLAYER SPRITE RUNNING AND BLOCKING ANIMATION 1
.INCBIN "TSB.nes" , $40410 , $400										; PLAYER SPRITE RUNNING AND BLOCKING ANIMATION 2
.INCBIN "TSB.nes" , $40810 , $400										; PLAYER SPRITE RUNNING AND BLOCKING ANIMATION 3
.INCBIN "TSB.nes" , $40C10 , $400										; PLAYER SPRITE RUNNING AND BLOCKING ANIMATION 4
.INCBIN "TSB.nes" , $41010 , $400										; PLAYER SPRITE RUNNING AND BLOCKING ANIMATION 5
.INCBIN "TSB.nes" , $41410 , $400										; PLAYER SPRITE RUNNING AND BLOCKING ANIMATION 6
.INCBIN "TSB.nes" , $41810 , $400										; VARIOUS PLAYER SPRITE ANIMATIONS
.INCBIN "TSB.nes" , $41C10 , $400
.INCBIN "TSB.nes" , $42010 , $400
.INCBIN "TSB.nes" , $42410 , $400
.INCBIN "TSB.nes" , $42810 , $400
.INCBIN "TSB.nes" , $42C10 , $400
.INCBIN "TSB.nes" , $43010 , $400
.INCBIN "TSB.nes" , $43410 , $400
.INCBIN "TSB.nes" , $43810 , $400

.INCBIN "TSB.nes" , $43C10 , $400										; OFF STARTER SCREEN TILES

.INCBIN "TSB.nes" , $44010 , $2000										; ENDZONE AND CROWD TILES

.INCBIN "TSB.nes" , $46010 , $800										; SMALL FONT AND INDICATORS

.INCBIN "TSB.nes" , $46810 , $800										; LARGE LETTERS AND NFL SHIELD

.INCBIN "TSB.nes" , $47010 , $800										; FIELD AND SHIELD ON FIELD

.INCBIN "TSB.nes" ,$47810 , $800										; PLAY IMAGE TILES
.INCBIN "TSB.nes" ,$48010 , $800										; PLAY SELECT SCREEN TEXT (tiny field/controllers)
.INCBIN "TSB.nes" ,$48810 , $800										; play image tles reversed for p2 side

.INCBIN "TSB.nes" ,$49010 , $800										; NFLPA FOOTBALL INTRO/ PLAYER SUPER BOWL CREDITS
.INCBIN "TSB.nes" ,$49810 , $800										; DOWN MARKER, COIN TOSS STADIUM AND VARIOUS CUTSCENE STADIUM
.INCBIN "TSB.nes" ,$4A010 , $800										; BLOCKED BALL, LAND FROM JUMP PLAYER SPRITES

.INCBIN "TSB.nes" ,$4A810 , $800										; LARGE HELMET SHELLS

.INCBIN "TSB.nes" ,$4B010 , $800										; SIDELINE CHEER 1, SPINNING BALL
.INCBIN "TSB.nes" ,$4B810 , $800										; SIDELINE CHEER 2, KICKER KICKOFF, STAT LABELS, PLAY CHANGE ARROWS 
.INCBIN "TSB.nes" ,$4C010 , $800										; SIDELINE CHEER 3, HANDS CATCH BALL, SCOREBOARD STADIUM
.INCBIN "TSB.nes" ,$4C810 , $800										; SIDELINE CHEER 4, JUMPING PLAYER, COIN TOSS 8X16 SPRITES	
.INCBIN "TSB.nes" ,$4D010 , $800										; SIDELINE CHEER 5, SNAP/CELBRATE/REF/INJURY 8/16 FIELD SPRITES, LT, TECMO BUNNY
.INCBIN "TSB.nes" ,$4D810 , $800										; SIDELINE CHEER 6, PLAYER CATCH SPRITE, PUNTER FOOT		
.INCBIN "TSB.nes" ,$4E010 , $800										; SIDELINE CHEER 7, LARGE QB THROW, DEFENDER SACK STANDING	
.INCBIN "TSB.nes" ,$4E810 , $800										; SIDELINE CHEER 8, LARGE DIVING CATCH, CHAIN MEASURE	
.INCBIN "TSB.nes" ,$4F010 , $800										; SIDELINE CHEER 9, PUNTER DROP BALL, FG OVERHEAD FINAL VIEW
.INCBIN "TSB.nes" ,$4F810 , $800										; SIDELINE CHEER 10, PUNTER KICKING BALL, STADIUM WITH CHEER AND PLAYER VERITCAL INTRO

.INCBIN "TSB.nes" ,$50010 , $800										; OFFENSIVE LINEMAN INTRO, LT INTRO	
.INCBIN "TSB.nes" ,$50810 , $800										; OFFENSIVE LINEMAN INTRO, QB DROPBACK, FLAGS
.INCBIN "TSB.nes" ,$51010 , $800										; LT COMING FOR TACKLE INTRO
.INCBIN "TSB.nes" ,$51810 , $800										; LT OVER PLAYER
.INCBIN "TSB.nes" ,$52010 , $800										; DEFENDER TRYING TO TACKLE BARRY	

.INCBIN "TSB.nes" ,$52810 , $800										; PASSING TD SCENE	
.INCBIN "TSB.nes" ,$53010 , $800										; RUSHING TD SCENE

.INCBIN "TSB.nes" ,$53810 , $800										; CONFERENCE CHAMPIONSHIP
.INCBIN "TSB.nes" ,$54010 , $800										; DIVISION CHAMPIONSHIP
.INCBIN "TSB.nes" ,$54810 , $800										; DIVISION CHAMPIONSHIP / CARRY INJURED PLAYER
.INCBIN "TSB.nes" ,$55010 , $800										; DIVISION CHAMPIONSHIP / CARRY INJURED PLAYER
.INCBIN "TSB.nes" ,$55810 , $800										; SUPERBOWL and DOUBLE JUMP
.INCBIN "TSB.nes" ,$56010 , $800										; SUPERBOWL WIN SCENE
.INCBIN "TSB.nes" ,$56810 , $800										; SUPER BOWL COPS CHEERLEADERS/ BOMBJACK

.INCBIN "TSB.nes" ,$57010 , $800										; REF DOWN SIGNALS ETC
.INCBIN "TSB.nes" ,$57810 , $800										; QB ARM PUMP PASSING TD SCENE
.INCBIN "TSB.nes" ,$58010 , $800										; QB AT PODIUM CREDITS

.INCBIN "TSB.nes" ,$58810 , $800										; PLAYER FACE TILES 
	
.INCBIN "TSB.nes" ,$59010 , $3000										; HALFTIME SCENES 

.INCBIN "TSB.nes" ,$5C010 , $1800										; LARGE HELMET LOGOS	
	
.INCBIN "TSB.nes" ,$5D810 , $800										; LARGE TECMO SUPERBOWL TEXT AT END OF INTRO SCENE
.INCBIN "TSB.nes" ,$5E010 , $800										; STADIUM USED IN VERTICAL SCROLL
	
.INCBIN "TSB.nes" ,$5E810 , $800										; SMALL HELMETS	

.INCBIN "TSB.nes" ,$5F010 , $1000										; HIGH RISE BUILDINGS VERTICAL SCROLL INTRO
	
_F}GAME_GRAPHICS

