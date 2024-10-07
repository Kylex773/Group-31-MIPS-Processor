`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */
    
    #10
    RegWrite<=1;
    WriteRegister<=8;
    WriteData<=1;
    
    #10
    RegWrite<=1;
    WriteRegister<=9;
    WriteData<=2;
    
    #10
    RegWrite<=1;
    WriteRegister<=10;
    WriteData<=3;
    
    #10
    RegWrite<=1;
    WriteRegister<=11;
    WriteData<=4;
    
    #10
    RegWrite<=1;
    WriteRegister<=12;
    WriteData<=5;
    
    #10
    RegWrite<=1;
    WriteRegister<=13;
    WriteData<=6;
    
    #10
    RegWrite<=1;
    WriteRegister<=14;
    WriteData<=7;
    
    #10
    RegWrite<=1;
    WriteRegister<=15;
    WriteData<=8;
    
    #10
    RegWrite<=1;
    WriteRegister<=16;
    WriteData<=9;
    
    #10
    RegWrite<=1;
    WriteRegister<=17;
    WriteData<=10;
    
    #10
    RegWrite<=1;
    WriteRegister<=18;
    WriteData<=11;
    
    #10
    RegWrite<=1;
    WriteRegister<=19;
    WriteData<=12;
    
    #10
    RegWrite<=1;
    WriteRegister<=20;
    WriteData<=13;
    
    #10
    RegWrite<=1;
    WriteRegister<=21;
    WriteData<=14;
    
    #10
    RegWrite<=1;
    WriteRegister<=22;
    WriteData<=15;
    
    #10
    RegWrite<=1;
    WriteRegister<=23;
    WriteData<=16;
    
    #10
    RegWrite<=1;
    WriteRegister<=24;
    WriteData<=17;
    
    #10
    RegWrite<=1;
    WriteRegister<=25;
    WriteData<=18;
    
    #10
    RegWrite<=0;
    ReadRegister1<=8;
    ReadRegister2<=25;
    
    #10
    ReadRegister1<=9;
    ReadRegister2<=24;
    
    #10
    ReadRegister1<=10;
    ReadRegister2<=23;
    
    #10
    ReadRegister1<=11;
    ReadRegister2<=22;
    
    #10
    ReadRegister1<=12;
    ReadRegister2<=21;
    
    #10
    ReadRegister1<=13;
    ReadRegister2<=20;
    
    #10
    ReadRegister1<=14;
    ReadRegister2<=19;
    
    #10
    ReadRegister1<=15;
    ReadRegister2<=18;
    
    #10
    ReadRegister1<=16;
    ReadRegister2<=17;
	end
	


endmodule
