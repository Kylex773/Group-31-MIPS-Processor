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


module Pipline_Execute(Clk, MemReadE, MemToRegE, MemWriteE, RegWriteE, ALUresultE, ReadData2E, WriteRegE, MemReadM, MemToRegM, MemWriteM, RegWriteM, ALUresultM, ReadData2M, WriteRegM,
MemTypeE, MemTypeM, PCPlus4E, PCPlus4M, jalE, jalM, DisplayE, DisplayM, BranchTypeE, BranchTypeM);
    input Clk;
    input MemReadE;
    input MemToRegE;
    input MemWriteE;
    input RegWriteE;
    input [31:0] ALUresultE;
    input [31:0] ReadData2E;
    input [4:0] WriteRegE;
    input [1:0] MemTypeE;
    input [31:0] PCPlus4E;
    input jalE, DisplayE;
    input [1:0] BranchTypeE;
    
    
    output reg MemReadM;
    output reg MemToRegM;
    output reg MemWriteM;
    output reg RegWriteM;
    output reg [31:0] ALUresultM;
    output reg [31:0] ReadData2M;
    output reg [4:0] WriteRegM;
    output reg [1:0] MemTypeM;
    output reg [31:0] PCPlus4M;
    output reg jalM, DisplayM;
    output reg [1:0] BranchTypeM;
    
    always @(posedge Clk) begin
    MemReadM <= MemReadE;
    MemToRegM <= MemToRegE;
    MemWriteM <= MemWriteE;
    RegWriteM <= RegWriteE;
    ALUresultM <= ALUresultE;
    ReadData2M <= ReadData2E;
    WriteRegM <= WriteRegE;
    MemTypeM <= MemTypeE;
    PCPlus4M <= PCPlus4E;
    jalM <= jalE;
    DisplayM <= DisplayE;
    BranchTypeM <= BranchTypeE;
    end

endmodule
