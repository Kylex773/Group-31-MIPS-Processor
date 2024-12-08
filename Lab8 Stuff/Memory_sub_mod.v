`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 10:13:49 PM
// Design Name: 
// Module Name: Memory_sub_mod
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


module Memory_sub_mod(ALUResultM, ReadData2M, Clk, MemWriteM, MemReadM, MemTypeM, Reset, MemReadDataM);
    
    input [31:0] ALUResultM; 	
    input [31:0] ReadData2M; 
    input Clk;
    input MemWriteM; 		 
    input MemReadM; 			
    input [1:0] MemTypeM;
    input Reset;
    output wire [31:0] MemReadDataM;
    
    DataMemory DataMemory(ALUResultM, ReadData2M, Clk, MemWriteM, MemReadM,
     MemReadDataM, MemTypeM, Reset);
    
endmodule
