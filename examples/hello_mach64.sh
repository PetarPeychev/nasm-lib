#!/bin/bash

nasm -f macho64 hello_mach64.asm
ld -macos_version_min 10.12 -lSystem -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -o hello_mach64 hello_mach64.o -no_pie
./hello_mach64
rm hello_mach64.o hello_mach64