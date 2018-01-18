; Takahiro Shimokobe
; CSC 225
; Professor Planck

; This routine services the interrupt for the keyboard device. It has three tasks:

; a) Get the character from the KBDR. Do not use a trap to do this. Do you have to poll the KBSR? Why/why not?

; b) Clear the KBSR (ready bit and interrupt enable bit)

; c) Use RTI to return to UP1. The PC of UP1 needs to be written over the PC of UP2 on the stack. The PC of UP2 will be on the current top of the stack. You MUST use the stack pointer for this operation. 

		.ORIG 	x3500

		ST 		R1, SaveR1 		; Save R1 into memory
		LDI 	R0, KBDR	    ; Load up KBDR data into R0
		LDI 	R1, KBSR 		; Load the KBSR data into R1
		LD 		R1, EMPTY  		; Clears R1
		STI 	R1, KBSR		; Stored the cleared KBSR from R1 into KBSR memory location
		LDI  	R1, UPC1 		; Loads the PC of UP1 into R1
		STR 	R1, R6, #0 		; Store the UP1 PC of R1 into R6 (which has the stack pointer) so it will end up pointing to the PC of UP2.
		LD 		R1, SaveR1 		; restores saved R1 data 
		RTI 					; returns to UP1
		HALT					; Halts program

		UPC1 	.FILL 	x32FF		; address of user program 1
		KBSR 	.FILL 	xFE00 		; KBSR address
		KBDR 	.FILL 	xFE02 		; KBDR address
		SaveR1	.FILL 	#0 			; SaveR1
		EMPTY	.FILL 	#0 			; empty value

		.END