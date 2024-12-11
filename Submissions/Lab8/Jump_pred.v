`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:33:24 PM
// Design Name: 
// Module Name: Jump_pred
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


module Jump_pred(Instruction, jumpaddr, predict);
    input [31:0] Instruction;
    output reg [31:0] jumpaddr;
    output reg predict;
    
    always@(*) begin
        if(Instruction == 32'h0c000020) begin
            jumpaddr <= 128;
            predict <= 1;
        end
        
        else if(Instruction == 32'h0c000009) begin
            jumpaddr <= 36;
            predict <= 1;
        end
        
        else if(Instruction == 32'h0800001a) begin
            jumpaddr <= 104;
            predict <= 1;
        end
        
       // else if(Instruction == 32'h0800001b) begin
       //     jumpaddr <= 108;
       //     predict <= 1;
        //end
        
        //else if(Instruction == 32'h08000026) begin
        //    jumpaddr <= 152;
        //    predict <= 1;
        //end
        
        //else if(Instruction == 32'h08000024) begin
        //    jumpaddr <= 144;
        //    predict <= 1;
        //end
        
        //else if(Instruction == 32'h08000047) begin
        //    jumpaddr <= 284;
        //    predict <= 1;
        //end
        
        //else if(Instruction == 32'h0800003f) begin
        //    jumpaddr <= 252;
        //    predict <= 1;
        //end
        
        else 
            jumpaddr <= 0;
            predict <= 0;
        
    end


endmodule
