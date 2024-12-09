`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 06:33:28 PM
// Design Name: 
// Module Name: AddressUpdater
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


module AddressUpdater(address, SAD, updatedAddress);

input [31:0] address;
input [1:0] SAD;

output reg [31:0] updatedAddress;

always @(*) begin
    if(SAD == 3)
    updatedAddress <= 16;
    else if (SAD == 2)
    updatedAddress <= address + 4;
    else if(SAD == 1)
    updatedAddress <= address + 16;
    else
    updatedAddress <= address;
end


endmodule
