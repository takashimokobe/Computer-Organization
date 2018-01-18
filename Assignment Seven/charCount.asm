; CHAR_COUNT FUNCTION
;


; *************** CHAR_COUNT SETUP *****************************

; int charCount(char *string, char c)

		.ORIG x3300

		ADD R6, R6, -2 	; increment TOS for return value and adress
		STR R7, R6, #0	; Store return address in stack.
		ADD R6, R6, -1 	; increment TOS for the frame pointer.
		STR R5, R6, #0	; Store the frame pointer into the stack.

	; We need to set the new frame pointer and return address

		ADD R5, R6, -1 	; R6 (TOS) points to result 

		ADD R6, R6, -1  ; R5 (frame pointer) is at result as well
		STR R4, R6, #0
	

; *************** CHAR_COUNT CODE *****************************
;   if (*str == 0)

		LDR R2, R5, #4 	; Load the first char in the string (&word[o]) into R2
		LDR R2, R2, #0; ; Load R2 into R2
		ADD R2, R2, #0 	; check if R2 is 0
		BRz FINISH	; if the result is 0, return a 0.

;      result = 0;

;   else { 
;      if (*str == c)
	
		LDR R3, R5, #5	; Load c into R1.
		NOT R3, R3 	; Twos complement of c into R3.
		ADD R3, R3, #1	
		ADD R3, R3, R2 	; string - c

;         result = 1;	

		BRz INCRE		; If it's zero, then you must increment return value.

;      else
;  		   {result = 0}

		AND R1, R1, #0 	; clear out R1 so your result is 0
		BR  AGAIN	

;      result += charCount(str+1, c);

INCRE 		LD R1, ONE
		STR R1, R6, #0 	; Store into R6 your incremented value.

AGAIN		AND R1, R1, #0 	; clear out R1
		LDR R1, R5, #5 	; load the search character into R1
		ADD R6, R6, -1	; increment TOS pointer 
		STR R1, R6, #0	; store the search character into TOS 

		ADD R6, R6, #-1 ; increment the TOS pointer
		LDR R1, R5, #4 	; load the pointer to word[0] into R1
		ADD R1, R1, #1 	; increment string address
		STR R1, R6, #0 	; store the first character in the string to TOS

		LD R0, CHAR_COUNT ; recursively call CHAR_COUNT
		JSRR R0

; caller teardown 

		LDR R0, R6, #0	; get the return value into R0
		LDR R1, R5, #0
		ADD R1, R0, R1
		STR R1, R5, #0	; put the return value back
		ADD R6, R6, #3	; add 3 to TOS for return value, return address, and dynlink


; *************** CHAR_COUNT RETURN *****************************

; callee tear down

FINISH 		LDR R1, R5, #0 ; Load frame pointer into R1
		STR R1, R5, #3 ; Store it

		ADD R6, R6, #1 ; pops off the local variable

		LDR R5, R6, #0 ; pops off the dynamic link
		ADD R6, R6, #1 ;

		LDR R7, R6, #0 ; restores the return address
		ADD R6, R6, #1 ; pops off

		RET

CHAR_COUNT	.FILL x3300
ONE		.FILL #1
        .END
