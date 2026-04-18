%option noyywrap
%{
FILE* ptr;
%}
reserved ("debut"|"fin"|"si"|"alors"|"sinon"|"finsi")
identifiers [A-Za-z][A-Za-z0-9_-]*
suite \"[^"]*\"
integ [0-9]+
op [-+*/><]
composeOp ("mod"|"++"|"--"|"=="|"!=")
affect (:=)
%%
[\n] {fprintf(ptr,"</br>");}
{reserved} {fprintf(ptr,"<span> %s </span>",yytext);}
{identifiers} {fprintf(ptr,"<span style=\"color : blue\"> %s </span>",yytext);}
{suite} {fprintf(ptr,"<span style=\" font-style : italic \"> %s </span>",yytext);}
{integ} {fprintf(ptr,"<span> %s </span>",yytext);}
{composeOp} {fprintf(ptr,"<span style= \" color : red \"> %s </span>",yytext);}
{op} {fprintf(ptr,"<span style= \" color : red \"> %s </span>",yytext);}
{affect} {fprintf(ptr,"<span> %s </span>",yytext);}
. {fprintf(ptr,"<span> %s </span>",yytext);}
%%
int main()
{
    yyin = fopen("parse.txt","r");
    ptr = fopen("index.html","w");
    yylex();
}