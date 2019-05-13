#pragma once

#include <stdint.h>

#include "pager.h"

struct Table_t {
  Pager* pager;
  uint32_t root_page_num;
};
typedef struct Table_t Table;

Table* db_open(const char* filename);

void db_close(Table* table);
