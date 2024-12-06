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
MemTypeE, MemTypeM, PCPlus4E, PCPlus4M, jalE, jalM, DisplayE, DisplayM, BranchTypeE, BranchTypeM,
hazardTypeE, hazardTypeM, InstructionE, InstructionM, Reset, BranchE, BranchM);
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
    input hazardTypeE;
    input [31:0] InstructionE;
    input Reset;
    input BranchE;
    
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
    output reg hazardTypeM;
    output reg [31:0] InstructionM;
    output reg BranchM;
    
    always @(posedge Clk) begin
    if(Reset) begin
    MemReadM <= 0;
    MemToRegM <= 0;
    MemWriteM <= 0;
    RegWriteM <= 0;
    ALUresultM <= 0;
    ReadData2M <= 0;
    WriteRegM <= 0;
    MemTypeM <= 0;
    PCPlus4M <= 0;
    jalM <= 0;
    DisplayM <= 0;
    BranchTypeM <= 0;
    hazardTypeM <= 0;
    InstructionM <= 0;
    BranchM <= 0;
    end
    else begin
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
    hazardTypeM <= hazardTypeE;
    InstructionM <= InstructionE;
    BranchM <= BranchE;
    end
    end

endmodule
