`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 05:31:31 PM
// Design Name: 
// Module Name: Pipline_SAD2
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


module pipline_SAD2(Clk, MemtoRegSAD2, RegWriteSAD2, MemReadDataSAD2, ALUResultSAD2, WriteRegSAD2,
 MemtoRegW, RegWriteW, MemReadDataW, ALUResultW, WriteRegW,
PCPlus4SAD2, PCPlus4W, jalSAD2, jalW, DisplaySAD2, DisplayW, BranchTypeSAD2, BranchTypeW, Reset,
hazardTypeW, hazardTypeSAD2, instructionSAD2, instructionW, BranchSAD2, BranchW, FADSAD2, FADW,
curXIn, CurYIn, minXIn, minYIn, currSADIn, minSADIn,
curXOut, CurYOut, minXOut, minYOut, currSADOut, minSADOut
);

input Clk;
input MemtoRegSAD2;
input RegWriteSAD2;
input [31:0] MemReadDataSAD2;
input [31:0] ALUResultSAD2;
input [4:0] WriteRegSAD2;
input [31:0] PCPlus4SAD2;
input jalSAD2, DisplaySAD2;
input [1:0] BranchTypeSAD2;
input Reset;
input hazardTypeSAD2;
input [31:0]instructionSAD2;
input BranchSAD2;
input [31:0] FADSAD2;

input [31:0] curXIn, CurYIn, minXIn, minYIn;
input [31:0] currSADIn, minSADIn;

output reg MemtoRegW;
output reg RegWriteW;
output reg [31:0] MemReadDataW;
output reg [31:0] ALUResultW;
output reg [4:0] WriteRegW;
output reg [31:0]PCPlus4W;
output reg jalW, DisplayW;
output reg [1:0] BranchTypeW;
output reg hazardTypeW;
output reg [31:0]instructionW;
output reg BranchW;
output reg [31:0] FADW;

output reg [31:0] curXOut, CurYOut, minXOut, minYOut;
output reg [31:0] currSADOut, minSADOut;

always @(posedge Clk) begin
        if(Reset) begin
        MemtoRegW <= 0;
        RegWriteW <= 0;
        MemReadDataW <= 0;
        ALUResultW <= 0;
        WriteRegW <= 0;
        PCPlus4W <= 0;
        jalW <= 0;
        DisplayW <= 0;
        BranchTypeW <= 0;
        end
        else begin
        MemtoRegW <= MemtoRegSAD2;
        RegWriteW <= RegWriteSAD2;
        MemReadDataW <= MemReadDataSAD2;
        ALUResultW <= ALUResultSAD2;
        WriteRegW <= WriteRegSAD2;
        PCPlus4W <= PCPlus4SAD2;
        jalW <= jalSAD2;
        DisplayW <= DisplaySAD2;
        BranchTypeW <= BranchTypeSAD2;
        hazardTypeW <= hazardTypeSAD2;
        instructionW <= instructionSAD2;
        BranchW <= BranchSAD2;
        FADW <= FADSAD2;
        curXOut <= curXIn;
        CurYOut <= CurYIn;
        minXOut <= minXIn;
        minYOut <= minYIn;
        currSADOut <= currSADIn;
        minSADOut <= minSADIn;
        
        
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
