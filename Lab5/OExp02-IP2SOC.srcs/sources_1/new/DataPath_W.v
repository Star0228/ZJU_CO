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
  input [4:0]       OPcode, 
  input [2:0]       Fun3,
  input             Fun7,
  input             MIO_ready,
  input [31:0]inst_field,//instruction field
  input [31:0]Data_in,//memory in data
  
  output wire EX_MEM_MemRW,
  output reg [31:0]PC_out,//next PC/NOW PC
  output wire [31:0]Data_out,//store data out
  output wire [31:0]EX_MEM_ALU_out,//ADDR OF MEM
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
initial begin
  PC_out <= 32'd0;
end

wire [2:0] ImmSel;
wire ALUSrc_B;
wire [2:0] MemtoReg;
wire [1:0] Jump;
wire Branch_Beq,Branch_Bne,Branch_Blt,Branch_Bltu,Branch_Bge,Branch_Bgeu;
wire [2:0] Length;
wire RegWrite;

wire [3:0] ALU_Control;
wire CPU_MIO;
wire MemRW;
SCPU_ctrl_W SCPU_CTRL(
  .OPcode(OPcode),
  .Fun3(Fun3),
  .Fun7(Fun7),
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
  .CPU_MIO(CPU_MIO)
);  


wire [31:0] Rs1_data, Rs2_data;
reg [31:0]Wt_data;

wire [4:0] MEM_WB_Wt_addr;
wire MEM_WB_RegWrite;
wire [1:0]Forward_A,Forward_B;
Regs U1(
  .clk(clk),
  .rst(rst),
  .Rs1_addr(inst_field[19:15]),
  .Rs2_addr(inst_field[24:20]),
  .Wt_addr(MEM_WB_Wt_addr),
  .Wt_data(Wt_data),
  .RegWrite(MEM_WB_RegWrite),
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
//building
wire [31:0] Imm_out;
ImmGen U2(
  .inst_field(inst_field),
  .ImmSel(ImmSel),
  .Imm_out(Imm_out)
);

wire [31:0]ID_EX_PC,ID_EX_Rs1_data,ID_EX_Rs2_data,ID_EX_Imm;
wire [2:0]ID_EX_Length,ID_EX_MemtoReg;
wire ID_EX_RegWrite;
wire ID_EX_Branch_Beq,ID_EX_Branch_Bne,ID_EX_Branch_Blt,ID_EX_Branch_Bltu,ID_EX_Branch_Bge,ID_EX_Branch_Bgeu;
wire ID_EX_MemRW;
wire [1:0]ID_EX_Jump;
wire [1:0] EX_MEM_Jump;
wire [3:0]ID_EX_wea;
wire [3:0]ID_EX_ALU_Control;
wire ID_EX_ALUSrc_B;
wire [4:0]ID_EX_Wt_addr,ID_EX_Rs1_addr,ID_EX_Rs2_addr;
wire Branch;
Reg_ID_EX ID_EX(
  .clk(clk),
  .rst(rst|Branch|(EX_MEM_Jump[0]^EX_MEM_Jump[1])),
  .PC(PC_out),
  .Rs1_addr(inst_field[19:15]),
  .Rs2_addr(inst_field[24:20]),
  .Rs1_data(Rs1_data),
  .Rs2_data(Rs2_data),
  .Imm(Imm_out),
  .Wt_addr(inst_field[11:7]),
  .Length(Length),
  .MemtoReg(MemtoReg),
  .RegWrite(RegWrite),
  .Branch_Beq(Branch_Beq),
  .Branch_Bne(Branch_Bne),
  .Branch_Bge(Branch_Bge),
  .Branch_Blt(Branch_Blt),
  .Branch_Bgeu(Branch_Bgeu),
  .Branch_Bltu(Branch_Bltu),
  .MemRW(MemRW),
  .Jump(Jump),
  .wea(wea),
  .ALU_Control(ALU_Control),
  .ALUSrc_B(ALUSrc_B),
  .ID_EX_PC(ID_EX_PC),
  .ID_EX_Rs1_data(ID_EX_Rs1_data),
  .ID_EX_Rs2_data(ID_EX_Rs2_data),
  .ID_EX_Imm(ID_EX_Imm),
  .ID_EX_Length(ID_EX_Length),
  .ID_EX_MemtoReg(ID_EX_MemtoReg),
  .ID_EX_RegWrite(ID_EX_RegWrite),
  .ID_EX_Branch_Beq(ID_EX_Branch_Beq),
  .ID_EX_Branch_Bne(ID_EX_Branch_Bne),
  .ID_EX_Branch_Bge(ID_EX_Branch_Bge),
  .ID_EX_Branch_Blt(ID_EX_Branch_Blt),
  .ID_EX_Branch_Bgeu(ID_EX_Branch_Bgeu),
  .ID_EX_Branch_Bltu(ID_EX_Branch_Bltu),
  .ID_EX_MemRW(ID_EX_MemRW),
  .ID_EX_Jump(ID_EX_Jump),
  .ID_EX_wea(ID_EX_wea),  
  .ID_EX_ALU_Control(ID_EX_ALU_Control),
  .ID_EX_ALUSrc_B(ID_EX_ALUSrc_B),
  .ID_EX_Rs1_addr(ID_EX_Rs1_addr),
  .ID_EX_Rs2_addr(ID_EX_Rs2_addr),
  .ID_EX_Wt_addr(ID_EX_Wt_addr)
);


wire [31:0] Ior2;
wire [31:0] Forward_A_data,Forward_B_data;
assign Forward_A_data = (Forward_A==2'b00)?ID_EX_Rs1_data:((Forward_A==2'b01)?Tem_RegWrite:((Forward_A==2'b10)?Wt_data:32'b0));
assign Forward_B_data = (Forward_B==2'b00)?ID_EX_Rs2_data:((Forward_B==2'b01)?Tem_RegWrite:((Forward_B==2'b10)?Wt_data:32'b0));
assign Ior2 = ID_EX_ALUSrc_B? ID_EX_Imm: Forward_B_data;
wire zero;
wire [31:0] EX_ALU_out;
wire [31:0] Tem_RegWrite;
ALU U3(
  .A(Forward_A_data),
  .B(Ior2),
  .ALU_operation(ID_EX_ALU_Control),
  .res(EX_ALU_out),
  .zero(zero)
);
wire [31:0] PC_Jal ;
assign PC_Jal = ID_EX_PC+ID_EX_Imm;

wire [31:0] EX_MEM_PC,EX_MEM_PC_Jal,EX_MEM_Rs2_data,EX_MEM_Imm;
wire [4:0] EX_MEM_Wt_addr,EX_MEM_Rs2_addr;  
wire EX_MEM_zero;
wire EX_MEM_Branch_Beq,EX_MEM_Branch_Bne,EX_MEM_Branch_Blt,EX_MEM_Branch_Bltu,EX_MEM_Branch_Bge,EX_MEM_Branch_Bgeu;
wire [2:0] EX_MEM_Length,EX_MEM_MemtoReg;
wire EX_MEM_RegWrite;

wire [3:0] EX_MEM_wea;
Reg_EX_MEM EX_MEM(
  .clk(clk),
  .rst(rst),
  .PC(ID_EX_PC),
  .PC_Jal(PC_Jal),
  .ALU_out(EX_ALU_out),
  .zero(zero),
  .Rs2_data(ID_EX_Rs2_data),
  .Rs2_addr(ID_EX_Rs2_addr),
  .Imm(ID_EX_Imm),
  .Wt_addr(ID_EX_Wt_addr),
  .Length(ID_EX_Length),
  .MemtoReg(ID_EX_MemtoReg),
  .RegWrite(ID_EX_RegWrite),
  .Branch_Beq(ID_EX_Branch_Beq),
  .Branch_Bne(ID_EX_Branch_Bne),
  .Branch_Bge(ID_EX_Branch_Bge),
  .Branch_Blt(ID_EX_Branch_Blt),
  .Branch_Bgeu(ID_EX_Branch_Bgeu),
  .Branch_Bltu(ID_EX_Branch_Bltu),
  .MemRW(ID_EX_MemRW),
  .Jump(ID_EX_Jump),
  .wea(ID_EX_wea),
  .EX_MEM_PC(EX_MEM_PC),
  .EX_MEM_PC_Jal(EX_MEM_PC_Jal),
  .EX_MEM_ALU_out(EX_MEM_ALU_out),
  .EX_MEM_zero(EX_MEM_zero),
  .EX_MEM_Rs2_data(EX_MEM_Rs2_data),
  .EX_MEM_Rs2_addr(EX_MEM_Rs2_addr),
  .EX_MEM_Imm(EX_MEM_Imm),
  .EX_MEM_Wt_addr(EX_MEM_Wt_addr),
  .EX_MEM_Length(EX_MEM_Length),
  .EX_MEM_MemtoReg(EX_MEM_MemtoReg),
  .EX_MEM_RegWrite(EX_MEM_RegWrite),
  .EX_MEM_Branch_Beq(EX_MEM_Branch_Beq),
  .EX_MEM_Branch_Bne(EX_MEM_Branch_Bne),
  .EX_MEM_Branch_Bge(EX_MEM_Branch_Bge),
  .EX_MEM_Branch_Blt(EX_MEM_Branch_Blt),
  .EX_MEM_Branch_Bgeu(EX_MEM_Branch_Bgeu),
  .EX_MEM_Branch_Bltu(EX_MEM_Branch_Bltu),
  .EX_MEM_MemRW(EX_MEM_MemRW),
  .EX_MEM_Jump(EX_MEM_Jump),
  .EX_MEM_wea(EX_MEM_wea)
);


Tem_RegWrite Temreg(
  .MemtoReg(EX_MEM_MemtoReg),
  .Length(EX_MEM_Length),
  .Data_in(Data_in),
  .ALU_out(EX_MEM_ALU_out),
  .Imm(EX_MEM_Imm),
  .PC_out(EX_MEM_PC),
  .Tem_RegWrite(Tem_RegWrite)
);
wire [31:0] MEM_WB_PC,MEM_WB_ALU_out,MEM_WB_Data_in,MEM_WB_Imm;

wire [2:0] MEM_WB_Length,MEM_WB_MemtoReg;

Reg_MEM_WB MEM_WB(
  .clk(clk),
  .rst(rst),
  .PC(EX_MEM_PC),
  .ALU_out(EX_MEM_ALU_out),
  .Data_in(Data_in),
  .Imm(EX_MEM_Imm),
  .Wt_addr(EX_MEM_Wt_addr),
  .Length(EX_MEM_Length),
  .MemtoReg(EX_MEM_MemtoReg),
  .RegWrite(EX_MEM_RegWrite),
  .MEM_WB_PC(MEM_WB_PC),
  .MEM_WB_ALU_out(MEM_WB_ALU_out),
  .MEM_WB_Data_in(MEM_WB_Data_in),
  .MEM_WB_Imm(MEM_WB_Imm),
  .MEM_WB_Wt_addr(MEM_WB_Wt_addr),
  .MEM_WB_Length(MEM_WB_Length),
  .MEM_WB_MemtoReg(MEM_WB_MemtoReg),
  .MEM_WB_RegWrite(MEM_WB_RegWrite)
);

wire For_M;
Forwarding_Ctrl forward_strl(
  .ID_EX_Rs1_addr(ID_EX_Rs1_addr),
  .ID_EX_Rs2_addr(ID_EX_Rs2_addr),
  .EX_MEM_Wt_addr(EX_MEM_Wt_addr),
  .MEM_WB_Wt_addr(MEM_WB_Wt_addr),
  .EX_MEM_RegWrite(EX_MEM_RegWrite),
  .MEM_WB_RegWrite(MEM_WB_RegWrite),
  .EX_MEM_Rs2_addr(EX_MEM_Rs2_addr),
  .For_A(Forward_A),
  .For_B(Forward_B),
  .For_M(For_M)
);

assign Branch = (EX_MEM_Branch_Beq&EX_MEM_zero)|(EX_MEM_Branch_Bne&(~EX_MEM_zero))|(EX_MEM_Branch_Blt&EX_MEM_ALU_out[0])|(EX_MEM_Branch_Bltu&EX_MEM_ALU_out[0])|(EX_MEM_Branch_Bge&(~EX_MEM_ALU_out[0]))|(EX_MEM_Branch_Bgeu&(~EX_MEM_ALU_out[0]));
wire [31:0] PC_Branch = Branch?EX_MEM_PC_Jal:EX_MEM_PC+32'd4;
reg [31:0] PC_next;
wire [31:0] reg_mem;
wire [31:0] reg_Data_out;
reg [31:0] Tem_mem,Tem_Data;
reg [3:0]Tem_wea;
assign reg_Data_out = For_M?Wt_data:EX_MEM_Rs2_data;
assign reg_mem = Tem_mem;
assign wea = Tem_wea;
assign Data_out = Tem_Data;
always @(*)begin

  case(MEM_WB_Length)//memtoreg
    3'b000: 
    case(MEM_WB_ALU_out[1:0])
      2'b00:Tem_mem <= {24'b0,MEM_WB_Data_in[7:0]};
      2'b01:Tem_mem <= {24'b0,MEM_WB_Data_in[15:8]};
      2'b10:Tem_mem <= {24'b0,MEM_WB_Data_in[23:16]};
      2'b11:Tem_mem <= {24'b0,MEM_WB_Data_in[31:24]};
    endcase
    3'b001: 
    case(MEM_WB_ALU_out[1:0])
      2'b00:Tem_mem <= {{24{MEM_WB_Data_in[7]}},MEM_WB_Data_in[7:0]};
      2'b01:Tem_mem <= {{24{MEM_WB_Data_in[15]}},MEM_WB_Data_in[15:8]};
      2'b10:Tem_mem <= {{24{MEM_WB_Data_in[23]}},MEM_WB_Data_in[23:16]};
      2'b11:Tem_mem <= {{24{MEM_WB_Data_in[31]}},MEM_WB_Data_in[31:24]};
    endcase
    3'b010:
    case(MEM_WB_ALU_out[1:0])
      2'b00:Tem_mem <= {16'b0,MEM_WB_Data_in[15:0]};
      2'b01:Tem_mem <= {16'b0,MEM_WB_Data_in[23:8]};
      2'b10:Tem_mem <= {16'b0,MEM_WB_Data_in[31:16]};
    endcase
    3'b011: 
    case(MEM_WB_ALU_out[1:0])
      2'b00:Tem_mem <= {{16{MEM_WB_Data_in[15]}},MEM_WB_Data_in[15:0]};
      2'b01:Tem_mem <= {{16{MEM_WB_Data_in[23]}},MEM_WB_Data_in[23:8]};
      2'b10:Tem_mem <= {{16{MEM_WB_Data_in[31]}},MEM_WB_Data_in[31:16]};
    endcase
    3'b100:
     Tem_mem <= MEM_WB_Data_in;
  endcase
  case(MEM_WB_MemtoReg)
    3'b000: Wt_data <= MEM_WB_ALU_out;
    3'b001: Wt_data <= reg_mem;
    3'b010: Wt_data <= MEM_WB_PC+32'd4;
    3'b011: Wt_data <= MEM_WB_Imm<<12;
    3'b100: Wt_data <= MEM_WB_PC+(MEM_WB_Imm<<12);
  endcase
  case(EX_MEM_Jump)
    2'b11: PC_next <= PC_Branch;
    2'b01: PC_next <= EX_MEM_PC_Jal;
    2'b10: PC_next <= {EX_MEM_ALU_out[31:1],1'b0};
  endcase
  case(EX_MEM_Length)//RAM
    3'b000:begin
      case(EX_MEM_ALU_out[1:0])
        2'b00: begin
          Tem_wea <= 4'b0001;
          Tem_Data <= {24'b0,reg_Data_out[7:0]};
        end
        2'b01: begin
          Tem_wea <= 4'b0010;
          Tem_Data <= {16'b0,reg_Data_out[7:0],8'b0};
        end
        2'b10: begin
          Tem_wea <= 4'b0100;
          Tem_Data <= {8'b0,reg_Data_out[7:0],16'b0};
        end
        2'b11: begin
          Tem_wea <= 4'b1000;
          Tem_Data <= {reg_Data_out[7:0],24'b0};
        end
      endcase
    end
    3'b010:begin
      case(EX_MEM_ALU_out[1:0])
        2'b00: begin
          Tem_wea <= 4'b0011;
          Tem_Data <= {16'b0,reg_Data_out[15:0]};
        end
        2'b01: begin
          Tem_wea <= 4'b0110;
          Tem_Data <= {8'b0,reg_Data_out[15:0],8'b0};
        end
        2'b10: begin
          Tem_wea <= 4'b1100;
          Tem_Data <= {reg_Data_out[15:0],16'b0};
        end
      endcase
    end
    3'b100:begin
    Tem_wea <= 4'b1111;
    Tem_Data <= reg_Data_out;
    end
  endcase

end

always @(posedge clk or posedge rst)begin
  if(rst)PC_out<=32'd0;
  else if(EX_MEM_Jump==2'b00)begin
    PC_out <= PC_out+32'd4;
  end
  else PC_out<=PC_next;
end




endmodule