`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/04 23:53:39
// Design Name: 
// Module Name: DataPath_W
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


module DataPath_W(
  input clk,
  input rst,
  input [31:0]inst_field,//instruction field
  input [31:0]Data_in,//memory in data


  input [2:0]  ImmSel,
  input   ALUSrc_B,
  input [2:0]  MemtoReg,
  input [1:0] Jump,
  input     Branch_Beq,
  input      Branch_Bne,
  input      Branch_Blt,
  input     Branch_Bltu,
  input     Branch_Bge,
  input     Branch_Bgeu,
  input     [2:0]  Length,
  input     RegWrite,
  input  [3:0] ALU_Control,

  output reg [31:0]PC_out,//next PC/NOW PC
  output wire [31:0]Data_out,//store data out
  output wire [31:0]ALU_out,//ALU out
  output wire [3:0]wea,


    output [31:0] Reg00,
    output [31:0] Reg01,
    output [31:0] Reg02,
    output [31:0] Reg03,
    output [31:0] Reg04,
    output [31:0] Reg05,
    output [31:0] Reg06,
    output [31:0] Reg07,
    output [31:0] Reg08,
    output [31:0] Reg09,
    output [31:0] Reg10,
    output [31:0] Reg11,
    output [31:0] Reg12,
    output [31:0] Reg13,
    output [31:0] Reg14,
    output [31:0] Reg15,
    output [31:0] Reg16,
    output [31:0] Reg17,
    output [31:0] Reg18,
    output [31:0] Reg19,
    output [31:0] Reg20,
    output [31:0] Reg21,
    output [31:0] Reg22,
    output [31:0] Reg23,
    output [31:0] Reg24,
    output [31:0] Reg25,
    output [31:0] Reg26,
    output [31:0] Reg27,
    output [31:0] Reg28,
    output [31:0] Reg29,
    output [31:0] Reg30,
    output [31:0] Reg31
);

wire [31:0] Rs1_data, Rs2_data;
reg [31:0] Wt_data;

Regs U1(
  .clk(clk),
  .rst(rst),
  .Rs1_addr(inst_field[19:15]),
  .Rs2_addr(inst_field[24:20]),
  .Wt_addr(inst_field[11:7]),
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
wire [31:0] Imm_out;
ImmGen U2(
  .inst_field(inst_field),
  .ImmSel(ImmSel),
  .Imm_out(Imm_out)
);
wire [31:0] Ior2;
assign Ior2 = ALUSrc_B? Imm_out: Rs2_data;
wire zero;
ALU U3(
  .A(Rs1_data),
  .B(Ior2),
  .ALU_operation(ALU_Control),
  .res(ALU_out),
  .zero(zero)
);

wire Branch = (Branch_Beq&zero)|(Branch_Bne&(~zero))|(Branch_Blt&ALU_out[0])|(Branch_Bltu&ALU_out[0])|(Branch_Bge&(~ALU_out[0]))|(Branch_Bgeu&(~ALU_out[0]));
wire [31:0] PC_Jal = PC_out+Ior2;
wire [31:0] PC_Branch = Branch?PC_out+Imm_out:PC_out+32'd4;
reg [31:0]PC_next;
wire [31:0] reg_mem;
reg [31:0] Tem_mem,Tem_wea,Tem_Data;
assign reg_mem = Tem_mem;
assign wea = Tem_wea;
assign Data_out = Tem_Data;
always @(*)begin
  case(Length)
    3'b000: Tem_mem <= {24'b0,Data_in[7:0]};
    3'b001: Tem_mem <= {{24{Data_in[7]}},Data_in[7:0]};
    3'b010: Tem_mem <= {16'b0,Data_in[15:0]};
    3'b011: Tem_mem <= {{16{Data_in[15]}},Data_in[15:0]};
    3'b100: Tem_mem <= Data_in;
  endcase
  case(MemtoReg)
    3'b000: Wt_data <= ALU_out;
    3'b001: Wt_data <= reg_mem;
    3'b010: Wt_data <= PC_out+32'd4;
    3'b011: Wt_data <= Imm_out<<12;
    3'b100: Wt_data <= PC_out+(Imm_out<<12);
  endcase
  case(Jump)
    2'b00: PC_next <= PC_Branch;
    2'b01: PC_next <= PC_Jal;
    2'b10: PC_next <= {ALU_out[31:1],1'b0};
  endcase
  case(Length)
    3'b000:begin
      case(ALU_out[1:0])
        2'b00: begin
          Tem_wea <= 4'b0001;
          Tem_Data <= {24'b0,Rs2_data[7:0]};
        end
        2'b01: begin
          Tem_wea <= 4'b0010;
          Tem_Data <= {16'b0,Rs2_data[7:0],8'b0};
        end
        2'b10: begin
          Tem_wea <= 4'b0100;
          Tem_Data <= {8'b0,Rs2_data[7:0],16'b0};
        end
        2'b11: begin
          Tem_wea <= 4'b1000;
          Tem_Data <= {Rs2_data[7:0],24'b0};
        end
      endcase
    end
    3'b010:begin
      case(ALU_out[1:0])
        2'b00: begin
          Tem_wea <= 4'b0011;
          Tem_Data <= {16'b0,Rs2_data[15:0]};
        end
        2'b01: begin
          Tem_wea <= 4'b0110;
          Tem_Data <= {8'b0,Rs2_data[15:0],8'b0};
        end
        2'b10: begin
          Tem_wea <= 4'b1100;
          Tem_Data <= {Rs2_data[15:0],16'b0};
        end
      endcase
    end
    3'b100:begin
    Tem_wea <= 4'b1111;
    Tem_Data <= Rs2_data;
    end
  endcase
end
always @(posedge clk or posedge rst)begin
  if(rst)PC_out<=32'd0;
  else PC_out<=PC_next;
end




endmodule