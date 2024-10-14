`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 02:35:40 PM
// Design Name: 
// Module Name: ALU_Controller
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


module ALU_Controller(ALUOp, Funct, ALUControl);
input [3:0]ALUOp;
input [5:0]Funct;
output reg [3:0]ALUControl;


always @(*) begin
    case(ALUOp)
        4'b0000: ALUControl <= 4'b0001; //(data types/Add)
        4'b0001: ALUControl <= 4'b0001; //(addi)
        4'b0010: begin //R-types
            case(Funct)
                6'b100000: ALUControl <= 4'b0001;  //Add
                6'b100010: ALUControl <= 4'b0010;  //Subtract
                6'b100010: ALUControl <= 4'b0011;  //Multiply
                6'b100100: ALUControl <= 4'b1010;  //And
                6'b100101: ALUControl <= 4'b1011;  //or
                6'b100111: ALUControl <= 4'b1100;  //Nor
                6'b100110: ALUControl <= 4'b1101;  //Xor
                6'b000000: ALUControl <= 4'b1110;  //Shift left
                6'b000010: ALUControl <= 4'b1111;  //Shift right
                6'b101010: ALUControl <= 4'b1000;  //Set on less than
            endcase
        end
        4'b0011: ALUControl <= 4'b0100;  //bgez
        4'b0100: ALUControl <= 4'b0010;  //beq
        4'b0101: ALUControl <= 4'b0101;  //bne
        4'b0110: ALUControl <= 4'b0110;  //bgtz
        4'b0111: ALUControl <= 4'b0111;  //blez
        4'b1000: ALUControl <= 4'b1000;  //bltz
        4'b1001: ALUControl <= 4'b0000;  //jump-jump register-jump and link
        4'b1010: ALUControl <= 4'b1010;  //andi
        4'b1011: ALUControl <= 4'b1011;  //ori
        4'b1100: ALUControl <= 4'b1101;  //xori
        4'b1101: ALUControl <= 4'b1000;  //slti
        
    
    endcase
end
endmodule
