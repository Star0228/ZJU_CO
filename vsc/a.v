`timescale 1ns / 1ps
module CSRRegs(
    input clk, rst,
    input[11:0] raddr, waddr,       // 读、写 CSR 寄存器的地址
    input[31:0] wdata,              // 写入 CSR 寄存器的数据
    input csr_w,                    // 写使能
    input[1:0] csr_wsc_mode,        // 写入 CSR 寄存器的模式
    output reg [31:0] rdata,             // 读出 CSR 寄存器的数据


    input expt_int,             // 是否有异常中断
    // 旁路输入
    input [31:0]mepc_bypasss_in,
    input [31:0]mscause_bypass_in,
    input [31:0]mtval_bypass_in,
    // mstatus 可以由外部输入，也可以在 CSR 模块内进行修改。


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
assign mepc = tem[5];

initial begin
  tem[1]<=32'd1;
  tem[2]<=32'd2;
  tem[3]<=32'd4;
  tem[4]<=32'd8;
  tem[5]<=32'd16;
end

always @(posedge clk) begin
  rdata = tem[raddr];
  if(rst)begin
    tem[1]<=32'd1;
    tem[2]<=32'd2;
    tem[3]<=32'd4;
    tem[4]<=32'd8;
    tem[5]<=32'd16;
  end
  // if(csr_w&&!rst)begin
  //   tem[Wt_addr] <= Wt_data;
  // end
end
always @(negedge clk) begin
    if(csr_w&&!rst)begin
    tem[Wt_addr] <= Wt_data;
    end
  end


endmodule