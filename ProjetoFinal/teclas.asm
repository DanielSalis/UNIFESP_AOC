.include "macros.asm"

.globl switchTecla

	switchTecla:
		beq $t1, 119, teclaW
		beq $t1, 115, teclaS
		beq $t1, 97, teclaA
		beq $t1, 100, teclaD
	teclaW:

		sb   $0, 0($t0)
		POP($a0)
		jal  eraseOldShip
		addi $a0, $a0, -3072
		PUSH($a0)
		jal  drawShipUp
		addi $s0, $s0, 1		# 1 line up
		beq  $s0, 19, finishGame
		j gameLoop

	teclaS:

		sb   $0, 0($t0)
		beq  $s0, 1, gameLoop
		POP($a0)
		jal  eraseOldShip
		addi $a0, $a0, 3072
		PUSH($a0)
		jal  drawShipDown # 1 line down
		addi $s0, $s0, -1
		j gameLoop

	teclaA:

		sb   $0, 0($t0)
		beq  $s1, -4, gameLoop
		POP($a0)
		jal  eraseOldShip
		addi $a0, $a0, -24
		PUSH($a0)
		jal  drawShipLeft
		addi $s1, $s1, -1		# 1 column left
		j    gameLoop

	teclaD:

		sb   $0, 0($t0)
		beq  $s1, 15, gameLoop
		POP($a0)
		jal  eraseOldShip
		addi $a0, $a0, 24
		PUSH($a0)
		jal  drawShipRight
		addi $s1, $s1, 1		# 1 column right
		j    gameLoop

	finishGame:
		PRINT_MESSAGE(end_msg)
		j   start


