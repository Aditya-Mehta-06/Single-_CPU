`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2026 17:48:58
// Design Name: 
// Module Name: WriteData_Mux
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


module WriteData_Mux(
    input [1:0] RegDst,
    input [31:0] WriteData,
    input [31:0] PC4,
    
    output reg [31:0] WriteData_reg
    );
    
    always@(*)
    begin
        WriteData_reg = WriteData;
        
        if(RegDst == 2'b10)
        begin
            WriteData_reg = PC4;
        end
    end
endmodule
