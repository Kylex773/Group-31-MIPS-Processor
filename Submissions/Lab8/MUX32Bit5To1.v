`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:32:27 AM
// Design Name: 
// Module Name: MUX32Bit5To1
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


module MUX32Bit5To1(out, in0, in1, in2, in3, in4, sel);

output reg [31:0] out;
    
    input [31:0] in0;
    input [31:0] in1;
    input [31:0] in2;
    input [31:0] in3;
    input [31:0] in4;
    input [2:0]sel;
    always @(sel or in0 or in1 or in2 or in3, in4)
        begin
            if(sel==1)
                out=in1;
            else if(sel==2)
                out=in2;
            else if(sel==3)
                out=in3;
            else if(sel==4)
                out=in4;
            else
                out=in0;
        end
endmodule
