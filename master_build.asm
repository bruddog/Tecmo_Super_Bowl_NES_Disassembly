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
.INCSRC Bank4_def_spec_play_pointers_data.asm						; 
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


