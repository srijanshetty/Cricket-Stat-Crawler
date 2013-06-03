%{ 
	int count_dot=0;
	int runs_no=0;
	int max_runs_over=0;
	int number;
	int max_cts_boundaries=0, temp_cts;
%}

%option noyywrap

%%

no[ ]run { 
	count_dot++; 
	temp_cts=0;
}

[0-9][ ]"run" {
	temp_cts=0;
}

"("?no[ ]ball")"?[ ][0-9] {
	runs_no+=((yytext[10]-'0')+1);
	
}

"("?no[ ]ball")"?" FOUR" {
	runs_no+=4;
}

"("?no[ ]ball")"?" SIX" {
	runs_no+=6;
}

"End of over"[ ][0-9]"</b> ("[0-9] {
	if(max_runs_over<(yytext[19]-'0')){
		max_runs_over=(yytext[19]-'0');
	}
}
"End of over"[ ][0-9][0-9]"</b> ("[0-9] {
         if(max_runs_over<(yytext[20]-'0')){
                max_runs_over=(yytext[20]-'0');
        }

}

"End of over"[ ][0-9]"</b> ("[0-9][0-9] {
	number=10*(yytext[19]-'0') + (yytext[20]-'0') ;
	if(max_runs_over<number){
                max_runs_over=number;
        }
}

"End of over"[ ][0-9][0-9]"</b> ("[0-9][0-9] {
        number=10*(yytext[20]-'0') + (yytext[21]-'0') ;
        if(max_runs_over<number){
                max_runs_over=number;
    	}
}

(FOUR)|(SIX) {
	temp_cts++;
	if(max_cts_boundaries<temp_cts){
		max_cts_boundaries=temp_cts;
	}
}

.|\n {}

%%

int main(int argc, char *argv[]){
	yylex();
	printf("Number of dots: %d\n",count_dot);
	printf("Runs on no balls: %d\n",runs_no);
	printf("Max runs in an over: %d\n",max_runs_over);
	printf("Max number of continuous boundaries: %d\n",max_cts_boundaries);
}

