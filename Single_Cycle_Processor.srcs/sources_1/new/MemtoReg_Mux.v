`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 12:38:16
// Design Name: 
// Module Name: MemtoReg_MUX
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


module MemtoReg_Mux(
    input [31:0] ALUResult,
    input [31:0] ReadData,
    input [31:0] PC4,
    input [1:0] MemtoReg,
    
    output reg [31:0] WriteData
    );
    
    always@(*)
    begin
        case(MemtoReg)
            2'b00 : WriteData = ALUResult;
            
            2'b01 : WriteData = ReadData;
            
            2'b10 : WriteData = PC4;
        endcase
    end
    
endmodule
