#include <stdio.h>
#include <stdlib.h>
#include "myblas.h"


int main( int argc, char *argv[] ) {
   if( argc != 2 ) {
     printf( "Usage: ./test_dgemm.out N ... where N is the length of one side of the vector\n"  );
     return 0;
   }

   // Vector is size arg[1] x 1
   int N = atoi( argv[1] );
   printf( "Running DGEMM operation of size %d x 1", N );

   // Create three N x 1 matrixes on the heap using malloc, also create a scalar
   double *X = (double *) malloc( N * N * sizeof(double) );      // First vector
   double *Y = (double *) malloc( N * N * sizeof(double) );      // Second vector
   double *Result = (double *) malloc( N * N * sizeof(double) );      // Result vector

   // Carry out the operation
   dgemm( N, X, Y, Result);

   // Free up the memory
   free( X );
   free( Y );
   free( Result );

   return 0;
}
