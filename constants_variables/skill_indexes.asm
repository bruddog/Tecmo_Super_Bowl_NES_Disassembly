
_F{_SKILL_INDEXES

;;;;;;;;;;;;;;;;;; SKILL INDEXES  ;;;;;;;;;;;;;;;;;;
;; ** FACE STORED IN NIBBLES 4 AND 5 or 3rd byte 
;; hence why skill index skips from 83 to 86 
;;; All

PLAYER_FACE_INDEX		= $02 

RUSHING_POWER_INDEX 	= $80
RUNNING_SPEED_INDEX 	= $81
MAX_SPEED_INDEX 		= $82
HITTING_POWER_INDEX 	= $83


;;;QB ONLY
PASSING_SPEED_INDEX		= $86
PASS_CONTROL_INDEX		= $87
PASSING_ABILITY_INDEX	= $88
AVOID_PASS_BLOCK_INDEX	= $89

;;;SKILL ONLY
BALL_CONTROL_INDEX		= $86
RECEPTION_INDEX			= $87

;;;DEFENDER ONLY
INTERCEPTION_INDEX		= $86
QUICKNESS_INDEX			= $87


;;;KICKER ONLY
KICKING_ABILITY_INDEX	= $86
AVOID_KICK_BLOCK_INDEX	= $87

;;;PUNTER ONLY
PUNTING_ABILITY_INDEX	= $86
AVOID_KICK_BLOCK_INDEX	= $87

_F}_SKILL_INDEXES