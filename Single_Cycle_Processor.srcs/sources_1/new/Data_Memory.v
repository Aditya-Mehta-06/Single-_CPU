`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 22:32:52
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,
    input [31:0] Address,
    input [31:0] WriteData,
    input MemRead,
    input MemWrite,
    
    output reg [31:0] ReadData
    );
    
    reg [31:0] DMEM [0:255];
    
    initial begin
       /* DMEM[0] = 100;
        DMEM[1] = 55;
        DMEM[2] = 25;
        DMEM[3] = 19;
        DMEM[4] = 164; */
        
        DMEM[2] = 32'h0000000F;
        DMEM[8] = 32'h00000022;
        DMEM[20] = 32'h00000033;
        DMEM[24] = 32'h00000044;
    end
    
    always@(*)
    begin
        if(MemRead)
        begin
            ReadData = DMEM[Address>>2];
        end
        
        else
        begin
            ReadData = 0;
        end
    end
    
    always@(posedge clk)
    begin
        if(MemWrite)
        begin
            DMEM[Address>>2] <= WriteData;
        end
    end
endmodule
