`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 12:40:27 PM
// Design Name: 
// Module Name: Fetch_sub_mod
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


module Fetch_sub_mod(
Clk, Reset, Stall, PCPlus4F, InstructionF, PCInF
);

    input Clk, Reset, Stall;
    input [31:0] PCInF;
    output wire [31:0] PCPlus4F, InstructionF;
    
    wire [31:0] PCOutF;
    
     


    ProgramCounter PCCounter(PCInF, PCOutF, Reset, Clk, ~Stall);
    PCAdder PCAdder(PCOutF, PCPlus4F);
    InstructionMemory InstructionMemory(PCOutF, InstructionF);

endmodule
