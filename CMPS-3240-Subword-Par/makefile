CC=gcc
FLAGS=-O0 -Wall
BLAS_ASM=myblas.s

all: bench_faxpy.out myblas.o

# Targets to make our benchmark binary
bench_faxpy.o: bench_faxpy.c myblas.h
	${CC} ${FLAGS} -o $@ -c $<
bench_faxpy.out: bench_faxpy.o myblas.o
	${CC} ${FLAGS} -o $@ $^
myblas.o: myblas.s myblas.h
	${CC} ${FLAGS} -c $<

# assembles x86 from C
assemble: myblas.c
	${CC} ${FLAGS} -S myblas.c
# Be carefule not to put your .s file here
clean: 
	rm -f *.o *.out
