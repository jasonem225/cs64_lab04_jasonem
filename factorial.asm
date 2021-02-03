# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

input: .asciiz "Enter a number:\n"
output1: .asciiz "Factorial of "
output2: .asciiz " is:\n"
nl: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:

    li $v0, 4
    la $a0, input
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 2
    li $t2, 1
    li $t4, 1

LOOP:

   
    sltu $t3, $t4, $t0
    beq $t3, $zero, PRINT
    multu $t2, $t1
    mflo $t2
    addiu $t1, $t1, 1
    addiu $t4, $t4, 1
    j LOOP

PRINT:

    li $v0, 4
    la $a0, output1
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, output2
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, nl
    syscall

exit:
    li $v0, 10
    syscall
