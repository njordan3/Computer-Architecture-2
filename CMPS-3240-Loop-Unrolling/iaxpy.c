#include <stdlib.h>
#include <stdio.h>

#define N 100000000

int main()
{
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
    return 0;
}
