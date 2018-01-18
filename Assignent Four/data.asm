; Takahiro Shimokobe
; CPE 225 

; Description - This is data for my quiz.asm file. I am storing this information in memory so my quiz.asm can access it. This file contains my questions and results.

		.ORIG		x3300

; These are the data for my questions, as well as the points correlated with the answers.  

Q1		.STRINGZ	"\nWhich iconic meme resonates with you the most?\n 	1 - Grumpy Cat\n 	2 - Philosoraptor\n 	3 - Success Kid\n 	4 - Y U NO\n"
Q1P		.FILL 		#1
		.FILL 		#71
		.FILL		#3
		.FILL 		#10

Q2		.STRINGZ	"\nWhich of these foods do you enjoy the most?\n 	1 - Extremely Hot Wings\n 	2 - Durian\n 	3 - Salad\n 	4 - Grilled Chicken\n"
Q2P		.FILL 		#10
		.FILL		#7
		.FILL 		#1
		.FILL		#4

Q3		.STRINGZ	"\nIf you had to get a piercing, which of these locations would you choose?\n 	1 - Nipples\n 	2 - Earlobe\n 	3 - Nose\n 	4 - Lip\n"
Q3P	 	.FILL		#10
	 	.FILL		#1
	 	.FILL		#5
	 	.FILL		#8

; Below are my results. The higher the result, the more edgy you are. 

Result1	.STRINGZ	"\nYou could use more spice in your life.\n"
Result2	.STRINGZ	"\nYou are about average.\n"
Result3	.STRINGZ	"\nThere's an edge to you...\n"
Result4	.STRINGZ	"\nGod damn! That's edgy.\n"

		.END
