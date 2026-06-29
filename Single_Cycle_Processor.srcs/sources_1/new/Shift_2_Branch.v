`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 17:42:34
// Design Name: 
// Module Name: Shift_2_Branch
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


module Shift_2_Branch(
    input [31:0] Imm32,
    input [31:0] Imm26,
    
    output [31:0] Shift_Imm,
    output [27:0] Shift_Imm_26
    );
    
    assign Shift_Imm = Imm32 << 2;
    
    assign Shift_Imm_26 = Imm26 << 2;
    
endmodule
