.data
        insertMessage:          .asciiz "Insira a mensagem:\n"
        totalCharacterMessage:  .asciiz "Numero total de caracteres:\n" 
        input: .space 80
.text
.globl main

main:
        li $v0, 8
        la $a0, input
        li $a1, 80
        syscall

        jal strlen_start
        addi $a0, $v0, 0
        li $v0, 1
        syscall
        li $v0, 10
        syscall

strlen_start:
        addi $t0, $0, 0

strlen_loop: 
        lbu $t3, 0($a0)
        beq $t3, $0, strlen_finish
        addi $a0, $a0, 1
        addi $t0, $t0, 1
        j strlen_loop

strlen_finish:
        add $v0, $t0, $0
        addi $v0,$v0, -1
        jr $ra