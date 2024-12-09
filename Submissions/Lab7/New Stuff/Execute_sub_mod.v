`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 10:00:45 PM
// Design Name: 
// Module Name: Execute_sub_mod
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


module Execute_sub_mod(ReadData2E, ImmExtE, ALUSrcE, ALUOpE, ReadData1E, ShftAmtE, PCPlus4E, ALUResultE, Zero
);
    //ALUSrcMux
    input [31:0] ReadData2E;
    input [31:0] ImmExtE;
    input [31:0] ALUSrcE;
    wire [31:0] ALUSrcValE;
    
    //ALU_Controller
    input [3:0] ALUOpE;
    wire [3:0] ALUControlE;
    
    //ALU
    input [31:0] ReadData1E;
    input [4:0] ShftAmtE;
    input [31:0] PCPlus4E;
    output wire [31:0] ALUResultE;
    output wire Zero;
    
    Mux32Bit2To1 ALUSrcMux(ALUSrcValE, ReadData2E, ImmExtE, ALUSrcE);
    
    ALU_Controller ALU_Controller(ALUOpE, ImmExtE[5:0], ALUControlE);
    
    ALU32Bit ALU(ALUControlE, ReadData1E, ALUSrcValE, ShftAmtE, ALUResultE, Zero, PCPlus4E);




    
    
endmodule
