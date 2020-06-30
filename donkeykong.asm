;#exec "../Orga/donkeykong.asm"

;print nubes
mov ecx, 0
mov edx, 10
call getOffset
mov dword [esi], 0x0fb10fb0
mov edx, 12
call getOffset
mov dword [esi], 0x00200fb2
mov ecx, 1
mov edx, 10
call getOffset
mov dword [esi], 0x0fb40fb3
mov edx, 12
call getOffset
mov dword [esi], 0x0fb60fb5

mov ecx, 0
mov edx, 54
call getOffset
mov dword [esi], 0x0fb10fb0
mov edx, 56
call getOffset
mov dword [esi], 0x00200fb2
mov ecx, 1
mov edx, 54
call getOffset
mov dword [esi], 0x0fb40fb3
mov edx, 56
call getOffset
mov dword [esi], 0x0fb60fb5

;print donkey kong
mov ecx, 1
mov edx, 38
call getOffset
mov dword [esi], 0x00206a5
;cabeza donkey kong
mov ecx, 2
mov edx, 36 ;10
call getOffset
mov dword [esi], 0x06a106a0
mov edx, 38 ;12
call getOffset
mov dword [esi], 0x06a306a2
mov edx, 40 ;14
call getOffset
mov dword [esi], 0x00206a4
;cuerpo donkey kong
mov ecx, 3
mov edx, 36 ;10
call getOffset
mov dword [esi], 0x069d069c
mov edx, 38 ;12
call getOffset
mov dword [esi], 0x069f069e

;print platform
mov ecx, 4
mov edx, 0
for_filas:
    continue_for_filas:
        mov edx, 0
        cmp ecx, 29
        jle for_columnas

        jmp salir_for

        for_columnas:
            cmp edx, 79
            jle continue

            add ecx, 4
            jmp continue_for_filas    

            continue:
                ;offset & imprimir
                call getOffset

                mov dword [esi], 0x04880489 ;platform   
            add edx, 1
            jmp for_columnas

salir_for:
;printing barrel
    push 0
    push 0
    push 0
    push 0
    push 0
    push 0
    push 0
    push 0
    push ebp
    mov ebp, esp
move_barrel:
    mov dword[ebp+4], 0
    mov dword[ebp+8], 0
    mov dword[ebp+12], 0
    mov dword[ebp+16], 78
    mov dword[ebp+20], 0
    mov dword[ebp+24], 15
    mov dword[ebp+28], 0
    mov dword[ebp+32], 40
    mov ecx, 0
    jmp playing_1

    print_one_barrel:
    ;PRRRRRRRRRRINT FIRST
        ;offset
        mov edi, dword[ebp+4] ; Row
        mov ebx, edi
        shl edi, 6
        shl ebx, 4
        add edi, ebx
        add edi, dword[ebp+8] ; Col
        shl edi, 1
        add edi, 0xb800 

        mov dword [edi], 0x06ac06ab
        mov dword [edi+160], 0x06ae06ad

    ;PRRRRRRINT SECOND
     ;offset
        mov edi, dword[ebp+12] ; Row
        mov ebx, edi
        shl edi, 6
        shl ebx, 4
        add edi, ebx
        add edi, dword[ebp+16] ; Col
        shl edi, 1
        add edi, 0xb800 

        mov dword [edi], 0x06ac06ab
        mov dword [edi+160], 0x06ae06ad

        ;PRRRRRRINT THIRDDD
        mov edi, dword[ebp+20] ; Row
        mov ebx, edi
        shl edi, 6
        shl ebx, 4
        add edi, ebx
        add edi, dword[ebp+24] ; Col
        shl edi, 1
        add edi, 0xb800 

        mov dword [edi], 0x06ac06ab
        mov dword [edi+160], 0x06ae06ad

        ;PRRRRRRINT FOURRRRTH
        mov edi, dword[ebp+28] ; Row
        mov ebx, edi
        shl edi, 6
        shl ebx, 4
        add edi, ebx
        add edi, dword[ebp+32] ; Col
        shl edi, 1
        add edi, 0xb800 

        ;print it
        mov dword [edi], 0x06ac06ab
        mov dword [edi+160], 0x06ae06ad
        
        ;delay
        mov eax, dword [0xffff0008]
        add eax, 150
        delay_loop_barrel:
            cmp dword [0xffff0008], eax
            jl delay_loop_barrel


        ;ERASE FIRST
        mov edi, dword[ebp+4] ; Row
        mov ebx, edi
        shl edi, 6
        shl ebx, 4
        add edi, ebx
        add edi, dword[ebp+8] ; Col
        shl edi, 1
        add edi, 0xb800 

        mov dword [edi], 0x00200020
        mov dword [edi+160], 0x00200020

        ;ERASE SECOND
        mov edi, dword[ebp+12] ; Row
        mov ebx, edi
        shl edi, 6
        shl ebx, 4
        add edi, ebx
        add edi, dword[ebp+16] ; Col
        shl edi, 1
        add edi, 0xb800 

        mov dword [edi], 0x00200020
        mov dword [edi+160], 0x00200020

         ;ERASE THIRD
        mov edi, dword[ebp+20] ; Row
        mov ebx, edi
        shl edi, 6
        shl ebx, 4
        add edi, ebx
        add edi, dword[ebp+24] ; Col
        shl edi, 1
        add edi, 0xb800 

        mov dword [edi], 0x00200020
        mov dword [edi+160], 0x00200020

        ;ERASE FOURTH
        mov edi, dword[ebp+28] ; Row
        mov ebx, edi
        shl edi, 6
        shl ebx, 4
        add edi, ebx
        add edi, dword[ebp+32] ; Col
        shl edi, 1
        add edi, 0xb800 

        mov dword [edi], 0x00200020
        mov dword [edi+160], 0x00200020

        cmp dword[ebp+4], 26
        jge set1
        cmp dword[ebp+12], 26
        jge set2
        cmp dword[ebp+20], 26
        je set3
        cmp dword[ebp+28], 26
        je set4
        
        cmp dword[ebp+4], 4
        je print_new_platform1
        cmp dword[ebp+12], 4
        je print_new_platform2
        cmp dword[ebp+20], 4
        je print_new_platform3
        cmp dword[ebp+28], 4
        je print_new_platform4

        cmp dword[ebp+4], 8
        je print_new_platform1
        cmp dword[ebp+12], 8
        je print_new_platform2
        cmp dword[ebp+20], 8
        je print_new_platform3
        cmp dword[ebp+28], 8
        je print_new_platform4

        cmp dword[ebp+4], 12
        je print_new_platform1
        cmp dword[ebp+12], 12
        je print_new_platform2
        cmp dword[ebp+20], 12
        je print_new_platform3
        cmp dword[ebp+28], 12
        je print_new_platform4

        cmp dword[ebp+4], 16
        je print_new_platform1
        cmp dword[ebp+12], 16
        je print_new_platform2
        cmp dword[ebp+20], 16
        je print_new_platform3
        cmp dword[ebp+28], 16
        je print_new_platform4

        cmp dword[ebp+4], 20
        je print_new_platform1
        cmp dword[ebp+12], 20
        je print_new_platform2
        cmp dword[ebp+20], 20
        je print_new_platform3
        cmp dword[ebp+28], 20
        je print_new_platform4

        cmp dword[ebp+4], 24
        je print_new_platform1
        cmp dword[ebp+12], 24
        je print_new_platform2
        cmp dword[ebp+20], 24
        je print_new_platform3
        cmp dword[ebp+28], 24
        je print_new_platform4
    
        add dword[ebp+4], 2
        add dword[ebp+8], 2
        add dword[ebp+12], 2
        sub dword[ebp+16], 2
        add dword[ebp+20], 2
        add dword[ebp+24], 2
        add dword[ebp+28], 2
        add dword[ebp+32], 2

        jmp return
        print_new_platform1:
            mov edi, dword[ebp+4] ; Row
            mov ebx, edi
            shl edi, 6
            shl ebx, 4
            add edi, ebx
            add edi, dword[ebp+8] ; Col
            shl edi, 1
            add edi, 0xb800 
            mov dword [edi], 0x04880489

        print_new_platform2:
            mov edi, dword[ebp+12] ; Row
            mov ebx, edi
            shl edi, 6
            shl ebx, 4
            add edi, ebx
            add edi, dword[ebp+16] ; Col
            shl edi, 1
            add edi, 0xb800 
            mov dword [edi], 0x04880489

        print_new_platform3:
            mov edi, dword[ebp+20] ; Row
            mov ebx, edi
            shl edi, 6
            shl ebx, 4
            add edi, ebx
            add edi, dword[ebp+24] ; Col
            shl edi, 1
            add edi, 0xb800 
            mov dword [edi], 0x04880489

        print_new_platform4:
            mov edi, dword[ebp+28] ; Row
            mov ebx, edi
            shl edi, 6
            shl ebx, 4
            add edi, ebx
            add edi, dword[ebp+32] ; Col
            shl edi, 1
            add edi, 0xb800 
            mov dword [edi], 0x04880489

            ;increment
        add dword[ebp+4], 2
        add dword[ebp+8], 2
        add dword[ebp+12], 2
        sub dword[ebp+16], 2
        add dword[ebp+20], 2
        add dword[ebp+24], 2
        add dword[ebp+28], 2
        add dword[ebp+32], 2
        jmp return

        set1:
            mov dword[ebp+4], 0
            mov dword[ebp+8], 0
            jmp return
        set2:
            mov dword[ebp+12], 0
            mov dword[ebp+16], 78  
            jmp return
        set3:
            mov dword[ebp+20], 0
            mov dword[ebp+24], 15
        set4:
            mov dword[ebp+28], 0
            mov dword[ebp+32], 40
            
        return:
            ret
 
;#stop
;print mario
playing_1:
    mov ecx, 26
    mov edx, 2
    call getOffset
    mov dword [esi], 0x09980997
    mov dword [esi + 160], 0x099a0999

;PLAY GAME
playing:
    call print_one_barrel
    
    move_left: 
        mov ah, byte [0xffff0004] ; Keypad
        mov al, ah

        ; left key
        and al, 0x1
        test al, al
        jz test_q
        ;jz move_right

        ;si no es zero me muevo left
        cmp edx, 0 
        je move_right
        sub edx, 2
        mov dword[esi], 0x00200020
        mov dword[esi+160], 0x00200020
        call getOffset
        mov dword [esi], 0x09a809a7
        mov dword [esi + 160], 0x099a0999
        call delay
        jmp move_left


    move_right:
        mov al, ah
        and al, 0x2
        test al, al
        jz playing
        ;call print_one_barrel
        cmp ecx, 2
        je print_winner
        cmp edx, 78 
        je next_level_right
        add edx, 2
        mov dword[esi], 0x00200020
        mov dword[esi+160], 0x00200020
        ;#show ecx
        call getOffset
        mov dword [esi], 0x09980997
        mov dword [esi + 160], 0x099a0999
        call delay
        jmp move_right


    next_level_right:
    ;que empiece fila 20 y algo y columna 78
    ;borrar actual mario
        mov dword[esi], 0x00200020
        mov dword[esi+160], 0x00200020
        ;imprimir mario arriba
        sub ecx, 4
        mov edx, 2
        #show ecx
        call getOffset
        mov dword [esi], 0x09980997
        mov dword [esi + 160], 0x099a0999
        jmp move_left

    next_level_left:
        ;que empiece fila 17 y algo y columna 2

    test_q:
        mov al, ah
        and al, 0x10
        test al, al
        jnz stop
        jmp move_right

delay:
    mov eax, dword [0xffff0008]
    add eax, 50
$delay_loop:
    cmp dword [0xffff0008], eax
    jl $delay_loop
    ret

getOffset:
    mov esi, ecx ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800 ;offset + base 
    ret

stop:
    #show al binary
    #stop

stop1:
    add esp, 16
    #stop
        
print_winner:
    mov ebx, 410
    mov dword [0xb800 + ebx], 0x0e4f0e59 ;yo
    add ebx, 4
    mov dword [0xb800 + ebx], 0x0e200e55 ;u_
    add ebx, 4
    mov dword [0xb800 + ebx], 0x0e490e57;wi
    add ebx, 4
    mov dword [0xb800 + ebx], 0x0e210e4e;n!
    add esp, 36
    #show ['*'] ascii
    #show eax




