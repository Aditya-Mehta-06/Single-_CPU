`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 23:04:06
// Design Name: 
// Module Name: PC_4
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


module PC_4(
    input [31:0] PC,
    
    output reg [31:0] PC4
    );
    
    always@(*)
    begin
        PC4 = PC + 4;
    end
endmodule
