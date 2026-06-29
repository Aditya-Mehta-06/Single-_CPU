`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 22:55:49
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input clk,
    input reset,
    input [31:0] Next_PC,
    
    output reg [31:0] PC
    );
    
    always@(posedge clk)
    begin
        if(reset)
        begin
            PC <= 0;
        end
        else
        begin
            PC <= Next_PC;
        end
    end
endmodule
