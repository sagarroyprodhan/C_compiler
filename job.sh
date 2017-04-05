yacc -d c.y
lex c.l
gcc lex.yy.c y.tab.c -o file
./file input.txt