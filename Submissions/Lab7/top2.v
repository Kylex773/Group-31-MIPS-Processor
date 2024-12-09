`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 02:50:54 PM
// Design Name: 
// Module Name: top2
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
//  Overall percent effort of each team meber: 
//  Patrick - 33.3%, Kyle - 33.3%, Aiden - 33.3%
//////////////////////////////////////////////////////////////////////////////////


module top2(
Clk, Reset, V0, V1
    );
    
    //Global Variables
    input Clk, Reset;
    wire [31:0] PCPlus4F; //PC Counter + 4
    wire [31:0] InstructionF; //Instuction 32 bit
    wire [31:0] PCOutF; //PC Counter output
    wire [31:0] PCPlus4D;
    wire [31:0] InstructionD;
    wire MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD, RegDst;
    wire [3:0] ALUOpD;
    wire [4:0] WriteRegD; 
    wire [4:0] WriteRegD1;
    wire [31:0] ImmExtD; 
    wire [31:0] ReadData1D;
    wire [31:0] ReadData2D;
    wire MemReadE;
    wire MemToRegE;
    wire MemWriteE;
    wire RegWriteE;
    wire [31:0] ALUResultE;
    wire [31:0] ReadData2E;
    wire [4:0] WriteRegE;
    wire [31:0] ALUSrcValE;
    wire [31:0] ImmExtE;
    wire ALUSrcE;
    wire [31:0] ReadData1E;
    wire [4:0] ShftAmtE;
    wire ZeroE;
    wire [3:0] ALUOpE;
    wire [3:0] ALUControlE;
    wire MemtoRegM;
    wire RegWriteM;
    wire [31:0] MemReadDataM;
    wire [31:0] ALUResultM;
    wire [31:0] ReadData2M;
    wire MemtoRegW;
    wire RegWriteW;
    wire [31:0] MemReadDataW;
    wire [31:0] ALUResultW;
    wire [4:0] WriteRegW;
    wire [4:0] WriteRegM;
    wire [31:0] WriteDataW;
    wire [31:0] WriteDataW1;
    wire MemWriteM;
    wire MemReadM;
    wire [1:0] MemTypeD, MemTypeE;
    wire [1:0] MemTypeM;
    wire [31:0] PCPlus4E, PCPlus4M;
    wire [31:0] PCPlus4W;
    wire [1:0] BranchTypeD;
    wire jalD;
    wire jalE, jalM, jalW;
    wire BranchD;
    wire [1:0] PCSel;
    wire [31:0] PCInF;
    wire [31:0] JumpAddressD;
    wire [31:0] BranchAddressD;
    wire DisplayD, DisplayE, DisplayM, DisplayW;
    wire [1:0] BranchTypeE, BranchTypeM, BranchTypeW;
    wire hazardTypeD, hazardTypeE, hazardTypeM;
    wire [31:0] InstructionE, InstructionM;
    wire [31:0] InstructionW;
    wire  hazardTypeW;
    
    wire BranchE, BranchM;
    wire BranchW;
    output wire [31:0] V0, V1;
    
    
    wire MemtoRegSAD1;
    wire RegWriteSAD1;
    wire [31:0] MemReadDataSAD1;
    wire [31:0] ALUResultSAD1;
    wire [4:0] WriteRegSAD1;
    wire [31:0]PCPlus4SAD1;
    wire jalSAD1, DisplaySAD1;
    wire [1:0] BranchTypeSAD1;
    wire hazardTypeSAD1;
    wire [31:0]instructionSAD1;
    wire BranchSAD1;
    
    wire MemtoRegSAD2;
    wire RegWriteSAD2;
    wire [31:0] MemReadDataSAD2;
    wire [31:0] ALUResultSAD2;
    wire [4:0] WriteRegSAD2;
    wire [31:0]PCPlus4SAD2;
    wire jalSAD2, DisplaySAD2;
    wire [1:0] BranchTypeSAD2;
    wire hazardTypeSAD2;
    wire [31:0]instructionSAD2;
    wire BranchSAD2;
    
    wire [1:0] MFSel;
    wire [31:0] addrS1, addrS2, addrW;
    
    wire [1:0] SADD, SADE;
    
    
    

    
    
    
    //(* MARK_DEBUG = "TRUE" *) output reg [31:0] PCPLUS4;
    
    //(* MARK_DEBUG = "TRUE" *) output wire [31:0] InstructioW;
    
    //Fetch Stage
    //ProgramCounter PCCounter(PCInF, PCOutF, Reset, Clk, ~Stall);
    //PCAdder PCAdder(PCOutF, PCPlus4F);
    //InstructionMemory InstructionMemory(PCOutF, InstructionF);
    
   Fetch_sub_mod Fetch_sub_mod(Clk, Reset, PCPlus4F, InstructionF, PCInF);
    
    Pipline_Fetch Pipline_Fetch(Clk, PCPlus4F, InstructionF, PCPlus4D, InstructionD, Reset);
    
    
    Decode_sub_mod Decode_sub_mod(InstructionD, MemReadD, MemToRegD, ALUOpD, MemWriteD, ALUSrcD, 
    RegWriteD, BranchTypeD, jalD, DisplayD, hazardTypeD, WriteRegD1, Clk, WriteRegW,
    WriteDataW, RegWriteW, ReadData1D, ReadData2D, V0, V1, ImmExtD, BranchD,
    PCSel, PCPlus4D, PCPlus4F, PCInF, WriteRegD, SADD);
    
    
    Pipline_Decode Pipline_Decode(Clk,
        MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD, InstructionD[27:26],
        ALUOpD, WriteRegD, ImmExtD, ReadData1D, ReadData2D, InstructionD[10:6], 
        MemReadE, MemToRegE, MemWriteE, ALUSrcE, RegWriteE, MemTypeE,
        ALUOpE, WriteRegE, ImmExtE, ReadData1E, ReadData2E, ShftAmtE,
        PCPlus4D, PCPlus4E, jalD, jalE, DisplayD, DisplayE, BranchTypeD, BranchTypeE,
        hazardTypeD, hazardTypeE, InstructionD, InstructionE, Reset, BranchD, BranchE, SADD, SADE);
        
    //Execute Stage
    //Mux32Bit2To1 ALUSrcMux(ALUSrcValE, ReadData2E, ImmExtE, ALUSrcE);
     
    //ALU_Controller ALU_Controller(ALUOpE, ImmExtE[5:0], ALUControlE);
     
    //ALU32Bit ALU(ALUControlE, ReadData1E, ALUSrcValE, ShftAmtE, ALUResultE, Zero, PCPlus4E);
    
    Execute_sub_mod Execute_sub_mod(ReadData2E, ImmExtE, ALUSrcE, ALUOpE, ReadData1E, ShftAmtE,
     PCPlus4E, ALUResultE, Zero);
    
    Pipline_Execute Pipline_Execute(
        Clk, MemReadE, MemToRegE, MemWriteE, 
        RegWriteE, ALUResultE, ReadData2E, WriteRegE,
        MemReadM, MemtoRegM, MemWriteM, RegWriteM,
        ALUResultM, ReadData2M, WriteRegM,
        MemTypeE, MemTypeM, PCPlus4E, PCPlus4M,
        jalE, jalM, DisplayE, DisplayM, BranchTypeE, BranchTypeM,
        hazardTypeE, hazardTypeM, InstructionE, InstructionM, Reset, BranchE, BranchM);
    
    //Memory Stage
    //DataMemory DataMemory(ALUResultM, ReadData2M, Clk, MemWriteM, MemReadM,
     //MemReadDataM, MemTypeM, Reset); 
     
    forwardingUnit forwardingUnit(instructionW, instructionM, instructionSAD2, MFSel);
    
    Mux32Bit4to1(out, ALUResultM, addrS1, addrS2, addrW, MFSel);
     
    Memory_sub_mod(AddressM, WriteDataM, ReadData2M, Clk, MemWriteM, MemReadM, 
    MemTypeM, Reset, vector, address, rowSkip, updatedAddress);    
    
    Pipline_Memory Pipline_Memory(Clk, MemtoRegM, RegWriteM, MemReadDataM, ALUResultM, WriteRegM,
    MemtoRegSAD1, RegWriteSAD1, MemReadDataSAD1, ALUResultSAD1, WriteRegSAD1,
    PCPlus4M, PCPlus4SAD1, jalM, jalSAD1, DisplayM, DisplaySAD1, BranchTypeM, BranchTypeSAD1, Reset,
    hazardTypeM, hazardTypeSAD1, instructionM, instructionSAD1, BranchM, BranchSAD1);
    
    SAD1_sub_mod SAD1_sub_mod(vector1, vector2, vector4);
    
    pipline_SAD1 pipline_SAD1(Clk, MemtoRegSAD1, RegWriteSAD1, MemReadDataSAD1, ALUResultSAD1, WriteRegSAD1,
    MemtoRegSAD2, RegWriteSAD2, MemReadDataSAD2, ALUResultSAD2, WriteRegSAD2,PCPlus4SAD1, 
    PCPlus4SAD2, jalSAD1, jalSAD2, DisplaySAD1, DisplaySAD2, BranchTypeSAD1, BranchTypeSAD2, Reset,
    hazardTypeSAD1, hazardTypeSAD2, instructionSAD1, instructionSAD2, BranchSAD1, BranchSAD2);
    
    SAD2_sub_mod SAD2_sub_mod(vector4SAD2, x, y, SADValue, instructionSAD2, xnew, ynew);
    
    Pipline_SAD2 Pipline_SAD2(Clk, MemtoRegSAD2, RegWriteSAD2, MemReadDataSAD2, ALUResultSAD2, WriteRegSAD2,
    MemtoRegW, RegWriteW, MemReadDataW, ALUResultW, WriteRegW,
    PCPlus4SAD2, PCPlus4W, jalSAD2, jalW, DisplaySAD2, DisplayW, BranchTypeSAD2, BranchTypeW, Reset,
    hazardTypeW, hazardTypeSAD2, instructionSAD2, instructionW, BranchSAD2, BranchW);

    //Writeback Stage
    //Mux32Bit2To1 MemToRegMux(WriteDataW1, ALUResultW, MemReadDataW, MemtoRegW);
    //Mux32Bit2To1 JALMuxData(WriteDataW, WriteDataW1, (PCPlus4W), jalW);
    
    Writeback_sub_mod(ALUResultW, MemReadDataW, MemtoRegW, PCPlus4W, jalW, WriteDataW, A, B, Xa, 
    Ya, Xb, Yb, min, minX, minY);
    
    
    
    //display output

    
    
    
    
    
    
    
endmodule
