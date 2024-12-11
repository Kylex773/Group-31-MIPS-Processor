`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 11:37:36 PM
// Design Name: 
// Module Name: Should_Flush
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


module Should_Flush(Flush, Branch, Predict);
    input Branch, Predict;
    output reg Flush;
    
    always@(*) begin
        if(Branch == 1 && Predict == 1)begin
            Flush <= 0;
        end
        
        else if(Branch == 1 && Predict == 0) begin
            Flush <= 1;
        end
        
        else if(Branch == 0 && Predict == 1) begin
            Flush <= 1;
        end
        
        else //if(Branch == 0 && Predict == 0) begin
        begin
            Flush <= 0;
        end

    end
endmodule
