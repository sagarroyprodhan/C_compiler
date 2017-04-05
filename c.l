%{
	#include<stdio.h>
	
	#include "y.tab.h"

	int yylineno; 

%}

letter [a-zA-Z]
digit [0-9]
DQUOTE [\"]
%%
[ \t]		;
[\n]		{yylineno = yylineno+1;}
"void"		{return VOID;}
"int" 		{return INT;}
"float"		{return FLOAT;}
"char"		{return CHAR;}
"struct"		{return STRUCT;}
for			{return FOR;}
"while"		{return WHILE;}
"if" 		{return IF;}
"else"		{return ELSE;}
"printf"  	return PRINTF;
"return"		return RETURN;
"<="    	return LE;
">="    	return GE;
"=="    	return EQ;
"!="    	return NE;
">"			return GT;
"<"			return LT;
"="			return EQUALS;
"."     	return POINT;
"{"			return LEFT_BRACES;
"}"			return RIGHT_BRACES;
"("			return LEFT_PARENTHESIS;
")" 		return RIGHT_PARENTHESIS;
"["			return LEFT_BRACKET;
"]"			return RIGHT_BRACKET;
{letter}({letter}|{digit})*			return ID;
{digit}+	return NUM;
";"			return SEMICOLON;
","			return COMMA;
[+-/*]		return OPERATOR;
{DQUOTE}([^\"])*{DQUOTE}		return STRING;


%%

int yywrap(void){return 1;}
