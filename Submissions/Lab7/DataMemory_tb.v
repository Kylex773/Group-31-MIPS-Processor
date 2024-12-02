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
	
       /* MemRead = 0;  //load test case
        MemWrite = 1;
        Address = 32'b00000000000000000000000000000100;
        WriteData = 32'b11111111111111100111111111111111;
        MemType = 2'b11;
        
        #40 // test lh lower half
        Address = 32'b00000000000000000000000000000110;
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b01;
        
        
        #40   // test lh upper half
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b01;
        Address = 32'b00000000000000000000000000000100;
        */
        
        #40  // load test lb
        MemRead = 0;
        MemWrite = 1;
        Address = 32'b00000000000000000000000000000100;
        WriteData = 32'b00000100000000110000000100000000;
        MemType = 2'b11;
        
       #40  // test lb least 8 bits
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b00;
        Address = 32'b00000000000000000000000000000111;
        
        #40  // test lb  lower middle 8 bits
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b00;
        Address = 32'b00000000000000000000000000000110;
        
        #40  // test lb upper middle 8 bits
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b00;
        Address = 32'b00000000000000000000000000000101;
        
        #40  // test lb highest 8 bits
        MemRead = 1;
        MemWrite = 0;
        MemType = 2'b00;
        Address = 32'b00000000000000000000000000000100;
	
	end

endmodule

