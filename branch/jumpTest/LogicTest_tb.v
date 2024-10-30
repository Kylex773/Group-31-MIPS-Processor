`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 04:39:23 PM
// Design Name: 
// Module Name: LogicTest_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LogicTest_tb();

reg [31:0] Instruction, ReadData1, ReadData2;

wire [31:0] PCInput; 

wire [1:0] PCSelect, BranchType;
wire Branch;

LogicTestTop u0(
.Instruction(Instruction),
.ReadData1(ReadData1),
.ReadData2(ReadData2),
.PCInput(PCInput),
.PCSelect(PCSelect),
.BranchType(BranchType),
.Branch(Branch)
);

initial begin
Instruction <= 32'h05210000;	//     	bgez	$t1, 0
ReadData1 <= 47;
ReadData2 <= 47;
#50
ReadData1 <= -9;
#50
Instruction <= 32'h112a0000;	//		beq	$t1, $t2, 0
#50
ReadData1 <= -9;
#50
ReadData2 <= -9;
#50
Instruction <= 32'h152a0000;	//		bne	$t1, $t2, 0
#50
ReadData2 <= 16;
#50
Instruction <= 32'h1d200000;	//		bgtz	$t1, 0
#50
ReadData1 <= 12;
#50
Instruction <= 32'h19200000;	//		blez	$t1, 0
#50
ReadData1 <= -2;
#50
Instruction <= 32'h00000000;	//		nop
Instruction <= 32'h08000004;	//		j	4
#50
Instruction <= 32'h01200008;	//		jr	$t1
#50
Instruction <= 32'b00001100000000000000000000000000;	//		jal
end 
endmodule
