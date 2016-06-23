.data 0x0
	newline:	.asciiz "\n"
	
.text 0x3000
.globl main

main:
	ori     $sp, $0, 0x2ffc     # Initialize stack pointer to the top word below 
	addi    $fp, $sp, -4        # Set $fp to the start of main's stack frame

loop:
	addiu $v0, $0, 5	#take in int
	syscall
	or $a0, $0, $v0		#put $v0 into $ao
	
	jal hanoi		#call procedure ($a0 should be argument passed)
	
	or $t0, $0, $v0		#put return number in $t0
	
	addu $a0, $0, $v0	#print number
	ori $v0, $0, 1
	syscall
	
	beq $t0, $0, exit_from_main	#if loop = false exit
	
	la $a0, newline		#print newLine
	ori $v0, $0, 4
	syscall
	
	beq $0, $0, loop		#loop back up if loop was true
	
hanoi:

exit_from_main:
	ori     $v0, $0, 10     # System call code 10 for exit
	syscall                 # Exit the program
end_of_main:
