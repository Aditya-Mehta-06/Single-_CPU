`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 12:38:16
// Design Name: 
// Module Name: ALUSrc_MUX
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


module ALUSrc_Mux(
    input [31:0] ReadData2,
    input [31:0] Imm32,
    input [31:0] Imm32_0,
    input [1:0] ALUSrc,
    
    output reg [31:0] reg2
    );
    
    always@(*)
    begin
        case(ALUSrc)
            2'b00 : reg2 = ReadData2;
            
            2'b01 : reg2 = Imm32;
            
            2'b10 : reg2 = Imm32_0;
            
            default : reg2 = ReadData2;
        endcase
    end
    
endmodule
