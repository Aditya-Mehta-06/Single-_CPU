`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 18:28:52
// Design Name: 
// Module Name: CPU_Single_Cycle
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


module CPU_Single_Cycle(
    input clk,
    input reset,
    
    output [31:0] PC_out,
    output [31:0] Instruction_out
    );
    
    wire [31:0] PC;
    wire [31:0] Next_PC;
    wire [31:0] PC4;
    wire [31:0] Instruction;
    wire [5:0] opcode;
    wire [4:0] ReadReg1;
    wire [4:0] ReadReg2;
    wire [4:0] rd;
    wire [4:0] WriteReg;
    wire [4:0] shamt;
    wire [5:0] funct;
    wire [15:0] Imm16;
    wire [1:0] RegDst;
    wire RegWrite;
    wire [31:0] WriteData;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] Imm32;
    wire [31:0] Shift_Imm;
    wire [27:0] Shift_Imm_26;
    wire [31:0] Branch_Target;
    wire Branch;
    wire Zero;
    wire [1:0] ALUSrc;
    wire [1:0] MemtoReg;
    wire MemRead;
    wire MemWrite;
    wire BNE;
    wire Jump;
    wire Jumpreg;
    wire [2:0] ALUop;
    wire [31:0] reg2;
    wire [3:0] ALU_Control;
    wire [31:0] Result;
    wire [31:0] ReadData;
    wire [31:0] Imm32_0;
    wire [4:0] WriteReg1; 
    wire [25:0] Imm26;
    wire [31:0] Next_PC_Jump;
    
    
    assign PC_out = PC;
    assign Instruction_out = Instruction;
    
    Program_Counter pc (.clk(clk), .reset(reset), .Next_PC(Next_PC), .PC(PC));
    
    PC_4 pc4 (.PC(PC), .PC4(PC4));
    
    Instruction_Memory im (.PC(PC), .Instruction(Instruction));
    
    Instruction_Decode id (.Instruction(Instruction), .opcode(opcode), .rs(ReadReg1), .rt(ReadReg2), .rd(rd), .shamt(shamt), .funct(funct), .Immediate(Imm16), .Imm26(Imm26));
    
    Reg_Dst_Mux regdst (.rt(ReadReg2), .rd(rd), .WriteReg1(WriteReg1), .RegDst(RegDst), .WriteReg(WriteReg));
    
    Register_File_32_32 rf (.clk(clk), .RegWrite(RegWrite), .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .WriteReg(WriteReg), .WriteData(WriteData), .ReadData1(ReadData1), .ReadData2(ReadData2));
    
    Sign_Extension se (.Imm16(Imm16), .Imm32(Imm32));
    
    Shift_2_Branch sf (.Imm32(Imm32), .Imm26(Imm26), .Shift_Imm(Shift_Imm), .Shift_Imm_26(Shift_Imm_26));
    
    Branch_Target_Adder bta (.PC4(PC4), .Shift_Imm(Shift_Imm), .Branch_Target(Branch_Target));
    
    PC_Mux pcmux (.Branch(Branch), .Zero(Zero), .BNE(BNE), .Jump(Jump), .Jumpreg(Jumpreg), .ReadData1(ReadData1), .PC4(PC4), .Branch_Target(Branch_Target), .Next_PC_Jump(Next_PC_Jump), .Next_PC(Next_PC));
    
    Control_Unit cu (.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .Jump(Jump), .BNE(BNE), .ALUop(ALUop), .WriteReg1(WriteReg1));
    
    ALUSrc_Mux alumux (.ReadData2(ReadData2), .Imm32(Imm32), .Imm32_0(Imm32_0), .ALUSrc(ALUSrc), .reg2(reg2));
    
    ALU_Control_Unit alucu (.ALUop(ALUop), .funct(funct), .ALUCtrl(ALU_Control), .Jumpreg(Jumpreg));
    
    ALU_32_bit alu (.reg1(ReadData1), .reg2(reg2), .shamt(shamt), .ALU_Control(ALU_Control), .Result(Result), .Zero(Zero));
    
    Data_Memory dm (.clk(clk), .Address(Result), .WriteData(ReadData2), .MemRead(MemRead), .MemWrite(MemWrite), .ReadData(ReadData));
    
    MemtoReg_Mux mem_mux (.ALUResult(Result), .ReadData(ReadData), .PC4(PC4), .MemtoReg(MemtoReg), .WriteData(WriteData));
    
    Jump_Address jumpadd (.Shift_Imm_26(Shift_Imm_26), .PC4(PC4), .Next_PC_Jump(Next_PC_Jump));
    
    Zero_Extention zeroexe (.Imm16(Imm16), .Imm32_0(Imm32_0));
    
endmodule
