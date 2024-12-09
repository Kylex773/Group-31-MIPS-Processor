`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 09:15:58 PM
// Design Name: 
// Module Name: SAD2_sub_mod
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


module SAD2_sub_mod(vector4SAD2, x, y, SADValue, instructionSAD2, xnew, ynew);

input [31:0] vector4SAD2 [0:15];
input [31:0] x, y;
input [31:0] instructionSAD2;

output reg [31:0] SADValue, xnew, ynew;

Giant_Adder Giant_Adder(SADValue, vector4SAD2[0], vector4SAD2[1], vector4SAD2[2],
 vector4SAD2[3], vector4SAD2[4], vector4SAD2[5],
 vector4SAD2[6], vector4SAD2[7], vector4SAD2[8], vector4SAD2[9],
 vector4SAD2[10], vector4SAD2[11], vector4SAD2[12],
 vector4SAD2[13], vector4SAD2[14], vector4SAD2[15]);

xyUpdate xyUpdate(x, y, instructionSAD2, xnew, ynew);


endmodule
