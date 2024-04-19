_F{_TEAM_IDS

;;;;;;;;;;;;;;;; TEAM IDS ;;;;;;;;;;;;;;;;;;

.ENUM $00
	BUF_TEAM_ID							.dsb 1
	IND_TEAM_ID							.dsb 1
	MIA_TEAM_ID							.dsb 1
	NE_TEAM_ID							.dsb 1
	NYJ_TEAM_ID							.dsb 1
	
	CIN_TEAM_ID							.dsb 1
	CLE_TEAM_ID							.dsb 1
	HOU_TEAM_ID							.dsb 1
	PIT_TEAM_ID							.dsb 1
	
	DEN_TEAM_ID							.dsb 1					
	KC_TEAM_ID							.dsb 1
	LAR_TEAM_ID							.dsb 1
	SD_TEAM_ID							.dsb 1
	SEA_TEAM_ID							.dsb 1
	
	WAS_TEAM_ID							.dsb 1
	NYG_TEAM_ID							.dsb 1
	PHI_TEAM_ID							.dsb 1
	PHX_TEAM_ID							.dsb 1
	DAL_TEAM_ID							.dsb 1
	
	CHI_TEAM_ID							.dsb 1
	DET_TEAM_ID							.dsb 1
	GB_TEAM_ID							.dsb 1
	MIN_TEAM_ID							.dsb 1
	TB_TEAM_ID							.dsb 1
	
	SF_TEAM_ID							.dsb 1
	LAM_TEAM_ID							.dsb 1
	NO_TEAM_ID							.dsb 1
	ATL_TEAM_ID							.dsb 1
	
	AFC_TEAM_ID							.dsb 1
	NFC_TEAM_ID							.dsb 1
.ENDE

_F}_TEAM_IDS

_F{_DIVISION_IDS

;;;;;;;;;;;;;;;; DIVISION IDS ;;;;;;;;;;;;;;;;;;
.ENUM $00
	AFCE_DIVISION_ID					.dsb 1
	AFCC_DIVISION_ID					.dsb 1
	AFCW_DIVISION_ID					.dsb 1
	NFCE_DIVISION_ID					.dsb 1
	NFCC_DIVISION_ID					.dsb 1
	NFCW_DIVISION_ID					.dsb 1	
.ENDE

_F}_DIVISION_IDS

_F{_LEAGUE_CONSTANTS

;;;;;;;;;;;;;;;; LEAGUE CONSTANTS ;;;;;;;;;;;;;;;;;;

NUMBER_OF_TEAMS_IN_EACH_CONFERENCE	    = $0E
NUMBER_OF_TEAMS_IN_LEAGUE		        = $1C
NUM_OF_PLAYOFF_TEAMS			        = $0C
NUMBER_OF_DIVISON_WINNERS		        = $06
PLAYOFF_TEAMS_PER_CONFERENCE	        = $06  
MAX_GAMES_PER_WEEK				        = $0E
LAST_WEEK_OF_SEASON				        = $10				; zero indexed = week 17
FIRST_WEEK_OF_PLAYOFFS			        = $11				; = week 18
WEEK_TO_CHECK_FOR_DIV_CHAMPION	        = $09

FIRST_TEAM_IN_AFC 						= BUF_TEAM_ID
FIRST_TEAM_IN_NFC 						= WAS_TEAM_ID 
NUMBER_OF_DIVISION_CHAMPS				= $03
NUMBER_OF_WILD_CARD_TEAMS				= $03
NUMBER_OF_TEAMS_TO_SORT_FOR_WILD_CARD	= NUMBER_OF_TEAMS_IN_EACH_CONFERENCE - NUMBER_OF_DIVISION_CHAMPS

AFCE_NUM_TEAMS						    = $05
AFCC_NUM_TEAMS						    = $04
AFCW_NUM_TEAMS						    = $05
NFCE_NUM_TEAMS						    = $05
NFCC_NUM_TEAMS						    = $05
NFCW_NUM_TEAMS						    = $04

_F}_LEAGUE_CONSTANTS

