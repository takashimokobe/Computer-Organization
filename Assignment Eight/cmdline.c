/* 

Reads in the cmd-line parameters and verify that there are three parameters. 

*/

#include <stdio.h>

int main(int argc, char *argv[])
{
	if (argc != 3){
		printf("ERROR: Make sure you are entering three parameters!\n");
		return 0;
	}
	else{
		for (i = 0; i < argc; i ++)
			printf("%d", argv[i]);
		printf("\n");
		return 0;
	}
}