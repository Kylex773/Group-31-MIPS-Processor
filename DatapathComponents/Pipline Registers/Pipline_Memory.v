`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 02:33:03 PM
// Design Name: 
// Module Name: Pipline_Memory
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


module Pipline_Memory(Clk, MemtoRegM, RegWriteM, MemReadDataM, ALUResultM, WriteRegM, MemtoRegW, RegWriteW, MemReadDataW, ALUResultW, WriteRegW,
PCPlus4M, PCPlus4W, jalM, jalW);
input Clk;
input MemtoRegM;
input RegWriteM;
input [31:0] MemReadDataM;
input [31:0] ALUResultM;
input [4:0] WriteRegM;
input [31:0] PCPlus4M;
input jalM;

output reg MemtoRegW;
output reg RegWriteW;
output reg [31:0] MemReadDataW;
output reg [31:0] ALUResultW;
output reg [4:0] WriteRegW;
output reg [31:0]PCPlus4W;
output reg jalW;

always @(posedge Clk) begin
        MemtoRegW <= MemtoRegM;
        RegWriteW <= RegWriteM;
        MemReadDataW <= MemReadDataM;
        ALUResultW <= ALUResultM;
        WriteRegW <= WriteRegM;
        PCPlus4W <= PCPlus4M;
        jalW <= jalM;
    end

endmodule
