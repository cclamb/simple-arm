# I am a comment, and I want to say that the variable CC will be
# the compiler to use.
CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
AS=arm-none-eabi-as
BINCPY=arm-none-eabi-objcopy

# Hey!, I am comment number 2. I want to say that CFLAGS will be the
# options I'll pass to the compiler.
CFLAGS=-c -mcpu=arm926ej-s -g -Wall
LDFLAGS=
ASFLAGS=-mcpu=arm926ej-s -g

all: main
	$(BINCPY) -O binary main.elf main.bin

main: main.o entry.o
	$(LD) $(LDFLAGS) -T src/main.ld main.o entry.o -o main.elf

main.o: src/main.c
	$(CC) $(CFLAGS) src/main.c -o main.o

entry.o: src/entry.s
	$(AS) $(ASFLAGS) src/entry.s -o entry.o

clean:
	rm -rf *o *.elf *~ *.bin
 
# CC=g++
# CFLAGS=-c -Wall
# LDFLAGS=
# SOURCES=main.cpp hello.cpp factorial.cpp
# OBJECTS=$(SOURCES:.cpp=.o)
# EXECUTABLE=hello

# all: $(SOURCES) $(EXECUTABLE)
	
# $(EXECUTABLE): $(OBJECTS) 
# 	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

# .cpp.o:
# 	$(CC) $(CFLAGS) $< -o $@
