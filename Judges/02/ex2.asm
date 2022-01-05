.data
        insertMessage:          .asciiz "Insira a mensagem:"
        totalCharacterMessage:  .asciiz "Numero total de caracteres:" 
        cryptoMessage:          .asciiz "\nMensagem Criptografada:"
        breakRow:               .asciiz "\n"
        input: .space 90
.text
.globl main

main:
        li $v0, 4
        la $a0, insertMessage
        syscall

        li $v0, 8
        la $a0, input
        addi $a1, $zero, 90
        syscall

        move $t7, $v0

        jal strlen_start
        addi $a0, $v0, 0
        li $v0, 1
        la $a0, ($t0) 
        syscall
        li $v0, 10
        syscall

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
        jr $ra

print_break_row:
        li $v0, 4
        la $a0, breakRow
        syscall