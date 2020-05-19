#include <immintrin.h>
#include <stdio.h>

int main() {
	/* Initialize the two argument vectors */
    float even[4] = {2.0, 4.0, 6.0, 8.0};
    float odd[4] = {1.0, 3.0, 5.0, 7.0};
	__m128 evens = _mm_loadu_ps(&even[0]);
	__m128 odds = _mm_loadu_ps(&odd[0]);
	// '__m128' is the data type for using a 128-bit MM register
	// '_mm_set_ps' is the function to load a 128-bit MM register with four 
	// ... single precision values. 'ps' stands for packed single precisions
	
	/* Compute the difference between the two vectors */
	__m128 result = _mm_sub_ps(evens, odds);
	// '_mm_sub_ps' is the command to subtract two 128-bit, packed, single 
	// prec. ... MM registers

	/* Display the elements of the result vector */
	float f[4];
    _mm_storeu_ps(f, result);
	printf("%f %f %f %f\n",
	f[0], f[1], f[2], f[3] );

	return 1;
}
