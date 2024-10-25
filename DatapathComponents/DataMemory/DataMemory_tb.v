`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;
    reg     [1:0]   MemType;

    wire [31:0] ReadData;
    

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData),
        .MemType(MemType)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #20 Clk <= ~Clk;
	end

	initial begin
	
        MemRead = 0;
        MemWrite = 1;
        Address = 32'b00011100010111010000111100001010;
        WriteData = 32'b10101010011000110011001010100100;
        
        #40 
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b11;
        
        #40
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b01;
        
        #40
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b00;
	
	end

endmodule

