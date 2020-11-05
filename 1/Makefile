all:
	flex lexer_html.l
	g++ lex.yy.c -o html.out
clear:
	rm -rf lex.yy.c
	rm -rf html.out