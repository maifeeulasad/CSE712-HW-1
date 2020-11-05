%{
    #include<stdio.h>
    #ifdef YYDEBUG
        yydebug = 1;
    #endif
    void yyerror (char const *s);
    int yywrap();
    int yylex(void);
    void set_input(const char* input);
%}

%union {
  char *s;
}

%token <s>  NUMBER

%token <s> VARIABLE
%token <s> OPERATOR

%token <s>  KEYWORD

%token  EXCLAMATION
%token  COMMA
%token  EQUALS

%token  START_P
%token  END_P
%token  START_C
%token  END_C

%token  RETURN


%%

PROGRAM             : STATEMENTS                        {
                                                            printf("tiny program\n");
                                                        }                                         

STATEMENTS          : STATEMENT                         {
                                                            printf("statement\n");
                                                        }                                 
                    | STATEMENT STATEMENTS              {
                                                            printf("statements\n");
                                                        }
                    ;                                   

STATEMENT           : VAR_DECLARE EXCLAMATION           {
                                                            printf("var declate statement\n");
                                                        }
                    | FUNC_DECLARE                      {
                                                            printf("function declare\n");
                                                        }
                    | FUNC_CALL EXCLAMATION   
                                                        {
                                                            printf("just a function call as a statement\n");
                                                        }
                    | VAR_ASSIGN EXCLAMATION            {
                                                            printf("variable assignment statement\n");
                                                        }
                    ;

VAR_ASSIGN          : VARIABLE EQUALS VALUE             {
                                                            printf("var assignment\n");
                                                        }

VAR_DECLARE         : KEYWORD VARIABLE                  {
                                                            printf("variable declare without value\n");
                                                        }                        
                    | KEYWORD VARIABLE EQUALS VALUE     {
                                                            printf("variable declare with value\n");
                                                        }
                    ;                          
                                           
FUNC_DECLARE        : KEYWORD VARIABLE START_P PARAMETERS END_P BLOCK   {
                                                                            printf("func declare without param\n");
                                                                        }
                    | KEYWORD VARIABLE START_P END_P BLOCK              {
                                                                            printf("func declare without param\n");
                                                                        }



PARAMETERS          : KEYWORD VARIABLE                                  {
                                                                            printf("param\n");
                                                                        }                    
                    | KEYWORD VARIABLE COMMA PARAMETERS                 {
                                                                            printf("more params\n");
                                                                        }    

BLOCK               : START_C STATEMENTS END_C                          {
                                                                            printf("block with statements\n");
                                                                        }
                    | START_C STATEMENTS RETURN VALUE EXCLAMATION END_C
                                                                        {
                                                                            printf("block with return value\n");
                                                                        }
                    | START_C END_C                                     {
                                                                            printf("empty block\n");
                                                                        }


VALUE               : VARIABLE
                                {
                                    printf("value from variable\n");
                                }                                       
                    | NUMBER
                                {
                                    printf("value from number\n");
                                }
                    | VARIABLE OPERATOR VARIABLE
                                {
                                    printf("value from variable variable operation\n");
                                }                           
                    | VARIABLE OPERATOR NUMBER    
                                {
                                    printf("value from variable number operation\n");
                                }                                                         
                    | NUMBER OPERATOR VARIABLE  
                                {
                                    printf("value from number variable operation\n");
                                }                                                           
                    | NUMBER OPERATOR NUMBER       
                                {
                                    printf("value from number number operation\n");
                                }                                                        
                    | FUNC_CALL      
                                {
                                    printf("value from function call\n");
                                }                               
                    ;


FUNC_CALL           : VARIABLE START_P END_P     
                                {
                                    printf("just another function call\n");
                                }                              
                    | VARIABLE START_P PARAM_VALUES END_P
                                {
                                    printf("function call with params\n");
                                }     



PARAM_VALUES        : VALUE    
                                {
                                    printf("param passed\n");
                                }                                    
                    | VALUE COMMA PARAM_VALUES       
                                {
                                    printf("more param passed\n");
                                }                      

%%


int main()
{
    char buffer[BUFSIZ];
    while (1)
    {
        char* input = fgets(buffer, sizeof buffer, stdin);
        if (buffer == NULL) 
            break;
        set_input(input);
        yyparse();
        printf("****************Parsing complete************\n");
    }
   return 0;
}
int yywrap()
{
   return 1;
}
void yyerror (char const *s) {
    printf("Error :\n");
    fprintf (stderr, "%s\n", s);
}
