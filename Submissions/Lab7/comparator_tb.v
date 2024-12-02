`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 04:00:00 PM
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb();

reg [3:0] BranchType;
reg [31:0] A, B;

wire Branch;

BranchComparator u0(
.BranchType(BranchType),
.A(A),
.B(B),
.Branch(Branch)
);

initial begin
BranchType <= 4'b0011; //bgez
A <= 47;
B <= 47;
#50
A <= -9;
#50
BranchType <= 4'b0100; //beq
#50
A <= -9;
#50
B <= -9;
#50
BranchType <= 4'b0101; //bne
#50
B <= 16;
#50
BranchType <= 4'b0110; ///bgtz
#50
A <= 12;
#50
BranchType <= 4'b0111; //blez
#50
A <= -2;
#50
BranchType <= 4'b1000; //bltz
#50
A <= 101;
#50
BranchType <= 4'b1001; //jump type
end
endmodule
