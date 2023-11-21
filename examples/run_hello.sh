#!/bin/bash

nasm -f macho64 hello.asm
ld -macos_version_min 10.12 -lSystem -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -o hello hello.o -no_pie
./hello
rm hello.o hello