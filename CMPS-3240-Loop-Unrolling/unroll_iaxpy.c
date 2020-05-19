#include <stdlib.h>
#include <stdio.h>

void IAXPY(int N, int A, int *X, int *Y, int *result);

int main()
{
    const int N = 1000000000;
    int *X = (int*) malloc(sizeof(int) * N);
    int *Y = (int*) malloc(sizeof(int) * N);
    int *result = (int*) malloc(sizeof(int) * N);

    IAXPY(N, 1, X, Y, result);

    free(X);
    free(Y);
    free(result);
    return 0;
}

void IAXPY(int N, int A, int *X, int *Y, int *result)
{
    for (int i = 0; i < N; i++) {
        result[i] = A * X[i] + Y[i];
    }
}
