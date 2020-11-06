# Problem statement :

Parse a custom grammer(tiny language), provided

# Solving strategy (LEXER):
 - Lexer :
   - First I defined all the keyword, luckily here was only two, `int` and `double`
   - Then 4 operators as there are 4 basic mathmatical operators
   - Then defined opening and closing curly brackets and paranthesis
   - Also declared `=`,`,`,`!`(which is key to our toy language)
   - I defined any any whole number or floating point value as number
     - The first part `[[:digit:]]+` will match all the whole number
     - The second part `(\.[[:digit:]]+)?` is optional as followed by a `?`. It is for the floating point number
     - Can just floating point part exist ? - No, as I put `+` in the first part so that part is compulsory.
   - Then I declared variable anything starting with alphabet, followed by alpha-numeric values as much as we want
   - We will simply ignore all spaces and TAB and NEWLINE
   - If we encounter other than all these we will simply terminate the program.
 - Parser :
   - Among all of out tokens, only NUMBER, VARIABLE, OPERATOR, KEYWORD can take multiple values, and we may need to decode them later, so I treated all of them as `String` or `char *`
   - Then the Grammer part is as simple as written is problem statement
   - PROGRAM will consists of only STATEMENTS
   - STATEMENTS can be itself just a STATEMENT or followed by STATEMENTS
   - now the question is what we will consider as statement
     - variable declaration
     - function declaration
     - just function call, without assignment, with assignment will be treated in a rule later
     - variable assign
   - Now how can we declare variable ?
     - with value
     - without value
   - function declaration is also simple
     - it must contain a return type
     - it may or may not contain a set of parameters
     - then a block, we will discuss about block in a minute
   - block 
     - block is piece of statements wrapped in curly braces
     - sometimes statements might be empty
     - and sometimes that block may return some value
   - value
     - we can set value from another variable just like we do in other languages to permitives
     - directly from number
     - we can calculate and get the value

I'm now trying to solve number 3 make number 2 better.
