;********************************************************************
; LECTURA DE SWITCH EN PORTA Y ENCENDIDO DE LEDS EN PORTB
;********************************************************************
; 		NOMBRE:			p1_led.asm
;		FECHA:			26/05/2010
;		VERSION:			1.00
;		PROGRAMADOR:		Carlos Valdivieso
;********************************************************************
;				DESCRIPCION: 
; Se coloca un interruptor en RA0. Cuando RA0=1 en el Puerto B 
; deberá leerse el valor hexadecimal AA y cuando RA0=0 deberá
; cambiar al valor hexadecimal 55. 
;********************************************************************

	LIST		p=16F887		; Tipo de microcontrolador
	INCLUDE 	P16F887.INC		; Define los SFRs y bits del							; P16F887
;dice donde esta guardada la info del pic
	__CONFIG _CONFIG1, _CP_OFF&_WDT_OFF&_XT_OSC	
						; Ingresa parámetros de 
						; Configuración

	errorlevel	 -302			; Deshabilita mensajes de 
						; Advertencia por cambio 
						; Bancos
;*********************************************************************			
; INICIO DEL PROGRAMA 

	ORG 	0x00		; Comienzo del programa (Vector de Reset)
	
; SETEO DE PUERTOS 
	
	BANKSEL 	TRISB	; selecciona el banco conteniendo TRISB ;BANCO DE MEMORIA
	CLRF		TRISB	; puerto B configurado como salida ; LIMPIA --INICIALIZA
	BANKSEL		ANSEL
	CLRF		ANSEL	; configura puertos con entradas digitales
	CLRF		ANSELH	; configura puertos con entradas digitales
	BANKSEL 	PORTB	; selecciona el puerto B como salida
	CLRF		PORTB
	CLRF		PORTA
; DESARROLLO DEL PROGRAMA

LOOP
	BTFSS	PORTA,0		; prueba del bit 0 del puerto A
	GOTO	NUEVO_VALOR	; REDIRECCIONA AL REGISTRO DE LA FUNCION
	MOVLW	B'10101010' 	; mueve 0xAA al registro W(volatil); 170
	MOVWF	PORTB		; pasa el valor al puerto B
	GOTO	LOOP		;BUCLE INDEFINIDO, SE QUEDA EN ESA POSICION
NUEVO_VALOR
	MOVLW	B'01010101' 	; mueve 0x55 al registro W
	MOVWF	PORTB		; pasa el valor al puerto B
	GOTO	LOOP	

	END			; fin del programa





