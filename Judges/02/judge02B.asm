.data
  numbersArray:   .space 24
  msgEven:        .asciiz " valor(es) par(es)\n"
  msgOdd:         .asciiz " valor(es) impar(es)\n"
  msgPositive:    .asciiz " valor(es) positivo(s)\n"
  msgNegative:    .asciiz " valor(es) negativo(s)"

.text
.globl main

main:
  li		$t0, 0
  li    $s0, 0

loop:
  li    $v0, 5
  syscall
  sw		$v0, numbersArray($t0)
  addi  $t0, $t0, 4
  addi  $s0, $s0, 1
  blt   $s0, 5, loop

  li		$t0, 0
  li    $t1, 0
  li    $t2, 0
  li    $t9, 2
  li    $s0, 0

compareEvenLoop:
  beq   $s0, 5, startPositiveLoop
  lw    $s1, numbersArray($t0)
  add   $t0, $t0, 4
  add   $s0, $s0, 1
  div		$s1, $t9
  mfhi	$t3
  beq	  $t3, 0, increaseEvenNumbersCounter
  bgt	  $t3, 0, increaseOddNumbersCounter
  blt	  $t3, 0, increaseOddNumbersCounter
  j     compareEvenLoop

increaseEvenNumbersCounter:
  add   $t1, $t1, 1
  j     compareEvenLoop

increaseOddNumbersCounter:
  add   $t2, $t2, 1
  j     compareEvenLoop


startPositiveLoop:
  li		$t0, 0
  li    $t3, 0
  li    $t4, 0
  li    $s0, 0

comparePositiveLoop:
  beq   $s0, 5, endLoop
  lw    $s1, numbersArray($t0)
  add   $t0, $t0, 4
  add   $s0, $s0, 1
  bgt	  $s1, 0, increasePositiveNumbersCounter
  blt	  $s1, 0, increaseNegativeNumbersCounter
  j     comparePositiveLoop

increasePositiveNumbersCounter:
  add   $t3, $t3, 1
  j     comparePositiveLoop

increaseNegativeNumbersCounter:
  add   $t4, $t4, 1
  j     comparePositiveLoop


endLoop:
  li    $v0, 1
  move  $a0, $t1
  syscall

  li    $v0, 4
  la    $a0, msgEven
  syscall


  li    $v0, 1
  move  $a0, $t2
  syscall

  li    $v0, 4
  la    $a0, msgOdd
  syscall

  li    $v0, 1
  move  $a0, $t3
  syscall

  li    $v0, 4
  la    $a0, msgPositive
  syscall

  li    $v0, 1
  move  $a0, $t4
  syscall

  li    $v0, 4
  la    $a0, msgNegative
  syscall

  li     $v0, 10
  syscall
