.macro	PUSH(%REG)
	addi $sp, $sp, -4
	sw   %REG, 0($sp)
.end_macro

.macro	POP(%REG)
	lw   %REG, 0($sp)
	addi $sp, $sp, 4
.end_macro

.macro 	PRINT_MESSAGE(%REG)
	PUSH($a0)
	li $v0, 55
	la $a0, %REG
	li $a1, 1
	syscall
.end_macro

.macro SLEEP
	li $v0, 32
	li $a0, 150
	syscall
.end_macro

.macro 	SONG
	li $v0, 31
	PUSH($a0)
	li $a0, 65
	li $a1, 100
	li $a2, 7
	li $a3, 900
	POP($a0)
	syscall
.end_macro
