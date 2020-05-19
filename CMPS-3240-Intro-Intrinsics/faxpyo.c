#include <immintrin.h>  // Required for '_mm_free()' 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myblas.h"

// 1 trillion
#define N 1000000000

int main( void ) {
    float *A = (float *) malloc(N * sizeof(float)); // First
    float *B = (float *) malloc(N * sizeof(float)); // Second
    float *RESULT = (float *) malloc(N * sizeof(float)); // Result

    faxpyo( N, 1.0, A, B, RESULT );

    // Free up the memory
    _mm_free( A );
    _mm_free( B );
    _mm_free( RESULT );

    return 0;
}
