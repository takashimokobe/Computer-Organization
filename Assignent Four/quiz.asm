; Takahiro Shimokobe
; CSC 225

; Description: Create a quiz in LC-3 assembly language. The quiz consists of three questions, each question has four possible answers. Each answer will have a point socre. Keep track of the total points the user accumulates. At the end of the quiz, output the sum of the points to the screen (PUTS a register)

; GetInt: A subroutine to get the integer answer to each question. Subroutine will prompt for an integer, store it in R0, and convert the integer from ASCII to decimal (ADD R1, R1, -#48)

; R0: storage for the integer. 

; GetPoints: A subroutine to determine the point value of each answer. Your code should have stored the value for each answer in consecutive memory locations. 

; R0: The number of the answer (1-4). 
; R1: Memory location of the point value.
; R2: Counter to determine which question we are on. 
; R3: The final score. 

		.ORIG	x3000

; Main code will go here

Start	AND 	R0, R0, #0			; Clearing out all your registers. 
		AND 	R1, R1, #0
		AND 	R2, R2, #0
		AND 	R3, R3, #0

		LD 		R0, Q1 				; Loading the first question. 
		PUTS						; Printing out question 1 to the screen. 
		JSR		GetInt 				; Call to subroutine to get the integer answer to R0.
		LD 		R1, Q1P 			; Loads the point into R1
		JSR		GetPoints 			; Call to subroutine to get the points associated with answer. 

		ADD		R2, R2, #1
		LD		R0, Q2 				; Question 2
		PUTS						
		JSR 	GetInt
		LD      R1, Q2P 		
		JSR		GetPoints

		ADD 	R2, R2, #1

		LD		R0, Q3 				; Question 3
		PUTS
		JSR		GetInt
        LD      R1, Q3P
		JSR 	GetPoints

; Finding out the final score

; Result1 for 0-8

		ADD		R3, R3, #-8
		BRnz	Res1

; Result for 9-16

		ADD		R3, R3, #-8
		BRnz 	Res2

; Result for 17-24

		ADD 	R3, R3, #-8
		BRnz	Res3

; Result for 25 - 30
; Start to print out results and go back to the top. 

Res4	LD 		R0, Result4
		PUTS
		BRnzp 	Start

Res3 	LD 		R0, Result3
		PUTS
		BRnzp 	Start

Res2 	LD 		R0, Result2
		PUTS
		BRnzp	Start

Res1 	LD 		R0, Result1
		PUTS 
		BRnzp 	Start

		HALT

; My subroutines will be defined below

GetInt 	ST 		R1, SaveR1		; Stores R1
		ST 		R7, SaveR7		; Stores R7
		LEA 	R0, CHOSE 		; load the prompt
		PUTS
		GETC					; Gets a Character from the keyboard and puts it into R0
		OUT 					; Stores it
		LD 		R1, DEC
		ADD 	R0, R0, R1
		LD 		R1, SaveR1 		; Restores R1
		LD 		R7, SaveR7 		; Restores R7
		RET 					; JMP R7, goes back to your code. 

GetPoints
		ST 		R0, SaveR0
		ST 		R1, SaveR1
		ST 		R7, SaveR7
		ADD 	R0, R0, #-1 	; Subtract 1 from my input
        ADD     R1, R1, R0 		; Increment my memory by that num
        LDR     R1, R1, #0 		; Load that point data into R1
        ADD     R3, R3, R1 		; Add that number to R3.
        LD      R0, SaveR0
        LD      R1, SaveR1
        LD      R7, SaveR7
        RET

; These are my memory locations for my data

CHOSE	.STRINGZ "You chose: "
DEC 	.FILL 	#-48

Q1		.FILL	x3300

Q2		.FILL	x3379
Q3		.FILL 	x33F4

Q1P		.FILL	x3375
Q2P		.FILL	x33F0
Q3P		.FILL 	x3470

Result1	.FILL 	x3474
Result2	.FILL	x349D
Result3	.FILL 	x34B6
Result4 .FILL 	x34D2

SaveR0  .FILL   #0
SaveR1 	.FILL 	#0
SaveR2  .FILL   #0
SaveR4 	.FILL 	#0
SaveR7	.FILL 	#0

		.END



