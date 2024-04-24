`timescale 1ns / 1ns

module Regs_tb;
    reg clk;
    reg rst;
    reg [4:0] Rs1_addr; 
    reg [4:0] Rs2_addr; 
    reg [4:0] Wt_addr; 
    reg [31:0]Wt_data; 
    reg RegWrite; 
    wire [31:0] Rs1_data; 
    wire [31:0] Rs2_data;
    wire [31:0] Reg00;
    wire [31:0] Reg01;
    wire [31:0] Reg02;
    wire [31:0] Reg03;
    wire [31:0] Reg04;
    wire [31:0] Reg05;
    wire [31:0] Reg06;
    wire [31:0] Reg07;
    wire [31:0] Reg08;
    wire [31:0] Reg09;
    wire [31:0] Reg10;
    wire [31:0] Reg11;
    wire [31:0] Reg12;
    wire [31:0] Reg13;
    wire [31:0] Reg14;
    wire [31:0] Reg15;
    wire [31:0] Reg16;
    wire [31:0] Reg17;
    wire [31:0] Reg18;
    wire [31:0] Reg19;
    wire [31:0] Reg20;
    wire [31:0] Reg21;
    wire [31:0] Reg22;
    wire [31:0] Reg23;
    wire [31:0] Reg24;
    wire [31:0] Reg25;
    wire [31:0] Reg26;
    wire [31:0] Reg27;
    wire [31:0] Reg28;
    wire [31:0] Reg29;
    wire [31:0] Reg30;
    wire [31:0] Reg31;
    Regs Regs_U(
        .clk(clk),
        .rst(rst),
        .Rs1_addr(Rs1_addr),
        .Rs2_addr(Rs2_addr),
        .Wt_addr(Wt_addr),
        .Wt_data(Wt_data),
        .RegWrite(RegWrite),
        .Rs1_data(Rs1_data),
        .Rs2_data(Rs2_data),
        .Reg00(Reg00),
        .Reg01(Reg01),
        .Reg02(Reg02),
        .Reg03(Reg03),
        .Reg04(Reg04),
        .Reg05(Reg05),
        .Reg06(Reg06),
        .Reg07(Reg07),
        .Reg08(Reg08),
        .Reg09(Reg09),
        .Reg10(Reg10),
        .Reg11(Reg11),
        .Reg12(Reg12),
        .Reg13(Reg13),
        .Reg14(Reg14),
        .Reg15(Reg15),
        .Reg16(Reg16),
        .Reg17(Reg17),
        .Reg18(Reg18),
        .Reg19(Reg19),
        .Reg20(Reg20),
        .Reg21(Reg21),
        .Reg22(Reg22),
        .Reg23(Reg23),
        .Reg24(Reg24),
        .Reg25(Reg25),
        .Reg26(Reg26),
        .Reg27(Reg27),
        .Reg28(Reg28),
        .Reg29(Reg29),
        .Reg30(Reg30),
        .Reg31(Reg31)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 1;
        rst = 1;
        RegWrite = 0;
        Wt_data = 0;
        Wt_addr = 0;
        Rs1_addr = 0;
        Rs2_addr = 0;
        #20;
        rst = 0;
        RegWrite = 1;
        Wt_addr = 5'd6;
        Wt_data = 32'ha5a5a5a5;
        #10;
        Wt_data = 32'h11111111;
        #10;
        RegWrite = 0;
        Rs1_addr = 6;
        Rs2_addr = 2;
        #20;
        RegWrite = 1;
        Wt_addr = 5'd2;
        Wt_data = 32'hffffffff;
        #20;
        Wt_addr = 5'd0;
        #20;
        RegWrite = 0;
        rst=1;
        #100 $stop();
    end

endmodule