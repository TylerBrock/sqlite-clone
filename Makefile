CC=clang
CFLAGS=-I./$(SRC_DIR)
SRC_DIR=src
BUILD_DIR=build
OBJ_DIR=obj

_DEPS=main.h btree.h constants.h cursor.h pager.h row.h table.h
DEPS=$(patsubst %, $(SRC_DIR)/%,$(_DEPS))

_OBJ=main.o btree.o constants.o cursor.o pager.o row.o table.o
OBJ=$(patsubst %, $(BUILD_DIR)/$(OBJ_DIR)/%,$(_OBJ))

$(BUILD_DIR)/$(OBJ_DIR)/%.o: src/%.c $(DEPS)
	@ mkdir -p $(BUILD_DIR)/$(OBJ_DIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(BUILD_DIR)/sqlite: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

test: $(BUILD_DIR)/sqlite
	rspec .

clean:
		rm -fr $(BUILD_DIR)

.PHONY: clean
