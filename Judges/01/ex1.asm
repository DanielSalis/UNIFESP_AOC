.data
        daymsg: .asciiz "Entre com o dia (DD):\n"
        mounthmsg: .asciiz "Entre com o mes (MM):\n"
        yearmsg: .asciiz "Entre com o ano (AAAA):\n"
        barstring: .asciiz "/"
        notvaliddaymsg: .asciiz "Dia invalido. \n"
        notvalidmonthmsg: .asciiz "Mes invalido. \n"
        notvalidyear: .asciiz "Ano invalido. \n"
        breakrow: .asciiz "\n"
        brithday: .asciiz "\nData de Nascimento: "
        barchar: .asciiz "/"

.text
.globl main

main:
	
loop_day:
        #day
        li $v0, 4
        la $a0, daymsg
        syscall

        li $v0, 5
        syscall

        move $t0, $v0
	
        blt $t0, 1, print_day
	bge $t0, 32, print_day
        add $s1, $s1, $t0
        j loop_month


loop_month:
        li $v0, 4
        la $a0, mounthmsg
        syscall

        li $v0, 5
        syscall

        move $t1, $v0
	
        blt $t1, 1, print_mounth
	bge $t1, 13, print_mounth
        add $s2, $s2, $t1

        j loop_year


loop_year:
        li $v0, 4
        la $a0, yearmsg
        syscall

        li $v0, 5
        syscall

        move $t2, $v0
	
        blt $t2, 1900, print_year
	bge $t2, 2022, print_year
        add $s3, $s3, $t2
        j print_final_msg

print_day:
	li $v0, 4	
	la $a0, notvaliddaymsg
	syscall #imprime um espaco em branco
	j loop_day

print_mounth:
	li $v0, 4	
	la $a0, notvalidmonthmsg
	syscall #imprime um espaco em branco
	j loop_month

print_year:
	li $v0, 4	
	la $a0, notvalidyear
	syscall #imprime um espaco em branco
	j loop_year

print_final_msg:
	li $v0, 4	
	la $a0, brithday
        syscall

	li $v0, 1	
	la $a0, ($s1) 
        syscall

        li $v0, 4	
	la $a0, barchar
        syscall

	li $v0, 1	
	la $a0, ($s2) 
        syscall

        li $v0, 4	
	la $a0, barchar
        syscall

        li $v0, 1	
	la $a0, ($s3) 
        syscall

	j exit

	
exit:
        li $v0, 10
        syscall