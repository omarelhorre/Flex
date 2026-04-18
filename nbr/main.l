%option noyywrap
%{
    int i = 0;
    int j = 0;
    int k = 0;
    int c = 0;
    int p = 0;
%}
voyelles [aeiuoyAEIOY]
consonnes [AZRTPMLKJHGFDSQWXCVBNzrtplmkjhgfdsqwxcvbn]
accents [éèàç]
ponctuation[,;.:!]
special [&~"#'\{\}\(\)\[\]-|`\_^@=?/§]
%%
{voyelles} {printf("<%s> Voyelles\n",yytext); i++;}
{consonnes} {printf("<%s> consonnes\n",yytext); j++;}
{accents} {printf("<%s> accents\n",yytext); k++;}
{special} {printf("<%s> special\n",yytext); c++;}
{ponctuation} {printf("<%s> ponctuation\n",yytext); p++;}
.
%%
int main()
{
    yyin = fopen("fichier.txt","r");
    yylex();
    printf("Voyelles: %d\n",i);
    printf("accents: %d\n",k);
    printf("consonnes: %d\n",j);
    printf("Speicial : %d\n",c);
    printf("ponctuation : %d\n",p);
}