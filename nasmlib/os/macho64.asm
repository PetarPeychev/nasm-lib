; --------------------------------
; -------- Mach-O x86_64 ---------
; --------------------------------

%define SYSCALL_NANOSLEEP 0x2000000
%define SYSCALL_EXIT  0x2000001
%define SYSCALL_READ  0x2000003
%define SYSCALL_WRITE 0x2000004
%define SYSCALL_OPEN  0x2000005
%define SYSCALL_CLOSE 0x2000006
%define SYSCALL_LSEEK 0x2000008
%define SYSCALL_MMAP  0x2000009
%define SYSCALL_UNLINK 0x200000A
%define SYSCALL_MUNMAP 0x200000B

%define STDIN  0
%define STDOUT 1
%define STDERR 2

%define NEWLINE 13,10

%macro write 3
    ; Arguments: %1 = file descriptor, %2 = message, %3 = length

    mov rax, SYSCALL_WRITE
    mov rdi, %1        ; file descriptor (e.g., STDOUT)
    mov rsi, %2        ; pointer to the message
    mov rdx, %3        ; length of the message
    syscall
%endmacro

%macro read 3
    ; Arguments: %1 = file descriptor, %2 = buffer, %3 = count

    mov rax, SYSCALL_READ
    mov rdi, %1    ; file descriptor (e.g., STDIN)
    mov rsi, %2    ; buffer
    mov rdx, %3    ; count
    syscall
%endmacro

%macro exit 1
    ; Arguments: %1 = file descriptor, %2 = message, %3 = length

    mov rax, SYSCALL_EXIT
    mov rdi, %1        ; exit code (0 = success, non-zero = error)
    syscall
%endmacro

%macro sleep 1
    ; Arguments: %1 = nanoseconds for sleep duration

    section .data
    timespec struct
        tv_sec  resq 1        ; Seconds
        tv_nsec resq 1        ; Nanoseconds
    timespec ends

    local_duration timespec

    section .text

    ; Calculate seconds and nanoseconds
    mov rax, %1
    mov rbx, 1000000000       ; Number of nanoseconds in a second
    xor rdx, rdx
    div rbx                   ; rax = seconds, rdx = remaining nanoseconds

    ; Set the timespec structure
    mov [local_duration.tv_sec], rax
    mov [local_duration.tv_nsec], rdx

    ; Perform the nanosleep syscall
    mov rax, SYSCALL_NANOSLEEP  ; Replace with the correct syscall number for nanosleep
    lea rdi, [local_duration]   ; Pointer to timespec structure (duration)
    xor rsi, rsi                ; NULL pointer for remaining time
    syscall
%endmacro
