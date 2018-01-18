.ORIG x3000
 ; Prompt for the string
TEST LEA R0, PROMPT
 PUTS
 ; call the trap
 LEA R0, STORE
 TRAP x26 ; "get string" trap
 ; print results
 LEA R0, RESULT
 PUTS
 LEA R0, STORE
 PUTS
 BRnzp TEST ; Repeat in endless loop
PROMPT .STRINGZ "\nEnter a word: "
RESULT .STRINGZ "\nYou entered: "
STORE .BLKW 20
 .END


