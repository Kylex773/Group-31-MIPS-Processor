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
PCPlus4D, PCPlus4E, jalD, jalE
);

input Clk, MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD;
input [3:0] ALUOpD;
input [4:0] WriteRegD;
input [31:0] ImmExtD, ReadData1D, ReadData2D;
input [4:0] ShftAmtD;
input [1:0] MemTypeD;
input [31:0] PCPlus4D;
input jalD;

output reg MemReadE, MemToRegE, MemWriteE, ALUSrcE, RegWriteE;
output reg [3:0] ALUOpE;
output reg [4:0] WriteRegE;
output reg [31:0] ImmExtE, ReadData1E, ReadData2E;
output reg [4:0] ShftAmtE;
output reg [1:0] MemTypeE;
output reg [31:0] PCPlus4E;
output reg jalE;

always @(posedge Clk)
begin
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
end

endmodule
