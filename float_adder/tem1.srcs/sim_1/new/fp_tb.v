`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/23 15:05:38
// Design Name: 
// Module Name: fp_tb
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


module fp_tb;
reg clk = 0;
reg [31:0]a= {1'b0,8'd125,23'b0};//0.25
reg [31:0]b= {1'b0,8'd125,23'b0};//0.25
wire [31:0]sum; 
fd_adder m1(.clk(clk),.a(a),.b(b),.sum(sum));
always begin
#2 clk = ~clk;
end
initial begin
#50 a=32'h3E000000;//0.125
#50 b=32'h3E000000;//0.125

#50 a=32'h3E000000;//0.25
#50 b=32'hBE000000;//0.125

#50 a=32'h80000001;//denormal
#50 b=32'hBE000000;//-0.125
end


endmodule
