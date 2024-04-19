
.BASE $A000
.ORG  $A000 

_F{_MENU_AND_SEASON_TEXT_SCRIPT_POINTER_TABLE
	
.WORD MAIN_MENU_SCREEN_SCRIPT                                                                        ; 0X00 DRAW TECMO SUPER BOWL PLUS MAIN MENU 
.WORD PRESEASON_MENU_SCREEN_SCRIPT                                                                   ; 0X01 DRAW TEAM TYPE SELECTION MENU OFFSCREEN 
.WORD PRESEASON_TEAM_SELECT_SCREEN_SCRIPT                                                              ; 0X02 DRAW PREASEAON TEAM DATA TEAM ABBREV
.WORD SEASON_MENU_SCREEN_SCRIPT                                                                      ; 0X03 DRAW REGULAR SEASON MENU 
.WORD TEAM_CONTROL_SCREEN_SCRIPT                                                                     ; 0X04 DRAW TEAM CONTROL
.WORD SCHEDULE_HEADER_SCREEN_SCRIPT                                                                  ; 0X05 DRAW NFL SCHEDULE HEADER
.WORD SCHEDULE_MENU_SCREEN_SCRIPT                                                                    ; 0X06 DRAW SCHEDULE MENU
.WORD SCHEDULE_FIRST_WARN_SCREEN_SCRIPT                                                              ; 0X07 DRAW FIRST SCHEDULE CLEAR WARNING
.WORD SCHEDULE_FINAL_WARN_SCREEN_SCRIPT                                                              ; 0X08 DRAW 2ND SCHEDULE CLEAR WARNING
.WORD SKIP_WEEK_SCREEN_SCRIPT                                                                        ; 0X09 DRAW SKIP TO WEEK
.WORD STANDINGS_MENU_SCREEN_SCRIPT                                                                   ; 0X0A DRAW STANDINGS MENU ON 2ND SCREEN  
.WORD TEAM_RANKINGS_MENU_SCREEN_SCRIPT                                                               ; 0X0B TEAM RANKINGS OFFSENSE DEFENSE NFL, AFC, NFC MENU
.WORD TEAM_RANKINGS_MENU_SCREEN_SCRIPT                                                               ; 0X0C TEAM RANKINGS OFFSENSE DEFENSE NFL, AFC, NFC MENU
.WORD PLAYOFF_BRACKET_IN_SEASON_SCREEN_SCRIPT                                                        ; 0X0D PLAYOFF BRACKET WITH JUST DIVISOIN CHAMP WILD CARD NAMES
.WORD PLAYOFF_BRACKET_IN_SEASON_SCREEN_SCRIPT                                                        ; 0X0E SAME
.WORD PLAYOFF_BRACKET_IN_SEASON_SCREEN_SCRIPT                                                        ; 0X0F SAME
.WORD PLAYOFF_BRACKET_IN_SEASON_SCREEN_SCRIPT                                                        ; 0X10 SAME 
.WORD PLAYOFF_BRACKET_PLAYOFFS_SCREEN_SCRIPT                                                         ; 0X11 PLAYOFF BRACKET WITH TEAM NAME
.WORD PRO_BOWL_MENU_SCREEN_SCRIPT                                                                    ; 0X12 TEAM TYPE SELECTION MENU OFFSCREEN
.WORD PRO_BOWL_MENU_SCREEN_SCRIPT                                                                    ; 0X13 TEAM TYPE SELECTION MENU OFFSCREEN
.WORD PRO_BOWL_MENU_SCREEN_SCRIPT                                                                    ; 0X14 TEAM TYPE SELECTION MENU OFFSCREEN
.WORD PRO_BOWL_MENU_SCREEN_SCRIPT                                                                    ; 0X15 TEAM TYPE SELECTION MENU OFFSCREEN
.WORD PRO_BOWL_MENU_SCREEN_SCRIPT                                                                    ; 0X16 TEAM TYPE SELECTION MENU OFFSCREEN 
.WORD PRO_BOWL_MENU_SCREEN_SCRIPT                                                                    ; 0X17 TEAM TYPE SELECTION MENU OFFSCREEN
.WORD PRO_BOWL_CHOICE_SCREEN_SCRIPT                                                                  ; 0X18 AFC/NFC CHOICE 
.WORD TEAM_DATA_SCREEN_SCRIPT                                                                        ; 0X19 TEAM DATA
.WORD ROSTER_SCREEN_SCRIPT                                                                           ; 0X1A ROSTER SCREEN
.WORD DEFENSIVE_STARTERS_SCREEN_SCRIPT                                                               ; 0X1B DEFENSIVE STARTERS
.WORD DEFENSIVE_STARTERS_SCREEN_SCRIPT                                                               ; 0X1C DEFENSIVE STARTERS
.WORD DEFENSIVE_STARTERS_SCREEN_SCRIPT                                                               ; 0X1D DEFENSIVE STARTERS
.WORD PLAY_BOOK_SCREEN_SCRIPT                                                                        ; 0X1E PLAYBOOK SCREEN 
.WORD RUN_PLAY_BOOK_CHANGE_SCREEN_SCRIPT                                                             ; 0X1F SCROLLING PLAYBOOK BACKGROUND RUN 
.WORD PASS_PLAY_BOOK_CHANGE_SCREEN_SCRIPT                                                            ; 0X20 SCROLLING PLAYBOOK BACKGROUND PASS
.WORD PRO_BOWL_TEAM_DATA_SCREEN_SCRIPT                                                               ; 0X21 PRO BOWL MENU SCREEN
.WORD REDRAW_PROBOWL_MENU_SCREEN_SCRIPT                                                              ; 0X22 PRO BOWL HEADER 
.WORD PROBOWL_CHANGE_PLAYER_SCREEN_SCRIPT                                                            ; 0X23 PRO BOWL CHANGE PLAYER
.WORD QB_DATA_SCREEN_SCRIPT                                                                          ; 0X24 QB DATA SCREEN 
.WORD SKILL_PLAYER_DATA_SCREEN_SCRIPT                                                                ; 0X25 SKILL PLAYER DATA SCREEN
.WORD OFF_LINE_DATA_SCREEN_SCRIPT                                                                    ; 0X26 OL PLAYER DATA SCREEN
.WORD DEFENDER_DATA_SCREEN_SCRIPT                                                                    ; 0X27 DEFENDER PLAYER DATA SCREEN
.WORD KICKER_DATA_SCREEN_SCRIPT                                                                      ; 0X28 KICKER PLAYER DATA SCREEN
.WORD PUNTER_DATA_SCREEN_SCRIPT                                                                      ; 0X29 PUNTER PLAYER DATA SCREEN
.WORD AFC_EAST_TEXT_SCREEN_SCRIPT                                                                    ; 0X2A AFC EASTERN TEXT
.WORD AFC_CENTRAL_TEXT_SCREEN_SCRIPT                                                                 ; 0X2B AFC CENTRAL TEXT
.WORD AFC_WEST_TEXT_SCREEN_SCRIPT                                                                    ; 0X2C AFC WESTERN TEXT
.WORD NFC_EAST_TEXT_SCREEN_SCRIPT                                                                    ; 0X2D NFC EASTERN TEXT
.WORD NFC_CENTRAL_TEXT_SCREEN_SCRIPT                                                                 ; 0X2E NFC CENTRAL TEXT
.WORD NFC_WEST_TEXT_SCREEN_SCRIPT                                                                    ; 0X2F NFC WESTERN TEXT
.WORD DRAW_FOUR_TEAM_STANDING_SCREEN_SCRIPT                                                          ; 0X30 FOUR DIVISION STANDINGS SCREEN
.WORD DRAW_FIVE_TEAM_STANDING_SCREEN_SCRIPT                                                          ; 0x31 FIVE DIVISION STANDINGS SCREEN        
.WORD OFF_STARTER_TWO_WR_SCREEN_SCRIPT                                                               ; 0x32 OFF_STARTERS_2WR_SCREEN       
.WORD OFF_STARTER_FOUR_WR_SCREEN_SCRIPT                                                              ; 0x33 OFF_STARTERS_4WR_SCREEN              
.WORD OFF_STARTER_THREE_WR_SCREEN_SCRIPT                                                             ; 0x34 OFF_STARTERS_3WR_SCREEN       
.WORD PLAYER_CHANGE_TWO_WR_SCREEN_SCRIPT                                                             ; 0x35 PLAYER_CHANGE_2WR       
.WORD PLAYER_CHANGE_FOUR_WR_SCREEN_SCRIPT                                                            ; 0x36 PLAYER_CHANGE_4WR              
.WORD PLAYER_CHANGE_THREE_WR_SCREEN_SCRIPT                                                           ; 0x37 PLAYER_CHANGE_3WR              
.WORD OFF_STARTERS_RESET_SCREEN_SCRIPT                                                               ; 0x38 OFF_STARTER_RESET       
.WORD NFL_OFF_TEAM_RANKINGS_SCREEN_SCRIPT                                                            ; 0x39 NFL_OFFENSIVE_TEAM_RANKINGS       
.WORD NFL_OFF_TEAM_RANKINGS_SCREEN_SCRIPT                                                            ; 0x3A NFL_OFFENSIVE_TEAM_RANKINGS               
.WORD AFC_OFF_TEAM_RANKINGS_SCREEN_SCRIPT                                                            ; 0x3B AFC_OFFENSIVE_TEAM_RANKINGS               
.WORD NFC_OFF_TEAM_RANKINGS_SCREEN_SCRIPT                                                            ; 0x3C NFC_OFFENSIVE_TEAM_RANKINGS                      
.WORD NFL_DEF_TEAM_RANKINGS_SCREEN_SCRIPT                                                            ; 0x3D NFL_DFFENSIVE_TEAM_RANKINGS                      
.WORD AFC_DEF_TEAM_RANKINGS_SCREEN_SCRIPT                                                            ; 0x3E AFC_DFFENSIVE_TEAM_RANKINGS                             
.WORD NFC_DEF_TEAM_RANKINGS_SCREEN_SCRIPT                                                            ; 0x3F NFC_DFFENSIVE_TEAM_RANKINGS                             
.WORD PLAY_SELECT_SCREEN_SCRIPT                                                                      ; 0x40 PLAY_SELECT_SCREEN       
.WORD P1_OFF_PLAY_CALL_MENU_SCREEN_SCRIPT                                                            ; 0x41 P1_OFF_MENU_SCREEN       
.WORD P1_OFF_TIMEOUT_MENU_SCREEN_SCRIPT                                                              ; 0x42 P1_OFF_TIMEOUT_SCREEN       
.WORD P1_DEF_PLAYCALL_MENU_SCREEN_SCRIPT                                                             ; 0x43 P1_DEF_MENU_SCREEN       
.WORD P1_DEF_PLAYCALL_MENU_SCREEN_SCRIPT                                                             ; 0x44 P1_DEF_MENU_SCREEN              
.WORD P1_DEF_TIMEOUT_MENU_SCREEN_SCRIPT                                                              ; 0x45 P1_DEF_TIMEOUT_SCREEN              
.WORD P2_OFF_PLAYCALL_MENU_SCREEN_SCRIPT                                                             ; 0x46 P2_OFF_MENU_SCREEN              
.WORD P2_OFF_PLAYCALL_MENU_SCREEN_SCRIPT                                                             ; 0x47 P2_OFF_MENU_SCREEN                     
.WORD P2_OFF_TIMEOUT_MENU_SCREEN_SCRIPT                                                              ; 0x48 P2_OFF_TIMEOUT_SCREEN              
.WORD UNUSED_SCREEN_SCRIPT                                                                           ; 0x49        
.WORD P2_DEF_PLAYCALL_MENU_SCREEN_SCRIPT                                                             ; 0x4A P2_DEFENSIVE_MENU_SCREEN       
.WORD P2_DEF_TIMEOUT_MENU_SCREEN_SCRIPT                                                              ; 0x4B P2_DEF_TIMEOUT_SCREEN                     
.WORD OFFENSIVE_MENU_SCRIPT                                                                          ; 0x4C OFFENSIVE_MENU *** DONT THINK USED DIRECTLY FROM ANOTHER LOCATION       
.WORD OFFENSIVE_MENU_SCRIPT                                                                          ; 0x4D OFFENSIVE_MENU *** DONT THINK USED DIRECTLY FROM ANOTHER LOCATION  

_F}_MENU_AND_SEASON_TEXT_SCRIPT_POINTER_TABLE      

_F{_CLOCK_AND_MESSAGE_BAR_SCRIPT_POINTER_TABLE

.WORD CLOCK_BACKGROUND_STATUS_BAR_SCRIPT                                                             ; 0x4E CLOCK_BACKGROUND  

																									; SCROLLING TEXT FROM OFFSCREEN     
.WORD DOWN_AND_DISTANCE_STATUS_BAR_SCRIPT                                                            ; 0x4F DRAW "DOWN AND 10" PLUS MARKERS       
.WORD FUMBLE_STATUS_BAR_SCRIPT                                                                       ; 0x50 DRAW "FUMBLE" SCREEN 2              
.WORD PUNT_KICK_STATUS_BAR_SCRIPT                                                                    ; 0x51 DRAW "PUNT KICK" SCREEN 2       
.WORD FIELD_GOAL_STATUS_BAR_SCRIPT                                                                   ; 0x52 DRAW "FIELD GOAL" SCREEN 2             
.WORD SUCCESSFUL_TRY_STATUS_BAR_SCRIPT                                                               ; 0x53 DRAW "SUCCESSFUL TRY" SCREEN 2       
.WORD NO_GOOD_STATUS_BAR_SCRIPT                                                                      ; 0x54 DRAW "NO GOOD" SCREEN 2              
.WORD FIRST_DOWN_STATUS_BAR_SCRIPT                                                                   ; 0x55 DRAW "***FIRST DOWN***" SCREEN 2       
.WORD P2_TO_P1_SIDE_CHANGE_STATUS_BAR_SCRIPT                                                         ; 0x56 DRAW SIDE CHANGE, NEXT OFFENSE, NEXT DEFENSE  SCREEN 2             
.WORD P1_TO_P2_SIDE_CHANGE_STATUS_BAR_SCRIPT                                                         ; 0x57 DRAW SIDE CHANGE, NEXT DEFENSE, NEXT OFFENSE  SCREEN 2                   
.WORD TOUCHDOWN_LARGE_STATUS_BAR_SCRIPT                                                              ; 0x58 DRAW TOUCHDOWN LARGE LETTERS       
.WORD TRY_FOR_POINT_STATUS_BAR_SCRIPT                                                                ; 0x59 DRAW "TRY FOR POINT" SCREEN 2       
.WORD SAFETY_STATUS_BAR_SCRIPT                                                                       ; 0x5A DRAW SAFETY LARGE LETTERS SCREEN 2                    
.WORD INCOMPLETE_PASS_STATUS_BAR_SCRIPT                                                              ; 0x5B DRAW "INCOMPLETE PASS" SCREEN 2              
.WORD TOUCHBACK_STATUS_BAR_SCRIPT                                                                    ; 0x5C DRAW TOUCHBACK SCREEN 2       
.WORD INTERCEPTION_STATUS_BAR_SCRIPT                                                                 ; 0x5D DRAW "INTERCEPTION" SCREEN 2 
.WORD FIELD_GOAL_STATUS_BAR_SCRIPT_DUPLICATE                                                                   ; 0x5E DRAW "FIELD GOAL" SCREEN 2        
.WORD RECOVER_STATUS_BAR_SCRIPT                                                                      ; 0x5F DRAW "RECOVER" SCREEN 2       
.WORD QB_SACK_STATUS_BAR_SCRIPT                                                                      ; 0x60 DRAW "QB SACK" SCREEN 2              
.WORD KICK_BLOCK_STATUS_BAR_SCRIPT                                                                   ; 0x61 DRAW "KICK BLOCK" SCREEN 2                     
.WORD BLOCKED_PUNT_STATUS_BAR_SCRIPT                                                                 ; 0x62 DRAW "BLOCKED PUNT" SCREEN 2                            
.WORD PASS_BLOCK_STATUS_BAR_SCRIPT                                                                   ; 0x63 DRAW "PASS BLOCK" SCREEN 2                                   
.WORD ONSIDE_KICK_STATUS_BAR_SCRIPT                                                                  ; 0x64 DRAW "ONSIDE KICK" SCREEN 2                                           
.WORD PENALTY_STATUS_BAR_SCRIPT                                                                      ; 0x65 DRAW "PENALTY" SCREEN 2       
.WORD OUT_OF_BOUNDS_STATUS_BAR_SCRIPT                                                                ; 0x66 DRAW "OUT OF BOUNDS" SCREEN       
.WORD CLEAR_THEN_NT1_OUT_OF_BOUNDS_STATUS_BAR_SCRIPT                                                 ; 0x67 DRAW OUT OF BOUNDS CENTERED? 

_F}_CLOCK_AND_MESSAGE_BAR_SCRIPT_POINTER_TABLE

_F{_MATCHUP_AND_STANDINGS_TEXT_SCRIPT_POINTER_TABLE 
 
.WORD PRESEASON_LARGE_LETTERS_SCREEN_SCRIPT                                                          ; 0x68 DRAW "PRESEASON" LARGE LETTERS CENTERED       
.WORD REG_SEASON_LARGE_LETTERS_SCREEN_SCRIPT                                                         ; 0x69 DRAW "REGULAR SEASON" LARGE LETTERS CENTERED              
.WORD PRO_BOWL_LARGE_LETTERS_SCREEN_SCRIPT                                                           ; 0x6A DRAW "PRO BOWL" LARGE LETTERS CENTERED                     
.WORD FINAL_STANDINGS_SCREEN_SCRIPT                                                                  ; 0x6B 
.WORD FINAL_STANDINGS_SCREEN_SCRIPT                                                                  ; 0x6C        
.WORD FINAL_STANDINGS_SCREEN_SCRIPT                                                                  ; 0x6D        
.WORD FINAL_STANDINGS_SCREEN_SCRIPT                                                                  ; 0x6E DRAW OPTIONS MENU SCREEN
.WORD FINAL_STANDINGS_SCREEN_SCRIPT                                                                  ; 0x6F DRAW FINAL STANDINGS   

_F}_MATCHUP_AND_STANDINGS_TEXT_SCRIPT_POINTER_TABLE     

_F{_MAIN_MENU_SCREEN_SCRIPT

MAIN_MENU_SCREEN_SCRIPT:                                                                             ; 0X00 MAIN_MENU_SCREEN
	.DB $C9                                                                                          ; SET X SCROLL LOCATION TO NEXT NAMETABLE
	.DB $F2                                                                                          ; SET GAME STATUS AND PPU MIRRORING = VERTICAL
	.DB $D0, $20, $1A                                                                                ; SET IRQ0 BG CHR BANKS = (TEXT AND MENU BORDERS,LARGE LETTERS)
	.DB $F6                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 16
	.DB $8C, $48                                                                                     ; SET PPU ADDR = $2448
	.DB      "TECMO"                                                                                 ;
	.DB $8C, $84                                                                                     ; SET PPU ADDR = $2484 
	.DB      "SUPER BOWL"                                                                            ;
	.DB $F5                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 08
	.DB $9D, $0D, $05, $0D                                                                           ; SET PPU ADDR = $250D, REPEAT TOP MENU BORDER ACROSS 5 TIMES 
	.DB $95, $24, $09, $0C                                                                           ; SET PPU ADDR = $2524, REPEAT LEFT VERT MENU DORDER DOWN 9 TIMES
	.DB $95, $32, $09, $0E                                                                           ; SET PPU ADDR = $2532, REPEAT RIGTH VERT MENU DORDER DOWN 9 TIMES
	.DB $9E, $45, $0D, $0F                                                                           ; SET PPU ADDR = $2545, REPEAT BOTTOM MENU BORDER ACROSS 13 TIMES
	.DB $AD, $04, $08                                                                                ; SET PPU ADDR = $2504,  DRAW TOP LEFT CURVED BORDER OF MENU
	.DB $AD, $12, $09                                                                                ; SET PPU ADDR = $2512,  DRAW TOP RIGHT CURVED BORDER OF MENU
	.DB $AE, $44, $0A                                                                                ; SET PPU ADDR = $2544,  DRAW BOT LEFT CURVED BORDER OF MENU
	.DB $AE, $52, $0B                                                                                ; SET PPU ADDR = $2552,  DRAW BOT RIGHT CURVED BORDER OF MENU
	.DB $8D, $05                                                                                     ; SET PPU ADDR = $250F
	.DB      "1991 NFL"                                                                              ; 
	.DB $8D, $46                                                                                     ; SET PPU ADDR = $2546
	.DB      "PRESEASON"                                                                             ;
	.DB $8D, $86                                                                                     ; SET PPU ADDR = $2586
	.DB      "SEASON GAME"                                                                           ;
	.DB $8D, $C6                                                                                     ; SET PPU ADDR = $25C6
	.DB      "PRO BOWL"                                                                              ;
	.DB $8E, $06                                                                                     ; SET PPU ADDR = $2606 
	.DB      "TEAM DATA"                                                                             ;
	.DB $87, $C2, <LARGE_TECMO_RED_ATTR_VALUES, >LARGE_TECMO_RED_ATTR_VALUES                         ; SET PPU ADDR = $27C2,DO->SET LARGE "TECMO" TEXT TO RED ATTRIBUTE VALUES 
	.DB $FF                                                                                          ; END

LARGE_TECMO_RED_ATTR_VALUES:                                                                         ; SET MAIN MENU LARGE "TECMO" TEXT TO RED ATTRIBUTE VALUES 
	.DB $03                                                                                         ; LENGTH = 3
	.DB $50, $50, $10                                                                             ; ATTRIB VALUES
	.DB $FF                                                                                       ; END
	
_F}_MAIN_MENU_SCREEN_SCRIPT	

_F{_PRESEASON_MENU_SCREEN_SCRIPT

PRESEASON_MENU_SCREEN_SCRIPT:                                                                        ; 0x01 PRESEASON_MENU_SCREEN
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $85, $45, <PRESEASON_MENU_SCRIPT, >PRESEASON_MENU_SCRIPT                                     ;; SET PPU ADDR = $2545, D0->PRESEASON MENU
	.DB $FF                                                                                          ; END

PRESEASON_MENU_SCRIPT:                                                                               ; PRESEASON MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E9                                                                                          ; MOVE RIGHT 9 TILES
	.DB $84, $0D                                                                                     ; REPEAT 4 TIMES, TOP MENU TILE

GAME_TYPE_MENU_SCRIPT:                                                                               ; GAME TYPE MENU
	.DB $01, $09                                                                                     ; LENGTH = 1, DRAW TOP RIGHT CURVED MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8D, $00                                                                                     ; REPEAT TILE (13 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                  ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0F, $0C, " MAN VS COM  ", $0E                                                               ; LENGTH = 15, LEFT MENU TILE, TEXT, RIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8D, $00                                                                                     ; REPEAT TILE (13 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0F, $0C, " MAN VS MAN  ", $0E                                                               ; LENGTH = 15, LEFT MENU TILE, TEXT, RIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8D, $00                                                                                     ; REPEAT TILE (13 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0F, $0C, " MAN VS COA  ", $0E                                                               ; LENGTH = 15, LEFT MENU TILE, TEXT, RIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8D, $00                                                                                     ; REPEAT TILE (13 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0F, $0C, " COA VS COM  ", $0E                                                               ; LENGTH = 15, LEFT MENU TILE, TEXT, RIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8D, $00                                                                                     ; REPEAT TILE (13 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0F, $0C, " COA VS COA  ", $0E                                                               ; LENGTH = 15, LEFT MENU TILE, TEXT, RIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8D, $00                                                                                     ; REPEAT TILE (13 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0F, $0C, " COM VS COM  ", $0E                                                               ; LENGTH = 15, LEFT MENU TILE, TEXT, RIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8D, $00                                                                                     ; REPEAT TILE (13 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $8D, $0F                                                                                     ; REPEAT TILE (13 TIMES, BOTTOM MENU TILE)
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END
	
_F}_PRESEASON_MENU_SCREEN_SCRIPT	

_F{_PRESEASON_TEAM_SELECT_SCREEN_SCRIPT

PRESEASON_TEAM_SELECT_SCREEN_SCRIPT:                                                                   ; 0x02 DRAW PRESEASON TEAM INITIALS
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $88, $42                                                                                     ; SET PPU ADDR = $2042
	.DB      "PRESEASON"                                                                             ;
	.DB $88, $52                                                                                     ; SET PPU ADDR = $2052
	.DB      "SELECT TEAM"                                                                           ;
	.DB $FD, <AFC_NFC_STARS_SCRIPT, >AFC_NFC_STARS_SCRIPT                                            ; DO DRAW AFC/NFC TEXT WITH STARS 
	.DB $88, $E5                                                                                     ; SET PPU ADDR = $20E5
	.DB $FD, <ALL_AFC_EAST_CITY_ABBREV_SCRIPT, >ALL_AFC_EAST_CITY_ABBREV_SCRIPT                      ; DO DRAW AFC_EAST TEAM INITS
	.DB $88, $EF                                                                                     ; SET PPU ADDR = $20EF
	.DB $FD, <ALL_AFC_CENT_CITY_ABBREV_SCRIPT, >ALL_AFC_CENT_CITY_ABBREV_SCRIPT                      ; DO DRAW AFC_CENT TEAM INITS
	.DB $88, $F9                                                                                     ; SET PPU ADDR = $20F9
	.DB $FD, <ALL_AFC_WEST_CITY_ABBREV_SCRIPT, >ALL_AFC_WEST_CITY_ABBREV_SCRIPT                      ; DO DRAW AFC_WEST TEAM INITS
	.DB $8A, $65                                                                                     ; SET PPU ADDR = $2265
	.DB $FD, <ALL_NFC_EAST_CITY_ABBREV_SCRIPT, >ALL_NFC_EAST_CITY_ABBREV_SCRIPT                                                          ; DO DRAW NFC_EAST TEAM INITS
	.DB $8A, $6F                                                                                     ; SET PPU ADDR = $226F
	.DB $FD, <ALL_NFC_CENT_CITY_ABBREV_SCRIPT, >ALL_NFC_CENT_CITY_ABBREV_SCRIPT                                                          ; DO DRAW NFC_CENT TEAM INITS
	.DB $8A, $79                                                                                     ; SET PPU ADDR = $2279
	.DB $FD, <ALL_NFC_WEST_CITY_ABBREV_SCRIPT, >ALL_NFC_WEST_CITY_ABBREV_SCRIPT                                                          ; DO DRAW NFC_WEST TEAM INITS
	.DB $83, $C4,  <TEAM_DATA_YELLOW_TEXT_ATTR_VALUES, >TEAM_DATA_YELLOW_TEXT_ATTR_VALUES            ; SET PPU ADDR = $23C4 
	.DB $FF                                                                                          ; END 



TEAM_DATA_YELLOW_TEXT_ATTR_VALUES:                                                                   ; SET SELECT TEAM TEXT COLOR TO YELLOW SCREEN ATTRIBS 
	.DB $04, $80, $A0, $A0, $20                                                                      ; SET LENGTH = 4 BYTES, ATTRIBUTE VALUES
	.DB $FF                                                                                          ; END

AFC_NFC_STARS_SCRIPT:                                                                                       ; DRAW AFC/NFC TEXT WITH STARS
	.DB $D0, $18, $7A                                                                                ; SET IRQ0 BG CHR BANKS = (TEXT WITH STARS CHR BANK, MINI HELMET BANK)
	.DB $88, $8A                                                                                     ; SET PPU ADDR = $208A
	.DB $1C, $19, $1C, " AFC ", $1C, $19, $1C                                                        ; STARS, TEXT, STARS 
	.DB $8A, $0A                                                                                     ; SET PPU ADDR = $210A
	.DB $19, $1C, $19, " NFC ", $19, $1C, $19                                                        ; STARS, TEXT, STARS
	.DB $FE                                                                                          ; RETURN

_F}_PRESEASON_TEAM_SELECT_SCREEN_SCRIPT

_F{_SEASON_MENU_SCREEN_SCRIPT

SEASON_MENU_SCREEN_SCRIPT:                                                                           ; 0x03 DRAW REGULAR SEASON MENU
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $F6                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 16
	.DB $88, $42                                                                                     ; SET PPU ADDR = $2042
	.DB      "1991"                                                                                  ;
	.DB $88, $82                                                                                     ; SET PPU ADDR = $2082
	.DB      "REGULAR SEASON"                                                                        ;
	.DB $F5                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 08 
	.DB $99, $15, $07, $0D                                                                           ; REPEAT ACROSS( SET ADDR = 2115, # TIMES =7, TILE = TOP MENU BORDER TILE)
	.DB $9B, $0D, $0F, $0F                                                                           ; REPEAT ACROSS( SET ADDR = 230D, # TIMES =15, TILE = BOTTOM MENU BORDER TILE)
	.DB $91, $2C, $0F, $0C                                                                           ; REPEAT DOWN( SET ADDR = 212C, # TIMES =15, TILE = LEFT MENU BORDER TILE)
	.DB $91, $3C, $0F, $0E                                                                           ; REPEAT DOWN( SET ADDR = 213C, # TIMES =15, TILE = RIGHT MENU BORDER TILE)
	.DB $A9, $0C, $08                                                                                ; DRAW TILE (SET ADDR = 210C, TILE = TOP LEFT CURVED MENU TILE)
	.DB $A9, $1C, $09                                                                                ; DRAW TILE (SET ADDR = 211C, TILE = TOP RIGHT CURVED MENU TILE)
	.DB $AB, $0C, $0A                                                                                ; DRAW TILE (SET ADDR = 230C, TILE = BOT LEFT CURVED MENU TILE)
	.DB $AB, $1C, $0B                                                                                ; DRAW TILE (SET ADDR = 231C, TILE = BOT RIGHT CURVED MENU TILE)
	.DB $89, $0D                                                                                     ; SET PPU ADDR = $210D
	.DB      "1991 NFL"                                                                              ;
	.DB $89, $4E                                                                                     ; SET PPU ADDR = $214E 
	.DB      "TEAM CONTROL"                                                                          ;
	.DB $89, $8E                                                                                     ; SET PPU ADDR = $218E COULD HAVE USED ROW DOWN COMMAND FOR REST OF MENU OPTIONS
	.DB      "SCHEDULE"                                                                              ;
	.DB $89, $CE                                                                                     ; SET PPU ADDR = $21CE
	.DB      "GAME START"                                                                            ;
	.DB $8A, $0E                                                                                     ; SET PPU ADDR = $220E
	.DB      "NFL STANDINGS"                                                                         ;
	.DB $8A, $4E                                                                                     ; SET PPU ADDR = $224E
	.DB      "TEAM RANKINGS"                                                                         ; 
	.DB $8A, $8E                                                                                     ; SET PPU ADDR = $228E
	.DB      "NFL LEADERS"                                                                           ;
	.DB $8A, $CE                                                                                     ; SET PPU ADDR = $22CE
	.DB      "TEAM DATA"                                                                             ;
	.DB $83, $C0, <YEAR_TEXT_TO_RED_ATRR_VALUES, >YEAR_TEXT_TO_RED_ATRR_VALUES                       ; SET PPU ADDR = $23C0, DO->SET 1991 TEXT TO RED ATTRIBS
	.DB $FF                                                                                          ; END

YEAR_TEXT_TO_RED_ATRR_VALUES:                                                                            ; SET 1991 TEXT TO RED ATTRIBS
	.DB $03                                                                                          ; LENGTH = 3 
	.DB $40, $50, $10                                                                             ; ATTRIBUTE VALUES
	.DB $FF                                                                                       ; END   

_F}_SEASON_MENU_SCREEN_SCRIPT

_F{_TEAM_CONTROL_SCREEN_SCRIPT

TEAM_CONTROL_SCREEN_SCRIPT:                                                                          ; 0X04 TEAM_CONTROL
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $88, $45                                                                                     ; SET PPU ADDR = $2045
	.DB      "SELECT CONTROL MODE !"                                                                 ;
	.DB $FD, <AFC_NFC_STARS_SCRIPT, >AFC_NFC_STARS_SCRIPT                                            ; DO-> DRAW AFC/NFC TEXT WITH STARS
	.DB $88, $C5                                                                                     ; SET PPU ADDR = $20C5
	.DB $FD, <ALL_AFC_EAST_CITY_ABBREV_SCRIPT, >ALL_AFC_EAST_CITY_ABBREV_SCRIPT                                                          ; DO-> DRAW AFC EAST TEAMS CITY ABBREV
	.DB $88, $CF                                                                                     ; SET PPU ADDR = $20CF
	.DB $FD, <ALL_AFC_CENT_CITY_ABBREV_SCRIPT, >ALL_AFC_CENT_CITY_ABBREV_SCRIPT                                                          ; DO-> DRAW AFC CENT TEAMS CITY ABBREV
	.DB $88, $D9                                                                                     ; SET PPU ADDR = $20D9
	.DB $FD, <ALL_AFC_WEST_CITY_ABBREV_SCRIPT, >ALL_AFC_WEST_CITY_ABBREV_SCRIPT                                                          ; DO-> DRAW AFC WEST TEAMS CITY ABBREV
	.DB $8A, $45                                                                                     ; SET PPU ADDR = $2245
	.DB $FD, <ALL_NFC_EAST_CITY_ABBREV_SCRIPT, >ALL_NFC_EAST_CITY_ABBREV_SCRIPT                                                          ; DO-> DRAW NFC EAST TEAMS CITY ABBREV 
	.DB $8A, $4F                                                                                     ; SET PPU ADDR = $224F
	.DB $FD, <ALL_NFC_CENT_CITY_ABBREV_SCRIPT, >ALL_NFC_CENT_CITY_ABBREV_SCRIPT                                                          ; DO-> DRAW NFC CENT TEAMS CITY ABBREV
	.DB $8A, $59                                                                                     ; SET PPU ADDR = $2259
	.DB $FD, <ALL_NFC_WEST_CITY_ABBREV_SCRIPT, >ALL_NFC_WEST_CITY_ABBREV_SCRIPT                                                          ; DO-> DRAW NFC WEST TEAMS CITY ABBREV
	.DB $FF                                                                                          ; END
	
_F}_TEAM_CONTROL_SCREEN_SCRIPT	

_F{_SCHEDULE_SCREEN_SCRIPTS

SCHEDULE_HEADER_SCREEN_SCRIPT:                                                                       ; 0X05 SCHEDULE HEADER
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $D0, $20, $0E                                                                                ; SET IRQ0 BG CHR BANKS = ($20,$0E)
	.DB $80, $43, <SCHED_HEADER, >SCHED_HEADER                                                       ; SET PPU ADDR = $2043, DO->DRAW NFL SCHEDULE TEXT + STARS
	.DB $83, $C0, <SCHED_ATTR, >SCHED_ATTR                                                           ; SET PPU ADDR = $23C3, DO->SET COLORS FOR SCHEDULE HEADER
	.DB $FF                                                                                          ; END
	




SCHED_HEADER:                                                                                        ; DRAW NFL SCHEDULE TEXT + STARS 
	.DB $14                                                                                          ; LENGTH = 20 
	.DB $E1, $E2, $E0                                                                             ; RED STAR, WHITE STAR, BLUE STAR
	.DB " NFL SCHEDULE "                                                                          ;
.DB $E1, $E2, $E0                                                                                    ; RED STAR, WHITE STAR, BLUE STAR
	.DB $FF                                                                                          ; END

SCHED_ATTR:                                                                                          ; SET COLORS FOR SCHEDULE HEADER
	.DB $06                                                                                          ; LENGTH = 6 
	.DB $40, $50, $50, $50, $50, $50                                                              ;
	.DB $FF                                                                                          ; END

SCHEDULE_MENU_SCREEN_SCRIPT:                                                                         ; 0X06 SCHEDULE MENU 
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $80, $82, <SCHED_MENU, >SCHED_MENU                                                           ; SET PPU ADDR = $2082
	.DB $FF                                                                                          ; END

SCHED_MENU:                                                                                          ; SCHEDULE MENU TILES AND TEXT
	.DB $0D, $08, "SCHEDULE", $0D, $0D, $0D, $09
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " AUTO SKIP ", $0E                                                                 ; LENGTH = 13, MENU BORDERS + MENU TEXT
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " PLAYOFFS  ", $0E                                                                 ; LENGTH = 13, MENU BORDERS + MENU TEXT
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " RESET     ", $0E                                                                 ; LENGTH = 13, MENU BORDERS + MENU TEXT
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $8B, $0F                                                                                     ; REPEAT (11 TIMES, BOTTOM MENU TILE)
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END

SCHEDULE_FIRST_WARN_SCREEN_SCRIPT:                                                                   ; 0X07 FIRST SCHEDULE RESET WARNING MENU 
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $81, $43, <SCHED_RESET, >SCHED_RESET                                                         ; SET PPU ADDR = $2143, DO->DRAW FIRST SCHEDULE RESET MENU
	.DB $FF                                                                                          ; END

SCHED_RESET:                                                                                         ; DRAW FIRST SCHEDULE RESET MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E5                                                                                          ; MOVE RIGHT (5 TILES)
	.DB $95, $0D                                                                                     ; REPEAT 21 TIMES, TOP MENU TILE
	.DB $01, $09                                                                                     ; LENGTH = 1, DRAW TOP RIGHT CURVED MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $9A, $00                                                                                     ; REPEAT 21 TIMES, BLANK TILE
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $1C, $0C, " THE DATA OF GAME YOU HAVE", $0E
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $9A, $00                                                                                     ; REPEAT 21 TIMES, BLANK TILE
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $1C, $0C, " PLAYED WILL BE CLEARED   ", $0E
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $9A, $00                                                                                     ; REPEAT 21 TIMES, BLANK TILE
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $84, $20                                                                                     ; REPEAT 4 TIMES, BLANK TILE 
	.DB $08, "OK", $F0, "   NO"                                                                      ; LENGTH 8, TEXT
	.DB $8E, $20                                                                                     ; REPEAT 15 TIMES, BLANK TILE
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $9A, $00                                                                                     ; REPEAT 21 TIMES, BLANK TILE
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8A, $20                                                                                     ; REPEAT 10 TIMES, BLANK TILE
	.DB $03, "YES"                                                                                   ; LENGTH 3, TEXT
	.DB $8D, $20                                                                                     ; REPEAT 13 TIMES, BLANK TILE
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $9A, $00                                                                                     ; REPEAT 21 TIMES, BLANK TILE
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $9A, $0F                                                                                     ; REPEAT 21 TIMES, BOTTOM STARIGHT MENU TILE 
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END

SCHEDULE_FINAL_WARN_SCREEN_SCRIPT:                                                                   ; 0X08 SECOND SCHEDULE RESET WARNING MENU 
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $82, $4D, <SCHED_WARN_2, >SCHED_WARN_2                                                       ; SET PPU ADDR = $224D, DO->DRAW FINAL SCHEDULE CONFIRMATION WARNING
	.DB $FF                                                                                          ; END

SCHED_WARN_2:                                                                                        ; DRAW FINAL SCHEDULE CONFIRMATION WARNING
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E3                                                                                          ; MOVE RIGHT (3 TILES)
	.DB $8B, $0D                                                                                     ; REPEAT 11 TIMES, TOP STRAIGHT MENU TILE
	.DB $01, $09                                                                                     ; LENGTH = 1, DRAW TOP RIGHT CURVED MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8E, $00                                                                                     ; REPEAT TILE (14 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $10, $0C, " REALLY", $F0, "  NO  ", $0E
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8E, $00                                                                                     ; REPEAT TILE (14 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8A, $20                                                                                     ; REPEAT 11 TIMES, BLANK TILE
	.DB $05, "YES ", $0E                                                                             ; LENGTH = 5, TEXT
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8E, $00                                                                                     ; REPEAT TILE (14 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $8E, $0F                                                                                     ; REPEAT 14 TIMES, BOTTOM STRAIGHT MENU TILE
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END

SKIP_WEEK_SCREEN_SCRIPT:                                                                             ; 0X09 AUTO_SKIP_MENU
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $80, $C3, <SKIP_MENU, >SKIP_MENU                                                             ; SET PPU ADDR = $20C3, DO->DRAW SKIP TO WEEK MENU
	.DB $FF                                                                                          ; END

SKIP_MENU:                                                                                           ; DRAW SKIP TO WEEK MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED LINE
	.DB $E9                                                                                          ; MOVE RIGHT (9 TILES)
	.DB $03, $0D, $0D, $09                                                                           ; LENGTH = 3, HORIZ MENU TILE X2, TOP RIGHT CURVED LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " TO WEEK   ", $0E                                                                 ;
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE 
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED LINE
	.DB $8B, $0F                                                                                     ; REPEAT 11 TIMES, BOT HORIZ LINE
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED LINE
	.DB $FF                                                                                          ; END
	
_F}_SCHEDULE_SCREEN_SCRIPTS	

_F{_STANDINGS_MENU_SCREEN_SCRIPT

STANDINGS_MENU_SCREEN_SCRIPT:                                                                        ; 0X0A STANDINGS MENU
	.DB $A4, $00, $0C, $20, $00                                                                      ; SET PPU ADDR = $2400, 12X32 BOX OF BLANK TILES
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $84, $03, <STANDINGS_MENU_SCRIPT, >STANDINGS_MENU_SCRIPT                                                          ; SET PPU ADDR = $24C3, DO->DRAW STANDINGS MENU
	.DB $87, $C1, <STAND_ATTR_VALUES, >STAND_ATTR_VALUES                                             ; SET PPU ADDR = $27C1, DO->SET AFC AND NFC TEXT TO RED
	.DB $FB, $01                                                                                     ; WAIT 1 FRAME  
	.DB $F1                                                                                          ; SET GAME STATUS AND PPU MIRRORING = HORIZONTAL
	.DB $FF                                                                                          ; END

STAND_ATTR_VALUES:                                                                                           ; SET AFC AND NFC TEXT TO RED ATTRIBUTES
	.DB $09                                                                                          ; LENGTH = 9
	.DB $50, $00, $00, $00, $00                                                                   ; 
	.DB $00, $00, $00, $05                                                                        ;
	.DB $FF                                                                                          ; END

STANDINGS_MENU_SCRIPT:                                                                                      ; DRAW STANDINGS MENU
	.DB $0A, $08, "STANDINGS"                                                                        ; LENGTH = 10, TOP LEFT CURVED LINE, TEXT
	.DB $91, $0D                                                                                     ; REPEAT 17 TIMES, TOP HORIZ LINE
	.DB $01 , $09                                                                                    ; LENGTH = 1, DRAW RIGHT CURVED LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $FA                                                                                          ; MOVE RIGHT 26 TILES
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $1B, $0C, " AFC  EAST  CENTRAL  WEST "                                                       ; LENGTH = 27, LEFT VERT LINE, TEXT
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $FA                                                                                          ; MOVE RIGHT 26 TILES
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $1B, $0C, " NFC  EAST  CENTRAL  WEST "                                                       ;
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $FA                                                                                          ; MOVE RIGHT 26 TILES
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $E6                                                                                          ; MOVE RIGHT 6 TILES
	.DB $07, "PLAYOFF"                                                                               ;
	.DB $ED                                                                                          ; MOVE RIGHT 13 TILES
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $FA                                                                                          ; MOVE RIGHT 26 TILES
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT VERT LINE
	.DB $9A, $0F                                                                                     ; REPEAT 10 TIMES, BOT HORIZ LINE
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT VERT LINE
	.DB $FF                                                                                          ; END
	
_F}_STANDINGS_MENU_SCREEN_SCRIPT	

_F{_TEAM_RANKINGS_MENU_SCREEN_SCRIPT

TEAM_RANKINGS_MENU_SCREEN_SCRIPT:                                                                    ; 0X0B/0X0C TEAM RANKINGS_MENU
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $82, $4D, <RANKING_MENU_SCRIPT, >RANKING_MENU_SCRIPT                                         ; SET PPU ADDR = $224D, DO->DRAW RANKINGS MENU TEXT
	.DB $83, $EB, <RANK_ATTR_VALUES, >RANK_ATTR_VALUES                                               ; SET PPU ADDR = $23EB = OFFENSE, DO->MAKE TEXT RED ATTRIB VALUES
	.DB $83, $F3, <RANK_ATTR_VALUES, >RANK_ATTR_VALUES                                               ; SET PPU ADDR = $23FC = DEFENSE, DO->MAKE TEXT RED ATTRIB VALUES
	.DB $FF                                                                                          ; END
	
RANK_ATTR_VALUES:                                                                                    ; MAKE TEXT RED ATTRIB VALUES
	.DB $03, $04, $05, $01                                                                           ; 
	.DB $FF                                                                                          ; END

RANKING_MENU_SCRIPT:                                                                                 ; DRAW RANKINGS MENU TEXT
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED LINE
	.DB $ED                                                                                          ; MOVE RIGHT 13 TILES
	.DB $82, $0D                                                                                     ; REPEAT TILE (2 TIMES, TOP HORIZ LINE)
	.DB $01, $09                                                                                     ; LENGTH = 1, DRAW TOP RIGHT CURVED LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $8F, $00                                                                                     ; REPEAT TILE (15 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $08, $0C, "OFFENSE"                                                                          ; LENGTH = 8, LEFT VERT LINE TEXT
	.DB $88, $00                                                                                     ; REPEAT TILE (8 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $8F, $00                                                                                     ; REPEAT TILE (15 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $11, $0C, " NFL  AFC  NFC ", $0E                                                             ; LENGTH = 8, LEFT VERT LINE, TEXT, VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $8F, $00                                                                                     ; REPEAT TILE (15 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $08, $0C, "DEFENSE"                                                                          ; LENGTH = 8, LEFT VERT LINE, TEXT
	.DB $88, $00                                                                                     ; REPEAT TILE (8 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT VERT LINE
	.DB $8F, $00                                                                                     ; REPEAT TILE (15 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $11, $0C, " NFL  AFC  NFC ", $0E                                                             ; LENGTH = 8, LEFT VERT LINE, TEXT, RIGHT VERT LINE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED LINE
	.DB $8F, $0F                                                                                     ; REPEAT TILE (15 TIMES, BOTTOM STRAIGHT MENU TILE)
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED LINE
	.DB $FF                                                                                          ; END
	
_F}_TEAM_RANKINGS_MENU_SCREEN_SCRIPT	

_F{_PLAYOFF_BRACKET_IN_SEASON_SCREEN_SCRIPTS

PLAYOFF_BRACKET_IN_SEASON_SCREEN_SCRIPT:                                                             ; 0X0D PLAYOFF_BRACKET BEFORE PLAYOFFS START
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $F2                                                                                          ; SET GAME STATUS AND PPU MIRRORING = VERTICAL
	.DB $88, $C4                                                                                     ; SET PPU ADDR = $20C4 = AFC 2 DIV TEXT LOC
	.DB $FD, <DIVISION_TEXT, >DIVISION_TEXT                                                          ; DO-> DRAW DIVISION TEXT
	.DB $88, $E3                                                                                     ; SET PPU ADDR = $20E3 = AFC DIV "CHAMP SECOND" TEXT LOC 
	.DB $FD, <CHAMP_2ND_TEXT, >CHAMP_2ND_TEXT                                                        ; DO-> DRAW CHAMP 2ND TEXT
	.DB $89, $44                                                                                     ; SET PPU ADDR = $2144 = AFC WILD CARD 1 TEXT LOC 
	.DB $FD, <WILD_CARD_TEXT, >WILD_CARD_TEXT                                                        ; DO-> DRAW WILD CARD TEXT
	.DB $89, $67                                                                                     ; SET PPU ADDR = $2167 = AFC WC "1ST" TEXT
	.DB $FD, <FIRST_TEXT, >FIRST_TEXT                                                                ; DO-> DRAW 1ST TEXT
	.DB $89, $C4                                                                                     ; SET PPU ADDR = $21C4 = AFC WILD CARD 2 TEXT LOC
	.DB $FD, <WILD_CARD_TEXT, >WILD_CARD_TEXT                                                        ; DO-> DRAW WILD CARD TEXT
	.DB $89, $E7                                                                                     ; SET PPU ADDR = $21E7 = AFC WC "2ND" TEXT
	.DB $FD, <SECOND_TEXT, >SECOND_TEXT                                                              ; DO-> DRAW 2ND TEXT
	.DB $8A, $44                                                                                     ; SET PPU ADDR = $2244 = AFC WILD CARD 3 TEXT LOC
	.DB $FD, <WILD_CARD_TEXT, >WILD_CARD_TEXT                                                        ; DO-> DRAW WILD CARD TEXT 
	.DB $8A, $67                                                                                     ; SET PPU ADDR = $2267 = AFC WC "3RD" TEXT
	.DB $FD, <THIRD_TEXT, >THIRD_TEXT                                                                ; DO-> DRAW 3RD TEXT
	.DB $8A, $C4                                                                                     ; SET PPU ADDR = $22C4 = AFC 3 DIV TEXT LOC
	.DB $FD, <DIVISION_TEXT, >DIVISION_TEXT                                                          ; DO-> DRAW DIVISION TEXT
	.DB $8A, $E3                                                                                     ; SET PPU ADDR = $22E3 = AFC DIV "CHAMP THIRD" TEXT LOC 
	.DB $FD, <CHAMP_3RD_TEXT, >CHAMP_3RD_TEXT                                                        ; DO-> DRAW CHAMP 3RD TEXT
	.DB $8B, $44                                                                                     ; SET PPU ADDR = $2344 = AFC 1 DIV TEXT LOC
	.DB $FD, <DIVISION_TEXT, >DIVISION_TEXT                                                          ; DO-> DRAW DIVISION TEXT
	.DB $8B, $63                                                                                     ; SET PPU ADDR = $2363 = AFC DIV "CHAMP FIRST" TEXT LOC
	.DB $FD, <CHAMP_1ST_TEXT, >CHAMP_1ST_TEXT                                                        ; DO-> DRAW CHAMP 1ST TEXT
	.DB $8C, $D4                                                                                     ; SET PPU ADDR = $24F4 = NFC DIV TEXT LOC
	.DB $FD, <DIVISION_TEXT, >DIVISION_TEXT                                                          ; DO-> DRAW DIVISION TEXT
	.DB $8C, $F3                                                                                     ; SET PPU ADDR = $24F3 = NFC DIV "CHAMP SECOND" TEXT LOC
	.DB $FD, <CHAMP_2ND_TEXT, >CHAMP_2ND_TEXT                                                        ; DO-> DRAW CHAMP 2ND TEXT
	.DB $8D, $53                                                                                     ; SET PPU ADDR = $2553 = NFC WILD CARD 1 TEXT LOC
	.DB $FD, <WILD_CARD_TEXT, >WILD_CARD_TEXT                                                        ; DO-> DRAW WILD CARD TEXT
	.DB $8D, $76                                                                                     ; SET PPU ADDR = $2567 = NFC WC "1ST" TEXT
	.DB $FD, <FIRST_TEXT, >FIRST_TEXT                                                                ; DO-> DRAW 1ST TEXT
	.DB $8D, $D3                                                                                     ; SET PPU ADDR = $25D3 = NFC WILD CARD 2 TEXT LOC
	.DB $FD, <WILD_CARD_TEXT, >WILD_CARD_TEXT                                                        ; DO-> DRAW WILD CARD TEXT
	.DB $8D, $F6                                                                                     ; SET PPU ADDR = $2567 = NFC WC "2ND" TEXT
	.DB $FD, <SECOND_TEXT, >SECOND_TEXT                                                              ; DO-> DRAW 2ND TEXT
	.DB $8E, $53                                                                                     ; SET PPU ADDR = $2653 = NFC WILD CARD 3 TEXT LOC
	.DB $FD, <WILD_CARD_TEXT, >WILD_CARD_TEXT                                                        ; DO-> DRAW WILD CARD TEXT
	.DB $8E, $76                                                                                     ; SET PPU ADDR = $2676 = NFC WC "3ND" TEXT
	.DB $FD, <THIRD_TEXT, >THIRD_TEXT                                                                ; DO-> DRAW 3RD TEXT
	.DB $8E, $D4                                                                                     ; SET PPU ADDR = $26D4 = NFC 3 DIV TEXT LOC
	.DB $FD, <DIVISION_TEXT, >DIVISION_TEXT                                                          ; DO-> DRAW DIVISION TEXT
	.DB $8E, $F3                                                                                     ; SET PPU ADDR = $26F3 = NFC 3 DIV "CHAMP THIRD" TEXT LOC
	.DB $FD, <CHAMP_3RD_TEXT, >CHAMP_3RD_TEXT                                                        ; DO-> DRAW CHAMP 3RD TEXT
	.DB $8F, $54                                                                                     ; SET PPU ADDR = $2754 = AFC 2 DIV TEXT LOC
	.DB $FD, <DIVISION_TEXT, >DIVISION_TEXT                                                          ; DO-> DRAW DIVISION TEXT
	.DB $8F, $73                                                                                     ; SET PPU ADDR = $2773 = NFC 3 DIV "CHAMP FIRST" TEXT LOC
	.DB $FD, <CHAMP_1ST_TEXT, >CHAMP_1ST_TEXT                                                        ; DO-> DRAW CHAMP 1ST TEXT
	.DB $FD, <BRACKET, >BRACKET                                                                      ; DO->DRAW BRACKET LINES
	.DB $FF                                                                                          ; END 

DIVISION_TEXT:                                                                                       ; DRAW DIVISION TEXT
	.DB      "DIVISION"                                                                              ;
	.DB $FE                                                                                          ; RETURN

WILD_CARD_TEXT:                                                                                      ; DRAW WILD CARD TEXT
	.DB      "WILD CARD"                                                                             ;
	.DB $FE                                                                                          ; RETURN

CHAMP_2ND_TEXT:                                                                                      ; DRAW CHAMP 2ND TEXT
	.DB      "CHAMP  2ND"                                                                            ;
	.DB $FE                                                                                          ; RETURN

FIRST_TEXT:                                                                                          ; DRAW 1ST TEXT
	.DB      "1ST"                                                                                   ;
	.DB $FE                                                                                          ; RETURN

SECOND_TEXT:                                                                                         ; DRAW 2ND TEXT
	.DB      "2ND"                                                                                   ;
	.DB $FE                                                                                          ; RETURN

THIRD_TEXT:                                                                                          ; DRAW 3RD TEXT
	.DB      "3RD"                                                                                   ;
	.DB $FE                                                                                          ; RETURN

CHAMP_3RD_TEXT:                                                                                      ; DRAW CHAMP 3RD TEXT   
	.DB      "CHAMP  3RD"                                                                            ;
	.DB $FE                                                                                          ; RETURN

CHAMP_1ST_TEXT:                                                                                      ; DRAW CHAMP 1ST TEXT
	.DB      "CHAMP  1ST"                                                                            ;
	.DB $FE                                                                                          ; RETURN
	
_F}_PLAYOFF_BRACKET_IN_SEASON_SCREEN_SCRIPT	

_F{_PLAYOFF_BRACKET_PLAYOFFS_SCREEN_SCRIPTS

PLAYOFF_BRACKET_PLAYOFFS_SCREEN_SCRIPT:                                                              ; 0X11 PLAYOFF_BRACKET 
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $F2                                                                                          ; SET GAME STATUS AND PPU MIRRORING = VERTICAL
	.DB $FD, <BRACKET, >BRACKET                                                                      ; DO-> DRAW PLAY OFF BRACKET 
	.DB $FA, $16                                                                                     ; DRAW PLAYOFF BRACKET TEAM NAMES
	.DB $FF                                                                                          ; END

BRACKET:                                                                                             ; DRAW PLAYOFF BRACKET LINES AND SCREEN HEADER TEXT

BRACKET_TEXT_AFC:                                                                                    ; DRAW TEXT FOR AFC SIDE + SHARED
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $D0, $18, $7A                                                                                ; SET IRQ0 BG CHR BANKS = ($18,$7A)
	.DB $88, $41                                                                                     ; SET PPU ADDR = $2041 = AFC TEXT START
	.DB $1C, $19, $1C                                                                                ; WHITE STAR, RED STAR, WHITE STAR
	.DB " AFC "                                                                                   ;
	.DB $1C, $19, $1C                                                                             ; WHITE STAR, RED STAR, WHITE STAR
	.DB "   PLAYOFF"                                                                              ;
	.DB $98, $6F, $07, $EC                                                                           ; SET PPU ADDR = $206F, REPEAT 7 TIMES (RED UNDERLINE) 
	.DB $88, $92                                                                                     ; SET PPU ADDR = $2092 = DIVISIONAL TEXT START
	.DB      "DIVISIONAL"                                                                            ;
	.DB $88, $B3                                                                                     ; SET PPU ADDR = $20B3 = PLAYOFF TEXT START
	.DB      "PLAYOFF"                                                                               ;
	.DB $98, $D3, $07, $EC                                                                           ; SET PPU ADDR = $20D3, REPEAT 7 TIMES (RED UNDERLINE) 
	.DB $88, $F9                                                                                     ; SET PPU ADDR = $20F9 
	.DB      "AFC"                                                                                   ;
	.DB $89, $18                                                                                     ; SET PPU ADDR = $2118
	.DB      "CHAMP"                                                                                 ;
	.DB $99, $38, $05, $EC                                                                           ; SET PPU ADDR = $206F, REPEAT ACROSS 5 TIMES (RED UNDERLINE)
	.DB $89, $DD                                                                                     ; SET PPU ADDR = $21DD
	.DB      "SUP"                                                                                   ;
	.DB $89, $FE                                                                                     ; SET PPU ADDR = $21FE
	.DB      "BO"                                                                                    ; 
	.DB $9A, $1E, $02, $EC                                                                           ; SET PPU ADDR = $221E, REPEAT ACROSS 2 TIMES (RED UNDERLINE)

BRACKET_LINES_AFC:                                                                                   ; DRAW LEFT SCREEN BRACKET LINES
																									; DIV CHAMP 2  LINE
	.DB $98, $EE, $08, $EB                                                                           ; SET PPU ADDR = $20EE, REPEAT ACROSS 7 TIMES (HORIZ LINE)
	.DB $A8, $F6, $F1                                                                                ; SET PPU ADDR = $20F6, DRAW TILE (RIGHT CORNER -|)

																									; LINE CONNECTING DIV CHAMP TO WILD CARD
	.DB $91, $16, $02, $EA                                                                           ; SET PPU ADDR = $2116, REPEAT DOWN 2 TIMES (VERT LINE)
	.DB $A9, $56, $DE                                                                                ; SET PPU ADDR = $2156, DRAW TILE (T LINE ROTATED LEFT)
	.DB $91, $76, $02, $EA                                                                           ; SET PPU ADDR = $2176, REPEAT DOWN 2 TIMES (VERT LINE)
	.DB $A9, $B6, $F3                                                                                ; SET PPU ADDR = $21B6, DRAW TILE (BOTTOM RIGHT EDGE)

																									; WILD CARD 1 & 2 LINES
	.DB $99, $6E, $04, $EB                                                                           ; SET PPU ADDR = $216E, REPEAT ACROSS 4 TIMES (HORIZ LINE)
	.DB $A9, $72, $F1                                                                                ; SET PPU ADDR = $2172, DRAW TILE (RIGHT CORNER -|)
	.DB $99, $EE, $04, $EB                                                                           ; SET PPU ADDR = $21EE, REPEAT ACROSS 4 TIMES (HORIZ LINE)
	.DB $A9, $F2, $F3                                                                                ; SET PPU ADDR = $21F2, DRAW TILE (BOTTOM RIGHT EDGE)
	.DB $A9, $92, $EA                                                                                ; SET PPU ADDR = $2192, DRAW TILE (VERT LINE)
	.DB $A9, $B2, $DE                                                                                ; SET PPU ADDR = $21B2, DRAW TILE (T LINE ROTATED LEFT)
	.DB $A9, $D2, $EA                                                                                ; SET PPU ADDR = $21D2, DRAW TILE (VERT LINE)

																									; WILD CARD 1 & 2 WINNER LINE
	.DB $99, $B3, $03, $EB                                                                           ; SET PPU ADDR = $21B3, REPEAT ACROSS 3 TIMES (HORIZ LINE)

																									; AFC DIVISIONAL WINNER TOP LINE
	.DB $99, $57, $03, $EB                                                                           ; SET PPU ADDR = $2157, REPEAT ACROSS 3 TIMES (HORIZ LINE)
	.DB $A9, $5A, $F1                                                                                ; SET PPU ADDR = $215A, DRAW TILE (RIGHT CORNER -|)
								
																									; AFC DIVISIONAL WINNER TO SUPERBOWL TOP LINE
	.DB $91, $7A, $06, $EA                                                                           ; SET PPU ADDR = $217A, REPEAT DOWN 6 TIMES (VERT LINE)
	.DB $AA, $3A, $DE                                                                                ; SET PPU ADDR = $223A, DRAW TILE (T LINE ROTATED LEFT)

																									; AFC DIV CHAMP 1 TO WINNER LINES
	.DB $9B, $6E, $08, $EB                                                                           ; SET PPU ADDR = $236E, REPEAT ACROSS 8 TIMES (VERT LINE)
	.DB $AB, $76, $F3                                                                                ; SET PPU ADDR = $2376, DRAW TILE (BOTTOM RIGHT EDGE)
	.DB $93, $36, $02, $EA                                                                           ; SET PPU ADDR = $2336, REPEAT DOWN 2 TIMES (VERT LINE)
	.DB $AB, $16, $DE                                                                                ; SET PPU ADDR = $2316, DRAW TILE (T LINE ROTATED LEFT) 
	.DB $92, $D6, $02, $EA                                                                           ; SET PPU ADDR = $22D6, REPEAT DOWN 2 TIMES (VERT LINE)
	.DB $AA, $B6, $F1                                                                                ; SET PPU ADDR = $22B6, DRAW TILE (RIGHT CORNER -| )

																									; WILD CARD 3 & DIV CHAMP 3  LINES
	.DB $9A, $6E, $04, $EB                                                                           ; SET PPU ADDR = $226E, REPEAT ACROSS 4 TIMES (HORIZ LINE)
	.DB $AA, $72, $F1                                                                                ; SET PPU ADDR = $2272, DRAW TILE (RIGHT CORNER -|)
	.DB $9A, $EE, $04, $EB                                                                           ; SET PPU ADDR = $22EE, REPEAT ACROSS 4 TIMES (HORIZ LINE)
	.DB $AA, $F2, $F3                                                                                ; SET PPU ADDR = $22F2, DRAW TILE (BOTTOM RIGHT EDGE)
	.DB $AA, $92, $EA                                                                                ; SET PPU ADDR = $2292, DRAW TILE (VERT LINE)
	.DB $AA, $B2, $DE                                                                                ; SET PPU ADDR = $22B2, DRAW TILE (T LINE ROTATED LEFT)
	.DB $AA, $D2, $EA                                                                                ; SET PPU ADDR = $22D2, DRAW TILE (VERT LINE)

																									; WILD CARD 3 & DIV CHAMP 3  WINNER LINE
	.DB $9A, $B3, $03, $EB                                                                           ; SET PPU ADDR = $22B3, REPEAT ACROSS 3 TIMES (HORIZ LINE)
								
																									; AFC DIVISIONAL WINNER BOTTOM LINE
	.DB $9B, $17, $03, $EB                                                                           ; SET PPU ADDR = $2317, REPEAT ACROSS 3 TIMES (HORIZ LINE)
	.DB $AB, $1A, $F3                                                                                ; SET PPU ADDR = $231A, DRAW TILE (BOTTOM RIGHT EDGE)

																									; AFC DIVISIONAL WINNER TO SUPERBOWL BOTTOM LINE + T
	.DB $92, $5A, $06, $EA                                                                           ; SET PPU ADDR = $225A, REPEAT DOWN 6 TIMES (VERT LINE)
	.DB $AA, $3A, $DE                                                                                ; SET PPU ADDR = $223A, DRAW TILE (T LINE ROTATED LEFT)

																									; LEFT SCREEN SUPER BOWL LINE
	.DB $9A, $3B, $05, $EB                                                                           ; SET PPU ADDR = $22EE, REPEAT ACROSS 4 TIMES (HORIZ LINE)


BRACKET_TEXT_NFC:                                                                                    ; DRAW TEXT FOR NFC SIDE + SHARED 
	.DB $8C, $4A                                                                                     ; SET PPU ADDR = $244A
	.DB      "PLAYOFF   "                                                                            ;
	.DB $19, $1C, $19                                                                                ; RED STAR, WHITE STAR, RED STAR
	.DB " NFC "                                                                                      ;
	.DB $19, $1C, $19                                                                                ; RED STAR, WHITE STAR, RED STAR
	.DB $9C, $6A, $07, $EC                                                                           ; SET PPU ADDR = $246A, REPEAT 7 TIMES (RED UNDERLINE)
	.DB $8C, $85                                                                                     ; SET PPU ADDR = $2485
	.DB      "DIVISIONAL"                                                                            ;
	.DB $8C, $A6                                                                                     ; SET PPU ADDR = $24A6
	.DB      "PLAYOFF"                                                                               ;
	.DB $9C, $C6, $07, $EC                                                                           ; SET PPU ADDR = $24C6, REPEAT 7 TIMES (RED UNDERLINE)
	.DB $8C, $E4                                                                                     ; SET PPU ADDR = $24E4
	.DB      "NFC"                                                                                   ;
	.DB $8D, $03                                                                                     ; SET PPU ADDR = $2503
	.DB      "CHAMP"                                                                                 ;
	.DB $9D, $23, $05, $EC                                                                           ; SET PPU ADDR = $2523, REPEAT ACROSS 5 TIMES (RED UNDERLINE)
	.DB $8D, $C0                                                                                     ; SET PPU ADDR = $25C0 
	.DB      "ER"                                                                                    ;
	.DB $8D, $E0                                                                                     ; SET PPU ADDR = $25E0
	.DB      "WL"                                                                                    ;
	.DB $9E, $00, $02, $EC                                                                           ; SET PPU ADDR = $2600, REPEAT ACROSS 2 TIMES (RED UNDERLINE)

BRACKET_LINES_NFC:                                                                                   ; DRAW BRACKET LINES FOR NFC PLAYOFF BRACKET
																									; DIV CHAMP 2  LINE
	.DB $9C, $EA, $08, $EB                                                                           ; SET PPU ADDR = $24EA, REPEAT ACROSS 7 TIMES (HORIZ LINE)
	.DB $AC, $E9, $F0                                                                                ; SET PPU ADDR = $24E0, DRAW TILE (LEFT CORNER |-)

																									; LINE CONNECTING DIV CHAMP TO WILD CARD
	.DB $95, $09, $02, $EA                                                                           ; SET PPU ADDR = $2509, REPEAT DOWN 2 TIMES (VERT LINE)
	.DB $AD, $49, $DF                                                                                ; SET PPU ADDR = $2549, DRAW TILE (T LINE ROTATED RIGHT)
	.DB $95, $69, $02, $EA                                                                           ; SET PPU ADDR = $2569, REPEAT DOWN 2 TIMES (VERT LINE)
	.DB $AD, $A9, $F2                                                                                ; SET PPU ADDR = $25A9, DRAW TILE (BOTTOM LEFT EDGE)

																									; WILD CARD 1 & 2 LINES
	.DB $9D, $6E, $04, $EB                                                                           ; SET PPU ADDR = $256E, REPEAT ACROSS 4 TIMES (HORIZ LINE)
	.DB $AD, $6D, $F0                                                                                ; SET PPU ADDR = $256D, DRAW TILE (LEFT CORNER |-)
	.DB $9D, $EE, $04, $EB                                                                           ; SET PPU ADDR = $2EEE, REPEAT ACROSS 4 TIMES (HORIZ LINE)
	.DB $AD, $ED, $F2                                                                                ; SET PPU ADDR = $25ED, DRAW TILE (BOTTOM LEFT EDGE)
	.DB $AD, $8D, $EA                                                                                ; SET PPU ADDR = $258D, DRAW TILE (VERT LINE)
	.DB $AD, $AD, $DF                                                                                ; SET PPU ADDR = $25AD, DRAW TILE (T LINE ROTATED RIGHT)
	.DB $AD, $CD, $EA                                                                                ; SET PPU ADDR = $25CD, DRAW TILE (VERT LINE)
								
																									; WILD CARD 1 & 2 WINNER LINE
	.DB $9D, $AA, $03, $EB                                                                           ; SET PPU ADDR = $25AA, REPEAT ACROSS 3 TIMES (HORIZ LINE)

																									; NFC DIVISIONAL WINNER TOP LINE
	.DB $9D, $46, $03, $EB                                                                           ; SET PPU ADDR = $2546, REPEAT ACROSS 3 TIMES (HORIZ LINE)
	.DB $AD, $45, $F0                                                                                ; SET PPU ADDR = $2545, DRAW TILE (LEFT CORNER |-)

																									; NFC DIVISIONAL WINNER TO SUPERBOWL TOP LINE
	.DB $95, $65, $06, $EA                                                                           ; SET PPU ADDR = $2565, REPEAT DOWN 6 TIMES (VERT LINE)
	.DB $AE, $25, $DF                                                                                ; SET PPU ADDR = $2625, DRAW TILE (T LINE ROTATED RIGHT)

																									; NFC DIV CHAMP 1 TO WINNER LINES
	.DB $9F, $6A, $08, $EB                                                                           ; SET PPU ADDR = $276A, REPEAT ACROSS 8 TIMES (VERT LINE)
	.DB $AF, $69, $F2                                                                                ; SET PPU ADDR = $2769, DRAW TILE (BOTTOM LEFT EDGE)
	.DB $96, $C9, $02, $EA                                                                           ; SET PPU ADDR = $26C9, REPEAT DOWN 2 TIMES (VERT LINE)
	.DB $AF, $09, $DF                                                                                ; SET PPU ADDR = $2709, DRAW TILE (T LINE ROTATED RIGHT)
	.DB $97, $29, $02, $EA                                                                           ; SET PPU ADDR = $2729, REPEAT DOWN 2 TIMES (VERT LINE)

																									; REDUNDANT
	.DB $AF, $69, $F2                                                                             ; SET PPU ADDR = $2769, DRAW TILE (BOTTOM LEFT EDGE)
																									; WILD CARD 3 & DIV CHAMP 3  LINES
	.DB $9E, $6E, $04, $EB                                                                           ; SET PPU ADDR = $266E, REPEAT ACROSS 4 TIMES (HORIZ LINE)
	.DB $AE, $6D, $F0                                                                                ; SET PPU ADDR = $266D, DRAW TILE (LEFT CORNER |-)
	.DB $9E, $EE, $04, $EB                                                                           ; SET PPU ADDR = $26EE, REPEAT ACROSS 4 TIMES (HORIZ LINE)
	.DB $AE, $ED, $F2                                                                                ; SET PPU ADDR = $26ED, DRAW TILE (BOTTOM LEFT EDGE)
	.DB $AE, $8D, $EA                                                                                ; SET PPU ADDR = $268D, DRAW TILE (VERT LINE)
	.DB $AE, $AD, $DF                                                                                ; SET PPU ADDR = $26AD, DRAW TILE (T LINE ROTATED RIGHT)
	.DB $AE, $CD, $EA                                                                                ; SET PPU ADDR = $26CD, DRAW TILE (VERT LINE)

	.DB $AE, $A9, $F0                                                                                ; SET PPU ADDR = $26E9, DRAW TILE (LEFT CORNER |-)

																									; WILD CARD 3 & DIV CHAMP 3  WINNER LINE
	.DB $9E, $AA, $03, $EB                                                                        ; SET PPU ADDR = $26AA, REPEAT ACROSS 3 TIMES (HORIZ LINE)
								
																									; NFC DIVISIONAL WINNER BOTTOM LINE
	.DB $9F, $06, $03, $EB                                                                           ; SET PPU ADDR = $2706, REPEAT ACROSS 3T IMES (HORIZ LINE)
	.DB $AF, $05, $F2                                                                                ; SET PPU ADDR = $2705, DRAW TILE (BOTTOM LEFT EDGE)

																									; NFC DIVISIONAL WINNER TO SUPERBOWL BOTTOM LINE + T
	.DB $96, $45, $06, $EA                                                                           ; SET PPU ADDR = $2645, REPEAT DOWN 6 TIMES (VERT LINE)
	.DB $AE, $25, $DF                                                                                ; SET PPU ADDR = $2625, DRAW TILE (T LINE ROTATED RIGHT)
								
																									; NFC SUPER BOWL LINE
	.DB $9E, $20, $05, $EB                                                                           ; SET PPU ADDR = $2620, REPEAT ACROSS 5 TIMES (HORIZ LINE)

	.DB $FE                                                                                          ; RETURN
	
_F}_PLAYOFF_BRACKET_PLAYOFFS_SCREEN_SCRIPT	

_F{_PRO_BOWL_MENU_SCREEN_SCRIPTS

PRO_BOWL_MENU_SCREEN_SCRIPT:                                                                         ; 0X12-0X17 DRAW PRO BOWL GAME TYPE(MAN V MAN ETC) MENU
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $85, $C5, <PRO_BOWL_MEN, >PRO_BOWL_MEN                                                       ; SET PPU ADDR = $25C5, DO->DRAW PRO BOWL GAME TYPE MENU
	.DB $FF                                                                                          ; RETURN

PRO_BOWL_MEN:                                                                                        ; DRAW PRO BOWL GAME TYPE MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E8                                                                                          ; MOVE RIGHT 8 TILES
	.DB $85, $0D                                                                                     ; SET PPU ADDR = $250D
	.DB $FD, <GAME_TYPE_MENU_SCRIPT, >GAME_TYPE_MENU_SCRIPT                                        ; DO->GAME TYPE MENU

PRO_BOWL_CHOICE_SCREEN_SCRIPT:                                                                       ; 0X18 DRAW PRO BOWL AFC/NFC CHOICE
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $D0, $18, $00                                                                                ; SET IRQ0 BG CHR BANKS = ($18,$00)
	.DB $88, $8D                                                                                     ; SET PPU ADDR = $208D
	.DB      "SELECT"                                                                                ;
	.DB $80, $C4, <PROBWL_STARS, >PROBWL_STARS                                                       ; SET PPU ADDR = $20C4, DO->DRAW RED STAR ,WHITE STAR, BLUE STAR
	.DB $80, $D8, <PROBWL_STARS, >PROBWL_STARS                                                       ; SET PPU ADDR = $20D8, DO->DRAW RED STAR ,WHITE STAR, BLUE STAR
	.DB $88, $C8                                                                                     ; SET PPU ADDR = $20C8
	.DB      "YOUR CONFERENCE"                                                                       ;
	.DB $8A, $29                                                                                     ; SET PPU ADDR = $2229
	.DB      "AFC"                                                                                   ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "1 P"                                                                                   ;
	.DB $8A, $34                                                                                     ; SET PPU ADDR = $2234
	.DB      "NFC"                                                                                   ;
	.DB $F7, $2E                                                                                     ; DRAW BG (AFC AND NFC LOGOS)
	.DB $EB, $06, $00                                                                                ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG,SPR PAL INDEX)
	.DB $FF                                                                                          ; END

PROBWL_STARS:                                                                                        ; DRAW RED STAR ,WHITE STAR, BLUE STAR
	.DB $03                                                                                          ; LENGTH = 3   
	.DB $1B, $1C, $19                                                                             ; RED STAR, WHITE START, BLUE STAR
	.DB $FF                                                                                          ; END
	
_F}_PRO_BOWL_MENU_SCREEN_SCRIPTS	

_F{_TEAM_DATA_SCREEN_SCRIPTS

TEAM_DATA_SCREEN_SCRIPT:                                                                             ; 0X19 DRAW TEAM DATA TEXT
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $D0, $18, $7A                                                                                ; SET IRQ0 BG CHR BANKS = (18,7A) TEXT AND HELMETS
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $88, $47                                                                                     ; SET PPU ADDR = $2047
	.DB $19, $1C, $19                                                                                ; WHITE STAR, RED STAR, WHITE STAR
	.DB " TEAM DATA "                                                                             ;
	.DB $19, $1C, $19                                                                             ; WHITE STAR, RED STAR, WHITE STAR
	.DB $88, $85                                                                                     ; SET PPU ADDR = $2085
	.DB      "AFC ALL STARS SELECT TEAM"                                                             ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "NFC ALL STARS"                                                                         ;
	.DB $89, $25                                                                                     ; SET PPU ADDR = $2125
	.DB $FD, <ALL_AFC_EAST_CITY_ABBREV_SCRIPT, >ALL_AFC_EAST_CITY_ABBREV_SCRIPT                      ; DO-> DRAW ALL AFC EAST TEAM CITY ABBREV 
	.DB $89, $2F                                                                                     ; SET PPU ADDR = $212F
	.DB $FD, <ALL_AFC_CENT_CITY_ABBREV_SCRIPT, >ALL_AFC_CENT_CITY_ABBREV_SCRIPT                      ; DO-> DRAW ALL AFC CENT TEAM CITY ABBREV
	.DB $89, $39                                                                                     ; SET PPU ADDR = $2139
	.DB $FD, <ALL_AFC_WEST_CITY_ABBREV_SCRIPT, >ALL_AFC_WEST_CITY_ABBREV_SCRIPT                      ; DO-> DRAW ALL AFC WEST TEAM CITY ABBREV
	.DB $8A, $65                                                                                     ; SET PPU ADDR = $2265
	.DB $FD, <ALL_NFC_EAST_CITY_ABBREV_SCRIPT, >ALL_NFC_EAST_CITY_ABBREV_SCRIPT                      ; DO-> DRAW ALL NFC EAST TEAM CITY ABBREV 
	.DB $8A, $6F                                                                                     ; SET PPU ADDR = $226F
	.DB $FD, <ALL_NFC_CENT_CITY_ABBREV_SCRIPT, >ALL_NFC_CENT_CITY_ABBREV_SCRIPT                      ; DO-> DRAW ALL NFC CENT TEAM CITY ABBREV
	.DB $8A, $B9                                                                                     ; SET PPU ADDR = $22B9
	.DB $FD, <ALL_NFC_WEST_CITY_ABBREV_SCRIPT, >ALL_NFC_WEST_CITY_ABBREV_SCRIPT                      ; DO-> DRAW ALL NFC CENT TEAM CITY ABBREV
	.DB $83, $CC, <TM_DATA_ATTR, >TM_DATA_ATTR                                                       ; SET PPU ADDR = $23CC, DO->MAKE "SELECT TEAM" TEXT YELLOWATTR
	.DB $FF                                                                                          ; END

TM_DATA_ATTR:                                                                                        ; MAKE SELECT TEAM TEXT YELLOW ATTR
	.DB $04                                                                                          ; LENGTH = 4 
	.DB $08, $0A, $0A, $02                                                                        ;
	.DB $FF                                                                                          ; END
	
_F}_TEAM_DATA_SCREEN_SCRIPTS	

_F{_ROSTER_SCREEN_SCRIPTS

ROSTER_SCREEN_SCRIPT:                                                                                ; 0X1A DRAW ROSTER SCREEN NON PLAYER NAME TEXT
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CA                                                                                          ; CLEAR NAMETABLES()
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $D0, $18, $7A                                                                                ; SET IRQ0 BG CHR BANKS = ($18,$7A)
	.DB $88, $42                                                                                     ; SET PPU ADDR = $2042
	.DB $FA, $08                                                                                     ; DRAW CURRENT TEAM CITY AND MASCOT CENTERED SMALL LETTERS()
	.DB $88, $57                                                                                     ; SET PPU ADDR = $2057
	.DB $FA, $02                                                                                     ; DRAW CURRENT TEAM CONFERENCE()
	.DB $88, $78                                                                                     ; SET PPU ADDR = $2078
	.DB $FA, $05                                                                                     ; DRAW CURRENT TEAM DIVISION()
	.DB $88, $AE                                                                                     ; SET PPU ADDR = $20AE
	.DB      "RESULTS  WON"                                                                          ;
	.DB $98, $CE, $07, $75                                                                           ; SET PPU ADDR = $20CE, REPEAT 7 TIMES (RED UNDERLINE) 
	.DB $88, $D6                                                                                     ; SET PPU ADDR = $20D6
	.DB      "LOST"                                                                                  ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "TIED"                                                                                  ;
	.DB $89, $51                                                                                     ; SET PPU ADDR = $2151
	.DB      "PLAYERS DATA"                                                                          ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "OF STARTERS"                                                                           ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "DF STARTERS"                                                                           ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "PLAY BOOK"                                                                             ;
	.DB $99, $E0, $20, $5D                                                                           ; SET PPU ADDR = $21E0, REPEAT 32 TIMES (RED ROSTER LINE) 
	.DB $89, $E2                                                                                     ; SET PPU ADDR = $21E2
	.DB      "ROSTER"                                                                                ; 

																									; ROSTER_QB_THRU_TE1
	.DB $C0, $11, $80, $00                                                                           ; START SCROLL THREAD,SET (IRQ INDEX =1, COUNTER VAL, +/- X SCROLL SPEED)
	.DB $8A, $25                                                                                     ; SET PPU ADDR = $2225 = QB 1 NUMBER AND NAME START
	.DB $DB, $00                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = QB1)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $01                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = QB2)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $02                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RB1)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $03                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RB2)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $04                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RB3)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $05                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RB4)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $06                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = WR1)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $07                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = WR2)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $08                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = WR3)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $09                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = WR4)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $0A                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = TE1)

																									; ROSTER_TE2_THRU_P 
	.DB $8A, $39                                                                                  ; SET PPU ADDR = $2225 = TE 2 NUMBER AND NAME START
	.DB $DB, $0B                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = TE2)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $0C                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = C)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $0D                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = LG)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $0E                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RG)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $0F                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = LT)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $10                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RT)
	.DB $B2                                                                                          ; DOWN 3 ROWS
	.DB $DB, $1C                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = KICKER)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $DB, $1D                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = PUNTER)

																									; ROSTER_DEFENSE 
	.DB $8E, $2F                                                                                  ; SET PPU ADDR = $2625 = RE NUMBER AND NAME START
	.DB $DB, $11                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RE)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $12                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = NT) 
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $13                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = LE)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $14                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = ROLB)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $15                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RILB)
	.DB $B0                                                                                          ; DOWN 1 ROW     
	.DB $DB, $16                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = LILB)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $17                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = LOLB)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $18                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = RCB)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $19                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = LCB)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $1A                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = FS)
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB $DB, $1B                                                                                     ; DRAW CURRENT TEAM PLAYER NAME AND NUMBER FOR TEAM DATA(PLAYER = SS)
	.DB $FF                                                                                          ; END
	
_F}_ROSTER_SCREEN_SCRIPTS	

_F{_DEFENSIVE_STARTERS_SCREEN_SCRIPT

DEFENSIVE_STARTERS_SCREEN_SCRIPT:                                                                    ; 0X1B-0X1D DRAW DEFENSIVE STARTERS TRIANGLES AND TEXT
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()      
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $D0, $20, $0E                                                                                ; SET IRQ0 BG CHR BANKS = (20,0E)
	.DB $A0, $80, $06, $20, $01                                                                      ; FILL BOX (ADDR=2080, Y=6, X=32, BLANK TILE)
	.DB $80, $43, <DF_STRT_TIT, >DF_STRT_TIT                                                         ; SET PPU ADDR = $2043, DO-> DRAW FOOTBALLS + "DEFENSIVE STARTERS" TEXT
	.DB $98, $60, $20, $E5                                                                           ; SET PPU ADDR = $2060, REPEAT 32 TIMES (GRASS TILE) 
	.DB $80, $8C, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; DRAW DEFENSIVE STARTER TRIANGLES
	.DB $80, $8F, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $208F, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $80, $92, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $2092, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $80, $A9, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $20A9, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $80, $B5, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $20B5, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $80, $CD, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $20CD, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $80, $D1, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $20D1, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $80, $E3, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $20E3, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $80, $FB, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $20FB, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $81, $0C, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $210C, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $81, $13, <DF_STRT_TRI, >DF_STRT_TRI                                                         ; SET PPU ADDR = $2103, DO-> DRAW DEFENSIVE STARTER TRIANGLES
	.DB $83, $CA, <TRI_ATTR, >TRI_ATTR                                                               ; SET PPU ADDR = $23CA, DO-> DEFENSIVE STARTER TRIANGLES ATTRIBUTES
	.DB $83, $DB, <UNDERLN_ATTR, >UNDERLN_ATTR                                                       ; SET PPU ADDR = $23CA, DO-> DEFENSIVE STARTER UNDERLINE ATTRIBUTES
	.DB $89, $6C                                                                                     ; SET PPU ADDR = $216C
	.DB      "DEFENSIVE LINE"                                                                        ; 
	.DB $99, $8C, $0E, $E6                                                                           ; SET PPU ADDR = $218C, REPEAT 14 TIMES (UNDERLINE TILE)
	.DB $89, $AF                                                                                     ; SET PPU ADDR = $21AF
	.DB      "RE"                                                                                    ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "NT"                                                                                    ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "LE"                                                                                    ;
	.DB $89, $E1                                                                                     ; SET PPU ADDR = $21E1
	.DB      "LINE BACKERS"                                                                          ;
	.DB $9A, $01, $0C, $E6                                                                           ; SET PPU ADDR = $218C, REPEAT 12 TIMES (UNDERLINE TILE)
	.DB $8A, $23                                                                                     ; SET PPU ADDR = $2223
	.DB      "ROLB"                                                                                  ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "RILB"                                                                                  ;
	.DB $B0                                                                                          ; DOWN 1 ROW     
	.DB      "LILB"                                                                                  ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "LOLB"                                                                                  ;
	.DB $8A, $C7                                                                                     ; SET PPU ADDR = $22C7
	.DB      "DEFENSIVE BACKS"                                                                       ;
	.DB $9A, $E7, $0F, $E6                                                                           ; SET PPU ADDR = $218C, REPEAT 15 TIMES (UNDERLINE TILE)
	.DB $8B, $0A                                                                                     ; SET PPU ADDR = $230A
	.DB      "RCB"                                                                                   ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "LCB"                                                                                   ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      " FS"                                                                                   ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      " SS"                                                                                   ; 
	.DB $FF                                                                                          ; END

DF_STRT_TIT:                                                                                         ; DRAW FOOTBALLS + "DEFENSIVE STARTERS" TEXT
	.DB $0F                                                                                          ; LENGTH =15
	.DB $C4                                                                                       ; LEFT FOOTBALL
	.DB " DF STARTERS "                                                                           ;
	.DB $C5                                                                                       ; RIGHT FOOTBALL
	.DB $FF                                                                                          ; END

DF_STRT_TRI:                                                                                         ; DRAW DEFENSIVE STARTER TRIANGLES
	.DB $02                                                                                          ; LENGTH = 2 
	.DB $E8, $E9                                                                                  ; TRIANGLE TILES
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $03                                                                                          ; LENGTH = 3  
	.DB $EA, $EB, $EE                                                                             ; TRIANGLE SHADOW TILES
	.DB $FF                                                                                          ; END

TRI_ATTR:                                                                                            ; DEFENSIVE STARTER TRIANGLES ATTRIBUTES
	.DB $04                                                                                          ; LENGTH = 4
	.DB $AA, $A5, $A5, $AA                                                                        ;
	.DB $FF                                                                                          ; END

UNDERLN_ATTR:                                                                                        ; DEFENSIVE STARTER UNDERLINE ATTRIBUTES
	.DB $09                                                                                          ; LENGTH = 9 
	.DB $05, $05, $05, $01, $00                                                                   ;
	.DB $0A, $0A, $0A, $02                                                                        ;
	.DB $FF                                                                                          ; END
	
_F}_DEFENSIVE_STARTERS_SCREEN_SCRIPT	

_F{_PLAY_BOOK_SCREEN_SCRIPTS

PLAY_BOOK_SCREEN_SCRIPT:                                                                             ; 0X1E DRAW PLAYBOOK SCREEN
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()    
	.DB $88, $45                                                                                     ; SET PPU ADDR = $2045
	.DB      "PLAY BOOK"                                                                             ;
	.DB $8B, $74                                                                                     ; SET PPU ADDR = $2074
	.DB      "DATA RESET"                                                                            ;
	.DB $FD, <PLAY_SELECT_BG_SCRIPT, > PLAY_SELECT_BG_SCRIPT                                         ; DO->DRAW PLAY SELECT BACKGROUND
	.DB $FF                                                                                          ; END

RUN_PLAY_BOOK_CHANGE_SCREEN_SCRIPT:                                                                  ; 0X1F DRAW PLAYBOOK RUN CHANGE BG
	.DB $F2                                                                                          ; SET GAME STATUS AND PPU MIRRORING = VERTICAL
	.DB $A3, $E0, $01, $08, $50                                                                      ; SET PPU ADDR = $23E0, ROWS =1, LENGTH = 8, ATTR VALUE = 50
	.DB $A3, $E8, $01, $10, $55                                                                      ; SET PPU ADDR = $23E8, ROWS =1, LENGTH = 16, ATTR VALUE = 55
	.DB $A7, $E0, $01, $18, $55                                                                      ; SET PPU ADDR = $27E0, ROWS =1, LENGTH = 8, ATTR VALUE = 55
	.DB $9A, $20, $20, $8B                                                                           ; SET PPU ADDR = $27E0, REPEAT ACROSS 32 TIMES (3 COLORED STRIPE)
	.DB $82, $40, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2240, DO->DRAW PLAY BOX
	.DB $82, $48, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2248, DO->DRAW PLAY BOX
	.DB $82, $50, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2250, DO->DRAW PLAY BOX
	.DB $82, $58, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2258, DO->DRAW PLAY BOX
																									; OFFSCREEN RUN PLAY BOXES
	.DB $86, $40, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2640, DO->DRAW PLAY BOX
	.DB $86, $48, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2648, DO->DRAW PLAY BOX
	.DB $86, $50, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2650, DO->DRAW PLAY BOX
	.DB $86, $58, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2658, DO->DRAW PLAY BOX
	.DB $FF                                                                                          ; END

PASS_PLAY_BOOK_CHANGE_SCREEN_SCRIPT:                                                                 ; 0X20 DRAW PLAYBOOK PASS CHANGE BG
	.DB $F2                                                                                          ; SET GAME STATUS AND PPU MIRRORING = VERTICAL
	.DB $A3, $C8, $01, $10, $55                                                                      ; SET PPU ADDR = $23C8, ROWS =1, LENGTH = 16, ATTR VALUE = 55
	.DB $A7, $C8, $01, $10, $55                                                                      ; SET PPU ADDR = $27C8, ROWS =1, LENGTH = 16, ATTR VALUE = 55
	.DB $A3, $D8, $01, $08, $05                                                                      ; SET PPU ADDR = $23D8, ROWS =1, LENGTH = 08, ATTR VALUE = 05
	.DB $A7, $D8, $01, $08, $05                                                                      ; SET PPU ADDR = $27D8, ROWS =1, LENGTH = 08, ATTR VALUE = 05
	.DB $98, $60, $20, $8B                                                                           ; SET PPU ADDR = $2060, REPEAT ACROSS 32 TIMES (3 COLORED STRIPE)
	.DB $99, $C0, $20, $8B                                                                           ; SET PPU ADDR = $21C0, REPEAT ACROSS 32 TIMES (3 COLORED STRIPE)
	.DB $80, $80, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2280, DO->DRAW PLAY BOX
	.DB $80, $88, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2288, DO->DRAW PLAY BOX
	.DB $80, $90, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2290, DO->DRAW PLAY BOX
	.DB $80, $98, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2298, DO->DRAW PLAY BOX
																									; OFFSCREEN PASS PLAY BOXES
	.DB $84, $80, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2480, DO->DRAW PLAY BOX
	.DB $84, $88, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2488, DO->DRAW PLAY BOX
	.DB $84, $90, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2490, DO->DRAW PLAY BOX
	.DB $84, $98, <PB_RECT, >PB_RECT                                                                 ; SET PPU ADDR = $2498, DO->DRAW PLAY BOX
	.DB $FF                                                                                          ; END

PB_RECT:                                                                                             ; DRAW PLAY BOX
	.DB $01, $89                                                                                     ; LENGTH 1, TOP LEFT CORNER 
	.DB $86, $86                                                                                     ; REPEAT TILE (6 TIMES, TOP HORIZ PLAY BOX TILE)
	.DB $01, $87                                                                                     ; LENGTH 1, TOP RIGHT CORNER
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $82                                                                                     ; LENGTH 1, LEFT VERT LINE
	.DB $86, $01                                                                                     ; REPEAT TILE (6 TIMES, GRASS TILE)
	.DB $01, $27                                                                                     ; LENGTH 1, RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $82                                                                                     ; LENGTH 1, LEFT VERT LINE
	.DB $86, $01                                                                                     ; REPEAT TILE (6 TIMES, GRASS TILE)
	.DB $01, $27                                                                                     ; LENGTH 1, RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $82                                                                                     ; LENGTH 1, LEFT VERT LINE
	.DB $86, $01                                                                                     ; REPEAT TILE (6 TIMES, GRASS TILE)
	.DB $01, $27                                                                                     ; LENGTH 1, RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $82                                                                                     ; LENGTH 1, LEFT VERT LINE
	.DB $86, $01                                                                                     ; REPEAT TILE (6 TIMES, GRASS TILE)
	.DB $01, $27                                                                                     ; LENGTH 1, RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $82                                                                                     ; LENGTH 1, LEFT VERT LINE
	.DB $86, $01                                                                                     ; REPEAT TILE (6 TIMES, GRASS TILE)
	.DB $01, $27                                                                                     ; LENGTH 1, RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $82                                                                                     ; LENGTH 1, LEFT VERT LINE
	.DB $86, $01                                                                                     ; REPEAT TILE (6 TIMES, GRASS TILE)
	.DB $01, $27                                                                                     ; LENGTH 1, RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $82                                                                                     ; LENGTH 1, LEFT VERT LINE
	.DB $86, $01                                                                                     ; REPEAT TILE (6 TIMES, GRASS TILE)
	.DB $01, $27                                                                                     ; LENGTH 1, RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $82                                                                                     ; LENGTH 1, LEFT VERT LINE
	.DB $86, $01                                                                                     ; REPEAT TILE (6 TIMES, GRASS TILE)
	.DB $01, $27                                                                                     ; LENGTH 1, RIGHT VERT LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $8A                                                                                     ; LENGTH 1, BOT LEFT CORNER
	.DB $86, $83                                                                                     ; REPEAT TILE (6 TIMES, BOT HORIZ LINE)
	.DB $01, $2D                                                                                     ; LENGTH 1, BOT RIGHT CORNER
	.DB $FF                                                                                          ; END
	
_F}_PLAY_BOOK_SCREEN_SCRIPTS	

_F{_PRO_BOWL_TEAM_DATA_SCREEN_SCRIPT

PRO_BOWL_TEAM_DATA_SCREEN_SCRIPT:                                                                    ; 0X21 DRAW PRO BOWL MENU TEXT AND POSITIONS
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $D0, $18, $00                                                                                ; SET IRQ0 BG CHR BANKS = ()
	.DB $FD, <PRO_BOWL_MENU, >PRO_BOWL_MENU                                                          ; DO->DRAW PRO BOWL MENU TEXT
	.DB $89, $61                                                                                     ; SET PPU ADDR = $2161
	.DB      "QB"                                                                                    ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "RB"                                                                                    ;
	.DB $B3                                                                                          ; DOWN 4 ROWS
	.DB      "WR"                                                                                    ;
	.DB $B3                                                                                          ; DOWN 4 ROWS
	.DB      "TE"                                                                                    ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "C"                                                                                     ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "G"                                                                                     ;
	.DB $B1                                                                                          ; DOWN 2 ROWSA
	.DB      "T"                                                                                     ; 
	.DB $89, $B1                                                                                     ; SET PPU ADDR = $21B1
	.DB      "DE"                                                                                    ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "NT"                                                                                    ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "DE"                                                                                    ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "LB"                                                                                    ;
	.DB $B3                                                                                          ; DOWN 4 ROWS
	.DB      "CB"                                                                                    ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "S"                                                                                     ;
	.DB $B2                                                                                          ; DOWN 3 ROWS
	.DB      "K"                                                                                     ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "P"                                                                                     ;
	.DB $FF                                                                                          ; END
	
_F}_PRO_BOWL_TEAM_DATA_SCREEN_SCRIPT	

_F{_REDRAW_PROBOWL_MENU_SCREEN_SCRIPT

REDRAW_PROBOWL_MENU_SCREEN_SCRIPT:                                                                   ; 0X22 CLEAR AND REDRAW PRO BOWL MENU TEXT 
	.DB $A0, $40, $06, $20, $00                                                                      ; FILL BOX (ADDR=2040, Y=6, X=32, BLANK TILE)
	.DB $A3, $C0, $01, $08, $00                                                                      ; FILL BOX (ADDR=23C0, Y=1, X=8, BLANK TILE) = SET ATTRIBUTE TABLE 
	.DB $FD, <PRO_BOWL_MENU, > PRO_BOWL_MENU                                                         ; DO->DRAW PRO BOWL MENU TEXT
	.DB $FF                                                                                          ; RETURN

PRO_BOWL_MENU:                                                                                       ; DRAW PRO BOWL MENU TEXT
	.DB $88, $42                                                                                     ; SET PPU ADDR = $2042
	.DB $19, $1C, $1B, $19, $1C, $1B                                                                 ; STARS( RED, BLUE, WHITE, RED, BLUE, WHITE)
	.DB $88, $49                                                                                     ; SET PPU ADDR = $2049
	.DB $D4                                                                                          ; DRAW CURRENT P1 TEAM CITY ABBREVIATION
	.DB $88, $4D                                                                                     ; SET PPU ADDR = $204D
	.DB      "ALL STARS "                                                                            ;
	.DB $19, $1C, $1B, $19, $1C, $1B                                                              ; STARS( RED, BLUE, WHITE, RED, BLUE, WHITE)
	.DB $88, $83                                                                                     ; SET PPU ADDR = $2083
	.DB      "PLAYERS DATA"                                                                          ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "CHANGE PLAYERS"                                                                        ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "RESET PLAYERS"                                                                         ;
	.DB $88, $93                                                                                     ; SET PPU ADDR = $2093
	.DB      "OF STARTERS"                                                                           ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "DF STARTERS"                                                                           ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "PLAY BOOKS"                                                                            ;
	.DB $99, $20, $0E, $5D                                                                           ; SET PPU ADDR = $2120, REPEAT ACROSS 14 TIMES (RED LINE)
	.DB $89, $2E                                                                                     ; SET PPU ADDR = $212E
	.DB      "ALL STARS"                                                                             ;
	.DB $99, $37, $09, $5D                                                                           ; SET PPU ADDR = $2120, REPEAT ACROSS 9 TIMES (RED LINE)
	.DB $FE                                                                                          ; RETURN
	
_F}_REDRAW_PROBOWL_MENU_SCREEN_SCRIPT	

UNUSED_STARS_SCRIPT:                                                                                 ; UNUSED ?
	.DB $06                                                                                          ; LENGTH =06
	.DB $19, $1B, $1C, $19, $1B, $1C                                                              ; STARS( RED, WHITE, BLUE, RED, WHITE, BLUE)
	.DB $FF                                                                                          ; END

_F{_PROBOWL_CHANGE_PLAYER_SCREEN_SCRIPT

PROBOWL_CHANGE_PLAYER_SCREEN_SCRIPT:                                                                 ; 0X23 CLEAR AND DRAW PRO BOWL "TEAM SELECT", AND TEAM NAME TEXT    
	.DB $A0, $40, $02, $16, $00                                                                      ; FILL BOX (ADDR=2040, Y=2, X=22, BLANK TILE) 
	.DB $A0, $80, $04, $10, $00                                                                      ; FILL BOX (ADDR=2080, Y=4, X=16, BLANK TILE)
	.DB $F5                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 08
	.DB $88, $B2                                                                                     ; SET PPU ADDR = $20B2
	.DB      "SELECT TEAM"                                                                           ;
	.DB $88, $D6                                                                                     ; SET PPU ADDR = $20D6
	.DB      $7C, $78, $79, $7D                                                                      ; TOP ROW OF CONTROLLER AND ARROW TILES 
	.DB $B0                                                                                          ; DOWN 1 ROW
	.DB      $7E, $7A, $7B, $7F                                                                      ; BOT ROW OF CONTROLLER AND ARROW TILES
	.DB $88, $41                                                                                     ; SET PPU ADDR = $2041
	.DB $FA, $08                                                                                     ; DRAW CURRENT TEAM CITY AND MASCOT CENTERED SMALL LETTERS()
	.DB $83, $C0, <PB_CHG_ATR, >PB_CHG_ATR                                                           ; SET PPU ADDR = $23C0, SET TEAM NAME AND POSITION TEXT COLOR
	.DB $FF                                                                                          ; END

PB_CHG_ATR:                                                                                          ; SET TEAM NAME AND POSITION TEXT COLOR
	.DB $08                                                                                          ; LENGTH = 8
	.DB $50, $50, $50, $50, $50, $90                                                              ; TEAM CITY AND NAME COLOR 
	.DB $A0, $A0                                                                                  ; POSITION COLOR
	.DB $FF                                                                                          ; END
	
_F}_PROBOWL_CHANGE_PLAYER_SCREEN_SCRIPT	

_F{_QB_DATA_SCREEN_SCRIPT

QB_DATA_SCREEN_SCRIPT:                                                                               ; 0X24 QB DATA SCREEN
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $88, $5A                                                                                     ; SET PPU ADDR = $205A
	.DB      "QB"                                                                                    ;
	.DB $89, $22                                                                                     ; SET PPU ADDR = $2122
	.DB      "PASSING"                                                                               ;
	.DB $99, $42, $07, $C7                                                                           ; SET PPU ADDR = $2142, REPEAT ACROSS 7 TIMES (RED UNDERLINE)
	.DB $89, $35                                                                                     ; SET PPU ADDR = $2135
	.DB      "RUSHING"                                                                               ;
	.DB $99, $55, $07, $C7                                                                           ; SET PPU ADDR = $2155, REPEAT ACROSS 7 TIMES (RED UNDERLINE)
	.DB $81, $61, <ATT_TEXT, >ATT_TEXT                                                             ; SET PPU ADDR = $2161, DO->DRAW UNDERLINED ATT.
	.DB $81, $69, <YDS_TEXT, >YDS_TEXT                                                               ; SET PPU ADDR = $2169, DO->DRAW UNDERLINED YDS.
	.DB $81, $75, <ATT_TEXT, >ATT_TEXT                                                             ; SET PPU ADDR = $2175, DO->DRAW UNDERLINED ATT.
	.DB $81, $81, <COMP_TEXT, >COMP_TEXT                                                             ; SET PPU ADDR = $2181, DO->DRAW UNDERLINED COMP.
	.DB $81, $89, <AVG_TEXT, >AVG_TEXT                                                               ; SET PPU ADDR = $2189, DO->DRAW UNDERLINED AVG.
	.DB $81, $95, <YDS_TEXT, >YDS_TEXT                                                               ; SET PPU ADDR = $2195, DO->DRAW UNDERLINED YDS.
	.DB $81, $A2, <TD_TEXT, >TD_TEXT                                                                 ; SET PPU ADDR = $21A2, DO->DRAW UNDERLINED TD.
	.DB $81, $A8, <COMP_PCT_TEXT, >COMP_PCT_TEXT                                                     ; SET PPU ADDR = $21A8, DO->DRAW UNDERLINED COMP%.
	.DB $81, $B5, <AVG_TEXT, >AVG_TEXT                                                               ; SET PPU ADDR = $21B5, DO->DRAW UNDERLINED AVG.
	.DB $81, $C2, <INT._TEXT, >INT._TEXT                                                             ; SET PPU ADDR = $21C2, DO->DRAW UNDERLINED INT.
	.DB $81, $C8, <RATING_TEXT, >RATING_TEXT                                                         ; SET PPU ADDR = $21C8, DO->DRAW UNDERLINED RATING.
	.DB $81, $D6, <TD_TEXT, >TD_TEXT                                                                 ; SET PPU ADDR = $21D6, DO->DRAW UNDERLINED TD.  
	.DB $8A, $C2                                                                                     ; SET PPU ADDR = $22C2
	.DB      "PASSING SPEED"                                                                         ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "PASS CONTROL"                                                                          ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "ACCURACY"                                                                              ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "AVOID"                                                                                 ;
	.DB $8B, $25                                                                                     ; SET PPU ADDR = $2325
	.DB      "OF PASSING"                                                                            ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "PASS BLOCK"                                                                            ; 
	.DB $83, $EC, <PASS_ATTR, >PASS_ATTR                                                             ; SET PPU ADDR = $23EC, SET PASSING SPEED AND PASS CONTROL BAR COLORS
	.DB $FC, <PLAYER_DATA, >PLAYER_DATA                                                              ; JUMP->

PASS_ATTR:                                                                                           ; SET PASSING SPEED AND PASS CONTROL BAR COLORS
	.DB $02                                                                                          ; LENGTH = 2 
	.DB $50, $50                                                                                  ; SET PASSING SPEED AND PASS CONTROL BARS TO BLUE
	.DB $FF                                                                                          ; END
	
_F}_QB_DATA_SCREEN_SCRIPT	

_F{_SKILL_PLAYER_DATA_SCREEN_SCRIPT

SKILL_PLAYER_DATA_SCREEN_SCRIPT:                                                                     ; 0X25 SKILL PLAYER DATA SCREEN
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $89, $21                                                                                     ; SET PPU ADDR = $2121
	.DB      "RUSHING RECEIVE"                                                                       ;
	.DB $89, $33                                                                                     ; SET PPU ADDR = $2133 
	.DB      "KR"
	.DB $89, $3A                                                                                     ; SET PPU ADDR = $213A
	.DB      "PR"                                                                                    ;
	.DB $99, $41, $07, $C7                                                                           ; SET PPU ADDR = $2141, REPEAT ACROSS 7 TIMES (RED UNDERLINE)
	.DB $99, $49, $07, $C7                                                                           ; SET PPU ADDR = $2149, REPEAT ACROSS 7 TIMES (RED UNDERLINE)
	.DB $99, $53, $02, $C7                                                                           ; SET PPU ADDR = $2153 REPEAT ACROSS 2 TIMES (RED UNDERLINE)
	.DB $99, $5A, $02, $C7                                                                           ; SET PPU ADDR = $215A, REPEAT ACROSS 2 TIMES (RED UNDERLINE)
	.DB $81, $61, <ATT_TEXT, >ATT_TEXT                                                               ; SET PPU ADDR = $2161, DO->DRAW UNDERLINED ATT.
	.DB $81, $6A, <NO_TEXT, >NO_TEXT                                                                 ; SET PPU ADDR = $216A, DO->DRAW UNDERLINED NO.
	.DB $81, $72, <NO_TEXT, >NO_TEXT                                                                 ; SET PPU ADDR = $2172, DO->DRAW UNDERLINED NO.
	.DB $81, $79, <NO_TEXT, >NO_TEXT                                                                 ; SET PPU ADDR = $2179, DO->DRAW UNDERLINED NO.
	.DB $81, $81, <YDS_TEXT, >YDS_TEXT                                                               ; SET PPU ADDR = $2181, DO->DRAW UNDERLINED YDS.
	.DB $81, $89, <YDS_TEXT, >YDS_TEXT                                                               ; SET PPU ADDR = $2189, DO->DRAW UNDERLINED YDS.
	.DB $81, $91, <YDS_TEXT, >YDS_TEXT                                                               ; SET PPU ADDR = $2191, DO->DRAW UNDERLINED YDS.
	.DB $81, $98, <YDS_TEXT, >YDS_TEXT                                                               ; SET PPU ADDR = $2198, DO->DRAW UNDERLINED YDS.
	.DB $81, $A1, <AVG_TEXT, >AVG_TEXT                                                               ; SET PPU ADDR = $21A1, DO->DRAW UNDERLINED AVG.
	.DB $81, $A9, <AVG_TEXT, >AVG_TEXT                                                               ; SET PPU ADDR = $21A9, DO->DRAW UNDERLINED AVG.
	.DB $81, $B1, <AVG_TEXT, >AVG_TEXT                                                               ; SET PPU ADDR = $21B1, DO->DRAW UNDERLINED AVG.
	.DB $81, $B8, <AVG_TEXT, >AVG_TEXT                                                               ; SET PPU ADDR = $21B8, DO->DRAW UNDERLINED AVG.
	.DB $81, $C2, <TD_TEXT, >TD_TEXT                                                                 ; SET PPU ADDR = $21C2, DO->DRAW UNDERLINED TD.
	.DB $81, $CA, <TD_TEXT, >TD_TEXT                                                                 ; SET PPU ADDR = $21CA, DO->DRAW UNDERLINED TD.
	.DB $81, $D2, <TD_TEXT, >TD_TEXT                                                                 ; SET PPU ADDR = $21D2, DO->DRAW UNDERLINED TD.
	.DB $81, $D9, <TD_TEXT, >TD_TEXT                                                                 ; SET PPU ADDR = $21D9, DO->DRAW UNDERLINED TD.
	.DB $8B, $02                                                                                     ; SET PPU ADDR = $2302
	.DB      "BALL CONTROL"                                                                          ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "RECEPTIONS"                                                                            ; 
	.DB $FC, <PLAYER_DATA, >PLAYER_DATA
	
_F}_SKILL_PLAYER_DATA_SCREEN_SCRIPT	

_F{_OFF_LINE_DATA_SCREEN_SCRIPT

OFF_LINE_DATA_SCREEN_SCRIPT:                                                                         ; 0X26 OL PLAYER DATA SCREEN
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $FC, <PLAYER_DATA, >PLAYER_DATA                                                              ; JUMP->DRAW PLAYER DATA COMMON TO ALL PLAYERS (TEAM, PORTRAIT BG, ABILITIES)

_F}_OFF_LINE_DATA_SCREEN_SCRIPT

_F{_DEFENDER_DATA_SCREEN_SCRIPT

DEFENDER_DATA_SCREEN_SCRIPT:                                                                         ; 0X27 DEFENDER PLAYER DATA SCREEN 
	.DB $ED                                                                                       ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $89, $25                                                                                     ; SET PPU ADDR = $2125
	.DB      "QB SACKS"                                                                              ;
	.DB $89, $31                                                                                     ; SET PPU ADDR = $2131
	.DB      "INTERCEPTION"                                                                          ;
	.DB $99, $45, $08, $C7                                                                           ; SET PPU ADDR = $2145, REPEAT ACROSS 8 TIMES (RED UNDERLINE)
	.DB $99, $51, $0C, $C7                                                                           ; SET PPU ADDR = $2151, REPEAT ACROSS 12 TIMES (RED UNDERLINE)
	.DB $81, $65, <SACKS_TEXT, >SACKS_TEXT                                                           ; SET PPU ADDR = $2165, DO->DRAW UNDERLINED SACKS.
	.DB $81, $74, <NO_TEXT, >NO_TEXT                                                                 ; SET PPU ADDR = $2174, DO->DRAW UNDERLINED NO.
	.DB $81, $93, <YDS_TEXT, >YDS_TEXT                                                               ; SET PPU ADDR = $2193, DO->DRAW UNDERLINED YDS.
	.DB $81, $B3, <AVG_TEXT, >AVG_TEXT                                                               ; SET PPU ADDR = $21B3, DO->DRAW UNDERLINED AVG.
	.DB $81, $D4, <TD_TEXT, >TD_TEXT                                                                 ; SET PPU ADDR = $21D4, DO->DRAW UNDERLINED TD.
	.DB $8A, $E2                                                                                     ; SET PPU ADDR = $22E2
	.DB      "PASS"                                                                                  ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "INTERCEPTIONS"                                                                         ;
	.DB $B0                                                                                          ; DOWN 1 ROW      
	.DB      "QUICKNESS"                                                                             ;
	.DB $FC, <PLAYER_DATA, >PLAYER_DATA                                                              ; JUMP->DRAW PLAYER DATA COMMON TO ALL PLAYERS (TEAM, PORTRAIT BG, ABILITIES)

_F}_DEFENDER_DATA_SCREEN_SCRIPT	

_F{_KICKER_DATA_SCREEN_SCRIPT

KICKER_DATA_SCREEN_SCRIPT:                                                                           ; 0X28 KICKER PLAYER DATA SCREEN
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $81, $65, <XP_ATT_TEXT, >XP_ATT_TEXT                                                         ; SET PPU ADDR = $2165, DO->DRAW XP/ATT.
	.DB $81, $72, <FG_ATT_TEXT, >FG_ATT_TEXT                                                         ; SET PPU ADDR = $2172, DO->DRAW UNFG/ATT.
	.DB $81, $A7, <PTS_TEXT, >PTS_TEXT                                                               ; SET PPU ADDR = $21A7, DO->DRAW UNDERLINED PTA.
	.DB $81, $6D, <SLASH_TEXT, >SLASH_TEXT                                                           ; SET PPU ADDR = $216D, DO->DRAW SLASH FOR FG/XP STATS
	.DB $81, $7A, <SLASH_TEXT, >SLASH_TEXT                                                           ; SET PPU ADDR = $217A, DO->DRAW SLASH FOR FG/XP STATS
	.DB $FC, <KICK_DATA, >KICK_DATA                                                                  ; JUMP->DRAW KICKER SKILLS TEXT AND COMMON PLAYER DATA TEXT


SLASH_TEXT:                                                                                          ; DRAW SLASH FOR FG/XP STATS
	.DB $01                                                                                          ; LENGTH =1
	.DB $C5                                                                                       ; "/" 
	.DB $FF                                                                                          ; END

_F}_KICKER_DATA_SCREEN_SCRIPT

_F{_PUNTER_DATA_SCREEN_SCRIPT

PUNTER_DATA_SCREEN_SCRIPT:
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $89, $42                                                                                     ; SET PPU ADDR = $2142
	.DB      "PUNTING"                                                                               ;
	.DB $99, $42, $07, $C7                                                                           ; SET PPU ADDR = $2142, REPEAT ACROSS 7 TIMES (RED UNDERLINE)
	.DB $81, $83, <NO_TEXT, >NO_TEXT                                                                 ; SET PPU ADDR = $2183, DO->DRAW NO.
	.DB $81, $8A, <YDS_TEXT, >YDS_TEXT                                                               ; SET PPU ADDR = $218A, DO->DRAW YDS.
	.DB $81, $94, <AVG_TEXT, >AVG_TEXT                                                               ; SET PPU ADDR = $2194, DO->DRAW AVG.

_F}_PUNTER_DATA_SCREEN_SCRIPT	

_F{_KICK_DATA_TEXT_SCRIPT	

KICK_DATA:                                                                                           ; DRAW KICKER SKILLS TEXT AND COMMON PLAYER DATA TEXT
	.DB $8A, $E2                                                                                     ; SET PPU ADDR = $22E2
	.DB      "KICKING"                                                                               ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "AVOID"                                                                                 ;
	.DB $8B, $08                                                                                     ; SET PPU ADDR = $2308
	.DB      "ABILITY"                                                                               ;
	.DB $8B, $45                                                                                     ; SET PPU ADDR = $2345
	.DB      "KICK BLOCK"                                                                            ;
	
_F}_KICK_DATA_TEXT_SCRIPT		

_F{_PLAYER_DATA_COMMON_SCRIPT	

PLAYER_DATA:                                                                                         ; DRAW PLAYER DATA COMMON TO ALL PLAYERS (TEAM, PORTRAIT BG, ABILITIES)
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $D0, $20, $2E                                                                                ; SET IRQ0 BG CHR BANKS = (20,2E)
	.DB $88, $42                                                                                     ; SET PPU ADDR = $2042
	.DB $FA, $08                                                                                     ; DRAW CURRENT TEAM CITY AND MASCOT CENTERED SMALL LETTERS()
	.DB $80, $84, <FACE_BG, >FACE_BG                                                                 ; SET PPU ADDR = $2084, DO->DRAW BACKGROUND FOR PLAYER FACE PORTRAIT
	.DB $A8, $8D, $3B                                                                                ; SET PPU ADDR = $2084,
	.DB $88, $CB                                                                                     ; SET PPU ADDR = $20CB
	.DB      "PHYSICAL"                                                                              ;
	.DB $B0                                                                                          ; DOWN 1 ROW
	.DB      "CONDITION:"                                                                            ;
	.DB $8A, $0C                                                                                     ; SET PPU ADDR = $220C
	.DB      "ABILITY"                                                                               ;
	.DB $9A, $2C, $07, $C7                                                                           ; SET PPU ADDR = $222C, REPEAT ACROSS 7 TIMES (BLUE UNDERLINE UNDER ABILITY)
	.DB $8A, $42                                                                                     ; SET PPU ADDR = $2242
	.DB      "RUNNING SPEED"                                                                         ;
	.DB $B0                                                                                          ; DOWN 1 ROW
	.DB      "RUSHING POWER"                                                                         ;
	.DB $B0                                                                                          ; DOWN 1 ROW
	.DB      "MAXIMUM SPEED"                                                                         ;
	.DB $B0                                                                                          ; DOWN 1 ROW
	.DB      "HITTING POWER"                                                                         ;
	.DB $83, $C9, <FACE_ATTR, >FACE_ATTR                                                             ; SET PPU ADDR = $23C9, DO->SET COLORS FOR PLAYER FACE BACKGROUND 
	.DB $83, $F4, <BLU_SKL_ATTR, >BLU_SKL_ATTR                                                       ; SET PPU ADDR = $23C9, DO->SET COLORS FOR LAST TWO PLAYER SKILLS 
	.DB $83, $E3, <ABIL_ATTR, >ABIL_ATTR                                                             ;; SET PPU ADDR = $23C9, DO->SET COLORS FOR ABILITY UNDERLINE TO BLUE 
	.DB $FF                                                                                          ; END

FACE_ATTR:                                                                                           ; SET COLORS FOR PLAYER FACE BACKGROUND
	.DB $02                                                                                          ; LENGTH = 2
	.DB $AA, $11                                                                                  ; BACKGROUND AND SHOULDER PADS
	.DB $E6                                                                                          ; MOVE RIGHT 6 ATTRIB TILES
	.DB $02                                                                                          ; LENGTH = 2
	.DB $05, $01                                                                                  ; SET PORTRAIT SHADOW AND PART OF PASSING TEXT COLOT
	.DB $FF                                                                                          ; END

BLU_SKL_ATTR:                                                                                        ; SET COLORS FOR LAST TWO PLAYER SKILLS TO BLUE
	.DB $02                                                                                          ; LENGTH = 2
	.DB $55, $55                                                                                  ; SET LAST TWO SKILLS TO BLUE
	.DB $FF                                                                                          ; END

ABIL_ATTR:                                                                                           ; SET COLORS FOR ABILITY UNDERLINE
	.DB $02                                                                                          ; LENGTH = 2
	.DB $05, $05                                                                                  ; SET ABILITY UNDERLINE TO BLUE
	.DB $FF                                                                                          ; END

FACE_BG:                                                                                             ; DRAW BACKGROUND FOR PLAYER FACE PORTRAIT
	.DB $04, $01, $01, $01, $01                                                                      ; LENGTH = 4, BLANK TILE X 4 
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $05, $01, $01, $01, $01, $01                                                                 ; LENGTH = 5, BLANK TILE X 5
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $05, $01, $01, $01, $01, $01                                                                 ; LENGTH = 5, BLANK TILE X 5
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $05, $F8, $01, $01, $F9, $01                                                                 ; LENGTH = 5, BLANK,LEFT SHOULDER PAD, BLANK X2, RIGHT SHOULDER PAD
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $05, $00, $01, $01, $01, $01                                                                 ; LENGTH = 5, BLANK TILE X 5
	.DB $FF                                                                                          ; END
	
_F}_PLAYER_DATA_COMMON_SCRIPT	

_F{_PLAYER_STAT_TEXT_DATA	

ATT_TEXT:                                                                                            ; DRAW UNDERLINED ATT.
	.DB $03                                                                                          ; LENGTH = 3 
	.DB $C8, $C9, $CA                                                                             ; SMALL "ATT." UNDERLINED
	.DB $FF                                                                                          ; END

YDS_TEXT:                                                                                            ; DRAW UNDERLINED YDS.
	.DB $03                                                                                          ; LENGTH = 3
	.DB $CF, $D0, $D1                                                                                ; SMALL "YDS." UNDERLINED
	.DB $FF                                                                                          ; END

COMP_TEXT:                                                                                           ; DRAW UNDERLINED COMP.
	.DB $03                                                                                          ; LENGTH = 3
	.DB $CB, $CC, $CD                                                                                ; SMALL "COMP." UNDERLINED
	.DB $FF                                                                                          ; END

AVG_TEXT:                                                                                           ; DRAW UNDERLINED AVG.
	.DB $03                                                                                          ; LENGTH = 3
	.DB $D2, $D3, $D5                                                                             ; SMALL "AVG." UNDERLINED
	.DB $FF                                                                                          ; END

TD_TEXT:                                                                                             ; DRAW UNDERLINED TD.
	.DB $02                                                                                          ; LENGTH = 2
	.DB $D6, $D7                                                                                     ; SMALL "TD." UNDERLINED
	.DB $FF                                                                                          ; END

COMP_PCT_TEXT:                                                                                       ; DRAW UNDERLINED COMP%.
	.DB $04                                                                                          ; LENGTH = 4
	.DB $CB, $CC, $CD, $CE                                                                          ; SMALL "COMP%." UNDERLINED
	.DB $E6                                                                                          ; MOVE RIGHT 6 TILES
	.DB $01, $C4                                                                                     ; LENGTH 1 , "%"
	.DB $FF                                                                                          ; END

INT._TEXT:                                                                                           ; DRAW UNDERLINED INT.
	.DB $02                                                                                          ; LENGTH = 2
	.DB $D8, $D9                                                                                     ; SMALL "INT." UNDERLINED
	.DB $FF                                                                                          ; END

RATING_TEXT                                                                                          ; DRAW UNDERLINED RATING.
	.DB $04                                                                                          ; LENGTH 4
	.DB $DA, $DB, $DC, $DD                                                                           ; SMALL "RATING" UNDERLINED
	.DB $E3                                                                                          ; MOVE RIGHT (3 TILES)
	.DB $01, $2E                                                                                     ; UNEEDED DRAWN ELSEWHERE
	.DB $FF                                                                                          ; END

AF8E:                                                                                                ; DUPLICATE *** unused
	.DB $02                                                                                          ; LENGTH = 2
	.DB $D6, $D7                                                                                     ; SMALL "NO." UNDERLINED
	.DB $FF                                                                                          ; END

NO_TEXT:                                                                                             ; DRAW UNDERLINED NO.
	.DB $02                                                                                          ; LENGTH = 2
	.DB $EE, $EF                                                                                  ; SMALL "NO." UNDERLINED
	.DB $FF                                                                                          ; END

XP_ATT_TEXT:                                                                                         ; DRAW UNDERLINED XP/ATT.
	.DB $05                                                                                          ; LENGTH = 5
	.DB $DE, $DF, $C8, $C9, $CA                                                                   ; SMALL "FG/ATT." UNDERLINED
	.DB $FF                                                                                          ; END

FG_ATT_TEXT:                                                                                         ; DRAW UNDERLINED FG/ATT.
	.DB $05                                                                                          ; LENGTH = 5
	.DB $E0, $E1, $C8, $C9, $CA                                                                   ; SMALL "FG/ATT." UNDERLINED
	.DB $FF                                                                                          ; END

PTS_TEXT:                                                                                            ; DRAW UNDERLINED PTS.
	.DB $03                                                                                          ; LENGTH = 3 
	.DB $E6, $E7, $E8                                                                             ; SMALL "PTS." UNDERLINED
	.DB $FF                                                                                          ; END

SACKS_TEXT:                                                                                          ; DRAW UNDERLINED SACKS.
	.DB $04                                                                                          ; LENGTH = 4
	.DB $E9, $EA, $EB, $EC                                                                        ; SMALL "SACKS" UNDERLINED 
	.DB $FF                                                                                          ; END
	
_F}_PLAYER_STAT_TEXT_DATA	

_F{_CONFERENCE_AND_DIVISION_TEXT_SCRIPTS	

AFC_EAST_TEXT_SCREEN_SCRIPT:                                                                         ; 0X2A DRAW AFC EASTERN TEXT
	.DB $FD, <DRAW_AFC_TEXT_SCRIPT, >DRAW_AFC_TEXT_SCRIPT                                            ; DO-> DRAW AFC TEXT
	.DB $FC, <DRAW_EASTERN_TEXT_SCRIPT, >DRAW_EASTERN_TEXT_SCRIPT                                    ; JUMP-> DRAW EASTERN TEXT

AFC_CENTRAL_TEXT_SCREEN_SCRIPT:                                                                      ; 0X2B DRAW AFC CENTRAL TEXT
	.DB $FD, <DRAW_AFC_TEXT_SCRIPT, >DRAW_AFC_TEXT_SCRIPT                                            ; DO-> DRAW AFC TEXT
	.DB $FC, <DRAW_CENTRAL_TEXT_SCRIPT, >DRAW_CENTRAL_TEXT_SCRIPT                                    ; JUMP-> DRAW CENTRAL TEXT

AFC_WEST_TEXT_SCREEN_SCRIPT:                                                                         ; 0X2C DRAW AFC WESTERN TEXT
	.DB $FD, <DRAW_AFC_TEXT_SCRIPT, >DRAW_AFC_TEXT_SCRIPT                                            ; DO-> DRAW AFC TEXT
	.DB $FC, <DRAW_WESTERN_TEXT_SCRIPT, >DRAW_WESTERN_TEXT_SCRIPT                                    ; JUMP-> DRAW WESTERN TEXT
	
NFC_EAST_TEXT_SCREEN_SCRIPT:                                                                         ; 0X2D DRAW NFC EASTERN TEXT
	.DB $FD, <DRAW_NFC_TEXT_SCRIPT, >DRAW_NFC_TEXT_SCRIPT                                            ; DO-> DRAW NFC TEXT
	.DB $FC, <DRAW_EASTERN_TEXT_SCRIPT, >DRAW_EASTERN_TEXT_SCRIPT                                    ; JUMP-> DRAW EASTERN TEXT

NFC_CENTRAL_TEXT_SCREEN_SCRIPT:                                                                      ; 0X2E DRAW NFC CENTRAL TEXT
	.DB $FD, <DRAW_NFC_TEXT_SCRIPT, >DRAW_NFC_TEXT_SCRIPT                                            ; DO-> DRAW CFC TEXT
	.DB $FC, <DRAW_CENTRAL_TEXT_SCRIPT, >DRAW_CENTRAL_TEXT_SCRIPT                                    ; JUMP-> DRAW CENTRAL TEXT

NFC_WEST_TEXT_SCREEN_SCRIPT:                                                                         ; 0X2F DRAW NFC WESTERN TEXT
	.DB $FD, <DRAW_NFC_TEXT_SCRIPT, >DRAW_NFC_TEXT_SCRIPT                                            ; DO-> DRAW NFC TEXT
	.DB $FC, <DRAW_WESTERN_TEXT_SCRIPT, >DRAW_WESTERN_TEXT_SCRIPT                                    ; JUMP-> DRAW WESTERN TEXT

DRAW_AFC_TEXT_SCRIPT:                                                                                ; DRAW AFC TEXT    
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $88, $49                                                                                     ; SET PPU ADDR = $2049
	.DB      "AFC"                                                                                   ;
	.DB $88, $82                                                                                     ; SET PPU ADDR = $2082
	.DB $FE                                                                                          ; RETURN

DRAW_NFC_TEXT_SCRIPT:                                                                                ; DRAW NFC TEXT
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $88, $49                                                                                     ; SET PPU ADDR = $2049
	.DB      "NFC"                                                                                   ; 
	.DB $88, $82                                                                                     ; SET PPU ADDR = $2082
	.DB $FE                                                                                          ; RETURN

DRAW_EASTERN_TEXT_SCRIPT:                                                                            ; DRAW EASTERN TEXT
	.DB      "EASTERN"                                                                               ;
	.DB $FF                                                                                          ; END
	
DRAW_CENTRAL_TEXT_SCRIPT:                                                                            ; DRAW CENTRAL TEXT
	.DB      "CENTRAL"                                                                               ;
	.DB $FF                                                                                          ; END

DRAW_WESTERN_TEXT_SCRIPT:                                                                            ; DRAW WESTERN TEXT
	.DB      "WESTERN"                                                                               ;
	.DB $FF                                                                                          ; END
	
_F}_CONFERENCE_AND_DIVISION_TEXT_SCRIPTS	

_F{_DIVISION_STANDING_SCREEN_SCRIPTS

DRAW_FOUR_TEAM_STANDING_SCREEN_SCRIPT:                                                               ; 0X30 DRAW FIVE DIVISION SCREEN
	.DB $82, $E1, <BOTTOM_ROW_STANDINGS_SCRIPT, >BOTTOM_ROW_STANDINGS_SCRIPT                                                                       ; SET PPU ADDR = $22E1, DO->DRAW BOTTOM ROW OF STANDINGS GRID 
	.DB $FC, <STANDINGS_GRID_SCRIPT, >STANDINGS_GRID_SCRIPT                                                                            ; JUMP->DRAW STANDINGS GRID PLUS COLLUMN TEXT


DRAW_FIVE_TEAM_STANDING_SCREEN_SCRIPT:                                                               ; 0X31 DRAW FIVE DIVISION SCREEN
																									; DRAW ROW FOR 5TH TEAM
	.DB $82, $E1, <ONE_ROW_OF_STANDINGS_GRID_SCRIPT, >ONE_ROW_OF_STANDINGS_GRID_SCRIPT               ; SET PPU ADDR = $22E1, DO->DRAW ONE ROW OF STANDINGS GRID
																									; DRAW COLLUMNS FOR 5TH TEAM
	.DB $83, $01, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2301, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $83, $21, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2321, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $83, $41, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2341, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $83, $61, <BOTTOM_ROW_STANDINGS_SCRIPT, >BOTTOM_ROW_STANDINGS_SCRIPT                                                                       ; SET PPU ADDR = $2361, DO->DRAW BOTTOM ROW OF STANDINGS GRID

STANDINGS_GRID_SCRIPT:                                                                                                ; DRAW STANDINGS GRID PLUS COLLUMN TEXT
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $D0, $18, $7A                                                                                ; SET IRQ0 BG CHR BANKS = (18,7A) = TEXT+ HELMETS
	.DB $88, $97                                                                                     ; SET PPU ADDR = $2097
	.DB $FA, $09                                                                                     ; DRAW CURRENT WEEK
	.DB $88, $45                                                                                     ; SET PPU ADDR = $2045
	.DB      $19, $1C, $19                                                                           ; RED STAR, WHITE STAR, RED STAR
	.DB $88, $4D                                                                                     ; SET PPU ADDR = $204D
	.DB      "STANDINGS "                                                                            ;
	.DB $19, $1C, $19                                                                             ; RED STAR, WHITE STAR, RED STAR
	.DB $88, $8A                                                                                     ; SET PPU ADDR = $208A
	.DB      "DIVISION"                                                                              ;
	.DB $88, $9A                                                                                     ; SET PPU ADDR = $209A
	.DB      "WEEK"                                                                                  ;
	.DB $80, $A1, <TOP_OF_STANDINGS_GRID_SCRIPT, >TOP_OF_STANDINGS_GRID_SCRIPT                       ; SET PPU ADDR = $20A1, DO->DRAW TOP OF STANDINGS GRID
	.DB $80, $C1, <STANDINGS_HEADER_SCRIPT, >STANDINGS_HEADER_SCRIPT                                                                       ; SET PPU ADDR = $20C1, DO->STANDINGS (R,W,L,T,PCT,PTS,OP) TEXT + LINE DIVIDERS
	.DB $80, $E1, <ONE_ROW_OF_STANDINGS_GRID_SCRIPT, >ONE_ROW_OF_STANDINGS_GRID_SCRIPT               ; SET PPU ADDR = $20E1, DO->DRAW ONE ROW OF STANDINGS GRID
	.DB $81, $01, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2101, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $81, $21, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2121, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $81, $41, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2141, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $81, $61, <ONE_ROW_OF_STANDINGS_GRID_SCRIPT, >ONE_ROW_OF_STANDINGS_GRID_SCRIPT               ; SET PPU ADDR = $2161, DO->DRAW ONE ROW OF STANDINGS GRID
	.DB $81, $81, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2181, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $81, $A1, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $21A1, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $81, $C1, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $21C1, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $81, $E1, <ONE_ROW_OF_STANDINGS_GRID_SCRIPT, >ONE_ROW_OF_STANDINGS_GRID_SCRIPT               ; SET PPU ADDR = $21E1, DO->DRAW ONE ROW OF STANDINGS GRID
	.DB $82, $01, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2201, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $82, $21, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2221, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $82, $41, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2241, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $82, $61, <ONE_ROW_OF_STANDINGS_GRID_SCRIPT, >ONE_ROW_OF_STANDINGS_GRID_SCRIPT               ; SET PPU ADDR = $2261, DO->DRAW ONE ROW OF STANDINGS GRID
	.DB $82, $81, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $2281, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $82, $A1, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $22A1, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $82, $C1, <ONE_ROW_OF_STAND_COL_LINES_SCRIPT, >ONE_ROW_OF_STAND_COL_LINES_SCRIPT             ; SET PPU ADDR = $22C1, DO->DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES
	.DB $EB, $14, $23                                                                                ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG,SPR PAL INDEX)
	.DB $FF                                                                                          ; END

TOP_OF_STANDINGS_GRID_SCRIPT:                                                                        ; DRAW TOP OF STANDINGS GRID
	.DB $1E                                                                                          ; LENGTH = 30 TILES 
	.DB $6C, $6B, $73, $6B, $6B, $6B, $73, $6B                                                    ;
	.DB $6B, $73, $6B, $6B, $73, $6B, $6B, $73                                                    ; 
	.DB $6B, $6B, $6B, $6B, $6B, $73, $6B, $6B                                                    ;
	.DB $6B, $73, $6B, $6B, $6B, $6D                                                              ;
	.DB $FF                                                                                          ; END

ONE_ROW_OF_STAND_COL_LINES_SCRIPT:                                                                   ; DRAW ONE ROW OF STANDINGS GRID COLLUMN LINES 
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $E1                                                                                          ; MOVE RIGHT (1 TILE)
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $E3                                                                                          ; MOVE RIGHT (3 TILES)
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $E2                                                                                          ; MOVE RIGHT (2 TILES)
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $E2                                                                                          ; MOVE RIGHT (2 TILES)
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $E2                                                                                          ; MOVE RIGHT (2 TILES)
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $E5                                                                                          ; MOVE RIGHT (5 TILES)
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $E3                                                                                          ; MOVE RIGHT (3 TILES)
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $E3                                                                                          ; MOVE RIGHT (3 TILES)
	.DB $01, $6A                                                                                     ; LENGTH =1 , VERT LINE
	.DB $FF                                                                                          ; END

ONE_ROW_OF_STANDINGS_GRID_SCRIPT:                                                                    ; DRAW ONE ROW OF STANDINGS GRID
	.DB $1E                                                                                          ; LENGTH = 30 TILES
	.DB $70, $6B, $72, $6B, $6B, $6B, $72, $6B                                                    ;
	.DB $6B, $72, $6B, $6B, $72, $6B, $6B, $72                                                    ;
	.DB $6B, $6B, $6B, $6B, $6B, $72, $6B, $6B                                                    ;
	.DB $6B, $72, $6B, $6B, $6B, $71                                                              ;
	.DB $FF                                                                                          ; END

BOTTOM_ROW_STANDINGS_SCRIPT:                                                                                                ;DRAW BOTTOM ROW OF STANDINGS GRID
	.DB $1E                                                                                          ; LENGTH = 30 TILES
	.DB $6E, $6B, $74, $6B, $6B, $6B, $74, $6B                                                    ;
	.DB $6B, $74, $6B, $6B, $74, $6B, $6B, $74                                                    ;
	.DB $6B, $6B, $6B, $6B, $6B, $74, $6B, $6B                                                    ;
	.DB $6B, $74, $6B, $6B, $6B, $6F                                                              ;;
	.DB $FF                                                                                          ; END

STANDINGS_HEADER_SCRIPT:                                                                                                ; STANDINGS (R,W,L,T,PCT,PTS,OP) TEXT + LINE DIVIDERS
	.DB $1E                                                                                          ; LENGTH = 30 TILES
	.DB $6A, "R", $6A                                                                             ; VERT LINE, "R", VERT LINE
	.DB $00, $00, $00                                                                             ; BLANK x 3
	.DB $6A, $00, "W", $6A, $00, "L"                                                                     ; VERT LINE,BLANK, "W", VERT LINE, BLANK, "L"
	.DB $6A, $00, "T", $6A, $00, "PCT."                                                                  ; VERT LINE,BLANK, "T", VERT LINE, BLANK, "PCT."
	.DB $6A, "PTS", $6A, $00, "OP", $6A                                                                  ; VERT LINE, "PTS", VERT LINE, BLANK, "OP", VERT LINE
	.DB $FF                                                                                          ; END
	
_F}_DIVISION_STANDING_SCREEN_SCRIPTS	

_F{_OFFENSIVE_STARTER_SCREEN_SCRIPTS

OFF_STARTER_TWO_WR_SCREEN_SCRIPT:                                                                    ; 0X32 OFFENSIVE STARTERS 2WR
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $80, $43, <OFF_STARTERS_TEXT_SCRIPT, >OFF_STARTERS_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2043, DO->DRAW OF STARTERS + FOOTBALLS + STARTERS TEXT
	.DB $82, $22, <WR_TE_TE_TEXT_SCRIPT, > WR_TE_TE_TEXT_SCRIPT                                                                      ; SET PPU ADDR = $2222, DO->2 WR CHANGE PLAYER TEXT (WR,TE,TE)
	.DB $FC, <DRAW_COMMON_OFF_STARTERS_SCRIPT, >DRAW_COMMON_OFF_STARTERS_SCRIPT                      ; JUMP->DRAW COMMON STARTERS/PLAYER CHANGE BOXES AND TEXT

OFF_STARTER_FOUR_WR_SCREEN_SCRIPT:                                                                   ; 0X33 OFFENSIVE STARTERS 4WR
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $80, $43, <OFF_STARTERS_TEXT_SCRIPT, >OFF_STARTERS_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2043, DO->DRAW OF STARTERS + FOOTBALLS + STARTERS TEXT
	.DB $82, $02, <WR_TEXT_SCRIPT, >WR_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2202, DO->4 WR CHANGE PLAYER TEXT (WR)
	.DB $FC, <DRAW_COMMON_OFF_STARTERS_SCRIPT, >DRAW_COMMON_OFF_STARTERS_SCRIPT                      ; JUMP->DRAW COMMON STARTERS/PLAYER CHANGE BOXES AND TEXT

OFF_STARTER_THREE_WR_SCREEN_SCRIPT:                                                                  ; 0X34 OFFENSIVE STARTERS 3WR
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $80, $43, <OFF_STARTERS_TEXT_SCRIPT, >OFF_STARTERS_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2043, DO->DRAW OF STARTERS + FOOTBALLS + STARTERS TEXT
	.DB $82, $02, <WR_TE_TE_THREE_WR_TEXT_SCRIPT, >WR_TE_TE_THREE_WR_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2202, DO->3 WR CHANGE PLAYER TEXT (WR,TE TE)
	.DB $FC, <DRAW_COMMON_OFF_STARTERS_SCRIPT, >DRAW_COMMON_OFF_STARTERS_SCRIPT                      ; JUMP->DRAW COMMON STARTERS/PLAYER CHANGE BOXES AND TEXT
	
_F}_OFFENSIVE_STARTER_SCREEN_SCRIPTS	

_F{_PLAYER_CHANGE_SCREEN_SCRIPTS

PLAYER_CHANGE_TWO_WR_SCREEN_SCRIPT:                                                                  ; 0X35 PLAYER CHANGE 2WR
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $80, $41, <MEMBER_CHANGE_PLAYERS_TEXT_SCRIPT, >MEMBER_CHANGE_PLAYERS_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2041, DO->DRAW MEMBER CHANGE + FOOTBALLS + PLAYERS TEXT
	.DB $82, $22, <WR_TE_TE_TEXT_SCRIPT, >WR_TE_TE_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2222, DO->2 WR CHANGE PLAYER TEXT (WR,TE,TE)
	.DB $FC, <DRAW_COMMON_OFF_STARTERS_SCRIPT, >DRAW_COMMON_OFF_STARTERS_SCRIPT                      ; JUMP->DRAW COMMON STARTERS/PLAYER CHANGE BOXES AND TEXT

PLAYER_CHANGE_FOUR_WR_SCREEN_SCRIPT:                                                                 ; 0X36 PLAYER CHANGE 4WR
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $80, $41, <MEMBER_CHANGE_PLAYERS_TEXT_SCRIPT, >MEMBER_CHANGE_PLAYERS_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2041, DO->DRAW MEMBER CHANGE + FOOTBALLS + PLAYERS TEXT
	.DB $82, $02, <WR_TEXT_SCRIPT, >WR_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2202, DO->4 WR CHANGE PLAYER TEXT (WR)
	.DB $FC, <DRAW_COMMON_OFF_STARTERS_SCRIPT, >DRAW_COMMON_OFF_STARTERS_SCRIPT                      ; JUMP->DRAW COMMON STARTERS/PLAYER CHANGE BOXES AND TEXT

PLAYER_CHANGE_THREE_WR_SCREEN_SCRIPT:                                                                ; 0X37 PLAYER CHANGE 3WR
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $80, $41, <MEMBER_CHANGE_PLAYERS_TEXT_SCRIPT, >MEMBER_CHANGE_PLAYERS_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2041, DO->DRAW MEMBER CHANGE + FOOTBALLS + PLAYERS TEXT
	.DB $82, $02, <WR_TE_TE_THREE_WR_TEXT_SCRIPT, >WR_TE_TE_THREE_WR_TEXT_SCRIPT                                                                       ; SET PPU ADDR = $2202, DO->3 WR CHANGE PLAYER TEXT (WR,TE TE)

_F}_PLAYER_CHANGE_SCREEN_SCRIPTS

_F{_DRAW_COMMON_OFF_STARTERS_SCRIPT

DRAW_COMMON_OFF_STARTERS_SCRIPT:                                                                     ; DRAW COMMON STARTERS/PLAYER CHANGE BOXES AND TEXT 
	.DB $C8                                                                                          ; SET IRQ0 SPLIT XSCROLL AND SOFT Y SCROLL LOC = 0()
	.DB $D0, $20, $0E                                                                                ; SET IRQ0 BG CHR BANKS = ($20,$0E)
	.DB $D1, $20, $21, $0F, $18                                                                      ; SET SOFT SPRITE CHR BANKS($20, $21, $0F, $18)
	.DB $A0, $80, $05, $20, $01                                                                      ; FILL BOX (ADDR=2080, Y=5, X=32, BLANK TILE)
	.DB $80, $AB, <LINEMAN_GRAPHIC_SCRIPT, >LINEMAN_GRAPHIC_SCRIPT                                   ; SET PPU ADDR = $20AB, DO->DRAW LINEMAN FOR OFFENSIVE STARTERS
	.DB $99, $20, $20, $C3                                                                           ; SET PPU ADDR = $2120, REPEAT ACROSS 32 TILES, GRASS+BLACK TILE 
																									; DRAW STARTERS BOX
	.DB $99, $4B, $04, $0D                                                                           ; SET PPU ADDR = $214B, REPEAT ACROSS 4 TILES, TOP HORIZ LINE
	.DB $91, $61, $0A, $0C                                                                           ; SET PPU ADDR = $2161, REPEAT DOWN 10 TILES, LEFT VERT LINE
	.DB $91, $6F, $0A, $0E                                                                           ; SET PPU ADDR = $216F, REPEAT DOWN 10 TILES, RIGHT VERT LINE
	.DB $9A, $A2, $0D, $0F                                                                           ; SET PPU ADDR = $214B, REPEAT ACROSS 13 TILES, BOT HORIZ LINE
	.DB $A9, $41, $08                                                                                ; SET PPU ADDR = $2141, TOP LEFT CORNER TILE
	.DB $A9, $4F, $09                                                                                ; SET PPU ADDR = $214F, TOP RIGHT CORNER TILE
	.DB $AA, $A1, $0A                                                                                ; SET PPU ADDR = $22A1, BOT LEFT CORNER TILE
	.DB $AA, $AF, $0B                                                                                ; SET PPU ADDR = $22AF, BOT RIGHT CORNER TILE
	.DB $89, $82                                                                                     ; SET PPU ADDR = $2182
	.DB      "QB"                                                                                    ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "RB"                                                                                    ;
																									; DRAW RETURNERS BOX
	.DB $9A, $CB, $04, $0D                                                                           ; SET PPU ADDR = $22CB, REPEAT ACROSS 4 TILES, TOP HORIZ LINE
	.DB $92, $E1, $04, $0C                                                                           ; SET PPU ADDR = $22E1, REPEAT DOWN 4 TILES, LEFT VERT LINE
	.DB $92, $EF, $04, $0E                                                                           ; SET PPU ADDR = $22EF, REPEAT DOWN 10 TILES, RIGHT VERT LINE
	.DB $9B, $62, $0D, $0F                                                                           ; SET PPU ADDR = $2362, REPEAT ACROSS 13 TILES, BOT HORIZ LINE
	.DB $AA, $C1, $08                                                                                ; SET PPU ADDR = $22C1, TOP LEFT CORNER TILE
	.DB $AA, $CF, $09                                                                                ; SET PPU ADDR = $22CF, TOP RIGHT CORNER TILE
	.DB $AB, $61, $0A                                                                                ; SET PPU ADDR = $2361, BOT LEFT CORNER TILE
	.DB $AB, $6F, $0B                                                                                ; SET PPU ADDR = $236F, BOT RIGHT CORNER TILE
	.DB $8A, $C2                                                                                     ; SET PPU ADDR = $22C2
	.DB      "RETURNERS"                                                                             ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "KR"                                                                                    ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "PR"                                                                                    ;
																									; DRAW TEAM AREA BOX
	.DB $99, $58, $06, $0D                                                                           ; SET PPU ADDR = $2158, REPEAT ACROSS 6 TILES, TOP HORIZ LINE
	.DB $91, $70, $10, $0C                                                                           ; SET PPU ADDR = $2170, REPEAT DOWN 16 TILES, LEFT VERT LINE
	.DB $91, $7E, $10, $0E                                                                           ; SET PPU ADDR = $217E, REPEAT DOWN 16 TILES, RIGHT VERT LINE
	.DB $9B, $71, $0D, $0F                                                                           ; SET PPU ADDR = $2371, REPEAT ACROSS 13 TILES, BOT HORIZ LINE
	.DB $A9, $50, $08                                                                                ; SET PPU ADDR = $2150, TOP LEFT CORNER TILE
	.DB $A9, $5E, $09                                                                                ; SET PPU ADDR = $215E, TOP RIGHT CORNER TILE
	.DB $AB, $70, $0A                                                                                ; SET PPU ADDR = $2370, BOT LEFT CORNER TILE
	.DB $AB, $7E, $0B                                                                                ; SET PPU ADDR = $237E, BOT RIGHT CORNER TILE
	.DB $89, $51                                                                                     ; SET PPU ADDR = $2151
	.DB      "TEAM AREA"                                                                             ;
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB      "QB"                                                                                    ;
	.DB $B2                                                                                          ; DOWN 3 ROWS
	.DB      "RB"                                                                                    ;
	.DB $B4                                                                                          ; DOWN 5 ROWS
	.DB      "WR"                                                                                    ;
	.DB $FF                                                                                          ; END

OFF_STARTERS_TEXT_SCRIPT:                                                                                                ; DRAW OF STARTERS + FOOTBALLS + STARTERS TEXT
	.DB $0F, $C4, " OF STARTERS ", $C5                                                               ; LENGTH = 15, LEFT FOOTBALL, TEXT, RIGHT FOOTBALL
	.DB $A8                                                                                          ; DOWN 8 ROWS FROM STARTING ADDR
	.DB $08, "STARTERS"                                                                              ; LENGTH = 8, TEXT
	.DB $FF                                                                                          ; END

MEMBER_CHANGE_PLAYERS_TEXT_SCRIPT:                                                                                                ; DRAW MEMBER CHANGE + FOOTBALLS + PLAYERS TEXT
	.DB $11, $C4, " MEMBER CHANGE ", $C5                                                             ; LENGTH = 17, LEFT FOOTBALL, TEXT, RIGHT FOOTBALL
	.DB $A8                                                                                          ; DOWN 8 ROWS FROM STARTING ADDR
	.DB $E1                                                                                          ; MOVE RIGHT (1 TILE)
	.DB $09, "PLAYERS", $0D, $0D                                                                     ; LENGTH = 9, TEXT + TOP HORIZ LINE X2
	.DB $FF                                                                                          ; END

WR_TE_TE_TEXT_SCRIPT:                                                                                ; 2 WR CHANGE PLAYER TEXT (WR, TE, TE )
	.DB $02, "WR"                                                                                    ; LENGTH =2, TEXT
	.DB $A3                                                                                          ; DOWN 3 ROWS
	.DB $02, "TE"                                                                                    ; LENGTH =2, TEXT
	.DB $A5                                                                                          ; DOWN 5 ROWS
	.DB $EF                                                                                          ; MOVE RIGHT (15 TILE)
	.DB $02, "TE"                                                                                    ; LENGTH =2, TEXT
	.DB $FF                                                                                          ; END

WR_TEXT_SCRIPT:                                                                                                ; 4 WR CHANGE PLAYER TEXT (WR)
	.DB $02, "WR"                                                                                    ; LENGTH =2, TEXT
	.DB $FF                                                                                          ; END

WR_TE_TE_THREE_WR_TEXT_SCRIPT:                                                                                                ; 3 WR CHANGE PLAYER TEXT (WR,TE TE)
	.DB $02, "WR"                                                                                    ; LENGTH =2, TEXT
	.DB $A4                                                                                          ; DOWN 4 ROWS
	.DB $02, "TE"                                                                                    ; LENGTH =2, TEXT
	.DB $A5                                                                                          ; DOWN 5 ROWS
	.DB $EF                                                                                          ; MOVE RIGHT (15 TILE)
	.DB $02, "TE"                                                                                    ; LENGTH =2, TEXT
	.DB $FF                                                                                          ; END

LINEMAN_GRAPHIC_SCRIPT:                                                                                                ; DRAW LINEMAN FOR OFFENSIVE STARTERS
	.DB $0A                                                                                          ; LENGTH = 10
	.DB $CA, $CB                                                                                  ; TACKLE TILES
	.DB $C8, $C9                                                                                  ; GUARD TILES
	.DB $C6, $C7                                                                                  ; CENTER TILES
	.DB $C8, $C9                                                                                  ; GUARD TILES
	.DB $CA, $CB                                                                                  ; TACKLE TILES
	.DB $FF                                                                                          ; END

_F}_DRAW_COMMON_OFF_STARTERS_SCRIPT	

_F{_OFF_STARTERS_RESET_SCREEN_SCRIPT	

OFF_STARTERS_RESET_SCREEN_SCRIPT:                                                                    ; 0X38 DRAW OFF STARTER RESET MENU
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $81, $42, < OFF_STARTER_RESET_SCRIPT, > OFF_STARTER_RESET_SCRIPT                             ;
	.DB $FF                                                                                          ; END

OFF_STARTER_RESET_SCRIPT:                                                                            ; OFF STARTER RESET MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E7                                                                                          ; MOVE RIGHT 7 TILES
	.DB $02, $0D, $09                                                                                ; LENGTH = 2, TOP HORIZONTAL LINE + TOP RIGHT CORNER LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $88, $00                                                                                     ; REPEAT TILE (8 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $0A, $0C, " RESET  ", $0E                                                                    ; LENGTH= 10,LEFT VERT LINE + TEXT + RIGHT VERTICAL LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $88, $00                                                                                     ; REPEAT TILE (8 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $84, $00                                                                                     ; REPEAT TILE (4 TIMES, BLANK TILE)
	.DB $05, "NO  ", $0E                                                                             ; LENGTH= 5, TEXT + RIGHT VERTICAL LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $88, $00                                                                                     ; REPEAT TILE (8 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $84, $00                                                                                     ; REPEAT TILE (4 TIMES, BLANK TILE)
	.DB $05, "YES ", $0E                                                                             ; LENGTH =5, TEXT + RIGHT VERTICAL LINE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $88, $0F                                                                                     ; REPEAT TILE (8 TIMES, BOTTOM HORIZONTAL LINE)
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END
	
_F}_OFF_STARTERS_RESET_SCREEN_SCRIPT	

_F{_TEAM_RANKINGS_SCREEN_SCRIPTS

NFL_OFF_TEAM_RANKINGS_SCREEN_SCRIPT:                                                                 ; 0X39, 0X3A DRAW NFL TEAM OFFENSE RANKINGS TEXT
	.DB $FD, <THREE_STARS_AND_TOTAL_TEXT_SCRIPT, >THREE_STARS_AND_TOTAL_TEXT_SCRIPT                  ; DO->DRAW 3 COLORED STARS + TOTAL TEXT
	.DB      "NFL"                                                                                   ;
	.DB $FC, <THREE_STARS_OFF_AND_RANKINGS_HEADER_SCRIPT, >THREE_STARS_OFF_AND_RANKINGS_HEADER_SCRIPT; JUMP->DRAW OFFENSE + 3 COLORED STARS + TOTAL,PASS, RUSH HEADERS

AFC_OFF_TEAM_RANKINGS_SCREEN_SCRIPT:                                                                 ; 0X3B DRAW NFC TEAM OFFENSE RANKINGS TEXT
	.DB $FD, <THREE_STARS_AND_TOTAL_TEXT_SCRIPT, >THREE_STARS_AND_TOTAL_TEXT_SCRIPT                  ; DO->DRAW 3 COLORED STARS + TOTAL TEXT
	.DB      "AFC"                                                                                   ;
	.DB $FC, <THREE_STARS_OFF_AND_RANKINGS_HEADER_SCRIPT, >THREE_STARS_OFF_AND_RANKINGS_HEADER_SCRIPT; JUMP->DRAW OFFENSE + 3 COLORED STARS + TOTAL,PASS, RUSH HEADERS

NFC_OFF_TEAM_RANKINGS_SCREEN_SCRIPT:                                                                 ; 0X3C DRAW NFC TEAM OFFENSE RANKINGS TEXT
	.DB $FD, <THREE_STARS_AND_TOTAL_TEXT_SCRIPT, >THREE_STARS_AND_TOTAL_TEXT_SCRIPT                  ; DO->DRAW 3 COLORED STARS + TOTAL TEXT
	.DB      "NFC"                                                                                   ;

THREE_STARS_OFF_AND_RANKINGS_HEADER_SCRIPT:                                                          ; DRAW 3 COLORED STARS + OFFENSE+ TOTAL,PASS, RUSH HEADERS
	.DB $88, $51                                                                                     ; SET PPU ADDR = $2051
	.DB      "OFFENSE"                                                                               ;
	.DB $FC, <THREE_STARS_TOTAL_PASS_RUSH_TEXT_SCRIPT, >THREE_STARS_TOTAL_PASS_RUSH_TEXT_SCRIPT      ; JUMP->DRAW 3 COLORED STARS + TOTAL,PASS, RUSH HEADERS 


NFL_DEF_TEAM_RANKINGS_SCREEN_SCRIPT:                                                                 ; 0X3D DRAW NFL TEAM DEFENSE RANKINGS TEXT
	.DB $FD, <THREE_STARS_AND_TOTAL_TEXT_SCRIPT, >THREE_STARS_AND_TOTAL_TEXT_SCRIPT                  ; DO->DRAW 3 COLORED STARS + TOTAL TEXT
	.DB      "NFL"                                                                                   ;
	.DB $FC, <DEFENSE_TEXT_SCRIPT, >DEFENSE_TEXT_SCRIPT                                              ; JUMP->DRAW 3 COLORED STARS + DEFENSE+ TOTAL,PASS, RUSH HEADERS

AFC_DEF_TEAM_RANKINGS_SCREEN_SCRIPT:                                                                 ; 0X3E DRAW AFC TEAM DEFENSE RANKINGS TEXT
	.DB $FD, <THREE_STARS_AND_TOTAL_TEXT_SCRIPT, >THREE_STARS_AND_TOTAL_TEXT_SCRIPT                  ; DO->DRAW 3 COLORED STARS + TOTAL TEXT
	.DB      "AFC"                                                                                   ;
	.DB $FC, <DEFENSE_TEXT_SCRIPT, >DEFENSE_TEXT_SCRIPT                                              ; JUMP->DRAW 3 COLORED STARS + DEFENSE+ TOTAL,PASS, RUSH HEADERS

NFC_DEF_TEAM_RANKINGS_SCREEN_SCRIPT:                                                                 ; 0X3F DRAW NFC TEAM DEFENSE RANKINGS TEXT
	.DB $FD, <THREE_STARS_AND_TOTAL_TEXT_SCRIPT, >THREE_STARS_AND_TOTAL_TEXT_SCRIPT                  ; DO->DRAW 3 COLORED STARS + TOTAL TEXT
	.DB      "NFC"                                                                                   ;

DEFENSE_TEXT_SCRIPT:                                                                                 ; DRAW 3 COLORED STARS + DEFENSE+ TOTAL,PASS, RUSH HEADERS
	.DB $88, $51                                                                                     ; SET PPU ADDR = $2051
	.DB      "DEFENSE"                                                                               ;

THREE_STARS_TOTAL_PASS_RUSH_TEXT_SCRIPT:                                                             ; DRAW 3 COLORED STARS + TOTAL,PASS, RUSH HEADERS 
	.DB $88, $59                                                                                     ; SET PPU ADDR = $2059
	.DB      $19, $1C, $19                                                                           ; COLORED STARS (RED, WHITE, RED)
	.DB $88, $B0                                                                                     ; SET PPU ADDR = $20B0
	.DB      "TOTAL PASS RUSH"                                                                       ;
	.DB $A8, $A2, "R"                                                                                ; SET PPU ADDR = $20A2, DRAW R TILE
	.DB $FF                                                                                          ; END


THREE_STARS_AND_TOTAL_TEXT_SCRIPT:                                                                   ; DRAW 3 COLORED STARS + TOTAL TEXT 
	.DB $ED                                                                                          ; END UPDATE PAL TASK, SET BG AND SPR PAL TO FULLY FADED OUT()
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN()
	.DB $D0, $18, $7A                                                                                ; SET IRQ0 BG CHR BANKS = (18,7A)
	.DB $88, $43                                                                                     ; SET PPU ADDR = $2043 
	.DB      $19, $1C, $19                                                                           ; COLORED STARS (RED, WHITE, RED)
	.DB $88, $4B                                                                                     ; SET PPU ADDR = $204B
	.DB      "TOTAL"                                                                                 ;
	.DB $88, $47 																					 ; SET PPU ADDR = $2047
	.DB $FE                                                                                          ; RETURN

_F}_TEAM_RANKINGS_SCREEN_SCRIPTS	

_F{_PLAY_SELECT_SCREEN_SCRIPTS

PLAY_SELECT_SCREEN_SCRIPT:                                                                           ; 0X40 DRAW PLAY SELECT SCREEN 
	.DB $83, $43, <PLAY_SELECT_MINI_FIELD_SCRIPT, >PLAY_SELECT_MINI_FIELD_SCRIPT                     ; SET PPU =2343, DO->DRAW PLAY SELECT FOOTER (DOWN, MINI-FIELD, QTR)
	.DB $FD, <PLAY_SELECT_BG_SCRIPT, >PLAY_SELECT_BG_SCRIPT                                          ; DO->DRAW PLAY SELECT BACKGROUND
	.DB $8B, $41                                                                                     ; SET PPU ADDR = $2341 = DOWN LOCATION
	.DB $DF, $77, $00                                                                                ; DRAW NUMBER + 1 (8-BIT) FROM DATA ADDR(77= DOWN)
	.DB $8B, $59                                                                                     ; SET PPU ADDR = $2359 = QTR LOCATION 
	.DB $DF, $76, $00                                                                                ; DRAW NUMBER + 1 (8-BIT) FROM DATA ADDR(76= QTR)
	.DB $8B, $47                                                                                     ; SET PPU ADDR = $2347 = YARDS TO GO LOCATION
	.DB $D3                                                                                          ; CONVERT FIRST DOWN DISTANCE TO NUMBER()
	.DB $FF                                                                                          ; END

PLAY_SELECT_MINI_FIELD_SCRIPT:                                                                       ; DRAW PLAY SELECT FOOTER (DOWN, MINI-FIELD, QTR)
	.DB $04, $02, $03, $06, $07                                                                      ; LENGTH 4, "DOWN" TEXT TILES
	.DB $C3                                                                                          ; MOVE RIGHT (3 TILES) AND UPDATE PPU LOC
	.DB $0E, $70, $71, $74, $75, $6C, $6D                                                            ; LENGTH 14, TOP ROW OF MINI FIELD TILES 
	.DB $71, $74, $75, $6C, $6D, $71, $74, $7E                                                       ;
	.DB $E3                                                                                          ; MOVE RIGHT (3 TILES)
	.DB $03, $04, $05, $40                                                                           ; LENGTH 3, "QTR" TEXT TILES
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0E, $72, $73, $76, $77, $6E, $6F                                                            ; LENGTH 14, BOTTOM ROW OF MINI FIELD TILES
	.DB $7A, $7B, $78, $6E, $79, $7C, $7D, $7F                                                       ;
	.DB $FF                                                                                          ; END

PLAY_SELECT_BG_SCRIPT:                                                                               ; DRAW PLAY SELECT BACKGROUND
	.DB $D0, $20, $22                                                                                ; SET IRQ0 BG CHR BANKS(20,22)
	.DB $A3, $C8, $01, $30, $55                                                                      ; SET PPU ADDR = $23C8, # ROWS= 1, LENGTH =48, ATTRIBUTE VALUE $55  
	.DB $83, $D9, <RUN_PLAY_SELECT_JOYPAD_ATTR_VALUES, >RUN_PLAY_SELECT_JOYPAD_ATTR_VALUES           ; SET PPU ADDR = $23D9, DO->RUN PLAY JOY PAD ATTRIBUTE TABLE VALUES
	.DB $83, $F1, <PASS_PLAY_SELECT_JOYPAD_ATTR_VALUES, >PASS_PLAY_SELECT_JOYPAD_ATTR_VALUES         ; SET PPU ADDR = $23F1, DO->PASS PLAY JOY PAD ATTRIBUTE TABLE VALUES
	.DB $90, $E2, $12, $82                                                                           ; SET PPU ADDR = $20E2, REPEAT DOWN 18 TILES (LEFT SIDE THICK VERTICAL LINE)
	.DB $90, $E9, $12, $26                                                                           ; SET PPU ADDR = $20E9, REPEAT DOWN 18 TILES (PLAY SPACER TILE)
	.DB $90, $F0, $12, $26                                                                           ; SET PPU ADDR = $20F0, REPEAT DOWN 18 TILES (PLAY SPACER TILE)
	.DB $90, $F7, $12, $26                                                                           ; SET PPU ADDR = $20F7, REPEAT DOWN 18 TILES (PLAY SPACER TILE)
	.DB $90, $FE, $12, $27                                                                           ; SET PPU ADDR = $20FE, REPEAT DOWN 18 TILES (RIGHT SIDE THICK VERTICAL LINE)
	.DB $80, $81, <PLAY_SELECT_RUN_PASS_TEXT_SCRIPT, >PLAY_SELECT_RUN_PASS_TEXT_SCRIPT               ; SET PPU ADDR = $2081, DO-> DRAW RUN AND PASS WITH RED LINES (PLAY SELECT) 
	.DB $80, $82, <PLAY_SLECT_GRID_CONTROLLERS_SCRIPT, >PLAY_SLECT_GRID_CONTROLLERS_SCRIPT           ; SET PPU ADDR = $2082, DO-> DRAW PLAY SLECT GRID PLUS CONTROLLERS
	.DB $FE                                                                                          ; RETURN

PLAY_SLECT_GRID_CONTROLLERS_SCRIPT:                                                                  ; DRAW PLAY SLECT GRID PLUS CONTROLLERS

																									; DRAW RUN PLAY NAME BOXES
	.DB $01, $29                                                                                     ; LENGTH 1, RED HORIZONTAL LINE
	.DB $86, $5E                                                                                     ; REPEAT TILE (6 TIMES, TOP HORIZ LINE RUN NAME BOX TILE)
	.DB $01, $85                                                                                     ; LENGTH 1, TOP RIGHT CORNER NAME BOX TILE
	.DB $86, $5E                                                                                     ; REPEAT TILE (6 TIMES, TOP HORIZ LINE RUN NAME BOX TILE)
	.DB $01, $85                                                                                     ; LENGTH 1, TOP RIGHT CORNER NAME BOX TILE
	.DB $86, $5E                                                                                     ; REPEAT TILE (6 TIMES, TOP HORIZ LINE RUN NAME BOX TILE)
	.DB $01, $85                                                                                     ; LENGTH 1, TOP RIGHT CORNER NAME BOX TILE
	.DB $86, $5E                                                                                     ; REPEAT TILE (6 TIMES, TOP HORIZ LINE RUN NAME BOX TILE)
	.DB $01, $88                                                                                     ; LENGTH 1, RIGHT SIDE VERT LINE NAME BOX TILE FINAL
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $84                                                                                     ; LENGTH 1, LEFT SIDE VERT LINE NAME BOX TILE
	.DB $E6                                                                                          ; MOVE RIGHT 6 TILES
	.DB $01, $2B                                                                                     ; LENGTH 1, BOT RIGHT CORNER NAME BOX TILE
	.DB $E6                                                                                          ; MOVE RIGHT 6 TILES
	.DB $01, $2B                                                                                     ; LENGTH 1, BOT RIGHT CORNER NAME BOX TILE
	.DB $E6                                                                                          ; MOVE RIGHT 6 TILES
	.DB $01, $2B                                                                                     ; LENGTH 1, BOT RIGHT CORNER NAME BOX TILE
	.DB $E6                                                                                          ; MOVE RIGHT 6 TILES
	.DB $01, $5F                                                                                     ; LENGTH 1, VERTICAL LINE TILE
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $80                                                                                     ; LENGTH 1, BOT LEFT CORNER NAME BOX TILE
	.DB $86, $81                                                                                     ; REPEAT TILE (6 TIMES, BOT HORIZ LINE RUN NAME BOX TILE)
	.DB $01, $24                                                                                     ; LENGTH 1, BOT RIGHT CORNER NAME BOX TILE
	.DB $86, $81                                                                                     ; REPEAT TILE (6 TIMES, BOT HORIZ LINE RUN NAME BOX TILE)
	.DB $01, $24                                                                                     ; LENGTH 1, BOT RIGHT CORNER NAME BOX TILE
	.DB $86, $81                                                                                     ; REPEAT TILE (6 TIMES, BOT HORIZ LINE RUN NAME BOX TILE)
	.DB $01, $24                                                                                     ; LENGTH 1, BOT RIGHT CORNER NAME BOX TILE
	.DB $86, $81                                                                                     ; REPEAT TILE (6 TIMES, BOT HORIZ LINE RUN NAME BOX TILE)
	.DB $01, $25                                                                                     ; LENGTH 1, BOT RIGHT CORNER NAME BOX TILE FINAL
	.DB $A8                                                                                          ; DOWN 8 ROWS

																									; DRAW RUN PLAY CONTROLLERS
	.DB $1D, $82, $01, $1C, $1D, $14, $15, $01                                                       ; LENGTH = 29 TILES, FIELD PLUS TOP ROW CONTROLLER TILES 
	.DB $26, $01, $18, $11, $14, $15, $01, $26                                                       ; 
	.DB $01, $10, $19, $14, $15, $01, $26, $01                                                       ; 
	.DB $10, $11, $14, $15, $01, $27                                                                 ;
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $1D, $2F, $83, $12, $13, $16, $17, $83                                                       ; LENGTH = 29 TILES, FIELD PLUS BOT ROW CONTROLLER TILES 
	.DB $2C, $83, $1A, $13, $16, $17, $83, $2C                                                       ; 
	.DB $83, $12, $1B, $16, $17, $83, $2C, $83                                                       ; 
	.DB $1E, $1F, $16, $17, $83, $2D                                                                 ;
	.DB $A1                                                                                          ; DOWN 1 ROW

																									; DRAW PASS PLAY BOXES
	.DB $01, $5D                                                                                     ; LENGTH 1, RED HORIZONTAL LINE + TOP LEFT CORNER 
	.DB $86, $86                                                                                     ; REPEAT TILE (6 TIMES, TOP THICK LINE PASS BOX TILE)
	.DB $01, $6B                                                                                     ; LENGTH 1, TOP RIGHT CORNER BOX TILE
	.DB $86, $86                                                                                     ; REPEAT TILE (6 TIMES, TOP THICK LINE PASS BOX TILE)
	.DB $01, $6B                                                                                     ; LENGTH 1, TOP RIGHT CORNER BOX TILE
	.DB $86, $86                                                                                     ; REPEAT TILE (6 TIMES, TOP THICK LINE PASS BOX TILE)
	.DB $01, $6B                                                                                     ; LENGTH 1, TOP RIGHT CORNER BOX TILE
	.DB $86, $86                                                                                     ; REPEAT TILE (6 TIMES, TOP THICK LINE PASS BOX TILE)
	.DB $01, $87                                                                                     ; LENGTH 1, TOP RIGHT CORNER BOX TILE FINAL
	.DB $A8                                                                                          ; DOWN 8 ROWS

	.DB $1D, $82, $01, $1C, $1D, $14, $15, $01                                                       ; DRAW PASS PLAY CONTROLLERS
	.DB $26, $01, $18, $11, $14, $15, $01, $26                                                       ; 
	.DB $01, $10, $19, $14, $15, $01, $26, $01                                                       ; 
	.DB $10, $11, $14, $15, $01, $27                                                                 ;
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $1D, $2F, $83, $12, $13, $22, $23, $83                                                       ; 
	.DB $2C, $83, $1A, $13, $22, $23, $83, $2C                                                       ; 
	.DB $83, $12, $1B, $22, $23, $83, $2C, $83                                                       ; 
	.DB $1E, $1F, $22, $23, $83, $2D                                                                 ;
	.DB $FF                                                                                          ; END

RUN_PLAY_SELECT_JOYPAD_ATTR_VALUES:                                                                  ; RUN PLAY JOY PAD ATTRIBUTE TABLE VALUES
	.DB $07, $A5, $D5, $E5, $95, $65, $B5, $75                                                       ;
	.DB $FF                                                                                          ; END

PASS_PLAY_SELECT_JOYPAD_ATTR_VALUES:                                                                 ; PASS PLAY JOY PAD ATTRIBUTE TABLE VALUES
	.DB $06, $5A, $5D, $56, $59, $56, $5B                                                            ;
	.DB $FF                                                                                          ; END

PLAY_SELECT_RUN_PASS_TEXT_SCRIPT:                                                                    ; DRAW RUN AND PASS WITH RED LINES (PLAY SELECT)
	.DB $56                                                                                          ; SET PPU INCREMENT TO ROW, LENGtH = 22 BYTES
	.DB $28                                                                                          ; CORNER RED LINE 
	.DB $2A, $2A                                                                                     ; 2 X STRAIGHT RED LINE 
	.DB $00                                                                                          ; BLANK BLACK TILE 
	.DB "RUN"                                                                                        ;
	.DB $00                                                                                          ; BLANK BLACK TILE
	.DB $2A, $2A, $2A                                                                                ; 3 X STRAIGHT RED LINE 
	.DB $5B, $5C                                                                                     ; BOT CORNER RED LINE, TOP CORNER RED LINE 
	.DB $2A                                                                                          ; STRAIGHT RED LINE 
	.DB $00                                                                                          ; BLANK BLACK TILE
	.DB "PASS"                                                                                       ;
	.DB $00                                                                                          ; BLANK BLACK TILE
	.DB $2A                                                                                          ; STRAIGHT RED LINE
	.DB $5B                                                                                          ; BOT CORNER RED LINE
	.DB $FF                                                                                          ; END

_F}_PLAY_SELECT_SCREEN_SCRIPTS	

_F{_P1_PLAY_SELECT_MENU_SCRIPTS

P1_OFF_PLAY_CALL_MENU_SCREEN_SCRIPT:                                                                 ; 0X41 DRAW P1 OFFENSE MENU 
	.DB $88, $A4                                                                                     ; SET PPU ADDR = $20A4
	.DB $D4                                                                                          ; DRAW CURRENT P1 TEAM ABBREVIATION
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $80, $A3, <OFFENSIVE_MENU_SCRIPT, > OFFENSIVE_MENU_SCRIPT                                    ; SET PPU ADDR = $20A3, DO->OFFENSIVE_MENU 
	.DB $FF                                                                                       ; END

P1_OFF_TIMEOUT_MENU_SCREEN_SCRIPT:                                                                   ; 0X42 DRAW P1 OFFENSE TIMEOUT MENU
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $81, $24, <OFF_TIMEOUT_MENU_SCRIPT, > OFF_TIMEOUT_MENU_SCRIPT                                ; SET PPU ADDR = $2124, DO->OFFENSIVE_TIMEOUT_MENU
	.DB $FF                                                                                          ; END

P1_DEF_PLAYCALL_MENU_SCREEN_SCRIPT:                                                                  ; 0X43, 0X44 DRAW P1 DEFENSE MENU    
	.DB $88, $A4                                                                                     ; SET PPU ADDR = $20A4
	.DB $D4                                                                                          ; DRAW CURRENT P1 TEAM ABBREVIATION
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $80, $A3, <DEFENENSIVE_MENU_SCRIPT, > DEFENENSIVE_MENU_SCRIPT                                ; SET PPU ADDR = $20A3, DO->DEFENSIVE_MENU
	.DB $FF                                                                                          ; END

P1_DEF_TIMEOUT_MENU_SCREEN_SCRIPT:                                                                   ; 0X45 DRAW P1 DEFENSE TIMEOUT MENU
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $81, $24, <DEF_TIMEOUT_MENU_SCRIPT, > DEF_TIMEOUT_MENU_SCRIPT                                ; SET PPU ADDR = $2124, DO->DEFENSIVE_TIMEOUT_MENU
	.DB $FF                                                                                          ; END
	
_F}_P1_PLAY_SELECT_MENU_SCRIPTS	

_F{_P2_PLAY_SELECT_MENU_SCRIPTS

P2_OFF_PLAYCALL_MENU_SCREEN_SCRIPT:                                                                  ; 0X46,0X47  DRAW P2 OFFENSE MENU
	.DB $88, $B2                                                                                     ; SET PPU ADDR = $20B2
	.DB $D5                                                                                          ; DRAW CURRENT P2 TEAM ABBREVIATION
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $80, $B1, <OFFENSIVE_MENU_SCRIPT, > OFFENSIVE_MENU_SCRIPT                                    ; SET PPU ADDR = $20B1, DO->OFFENSIVE_MENU
	.DB $FF                                                                                          ; END

P2_OFF_TIMEOUT_MENU_SCREEN_SCRIPT:                                                                   ; 0X48 DRAW P2 OFFENSE TIMEOUT MENU
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $81, $32, <OFF_TIMEOUT_MENU_SCRIPT, > OFF_TIMEOUT_MENU_SCRIPT                                ; SET PPU ADDR = $2132, DO->OFFENSIVE_TIMEOUT_MENU
	.DB $FF                                                                                          ; END

UNUSED_SCREEN_SCRIPT:                                                                                ; 0X49  *** UNUSED
	.DB $FF

P2_DEF_PLAYCALL_MENU_SCREEN_SCRIPT:                                                                  ; 0X4A DRAW P2 DEFENSE MENU
	.DB $88, $B2                                                                                     ; SET PPU ADDR = $20B2
	.DB $D5                                                                                          ; DRAW CURRENT P2 TEAM ABBREVIATION
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $80, $B1, <DEFENENSIVE_MENU_SCRIPT, > DEFENENSIVE_MENU_SCRIPT                                ; SET PPU ADDR = $20B1, DO->DEFENSIVE_MENU
	.DB $FF                                                                                          ; END

P2_DEF_TIMEOUT_MENU_SCREEN_SCRIPT:                                                                   ; 0X4B DRAW P2 DEFENSE TIMEOUT MENU
	.DB $E1, $01                                                                                     ; SET DRAW DELAY = 1 FRAME
	.DB $81, $32, <DEF_TIMEOUT_MENU_SCRIPT, > DEF_TIMEOUT_MENU_SCRIPT                                ; SET PPU ADDR = $2132, DO->DEFENSIVE_TIMEOUT_MENU
	.DB $FF                                                                                          ; END
	
_F}_P2_PLAY_SELECT_MENU_SCRIPTS	

_F{_PLAY_SELECT_OFFENSIVE_MENU_SCRIPT

OFFENSIVE_MENU_SCRIPT:                                                                               ; 0X4C OFFENSIVE_MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E4                                                                                          ; MOVE RIGHT (4 TILES)
	.DB $87, $0D
	.DB $01, $09                                                                                     ; LENGTH = 1, DRAW TOP RIGHT CURVED MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " CANCEL    ", $0E                                                                 ; LENGTH = 13, LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " TIMEOUT   ", $0E                                                                 ; LENGTH = 13, LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " PUNT KICK ", $0E                                                                 ; LENGTH = 13, LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " FIELD GOAL", $0E                                                                 ; LENGTH = 13, LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " CHANGE    ", $0E                                                                 ; 
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $8B, $0F                                                                                     ; REPEAT TILE (11 TIMES, BOTTOM STRAIGHT MENU TILE)
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END
	
_F}_PLAY_SELECT_OFFENSIVE_MENU_SCRIPT	

_F{_PLAY_SELECT_OFF_TIMEOUT_MENU_SCRIPT

OFF_TIMEOUT_MENU_SCRIPT:                                                                             ; OFFENSIVE_TIMEOUT_MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E9                                                                                          ; MOVE RIGHT 9 TILES
	.DB $03, $0D, $0D, $09                                                                           ; LENGTH = 3, TOP STRAIGHT MENU TILE x2, TEXT, RIGHT CURVED MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " CALL      ", $0E                                                                 ; LENGTH = 13, LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0D, $0C, " TIME OUT. ", $0E                                                                 ; LENGTH = 13, LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8B, $00                                                                                     ; REPEAT TILE (11 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $8B, $0F                                                                                     ; REPEAT TILE (11 TIMES, BOTTOM STRAIGHT MENU TILE)
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END
	
_F}_PLAY_SELECT_OFF_TIMEOUT_MENU_SCRIPT	

_F{_PLAY_SELECT_DEFENSIVE_MENU_SCRIPT

DEFENENSIVE_MENU_SCRIPT:                                                                             ; DEFENSIVE_MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E4                                                                                          ; MOVE RIGHT (4 TILES)
	.DB $86, $0D                                                                                     ; REPEAT TILE (6 TIMES, TOP STRAIGHT TILE)
	.DB $01, $09                                                                                     ; LENGTH = 1, DRAW TOP RIGHT CURVED MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8A, $00                                                                                     ; REPEAT TILE (10 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0C, $0C, " CANCEL   ", $0E                                                                  ; LENGTH = 12, D LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8A, $00                                                                                     ; REPEAT TILE (10 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0C, $0C, " TIMEOUT  ", $0E                                                                  ; LENGTH = 12, D LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $8A, $0F                                                                                     ; REPEAT TILE (10 TIMES, BOTTOM STRAIGHT MENU TILE)
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END
	
_F}_PLAY_SELECT_DEFENSIVE_MENU_SCRIPT	

_F{_PLAY_SELECT_DEF_TIMEOUT_SCRIPT

DEF_TIMEOUT_MENU_SCRIPT:                                                                             ; DEFENSIVE_TIMEOUT_MENU
	.DB $01, $08                                                                                     ; LENGTH = 1, DRAW TOP LEFT CURVED MENU TILE
	.DB $E9                                                                                          ; MOVE RIGHT (9 TILES)
	.DB $02, $0D, $09                                                                                ; LENGTH = 1, DRAW TOP STRAIGHT TILE, TOP RIGHT CURVED TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8A, $00                                                                                     ; REPEAT TILE (10 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0C, $0C                                                                                     ; LENGTH = 12, LEFT STRAIGHT MENU TILE 
	.DB " CALL     "                                                                                 ;
	.DB $0E                                                                                          ; RIGHT STRAIGHT MENU TILE 
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8A, $00                                                                                     ; REPEAT TILE (10 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $0C, $0C, " TIME OUT.", $0E                                                                  ; LENGTH = 12, LEFT STRAIGHT MENU TILE, TEXT, RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0C                                                                                     ; LENGTH = 1, DRAW LEFT STRAIGHT MENU TILE
	.DB $8A, $00                                                                                     ; REPEAT TILE (10 TIMES, BLANK TILE)
	.DB $01, $0E                                                                                     ; LENGTH = 1, DRAW RIGHT STRAIGHT MENU TILE
	.DB $FE                                                                                          ; WAIT DRAW DELAY # FRAMES()
	.DB $A1                                                                                          ; DOWN 1 ROW
	.DB $01, $0A                                                                                     ; LENGTH = 1, TOP BOT LEFT CURVED MENU TILE
	.DB $8A, $0F                                                                                     ; REPEAT TILE (10 TIMES, BOTTOM STRAIGHT MENU TILE)
	.DB $01, $0B                                                                                     ; LENGTH = 1, TOP BOT RIGHT CURVED MENU TILE
	.DB $FF                                                                                          ; END
	
_F}_PLAY_SELECT_DEF_TIMEOUT_SCRIPT	

_F{_STATUS_BAR_SCRIPTS

CLOCK_BACKGROUND_STATUS_BAR_SCRIPT:                                                                  ; 0X4E DRAW_CLOCK_BACKGROUND     
	.DB $88, $4C                                                                                     ; SET PPU ADDR = $204C
	.DB $3C, $00, $00                                                                                ; CLOCK/SCORE TOP LEFT CORNER TILE, BLANK TILE X2 
	.DB $3A, $00, $00                                                                                ; CLOCK COLON, BLANK TILE X2
	.DB $3D                                                                                          ; CLOCK/SCORE BOTTOM LEFT CORNER TILE, BLANK TILE X2
	.DB $88, $6C                                                                                     ; SET PPU ADDR = $206C
	.DB $3E, $00, $00                                                                                ; CLOCK/SCORE TOP RIGHT CORNER TILE, BLANK TILE X2
	.DB $3B, $00, $00                                                                                ; DASH TILE, BLANK TILE X2
	.DB $3F                                                                                          ; CLOCK/SCORE BOTTOM RIGHT CORNER TILE, BLANK TILE X2
	.DB $FF                                                                                          ; END

DOWN_AND_DISTANCE_STATUS_BAR_SCRIPT:                                                                 ; 0X4F DRAW "DOWN AND 10" PLUS MARKERS       
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $47                                                                                     ; SET PPU ADDR = $2447
	.DB $18                                                                                          ; TOP OF DOWN MARKER TILE ID
	.DB $8C, $57                                                                                     ; SET PPU ADDR = $2457
	.DB $18                                                                                          ; TOP OF DOWN MARKER TILE ID
	.DB $8C, $67                                                                                     ; SET PPU ADDR = $2467
	.DB $1A                                                                                          ; BOTTOM OF DOWN MARKER TILE ID
	.DB $8C, $6E                                                                                     ; SET PPU ADDR = $246E
	.DB "DOWN"                                                                                       ;
	.DB $8C, $73                                                                                     ; SET PPU ADDR = $2473
	.DB $D3                                                                                          ; CONVERT FIRST DOWN DISTANCE TO NUMBER()
	.DB $8C, $77                                                                                     ; SET PPU ADDR = $2477
	.DB $1A                                                                                          ; BOTTOM OF DOWN MARKER TILE ID
	.DB $FF                                                                                          ; END

FUMBLE_STATUS_BAR_SCRIPT:                                                                            ; 0X50 DRAW FUMBLE TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $49                                                                                     ; SET PPU ADDR = $2449
	.DB $16, $16, $16                                                                                ; FOOTBALL DIAG DOWN TILE X3
	.DB " FUMBLE "                                                                                   ; 
	.DB $17, $17, $17                                                                                ; FOOTBALL DIAG UP TILE X3
	.DB $FF                                                                                          ; END

PUNT_KICK_STATUS_BAR_SCRIPT:                                                                         ; 0X51 DRAW PUNT KICK TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $4B                                                                                     ; SET PPU ADDR = $244B
	.DB "PUNT KICK"                                                                                  ;
	.DB $FF                                                                                          ; END

FIELD_GOAL_STATUS_BAR_SCRIPT:                                                                        ; 0X52 DRAW FIELD GOAL TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $4B                                                                                     ; SET PPU ADDR = $244B
	.DB  "FIELD GOAL"                                                                                ;
	.DB $FF                                                                                          ; END

SUCCESSFUL_TRY_STATUS_BAR_SCRIPT:                                                                    ; 0X53 DRAW SUCCESSFUL XP TRY TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $49                                                                                     ; SET PPU ADDR = $244C
	.DB "SUCCESSFUL TRY"                                                                             ; 
	.DB $FF                                                                                          ; END

NO_GOOD_STATUS_BAR_SCRIPT:                                                                           ; 0X54 DRAW NO GOOD TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $4C                                                                                     ; SET PPU ADDR = $244C
	.DB "NO GOOD !"                                                                                  ;
	.DB $FF                                                                                          ; END

FIRST_DOWN_STATUS_BAR_SCRIPT:                                                                        ; 0X55 DRAW "*** FIRST DOWN ***" COLORED
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $47                                                                                     ; SET PPU ADDR = $2447
	.DB $19, $1C, $1B, $00                                                                           ; DRAW COLORED STARS + SPACE 
	.DB $1D,$1E,$1F,$5E,$22,$00                                                                      ; DRAW COLORED FIRST + SPACE
	.DB $23,$24,$25,$26,$00                                                                          ; DRAW COLORED DOWN + SPACE
	.DB $19, $1C, $1B                                                                                ; DRAW COLORED STARS
	.DB $FF                                                                                          ; END

P2_TO_P1_SIDE_CHANGE_STATUS_BAR_SCRIPT:                                                              ; 0X56 DRAW P2 TO P1 SIDE CHANGE
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $43                                                                                     ; SET PPU ADDR = $2443
	.DB $19, $1C, $1B, $19, $1C, $1B                                                                 ; COLORED STAR TILE IDS
	.DB " SIDE CHANGE "                                                                              ; 
	.DB $19, $1C, $1B, $19, $1C, $1B                                                                 ; COLORED STARS TILE IDS 
	.DB $8C, $61                                                                                     ; SET PPU ADDR = $2461
	.DB "NEXT OFFENSE      NEXT DEFENSE"                                                             ;
	.DB $FF                                                                                          ; END

P1_TO_P2_SIDE_CHANGE_STATUS_BAR_SCRIPT:                                                              ; 0X57 DRAW P1 TO P2 SIDE CHANGE
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $43                                                                                     ; SET PPU ADDR = $2443
	.DB $19, $1C, $1B, $19, $1C, $1B                                                                 ; COLORED STAR TILE IDS
	.DB " SIDE CHANGE "                                                                              ;
	.DB $19, $1C, $1B, $19, $1C, $1B                                                                 ; COLORED STARS TILE IDS
	.DB $8C, $61                                                                                     ; SET PPU ADDR = $2461
	.DB "NEXT DEFENSE      NEXT OFFENSE"                                                             ; 
	.DB $FF                                                                                          ; END

TOUCHDOWN_LARGE_STATUS_BAR_SCRIPT:                                                                   ; 0X58 DRAW "TOUCHDOWN" TOP OF SCREEN 2
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $F6                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 16
	.DB $8C, $44                                                                                     ; SET PPU ADDR = $2444 
	.DB "TOUCHDOWN !"
	.DB $FF                                                                                          ; END

TRY_FOR_POINT_STATUS_BAR_SCRIPT:                                                                     ; 0X59 DRAW "TRY FOR POINT" TOP OF SCREEN 2
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO 
	.DB $8C, $49                                                                                     ; SET PPU ADDR = $2449
	.DB "TRY FOR POINT"
	.DB $FF                                                                                          ; END

SAFETY_STATUS_BAR_SCRIPT:                                                                            ; 0X5A DRAW "SAFETY" LARGE LETTERS TOP OF SCREEN 2
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $F6                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 16
	.DB $8C, $48                                                                                     ; SET PPU ADDR = $2448
	.DB "SAFETY !"
	.DB $FF                                                                                          ; END

INCOMPLETE_PASS_STATUS_BAR_SCRIPT:                                                                   ; 0X5B DRAW "INCOMPLETE PASS" BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $49                                                                                     ; SET PPU ADDR = $2449
	.DB "INCOMPLETE PASS"                                                                            ;
	.DB $FF                                                                                          ; END 

TOUCHBACK_STATUS_BAR_SCRIPT:                                                                         ; 0X5C DRAW "TOUCHBACK" BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $4A                                                                                     ;
	.DB "TOUCHBACK"                                                                                  ;
	.DB $FF                                                                                          ; END

INTERCEPTION_STATUS_BAR_SCRIPT:                                                                      ; 0X5D DRAW "INTERCEPTION" BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $46                                                                                     ; SET PPU ADDR = $2446
	.DB $19, $1C, $1B                                                                                ; DRAW COLORED STARS 
	.DB " INTERCEPTION "                                                                             ;
	.DB $19, $1C, $1B                                                                                ; DRAW COLOTED STARS
	.DB $FF                                                                                          ; END

FIELD_GOAL_STATUS_BAR_SCRIPT_DUPLICATE:                                                                        ; 0X5E DRAW FIELD GOAL BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $4B                                                                                     ; SET PPU ADDR = $244B
	.DB      "FIELD GOAL"                                                                            ;
	.DB $FF                                                                                          ; END

RECOVER_STATUS_BAR_SCRIPT:                                                                           ; 0X5F DRAW RECOVER BANNER TEXT OFFSCREEN 
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $4C                                                                                     ; SET PPU ADDR = $244C
	.DB      "RECOVER"                                                                               ;
	.DB $FF                                                                                          ; END

QB_SACK_STATUS_BAR_SCRIPT:                                                                           ; 0X60 DRAW QB SACK BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $4B                                                                                     ; SET PPU ADDR = $244B
	.DB      "QB SACK !"                                                                             ;
	.DB $FF                                                                                          ; END 

KICK_BLOCK_STATUS_BAR_SCRIPT:                                                                        ; 0X61 DRAW KICK BLOCK BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $47                                                                                     ; SET PPU ADDR = $2447
	.DB $16, $16, $16                                                                                ; FOOTBALL DIAG DOWN TILE X3
	.DB " KICK BLOCK "                                                                               ;
	.DB $17, $17, $17                                                                                ; FOOTBALL DIAG UP TILE X3
	.DB $FF                                                                                          ; END

BLOCKED_PUNT_STATUS_BAR_SCRIPT:                                                                      ; 0X62 DRAW BLOCKED PUNT BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $46                                                                                     ; SET PPU ADDR = $2446
	.DB $16, $16, $16                                                                                ; FOOTBALL DIAG DOWN TILE X3
	.DB " BLOCKED PUNT "                                                                             ;
	.DB $17, $17, $17                                                                                ; FOOTBALL DIAG UP TILE X3
	.DB $FF                                                                                          ; END

PASS_BLOCK_STATUS_BAR_SCRIPT:                                                                        ; 0X63 DRAW PASS BLOCK BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $47                                                                                     ; SET PPU ADDR = $2447
	.DB $16, $16, $16                                                                                ; FOOTBALL DIAG DOWN TILE X3 
	.DB " PASS BLOCK "                                                                               ;
	.DB $17, $17, $17                                                                                ; FOOTBALL DIAG UP TILE X3
	.DB $FF                                                                                          ; END

ONSIDE_KICK_STATUS_BAR_SCRIPT:                                                                       ; 0X64 DRAW ONSIDE KICK BANNER TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $46                                                                                     ; SET PPU ADDR = $2446 
	.DB $16, $16, $16                                                                                ; FOOTBALL DIAG DOWN TILE X3
	.DB " ONSIDE KICK "                                                                              ;
	.DB $17, $17, $17                                                                                ; FOOTBALL DIAG UP TILE X3 
	.DB $FF                                                                                          ; END


PENALTY_STATUS_BAR_SCRIPT:                                                                           ; 0X65 DRAW PENALTY TEXT OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $4B                                                                                     ; SET PPU ADDR = $244B
	.DB      "PENALTY !"                                                                             ;
	.DB $FF                                                                                          ; END

OUT_OF_BOUNDS_STATUS_BAR_SCRIPT:                                                                     ; 0X66 DRAW OUT OF BOUNDS OFFSCREEN
	.DB $E2                                                                                          ; CLEAR TOP TWO ROWS OF NAME TABLE TWO
	.DB $8C, $49                                                                                     ; SET PPU ADDR = $2449
	.DB      "OUT OF BOUNDS"                                                                         ;
	.DB $FF                                                                                          ; END


CLEAR_THEN_NT1_OUT_OF_BOUNDS_STATUS_BAR_SCRIPT:                                                      ; 0X67 DRAW OUT OF BOUNDS CENTERED SCREEN 1   
	.DB $A0, $40, $02, $20, $00                                                                      ; FILL BOX (ADDR=2040, Y=2, X=32, BLANK TILE)
	.DB $88, $49                                                                                     ; SET PPU ADDR = $2049
	.DB "OUT OF BOUNDS"                                                                              ;
	.DB $FF                                                                                          ; END
	
_F}_STATUS_BAR_SCRIPTS	

_F{_PRESEASON_LARGE_LETTERS_SCREEN_SCRIPT

PRESEASON_LARGE_LETTERS_SCREEN_SCRIPT:                                                               ; 0X68 DRAW PRESEASON LARGE LETTERS CENTER OF SCREEN
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $D0, $20, $1A                                                                                ; SET IRQ0 BG CHR BANKS = (TEXT AND MENU BORDERS,LARGE LETTERS)
	.DB $F6                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 16
	.DB $89, $A6                                                                                     ; SET PPU ADDR = $21A6
	.DB "PRESEASON"                                                                                  ;
	.DB $FF                                                                                          ; END
	
_F}_PRESEASON_LARGE_LETTERS_SCREEN_SCRIPT	

_F{_REG_SEASON_LARGE_LETTERS_SCREEN_SCRIPT

REG_SEASON_LARGE_LETTERS_SCREEN_SCRIPT:                                                              ; 0X69 DRAW REGULAR SEASON LARGE LETTERS CENTER OF SCREEN
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $D0, $20, $1A                                                                                ; SET IRQ0 BG CHR BANKS = (TEXT AND MENU BORDERS,LARGE LETTERS)
	.DB $F6                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 16
	.DB $89, $A2                                                                                     ; SET PPU ADDR = $21A2
	.DB "REGULAR SEASON"                                                                             ;
	.DB $FF                                                                                          ; END

_F}_REG_SEASON_LARGE_LETTERS_SCREEN_SCRIPT	

_F{_PRO_BOWL_LARGE_LETTERS_SCREEN_SCRIPT

PRO_BOWL_LARGE_LETTERS_SCREEN_SCRIPT:                                                                ; 0X6A DRAW PRO BOWL LARGE LETTERS CENTER OF SCREEN
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $D0, $20, $1A                                                                                ; SET IRQ0 BG CHR BANKS = (TEXT AND MENU BORDERS,LARGE LETTERS)
	.DB $F6                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 16
	.DB $89, $A8                                                                                     ; SET PPU ADDR = $21A8
	.DB "PRO BOWL"                                                                                   ; 
	.DB $FF                                                                                          ; END
	
_F}_PRO_BOWL_LARGE_LETTERS_SCREEN_SCRIPT	

_F{_FINAL_STANDINGS_SCREEN_SCRIPT

FINAL_STANDINGS_SCREEN_SCRIPT:                                                                       ; 0X6B DRAW FINAL STANDINGS
	.DB $CC                                                                                          ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $D0, $20, $1A                                                                                ; SET IRQ0 BG CHR BANKS = (TEXT AND MENU BORDERS,LARGE LETTERS)
	.DB $FB, $1E                                                                                     ; WAIT 30 FRAMES = 0.5 SEC
	.DB $F3, $32                                                                                     ; PLAY SONG (NFL STANDINGS SONG)
	.DB $F6                                                                                          ; SET TEXT/SPRITE SIZE TO 08 X 16
	.DB $89, $6C                                                                                     ; SET PPU ADDR = $216C
	.DB "1991"                                                                                       ; 
	.DB $89, $C3                                                                                     ; SET PPU ADDR = $21C3
	.DB "NFL STANDINGS"                                                                              ;
	.DB $E5, $00, $00                                                                                ; SET AND FADE IN BG SPR PALLETE (BG,SPR PAL INDEX)
	.DB $FB, $F0                                                                                     ; WAIT 240 FRAMES = 4 SEC
	.DB $E8                                                                                          ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $FF                                                                                          ; END
	
_F}_FINAL_STANDINGS_SCREEN_SCRIPT	

_F{_ALL_AFC_EAST_CITY_ABBREV_SCRIPT

ALL_AFC_EAST_CITY_ABBREV_SCRIPT:                                                                     ; DRAW AFC EAST INITIALS
	.DB $D6, $00                                                                                     ; DRAW TEAM INITIALS (BUFFALO)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $01                                                                                     ; DRAW TEAM INITIALS (INDY)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $02                                                                                     ; DRAW TEAM INITIALS (MIAMI)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $03                                                                                     ; DRAW TEAM INITIALS (NEW ENGLAND)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $04                                                                                     ; DRAW TEAM INITIALS (JETS)
	.DB $FE                                                                                          ; RETURN 

_F}_ALL_AFC_EAST_CITY_ABBREV_SCRIPT

_F{_ALL_AFC_CENT_CITY_ABBREV_SCRIPT	

ALL_AFC_CENT_CITY_ABBREV_SCRIPT:                                                                     ; DRAW AFC CENTRAL INITIALS
	.DB $D6, $05                                                                                     ; DRAW TEAM INITIALS (CINCY)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $06                                                                                     ; DRAW TEAM INITIALS (CLEVELAND)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $07                                                                                     ; DRAW TEAM INITIALS (HOUSTON)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $08                                                                                     ; DRAW TEAM INITIALS (PITTSBURGH)
	.DB $B5                                                                                          ; DOWN 6 ROWS
	.DB $FE                                                                                          ; RETURN
	
_F}_ALL_AFC_CENT_CITY_ABBREV_SCRIPT		

_F{_ALL_AFC_WEST_CITY_ABBREV_SCRIPT	

ALL_AFC_WEST_CITY_ABBREV_SCRIPT:                                                                     ; DRAW AFC WEST INITIALS
	.DB $D6, $09                                                                                     ; DRAW TEAM INITIALS (DENVER)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $0A                                                                                     ; DRAW TEAM INITIALS (KANSAS CITY)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $0B                                                                                     ; DRAW TEAM INITIALS (OAKLAND)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $0C                                                                                     ; DRAW TEAM INITIALS (SAN DIEGO)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $0D                                                                                     ; DRAW TEAM INITIALS (SEATTLE)
	.DB $B3                                                                                          ; DOWN 4 ROWS
	.DB $FE                                                                                          ; RETURN 

_F}_ALL_AFC_WEST_CITY_ABBREV_SCRIPT		

_F{_ALL_NFC_EAST_CITY_ABBREV_SCRIPT

ALL_NFC_EAST_CITY_ABBREV_SCRIPT:                                                                     ; DRAW NFC EAST INITIALS
	.DB $D6, $0E                                                                                     ; DRAW TEAM INITIALS (WASHINGTON)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $0F                                                                                     ; DRAW TEAM INITIALS (NEW YORK GIANT)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $10                                                                                     ; DRAW TEAM INITIALS (PHILLY)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $11                                                                                     ; DRAW TEAM INITIALS (PHOENIX)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $12                                                                                     ; DRAW TEAM INITIALS (DALLAS)
	.DB $FE                                                                                          ; RETURN
	
_F}_ALL_NFC_EAST_CITY_ABBREV_SCRIPT	

_F{_ALL_NFC_CENT_CITY_ABBREV_SCRIPT

ALL_NFC_CENT_CITY_ABBREV_SCRIPT:                                                                     ; DRAW NFC CENTRAL INITIALS
	.DB $D6, $13                                                                                     ; DRAW TEAM INITIALS (CHICAGO)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $14                                                                                     ; DRAW TEAM INITIALS (DETROIT)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $15                                                                                     ; DRAW TEAM INITIALS (GREEN BAY)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $16                                                                                     ; DRAW TEAM INITIALS (MINNESOTA)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $17                                                                                     ; DRAW TEAM INITIALS (TAMPA BAY)
	.DB $FE                                                                                          ; RETURN

_F}_ALL_NFC_CENT_CITY_ABBREV_SCRIPT	

_F{_ALL_NFC_WEST_CITY_ABBREV_SCRIPT	

ALL_NFC_WEST_CITY_ABBREV_SCRIPT:                                                                     ; DRAW NFC WEST INITIALS
	.DB $D6, $18                                                                                     ; DRAW TEAM INITIALS (SAN FRANCISCO)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $19                                                                                     ; DRAW TEAM INITIALS (RAMS)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $1A                                                                                     ; DRAW TEAM INITIALS (NEW ORLEANS)
	.DB $B1                                                                                          ; DOWN 2 ROWS
	.DB $D6, $1B                                                                                     ; DRAW TEAM INITIALS (ATLANTA)
	.DB $FE                                                                                          ; RETURN
	
_F}_ALL_NFC_WEST_CITY_ABBREV_SCRIPT		

.PAD $BC00, $FF 

OFFSET_TO_TEAM_ABBR_POINTERS					= $0 

OFFSET_TO_TEAM_CITY_POINTERS 					= (TEAM_CITY_POINTERS - TEAM_ABBREVIATION_POINTERS)/2

OFFSET_TO_TEAM_MASCOT_POINTERS					= (TEAM_MASCOT_POINTERS - TEAM_ABBREVIATION_POINTERS)/2 

OFFSET_TO_TEAM_DIVISION_LOC_POINTERS			= (DIVISION_LOC_TEXT_POINTERS - TEAM_ABBREVIATION_POINTERS)/2

OFFSET_TO_LEAGUE_AND_CONF_TEXT_POINTERS			= (LEAGUE_AND_CONF_TEXT_POINTERS - TEAM_ABBREVIATION_POINTERS)/2

OFFSET_TO_COIN_TOSS_CONTROL_TYPE_TEXT_POINTERS	= (COIN_TOSS_CONTROL_TEXT_POINTERS - TEAM_ABBREVIATION_POINTERS)/2

OFFSET_TO_DOWN_TEXT_POINTERS 					= (DOWN_NAME_TEXT_POINTERS - TEAM_ABBREVIATION_POINTERS)/2

TEAM_TEXT_INFO_DATA_START:

_F{_TEAM_ABBREVIATION_POINTER_TABLE
								
TEAM_ABBREVIATION_POINTERS:							; TEAM_ABBREVIATION_POINTERS BC00
	.WORD BUFFALO_INITIALS
	.WORD INDIANAPOLIS_INITIALS
	.WORD MIAMI_INITIALS
	.WORD NEW_ENGLAND_INITIALS
	.WORD NEW_YORK_JETS_INITIALS
	.WORD CINCINNATI_INITIALS
	.WORD CLEVELAND_INITIALS
	.WORD HOUSTON_INITIALS
	.WORD PITTSBURGH_INITIALS
	.WORD DENVER_INITIALS
	.WORD KANSAS_CITY_INITIALS
	.WORD LOS_ANGELES_RAIDERS_INITIALS
	.WORD SAN_DIEGO_INITIALS
	.WORD SEATTLE_INITIALS
	.WORD WASHINGTON_INITIALS
	.WORD NEW_YORK_GIANTS_INITIALS
	.WORD PHILADELPHIA_INITIALS
	.WORD PHOENIX_INITIALS
	.WORD DALLAS_INITIALS
	.WORD CHICAGO_INITIALS
	.WORD DETROIT_INITIALS
	.WORD GREEN_BAY_INITIALS
	.WORD MINNESOTA_INITIALS
	.WORD TAMPA_BAY_INITIALS
	.WORD SAN_FRANCISCO_INITIALS
	.WORD LOS_ANGELES_RAMS_INITIALS
	.WORD NEW_ORLEANS_INITIALS
	.WORD ATLANTA_INITIALS
	.WORD AFC_INITIALS
	.WORD NFC_INITIALS
	.WORD BLANK_SPACE
	.WORD BLANK_SPACE
	
_F}_TEAM_ABBREVIATION_POINTER_TABLE	

_F{_TEAM_CITY_POINTER_TABLE

TEAM_CITY_POINTERS:							; TEAM_LOCATION_POINTERS BC40
	.WORD BUFFALO_LOCATION
	.WORD INDIANAPOLIS_LOCATION
	.WORD MIAMI_LOCATION
	.WORD NEW_ENGLAND_LOCATION
	.WORD NEW_YORK_JETS_LOCATION
	.WORD CINCINNATI_LOCATION
	.WORD CLEVELAND_LOCATION
	.WORD HOUSTON_LOCATION
	.WORD PITTSBURGH_LOCATION
	.WORD DENVER_LOCATION
	.WORD KANSAS_CITY_LOCATION
	.WORD LOS_ANGELES_RAIDERS_LOCATION
	.WORD SAN_DIEGO_LOCATION
	.WORD SEATTLE_LOCATION
	.WORD WASHINGTON_LOCATION
	.WORD NEW_YORK_GIANTS_LOCATION
	.WORD PHILADELPHIA_LOCATION
	.WORD PHOENIX_LOCATION
	.WORD DALLAS_LOCATION
	.WORD CHICAGO_LOCATION
	.WORD DETROIT_LOCATION
	.WORD GREEN_BAY_LOCATION
	.WORD MINNESOTA_LOCATION
	.WORD TAMPA_BAY_LOCATION
	.WORD SAN_FRANCISCO_LOCATION
	.WORD LOS_ANGELES_RAMS_LOCATION
	.WORD NEW_ORLEANS_LOCATION
	.WORD ATLANTA_LOCATION
	.WORD BLANK_LOCATION_1
	.WORD BLANK_LOCATION_2
	.WORD BUFFALO_MASCOT 				; Filler
	.WORD BUFFALO_MASCOT 				; Filler
	
_F}_TEAM_CITY_POINTER_TABLE	

_F{_TEAM_MASCOT_POINTER_TABLE

TEAM_MASCOT_POINTERS:							; TEAM_MASCOT_POINTERS BC80
	.WORD BUFFALO_MASCOT
	.WORD INDIANAPOLIS_MASCOT
	.WORD MIAMI_MASCOT
	.WORD NEW_ENGLAND_MASCOT
	.WORD NEW_YORK_JETS_MASCOT
	.WORD CINCINNATI_MASCOT
	.WORD CLEVELAND_MASCOT
	.WORD HOUSTON_MASCOT
	.WORD PITTSBURGH_MASCOT
	.WORD DENVER_MASCOT
	.WORD KANSAS_CITY_MASCOT
	.WORD LOS_ANGELES_RAIDERS_MASCOT
	.WORD SAN_DIEGO_MASCOT
	.WORD SEATTLE_MASCOT
	.WORD WASHINGTON_MASCOT
	.WORD NEW_YORK_GIANTS_MASCOT
	.WORD PHILADELPHIA_MASCOT
	.WORD PHOENIX_MASCOT
	.WORD DALLAS_MASCOT
	.WORD CHICAGO_MASCOT
	.WORD DETROIT_MASCOT
	.WORD GREEN_BAY_MASCOT
	.WORD MINNESOTA_MASCOT
	.WORD TAMPA_BAY_MASCOT
	.WORD SAN_FRANCISCO_MASCOT
	.WORD LOS_ANGELES_RAMS_MASCOT
	.WORD NEW_ORLEANS_MASCOT
	.WORD ATLANTA_MASCOT
	.WORD AFC_MASCOT
	.WORD NFC_MASCOT
	.WORD FIRST 					; Filler
	.WORD FIRST 					; Filler
	
_F}_TEAM_MASCOT_POINTER_TABLE	

_F{_DOWN_NAME_TEXT_POINTER_TABLE

DOWN_NAME_TEXT_POINTERS:							; DOWN NAME POINTERS
	.WORD FIRST
	.WORD SECOND
	.WORD THIRD
	.WORD FOURTH
	
_F}_DOWN_NAME_TEXT_POINTER_TABLE	

_F{_CONTROL_TYPE_TEXT_POINTER_TABLE

CONTROL_TYPE_TEXT_POINTERS:							; SEASON TEAM COLORED TEAM CONTROL TYPE POINTERS
	.WORD MAN_CHOICE
	.WORD COACH_CHOICE
	.WORD COMPUTER_CHOICE
	.WORD SKIP_CHOICE
	
_F}_CONTROL_TYPE_TEXT_POINTER_TABLE	

_F{_OFF_DEF_RANKING_TEXT_POINTER_TABLE

OFF_DEF_TEXT_POINTERS:							; RANKINGS TEXT POINTERS
	.WORD OFFENSE
	.WORD DEFENSE

_F}_OFF_DEF_RANKING_TEXT_POINTER_TABLE	

_F{_DIVISION_LOC_TEXT_POINTER_TABLE

DIVISION_LOC_TEXT_POINTERS:							; DIVISION NAME POINTERS
	.WORD EAST
	.WORD CENTRAL
	.WORD WEST
	
_F}_DIVISION_LOC_TEXT_POINTER_TABLE	

_F{_LEAGUE_AND_CONF_TEXT_POINTER_TABLE

LEAGUE_AND_CONF_TEXT_POINTERS:							; LEAGUE AND CONFERENCE NAME POINTERS
	.WORD NFL
	.WORD AFC
	.WORD NFC
	
_F}_LEAGUE_AND_CONF_TEXT_POINTER_TABLE	

_F{_COIN_TOSS_CONTROL_TEXT_POINTERS

COIN_TOSS_CONTROL_TEXT_POINTERS:
	.WORD MAN_CONTROL_COIN_TOSS_TEXT
	.WORD COA_CONTROL_COIN_TOSS_TEXT
	.WORD COM_CONTROL_COIN_TOSS_TEXT
	.WORD SKP_CONTROL_COIN_TOSS_TEXT

_F}_COIN_TOSS_CONTROL_TEXT_POINTERS	

	.WORD END_TEAM_INFO
	.WORD END_TEAM_INFO
	.WORD END_TEAM_INFO
	.WORD END_TEAM_INFO

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_F{_TEAM_ABBREVIATION_TEXT_DATA

TEAM_ABBREVIATION_DATA:							; START OF TEAM ABBREVIATION TEXT

BUFFALO_INITIALS:	
       .DB "BUF."
INDIANAPOLIS_INITIALS:	
       .DB "IND."
MIAMI_INITIALS:	
       .DB "MIA."
NEW_ENGLAND_INITIALS:	
       .DB "N.E."
NEW_YORK_JETS_INITIALS:	
       .DB "JETS"

CINCINNATI_INITIALS:	
       .DB "CIN."
CLEVELAND_INITIALS:	
       .DB "CLE."
HOUSTON_INITIALS:	
       .DB "HOU."
PITTSBURGH_INITIALS:	
       .DB "PIT."

DENVER_INITIALS:	
       .DB "DEN."
KANSAS_CITY_INITIALS:	
       .DB "K.C."
LOS_ANGELES_RAIDERS_INITIALS:	
       .DB "RAI."
SAN_DIEGO_INITIALS:	
       .DB "S.D."
SEATTLE_INITIALS:	
       .DB "SEA."

WASHINGTON_INITIALS:	
       .DB "WAS."
NEW_YORK_GIANTS_INITIALS:	
       .DB "GIA."
PHILADELPHIA_INITIALS:	
       .DB "PHI."
PHOENIX_INITIALS:	
       .DB "PHX."
DALLAS_INITIALS:	
       .DB "DAL."

CHICAGO_INITIALS:	
       .DB "CHI."
DETROIT_INITIALS:	
       .DB "DET."
GREEN_BAY_INITIALS:	
       .DB "G.B."
MINNESOTA_INITIALS:	
       .DB "MIN."
TAMPA_BAY_INITIALS:	
       .DB "T.B."

SAN_FRANCISCO_INITIALS:	
       .DB "S.F."
LOS_ANGELES_RAMS_INITIALS:	
       .DB "RAMS"
NEW_ORLEANS_INITIALS:	
       .DB "N.O."
ATLANTA_INITIALS:	
       .DB "ATL."

AFC_INITIALS:	
       .DB "AFC "
NFC_INITIALS:	
       .DB "NFC "
BLANK_SPACE: 
       .DB "    "
	   
_F}_TEAM_ABBREVIATION_TEXT_DATA	   

_F{_TEAM_CITIES_TEXT_DATA

	  
TEAM_CITIES_DATA:
							; START OF TEAM LOCATION TEXT
BUFFALO_LOCATION:	
       .DB "BUFFALO"
INDIANAPOLIS_LOCATION:	
       .DB "INDIANAPOLIS"
MIAMI_LOCATION:	
       .DB "MIAMI"
NEW_ENGLAND_LOCATION:	
       .DB "NEW ENGLAND"
NEW_YORK_JETS_LOCATION:	
       .DB "NEW YORK"
CINCINNATI_LOCATION:	
       .DB "CINCINNATI"
CLEVELAND_LOCATION:	
       .DB "CLEVELAND"
HOUSTON_LOCATION:	
       .DB "HOUSTON"
PITTSBURGH_LOCATION:	
       .DB "PITTSBURGH"
DENVER_LOCATION:	
	   .DB "DENVER"
KANSAS_CITY_LOCATION:	
       .DB "KANSAS CITY"
LOS_ANGELES_RAIDERS_LOCATION:	
       .DB "LOS ANGELES"
SAN_DIEGO_LOCATION:	
       .DB "SAN DIEGO"
SEATTLE_LOCATION:	
       .DB "SEATTLE"
WASHINGTON_LOCATION:	
       .DB "WASHINGTON"
NEW_YORK_GIANTS_LOCATION:	
       .DB "NEW YORK"
PHILADELPHIA_LOCATION:	
       .DB "PHILADELPHIA"
PHOENIX_LOCATION:	
       .DB "PHOENIX"
DALLAS_LOCATION:	
       .DB "DALLAS"
CHICAGO_LOCATION:	
       .DB "CHICAGO"
DETROIT_LOCATION:	
       .DB "DETROIT"
GREEN_BAY_LOCATION:	
       .DB "GREEN BAY"
MINNESOTA_LOCATION:	
       .DB "MINNESOTA"
TAMPA_BAY_LOCATION:	
       .DB "TAMPA BAY"
SAN_FRANCISCO_LOCATION:	
       .DB "SAN FRANCISCO"
LOS_ANGELES_RAMS_LOCATION:	
       .DB "LOS ANGELES"
NEW_ORLEANS_LOCATION:	
       .DB "NEW ORLEANS"
ATLANTA_LOCATION:	
       .DB "ATLANTA"
BLANK_LOCATION_1:	
       .DB " "
BLANK_LOCATION_2:	
       .DB " "
	   
_F}_TEAM_CITIES_TEXT_DATA	   

_F{_TEAM_MASCOT_TEXT_DATA

TEAM_MASCOT_DATA:							; START OF TEAM MASCOT TEXT

BUFFALO_MASCOT:	
       .DB "BILLS"
INDIANAPOLIS_MASCOT:	
       .DB "COLTS"
MIAMI_MASCOT:	
       .DB "DOLPHINS"
NEW_ENGLAND_MASCOT:	
       .DB "PATRIOTS"
NEW_YORK_JETS_MASCOT:	
       .DB "JETS"

CINCINNATI_MASCOT:	
       .DB "BENGALS"
CLEVELAND_MASCOT:	
       .DB "BROWNS"
HOUSTON_MASCOT:	
       .DB "OILERS"
PITTSBURGH_MASCOT:	
       .DB "STEELERS"

DENVER_MASCOT:	
       .DB "BRONCOS"
KANSAS_CITY_MASCOT:	
       .DB "CHIEFS"
LOS_ANGELES_RAIDERS_MASCOT:	
       .DB "RAIDERS"
SAN_DIEGO_MASCOT:	
       .DB "CHARGERS"
SEATTLE_MASCOT:	
       .DB "SEAHAWKS"

WASHINGTON_MASCOT:	
       .DB "REDSKINS"
NEW_YORK_GIANTS_MASCOT:	
       .DB "GIANTS"
PHILADELPHIA_MASCOT:	
       .DB "EAGLES"
PHOENIX_MASCOT:	
       .DB "CARDINALS"
DALLAS_MASCOT:	
       .DB "COWBOYS"

CHICAGO_MASCOT:	
       .DB "BEARS"
DETROIT_MASCOT:	
       .DB "LIONS"
GREEN_BAY_MASCOT:	
       .DB "PACKERS"
MINNESOTA_MASCOT:	
       .DB "VIKINGS"
TAMPA_BAY_MASCOT:	
       .DB "BUCCANEERS"
SAN_FRANCISCO_MASCOT:	
       .DB "49ERS"

LOS_ANGELES_RAMS_MASCOT:	
       .DB "RAMS"
NEW_ORLEANS_MASCOT:	
       .DB "SAINTS"
ATLANTA_MASCOT:	
       .DB "FALCONS"

AFC_MASCOT:	
       .DB "AFC"
NFC_MASCOT:	
       .DB "NFC"
	   
_F}_TEAM_MASCOT_TEXT_DATA	   

_F{_DOWN_NAME_TEXT_DATA

DOWN_NAME_TEXT_DATA:							; START OF DOWN NAME TEXT

FIRST:		.DB "1ST"
SECOND:		.DB "2ND"
THIRD:		.DB "3RD"
FOURTH:		.DB "4TH"

_F}_DOWN_NAME_TEXT_DATA

_F{_CONTROL_TYPE_TEXT_DATA

CONTROL_TYPE_TEXT_DATA:							; START OF TEAM CONTROL TYPE TEXT use special tile ids 
MAN_CHOICE:		 .DB $D6, $D7, $B8				; "MAN"
COACH_CHOICE:	 .DB $D4, $D5, $D7				; "COA"
COMPUTER_CHOICE: .DB $D8, $D9, $DA				; "COM"
SKIP_CHOICE:	 .DB $DB, $DC, $DD  			; "SKP"

_F}_CONTROL_TYPE_TEXT_DATA

_F{_OFF_DEF_RANKINGS_TEXT_DATA

OFF_DEF_TEXT_DATA:

OFFENSE:		
	.DB "OFFENSE"
DEFENSE:		
	.DB "DEFENSE"

_F}_OFF_DEF_RANKINGS_TEXT_DATA

_F{_DIV_LOCATION_TEXT_DATA

DIV_LOCATION_TEXT_DATA:							; START OF DIVISION NAME TEXT

EAST:			.DB "EAST"
CENTRAL:		.DB "CENTRAL"
WEST:			.DB "WEST"

_F}_DIV_LOCATION_TEXT_DATA

_F{_LEAGUE_AND_CONFERENCE_TEXT_DATA

CONFERENCE_TEXT_DATA:										; START OF CONFERENCE NAME TEXT
NFL:			.DB "NFL"
AFC:			.DB "AFC"
NFC:			.DB "NFC"

_F}_LEAGUE_AND_CONFERENCE_TEXT_DATA

_F{_CONTROL_TYPE_COIN_TOSS_TEXT_DATA

CONTROL_TYPE_COIN_TOSS_TEXT_DATA:							; START OF TEAM CONTROL (COIN TOSS SCREEN) TYPE TEXT 
MAN_CONTROL_COIN_TOSS_TEXT:			.DB "MAN"	
COA_CONTROL_COIN_TOSS_TEXT:		    .DB "COA"
COM_CONTROL_COIN_TOSS_TEXT:			.DB "COM"
SKP_CONTROL_COIN_TOSS_TEXT:			.DB "SKP"

_F}_CONTROL_TYPE_COIN_TOSS_TEXT_DATA

END_TEAM_INFO:	.DB $FF

.PAD $C000, $FF 