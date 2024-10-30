`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 01:49:38 PM
// Design Name: 
// Module Name: Top
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


module Top(Reset, Clk, out7, en_out);
    
    input Reset, Clk;
    output [6:0] out7; //seg a, b, ... g
    output [7:0] en_out;
    wire ClkOut;
    wire [31:0] Instruction;
    wire [31:0] PCResult;
    
    
    //ClkDiv(Clk, Rst, ClkOut);
    ClkDiv ClkDiv(Clk, 0, ClkOut);
    //InstructionFetchUnit(Instruction, PCResult, Reset, Clk);
    InstructionFetchUnit InstructionFetchUnit(Instruction, PCResult, Reset, ClkOut);
    //Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
    Two4DigitDisplay Two4DigitDisplay(Clk, Instruction[15:0], PCResult[15:0], out7, en_out);

    
endmodule
