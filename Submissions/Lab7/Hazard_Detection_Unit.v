`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 08:23:39 AM
// Design Name: 
// Module Name: Hazard_Detection_Unit
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


module Hazard_Detection_Unit(Exei, Memi, Deci, Wbi, exeh, memh, dech, wbh, Stall, RegWriteE, RegWriteM, RegWriteW);
input [31:0] Exei, Memi, Deci, Wbi;
input exeh, memh, dech, wbh, RegWriteE, RegWriteM, RegWriteW;
output reg Stall;

wire [4:0]ExeRD = Exei[15:11]; 
wire [4:0]ExeRT = Exei[20:16];
wire [4:0]MemRD = Memi[15:11]; 
wire [4:0]MemRT = Memi[20:16];
wire [4:0]DecRS = Deci[25:21];
wire [4:0]DecRT = Deci[20:16];
wire [4:0]WbRD = Wbi[15:11];
wire [4:0]WbRT = Wbi[20:16];

always @(*) begin
    Stall <= 0;
    if(exeh == 0 && memh == 0 && wbh == 0 && dech == 0)begin  
        if((ExeRD == DecRS || ExeRD == DecRT) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRD == DecRS || MemRD == DecRT) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRD == DecRS || WbRD == DecRT) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    else if(exeh == 0 && memh == 0 && dech == 1 && wbh == 0)begin
        if((ExeRD == DecRS) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRD == DecRS) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRD == DecRS) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    
    else if(exeh == 0 && memh == 1 && dech == 0 && wbh == 0)begin
        if((ExeRD == DecRS || ExeRD == DecRT) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRT == DecRS || MemRT == DecRT) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRD == DecRS || WbRD == DecRT) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    
    else if(exeh == 0 && memh == 1 && dech == 1 && wbh == 0)begin
        if((ExeRD == DecRS) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRT == DecRS) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRD == DecRS) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    else if(exeh == 1 && memh == 0 && dech == 0 && wbh == 0)begin
        if((ExeRT == DecRS || ExeRT == DecRT) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRD == DecRS || MemRD == DecRT) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRD == DecRS || WbRD == DecRT) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    else if(exeh == 1 && memh == 0 && dech == 1 && wbh == 0)begin
        if((ExeRT == DecRS) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRD == DecRS) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRD == DecRS) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    else if(exeh == 1 && memh == 1 && dech == 0 && wbh == 0)begin
        if((ExeRT == DecRS || ExeRT == DecRT) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRT == DecRS || MemRT == DecRT) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRD == DecRS || WbRD == DecRT) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    
    else if(exeh == 1 && memh == 1 && dech == 1 && wbh == 0)begin
        if((ExeRT == DecRS) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRT == DecRS) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRD == DecRS) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    ///////////////////////////////////////////////////
    else if(exeh == 0 && memh == 0 && wbh == 1 && dech == 0)begin  
        if((ExeRD == DecRS || ExeRD == DecRT) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRD == DecRS || MemRD == DecRT) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRT == DecRS || WbRT == DecRT) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    else if(exeh == 0 && memh == 0 && dech == 1 && wbh == 1)begin
        if((ExeRD == DecRS) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRD == DecRS) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRT == DecRS) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    
    else if(exeh == 0 && memh == 1 && dech == 0 && wbh == 1)begin
        if((ExeRD == DecRS || ExeRD == DecRT) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRT == DecRS || MemRT == DecRT) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRT == DecRS || WbRT == DecRT) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    
    else if(exeh == 0 && memh == 1 && dech == 1 && wbh == 1)begin
        if((ExeRD == DecRS) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRT == DecRS) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRT == DecRS) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    else if(exeh == 1 && memh == 0 && dech == 0 && wbh == 1)begin
        if((ExeRT == DecRS || ExeRT == DecRT) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRD == DecRS || MemRD == DecRT) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRT == DecRS || WbRT == DecRT) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    else if(exeh == 1 && memh == 0 && dech == 1 && wbh == 1)begin
        if((ExeRT == DecRS) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRD == DecRS) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRT == DecRS) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    else if(exeh == 1 && memh == 1 && dech == 0 && wbh == 1)begin
        if((ExeRT == DecRS || ExeRT == DecRT) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRT == DecRS || MemRT == DecRT) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRT == DecRS || WbRT == DecRT) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    
    else if(exeh == 1 && memh == 1 && dech == 1 && wbh == 1)begin
        if((ExeRT == DecRS) && (RegWriteE == 1))begin
            Stall <= 1;
        end
        else if ((MemRT == DecRS) && (RegWriteM == 1))begin
            Stall <= 1;
        end
        else if ((WbRT == DecRS) && (RegWriteW == 1))begin
            Stall <= 1;
        end
    end
    
    
    
    
    else begin
            Stall <= 0;
    end
    
    
    
end


endmodule
