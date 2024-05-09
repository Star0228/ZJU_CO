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

module RV_INT(
    input       clk,
    input       rst,
    input       INT,              // �ⲿ�ж��ź�
    input       ecall,            // ECALL ָ��
    input       mret,             // MRET ָ��
    input       illegal_inst,     // �Ƿ�ָ���ź�
    input [31:0] pc_current,      // ��ǰָ�� PC ֵ

    input   CsrWrite,
    input       [11:0]CSR_add,
    input       [31:0]CSR_wdata,         // CSR �Ĵ���д������
    output      wire [31:0]CSR_rdata,       // ������ CSR �Ĵ�������
    output wire [31:0]mstatus,
    output wire [31:0]mtvec,
    output wire [31:0]mcause,
    output wire [31:0]mtval,
    output wire [31:0]mepc,
    output reg tem_mstatus,



    output   reg    en,              // ���ڿ��ƼĴ����ѡ��ڴ��������дʹ��?
    output reg [31:0] pc               // ��ִ�е�ָ�� PC ֵ
);



CSRRegs U4(
    .clk(clk),
    .rst(rst),
    .raddr(CSR_add),
    .waddr(CSR_add),
    .wdata(CSR_wdata),
    .rdata(CSR_rdata),
    .csr_w(CsrWrite),
    .mstatus(mstatus),
    .mtvec(mtvec),
    .mcause(mcause),
    .mtval(mtval),
    .mepc(mepc)
);
initial begin
    tem_mstatus<=1'b0;
end
reg [31:0]tem_mcause;
reg [31:0]tem_mepc;
always@(negedge clk)begin

if(tem_mstatus==1'b0)begin
tem_mcause <= INT?32'd1:ecall?32'd2:illegal_inst?32'd3:32'd0;
    if(INT||ecall||illegal_inst)begin
        tem_mepc<=pc_current;
        tem_mstatus<=1'b1;
        pc<=mtvec;
    end
end

else if(mret)begin
    tem_mstatus<=1'b0;
    case(tem_mcause)
        32'd1:begin
            pc <= tem_mepc;
        end
        32'd2:begin
            pc <= tem_mepc+32'd4;
        end
        32'd3:begin
            pc <= tem_mepc + 32'd4;
        end
    endcase
end
else if(tem_mstatus||mret)begin
    pc<=pc+32'd4;
end
else begin
    en<=1'b1;
    pc<=pc_current;
end

end


endmodule