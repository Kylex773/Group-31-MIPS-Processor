`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 08:55:08 PM
// Design Name: 
// Module Name: MinComparator
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


module MinComparator(A, B, Xa, Ya, Xb, Yb, min, minX, minY);
    input [31:0] A, B;
    input [31:0] Xa, Ya, Xb, Yb;
    
    output reg [31:0] min;
    output reg [31:0] minX, minY;
    
    always @(*)begin
        if(A < B)begin
            min <= A;
            minX <= Xa;
            minY <= Ya;
        end
        else begin
            min <= B;
            minX <= Xb;
            minY <= Yb;
        end
    end
endmodule
