all: unoptimized unroll simd simd_unroll

unoptimized:
	gcc -Wall -O0 -D UNOPTIMIZED iaxpy.c -o unoptimized.out

unroll:
	gcc -Wall -O0 -D UNROLL iaxpy.c -o unroll.out

simd:
	gcc -Wall -O0 -D SIMD iaxpy.c -o simd.out

simd_unroll:
	gcc -Wall -O0 -D SIMD_UNROLL iaxpy.c -o simd_unroll.out

clean:
	rm -f *.o *.out
