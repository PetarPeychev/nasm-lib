%include "../nasmlib/platforms/linux64.asm"

; -------------------- Code --------------------
section .text
    global MAIN

MAIN:
    write STDOUT, msg, msg.len
    exit 0

; -------------------- Data --------------------
section .data
    msg: db "Hello, World!", NEWLINE
    .len equ $ - msg
