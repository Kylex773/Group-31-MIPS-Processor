`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 02:05:22 PM
// Design Name: 
// Module Name: top
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


module top(Clk, Reset);

input Clk;
input Reset;

wire [31:0] PCOut; //PCcounter output
wire [31:0] PCplus4; //PC + 4
wire [31:0] Instruction; //current instruction

wire RegDst; //writing to rt or rd
wire MemRead; //is the memory read
wire MemToReg; //is the register getting its value from memory
wire [3:0] ALUOp; //4 bit output code to control ALU
wire MemWrite; //is the memory being written to
wire ALUSrc; //is the second ALU input from a register or an immediate
wire RegWrite; //is the a register bing written to
wire [4:0] WriteReg;
wire [31:0] RegWriteData;
wire [31:0] RegReadData1;
wire [31:0] RegReadData2;
wire [31:0] ImmExt;


ProgramCounter PC(PCplus4, PCOut, Reset, Clk);
PCAdder PCAdder(PCOut, PCplus4);
InstructionMemory IM(PCOut, Instruction);
Controller Controller(Instruction[31:26], RegDst, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite);
Mux32Bit2To1 WriteRegMux(WriteReg, Instruction[20:16], Instruction[15:11], RegDst);
RegisterFile RegFile(Instruction[25:21], Instruction[20:16], WriteReg, RegWriteData, RegWrite, Clk, RegReadData1, RegReadData2);
SignExtension SignExtender(Instruction[15:0], ImmExt);






endmodule
