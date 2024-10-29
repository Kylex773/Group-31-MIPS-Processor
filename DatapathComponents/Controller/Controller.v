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


module Controller(InstCode, FunctCode, RegDst, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, BranchType);

input [5:0] InstCode; // 6 bit input code for each instruction
input [5:0] FunctCode; //needed because the world hates us and JR uses the R type function field :)


output reg RegDst; //writing to rt or rd
output reg MemRead; //is the memory read
output reg MemToReg; //is the register getting its value from memory
output reg [3:0] ALUOp; //4 bit output code to control ALU
output reg MemWrite; //is the memory being written to
output reg ALUSrc; //is the second ALU input from a register or an immediate
output reg RegWrite; //is the a register bing written to
output reg [1:0] BranchType; //type of branch/jump


always @(InstCode)
begin
case(InstCode)
6'b000000: begin 

if (FunctCode == 6'b001000) begin //jump register
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0001;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
BranchType <= 2;
end

else begin //r type instructions
RegDst <= 1;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0010;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1; 
BranchType <= 0;
end
end

6'b001000: begin //add immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0001;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
BranchType <= 0;

end

6'b100011: begin //lw
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
BranchType <= 0;
end

6'b100001: begin //lh
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
BranchType <= 0;
end

6'b100000: begin //lb
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1;
BranchType <= 0;
end

6'b101011: begin //sw
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 1;
ALUSrc <= 1;
RegWrite <=0; 
BranchType <= 0;
end

6'b101001: begin //sh
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 1;
ALUSrc <= 1;
RegWrite <=0; 
BranchType <= 0;
end

6'b101000: begin //sb
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 1;
ALUSrc <= 1;
RegWrite <=0; 
BranchType <= 0;
end

6'b001100: begin //and immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1010;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
BranchType <= 0;
end

6'b001101: begin //or immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1011;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
BranchType <= 0;
end

6'b001110: begin //xor immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1100;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
BranchType <= 0;
end

6'b001010: begin //slt immediate
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1101;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=1; 
BranchType <= 0;
end

6'b011100: begin //mul
RegDst <= 1;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1111;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1; 
BranchType <= 0;
end

//branch type instructions

6'b000001: begin //bgez
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0011;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
end

6'b000001: begin //beq
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0100;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
end

6'b000101: begin //bne
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0101;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
end

6'b000111: begin //bgtz
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0110;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
end

6'b000110: begin //blez
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0111;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
end

6'b000001: begin //bltz
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1000;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
end

6'b000010: begin //j
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1001;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 1;
end

6'b000011: begin //jal
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1001;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 1;
end

default: begin //default case
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <=0; 
BranchType <= 0;
end
endcase 
end

endmodule
