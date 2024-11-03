`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1 
// Module - PCAdder_tb.v
// Description - Test the 'PCAdder.v' module.
////////////////////////////////////////////////////////////////////////////////

module PCAdder_tb();

    reg [31:0] PCResult;

    wire [31:0] PCAddResult;

    PCAdder u0(
       PCResult, 
        PCAddResult
    );

	initial begin
	
    /* Please fill in the implementation here... */
    PCResult <= 5;
    #10;
    
    end

endmodule
    /*module Adder_12bits_tb();
reg [11:0] A, B;
reg Cin;
wire [11:0] S;
wire Co;
Adder_12bits Adder_12bits_tb(A, B, Cin, S, Co);
initial begin
A <= 3107; B <= 180; Cin <= 0;
#50;

A <= 3107; B <= 180; Cin <= 1;
#50;

A <= 35; B <= 180; Cin <= 1;
#50;

A <= 4095; B <= 0; Cin <= 1;
#50;

A <= 4095; B <= 15; Cin <= 0;
#50;

end
endmodule*/
	


