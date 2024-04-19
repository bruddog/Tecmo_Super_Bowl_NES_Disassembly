_F{_SUPER_BOWL_WINNER_SONG_DATA					; DONE

SUPERBOWL_SONG_CH_DATA_POINTERS:							; 0X44 SUPER BOWL WINNER MUSIC CHANNEL POINTERS
    
	.DB SQ_0_MUSIC_CH_ID            				; SQ MUSIC 0
	.WORD SUPERBOWL_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD SUPERBOWL_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD SUPERBOWL_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD SUPERBOWL_SONG_NOISE_CH_DATA             			;
	
	.DB $FF             				; END OF CHANNEL ADDR

SUPERBOWL_SONG_SQ_0_CH_DATA:							; SUPER BOWL WINNER SQ CH 0 DATA 
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $0C             				; REST
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $E0,$10             			; SET VOLUME ENVELOPE INDEX = 16

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $32             				; D4
	.DB $2B             				; B3
	.DB $27             				; G3
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $2B             				; B3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $27             				; G3
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $34             				; E4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $3B             				; B4
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $E0,$15             			; SET VOLUME ENVELOPE INDEX = 21
	.DB $9C             				; SET NOTE LENGTH TO: 1 3/4
	.DB $37             				; G4
	.DB $FF             				; END OF CHANNEL 

SUPERBOWL_SONG_SQ_1_CH_DATA:							; SUPER BOWL WINNER SQ CH 1 DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E0,$11             			; SET VOLUME ENVELOPE INDEX = 17
	.DB $94             				; SET NOTE LENGTH TO: 7/8
	.DB $0C             				; REST
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $16             				; F#2
	.DB $17             				; G2
	.DB $E0,$10             			; SET VOLUME ENVELOPE INDEX = 16

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $07             				; G1
	.DB $17             				; G2
	.DB $0C             				; REST
	.DB $07             				; G1
	.DB $0C             				; REST
	.DB $07             				; G1
	.DB $14             				; E2
	.DB $12             				; D2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $10             				; C2
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $17             				; G2
	.DB $0C             				; REST
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $17             				; G2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $12             				; D2
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $19             				; A2
	.DB $1B             				; B2
	.DB $19             				; A2
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $E0,$15             			; SET VOLUME ENVELOPE INDEX = 21
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $9C             				; SET NOTE LENGTH TO: 1 3/4
	.DB $32             				; D4
	.DB $FF             				; END OF CHANNEL 

SUPERBOWL_SONG_TRI_CH_DATA:							; SUPER BOWL WINNER TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $9C             				; SET NOTE LENGTH TO: 1 3/4
	.DB $0C             				; REST

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$10             			; SET VOLUME ENVELOPE INDEX = 16

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $20             				; C3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $22             				; D3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $27             				; G3
	.DB $FF             				; END OF CHANNEL 

SUPERBOWL_SONG_NOISE_CH_DATA:							; SUPER BOWL WINNER NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E3,$02             			; SET VOLUME LEVEL TO 87%
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FF             				; END OF CHANNEL 
	
_F}_SUPER_BOWL_WINNER_SONG_DATA		

_F{_SUPER_BOWL_CREDITS_SONG_DATA				; DONE

CREDITS_SONG_CH_DATA_POINTERS:			; 0X45 CREDITS MUSIC CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID            	; SQ MUSIC 0
	.WORD CREDITS_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             	; SQ MUSIC 1
	.WORD CREDITS_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             	; TRI MUSIC
	.WORD CREDITS_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             	; NOISE MUSIC
	.WORD CREDITS_SONG_NOISE_CH_DATA    ;
	.DB $FF             				; END OF CHANNEL ADDR 

CREDITS_SONG_C_TO_G_SQ_CH_SECTION:			; SCALE FROM HIGH C TO LOW G
	.DB $E0,$22             			; SET VOLUME ENVELOPE INDEX = 34
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $A2             				; SET NOTE LENGTH TO: 3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $50             				; C6
	.DB $4B             				; B5
	.DB $47             				; G5
	.DB $44             				; E5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $17             				; G2
	.DB $EA             				; RETURN FROM SECTION

CREDITS_SONG_SQ_0_CH_DATA:							; CREDITS SQ0 CH DATA
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E9             				; DO-> SCALE FROM HIGH C TO LOW G
	.WORD CREDITS_SONG_C_TO_G_SQ_CH_SECTION             			;
	.DB $14             				; E2

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E9             				; DO->CREDITS SQ0 LEAD SECTION
	.WORD CREDITS_SONG_SQ_0_CH_SECTION             			;
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $E9             				; DO->CREDITS SQ0 LEAD SECTION
	.WORD CREDITS_SONG_SQ_0_CH_SECTION             			;
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$2A             			; SET VOLUME ENVELOPE INDEX = 42
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $ED,$0C             			; TURN ON TREMELO USING TREMELO TYPE: 12
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $E0,$3C             			; SET VOLUME ENVELOPE INDEX = 60
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E9             				; DO->CREDITS SQ0,SQ1 SECTION
	.WORD CREDITS_SONG_SQ_CH_COMMON_SECTION             			;
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$25             			; SET VOLUME ENVELOPE INDEX = 37

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $27             				; G3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $28             				; G#3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $28             				; G#3
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $21             				; C#3
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $25             				; F3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $25             				; F3
	.DB $29             				; A3
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $31             				; C#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $32             				; D4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $24             				; E3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $EF             				; TURN OFF TREMELO
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $E0,$15             			; SET VOLUME ENVELOPE INDEX = 21
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $37             				; G4
	.DB $ED,$0D             			; TURN ON TREMELO USING TREMELO TYPE: 13
	.DB $9F             				; SET NOTE LENGTH TO: 2 1/4
	.DB $37             				; G4
	.DB $ED,$0E             			; TURN ON TREMELO USING TREMELO TYPE: 14
	.DB $A2             				; SET NOTE LENGTH TO: 3
	.DB $37             				; G4
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $37             				; G4
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $37             				; G4
	.DB $EF             				; TURN OFF TREMELO
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $12             				; D2
	.DB $30             				; C4
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $12             				; D2
	.DB $30             				; C4
	.DB $12             				; D2
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $12             				; D2
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $12             				; D2
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $10             				; C2
	.DB $2B             				; B3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $10             				; C2
	.DB $2B             				; B3
	.DB $10             				; C2
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $10             				; C2
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $10             				; C2
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $12             				; D2
	.DB $30             				; C4
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $12             				; D2
	.DB $30             				; C4
	.DB $12             				; D2
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $12             				; D2
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $12             				; D2
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $07             				; G1
	.DB $29             				; A3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $07             				; G1
	.DB $29             				; A3
	.DB $07             				; G1
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $07             				; G1
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $07             				; G1
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$25             			; SET VOLUME ENVELOPE INDEX = 37

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $30             				; C4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $35             				; F4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $34             				; E4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $31             				; C#4
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $31             				; C#4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $35             				; F4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $2A             				; A#3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $2A             				; A#3
	.DB $32             				; D4
	.DB $39             				; A4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $37             				; G4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $29             				; A3
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $31             				; C#4
	.DB $32             				; D4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $32             				; D4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $34             				; E4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $3A             				; A#4
	.DB $EF             				; TURN OFF TREMELO
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $E0,$15             			; SET VOLUME ENVELOPE INDEX = 21
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $40             				; C5
	.DB $ED,$0D             			; TURN ON TREMELO USING TREMELO TYPE: 13
	.DB $9F             				; SET NOTE LENGTH TO: 2 1/4
	.DB $40             				; C5
	.DB $ED,$0E             			; TURN ON TREMELO USING TREMELO TYPE: 14
	.DB $A2             				; SET NOTE LENGTH TO: 3
	.DB $40             				; C5
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $40             				; C5
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $40             				; C5
	.DB $E0,$22             			; SET VOLUME ENVELOPE INDEX = 34
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $40             				; C5
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
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $EF             				; TURN OFF TREMELO
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $EF             				; TURN OFF TREMELO
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $0C             				; REST
	.DB $35             				; F4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $35             				; F4
	.DB $35             				; F4
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $0C             				; REST
	.DB $35             				; F4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL 

CREDITS_SONG_SQ_CH_COMMON_SECTION:									; CREDITS SQ0,SQ1 SECTION
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $32             				; D4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $22             				; D3
	.DB $26             				; F#3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $32             				; D4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $22             				; D3
	.DB $27             				; G3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $32             				; D4
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $26             				; F#3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $32             				; D4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $22             				; D3
	.DB $26             				; F#3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $32             				; D4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $22             				; D3
	.DB $27             				; G3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $EA             				; RETURN FROM SECTION

CREDITS_SONG_SQ_0_CH_SECTION:			; CREDITS SQ0 SECTION
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $2B             				; B3
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $0C             				; REST
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $2A             				; A#3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $29             				; A3
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2A             				; A#3
	.DB $35             				; F4
	.DB $32             				; D4
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $0C             				; REST
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $29             				; A3
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2A             				; A#3
	.DB $30             				; C4
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $33             				; D#4
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $28             				; G#3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $33             				; D#4
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $28             				; G#3
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $20             				; C3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $EA             				; RETURN FROM SECTION

CREDITS_SONG_SQ_1_CH_SECTION:			; CREDITS SQ 1 SECTION
	.DB $17             				; G2
	.DB $20             				; C3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $17             				; G2
	.DB $20             				; C3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $3B             				; B4
	.DB $40             				; C5
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $34             				; E4
	.DB $15             				; F2
	.DB $1A             				; A#2
	.DB $22             				; D3
	.DB $27             				; G3
	.DB $15             				; F2
	.DB $1A             				; A#2
	.DB $22             				; D3
	.DB $27             				; G3
	.DB $2A             				; A#3
	.DB $32             				; D4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $3A             				; A#4
	.DB $37             				; G4
	.DB $32             				; D4
	.DB $2A             				; A#3
	.DB $18             				; G#2
	.DB $20             				; C3
	.DB $23             				; D#3
	.DB $28             				; G#3
	.DB $18             				; G#2
	.DB $20             				; C3
	.DB $23             				; D#3
	.DB $28             				; G#3
	.DB $30             				; C4
	.DB $33             				; D#4
	.DB $35             				; F4
	.DB $38             				; G#4
	.DB $40             				; C5
	.DB $38             				; G#4
	.DB $35             				; F4
	.DB $33             				; D#4
	.DB $17             				; G2
	.DB $1B             				; B2
	.DB $27             				; G3
	.DB $22             				; D3
	.DB $17             				; G2
	.DB $1B             				; B2
	.DB $27             				; G3
	.DB $22             				; D3
	.DB $EA             				; RETURN FROM SECTION

CREDITS_SONG_SQ_1_CH_SECTION_TWO:		; CREDITS SQ 1 SECTION #2
	.DB $E0,$27             			; SET VOLUME ENVELOPE INDEX = 39
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0B             				; B1
	.DB $3B             				; B4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $40             				; C5
	.DB $42             				; D5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $42             				; D5
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $42             				; D5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	.DB $40             				; C5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $04             				; E1
	.DB $3B             				; B4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $40             				; C5
	.DB $42             				; D5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $42             				; D5
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $42             				; D5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	.DB $40             				; C5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $02             				; D1
	.DB $39             				; A4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $44             				; E5
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $44             				; E5
	.DB $42             				; D5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $42             				; D5
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $42             				; D5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	.DB $40             				; C5
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $10             				; C2
	.DB $2B             				; B3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $40             				; C5
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $40             				; C5
	.DB $39             				; A4
	.DB $EA             				; RETURN FROM SECTION

CREDITS_SONG_SQ_1_CH_SECTION_THREE:		; CREDITS SQ1 SECTION #3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $24             				; E3
	.DB $20             				; C3
	.DB $34             				; E4
	.DB $20             				; C3
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $20             				; C3
	.DB $35             				; F4
	.DB $20             				; C3
	.DB $19             				; A2
	.DB $21             				; C#3
	.DB $34             				; E4
	.DB $21             				; C#3
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $21             				; C#3
	.DB $35             				; F4
	.DB $21             				; C#3
	.DB $17             				; G2
	.DB $22             				; D3
	.DB $32             				; D4
	.DB $22             				; D3
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $22             				; D3
	.DB $35             				; F4
	.DB $22             				; D3
	.DB $34             				; E4
	.DB $20             				; C3
	.DB $34             				; E4
	.DB $20             				; C3
	.DB $32             				; D4
	.DB $35             				; F4
	.DB $32             				; D4
	.DB $35             				; F4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $EA             				; RETURN FROM SECTION

CREDITS_SONG_SQ_1_CH_DATA:				; CREDITS SQ1 CH DATA
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $E5,$81             			; ADJUST PITCH by: 129
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $E9             				; DO SECTION AT
	.WORD CREDITS_SONG_C_TO_G_SQ_CH_SECTION             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $14             				; E2
	.DB $E5,$00             			; ADJUST PITCH by: 0

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$1F             			; SET VOLUME ENVELOPE INDEX = 31
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $EF             				; TURN OFF TREMELO
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $E9             				; DO->CREDITS SQ 1 SECTION
	.WORD CREDITS_SONG_SQ_1_CH_SECTION             			;
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $E9             				; DO->CREDITS SQ 1 SECTION
	.WORD CREDITS_SONG_SQ_1_CH_SECTION             			;
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $35             				; F4
	.DB $EF             				; TURN OFF TREMELO
	.DB $E0,$2A             			; SET VOLUME ENVELOPE INDEX = 42
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $E5,$02             			; ADJUST PITCH by: 2
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$3C             			; SET VOLUME ENVELOPE INDEX = 60
	.DB $E9             				; DO->CREDITS SQ0,SQ1 SECTION
	.WORD CREDITS_SONG_SQ_CH_COMMON_SECTION             			;
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E9             				; DO->CREDITS SQ1 SECTION #2
	.WORD CREDITS_SONG_SQ_1_CH_SECTION_TWO             			;
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $39             				; A4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $39             				; A4
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $E9             				; DO->CREDITS SQ1 SECTION #2
	.WORD CREDITS_SONG_SQ_1_CH_SECTION_TWO             			;
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $39             				; A4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$3C             			; SET VOLUME ENVELOPE INDEX = 60
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$0B             			; SET VOLUME ENVELOPE INDEX = 11
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $20             				; C3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $1B             				; B2
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $22             				; D3
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $22             				; D3
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $17             				; G2
	.DB $22             				; D3
	.DB $17             				; G2
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $17             				; G2
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $17             				; G2
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$22             			; SET VOLUME ENVELOPE INDEX = 34
	.DB $E9             				; DO->CREDITS SQ1 SECTION #3
	.WORD CREDITS_SONG_SQ_1_CH_SECTION_THREE             			;
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $E9             				; DO->CREDITS SQ1 SECTION #3
	.WORD CREDITS_SONG_SQ_1_CH_SECTION_THREE             			;
	.DB $42             				; D5
	.DB $40             				; C5
	.DB $3A             				; A#4
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $E0,$3C             			; SET VOLUME ENVELOPE INDEX = 60
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$0B             			; SET VOLUME ENVELOPE INDEX = 11
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $15             				; F2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $E0,$09             			; SET VOLUME ENVELOPE INDEX = 9
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $15             				; F2
	.DB $15             				; F2
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $EF             				; TURN OFF TREMELO
	.DB $E0,$08             			; SET VOLUME ENVELOPE INDEX = 8
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $30             				; C4
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL 

CREDITS_SONG_TRI_CH_DATA:							; CREDITS TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1A             				; A#2
	.DB $1B             				; B2
	.DB $20             				; C3
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $20             				; C3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $1B             				; B2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1A             				; A#2
	.DB $1B             				; B2
	.DB $20             				; C3
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $20             				; C3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $1B             				; B2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $27             				; G3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $26             				; F#3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $25             				; F3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $26             				; F#3
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $27             				; G3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $22             				; D3
	.DB $27             				; G3
	.DB $22             				; D3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $24             				; E3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $17             				; G2
	.DB $18             				; G#2
	.DB $19             				; A2
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $1A             				; A#2
	.DB $1B             				; B2
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $1B             				; B2
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $1B             				; B2
	.DB $1B             				; B2
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $1B             				; B2
	.DB $20             				; C3
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $22             				; D3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $22             				; D3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $26             				; F#3
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $27             				; G3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $17             				; G2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $22             				; D3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $14             				; E2
	.DB $24             				; E3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $24             				; E3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $1B             				; B2
	.DB $12             				; D2
	.DB $22             				; D3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $12             				; D2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $19             				; A2
	.DB $10             				; C2
	.DB $20             				; C3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $20             				; C3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $25             				; F3

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1A             				; A#2
	.DB $1B             				; B2
	.DB $20             				; C3
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $20             				; C3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $1B             				; B2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $32             				; D4
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $30             				; C4
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $22             				; D3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $32             				; D4
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $17             				; G2
	.DB $0C             				; REST
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $30             				; C4
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $27             				; G3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $19             				; A2
	.DB $29             				; A3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $17             				; G2
	.DB $27             				; G3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $17             				; G2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $22             				; D3
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $15             				; F2
	.DB $25             				; F3
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $25             				; F3
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $25             				; F3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2A             				; A#3

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$47             			; SET VOLUME ENVELOPE INDEX = 71
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $12             				; D2
	.DB $13             				; D#2
	.DB $14             				; E2
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $15             				; F2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $15             				; F2
	.DB $15             				; F2
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $FF             				; END OF CHANNEL 

CREDITS_SONG_NOISE_CH_DATA:							; CREDITS NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ

	.DB $EB,$05             			; START LOOP AND LOOP 5 TIMES
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $66            				; SET NOISE FREQ = 13.9 kHZ/ 56hZ

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EB,$05             			; START LOOP AND LOOP 5 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $0C             				; REST
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EC             				;	 CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $F0             				; PLAY DMC "KICK DRUM HIGH FREQ"  
	.DB $0C             				; REST
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $F1             				;  PLAY DMC "KICK DRUM MID FREQ"  
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $F2             				; PLAY DMC "KICK DRUM LOW FREQ"  
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $0C             				; REST
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ

	.DB $EB,$05             			; START LOOP AND LOOP 5 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $0C             				; REST

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				;  PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FB             				; PLAY DMC 'BASS DRUM' 
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $0C             				; REST
	.DB $FC             				; PLAY DMC 'SNARE DRUM' 
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $FF             				; END OF CHANNEL 
	
_F}_SUPER_BOWL_CREDITS_SONG_DATA	

_F{_P1_PLAYOFFS_SONG_DATA						; DONE

 P1_PLAYOFF_SONG_CH_DATA_POINTERS:		; 0X3E P1 PLAYOFF MUSIC CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID            				; SQ MUSIC 0
	.WORD P1_PLAYOFF_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P1_PLAYOFF_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	
	.WORD P1_PLAYOFF_SONG_TRI_CH_DATA             			;
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	
	.WORD P1_PLAYOFF_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR 

P1_PLAYOFF_SONG_TRI_CH_DATA:							; P1 PLAYOFF TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $22             				; D3
	
	.DB $E9             				; DO->P1 PLAYOFF TRI SECTION
	.WORD P1_PLAYOFF_SONG_TRI_CH_SECTION             			;
	
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $22             				; D3
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $E9             				; DO->P1 PLAYOFF TRI SECTION
	.WORD P1_PLAYOFF_SONG_TRI_CH_SECTION             			;
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
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
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $0C             				; REST
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
	
P1_PLAYOFF_SONG_TRI_CH_LOOP:							; P1 PLAYOFF TRI DATA LOOP
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $0C             				; REST
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $24             				; E3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $0C             				; REST
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $0C             				; REST
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $0C             				; REST
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
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $22             				; D3
	.DB $0C             				; REST
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $22             				; D3
	.DB $0C             				; REST
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $1B             				; B2
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $1B             				; B2
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $1B             				; B2
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3##
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	
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
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $0C             				; REST
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
	.DB $E8             				; JUMP-> P1 PLAYOFF TRI DATA LOOP
	.WORD P1_PLAYOFF_SONG_TRI_CH_LOOP    ;

P1_PLAYOFF_SONG_TRI_CH_SECTION:			; P1 PLAYOFF TRI SECTION
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
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
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $22             				; D3
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
	.DB $EA             				; RETURN FROM SECTION

P1_PLAYOFF_SONG_SQ_1_CH_DATA:							; P1 PLAYOFF SQ1 DATA
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$02             			; SET VOLUME LEVEL TO 87%
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $17             				; G2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $18             				; G#2
	.DB $17             				; G2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $15             				; F2

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO ->P1 PLAYOFF SHORT SQ1 SECTION 
	.WORD P1_PLAYOFF_SONG_SQ_1_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $17             				; G2
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $ED,$05             			; TURN ON TREMELO USING TREMELO TYPE: 5
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $14             				; E2
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $16             				; F#2
	.DB $17             				; G2
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $19             				; A2
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $1B             				; B2
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $24             				; E3
	
P1_PLAYOFF_SONG_SQ_1_CH_LOOP:			; P1 PLAYOFF SQ 1 LOOP
	.DB $E0,$23             			; SET VOLUME ENVELOPE INDEX = 35

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $20             				; C3
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $20             				; C3
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $34             				; E4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $EF             				; TURN OFF TREMELO
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $3B             				; B4
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $3B             				; B4
	.DB $39             				; A4
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$23             			; SET VOLUME ENVELOPE INDEX = 35
	.DB $ED,$05             			; TURN ON TREMELO USING TREMELO TYPE: 5
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $24             				; E3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $20             				; C3
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $20             				; C3
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $34             				; E4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $EF             				; TURN OFF TREMELO
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $40             				; C5
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $E0,$23             			; SET VOLUME ENVELOPE INDEX = 35
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $29             				; A3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $29             				; A3
	.DB $ED,$05             			; TURN ON TREMELO USING TREMELO TYPE: 5
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $22             				; D3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $24             				; E3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $26             				; F#3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $2B             				; B3
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $2B             				; B3
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $27             				; G3
	.DB $28             				; G#3
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $29             				; A3
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $8C             				; SET NOTE LENGTH TO: 7/16
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $3B             				; B4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $39             				; A4
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $37             				; G4
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $39             				; A4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $36             				; F#4
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $ED,$05             			; TURN ON TREMELO USING TREMELO TYPE: 5
	.DB $E8             				; JUMP-> P1 PLAYOFF SQ 1 LOOP
	.WORD P1_PLAYOFF_SONG_SQ_1_CH_LOOP             			;

P1_PLAYOFF_SONG_SQ_1_CH_SECTION:		; P1 PLAYOFF SHORT SQ1 SECTION ONLY USED ONCE COULD REFACTOR
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $14             				; E2
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $0C             				; REST
	.DB $16             				; F#2
	.DB $0C             				; REST
	.DB $12             				; D2
	.DB $EA             				; RETURN FROM SECTION

P1_PLAYOFF_SONG_SQ_0_CH_DATA:							; P1 PLAYOFF SQ CH0 DATA
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$02             			; SET VOLUME LEVEL TO 87%
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $1A             				; A#2
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $29             				; A3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $2B             				; B3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $32             				; D4
	.DB $2B             				; B3
	.DB $32             				; D4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $37             				; G4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $37             				; G4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $36             				; F#4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $36             				; F#4
	.DB $32             				; D4
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $30             				; C4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $E3,$02             			; SET VOLUME LEVEL TO 87%
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E2,$B0             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4

P1_PLAYOFF_SONG_SQ_0_CH_LOOP:							; P1 PLAYOFF SQ CH0 LOOP	
    .DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $37             				; G4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $36             				; F#4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $2B             				; B3
	.DB $37             				; G4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $37             				; G4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $36             				; F#4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $2B             				; B3
	.DB $37             				; G4
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $37             				; G4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $36             				; F#4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $37             				; G4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $36             				; F#4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $37             				; G4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $37             				; G4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $38             				; G#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $39             				; A4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $39             				; A4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $37             				; G4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $38             				; G#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $39             				; A4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $34             				; E4
	.DB $37             				; G4
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $36             				; F#4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $34             				; E4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $36             				; F#4
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $3B             				; B4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $39             				; A4
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $37             				; G4
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $39             				; A4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $36             				; F#4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $29             				; A3
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $E8             				; JUMP-> P1 PLAYOFF SQ CH0 LOOP
	.WORD P1_PLAYOFF_SONG_SQ_0_CH_LOOP             			;

P1_PLAYOFF_SONG_NOISE_CH_DATA:							; P1 PLAYOFF NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$00             			; SET VOLUME LEVEL TO 100%
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $69            				; SET NOISE FREQ = 7043 HZ/ 22hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $66            				; SET NOISE FREQ = 13.9 kHZ/ 56hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

P1_PLAYOFF_SONG_NOISE_CH_LOOP:									; P1 PLAYOFF NOISE CH LOOP
	.DB $E0,$2C             			; SET VOLUME ENVELOPE INDEX = 44
	.DB $E3,$00             			; SET VOLUME LEVEL TO 100%
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO SECTION AT
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $69            				; SET NOISE FREQ = 7043 HZ/ 22hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $66            				; SET NOISE FREQ = 13.9 kHZ/ 56hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	
	.DB $E8             				; JUMP ->P1 PLAYOFF NOISE CH LOOP
	.WORD P1_PLAYOFF_SONG_NOISE_CH_LOOP ;

DRUM_SOUND_ONE_NOISE_CH_SECTION:							; DRUM SOUND 1 SECTION
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $69            				; SET NOISE FREQ = 7043 HZ/ 22hZ
	.DB $66            				; SET NOISE FREQ = 13.9 kHZ/ 56hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $EA             				; RETURN FROM SECTION

DRUM_SOUND_TWO_NOISE_CH_SECTION:							; DRUM SOUND 2 SECTION
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $6A           				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $EA             				; RETURN FROM SECTION
	
_F}_P1_PLAYOFFS_SONG_DATA	

_F{_P2_PLAYOFFS_SONG_DATA						; DONE

P2_PLAYOFF_SONG_CH_DATA_POINTERS:				; 0X3F P2 PLAYOFF MUSIC CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID            			; SQ MUSIC 0
	.WORD P2_PLAYOFF_SONG_SQ_0_CH_DATA             					;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P2_PLAYOFF_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD P2_PLAYOFF_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD P2_PLAYOFF_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

P2_PLAYOFF_SONG_TRI_CH_DATA:							; P2 PLAYOFF TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E0,$40             			; SET VOLUME ENVELOPE INDEX = 64

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
    .DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	
	.WORD A3_SLIDE_DOWN_TO_D3           ;
	.DB $EC             				; CHECK FOR END OF LOOP

P2_PLAYOFF_SONG_TRI_CH_LOOP:			; P2 PLAYOFF TRI CH LOOP
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $24             				; E3
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $24             				; E3
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3           ;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $24             				; E3
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3           ;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $25             				; F3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $25             				; F3
	
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3            ;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $20             				; C3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1B             				; B2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1B             				; B2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1B             				; B2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $1B             				; B2
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $19             				; A2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	.DB $E9             				; DO-> A3-D3 SLIDE DOWN WITH RESTS
	.WORD A3_SLIDE_DOWN_TO_D3             			;

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

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
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E8             				; JUMP->P2 PLAYOFF TRI CH LOOP
	.WORD P2_PLAYOFF_SONG_TRI_CH_LOOP             			;

A3_SLIDE_DOWN_TO_D3:					 ; A-D SLIDE DOWN WITH RESTS
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $EA             				; RETURN FROM SECTION

P2_PLAYOFF_SONG_SQ_1_CH_DATA:							; P2 PLAYOFF SQ1 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $22             				; D3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $20             				; C3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $1B             				; B2
	.DB $1B             				; B2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP

P2_PLAYOFF_SONG_SQ_1_CH_LOOP:									; P2 PLAYOFF SQ1 CH LOOP
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $29             				; A3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $19             				; A2
	.DB $18             				; G#2
	.DB $17             				; G2
	.DB $16             				; F#2
	.DB $15             				; F2
	.DB $14             				; E2
	.DB $13             				; D#2
	.DB $12             				; D2
	.DB $11             				; C#2
	.DB $10             				; C2
	.DB $0B             				; B1
	.DB $0A             				; A#1
	.DB $09             				; A1
	.DB $08             				; G#1
	.DB $07             				; G1
	.DB $06             				; F#1
	.DB $05             				; F1
	.DB $04             				; E1
	.DB $03             				; D#1
	.DB $02             				; D1
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $01             				; C#1
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $10             				; C2
	.DB $12             				; D2
	.DB $14             				; E2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $14             				; E2
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $10             				; C2
	.DB $12             				; D2
	.DB $14             				; E2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $14             				; E2
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $16             				; F#2
	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $24             				; E3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $1B             				; B2
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $EB,$02             			; 	START LOOP AND LOOP 2 TIMES

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $24             				; E3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $25             				; F3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $25             				; F3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $24             				; E3
	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $30             				; C4
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $29             				; A3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $19             				; A2
	.DB $18             				; G#2
	.DB $17             				; G2
	.DB $16             				; F#2
	.DB $15             				; F2
	.DB $14             				; E2
	.DB $13             				; D#2
	.DB $12             				; D2
	.DB $11             				; C#2
	.DB $10             				; C2
	.DB $0B             				; B1
	.DB $0A             				; A#1
	.DB $09             				; A1
	.DB $08             				; G#1
	.DB $07             				; G1
	.DB $06             				; F#1
	.DB $05             				; F1
	.DB $04             				; E1
	.DB $03             				; D#1
	.DB $02             				; D1
	.DB $01             				; C#1
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $00             				; C1
	.DB $E8             				; JUMP->P2 PLAYOFF SQ1 CH LOOP
	.WORD P2_PLAYOFF_SONG_SQ_1_CH_LOOP             			;

P2_PLAYOFF_SONG_SQ_0_CH_DATA:							; P2 PLAYOFF SQ0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $19             				; A2
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $17             				; G2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $16             				; F#2
	.DB $16             				; F#2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $EC             				; CHECK FOR END OF LOOP

P2_PLAYOFF_SONG_SQ_0_CH_LOOP:							; P2 PLAYOFF SQ0 CH LOOP
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $E5,$02             			; ADJUST PITCH by: 2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $19             				; A2
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $1B             				; B2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $1A             				; A#2
	.DB $19             				; A2
	.DB $18             				; G#2
	.DB $17             				; G2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $15             				; F2
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $19             				; A2
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES *** uneeded repeat
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1A             				; A#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $1B             				; B2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $1B             				; B2
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $16             				; F#2
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES *** uneeded repeat
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $1B             				; B2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8D             				; SET NOTE LENGTH TO: 15/32
	.DB $20             				; C3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $20             				; C3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $1B             				; B2
	.DB $EC             				; 	CHECK FOR END OF LOOP

	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E5,$02             			; ADJUST PITCH by: 2
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $30             				; C4
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $9A             				; SET NOTE LENGTH TO: 1 1/2
	.DB $29             				; A3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $19             				; A2
	.DB $18             				; G#2
	.DB $17             				; G2
	.DB $16             				; F#2
	.DB $15             				; F2
	.DB $14             				; E2
	.DB $13             				; D#2
	.DB $12             				; D2
	.DB $11             				; C#2
	.DB $10             				; C2
	.DB $0B             				; B1
	.DB $0A             				; A#1
	.DB $09             				; A1
	.DB $08             				; G#1
	.DB $07             				; G1
	.DB $06             				; F#1
	.DB $05             				; F1
	.DB $04             				; E1
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $03             				; D#1
	.DB $E8             				; JUMP->P2 PLAYOFF SQ0 CH LOOP
	.WORD P2_PLAYOFF_SONG_SQ_0_CH_LOOP             			;

P2_PLAYOFF_SONG_NOISE_CH_DATA:							; P2 PLAYOFF NOISE CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$2C             			; SET VOLUME ENVELOPE INDEX = 44
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $E9             				; DO->P2 PLAYOFF NOISE CH SECTION #1
	.WORD P2_PLAYOFF_SONG_NOISE_SECTION_ONE             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->P2 PLAYOFF NOISE CH SECTION #1
	.WORD P2_PLAYOFF_SONG_NOISE_SECTION_ONE   

P2_PLAYOFF_SONG_NOISE_CH_LOOP:			; P2 PLAYOFF NOISE CH LOOP	
     .DB $E0,$2C             			; SET VOLUME ENVELOPE INDEX = 44
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $E9             				; DO->P2 PLAYOFF NOISE CH SECTION #1
	.WORD P2_PLAYOFF_SONG_NOISE_SECTION_ONE             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->P2 PLAYOFF NOISE CH SECTION #1
	.WORD P2_PLAYOFF_SONG_NOISE_SECTION_ONE             			;
	.DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E8             				; JUMPB-> P2 PLAYOFF NOISE CH LOOP
	.WORD P2_PLAYOFF_SONG_NOISE_CH_LOOP             			;

P2_PLAYOFF_SONG_NOISE_SECTION_ONE:		; P2 PLAYOFF NOISE CH SECTION #1 
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $EA             				; RETURN FROM SECTION

_F}_P2_PLAYOFFS_SONG_DATA

_F{_P2_PROBOWL_SONG_DATA						; DONE

P2_PROBOWL_SONG_CH_DATA_POINTERS:							; 0X3D P2 PROBOWL MUSIC CHANNEL POINTERS
	.DB SQ_0_MUSIC_CH_ID            				; SQ MUSIC 0
	.WORD P2_PROBOWL_SONG_SQ_0_CH_DATA              			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P2_PROBOWL_SONG_SQ_1_CH_DATA              			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD P2_PROBOWL_SONG_TRI_CH_DATA              			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD P2_PROBOWL_SONG_NOISE_CH_DATA              			;
	.DB $FF             				; END OF CHANNEL ADDR

P2_PROBOWL_SONG_TRI_CH_DATA :							; P2 PROBOWL TRI CH DATA
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $E0,$40             			; SET VOLUME ENVELOPE INDEX = 64
	
P2_PROBOWL_SONG_TRI_CH_LOOP:			; P2 PROBOWL TRI CH LOOP
     .DB $E9             				; DO ->P2 PROBOWL TRI SECTION 1
	.WORD P2_PROBOWL_SONG_TRI_SECTION_ONE             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $0C             				; REST

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E9             				; DO ->P2 PROBOWL TRI SECTION 1
	.WORD P2_PROBOWL_SONG_TRI_SECTION_ONE             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $22             				; D3
	.DB $0C             				; REST
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $0C             				; REST
	.DB $E8             				; JUMP->P2 PROBOWL TRI CH LOOP
	.WORD P2_PROBOWL_SONG_TRI_CH_LOOP             			;

P2_PROBOWL_SONG_TRI_SECTION_ONE:		; P2 PROBOWL TRI SECTION 1
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $19             				; A2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $E0,$40             			; SET VOLUME ENVELOPE INDEX = 64
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $19             				; A2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $19             				; A2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $17             				; G2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $15             				; F2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $E0,$40             			; SET VOLUME ENVELOPE INDEX = 64
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $15             				; F2
	.DB $15             				; F2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $15             				; F2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $15             				; F2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $14             				; E2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $E0,$40             			; SET VOLUME ENVELOPE INDEX = 64
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $E9             				; DO ->A3 TO E3 SLIDE  
	.WORD A3_SLIDE_DOWN_TO_E3             			;
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $EA             				; RETURN FROM SECTION

A3_SLIDE_DOWN_TO_E3:							; A3 TO E3 SLIDE  
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $29             				; A3
	.DB $0C             				; REST
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $24             				; E3
	.DB $23             				; D#3
	.DB $24             				; E3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $EA             				; RETURN FROM SECTION

P2_PROBOWL_SONG_SQ_0_CH_DATA:							; P2 PROBOWL SQ CH 0 DATA
	.DB $E0,$0B             			; SET VOLUME ENVELOPE INDEX = 11
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $EF             				; TURN OFF TREMELO
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	
P2_PROBOWL_SONG_SQ_0_CH_LOOP:			; P2 PROBOWL SQ CH 0 LOOP

    .DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $27             				; G3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $29             				; A3
	
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $34             				; E4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $29             				; A3
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $23             				; D#3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $25             				; F3
	
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $27             				; G3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $29             				; A3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $24             				; E3
	
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $34             				; E4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $2A             				; A#3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $30             				; C4
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $34             				; E4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $37             				; G4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $35             				; F4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $35             				; F4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $2B             				; B3
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $25             				; F3
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $27             				; G3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $29             				; A3
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $2B             				; B3
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $39             				; A4
	.DB $37             				; G4
	.DB $35             				; F4
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $34             				; E4
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $39             				; A4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $3A             				; A#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $91             				; SET NOTE LENGTH TO: 21/32
	.DB $3B             				; B4
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $39             				; A4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $38             				; G#4
	.DB $36             				; F#4
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $38             				; G#4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $37             				; G4
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
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $28             				; G#3
	.DB $E8             				; JUMP->P2 PROBOWL SQ CH 0 LOOP
	.WORD P2_PROBOWL_SONG_SQ_0_CH_LOOP  ;

P2_PROBOWL_SONG_SQ_1_CH_DATA :			; P2 PROBOWL SQ CH 1 DATA
	.DB $E0,$0B             			; SET VOLUME ENVELOPE INDEX = 11
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $92             				; SET NOTE LENGTH TO: 3/4
	.DB $0B             				; B1
	.DB $12             				; D2
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	
P2_PROBOWL_SONG_SQ_1_CH_LOOP:			; P2 PROBOWL SQ CH 1 LOOP
	
    .DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $17             				; G2
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $19             				; A2
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $17             				; G2
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $19             				; A2
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $17             				; G2
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $19             				; A2
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $17             				; G2
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $19             				; A2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $17             				; G2
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $19             				; A2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	.DB $17             				; G2
	.DB $15             				; F2
	.DB $14             				; E2
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $17             				; G2
	.DB $EC             				; CHECK FOR END OF LOOP
	
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $17             				; G2
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $17             				; G2
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $17             				; G2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $1B             				; B2
	.DB $19             				; A2
	.DB $EF             				; TURN OFF TREMELO
	
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $17             				; G2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $17             				; G2
	.DB $15             				; F2
	.DB $14             				; E2
	.DB $12             				; D2

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $13             				; D#2
	.DB $14             				; E2
	.DB $F4             				; TURN OFF NOTE BLENDING
	
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $15             				; F2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $13             				; D#2
	.DB $14             				; E2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $15             				; F2
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $13             				; D#2
	.DB $14             				; E2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $15             				; F2
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $13             				; D#2
	.DB $14             				; E2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $15             				; F2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $19             				; A2
	.DB $17             				; G2
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $13             				; D#2
	.DB $14             				; E2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $15             				; F2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $15             				; F2
	.DB $14             				; E2
	.DB $12             				; D2
	.DB $10             				; C2

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $12             				; D2
	.DB $13             				; D#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $14             				; E2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $12             				; D2
	.DB $13             				; D#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $14             				; E2
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $12             				; D2
	.DB $13             				; D#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $14             				; E2
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $12             				; D2
	.DB $13             				; D#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $14             				; E2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $17             				; G2
	.DB $15             				; F2
	.DB $EF             				; TURN OFF TREMELO
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $12             				; D2
	.DB $13             				; D#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $ED,$08             			; TURN ON TREMELO USING TREMELO TYPE: 8
	.DB $8A             				; SET NOTE LENGTH TO: 5/16
	.DB $14             				; E2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $14             				; E2
	.DB $15             				; F2
	.DB $16             				; F#2
	.DB $17             				; G2
	.DB $E8             				; JUMP->P2 PROBOWL SQ CH 1 LOOP
	.WORD P2_PROBOWL_SONG_SQ_1_CH_LOOP             			;

P2_PROBOWL_SONG_NOISE_CH_DATA :							; P2 PROBOWL NOISE CH DATA
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION       ;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

P2_PROBOWL_SONG_NOISE_CH_LOOP:			; P2 PROBOWL NOISE CH LOOP
    .DB $E9             				; DO-> P2 PROBOWL NOISE CHANNEL SECTION
	.WORD P2_PROBOWL_SONG_NOISE_CH_SECTION             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $69            				; SET NOISE FREQ = 7043 HZ/ 22hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $69            				; SET NOISE FREQ = 7043 HZ/ 22hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO-> P2 PROBOWL NOISE CHANNEL SECTION
	.WORD P2_PROBOWL_SONG_NOISE_CH_SECTION             			;
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;

	.DB $EB,$05             			; START LOOP AND LOOP 5 TIMES
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E8             				; JUMP->P2 PROBOWL NOISE CH LOOP
	.WORD P2_PROBOWL_SONG_NOISE_CH_LOOP             			;

P2_PROBOWL_SONG_NOISE_CH_SECTION:									; P2 PROBOWL NOICE CHANNEL SECTION
	.DB $E0,$2C             			; SET VOLUME ENVELOPE INDEX = 44
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $65            					; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $63             				; SET NOISE FREQ = 55.9 kHZ/ 397hZ
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 5 SECTION
	.WORD DRUM_SOUND_FIVE_SECTION             			;
	.DB $E9             				; DO->DRUM SOUND 4 SECTION
	.WORD DRUM_SOUND_FOUR_SECTION        ;
	.DB $EA             				; RETURN FROM SECTION

DRUM_SOUND_THREEE_SECTION_UNUSED:		; DRUM SOUND 3 SECTION *** unused? 
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $69            				; SET NOISE FREQ = 7043 HZ/ 22hZ
	.DB $66            				; SET NOISE FREQ = 13.9 kHZ/ 56hZ
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $EA             				; RETURN FROM SECTION

DRUM_SOUND_FOUR_SECTION:				; DRUM SOUND 4 SECTION
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ = 7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $6A           				    ; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $64             				; SET NOISE FREQ = 27.9 kHZ/ 132hZ
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $EA             				; RETURN FROM SECTION

DRUM_SOUND_FIVE_SECTION:				; DRUM SOUND 5 SECTION
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6E             				; SET NOISE FREQ = 879 HZ/ 1hZ
	.DB $6B             				; SET NOISE FREQ = 3521 HZ/ 10hZ
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $0C             				; REST
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $EA             				; RETURN FROM SECTION

DRUM_SOUND_SIX_SECTION_UNUSED:			; DRUM SOUND 6 SECTION
	.DB $E0,$37             			; SET VOLUME ENVELOPE INDEX = 55
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $6A           				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $65            				; SET NOISE FREQ = 18.6 kHZ/ 67hZ
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $0C             				; REST
	.DB $E0,$36             			; SET VOLUME ENVELOPE INDEX = 54
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $EA             				; RETURN FROM SECTION
	
_F}_P2_PROBOWL_SONG_DATA	

_F{_P1_SEASON_SONG_DATA							; DONE

P1_SEASON_SONG_CH_DATA_POINTERS:				; 0X40 P1 SEASON MUSIC CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID            				; SQ MUSIC 0
	.WORD P1_SEASON_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P1_SEASON_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD P1_SEASON_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD P1_SEASON_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

P1_SEASON_SONG_SQ_0_CH_DATA:							; P1 SEASON SQ0 CH DATA
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $22             				; D3
	
P1_SEASON_SONG_SQ_0_CH_LOOP:							; P1 SEASON SQ0 CH LOOP	
       .DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $28             				; G#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $29             				; A3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $28             				; G#3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $33             				; D#4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $29             				; A3
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $28             				; G#3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $28             				; G#3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $29             				; A3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $33             				; D#4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $37             				; G4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $37             				; G4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $39             				; A4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $37             				; G4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $36             				; F#4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $37             				; G4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $36             				; F#4
	.DB $34             				; E4
	.DB $32             				; D4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $31             				; C#4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $31             				; C#4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $28             				; G#3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $2B             				; B3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $30             				; C4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $34             				; E4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $30             				; C4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $35             				; F4
	.DB $39             				; A4
	.DB $35             				; F4
	.DB $30             				; C4
	.DB $30             				; C4
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E8             				; JUMP->P1 SEASON SQ0 CH LOOP
	.WORD P1_SEASON_SONG_SQ_0_CH_LOOP             			;

P1_SEASON_SONG_SQ_1_CH_DATA:							; P1 SEASON SQ1 CH DATA
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $1B             				; B2
	.DB $19             				; A2
	
P1_SEASON_SONG_SQ_1_CH_LOOP:							; P1 SEASON SQ1 CH LOOP
       .DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $19             				; A2
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $20             				; C3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $17             				; G2
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $19             				; A2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $17             				; G2
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $19             				; A2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $19             				; A2
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $20             				; C3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $22             				; D3
	.DB $20             				; C3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $17             				; G2
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $19             				; A2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $0C             				; REST
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $1B             				; B2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $23             				; D#3
	.DB $1B             				; B2
	.DB $10             				; C2
	.DB $25             				; F3
	.DB $20             				; C3
	.DB $19             				; A2
	.DB $15             				; F2
	.DB $20             				; C3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $25             				; F3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $1B             				; B2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $23             				; D#3
	.DB $1B             				; B2
	.DB $10             				; C2
	.DB $25             				; F3
	.DB $20             				; C3
	.DB $19             				; A2
	.DB $15             				; F2
	.DB $20             				; C3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $25             				; F3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $93             				; SET NOTE LENGTH TO: 27/32
	.DB $1B             				; B2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $23             				; D#3
	.DB $1B             				; B2
	.DB $10             				; C2
	.DB $25             				; F3
	.DB $20             				; C3
	.DB $19             				; A2
	.DB $15             				; F2
	.DB $20             				; C3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $25             				; F3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $23             				; D#3
	.DB $1B             				; B2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $25             				; F3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $19             				; A2
	.DB $25             				; F3
	.DB $17             				; G2
	.DB $17             				; G2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E8             				; JUMP->P1 SEASON  SQ1 CH LOOP
	.WORD P1_SEASON_SONG_SQ_1_CH_LOOP             			;

P1_SEASON_SONG_TRI_CH_DATA:				; P1 SEASON TRI CH DATA
	.DB $E0,$41             			; SET VOLUME ENVELOPE INDEX = 65
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $19             				; A2
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
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $0C             				; REST
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP  
	;
P1_SEASON_SONG_TRI_CH_LOOP:				; P1 SEASON TRI CH LOOP
       .DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $20             				; C3
	.DB $17             				; G2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $22             				; D3
	.DB $17             				; G2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $20             				; C3
	.DB $17             				; G2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $20             				; C3
	.DB $17             				; G2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $22             				; D3
	.DB $17             				; G2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $20             				; C3
	.DB $17             				; G2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $1B             				; B2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $25             				; F3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $25             				; F3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $25             				; F3
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $25             				; F3
	.DB $2B             				; B3
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $1B             				; B2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $25             				; F3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $25             				; F3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $25             				; F3
	.DB $30             				; C4
	.DB $20             				; C3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $25             				; F3
	.DB $1B             				; B2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $0C             				; REST
	.DB $1B             				; B2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $19             				; A2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1B             				; B2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $20             				; C3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $20             				; C3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
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
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $0C             				; REST

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E8             				; JUMP->P1 SEASON TRI CH LOOP
	.WORD P1_SEASON_SONG_TRI_CH_LOOP             			;

P1_SEASON_SONG_NOISE_CH_DATA:							; P1 SEASON NOISE CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$2C             			; SET VOLUME ENVELOPE INDEX = 44
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
       .DB $5F             				; SET NOISE FREQ =7043 HZ/ 22Hz
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $6A           				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

P1_SEASON_SONG_NOISE_CH_LOOP:							; P1 SEASON NOISE CH LOOP
	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO SECTION AT
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$0F             			; START LOOP AND LOOP 15 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $6A           				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E8             				; JUMP->P1 SEASON NOISE CH LOOP
	.WORD P1_SEASON_SONG_NOISE_CH_LOOP             			;
	
_F}_P1_SEASON_SONG_DATA

FAST_SLIDE_FROM_A3_TO_D3_SHARP_DUPLICATE:							        ; SLIDE DOWN A3 TO D3# SAME AS BC4E COULD BE REFACTORED
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
	.DB $EA             				; RETURN FROM SECTION

_F{_P1_PRESEASON_SONG_DATA						; DONE

P1_PRESEASON_SONG_CH_DATA_POINTERS:		; 0X42 P1 PRE-SEASON MUSIC CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID            				; SQ MUSIC 0
	.WORD P1_PRESEASON_SONG_SQ_0_CH_DATA            			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P1_PRESEASON_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD P1_PRESEASON_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD P1_PRESEASON_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

P1_PRESEASON_SONG_SQ_0_CH_DATA:			; P1 PRE-SEASON SQ0 CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #1
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_ONE             			;
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #2
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_TWO             			;
	.DB $04             				; E1
	.DB $09             				; A1
	.DB $13             				; D#2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $10             				; C2
	.DB $11             				; C#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $12             				; D2
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $10             				; C2
	.DB $0B             				; B1
	.DB $09             				; A1
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #1
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_ONE             			;
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #2
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_TWO             			;
	.DB $EF             				; TURN OFF TREMELO
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $33             				; D#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $34             				; E4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $34             				; E4
	.DB $33             				; D#4
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $28             				; G#3
	.DB $E0,$38             			; SET VOLUME ENVELOPE INDEX = 56
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $ED,$00             			; TURN ON TREMELO USING TREMELO TYPE: 0
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #3
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_THREE             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $32             				; D4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $32             				; D4
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $30             				; C4
	.DB $29             				; A3
	.DB $30             				; C4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $33             				; D#4
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $34             				; E4
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $34             				; E4
	.DB $EF             				; TURN OFF TREMELO
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $33             				; D#4
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $32             				; D4
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $31             				; C#4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $30             				; C4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
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
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $19             				; A2
	.DB $18             				; G#2
	.DB $17             				; G2
	.DB $16             				; F#2
	.DB $15             				; F2
	.DB $14             				; E2
	.DB $13             				; D#2
	.DB $12             				; D2
	.DB $11             				; C#2
	.DB $10             				; C2
	.DB $0B             				; B1
	.DB $0A             				; A#1
	.DB $09             				; A1
	.DB $08             				; G#1
	.DB $07             				; G1
	.DB $06             				; F#1
	.DB $05             				; F1
	.DB $04             				; E1
	.DB $03             				; D#1
	.DB $02             				; D1
	.DB $01             				; C#1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $00             				; C1
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $00             				; C1
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #3
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_THREE             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $37             				; G4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $37             				; G4
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $37             				; G4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $38             				; G#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $39             				; A4
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $37             				; G4
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $38             				; G#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $39             				; A4
	.DB $EF             				; TURN OFF TREMELO
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $E3,$0B             			; SET VOLUME LEVEL TO 27%
	.DB $37             				; G4
	.DB $39             				; A4
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $49             				; A5
	.DB $48             				; G#5
	.DB $47             				; G5
	.DB $46             				; F#5
	.DB $45             				; F5
	.DB $44             				; E5
	.DB $43             				; D#5
	.DB $42             				; D5
	.DB $41             				; C#5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $3A             				; A#4
	.DB $39             				; A4
	.DB $38             				; G#4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $35             				; F4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $34             				; E4
	.DB $E8             				; JUMP ->P1 PRE-SEASON SQ0 CH DATA
	.WORD P1_PRESEASON_SONG_SQ_0_CH_DATA             			;

P1_PRESEASON_SONG_SQ_CH_SECTION_ONE:							; P1 PRESEASON SQ CH SECTION #1

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $17             				; G2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $17             				; G2
	.DB $19             				; A2
	.DB $20             				; C3
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $21             				; C#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $8E             				; SET NOTE LENGTH TO: 1/2
	.DB $22             				; D3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $20             				; C3
	.DB $EA             				; RETURN FROM SECTION

P1_PRESEASON_SONG_SQ_CH_SECTION_TWO:							; P1 PRESEASON SQ CH SECTION #2
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $17             				; G2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $88             				; SET NOTE LENGTH TO: 1/4
	.DB $17             				; G2
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $EA             				; RETURN FROM SECTION

P1_PRESEASON_SONG_SQ_CH_SECTION_THREE:							; P1 PRESEASON SQ CH SECTION #3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $36             				; F#4
	.DB $37             				; G4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $37             				; G4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $37             				; G4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $35             				; F4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $35             				; F4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $35             				; F4
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $33             				; D#4
	.DB $34             				; E4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $34             				; E4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $34             				; E4
	.DB $EA             				; RETURN FROM SECTION

P1_PRESEASON_SONG_SQ_1_CH_DATA:			; P1 PRE-SEASON SQ1 CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	
P1_PRESEASON_SONG_SQ_1_CH_LOOP:									; P1 PRE-SEASON SQ1 CH LOOP
    .DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $E0,$3A             			; SET VOLUME ENVELOPE INDEX = 58
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $89             				; SET NOTE LENGTH TO: 9/32

	.DB $EB,$18             			; START LOOP AND LOOP 24 TIMES
	.DB $19             				; A2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $14             				; E2
	.DB $19             				; A2
	.DB $23             				; D#3
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $22             				; D3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $19             				; A2

	.DB $EB,$18             			; START LOOP AND LOOP 24 TIMES
	.DB $19             				; A2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $9F             				; SET NOTE LENGTH TO: 2 1/4
	.DB $14             				; E2
	.DB $E0,$38             			; SET VOLUME ENVELOPE INDEX = 56
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #3
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_THREE             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $32             				; D4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $32             				; D4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $32             				; D4
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #1
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_ONE             			;
	.DB $E0,$38             			; SET VOLUME ENVELOPE INDEX = 56
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $E2,$70             			; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E5,$01             			; ADJUST PITCH by: 1
	.DB $8B             				; SET NOTE LENGTH TO: 3/8
	.DB $0C             				; REST
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #3
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_THREE             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $37             				; G4
	.DB $37             				; G4
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $37             				; G4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $37             				; G4
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $E0,$3A             			; SET VOLUME ENVELOPE INDEX = 58
	.DB $E9             				; DO->P1 PRESEASON SQ CH SECTION #2
	.WORD P1_PRESEASON_SONG_SQ_CH_SECTION_TWO             			;
	.DB $E3,$0C             			; SET VOLUME LEVEL TO 20%
	.DB $E5,$02             			; ADJUST PITCH by: 2
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $0C             				; REST
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $E3,$0D             			; SET VOLUME LEVEL TO 14%
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $E0,$35             			; SET VOLUME ENVELOPE INDEX = 53
	.DB $EF             				; TURN OFF TREMELO
	.DB $E3,$09             			; SET VOLUME LEVEL TO 40%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $49             				; A5
	.DB $48             				; G#5
	.DB $47             				; G5
	.DB $46             				; F#5
	.DB $45             				; F5
	.DB $44             				; E5
	.DB $43             				; D#5
	.DB $42             				; D5
	.DB $41             				; C#5
	.DB $40             				; C5
	.DB $3B             				; B4
	.DB $3A             				; A#4
	.DB $39             				; A4
	.DB $38             				; G#4
	.DB $37             				; G4
	.DB $36             				; F#4
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $35             				; F4
	.DB $E5,$00             			; ADJUST PITCH by: 0
	.DB $E8             				; JUMP->P1 PRE-SEASON SQ1 CH LOOP
	.WORD P1_PRESEASON_SONG_SQ_1_CH_LOOP             			;

P1_PRESEASON_SONG_TRI_CH_DATA:							; P1 PRE-SEASON TRI CH DATA
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	
P1_PRESEASON_SONG_TRI_CH_LOOP:							; P1 PRE-SEASON TRI CH LOOP
       .DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $14             				; E2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $22             				; D3
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2

	.DB $EB,$06             			; START LOOP AND LOOP 6 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E0,$46             			; SET VOLUME ENVELOPE INDEX = 70
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $24             				; E3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $0C             				; REST
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $E0,$43             			; SET VOLUME ENVELOPE INDEX = 67
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $27             				; G3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $27             				; G3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $20             				; C3
	.DB $22             				; D3

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $27             				; G3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $27             				; G3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $0C             				; REST
	.DB $E9             				; DO->SLIDE DOWN D4 TO F3
	.WORD FAST_SLIDE_FROM_D4_TO_F3             			;
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $E8             				; JUMP->P1 PRE-SEASON TRI CH LOOP
	.WORD P1_PRESEASON_SONG_TRI_CH_LOOP             			;

FAST_SLIDE_FROM_A3_TO_D3_SHARP:			; SLIDE DOWN A3 TO D3#
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

P1_PRESEASON_SONG_NOISE_CH_DATA:		; P1 PRE-SEASON NOISE CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$2C             			; SET VOLUME ENVELOPE INDEX = 44
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	
P1_PRESEASON_SONG_NOISE_CH_LOOP:									; P1 PRE-SEASON NOISE CH LOOP

    .DB $EB,$07             			; START LOOP AND LOOP 7 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $0C             				; REST

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $6A           				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300Hz

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->DRUM SOUND 1 SECTION
	.WORD DRUM_SOUND_ONE_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $61             				; SET NOISE FREQ = 223 kHZ/ 2300hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $62             				; SET NOISE FREQ = 111 kHZ/ 903hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $0C             				; REST
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $6A           				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $E8             				; JUMP-> P1 PRE-SEASON NOISE CH LOOP
	.WORD P1_PRESEASON_SONG_NOISE_CH_LOOP             			;

_F}_P1_PRESEASON_SONG_DATA

_F{_P2_PRESEASON_SONG_DATA						; DONE

P2_PRESEASON_SONG_CH_DATA_POINTERS:							; 0X43 P2 PRE-SEASON MUSIC CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID            				; SQ MUSIC 0
	.WORD P2_PRESEASON_SONG_SQ_0_CH_DATA             			;
	
	.DB SQ_1_MUSIC_CH_ID             				; SQ MUSIC 1
	.WORD P2_PRESEASON_SONG_SQ_1_CH_DATA             			;
	
	.DB TRI_MUSIC_CH_ID             				; TRI MUSIC
	.WORD P2_PRESEASON_SONG_TRI_CH_DATA             			;
	
	.DB NOISE_MUSIC_CH_ID             				; NOISE MUSIC
	.WORD P2_PRESEASON_SONG_NOISE_CH_DATA             			;
	.DB $FF             				; END OF CHANNEL ADDR

P2_PRESEASON_SONG_SQ_0_CH_DATA:							; P2 PRE-SEASON SQ0 CH DATA
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	
P2_PRESEASON_SONG_SQ_0_CH_LOOP:							; P2 PRE-SEASON SQ0 CH LOOP
    .DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $E9             				; DO->P2 PRESEASON SQ 0 SECTION #1
	.WORD P2_PRESEASON_SONG_SQ_0_CH_SECTION_ONE             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $21             				; C#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $26             				; F#3
	.DB $22             				; D3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $E9             				; DO->P2 PRESEASON SQ 0 SECTION #2
	.WORD P2_PRESEASON_SONG_SQ_0_CH_SECTION_TWO             			;
	.DB $E9             				; DO->P2 PRESEASON SQ 0 SECTION #1
	.WORD P2_PRESEASON_SONG_SQ_0_CH_SECTION_ONE             			;
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $21             				; C#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $26             				; F#3
	.DB $22             				; D3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $24             				; E3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $EF             				; TURN OFF TREMELO
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $1B             				; B2
	.DB $20             				; C3
	.DB $21             				; C#3
	.DB $22             				; D3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $23             				; D#3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $24             				; E3
	.DB $EF             				; TURN OFF TREMELO
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $19             				; A2
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $17             				; G2
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $E3,$04             			; SET VOLUME LEVEL TO 74%
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $24             				; E3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $29             				; A3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $29             				; A3
	.DB $2B             				; B3
	.DB $29             				; A3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $2A             				; A#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $96             				; SET NOTE LENGTH TO: 1
	.DB $2B             				; B3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $30             				; C4
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $2B             				; B3
	.DB $30             				; C4
	.DB $2B             				; B3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $27             				; G3
	.DB $29             				; A3
	.DB $27             				; G3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $90             				; SET NOTE LENGTH TO: 5/8
	.DB $26             				; F#3
	.DB $EF             				; TURN OFF TREMELO
	.DB $86             				; SET NOTE LENGTH TO: 3/16
	.DB $26             				; F#3
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $25             				; F3
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $24             				; E3
	.DB $83             				; SET NOTE LENGTH TO: 3/32
	.DB $23             				; D#3
	.DB $82             				; SET NOTE LENGTH TO: 1/16
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $19             				; A2
	.DB $18             				; G#2
	.DB $17             				; G2
	.DB $16             				; F#2
	.DB $15             				; F2
	.DB $14             				; E2
	.DB $13             				; D#2
	.DB $12             				; D2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $11             				; C#2
	.DB $E3,$07             			; SET VOLUME LEVEL TO 54%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $24             				; E3
	.DB $25             				; F3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $26             				; F#3
	.DB $E3,$05             			; SET VOLUME LEVEL TO 67%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $E3,$02             			; SET VOLUME LEVEL TO 87%
	.DB $26             				; F#3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $E8             				; JUMP->P2 PRE-SEASON SQ0 CH LOOP
	.WORD P2_PRESEASON_SONG_SQ_0_CH_LOOP             			;

P2_PRESEASON_SONG_SQ_0_CH_SECTION_TWO:							; P2 PRESEASON SQ 0 SECTION #2
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $22             				; D3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $EF             				; TURN OFF TREMELO
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $1B             				; B2
	.DB $20             				; C3
	.DB $21             				; C#3
	.DB $22             				; D3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $23             				; D#3
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $EF             				; TURN OFF TREMELO
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $23             				; D#3
	.DB $22             				; D3
	.DB $21             				; C#3
	.DB $20             				; C3
	.DB $1B             				; B2
	.DB $1A             				; A#2
	.DB $19             				; A2
	.DB $18             				; G#2
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $17             				; G2
	.DB $EA             				; RETURN FROM SECTION

P2_PRESEASON_SONG_SQ_0_CH_SECTION_ONE:							; P2 PRESEASON SQ 0 SECTION #1
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $23             				; D#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $27             				; G3
	.DB $24             				; E3
	.DB $29             				; A3
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $84             				; SET NOTE LENGTH TO: 1/8
	.DB $26             				; F#3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $85             				; SET NOTE LENGTH TO: 5/32
	.DB $27             				; G3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $26             				; F#3
	.DB $E9             				; DO->P2 PRESEASON SQ 0 SECTION #2
	.WORD P2_PRESEASON_SONG_SQ_0_CH_SECTION_TWO             			;
	.DB $EA             				; RETURN FROM SECTION

P2_PRESEASON_SONG_SQ_1_CH_DATA:			; P2 PRE-SEASON SQ1 CH DATA
	.DB $E2,$F0             			; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST

	.DB $EB,$10             			; START LOOP AND LOOP 16 TIMES
	.DB $14             				; E2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$08             			; START LOOP AND LOOP 8 TIMES
	.DB $12             				; D2
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $07             				; G1
	.DB $06             				; F#1
	.DB $EB,$10             			; START LOOP AND LOOP 16 TIMES
	.DB $14             				; E2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$08             			; START LOOP AND LOOP 8 TIMES
	.DB $12             				; D2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $09             				; A1
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $09             				; A1
	.DB $07             				; G1
	.DB $06             				; F#1
	.DB $E0,$21             			; SET VOLUME ENVELOPE INDEX = 33
	.DB $8F             				; SET NOTE LENGTH TO: 9/16
	.DB $14             				; E2
	.DB $E0,$20             			; SET VOLUME ENVELOPE INDEX = 32
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $14             				; E2
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $12             				; D2
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $0B             				; B1
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$39             			; SET VOLUME ENVELOPE INDEX = 57
	.DB $E5,$02             			; ADJUST PITCH by: 2
	.DB $E3,$08             			; SET VOLUME LEVEL TO 47%
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $21             				; C#3
	.DB $22             				; D3
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $87             				; SET NOTE LENGTH TO: 7/32
	.DB $23             				; D#3
	.DB $E3,$06             			; SET VOLUME LEVEL TO 60%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $23             				; D#3
	.DB $E3,$03             			; SET VOLUME LEVEL TO 80%
	.DB $23             				; D#3
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $0C             				; REST
	.DB $E8             				; JUMP-> P2 PRE-SEASON SQ1 CH DATA
	.WORD P2_PRESEASON_SONG_SQ_1_CH_DATA             			;

P2_PRESEASON_SONG_TRI_CH_DATA:							; P2 PRE-SEASON TRI CH DATA
	.DB $E0,$44             			; SET VOLUME ENVELOPE INDEX = 68
	.DB $E2,$80             			; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $ED,$01             			; TURN ON TREMELO USING TREMELO TYPE: 1
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	
P2_PRESEASON_SONG_TRI_CH_LOOP:			; P2 PRE-SEASON TRI CH LOOP

    .DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $19             				; A2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $19             				; A2

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$04             			; START LOOP AND LOOP 4 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $19             				; A2
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $19             				; A2
	.DB $E9             				; DO->SLIDE DOWN D4 TO F3
	.WORD FAST_SLIDE_FROM_D4_TO_F3             			;
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $24             				; E3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $24             				; E3

	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $22             				; D3
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $22             				; D3
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $1B             				; B2
	.DB $1B             				; B2
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $1B             				; B2
	.DB $EC             				; CHECK FOR END OF LOOP

	.DB $1B             				; B2
	.DB $E9             				; DO->SLIDE DOWN D4 TO F3
	.WORD FAST_SLIDE_FROM_D4_TO_F3             			;
	.DB $E9             				; DO->SLIDE DOWN A3 TO D3#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP             			;
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $0C             				; REST
	.DB $E8             				; JUMP -> P2 PRE-SEASON TRI CH LOOP
	.WORD P2_PRESEASON_SONG_TRI_CH_LOOP             			;

FAST_SLIDE_FROM_D4_TO_F3:				; SLIDE DOWN D4 TO F3
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $0C             				; REST
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $30             				; C4
	.DB $32             				; D4
	.DB $31             				; C#4
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $30             				; C4
	.DB $0C             				; REST
	.DB $2B             				; B3
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $0C             				; REST
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $2B             				; B3
	.DB $0C             				; REST
	.DB $2A             				; A#3
	.DB $29             				; A3
	.DB $28             				; G#3
	.DB $27             				; G3
	.DB $26             				; F#3
	.DB $25             				; F3
	.DB $0C             				; REST
	.DB $EA             				; RETURN FROM SECTION

P2_PRESEASON_SONG_NOISE_CH_DATA:		; P2 PRE-SEASON NOISE CH DATA
	.DB $E2,$30             			; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$2C             			; SET VOLUME ENVELOPE INDEX = 44
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	
P2_PRESEASON_SONG_NOISE_CH_LOOP:							; P2 PRE-SEASON NOISE CH LOOP
       .DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $EB,$02             			; START LOOP AND LOOP 2 TIMES
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $6A           				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $0C             				; REST
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $0C             				; REST
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $E3,$0A             			; SET VOLUME LEVEL TO 34%
	.DB $89             				; SET NOTE LENGTH TO: 9/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $F3             				; TURN ON NOTE BLENDING
	.DB $81             				; SET NOTE LENGTH TO: 1/32
	.DB $5F             				; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D             				; SET NOISE FREQ = 1760 HZ/ 1hZ
	.DB $F4             				; TURN OFF NOTE BLENDING
	.DB $6A           				; SET NOISE FREQ = 4707 HZ/ 15hZ
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $EB,$03             			; START LOOP AND LOOP 3 TIMES
	.DB $E9             				; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION             			;
	.DB $EC             				; CHECK FOR END OF LOOP
	.DB $97             				; SET NOTE LENGTH TO: 1 1/8
	.DB $0C             				; REST
	.DB $E8             				; JUMP ->P2 PRE-SEASON NOISE CH LOOP
	.WORD P2_PRESEASON_SONG_NOISE_CH_LOOP             			;

_F}_P2_PRESEASON_SONG_DATA	

 .PAD $C000,$FF
