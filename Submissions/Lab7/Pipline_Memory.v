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
hazardTypeM, hazardTypeSAD1, instructionM, instructionSAD1, BranchM, BranchSAD1, SADM, SADSAD1,
V1M, V2M, V3M, V4M, V5M, V6M, V7M, V8M, V9M, V10M, V11M, V12M, V13M, V14M, V15M, V16M,
WV1SAD1 , WV2SAD1 , WV3SAD1 , WV4SAD1 , WV5SAD1 , WV6SAD1 , WV7SAD1 , WV8SAD1 
,WV9SAD1 , WV10SAD1, WV11SAD1, WV12SAD1, WV13SAD1, WV14SAD1, WV15SAD1, WV16SAD1,
FV1SAD1, FV2SAD1, FV3SAD1, FV4SAD1, FV5SAD1, FV6SAD1, FV7SAD1, FV8SAD1, 
FV9SAD1, FV10SAD1, FV11SAD1, FV12SAD1, FV13SAD1, FV14SAD1, FV15SAD1, FV16SAD1);

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
input [1:0] SADM;

input [31:0] V1M;
input [31:0] V2M;
input [31:0] V3M;
input [31:0] V4M;
input [31:0] V5M;
input [31:0] V6M;
input [31:0] V7M;
input [31:0] V8M;
input [31:0] V9M;
input [31:0] V10M;
input [31:0] V11M;
input [31:0] V12M;
input [31:0] V13M;
input [31:0] V14M;
input [31:0] V15M;
input [31:0] V16M;

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
output reg [1:0] SADSAD1;

output reg [31:0] WV1SAD1;
output reg [31:0] WV2SAD1;
output reg [31:0] WV3SAD1;
output reg [31:0] WV4SAD1;
output reg [31:0] WV5SAD1;
output reg [31:0] WV6SAD1;
output reg [31:0] WV7SAD1;
output reg [31:0] WV8SAD1;
output reg [31:0] WV9SAD1;
output reg [31:0] WV10SAD1;
output reg [31:0] WV11SAD1;
output reg [31:0] WV12SAD1;
output reg [31:0] WV13SAD1;
output reg [31:0] WV14SAD1;
output reg [31:0] WV15SAD1;
output reg [31:0] WV16SAD1;

output reg [31:0] FV1SAD1;
output reg [31:0] FV2SAD1;
output reg [31:0] FV3SAD1;
output reg [31:0] FV4SAD1;
output reg [31:0] FV5SAD1;
output reg [31:0] FV6SAD1;
output reg [31:0] FV7SAD1;
output reg [31:0] FV8SAD1;
output reg [31:0] FV9SAD1;
output reg [31:0] FV10SAD1;
output reg [31:0] FV11SAD1;
output reg [31:0] FV12SAD1;
output reg [31:0] FV13SAD1;
output reg [31:0] FV14SAD1;
output reg [31:0] FV15SAD1;
output reg [31:0] FV16SAD1;

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
        SADSAD1 <= SADM;
        end
        
        if(SADM == 3) begin
        WV1SAD1 <= V1M;
        WV2SAD1 <= V2M;
        WV3SAD1 <= V3M;
        WV4SAD1 <= V4M;
        WV5SAD1 <= V5M;
        WV6SAD1 <= V6M;
        WV7SAD1 <= V7M;
        WV8SAD1 <= V8M;
        WV9SAD1 <= V9M;
        WV10SAD1 <= V10M;
        WV11SAD1 <= V11M;
        WV12SAD1 <= V12M;
        WV13SAD1 <= V13M;
        WV14SAD1 <= V14M;
        WV15SAD1 <= V15M;
        WV16SAD1 <= V16M;
               
        end
        
        else if(SADM == 2 || SADM == 1) begin
        FV1SAD1 <= V1M;
        FV2SAD1 <= V2M;
        FV3SAD1 <= V3M;
        FV4SAD1 <= V4M;
        FV5SAD1 <= V5M;
        FV6SAD1 <= V6M;
        FV7SAD1 <= V7M;
        FV8SAD1 <= V8M;
        FV9SAD1 <= V9M;
        FV10SAD1 <= V10M;
        FV11SAD1 <= V11M;
        FV12SAD1 <= V12M;
        FV13SAD1 <= V13M;
        FV14SAD1 <= V14M;
        FV15SAD1 <= V15M;
        FV16SAD1 <= V16M;
        end
        
        
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
