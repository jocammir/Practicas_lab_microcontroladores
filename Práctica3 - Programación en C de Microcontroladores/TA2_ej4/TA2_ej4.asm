
_main:

	CLRF       ANSEL+0
	CLRF       ANSELH+0
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	MOVLW      PORTE+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      2
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
L_main0:
	CALL       _Dragon_Ball_GT+0
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main

_Dragon_Ball_GT:

	MOVLW      16
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Dragon_Ball_GT2:
	DECFSZ     R13+0, 1
	GOTO       L_Dragon_Ball_GT2
	DECFSZ     R12+0, 1
	GOTO       L_Dragon_Ball_GT2
	DECFSZ     R11+0, 1
	GOTO       L_Dragon_Ball_GT2
	NOP
	MOVLW      16
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Dragon_Ball_GT3:
	DECFSZ     R13+0, 1
	GOTO       L_Dragon_Ball_GT3
	DECFSZ     R12+0, 1
	GOTO       L_Dragon_Ball_GT3
	DECFSZ     R11+0, 1
	GOTO       L_Dragon_Ball_GT3
	NOP
	MOVLW      147
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      186
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      16
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      16
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      186
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      147
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      75
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      138
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      147
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Dragon_Ball_GT4:
	DECFSZ     R13+0, 1
	GOTO       L_Dragon_Ball_GT4
	DECFSZ     R12+0, 1
	GOTO       L_Dragon_Ball_GT4
	DECFSZ     R11+0, 1
	GOTO       L_Dragon_Ball_GT4
	NOP
	MOVLW      147
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Dragon_Ball_GT5:
	DECFSZ     R13+0, 1
	GOTO       L_Dragon_Ball_GT5
	DECFSZ     R12+0, 1
	GOTO       L_Dragon_Ball_GT5
	DECFSZ     R11+0, 1
	GOTO       L_Dragon_Ball_GT5
	NOP
	MOVLW      11
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      75
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      147
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      186
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      147
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      75
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      11
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      238
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      184
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      38
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Dragon_Ball_GT6:
	DECFSZ     R13+0, 1
	GOTO       L_Dragon_Ball_GT6
	DECFSZ     R12+0, 1
	GOTO       L_Dragon_Ball_GT6
	DECFSZ     R11+0, 1
	GOTO       L_Dragon_Ball_GT6
	NOP
	NOP
L_end_Dragon_Ball_GT:
	RETURN
; end of _Dragon_Ball_GT
