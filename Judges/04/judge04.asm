.data
  idioma:     .asciiz     "idioma:"
  ingles:     .asciiz     "idioma:ingles"
  input:      .space 81
  inputSize:   .word 80
  input2:      .space 81
  inputSize2:   .word 80

.text
.globl main

main:
  li		$s0, 1
  li		$s1, 0

  li    $v0, 5
  syscall
  move		$t0, $v0

  li    $v0, 8
  la    $a0, input
  lw    $a1, inputSize
  syscall

  j loop

loop:
  li    $v0, 8
  la    $a0, input2
  lw    $a1, inputSize2
  syscall


  lb    $t3, input($s1)
  lb    $t4, input2($s1)
  sub   $t6, $t3, $t4
  bne   $t6, $zero, print_eng

  addi  $s0, $s0, 1
  blt   $s0, $t0, loop
  j     print_lang


print_eng:
  li $v0, 4
  la $a0, ingles
  syscall

  li     $v0, 10
  syscall


print_lang:
  li $v0, 4
  la $a0, idioma
  syscall

  li $v0, 4
  la $a0, input
  syscall

  j exit

exit:
  li     $v0, 10
  syscall