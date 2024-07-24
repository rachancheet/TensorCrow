#include<cuda_runtime.h>
#include<device_launch_parameters.h>

int mul() {
	int* a[], * b[], * c[];
	std::pair<int,int> size(5,5);
	int id = 0;

	cuda
	
	
	cudaError status;
	status = cudaSetDevice(id);
	if (status != cudaSuccess) {
		std::cout << "ERROR no GPu";
		goto error;
	}




}