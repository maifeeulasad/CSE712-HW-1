%{ 
	extern int yylex(); 
%} 
%option noyywrap


TAGS        						"a"|"abbr"|"acronym"|"address"|"applet"|"article"|"aside"|"audio"|"b"|"big"|"blockquote"|"body"|"button"|"canvas"|"caption"|"cite"|"code"|"colgroup"|"data"|"datalist"|"dd"|"del"|"dfn"|"dir"|"div"|"dl"|"dt"|"em"|"fieldset"|"figcaption"|"figure"|"font"|"footer"|"form"|"frame"|"frameset"|"h1"|"h2"|"h3"|"h4"|"h5"|"h6"|"head"|"header"|"html"|"i"|"iframe"|"ins"|"kbd"|"label"|"legend"|"li"|"main"|"map"|"mark"|"meter"|"nav"|"noframes"|"noscript"|"noscript"|"object"|"ol"|"optgroup"|"option"|"output"|"p"|"picture"|"pre"|"progress"|"q"|"rp"|"rt"|"ruby"|"s"|"samp"|"script"|"section"|"select"|"small"|"span"|"strike"|"strong"|"style"|"sub"|"summary"|"sup"|"svg"|"table"|"tbody"|"td"|"template"|"textarea"|"tfoot"|"th"|"thead"|"time"|"title"|"tr"|"tt"|"u"|"ul"|"var"|"video"
I_TAGS 								"area"|"base"|"br"|"col"|"command"|"embed"|"hr"|"img"|"input"|"keygen"|"link"|"meta"|"param"|"source"|"track"|"wbr"


OPEN_ANGLE							["<"]
CLOSE_ANGLE							[">"]

BACK_SLASH 							["/"]


OPEN_TAG 							{OPEN_ANGLE}{TAGS}{CLOSE_ANGLE}
CLOSE_TAG 							{OPEN_ANGLE}{BACK_SLASH}{TAGS}{CLOSE_ANGLE}
SINGLE_TAG 							{OPEN_ANGLE}{BACK_SLASH}{I_TAGS}{CLOSE_ANGLE}

%%
"="									{printf("Equals\n");}

{SINGLE_TAG}						{printf("Single tag\n");}
{OPEN_TAG}							{printf("HTML tag open\n");}
{CLOSE_TAG}							{printf("HTML tag close\n");}

[[:alnum:]]*						{printf("Anything as STRING\n");}

[[:space:]\t\n]+            		{printf("Ignoring spaces\n");}
.                       			{printf("Not HTML, I guess\n");exit(1);}


%%

int main(int argc, char** argv) { 
	while (yylex()); 
}