
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>

__global__ void merabetaKernel(int* a, int* b, int* c,int n ) {
	int i = threadIdx.x;
	if(i<n)
	c[i] = c[i] + a[i] + b[i];

}


void MatAdd(int * a,int *b,int *c,int size) {
	int *a, *b, *c;
	int size = 5;
	int id =0 ;
	cudaError status;
	status= cudaSetDevice(id);
	if (status != cudaSuccess) {
		printf("ERROR no GPu");
		goto error;
	}
	
	cudaMallocManaged(&a, 5);
	cudaMallocManaged(&b, 5);
	cudaMallocManaged(&c, 5);

	std::fill_n(a, 5, 6);
	std::fill_n(b, 5, 45);
	std::fill_n(c, 5, 20);

	b[2] = 78;
	
	cudaMemPrefetchAsync(a, size, id);
	cudaMemPrefetchAsync(b, size, id);
	cudaMemPrefetchAsync(c, size, id);
	merabetaKernel <<< 1, size >>> (a, b, c,size);
	cudaDeviceSynchronize();
	cudaMemPrefetchAsync(c, size, cudaCpuDeviceId);

	for (int i = 0; i < size; i++)
		printf("%d \n",c[i]);




error:
	cudaFree(a);
	cudaFree(b);
	cudaFree(c);




}