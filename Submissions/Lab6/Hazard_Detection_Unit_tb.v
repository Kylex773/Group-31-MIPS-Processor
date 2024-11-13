`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 09:11:12 AM
// Design Name: 
// Module Name: Hazard_Detection_Unit_tb
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


module Hazard_Detection_Unit_tb();
reg [31:0] Exei, Memi, Deci;
reg exeh, memh, dech;
wire [1:0]count;

Hazard_Detection_Unit Hazard_Detection_Unit(
    .Exei(Exei), 
    .Memi(Memi), 
    .Deci(Deci), 
    .exeh(exeh), 
    .memh(memh), 
    .dech(dech), 
    .count(count)
);

initial begin
    
    Exei = 32'b00000000000000000010000000000000;
    Memi = 32'b00000000000000000000000000000000;
    Deci = 32'b00000000100000000000000000000000;
    exeh = 0;
    memh = 0;
    dech = 0;
    
    
    #100
    Exei = 32'b00000000000001000000000000000000;
    Memi = 32'b00000000000000000010000000000000;
    Deci = 32'b0000000010000000000000000000000;
    exeh = 0;
    memh = 0;
    dech = 1;
    
    #100
    Exei = 32'b00000000000001001111100000000000;
    Memi = 32'b00000000000111110010000000000000;
    Deci = 32'b0000000010000000000000000000000;
    exeh = 0;
    memh = 1;
    dech = 0;
    
    #100
    Exei = 32'b00000000000000000010000000000000;
    Memi = 32'b00000000000000000000000000000000;
    Deci = 32'b0000000010000000000000000000000;;
    exeh = 0;
    memh = 0;
    dech = 0;



end

endmodule
