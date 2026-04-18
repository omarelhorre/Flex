%option noyywrap
suite (0|9)+
NB_b (0|1)+

%%
{suite} 
{NB_b} {printf("Votre Nombre est binaire: <%s>\n", yytext);}
. 
%%



int main()
{
    yylex();
}