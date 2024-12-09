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


module Pipline_Memory(Clk, MemtoRegM, RegWriteM, MemReadDataM, ALUResultM, WriteRegM,
 MemtoRegSAD1, RegWriteSAD1, MemReadDataSAD1, ALUResultSAD1, WriteRegSAD1,
PCPlus4M, PCPlus4SAD1, jalM, jalSAD1, DisplayM, DisplaySAD1, BranchTypeM, BranchTypeSAD1, Reset,
hazardTypeM, hazardTypeSAD1, instructionM, instructionSAD1, BranchM, BranchSAD1, vector1M, vector2M,
vector1SAD1, vector2SAD1);

input Clk;
input MemtoRegM;
input RegWriteM;
input [31:0] MemReadDataM;
input [31:0] ALUResultM;
input [4:0] WriteRegM;
input [31:0] PCPlus4M;
input jalM, DisplayM;
input [1:0] BranchTypeM;
input Reset;
input hazardTypeM;
input [31:0]instructionM;
input BranchM;
input [31:0] vector1M [0:15];
input [31:0] vector2M [0:15];



output reg MemtoRegSAD1;
output reg RegWriteSAD1;
output reg [31:0] MemReadDataSAD1;
output reg [31:0] ALUResultSAD1;
output reg [4:0] WriteRegSAD1;
output reg [31:0]PCPlus4SAD1;
output reg jalSAD1, DisplaySAD1;
output reg [1:0] BranchTypeSAD1;
output reg hazardTypeSAD1;
output reg [31:0]instructionSAD1;
output reg BranchSAD1;
output reg [31:0] vector1SAD1 [0:15];
output reg [31:0] vector2SAD1 [0:15];



always @(posedge Clk) begin
        if(Reset) begin
        MemtoRegSAD1 <= 0;
        RegWriteSAD1 <= 0;
        MemReadDataSAD1 <= 0;
        ALUResultSAD1 <= 0;
        WriteRegSAD1 <= 0;
        PCPlus4SAD1 <= 0;
        jalSAD1 <= 0;
        DisplaySAD1 <= 0;
        BranchTypeSAD1 <= 0;
        end
        else begin
        MemtoRegSAD1 <= MemtoRegM;
        RegWriteSAD1 <= RegWriteM;
        MemReadDataSAD1 <= MemReadDataM;
        ALUResultSAD1 <= ALUResultM;
        WriteRegSAD1 <= WriteRegM;
        PCPlus4SAD1 <= PCPlus4M;
        jalSAD1 <= jalM;
        DisplaySAD1 <= DisplayM;
        BranchTypeSAD1 <= BranchTypeM;
        hazardTypeSAD1 <= hazardTypeM;
        instructionSAD1 <= instructionM;
        BranchSAD1 <= BranchM;
        vector1SAD1 <= vector1M;
        vector2SAD1 <= vector2M;
        end
        //if(INT)begin
        //window1 <= Vect1
        //window2 <= Vect2 ect
        //else
        //frame1 <= Vect1
        //frame2 <= Vect2 ect
        //end
    end


endmodule
