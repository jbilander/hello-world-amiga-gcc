FILENAME=hello
DIR=build
DEBUGDIR=build-debug
OBJECTS=hello.o

SRCDIRS=.

CC=m68k-amigaos-gcc
AS=m68k-amigaos-as
VASM=vasmm68k_mot

ifeq ($(MAKECMDGOALS), debug)
	DIR=$(DEBUGDIR)
	CFLAGS=-g -DDEBUG
	ASFLAGS=-g
	VASMFLAGS=-linedebug
	LDFLAGS=-ldebug
else
	CFLAGS=-s -O2
endif

CFLAGS+=-m68000 -Wall -fomit-frame-pointer -mcrt=nix13 -fbaserel
ASFLAGS+=-m68000
LDFLAGS+=-Wl,-Map=$(DIR)/$(FILENAME).map
VASMFLAGS+=-Fhunkexe -kick1hunks

# Search paths
vpath %.c $(SRCDIRS)
vpath %.s $(SRCDIRS)
vpath %.asm $(SRCDIRS)

OBJS:=$(addprefix $(DIR)/,$(OBJECTS))

all: $(DIR)/$(FILENAME)
debug: $(DIR)/$(FILENAME)

$(DIR)/$(FILENAME): $(DIR) $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

$(DIR):
	mkdir $(DIR)

$(DIR)/%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(DIR)/%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

$(DIR)/%.o: %.asm
	$(VASM) $(VASMFLAGS) -o $@ $<

clean:
	rm -rf $(DIR)
	rm -rf $(DEBUGDIR)

.PHONY: all clean debug