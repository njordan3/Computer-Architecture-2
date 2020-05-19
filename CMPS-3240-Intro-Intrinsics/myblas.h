// FGEMM ops. 'u' stands for unoptimized and 'o' stands for optimized. 
void faxpyu( int, float, float*, float*, float*);
void faxpyo( int, float, float*, float*, float*);
void fgemmu( int n, float* A, float* B, float* C );
void fgemmo( int n, float* A, float* B, float* C );
