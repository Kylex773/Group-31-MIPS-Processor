`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;

    reg [31:0] Address;

	InstructionMemory u0(
		Address,
        Instruction
	);

	initial begin
	
    /* Please fill in the implementation here... */
	Address<=20;
	#10;
	
	Address<=2;
	#10;

	Address<=50;
	#10;
	
	Address<=100;
	#10;
    end
endmodule

