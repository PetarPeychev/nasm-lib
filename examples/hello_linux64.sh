#!/bin/bash

nasm -f elf64 hello_linux64.asm
ld  -o hello_linux64 hello_linux64.o
./hello_linux64
rm hello_linux64.o hello_linux64