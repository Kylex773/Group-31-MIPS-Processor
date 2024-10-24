`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 02:20:39 PM
// Design Name: 
// Module Name: Pipline_Execute
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


module Pipline_Execute(Clk, MemReadE, MemToRegE, MemWriteE, RegWriteE, ALUresultE, ReadData2E, WriteRegE, MemReadM, MemToRegM, MemWriteM, RegWriteM, ALUresultM, ReadData2M, WriteRegM);
    input Clk;
    input MemReadE;
    input MemToRegE;
    input MemWriteE;
    input RegWriteE;
    input [31:0] ALUresultE;
    input [31:0] ReadData2E;
    input [4:0] WriteRegE;
    
    output reg MemReadM;
    output reg MemToRegM;
    output reg MemWriteM;
    output reg RegWriteM;
    output reg [31:0] ALUresultM;
    output reg [31:0] ReadData2M;
    output reg [4:0] WriteRegM;
    
    always @(posedge Clk) begin
    MemReadM <= MemReadE;
    MemToRegM <= MemToRegE;
    MemWriteM <= MemWriteE;
    RegWriteM <= RegWriteE;
    ALUresultM <= ALUresultE;
    ReadData2M <= ReadData2E;
    WriteRegM <= WriteRegE;
    end

endmodule
