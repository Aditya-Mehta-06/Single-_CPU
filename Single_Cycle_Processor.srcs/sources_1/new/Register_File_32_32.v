`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 10:34:09
// Design Name: 
// Module Name: Register_File_32_32
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


module Register_File_32_32(
    input clk,
    input RegWrite, // 1 --> Write
    
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    
    input [4:0] WriteReg,
    input [31:0] WriteData,
    
    output reg [31:0] ReadData1,
    output reg [31:0] ReadData2
    );
    
    reg [31:0] Reg [0:31];
    
    initial begin
     /*   Reg[0] = 0;
        Reg[1] = 10;
        Reg[2] = 20;
        Reg[3] = 5;
        Reg[4] = 69;
        Reg[5] = 18;
        Reg[6] = 3; */
        
        Reg[0] = 0;
        Reg[1] = 0;
        Reg[2] = 0;
        Reg[3] = 0;
        Reg[4] = 0;
        Reg[5] = 0;
        Reg[6] = 0;
        Reg[7] = 0;
        Reg[8] = 0;
        Reg[9] = 0;
        Reg[10] = 0;
        Reg[11] = 0;
        Reg[12] = 0;
        Reg[13] = 0;
        Reg[14] = 0;
        Reg[15] = 0;
        Reg[16] = 0;
        Reg[17] = 0;
        Reg[18] = 0;
        Reg[19] = 0;
        Reg[20] = 0;
        Reg[21] = 0;
        Reg[22] = 0;
        Reg[23] = 0;
        Reg[24] = 0;
        Reg[25] = 0;
        Reg[26] = 0;
        Reg[27] = 0;
        Reg[28] = 0;
        Reg[29] = 0;
        Reg[30] = 0;
        Reg[31] = 0;
    end
    
    always@(posedge clk)
    begin
        if(RegWrite && WriteReg != 0)
        begin
            Reg[WriteReg] <= WriteData;
        end 
    end 
    
    always@(*)
    begin
        ReadData1 = Reg[ReadReg1];
        
        ReadData2 = Reg[ReadReg2];
    end
endmodule
