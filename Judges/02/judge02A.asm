.data
  numbersArray:  .space 24
  msg:        .asciiz " valores positivos"
  msg2:        .asciiz "\n"

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
  li    $s0, 0

compareLoop:
  beq   $s0, 5, endLoop
  lw    $s1, numbersArray($t0)
  add   $t0, $t0, 4
  add   $s0, $s0, 1
  bgt	  $s1, 0, increasePositiveNumbersCounter
  j     compareLoop

increasePositiveNumbersCounter:
  add   $t1, $t1, 1
  j     compareLoop

endLoop:
  li    $v0, 1
  move  $a0, $t1
  syscall

  li    $v0, 4
  la    $a0, msg
  syscall

  li     $v0, 10
  syscall
