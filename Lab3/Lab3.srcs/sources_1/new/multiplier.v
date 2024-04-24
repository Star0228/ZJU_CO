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

  reg state; // ��¼ multiplier �ǲ������ڽ�������
  reg[31:0] multiplicand; // ���浱ǰ�����еı�����
  reg[5:0] cnt; // ��¼��ǰ�����Ѿ������˼������ڣ���������λ��
  // wire[5:0] cnt_next = cnt + 6'b1;
  reg sign = 0; // ��¼��ǰ����Ľ���Ƿ��Ǹ���
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
      res = res >> 1;//�з���or�޷���
    end

    // ��д cnt ��ص����ݣ��� cnt �鿴��ǰ�����Ƿ����
    if(cnt==6'd31) begin
      // �õ����
      cnt <= 6'd0;
      finish <= 1;
      state <= 0;
   res[63:0]<= sign?~res[63:0]+64'b1:res;
    end
  end

endmodule