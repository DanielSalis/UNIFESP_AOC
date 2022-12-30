.data
  array:                .space  60
  sorted_array:         .space  60
  enter:                .asciiz "\n"

.text
.globl main

main:
  li		$t0, 0
  li		$t1, 0
  li		$t2, 0
  li		$t3, 56
  li    $s0, 0
  j     get_inputs

get_inputs:
  li    $v0, 5
  syscall
  sw		$v0, array($t0)
  addi  $t0, $t0, 4
  blt   $t0, 60, get_inputs
  j     outter_loop


outter_loop:
  bge   $t1, 60, print_sorted_array
  li    $t2, 0
  lw		$s1, array($t1)
  addi  $t1, $t1, 4
  j     inner_loop

inner_loop:
  bge   $t2, 60, assing
  lw		$s2, array($t2)
  addi  $t2, $t2, 4
  blt   $s1, $s2, increment_s0
  j     inner_loop

assing:
  sw		$s1, sorted_array($s0)
  li    $s0, 0
  j     outter_loop

increment_s0:
  addi  $s0, $s0, 4
  j     inner_loop


print_sorted_array:
  lw		$s3, sorted_array($t3)
  addi  $t3, $t3, -4

  li    $v0, 1
  move  $a0, $s3
  syscall

  li    $v0, 4
  la    $a0, enter
  syscall

  bge   $t3, 0, print_sorted_array
  j exit

exit:
  li     $v0, 10
  syscall
