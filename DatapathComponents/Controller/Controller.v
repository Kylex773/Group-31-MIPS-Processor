`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 12:03:17 PM
// Design Name: 
// Module Name: Controller
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


module Controller(InstCode, RegDst, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite);

input [5:0] InstCode; // 6 bit input code for each instruction

output reg RegDst; //writing to rt or rd
output reg MemRead; //is the memory read
output reg MemToReg; //is the register getting its value from memory
output reg [3:0] ALUOp; //4 bit output code to control ALU
output reg MemWrite; //is the memory being written to
output reg ALUSrc; //is the second ALU input from a register or an immediate
output reg RegWrite; //is the a register bing written to

always @(InstCode)
begin
case(InstCode)
6'b000000: begin //r type instructions
RegDst <= 1;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0010;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1; 
end

6'b001000: begin //add immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0001;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
end

6'b100011: begin //lw
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
end

6'b100001: begin //lh
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
end

6'b100000: begin //lb
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
end

6'b101011: begin //sw
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 1;
ALUSrc <= 1;
RegWrite <=0; 
end

6'b101001: begin //sh
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 1;
ALUSrc <= 1;
RegWrite <=0; 
end

6'b101000: begin //sb
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 1;
ALUSrc <= 1;
RegWrite <=0; 
end

6'b001100: begin //and immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1010;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
end

6'b001101: begin //or immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1011;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
end

6'b001110: begin //xor immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1100;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
end

6'b001010: begin //slt immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1101;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
end

6'b011100: begin //mul
RegDst <= 1;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1111;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1; 
end

default: begin //default case
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <=0; 
end
endcase 
end

endmodule
