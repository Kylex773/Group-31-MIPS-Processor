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
    MemTypeM, Reset, SADM, updatedAddress,
    V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16
                     );
    
    //Datamemory
    input [31:0] AddressM; 	
    input [31:0] ReadData2M; 
    input Clk;
    input MemWriteM; 		 
    input MemReadM; 			
    input [1:0] MemTypeM;
    input Reset;
    input WriteDataM;
    output wire [31:0] V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16;
    
    
    // AdressUpdated
    input [1:0] SADM;
    output wire [31:0] updatedAddress;
    
    
    AddressUpdater AddressUpdater(AddressM, SADM, updatedAddress);
     
    DataMemoryNew DataMemoryNew(AddressM, WriteDataM, Clk, MemWriteM, MemReadM, ReadData2M, Reset, InitM, SADM, 
                               V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16);
     
     
    endmodule

