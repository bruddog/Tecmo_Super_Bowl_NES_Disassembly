.BASE $A000
.ORG  $BC00

OFFSET_TO_TEAM_ABBR_POINTERS		= $0 

; lookup function multiplies by two so the offsets are divided by 2 
OFFSET_TO_TEAM_CITY_POINTERS 					= (TEAM_CITY_POINTERS - TEAM_ABBREVIATION_POINTERS)/2
OFFSET_TO_TEAM_MASCOT_POINTERS					= (TEAM_MASCOT_POINTERS - TEAM_ABBREVIATION_POINTERS)/2
OFFSET_TO_DOWN_TEXT_POINTERS					= (DOWN_NAME_TEXT_POINTERS - TEAM_ABBREVIATION_POINTERS)/2
OFFSET_TO_COIN_TOSS_CONTROL_TYPE_TEXT_POINTERS	= (COIN_TOSS_CONTROL_TYPE_TEXT_POINTERS - TEAM_ABBREVIATION_POINTERS)/2
								
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

DOWN_NAME_TEXT_POINTERS:							; DOWN NAME POINTERS
	.WORD FIRST
	.WORD SECOND
	.WORD THIRD
	.WORD FOURTH

CONTROL_TYPE_TEXT_POINTERS:							; COLORED TEAM CONTROL TYPE POINTERS
	.WORD MAN_CHOICE
	.WORD COACH_CHOICE
	.WORD COMPUTER_CHOICE
	.WORD SKIP_CHOICE

OFF_DEF_TEXT_POINTERS:								; RANKINGS TEXT POINTERS
	.WORD OFFENSE
	.WORD DEFENSE

DIVISION_LOC_TEXT_POINTERS:							; DIVISION NAME POINTERS
	.WORD EAST
	.WORD CENTRAL
	.WORD WEST

LEAGUE_AND_CONF_TEXT_POINTERS:						; LEAGUE AND CONFERENCE NAME POINTERS
	.WORD NFL
	.WORD AFC
	.WORD NFC

COIN_TOSS_CONTROL_TYPE_TEXT_POINTERS:	
	.WORD MAN_TEXT
	.WORD COACH_TEXT
	.WORD COMPUTER_TEXT
	.WORD SKIP_TEXT

	.WORD END_TEAM_INFO
	.WORD END_TEAM_INFO
	.WORD END_TEAM_INFO
	.WORD END_TEAM_INFO

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
	   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

DOWN_NAME_TEXT_DATA:							; START OF DOWN NAME TEXT

FIRST:		.DB "1ST"
SECOND:		.DB "2ND"
THIRD:		.DB "3RD"
FOURTH:		.DB "4TH"

CONTROL_TYPE_TEXT_DATA:							; START OF TEAM CONTROL TYPE TEXT use special tile ids 
MAN_CHOICE:		 .DB $D6, $D7, $B8				; "MAN"
COACH_CHOICE:	 .DB $D4, $D5, $D7				; "COA"
COMPUTER_CHOICE: .DB $D8, $D9, $DA				; "COM"
SKIP_CHOICE:	 .DB $DB, $DC, $DD  			; "SKP"

OFF_DEF_TEXT_DATA:

OFFENSE:		
	.DB "OFFENSE"
DEFENSE:		
	.DB "DEFENSE"

DIV_LOCATION_TEXT_DATA:							; START OF DIVISION NAME TEXT

EAST:			.DB "EAST"
CENTRAL:		.DB "CENTRAL"
WEST:			.DB "WEST"

CONFERENCE_TEXT_DATA:										; START OF CONFERENCE NAME TEXT
NFL:			.DB "NFL"
AFC:			.DB "AFC"
NFC:			.DB "NFC"

CONTROL_TYPE_COIN_TOSS_TEXT_DATA:							; START OF TEAM CONTROL (COIN TOSS SCREEN) TYPE TEXT 
MAN_TEXT:			.DB "MAN"	
COACH_TEXT:		    .DB "COA"
COMPUTER_TEXT:		.DB "COM"
SKIP_TEXT:			.DB "SKP"

END_TEAM_INFO:	.DB $FF
