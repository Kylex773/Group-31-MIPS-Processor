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


module SAD1_sub_mod(V1_1, V2_1, V3_1, V4_1, V5_1, V6_1, V7_1, V8_1, V9_1, V10_1, V11_1, V12_1, V13_1, V14_1, V15_1, V16_1,
    V1_2, V2_2, V3_2, V4_2, V5_2, V6_2, V7_2, V8_2, V9_2, V10_2, V11_2, V12_2, V13_2, V14_2, V15_2, V16_2,
    V1_4, V2_4, V3_4, V4_4, V5_4, V6_4, V7_4, V8_4, V9_4, V10_4, V11_4, V12_4, V13_4, V14_4, V15_4, V16_4);

    input [31:0] V1_1, V2_1, V3_1, V4_1, V5_1, V6_1, V7_1, V8_1, V9_1, V10_1, V11_1, V12_1, V13_1, V14_1, V15_1, V16_1;
    
    input [31:0] V1_2, V2_2, V3_2, V4_2, V5_2, V6_2, V7_2, V8_2, V9_2, V10_2, V11_2, V12_2, V13_2, V14_2, V15_2, V16_2;
    
    wire [31:0] V1_3, V2_3, V3_3, V4_3, V5_3, V6_3, V7_3, V8_3, V9_3, V10_3, V11_3, V12_3, V13_3, V14_3, V15_3, V16_3;
    
    output wire [31:0] V1_4, V2_4, V3_4, V4_4, V5_4, V6_4, V7_4, V8_4, V9_4, V10_4, V11_4, V12_4, V13_4, V14_4, V15_4, V16_4;
    
    
    Subtractor subtractor1(V1_3, V1_1, V1_2);
    absUnit absUnit1(V1_3, V1_4);
    Subtractor subtractor2(V2_3, V2_1, V2_2);
    absUnit absUnit2(V2_3, V2_4);
    Subtractor subtractor3(V3_3, V3_1, V3_2);
    absUnit absUnit3(V3_3, V3_4);
    Subtractor subtractor4(V4_3, V4_1, V4_2);
    absUnit absUnit4(V4_3, V4_4);
    Subtractor subtractor5(V5_3, V5_1, V5_2);
    absUnit absUnit5(V5_3, V5_4);
    Subtractor subtractor6(V6_3, V6_1, V6_2);
    absUnit absUnit6(V6_3, V6_4);
    Subtractor subtractor7(V7_3, V7_1, V7_2);
    absUnit absUnit7(V7_3, V7_4);
    Subtractor subtractor8(V8_3, V8_1, V8_2);
    absUnit absUnit8(V8_3, V8_4);
    Subtractor subtractor9(V9_3, V9_1, V9_2);
    absUnit absUnit9(V9_3, V9_4);
    Subtractor subtractor10(V10_3, V10_1, V10_2);
    absUnit absUnit10(V10_3, V10_4);
    Subtractor subtractor11(V11_3, V11_1, V11_2);
    absUnit absUnit11(V11_3, V11_4);
    Subtractor subtractor12(V12_3, V12_1, V12_2);
    absUnit absUnit12(V12_3, V12_4);
    Subtractor subtractor13(V13_3, V13_1, V13_2);
    absUnit absUnit13(V13_3, V13_4);
    Subtractor subtractor14(V14_3, V14_1, V14_2);
    absUnit absUnit14(V14_3, V14_4);
    Subtractor subtractor15(V15_3, V15_1, V15_2);
    absUnit absUnit15(V15_3, V15_4);
    Subtractor subtractor16(V16_3, V16_1, V16_2);
   absUnit absUnit16(V16_3, V16_4);
    
    
    
endmodule
