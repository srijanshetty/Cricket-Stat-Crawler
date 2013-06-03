%{ 
	#include<string.h>
	int bowler_count=0;
	int bowlers[100];
	int max_wides=0;
	int bowler=0;
	int i;
	int size;
	int runs=0;
%}

%option noyywrap

%%

"class=\"playerName\">"[a-zA-Z" "]+"</a></td>\n  <td class=\"bowlingDetails\" style=\"padding-right: 10px\">"[0-9]+"</td>\n  <td class=\"bowlingDetails\">"[0-9]+"</td>\n  <td class=\"bowlingDetails\">"[0-9]+"</td>\n  <td class=\"bowlingDetails\">"[0-9]+"</td>\n  <td class=\"bowlingDetails\">"[0-9]+[.][0-9]+"</td>\n  <td class=\"bowlingDetails\">("[0-9]*"w)</td>" {
	
	i=0;
	bowler_count++;
	while(yytext[i]!='\0'){
		++i;
	}
	size=i-1;
	i=size;
	while(yytext[i]!=')'){
		--i;
	}
	i=i-2;
	runs=yytext[i]-'0';
	if(runs>max_wides){
		max_wides=runs;
		bowler=bowler_count;
	}
	i=0;
	while(yytext[i]!='>'){
		++i;
	}
	++i;
	printf("\n");
	while(yytext[i]!='<'){
		printf("%c",yytext[i]);
		++i;
	}
}

.|\n {}

%%

int main(int argc, char *argv[]){
	yylex();
	printf("\nBowler number %d gave the most number of wides",bowler);
}

