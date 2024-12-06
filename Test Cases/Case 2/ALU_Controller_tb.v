`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 10:09:25 AM
// Design Name: 
// Module Name: ALU_Controller_tb
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


module ALU_Controller_tb();

reg [3:0]ALUOp;
reg [5:0]Funct;
wire [3:0]ALUControl;

ALU_Controller ALU_Controller(
    .ALUOp(ALUOp),
    .Funct(Funct),
    .ALUControl(ALUControl)
);

initial begin

ALUOp = 4'b0000; //Data types test

#100
ALUOp = 4'b0001;  //addi test

#100
ALUOp = 4'b0010;  //Add test
Funct = 6'b100000;

#100
ALUOp = 4'b0010;  //Subtract test
Funct = 6'b100010;

#100
ALUOp = 4'b0010;  //Multiply test
Funct = 6'b000010;

#100
ALUOp = 4'b0010;  //And test
Funct = 6'b100100;

#100
ALUOp = 4'b0010;  //or test
Funct = 6'b100101;

#100
ALUOp = 4'b0010;  //nor test
Funct = 6'b100111;

#100
ALUOp = 4'b0010;  //xor test
Funct = 6'b100110;

#100
ALUOp = 4'b0010;  //shift left test
Funct = 6'b000000;

#100
ALUOp = 4'b0010;  //shift right test
Funct = 6'b000010;

#100
ALUOp = 4'b0010;  //Set on less than test
Funct = 6'b101010;

#100
ALUOp = 4'b0011;  //bgez test

#100
ALUOp = 4'b0100;  //beq test

#100
ALUOp = 4'b0101;  //bne test

#100
ALUOp = 4'b0110;  //bgtz test

#100
ALUOp = 4'b0111;  //blez test

#100
ALUOp = 4'b1000;  //bltz test

#100
ALUOp = 4'b1001;  //jump test

#100
ALUOp = 4'b1010;  //andi test

#100
ALUOp = 4'b1011;  //ori test

#100
ALUOp = 4'b1100;  //xori test

#100
ALUOp = 4'b1101;  //slti test


end
endmodule














