								; ROM LOCATION 0X3A010
.BASE $A000
.ORG  $A000

_F{_SACK_SONG_DATA						; DONE	

SACK_SONG_CH_DATA_POINTERS:							; SACK MUSIC CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD SACK_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD SACK_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD SACK_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD SACK_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDRESSES

SACK_SONG_SQ_0_CH_DATA:							; SACK MUSIC SQAURE 0 DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $FF             				; END 

SACK_SONG_SQ_1_CH_DATA:							; SACK MUSIC SQUARE 1 DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1B             				; B2
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $24             				; E3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $22             				; D3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $FF             				; END

SACK_SONG_TRI_CH_DATA:							; SACK MUSIC TRI CH DATA
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $34             				; E4
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $FF             				; END

SACK_SONG_NOISE_CH_DATA:							; SACK MUSIC NOISE AND DRUM DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $FF             				; END

_F}_SACK_SONG_DATA	

_F{_FUMBLE_SONG_DATA					; DONE

FUMBLE_SONG_CH_DATA_POINTERS:							; FUMBLE MUSIC POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD FUMBLE_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD FUMBLE_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             					; TRI MUSIC
	.WORD FUMBLE_SONG_TRI_CH_DATA             			; *** uneeded reference
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD FUMBLE_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDRESSES

FUMBLE_SONG_SQ_0_CH_DATA:							; FUMBLE MUSIC SQ 0 DATA
	.DB $E0,$3A             			; SET VOLUME ENVELOPE INDEX = 58
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00             			; SET VOLUME LEVEL TO 100%
	.DB $E9             				; DO SECTION = FUMBLE MUSIC SQAURE CHANNEL SECTION
	.WORD FUMBLE_SONG_COMMON_SQ_CH_DATA ;
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $FF             				; END OF CHANNEL
	
FUMBLE_SONG_SQ_1_CH_DATA:				; FUMBLE MUSIC SQ 1 DATA
	.DB $E0,$3A             			; SET VOLUME ENVELOPE INDEX = 58
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO SECTION = FUMBLE MUSIC SQAURE CHANNEL SECTION
	.WORD FUMBLE_SONG_COMMON_SQ_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL 

FUMBLE_SONG_COMMON_SQ_CH_DATA:			; FUMBLE MUSIC SQAURE CHANNEL SECTION
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $37             				; G4
	.DB $30             				; C4
	.DB $36             				; F#4
	.DB $2B             				; B3
	.DB $35             				; F4
	.DB $2A             				; A#3
	.DB $34             				; E4
	.DB $29             				; A3
	.DB $33             				; D#4
	.DB $28             				; G#3
	.DB $32             				; D4
	.DB $27             				; G3
	.DB $31             				; C#4
	.DB $26             				; F#3
	.DB $30             				; C4
	.DB $25             				; F3
	.DB $2B             				; B3
	.DB $24             				; E3
	.DB $2A             				; A#3
	.DB $23             				; D#3
	.DB $29             				; A3
	.DB $22             				; D3
	.DB $28             				; G#3
	.DB $21             				; C#3
	.DB $27             				; G3
	.DB $20             				; C3
	.DB $28             				; G#3
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $31             				; C#4
	.DB $32             				; D4
	.DB $EA             				; RETURN 

FUMBLE_SONG_TRI_CH_DATA:				; FUMBLE MUSIC TRI DATA *** uneeded
	.DB $FF             				; END OF CHANNEL /TURN OFF CHANNEL

FUMBLE_SONG_NOISE_CH_DATA:							; FUMBLE MUSIC NOISE CHANNEL DATA
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $9F             				; SET NOTE LENGTH TO: 2 1/4
	.DB $0C             				; REST
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $95             				; SET NOTE LENGTH TO: 15/16
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $B0             				; SET NOTE LENGTH TO: 8
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$0C             			; SET VOLUME LEVEL TO 20%
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$0D             			; SET VOLUME LEVEL TO 14%
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $E3,$0E             			; SET VOLUME LEVEL TO 7%
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $FF             				; END 

_F}_FUMBLE_SONG_DATA

_F{_P1_PRO_BOWL_SONG_DATA				; DONE

P1_PROBOWL_SONG_CH_DATA_POINTERS:		; 0X3C P1 PRO BOWL SONG POINTERS
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD P1_PROBOWL_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P1_PROBOWL_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD P1_PROBOWL_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD P1_PROBOWL_SONG_NOISE_CH_DATA             			;
	
	.DB $FF             				; END

P1_PROBOWL_SONG_TRI_CH_DATA:							; P1 PRO BOWL SONG TRIANGLE CHANNEL DATA
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $E9             				; DO SECTION AT = C TO G FAST SLIDE DOWN
	.WORD C_TO_G_SLIDE_P1_PROBOWL             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $E9             				; DO SECTION AT = C TO G FAST SLIDE DOWN
	.WORD C_TO_G_SLIDE_P1_PROBOWL             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $E9             				; DO SECTION AT = C TO G FAST SLIDE DOWN
	.WORD C_TO_G_SLIDE_P1_PROBOWL             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $0C             				; REST
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $0C             				; REST
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $0C             				; REST
	.DB $E9              				; DO SECTION AT = C TO G FAST SLIDE DOWN
	.WORD C_TO_G_SLIDE_P1_PROBOWL       ;
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $EC             				; CHECK FOR END OF LOOP
	

P1_PROBOWL_TRI_CH_LOOP:					; P1 PRO BOWL SONG TRIANGLE LOOP	
     .DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $24             				; E3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $24             				; E3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $1B             				; B2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $1B             				; B2
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $1B             				; B2
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $E9             				; DO SECTION AT = A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $E9             				; DO SECTION AT= A TO D FAST SLIDE DOWN
	.WORD A_TO_D_SLIDE_P1_PROBOWL       ;
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $E9             				; DO SECTION AT = C TO G FAST SLIDE DOWN
	.WORD C_TO_G_SLIDE_P1_PROBOWL       ;
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $E8             				; JUMP-> P1 PRO BOWL SONG TRIANGLE LOOP
	.WORD P1_PROBOWL_TRI_CH_LOOP        ;

C_TO_G_SLIDE_P1_PROBOWL:				; C TO G FAST SLIDE DOWN
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $EA             				; RETURN 

A_TO_D_SLIDE_P1_PROBOWL:							; A TO D FAST SLIDE DOWN
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $0C             				; REST
	.DB $EA             				; RETURN

P1_PROBOWL_SONG_SQ_0_CH_DATA:			; P1 PRO BOWL SONG SQ 0 CHANNEL DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $14             				; E2
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $17             				; G2
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $19             				; A2
	.DB $17             				; G2
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $14             				; E2
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $14             				; E2
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $13             				; D#2
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	
P1_PROBOWL_SQ_0_CH_LOOP:				; P1 PRO BOWL SONG SQ 0 LOOP
    .DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $25             				; F3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $19             				; A2
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $19             				; A2
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $26             				; F#3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $29             				; A3
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $26             				; F#3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $24             				; E3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $25             				; F3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $19             				; A2
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $19             				; A2
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $26             				; F#3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $29             				; A3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $32             				; D4
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $26             				; F#3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $30             				; C4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $2B             				; B3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $28             				; G#3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $29             				; A3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $30             				; C4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $2B             				; B3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $22             				; D3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $32             				; D4
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $39             				; A4
	.DB $3A             				; A#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $3B             				; B4
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $39             				; A4
	.DB $3A             				; A#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON NOTE WAVERING USING WAVER TYPE: 8
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $3B             				; B4
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $3B             				; B4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $39             				; A4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $38             				; G#4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $36             				; F#4
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $33             				; D#4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $29             				; A3
	.DB $E8             				; JUMP -> P1 PRO BOWL SONG SQ 0 LOOP
	.WORD P1_PROBOWL_SQ_0_CH_LOOP       ;

P1_PROBOWL_SONG_SQ_1_CH_DATA:			; P1 PRO BOWL SONG SQ 1 DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $04             				; E1
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $07             				; G1
	.DB $12             				; D2
	.DB $10             				; C2
	.DB $0B             				; B1
	.DB $09             				; A1
	.DB $07             				; G1
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $04             				; E1
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $04             				; E1
	.DB $07             				; G1
	.DB $04             				; E1
	.DB $02             				; D1
	.DB $02             				; D1
	.DB $03             				; D#1
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	
P1_PROBOWL_SQ_1_CH_LOOP:									; P1 PRO BOWL SONG SQ 1 LOOP
    .DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $12             				; D2
	.DB $13             				; D#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $14             				; E2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $14             				; E2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $1A             				; A#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $1B             				; B2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $17             				; G2
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $10             				; C2
	.DB $11             				; C#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $12             				; D2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $12             				; D2
	.DB $16             				; F#2
	.DB $12             				; D2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $1A             				; A#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $1B             				; B2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $17             				; G2
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0A             				; A#1
	.DB $0B             				; B1
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $10             				; C2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $10             				; C2
	.DB $14             				; E2
	.DB $10             				; C2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $17             				; G2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $16             				; F#2
	.DB $14             				; E2
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $09             				; A1
	.DB $0A             				; A#1
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $0B             				; B1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0B             				; B1
	.DB $13             				; D#2
	.DB $0B             				; B1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $17             				; G2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $16             				; F#2
	.DB $13             				; D#2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $09             				; A1
	.DB $0A             				; A#1
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $0B             				; B1
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0B             				; B1
	.DB $10             				; C2
	.DB $10             				; C2
	.DB $11             				; C#2
	.DB $11             				; C#2
	.DB $12             				; D2
	.DB $E8             				; JUMP->P1 PRO BOWL SONG SQ 1 LOOP
	.WORD P1_PROBOWL_SQ_1_CH_LOOP       ;

P1_PROBOWL_SONG_NOISE_CH_DATA:			; P1 PRO BOWL SONG NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 2
	.WORD P1_PROBOWL_NOISE_SECTION_TWO             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22Hz
	.DB $69             				; SET NOISE FREQ = 7043 HZ/ 22Hz
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $66           					; SET NOISE FREQ = 13.9 kHZ/ 56Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE  ;
	.DB $EC             				; CHECK FOR END OF LOOP
	
P1_PROBOWL_NOISE_CH_LOOP:							        ; P1 PRO BOWL SONG NOISE CH LOOP
    .DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 2
	.WORD P1_PROBOWL_NOISE_SECTION_TWO             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO SECTION AT
	.WORD P1_PROBOWL_NOISE_SECTION_TWO             			;
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 2
	.WORD P1_PROBOWL_NOISE_SECTION_TWO             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 2
	.WORD P1_PROBOWL_NOISE_SECTION_TWO             			;
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE             			;
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $69             				; SET NOISE FREQ = 7043 HZ/ 22Hz
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $66           				; SET NOISE FREQ = 13.9 kHZ/ 56Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 1
	.WORD P1_PROBOWL_NOISE_SECTION_ONE  ;
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO SECTION = PERCUSSION SOUND 2
	.WORD P1_PROBOWL_NOISE_SECTION_TWO  ;
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $E8             				; JUMP -> P1 PRO BOWL SONG NOISE CH LOOP
	.WORD P1_PROBOWL_NOISE_CH_LOOP      ;

P1_PROBOWL_NOISE_SECTION_ONE:			;	PERCUSSION SOUND 1
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $69             				; SET NOISE FREQ = 7043 HZ/ 22Hz
	.DB $66           					; SET NOISE FREQ = 13.9 kHZ/ 56Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64            					; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $EA             				; RETURN 

P1_PROBOWL_NOISE_SECTION_TWO:									; PERCUSSION SOUND 2
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 2hZ
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $EA             				; RETURN 
	
_F}_P1_PRO_BOWL_SONG_DATA	

_F{_INTRO_PT_TWO_SONG_DATA				; DONE

INTRO_SONG_PART_TWO_CH_DATA_POINTERS:	; 0X3A INTRO SONG CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD INTRO_SONG_PART_TWO_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD INTRO_SONG_PART_TWO_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD INTRO_SONG_PART_TWO_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD INTRO_SONG_PART_TWO_NOISE_CH_DATA             			;
	.DB $FF             				; END

INTRO_SONG_PART_TWO_SQ_0_CH_DATA:							; INTRO SONG SQUARE 0 DATA
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $37             				; G4
	.DB $34             				; E4
	
INTRO_SONG_SQ_CH_FADE_OUT:							; INTRO SONG SQUARE FADE OUT 
    .DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $E3,$0D             			; SET VOLUME LEVEL TO 14%
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $E3,$0E             			; SET VOLUME LEVEL TO 7%
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $FF             				; END OF CHANNEL 

INTRO_SONG_PART_TWO_SQ_1_CH_DATA:							; INTRO SONG SQUARE 1 DATA
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0D             			; SET VOLUME LEVEL TO 14%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $A4             				; SET NOTE LENGTH TO: 3 1/2
	.DB $20             				; C3
	.DB $E3,$0C             			; SET VOLUME LEVEL TO 20%
	.DB $20             				; C3
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $20             				; C3
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $20             				; C3
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $E8             				; JUMP -> INTRO SONG SQUARE FADE OUT
	.WORD INTRO_SONG_SQ_CH_FADE_OUT     ;

INTRO_SONG_PART_TWO_TRI_CH_DATA:		; INTRO SONG TRI CH DATA
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $A4             				; SET NOTE LENGTH TO: 3 1/2
	.DB $0C             				; REST
	.DB $0C             				; REST
	
	.DB $EB,$10             			; START LOOP AND LOOP 16 TIMES
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $FF             				; END OF CHANNEL 

INTRO_SONG_PART_TWO_NOISE_CH_DATA:									 ; INTRO SONG NOISE CH DATA
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $A4             				; SET NOTE LENGTH TO: 3 1/2
	.DB $0C             				; REST
	.DB $0C             				; REST

	.DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ

	.DB $EB,$05             			; START LOOP AND LOOP 5 TIMES
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL 
	
_F}_INTRO_PT_TWO_SONG_DATA		

_F{_CHANGE_SIDE_SONG_DATA				; DONE

CHANGE_SIDE_SONG_CH_DATA_POINTERS:		; 0X25 CHANGE SIDE MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD CHANGE_SIDE_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD CHANGE_SIDE_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD CHANGE_SIDE_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD CHANGE_SIDE_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

CHANGE_SIDE_SONG_SQ_0_CH_DATA:							; SIDE CHANGE SQ 0 DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	
CHANGE_SIDE_SONG_SQ_AND_TRI_CH_DATA:	; SIDE CHG SQ 0 AND TRI NOTE START	
    .DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1A             				; A#2
	.DB $1B             				; B2
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $20             				; C3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $20             				; C3
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $20             				; C3
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$06             			; TURN ON NOTE WAVERING USING WAVER TYPE: 6
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $2B             				; B3
	.DB $EF             				; TURN OFF NOTE WAVERING

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $ED,$06             			; TURN ON NOTE WAVERING USING WAVER TYPE: 6
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $FF             				; END OF CHANNEL 

CHANGE_SIDE_SONG_SQ_1_CH_DATA:							; SIDE CHANGE SQ 1 DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $17             				; G2
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $17             				; G2
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $17             				; G2
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $26             				; F#3
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $27             				; G3
	.DB $ED,$06             			; TURN ON NOTE WAVERING USING WAVER TYPE: 6
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $27             				; G3
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $27             				; G3
	.DB $ED,$06             			; TURN ON NOTE WAVERING USING WAVER TYPE: 6
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $FF             				; END OF CHANNEL 

CHANGE_SIDE_SONG_TRI_CH_DATA:			; SIDE CHANGE TRI DATA
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E8             				; JUMP -> SIDE CHG SQ 0 AND TRI NOTE START	
	.WORD CHANGE_SIDE_SONG_SQ_AND_TRI_CH_DATA             			;

CHANGE_SIDE_SONG_NOISE_CH_DATA:							; SIDE CHANGE NOISE DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8A             				; SET NOTE LENGTH TO: 5/16

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL

_F}_CHANGE_SIDE_SONG_DATA

_F{_P1_FIRST_DOWN_SONG_DATA				; DONE

P1_FIRST_DOWN_SONG_CH_DATA_POINTERS:							; 0X26 P1 FIRST DOWN MUSIC
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD P1_FIRST_DOWN_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P1_FIRST_DOWN_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD P1_FIRST_DOWN_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD P1_FIRST_DOWN_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

P1_FIRST_DOWN_SONG_SQ_0_CH_DATA:							; P1 FIRST DOWN SQ0 DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $E0,$0A             			; SET VOLUME ENVELOPE INDEX = 10
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $34             				; E4
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $34             				; E4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $34             				; E4
	.DB $FF             				; END OF CHANNEL 

P1_FIRST_DOWN_SONG_SQ_1_CH_DATA:							; P1 FIRST DOWN SQ1 DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $E0,$0A             			; SET VOLUME ENVELOPE INDEX = 10
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $27             				; G3
	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $30             				; C4
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $FF             				; END OF CHANNEL 

P1_FIRST_DOWN_SONG_TRI_CH_DATA:							; P1 FIRST DOWN TRI DATA
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $0C             				; REST

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $24             				; E3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $24             				; E3
	.DB $FF             				; END OF CHANNEL 

P1_FIRST_DOWN_SONG_NOISE_CH_DATA:							; P1 FIRST DOWN NOISE DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END OF CHANNEL 
	
_F}_P1_FIRST_DOWN_SONG_DATA	

_F{_P2_FIRST_DOWN_SONG_DATA				; DONE

P2_FIRST_DOWN_SONG_CH_DATA_POINTERS:							; 0X27 P2 FIRST DOWN MUSIC
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD P2_FIRST_DOWN_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P2_FIRST_DOWN_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD P2_FIRST_DOWN_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD P2_FIRST_DOWN_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

P2_FIRST_DOWN_SONG_SQ_0_CH_DATA:							; P2 FIRST DOWN SQ0 DATA
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $35             				; F4
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $25             				; F3
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $35             				; F4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $35             				; F4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $35             				; F4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $0C             				; REST
	.DB $33             				; D#4
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $23             				; D#3
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $33             				; D#4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $33             				; D#4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $33             				; D#4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $33             				; D#4
	.DB $33             				; D#4
	.DB $0C             				; REST
	.DB $36             				; F#4
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $26             				; F#3
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $35             				; F4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $36             				; F#4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $35             				; F4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $35             				; F4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $36             				; F#4
	.DB $35             				; F4
	.DB $FF             				; END OF CHANNEL 

P2_FIRST_DOWN_SONG_SQ_1_CH_DATA:							; P2 FIRST DOWN SQ1 DATA
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $31             				; C#4
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $11             				; C#2
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $31             				; C#4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $31             				; C#4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $31             				; C#4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $31             				; C#4
	.DB $31             				; C#4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $11             				; C#2
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $31             				; C#4
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $11             				; C#2
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $31             				; C#4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $31             				; C#4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $31             				; C#4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $31             				; C#4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $31             				; C#4
	.DB $31             				; C#4
	.DB $FF             				; END OF CHANNEL 

P2_FIRST_DOWN_SONG_TRI_CH_DATA:							; P2 FIRST DOWN TRI DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $21             				; C#3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $31             				; C#4
	.DB $0C             				; REST
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $21             				; C#3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $28             				; G#3
	.DB $31             				; C#4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $28             				; G#3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $21             				; C#3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $31             				; C#4
	.DB $0C             				; REST
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $21             				; C#3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $28             				; G#3
	.DB $31             				; C#4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $21             				; C#3
	.DB $FF             				; END OF CHANNEL 

P2_FIRST_DOWN_SONG_NOISE_CH_DATA:		; P2 FIRST DOWN NOISE DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E9             				; DO SECTION -> P2 FIRST DOWN DRUM SECTION
	.WORD P2_FIRST_DOWN_DRUM_SECTION    ;
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $E9             				; DO SECTION -> P2 FIRST DOWN DRUM SECTION
	.WORD P2_FIRST_DOWN_DRUM_SECTION    ;
	.DB $FD             				; PLAY DMC 'DRUM SAMPLE 4' 
	.DB $0C             				; REST
	.DB $FD             				; PLAY DMC 'DRUM SAMPLE 4' 
	.DB $0C             				; REST
	.DB $E9             				; DO SECTION -> P2 FIRST DOWN DRUM SECTION
	.WORD P2_FIRST_DOWN_DRUM_SECTION             			;
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END OF CHANNEL 

P2_FIRST_DOWN_DRUM_SECTION:				; P2 FIRST DOWN DRUM SECTION
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EA             				; RETURN 
	
_F}_P2_FIRST_DOWN_SONG_DATA	

_F{_MADE_FG_SONG_DATA					; DONE

MADE_FG_SONG_CH_DATA_POINTERS:							; 0X28 MADE FG MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD MADE_FG_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD MADE_FG_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD MADE_FG_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD MADE_FG_SONG_NOISE_CH_DATA             			;
	
	.DB $FF             				; END OF CHANNEL ADDR

MADE_FG_SONG_SQ_0_CH_DATA:							; MADE FG SQ 0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $35             				; F4
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $37             				; G4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	
END_OF_MADE_FG_SQ_CH_DATA:				; END OF MADE FG SQ DATA
    .DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $3B             				; B4
	.DB $40             				; C5
	.DB $40             				; C5
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $3B             				; B4
	.DB $3A             				; A#4
	.DB $39             				; A4
	.DB $38             				; G#4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $FF             				; END OF CHANNEL
 
MADE_FG_SONG_SQ_1_CH_DATA:							; MADE FG SQ 1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $27             				; G3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E8             				; JUMP-> END OF MADE FG SQ DATA
	.WORD END_OF_MADE_FG_SQ_CH_DATA             			;

MADE_FG_SONG_TRI_CH_DATA:							; MADE FG TRI CH DATA
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $35             				; F4
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $37             				; G4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $3B             				; B4
	.DB $40             				; C5
	.DB $40             				; C5
	.DB $FF             				; END OF CHANNEL 

MADE_FG_SONG_NOISE_CH_DATA:							; MADE FG NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $01             				; C#1
	.DB $01             				; C#1
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $01             				; C#1
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $01             				; C#1
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $01             				; C#1
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $01             				; C#1
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END OF CHANNEL 

_F}_MADE_FG_SONG_DATA

_F{_MISSED_FG_SONG_DATA					; DONE

MISSED_FG_SONG_CH_DATA_POINTERS:							; MISSED FG MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD MISSED_FG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD MISSED_FG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD MISSED_FG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD MISSED_FG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

MISSED_FG_SQ_0_CH_DATA:							; MISSED FG SQ 0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	
MISSED_FG_SQ_AND_TRI_CH_DATA:			; MISSED FG NOTE START SQ0,SQ1,TRI
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $32             				; D4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $31             				; C#4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $2A             				; A#3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $2A             				; A#3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $35             				; F4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $FF             				; END OF CHANNEL 

MISSED_FG_SQ_1_CH_DATA:							; MISSED FG SQ 1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $E5,$02             			; ADJUST PITCH by: 2
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> MISSED FG NOTE START SQ0,SQ1,TRI
	.WORD MISSED_FG_SQ_AND_TRI_CH_DATA             			;

MISSED_FG_TRI_CH_DATA:							; MISSED FG TRI CH DATA
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E8             				; JUMP-> MISSED FG NOTE START SQ0,SQ1,TRI
	.WORD MISSED_FG_SQ_AND_TRI_CH_DATA             			;

MISSED_FG_NOISE_CH_DATA:				; MISSED FG NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END OF CHANNEL 

_F}_MISSED_FG_SONG_DATA

_F{_TOUCHBACK_SONG_DATA					; DONE

TOUCHBACK_SONG_CH_DATA_POINTERS:							; 0X23 TOUCHBACK MUSIC CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD TOUCHBACK_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD TOUCHBACK_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD TOUCHBACK_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD TOUCHBACK_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDRESSES

TOUCHBACK_SONG_SQ_0_CH_DATA:							; TOUCHBACK SQ0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	
TOUCHBACK_SONG_SQ_AND_TRI_CH_DATA:							; TOUCHBACK NOTE START SQ0,SQ1,TRI
    .DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $33             				; D#4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $30             				; C4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2A             				; A#3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $2A             				; A#3
	.DB $27             				; G3
	.DB $23             				; D#3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $22             				; D3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $23             				; D#3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $25             				; F3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $26             				; F#3
	.DB $29             				; A3
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $2A             				; A#3
	.DB $FF             				; END OF CHANNEL 

TOUCHBACK_SONG_SQ_1_CH_DATA:							; TOUCHBACK SQ1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> TOUCHBACK NOTE START SQ0,SQ1,TRI
	.WORD TOUCHBACK_SONG_SQ_AND_TRI_CH_DATA             			;

TOUCHBACK_SONG_TRI_CH_DATA:							; TOUCHBACK TRI CH DATA
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E8             				; JUMP-> TOUCHBACK NOTE START SQ0,SQ1,TRI
	.WORD TOUCHBACK_SONG_SQ_AND_TRI_CH_DATA             			;

TOUCHBACK_SONG_NOISE_CH_DATA:							; TOUCHBACK NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END OF CHANNEL 

_F}_TOUCHBACK_SONG_DATA

_F{_RUSHING_TD_SONG_DATA				; DONE

RUSHING_TD_SONG_CH_DATA_POINTERS:							; 0X21 RUSHING TD MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD RUSH_TD_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD RUSH_TD_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD RUSH_TD_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD RUSH_TD_SONG_NOISE_CH_DATA             			;
	
	.DB $FF             				; END OF CHANNEL ADDR

RUSH_TD_SONG_SQ_0_CH_DATA:							; RUSHING TD SQ0 CH DATA
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $0C             				; REST

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$3D             			; SET VOLUME ENVELOPE INDEX = 61
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $30             				; C4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $30             				; C4
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $E0,$10             			; SET VOLUME ENVELOPE INDEX = 16
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $35             				; F4
	.DB $E0,$10             			; SET VOLUME ENVELOPE INDEX = 16
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $E0,$30             			; SET VOLUME ENVELOPE INDEX = 48
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $32             				; D4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $E0,$12             			; SET VOLUME ENVELOPE INDEX = 18
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $37             				; G4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E0,$14             			; SET VOLUME ENVELOPE INDEX = 20
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $3B             				; B4
	.DB $3A             				; A#4
	.DB $3B             				; B4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$07             			; TURN ON NOTE WAVERING USING WAVER TYPE: 7
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $40             				; C5
	.DB $FF             				; END OF CHANNEL 

RUSH_TD_SONG_SQ_1_CH_DATA:							; RUSHING TD SQ1 CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $0C             				; REST
	.DB $E0,$3D             			; SET VOLUME ENVELOPE INDEX = 61
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $27             				; G3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $25             				; F3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $27             				; G3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $25             				; F3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$10             			; SET VOLUME ENVELOPE INDEX = 16
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $E0,$30             			; SET VOLUME ENVELOPE INDEX = 48
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $E0,$00             			; SET VOLUME ENVELOPE INDEX = 0
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $2B             				; B3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2B             				; B3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $2B             				; B3
	.DB $E0,$12             			; SET VOLUME ENVELOPE INDEX = 18
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E0,$14             			; SET VOLUME ENVELOPE INDEX = 20
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$06             			; TURN ON NOTE WAVERING USING WAVER TYPE: 6
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $27             				; G3
	.DB $FF             				; END OF CHANNEL 

RUSH_TD_SONG_TRI_CH_DATA:							; RUSHING TD TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $0C             				; REST

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $E0,$42             			; SET VOLUME ENVELOPE INDEX = 66
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $24             				; E3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $24             				; E3
	.DB $E0,$42             			; SET VOLUME ENVELOPE INDEX = 66
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $25             				; F3
	.DB $E0,$42             			; SET VOLUME ENVELOPE INDEX = 66
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$42             			; SET VOLUME ENVELOPE INDEX = 66
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $22             				; D3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $E0,$48             			; SET VOLUME ENVELOPE INDEX = 72
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $2B             				; B3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $30             				; C4
	.DB $FF             				; END OF CHANNEL 

RUSH_TD_SONG_NOISE_CH_DATA:							; RUSHING TD NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EB,$08             			; START LOOP AND LOOP 8 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $0C             				; REST
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $0C             				; REST
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END OF CHANNEL 
	
_F}_RUSHING_TD_SONG_DATA

_F{_SAFETY_SONG_DATA					; DONE

SAFETY_SONG_CH_DATA_POINTERS:							; 0X22 SAFETY MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD SAFETY_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD SAFETY_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD SAFETY_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD SAFETY_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

SAFETY_SONG_SQ_0_CH_DATA:							; SAFETY SQ0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	
SAFETY_SONG_SQ_CH_DATA:							; SAFETY SQ0, SQ1 NOTE START 
     .DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $26             				; F#3
	.DB $2A             				; A#3
	.DB $31             				; C#4
	.DB $35             				; F4
	.DB $28             				; G#3
	.DB $30             				; C4
	.DB $33             				; D#4
	.DB $36             				; F#4
	.DB $2A             				; A#3
	.DB $31             				; C#4
	.DB $35             				; F4
	.DB $38             				; G#4
	.DB $36             				; F#4
	.DB $35             				; F4
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $31             				; C#4
	.DB $FF             				; END OF CHANNEL 

SAFETY_SONG_SQ_1_CH_DATA:							; SAFETY SQ1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> SAFETY SQ0, SQ1 NOTE START
	.WORD SAFETY_SONG_SQ_CH_DATA             			;

SAFETY_SONG_TRI_CH_DATA:							; SAFETY TRI CH DATA
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $23             				; D#3
	.DB $23             				; D#3
	.DB $23             				; D#3
	.DB $23             				; D#3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $26             				; F#3
	.DB $26             				; F#3
	.DB $26             				; F#3
	.DB $28             				; G#3
	.DB $28             				; G#3
	.DB $2A             				; A#3
	.DB $31             				; C#4
	.DB $FF             				; END OF CHANNEL 

SAFETY_SONG_NOISE_CH_DATA:							; SAFETY NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FF             				; END OF CHANNEL 

_F}_SAFETY_SONG_DATA	

_F{_INTERCEPTION_SONG_DATA				; DONE

INTERCEPTION_SONG_CH_DATA_POINTERS:							; 0X24 INTERCEPTION MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD INTERCEPTION_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD INTERCEPTION_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD INTERCEPTION_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD INTERCEPTION_SONG_NOISE_CH_DATA             			;
	
	.DB $FF             				; END OF CHANNEL ADDRESSES

INTERCEPTION_SONG_SQ_0_CH_DATA:							; INTERCEPTION SQ0 CH DATA
	.DB $E1             				; SET INTERCEPTION MUSIC PLAYING = TRUE
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $31             				; C#4
	.DB $26             				; F#3
	.DB $31             				; C#4
	.DB $25             				; F3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $26             				; F#3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $28             				; G#3
	.DB $2A             				; A#3
	.DB $28             				; G#3
	.DB $30             				; C4
	.DB $2A             				; A#3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $30             				; C4
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $31             				; C#4
	.DB $35             				; F4
	.DB $41             				; C#5
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $0C             				; REST
	.DB $E7             				; SET INTERCEPTION MUSIC PLAYING = FALSE
	.DB $FF             				; END OF CHANNEL 

INTERCEPTION_SONG_SQ_1_CH_DATA:							; INTERCEPTION SQ1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $2A             				; A#3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $28             				; G#3
	.DB $2A             				; A#3
	.DB $28             				; G#3
	.DB $30             				; C4
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $31             				; C#4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $33             				; D#4
	.DB $28             				; G#3
	.DB $33             				; D#4
	.DB $2A             				; A#3
	.DB $30             				; C4
	.DB $31             				; C#4
	.DB $33             				; D#4
	.DB $35             				; F4
	.DB $FF             				; END OF CHANNEL 

INTERCEPTION_SONG_TRI_CH_DATA:							; INTERCEPTION TRI CH DATA
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $21             				; C#3
	.DB $21             				; C#3
	.DB $0C             				; REST
	.DB $28             				; G#3
	.DB $0C             				; REST
	.DB $28             				; G#3
	.DB $2A             				; A#3
	.DB $28             				; G#3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $31             				; C#4
	.DB $FF             				; END OF CHANNEL 

INTERCEPTION_SONG_NOISE_CH_DATA:							; INTERCEPTION NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $0C             				; REST
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $66           				; SET NOISE FREQ = 13.9 kHZ/ 56Hz
	.DB $67           				; SET NOISE FREQ = 11.1 kHZ/ 38Hz
	.DB $68           				; SET NOISE FREQ = 8856 HZ/ 33Hz
	.DB $FF             				; END OF CHANNEL 

_F}_INTERCEPTION_SONG_DATA

UNUSED_MUSIC_DATA_BANK_30:				; UNUSED DATA
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $10             				; C2

_F{_INJURY_SONG_DATA					; DONE

INJURY_SONG_CH_DATA_POINTERS:							; 0X2B INJURY MUSIC CH POINTERS
    
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD INJURY_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD INJURY_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD INJURY_SONG_SQ_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD INJURY_SONG_SQ_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

INJURY_SONG_SQ_0_CH_DATA:							; INJURY MUSIC SQ0 CH DATA
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $24             				; E3
	
INJURY_SONG_SQ_0_CH_LOOP:							; INJURY MUSIC SQ0 LOOP
       .DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $22             				; D3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $22             				; D3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $24             				; E3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $25             				; F3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $29             				; A3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $28             				; G#3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $28             				; G#3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $24             				; E3
	.DB $E8             				; JUMP->INJURY MUSIC SQ0 LOOP
	.WORD INJURY_SONG_SQ_0_CH_LOOP             			;

INJURY_SONG_SQ_1_CH_DATA:							; INJURY MUSIC SQ1 CH DATA
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	
INJURY_SONG_SQ_1_CH_LOOP:							; INJURY MUSIC SQ0 LOOP
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $22             				; D3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $1B             				; B2
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $1B             				; B2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $20             				; C3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1B             				; B2
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $22             				; D3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $22             				; D3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $24             				; E3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $26             				; F#3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $26             				; F#3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $24             				; E3
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$4B             			; SET VOLUME ENVELOPE INDEX = 75
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $20             				; C3
	.DB $E8             				; JUMP ->INJURY MUSIC SQ0 LOOP
	.WORD INJURY_SONG_SQ_1_CH_LOOP             			;

INJURY_SONG_SQ_TRI_CH_DATA:							; INJURY MUSIC TRI CH DATA
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	
INJURY_SONG_TRI_CH_LOOP:							; INJURY MUSIC TRI LOOP
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$0E             			; START LOOP AND LOOP 14 TIMES
	.DB $29             				; A3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$0E             			; START LOOP AND LOOP 14 TIMES
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$0E             			; START LOOP AND LOOP 14 TIMES
	.DB $25             				; F3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $24             				; E3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $8B             				; SET NOTE LENGTH TO: 3/8

	.DB $EB,$0E             			; START LOOP AND LOOP 14 TIMES
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $E8             				; JUMP -> INJURY MUSIC TRI LOOP
	.WORD INJURY_SONG_TRI_CH_LOOP             			;

INJURY_SONG_SQ_NOISE_CH_DATA:			; INJURY MUSIC NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	
INJURY_SONG_NOISE_CH_LOOP:							; INJURY MUSIC NOSIE CH LOOP
       .DB $E3,$01             			; SET VOLUME LEVEL TO 94%
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> INJURY MUSIC NOSIE CH LOOP
	.WORD INJURY_SONG_NOISE_CH_LOOP             			;

_F}_INJURY_SONG_DATA

_F{_END_OF_QUARTER_SONG_DATA			; DONE

END_OF_QUARTER_SONG_CH_DATA_POINTERS:							; 0X2C END OF QUARTER MUSIC CH POINTERS 
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD END_OF_QUARTER_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD END_OF_QUARTER_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD END_OF_QUARTER_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD END_OF_QUARTER_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEl ADDR

END_OF_QUARTER_SONG_SQ_0_CH_DATA:							; END OF QTR SQ 0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $37             				; G4
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $37             				; G4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	.DB $FF             				; END OF CHANNEL 

END_OF_QUARTER_SONG_SQ_1_CH_DATA:							; END OF QTR SQ 1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $27             				; G3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $37             				; G4
	.DB $FF             				; END OF CHANNEL 

END_OF_QUARTER_SONG_TRI_CH_DATA:							; END OF QTR TRI CH DATA
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $30             				; C4
	.DB $FF             				; END OF CHANNEL 

END_OF_QUARTER_SONG_NOISE_CH_DATA:							; END OF QTR NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $FF             				; END OF CHANNEL 
	
_F}_END_OF_QUARTER_SONG_DATA	

_F{_STATS_SONG_DATA						; DONE

BLUE_SCREEN_STATS_SONG_CH_DATA_POINTERS:							; 0X2F BLUE STAT SCREEN MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD BLUE_SCREEN_STATS_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD BLUE_SCREEN_STATS_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD BLUE_SCREEN_STATS_SONG_TRI_CH_DATA             			;

	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD BLUE_SCREEN_STATS_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

BLUE_SCREEN_STATS_SONG_SQ_0_CH_DATA:							; BLUE STAT SCREEN SQ0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $47             				; G5
	.DB $45             				; F5
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $34             				; E4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	
BLUE_SCREEN_STATS_SONG_SQ_0_CH_LOOP:							; BLUE STAT SCREEN SQ0 CH LOOP
       .DB $E3,$07             			; SET VOLUME LEVEL TO 54%

	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $2A             				; A#3
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $2A             				; A#3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $32             				; D4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $32             				; D4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $34             				; E4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $34             				; E4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $32             				; D4
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $34             				; E4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $34             				; E4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $32             				; D4
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $32             				; D4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $32             				; D4
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $37             				; G4
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $37             				; G4
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $EC             				; 	CHECK FOR END OF LOOP
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $30             				; C4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $2B             				; B3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $2B             				; B3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $30             				; C4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $2B             				; B3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $34             				; E4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $32             				; D4
	.DB $0C             				; REST
	.DB $32             				; D4
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E8             				; JUMP->BLUE STAT SCREEN SQ0 CH LOOP
	.WORD BLUE_SCREEN_STATS_SONG_SQ_0_CH_LOOP             			;

BLUE_SCREEN_STATS_SONG_SQ_1_CH_DATA:							; BLUE STAT SCREEN SQ1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $47             				; G5
	.DB $45             				; F5
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $34             				; E4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%

BLUE_SCREEN_STATS_SONG_SQ_1_CH_LOOP:							; BLUE STAT SCREEN SQ1 CH LOOP
	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $27             				; G3
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $27             				; G3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $27             				; G3
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $37             				; G4
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $37             				; G4
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $30             				; C4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $E8             				; JUMP ->BLUE STAT SCREEN SQ1 CH LOOP
	.WORD BLUE_SCREEN_STATS_SONG_SQ_1_CH_LOOP             			;

BLUE_SCREEN_STATS_SONG_TRI_CH_DATA:							; BLUE STAT SCREEN TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $0C             				; REST
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $0C             				; REST
	
BLUE_SCREEN_STATS_SONG_TRI_CH_LOOP:		; BLUE STAT SCREEN TRI CH LOOP
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $ED,$09             			; TURN ON NOTE WAVERING USING WAVER TYPE: 9
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $25             				; F3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $25             				; F3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $24             				; E3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $2B             				; B3
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $27             				; G3
	.DB $37             				; G4
	.DB $25             				; F3
	.DB $35             				; F4
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $22             				; D3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $25             				; F3
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $20             				; C3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $20             				; C3
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $25             				; F3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $24             				; E3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $2B             				; B3
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $27             				; G3
	.DB $37             				; G4
	.DB $25             				; F3
	.DB $35             				; F4
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $22             				; D3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $25             				; F3
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $20             				; C3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E8             				; JUMP ->BLUE STAT SCREEN TRI CH LOOP
	.WORD BLUE_SCREEN_STATS_SONG_TRI_CH_LOOP             			;

BLUE_SCREEN_STATS_SONG_NOISE_CH_DATA:							; BLUE STAT SCREEN NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $0C             				; REST
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	
BLUE_SCREEN_STATS_SONG_NOISE_CH_LOOP:							; BLUE STAT SCREEN NOISE CH LOOP
       .DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E8             				; JUMP ->BLUE STAT SCREEN NOISE CH LOOP
	.WORD BLUE_SCREEN_STATS_SONG_NOISE_CH_LOOP             			;
	
_F}_STATS_SONG_DATA	

_F{_CHAIN_MEASURE_SONG_DATA				; DONE

CHAIN_MEASURE_SONG_CH_DATA_POINTERS:							; 0X2E CHAINS MEASUREMENT MUSIC
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD CHAIN_MEASURE_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD CHAIN_MEASURE_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD CHAIN_MEASURE_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD CHAIN_MEASURE_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDRESSES

CHAIN_MEASURE_SONG_SQ_0_CH_DATA:							; CHAINS MEASUREMENT SQ0 CH DATA
	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	
CHAIN_MEASURE_SONG_SQ_0_CH_LOOP:							; CHAINS MEASUREMENT SQ 0 CH LOOP 	
       .DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $23             				; D#3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $24             				; E3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $25             				; F3
	.DB $30             				; C4
	.DB $E8             				; JUMP-> CHAINS MEASUREMENT SQ 0 CH LOOP
	.WORD CHAIN_MEASURE_SONG_SQ_0_CH_LOOP             			;

CHAIN_MEASURE_SONG_SQ_1_CH_DATA:							; CHAINS MEASUREMENT SQ1 CH DATA
	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1

CHAIN_MEASURE_SONG_SQ_1_CH_LOOP:							; CHAINS MEASUREMENT SQ 1 CH LOOP
       .DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $40             				; C5
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $37             				; G4
	.DB $40             				; C5
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $35             				; F4
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $E8             				; JUMP-> CHAINS MEASUREMENT SQ 1 CH LOOP
	.WORD CHAIN_MEASURE_SONG_SQ_1_CH_LOOP             			;

CHAIN_MEASURE_SONG_TRI_CH_DATA:							; CHAINS MEASUREMENT TRI CH DATA
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$09             			; TURN ON NOTE WAVERING USING WAVER TYPE: 9

CHAIN_MEASURE_SONG_TRI_CH_LOOP:							; CHAINS MEASUREMENT TRI CH LOOP
       .DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $20             				; C3
	.DB $27             				; G3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $30             				; C4
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $30             				; C4
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $25             				; F3
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $E8             				; JUMP-> CHAINS MEASUREMENT TRI CH LOOP
	.WORD CHAIN_MEASURE_SONG_TRI_CH_LOOP             			;

CHAIN_MEASURE_SONG_NOISE_CH_DATA:							; CHAINS MEASUREMENT SQ CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%

CHAIN_MEASURE_SONG_NOISE_CH_LOOP:							; CHAINS MEASUREMENT NOISE CH LOOP
       .DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $E8             				; JUMP-> CHAINS MEASUREMENT NOISE CH LOOP
	.WORD CHAIN_MEASURE_SONG_NOISE_CH_LOOP             			;

_F}_CHAIN_MEASURE_SONG_DATA

_F{_CONF_CHAMP_SONG_DATA				; DONE

CONF_CHAMP_SONG_CH_DATA_POINTERS:							; 0X30 GOING TO SUPER BOWL MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD CONF_CHAMP_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD CONF_CHAMP_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD CONF_CHAMP_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD CONF_CHAMP_SONG_NOISE_CH_DATA             			;
	
	.DB $FF             				; END OF CHANNEL ADDRESSES

CONF_CHAMP_SONG_SQ_0_CH_DATA:							; GOING TO SUPER BOWL SQ 0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $0C             				; REST
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO-> D#4 TO F4 SLIDE UP
	.WORD D4_SHARP_TO_F4_SLIDE_UP             			;
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $35             				; F4
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $35             				; F4
	.DB $E9             				; DO-> D#4 TO F4 SLIDE UP
	.WORD D4_SHARP_TO_F4_SLIDE_UP             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $35             				; F4
	.DB $E9             				; DO-> D4 TO E4 SLIDE UP
	.WORD D4_TO_E4_SLIDE_UP             			;
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $34             				; E4
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $34             				; E4
	.DB $E9             				; DO-> D4 TO E4 SLIDE UP
	.WORD D4_TO_E4_SLIDE_UP             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $34             				; E4
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E9             				; DO-> F4 TO G4 SLIDE UP
	.WORD F4_TO_G4_SLIDE_UP             			;
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $37             				; G4
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $37             				; G4
	.DB $E9             				; DO-> F4 TO G4 SLIDE UP
	.WORD F4_TO_G4_SLIDE_UP             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $37             				; G4
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $37             				; G4
	.DB $38             				; G#4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $39             				; A4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $A0             				; SET NOTE LENGTH TO: 2 1/2
	.DB $39             				; A4
	.DB $FF             				; END OF CHANNEL 

D4_SHARP_TO_F4_SLIDE_UP:							; D#4 TO F4 SLIDE UP 
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $35             				; F4
	.DB $EA             				; RETURN FROM SECTION

D4_TO_E4_SLIDE_UP:							; D4 TO E4 SLIDE UP
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $34             				; E4
	.DB $EA             				; RETURN FROM SECTION

F4_TO_G4_SLIDE_UP:							; F4 TO G4 SLIDE UP
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $37             				; G4
	.DB $EA             				; RETURN FROM SECTION

CONF_CHAMP_SONG_SQ_1_CH_DATA:							; GOING TO SUPER BOWL SQ 1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $0C             				; REST

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO-> G3 TO A3 SLIDE UP
	.WORD G3_TO_A3_SLIDE_UP             			;
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $29             				; A3
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $29             				; A3
	.DB $E9             				; DO-> G3 TO A3 SLIDE UP
	.WORD G3_TO_A3_SLIDE_UP             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $E9             				; DO-> F3 TO G3 SLIDE UP
	.WORD F3_TO_G3_SLIDE_UP             			;
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $27             				; G3
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $27             				; G3
	.DB $E9             				; DO-> F3 TO G3 SLIDE UP
	.WORD F3_TO_G3_SLIDE_UP             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E9             				; DO-> A3 TO B3 SLIDE UP
	.WORD A3_TO_B3_SLIDE_UP             			;
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $2B             				; B3
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $2B             				; B3
	.DB $E9             				; DO-> A3 TO B3 SLIDE UP
	.WORD A3_TO_B3_SLIDE_UP             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $2B             				; B3
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $A0             				; SET NOTE LENGTH TO: 2 1/2
	.DB $31             				; C#4
	.DB $FF             				; END OF CHANNEL 

G3_TO_A3_SLIDE_UP:							; G3 TO A3 SLIDE UP
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $29             				; A3
	.DB $EA             				; RETURN FROM SECTION
	
F3_TO_G3_SLIDE_UP:							; F3 TO G3 SLIDE UP
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $27             				; G3
	.DB $EA             				; RETURN FROM SECTION

A3_TO_B3_SLIDE_UP:							; A3 TO B3 SLIDE UP
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $EA             				; RETURN FROM SECTION

CONF_CHAMP_SONG_TRI_CH_DATA:							; GOING TO SUPER BOWL TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$09             			; TURN ON NOTE WAVERING USING WAVER TYPE: 9
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $0C             				; REST

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $25             				; F3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $25             				; F3
	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $25             				; F3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $25             				; F3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $25             				; F3
	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $24             				; E3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $24             				; E3
	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $24             				; E3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $27             				; G3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $27             				; G3
	.DB $E0,$49             			; SET VOLUME ENVELOPE INDEX = 73
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $27             				; G3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $27             				; G3
	.DB $E0,$45             			; SET VOLUME ENVELOPE INDEX = 69
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $A0             				; SET NOTE LENGTH TO: 2 1/2
	.DB $29             				; A3
	.DB $FF             				; END OF CHANNEL 

CONF_CHAMP_SONG_NOISE_CH_DATA:							; GOING TO SUPER BOWL NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $EB,$05             			; START LOOP AND LOOP 5 TIMES
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END OF CHANNEL 
	
_F}_CONF_CHAMP_SONG_DATA	

_F{_FINAL_STANDINGS_SONG_DATA			; DONE

FINAL_STANDINGS_SONG_CH_DATA_POINTERS:							; 0X32 STANDING MUSIC CH POINTERS 
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD STANDINGS_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD STANDINGS_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD STANDINGS_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD STANDINGS_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

STANDINGS_SONG_SQ_0_CH_DATA:							; STANDINGS SQ0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $27             				; G3
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $30             				; C4
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $32             				; D4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $34             				; E4
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $34             				; E4
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $34             				; E4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $35             				; F4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $36             				; F#4
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $9C             				; SET NOTE LENGTH TO: 1 3/4
	.DB $37             				; G4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $37             				; G4
	
STANDINGS_SONG_SQ_0_CH_LOOP:							; FINAL STANDINGS SQ0 CH LOOP	
       .DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $34             				; E4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $32             				; D4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $34             				; E4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $34             				; E4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $32             				; D4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $E9             				; DO-> FINAL STANDINGS SQ0 CH SECTION
	.WORD STANDINGS_SONG_SQ_0_CH_SECTION             			;
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $A1             				; SET NOTE LENGTH TO: 2 3/4
	.DB $27             				; G3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$10             			; SET VOLUME ENVELOPE INDEX = 16
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $3B             				; B4
	.DB $40             				; C5
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $E0,$13             			; SET VOLUME ENVELOPE INDEX = 19
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $37             				; G4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $36             				; F#4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $25             				; F3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $34             				; E4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $32             				; D4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $34             				; E4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $34             				; E4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $32             				; D4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $E9             				; DO-> FINAL STANDINGS SQ0 CH SECTION
	.WORD STANDINGS_SONG_SQ_0_CH_SECTION             			;
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $36             				; F#4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $37             				; G4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $A1             				; SET NOTE LENGTH TO: 2 3/4
	.DB $37             				; G4
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$10             			; SET VOLUME ENVELOPE INDEX = 16
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $47             				; G5
	.DB $45             				; F5
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $45             				; F5
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $37             				; G4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $36             				; F#4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $35             				; F4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $2B             				; B3
	.DB $27             				; G3
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $A1             				; SET NOTE LENGTH TO: 2 3/4
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $A4             				; SET NOTE LENGTH TO: 3 1/2
	.DB $30             				; C4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E8             				; JUMP-> FINAL STANDINGS SQ0 CH LOOP	
	.WORD STANDINGS_SONG_SQ_0_CH_LOOP    ;

STANDINGS_SONG_SQ_0_CH_SECTION:			; FINAL STANDINGS SQ0 CH SECTION
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $EA             				; RETURN FROM SECTION

STANDINGS_SONG_SQ_1_CH_DATA:			; STANDINGS SQ1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $24             				; E3
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $27             				; G3
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $2B             				; B3
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $30             				; C4
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $30             				; C4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $32             				; D4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $33             				; D#4
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $9C             				; SET NOTE LENGTH TO: 1 3/4
	.DB $34             				; E4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $34             				; E4

STANDINGS_SONG_SQ_1_CH_LOOP:			; FINAL STANDINGS SQ1 CH LOOP	
    .DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E0,$32             			; SET VOLUME ENVELOPE INDEX = 50
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $9C             				; SET NOTE LENGTH TO: 1 3/4
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $19             				; A2
	.DB $17             				; G2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $A4             				; SET NOTE LENGTH TO: 3 1/2
	.DB $1B             				; B2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $1B             				; B2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E0,$4A             			; SET VOLUME ENVELOPE INDEX = 74
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1B             				; B2
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1B             				; B2
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $1B             				; B2
	.DB $1B             				; B2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $44             				; E5
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $3B             				; B4
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $E8             				; JUMP ->FINAL STANDINGS SQ1 CH LOOP
	.WORD STANDINGS_SONG_SQ_1_CH_LOOP   ;

STANDINGS_SONG_TRI_CH_DATA:							; FINAL STANDINGS TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $30             				; C4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $34             				; E4

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $36             				; F#4
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $37             				; G4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $37             				; G4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $37             				; G4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $3B             				; B4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $40             				; C5
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $9C             				; SET NOTE LENGTH TO: 1 3/4
	.DB $40             				; C5
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $40             				; C5
	
STANDINGS_SONG_TRI_CH_LOOP:							; FINAL STANDINGS TRI CH LOOP
       .DB $EB,$08             			; START LOOP AND LOOP 8 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $17             				; G2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $19             				; A2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $1A             				; A#2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $2A             				; A#3
	.DB $2A             				; A#3

	.DB $EB,$08             			; START LOOP AND LOOP 8 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $17             				; G2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $19             				; A2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $1A             				; A#2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $2A             				; A#3
	.DB $2A             				; A#3
	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $15             				; F2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $17             				; G2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $19             				; A2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $1B             				; B2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $2B             				; B3
	.DB $2B             				; B3

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E8             				; JUMP-> FINAL STANDINGS TRI CH LOOP
	.WORD STANDINGS_SONG_TRI_CH_LOOP             			;

STANDINGS_SONG_NOISE_CH_DATA:							; FINAL STANDINGS NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $A4             				; SET NOTE LENGTH TO: 3 1/2
	.DB $0C             				; REST
	.DB $A1             				; SET NOTE LENGTH TO: 2 3/4
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $60             				; SET NOISE FREQ = 447 kHZ/ 4971hZ
	.DB $60             				; SET NOISE FREQ = 447 kHZ/ 4971hZ
	.DB $60             				; SET NOISE FREQ = 447 kHZ/ 4971hZ
	.DB $60             				; SET NOISE FREQ = 447 kHZ/ 4971hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $66           				; SET NOISE FREQ = 13.9 kHZ/ 56Hz
	.DB $66           				; SET NOISE FREQ = 13.9 kHZ/ 56Hz
	.DB $67           				; SET NOISE FREQ = 11.1 kHZ/ 38Hz
	.DB $67           				; SET NOISE FREQ = 11.1 kHZ/ 38Hz
	.DB $68           				; SET NOISE FREQ = 8856 HZ/ 33Hz
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $69             				; SET NOISE FREQ = 7043 HZ/ 22Hz
	.DB $6A             				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $6B             				; SET NOISE FREQ = 3521 HZ/ 10hZ
	.DB $6C             				; SET NOISE FREQ = 2347 HZ/ 5hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 2hZ
	.DB $6E             				; SET NOISE FREQ = 879 HZ/ 1hZ
	.DB $6F             				; SET NOISE FREQ = 439HZ/ 1hZ

STANDINGS_SONG_NOISE_CH_LOOP:							; FINAL STANDINGS NOISE CH LOOP
    .DB $E9             				; DO->FINAL STANDINGS NOISE CH SECTION
	.WORD STANDINGS_SONG_NOISE_CH_SECTION             			;
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->FINAL STANDINGS NOISE CH SECTION
	.WORD STANDINGS_SONG_NOISE_CH_SECTION             			;
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->FINAL STANDINGS NOISE CH SECTION
	.WORD STANDINGS_SONG_NOISE_CH_SECTION             			;
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E8             				; JUMP-> FINAL STANDINGS NOISE CH LOOP
	.WORD STANDINGS_SONG_NOISE_CH_LOOP             			;

STANDINGS_SONG_NOISE_CH_SECTION:		; FINAL STANDINGS NOISE CH SECTION
	.DB $E3,$02             			; SET VOLUME LEVEL TO 87%
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $63            				; SET NOISE FREQ = 55.9 kHZ/ 397 hZ
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EA             				; RETURN FROM SECTION
	
_F}_FINAL_STANDINGS_SONG_DATA	

_F{_DIV_CHAMP_SONG_DATA					; DONE

DIV_CHAMP_SONG_CH_DATA_POINTERS:							; 0X31 DIVISION CHAMPS MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD DIVISION_CHAMP_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD DIVISION_CHAMP_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD DIVISION_CHAMP_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD DIVISION_CHAMP_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

DIVISION_CHAMP_SONG_SQ_0_CH_DATA:							; DIVISION CHAMPS SQ0 CH DATA
	.DB $E0,$30             			; SET VOLUME ENVELOPE INDEX = 48
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $88             				; SET NOTE LENGTH TO: 1/4

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $99             				; SET NOTE LENGTH TO: 1 5/16
	.DB $24             				; E3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $99             				; SET NOTE LENGTH TO: 1 5/16
	.DB $26             				; F#3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $29             				; A3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $99             				; SET NOTE LENGTH TO: 1 5/16
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $9D             				; SET NOTE LENGTH TO: 1 7/8
	.DB $37             				; G4
	.DB $FF             				; END OF CHANNEL 

DIVISION_CHAMP_SONG_SQ_1_CH_DATA:							; DIVISION CHAMPS SQ1 CH DATA
	.DB $E0,$34             			; SET VOLUME ENVELOPE INDEX = 52
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $88             				; SET NOTE LENGTH TO: 1/4

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $88             				; SET NOTE LENGTH TO: 1/4

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $29             				; A3
	.DB $26             				; F#3
	.DB $29             				; A3
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $26             				; F#3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $E0,$34             			; SET VOLUME ENVELOPE INDEX = 52
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL

	.DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL 

DIVISION_CHAMP_SONG_TRI_CH_DATA:							; DIVISION CHAMPS TRI CH DATA
	.DB $E0,$42             			; SET VOLUME ENVELOPE INDEX = 66
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $88             				; SET NOTE LENGTH TO: 1/4

	.DB $EB,$0C             			; START LOOP AND LOOP 12 TIMES
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $29             				; A3
	.DB $26             				; F#3
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $E0,$42             			; SET VOLUME ENVELOPE INDEX = 66
	.DB $88             				; SET NOTE LENGTH TO: 1/4

	.DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL 

DIVISION_CHAMP_SONG_NOISE_CH_DATA:		; DIVISION CHAMPS NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $88             				; SET NOTE LENGTH TO: 1/4

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ

	.DB $EB,$0D             			; START LOOP AND LOOP 13 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL 
	
_F}_DIV_CHAMP_SONG_DATA	

_F{_UNUSED_SONG_DATA					; DONE
								; UNUSED SONG
UNSUSED_SONG_CH_DATA_POINTERS:							; 0X33 UNUSED SONG MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD UNUSED_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD UNUSED_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD UNUSED_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD UNUSED_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

UNUSED_SONG_SQ_0_CH_DATA:				; UNUSED SONG SQ0 CH DATA 
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	
UNUSED_SONG_SQ_0_CH_LOOP:				; UNUSED SONG SQ0 CH LOOP
     .DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E9             				; DO->UNUSED SONG SQ0 CH SECTION
	.WORD UNUSED_SONG_SQ_0_CH_SECTION   ;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E9             				; DO->UNUSED SONG SQ0 CH SECTION
	.WORD UNUSED_SONG_SQ_0_CH_SECTION   ;
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $0C             				; REST
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $37             				; G4
	.DB $38             				; G#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $95             				; SET NOTE LENGTH TO: 15/16
	.DB $39             				; A4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E8             				; JUMP-> UNUSED SONG SQ0 CH LOOP
	.WORD UNUSED_SONG_SQ_0_CH_LOOP       ;

UNUSED_SONG_SQ_0_CH_SECTION:			; UNUSED SONG SQ0 CH SECTION					
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $37             				; G4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $37             				; G4
	.DB $EA             				; RETURN FROM SECTION

UNUSED_SONG_SQ_1_CH_DATA:				; UNUSED SONG SQ1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	
UNUSED_SONG_SQ_1_CH_LOOP:							; UNUSED SONG SQ 1 CH LOOP
       .DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $E5,$02             			; ADJUST PITCH by: 2
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E9             				; DO->UNUSED SONG SQ1 CH SECTION
	.WORD UNUSED_SONG_SQ_1_CH_SECTION             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E9             				; DO->UNUSED SONG SQ1 CH SECTION
	.WORD UNUSED_SONG_SQ_1_CH_SECTION             			;
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $0C             				; REST
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $95             				; SET NOTE LENGTH TO: 15/16
	.DB $34             				; E4
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E8             				; JUMP->UNUSED SONG SQ 1 CH LOOP
	.WORD UNUSED_SONG_SQ_1_CH_LOOP             			;

UNUSED_SONG_SQ_1_CH_SECTION:							; UNUSED SONG SQ1 CH SECTION
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $32             				; D4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $34             				; E4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $EA             				; RETURN FROM SECTION

UNUSED_SONG_TRI_CH_DATA:							; UNUSED SONG TRI CH DATA
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL

UNUSED_SONG_TRI_CH_LOOP:							; UNUSED SONG TRI CH LOOP
       .DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $31             				; C#4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $32             				; D4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $33             				; D#4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $33             				; D#4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $29             				; A3
	.DB $31             				; C#4
	.DB $32             				; D4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $9F             				; SET NOTE LENGTH TO: 2 1/4
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> UNUSED SONG TRI CH LOOP
	.WORD UNUSED_SONG_TRI_CH_LOOP             			;

UNUSED_SONG_NOISE_CH_DATA:							; UNUSED SONG NOISE CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	
UNUSED_SONG_NOISE_CH_LOOP:							; UNUSED SONG NOISE CH LOOP	
    .DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E9             				; DO->UNUSED SONG NOISE CH SECTION
	.WORD UNUSED_SONG_NOISE_CH_SECTION  ;
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $0C             				; REST
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $E9             				; DO->UNUSED SONG NOISE CH SECTION
	.WORD UNUSED_SONG_NOISE_CH_SECTION             			;
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $0C             				; REST
	.DB $E0,$28             			; SET VOLUME ENVELOPE INDEX = 40
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E8             				; JUMP-> UNUSED SONG NOISE CH LOOP	
	.WORD UNUSED_SONG_NOISE_CH_LOOP             			;

UNUSED_SONG_NOISE_CH_SECTION:							; UNUSED SONG NOISE CH SECTION
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EA             				; RETURN FROM SECTION
	
_F}_UNUSED_SONG_DATA	

_F{_PASSING_TD_SONG_DATA				; DONE

PASSING_TD_SONG_CH_DATA_POINTERS:							; 0X35 PASSING TD MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD PASSING_TD_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD PASSING_TD_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD PASSING_TD_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD PASSING_TD_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

PASSING_TD_SONG_SQ_0_CH_DATA:							; PASSING TD SQ 0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $37             				; G4
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $37             				; G4
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $37             				; G4
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $42             				; D5
	.DB $44             				; E5
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $50             				; C6
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $98             				; SET NOTE LENGTH TO: 1 1/4
	.DB $50             				; C6
	.DB $FF             				; END OF CHANNEL 

PASSING_TD_SONG_SQ_1_CH_DATA:							; PASSING TD SQ 1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $8A             				; SET NOTE LENGTH TO: 5/16

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $27             				; G3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $32             				; D4
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $32             				; D4
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $34             				; E4
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $34             				; E4
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $37             				; G4
	.DB $3B             				; B4
	.DB $40             				; C5
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $47             				; G5
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $98             				; SET NOTE LENGTH TO: 1 1/4
	.DB $47             				; G5
	.DB $FF             				; END OF CHANNEL 

PASSING_TD_SONG_TRI_CH_DATA:							; PASSING TD TRI CH DATA
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$01             			; TURN ON NOTE WAVERING USING WAVER TYPE: 1
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $22             				; D3
	.DB $29             				; A3
	.DB $32             				; D4
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $32             				; D4

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $17             				; G2
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $17             				; G2
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $98             				; SET NOTE LENGTH TO: 1 1/4
	.DB $30             				; C4
	.DB $FF             				; END OF CHANNEL 

PASSING_TD_SONG_NOISE_CH_DATA:							; PASSING TD NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $F0             				; PLAY DMC KICK DRUM HIGH FREQ
	.DB $0C             				; REST
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $F1             				; PLAY DMC KICK DRUM MED FREQ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $F2             				; PLAY DMC KICK DRUM LOW FREQ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $FD             				; PLAY DMC 'DRUM SAMPLE 4' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FD             				; PLAY DMC 'DRUM SAMPLE 4' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E9             				; DO->PASSING TD NOISE CH SECTION  
	.WORD PASSING_TD_SONG_NOISE_CH_SECTION            			;

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL 

PASSING_TD_SONG_NOISE_CH_SECTION:		; PASSING TD NOISE CH SECTION  *** ONLY USED ONCE COULD BE PLACED INLINE
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $EA             				; RETURN FROM SECTION
	
_F}_PASSING_TD_SONG_DATA	
	
_F{_HALFTIME_SONG_DATA					; DONE

HALFTIME_SONG_CH_DATA_POINTERS:							; 0X2D HALFTIME MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD HALFTIME_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD HALFTIME_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD HALFTIME_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD HALFTIME_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

HALFTIME_SONG_SQ_0_CH_DATA:							; HALFTIME MUSIC SQ 0 CH DATA
	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $50             				; C6
	.DB $4B             				; B5
	.DB $49             				; A5
	.DB $47             				; G5
	.DB $45             				; F5
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E9             				; DO ->HALFTIME SQ0 SECTION
	.WORD HALFTIME_SONG_SQ_0_CH_SECTION             			;
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $32             				; D4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $31             				; C#4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $31             				; C#4
	.DB $32             				; D4
	.DB $35             				; F4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $35             				; F4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $36             				; F#4
	.DB $37             				; G4
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $E9             				; DO ->HALFTIME SQ0 SECTION
	.WORD HALFTIME_SONG_SQ_0_CH_SECTION             			;
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $39             				; A4
	.DB $3A             				; A#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $3B             				; B4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $3B             				; B4
	.DB $3A             				; A#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $39             				; A4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $39             				; A4
	.DB $38             				; G#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $37             				; G4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $37             				; G4
	.DB $38             				; G#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $39             				; A4
	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $EF             				; TURN OFF NOTE WAVERING
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $37             				; G4
	.DB $38             				; G#4
	.DB $39             				; A4
	.DB $3B             				; B4
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $40             				; C5
	.DB $FF             				; END OF CHANNEL 

HALFTIME_SONG_SQ_0_CH_SECTION:			; HALFTIME SQ0 SECTION
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $33             				; D#4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $34             				; E4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $34             				; E4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $37             				; G4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $38             				; G#4
	.DB $39             				; A4
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $35             				; F4
	.DB $EA             				; RETURN 

HALFTIME_SONG_SQ_1_CH_DATA:							; HALFTIME MUSIC SQ 1 CH DATA
	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $0C             				; REST
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $49             				; A5
	.DB $47             				; G5
	.DB $45             				; F5
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $32             				; D4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $0C             				; REST
	.DB $17             				; G2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $17             				; G2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $22             				; D3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $12             				; D2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $30             				; C4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $32             				; D4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $17             				; G2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $25             				; F3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $FF             				; END OF CHANNEL 

HALFTIME_SONG_TRI_CH_DATA:							; HALFTIME MUSIC TRI CH DATA
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $9C             				; SET NOTE LENGTH TO: 1 3/4
	.DB $0C             				; REST
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $30             				; C4
	.DB $20             				; C3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $20             				; C3
	.DB $21             				; C#3
	.DB $22             				; D3
	.DB $32             				; D4
	.DB $22             				; D3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $22             				; D3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $37             				; G4
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $37             				; G4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $37             				; G4
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $34             				; E4
	.DB $22             				; D3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $20             				; C3
	.DB $30             				; C4
	.DB $20             				; C3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $30             				; C4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $30             				; C4
	.DB $20             				; C3
	.DB $21             				; C#3
	.DB $22             				; D3
	.DB $32             				; D4
	.DB $22             				; D3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $22             				; D3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $32             				; D4
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $37             				; G4
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $35             				; F4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $FF             				; END OF CHANNEL 

HALFTIME_SONG_NOISE_CH_DATA:							; HALFTIME MUSIC NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #1
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_ONE             			;
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #2
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_TWO             			;
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #1
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_ONE             			;
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #1
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_ONE             			;
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #2
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_TWO             			;
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #1
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_ONE             			;
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #1
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_ONE             			;
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #2
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_TWO             			;
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $E9             				; DO-> HALFTIME NOISE SECTION #1
	.WORD HALFTIME_SONG_NOISE_CH_SECTION_ONE             			;
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END OF CHANNEL 

HALFTIME_SONG_NOISE_CH_SECTION_ONE:							; HALFTIME NOISE SECTION #1
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EA             				; RETURN FROM SECTION

HALFTIME_SONG_NOISE_CH_SECTION_TWO:							; HALFTIME NOISE SECTION #2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EA             				; RETURN FROM SECTION
	
_F}_HALFTIME_SONG_DATA	
	
_F{_INJURY_RETURN_SONG_DATA				; DONE

INJURY_RETURN_SONG_CH_DATA_POINTERS:							; 0X34 INJURY RETURN MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD INJURY_RETURN_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD INJURY_RETURN_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD INJURY_RETURN_SONG_TRI_CH_DATA             			;

	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD INJURY_RETURN_SONG_NOISE_CH_DATA             			;
	
	.DB $FF             				; END OF CHANNEL ADDR

INJURY_RETURN_SONG_SQ_0_CH_DATA:							; INJURY RETURN SONG SQ0 CH DATA
	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	
INJURY_RETURN_SONG_SQ_0_CH_LOOP:							; INJURY RETURN SONG SQ0 CH LOOP	
       .DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $37             				; G4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $36             				; F#4
	.DB $32             				; D4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $37             				; G4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $36             				; F#4
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $0C             				; REST
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $38             				; G#4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $34             				; E4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $39             				; A4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $38             				; G#4
	.DB $34             				; E4
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $38             				; G#4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $34             				; E4
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $39             				; A4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $38             				; G#4
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> INJURY RETURN SONG SQ0 CH LOOP
	.WORD INJURY_RETURN_SONG_SQ_0_CH_LOOP             			;
	
INJURY_RETURN_SONG_SQ_1_CH_DATA:							; INJURY RETURN SONG SQ1 CH DATA
	.DB $E0,$3E             			; SET VOLUME ENVELOPE INDEX = 62
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%

INJURY_RETURN_SONG_SQ_1_CH_LOOP:							; INJURY RETURN SONG SQ1 CH LOOP
       .DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $07             				; G1
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $12             				; D2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $17             				; G2
	.DB $07             				; G1
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $10             				; C2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $12             				; D2
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $12             				; D2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $17             				; G2
	.DB $07             				; G1
	.DB $07             				; G1
	.DB $17             				; G2
	.DB $07             				; G1
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $0C             				; REST
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $09             				; A1
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $14             				; E2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $19             				; A2
	.DB $09             				; A1
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $12             				; D2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $14             				; E2
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $14             				; E2
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $19             				; A2
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $19             				; A2
	.DB $09             				; A1
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> INJURY RETURN SONG SQ1 CH LOOP
	.WORD INJURY_RETURN_SONG_SQ_1_CH_LOOP             			;

INJURY_RETURN_SONG_TRI_CH_DATA:							; INJURY RETURN SONG TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	
INJURY_RETURN_SONG_TRI_CH_LOOP:							; INJURY RETURN SONG TRI CH LOOP
       .DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $17             				; G2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $17             				; G2
	.DB $0C             				; REST
	.DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $19             				; A2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> INJURY RETURN SONG TRI CH LOOP
	.WORD INJURY_RETURN_SONG_TRI_CH_LOOP             			;

INJURY_RETURN_SONG_NOISE_CH_DATA:							; INJURY RETURN SONG NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	
INJURY_RETURN_SONG_NOISE_LOOP:							; INJURY RETURN SONG NOISE CH LOOP
       .DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FD             				; PLAY DMC 'DRUM SAMPLE 4' 
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903 hZ
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $FD             				; PLAY DMC 'DRUM SAMPLE 4' 
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $0C             				; REST
	.DB $E8             				; JUMP ->INJURY RETURN SONG NOISE CH LOOP
	.WORD INJURY_RETURN_SONG_NOISE_LOOP             			;

_F}_INJURY_RETURN_SONG_DATA	
	
_F{_KICKOFF_SONG_DATA					; DONE

KICKOFF_SONG_CH_DATA_POINTERS:							; 0X2 KICKOFF MUSIC CH POINTERS
	
	.DB SQ_0_MUSIC_CH_ID             				; SQ MUSIC 0
	.WORD KICKOFF_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD KICKOFF_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD KICKOFF_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD KICKOFF_SONG_NOISE_CH_DATA             			;
	
	.DB $FF             				; END OF CHANNEL ADDRESSES
	
KICKOFF_SONG_SQ_0_CH_DATA:							; KICKOFF SONG SQ0 CH DATA
	.DB $E0,$2A             			; SET VOLUME ENVELOPE INDEX = 42
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $ED,$0C             			; TURN ON NOTE WAVERING USING WAVER TYPE: 12
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $27             				; G3

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E9             				; DO SECTION = KICKOFF SONG SQ SECTION
	.WORD KICKOFF_SONG_SQ_0_CH_SECTION             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $2B             				; B3
	.DB $E9             				; DO SECTION = KICKOFF SONG SQ SECTION
	.WORD KICKOFF_SONG_SQ_0_CH_SECTION             			;
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $2B             				; B3
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $32             				; D4
	.DB $E3,$02             			; SET VOLUME LEVEL TO 87%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $32             				; D4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $32             				; D4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $35             				; F4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $35             				; F4
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $37             				; G4
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $37             				; G4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $9E             				; SET NOTE LENGTH TO: 2
	.DB $37             				; G4
	.DB $FF             				; END

KICKOFF_SONG_SQ_0_CH_SECTION:							; KICKOFF SONG SQ SECTION				
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $EA             				; RETURN FROM SECTION

KICKOFF_SONG_SQ_1_CH_DATA:							; KICKOFF SONG SQ1 CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $E0,$2A             			; SET VOLUME ENVELOPE INDEX = 42
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $ED,$00             			; TURN ON NOTE WAVERING USING WAVER TYPE: 0
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $9F             				; SET NOTE LENGTH TO: 2 1/4
	.DB $37             				; G4
	.DB $FF             				; END

KICKOFF_SONG_TRI_CH_DATA:				; KICKOFF SONG TRI CH DATA
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$0C             			; TURN ON NOTE WAVERING USING WAVER TYPE: 12
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $30             				; C4
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $20             				; C3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $E0,$2D             			; SET VOLUME ENVELOPE INDEX = 45
	.DB $9F             				; SET NOTE LENGTH TO: 2 1/4
	.DB $27             				; G3
	.DB $FF             				; END

KICKOFF_SONG_NOISE_CH_DATA:				; KICKOFF SONG NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $64            				; SET NOISE FREQ = 27.9 kHZ/ 132 hZ             				
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65             				; SET NOISE FREQ = 18.6 kHZ/ 67Hz
	.DB $FF             				; END 

_F}_KICKOFF_SONG_DATA
	

.PAD $C000,$FF	
