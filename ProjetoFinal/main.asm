.include "macros.asm"

.globl yellow, white, black, end_msg

.globl start, gameLoop

.data
	end_msg:			.asciiz "!FIM!\n"

.data
	yellow:   .word 0xF5F62E
	white:	  .word 0xFFFFFF
	black:	  .word 0x000000
.text
start:

	# Pos inicial da nave
	lui  $a0, 0x1004	# HEAP
	addi $a0, $a0, 58880
	addi $a0, $a0, 204
	li   $s0, 1
	li   $s1, 4

	jal drawShipUp
	PUSH($a0)


	# Enemies

	lui  $s2, 0x1004
	li $s3, 12804 # Initial first enemy position

	# Ship controll variables
	li $t5, 0
	li $t6, 32

	gameLoop:
		SONG
		beq $t5, $t6, resetLoop

		add $s5, $s2, $s3
		move $a0, $s5
		jal  drawnEnemy

		SLEEP
		move $a0, $s5
		jal eraseEnemy

		addi $s3, $s3, 16
		addi $t5, $t5, 1

		#Keyboard section
		li $t0, 0xffff0000 	#(KEYBOARD MMIO) address
		addi $t0, $t0, 4
		lb   $t1, 0($t0)	# stores key into t1
		beqz $t1, gameLoop
		jal switchTecla
		j gameLoop


	resetLoop:
		li $t5, 0
		li $s3, 12804
		j gameLoop

	exit:
  li     $v0, 10
  syscall
