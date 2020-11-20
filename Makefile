AS = nasm
ASFLAGS = -g -f elf64 -w+all

LD = ld
LDFLAGS =

OBJECTS = main.o

OUTDIR = bin

all: main

main: $(OBJECTS)
			@mkdir -p $(OUTDIR)
			@$(LD) $(LDFLAGS) -o $(OUTDIR)/$@ $^
main.o: main.asm
			@$(AS) $(ASFLAGS) $<

run: main
			@./bin/main

clean:
			@rm -f *.o main
