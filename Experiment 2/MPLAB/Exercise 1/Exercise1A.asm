; Access Bank 1
BSF 03h, 5
; Set Inputs
MOVLW 0X05
; Move W to TRISA
MOVWF 85h
; Set Outputs
MOVLW 0X18
; Move W to TRISB
MOVWF 86h
; Go back to Bank 0
BCF 03h, 5
; ==============================
Start:
; Test SW1
BTFSS 06h, 3
goto SW2_OFF ; SW1=0
goto SW2_ON ;SW1=1

; Test SW2
SW2_OFF: ; WHEN SW1=0
BTFSS 06h, 4
goto SW3_OFF_OFF ; SW1=0, SW2=0
goto SW3_OFF_ON; SW1=0, SW2=1

SW2_ON: ; WHEN SW1= 1
BTFSS 06h, 4
goto SW3_ON_OFF ; SW1=1, SW2=0
goto SW3_ON_ON ; SW1=1, SW2=1

; Test SW3
SW3_OFF_OFF: ; SW1=0, SW2=0
BTFSS 05h, 2
goto SW4_OFF_OFF_OFF ;  SW1=0, SW2=0; SW3=0
goto SW4_OFF_OFF_ON ;  SW1=0, SW2=0; SW3=1

SW3_OFF_ON: ; SW1=0, SW2=1
BTFSS 05h, 2
goto SW4_OFF_ON_OFF ;  SW1=0, SW2=1; SW3=0
goto SW4_OFF_ON_ON ;  SW1=0, SW2=1; SW3=1 

SW3_ON_OFF: ; SW1=1, SW2=0
BTFSS 05h, 2
goto SW4_ON_OFF_OFF ;  SW1=1, SW2=0; SW3=0
goto SW4_ON_OFF_ON ;  SW1=1, SW2=0; SW3=1

SW3_ON_ON: ; SW1=1, SW2=1
BTFSS 05h, 2
goto SW4_ON_ON_OFF ;  SW1=1, SW2=1; SW3=0
goto SW4_ON_ON_ON ;  SW1=1, SW2=1; SW3=1

; Test SW4

SW4_OFF_OFF_OFF: ;  SW1=0, SW2=0; SW3=0
BTFSS 05h, 0
goto ON ; SW1=0, SW2=0; SW3=0; SW4= 0
goto OFF ; SW1=0, SW2=0; SW3=0; SW4= 1

SW4_OFF_OFF_ON: ;  SW1=0, SW2=0; SW3=1
BTFSS 05h, 0
goto OFF ; SW1=0, SW2=0; SW3=1; SW4= 0
goto ON ; SW1=0, SW2=0; SW3=1; SW4= 1

SW4_OFF_ON_OFF: ;  SW1=0, SW2=1; SW3=0
BTFSS 05h, 0
goto OFF ; SW1=0, SW2=1; SW3=0; SW4= 0
goto ON ; SW1=0, SW2=1; SW3=0; SW4= 1

SW4_OFF_ON_ON: ;  SW1=0, SW2=1; SW3=1
BTFSS 05h, 0
goto ON ; SW1=0, SW2=1; SW3=1; SW4= 0
goto OFF ; SW1=0, SW2=1; SW3=1; SW4= 1

SW4_ON_OFF_OFF: ;  SW1=1, SW2=0; SW3=0
BTFSS 05h, 0
goto OFF ; SW1=1, SW2=0; SW3=0; SW4= 0
goto ON ; SW1=1, SW2=0; SW3=0; SW4= 1

SW4_ON_OFF_ON: ;  SW1=1, SW2=0; SW3=1
BTFSS 05h, 0
goto ON ; SW1=1, SW2=0; SW3=1; SW4= 0
goto OFF ; SW1=1, SW2=0; SW3=1; SW4= 1

SW4_ON_ON_OFF: ;  SW1=1, SW2=1; SW3=0
BTFSS 05h, 0
goto ON ; SW1=1, SW2=1; SW3=0; SW4= 0
goto OFF ; SW1=1, SW2=1; SW3=0; SW4= 1

SW4_ON_ON_ON: ;  SW1=1, SW2=1; SW3=1
BTFSS 05h, 0
goto OFF ; SW1=1, SW2=1; SW3=1; SW4= 0
goto ON ; SW1=1, SW2=1; SW3=1; SW4= 1    

ON:
BSF 06h, 0
goto Start

OFF:
BCF 06h, 0
goto Start

END