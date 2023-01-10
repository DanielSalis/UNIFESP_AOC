.include "macros.asm"

.globl drawnEnemy, eraseEnemy

preencheCores:
	lw   $t2, yellow
	jr $ra

drawnEnemy:

	PUSH($ra)
	jal preencheCores
	POP($ra)
	j drawEnemyGoingToRight

eraseEnemy:
	lw $t2, black
	j drawEnemyGoingToRight

drawEnemyGoingToRight:
	addi $t4, $zero, 1	# numero de inimigos por linha

	adiciona120:
		PUSH($ra)
		jal  colorizeEnemy
		POP($ra)
		sub $t4, $t4, 1
		add $a0, $a0, 120
		beqz $t4, end
		j adiciona120


end:
	jr $ra

colorizeEnemy:
	PUSH($a0)
	PUSH($t0)
	PUSH($t2)

	move $t0, $a0
	add $t7, $zero, 0
colorizeEnemyLoop:

	#primeira linha
	addi $a0, $a0, 8
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 8
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 8
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)

	#ultima linha
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 8
	sw   $t2, 0($a0)
	addi $a0, $a0, 4
	sw   $t2, 0($a0)

	#Loop adicional para outras filas
	addi $t0, $t0, 8000		#pula 8000 pixels
	move $a0, $t0
	add $t7, $t7, 1
	beq $t7, 3, endEnemies
	j colorizeEnemyLoop


endEnemies:
	POP($t2)
	POP($t0)
	POP($a0)
	jr $ra

