`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 10:21:03 PM
// Design Name: 
// Module Name: Writeback_sub_mod
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 10:21:03 PM
// Design Name: 
// Module Name: Writeback_sub_mod
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


module Writeback_sub_mod(ALUResultW, MemReadDataW, MemtoRegW, PCPlus4W, jalW, WriteDataW, A, B, Xa, 
    Ya, Xb, Yb, min, minX, minY);
    //MemToRegMux
    input [31:0] ALUResultW;
    input [31:0] MemReadDataW;
    input [31:0] MemtoRegW;
    wire [31:0] WriteDataW1;
    
    //JALMuxData
    input [31:0] PCPlus4W;
    input [31:0] jalW;
    output [31:0] WriteDataW;
    
    //MinComparator
    input [31:0] A;
    input [31:0] B;
    input [31:0] Xa;
    input [31:0] Ya;
    input [31:0] Xb;
    input [31:0] Yb;
    output wire [31:0] min;
    output wire [31:0] minX;
    output wire [31:0] minY;
    
    Mux32Bit2To1 MemToRegMux(WriteDataW1, ALUResultW, MemReadDataW, MemtoRegW);
    
    
    
    Mux32Bit2To1 JALMuxData(WriteDataW, WriteDataW1, (PCPlus4W), jalW);
    
    MinComparator MinComparator(A, B, Xa, Ya, Xb, Yb, min, minX, minY);
    
    
    
    
endmodule
