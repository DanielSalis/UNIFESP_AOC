.data

daymsg: .asciiz "Entre com o dia (DD):"
mounthmsg: .asciiz "Entre com o mes (MM):"
yearmsg: .asciiz "Entre com o ano (AAAA):"
barstring: .asciiz "/"

str1: .asciiz "Entre com o numero: \n"
str2: .asciiz "O dobro do numero: \n"

.text
.globl main

main:
        li $v0, 4
        la $a0, daymsg
        syscall

        li $v0, 5
        syscall

        move $t0, $v0
        # add $t1, $t0, $t0

        li $v0, 4
        la $a0, str2
        syscall

        li $v0, 1
        move $a0, $t0
        syscall