`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 02:13:19 PM
// Design Name: 
// Module Name: Pipline_Decode
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


module Pipline_Decode(Clk,
MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD, MemTypeD,
ALUOpD, WriteRegD, ImmExtD, ReadData1D, ReadData2D, ShftAmtD,
MemReadE, MemToRegE, MemWriteE, ALUSrcE, RegWriteE, MemTypeE,
ALUOpE, WriteRegE, ImmExtE, ReadData1E, ReadData2E, ShftAmtE,
PCPlus4D, PCPlus4E, jalD, jalE, DisplayD, DisplayE, BranchTypeD, BranchTypeE,
hazardTypeD, hazardTypeE, instructionD, test, Decode_On, Reset
);

input Clk, MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD;
input [3:0] ALUOpD;
input [4:0] WriteRegD;
input [31:0] ImmExtD, ReadData1D, ReadData2D;
input [4:0] ShftAmtD;
input [1:0] MemTypeD;
input [31:0] PCPlus4D;
input jalD, DisplayD;
input [1:0] BranchTypeD;
input hazardTypeD;
input [31:0] instructionD;
input Decode_On;
input Reset;

output reg MemReadE, MemToRegE, MemWriteE, ALUSrcE, RegWriteE;
output reg [3:0] ALUOpE;
output reg [4:0] WriteRegE;
output reg [31:0] ImmExtE, ReadData1E, ReadData2E;
output reg [4:0] ShftAmtE;
output reg [1:0] MemTypeE;
output reg [31:0] PCPlus4E;
output reg jalE, DisplayE;
output reg [1:0] BranchTypeE;
output reg hazardTypeE;
output reg [31:0] test;

always @(posedge Clk)
begin
if(Reset) begin
test <= 0;
MemReadE <= 0;
MemToRegE <= 0;
MemWriteE <= 0;
ALUSrcE <= 0;
RegWriteE <= 0;
ALUOpE <= 0;
WriteRegE <= 0;
ImmExtE <= 0;
ReadData1E <= 0;
ReadData2E <= 0;
ShftAmtE <= 0;
MemTypeE <= 0;
PCPlus4E <= 0;
jalE <= 0;
DisplayE <= 0;
BranchTypeE <= 0;
hazardTypeE <= 0;
end


else begin
if(Decode_On) begin
test <= instructionD;
MemReadE <= MemReadD;
MemToRegE <= MemToRegD;
MemWriteE <= MemWriteD;
ALUSrcE <= ALUSrcD;
RegWriteE <= RegWriteD;
ALUOpE <= ALUOpD;
WriteRegE <= WriteRegD;
ImmExtE <= ImmExtD;
ReadData1E <= ReadData1D;
ReadData2E <= ReadData2D;
ShftAmtE <= ShftAmtD;
MemTypeE <= MemTypeD;
PCPlus4E <= PCPlus4D;
jalE <= jalD;
DisplayE <= DisplayD;
BranchTypeE <= BranchTypeD;
hazardTypeE <= hazardTypeD;
end
else begin
test <= 0;
MemReadE <= 0;
MemToRegE <= 0;
MemWriteE <= 0;
ALUSrcE <= 0;
RegWriteE <= 0;
ALUOpE <= 0;
WriteRegE <= 0;
ImmExtE <= 0;
ReadData1E <= 0;
ReadData2E <= 0;
ShftAmtE <= 0;
MemTypeE <= 0;
PCPlus4E <= 0;
jalE <= 0;
DisplayE <= 0;
BranchTypeE <= 0;
hazardTypeE <= 0;
end
end
end


endmodule
