`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 02:02:34 PM
// Design Name: 
// Module Name: Pipline_Fetch
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


module Pipline_Fetch(Clk, PCPlus4F, InstructionF, PCPlus4D, InstructionD, Fetch_Enable);
    input Clk;
    input [31:0] PCPlus4F;
    input [31:0] InstructionF;
    input Fetch_Enable;
    output reg [31:0] PCPlus4D;
    output reg [31:0] InstructionD;
    
    always @(posedge Clk) begin
        if (Fetch_Enable) begin
        PCPlus4D <= PCPlus4F;
        InstructionD <= InstructionF;
        end
    end

endmodule
