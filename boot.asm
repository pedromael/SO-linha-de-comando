[BITS 16]
[ORG 0x7C00]

start:
    ; Configurar o segmento de dados
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; Mensagem inicial
    mov ah, 0x0E
    mov si, msg
print:
    lodsb
    cmp al, 0
    je load_kernel
    int 0x10
    jmp print

load_kernel:
    mov ah, 0x02        ; BIOS read sector function
    mov al, 1           ; Number of sectors to read
    mov ch, 0           ; Cylinder 0
    mov cl, 2           ; Sector 2 (Boot sector is 1, kernel starts at 2)
    mov dh, 0           ; Head 0
    mov dl, 0x80        ; First hard disk
    mov bx, 0x1000      ; Load to 0x1000:0x0000 (Segment:Offset)
    int 0x13
    jc error            ; Jump if error

    ; Saltar para o kernel
    jmp 0x1000:0x0000

error:
    mov si, err_msg
    jmp print

halt:
    hlt
    jmp halt

msg db 'Loading Kernel...', 0
err_msg db 'Disk Read Error!', 0

times 510 - ($ - $$) db 0
dw 0xAA55
