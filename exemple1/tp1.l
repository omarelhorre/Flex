%option noyywrap
NB_b (0|1)+

%%
{NB_b} {printf("Votre Nombre est binaire: <%s>\n", yytext);}
. 
%%



int main()
{
    yylex();
}