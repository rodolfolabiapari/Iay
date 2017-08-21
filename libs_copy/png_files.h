
#include <png.h>
void read_png_file(int * width, int * height,
png_byte * color_type, png_byte * bit_depth, png_bytep **row_pointers);


void copy_png_to_float(int height, int width, png_bytep *row_pointers,
  float *** data);
