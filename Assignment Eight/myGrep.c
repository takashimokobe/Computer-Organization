/*
 
Takahiro Shimokobe
CSC 225
Professor Planck
Assignment 8

Description: This program should parse an input file searching for the occurances of a word. The output should be the number of occurances and each line the world appears in. 

*/

#include <stdio.h>
#include <stdlib.h>
#include "myGrep.h"

int i;
char line[MAX];
char longline[MAX];
int linenum = 0;

int main(int argc, char *argv[])
{  
 if (cmdLine(argc, argv)==0)
  return 1;
io(argc, argv);
grep(argc, argv);
return 0;
}

int cmdLine(int argc, char *argv[])
{
  FILE *fpointer = fopen(argv[1], "r");

  if (argc != 3){
    printf("myGrep: improper number of arguments\n");
    printf("Usage: %s <filename> <word>\n", argv[0]);
    return 0;
  }
  else if(fpointer == NULL){
    printf("Unable to open file: %s\n", argv[1]);
    return 0;
  }
  else{
   for (i = 0; i < argc; i ++)
     printf("%s ", argv[i]);
   printf("\n");
   return 1;
 }
}

int io(int argc, char *argv[])
{
 FILE *fpointer = fopen(argv[1], "r");

 while(fgets(line, sizeof(line), fpointer) != NULL){
  linenum++;
  if (strlen(line) > strlen(longline))
   strcpy(longline, line);
}

printf("longest line: %s", longline);
printf("num chars: %d\n", (int)strlen(longline));
printf("num lines: %d\n", linenum);
return 0;
}

/* Utilizes a linked list to print out the total occurances of the word in the text file.*/

int grep(int argc, char *argv[])
{ 
 int numtimes, lineNum;
 char *pointer;
 char sline[MAX];
 FILE *fpointer = fopen(argv[1], "r");

 struct llist *mylist;
 mylist = malloc(sizeof(Llist));

 while(fgets(line, sizeof(line), fpointer)!= NULL){
  int wordPos = 0;
  strcpy(sline, line);
  pointer = strtok(line, " ,.?\n");
  while(pointer!=NULL){
   if(strcmp(pointer, argv[2])==0){
    addList(sline, lineNum, wordPos, mylist);
    numtimes++;
  }
  pointer = strtok(NULL, " ,?.\n");
  wordPos++;
}
lineNum++;
}
printf("total occurrences of word: %d\n", numtimes);
printList(mylist);
return 0;
}

void addList(char *line, int lineNum, int wordPosition, Llist *mylist)
{  
 struct node *pnode;
 pnode = malloc(sizeof(Node));

 pnode->lineNum = lineNum;
 pnode->wordPosition = wordPosition;
 strcpy(pnode->line, line);
 pnode->next = NULL;

 if(mylist->head){
  mylist->tail->next = pnode;
  mylist->tail = pnode;
}
else{
  mylist->head = pnode;
  mylist->tail = pnode;
}
}

void printList(Llist *mylist){
 struct node *mynode;
 mynode = mylist->head;
 while(mynode){
  printf("line %d; word %d; %s", mynode->lineNum, mynode->wordPosition, mynode->line);
  mynode = mynode->next;
}
}

void delete(Llist *mylist){
 struct node *delhead;
 while(mylist->head){
  delhead = mylist->head;
  mylist->head = mylist->head->next;
  free(delhead);
}
mylist->head = NULL;
mylist->tail = NULL;
}




