#CS 2640.04
#Jo Lawson
#October 29, 2023
#This code takes in two integer inputs and then prints them back to the user
#Then the code compares whether the inputs are equal
#and informs the user whether the numbers are the same or not equal.
#Finally, takes two integer inputs from the user and then performs arithmetic functions on 
#provided inputs:
#Addition, Subtraction, Multiplication, and Division



.data 

prompt1: .asciiz "Hello, please input a number: "
prompt2: .asciiz "This is the number you picked: "
space: .asciiz "\n"
equal: .asciiz "Your numbers are equal"
unequal: .asciiz "Your numbers are not equal"
sum: .asciiz "This is the sum of your numbers: "
difference: .asciiz "This is the difference of your numbers: "
product: .asciiz "This is the product of your numbers: "
quotient: .asciiz "This is the quotient of your numbers: "
.text 
main: 
	#display prompts
	li $v0, 4
	la $a0, prompt1
	syscall
	#get integer
	li $v0, 5
	syscall
	move $s0 , $v0

	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $s1,$v0
	
	li $v0, 4
	la $a0, prompt2
	syscall
	#displays number
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	add $t1,$s0,$s1
	li $v0, 4
	la $a0, sum
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	#prints space
	li $v0, 4
	la $a0, space
      	syscall
      	#subtracts and print difference
	sub $t2,$s0,$s1
	li $v0, 4
	la $a0, difference
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, space
      	syscall 
      	#muliplies and prints product
	mult $s0,$s1
	mflo $t3
	li $v0, 4
	la $a0, product
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0, space
      	syscall
      	#divides and prints quotient
	div $t4,$s0,$s1
	li $v0, 4
	la $a0, quotient
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	#checks if the numbers are equal
	beq $s0,$s1,ifEquals
	
	#if numbers are not equal continues with main block
	li $v0, 4
	la $a0, unequal
	syscall
	li $v0, 10
	syscall
	
		#if numbers are equal jumps to this method
ifEquals:
	li $v0, 4
	la $a0, equal
	syscall
	li $v0, 10
	syscall
	
exit:

	li $v0, 10
	syscall
	
	j exit