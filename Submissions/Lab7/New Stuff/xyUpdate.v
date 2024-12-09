`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 08:55:52 PM
// Design Name: 
// Module Name: xyUpdate
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


module xyUpdate(x, y, instructionSAD2, xnew, ynew);

input [31:0] x, y;
input [31:0] instructionSAD2;

output reg [31:0] xnew, ynew;

always @(*) begin
if(instructionSAD2 == 6'b001111) begin
xnew <= 0;
ynew <= y + 1;
end 
else if(instructionSAD2 == 6'b111111) begin
xnew <= x + 1;
ynew <= y;
end
else begin
xnew <= x;
ynew <= y;
end

end

endmodule
