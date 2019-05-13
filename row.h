#pragma once

#include "constants.h"
#include <stdint.h>

struct Row_t {
  uint32_t id;
  char username[COLUMN_USERNAME_SIZE + 1];
  char email[COLUMN_EMAIL_SIZE + 1];
};
typedef struct Row_t Row;

void serialize_row(Row* source, void* destination);

void deserialize_row(void* source, Row* destination);

void print_row(Row* row);
