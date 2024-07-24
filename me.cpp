#include<cuda_runtime.h>


int main() {
	int 
}
void mult2dmat( int* A,int*B ,int n,int m,int o){
	int * a;
	int * b;
	cudaError_t cudaStatus;
	cudaStatus = cudaSetDevice(0);
	if (cudaStatus != cudaSuccess)
		goto err;
	cudaPitchedPtr* a;
	cudaStatus = cudaMalloc3D();
}