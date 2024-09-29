.data
mes1: .asciiz "Type a Binary Number\n"
mes2: .asciiz "It's a Binary number!\n"
mes3: .asciiz "Not a Binary Number..."
bsn: .asciiz "\n"
num: .word 0
num1 : .word 0
count: .word 0
val: .word 0
decim: .word 0
base: .word 0
lastdigit: .word 0

.text

.globl main

main:

li $v0, 4 #Asking Binary Number from User
la $a0, mes1
syscall

la $s0, num 
la $s1, num1
la $s2, count
la $s3, val
la $s4, decim
la $s5, base
la $s6, lastdigit

li $v0, 5 #User typing number
syscall
sw $v0, 0($s0)

lw $t0, 0($s0)

sw $t0, 0($s1)

lw $t0, 0($s1)

lw $t2, 0($s3)

lw $t4, 0($s2)
loop:  #While loop for input validation
beq $t0, $zero,  exit 

addi $t1, $zero, 10  

div $t0, $t1  #Modulo 
mfhi $t2

addi $t3, $zero, 1 

beq $t2, $t3, s      
beq $t2, $zero, s 
addi $t4, $t4, 1     
addi $t5, $zero, 10  
div $t0, $t0, $t5  
j loop  

s:
addi $t5, $zero, 10  
div $t0, $t0, $t5  
j loop  

exit: 

li $v0, 4
la $a0, bsn
syscall

bne $t4, $zero, no 

li $v0, 4 
la $a0, mes2
syscall

lw $t0, 0($s0)  #num 
lw $t1, 0  ($s4)  #dec
lw $t2, 0($s5) #base
lw $t3, 0($s6) #LastDigit

addi $t2, $zero, 1

loop1:
beq $t0, $zero, out 
addi $t5, $zero, 10 

div $t0, $t5 
mfhi $t3 
div $t0, $t0, $t5   
mul $t6, $t3, $t2  
add $t4, $t4, $t6  
addi $t7, $zero, 2 
mul $t2, $t2, $t7 
j loop1 
out: 

li $v0, 1 
move $a0, $t4
syscall 

j skip  

no: 

li $v0, 4 
la $a0, mes3
syscall

skip:

li $v0, 10 #End of Program
syscall
