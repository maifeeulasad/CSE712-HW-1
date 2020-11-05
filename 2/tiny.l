%{
    #include "tiny.tab.h"
    extern int yylex();
    extern int yyerror();

%}
%option noinput nounput nodefault yylineno
%option noyywrap
				

%%

"int"|"float"						{yylval.s = yytext;return KEYWORD;}
"+"|"-"|"*"|"/" 					{yylval.s = yytext;return OPERATOR;}
["return"] 							{return RETURN;}

[{]									{return START_C;}
[}]									{return END_C;} 

[(]									{return START_P;}
[)]									{return END_P;}

"="                     			{return EQUALS;}
","                     			{return COMMA;}

"!" 								{return EXCLAMATION;}


[[:digit:]]+(\.[[:digit:]]+)?		{yylval.s = yytext;return NUMBER;}

[[:alpha:]][[:alnum:]]* 			{yylval.s = yytext;return VARIABLE;}
[[:space:]\t\n]+            		;
.                       			{return *yytext;}


%%

static YY_BUFFER_STATE flex_buffer;


void set_input(const char* input) {
  yy_delete_buffer(flex_buffer);
  flex_buffer = yy_scan_string(input);
}
