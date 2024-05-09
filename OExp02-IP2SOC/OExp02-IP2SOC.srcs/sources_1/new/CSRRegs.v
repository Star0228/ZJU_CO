`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/08 00:52:57
// Design Name: 
// Module Name: RV_INT
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

module CSRRegs(
    input clk, rst,
    input[11:0] raddr, waddr,       // ����д CSR �Ĵ����ĵ�ַ
    input[31:0] wdata,              // д�� CSR �Ĵ���������
    input csr_w,                    // дʹ��
    input[1:0] csr_wsc_mode,        // д�� CSR �Ĵ�����ģʽ
    output  [31:0] rdata,             // ���� CSR �Ĵ���������
    output wire [31:0]mstatus,
    output wire [31:0]mtvec,
    output wire [31:0]mcause,
    output wire [31:0]mtval,
    output wire [31:0]mepc
);
//mstatus, mtvec, mcause, mtval, mepc


reg [31:0]tem[1:5];
assign mstatus = tem[1];
assign mtvec = tem[2];
assign mcause = tem[3];
assign mtval = tem[4];
assign mepc = tem[5];

initial begin
  tem[1]<=32'd1;
  tem[2]<=32'd2;
  tem[3]<=32'h8;
  tem[4]<=32'd8;
  tem[5]<=32'd16;
end
reg [31:0] tem_rdata;
assign rdata = tem_rdata;
always @(posedge clk) begin
  if(raddr == 12'h300)begin
    tem_rdata = tem[1];
  end
  else if(raddr == 12'h305)begin
    tem_rdata = tem[2];
  end
  else if(raddr == 12'h342)begin
    tem_rdata = tem[3];
  end
  else if(raddr == 12'h343)begin
    tem_rdata = tem[4];
  end
  else if(raddr == 12'h341)begin
    tem_rdata = tem[5];
  end
end
always @(posedge ~clk) begin

    if(csr_w&&~rst)begin
        if(waddr == 12'h300)begin
            tem[1] <= wdata;
            end
        else if(waddr == 12'h305)begin
         tem[2] <= wdata;
        end
        else if(waddr == 12'h342)begin
        tem[3] <= wdata;
        end
        else if(waddr == 12'h343)begin
                tem[4] <= wdata;
            end
        else if(waddr == 12'h341)begin
            tem[5] <= wdata;
         end
    end
     else if(rst)begin
    tem[1]<=32'd1;
    tem[2]<=32'd2;
    tem[3]<=32'h8;
    tem[4]<=32'd8;
    tem[5]<=32'd16;
  end
  end





endmodule