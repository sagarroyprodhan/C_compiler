%{
	void yyerror(char *s);
	#include<stdio.h>
	#include<stdlib.h>
	extern int yylineno;
	extern char *yytext;
	

	typedef struct E{
	char type[10];
	}E;
	typedef struct L{
	char type[10];
	}L;
	typedef struct num{
	char type[10];
	int value;
	}num;

	extern FILE *yyin;
%}
%union{int number;char identifier[100];}
%start START
%token <identifier> INT FLOAT CHAR VOID FOR WHILE LEFT_PARENTHESIS RIGHT_PARENTHESIS LEFT_BRACES RIGHT_BRACES IF ELSE STRUCT RETURN PRINTF ID
%token LE GE EQ NE GT LT POINT DIGITS NUM SEMICOLON COMMA OPERATOR LEFT_BRACKET RIGHT_BRACKET
%type <identifier> function declaration

%%

START: function | START function | structure|;

function: type id left_parenthesis parameter right_parenthesis left_braces body right_braces |;

structure: STRUCT id left_braces declaration right_braces SEMICOLON  				{;}
			|																		
			;

declaration: dlist|;

dlist: D | dlist D ;

D: type L ;

type: INT | FLOAT ;

L: id end| L comma id end | id left_bracket elist right_bracket end;

end: semicolon|;

parameter: type id | type id comma parameter | ;

body: declaration statements;

statements: if_exp | if_exp else_exp | 
			;

if_exp: if left_parenthesis exp right_parenthesis left_braces body right_braces|
	   if left_parenthesis exp right_parenthesis left_braces body right_braces;

else_exp: else left_parenthesis body right_parenthesis ;

exp: exp op exp| L;

elist:;

left_parenthesis: LEFT_PARENTHESIS;
right_parenthesis: RIGHT_PARENTHESIS;
left_braces: LEFT_BRACES;
right_braces: RIGHT_BRACES;
id:ID;
comma: COMMA;
semicolon:SEMICOLON;
if: IF;
else: ELSE;
left_bracket: LEFT_BRACKET ;
right_bracket: RIGHT_BRACKET;
op:OPERATOR;


%%
#include<ctype.h>
int flag=0;

int main(int argc,char *argv[]){


yyin=fopen(argv[1],"r");

if(yyin==NULL)
{
     printf("\n Error in parsing! \n");
}
else 
{
    if(yyparse())
    printf("\nDone Parsing!!\n");

}
fclose(yyin);

if(flag==0)
printf("Correct SYNTAX!!!\n");

return 0;
}

void yyerror(char *s){
	flag=1;

	printf("%d : %s %s\n", yylineno, s, yytext);
}