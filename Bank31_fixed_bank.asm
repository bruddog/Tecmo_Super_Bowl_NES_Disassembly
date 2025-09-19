
.ORG $C000

VBLANKS_TO_WAIT_AFTER_RESET				= $02
SIZE_OF_SRAM_TO_CLEAR_ON_RESET			= WEEK_TO_SKIP_TO - SRAM_START + 1				    ; CLEAR SRAM UP skip WEEK
PRIME_NUMBER_FOR_RANDOM_1				= $83 
PRIME_NUMBER_FOR_RANDOM_2				= $0D 
PRIME_NUMBER_FOR_RANDOM_3			    = $11
PPU_BUSY_BITFLAG						= $80


								
;BANK_JUMP_GAME_START					= $8000						; *** can remove later
;BANK_JUMP_DRAW_METATILE_COLLUMN		= $8000					; *** can remove later

; BANK 24
;BANK_JUMP_DO_DRAW_EVENT					= $8000						; *** can remove later
;BANK_JUMP_DRAW_BG_METATILE				= $8006
;BANK_JUMP_INIT_SPRITE_SCRIPTS			= $8009
;BANK_JUMP_START_CHANGING_PALLETE_TASK	= $8012
; BANK_JUMP_DRAW_PLAYER_FACE				= $800F

_F{_RESET_CLEAR_RAM    
                                                                    ; RESET
RESET_START:                                                        ; RESET
	LDA #$08                                                         ; SET GENERATE NMI ON VBLANK OF PPUCONTROL == ON
	STA NES_PPU_CTRL                                                 ;
	CLD                                                              ; SET DECIMAL MODE TO OFF
	SEI                                                              ; SET INTERRUPT DISABLE
	MMC3_SRAM_CHIP_DISABLE                                           ; DISABLE SRAM AND DENY WRITES
SET_STACK:                                                           ;
	SET_STACK[loc] FIXED_BANK_STACK_INDEX 
	LDA #$00                                                         ; CLEAR MEMORY START
	STA $00                                                          ;
	STA $01                                                          ; SET RAM CLEAR COUNTER  = 0
	TAY                                                              ;
	LDX #$08                                                         ; SET NUMBER OF $100 SIZED BANKS TO CLEAR = 8
@reset_clear_ram:                                                     ; CLEAR RAM LOOP (0 to $800),SET SPRITES TO OFFSCREEN
	STA ($00),Y                                                      ;
	INY                                                              ;
	BNE @reset_clear_ram                                              ; DONE FIRST $100? NO->LOOP BACK TO CLEAR RAM LOOP
	INC $01                                                          ;
	DEX                                                              ;
	BNE @reset_clear_ram                                              ; ALL DONE NO->LOOP BACK TO CLEAR RAM LOOP
	STA $01                                                          ; CLEAR COUNTER
	JSR SET_ALL_SPR_OFFSCREEN                                        ; SET SPRITE Y POSITIONS TO OFFSCREEN ()

_F}_RESET_CLEAR_RAM

_F{_RESET_SET_BG_CHR_ENAMBLE_NMI

RESET_SET_IRQ_BG_CHR:                                                ; SET BRG CHR BANK, ENABLE NMI, WAIT FOR PPU TO WARM UP WITH 2 VBLANKS
	LDA #$18                                                         ; SET IRQ BRG CHAR BANK
	STA IRQ_0_BG_0000                                                ;
RESET_ENABLE_NMI:
	LDA #$00                                                         ; SET GENERATE NMI ON VBLANK OF PPUCONTROL == OFF
	STA NES_PPU_CTRL                                                 ;
	STA NES_PPU_MASK                                                 ; SET PPUMASK = DEFAULT

_F}_RESET_SET_BG_CHR_ENAMBLE_NMI

_F{_RESET_WAIT_FOR_VBLANK

RESET_WAIT_FOR_VBLANK_START:
	LDX #VBLANKS_TO_WAIT_AFTER_RESET                                 ; SET  NUMBER OF V-BLANKS TO WAIT  == 2
	
@vblank_started_chk:                                                  ; WAIT FOR VBLANK TO START
	LDA NES_PPU_STATUS                                               ; DOES PPUSTATUS = VBLANK STARTED?
	BPL @vblank_started_chk                                          ; NO->WAIT FOR VBLANK TO START

_WHILE MINUS                                                   		 ; WAIT FOR VBLANK TO FINISH
	
	LDA NES_PPU_STATUS                                               ; DOES PPUSTATUS = IN VBLANK ?

_END_WHILE

	DEX                                                              ; VLBANK COUNTER--
	BNE @vblank_started_chk                                           ; DONE? NO->WAIT FOR VBLANK STARTED LOOP

_F}_RESET_WAIT_FOR_VBLANK

_F{_RESET_SET_SPR_PAT_TABLE_TURN_ON_BG_SPR

SET_SPR_PATTERN_TABLE:
	LDA #$08                                                         ; SET PPUCTRL = SPR PATTERN TABLE ADDR AT $1000
	STA NES_PPU_CTRL                                                 ;

TURN_ON_SPR_BG:                                                      ; TURN ON SPRITES AND BACKGROUND
	LDA #$18                                                         ; SET PPUMASK = SHOW SPRITES AND SHOW BACKGROUND
	STA NES_PPU_MASK                                                 ;

_F}_SET_SPR_PAT_TABLE_TURN_ON_BG_SPR

_F{_RESET_DISABLE_IRQS_SET_VERT_MIRRORING

DISABLE_ALL_IRQS:                                                    ; DISABLE ALL IRQS
	LDA #$00                                                         ;  SET DMC IRQ = DISABLED
	STA APU_DMC_IRQ_FREQ                                             ; INTIALIZE DMC CHANNEL REGISTER
	LDA #$40                                                         ; CLEAR FRAME INTTERUPT
	STA APU_FRAME_COUNTER                                            ;
	STA IRQ_DISABLE_MMC3                                             ; DISABLE MMC3 INTERRUPTS
	LDA NES_PPU_STATUS                                               ; CLEAR PPU ADDRESS LATCH

	LDA #$10                                                         ; **** THINK THIS IS UNDEEDED****
	TAX                                                              ;
DUMMY_WRITES_PPU:                                                    ; SET MMC3 MIRRORING TO VERTICAL AND CLEAR SRAM $6000-$669B
	STA NES_PPU_ADDR                                                 ; DUMMY WRITES TO PPUADDR
	STA NES_PPU_ADDR                                                 ;
	EOR #$10                                                         ;
	DEX                                                              ;
	BNE DUMMY_WRITES_PPU                                             ; **** THINK THIS IS UNDEEDED****

RESET_MMC3_VERT:
	MMC3_SET_VERT_MIRRORING

_F}_RESET_DISABLE_IRQS_SET_VERT_MIRRORING	

_F{_RESET_CLEAR_SRAM_NAMETABLES 

sram_addr = LOCAL_7

RESET_CLEAR_SRAM:
   MMC3_SRAM_WRITE_ENABLE
	LDA #<SIZE_OF_SRAM_TO_CLEAR_ON_RESET                             ; SET SRAM SIZE TO CLEAR == 0X069B
	LDX #>SIZE_OF_SRAM_TO_CLEAR_ON_RESET                             ;
	LDY #<SRAM_START                                                 ; SET SRAM START ADDRESS  == $6000
	STY sram_addr                                                    ;
	LDY #>SRAM_START                                                 ;
	JSR CLEAR_RAM                                                    ; CLEAR RAM ( [X * 0x100] + A , $44,Y=START ADDRESS)
	
RESET_MMC3_SRAM_NOT_WRITE:
	MMC3_SRAM_WRITE_DISABLE
	LDA #$00                                                         ;
	STA NES_PPU_MASK                                                 ; CLEAR PPUMASK
	LDA #>NAMETABLE1_START                                           ; SET PPUADDR REGISTER = $2000
	STA NES_PPU_ADDR                                                 ;
	LDA #<NAMETABLE1_START                                           ; ASLO SET TILE DATA TO 00 = BLANK TILE
	STA NES_PPU_ADDR                                                 ;
	LDX #$10                                                         ; SET NUMBER OF BYTES TO CLEAR = =0XFF0
	LDY #$00                                                         ;

RESET_CLEAR_NAMETABLES:                                              ; CLEAR NAMETABLES ($2000-$2FFF), SET PPU MODES
	STA NES_PPU_DATA                                                 ;
	DEY                                                              ;
	BNE RESET_CLEAR_NAMETABLES                                       ;
	DEX                                                              ;
	BNE RESET_CLEAR_NAMETABLES                                       ;
	LDA #%00011110                                                   ; SET BACKGROUND ==ENABLED, SPRITES== ENABLED, NO CLIPPING, COLOR MODE==COLOR
	STA SOFT_PPU_MASK                                                ; SAVE IN RAM_PPUMASK
	LDA #%10101000                                                   ; SET GENERATE NMI= ON, SPRITE SIZE = 8X16, BG TABLE= $0000, SPRITE TABLE= $1000, INCREMENT ACROSS, NAMETABLE= $2000
	STA SOFT_PPU_CTRL                                                ; SAVE IN RAM PPUCTRL
	STA NES_PPU_CTRL                                                 ; SAVE IN MMC3 PPUCTRL
	CLI                                                              ;
	LDX #$01                                                         ; LOAD 1 FRAME
	JSR WAIT_NUM_FRAMES_RESET                                        ; WAIT FOR NUMBER OF FRAMES RESET(X= FRAMES)
	LDA #$00                                                         ; SET MMC3 PATTERN TABLE to 1KB CHR BANK at PPU $0000-07FF
	STA BANK_SELECT_MMC3                                             ;
	LDA #$18                                                         ; SET MMC3 CHR BANK TO CHR BANK 25
	STA BANK_DATA_MMC3                                               ;

_F}_RESET_CLEAR_SRAM_NAMETABLES

_F{_RESET_SRAM_CORRUPT_CHECK

LENGTH_OF_SRAM_CHECK_TEXT  = $07 
   
   sram_addr = LOCAL_7
	LDX #(LENGTH_OF_SRAM_CHECK_TEXT -1)                              ; SET SRAM VALUES TO CHECK = 7. 0 indexed
SRAM_CORRUPT_CHECK:                                                  ; CHECK FOR SRAM CORRUPTED LOOP
	LDA SRAM_CHECK_VAL,X                                             ; DOES SRAM VALUE= CHECK VALUE
	CMP CHECK_VAL_TO_SAVE_TO_SRAM,X                                  ;
	BNE SRAM_CORRUPTED_CLEAR                                         ;
	DEX                                                              ; SRAM VALUES TO CHECK--
	BPL SRAM_CORRUPT_CHECK                                           ; ALL VALUES CHECKED? NO> LOOP BACK TO CHECK FOR SRAM CORRUPTED LOOP
	JSR CALCULATE_CHECKSUM                                           ; CALCULATE SRAM CHECKSUM
	CPY SRAM_CHECKSUM                                                ; DOES CURRENT CHECKSUM = LAST CHECKSUM
	BNE SRAM_CORRUPTED_CLEAR                                         ; NO-> BRANCH TO SRAM BAD, CLEAR (6000-7FFF), RESET SEASON STATS AND PLAYBOOK
	CPX SRAM_CHECKSUM +1                                             ;
	BEQ SRAM_RAND_TO_RAM_RAND                                        ; YES-> BRANCH TO  TRANSFER SRAM RANDOMS TO RAM RANDOMS AND START MAIN GAME LOOP TASK

SRAM_CORRUPTED_CLEAR:                                               ; SRAM BAD, CLEAR (6000-7FFF), RELOAD DEFAULT SEASON SRAM DATA
	MMC3_SRAM_WRITE_ENABLE
	LDA #<$1FFF                                                      ; SET SRAM SIZE TO CLEAR == 0X1FFF
	LDX #>$1FFF                                                      ;
	LDY #<SRAM_START                                                 ; SET SRAM START ADDRESS  == $6000
	STY sram_addr                                                    ;
	LDY #>SRAM_START                                                 ;
	JSR CLEAR_RAM                                                    ; CLEAR RAM ( [X * 0x100] + A , $44,Y=START ADDRESS)
	
CLEAR_SEASON_STATS_RELOAD_TEAM_DEFAULTS
	LDX #CLEAR_SEASON_STATS_BANK                                     ; LOAD BANK26
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	JSR BANK_JUMP_CLEAR_SEASON_INFO                    				 ; CLEAR SEASON STATS AND RELOAD TO DEFAULT() *** can use actual addr
	JSR BANK_JUMP_RESET_SCHEDULE_RANDOMIZE_ORDER                     ; CLEAR TEAM PLAYBOOK AND RELOAD TO DEFAULT() *** can use actual addr
	MMC3_SRAM_WRITE_ENABLE
	
	
@copy_check_value_from_rom_to_sram:	
	COPY_SOURCE_TO_DEST_Y_INDEX[source_dest_length] CHECK_VAL_TO_SAVE_TO_SRAM, SRAM_CHECK_VAL, LENGTH_OF_SRAM_CHECK_TEXT
	
	MMC3_SRAM_WRITE_DISABLE

	
	

SRAM_RAND_TO_RAM_RAND:                                               ; TRANSFER SRAM RANDOMS TO RAM RANDOMS AND START MAIN GAME LOOP TASK
	LDA SAVED_RANDOM_1                                               ; TRANSFER SAVED RAND1 TO RAND1
	STA RANDOM_1                                                     ;
	LDA SAVED_RANDOM_2                                               ; TRANSFER SAVED RAND2 TO RAND2
	STA RANDOM_2                                                     ;
	LDA SAVED_RANDOM_3                                               ; TRANSFER SAVED RAND3 TO RAND3
	STA RANDOM_3
	LDA #MAIN_GAME_BANK_1                                             ; SET TASK0 BANK ADRESS = BANK 17
	STA (GAME_MENU_TASK + TASK_BANK)
	LDY #<(BANK_JUMP_GAME_START-1)                                   ; SET TASK0 TASK ADDRESS = START GAME MAIN LOOP() *** can use actual addr 
	LDA #>(BANK_JUMP_GAME_START-1)                                   ;
	LDX #GAME_MENU_TASK                                              ; SET TASK INDEX = TASK 0
	JSR CREATE_TASK                                                  ; CREATE TASK (X= TASK INDEX, Y,A= TASK ADDRESS)
	JMP CHECK_TASKS                                                  ; CHECK TASKS RUNNING, WAITING, CREATED ()

CHECK_VAL_TO_SAVE_TO_SRAM:                                          ; SRAM CHECK VALUE
	.DB "AKIHIKO"

_F}_RESET_SRAM_CORRUPT_CHECK

_F{_NMI_SAVE_REGS_TASK_CHECK                                         ; NMI DONE ONCE PER FRAME

NMI_START:                                                          ; NMI (NON-MASKABLE INTERRUPT) ROUTINE
	STA NMI_A                                                        ; SET NMI_PRESERVE_A = A
	STX NMI_X                                                        ; SET NMI_PRESERVE_X = X
	STY NMI_Y                                                        ; SET NMI_PRESERVE_Y = Y
	BIT TASK_BUSY_FLAG                                               ; DOES TASK STATUS = BUSY?
	BPL NMI_TASK_NOT_BUSY                                            ; NO->NMI TASK NOT BUSY

NMI_TASK_BUSY:                                                       ; NMI TASK IS BUSY
	LDA #$00                                                         ; SET IRQ SPLIT INDEX = FIRST IRQ SPLIT
	STA CUR_IRQ_INDEX                                                ;
	LDY CURR_Y_SCROLL                                                ; LOAD Y SCROLL
	LDA CURR_Y_SCROLL+1                                              ;
	JSR UPDATE_IRQ_CHR_BANKS_SCROLL_LOC                              ; UPDATE SCREEN(Y= Y SCROLL, A=IRQ SPLIT SCREEN INDEX)
	JMP RETURN_FROM_NMI_TASK_BUSY                                    ; JUMP -> RETURN FROM NMI WITH NO BANK SWAP, RESTORE REGISTERS

NMI_TASK_NOT_BUSY:                                                   ; NMI TASK NOT BUSY
	SET_SPRITE_DMA SPRITE_DMA_ADDR                                   ; TRANSFER SPRITES VIA DMA
	LDA SOFT_PPU_MASK                                                ; SET MMC3_PPUMASK = RAM_PPUMASK
	STA NES_PPU_MASK                                                 ;
	LDA NES_PPU_STATUS                                               ; READ MMC3_PPUSTATUS TO ACKNOWLEDGE INTERUPT
	LDA METATILE_HEIGHT                                              ; DOES COLUMN HEIGHT = 0
	BEQ NMI_CHECK_PPU_BUFFER_BUSY                                    ; YES->CHECK FOR BUFFER BUSY
	LDA #$06                                                         ; SET BANK TO SWAP = $8000 *** COULD USE BUILT IN ROUTINE BUt mayeb faster unrolled
	STA BANK_SELECT_MMC3                                             ;
	LDA #DRAW_METATILE_BANK                                          ; SET $8000 BANK TO SWAP TO = BANK 23
	STA BANK_DATA_MMC3                                               ;
	JSR BANK_JUMP_DRAW_METATILE_COLLUMN                              ; DRAW METATILE(A= HEIGHT) *** can use actual addr 
	JMP UPDATE_BG_AND_SPR_BANKS                                      ; JUMP-> UPDATE PPU CTRL, CHR BANKS, SOUND, GET JOYPAD, UPDATE TASK

_F}_NMI_SAVE_REGS_TASK_CHECK 

_F{_NMI_PPU_BUFFER_CHECK_TRANSFER

NMI_CHECK_PPU_BUFFER_BUSY:                                           ; CHECK FOR BUFFER BUSY
	BIT PPU_BUFFER_FLAG                                              ; DOES BUFFER TRANSFER STATUS = BUSY
	BPL NMI_CHECK_IF_BUFFER_HAS_DATA                                 ; NO-> CHECK IF BUFFER HAS DATA FOR TRANSFER TO PPU
	JMP UPDATE_BG_AND_SPR_BANKS                                      ; YES-> UPDATE PPU CTRL, CHR BANKS, SOUND, GET JOYPAD, UPDATE TASK


NMI_CHECK_IF_BUFFER_HAS_DATA:                                        ; CHECK IF BUFFER HAS DATA FOR TRANSFER TO PPU
	LDA BG_BUFFER_LENGTH                                             ; IS PPU BUFFER LENGTH = EMPTY
	BNE NMI_CHECK_PPU_TRANSFER_DIRECTION                             ; NO->CHECK FOR TRANSER PPU TO BUFFER OR BUFFER TO PPU
	JMP UPDATE_BG_AND_SPR_BANKS                                      ; YES->UPDATE PPU CTRL, CHR BANKS, SOUND, GET JOYPAD, UPDATE TASK

NMI_CHECK_PPU_TRANSFER_DIRECTION:                                    ; CHECK FOR TRANSER PPU TO BUFFER OR BUFFER TO PPU
	BMI TRANSFER_PPU_TO_BUFFER                                       ; IS PPU BUFFER STATUS = PPU TO BUFFER? YES->TRANSFER PPU DATA TO BUFFER

TRANSFER_BUFFER_TO_PPU:
	LDX #$00                                                         ; SET BUFFER INDEX = BUFFER START

_WHILE NOT_EQUAL                                                    ; TRANSFER BUFFER TO PPU LOOP
	LDA BG_BUFFER_SEGMENT_LENGTH,X                                   ; DOES CURRENT BUFFER SEGMENT LENGTH = ZERO?
	BEQ NMI_BUFFER_TO_PPU_EXIT                                       ; YES->TRANSFER BUFFER TO PPU EXIT
	AND #$40                                                         ; SET PPU ADDRESS INCREMENT TYPE (ACROSS/COL = +1 OR DOWN/ROW = +20) FLAG SET = ROW, NOT SET = COL
	LOG_SHIFT_RIGHT_4
	STA NES_PPU_CTRL                                                 ; SAVE IN PPUCTRL
	LDA BG_BUFFER_SEGMENT_LENGTH,X                                   ; SET PPU DATA LENGTH =  BUFFER LENGTH
	AND #$3F                                                         ; MASK OUT INCREMENT TYPE FLAG
	TAY                                                              ;
	LDA BG_BUFFER_ADDR+1,X                                           ; Set PPU ADDR = BUFFER ADDR
	STA NES_PPU_ADDR                                                 ;
	LDA BG_BUFFER_ADDR,X                                             ;
	STA NES_PPU_ADDR                                                 ;
@transfer_segment_loop:                                              ; TRANSFER CURRENT BUFFER DATA SEGMENT TO PPU
	LDA BG_BUFFER_DATA,X                                             ; TRANSFER BUFFER DATA TO PPU DATA
	STA NES_PPU_DATA                                                 ;
	INX                                                              ; BUFFER INDEX++
	DEY                                                              ; BUFFER LENGTH--
	BNE @transfer_segment_loop                                       ; DONE? NO-> TRANSFER BUFFER DATA TO PPU
	INX                                                              ; SET TO NEXT BUFFER START
	INX                                                              ;
	INX                                                              ;
_END_WHILE                                        					 ; END OF BUFFER? NO->TRANSFER BUFFER TO PPU LOOP

NMI_BUFFER_TO_PPU_EXIT:                                              ; TRANSFER BUFFER TO PPU EXIT
	LDA #$00                                                         ; SET BUFFER LENGTH/TYPE = unlocked, empty
	STA BG_BUFFER_DIR_LOCK_STATUS                                    ;
	LDA #>PPU_PALLETE_START                                          ; SET PPU ADDRESS TO $3F00  = PAL RAM? * UNEEDED * 
	STA NES_PPU_ADDR                                                 ;
	LDA #<PPU_PALLETE_START                                          ;
	STA NES_PPU_ADDR                                                 ; SET ADDRESS BACK TO 0 FOR RENDERING
	STA NES_PPU_ADDR                                                 ; SET PPU ADDRESS TO $0000  = PATTERN TABLE?
	STA NES_PPU_ADDR                                                 ;
	JMP UPDATE_BG_AND_SPR_BANKS                                      ; JUMP-> UPDATE PPU CTRL, CHR BANKS

TRANSFER_PPU_TO_BUFFER:                                              ; TRANSFER PPU DATA TO BUFFER
	BIT BG_BUFFER_DIR_LOCK_STATUS                                    ; IS BUFFER LOCKED  ?
	BVS UPDATE_BG_AND_SPR_BANKS                                      ; YES-> UPDATE PPU CTRL, CHR BANKS, SOUND, GET JOYPAD, UPDATE TASK
	LDA BG_BUFFER_SEGMENT_LENGTH                                     ; IS BUFFER SEGMENT LENGTH/PPU INC FLAG = 0 = EMPTY
	BEQ UPDATE_BG_AND_SPR_BANKS                                      ; YES-> UPDATE PPU CTRL, CHR BANKS, SOUND, GET JOYPAD, UPDATE TASK
	LDA #%00001000                                                   ; SET PPUCTRL PPU ADDRESS INCREMENT  = GOING DOWN BY ONE ROW
	STA NES_PPU_CTRL                                                 ;
	LDX #$00                                                         ; SET BUFFER INDEX = START

_WHILE NOT_EQUAL                                                     ; TRANSFER PPU DATA TO BUFFER LOOP
	LDY BG_BUFFER_SEGMENT_LENGTH,X                                   ; DOES CURRENT BUFFER SEGMENT  = 0 = EMPTY
	BEQ NMI_PPU_TO_BUFFER_EXIT                                       ; YES->PPU TO BUFFER EXIT
	LDA BG_BUFFER_ADDR+1,X                                           ; SET PPU ADDRESS TO TRANSFER DATA FROM = BUFFER ADDRESS
	STA NES_PPU_ADDR                                                 ;
	LDA BG_BUFFER_ADDR,X                                             ;
	STA NES_PPU_ADDR                                                 ;
	LDA NES_PPU_DATA                                                 ; DUMMY DATA READ
	
@transfer_segment_loop:                                              ; TRANSFER PPU DATA INTO BUFFER LOOP
	LDA NES_PPU_DATA                                                 ; STORE PPU DATA INTO BUFFER
	STA BG_BUFFER_DATA,X                                             ;
	INX                                                              ; BUFFER INDEX++
	DEY                                                              ; NUMBER OF BYTES TO TRANSFER--
	BNE @transfer_segment_loop                                       ; DONE? NO-> TRANSFER PPU DATA INTO BUFFER LOOP
	INX                                                              ; BUFFER INDEX= BUFFER INDEX + OFFSET TO NEXT BUFFER
	INX                                                              ;
	INX                                                              ;

_END_WHILE                                          ; LOOP BACK TO TRANSFER PPU DATA TO BUFFERS

NMI_PPU_TO_BUFFER_EXIT:                                              ; PPU TO BUFFER EXIT
	LDA #%11000000                                                   ; SET BUFFER STATUS = ppu to buffer ,BUFFER locked
	STA BG_BUFFER_DIR_LOCK_STATUS                                    ;

_F}_NMI_PPU_BUFFER_CHECK_TRANSFER

_F{_NMI_UPDATE_BG_SPR_BANKS

UPDATE_BG_AND_SPR_BANKS:                                             ; UPDATE PPU CTRL, CHR BANKS
	LDA SOFT_PPU_CTRL                                                ; SET PPU CTRL = SOFT PPU CTRL
	STA NES_PPU_CTRL                                                 ;
	LDA #$00                                                         ; SET IRQ SCREEN SPLIT INDEX = FIRST SPLIT
	STA CUR_IRQ_INDEX                                                ;
	LDY CURR_Y_SCROLL                                                ; LOAD Y SCROLL LOCATION
	LDA CURR_Y_SCROLL+1                                              ;
	JSR UPDATE_IRQ_CHR_BANKS_SCROLL_LOC                              ; UPDATE SCREEN(Y= Y SCROLL, A=IRQ SPLIT SCREEN INDEX)

@transfer_soft_spr_chr_banks_to_ppu                                  ; TRANSFER SOFT CHR BANKS TO CHR BANKS
	
	LDA SOFT_CHR_1000_BANK                                           ; LOAD SOFT $1000 CHR BANK
	LDX #$02                                                         ; SET BANK SELECT MODE =CHR $1000
	STX BANK_SELECT_MMC3                                             ;
	STA BANK_DATA_MMC3                                               ;
	INX                                                              ; SET BANK SELECT MODE = CHR $1400
	
	LDA SOFT_CHR_1400_BANK                                           ; LOAD SOFT $1400 CHR BANK
	STX BANK_SELECT_MMC3                                             ;
	STA BANK_DATA_MMC3                                               ;
	INX                                                              ; SET BANK SELECT MODE =CHR $1800
	
	LDA SOFT_CHR_1800_BANK                                           ; LOAD SOFT $1800 CHR BANK
	STX BANK_SELECT_MMC3                                             ;
	STA BANK_DATA_MMC3                                               ;
	INX                                                              ; SET BANK SELECT MODE =CHR $1C00
	
	LDA SOFT_CHR_1C00_BANK                                           ; LOAD SOFT $1C00 CHR BANK
	STX BANK_SELECT_MMC3                                             ;
	STA BANK_DATA_MMC3                                               ;
	
	LDA SOFT_BANK_SELECT                                             ; SAVE SOFT BANK SELECT IN NMI TEMP
	STA NMI_BANK_SELECT                                              ;
	
	LDA SOFT_MODE_8000                                               ; SET BANK SELECT MODE = $8000 PRG BANK
	ORA #$06
	STA BANK_SELECT_MMC3                                             ;
	LDA #SOUND_ENGINE_BANK                                           ; SET $8000 PRG BANK = BANK 28
	STA BANK_DATA_MMC3                                               ;
	CLI                                                              ; CLEAR INTERRUPT
	JSR SOUND_ENGINE_START                                           ; DO SOUND UPDATE()
	LDA NMI_BANK_SELECT                                              ; RESTORE PREVIOUS SOFT BANK SELECT
	STA SOFT_BANK_SELECT

_F}_NMI_UPDATE_BG_SPR_BANKS

_F{_NMI_READ_JOYPAD

READ_JOYPAD_START:                                                   ; READ JOYPADS
	LDX #$02                                                         ; SET JOYPAD INDEX = PLAYER 2
	LDA #TIMES_TO_CHECK_JOYPAD                                       ; SET MAX TIMES TO CHECK JOYPAD = 4
	STA JOY_CHECK                                                    ;

_WHILE NOT_EQUAL                                                     ; JOYPAD READ LOOP

	LDA CURR_JOY_RAW-$01,X                                           ; SET LAST JOYPAD BUTTON STATUS = JOYPAD BUTTON STATUS
@strobe_and_reset_num_buttons:                                       ;
	STA LAST_JOY                                                     ; SAVE LAST JOYPAD READ
	STROBE_JOYPAD                                                    ;
	LDY #NUM_BUTTONS_TO_READ                                         ; SET NUMBER OF BUTTONS TO READ = 8
@joy_read_loop:                                                      ; READ BUTTONS LOOP
	LDA JOYPAD_1-$01,X                                               ; READ BUTTON
	LSR                                                              ; SAVE BUTTON IN JOYPAD DATA
	ROL TEMP_JOY_DATA                                                ;
	AND #$01                                                         ;
	ORA TEMP_JOY_DATA                                                ;
	STA TEMP_JOY_DATA                                                ;
	DEY                                                              ; NUMBER OF BUTTONS TO READ--
	BNE @joy_read_loop                                               ; ALL BUTTONS READ? NO-> READ BUTTONS LOOP
	
	CMP LAST_JOY                                                     ; DOES LAST JOYPAD STATUS = PREVIOUS
	BEQ @save_cur_joy_data                                           ; YES-> SAVE BUTTON DATA
	DEC JOY_CHECK                                                    ; MAX TIMES TO CHECK JOYPAD--
	BNE @strobe_and_reset_num_buttons                                ; CHECKED MAX TIMES? NO->JOYPAD READ LOOP
	JMP @check_done_both_joy                                         ; JUMP->  CHECK FOR BOTH JOYPAD READ,SAVE BOTH JOYPAD RAW AND PRESS IF DONE

@save_cur_joy_data:                                                  ; SAVE BUTTON DATA
	LDA CURR_JOY_RAW-$01,X                                           ; DOES LAST BUTTON VALUE = NEW BUTTON VALUE? YES = PRESS OCCURRED, NO= NO PRESS
	EOR TEMP_JOY_DATA                                                ;
	AND TEMP_JOY_DATA                                                ;
	STA CURR_JOY_PRESS-$01,X                                         ; SET CURRENT PLAYER BUTTON PRESS = NEW JOYPAD PRESS VALUE
	LDA TEMP_JOY_DATA                                                ; SET CURRENT PLAYER JOYPAD RAW = NEW JOYPAD RAW VALUE
	STA CURR_JOY_RAW-$01,X                                           ;
@check_done_both_joy:                                                ; CHECK FOR BOTH JOYPAD READ,SAVE BOTH JOYPAD RAW AND PRESS IF DONE
	DEX                                                              ; JOYPAD INDEX--

_END_WHILE                                                          ; DONE? NO-> JOYPAD READ LOOP

@or_both_buttons:
	LDA JOY_RAW_1                                                    ; SET JOYPAD RAW = JOYPAD 1 RAW || JOYPAD 2 RAW
	ORA JOY_RAW_2                                                    ;
	STA JOY_RAW_BOTH                                                 ;
	LDA JOY_PRESS_1                                                  ; SET JOYPAD PRESS = JOYPAD 1 PRESS || JOYPAD 2 PRESS
	ORA JOY_PRESS_2                                                  ;
	STA JOY_PRESS_BOTH                                               ;

_F}_NMI_READ_JOYPAD

_F{_NMI_UPDATE_RANDOMS_SLOW_MOTION_PAUSE_CHECK

NMI_UPDATE_RANDOM_NUMS:                                              ; UPDATE RANDOM NUMBERS AND CHECK FOR SLOW MOTION/PAUSE ENABLED
	JSR UPDATE_ALL_RANDOMS                                           ; UPDATE RANDOM NUMBERS $3B,$3C,$3D()
	INC FRAME_COUNTER                                                ; FRAME COUNTER ++
	LDA SLOW_MOTION_PAUSE_DEBUG                                      ; IS SLOW MOTION/STOP DEBUG MODE = ENABLED
	CMP #$07                                                         ;
	BNE @update_tasks                                                ; NO-> JUMP TO UPDATE TASKS
	LDA JOY_RAW_1                                                    ; IS P1 RAW = SELECT
	AND #SELECT_BUTTON                                               ;
	BEQ @update_tasks                                                ; NO-> JUMP TO UPDATE TASKS

	BIT JOY_RAW_1                                                    ; LOAD P1 RAW = A?
	BMI @pause_gameplay                                              ; IS SELECT+A HELD? YES-> RETURN WITHOUT UPDATING TASKS = PAUSE GAMEPLAY
	BVC @update_tasks                                                ; IS B HELD NO-> JUMP TO UPDATE TASKS
	LDA FRAME_COUNTER                                                ; SETS GAME SPEED = 50%
	AND #$07                                                         ;
	BEQ @update_tasks                                                ;

@pause_gameplay:                                                    ; RETURN WITHOUT UPDATING TASKS = PAUSE GAMEPLAY
	JMP RETURN_FROM_NMI_ENABLE_INT_RESTORE_BANKS                     ; RETURN FROM NMI TO PREVIOUS 8000/A000 BANKS


@update_tasks:                                                       ; JUMP TO UPDATE TASKS
	JMP UPDATE_ALL_TASKS                                             ; UPDATE ALL TASKS()
	
_F}_NMI_UPDATE_RANDOMS_SLOW_MOTION_PAUSE_CHECK

_F{_IRQ                                                              ; IRQ ROUTINE 2-3 SCANLINES
IRQ_START:                                                           ; IRQ ROUTINE
	STA IRQ_A                                                        ; SET IRQ_A = A
	STX IRQ_X                                                        ; SET IRQ_X = X
	STY IRQ_Y                                                        ; SET IRQ_Y = Y
	STA IRQ_DISABLE_MMC3                                             ; ACKNOWLEDGE IRQ INTERRUPT AND DISABLE IRQS
	STA IRQ_ENABLE_MMC3                                              ; RE-ENABLE IRQS
	LDA #$00                                                         ; SET Y SCROLL =0
	TAY                                                              ;
	JSR UPDATE_IRQ_CHR_BANKS_SCROLL_LOC                              ; UPDATE SCREEN(Y= Y SCROLL, A=IRQ SPLIT SCREEN INDEX)
	LDA SOFT_BANK_SELECT                                             ; SET BANK $8000 SELECT = SOFT BANK SELECT
	STA BANK_SELECT_MMC3                                             ;
	LDY IRQ_Y                                                        ; RESTORE Y FROM IRQ_Y
	LDX IRQ_X                                                        ; RESTORE X FROM IRQ_X
	LDA IRQ_A                                                        ; RESTORE A FROM IRQ_A
	RTI                                                              ; RETURN FROM INTERRUPT

UPDATE_IRQ_CHR_BANKS_SCROLL_LOC:                                     ; UPDATE SCREEN (Y= Y SCROLL, A=IRQ SPLIT SCREEN INDEX)
	DEY                                                              ; Y SCROLL LOCATION--
	AND #$01                                                         ;
	ASL                                                              ;
	STA IRQ_NAMETABLE                                                ;
	LDX CUR_IRQ_INDEX                                                ; SET INDEX=  CURRENT SPLIT SCREEN INDEX
	LDA CURR_IRQ_NAMETABLE,X                                         ; IS VERTICAL SCROLLING SET
	CMP #$20                                                         ;
	BCS UPDATE_PPU_CTRL_VERT_SCROLL                                  ; YES-> OTHER SPLIT SCREEN (USED DURING TOUCHDOWNS)
	STY IRQ_Y_SCROLL                                                 ; SAVE Y SCROLL LOCATION
	LDA SOFT_PPU_CTRL                                                ; CHECK IF WE'VE REACHED NEXT NAME TABLE IN X OR Y DIRECTION
	AND #%11111100                                                   ; UPDATE NAME TABLE ADDRESS IF SO
	ORA CURR_IRQ_NAMETABLE,X                                         ;
	ORA IRQ_NAMETABLE                                                ;
	STA SOFT_PPU_CTRL                                                ;
	TAY                                                              ;
	LDA CURR_IRQ_XSCROLL,X                                           ; SET X SCROLL LOC = SPLIT SCREEN X LOW BYTE
	STA NES_PPU_SCROLL                                               ;
	LDA IRQ_Y_SCROLL                                                 ; SET Y SCROLL LOCATION
	STA NES_PPU_SCROLL                                               ;
	STY NES_PPU_CTRL                                                 ; SET PPUCTRL = SOFT PPU CTRL
	JMP UPDATE_BG_CHR_BANKS                                          ; JUMP-> UPDATE BG CHR BANKS

UPDATE_PPU_CTRL_VERT_SCROLL:                                         ; VERTICAL BG SCROLLING
	LSR                                                              ; SET PPU ADDRESS MODE
	LSR                                                              ;
	LSR                                                              ;
	LDA SOFT_PPU_CTRL                                                ; SET SOFT PPU CTRL
	AND #%11111100                                                   ; RESET NAMETABlE TO $2000
	ADC #$00                                                         ;
	STA SOFT_PPU_CTRL                                                ;
	LDY #$04                                                         ; LOAD NUMBER OF CYCLES TO WAIT
@tiny_wait_loop:                                                     ; TINY WAIT LOOP
	DEY                                                              ; NUMBER OF CYCLES TO WAIT--
	BNE @tiny_wait_loop                                              ;

@transfer_irq_addr_to_ppu:                                           ; UPDATE PPU CTRL, PPU ADDR, PPU SCROLL
	LDA CURR_IRQ_PPU_ADDR+1,X                                        ; SET PPU ADDRESS  = SPLIT SCREEN PPU ADDR
	STA NES_PPU_ADDR                                                 ;
	LDA CURR_IRQ_PPU_ADDR,X                                          ;
	STA NES_PPU_ADDR                                                 ;

@reset_scroll: 
	LDA #$00                                                         ; SET CAMERA POSITION OF SPLIT SCREEN = 0,0 (X,Y)
	STA NES_PPU_SCROLL                                               ;
	STA NES_PPU_SCROLL                                               ;
	LDA SOFT_PPU_CTRL                                                ; SET PPU CTRL = SOFT PPU CTRL
	STA NES_PPU_CTRL                                                 ; SAVE IN PPUCTRL

UPDATE_BG_CHR_BANKS:                                                 ; UPDATE BG CHR BANKS
	LDY #$00                                                         ; SET BANK SELECT = LOWER BG CHR BANK $0000
	STY BANK_SELECT_MMC3                                             ;
	LDA CURR_IRQ_BG_0000,X                                           ; SET $0000 CHR BANK = SPLIT SCREEN $0000 CHR BANK
	STA BANK_DATA_MMC3                                               ;
	INY                                                              ; SET BANK SELECT =  BG CHR BANK $0800
	STY BANK_SELECT_MMC3                                             ;
	LDA CURR_IRQ_BG_0800,X                                           ; SET $0800 CHR BANK = SPLIT SCREEN $0800 CHR BANK
	STA BANK_DATA_MMC3                                               ;
	CPX #$0F                                                         ; DOES CURRENT SPLIT SCREEN INDEX = LAST CURRENT SPLIT SCREEN INDEX
	BCS DISABLE_IRQ_REMAINDER_FRAME                                  ; YES-> SPLIT SCREENS EXIT()
	LDA CURR_IRQ_COUNTER,X                                           ; LOAD IRQ SPLIT COUNTER
	BEQ DISABLE_IRQ_REMAINDER_FRAME                                  ; EQUAL ZERO? Y-> SPLIT SCREENS EXIT()
	STA IRQ_COUNTER_MMC3                                             ; SAVE IRQ COUNTER VALUE TO BE RELOADED ON NEXT SCANLINE
	STA IRQ_RELOAD_MMC3                                              ; CLEAR IRQ COUNTER AND SET IRQ RELOAD FLAG = TRUE
	STA IRQ_ENABLE_MMC3                                              ; ENABLE INTERRUPT
	
	LDA CUR_IRQ_INDEX                                                ; = CURRENT IRQ SPLIT INDEX
	CLC                                                              ;
	ADC #$05                                                         ; +  OFFSET TO NEXT IRQ SPLIT
	STA CUR_IRQ_INDEX                                                ;
	RTS                                                              ; RETURN

DISABLE_IRQ_REMAINDER_FRAME:                                         ; SPLIT SCREENS EXIT()
	STA IRQ_DISABLE_MMC3                                             ; ACKNOWLEDGE INTERRUPT
	LDA #$FF                                                         ; SET CURRENT IRQ SPLIT INDEX = DONE
	STA CUR_IRQ_INDEX                                                ;
	RTS                                                              ; RETURN
_F}_IRQ

_F{_DISABLE_INTERRUPTS_UPDATE_PPUCTRL
	
DISABLE_INTERRUPTS_RENDERING:                                        ; DISABLE NMI, DISABLE MMC3 INTERRUPTS, TURN OFF RENDERING
	STA IRQ_DISABLE_MMC3                                             ; DISABLE MMC3 INTERRUPTS
	LDA SOFT_PPU_CTRL                                                ; SET SOFT_PPUCTRL = DISABLE NMI
	AND #%01111111                                                   ;
	STA NES_PPU_CTRL                                                 ; SAVE IN PPUCTRL
	LDA SOFT_PPU_MASK                                                ; SET SOFT_PPUMASK = DON�T SHOW SPRITES AND DON�T SHOW BACKGROUND
	AND #%11100111                                                   ;
	STA NES_PPU_MASK                                                 ; SAVE IN PPUMASK
	RTS                                                              ; RETURN

UPDATE_PPUCTRL:                                                      ; UPDATE PPUCTRL()
	LDA SOFT_PPU_CTRL                                                ; SET PPUCTRL = SOFT_PPUCTRL
	STA NES_PPU_CTRL                                                 ; SAVE IN PPUCTRL
	RTS                                                              ; RETURN

_F}_DISABLE_INTERRUPTS_UPDATE_PPUCTRL
	
_F{_DRAW_SCRIPT_BALL_MOVEMENT_FUNCTIONS                              ; START CUTSCENES, MENUS, BALL ANIMATION, BLINK STARTER

END_OLD_SCENE_DRAW_NEW_SCENE:                                        ; START DRAWING TASK (A= DRAW EVENT, X = BANK)
	STA DRAW_SCRIPT_ID                                               ; SAVE DRAW EVENT INDEX IN C2
	STX DRAW_SCRIPT_BANK                                             ; SAVE DRAW COMMANDS BANK IN C3
	LDA #DRAW_SCRIPT_PROCESSING_BANK                                 ; SET TASK 2 BANK = BANK 24
	STA (DRAW_SCRIPT_TASK + TASK_BANK )
	LDY #<(BANK_JUMP_DO_DRAW_EVENT_THEN_END_DRAW_TASKS-1)			; *** can use actual addr  
	LDA #>(BANK_JUMP_DO_DRAW_EVENT_THEN_END_DRAW_TASKS-1)
	LDX #DRAW_SCRIPT_TASK                                            ; SET TASK INDEX =TASK 2 = DRAW TASK
	JSR CREATE_TASK                                                  ; CREATE TASK (X= TASK INDEX, Y,A= TASK ADDRESS)
	RTS                                                              ; RETURN

DRAW_SCENE_UNTIL_ENDED:                                              ; START DRAWING TASK AND DO UNTIL THREAD DESTROYED (A= SCREEN ID, X = BANK)
	JSR END_OLD_SCENE_DRAW_NEW_SCENE                                 ; START DRAWING TASK (A= DRAW EVENT INDEX, X = BANK)

@check_draw_script_task_killed:                                      ; CHECK FOR DRAW TASK DESTROYED
	RETURN_1_FRAME
	LDA (DRAW_SCRIPT_TASK+TASK_STATUS)                               ; DOES DRAW TASK (TASK 2) STATUS = EMPTY
	BNE @check_draw_script_task_killed:                              ; NO-> LOOP BACK TO CHECK FOR DRAW TASK DESTROYED
	RTS                                                              ; RETURN

DRAW_SCENE_RETURN_PREV_8000_BANK:                                    ; DO DRAWING TASK SWAP $A000 BANKS AND SET TO 8X8 TEXT (A= SCREEN ID, X = BANK)
	STA DRAW_SCRIPT_ID                                               ; SAVE SCREEN ID
	STX DRAW_SCRIPT_BANK                                             ; SET BANK = SCREEN SCRIPT BANK
	LDA SOFT_8000_BANK                                               ; SAVE CURRENT $8000 BANK
	PHA                                                              ;
	LDX #DRAW_SCRIPT_PROCESSING_BANK                                 ; LOAD BANK 24
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDA DRAW_SCRIPT_ID                                               ; LOAD SCREEN ID
	LDX DRAW_SCRIPT_BANK                                             ;
	JSR BANK_JUMP_DO_DRAW_EVENT	                                     ; DO DRAW EVENT()  *** can use actual addr 
	PLA                                                              ; RESTORE PREVIOUS $8000 BANK
	TAX                                                              ;
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)

DRAW_4X4_METATILE_BG:                                                ; DRAW 4X4 METATILE BG
	STA DRAW_SCRIPT_ID                                               ; SET DRAW EVENT INDEX
	LDA SOFT_8000_BANK                                               ; SAVE CURRENT $8000 BANK TO STACK
	PHA                                                              ;
	LDX #DRAW_SCRIPT_PROCESSING_BANK                                 ; LOAD BANK 24
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDA DRAW_SCRIPT_ID                                               ;
	LDX #$00                                                         ; SET NAME TABLE =$2000?
	JSR BANK_JUMP_DRAW_BG_METATILE                                   ; DRAW 4X4 METATILES BG() *** can use actual addr 
	PLA                                                              ;
	TAX                                                              ;
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)

L_C3DD:                                                              ; *** UNUSED
	STA $C5                                                          ;
	LDA #$01                                                         ;
	STA $C4                                                          ;
	
DRAW_SPRITE_SCRIPT_NAMETABLE_0:                                      ; DRAW LOGO AND FACEMASK
	LDA #>$C300                                                      ; *** awkward way to do it 
	STA $C2                                                          ;
	LDA #<$C300                                                      ;
	STA $C3                                                          ;
	LDA SOFT_8000_BANK                                               ; SAVE CURRENT $8000 BANK TO STACK
	PHA                                                              ;
	LDX #DRAW_SCRIPT_PROCESSING_BANK                                 ; LOAD BANK 24
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	JSR BANK_JUMP_INIT_SPRITE_SCRIPTS                                ; DO DRAW LOGO AND FACEMASK() *** can use actual addr 
	PLA                                                              ;
	TAX                                                              ; RESTORE PREVIOUS $8000 BANK
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)

BANK_SWAP_DO_BLINKING_PALLETE:                                       ; BLINK OFFENSIVE STARTER SELECTED IN IMAGE
	TAY                                                              ;
	LDA SOFT_8000_BANK                                               ; SAVE CURRENT $8000 BANK TO STACK
	PHA                                                              ;
	LDX #DRAW_SCRIPT_PROCESSING_BANK                                 ; LOAD BANK 24
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	TYA                                                              ;
	JSR BANK_JUMP_START_CHANGING_PALLETE_TASK                        ; DO BLINK STARTER SELECTED() *** can use actual addr 
	PLA                                                              ;
	TAX                                                              ; RESTORE PREVIOUS $8000 BANK
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)


SET_BALL_STATUS_MOVING_START_BALL_TASK:                              ; SET BALL INFO TO BALL MOVING, START BALL TASK
	ORA #BALL_MOVING                                                 ; SET BALL INFO TO BALL MOVING
	STA BALL_COLLISION                                               ;
	LDA #BALL_ANIMATION_BANK                                         ; SET TASK 4 BANK TO BANK 23
	STA (BALL_MOVEMENT_TASK + TASK_BANK)                             ;
	LDY #<(BANK_JUMP_START_BALL_ANIMATION-1)                         ; SET TASK ADDRESS = DO BALL MOVEMENT *** can use actual addr 
	LDA #>(BANK_JUMP_START_BALL_ANIMATION)                           ;
	LDX #BALL_ANIMATION_BANK                                         ; LOAD TASK PRG BANK #
	JSR CREATE_TASK                                                  ; CREATE TASK (X= INDEX, Y,A= TASK ADDRESS)
	RTS                                                              ; RETURN
	
_F}_DRAW_SCRIPT_BALL_MOVEMENT_FUNCTIONS

_F{_PLAY_SOUND                                                       ; SETS NEXT SOUND EFFECT/SONG TO PLAY

PLAY_SOUND:                                                          ; LOAD SOUND ID ONCE CURRENT SOUND IS DONE(A= SOUND ID)
	TAX
	
_WHILE ALWAYS                                            			; WAIT FOR SOUND ID TO PLAY = NONE LOOP

	LDA SOUND_ID_TO_PLAY                                             ; DOES SOUND ID PLAYING = NONE
	BEQ @save_sound_id                                               ; YES-> LOAD SOUND ID
	RETURN_1_FRAME

_END_WHILE                                     						; JUMP-> WAIT FOR SOUND ID TO PLAY = NONE LOOP

@save_sound_id:                                                      ; 
	STX SOUND_ID_TO_PLAY                                             ; SAVE NEW SOUND ID IN SOUND ID TO PLAY
	RTS                                                              ; RETURN
	
_F}_PLAY_SOUND

_F{_SWAP_DRAW_METATILE_BACKGROUND_COL

SWAP_8000_DRAW_METATILE_RETURN:                                      ; SAVE $8000 BANK AND DO DRAW COLUMN() BANK 23 THEN RETURN

current_8000_bank		= LOCAL_2

@save_bank:
	LDA SOFT_8000_BANK                                               ; SAVE CURRENT $8000 BANK IN $3F
	STA current_8000_bank                                            ;

@do_routine:	
	LDX #DRAW_METATILE_BANK                                          ; LOAD BANK 23
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	JSR BANK_JUMP_DRAW_METATILE_COLLUMN                    			; DRAW METATILE()

@restore_bank:	
	LDX current_8000_bank                                            ; RESTORE CURRENT $8000 BANK
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)

_F}_SWAP_DRAW_METATILE_BACKGROUND_COL

_F{_SWAP_DRAW_PLAYER_FACE

SWAP_8000_DRAW_PLAYER_FACE_RETURN:                                   ; DRAW PLAYER FACE()
	TAY                                                              ; SAVE FACE ID
	LDA SOFT_8000_BANK                                               ; SAVE CURRENT $8000 BANK TO STACK
	PHA                                                              ;
	LDX #DRAW_SCRIPT_PROCESSING_BANK                                 ; LOAD BANK 24
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	TYA                                                              ; RESTORE FACE ID
	JSR BANK_JUMP_DRAW_PLAYER_FACE                                   ; DRAW PLAYER FACE(A= FACE ID)
	PLA                                                              ; RESTORE PREVIOUS $8000 BANK AND TRANSFER TO X
	TAX                                                              ;
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)

_F}_SWAP_DRAW_PLAYER_FACE

_F{_SWAP_8000_BANK_JUMP

jump_addr = LOCAL_7
	
SWAP_8000_BANK_AND_JUMP_RETURN:                                      ; SWAP $8000 BANK AND JUMP(X,Y= ADDRESS, A= BANK TO SWAP TO)
	STY jump_addr                                                    ; SAVE ADDRESS TO JUMP TO
	STX jump_addr+1                                                  ;
	TAX                                                              ; SET BANK TO SWAP
	LDA SOFT_8000_BANK                                               ; SAVE CURRENT $8000 BANK TO STACK
	PHA                                                              ;
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDA #>(@swap_8000_jump_return)                                   ; SAVE BANK SWAP AND JUMP RETURN TO OLD BANK -1 ON STACK
	PHA                                                              ;
	LDA #<(@swap_8000_jump_return-1)                                 ;
	PHA                                                              ;
	JMP (jump_addr)                                                  ; JUMP TO SAVED ADDRESS
@swap_8000_jump_return:                                              ; BANK SWAP AND JUMP RETURN TO OLD BANK
	PLA                                                              ; RESTORE CURRENT $8000 BANK
	TAX                                                              ;
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	
_F}_SWAP_8000_BANK_JUMP

_F{_UPDATE_ALL_RANDOMS

UPDATE_ALL_RANDOMS:                                                  ; UPDATE RANDOMS 3B,3C,3D()
	LDA RANDOM_1                                                     ; = RAND3B + 0x83
	CLC                                                              ;
	ADC #$83                                                         ;
	STA RANDOM_1                                                     ;
	LDA RANDOM_2                                                     ; = RAND3C + 0x0D +C
	ADC #$0D                                                         ;
	STA RANDOM_2                                                     ;
	LDA RANDOM_3                                                     ; = RAND3D + 0x11 +C
	ADC #$11                                                         ;
	STA RANDOM_3                                                     ;
	RTS                                                              ; UPDATE RANDOMS RETURN
	
_F}_UPDATE_ALL_RANDOMS

_F{_LOAD_SPLIT_SCREEN

irq_data_addr = LOCAL_7

LOAD_IRQ_SPLIT_DATA:                                                 ; LOAD IRQ SPLIT INFO (5 DATA POINTS)
	STY irq_data_addr                                                ; SAVE IRQ DATA RAM ADDRESS in $44,45
	STX irq_data_addr+1                                              ;
	STA IRQ_DISABLE_MMC3                                             ; DISABLE MMC3 INTERRUPTS
	LDY #$00                                                         ;

@set_irq_data_length:                                                ; LOAD IRQ SPLIT LOOP

_WHILE NOT_EQUAL
	LDX #$04                                                         ; SET SCREEN SPLIT DATA LENGTH = 5

@irq_load_loop:
	LDA (irq_data_addr),Y                                            ; STORE SCREEN SPLIT XSCROLL AND SPLIT SCREEN BG CHAR
	STA CURR_IRQ_START,Y                                             ;
	INY                                                              ;
	DEX                                                              ;
	BNE @irq_load_loop                                               ;

@check_done	
	CPY #$13                                                         ; HAVE WE LOADED ALL IRQS
	BCS @load_irq_exit                                                ; YES-> DONE LOADING IRQ SPLIT INFO
	LDA (irq_data_addr),Y                                            ; SAVE COUNTER IN IRQ SPLIT COUNTER
	STA CURR_IRQ_START,Y                                             ;
	INY                                                              ; SCREEN SPLIT DATA SET++
	TAX                                                              ; COUNTER = ZERO?
	
_END_WHILE                                        					; NO-> LOAD IRQ SPLIT LOOP

@load_irq_exit:                                                       ; DONE LOADING IRQ SPLIT INFO
	RTS                                                              ; RETURN

_F}_LOAD_SPLIT_SCREEN 

_F{_GET_SEASON_TEAM_TYPES

GET_P1_SEASON_TEAM_TYPE:                                             ; LOAD P1 SEASON TEAM TYPE (SKP, MAN COA, COM) NOT USED?
	LDX P1_TEAM                                                      ; LOAD P1 TEAM
	LDA TEAM_TYPE_SEASON,X                                           ; LOAD TEAM TYPE
	AND #$03                                                         ; MASK OUT UNEEDED INFO
	RTS                                                              ; RETURN

GET_P2_SEASON_TEAM_TYPE:                                             ; LOAD P2 SEASON TEAM TYPE (SKP, MAN COA, COM) NOT USED?
	LDX P2_TEAM                                                      ; LOAD P2 TEAM
	LDA TEAM_TYPE_SEASON,X                                           ; LOAD TEAM TYPE
	AND #$03                                                         ; MASK OUT UNEEDED INFO
	RTS                                                              ; RETURN
	
_F}_GET_SEASON_TEAM_TYPES
	
_F{_CHECKSUM_FUNCTIONS												; *** fix magic number references 

sram_addr   		= LOCAL_1
sram_size  			= LOCAL_3
temp_check_sum  	= LOCAL_7

CHECK_SUM_CONSTANT	= $3412


SIZE_OF_SEASON_INFO_PART_ONE = EMPTY_SEASON_INFO - TEAM_SEASON_INFO_START

GET_SAVE_CHECKSUM:                                                   ; CALCULATE AND STORE SRAM CHECKSUM
	JSR CALCULATE_CHECKSUM                                           ; CALCULATE SRAM CHECKSUM(), RET= CHECKSUM= Y,X
	STY SRAM_CHECKSUM                                                ; SAVE CHECKSUM
	STX SRAM_CHECKSUM+1                                              ;
	RTS                                                              ; RETURN

CALCULATE_CHECKSUM:                                                  ; CALCULATE SRAM CHECKSUM(), RET= CHECKSUM= Y,X
	LDA #$00                                                         ; CLEAR CHECK SUM VARIABLES
	STA temp_check_sum                                               ;
	STA temp_check_sum +1                                            ;
	LDA #<SEASON_INFO_START                                          ; SET SRAM START ADDRESS == $66C0
	STA sram_addr                                                    ;
	LDA #>SEASON_INFO_START                                           ;
	STA sram_addr+1                                                  ; SET SIZE == 0X083E
	LDA #<$083E                                                      ;
	STA sram_size                                                    ;
	LDA #>$083E                                                      ;
	STA sram_size+1                                                  ; SUM FROM $66C0 TO $6EFE
	JSR @check_sum_add_routine                                       ; ADD ALL LOCATIONS (3E,3F= START ADDRESS, 40,41= LENGTH)
	LDA #<TEAM_10_SEASON_INFO                                        ; SET SRAM START ADDRESS == $7002-$7F71
	STA sram_addr                                                    ;
	LDA #>TEAM_10_SEASON_INFO                                        ;
	STA sram_addr+1                                                  ;
	LDA #<$0F70                                                      ; SET SIZE == 0X0F70
	STA sram_size                                                    ;
	LDA #>$0F70                                                      ;
	STA sram_size+1                                                  ; SUM FROM $7002 TO $7F71
	JSR @check_sum_add_routine                                       ; ADD ALL LOCATIONS (3E,3F= START ADDRESS, 40,41= LENGTH)
	LDA temp_check_sum                                               ; TOTAL + 0x3412
	CLC                                                              ;
	ADC #<CHECK_SUM_CONSTANT                                         ;
	TAY                                                              ;
	LDA temp_check_sum +1                                            ;
	ADC #>CHECK_SUM_CONSTANT                                         ;
	TAX                                                              ;
	RTS                                                              ; RETURN

@check_sum_add_routine:                                              ; ADD ALL VALUES (3E,3F= START ADDRESS, 40,41= LENGTH)
	LDY #$00                                                         ; SET INDEX = FIRST LOCATION
@add_location:                                                       ; ADD VALUES LOOP
	LDA (sram_addr),Y                                                ; SUM = SUM + NEXT VALUE
	CLC                                                              ;
	ADC temp_check_sum                                               ;
	STA temp_check_sum                                               ;
	LDA #$00                                                         ;
	ADC temp_check_sum +1                                            ;
	STA temp_check_sum +1                                            ;
	INC sram_addr                                                    ; CURRENT ADDRESS ++
	BNE @next                                                        ;
	INC sram_addr+1                                                  ;
@next:
	SUBTRACT_16BIT_MEM_BY_ONE sram_size                              ;				                                         ;
	ORA sram_size                                                    ;
	BNE @add_location                                                ; ALL VALUES ADDED?  NO-> DD VALUES LOOP
	RTS                                                              ; RETURN

_F}_CHECKSUM_FUNCTIONS 

_F{_DRAW_BANNER_SCORE

DRAW_BANNER_SCORE:                                                   ; DRAW BANNER SCORE
	LDY #<P1_BANNER_SCORE_PPU_ADDR                                   ; SET P1 SCORE PPU ADDRESS = $206D
	LDX #>P1_BANNER_SCORE_PPU_ADDR                                   ;
	LDA P1_TOTAL_SCORE                                               ; LOAD P1 TOTAL SCORE
	JSR CONVERT_2_DIG_NUM_TILES                                      ; CONVERT SINGLE BYTE NUMBER TO TILES AND SAVE IN BUFFER(A= NUMBER)
	LDY #<P2_BANNER_SCORE_PPU_ADDR                                   ;
	LDX #>P2_BANNER_SCORE_PPU_ADDR                                   ; SET P2 SCORE PPU ADDRESS = $2070
	LDA P2_TOTAL_SCORE                                               ; LOAD P2 TOTAL SCORE
	JSR CONVERT_2_DIG_NUM_TILES                                      ; CONVERT SINGLE BYTE NUMBER TO TILES AND SAVE IN BUFFER(A= NUMBER)
	LDA (CURRENT_BG_BUFFER_LOC-$02),X                                ; SHIFT DIGIT OVER IF THERE ARE TWO DIGITS
	BNE @banner_score_exit                                           ;
	SEC                                                              ;
	ROR PPU_BUFFER_FLAG                                              ; SET NMI PPU BUFFER STATUS = BUSY
	LDA (CURRENT_BG_BUFFER_LOC-$01),X                                ;
	STA (CURRENT_BG_BUFFER_LOC-$02),X                                ;
	LDA #$00                                                         ;
	STA (CURRENT_BG_BUFFER_LOC-$01),X                                ;
	LSR PPU_BUFFER_FLAG                                              ; SET NMI PPU BUFFER STATUS = READY
@banner_score_exit:                                                  ;
	RTS                                                              ; RETURN
	
_F}_DRAW_BANNER_SCORE
	
_F{_STATS_CPU_SKP_INJURY_SCOREBOARD_ROUTINES
SWAP_AND_DO_SKP_MODE:                                                ; DO SKP MODE STATS()
	JSR SAVE_A_X_PREV_BANKS_SWAP_TO_12_13                            ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13()
	JSR SIMULATION_SKIP_MODE_SEASON_START                            ; CALCULATE SKIP MODE STATS() 
	JMP RETURN_PREVIOUS_8000_A000_BANKS                              ; SWAP TO PREVIOUS( 8000,A000 BANKS)

SWAP_AND_DO_CPU_PLAY_CALL:                                           ; CPU PLAY CALL 
	JSR SAVE_A_X_PREV_BANKS_SWAP_TO_12_13                            ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13()
	JSR BANK_JUMP_COM_PLAY_CALL_LOGIC_START                                          ; DO COMPLAY CALL LOGIC() *** can replace with actual addr
	JMP RETURN_PREVIOUS_8000_A000_BANKS                              ; SWAP TO PREVIOUS( 8000,A000 BANKS)

	CPU_ONSIDE = LOCAL_8
	
SWAP_AND_CHECK_CPU_ONSIDE:                                           ; CHECK FOR CPU ONSIDE
	JSR SAVE_A_X_PREV_BANKS_SWAP_TO_12_13                            ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13()
	JSR BANK_JUMP_CHECK_FOR_COM_ONSIDES_KICK                         ; CHECK FRO CPU ONSIDE() *** can replace with actual addr
	ROR                                                              ;
	STA CPU_ONSIDE                                                   ; SAVE CPU PLAY CALL
	JMP RETURN_PREVIOUS_8000_A000_BANKS                              ; SWAP TO PREVIOUS( 8000,A000 BANKS)

SWAP_AND_GET_PLAYER_SEASON_STATS:                                    ; GET SEASON PLAYER STATS()
	JSR SAVE_A_X_PREV_BANKS_SWAP_TO_12_13                            ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13()
	JSR BANK_JUMP_GET_PLAYER_SEASON_STAT                             ; GET SEASON PLAYER STATS() *** can replace with actual addr
	JMP RETURN_PREVIOUS_8000_A000_BANKS                              ; SWAP TO PREVIOUS( 8000,A000 BANKS)

SWAP_AND_GET_CURRENT_GAME_STATS:                                     ; GET CURRENT GAME PLAYER STATS()
	JSR SAVE_A_X_PREV_BANKS_SWAP_TO_12_13                            ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13()
	JSR BANK_JUMP_GET_CURRENT_GAME_STATS                             ; GET CURRENT GAME() *** can replace with actual addr
	JMP RETURN_PREVIOUS_8000_A000_BANKS                              ; SWAP TO PREVIOUS( 8000,A000 BANKS)

SWAP_AND_ADD_STATS_TO_SEASON_STATS:                                  ; ADD GAME STATS TO SEASON STATS()
	JSR SAVE_A_X_PREV_BANKS_SWAP_TO_12_13                            ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13()
	JSR BANK_JUMP_ADD_STAT_TO_SEASON_STAT                         	 ; TRANSFER IN GAME STATS TO SEASON STATS() *** can replace with actual addr 
	JMP RETURN_PREVIOUS_8000_A000_BANKS                              ; SWAP TO PREVIOUS( 8000,A000 BANKS)

SWAP_AND_ADD_STATS_TO_CURRENT_GAME_IF_VALID:                         ; UPDATE IN GAME STATS
	JSR SAVE_A_X_PREV_BANKS_SWAP_TO_12_13                            ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13()
	JSR BANK_JUMP_UPDATE_IN_GAME_STATS_WITH_ERROR_CHECK              ; UPDATE PLAYER STATS IF VALID(A= PLAYER ID, 6F= P1/P2, X= STAT TO UPDATE) *** can replace with actual addr
	JMP RETURN_PREVIOUS_8000_A000_BANKS                              ; SWAP TO PREVIOUS( 8000,A000 BANKS)

SWAP_AND_ADD_ALL_CURRENT_STATS_TO_SEASON_STATS:                      ; SAVE STATS IN SRAM AND RETURN TO PREVIOUS BANKS
	JSR SAVE_A_X_PREV_BANKS_SWAP_TO_12_13                            ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13() 
	JSR BANK_JUMP_ADD_ALL_GAME_STATS_TO_SEASON_STATS                 ; SAVE STATS IN SRAM() *** can replace with actual addr
	JMP RETURN_PREVIOUS_8000_A000_BANKS                              ; SWAP TO PREVIOUS( 8000,A000 BANKS)

	temp_x_reg = LOCAL_1
	temp_a_reg = LOCAL_2
	
SAVE_A_X_PREV_BANKS_SWAP_TO_12_13:                                   ; SAVE CURRENT BANKS, SAVE A,X, SWAP TO BANK 12,13()
	STA temp_a_reg                                                   ; SAVE A,X IN 3E,3F
	STX temp_x_reg                                                   ;
	LDA SOFT_8000_BANK                                               ; SAVE CURRENT 8000 BANK IN $393
	STA PREV_8000_BANK_TEMP                                          ;
	LDA SOFT_A000_BANK                                               ; SAVE CURRENT A000 BANK IN $394
	STA PREV_A000_BANK_TEMP                                          ;
	LDX #SIM_LOGIC_STATS_1_BANK                                      ; LOAD BANK 12
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDX #SIM_LOGIC_STATS_2_BANK                                      ; LOAD BANK 13
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA temp_a_reg                                                   ;
	LDX temp_x_reg                                                   ;
	RTS                                                              ; RETURN

RETURN_PREVIOUS_8000_A000_BANKS:                                     ; SWAP TO PREVIOUS( 8000,A000 BANKS)
	LDX PREV_8000_BANK_TEMP                                          ; LOAD PREVIOUS 8000 BANK
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDX PREV_A000_BANK_TEMP                                          ; LOAD PREVIOUS A000 BANK
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	RTS                                                              ; RETURN

SWAP_TO_BANKS_12_13:                                                 ; SWAP TO BANKS 12/13 (8000/A000)
	LDX #SIM_LOGIC_STATS_1_BANK                                      ; LOAD BANK 12
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDX #SIM_LOGIC_STATS_2_BANK                                     ; LOAD BANK 13
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	RTS                                                              ; RETURN

SWAP_AND_DO_SKP_MODE_INJURY:                                         ; SWAP TO BANKS 19/20 (8000/A000), DO SKP MODE INJURY, RETURN TO BANKS 12/13
	LDX #HIGH_LEVEL_GAME_LOGIC_BANK_1                                ; LOAD BANK 19
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDX #HIGH_LEVEL_GAME_LOGIC_BANK_2                                ; LOAD BANK 20
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	JSR $8003                                                        ; DO SKP MODE INJURY()
	JMP SWAP_TO_BANKS_12_13                                          ; JUMP->  SWAP TO BANKS 12/13 (8000/A000)

SWAP_AND_CLEAR_SCOREBOARD:                                           ; SWAP TO BANKS 17/18 (8000/A000), DO UPDATE SCOREBOARD CLEAR SCORES, RETURN TO BANKS 12/13
	LDX #MAIN_GAME_BANK_1                                            ; BANK 17
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDX #MAIN_GAME_BANK_2                                            ; BANK 18
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	JSR $800C                                                        ; UPDATE SCOREBOARD VRAM, CLEAR VRAM SECTION AND CLEAR SCORES
	JMP SWAP_TO_BANKS_12_13                                          ; JUMP->  SWAP TO BANKS 12/13 (8000/A000)
_F}_STATS_CPU_SKP_INJURY_SCOREBOARD_ROUTINES

INFINITE_LOOP:                                                       ; *** could remove
	JMP INFINITE_LOOP
	
_F{_DIRECTIONS_TABLE

PLAYER_DIRECTIONS_TABLE:                                             ; DIRECTIONS INDEX
	.DB $00, $C0, $40, $80                                           ; LEFT, DOWN , UP, RIGHT
	
_F}_DIRECTIONS_TABLE

_F{_ARCTAN_TABLE                                                     ; ARCTAN ANGLE LOOKUP

ARCTAN_TABLE:                                                              ; ARCTAN ANGLE LOOKUP
	.DB $00                                                          ; 0 DEGREES
	.DB $01
	.DB $01
	.DB $02
	.DB $03
	.DB $03
	.DB $04
	.DB $04
	.DB $05
	.DB $06
	.DB $06
	.DB $07
	.DB $08
	.DB $08
	.DB $09
	.DB $0A
	.DB $0A
	.DB $0B
	.DB $0B
	.DB $0C
	.DB $0D
	.DB $0D
	.DB $0E
	.DB $0F
	.DB $0F
	.DB $10
	.DB $10
	.DB $11
	.DB $12
	.DB $12
	.DB $13
	.DB $14
	.DB $14
	.DB $15
	.DB $16
	.DB $16
	.DB $17
	.DB $17
	.DB $18
	.DB $19
	.DB $19
	.DB $1A
	.DB $1B
	.DB $1B
	.DB $1C
	.DB $1C
	.DB $1D
	.DB $1E
	.DB $1E
	.DB $1F
	.DB $1F
	.DB $20
	.DB $21
	.DB $21
	.DB $22
	.DB $22
	.DB $23
	.DB $24
	.DB $24
	.DB $25
	.DB $26
	.DB $26
	.DB $27
	.DB $27
	.DB $28
	.DB $29
	.DB $29
	.DB $2A
	.DB $2A
	.DB $2B
	.DB $2C
	.DB $2C
	.DB $2D
	.DB $2D
	.DB $2E
	.DB $2E
	.DB $2F
	.DB $30
	.DB $30
	.DB $31
	.DB $31
	.DB $32
	.DB $33
	.DB $33
	.DB $34
	.DB $34
	.DB $35
	.DB $35
	.DB $36
	.DB $37
	.DB $37
	.DB $38
	.DB $38
	.DB $39
	.DB $39
	.DB $3A
	.DB $3A
	.DB $3B
	.DB $3C
	.DB $3C
	.DB $3D
	.DB $3D
	.DB $3E
	.DB $3E
	.DB $3F
	.DB $3F
	.DB $40
	.DB $41
	.DB $41
	.DB $42
	.DB $42
	.DB $43
	.DB $43
	.DB $44
	.DB $44
	.DB $45
	.DB $45
	.DB $46
	.DB $46
	.DB $47
	.DB $47
	.DB $48
	.DB $48
	.DB $49
	.DB $4A
	.DB $4A
	.DB $4B
	.DB $4B
	.DB $4C
	.DB $4C
	.DB $4D
	.DB $4D
	.DB $4E
	.DB $4E
	.DB $4F
	.DB $4F
	.DB $50
	.DB $50
	.DB $51
	.DB $51
	.DB $52
	.DB $52
	.DB $53
	.DB $53
	.DB $54
	.DB $54
	.DB $54
	.DB $55
	.DB $55
	.DB $56
	.DB $56
	.DB $57
	.DB $57
	.DB $58
	.DB $58
	.DB $59
	.DB $59
	.DB $5A
	.DB $5A
	.DB $5B
	.DB $5B
	.DB $5B
	.DB $5C
	.DB $5C
	.DB $5D
	.DB $5D
	.DB $5E
	.DB $5E
	.DB $5F
	.DB $5F
	.DB $60
	.DB $60
	.DB $60
	.DB $61
	.DB $61
	.DB $62
	.DB $62
	.DB $63
	.DB $63
	.DB $63
	.DB $64
	.DB $64
	.DB $65
	.DB $65
	.DB $66
	.DB $66
	.DB $66
	.DB $67
	.DB $67
	.DB $68
	.DB $68
	.DB $68
	.DB $69
	.DB $69
	.DB $6A
	.DB $6A
	.DB $6A
	.DB $6B
	.DB $6B
	.DB $6C
	.DB $6C
	.DB $6C
	.DB $6D
	.DB $6D
	.DB $6E
	.DB $6E
	.DB $6E
	.DB $6F
	.DB $6F
	.DB $70
	.DB $70
	.DB $70
	.DB $71
	.DB $71
	.DB $71
	.DB $72
	.DB $72
	.DB $73
	.DB $73
	.DB $73
	.DB $74
	.DB $74
	.DB $74
	.DB $75
	.DB $75
	.DB $76
	.DB $76
	.DB $76
	.DB $77
	.DB $77
	.DB $77
	.DB $78
	.DB $78
	.DB $78
	.DB $79
	.DB $79
	.DB $79
	.DB $7A
	.DB $7A
	.DB $7A
	.DB $7B
	.DB $7B
	.DB $7B
	.DB $7C
	.DB $7C
	.DB $7C
	.DB $7D
	.DB $7D
	.DB $7D
	.DB $7E
	.DB $7E
	.DB $7E
	.DB $7F
	.DB $7F
	.DB $7F
	.DB $80
	.DB $80                                                          ; 90 DEGREES
_F}_ARCTAN_TABLE

_F{_ANGULAR_VEL_TABLE                                                ; ANGULAR VELOCITY TABLE FOR X AND Y VELOCITIES

ANG_VEL_TABLE:


.DB $00, $00
.DB $0D, $00
.DB $19, $00
.DB $26, $00
.DB $32, $00
.DB $3F, $00
.DB $4B, $00
.DB $58, $00
.DB $64, $00
.DB $71, $00
.DB $7E, $00
.DB $8A, $00
.DB $97, $00
.DB $A3, $00
.DB $B0, $00
.DB $BC, $00
.DB $C9, $00
.DB $D5, $00
.DB $E2, $00
.DB $EE, $00
.DB $FB, $00

.DB $07, $01
.DB $14, $01
.DB $20, $01
.DB $2D, $01
.DB $39, $01
.DB $45, $01
.DB $52, $01
.DB $5E, $01
.DB $6B, $01
.DB $77, $01
.DB $83, $01
.DB $90, $01
.DB $9C, $01
.DB $A8, $01
.DB $B4, $01
.DB $C1, $01
.DB $CD, $01
.DB $D9, $01
.DB $E5, $01
.DB $F2, $01
.DB $FE, $01

.DB $0A, $02
.DB $16, $02
.DB $22, $02
.DB $2E, $02
.DB $3A, $02
.DB $46, $02
.DB $53, $02
.DB $5F, $02
.DB $6B, $02
.DB $76, $02
.DB $82, $02
.DB $8E, $02
.DB $9A, $02
.DB $A6, $02
.DB $B2, $02
.DB $BE, $02
.DB $CA, $02
.DB $D5, $02
.DB $E1, $02
.DB $ED, $02
.DB $F8, $02

.DB $04, $03
.DB $10, $03
.DB $1B, $03
.DB $27, $03
.DB $32, $03
.DB $3E, $03
.DB $49, $03
.DB $55, $03
.DB $60, $03
.DB $6C, $03
.DB $77, $03
.DB $82, $03
.DB $8E, $03
.DB $99, $03
.DB $A4, $03
.DB $AF, $03
.DB $BA, $03
.DB $C5, $03
.DB $D0, $03
.DB $DC, $03
.DB $E7, $03
.DB $F1, $03
.DB $FC, $03

.DB $07, $04
.DB $12, $04
.DB $1D, $04
.DB $28, $04
.DB $32, $04
.DB $3D, $04
.DB $48, $04
.DB $52, $04
.DB $5D, $04
.DB $67, $04
.DB $72, $04
.DB $7C, $04
.DB $87, $04
.DB $91, $04
.DB $9B, $04
.DB $A6, $04
.DB $B0, $04
.DB $BA, $04
.DB $C4, $04
.DB $CE, $04
.DB $D8, $04
.DB $E2, $04
.DB $EC, $04
.DB $F6, $04

.DB $00, $05
.DB $09, $05
.DB $13, $05
.DB $1D, $05
.DB $27, $05
.DB $30, $05
.DB $3A, $05
.DB $43, $05
.DB $4D, $05
.DB $56, $05
.DB $5F, $05
.DB $69, $05
.DB $72, $05
.DB $7B, $05
.DB $84, $05
.DB $8D, $05
.DB $96, $05
.DB $9F, $05
.DB $A8, $05
.DB $B1, $05
.DB $BA, $05
.DB $C3, $05
.DB $CB, $05
.DB $D4, $05
.DB $DC, $05
.DB $E5, $05
.DB $ED, $05
.DB $F6, $05
.DB $FE, $05

.DB $07, $06
.DB $0F, $06
.DB $17, $06
.DB $1F, $06
.DB $27, $06
.DB $2F, $06
.DB $37, $06
.DB $3F, $06
.DB $47, $06
.DB $4F, $06
.DB $56, $06
.DB $5E, $06
.DB $65, $06
.DB $6D, $06
.DB $74, $06
.DB $7C, $06
.DB $83, $06
.DB $8A, $06
.DB $92, $06
.DB $99, $06
.DB $A0, $06
.DB $A7, $06
.DB $AE, $06
.DB $B5, $06
.DB $BC, $06
.DB $C2, $06
.DB $C9, $06
.DB $D0, $06
.DB $D6, $06
.DB $DD, $06
.DB $E3, $06
.DB $E9, $06
.DB $F0, $06
.DB $F6, $06
.DB $FC, $06

.DB $02, $07
.DB $08, $07
.DB $0E, $07
.DB $14, $07
.DB $1A, $07
.DB $20, $07
.DB $25, $07
.DB $2B, $07
.DB $30, $07
.DB $36, $07
.DB $3B, $07
.DB $41, $07
.DB $46, $07
.DB $4B, $07
.DB $50, $07
.DB $55, $07
.DB $5A, $07
.DB $5F, $07
.DB $64, $07
.DB $69, $07
.DB $6E, $07
.DB $72, $07
.DB $77, $07
.DB $7B, $07
.DB $80, $07
.DB $84, $07
.DB $88, $07
.DB $8C, $07
.DB $91, $07
.DB $95, $07
.DB $99, $07
.DB $9D, $07
.DB $A0, $07
.DB $A4, $07
.DB $A8, $07
.DB $AB, $07
.DB $AF, $07
.DB $B2, $07
.DB $B6, $07
.DB $B9, $07
.DB $BC, $07
.DB $C0, $07
.DB $C3, $07
.DB $C6, $07
.DB $C9, $07
.DB $CB, $07
.DB $CE, $07
.DB $D1, $07
.DB $D4, $07
.DB $D6, $07
.DB $D9, $07
.DB $DB, $07
.DB $DD, $07
.DB $E0, $07
.DB $E2, $07
.DB $E4, $07
.DB $E6, $07
.DB $E8, $07
.DB $EA, $07
.DB $EC, $07
.DB $ED, $07
.DB $EF, $07
.DB $F1, $07
.DB $F2, $07
.DB $F4, $07
.DB $F5, $07
.DB $F6, $07
.DB $F7, $07
.DB $F8, $07
.DB $F9, $07
.DB $FA, $07
.DB $FB, $07
.DB $FC, $07
.DB $FD, $07
.DB $FE, $07
.DB $FE, $07
.DB $FF, $07
.DB $FF, $07
.DB $FF, $07
.DB $00, $08
.DB $00, $08
.DB $00, $08                                                         ; MAX VELOCITY = 1 TILE PER FRAME = 8 pixels


L_C8EE:
.DB $00, $08
.DB $00, $08
.DB $00, $08
.DB $00, $08
.DB $FF, $07
.DB $FF, $07
.DB $FF, $07
.DB $FE, $07
.DB $FE, $07
.DB $FD, $07
.DB $FC, $07
.DB $FB, $07
.DB $FA, $07
.DB $F9, $07
.DB $F8, $07
.DB $F7, $07
.DB $F6, $07
.DB $F5, $07
.DB $F4, $07
.DB $F2, $07
.DB $F1, $07
.DB $EF, $07
.DB $ED, $07
.DB $EC, $07
.DB $EA, $07
.DB $E8, $07
.DB $E6, $07
.DB $E4, $07
.DB $E2, $07
.DB $E0, $07
.DB $DD, $07
.DB $DB, $07
.DB $D9, $07
.DB $D6, $07
.DB $D4, $07
.DB $D1, $07
.DB $CE, $07
.DB $CB, $07
.DB $C9, $07
.DB $C6, $07
.DB $C3, $07
.DB $C0, $07
.DB $BC, $07
.DB $B9, $07
.DB $B6, $07
.DB $B2, $07
.DB $AF, $07
.DB $AB, $07
.DB $A8, $07
.DB $A4, $07
.DB $A0, $07
.DB $9D, $07
.DB $99, $07
.DB $95, $07
.DB $91, $07
.DB $8C, $07
.DB $88, $07
.DB $84, $07
.DB $80, $07
.DB $7B, $07
.DB $77, $07
.DB $72, $07
.DB $6E, $07
.DB $69, $07
.DB $64, $07
.DB $5F, $07
.DB $5A, $07
.DB $55, $07
.DB $50, $07
.DB $4B, $07
.DB $46, $07
.DB $41, $07
.DB $3B, $07
.DB $36, $07
.DB $30, $07
.DB $2B, $07
.DB $25, $07
.DB $20, $07
.DB $1A, $07
.DB $14, $07
.DB $0E, $07
.DB $08, $07
.DB $02, $07
.DB $FC, $06
.DB $F6, $06
.DB $F0, $06
.DB $E9, $06
.DB $E3, $06
.DB $DD, $06
.DB $D6, $06
.DB $D0, $06
.DB $C9, $06
.DB $C2, $06
.DB $BC, $06
.DB $B5, $06
.DB $AE, $06
.DB $A7, $06
.DB $A0, $06
.DB $99, $06
.DB $92, $06
.DB $8A, $06
.DB $83, $06
.DB $7C, $06
.DB $74, $06
.DB $6D, $06
.DB $65, $06
.DB $5E, $06
.DB $56, $06
.DB $4F, $06
.DB $47, $06
.DB $3F, $06
.DB $37, $06
.DB $2F, $06
.DB $27, $06
.DB $1F, $06
.DB $17, $06
.DB $0F, $06
.DB $07, $06
.DB $FE, $05
.DB $F6, $05
.DB $ED, $05
.DB $E5, $05
.DB $DC, $05
.DB $D4, $05
.DB $CB, $05
.DB $C3, $05
.DB $BA, $05
.DB $B1, $05
.DB $A8, $05
.DB $9F, $05
.DB $96, $05
.DB $8D, $05
.DB $84, $05
.DB $7B, $05
.DB $72, $05
.DB $69, $05
.DB $5F, $05
.DB $56, $05
.DB $4D, $05
.DB $43, $05
.DB $3A, $05
.DB $30, $05
.DB $27, $05
.DB $1D, $05
.DB $13, $05
.DB $09, $05
.DB $00, $05
.DB $F6, $04
.DB $EC, $04
.DB $E2, $04
.DB $D8, $04
.DB $CE, $04
.DB $C4, $04
.DB $BA, $04
.DB $B0, $04
.DB $A6, $04
.DB $9B, $04
.DB $91, $04
.DB $87, $04
.DB $7C, $04
.DB $72, $04
.DB $67, $04
.DB $5D, $04
.DB $52, $04
.DB $48, $04
.DB $3D, $04
.DB $32, $04
.DB $28, $04
.DB $1D, $04
.DB $12, $04
.DB $07, $04
.DB $FC, $03
.DB $F1, $03
.DB $E7, $03
.DB $DC, $03
.DB $D0, $03
.DB $C5, $03
.DB $BA, $03
.DB $AF, $03
.DB $A4, $03
.DB $99, $03
.DB $8E, $03
.DB $82, $03
.DB $77, $03
.DB $6C, $03
.DB $60, $03
.DB $55, $03
.DB $49, $03
.DB $3E, $03
.DB $32, $03
.DB $27, $03
.DB $1B, $03
.DB $10, $03
.DB $04, $03
.DB $F8, $02
.DB $ED, $02
.DB $E1, $02
.DB $D5, $02
.DB $CA, $02
.DB $BE, $02
.DB $B2, $02
.DB $A6, $02
.DB $9A, $02
.DB $8E, $02
.DB $82, $02
.DB $76, $02
.DB $6B, $02
.DB $5F, $02
.DB $53, $02
.DB $46, $02
.DB $3A, $02
.DB $2E, $02
.DB $22, $02
.DB $16, $02
.DB $0A, $02
.DB $FE, $01
.DB $F2, $01
.DB $E5, $01
.DB $D9, $01
.DB $CD, $01
.DB $C1, $01
.DB $B4, $01
.DB $A8, $01
.DB $9C, $01
.DB $90, $01
.DB $83, $01
.DB $77, $01
.DB $6B, $01
.DB $5E, $01
.DB $52, $01
.DB $45, $01
.DB $39, $01
.DB $2D, $01
.DB $20, $01
.DB $14, $01
.DB $07, $01
.DB $FB, $00
.DB $EE, $00
.DB $E2, $00
.DB $D5, $00
.DB $C9, $00
.DB $BC, $00
.DB $B0, $00
.DB $A3, $00
.DB $97, $00
.DB $8A, $00
.DB $7E, $00
.DB $71, $00
.DB $64, $00
.DB $58, $00
.DB $4B, $00
.DB $3F, $00
.DB $32, $00
.DB $26, $00
.DB $19, $00
.DB $0D, $00
_F}_ANGULAR_VEL_TABLE

_F{_TASK_FUNCTIONS

UPDATE_ALL_TASKS:                                                    ; UPDATE ALL TASKS
	LDX #LAST_TASK_INDEX                                             ; SET TASK INDEX=  LAST TASK
	LDY #NUMBER_OF_TASKS                                             ; SET NUMBER OF TASKS = ALL TASKS
	LDA #$00                                                         ; SET TASK STATUS = NO TASKS TO CHECK
	STA TASK_CHECK                                                   ;
	
@check_task_status:                                                  ; CHECK TASK STATUS LOOP
	LDA CURRENT_TASK,X                                               ; IS CURRENT TASK SLEEPING?
	CMP #TASK_SLEEPING                                               ;
	BNE @go_next_task_check_done                                     ; NO-> SET TO NEXT TASK
	
@check_task_wait_counter_status:
	DEC TASK_COUNTER,X                                               ; CURRENT TASK TASK COUNTER--
	BNE @go_next_task_check_done                                     ; COUNTER AT ZERO> NO->SET TO NEXT TASK
	
@set_task_status_to_waiting
	LDA #TASK_WAITING                                                ; SET TASK STATUS = WAITING
	.DB $9D,$00,$00                                                  ; ***BYTE CODED STA $0000,X since asm6 forces to zeropage ****
	STX $01                                                          ;
@go_next_task_check_done:                                            ; SET TO NEXT TASK
	TXA                                                              ; CURRENT TASK INDEX � TASK INDEX OFFSET
	SEC                                                              ;
	SBC #TASK_SIZE                                                   ;
	TAX                                                              ; LOAD INDEX
	DEY                                                              ; ALL TASKS CHECKED?
	BNE @check_task_status                                           ; NO-> CHECK TASK STATUS LOOP
	
@ppu_busy_check:
	BIT PPU_BUFFER_FLAG                                              ; IS NMI PPU BUFFER STATUS = BUSY?
	BMI RETURN_FROM_NMI_ENABLE_INT_RESTORE_BANKS                     ; YES->RETURN FROM NMI TO PREVIOUS 8000/A000 BANKS()
	
@bank_swap_busy_check:
	BIT BANK_FLAG                                                    ; BANK SWAP STATUS=  BUSY?
	BMI RETURN_FROM_NMI_ENABLE_INT_RESTORE_BANKS                     ; YES->RETURN FROM NMI TO PREVIOUS 8000/A000 BANKS()
	
@tasks_left_check:
	LDX TASK_CHECK                                                   ; ARE THERE ANY TASKS TO CHECK?
	BEQ RETURN_FROM_NMI_ENABLE_INT_RESTORE_BANKS                     ; NO-> RETURN FROM NMI TO PREVIOUS 8000/A000 BANKS()
	
@current_task_waiting_check:
	LDY CURRENT_TASK                                                 ;
	LDA_ABS_Y_ZP CURRENT_TASK                                        ;  ***BYTE CODED LDA $0000,Y since asm6 forces to zeropage ****
	CMP #TASK_RUNNING                                                ; DOES CURRENT TASK STATUS = RUNNING?
	BNE CHECK_TASKS                                                  ; NO->START TASK()

@check_return_from_nmi:	
	CPX CURRENT_TASK                                                 ; IS TASK INDEX >= CURRENT TASK?
	BCS RETURN_FROM_NMI_ENABLE_INT_RESTORE_BANKS                     ; YES-> RETURN FROM NMI TO PREVIOUS 8000/A000 BANKS()
@save_task_nmi_axy_locals:
	JMP SAVE_TASK_REGS_LOCALS                                        ; JUMP->  SAVE NMI REGISTERS, LOCAL VARS,  TASK STACK INDEX, TASK BANKS() RET=A=TASK STATUS()


RETURN_FROM_NMI_ENABLE_INT_RESTORE_BANKS:                            ; RETURN FROM NMI TO PREVIOUS 8000/A000 BANKS
	SEI                                                              ; SET INTERRUPT TO PREVENT IRQ INTRUPPTS
	LDY #$06                                                         ; SET MMC3 BANK TO SWAP= $8000
	STY BANK_SELECT_MMC3                                             ;
	LDA SOFT_8000_BANK                                               ; SET MMC3 $8000  BANK = CURRENT $8000 BANK
	STA BANK_DATA_MMC3                                               ;
	INY                                                              ; SET MMC3 BANK TO SWAP= $A000
	STY BANK_SELECT_MMC3                                             ;
	LDA SOFT_A000_BANK                                               ; SET MMC3 $A000 BANK = CURRENT $A000 BANK
	STA BANK_DATA_MMC3                                               ;

RETURN_FROM_NMI_TASK_BUSY:                                           ; RETURN FROM NMI WITH NO BANK SWAP, RESTORE REGISTERS
	LDA SOFT_BANK_SELECT                                             ;
	STA BANK_SELECT_MMC3                                             ;
	LDY NMI_Y                                                        ; SET Y= NMI_PRESERVE_Y
	LDX NMI_X                                                        ; SET X= NMI_PRESERVE_X
	LDA NMI_A                                                        ; SET A= NMI_PRESERVE_A
	RTI                                                              ; RETURN FROM INTERRUPT

																	;
CHECK_TASKS:                                                         ; CHECK FOR TASK RUNNING, WAITING OR CREATED()
	LDX #$FF                                                         ; SET STACK=  BOTTOM OF STACK
	TXS                                                              ;
	LSR TASK_BUSY_FLAG                                               ;
	LDX #FIRST_TASK                                                  ; SET TASK INDEX  = FIRST TASK

_WHILE CC                                       					; CHECK TASK STATUS
	LDA TASK_STATUS,X                                                ; IS TASK STATUS == RUNNING,CREATED OR WAITING?
	CMP #TASK_RUNNING                                                ;
	BCS UPDATE_CURRENT_TASK                                          ; YES->UPDATE TASK (X= CURRENT TASK INDEX)

GO_TO_NEXT_TASK:                                                     ; GO TO NEXT TASK IF SLEEPING, SUSPENDED, EMPTY
	TXA                                                              ; TASK INDEX += OFFSET TO NEXT TASK 
	CLC                                                              ;
	ADC #TASK_SIZE                                                   ;
	TAX                                                              ; IS TASK INDEX >  LAST TASK STATUS INDEX?
	CPX #(LAST_TASK_INDEX + TASK_SIZE)                               ;

_END_WHILE                               							 ; NO-> LOOP BACK TO CHECK TASK STATUS LOOP
	BCS CHECK_TASKS                                                  ; YES-> BRANCH TO CHECK FOR TASK RUNNING, WAITING OR CREATED()

UPDATE_CURRENT_TASK:                                                 ; UPDATE TASK (X= CURRENT TASK INDEX)
	SEC                                                              ; SET TASK FLAG = BEING UPDATED
	ROR TASK_BUSY_FLAG                                               ;
	STX CURRENT_TASK                                                 ; SET CURRENT TASK = TASK TO UPDATE
	CMP #TASK_CREATED                                                ; DOES TASK STATUS == CREATED
	BEQ START_TASK                                                   ; YES->START TASK (X= TASK INDEX)
	LDA SOFT_MODE_8000                                               ; SET BANK SELECT AND SOFT BANK SELECT = SELECT $8000 BANK
	ORA #$06                                                         ;
	STA SOFT_BANK_SELECT                                             ;
	STA BANK_SELECT_MMC3                                             ;
	LDA TASK_BANK_8000,X                                             ; SET BANK INDEX, SOFT $8000 BANK INDEX = TASK OLD $8000 BANK
	STA SOFT_8000_BANK                                               ;
	STA BANK_DATA_MMC3                                               ;
	LDA SOFT_MODE_8000                                               ; SET BANK SELECT AND SOFT BANK SELECT = SELECT $A000 BANK
	ORA #$07                                                         ;
	STA SOFT_BANK_SELECT                                             ;
	STA BANK_SELECT_MMC3                                             ; SET BANK INDEX, SOFT $A000 BANK INDEX = TASK OLD $a000 BANK
	LDA TASK_BANK_A000,X                                             ;
	STA SOFT_A000_BANK                                               ;
	STA BANK_DATA_MMC3                                               ;
	LDA TASK_STATUS,X                                                ; IS TASK STATUS == RUNNING
	CMP #TASK_RUNNING                                                ;
	BEQ @task_running_restore_stack_locvars                          ; YES-> RESTORE TASK VARIABLES FROM STACK()

@not_created_not_running:                                            ; TASK NOT CREATED, NOT RUNNING
	LDA #TASK_RUNNING                                                ; SET TASK STATUS == RUNNING
	STA TASK_STATUS,X                                                ;
	LDA TASK_STACK_INDEX,X                                           ; SET STACK POINTER TO TASK STACK LOCATION
	TAX                                                              ;
	TXS                                                              ;
	PULL_LOCALS_A_X_Y_FROM_STACK                                     ; RESTORE LOCAL VARIABLE AND REGISTERS
	PLP                                                              ; PULL PROCESSOR STATUS
	LSR TASK_BUSY_FLAG                                               ; SET TASK STATUS =  READY
	RTS                                                              ; RETURN

@task_running_restore_stack_locvars:                                 ; RESTORE TASK VARIABLES FROM STACK()
	LDA TASK_STACK_INDEX,X                                           ; SET TASK STACK = OLD TASK STACK
	TAX                                                              ;
	TXS                                                              ;
	PULL_LOCALS_A_X_Y_FROM_STACK                                     ; RESTORE LOCAL VARIABLE AND REGISTERS
	LSR TASK_BUSY_FLAG                                               ; SET TASK STATUS =  READY
	RTI                                                              ; RETURN FROM INTERRUPT

START_TASK:                                                          ; START TASK (X= TASK INDEX)
	LDA #TASK_RUNNING                                                ; SET TASK STATUS = RUNNING
	STA TASK_STATUS,X                                                ;
	LDA TASK_ADDR+1,X                                                ; PUSH NEW TASK ADDRESS TO STACK
	PHA                                                              ;
	LDA TASK_ADDR,X                                                  ;
	PHA                                                              ;
	LDA SOFT_MODE_8000                                               ; SET SOFT BANK SELECT, BANK SELECT = $8000 BANK
	ORA #$06                                                         ;
	STA SOFT_BANK_SELECT                                             ;
	STA BANK_SELECT_MMC3                                             ;
	LDA TASK_BANK,X                                                  ; SET $8000 PRG BANK , SOFT $8000 BANK =  TASK BANK
	STA SOFT_8000_BANK                                               ;
	STA BANK_DATA_MMC3                                               ;
	LDA SOFT_MODE_8000                                               ; SET SOFT BANK SELECT, BANK SELECT = $A000 BANK
	ORA #$07                                                         ;
	STA SOFT_BANK_SELECT                                             ;
	STA BANK_SELECT_MMC3                                             ;
	LDA TASK_BANK,X                                                  ; SET $A000 PRG BANK , SOFT $A000 BANK =  TASK  BANK
	STA SOFT_A000_BANK                                               ; SAVE SOFT $A000 BANK
	STA BANK_DATA_MMC3                                               ; SAVE $A000 BANK
	RTS                                                              ; RETURN TO TASK ADDRESS

SAVE_TASK_REGS_LOCALS:                                               ; SAVE NMI REGISTERS, LOCAL VARS,  TASK STACK INDEX, TASK BANKS(X= TASK INDEX) RET=A=TASK STATUS
	PUSH_NMI_A_X_Y_LOCALS_TO_STACK
	TXA                                                              ; SAVE TASK INDEX
	LDY CURRENT_TASK                                                 ; LOAD CURRENT TASK INDEX
	TSX                                                              ; SET TASK STACK INDEX = CURRENT STACK LOCATION
	STX TASK_STACK_INDEX,Y                                           ;
	LDX SOFT_8000_BANK                                               ; SET TASK $8000 BANK = SOFT $8000 BANK
	STX TASK_BANK_8000,Y                                             ;
	LDX SOFT_A000_BANK                                               ; SET TASK $8000 BANK = SOFT $A000 BANK
	STX TASK_BANK_A000,Y                                             ;
	TAX                                                              ; RESTORE TASK INDEX
	LDA TASK_STATUS,X                                                ; LOAD TASK STATUS
	JMP UPDATE_CURRENT_TASK                                          ; JUMP->  UPDATE TASK (X= CURRENT TASK INDEX)

CREATE_TASK:                                                         ; SET TASK STATUS TO CREATED (Y,A= ADDRESS, X=TASK INDEX)
	STY TASK_ADDR,X                                                  ; SAVE ADDRESS IN TASK ADDRESS
	STA TASK_ADDR+1,X                                                ;
	LDA #TASK_CREATED                                                ; SET TASK STATUS = CREATED
	STA TASK_STATUS,X                                                ;
	JMP SET_PPU_AND_BUFFER_READY_TASKS                               ; JUMP->  SET PPU AND BUFFER STATUS FOR CREATED AND ENDED TASKS

END_CURRENT_TASK:                                                    ; END TASK(X= TASK INDEX)
	LDA #TASK_EMPTY                                                  ; SET TASK STATUS = EMPTY
	LDX CURRENT_TASK                                                 ;
	STA TASK_STATUS,X                                                ;
	JMP CHECK_TASKS                                                  ; JUMP->CHECK FOR TASK RUNNING, WAITING OR CREATED()

SUSPEND_TASK:                                                        ; SUSPEND CURRENT TASK ()
	SEC                                                              ; SET TASK FLAG = BUSY
	ROR TASK_BUSY_FLAG                                               ;
	PHP                                                              ; SAVE PROCESSOR STATUS
	PUSH_A_X_Y_LOCALS_TO_STACK                                       ;
	TSX                                                              ; SAVE TASK STACK INDEX
	TXA                                                              ; SET TASK STACK INDEX = CURRENT STACK LOCATION
	LDX CURRENT_TASK                                                 ;
	STA TASK_STACK_INDEX,X                                           ;
	LDA #TASK_SUSPENDED                                              ; SET TASK STATUS = SUSPENDED/WAITING
	STA TASK_STATUS,X                                                ;
	LDA SOFT_8000_BANK                                               ; SET TASK $8000 BANK = SOFT $8000 BANK
	STA TASK_BANK_8000,X                                             ;
	LDA SOFT_A000_BANK                                               ; SET TASK $8000 BANK = SOFT $A000 BANK
	STA TASK_BANK_A000,X                                             ;
	JMP CHECK_TASKS                                                  ; JUMP->CHECK FOR TASK RUNNING, WAITING OR CREATED()

RESUME_TASK:                                                         ; RESUME TASK (X= TASK INDEX)
	LDA TASK_STATUS,X                                                ; SET TASK STATUS = RESUME TASK
	ORA #$10                                                         ;
	STA TASK_STATUS,X                                                ;
	LDA #$01                                                         ; SET TASK COUNTER = 1 FRAME
	STA TASK_COUNTER,X                                               ;
	RTS                                                              ; RETURN

DELAY_TASK:                                                          ; DELAY TASK (A= #FRAMES TO DELAY)
	SEC                                                              ; SET TASK FLAG = BUSY
	ROR TASK_BUSY_FLAG                                               ;
	PHP                                                              ; SAVE PROCESSOR STATUS
	PUSH_A_X_Y_LOCALS_TO_STACK                                       ;
	TSX                                                              ; SAVE TASK STACK INDEX
	LDY CURRENT_TASK                                                 ; LOAD TASK INDEX
	STX TASK_STACK_INDEX,Y                                           ;
	LDA $010B,X                                                      ; SAVE CURRENT TASK COUNTER IN TASK COUNTER
	LDX CURRENT_TASK                                                 ;
	STA TASK_COUNTER,X                                               ;
	LDA #TASK_SLEEPING                                               ; SET TASK STATUS = SLEEPING
	STA TASK_STATUS,X                                                ;
	LDA SOFT_8000_BANK                                               ; SET TASK $8000 BANK = SOFT $8000 BANK
	STA TASK_BANK_8000,X                                             ;
	LDA SOFT_A000_BANK                                               ; SET TASK $A000 BANK = SOFT $A000 BANK
	STA TASK_BANK_A000,X                                             ;
	LDX #$FF                                                         ; SET STACK TO TOP OF STACK
	TXS                                                              ;
	LSR TASK_BUSY_FLAG                                               ; SET TASK FLAG = READY
	LDX CURRENT_TASK                                                 ; LOAD CURRENT TASK INDEX
	JMP GO_TO_NEXT_TASK                                              ; JUMP->  GO TO NEXT TASK

END_TASK_CHECK_TASK_NOTHING_IN_BUFFERS:                              ; END TASK (X= TASK INDEX)
	LDA #TASK_EMPTY                                                  ; SET TASK STATUS TO EMPTY
	.DB $9D,$00,$00                                                  ; *** BYTE CODED STA $0000,X *** since asm6 can't force it
SET_PPU_AND_BUFFER_READY_TASKS:                                      ; SET PPU AND BUFFER STATUS FOR CREATED AND ENDED TASKS
	TXA                                                              ; CHECK IF ANYTHING FROM PPU TO TASK LEFT?
	EOR PPU_TRANSFER_STATUS                                          ; 
	AND #$3F                                                         ; 
	BNE @check_ppu_buffer                                            ; YES-> CHECK PPU BUFFER
	LDA PPU_TRANSFER_STATUS                                          ; SET PPU STATUS = AVIALABLE, KEEP TEXT OPTION STATUS
	AND #$40                                                         ;
	STA PPU_TRANSFER_STATUS                                          ;
@check_ppu_buffer:                                                   ;
	TXA                                                              ; DOES BG BUFFER HAVE SOMETHING TO TO TRANSER FOR A TASK
	EOR NAME_BUFFER_STATUS                                           ; 
	AND #$3F                                                         ;
	BNE @end_task_buffer_check_exit                                  ; YES->EXIT
	LDA #$00                                                         ;
	STA PPU_TRANSFER_STATUS                                          ; SET PPU TRAFNSER STATUS = AVAILABLE
@end_task_buffer_check_exit:                                         ; EXIT
	RTS                                                              ; RETURN

_F}_TASK_FUNCTIONS 

_F{_PPU_TRANSFER_FUNCTIONS_RENDER_ON 

																	  ; BYTE COMMANDS;;;; 
END_OF_PPU_SCRIPT    			= $FF
WAIT_FRAMES_PPU_SCRIPT 	 		= $FE
JUMP_TO_LOC_PPU_SCRIPT   		= $FD
CHANGE_PPU_COL     				= $E0
CHANGE_AND_SET_PPU_COL   		= $C0
MOVE_DOWN_NUM_ROWS  			= $A0

ppu_data_addr 	= LOCAL_1
ppu_column 		= BUFFER_LOCAL1
bytes_left		= BUFFER_LOCAL2

TRANSFER_TO_PPU_OR_PPUBUFF_WITH_COMMANDS:                            ; TRANFER DATA TO PPU VIA BUFFER OR DIRECTLY DEPENDING ON FADE VALUES
	LDA BG_FADE                                                      ; DOES SPRITE FADE VALUE = FULLY FADED IN OR
	ORA SPR_FADE                                                     ; DOES BACKGROUND FADE VALUE = FULLY FADED IN
	BNE TRANSFER_TO_PPU_WITH_COMMANDS_VIA_BUFFER:                    ; YES->TRANSFER DATA TO PPU VIA BUFFER WITH CONTROL COMMANDS()
	JMP TRANSFER_TO_PPU_WITH_RENDERING_OFF                           ; NO-> TRANSFER DATA TO PPU DIRECTLY

TRANSFER_TO_PPU_WITH_COMMANDS_VIA_BUFFER:                            ; TRANSFER DATA TO PPU VIA BUFFER WITH CONTROL COMMANDS
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER VRAM(X,Y= PPU ADDR TO UPDATE) SAVE ADDR IN $65,66, SET PPU STATUS =BUSY
	LDA PPU_ADDR_TEMP                                                ; SAVE PPU LOW ADDR IN $67
	STA ppu_column                                                   ;
@check_is_data_or_command_loop:                                      ; PROCESS NEXT SET OF DRAW DATA
	LDY #$00                                                         ; DOES DATA VALUE = DATA OR COMMAND?
	LDA (ppu_data_addr),Y                                            ;
	BMI @process_command                                             ; IF NEGATIVE = COMMAND = BRANCH TO PROCESS DRAW COMMAND
	LDY PPU_ADDR_TEMP                                                ; LOAD PPU ADDRESS
	LDX PPU_ADDR_TEMP+1                                              ;
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	AND #MAX_BUFFER_LENGTH                                           ; SAVE LENGTH IN AMOUNT OF BYTES TO TRANSFER
	STA bytes_left                                  				 ;
	LDY #$01                                                         ; SET DATA INDEX = FIRST DATA LOCATION

_WHILE NOT_EQUAL                                                     ; TRANSFER DATA INTO BUFFER LOOP

	LDA (ppu_data_addr),Y                                            ; TRANSFER DATA TO BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INY                                                              ; DATA INDEX++
	INX                                                              ; BUFFER INDEX++
	INC PPU_ADDR_TEMP                                                ;
	DEC bytes_left                                  				 ; AMOUNT OF BYTES TO TRANSFER--

_END_WHILE                                             				; DONE? NO->TRANSFER DATA INTO BUFFER LOOP
	
	ADD_Y_TO_16BIT_ADDR ppu_data_addr                                ;
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	JMP @check_is_data_or_command_loop                               ; JUMP PROCESS NEXT SET OF DATA




@process_command:                                                    ; PROCESS DRAW COMMAND
	CMP #END_OF_PPU_SCRIPT                                           ; DOES COMMAND = 0XFF
	BEQ @end_of_data_commands                                        ; YES->COMMAND TRANSFER DATA TO PPU VIA BUFFER EXIT

	CMP #WAIT_FRAMES_PPU_SCRIPT                                      ; DOES COMMAND = 0XFE
	BEQ @ppu_transfer_wait_frames                                    ; YES->WAIT (A= NUM FRAMES TO WAIT)

	CMP #JUMP_TO_LOC_PPU_SCRIPT                                      ; DOES COMMAND = 0XFD
	BEQ @jump_new_ppu_data_location                                  ; YES->JUMP NEW DATA LOCATION()

	CMP #CHANGE_PPU_COL                                              ; DOES COMMAND = 0XE0-0XFC
	BCS @update_col_temp_addr                                        ; SET NUM COLUMNS PAST CURRENT COLLUMN

	CMP #CHANGE_AND_SET_PPU_COL                                      ; DOES COMMAND = 0XC0-0XDF
	BCS @save_and_update_current_col                                 ; YES->SET NUM COLUMNS PAST CURRENT COLLUMN AND UPDATE COLUMN

	CMP #MOVE_DOWN_NUM_ROWS                                          ; DOES COMMAND = = 0XA0-0XBF
	BCS @set_addr_down_num_rows                                      ; YES->SET NUM ROWS BELOW CURRENT COLLUMN

@repeat_tile                                                         ; 80-9F = REPEAT TILE COMMAND
	SEC                                                              ; AMOUNT OF TIMES TO REPEATE DATA= VALUE -0X80
	SBC #$80
	LDY PPU_ADDR_TEMP                                                ; LOAD PPU ADDRESS
	LDX PPU_ADDR_TEMP+1                                              ;
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	STA bytes_left                                  				 ; SAVE LENGTH IN AMOUNT OF BYTES TO TRANSFER
	LDY #$01                                                         ; SET DATA INDEX = FIRST DATA LOCATION
	LDA (ppu_data_addr),Y                                            ;

_WHILE NOT_EQUAL                                       				 ; REPEAT SAME DATA INTO BUFFER LOOP

	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INX                                                              ; BUFFER INDEX++
	INC PPU_ADDR_TEMP                                                ; PPU ADDRESS++
	DEC bytes_left                                					 ; AMOUNT OF BYTES TO TRANSFER--

_END_WHILE                               							; DONE? NO-> LOOP BACK TO REPEAT SAME DATA INTO BUFFER LOOP
	
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] ppu_data_addr, $02       ; 
	JMP @check_is_data_or_command_loop                               ; JUMP->PROCESS NEXT COMMAND

@set_addr_down_num_rows:                                             ; 0XA0-0XBF SET NUM ROWS BELOW CURRENT COLLUMN
	JSR SET_PPU_ADDR_DOWN_NUM_ROWS                                   ; SET PPU LOCATION # ROWS BELOW CURRENT LOCATION (A= #ROWS + 0XA0)
	JMP @check_is_data_or_command_loop                               ; JUMP->PROCESS NEXT COMMAND

@save_and_update_current_col:                                        ; 0XC0-0XDF SET NUM COLUMNS PAST CURRENT COLLUMN AND UPDATE COLUMN
	SEC                                                              ;
	SBC #$C0                                                         ; SET COLLUNMS TO ADD TO PPU LOCATION = 0 TO 31
	JSR ADD_TO_TEMP_PPU_ADDR_NUM_COL                                 ; UPDATE PPU LOCATION COLLUMN(A= # COLLUMNS)
	LDA PPU_ADDR_TEMP                                                ; SET CURRENT COLLUMN = PPU COLLUMN
	STA ppu_column                                                  ;
	JMP @check_is_data_or_command_loop                               ; JUMP->PROCESS NEXT COMMAND

@update_col_temp_addr:                                               ; 0XE0-0XFC SET NUM COLUMNS PAST CURRENT COLLUMN
	SEC                                                              ;
	SBC #$E0                                                         ; SET COLLUNMS TO ADD TO PPU LOCATION = 0 TO 31
	JSR ADD_TO_TEMP_PPU_ADDR_NUM_COL                                 ; UPDATE PPU LOCATION COLLUMN(A= # COLLUMNS)
	JMP @check_is_data_or_command_loop                               ; JUMP->PROCESS NEXT COMMAND


@jump_new_ppu_data_location:                                         ; 0XFD COMMAND = JUMP NEW DATA LOCATION()
	LDY #$02                                                         ; SET CURRENT DATA ADDRESS = NEW DATA ADDRESS
	LDA (ppu_data_addr),Y                                            ;
	TAX                                                              ;
	DEY                                                              ;
	LDA (ppu_data_addr),Y                                            ;
	STA ppu_data_addr                                                ;
	STX ppu_data_addr+1                                              ;
	JMP @check_is_data_or_command_loop                               ; JUMP->PROCESS NEXT COMMAND

@ppu_transfer_wait_frames:                                           ; OXFE COMMAND = WAIT (A= NUM FRAMES TO WAIT)
	LDA NUM_FRAMES_DRAW_SCRIPT                                       ; LOAD NUMBER OF FRAMES TO WAIT
	JSR DELAY_TASK                                                   ; SWITCH TASK (A= #FRAMES BEFORE RETURNING)
	INC ppu_data_addr                                                ; DATA ADDRESS++
	BNE @wait_exit                                                   ;
	INC ppu_data_addr+1                                              ;
@wait_exit:                                                         ;
	JMP @check_is_data_or_command_loop                               ; PROCESS NEXT COMMAND

@end_of_data_commands:                                               ; OXFF COMMAND TRANSFER DATA TO PPU VIA BUFFER EXIT
	JMP SET_PPU_READY_KEEP_TEXT_SIZE                                 ; JUMP->SET PPU STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN
	
_F}_PPU_TRANSFER_FUNCTIONS_RENDER_ON

_F{_PPU_TRANSFER_FUNCTIONS_RENDER_OFF

END_OF_PPU_SCRIPT    		= $FF
SKIP                		= $FE
JUMP_TO_LOC_PPU_SCRIPT   	= $FD
CHANGE_PPU_COL     			= $E0
CHANGE_AND_SET_PPU_COL   	= $C0
MOVE_DOWN_NUM_ROWS   		= $A0

ppu_data_addr 				= LOCAL_1
ppu_column 					= BUFFER_LOCAL1


TRANSFER_TO_PPU_WITH_RENDERING_OFF:                                  ; TRANSFER DATA TO PPU DIRECTLY
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER PPU(X,Y= PPU ADDR TO UPDATE) SAVE ADDR IN $65,66, SET PPU STATUS =BUSY
	JSR DISABLE_INTERRUPTS_RENDERING                                 ; TURN OFF INTERRUPTS, DISABLE RENDERING 
	LDA NES_PPU_STATUS                                               ; CLEAR PPU STATUS
	LDA PPU_ADDR_TEMP                                                ; SAVE PPU ADDR LOW BYTE IN $67
	STA ppu_column                                                   ;
@process_data_command_rend_off:                                      ; PROCESS NEXT DATA VALUE LOOP
	LDY #$00                                                         ; LOAD DATA VALUE
	LDA (ppu_data_addr),Y                                            ; DOES VALUE = COMMAND
	BMI @process_command_rend_off                                    ; YES-> PROCESS DRAW COMMAND()

@send_data_to_ppu:	
	AND #$40                                                         ; SET PPU ADDR INCREMENT TYPE ( ROW OR COLLUMN)
	LOG_SHIFT_RIGHT_4                                                             ;
	STA NES_PPU_CTRL                                                 ; SAVE IN PPUCTRL
	LDA PPU_ADDR_TEMP+1                                              ; SET PPU ADDR = PPU ADDR TO UPDATE
	STA NES_PPU_ADDR                                                 ;
	LDA PPU_ADDR_TEMP                                                ;
	STA NES_PPU_ADDR                                                 ;
	LDA (ppu_data_addr),Y                                            ; LOAD DATA LENGTH
	AND #MAX_BUFFER_LENGTH                                           ; SET LENGTH = MAX OF 64 BYTES
	TAX                                                              ; SET NUMBER OF BYTES TO READ = LENGTH
	INY                                                              ;

_WHILE NOT_EQUAL                               						 ; TRANSFER BYTES FROM DATA LOCATION TO PPU LOOP

	LDA (ppu_data_addr),Y                                            ;
	STA NES_PPU_DATA                                                 ;
	INY                                                              ; DATA ADDR++
	INC PPU_ADDR_TEMP                                                ; PPU ADDR++
	DEX                                                              ; NUMBER OF BYTES TO READ--

_END_WHILE                       									 ; DONE TRANSFERING BYTES? NO-> TRANSFER BYTES FROM DATA LOCATION TO PPU LOOP

	ADD_Y_TO_16BIT_ADDR ppu_data_addr                                ; PPU DATA ADDR +=  BYTES TRANSFERRED
	JMP @process_data_command_rend_off                               ; PROCESS NEXT DATA VALUE LOOP



@process_command_rend_off:                                           ; PROCESS DRAW COMMAND()
	CMP #END_OF_PPU_SCRIPT                                           ; DOES COMMAND = FINISHED
	BEQ @end_of_ppu_transfer_render_off                              ;
	
	CMP #SKIP                                                        ; DOES COMMAND = SKIP
	BEQ @skip_rend_off                                               ;
	
	CMP #JUMP_TO_LOC_PPU_SCRIPT                                      ; DOES COMMAND = SET NEW DATA LOCATION
	BEQ @jump_new_data_loc_rend_off                                  ;
	
	CMP #CHANGE_PPU_COL                                              ; DOES COMMAND = UPDATE COLLUMN LOCATION
	BCS @update_col_temp_addr_rend_off                               ;
	
	CMP #CHANGE_AND_SET_PPU_COL                                      ; DOES COMMAND = UPDATE COLLUMN LOCATION AND SAVE COLLUMN
	BCS @save_and_update_current_col_rend_off                        ;
	
	CMP #MOVE_DOWN_NUM_ROWS                                          ; DOES COMMAND = SET NUMBER OF ROWS BELOW COLLUMN
	BCS @set_addr_down_num_rows_rend_off

@repeat_tiles_command                                                ; REPEAT TILES COMMAND (0X80-9F)
	SEC                                                              ; NUM TIMES TO REPEAT= VALUE -0X80
	SBC #$80                                                         ; MAX= 0X1F
	AND #$3F                                                         ;
	TAX                                                              ;
	LDA PPU_ADDR_TEMP+1                                              ; SET PPU ADDR = ADDR TO UPDATE
	STA NES_PPU_ADDR                                                 ;
	LDA PPU_ADDR_TEMP                                                ;
	STA NES_PPU_ADDR                                                 ;
	INY                                                              ; LOAD TILE TO REPEAT
	LDA (ppu_data_addr),Y                                            ;

_WHILE NOT_EQUAL                                       				; TRANSFER TILES TO PPU LOOP
	
	STA NES_PPU_DATA                                                 ; SAVE TILE IN PPU
	INY                                                              ;
	INC PPU_ADDR_TEMP                                                ; PPU ADDR++
	DEX                                                              ; NUMBER OF TIMES TO REPEAT--
	
_END_WHILE 															; DONE? NO-> TRANSFER TILES TO PPU LOOP

	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] ppu_data_addr, $02       ;
	JMP @process_data_command_rend_off                               ; JUMP->  PROCESS NEXT DATA VALUE LOOP
	
@set_addr_down_num_rows_rend_off:                                    ; SET NUM ROWS BELOW COMMAND (0XA0-BF)
	JSR SET_PPU_ADDR_DOWN_NUM_ROWS                                   ; SET PPU LOCATION # ROWS BELOW CURRENT LOCATION (A= #ROWS - 0XA0)
	JMP @process_data_command_rend_off                               ; JUMP->  PROCESS NEXT DATA VALUE LOOP
	
@save_and_update_current_col_rend_off:                               ; SET LOCATION AHEAD AMOUNT AND SET NEW LOCATION (0XC0-DF)
	SEC                                                              ; AMOUNT TO GO AHEAD = VALUE -0XC0
	SBC #$C0                                                         ;
	JSR ADD_TO_TEMP_PPU_ADDR_NUM_COL                                 ; UPDATE PPU LOCATION COLLUMN(A= # COLLUMNS)
	LDA PPU_ADDR_TEMP                                                ; SAVE NEW COLLUMN LOCATION
	STA ppu_column
	JMP @process_data_command_rend_off                               ; JUMP->  PROCESS NEXT DATA VALUE LOOP
	
@update_col_temp_addr_rend_off:                                      ; SET LOCATION AHEAD AMOUNT (0XE0-EF)
	SEC                                                              ; AMOUNT TO GO AHEAD = VALUE -0XC0
	SBC #$E0                                                         ;
	JSR ADD_TO_TEMP_PPU_ADDR_NUM_COL                                 ; UPDATE PPU LOCATION COLLUMN(A= # COLLUMNS)
	JMP @process_data_command_rend_off                               ; JUMP->  PROCESS NEXT DATA VALUE LOOP

@jump_new_data_loc_rend_off:                                         ; UPDATE DATA LOCATION COMMAND 0XFD(ADDR)
	LDY #$02                                                         ; DATA ADDRESS = ADDRESS
	LDA (ppu_data_addr),Y                                            ;
	TAX                                                              ;
	DEY                                                              ;
	LDA (ppu_data_addr),Y                                            ;
	STA ppu_data_addr                                                ;
	STX ppu_data_addr+1                                              ;
	JMP @process_data_command_rend_off                               ; JUMP->  PROCESS NEXT DATA VALUE LOOP

@skip_rend_off:                                                      ; **** essentially a noop*****
	INC_16 ppu_data_addr                                             ; data addr++
	JMP @process_data_command_rend_off                               ; JUMP->  PROCESS NEXT DATA VALUE LOOP
	
@end_of_ppu_transfer_render_off:                                     ; DRAW COMMAND DATA END COMMAND 0XFF
	JSR UPDATE_PPUCTRL                                               ; update PPUCTRL()
	JMP SET_PPU_READY_KEEP_TEXT_SIZE                                 ; JUMP->SET PPU STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN

_F}_PPU_TRANSFER_FUNCTIONS_RENDER_OFF

_F{_UPDATE_TEMP_PPU_ADDR_ROWS_COLS_FUNCTIONS

ppu_data_addr   = LOCAL_1
ppu_column 		= BUFFER_LOCAL1
ppu_num_rows	= BUFFER_LOCAL2	

SET_PPU_ADDR_DOWN_NUM_ROWS:                                          ; SET PPU LOCATION # ROWS BELOW CURRENT LOCATION (A= #ROWS - 0XA0)
	SEC                                                              ; NUMBER OF ROWS BELOW CURRENT LOCATION =  MAX 31, MIN 0
	SBC #$A0                                                         ; SET NUMBER OF ROWS. MAX = 31 LENGTH EACH ROW IS 32 BYTES 0R 0X20
	STA ppu_num_rows                                            	 ; SET AMOUNT TO ADD TO PPU LOCATION =
	LDA #$00                                                         ; (NUMBER OF ROWS * LENGTH OF A PPU ROW )
	LSR ppu_num_rows                                           		 ;
	ROR                                                              ;
	LSR ppu_num_rows                                           		 ;
	ROR                                                              ;
	LSR ppu_num_rows                                           		 ;
	ROR                                                              ;
	CLC                                                              ;
	ADC ppu_column                                                   ; CURRENT PPU LOCATION= CURRENT PPU LOCATION + AMOUNT
	STA ppu_column                                                   ;
	STA PPU_ADDR_TEMP                                                ;
	LDA ppu_num_rows                                           	     ;
	ADC PPU_ADDR_TEMP+1                                              ;
	STA PPU_ADDR_TEMP+1                                              ;
	INC_16 ppu_data_addr                                             ; EXIT
	RTS                                                              ; RETURN

ADD_TO_TEMP_PPU_ADDR_NUM_COL:                                        ; UPDATE PPU LOCATION COLLUMN(A= # COLLUMNS)
	CLC                                                              ;
	ADC PPU_ADDR_TEMP                                                ; PPU LOCATION = PPU LOCATION + # COLLUMNS TO ADD
	STA PPU_ADDR_TEMP                                                ;
	LDA #$00                                                         ;
	ADC PPU_ADDR_TEMP+1                                              ;
	STA PPU_ADDR_TEMP+1                                              ;
	INC_16 ppu_data_addr                                             ; EXIT
	RTS                                                             ; RETURN

_F}_UPDATE_TEMP_PPU_ADDR_ROWS_COLS_FUNCTIONS
															
_F{_DRAW_RECT_IMAGE
																	; THIS WORKS FOR UPDATING SQUARE/RECT LOCATIONS
																	; FIRST DATA ADDRESS= NUM ROWS, SECOND DATA ADDRESS = LENGTH
																	; ROW * LENGTH = SIZE OF SQUARE/RECT
																	; USED IN DRAWING PLAY PICTURES
ppu_data_addr 			= LOCAL_1
ppu_num_rows			= BUFFER_LOCAL1
ppu_num_rows_left		= BUFFER_LOCAL1	
ppu_num_tiles_per_row	= BUFFER_LOCAL2	

DRAW_RECTANGULAR_IMAGE:                                              ; UPDATE PPU NUM ROWS(3E,3F= DATA ADDRESS(ROWS AND LENGTH)  X,Y= PPU ADDRESS)
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER VRAM(X,Y= PPU ADDR TO UPDATE) SAVE ADDR IN $65,66, SET PPU STATUS =BUSY
	LDY #$00                                                         ; SAVE NUMBER OF ROWS
	LDA (ppu_data_addr),Y                                            ;
	STA ppu_num_rows                                     			 ;
	INY                                                              ;
	LDA (ppu_data_addr),Y                                            ; SAVE LENGTH= NUMBER OF COLLUMNS
	STA ppu_num_tiles_per_row                                        ;
	LDA #$02                                                         ;  DATA LOCATION +=  2 BYTES
@update_data_addr:                                                   ; TRANSFER LENGTH AND ADDRESS TO BUFFER
	CLC                                                              ;
	ADC ppu_data_addr                                                ;
	STA ppu_data_addr                                                ;
	LDA ppu_data_addr+1                                              ;
	ADC #$00                                                         ;
	STA ppu_data_addr+1                                              ;
	LDY PPU_ADDR_TEMP                                                ; LOAD PPU ADDRESS
	LDX PPU_ADDR_TEMP+1                                              ;
	LDA ppu_num_tiles_per_row                                            ; LOAD LENGTH= NUMBER OF COLLUMNS
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDY #$00                                                         ; SET DATA INDEX= FIRST DATA LOCATION

@transfer_data_to_ppu_buff:                                          ; TRANSFER DATA TO BUFFER LOOP
	LDA (ppu_data_addr),Y                                            ; TRANSFER DATA BYTE TO BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INX                                                              ; BUFFER INDEX++
	INY                                                              ; DATA INDEX++
	CPY ppu_num_tiles_per_row                                            ; DOES BYTES TRANSFERRED = BUFFER LENGTH ?
	BNE @transfer_data_to_ppu_buff                                   ; NO-> TRANSFER DATA TO BUFFER LOOP
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
TEMP_PPU_ADDR_DOWN_ONE_ROW                                        	; SET PPU ADDRESS = PPU ADDRESS + ONE ROW DOWN
	LDA ppu_num_tiles_per_row                                            ; LOAD COLLUMNS
	DEC ppu_num_rows_left                                   		 ; NUMBER OF ROWS--
	BNE @update_data_addr                                            ;
	JMP SET_PPU_READY_KEEP_TEXT_SIZE                                 ; JUMP->SET PPU STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN

_F}_DRAW_RECT_IMAGE

_F{_DRAW_LARGE_TEXT

ppu_addr_temp   				= LOCAL_1
text_index    					= LOCAL_3
text_length   					= LOCAL_4
bytes_left_to_read  			= LOCAL_4
UPPER_HALF_OF_LETTER_OFFSET 	= $00
LOWER_HALF_OF_LETTER_OFFSET 	= $76

large_text_length			= BUFFER_LOCAL1	
upper_lower_letter_offset	= BUFFER_LOCAL2
	
DRAW_LARGE_TEXT:                                                     ; BUFFER_LARGE_TEXT(X,Y= PPU ADDR, 3E,3F= DATA ADDR, A= LENGTH)
	PHA                                                              ; SAVE LENGTH
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER VRAM(X,Y= PPU ADDR TO UPDATE) SAVE ADDR IN $65,66, SET PPU STATUS =BUSY
	PLA                                                              ; SET TEMP LENGTH = LENGTH
	STA large_text_length                                            ;
	LDA #UPPER_HALF_OF_LETTER_OFFSET                                 ; SET TILE OFFSET = UPPER HALF OF LETTER
	JSR @transfer_large_text_tile_to_buffer:                         ; BUFFER HALF OF_LARGE_TEXT(A= )
TEMP_PPU_ADDR_DOWN_ONE_ROW                                           ; PPU ADDRESS = PPU ADDRESS + ONE ROW     
	LDA #LOWER_HALF_OF_LETTER_OFFSET                                 ; SET TILE TABLE OFFSET = LOWER HALF OF LETTER
	JSR @transfer_large_text_tile_to_buffer:                         ; BUFFER HALF OF_LARGE_TEXT(A= )
	JMP SET_PPU_READY_KEEP_TEXT_SIZE                                 ; JUMP->SET PPU STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN


@transfer_large_text_tile_to_buffer:                                 ; BUFFER HALF OF_LARGE_TEXT(A= )
	STA upper_lower_letter_offset                                   ; SAVE UPPER OR LOWER HALF OF LETTER OFFSET
	LDA large_text_length                                            ; BUFFER LENGTH = TEMP LENGTH *2
	ASL                                                              ;
	LDY PPU_ADDR_TEMP                                                ;
	LDX PPU_ADDR_TEMP+1                                              ;
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDA large_text_length                                           ; SET BYTES TO READ = LENGTH
	STA text_length                                                  ;
	LDA #$00                                                         ; SET DATA INDEX = FIRST DATA LOCATION
	STA text_index                                                   ;
@transfer_large_text_to_buffer:                                      ; TRANSFER DATA TO BUFFER LOOP
	LDY text_index                                                   ;
	LDA (ppu_addr_temp),Y                                            ; LOAD LETTER
	CMP #START_OF_LOWER_CASE                                         ; IS LETTER = NUMBER or SPECIAL CHARACTER?
	BCC @convert_ascii_value_to_table_index                          ; NO-> BRANCH TO CONVERT LETTER TO LARGE TILE
	AND #UPPER_CASE_BIT_MASK                                         ; TABLE INDEX MASK FOR LARGE LETTER

@convert_ascii_value_to_table_index:                                 ; CONVERT LETTER TO UPPER OR LOWER HALF O LARGE LETTER TILE
	SEC                                                              ;
	SBC #$20                                                         ;
	ASL                                                              ; =(2 * LETTER VALUE � LARGE TILE OFFSET)
	CLC                                                              ;
	ADC upper_lower_letter_offset                                   ; + UPPER OR LOWER HALF OF LETTER OFFSET
	TAY                                                              ;
																	; SAVE LARGE TILE VALUES IN BUFFER
	LDA LARGE_TEXT_TILE_TABLE,Y                                      ;
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INX                                                              ; BUFFER INDEX ++
	LDA LARGE_TEXT_TILE_TABLE+1,Y                                    ;
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INX                                                              ;
	INC text_index                                                   ; DATA INDEX ++
	DEC bytes_left_to_read                                           ; BYTES TO READ--
	BNE @transfer_large_text_to_buffer                               ; DONE? NO-> LOOP BACK TO TRANSFER DATA TO BUFFER LOOP
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)

_F}_DRAW_LARGE_TEXT 

_F{_DRAW_TEAM_INFO_FUNCTIONS

text_length   				= LOCAL_1
bytes_left_to_read  		= LOCAL_1
previous_A000_BANK  		= LOCAL_2
team_info_addr				= BUFFER_LOCAL1	


DRAW_TEAM_NAME_CITY_CONF_TEXT:                                       ; DRAW ABREV TEAM CITY/ TEAM CONFERENCE ON TEAM DATA(X,Y =PPUADDRESS, A= TEAM ID)
	PHA                                                              ; SAVE TEAM ID +
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER VRAM(X,Y= PPU ADDR TO UPDATE) SAVE ADDR IN $65,66, SET PPU STATUS =BUSY
	PLA                                                              ; LOAD TEAM ID
	ASL                                                              ; SHIFT SINCE EACH TEAM POINTER TWO BYTES
	TAY                                                              ;
	LDA SOFT_A000_BANK                                               ; SET PREVIOUS $A000 BANK = CURRENT $A000 BANK
	STA previous_A000_BANK                                           ;
	LDX #TEAM_NAME_CITY_DATA_BANK                                    ; LOAD BANK 16
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDA TEAM_TEXT_INFO_DATA_START,Y						         ; SET TEAM CITY/NAME POINTER FROM TEAM CITY/NAME POINTER INTIAL POINTERS
	STA team_info_addr						              		 	 ;
	LDA TEAM_TEXT_INFO_DATA_START+1,Y						         ;
	STA team_info_addr+1						           		 	 ;
	LDA TEAM_TEXT_INFO_DATA_START+2,Y						         ; LOAD NEXT TEAM CITY ABREEV POINTER TO CALCULATE LENGTH
	SEC							                             		 ;
	SBC team_info_addr					              		 		 ;
	STA text_length                                                  ; SAVE LENGTH
	LDY PPU_ADDR_TEMP                                                ; LOAD PPU ADDRESS
	LDX PPU_ADDR_TEMP+1                                              ;
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDY #$00                                                         ;
@transfer_team_text_buffer:                                          ; TRANSFER CITY ABRREVATION INTO BUFFER LOOP

_WHILE NOT_EQUAL
	
	LDA (team_info_addr),Y                                           ; TRANSFER TILE VALUE INTO BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INY                                                              ; DATA ADRESS++
	INX                                                              ; BUFFER INDEX++
	DEC bytes_left_to_read                                           ; NUMBER OF BYTES TO READ--

_END_WHILE                                                       ; SET BUFFER LOCATION = END OF BUFFER
	
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	JSR SET_PPU_READY_KEEP_TEXT_SIZE                                 ; SET BUFFER STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN
	LDX previous_A000_BANK                                           ; LOAD PREVIOUS $A000 BANK
	JMP SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)

																	; USED IN COIN TOSS, TEAM RANKINGS
DRAW_TEAM_INFO_CENTERED:                                             ;* DRAW TEAM NAMES SMALL LETTERS LEFT JUSTIFY (X,Y =PPUADDRESS, A= TEAM ID + INFO OFFSET)
	CLC                                                              ; CLC = LEFT JUSTIFY
	JMP DRAW_TEAM_INFO_WITH_JUSTIFY                                  ; JUMP>-DRAW TEAM NAMES SMALL LETTERS (X,Y =PPUADDRESS, A= TEAM ID + INFO OFFSET) C= TEXT ALIGN

																	;*  *****UNUSED*****
DRAW_TEAM_INFO_RIGHT_JUSTIFY                                         ;* DRAW TEAM NAMES SMALL LETTERS RIGHT JUSTIFY (X,Y =PPUADDRESS, A= TEAM ID + INFO OFFSET)
	SEC                                                               ; SEC = RIGHT JUSTIFY

text_length         			= LOCAL_1
text_align_A000_bank   			= LOCAL_2
ending_text_buffer_index  		= LOCAL_3 
starting_text_buffer_index  	= LOCAL_4 
max_characters    			 	= LOCAL_8

team_info_addr					= BUFFER_LOCAL1	
		
DRAW_TEAM_INFO_WITH_JUSTIFY:                                         ;* DRAW TEAM NAMES SMALL LETTERS (X,Y =PPUADDRESS, A= TEAM ID + INFO OFFSET) C= TEXT ALIGN
	ROR text_align_A000_bank                                         ; SAVE LEFT OR RIGHT ALIGN
	PHA                                                              ; SAVE TEAM ID + OFFSET TO TEAM NAME
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER VRAM(X,Y= PPU ADDR TO UPDATE) SAVE ADDR $65,66, SET PPU STATUS =BUSY
	PLA                                                              ; SHIFT SINCE EACH TEAM POINTER TWO BYTES
	ASL                                                              ;
	TAY                                                              ;
	LDA text_align_A000_bank                                         ;
	AND #$80                                                         ; SET PREVIOUS $A000 BANK AND INVERT CHR BANK FOR ALIGNMENT
	ORA SOFT_A000_BANK                                               ;
	STA text_align_A000_bank                                         ;
	
	LDX #TEAM_NAME_CITY_DATA_BANK                                    ; SET BANK = BANK 16
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA TEAM_TEXT_INFO_DATA_START,Y						         ; SET TEAM CITY/NAME POINTER FROM TEAM CITY/NAME POINTER INTIAL POINTERS
	STA team_info_addr						              		 	 ;
	LDA TEAM_TEXT_INFO_DATA_START+1,Y						     	 ;
	STA team_info_addr+1						           		     ;
	LDA TEAM_TEXT_INFO_DATA_START+2,Y						         ; LOAD NEXT TEAM CITY ABREEV POINTER TO CALCULATE LENGTH
	SEC							                             		 ;
	SBC team_info_addr						              		     ;	
	STA text_length                                                  ;
	LDY PPU_ADDR_TEMP                                                ; LOAD PPU ADDRESS
	LDX PPU_ADDR_TEMP+1                                              ;
	LDA max_characters                                               ; LOAD BLANK TILE LENGTH
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	STX starting_text_buffer_index                                   ; SAVE BUFFER INDEX
	
	LDY max_characters                                               ; LOAD BLANK TILE LENGTH
	LDA #BLANK_TILE_ID                                                  ; SET TILE VALUE = BLANK TILE
@blank_tiles_to_buffer_loop:                                         ;* JUSTIFY TEXT BY FILLING WITH BLANK TILES LOOP
	STA CURRENT_BG_BUFFER_LOC,X                                      ; SAVE DATA IN BUFFER
	INX                                                              ; BUFFER INDEX++
	DEY                                                              ; BYTES TO TRANSFER--
	BNE @blank_tiles_to_buffer_loop                                  ; DONE? NO-> JUSTIFY TEXT BY FILLING WITH BLANK TILES LOOP
	
	STX ending_text_buffer_index                                     ; SAVE BUFFER INDEX
	LDA max_characters                                               ; = TEXT BUFFER LENGTH � TEAM NAME LENGTH
	SEC                                                              ;
	SBC text_length                                                  ;
	BIT text_align_A000_bank                                         ; DOES JUSTIFY = RIGHT
	BMI @update_buffer_index_for_justify                             ; YES->UPDATE BUFFER INDEX
	LSR                                                              ; ELSE JUSTIFY = CENTER DIVIDE BY 2 TO GET CENTER OF BUFFER 

@update_buffer_index_for_justify:                                    ; UPDATE BUFFER INDEX
	CLC                                                              ;
	ADC starting_text_buffer_index                                   ;
	TAX                                                              ; SET BUFFER INDEX
	
	LDY #$00                                                         ; SET DATA ADDR= FIRST ADDR
@team_info_to_buffer_loop:                                           ; TRANSFER TEAM NAME TO BUFFER LOOP
	LDA (team_info_addr),Y                                           ; SAVE DATA TO BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INY                                                              ; DATA ADDR++
	INX                                                              ; BUFFER INDEX++
	DEC text_length                                                  ; NUMBER OF BYTES TO TRANSFER--
	BNE @team_info_to_buffer_loop                                    ; DONE? NO-> TRANSFER TEAM NAME TO BUFFER LOOP
	
	LDX ending_text_buffer_index                                     ; LOAD BUFFER INDEX
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	JSR SET_PPU_READY_KEEP_TEXT_SIZE                                 ; SET PPU STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN
	LDA text_align_A000_bank                                         ; LOAD PREVIOUS $A000 BANK
	AND #$7F                                                         ; MASK OUT CHR INVERSION
	TAX                                                              ;
	JMP SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)

team_info_addr        = LOCAL_1
team_id       = LOCAL_3 
ppu_addr_temp     = LOCAL_4 
	
	
DRAW_TEAM_INFO_LARGE:                                                ;* DRAW TEAM NAME LARGE (A= TEAM ID, X,Y =PPUADDR)
	ASL                                                              ; SHIFT SINCE EACH PTR IS TWO BYTES
	STA team_id                                                      ; SAVE TEAM ID INDEX
	STX ppu_addr_temp                                                ; SAVE PPU ADDR HIGH BYTE
	LDA SOFT_A000_BANK                                               ; PUSH $A000 BANK TO STACK
	PHA                                                              ;
	LDX #TEAM_NAME_CITY_DATA_BANK                                    ; LOAD BANK 16
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDX team_id                                                      ; LOAD TEAM ID INDEX
	LDA TEAM_TEXT_INFO_DATA_START,X                                ; LOAD TEAM NAME POINTER FROM TEAM NAME POINTERS
	STA team_info_addr                                               ;
	LDA TEAM_TEXT_INFO_DATA_START+1,X                              ;
	STA team_info_addr+1                                             ;
	LDA TEAM_TEXT_INFO_DATA_START+2 ,X                             ; LOAD NEXT TEAM NAME POINTER FROM TEAM NAME POINTERS
	SEC                                                              ; LENGTH = TEAM NAME PTR- NEXT TEAM NAME PTR
	SBC team_info_addr                                               ;
	LDX ppu_addr_temp                                                ; LOAD PPU ADDR HIGH BYTE
	JSR DRAW_LARGE_TEXT                                              ; BUFFER_LARGE_TEXT(X,Y= PPU ADDR, 3E,3F= DATA ADDR, A= LENGTH)
	PLA                                                              ; RESTORE PREVIOUS $A000 BANK
	TAX                                                              ;
	JMP SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)


team_info_addr   = LOCAL_1
team_data_offset  = LOCAL_2
ppu_addr_temp   = LOCAL_3 
	
	
DRAW_TEAM_INFO_LARGE_JUSTIFY:                                        ;* DRAW TEAM INFO LARGE (A= TEAM ID, X,Y =PPUADDR, $45 = MAX CHARACTERS )
	ASL                                                              ; SHIFT TEAM ID SINCE EACH POINTER IS TWO BYTES
	STA team_data_offset                                             ; SAVE TEAM INDEX IN $3F
	STY ppu_addr_temp                                                ; SAVE PPU ADDR
	STX ppu_addr_temp+1                                              ;
	LDA SOFT_A000_BANK                                               ; PUSH $A000 BANK TO STACK
	PHA
	LDX #TEAM_NAME_CITY_DATA_BANK                                    ; LOAD BANK 16
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDX team_data_offset                                             ; 
	LDA TEAM_TEXT_INFO_DATA_START,X                                ; LOAD TEAM NAME POINTER FROM TEAM NAME POINTERS
	STA team_info_addr                                               ;
	LDA TEAM_TEXT_INFO_DATA_START+1,X                              ;
	STA team_info_addr+1                                             ;
	LDA TEAM_TEXT_INFO_DATA_START+2,X                              ; LOAD NEXT TEAM NAME POINTER FROM TEAM NAME POINTERS
	SEC                                                              ; LENGTH = TEAM NAME PTR- NEXT TEAM NAME PTR
	SBC team_info_addr                                               ;
	JMP ALIGN_BUFFER_LARGE_TEXT                                      ; JUMP->ALIGN AND BUFFER LARGE TEXT (X,Y =PPUADDR, A=LENGTH, $45=JUSTIFY)
	
_F}_DRAW_TEAM_INFO_FUNCTIONS

_F{_UNUSED_BROKEN_TEAM_INFO_FUNCTION 

L_D05F:                                                              ; UNUSED/BROKEN
	ASL                                                              ; SHIFT TEAM ID SINCE EACH POINTER IS TWO BYTES
	STA $3F                                                          ; SAVE TEAM INDEX IN $3F
	STY $40
	STX $41
	LDA SOFT_A000_BANK                                               ; PUSH $A000 BANK TO STACK
	PHA
	LDX #$0F                                                         ; BANK16
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDX $3F                                                          ; LOAD TEAM NAME POINTER INDEX
	LDA $BC00,X                                                      ; SAVE TEAM NAME POINTER IN $3E,3F
	STA $3E
	LDA $BC01,X
	STA $3F
	LDA $BC02,X
	ASL
	SEC
	SBC $3E
	
_F}_UNUSED_BROKEN_TEAM_INFO_FUNCTION
		
_F{_BUFFER_LARGE_TEXT

ppu_addr_temp = LOCAL_3
team_info_text_length = LOCAL_6
max_characters = LOCAL_8

ALIGN_BUFFER_LARGE_TEXT:                                             ; ALIGN AND BUFFER LARGE TEXT (X,Y =PPUADDR, A=LENGTH, $45=MAX CHARACTERS)
	STA team_info_text_length                                        ; SAVE LENGTH
	LDA max_characters                                               ; 
	SEC                                                              ;
	SBC team_info_text_length                                        ;
	CLC                                                              ;
	ADC ppu_addr_temp                                                ;
	TAY                                                              ;
	LDA ppu_addr_temp +1                                             ;
	ADC #$00                                                         ;
	TAX                                                              ;
	LDA team_info_text_length                                        ; LOAD LENGTH
	JSR DRAW_LARGE_TEXT                                              ; BUFFER_LARGE_TEXT(X,Y= PPU ADDR, 3E,3F= DATA ADDR, A= LENGTH)
	PLA                                                              ; RESTORE PREVIOUS $A000 BANK
	TAX                                                              ;
	JMP SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	
_F}_BUFFER_LARGE_TEXT

_F{_FILL_AREA_WITH_TILE_FUNCTIONS 

length   = LOCAL_1
num_rows  = LOCAL_2
tile_id  = LOCAL_4


FILL_SCREEN_BLANK_TILE_AREA:                                         ;* FILL PPU LOCATIONS WITH BLANK TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	LDA #BLANK_TILE_ID                                                  ; SET TILE VALUE = BLANK TILE

FILL_SCREEN_TILE_AREA:                                               ;* FILL PPU LOCATIONS WITH  TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, A = TILE)
	STA tile_id                                                      ;
	LDA BG_FADE                                                      ; ARE BACKGROUND AND SPRITE FADE VALUES =  FULLY FADED OUT
	ORA SPR_FADE                                                     ;
	BEQ FILL_AREA_W_TILE_RENDERING_OFF                               ; YES-> FILL PPU LOCATION WITH TILE, BG IS FADED OUT (X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, $41)
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER VRAM(X,Y= PPU ADDR TO UPDATE) SAVE ADDR IN $65,66, SET PPU STATUS =BUSY

@update_row:                                                         ;* UPDATE ROW
	LDA length                                                       ; LOAD LENGTH
	LDY PPU_ADDR_TEMP                                                ; SET PPU ADDRESS
	LDX PPU_ADDR_TEMP+1                                              ;
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDY length                                                       ; SET BUFFER INDEX = LENGTH = NUMBER OF TILES LEFT
	LDA tile_id                                                      ; LOAD TILE VALUE

_WHILE NOT_EQUAL                                                     ;* SAVE TILE VALUE IN BUFFER LOOP

	STA CURRENT_BG_BUFFER_LOC,X                                      ; SAVE TILE IN BUFFER
	INX                                                              ;
	DEY                                                              ; NUMBER OF TILES LEFT--

_END_WHILE                                   ; DONE? NO->SAVE TILE VALUE IN BUFFER LOOP
	
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	LDA NUM_FRAMES_DRAW_SCRIPT                                       ; DOES NUMBER OF FRAMES TO WAIT = 0
	BEQ @down_one_row_check_if_done                                  ; YES-> SET PPU ADDRESS TO NEXT ROW AND CHECK IF DONE
	JSR DELAY_TASK                                                   ; SWITCH TASK (#FRAMES BEFORE RETURNING)

@down_one_row_check_if_done:                                         ;* SET PPU ADDRESS TO NEXT ROW AND CHECK IF DONE
	TEMP_PPU_ADDR_DOWN_ONE_ROW                                       ; SET PPU ADDRESS = PPU ADDRESS + ONE ROW
	DEC num_rows                                                     ; NUMBER OF ROWS--
	BNE @update_row                                                  ; ALL ROWS DONE? NO-> UPDATE ROW
	JMP SET_PPU_READY_KEEP_TEXT_SIZE                                 ; JUMP->SET PPU STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN


	
FILL_AREA_W_TILE_RENDERING_OFF:                                      ;* FILL PPU LOCATION WITH TILE, BG IS FADED OUT(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH, $41)
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER BUFFER TO PPU(Y,X= PPU ADDR TO UPDATE) SAVE ADDR IN $64,65, SET PPU STATUS =BUSY
	JSR DISABLE_INTERRUPTS_RENDERING                                 ; TURN OFF INTERRUPTS, DISABLE RENDERING 

@update_row_rend_off:                                                ; UPDATE PPU ROW
	LDA NES_PPU_STATUS                                               ; CLEAR PPUSTATUS
	LDA PPU_ADDR_TEMP+1                                              ; TRANSFER PPU ADDRESS TO UPDATE TO PPUADDR
	STA NES_PPU_ADDR                                                 ;
	LDA PPU_ADDR_TEMP                                                ;
	STA NES_PPU_ADDR                                                 ;
	
	LDX length                                                       ; LOAD LENGTH
	LDA tile_id                                                      ; LOAD TILE VALUE
@transfer_data_to_ppu_rend_off:                                      ; UPDATE PPU DATA FOR (LENGTH) LOOP
	STA NES_PPU_DATA                                                 ; WRITE TILE VALUE TO PPUDATA
	DEX                                                              ;
	BNE @transfer_data_to_ppu_rend_off                               ; LENGTH DONE? NO ->LOOP BACK TO UPDATE PPU FOR (LENGTH) LOOP
	
	TEMP_PPU_ADDR_DOWN_ONE_ROW                                       ;
	DEC num_rows                                                     ; NUMBER OF ROWS--
	BNE @update_row_rend_off                                         ; NO-> FILL PPU LOCATIONS WITH TILE(X,Y= ADDR, 3F= NUM ROWS, 3E= LENGTH)
	JSR UPDATE_PPUCTRL                                               ; UPDATE_PPU_CTRL
	JMP SET_PPU_READY_KEEP_TEXT_SIZE                                 ; JUMP->SET BUFFER STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN

	
CLEAR_ALL_NAMETABLES:                                                ; CLEAR ALL NAMETABLES $2000-$2BFF()
	LDY #<NAMETABLE1_START                                           ; SET START ADDRESS = $2000
	LDX #>NAMETABLE1_START                                           ;
	LDA #(NUM_ROWS_PER_NAMETABLE * 3 )                                ; SET NUM ROWS = 128
	STA num_rows                                                     ;
	LDA #LENGTH_OF_ONE_ROW                                           ; SET LENGTH =0X20
	STA length                                                       ; == 0X60 *0X20 = 0X0C00
	JMP FILL_SCREEN_BLANK_TILE_AREA                                  ; CLEAR VRAM(X,Y= ADDR, 3F= NUM lines, 3E= length)

CLEAR_2800_NAMETABLE:                                                ; CLEAR 2800 THRU 2BFF NAMETABLE()
	LDX #>NAMETABLE3_START                                          ; LOAD UPPER NAME TABLE ADDRESS BYTE
	JMP CLEAR_SINGLE_NAMETABLE                                       ;
	
CLEAR_2400_NAMETABLE:                                                ; CLEAR 2400 THRU 27FF NAMETABLE()
	LDX #>NAMETABLE2_START                                           ; LOAD UPPER NAME TABLE ADDRESS BYTE
	JMP CLEAR_SINGLE_NAMETABLE
	
CLEAR_2000_NAMETABLE:                                               ; CLEAR 2000 THRU 23FF NAMETABLE()
	LDX #>NAMETABLE1_START                                           ; LOAD UPPER NAME TABLE ADDRESS BYTE

CLEAR_SINGLE_NAMETABLE:                                              ; CLEAR SINGLE NAMETABLES(X= UPPER ADDRESS BYTE)
	LDY #$00                                                         ; SET LOWER ADDRESS BYTE = 00
	LDA #NUM_ROWS_PER_NAMETABLE                                      ; SET NUM ROWS = 32
	STA num_rows                                                     ;
	LDA #LENGTH_OF_ONE_ROW                                           ; SET LENGTH =0X20
	STA length                                                       ; == 0X20 *0X20 = 0X0400
	JMP FILL_SCREEN_BLANK_TILE_AREA                                  ; CLEAR VRAM(X,Y= ADDR, 3F= NUM lines, 3E= length)
	
_F}_FILL_AREA_WITH_TILE_FUNCTIONS
	
_F{_PALLETE_FUNCTION
																	; PALLETE_FUNCTIONS
SET_AND_FADE_IN_BG_SPR_PAL:                                          ; FADE BACKGROUND AND SPRITE PALLETE IN(A= BG PALLETE, X= SPRITE PALLETE)
	STA BG_PAL_INDEX                                                 ; SAVE BG PALETTE ID
	STX SPR_PAL_INDEX                                                ; Store SPRITE PALETTE ID
	JSR GET_SAVE_BG_PAL_TO_BUFFER                                    ; SAVE BACKGROUND PALETTE IN BUFFER()
	JSR GET_SAVE_SPR_PAL_TO_BUFFER                                   ; SAVE SPRITE PALETTE IN BUFFER()

FADE_IN_BG_AND_SPR_PAL:                                              ; FADE IN BACKGROUND AND SPRITE PALLETES()
	LDA BG_FADE                                                      ; DOES BACKGROUND FADE VALUE = FULLY FADED IN
	CMP #FULLY_FADED_IN                                                         ;
	BCS CHECK_SPR_PAL_FADED_IN                                       ; YES->CHECK FOR SPRITE PALLETE FADED IN
	INC BG_FADE                                                      ; NO->BACKGROUND FADE VALUE++

CHECK_SPR_PAL_FADED_IN:                                              ; CHECK FOR SPRITE PALLETE FADED IN
	LDA SPR_FADE                                                     ; DOES SPRITE FADE VALUE = FULLY FADED IN
	CMP #FULLY_FADED_IN                                              ;
	BCS SAVE_PALLETES_BUFFER_CHECK_FADE_IN_DONE                      ; YES->SAVE PALLETES TO BUFFER AND CHECK IF PALLETES FULLY FADED IN()
	INC SPR_FADE                                                     ; NO->SPRITE FADE VALUE++

SAVE_PALLETES_BUFFER_CHECK_FADE_IN_DONE:                             ; SAVE PALLETES TO BUFFER AND CHECK IF PALLETES FULLY FADED IN()
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; SAVE PALETTE BUFFER TO BUFFER ()
	LDA #$01                                                         ; LOAD 1 FRAME
	JSR DELAY_TASK                                                   ; SWITCH TASK (A= #FRAMES BEFORE RETURNING)
	LDA BG_FADE                                                      ; ARE BOTH PALLETES = FULLY FADED IN
	CLC                                                              ;
	ADC SPR_FADE                                                     ;
	CMP #BOTH_PAL_FADED_IN                                           ;
	BCC FADE_IN_BG_AND_SPR_PAL                                       ; NO-> FADE IN BACKGROUND AND SPRITE PALLETES
	RTS                                                              ; RETURN

FADE_IN_BG_PAL:                                                      ; FADE IN BACKGROUND PALLETE(A= PALLETE ID)
	STA BG_PAL_INDEX                                                 ; SAVE BACKGROUND PALLETE TO FADE IN #
	JSR GET_SAVE_BG_PAL_TO_BUFFER                                    ; SAVE BACKGROUND PALETTE IN BUFFER()

_WHILE ALWAYS                                                    	; WAIT FOR BACKGROUND PALLETTE  TO FADE IN LOOP
	
	LDA BG_FADE                                                      ; DOES BACKGROUND FADE VALUE = FULLY FADED IN
	CMP #FULLY_FADED_IN                                              ;
	BCS @bg_fade_in_exit                                             ; YES->EXIT
	INC BG_FADE                                                      ; BACKGROUND FADE VALUE++
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; SAVE PALETTE BUFFER TO BUFFER ()
	RETURN_1_FRAME

_END_WHILE                                            				 ; JUMP->  WAIT FOR BACKGROUND PALLETTE TO FADE IN LOOP

@bg_fade_in_exit:                                                    ; EXIT
	RTS                                                              ; RETURN


FADE_IN_SPR_PAL:                                                     ; FADE IN SPRITE PALLETE(A= PALLETE ID)
	STA SPR_PAL_INDEX                                                ; SAVE SPRITE PALLETE TO FADE IN #
	JSR GET_SAVE_SPR_PAL_TO_BUFFER                                   ; SAVE SPRITE PALETTE IN BUFFER()

_WHILE ALWAYS                                                    	; WAIT FOR SPRITE PALLETTE TO FADE IN LOOP
	
	LDA SPR_FADE                                                     ; DOES SPRITE FADE VALUE = FULLY FADED IN
	CMP #FULLY_FADED_IN                                              ;
	BCS @spr_fade_in_exit                                            ; YES->EXIT
	INC SPR_FADE                                                     ; SPRITE FADE VALUE++
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; SAVE PALETTE BUFFER TO BUFFER ()
	RETURN_1_FRAME
	
_END_WHILE                                           				 ; JUMP->  WAIT FOR SPRITE PALLETTE TO FADE IN LOOP

@spr_fade_in_exit:                                                   ; EXIT
	RTS                                                              ; RETURN

FADE_OUT_BG_SPR_PAL:                                                 ; FADE OUT BACKGROUND AND SPRITE PALLETES()
	LDA BG_FADE                                                      ; ARE BACKGROUND AND SPRITE FADE VALUE = FULLY FADED OUT
	ORA SPR_FADE                                                     ;
	BEQ @fade_out_bg_spr_exit                                        ; YES->EXIT
	TAX                                                              ; DOES BACKGROUND FADE VALUE = FULLY FADED OUT
	BEQ @check_spr_pal_faded_out                                     ; YES-> CHECK FOR SPRITE PALLET FADED OUT
	DEC BG_FADE                                                      ; BACKGROUND FADE VALUE�

@check_spr_pal_faded_out:                                            ; CHECK FOR SPRITE PALLET FADED OUT
	LDA SPR_FADE                                                     ; DOES SPRITE FADE VALUE = FULLY FADED OUT
	BEQ @fade_out_transfer_palbuf_ppubuf                             ; YES-> BRANCH TO SAVE PALLETTES TO PALLETE BUFFER AND WAIT ONE FRAME
	DEC SPR_FADE                                                     ; SPRITE FADE VALUE�

@fade_out_transfer_palbuf_ppubuf:                                    ; SAVE PALLETTES TO PALLETE BUFFER AND WAIT ONE FRAME
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; SAVE PALETTE BUFFER TO BUFFER ()
	RETURN_1_FRAME
	JMP FADE_OUT_BG_SPR_PAL                                          ; LOOP BACK TO FADE OUT BACKGROUND AND SPRITE PALLETES()

@fade_out_bg_spr_exit:                                               ; FADE OUT EXIT
	RTS                                                              ; RETURN

FADE_OUT_BG_PAL:                                                     ; FADE_OUT BACKGROUND PALLETE()
	LDA BG_FADE                                                      ; DOES BACKGROUND FADE VALUE = FULLY FADED OUT
	BEQ @exit                                                        ; YES->EXIT

@continue_to_fade_out_bg	
	DEC BG_FADE                                                      ; BACKGROUND FADE VALUE--
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; SAVE PALETTE BUFFER TO BUFFER ()
	RETURN_1_FRAME
	JMP FADE_OUT_BG_PAL                                              ; JUMP-> FADE_OUT BACKGROUND PALLETE()
@exit:                                                               ; EXIT
	RTS                                                              ; RETURN

FADE_OUT_SPR_PAL:                                                    ; FADE_OUT SPRITE PALLETE()
	LDA SPR_FADE                                                     ; DOES SPRITE FADE VALUE = FULLY FADED OUT
	BEQ @exit                                                        ;

@continue_to_fade_out_spr	
	DEC SPR_FADE                                                     ; SPRITE FADE VALUE--
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; SAVE PALETTE TO PALLETE BUFFER ()
	RETURN_1_FRAME
	JMP FADE_OUT_SPR_PAL                                             ; JUMP->FADE_OUT SPRITE PALLETE()
@exit:                                                               ; SPRITE PALLETE FADE OUT EXIT
	RTS                                                              ; RETURN

SET_BG_SPR_PAL_SET_FULLY_FADED_IN:                                   ; UPDATE PALLETES,SOFT PALLETE IDS AND SET PALLETE FADES TO FULLY FADED IN(A= BACKGROUND, X = SPRITE)
	STA BG_PAL_INDEX                                                 ; SAVE BG PALETTE ID
	STX SPR_PAL_INDEX                                                ; SAVE SPRITE PALETTE ID

TRANSFER_BG_SPR_PAL_SET_FULLY_FADED_IN:                              ; UPDATE PALLETES AND SET TO FULLY FADED IN($50= BACKGROUND, $51 = SPRITE)
	JSR GET_SAVE_BG_PAL_TO_BUFFER                                    ; SAVE BACKGROUND PALETTE IN BUFFER()
	JSR GET_SAVE_SPR_PAL_TO_BUFFER                                   ; SAVE SPRITE PALETTE IN BUFFER()

UPDATE_BG_SPR_PAL_SET_TO_FULLY_FADED_IN:                             ; SET PALLETE FADES TO FULLY FADED IN
	LDA #FULLY_FADED_IN                                              ; SET BACKGROUND AND SPRITE FADE VALUE = FULLY FADED IN
	STA BG_FADE                                                      ;
	STA SPR_FADE                                                     ;
	JMP SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; JUMP->SAVE PALETTE BUFFER TO BUFFER ()

UPDATE_BG_PAL_SET_TO_FULLY_FADED_IN:                                 ; UPDATE_BACKGROUND_PALETTE_AND SET TO FULLY FADE IN(A= BG PALLETE)
	STA BG_PAL_INDEX                                                 ; SAVE BG PALETTE ID
	JSR GET_SAVE_BG_PAL_TO_BUFFER                                    ; SAVE BACKGROUND PALETTE IN BUFFER()
	LDA #FULLY_FADED_IN                                              ; SET BACKGROUND FADE VALUE = FULLY FADED IN
	STA BG_FADE                                                      ;
	JMP SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; JUMP->SAVE PALETTE BUFFER TO BUFFER ()

UPDATE_SPR_PAL_SET_TO_FULLY_FADED_IN:                                ; UPDATE_SPRITE_PALETTE_AND SET TO FULLY FADE IN(A= BG PALLETE)
	STA SPR_PAL_INDEX                                                ; SAVE SPRITE PALETTE ID
	JSR GET_SAVE_SPR_PAL_TO_BUFFER                                   ; SAVE SPRITE PALETTE IN BUFFER()
	LDA #FULLY_FADED_IN                                              ; SET SPRITE FADE VALUE = FULLY FADED IN
	STA SPR_FADE                                                     ;





buffer_index 				= LOCAL_2
pallete_brightness_bitmask  = $0F
	
SAVE_PALLETE_BUFFER_TO_PPU_BUFFER:                                   ; SAVE PALETTE BUFFER TO BUFFER ()
	LDA #PALLETTE_BUFFER_LENGTH                                      ; SET BUFFER LENGTH = 32 BYTES = 8 X 4
	LDY #<PPU_PALLETE_START                                          ; SET ADDRESS = $3F00 = PPU PALLETE ADDRESS
	LDX #>PPU_PALLETE_START                                          ;
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	STX buffer_index                                                 ; SAVE LENGTH
	LDY #$00                                                         ; SET PALLETE BUFFER INDEX = FIRST PALETTE COLOR

@transfer_palletes_to_pal_buffer:                                    ; UPDATE PALLETE COLORS AND SAVE IN BUFFER LOOP
	LDA PALLETE_BUFFER_START,Y                                       ; DOES PALLETE BUFFER INDEX = SPRITE PALLETE INDEX
	AND #$30                                                         ;
	CPY #$10                                                         ;
	BCS @set_sprite_fade_index                                       ; YES->UPDATE SPRITE PALLETE VALUE
@set_bg_fade_index:                                                  ; UPDATE BG PALLETE VALUE
	CLC                                                              ; BACKGROUND PALLETE VALUE = BACKGROUND PALLETE VALUE + BACKGROUND FADE VALUE
	ADC BG_FADE                                                      ;
	JMP @transfer_pal_buf_to_ppu_buffer                              ; JUMP->  UPDATE PALLETE BUFFER

@set_sprite_fade_index:                                              ; UPDATE SPRITE PALLETE VALUE
	CLC                                                              ; SPRITE PALLETE VALUE = SPRITE PALLETE VALUE + SPRITE FADE VALUE
	ADC SPR_FADE                                                     ;

@transfer_pal_buf_to_ppu_buffer:                                     ; UPDATE PALLETE BUFFER
	TAX                                                              ; SAVE FADE AMOUNT INDEX
	LDA PALLETE_BUFFER_START,Y                                       ; PALLETE VALUE = PALLETE VALUE + FADE AMOUNT FROM FADE IN TABLE
	AND #pallete_brightness_bitmask                                   ;
	ORA PALLETE_FADE_TABLE,X                                         ;
	LDX buffer_index                                                 ; SAVE COLOR IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INC buffer_index                                                 ; BUFFER INDEX++
	INY                                                              ;
	CPY #PALLETTE_BUFFER_LENGTH                                      ; DONE?
	BCC @transfer_palletes_to_pal_buffer:                            ; NO-> UPDATE PALLETE COLORS AND SAVE IN BUFFER LOOP
	LDX buffer_index                                                 ; LOAD CURRENT BUFFER INDEX
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)


PAL_TYPE_BG    			= $00 
PAL_TYPE_SPR    		= $01 
pallete_addr    		= LOCAL_1
pallete_type    		= LOCAL_2
pallete_offset    		= LOCAL_2
previous_A000_bank   	= LOCAL_4

GET_SAVE_BG_PAL_TO_BUFFER:                                           ; SAVE BACKGROUND PALETTE IN BUFFER($50= PALLETE ID)
	LDA #PAL_TYPE_BG                                                 ; SET PALLETE TYPE = BACKGROUND PALETTE
	BEQ GET_PALLETE_ADDRESS                                          ; JUMP->GET PALETTE LOCATION

GET_SAVE_SPR_PAL_TO_BUFFER:                                          ; SAVE SPRITE  PALETTE IN BUFFER($51= PALLETE ID)
	LDA #PAL_TYPE_SPR                                                ; SET PALLETE TYPE = SPRITE PALETTE

GET_PALLETE_ADDRESS:                                                 ; GET PALETTE LOCATION
	STA pallete_type                                                 ; SAVE PALETTE TYPE
	LDA SOFT_A000_BANK                                               ; SAVE CURRENT $A000 BANK IN OLD $A000 BANK
	STA previous_A000_bank                                           ;
	LDX #PALLETE_DATA_BANK                                           ; LOAD BANK 14
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDA pallete_type                                                 ; SAVE PALETTE TYPE
	TAY                                                              ;
	ASL                                                              ; SHIFT PALLETE TYPE SINCE ADRESS IS TWO BYTES
	TAX                                                              ; SAVE PALLETTE ADDRESS INDEX
	LDA PAL_INDEX,Y                                                  ; CLACULATE PALLETE ID OFFSET= EACH PALLETE 16 BYTES LONG
	LDY #$00                                                         ; SET COLORS LOADED = 0
	STY pallete_offset                                               ;
	ASL                                                              ;
	ROL pallete_offset                                               ;
	ASL                                                              ;
	ROL pallete_offset                                               ;
	ASL                                                              ;
	ROL pallete_offset                                               ;
	ASL                                                              ;
	ROL pallete_offset                                               ;
	CLC                                                              ;
	ADC PALLETE_ADDRESS_START,X                                      ; = PALLETE ADDDRESS START + PALLETE ID OFFSET
	STA pallete_addr                                                 ;
	LDA pallete_addr+1                                               ;
	ADC PALLETE_ADDRESS_START+1,X                                    ;
	STA pallete_addr+1                                               ;
	TXA                                                              ; SET PALLETE BUFFER INDEX = 0 FOR BACKGROUND, 0X10 FOR SPRITE
	ASL                                                              ;
	ASL                                                              ;
	ASL                                                              ;
	TAX                                                              ;
@transfer_pal_to_pal_buffer_loop:                                    ; SAVE COLOR INTO PALLETE BUFFER()
	LDA (pallete_addr),Y                                             ; SAVE PALLETE VALUE INTO BUFFER
	STA PALLETE_BUFFER_START,X                                       ;
	INX                                                              ; PALLETE BUFFER INDEX++
	INY                                                              ; COLORS LOADED++
	CPY #SINGLE_PAL_BUFFER_LENGTH                                      ; HAVE ALL COLORS BEEN TRASNFERRED TO BUFFER?
	BNE @transfer_pal_to_pal_buffer_loop                             ; NO-> LOOP BACK TO SAVE COLOR INTO PALLETE BUFFER()
	LDX previous_A000_bank                                           ; LOAD PREVIOUS $A000 BANK
	JMP SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	RTS                                                              ; RETURN


	
	
PALLETE_ADDRESS_START:                                               ; BANK 14 PALLETE POINTER START

	.WORD BACKGROUND_PALLETE_TABLE                                   ; BACKGROUND PAL START ADDR
	.WORD SPRITE_PALLETE_TABLE                                       ; SPRITE PAL START ADDR

SET_BG_SPR_FULLY_FADED_IN:                                           ; SET PALLETES TO FULLY FADED IN()
	LDA #FULLY_FADED_IN                                              ; SET FADE AMOUNT = FULLY FADED IN
	JMP SET_BG_SPR_FADE_VALUE

SET_BG_SPR_FULLY_FADED_OUT:                                          ; SET PALLETES TO FULLY FADED OUT()
	LDA #FULLY_FADED_OUT                                             ; SET FADE AMOUNT = FULLY FADED OUT

SET_BG_SPR_FADE_VALUE:                                               ; SET PALLETES TO FADE VALUE (A= FADE VALUE)
	STA BG_FADE                                                      ; SAVE BG FADE VALUE
	STA SPR_FADE                                                     ; SAVE SPRITE FADE VALUE
	JSR SAVE_PALLETE_BUFFER_TO_PPU_BUFFER                            ; SAVE PALETTE BUFFER TO BUFFER ()
	RETURN_1_FRAME
	RTS                                                              ; RETURN
_F}_PALLETE_FUNCTIONS

_F{_GENERAL_PPU_BUFFER_FUNCTIONS

BUFFER_MAX_SIZE 	= $3F											 ; 63 


WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE:                                   ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	PHA                                                              ; SAVE BUFFER LENGTH
	BIT PPU_BUFFER_FLAG                                              ; DOES PPU BUFFER STATUS =  BUSY?
	BPL @check_buffer_has_enough_space                               ; NO-> BUFFER READY CHECK FOR SPACE

@wait_then_check_buffer_status:                                      ; WAIT FOR BUFFER TO BE READY
	RETURN_1_FRAME
	PLA                                                              ; RESTORE BUFFER LENGTH
	JMP WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; LOOP BACK TO WAIT FOR BUFFER READY AND SAVE BUFFER_INFO

@check_buffer_has_enough_space:                                      ; BUFFER READY CHECK FOR SPACE
	AND #BUFFER_MAX_SIZE                                             ; SET MAX LENGTH  = 63 BYTES
	CLC                                                              ; IS LENGTH + CURRENT LENGTH > 63 BYTES
	ADC BG_BUFFER_LENGTH                                             ;
	CMP #BUFFER_MAX_SIZE                                             ; IS BUFFER  = FULL?
	BCS @wait_then_check_buffer_status                               ; YES-> WAIT FOR BUFFER TO BE READY
	SEC                                                              ; SET NMI PPU BUFFER STATUS = BUSY
	ROR PPU_BUFFER_FLAG                                              ;
	TXA                                                              ; SAVE PPU ADDRESS IN BUFFER ADDR
	LDX BG_BUFFER_LENGTH                                             ;
	STA BG_BUFFER_ADDR+1,X                                           ;
	TYA                                                              ;
	STA BG_BUFFER_ADDR,X                                             ;
	PLA                                                              ; SAVE DATA LENGTH IN BUFFER LENGTH
	STA BG_BUFFER_SEGMENT_LENGTH,X                                   ;
	INX                                                              ; SET X TO BUFFER DATA LOCATION
	INX                                                              ;
	INX                                                              ;
	RTS                                                              ; RETURN


SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY:                               ; SET BUFFER LENGTH AND SET BUFFER STATUS TO READY(X= LENGTH)
	LDA #$00                                                         ; SET BUFFER END
	STA BG_BUFFER_SEGMENT_LENGTH,X                                   ;
	STX BG_BUFFER_LENGTH                                             ; SET BUFFER LENGTH = LENGTH
	LSR PPU_BUFFER_FLAG                                              ; SET NMI PPU BUFFER STATUS = READY
	RTS                                                              ; RETURN


	
WAIT_UNTIL_PPU_READY:                                                ; WAIT PPU FREE(X,Y= DATA LENGTH SAVE IN $65,66) SET PPU STATUS =BUSY
	LDA PPU_TRANSFER_STATUS                                          ; IS PPU BUSY?
	BPL @set_ppu_status_busy                                         ; NO-> SET BUFFER = BUSY
	RETURN_1_FRAME
	JMP WAIT_UNTIL_PPU_READY                                         ; JUMP-> CHECK FOR READY TO TRANSFER PPU(X,Y= DATA LENGTH) SAVE IN $65,66, SET PPU STATUS =BUSY

@set_ppu_status_busy:                                                ; SET BUFFER = BUSY
	ORA #PPU_BUSY_BITFLAG                                            ; SET PPU STATUS == BUSY + CURRENT TASK INDEX
	
@set_task_using_ppu
	ORA CURRENT_TASK                                                 ;
	STA PPU_TRANSFER_STATUS                                          ;
	
@save_temp_ppu_addr 
	STY PPU_ADDR_TEMP                                                ; 
	STX PPU_ADDR_TEMP+1                                              ;                            
	RTS                                                              ; RETURN

SET_PPU_READY_KEEP_TEXT_SIZE:                                        ; SET BUFFER STATUS = NOT BUSY, KEEP CURRENT TEXT OPTION(), RETURN
	LDA PPU_TRANSFER_STATUS                                          ;
	AND #$40                                                         ;
	STA PPU_TRANSFER_STATUS                                          ;
	RTS                                                              ; RETURN

	
temp_ppu_addr   = LOCAL_1
temp_data_addr  = LOCAL_3
MOVE_DOWN_ONE_ROW  = $A1

bytes_to_transfer = BUFFER_LOCAL1

TRANSFER_BUFFER_TO_SRAM:                                             ; SAVE PPU BUFFER DATA IN SRAM (3E,3F= PPU ADDR  40,41= DATA ADDR, X,Y= DATA LEN)
	JSR WAIT_UNTIL_PPU_READY                                         ; CHECK FOR READY TO TRANSFER PPU(X,Y= DATA LENGTH) SAVE IN $65,66, SET PPU STATUS =BUSY

@check_ppu_free_buffer_free:                                         ; CHECK FOR BUFFER READY
	BIT PPU_BUFFER_FLAG                                              ; DOES NMI PPU BUFFER STATUS = BUSY
	BMI @wait_for_ppu_free                                           ; YES->WAIT FOR ABLE TO USE BUFFER
	LDA BG_BUFFER_DIR_LOCK_STATUS                                    ; DOES BUFFER = EMPTY
	BEQ @transfer_ppu_to_buffer                                      ; YES->TRANSFER DATA TO BUFFER

@wait_for_ppu_free:                                                  ; WAIT FOR ABLE TO USE BUFFER
	RETURN_1_FRAME
	JMP @check_ppu_free_buffer_free                                  ; JUMP->CHECK FOR BUFFER READY

@transfer_ppu_to_buffer:                                             ; TRANSFER DATA TO BUFFER
	SEC                                                              ; SET NMI PPU BUFFER STATUS = BUSY
	ROR PPU_BUFFER_FLAG                                              ;
	LDA #$80                                                         ; SET BUFFER direction = ppu to buffer
	STA BG_BUFFER_DIR_LOCK_STATUS                                    ;
	LDX #$00                                                         ; SET BUFFER INDEX = START OF BUFFER
@transfer_segment_info:                                              ; TRANSFER PPU SEGMENTs TO BUFFER
	TXA                                                              ; = BUFFER INDEX + OFFSET TO DATA + DATA LENGTH
	CLC                                                              ;
	ADC #$03                                                         ;
	CLC                                                              ;
	ADC BUFFER_INDEX_TEMP                                          ;
	CMP #BUFFER_MAX_SIZE                                             ; IS BUFFER ADDR >= END OF BUFFER?
	BCS @buffer_full                                                 ; YES-> SET BUFFER FLAG TO READY, WAIT TO TRANSFER FROM BUFFER
	TAY                                                              ;
	LDA temp_ppu_addr                                                ; SET BUFFER PPU ADDRESS = PPU ADDRESS TO UPDATE
	STA BG_BUFFER_ADDR,X                                             ;
	LDA temp_ppu_addr+1                                              ;
	STA BG_BUFFER_ADDR+1,X                                           ;
	LDA BUFFER_INDEX_TEMP                                           ; SAVE BUFFER LENGTH
	STA BG_BUFFER_SEGMENT_LENGTH,X
																	; SET PPU ADDRESS TO UPDATE = PPU ADDRESS TO UPDATE + ONE ROW
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] temp_ppu_addr, LENGTH_OF_ONE_ROW   

	TYA                                                              ;
	TAX                                                              ;
	LDA #$00                                                         ; SET BUFFER VALUE = END OF BUFFER
	STA CURRENT_BG_BUFFER_LOC,Y                                      ;
	DEC SEGMENT_BYTES_LEFT                                            ;
	BNE @transfer_segment_info                                       ; DONE? NO->TRANSFER PPU DATA TO BUFFER
@buffer_full:                                                        ; SET BUFFER FLAG TO READY, WAIT TO TRANSFER FROM BUFFER
	LSR PPU_BUFFER_FLAG                                              ; SET NMI PPU BUFFER STATUS = READY
@wait_for_buffer_empty:                                              ; WAIT TO READ BUFFER LOOP
	RETURN_1_FRAME
	BIT BG_BUFFER_DIR_LOCK_STATUS                                    ; IS BUFFER READY TO BE READ?
	BVC @wait_for_buffer_empty                                       ; NO->WAIT TO READ BUFFER LOOP
	LDX #$00                                                         ; SET BUFFER INDEX= FIRST LOCATION
	LDY #$00                                                         ; SET DATA INDEX = = FIRST LOCATION
@set_segment_length_check_empty:                                     ; TRANSFER BUFFER LENGTH IF NOT EMPTY
	LDA CURRENT_BG_BUFFER_LOC,X                                      ; DOES BUFFER SEGMENT LENGTH= EMPTY
	BEQ @check_for_end_of_data                                       ; YES->CHECK FOR END OF BUFFER
	STA bytes_to_transfer                                            ; SAVE LENGTH
	STA (temp_data_addr),Y                                           ; SAVE BUFFER DATA IN SRAM BUFFER
	INY                                                              ; SRAM BUFFER INDEX ++
	INX                                                              ; BUFFER ADDR = BUFFER ADDRESS + 3 BYTES
	INX                                                              ; FOR LENGTH AND ADRESS
	INX                                                              ;
@transfer_buf_to_ram_loop:                                           ; SAVE BUFFER DATA IN SRAM BUFFER LOOP
	LDA CURRENT_BG_BUFFER_LOC,X                                      ; SRAM BUFFER VALUE= BUFFER VALUE
	STA (temp_data_addr),Y                                           ;
	INX                                                              ; BUFFER INDEX++
	INY                                                              ; SRAM BUFFER INDEX ++
	DEC bytes_to_transfer                                             ; NUMBER OF BYTES TO TRANSFER--
	BNE @transfer_buf_to_ram_loop                                    ; DONE? NO->SAVE BUFFER DATA IN SRAM BUFFER LOOP
	LDA #MOVE_DOWN_ONE_ROW                                           ; SAVE MOVE DOWN ONE ROW COMMAND
	STA (temp_data_addr),Y                                           ; SRAM BUFFER INDEX ++
	INY                                                              ;
	JMP @set_segment_length_check_empty                              ; TRANSFER BUFFER LENGTH IF NOT EMPTY
	
@check_for_end_of_data:                                              ; CHECK FOR END OF DATA
	TYA                                                              ;
	CLC                                                              ; DATA ADDR= DATA ADDR + NUMBER OF BYTES READ
	ADC temp_data_addr                                               ;
	STA temp_data_addr                                               ;
	LDA temp_data_addr+1                                             ;
	ADC #$00                                                         ;
	STA temp_data_addr+1                                             ;
	LDA SEGMENT_BYTES_LEFT                                            ; 
	BNE @transfer_ppu_to_buffer                                      ; NO-> TRANSFER PPU DATA TO BUFFER LOOP
	LDA #$FF                                                         ;
	LDY #$00                                                         ; SET SRAM BUFFER VALUE = END OF DATA
	STA (temp_data_addr),Y                                           ;
	STY BG_BUFFER_DIR_LOCK_STATUS                                    ; SAVE DATA LENGTH
	JMP SET_PPU_READY_KEEP_TEXT_SIZE                                 ; JUMP ->SET PPU STATUS TO NOT BUSY BUT KEEP TEXT OPTION()
	
_F}_GENERAL_PPU_BUFFER_FUNCTIONS

_F{_PLAYER_NUMBER_NAME_TEXT_FUNCTIONS								; DONE

ppu_addr_temp 			= LOCAL_3
name_length 			= LOCAL_5
roster_id 				= LOCAL_7
team 					= LOCAL_8
PLAYER_NUMBER_LENGTH 	= $02
																	 ; mostly used in individual player pages
DRAW_PLAYER_NUM_AND_NAME:                                            ; DRAW PLAYER NUMBER AND NAME(X,Y= PPU LOCATION,$44=PLAYER, $45=TEAM)
	STY ppu_addr_temp
	STX ppu_addr_temp +1
	LDA team                                                         ; LOAD TEAM
	LDX roster_id                                                    ; LOAD PLAYER
	JSR GET_PLAYER_NAME_LENGTH                                       ; GET PLAYER NAME LENGTH(A=TEAM, X=PLAYER) RET A= LENGTH
	STA name_length                                                  ; SAVE NAME LENGTH
	LDY ppu_addr_temp
	LDX ppu_addr_temp +1
	LDA #PLAYER_NUMBER_LENGTH                                        ; SET BUFFER LENGTH = 2
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	JSR ADD_PLAYER_NUMBER_TO_BUFFER                                  ; ADD PLAYER NUMBER TO BUFFER()
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] ppu_addr_temp, $03 
	JMP TRANSFER_TEXT_TO_BUFFER                                      ; JUMP->LOAD TEXT INTO BUFFER WITH CONTROL COMMANDS


name_addr			= LOCAL_1	
name_length 		= LOCAL_3
name_chars_left	    = LOCAL_3	
buffer_index		= LOCAL_4
previous_8000_bank	= LOCAL_6
roster_id 			= LOCAL_7
team_id 			= LOCAL_8
TOTAL_CHARACTERS		= $0A
OFFSET_TO_BUFFER_DATA	= $03  		
																	 ; USED IN NFL LEADERS
DRAW_LAST_NAME_10_CHAR:                                              ; DRAW PLAYER LAST NAME MAX LENGTH 10 CHAR(X,Y= PPU ADDR,$44=PLAYER, $45=TEAM)
	LDA #TOTAL_CHARACTERS                                            ; SET BUFFER LENGTH = 10
DRAW_LAST_NAME_CHAR:											     ; USED IN PLAY CALL SCREEN
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	STX buffer_index                                                 ; SAVE BUFFER DATA INDEX
	LDA team_id                                                      ; LOAD TEAM
	LDX roster_id                                                    ; LOAD PLAYER
	JSR GET_PLAYER_NAME_LENGTH                                       ; GET PLAYER NAME LENGTH(A=TEAM, X=PLAYER) RET A= LENGTH
	STA name_length                                                  ; SET LENGTH
	LDX buffer_index                                                 ; SET BUFFER DATA INDEX
	LDA CURRENT_BG_BUFFER_LOC-OFFSET_TO_BUFFER_DATA,X                ; LOAD CHARACTER LIMIT  **** COULD USE FIXED VALUE *** 
	LDY #$01                                                         ;
	JMP TRANSFER_NAME_TO_BUFFER_WITH_BLANK_TILES                     ; JUMP->TRANSFER LETTERS TO BUFFER WITH BANK TILES TO FILL IF NEEDED

TOTAL_CHARACTERS		= $0B 										     
MAX_LETTERS				= $08										 ; used in pro bowl, banner, defensive starter 

DRAW_NUMBER_LAST_NAME_11_CHAR:                                       ; TRANSFER NUMBERS AND NAMES TO BUFFER (X,Y= PPU ADDR, $44 = PLAYER, $45=TEAM)
	LDA #TOTAL_CHARACTERS                                            ; SET BUFFER LENGTH = 11
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	STX buffer_index                                                 ; SAVE BUFFER DATA INDEX
	LDA team_id                                                      ; LOAD TEAM
	LDX roster_id                                                    ; LOAD PLAYER
	JSR GET_PLAYER_NAME_LENGTH                                       ; GET PLAYER NAME LENGTH(A=TEAM, X=PLAYER) RET A= LENGTH
	STA name_length                                                  ; SET LENGTH
	LDX buffer_index                                                 ; SET BUFFER DATA INDEX
	JSR ADD_PLAYER_NUMBER_TO_BUFFER                                  ; ADD PLAYER NUMBER TO BUFFER()
	LDA #DASH_TILE_ID                                                        ; ADD DASH TO BUFFER 
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INX                                                              ; SET's y to 1 since y cleared in ADD_PLAYER_NUMBER_TO_BUFFER 
	INY                                                              ; BUFFER INDEX++
	LDA #MAX_LETTERS                                                 ; SET MAX NUMBER OF LETTERS = 8

buffer_chars_left	= LOCAL_4
	
TRANSFER_NAME_TO_BUFFER_WITH_BLANK_TILES                             ; TRANSFER LETTERS TO BUFFER WITH BLANK TILES TO FILL IF NEEDED
	STA buffer_index                                                  ;
_WHILE NOT_EQUAL
	LDA (name_addr),Y                                                ; IS DATA = LETTER TILE
	CMP #START_OF_LETTERS                                            ;
	BCC @go_to_next_char                                             ;
	CMP #END_OF_LETTERS	+1                                           ;
	BCS @go_to_next_char                                             ;
	STA CURRENT_BG_BUFFER_LOC,X                                      ; SAVE LETTER IN BUFFER
	INX                                                              ; BUFFER INDEX ++
	DEC buffer_chars_left                                            ; BUFFER SEGMENT LENGTH--
	BEQ @done_with_transfer                                          ; SEGMENT DONE? YES-> SET END OF BUFFER AND RETURN TO 8000 BANK
@go_to_next_char:                                                    ;
	INY                                                              ; DATA INDEX ++
	DEC name_chars_left                                              ; BYTES TO READ--
_END_WHILE

@add_blank_tile:	
	LDA #BLANK_TILE_ID                                                  ; SET TILE VALUE= BLANK TILE
_WHILE NOT_EQUAL
	
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INX                                                              ;
	DEC buffer_chars_left                                            ; BUFFER SEGMENT LENGTH--

_END_WHILE

@done_with_transfer:                                                 ; SET END OF BUFFER AND RETURN TO 8000 BANK
	JSR SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)
	LDX previous_8000_bank                                           ; LOAD PREVIOUS $8000 BANK
	JMP SWAP_8000_BANK                                               ; JUMP-> SWAP $8000 BANK(X= $8000 BANK TO SWAP)

ppu_addr_temp			= LOCAL_3
player_name_length 		= LOCAL_5	

DRAW_PLAYER_NAME_CENTERED:                                           ; DRAW PLAYER NAME CENTERED ***  draw large player name centered
	STY ppu_addr_temp
	STX ppu_addr_temp +1
	LDA team_id                                                      ; LOAD TEAM
	LDX roster_id                                                    ; LOAD PLAYER
	JSR GET_PLAYER_NAME_LENGTH                                       ; GET PLAYER NAME LENGTH(A=TEAM, X=PLAYER) RET A= LENGTH
	STA player_name_length                                           ;
	LDA #$0F                                                         ; PPU ADDRESS = PPU ADDRESS (15 � NAME LENGHTH)
	SEC                                                              ;
	SBC player_name_length                                           ;
	ADD_A_TO_16BIT_ADDR ppu_addr_temp								 ;
	JMP TRANSFER_TEXT_TO_BUFFER                                      ; JUMP->LOAD TEXT INTO BUFFER WITH CONTROL COMMANDS

DRAW_PLAYER_NAME:                                                    ; DRAW PLAYER NAME
	STY ppu_addr_temp
	STX ppu_addr_temp +1
	LDA team                                                         ; LOAD TEAM
	LDX roster_id                                                    ; LOAD PLAYER
	JSR GET_PLAYER_NAME_LENGTH                                       ; GET PLAYER NAME LENGTH(A=TEAM, X=PLAYER) RET A= LENGTH
	STA player_name_length 

buffer_addr = LOCAL_1
ppu_addr = LOCAL_3 
previous_8000_bank = LOCAL_6
	
TRANSFER_TEXT_TO_BUFFER:                                             ; LOAD TEXT INTO BUFFER WITH CONTROL COMMANDS
	JSR WAIT_UNTIL_NAME_BUFFER_READY                                 ; CHECK IF $37E TEXT BUFFER IS DONE()
	JSR TRANSFER_NAME_TO_BUFFER                                      ; SAVE NAME IN BUFFER AND NAME LENGTH IN 37F (3E,3F = NAME ADDR, $42= LENGTH OF NAME)
	LDY ppu_addr_temp
	LDX ppu_addr_temp +1
	BIT PPU_TRANSFER_STATUS                                          ; DOES PPU STATUS = LARGE TEXT ENABLED
	BVS @buffer_large_text                                           ; YES-> BUFFER LARGE TEXT FROM DATA ADDRESS $0380
	
@copy_buffer_length:	
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] NAME_BUFFER_LENGTH, buffer_addr 
	JSR TRANSFER_TO_PPU_WITH_COMMANDS_VIA_BUFFER                     ; TRANSFER DATA TO PPU VIA BUFFER WITH CONTROL COMMANDS()
	JMP @set_buffer_ready_return_prev_8000_bank                      ; JUMP->  SET BUFFER TO READY AND RETURN YO PREVIOUS $8000 BANK

@buffer_large_text:                                                  ; BUFFER LARGE TEXT FROM DATA ADDRESS $0380
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] NAME_BUFFER_START, buffer_addr 
	LDA NAME_BUFFER_LENGTH                                           ; LOAD TEXT BUFFER LENGTH
	JSR DRAW_LARGE_TEXT                                              ; BUFFER_LARGE_TEXT(X,Y= PPU ADDR, 3E,3F= DATA ADDR, A= LENGTH)
	
@set_buffer_ready_return_prev_8000_bank:                             ; SET BUFFER TO READY AND RETURN YO PREVIOUS $8000 BANK
	JSR SET_NAME_BUFFER_READY                                        ; SET BUFFER STATUS($37E) TO READY()
	LDX previous_8000_bank                                           ; LOAD PREVIOUS $8000 BANK
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)



	
	player_id = LOCAL_1
	team_id = LOCAL_2
	data_addr = LOCAL_1
	prev_8000_bank = LOCAL_6
	
GET_PLAYER_NAME_LENGTH:                                              ; GET PLAYER NAME LENGTH(A=TEAM, X=PLAYER) RET A= LENGTH
	STA team_id                                                      ; SAVE TEAM INDEX
	STX player_id                                                    ; SAVE PLAYER INDEX
	LDA SOFT_8000_BANK                                               ; SET PREV $8000 BANK = CURRENT $8000 BANK
	STA prev_8000_bank
	LDX #PLAYER_NAMES_BANK                                           ; LOAD BANK 1
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	LDX #PLAYER_NAMES_ATTRIBS_BANK                                   ; LOAD BANK 2
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(A= $A000 BANK TO SWAP)
	LDX player_id                                                    ; LOAD PLAYER ID
	LDA team_id                                                      ; LOAD TEAM
	ASL                                                              ; SHIFT SINCE EACH POINTER TWO BYTES
	TAY                                                              ;
	
	LDA STARTING_ADDR_FOR_TEAM_PLAYER_NAMES_PTR_TABLE,Y              ; SET TEAM NAME START ADDRESS
	STA data_addr                                                    ;
	LDA STARTING_ADDR_FOR_TEAM_PLAYER_NAMES_PTR_TABLE+1,Y            ;
	STA data_addr +1                                                 ;
	TXA                                                              ; LOAD PLAYER INDEX
	ASL                                                              ; SHIFT SINCE EACH POINTER TWO BYTES
	TAY                                                              ;
	LDA (data_addr),Y                                                ; LENGTH = CURRENT ADDRESS � NEXT ADDRESS -1
	TAX                                                              ;
	INY                                                              ;
	LDA (data_addr),Y                                                ;
	PHA                                                              ;
	INY                                                              ;
	LDA (data_addr),Y                                                ;
	STX data_addr                                                    ;
	SEC                                                              ;
	SBC data_addr                                                    ;
	TAY                                                              ;
	PLA                                                              ;
	STA data_addr+1                                                  ;
	DEY                                                              ;
	TYA                                                              ;
	RTS                                                              ; RETURN



player_addr = LOCAL_1 

ADD_PLAYER_NUMBER_TO_BUFFER:                                         ; ADD PLAYER NUMBER TO BUFFER()
	LDY #$00                                                         ; LOAD NUMBER
	LDA (player_addr),Y                                              ;
	LSR                                                              ; GET HIGH DIGIT
	LSR                                                              ;
	LSR                                                              ;
	LSR                                                              ;
	BEQ @save_first_digit_do_next                                    ;
	CLC                                                              ;
	ADC #OFFSET_TO_NUMBER_TILES                                      ; + OFFSET TO NUMBER TILES
@save_first_digit_do_next:
	STA CURRENT_BG_BUFFER_LOC,X                                      ; SAVE HIGH DIGIT IN BUFFER
	INX                                                              ; BUFFER INDEX ++
	LDA (player_addr),Y                                              ; SAVE NEXT VALUE IN BUFFER
	AND #$0F                                                         ; GET LOW DIGIT
	CLC                                                              ;
	ADC #OFFSET_TO_NUMBER_TILES                                      ; + OFFSET TO NUMBER TILES
	STA CURRENT_BG_BUFFER_LOC,X                                      ; SAVE LOW DIGIT IN BUFFER
	INX                                                              ; BUFFER INDEX ++
	RTS                                                              ; RETURN



player_addr   = LOCAL_1 
name_buffer_index = LOCAL_5

TRANSFER_NAME_TO_BUFFER:                                             ; SAVE NAME IN BUFFER AND NAME LENGTH IN 37F (3E,3F = NAME ADDR, $42= CHARACTERS TO READ )
	LDX #$00                                                         ; SET CURRENT BUFFER INDEX/LENGTH = 0
	LDY #$01                                                         ; SET TEXT VALUE INDEX=1
	STX NAME_BUFFER_LENGTH                                           ; SET BUFFER LENGTH =0

@transfer_name_to_buffer_loop:                                       ; READ AND STORE NAME LOOP
	LDA (player_addr),Y                                              ; DOES TEXT VALUE = SPACE?
	CMP #SPACE_TILE_ID                                               ;
	BEQ @save_name_tile_to_buffer_check_if_done                      ; YES->SAVE TILE AND GO TO NEXT TILE, OR SAVE BUFFER LENGTH AND SET TO END IF DONE
	CMP #PERIOD_TILE_ID                                              ; DOES TEXT VALUE = PERIOD?
	BEQ @set_end_of_first_name                                       ; YES-> SET TO END OF FIRST NAME
	CMP #START_OF_LOWER_CASE                                         ; DOES TEXT VALUE = LOWER CASE
	BCS @convert_to_capital                                          ; YES-> CONVERT TEXT VALUE TO CAPITAL IF LOWERCASE
	BIT NAME_BUFFER_SPACE_FLAG                                       ; DOES SPACE ADDED BETWEEN FIRST AND LAST NAMES = TRUE
	BMI @convert_to_capital                                          ; YES-> CONVERT TEXT VALUE TO CAPITAL IF LOWERCASE
	LDA #SPACE_TILE_ID                                               ; SAVE SPACE TILE VALUE IN BUFFER
	STA NAME_BUFFER_START,X                                          ;
	INX                                                              ; CURRENT BUFFER INDEX/LENGTH++
	LDA #$FF                                                         ; SET SPACE OR PERIOD ADDED BETWEEN FIRST AND LAST NAMES = TRUE
	STA NAME_BUFFER_SPACE_FLAG                                       ;
	
@convert_to_capital:                                                 ; CONVERT TEXT VALUE TO CAPITAL IF LOWERCASE
	LDA (player_addr),Y                                              ; CONVERT TEXT VALUE TO UPPER CASE
	AND #UPPER_CASE_BIT_MASK                                         ;
	JMP @save_name_tile_to_buffer_check_if_done                      ; JUMP->  SAVE TILE AND GO TO NEXT TILE, OR SAVE BUFFER LENGTH AND SET TO END IF DONE

@set_end_of_first_name:                                              ; SET TO END OF FIRST NAME
	LDA #$FF                                                         ; SET SPACE OR PERIOD ADDED BETWEEN FIRST AND LAST NAMES = TRUE
	STA NAME_BUFFER_SPACE_FLAG                                       ;
	LDA (player_addr),Y                                              ; LOAD TEXT VALUE

@save_name_tile_to_buffer_check_if_done:                             ; SAVE TILE AND GO TO NEXT TILE, OR SAVE BUFFER LENGTH AND SET TO END IF DONE
	STA NAME_BUFFER_START,X                                          ; SAVE TEXT TILE IN BUFFER
	INY                                                              ; TEXT VALUE INDEX++
	INX                                                              ; TEXT BUFFER INDEX++
	DEC name_buffer_index                                            ; LETTERS LEFT TO READ --
	BNE @transfer_name_to_buffer_loop                                ; FULL NAME READ? NO-> BRANCH TO READ AND STORE NAME LOOP
	LDA #$FF                                                         ; SET BUFFER VALUE = END OF BUFFER
	STA NAME_BUFFER_START,X                                          ;
	STX NAME_BUFFER_LENGTH                                           ; SET BUFFER LENGTH = CURRENT LENGTH
	RTS                                                              ; RETURN
	

	

player_num_name_addr   = LOCAL_1
player_name_length    = LOCAL_5
previous_8000_bank    = LOCAL_6
player_number    = LOCAL_8 

GET_PLAYER_NUMBER_SAVE_NAME_TO_BUFFER:                               ; GET PLAYER NAME AND SAVE IN BUFFER WHEN BUFFER READY()
	JSR GET_PLAYER_NAME_LENGTH                                       ; GET PLAYER NAME LENGTH(A=TEAM, X=PLAYER) RET A= LENGTH
	STA player_name_length                                           ; SAVE NAME LENGTH
	LDY #PLAYER_NUMBER_OFFSET                                        ; SAVE PLAYER NUMBER
	LDA (player_num_name_addr),Y                                      ;
	STA player_number                                                ;
	JSR WAIT_UNTIL_NAME_BUFFER_READY                                 ; WAIT UNTIL $37E TEXT BUFFER IS READY()
	JSR TRANSFER_NAME_TO_BUFFER:                                     ; SAVE PLAYER NAME IN BUFFER()
	LDX previous_8000_bank                                           ; LOAD PREVIOUS $8000 BANK
	JMP SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)


GET_PLAYER_NUMBER:                                                   ; GET PLAYER NUMBER (A=TEAM, X=PLAYER) RET A= NUMBER
	JSR GET_PLAYER_NAME_LENGTH                                       ; GET PLAYER NAME LENGTH(A=TEAM, X=PLAYER) RET A= LENGTH, PLAYER ADDR SET
	LDY #PLAYER_NUMBER_OFFSET                                        ; SAVE NEXT PLAYER NUMBER
	LDA (player_num_name_addr),Y                                     ;
	TAY                                                              ;
	LDX previous_8000_bank                                           ; LOAD PREVIOUS $8000 BANK
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	TYA                                                              ; RESTORE NEXT PLAYER NUMBER
	RTS                                                              ; RETURN

	
WAIT_UNTIL_NAME_BUFFER_READY:                                        ; WAIT UNTIL BUFFER STATUS($37E) =READY AND THEN SET TO BUSY
	LDA NAME_BUFFER_STATUS                                           ; IS BUFFER STATUS = READY
	BPL @set_task_busy_and_task_using                                ; YES->SET BUFFER STATUS = BUSY
	LDA #$01                                                         ; LOAD 1 FRAME
	JSR DELAY_TASK                                                   ; SWITCH TASK (A = #FRAMES UNTIL RETURNING)
	JMP WAIT_UNTIL_NAME_BUFFER_READY                                 ; JUMP-> WAIT UNTIL BUFFER STATUS($37E) =READY THEN SET TO BUSY
@set_task_busy_and_task_using:                                       ; SET BUFFER STATUS = BUSY+ CURRENT TASK INDEX
	ORA #$80                                                         ; SET BUFFER STATUS = BUSY
	ORA CURRENT_TASK                                                 ; + CURRENT TASK INDEX
	STA NAME_BUFFER_STATUS                                           ;
	RTS                                                              ; RETURN

 
SET_NAME_BUFFER_READY:                                               ; SET BUFFER STATUS($37E) TO READY()
	LDA #$00                                                         ;
	STA NAME_BUFFER_STATUS                                           ;
	RTS                                                              ; RETURN

_F}_PLAYER_NUMBER_NAME_TEXT_FUNCTIONS
	
_F{_SET_MIRRORING_FUNCTIONS											; DONE
	
SET_MMC3_VERT_MIRROR:                                                ; SET GAME STATUS AND MMC3 MIRRORING TO VERTICAL
	MMC3_SET_VERT_MIRRORING
	LDA GAME_STATUS                                                  ; SET GAME STATUS = VERTICAL MIRRORING
	AND #%10111111                                                   ;
	STA GAME_STATUS                                                  ;
	RTS                                                              ; RETURN


SET_MMC3_HORIZ_MIRROR:                                               ; SET GAME STATUS AND MMC3 MIRRORING TO HORIZONTAL
	MMC3_SET_HORIZ_MIRRORING
	LDA GAME_STATUS                                                  ; SET GAME STATUS = HORIZONTAL MIRRORING
	ORA #%01000000                                                   ;
	STA GAME_STATUS                                                  ;
	RTS                                                              ; RETURN


_F}_SET_MIRRORING_FUNCTIONS 

_F{_SET_ALL_SPR_OFFSCREEN											; DONE
	
SET_ALL_SPR_OFFSCREEN:                                               ; SET ALL SPRITE Y POSITIONS TO OFFSCREEN ()
	LDX #$00                                                         ; SET SPRITE INDEX = FIRST SPRITE
	LDA #SPRITE_OFFSCREEN                                            ; SET Y POS = OFFSCREEN
@set_spr_offscreen_loop:                                             ; SET TO Y VALUE = OFFSCREEN
	STA CUR_SPRITE_Y,X                                               ; SAVE SPRITE Y LOCATION
	SET_X_INDEX_NEXT_SPRITE                                          ;
	BNE @set_spr_offscreen_loop                                      ;  DONE?? NO->SET SPY Y VALUE = OFFSCREEN
	RTS                                                              ; RETURN;

_F}_SET_ALL_SPR_OFFSCREEN 

_F{_SAVE_TEXT_TO_BG_BUFFER											; DONE

ppu_data_addr  = LOCAL_1 
data_length  = LOCAL_3
	
SAVE_TEXT_TO_BUFFER_CHECK_FOR_SPACE:                                 ; SAVE NAME TO BUFFER WITH SPACES EQUAL BLANK TILE()
	STA data_length                                                  ; SAVE LENGTH
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDA data_length                                                  ; LOAD LENGTH
	AND #MAX_BUFFER_LENGTH                                           ; SET MAX LENGTH = 64 BYTES
	STA data_length                                                  ;
	LDY #$00                                                         ;
@check_for_text_equal_space:                                         ; TRANSFER DATA TO BUFFER LOOP
	LDA (ppu_data_addr),Y                                            ; DOES TILE VALUE = SPACE
	CMP #ASCII_SPACE                                                 ;
	BNE @transfer_data_to_ppu_buff                                   ;
	LDA #BLANK_TILE_ID                                                  ; SET TILE VALUE = BLANK TILE
@transfer_data_to_ppu_buff:                                          ;
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INY                                                              ;
	INX                                                              ;
	DEC data_length                                                  ; BYTES TO TRANSFER--
	BNE @check_for_text_equal_space                                  ; DONE? NO-> TRANSFER DATA TO BUFFER LOOP
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)

_F}_SAVE_TEXT_TO_BG_BUFFER 
	
_F{_NUMBER_TO_TILE_FUNCTIONS 										; DONE
	
number    = LOCAL_8
buffer_digits  = $02
	
CONVERT_2_DIG_NUM_TILES:                                             ; CONVERT 2 DIGIT NUMBER TO TILES AND SAVE IN BUFFER(A=NUMBER)
	STA number                                                       ; SAVE NUMBER TO CONVERT TO TILES IN $45
	LDA #buffer_digits                                               ; SET BUFFER LENGTH TO 2
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	CLC                                                              ;
	LDA number                                                       ; LOAD NUMBER TO CONVERT
	JSR CONVERT_UPPER_DIGIT_TO_TILE                                  ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	LDA number                                                       ; LOAD NUMBER TO CONVERT
	JSR CONVERT_LOWER_DIGIT_TO_TILE                                  ; CONVERT LOW DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; JUMP->SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)

CONVERT_2_DIG_NUM_TILES_NO_LEADING_ZEROS:                            ; SAVE 2 DIGIT NUMBER TO BUFFER
	STA number                                                       ; SAVE NUMBER TO CONVERT IN $45
	LDA #buffer_digits                                               ; SET BUFFER LENGTH = 2
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	LDA number                                                       ; IS NUMBER TO CONVERT = SINGLE DIGIT?
	AND #$F0                                                         ;
	BEQ @convert_and_buffer_single_digit                             ; YES->CONVERT AND BUFFER SINGLE DIGIT
	JSR CONVERT_UPPER_DIGIT_TO_TILE                                  ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	LDA number                                                       ; LOAD NUMBER TO CONVERT
	JSR CONVERT_LOWER_DIGIT_TO_TILE                                  ; CONVERT LOW DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; JUMP->SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)

@convert_and_buffer_single_digit:                                    ; CONVERT AND BUFFER SINGLE DIGIT
	LDA number                                                       ; LOAD NUMBER TO CONVERT
	JSR CONVERT_LOWER_DIGIT_TO_TILE                                  ; CONVERT LOW DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	LDA #$00                                                         ; SAVE BLANK TILE IN BUFFER
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INX                                                              ; BUFFER INDEX++
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY(X= BUFFER INDEX)



number_lower_8bits  = LOCAL_7
number_upper_8bits  = LOCAL_8 
buffer_digits   = $04 

CONVERT_4_DIGIT_NUMBER_TO_TILES                                      ; SAVE 4 DIGIT NUMBER TO BUFFER
	LDA #buffer_digits                                               ; SET BUFFER LENGTH = 4
	JSR WAIT_FOR_BUFFER_FREE_ENOUGH_SPACE                            ; WAIT FOR BUFFER READY AND SAVE BUFFER_INFO (X,Y= PPU ADDRESS TO UPDATE, A= LENGTH)
	CLC                                                              ;
	LDA number_upper_8bits                                           ;
	JSR CONVERT_UPPER_DIGIT_TO_TILE                                  ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	LDA number_upper_8bits                                           ;
	JSR CONVERT_LOWER_DIGIT_TO_TILE_OMIT_LEAD_ZERO                   ; CONVERT MID DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	LDA number_lower_8bits                                           ;
	JSR CONVERT_UPPER_DIGIT_TO_TILE                                  ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	LDA number_lower_8bits                                           ;
	JSR CONVERT_LOWER_DIGIT_TO_TILE                                  ; CONVERT LOW/DECIMAL DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	JMP SET_END_BUF_SEGMENT_BUF_LEN_BUF_READY                        ; SET CURRENT BUFFER LOCATION AS END AND SET BUFFER TO READY()

																	; omits leading zero
CONVERT_UPPER_DIGIT_TO_TILE:                                         ; CONVERT HIGH DIGIT TO TILE AND SAVE IN BUFFER(A= NUM)
	PHP                                                              ; SAVE FLAGS STATUS
	LSR                                                              ; SHIFT HIGH NIBBLE
	LSR                                                              ;
	LSR                                                              ;
	LSR                                                              ;
	PLP                                                              ; RESTORE FLAGS STATUS

CONVERT_LOWER_DIGIT_TO_TILE_OMIT_LEAD_ZERO:                          ; CONVERT MID DIGIT TO TILE AND SAVE IN BUFFER
	AND #$0F                                                         ; MASK OUT UPPER NIBBLE
	BEQ @omit_leading_zero                                           ;
	SEC                                                              ;
@omit_leading_zero:                                                  ; CONVERSION NEEDED?
	BCC SAVE_NUMBER_TILE_TO_BUFFER                                   ; NO-> SAVE TILE IN BUFFER

CONVERT_LOWER_DIGIT_TO_TILE:                                         ; CONVERT LO DIGIT TO TILE AND SAVE IN BUFFER
	AND #$0F                                                         ; = DIGIT + OFFSET TO NUMBER TILES
	ORA #OFFSET_TO_NUMBER_TILES                                      ;

SAVE_NUMBER_TILE_TO_BUFFER:                                          ; SAVE TILE IN BUFFER (A=TILE, X= BUFFER START OFFSET)
	STA CURRENT_BG_BUFFER_LOC,X                                      ;
	INX                                                              ; BUFFER INDEX ++
	RTS                                                              ; RETURN
	
_F}_NUMBER_TO_TILE_FUNCTIONS

_F{_CLEAR_RAM														; DONE

ram_addr = LOCAL_7      
										
CLEAR_RAM:                                                           ; CLEAR RAM LENGTH (X * 0x100 + A , $44,Y= DATA ADDR)
	STY ram_addr +1                                                  ; 
	INX                                                              ;
	LDY #$00                                                         ; SET OFFSET TO ZERO
@clear_ram_loop:                                                     ;
	PHA                                                              ;
	LDA #$00                                                         ;
	STA (ram_addr),Y                                                 ;
	INC ram_addr                                                     ;
	BNE @check_if_done                                               ;
	INC ram_addr +1                                                  ;
@check_if_done                                                       ;
	PLA                                                              ;
	SEC                                                              ;
	SBC #$01                                                         ;
	BNE @clear_ram_loop                                              ;
	DEX                                                              ;
	BNE @clear_ram_loop                                              ;
	RTS                                                              ; CLEAR RAM RETURN

_F}_CLEAR_RAM
	
_F{_UPDATE_SCROLL_LOCATION_FIELD									; DONE

RIGHT_SCROLL_MAX_AMOUNT				= $04							 ; 1/2 YARD			
LEFT_SCROLL_MAX_AMOUNT				= $FC							 ; -1/2 YARD

UPDATE_SCROLL_LOCATION_DIRECTION:                                    ; UPDATE SCROLL LOCATION AND DIRECTION(X,Y= BALL OR PLAYER HIGH,MID LOCATION)
	TYA                                                              ; =BALL LOCATION X � SCROLL LOCATION X
	SEC                                                              ;
	SBC CURR_X_SCROLL                                                ;
	TAY                                                              ;
	TXA                                                              ;
	SBC CURR_X_SCROLL+1                                              ;
	BMI @set_left_scroll_amount                                      ;
	BNE @set_right_scroll_amount									 ;
	TYA                                                              ; = LOCATION MID � SCROLL LEFT THRESHOLD
	SEC                                                              ;
	SBC LEFT_SCROLL_LIM_FIELD                                        ;
	BCC @scroll_left_check                                           ; PAST THRESHOLD -> SCROLL LEFT CHECK
	TYA                                                              ; = LOCATION MID � SCROLL RIGHT THRESHOLD
	SEC                                                              ;
	SBC RIGHT_SCROLL_LIM_FIELD                                       ;
	BCC @no_scroll_exit                                              ; LOCATION BETWEEN SCROLL THRESHOLD-> BRANCH TO NO SCROLL UPDATE NEEDED
	CMP #RIGHT_SCROLL_MAX_AMOUNT                                     ; SET LOCATION = SCROLL RIGHT THRESHOLD � 0.5 YARD
	BCC @do_right_scroll                                             ; BRANCH TO SCROLLING RIGHT UPDATE
	
@set_right_scroll_amount:                                            ;
	LDA #RIGHT_SCROLL_MAX_AMOUNT                                     ; SET SCROLL AMOUNT = 0.5 YARDS

@do_right_scroll:                                                    ; SCROLLING RIGHT UPDATE
	TAX                                                              ; IS SCROLL LOCATION > END OF FIELD MAP RIGHT SIDE
	LDA CURR_X_SCROLL                                                ;
	CMP #<RIGHT_MOST_SCROLL_FIELD_MAP                                ;
	LDA CURR_X_SCROLL + 1                                            ;
	SBC #>RIGHT_MOST_SCROLL_FIELD_MAP                                ;
	BCS @no_scroll_exit                                              ; YES-> NO SCROLL UPDATE NEEDED
	TXA                                                              ;
	STA X_SCROLL_AMOUNT                                              ; SET SCROLL DIRECTION/AMOUNT = SCROLLING RIGHT
	CLC                                                              ;
	ADC CURR_X_SCROLL                                                ; SCROLL LOCATION X = SCROLL LOCATION X + 0 TO 0.5 YARDS
	STA CURR_X_SCROLL                                                ;
	LDA CURR_X_SCROLL +1                                             ;
	ADC #$00                                                         ;
	STA CURR_X_SCROLL + 1                                            ;
	RTS                                                              ; RETURN
	
@scroll_left_check:                                                  ; SCROLL LEFT CHECK
	CMP #LEFT_SCROLL_MAX_AMOUNT                                     ; IS LOCATION WITHIN 0.5 YARDS OF SCROLL LEFT THRESHOLD?
	BCS @do_left_scroll                                              ;
	
@set_left_scroll_amount:                                             ; SET SCROLL LEFT AMOUNT
	LDA #LEFT_SCROLL_MAX_AMOUNT                                      ; SET LOCATION = SCROLL LEFT THRESHOLD � 0.5 YARDS
	
@do_left_scroll:                                                     ; CHECK IF AT END OF LEFT FIELD MAP
	TAX                                                              ;
	LDA CURR_X_SCROLL                                                ;
	CMP #<LEFT_MOST_SCROLL_FIELD_MAP                                 ;
	LDA CURR_X_SCROLL + 1                                            ;
	SBC #>LEFT_MOST_SCROLL_FIELD_MAP                                 ; IS SCROLL LOCATION < END OF FIELD MAP LEFT SIDE
	BCC @no_scroll_exit                                              ; YES-> BRANCH TO NO SCROLL UPDATE NEEDED
	TXA                                                              ;
	STA X_SCROLL_AMOUNT                                              ; SET SCROLL DIRECTION/AMOUNT = SCROLLING LEFT
	CLC                                                              ;
	ADC CURR_X_SCROLL                                                ;
	STA CURR_X_SCROLL                                                ;
	LDA CURR_X_SCROLL + 1                                            ;
	SBC #$00                                                         ;
	STA CURR_X_SCROLL + 1                                            ;
	
@no_scroll_exit:                                                     ; NO SCROLL UPDATE NEEDED
	RTS                                                              ; RETURN
	
_F}_UPDATE_SCROLL_LOCATION_FIELD

_F{_TINY_WAIT_LOOP_RESET											; DONE

WAIT_NUM_FRAMES_RESET:                                               ; WAIT NUMBER OF FRAMES (X= NUM FRAMES)
	LDA FRAME_COUNTER                                                ; LOAD FRAME COUNTER
@loop:                                                               ;
	CMP FRAME_COUNTER                                                ;
	BEQ @loop                                                        ;
	DEX                                                              ; NUM FRAMES--
	BNE WAIT_NUM_FRAMES_RESET                                        ; DONE? NO->LOOP
	RTS                                                              ; RETURN

_F}_TINY_WAIT_LOOP_RESET	
	
_F{_MENU_FUNCTIONS													 ; DONE

ARROW_MOVE_MENU_FRAME_DELAY				= $14						 ; 1/3 of  second 
HELD_BUTTON_KEEP_MOVING_DELAY			= $08
	
SET_MENU_ARROW_OPTIONS:                                              ; INITIALIZE Y MENU OPTIONS(X,Y= ADDRESS, A= PLAYER JOY)
	STY MENU_OPTIONS_ADDR                                            ; SAVE MENU OPTIONS ADDRESS
	STX MENU_OPTIONS_ADDR+1                                          ;
	STA MENU_JOYPAD_P1_OR_P2                                         ; SAVE JOYPAD P1 OR P2 INDEX
UPDATE_MENU_ARROW_INFO_LOADED:                                       ; INITIALIZE Y MENU OPTIONS(E4,E3= ADDRESS, E5= PLAYER JOY)
	LDY #$02                                                         ; SET SPRITE INDEX = X LOC
@update_menu_arrow_tile_loop:                                        ; UPDATE ARROW SPRITE X LOC, ATTRIB, AND TILE LOOP
	LDA (MENU_OPTIONS_ADDR),Y                                        ;
	STA ( (MENU_ARROW_SPR_X - 2) ),Y                                 ;
	DEY                                                              ; DONE UPDATEING ARROW SPRITE
	BPL @update_menu_arrow_tile_loop                                 ; NO-> LOOP BACK TO UPDATE ARROW SPRITE X LOCATION, ATTRIBUTES, AND TILE LOOP
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val] MENU_OPTIONS_ADDR, $03   ;
	LDY MENU_Y                                                       ; LOAD MENU Y INDEX
	INY                                                              ; SET MENU ARROW SPRITE Y LOCATION  FROM MENU DATA Y LOCATIONS
	LDA (MENU_OPTIONS_ADDR),Y                                        ;
	STA MENU_ARROW_SPR_Y                                             ;
	LDA #$00                                                         ; SET FRAMES UNTIL ARROW MOVES = ZERO
	STA MENU_INPUT_DELAY                                             ;
	RTS                                                              ; RETURN

CHECK_MENU_ARROW_UP_DOWN:                                            ; CHECK FOR MENU CURSOR MOVED UP OR DOWN() RET= CARRY SET= MOVED
	LDY MENU_JOYPAD_P1_OR_P2                                         ; LOAD JOYPAD P1 OR P2 INDEX
	LDA CURR_JOY_RAW,Y                                               ; READ P1,P2 JOYPAD DATA
	AND #(UP_DPAD + DOWN_DPAD)                                       ; HAS UP OR DOWN BEEN HELD?
	BEQ @zero_frame_menu_delay_nothing_pressed                       ; NO-> UP OR DOWN NOT PRESSED SET FRAMES UNTIL ARROW MOVES = NONE
	LDY MENU_INPUT_DELAY                                             ; DOES FRAMES UNTIL ARROW MOVES =0
	BNE @decrease_menu_input_delay                                   ; NO-> DECREASE FRAMES UNTIL ARROW CAN MOVE
	LDY #ARROW_MOVE_MENU_FRAME_DELAY                                 ; SET FRAMES UNTIL ARROW MOVES = 20 FRAMES
	STY MENU_INPUT_DELAY                                             ;
	JMP @up_or_down_menu_check                                       ; JUMP-> WHICH WAS PRESSED UP OR DOWN

@decrease_menu_input_delay:                                          ; DECREASE FRAMES UNTIL ARROW CAN MOVE
	DEC MENU_INPUT_DELAY                                             ; FRAMES UNTIL ARROW MOVES--
	BNE @no_menu_delay_change_exit                                   ; FRAMES UNTIL ARROW MOVES !=0-> BRNACH TO NO CHANGE TO MENU EXIT
	LDY #HELD_BUTTON_KEEP_MOVING_DELAY                                ; SET FRAMES UNTIL ARROW MOVES = 8 FRAMES
	STY MENU_INPUT_DELAY                                             ;
	
	
@up_or_down_menu_check:                                              ; WHICH WAS PRESSED UP OR DOWN
	AND #UP_DPAD                                                     ; WAS UP PRESSED?
	BEQ @down_pressed_menu                                           ; NO-> DOWN PRESSED
	
																	; OPTIMIZE UP AND DOWN CAN USE SAME EXIT                
@up_pressed_menu:                                                    ; UP PRESSED
	DEC MENU_Y                                                       ; MENU Y INDEX--
	BPL @up_exit                                                     ; DOES MENU Y INDEX = NEGATIVE? NO->BRANCH TO INDICATE MENU OPTION CHANGED  UP RETURN
	LDY #$00                                                         ; SET MENU Y INDEX = LAST MENU OPTION
	LDA (MENU_OPTIONS_ADDR),Y                                        ;
	SEC                                                              ;
	SBC #$01                                                         ;
	STA MENU_Y                                                       ;
@up_exit:                                                            ; INDICATE MENU OPTION CHANGED UP RETURN
	SEC
	RTS                                                              ; RETURN

@down_pressed_menu:                                                  ; DOWN PRESSED
	INC MENU_Y                                                       ; MENU Y INDEX++
	LDA MENU_Y                                                       ; IS MENU Y INDEX < NUMBER OF MENU OPTIONS
	LDY #$00                                                         ;
	CMP (MENU_OPTIONS_ADDR),Y                                        ;
	BCC @down_exit                                                   ; NO-> BRANCH TO INDICATE MENU OPTION CHANGED DOWN RETURN
	LDA #$00                                                         ; SET MENU Y INDEX = FIRST MENU OPTION
	STA MENU_Y                                                       ;
@down_exit:                                                          ; INDICATE MENU OPTION CHANGED DOWN RETURN
	SEC
	RTS                                                              ; RETURN

@zero_frame_menu_delay_nothing_pressed:                              ; UP OR DOWN NOT PRESSED SET FRAMES UNTIL ARROW MOVES = NONE
	LDA #$00                                                         ;
	STA MENU_INPUT_DELAY                                             ;
@no_menu_delay_change_exit:                                          ; NO CHANGE TO MENU EXIT
	CLC                                                              ;
	RTS                                                              ; RETURN

UPDATE_MENU_ARROW_SPR_Y:                                             ; UPDATE MENU ARROW SPRITE Y LOCATION()
	LDY MENU_Y                                                       ; LOAD Y MENU INDEX
	INY                                                              ;
	LDA (MENU_OPTIONS_ADDR),Y                                        ; SET MENU ARROW SPRITE Y = CURRENT MENU DATA Y LOCATION
	STA MENU_ARROW_SPR_Y                                             ;
	RTS                                                              ; RETURN

INIT_MENU_OPTIONS:                                                   ; INITIALIZE MENU X,Y OPTIONS (X,Y= ADDRESS, A= PLAYER JOY)
	STY MENU_OPTIONS_ADDR                                            ; SAVE MENU Y,X MAP DATA ADDRESS
	STX MENU_OPTIONS_ADDR+1                                          ;
	STA MENU_JOYPAD_P1_OR_P2                                         ; SAVE PLAYER JOY
	LDY #$00                                                         ;
	LDA (MENU_OPTIONS_ADDR),Y                                        ;
	STA MENU_ARROW_SPR_TILE                                          ; SAVE TILE
	INY                                                              ;
	LDA (MENU_OPTIONS_ADDR),Y                                        ; SAVE ARROW TILE ATTRIBUTES
	STA MENU_ARROW_SPR_ATTR                                          ;
	LDA #$00                                                         ; SET FRAMES TO WAIT TO MOVE ARROW = NONE
	STA MENU_INPUT_DELAY                                             ;
	JMP SET_MENU_ARROW_X_Y                                           ; JUMP->SET MENU ARROW X AND Y LOCATION()

																	; OPTIMIZE NO DIRECTION CAN USE @zero_frame_menu_delay_nothing_pressed    
CHECK_INPUT_MENU:                                                    ; CHECK FOR MOVE ARROW ON MENU X OR Y()
	LDX MENU_JOYPAD_P1_OR_P2                                         ; LOAD PLAYER JOY RAW
	LDA CURR_JOY_RAW,X                                               ;
	AND #$0F                                                         ; CHECK FOR DIRECTION
	BEQ @zero_frame_menu_delay_nothing_pressed:                      ;
	
	LDA MENU_INPUT_DELAY                                             ; IS FRAMES TO WAIT TO MOVE ARROW > 0
	BNE @wait_update_menu_index                                      ; YES-> WAIT TO MOVE ARROW LOOP
	
	LDA #ARROW_MOVE_MENU_FRAME_DELAY                                 ; SET FRAMES TO WAIT TO MOVE ARROW = 1/3 SEC = 20 FRAMES
	STA MENU_INPUT_DELAY                                             ;
	JMP @update_menu_index                                           ; JUMP->MOVE MENU ARROW
	
@wait_update_menu_index:                                             ; WAIT TO MOVE ARROW LOOP
	DEC MENU_INPUT_DELAY                                             ; FRAMES TO WAIT TO MOVE ARROW--
	BNE @no_menu_delay_change_exit                                   ; FRAMES = 0? NO->EXIT
	
	LDA #HELD_BUTTON_KEEP_MOVING_DELAY                               ; SET FRAMES TO WAIT TO MOVE ARROW = 8
	STA MENU_INPUT_DELAY                                             ;
	
@update_menu_index:                                                  ; MOVE MENU ARROW
	LDX MENU_JOYPAD_P1_OR_P2                                         ; LOAD PLAYER JOY RAW
	LDA CURR_JOY_RAW,X                                               ;
	LDX #$01                                                         ; SET MENU INDEX =  MENU X INDEX
	LDY #$03                                                         ;
	LSR                                                              ;
	BCS @update_menu_index_down_right                                ;
	LSR                                                              ;
	BCS @update_menu_index_up_left                                   ;
	DEX                                                              ; SET MENU INDEX =  MENU Y INDEX
	DEY                                                              ;
	LSR                                                              ;
	BCS @update_menu_index_down_right                                ;
	
@update_menu_index_up_left                                           ; MOVE ARROW UP OR LEFT
	DEC MENU_INDEX,X                                                 ; X OR Y MENU INDEX--
	BPL @set_menu_arrow                                              ; IF NOT PAST FIRST OPTON->SET MENU ARROW LOCATION
	LDA (MENU_OPTIONS_ADDR),Y                                        ; ELSE SET X OR Y MENU INDEX == LAST MENU INDEX
	SEC                                                              ;
	SBC #$01                                                         ;
	STA MENU_INDEX,X                                                 ;
	JMP @set_menu_arrow                                              ; JUMP->SET MENU ARROW LOCATION


@update_menu_index_down_right:                                       ; UPDATE MENU INDEX RIGHT OR DOWN PRESSED
	INC MENU_INDEX,X                                                 ; X OR Y MENU INDEX++
	LDA MENU_INDEX,X                                                 ; IF NOT PAST LAST OPTION->SET MENU ARROW LOCATION
	CMP (MENU_OPTIONS_ADDR),Y                                        ;
	BCC @set_menu_arrow                                              ;
	LDA #$00                                                         ; ELSE SET X OR Y MENU INDEX = FIRST MENU INDEX
	STA MENU_INDEX,X                                                 ;

@set_menu_arrow:                                                     ; SET MENU ARROW LOCATION
	JSR GET_MENU_INDEX_X_Y                                           ; SET INDEX INTO MENU ARROW Y,X MAP()
	ASL                                                              ;
	CLC                                                              ;
	ADC #$04                                                         ; SHIFT SINCE TABLE ENTRIES ARE TWO BYTES
	TAY                                                              ;
	LDA (MENU_OPTIONS_ADDR),Y                                        ; LOAD MENU ARROW LOCATION
	CMP #$FF                                                         ; IS LOCATION = SKIP/INVALID?
	BEQ @update_menu_index                                           ; YES->MOVE MENU ARROW
	SEC                                                              ; SET CARRY TO INDICATE MENU ARROW=  MOVED
	RTS                                                              ; RETURN
	
@zero_frame_menu_delay_nothing_pressed:                              ;
	LDA #$00                                                         ; SET FRAMES TO WAIT TO MOVE ARROW = 0
	STA MENU_INPUT_DELAY                                             ;
@no_menu_delay_change_exit:                                          ; EXIT
	CLC                                                              ; CLEAR CARRY TO INDICATE MENU ARROW = NOT MOVED
	RTS                                                              ; RETURN

SET_MENU_ARROW_X_Y:                                                  ; SET MENU ARROW X AND Y LOCATION()
	JSR GET_MENU_INDEX_X_Y                                           ;
	ASL                                                              ; SHIFT SINCE TABLE ENTRIES ARE TWO BYTES
	CLC                                                              ;
	ADC #$04                                                         ; + OFFSET PAST MENU SETTINGS
	TAY                                                              ;
	LDA (MENU_OPTIONS_ADDR),Y                                        ;
	STA MENU_ARROW_SPR_Y                                             ; SAVE MENU ARROW Y POSITION
	INY                                                              ;
	LDA (MENU_OPTIONS_ADDR),Y                                        ; SAVE MENU ARROW X POSITION
	STA MENU_ARROW_SPR_X                                             ;
	RTS                                                              ; RETURN

GET_MENU_INDEX_X_Y:                                                  ; GET ARROW INDEX 
	LDY #$03                                                         ; LOAD OFFSET TO # OF CHOICES PER ROW
	LDA #$00                                                         ; 
	LDX MENU_Y                                                       ;
	BEQ @add_x_index                                                 ;
@add_y_index:                                                        ; 
	CLC                                                              ; ARROW INDEX= = Y INDEX TIMES CHOICES PER ROW
	ADC (MENU_OPTIONS_ADDR),Y                                        ;
	DEX                                                              ;
	BNE @add_y_index                                                 ;
@add_x_index:                                                        ; + X INDEX
	CLC                                                              ;
	ADC MENU_X                                                       ; ADD TO XMENU OPTION
	RTS                                                              ; RETURN
	
_F}_MENU_FUNCTIONS

_F{_MATH_ROUTINES

NUMBER_OF_BITS_8_BIT		= $08
NUMBER_OF_BITS_16_BIT 		= $10
NUMBER_OF_BITS_24_BIT 		= $18


a_register			= LOCAL_8

result   			= LOCAL_7

MULTIPLY_A_TIMES_X:                                                  ; 8 BIT MULTIPLY (A times X)  RESULT IN $44,45
	STA a_register
	LDA #$00
	STA result
	LDY #NUMBER_OF_BITS_8_BIT                                                    ; SET BITS =8
@Loop1:
	ASL result
	ROL a_register
	BCC @decrease_bits_left
	TXA
	CLC
	ADC result
	STA result
	LDA result+1
	ADC #$00
	STA result+1
@decrease_bits_left:
	DEY
	BNE @Loop1
	RTS                                                              ; RETURN
	

y_register   		= LOCAL_7	
x_register			= LOCAL_8


result				= LOCAL_6	

MULTIPLY_A_TIMES_X_Y:                                                ; MULTIPLY (A times X,Y)  RESULT IN in $43 $44 $45
	STY y_register
	STX x_register
	LDX #$00
	STX result
	TAX
	LDY #NUMBER_OF_BITS_16_BIT                                                    ; SET BITS =16
@Loop1:
	ASL result
	ROL result + 1
	ROL result + 2
	BCC @decrease_bits_left
	TXA
	CLC
	ADC result
	STA result
	LDA result + 1
	ADC #$00
	STA result + 1
	LDA result + 2
	ADC #$00
	STA result + 2
@decrease_bits_left:
	DEY
	BNE @Loop1
	RTS                                                              ; RETURN

MULTIPLY_16_BIT_RESULT_32_BIT:                                       ; MULTIPLY ($42,$43 times $44,$45) RESULT IN $42,$43,$44,$45

number_of_bits		= $10

first_operand		= LOCAL_5
second_operand		= LOCAL_7
result				= LOCAL_5 

	LDA first_operand
	LDX first_operand + 1
	LDY #$00
	STY result
	STY result + 1
	LDY #NUMBER_OF_BITS_16_BIT                                              ; SET BITS =16

_WHILE NOT_EQUAL													 ; loop while bits reamain
	ASL result
	ROL result + 1
	ROL second_operand
	ROL second_operand + 1
	BCC @go_to_next_bit
	PHA
	CLC
	ADC result
	STA result
	TXA
	ADC result + 1
	STA result + 1
	LDA #$00
	ADC result + 2
	STA result + 2
	LDA #$00
	ADC result + 3
	STA result + 3
	PLA

@go_to_next_bit:
	DEY

_END_WHILE 

	RTS                                                              ; RETURN

DIVIDE_8_BIT:                                                        ; 8 BIT DIVIDE ($45/$44) QUOTIENT $45 REMAINDER $42


remainder			= LOCAL_5
divisor				= LOCAL_7

numerator			= LOCAL_8
result				= LOCAL_8

	LDA #$00
	STA remainder
	LDX #NUMBER_OF_BITS_8_BIT                                              ; SET BITS= 8

_WHILE NOT_EQUAL
	ASL numerator
	ROL remainder
	LDA remainder
	SEC
	SBC divisor
	BCC @go_to_next_bit
	STA remainder
	INC result

@go_to_next_bit:
	DEX

_END_WHILE

	RTS                                                              ; RETURN


DIVIDE_16_BIT_16_BIT_RESULT:                                         ; 16 BIT DIVIDE ($45,44/ $43,42) RESULT $45,44

remainder					= LOCAL_3
divisor						= LOCAL_5
numerator					= LOCAL_7
result						= LOCAL_7	


@set_remainder_to_zero:	
	LDA #$00														 ; Set remainder to zero
	STA remainder													 ;
	STA remainder+1													 ;

@set_bits:	
	LDX #NUMBER_OF_BITS_16_BIT                                                    ; SET BITS= 16

@shift_numerator_into_remainder:	
	ASL numerator													; numerator squared 
	ROL numerator+1

_WHILE NOT_EQUAL													; subtract loop 
	
	ROL remainder													;
	ROL remainder+1													; remainder squared
	LDA remainder													; Subtract Test
	SEC																;
	SBC divisor														; 
	TAY																;
	LDA remainder+1													;	
	SBC divisor+1
	BCC @shift_next

@save_new_remainder
	STA remainder+1
	STY remainder

@shift_next:
	ROL result
	ROL result+1
	DEX

_END_WHILE

	RTS                                                              ; RETURN


DIVIDE_16_BIT_FRACTIONAL:                                            ;  ( $44,$45) DIVIDE BY BYTE($40,$41) with REM (43,44,45)

remainder					= LOCAL_1
divisor						= LOCAL_3
numerator					= LOCAL_7
result						= LOCAL_6	

	LDA #$00
	STA $43
DIVIDE_32_BIT_BY_16_BIT:                                             ; USED FOR 3 DECIMAL PT PRECISION WIN%, QB RATING 
	LDA #$00
	STA remainder
	STA remainder+1
	LDX #NUMBER_OF_BITS_24_BIT                                       ; SET NUMBER OF BITS=24
	ASL $43
	ROL $44
	ROL $45
	
_WHILE NOT_EQUAL

	ROL remainder
	ROL remainder+1
	LDA remainder
	SEC
	SBC divisor	
	TAY
	LDA remainder+1
	SBC divisor+1
	BCC @else_shift_next:

@save_new_remainder:	
	STA remainder+1
	STY remainder

@else_shift_next:
	ROL result
	ROL result + 1
	ROL result + 2
	DEX
	
_END_WHILE

	RTS                                                              ; RETURN

	

	
HEX_TO_3_DIGIT_DEC:                                                  ; CONVERT 16-BIT HEX NUMBER TO BCD($44,$45= HEX NUM, $40,41, $42 = RESULT)

BASE_TO_CONVERT_TO_10			= $0A
NUMBER_OF_DEC_DIGITS			= $03	

number_of_digits_left			=  LOCAL_1
temp_result						=  LOCAL_2
divide_remainder				=  LOCAL_3

divisor						=  LOCAL_5
divisor_high_byte				=  LOCAL_6
result							=  LOCAL_3
	
	LDA #BASE_TO_CONVERT_TO_10                                          ; SET TO BASE 10
	STA divisor
	LDA #$00
	STA divisor+1
	LDA #NUMBER_OF_DEC_DIGITS											; N
	STA number_of_digits_left
	
_WHILE NOT_EQUAL

	JSR DIVIDE_16_BIT_16_BIT_RESULT
	LDA divide_remainder
	STA temp_result
	JSR DIVIDE_16_BIT_16_BIT_RESULT
	LDA divide_remainder
	ASL
	ASL
	ASL
	ASL
	ORA temp_result
	PHA
	DEC number_of_digits_left

_END_WHILE
	
@get_result	
	PLA
	STA result+2
	PLA
	STA result+1
	PLA
	STA result
	RTS                                                              ; RETURN

HEX_TO_2_DIGIT_DEC:                                                  ; CONVERT HEX NUMBER TO BCD(A= HEX)


number_to_convert	= LOCAL_8
divisor			= LOCAL_7
divide_remainder	= LOCAL_5
temp_result			= LOCAL_6
result				= LOCAL_7

	STA number_to_convert											 ; 						example 175
	LDA #BASE_TO_CONVERT_TO_10                                       ; SETS TO BASE 10
	STA divisor
	
	JSR DIVIDE_8_BIT                                                 ; DIVIDE (45/44)		example 175/10 = 17 remainder 5
	LDA divide_remainder											 ; 						example save 5  
	STA temp_result															 ; 
	JSR DIVIDE_8_BIT                                                 ; DIVIDE (45/44) 		example 17/10 =  1 remainder 7 
	LDA divide_remainder                                             ; CONCATENATE BOTTOM DIGITS
	ASL																 ; save high digit 	
	ASL																
	ASL
	ASL
	ORA temp_result													 ; add low digit 
	STA temp_result												     ;
	JSR DIVIDE_8_BIT                                                 ; DIVIDE (44/45)       
	LDA divide_remainder                                             ; SAVE DECIMAL NUMBER
	STA result+1													 ;
	LDA temp_result		
	STA result
	RTS                                                              ; RETURN
_F}_MATH_ROUTINES 

_F{_BANK_SWAP_ROUTINES												; DONE

SWAP_8000_BANK:                                                      ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	STX SOFT_8000_BANK                                               ; SET SOFT $8000 BANK = BANK TO SWAP TO
	LDA #SET_BANK_TO_8000_MMC3                                       ; SET BANK TO SWAP = $8000
	BNE SWAP_MMC3_BANK                                               ; BRANCH TO SWAP BANK (A= BANK TO SWAP 06=$8000, 07=$A000)

SWAP_A000_BANK:                                                      ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	STX SOFT_A000_BANK                                               ; SET SOFT $A000 BANK = BANK TO SWAP TO
	LDA #SET_BANK_TO_A000_MMC3                                       ; SET BANK TO SWAP = $A000

SWAP_MMC3_BANK:                                                      ; SWAP BANK (A= BANK TO SWAP 06=$8000, 07=$A000)
	ORA SOFT_MODE_8000                                              ; SET BANK SWAP MODE
	STA SOFT_BANK_SELECT                                             ;
	SEC                                                              ; SET BANK SWAP STATUS = BUSY
	ROR BANK_FLAG                                                    ;
	STA BANK_SELECT_MMC3                                             ; SAVE IN BANK SELECT
	STX BANK_DATA_MMC3                                               ; SAVE IN BANK DATA
	LSR BANK_FLAG                                                    ; SET BANK SWAP STATUS = READY
	RTS                                                              ; RETURN
	
_F}_BANK_SWAP_ROUTINES

_F{_RANDOMIZE_AND_UPDATE_ROUTINES									; DONE

HEAVIER_RANDOMIZE:                                                   ; UPDATE RANDOM NUMBER VALUES AND MAKE VALUE RETURNED MORE RANDOM
	JSR UPDATE_ALL_RANDOMS                                           ; UPDATE RANDOM NUMBERS()
	LDA RANDOM_1                                                     ; RANDOMIZE WHICH RANDOM TO CHOOSE
	AND #$03                                                         ;
	BEQ @load_rand_1_plus_2_plus_3                                   ;
	CMP #$01                                                         ;
	BEQ @load_rand_2_plus_3                                          ;
	CMP #$02                                                         ;
	BEQ @load_rand_2                                                 ;
	
@load_rand_3:                                                        ; LOAD RANDOM ($3D)
	LDA RANDOM_3                                                     ;
	RTS                                                              ; RETURN
	
@load_rand_2:                                                        ; LOAD RANDOM ($3C)
	LDA RANDOM_2
	RTS                                                              ; RETURN
	
@load_rand_2_plus_3:                                                 ; ADD TWO RANDOMS ($3C,$3D) RET= SINGLE BYTE
	LDA RANDOM_3
	CLC
	ADC RANDOM_2
	RTS                                                              ; RETURN
	
@load_rand_1_plus_2_plus_3:                                          ; ADD THREE RANDOMS ($3B,$3C,$3D) RET=SINGLE BYTE
	LDA RANDOM_3
	CLC
	ADC RANDOM_2
	ADC RANDOM_1
	RTS                                                              ; RETURN

arrow_skill_input 	= LOCAL_7
temp_result			= LOCAL_8 
final_result 		= LOCAL_5
	
RANDOMIZE_ARROW_LOCATION:                                            ; RANDOM / A USED FOR RANDOMIZING FG ARROW START LOCATION
	STA arrow_skill_input                                            ;
	JSR HEAVIER_RANDOMIZE                                            ; UPDATE RANDOM NUMBER VALUES AND MAKE VALUE RETURNED MORE RANDOM()
	STA temp_result	                                                 ;
	JSR DIVIDE_8_BIT                                                 ; DIVIDE ($45/$44) QUOTIENT $45 REMAINDER $42
	LDA final_result                                                 ;
	RTS                                                              ; RETURN


UPDATE_RANDOM_1:                                                     ; UPDATE RANDOM NUM $3B()
	LDA RANDOM_1
	CLC
	ADC #PRIME_NUMBER_FOR_RANDOM_1
	STA RANDOM_1
	RTS                                                              ; RETURN

UPDATE_RANDOM_2:                                                     ; UPDATE RANDOM NUM $3C()
	LDA RANDOM_2
	CLC
	ADC #PRIME_NUMBER_FOR_RANDOM_2
	STA RANDOM_2
	RTS                                                              ; RETURN

UPDATE_RANDOM_3:                                                     ; UPDATE RANDOM NUM $3D()
	LDA RANDOM_3
	CLC
	ADC #PRIME_NUMBER_FOR_RANDOM_3
	STA RANDOM_3
	RTS                                                              ; RETURN
	
_F}_RANDOMIZE_AND_UPDATE_ROUTINES

_F{_PALLETE_FADE_TABLE_AND_LARGE_TEXT_TABLE							; DONE

PALLETE_FADE_TABLE:                                                  ; PALETTE_FADE_TABLE
	.DB $0F, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.DB $0F, $00, $00, $00, $00, $00, $00, $00, $10, $10, $10, $10, $10, $10, $10, $10
	.DB $0F, $00, $00, $00, $00, $00, $10, $10, $10, $10, $10, $10, $20, $20, $20, $20
	.DB $0F, $00, $00, $00, $10, $10, $10, $10, $20, $20, $20, $20, $30, $30, $30, $30

																	; UPPER HALF OF LARGE_TEXT_TILE_POINTERS
LARGE_TEXT_TILE_TABLE:
	.INCSRC large_text_tile_data.asm
	
_F}_PALLETE_FADE_TABLE_AND_LARGE_TEXT_TABLE	

_F{_UPDATE_PLAYER_LOCATION_MAN_INDICATORS							; DONE



SWAP_AND_INIT_PLAYER_RAM_COLLISION_UPDATE:                           ; UPDATE PLAYER ICONS, PLAYER RAM, START BALL MOVEMENT AND PLAYER COLLISION TASKS AND RETURN TO BANK 21
	SET_STACK[loc] PLAYER_ACTIONS_STACK_INDEX                       ; SET STACK POINTER TO $39
	LDX #INITIALIZE_PLAYERS_BANK                                     ; LOAD BANK 27
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)
	JSR BANK_JUMP_INIT_PLAYER_RAM_SCRIPT_COLL_ADDR                   ; INITIALIZE PLAYER ICONS, PLAYER RAM, START BALL MOVEMENT, PLAYER COLLISION THREADS *** can use act addr
	LDX #PLAYER_SCRIPT_COMMANDS_LOGIC_BANK_1                         ; LOAD BANK 21
	JSR SWAP_8000_BANK                                               ; SWAP $8000 BANK(X= $8000 BANK TO SWAP)


UPDATE_PLAYERS_MAIN_LOOP:                                            ; PLAYER AND SIDELINE GRAPHICS UPDATE LOOP
	LDA #$01                                                         ; LOAD 1 FRAME
	JSR DELAY_TASK                                                   ; SWITCH TASK (#FRAMES BEFORE RETURNING)
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] PLAYER_RAM_START, CURRENT_PLAYER_ADDR
	LDA #TOTAL_NUM_PLAYERS_ON_FIELD                                  ; SET NUMBER OF PLAYERS TO UPDATE == 22
	STA PLAYERS_LEFT_TO_UPDATE                                       ;
	
CHECK_FOR_COMMAND_UPDATE:                                            ; COMMAND COUNTER UPDATE AND CHECK
	LOAD_CUR_PLAYER_SPRITE_INDEX                                     ;
	STA PLAYER_SPR_INDEX_TEMP                                        ;
	INY                                                              ;
	LDA (CURRENT_PLAYER_ADDR),Y                                      ; LOAD PLAYER RAM0D IN $B9
	STA EXTRA_SPR_INDEX_TEMP                                         ;
	LOAD_CUR_PLAYER_COMMAND_COUNTER
	BEQ COLLISION_COUNTER_CHECK                                      ; IS COMMAND COUNTER ==WAIT? YES->COLLISION COUNTER UPDATE AND CHECK
	SEC                                                              ; COMMAND COUNTER--
	SBC #$01                                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                      ;
	BNE COLLISION_COUNTER_CHECK                                      ; IS COMMAND COUNTER >1? YES-> COLLISION COUNTER UPDATE AND CHECK
	STY COMMAND_OR_COLL_INDEX                                        ; SAVE COMMAND COUNTER INDEX IN $B1
	SAVE_CUR_PLAYER_COMMAND_ADDR_TO_STACK                            ; RETURN TO PLAYER COMMAND ADDR 
	RTS                                                              ; 


COLLISION_COUNTER_CHECK:                                             ; COLLISION COUNTER UPDATE AND CHECK
	LOAD_CUR_PLAYER_COLLISION_COUNTER
	BEQ UPDATE_PLAYER_LOCATION_START                                 ; IS COLLISION COUNTER == 0? YES-> UPDATE PLAYER LOCATION START
	SEC                                                              ; COLLISION COUNTER --
	SBC #$01                                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                      ;
	BNE UPDATE_PLAYER_LOCATION_START                                 ; IS COLLISION COUNTER >0? YES-> UPDATE PLAYER LOCATION START
	STY COMMAND_OR_COLL_INDEX                                        ; SAVE COLLISION LOGIC INDEX in $B1
	SAVE_CUR_PLAYER_COLLISION_ADDR_TO_STACK                          ; RETURN TO PLAYER COLLISION ADDRESS 
	RTS                                                              ; 

WAIT_UPDATE_PLAYER_NUM_FRAMES:                                       ; UPDATE COLLISION OR COMMAND COUNTER WITH # FRAMES AND SAVE CURRENT ADDRESS (A=# OF FRAMES)
	LDY COMMAND_OR_COLL_INDEX                                        ; LOAD INDEX TO PLAYER COUNTER (EITHER COMMAND OR COLLISION)
	STA (CURRENT_PLAYER_ADDR),Y                                      ; SAVE NUMBER OF FRAMES
	INY                                                              ; SAVE COMMAND OR COLLISION ADDRESS
	SAVE_CURR_PLAYER_COMM_OR_COLL_ADDR
	CPY #( COLLISION_COUNTER-1)                                      ; IS NEXT INDEX = COOLLISION INDEX?
	BEQ COLLISION_COUNTER_CHECK                                      ; YES-> COLLISION COUNTER UPDATE AND CHECK


UPDATE_PLAYER_LOCATION_START:                                        ; UPDATE PLAYER LOCATION START

temp_Y_loc = LOCAL_8
	
@update_player_y_location 
	LDY #( Y_POS+1 )                                                 ; SAVE Y LOCATION HIGH IN $45
	LDA (CURRENT_PLAYER_ADDR),Y                                      ;
	STA temp_Y_loc                                           		 ;			
	LDY #Y_VELOCITY                                                  ; Y LOCATION LOW = Y VELOCITY LOW + Y LOCATION LOW
	LDA (CURRENT_PLAYER_ADDR),Y                                      ;
	LDY #Y_POS                                                       ;
	CLC                                                              ;
	ADC (CURRENT_PLAYER_ADDR),Y                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                      ;
	LDY #Y_VELOCITY+1                                                ; LOAD Y VELOCITY HIGH
	LDA (CURRENT_PLAYER_ADDR),Y                                      ;
	BMI @player_moving_up                                            ; NEGATIVE? YES-> PLAYER MOVING UP

																	; PLAYER MOVING DOWN
	ADC temp_Y_loc                                         			; = Y VELOCITY HIGH + Y LOCATION HIGH
	CMP #BOTTOM_OF_FIELD_Y                                           ; IS NEW Y LOCATION PAST BOTTOM OF FIELD
	BCS @update_x_location                                           ; YES-> UPDATE X LOCATION
	JMP @save_y_location                                             ; NO-> SAVE Y LOCATION

@player_moving_up:                                                   ; PLAYER MOVING UP
	ADC temp_Y_loc                                           		 ; = Y VELOCITY HIGH + Y LOCATION HIGH
	CMP #TOP_OF_FIELD_Y                                              ;  IS NEW Y LOCATION PAST TOP OF FIELD
	BCC @update_x_location                                           ;  YES-> UPDATE X LOCATION

@save_y_location:                                                    ; SAVE Y LOCATION
	LDY #( Y_POS+1 )                                                 ; SAVE Y LOCATION HIGH
	STA (CURRENT_PLAYER_ADDR),Y                                                      ;
	STA temp_Y_loc                                                    ; SAVE Y LOCATION HIGH IN $45

@update_x_location:                                                  ; UPDATE X LOCATION
	LDY #X_VELOCITY                                                  ; X LOCATION LOW = X VELOCITY LOW + X LOCATION LOW
	LDA (CURRENT_PLAYER_ADDR),Y                                      ;
	LDY #X_POS                                                       ;
	CLC                                                              ;
	ADC (CURRENT_PLAYER_ADDR),Y                                      ;
	STA (CURRENT_PLAYER_ADDR),Y                                      ;
	LDY #X_VELOCITY+1                                                ; LOAD X VELOCITY HIGH
	LDA (CURRENT_PLAYER_ADDR),Y                                      ;
	BMI @moving_left_check_back_endzone                              ; NEGATIVE? YES->PLAYER MOVING LEFT

@moving_right_check_back_endzone                                     ; PLAYER MOVING RIGHT
	LDY #( X_POS + 1 )                                               ; = X VELOCITY HIGH  + X LOCATION MID, X LOCATION HIGH
	ADC (CURRENT_PLAYER_ADDR),Y                                      ;
	TAX                                                              ;
	LDA #$00                                                         ;
	INY                                                              ;
	ADC (CURRENT_PLAYER_ADDR),Y                                      ;
	CMP #>(BACK_RIGHT_ENDZONE - ONE_YARD)                            ; IS NEW X LOCATION < 1 yd from back of endzone? 
	BNE @save_x_location                                             ; NO-> SAVE X LOCATION
	CPX #<(BACK_RIGHT_ENDZONE - ONE_YARD)                            ;
	BCC @save_x_location                                             ; 
	JMP @set_player_collided_back_endzone                            ; YES-> SET PLAYER COLLIDED BACK OF ENDZONE COLLISION

@moving_left_check_back_endzone:                                     ; PLAYER MOVING LEFT
	LDY #( X_POS + 1 )                                               ; = X VELOCITY HIGH  + X LOCATION MID, X LOCATION HIGH
	ADC (CURRENT_PLAYER_ADDR),Y                                      ;
	TAX                                                              ;
	LDA #$FF                                                         ;
	INY                                                              ;
	ADC (CURRENT_PLAYER_ADDR),Y                                      ;
	CMP #>(BACK_LEFT_ENDZONE + ONE_YARD)                             ; IS NEW X LOCATION < 1 yd from back of endzone?  
	BNE @save_x_location:                                            ; NO-> SAVE X LOCATION
	CPX #<(BACK_LEFT_ENDZONE + ONE_YARD)                             ;
	BCS @save_x_location:                                            ; NO-> SAVE X LOCATION

@set_player_collided_back_endzone:                                   ; SET PLAYER COLLIDED BACK OF ENDZONE COLLISION
	LDY #COLLISION_STATUS                                            ; SET PLAYER COLLISION TO PLAYER COLLIDED WITH ENDZONE
	LDA (CURRENT_PLAYER_ADDR),Y                                      ;
	ORA #$01                                                         ;
	STA (CURRENT_PLAYER_ADDR),Y                                      ;
	LDY #X_POS+1                                                     ; LOAD X LOCATION MID
	LDA (CURRENT_PLAYER_ADDR),Y                                      ;
	JMP @check_non_man_controlled_on_screen                          ; JUMP->  CHECK FOR NON MAN CONTROLLED SPRITES ON SCREEN

@save_x_location:                                                    ; SAVE X LOCATION
	STA (CURRENT_PLAYER_ADDR),Y                                      ; SAVE X LOCATION HIGH
	DEY                                                              ;
	TXA                                                              ; SAVE X LOCATION MID
	STA (CURRENT_PLAYER_ADDR),Y

@check_non_man_controlled_on_screen:                                 ; CHECK IF NON-MAN CONTROLLED SPRITES ARE ON SCREEN
	SEC                                                              ; X= PLAYER X � SCROLL X
	SBC CURR_X_SCROLL                                                ;
	TAX                                                              ;
	INY                                                              ;
	LDA (CURRENT_PLAYER_ADDR),Y                                      ;
	SBC CURR_X_SCROLL+1                                              ;
	BNE @non_man_controlled_player_offscreen_right_check             ; IS PLAYER OFFSCREEN? YES-> NON-MAN CONTROLLED PLAYER OFFSCREEN
	TXA                                                              ;
	LDX PLAYER_SPR_INDEX_TEMP                                        ; LOAD PLAYER SPRITE INDEX
	STA CUR_PLAYER_SPR_X_RIGHT,X                                     ; UPDATE X POSITION FOR RIGHT PART OF SPRITE
	SEC                                                              ;
	SBC #$08                                                         ;
	BCC @non_man_controlled_player_is_offscreen_left                 ;                                      
	STA CUR_PLAYER_SPR_X_LEFT,X                                      ; UPDATE X POSITION FOR LEFT PART OF SPRITE
	LDA temp_Y_loc                                                   ; LOAD NEW Y LOCATION
	STA CUR_PLAYER_SPR_Y_LEFT,X                                      ; UPDATE LEFT SPRITE Y POSITION
	STA CUR_PLAYER_SPR_Y_RIGHT,X                                     ; UPDATE RIGHT SPRITE Y POSITION
	JMP @check_for_extra_sprite                                      ;
	
@non_man_controlled_player_offscreen_right_check:                    ; NON-MAN CONTROLLED PLAYER OFFSCREEN
	TAY                                                              ; Y=  X POS HIGH - X SCROLL HIGH
	TXA                                                              ; X= X POS MID - X SCROLL MID - 0X08
	SEC                                                              ;
	SBC #$08                                                         ;
	TAX                                                              ;
	TYA                                                              ;
	SBC #$00                                                         ;
	BNE @non_man_controlled_player_is_offscreen_right                ; JUPM TO NON MAN CONTROLLED PLAYER OFFSCREEN RIGHT PART OF SCREEN
	TXA                                                              ;
	LDX PLAYER_SPR_INDEX_TEMP                                        ; LOAD PLAYER SPRITE INDEX
	STA CUR_PLAYER_SPR_X_LEFT,X                                      ;
	LDA temp_Y_loc                                                   ; SET TOP OF SPRITE Y POSITION =  NEW Y LOCATION
	STA CUR_PLAYER_SPR_Y_LEFT,X                                      ;
	LDA #SPRITE_OFFSCREEN                                            ; SET BOTTOM OF SPRITE Y POSITION = OFFSCREEN
	STA CUR_PLAYER_SPR_Y_RIGHT,X                                     ;
	JMP @check_for_extra_sprite                                      ;
	
@non_man_controlled_player_is_offscreen_left:                        ; NON MAN CONTROLLED PLAYER OFFSCREEN LEFT PART OF SCREEN
	LDA temp_Y_loc                                                    ; SET BOTTOM OF SPRITE Y POSITION = NEW Y LOCATION
	STA CUR_PLAYER_SPR_Y_RIGHT,X                                      ;
	LDA #SPRITE_OFFSCREEN                                             ; SET TOP OF SPRITE Y POS = OFFSCREEN
	STA CUR_PLAYER_SPR_Y_LEFT,X                                       ;
	JMP @check_for_extra_sprite                                       ; JUMP->CHECK FOR EXTRA SPRITE
	
@non_man_controlled_player_is_offscreen_right:                       ; NON MAN CONTROLLED PLAYER OFFSCREEN RIGHT PART OF SCREEN
	LDX PLAYER_SPR_INDEX_TEMP                                        ; LOAD PLAYER SPRITE INDEX
	LDA #SPRITE_OFFSCREEN                                            ; SET TOP AND BOTTOM OF SPRITE Y  = OFFSCREEN
	STA CUR_PLAYER_SPR_Y_LEFT,X                                      ;
	STA CUR_PLAYER_SPR_Y_RIGHT,X                                     ;
	
@check_for_extra_sprite:                                             ; CHECK FOR EXTRA SPRITE(JUMPING, DIVING)
	LDX EXTRA_SPR_INDEX_TEMP                                         ; DOES PLAYER RAM0D = CHECK FOR EXTRA SPRITE
	BEQ @check_next_player                                           ; NO->INCREMENT POINTER TO START OF NEXT PLAYER IN RAM
	LOAD_CUR_PLAYER_MOVEMENT_STATUS
	AND #$07                                                         ; MASK OUT UNDEEDED BITS
	ASL                                                              ; SHIFT SINCE TABLE IS TWO BYTES Y,X
	TAY                                                              ;
	LDA EXTRA_PLAYER_SPRITE_ADJUST,Y                                 ; LOAD SPRITE Y ADJUST FROM SPECIAL SPRITES LOCATION ADJUST
	PHA                                                              ;
	LDA(EXTRA_PLAYER_SPRITE_ADJUST+1),Y                              ; LOAD SPRITE X ADJUST FROM SPECIAL SPRITES LOCATION ADJUST
	LDY PLAYER_SPR_INDEX_TEMP                                        ; SPRITE X= SPRITE X + SPRITE X ADJUST
	CLC                                                              ;
	ADC CUR_SPRITE_X,Y                                               ;
	STA CUR_SPRITE_X,X                                               ;
	PLA                                                              ; SPRITE Y = SPRITE Y + SPRITE Y ADJUST
	CLC                                                              ;
	ADC CUR_SPRITE_Y,Y                                               ;
	STA CUR_SPRITE_Y,X                                               ;

@check_next_player:                                                  ; INCREMENT POINTER TO START OF NEXT PLAYER IN RAM
	ADD_8_BIT_CONST_TO_16BIT_ADDR[addr_val]  CURRENT_PLAYER_ADDR, $20; CURRENT PLAYER ADRR + OFFSET TO NEXT PLAYER
	DEC PLAYERS_LEFT_TO_UPDATE                                       ; PLAYER COUNTER--
	BEQ P1_MAN_PLAYER_OFFSCREEN_CHECK                                ; ALL PLAYERS UPDATED?
	JMP CHECK_FOR_COMMAND_UPDATE                                     ; NO-> COMMAND COUNTER UPDATE AND CHECK



temp_jump_dive_status = LOCAL_8

P1_MAN_PLAYER_OFFSCREEN_CHECK:                                       ; PLAYER 1 CONTROLLED PLAYER OFFSCREEN CHECK
	LDY #COLLISION_STATUS                                            ; LOAD P1 CONTROLLED PLAYER COLLISION
	LDA (P1_MAN_PLAYER_ADDR),Y                                       ;
	AND #$08                                                         ; ADD JUMPING TO OFFSET IF JUMPING
	ORA #$10                                                         ;
	STA temp_jump_dive_status                                        ;
	LDY #Y_POS + 1                                                   ; = ACTIVE PLAYER Y- STANDING OR JUMPING OFFSET
	LDA (P1_MAN_PLAYER_ADDR ),Y                                      ;
	SEC                                                              ;
	SBC temp_jump_dive_status                                        ;
	STA P1_INDICATOR_SPR_Y                                           ; SAVE IN P1 CONTROLLED PLAYER SPRITE Y
	LDY #X_POS +1                                                      ; = P1 CONTROLLED PLAYER X POSITION HIGH, MID � 0X04 MID
	LDA (P1_MAN_PLAYER_ADDR),Y                                       ;
	SEC                                                              ;
	SBC #$04                                                         ;
	TAX                                                              ;
	INY                                                              ;
	LDA (P1_MAN_PLAYER_ADDR),Y                                       ;
	SBC #$00                                                         ;
	TAY                                                              ;
	TXA                                                              ; X= P1 CONTROLLED PLAYER X MID � 4 � SCROLL WINDOW MID
	SEC                                                              ;
	SBC CURR_X_SCROLL                                                ;
	TAX                                                              ;
	TYA                                                              ; A= P1 CONTROLLED PLAYER X HIGH  - SCROLL WINDOW HIGH
	SBC CURR_X_SCROLL+1                                              ;
	BEQ @p1_player_onscreen                                          ; PLAYER STILL ONSCREEN-> P1 CONTROLLED PLAYER IS ONSCREEN
	LDA #OFFSCREEN_ARROW_TILE_ID                                     ; SET P1 CONTROLLED PLAYER TILE TO OFFSCREEN ARROW TILE
	BCS @p1_player_offscreen                                         ; PLAYER OFFSCEEN TO RIGHT -> P1 CONTROLLED PLAYER IS OFFSCREEN RIGHT
	LDX #$08                                                         ; SET X POSITION TO LEFT EDGE OF SCREEN
	LDY #$40                                                         ; SET MIRRORING == HORIZONTAL, PALLETE SET  ==P1 PALLETE
	JMP @save_P1_indicator_spr_info                                  ; JUMP->UPDATE P1 CONTROLLED PLAYER SPRITE (XPOS, TILE, MIRRORING)

@p1_player_offscreen:                                                ; P1 CONTROLLED PLAYER IS OFFSCREEN
	LDX #SPRITE_OFFSCREEN                                            ; SET X POSITION TO OFFSCREEN
	LDY #$00                                                         ; SET MIRRORING == NONE, PALLETE SET  ==P1 PALLETE
	JMP @save_P1_indicator_spr_info                                  ; JUMP->  UPDATE P1 CONTROLLED PLAYER SPRITE (XPOS, TILE, MIRRORING)

@p1_player_onscreen:                                                 ; P1 CONTROLLED PLAYER IS ONSCREEN
	LDA #P1_OVERHEAD_TILE_ID                                            ; SET P1 CONTROLLED PLAYER TILE TO #1 OVER HEAD TILE
	LDY #$00                                                         ; SET MIRRORING == NONE, PALLETE SET  ==P1 PALLETE

@save_P1_indicator_spr_info:                                         ; UPDATE P1 CONTROLLED PLAYER PLAYER ABOVE HEAD ICON (XPOS, TILE, MIRRORING)
	STX P1_INDICATOR_SPR_X                                           ; SAVE X POSITION
	STA P1_INDICATOR_SPR_TILE                                        ; SAVE TILE
	STY P1_INDICATOR_SPR_ATTR                                        ; SAVE MIRRORING PLUS PALLETE
	
@p2_man_player_offscreen_check:
	LDY #COLLISION_STATUS                                            ; PLAYER 2 CONTROLLED PLAYER OFFSCREEN CHECK
	LDA (P2_MAN_PLAYER_ADDR),Y                                       ; LOAD P2 CONTROLLED PLAYER COLLISION
	AND #$08                                                         ;
	ORA #$10                                                         ; ADD JUMPING TO Y OFFSET IF JUMPING
	STA temp_jump_dive_status                                        ;
	LDY #Y_POS + 1                                                   ;
	LDA (P2_MAN_PLAYER_ADDR),Y                                        ; ACTIVE P2 Y- STANDING OR JUMPING OFFSET
	SEC                                                              ;
	SBC temp_jump_dive_status                                        ;
	STA P2_INDICATOR_SPR_Y                                           ; SAVE IN P\2 CONTROLLED PLAYER SPRITE Y
	LDY #X_POS + 1                                                  ; = P2 CONTROLLED PLAYER X POSITION HIGH, MID � 0X04 MID
	LDA (P2_MAN_PLAYER_ADDR),Y                                       ;
	SEC                                                              ;
	SBC #$04                                                         ;
	TAX                                                              ;
	INY                                                              ;
	LDA (P2_MAN_PLAYER_ADDR),Y                                       ;
	SBC #$00                                                         ;
	TAY                                                              ;
	TXA                                                              ;
	SEC                                                              ;
	SBC CURR_X_SCROLL                                                ;
	TAX                                                              ;
	TYA                                                              ;
	SBC CURR_X_SCROLL +1                                             ;
	BEQ @p2_player_onscreen                                          ; PLAYER STILL ONSCREEN-? YES-> P2 CONTROLLED PLAYER IS ONSCREEN
	LDA #OFFSCREEN_ARROW_TILE_ID                                     ; SET P2 CONTROLLED PLAYER TILE = OFFSCREEN TILE
	BCS @p2_player_offscreen                                         ; PLAYER OFFCREEN? YES-> P2 CONTROLLED PLAYER IS OFFSCREEN
	LDX #$08                                                         ; SET X POSITION TO LEFT EDGE OF SCREEN
	LDY #$42                                                         ; SET MIRRORING == HORIZONTAL, PALLETE SET  ==P2 PALLETE
	JMP @save_P2_indicator_spr_info                                  ; JUMP TO UPDATE P2 CONTROLLED PLAYER SPRITE (XPOS, TILE, MIRRORING)

@p2_player_offscreen:                                                ; P2 CONTROLLED PLAYER IS OFFSCREEN
	LDX #SPRITE_OFFSCREEN                                            ; SET X POSITION = OFFSCREEN
	LDY #$02                                                         ; SET MIRRORING == NONE, PALLETE SET  ==P2 PALLETE
	JMP @save_P2_indicator_spr_info
@p2_player_onscreen:                                                 ; P2 CONTROLLED PLAYER IS ONSCREEN
	LDA #P2_OVERHEAD_TILE_ID                                         ; SET P2 CONTROLLED PLAYER TILE TO #2 OVER HEAD TILE
	LDY #$02                                                         ; SET MIRRORING == NONE, PALLETE SET  ==P2 PALLETE

@save_P2_indicator_spr_info:                                        ; UPDATE P2 CONTROLLED PLAYER ABOVE HEAD ICON (XPOS, TILE, MIRRORING)
	STX P2_INDICATOR_SPR_X                                           ; SAVE X POSITION
	STA P2_INDICATOR_SPR_TILE                                        ; SAVE TILE
	STY P2_INDICATOR_SPR_ATTR                                        ; SAVE MIRRORING PLUS PALLETE
	
@check_for_icon_change_handoff	
	LDA HANDOFF_ICON_CHANGE_TIMER                                    ; IS ICON CHANGE TIMER = DONE
	BEQ UPDATE_SCROLL_BALL_MOVING_CHECK                             ; YES-> BRANCH TO CHECK BALL SPRITE
	DEC HANDOFF_ICON_CHANGE_TIMER                                    ; ICON CHANGE TIMER--
	BNE @handoff_not_done                                          ;
	LDA POSSESSION_STATUS                                            ; SET POSSESION INDEX TO 0 OR 1
	AND #$01                                                         ;
	TAX                                                              ;
	LDA PLAYER_POSTION_ID,X                                          ; SET P1/P2 ICON TO CHANGING
	ORA #ICON_CHANGE_BITFLAG                                         ;
	STA PLAYER_POSTION_ID,X                                          ;
@handoff_not_done:                                                   ; ICON CHANGE NOT DONE SET CONTROLLED PLAYER INDICATOR OFFSCEEN
	LDA POSSESSION_STATUS                                            ;
	AND #$02                                                         ;
	ASL                                                              ;
	TAX                                                              ;
	LDA #SPRITE_OFFSCREEN                                            ; SET ABOVE HEAD SPRITE Y LOCATION TO OFFSCREEN
	STA CUR_SPRITE_Y,X                                               ;

_F}_UPDATE_PLAYER_LOCATION_MAN_INDICATORS	

_F{_PLAYER_MOVING_WITH_BALL_SCROLL_CHECK							; DONE
	
UPDATE_SCROLL_BALL_MOVING_CHECK:                                    ; CHECK FOR BALL MOVING IN AIR
	LDA BALL_COLLISION                                               ; DOES BALL INFO =  MOVING IN AIR
	BMI UPDATE_SIDELINE_SCROLL_LOC                                   ; YES-> BRANCH TO UPDATE SIDELINE IRQ SCROLL
	LDA PLAY_STATUS                                                  ; DOES PLAY STATUS = PLAY OVER
	BMI UPDATE_SIDELINE_SCROLL_LOC                                   ; YES-> BRANCH TO UPDATE SIDELINE IRQ SCROLL
	BIT POSSESSION_STATUS                                            ; DOES POSSESION STATUS = P2 HAS BALL
	BVS @p2_moving_with_ball_scroll_check                            ;

@p1_moving_with_ball_scroll_check:									 ; UPDATE FIELD SCROLLING BASED ON P1 ACTIVE PLAYER LOCATION
	LDY #Y_POS + 1                                                   ; SET BALL X,Y LOCATION = ACTIVE PLAYER 1 X ,Y LOCATION
	LDA (P1_MAN_PLAYER_ADDR),Y                                       ;
	STA BALL_Y + 1                                                   ;
	LDY #X_POS +2                                                    ;
	LDA (P1_MAN_PLAYER_ADDR),Y                                       ;
	STA BALL_X + 2                                                   ;
	TAX                                                              ;
	DEY                                                              ;
	LDA (P1_MAN_PLAYER_ADDR),Y                                       ;
	STA BALL_X + 1                                                   ;
	TAY                                                              ;
	JSR UPDATE_SCROLL_LOCATION_DIRECTION                             ; UPDATE SCROLL LOCATION AND DIRECTION(X,Y= PLAYER HIGH,MID LOCATION)
	JMP UPDATE_SIDELINE_SCROLL_LOC                                   ; JUMP -> UPDATE SIDELINE X SCROLL LOC

@p2_moving_with_ball_scroll_check:                                   ; UPDATE FIELD SCROLLING BASED ON P2 ACTIVE PLAYER LOCATION
	LDY #Y_POS + 1                                                       ; SET BALL X,Y LOCATOIN = ACTIVE PLAYER 1 X ,Y LOCATION
	LDA (P2_MAN_PLAYER_ADDR),Y                                       ;
	STA BALL_Y + 1                                                   ;
	LDY #X_POS +2                                                    ;
	LDA (P2_MAN_PLAYER_ADDR),Y                                       ;
	STA BALL_X + 2                                                   ;
	TAX                                                              ;
	DEY                                                              ;
	LDA (P2_MAN_PLAYER_ADDR),Y                                       ;
	STA BALL_X + 1                                                   ;
	TAY                                                              ;
	JSR UPDATE_SCROLL_LOCATION_DIRECTION                             ; UPDATE SCROLL LOCATION AND DIRECTION(X,Y= PLAYER HIGH,MID LOCATION)

_F}_PLAYER_MOVING_WITH_BALL_SCROLL_CHECK	
	
_F{_UPDATE_FIELD_AND_SIDELINE_SCROLL							    ; DONE	
	
UPDATE_SIDELINE_SCROLL_LOC:                                          ; UPDATE SIDELINE X SCROLL LOC
	LDA SIDELINE_SCROLL_X                                            ; UPDATE SIDELINE IRQ X SCROLL = SIDELINE XSCROLL + SCROLL LOCATION
	CLC                                                              ;
	ADC CURR_X_SCROLL                                                ;
	STA IRQ_1_XSCROLL                                                ;
	LDA #$00                                                         ;
	ADC CURR_X_SCROLL+1                                              ;
	AND #$01                                                         ;
	STA IRQ_1_XSCROLL+1                                              ;

	
UPDATE_FIELD_X_SCROLL:                                               ; UPDATE FIELD X SCROLL LOC
																	; UPDATE FIELD IRQ X SCROLL = SCROLL LOCATION
	.DB $AD, CURR_X_SCROLL ,$00                                      ; *** byte coded since asm 6 forces zero page***
	SEC                                                              ;
	SBC #$10                                                         ; scroll 1 yard
	STA IRQ_2_XSCROLL                                                ;
	.DB $AD, CURR_X_SCROLL+1 ,$00                                    ; *** byte coded since asm 6 forces zero page***
	SBC #$00                                                         ;
	AND #$01                                                         ;
	STA IRQ_2_XSCROLL+1                                              ;

_F}_UPDATE_FIELD_AND_SIDELINE_SCROLL	

_F{_CHECK_FOR_COLLISION_SOUND										; DONE	

CHECK_COLL_SOUND_TO_PLAY:                                            ; CHECK FOR COLLISION SOUND TO PLAY

@check_if_touchdown:
	LDA PLAY_STATUS                                                  ; DOES PLAY STATUS = TOUCHDOWN
	AND #$10                                                         ;
	BNE @clear_collision_sound                                       ; YES->CLEAR COLLISION SOUND

@check_if_another_sound_to_play:	
	LDA SOUND_ID_TO_PLAY                                             ; DOES SOUND TO PLAY = TRUE
	BNE @clear_collision_sound                                       ; YES-> CLEAR COLLISION SOUND
	LDA COLL_SOUND_TO_PLAY                                           ; SET SOUND TO PLAY = TEMP COLLISION SOUND
	STA SOUND_ID_TO_PLAY                                             ;

@clear_collision_sound:                                              ; CLEAR TEMP COLLISION SOUND
	LDA #$00                                                         ; CLEAR TEMP COLLISION SOUND
	STA COLL_SOUND_TO_PLAY                                           ;

_F}_CHECK_FOR_COLLISION_SOUND	

_F{_UPDATE_PLAYER_CHEER_CROWD_ANIMATION 							; DONE

@update_player_animation__spr_chr_bank:                              ; UPDATE TILE BANKS FOR PLAYER RUNNING/BLOCKING ANIMATIONS
	DEC PLAYER_ANIMATION_TIMER                                       ; LOAD PLAYER RUNNING ANIMATION TIMER
	BNE @check_update_crowd_cheer_bg_banks                           ; TIMER AT ZERO? NO->CHECK FOR UPDATE CROWD AND CHEERLEADER CHR BANK FOR ANIMATION
	LDA #PLAYER_ANI_FRAMES                                           ; RESET TIMER TO 6 FRAMES
	STA PLAYER_ANIMATION_TIMER                                       ;
	INC SOFT_CHR_1000_BANK                                           ; INC $1000 CHR BANK TO NEXT BANK
	LDA SOFT_CHR_1000_BANK                                           ;
	CMP #$06                                                         ; ARE WE AT BANK 7?
	BCC @save_spr_chr_bank                                           ; NO->SAVE $1000 CHR BANK FOR PLAYER RUNNING/BLOCKING ANIMATIONS
	LDA #$00
@save_spr_chr_bank:                                                  ; SAVE $1000 CHR BANK FOR PLAYER RUNNING/BLOCKING ANIMATIONS
	STA SOFT_CHR_1000_BANK                                           ;

@check_update_crowd_cheer_bg_banks:                                  ; CHECK FOR UPDATE CROWD AND CHEERLEADER CHR BANK FOR ANIMATION
	LDA FRAME_COUNTER                                                ; UPDATE ANIMATION EVERY 30 FRAMES= 0.5 SECONDS
	AND #$1F                                                         ;
	BNE @excited_crowd_cheer_check                                   ;
	
@endzone_crowd_update: 
	LDA IRQ_2_BG_0000                                                ; UPDATE BG $0000 CHR BANK = crowd
	EOR #$02                                                         ;
	STA IRQ_2_BG_0000                                                ; 
	
@excited_crowd_cheer_check:                                          ; CHECK FOR CHEERLEADER UPDATE
	LDA SIDELINE_ANI_TIMER                                           ; LOAD SIDELINE ANIMATION TIMER
	AND #JUMPING_CHEERLEADER_SIDELINE_ID + EXCITED_CROWD_SIDELINE_ID ;
	BEQ @normal_crowd_cheer_update                                   ; TIMER = ZERO? YES-> UPDATE CROWD ANIMATION
	CMP #JUMPING_CHEERLEADER_SIDELINE_ID                             ; SIDELINE ANIMATION TIMER = JUMPING CHEERLEADERS, EXCITED CROWD
	BEQ @excited_crowd_jumping_cheer                                 ; YES->JUMPING CHEERLEADER AND EXCITED CROWD (AFTER TD, FIRST DOWN)

@excited_crowd_only: 
	JSR SET_EXCITED_CROWD_CHR_BANK                                   ; SET CROWD ANIMATION CHR BANK()
	JMP @update_cheer_chr_check

@excited_crowd_jumping_cheer:                                        ; JUMPING CHEERLEADER AND EXCITED CROWD (AFTER TD, FIRST DOWN)
	JSR SET_EXCITED_CROWD_CHR_BANK                                   ; SET CROWD ANIMATION CHR BANK()
	LDA JUMPING_CHEER_CHR_BANKS,X                                    ; LOAD CHR BANK FROM CROWD ANIMATION CHR BANKS
	STA IRQ_1_BG_0800                                                ;
	JMP UPDATE_PLAYERS_MAIN_LOOP                                     ; JUMP->PLAYER AND SIDELINE GRAPHICS UPDATE LOOP

@normal_crowd_cheer_update                                           ; NORMAL CROWD AND CHEEARLEADER ANIMATION
	LDA #$10                                                         ; SET CROWD IRQ BG $0000 CHR BANK = 17
	STA IRQ_1_BG_0000                                                ;
	
@update_cheer_chr_check:                                             ; UPDATE CHEERLEADER ANIMATION
	LDA FRAME_COUNTER                                                ; = FRAME COUNTER & 0X1F = CHANGE EVERY 30 FRAMES
	AND #$1F                                                         ;
	BNE @exit                                                        ; TIME TO CHANGE ANIMATION? NO->EXIT
	LDA SIDELINE_ANI_TIMER                                           ; ANIMATION TIMER += 4
	CLC                                                              ;
	ADC #$04                                                         ;
	STA SIDELINE_ANI_TIMER                                           ; SHIFT TIMER VALUE AND MASK
	LSR                                                              ; TO GET INDEX INTO CHR BANKS
	LSR                                                              ;
	AND #$0F                                                         ;
	TAX                                                              ;
	LDA CHEER_ANI_CHR_BANKS,X                                        ; LOAD CHR BANK FROM CHEERLEADER ANIMATION CHR BANKS
	STA IRQ_1_BG_0800                                                ; SAVE CHR BANK IN IRQ CHR BANK
@exit:                                                               ; EXIT
	JMP UPDATE_PLAYERS_MAIN_LOOP                                     ; JUMP->PLAYER AND SIDELINE GRAPHICS UPDATE LOOP

SET_EXCITED_CROWD_CHR_BANK:                                          ; SET CROWD ANIMATION IRQ 0000 CHR BANK()
	LDA FRAME_COUNTER                                                ; LOAD FRAME COUNTER
	AND #$30                                                         ; MAKE VALUE 0,1,2,3
	LOG_SHIFT_RIGHT_4
	TAX                                                              ;
	LDA EXCITED_CROWD_ANI_CHR_BANKS,X                                ; LOAD CROWD ANIMATION CHR BANK
	STA IRQ_1_BG_0000                                                ; TRANSFER CROWD ANIMATION CHR BANK TO IRQ BG CHAR 0000
	RTS                                                              ; RETURN
	
_F}_UPDATE_PLAYER_CHEER_CROWD_ANIMATION 

_F{_GET_PLAYER_RAM_ADDR												; DONE

player_addr = LOCAL_1

GET_P1_P2_RAM_ADDR:                                                  ; GET P1 or P2 PLAYER GAME INFO POINTER AND SAVE IN 3E,3F(A= POSITION AND P1/P2 TEAM)
	ASL                                                              ; IS PLAYER =  P1
	BCC @get_ram_addr                                                ; YES-> LOAD PLAYER RAM POINTER
	ADC #( PLAYER2_RAM_ADDR_TABLE - PLAYER1_RAM_ADDR_TABLE -1)        ; ADD OFFSET TO PLAYER 2 GAME INFO = 22 BYTES
@get_ram_addr:                                                       ; LOAD PLAYER RAM POINTER
	MOV16_ROM_TO_ZP_Y_INDEX PLAYER_RAM_ADDR_TABLES, player_addr
	RTS                                                              ; RETURN

_F}_GET_PLAYER_RAM_ADDR	
 
 _F{_GET_TEAM_AND_PLAYER_ROSTER_ID									; DONE
 
GET_TEAM_AND_STARTER_FROM_POS_ID:                                    ; GET STARTER ID AND TEAM ID (A= PLAYER ID)
	TAY                                                              ; SAVE POSITION
	EOR POSSESSION_STATUS                                            ; IS PLAYER OFFENSE?
	BPL @load_position                                               ; YES->LOAD POSITION
	TYA                                                              ; POSITION = PLAYER ID + DEFENSE POSITION OFFSET
	CLC                                                              ;
	ADC #OFFSET_TO_FIRST_DEFENDER                                    ;
	TAY                                                              ;
@load_position:                                                      ; LOAD POSITION
	TYA                                                              ; LOAD PLAYER ID

GET_TEAM_AND_STARTER_FROM_STARTER_ID:                                ; GET STARTER ID AND TEAM ID (A= POSITION ID) *** SHOULD RENAME TO ROSTER ID
	ASL                                                              ; SET IS PLAYER P1 OR P2, SHIFT SINCE EACH PLAYER ENTRY IS TWO BYTES
	TAY                                                              ; LOAD POSITION ID
	BCS @get_p2_team_and_starter                                     ; IS PLAYER SIDE = PLAYER 2 YES-> LOAD PLAYER 2 TEAM AND STARTER ID
	LDX P1_GM_PLAYERS,Y                                              ; LOAD PLAYER TEAM
	LDA P1_GM_PLAYERS+1,Y                                            ; LOAD STARTER ROSTER ID
	RTS                                                              ; RETURN
@get_p2_team_and_starter:                                            ; LOAD PLAYER 2 TEAM AND STARTER ID
	LDX P2_GM_PLAYERS,Y                                              ; LOAD PLAYER TEAM
	LDA P2_GM_PLAYERS+1,Y                                            ; LOAD STARTER ROSTER ID
	RTS                                                              ; RETURN
	
 _F}_GET_TEAM_AND_PLAYER_ROSTER_ID	

_F{_GET_PLAYER_SKILL_OR_FACE										 ; DONE

																	; Y = 2= FACE(takes place of 84,85) 80=RP, 81=RS, 82=MS, 83=HP,
																	; 86=SKILL1 87= SKILL2, 88= SKILL3, 89=SKILL4, 8A=SKILL5, 8B=SKILL6, 8C=SKILL7

player_addr = LOCAL_1
temp_skill_value	= LOCAL_1	
previous_A000_bank = LOCAL_7
skill_face = LOCAL_8
roster_id = LOCAL_8 

GET_PLAYER_SKILL_OR_FACE:                                            ; GET PLAYER SKILL OR FACE (A=ACTUAL PLAYER, X=TEAM, Y=FACE OR SKILL, C= P1/P2)
	STY skill_face                                            		 ; SAVE SKILL TO GET/FACE
	PHP                                                              ; SAVE TEAM 1 or TEAM 2
	TAY                                                              ; SAVE PLAYER
	TXA                                                              ; SAVE TEAM ID
	ASL                                                              ; SHIFT SINCE TEAM POINTER IS 2 BYTES
	TAX                                                              ; LOAD TEAM ID
	LDA ROSTER_ABILITY_OFFSETS,Y                                     ; LOAD OFFSET TO PLAYER ABILITY FROM PLAYER ABILITY OFFSETS
	CLC                                                              ;
	ADC TEAM_ABILITY_ADDRESSES,X                                     ; SKILL POINTER = TEAM ABILITIES LOCATION + PLAYER ABILITY OFFSET
	STA player_addr                                          		 ;
	LDA #$00                                                         ;
	ADC TEAM_ABILITY_ADDRESSES+1,X                                   ;
	STA player_addr + 1                                       		 ;	
	LDA SOFT_A000_BANK                                               ; SET A000 BANK TO RETURN TO = CURRENT $A000 BANK
	STA previous_A000_bank                                           ;
	LDX #$01                                                         ; LOAD PLAYER ABILITIES BANK = BANK 1
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	LDA skill_face                                           		 ; IS SKILL INDEX = PLAYER FACE
	BMI @get_player_skill                                            ; NO-> BRANCH TO GET PLAYER SKILL(Y=STARTER ID, A= SKILL TO GET)
	PLP                                                              ; RESTORE TEAM 1 OR TEAM 2
	TAY                                                              ; LOAD FACE VALUE
	LDA (player_addr),Y                                       		 ;
	JMP @save_skill_face                                             ; SAVE SKILL/FACE AND RETURN TO PREVIOUS $A000 BANK
	
@get_player_skill:                                                   ; GET PLAYER SKILL(Y=STARTER ID, A = SKILL TO GET)
	STY roster_id                                               	 ; SAVE STARTER ID
	AND #$7F                                                         ; MASK OUT HIGH NIBBLE
	LSR                                                              ; SHIFT RIGHT SINCE TWO SKILLS PER BYTE
	TAY                                                              ; SAVE PLAYER SKILL INDEX
	LDA (player_addr),Y                                              ; PLAYER SKILL BYTE = PLAYER SKILLS LOCATION + SKILL INDEX
	BCS @save_skill_value                                            ; SKILL IN SECOND NIBBLE? YES-> SKILL IS IN SECOND NIBBLE OF BYTE
	LOG_SHIFT_RIGHT_4                                                ; SHIFT OUT LOW NIBBLE
			
@save_skill_value:                                                   ; SKILL IS IN SECOND NIBBLE OF BYTE
	AND #$0F                                                         ; MASK OUT UPPER NIBBLE
	STA temp_skill_value                                             ;
	LDA roster_id                                                    ; LOAD STARTER ID
	LOG_SHIFT_RIGHT_2                                                ; DIVIDE BY 4 SINCE 4 STARTERS PER CONDITOIN BYTE
	TAY                                                              ;
	PLP                                                              ; IS TEAM P2?
	BCS @get_p2_condition                                            ; YES-> GET PLAYER 2 CONDITION BYTE
	LDA P1_CONDITIONS_START,Y                                        ; LOAD PLAYER CONDITION BYTE FROM PLAYER 1 IN GAME CONDITIONS
	JMP @add_condition_to_skill                                      ; JUMP -> UPDATE PLAYER SKILL VALUE BASED ON CONDITION

@get_p2_condition:                                                   ; GET PLAYER 2 CONDITION BYTE
	LDA P2_CONDITIONS_START,Y                                              ; LOAD PLAYER CONDITION BYTE FROM PLAYER 2 IN GAME CONDITIONS


@add_condition_to_skill:                                             ; UPDATE PLAYER SKILL VALUE BASED ON CONDITION
	LDX roster_id                                                    ; LOAD STARTER ID
	JSR GET_PLAYER_COND_INJURY_STATUS                                ; GET PLAYER CONDITION OR INJURY FROM BYTE(X=STARTER ID)
	CLC                                                              ; FINAL SKILL INDEX= SKILL VALUE INDEX + PLAYER CONDITION
	ADC player_addr                                          		 ;
	SEC                                                              ; SET FINAL SKILL INDEX = 0, IF FINAL SKILL INDEX <0
	SBC #$01                                                         ;
	BCS @check_at_max_skill                                          ; 
	LDA #MIN_SKILL                                                   ; Set Skill to 0
@check_at_max_skill:                                                 ; CHECK IF > MAX SKILL
	CMP #MAX_SKILL + 1                                               ; SET FINAL SKILL INDEX = 0X0F, IF FINAL SKILL INDEX >0X0F
	BCC @save_skill_face                                             ;
	LDA #MAX_SKILL                                                   ;

@save_skill_face:                                                    ; SAVE SKILL/FACE AND RETURN TO PREVIOUS $A000 BANK
	TAY                                                              ;
	LDX previous_A000_bank                                           ; LOAD PREVIOUS $A000 BANK
	JSR SWAP_A000_BANK                                               ; SWAP $A000 BANK(X= $A000 BANK TO SWAP)
	TYA                                                              ; SAVE SKILL VALUE IN A
	RTS                                                              ; RETURN
	
_F}_GET_PLAYER_SKILL_OR_FACE

_F{_CHECK_IF_PLAYER_INJURED											; DONE
	
CHECK_IF_PLAYER_INJURED:                                             ; CHECK FOR INJURY (A=STARTER ID)
	CMP #LAST_OFFENSIVE_SKILL_PLAYER + 1                             ; IS ACTUAL STARTER < LAST OFFENSIVE SKILL PLAYER?
	BCC @player_is_offense                                           ; YES-> CHECK OFFENSIVE PLAYER INJURY STATUS START
	
@player_is_not_offense_exit:	
	CLC                                                              ;
	RTS                                                              ; RETURN
	
@player_is_offense:                                                  ; CHECK OFFENSIVE PLAYER INJURY STATUS START
	TAX                                                              ; SAVE OFFENSIVE SKILL STARTER
	LOG_SHIFT_RIGHT_2                                                ; DIVIDE BY 4 SINCE 4 STARTERS PER CONDITION BYTE
	TAY                                                              ;
	BIT POSSESSION_STATUS                                            ; IS PLAYER = PLAYER 2?
	BMI @get_p2_injury_status                                        ; YES-> GET PLAYER 2 INJURY BYTE
	
@get_p1_injury_status:												; GET PLAYER 1 INJURY BYTE
	LDA P1_INJURIES_START,Y                                          ; LOAD P1 INJURY BYTE
	JMP GET_PLAYER_COND_INJURY_STATUS                                ; JUMP to GET PLAYER CONDITION OR INJURY FROM BYTE
	
@get_p2_injury_status:                                               ; GET PLAYER 2 INJURY BYTE
	LDA P2_INJURIES_START,Y                                          ; LOAD P2 INJURY BYTE
	JMP GET_PLAYER_COND_INJURY_STATUS                                ; JUMP to GET PLAYER CONDITION OR INJURY FROM BYTE

_F}_CHECK_IF_PLAYER_INJURED	
	
_F{_GET_PLAYER_CONDITION											; DONE
	
																	 ; used in condition update, draw condition text
GET_PLAYER_CONDITION:                                                ; GET PLAYER CONDITION (A=roster ID)
	TAX                                                              ; SAVE STARTER ID
	LOG_SHIFT_RIGHT_2                                               ; DIVIDE BY 4 SINCE 4 STARTERS PER CONDITION BYTE
	TAY                                                              ;
	BIT POSSESSION_STATUS                                            ; IS PLAYER 1 OR PLAYER 2?
	BMI @get_p2_cond_byte                                            ;
	
@get_p1_cond_byte: 	
	LDA P1_CONDITIONS_START,Y                                        ; LOAD PLAYER 1 CONDITION BYTE
	JMP GET_PLAYER_COND_INJURY_STATUS

@get_p2_cond_byte:                                                   ; LOAD PLAYER 2 CONDITION BYTE
	LDA P2_CONDITIONS_START,Y

GET_PLAYER_COND_INJURY_STATUS:                                       ; GET PLAYER CONDITION OR INJURY STATUS FROM BYTE(X=STARTER INDEX IN BYTE, A=CONDITOIN OR INJURY BYTE)
	TAY                                                              ; SAVE INDEX INTO CONDITION/INJURY BYTE
	TXA                                                              ; LOAD STARTER ID
	EOR #$FF                                                         ; LOOP UNTIL WE ARE AT THE CORRECT SUB NIBBLE VALUE
	AND #$03                                                         ;
	BEQ @save_condition_injury_value                                 ;
	TAX                                                              ;
	TYA                                                              ;
_WHILE NOT_EQUAL

	LOG_SHIFT_RIGHT_2                                                ;
	DEX                                                              ;
	
_END_WHILE                                                      	 ;
	TAY                                                              ;
@save_condition_injury_value:                                        ;
	TYA                                                              ; SAVE CONDITION/INJURY VALUE
	AND #$03                                                         ;
	CMP #$01                                                         ; SET CARRY IF PLAYER INJURED
	RTS                                                              ; RETURN

_F}_GET_PLAYER_CONDITION	

_F{_SET_PLAYER_INJURY_STATUS										; DONE
	
player_addr 	= LOCAL_1
injury_bitmask  = LOCAL_6	
position_id		= LOCAL_7 	
injury_status 	= LOCAL_8 

	
SET_INJURY_STATUS:                                                   ; SET PLAYER INJURY STATUS(A= PLAYER, X=INJURY STATUS)
	STA position_id                                                  ; SAVE STARTER ID
	STX injury_status                                                ; SAVE INJURY STATUS
	LDY #$FC                                                         ; SET INJURY BITMASK
	STY injury_bitmask                                        		 ;
	EOR #$FF                                                         ;
	AND #$03                                                         ; PLAYER IN FIRST TWO BITS?
	BEQ @save_injury_status                                          ; YES->SAVE INJURY STATUS
	TAX                                                              ;
_WHILE NOT_EQUAL
	ASL injury_status                                          		 ;
	ASL injury_status                                          		 ;
	SEC                                                              ;
	ROL injury_bitmask                                       		 ;
	ROL injury_bitmask                                         		 ;
	DEX                                                              ; DONE?
_END_WHILE

@save_injury_status:                                                 ; SAVE INJURY STATUS
	JSR GET_P1_P2_GAME_STATS_ADDR                                    ; LOAD START OF TEAM GAME STATS SRAM LOCATION IN 3E 3F()
	MMC3_SRAM_WRITE_ENABLE                                           ; 
	LDA position_id                                                  ; SHIFT 4 BITS SINCE 4 PLAYERS TAKE UP ONE BYTE
	LOG_SHIFT_RIGHT_2                                                ;
	CLC                                                              ;
	ADC #INJURY_STATUS_OFFSET                                        ; = + OFFSET TO INJURY MEMORY LOCATION
	TAY                                                              ; = SRAM STARTING LOCATION + OFFSET + PLAYER BYTE OFFESET
	LDA (player_addr ),Y                                       		 ; SAVE INJURY VALUE
	AND injury_bitmask                                       		 ;
	ORA injury_status                                        		 ;
	STA (player_addr ),Y                                       		 ;
	MMC3_SRAM_WRITE_DISABLE
	RTS                                                              ; RETURN

_F}_SET_PLAYER_INJURY_STATUS

_F{_CHECK_PLAYER_LOCATION_VS_FINAL_BALL								; DONE
	
cur_player_addr 	= LOCAL_1
x_distance			= LOCAL_8
	
COMPARE_PLAYER_FINAL_BALL:                                           ; COMPARE PLAYER LOCATION TO FINAL BALL X,Y(3E,3F= PLAYER POINTER)
   LDY #X_POS + 1				                                     ; PLAYER X VALUE (HIGH,MID)- FINAL BALL X (HIGH,MID)		                         
	LDA (cur_player_addr),Y	                                          
	SEC                                                              ;
	SBC FINAL_BALL_X                                                 ;
	STA x_distance                                               	 ;
	INY                                                              ;
	LDA (cur_player_addr),Y                                       	;
	SBC FINAL_BALL_X+1                                               ; IS PLAYER LOCATION ==  FINAL X LOCATION?
	BMI @chk_x_distance                                              ; NO- CHECK PLAYER DISTANCE REMAINING FROM FINAL X LOCATION
	BEQ @chk_y_distance                                              ; YES-> CHECK PLAYER DISTANCE FROM FINAL BALL IN Y DIRECTION

@chk_x_distance:                                                     ; CHECK PLAYER DISTANCE REMAINING FROM FINAL X LOCATION
	CMP #$FF                                                         ; IS DISTANCE > 32 YARDS?
	BNE @set_x_grt_32yards                                           ; YES-> SET X DIST REMAIN > 32 YARDS
	NEGATE_8_ZP x_distance                                           ; value = -1 x value 
	JMP @chk_y_distance                                              ; JUMP->CHECK PLAYER DISTANCE FROM BALL IN Y DIRECTION

@set_x_grt_32yards:                                                  ; SET X DIST REMAIN > 32 YARDS
	LDA #$FF                                                         ; SET X DISTANCE REMAIN = GREATER THAN 32 YARDS
	STA x_distance                                                   ;

@chk_y_distance:                                                    ; CHECK PLAYER DISTANCE FROM BALL IN Y DIRECTION
	LDY #Y_POS + 1				                                         ; 		                         
	LDA (cur_player_addr),Y	                                          
	SEC                                                              ;
	SBC FINAL_BALL_Y                                                 ;
	ABS_A                                                            ; 
	CMP x_distance                                                   ; IS Y > X
	BCS @exit                                                        ; YES-> KEEP Y DISTANCE LEFT VALUE AND EXIT
	LDA x_distance                                                   ; NO-> LOAD X DISTANCE LEFT
@exit:                                                               ; EXIT
	RTS                                  

_F}_CHECK_PLAYER_LOCATION_VS_FINAL_BALL	

_F{_GET_GAME_STATS_OR_SEASON_STATS_ADDR								; DONE
	
game_stats_addr 		= LOCAL_1
team_season_stats_addr 	= LOCAL_1
	
GET_P1_P2_GAME_STATS_ADDR:                                           ; LOAD P1 or P2 GAME STATS SRAM LOCATION IN 3E 3F()
	BIT POSSESSION_STATUS                                            ; IS OFFENSE P1 OR P2?
	BMI @p2_in_game_stats                                            ; P2? YES->PLAYER 2 ON OFFENSE
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] P1_GAME_STATS_START, game_stats_addr    
	RTS                                    

@p2_in_game_stats:                                                   ; PLAYER 2 ON OFFENSE
	SAVE_ADDR16_TO_ZP_VAR[addr_zp] P2_GAME_STATS_START, game_stats_addr 
	RTS                                    

GET_TEAM_SEASON_SRAM_ADDR:                                           ; LOAD TEAM SEASON SRAM LOCATION IN 3E 3F()
	ASL                                                              ; SHIFT SINCE POINTER IS 2 BYTES
	TAY                                                              ;
	SAVE_ADDR16_Y_TO_ZEROPAGE TEAM_STAT_SRAM_ADDR, team_season_stats_addr
	RTS                                                              ; RETURN

_F}_GET_GAME_STATS_OR_SEASON_STATS_ADDR	
	
_F{_PLAYER_RAM_POINTER_TABLE										; DONE
	
PLAYER_RAM_ADDR_TABLES:
	
PLAYER1_RAM_ADDR_TABLE:                                               ; PLAYER RAM START POINTERS
	.WORD P1_RAM_QB_RE 
	.WORD P1_RAM_RB1_NT 
	.WORD P1_RAM_RB2_LE 
	.WORD P1_RAM_WR1_ROLB 
	.WORD P1_RAM_WR2_RILB 
	.WORD P1_RAM_TE1_LILB
	.WORD P1_RAM_C_LOLB 
	.WORD P1_RAM_LG_RCB 
	.WORD P1_RAM_RG_LCB
	.WORD P1_RAM_LT_FS 
	.WORD P1_RAM_RT_SS

PLAYER2_RAM_ADDR_TABLE: 
	.WORD P2_RAM_QB_RE 
	.WORD P2_RAM_RB1_NT 
	.WORD P2_RAM_RB2_LE 
	.WORD P2_RAM_WR1_ROLB 
	.WORD P2_RAM_WR2_RILB 
	.WORD P2_RAM_TE1_LILB
	.WORD P2_RAM_C_LOLB 
	.WORD P2_RAM_LG_RCB 
	.WORD P2_RAM_RG_LCB
	.WORD P2_RAM_LT_FS 
	.WORD P2_RAM_RT_SS
	
_F}_PLAYER_RAM_POINTER_TABLE:	

_F{_TEAM_SEASON_STAT_POINTER_TABLE									 ; DONE
	
TEAM_STAT_SRAM_ADDR:                                                 ; TEAM_SRAM_POINTERS
	.WORD TEAM_1_SEASON_INFO, TEAM_2_SEASON_INFO, TEAM_3_SEASON_INFO, TEAM_4_SEASON_INFO, TEAM_5_SEASON_INFO
	.WORD TEAM_6_SEASON_INFO, TEAM_7_SEASON_INFO, TEAM_8_SEASON_INFO, TEAM_9_SEASON_INFO
	.WORD TEAM_10_SEASON_INFO, TEAM_11_SEASON_INFO, TEAM_12_SEASON_INFO, TEAM_13_SEASON_INFO, TEAM_14_SEASON_INFO
	
	.WORD TEAM_15_SEASON_INFO, TEAM_16_SEASON_INFO, TEAM_17_SEASON_INFO, TEAM_18_SEASON_INFO, TEAM_19_SEASON_INFO
	.WORD TEAM_20_SEASON_INFO, TEAM_21_SEASON_INFO, TEAM_22_SEASON_INFO, TEAM_23_SEASON_INFO, TEAM_24_SEASON_INFO
	.WORD TEAM_25_SEASON_INFO, TEAM_26_SEASON_INFO, TEAM_27_SEASON_INFO, TEAM_28_SEASON_INFO

_F}_TEAM_SEASON_STAT_POINTER_TABLE		

_F{_SPECIAL_SPRITE_LOCATION_ADJUST									; DONE
	
	
EXTRA_PLAYER_SPRITE_ADJUST:                                      ; SPECIAL SPRITES LOCATION ADJUST
	.DB $F0, $00                                                  ;
	.DB $F0, $08                                                  ; ARM IN MOTION 1
	.DB $00, $F8                                                  ; PLAYER ON GROUND
	.DB $00, $10                                                  ; PLAYER ON GROUND
	.DB $08, $10                                                  ;
	.DB $08, $F8                                                  ; PLAYER ON GROUND
	.DB $F0, $04                                                  ; PLAYER JUMPING
	.DB $00, $00                                                  ;

_F}_SPECIAL_SPRITE_LOCATION_ADJUST	
	
_F{_SIDELINE_AND_CHEERLEADER_CHR_BANKS_FOR_ANIMATION				; DONE

																	; 2C = ready to jump
																	; 2E = in air legs split    
																	; 30 = both arms down   
																	; 32 = right arm side left arm diag
																	; 34 = left arm side, right arm diag
																	; 36 = poms above head hip right
																	; 38 = poms above head hip left
																	; 3A = tuurned side ways left arm out
																	; 3C = poms behind back
																	; 3E = tuurned side ways left arm out   
CHEER_ANI_CHR_BANKS:                                                 ; CHEERLEADER ANIMATION
	.DB $30, $32, $34, $30
	.DB $3C, $3A, $30, $3E
	.DB $32, $34, $38, $36
	.DB $38, $36, $34, $32


EXCITED_CROWD_ANI_CHR_BANKS:
		.DB $10, $12, $14, $16                                       ; TD/FD CROWD ANIMATION CHR BANKS

JUMPING_CHEER_CHR_BANKS:
		.DB $2C, $2E, $2C, $2E                                       ; TD/FD CHEERLEADER ANIMATIONS CHR BANKS

_F}_SIDELINE_AND_CHEERLEADER_CHR_BANKS_FOR_ANIMATION			
		
_F{_TEAM_PLAYER_DATA_POINTER_TABLE									; DONE
		
TEAM_ABILITY_ADDRESSES:                                              ; TEAM_ABILITY_POINTERS

	.WORD BUFFALO_BILLS_ABILITIES									; 0x00 BUF.
	.WORD INDIANAPOLIS_COLTS_ABILITIES								; 0x01 IND.
	.WORD MIAMI_DOLPHINS_ABILITIES									; 0x02 MIA.
	.WORD NEW_ENGLAND_PATRIOTS_ABILITIES							; 0x03 N.E.
	.WORD NEW_YORK_JETS_ABILITIES									; 0x04 JETS
	
	.WORD CINCINNATI_BENGALS_ABILITIES								; 0x05 CIN.
	.WORD CLEVELAND_BROWNS_ABILITIES								; 0x06 CLE.
	.WORD HOUSTON_OILERS_ABILITIES									; 0x07 HOU.
	.WORD PITTSBURGH_STEELERS_ABILITIES								; 0x08 PIT.
	
	.WORD DENVER_BRONCOS_ABILITIES									; 0x09 DEN.
	.WORD KANSAS_CITY_CHIEFS_ABILITIES								; 0x0A K.C.
	.WORD LOS_ANGELES_RAIDERS_ABILITIES								; 0x0B RAI.
	.WORD SAN_DIEGO_CHARGERS_ABILITIES								; 0x0C S.D.
	.WORD SEATTLE_SEAHAWKS_ABILITIES								; 0x0D SEA.
	
	.WORD WASHINGTON_REDSKINS_ABILITIES								; 0x0E WAS.
	.WORD NEW_YORK_GIANTS_ABILITIES									; 0x0F GIA.
	.WORD PHILADELPHIA_EAGLES_ABILITIES								; 0x10 PHI.
	.WORD PHOENIX_CARDINALS_ABILITIES								; 0x11 PHX.
	.WORD DALLAS_COWBOYS_ABILITIES									; 0x12 DAL.
	
	.WORD CHICAGO_BEARS_ABILITIES									; 0x13 CHI.
	.WORD DETROIT_LIONS_ABILITIES									; 0x14 DET.
	.WORD GREEN_BAY_PACKERS_ABILITIES								; 0x15 G.B.
	.WORD MINNESOTA_VIKINGS_ABILITIES								; 0x16 MIN.
	.WORD TAMPA_BAY_BUCCANEERS_ABILITIES							; 0x17 T.B.
	
	.WORD SAN_FRANCISCO_49ERS_ABILITIES								; 0x18 S.F.
	.WORD LOS_ANGELES_RAMS_ABILITIES								; 0x19 RAMS
	.WORD NEW_ORLEANS_SAINTS_ABILITIES								; 0x1A N.O.
	.WORD ATLANTA_FALCONS_ABILITIES									; 0x1B ATL.

_F}_TEAM_PLAYER_DATA_POINTER_TABLE

_F{_OFFSET_TO_SPECIFC_ROSTER_ID_PLAYER_DATA							; DONE

ROSTER_ABILITY_OFFSETS:                                           ; ROSTER ABILITIES OFFSETS:
	.DB QB_ONE_ABILITIES_OFFSET			
	.DB QB_TWO_ABILITIES_OFFSET			
	.DB RB_ONE_ABILITIES_OFFSET			
	.DB RB_TWO_ABILITIES_OFFSET			
	.DB RB_THREE_ABILITIES_OFFSET		
	.DB RB_FOUR_ABILITIES_OFFSET		
	.DB WR_ONE_ABILITIES_OFFSET			
	.DB WR_TWO_ABILITIES_OFFSET		
	.DB WR_THREE_ABILITIES_OFFSET		
	.DB WR_FOUR_ABILITIES_OFFSET		
	.DB TE_ONE_ABILITIES_OFFSET			
	.DB TE_TWO_ABILITIES_OFFSET			
	.DB CENTER_ABILITIES_OFFSET			
	.DB LEFT_GUARD_ABILITIES_OFFSET		
	.DB RIGHT_GUARD_ABILITIES_OFFSET	
	.DB LEFT_TACKLE_ABILITIES_OFFSET	
	.DB RIGHT_TACKLE_ABILITIES_OFFSET	
	.DB RE_ABILITIES_OFFSET				
	.DB NT_ABILITIES_OFFSET				
	.DB LE_ABILITIES_OFFSET							
	.DB ROLB_ABILITIES_OFFSET		
	.DB RILB_ABILITIES_OFFSET			
	.DB LILB_ABILITIES_OFFSET			
	.DB LOLB_ABILITIES_OFFSET			
	.DB RCB_ABILITIES_OFFSET			
	.DB LCB_ABILITIES_OFFSET		
	.DB FS_ABILITIES_OFFSET				
	.DB SS_ABILITIES_OFFSET				
	.DB K_ABILITIES_OFFSET				
	.DB P_ABILITIES_OFFSET				
	.DB $75                                                       ; UNUSED *** likely was KR PR 
	.DB $79                                                       ;

_F}_OFFSET_TO_SPECIFC_ROSTER_ID_PLAYER_DATA	

_F{_SPEED_AND_HITTING_POWER_VALUES								   ; DONE
	
OFF_MAX_SPEED_VALS:                                                  ; OFFENSIVE_MAX_SPEED_VALUES
	.DB $15, $16, $17, $18, $19, $1A, $1B, $1C
	.DB $1D, $1E, $1F, $20, $21, $22, $23, $24

DEF_MAX_SPEED_VALS:                                                  ; DEFENSIVE_MAX_SPEED_VALUES
	.DB $25, $26, $27, $28, $29, $2A, $2B, $2C
	.DB $2D, $2E, $2F, $30, $31, $32, $33, $34

HITTING_POWER_VALS:                                                  ; HITTING_POWER_VALUES:
	.DB $00, $04, $08, $0C, $10, $14, $18, $1C
	.DB $20, $24, $28, $2C, $30, $34, $38, $3C

_F}_SPEED_AND_HITTING_POWER_VALUES	
	
.PAD $E000, $FF
