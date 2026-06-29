`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2026 11:49:37
// Design Name: 
// Module Name: Zero_Extention
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


module Zero_Extention(
    input [15:0] Imm16,
    
    output [31:0] Imm32_0
    );
    
    assign Imm32_0 = {16'b0, Imm16};
    
endmodule
