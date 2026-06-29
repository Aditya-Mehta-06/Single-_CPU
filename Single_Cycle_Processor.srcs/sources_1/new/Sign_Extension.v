`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 23:04:06
// Design Name: 
// Module Name: Sign_Extension
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


module Sign_Extension(
    input [15:0] Imm16,
    
    output reg [31:0] Imm32
    );
    
    always@(*)
    begin
        Imm32 = {{16{Imm16[15]}}, Imm16};
    end
endmodule
