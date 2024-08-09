//Initializing memory blocks. 
//Compiled into memory assignments. (Not typical MIPS)
init 0x0A 0x3
init 0x0B 0xB
//Load...
lw 1, 0, 0x0A
lw 2, 0, 0x0B
//Initialize a counter that counts up to reg 1
addi 3, 0, 0x0
//Jump to end if counter is equal to first number
beq 1, 3, 0x4
// add to sum and increment
addu 4, 4, 2
addi 3, 3, 0x1
// Back to the beginning of the loop
beq 0, 0, -3
// Print the result
addu 5, 4, 0
//...and save to memory
sw 5, 0, 0x20