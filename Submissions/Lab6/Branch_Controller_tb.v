`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 09:46:30 PM
// Design Name: 
// Module Name: Branch_Controller_tb
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


module Branch_Controller_tb();

    reg [3:0] Type;
    reg [31:0] A, B;
    
    wire CompResult;
    
    Branch_Controller u0(
        .Type(Type),
        .A(A),
        .B(B),
        .CompResult(CompResult)
    );
    
    initial begin
    
        Type = 4'b0011;//test greater than equal to zero
        A = 10;
        #25
        A = 0;
        #25
        A = -3;
        
        #50
        Type = 4'b0100;//test equal
        A = 10;
        B = 10;
        #25
        A = 11;
        B = 10;
        
        #50
        Type = 4'b0101;//test not equal
        A = 10;
        B = 11;
        #50
        A = 10;
        B = 10;
        
        #50
        Type = 4'b0110;//test greater than zero
        A = 10;
        #25
        A = 0;
        #25
        A = -3;
        
        #50
        Type = 4'b0111;//test less than or equal to zero
        A = 10;
        #25
        A = 0;
        #25
        A = -3;
        
        #50
        Type = 4'b1000;//test less than zero
        A = 10;
        #25
        A = 0;
        #25
        A = -3;
        
        #50
        Type = 4'b1001;//test jump
    end

endmodule
