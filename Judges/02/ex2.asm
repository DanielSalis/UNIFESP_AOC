.data
        insertMessage:          .asciiz "Insira a mensagem:"
        totalCharacterMessage:  .asciiz "Numero total de caracteres:" 
        cryptoMessage:          .asciiz "\nMensagem Criptografada:"
        breakRow:               .asciiz "\n"

        letter_a: .byte 097
        letter_A: .byte 065
        letter_r: .byte 114
        letter_R: .byte 082
        letter_e: .byte 101
        letter_E: .byte 69
        letter_o: .byte 111
        letter_O: .byte 079
        letter_m: .byte 109
        letter_M: .byte 077
        letter_h: .byte 104
        letter_H: .byte 72
        letter_i: .byte 105
        letter_I: .byte 73
        letter_s: .byte 115
        letter_S: .byte 83
        letter_p: .byte 112
        letter_P: .byte 80

        input: .space 120
.text
.globl main

main:
        li $v0, 4
        la $a0, insertMessage
        syscall

        li $v0, 8
        la $a0, input
        addi $a1, $zero, 120
        syscall

        move $t4, $a0

        jal strlen_start
        syscall

        j crypto_init

        # j exit_program

strlen_start:
        addi $t0, $0, 0

strlen_loop: 
        lb $t3, 0($a0)
        beq $t3, $0, strlen_finish
        addi $a0, $a0, 1
        addi $t0, $t0, 1
        j strlen_loop

strlen_finish:
        li $v0, 4
        la $a0, totalCharacterMessage
        syscall

        addi $t0,$t0, -1
        
        addi $a0, $v0, 0
        li $v0, 1
        la $a0, ($t0)
         

        jr $ra

print_break_row:
        li $v0, 4
        la $a0, breakRow
        syscall


crypto_init:
        li $v0, 4
        la $a0, cryptoMessage
        syscall

        addi $t3, $zero, 0
        addi $t0, $zero, 0
        j crypto_loop

check:
        beq $t3, 032, print_number_0 #case space
        beq $t3, 065, print_number_1 #case a
        beq $t3, 097, print_number_1 #case a
        beq $t3, 082, print_number_2 #case r
        beq $t3, 114, print_number_2 #case r
        beq $t3, 101, print_number_3 #case e
        beq $t3, 069, print_number_3 #case e
        beq $t3, 111, print_number_4 #case o
        beq $t3, 079, print_number_4 #case o
        beq $t3, 109, print_number_5 #case m
        beq $t3, 077, print_number_5 #case m
        beq $t3, 104, print_number_6 #case h
        beq $t3, 072, print_number_6 #case h
        beq $t3, 105, print_number_7 #case i
        beq $t3, 074, print_number_7 #case i
        beq $t3, 083, print_number_8 #case s
        beq $t3, 115, print_number_8 #case s
        beq $t3, 112, print_number_9 #case p
        beq $t3, 080, print_number_9 #case p
        
        beq $t3, 0, spac #case space
        beq $t3, 1, print_number_0 #case space
        beq $t3, 2, print_number_1 #case a
        beq $t3, 3, print_number_1 #case a
        beq $t3, 4, print_number_2 #case r
        beq $t3, 5, print_number_2 #case r
        beq $t3, 6, print_number_3 #case e
        beq $t3, 7, print_number_3 #case e
        beq $t3, 8, print_number_4 #case o
        beq $t3, 9, print_number_4 #case o
        li $v0, 4
        la $a0, 0($t4)
        syscall
        j crypto_loop

crypto_loop:
        lb $t3, 0($t4)
        beq $t3, $0, crypto_loop_finish,
        addi $t4, $t4, 1
        j check

crypto_loop_finish:
        j exit_program


print_number_0:
        li $v0, 1
        la $a0, 0
        syscall

        j crypto_loop

print_number_1:
        li $v0, 1
        la $a0, 1
        syscall

        j crypto_loop

print_number_2:
        li $v0, 1
        la $a0, 2
        syscall

        j crypto_loop

print_number_3:
        li $v0, 1
        la $a0, 3
        syscall

        j crypto_loop

print_number_4:
        li $v0, 1
        la $a0, 4
        syscall

        j crypto_loop

print_number_5:
        li $v0, 1
        la $a0, 5
        syscall

        j crypto_loop

print_number_6:
        li $v0, 1
        la $a0, 6
        syscall

        j crypto_loop

print_number_7:
        li $v0, 1
        la $a0, 7
        syscall

        
print_number_8:
        li $v0, 1
        la $a0, 8
        syscall

        j crypto_loop


print_number_9:
        li $v0, 1
        la $a0, 9
        syscall

        j crypto_loop

print_letter_A:
        li $v0, 4
        la $a0, letter_A
        syscall

        j crypto_loop

print_letter_R:
        li $v0, 4
        la $a0, letter_R
        syscall

        j crypto_loop

print_letter_E:
        li $v0, 4
        la $a0, letter_E
        syscall

        j crypto_loop

print_letter_O:
        li $v0, 4
        la $a0, letter_O
        syscall

        j crypto_loop

print_letter_M:
        li $v0, 4
        la $a0, letter_M
        syscall

        j crypto_loop

print_letter_H:
        li $v0, 4
        la $a0, letter_H
        syscall

        j crypto_loop

print_letter_L:
        li $v0, 4
        la $a0, letter_L
        syscall

        j crypto_loop

print_letter_S:
        li $v0, 4
        la $a0, letter_S
        syscall

        j crypto_loop

print_letter_P:
        li $v0, 4
        la $a0, letter_P
        syscall

        j crypto_loop


exit_program:
        li $v0, 10
        syscall