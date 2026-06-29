`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 23:04:06
// Design Name: 
// Module Name: Instruction_Decode
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


module Instruction_Decode(
    input [31:0] Instruction,
    
    output reg [5:0] opcode,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [4:0] shamt,
    output reg [5:0] funct,
    output reg [15:0] Immediate,
    output reg [25:0] Imm26
    );
    
    always@(*)
    begin
        opcode = Instruction[31:26];
        rs = Instruction[25:21]; 
        rt = Instruction[20:16];
        rd = Instruction[15:11];
        shamt = Instruction[10:6];
        funct = Instruction[5:0];
        Immediate = Instruction[15:0];
        Imm26 = Instruction[25:0];
    end
endmodule
