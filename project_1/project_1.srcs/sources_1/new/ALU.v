`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/08 10:21:37
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [2:0] A,
    input [2:0] B,
    input [3:0] ALU_operation,
    output [2:0] res
);

    assign res = (ALU_operation == 4'd6) ? A+ B :                            // SRL Logic
                (ALU_operation == 4'd7) ? ($signed(A) >>> $signed(B)) :        // SRA Arithmetic
                2'd0;
endmodule
