`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 03:42:07 PM
// Design Name: 
// Module Name: BranchComparator
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


module BranchComparator(BranchType, A, B, Branch);

input [3:0] BranchType;
input [31:0] A, B;
output reg Branch;

always @(*)
begin
case(BranchType)
4'b0011: begin//bgez  wierd behavior but working working
 if (A[31] == 0)
    Branch <= 1;
 else
    Branch <= 0;
 end
4'b0100: begin//beq  Working
 if (A == B)
    Branch <= 1;
 else
    Branch <= 0;
 end
4'b0101: begin //bne  working
 if (A != B)
    Branch <= 1;
 else
    Branch <= 0;
 end
4'b0110:  begin //bgtz  working
 if ((A[31] != 1) && (A != 0))
    Branch <= 1;
 else
    Branch <= 0;
 end
4'b0111: begin //blez   working
 if ((A[31] == 1) || (A == 0))
    Branch <= 1;
 else
    Branch <= 0;
 end
4'b1000: begin//bltz  working
 if (A[31] == 1)
    Branch <= 1;
 else
    Branch <= 0;
 end
 4'b1001: Branch <= 1;
default: Branch <= 0;
endcase
end
endmodule
