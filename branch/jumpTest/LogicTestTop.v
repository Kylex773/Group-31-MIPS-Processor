`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 04:22:51 PM
// Design Name: 
// Module Name: LogicTestTop
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


module LogicTestTop(Instruction, ReadData1, ReadData2, PCInput, PCSelect, BranchType, Branch);
    
    input [31:0] Instruction, ReadData1, ReadData2;
    
    output wire [1:0] BranchType;    
    output wire Branch;
    output wire [1:0] PCSelect;
    wire [3:0] ALUOp;    
    
    output [31:0] PCInput; 
    
    Controller controlTest(Instruction[31:26], Instruction[5:0], Instruction[20:16], RegDst, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, BranchType);
    BranchComparator branchTest(ALUOp, ReadData1, ReadData2, Branch);
    PCSelector PCSelTest(PCSelect, BranchType, Branch);
    Mux32Bit4to1 PCMux(PCInput, 420, 42069, ReadData2, 69, PCSelect);
    
endmodule
