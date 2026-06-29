`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2026 11:55:22
// Design Name: 
// Module Name: Jump_Address
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


module Jump_Address(
    input [27:0] Shift_Imm_26,
    input [31:0] PC4,
    
    output [31:0] Next_PC_Jump
    );
    
    assign Next_PC_Jump = {PC4[31:28], Shift_Imm_26};
    
endmodule
