`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 01:00:31 PM
// Design Name: 
// Module Name: Decode_sub_mod
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


module Decode_sub_mod(InstructionD, MemReadD, MemToRegD, ALUOpD, MemWriteD, ALUSrcD, 
    RegWriteD, BranchTypeD, jalD, DisplayD, hazardTypeD, WriteRegD1, Clk, WriteRegW,
    WriteDataW, RegWriteW, ReadData1D, ReadData2D, V0, V1, ImmExtD, BranchD,
    PCSel, PCPlus4D, PCPlus4F, PCInF, WriteRegD, SAD
);
    //Controller
    input [31:0] InstructionD;
    output wire MemReadD;
    output wire MemToRegD;
    output wire [3:0] ALUOpD;
    output wire MemWriteD;
    output wire ALUSrcD;
    output wire RegWriteD;
    output wire [1:0] BranchTypeD;
    output wire jalD;
    output wire DisplayD;
    output wire hazardTypeD;
    wire RegDst;
    
    //Mux5Bit2To1
    output wire [4:0] WriteRegD1;
    
    //RegisterFile
    input Clk;
    input [4:0] WriteRegW;
    input [31:0] WriteDataW;
    input RegWriteW;
    output wire [31:0] ReadData1D;
    output wire [31:0] ReadData2D;
    output wire [31:0] V0;
    output wire [31:0] V1;
    
    // SignExtender
    output wire [31:0] ImmExtD;
    
    //BranchComparator
    
    output wire BranchD; 
     
    //PCSelector
    output wire [1:0] PCSel;  
    
    //JumpAddress
    input [31:0] PCPlus4D;
    wire [31:0] JumpAddressD; 
       
    //BranchAdder
    wire [31:0] BranchAddressD;
    
    //PCMux
    input [31:0] PCPlus4F;
    output wire [31:0] PCInF;
    
    //JALMuxRegister
    output wire [4:0] WriteRegD;

    wire [1:0] SAD;
    
    
    
    Controller Controller(InstructionD[31:26], InstructionD[5:0], InstructionD[20:16], InstructionD,
      RegDst, MemReadD, MemToRegD, ALUOpD, MemWriteD, ALUSrcD, RegWriteD, BranchTypeD, jalD, 
      DisplayD, hazardTypeD, SAD);
    
    Mux5Bit2To1 RegDstMux(WriteRegD1, InstructionD[20:16], InstructionD[15:11], RegDst);
    
    RegisterFile RegisterFile(InstructionD[25:21], InstructionD[20:16], WriteRegW, WriteDataW, 
    RegWriteW, Clk, ReadData1D, ReadData2D, V0, V1);
    
    SignExtension SignExtender(InstructionD[15:0], ImmExtD);
    
    //Jump functions
    
    BranchComparator BranchComparator(ALUOpD, ReadData1D, ReadData2D, BranchD);
    
    PCSelector PCSelector(PCSel, BranchTypeD, BranchD);
    
    JumpAddress JumpAddressCalc(InstructionD[25:0], PCPlus4D, JumpAddressD);
    
    BranchAdder BranchAdder(PCPlus4D, ImmExtD, BranchAddressD);
    
    Mux32Bit4to1 PCMux(PCInF, PCPlus4F, JumpAddressD, ReadData1D, BranchAddressD, PCSel);
    
    Mux5Bit2To1 JALMuxRegister(WriteRegD, WriteRegD1, 31, jalD);



endmodule
