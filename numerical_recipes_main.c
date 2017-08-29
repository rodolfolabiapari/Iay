#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "AOCL.h"

#define PLATFORM_NAME "Intel(R) FPGA"
#define BINARY_NAME "kernel_code.aocx"

cl_int status = 0;
cl_context context     = NULL;
cl_command_queue queue = NULL;
cl_program program     = NULL;
cl_kernel kernel       = NULL;

// Runtime constants
 // Used to define the work set over which this kernel will execute
static const size_t work_group_size  = 8;
// Defines kernel argument value, which is the workitem ID that will
static const int thread_id_to_output = 2;

//#include "nrutil.c"
//#include "png_files.h"

int nn1 = 1, nn2 = 512, nn3 = 512;

//float data[nn1][nn2][nn3], speq[nn1][2 * nn2];
float data[  3][512][512], speq[  3][2 * 512];


void cl_cleanup();

////////////////////////////////////////////////////////////////
// Fourier Functions
////////////////////////////////////////////////////////////////
//void fourn(float data[nn1 * nn2 * nn3], unsigned long nn[4], int ndim, int isign)
void fourn(float data[], long nn[4], int ndim, int isign);

void rlft3(int nn1, int nn2, int nn3, int isign);

void random_to_float(int height, int width);

//void print_float(int width, int height, float *** data);


////////////////////////////////////////////////////////////////
// Main Procedure
////////////////////////////////////////////////////////////////
int main(void)
{
  cl_uint num_platforms = 0;

  // Starting the OpenCL for FPGA
  // Get the first platform ID
  cl_platform_id * platform_id;
  platform_id = get_platforms(&num_platforms, &status);
  test_error(status, "ERROR: Unable to find the OpenCL platform.\n", &cleanup);
  // print some info on the selected platform
  {
    char* platform_info = get_platform_info(platform, CL_PLATFORM_NAME);
    printf("%-20s = %s\n", "CL_PLATFORM_NAME", platform_info);
    platform_info = get_platform_info(platform, CL_PLATFORM_VENDOR);
    printf("%-20s = %s\n", "CL_PLATFORM_VENDOR", platform_info);
    platform_info = get_platform_info(platform, CL_PLATFORM_VERSION);
    printf("%-20s = %s\n", "CL_PLATFORM_VERSION", platform_info);
  }

  // Get all the FPGAs devices in the platform
  cl_device_id * devices_id, device;
  cl_uint num_devices = 0;
  devices_id = get_devices(platform_id, CL_DEVICE_TYPE_ACCELERATOR,
    &num_devices, &status);
  test_error(status, "ERROR: Unable to find any device.\n", &cleanup);

  device_id = devices[0];

  // Create an OpenCL context for the FPGA device
  context = clCreateContext(NULL, 1, &device_id, &ocl_context_callback_message,
    NULL, &status);
	test_error(status, "ERROR: Failed to open the context.\n", &cleanup);


  // Create an OpenCl command queue
  queue = clCreateCommandQueue(context, device_id, CL_QUEUE_PROFILING_ENABLE,
    &status);
	test_error(status, "ERROR: Failed to create command queue.\n", &cleanup);

  // clCreateProgramWithSource Não funciona com a intel
  // Por isso, utiliza-se a funcao abaixo, com arquivos aocx
  program = create_program_from_binary(context, BINARY_NAME, &device_id, 1,
    &status);
	test_error(status, "ERROR: Failed to create the program.\n", &cleanup);

  // Build the program that was just created
  status  = clBuildProgram(program, 1, &device_id, "", NULL, NULL);
	test_error(status, "ERROR: Failed to build the program.\n", &cleanup);



  // Creates the Kernel - name passed in there must match kernel name in the
   // original CL file, that was compiled into an AOCX file using the AOC tool
  // Kernel name, as defined in the CL file
  const char * kernel_name = "hello_world";

  // Create kernels form the program
  kernel = clCreateKernel(program, kernel_name, &error);
	test_error(status, "ERROR: Failed to create the kernel.\n", &cleanup);



/*
    // Allocate and transfer buffers on/to device
    float * a_host = ...
    cl_mem a_device = clCreateBuffer(..., CL_MEM_COPY_HOST_PTR, a_host, ...);
    cl_float c_host = 10.8;

    error = clEnqueueWriteBuffer(queue, a_device, CL_TRUE, 0,
      NUM_ELEMENTS * sizeof(cl_float), a_host, 0, NULL, NULL);
*/


  // Set up the kernel argument list
  status = clSetKernalArg(kernel, 0, sizeof(cl_mem),   (void *) &a_device);
	test_error(status, "ERROR: Failed to set kernel arg 0.\n", &cleanup);
  error = clSetKernalArg(kernel, 1, sizeof(cl_float), (void *) &c_host);
  error = clSetKernalArg(kernel, 2, sizeof(cl_int),   (void *) &NUM_ELEMENTS);


	printf("\nKernel initialization is complete.\n");
	printf("Launching the kernel...\n\n");


  // Run the kernel on the device
  error = clEnqueueTask(queue, a_device, CL_TRUE, 0,
    NUM_ELEMENTS * sizeof(cl_float), a_host, 0, NULL, NULL);



  // Memory Management - code example
  const int N  = 5;
  int n_bytes = N * sizeof(int);
  int host_array [N] = {3, 1, 4, 1, 5};


  // Allocate memory on device
  cl_mem memory;
  memory = clCreateBuffer(context, CL_MEM_READ_WRITE, n_bytes, NULL, &cl_error);

  cl_error = clEnqueueWriteBuffer(queue, memory, CL_TRUE, 0, n_bytes,
    host_array, 0, NULL, NULL);



/*
  // PNG
  int img_width = nn3, img_height = nn2, img_depth = nn1;
  //srand(10);
  //const char * file_name = "lenna.png\0";

  //read_png_file(& img_width, & img_height, & color_type, & bit_depth, & row_pointers);

  printf("Executando f3tensor\n");
  //data = f3tensor(1, 1, 1, img_height, 1, img_width);

  printf("Executando matrix\n");
  //speq = matrix(1, 1, 1, 2 * img_height);

  //copy_png_to_float(img_height, img_width, row_pointers, data);
  random_to_float(img_height / 2, img_width / 2);

  unsigned long n [4] = {1, 512, 256};
  //fourn(&data[1][1][1], n, 3, 1);
  //fourn(n, 3, 1);

  printf("rlft3-1\n");
  rlft3(nn1, nn2, nn3, 1);

  printf("rlft3-1\n");
  //rlft3(data, speq, img_width, img_height, img_depth, -1);

  // UNLOAD DATA AND SPEQ

  printf("Freeing\n");
  //free_matrix(speq, 1, img_width, 1, 2 * img_height);
  //free_f3tensor(data, 1, img_width, 1, img_height, 1, img_depth);
  //free_matrix(speq, 0, img_width, 0, 2 * img_height);
  //free_f3tensor(data, 0, img_width, 0, img_height, 0, img_depth);

*/

	// Configure work set over which the kernel will execute
	size_t wgSize[3] = { work_group_size, 1, 1 };
	size_t gSize[3] = { work_group_size, 1, 1 };

	// Launch the kernel
	status = clEnqueueNDRangeKernel(queue, kernel, 1, NULL, gSize, wgSize, 0, NULL, NULL);
	test_error(status, "ERROR: Failed to launch the kernel.\n", &cleanup);

  // Wait for command queue to complete pending events
	status = clFinish(queue);
	test_error(status, "ERROR: Failed to finish.\n", &cleanup);

	printf("\nKernel execution is complete.\n");

  cleanup();

  printf("\n\n");
  return 0;
}


void cl_cleanup() {
   if (kernel) {
      clReleaseKernel(kernel);
   }
   if (program) {
      clReleaseProgram(program);
   }
   if (queue) {
      clReleaseCommandQueue(queue);
   }
   if (context) {
      clReleaseContext(context);
   }
}


#define SWAP(a,b) tempr=(a);(a)=(b);(b)=tempr

////////////////////////////////////////////////////////////////
// Fourier Functions
////////////////////////////////////////////////////////////////
//void fourn(float data[nn1 * nn2 * nn3], unsigned long nn[4], int ndim, int isign)
void fourn(float data[], long nn[4], int ndim, int isign)
{
	int idim;
	long i1=0,i2=0,i3=0,i2rev=0,i3rev=0,ip1=0,ip2=0,ip3=0,ifp1=0,ifp2=0;
	long ibit=0,k1=0,k2=0,n=0,nprev=0,nrem=0,ntot=0;
	float tempi=0,tempr=0;
	double theta=0,wi=0,wpr=0,wr=0,wtemp=0,wpi=0;
	ntot=1;
	for (idim=1;idim<=ndim;idim++)
		ntot *= nn[idim];
	nprev=1;

	for (idim=ndim;idim>=1;idim--) {
		n=nn[idim];
		nrem=ntot/(n*nprev);
		ip1=nprev << 1;
		ip2=ip1*n;
		ip3=ip2*nrem;
		i2rev=1;
		for (i2=1;i2<=ip2;i2+=ip1) {
			if (i2 < i2rev) {
				for (i1=i2;i1<=i2+ip1-2;i1+=2) {
					for (i3=i1;i3<=ip3;i3+=ip2) {
						i3rev=i2rev+i3-i2;
						SWAP(data[i3],data[i3rev]);
						SWAP(data[i3+1],data[i3rev+1]);
					}
				}
			}
			ibit=ip2 >> 1;
			while (ibit >= ip1 && i2rev > ibit) {
				i2rev -= ibit;
				ibit >>= 1;
			}
			i2rev += ibit;
		}
		ifp1=ip1;
		while (ifp1 < ip2) {
			ifp2= ifp1 << 1;
			theta= (isign * 6.28318530717959) /(ifp2/ip1);
			wtemp=sinf(0.5*theta);
			/*wpr = -2.0*wtemp*wtemp;
			wpi=sinf(theta);
			wr=1.0;
			wi=0.0;
			/*for (i3=1;i3<=ifp1;i3+=ip1) {
				for (i1=i3;i1<=i3+ip1-2;i1+=2) {
					for (i2=i1;i2<=ip3;i2+=ifp2) {
						k1=i2;
						k2=k1+ifp1;
						tempr=(float)wr*data[k2]-(float)wi*data[k2+1];
						tempi=(float)wr*data[k2+1]+(float)wi*data[k2];
						data[k2]=data[k1]-tempr;
						data[k2+1]=data[k1+1]-tempi;
						data[k1] += tempr;
						data[k1+1] += tempi;
					}
				}
				wr=(wtemp=wr)*wpr-wi*wpi+wr;
				wi=wi*wpr+wtemp*wpi+wi;
			}*/
			ifp1=ifp2;
		}
		nprev *= n;
	}
}
#undef SWAP


void rlft3(int nn1, int nn2, int nn3, int isign)
{
	long i1,i2,i3,j1,j2,j3,nn[4],ii3;
	float theta,wi,wpr,wr,wtemp,wpi;
	float c1,c2,h1r,h1i,h2r,h2i;
	float buffer;

	if (1+&data[nn1][nn2][nn3]-&data[1][1][1] != nn1*nn2*nn3) {
		printf("rlft3: problem with dimensions or contiguity of data array\n");
		while(1) ;
	}
	c1=0.5;
	c2 = -0.5*isign;
	theta=isign*(6.28318530717959/nn3);
	wtemp=sinf(0.5*theta);
	wpr = -2.0*wtemp*wtemp;
	wpi=sinf(theta);
	nn[1]=nn1;
	nn[2]=nn2;
	nn[3]=nn3 >> 1;
	if (isign == 1) {
		//fourn(&data[1][1][1]-1,nn,3,isign);

		for (i1=1;i1<=nn1;i1++)
			j2=1;
			for (i2=1;i2<=nn2;i2++) {
				speq[i1][j2++] = data[i1][i2][1];
				speq[i1][j2++]=data[i1][i2][2];
			}
	}
	for (i1=1;i1<=nn1;i1++) {
		j1=(i1 != 1 ? nn1-i1+2 : 1);
		wr=1.0;
		wi=0.0;
		for (ii3=1,i3=1;i3<=(nn3>>2)+1;i3++,ii3+=2) {
			for (i2=1;i2<=nn2;i2++) {
				if (i3 == 1) {
					j2=(i2 != 1 ? ((nn2-i2)<<1)+3 : 1);
					h1r=c1*(data[i1][i2][1]+speq[j1][j2]);
					h1i=c1*(data[i1][i2][2]-speq[j1][j2+1]);
					h2i=c2*(data[i1][i2][1]-speq[j1][j2]);
					h2r= -c2*(data[i1][i2][2]+speq[j1][j2+1]);
					data[i1][i2][1]=h1r+h2r;
					data[i1][i2][2]=h1i+h2i;
					speq[j1][j2]=h1r-h2r;
					speq[j1][j2+1]=h2i-h1i;
				} else {
					j2=(i2 != 1 ? nn2-i2+2 : 1);
					j3=nn3+3-(i3<<1);
					h1r=c1*(data[i1][i2][ii3]+data[j1][j2][j3]);
					h1i=c1*(data[i1][i2][ii3+1]-data[j1][j2][j3+1]);
					h2i=c2*(data[i1][i2][ii3]-data[j1][j2][j3]);
					h2r= -c2*(data[i1][i2][ii3+1]+data[j1][j2][j3+1]);
					data[i1][i2][ii3]=h1r+wr*h2r-wi*h2i;
					data[i1][i2][ii3+1]=h1i+wr*h2i+wi*h2r;
					data[j1][j2][j3]=h1r-wr*h2r+wi*h2i;
					data[j1][j2][j3+1]= -h1i+wr*h2i+wi*h2r;
				}
			}
			wr=(wtemp=wr)*wpr-wi*wpi+wr;
			wi=wi*wpr+wtemp*wpi+wi;
		}
	}
	if (isign == -1)
		fourn(&data[1][1][1]-1,nn,3,isign);
}



void random_to_float(int height, int width)
{
	printf("Copiando os dados para float\n");
	int col_pos = 0, row_pos = 0;
	for (row_pos = 1; row_pos <= height; row_pos++) {
		for (col_pos = 1; col_pos <= width; col_pos++) {
			data[1][row_pos][col_pos] = row_pos * col_pos;
		}
	}
}

/*void print_float(int width, int height, float *** data)
{
  int col_pos = 0, row_pos = 0;

  for (row_pos=0; row_pos < height; row_pos++) {
    for (col_pos=0; col_pos < width; col_pos++) {
      printf("%f\n", data[row_pos][col_pos][0]);
    }
  }
}*/
