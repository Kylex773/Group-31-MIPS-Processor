`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 10:13:49 PM
// Design Name: 
// Module Name: Memory_sub_mod
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


module Memory_sub_mod(AddressM, WriteDataM, ReadData2M, Clk, MemWriteM, MemReadM, 
    MemTypeM, Reset, vector, address, rowSkip, updatedAddress);
    
    //Datamemory
    input [31:0] AddressM; 	
    input [31:0] ReadData2M; 
    input Clk;
    input MemWriteM; 		 
    input MemReadM; 			
    input [1:0] MemTypeM;
    input Reset;
    input WriteDataM;
    output wire [31:0] vector [0:15];
    
    
    // AdressUpdated
    input [31:0] address;
    input [31:0] rowSkip;
    output wire [31:0] updatedAddress;
    
    
    AddressUpdater AddressUpdater(address, rowSkip, updatedAddress);
     
     DataMemoryNew DataMemoryNew(AddressM, WriteDataM, Clk, MemWriteM, MemReadM, ReadData2M, Reset, InitM, SADM, vector);
     
     
    endmodule

