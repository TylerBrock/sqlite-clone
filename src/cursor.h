#pragma once

#include <stdint.h>
#include <stdbool.h>

#include "table.h"

struct Cursor_t {
  Table* table;
  uint32_t page_num;
  uint32_t cell_num;
  bool end_of_table;
};
typedef struct Cursor_t Cursor;

Cursor* table_start(Table* table);

Cursor* table_end(Table* table);

void* cursor_value(Cursor* cursor);

void cursor_advance(Cursor* cursor);
