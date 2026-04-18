%option noyywrap
reserved ("debut"|"fin"|"si"|"alors"|"sinon"|"finsi")
identifiers [A-Za-z][A-Za-z0-9_-]*
suite \"[^"]*\"
integ [0-9]+
op [-+*/><]
composeOp ("mod"|"++"|"--"|"=="|"!=")
affect (:=)
%%
{reserved} {printf("reserved : %s\n",yytext);}
{identifiers} {printf("identifier : %s\n",yytext);}
{suite} {printf("suite de chaines : %s\n",yytext);}
{integ} {printf("integer : %s",yytext);}
{composeOp} {printf("operator : %s\n",yytext);}
{op} {printf("operator : %s\n",yytext);}
{affect} {printf( "affectation : %s\n",yytext);}
. 
%%
int main()
{
    yylex();
}