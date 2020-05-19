#include <stdlib.h>
#include <stdio.h>

#define N 200000000

int main(int argc, char **argv)
{
    int *a = (int*) malloc(sizeof(int) * N);
    int *b = (int*) malloc(sizeof(int) * N);

    for (int i = 0; i < N; i+=2) {
        a[i] = b[i] * b[i];
        a[i+1] = b[i+1] * b[i+1];
    }

    free(a);
    free(b);

    return 0;
}
