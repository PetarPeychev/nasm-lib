; This file contains macros for the x86-64 Mach system calls.

%define MAIN _main

%define SYSCALL_READ  0x2000003
%define SYSCALL_WRITE 0x2000004
%define SYSCALL_EXIT  0x2000001

%define STDIN  0
%define STDOUT 1
%define STDERR 2

%define NEWLINE 10

%macro read 3
; Read a message from a file descriptor.
;
; Args:
;   %1 - file descriptor (e.g., STDIN)
;   %2 - buffer (e.g., a label)
;   %3 - count (e.g., 1024)

    mov rax, SYSCALL_READ
    mov rdi, %1 ; file descriptor (e.g., STDIN)
    mov rsi, %2 ; buffer
    mov rdx, %3 ; count
    syscall
%endmacro

%macro write 3
; Write a message to a file descriptor.
;
; Args:
;   %1 - file descriptor
;   %2 - message
;   %3 - length

    mov rax, SYSCALL_WRITE
    mov rdi, %1 ; file descriptor (e.g., STDOUT)
    mov rsi, %2 ; pointer to the message
    mov rdx, %3 ; length of the message
    syscall
%endmacro

%macro exit 1
; Exit the program.
;
; Args:
;   %1 - exit code (0 = success, non-zero = error)

    mov rax, SYSCALL_EXIT
    mov rdi, %1 ; exit code (0 = success, non-zero = error)
    syscall
%endmacro
