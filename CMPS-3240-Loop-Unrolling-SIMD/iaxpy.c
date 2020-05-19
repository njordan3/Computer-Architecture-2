#include <stdlib.h>
#include <stdio.h>
#include <immintrin.h>

#define N 100000000

int main()
{

    #ifdef UNOPTIMIZED
    int A = 1;
    int *X = (int*) malloc(sizeof(int) * N);
    int *Y = (int*) malloc(sizeof(int) * N);
    int *result = (int*) malloc(sizeof(int) * N);
        for (int i = 0; i < N; i++) {
            result[i] = A * X[i] + Y[i];
        }
    free(X);
    free(Y);
    free(result);
    #endif

    #ifdef UNROLL
    int A = 1;
    int *X = (int*) malloc(sizeof(int) * N);
    int *Y = (int*) malloc(sizeof(int) * N);
    int *result = (int*) malloc(sizeof(int) * N);
        for (int i = 0; i < N; i+=10) {
            result[i] = A * X[i] + Y[i];
            result[i] = A * X[i+1] + Y[i+1];
            result[i] = A * X[i+2] + Y[i+2];
            result[i] = A * X[i+3] + Y[i+3];
            result[i] = A * X[i+4] + Y[i+4];
            result[i] = A * X[i+5] + Y[i+5];
            result[i] = A * X[i+6] + Y[i+6];
            result[i] = A * X[i+7] + Y[i+7];
            result[i] = A * X[i+8] + Y[i+8];
            result[i] = A * X[i+9] + Y[i+9];
        }
    free(X);
    free(Y);
    free(result);
    #endif

    #ifdef SIMD
    float A = 1;
    float *X = (float*) malloc(sizeof(float) * N);
    float *Y = (float*) malloc(sizeof(float) * N);
    float *result = (float*) malloc(sizeof(float) * N);
        __m128 a_mm = _mm_set1_ps(A);
        for (int i = 0; i < N; i+=4) {
            __m128 x_mm = _mm_mul_ps(a_mm, _mm_loadu_ps(X+i));
            __m128 y_mm = _mm_loadu_ps(Y+i);
            _mm_storeu_ps(result+i, _mm_add_ps(x_mm, y_mm));
        }
    _mm_free(X);
    _mm_free(Y);
    _mm_free(result);
    #endif

    #ifdef SIMD_UNROLL
    float A = 1;
    float *X = (float*) malloc(sizeof(float) * N);
    float *Y = (float*) malloc(sizeof(float) * N);
    float *result = (float*) malloc(sizeof(float) * N);
        __m128 a_mm = _mm_set1_ps(A);
        for (int i = 0; i < N; i+=8) {
            __m128 x_mm = _mm_mul_ps(a_mm, _mm_loadu_ps(X+i));
            __m128 y_mm = _mm_loadu_ps(Y+i);
            _mm_storeu_ps(result+i, _mm_add_ps(x_mm, y_mm));
            
            x_mm = _mm_mul_ps(a_mm, _mm_loadu_ps(X+i+4));
            y_mm = _mm_loadu_ps(Y+i+4);
            _mm_storeu_ps(result+i+4, _mm_add_ps(x_mm, y_mm));
        }
    _mm_free(X);
    _mm_free(Y);
    _mm_free(result);
    #endif

    return 0;
}
