;======================================;
; Author: Charmbix			 		   ;
; Version: 2.0				 		   ;
; Course: LBYEC3F - EK1		 		   ;
; Title: Experiment 2: Exercise 1	   ;
;======================================; 

; INITIALIZING 

BSF 03h, 5 
MOVLW 0x05
MOVWF 85h 
BCF 03h, 5 

BSF 03h, 5 
MOVLW 0x18
MOVWF 86h 
BCF 03h, 5 

; ============================== 

; Test SW1 
Start: 
BTFSS 06h, 3
goto SW1_OFF ; SW1=0 
goto SW1_ON ; SW1=1 

; Test SW2 
SW1_OFF: ; WHEN SW1=0 
BTFSS 06h, 4 
goto SW2_OFF_OFF ; SW1=0, SW2=0 
goto SW2_OFF_ON; SW1=0, SW2=1 

SW1_ON: ; WHEN SW1= 1 
BTFSS 06h, 4 
goto SW2_ON_OFF ; SW1=1, SW2=0 
goto SW2_ON_ON ; SW1=1, SW2=1 

; Test SW3 
SW2_OFF_OFF: ; WHEN SW1=0, SW2=0 
BTFSS 05h, 2 
goto SW3_OFF_OFF_OFF ; SW1=0, SW2=0; SW3=0 
goto SW3_OFF_OFF_ON ; SW1=0, SW2=0; SW3=1 

SW2_OFF_ON: ; WHEN SW1=0, SW2=1 
BTFSS 05h, 2 
goto SW3_OFF_ON_OFF ; SW1=0, SW2=1; SW3=0 
goto SW3_OFF_ON_ON ; SW1=0, SW2=1; SW3=1 

SW2_ON_OFF: ; WHEN SW1=1, SW2=0 
BTFSS 05h, 2 
goto SW3_ON_OFF_OFF ; SW1=1, SW2=0; SW3=0 
goto SW3_ON_OFF_ON ; SW1=1, SW2=0; SW3=1 

SW2_ON_ON: ; WHEN SW1=1, SW2=1 
BTFSS 05h, 2 
goto SW3_ON_ON_OFF ; SW1=1, SW2=1; SW3=0 
goto SW3_ON_ON_ON ; SW1=1, SW2=1; SW3=1 

; Test SW4
SW3_OFF_OFF_OFF: ; WHEN SW1=0, SW2=0; SW3=0 
BTFSS 05h, 0 
goto ON ; SW1=0, SW2=0; SW3=0; SW4= 0 
goto OFF ; SW1=0, SW2=0; SW3=0; SW4= 1 

SW3_OFF_OFF_ON: ; WHEN SW1=0, SW2=0; SW3=1 
BTFSS 05h, 0 
goto OFF ; SW1=0, SW2=0; SW3=1; SW4= 0 
goto ON ; SW1=0, SW2=0; SW3=1; SW4= 1 

SW3_OFF_ON_OFF: ; WHEN SW1=0, SW2=1; SW3=0 
BTFSS 05h, 0 
goto OFF ; SW1=0, SW2=1; SW3=0; SW4= 0 
goto ON ; SW1=0, SW2=1; SW3=0; SW4= 1 

SW3_OFF_ON_ON: ; WHEN SW1=0, SW2=1; SW3=1 
BTFSS 05h, 0 
goto ON ; SW1=0, SW2=1; SW3=1; SW4= 0 
goto OFF ; SW1=0, SW2=1; SW3=1; SW4= 1

SW3_ON_OFF_OFF: ; WHEN SW1=1, SW2=0; SW3=0 
BTFSS 05h, 0 
goto OFF ; SW1=1, SW2=0; SW3=0; SW4= 0 
goto ON ; SW1=1, SW2=0; SW3=0; SW4= 1 

SW3_ON_OFF_ON: ; WHEN SW1=1, SW2=0; SW3=1 
BTFSS 05h, 0 
goto ON ; SW1=1, SW2=0; SW3=1; SW4= 0 
goto OFF ; SW1=1, SW2=0; SW3=1; SW4= 1 

SW3_ON_ON_OFF: ; WHEN SW1=1, SW2=1; SW3=0 
BTFSS 05h, 0 
goto ON ; SW1=1, SW2=1; SW3=0; SW4= 0 
goto OFF ; SW1=1, SW2=1; SW3=0; SW4= 1 

SW3_ON_ON_ON: ; WHEN SW1=1, SW2=1; SW3=1 
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