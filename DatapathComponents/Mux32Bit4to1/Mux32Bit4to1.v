`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 02:05:22 PM
// Design Name: 
// Module Name: Mux32Bit4to1
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


module Mux32Bit4to1(out, in0, in1, in2, in3, sel);


    output reg [31:0] out;
    
    input [31:0] in0;
    input [31:0] in1;
    input [31:0] in2;
    input [31:0] in3;
    input [1:0]sel;
    always @(sel or in0 or in1 or in2, in3)
        begin
            if(sel==0)
                out=in0;
            if(sel==1)
                out=in1;
            if(sel==2)
                out=in2;
            if(sel==3)
                out=in3;
        end

endmodule
