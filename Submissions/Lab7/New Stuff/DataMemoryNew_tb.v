`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 07:51:34 PM
// Design Name: 
// Module Name: DataMemoryNew_tb
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


module DataMemoryNew_tb();

    reg [31:0] Address;
    reg [31:0] WriteData;
    reg Clk;
    reg MemWrite;
    reg MemRead;
    reg [31:0] ReadData;
    reg Reset;
    reg Init;
    reg SAD;
    
    wire [31:0] ReadData;
    wire [31:0] V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16;
    
    DataMemoryNew u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData),
        .Reset(Reset),
        .Init(Init),
        .SAD(SAD),
        .V1(V1),
        .V2(V2),
        .V3(V3),
        .V4(V4),
        .V5(V5),
        .V6(V6),
        .V7(V7),
        .V8(V8),
        .V9(V9),
        .V10(V10),
        .V11(V11),
        .V12(V12),
        .V13(V13),
        .V14(V14),
        .V15(V15),
        .V16(V16)
    );
    
    initial begin
        Clk <= 1'b0;
        forever #20 Clk <= ~Clk;
    end
    
    initial begin
        Init = 1;
        SAD = 0;
        MemRead = 0;
        MemWrite = 0;
        
        #40
        Init = 0;
        SAD = 1;
        Address = 32'b00000000000000000000000000000001;
        
        #40
        SAD = 0;
        MemRead = 1;
        Address = 32'b00000000000000000000000000000010;
        
        #40
        MemRead = 0;
        MemWrite = 1;
        Address = 32'b00000000000000000000000000100000;
        WriteData = 32'b00110001001011111010000111100001;
        
        #40
        MemWrite = 0;
        
    end

endmodule
