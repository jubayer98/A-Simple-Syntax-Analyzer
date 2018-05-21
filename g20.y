%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	#define YYSTYPE double
%}

%token RLIT ILIT CLIT SLIT
%token PLUS MINUS TIMES DIVIDE REM
%token ASSIGN
%token LP RP LC RC LB RB
%token ID
%token ENDL SEMI
%token HASH LEXERR
%token IF ELSE
%token THEN WHILE DO

%right ASSIGN
%left PLUS MINUS
%left TIMES DIVIDE REM
%left NEG

%start prog

%%

prog:
	 stmts {printf("Accept");}
	| stmts {printf("Reject");}
;

stmts:	
	| stmt stmts
;


stmt:
	 dtype id idlist SEMI
	| ID ASSIGN expr SEMI {$$=$3;}
	| IF LP expr RP THEN block
	| WHILE LP expr RP block 
;


idlist:
	| , id
;


block:
	 LB stmts RB {$$=$2;}
;


expr:
	 term {$$=$1;}
	| expr PLUS term {$$ = $1 + $3;}
	| expr MINUS term {$$ = $1 - $3;}
	| expr DIVIDE term {$$ = $1 / $3;}
	| expr TIMES term {$$ = $1 * $3;}
	| expr REM term	{$$ = (int)$1 % (int)$3;}
	| MINUS expr %prec NEG { $$=-$2;}	
;


term:
	 ID 	
	| const 
;


dtype:
	 int
	| float
	| char
;


const:
	 RLIT { $$ = $1;}
	| ILIT { $$ = $1;}
	| CLIT { $$ = $1;}
	| SLIT { $$ = $1;}
;

%%

extern int yylex(void);
extern int yyparse(void);

int yyerror(char *s) {
  printf("%s\n", s);
}

int yywrap(void) {
    return 1;
}

int main() {
	return yyparse();  
}