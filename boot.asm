; boot.asm
[BITS 16]
[ORG 0x7C00]

start:
    ; Limpa a tela
    mov ah, 0x0E
    mov si, msg
print:
    lodsb
    cmp al, 0
    je halt
    int 0x10
    jmp print

halt:
    hlt
    jmp halt

msg db 'Hello, World!', 0

times 510 - ($ - $$) db 0
dw 0xAA55
