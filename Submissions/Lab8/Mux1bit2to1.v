`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 11:35:06 PM
// Design Name: 
// Module Name: Mux1bit2to1
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


module Mux1Bit2To1(out, inA, inB, sel);

    output reg  out;
    
    input  inA;
    input  inB;
    input sel;
    always @(sel or inA or inB)
        begin
            if(sel==0)
                out=inA;
            else
                out=inB;
        end

endmodule

