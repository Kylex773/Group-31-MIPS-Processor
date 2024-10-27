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
Clk, Reset, PCOutF, InstructionD, WriteDataW, ALUResultE, ReadData1E,
ALUSrcValE, ImmExtD, ReadData1D, ReadData2D, ALUControlE, WriteRegW,
WriteRegD, WriteRegE, WriteRegM, ALUResultW, MemReadDataW
    );
    
    //Global Variables
    input Clk, Reset;
    wire [31:0] PCPlus4F; //PC Counter + 4
    wire [31:0] InstructionF; //Instuction 32 bit
    output wire [31:0] PCOutF; //PC Counter output
    wire [31:0] PCPlus4D;
    output wire [31:0] InstructionD;
    wire MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD, RegDst;
    wire [3:0] ALUOpD;
    output wire [4:0] WriteRegD;
    output wire [31:0] ImmExtD, ReadData1D, ReadData2D;
    wire MemReadE;
    wire MemToRegE;
    wire MemWrtieE;
    wire RegWriteE;
    output wire [31:0] ALUResultE;
    wire [31:0] ReadData2E;
    output wire [4:0] WriteRegE;
    output wire [31:0] ALUSrcValE;
    wire [31:0] ImmExtE;
    wire ALUSrcE;
    output wire [31:0] ReadData1E;
    wire [4:0] ShftAmtE;
    wire ZeroE;
    wire [3:0] ALUOpE;
    output wire [3:0] ALUControlE;
    wire MemtoRegM;
    wire RegWriteM;
    wire [31:0] MemReadDataM;
    wire [31:0] ALUResultM;
    wire [31:0] ReadData2M;
    wire MemtoRegW;
    wire RegWriteW;
    output wire [31:0] MemReadDataW;
    output wire [31:0] ALUResultW;
    output wire [4:0] WriteRegW, WriteRegM;
    output wire [31:0] WriteDataW;
    
    //Fetch Stage
    ProgramCounter PCCounter(PCPlus4F, PCOutF, Reset, Clk);
    PCAdder PCAdder(PCOutF, PCPlus4F);
    InstructionMemory InstructionMemory(PCOutF, InstructionF);
    Pipline_Fetch Pipline_Fetch(Clk, PCPlus4F, InstructionF, PCPlus4D, InstructionD);
    
    //Decode Stage
    Controller Controller(InstructionD[31:26], RegDst, MemReadD, MemToRegD, ALUOpD, MemWriteD, ALUSrcD, RegWriteD);
    
    Mux32Bit2To1 RegDstMux(WriteRegD, InstructionD[20:16], InstructionD[15:11], RegDst);
    
    RegisterFile RegisterFile(InstructionD[25:21], InstructionD[20:16], WriteRegW, WriteDataW, 
    RegWriteW, Clk, ReadData1D, ReadData2D);
    
    SignExtension SignExtender(InstructionD[15:0], ImmExtD);
    
    Pipline_Decode Pipline_Decode(Clk,
        MemReadD, MemToRegD, MemWriteD, ALUSrcD, RegWriteD,
        ALUOpD, WriteRegD, ImmExtD, ReadData1D, ReadData2D, InstructionD[10:6], 
        MemReadE, MemToRegE, MemWriteE, ALUSrcE, RegWriteE,
        ALUOpE, WriteRegE, ImmExtE, ReadData1E, ReadData2E, ShftAmtE);
        
    //Execute Stage
    Mux32Bit2To1 ALUSrcMux(ALUSrcValE, ReadData2E, ImmExtE, ALUSrcE);
     
    ALU_Controller ALU_Controller(ALUOpE, ImmExtE[5:0], ALUControlE);
     
    ALU32Bit ALU(ALUControlE, ReadData1E, ALUSrcValE, ShftAmtE, ALUResultE, Zero);
    
    Pipline_Execute Pipline_Executeipline_Execute(
        Clk, MemReadE, MemToRegE, MemWrtieE, 
        RegWriteE, ALUResultE, ReadData2E, WriteRegE,
        MemReadM, MemtoRegM, MemWriteM, RegWriteM,
        ALUResultM, ReadData2M, WriteRegM);
    
    //Memory Stage
    DataMemory DataMemory(ALUREsultM, ReadData2M, Clk, MemWriteM, MemReadM, MemReadDataM);     
    
    Pipline_Memory Pipline_Memory(Clk, 
    MemtoRegM, RegWriteM, MemReadDataM, ALUResultM, WriteRegM,
    MemtoRegW, RegWriteW, MemReadDataW, ALUResultW, WriteRegW);

    //Writeback Stage
    Mux32Bit2To1 MemToRegMux(WriteDataW, ALUResultW, MemReadDataW, MemtoRegW);
    
endmodule
