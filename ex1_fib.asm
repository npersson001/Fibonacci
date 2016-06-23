.globl fibonacci

fibonacci:
	addi $sp, $sp, -12 	#save in stack
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)

	ori $s0, $a0, 0

	ori $t1, $0, 1
	beq $s0, $0, return_zero
	beq $s0, $t1, return_one

	addi $a0, $s0, -1
	jal fibonacci

	ori $s1, $v0, 0     

	addi $a0, $s0, -2
	jal fibonacci           

	add $v0, $v0, $s1      
exitfib:

	lw $ra, 8($sp)      	#restore from stack
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	addi $sp, $sp, 12      
	jr $ra

return_one:
 	li $v0, 1
 	j exitfib
return_zero :     
	li $v0, 0
 	j exitfib