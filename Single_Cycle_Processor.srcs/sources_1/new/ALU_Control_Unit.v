`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 22:10:26
// Design Name: 
// Module Name: ALU_Control_Unit
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


module ALU_Control_Unit(
    input [2:0] ALUop,
    input [5:0] funct,
    
    output reg [3:0] ALUCtrl,
    output reg Jumpreg
    );
    
    always@(*)
    begin
    
        Jumpreg = 1'b0;
        
        case(ALUop)
            3'b000 :
            begin
                ALUCtrl = 4'b0000;
            end
            
            3'b001 :
            begin
                ALUCtrl = 4'b0001;
            end
            
            3'b010 :
            begin
                case(funct)
                    6'b100000 : 
                    begin
                        ALUCtrl = 4'b0000;
                    end
                    
                    6'b100010 : 
                    begin
                        ALUCtrl = 4'b0001;
                    end
                    
                    6'b100100 : 
                    begin
                        ALUCtrl = 4'b0010;
                    end
                    
                    6'b100101 : 
                    begin
                        ALUCtrl = 4'b0011;
                    end
                    
                    6'b100110 : 
                    begin
                        ALUCtrl = 4'b0100;
                    end
                    
                    6'b101010 : 
                    begin
                        ALUCtrl = 4'b0101;
                    end
                    
                    6'b000000 : 
                    begin
                        ALUCtrl = 4'b0110;
                    end
                    
                    6'b000010 : 
                    begin
                        ALUCtrl = 4'b0111;
                    end
                    
                    6'b001000 :
                    begin
                        ALUCtrl = 4'bxxxx;
                        Jumpreg = 1'b1;
                    end
                    
                    default :
                    begin
                        ALUCtrl = 4'bxxxx;
                    end
                endcase
            end
            
            3'b011 : 
            begin
                ALUCtrl = 4'b0011;
            end
            
            3'b100 : 
            begin
                ALUCtrl = 4'b0100;
            end
            
            default :
            begin
                ALUCtrl = 4'bxxxx;
            end
        endcase
    end
endmodule
