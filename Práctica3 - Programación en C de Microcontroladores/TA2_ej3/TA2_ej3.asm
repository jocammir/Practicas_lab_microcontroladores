
_main:

	CLRF       ANSELH+0
	CLRF       ANSEL+0
	CLRF       TRISC+0
	CLRF       TRISD+0
	CLRF       TRISB+0
	MOVLW      255
	MOVWF      PORTB+0
L_main0:
	BTFSC      PORTB+0, 0
	GOTO       L_main2
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      8
	SUBWF      _i+0, 0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVF       _i+0, 0
	ADDLW      _PORT+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
	MOVF       _i+0, 0
	ADDLW      _LETRA+0
	MOVWF      FSR
	COMF       INDF+0, 0
	MOVWF      PORTC+0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main3
L_main4:
L_main2:
	BTFSC      PORTB+0, 1
	GOTO       L_main7
	CLRF       _i+0
	CLRF       _i+1
L_main8:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      8
	SUBWF      _i+0, 0
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
	MOVF       _i+0, 0
	ADDLW      _PORT+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
	MOVF       _i+0, 0
	ADDLW      _FIGURA+0
	MOVWF      FSR
	COMF       INDF+0, 0
	MOVWF      PORTC+0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main8
L_main9:
L_main7:
	BTFSC      PORTB+0, 2
	GOTO       L_main12
	CLRF       _i+0
	CLRF       _i+1
L_main13:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      32
	SUBWF      _i+0, 0
L__main26:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
	CLRF       _k+0
	CLRF       _k+1
L_main16:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      50
	SUBWF      _k+0, 0
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
	CLRF       _j+0
	CLRF       _j+1
L_main19:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      8
	SUBWF      _j+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main20
	MOVF       _j+0, 0
	ADDLW      _PORT+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
	MOVF       _j+0, 0
	ADDWF      _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _j+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _MENSAJE+0
	MOVWF      FSR
	COMF       INDF+0, 0
	MOVWF      PORTC+0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	NOP
	NOP
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
	GOTO       L_main19
L_main20:
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
	GOTO       L_main16
L_main17:
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main13
L_main14:
L_main12:
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
