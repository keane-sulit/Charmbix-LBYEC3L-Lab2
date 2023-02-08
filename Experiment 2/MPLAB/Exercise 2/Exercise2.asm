;======================================;
; Author: Charmbix			 		   ;
; Version: 3.0				 		   ;
; Course: LBYEC3F - EK1		 		   ;
; Title: Experiment 2: Exercise 2	   ;
;======================================; 

; Initialization
BSF 03h, 5
MOVLW 0x04
MOVWF 85h
MOVLW 0x4A
MOVWF 86h
BCF 03h, 5

; Outputs
ZERO:
MOVLW 0x1C
MOVWF 05h
MOVLW 0x4B
MOVWF 06h
    goto START

ONE:
MOVLW 0x1F
MOVWF 05h
MOVLW 0xCF
MOVWF 06h
    goto START

TWO:
MOVLW 0x1D
MOVWF 05h
MOVLW 0x6A
MOVWF 06h
    goto START

THREE:
MOVLW 0x1D
MOVWF 05h
MOVLW 0xCA
MOVWF 06h
    goto START

FOUR:
MOVLW 0x1E
MOVWF 05h
MOVLW 0xCE
MOVWF 06h
    goto START

FIVE:
MOVLW 0x1C
MOVWF 05h
MOVLW 0xDA
MOVWF 06h
    goto START

SIX:
MOVLW 0x1C
MOVWF 05h
MOVLW 0x5A
MOVWF 06h
    goto START

SEVEN:
MOVLW 0x1D
MOVWF 05h
MOVLW 0xCF
MOVWF 06h
    goto START

EIGHT:
MOVLW 0x1C
MOVWF 05h
MOVLW 0x4A
MOVWF 06h
    goto START

NINE:
MOVLW 0x1C
MOVWF 05h
MOVLW 0xCA
MOVWF 06h
    goto START

A:
MOVLW 0x1C
MOVWF 05h
MOVLW 0x4E
MOVWF 06h
    goto START

Bseg:
MOVLW 0x1E
MOVWF 05h
MOVLW 0x5A
MOVWF 06h
    goto START

C:
MOVLW 0x1C
MOVWF 05h
MOVLW 0x7B
MOVWF 06h
    goto START

D:
MOVLW 0x1F
MOVWF 05h
MOVLW 0x4A
MOVWF 06h
    goto START

E:
MOVLW 0x1C
MOVWF 05h
MOVLW 0x7A
MOVWF 06h
    goto START

F:
MOVLW 0x1C
MOVWF 05h
MOVLW 0x7E
MOVWF 06h
    goto START

; Inputs
START:
BTFSC 06h, 1
    goto w_ON ; 1 _ _ _
    goto w_OFF ; 0 _ _ _

w_OFF:
BTFSC 06h, 6
    goto x_ON ; 0 1 _ _
    goto x_OFF ; 0 0 _ _

x_OFF:
BTFSC 06h, 3
    goto y_ON ; 0 0 1 _
    goto y_OFF ; 0 0 0 _

y_OFF:
BTFSC 05h, 2
    goto z_ON ; 0 0 0 1
    goto z_OFF ; 0 0 0 0

z_OFF:
    goto ZERO ; 0 0 0 0

z_ON:
    goto ONE ; 0 0 0 1

y_ON:
BTFSC 05h, 2
    goto y_ON_z_ON ; 0 0 1 1
    goto y_ON_z_OFF ; 0 0 1 0

y_ON_z_OFF:
    goto TWO ; 0 0 1 0

y_ON_z_ON:
    goto THREE ; 0 0 1 1

x_ON:
BTFSC 06h, 3
    goto x_ON_y_ON ; 0 1 1 _
    goto x_ON_y_OFF ; 0 1 0 _

x_ON_y_OFF:
BTFSC 05h, 2
    goto x_ON_y_OFF_z_ON ; 0 1 0 1
    goto x_ON_y_OFF_z_OFF ; 0 1 0 0

x_ON_y_OFF_z_OFF:
    goto FOUR ; 0 1 0 0

x_ON_y_OFF_z_ON:
    goto FIVE ; 0 1 0 1

x_ON_y_ON:
BTFSC 05h, 2
    goto x_ON_y_ON_z_ON ; 0 1 1 1
    goto x_ON_y_ON_z_OFF ; 0 1 1 0

x_ON_y_ON_z_OFF:
    goto SIX ; 0 1 1 0

x_ON_y_ON_z_ON:
    goto SEVEN ; 0 1 1 1

w_ON:
BTFSC 06h, 6
    goto w_ON_x_ON ; 1 1 _ _
    goto w_ON_x_OFF ; 1 0 _ _

w_ON_x_OFF:
BTFSC 06h, 3
    goto w_ON_x_OFF_y_ON ; 1 0 1 _
    goto w_ON_x_OFF_y_OFF ; 1 0 0 _

w_ON_x_OFF_y_OFF:
BTFSC 05h, 2
    goto w_ON_x_OFF_y_OFF_z_ON ; 1 0 0 1
    goto w_ON_x_OFF_y_OFF_z_OFF ; 1 0 0 0

w_ON_x_OFF_y_OFF_z_OFF:
    goto EIGHT ; 1 0 0 0

w_ON_x_OFF_y_OFF_z_ON:
    goto NINE ; 1 0 0 1

w_ON_x_OFF_y_ON:
BTFSC 05h, 2
    goto w_ON_x_OFF_y_ON_z_ON ; 1 0 1 1
    goto w_ON_x_OFF_y_ON_z_OFF ; 1 0 1 0

w_ON_x_OFF_y_ON_z_OFF:
    goto A ; 1 0 1 0

w_ON_x_OFF_y_ON_z_ON:
    goto Bseg ; 1 0 1 1

w_ON_x_ON:
BTFSC 06h, 3
    goto w_ON_x_ON_y_ON ; 1 1 1 _
    goto w_ON_x_ON_y_OFF ; 1 1 0 _

w_ON_x_ON_y_OFF:
BTFSC 05h, 2
    goto w_ON_x_ON_y_OFF_z_ON ; 1 1 0 1
    goto w_ON_x_ON_y_OFF_z_OFF ; 1 1 0 0

w_ON_x_ON_y_OFF_z_OFF:
    goto C ; 1 1 0 0

w_ON_x_ON_y_OFF_z_ON:
    goto D ; 1 1 0 1

w_ON_x_ON_y_ON:
BTFSC 05h, 2
    goto w_ON_x_ON_y_ON_z_ON ; 1 1 1 1
    goto w_ON_x_ON_y_ON_z_OFF ; 1 1 1 0

w_ON_x_ON_y_ON_z_OFF:
    goto E ; 1 1 1 0

w_ON_x_ON_y_ON_z_ON:
    goto F ; 1 1 1 1

END