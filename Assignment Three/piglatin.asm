; Taka Shimokobe
; CSC 225

; Background:


; Your program will translate words from English to Pig Latin. 
; To translate to Pig Latin, remove the starting letter of the word and put it at the end. Then add "ay" to the word. 

; Description:

; "Program should prompt the user for the word to be translated."
; Input a word of no more than 19 characters, followed by the <enter> key. Assume the user will not enter a message longer than 19 characters. 

; R0: temp storage for WORD
; R1: storage
; R2: temp just in case
; R3: pointer to words

			.ORIG 	x3000			; Start at memory location x3000

START			AND 	R1, R1, #0		; Clear Register 1
			AND 	R2, R2, #0		; Clear Register 2

			LEA 	R3, WORD 		; R3 is pointer to characters

; Start of the prompt message

			LEA 	R0, PROMPT  		; gets the address of PROMPT
			PUTS				; Prints the Prompt
			
LOOP			GETC 				; Read a character into the keyboard
			OUT				; Write the character to the monitor
			ADD  	R1, R0, #-10		; Check to see if ENTER key has been pressed
			BRz		NEXT		; If enter has been pressed, skip to pig latin translation
			STR 	R0, R3, #0		; Stores the pointer in R0
			ADD 	R3, R3, #1 		; Increment the pointer
			BRnzp 	LOOP			; Check the next character


NEXT			STR	R1, R3, #0		; Store R3 into R1
			ADD 	R3, R3, #1		; Increment pointer
			STR	R3, R3, #0		; Store R3
			
			LEA 	R0, PROMPT2		; Load the address of prompt 2.
			PUTS				; Print it out
			LEA	R0, WORD		; Load the address of WORD into R0.
			ADD 	R0, R0, #1		; Increment to next character
			PUTS				; Prints out the rest of the word
			
			
			LEA 	R0, WORD		; Load the address of word into R0
			LDR 	R0, R0, #0		; Load the data of first char into R0
			OUT				; Print char
			LEA 	R0, Ay			; load address of "ay"
			PUTS				; add it to word

			BRnzp	START			; Redo process

 			HALT
	
WORD			.BLKW 	#21
Ay 			.STRINGZ "ay\n"
PROMPT 			.STRINGZ "English Word: "
PROMPT2			.STRINGZ "Pig-Latin Word: "

			.END


