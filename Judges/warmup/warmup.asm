.data
  msg: .asciiz "Enter the number and wait for the result... "
  invalidMsg: .asciiz "Invalid number."

.text
.globl main

main:
	li	$v0,5
	syscall
	move	$t0,$v0

  bgt	$t0, $0, multiply
	ble	$t0, $0, print

multiply:
  add	$t1, $t1, $t0
  add	$t2, $t0, $t1

  li $v0, 4
  la $a0, msg
  syscall

  li	$v0,1
  move	$a0, $t2
  syscall

  j exit

print:
  li $v0, 4
  la $a0, msg
  syscall


  li $v0, 4
  la $a0, invalidMsg
  syscall

  j exit

exit:
    li $v0, 10
    syscall