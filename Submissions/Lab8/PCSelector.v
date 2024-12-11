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


module PCSelector(out, controlinput, comparatorinput, Predict);
    output reg [2:0]out;
    input [1:0] controlinput;
    input comparatorinput;
    input Predict;

    
    always @(*)begin
        if(comparatorinput == 0)
            out <= 0;
        else if (comparatorinput == 1 && Predict == 1)
            out <= 4; 
        else if (comparatorinput == 1 && Predict == 0)
            out <= controlinput; 
        else
            out <= 0;
    end
    
endmodule
