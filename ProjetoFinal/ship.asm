
.include "macros.asm"

.globl drawShipUp, drawShipDown, eraseOldShip, drawShipRight, drawShipLeft

drawShipUp:
	PUSH($a0)
	PUSH($t0)
	PUSH($t1)
	PUSH($t2)


	move $t0, $a0
	#Primeira linha
	#addi $a0, $a0, 0
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	lw   $t1, white

	addi $a0, $a0, 12
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	lw   $t1, black

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#Segunda Linha
	addi $t0, $t0, 512
	move $a0, $t0

	#addi $a0, $a0, 0
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	lw   $t1, white

	addi $a0, $a0, 12
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#Terceira linha
	addi $t0, $t0, 512
	move $a0, $t0

	#addi $a0, $a0, 0
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	lw   $t1, white
	addi $a0, $a0, 8
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#Quarta linha
	addi $t0, $t0, 512
	move $a0, $t0

	#addi $a0, $a0, 0
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	lw   $t1, white
	addi $a0, $a0, 8
	sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	addi $a0, $a0, 12
	sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#Quinta Linha
	addi $t0, $t0, 512
	move $a0, $t0

	#addi $a0, $a0, 0
	#sw   $t1, 0($a0)

	lw   $t1, white

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	addi $a0, $a0, 12
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#Sexta Linha
	addi $t0, $t0, 512
	move $a0, $t0

	lw   $t1, white

	addi $a0, $a0, 0
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	#addi $a0, $a0, 4
	#sw   $t1, 0($a0)

	addi $a0, $a0, 20
	sw   $t1, 0($a0)

	addi $a0, $a0, 4
	sw   $t1, 0($a0)


endDrawShipUp:
	POP($t2)
	POP($t1)
	POP($t0)
	POP($a0)
	jr $ra

drawShipDown:
	PUSH($a0)
	PUSH($t0)
	PUSH($t1)
	PUSH($t2)


	move $t0, $a0
	lw   $t1, white

	#PREENCHE AS CORES
	#
	addi $a0, $a0, 0
	sw   $t1, 0($a0)

	addi $a0, $a0, 28
	sw   $t1, 0($a0)


	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	addi $a0, $a0, 20
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 4
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)
	addi $a0, $a0, 12
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 8
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 12
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 12
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)


endDrawShipDown:
	POP($t2)
	POP($t1)
	POP($t0)
	POP($a0)
	jr $ra

eraseOldShip:
	PUSH($a0)
	PUSH($t1)
	PUSH($t2)

	li   $t0, 6		# tamanho do grid
	lw   $t1, black

erase:
	beq  $t0, $0, endEraseOldShip
	sw   $t1, 0($a0)
	sw   $t1, 4($a0)
	sw   $t1, 8($a0)
	sw   $t1, 12($a0)
	sw   $t1, 16($a0)
	sw   $t1, 20($a0)
	sw   $t1, 24($a0)
	sw   $t1, 28($a0)
	addi $a0, $a0, 512
	addi $t0, $t0, -1
	j    erase


endEraseOldShip:
	POP($t1)
	POP($t0)
	POP($a0)
	jr $ra

drawShipRight:
	PUSH($a0)
	PUSH($t1)
	PUSH($t2)

	move $t0, $a0
	lw   $t1, white

	addi $a0, $a0, 16
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)


	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 24
	sw   $t1, 0($a0)


	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 28
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 28
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 24
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 16
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)

endDrawShipRight:
	POP($t1)
	POP($t0)
	POP($a0)
	jr $ra

drawShipLeft:
	PUSH($a0)
	PUSH($t1)
	PUSH($t2)


	move $t0, $a0
	lw   $t1, white

	#
	addi $a0, $a0, 8
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 0
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 0
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 4
	sw   $t1, 0($a0)

	#
	addi $t0, $t0, 512
	move $a0, $t0

	addi $a0, $a0, 8
	sw   $t1, 0($a0)
	addi $a0, $a0, 4
	sw   $t1, 0($a0)

endDrawShipLeft:
	POP($t1)
	POP($t0)
	POP($a0)
	jr $ra
