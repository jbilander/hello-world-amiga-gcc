CC=m68k-amigaos-gcc
CFLAGS=-Wall
LDFLAGS=-nostdlib

HELLO_EXE=hello
HELLO_OBJS=hello.o

all: $(HELLO_EXE)

$(HELLO_EXE) : $(HELLO_OBJS) 
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(HELLO_EXE) $(HELLO_OBJS)

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f hello.o
	rm -f hello