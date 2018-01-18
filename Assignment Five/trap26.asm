; Takahiro Shimokobe
; CSC 225
; Professor Planck

; This trap has three purposes:

; a) Save the PC from UP1 into a hard-coded memory location (x32FF)
; b) Turn on the interrupt enable bit in the KBSR
; c) JMP to UP2

		.ORIG x3300

		STI 	R7, 	UC1PC	  	; Store into R7 the PC from UP1 into x32FF
		ST 		R2, 	SaveR2		; SaveR2 so you can restore it.
		LD 		R2, 	BIT			; Load the enabled bit into R2.
		STI 	R2, 	KBSR		; Store enabled interrupt into KBSR memory.
		LD 		R1, 	UP2PC		; Store address of UP2 into KBSR
		JMP 	R1					; Jumps to UP2 using R1 as your register

		UC1PC   .FILL 	x32FF		; PC of UC1
		UC2PC 	.FILL 	x3400 		; PC of UC2
		KBSR	.FILL	xFE00 		; Keyboard status register
		BIT 	.FILL 	x4000 		; Enabled bit
		SaveR2 	.FILL 	#0  		; Saves R2

		.END