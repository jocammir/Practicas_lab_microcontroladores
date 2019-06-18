


;*********************************************************************
;     ENCENDIDO Y APAGADO DE LEDS EN PORTB USANDO RETARDOS
;*********************************************************************
; 		NOMBRE:			p2_ret.asm
;		FECHA:				31/05/2010
;		VERSION:			1.00
;		PROGRAMADOR:		Carlos Valdivieso
;*********************************************************************
;					DESCRIPCION: 
; Este es similar al p1_led.asm con la novedad que ahora no se usa el 
; interruptor en RA0 sino que se crean retardos de tiempo con la 
; instrucción "decfsz  counter" (decremente la variable counter y salte  
; si es cero). Dicha instrucción decrementa el file counter, previamente 
; cargado con FFh hasta 00h. Cuando counter alcanza el valor de cero
; se salta la próxima instrucción y continúa el programa, esto permite
; que se genere un retardo que depende del reloj y del valor cargado en 
; counter. El mismo retardo se usará para mantener los LEDs
; encendidos o apagados . 
; En este ejercicio el reloj parte a una velocidad de 4MHz porque
; se usa un oscilador externo, para luego por software seleccionar
; el reloj interno a 32KHz mediante el registro OSCON.
;*********************************************************************

	LIST		p=16F887		;Tipo de microcontrolador
	INCLUDE 	P16F887.INC	;Define los SFRs y bits del 
								;P16F887

	__CONFIG _CONFIG1, _CP_OFF&_WDT_OFF&_XT_OSC	
								;Setea parámetros de 
								;configuración

	errorlevel	 -302			;Deshabilita mensajes de 
						;advertencia por cambio 
						;bancos
;*********************************************************************	
;DEFINICION DE VARIABLES
; las variables en el 16F887 pueden escribirse a partir de la 
;posición de memoria de datos 0x20

       cblock  0x20            ; Block of variables starts at address 20h
       counter                	; Variable "counter" at address 20h
       endc
;************************************************************************
;INICIO DEL PROGRAMA
       org     0x00   	      ; Address of the first program instruction
        
       banksel OSCCON 	; Selects memory bank containing
                               		; register OSCCON
       bcf     OSCCON,6   	; Selects internal oscillator LFINTOSC with
       bcf     OSCCON,5    ; the frequency of 31KHz
       bcf     OSCCON,4
       bsf     OSCCON,0     ; Microcontroller uses internal oscillator

;SETEO DE PUERTOS        
        banksel 	TRISB     ; Selects bank containing register TRISB
        clrf    		TRISB     ; All port B pins are configured as outputs
        banksel 	 ANSEL
	 clrf	       ANSEL
	 clrf		 ANSELH
        banksel 	 PORTB   ; Selects bank containing register PORTB

;INICIALIZACION DE VARIABLES
	clrf		PORTB
	clrf		counter
	
;DESARROLLO DEL PROGRAMA      
;se cargan patrones alternados de unos y ceros en el puerto B
;entre cada patrón de números se llama a un retardo.

inicio
       movlw   B'01010101' ; Binary number 01010101 is written to W
       movwf   PORTB    	   ; Number is moved to PORTB
       movlw   h'FF'  		   ; Number hFF is moved to W
       movwf   counter 	   ; Number is moved to variable "counter1"
       call	  retardo
       call	  retardo
       call	  retardo
       movlw   B'10101010' ; Binary number 10101010 is moved to W
       movwf   PORTB   	   ; Number is moved to PORTB
       movlw   h'FF'     	   ; Number hFF is moved to W
       movwf   counter   	   ; Number is moved to variable "counter1"
       call        retardo
       goto       inicio
	
retardo
       decfsz  	counter    	; Variable "counter1" is decremented by 1
       goto    	retardo          ; remains in loop retardo
       return                        	

       end                     	; End of program;
************************************************************************






