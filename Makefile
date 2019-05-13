CC=clang
CFLAGS=-I.
DEPS=btree.h constants.h cursor.h pager.h row.h table.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

sqlite: main.o btree.o constants.o cursor.o pager.o row.o table.o
	$(CC) -o sqlite main.o btree.o constants.o cursor.o pager.o row.o table.o

test: sqlite
	rspec .

.PHONY: clean

clean:
		rm -f *.o
