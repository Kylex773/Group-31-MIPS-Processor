`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 12:08:12 PM
// Design Name: 
// Module Name: XY_tb
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


module XY_tb();

reg clk, reset;
reg [31:0] S7, J;


wire [31:0] x, y;

XYStateMachine u0(
.clk(clk),
.reset(reset),
.S7(S7),
.x(x),
.y(y),
.J(J)
);


initial begin
		clk <= 1'b0;
		forever #200 clk <= ~clk;
	end
    
    initial begin 
    reset <=1;
    S7 <= 76;
    J <= 4;
    #250;
    reset <=0;;
    end
    
endmodule
