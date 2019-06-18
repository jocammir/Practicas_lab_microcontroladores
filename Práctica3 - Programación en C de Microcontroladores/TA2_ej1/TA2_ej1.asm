
_main:

	CLRF       ANSELH+0
	CLRF       ANSEL+0
	MOVLW      1
	MOVWF      TRISC+0
	CLRF       TRISD+0
	CLRF       PORTC+0
	CLRF       PORTD+0
L_main0:
	BTFSS      PORTC+0, 0
	GOTO       L_main2
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	MOVF       _i+0, 0
	MOVWF      PORTD+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
	GOTO       L_main4
L_main2:
	MOVF       _i+0, 0
	MOVWF      PORTD+0
L_main4:
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
