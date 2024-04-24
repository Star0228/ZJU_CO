`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/20 15:13:30
// Design Name: 
// Module Name: divider
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

module divider(
    input   clk,
    input   rst,
    input   start,          // ��ʼ����
    input[31:0] dividend,   // ������
    input[31:0] divisor,    // ����
    output reg divide_zero,     // �����쳣
    output  reg finish,         // ��������ź�
    output reg [31:0] res,       // ��
    output reg [31:0] rem        // ����
);
 reg state; // ��¼ multiplier �ǲ������ڽ�������
  reg[5:0] cnt; // ��¼��ǰ�����Ѿ������˼������ڣ���������λ��
  reg [63:0]reminder;
  reg tem;
  initial begin
    res <= 0;
    rem <=0;
    state <= 0;
    finish <= 0;
    cnt <= 0;
    divide_zero <= 0;
    finish<=0;
    reminder<=64'b0;
  end

  always @(posedge clk) begin
    if(rst)begin
    res <=32'b0;
    rem <= 32'b0;
    end
    if(divisor ==32'b0)begin
      finish<=1;
      divide_zero<=1;
    end
    if(divisor !=32'b0) begin
      if(~state && start) begin
        // Not Running
        finish<= 0;
        state <=1;
        cnt <= 6'b0;
        divide_zero<=0;
        reminder <= {32'b0,dividend}<<1;
      end 
      else if(state) begin
        reminder = reminder-{divisor,32'b0};
        tem =reminder[63];
        reminder = tem?(reminder + {divisor,32'b0})<<1:reminder<<1;
        reminder[0] = tem?0:1;
        cnt <=cnt+1'b1;
      end
          res <= reminder[31:0];
        rem <= reminder[63:32]>>1;
      // ��д cnt ��ص����ݣ��� cnt �鿴��ǰ�����Ƿ����

    end
          if(cnt ==6'd31) begin
        // �õ����
        cnt <= 6'd0;
        finish <= 1;
        state <= 0;

      end
    end
    

endmodule

