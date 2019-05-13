#pragma once

#include <stdint.h>
#include "constants.h"

struct Pager_t {
  int file_descriptor;
  uint32_t file_length;
  uint32_t num_pages;
  void* pages[TABLE_MAX_PAGES];
};
typedef struct Pager_t Pager;

void* get_page(Pager* pager, uint32_t page_num);

Pager* pager_open(const char* filename);

void pager_flush(Pager* pager, uint32_t page_num);
