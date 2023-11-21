%include "../nasmlib/os/macho64.asm"

; -------------------- Code --------------------
section .text
    global  _main

_main:
    write STDOUT, msg, msg.len
    exit 0

; -------------------- Data --------------------
section .data
    msg: db "Hello, World!", NEWLINE
    .len equ $ - msg
