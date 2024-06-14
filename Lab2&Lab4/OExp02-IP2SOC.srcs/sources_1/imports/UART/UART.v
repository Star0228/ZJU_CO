`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/03/20 13:26:59
// Design Name:
// Module Name: UART
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


module UART(
    input clk,
    input rst,
    input [31:0] pc,
    input [31:0] inst,
    input [31:0] x0,
    input [31:0] ra,
    input [31:0] sp,
    input [31:0] gp,
    input [31:0] tp,
    input [31:0] t0,
    input [31:0] t1,
    input [31:0] t2,
    input [31:0] s0,
    input [31:0] s1,
    input [31:0] a0,
    input [31:0] a1,
    input [31:0] a2,
    input [31:0] a3,
    input [31:0] a4,
    input [31:0] a5,
    input [31:0] a6,
    input [31:0] a7,
    input [31:0] s2,
    input [31:0] s3,
    input [31:0] s4,
    input [31:0] s5,
    input [31:0] s6,
    input [31:0] s7,
    input [31:0] s8,
    input [31:0] s9,
    input [31:0] s10,
    input [31:0] s11,
    input [31:0] t3,
    input [31:0] t4,
    input [31:0] t5,
    input [31:0] t6,
    output tx
  );

  reg[31:0] clock_cnt = 0;
  reg start;

  always @(posedge clk)
  begin
    if(clock_cnt == 32'd10000000)
    begin
      clock_cnt <= 0;
      start <= 1'b1;
    end
    else
    begin
      clock_cnt <= clock_cnt + 32'b1;
      start <= 1'b0;
    end
  end

  uart_display uart_display (
                 .clk(clk),
                 .rst(rst),
                 .start(start),
                 .tx(tx),
                 .pc(pc),
                 .inst(inst),
                 .x0(x0),
                 .ra(ra),
                 .sp(sp),
                 .gp(gp),
                 .tp(tp),
                 .t0(t0),
                 .t1(t1),
                 .t2(t2),
                 .s0(s0),
                 .s1(s1),
                 .a0(a0),
                 .a1(a1),
                 .a2(a2),
                 .a3(a3),
                 .a4(a4),
                 .a5(a5),
                 .a6(a6),
                 .a7(a7),
                 .s2(s2),
                 .s3(s3),
                 .s4(s4),
                 .s5(s5),
                 .s6(s6),
                 .s7(s7),
                 .s8(s8),
                 .s9(s9),
                 .s10(s10),
                 .s11(s11),
                 .t3(t3),
                 .t4(t4),
                 .t5(t5),
                 .t6(t6)
               );

endmodule
