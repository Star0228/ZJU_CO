`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/20 13:56:30
// Design Name: 
// Module Name: multiplier_tb
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

module multiplier_tb;

  reg clk, start;
  reg[31:0] A;
  reg[31:0] B;

  wire finish;
  wire[63:0] res;

  multiplier m0(.clk(clk), .start(start), .A(A), .B(B), .finish(finish), .res(res));

  initial begin
    $dumpfile("multiplier_signed.vcd");
    $dumpvars(0, multiplier_tb);

    clk = 0;
    start = 0;
    #10;
    A = 32'd1;
    B = 32'd0;
    #10 start = 1;
    #10 start = 0;
    #300;

    A = 32'd10;
    B = 32'd30;
    #10 start = 1;
    #10 start = 0;
    #300;

    A = 32'd66;
    B = -32'd23;
    #10 start = 1;
    #10 start = 0;
    #300;
    
    A = -32'd1;
    B = 32'd500;
    #10 start = 1;
    #10 start = 0;
    #300;
    
    A = -32'd1;
    B = -32'd28;
    #10 start = 1;
    #10 start = 0;
    #300;
    $finish();
  end

  always begin
    #2 clk = ~clk;
  end



endmodule