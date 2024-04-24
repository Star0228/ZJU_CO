/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/05 23:05:43
// Design Name: 
// Module Name: ALU_tb
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

`timescale 1ns / 1ps
//bound -----A/B changed will cause error
module ALU_tb;
    reg [31:0]  A, B;
    reg [3:0]   ALU_operation;
    wire[31:0]  res;
    wire        zero;
    ALU ALU_u(
        .A(A),
        .B(B),
        .ALU_operation(ALU_operation),
        .res(res),
        .zero(zero)
    );

    initial begin
        A=32'hA5A5A5A5;
        B=32'h5A5A5A5A;
        ALU_operation =4'b1111;
        #20;
        ALU_operation =4'b1001;
        #20;
        A = 32'h0f000000;
        B = 32'h0f000f00;
        #20;
        ALU_operation =4'b1000;
        #20;
        A = 32'h000f0000;
        B = 32'h0f000f00;
        #20;
        ALU_operation =4'b0111;
        #20;
        A = 32'hf0000000;
        B = 32'h0000000f;
        #20;
        ALU_operation =4'b0110;
        #20;
        A = 32'hf0000000;
        B = 32'h000000ff;
        #20;
        ALU_operation =4'b0101;
        #20;
        A = 32'hf0000000;
        B = 32'h000000ff;
        #20;
        ALU_operation =4'b0100;
        #20;
        A = 32'hf0000000;
        B = 32'h000000ff;
        #20;        
        ALU_operation =4'b0011;
        #20;
        A = 32'hf0000000;
        B = 32'h000000ff;
        #20;        
        ALU_operation =4'b0010;
        #20;
        A = 32'hf0000000;
        B = 32'h000000ff;
        #20;
        ALU_operation =4'b0001;
        #20;
        A = 32'hf0000000;
        B = 32'h000000ff;
        #20;
        ALU_operation =4'b0000;
        #20;
        A = 32'hf0000000;
        B = 32'h000000ff;
        #20;
    end
endmodule