/* 
Takahiro Shimokobe
Professor Planck
CSC 225
Assignment 6

Description: Our main file, where we will be implementing a stack using C. 

*/
#include <stdlib.h>
#include "stack.h"

int main(void){

	char input;
	int mode = 0; /* The mode should start off as decimal. */
	int value;

	printf("Welcome to the stack program.");

	do{
		printf("\n\nEnter option: ");
		scanf(" %c", &input);
		switch(input){
			case 'u':
				printf("What number? ");
				scanf("%d", &value);
				if (push(value) == 1)
					printf("Overflow!!!\n");
				printf("Stack: ");
				printStack(mode);
				break;
			case 'o':
				if (pop(&value) == 1)
					printf("Underflow!!!\n");
				else
					printf("Popped %d\n", value);
				printf("Stack: ");
				printStack(mode);
				break;
			case 'h':
				mode = 1;
				printf("Stack: ");
				printStack(mode);
				break;
			case 'd':
				mode = 0;
				printf("Stack: ");
				printStack(mode);
				break;
			case 'c':
				mode = 2;
				printf("Stack: ");
				printStack(mode);
				break;		
			}
	} while (input != 'x');

	printf("Goodbye!\n");

    return 0;
}
