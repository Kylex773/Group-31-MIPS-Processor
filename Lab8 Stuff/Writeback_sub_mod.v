`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 10:21:03 PM
// Design Name: 
// Module Name: Writeback_sub_mod
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


module Writeback_sub_mod(ALUResultW, MemReadDataW, MemtoRegW, PCPlus4W, jalW, WriteDataW);
    //MemToRegMux
    input [31:0] ALUResultW;
    input [31:0] MemReadDataW;
    input [31:0] MemtoRegW;
    wire [31:0] WriteDataW1;
    
    //JALMuxData
    input [31:0] PCPlus4W;
    input [31:0] jalW;
    output [31:0] WriteDataW;
    
    Mux32Bit2To1 MemToRegMux(WriteDataW1, ALUResultW, MemReadDataW, MemtoRegW);
    
    Mux32Bit2To1 JALMuxData(WriteDataW, WriteDataW1, (PCPlus4W), jalW);
    
    
    
endmodule
