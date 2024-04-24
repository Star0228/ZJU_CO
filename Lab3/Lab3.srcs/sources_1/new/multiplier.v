`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/20 13:55:37
// Design Name: 
// Module Name: multiplier
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
module multiplier(
  input clk,
  input start,
  input[31:0] A,
  input[31:0] B,
  output reg finish,
  output reg[63:0] res
);

  reg state; // 记录 multiplier 是不是正在进行运算
  reg[31:0] multiplicand; // 保存当前运算中的被乘数
  reg[5:0] cnt; // 记录当前计算已经经历了几个周期（运算与移位）
  // wire[5:0] cnt_next = cnt + 6'b1;
  reg sign = 0; // 记录当前运算的结果是否是负数
 wire [31:0]AA;
  wire [31:0]BB;
  initial begin
    res <= 0;
    state <= 0;
    finish <= 0;
    cnt <= 6'b0;
    multiplicand <= 32'b0;
//    AA<=32'b0;
//    BB<=32'b0;
  end
assign AA = A[31]? ~A+32'b1:A;
assign BB =B[31]? ~B+32'b1:B;
  always @(posedge clk) begin
    if(~state && start) begin
      // Not Running
//      AA<=A[31]? ~A+32'b1:A;
//      BB<=B[31]? ~B+32'b1:B;
      multiplicand <= AA;
      res[63:0] <= {32'b0,BB[31:0]};
      sign <= A[31]^B[31];
      state <= 1'b1;
      finish <= 0;
      cnt <= 6'd0;
    end else if(state) begin
      cnt <= cnt+1'b1;
      res[63:32] = res[0]?res[63:32]+multiplicand:res[63:32];
      res = res >> 1;//有符号or无符号
    end

    // 填写 cnt 相关的内容，用 cnt 查看当前运算是否结束
    if(cnt==6'd31) begin
      // 得到结果
      cnt <= 6'd0;
      finish <= 1;
      state <= 0;
   res[63:0]<= sign?~res[63:0]+64'b1:res;
    end
  end

endmodule