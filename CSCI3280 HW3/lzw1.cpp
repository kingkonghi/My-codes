/*
* CSCI3280 Introduction to Multimedia Systems *
* --- Declaration --- *
* I declare that the assignment here submitted is original except for source
* material explicitly acknowledged. I also acknowledge that I am aware of
* University policy and regulations on honesty in academic work, and of the
* disciplinary guidelines and procedures applicable to breaches of such policy
* and regulations, as contained in the website
* http://www.cuhk.edu.hk/policy/academichonesty/ *
* Assignment 3
* Name :
* Student ID :
* Email Addr :
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <ctype.h>
#include <string>

#define CODE_SIZE  12
#define TRUE 1
#define FALSE 0
using namespace std;


/* function prototypes */
unsigned int read_code(FILE*, unsigned int); 
void write_code(FILE*, unsigned int, unsigned int); 
void writefileheader(FILE *,char**,int);
void readfileheader(FILE *,char**,int *);
void compress(FILE*, FILE*);
void decompress(FILE*, FILE*);

struct TableEntry
{
	string sent; 
	int id; 
};
typedef struct TableEntry CodeDict[4096];



int main(int argc, char **argv)
{
    int printusage = 0;
    int	no_of_file;
    char **input_file_names;    
	char *output_file_names;
    FILE *lzw_file;

    if (argc >= 3)
    {
		if ( strcmp(argv[1],"-c") == 0)
		{		
			/* compression */
			lzw_file = fopen(argv[2] ,"wb");
        
			/* write the file header */
			input_file_names = argv + 3;
			no_of_file = argc - 3;
			writefileheader(lzw_file,input_file_names,no_of_file);
        	
			/* ADD CODES HERE */
				FILE *input=fopen(input_file_names[0],"r");
				compress(input, lzw_file);
				fclose(input);
			


			fclose(lzw_file);        	
		} else
		if ( strcmp(argv[1],"-d") == 0)
		{	
			/* decompress */
			lzw_file = fopen(argv[2] ,"rb");
			
			/* read the file header */
			no_of_file = 0;			
			readfileheader(lzw_file,&output_file_names,&no_of_file);
			
			/* ADD CODES HERE */
			
			fclose(lzw_file);		
			free(output_file_names);
		}else
			printusage = 1;
    }else
		printusage = 1;

	if (printusage)
		printf("Usage: %s -<c/d> <lzw filename> <list of files>\n",argv[0]);
 	
	return 0;
}

/*****************************************************************
 *
 * writefileheader() -  write the lzw file header to support multiple files
 *
 ****************************************************************/
void writefileheader(FILE *lzw_file,char** input_file_names,int no_of_files)
{
	int i;
	/* write the file header */
	for ( i = 0 ; i < no_of_files; i++) 
	{
		fprintf(lzw_file,"%s\n",input_file_names[i]);	
			
	}
	fputc('\n',lzw_file);

}

/*****************************************************************
 *
 * readfileheader() - read the fileheader from the lzw file
 *
 ****************************************************************/
void readfileheader(FILE *lzw_file,char** output_filenames,int * no_of_files)
{
	int noofchar;
	char c,lastc;

	noofchar = 0;
	lastc = 0;
	*no_of_files=0;
	/* find where is the end of double newline */
	while((c = fgetc(lzw_file)) != EOF)
	{
		noofchar++;
		if (c =='\n')
		{
			if (lastc == c )
				/* found double newline */
				break;
			(*no_of_files)++;
		}
		lastc = c;
	}

	if (c == EOF)
	{
		/* problem .... file may have corrupted*/
		*no_of_files = 0;
		return;
	
	}
	/* allocate memeory for the filenames */
	*output_filenames = (char *) malloc(sizeof(char)*noofchar);
	/* roll back to start */
	fseek(lzw_file,0,SEEK_SET);

	fread((*output_filenames),1,(size_t)noofchar,lzw_file);
	
	return;
}

/*****************************************************************
 *
 * read_code() - reads a specific-size code from the code file
 *
 ****************************************************************/
unsigned int read_code(FILE *input, unsigned int code_size)
{
    unsigned int return_value;
    static int input_bit_count = 0;
    static unsigned long input_bit_buffer = 0L;

    /* The code file is treated as an input bit-stream. Each     */
    /*   character read is stored in input_bit_buffer, which     */
    /*   is 32-bit wide.                                         */

    /* input_bit_count stores the no. of bits left in the buffer */

    while (input_bit_count <= 24) {
        input_bit_buffer |= (unsigned long) getc(input) << (24-input_bit_count);
        input_bit_count += 8;
    }
    
    return_value = input_bit_buffer >> (32 - code_size);
    input_bit_buffer <<= code_size;
    input_bit_count -= code_size;
    
    return(return_value);
}


/*****************************************************************
 *
 * write_code() - write a code (of specific length) to the file 
 *
 ****************************************************************/
void write_code(FILE *output, unsigned int code, unsigned int code_size)
{
    static int output_bit_count = 0;
    static unsigned long output_bit_buffer = 0L;

    /* Each output code is first stored in output_bit_buffer,    */
    /*   which is 32-bit wide. Content in output_bit_buffer is   */
    /*   written to the output file in bytes.                    */

    /* output_bit_count stores the no. of bits left              */    

    output_bit_buffer |= (unsigned long) code << (32-code_size-output_bit_count);
    output_bit_count += code_size;

    while (output_bit_count >= 8) {
        putc(output_bit_buffer >> 24, output);
        output_bit_buffer <<= 8;
        output_bit_count -= 8;
    }


    /* only < 8 bits left in the buffer                          */    

}

/*****************************************************************
 *
 * compress() - compress the source file and output the coded text
 *
 ****************************************************************/


void compress(FILE *input, FILE *output)
{
	string CodeDict[4096];
	for(int n=0;n<256;n++){
		char q=n;
		CodeDict[n]= q;	
	}


	std::string Cu="";
	char C,N;
	int tmp1=256, location=0;
	unsigned int out=0;
	/* ADD CODES HERE */
	C=getc(input);
	Cu=C;
	out=C;
	
	while(!feof(input)){
		N=getc(input);
		location=0;
		
		//Check if current Cu exist in diconary//
		while(location<tmp1){
			
			if(CodeDict[location]==Cu+N){
				break;
			}
			location++;
		}

		
		if(location==tmp1){
			//NOT found
			
			if(tmp1>=4095){
				tmp1=256;
			}
			write_code(output, out, CODE_SIZE);
			CodeDict[tmp1]=Cu+N;
			tmp1++;
			Cu=N;
			out=int(N);
		}else{
			
			// IF found add onto string and update output value//
			Cu=Cu+N;
			out=location;
		}
	}
	
	write_code(output, out, CODE_SIZE);
}

////CODE SIZE IS ALWAYS 12//
//ONE TXT FILE//


/*****************************************************************
 *
 * decompress() - decompress a compressed file to the orig. file
 *
 ****************************************************************/
void decompress(FILE *input, FILE *output)
{	
	
	
	/* ADD CODES HERE 
std::string StrDict[4096],PW, word;
	char tmp2;
	int table[4096];
	int tmp1=256, CW;
	for(int n=0;n<256;n++){
		char q=n;
		StrDict[n]= q;
	}
	for(int n=256;n<4096;n++){
		StrDict[n]= "";
	}
	CW=read_code(input, CODE_SIZE);
	PW=StrDict[CW];

	
	while((CW=read_code(input, CODE_SIZE))!= 4096-1){	
		for(int n=0; n<StrDict[CW].length();n++){
			fprintf(output, "%c", StrDict[CW][n]);}

		PW+=StrDict[CW];

		int pat=0;
		while(pat<tmp1){
			if(StrDict[pat]==PW){
				break;
			}
			pat++;
		}
		printf("%d |", CW);
		if(pat==tmp1){
			StrDict[tmp1]==PW;
			tmp1++;
			PW="";
		}
		
	}
*/

	/*unsigned int prevCode = 0;
	unsigned int currentCode = 0;
	std:: string p[4096]="";


	while((currentCode=read_code(input, CODE_SIZE))!=4096-1){
		tmp3=0;
		for(int n=0; n<tmp1;n++){
			if(currentCode==table[n]){
				break;
			}else{
				tmp3++;
			}
		}

		if(tmp3==tmp1){
			fprintf(output, "%s", StrDict[tmp3]);

		}else{

		}*/
	

	

}
