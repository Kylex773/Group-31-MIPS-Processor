`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, J, MemType,
Reset); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 
    input [1:0] MemType;
    input Reset;
    
    output reg[31:0] ReadData, J; // Contents of memory location at real
    
    reg [31:0] memory [0:1023];

    /* Please fill in the implementation here */
    always@(*) begin
        if(MemRead == 1'b1)begin
                if(MemType == 2'b11)begin //load word
                    
                    ReadData <= memory[Address[11:2]];
                    
                end
                else if(MemType == 2'b01)begin  //load half
                    if(Address[1:0] == 2'b10)begin  //load bottom half
                        ReadData <= {{16{memory[Address[11:2]][15]}}, memory[Address[11:2]][15:0]};
                        
                    end
                    else if(Address[1:0] == 2'b00)begin  //load top half
                        ReadData <= {{16{memory[Address[11:2]][31]}}, memory[Address[11:2]][31:16]};
                    end
                end
                else if(MemType == 2'b00)begin  //load byte
                    if(Address[1:0] == 2'b11)begin
                        ReadData <= {{24{memory[Address[11:2]][7]}}, memory[Address[11:2]][7:0]};//load least 8 bits                        
                    end
                    if(Address[1:0] == 2'b10)begin
                        ReadData <= {{24{memory[Address[11:2]][15]}}, memory[Address[11:2]][15:8]}; //load lower half 8 bits
                        
                        
                    end
                    if(Address[1:0] == 2'b01)begin
                        ReadData <= {{24{memory[Address[11:2]][23]}}, memory[Address[11:2]][23:16]};  //load upper half 8 bits
                    end
                    if(Address[1:0] == 2'b00)begin
                        ReadData <= {{24{memory[Address[11:2]][31]}}, memory[Address[11:2]][31:24]};  //load most 8 bits
                    end
                        
                end   
        end       
        else
            ReadData <= 32'b0;
       end

    always @ (posedge Clk)begin
    //J <= memory[2];
        if(MemWrite == 1'b1)begin
            if(MemType == 2'b11)begin //Save word
                    memory[Address[11:2]] <= WriteData;
            end
            if(MemType == 2'b01)begin //Save half
                if(Address[1:0] == 2'b10)begin  //Save bottom half
                        memory[Address[11:2]] <= {memory[Address[11:2]][31:16], WriteData[15:0]};
                end
                else if(Address[1:0] == 2'b00)begin  //Save top half
                        memory[Address[11:2]] <= {WriteData[15:0], memory[Address[11:2]][15:0]};
                end
            end
            if(MemType == 2'b00)begin //Save byte
                if(Address[1:0] == 2'b11)begin  //Save bottom half
                        memory[Address[11:2]] <= {memory[Address[11:2]][31:8], WriteData[7:0]};
                end
                else if(Address[1:0] == 2'b10)begin  //Save top half
                        memory[Address[11:2]] <= {memory[Address[11:2]][31:16], WriteData[7:0], memory[Address[11:2]][7:0]};
                end
                if(Address[1:0] == 2'b01)begin  //Save bottom half
                        memory[Address[11:2]] <= {memory[Address[11:2]][31:24], WriteData[7:0], memory[Address[11:2]][15:0]};
                end
                else if(Address[1:0] == 2'b00)begin  //Save top half
                       memory[Address[11:2]] <= {WriteData[7:0], memory[Address[11:2]][23:0]};
                end
            end
        end
        end    
        
        
        
            initial begin
            $readmemh("vbsmeDataTest1.mem", memory);
            J = memory[1];
            end
endmodule
