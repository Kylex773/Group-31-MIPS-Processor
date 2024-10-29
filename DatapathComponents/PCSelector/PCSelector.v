`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 02:50:48 PM
// Design Name: 
// Module Name: PCSelector
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


module PCSelector(out, controlinput, comparatorinput);
    output reg [1:0]out;
    input [1:0] controlinput;
    input comparatorinput;
    
    always @(*)begin
        if(comparatorinput == 0)
            out <= 0;
        else
            out <= controlinput;
            
    end
endmodule
