; Takahiro Shimokobe
; CSC 225
; Professor Planck

; This program displays asterisks to the screen in an endless loop. Adds one to the register each time through the loop. When the register becomes negative, the program prints an asterisk to the screen. Then the register is reset to zero and the loop is started again. 

; R1: counter

		.ORIG	x3400

START 	AND R1, R1, #0		; Resets the register
LOOP	ADD R1, R1, #1		; Increment by 1
		BRzp LOOP			; If it is not negative keep incrementing.
		LD 	R0, AST			; Once it is negative, print * to screen. 
		OUT
		BRnzp START			; Start again. 

		AST	.FILL x002A		; * ASCII

		.END


		