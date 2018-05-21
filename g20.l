%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	
	#include "g20.tab.h"		
	#define YYSTYPE double
%}

white 	[ \t\r]+
digit 	[0-9]
real 	{digit}+("."{digit}+)
letter 	[A-Za-z]
char    '{letter}*'
string 	"\""[^"]*"\""

%%
{white}		{}
"+" 		{printf("<PLUS>"); return PLUS;}
"-" 		{printf("<MINUS>"); return MINUS;}
"*" 		{printf("<TIMES>"); return TIMES;}
"/" 		{printf("<DIVIDE>"); return DIVIDE;}
"%" 		{printf("<REM>"); return REM;}
"(" 		{printf("<LP>"); return LP;}
")" 		{printf("<RP>"); return RP;}
"{" 		{printf("<LC>"); return LC;}
"}" 		{printf("<RC>"); return RC;}
"[" 		{printf("<LB>"); return LB;}
"]" 		{printf("<RB>"); return RB;}
"\n" 		{printf("<ENDL>");}
";"			{printf("<SEMI>"); return SEMI;}
"#" 		{printf("<HASH>"); return HASH;}
"if"		{printf("<IF>"); return IF;}
"then"		{printf("<THEN>"); return IF;}
"while"		{printf("<WHILE>"); return IF;}
"do"		{printf("<DO>"); return IF;}
"else"		{printf("<ELSE>"); return IF;}
":="		{printf("<ASSIGN>"); return ASSIGN;}

{real}		{	yylval=atof(yytext);
				printf("<%s,RLIT>", yytext);
				return RLIT;
			}
			
{digit}+	{
				yylval= atoi(yytext); 
				printf("<%s,ILIT>", yytext); 
				return ILIT;
			}

{char}		{printf("<CHAR>"); return CLIT;}

{string}	{printf("<TEXT>"); return SLIT;}

{letter}({letter}|{digit})* {
				printf("<%s,ID>", yytext); 
				return ID;
			}
			
.			{
				printf("<INVALID SYMBOL>"); 
				return LEXERR;
			}

%%

int test(void)
{  
   return 0;
}