`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 05:25:17 PM
// Design Name: 
// Module Name: pipline_SAD1
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


module pipline_SAD1(Clk, MemtoRegSAD1, RegWriteSAD1, MemReadDataSAD1, ALUResultSAD1, WriteRegSAD1,
MemtoRegSAD2, RegWriteSAD2, MemReadDataSAD2, ALUResultSAD2, WriteRegSAD2,PCPlus4SAD1, 
PCPlus4SAD2, jalSAD1, jalSAD2, DisplaySAD1, DisplaySAD2, BranchTypeSAD1, BranchTypeSAD2, Reset,
hazardTypeSAD1, hazardTypeSAD2, instructionSAD1, instructionSAD2, BranchSAD1, BranchSAD2,
V1SAD1, V2SAD1, V3SAD1, V4SAD1, V5SAD1, V6SAD1, V7SAD1, V8SAD1, V9SAD1, V10SAD1, V11SAD1, 
V12SAD1, V13SAD1, V14SAD1, V15SAD1, V16SAD1,
V1SAD2, V2SAD2, V3SAD2, V4SAD2, V5SAD2, V6SAD2, V7SAD2, V8SAD2,
V9SAD2, V10SAD2, V11SAD2, V12SAD2, V13SAD2, V14SAD2, V15SAD2, V16SAD2);

input Clk;
input MemtoRegSAD1;
input RegWriteSAD1;
input [31:0] MemReadDataSAD1;
input [31:0] ALUResultSAD1;
input [4:0] WriteRegSAD1;
input [31:0] PCPlus4SAD1;
input jalSAD1, DisplaySAD1;
input [1:0] BranchTypeSAD1;
input Reset;
input hazardTypeSAD1;
input [31:0]instructionSAD1;
input BranchSAD1;
input [31:0] V1SAD1;
input [31:0] V2SAD1;
input [31:0] V3SAD1;
input [31:0] V4SAD1;
input [31:0] V5SAD1;
input [31:0] V6SAD1;
input [31:0] V7SAD1;
input [31:0] V8SAD1;
input [31:0] V9SAD1;
input [31:0] V10SAD1;
input [31:0] V11SAD1;
input [31:0] V12SAD1;
input [31:0] V13SAD1;
input [31:0] V14SAD1;
input [31:0] V15SAD1;
input [31:0] V16SAD1;

output reg MemtoRegSAD2;
output reg RegWriteSAD2;
output reg [31:0] MemReadDataSAD2;
output reg [31:0] ALUResultSAD2;
output reg [4:0] WriteRegSAD2;
output reg [31:0]PCPlus4SAD2;
output reg jalSAD2, DisplaySAD2;
output reg [1:0] BranchTypeSAD2;
output reg hazardTypeSAD2;
output reg [31:0]instructionSAD2;
output reg BranchSAD2;

output reg [31:0] V1SAD2;
output reg [31:0] V2SAD2;
output reg [31:0] V3SAD2;
output reg [31:0] V4SAD2;
output reg [31:0] V5SAD2;
output reg [31:0] V6SAD2;
output reg [31:0] V7SAD2;
output reg [31:0] V8SAD2;
output reg [31:0] V9SAD2;
output reg [31:0] V10SAD2;
output reg [31:0] V11SAD2;
output reg [31:0] V12SAD2;
output reg [31:0] V13SAD2;
output reg [31:0] V14SAD2;
output reg [31:0] V15SAD2;
output reg [31:0] V16SAD2;


always @(posedge Clk) begin
        if(Reset) begin
        MemtoRegSAD2 <= 0;
        RegWriteSAD2 <= 0;
        MemReadDataSAD2 <= 0;
        ALUResultSAD2 <= 0;
        WriteRegSAD2 <= 0;
        PCPlus4SAD2 <= 0;
        jalSAD2 <= 0;
        DisplaySAD2 <= 0;
        BranchTypeSAD2 <= 0;
        end
        else begin
        MemtoRegSAD2 <= MemtoRegSAD1;
        RegWriteSAD2 <= RegWriteSAD1;
        MemReadDataSAD2 <= MemReadDataSAD1;
        ALUResultSAD2 <= ALUResultSAD1;
        WriteRegSAD2 <= WriteRegSAD1;
        PCPlus4SAD2 <= PCPlus4SAD1;
        jalSAD2 <= jalSAD1;
        DisplaySAD2 <= DisplaySAD1;
        BranchTypeSAD2 <= BranchTypeSAD1;
        hazardTypeSAD2 <= hazardTypeSAD1;
        instructionSAD2 <= instructionSAD1;
        BranchSAD2 <= BranchSAD1;
        
    V1SAD2 <= V1SAD1;
    V2SAD2 <= V2SAD1;
    V2SAD2 <= V2SAD1;
    V2SAD2 <= V2SAD1;
    V2SAD2 <= V2SAD1;
    V6SAD2 <= V6SAD1;
    V7SAD2 <= V7SAD1;
    V8SAD2 <= V8SAD1;
    V9SAD2 <= V9SAD1;
    V10SAD2 <= V10SAD1;
    V11SAD2 <= V11SAD1;
    V12SAD2 <= V12SAD1;
    V13SAD2 <= V13SAD1;
    V14SAD2 <= V14SAD1;
    V15SAD2 <= V15SAD1;
    V16SAD2 <= V16SAD1;
        
        end
    end


endmodule
