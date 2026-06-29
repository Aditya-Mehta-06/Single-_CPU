`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 17:42:34
// Design Name: 
// Module Name: Branch_Target_Adder
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


module Branch_Target_Adder(
    input [31:0] PC4,
    input [31:0] Shift_Imm,
    
    output [31:0] Branch_Target
    );
    
    assign Branch_Target = Shift_Imm + PC4;
    
endmodule
