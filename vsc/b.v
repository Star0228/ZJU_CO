module RV_INT(
    input       clk,
    input       rst,
    input       INT,              // 外部中断信号
    input       ecall,            // ECALL 指令
    input       mret,             // MRET 指令
    input       illegal_inst,     // 非法指令信号
    input [31:0] pc_current,      // 当前指令 PC 值

    input       CSR_add,
    input       CSR_wdata,         // CSR 寄存器写入数据
    output       CSR_rdata,       // 读出的 CSR 寄存器数据

    output       en,              // 用于控制寄存器堆、内存等器件的写使能
    output[31:0] pc               // 将执行的指令 PC 值
);



CSRRegs U4(
    .clk(clk),
    .rst(rst),
    .raddr(CSR_add),
    .waddr(CSR_add),
    .wdata(CSR_wdata),
    .rdata(CSR_rdata),
    .csr_w(CsrWrite),
    .csr_wsc_mode(2'b00),
    .expt_int(1'b0),
    .mepc_bypasss_in(32'b0),
    .mscause_bypass_in(32'b0),
    .mtval_bypass_in(32'b0),
);


always@(posedge clk)begin
if(INT|ecall|illegal_inst)begin
    en<=1'b0;
    pc<=32'd0;
end
else begin
    en<=1'b1;
    pc<=pc_current;
end

end


endmodule