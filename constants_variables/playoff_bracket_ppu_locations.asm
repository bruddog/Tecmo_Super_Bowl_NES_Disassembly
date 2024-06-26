
_F{_PLAYOFF_BRACKET_PPU_LOCATIONS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       PLAYOFF BRACKET LOCATIONS	           


;;;;;;;;; LINE LOCATIONS  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR	  	= $216E 
AFC_WILD_CARD_TWO_AWAY_LINE_PPU_ADDR	  	= AFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR + (3 * LENGTH_OF_ONE_ROW )	

AFC_WILD_CARD_ONE_HOME_LINE_PPU_ADDR	  	= AFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR + (11 * LENGTH_OF_ONE_ROW )
AFC_WILD_CARD_ONE_AWAY_LINE_PPU_ADDR	 	= AFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR + (8 * LENGTH_OF_ONE_ROW )


NFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR	  	= $256D 
NFC_WILD_CARD_TWO_AWAY_LINE_PPU_ADDR	  	= NFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR + (3 * LENGTH_OF_ONE_ROW )	

NFC_WILD_CARD_ONE_HOME_LINE_PPU_ADDR	 	= NFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR + (11 * LENGTH_OF_ONE_ROW )
NFC_WILD_CARD_ONE_AWAY_LINE_PPU_ADDR	  	= NFC_WILD_CARD_TWO_HOME_LINE_PPU_ADDR + (8 * LENGTH_OF_ONE_ROW )



AFC_DIVISIONAL_TWO_HOME_LINE_PPU_ADDR	  	= $20EE 
AFC_DIVISIONAL_TWO_AWAY_LINE_PPU_ADDR	  	= $2173

AFC_DIVISIONAL_ONE_HOME_LINE_PPU_ADDR	  	= AFC_DIVISIONAL_TWO_HOME_LINE_PPU_ADDR + (18 * LENGTH_OF_ONE_ROW )
AFC_DIVISIONAL_ONE_AWAY_LINE_PPU_ADDR	  	= AFC_DIVISIONAL_TWO_AWAY_LINE_PPU_ADDR + (10 * LENGTH_OF_ONE_ROW )


NFC_DIVISIONAL_TWO_HOME_LINE_PPU_ADDR	 	= $24E9 
NFC_DIVISIONAL_TWO_AWAY_LINE_PPU_ADDR	 	= $2569

NFC_DIVISIONAL_ONE_HOME_LINE_PPU_ADDR	  	= NFC_DIVISIONAL_TWO_HOME_LINE_PPU_ADDR + (18 * LENGTH_OF_ONE_ROW )
NFC_DIVISIONAL_ONE_AWAY_LINE_PPU_ADDR	  	= NFC_DIVISIONAL_TWO_AWAY_LINE_PPU_ADDR + (10 * LENGTH_OF_ONE_ROW )

AFC_CHAMP_HOME_LINE_PPU_ADDR	  			= $2157 
AFC_CHAMP_AWAY_LINE_PPU_ADDR	 			= AFC_CHAMP_HOME_LINE_PPU_ADDR + (8 * LENGTH_OF_ONE_ROW )

NFC_CHAMP_HOME_LINE_PPU_ADDR	  			= $2545 
NFC_CHAMP_AWAY_LINE_PPU_ADDR	 			= NFC_CHAMP_HOME_LINE_PPU_ADDR + (8 * LENGTH_OF_ONE_ROW )

SUPERBOWL_AFC_HOME_LINE_PPU_ADDR			= $223B
SUPERBOWL_NFC_HOME_LINE_PPU_ADDR			= $2620

;;;;;;;;; NAME LOCATIONS  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; FOUR ROWS BETWEEN EACH NAME 
AFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR	= $20E4 

AFC_WILD_CARD_TWO_HOME_TEAM_NAME_PPU_ADDR	= AFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (4 * LENGTH_OF_ONE_ROW )
AFC_WILD_CARD_TWO_AWAY_TEAM_NAME_PPU_ADDR	= AFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (8 * LENGTH_OF_ONE_ROW )

AFC_WILD_CARD_ONE_AWAY_TEAM_NAME_PPU_ADDR	= AFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (12 * LENGTH_OF_ONE_ROW) 
AFC_WILD_CARD_ONE_HOME_TEAM_NAME_PPU_ADDR	= AFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (16 * LENGTH_OF_ONE_ROW)

AFC_DIVISIONAL_ONE_HOME_TEAM_NAME_PPU_ADDR	= AFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (20 * LENGTH_OF_ONE_ROW )

;;;;;;;;; NFC	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR	= $24F2 

NFC_WILD_CARD_TWO_HOME_TEAM_NAME_PPU_ADDR	= NFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (4 * LENGTH_OF_ONE_ROW )
NFC_WILD_CARD_TWO_AWAY_TEAM_NAME_PPU_ADDR	= NFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (8 * LENGTH_OF_ONE_ROW )

NFC_WILD_CARD_ONE_AWAY_TEAM_NAME_PPU_ADDR	= NFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (12 * LENGTH_OF_ONE_ROW) 
NFC_WILD_CARD_ONE_HOME_TEAM_NAME_PPU_ADDR	= NFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (16 * LENGTH_OF_ONE_ROW )

NFC_DIVISIONAL_ONE_HOME_TEAM_NAME_PPU_ADDR	= NFC_DIVISIONAL_TWO_HOME_TEAM_NAME_PPU_ADDR + (20 * LENGTH_OF_ONE_ROW )





;;;;;;;;; SCORE LOCATIONS  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;; WILD CARD        ;;;;;;;;
AFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR	= $218F
AFC_WILD_CARD_TWO_AWAY_TEAM_SCORE_PPU_ADDR	= AFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR + (2  * LENGTH_OF_ONE_ROW )

AFC_WILD_CARD_ONE_HOME_TEAM_SCORE_PPU_ADDR	= AFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR + (10 * LENGTH_OF_ONE_ROW )
AFC_WILD_CARD_ONE_AWAY_TEAM_SCORE_PPU_ADDR	= AFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR + (8 * LENGTH_OF_ONE_ROW )

NFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR	= $258F
NFC_WILD_CARD_TWO_AWAY_TEAM_SCORE_PPU_ADDR	= NFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR + (2  * LENGTH_OF_ONE_ROW )

NFC_WILD_CARD_ONE_HOME_TEAM_SCORE_PPU_ADDR	= NFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR + (10 * LENGTH_OF_ONE_ROW )
NFC_WILD_CARD_ONE_AWAY_TEAM_SCORE_PPU_ADDR	= NFC_WILD_CARD_TWO_HOME_TEAM_SCORE_PPU_ADDR + (8 * LENGTH_OF_ONE_ROW )

;;;;;;;;; DIVISIONAL        ;;;;;;;;
AFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR	= $2114
AFC_DIVISIONAL_TWO_AWAY_TEAM_SCORE_PPU_ADDR	= AFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR + (4  * LENGTH_OF_ONE_ROW )

AFC_DIVISIONAL_ONE_HOME_TEAM_SCORE_PPU_ADDR	= AFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR + (18 * LENGTH_OF_ONE_ROW )
AFC_DIVISIONAL_ONE_AWAY_TEAM_SCORE_PPU_ADDR	= AFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR + (14 * LENGTH_OF_ONE_ROW )

NFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR	= $250A
NFC_DIVISIONAL_TWO_AWAY_TEAM_SCORE_PPU_ADDR	= NFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR + (4  * LENGTH_OF_ONE_ROW )

NFC_DIVISIONAL_ONE_HOME_TEAM_SCORE_PPU_ADDR	= NFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR + (18 * LENGTH_OF_ONE_ROW )
NFC_DIVISIONAL_ONE_AWAY_TEAM_SCORE_PPU_ADDR	= NFC_DIVISIONAL_TWO_HOME_TEAM_SCORE_PPU_ADDR + (14 * LENGTH_OF_ONE_ROW )


;;;;;;;;; CONF CHAMPIONSHIP        ;;;;;;;;
AFC_CHAMP_HOME_TEAM_SCORE_PPU_ADDR	= $2178
AFC_CHAMP_AWAY_TEAM_SCORE_PPU_ADDR	= AFC_CHAMP_HOME_TEAM_SCORE_PPU_ADDR + (12  * LENGTH_OF_ONE_ROW )

NFC_CHAMP_HOME_TEAM_SCORE_PPU_ADDR	= $2566
NFC_CHAMP_AWAY_TEAM_SCORE_PPU_ADDR	= NFC_CHAMP_HOME_TEAM_SCORE_PPU_ADDR + (12  * LENGTH_OF_ONE_ROW )

;;;;;;;;; SUPERBOWL        ;;;;;;;;
SUPERBOWL_AFC_TEAM_SCORE_PPU_ADDR	= $225C
SUPERBOWL_NFC_TEAM_SCORE_PPU_ADDR	= $2642

_F}_PLAYOFF_BRACKET_PPU_LOCATIONS








