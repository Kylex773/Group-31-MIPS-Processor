`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 06:59:30 PM
// Design Name: 
// Module Name: JumpAddress_tb
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


module JumpAddress_tb();

reg [27:0] JumpImm;
reg [31:0] PCPlus4;

wire [31:0] JumpAddress;

JumpAddress u0(
.JumpImm(JumpImm),
.PCPlus4(PCPlus4),
.JumpAddress(JumpAddress)
);

initial begin
JumpImm = 3;
PCPlus4 = 0;
#50
JumpImm = 2;
PCPlus4 = 60;

end

endmodule
