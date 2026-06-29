`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 12:38:16
// Design Name: 
// Module Name: RegDst_MUX
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


module Reg_Dst_Mux(
    input [4:0] rt,
    input [4:0] rd,
    input [4:0] WriteReg1,
    input [1:0] RegDst,
    
    output reg [4:0] WriteReg
    );
    
    always@(*)
    begin
        case(RegDst)
            2'b00 : WriteReg = rt;
            
            2'b01 : WriteReg = rd;
            
            2'b10 : WriteReg = WriteReg1;
            
            default : WriteReg = rd;
        endcase
    end
    
endmodule
