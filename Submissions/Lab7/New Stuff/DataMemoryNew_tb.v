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
    wire [31:0] vector [0:15];
    
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
        .vector(vector)
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
