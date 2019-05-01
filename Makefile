CC=clang

sqlite: main.c
	$(CC) -o sqlite main.c

test: sqlite
	rspec .
