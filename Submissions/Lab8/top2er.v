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

////  Overall percent effort of each team meber: 
//  Patrick - 33.3%, Kyle - 33.3%, Aiden - 33.3%



module top2er(Reset, Clk, out7, en_out);

input Reset, Clk;
output wire [6:0] out7; //seg a, b, ... g
output wire [7:0] en_out;
wire ClkOut;

wire [31:0] V0, V1;


//ClkDiv ClkDiv(ClkOut, Reset, ClkOut);
top2 top2(Clk, Reset, V0, V1);

Two4DigitDisplay Two4DigitDisplay(Clk, V1[15:0], V0[15:0], out7, en_out);




endmodule
