`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 12:52:08
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [31:0] PC,
    
    output [31:0] Instruction
    );
    
    reg [31:0] IMEM [0:255];
    
    initial begin
       /* IMEM[0] = 32'b000000_00010_00011_00001_00000_100000;
        IMEM[1] = 32'b100011_00011_00101_0000000000000100;
        IMEM[2] = 32'b000100_00001_00101_0000000000000001;
        IMEM[4] = 32'b101011_00000_00100_0000000000001000;
        IMEM[5] = 32'b000000_00101_00110_00011_00000_100010;
        IMEM[6] = 32'b000000_00010_00011_01000_00000_100100;
        IMEM[7] = 32'b000000_00010_00011_01001_00000_100101;
        IMEM[8] = 32'b000000_00010_00011_01010_00000_100110;
        IMEM[9] = 32'b000000_00010_00011_01011_00000_101010;
        IMEM[10] = 32'b000000_00000_00010_01100_00011_000000;
        IMEM[11] = 32'b000000_00000_00010_01101_00011_000010;
        IMEM[12] = 32'b001000_00100_01110_1111111111111011;
        IMEM[13] = 32'b001101_01100_01111_0000000000101010;
        IMEM[14] = 32'b001110_00011_10000_0000000000010100;
        IMEM[15] = 32'b000101_00001_00110_0000000000000010;
        IMEM[16] = 32'h118304B5;
        IMEM[17] = 32'h142501E6;
        IMEM[18] = 32'h08000013;
        IMEM[19] = 32'h0C000014;
        IMEM[20] = 32'b000000_01110_00000_00000_00000_001000; */
        
        IMEM[0]  = 32'h20010008; // addi r1,r0,8
IMEM[1]  = 32'h20020013; // addi r2,r0,19
IMEM[2]  = 32'h20030005; // addi r3,r0,5
IMEM[3]  = 32'h20040009; // addi r4,r0,9

IMEM[4]  = 32'h00412820; // add  r5,r2,r1
IMEM[5]  = 32'h00A33020; // add  r6,r5,r3
IMEM[6]  = 32'h00C43820; // add  r7,r6,r4
IMEM[7]  = 32'h00E54020; // add  r8,r7,r5
IMEM[8]  = 32'h01064820; // add  r9,r8,r6

IMEM[9]  = 32'h8C2A0000; // lw   r10,0(r1)
IMEM[10] = 32'h01425820; // add  r11,r10,r2

IMEM[11] = 32'hAD6B0004; // sw   r11,4(r11)
IMEM[12] = 32'h8D6C0004; // lw   r12,4(r11)

IMEM[13] = 32'h118B0001; // beq  r12,r11,+1
IMEM[14] = 32'h200D00FF; // addi r13,r0,255

IMEM[15] = 32'h158A0001; // bne  r12,r10,+1
IMEM[16] = 32'h200E00EE; // addi r14,r0,238

IMEM[17] = 32'h016C7820; // add  r15,r11,r12
IMEM[18] = 32'h01EC8020; // add  r16,r15,r12
IMEM[19] = 32'h020F8820; // add  r17,r16,r15

IMEM[20] = 32'h0C00001A; // jal FUNC

IMEM[21] = 32'h201200AA; // addi r18,r0,AA
IMEM[22] = 32'h201300BB; // addi r19,r0,BB

IMEM[23] = 32'h0800001F; // j END

IMEM[24] = 32'h00000000; // nop
IMEM[25] = 32'h00000000; // nop

// FUNC
IMEM[26] = 32'h02319020; // add  r18,r17,r17
IMEM[27] = 32'h02529820; // add  r19,r18,r18
IMEM[28] = 32'h0273A020; // add  r20,r19,r19
IMEM[29] = 32'h03E00008; // jr r31
IMEM[30] = 32'h00000000; // nop

// END
IMEM[31] = 32'h0294A820; // add  r21,r20,r20
IMEM[32] = 32'h02B5B020; // add  r22,r21,r21
IMEM[33] = 32'h02D6B820; // add  r23,r22,r22

IMEM[34] = 32'hAC170028; // sw r23,40(r0)
IMEM[35] = 32'h8C180028; // lw r24,40(r0)

IMEM[36] = 32'h13000001; // beq r24,r0,+1
IMEM[37] = 32'h20190099; // addi r25,r0,99

IMEM[38] = 32'h0318C020; // add r24,r24,r24
IMEM[39] = 32'h0318C020; // add r24,r24,r24
IMEM[40] = 32'h0318C020; // add r24,r24,r24
IMEM[41] = 32'h0318C020; // add r24,r24,r24

IMEM[42] = 32'h0318C820; // add r25,r24,r24
IMEM[43] = 32'h0339D020; // add r26,r25,r25
IMEM[44] = 32'h035AD820; // add r27,r26,r26
IMEM[45] = 32'h037BE020; // add r28,r27,r27
IMEM[46] = 32'h039CE820; // add r29,r28,r28
IMEM[47] = 32'h03BDF020; // add r30,r29,r29
    end
    
    assign Instruction = IMEM[PC>>2];
    
endmodule
