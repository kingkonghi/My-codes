#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <malloc.h>
#include <string.h>
int main(void){

int* a=0;
printf("%d %d %x\n",a,&a,&a);
int* b= malloc(strlen(a)+1);
}