%option noyywrap
%{
int i = 0;
%}
NB_b (0|1)+
NB_d [0-9]+
%%
{NB_b} {printf("Le nombre est binaire <%s>:\n",yytext); i++;}
{NB_d} {printf("Le nombre <%s> n'est pas binaire\n",yytext);}
[ \t\n] 
%%
int main()
{
    yyin = fopen("input.txt","r");
    yylex();
    printf("Il y'a %d nombres binaires",i);
}