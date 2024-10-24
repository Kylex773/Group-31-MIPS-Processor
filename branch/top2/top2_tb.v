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

wire [31:0] PCOutF, InstructionD, WriteDataW;

top2 u0(
.Clk(Clk), .Reset(Reset), .PCOutF(PCOutF), 
.InstructionD(InstructionD), 
.WriteDataW(WriteDataW)
);


  initial begin
		Clk <= 1'b0;
		forever #200 Clk <= ~Clk;
	end
    
    initial begin 
    Reset <=1;
    #400;
    Reset <=0;
    end

endmodule
