# Platform Macros
Macros abstracting over platform-specific syscalls and conventions to make
portability easier. The goal is to be able to switch between compile targets
by simply changing the platform macros being imported.

## Usage
```nasm
%include "nasmlib/platforms/linux64.asm" ; replace with target platform

section .text
    global  MAIN

MAIN:
    write STDOUT, msg, msg.len
    exit 0

section .data
    msg: db "Hello, World!", NEWLINE
    .len equ $ - msg
```

## API
Each platform module provides definitions for the following:

```nasm
%define MAIN

%define SYSCALL_READ
%define SYSCALL_WRITE
%define SYSCALL_EXIT

%define STDIN
%define STDOUT
%define STDERR

%define NEWLINE

%macro read 3
; Read a message from a file descriptor.
;
; Args:
;   %1 - file descriptor (e.g., STDIN)
;   %2 - buffer (e.g., a label)
;   %3 - count (e.g., 1024)
%endmacro

%macro write 3
; Write a message to a file descriptor.
;
; Args:
;   %1 - file descriptor
;   %2 - message
;   %3 - length
%endmacro

%macro exit 1
; Exit the program.
;
; Args:
;   %1 - exit code (0 = success, non-zero = error)
%endmacro
```

