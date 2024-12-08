`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ShftAmt, ALUResult, Zero, PCPlus4E);

	input [3:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs
    input [4:0] ShftAmt; //shift amount
    input [31:0] PCPlus4E;

	output reg [31:0] ALUResult;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0

    /* Please fill in the implementation here... */


//zero flag logic
always @(*)
begin 
if (ALUResult == 0) //zero is set when ALUResult is 0
Zero <= 1;
else //else it is 0
Zero <= 0; 
end 


always @(*)
begin
case(ALUControl)
4'b0000: ALUResult <= PCPlus4E + 4; //set 0 for jump commands
4'b0001: ALUResult <= A + B; //addition
4'b0010: ALUResult <= A - B; //subtraction
4'b0011: ALUResult <= A * B; //multiplication
4'b0100: begin//greater than or equal to
 if ((A[31:31] == 1) && (B[31:31] == 0))
    ALUResult <= 0;
 else if ((A[31:31] == 0) && (B[31:31] == 1))
    ALUResult <= 1;
 else
    ALUResult <= ((A > B) || (A == B));
 end
4'b0101: ALUResult <= (A != B); //not equal
4'b0110:  begin //greater than
if ((A[31:31] == 1) && (B[31:31] == 0))
    ALUResult <= 0;
 else if ((A[31:31] == 0) && (B[31:31] == 1))
    ALUResult <= 1;
 else
    ALUResult <= (A > B); //greater than
end
4'b0111: begin //less than or equal to
if ((A[31:31] == 1) && (B[31:31] == 0))
    ALUResult <= 1;
 else if ((A[31:31] == 0) && (B[31:31] == 1))
    ALUResult <= 0;
 else
    ALUResult <= ((A < B) || (A == B)); 
end 
4'b1000: begin//less than
if ((A[31:31] == 1) && (B[31:31] == 0))
    ALUResult <= 1;
 else if ((A[31:31] == 0) && (B[31:31] == 1))
    ALUResult <= 0;
 else
    ALUResult <= (A < B); 
end 
4'b1010: ALUResult <= A & B; //And
4'b1011: ALUResult <= A | B; //Or
4'b1100: ALUResult <= ~(A | B); //Nor
4'b1101: ALUResult <= A ^ B; //Xor
4'b1110: ALUResult <= B <<< ShftAmt; //Shift left
4'b1111: ALUResult <= B >>> ShftAmt; //Shift right

endcase 
end

endmodule

