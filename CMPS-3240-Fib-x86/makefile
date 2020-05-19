# See https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# for a full explanation of automatic variables in makefiles.

COMPILER=gcc
FLAGS=-Wall -O0

all: fact fact.s

# Compile fact.c into a binary
fact:	fact.c
	$(COMPILER) $(FLAGS) -o $@.out $@.c

fact.s:	fact.c
	$(COMPILER) $(FLAGS) -o $@ -S $<

fib.s: fact.c
	$(COMPILER) $(FLAGS) -o $@.out $<

# This guy is not included in all and will have to be executed manually with 
# 'make hello.asm'. It generates assembly code.
#fact.s: fact.c
#	$(COMPILER) $(FLAGS) -o fact.s -S fact.c

# This guy reassembles code generated from the above target
assemble: fact.o
	$(COMPILER) fact.o -o fact.out

fact.o: fact.s
	$(COMPILER) $(FLAGS) -c fact.s -o fact.o

clean: 
	rm -f *.o *.s *.out
