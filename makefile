AS = as
CC = gcc
CC_FLAGS = -w

EXEC = main
SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.s=.o)

$(EXEC): $(OBJECTS)
	$(CC) -o $(EXEC) $(OBJECTS)

link: $(OBJECTS)
	ld -dynamic-linker /lib/ld-linux-armhf.so.3 -o $(EXEC) $(OBJECTS)

%.o: %.s
	$(AS) -c $< -o $@

clean:
	rm -f $(EXEC) $(OBJECTS)
