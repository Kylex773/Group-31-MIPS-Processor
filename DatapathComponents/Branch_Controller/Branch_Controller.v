`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 03:00:10 PM
// Design Name: 
// Module Name: Branch_Controller
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


module Branch_Controller(Type, A, B, CompResult);
    input [3:0] Type;
    output reg CompResult;
    
    input [31:0] A, B;
    
    always@(*)begin
        case(Type)
            4'b0011://greater than or equal to zero
                if((A[31:31] == 1))
                    CompResult <= 0;
                else
                    CompResult <= (A >= 0);
                    
            4'b0100://equal to
                CompResult <= (A == B);
                    
            4'b0101://not equal to
                CompResult <= (A != B);
            
            4'b0110://greater than zero
                if(A[31:31] == 1)
                    CompResult <= 0;
                else
                    CompResult <= (A > 0);
                    
            4'b0111://less than or equal to zero
                if(A[31:31] == 1)
                    CompResult <= 1;
                else
                    CompResult <= (A <= 0);
            
            4'b1000://less than zero
                if(A[31:31] == 1)
                    CompResult <= 1;
                else
                    CompResult <= (A < 0);
                    
            4'b1001://jump
                CompResult <= 0;
        endcase
    end    
                
endmodule
