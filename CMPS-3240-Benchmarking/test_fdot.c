#include <stdio.h>
#include <stdlib.h>
#include "myblas.h"


int main( int argc, char *argv[] ) {
   if( argc != 2 ) {
     printf( "Usage: ./test_fdot.out N ... where N is the length of one side of the vector\n"  );
     return 0;
   }

   // Vector is size arg[1] x 1
   int N = atoi( argv[1] );
   printf( "Running FDOT operation of size %d x 1", N );

   // Create three N x 1 matrixes on the heap using malloc, also create a scalar
   float *X = (float *) malloc( N * sizeof(float) );      // First vector
   float *Y = (float *) malloc( N * sizeof(float) );      // Second vector

   // Carry out the operation
   fdot( N, X, Y);

   // Free up the memory
   free( X );
   free( Y );

   return 0;
}
