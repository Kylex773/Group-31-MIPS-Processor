`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 3 (memory[i] = i * 3;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    /* Please fill in the implementation here */
    integer i;
    reg [31:0] memory [1023:0];    
    initial begin
       /* for (i=0;i<128;i=i+1)begin
            Memory[i] <= i * 3;
        end */
memory[0] <= 32'b00000000000000000100100000100000;	//	main:	add	$t1, $0, $0
memory[1] <= 32'b00000000000000000000000000000000;	//		nop
memory[2] <= 32'b00000000000000000000000000000000;	//		nop
memory[3] <= 32'b00000000000000000000000000000000;	//		nop
memory[4] <= 32'b00000000000000000000000000000000;	//		nop
memory[5] <= 32'b00100001001010010000000000000101;	//		addi	$t1, $t1, 5
memory[6] <= 32'b00000000000000000000000000000000;	//		nop
memory[7] <= 32'b00000000000000000000000000000000;	//		nop
memory[8] <= 32'b00000000000000000000000000000000;	//		nop
memory[9] <= 32'b00000000000000000000000000000000;	//		nop
memory[10] <= 32'b00001100000000000000000000010000;	//		jal	16
memory[11] <= 32'b00000000000000000000000000000000;	//		nop
memory[12] <= 32'b00000000000000000000000000000000;	//		nop
memory[13] <= 32'b00000000000000000000000000000000;	//		nop
memory[14] <= 32'b00000000000000000000000000000000;	//		nop
memory[15] <= 32'b00000000000000000000000000000000;	//		nop
memory[16] <= 32'b00000000000000000000000000000000;	//		nop
memory[17] <= 32'b00000000000000000000000000000000;	//		nop
memory[18] <= 32'b00000000000000000000000000000000;	//		nop
memory[19] <= 32'b00000011111000000000000000001000;	//		jr	$ra
memory[20] <= 32'b00000000000000000000000000000000;	//		nop
memory[21] <= 32'b00000000000000000000000000000000;	//		nop
memory[22] <= 32'b00000000000000000000000000000000;	//		nop
memory[23] <= 32'b00000000000000000000000000000000;	//		nop
memory[24] <= 32'b00000000000000000000000000000000;	//		nop


        
        
    end
    always @(Address) begin
        Instruction <= memory[Address[11:2]];
        
    end
    
endmodule
