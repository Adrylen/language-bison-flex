%{
	// Includes
	#include <iostream>
	#include <map>
	#include <stack>
	#include <vector>

	// Externs
	extern "C" int yylex();
	extern "C" int yyparse();

	// Functions
	void yyerror(const char*);
	double eval(std::vector<int>, double=0);
	void operate(std::stack<double> &, char);

	for(int a=0; a<5; a++)
	{
		int x;
	}

	// Variables
	std::map< char* , std::vector<int>    > list;
	std::map< char* , std::vector<double> > values;
	std::vector<int>    postfixe;
	std::vector<double> valeurs;
	double min=-1, max=1, pas=0.1;
%}

// Union
%union {
	double number;
	char* name;
}

// Tokens
%token <number>	NUM
%token <name>	VAR
%token SIN

// Types
%type <number> expr

// Operators
%left '+' '-'
%left '*' '/'

// Rules
%%
program:
	%empty
|	program line
;

line:
	'\n'
|	VAR '=' expr '\n'	{
							list.insert  ( std::pair< char* , std::vector<int>    > ($1, postfixe) ); postfixe.clear();
							values.insert( std::pair< char* , std::vector<double> > ($1, valeurs)  ); valeurs.clear();
						}
;

expr:
	NUM					{ postfixe.push_back(NUM); valeurs.push_back($1); }
|	VAR					{ postfixe.push_back(VAR); valeurs.push_back(0); }
|	expr '+' expr		{ postfixe.push_back('+'); valeurs.push_back(0); }
|	expr '-' expr		{ postfixe.push_back('-'); valeurs.push_back(0); }
|	expr '*' expr		{ postfixe.push_back('*'); valeurs.push_back(0); }
|	expr '/' expr		{ postfixe.push_back('/'); valeurs.push_back(0); }
|	SIN '(' expr ')'	{ }
|	'(' expr ')'		{ $$ = $2; }
;