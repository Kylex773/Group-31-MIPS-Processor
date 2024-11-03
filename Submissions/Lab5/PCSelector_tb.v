`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 02:57:16 PM
// Design Name: 
// Module Name: PCSelector_tb
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


module PCSelector_tb();
    wire [1:0]out;
    reg [1:0] controlinput;
    reg comparatorinput;
    
    PCSelector PCSelector(
        .out(out),
        .controlinput(controlinput),
        .comparatorinput(comparatorinput)
    );
    
    initial begin

    #100
    controlinput <= 0;
    comparatorinput <= 0;
    
    #100
    controlinput <= 1;
    comparatorinput <= 0;
    
    #100
    controlinput <= 2;
    comparatorinput <= 0;
    
    #100
    controlinput <= 3;
    comparatorinput <= 0;
    
    #100
    controlinput <= 0;
    comparatorinput <= 1;
    
    #100
    controlinput <= 1;
    comparatorinput <= 1;
    
    #100
    controlinput <= 2;
    comparatorinput <= 1;
    
    #100
    controlinput <= 3;
    comparatorinput <= 1;
    
    
    end
endmodule
