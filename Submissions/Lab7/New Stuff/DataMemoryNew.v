`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 05:37:02 PM
// Design Name: 
// Module Name: DataMemoryNew
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


module DataMemoryNew(Address, WriteData, Clk, MemWrite, MemRead, ReadData, Reset, Init, SAD, 
V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16
); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 
    input Reset;
    input Init, SAD;
    
    output reg[31:0] ReadData; // Contents of memory location at real
    output reg[31:0] V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16;
    
    reg [31:0] memory [0:4095];

    /* Please fill in the implementation here */
    
    always@(*) begin
        if(Init)begin
            V1 <= memory[4100];
            V2 <= memory[4101];
            V3 <= memory[4102];
            V4 <= memory[4103];
            V5 <= memory[4104];
            V6 <= memory[4105];
            V7 <= memory[4106];
            V8 <= memory[4107];
            V9 <= memory[4108];
            V10 <= memory[4109];
            V11 <= memory[4110];
            V12 <= memory[4111];
            V13 <= memory[4112];
            V14 <= memory[4113];
            V15 <= memory[4114];
            V16 <= memory[4115];
        end
        else if(SAD) begin
            V1 <= memory[Address[13:2]];
            V2 <= memory[Address[13:2] + 1];
            V3 <= memory[Address[13:2] + 2];
            V4 <= memory[Address[13:2] + 3];
            V5 <= memory[Address[13:2] + 64];
            V6 <= memory[Address[13:2] + 65];
            V7 <= memory[Address[13:2] + 66];
            V8 <= memory[Address[13:2] + 67];
            V9 <= memory[Address[13:2] + 128];
            V10 <= memory[Address[13:2] + 129];
            V11 <= memory[Address[13:2] + 130];
            V12 <= memory[Address[13:2] + 131];
            V13 <= memory[Address[13:2] + 192];
            V14 <= memory[Address[13:2] + 193];
            V15 <= memory[Address[13:2] + 194];
            V16 <= memory[Address[13:2] + 195];
        end
        else begin
            if(MemRead)
                ReadData <= memory[Address[13:2]];   
            else
                ReadData <= 32'b0;
        end
    end
    
    always@(posedge Clk)begin
        if(MemWrite)
            memory[Address[13:2]] <= WriteData;
    end
        
    initial begin
        $readmemh("competition_frame_window_hex.mem", memory);
    end

endmodule
