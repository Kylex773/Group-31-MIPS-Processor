`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 07:13:25 PM
// Design Name: 
// Module Name: forwardingUnit
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


module forwardingUnit(instructionW, instructionM, instructionSAD2, MFSel);

input [31:0] instructionW, instructionM, instructionSAD2;
output reg [1:0] MFSel; 

always @(*) begin
if(instructionW == 001111 && instructionM == 111111)
MFSel <= 3; //WB to M forwarding
else if(instructionSAD2 == 101111 && instructionM == 111111)
MFSel <= 2; //SAD2 to M forwarding
else if(instructionW != 001111 && instructionM == 111111)
MFSel <= 1; //SAD1 to M forwarding
else
MFSel <= 0; //no forwarding
end





endmodule
