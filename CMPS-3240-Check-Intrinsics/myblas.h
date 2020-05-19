#include <stdio.h>
#include <immintrin.h>
#include <stdlib.h>

//run time
void dgemm_rt(int n, double *A, double *B, double *Result)
{
    __builtin_cpu_init();
    if (__builtin_cpu_supports("avx") > 0) {
        //avx optimized
        printf("Running matrix multiplication of size %d x %d with AVX optimization\n", n, n);
        for (int i = 0; i < n; i+=4) {
            for (int j = 0; j < n; j++) {
                __m256d cij = _mm256_loadu_pd(Result+i+j*n);
                for (int k = 0; k < n; k++) {
                    cij = _mm256_add_pd(cij,
                            _mm256_mul_pd(_mm256_loadu_pd(A+i+k*n),
                            _mm256_broadcast_sd(B+k+j*n)));
                }
                _mm256_storeu_pd(Result+i+j*n, cij);
            }
        }
    } else if (__builtin_cpu_supports("sse") > 0) {
        //sse optimized
        printf("Running matrix multiplication of size %d x %d with SSE optimization\n", n, n);
        for (int i = 0; i < n; i+=2) {
            for (int j = 0; j < n; j++) {
                __m128d cij = _mm_loadu_pd(Result+i+j*n);
                for (int k = 0; k <n; k++) {
                    cij = _mm_add_pd(cij,
                            _mm_mul_pd(_mm_loadu_pd(A+i+k*n),
                            _mm_set1_pd(B[k+j*n])));
                }
                _mm_storeu_pd(&Result[i+j*n], cij);
            }
        }
    } else {
        //generic case
        printf("Running matrix multiplication of size %d x %d with no optimization\n", n, n);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
               double cij =  Result[i+j*n];
                for (int k = 0; k < n; k++) {
                    cij += A[i+k*n] * B[k+j*n];
                }
                Result[i+j*n] = cij;
            }
        }
    
    }
    return;
}

//compile time
void dgemm_ct(int n, double *A, double *B, double *Result)
{
    #ifdef __AVX__    
    //avx optimized
        printf("Running matrix multiplication of size %d x %d with AVX optimization\n", n, n);
        for (int i = 0; i < n; i+=4) {
            for (int j = 0; j < n; j++) {
                __m256d cij = _mm256_loadu_pd(Result+i+j*n);
                for (int k = 0; k <n; k++) {
                    cij = _mm256_add_pd(cij,
                            _mm256_mul_pd(_mm256_loadu_pd(A+i+k*n),
                            _mm256_set1_pd(B[k+j*n])));
                }
                _mm256_storeu_pd(&Result[i+j*n], cij);
            }
        }
    #elif __SSE__
        //sse optimized
        printf("Running matrix multiplication of size %d x %d with SSE optimization\n", n, n);
        for (int i = 0; i < n; i+=2) {
            for (int j = 0; j < n; j++) {
                __m128d cij = _mm_loadu_pd(Result+i+j*n);
                for (int k = 0; k <n; k++) {
                    cij = _mm_add_pd(cij,
                            _mm_mul_pd(_mm_loadu_pd(A+i+k*n),
                            _mm_set_pd1(B[k+j*n])));
                }
                _mm_storeu_pd(&Result[i + j *n], cij);
            }
        }
    #else
        //generic case
        printf("Running matrix multiplication of size %d x %d with no optimization\n", n, n);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
               double cij =  Result[i+j*n];
                for (int k = 0; k < n; k++) {
                    cij += A[i+k*n] * B[k+j*n];
                }
                Result[i+j*n] = cij;
            }
        }
    #endif 
    return;
}
