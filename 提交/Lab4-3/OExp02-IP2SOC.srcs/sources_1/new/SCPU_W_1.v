`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/24 19:06:31
// Design Name: 
// Module Name: SCPU_W
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


module SCPU_W_1(
  input wire clk,
  input wire rst,
  input wire MIO_ready,
  input wire int,
  input wire [31:0]inst_in,
  input wire [31:0]Data_in,
  output wire CPU_MIO,
  output wire MemRW,
  output wire [31:0]PC_out,
  output wire [31:0]Data_out,
  output wire [31:0]Addr_out,
  output wire [31:0]mstatus,
  output wire [31:0]mtvec,
  output wire [31:0]mcause,
  output wire [31:0]mtval,
  output wire [31:0]mepc,
  output wire [3:0]wea,
      output wire [31:0] Reg00,
    output wire [31:0] Reg01,
    output wire [31:0] Reg02,
    output wire[31:0] Reg03,
    output wire[31:0] Reg04,
    output wire[31:0] Reg05,
    output wire[31:0] Reg06,
    output wire[31:0] Reg07,
    output wire[31:0] Reg08,
    output wire[31:0] Reg09,
    output wire[31:0] Reg10,
    output wire[31:0] Reg11,
    output wire[31:0] Reg12,
    output wire[31:0] Reg13,
    output wire[31:0] Reg14,
    output wire[31:0] Reg15,
    output wire[31:0] Reg16,
    output wire[31:0] Reg17,
    output wire[31:0] Reg18,
    output wire[31:0] Reg19,
    output wire[31:0] Reg20,
    output wire[31:0] Reg21,
    output wire[31:0] Reg22,
    output wire[31:0] Reg23,
    output wire[31:0] Reg24,
    output wire[31:0] Reg25,
    output wire[31:0] Reg26,
    output wire[31:0] Reg27,
    output wire[31:0] Reg28,
    output wire[31:0] Reg29,
    output wire[31:0] Reg30,
    output wire[31:0] Reg31

);


  wire[2:0]ImmSel;
  wire ALUSrc_B;
    wire[2:0] MemtoReg;
    wire [1:0]Jump;
    wire Branch;
    wire RegWrite;
    wire[3:0]ALU_Control;
  wire     Branch_Beq;
  wire     Branch_Bne;
  wire      Branch_Blt;
  wire     Branch_Bltu;
  wire     Branch_Bge;
  wire     Branch_Bgeu;
  wire     [2:0]  Length;

wire illegal_inst;
wire ecall;
wire mret;
wire CsrWrite;
wire INT;

  SCPU_ctrl_W SCPU_ctrl1(
    .OPcode(inst_in[6:2]), 
    .Fun3(inst_in[14:12]), 
    .Fun7(inst_in[30]),
    .int(int),
    .mert_check(inst_in[29:28]),
    .MIO_ready(MIO_ready), 
    .ImmSel(ImmSel), 
    .ALUSrc_B(ALUSrc_B), 
    .MemtoReg(MemtoReg), 
    .Jump(Jump), 
    .Branch_Beq(Branch_Beq),
    .Branch_Bne(Branch_Bne),
    .Branch_Blt(Branch_Blt),
    .Branch_Bltu(Branch_Bltu),
    .Branch_Bge(Branch_Bge),
    .Branch_Bgeu(Branch_Bgeu),
    .Length(Length),
    .RegWrite(RegWrite), 
    .MemRW(MemRW), 
    .ALU_Control(ALU_Control), 
    .illegal_inst(illegal_inst),
    .ecall(ecall),
    .mret(mret),
    .CsrWrite(CsrWrite),  
    .INT(INT),
    .CPU_MIO(CPU_MIO)
    );
  DataPath_W DataPath1(
    .clk(clk), 
    .rst(rst), 
    .inst_field(inst_in), 
    .Data_in(Data_in),
    .ALU_Control(ALU_Control), 
    .ImmSel(ImmSel),
    .MemtoReg(MemtoReg), 
    .ALUSrc_B(ALUSrc_B), 
    .Jump(Jump),
    .Branch_Beq(Branch_Beq),
    .Branch_Bne(Branch_Bne),
    .Branch_Blt(Branch_Blt),
    .Branch_Bltu(Branch_Bltu),
    .Branch_Bge(Branch_Bge),
    .Branch_Bgeu(Branch_Bgeu),
    .Length(Length),
    .RegWrite(RegWrite), 
    .PC_out(PC_out), 
    .Data_out(Data_out), 
    .ALU_out(Addr_out),
    .illegal_inst(illegal_inst),
    .ecall(ecall),
    .mret(mret),
    .INT(INT),
    .CsrWrite(CsrWrite),
    .mstatus(mstatus),
    .mtvec(mtvec),
    .mcause(mcause),
    .mtval(mtval),
    .mepc(mepc),
    .wea(wea),
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


endmodule


