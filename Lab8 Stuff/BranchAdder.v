`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 06:34:49 PM
// Design Name: 
// Module Name: BranchAdder
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


module BranchAdder(PCPlus4, ImmExt, BranchPC);
    
    input [31:0] PCPlus4;
    input [31:0] ImmExt;
    
    output reg [31:0] BranchPC;
    
    always @(*)
    begin
    BranchPC <= (PCPlus4) + (ImmExt * 4);
    end
    
    
endmodule
