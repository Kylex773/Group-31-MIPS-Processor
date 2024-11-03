`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 06:37:40 PM
// Design Name: 
// Module Name: BranchAdder_tb
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


module BranchAdder_tb();

    reg [31:0] PCPlus4;
    reg [31:0] ImmExt;
    
    wire [31:0] BranchPC;

    BranchAdder u0(
    .PCPlus4(PCPlus4),
    .ImmExt(ImmExt),
    .BranchPC(BranchPC)
    );

    initial begin
    PCPlus4 = 0;
    ImmExt = 4;
    #50
    PCPlus4 = 16;
    ImmExt = 2;
    end


endmodule
