%{
#include "calculator.tab.h"
#include <stdlib.h>
void yyerror(const char *s);
%}

%%

[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIVIDE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
\n              { return EOL; }
\r              ; /*ignores the \r in windows text files when \r\n*/
[ \t]           ; /* ignores the whitespace */
.               { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}