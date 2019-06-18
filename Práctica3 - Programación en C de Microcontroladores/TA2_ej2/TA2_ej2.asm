
_main:

	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	MOVLW      PORTE+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      2
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
	CLRF       ANSELH+0
	CLRF       ANSEL+0
	CLRF       TRISC+0
	CLRF       PORTC+0
L_main0:
	MOVLW      128
	XORWF      _cont+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVLW      0
	SUBWF      _cont+0, 0
L__main6:
	BTFSS      STATUS+0, 0
	GOTO       L_main1
	MOVF       _cont+0, 0
	ADDLW      _num+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
	MOVLW      1
	SUBWF      _cont+0, 1
	BTFSS      STATUS+0, 0
	DECF       _cont+1, 1
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
	MOVLW      128
	XORWF      _cont+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      3
	SUBWF      _cont+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	MOVF       _cont+0, 0
	ADDLW      _freq+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	CLRF       FARG_Sound_Play_freq_in_hz+1
	MOVLW      0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      232
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
L_main3:
	MOVLW      128
	XORWF      _cont+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      0
	SUBWF      _cont+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      9
	MOVWF      _cont+0
	MOVLW      0
	MOVWF      _cont+1
L_main4:
	GOTO       L_main0
L_main1:
L_end_main:
	GOTO       $+0
; end of _main
