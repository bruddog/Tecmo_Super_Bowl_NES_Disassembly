


.BASE $A000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SCENE SCRIPTS SEASON SCENES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



_F{_SEASON_SCENE_SCRIPT_POINTER_TABLE

			.WORD NFL_LEADERS_SCREEN_SCRIPT                                                              ; 0x00 NFL LEADERS
			.WORD LEADING_PASSERS_QB_IMAGE_SCENE_SCRIPT                                                  ; 0x01 LEADING PASSERS IMAGE
			.WORD LEADING_PASSERS_SCENE_SCRIPT                                                           ; 0x02 LEADING PASSERS TEXT
			.WORD LEADING_PASSERS_HEADERS_SCENE_SCRIPT                                                   ; 0x03 LEADING PASSERS TEXT
			.WORD LEADING_RECIVERS_SCENE_SCRIPT                                                          ; 0x04 LEADING RECIEVERS
			.WORD LEADING_RUSHERS_SCENE_SCRIPT                                                           ; 0x05 LEADING RUSHERS
			.WORD LEADING_SCORERS_SCENE_SCRIPT                                                           ; 0x06 LEADING SCORERS
			.WORD LEADING_PUNTERS_SCENE_SCRIPT                                                           ; 0x07 LEADING PUNTERS
			.WORD INTERCEPTION_LEADERS_SCENE_SCRIPT                                                      ; 0x08 INTERCEPTION LEADERS
			.WORD SACK_LEADERS_SCENE_SCRIPT                                                              ; 0x09 SACK LEADERS
			.WORD PUNT_RETURN_LEADERS_SCENE_SCRIPT                                                       ; 0x0A LEADING PR
			.WORD KICK_RETURN_LEADERS_SCENE_SCRIPT                                                       ; 0x0B LEADING KR
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x0C IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x0D IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x0E IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x0F IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x10 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x11 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x12 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x13 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x14 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x15 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x16 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x17 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x18 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x19 IMMEDIATE END
			.WORD UNUSED_BANK8_SCREEN_SCRIPT                                                             ; 0x1A IMMEDIATE END
			.WORD SCOREBOARD_ALL_QTR_SCENE_SCRIPT                                                        ; 0x1B TEAM + SCOREBOARD ALL QTR SCORES
			.WORD SKP_SCOREBOARD_BLANK_SCENE_SCRIPT                                                      ; 0x1C TEAM + SCOREBOARD NO QTR SCORES 
			.WORD SKP_SCOREBOARD_FIRST_QTR_SCENE_SCRIPT                                                  ; 0x1D Q1 + TOTAL SCORES SKP MODE SCOREBOARD *** not used
			.WORD SKP_SCOREBOARD_SECOND_QTR_SCENE_SCRIPT                                                 ; 0x1E Q2 + TOTAL SCORES SKP MODE SCOREBOARD *** not used
			.WORD SKP_SCOREBOARD_THIRD_QTR_SCENE_SCRIPT                                                  ; 0x1F Q3 + TOTAL SCORES SKP MODE SCOREBOARD *** not used
			.WORD SKP_SCOREBOARD_FOURTH_QTR_SCENE_SCRIPT                                                 ; 0x20 Q4 + TOTAL SCORES SKP MODE SCOREBOARD THEN BLANK OUT SCOREBOARD *** not used
			.WORD SCORE_BOARD_FIRST_QTR_FADE_OUT_SCENE_SCRIPT                                            ; 0x21 TEAM + SCOREBOARD 1ST QTR SCORES
			.WORD SCORE_BOARD_SECOND_QTR_FADE_OUT_SCENE_SCRIPT                                           ; 0x22 TEAM + SCOREBOARD THRU 2ND QTR SCORES
			.WORD SCORE_BOARD_THIRD_QTR_FADE_OUT_SCENE_SCRIPT                                            ; 0x23 TEAM + SCOREBOARD THRU 3RD QTR SCORES
			.WORD UNUSED_TWO_BANK8_SCREEN_SCRIPT                                                         ; 0x24 IMMEDIATE END
			.WORD UNUSED_TWO_BANK8_SCREEN_SCRIPT                                                         ; 0x25 IMMEDIATE END
			.WORD RECOVERED_FROM_INJURY_SCENE_SCRIPT                                                     ; 0x26 RECOVERED SCREEN
			.WORD COIN_TOSS_INTRO_SCENE_SCRIPT                                                           ; 0x27 COIN TOSS INTRO
			.WORD HOME_WINS_COIN_TOSS_SCRIPT                                                             ; 0x28 COIN TOSS P1 WINS
			.WORD AWAY_WINS_COIN_TOSS_SCRIPT                                                             ; 0x29 COIN TOSS P2 WINS
			.WORD HOME_CHOOSE_KICK_RECV_SCENE_SCRIPT                                                     ; 0x2A CHOOSE RETURN OR KICKOFF TEXT P1
			.WORD AWAY_CHOOSE_KICK_RECV_SCENE_SCRIPT                                                     ; 0x2B CHOOSE RETURN OR KICKOFF TEXT P2
			.WORD HOME_WINS_COIN_TOSS_SCENE_SCRIPT                                                       ; 0x2C COIN TOSS P1 WINS
			.WORD AWAY_WINS_COIN_TOSS_SCENE_SCRIPT                                                       ; 0x2D COIN TOSS P2 WINS
			.WORD P1_MAKES_KICK_REC_CHOICE_SCRIPT                                                        ; 0x2E
			.WORD P2_MAKES_KICK_REC_CHOICE_SCRIPT                                                        ; 0x2F 
			.WORD KICKOFF_SCOREBOARD_AND_FLAGS_SCENE_SCRIPT                                                                   ; 0x30 
			.WORD OT_COIN_TOSS_HOME_WINS_SCENE_SCRIPT                                                    ; 0x31 OT COIN TOSS P1 WINS 
			.WORD OT_COIN_TOSS_AWAY_WINS_SCENE_SCRIPT                                                    ; 0x32 OT COIN TOSS P2 WINS
			.WORD UNUSED_THREE_BANK8_SCREEN_SCRIPT                                                       ; 0x33 IMMEDIATE END
			.WORD PRESEASON_LARGE_TEXT_SCREEN_SCRIPT                                                     ; 0x34 PRESEASON LARGE TEXT
			.WORD PROBOWL_LARGE_TEXT_SCREEN_SCRIPT                                                       ; 0x35 PRO BOWL LARGE TEXT
			.WORD REG_SEASON_FIRST_WEEK_SCREEN_SCRIPT                                                    ; 0x36 REGULAR SEASON 1ST WEEK
			.WORD REG_SEASON_SECOND_WEEK_SCREEN_SCRIPT                                                   ; 0x37 REGULAR SEASON 2ND WEEK
			.WORD REG_SEASON_THIRD_WEEK_SCREEN_SCRIPT                                                    ; 0x38 REGULAR SEASON 3RDWEEK
			.WORD REG_SEASON_FOURTH_WEEK_SCREEN_SCRIPT                                                   ; 0x39 REGULAR SEASON 4TH WEEK
			.WORD REG_SEASON_FIFTH_WEEK_SCREEN_SCRIPT                                                    ; 0x3A REGULAR SEASON 5TH WEEK
			.WORD REG_SEASON_SIXTH_WEEK_SCREEN_SCRIPT                                                    ; 0x3B REGULAR SEASON 6THWEEK
			.WORD REG_SEASON_SEVENTH_WEEK_SCREEN_SCRIPT                                                  ; 0x3C REGULAR SEASON 7TH WEEK
			.WORD REG_SEASON_EIGHTH_WEEK_SCREEN_SCRIPT                                                   ; 0x3D REGULAR SEASON 8TH WEEK
			.WORD REG_SEASON_NINTH_WEEK_SCREEN_SCRIPT                                                    ; 0x3E REGULAR SEASON 9TH WEEK
			.WORD REG_SEASON_TENTH_WEEK_SCREEN_SCRIPT                                                    ; 0x3F REGULAR SEASON 10TH WEEK
			.WORD REG_SEASON_ELEVENTH_WEEK_SCREEN_SCRIPT                                                 ; 0x40 REGULAR SEASON 11TH WEEK
			.WORD REG_SEASON_TWELTH_WEEK_SCREEN_SCRIPT                                                   ; 0x41 REGULAR SEASON 12TH WEEK
			.WORD REG_SEASON_THIRTEENTH_WEEK_SCREEN_SCRIPT                                               ; 0x42 REGULAR SEASON 13TH WEEK
			.WORD REG_SEASON_FOURTEENTH_WEEK_SCREEN_SCRIPT                                               ; 0x43 REGULAR SEASON 14TH WEEK
			.WORD REG_SEASON_FIFTHTEENTH_WEEK_SCREEN_SCRIPT                                              ; 0x44 REGULAR SEASON 15TH WEEK
			.WORD REG_SEASON_SIXTHTEENTH_WEEK_SCREEN_SCRIPT                                              ; 0x45 REGULAR SEASON 16TH WEEK
			.WORD REG_SEASON_SEVENTEENTH_WEEK_SCREEN_SCRIPT                                              ; 0x46 REGULAR SEASON 17TH WEEK
			.WORD REG_SEASON_EIGHTEENTH_WEEK_SCREEN_SCRIPT                                               ; 0x47 REGULAR SEASON 18TH WEEK
			.WORD REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                                                     ; 0x48 REGULAR SEASON WEEK SMALL 
			.WORD UNUSED_FOUR_BANK8_SCREEN_SCRIPT                                                        ; 0x49 IMMEDIATE END
			.WORD UNUSED_FOUR_BANK8_SCREEN_SCRIPT                                                        ; 0x4A IMMEDIATE END
			.WORD UNUSED_FOUR_BANK8_SCREEN_SCRIPT                                                        ; 0x4B IMMEDIATE END
			.WORD SKP_MODE_NO_OT_BLUE_SCREEN_SCENE_SCRIPT                                                ; 0x4C DRAW SCORES SMALL
			.WORD SKP_MODE_OT_BLUE_SCREEN_SCENE_SCRIPT                                                   ; 0x4D DRAW SCORES SMALL
			.WORD NO_OT_BLUE_SCREEN_SCENE_SCRIPT                                                         ; 0x4E FINAL SCOREBOARD
			.WORD OT_BLUE_SCREEN_SCENE_SCRIPT                                                            ; 0x4F FINAL SCOREBOARD OT
			.WORD UNUSED_FIVE_BANK8_SCREEN_SCRIPT                                                        ; 0x50 IMMEDIATE END *** bug should point afc first rd 
			.WORD UNUSED_FIVE_BANK8_SCREEN_SCRIPT                                                        ; 0x51 IMMEDIATE END *** bug should point nfc first rd 
			.WORD AFC_FIRST_ROUND_SCENE_SCRIPT                                                           ; 0x52 AFC FIRST ROUND PLAYOFF
			.WORD NFC_FIRST_ROUND_SCENE_SCRIPT                                                           ; 0x53 NFC FIRST ROUND PLAYOFF
			.WORD UNUSED_SIX_BANK8_SCREEN_SCRIPT                                                         ; 0x54 IMMEDIATE END *** bug should point afc divis
			.WORD UNUSED_SIX_BANK8_SCREEN_SCRIPT                                                         ; 0x55 IMMEDIATE END *** bug should point nfc divis
			.WORD AFC_DIVISIONAL_SCENE_SCRIPT                                                            ; 0x56 AFC DIVISIONAL PLAYOFF
			.WORD NFC_DIVISIONAL_SCENE_SCRIPT                                                            ; 0x57 NFC DIVISIONAL PLAYOFF
			.WORD AFC_CHAMPIONSHIP_SCENE_SCRIPT                                                          ; 0x58 AFC CHAMPIONSHIP
			.WORD NFC_CHAMPIONSHIP_SCENE_SCRIPT                                                          ; 0x59 NFC CHAMPIONSHIP
			.WORD SUPERBOWL_MATCHUP_SCREEN_SCENE_SCRIPT                                                  ; 0x5A SUPER BOWL
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x5B IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x5C IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x5D IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x5E IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x5F IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x60 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x61 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x62 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x63 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x64 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x65 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x66 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x67 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x68 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x69 IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x6A IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x6B IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x6C IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x6D IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x6E IMMEDIATE END
			.WORD UNUSED_SEVEN_BANK8_SCREEN_SCRIPT                                                       ; 0x6F IMMEDIATE END
			
_F}_SEASON_SCENE_SCRIPT_POINTER_TABLE			

_F{_BRACKET_HIGHLIGHTING_SCRIPT_POINTER_TABLE

START_OF_BRACKET_HIGHLIGHTING_PTRS: 
			
			.WORD AFC_WILDCARD_TWO_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 ; 0x70 
			.WORD AFC_WILDCARD_TWO_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT
			
			.WORD NFC_WILDCARD_TWO_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 ; 0x72 
			.WORD NFC_WILDCARD_TWO_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT
			
			.WORD AFC_WILDCARD_ONE_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 ; 0x74 
			.WORD AFC_WILDCARD_ONE_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT
			
			.WORD NFC_WILDCARD_ONE_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 ; 0x76 
			.WORD NFC_WILDCARD_ONE_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT
			
	
			.WORD AFC_DIVISIONAL_TWO_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                               ; 0x78 
			.WORD AFC_DIVISIONAL_TWO_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                    
			
			.WORD NFC_DIVISIONAL_TWO_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                               ; 0x7A 
			.WORD NFC_DIVISIONAL_TWO_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 
			
			
			.WORD AFC_DIVISIONAL_ONE_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                               ; 0x7C 
			.WORD AFC_DIVISIONAL_ONE_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                    
			
			.WORD NFC_DIVISIONAL_ONE_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                               ; 0x7E
			.WORD NFC_DIVISIONAL_ONE_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 
			                        
			.WORD AFC_CHAMPIONSHIP_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 ; 0x80 
			.WORD AFC_CHAMPIONSHIP_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT    
			
			.WORD NFC_CHAMPIONSHIP_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 ; 0x82 
			.WORD NFC_CHAMPIONSHIP_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT    
		
			.WORD SUPER_BOWL_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT                                 		; 0x82 
			.WORD SUPER_BOWL_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT  
	

_F}_BRACKET_HIGHLIGHTING_SCRIPT_POINTER_TABLE	
	
_F{_NFL_LEADERS_MAIN_MENU_SCREEN_SCRIPT
	
NFL_LEADERS_SCREEN_SCRIPT:                                                                               ; 0x00 NFL LEADERS MENU
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $F7, $3C                                                                                         ; DRAW BG (NFL PA FOOTBALL)
	.DB $F9, $01, $7F                                                                                    ; CLEAR SPRITES
	.DB $A8, $61, $08                                                                                    ; SET PPU ADDR =$2061 DRAW TOP LEFT EDGE OF MENU  BORDER TILE
	.DB $A8, $7E, $09                                                                                    ; SET PPU ADDR =$207E DRAW TOP RIGHT EDGE OF MENU  BORDER TILE
	.DB $AB, $61, $0A                                                                                    ; SET PPU ADDR =$2361 DRAW BOT LEFT EDGE OF MENU  BORDER TILE
	.DB $AB, $7E, $0B                                                                                    ; SET PPU ADDR =$237E DRAW BOT RIGHT EDGE OF MENU  BORDER TILE
	.DB $90, $81, $17, $0C                                                                               ; SET PPU ADDR =$2081 DRAW LEFT MENU BORDER LINE (23 TILES TILE ID =0C)
	.DB $90, $9E, $17, $0E                                                                               ; SET PPU ADDR =$209E DRAW RIGHT MENU BORDER LINE (23 TILES TILE ID =0E)
	.DB $98, $74, $0A, $0D                                                                               ; SET PPU ADDR =$2074 DRAW TOP MENU BORDER LINE (23 TILES TILE ID =0D
	.DB $9B, $62, $1C, $0F                                                                               ; SET PPU ADDR =$2362 DRAW BOT MENU BORDER LINE (23 TILES TILE ID =0F)
	.DB $88, $62                                                                                         ; SET PPU ADDR =$2062
	.DB      "INDIVIDUAL LEADERS"                                                                        ;
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB      "PASSING  RECEIVING   RUSHING"
	.DB $B5                                                                                              ; DOWN 6 ROWS
	.DB      "SCORING"                                                                                   ;
	.DB $B5                                                                                              ; DOWN 6 ROWS
	.DB      "INTERCEPTIONS         SACKS"
	.DB $B5                                                                                              ; DOWN 6 ROWS
	.DB      "PUNT RETURNS KICKOFF RETURNS"
	.DB $89, $77                                                                                         ; SET PPU ADDR =$2177
	.DB      "PUNTING"                                                                                   ; 
	.DB $80, $C4, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $20C4 = PASSING, DO-> DRAW NFL,AFC NFC CHOICES 
	.DB $80, $CE, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $20CE = RECEIVING, DO-> DRAW NFL,AFC NFC CHOICES
	.DB $80, $D9, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $20D9 = RUSHING, DO-> DRAW NFL,AFC NFC CHOICES
	.DB $81, $84, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $2184 = SCORING, DO-> DRAW NFL,AFC NFC CHOICES
	.DB $81, $99, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $2199 = PUNTING, DO-> DRAW NFL,AFC NFC CHOICES
	.DB $82, $44, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $2244 = INTERECEPTIONS, DO-> DRAW NFL,AFC NFC CHOICES
	.DB $82, $59, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $2259 = SACKS, DO-> DRAW NFL,AFC NFC CHOICES
	.DB $83, $06, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $2306 = PUNT RETURNS, DO-> DRAW NFL,AFC NFC CHOICES
	.DB $83, $14, <NFL_AFC_NFC_LEADERS_TEXT_SCRIPT, >NFL_AFC_NFC_LEADERS_TEXT_SCRIPT                     ; SET PPU ADDR = $2314 = KICK RETURNS, DO-> DRAW NFL,AFC NFC CHOICES
	.DB $83, $C8, <ATRR_VALS_ONE_MAIN_LEADERS_SCREEN, >ATRR_VALS_ONE_MAIN_LEADERS_SCREEN                 ; SET PPU ADDR = $23C8 =  INDIVIDUAL LEADERS, DO->SET ATTRIBUTE TABLE VALUES 1
	.DB $83, $D0, <ATRR_VALS_TWO_MAIN_LEADERS_SCREEN, >ATRR_VALS_TWO_MAIN_LEADERS_SCREEN                 ; SET PPU ADDR = $23D0 =  SCORING DO->SET ATTRIBUTE TABLE VALUES 2
	.DB $83, $D5, <ATRR_VALS_TWO_MAIN_LEADERS_SCREEN, >ATRR_VALS_TWO_MAIN_LEADERS_SCREEN                 ; SET PPU ADDR = $23D5 =  PUNTING DO->SET ATTRIBUTE TABLE VALUES 2
	.DB $83, $E0, <ATRR_VALS_ONE_MAIN_LEADERS_SCREEN, >ATRR_VALS_ONE_MAIN_LEADERS_SCREEN                 ; SET PPU ADDR = $23E0 =  INTEERCEPTIONS, DO->SET ATTRIBUTE TABLE VALUES 1
	.DB $83, $E8, <ATRR_VALS_THREE_MAIN_LEADERS_SCREEN, >ATRR_VALS_THREE_MAIN_LEADERS_SCREEN             ; SET PPU ADDR = $23E8 =  INTEERCEPTIONS, DO->SET ATTRIBUTE TABLE VALUES 3
	.DB $EB, $13, $24                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $DD, $03                                                                                         ; START OR END BLINKING PALLETE(PAL INDEX) DOESN'T DO ANYTHING HERE UNNEEDED
	.DB $FF                                                                                              ; END

NFL_AFC_NFC_LEADERS_TEXT_SCRIPT:                                                                         ; DRAW NFL,AFC NFC CHOICES
	.DB $03, "NFL"                                                                                       ; LENGTH + TEXT
	.DB $A1                                                                                              ; DOWN ONE ROW
	.DB $03, "AFC"                                                                                       ; LENGTH + TEXT
	.DB $A1                                                                                              ; DOWN ONE ROW
	.DB $03, "NFC"                                                                                       ; LENGTH + TEXT	
	.DB $FF                                                                                              ; END

ATRR_VALS_ONE_MAIN_LEADERS_SCREEN:                                                                       ; SET ATTRIBUTE TABLE VALUES 1
																										; LENGTH + ATTRIBS
	.DB $08, $04, $05, $05, $05, $05, $05, $05, $01
	.DB $FF                                                                                              ; END

ATRR_VALS_TWO_MAIN_LEADERS_SCREEN:                                                                       ; SET ATTRIBUTE TABLE VALUES 2
	.DB $03, $40, $50, $10                                                                               ;
	.DB $FF                                                                                              ; END

ATRR_VALS_THREE_MAIN_LEADERS_SCREEN:                                                                     ; SET ATTRIBUTE TABLE VALUES 3
	.DB $08, $40, $50, $50, $50, $50, $50, $50, $10
	.DB $FF                                                                                              ; END
	
_F}_NFL_LEADERS_MAIN_MENU_SCREEN_SCRIPT	

_F{_LEADING_PASSERS_MENU_SCREEN_SCRIPT

LEADING_PASSERS_QB_IMAGE_SCENE_SCRIPT:                                                                   ; 0x01 DRAW LEADING PASSERS SCREEN
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $F9, $01, $69                                                                                    ; DRAW SPRITE (QB SILOUHETTE) 
	.DB $84, $CC, <PASSING_LEADER_MENU_SCRIPT, >PASSING_LEADER_MENU_SCRIPT                               ; SET PPU ADDR = $24CC  AND DRAW RATINGS FILTER MENU
	.DB $FD, <ATTR_VALUE_PASSING_LEADER_SCRIPT, >ATTR_VALUE_PASSING_LEADER_SCRIPT                        ; DO->ATTRIBUTE VALUES FOR LEADING PASSER SCREEN
	.DB $EB, $23, $26                                                                                 ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FB, $3C                                                                                         ; WAIT 61 FRAMES
	.DB $FD, <DRAW_AFC_NFC_OR_NFL_SCRIPT, >DRAW_AFC_NFC_OR_NFL_SCRIPT                                    ; DO->DRAW NFL,AFC,OR NFC ABBREVIATION
	.DB      "LEADING PASSERS"                                                                           ;
	.DB $80, $42, <DRAW_THREE_STARS_LEFT_SIDE_SCRIPT, >DRAW_THREE_STARS_LEFT_SIDE_SCRIPT                 ;SET PPU ADDR = $2042,DO->3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS 
	.DB $80, $5A, <DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT, >DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT               ; SET PPU ADDR = $205A,DO->3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS
	.DB $FF                                                                                              ; END

ATTR_VALUE_PASSING_LEADER_SCRIPT:                                                                        ; ATTRIBUTE VALUES FOR LEADING PASSER SCREEN
	.DB $83, $CB, <ATTR_VALUE_ONE_PASSING_LEADER, >ATTR_VALUE_ONE_PASSING_LEADER                         ; SET PPU ADDR = $23CB, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 1
	.DB $83, $D3, <ATTR_VALUE_ONE_PASSING_LEADER, >ATTR_VALUE_ONE_PASSING_LEADER                         ; SET PPU ADDR = $23D3, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 1
	.DB $83, $DB, <ATTR_VALUE_ONE_PASSING_LEADER, >ATTR_VALUE_ONE_PASSING_LEADER                         ; SET PPU ADDR = $23DB, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 1
	.DB $83, $E3, <ATTR_VALUE_ONE_PASSING_LEADER, >ATTR_VALUE_ONE_PASSING_LEADER                         ; SET PPU ADDR = $23E3, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 1
	.DB $83, $EB, <ATTR_VALUE_ONE_PASSING_LEADER, >ATTR_VALUE_ONE_PASSING_LEADER                         ; SET PPU ADDR = $23EB, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 1
	.DB $83, $F3, <ATTR_VALUE_ONE_PASSING_LEADER, >ATTR_VALUE_ONE_PASSING_LEADER                         ; SET PPU ADDR = $23F3, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 1

	.DB $87, $C9, <ATTR_VALUE_TWO_PASSING_LEADER, >ATTR_VALUE_TWO_PASSING_LEADER                         ; SET PPU ADDR = $27C9, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 2
	.DB $87, $D1, <ATTR_VALUE_TWO_PASSING_LEADER, >ATTR_VALUE_TWO_PASSING_LEADER                         ; SET PPU ADDR = $27D1, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 2
	.DB $87, $D9, <ATTR_VALUE_TWO_PASSING_LEADER, >ATTR_VALUE_TWO_PASSING_LEADER                         ; SET PPU ADDR = $27D9, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 2
	.DB $87, $E1, <ATTR_VALUE_TWO_PASSING_LEADER, >ATTR_VALUE_TWO_PASSING_LEADER                         ; SET PPU ADDR = $27E1, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 2
	.DB $87, $E9, <ATTR_VALUE_TWO_PASSING_LEADER, >ATTR_VALUE_TWO_PASSING_LEADER                         ; SET PPU ADDR = $27E9, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 2
	.DB $87, $F1, <ATTR_VALUE_TWO_PASSING_LEADER, >ATTR_VALUE_TWO_PASSING_LEADER                         ; SET PPU ADDR = $27F1, DO->ATTRIBUTE VALUES PASSING LEADER SCREEN 2
	.DB $FE

ATTR_VALUE_ONE_PASSING_LEADER:                                                                           ; ATTRIBUTE VALUES PASSING LEADER SCREEN 1
	.DB $05                                                                                              ; LENGTH 
	.DB $04, $05, $00, $00, $00                                                                       ;
	.DB $FF                                                                                              ; END

ATTR_VALUE_TWO_PASSING_LEADER:                                                                           ; ATTRIBUTE VALUES PASSING LEADER SCREEN2
	.DB $02                                                                                              ; LENGTH
	.DB $C0, $F0                                                                                      ;
	.DB $FF                                                                                              ; END

DRAW_AFC_NFC_OR_NFL_SCRIPT:                                                                              ; DRAW NFL,AFC,OR NFC ABBREVIATION
	.DB $88, $46                                                                                         ; SET PPU ADDR = $2046
	.DB $FA, $18                                                                                         ; DRAW CONFERENCE/LEAGUE ABBREVAITION
	.DB $88, $4A                                                                                         ; SET PPU ADDR = $204A
	.DB $FE                                                                                              ; RETURN

LEADING_PASSERS_SCENE_SCRIPT:                                                                            ; LEADING PASSERS TEXT
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CA                                                                                              ; CLEAR ALL NAMETABLES()
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $84, $CC, <PASSING_LEADER_MENU_SCRIPT, >PASSING_LEADER_MENU_SCRIPT                               ; DO->DRAW LEADING PASSER MENU
	.DB $80, $42, <DRAW_THREE_STARS_LEFT_SIDE_SCRIPT, >DRAW_THREE_STARS_LEFT_SIDE_SCRIPT                 ; SET PPU ADDR = $2042,DO->3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS
	.DB $80, $5A, <DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT, >DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT               ; SET PPU ADDR = $205A,DO->3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS
	.DB $80, $4A, <DRAW_LEADING_PASSERS_TEXT_SCRIPT, >DRAW_LEADING_PASSERS_TEXT_SCRIPT                   ; SET PPU ADDR = $204A,DO->DRAW LEADING PASSERS TEXT
	.DB $FD, <DRAW_AFC_NFC_OR_NFL_SCRIPT, >DRAW_AFC_NFC_OR_NFL_SCRIPT                                    ; DO->DRAW NFL,AFC,OR NFC ABBREVIATION
	.DB $FD, <ATTR_VALUE_PASSING_LEADER_SCRIPT, >ATTR_VALUE_PASSING_LEADER_SCRIPT                        ; DO-> ATTRIBUTE VALUES FOR LEADING PASSER SCREEN
	.DB $EB, $23, $26                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FF                                                                                              ; END

LEADING_PASSERS_HEADERS_SCENE_SCRIPT:                                                                    ; LEADING PASSERS MENU 
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CA                                                                                              ; CLEAR ALL NAMETABLES()
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $84, $E0, <PASSING_LEADER_MENU_SCRIPT, >PASSING_LEADER_MENU_SCRIPT                               ; SET PPU ADDR = $24E0,DO->DRAW LEADING PASSER MENU
	.DB $80, $42, <DRAW_THREE_STARS_LEFT_SIDE_SCRIPT, >DRAW_THREE_STARS_LEFT_SIDE_SCRIPT                 ; SET PPU ADDR = $2042,DO->3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS
	.DB $80, $5A, <DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT, >DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT               ; SET PPU ADDR = $205A,DO->3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS
	.DB $80, $4A, <DRAW_LEADING_PASSERS_TEXT_SCRIPT, >DRAW_LEADING_PASSERS_TEXT_SCRIPT                   ; SET PPU ADDR = $204A,DO->DRAW LEADING PASSERS TEXT	
	.DB $FD, <DRAW_AFC_NFC_OR_NFL_SCRIPT, >DRAW_AFC_NFC_OR_NFL_SCRIPT                                    ; DO->DRAW NFL,AFC,OR NFC ABBREVIATION
	.DB $EB, $23, $26                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FF                                                                                              ; END

DRAW_LEADING_PASSERS_TEXT_SCRIPT:                                                                        ; DRAW LEADING PASSERS TEXT
	.DB $0F                                                                                              ; LENGTH
	.DB "LEADING PASSERS"                                                                                ;
	.DB $FF                                                                                              ; END

PASSING_LEADER_MENU_SCRIPT:                                                                              ; DRAW LEADING PASSER MENU
	.DB $08, $08, "PASSING"                                                                              ; LENGTH, TOP LEFT CURVED TILE+ TEXT
	.DB $84, $0D                                                                                         ; REPEAT 4 TIMES, TOP HORIZONNTAL LINE
	.DB $01, $09                                                                                         ; LENGTH, TOP-RIGHT ROUNDED TILE 
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0C                                                                                         ; LENGTH, LEFT VERTICAL LINE
	.DB $EB                                                                                              ; FORWARD 12 TILES
	.DB $01, $0E                                                                                         ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $08, $0C, " RATING"                                                                              ;
	.DB $E4                                                                                              ; FORWARD 5 TILES 
	.DB $01, $0E                                                                                         ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0C                                                                                         ; LENGTH, LEFT VERTICAL LINE
	.DB $EB                                                                                              ; FORWARD 12 TILES
	.DB $01, $0E                                                                                         ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $08, $0C, " COMP.", $C4                                                                          ;
	.DB $E4                                                                                              ; FORWARD 5 TILES
	.DB $01, $0E                                                                                         ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0C                                                                                         ;
	.DB $EB                                                                                              ; FORWARD 12 TILES
	.DB $01, $0E                                                                                         ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $0D, $0C, " ATTEMPTS  ", $0E                                                                     ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0C                                                                                         ; LENGTH, LEFT VERTICAL LINE
	.DB $EB                                                                                              ; FORWARD 12 TILES
	.DB $01, $0E                                                                                         ; LENGTH, RIGHT VERTICAL LINE
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $07, $0C, " COMP."                                                                               ;
	.DB $E5                                                                                              ; FORWARD 6 TILES
	.DB $01, $0E                                                                                         ; LENGTH, RIGHT VERTICAL LINE
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0C                                                                                         ; LENGTH, LEFT VERTICAL LINE
	.DB $EB                                                                                              ; FORWARD 12 TILES
	.DB $01, $0E                                                                                         ; LENGTH, RIGHT VERTICAL LINE
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $07, $0C, " YARDS"                                                                               ;
	.DB $E5                                                                                              ; FORWARD 6 TILES
	.DB $01, $0E                                                                                         ; LENGTH, RIGHT VERTICAL LINE
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0C                                                                                         ; LENGTH, LEFT VERTICAL LINE
	.DB $EB                                                                                              ; FORWARD 12 TILES
	.DB $01, $0E                                                                                         ; LENGTH, RIGHT VERTICAL LINE
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $0D, $0C, " YARDS", $C5, "ATT.", $0E                                                             ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0C                                                                                         ; LENGTH, LEFT VERTICAL LINE
	.DB $EB                                                                                              ; FORWARD 12 TILES
	.DB $01, $0E                                                                                         ; LENGTH, RIGHT VERTICAL LINE
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $0D, $0C, " TD.PASSES ", $0E                                                                     ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0C                                                                                         ; LENGTH, LEFT VERTICAL LINE
	.DB $EB                                                                                              ; FORWARD 12 TILES
	.DB $01, $0E                                                                                         ; LENGTH, RIGHT VERTICAL LINE
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $0D, $0C, " LST.INT.", $C4, $00, $0E                                                             ;
	.DB $A1                                                                                              ; DOWN 1 ROW
	.DB $01, $0A                                                                                         ; LENGTH, BOT LEFT CURVED TILE
	.DB $8B, $0F                                                                                         ; REPEAT BOTTOM HORIZONTAL TILE, 15 TIMES
	.DB $01, $0B                                                                                         ; LENGTH, BOT RIGHT CURVED TILE
	.DB $FF                                                                                              ; END

_F}_LEADING_PASSERS_MENU_SCREEN_SCRIPT	

_F{_LEADING_RECEIVERS_MENU_SCREEN_SCRIPT	

LEADING_RECIVERS_SCENE_SCRIPT:                                                                           ; 0x04 LEADING RECEIVERS SCREEN 
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $8C, $C1                                                                                         ; SET PPU ADDR = $24C1
	.DB      "RECEIVING"                                                                                 ;
	.DB $8D, $02                                                                                         ; SET PPU ADDR = $2502
	.DB      "RECEPTIONS"                                                                                ;
	.DB $8D, $42                                                                                         ; SET PPU ADDR = $2542
	.DB      "YARDS"                                                                                     ;
	.DB $8D, $82                                                                                         ; SET PPU ADDR = $2582
	.DB      "YARDS"                                                                                     ;
	.DB $8D, $88                                                                                         ; SET PPU ADDR = $2588
	.DB      "RCT."                                                                                      ;
	.DB $8D, $C2                                                                                         ; SET PPU ADDR = $25C2
	.DB      "TOUCHDOWNS"                                                                                ;
																										; DRAW RECEIVING MENU BOX 
	.DB $AC, $C0, $08                                                                                    ; SET PPU ADDR = $24C0, TOP LEFT CURVED  
	.DB $AC, $CC, $09                                                                                    ; SET PPU ADDR = $24CC, TOP RIGHT CURVED  
	.DB $AD, $E0, $0A                                                                                    ; SET PPU ADDR = $25E0, BOT LEFT CURVED  
	.DB $AD, $EC, $0B                                                                                    ; SET PPU ADDR = $25EC, BOT RIGHT CURVED  
	.DB $AD, $87, $C5                                                                                    ; SET PPU ADDR = $2587, "/" TILE  
	.DB $94, $E0, $08, $0C                                                                               ; SET PPU ADDR = $24E0, REPEAT DOWN 8 TIMES,LEFT VERT LINE
	.DB $94, $EC, $08, $0E                                                                               ; SET PPU ADDR = $24EC, REPEAT DOWN 8 TIMES,RIGHT VERT LINE
	.DB $9C, $CA, $02, $0D                                                                               ; SET PPU ADDR = $24CA, REPEAT ACROSS 2 TIMES,TOP HORIZONTAL LINE
	.DB $9D, $E1, $0B, $0F                                                                               ; SET PPU ADDR = $24EC, REPEAT ACROSS 11 TIMES,BOTTOM HORIZONTAL LINE
	.DB $F9, $02, $6A, $68                                                                               ; DRAW 2 SPRITES(PLAYER CATCHING BLACK, BALL GOING TO PLAYER)
	.DB $EB, $37, $4F                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $88, $45                                                                                         ; SET PPU ADDR = $2045
	.DB $FA, $18                                                                                         ; DRAW CONFERENCE/LEAGUE ABBREVAITION
	.DB $88, $49                                                                                         ; SET PPU ADDR = $2049
	.DB      "LEADING RECEIVERS"                                                                         ;
	.DB $80, $41, <DRAW_THREE_STARS_LEFT_SIDE_SCRIPT, >DRAW_THREE_STARS_LEFT_SIDE_SCRIPT                 ; SET PPU ADDR = $2041,DO->3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS
	.DB $80, $5B, <DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT, >DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT               ; SET PPU ADDR = $205A,DO->3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS
	.DB $FF

_F}_LEADING_RECEIVERS_MENU_SCREEN_SCRIPT

_F{_LEADERS_THREE_STARS_SCREEN_SCRIPTS	

DRAW_THREE_STARS_LEFT_SIDE_SCRIPT:                                                                       ; 3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS	
	.DB $03                                                                                              ; # OF TILES
	.DB $C2, $C3, $C1                                                                                 ; STAR2, STAR 3, STAR 1
	.DB $FF                                                                                              ; END

DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT:                                                                      ; 3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS
	.DB $03                                                                                              ; # OF TILES
	.DB $C1, $C3, $C2                                                                                 ; STAR1, STAR 3, STAR 2
	.DB $FF                                                                                              ; END
	
_F}_LEADERS_THREE_STARS_SCREEN_SCRIPTS		

_F{_LEADING_RUSHERS_MENU_SCREEN_SCRIPT	

LEADING_RUSHERS_SCENE_SCRIPT:                                                                            ; 0x05 LEADING RUSHERS SCREEN 
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $8C, $C1                                                                                         ; SET PPU ADDR = $24C1
	.DB      "RUSHING"                                                                                   ;
	.DB $8D, $02                                                                                         ; SET PPU ADDR = $2502
	.DB      "YARDS"                                                                                     ;
	.DB $8D, $42                                                                                         ; SET PPU ADDR = $2542
	.DB      "ATTEMPTS"                                                                                  ;
	.DB $8D, $82                                                                                         ; SET PPU ADDR = $2582
	.DB      "YARDS"                                                                                     ;
	.DB $8D, $88                                                                                         ; SET PPU ADDR = $2588
	.DB      "ATT."                                                                                      ;
	.DB $8D, $C2                                                                                         ; SET PPU ADDR = $25C2
	.DB      "TOUCHDOWNS"                                                                                ;
																										; DRAW RUSHING MENU BOX
	.DB $AC, $C0, $08                                                                                    ; SET PPU ADDR = $24C0, TOP LEFT CURVED  
	.DB $AC, $CC, $09                                                                                    ; SET PPU ADDR = $24CC, TOP RIGHT CURVED  
	.DB $AD, $E0, $0A                                                                                    ; SET PPU ADDR = $25E0, BOT LEFT CURVED  
	.DB $AD, $EC, $0B                                                                                    ; SET PPU ADDR = $25EC, BOT RIGHT CURVED  
	.DB $AD, $87, $C5                                                                                    ; SET PPU ADDR = $2587, "/" TILE  
	.DB $94, $E0, $08, $0C                                                                               ; SET PPU ADDR = $24E0, REPEAT DOWN 8 TIMES,LEFT VERT LINE
	.DB $94, $EC, $08, $0E                                                                               ; SET PPU ADDR = $24EC, REPEAT DOWN 8 TIMES,RIGHT VERT LINE
	.DB $9C, $C8, $04, $0D                                                                               ; SET PPU ADDR = $24C8, REPEAT ACROSS 4 TIMES,TOP HORIZONTAL LINE
	.DB $9D, $E1, $0B, $0F                                                                               ; SET PPU ADDR = $24EC, REPEAT ACROSS 11 TIMES,BOTTOM HORIZONTAL LINE
	.DB $83, $C0, <ATTR_VALUES_STARS_LEADERS_SCRIPT, >ATTR_VALUES_STARS_LEADERS_SCRIPT                   ; SET PPU ADDR = $23C0,DO->ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $83, $C6, <ATTR_VALUES_STARS_LEADERS_SCRIPT, >ATTR_VALUES_STARS_LEADERS_SCRIPT                   ; SET PPU ADDR = $23C6,DO->ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $F9, $01, $AD                                                                                    ; DRAW 1 SPRITE(LEADING RUSHER LARGE BLACK SILOUHETTE)
	.DB $EB, $24, $27                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN(BG,SPR)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $FD, <DRAW_AFC_NFC_OR_NFL_SCRIPT, >DRAW_AFC_NFC_OR_NFL_SCRIPT                                    ; DO->DRAW NFL,AFC,OR NFC ABBREVIATION
	.DB      "LEADING RUSHERS"
	.DB $80, $42, <DRAW_THREE_STARS_LEFT_SIDE_SCRIPT, >DRAW_THREE_STARS_LEFT_SIDE_SCRIPT                 ; SET PPU ADDR = $2042,DO->3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS
	.DB $80, $5A, <DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT, >DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT               ; SET PPU ADDR = $205A,DO->3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS
	.DB $FF

_F}LEADING_RUSHERS_MENU_SCREEN_SCRIPT	

_F{_LEADERS_THREE_STARS_ATTR_VALUES_SCREEN_SCRIPTS		

ATTR_VALUES_STARS_LEADERS_SCRIPT:                                                                        ; ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $02                                                                                              ; LENGTH
	.DB $40, $10                                                                                         ;
	.DB $FF                                                                                              ; END
	
_F}_LEADERS_THREE_STARS_COLORS_SCREEN_SCRIPTS	

_F{_LEADING_SCORERS_SCENE_SCRIPT

LEADING_SCORERS_SCENE_SCRIPT:                                                                            ; 0x06 LEADING SCORERS SCREEN
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $8C, $C1                                                                                         ; SET PPU ADDR = $24C1
	.DB      "SCORING"                                                                                   ;
	.DB $8D, $02                                                                                         ; SET PPU ADDR = $2502
	.DB      "POINTS"                                                                                    ;
	.DB $8D, $42                                                                                         ; SET PPU ADDR = $2542
	.DB      "TOUCHDOWNS"                                                                                ;
	.DB $8D, $82                                                                                         ; SET PPU ADDR = $2582
	.DB      "EXTRA PTS."                                                                                ;
	.DB $8D, $C2                                                                                         ; SET PPU ADDR = $25C2
	.DB      "FG."                                                                                       ;
	.DB $AC, $C0, $08                                                                                    ; SET PPU ADDR = $24C0, TOP LEFT CURVED  
	.DB $AC, $CC, $09                                                                                    ; SET PPU ADDR = $24CC, TOP RIGHT CURVED  
	.DB $AD, $E0, $0A                                                                                    ; SET PPU ADDR = $25E0, BOT LEFT CURVED  
	.DB $AD, $EC, $0B                                                                                    ; SET PPU ADDR = $25EC, BOT RIGHT CURVED  
	.DB $94, $E0, $08, $0C                                                                               ; SET PPU ADDR = $24E0, REPEAT DOWN 8 TIMES,LEFT VERT LINE
	.DB $94, $EC, $08, $0E                                                                               ; SET PPU ADDR = $24EC, REPEAT DOWN 8 TIMES,RIGHT VERT LINE
	.DB $9C, $C8, $04, $0D                                                                               ; SET PPU ADDR = $24C8, REPEAT ACROSS 4 TIMES,TOP HORIZONTAL LINE
	.DB $9D, $E1, $0B, $0F                                                                               ; SET PPU ADDR = $24E1, REPEAT ACROSS 11 TIMES,BOTTOM HORIZONTAL LINE
	.DB $83, $C0, <ATTR_VALUES_STARS_LEADERS_SCRIPT, >ATTR_VALUES_STARS_LEADERS_SCRIPT                   ; SET PPU ADDR = $23C0,DO->ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $83, $C6, <ATTR_VALUES_STARS_LEADERS_SCRIPT, >ATTR_VALUES_STARS_LEADERS_SCRIPT                   ; SET PPU ADDR = $23C6,DO->ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $F9, $02, $6B, $54                                                                               ; DRAW 2 SPRITES(KICKER SPRITE BLACK SILOUHETTER, BALL SPINNING)
	.DB $EB, $25, $28                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $FD, <DRAW_AFC_NFC_OR_NFL_SCRIPT, >DRAW_AFC_NFC_OR_NFL_SCRIPT                                    ; DO->DRAW NFL,AFC,OR NFC ABBREVIATION
	.DB      "LEADING SCORERS"                                                                           ;
	.DB $80, $42, <DRAW_THREE_STARS_LEFT_SIDE_SCRIPT, >DRAW_THREE_STARS_LEFT_SIDE_SCRIPT                 ; SET PPU ADDR = $2042,DO->3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS
	.DB $80, $5A, <DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT, >DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT               ; SET PPU ADDR = $205A,DO->3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS	
	.DB $FF                                                                                              ; END
	
_F}_LEADING_SCORERS_SCENE_SCRIPT	

_F{_LEADING_PUNTERS_SCENE_SCRIPT

LEADING_PUNTERS_SCENE_SCRIPT:                                                                            ; 0x07 LEADING PUNTERS SCREEN
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $8C, $E1                                                                                         ; SET PPU ADDR = $24E1
	.DB      "PUNTING"                                                                                   ;
	.DB $8D, $22                                                                                         ;
	.DB      "AVERAGE"                                                                                   ;
	.DB $8D, $62                                                                                         ;
	.DB      "PUNTS"                                                                                     ;
	.DB $AC, $E0, $08                                                                                    ; SET PPU ADDR = $24E0, TOP LEFT CURVED  
	.DB $AC, $EA, $09                                                                                    ; SET PPU ADDR = $24EA, TOP RIGHT CURVED  
	.DB $AD, $80, $0A                                                                                    ; SET PPU ADDR = $2580, BOT LEFT CURVED  
	.DB $AD, $8A, $0B                                                                                    ; SET PPU ADDR = $258A, BOT RIGHT CURVED  
	.DB $95, $00, $04, $0C                                                                               ; SET PPU ADDR = $2500, REPEAT DOWN 4 TIMES,LEFT VERT LINE
	.DB $95, $0A, $04, $0E                                                                               ; SET PPU ADDR = $250A, REPEAT DOWN 4 TIMES,RIGHT VERT LINE
	.DB $9C, $E8, $02, $0D                                                                               ; SET PPU ADDR = $24E8, REPEAT ACROSS 2 TIMES,TOP HORIZONTAL LINE
	.DB $9D, $81, $09, $0F                                                                               ; SET PPU ADDR = $2581, REPEAT ACROSS 9 TIMES,BOT HORIZONTAL LINE
	.DB $83, $C0, <ATTR_VALUES_STARS_LEADERS_SCRIPT, >ATTR_VALUES_STARS_LEADERS_SCRIPT                   ; SET PPU ADDR = $23C0,DO->ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $83, $C6, <ATTR_VALUES_STARS_LEADERS_SCRIPT, >ATTR_VALUES_STARS_LEADERS_SCRIPT                   ; SET PPU ADDR = $23C6,DO->ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $F9, $02, $2F, $6C                                                                               ; DRAW 2 SPRITES(BALL MIDDLE TO RIGHT,PUNTER SPRITE BLACK SILOUHETTE)
	.DB $EB, $26, $29                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $FD, <DRAW_AFC_NFC_OR_NFL_SCRIPT, >DRAW_AFC_NFC_OR_NFL_SCRIPT                                    ; DO->DRAW NFL,AFC,OR NFC ABBREVIATION
	.DB      "LEADING PUNTERS"                                                                           ;
	.DB $80, $42, <DRAW_THREE_STARS_LEFT_SIDE_SCRIPT, >DRAW_THREE_STARS_LEFT_SIDE_SCRIPT                 ; SET PPU ADDR = $2042,DO->3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS
	.DB $80, $5A, <DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT, >DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT               ; SET PPU ADDR = $205A,DO->3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS
	.DB $FF                                                                                              ; END
	
_F}_LEADING_PUNTERS_SCENE_SCRIPT	

_F{_INTERCEPTION_LEADERS_SCENE_SCRIPT

INTERCEPTION_LEADERS_SCENE_SCRIPT:                                                                       ; 0x08 INTERCEPTION LEADERS SCREEN
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $8C, $E1                                                                                         ; SET PPU ADDR = $24E1
	.DB      "INTERCEPTION"                                                                              ;
	.DB $8D, $22                                                                                         ; SET PPU ADDR = $2522
	.DB      "INT."                                                                                      ;
	.DB $8D, $62                                                                                         ; SET PPU ADDR = $2562
	.DB      "YARDS"                                                                                     ;
	.DB $8D, $A2                                                                                         ; SET PPU ADDR = $25A2
	.DB      "TOUCHDOWNS"                                                                                ;
	.DB $AC, $E0, $08                                                                                    ; SET PPU ADDR = $24E0, TOP LEFT CURVED  
	.DB $AC, $EE, $09                                                                                    ; SET PPU ADDR = $24EE, TOP RIGHT CURVED  
	.DB $AD, $C0, $0A                                                                                    ; SET PPU ADDR = $25C0, BOT LEFT CURVED  
	.DB $AD, $CE, $0B                                                                                    ; SET PPU ADDR = $25CE, BOT RIGHT CURVED  
	.DB $AC, $ED, $0D                                                                                    ; SET PPU ADDR = $25ED, TOP HORIZONTAL LINE
	.DB $95, $00, $06, $0C                                                                               ; SET PPU ADDR = $2500, REPEAT DOWN 6 TIMES,LEFT VERT LINE
	.DB $95, $0E, $06, $0E                                                                               ; SET PPU ADDR = $250E, REPEAT DOWN 6 TIMES,RIGHT VERT LINE
	.DB $9D, $C1, $0D, $0F                                                                               ; SET PPU ADDR = $25C1, REPEAT ACROSS 13 TIMES,BOT HORIZONTAL LINE
	.DB $F9, $02, $57, $6D                                                                               ; DRAW 2 SPRITES(BALL MIDDLE TO LEFT,DEFENDER LARGE BLACK SILOUHETTE)
	.DB $EB, $27, $2A                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $88, $44                                                                                         ; SET PPU ADDR = $2044
	.DB $FA, $18                                                                                         ; DRAW CONFERENCE/LEAGUE ABBREVAITION
	.DB $88, $48                                                                                         ; SET PPU ADDR = $2048
	.DB      "INTERCEPTION LEADERS"                                                                      ;
	.DB $A8, $42, $C2                                                                                    ; SET PPU ADDR = $2042, DRAW STAR TILE
	.DB $A8, $5D, $C2                                                                                    ; SET PPU ADDR = $205D, DRAW STAR TILE
	.DB $FF                                                                                              ; END
	
_F}_INTERCEPTION_LEADERS_SCENE_SCRIPT	

_F{_SACK_LEADERS_SCENE_SCRIPT

SACK_LEADERS_SCENE_SCRIPT:                                                                               ; 0X09 SACK LEADERSSCREEN
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $83, $C0, <ATTR_VALUES_STARS_LEADERS_SCRIPT, >ATTR_VALUES_STARS_LEADERS_SCRIPT                   ; SET PPU ADDR = $23C0,DO->ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $83, $C6, <ATTR_VALUES_STARS_LEADERS_SCRIPT, >ATTR_VALUES_STARS_LEADERS_SCRIPT                   ; SET PPU ADDR = $23C6,DO->ATTRIBUTE VALUES FOR COLORED STARS LEADERS SCREEN
	.DB $F9, $01, $6E                                                                                    ; DRAW 1 SPRITE(SACK LARGE BLACK SILOUHETTE)
	.DB $EB, $28, $2B                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $FD, <DRAW_AFC_NFC_OR_NFL_SCRIPT, >DRAW_AFC_NFC_OR_NFL_SCRIPT                                    ; DO->DRAW NFL,AFC,OR NFC ABBREVIATION
	.DB      "LEADERS IN SACK"                                                                           ;
	.DB $80, $42, <DRAW_THREE_STARS_LEFT_SIDE_SCRIPT, >DRAW_THREE_STARS_LEFT_SIDE_SCRIPT                 ; SET PPU ADDR = $2042,DO->3 COLORED STARS FOR LEFT SIDE OF LEADERS SCREENS
	.DB $80, $5A, <DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT, >DRAW_THREE_STARS_RIGHT_SIDE_SCRIPT               ; SET PPU ADDR = $205A,DO->3 COLORED STARS FOR RIGHT SIDE OF LEADERS SCREENS
	.DB $FF
	
_F}_SACK_LEADERS_SCENE_SCRIPT

_F{_PUNT_RETURN_LEADERS_SCENE_SCRIPT

PUNT_RETURN_LEADERS_SCENE_SCRIPT:                                                                        ; 0X0A LEADING PR SCREEN
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $83, $C0, <ATTR_VALUES_TWO_STARS_LEADERS_SCRIPT, >ATTR_VALUES_TWO_STARS_LEADERS_SCRIPT           ; SET PPU ADDR = $23C0, DO-> ATTRIBUTE VALUE FOR TWO STARS
	.DB $83, $C7, <ATTR_VALUES_TWO_STARS_LEADERS_SCRIPT, >ATTR_VALUES_TWO_STARS_LEADERS_SCRIPT           ; SET PPU ADDR = $23C7, DO-> ATTRIBUTE VALUE FOR TWO STARS
	.DB $F9, $01, $6F                                                                                    ; DRAW 1 SPRITE(KR/PR LARGE BLACK SILOUHETTE)
	.DB $8C, $E1                                                                                      ; SET PPU ADDR = $24E1
	.DB      "PR"                                                                                        ;
	.DB $FD, <DRAW_RETURN_LEADERS_MENU_OFFSCREEN_SCRIPT, >DRAW_RETURN_LEADERS_MENU_OFFSCREEN_SCRIPT      ; DO->DRAW RETURN LEADERS MENU OFFSCREEN
	.DB $EB, $2A, $2D                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $88, $44                                                                                         ; SET PPU ADDR = $2044
	.DB $FA, $18                                                                                         ; DRAW CONFERENCE/LEAGUE ABBREVAITION
	.DB $88, $48                                                                                         ; SET PPU ADDR = $2048
	.DB      "PUNT RETURN LEADERS"                                                                       ;
	.DB $80, $41, <DRAW_TWO_STARS_LEFT_SCRIPT, >DRAW_TWO_STARS_LEFT_SCRIPT                               ; SET PPU ADDR = $2041, DRAW TWO STARS 1
	.DB $80, $5C, <DRAW_TWO_STARS_RIGHT_SCRIPT, >DRAW_TWO_STARS_RIGHT_SCRIPT                             ; SET PPU ADDR = $205C, DRAW TWO STARS 2
	.DB $FF                                                                                              ; END

_F}_PUNT_RETURN_LEADERS_SCENE_SCRIPT	

_F{_LEADERS_TWO_STARS_AND_ATTR_VALUES_SCREEN_SCRIPTS	


DRAW_TWO_STARS_LEFT_SCRIPT:                                                                              ; DRAW TWO STARS 1
	.DB $02                                                                                              ; LENGTH
	.DB $C2, $C3                                                                                      ; STAR (COLOR1), STAR COLOR 2
	.DB $FF                                                                                              ; END	

DRAW_TWO_STARS_RIGHT_SCRIPT:                                                                             ; DRAW TWO STARS 1
	.DB $02                                                                                              ; LENGTH 
	.DB $C3, $C2                                                                                      ; STAR (COLOR1), STAR COLOR 2
	.DB $FF                                                                                              ; END	


ATTR_VALUES_TWO_STARS_LEADERS_SCRIPT:                                                                    ; ATTRIBUTE VALUE FOR RED STAR
	.DB $01                                                                                              ; LENGTH
	.DB $50                                                                                           ;
	.DB $FF                                                                                              ; END	
	
_F}_LEADERS_TWO_STARS_AND_ATTR_VALUES_SCREEN_SCRIPTS	

_F{_KICK_RETURN_LEADERS_SCENE_SCRIPT

KICK_RETURN_LEADERS_SCENE_SCRIPT:                                                                        ; DRAW KICK RETURN LEADERS SCREENS
	.DB $ED                                                                                              ; SET BG AND SPR PAL TO FULLY FADED OUT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $20, $2E                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $83, $C0, <ATRR_VALS_STAR_LEFT_SCRIPT, >ATRR_VALS_STAR_LEFT_SCRIPT                               ; SET PPU ADDR = $23C0, DO-> ATTRIBUTE VALUE FOR STARS LEFT SIDE
	.DB $83, $C7, <ATRR_VALS_STAR_RIGHT_SCRIPT, >ATRR_VALS_STAR_RIGHT_SCRIPT                             ; SET PPU ADDR = $23C7, DO-> ATTRIBUTE VALUE FOR STARS RIGHT SIDE
	.DB $F9, $01, $6F                                                                                    ; DRAW 1 SPRITE(KR/PR LARGE BLACK SILOUHETTE)
	.DB $8C, $E1                                                                                         ; SET PPU ADDR = $24E1
	.DB      "KR"                                                                                        ;
	.DB $FD, <DRAW_RETURN_LEADERS_MENU_OFFSCREEN_SCRIPT, >DRAW_RETURN_LEADERS_MENU_OFFSCREEN_SCRIPT      ; DO->DRAW RETURN LEADERS MENU OFFSCREEN	
	.DB $EB, $29, $2C                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $88, $43                                                                                         ; SET PPU ADDR = $2043	
	.DB $FA, $18                                                                                         ; DRAW CONFERENCE/LEAGUE ABBREVAITION
	.DB $88, $47                                                                                         ; SET PPU ADDR = $2047
	.DB      "KICKOFF RETURN LEADERS"                                                                    ;
	.DB $A8, $41, $C2                                                                                    ;
	.DB $A8, $5E, $C2                                                                                    ;
	.DB $FF                                                                                              ; END	
	
_F}_KICK_RETURN_LEADERS_SCENE_SCRIPT	

_F{_RETURN_LEADERS_OFFSCREEN_MENU_SCENE_SCRIPT

DRAW_RETURN_LEADERS_MENU_OFFSCREEN_SCRIPT:                                                               ; DRAW RETURN LEADERS MENU OFFSCREEN
	.DB $8D, $22                                                                                         ; SET PPU ADDR = $2522
	.DB      "AVERAGE"                                                                                   ;
	.DB $8D, $62                                                                                         ; SET PPU ADDR = $2562 COULD HAVE USED DOWN ONE ROW COMMAND
	.DB      "YARDS"                                                                                     ;
	.DB $8D, $A2                                                                                         ; SET PPU ADDR = $25A2 COULD HAVE USED DOWN ONE ROW COMMAND
	.DB      "RETURNS"                                                                                   ;
	.DB $8D, $E2                                                                                         ; SET PPU ADDR = $25E2 COULD HAVE USED DOWN ONE ROW COMMAND
	.DB      "TOUCHDOWNS"                                                                                ;			
																										; DRAW MENU BOX FOR RETURN LEADERS
	.DB $AC, $E0, $08                                                                                    ; SET PPU ADDR = $24E0, TOP LEFT CURVED  
	.DB $AC, $EC, $09                                                                                    ; SET PPU ADDR = $24EC, TOP RIGHT
	.DB $AE, $00, $0A                                                                                    ; SET PPU ADDR = $2600, BOT LEFT CURVED  
	.DB $AE, $0C, $0B                                                                                    ; SET PPU ADDR = $260C, BOT RIGHT CURVED  
	.DB $95, $00, $08, $0C                                                                               ; SET PPU ADDR = $2500, REPEAT DOWN 8 TIMES,LEFT VERT LINE
	.DB $95, $0C, $08, $0E                                                                               ; SET PPU ADDR = $250C, REPEAT DOWN 8 TIMES,RIGHT VERT LINE
	.DB $9C, $E3, $09, $0D                                                                               ; SET PPU ADDR = $24E3, REPEAT ACROSS 9 TIMES,TOP HORIZONTAL LINE
	.DB $9E, $01, $0B, $0F                                                                               ; SET PPU ADDR = $2601, REPEAT ACROSS 11 TIMES,BOTTOM HORIZONTAL LINE
	.DB $FE                                                                                              ; RETURN	
	
_F}_RETURN_LEADERS_OFFSCREEN_MENU_SCENE_SCRIPT	

ATRR_VALS_STAR_LEFT_SCRIPT:                                                                              ; ATTRIBUTE VALUE FOR STARS LEFT SIDE
	.DB $01                                                                                              ; LENGTH
	.DB $10                                                                                           ; 
	.DB $FF                                                                                              ; END	
						

ATRR_VALS_STAR_RIGHT_SCRIPT:                                                                             ; ATTRIBUTE VALUE FOR STARS RIGHT SIDE
	.DB $01                                                                                              ; LENGTH
	.DB $40                                                                                           ;
	.DB $FF                                                                                              ; END	


UNUSED_BANK8_SCREEN_SCRIPT:
	.DB $FF                                                                                              ; END	


_F{_SCOREBOARD_SCENE_SCRIPTS

SCOREBOARD_ALL_QTR_SCENE_SCRIPT:                                                                         ; TEAM + SCOREBOARD ALL QTR SCORES
	.DB $FD, <DRAW_SCOREBOARD_BG_SCRIPT, >DRAW_SCOREBOARD_BG_SCRIPT                                      ; DO->DRAW SCOREBOARD BACKGROUND WITH TEAMS
	.DB $FD, <DRAW_FIRST_QTR_SCORES_SCRIPT, >DRAW_FIRST_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q1 SCORES
	.DB $FD, <DRAW_SECOND_QTR_SCORES_SCRIPT, >DRAW_SECOND_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q2 SCORES
	.DB $FD, <DRAW_THIRD_QTR_SCORES_SCRIPT, >DRAW_THIRD_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q3 SCORES
	.DB $FD, <DRAW_FOURTH_QTR_SCORES_SCRIPT, >DRAW_FOURTH_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q4 SCORES
	.DB $FC, <DRAW_TOTAL_SCORE_FADE_OUT_SCRIPT, >DRAW_TOTAL_SCORE_FADE_OUT_SCRIPT                        ; JUMP->DRAW TOTAL SCORES WAIT ONE SECOND AND FADE OUT


SKP_SCOREBOARD_BLANK_SCENE_SCRIPT:                                                                       ; TEAM + SCOREBOARD NO QTR SCORES
	.DB $FD, <DRAW_SCOREBOARD_BG_SCRIPT, >DRAW_SCOREBOARD_BG_SCRIPT                                      ; DO->DRAW SCOREBOARD BACKGROUND WITH TEAMS
	.DB $F1                                                                                              ; SET GAME STATUS AND PPUR MIRRORING TO HORIZONTAL
	.DB $F8, $3B                                                                                         ; DRAW BG (TECMO SPORTS NEWS) OFFSCREEN
	.DB $E5, $0D, $47                                                                                    ; SAVE BG AND SPR PAL TO BUFFER AND FADE IN (BG, SPR)
	.DB $FF                                                                                              ; END	


SKP_SCOREBOARD_FIRST_QTR_SCENE_SCRIPT:                                                                   ; DRAW Q1+ TOTAL SCORES SCOREBOARD SKP MODE
	.DB $FD, <DRAW_FIRST_QTR_SCORES_SCRIPT, >DRAW_FIRST_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q1 SCORES
	.DB $FC, <DRAW_TOTAL_SCORES_WAIT_TEN_FRAMES_SCRIPT, >DRAW_TOTAL_SCORES_WAIT_TEN_FRAMES_SCRIPT        ; JUMP->DRAW TOTAL SCORES AND WAIT 10 FRAMES

SKP_SCOREBOARD_SECOND_QTR_SCENE_SCRIPT:                                                                  ; DRAW Q2 +TOTAL SCORES SCOREBOARD SKP MODE
	.DB $FD, <DRAW_SECOND_QTR_SCORES_SCRIPT, >DRAW_SECOND_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q2 SCORES
	.DB $FC, <DRAW_TOTAL_SCORES_WAIT_TEN_FRAMES_SCRIPT, >DRAW_TOTAL_SCORES_WAIT_TEN_FRAMES_SCRIPT        ; JUMP->DRAW TOTAL SCORES AND WAIT 10 FRAMES

SKP_SCOREBOARD_THIRD_QTR_SCENE_SCRIPT:                                                                   ; DRAW Q3 +TOTAL SCORES SCOREBOARD SKP MODE
	.DB $FD, <DRAW_THIRD_QTR_SCORES_SCRIPT, >DRAW_THIRD_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q3 SCORES

DRAW_TOTAL_SCORES_WAIT_TEN_FRAMES_SCRIPT:                                                                ; DRAW TOTAL SCORES AND WAIT 10 FRAMES
	.DB $FD, <DRAW_TOTAL_SCORES_SCRIPT, >DRAW_TOTAL_SCORES_SCRIPT                                        ; DO->DRAW SCOREBOARD TOTAL SCORES
	.DB $FB, $0A                                                                                         ; WAIT 10 FRAMES = 1/6 SEC
	.DB $FF                                                                                              ; END	


SKP_SCOREBOARD_FOURTH_QTR_SCENE_SCRIPT:                                                                  ; DRAW Q4 AND TOTAL SCORES, BLANK OUT SCOREBOARD
	.DB $FD, <DRAW_FOURTH_QTR_SCORES_SCRIPT, >DRAW_FOURTH_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q4 SCORES
	.DB $FD, <DRAW_TOTAL_SCORES_SCRIPT, >DRAW_TOTAL_SCORES_SCRIPT                                        ; DO->DRAW SCOREBOARD TOTAL SCORES
	.DB $FB, $0A                                                                                         ; WAIT 10 FRAMES = 1/6 SEC
	.DB $A1, $8A, $03, $0B, $00                                                                          ; SET PPU ADDR = $218A, BLANK OUT SCOREBOARD 
	.DB $FF                                                                                              ; END	


SCORE_BOARD_FIRST_QTR_FADE_OUT_SCENE_SCRIPT:                                                             ; 0X21 TEAM + SCOREBOARD 1ST QTR SCORES
	.DB $FD, <DRAW_SCOREBOARD_BG_SCRIPT, >DRAW_SCOREBOARD_BG_SCRIPT                                      ; DO->DRAW SCOREBOARD BACKGROUND WITH TEAMS
	.DB $FD, <DRAW_FIRST_QTR_SCORES_SCRIPT, >DRAW_FIRST_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q1 SCORES
	.DB $FC, <DRAW_TOTAL_SCORE_FADE_OUT_SCRIPT, >DRAW_TOTAL_SCORE_FADE_OUT_SCRIPT                        ; JUMP-> DRAW TOTAL SCORES WAIT ONE SECOND AND FADE OUT

SCORE_BOARD_SECOND_QTR_FADE_OUT_SCENE_SCRIPT:                                                            ; 0X22 TEAM + SCOREBOARD THRU 2ND QTR SCORES
	.DB $FD, <DRAW_SCOREBOARD_BG_SCRIPT, >DRAW_SCOREBOARD_BG_SCRIPT                                      ; DO->DRAW SCOREBOARD BACKGROUND WITH TEAMS
	.DB $FD, <DRAW_FIRST_QTR_SCORES_SCRIPT, >DRAW_FIRST_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q1 SCORES
	.DB $FD, <DRAW_SECOND_QTR_SCORES_SCRIPT, >DRAW_SECOND_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q2 SCORES
	.DB $FC, <DRAW_TOTAL_SCORE_FADE_OUT_SCRIPT, >DRAW_TOTAL_SCORE_FADE_OUT_SCRIPT                        ; JUMP-> DRAW TOTAL SCORES WAIT ONE SECOND AND FADE OUT

SCORE_BOARD_THIRD_QTR_FADE_OUT_SCENE_SCRIPT:                                                             ; 0X23 TEAM + SCOREBOARD THRU 3RD QTR SCORES
	.DB $FD, <DRAW_SCOREBOARD_BG_SCRIPT, >DRAW_SCOREBOARD_BG_SCRIPT                                      ; DO->DRAW SCOREBOARD BACKGROUND WITH TEAMS	
	.DB $FD, <DRAW_FIRST_QTR_SCORES_SCRIPT, >DRAW_FIRST_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q1 SCORES
	.DB $FD, <DRAW_SECOND_QTR_SCORES_SCRIPT, >DRAW_SECOND_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q2 SCORES
	.DB $FD, <DRAW_THIRD_QTR_SCORES_SCRIPT, >DRAW_THIRD_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q3 SCORES

DRAW_TOTAL_SCORE_FADE_OUT_SCRIPT:                                                                        ; DRAW TOTAL SCORES WAIT ONE SECOND AND FADE OUT
	.DB $FD, <DRAW_TOTAL_SCORES_SCRIPT, >DRAW_TOTAL_SCORES_SCRIPT                                        ; DO->DRAW SCOREBOARD TOTAL SCORES	
	.DB $E5, $0D, $47                                                                                    ; SAVE BG AND SPR PAL TO BUFFER AND FADE IN (BG, SPR)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SEC
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $FF                                                                                              ; END	

DRAW_SCOREBOARD_BG_SCRIPT:                                                                               ; DRAW SCOREBOARD BACKGROUND WITH TEAMS
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $D0, $18, $30                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $F7, $11                                                                                         ; DRAW BACKGROUND (LARGE SCOREBOARD)
	.DB $F9, $01, $BC                                                                                    ; DRAW SPRITE (4 WAVING FLAGS)
	.DB $89, $6B                                                                                         ; SET PPU ADDR = $216B
	.DB      "1  2  3  4     T"                                                                          ;
	.DB $89, $85                                                                                         ; SET PPU ADDR = $21B5
	.DB $D4                                                                                              ; DRAW P1 CITY ABBREV
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB $D5                                                                                              ; DRAW P2 CITY ABBREV
	.DB $FE                                                                                              ; RETURN

DRAW_FIRST_QTR_SCORES_SCRIPT:                                                                            ; DRAW SCOREBOARD Q1 SCORES
	.DB $89, $8A                                                                                         ; SET PPU ADDR = $218A
	.DB $DE, <P1_Q1_TOTAL, >P1_Q1_TOTAL                                                                  ; DRAW FROM DATA ADDR (HOME SCORE Q1)
	.DB $B1                                                                                              ;
	.DB $DE, <P2_Q1_TOTAL, >P2_Q1_TOTAL                                                                  ; DRAW FROM DATA ADDR (AWAY SCORE Q1)
	.DB $FE                                                                                              ; RETURN

DRAW_SECOND_QTR_SCORES_SCRIPT:                                                                           ; DRAW SCOREBOARD Q2 SCORES
	.DB $89, $8D                                                                                         ; SET PPU ADDR = $218D		
	.DB $DE, <P1_Q2_TOTAL, >P1_Q2_TOTAL                                                                  ; DRAW FROM DATA ADDR (HOME SCORE Q2)
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB $DE, <P2_Q2_TOTAL, >P2_Q2_TOTAL                                                                  ; DRAW FROM DATA ADDR (AWAY SCORE Q2)
	.DB $FE                                                                                              ; RETURN

DRAW_THIRD_QTR_SCORES_SCRIPT:                                                                            ; DRAW SCOREBOARD Q3 SCORES
	.DB $89, $90                                                                                         ; SET PPU ADDR = $2190
	.DB $DE, <P1_Q3_TOTAL, >P1_Q3_TOTAL                                                                  ; DRAW FROM DATA ADDR (HOME SCORE Q3)
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB $DE, <P2_Q3_TOTAL, >P2_Q3_TOTAL                                                                  ; DRAW FROM DATA ADDR (AWAY SCORE Q3)
	.DB $FE                                                                                              ; RETURN

DRAW_FOURTH_QTR_SCORES_SCRIPT:                                                                           ; DRAW SCOREBOARD Q4 SCORES
	.DB $89, $93                                                                                         ; SET PPU ADDR = $2193
	.DB $DE, <P1_Q4_TOTAL, >P1_Q4_TOTAL                                                                  ; DRAW FROM DATA ADDR (HOME SCORE Q4)
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB $DE, <P2_Q4_TOTAL, >P2_Q4_TOTAL                                                                  ; DRAW FROM DATA ADDR (AWAY SCORE Q4)
	.DB $FE                                                                                              ; RETURN

DRAW_TOTAL_SCORES_SCRIPT:                                                                                ; DRAW SCOREBOARD TOTAL SCORES
	.DB $89, $99                                                                                         ; SET PPU ADDR = $2199
	.DB $DE, <P1_TOTAL_SCORE, >P1_TOTAL_SCORE                                                            ; DRAW FROM DATA ADDR (HOME SCORE TOTAL)
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB $DE, <P2_TOTAL_SCORE, >P2_TOTAL_SCORE                                                            ; DRAW FROM DATA ADDR (AWAY SCORE TOTAL)
	.DB $FE                                                                                              ; RETURN  
	
_F}_SCOREBOARD_SCENE_SCRIPTS	

UNUSED_TWO_BANK8_SCREEN_SCRIPT :
	.DB $FF                                                                                              ; END

_F{_RETURN_FROM_INJURY_SCENE_SCRIPT

RECOVERED_FROM_INJURY_SCENE_SCRIPT:                                                                      ; 0X26 RECOVERED FROM INJURY SCREEN
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $F1                                                                                              ; SET GAME STATUS AND PPUR MIRRORING TO HORIZONTAL						;
	.DB $F7, $18                                                                                         ; DRAW BACKGROUND (HOSPITAL SCREEN)
	.DB $83, $80, <RECOV_INJURY_GRASS_ATTR_VALUES, >RECOV_INJURY_GRASS_ATTR_VALUES                       ; SET PPU ADDR = $2380,DO->DRAW LAST 2 ROWS OF GRASS
	.DB $83, $F8, <RECOV_INJURY_GRASS_TWO_ATTR_VALUES, >RECOV_INJURY_GRASS_TWO_ATTR_VALUES               ; SET PPU ADDR = $23F8,DO->SET ATTRIBUTE TABLE VALUES LAST TWO ROWS OF GRASS
	.DB $83, $C9, <RECOVERED_TEXT_ATTR_VALUES, >RECOVERED_TEXT_ATTR_VALUES                               ; SET PPU ADDR = $23C9,DO->SET ATTRIBUTE TABLE VALUES RECOVERED TEXT
	.DB $83, $D0, <TOP_OF_HOSPITAL_ATTR_VALUES, >TOP_OF_HOSPITAL_ATTR_VALUES                             ; SET PPU ADDR = $23D0,DO->SET ATTRIBUTE TABLE VALUES REST OF TEXT TOP OF HOSPITAL
	.DB $88, $68                                                                                         ; SET PPU ADDR = $2068
	.DB      "TECMO NEWS FLASH"                                                                          ;
	.DB $89, $37                                                                                         ; SET PPU ADDR = $2137
	.DB $3B                                                                                              ; DASH TILE
	.DB      "NO."                                                                                       ;
	.DB $F6                                                                                              ; SET SPRITE SIZE TO 16 X 16
	.DB $88, $A7                                                                                         ; SET PPU ADDR = $20A7
	.DB      "RECOVERED!"                                                                                ;
	.DB $89, $E3                                                                                         ; SET PPU ADDR = $21E3
	.DB      "COMES"                                                                                     ;
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB      "BACK!"                                                                                     ;
	.DB $F5                                                                                              ; SET SPRITE SIZE TO 08 X 08
	.DB $89, $22                                                                                         ; SET PPU ADDR = $2122
	.DB $FA, $08                                                                                         ; DRAW CURRENT TEAM NAME
	.DB $FA, $1C                                                                                         ; SET RECOVERY FROM INJURY TEAM PALLETE
	.DB $F9, $02, $CA, $CD                                                                               ; DRAW 2 SPRITES(PLAYER RUNNING R TO L, NURSES WAVING)
	.DB $E5, $11, $4B                                                                                    ; SAVE BG AND SPR PAL TO BUFFER AND FADE IN (BG, SPR)
	.DB $DD, $0A                                                                                         ; START OR END BLINKING PALLETE(BLINK PAL INDEX)
	.DB $F3, $34                                                                                         ; PLAY SOUND (INJURY RETURN MUSIC)
	.DB $FB, $F0                                                                                         ; WAIT 250 FRAMES = ~4 SEC
	.DB $F3, $01                                                                                         ; PLAY SOUND (STOP SOUND/SONG)
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $FF                                                                                              ; END	

TOP_OF_HOSPITAL_ATTR_VALUES:                                                                             ; ATTRIBUTE TABLE VALUES REST OF TEXT TOP OF HOSPITAL
	.DB $10, $50, $50, $50, $50, $50, $50, $50, $50, $05, $05, $05, $05, $05, $05, $05, $05
	.DB $FF                                                                                              ; END	


RECOVERED_TEXT_ATTR_VALUES:                                                                              ; ATTRIBUTE TABLE VALUES RECOVERED TEXT
	.DB $06, $EE, $FF, $FF, $FF, $FF, $FF                                                                ; 
	.DB $FF                                                                                              ; END	


RECOV_INJURY_GRASS_ATTR_VALUES:                                                                          ; DRAW LAST 2 ROWS OF GRASS FOR RECOVER FROM INJURY SCREEN
	.DB $20, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	.DB $A1                                                                                              ; DOWN ONE ROW
	.DB $20, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	.DB $FF                                                                                              ; END	


RECOV_INJURY_GRASS_TWO_ATTR_VALUES:                                                                      ; ATTRIBUTE TABLE VALUES FOR LAST 2 ROWS OF GRASS 
	.DB $08, $05, $05, $05, $05, $05, $05, $05, $05
	.DB $FF                                                                                              ; END	
	
_F}_RETURN_FROM_INJURY_SCENE_SCRIPT	

_F{_COIN_TOSS_SCENE_SCRIPTS

COIN_TOSS_INTRO_SCENE_SCRIPT:                                                                            ; 0X27 COIN TOSS INTRO
	.DB $C8                                                                                              ; SET IRQ0 SPLIT, XSCROLL,SOFT Y SCROLL LOC = 0
	.DB $F1                                                                                              ; SET GAME STATUS AND PPUR MIRRORING TO HORIZONTAL
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F7, $27                                                                                         ; DRAW BACKGROUND (STADIUM WITH SMALL SCOREBOARD AND FLAGS)
	.DB $F8, $11                                                                                         ; DRAW BACKGROUND ( LARGE SCOREBOARD OFFSCREEN) 
	.DB $8A, $27                                                                                         ; SET PPU ADDR = $2227
	.DB      "1P"                                                                                        ;
	.DB $8A, $37                                                                                         ; SET PPU ADDR = $2237
	.DB      "2P"                                                                                        ;
	.DB $8A, $8F                                                                                         ; SET PPU ADDR = $228F
	.DB      "VS"                                                                                        ;
	.DB $8A, $C6                                                                                         ; SET PPU ADDR = $22C6
	.DB      "(   )"                                                                                     ;
	.DB $8A, $D6                                                                                         ; SET PPU ADDR = $22D6
	.DB      "(   )"                                                                                     ;
	.DB $8D, $6B                                                                                         ; SET PPU ADDR = $296B = OFFSCREEN 
	.DB "1  2  3  4     T"
	.DB $8D, $85                                                                                         ; SET PPU ADDR = $2985 = OFFSCREEN
	.DB $D4                                                                                              ; DRAW P1 TEAM ABREV
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB $D5                                                                                              ; DRAW P2 TEAM ABREV
	.DB $FA, $0C                                                                                         ; DRAW P1 AND P2 TEAM CITY, TEAM NAME, TEAM CONTROL TYPE SMALL LETTERS
	.DB $F3, $1B                                                                                         ; PLAY SOUND (CROWD)
	.DB $FE                                                                                              ; RETURN

COIN_TOSS_TEXT_SCRIPT:                                                                                   ; DRAW COIN TOSS TEXT, WAIT 1 SEC
	.DB $89, $EB                                                                                         ; SET PPU ADDR = $21EB
	.DB      "COIN TOSS"                                                                                 ;
	.DB $FB, $36                                                                                         ; WAIT 54 FRAMES = ~1 SEC
	.DB $FE                                                                                              ; RETURN

OVERTIME_TEXT_SCRIPT:                                                                                    ; DRAW OVERTIME TOSS TEXT, WAIT 1 SEC
	.DB $89, $EB                                                                                         ;
	.DB      "OVER TIME"                                                                                 ;
	.DB $FB, $36                                                                                         ; WAIT 54 FRAMES = ~1 SEC
	.DB $FE                                                                                              ; RETURN

SET_UNI_REF_COLORS_SCRIPT:                                                                               ; SET PLAYER AND REFEREE COLORS AND FADE IN PALLETE
	.DB $FA, $17                                                                                         ; GET COIN TOSS P1/P2 FIELD UNIFORM COLORS, SET REFEREE PALLETTE
	.DB $E5, $FF                                                                                         ; SET AND FADE IN BG SPR PALLETE (BG,SPR PAL INDEX)
	.DB $DD, $07                                                                                         ; START OR END BLINKING PALLETE()
	.DB $F3, $21
	.DB $FB, $8C                                                                                         ; WAIT 140 FRAMES = 2.33 SEC
	.DB $FE                                                                                              ; RETURN

HOME_WINS_COIN_TOSS_SCRIPT:                                                                              ; 0X28 HOME WINS COIN TOSS
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES 
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ; 
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)		
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ; 
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES 
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE	
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $16                                                                                         ; PLAY SOUND (COIN LAND)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD"                                                                                      ; 
	.DB $FB, $B4                                                                                         ; WAIT 180 FRAMES = 3 SECONDS 
	.DB $FE                                                                                              ; RETURN

AWAY_WINS_COIN_TOSS_SCRIPT:                                                                              ; 0X29 AWAY WINS COIN TOSS
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES		
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT		
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "TAIL            HEAD"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $13                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HEAD/TAIL TEXT
	.DB      "HEAD            TAIL"                                                                      ;
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $9B, $06, $14, $00                                                                               ; SET PPU ADDR = $2306, REPEAT FOR 17 TILES, BLANK TILE
	.DB $FB, $03                                                                                         ; WAIT 3 FRAMES
	.DB $F3, $16                                                                                         ; PLAY SOUND (COIN TOSS)
	.DB $8B, $16                                                                                         ; SET PPU ADDR = $2316 = TAIL TEXT
	.DB      "HEAD"                                                                                      ;
	.DB $FB, $B4                                                                                         ; WAIT 180 FRAMES = 3 SECONDS
	.DB $FE                                                                                              ; RETURN

HOME_CHOOSE_KICK_RECV_SCENE_SCRIPT:                                                                      ; 0x2A HOME TEAM CHOOSE RETURN OR KICKOFF TEXT 
	.DB $8A, $C3                                                                                         ; SET PPU ADDR = $22C3 = HOME CHOOSE TEXT
	.DB      "(CHOOSE TO)"                                                                               ;
	.DB $8B, $06                                                                                         ; SET PPU ADDR = $2306 = HOME RETURN TEXT
	.DB      "RETURN"                                                                                    ;
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB      "KICKOFF"                                                                                   ; 
	.DB $F3, $14                                                                                         ; PLAY SOUND (COIN TOSS OPTION)
	.DB $FE                                                                                              ; RETURN

AWAY_CHOOSE_KICK_RECV_SCENE_SCRIPT:                                                                      ; 0x2B HOME TEAM CHOOSE RETURN OR KICKOFF TEXT
	.DB $8A, $D3                                                                                         ; SET PPU ADDR = $22D3 = AWAY CHOOSE TEXT
	.DB      "(CHOOSE TO)"                                                                               ;
	.DB $8B, $16                                                                                         ; SET PPU ADDR = $2316 = AWAY RETURN TEXT
	.DB      "RETURN"                                                                                    ;
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB      "KICKOFF"                                                                                   ;
	.DB $F3, $14                                                                                         ; PLAY SOUND (COIN TOSS OPTION) 
	.DB $FE                                                                                              ; RETURN

HOME_WINS_COIN_TOSS_SCENE_SCRIPT:                                                                        ; 0X2C COIN TOSS HOME WINS
	.DB $FD, <COIN_TOSS_INTRO_SCENE_SCRIPT, >COIN_TOSS_INTRO_SCENE_SCRIPT                                ; DO->COIN TOSS INTRO
	.DB $F9, $03, $A6, $A4, $CB                                                                          ; DRAW 3 SPRITES(PLAYERS RUNNING + COIN, P1 WINS REF, PLAYERS STANDING STILL)
	.DB $FD, <SET_UNI_REF_COLORS_SCRIPT, >SET_UNI_REF_COLORS_SCRIPT                                      ; DO->SET PLAYER AND REFEREE COLORS AND FADE IN PALLETE
	.DB $FD, <COIN_TOSS_TEXT_SCRIPT, >COIN_TOSS_TEXT_SCRIPT                                              ; DO->DRAW COIN TOSS TEXT, WAIT 1 SEC
	.DB $FD, <HOME_WINS_COIN_TOSS_SCRIPT, >HOME_WINS_COIN_TOSS_SCRIPT                                    ; DO->HOME WINS COIN TOSS TEXT ANIMATION
	.DB $FD, <HOME_CHOOSE_KICK_RECV_SCENE_SCRIPT, >HOME_CHOOSE_KICK_RECV_SCENE_SCRIPT                    ; DO->HOME TEAM CHOOSE RETURN OR KICKOFF TEXT
	.DB $FA, $11                                                                                         ; UPDATE P1 SELECTION ARROW COIN TOSS, AND SET KICK OR RECEIVE
	.DB $FC, <P1_MAKES_KICK_REC_CHOICE_SCRIPT, >P1_MAKES_KICK_REC_CHOICE_SCRIPT                          ; JUMP-> DRAW P1 POINTING SPRITE THEN DO KICKOFF SCREEN
	
AWAY_WINS_COIN_TOSS_SCENE_SCRIPT:                                                                        ; 0X2D COIN TOSS AWAY WINS
	.DB $FD, <COIN_TOSS_INTRO_SCENE_SCRIPT, >COIN_TOSS_INTRO_SCENE_SCRIPT                                ; DO->COIN TOSS INTRO
	.DB $F9, $03, $A6, $A5, $CB                                                                          ; DRAW 3 SPRITES(PLAYERS RUNNING + COIN, P2 WINS REF, PLAYERS STANDING STILL)
	.DB $FD, <SET_UNI_REF_COLORS_SCRIPT, >SET_UNI_REF_COLORS_SCRIPT                                      ; DO->SET PLAYER AND REFEREE COLORS AND FADE IN PALLETE
	.DB $FD, <COIN_TOSS_TEXT_SCRIPT, >COIN_TOSS_TEXT_SCRIPT                                              ; DO->DRAW COIN TOSS TEXT, WAIT 1 SEC
	.DB $FD, <AWAY_WINS_COIN_TOSS_SCRIPT, >AWAY_WINS_COIN_TOSS_SCRIPT                                    ; DO->HOME AWAY COIN TOSS TEXT ANIMATION
	.DB $FD, <AWAY_CHOOSE_KICK_RECV_SCENE_SCRIPT, >AWAY_CHOOSE_KICK_RECV_SCENE_SCRIPT                    ; DO->AWAY TEAM CHOOSE RETURN OR KICKOFF TEXT
	.DB $FA, $12                                                                                         ; UPDATE P2 SELECTION ARROW COIN TOSS, AND SET KICK OR RECEIVE
	.DB $FC, <P2_MAKES_KICK_REC_CHOICE_SCRIPT, >P2_MAKES_KICK_REC_CHOICE_SCRIPT                          ; JUMP->DRAW P2 POINTING SPRITE THEN DO KICKOFF SCREEN

P1_MAKES_KICK_REC_CHOICE_SCRIPT:                                                                         ; DRAW P1 POINTING SPRITE THEN DO KICKOFF SCREEN
	.DB $F9, $02, $CE, $A3                                                                               ; DRAW 2 SPRITES(REF POINT P1 SIDE, P1 POINTING)

PLAY_KICKOFF_SOUND_THEN_DO_KICKOFF_SCRIPT:                                                               ; WAIT PLAY SOUND THEN DO KICKOFF SCREEN
	.DB $FB, $1E                                                                                         ; WAIT 30 FRAMES = 0.5 SECOND
	.DB $F3, $15                                                                                         ; PLAY SOUND( KICKOFF CHOICE)
	.DB $FB, $46                                                                                         ; WAIT 70 FRAMES =
	.DB $FC, <KICKOFF_SCOREBOARD_AND_FLAGS_SCENE_SCRIPT, >KICKOFF_SCOREBOARD_AND_FLAGS_SCENE_SCRIPT      ; JUMP->DRAW KICKOFF SCREEN

P2_MAKES_KICK_REC_CHOICE_SCRIPT:                                                                         ; DRAW P2 POINTING SPRITE THEN DO KICKOFF SCREEN
	.DB $F9, $02, $CF, $A2                                                                               ; DRAW 2 SPRITES(REF POINT P2 SIDE, P2 PLAYER POINT)
	.DB $FC, <PLAY_KICKOFF_SOUND_THEN_DO_KICKOFF_SCRIPT, >PLAY_KICKOFF_SOUND_THEN_DO_KICKOFF_SCRIPT      ; JUMP->WAIT PLAY SOUND THEN DO KICKOFF SCREEN
	
_F}_COIN_TOSS_SCENE_SCRIPTS	

_F{_KICKOFF_SCENE_SCRIPT

KICKOFF_SCOREBOARD_AND_FLAGS_SCENE_SCRIPT:                                                               ; DRAW KICKOFF SCREEN
	.DB $F9, $01, $BC                                                                                    ; DRAW SPRITE(4 WAVING FLAGS)
	.DB $D2                                                                                              ; SWITCH SCROLL LOCATION ONCE TASK 3 IS EMPTY
	.DB $EB, $0D, $47                                                                                    ; SET BG AND SPR PAL AND SET TO FULLY FADED IN (BG INDEX, SPR INDEX))
	.DB $DD, $0E                                                                                         ; START OR END BLINKING PALLETE()
	.DB $C0, $20, $00, $00, $18, $30                                                                     ; SET IRQ0 (COUNTER VAL=0, SCROLL SPEED=0, CHR BANK 0=$18, CHR BANK 1=$30)
	.DB $F3, $20                                                                                         ; PLAY SOUND (KICKOFF MUSIC)
	.DB $CD, $00                                                                                         ; CLEAR $2000 NAMETABLE
	.DB $F8, $31                                                                                         ; DRAW BG (SOMETHING STADIUM) OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $68                                                                                         ; SET PPU ADDR = $2268
	.DB      "KICKOFF!"                                                                                  ;
	.DB $8B, $00                                                                                         ; SET PPU ADDR = $2300
	.DB $FA, $1D                                                                                         ; DRAW KICKERS NAME CENTERED
	.DB $FB, $50                                                                                         ; WAIT 80 FRAMES
	.DB $F0                                                                                              ; SET GAME STATUS($2D) HORIZONTAL FLIP BASED ON POSSESSION
	.DB $F9, $01, $58                                                                                    ; DRAW SPRITE (KICKOFF ARM IN AIR)	
	.DB $D2                                                                                              ; SWITCH SCROLL LOCATION ONCE TASK 3 IS EMPTY
	.DB $D0, $6A, $68                                                                                    ; SET IRQ 0 BG CHR BANKS (CHR BANK 0=$6A, CHR BANK 1=$68)
	.DB $C0, $01, $88, $18, $1A                                                                          ; SET IRQ 1 (IRQ COUNTER, CHR BANK 0, CHR BANK 1)
	.DB $D8, $B2                                                                                         ; GET SPECIAL TEAMS PLAYER PALLLETE, SET AND FADE IN BG PALLETE
	.DB $DD, $04                                                                                         ; START OR END BLINKING PALLETE()
	.DB $FB, $50                                                                                         ; WAIT 80 FRAMES
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $FF                                                                                              ; END
	
_F}_KICKOFF_SCENE_SCRIPT	

_F{_OVERTIME_COIN_TOSS_SCENE_SCRIPT

OT_COIN_TOSS_HOME_WINS_SCENE_SCRIPT:                                                                     ; 0x31 OT COIN TOSS P1 WINS
	.DB $FD, <COIN_TOSS_INTRO_SCENE_SCRIPT, >COIN_TOSS_INTRO_SCENE_SCRIPT                                ; DO->COIN TOSS INTRO
	.DB $F9, $03, $A6, $A4, $CB                                                                          ; DRAW 3 SPRITES(PLAYERS RUNNING + COIN, P1 WINS REF, PLAYERS STANDING STILL)
	.DB $FD, <SET_UNI_REF_COLORS_SCRIPT, >SET_UNI_REF_COLORS_SCRIPT                                      ; DO->SET PLAYER AND REFEREE COLORS AND FADE IN PALLETE
	.DB $FD, <OVERTIME_TEXT_SCRIPT, >OVERTIME_TEXT_SCRIPT                                                ; DO->DRAW OVERTIME TEXT, WAIT 1 SEC
	.DB $FD, <HOME_WINS_COIN_TOSS_SCRIPT, >HOME_WINS_COIN_TOSS_SCRIPT                                    ; DO->HOME WINS COIN TOSS TEXT ANIMATION
	.DB $F3, $14                                                                                         ; PLAY SOUND (COIN TOSS WINNER) 
	.DB $8B, $42                                                                                         ; SET PPU ADDR = $2342
	.DB      "RETURN SIDE"                                                                               ;
	.DB $8B, $53                                                                                         ; SET PPU ADDR = $2353
	.DB      "KICK SIDE"                                                                                 ;
	.DB $FB, $46                                                                                         ; WAIT 70 FRAMES
	.DB $F9, $02, $CE, $A3                                                                               ; DRAW 2 SPRITES(REF POINT P1 SIDE, P1 POINTING)

SCORE_AND_OT_KICKOFF_SCRIPT:                                                                             ; PLAY SELECTION SOUND, DRAW TOTAL SCORE AND DO KICKOFF SCENE
	.DB $F3, $15                                                                                         ; PLAY "COIN TOSS SELECTION" SOUND
	.DB $8D, $99                                                                                         ; SET PPU ADDR = $2599
	.DB $DE, <P1_TOTAL_SCORE, >P1_TOTAL_SCORE                                                            ; DRAW P1 SCORE
	.DB $B1                                                                                              ; DOWN 2 ROWS
	.DB $DE, <P2_TOTAL_SCORE, >P2_TOTAL_SCORE                                                            ; SAVE P2 SCORE 
	.DB $FB, $46                                                                                         ; WAIT 70 FRAMES
	.DB $FC, <KICKOFF_SCOREBOARD_AND_FLAGS_SCENE_SCRIPT, >KICKOFF_SCOREBOARD_AND_FLAGS_SCENE_SCRIPT                                                ; JUMP-> DRAW KICKOFF SCENE

OT_COIN_TOSS_AWAY_WINS_SCENE_SCRIPT:                                                                     ; 0x32 OT COIN TOSS P1 WINS
	.DB $FD, <COIN_TOSS_INTRO_SCENE_SCRIPT, >COIN_TOSS_INTRO_SCENE_SCRIPT                                ; DO->COIN TOSS INTRO
	.DB $F9, $03, $A6, $A5, $CB                                                                          ; DRAW 3 SPRITES(PLAYERS RUNNING + COIN, P2 WINS REF, PLAYERS STANDING STILL)
	.DB $FD, <SET_UNI_REF_COLORS_SCRIPT, >SET_UNI_REF_COLORS_SCRIPT                                      ; DO->SET PLAYER AND REFEREE COLORS AND FADE IN PALLETE
	.DB $FD, <OVERTIME_TEXT_SCRIPT, >OVERTIME_TEXT_SCRIPT                                                ; DO->DRAW OVERTIME TEXT, WAIT 1 SEC
	.DB $FD, <AWAY_WINS_COIN_TOSS_SCRIPT, >AWAY_WINS_COIN_TOSS_SCRIPT                                    ; DO->AWAY WINS COIN TOSS TEXT ANIMATION
	.DB $F3, $14                                                                                         ; PLAY SOUND (COIN TOSS WINNER)
	.DB $8B, $43                                                                                         ; SET PPU ADDR = $2343
	.DB      "KICK SIDE"                                                                                 ;
	.DB $8B, $52                                                                                         ; SET PPU ADDR = $2352
	.DB      "RETURN SIDE"                                                                               ;
	.DB $FB, $46                                                                                         ; WAIT 70 FRAMES
	.DB $F9, $02, $CF, $A2                                                                               ; DRAW 2 SPRITES(REF POINT P2 SIDE, P2 PLAYER POINT)
	.DB $FC, <SCORE_AND_OT_KICKOFF_SCRIPT, >SCORE_AND_OT_KICKOFF_SCRIPT                                  ; JUMP-> PLAY SELECTION SOUND, DRAW TOTAL SCORE AND DO KICKOFF SCENE
	
_F}_OVERTIME_COIN_TOSS_SCENE_SCRIPT	

UNUSED_THREE_BANK8_SCREEN_SCRIPT :                                                                       ; 0x33 UNUSED
	.DB $FF

_F{_PRE_AND_SEASON_WEEK_TEXT_MATCHUP_SCENE_SCRIPTS


PRESEASON_LARGE_TEXT_SCREEN_SCRIPT:                                                                      ; 0x34 PRESEASON LARGE TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $D0, $20, $1A                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $89, $A7                                                                                         ; SET PPU ADDR = $21A7
	.DB      "PRESEASON"                                                                                 ;
	.DB $E5, $00, $00                                                                                    ; SAVE BG AND SPR PAL TO BUFFER AND FADE IN (BG, SPR)
	.DB $FB, $78                                                                                         ; WAIT 120 FRAMES = 2 SECONDS
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $FF                                                                                              ; END

PROBOWL_LARGE_TEXT_SCREEN_SCRIPT:                                                                        ; 0x35 PR0 BOWL LARGE TEXT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $D0, $20, $1A                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $89, $A8                                                                                         ; SET PPU ADDR = $21A8
	.DB      "PRO BOWL"                                                                                  ;
	.DB $E5, $00, $00                                                                                    ; SAVE BG AND SPR PAL TO BUFFER AND FADE IN (BG, SPR)
	.DB $E5, $00, $00                                                                                    ; SAVE BG AND SPR PAL TO BUFFER AND FADE IN (BG, SPR)
	.DB $FB, $78                                                                                         ; WAIT 120 FRAMES = 2 SECONDS
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $FF                                                                                              ; END

REG_SEASON_FIRST_WEEK_SCREEN_SCRIPT:                                                                     ; 0x36 1ST WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "1ST"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC
	

REG_SEASON_SECOND_WEEK_SCREEN_SCRIPT:                                                                    ; 0x37 2ND WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "2ND"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_THIRD_WEEK_SCREEN_SCRIPT:                                                                     ; 0x38 3RD WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "3RD"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_FOURTH_WEEK_SCREEN_SCRIPT:                                                                    ; 0x39 4TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "4TH"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_FIFTH_WEEK_SCREEN_SCRIPT:                                                                     ; 0x3A 5TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "5TH"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC

	
REG_SEASON_SIXTH_WEEK_SCREEN_SCRIPT:                                                                     ; 0x3B 6TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "6TH"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_SEVENTH_WEEK_SCREEN_SCRIPT:                                                                   ; 0x3C 7TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "7TH"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_EIGHTH_WEEK_SCREEN_SCRIPT:                                                                    ; 0x3D 8TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "8TH"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_NINTH_WEEK_SCREEN_SCRIPT:                                                                     ; 0x3E 9TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $28                                                                                         ; SET PPU ADDR = $2228
	.DB      "9TH"                                                                                       ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_TENTH_WEEK_SCREEN_SCRIPT:                                                                     ; 0x3F 10TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2228
	.DB      "10TH"                                                                                      ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC

	
REG_SEASON_ELEVENTH_WEEK_SCREEN_SCRIPT:                                                                  ; 0x40 11TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2228
	.DB      "11TH"                                                                                      ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_TWELTH_WEEK_SCREEN_SCRIPT:                                                                    ; 0x41 12TH WEEK  REDULAR SEASON TEXT 
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2228
	.DB      "12TH"                                                                                      ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC


REG_SEASON_THIRTEENTH_WEEK_SCREEN_SCRIPT:                                                                ; 0x42 13TH WEEK  REDULAR SEASON TEXT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2228
	.DB      "13TH"                                                                                      ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC

REG_SEASON_FOURTEENTH_WEEK_SCREEN_SCRIPT:                                                                ; 0x43 14TH WEEK  REDULAR SEASON TEXT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2228
	.DB      "14TH"                                                                                      ; 
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC

REG_SEASON_FIFTHTEENTH_WEEK_SCREEN_SCRIPT:                                                               ; 0x44 15TH WEEK  REDULAR SEASON TEXT	
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2228
	.DB      "15TH"                                                                                      ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC

REG_SEASON_SIXTHTEENTH_WEEK_SCREEN_SCRIPT:                                                               ; 0x45 16TH WEEK  REDULAR SEASON TEXT	
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2228
	.DB      "16TH"
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC

REG_SEASON_SEVENTEENTH_WEEK_SCREEN_SCRIPT:                                                               ; 0x46 17TH WEEK  REDULAR SEASON TEXT	
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2228
	.DB      "17TH"                                                                                      ;
	.DB $FC, <REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT, >REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT                    ; DO->DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC

REG_SEASON_EIGHTEENTH_WEEK_SCREEN_SCRIPT:                                                                ; 0x47 18TH WEEK  REDULAR SEASON TEXT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $8A, $26                                                                                         ;
	.DB      "18TH"                                                                                      ;

REG_SEASON_WEEK_TEXT_SCREEN_SCRIPT:                                                                      ; 0X48 DRAW REGULAR SEASON AND WEEK TEXT, FADE OUT AFTER 2 SEC
	.DB $D0, $20, $1A                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $89, $A2                                                                                         ; SET PPU ADDR = $21A2
	.DB      "REGULAR SEASON"                                                                            ;
	.DB $8A, $30                                                                                         ; SET PPU ADDR = $2230
	.DB      "WEEK"                                                                                      ;
	.DB $E5, $00, $00                                                                                    ; SET AND FADE IN BG SPR PALLETE (BG,SPR PAL INDEX)
	.DB $FB, $78                                                                                         ; WAIT 120 FRAMES = 2 SECONDS
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $FF                                                                                              ; END
	
_F}_PRE_AND_SEASON_WEEK_TEXT_MATCHUP_SCENE_SCRIPTS	

UNUSED_FOUR_BANK8_SCREEN_SCRIPT:                                                                         ;0x49-0X4B UNUSED
	.DB $FF

_F{_SKIP_MODE_SCORE_AND_EOG_STAT_SCREEN_SCENE_SCRIPTS

SKP_MODE_NO_OT_BLUE_SCREEN_SCENE_SCRIPT:
	.DB $FD, <DRAW_FOURTH_QTR_SCORES_SCRIPT, >DRAW_FOURTH_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q4 SCORES
	.DB $FD, <DRAW_TOTAL_SCORES_SCRIPT, >DRAW_TOTAL_SCORES_SCRIPT                                        ; DO->DRAW SCOREBOARD TOTAL SCORES
	.DB $FC, <FINAL_STATS_SCREEN_SCRIPT, >FINAL_STATS_SCREEN_SCRIPT                                      ; JUMP->FINAL STATS SCREEN

SKP_MODE_OT_BLUE_SCREEN_SCENE_SCRIPT:       
	.DB $FD, <DRAW_FIRST_QTR_SCORES_SCRIPT, >DRAW_FIRST_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q1 SCORES
	.DB $FD, <DRAW_TOTAL_SCORES_SCRIPT, >DRAW_TOTAL_SCORES_SCRIPT                                        ; DO->DRAW SCOREBOARD TOTAL SCORES
	.DB $FC, <FINAL_STATS_SCREEN_SCRIPT, >FINAL_STATS_SCREEN_SCRIPT                                      ; JUMP->FINAL STATS SCREEN

NO_OT_BLUE_SCREEN_SCENE_SCRIPT:                                                                          ; 0X4E FINAL SCOREBOARD
	.DB $FD, <DRAW_SCOREBOARD_BG_SCRIPT, >DRAW_SCOREBOARD_BG_SCRIPT                                      ; DO->DRAW SCOREBOARD BACKGROUND WITH TEAMS
	.DB $F1                                                                                              ; SET GAME STATUS AND PPUR MIRRORING TO HORIZONTAL
	.DB $F8, $3B                                                                                         ; DRAW BACKGROUND (TECMO SPORTS NEWS) OFFSCREEN
	.DB $FD, <DRAW_FIRST_QTR_SCORES_SCRIPT, >DRAW_FIRST_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q1 SCORES
	.DB $FD, <DRAW_SECOND_QTR_SCORES_SCRIPT, >DRAW_SECOND_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q2 SCORES
	.DB $FD, <DRAW_THIRD_QTR_SCORES_SCRIPT, >DRAW_THIRD_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q3 SCORES
	.DB $FD, <DRAW_FOURTH_QTR_SCORES_SCRIPT, >DRAW_FOURTH_QTR_SCORES_SCRIPT                              ; DO->DRAW SCOREBOARD Q4 SCORES
	.DB $FD, <DRAW_TOTAL_SCORES_SCRIPT, >DRAW_TOTAL_SCORES_SCRIPT                                        ; DO->DRAW SCOREBOARD TOTAL SCORES
	.DB $F3, $2F                                                                                         ; PLAY SOUND (STATS SCREEN SONG)
	.DB $FC, <FINAL_STATS_SCREEN_SCRIPT, >FINAL_STATS_SCREEN_SCRIPT                                      ; JUMP->FINAL STATS SCREEN

OT_BLUE_SCREEN_SCENE_SCRIPT:                                                                             ; 0X4F FINAL SCOREBOARD OT
	.DB $FD, <DRAW_SCOREBOARD_BG_SCRIPT, >DRAW_SCOREBOARD_BG_SCRIPT                                      ; DO->DRAW SCOREBOARD BACKGROUND WITH TEAMS
	.DB $F1                                                                                              ; SET GAME STATUS AND PPUR MIRRORING TO HORIZONTAL
	.DB $F8, $3B                                                                                         ; DRAW BACKGROUND (TECMO SPORTS NEWS) OFFSCREEN
	.DB $FD, <DRAW_FIRST_QTR_SCORES_SCRIPT, >DRAW_FIRST_QTR_SCORES_SCRIPT                                ; DO->DRAW SCOREBOARD Q1 SCORES
	.DB $FD, <DRAW_TOTAL_SCORES_SCRIPT, >DRAW_TOTAL_SCORES_SCRIPT                                        ; DO->DRAW SCOREBOARD TOTAL SCORES
	.DB $F3, $2F                                                                                         ; PLAY SOUND (STATS SCREEN SONG)

FINAL_STATS_SCREEN_SCRIPT:                                                                               ; FINAL STATS SCREEN
	.DB $C0, $41, $EF, $00, $28, $18, $1A                                                                ; SET IRQ Y SCROLL START (IRQ INDEX, COUNTER VAL, PPU ADDR (2 BYTE), CHR BANK 0, CHR BANK 1 )
	.DB $E5, $0D, $47                                                                                    ; SET AND FADE IN BG SPR PALLETE (BG,SPR PAL INDEX)
	.DB $FB, $78                                                                                         ; WAIT 120 FRAMES = 2 SECONDS
	.DB $C0, $51, $90, $80                                                                               ; SCROLL Y (IRQ INDEX, Y SCROLL SPEED, Y SCROLL STOP)
	.DB $FB, $3C                                                                                         ; WAIT 60 FRAMES = 1 SECOND
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $C1                                                                                              ; CLEAR IRQS AND END UPDATE PALLLETE
	.DB $F7, $28                                                                                         ; DRAW BACKGROUND (NFL SHIELD LEFT CORNER)
	.DB $F9, $01, $7F                                                                                    ; CLEAR SPRITES()
	.DB $83, $C9, <ATRR_VALS_LARGE_TEAM_NAME_FINAL_STATS, >ATRR_VALS_LARGE_TEAM_NAME_FINAL_STATS         ; SET PPU ADDR = $23C9 = ATTRIBUTE TABLE FOR LARGE TEAM NAMES FINAL STATS 
	.DB $83, $D8, <ATRR_VALS_LARGE_TEAM_NAME_TWO_FINAL_STATS, >ATRR_VALS_LARGE_TEAM_NAME_TWO_FINAL_STATS; SET PPU ADDR = $23D8 = ATTRIBUTE TABLE FOR TEAM NAME ABBREV FINAL STATS
	.DB $83, $E8, <ATRR_VALS_LARGE_TEAM_NAME_TWO_FINAL_STATS, >ATRR_VALS_LARGE_TEAM_NAME_TWO_FINAL_STATS ; SET PPU ADDR = $23E8 = ATTRIBUTE TABLE FOR TEAM NAME ABBREV FINAL STATS
	.DB $83, $F0, <ATRR_VALS_LARGE_TEAM_NAME_TWO_FINAL_STATS, >ATRR_VALS_LARGE_TEAM_NAME_TWO_FINAL_STATS ; SET PPU ADDR = $23F0 = ATTRIBUTE TABLE FOR TEAM NAME ABBREV FINAL STATS
																										; DRAW OUTLINE BOXES FOR TEAM STATS
	.DB $91, $86, $03, $6A                                                                               ; 
	.DB $91, $8F, $03, $6A                                                                               ;
	.DB $91, $90, $03, $6A                                                                               ;
	.DB $91, $96, $03, $6A                                                                               ;
	.DB $91, $97, $03, $6A                                                                               ;
	.DB $91, $9C, $03, $6A                                                                               ;
	.DB $92, $86, $08, $6A                                                                               ;
	.DB $92, $9E, $08, $6A                                                                               ;
	.DB $99, $67, $0F, $6B                                                                               ;
	.DB $99, $E7, $15, $6B                                                                               ;	
	.DB $9A, $67, $11, $6B                                                                               ;
	.DB $9A, $C7, $0C, $6B                                                                               ;
	.DB $9B, $27, $14, $6B                                                                               ;
	.DB $9B, $87, $17, $6B                                                                               ;
	.DB $A9, $66, $6C                                                                                    ;
	.DB $A9, $6F, $6D                                                                                    ;
	.DB $A9, $E6, $6E                                                                                    ;
	.DB $A9, $EF, $6F                                                                                    ;
	.DB $A9, $70, $6C                                                                                    ;
	.DB $A9, $76, $6D                                                                                    ;
	.DB $A9, $F0, $6E                                                                                    ;
	.DB $A9, $F6, $6F                                                                                    ;
	.DB $A9, $77, $6C                                                                                    ;
	.DB $A9, $7C, $6D                                                                                    ;
	.DB $A9, $F7, $6E                                                                                    ;
	.DB $A9, $FC, $6F                                                                                    ;
	.DB $AA, $C6, $70                                                                                    ;
	.DB $AB, $26, $70                                                                                    ;
	.DB $AA, $66, $6C                                                                                    ;
	.DB $AA, $7E, $6D                                                                                    ;
	.DB $AB, $86, $6E                                                                                    ;
	.DB $AB, $9E, $6F                                                                                    ;
	.DB $89, $88                                                                                         ; SET PPU ADDR = $2188 
	.DB $68, $69, $00, $00, $62, $63                                                                     ; "NO  YDS" SMALL COLORED TILES FOR RUNS
	.DB $89, $93                                                                                         ; SET PPU ADDR = $2193 
	.DB $62, $63                                                                                         ; "YDS" SMALL COLORED TILES FOR PASS
	.DB $8A, $78                                                                                         ; SET PPU ADDR = $2278
	.DB $68, $69, $6B, $6B, $62, $63                                                                     ; "NO--YDS" SMALL COLORED TILES FOR TEAM LEADER RUNS
	.DB $8A, $D3                                                                                         ; SET PPU ADDR = $22D3
	.DB $60, $61, $64, $65                                                                               ; "COMP%" SMALL COLORED TILES
	.DB $6B, $6B                                                                                         ; "-"
	.DB $62, $63, $6B, $66, $67                                                                          ; "YDS--INT" SMALL COLORED TILES
	.DB $8B, $37                                                                                         ; SET PPU ADDR = $2337
	.DB $60, $61, $64, $6B, $6B                                                                          ; "COMP--" SMALL COLORED TILES
	.DB $62, $63                                                                                         ; "YDS" SMALL COLORED TILES FOR 
	.DB $F5                                                                                              ; SET SPRITE SIZE TO 8X8
	.DB $88, $46                                                                                         ; SET PPU ADDR = $2046
	.DB      "TECMO SPORTS NEWS"                                                                         ;
	.DB $89, $26                                                                                         ; SET PPU ADDR = $2126
	.DB      "TEAM STATISTICS"                                                                           ;
	.DB $8A, $26                                                                                         ; SET PPU ADDR = $2226
	.DB      "TEAM LEADER"                                                                               ;
	.DB $89, $68                                                                                         ; SET PPU ADDR = $2168
	.DB      "RUNS"                                                                                      ;
	.DB $89, $71                                                                                         ; SET PPU ADDR = $2171
	.DB      "PASS"                                                                                      ;
	.DB $89, $58                                                                                         ; SET PPU ADDR = $2158
	.DB      "1ST"                                                                                       ;
	.DB $B0                                                                                              ; DOWN 1 ROW
	.DB      "DOWN"                                                                                      ;
	.DB $8A, $68                                                                                         ; SET PPU ADDR = $2268
	.DB      "RUNS"                                                                                      ;
	.DB $B2                                                                                              ; DOWN 3 ROWS
	.DB      "PASS"                                                                                      ;
	.DB $B2                                                                                              ; DOWN 3 ROWS
	.DB      "RECEIVE"                                                                                   ;
	.DB $FA, $0D                                                                                         ; DRAW END OF GAME STATS
	.DB $89, $A2                                                                                         ; SET PPU ADDR = $21A2
	.DB $D4                                                                                              ; DRAW P1 TEAM ABBREV
	.DB $B0                                                                                              ; DOWN 1 ROW
	.DB $D5                                                                                              ; DRAW P2 TEAM ABBREV
	.DB $8A, $82                                                                                         ; SET PPU ADDR = $2282
	.DB $D4                                                                                              ; DRAW P1 TEAM ABBREV
	.DB $B0                                                                                              ; DOWN 1 ROW
	.DB $D5                                                                                              ; DRAW P2 TEAM ABBREV
	.DB $8A, $E2                                                                                         ; SET PPU ADDR = $22E2
	.DB $D4                                                                                              ; DRAW P1 TEAM ABBREV
	.DB $B0                                                                                              ; DOWN 1 ROW
	.DB $D5                                                                                              ; DRAW P2 TEAM ABBREV
	.DB $8B, $42                                                                                         ; SET PPU ADDR = $2342
	.DB $D4                                                                                              ; DRAW P1 TEAM ABBREV
	.DB $B0                                                                                              ; DOWN 1 ROW
	.DB $D5                                                                                              ; DRAW P2 TEAM ABBREV
	.DB $E5, $34, $49                                                                                    ; SET BG AND SPR PAL AND FADE IN(BG,SPR)
	.DB $FA, $10                                                                                         ; CHECK FOR EXIT STATS SCREEN
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F3, $01                                                                                         ; PLAY SOUND (STOP CURRENTY SONG)
	.DB $FF                                                                                              ; END

ATRR_VALS_LARGE_TEAM_NAME_FINAL_STATS:                                                                   ; ATTRIBUTE TABLE FOR LARGE TEAM NAMES FINAL STATS
	.DB $06                                                                                              ; LENGTH
	.DB $66, $55, $55, $55, $55, $11                                                                    ;
	.DB $FF                                                                                              ; END

ATRR_VALS_LARGE_TEAM_NAME_TWO_FINAL_STATS:                                                               ; ATTRIBUTE TABLE FOR TEAM NAME ABBREV FINAL STATS
	.DB $02                                                                                              ; LENGTH
	.DB $44, $11                                                                                         ;
	.DB $FF                                                                                              ; END
	
_F}_SKIP_MODE_SCORE_AND_EOG_STAT_SCREEN_SCENE_SCRIPTS	

UNUSED_FIVE_BANK8_SCREEN_SCRIPT:
	.DB $FF                                                                                              ; END

_F{_PLAYOFF_ROUND_MATCHUP_TEXT_SCENE_SCRIPTS

AFC_FIRST_ROUND_SCENE_SCRIPT:                                                                            ; 0X52 DRAW AFC FIRST ROUND PLAYOFF TEXT
	.DB $FD, <AFC_MATCHUP_SCREEN_TEXT_SCRIPT, >AFC_MATCHUP_SCREEN_TEXT_SCRIPT                            ; DO->CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "AFC" TEXT
	.DB $FD, <FIRST_ROUND_TEXT_SCRIPT, >FIRST_ROUND_TEXT_SCRIPT                                          ; DO->DRAW "FIRST ROUND" TEXT
	.DB $FD, <PLAYOFF_TEXT_SCRIPT, >PLAYOFF_TEXT_SCRIPT                                                  ; DO->DRAW "PLAYOFF" TEXT
	.DB $FC, <FADE_OUT_MATCHUP_SCREEN_SCRIPT, >FADE_OUT_MATCHUP_SCREEN_SCRIPT                            ; DO->SET AND FADE IN PALLETE, WAIT 2 SECONDS AND FADE OUT

NFC_FIRST_ROUND_SCENE_SCRIPT:                                                                            ; 0X53 DRAW NFC FIRST ROUND PLAYOFF TEXT
	.DB $FD, <NFC_MATCHUP_SCREEN_TEXT_SCRIPT, >NFC_MATCHUP_SCREEN_TEXT_SCRIPT                            ; DO->CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "NFC" TEXT
	.DB $FD, <FIRST_ROUND_TEXT_SCRIPT, >FIRST_ROUND_TEXT_SCRIPT                                          ; DO->DRAW "FIRST ROUND" TEXT
	.DB $FD, <PLAYOFF_TEXT_SCRIPT, >PLAYOFF_TEXT_SCRIPT                                                  ; DO->DRAW "PLAYOFF" TEXT
	.DB $FC, <FADE_OUT_MATCHUP_SCREEN_SCRIPT, >FADE_OUT_MATCHUP_SCREEN_SCRIPT                            ; DO->SET AND FADE IN PALLETE, WAIT 2 SECONDS AND FADE OUT

UNUSED_SIX_BANK8_SCREEN_SCRIPT:                                                                          ; 0X54,0X55 UNUSED
	.DB $FF

AFC_DIVISIONAL_SCENE_SCRIPT:                                                                             ; 0X56 DRAW "AFC DIVISIONAL PLAYOFF" TEXT
	.DB $FD, <AFC_MATCHUP_SCREEN_TEXT_SCRIPT, >AFC_MATCHUP_SCREEN_TEXT_SCRIPT                            ; DO->CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "AFC" TEXT
	.DB $FD, <DIVISIONAL_TEXT_SCRIPT, >DIVISIONAL_TEXT_SCRIPT                                            ; DO->DRAW "DIVISIONAL" TEXT
	.DB $FD, <PLAYOFF_TEXT_SCRIPT, >PLAYOFF_TEXT_SCRIPT                                                  ; DO->DRAW "PLAYOFF" TEXT
	.DB $FC, <FADE_OUT_MATCHUP_SCREEN_SCRIPT, >FADE_OUT_MATCHUP_SCREEN_SCRIPT                            ; DO->SET AND FADE IN PALLETE, WAIT 2 SECONDS AND FADE OUT

NFC_DIVISIONAL_SCENE_SCRIPT:                                                                             ; 0X57 DRAW "NFC DIVISIONAL PLAYOFF" TEXT
	.DB $FD, <NFC_MATCHUP_SCREEN_TEXT_SCRIPT, >NFC_MATCHUP_SCREEN_TEXT_SCRIPT                            ; DO->CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "NFC" TEXT
	.DB $FD, <DIVISIONAL_TEXT_SCRIPT, >DIVISIONAL_TEXT_SCRIPT                                            ; DO->DRAW "DIVISIONAL" TEXT
	.DB $FD, <PLAYOFF_TEXT_SCRIPT, >PLAYOFF_TEXT_SCRIPT                                                  ; DO->DRAW "PLAYOFF" TEXT
	.DB $FC, <FADE_OUT_MATCHUP_SCREEN_SCRIPT, >FADE_OUT_MATCHUP_SCREEN_SCRIPT                            ; DO->SET AND FADE IN PALLETE, WAIT 2 SECONDS AND FADE OUT

AFC_CHAMPIONSHIP_SCENE_SCRIPT:                                                                           ; 0X58 DRAW "AFC CHAMPIONSHIP PLAYOFF" TEXT
	.DB $FD, <AFC_MATCHUP_SCREEN_TEXT_SCRIPT, >AFC_MATCHUP_SCREEN_TEXT_SCRIPT                            ; DO->CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "AFC" TEXT
	.DB $FD, <CHAMPIONSHIP_TEXT_SCRIPT, >CHAMPIONSHIP_TEXT_SCRIPT                                        ; DO->DRAW "CHAMPIONSHIP" TEXT
	.DB $FC, <FADE_OUT_MATCHUP_SCREEN_SCRIPT, >FADE_OUT_MATCHUP_SCREEN_SCRIPT                            ; DO->SET AND FADE IN PALLETE, WAIT 2 SECONDS AND FADE OUT

NFC_CHAMPIONSHIP_SCENE_SCRIPT:                                                                           ; 0X59 DRAW "NFC CHAMPIONSHIP PLAYOFF" TEXT
	.DB $FD, <NFC_MATCHUP_SCREEN_TEXT_SCRIPT, >NFC_MATCHUP_SCREEN_TEXT_SCRIPT                            ; DO->CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "NFC" TEXT
	.DB $FD, <CHAMPIONSHIP_TEXT_SCRIPT, >CHAMPIONSHIP_TEXT_SCRIPT                                        ; DO->DRAW "CHAMPIONSHIP" TEXT
	.DB $FC, <FADE_OUT_MATCHUP_SCREEN_SCRIPT, >FADE_OUT_MATCHUP_SCREEN_SCRIPT                            ; DO->SET AND FADE IN PALLETE, WAIT 2 SECONDS AND FADE OUT

SUPERBOWL_MATCHUP_SCREEN_SCENE_SCRIPT:                                                                   ; CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "SUPER BOWL" TEXT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $D0, $20, $1A                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $89, $A6                                                                                         ; SET PPU ADDR = $21A6
	.DB      "SUPER BOWL"                                                                                ;

FADE_OUT_MATCHUP_SCREEN_SCRIPT:                                                                          ; SET AND FADE IN PALLETE, WAIT 2 SECONDS AND FADE OUT
	.DB $E5, $00, $00                                                                                    ; SAVE BG AND SPR PAL TO BUFFER AND FADE IN (BG, SPR)
	.DB $FB, $78                                                                                         ; WAIT 120 FRAMES = 2 SECONDS
	.DB $E8                                                                                              ; END UPDATE PAL TASK AND FADE OUT BG AND SPR PALLETE
	.DB $FF                                                                                              ; RETURN

AFC_MATCHUP_SCREEN_TEXT_SCRIPT:                                                                          ; CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "AFC" TEXT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $D0, $20, $1A                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $89, $2D                                                                                         ; SET PPU ADDR = $212D
	.DB      "AFC"                                                                                       ; 
	.DB $FE                                                                                              ; RETURN

NFC_MATCHUP_SCREEN_TEXT_SCRIPT:                                                                          ; CLEAR NAMETABLES/SPRITES, SET TO LARGE LETTERS AND DRAW "NFC" TEXT
	.DB $CC                                                                                              ; CLEAR NAMETABLES AND SET SPRITES OFFSCREEN
	.DB $F6                                                                                              ; SET TEXT SIZE TO 16 X 16
	.DB $D0, $20, $1A                                                                                    ; SET IRQ 0 BACKGROUND CHR BANKS (CHR BANK 0, CHR BANK 1)
	.DB $89, $2D                                                                                         ; SET PPU ADDR = $212D
	.DB      "NFC"                                                                                       ;
	.DB $FE                                                                                              ; RETURN

FIRST_ROUND_TEXT_SCRIPT:                                                                                 ; DRAW "FIRST ROUND" TEXT
	.DB $89, $A5                                                                                         ; SET PPU ADDR = $21A5
	.DB      "FIRST-ROUND"                                                                               ;
	.DB $FE                                                                                              ; RETURN

DIVISIONAL_TEXT_SCRIPT:                                                                                  ; DRAW "DIVISIONAl" TEXT
	.DB $89, $A6                                                                                         ; SET PPU ADDR = $21A6
	.DB      "DIVISIONAL"                                                                                ;
	.DB $FE                                                                                              ; RETURN

CHAMPIONSHIP_TEXT_SCRIPT:                                                                                ; DRAW "CHAMPIONSHIP" TEXT 
	.DB $89, $A4                                                                                         ; SET PPU ADDR = $21A4
	.DB      "CHAMPIONSHIP"                                                                              ;
	.DB $FE                                                                                              ; RETURN

PLAYOFF_TEXT_SCRIPT:                                                                                     ; DRAW "PLAYOFF" TEXT
	.DB $8A, $29                                                                                         ; SET PPU ADDR = $2229
	.DB      "PLAYOFF"                                                                                   ;
	.DB $FE                                                                                              ; RETURN
	
_F}_PLAYOFF_ROUND_MATCHUP_TEXT_SCENE_SCRIPTS	

UNUSED_SEVEN_BANK8_SCREEN_SCRIPT:                                                                        ; UNUSED BROKEN SECTION FROM HERE TO END
	.DB $FF

_F{_PLAYOFF_BRACKET_HIGHLIGHTING_SCENE_SCRIPTS

AFC_WILDCARD_TWO_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $84, $EF
	.DB $01, $F5
	.DB $A1
	.DB $E4
	.DB $01, $EE
	.DB $FF

AFC_WILDCARD_TWO_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $E4
	.DB $01, $EE
	.DB $A1
	.DB $84, $EF
	.DB $01, $F7
	.DB $FF

NFC_WILDCARD_TWO_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $F4
	.DB $84, $EF
	.DB $A1
	.DB $01, $EE
	.DB $FF

NFC_WILDCARD_TWO_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $EE
	.DB $A1
	.DB $01, $F6
	.DB $84, $EF
	.DB $FF

AFC_WILDCARD_ONE_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $E4
	.DB $01, $EE
	.DB $A1
	.DB $84, $EF
	.DB $01, $F7
	.DB $FF

AFC_WILDCARD_ONE_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $84, $EF
	.DB $01, $F5
	.DB $A1
	.DB $E4
	.DB $01, $EE
	.DB $FF

NFC_WILDCARD_ONE_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $EE
	.DB $A1
	.DB $01, $F6
	.DB $84, $EF
	.DB $FF

NFC_WILDCARD_ONE_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $F4
	.DB $84, $EF
	.DB $A1
	.DB $01, $EE
	.DB $FF
	
AFC_DIVISIONAL_TWO_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT
	.DB $88, $EF
	.DB $01, $F5
	.DB $A1
	.DB $E8      
	.DB $01, $EE
	.DB $A1
	.DB $E8      
	.DB $01, $EE
	.DB $FF

AFC_DIVISIONAL_TWO_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $83, $EF
	.DB $01, $F7
	.DB $FF

NFC_DIVISIONAL_TWO_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $F4
	.DB $88, $EF
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $FF

NFC_DIVISIONAL_TWO_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $F6
	.DB $83, $EF
	.DB $FF

AFC_DIVISIONAL_ONE_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $E8
	.DB $01, $EE
	.DB $A1
	.DB $E8
	.DB $01, $EE
	.DB $A1
	.DB $88, $EF
	.DB $01, $F7
	.DB $FF

AFC_DIVISIONAL_ONE_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $83, $EF
	.DB $01, $F5
	.DB $A1
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $E3
	.DB $01, $EE
	.DB $FF

NFC_DIVISIONAL_ONE_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $F6
	.DB $88, $EF
	.DB $FF




NFC_DIVISIONAL_ONE_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $F4
	.DB $83, $EF
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $FF

AFC_CHAMPIONSHIP_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $83, $EF
	.DB $01, $F5
	.DB $A1
	.DB $C3
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $FF

AFC_CHAMPIONSHIP_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $E3
	.DB $01, $EE
	.DB $A1
	.DB $83, $EF
	.DB $01, $F7
	.DB $FF

NFC_CHAMPIONSHIP_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $F4
	.DB $83, $EF
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $FF

NFC_CHAMPIONSHIP_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $EE
	.DB $A1
	.DB $01, $F6
	.DB $83, $EF
	.DB $FF

SUPER_BOWL_HOME_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $85, $EF
	.DB $FF

SUPER_BOWL_AWAY_WIN_LINE_HIGHLIGHT_SCREEN_SCRIPT:
	.DB $85, $EF
	.DB $FF
	
_F}_PLAYOFF_BRACKET_HIGHLIGHTING_SCENE_SCRIPTS	

.PAD $C000, $FF