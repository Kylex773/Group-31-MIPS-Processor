`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2024 10:42:28 PM
// Design Name: 
// Module Name: topTB
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


module topTB();
reg Clk, Reset;

wire [31:0] PCOut, Instruction, RegWriteData, ALUResult, RegReadData2;

top u0(
    .Clk(Clk),
    .Reset(Reset),
    .PCOut(PCOut),
    .Instruction(Instruction),
    .RegWriteData(RegWriteData),
    .ALUResult(ALUResult),
    .RegReadData2(RegReadData2)
    );
    
    initial begin
		Clk <= 1'b0;
		forever #100 Clk <= ~Clk;
	end
    
    initial begin 
    Reset <=1;
    #200;
    Reset <=0;
    end

endmodule
