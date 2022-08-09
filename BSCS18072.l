%{
#include <iostream>
#include <iostream>
#include <fstream>
using namespace std;

int errorCount = 0;
int lineNo = 0;
   /*file to write to*/
string outputfile = "Tokens.txt";
ofstream fout(outputfile);
%}

%%
\n			{lineNo++;}
   /*type tokens*/
int			{fout << "(IntType, "<< yytext << ", " << lineNo << ")\n";}
bool			{fout << "(BoolType, "<< yytext << ", " << lineNo << ")\n";}
float			{fout << "(FloatType, "<< yytext << ", " << lineNo << ")\n";}
skip			{fout << "(Skip, "<< yytext << ", " << lineNo << ")\n";}
   /* control flow tokens*/ 
while			{fout << "(While, " << yytext << ", " << lineNo << ")\n";}
do			{fout << "(Do, "<< yytext << ", " << lineNo << ")\n";}
repeat			{fout << "(Repeat, "<< yytext << ", " << lineNo << ")\n";}
until			{fout << "(Until, "<< yytext << ", " << lineNo << ")\n";}
if			{fout << "(If, "<< yytext << ", " << lineNo << ")\n";}
then			{fout << "(Then, "<< yytext << ", " << lineNo << ")\n";}
else			{fout << "(Else, "<< yytext << ", " << lineNo << ")\n";}
   /* Expression tokens*/
[a-z][A-Za-z0-9_]* 	{fout << "(Idfr, " << yytext << ", " << lineNo << ")\n";}
    /*added this new rule for error report since an identifier does not start with a capital letter*/
[A-Z][A-Za-z0-9_]*	{fout << "(Invalid, " << yytext << ", " << lineNo << ")\n";
			 cout << "Error " << errorCount << ": Invalid token " << yytext << " in line " << lineNo << ".\n";
			 errorCount++;}
[+|−]?[0-9]+		{fout << "(IntLit, " << yytext << ", " << lineNo << ")\n";}
[+|−]?[0-9]+"."[0-9]+	{fout << "(FloatLit, "<< yytext << ", " << lineNo << ")\n";}

   /*delimiter tokens*/
"("			{fout << "(LParen, "<< yytext << ", " << lineNo << ")\n";}
","			{fout << "(Comma, "<< yytext << ", " << lineNo << ")\n";}
")"			{fout << "(RParen, "<< yytext << ", " << lineNo << ")\n";}
"{"			{fout << "(LBrace, "<< yytext << ", " << lineNo << ")\n";}
"}"			{fout << "(RBrace, "<< yytext << ", " << lineNo << ")\n";}
";"			{fout << "(Semicolon, "<< yytext << ", " << lineNo << ")\n";}
    /*operator tokens*/
":="			{fout << "(Assign, "<< yytext << ", " << lineNo << ")\n";}
"<="			{fout << "(LessEq "<< yytext << ", " << lineNo << ")\n";}
"<"			{fout << "(Less, "<< yytext << ", " << lineNo << ")\n";}
"+"			{fout << "(Plus, "<< yytext << ", " << lineNo << ")\n";}
"-"			{fout << "(Minus, "<< yytext << ", " << lineNo << ")\n";}
"&&"			{fout << "(And, "<< yytext << ", " << lineNo << ")\n";}
"||"			{fout << "(Or, "<< yytext << ", " << lineNo << ")\n";}
">"			{fout << "(Gtr, "<< yytext << ", " << lineNo << ")\n";}
">="			{fout << "(GtrEq, "<< yytext << ", " << lineNo << ")\n";}
"*"			{fout << "(Times, "<< yytext << ", " << lineNo << ")\n";}
"%"			{fout << "(Mod, "<< yytext << ", " << lineNo << ")\n";}
"/"			{fout << "(Div, "<< yytext << ", " << lineNo << ")\n";}
"=="			{fout << "(Eq, "<< yytext << ", " << lineNo << ")\n";}

    /*for handling spaces*/
" "			{}
.			{fout << "(Invalid, " << yytext << ", " << lineNo << ")\n";
			 cout << "Error " << errorCount << ": Invalid token " << yytext << " in line " << lineNo << ".\n";
			 errorCount++;} 

%%
int yywrap(){}
int main (){
        /*file pointer for reading from file*/
 	FILE *fp = fopen("code.txt","r");
    	yyin = fp;
	yylex();
	fclose(fp);
	return 0;
}
