`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 02:09:19 PM
// Design Name: 
// Module Name: Mux32Bit4to1_tb
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


module Mux32Bit4to1_tb();


	reg	[31:0] in0;
	reg	[31:0] in1;
	reg	[31:0] in2;
	reg	[31:0] in3;
	reg	[1:0]sel;
    
	wire [31:0]	out;

	Mux32Bit4to1 Mux32Bit4to1(
        .out(out), 
        .in0(in0), 
        .in1(in1),
        .in2(in2), 
        .in3(in3), 
        .sel(sel)
    );
        
	initial begin

        #100 in0 <= 32'h00000000; in1 <= 32'h00000001; in2 <= 32'h00000002; in3 <= 32'h00000003; sel <= 2'b00;
        
        #100 in0 <= 32'h00000000; in1 <= 32'h00000001; in2 <= 32'h00000002; in3 <= 32'h00000003; sel <= 2'b01;

        #100 in0 <= 32'h00000000; in1 <= 32'h00000001; in2 <= 32'h00000002; in3 <= 32'h00000003; sel <= 2'b10;

        #100 in0 <= 32'h00000000; in1 <= 32'h00000001; in2 <= 32'h00000002; in3 <= 32'h00000003; sel <= 2'b11;

        #100 in0 <= 32'hF0000000; in1 <= 32'hF0000001; in2 <= 32'hF0000002; in3 <= 32'hF0000003; sel <= 2'b00;

        #100 in0 <= 32'hF0000000; in1 <= 32'hF0000001; in2 <= 32'hF0000002; in3 <= 32'hF0000003; sel <= 2'b01;

        #100 in0 <= 32'hF0000000; in1 <= 32'hF0000001; in2 <= 32'hF0000002; in3 <= 32'hF0000003; sel <= 2'b10;

        #100 in0 <= 32'hF0000000; in1 <= 32'hF0000001; in2 <= 32'hF0000002; in3 <= 32'hF0000003; sel <= 2'b11;

        
	end

endmodule

