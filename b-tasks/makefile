AS = as
CC = gcc
CC_FLAGS = -w

EXEC = main
SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.s=.o)

power: powerOfTwo.o utilities.o
	ld -o powerOfTwo powerOfTwo.o utilities.o

add: addSixNumbers.o utilities.o
	ld -o addSixNumbers addSixNumbers.o utilities.o

utilities.o: ../utilities.s
	as -c ../utilities.s -o utilities.o

powerOfTwo.o: powerOfTwo.s
	as -c powerOfTwo.s -o powerOfTwo.o

addSixNumbers.o: addSixNumbers.s
	as -c addSixNumbers.s -o addSixNumbers.o

long: intToLong.s
	gcc -o intToLong intToLong.s

thumb: thumb.s
	as -c thumb.s -o thumb.o
	ld -o thumb thumb.o

array: array.s
	gcc -o array array.s

malloc: malloc.s
	gcc -o malloc malloc.s

clean:
	rm -f powerOfTwo addSixNumbers array malloc thumb intToLong *.o
