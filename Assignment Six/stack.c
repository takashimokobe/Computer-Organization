/*
Takahiro Shimokobe
Professor Planck
CSC 225
Assignment 6: Stack

Description: Our stack function will be implemented here. 

*/
#include <stdio.h>
#include "stack.h"

int stack[SIZE];
int top = 0;
int i;

/* Define functions */

/* Pushes a value to the top of the stack. If the stack has 10 items on it, and you try to push, overflow occurs. */
int push (int value){
	if (top  >= SIZE)
		return 1;
	else
		stack[top] = value;
		top = top + 1;
		return 0;
}

/* Takes in the address of the value, and pops it off. If there is nothing to pop, underflow occurs.*/
int pop (int *value){
	if (top == 0)
		return 1;
	else
		top = top - 1;
		*value = stack[top];
		return 0;
}

/* Takes one argument - the format in which you want the elements printed out. 
0 = decimal, 1 = hex, 2 = characters.*/
void printStack(int format){
    switch(format){
      case 0:
	 	for (i = 0; i < top; i ++)
	       printf("%d ", stack[i]);
           break;
      case 1:
	 	for (i = 0; i < top; i ++)
	       printf("%x ", stack[i]);
           break;
      case 2:
         for (i = 0; i < top; i ++)
	       printf("%c ", stack[i]);
           break;
    }       
}

