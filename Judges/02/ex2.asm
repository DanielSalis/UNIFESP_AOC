.data
        insertMessage:          .asciiz "Insira a mensagem: "
        totalCharacterMessage:  .asciiz "Numero total de caracteres: " 
        cryptoMessage:          .asciiz "\nMensagem Criptografada: "
        breakRow:               .asciiz "\n"

        stringWithAllChars: .asciiz " aArReEoOmMhHlLsSpP0123456789"
        space:    .asciiz " "
        letter_a: .asciiz "a"
        letter_A: .asciiz "A"
        letter_r: .asciiz "r"
        letter_R: .asciiz "R"
        letter_e: .asciiz "e"
        letter_E: .asciiz "E"
        letter_o: .asciiz "o"
        letter_O: .asciiz "O"
        letter_m: .asciiz "m"
        letter_M: .asciiz "M"
        letter_h: .asciiz "h"
        letter_H: .asciiz "h"
        letter_l: .asciiz "l"
        letter_L: .asciiz "L"
        letter_s: .asciiz "s"
        letter_S: .asciiz "S"
        letter_p: .asciiz "p"
        letter_P: .asciiz "P"

        input: .space 120
.text
.globl main

main:
        la $a0, insertMessage
        li $v0, 4
        syscall

        # get first string
        la      $s2,input
        move    $t2,$s2
        add	$t6, $t2, $zero
        
        jal     get_str


# string compare loop (just like strcmp)
cmploop:
        lb      $t2,($s2)                   # get next char from str1
        beq     $t2, 065, print_number_1    #case a
        beq     $t2, 097, print_number_1    #case a
        beq     $t2, 082, print_number_2    #case r
        beq     $t2, 114, print_number_2    #case r


        beq     $t2,$zero,exit_program      # at EOS? yes, fly (strings equal)
        addi    $s2,$s2,1
        j       cmploop

print_current_char:
        # addi    $s2,$s2,1  
        move     $a0, $t2
        li      $v0,4
        syscall
        j cmploop

# strings are _not_ equal -- send message
cmpne:
    la      $a0,nemsg
    li      $v0,4
    syscall
    j       main

# strings _are_ equal -- send message
cmpeq:
    la      $a0,eqmsg
    li      $v0,4
    syscall
    j       main


get_str:
    # read in the string
    move    $a0,$t2
    li      $a1,119
    li      $v0,8
    syscall

    j     get_length 

get_length:
        lb $t7, 0($t6)
        beqz $t7, exit_loop
        la      $a0, ($t7)
        li      $v0, 4
        syscall
        addi $t6, $t6, 1
        addi $t1, $t1, 1
        j get_length

exit_loop:
        li      $v0, 4
        la      $a0, totalCharacterMessage
        syscall

        addi    $t1, $t1, -1

        li      $v0, 4
        la      $a0, cryptoMessage
        syscall
        
        j cmploop


print_number_1:
        addi    $s2,$s2,1 
        li      $v0, 1
        la      $a0, 1
        syscall

        j cmploop

print_number_2:
        addi    $s2,$s2,1 
        li      $v0, 1
        la      $a0, 2
        syscall

        j cmploop


exit_program:
        li $v0, 10
        syscall