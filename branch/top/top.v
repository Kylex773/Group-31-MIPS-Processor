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


module top(Clk, Reset, PCOut, Instruction, RegWriteData, ALUResult, 
RegReadData2, RegReadData1, ALUOp, ALUControl);

input Clk;
input Reset;

output wire [31:0] PCOut; //PCcounter output
wire [31:0] PCplus4; //PC + 4
output wire [31:0] Instruction; //current instruction

wire RegDst; //writing to rt or rd
wire MemRead; //is the memory read
wire MemToReg; //is the register getting its value from memory
output wire [3:0] ALUOp; //4 bit output code to control ALU
wire MemWrite; //is the memory being written to
wire ALUSrc; //is the second ALU input from a register or an immediate
wire RegWrite; //is the a register bing written to
wire [4:0] WriteReg; //address of write register through the mux
output wire [31:0] RegWriteData; //write data for register
output wire [31:0] RegReadData1; //data at address of register 1
output wire [31:0] RegReadData2; //data at address of register 2
wire [31:0] ImmExt; //sign extended immediate value
wire [31:0] ALUSrcVal; //input B of the ALU through the mux
output wire [3:0] ALUControl; //control bits for the ALU operation
output wire [31:0] ALUResult; //output of ALU
wire ZeroFlag; //zero flag output of ALU
wire [31:0] MemReadData; //read data of the memory

ProgramCounter PC(PCplus4, PCOut, Reset, Clk);
PCAdder PCAdder(PCOut, PCplus4);
InstructionMemory IM(PCOut, Instruction);
Controller Controller(Instruction[31:26], RegDst, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite);
Mux32Bit2To1 WriteRegMux(WriteReg, Instruction[20:16], Instruction[15:11], RegDst);
RegisterFile RegFile(Instruction[25:21], Instruction[20:16], WriteReg, RegWriteData, RegWrite, Clk, RegReadData1, RegReadData2);
SignExtension SignExtender(Instruction[15:0], ImmExt);
Mux32Bit2To1 ALUSrcMux(ALUSrcVal, RegReadData2, ImmExt, ALUSrc);
ALU_Controller ALUController(ALUOp, Instruction[5:0], ALUControl);
ALU32Bit ALU(ALUControl, RegReadData1, ALUSrcVal, Instruction[10:6], ALUResult, ZeroFlag);
DataMemory DataMemory(ALUResult, RegReadData2, Clk, MemWrite, MemRead, MemReadData);
Mux32Bit2To1 WriteDataMux(RegWriteData, ALUResult, MemReadData, MemToReg);


endmodule
