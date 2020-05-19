#include <stdlib.h>
#include <stdio.h>

#define N 200000000

int main(int argc, char **argv)
{
    int *a = (int*) malloc(sizeof(int) * N);
    int *b = (int*) malloc(sizeof(int) * N);

    for (int i = 0; i < N; i++) {
        a[i] = b[i] * b[i];
    }

    free(a);
    free(b);

    return 0;
}
