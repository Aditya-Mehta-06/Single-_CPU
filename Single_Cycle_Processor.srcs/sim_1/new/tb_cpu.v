`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 23:12:13
// Design Name: 
// Module Name: tb_cpu
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


module tb_cpu;

    reg clk;
    reg reset;
    wire [31:0] PC_out;
    wire [31:0] Instruction_out;
    
    CPU_Single_Cycle dut (.clk(clk), .reset(reset), .PC_out(PC_out), .Instruction_out(Instruction_out));
    
    initial begin
        {clk, reset} = 0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        reset = 1'b1;
        #10;
        reset = 1'b0;
        
        #600;
        $finish;
    end
endmodule
