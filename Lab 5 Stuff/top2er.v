`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2024 02:03:59 PM
// Design Name: 
// Module Name: top2er
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


module top2er(Reset, Clk, out7, en_out);

input Reset, Clk;
output [6:0] out7; //seg a, b, ... g
output [7:0] en_out;
wire ClkOut;
wire [31:0] PCDisplay, WriteDataDisplay;

ClkDiv ClkDiv(Clk, Rst, ClkOut);
top2 top2(
ClkOut, Reset, PCDisplay, WriteDataDisplay
);
Two4DigitDisplay Two4DigitDisplay(ClkOut, PCDisplay, WriteDataDisplay, out7, en_out);

endmodule
