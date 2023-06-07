HELLO_EXE=hello
HELLO_OBJS=hello.o

CC=m68k-amigaos-gcc
CFLAGS=-m68000 -s -O2 -Wall -fomit-frame-pointer -noixemul -fbaserel
LDFLAGS=-Wl,-Map=$(HELLO_EXE).map

all: $(HELLO_EXE)

$(HELLO_EXE) : $(HELLO_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(HELLO_EXE) $(HELLO_OBJS)

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f hello.o
	rm -f hello
	rm -f hello.map
