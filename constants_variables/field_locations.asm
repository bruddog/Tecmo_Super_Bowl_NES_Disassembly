_F{_FIELD_LOCATION_CONSTANTS

;;;;;;; Y LOCATIONS ;;;;;;;;;;;;;;;;;;;;;;;
ONE_YARD                    =  $08
                                                                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TOP_OF_SCREEN		 	    =  $08	
TOP_OF_FIELD_Y       	    =  $10	
OUT_OF_BOUNDS_TOP_Y  	    =  $28
CENT_OF_FIELD_Y  	 	    =  $78											        ; different for actual ball y 
OUT_OF_BOUNDS_BOT_Y  	    =  $C8  
BOTTOM_OF_FIELD_Y    	    =  $F0
BOTTOM_OF_SCREEN	 	    =  $F8	

BALL_MIDDLE_OF_FIELD_Y      = CENT_OF_FIELD_Y + $08	                                ; Add one tile since ball is only one tile high vs players who are a two

TOP_HASH_Y                  =  $80					                                ; these are actually out of bounds
MID_HASH_Y                  =  $88
BOT_HASH_Y                  =  $90 

                                                                                    ;;;;;;; X LOCATIONS ;;;;;;;;;;;;;;;;;;;;;;;                                                                                   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BACK_LEFT_ENDZONE           =  $0620                                                ; actually one yard in front
FRONT_LEFT_ENDZONE          =  $0670                                                ; 

P1_TWENTY_YARDLINE	        = $0710
P2_TWENTY_YARDLINE	        = $08F0

YARDS_TO_2nd_DOWN_MARKER	= $50	  					                            ; 10 yards

BACK_RIGHT_ENDZONE          = $09E0                                                 ; actually one yard in front
FRONT_RIGHT_ENDZONE         = $0990

P1_XP_LOS_LOC               = $0980                                                 ; 2 yards from endzone

LEFT_MOST_SCROLL_FIELD_MAP  = $05E8
RIGHT_MOST_SCROLL_FIELD_MAP = $0918

_F}_FIELD_LOCATION_CONSTANTS
