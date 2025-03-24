%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

int yyparse();
%}

%union {
    int num;
}

%token <num> NUMBER
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN EOL

%left PLUS MINUS
%left TIMES DIVIDE

%type <num> expr

%%

input:    /* empty */
        | input line
        ;

line:    expr EOL { printf("= %d\n", $1); }
        | EOL     /* ignores empty lines */
        | error EOL { yyerror("Syntax error"); yyerrok; }
        ;

expr:    expr PLUS expr  { $$ = $1 + $3; }
        | expr MINUS expr { $$ = $1 - $3; }
        | expr TIMES expr { $$ = $1 * $3; }
        | expr DIVIDE expr { 
              if ($3 == 0) 
              {
                yyerror("Division by zero");
                fflush(stdout);
              }
              else $$ = $1 / $3; 
          }
        | LPAREN expr RPAREN { $$ = $2; }
        | NUMBER { $$ = $1; }
        ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Simple Calculator (press Ctrl+D to exit)\n");
    return yyparse();
}