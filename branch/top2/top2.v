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
// 
//////////////////////////////////////////////////////////////////////////////////


module top2(
Clk, Reset, PCDisplay, WriteDataDisplay
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
    wire [31:0] ImmExtD, ReadData1D; 
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
    wire [31:0] WriteDataW, WriteDataW1;
    wire MemWriteM;
    wire MemReadM;
    wire [1:0] MemTypeD, MemTypeE;
    wire [1:0] MemTypeM;
    wire [31:0] PCPlus4E, PCPlus4M, PCPlus4W;
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
    
    (* MARK_DEBUG = "TRUE" *) output reg [31:0] PCDisplay;
    (* MARK_DEBUG = "TRUE" *) output reg [31:0] WriteDataDisplay;
    
    //Fetch Stage
    ProgramCounter PCCounter(PCInF, PCOutF, Reset, Clk);
    PCAdder PCAdder(PCOutF, PCPlus4F);
    InstructionMemory InstructionMemory(PCOutF, InstructionF);
    Pipline_Fetch Pipline_Fetch(Clk, PCPlus4F, InstructionF, PCPlus4D, InstructionD);
    
    //Decode Stage
    Controller Controller(InstructionD[31:26], InstructionD[5:0], InstructionD[20:16], InstructionD,  RegDst, MemReadD, MemToRegD, ALUOpD, MemWriteD, ALUSrcD, RegWriteD, BranchTypeD, jalD, DisplayD);
    
    Mux32Bit2To1 RegDstMux(WriteRegD1, InstructionD[20:16], InstructionD[15:11], RegDst);
    
    RegisterFile RegisterFile(InstructionD[25:21], InstructionD[20:16], WriteRegW, WriteDataW, 
    RegWriteW, Clk, ReadData1D, ReadData2D);
    
    SignExtension SignExtender(InstructionD[15:0], ImmExtD);
    
    //jump section
    BranchComparator BranchComparator(ALUOpD, ReadData1D, ReadData2D, BranchD);
    PCSelector PCSelector(PCSel, BranchTypeD, BranchD);
    Mux32Bit4to1 PCMux(PCInF, PCPlus4F, JumpAddressD, ReadData1D, BranchAddressD, PCSel);
    
    JumpAddress JumpAddressCalc(InstructionD[25:0], PCPlus4D, JumpAddressD);
    BranchAdder BranchAdder(PCPlus4D, ImmExtD, BranchAddressD);
    
    
    Mux32Bit2To1 JALMuxRegister(WriteRegD, WriteRegD1, 31, jalD);
    
    Pipline_Decode Pipline_Decode(Clk,
        MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD, InstructionD[27:26],
        ALUOpD, WriteRegD, ImmExtD, ReadData1D, ReadData2D, InstructionD[10:6], 
        MemReadE, MemToRegE, MemWriteE, ALUSrcE, RegWriteE, MemTypeE,
        ALUOpE, WriteRegE, ImmExtE, ReadData1E, ReadData2E, ShftAmtE,
        PCPlus4D, PCPlus4E, jalD, jalE, DisplayD, DisplayE, BranchTypeD, BranchTypeE);
        
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
        jalE, jalM, DisplayE, DisplayM, BranchTypeE, BranchTypeM);
    
    //Memory Stage
    DataMemory DataMemory(ALUResultM, ReadData2M, Clk, MemWriteM, MemReadM, MemReadDataM, MemTypeM);     
    
    Pipline_Memory Pipline_Memory(Clk, 
    MemtoRegM, RegWriteM, MemReadDataM, ALUResultM, WriteRegM,
    MemtoRegW, RegWriteW, MemReadDataW, ALUResultW, WriteRegW,
    PCPlus4M, PCPlus4W, jalM, jalW, DisplayM, DisplayW, BranchTypeM, BranchTypeW);

    //Writeback Stage
    Mux32Bit2To1 MemToRegMux(WriteDataW1, ALUResultW, MemReadDataW, MemtoRegW);
    Mux32Bit2To1 JALMuxData(WriteDataW, WriteDataW1, (PCPlus4W + 4), jalW);
    
    
    
    //display output
    initial begin
    PCDisplay = 4;
    end
    
    
    always @(PCPlus4W or WriteDataW or DisplayD)
    begin
    if (DisplayW == 1) begin
    PCDisplay <= PCPlus4W - 4;
    WriteDataDisplay <= WriteDataW;
    end
    
    if ((BranchTypeW != 0) && (jalW == 0) ) begin
    WriteDataDisplay <= 0;
    end
    
    end 
    
    
    
endmodule
