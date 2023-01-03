.data
array:                .space  201
arraySize:            .word   200
enter:                .asciiz "\n"
invalidMessage:       .asciiz "Valor invalido!"
invalidChars:       .asciiz "Caracteres invalidos!"

.text
.globl main
main:
li $t1, 0
li $t2, 0
li $t9, 0

li  $v0, 8
la  $a0, array
lw  $a1, arraySize
syscall
move 	$t0, $a0

li  $v0, 5
syscall
move $t6, $v0

blt		$t6, 1, printInvalidMEssage
bgt		$t6, 10, printInvalidMEssage

loop:
lb $t3, 0($t0)
beq $t3, 0, exit

beq $t3, 'W', w_count
beq $t3, 'R', r_count
beq	$t3, 'A', printInvalidChars

addi $t0, $t0, 1
j loop

w_count:
addi $t1, $t1, 1
addi $t0, $t0, 1
j loop

r_count:
addi $t2, $t2, 1
addi $t0, $t0, 1
j loop

exit:
div		$t2, $t6
mflo	$t7
mfhi	$t4

add		$t7, $t7, $t4
add		$t8, $t7, $t1

li $v0, 1
move $a0, $t8
syscall

li $v0, 10
syscall

printInvalidMEssage:
li $v0, 4
la $a0, invalidMessage
syscall

li $v0, 10
syscall


printInvalidChars:
li $v0, 4
la $a0, invalidChars
syscall

li $v0, 10
syscall