#include <string.h>
#define MAX 100

int cmdLine(int argc, char *argv[]);
int io(int argc, char *argv[]);
int grep(int argc, char *argv[]);

/* A Node has the following:
 *    Contents of the line it occurs on
 *    The line number. 
 *    Where on the line the word is located (word 0, word 1, etc).
 *    A reference to the next node. 
 */
 
typedef struct node{
   char line[MAX];
   int lineNum;
   int wordPosition;
   struct node *next;
}Node;

typedef struct llist{
   Node *head;
   Node *tail;
}Llist;

void addList(char *line, int lineNum, int wordPos, struct llist *);
void printList(struct llist *);
void delete(struct llist *);
