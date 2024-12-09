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
hazardTypeSAD1, hazardTypeSAD2, instructionSAD1, instructionSAD2, BranchSAD1, BranchSAD2);
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
        end
    end


endmodule
