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
memory[5] <= 32'b00100001001010010000000000000110;	//		addi	$t1, $t1, 6
memory[6] <= 32'b00000000000000000000000000000000;	//		nop
memory[7] <= 32'b00000000000000000000000000000000;	//		nop
memory[8] <= 32'b00000000000000000000000000000000;	//		nop
memory[9] <= 32'b00000000000000000000000000000000;	//		nop
memory[10] <= 32'b10101100000010010000000000000000;	//		sw	$t1, 0($0)
memory[11] <= 32'b00000000000000000000000000000000;	//		nop
memory[12] <= 32'b00000000000000000000000000000000;	//		nop
memory[13] <= 32'b00000000000000000000000000000000;	//		nop
memory[14] <= 32'b00000000000000000000000000000000;	//		nop
memory[15] <= 32'b10001100000010100000000000000000;	//		lw	$t2, 0($0)
memory[16] <= 32'b00000000000000000000000000000000;	//		nop
memory[17] <= 32'b00000000000000000000000000000000;	//		nop
memory[18] <= 32'b00000000000000000000000000000000;	//		nop
memory[19] <= 32'b00000000000000000000000000000000;	//		nop
memory[20] <= 32'b00100001010010110000000000000100;	//		addi	$t3, $t2, 4
memory[21] <= 32'b00000000000000000000000000000000;	//		nop
memory[22] <= 32'b00000000000000000000000000000000;	//		nop
memory[23] <= 32'b00000000000000000000000000000000;	//		nop
memory[24] <= 32'b00000000000000000000000000000000;	//		nop
memory[25] <= 32'b01110001011010100110000000000010;	//		mul	$t4, $t3, $t2
memory[26] <= 32'b00000000000000000000000000000000;	//		nop
memory[27] <= 32'b00000000000000000000000000000000;	//		nop
memory[28] <= 32'b00000000000000000000000000000000;	//		nop
memory[29] <= 32'b00000000000000000000000000000000;	//		nop
memory[30] <= 32'b00000001100010110110100000100010;	//		sub	$t5, $t4, $t3
memory[31] <= 32'b00000000000000000000000000000000;	//		nop
memory[32] <= 32'b00000000000000000000000000000000;	//		nop
memory[33] <= 32'b00000000000000000000000000000000;	//		nop
memory[34] <= 32'b00000000000000000000000000000000;	//		nop
memory[35] <= 32'b00000001101010110110100000100100;	//		and	$t5, $t5, $t3
memory[36] <= 32'b00000000000000000000000000000000;	//		nop
memory[37] <= 32'b00000000000000000000000000000000;	//		nop
memory[38] <= 32'b00000000000000000000000000000000;	//		nop
memory[39] <= 32'b00000000000000000000000000000000;	//		nop
memory[40] <= 32'b00110001101011010000000000101111;	//		andi	$t5, $t5, 47
memory[41] <= 32'b00000000000000000000000000000000;	//		nop
memory[42] <= 32'b00000000000000000000000000000000;	//		nop
memory[43] <= 32'b00000000000000000000000000000000;	//		nop
memory[44] <= 32'b00000000000000000000000000000000;	//		nop
memory[45] <= 32'b00000001101000000110100000100101;	//		or	$t5, $t5, $0
memory[46] <= 32'b00000000000000000000000000000000;	//		nop
memory[47] <= 32'b00000000000000000000000000000000;	//		nop
memory[48] <= 32'b00000000000000000000000000000000;	//		nop
memory[49] <= 32'b00000000000000000000000000000000;	//		nop
memory[50] <= 32'b00000001101010100110100000100111;	//		nor	$t5, $t5, $t2
memory[51] <= 32'b00000000000000000000000000000000;	//		nop
memory[52] <= 32'b00000000000000000000000000000000;	//		nop
memory[53] <= 32'b00000000000000000000000000000000;	//		nop
memory[54] <= 32'b00000000000000000000000000000000;	//		nop
memory[55] <= 32'b00000001010010010100100000100110;	//		xor	$t1, $t2, $t1
memory[56] <= 32'b00000000000000000000000000000000;	//		nop
memory[57] <= 32'b00000000000000000000000000000000;	//		nop
memory[58] <= 32'b00000000000000000000000000000000;	//		nop
memory[59] <= 32'b00000000000000000000000000000000;	//		nop
memory[60] <= 32'b00110101001010010000000000000111;	//		ori	$t1, $t1, 7
memory[61] <= 32'b00000000000000000000000000000000;	//		nop
memory[62] <= 32'b00000000000000000000000000000000;	//		nop
memory[63] <= 32'b00000000000000000000000000000000;	//		nop
memory[64] <= 32'b00000000000000000000000000000000;	//		nop
memory[65] <= 32'b00111001101011010000000000001100;	//		xori	$t5, $t5, 12
memory[66] <= 32'b00000000000000000000000000000000;	//		nop
memory[67] <= 32'b00000000000000000000000000000000;	//		nop
memory[68] <= 32'b00000000000000000000000000000000;	//		nop
memory[69] <= 32'b00000000000000000000000000000000;	//		nop
memory[70] <= 32'b00000000000010100101000010000000;	//		sll	$t2, $t2, 2
memory[71] <= 32'b00000000000000000000000000000000;	//		nop
memory[72] <= 32'b00000000000000000000000000000000;	//		nop
memory[73] <= 32'b00000000000000000000000000000000;	//		nop
memory[74] <= 32'b00000000000000000000000000000000;	//		nop
memory[75] <= 32'b00000000000010100101000010000010;	//		srl	$t2, $t2, 2
memory[76] <= 32'b00000000000000000000000000000000;	//		nop
memory[77] <= 32'b00000000000000000000000000000000;	//		nop
memory[78] <= 32'b00000000000000000000000000000000;	//		nop
memory[79] <= 32'b00000000000000000000000000000000;	//		nop
memory[80] <= 32'b00000001010011010100100000101010;	//		slt	$t1, $t2, $t5
memory[81] <= 32'b00000000000000000000000000000000;	//		nop
memory[82] <= 32'b00000000000000000000000000000000;	//		nop
memory[83] <= 32'b00000000000000000000000000000000;	//		nop
memory[84] <= 32'b00000000000000000000000000000000;	//		nop
memory[85] <= 32'b00101001101010010000000000011111;	//		slti	$t1, $t5, 31

        
        
    end
    always @(Address) begin
        Instruction <= memory[Address[11:2]];
        
    end
    
endmodule
