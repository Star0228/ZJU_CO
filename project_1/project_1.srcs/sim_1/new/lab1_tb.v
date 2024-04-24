`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/25 15:31:59
// Design Name: 
// Module Name: lab1_tb
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


module lab1_tb;
wire [31:0]out1;
wire [31:0]out2;
wire [31:0]out3;
wire [31:0]out4;
MUX1 mux1_s(
.out1(out1),
.out2(out2),
.out3(out3),
.out4(out4)
    );
    
endmodule
