`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 06:52:26 PM
// Design Name: 
// Module Name: JumpAddress
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


module JumpAddress(JumpImm, PCPlus4, JumpAddress);

input [27:0] JumpImm;
input [31:0] PCPlus4;

output reg [31:0] JumpAddress;

always @(*)begin
JumpAddress[31:28] <= PCPlus4[31:28];
JumpAddress[27:0] <= (JumpImm <<< 2);
end
endmodule
