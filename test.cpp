#include <stdio.h>
#include <string>
using namespace std;

bool subset(char a[],char b[]){
    bool sub = false;
    for(int i=0;i<sizeof(b);i++){
        for(int j=0;j<sizeof(a);j++){
            sub = false;
            if(b[i] == a[j]){
            sub = true; break;
            }
            
        }
        if(sub== false)break;
    }   
    return sub;
}

int main(void){
    char a [10] ={'A','B','D'};
    char b [10] ={'A','A','C','D'};

    bool sub = subset(a,b);
    printf("%d",sub);
}
