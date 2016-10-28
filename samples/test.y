%{
    #include <iostream>
%}

%token var
%left "var"
%right 'var'
%type var

%%
[0-9]+\.[0-9]+  { std::cout << "OK" << std::endl; }

%%
int main(int argc)
{
	return 0;
}

void function()
{
	std::cout << "It works !" << std::endl;
}
