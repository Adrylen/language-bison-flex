%{
	#include <iostream>
%}

// Comment
/* Comment */
/**
 * Comment
 */

%union {double number;}
%token <string> var
%left "var"
%right 'var'

%%

"string"		return(0);
[0-9]+\.[0-9]+  { std::cout << "OK" << std::endl; }
{blanks}        { /* ignore */ }
{blocks}        {
	/* ignore */
}

program:
	%empty
|	blank
;

%%
int main(int argc)
{
	return 0;
}

void function()
{
	std::cout << "It works !" << std::endl;
}
