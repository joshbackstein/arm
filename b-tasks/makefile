AS = as
CC = gcc
CC_FLAGS = -w

EXEC = main
SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.s=.o)

power: powerOfTwo.o utilities.o
	ld -o powerOfTwo powerOfTwo.o ../utilities.o

utilities.o:
	as -c ../utilities.s -o ../utilities.o

powerOfTwo.o:
	as -c powerOfTwo.s -o powerOfTwo.o

long:
	gcc -o intToLong intToLong.s

thumb:
	as -c thumb.s -o thumb.o
	ld -o thumb thumb.o

array:
	gcc -o array array.s

clean:
	rm -f powerOfTwo array thumb intToLong *.o
