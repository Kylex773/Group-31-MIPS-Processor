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
    wire jalE, jalM; 
     wire jalW;
    wire BranchD;
    wire [2:0] PCSel;
    wire [31:0] PCInF;
    wire [31:0] JumpAddressD;
    wire [31:0] BranchAddressD;
    wire DisplayD, DisplayE, DisplayM, DisplayW;
    wire [1:0] BranchTypeE, BranchTypeM, BranchTypeW;
    wire hazardTypeD, hazardTypeE, hazardTypeM;
     wire Stall;
    wire [31:0] InstructionE, InstructionM;
     wire [31:0] InstructionW;
    wire  hazardTypeW;
    
    wire BranchE, BranchM;
    wire BranchW;
    output wire [31:0] V0, V1;

    wire [31:0] jumpaddr;
    wire predictF;
    wire predictD;
    wire [31:0] CurrPC;
     wire Flush;
    wire [31:0] PPCPlus4F;
    
    
    
    
    //(* MARK_DEBUG = "TRUE" *) output reg [31:0] PCPLUS4;
    
    //(* MARK_DEBUG = "TRUE" *) output wire [31:0] InstructioW;
    
    //Fetch Stage
    ProgramCounter PCCounter(PCInF, CurrPC, Reset, Clk, ~Stall);
    
    Jump_pred Jump_pred(InstructionD, jumpaddr, predictF);
    Mux32Bit2To1 Jump(PCOutF, CurrPC, jumpaddr, predictF);
    
    PCAdder PPCAdder(PCOutF, PPCPlus4F);
    PCAdder PCAdder(CurrPC, PCPlus4F);
    
    InstructionMemory InstructionMemory(PCOutF, InstructionF);
    Pipline_Fetch Pipline_Fetch(Clk, PCPlus4F, InstructionF, PCPlus4D, InstructionD,
     ~Stall, Flush, Reset, predictF, predictD);
    
    //Decode Stage
    Controller Controller(InstructionD[31:26], InstructionD[5:0], InstructionD[20:16], InstructionD,
      RegDst, MemReadD, MemToRegD, ALUOpD, MemWriteD, ALUSrcD, RegWriteD, BranchTypeD, jalD, DisplayD,
      hazardTypeD);
    
    Mux5Bit2To1 RegDstMux(WriteRegD1, InstructionD[20:16], InstructionD[15:11], RegDst);
    
    RegisterFile RegisterFile(InstructionD[25:21], InstructionD[20:16], WriteRegW, WriteDataW, 
    RegWriteW, Clk, ReadData1D, ReadData2D, V0, V1);
    
    
    SignExtension SignExtender(InstructionD[15:0], ImmExtD);
    
    Hazard_Detection_Unit Unit(InstructionE, InstructionM, InstructionD, InstructionW, 
    hazardTypeE, hazardTypeM, hazardTypeD, hazardTypeW, Stall, RegWriteE, RegWriteM, RegWriteW
    );

    //jump section
    BranchComparator BranchComparator(ALUOpD, ReadData1D, ReadData2D, BranchD, Stall);
    Should_Flush Should_Flush(Flush, BranchD, predictF);
    PCSelector PCSelector(PCSel, BranchTypeD, BranchD, predictD);
    
    
    JumpAddress JumpAddressCalc(InstructionD[27:0], PCPlus4D, JumpAddressD);
    BranchAdder BranchAdder(PCPlus4D, ImmExtD, BranchAddressD);
    MUX32Bit5To1 PCMux(PCInF, PCPlus4F, JumpAddressD, ReadData1D, BranchAddressD, PPCPlus4F+4, PCSel);
    
    
    
    Mux5Bit2To1 JALMuxRegister(WriteRegD, WriteRegD1, 5'd31, jalD);
    
    Pipline_Decode Pipline_Decode(Clk,
        MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD, InstructionD[27:26],
        ALUOpD, WriteRegD, ImmExtD, ReadData1D, ReadData2D, InstructionD[10:6], 
        MemReadE, MemToRegE, MemWriteE, ALUSrcE, RegWriteE, MemTypeE,
        ALUOpE, WriteRegE, ImmExtE, ReadData1E, ReadData2E, ShftAmtE,
        PCPlus4D, PCPlus4E, jalD, jalE, DisplayD, DisplayE, BranchTypeD, BranchTypeE,
        hazardTypeD, hazardTypeE, InstructionD, InstructionE, ~Stall, Reset, BranchD, BranchE);
        
    //Execute Stage
    Mux32Bit2To1 ALUSrcMux(ALUSrcValE, ReadData2E, ImmExtE, ALUSrcE);
     
    ALU_Controller ALU_Controller(ALUOpE, ImmExtE[5:0], ALUControlE);
    
    
     
    ALU32Bit ALU(ALUControlE, ReadData1E, ALUSrcValE, ShftAmtE, ALUResultE, Zero);
    
    
    Pipline_Execute Pipline_Execute(
        Clk, MemReadE, MemToRegE, MemWriteE, 
        RegWriteE, ALUResultE, ReadData2E, WriteRegE,
        MemReadM, MemtoRegM, MemWriteM, RegWriteM,
        ALUResultM, ReadData2M, WriteRegM,
        MemTypeE, MemTypeM, PCPlus4E, PCPlus4M,
        jalE, jalM, DisplayE, DisplayM, BranchTypeE, BranchTypeM,
        hazardTypeE, hazardTypeM, InstructionE, InstructionM, Reset, BranchE, BranchM);
    
    //Memory Stage
    DataMemory DataMemory(ALUResultM, ReadData2M, Clk, MemWriteM, MemReadM,
     MemReadDataM, MemTypeM, Reset);     
    
    Pipline_Memory Pipline_Memory(Clk, 
    MemtoRegM, RegWriteM, MemReadDataM, ALUResultM, WriteRegM,
    MemtoRegW, RegWriteW, MemReadDataW, ALUResultW, WriteRegW,
    PCPlus4M, PCPlus4W, jalM, jalW, DisplayM, DisplayW, BranchTypeM, BranchTypeW, Reset,
    hazardTypeM, hazardTypeW, InstructionM, InstructionW, BranchM, BranchW);

    //Writeback Stage
    Mux32Bit2To1 MemToRegMux(WriteDataW1, ALUResultW, MemReadDataW, MemtoRegW);
    Mux32Bit2To1 JALMuxData(WriteDataW, WriteDataW1, (PCPlus4W), jalW);
    
    
    
    //display output

    
    
    
    
    
    
    
endmodule
