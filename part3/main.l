%option noyywrap
%{
FILE* ptr;
typedef struct{
    char lexeme[20];
    int occurence ;
} tableOccurences;

int length = 0;
    tableOccurences tab[400];


void initTab()
{
    for(int i = 0; i<400; i++)
    {
        tab[i].occurence = 0;
    }
}

void Ajouter(char* lexeme)
{
    for(int i = 0 ; i< 400 ; i++)
    {
    
    if(strcmp(tab[i].lexeme,lexeme) == 0){
    tab[i].occurence++;
    break;
    }


    else if(tab[i].occurence == 0){
    tab[i].occurence++;
    strcpy(tab[i].lexeme,lexeme);
    length++;
    break;
    }

    }
}
void Afficher()
{
    for(int i = 0 ; i<length ; i++)
    {
        printf("Lexeme : %s | Occurence : %d\n", tab[i].lexeme, tab[i].occurence);
    }
}
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
[ \t]
{reserved} {fprintf(ptr,"<span> %s </span>",yytext);}
{identifiers} {fprintf(ptr,"<span style=\"color : blue\"> %s </span>",yytext); Ajouter(yytext); }
{suite} {fprintf(ptr,"<span style=\" font-style : italic \"> %s </span>",yytext);}
{integ} {fprintf(ptr,"<span> %s </span>",yytext); Ajouter(yytext); } 
{composeOp} {fprintf(ptr,"<span style= \" color : red \"> %s </span>",yytext);}
{op} {fprintf(ptr,"<span style= \" color : red \"> %s </span>",yytext);}
{affect} {fprintf(ptr,"<span> %s </span>",yytext);}
. {printf("%s ERREUR LEXICALE\n",yytext);
    fprintf(ptr,"<span style= \"color : gray ; font-weight : bold \"> %s </span>",yytext);}
%%
int main()
{
    initTab();
    yyin = fopen("parse.txt","r");
    ptr = fopen("index.html","w");
    yylex();
    Afficher();
}