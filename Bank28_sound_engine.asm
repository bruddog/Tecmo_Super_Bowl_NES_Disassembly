
_F{_SOUND_ENGINE_CONSTANTS

.ENUM $00
	SQ_0_EFFECT_CH_ID		.dsb 1
	SQ_1_EFFECT_CH_ID		.dsb 1
	TRI_EFFECT_CH_ID		.dsb 1
	NOISE_EFFECT_CH_ID		.dsb 1
	
	SQ_0_MUSIC_CH_ID		.dsb 1
	SQ_1_MUSIC_CH_ID		.dsb 1
	TRI_MUSIC_CH_ID			.dsb 1
	NOISE_MUSIC_CH_ID		.dsb 1
.ENDE	

NOTE_TIMER_ACTIVE_BITMASK 			= $80
NOTE_TIMER_INACTIVE_BITMASK 		= $7F

CLEAR_ALL_NOTE_STATUS_BITMASK		= $4F
REST_NOTE_STATUS_BITMASK			= $20
SQUARE_CH_SWEEP_ENABLED_BITMASK 	= $10

BLEND_NOTES_ON_STATUS_BITMASK		= $02
BLEND_NOTES_OFF_STATUS_BITMASK		= $FD

_F}_SOUND_ENGINE_CONSTANTS

_F{_SOUND_ENGINE_MACROS

.MACRO PLAY_VOICE_DMC_SAMPLE[addr_len] addr, len
    
	sample_addr = ((addr - $C000)>>6) 
	sample_length = (len/16)

	LDA #$0F                                     ; SET APU STATUS = DMC BYTES RE-MAINING =0, SILENCE DMC WHEN DONE
	STA APU_STATUS                               ;  
	STA APU_DMC_IRQ_FREQ                         ; CLEAR DMC IRQ  AND DMC LOOP FLAG, SET DMC ENCODING RATE = 33.1KhZ
	LDA #sample_addr                    		 ; SET SAMPLE ADDRESS = $C000+ (0X40 * #$95) = 0X3E540
	STA DMC_START                                ;
	LDA #sample_length                               ; SET DMC SAMPLE LENGTH = 0X10 * 0X3F = 0X3F0 BYTES  
	STA DMC_LEN                                  ;
	LDA #$1F                                     ; SET APU STATUS = START DMC SAMPLE
	STA APU_STATUS                               ; 
.ENDM

.MACRO PLAY_DRUM_DMC_SAMPLE[addr_len] addr, len
	sample_addr = ((addr - $C000)>>6) 
	sample_length = (len/16)

	LDA #$0F                                     ; SET APU STATUS = DMC BYTES RE-MAINING =0, SILENCE DMC WHEN DONE
	STA APU_STATUS                               ; 
	STA APU_DMC_IRQ_FREQ                         ; CLEAR DMC IRQ  AND DMC LOOP FLAG, SET DMC ENCODING RATE = 33.1KhZ
	LDA #$F0                                     ; SET DMC OUTPUT LEVEL
	STA APU_DMC_OUPUT_LEV                        ;
	LDA #sample_addr                    		  ; SET SAMPLE ADDRESS = $C000+ (0X40 * A) = 0X3E0C0
	STA DMC_START                                ;
	LDA #sample_length                                ; SET DMC SAMPLE LENGTH = 0X10 * 0X20 = 0X200 BYTES  
	STA DMC_LEN                                  ;
	LDA #$1F                                     ; SET APU STATUS = START DMC SAMPLE
	STA APU_STATUS                               ; 
.ENDM

.MACRO PLAY_DRUM_DMC_SAMPLE_VARIABLE_ENCODE[addr_len_encode]  addr, len, encode

	sample_addr = ((addr - $C000)>>6) 
	sample_length = (len/16)

	LDA #$0F                                     ; SET APU STATUS = DMC BYTES RE-MAINING =0, SILENCE DMC WHEN DONE
	STA APU_STATUS                               ; 
	LDA #encode                                     ; CLEAR DMC IRQ  AND DMC LOOP FLAG, SET DMC ENCODING RATE = 33.1KhZ
	STA APU_DMC_IRQ_FREQ                         ; 
	LDA #$F0                                     ; SET DMC OUTPUT LEVEL
	STA APU_DMC_OUPUT_LEV                        ;
	LDA #sample_addr                    ; SET SAMPLE ADDRESS = $C000+ (0X40 * A) = 0X3E2C0
	STA DMC_START                                ;
	LDA #sample_length                                ; SET DMC SAMPLE LENGTH = 0X10 * 0X1F = 0X1F0 BYTES  
	STA DMC_LEN                                  ;
	LDA #$1F                                     ; SET APU STATUS = START DMC SAMPLE
	STA APU_STATUS                               ; 
.ENDM	

_F}_SOUND_ENGINE_MACROS

.BASE $8000		
.ORG $8000


_F{_SOUND_ENGINE								; DONE

SOUND_ENGINE_START:                              ; SOUND ENGINE START
	LDA SOFT_APU_STATUS                          ; DOES SOFT APU STATUS = CHANNEL(S) ENABLED
	BNE @check_sound_id                          ; YES->CHECK FOR SOUND TO PLAY

@stop_dmc_enable_all_channels: 
	LDA #$0F                                     ; SET APU STATUS = NOISE,TRIANGLE AND PULSE CHANNELS = ENABLED , DMC DISABLED 
	STA APU_STATUS                               ;
	STA SOFT_APU_STATUS                          ; SET SOFT APU STATUS = NOISE,TRIANGLE AND PULSE CHANNELS = ENABLED , DMC DISABLED 


@check_sound_id:                                 ; CHECK FOR SOUND TO PLAY
	LDA SOUND_ID_TO_PLAY                         ; DOES SOUND TO PLAY = STOP SONG
	CMP #STOP_SONG_SOUND_ID                      ;
	BNE @check_for_song_after_int                ; NO->CHECK FOR SONG/EFFECT ADDRESS TO PROCESS 

@stop_song_id:                                   ;  
	LDA #$00                                     ; 
	STA INT_SONG_PLAYING_BOOLEAN                 ; SET INTERCEPTION MUSIC PLAYING = FALSE 
	STA ON_FIELD_SONG_TO_PLAY_AFTER_INT          
	JMP @set_song_effect_data_bank               ; JUMP->SET SONG/EFFECT BANK

@check_for_song_after_int:                       ; CHECK FOR SONG/EFFECT ADDRESS TO PROCESS
	LDA ON_FIELD_SONG_TO_PLAY_AFTER_INT          ; IS SONG TO PLAY AFTER INTERCEPTION = NONE  
	BEQ @set_song_effect_data_bank               ; YES->SET SONG/EFFECT BANK
	LDY INT_SONG_PLAYING_BOOLEAN                 ; IS INTERCEPTION MUSIC PLAYING = TRUE 
	BNE @clear_sound_to_play                     ; YES->SET SOUND TO PLAY TO NONE

@set_sound_id_to_int_song_to_play: 
	STA SOUND_ID_TO_PLAY                         ; SET SOUND TO PLAY = NONE
	LDA #$00                                     ; SET SONG TO PLAY AFTER INTERCEPTION = NONE 
	STA ON_FIELD_SONG_TO_PLAY_AFTER_INT          ;
	JMP @set_song_effect_data_bank                ; JUMP->SET SONG/EFFECT BANK

@clear_sound_to_play:                            ; SET SOUND TO PLAY TO NONE 
	LDA #$00                                     ; SET SOUND TO PLAY = NO NEW SOUND TO PLAY
	STA SOUND_ID_TO_PLAY                         ;

@set_song_effect_data_bank:                      ; SET SONG/EFFECT BANK
	LDA #$07                                     ; 
	ORA SOFT_MODE_8000                           ;
	STA SOFT_BANK_SELECT                         ; SET SOFT BANK SELECT = $A000 BANK
	STA BANK_SELECT_MMC3                         ; SET MMC3 BANK SELECT = $A000 BANK
	LDY SOUND_ID_TO_PLAY                         ; IS SOUND TO PLAY >= SONG 
	CPY #START_OF_SONG_IDS                       ;
	BCS @check_for_next_bank_of_music            ; YES->CHECK FOR NEW SONG BANK
	
@set_song_data_bank_to_current_bank:
	LDY CURRENT_SOUND_DATA_BANK                  ;
	STY BANK_DATA_MMC3                           ; SET $A000 BANK = CURRENT_SOUND_A000_BANK
	JMP @check_silence_all_channels              ;

@check_for_next_bank_of_music:                   ; SET BANK FOR SOUNDS (0X20-0X3D)
	CPY #P2_PROBOWL_SONG                         ; IS SOUND TO PLAY >= SOUND 61?
	BCS @set_A000_bank_to_song_bank_1            ; 


@set_A000_bank_to_song_bank_2:	
	LDY #SONG_EFFECTS_DATA_BANK_2                ; SET $A000 BANK = BANK 30
	STY BANK_DATA_MMC3                           ; 
	STY CURRENT_SOUND_DATA_BANK                  ; SET CURRENT_SOUND_A000_BANK = BANK 30
	JMP @check_silence_all_channels              ;

@set_A000_bank_to_song_bank_1:                   ; SET BANK FOR SOUNDS (>=0X3D)
	LDY #SONG_EFFECTS_DATA_BANK_1                ; SET $A000 BANK = BANK 29
	STY BANK_DATA_MMC3                           ; 
	STY CURRENT_SOUND_DATA_BANK                  ; SET CURRENT_SOUND_A000_BANK = BANK 29

@check_silence_all_channels:                     ; 
	LDA SILENCE_ALL_CHANNELS_BOOLEAN             ; DOES SILENCE ALL CHANNELS = TRUE 
	BEQ @check_for_fade_out_no_new_song          ; NO-> CHECK FOR SOUND TO PLAY
	
	LDA SOUND_ID_TO_PLAY                         ; DOES SOUND TO PLAY = “READY” SOUND
	CMP #READY_DMC                               ;
	BEQ @check_for_fade_out_no_new_song          ; YES-> CHECK FOR SOUND TO PLAY 
	RTS                                          ; RETURN

@check_for_fade_out_no_new_song:                 ; CHECK FOR SOUND TO PLAY
	LDA SOUND_ID_TO_PLAY                         ; DOES SOUND TO PLAY = NO NEW SOUND TO PLAY
	BEQ PROCESS_CURRENT_MUSIC_PLAYING            ; YES->PROCESS CURRENT SOUND
	CMP #FADE_OUT                                ; DOES SOUND TO PLAY = FADE OUT SONG
	BNE @set_song_effect_address                 ; NO-> LOAD EFFECT/SONG ADDRESS   

@else_do_fadeout:	
	JSR SET_FADE_OUT_TIMERS                      ; FADEOUT SOUND()

@set_song_effect_address:                        ; LOAD EFFECT/SONG ADDRESS
	ASL                                          ; SHIFT SOUND ID SINCE EACH ADDR IS TWO BYTES
	TAY                                          ;
	LDA SOUND_EFFECT_SONG_DATA_ADDR_TABLE,Y     
	STA CURR_SONG_ADDR                           ;
	LDA SOUND_EFFECT_SONG_DATA_ADDR_TABLE+1,Y   
	STA CURR_SONG_ADDR+1                         ;
	
@clear_sound_to_play_and_volume_offset:
	LDY #$00                                     ; SET SOUND TO PLAY = NO NEW SOUND TO PLAY
	STY SOUND_ID_TO_PLAY                         ;
	STY TEMP_VOLUME_OFFSET                     ; 
	STY SILENCE_ALL_CHANNELS_BOOLEAN             ; 			     

_WHILE PLUS                                      ; CHECK FOR LOAD CHANNEL INFORMATION AND ADDR

	LDA (CURR_SONG_ADDR),Y                       ; DOES DATA = END OF CHANNELS?
	BMI PROCESS_CURRENT_MUSIC_PLAYING            ; YES->PROCESS CHANNEL ADDRESSES  
	ASL                                          ; LOAD CHANNEL ID
	TAX                                          ;
	LDA MUSIC_CHANNEL_ID_BITMASK_TABLE,X         ; SET CHANNEL ID FROM CHANNEL ID TABLE
	ORA CHANNEL_ACTIVE                           ;
	STA CHANNEL_ACTIVE                           ; SET CHANNEL AS ACTIVE IN ACTIVE CHANNELS

@clear_various_arrays:							 ; CLEAR  CHANNEL ARRAYS
	LDA #$00                                     ; 
	STA CURRENT_CHANNEL_PITCH_ADJUST[],X         ; SET CURRENT CHANNEL PITCH  = ZERO
	STA CURRENT_CHANNEL_NOTE_STATUS[],X          ; SET CURRENT CHANNEL STATUS = ZERO
	STA CURRENT_CHANNEL_FADE_OUT_TIMER[],X       ; 
	STA CURRENT_CHANNEL_FADE_OUT_RELOAD[],X       ; 
	STA CURRENT_CHANNEL_NOTE_TIMER[],X           ; SET CURRENT CHANNEL TIMER VALUE = ZERO
	STA CURRENT_CH_VOLUME[],X                   ; SET CURRENT CHANNEL VOLUME = ZERO
	
@set_note_duration_to_one_tick:	
	LDA #$01                                     ; 
	STA CURRENT_NOTE_DURATION[],X                ;
	

@save_current_song_addr: 	
	INY                                          ; CURRENT SOUND DATA ADDR ++ 
	LDA (CURR_SONG_ADDR),Y                       ; SET CURRENT CHANNEL SOUND DATA ADDR = DATA ADDR
	STA CURRENT_CH_SONG_ADDR[],X                 ; 
	INY                                          ;
	LDA (CURR_SONG_ADDR),Y                       ;
	STA CURRENT_CH_SONG_ADDR[]+1,X               ;
	
	
	LDA #$05                                     ; SET CURRENT CHANNEL  RETURN ADDR OFFSET = 5
	STA CURRENT_SECTION_OFFSET_FOR_RETURN[],X    ;
	INY                                          ;
	
_END_WHILE

PROCESS_CURRENT_MUSIC_PLAYING:                  ; PROCESS CHANNEL ADDRESSES  
	LDA #<MUSIC_DATA_ADDRESSES_RAM_START         ; SET CURRENT CHANNEL DATA ADDR = $0741
	STA CURR_SONG_ADDR                           ;
	LDA #>MUSIC_DATA_ADDRESSES_RAM_START         ;
	STA CURR_SONG_ADDR+1                         ;
	LDA #$00                                     ; SET CHANNEL INDEX  = FIRST CHANNEL = SQUARE
	STA CURR_SOUND_CHANNEL_INDEX                  ;

_WHILE NOT_EQUAL                                 ; CHECK CHANNELS LOOP

	LDA CHANNEL_ACTIVE                           ; LOAD CHANNEL ID
	LSR                                          ;
	BCC @save_channel_status                     ; IS CHANNEL ACTIVE? NO
	ORA #$80                                     ; SET CHANNEL STATUS = ACTIVE

@save_channel_status:                            ; 
	STA CHANNEL_ACTIVE                           ; SAVE CHANNEL STATUS

@check_channel_status:	
	BCC @set_to_next_channel                     ; CHANNEL ACTIVE ? NO->SET TO NEXT CHANNEL

@time_remaining_for_current_note:
	LDX CURR_SOUND_CHANNEL_INDEX                 ; IS THERE TIME REMANING FOR CURRENT NOTE?
	DEC CURRENT_NOTE_DURATION[],X               ; 
	BNE @do_volume_envelope                      ; YES->PROCESS VOLUME ENVELOPE
	
@check_if_note_blending_on:	
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; DOES CHANNEL STATUS = BLEND NOTES
	AND #$02                                     ;
	BNE @reset_check_vibrato_do_next_data        ; YES->PROCESS CURRENT NOTE OR COMMAND 

@reset_volume_envelope_if_off:					 ; RESET VOLUME ENVELOPE TO START OF ENVELOPE 
	LDA #$00                                     ; CLEAR CUR CH VOLUME ENVELOPE DATA OFFSET = START OF ENVELOPE
	STA CURRENT_VOLUME_ENVELOPE_INDEX[],X        ;
	LDA #$01                                     ; SET CUR CH VOLUME ENVELOPE TIME/LENGTH = 1
	STA CURRENT_VOLUME_ENVELOPE_DURATION[],X     ;
	LDA #$00                                     ; CLEAR VIBRATO OFFSET = 0 
	STA CURRENT_CHANNEL_VIBRATO_OFFSET[],X       ;

@reset_check_vibrato_do_next_data :              ; PROCESS CURRENT NOTE OR COMMAND 
	LDA #$01                                     ; SET VIBRATO TIMER = 1 =  CHECK FOR VIBRATO
	STA CURRENT_CHANNEL_VIBRATO_TIMER[],X        ;
	JSR PROCESS_NOTE_OR_COMMAND_START            ; PROCESS NOTE OR COMMAND()
	LDX CURR_SOUND_CHANNEL_INDEX                 ; LOAD CURRENT CHANNEL INDEX

@do_volume_envelope:                             ; PROCESS VOLUME ENVELOPE
	DEC CURRENT_VOLUME_ENVELOPE_DURATION[],X     ; CUR CH VOLUME ENVELOPE LENGTH--
	BNE @update_channel_volume                   ; AT END OF ENVELOPE? NO->UPDATE CHANNEL VOLUME


@copy_volume_envelope_rom_addr_to_mem:	
	LDA CURRENT_VOLUME_ENVELOPE_ADDR[],X           ; LOAD VOLUME ENVELOPE ADDR
	STA VOLUME_ENEVELOPE_ADDR                    ;
	LDA CURRENT_VOLUME_ENVELOPE_ADDR[] + 1,X       ;
	STA VOLUME_ENEVELOPE_ADDR+1                  ;
	
@set_volume_envelope_duration:	
	LDA CURRENT_VOLUME_ENVELOPE_INDEX[],X          ; LOAD CUR CH VOLUME ENVELOPE DATA OFFSET
	TAY                                          ;
	LDA (VOLUME_ENEVELOPE_ADDR ),Y               ; SET CUR CH VOLUME ENVELOPE LENGTH = DATA VALUE 
	STA CURRENT_VOLUME_ENVELOPE_DURATION[],X       ;
	
@set_volume_envelope_volume_value:	
	INY                                          ; DATA ADDR++
	LDA (VOLUME_ENEVELOPE_ADDR ),Y               ; SET CUR CH VOLUME ENVELOPE VOLUME LEVEL = DATA VALUE 
	STA CURRENT_VOLUME_ENVELOPE_VALUE[],X        ;
	INY                                          ; DATA ADDR++ 
	TYA                                          ; SAVE CUR CH VOLUME ENVELOPE DATA OFFSET
	STA CURRENT_VOLUME_ENVELOPE_INDEX[],X          ; 


@update_channel_volume:                          ; UPDATE CHANNEL VOLUME
	JSR UPDATE_CHANNEL_VOLUME_AND_VIBRATO_EFFECT                               

@set_to_next_channel:                            ; SET TO NEXT CHANNEL
	CLC                                          ; CURRENT CHANNEL SOUND DATA ADDR  + OFFSET TO NEXT CHANNEL DATA
	LDA #$06                                     ;
	ADC CURR_SONG_ADDR                           ;
	STA CURR_SONG_ADDR                           ; 
	
@update_sound_channel_index:	
	LDA #$02                                     ; CHANNEL INDEX = CHANNEL INDEX + OFFSET TO NEXT CHANNEL
	ADC CURR_SOUND_CHANNEL_INDEX                 ;
	STA CURR_SOUND_CHANNEL_INDEX                 ;
	CMP #$10                                     ; HAVE WE CHECKED ALL CHANNELS?
	
_END_WHILE

active_channel_mask		= 	SOUND_ENGINE_LOCAL_1
	
	LDA #$00                                     ; CLEAR CURRENT SOUND/SONG ADDR
	STA CURR_SONG_ADDR                           ; 
	STA CURR_SONG_ADDR+1                         ;
	STA APU_CHANNEL_OFFSET                       ; CLEAR APU CHANNEL OFFSET
	
	LDA #$03                                     ; SET CHANNELS TO CHECK = 4 (SQUARE 0, SQUARE 1, TRIANGLE, NOISE)
	STA SOUND_CHANNELS_LEFT                      ;
	LDA #$11                                     ; SET ACTIVE CHANNEL MASK (0X10= MUSIC, 0X01 = EFFECT)
	STA active_channel_mask                      ;

_WHILE PLUS                                      ; CHECK CHANNEL LOOP 

	LDA CHANNEL_ACTIVE                           ; IS CURRENT SOUND CHANNEL ACTIVE FOR MUSIC OR EFFECT?
	AND active_channel_mask                      ;
	BEQ @set_to_next_channel                     ; NO->GO TO NEXT SOUND CHANNEL
	
@check_if_effect_channel:	
	AND #$0F                                     ; IS CURRENT SOUND CHANNEL = EFFECT?
	BNE @set_duty_value                           ; YES->SET CHANNEL APU FREQ AND CHECK FOR SWEEP
	
@update_song_addr	
	CLC                                          ; SET APU DATA OFFSET = MUSIC CHANNEL OFFSET
	LDA #$08                                     ;
	ADC CURR_SONG_ADDR                           ;
	STA CURR_SONG_ADDR                           ;
	
@set_duty_value:                                 ; SET CHANNEL APU FREQ AND CHECK FOR SWEEP
	
	LDY CURR_SONG_ADDR                           ; LOAD CURRENT APU CHANNEL DUTY DATA
	LDA CURRENT_CHANNEL_DUTY_VALUE[],Y           ;
	
	LDX APU_CHANNEL_OFFSET                       ; LOAD CURRENT APU CHANNEL OFFSET
	STA APU_CUR_CH_VOL[],X                       ; SET APU DUTY/LENGTH REGISTER = CHANNEL DUTY VALUE
	
@check_for_sweep_enabled: 	
	LDA CURRENT_CHANNEL_NOTE_STATUS[],Y          ; DOES CURRENT APU CHANNEL FLAGS  = SWEEP UP
	AND #SQUARE_CH_SWEEP_ENABLED_BITMASK         ;
	BNE @check_for_note_active                   ; NO-> SET APU TIMER
	
@set_nes_apu_sweep_flag:	
	LDA #$08                                     ; SET APU SWEEP REGISTER NEGATE FLAG = SUBTRACT FROM PERIOD, SWEEPING TOWARD HIGHER FREQUENCIES
	STA APU_CUR_SQ_CH_SWEEP[],X                  ; 

@check_for_note_active:                          ; CHECK FOR SET APU TIMER/FREQ
	LDA CURRENT_CHANNEL_NOTE_STATUS[],Y          ; IS CURRENT APU CHANNEL FLAG DATA = TIMER ACTIVE
	AND #NOTE_TIMER_ACTIVE_BITMASK               ;
	BNE @set_to_next_channel                     ; NO->GO TO NEXT SOUND CHANNEL
	

@save_note_period_low_value:	
	LDA CURRENT_CH_NOTE_FREQ_VAL[],Y             ; SET APU TIMER LOW VALUE  = CURRENT APU CHANNEL TIMER LOW VALUE
	STA APU_CUR_CH_PERIOD_VALUE[],X              ; 
	
	
	LDA CURRENT_CH_NOTE_FREQ_VAL[] + 1,Y         ; LOAD CURRENT APU CHANNEL TIMER HIGH VALUE 
	ORA #$18                                     ; SET BASE LENGTH OF LENGTH COUNTER = WHOLE NOTE
	CPX #$07                                     ; IS CHANNEL == SQUARE WAVE CHANNEL?
	BCS @save_high_period_value                  ; NO-> SET LENGTH COUNTER AND TIMER HIGH VALUE (A= VALUE)

@set_note_timer	
	PHA                                          ; SAVE LENGTH AND TIMER HIGH VALUE
	LDA CURRENT_CHANNEL_NOTE_STATUS[],Y          ; DOES CURRENT APU CHANNEL FLAG DATA = SWEEP ENABLED?
	AND #SQUARE_CH_SWEEP_ENABLED_BITMASK         ;
	BEQ @check_for_sq_wave_timer_done:           ; NO->CHECK FOR SQUARE WAVE TIMER DONE

@set_timer_to_done	
	LDA #$FF                                     ; YES SET TIMER DONE = 0XFF
	STA CURRENT_CHANNEL_NOTE_TIMER[],X           ;
	PLA                                          ; RESTORE SQUARE WAVE LENGTH AND TIMER HIGH VALUE
	JMP @save_high_period_value                  ; JUMP->SET LENGTH COUNTER AND TIMER HIGH VALUE (A= VALUE)

@check_for_sq_wave_timer_done:                     ; CHECK FOR SQUARE WAVE TIMER DONE
	PLA                                          ; SQUARE WAVE LENGTH AND TIMER HIGH VALUE > END VALUE?
	CMP CURRENT_CHANNEL_NOTE_TIMER[],X           ; 
	BEQ @set_to_next_channel                     ; YES->GO TO NEXT SOUND CHANNEL
	STA CURRENT_CHANNEL_NOTE_TIMER[],X           ; SAVE NEW TIMER VALUE 

@save_high_period_value:                         ; SET LENGTH COUNTER AND TIMER HIGH VALUE (A= VALUE)
	STA APU_CUR_CH_PERIOD_VALUE[]+1,X            ; SET APU LENGTH COUNTER AND TIMER HIGH VALUE = LENGTH AND TIMER HIGH VALUE
	LDA CURRENT_CHANNEL_NOTE_STATUS[],Y          ; SET CURRENT APU CHANNEL FLAG DATA = TIMER ACTIVE
	ORA #NOTE_TIMER_ACTIVE_BITMASK               ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],Y          ;

@set_to_next_channel:                            ; GO TO NEXT SOUND CHANNEL
	CLC                                          ; = CURRENT ADDR + LENGTH OF SONG ADDR PTR
	LDA #$02                                     ;
	ADC CURR_SONG_ADDR+1                         ;
	STA CURR_SONG_ADDR                           ;
	STA CURR_SONG_ADDR+1                         ;
	
	LDA #$04                                     ; =SOFT APU CHANNEL OFFSET += OFFSET TO NEXT CHANNEL *** odd adding order
	ADC APU_CHANNEL_OFFSET                       ;
	STA APU_CHANNEL_OFFSET						 ;                       
	ASL active_channel_mask                      ; SHIFT CHANNEL MASK TO NEXT CHANNEL 
	DEC SOUND_CHANNELS_LEFT                      ; CHANNELS TO CHECK --

_END_WHILE                                   	 ; DONE? NO->CHECK CHANNEL LOOP
	
	
	LDA SILENCE_ALL_CHANNELS_BOOLEAN             ; DOES SILENCE ALL CHANNELS = TRUE
	BEQ @exit_sound_engine                       ; YES->RETURN FROM MAIN SOUND LOOP


@silence_all_channels:							; SILENCE ALL CHANELS
	LDA #$00                                     ; SET APU STATUS = ALL CHANNELS OFF, LENGTH LEFT =0
	STA APU_STATUS                               ;       
	STA SOFT_APU_STATUS                          ; SET SOFT APU STATUS = ALL CHANNELS OFF, LENGTH LEFT =0

@exit_sound_engine:                              ; RETURN FROM MAIN SOUND LOOP
	RTS                                          ; RETURN

PROCESS_NOTE_OR_COMMAND_START:                   ; PROCESS NOTE OR NOTE COMMAND 
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; SET CHANNEL STATUS = TIMER INACTIVE, SWEEP DISABLED, NO REST NOTE 
	AND #CLEAR_ALL_NOTE_STATUS_BITMASK           ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X          ;

@copy_song_addr_to_zp_temp:	
	LDA CURRENT_CH_SONG_ADDR[],X                 ; SAVE CURRENT CHANNEL DATA ADDR IN TEMP ADDR
	STA CURR_SONG_CHANNEL_ADDR                   ;
	LDA CURRENT_CH_SONG_ADDR[]+1,X               ;
	STA CURR_SONG_CHANNEL_ADDR+1                 ;
	LDY #$00                                     ;

PROCESS_NOTE_OR_COMMAND_LOOP:                    ; CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

save_note_length					= SOUND_ENGINE_LOCAL_1	 ; 8 bit
note_frequency_value				= SOUND_ENGINE_LOCAL_2   ; 16 bit
START_OF_MUSIC_COMMANDS_BYTECODES	= $E0
REST_NOTE_VALUE						= $0C 

	LDA (CURR_SONG_CHANNEL_ADDR),Y               ; IS DATA = COMMAND/NOT LENGTH?
	BPL @save_note_pitch                          ; NO->GET NOTE PITCH
	
@check_for_command:	
	INY                                          ; DATA ADDR++
	CMP #START_OF_MUSIC_COMMANDS_BYTECODES       ; IS COMMAND = EFFECT?
	BCS DO_SONG_DATA_COMMAND                     ; YES->PROCESS EFFECT

@set_note_length:								 ; DATA IS LENGTH OF NOTE
	AND #$3F                                     ; CONVERT DATA VALUE TO TABLE INDEX
	TAX                                          ;
	LDA NOTE_LENGTH_TABLE,X                      ; GET NOTE LENGTH VALUE FROM NOTE LENGTH TABLE
	LDX CURR_SOUND_CHANNEL_INDEX                 ;
	STA CURRENT_NOTE_DURATION[],X                ; SAVE NOTE LENGTH IN CURRENT CHANNEL CURRENT NOTE LENGTH
	STA CURRENT_NOTE_DURATION[]+1,X              ; SAVE NOTE LENGTH IN CURRENT CHANNEL PREVIOUS NOTE LENGTH
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

@save_note_pitch:                                 ; GET NOTE PITCH
	INY                                          ; DATA ADDR++
	STA save_note_length                         ; SAVE NOTE LENGTH
	TYA                                          ;
	CLC                                          ;
	ADC CURR_SONG_CHANNEL_ADDR                   ; UPDATE CURRENT CHANNEL ADDR AND TEMP ADDR
	STA CURRENT_CH_SONG_ADDR[],X                 ;
	LDA #$00                                     ;
	ADC CURR_SONG_CHANNEL_ADDR+1                 ;
	STA CURRENT_CH_SONG_ADDR[]+1,X               ;
	
@check_if_note_is_rest:	
	LDA save_note_length                         ; DOES NOTE = NO NOTE/REST?
	CMP #REST_NOTE_VALUE                         ;
	BNE @get_note_period:                        ; NO-> NOTE IS NOTE A REST
	
@set_channel_status_rest_note:  
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; SET CHANNEL STATUS = NOTE IS REST = SILENCE
	ORA #REST_NOTE_STATUS_BITMASK                       ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X          ;
	BNE @save_note_length                        ; BRANCH->SET NOTE LENGTH

@get_note_period:                                ; NOTE IS NOT A REST
	ASL                                          ; CONVERT TEMP PITCH DATA TO TABLE INDEX
	TAX                                          ;
	
@save_frequency_value:	
	LDA NOTE_FREQUENCY_LOOKUP_TABLE,X            ; LOAD NOTE PERIOD VALUE FROM PITCH/FREQUENCY TABLE
	STA note_frequency_value                     ;
	LDA NOTE_FREQUENCY_LOOKUP_TABLE+1,X          ;
	STA note_frequency_value+1                   ;
	
@check_for_pitch_adjust: 
	LDX CURR_SOUND_CHANNEL_INDEX                 ;
	LDA CURRENT_CHANNEL_PITCH_ADJUST[],X         ; LOAD PITCH ADJUST VALUE 
	BPL @save_pitch_value_high_byte              ; IS POSITIVE? YES->ADD PITCH SHIFT VALUE (A= VALUE)
	

@do_pitch_adjust:	
	AND #$7F                                     ; = ABS(PITCH ADJUST VALUE)
	STA PITCH_ADJUST_VALUE                       ; 
	
	LDA note_frequency_value                     ; = NOTE PERIOD VALUE
	SEC                                          ;
	SBC PITCH_ADJUST_VALUE                       ; - PITCH ADJUST
	STA CURRENT_CH_NOTE_FREQ_VAL[],X             ;
	LDA note_frequency_value+1                   ;
	BCS @save_pitch_value_low_byte               ; 
	SBC #$00                                     ;
	BPL @save_pitch_value_low_byte               ;

@save_pitch_value_high_byte:                     ; ADD AND SAVE PITCH SHIFT VALUE (A= VALUE)
	CLC                                          ;
	ADC note_frequency_value                     ;
	STA CURRENT_CH_NOTE_FREQ_VAL[],X             ;
	LDA note_frequency_value+1                   ;
	ADC #$00                                     ;

@save_pitch_value_low_byte:                      ; SAVE LOW BYTE OF PITCH VALUE
	STA CURRENT_CH_NOTE_FREQ_VAL[] + 1,X         ;

@save_note_length:                               ; SET NOTE LENGTH
	LDA CURRENT_NOTE_DURATION[]+1,X              ; CURRENT NOTE LENGTH = PREVIOUS NOTE LENGTH
	STA CURRENT_NOTE_DURATION[],X                ; 
	RTS                                          ; RETURN TO PROCESS CHANNEL COMMAND


DO_SONG_DATA_COMMAND:                            ; PROCESS MUSIC EFFECT COMMAND  
	AND #$1F                                     ; CONVERT COMMAND TO TABLE INDEX
	ASL                                          ;
	TAX                                          ;
	LDA SOUND_EFFECTS_TABLE,X                    ; LOAD TEMP EFFECT ADDR FROM EFFECT ADDR TABLE
	STA CURR_SOUND_COMMAND_ADDR                  ; AND SAVE IN $F6/$F7
	LDA SOUND_EFFECTS_TABLE+1,X                  ;
	STA CURR_SOUND_COMMAND_ADDR +1               ;
	LDX CURR_SOUND_CHANNEL_INDEX                 ; LOAD CHANNEL INDEX
	JMP (CURR_SOUND_COMMAND_ADDR)                ; JUMP-> EFFECT OR DMC ADDR
	
_F}_SOUND_ENGINE	

_F{_SOUND_ENGINE_COMMAND_FUNCTION_TABLE			; DONE

SOUND_EFFECTS_TABLE:
	.WORD SET_VOLUME_ENVELOPE_COMMAND            ;0XE0  SET VOLUME ENVELOPE
	.WORD SET_INT_MUSIC_PLAYING_COMMAND          ;0xE1  SET INTERCEPTION MUSIC PLAYING
	.WORD SET_DUTY_VOLUME_LENGTH_COMMAND         ;0xE2  SET DUTY CYCLE, LENGTH COUNTER, VOLUME TYPE
	.WORD SET_VOLUME_COMMAND                     ;0xE3  SET VOLUME
	.WORD ENABLE_SWEEP_EFFECT_COMMAND            ;0xE4  ENABLE SWEEP AND SET SWEEP TYPE
	.WORD ADJUST_PITCH_COMMAND                   ;0xE5  ADJUST PITCH
	.WORD DO_NOTHING_MUSIC_CHANNEL_COMMAND       ;0xE6  SKIP TO NEXT BYTE
	.WORD SET_INT_MUSIC_NOT_PLAYING_COMMAND      ;0xE7  SET INTERCEPTION MUSIC NOT PLAYING
	.WORD JUMP_TO_NEW_SONG_ADDR_COMMAND          ;0xE8  JUMP TO (ADDR) 
	.WORD DO_MUSIC_SECTION_AND_RETURN_COMMAND    ;0xE9  DO MUSIC SECTION (ADDR) 
	.WORD RETURN_FROM_SECTION_COMMAND            ;0XEA  RETURN FROM MUSCICTION SECTION
	.WORD LOOP_SECTION_COMMAND                   ;0XEB  LOOP (# OF TIMES TO LOOP)  
	.WORD CHECK_FOR_END_OF_LOOP_COMMAND          ;0XEC  CHECK FOR END OF LOOP
	.WORD TURN_ON_VIBRATO_COMMAND                ;0XED  TURN ON VIBRATO 
	.WORD ENABLE_ALL_CHANNELS_SILENCE_DMC_COMMAND;0XEE  ENABLE ALL SOUND CHANNELS BUT DMC 
	.WORD TURN_OFF_VIBRATO_COMMAND               ;0xEF  TURN OFF VIBRATO
	.WORD PLAY_KICK_DRUM_HIGH_DMC_SAMPLE_COMMAND ;0xF0  DMC “KICK DRUM” HIGH FREQ
	.WORD PLAY_KICK_DRUM_MED_DMC_SAMPLE_COMMAND  ;0xF1  DMC “KICK DRUM” MED FREQ
	.WORD PLAY_KICK_DRUM_LOW_DMC_SAMPLE_COMMAND  ;0xF2  DMC “KICK DRUM” LOW FREQ
	.WORD TURN_ON_NOTE_SLUR_COMMAND              ;0xF3  SLUR NOTES
	.WORD TURN_OFF_NOTE_SLUR_COMMAND             ;0xF4  END SLUR NOTES
	
	.WORD DISABLE_ALL_SOUND_CHANNELS_COMMAND     ;0xF5  DISABLE ALL CHANNELS (*** unused )
	.WORD ENABLE_ALL_SOUND_CHANNELS_COMMAND      ;0xF6  ENABLE ALL CHANNELS	 (*** unused )
	.WORD PLAY_SAFE_DMC_SAMPLE_COMMAND           ;0xF7  DMC “SAFE”
	.WORD PLAY_DOWN_DMC_SAMPLE_COMMAND           ;0xF8  DMC “DOWN”
	.WORD PLAY_HUT_DMC_SAMPLE_COMMAND            ;0xF9  DMC “HUT”
	.WORD PLAY_TOUCHDOWN_DMC_SAMPLE_COMMAND      ;0xFA  DMC “TOUCHDOWN”
	.WORD PLAY_BASS_DMC_SAMPLE_COMMAND           ;0xFB  DMC “BASS DRUM” 
	.WORD PLAY_SNARE_DMC_SAMPLE_COMMAND          ;0xFC  DMC “SNARE DRUM”
	.WORD PLAY_SNARE_HIGH_DMC_SAMPLE_COMMAND     ;0xFD  DMC “SNARE DRUM HIGH”
	.WORD SET_FADE_OUT_SONG_TIMERS_COMMAND       ;0XFE  UNUSED  
	.WORD END_OF_MUSIC_CHANNEL_COMMAND           ;0xFF  END OF CHANNEL
	
_F}_SOUND_ENGINE_COMMAND_FUNCTION_TABLE	

_F{_SOUND_ENGINE_FUNCTIONS						; DONE

TURN_ON_NOTE_SLUR_COMMAND:                       ; 0XF3 TURN ON SLUR NOTES
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ;
	ORA #BLEND_NOTES_ON_STATUS_BITMASK              ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X          ;
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

TURN_OFF_NOTE_SLUR_COMMAND:                      ; 0XF4 TURN OFF SLUR NOTES
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ;
	AND #BLEND_NOTES_OFF_STATUS_BITMASK          ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X         ; 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

SET_INT_MUSIC_PLAYING_COMMAND:                   ; 0XE1 INTCERCEPTION MUSIC IN PROGRESS
	LDA #$FF                                     ; SET INTERCEPTION MUSIC PLAYING = TRUE
	STA INT_SONG_PLAYING_BOOLEAN                 ;
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

SET_INT_MUSIC_NOT_PLAYING_COMMAND:               ; 0XE7 INTCERCEPTION SONG DONE
	LDA #$00                                     ; SET INTERCEPTION MUSIC PLAYING = FALSE
	STA INT_SONG_PLAYING_BOOLEAN                 ;
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

SET_VOLUME_ENVELOPE_COMMAND:                     ; 0xE0 SET VOLUME ENVELOPE ADDR

save_song_data_index	= SOUND_ENGINE_LOCAL_4

	LDA (CURR_SONG_CHANNEL_ADDR),Y
	INY                                          ; DATA ADDR++
	STY save_song_data_index                     ; SAVE DATA ADDR
	ASL                                          ; SHIFT VALUE FOR TABLE ENTRY
	TAY                                          ; 
	
@copy_value_from_rom_to_ram:	
	LDA VOLUME_ENVELOPE_ADDR_TABLE,Y     
	STA CURRENT_VOLUME_ENVELOPE_ADDR[],X      
	LDA VOLUME_ENVELOPE_ADDR_TABLE+1,Y   
	STA CURRENT_VOLUME_ENVELOPE_ADDR[] + 1,X      ;
	
@restore_song_index:	
	LDY save_song_data_index                      ; LOAD DATA OFFSET
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

SET_VOLUME_COMMAND:                              ; 0xE3 SET VOLUME RANGE = 0X00 TO 0X0F
	LDA TEMP_VOLUME_OFFSET                       ; CHECK if saved volume offset (used during fade out) 
	BNE @exit                                    ; 
	
@set_volume:	
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ; SET CHANNEL VOLUME VALUE = DATA VALUE
	STA CURRENT_CH_VOLUME[],X                    ; 

@exit:                                           ; 
	INY                                          ; DATA ADDR++
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

JUMP_TO_NEW_SONG_ADDR_COMMAND:                   ; 0XE8 JUMP TO ADDR 
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ; SET CURRENT ADDR = ADDR AT DATA LOC
	INY                                          ;
	TAX                                          ;
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ;

@save_addr_to_jump_to:	
	STX CURR_SONG_CHANNEL_ADDR                   ;
	STA CURR_SONG_CHANNEL_ADDR+1                 ;
	LDY #$00                                     ; SET ADDRESS OFFSET = START 
	LDX CURR_SOUND_CHANNEL_INDEX                 ; LOAD CURRENT CHANNEL INDEX
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

DO_MUSIC_SECTION_AND_RETURN_COMMAND:             ; 0xE9 DO MUSIC SECTION (ADDR)
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ; SAVE ADDR TO JUMP TO 
	INY                                          ; 
	PHA                                          ;
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ;
	INY                                          ; 
	PHA                                          ;
	TYA                                          ;
	LDY CURRENT_SECTION_OFFSET_FOR_RETURN[],X      ; LOAD CHNL RETURN ADDRESS OFFSET  
	CLC                                          ; SAVE CURRENT CHANNEL RETURN ADDR  
	ADC CURR_SONG_CHANNEL_ADDR                   ;
	STA (CURR_SONG_ADDR),Y                       ;
	DEY                                          ;
	LDA #$00                                     ;
	ADC CURR_SONG_CHANNEL_ADDR  +1                    ;
	STA (CURR_SONG_ADDR),Y                       ;
	DEY                                          ;
	TYA                                          ;
	STA CURRENT_SECTION_OFFSET_FOR_RETURN[],X     ; SAVE CHNL RETURN ADDR OFFSET
	PLA                                          ; SAVE CURRENT CHANNEL ADDR = ADDR 
	STA CURR_SONG_CHANNEL_ADDR  +1                                      ;
	PLA                                          ;
	STA CURR_SONG_CHANNEL_ADDR                   ; 
	LDY #$00                                     ; SET ADDRESS OFFSET = START
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

RETURN_FROM_SECTION_COMMAND:                     ; 0XEA RETURN FROM MUSIC SECTION
	LDY CURRENT_SECTION_OFFSET_FOR_RETURN[],X    ; LOAD CHNL RETURN ADDR OFFSET  
	INY                                          ;
	LDA (CURR_SONG_ADDR),Y                       ; TRANSFER RETURN CH ADDR TO CURR CH ADDR 
	INY                                          ;
	STA CURR_SONG_CHANNEL_ADDR +1                ;
	LDA (CURR_SONG_ADDR),Y                       ;
	STA CURR_SONG_CHANNEL_ADDR                   ;
	TYA                                          ; 
	STA CURRENT_SECTION_OFFSET_FOR_RETURN[],X    ; SAVE CHNL RETURN ADDR OFFSET
	LDY #$00                                     ; SET ADDRESS OFFSET = START
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

LOOP_SECTION_COMMAND:                            ; 0XEB LOOP MUSIC SECTION

num_times_to_loop	= SOUND_ENGINE_LOCAL_1

	LDA (CURR_SONG_CHANNEL_ADDR),Y               ; LOAD # TIMES TO LOOP
	INY                                          ; CHANNEL ADDR OFFSET++
	STY APU_CHANNEL_OFFSET                       ; SAVE CHANNEL ADDR OFFSET
	STA num_times_to_loop                        ; SAVE # TIMES TO LOOP
	LDY CURRENT_SECTION_OFFSET_FOR_RETURN[],X    ; LOAD CHNL RETURN ADDR OFFSET  
	LDA APU_CHANNEL_OFFSET                       ; SAVE CURRENT CHANNEL RETURN ADDR  
	CLC                                          ;
	ADC CURR_SONG_CHANNEL_ADDR                   ;
	STA CURR_SONG_CHANNEL_ADDR                   ;
	STA (CURR_SONG_ADDR),Y                       ;
	DEY                                          ;
	LDA #$00                                     ;
	ADC CURR_SONG_CHANNEL_ADDR  +1               ;
	STA CURR_SONG_CHANNEL_ADDR +1                 ;
	STA (CURR_SONG_ADDR),Y                       ;
	DEY                                          ;
	
@save_times__to_loop: 	
	LDA num_times_to_loop                        ; SAVE TIMES TO REPEAT
	STA (CURR_SONG_ADDR),Y                       ;
	DEY                                          ;
	TYA                                          ;
	STA CURRENT_SECTION_OFFSET_FOR_RETURN[],X    ; SAVE CHNL RETURN ADDR OFFSET
	LDY #$00                                     ; SET ADDRESS OFFSET = START
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

CHECK_FOR_END_OF_LOOP_COMMAND:                   ; 0XEC CHECK FOR END OF LOOP
	STY APU_CHANNEL_OFFSET                       ;
	LDY CURRENT_SECTION_OFFSET_FOR_RETURN[],X    ; LOAD CH OFFSET TO LOOP DATA
	INY                                          ;
	LDA (CURR_SONG_ADDR),Y                       ; = NUMBER OF TIMES TO LOOP--
	SEC                                          ;
	SBC #$01                                     ;
	STA (CURR_SONG_ADDR),Y                       ;
	BEQ @done_with_loop                           ; DONE LOOPING? YES->DONE WITH MUSIC LOOP
	

@loop_back_to_start_of_loop_section:	
	INY                                          ; SET CH CURRENT ADDR = START OF LOOP ADDR
	LDA (CURR_SONG_ADDR),Y                       ;
	STA CURR_SONG_CHANNEL_ADDR  +1                     ;
	INY                                          ;
	LDA (CURR_SONG_ADDR),Y                       ;
	STA CURR_SONG_CHANNEL_ADDR                   ;
	LDY #$00                                     ; SET ADDRESS OFFSET = START
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

@done_with_loop:                                 ; DONE WITH MUSIC LOOP
	INY                                          ;
	INY                                          ;
	TYA                                          ;
	STA CURRENT_SECTION_OFFSET_FOR_RETURN[],X    ; SAVE CHNL RETURN ADDR OFFSET
	LDY APU_CHANNEL_OFFSET                       ; SET ADDRESS OFFSET = CURRENT OFFSET
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

ENABLE_SWEEP_EFFECT_COMMAND:                     ; 0XE4 SET SWEEP ENABLED(VALUES = 0X80 TO 0X87) SQUARE CHANNEL ONLY 
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; SET CURRENT CHANNEL STATUS = SWEEP ACTIVE
	ORA #SQUARE_CH_SWEEP_ENABLED_BITMASK         ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X          ;
	
	LDA APU_VOLUME_VALUE_CH_INDEX_TABLE+1,X       ; LOAD APU CHANNEL INDEX OFFSET FROM CHANNEL TABLE
	TAX                                          ;
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ; SET APU REGISTER = SWEEP ENABLED + SWEEP SHIFT AMOUNT
	STA  APU_CUR_SQ_CH_SWEEP[],X                 ;
	INY                                          ; DATA ADDR++
	LDX CURR_SOUND_CHANNEL_INDEX                 ; LOAD CHANNEL INDEX
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

SET_DUTY_VOLUME_LENGTH_COMMAND:                  ; 0XE2 SET DUTY CYCLE, LENGTH COUNTER, VOLUME TYPE
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ; GET DUTY CYCLE VALUE
	INY                                          ; DATA ADDR++
	STA CURRENT_CH_DUTY_LENGTH_VOL_TYPE[],X      ; 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

END_OF_MUSIC_CHANNEL_COMMAND:                    ; 0XFF END/ TURN OFF CHANNEL
	LDA CHANNEL_ACTIVE                           ; SET CURRENT CHANNEL = NOT ACTIVE
	AND #NOTE_TIMER_INACTIVE_BITMASK             ;
	STA CHANNEL_ACTIVE                           ;
	CPX #$07                                     ; IS CHANNEL INDEX = MUSIC CHANNEL? 
	BCS @set_to_forever_rest_note                ;

@turn_off_effect_channel: 
	STX EFFECT_CH_INDEX                          ; *** do we need to use RAM variable?
	TXA                                          ;
	ORA #$08                                     ;
	TAX                                          ;
	LDA #$FF                                     ;
	STA CURRENT_CHANNEL_NOTE_TIMER[],X           ;
	LDX EFFECT_CH_INDEX                          ; 

@set_to_forever_rest_note:                       ; TURN OFF MUSIC CHANNEL
	LDA #$FF                                     ;
	STA CURRENT_CHANNEL_NOTE_TIMER[],X           ;
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; CLEAR ALL CURRENT CHANNEL STATUS EXCEPT CHANNEL OFF/REST NOTE STAT
	AND #REST_NOTE_STATUS_BITMASK                ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X          ;
	
	
	LDA APU_VOLUME_VALUE_CH_INDEX_TABLE,X        ; LOAD CHANNEL ID INDEX FROM CHANNEL TABLE
	PHA                                          ;
	
@set_apu_register_index:	
	LDA APU_VOLUME_VALUE_CH_INDEX_TABLE+1,X      ; 
	TAX                                          ;  
	
set_apu_volume_value:	
	PLA                                          ;
	STA APU_CUR_CH_VOL[],X                       ; SET LENGTH COUNT HALT = TRUE. SET CONSTANT VOLUME = TRUE, SET VOL = 0
	LDA #$04                                     ; 
	STA APU_CUR_SQ_CH_SWEEP[],X                  ; SET CHANNEL SWEEP UNIT = DISABLED, SET SHIFT TO 4
	RTS                                          ; RETURN

APU_VOLUME_VALUE_CH_INDEX_TABLE:                 ; CHANNEL TABLE
												 ; HALT MASK, APU_REGISTER_OFFSET 
	.DB $30, $00                                 ; SQUARE CHAN 0 EFFECTS
	.DB $30, $04                             	 ; SQUARE CHAN 1 EFFECTS
	.DB $00, $08                              	 ; TRIANGLE CHAN EFFFECTS *** writes 00 to triangle to silence
	.DB $30, $0C                              	 ; NOISE CHAN EFFECTS
	
	.DB $30, $00                              	 ; SQUARE CHAN 0 MUSIC
	.DB $30, $04                              	 ; SQUARE CHAN 1 MUSIC
	.DB $00, $08                                 ; TRIANGLE CHAN MUSIC *** writes 00 to triangle to silence
	.DB $30, $0C                                 ; NOISE CHAN MUSIC

ADJUST_PITCH_COMMAND:                            ; 0XE5 ADJUST PITCH
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ;
	INY                                          ; DATA ADRR++
	STA CURRENT_CHANNEL_PITCH_ADJUST[],X         ;
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

DO_NOTHING_MUSIC_CHANNEL_COMMAND:                ; 0XE6 DO NOTHING
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

TURN_ON_VIBRATO_COMMAND:                         ; 0XED TURN ON VIBRATO(DATA= VIBRATO TYPE)
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ; LOAD WAVER EFFECT INDEX
	INY                                          ; DATA ADRR++
	STY APU_CHANNEL_OFFSET                       ; SAVE OFFSET

@set_vibrato_addr:	
	ASL                                          ;
	TAY                                          ;
	LDA VIBRATO_ADDR_TABLE,Y                     ; SET CUR CH VIBRATO ADDR FROM VIBRATO POINTER TABLE
	STA CURRENT_CHANNEL_VIBRATO_ADDR[],X         ;
	LDA VIBRATO_ADDR_TABLE+1,Y                   ;
	STA CURRENT_CHANNEL_VIBRATO_ADDR[]+1,X       ;

@set_status_vibrato_on:
	LDY APU_CHANNEL_OFFSET                       ; LOAD SOUND DATA OFFSET
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; SET CUR CH VIBRATO FLAG = TRUE
	ORA #$01                                     ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X          ;

@set_vibrato_time:
	LDA #$01                                     ; SET VIBRATO TIME = CHECK FOR VIBRATO
	STA CURRENT_CHANNEL_VIBRATO_TIMER[],X        ;

@set_vibrato_offset_to_beginning:	
	LDA #$00                                     ; SET VIBRATO DATA OFFSET = START
	STA CURRENT_CHANNEL_VIBRATO_OFFSET[],X       ; 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

TURN_OFF_VIBRATO_COMMAND:                        ; 0XEF TURN OFF VIBRATO
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; SET CUR CH VIBRATO FLAG = FALSE
	AND #$FE                                     ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X          ;
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->PROCESS SOUND DATA LOOP

DISABLE_ALL_SOUND_CHANNELS_COMMAND:              ; 0XF5 SILENCE ALL CHANNELS *** UNUSED 
	LDA #$01                                     ; SET SILENCE ALL APU CHANNELS = TRUE
	STA SILENCE_ALL_CHANNELS_BOOLEAN             ; 
	LDA CURRENT_CHANNEL_NOTE_TIMER[]             ; *** pointless 
	LDA CURRENT_CHANNEL_NOTE_TIMER[]+2           ; *** pointless 
	LDA CURRENT_CHANNEL_NOTE_TIMER[]+4           ; *** pointless 
	LDA CURRENT_CHANNEL_NOTE_TIMER[]+6           ; *** pointless 
	LDA CURRENT_CHANNEL_NOTE_TIMER[]+8           ; *** pointless 
	LDA CURRENT_CHANNEL_NOTE_TIMER[]+10          ; *** pointless 
	LDA CURRENT_CHANNEL_NOTE_TIMER[]+12          ; *** pointless 
	LDA CURRENT_CHANNEL_NOTE_TIMER[]+14          ; *** pointless 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

ENABLE_ALL_SOUND_CHANNELS_COMMAND:   			 ; 0XF6 ENABLE ALL CHANNELS *** UNUSED 
	LDA #$00                                     ; SET SILENCE ALL APU CHANNELS = FALSE
	STA SILENCE_ALL_CHANNELS_BOOLEAN             ;
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

SET_FADE_OUT_SONG_TIMERS_COMMAND:                ; 0XFE UNUSED SET FADE OUT COMMAND
	LDA (CURR_SONG_CHANNEL_ADDR),Y               ;
	INY                                          ;
	STA CURRENT_CHANNEL_FADE_OUT_TIMER[],X       ;
	STA CURRENT_CHANNEL_FADE_OUT_RELOAD[],X      ;
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

ENABLE_ALL_CHANNELS_SILENCE_DMC_COMMAND:         ; 0xEE ENABLE ALL CHANNELS BUT DMC
	LDA #$0F                                     ; SET APU STATUS = DMC DISABLED, ALL OTHER CHANNELS = ENABLED
	STA APU_STATUS                               ; 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP
	
		

PLAY_SAFE_DMC_SAMPLE_COMMAND:                    ; 0XF7 PLAY “SAFE” DMC SAMPLE
												 ; *** uses incorrect length 
	PLAY_VOICE_DMC_SAMPLE[addr_len] DMC_SAFE_VOICE_DATA, DMC_SAFE_LENGTH 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ;

PLAY_DOWN_DMC_SAMPLE_COMMAND:                    ; 0XF8 PLAY “DOWN” DMC SAMPLE 

	PLAY_VOICE_DMC_SAMPLE[addr_len] DMC_DOWN_VOICE_DATA, DMC_DOWN_LENGTH 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; 

PLAY_HUT_DMC_SAMPLE_COMMAND:                     ; 0XF9 PLAY “HUT” DMC SAMPLE

	PLAY_VOICE_DMC_SAMPLE[addr_len] DMC_HUT_VOICE_DATA, DMC_HUT_LENGTH 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; 

PLAY_TOUCHDOWN_DMC_SAMPLE_COMMAND:               ; 0XFA PLAY “TOUCHDOWN” DMC SAMPLE *** start of data sample uses last $30 bytes end of safe kind of weird. 
 	PLAY_VOICE_DMC_SAMPLE[addr_len] (DMC_TOUCHDOWN_VOICE_DATA -$30) , (DMC_TOUCHDOWN_LENGTH + $30)
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ;

PLAY_BASS_DMC_SAMPLE_COMMAND:                    ; 0XFB DMC BASS DRUM
	PLAY_DRUM_DMC_SAMPLE[addr_len] DMC_BASS_DRUM_DATA, DMC_BASS_LENGTH 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ;

PLAY_SNARE_DMC_SAMPLE_COMMAND:                   ; 0XFC DMC SNARE DRUM
	PLAY_DRUM_DMC_SAMPLE[addr_len] DMC_SNARE_DRUM_DATA, DMC_SNARE_LENGTH
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

PLAY_KICK_DRUM_HIGH_DMC_SAMPLE_COMMAND:          ; 0XF0 DMC DRUM SAMPLE 1 (KICK DRUM HIGH FREQ)
	PLAY_DRUM_DMC_SAMPLE_VARIABLE_ENCODE[addr_len_encode] DMC_KICK_DRUM_DATA, DMC_KICK_LENGTH, $0F 
	
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; 

PLAY_KICK_DRUM_MED_DMC_SAMPLE_COMMAND:           ; 0XF1 DMC DRUM SAMPLE 2(KICK DRUM MED FREQ)
	PLAY_DRUM_DMC_SAMPLE_VARIABLE_ENCODE[addr_len_encode] DMC_KICK_DRUM_DATA, DMC_KICK_LENGTH, $0E 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; 

PLAY_KICK_DRUM_LOW_DMC_SAMPLE_COMMAND:           ; 0XF2 DMC DRUM SAMPLE 3((KICK DRUM LOW FREQ))
	PLAY_DRUM_DMC_SAMPLE_VARIABLE_ENCODE[addr_len_encode] DMC_KICK_DRUM_DATA, DMC_KICK_LENGTH, $0C 
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; 

PLAY_SNARE_HIGH_DMC_SAMPLE_COMMAND:              ; 0XFD DMC DRUM SAMPLE 4 (SNARE HIGH) *** start of data sample uses last $80 bytes of hut kind of weird. 
	PLAY_DRUM_DMC_SAMPLE_VARIABLE_ENCODE[addr_len_encode] (DMC_HIGH_SNARE_DRUM_DATA -$80), (DMC_HIGH_SNARE_LENGTH + $80), $0F
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP	
	INY                                          ; *** UNEEDED/CANT REACH
	JMP PROCESS_NOTE_OR_COMMAND_LOOP             ; *** JUMP->CHECK FOR PITCH/LENGTH/COMMAND DATA LOOP

UPDATE_CHANNEL_VOLUME_AND_VIBRATO_EFFECT:        ; UPDATE VOLUME(X= CHANNEL INDEX)
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; DOES NOTE = REST NOTE?
	AND #REST_NOTE_STATUS_BITMASK                ;
	BNE @set_volume_to_zero                      ; YES->SET VOLUME = 0
	

@check_for_fade_timer: 	
	LDA CURRENT_CH_VOLUME[],X                    ; LOAD CURRENT CH VOLUME OFFSET
	LDY CURRENT_CHANNEL_FADE_OUT_TIMER[],X       ; 
	BEQ @update_channel_volume                   ; IS FADE OUT = 0? YES->SUBTRACT VOLUME OFFSET FROM ENVELOPE VOLUME
	
	
	STA TEMP_VOLUME_OFFSET                       ; SAVE CURRENT CH VOLUME OFFSET
	DEC CURRENT_CHANNEL_FADE_OUT_TIMER[],X       ;
	BNE @update_channel_volume                   ;

@check_if_vol_is_min:	
	CMP #$0F                                     ;
	BNE @decrease_volume_by_one                  ; 


	LDA END_OF_CHANNEL_DATA_ADDR                 ; set channel address to end of channel
	STA CURRENT_CH_SONG_ADDR[],X                 ;
	LDA END_OF_CHANNEL_DATA_ADDR+1               ;
	STA CURRENT_CH_SONG_ADDR[]+1,X               ;
	BNE @update_channel_volume                   ; 

@decrease_volume_by_one:                         ; DECREASE VOLUME
	CLC                                          ; CURRENT CH VOLUME++
	ADC #$01                                     ;
	CMP #$0F                                     ;  *** pointless 
	STA CURRENT_CH_VOLUME[],X                    ;

@reload_fad_out_timer:	
	LDA CURRENT_CHANNEL_FADE_OUT_RELOAD[],X      ;
	STA CURRENT_CHANNEL_FADE_OUT_TIMER[],X       ;

@update_channel_volume:                          ; SUBTRACT VOLUME OFFSET FROM ENVELOPE VOLUME
	LDA CURRENT_VOLUME_ENVELOPE_VALUE[],X          ; = ENVELOPE VOLUME VALUE – CHANNEL VOLUME SETTING
	SEC                                          ; 
	SBC CURRENT_CH_VOLUME[],X                    ;
	BPL @save_volume                             ; VOLUME >0? YES->SAVE VOLUME ADJUSTMENT (A=VOLUME VALUE)

@set_volume_to_zero:                             ; SET VOLUME  = 0 
	LDA #$00                                     ;

@save_volume:                                    ; SAVE VOLUME ADJUSTMENT (A=VOLUME VALUE) 
	ORA CURRENT_CH_DUTY_LENGTH_VOL_TYPE[],X      ; VOLUME + DUTY/LENGH HALT/CONSTANT VOLUME
	STA CURRENT_CHANNEL_DUTY_VALUE[],X           ;
	
@check_if_vibrato_on: 
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X          ; DOES CURRENT CHANNEL VIBRATO ON = TRUE?
	AND #$01                                     ; 
	BNE @do_vibrato                              ; YES-> DO VIBRATO  

@exit:                                          ; EXIT
	RTS                                          ; 

@do_vibrato:                                      ; DO VIBRATO 
	DEC CURRENT_CHANNEL_VIBRATO_TIMER[],X         ; VIBRATO TIMER-- 
	BNE @exit                                    ; ZERO? YES->EXIT
	
	LDA CURRENT_CHANNEL_NOTE_STATUS[],X           ; SET CURRENT CHANNEL SET TIMER VALUE = FALSE
	AND #NOTE_TIMER_INACTIVE_BITMASK              ;
	STA CURRENT_CHANNEL_NOTE_STATUS[],X           ;
	
@copy_channel_vibrator_addr_to_zp:	
	LDA CURRENT_CHANNEL_VIBRATO_ADDR[],X          ; SAVE VIBRATO ADDR IN $FA/$FB
	STA VIBRATO_ADDR                              ;
	LDA CURRENT_CHANNEL_VIBRATO_ADDR[]+1,X        ;
	STA VIBRATO_ADDR+1                            ;
	LDY CURRENT_CHANNEL_VIBRATO_OFFSET[],X        ; LOAD VIBRATO DATA OFFSET

@check_end_of_vibrato:	
	LDA (VIBRATO_ADDR),Y                         ; DOES DATA = END OF VIBRATO SEQUENCE?  
	CMP #$FF                                     ;
	BNE @save_vibrator_timer                      ; NO->SAVE VIBRATO TIMER
	
	INY                                          ; DATA OFFSET++
	LDA (VIBRATO_ADDR),Y                         ; LOAD DATA VALUE AND ADD OFFSET
	TAY                                          ;
	LDA (VIBRATO_ADDR),Y                         ; 

@save_vibrator_timer:                            ; SAVE VIBRATO TIMER
	STA CURRENT_CHANNEL_VIBRATO_TIMER[],X        ; SAVE VIBRATO TIMER

@load_vibrato_value:
	INY                                          ; DATA ADDR++	
	LDA (VIBRATO_ADDR),Y                         ; 
	BPL @decrease_note_frquency                  ;
	AND #$7F                                     ; 
	
@increase_note_frquency:	
	STA TEMP_VIBRATO_VALUE                       ;
	INY                                          ; DATA ADDR++
	TYA                                          ;
	STA CURRENT_CHANNEL_VIBRATO_OFFSET[],X       ; SAVE VIBRATO DATA OFFSET
	LDA CURRENT_CH_NOTE_FREQ_VAL[],X             ;
	SEC                                          ;
	SBC TEMP_VIBRATO_VALUE                       ;
	STA CURRENT_CH_NOTE_FREQ_VAL[],X             ;
	LDA CURRENT_CH_NOTE_FREQ_VAL[] + 1,X         ;
	BCS @save_and_exit                           ;
	SBC #$00                                     ;
@save_and_exit:                                  ; UPDATE NOTE FREQUENCY HIGH VALUE
	STA CURRENT_CH_NOTE_FREQ_VAL[] + 1,X         ; 
	RTS                                          ; RETURN

@decrease_note_frquency:                         ; INCREASE TIMER VALUE = DECREASE FREQUENCY (A= AMOUNT)
	CLC                                          ; = CURRENT CH FREQ TIMER VALUE + WAVER VALUE
	ADC CURRENT_CH_NOTE_FREQ_VAL[],X             ;
	STA CURRENT_CH_NOTE_FREQ_VAL[],X             ;
	LDA CURRENT_CH_NOTE_FREQ_VAL[] + 1,X         ;
	ADC #$00                                     ;
	STA CURRENT_CH_NOTE_FREQ_VAL[] + 1,X         ;
	INY                                          ; DATA ADDR++
	TYA                                          ;
	STA CURRENT_CHANNEL_VIBRATO_OFFSET[],X       ; SAVE VIBRATO DATA OFFSET
	RTS                                          ; RETURN

SET_FADE_OUT_TIMERS:                             ; FADE OUT CURRENT SONG
	
	
	LDY #$40                                     ;
	STY CURRENT_CHANNEL_FADE_OUT_TIMER[] + 8     ;
	STY CURRENT_CHANNEL_FADE_OUT_TIMER[] + 9     ;
	STY CURRENT_CHANNEL_FADE_OUT_TIMER[] + 10    ;
	STY CURRENT_CHANNEL_FADE_OUT_TIMER[] + 11    ;
	
	LDY #$23                                     ;
	STY CURRENT_CHANNEL_FADE_OUT_RELOAD[] + 11   ; *** wierd array construction
	STY CURRENT_CHANNEL_FADE_OUT_RELOAD[] + 12   ;
	STY CURRENT_CHANNEL_FADE_OUT_RELOAD[] + 13   ;
	STY CURRENT_CHANNEL_FADE_OUT_RELOAD[] + 14   ;
	RTS                                          ; RETURN

END_OF_CHANNEL_DATA_ADDR:                         ; UNUSED
	.WORD END_MUSIC_CHANNEL

END_MUSIC_CHANNEL:	
	.DB $FF

_F}_SOUND_ENGINE_FUNCTIONS

_F{_CHANNEL_ID_BITMASK_TABLE					; DONE
	
MUSIC_CHANNEL_ID_BITMASK_TABLE:               ; CHANNEL ID TABLE
	.DB $01, $00                              ; SQUARE PULSE 1
	.DB $02, $00                              ; SQUARE PULSE 2
	.DB $04, $00                              ; TRIANGLE
	.DB $08, $00                              ; NOISE
								
	.DB $10, $00                              ; SQUARE PULSE 1
	.DB $20, $00                              ; SQUARE PULSE 2
	.DB $40, $00                              ; TRIANGLE
	.DB $80                                   ; NOISE

_F}_CHANNEL_ID_BITMASK_TABLE	
										
_F{_NOTE_FREQUENCY_LOOKUP_TABLE					; DONE
														; FREQUENCY = CPU/[16* (period value +1);
												; Example using octave 1 C: 1.7897MHz (NTSC)
												;= 1789700 / [ 16* 1711  ]
												;= 1789700 /27376


NOTE_FREQUENCY_LOOKUP_TABLE:                     ; PITCH/FREQUENCY TABLE
												 ; OCTAVE 1
		.WORD $06AE                              ; 0x00 C  65Hz
		.WORD $064E                              ; 0x01 C# 
		.WORD $05F3                              ; 0x02 D  
		.WORD $059E                              ; 0x03 D# 
		.WORD $054D                              ; 0x04 E  
		.WORD $0501                              ; 0x05 F
		.WORD $04B9                              ; 0x06 F#
		.WORD $0475                              ; 0x07 G
		.WORD $0435                              ; 0x08 G#
		.WORD $03F8                              ; 0x09 A
		.WORD $03BF                              ; 0x0A A#
		.WORD $0389                              ; 0x0B B   123 Hz
		.WORD $0000                              ; 0x0C 
		.WORD $0000                              ; 0x0D
		.WORD $0001                              ; 0x0E
		.WORD $0002                              ; 0x0F

												; OCTAVE 2
		.WORD $0357                              ; 0x10
		.WORD $0327                              ; 0x11
		.WORD $02F9                              ; 0x12
		.WORD $02CF                              ; 0x13
		.WORD $02A6                              ; 0x14
		.WORD $0280                              ; 0x15
		.WORD $025C                              ; 0x16
		.WORD $023A                              ; 0x17
		.WORD $021A                              ; 0x18
		.WORD $01FC                              ; 0x19
		.WORD $01DF                              ; 0x1A
		.WORD $01C4                              ; 0x1B
		.WORD $0003                              ; 0x1C
		.WORD $0004                              ; 0x1D
		.WORD $0005                              ; 0x1E
		.WORD $0006                              ; 0x1F

												; OCTAVE 3
		.WORD $01AB                              ; 0x20
		.WORD $0193                              ; 0x21
		.WORD $017C                              ; 0x22
		.WORD $0167                              ; 0x23
		.WORD $0153                              ; 0x24
		.WORD $0140                              ; 0x25
		.WORD $012E                              ; 0x26
		.WORD $011D                              ; 0x27
		.WORD $010D                              ; 0x28
		.WORD $00FE                              ; 0x29
		.WORD $00EF                              ; 0x2A
		.WORD $00E2                              ; 0x2B
		.WORD $0007                              ; 0x2C
		.WORD $0008                              ; 0x2D
		.WORD $0009                              ; 0x2E
		.WORD $000A                              ; 0x2F

												; OCTAVE 4
		.WORD $00D5                              ; 0x30
		.WORD $00C9                              ; 0x31
		.WORD $00BE                              ; 0x32
		.WORD $00B3                              ; 0x33
		.WORD $00A9                              ; 0x34
		.WORD $00A0                              ; 0x35
		.WORD $0097                              ; 0x36
		.WORD $008E                              ; 0x37
		.WORD $0086                              ; 0x38
		.WORD $007F                              ; 0x39
		.WORD $0077                              ; 0x3A
		.WORD $0071                              ; 0x3B
		.WORD $000B                              ; 0x3C
		.WORD $000C                              ; 0x3D
		.WORD $000D                              ; 0x3E
		.WORD $000E                              ; 0x3F

												; OCTAVE 5
		.WORD $006A                              ; 0x40
		.WORD $0064                              ; 0x41
		.WORD $005F                              ; 0x42
		.WORD $0059                              ; 0x43
		.WORD $0054                              ; 0x44
		.WORD $0050                              ; 0x45
		.WORD $004B                              ; 0x46
		.WORD $0047                              ; 0x47
		.WORD $0043                              ; 0x48
		.WORD $003F                              ; 0x49
		.WORD $003B                              ; 0x4A
		.WORD $0038                              ; 0x4B
		.WORD $000F                              ; 0x4C
		.WORD $0000                              ; 0x4D
		.WORD $0000                              ; 0x4E
		.WORD $0000                              ; 0x4F
												; OCTAVE 6
		.WORD $0035                              ; 0x50
		.WORD $0032                              ; 0x51
		.WORD $002F                              ; 0x52
		.WORD $002C                              ; 0x53
		.WORD $002A                              ; 0x54
		.WORD $0028                              ; 0x55
		.WORD $0025                              ; 0x56
		.WORD $0023                              ; 0x57
		.WORD $0021                              ; 0x58
		.WORD $001F                              ; 0x59
		.WORD $001D                              ; 0x5A
		.WORD $001C                              ; 0x5B

		.WORD $0000                              ; 0x5C
		.WORD $0000                              ; 0x5D
		.WORD $0000                              ; 0x5E

												; 
		.WORD $0079                              ; 0x5F
								
												; OCTAVE 7 NOISE CHANNELS
		.WORD $0000                              ; 0x60 SET NOISE FREQ = 447 kHZ/ 4971hZ
		.WORD $0001                              ; 0x61 SET NOISE FREQ = 223 kHZ/ 2300hZ
		.WORD $0002                              ; 0x62 SET NOISE FREQ = 111 kHZ/ 903hZ
		.WORD $0003                              ; 0x63 SET NOISE FREQ = 55.9 kHZ/ 397hZ
		.WORD $0004                              ; 0x64 SET NOISE FREQ = 27.9 kHZ/ 132Hz
		.WORD $0005                              ; 0x65 SET NOISE FREQ = 18.6 kHZ/ 67hZ
		.WORD $0006                              ; 0x66 SET NOISE FREQ = 13.9 kHZ/ 56hZ
		.WORD $0007                              ; 0x67 SET NOISE FREQ = 11.1 kHZ/ 38hZ
		.WORD $0008                              ; 0x68 SET NOISE FREQ = 8856 HZ/ 33hZ
		.WORD $0009                              ; 0x69 SET NOISE FREQ = 7043 HZ/ 22hZ
		.WORD $000A                              ; 0x6A SET NOISE FREQ = 4707 HZ/ 1hZ
		.WORD $000B                              ; 0x6B SET NOISE FREQ = 3521 HZ/ 10hZ
		.WORD $000C                              ; 0x6C SET NOISE FREQ = 2347 HZ/ 5hZ
		.WORD $000D                              ; 0x6D SET NOISE FREQ = 1760 HZ/ 2hZ
		.WORD $000E                              ; 0x6E SET NOISE FREQ = 879 HZ/ 1hZ
		.WORD $000F                              ; 0x6F SET NOISE FREQ = 439 HZ/ 1h

_F}_NOTE_FREQUENCY_LOOKUP_TABLE	

_F{_NOTE_LENGTH_TABLE							; DONE

NOTE_LENGTH_TABLE:                               ; NOTE LENGTH TABLE
	.DB $00                                      ; 0x80 N/A
	.DB $01                                      ; 0x81 1/32
	.DB $02                                      ; 0x82 1/16
	.DB $03                                      ; 0x83 3/32
	.DB $04                                      ; 0x84 1/8
	.DB $05                                      ; 0x85 5/32
	.DB $06                                      ; 0x86 3/16
	.DB $07                                      ; 0x87 7/32
	.DB $08                                      ; 0x88 1/4
	.DB $09                                      ; 0x89 9/32
	.DB $0A                                      ; 0x8A 5/16
	.DB $0C                                      ; 0x8B 3/8
	.DB $0E                                      ; 0x8C 7/16
	.DB $0F                                      ; 0x8D 15/32
	.DB $10                                      ; 0x8E 1/2
	.DB $12                                      ; 0x8F 9/16
	.DB $14                                      ; 0x90 5/8
	.DB $15                                      ; 0x91 21/32
	.DB $18                                      ; 0x92 3/4
	.DB $1B                                      ; 0x93 27/32
	.DB $1C                                      ; 0x94 7/8 
	.DB $1E                                      ; 0x95 15/16
	.DB $20                                      ; 0x96 WHOLE NOTE
	.DB $24                                      ; 0x97 1 1/8
	.DB $28                                      ; 0x98 1 1/4
	.DB $2A                                      ; 0x99 1 5/16
	.DB $30                                      ; 0x9A 1 1/2
	.DB $36                                      ; 0x9B 1 11/16
	.DB $38                                      ; 0x9C 1 3/4
	.DB $3C                                      ; 0x9D 1 7/8
	.DB $40                                      ; 0x9E DOUBLE NOTE 
	.DB $48                                      ; 0x9F 2 1/4
	.DB $50                                      ; 0xA0 2 1/2 
	.DB $54                                      ; 0xA1 2 3/4
	.DB $60                                      ; 0xA2 3
	.DB $6C                                      ; 0xA3 3 3/8
	.DB $70                                      ; 0xA4 3 1/2
	.DB $80                                      ; 0xA5 4
	.DB $90                                      ; 0xA6 4 1/2
	.DB $C0                                      ; 0xA7 6
	.DB $E0                                      ; 0xA8 7
	
	.DB $2D                                      ; 0xA9 1 13/16
	.DB $86                                      ; 0xAA 4 3/16
	.DB $A0                                      ; 0xAB 5
	.DB $9F                                      ; 0xAC 4 15/32
	.DB $46                                      ; 0xAD 2 3/16
	.DB $A8                                      ; 0xAE 5 1/4
	.DB $78                                      ; 0xAF 3 3/4

_F}_NOTE_LENGTH_TABLE	
	
UNUSED_MUSIC_LABEL:                              ;
	.DB $FF                                      ;
	.DB $FF                                      ;

_F{_VIBRATO_ADDR_TABLE							;DONE
		
VIBRATO_ADDR_TABLE:                              ; VIBRATO POINTERS
	.WORD VIBRATO_SEQ_ONE                          ; 0x00
	.WORD VIBRATO_SEQ_2                          ; 0x01
	.WORD VIBRATO_SEQ_3                          ; 0x02
	.WORD VIBRATO_SEQ_4                          ; 0x03
	.WORD VIBRATO_SEQ_5                          ; 0x04
	.WORD VIBRATO_SEQ_6                          ; 0x05
	.WORD VIBRATO_SEQ_7                          ; 0x06
	.WORD VIBRATO_SEQ_8                          ; 0x07
	.WORD VIBRATO_SEQ_9                          ; 0x08
	.WORD VIBRATO_SEQ_10                         ; 0x09
	.WORD VIBRATO_SEQ_11                         ; 0x0A
	.WORD VIBRATO_SEQ_12                         ; 0x0B
	.WORD VIBRATO_SEQ_13                         ; 0x0C
	.WORD VIBRATO_SEQ_14                         ; 0x0D
	.WORD VIBRATO_SEQ_15                          ; 0x0E
	
_F}_VIBRATO_ADDR_TABLE

_F{_VIBRATO_DATA								; DONE



VIBRATO_SEQ_ONE:                                       ; 0x00 VIBRATO TYPE 1
	.DB $01,$03                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $07,$00                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$83                                   ; 
	.DB $FF,VIBRATO_JUMP_ONE - $ - 1    			  ; JUMP-> VIBRATO_JUMP_ONE

VIBRATO_SEQ_2:                                   ; 0x01 VIBRATO TYPE 2
	.DB $01,$03                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $07,$00                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$82                                   ;  


VIBRATO_JUMP_ONE:								 ; 
	.DB $01,$83                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$02                                   ;  
	.DB $FF,VIBRATO_SEQ_5 -$ - 1                   ; JUMP-> VIBRATO_SEQ_5

VIBRATO_SEQ_3:                                  ; 0x02 VIBRATO TYPE 3
	.DB $01,$00                                   ;  
	.DB $01,$84                                   ;  
	.DB $01,$04                                   ;  
	.DB $01,$04                                   ;  
	.DB $01,$84                                   ;  
	.DB $FF,VIBRATO_JUMP_TWO -$  - 1                                 ; JUMP-> 884D

VIBRATO_SEQ_4:                                   ; 0x03 VIBRATO TYPE 4
	.DB $01,$00                                   ; 
VIBRATO_JUMP_TWO:
	.DB $01,$83                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$85                                   ;  
	.DB $01,$02                                   ;  
	.DB $FF,VIBRATO_JUMP_THREE -$ - 1             ; JUMP-> 8859

VIBRATO_SEQ_5:                                   ; 0x04 VIBRATO TYPE 5
	.DB $03,$81                                   ;  

VIBRATO_JUMP_THREE:
	.DB $03,$01                                   ;  
	.DB $03,$01                                   ;  
	.DB $81,$81                                   ;  
	.DB $FF,$00                                   ; END_OF_VIBRATO SEQUENCE

VIBRATO_SEQ_6:                                   ; 0x05 VIBRATO TYPE 6
	.DB $01,$03                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$02                                   ;  
	.DB $FF,VIBRATO_JUMP_FOUR - $ - 1            ; JUMP-> 88BF

VIBRATO_SEQ_7:                                   ; 0x06 VIBRATO TYPE 7 
	.DB $03,$00                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  

VIBRATO_JUMP_FOUR:                              ; 
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  
	.DB $FF,VIBRATO_JUMP_SIX - $ - 1               ; JUMP-> 88EF

VIBRATO_SEQ_8:                                   ; 0x07 VIBRATO TYPE 8
	.DB $07,$00                                   ;  
	.DB $01,$01                                   ;  
	.DB $02,$01                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $FF,VIBRATO_JUMP_FIVE - $ - 1                ; JUMP-> 88E3

VIBRATO_SEQ_9:                                   ; 0x08 VIBRATO TYPE 9
	.DB $01,$02                                   ;  

VIBRATO_JUMP_FIVE:                               ; 
	.DB $01,$01                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$02                                   ;  

VIBRATO_JUMP_SIX: 
	.DB $01,$01                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$02                                   ;  
	.DB $FF,$00                                   ; WAIT 255 TICKS OR UNTIL VIBRATO TURNS OFF

VIBRATO_SEQ_10:                                  ; 0x09 VIBRATO TYPE 10
	.DB $01,$03                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $07,$00                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$83                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$03                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$06                                   ;  
	.DB $01,$04                                   ;  
	.DB $01,$86                                   ;  
	.DB $01,$84                                   ;  
	.DB $01,$86                                   ;  
	.DB $01,$84                                   ;  
	.DB $01,$06                                   ;  
	.DB $01,$04                                   ;  
	.DB $FF,VIBRATO_JUMP_SEVEN - $ - 1           ; JUMP-> $8945

VIBRATO_SEQ_11:                                  ; 0x0A VIBRATO TYPE 11
	.DB $01,$8A                                   ;  
	.DB $FF,$00                                   ; WAIT 255 TICKS OR UNTIL VIBRATO TURNS OFF

VIBRATO_SEQ_12:                                  ; 0x0B VIBRATO TYPE 12
	.DB $01,$08                                   ;  
	.DB $FF,$00                                   ; WAIT 255 TICKS OR UNTIL VIBRATO TURNS OFF


VIBRATO_SEQ_13:                                  ; 0x0C VIBRATO TYPE 13
	.DB $01,$03                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$81                                   ;  
	.DB $09,$00                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  

VIBRATO_JUMP_SEVEN:                              ;
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  
	.DB $FF,VIBRATO_JUMP_EIGHT - $ - 1            ; JUMP-> $8987

VIBRATO_SEQ_14:                                  ; 0x0D VIBRATO TYPE 14
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$81                                   ;  
	.DB $01,$01                                   ;  
	.DB $01,$01                                   ;  
	.DB $FF,$00                                   ; WAIT 255 TICKS OR UNTIL VIBRATO TURNS OFF

VIBRATO_SEQ_15:                                       ; 0x0E VIBRATO TYPE 15
	.DB $01,$02                                   ;  
	.DB $01,$02                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$82                                   ;  
	.DB $01,$02                                   ;  

VIBRATO_JUMP_EIGHT: 
	.DB $01,$02                                ;  
	.DB $FF,$00                                   ; WAIT 255 TICKS OR UNTIL VIBRATO TURNS OFF

_F}_VIBRATO_DATA	

_F{_VOLUME_ENVELOPE_ADDR_TABLE					; DONE

VOLUME_ENVELOPE_ADDR_TABLE:                      ; VOLUME ENVELOPE POINTERS
	.WORD VOLUME_ENVELOPE_1                                 ; 0x00

	.WORD VOLUME_ENVELOPE_2                                  ; 0x01 0X01- 0X09 ALL SAME
	.WORD VOLUME_ENVELOPE_2                                  ; 0x02
	.WORD VOLUME_ENVELOPE_2                                  ; 0x03
	.WORD VOLUME_ENVELOPE_2                                  ; 0x04
	.WORD VOLUME_ENVELOPE_2                                  ; 0x05
	.WORD VOLUME_ENVELOPE_2                                  ; 0x06
	.WORD VOLUME_ENVELOPE_2                                  ; 0x07
	.WORD VOLUME_ENVELOPE_2                                  ; 0x08

	.WORD VOLUME_ENVELOPE_3                                 ; 0x09
	.WORD VOLUME_ENVELOPE_5                                  ; 0x0A 
	.WORD VOLUME_ENVELOPE_6                               	; 0x0B
	.WORD VOLUME_ENVELOPE_8                                  ; 0x0C
	
	.WORD VOLUME_ENVELOPE_9                               ; 0x0D 0X0D- 0X10 ALL SAME
	.WORD VOLUME_ENVELOPE_9                                  ; 0x0E
	.WORD VOLUME_ENVELOPE_9                                  ; 0x0F
	.WORD VOLUME_ENVELOPE_9                                  ; 0x10
	
	.WORD VOLUME_ENVELOPE_10                               ; 0x11
	.WORD VOLUME_ENVELOPE_11                                  ; 0x12
	.WORD VOLUME_ENVELOPE_12                                  ; 0x13
	.WORD VOLUME_ENVELOPE_13                                  ; 0x14
	.WORD VOLUME_ENVELOPE_14                                  ; 0x15
	
	.WORD VOLUME_ENVELOPE_15                               ; 0x16 0X16- 0X18 ALL SAME
	.WORD VOLUME_ENVELOPE_15                                  ; 0x17
	.WORD VOLUME_ENVELOPE_15                                  ; 0x18
	
	.WORD VOLUME_ENVELOPE_16                               ; 0x19 0X19- 0X1F ALL SAME
	.WORD VOLUME_ENVELOPE_16                                  ; 0x1A
	.WORD VOLUME_ENVELOPE_16                                  ; 0x1B
	.WORD VOLUME_ENVELOPE_16                                  ; 0x1C
	.WORD VOLUME_ENVELOPE_16                                  ; 0x1D
	.WORD VOLUME_ENVELOPE_16                                  ; 0x1E
	.WORD VOLUME_ENVELOPE_16                                  ; 0x1F
	
	.WORD VOLUME_ENVELOPE_17                               ; 0x20
	.WORD VOLUME_ENVELOPE_18                                  ; 0x21
	.WORD VOLUME_ENVELOPE_19                                  ; 0x22
	.WORD VOLUME_ENVELOPE_20                                  ; 0x23
	.WORD VOLUME_ENVELOPE_21                                  ; 0x24
	.WORD VOLUME_ENVELOPE_22                                  ; 0x25
	.WORD VOLUME_ENVELOPE_23                                  ; 0x26
	.WORD VOLUME_ENVELOPE_24                                  ; 0x27
	.WORD VOLUME_ENVELOPE_25                                  ; 0x28
	.WORD VOLUME_ENVELOPE_26                                  ; 0x29
	.WORD VOLUME_ENVELOPE_27                                  ; 0x2A
	.WORD VOLUME_ENVELOPE_28                                  ; 0x2B
	.WORD VOLUME_ENVELOPE_29                                  ; 0x2C
	.WORD VOLUME_ENVELOPE_30                                  ; 0x2D FULL VOLUME
	.WORD VOLUME_ENVELOPE_31                                  ; 0x2E
	
	.WORD VOLUME_ENVELOPE_32                                  ; 0x2F
	.WORD VOLUME_ENVELOPE_32                                  ; 0x30
	
	.WORD VOLUME_ENVELOPE_33                                  ; 0x31
	.WORD VOLUME_ENVELOPE_33                                  ; 0x32
	
	.WORD VOLUME_ENVELOPE_34                                  ; 0x33
	.WORD VOLUME_ENVELOPE_35                                  ; 0x34
	.WORD VOLUME_ENVELOPE_36                                  ; 0x35
	.WORD VOLUME_ENVELOPE_37                                  ; 0x36
	.WORD VOLUME_ENVELOPE_38                                  ; 0x37
	.WORD VOLUME_ENVELOPE_39                                  ; 0x38
	.WORD VOLUME_ENVELOPE_40                                  ; 0x39
	.WORD VOLUME_ENVELOPE_41                                  ; 0x3A
	.WORD VOLUME_ENVELOPE_42                                  ; 0x3B
	.WORD VOLUME_ENVELOPE_43                                  ; 0x3C
	.WORD VOLUME_ENVELOPE_44                                  ; 0x3D
	.WORD VOLUME_ENVELOPE_45                                 ; 0x3E

												; FULL VOLUME DIFFERENT LENGTHS
	.WORD VOLUME_ENVELOPE_46                                  ; 0x3F
	.WORD VOLUME_ENVELOPE_46                                  ; 0x40
	.WORD VOLUME_ENVELOPE_47                                  ; 0x41
	.WORD VOLUME_ENVELOPE_48                                  ; 0x42
	.WORD VOLUME_ENVELOPE_49                                  ; 0x43
	.WORD VOLUME_ENVELOPE_50                                  ; 0x44
	.WORD VOLUME_ENVELOPE_51                                  ; 0x45
	.WORD VOLUME_ENVELOPE_52                                  ; 0x46
	.WORD VOLUME_ENVELOPE_53                                  ; 0x47
	.WORD VOLUME_ENVELOPE_54                                  ; 0x48
	.WORD VOLUME_ENVELOPE_55                                  ; 0x49
	
	
	.WORD VOLUME_ENVELOPE_4                      ; 0x4A
	.WORD VOLUME_ENVELOPE_7                                  ; 0x4B

_F}_VOLUME_ENVELOPE_ADDR_TABLE	

_F{_VOLUME_ENVELOPE_DATA						; DONE
	
VOLUME_ENVELOPE_1:                                       	;0X00 VOLUME ENVLEOPE 1
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $FF,$0A                                  ;Time: 255,  VOL PCT: 66%

VOLUME_ENVELOPE_2:                               ;0X01-0X08 VOLUME ENVLEOPE 2-9
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_3:                               ;0X09 VOLUME ENVELOPE 10
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $02,$0F                                  ;Time: 2,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_4:                               ;0X4A VOLUME ENVELOPE 74
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $FF,$08                                  ;Time: 255,  VOL PCT: 53%

VOLUME_ENVELOPE_5:                               ;0X0A VOLUME ENVELOPE 11
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $05,$0F                                  ;Time: 5,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_6:                               ;0X0B VOLUME ENVELOPE 12
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$00                                  ;Time: 1,    VOL PCT: 0%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $02,$0A                                  ;Time: 2,    VOL PCT: 66%
	.DB $03,$09                                  ;Time: 3,    VOL PCT: 60%
	.DB $04,$08                                  ;Time: 4,    VOL PCT: 53%
	.DB $05,$07                                  ;Time: 5,    VOL PCT: 46%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_7:                               ;0X4B VOLUME ENVELOPE 75
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $02,$0B                                  ;Time: 2,    VOL PCT: 73%
	.DB $02,$0A                                  ;Time: 2,    VOL PCT: 66%
	.DB $02,$09                                  ;Time: 2,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$05                                  ;Time: 1,    VOL PCT: 33%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $02,$0A                                  ;Time: 2,    VOL PCT: 66%
	.DB $03,$09                                  ;Time: 3,    VOL PCT: 60%
	.DB $FF,$08                                  ;Time: 255,  VOL PCT: 53%

VOLUME_ENVELOPE_8:                                           ;0X0C VOLUME ENVELOPE 13     
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $09,$0F                                  ;Time: 9,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_9:                               ;0X0D-0X10 VOLUME ENVELOPE 14-17
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $02,$0F                                  ;Time: 2,    VOL PCT: 100%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_10:                              ;0X11 VOLUME ENVELOPE 18
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $03,$0F                                  ;Time: 3,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $02,$09                                  ;Time: 2,    VOL PCT: 60%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_11:                              ;0X12 VOLUME ENVELOPE 19
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $06,$0F                                  ;Time: 6,    VOL PCT: 100%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $02,$09                                  ;Time: 2,    VOL PCT: 60%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_12:                              ;0X13 VOLUME ENVELOPE 20
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $09,$0F                                  ;Time: 9,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_13:                              ;0X14 VOLUME ENVELOPE 21
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $0C,$0F                                  ;Time: 12,   VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_14:                                       ;0X15 VOLUME ENVELOPE 22
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_15:                              ;0X16-0X18 VOLUME ENVELOPE 23-25
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_16:                              ;0X19-0X1F VOLUME ENVELOPE 26-32 
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $FF,$0B                                  ;Time: 255,  VOL PCT: 73%

VOLUME_ENVELOPE_17:                                       ;0X20 VOLUME ENVELOPE 33 
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$00                                  ;Time: 1,    VOL PCT: 0%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$06                                  ;Time: 1,    VOL PCT: 40%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_18:                                       ;0X21 VOLUME ENVELOPE 33
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$00                                  ;Time: 1,    VOL PCT: 0%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $03,$06                                  ;Time: 3,    VOL PCT: 40%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_19:                                       ;0X22 VOLUME ENVELOPE 34
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%

VOLUME_ENVELOPE_20:                                       ;0X23 VOLUME ENVELOPE 35
	.DB $01,$0C                               ;Time: 1,    VOL PCT: 80%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $02,$0F                                  ;Time: 2,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $FF,$09                                  ;Time: 255,  VOL PCT: 60%

VOLUME_ENVELOPE_21:                                       ;0X24 VOLUME ENVELOPE 36
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%

VOLUME_ENVELOPE_22:                                       ;0X25 VOLUME ENVELOPE 37
	.DB $01,$0F                               ;Time: 1,    VOL PCT: 100%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_UNUSED_ONE:                      ;VOLUME ENVELOPE *** UNUSED 
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $FF,$0B                                  ;Time: 255,  VOL PCT: 73%

VOLUME_ENVELOPE_23:                              ; 0X26 VOLUME ENVELOPE 38
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $FF,$0B                                  ;Time: 255,  VOL PCT: 73%

VOLUME_ENVELOPE_24:                                       ;0X27 VOLUME ENVELOPE 39
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $02,$08                                  ;Time: 2,    VOL PCT: 53%
	.DB $FF,$07                                  ;Time: 255,  VOL PCT: 46%

VOLUME_ENVELOPE_25:                                       ;0X28 VOLUME ENVELOPE 40 (QUICK FADE ENVELEOPE)
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$06                                  ;Time: 1,    VOL PCT: 40%
	.DB $01,$05                                  ;Time: 1,    VOL PCT: 33%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $01,$03                                  ;Time: 1,    VOL PCT: 20%
	.DB $01,$02                                  ;Time: 1,    VOL PCT: 13%
	.DB $01,$01                                  ;Time: 1,    VOL PCT: 6%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_26:                                       ;0X29 VOLUME ENVELOPE 41 (MEDIUM FADE ENVELEOPE)
	.DB $02,$0F                                  ;Time: 2,    VOL PCT: 100%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0B                                  ;Time: 2,    VOL PCT: 73%
	.DB $02,$0A                                  ;Time: 2,    VOL PCT: 66%
	.DB $02,$09                                  ;Time: 2,    VOL PCT: 60%
	.DB $02,$08                                  ;Time: 2,    VOL PCT: 53%
	.DB $02,$07                                  ;Time: 2,    VOL PCT: 46%
	.DB $02,$06                                  ;Time: 2,    VOL PCT: 40%
	.DB $02,$05                                  ;Time: 2,    VOL PCT: 33%
	.DB $02,$04                                  ;Time: 2,    VOL PCT: 26%
	.DB $02,$03                                  ;Time: 2,    VOL PCT: 20%
	.DB $02,$02                                  ;Time: 2,    VOL PCT: 13%
	.DB $02,$01                                  ;Time: 2,    VOL PCT: 6%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_27:                                       ;0X2A VOLUME ENVELOPE 42 (LONG FADE ENVELEOPE) 
	.DB $01,$0F                               ;Time: 1,    VOL PCT: 100%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $03,$0D                                  ;Time: 3,    VOL PCT: 86%
	.DB $04,$0C                                  ;Time: 4,    VOL PCT: 80%
	.DB $05,$0B                                  ;Time: 5,    VOL PCT: 73%
	.DB $06,$0A                                  ;Time: 6,    VOL PCT: 66%
	.DB $07,$09                                  ;Time: 7,    VOL PCT: 60%
	.DB $08,$08                                  ;Time: 8,    VOL PCT: 53%
	.DB $09,$07                                  ;Time: 9,    VOL PCT: 46%
	.DB $0A,$06                                  ;Time: 10,   VOL PCT: 40%
	.DB $0B,$05                                  ;Time: 11,   VOL PCT: 33%
	.DB $0C,$04                                  ;Time: 12,   VOL PCT: 26%
	.DB $0D,$03                                  ;Time: 13,   VOL PCT: 20%
	.DB $0E,$02                                  ;Time: 14,   VOL PCT: 13%
	.DB $0F,$01                                  ;Time: 15,   VOL PCT: 6%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_28:                                       ;0X2B VOLUME ENVELOPE 43 
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	
VOLUME_ENVELOPE_29: 
	.DB $01,$0F                               	 ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $03,$04                                  ;Time: 3,    VOL PCT: 26%
	.DB $03,$03                                  ;Time: 3,    VOL PCT: 20%
	.DB $03,$02                                  ;Time: 3,    VOL PCT: 13%
	.DB $03,$01                                  ;Time: 3,    VOL PCT: 6%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_30:                              ;0X2C VOLUME ENVELOPE 44 (FULL VOLUME ENVELOPE)
	.DB $FF,$0F                                  ;Time: 255,  VOL PCT: 100%

VOLUME_ENVELOPE_UNUSED_TWO:                      ;0X2D VOLUME ENVELOPE 45 (ZERO VOLUME ENVELOPE)
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_31:                                       	;0X2E VOLUME ENVELOPE 46 
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $03,$0F                                  ;Time: 3,    VOL PCT: 100%
	.DB $03,$0E                                  ;Time: 3,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$06                                  ;Time: 1,    VOL PCT: 40%
	.DB $01,$05                                  ;Time: 1,    VOL PCT: 33%
	.DB $FF,$04                                  ;Time: 255,  VOL PCT: 26%

VOLUME_ENVELOPE_32:                                       ;0X2F-0X30 VOLUME ENVELOPE 47,48
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $02,$09                                  ;Time: 2,    VOL PCT: 60%
	.DB $02,$08                                  ;Time: 2,    VOL PCT: 53%
	.DB $02,$07                                  ;Time: 2,    VOL PCT: 46%
	.DB $02,$06                                  ;Time: 2,    VOL PCT: 40%
	.DB $03,$05                                  ;Time: 3,    VOL PCT: 33%
	.DB $03,$04                                  ;Time: 3,    VOL PCT: 26%
	.DB $03,$03                                  ;Time: 3,    VOL PCT: 20%
	.DB $03,$02                                  ;Time: 3,    VOL PCT: 13%
	.DB $03,$01                                  ;Time: 3,    VOL PCT: 6%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_33:                                       ;0X31-0X32 VOLUME ENVELOPE 49,50
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $0A,$0F                                  ;Time: 10,   VOL PCT: 100%
	.DB $0C,$0E                                  ;Time: 12,   VOL PCT: 93%
	.DB $10,$0D                                  ;Time: 16,   VOL PCT: 86%
	.DB $20,$0C                                  ;Time: 32,   VOL PCT: 80%
	.DB $30,$0B                                  ;Time: 48,   VOL PCT: 73%
	.DB $40,$0A                                  ;Time: 64,   VOL PCT: 66%
	.DB $50,$09                                  ;Time: 80,   VOL PCT: 60%
	.DB $60,$08                                  ;Time: 96,   VOL PCT: 53%
	.DB $70,$07                                  ;Time: 112,  VOL PCT: 46%
	.DB $FF,$06                                  ;Time: 255,  VOL PCT: 40%

VOLUME_ENVELOPE_34:                                       ;0X33 VOLUME ENVELOPE 51
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_35:                                       ;0X34 VOLUME ENVELOPE 52
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$05                                  ;Time: 1,    VOL PCT: 33%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $FF,$08                                  ;Time: 255,  VOL PCT: 53%

VOLUME_ENVELOPE_36:                                       ;0X35 VOLUME ENVELOPE 53
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $02,$0F                                  ;Time: 2,    VOL PCT: 100%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $04,$0C                                  ;Time: 4,    VOL PCT: 80%
	.DB $06,$0B                                  ;Time: 6,    VOL PCT: 73%
	.DB $0C,$0A                                  ;Time: 12,    VOL PCT: 66%
	.DB $FF,$09                                  ;Time: 255,  VOL PCT: 60%

UNUSED_VOLUME_ENVELOPE_ONE:                                       ;VOLUME ENVELOPE UNUSED
	.DB $FF,$0E                                  ;Time: 255,  VOL PCT: 93%

VOLUME_ENVELOPE_37:                                       ;0X36 VOLUME ENVELOPE 54 (FADE OUT) 
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$05                                  ;Time: 1,    VOL PCT: 33%
	.DB $01,$03                                  ;Time: 1,    VOL PCT: 20%
	.DB $01,$01                                  ;Time: 1,    VOL PCT: 6%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_38:                                       ;0X37 VOLUME ENVELOPE 55 (FADE OUT MEDIUM) 
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$06                                  ;Time: 1,    VOL PCT: 40%
	.DB $01,$05                                  ;Time: 1,    VOL PCT: 33%
	.DB $01,$04                                  ;Time: 1,    VOL PCT: 26%
	.DB $01,$03                                  ;Time: 1,    VOL PCT: 20%
	.DB $01,$02                                  ;Time: 1,    VOL PCT: 13%
	.DB $01,$01                                  ;Time: 1,    VOL PCT: 6%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

UNUSED_VOLUME_ENVELOPE_TWO:                                       ; NOTHING
	.DB $FF   

VOLUME_ENVELOPE_39:                                       ;0X38 VOLUME ENVELOPE 56
	.DB $01,$0F                               ;Time: 1,    VOL PCT: 100%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $03,$0C                                  ;Time: 3,    VOL PCT: 80%
	.DB $FF,$0B                                  ;Time: 255,  VOL PCT: 73%

VOLUME_ENVELOPE_40:                                       ;0X39 VOLUME ENVELOPE 57
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $03,$0C                                  ;Time: 3,    VOL PCT: 80%
	.DB $05,$0B                                  ;Time: 5,    VOL PCT: 73%
	.DB $0A,$0A                                  ;Time: 10,    VOL PCT: 66%
	.DB $0F,$09                                  ;Time: 15,    VOL PCT: 60%
	.DB $FF,$08                                  ;Time: 255,  VOL PCT: 53%

UNUSED_VOLUME_ENVELOPE_THREE:                                       ; UNUSED?
	.DB $FF,$0E                                  ;Time: 255,  VOL PCT: 93%

VOLUME_ENVELOPE_41:                                       ;0X3A VOLUME ENVELOPE 58
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $FF,$09                                  ;Time: 255,  VOL PCT: 60%

VOLUME_ENVELOPE_42:                                       ;0X3B VOLUME ENVELOPE 59
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $02,$0F                                  ;Time: 2,    VOL PCT: 100%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_43:                                       ;0X3C VOLUME ENVELOPE 60
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $02,$0F                                  ;Time: 2,    VOL PCT: 100%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $02,$0D                                  ;Time: 2,    VOL PCT: 86%
	.DB $02,$0E                                  ;Time: 2,    VOL PCT: 93%
	.DB $04,$0D                                  ;Time: 4,    VOL PCT: 86%
	.DB $FF,$0C                                  ;Time: 255,  VOL PCT: 80%

VOLUME_ENVELOPE_44:                                       ;0X3D VOLUME ENVELOPE 61
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $02,$0C                                  ;Time: 2,    VOL PCT: 80%
	.DB $02,$0B                                  ;Time: 2,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$08                                  ;Time: 1,    VOL PCT: 53%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$06                                  ;Time: 1,    VOL PCT: 40%
	.DB $01,$05                                  ;Time: 1,    VOL PCT: 33%
	.DB $FF,$04                                  ;Time: 255,  VOL PCT: 26%

VOLUME_ENVELOPE_45:                                       ;0X3E VOLUME ENVELOPE 62
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0F                                  ;Time: 1,    VOL PCT: 100%
	.DB $01,$0E                                  ;Time: 1,    VOL PCT: 93%
	.DB $01,$0D                                  ;Time: 1,    VOL PCT: 86%
	.DB $01,$0C                                  ;Time: 1,    VOL PCT: 80%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $01,$09                                  ;Time: 1,    VOL PCT: 60%
	.DB $01,$07                                  ;Time: 1,    VOL PCT: 46%
	.DB $01,$0B                                  ;Time: 1,    VOL PCT: 73%
	.DB $01,$0A                                  ;Time: 1,    VOL PCT: 66%
	.DB $02,$09                                  ;Time: 2,    VOL PCT: 60%
	.DB $02,$08                                  ;Time: 2,    VOL PCT: 53%
	.DB $FF,$07                                  ;Time: 255,  VOL PCT: 46%


												;FULL VOLUME ENVELOPE POINTERS

VOLUME_ENVELOPE_46:                                       ;0X3F,40 VOLUME ENVELOPE 63,64 (FULL VOLUME 3 FRAMES)
	.DB $03,$0F                                  ;Time: 3,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_47:                                       ;0X41 VOLUME ENVELOPE 65 (FULL VOLUME 4 FRAMES)
	.DB $04,$0F                                  ;Time: 4,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_48:                                       ;0X42 VOLUME ENVELOPE 66 (FULL VOLUME 5 FRAMES)
	.DB $05,$0F                                  ;Time: 5,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_49:                                       ;0X43 VOLUME ENVELOPE 67 (FULL VOLUME 6 FRAMES)
	.DB $06,$0F                                  ;Time: 6,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_50:                                       ;0X44 VOLUME ENVELOPE 68 (FULL VOLUME 7 FRAMES)
	.DB $07,$0F                                  ;Time: 7,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_51:                                       ;0X45 VOLUME ENVELOPE 69 (FULL VOLUME 8 FRAMES)
	.DB $08,$0F                                  ;Time: 8,    VOL PCT: 100%
	.DB $0F,$00                                  ;Time: 15,    VOL PCT: 0%

VOLUME_ENVELOPE_52:                                       ;0X46 VOLUME ENVELOPE 70 (FULL VOLUME 10 FRAMES)
	.DB $0A,$0F                               ;Time: 10,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_53:                                       ;0X47 VOLUME ENVELOPE 71 (FULL VOLUME 12 FRAMES)
	.DB $0C,$0F                                  ;Time: 12,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_54:                                       ;0X48 VOLUME ENVELOPE 72 (FULL VOLUME 14 FRAMES)
	.DB $0E,$0F                                  ;Time: 14,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

VOLUME_ENVELOPE_55:                                       ;0X49 VOLUME ENVELOPE 73 (FULL VOLUME 17 FRAMES)
	.DB $11,$0F                                  ;Time: 17,    VOL PCT: 100%
	.DB $FF,$00                                  ;Time: 255,  VOL PCT: 0%

_F}_VOLUME_ENVELOPE_DATA	

_F{_SOUND_EFFECT_ADDR_TABLE						; DONE

SOUND_EFFECT_SONG_DATA_ADDR_TABLE:            ; SOUND EFFECT ID POINTERS
	.WORD END_ALL_CHANNELS_CH_DATA_POINTERS   ; N/A
	.WORD END_ALL_CHANNELS_CH_DATA_POINTERS   ; N/A
	.WORD UNUSED_FADE_OUT_SOUND_CH_DATA_POINTERS                               ; 0X02  *** could use empty CH data pointer
	.WORD DMC_SAFE_CH_DATA_POINTERS           ; 0X03 “DMC SAFE”
	.WORD DMC_DOWN_CH_DATA_POINTERS           ; 0X04 “DMC DOWN”
	.WORD DMC_HUT_CH_DATA_POINTERS            ; 0X05 “DMC HUT”
	.WORD DMC_TOUCHDOWN_CH_DATA_POINTERS      ; 0X06 “DMC TOUCHDOWN”
	
	.WORD THROW_SOUND_CH_DATA_POINTERS        ; 0X07  THROW
	.WORD SNAP_BALL_SOUND_CH_DATA_POINTERS    ; 0X08  SNAP BALL SOUND 
	.WORD KICK_BALL_SOUND_CH_DATA_POINTERS    ; 0X09  KICK
	.WORD CATCH_BALL_SOUND_CH_DATA_POINTERS   ; 0X0A  CATCH BALL SOUND
	.WORD BALL_HIT_GROUND_SOUND_CH_DATA_POINTERS    ; 0X0B  BALL HIT GROUND
	.WORD WHISTLE_SOUND_CH_DATA_POINTERS                               ; 0X0C  WHISTLE
	.WORD BALL_HIT_HAND_SOUND_CH_DATA_POINTERS                               ; 0X0D  BALL HIT HAND
	
	.WORD TWO_MIN_WARN_SOUND_CH_DATA_POINTERS                               ; 0X0E  2 MINUTE WARNING
	.WORD CLOCK_TICK_SOUND_CH_DATA_POINTERS                               ; 0X0F  LAST SECOND TICKING
	.WORD EMPTY_CH_DATA_POINTERS                               ; 0X10  NOTHING *** uses weird location
	.WORD GUNSHOT_SOUND_CH_DATA_POINTERS                               ; 0X11  GUNSHOT
	
	.WORD HIT_CROSSBAR_SOUND_CH_DATA_POINTERS                               ; 0X12  BALL HIT CROSSBAR
	
	.WORD PRESS_START_SOUND_CH_DATA_POINTERS                               ; 0X13  PRESS START SOUND
	.WORD COIN_TOSS_SOUND_CH_DATA_POINTERS                               ; 0X14  COIN TOSS OPTION
	.WORD KICKOFF_CHOICE_SOUND_CH_DATA_POINTERS                               ; 0X15  COIN TOSS CHOICE
	.WORD SCHEDULE_SKP_CHOICE_SOUND_CH_DATA_POINTERS                               ; 0X16  SCHEDULE CHOICE
	
	.WORD PLAYER_COLLIDE_SOUND_CH_DATA_POINTERS                               ; 0X17  COLLISION SOUND
	.WORD EMPTY_CH_DATA_POINTERS                               ; 0X18  NOTHING  *** uses weird location
	
	.WORD WHOOSH_AIR_SOUND_CH_DATA_POINTERS                               ; 0X19  PUNT/JUMP WHOOSHING AIR
	.WORD RUN_TD_CROWD_SOUND_CH_DATA_POINTERS                               ; 0X1A  RUN TD CROWD NOISE
	.WORD PASS_TD_CROWD_SOUND_CH_DATA_POINTERS                               ; 0X1B  PASS TD CROWD NOISE
	.WORD MADE_XP_CROWD_SOUND_CH_DATA_POINTERS                               ; 0X1C  MAD XP CROWD NOISE
	
	.WORD PLAY_SELECTED_SOUND_CH_DATA_POINTERS                               ; 0X1D  PLAY PICKED
	.WORD PLAY_CALL_OPEN_MENU_CH_DATA_POINTERS                               ; 0X1E  PLAY SCREEN MENU
	.WORD EMPTY_CH_DATA_POINTERS                               ; 0X1F  NOTHING  *** uses weird location

_F}_SOUND_EFFECT_ADDR_TABLE

_F{_SHORT_SONG_ADDR_TABLE						; DONE
	
SHORT_SONGS:                                  ; SHORT SONGS POINTERS (BANK 30)
	.WORD KICKOFF_SONG_CH_DATA_POINTERS                               ; 0X20 KICKOFF CUTSCENE
	.WORD RUSHING_TD_SONG_CH_DATA_POINTERS                               ; 0X21 RUSHING TD
	.WORD SAFETY_SONG_CH_DATA_POINTERS                               ; 0X22 SAFETY
	.WORD TOUCHBACK_SONG_CH_DATA_POINTERS                               ; 0X23 TOUCHBACK
	.WORD INTERCEPTION_SONG_CH_DATA_POINTERS                               ; 0X24 INTERCEPTION	
	.WORD CHANGE_SIDE_SONG_CH_DATA_POINTERS                               ; 0X25 CHANGE SIDE
	.WORD P1_FIRST_DOWN_SONG_CH_DATA_POINTERS                              ; 0X26 P1 FIRST DOWN
	.WORD P2_FIRST_DOWN_SONG_CH_DATA_POINTERS                               ; 0X27 P2 FIRST DOWN
	.WORD MADE_FG_SONG_CH_DATA_POINTERS                               ; 0X28 MADE FG
	.WORD MISSED_FG_SONG_CH_DATA_POINTERS                               ; 0X29 MISSED FG
	
	.WORD EMPTY_CH_DATA_POINTERS              ; 0X2A (NOTHING)  *** uses weird location
	.WORD INJURY_SONG_CH_DATA_POINTERS                               ; 0X2B INJURY
	
	.WORD END_OF_QUARTER_SONG_CH_DATA_POINTERS                               ; 0X2C END OF QUARTER
	.WORD HALFTIME_SONG_CH_DATA_POINTERS                               ; 0X2D HALFTIME
	.WORD CHAIN_MEASURE_SONG_CH_DATA_POINTERS                               ; 0X2E CHAINS MEASUREMENT
	.WORD BLUE_SCREEN_STATS_SONG_CH_DATA_POINTERS                               ; 0X2F END OF GAME
	
	.WORD CONF_CHAMP_SONG_CH_DATA_POINTERS                               ; 0X30 GOING TO SUPER BOWL
	.WORD DIV_CHAMP_SONG_CH_DATA_POINTERS                               ; 0X31 DIVISION CHAMPS
	.WORD FINAL_STANDINGS_SONG_CH_DATA_POINTERS                               ; 0X32 STANDINGS
	
	.WORD UNSUSED_SONG_CH_DATA_POINTERS                               ; 0X33 UNUSED SONG
	.WORD INJURY_RETURN_SONG_CH_DATA_POINTERS                               ; 0X34 INJURY RETURN
	
	.WORD PASSING_TD_SONG_CH_DATA_POINTERS                               ; 0X35 PASSING TOUCHDOWN
	
	.WORD SACK_SONG_CH_DATA_POINTERS                               ; 0X36 SACK
	.WORD FUMBLE_SONG_CH_DATA_POINTERS                               ; 0X37 FUMBLE
	
																	; BANK 28 
	.WORD EMPTY_CH_DATA_POINTERS              						; 0X38 NOTHING  *** uses weird location
	.WORD INTRO_SONG_ALTERNATE_CH_DATA_POINTERS   					; 0X39 INTRO SONG UNUSED
	
	.WORD INTRO_SONG_PART_TWO_CH_DATA_POINTERS                      ; 0X3A INTRO SONG PART TWO
	.WORD INTRO_SONG_PART_ONE_CH_DATA_POINTERS   					; 0X3B INTRO SONG PART ONE
	
_F}_SHORT_SONG_ADDR_TABLE	
	
_F{_IN_GAME_SONG_ADDR_TABLE						; DONE			 
												;BANK 29
PROBOWL_SONG_PTRS:                               ; PROBOWL_SONG_PTRS       
	.WORD P1_PROBOWL_SONG_CH_DATA_POINTERS       ; 0X3C, P1												
	.WORD P2_PROBOWL_SONG_CH_DATA_POINTERS       ; 0X3D, P2
								
PLAYOFF_SONG_PTRS:                               ; PLAYOFF_SONG_PTRS
	.WORD P1_PLAYOFF_SONG_CH_DATA_POINTERS       ; 0X3E, P1
	.WORD P2_PLAYOFF_SONG_CH_DATA_POINTERS                                 ; 0X3F, P2
	
SEASON_SONG_PTRS:                                ; SEASON_SONG_PTRS
	.WORD P1_SEASON_SONG_CH_DATA_POINTERS                               ; 0X40, P1
	.WORD P2_SEASON_SONG_CH_DATA_POINTER                               ; 0X41, P2

PRESEASON_SONG_PTRS:                             ; PRESEASON_SONG_PTRS
	.WORD P1_PRESEASON_SONG_CH_DATA_POINTERS     ; 0X42, P1
	.WORD P2_PRESEASON_SONG_CH_DATA_POINTERS                                 ; 0X43, P2

SUPERBOWL_WINNER_SONG_PTRS:                      ; SUPERBOWL_WINNER_SONG_PTRS
	.WORD SUPERBOWL_SONG_CH_DATA_POINTERS        ; 0X44 SUPERBOWL SCENE     
	.WORD CREDITS_SONG_CH_DATA_POINTERS          ; 0X45 CREDITS

_F}_IN_GAME_SONG_ADDR_TABLE	

UNUSED_SONG_PTRS: 
	.WORD EMPTY_CH_DATA_POINTERS                               ; 0X46 NOTHING  *** uses weird location
	.WORD EMPTY_CH_DATA_POINTERS                               ; 0X47 NOTHING  *** uses weird location

_F{_PLAY_CALL_MENU_OPEN_EFFECT_DATA				; DONE

PLAY_CALL_OPEN_MENU_CH_DATA_POINTERS:            ; PLAY CALL MENU OPEN CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD PLAY_CALL_OPEN_MENU_SQ_0_EFFECT_DATA   ;
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD PLAY_CALL_OPEN_MENU_SQ_1_EFFECT_DATA                                  ;
	
	.DB TRI_EFFECT_CH_ID                                      ; TRI EFFECT 
	.WORD @end_of_channels                     ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_channels                     ;
	
	.DB SQ_0_MUSIC_CH_ID                                      ;
	.WORD @end_of_channels                     ;
	
	.DB SQ_1_MUSIC_CH_ID                                      ;
	.WORD @end_of_channels                      ;
	
	.DB TRI_MUSIC_CH_ID                                      ;	
	.WORD @end_of_channels                      ;
	
	.DB NOISE_MUSIC_CH_ID                                      ;
	.WORD @end_of_channels                     ;

@end_of_channels: 
	.DB $FF                                   ; END OF CHANNEL ADDR
	


PLAY_CALL_OPEN_MENU_SQ_0_EFFECT_DATA:             ; PLAY CALL MENU OPEN SQ0 CH DATA
	.DB $EE                                      ; DISABLE DMC, ENABLE ALL CHANNELS
	.DB $E0,$36                                  ; SET VOLUME ENVELOPE = 36
	.DB $E2,$70                                  ; SET DUTY 25% (SOLID TONE), USE REGISTER VOLUME, USE DEFAULT BASE TEMPO 
	.DB $E3,$05                                  ; SET VOLUME OFFSET = 5
	
PLAY_CALL_OPEN_MENU_NOTE_DATA:                   ; PLAY CALL MENU OPEN NOTES
	.DB $86                                      ; SET NOTE LENGTH = 3/16
	.DB $30                                      ; C3 
	.DB $34                                      ; E3
	.DB $84                                      ; SET NOTE LENGTH = 1/8
	.DB $40                                      ; C4
	.DB $3B                                      ; B3
	.DB $40                                      ; C4
	.DB $86                                      ; SET NOTE LENGTH = 3/16
	.DB $3B                                      ; B3
	.DB $50                                      ; C5
	.DB $E3,$0A                                  ; SET VOLUME LEVEL = 33%
	.DB $50                                      ; C5
	.DB $E3,$0C                                  ; SET VOLUME LEVEL = 20%
	.DB $50                                      ; C5
	.DB $E3,$0E                                  ; SET VOLUME LEVEL = 6%
	.DB $50                                      ; C5
	.DB $FF                                      ; END 

PLAY_CALL_OPEN_MENU_SQ_1_EFFECT_DATA:            ; PLAY CALL MENU OPEN SQ1 CH DATA
	.DB $E0,$28                                  ; SET VOLUME ENVELOPE = 28
	.DB $E2,$70                                  ; SET DUTY 25% (SOLID TONE), CONSTANT VOLUME
	.DB $E3,$08                                  ; SET VOLUME OFFSET = 8
	.DB $E5,$81                                  ; ADJUST PITCH
	.DB $83                                      ; SET NOTE LENGTH = 3/32
	.DB $0C                                      ; SET OCTAVE = MAX FREQ =  TIMER VALUE 0
	.DB $E8                                      ; JUMP-> PLAY CALL MENU OPEN NOTES
	.WORD PLAY_CALL_OPEN_MENU_NOTE_DATA                                  ; 

_F}_PLAY_CALL_MENU_OPEN_EFFECT_DATA

_F{_PLAY_CALL_CHOICE_EFFECT_DATA				; DONE

PLAY_SELECTED_SOUND_CH_DATA_POINTERS:                                       ; PLAY CALL CHOSEN CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD PLAY_SELECTED_SQ0_CH_DATA                            ;
	
	.DB SQ_1_EFFECT_CH_ID                                  	; SQ EFFECT 1
	.WORD PLAY_SELECTED_SQ1_CH_DATA                           	;
	
	.DB $FF                                   ; END OF CHANNEL POINTERS

PLAY_SELECTED_SQ0_CH_DATA:                                       ; PLAY CALL CHOSEN SQ0 CH DATA 
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $E0,$11                                  ; SET VOLUME ENVELOPE INDEX = 17

PLAY_SELECTED_COMMON_CH_DATA:                    ; PLAY CALL OPEN DUTY AND NOTES 
	.DB $E2,$F0                               ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $27                                      ; G3
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $37                                      ; G4
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $29                                      ; A3
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $39                                      ; A4
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $30                                      ; C4
	.DB $E0,$09                                  ; SET VOLUME ENVELOPE INDEX = 9
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $40                                      ; C5
	.DB $FF                                      ; END

PLAY_SELECTED_SQ1_CH_DATA:                       ; PLAY CALL CHOSEN SQ1 CH DATA
	.DB $E0,$06                                  ; SET VOLUME ENVELOPE INDEX = 6
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $E5,$01                                  ; ADJUST PITCH by: 1
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0C                                      ; REST
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $E8                                      ; JUMP-> PLAY CALL OPEN DUTY AND NOTES
	.WORD PLAY_SELECTED_COMMON_CH_DATA           ; 

_F}_PLAY_CALL_CHOICE_EFFECT_DATA

_F{_SCHEDULE_CHOICE_EFFECT_DATA					; DONE

SCHEDULE_SKP_CHOICE_SOUND_CH_DATA_POINTERS:                                       ; SCHEDULE CHOICE CHANNEL POINTERS
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD SCHEDULE_SKP_CHOICE_SQ1_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_channels                                  ;

@end_of_channels:                                 ; TURN OFF NOISE CHANNEL SCHEDULE CHOICE 
	.DB $FF                                      ; END OF CHANNEL ADDR

SCHEDULE_SKP_CHOICE_SQ1_CH_DATA:                                       ; SCHEDULE CHOSEN SQ1 CH DATA
	.DB $E3,$04                                  ; SET VOLUME LEVEL TO 74%
	.DB $E0,$28                                  ; SET VOLUME ENVELOPE INDEX = 40
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $49                                      ; A5
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0C                                      ; REST
	.DB $E0,$29                                  ; SET VOLUME ENVELOPE INDEX = 41
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $50                                      ; C6
	.DB $FF                                      ; END
	
_F}_SCHEDULE_CHOICE_EFFECT_DATA

_F{_PUNT_AIR_WHOOSH_EFFECT_DATA					; DONE

WHOOSH_AIR_SOUND_CH_DATA_POINTERS:                                       ; PUNT AND JUMPING WHOOSHING AIR CHANNEL POINTERS 
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD WHOOSH_AIR_SOUND_NOISE_CH_DATA                                  ;
	.DB $FF                                      ; END OF CHANNEL ADDRESSES

WHOOSH_AIR_SOUND_NOISE_CH_DATA:                                       ; PUNT AND JUMPING WHOOSHING AIR NOISE 
	.DB $E0,$2D                                  ; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%

@whoosh_air_loop:                                       ; WHOOSHING AIR LOOP
	.DB $A0                                   ; SET NOTE LENGTH TO: 2 1/2
	.DB $63                                      ; SET NOISE SAMPLE FREQUENCY TO 400Hz/35KhZ
	.DB $E8                                      ; JUMP-> WHOOSHING AIR LOOP
	.WORD @whoosh_air_loop                                  ;

_F}_PUNT_AIR_WHOOSH_EFFECT_DATA

_F{_RUN_TD_CROWD_EFFECT_DATA					; DONE

RUN_TD_CROWD_SOUND_CH_DATA_POINTERS:            ; TD CROWD NOISE CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                       ; SQ EFFECT 0
	.WORD TD_CROWD_SOUND_SQ_0_CH_DATA           ;
	
	.DB SQ_1_EFFECT_CH_ID                       ; SQ EFFECT 1
	.WORD TD_CROWD_SOUND_SQ_1_CH_DATA                                   ;
	
	.DB NOISE_EFFECT_CH_ID                      ; NOISE EFFECT
	.WORD CROWD_SOUND_NOISE_CH_DATA                                   ;
	
	.DB $FF                                      ; END OF CHANNEL ADDRESSES

TD_CROWD_SOUND_SQ_0_CH_DATA  :                   ; TD CROWD NOISE SQ0 CH DATA
	.DB $E0,$2E                                  ; SET VOLUME ENVELOPE INDEX = 46
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $0C                                      ; REST
	.DB $E9                                      ; DO SECTION-> CROWD NOISE FREQ SWEEP SECTION
	.WORD CROWD_SWEEP_CH_DATA                                  ;
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $0C                                      ; REST
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $E4,$8D                                  ; ENABLE FREQ SWEEP, SWEEP HIGHER, SHIFT AMT: 5
	.DB $50                                      ; C6
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $0C                                      ; REST
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E9                                      ; DO SECTION-> CROWD NOISE FREQ SWEEP SECTION
	.WORD CROWD_SWEEP_CH_DATA                                  ;
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $0C                                      ; REST
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E3,$0D                                  ; SET VOLUME LEVEL TO 14%
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $0C                                      ; REST
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $E4,$8D                                  ; ENABLE FREQ SWEEP, SWEEP HIGHER, SHIFT AMT: 5
	.DB $52                                      ; D6
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $0C                                      ; REST
	.DB $E3,$0E                                  ; SET VOLUME LEVEL TO 7%
	.DB $E9                                      ; DO SECTION-> CROWD NOISE FREQ SWEEP SECTION
	.WORD CROWD_SWEEP_CH_DATA                    ;
	.DB $FF                                      ; END

TD_CROWD_SOUND_SQ_1_CH_DATA:                     ; TD CROWD NOISE SQ1 CH DATA
	.DB $E0,$2E                                  ; SET VOLUME ENVELOPE INDEX = 46
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $0C                                      ; REST

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E9                                      ; DO SECTION-> CROWD NOISE FREQ SWEEP SECTION
	.WORD CROWD_SWEEP_CH_DATA                                  ;
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $E4,$8D                                  ; ENABLE FREQ SWEEP, SWEEP HIGHER, SHIFT AMT: 5
	.DB $47                                      ; G5
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0C                                      ; REST
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $E4,$8D                                  ; ENABLE FREQ SWEEP, SWEEP HIGHER, SHIFT AMT: 5
	.DB $46                                      ; F#5
	.DB $E3,$0D                                  ; SET VOLUME LEVEL TO 14%
	.DB $9A                                      ; SET NOTE LENGTH TO: 1 1/2
	.DB $E4,$8D                                  ; ENABLE FREQ SWEEP, SWEEP HIGHER, SHIFT AMT: 5
	.DB $45                                      ; F5
	.DB $FF                                      ; END

CROWD_SWEEP_CH_DATA:                                           ; CROWD NOISE FREQ SWEEP SECTION 
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $E4,$8D                                  ; ENABLE FREQ SWEEP, SWEEP HIGHER, SHIFT AMT: 5
	.DB $51                                      ; C#6
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0C                                      ; REST
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $E4,$8D                                  ; ENABLE FREQ SWEEP, SWEEP HIGHER, SHIFT AMT: 5
	.DB $4B                                      ; B5
	.DB $EA                                      ; RETURN
	
_F}_RUN_TD_CROWD_EFFECT_DATA					; DONE	

_F{_PASS_TD_CROWD_EFFECT_DATA					; DONE
	
PASS_TD_CROWD_SOUND_CH_DATA_POINTERS             ; CROWD CHANNEL POINTERS

	.DB SQ_0_EFFECT_CH_ID                        ; SQ EFFECT 0
	.WORD @end_of_ch_data                        ; 
	
	.DB SQ_1_EFFECT_CH_ID                        ; SQ EFFECT 1
	.WORD @end_of_ch_data                        ; 
	
	.DB NOISE_EFFECT_CH_ID                       ; NOISE EFFECT
	.WORD CROWD_SOUND_NOISE_CH_DATA               

@end_of_ch_data:	
	.DB $FF                                       ; END

CROWD_SOUND_NOISE_CH_DATA :                      ; CROWD NOISE CHANNEL
	.DB $E0,$2D                                  ; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$04                                  ; SET VOLUME LEVEL TO 74%
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22Hz

	.DB $E3,$01                                  ; SET VOLUME LEVEL TO 94%
	.DB $95                                      ; SET NOTE LENGTH TO: 15/16
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$02                                  ; SET VOLUME LEVEL TO 87%
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $91                                      ; SET NOTE LENGTH TO: 21/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$04                                  ; SET VOLUME LEVEL TO 74%
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $91                                      ; SET NOTE LENGTH TO: 21/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $94                                      ; SET NOTE LENGTH TO: 7/8
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$09                                  ; SET VOLUME LEVEL TO 40%
	.DB $8D                                      ; SET NOTE LENGTH TO: 15/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0A                                  ; SET VOLUME LEVEL TO 34%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0D                                  ; SET VOLUME LEVEL TO 14%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0E                                  ; SET VOLUME LEVEL TO 7%
	.DB $99                                      ; SET NOTE LENGTH TO: 1 5/16
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ
	.DB $FF                                      ; END OF CHANNEL 

_F}_PASS_TD_CROWD_EFFECT_DATA					; DONE

_F{_MADE_XP_CROWD_EFFECT_DATA					; DONE

MADE_XP_CROWD_SOUND_CH_DATA_POINTERS:            ; XP CROWD
	
	.DB SQ_0_EFFECT_CH_ID                        ; SQ EFFECT 0
	.WORD @end_of_ch_data                        ;
	
	.DB SQ_1_EFFECT_CH_ID                        ; SQ EFFECT 1
	.WORD @end_of_ch_data                        ;
	
	.DB NOISE_EFFECT_CH_ID                       ; NOISE EFFECT
	.WORD MADE_XP_NOISE_CH_DATA                                  ;

@end_of_ch_data:
	.DB $FF                                      ; END OF CHANNEL ADDR



MADE_XP_NOISE_CH_DATA:                                       	; XP CROWD NOISE CH DATA
	.DB $E0,$2D                                  ; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0E                                  ; SET VOLUME LEVEL TO 7%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22Hz

	.DB $E3,$0D                                  ; SET VOLUME LEVEL TO 14%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0A                                  ; SET VOLUME LEVEL TO 34%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$09                                  ; SET VOLUME LEVEL TO 40%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$04                                  ; SET VOLUME LEVEL TO 74%
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$01                                  ; SET VOLUME LEVEL TO 94%
	.DB $95                                      ; SET NOTE LENGTH TO: 15/16
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$02                                  ; SET VOLUME LEVEL TO 87%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $EB,$08                                  ; START LOOP AND LOOP 8 TIMES
	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$02                                  ; SET VOLUME LEVEL TO 87%
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $91                                      ; SET NOTE LENGTH TO: 21/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$04                                  ; SET VOLUME LEVEL TO 74%
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $91                                      ; SET NOTE LENGTH TO: 21/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $94                                      ; SET NOTE LENGTH TO: 7/8
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$09                                  ; SET VOLUME LEVEL TO 40%
	.DB $8D                                      ; SET NOTE LENGTH TO: 15/32
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0A                                  ; SET VOLUME LEVEL TO 34%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0D                                  ; SET VOLUME LEVEL TO 14%
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ

	.DB $E3,$0E                                  ; SET VOLUME LEVEL TO 7%
	.DB $99                                      ; SET NOTE LENGTH TO: 1 5/16
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ
	.DB $FF                                      ; END OF CHANNEL 

_F}_XP_CROWD_NOISE_EFFECT_DATA

_F{_PLAYERS_COLLIDING_EFFECT_DATA				; DONE

PLAYER_COLLIDE_SOUND_CH_DATA_POINTERS:                                       ; PLAYERS COLLIDING CHANNEL POINTERS

	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD PLAYERS_COLLIDE_SQ_0_CH_DATA                                  ;
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD PLAYERS_COLLIDE_SQ_1_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD PLAYERS_COLLIDE_NOISE_CH_DATA                                  ;
	
	.DB $FF                                      ; END OF CHANNEL ADDR

PLAYERS_COLLIDE_SQ_0_CH_DATA:                                       ; PLAYERS COLLIDING SQ0 CH DATA
	.DB $E0,$2A                                  ; SET VOLUME ENVELOPE INDEX = 42
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $10                                      ; C2
	.DB $00                                      ; C1
	.DB $15                                      ; F2
	.DB $05                                      ; F1
	.DB $10                                      ; C2
	.DB $00                                      ; C1
	.DB $16                                      ; F#2
	.DB $06                                      ; F#1
	.DB $FF                                      ; END OF CHANNEL 

PLAYERS_COLLIDE_SQ_1_CH_DATA:                                       ; PLAYERS COLLIDING SQ1 CH DATA
	.DB $E0,$2A                                  ; SET VOLUME ENVELOPE INDEX = 42
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $11                                      ; C#2
	.DB $01                                      ; C#1
	.DB $16                                      ; F#2
	.DB $06                                      ; F#1
	.DB $11                                      ; C#2
	.DB $01                                      ; C#1
	.DB $17                                      ; G2
	.DB $07                                      ; G1
	.DB $FF                                      ; END OF CHANNEL 

PLAYERS_COLLIDE_NOISE_CH_DATA:                                       ; PLAYERS COLLIDING NOISE CH DATA
	.DB $E0,$2D                                  ; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$C0                                  ; SET DUTY CYCLE TO 25% INVERTED, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $6B                                      ; SET NOISE FREQ = 1389 HZ/ 1hZ
	.DB $68                                      ; SET NOISE FREQ = 3482 HZ/ 38hZ
	.DB $6D                                      ; SET NOISE FREQ = 434 HZ/ 5hZ
	.DB $6F                                      ; SET NOISE FREQ = 108 HZ/ 1hZ
	.DB $6C                                      ; SET NOISE FREQ = 946 HZ/ 10hZ
	.DB $66                                      ; SET NOISE FREQ = 6046 HZ/ 67hZ
	.DB $6F                                      ; SET NOISE FREQ = 108 HZ/ 1hZ
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ
	.DB $6F                                      ; SET NOISE FREQ = 108 HZ/ 1hZ
	.DB $FF                                      ; END OF CHANNEL 

_F}_PLAYERS_COLLIDING_EFFECT_DATA

_F{_COIN_TOSS_EFFECT_DATA						; DONE

COIN_TOSS_SOUND_CH_DATA_POINTERS:                                       ; COIN TOSS CHANNEL POINTERS
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD COIN_TOSS_SQ0_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD  @end_of_channel                                  ;

 @end_of_channel
	.DB $FF                                   ; END OF CHANNEL ADDRESSES

COIN_TOSS_SQ0_CH_DATA:                           ; COIN TOSS SQ1 CH DATA
	.DB $E0,$2B                                  ; SET VOLUME ENVELOPE INDEX = 43
	.DB $E2,$70                                  ; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $ED,$0A                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 10
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $12                                      ; D2
	.DB $ED,$0B                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 11
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $13                                      ; D#2
	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $14                                      ; E2
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0C                                      ; REST
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $13                                      ; D#2
	.DB $0C                                      ; REST
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $14                                      ; E2
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $11                                      ; C#2
	.DB $FF                                      ; END OF CHANNEL 
	
_F}_COIN_TOSS_EFFECT_DATA	
	
_F{_KICKOFF_CHOICE_EFFECT_DATA					; DONE

KICKOFF_CHOICE_SOUND_CH_DATA_POINTERS:                                       ; COIN TOSS CHOICE POINTERS
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD KICKOFF_CHOICE_EFFECT_SQ1_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_ch_data                                  ;

@end_of_ch_data:
	.DB $FF                                      ; END OF CHANNEL ADDR

KICKOFF_CHOICE_EFFECT_SQ1_CH_DATA:               ; COIN TOSS CHOICE SQ1 DATA
	.DB $E0,$2B                                  ; SET VOLUME ENVELOPE INDEX = 43
	.DB $E2,$70                                  ; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $ED,$0A                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 10
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $19                                      ; A2
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0C                                      ; REST
	.DB $14                                      ; E2
	.DB $0C                                      ; REST
	.DB $12                                      ; D2
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $0C                                      ; REST
	.DB $ED,$0B                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 11
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $18                                      ; G#2
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $17                                      ; G2
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $15                                      ; F2
	.DB $FF                                      ; END OF CHANNEL 
	
_F}_KICKOFF_CHOICE_EFFECT_DATA					; DONE	
	
_F{_PRESS_START_EFFECT_DATA					    ; DONE

PRESS_START_SOUND_CH_DATA_POINTERS:                                       ; PRESS START CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD PRESS_START_EFFECT_SQ0_CH_DATA                                 ;
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD PRESS_START_EFFECT_SQ1_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_ch_data                                  ;

@end_of_ch_data:                                       ;  
	.DB $FF                                   ; END OF CHANNEL ADDR





PRESS_START_EFFECT_SQ0_CH_DATA:                   ; PRESS START SQ0 CH DATA
	.DB $E0,$33                                  ; SET VOLUME ENVELOPE INDEX = 51
	.DB $E2,$F0                                  ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $E9                                      ; DO SECTION->PRESS START SQ CH SECTION
	.WORD PRESS_START_COMMON_SQ_CH_DATA                                  ;
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $40                                      ; C5
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $50                                      ; C6
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $40                                      ; C5
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $50                                      ; C6
	.DB $E3,$0A                                  ; SET VOLUME LEVEL TO 34%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $40                                      ; C5
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $50                                      ; C6
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $40                                      ; C5
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $50                                      ; C6
	.DB $FF                                      ; END OF CHANNEL 

PRESS_START_EFFECT_SQ1_CH_DATA:                    ; PRESS START SQ1 CH DATA
	.DB $E0,$33                                  ; SET VOLUME ENVELOPE INDEX = 51
	.DB $E2,$F0                                  ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $8B                                      ; SET NOTE LENGTH TO: 3/8
	.DB $0C                                      ; REST
	.DB $E9                                      ; DO SECTION->PRESS START SQ CH SECTION
	.WORD PRESS_START_COMMON_SQ_CH_DATA          ;
	.DB $E3,$09                                  ; SET VOLUME LEVEL TO 40%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $40                                      ; C5
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $50                                      ; C6
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $40                                      ; C5
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $50                                      ; C6
	.DB $E3,$0E                                  ; SET VOLUME LEVEL TO 7%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $40                                      ; C5
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $50                                      ; C6
	.DB $FF                                      ; END OF CHANNEL

PRESS_START_COMMON_SQ_CH_DATA:                                       ; PRESS START SQ CH SECTION 
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $32                                      ; D4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $42                                      ; D5
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $34                                      ; E4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $44                                      ; E5
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $37                                      ; G4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $47                                      ; G5
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $40                                      ; C5
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $50                                      ; C6
	.DB $EA                                      ; RETURN FROM SECTION

_F}_PRESS_START_EFFECT_DATA

_F{_BALL_HIT_CROSSBAR_EFFECT_DATA				; DONE

HIT_CROSSBAR_SOUND_CH_DATA_POINTERS:                                       ; BALL HIT CROSSBAR CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQUARE 0
	.WORD HIT_CROSSBAR_EFFECT_SQ_0_CH_DATA                                  ; 
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQUARE 1
	.WORD HIT_CROSSBAR_EFFECT_SQ_1_CH_DATA                                  ;
	.
	DB NOISE_EFFECT_CH_ID                                      ; NOISE 
	.WORD @end_of_ch_data                                  ; 

@end_of_ch_data 
	.DB $FF                                      ; END OF CHANNEL ADDR

HIT_CROSSBAR_EFFECT_SQ_0_CH_DATA:                ; BALL HIT CROSSBAR SQ0 CH DATA
	.DB $E0,$29                                  ; SET VOLUME ENVELOPE INDEX = 41
	.DB $E2,$F0                                  ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $28                                      ; G#3
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $27                                      ; G3
	.DB $94                                      ; SET NOTE LENGTH TO: 7/8
	.DB $26                                      ; F#3
	.DB $FF                                      ; END OF CHANNEL

HIT_CROSSBAR_EFFECT_SQ_1_CH_DATA:                ; BALL HIT CROSSBAR SQ1 CH DATA
	.DB $E0,$29                                  ; SET VOLUME ENVELOPE INDEX = 41
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$01                                  ; SET VOLUME LEVEL TO 94%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $15                                      ; F2
	.DB $16                                      ; F#2
	.DB $15                                      ; F2
	.DB $14                                      ; E2
	.DB $94                                      ; SET NOTE LENGTH TO: 7/8
	.DB $13                                      ; D#2
	

	
EMPTY_CH_DATA_POINTERS:       					 ; *** wierd reuse of ch data
	.DB $FF                                      ; END OF CHANNEL

_F}_BALL_HIT_CROSSBAR_EFFECT_DATA	

_F{_BALL_THROW_EFFECT_DATA						; DONE

THROW_SOUND_CH_DATA_POINTERS:                                       ; THROW SOUND 1 CHANNEL POINTERS
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD THROW_BALL_EFFECT_SQ_0_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD THROW_BALL_EFFECT_SQ_1_CH_DATA                                  ;
	.DB $FF                                      ; END OF CHANNEL ADDRESSES


THROW_BALL_EFFECT_SQ_0_CH_DATA:                                       ; THROW SOUND 1 SQ1 CH DATA
	.DB $E0,$29                                  ; SET VOLUME ENVELOPE INDEX = 41
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$02                                  ; SET VOLUME LEVEL TO 87%
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $E4,$83                                  ; ENABLE FREQ SWEEP, SWEEP LOWER, SHIFT AMT: 3
	.DB $38                                      ; G#4
	.DB $E3,$09                                  ; SET VOLUME LEVEL TO 40%
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $E4,$82                                  ; ENABLE FREQ SWEEP, SWEEP LOWER, SHIFT AMT: 2
	.DB $38                                      ; G#4
	.DB $FF                                      ; END OF CHANNEL 

THROW_BALL_EFFECT_SQ_1_CH_DATA:                                       ; THROW SOUND 1 NOISE CH DATA
	.DB $E0,$29                                  ; SET VOLUME ENVELOPE INDEX = 41
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $60                                      ; SET NOISE FREQ = 447 kHZ/ 4971hZ
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ
	.DB $69                                      ; SET NOISE FREQ = 3002 HZ/ 33hZ
	.DB $67                                      ; SET NOISE FREQ = 5084 HZ/ 56hZ
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $66                                      ; SET NOISE FREQ = 6046 HZ/ 67hZ
	.DB $FF                                      ; END OF CHANNEL
	
_F}_BALL_THROW_EFFECT_DATA	

_F{_SNAP_BALL_SOUND_EFFECT_DATA					; DONE

SNAP_BALL_SOUND_CH_DATA_POINTERS:                                       ; THROW SOUND 2 CHANNEL POINTERS
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD SNAP_BALL_EFFECT_SQ_0_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD SNAP_BALL_EFFECT_SQ_1_CH_DATA                                  ;
	
	.DB $FF                                      ; END OF CHANNEL ADDRESSES

SNAP_BALL_EFFECT_SQ_0_CH_DATA:                   ; THROW SOUND 2 SQ1 CH DATA
	.DB $E0,$2A                                  ; SET VOLUME ENVELOPE INDEX = 42
	.DB $E2,$70                                  ; SET DUTY CYCLE TO 25%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $E4,$82                                  ; ENABLE FREQ SWEEP, SWEEP LOWER, SHIFT AMT: 2
	.DB $45                                      ; F5
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $E4,$82                                  ; ENABLE FREQ SWEEP, SWEEP LOWER, SHIFT AMT: 2
	.DB $45                                      ; F5
	.DB $FF                                      ; END OF CHANNEL

SNAP_BALL_EFFECT_SQ_1_CH_DATA:                     ; THROW SOUND 2 NOISE CH DATA
	.DB $E0,$36                                  ; SET VOLUME ENVELOPE INDEX = 54
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$03                                  ; SET VOLUME LEVEL TO 80%
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $63                                      ; SET NOISE FREQ = 35 kHZ/ 397hZ
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FF                                      ; END OF CHANNEL

_F}_BALL_THROW_SOUND_EFFECT_DATA

_F{_KICK_BALL_EFFECT_DATA						; DONE

KICK_BALL_SOUND_CH_DATA_POINTERS:                                       ; KICK CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD KICK_BALL_EFFECT_SQ_0_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD KICK_BALL_EFFECT_NOISE_CH_DATA                                  ;
	.DB $FF                                      ; END OF CHANNEL ADDRESSES

KICK_BALL_EFFECT_SQ_0_CH_DATA:                                       ; KICK SQ0 CH DATA
	.DB $E0,$29                                  ; SET VOLUME ENVELOPE INDEX = 41
	.DB $E2,$F0                                  ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $15                                      ; F2
	.DB $19                                      ; A2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $13                                      ; D#2
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $15                                      ; F2
	.DB $19                                      ; A2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $13                                      ; D#2
	.DB $FF                                      ; END OF CHANNEL

KICK_BALL_EFFECT_NOISE_CH_DATA:                  ; KICK NOISE CH DATA
	.DB $E0,$2A                                  ; SET VOLUME ENVELOPE INDEX = 42
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $6D                                      ; SET NOISE FREQ = 434 HZ/ 5hZ
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $60                                      ; SET NOISE FREQ = 447 kHZ/ 4971hZ
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $61                                      ; SET NOISE FREQ = 223 kHZ/ 2485hZ
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $61                                      ; SET NOISE FREQ = 223 kHZ/ 2485hZ
	.DB $FF                                      ; END OF CHANNEL

_F}_KICK_BALL_EFFECT_DATA

_F{_CATCH_BALL_EFFECT_DATA						; DONE

CATCH_BALL_SOUND_CH_DATA_POINTERS:                                       ; KICK SOUND 2 CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD CATCH_BALL_EFFECT_SQ_0_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD CATCH_BALL_EFFECT_NOISE_CH_DATA                                  ;
	.DB $FF                                      ; END OF CHANNEL ADDRESSES

CATCH_BALL_EFFECT_SQ_0_CH_DATA:                                       ; KICK SOUND 2 SQ0 CH DATA
	.DB $E0,$28                                  ; SET VOLUME ENVELOPE INDEX = 40
	.DB $E3,$B0                                  ; SET VOLUME LEVEL TO -1073%
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $13                                      ; D#2
	.DB $08                                      ; G#1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $11                                      ; C#2
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $23                                      ; D#3
	.DB $18                                      ; G#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $21                                      ; C#3
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $23                                      ; D#3
	.DB $18                                      ; G#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $21                                      ; C#3
	.DB $FF                                      ; END OF CHANNEL

CATCH_BALL_EFFECT_NOISE_CH_DATA:                                       ; KICK SOUND 2 NOISE CH DATA
	.DB $E0,$2C                                  ; SET VOLUME ENVELOPE INDEX = 44
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$04                                  ; SET VOLUME LEVEL TO 74%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $6D                                      ; SET NOISE FREQ = 434 HZ/ 5hZ
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ
	.DB $6C                                      ; SET NOISE FREQ = 946 HZ/ 10hZ
	.DB $6E                                      ; SET NOISE FREQ = 217 HZ/ 2hZ
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $63                                      ; SET NOISE FREQ = 35 kHZ/ 397hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $66                                      ; SET NOISE FREQ = 6046 HZ/ 67hZ
	.DB $FF                                      ; END OF CHANNEL
	
_F}_CATCH_BALL_EFFECT_DATA	

_F{_BALL_HIT_GROUND_EFFECT_DATA					; DONE

BALL_HIT_GROUND_SOUND_CH_DATA_POINTERS:         ;OUNCE CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID
	.WORD BALL_HIT_GROUND_EFFECT_SQ_0_CH_DATA
	
	.DB TRI_EFFECT_CH_ID                                      ; TRI EFFECT
	.WORD BALL_HIT_GROUND_EFFECT_TRI_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_ch_data

@end_of_ch_data:                                       ;
	.DB $FF                                      ; END OF CHANNEL ADDRESSES

BALL_HIT_GROUND_EFFECT_SQ_0_CH_DATA:                                       ; BALL BOUNCE SQ0 CH DATA
	.DB $E0,$29                                  ; SET VOLUME ENVELOPE INDEX = 41
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $09                                      ; A1
	.DB $08                                      ; G#1
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $0A                                      ; A#1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $0B                                      ; B1
	.DB $FF                                      ; END OF CHANNEL

BALL_HIT_GROUND_EFFECT_TRI_CH_DATA:                                       ; BALL BOUNCE TRI CH DATA
	.DB $E0,$28                                  ; SET VOLUME ENVELOPE INDEX = 40
	.DB $E2,$80                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $39                                      ; A4
	.DB $15                                      ; F2
	.DB $12                                      ; D2
	.DB $14                                      ; E2
	.DB $11                                      ; C#2
	.DB $FF                                      ; END OF CHANNEL
	
_F}_BALL_HIT_GROUND_EFFECT_DATA

_F{_REF_WHISTLE_EFFECT_DATA						; DONE

WHISTLE_SOUND_CH_DATA_POINTERS:                                       ; WHISTLE CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD WHISTLE_EFFECT_SQ_0_CH_DATA                                  ;
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD WHISTLE_EFFECT_SQ_1_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_ch_data                                  ;

@end_of_ch_data:
	.DB $FF                                      ; END OF CHANNEL ADDRESSES

WHISTLE_EFFECT_SQ_0_CH_DATA:                                       ; WHISTLE SQ0 CH DATA
	.DB $E0,$2D                                  ; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$F0                                  ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$04                                  ; SET VOLUME LEVEL TO 74%
	.DB $ED,$01                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 1
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $4B                                      ; B5
	.DB $FF                                      ; END OF CHANNEL

WHISTLE_EFFECT_SQ_1_CH_DATA:                                       ; WHISTLE SQ1 CH DATA
	.DB $E0,$2D                                  ; SET VOLUME ENVELOPE INDEX = 45
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $ED,$02                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 2
	.DB $8D                                      ; SET NOTE LENGTH TO: 15/32
	.DB $50                                      ; C6
	.DB $FF                                      ; END OF CHANNEL
	
_F}_REF_WHISTLE_EFFECT_DATA	

_F{_BALL_HIT_HAND_EFFECT_DATA					; DONE			

BALL_HIT_HAND_SOUND_CH_DATA_POINTERS:                                       ; BALL BOUNCE 2 CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD BALL_HIT_HAND_EFFECT_SQ_0_CH_DATA                                  ;
	
	.DB TRI_EFFECT_CH_ID                                      ; TRI EFFECT
	.WORD BALL_HIT_HAND_EFFECT_TRI_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_ch_data                                 ;

@end_of_ch_data:
	.DB $FF                                      ; END OF CHANNEL ADDRESSES
	
BALL_HIT_HAND_EFFECT_SQ_0_CH_DATA:                                       ; BALL BOUNCE 2 SQ0 CH DATA
	.DB $E0,$29                                  ; SET VOLUME ENVELOPE INDEX = 41
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $09                                      ; A1
	.DB $04                                      ; E1
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $0A                                      ; A#1
	.DB $07                                      ; G1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $0A                                      ; A#1
	.DB $FF                                      ; END OF CHANNEL

BALL_HIT_HAND_EFFECT_TRI_CH_DATA:                                       ; BALL BOUNCE 2 TRI CH DATA 
	.DB $E0,$28                                  ; SET VOLUME ENVELOPE INDEX = 40
	.DB $E2,$80                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNAL VOL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $29                                      ; A3
	.DB $27                                      ; G3
	.DB $25                                      ; F3
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $1A                                      ; A#2
	.DB $18                                      ; G#2
	.DB $16                                      ; F#2
	.DB $14                                      ; E2
	.DB $FF                                      ; END OF CHANNEL
	
_F}_BALL_HIT_GROUND_TWO_EFFECT_DATA	

_F{_TWO_MIN_WARNING_EFFECT_DATA					; DONE

TWO_MIN_WARN_SOUND_CH_DATA_POINTERS:                                       ; TWO MINUTE WARNING CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD TWO_MIN_WARN_EFFECT_SQ_0_CH_DATA                                  ;
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD TWO_MIN_WARN_EFFECT_SQ_1_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_ch_data                                  ;

@end_of_ch_data:
	.DB $FF                                      ; END OF CHANNEL ADDRESSES

TWO_MIN_WARN_EFFECT_SQ_0_CH_DATA:                ; TWO MINUTE WARNING SQ0 CH DATA
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%

TWO_MIN_WARN_EFFECT_COMMON_SQ_CH_DATA:           ; TWO MINUTE WARNING SQ NOTES    
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $3A                                      ; A#4
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $30                                      ; C4
	.DB $33                                      ; D#4
	.DB $31                                      ; C#4
	.DB $34                                      ; E4
	.DB $32                                      ; D4
	.DB $35                                      ; F4
	.DB $33                                      ; D#4
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $ED,$03                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $3A                                      ; A#4
	.DB $FF                                      ; END OF CHANNEL

TWO_MIN_WARN_EFFECT_SQ_1_CH_DATA:                ; TWO MINUTE WARNING SQ1 CH DATA
	.DB $E3,$04                                  ; SET VOLUME LEVEL TO 74%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0C                                      ; REST
	.DB $E5,$02                                  ; ADJUST PITCH by: 2
	.DB $E8                                      ; JUMP->TWO MINUTE WARNING SQ NOTES
	.WORD TWO_MIN_WARN_EFFECT_COMMON_SQ_CH_DATA  ;

_F}_TWO_MIN_WARNING_EFFECT_DATA	

_F{_END_OF_QUARTER_CLOCK_TICK_EFFECT_DATA		; DONE

CLOCK_TICK_SOUND_CH_DATA_POINTERS:                                       ; LAST SECOND TICKING CHANNEL POINTERS
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD END_OF_QUARTER_TICKING_SQ_1_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_ch_data                                  ;

@end_of_ch_data:
	.DB $FF                                      ; END OF CHANNEL ADDRESSES
	
END_OF_QUARTER_TICKING_SQ_1_CH_DATA:                                       ; LAST SECOND TICKING SQ1 CH DATA
	.DB $E2,$F0                                  ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$02                                  ; SET VOLUME LEVEL TO 87%
	.DB $E0,$2C                                  ; SET VOLUME ENVELOPE INDEX = 44
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $33                                      ; D#4
	.DB $33                                      ; D#4
	.DB $33                                      ; D#4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $8C                                      ; SET NOTE LENGTH TO: 7/16
	.DB $33                                      ; D#4
	.DB $FF                                      ; END OF CHANNEL

_F}_END_OF_QUARTER_CLOCK_TICK_EFFECT_DATA

_F{_END_OF_QUARTER_GUNSHOT_EFFECT_DATA			; DONE

GUNSHOT_SOUND_CH_DATA_POINTERS:                                       ; END OF QUARTER GUNSHOT CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD GUNSHOT_EFFECT_SQ_0_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD GUNSHOT_EFFECT_NOISE_CH_DATA                                  ;
	.DB $FF                                      ; END OF CHANNEL ADDR 
	
	
GUNSHOT_EFFECT_SQ_0_CH_DATA:                                       ; END OF QUARTER GUNSHOT SQ0 CH DATA
	.DB $E0,$28                                  ; SET VOLUME ENVELOPE INDEX = 40
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $07                                      ; G1
	.DB $08                                      ; G#1
	.DB $06                                      ; F#1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $09                                      ; A1
	.DB $E9                                      ; DO SECTION-> END OF QUARTER GUNSHOT SQ0 SECTION
	.WORD GUNSHOT_SECTION_SQ_0_CH_DATA           ;
	
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $E9                                      ; DO SECTION-> END OF QUARTER GUNSHOT SQ0 SECTION
	.WORD GUNSHOT_SECTION_SQ_0_CH_DATA           ;
	
	.DB $E3,$0D                                  ; SET VOLUME LEVEL TO 14%
	.DB $E9                                      ; DO SECTION-> END OF QUARTER GUNSHOT SQ0 SECTION
	.WORD GUNSHOT_SECTION_SQ_0_CH_DATA           ;
	.DB $FF                                      ; END OF CHANNEL

GUNSHOT_SECTION_SQ_0_CH_DATA:                                           ; END OF QUARTER GUNSHOT SQUARE 0 SECTION
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $25                                      ; F3
	.DB $08                                      ; G#1
	.DB $06                                      ; F#1
	.DB $09                                      ; A1
	.DB $07                                      ; G1
	.DB $08                                      ; G#1
	.DB $06                                      ; F#1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $09                                      ; A1
	.DB $EA                                      ; RETURN FROM SECTION

GUNSHOT_EFFECT_NOISE_CH_DATA:                                       ; END OF QUARTER GUNSHOT NOISE CH DATA
	.DB $E0,$30                                  ; SET VOLUME ENVELOPE INDEX = 48
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $6A                                      ; SET NOISE FREQ = 1997 HZ/ 22hZ
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $6D                                      ; SET NOISE FREQ = 434 HZ/ 5hZ
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $6F                                      ; SET NOISE FREQ = 108 HZ/ 1hZ
	.DB $95                                      ; SET NOTE LENGTH TO: 15/16
	.DB $6C                                      ; SET NOISE FREQ = 946 HZ/ 10hZ
	.DB $FF                                      ; END OF CHANNEL
	
_F}_END_OF_QUARTER_GUNSHOT_EFFECT_DATA	

_F{_END_ALL_CHANNELS_EFFECT_DATA				; DONE

END_ALL_CHANNELS_CH_DATA_POINTERS:               ; END ALL CHANNELS POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD @end_of_ch_data                                  ;
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD @end_of_ch_data                                  ;
	
	.DB TRI_EFFECT_CH_ID                                      ; TRI EFFECT
	.WORD @end_of_ch_data                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD @end_of_ch_data                                  ;
	
	.DB SQ_0_MUSIC_CH_ID                                      ; SQ MUSIC 0
	.WORD @end_of_ch_data                                  ;
	
	.DB SQ_1_MUSIC_CH_ID                                      ; SQ MUSIC 1
	.WORD @end_of_ch_data                                  ;
	
	.DB TRI_MUSIC_CH_ID                                      ; TRI MUSIC
	.WORD @end_of_ch_data                                  ;
	
	.DB NOISE_MUSIC_CH_ID                                      ; NOISE MUSIC
	.WORD @end_of_ch_data                                  ;

@end_of_ch_data:
	.DB $FF                                      ; END OF CHANNEL ADDRESSES 
	
_F}_END_ALL_CHANNELS_EFFECT_DATA

_F{_DMC_SAMPLE_POINTER_DATA						; DONE *** maybe silly to do this way

DMC_SAFE_CH_DATA_POINTERS:                                       ; DMC “SAFE” CHANNEL POINTER
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD DMC_SAFE_NOISE_CH_DATA 

UNUSED_FADE_OUT_SOUND_CH_DATA_POINTERS							; *** uneeded since fade out handled directly by engine or could use empty ch pinters
	.DB $FF                                      ; END OF CHANNEL ADDR 

DMC_SAFE_NOISE_CH_DATA: 
	.DB $F7                                   ; PLAY DMC “SAFE” SOUND
	.DB $FF                                      ; END OF CHANNEL ADDR

DMC_DOWN_CH_DATA_POINTERS:                                       ; DMC “DOWN” CHANNEL POINTER
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD DMC_DOWN_NOISE_CH_DATA 
	.DB $FF                                   ; END OF CHANNEL ADDR

DMC_DOWN_NOISE_CH_DATA:
	.DB $F8                                      ; PLAY DMC “DOWN” SOUND
	.DB $FF                                      ; END OF CHANNEL ADDR

DMC_HUT_CH_DATA_POINTERS:                                       ; DMC “HUT” CHANNEL POINTER
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD DMC_HUT_NOISE_CH_DATA 
	.DB $FF                                   ; END OF CHANNEL ADDR 

DMC_HUT_NOISE_CH_DATA:
	.DB $F9                                      ; PLAY DMC “HUT” SOUND
	.DB $FF                                      ; END OF CHANNEL ADDR

_F}_DMC_SAMPLE_POINTER_DATA

_F{_TOUCHDOWN_CROWD_NOISE_EFFECT_DATA			; DONE

DMC_TOUCHDOWN_CH_DATA_POINTERS:                                       ; TOUCHDOWN SOUND PLUS MUSIC CHANNEL POINTERS
	
	.DB SQ_0_EFFECT_CH_ID                                      ; SQ EFFECT 0
	.WORD TOUCHDOWN_SOUND_SQ_0_CH_DATA                                  ;
	
	.DB SQ_1_EFFECT_CH_ID                                      ; SQ EFFECT 1
	.WORD TOUCHDOWN_SOUND_SQ_1_CH_DATA                                  ;
	
	.DB TRI_EFFECT_CH_ID                                      ; TRI EFFECT
	.WORD TOUCHDOWN_SOUND_TRI_CH_DATA                                  ;
	
	.DB NOISE_EFFECT_CH_ID                                      ; NOISE EFFECT
	.WORD TOUCHDOWN_SOUND_NOISE_CH_DATA                                  ;
	
	.DB SQ_0_MUSIC_CH_ID                                      ; SQ MUSIC 0
	.WORD @end_of_channel                                  ;
	
	.DB SQ_1_MUSIC_CH_ID                                      ; SQ MUSIC 1
	.WORD @end_of_channel                                  ;
	
	.DB TRI_MUSIC_CH_ID                                      ; TRI MUSIC
	.WORD @end_of_channel                                  ;
	
	.DB NOISE_MUSIC_CH_ID                                      ; NOISE MUSIC
	.WORD @end_of_channel                                  ;

@end_of_channel:
	.DB $FF                                      ; END OF CHANNEL ADDR

TOUCHDOWN_SOUND_TRI_CH_DATA:                                       ; TOUCHDOWN SOUND DMC USES TRIANGLE CHANNEL INDEX
	.DB $FA                                      ; PLAY DMC 'TOUCHDOWN' 
	.DB $FF                                      ; END OF CHANNEL

TOUCHDOWN_SOUND_SQ_0_CH_DATA:                                       ; TOUCHDOWN SOUND SQ0 CH DATA  
	.DB $E0,$00                                  ; SET VOLUME ENVELOPE INDEX = 0
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0F                                  ; SET VOLUME LEVEL TO 0%
	.DB $98                                      ; SET NOTE LENGTH TO: 1 1/4
	.DB $0C                                      ; REST
	.DB $E8                                      ; JUMP-> TD CROWD NOISE SQUARE 0 
	.WORD TD_CROWD_SOUND_SQ_0_CH_DATA                                    ; 

TOUCHDOWN_SOUND_SQ_1_CH_DATA:                                       ; TOUCHDOWN SOUND SQ1 CH DATA  
	.DB $E0,$00                                  ; SET VOLUME ENVELOPE INDEX = 0
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0F                                  ; SET VOLUME LEVEL TO 0%
	.DB $98                                      ; SET NOTE LENGTH TO: 1 1/4
	.DB $0C                                      ; REST
	.DB $E8                                      ; JUMP-> TD CROWD NOISE SQUARE 1
	.WORD TD_CROWD_SOUND_SQ_1_CH_DATA                                   ;

TOUCHDOWN_SOUND_NOISE_CH_DATA:                                       ; TOUCHDOWN SOUND NOISE CH DATA  
	.DB $E0,$00                                  ; SET VOLUME ENVELOPE INDEX = 0
	.DB $E2,$B0                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0F                                  ; SET VOLUME LEVEL TO 0%
	.DB $98                                      ; SET NOTE LENGTH TO: 1 1/4
	.DB $0C                                      ; REST
	.DB $E8                                      ; JUMP-> CROWD NOISE CHANNEL
	.WORD CROWD_SOUND_NOISE_CH_DATA                                   ; 

_F}_TOUCHDOWN_CROWD_NOISE_EFFECT_DATA

_F{_INTRO_SONG_DATA								; DONE

INTRO_SONG_PART_ONE_SECTION_ONE_SQ_0_CH_DATA:                                       ; INTRO SONG SQ0 SECTION 1
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $ED,$01                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 1
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $0C                                      ; REST
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $EB,$0F                                  ; START LOOP AND LOOP 15 TIMES
	.DB $09                                      ; A1
	.DB $EC                                      ; CHECK FOR END OF LOOP
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #2
	.WORD INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA                                  ;
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #2
	.WORD INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA                                  ;
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $07                                      ; G1
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $12                                      ; D2
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $12                                      ; D2
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $12                                      ; D2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $10                                      ; C2
	.DB $09                                      ; A1
	.DB $07                                      ; G1
	.DB $04                                      ; E1
	.DB $07                                      ; G1
	.DB $09                                      ; A1
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #2
	.WORD INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA                                  ;
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #2
	.WORD INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59

	.DB $EB,$0F                                  ; START LOOP AND LOOP 15 TIMES
	.DB $09                                      ; A1
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #2
	.WORD INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA                                  ;
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #2
	.WORD INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA                                  ;
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $07                                      ; G1
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $12                                      ; D2
	.DB $12                                      ; D2
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $12                                      ; D2
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $12                                      ; D2
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $12                                      ; D2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $10                                      ; C2
	.DB $09                                      ; A1
	.DB $07                                      ; G1
	.DB $04                                      ; E1
	.DB $07                                      ; G1
	.DB $09                                      ; A1
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #2
	.WORD INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA                                  ;
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #2
	.WORD INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA                                  ;
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $07                                      ; G1
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $12                                      ; D2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $13                                      ; D#2
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #3
	.WORD INTRO_SONG_PART_ONE_SECTION_THREE_SQ_0_CH_DATA                                  ;
	.DB $13                                      ; D#2
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION #3
	.WORD INTRO_SONG_PART_ONE_SECTION_THREE_SQ_0_CH_DATA                                  ;
	.DB $12                                      ; D2
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $19                                      ; A2
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $98                                      ; SET NOTE LENGTH TO: 1 1/4
	.DB $19                                      ; A2
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $19                                      ; A2
	.DB $18                                      ; G#2
	.DB $17                                      ; G2
	.DB $16                                      ; F#2
	.DB $15                                      ; F2
	.DB $14                                      ; E2
	.DB $13                                      ; D#2
	.DB $12                                      ; D2
	.DB $11                                      ; C#2
	.DB $10                                      ; C2
	.DB $0B                                      ; B1
	.DB $0A                                      ; A#1
	.DB $09                                      ; A1
	.DB $08                                      ; G#1
	.DB $07                                      ; G1
	.DB $06                                      ; F#1
	.DB $05                                      ; F1
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $04                                      ; E1
	.DB $03                                      ; D#1
	.DB $02                                      ; D1
	.DB $01                                      ; C#1
	.DB $00                                      ; C1
	.DB $00                                      ; C1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $00                                      ; C1
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $17                                      ; G2
	.DB $19                                      ; A2
	.DB $20                                      ; C3
	.DB $22                                      ; D3
	.DB $23                                      ; D#3
	.DB $24                                      ; E3
	.DB $27                                      ; G3
	.DB $24                                      ; E3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $27                                      ; G3
	.DB $29                                      ; A3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $27                                      ; G3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $24                                      ; E3
	.DB $27                                      ; G3
	.DB $29                                      ; A3
	.DB $30                                      ; C4
	.DB $29                                      ; A3
	.DB $27                                      ; G3
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $29                                      ; A3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $29                                      ; A3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $34                                      ; E4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $34                                      ; E4
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $32                                      ; D4
	.DB $29                                      ; A3
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $30                                      ; C4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $32                                      ; D4
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $30                                      ; C4
	.DB $29                                      ; A3
	.DB $30                                      ; C4
	.DB $29                                      ; A3
	.DB $27                                      ; G3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $A0                                      ; SET NOTE LENGTH TO: 2 1/2
	.DB $29                                      ; A3
	.DB $ED,$08                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 8
	.DB $98                                      ; SET NOTE LENGTH TO: 1 1/4
	.DB $29                                      ; A3
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $27                                      ; G3
	.DB $26                                      ; F#3
	.DB $25                                      ; F3
	.DB $24                                      ; E3
	.DB $23                                      ; D#3
	.DB $22                                      ; D3
	.DB $21                                      ; C#3
	.DB $20                                      ; C3
	.DB $1B                                      ; B2
	.DB $1A                                      ; A#2
	.DB $19                                      ; A2
	.DB $18                                      ; G#2
	.DB $17                                      ; G2
	.DB $16                                      ; F#2
	.DB $15                                      ; F2
	.DB $14                                      ; E2
	.DB $13                                      ; D#2
	.DB $12                                      ; D2
	.DB $11                                      ; C#2
	.DB $10                                      ; C2
	.DB $0B                                      ; B1
	.DB $0A                                      ; A#1
	.DB $09                                      ; A1
	.DB $08                                      ; G#1
	.DB $07                                      ; G1
	.DB $06                                      ; F#1
	.DB $05                                      ; F1
	.DB $04                                      ; E1
	.DB $03                                      ; D#1
	.DB $02                                      ; D1
	.DB $01                                      ; C#1
	.DB $00                                      ; C1
	.DB $0B                                      ; B1
	.DB $00                                      ; C1
	.DB $00                                      ; C1
	.DB $00                                      ; C1
	.DB $00                                      ; C1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $00                                      ; C1
	.DB $ED,$01                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 1

	.DB $EB,$04                                  ; START LOOP AND LOOP 4 TIMES
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $39                                      ; A4
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $37                                      ; G4
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $34                                      ; E4
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $40                                      ; C5
	.DB $37                                      ; G4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $34                                      ; E4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $39                                      ; A4
	.DB $37                                      ; G4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $34                                      ; E4
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $40                                      ; C5
	.DB $39                                      ; A4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $37                                      ; G4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $39                                      ; A4
	.DB $37                                      ; G4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $34                                      ; E4
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $37                                      ; G4
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $34                                      ; E4
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $32                                      ; D4
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $34                                      ; E4
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $32                                      ; D4
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $30                                      ; C4
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $32                                      ; D4
	.DB $86                                      ; SET NOTE LENGTH TO: 3/16
	.DB $30                                      ; C4
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $29                                      ; A3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $34                                      ; E4
	.DB $37                                      ; G4
	.DB $39                                      ; A4
	.DB $37                                      ; G4
	.DB $34                                      ; E4
	.DB $37                                      ; G4
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $30                                      ; C4
	.DB $29                                      ; A3
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $34                                      ; E4
	.DB $37                                      ; G4
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $39                                      ; A4
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $38                                      ; G#4
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $39                                      ; A4
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $37                                      ; G4
	.DB $32                                      ; D4
	.DB $34                                      ; E4
	.DB $30                                      ; C4
	.DB $32                                      ; D4
	.DB $29                                      ; A3
	.DB $30                                      ; C4
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $34                                      ; E4
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $30                                      ; C4
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $29                                      ; A3
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%

	.DB $EB,$03                                  ; START LOOP AND LOOP 3 TIMES
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $27                                      ; G3
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $27                                      ; G3
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $28                                      ; G#3
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $29                                      ; A3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $29                                      ; A3
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $EA                                      ; RETURN FROM SECTION

INTRO_SONG_PART_ONE_SECTION_ONE_SQ_1_CH_DATA:                                       ; INTRO SONG SQ 1 SECTION 
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $ED,$01                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 1
	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $0C                                      ; REST
	.DB $8D                                      ; SET NOTE LENGTH TO: 15/32
	.DB $0C                                      ; REST
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16

	.DB $EB,$0F                                  ; START LOOP AND LOOP 15 TIMES
	.DB $09                                      ; A1
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $07                                      ; G1
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $07                                      ; G1
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $12                                      ; D2
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $12                                      ; D2
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $12                                      ; D2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $10                                      ; C2
	.DB $09                                      ; A1
	.DB $07                                      ; G1
	.DB $04                                      ; E1
	.DB $07                                      ; G1
	.DB $09                                      ; A1
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $07                                      ; G1
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $07                                      ; G1
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $0C                                      ; REST
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $19                                      ; A2
	.DB $18                                      ; G#2
	.DB $17                                      ; G2
	.DB $16                                      ; F#2
	.DB $15                                      ; F2
	.DB $14                                      ; E2
	.DB $13                                      ; D#2
	.DB $12                                      ; D2
	.DB $11                                      ; C#2
	.DB $10                                      ; C2
	.DB $0B                                      ; B1
	.DB $0A                                      ; A#1
	.DB $09                                      ; A1
	.DB $08                                      ; G#1
	.DB $07                                      ; G1
	.DB $06                                      ; F#1
	.DB $05                                      ; F1
	.DB $04                                      ; E1
	.DB $03                                      ; D#1
	.DB $02                                      ; D1
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $E5,$00                                  ; ADJUST PITCH by: 0
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16

	.DB $EB,$0F                                  ; START LOOP AND LOOP 15 TIMES
	.DB $14                                      ; E2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $12                                      ; D2
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $14                                      ; E2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $12                                      ; D2
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $14                                      ; E2
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $19                                      ; A2
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $19                                      ; A2
	.DB $1A                                      ; A#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $19                                      ; A2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $17                                      ; G2
	.DB $14                                      ; E2
	.DB $12                                      ; D2
	.DB $0B                                      ; B1
	.DB $12                                      ; D2
	.DB $14                                      ; E2

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $12                                      ; D2
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $14                                      ; E2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $12                                      ; D2
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $14                                      ; E2
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $19                                      ; A2
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $1A                                      ; A#2
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $1A                                      ; A#2
	.DB $1B                                      ; B2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $1A                                      ; A#2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $1A                                      ; A#2
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $1A                                      ; A#2
	.DB $1B                                      ; B2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $1A                                      ; A#2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $1A                                      ; A#2
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $24                                      ; E3
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $24                                      ; E3
	.DB $98                                      ; SET NOTE LENGTH TO: 1 1/4
	.DB $24                                      ; E3
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $24                                      ; E3
	.DB $23                                      ; D#3
	.DB $22                                      ; D3
	.DB $21                                      ; C#3
	.DB $20                                      ; C3
	.DB $1B                                      ; B2
	.DB $1A                                      ; A#2
	.DB $19                                      ; A2
	.DB $18                                      ; G#2
	.DB $17                                      ; G2
	.DB $16                                      ; F#2
	.DB $15                                      ; F2
	.DB $14                                      ; E2
	.DB $13                                      ; D#2
	.DB $12                                      ; D2
	.DB $11                                      ; C#2
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $10                                      ; C2
	.DB $0B                                      ; B1
	.DB $0A                                      ; A#1
	.DB $09                                      ; A1
	.DB $08                                      ; G#1
	.DB $07                                      ; G1
	.DB $06                                      ; F#1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $05                                      ; F1
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59

	.DB $EB,$0F                                  ; START LOOP AND LOOP 15 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $08                                      ; G#1
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $09                                      ; A1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $19                                      ; A2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $17                                      ; G2
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $19                                      ; A2
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59

	.DB $EB,$0E                                  ; START LOOP AND LOOP 14 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $08                                      ; G#1
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $09                                      ; A1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $19                                      ; A2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $17                                      ; G2
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $20                                      ; C3
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59

	.DB $EB,$0E                                  ; START LOOP AND LOOP 14 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $11                                      ; C#2
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $12                                      ; D2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $87                                      ; SET NOTE LENGTH TO: 7/32
	.DB $22                                      ; D3
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $20                                      ; C3
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $22                                      ; D3
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $0C                                      ; REST
	.DB $2B                                      ; B3
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $2A                                      ; A#3
	.DB $29                                      ; A3
	.DB $27                                      ; G3
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $24                                      ; E3
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%

	.DB $EB,$03                                  ; START LOOP AND LOOP 3 TIMES
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $22                                      ; D3
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $22                                      ; D3
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $23                                      ; D#3
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $24                                      ; E3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $24                                      ; E3
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $EA                                      ; RETURN FROM SECTION

INTRO_SONG_TRI_CH_SECTION:                       ; INTRO SONG TRI SECTION
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $E2,$80                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $0C                                      ; REST
	.DB $A0                                      ; SET NOTE LENGTH TO: 2 ½

	.DB $EB,$07                                  ; START LOOP AND LOOP 7 TIMES
	.DB $0C                                      ; REST
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $9D                                      ; SET NOTE LENGTH TO: 1 7/8
	.DB $0C                                      ; REST
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $27                                      ; G3
	.DB $26                                      ; F#3
	.DB $25                                      ; F3
	.DB $24                                      ; E3
	.DB $23                                      ; D#3
	.DB $22                                      ; D3
	.DB $21                                      ; C#3
	.DB $20                                      ; C3
	.DB $1B                                      ; B2
	.DB $1A                                      ; A#2
	.DB $19                                      ; A2
	.DB $18                                      ; G#2
	.DB $17                                      ; G2
	.DB $16                                      ; F#2
	.DB $15                                      ; F2
	.DB $14                                      ; E2
	.DB $13                                      ; D#2
	.DB $12                                      ; D2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16

	.DB $EB,$0F                                  ; START LOOP AND LOOP 15 TIMES
	.DB $19                                      ; A2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $17                                      ; G2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $17                                      ; G2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $22                                      ; D3
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $22                                      ; D3
	.DB $23                                      ; D#3
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $22                                      ; D3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $20                                      ; C3
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $14                                      ; E2
	.DB $17                                      ; G2
	.DB $19                                      ; A2

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $17                                      ; G2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $17                                      ; G2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $22                                      ; D3
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $23                                      ; D#3
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $23                                      ; D#3
	.DB $24                                      ; E3
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $23                                      ; D#3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $23                                      ; D#3
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $23                                      ; D#3
	.DB $24                                      ; E3
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $23                                      ; D#3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $22                                      ; D3
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $29                                      ; A3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $29                                      ; A3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $98                                      ; SET NOTE LENGTH TO: 1 1/4
	.DB $29                                      ; A3
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $0C                                      ; REST
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $0C                                      ; REST
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $2A                                      ; A#3
	.DB $0C                                      ; REST
	.DB $30                                      ; C4
	.DB $31                                      ; C#4
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $0C                                      ; REST
	.DB $30                                      ; C4
	.DB $31                                      ; C#4
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $0C                                      ; REST
	.DB $28                                      ; G#3
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $27                                      ; G3
	.DB $0C                                      ; REST
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $27                                      ; G3
	.DB $26                                      ; F#3
	.DB $0C                                      ; REST
	.DB $26                                      ; F#3
	.DB $27                                      ; G3
	.DB $26                                      ; F#3
	.DB $25                                      ; F3
	.DB $0C                                      ; REST
	.DB $26                                      ; F#3
	.DB $27                                      ; G3
	.DB $26                                      ; F#3
	.DB $25                                      ; F3
	.DB $0C                                      ; REST
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16

	.DB $EB,$0F                                  ; START LOOP AND LOOP 15 TIMES
	.DB $19                                      ; A2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $17                                      ; G2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $19                                      ; A2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16

	.DB $EB,$0E                                  ; START LOOP AND LOOP 14 TIMES
	.DB $19                                      ; A2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $17                                      ; G2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $20                                      ; C3
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16

	.DB $EB,$0E                                  ; START LOOP AND LOOP 14 TIMES
	.DB $22                                      ; D3
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $20                                      ; C3
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $22                                      ; D3
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $0C                                      ; REST
	.DB $24                                      ; E3
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $23                                      ; D#3
	.DB $22                                      ; D3
	.DB $20                                      ; C3
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $17                                      ; G2
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $19                                      ; A2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $17                                      ; G2
	.DB $E0,$49                                  ; SET VOLUME ENVELOPE INDEX = 73
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $19                                      ; A2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $17                                      ; G2
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $19                                      ; A2
	.DB $E0,$44                                  ; SET VOLUME ENVELOPE INDEX = 68
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $19                                      ; A2
	.DB $19                                      ; A2
	.DB $19                                      ; A2
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $EA                                      ; RETURN FROM SECTION

INTRO_SONG_PART_ONE_NOISE_CH_SECTION:                                       ; INTRO SONG NOISE CH SECTION
	.DB $E0,$36                                  ; SET VOLUME ENVELOPE INDEX = 54
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz

	.DB $EB,$03                                  ; START LOOP AND LOOP 3 TIMES
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $0C                                      ; REST
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $0C                                      ; REST
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $0C                                      ; REST
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $0C                                      ; REST
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $0C                                      ; REST
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $0C                                      ; REST
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $0C                                      ; REST
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $0C                                      ; REST
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $0C                                      ; REST

	.DB $EB,$04                                  ; START LOOP AND LOOP 4 TIMES
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $66                                      ; D9
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz

	.DB $EB,$04                                  ; START LOOP AND LOOP 4 TIMES
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $67                                      ; SET NOISE FREQ = 5084 HZ/ 56hZ
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $F0                                      ; PLAY DMC KICK DRUM HIGH FREQ 
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $F1                                      ; PLAY DMC KICK DRUM MID FREQ
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $F2                                      ; PLAY DMC KICK DRUM LOW FREQ
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $F2                                      ; PLAY DMC KICK DRUM LOW FREQ
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $E0,$2C                                  ; SET VOLUME ENVELOPE INDEX = 44
	.DB $E3,$00                                  ; SET VOLUME LEVEL TO 100%
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $8E                                      ; SET NOTE LENGTH TO: 1/2
	.DB $63                                      ; SET NOISE SAMPLE FREQUENCY TO 400Hz/35KhZ
	.DB $E0,$36                                  ; SET VOLUME ENVELOPE INDEX = 54
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO SECTION->INTRO SONG DRUM SECTION
	.WORD INTRO_SONG_PART_ONE_DRUM_SECTION                                  ;
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $EA                                      ; RETURN FROM SECTION

INTRO_SONG_ALTERNATE_CH_DATA_POINTERS:                                       ; INTRO SONG CHANNEL POINTERS ALTERNATE UNUSED
	.DB SQ_0_MUSIC_CH_ID                                      ; SQ MUSIC 0
	.WORD INTRO_SONG_PART_ONE_ALTERNATE_SQ_0_CH_DATA                                  ;
	
	.DB SQ_1_MUSIC_CH_ID                                      ; SQ MUSIC 1
	.WORD INTRO_SONG_PART_ONE_ALTERNATE_SQ_1_CH_DATA                                   ;
	
	.DB TRI_MUSIC_CH_ID                                      ; TRI MUSIC
	.WORD INTRO_SONG_ALTERNATE_TRI_CH_DATA                                  ;
	
	.DB NOISE_MUSIC_CH_ID                                      ; NOISE MUSIC
	.WORD INTRO_SONG_PART_ONE_ALTERNATE_NOISE_CH_DATA                                  ;
	
	.DB $FF                                      ; END OF CHANNEL ADDR

INTRO_SONG_PART_ONE_ALTERNATE_SQ_0_CH_DATA:      ; INTRO SONG SQ0 CH DATA ALTERNATE UNUSED
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION 1
	.WORD INTRO_SONG_PART_ONE_SECTION_ONE_SQ_0_CH_DATA                                  ;
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59

	.DB $EB,$04                                  ; START LOOP AND LOOP 4 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $EC                                      ; CHECK FOR END OF LOOP
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $39                                      ; A4
	.DB $38                                      ; G#4
	.DB $37                                      ; G4
	.DB $36                                      ; F#4
	.DB $35                                      ; F4
	.DB $34                                      ; E4
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $31                                      ; C#4
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $2A                                      ; A#3
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $27                                      ; G3
	.DB $26                                      ; F#3
	.DB $25                                      ; F3
	.DB $24                                      ; E3
	.DB $23                                      ; D#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $22                                      ; D3
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $08                                      ; G#1
	.DB $09                                      ; A1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $19                                      ; A2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $06                                      ; F#1
	.DB $07                                      ; G1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $17                                      ; G2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $08                                      ; G#1
	.DB $09                                      ; A1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $19                                      ; A2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0B                                      ; B1
	.DB $10                                      ; C2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $20                                      ; C3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $11                                      ; C#2
	.DB $12                                      ; D2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $22                                      ; D3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $14                                      ; E2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $24                                      ; E3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $14                                      ; E2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $24                                      ; E3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $12                                      ; D2
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $23                                      ; D#3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $14                                      ; E2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $24                                      ; E3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $16                                      ; F#2
	.DB $17                                      ; G2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $27                                      ; G3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $38                                      ; G#4
	.DB $37                                      ; G4
	.DB $36                                      ; F#4
	.DB $35                                      ; F4
	.DB $34                                      ; E4
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $31                                      ; C#4
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $2A                                      ; A#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $29                                      ; A3
	.DB $FF                                      ; END OF CHANNEL 

INTRO_SONG_PART_ONE_ALTERNATE_SQ_1_CH_DATA:                                       ; INTRO SONG SQUARE 1
	.DB $E9                                      ; DO SECTION->INTRO SONG SQUARE 1 SECTION 
	.WORD INTRO_SONG_PART_ONE_SECTION_ONE_SQ_1_CH_DATA                                  ;
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $8D                                      ; SET NOTE LENGTH TO: 15/32
	.DB $0C                                      ; REST
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $E5,$01                                  ; ADJUST PITCH by: 1
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $39                                      ; A4
	.DB $38                                      ; G#4
	.DB $37                                      ; G4
	.DB $36                                      ; F#4
	.DB $35                                      ; F4
	.DB $34                                      ; E4
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $31                                      ; C#4
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $2A                                      ; A#3
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $27                                      ; G3
	.DB $26                                      ; F#3
	.DB $25                                      ; F3
	.DB $24                                      ; E3
	.DB $23                                      ; D#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $22                                      ; D3
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $E5,$02                                  ; ADJUST PITCH by: 2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $E5,$02                                  ; ADJUST PITCH by: 2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $E5,$02                                  ; ADJUST PITCH by: 2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $E5,$02                                  ; ADJUST PITCH by: 2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $E5,$02                                  ; ADJUST PITCH by: 2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $09                                      ; A1
	.DB $E5,$02                                  ; ADJUST PITCH by: 2
	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$02                                  ; START LOOP AND LOOP 2 TIMES
	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $E5,$02                                  ; ADJUST PITCH by: 2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $13                                      ; D#2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $14                                      ; E2
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E5,$08                                  ; ADJUST PITCH by: 8
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $09                                      ; A1
	.DB $E5,$00                                  ; ADJUST PITCH by: 0
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $03                                      ; D#1
	.DB $04                                      ; E1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $01                                      ; C#1
	.DB $02                                      ; D1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $12                                      ; D2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $03                                      ; D#1
	.DB $04                                      ; E1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $14                                      ; E2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $06                                      ; F#1
	.DB $07                                      ; G1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $17                                      ; G2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $08                                      ; G#1
	.DB $09                                      ; A1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $19                                      ; A2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0A                                      ; A#1
	.DB $0B                                      ; B1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $1B                                      ; B2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0A                                      ; A#1
	.DB $0B                                      ; B1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $1B                                      ; B2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $09                                      ; A1
	.DB $0A                                      ; A#1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $1A                                      ; A#2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $0A                                      ; A#1
	.DB $0B                                      ; B1
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $1B                                      ; B2
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $11                                      ; C#2
	.DB $12                                      ; D2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $22                                      ; D3
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $34                                      ; E4
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $34                                      ; E4
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $31                                      ; C#4
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $2A                                      ; A#3
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $27                                      ; G3
	.DB $26                                      ; F#3
	.DB $25                                      ; F3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $24                                      ; E3
	.DB $FF                                      ; END OF CHANNEL 

INTRO_SONG_ALTERNATE_TRI_CH_DATA:                ; INTRO SONG TRI CH DATA ALTERNATE UNUSED
	.DB $E9                                      ; DO SECTION-> INTRO SONG TRI SECTION
	.WORD INTRO_SONG_TRI_CH_SECTION                                  ;

	.DB $EB,$20                                  ; START LOOP AND LOOP 32 TIMES
	.DB $19                                      ; A2
	.DB $EC                                      ; CHECK FOR END OF LOOP
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $17                                      ; G2
	.DB $0C                                      ; REST
	.DB $19                                      ; A2
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $20                                      ; C3
	.DB $22                                      ; D3
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $24                                      ; E3
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $24                                      ; E3
	.DB $23                                      ; D#3
	.DB $24                                      ; E3
	.DB $27                                      ; G3
	.DB $0C                                      ; REST
	.DB $0C                                      ; REST
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $FF                                      ; END OF CHANNEL 

INTRO_SONG_PART_ONE_ALTERNATE_NOISE_CH_DATA:     ; INTRO SONG NOISE CHAN DATA ALTERNATE UNUSED
	.DB $E9                                      ; DO SECTION-> INTRO SONG NOISE CH SECTION
	.WORD INTRO_SONG_PART_ONE_NOISE_CH_SECTION                                  ;
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $E0,$2C                                  ; SET VOLUME ENVELOPE INDEX = 44
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E0,$36                                  ; SET VOLUME ENVELOPE INDEX = 54
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $E0,$2C                                  ; SET VOLUME ENVELOPE INDEX = 44
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E0,$36                                  ; SET VOLUME ENVELOPE INDEX = 54
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903Hz

	.DB $EB,$05                                  ; START LOOP AND LOOP 5 TIMES
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $FF                                      ; END OF CHANNEL 
_F}_INTRO_SONG_DATA

_F{_INTRO_SONG_PART_ONE							; DONE

INTRO_SONG_PART_ONE_CH_DATA_POINTERS:            ; INTRO SONG CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID                         ; SQ MUSIC 0
	.WORD INTRO_SONG_PART_ONE_SQ_0_CH_DATA       ;
	
	.DB SQ_1_MUSIC_CH_ID                          ; SQ MUSIC 1
	.WORD INTRO_SONG_PART_ONE_SQ_1_CH_DATA        ;
	
	.DB TRI_MUSIC_CH_ID                         ; TRI MUSIC
	.WORD INTRO_SONG_PART_ONE_TRI_CH_DATA                                  ;
	
	.DB NOISE_MUSIC_CH_ID                        ; NOISE MUSIC
	.WORD INTRO_SONG_PART_ONE_NOISE_CH_DATA                                  ;
	.DB $FF                                      ; END OF CHANNEL 

INTRO_SONG_PART_ONE_SQ_0_CH_DATA:                 ; INTRO SONG SQ0 CH DATA
	.DB $E9                                      ; DO SECTION->INTRO SONG SQ0 SECTION 1
	.WORD INTRO_SONG_PART_ONE_SECTION_ONE_SQ_0_CH_DATA                                  ;
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59

	.DB $EB,$03                                  ; START LOOP AND LOOP 3 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $E3,$08                                  ; SET VOLUME LEVEL TO 47%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $E3,$0A                                  ; SET VOLUME LEVEL TO 34%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $E3,$0D                                  ; SET VOLUME LEVEL TO 14%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $37                                      ; G4
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $39                                      ; A4
	.DB $FF                                      ; END OF CHANNEL 

INTRO_SONG_PART_ONE_SECTION_TWO_SQ_0_CH_DATA:    ; INTRO SONG SQUARE CHANNELS SECTION #2
	.DB $E3,$06                                  ; SET VOLUME LEVEL TO 60%
	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $90                                      ; SET NOTE LENGTH TO: 5/8
	.DB $07                                      ; G1
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $09                                      ; A1
	.DB $0C                                      ; REST
	.DB $98                                      ; SET NOTE LENGTH TO: 1 1/4
	.DB $0C                                      ; REST
	.DB $EA                                      ; RETURN FROM SECTION

INTRO_SONG_PART_ONE_SECTION_THREE_SQ_0_CH_DATA:  ; INTRO SONG SQUARE CHANNELS SECTION #3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $13                                      ; D#2
	.DB $14                                      ; E2
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $13                                      ; D#2
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $12                                      ; D2
	.DB $10                                      ; C2
	.DB $EA                                      ; RETURN FROM SECTION

INTRO_SONG_PART_ONE_SQ_1_CH_DATA:                 ; INTRO SONG SQ1 CH DATA
	.DB $E9                                      ; DO SECTION->INTRO SONG SQUARE 1 SECTION
	.WORD INTRO_SONG_PART_ONE_SECTION_ONE_SQ_1_CH_DATA                                  ;
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $E0,$3B                                  ; SET VOLUME ENVELOPE INDEX = 59

	.DB $EB,$03                                  ; START LOOP AND LOOP 3 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $34                                      ; E4
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E0,$3C                                  ; SET VOLUME ENVELOPE INDEX = 60
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $34                                      ; E4
	.DB $E3,$09                                  ; SET VOLUME LEVEL TO 40%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $34                                      ; E4
	.DB $E3,$0B                                  ; SET VOLUME LEVEL TO 27%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $34                                      ; E4
	.DB $E3,$0C                                  ; SET VOLUME LEVEL TO 20%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $34                                      ; E4
	.DB $E3,$0E                                  ; SET VOLUME LEVEL TO 7%
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $32                                      ; D4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $88                                      ; SET NOTE LENGTH TO: 1/4
	.DB $34                                      ; E4
	.DB $FF                                      ; END OF CHANNEL

INTRO_SONG_PART_ONE_TRI_CH_DATA:                 ; INTRO SONG TRI CH DATA
	.DB $E9                                      ; DO SECTION-> INTRO SONG TRI SECTION
	.WORD INTRO_SONG_TRI_CH_SECTION                                  ;
	.DB $FF                                      ; END OF CHANNEL 

INTRO_SONG_PART_ONE_NOISE_CH_DATA:               ; INTRO SONG NOISE CH DATA
	.DB $E9                                      ; DO SECTION-> INTRO SONG NOISE CH SECTION
	.WORD INTRO_SONG_PART_ONE_NOISE_CH_SECTION                                  ;
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $F0                                      ; PLAY DMC KICK DRUM HIGH FREQ
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $F1                                      ; PLAY DMC KICK DRUM MID FREQ
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $F2                                      ; PLAY DMC KICK DRUM LOW FREQ
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $8A                                      ; SET NOTE LENGTH TO: 5/16
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FF                                      ; END

INTRO_SONG_PART_ONE_DRUM_SECTION:                                       ; INTRO SONG DRUM SECTION
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $E0,$2C                                  ; SET VOLUME ENVELOPE INDEX = 44
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E0,$36                                  ; SET VOLUME ENVELOPE INDEX = 54
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FB                                      ; PLAY DMC ‘BASS DRUM’ 
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $FC                                      ; PLAY DMC ‘SNARE DRUM’ 
	.DB $65                                      ; SET NOISE FREQ = 11931 HZ/ 132Hz
	.DB $E0,$2C                                  ; SET VOLUME ENVELOPE INDEX = 44
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E0,$36                                  ; SET VOLUME ENVELOPE INDEX = 54
	.DB $EA                                      ; RETURN FROM SECTION 
	
_F}_INTRO_SONG_PART_ONE

_F{_P2_SEASON_SONG_DATA							; DONE

P2_SEASON_SONG_CH_DATA_POINTER:                  ; 0X41  P2 ON FIELD SONG CHANNEL POINTERS
	
	.DB SQ_0_MUSIC_CH_ID                                      ; SQ MUSIC 0
	.WORD P2_SEASON_SONG_SQ_0_CH_DATA                                  ;
	
	.DB SQ_1_MUSIC_CH_ID                                      ; SQ MUSIC 1
	.WORD P2_SEASON_SONG_SQ_1_CH_DATA                                  ;
	
	.DB TRI_MUSIC_CH_ID                                      ; TRI MUSIC
	.WORD P2_SEASON_SONG_TRI_CH_DATA                                  ;
	
	.DB NOISE_MUSIC_CH_ID                                      ; NOISE MUSIC
	.WORD P2_SEASON_SONG_NOISE_CH_DATA                                  ;
	.DB $FF                                      ; END OF CHANNEL ADDR

P2_SEASON_SONG_SQ_0_CH_DATA:                                       ;  SEASON P2 SQ0 CH DATA
	.DB $E0,$35                                  ; SET VOLUME ENVELOPE INDEX = 53
	.DB $E2,$F0                                  ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%

P2_SEASON_SONG_SQ_0_CH_LOOP:                                       ; SEASON P2 SQUARE 0 CHANNEL LOOP 
	.DB $ED,$01                               ; TURN ON VIBRATO USING VIBRATO TYPE: 1
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $29                                      ; A3
	.DB $26                                      ; F#3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $24                                      ; E3
	.DB $26                                      ; F#3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $29                                      ; A3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $93                                      ; SET NOTE LENGTH TO: 27/32
	.DB $29                                      ; A3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $2B                                      ; B3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $97                                      ; SET NOTE LENGTH TO: 1 1/8
	.DB $2B                                      ; B3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $29                                      ; A3
	.DB $26                                      ; F#3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $24                                      ; E3
	.DB $26                                      ; F#3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $26                                      ; F#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $93                                      ; SET NOTE LENGTH TO: 27/32
	.DB $26                                      ; F#3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $28                                      ; G#3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $24                                      ; E3
	.DB $26                                      ; F#3
	.DB $28                                      ; G#3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $29                                      ; A3
	.DB $26                                      ; F#3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $24                                      ; E3
	.DB $26                                      ; F#3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $29                                      ; A3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $97                                      ; SET NOTE LENGTH TO: 1 1/8
	.DB $28                                      ; G#3
	.DB $EF                                      ; TURN OFF VIBRATO
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $37                                      ; G4
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $37                                      ; G4
	.DB $37                                      ; G4
	.DB $36                                      ; F#4
	.DB $37                                      ; G4
	.DB $39                                      ; A4
	.DB $36                                      ; F#4
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $39                                      ; A4
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $3A                                      ; A#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $39                                      ; A4
	.DB $39                                      ; A4
	.DB $37                                      ; G4
	.DB $39                                      ; A4
	.DB $40                                      ; C5
	.DB $3B                                      ; B4
	.DB $39                                      ; A4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $39                                      ; A4
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $39                                      ; A4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $38                                      ; G#4
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $37                                      ; G4
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $36                                      ; F#4
	.DB $35                                      ; F4
	.DB $34                                      ; E4
	.DB $33                                      ; D#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $32                                      ; D4
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $29                                      ; A3
	.DB $0C                                      ; REST
	.DB $28                                      ; G#3
	.DB $29                                      ; A3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $29                                      ; A3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $0C                                      ; REST
	.DB $28                                      ; G#3
	.DB $29                                      ; A3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $37                                      ; G4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $37                                      ; G4
	.DB $37                                      ; G4
	.DB $36                                      ; F#4
	.DB $37                                      ; G4
	.DB $39                                      ; A4
	.DB $36                                      ; F#4
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $84                                      ; SET NOTE LENGTH TO: 1/8
	.DB $39                                      ; A4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $85                                      ; SET NOTE LENGTH TO: 5/32
	.DB $3A                                      ; A#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $39                                      ; A4
	.DB $39                                      ; A4
	.DB $37                                      ; G4
	.DB $39                                      ; A4
	.DB $40                                      ; C5
	.DB $3B                                      ; B4
	.DB $34                                      ; E4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $34                                      ; E4
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $33                                      ; D#4
	.DB $32                                      ; D4
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $31                                      ; C#4
	.DB $82                                      ; SET NOTE LENGTH TO: 1/16
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $83                                      ; SET NOTE LENGTH TO: 3/32
	.DB $27                                      ; G3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $24                                      ; E3
	.DB $0C                                      ; REST
	.DB $22                                      ; D3
	.DB $24                                      ; E3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $24                                      ; E3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $22                                      ; D3
	.DB $22                                      ; D3
	.DB $21                                      ; C#3
	.DB $21                                      ; C#3
	.DB $1B                                      ; B2
	.DB $1B                                      ; B2
	.DB $E8                                      ; JUMP -> PRE-SEASON P1 SQUARE 0 CHANNEL LOOP
	.WORD P2_SEASON_SONG_SQ_0_CH_LOOP                                  ;

P2_SEASON_SONG_SQ_1_CH_DATA:                                       ; SEASON P2 SQ1 CH DATA
	.DB $E0,$35                                  ; SET VOLUME ENVELOPE INDEX = 53
	.DB $E2,$F0                                  ; SET DUTY CYCLE TO 25% inverted, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E3,$07                                  ; SET VOLUME LEVEL TO 54%
	.DB $ED,$01                                  ; TURN ON VIBRATO USING VIBRATO TYPE: 1
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $24                                      ; E3
	.DB $22                                      ; D3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $21                                      ; C#3
	.DB $22                                      ; D3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $26                                      ; F#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $93                                      ; SET NOTE LENGTH TO: 27/32
	.DB $26                                      ; F#3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $28                                      ; G#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $97                                      ; SET NOTE LENGTH TO: 1 1/8
	.DB $28                                      ; G#3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $24                                      ; E3
	.DB $22                                      ; D3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $21                                      ; C#3
	.DB $22                                      ; D3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $22                                      ; D3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $93                                      ; SET NOTE LENGTH TO: 27/32
	.DB $22                                      ; D3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $24                                      ; E3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $97                                      ; SET NOTE LENGTH TO: 1 1/8
	.DB $24                                      ; E3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $24                                      ; E3
	.DB $22                                      ; D3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $21                                      ; C#3
	.DB $22                                      ; D3
	.DB $0C                                      ; REST
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $26                                      ; F#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $26                                      ; F#3
	.DB $26                                      ; F#3
	.DB $26                                      ; F#3
	.DB $97                                      ; SET NOTE LENGTH TO: 1 1/8
	.DB $24                                      ; E3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $30                                      ; C4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $30                                      ; C4
	.DB $27                                      ; G3
	.DB $20                                      ; C3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $30                                      ; C4
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $27                                      ; G3
	.DB $20                                      ; C3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $32                                      ; D4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $32                                      ; D4
	.DB $29                                      ; A3
	.DB $22                                      ; D3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $32                                      ; D4
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $29                                      ; A3
	.DB $22                                      ; D3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $23                                      ; D#3
	.DB $23                                      ; D#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $23                                      ; D#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $23                                      ; D#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $23                                      ; D#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $24                                      ; E3
	.DB $24                                      ; E3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $30                                      ; C4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $30                                      ; C4
	.DB $27                                      ; G3
	.DB $20                                      ; C3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $30                                      ; C4
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $27                                      ; G3
	.DB $20                                      ; C3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $32                                      ; D4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $32                                      ; D4
	.DB $29                                      ; A3
	.DB $22                                      ; D3
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $32                                      ; D4
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $29                                      ; A3
	.DB $22                                      ; D3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $28                                      ; G#3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $28                                      ; G#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $28                                      ; G#3
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $29                                      ; A3
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $38                                      ; G#4
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $39                                      ; A4
	.DB $39                                      ; A4
	.DB $39                                      ; A4
	.DB $97                                      ; SET NOTE LENGTH TO: 1 1/8
	.DB $0C                                      ; REST
	.DB $E8                                      ; JUMP -> PRE-SEASON P1 SQUARE 1 CHANNEL DATA
	.WORD P2_SEASON_SONG_SQ_1_CH_DATA                                  ;

P2_SEASON_SONG_TRI_CH_DATA:                       ; SEASON P2 TRI CH DATA
	.DB $E0,$43                                  ; SET VOLUME ENVELOPE INDEX = 67
	.DB $E2,$80                                  ; SET DUTY CYCLE TO 50%, LENGTH COUNTER ENABLED, USE INTERNVAL VOL

P2_SEASON_SONG_TRI_CH_LOOP:                                       ; SEASON P2 TRIANGLE CHANNEL LOOP
	.DB $89                                     ; SET NOTE LENGTH TO: 9/32
	.DB $19                                      ; A2
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $22                                      ; D3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $22                                      ; D3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $21                                      ; C#3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $22                                      ; D3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $1B                                      ; B2
	.DB $19                                      ; A2
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $22                                      ; D3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $22                                      ; D3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $21                                      ; C#3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $22                                      ; D3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $1B                                      ; B2
	.DB $19                                      ; A2
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $22                                      ; D3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $22                                      ; D3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $21                                      ; C#3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $22                                      ; D3
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $20                                      ; C3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $22                                      ; D3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $1B                                      ; B2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $1B                                      ; B2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $18                                      ; G#2
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $18                                      ; G#2
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $19                                      ; A2
	.DB $19                                      ; A2
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $16                                      ; F#2
	.DB $16                                      ; F#2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $20                                      ; C3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $22                                      ; D3
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $1B                                      ; B2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $0C                                      ; REST
	.DB $1B                                      ; B2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $18                                      ; G#2
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $18                                      ; G#2
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $8F                                      ; SET NOTE LENGTH TO: 9/16
	.DB $19                                      ; A2
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $19                                      ; A2
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $34                                      ; E4
	.DB $33                                      ; D#4
	.DB $0C                                      ; REST
	.DB $34                                      ; E4
	.DB $33                                      ; D#4
	.DB $0C                                      ; REST
	.DB $34                                      ; E4
	.DB $33                                      ; D#4
	.DB $0C                                      ; REST
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $30                                      ; C4
	.DB $0C                                      ; REST
	.DB $31                                      ; C#4
	.DB $30                                      ; C4
	.DB $2B                                      ; B3
	.DB $2A                                      ; A#3
	.DB $29                                      ; A3
	.DB $28                                      ; G#3
	.DB $0C                                      ; REST
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E9                                      ; DO SECTION = FAST NOTE SLIDE DOWN A TO D#
	.WORD FAST_SLIDE_FROM_A3_TO_D3_SHARP                                  ;
	.DB $E8                                      ; JUMP->SEASON P2 TRIANGLE CHANNEL LOOP
	.WORD P2_SEASON_SONG_TRI_CH_LOOP                                  ;

P2_SEASON_SONG_NOISE_CH_DATA:                                       ; SEASON P2 NOISE CHANNEL DATA
	.DB $E2,$30                                  ; SET DUTY CYCLE TO 12.5%, LENGTH COUNTER DISABLED, USE VOLUME VAL
	.DB $E0,$2C                                  ; SET VOLUME ENVELOPE INDEX = 44
	.DB $E3,$05                                  ; SET VOLUME LEVEL TO 67%

P2_SEASON_SONG_NOISE_CH_LOOP:                  ; SEASON P2 NOISE CHANNEL LOOP

	.DB $EB,$0D                               ; START LOOP AND LOOP 13 TIMES
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION                                  ;
	.DB $E9                                      ; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION                                  ;
	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $89                                      ; SET NOTE LENGTH TO: 9/32
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $62                                      ; SET NOISE FREQ = 81 kHZ/ 903hZ
	.DB $E9                                      ; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION                                  ;
	
	.DB $E9                                      ; DO->DRUM SOUND 2 SECTION
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION                                  ;

	.DB $EB,$03                                  ; START LOOP AND LOOP 3 TIMES
	.DB $F3                                      ; TURN ON NOTE BLENDING
	.DB $81                                      ; SET NOTE LENGTH TO: 1/32
	.DB $5F                                      ; SET NOISE FREQ =7043 HZ/ 22hZ
	.DB $6D                                      ; SET NOISE FREQ = 434 HZ/ 5hZ
	.DB $F4                                      ; TURN OFF NOTE BLENDING
	.DB $6A                                      ; F8
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $EB,$03                                  ; START LOOP AND LOOP 3 TIMES
	.DB $E9                                      ; DO SECTION AT
	.WORD DRUM_SOUND_TWO_NOISE_CH_SECTION                                  ;
	.DB $EC                                      ; CHECK FOR END OF LOOP

	.DB $E8                                      ; JUMP -> PRE-SEASON P1 NOISE CHANNEL LOOP
	.WORD P2_SEASON_SONG_NOISE_CH_LOOP                                 ;

_F}_P2_SEASON_SONG_DATA	
												; FILL TO END
.PAD $A000,$FF
