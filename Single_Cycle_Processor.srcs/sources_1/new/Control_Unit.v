`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 21:53:48
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [5:0] opcode,
    
    output reg [1:0] RegDst,
    output reg [1:0] ALUSrc,
    output reg [1:0] MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg Jump,
    output reg BNE,
    output reg [2:0] ALUop,
    output reg [4:0] WriteReg1
    );
    
    always@(*)
    begin
        
        case(opcode)
            6'b000000 : // R-type
            begin
                RegDst = 2'b01;
                ALUSrc = 2'b00;
                MemtoReg = 2'b00;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 3'b010;
                Jump = 1'b0;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
            
            6'b100011 : // Load
            begin
                RegDst = 2'b00;
                ALUSrc = 2'b01;
                MemtoReg = 2'b01;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 3'b000;
                Jump = 1'b0;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
            
            6'b101011 : // Store
            begin
                RegDst = 2'bx;
                ALUSrc = 2'b01;
                MemtoReg = 2'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                Branch = 1'b0;
                ALUop = 3'b000;
                Jump = 1'b0;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
            
            6'b000100 : // Branch if Equal
            begin
                RegDst = 2'bx;
                ALUSrc = 2'b00;
                MemtoReg = 2'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                ALUop = 3'b001;
                Jump = 1'b0;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
            
            6'b001000 : // ADDI
            begin
                RegDst = 2'b00;
                ALUSrc = 2'b01;
                MemtoReg = 2'b00;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 3'b000;
                Jump = 1'b0;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
            
            6'b001101 : // ORI
            begin
                RegDst = 2'b00;
                ALUSrc = 2'b10;
                MemtoReg = 2'b00;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 3'b011;
                Jump = 1'b0;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
            
            6'b001110 : // XORI
            begin
                RegDst = 2'b00;
                ALUSrc = 2'b10;
                MemtoReg = 2'b00;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 3'b100;
                Jump = 1'b0;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
            
            6'b000101 : // Branch if not Equal
            begin
                RegDst = 2'bx;
                ALUSrc = 2'b00;
                MemtoReg = 2'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 3'b001;
                Jump = 1'b0;
                BNE = 1'b1;
                WriteReg1 = 5'b00000;
            end
            
            6'b000010 : // Jump
            begin
                RegDst = 2'bx;
                ALUSrc = 2'bx;
                MemtoReg = 2'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 3'bxxx;
                Jump = 1'b1;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
            
            6'b000011 : // Jump and Link
            begin
                RegDst = 2'b10;
                ALUSrc = 2'bx;
                MemtoReg = 2'b10;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 3'bxxx;
                Jump = 1'b1;
                BNE = 1'b0;
                WriteReg1 = 5'b11111;
            end
            
            default :
            begin
                RegDst = 2'b00;
                ALUSrc = 2'b00;
                MemtoReg = 2'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 2'b00;
                Jump = 1'b0;
                BNE = 1'b0;
                WriteReg1 = 5'b00000;
            end
        endcase
    end
endmodule
