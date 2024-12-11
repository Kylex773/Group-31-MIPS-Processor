`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 01:09:53 PM
// Design Name: 
// Module Name: Controller_tb
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


module Controller_tb();

reg [5:0] InstCode;

wire regDst;
wire MemRead;
wire MemToReg;
wire [3:0] ALUOp;
wire MemWrite;
wire ALUSrc;
wire RegWrite;

Controller Controller(
    .InstCode(InstCode),
    .regDst(regDst),
    .MemRead(MemRead),
    .MemToReg(MemToReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
);

initial begin
InstCode = 6'b000000;  //add + subtract + Multiply + and + or + nor + 
// xor + sll + srl + slt

#100
InstCode = 6'b001000;  //addi

#100
InstCode = 6'b100011;  //lw

#100
InstCode = 6'b101011;  //sw

#100
InstCode = 6'b101000;  //sb

#100
InstCode = 6'b100001;  //lh

#100
InstCode = 6'b100000;  //lb

#100
InstCode = 6'b101001;  //sh

#100
InstCode = 6'b001100;  //andi

#100
InstCode = 6'b001101;  //ori

#100
InstCode = 6'b001110;  //xori

#100
InstCode = 6'b001010;  //slti









end
endmodule
