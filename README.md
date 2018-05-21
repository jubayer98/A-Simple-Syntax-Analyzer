# A-Simple-Syntax-Analyzer
a syntax analyzer (parser) using flex/bison tools for the grammar given in readme file.


PROG → STMTS
STMTS → STMT STMTS | ɛ
STMT → DTYPE id IDLIST ;
STMT → id := EXPR ;
STMT → if ( EXPR ) then BLOCK
STMT → while ( EXPR ) BLOCK
IDLIST → , id | ɛ
BLOCK → { STMTS }
EXPR → EXPR OPTR TERM | TERM
EXPR → ( EXPR ) | neg EXPR
TERM → id | CONST
DTYPE → int | float | char
CONST → ilit | rlit | clit | slit
OPTR → + | - | * | / | %
