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


module SAD2_sub_mod(V1, V2, V3, V4, V5, V5, V6, V7, V8, V9,
V10, V11, V12, V13, V14, V15, V16,
x, y, SADValue, instructionSAD2, xnew, ynew);

input [31:0] V1;
input [31:0] V2;
input [31:0] V3;
input [31:0] V4;
input [31:0] V5;
input [31:0] V6;
input [31:0] V7;
input [31:0] V8;
input [31:0] V9;
input [31:0] V10;
input [31:0] V11;
input [31:0] V12;
input [31:0] V13;
input [31:0] V14;
input [31:0] V15;
input [31:0] V16;


input [31:0] x, y;
input [31:0] instructionSAD2;

output wire [31:0] SADValue, xnew, ynew;

Giant_Adder Giant_Adder(SADValue, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13,
V14, V15, V16);

xyUpdate xyUpdate(x, y, instructionSAD2, xnew, ynew);


endmodule
