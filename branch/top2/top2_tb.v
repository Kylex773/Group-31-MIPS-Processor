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
//  Overall percent effort of each team meber: 
//  Patrick - 33.3%, Kyle - 33.3%, Aiden - 33.3%
//////////////////////////////////////////////////////////////////////////////////


module top2_tb();

reg Clk, Reset;

wire [31:0] PCDisplay, WriteDataDisplay;

/*wire [31:0] PCOutF, InstructionD, WriteDataW, ALUResultE, ReadData1E, ALUSrcValE, ImmExtD, ReadData1D, ReadData2D, MemReadDataM, ReadData2M;

wire [3:0] ALUControlE;
wire [4:0] WriteRegW, WriteRegD, WriteRegE, WriteRegM;
wire [31:0] ALUResultW, MemReadDataW, ALUResultM;
wire MemReadM;
wire [1:0] MemTypeM;*/



top2 u0(
.Clk(Clk), 
.Reset(Reset),
.PCDisplay(PCDisplay),
.WriteDataDisplay(WriteDataDisplay)
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
