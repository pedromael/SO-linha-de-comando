all: os-image.bin

os-image.bin: boot.bin kernel.o main.o
	cat boot.bin kernel.o main.o > os-image.bin

boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin

kernel.o: kernel.c
	gcc -ffreestanding -c kernel.c -o kernel.o

main.o: main.c
	gcc -ffreestanding -c main.c -o main.o

clean:
	rm -f *.bin *.o os-image.bin
