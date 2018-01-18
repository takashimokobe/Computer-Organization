; Takahiro Shimokobe
; CPE 225
; Assignment 4

; Below are my answers to the assignment questions. 

; 2) Is the KBSR interrupt enabled? The KBSR is mapped to xFE00. 

; The KBSR interrupt is not enabled. 

; 3) Look at the Trap Vector Table. Go to service routine for Trap x21. This is the code to output a character to the monitor. Explain, line by line, what the what is doing. 

; First, the address is stored into R1 so we can come back to that spot in memory so we can return there. 
; We load indirectly the data storage register into R1. 
; We use a polling routine to check if the last bit has been set (is the DSR on?). If it is, then we can move on. 
; We then store the Direct Data register into R0. 
; We restore R1. 
; We then use RET to get out of the TRAP. 

; We are using polling in this example. 

; Create your own trap that gets a string from the user. Before the trap is called, R0 should contain the starting address of where the string should be stored. Your trap should get character from the keyboard and store them in successive memory locations, starting with the address contained in R0. The trap should quit when the user presses the <enter> key. 

; R0: Register where the string's memory address is stored. 
; R1: checker
; R2: temp file 	

		.ORIG	x3300		; Start the program at mem location x3300
		ST 		R0, SaveR0 	; Save your registers so you can come back to them to work on them. 
		ST 		R1, SaveR1
		ST 		R2, SaveR2

Poll	LDI R1, KBSR		; Loads the status register into R0. 
		BRzp	 Poll		; If it is negative, then it has been set. 
		LDI R1, KBDR		; Loads the data register into R1. 
		ADD R2, R1, #-10	; Checks if <enter> has been pressed. 
		BRz 	 FINISH


Poll2 	LDI R2, DSR			; Loads the data status register into R2
		BRzp 	Poll2		; If the bit is negative, then it has been set and you can continue
		STI R1, DDR			; Store into R1 your Display Data Register
		STR  R1, R0, #0		; Store into R1 your data
		ADD R0, R0, #1		; Increment the string pointer memory by one
		BRnzp Poll 			; Go back to poll 1.

FINISH	AND R1, R0, #0		; 
		STR R1, R0, #0
		LD R0, SaveR0 		; Restoring registers
		LD R1, SaveR1
		LD R2, SaveR2
        
        RET

SaveR0	.FILL 	#0
SaveR1	.FILL	#0
SaveR2	.FILL	#0

KBSR	.FILL 	xFE00
KBDR	.FILL 	xFE02
DSR 	.FILL 	xFE04
DDR 	.FILL 	xFE06

		.END

     
