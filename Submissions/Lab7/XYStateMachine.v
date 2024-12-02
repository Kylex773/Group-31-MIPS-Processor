`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 11:45:17 AM
// Design Name: 
// Module Name: XYStateMachine
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


module XYStateMachine(clk, reset, S7, J, x, y, display);
input clk, reset;
input [31:0] S7, J;

reg [1:0] State, nextState;
reg [31:0] address;

output reg [31:0] x, y;
output reg display;

always @(posedge clk) begin
if(reset) begin
State <= 2'b00;
end
else begin
State <= nextState;
end
end

always @(State) begin
case(State)
2'b00: begin
address <= (S7-16)/4;
x <= 0;
y <= 0;
display <= 0;
nextState <= 2'b01;
end
2'b01: begin
if(address[31:31] == 0 && address != 0)
nextState <= 2'b10;
else if (address[31:31] == 1 || address == 0)
nextState <= 2'b11;
end 
2'b10: begin
address <= address - J;
y = y + 1;
nextState <= 2'b01;
end
2'b11: begin
address = address + J;
x = address;
y = y + 1;
display <= 1;
nextState <= 2'b00;
end
endcase
end

endmodule
