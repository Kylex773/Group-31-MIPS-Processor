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


module DataMemoryNew(Address, WriteData, Clk, MemWrite, MemRead, ReadData, Reset, Init, SAD, vector); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 
    input Reset;
    input Init, SAD;
    
    output reg[31:0] ReadData; // Contents of memory location at real
    output reg[31:0] vector [0:15];
    
    reg i;
    
    reg [31:0] memory [0:4095];

    /* Please fill in the implementation here */
    
    always@(*) begin
        if(Init)begin
            for(i = 0; i <= 15; i = i + 1)
                vector[i] <= memory[4100 + i];
        end
        else if(SAD) begin
            vector[0] <= memory[Address[13:2]];
            vector[1] <= memory[Address[13:2] + 1];
            vector[2] <= memory[Address[13:2] + 2];
            vector[3] <= memory[Address[13:2] + 3];
            vector[4] <= memory[Address[13:2] + 64];
            vector[5] <= memory[Address[13:2] + 65];
            vector[6] <= memory[Address[13:2] + 66];
            vector[7] <= memory[Address[13:2] + 67];
            vector[8] <= memory[Address[13:2] + 128];
            vector[9] <= memory[Address[13:2] + 129];
            vector[10] <= memory[Address[13:2] + 130];
            vector[11] <= memory[Address[13:2] + 131];
            vector[12] <= memory[Address[13:2] + 192];
            vector[13] <= memory[Address[13:2] + 193];
            vector[14] <= memory[Address[13:2] + 194];
            vector[15] <= memory[Address[13:2] + 195];
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
