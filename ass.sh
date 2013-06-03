#!/usr/bin/zsh

#Getting the source
echo "\nWorld Cup 2011 First Innings Statistics\n"
echo "\nGetting the source from the website\n"
curl "http://www.espncricinfo.com/icc_cricket_worldcup2011/engine/match/$1.html?innings=1;view=commentary" > temp1.txt
#Printing the output
flex first.l
gcc lex.yy.c
./a.out < temp1.txt

echo "\nWorld Cup 2011 Second Innings Statistics\n"
echo "\nGetting the source from the website\n"
curl "http://www.espncricinfo.com/icc_cricket_worldcup2011/engine/match/$1.html?innings=2;view=commentary" > temp1.txt
./a.out < temp1.txt

echo "Overall Bowling Statistics for both innings\n"
curl "http://www.espncricinfo.com/icc_cricket_worldcup2011/engine/match/$1.html" > temp2.txt 2>/dev/null 
echo "\nThe list of bowlers is"

#Printing the output
flex second.l
gcc lex.yy.c

./a.out < temp2.txt
