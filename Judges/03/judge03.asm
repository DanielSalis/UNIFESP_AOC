.data
  numbersArray:     .space 120
  msgLevel1:        .asciiz "Maior nivel: velocidade 1\n"
  msgLevel2:        .asciiz "Maior nivel: velocidade 2\n"
  msgLevel3:        .asciiz "Maior nivel: velocidade 3\n"
  msgInvalidSize:   .asciiz ": valor invalido.\n"
  msgInvalidNumber: .asciiz ": velocidade invalida\n"

.text
.globl main

main:
  li		$s0, 0
  li    $s1, 0
  li    $s2, 0

  li    $v0, 5
  syscall
  add		$t0, $v0, $zero

  bgt   $t0, 30, printInvalidSize

loop:
  li    $v0, 5
  syscall
  sw		$v0, numbersArray($s1)
  addi  $s1, $s1, 4
  addi  $s0, $s0, 1
  blt   $s0, $t0, loop
  li		$s0, 0
  li    $s1, 0
  li    $t2, 0 ##max velocity
  j     verifyVelocity


verifyVelocity:
  lw		$t1, numbersArray($s1)
  addi  $s1, $s1, 4
  addi  $s0, $s0, 1

  bgt		$t1, 50, printInvalidNumber
  blt   $t2, $t1, replaceMax
  blt   $s0, $t0, verifyVelocity
  j     printMsg


printInvalidNumber:
  li    $v0, 1
  move  $a0, $t1
  syscall

  li    $v0, 4
  la    $a0, msgInvalidNumber
  syscall

  j     verifyVelocity

replaceMax:
  move 	$t2, $t1
  j     verifyVelocity

printMsg:
  blt   $t2, 10, printLevel1
  beq	  $t2, 10, printLevel2
  blt	  $t2, 20, printLevel2
  bge   $t2, 20, printLevel3

printLevel1:
  li    $v0, 4
  la    $a0, msgLevel1
  syscall
  j     exit

printLevel2:
  li    $v0, 4
  la    $a0, msgLevel2
  syscall
  j     exit

printLevel3:
  li    $v0, 4
  la    $a0, msgLevel3
  syscall
  j     exit

printInvalidSize:
  li    $v0, 1
  move  $a0, $t0
  syscall

  li    $v0, 4
  la    $a0, msgInvalidSize
  syscall

  j   exit


exit:
  li     $v0, 10
  syscall