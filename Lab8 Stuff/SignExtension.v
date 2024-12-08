`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(in, out);

    /* A 16-Bit input word */
    input [15:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    //wire [31:0] zero = 32'b00000000000000000000000000000000;
    always@(*) begin
    out[31:0] <= { {16{in[15]}}, in[15:0] };
    
    end
    
    
    /* Fill in the implementation here ... */

endmodule
