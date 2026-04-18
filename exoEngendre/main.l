%option noyywrap
reserved ("debut"|"fin"|"si"|"alors"|"sinon"|"finsi")
identifiers [A-Za-z][A-Za-z0-9_-]*
suite \"[^"]*\"
integ [0-9]+
op [-+*/><]
composeOp ("mod"|"++"|"--"|"=="|"!=")
affect (:=)
%%
{reserved} {printf("<%s>reserved\n",yytext);}
{identifiers} {printf("<%s>identifier\n",yytext);}
{suite} {printf("<%s> suite de chaine\n",yytext);}
{integ} {printf("<%s>integer\n",yytext);}
{composeOp} {printf("<%s>operator\n",yytext);}
{op} {printf("<%s>operator\n",yytext);}
{affect} {printf( "<%s>affectation\n",yytext);}
%%
int main()
{
    yylex();
}