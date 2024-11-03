`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

	initial begin
	
	ALUControl = 4'b0000; //test set 0
	A = 15;
	B = 12;
	
	#100
	ALUControl = 4'b0001; //test addion
	A = 0;
	B = 0;
	
	#100 //addition test part 2
	A = 15;
	B = 12;
	
	#100 //subtraction test
	ALUControl = 4'b0010;
	A = 586;
	B = 312;
	
	#100 //mutliplication test
	ALUControl = 4'b0011;
	A = 3;
	B = -2;
	
	#100
	ALUControl = 4'b0100; //greater than or equal to test
	A = -4;
	B = 0;
	#50
	A = -4;
	B = -1;
	#50
	A = 9;
	B = 8;
	#50
	A = 10;
	B = -4;
	#50
	A = 4;
	B = 5;
	
	#100 //not equal test
	ALUControl = 4'b0101;
	A = 420;
	B = 69;
    #50
    A = 69;
    
    #100 //greater than test
    ALUControl = 4'b0110;
    A = -4;
	B = 0;
	#50
	A = -4;
	B = -1;
	#50
	A = 9;
	B = 8;
	#50
	A = 10;
	B = -4;
	#50
	A = 4;
	B = 5;
	
    #100 //less than or equal to test
    ALUControl = 4'b0111;
    A = 11;
    B = 10;
    #50
    A = 9;
    B = 9;
    #50
    A = -4;
    B = -4;
    #50
    A = -10;
    B = -1;
    #50
    A = -3;
    B = 4;
    #50
    A = 2;
    B = -1;
    
    #100 //less than test
    ALUControl = 4'b1000;
    A = 11;
    B = 10;
    #50
    A = 9;
    B = 9;
    #50
    A = -4;
    B = -4;
    #50
    A = -10;
    B = -1;
    #50
    A = -3;
    B = 4;
    
    //Test And
    #100
    ALUControl = 4'b1010;
    A = 32'b11011001101000110000111111100101;
    B = 32'b00001001001111001101101110011001;
    
    //Test Or
    #100
    ALUControl = 4'b1011;
    A = 32'b11011001101000110000111111100101;
    B = 32'b00001001001111001101101110011001;
    
    //Test Nor
    #100
    ALUControl = 4'b1100;
    A = 32'b11011001101000110000111111100101;
    B = 32'b00001001001111001101101110011001;
    
    //Test Xor
    #100
    ALUControl = 4'b1101;
    A = 32'b11011001101000110000111111100101;
    B = 32'b00001001001111001101101110011001;
    
    //Test Shift left
    #100
    ALUControl = 4'b1110;
    A = 32'b11011001101000110000111111100101;
    B = 6;
    
    //Test shift right
    #100
    ALUControl = 4'b1111;
    A = 32'b11011001101000110000111111100101;
    B = 10;
    
    
end    
endmodule

