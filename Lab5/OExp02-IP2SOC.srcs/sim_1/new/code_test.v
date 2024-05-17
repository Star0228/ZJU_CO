`timescale 1ns / 1ps
module code_test;
    reg clk;
    reg rst;
    initial begin
    clk = 1'b0;
    rst = 1'b1;
    #5;
    rst = 1'b0;
    end
always #50 clk = ~clk;

/* SCPU 中接出 */
wire [31:0] Addr_out;
wire [31:0] Data_out;
wire CPU_MIO;
wire MemRW;
wire [31:0] PC_out;
    wire [3:0] wea;
/* RAM 接出 */
wire [31:0] douta;
/* ROM_in_testbench 接出 */
wire [31:0] spo;
wire [8*30:1] inst_msg;

SCPU_W_1 u0(
    .clk(clk),
    .rst(rst),
    .Data_in(douta),
    .MIO_ready(CPU_MIO),
    .inst_in(spo),
    .Addr_out(Addr_out),
    .Data_out(Data_out),
    .CPU_MIO(CPU_MIO),
    .MemRW(MemRW),
    .PC_out(PC_out),
    .wea(wea)
);

RAM_1 u1(
    .clka(~clk),
    .wea({4{MemRW}} & wea),
    .addra(Addr_out[11:2]),
    .dina(Data_out),
    .douta(douta)
);

ROM_1 u2(
    .a(PC_out[11:2]),
    .spo(spo),
    .inst_msg(inst_msg)
);
endmodule // tesebench

module ROM_1(
    input [9:0] a,
    output [31:0] spo,
    output [8*30:1] inst_msg
);

reg[8*30:1] inst_string[0:47];
reg[31:0] inst [0:1023];

assign spo = inst[a];
assign inst_msg = inst_string[a];
// Initial inst
initial begin
    inst[0] <= 32'h00000097;
    inst[1] <= 32'h0240006F;
    inst[2] <= 32'h00000013;
    inst[3] <= 32'h00000013;
    inst[4] <= 32'h00000013;
    inst[5] <= 32'h00000013;
    inst[6] <= 32'h00000013;
    inst[7] <= 32'h00000013;
    inst[8] <= 32'h00000013;
    inst[9] <= 32'hFE5FF06F;
    inst[10] <= 32'hFE0090E3;
    inst[11] <= 32'h02300293;
    inst[12] <= 32'h005283B3;
    inst[13] <= 32'h00538023;
    inst[14] <= 32'h00000F93;
    inst[15] <= 32'h00000F17;
    inst[16] <= 32'h000002B3;
    inst[17] <= 32'h00500293;
    inst[18] <= 32'h00429293;
    inst[19] <= 32'h005380A3;
    inst[20] <= 32'h00000313;
    inst[21] <= 32'h02010337;
    inst[22] <= 32'h00431313;
    inst[23] <= 32'h00039383;
    inst[24] <= 32'h00730333;
    inst[25] <= 32'hFA0002E3; // 这里填充剩下的机器码
end
//Initial inst_string
initial begin
    inst_string[0] <= "auipc x1, 0";
    inst_string[1] <= "j start # 00";
    inst_string[2] <= "nop # 04";
    inst_string[3] <= "nop # 08";
    inst_string[4] <= "nop # 0C";
    inst_string[5] <= "nop # 10";
    inst_string[6] <= "nop # 14";
    inst_string[7] <= "nop # 18";
    inst_string[8] <= "nop # 1C";
    inst_string[9] <= "j dummy";
    inst_string[10] <= "bnez x1, dummy";
    inst_string[11] <= "addi x5, x0, 0x23";
    inst_string[12] <= "add x7, x5, x5";
    inst_string[13] <= "sb x5, 0(x7)";
    inst_string[14] <= "li x31, 0";
    inst_string[15] <= "auipc x30, 0";
    inst_string[16] <= "add x5, x0, x0";
    inst_string[17] <= "addi x5, x0, 0x05";
    inst_string[18] <= "slli x5, x5, 0x4";
    inst_string[19] <= "sb x5, 1(x7)";
    inst_string[20] <= "li x6, 0";
    inst_string[21] <= "lui x6, 0x2010";
    inst_string[22] <= "slli x6, x6, 0x4";
    inst_string[23] <= "lh x7, 0(x7)";
    inst_string[24] <= "add x6, x6, x7";
    inst_string[25] <= "beq x0, x0, dummy";
end
endmodule 