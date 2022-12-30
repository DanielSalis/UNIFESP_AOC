.data
  msg: .asciiz "Maior: "

.text
.globl main

main:
 li $v0, 5
 syscall
 move $t0, $v0

 li $v0, 5
 syscall
 move $t1, $v0

 li $v0, 5
 syscall
 move $t2, $v0

 bgt $t0, $t1, compareT0T2
 bgt $t1, $t0, compareT1T2

 compareT0T2:
   bgt $t0, $t2, printT0
   bgt $t2, $t0, compareT1T2

 printT0:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 1
  move $a0, $t0
  syscall

  j exit

 compareT1T2:
   bgt $t1, $t2, printT1
   bgt $t2, $t1, printT2

 printT1:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 1
  move $a0, $t1
  syscall

  j exit

 printT2:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 1
  move $a0, $t2
  syscall

  j exit

exit:
 li, $v0, 10
 syscall


