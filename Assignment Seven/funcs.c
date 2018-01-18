/*
Takahiro Shimokobe
Professor Planck
CSC 225
Assignment 7

Description: 
*/

/* This function counts backward from x to 1 by one. 
For example, calling this function with a vlaue of 5 should result in the following output:
	5, 4, 3, 2, 1
*/


void countBackwardFrom(int x){
	printf("%d", x);
	if (x != 0)
		countBackwardFrom(x-1);
		x -= 1;
}

void countForwardTo(int x){
	printf("%d", x - (x-1));
}

int main(void){
	countBackwardFrom(5);
}