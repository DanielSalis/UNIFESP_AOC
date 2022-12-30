.data
array:                .space  201
arraySize:            .word   200
enter:   .asciiz "\n"

.text
.globl main
main:
li $t1, 0 #count for 'w'
li $t2, 0 #count for 'r'

li  $v0, 8
la  $a0, array
lw  $a1, arraySize
syscall
move 	$t0, $a0

li  $v0, 5
syscall
move $t6, $v0

loop:
lb $t3, 0($t0)
beq $t3, 0, exit

#verifica se é r ou w
beq $t3, 'W', w_count
beq $t3, 'R', r_count

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
#print number of 't'
li $v0, 1
move $a0, $t8
syscall

li $v0, 10 #end program
syscall