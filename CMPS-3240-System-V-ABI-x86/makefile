COMPILER=gcc
FLAGS=-Wall -O0

all: example_arguments example_fact example_fact.s

example_arguments:	example_arguments.c
	$(COMPILER) $(FLAGS) -S -o $@.s $<
	
#example_fact.o:	example_fact.c
#	$(COMPILER) $(FLAGS) -c $^

example_fact.s:	example_fact.c
	$(COMPILER) $(FLAGS) -S -o $@ $<

example_fact:	example_fact.o
	$(COMPILER) $(FLAGS) -o $@.out $<

assembly: example_fact.o
	$(COMPILER) example_fact.o -o example_fact.out

example_fact.o: example_fact.s
	$(COMPILER) $(FLAGS) -c example_fact.s -o example_fact.o

clean:
	rm -f *.o *.s *.out
