`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2024 02:33:37 PM
// Design Name: 
// Module Name: top2_tb
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


module top2_tb();

reg Clk, Reset;

wire [31:0] PCOutF, InstructionD, WriteDataW, ALUResultE, ReadData1E, ALUSrcValE, ImmExtD, ReadData1D, ReadData2D, MemReadDataM, ReadData2M;

wire [3:0] ALUControlE;
wire [4:0] WriteRegW, WriteRegD, WriteRegE, WriteRegM;
wire [31:0] ALUResultW, MemReadDataW, ALUResultM;
wire MemReadM;
wire [1:0] MemTypeM;

top2 u0(
.Clk(Clk), .Reset(Reset), .PCOutF(PCOutF), 
.InstructionD(InstructionD), 
.WriteDataW(WriteDataW),
.ALUResultE(ALUResultE),
.ReadData1E(ReadData1E),
.ALUSrcValE(ALUSrcValE),
.ImmExtD(ImmExtD), 
.ReadData1D(ReadData1D), 
.ReadData2D(ReadData2D),
.ALUControlE(ALUControlE),
.WriteRegW(WriteRegW),
.WriteRegD(WriteRegD),
.WriteRegE(WriteRegE),
.WriteRegM(WriteRegM),
.ALUResultW(ALUResultW),
.MemReadDataW(MemReadDataW),
.MemReadDataM(MemReadDataM),
.ReadData2M(ReadData2M),
.MemReadM(MemReadM),
.ALUResultM(ALUResultM),
.MemTypeM(MemTypeM)
);


  initial begin
		Clk <= 1'b0;
		forever #200 Clk <= ~Clk;
	end
    
    initial begin 
    Reset <=1;
    #250;
    Reset <=0;
    end

endmodule
