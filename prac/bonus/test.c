#include <stdio.h>
#include <stdlib.h>
#include "test.h"

#define length 100000000

int main() {
    float *x = (float *)malloc(length * sizeof(float*));
    float *y = (float *)malloc(length * sizeof(float*));
    float *z = (float *)malloc(length * sizeof(float*));
    float *w = (float *)malloc(length * sizeof(float*));
    
    vectOp(length, 1.0, 1.0, x, y, z, w);

    free(x);
    free(y);
    free(z);
    free(w);
    return 0;
}
