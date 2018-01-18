; Taka Shimokobe
; CSC 225
; Professor Planck

; This program simply echoes five characters to the screen. The program gets a character from the keyboard using trapx26. Trap x26 will put the input character into R0. The character is echoed to the screen using trapx21(OUT). Modify the program to 

; a) Load the location of Trap 26 into memory location x0026 of the trap vector table.

; b) Load the location of the interrupt service routine into location x0180 of the interrupt vector table. x0180 is the locatio of the keyboard interrupt vector. 

; c) Initialize the stack pointer. The stack pointer is stored in R6. Set the value of R6 to x3000. This is where we will start out stack. 

; Start of code

			.ORIG	x3000

			LD 		R1, TRAPCODE ; Load into R1 where the Trap 26 code starts. 
			LD 		R2, TRAPLOC ; Load into R2 the trap vector 26. 

			STR 	R1, R2, #0	; Store the trap code into vector table at x26

			LD 		R1, INTERUPT ; Load the interrupt code into R1. 
			LD 		R2, KEYLOC   ; Load the interrupt location in R2. 

			STR 	R1, R2, #0 	; Store the interupt code into the interupt table. 

			LD 		R6, STACKPTR	; Initialize stack pointer to x3000. 

LOOP		TRAP	x26  ; get char
			TRAP	x21  ; print char to screen
			TRAP	x26  ; get char
			TRAP	x21  ; print char to screen
			TRAP	x26  ; get char
			TRAP	x21  ; print char to screen
			TRAP	x26  ; get char
			TRAP	x21  ; print char to screen
			TRAP	x26  ; get char
			TRAP	x21  ; print char to screen
			LEA	R0, END_MSG
			PUTS
			BRnzp LOOP

END_MSG 	.STRINGZ "\nSuccess!  Running again...\n"

TRAPCODE 	.FILL	x3300
TRAPLOC		.FILL 	x0026
KEYLOC 		.FILL 	x0180
INTERUPT 	.FILL 	x3500
STACKPTR	.FILL 	x3000

        	.END