.data

str1: .asciiz "Entre com o numero: \n"
str2: .asciiz "O dobro do numero: \n"

.text
.globl main

main:
        li $v0, 4
        la $a0, str1
        syscall

        li $v0, 5
        syscall

        move $t0, $v0
        add $t1, $t0, $t0

        li $v0, 4
        la $a0, str2
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 10
        syscall