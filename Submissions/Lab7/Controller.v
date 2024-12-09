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


module Controller(InstCode, FunctCode, RegImm, NopCheck, RegDst, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, BranchType, jal, Display, hazardType, SAD);

input [5:0] InstCode; // 6 bit input code for each instruction
input [5:0] FunctCode; //needed because the world hates us and JR uses the R type function field :)
input [4:0] RegImm; //needed because mips wants to kill me more
input [31:0] NopCheck;

output reg RegDst; //writing to rt or rd
output reg MemRead; //is the memory read
output reg MemToReg; //is the register getting its value from memory
output reg [3:0] ALUOp; //4 bit output code to control ALU
output reg MemWrite; //is the memory being written to
output reg ALUSrc; //is the second ALU input from a register or an immediate
output reg RegWrite; //is the a register bing written to
output reg [1:0] BranchType; //type of branch/jump
output reg jal; //is it jal
output reg Display; //not needed anymore
output reg hazardType; //0 for rtype, 1 for mem/itype
output reg [1:0] SAD;

always @(*)
begin
case(InstCode)
6'b000000: begin 

if (FunctCode == 6'b001000) begin //jump register
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1001;
MemWrite <= 0;
ALUSrc <= 1;
RegWrite <=0; 
BranchType <= 2;
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 0;
SAD <= 0;
end
end

6'b001111:begin //SADJ
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1; 
BranchType <= 0;
jal <= 0;
SAD <= 1;
end

6'b001111:begin //SAD
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1; 
BranchType <= 0;
jal <= 0;
SAD <= 2;
end

6'b001111:begin //SAD
RegDst <= 0;
MemRead <= 1;
MemToReg <= 1;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1; 
BranchType <= 0;
jal <= 0;
SAD <= 3;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 0;
SAD <= 0;
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
jal <= 0;
hazardType <= 0;
SAD <= 0;
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
jal <= 0;
hazardType <= 0;
SAD <= 0;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 0;
SAD <= 0;
end

//branch type instructions

6'b000001: begin //bgez and bltz

if (RegImm == 5'b00001) begin
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0011;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
jal <= 0;
hazardType <= 1;
SAD <= 0;
end

else if (RegImm == 5'b00000) begin //bltz
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1000;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
jal <= 0;
hazardType <= 1;
SAD <= 0;
end
end

6'b000100: begin //beq
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0100;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 0; 
BranchType <= 3;
jal <= 0;
hazardType <= 0;
SAD <= 0;
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
jal <= 0;
hazardType <= 0;
SAD <= 0;
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
jal <= 0;
hazardType <= 1;
SAD <= 0;
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
jal <= 0;
hazardType <= 0;
SAD <= 0;
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
jal <= 0;
SAD <= 0;
end

6'b000011: begin //jal
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b1001;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1; 
BranchType <= 1;
jal <= 1;
SAD <= 0;
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
jal <= 0;
SAD <= 0;
end
endcase 

if (NopCheck == 0) begin
Display <= 1;
RegDst <= 0;
MemRead <= 0;
MemToReg <= 0;
ALUOp <= 4'b0000;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <=0; 
BranchType <= 0;
jal <= 0;
SAD <= 0;
end
else
Display <= 1;

end


endmodule
