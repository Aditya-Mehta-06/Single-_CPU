`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 21:55:25
// Design Name: 
// Module Name: ALU_32_bit
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


module ALU_32_bit(
    input [31:0] reg1,
    input [31:0] reg2,
    input [4:0] shamt,
    
    input [3:0] ALU_Control,
    
    output reg [31:0] Result,
    output Zero
    );
    
    always@(*)
    begin
        
        case(ALU_Control)
            
            4'b0000 : Result = reg1 + reg2;
            
            4'b0001 : Result = reg1 - reg2;
            
            4'b0010 : Result = reg1 & reg2;
            
            4'b0011 : Result = reg1 | reg2;
            
            4'b0100 : Result = reg1 ^ reg2;
            
            4'b0101 : Result = (reg1 < reg2) ? 1 : 0;
            
            4'b0110 : Result = reg2 << shamt;
            
            4'b0111 : Result = reg2 >> shamt;
            
            default : Result = 0;
            
        endcase
    end
    
        assign Zero = (Result == 0);
endmodule
