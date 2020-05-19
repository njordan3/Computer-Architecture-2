#include "myblas.h"

int main(int arg, char *argv[])
{
    if (arg != 2) {
        printf("Usage: ./dgemm N ... where N is the length of one side of the matrix\n");
        return 1;
    }
    const int N = atoi(argv[1]);
    double *A = (double*) malloc(N * N * sizeof(double));
    double *B = (double*) malloc(N * N * sizeof(double));
    double *Result = (double*) malloc(N * N * sizeof(double));
    
#ifdef CompileTime
    printf("Compile time\n");
    dgemm_ct(N, A, B, Result);
#else    
    printf("Run time\n");
    dgemm_rt(N, A, B, Result);
#endif
    _mm_free(A);
    _mm_free(B);
    _mm_free(Result);
    return 0;
}
