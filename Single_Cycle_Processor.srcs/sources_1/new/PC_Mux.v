`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 17:42:34
// Design Name: 
// Module Name: PC_Mux
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


module PC_Mux(
    input Branch,
    input Zero,
    input BNE,
    input Jump,
    input Jumpreg,
    input [31:0] ReadData1,
    input [31:0] PC4,
    input [31:0] Branch_Target,
    input [31:0] Next_PC_Jump,
    
    output reg [31:0] Next_PC
    );
    
    always@(*)
    begin
        Next_PC = PC4;
        
        if((Branch && Zero) || (BNE && ~Zero))
        begin
            Next_PC = Branch_Target;
        end
        
        else if(Jump)
        begin
            Next_PC = Next_PC_Jump;
        end
        
        else if(Jumpreg)
        begin
            Next_PC = ReadData1;
        end
    end

endmodule
