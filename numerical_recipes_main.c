#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <png.h>
#include "nrutil.h"

#define SWAP(a,b) tempr=(a);(a)=(b);(b)=tempr

////////////////////////////////////////////////////////////////
// Fourier Functions
////////////////////////////////////////////////////////////////
void fourn(float data[], unsigned long nn[], int ndim, int isign)
{
  int idim;
  unsigned long i1, i2, i3, i2rev, i3rev, ip1, ip2, ip3, ifp1, ifp2;
  unsigned long ibit, k1, k2, n, nprev, nrem, ntot;
  float tempi, tempr;
  double theta, wi, wpi, wpr, wr, wtemp;

  for (ntot = 1, idim = 1; idim <= ndim; idim++)
    ntot *= nn[idim];
  nprev = 1;
  for (idim = ndim; idim >= 1; idim--) {
    n = nn[idim];
    nrem = ntot / (n * nprev);
    ip1 = nprev << 1;
    ip2 = ip1 * n;
    ip3 = ip2 * nrem;
    i2rev = 1;
    for (i2 = 1; i2 <= ip2; i2 += ip1) {
      if (i2 < i2rev) {
        for (i1 = i2; i1 <= i2+ip1-2; i1 += 2) {
          for (i3 = i1; i3 <= ip3; i3 += ip2) {
            i3rev = i2rev + i3 - i2;
            SWAP(data[i3], data[i3rev]);
            SWAP(data[i3+1], data[i3rev + 1]);
          }
        }
      }
      ibit = ip2 >> 1;
      while (ibit >= ip1 && i2rev > ibit) {
        i2rev -=  ibit;
        ibit >>=  1;
      }
      i2rev += ibit;
    }
    ifp1 = ip1;
    while (ifp1 < ip2) {
      ifp2 = ifp1 << 1;
      theta = isign * 6.28318530717959 / (ifp2 / ip1);
      wtemp = sin(0.5 * theta);
      wpr = -2.0 * wtemp * wtemp;
      wpi = sin(theta);
      wr = 1.0;
      wi = 0.0;
      for (i3 = 1; i3 <= ifp1; i3 += ip1) {
        for (i1 = i3; i1 <= i3 + ip1 - 2; i1 +=  2) {
          for (i2 = i1; i2 <= ip3; i2 +=  ifp2) {
            k1 = i2;
            k2 = k1 + ifp1;
            tempr = (float) wr * data[k2] - (float) wi * data[k2 + 1];
            tempi = (float) wr * data[k2 + 1] + (float) wi * data[k2];
            data[k2] = data[k1] - tempr;
            data[k2 + 1] = data[k1 + 1] - tempi;
            data[k1] += tempr;
            data[k1+1] += tempi;
          }
        }
        wr = (wtemp = wr) * wpr - wi * wpi + wr;
        wi = wi * wpr + wtemp * wpi + wi;
      }
      ifp1 = ifp2;
    }
    nprev *= n;
  }
}
#undef SWAP


void rlft3(float  *** data, float  ** speq, unsigned long nn1, unsigned long nn2,
  unsigned long nn3,  int isign)
{
  unsigned long i1, i2, i3, j1, j2, j3, nn[4], ii3;
  double theta, wi, wpi, wpr, wr, wtemp;
  float c1, c2, h1r, h1i, h2r, h2i;

  if (1 + &data[nn1][nn2][nn3]-&data[1][1][1] ! =  nn1 * nn2 * nn3)
    nrerror("rlft3: problem with dimensions or contiguity of data array\n");
  c1 = 0.5;
  c2 = -0.5 * isign;
  theta = isign * (6.28318530717959/nn3);
  wtemp = sin(0.5 * theta);
  wpr = -2.0 * wtemp * wtemp;
  wpi = sin(theta);
  nn[1] = nn1;
  nn[2] = nn2;
  nn[3] = nn3 >> 1;
  if (isign == 1) {
    fourn(&data[1][1][1] - 1, nn, 3, isign);
    for (i1 = 1; i1 <= nn1; i1++)
      for (i2 = 1, j2 = 0; i2 <= nn2; i2++) {
        speq[i1][++j2] = data[i1][i2][1];
        speq[i1][++j2] = data[i1][i2][2];
      }
  }
  for (i1 = 1; i1 <= nn1; i1++) {
    j1 = (i1 !=  1 ? nn1 - i1 + 2 : 1);
    wr = 1.0;
    wi = 0.0;
    for (ii3 = 1, i3 = 1; i3 <= (nn3 >> 2) + 1; i3++, ii3 += 2) {
      for (i2 = 1; i2 <= nn2; i2++) {
        if (i3 == 1) {
          j2 = (i2 !=  1 ? ((nn2-i2)<<1)+3 : 1);
          h1r = c1 * (data[i1][i2][1]+speq[j1][j2]);
          h1i = c1 * (data[i1][i2][2]-speq[j1][j2+1]);
          h2i = c2 * (data[i1][i2][1]-speq[j1][j2]);
          h2r =  -c2 * (data[i1][i2][2]+speq[j1][j2+1]);
          data[i1][i2][1] = h1r+h2r;
          data[i1][i2][2] = h1i+h2i;
          speq[j1][j2] = h1r-h2r;
          speq[j1][j2+1] = h2i-h1i;
        } else {
          j2 = (i2 !=  1 ? nn2-i2+2 : 1);
          j3 = nn3+3-(i3<<1);
          h1r = c1 * (data[i1][i2][ii3]+data[j1][j2][j3]);
          h1i = c1 * (data[i1][i2][ii3+1]-data[j1][j2][j3+1]);
          h2i = c2 * (data[i1][i2][ii3]-data[j1][j2][j3]);
          h2r = -c2 * (data[i1][i2][ii3+1]+data[j1][j2][j3+1]);
          data[i1][i2][ii3] = h1r+wr * h2r-wi * h2i;
          data[i1][i2][ii3+1] = h1i+wr * h2i+wi * h2r;
          data[j1][j2][j3] = h1r-wr * h2r+wi * h2i;
          data[j1][j2][j3+1] =  -h1i+wr * h2i+wi * h2r;
        }
      }
      wr = (wtemp = wr) * wpr-wi * wpi+wr;
      wi = wi * wpr+wtemp * wpi+wi;
    }
  }
  if (isign  ==  -1)
    fourn(&data[1][1][1]-1, nn, 3, isign);
}


////////////////////////////////////////////////////////////////
// PNG functions
////////////////////////////////////////////////////////////////
void read_png_file(int * width, int * height,
png_byte * color_type, png_byte * bit_depth, png_bytep *row_pointers)
{
  printf("\nLeitura de imagem PNG");
  FILE *fp = fopen("lenna.png", "rb");

  png_structp png = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
  if(!png) abort();

  png_infop info = png_create_info_struct(png);
  if(!info) abort();

  if(setjmp(png_jmpbuf(png))) abort();

  png_init_io(png, fp);

  png_read_info(png, info);

  *width      = png_get_image_width(png, info);
  *height     = png_get_image_height(png, info);
  *color_type = png_get_color_type(png, info);
  *bit_depth  = png_get_bit_depth(png, info);

  printf("\n----Width:%d  Height:%d", *width, *height);

  // Read any color_type into 8bit depth, RGBA format.
  // See http://www.libpng.org/pub/png/libpng-manual.txt

  printf("\n--Vefificando informações da imagem");
  if(*bit_depth  == 16)
    png_set_strip_16(png);

  if(*color_type == PNG_COLOR_TYPE_PALETTE)
    png_set_palette_to_rgb(png);

  // PNG_COLOR_TYPE_GRAY_ALPHA is always 8 or 16bit depth.
  if(*color_type == PNG_COLOR_TYPE_GRAY && *bit_depth < 8)
    png_set_expand_gray_1_2_4_to_8(png);

  if(png_get_valid(png, info, PNG_INFO_tRNS))
    png_set_tRNS_to_alpha(png);

  // These color_type don't have an alpha channel then fill it with 0xff.
  if(*color_type == PNG_COLOR_TYPE_RGB  ||
     *color_type == PNG_COLOR_TYPE_GRAY ||
     *color_type == PNG_COLOR_TYPE_PALETTE)
    png_set_filler(png, 0xFF, PNG_FILLER_AFTER);

  /*if(*color_type == PNG_COLOR_TYPE_GRAY ||
     *color_type == PNG_COLOR_TYPE_GRAY_ALPHA)
    png_set_gray_to_rgb(png);*/

  printf("\n--Realizando o Upgrade de informação");
  png_read_update_info(png, info);

  row_pointers = (png_bytep*)malloc(sizeof(png_bytep) * * height);

  for(int y = 0; y < * height; y++) {
    row_pointers[y] = (png_byte*)malloc(png_get_rowbytes(png,info));
  }

  printf("\n--Lendo os dados");
  png_read_image(png, row_pointers);

  fclose(fp);
}
/*
void write_png_file(char *filename, int width, int height,
png_byte color_type, png_byte bit_depth, png_bytep *row_pointers)
{
  int y;

  FILE *fp = fopen(filename, "wb");
  if(!fp) abort();

  png_structp png = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
  if (!png) abort();

  png_infop info = png_create_info_struct(png);
  if (!info) abort();

  if (setjmp(png_jmpbuf(png))) abort();

  png_init_io(png, fp);

  // Output is 8bit depth, RGBA format.
  png_set_IHDR(
    png,
    info,
    width, height,
    8,
    PNG_COLOR_TYPE_RGBA,
    PNG_INTERLACE_NONE,
    PNG_COMPRESSION_TYPE_DEFAULT,
    PNG_FILTER_TYPE_DEFAULT
  );
  png_write_info(png, info);

  // To remove the alpha channel for PNG_COLOR_TYPE_RGB format,
  // Use png_set_filler().
  //png_set_filler(png, 0, PNG_FILLER_AFTER);

  png_write_image(png, row_pointers);
  png_write_end(png, NULL);

  for(int y = 0; y < height; y++) {
    free(row_pointers[y]);
  }
  free(row_pointers);

  fclose(fp);
}*/

void process_file(int height, int width, png_bytep *row_pointers)
{
  png_byte* row; int x = 0, y = 0;

  for (y=0; y < height; y++) {
    row = row_pointers[y];

    for (x=0; x < width; x++) {
      png_byte* ptr = &(row[x]);
      printf("\nPixel at position [ %d - %d ] has RGBA values: %d - %d - %d - %d\n",
             x, y, ptr[0], 0, 0, 0); //ptr[1], ptr[2], ptr[3]);
    }
  }
}

void copy_png_to_float(int height, int width, png_bytep *row_pointers, float *** data)
{
  png_byte* row; int x = 0, y = 0;

  for (y=0; y<height; y++) {
    row = row_pointers[y];

    for (x=0; x<width; x++) {

      row[x];
      printf("%c", row[x]);
      //printf("\nPixel at position [ %d - %d ] has RGBA values: %c", x, y, (unsigned char) 0);
    }
  }
}


////////////////////////////////////////////////////////////////
// Main Procedure
////////////////////////////////////////////////////////////////
int main(void)
{
  int j = 0;
  float *** data = 0, ** speq = 0;

  // PNG
  int img_width, img_height;
  png_byte color_type;
  png_byte bit_depth;
  png_bytep *row_pointers;
  //const char * file_name = "lenna.png\0";

  read_png_file(& img_width, & img_height, & color_type, & bit_depth, row_pointers);

  printf("\nExecutando f3tensor");
  data = f3tensor(1, img_width, 1, img_height, 1, 1);

  printf("\nExecutando matrix");
  speq = matrix(1, img_width, 1, 2 * img_height);

  copy_png_to_float(img_height, img_width, row_pointers, data);

  //process_file(img_height, img_width, row_pointers);
 /*
  // LOAD DATA

  rlft3(data, speq, N1, N2, N3,  1);

  rlft3(data, speq, N1, N2, N3, -1);

  // UNLOAD DATA AND SPEQ

  free_matrix(speq, 1, N1, 1, 2 * N2);
  free_f3tensor(data, 1, N1, 1, N2, 1, N3);
  */
  printf("\n\n");
  return 0;
}
