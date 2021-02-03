# minimum.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

input:	.asciiz "Enter the next number:\n"
min:    .asciiz "Minimum: "
nl:     .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:

    li $v0, 4
    la $a0, input
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, input
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, input
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    slt $t4, $t1, $t0
    beq $t4, $zero, COMPARE

    move $t0, $t1

COMPARE:
    
    slt $t4, $t2, $t0
    beq $t4,$zero, PRINT
    
    move $t0, $t2

PRINT:

    li $v0, 4
    la $a0, min
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, nl
    syscall

exit:
    li $v0, 10
    syscall
