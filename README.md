# scanner_CC
Scanner in compiler construction for the provided specification of the PSL (Programming Sub Language).
BRIEF DESCRIPTION OF THE STEPS CARRIED OUT TO COMPLETE THIS ASSIGNMENT

Started with watching the Youtube tutorials posted by the TA.
Went through the geeksforgeeks tutorial.

Coming to the actual part:
1. Installed FLEX, there was no error in installation of FLEX and added its path in the environment varibales.
2. After this I wrote a small sample lex.l file to check if it executes fine. There was no error in the first step where we had to compile the .l file. However I got errors at g++ command in the next step. This command was unrecognized. 
3. I installed MinGW Installation Manager to install the g++ and gcc packages.
4. Now everything was working smoothly.
5. I started writing the actual BSCS18072.l file. Encountered some errors and fixed them along the way. Got to know more about syntax of writing rules etc. Handled stuff not mentioned explicitly in the assignment like white spaces etc.
6. Was again and again executing all steps to fix any errors.

USER MANUAL
/****The lex.l file must be in the same directory as the current directory while executing the commands in command prompt****/
Step 1:	Open command prompt and type the command "flex BSCS18072.l". This will generate the lex.yy.c file in the same directory.
Step 2:	In the next step we build the compiler using the command "g++ lex.yy.c -o lexanalyzer". This will generate an lexanalyzer.exe file which is basically our lexical analyzer. (You can give any name to this output (lexanalyzer) file)
Step 3:	Now we finally execute our lexical analyzer by simply typing the command "lexanalyzer.exe". This will generate the Token.txt file in the same directory and display any errors in the command prompt.


