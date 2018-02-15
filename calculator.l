/* declarations */

%{
	enum yytokentype{
		NUMBER = 258,
		ADD = 259,
		SUB = 260,
		MUL = 261,
		DIV = 262,
		ABS = 263,
		EOL = 264,
		OP = 265,
		CP = 266,
		COM = 267 
	};
	
	int yylval;
%}

/* Recognize tokens for the calculator and print them out */

%% 

"+"	{ return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
"[ \t]" { /* ignore me I am a white space*/ }
"//".*	{ /* ignore comments */ }
"("	{return OP; }
")"	{ return CP; }
"."     { printf("Mystery character %s\n", yytext); }

%%

main(int argc, char **argv){
	int tok;

	while(tok = yylex()){
		printf("%d",tok);
		
		if(tok==NUMBER) printf(" = %d\n",yylval);
		else printf("\n");
	}
}

