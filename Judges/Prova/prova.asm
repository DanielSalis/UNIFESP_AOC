.data
    invalidMsg:                      .asciiz "Valor invalido.\n"
    power_simbol:                    .asciiz "^"
    equal_simbol:                    .asciiz " = "
    break_simbol:                    .asciiz "\n"


.text
.globl main

main:
    li      $v0, 5
    syscall

    add		$t0, $v0, $zero


    blt		$t0, 5, show_invalid_msg
    bgt		$t0, 100, show_invalid_msg

    li      $s0, 0
    li      $t1, 2
    j       exec_square_numbers

exec_square_numbers:
    beq     $s0, $t0, exit
    add     $s0, $s0, 1

    div		$s0, $t1
    mfhi	$t2

    beq	    $t2, 0, show_square

    j       exec_square_numbers


show_square:
    li      $v0, 1
    move    $a0, $s0
    syscall

    li      $v0, 4
    la      $a0, power_simbol
    syscall

    li      $v0, 1
    move    $a0, $t1
    syscall

    li      $v0, 4
    la      $a0, equal_simbol
    syscall

    mult	$s0, $s0
    mflo	$s3

    li      $v0, 1
    move    $a0, $s3
    syscall

    li      $v0, 4
    la      $a0, break_simbol
    syscall


    j       exec_square_numbers

show_invalid_msg:
    li    $v0, 4
    la    $a0, invalidMsg
    syscall

    j exit

exit:
    li     $v0, 10
    syscall