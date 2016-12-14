AS = as
CC = gcc
CC_FLAGS = -w

EXEC = main
SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.s=.o)

$(EXEC): $(OBJECTS)
	$(CC) -o $(EXEC) $(OBJECTS)

link: $(OBJECTS)
	ld -o $(EXEC) $(OBJECTS)

%.o: %.s
	$(AS) -c $< -o $@

clean:
	rm -f $(EXEC) $(OBJECTS)
