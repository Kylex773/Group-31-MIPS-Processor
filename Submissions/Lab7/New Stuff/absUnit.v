`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 08:07:04 PM
// Design Name: 
// Module Name: absUnit
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


module absUnit(valIn, valOut);

input [31:0] valIn; 
output reg [31:0] valOut;

always @(*)begin
if (valIn[31:31] == 1)
    valOut <= 0 - valIn;
else
    valOut <= valIn;
end



endmodule
