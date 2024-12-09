`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 08:13:08 PM
// Design Name: 
// Module Name: SAD1_sub_mod
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


module SAD1_sub_mod(vector1, vector2, vector4);

    input [31:0] vector1 [0:15];
    
    input [31:0] vector2 [0:15];
    
    wire [31:0] vector3 [0:15];
    
    output reg [31:0] vector4 [0:15];
    
    
    Subtractor subtractor0(vector3[0], vector1[0], vector2[0]);
    absUnit absUnit0(vector3[0], vector4[0]);
    Subtractor subtractor1(vector3[1], vector1[1], vector2[1]);
    absUnit absUnit1(vector3[1], vector4[1]);
    Subtractor subtractor2(vector3[2], vector1[2], vector2[2]);
    absUnit absUnit2(vector3[2], vector4[2]);
    Subtractor subtractor3(vector3[3], vector1[3], vector2[3]);
    absUnit absUnit3(vector3[3], vector4[3]);
    Subtractor subtractor4(vector3[4], vector1[4], vector2[4]);
    absUnit absUnit4(vector3[4], vector4[4]);
    Subtractor subtractor5(vector3[5], vector1[5], vector2[5]);
    absUnit absUnit5(vector3[5], vector4[5]);
    Subtractor subtractor6(vector3[6], vector1[6], vector2[6]);
    absUnit absUnit6(vector3[6], vector4[6]);
    Subtractor subtractor7(vector3[7], vector1[7], vector2[7]);
    absUnit absUnit7(vector3[7], vector4[7]);
    Subtractor subtractor8(vector3[8], vector1[8], vector2[8]);
    absUnit absUnit8(vector3[8], vector4[8]);
    Subtractor subtractor9(vector3[9], vector1[9], vector2[9]);
    absUnit absUnit9(vector3[9], vector4[9]);
    Subtractor subtractor10(vector3[10], vector1[10], vector2[10]);
    absUnit absUnit10(vector3[10], vector4[10]);
    Subtractor subtractor11(vector3[11], vector1[11], vector2[11]);
    absUnit absUnit11(vector3[11], vector4[11]);
    Subtractor subtractor12(vector3[12], vector1[12], vector2[12]);
    absUnit absUnit12(vector3[12], vector4[12]);
    Subtractor subtractor13(vector3[13], vector1[13], vector2[13]);
    absUnit absUnit13(vector3[13], vector4[13]);
    Subtractor subtractor14(vector3[14], vector1[14], vector2[14]);
    absUnit absUnit14(vector3[14], vector4[14]);
    Subtractor subtractor15(vector3[15], vector1[15], vector2[15]);
    absUnit absUnit15(vector3[15], vector4[15]);
    
    
    
endmodule
