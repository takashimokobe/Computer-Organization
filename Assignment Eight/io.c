/* 

Description: File I/O. Opens the file that was given as input parameter to your program (argv[1])
			 Reads through the file and prints out: 
			 	The longest line
			 	The number of characters in the longest line
			 	And the number of total lines in the file. 
			 	(Use fgets to read each line from the file and print the line out to screen)
*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	char line[300];
	char longestline[300];

	char const *const filename = argv[1];
	FILE *fpointer = fopen(filename, "r");

	strcpy(longestline, "");

	while (fgets(line, sizeof(line), fpointer)!=NULL)
		if (strlen(line) > strlen(longestline))
			strcpy(longestline, line);
	printf("%s", longestline);
}