; Taka Shimokobe
; CSC 225

; Background:

; Your program will translate words from English to Pig Latin. 
; To translate to Pig Latin, remove the starting letter of the word and put it at the end. Then add "ay" to the word. 

; Description:

; "Program should prompt the user for the word to be translated."
; Input a word of no more than 19 characters, followed by the <enter> key. Assume the user will not enter a message longer than 19 characters. 

                        .ORIG   x3000                   ; Start at memory location x3000
START                   AND 	R0, R0, #0
			AND     R1, R1, #0              ; Clear Register 1
                        AND     R2, R2, #0              ; Clear Register 2
                        LEA     R3, WORD                ; R3 is pointer to characters

; Start of the prompt message

                        LEA     R0, PROMPT              ; gets the address of PROMPT
                        PUTS                            ; Prints the Prompt
                        
LOOP                    GETC                            ; Read a character into the keyboard
                        OUT                             ; Write the character to the monitor
                        ADD     R1, R0, #-10            ; Check to see if ENTER key has been pressed
                        BRz             NEXT            ; If enter has been pressed, skip to pig latin
                        STR     R0, R3, #0              ; Stores the pointer in R0
                        ADD     R3, R3, #1              ; Increment the pointer
                        BRnzp   LOOP

NEXT                    STR     R0, R3, #0              ; Stores R3 into R0
                        ADD     R3, R3, #1              ; Increment the word
                        STR     R3, R3, #0              ; Stores the word


	                LEA     R0, PROMPT2             ; Load the address of prompt 2.
                        PUTS                            ; Print it out
			LEA 	R0, WORD
			ADD 	R0, R0, #1
			PUTS
			
			LEA	R0, WORD
			LDR	R0, R0, #0
			OUT
                        LEA     R0, Ay                  ; load "ay"
                        PUTS                            ; print it out

                        BRnzp   START                   ; Redo process

                        HALT
        
WORD                    .BLKW   #20
Ay                      .STRINGZ "ay"
PROMPT                  .STRINGZ "English Word: "
PROMPT2                 .STRINGZ "Pig-Latin Word: "

                        .END