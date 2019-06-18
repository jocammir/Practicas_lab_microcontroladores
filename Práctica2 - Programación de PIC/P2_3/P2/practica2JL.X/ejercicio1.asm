;***********************************ENCABEZADO************************************
;-----------------------------Configuracion inicial-----------------------------;*
	LIST		p=16F887		;Tipo de microcontrolador						;*
	INCLUDE 	P16F887.INC		;Define los SFRs y bits del P16F887				;*
																				;*
	__CONFIG _CONFIG1, _CP_OFF&_WDT_OFF&_INTOSCIO								;*
	errorlevel	 -302			;Deshabilita mensajes de advertencia por cambio ;*
								;bancos											;*
;----------------------------Declaracion de variables---------------------------;*
	CBLOCK	0X20																;*
	tempTMR0					;almacena el valor inicial del TMR0				;*
	columna						;registro que indica la columna a mostrar		;*
	desp						;indica el desplazamiento dentro de la tabla	;*
	ocho						;Variable usada para obtener hasta maximo 8		;*
								;valores de la tabla para mostrar en la matriz	;*
	temp						;Determina el retardo entre fotogramas			;*
	d1							;Variables para los retardos 					;*
	d2																			;*
	d3																			;*
	ENDC																		;*
;-----------------------------INICIO DEL PROGRAMA-------------------------------;*
	ORG 	0x00			; Comienzo del programa (Vector de Reset)			;*
	GOTO	MAIN																;*
	ORG		0X04			; Comienzo de las interrupciones (Vector de Int)	;*
	GOTO	INTER																;*
;-----------------------------------TABLAS--------------------------------------;*
IMAGENES																		;*
;MUÑECO_01 (desp=0)																;*
	ADDWF   PCL,F																;*
    RETLW   0xEF																;*
	RETLW	0xEF																;*
	RETLW	0x2C																;*
	RETLW	0x03																;*
	RETLW	0x03																;*
	RETLW	0x2C																;*
	RETLW	0xEF																;*
	RETLW	0xEF																;*
;MUÑECO_02 (desp=8)																;*
    RETLW   0xEF																;*
	RETLW	0xEF																;*
	RETLW	0x2C																;*
	RETLW	0x03																;*
	RETLW	0x03																;*
	RETLW	0x2C																;*
	RETLW	0xDF																;*
	RETLW	0xBF																;*
;En desplazamiento de letras, se debe poner los valores al reves en la tabla	;*
;'__','JM', 'LR','__' para que salga un mensaje como '  JMLR  '					;*
;LETRAS --	(desp=16)															;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
;LETRAS JM	(desp=24)															;*
	RETLW   0x00																;*
	RETLW	0x97																;*
	RETLW	0x94																;*
	RETLW	0xF4																;*
	RETLW	0x94																;*
	RETLW	0xF7																;*
	RETLW	0x00																;*
	RETLW	0x00																;*
;LETRAS LR	(desp=32)															;*
	RETLW   0x00																;*
	RETLW	0x27																;*
	RETLW	0x21																;*
	RETLW	0x21																;*
	RETLW	0x51																;*
	RETLW	0x89																;*
	RETLW	0x00																;*
	RETLW	0x00																;*
;LETRAS --	(desp=40)															;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
	RETLW	0xFF																;*
;-------------------------------------------------------------------------------;*
;*********************************************************************************

;**************************Funciones de Interrupciones****************************
;----------------------------Interrupcion principal-----------------------------;*
;Selecciona la interrupcion adecuada											;*
INTER																			;*
	BTFSC		INTCON, RBIF	;Salta a una funcion de interrupcion			;*
	GOTO		INTRB			;dependiendo de cual bandera se activo			;*
	BTFSC		INTCON,T0IF		;RBIF -> Bandera de cambio de estado del PORTB	;*
	GOTO		INTTMR0			;T0IF -> Bandera de desbordamiento del TMR0		;*
	RETFIE																		;*
;-----------------------------Interrupcion del PORTB----------------------------;*
;Cada vez que se activa un switch el PIC se reinicia							;*
;Es decir detiene cualquier funcion anterior y ejecuta la nueva					;*
INTRB																			;*
	CLRF		PORTC			;apaga la matriz								;*
	BANKSEL		WDTCON															;*
	MOVLW		.1																;*
	MOVWF		WDTCON			;Activa el perro Guardian						;*
CICLO							;Lazo infinito para que se desborde el perro	;*
	GOTO		CICLO			;guardian y se reinicie el PIC					;*
	 RETFIE																		;*
;------------------------------Interrupcion del TMR0----------------------------;*
;Genera una onda cuadrada a traves del pin RE2									;*
;El frecuencia de la onda cuadrada dependerá del sonido a emitir				;*
INTTMR0																			;*
	BCF			INTCON,T0IF		;se encera la bandera del TMR0					;*
	BTFSC		PORTE,2			;verifica el valor anterior de RE2,				;*
	GOTO		hacer0			;si estaba en alto lo pasa a bajo y viceversa	;*
	BSF			PORTE,2															;*
	MOVF		tempTMR0,w		;tempTMR0 es una variable que almacena el		;*
	MOVWF		TMR0			;valor inicial que debe tener el TMR0			;*
	RETFIE						;para que genere una interrupción cada 			;*
hacer0							;semiperiodo de la nota musical a emitir		;*
	BCF			PORTE,2															;*
	MOVF		tempTMR0,w														;*
	MOVWF		TMR0															;*
	RETFIE																		;*
;-------------------------------------------------------------------------------;*
;*********************************************************************************

;*******************************CODIGO PRINCIPAL**********************************
;------------------------inicializacion de registros SFR------------------------;*
MAIN																			;*
	BANKSEL 	OPTION_REG														;*
	MOVLW		0X01															;*
	MOVWF		OPTION_REG		;SE LE ASIGNA EL PRESCALADOR 1:4 AL TMR0 		;*
								;Y QUE FUNCIONE COMO TEMPORIZADOR Y SE ACTIVA	;*
								;LAS RESISTENCIAS DE PULLUP DEL PORTB			;*
	MOVLW		0X88															;*
	MOVWF		INTCON			;HABILITA INTERRUP. POR CAMBIO DE ESTADO PORTB	;*
	CLRF		TRISC															;*
	CLRF		TRISD															;*
	CLRF		TRISE															;*
	BANKSEL		ANSEL															;*
	CLRF		ANSEL			; configura puertos con entradas digitales		;*
	CLRF		ANSELH			; configura puertos con entradas digitales		;*
	BANKSEL 	PORTB															;*
	MOVF		PORTB,F															;*
	CLRF		PORTC															;*
	CLRF		PORTD															;*
	CLRF		PORTE															;*
	BANKSEL		IOCB															;*
	MOVLW		.7																;*
	MOVWF		IOCB															;*
	BCF			STATUS,RP0		;regresa al banco cero							;*
;--------------------------inicializacion de variables--------------------------;*
	MOVLW		.1																;*
	MOVWF		columna															;*
;---------------------------------lazo infinito---------------------------------;*
;Si PORTB=0xFF entonces ningun switch esta activado y no hace nada				;*
;Sino verfica cual bit esta en cero y salta a la subrutina correspondiente		;*
LOOP																			;*
	MOVLW		0X08															;*
	MOVWF		ocho															;*
	MOVLW		0XFF			;W=255											;*
	XORWF		PORTB,W			;operacion xor entre PORTB y 255 si son iguales	;*
								;la bandera Z se activa							;*
	BTFSC		STATUS,Z														;*
	CLRF		PORTC			;Apaga la matriz 								;*
	BTFSC		STATUS,Z		;y regresa al LOOP								;*
	GOTO		LOOP															;*
																				;*
	BTFSS		PORTB,0															;*
	GOTO		MOV1															;*
	BTFSS		PORTB,1															;*
	GOTO		MOV4															;*
	BTFSS		PORTB,2															;*
	GOTO		MUSIC1															;*
	GOTO		LOOP															;*
;-------------------------------------------------------------------------------;*
;*********************************************************************************

;***********************************SUBRUTINAS************************************
;-----------------------------SUBRUTINAS DE RETARDOS----------------------------;*
;----------------------------------retardo 1 ms---------------------------------;*
delay1ms																		;*
	MOVLW		.249															;*
	MOVWF		d1																;*
loop1ms																			;*
	NOP																			;*
	DECFSZ		d1,F															;*
	GOTO		loop1ms															;*
	RETURN																		;*
;-------------------------------retardo 1 segundo-------------------------------;*
delay1seg																		;*
	movlw	0x07																;*
	movwf	d1																	;*
	movlw	0x2F																;*
	movwf	d2																	;*
	movlw	0x03																;*
	movwf	d3																	;*
delay_1seg_0																	;*
	decfsz	d1, f																;*
	goto	$+2																	;*
	decfsz	d2, f																;*
	goto	$+2																	;*
	decfsz	d3, f																;*
	goto	delay_1seg_0														;*
	goto	$+1																	;*
	goto	$+1																	;*
	goto	$+1																	;*
	return																		;*
;------------------------------SUBRUTINAS MUSICALES-----------------------------;*
;-------------------------------------nota do-----------------------------------;*
DO																				;*
	MOVLW	0X11																;*
	MOVWF	TMR0																;*
	MOVWF	tempTMR0															;*
	RETURN																		;*
;-------------------------------------nota re-----------------------------------;*
RE																				;*
	MOVLW	0X2C																;*
	MOVWF	TMR0																;*
	MOVWF	tempTMR0															;*
	RETURN																		;*
;-------------------------------------nota mi-----------------------------------;*
MI																				;*
	MOVLW	0X42																;*
	MOVWF	TMR0																;*
	MOVWF	tempTMR0															;*
	RETURN																		;*
;-------------------------------------nota fa-----------------------------------;*
FA																				;*
	MOVLW	0X4D																;*
	MOVWF	TMR0																;*
	MOVWF	tempTMR0															;*
	RETURN																		;*
;------------------------------------nota sol-----------------------------------;*
SOL																				;*
	MOVLW	0X60																;*
	MOVWF	TMR0																;*
	MOVWF	tempTMR0															;*
	RETURN																		;*
;-------------------------------------nota la-----------------------------------;*
LA																				;*
	MOVLW	0X72																;*
	MOVWF	TMR0																;*
	MOVWF	tempTMR0															;*
	RETURN																		;*
;-------------------------------------nota si-----------------------------------;*
SI																				;*
	MOVLW	0X82																;*
	MOVWF	TMR0																;*
	MOVWF	tempTMR0															;*
	RETURN																		;*
;----------------------------------nota do agudo--------------------------------;*
do																				;*
	MOVLW	0X88																;*
	MOVWF	TMR0																;*
	MOVWF	tempTMR0															;*
	RETURN																		;*
;-----------------------------SUBRUTINAS PARA MATRIZ----------------------------;*
;--------------------------------muñeco saludando-------------------------------;*
;Realiza dos fotogramas o  imagenes secuenciales								;*
MOV1																			;*
	CLRF		desp			;desp = 0 -> primer bloque de la tabla			;*
	CLRF		temp															;*
;Fotograma 1 (mano horizontal)													;*
MOV1_1																			;*
	MOVF		columna,W														;*
	MOVWF		PORTC			;enciende la columna de la derecha				;*
	MOVF		desp,W			;busca el valor en la tabla						;*
	CALL		IMAGENES														;*
	MOVWF		PORTD			;enciende las filas dependiendo del valor		;*
	CALL		delay1ms														;*
	INCF		desp,f			;incrementar para obtener el sgt valor de la 	;*
								;tabla											;*
	BCF			STATUS,C														;*
	RLF			columna,f		;selecciona la siguiente columna				;*
	MOVF		STATUS,W														;*
	ANDLW		0x01															;*
	IORWF		columna,F														;*
	DECFSZ		ocho,F			;realiza 8 iteraciones para escoger unicamente	;*
	GOTO		MOV1_1			;los valores correspondientes a las 8 columnas	;*
																				;*
	MOVLW		.8																;*
	MOVWF		ocho															;*
	SUBWF		desp,F			;resta los 8 desplazamientos anteriores			;*
	DECFSZ		temp,F			;y repite el proceso 255 veces					;*
	GOTO		MOV1_1															;*
																				;*
;Fotograma 2 (mano levantada)													;*
	CLRF		temp															;*
	MOVLW		.8																;*
	MOVWF		desp			;desp = 8 -> segundo bloque de la tabla			;*
	MOVWF		ocho															;*
MOV1_2																			;*
	MOVF		columna,W														;*
	MOVWF		PORTC															;*
	MOVF		desp,W															;*
	CALL		IMAGENES														;*
	MOVWF		PORTD															;*
	CALL		delay1ms														;*
	INCF		desp,f															;*
	BCF			STATUS,C														;*
	RLF			columna,f														;*
	MOVF		STATUS,W														;*
	ANDLW		0x01															;*
	IORWF		columna,F														;*
	DECFSZ		ocho,F															;*
	GOTO		MOV1_2															;*
																				;*
	MOVLW		.8																;*
	MOVWF		ocho															;*
	SUBWF		desp,F															;*
	DECFSZ		temp,F															;*
	GOTO		MOV1_2															;*
	GOTO		LOOP															;*
;----------------------------Desplazamiento de letras---------------------------;*
MOV4																			;*
	MOVLW		0X40															;*
	MOVWF		temp															;*
	MOVLW		.40																;*
	MOVWF		desp			;desp = 40 -> sexto bloque de la tabla			;*
;Fotograma base (Flechas)														;*
MOV4_1																			;*
	MOVF		columna,W														;*
	MOVWF		PORTC															;*
	MOVF		desp,W															;*
	CALL		IMAGENES														;*
	MOVWF		PORTD															;*
	CALL		delay1ms														;*
	INCF		desp,f															;*
	BCF			STATUS,C														;*
	RLF			columna,f														;*
	MOVF		STATUS,W														;*
	ANDLW		0x01															;*
	IORWF		columna,F														;*
	DECFSZ		ocho,F															;*
	GOTO		MOV4_1															;*
																				;*
	MOVLW		.8																;*
	MOVWF		ocho															;*
	SUBWF		desp,F															;*
	DECFSZ		temp,F															;*
	GOTO		MOV4_1															;*
																				;*
;Desplazamiento de las letras													;*
	MOVLW		0X40															;*
	MOVWF		temp															;*
	DECF		desp,F															;*
	MOVLW		.15																;*
	XORWF		desp,W															;*
	BTFSS		STATUS,Z														;*
	GOTO		MOV4_1															;*
	GOTO		LOOP															;*
;------------------------------SUBRUTINAS PARA AUDIO----------------------------;*
;----------------------------------escala musical-------------------------------;*
MUSIC1																			;*
	BSF			INTCON,T0IE														;*
	CALL		DO																;*
	CALL		delay1seg														;*
	CALL		RE																;*
	CALL		delay1seg														;*
	CALL		MI																;*
	CALL		delay1seg														;*
	CALL		FA																;*
	CALL		delay1seg														;*
	CALL		SOL																;*
	CALL		delay1seg														;*
	CALL		LA																;*
	CALL		delay1seg														;*
	CALL		SI																;*
	CALL		delay1seg														;*
	CALL		do																;*
	CALL		delay1seg														;*
																				;*
	BCF			INTCON,T0IE														;*
	GOTO		LOOP															;*
;-------------------------------------------------------------------------------;*
;*********************************************************************************
	END					; fin del programa


