`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/04 16:16:45
// Design Name: 
// Module Name: SCPU_ctrl_W
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


module SCPU_ctrl_W(
  input [4:0]       OPcode, 
  input [2:0]       Fun3,
  input             Fun7,
  input [1:0]       mert_check,
  input             MIO_ready,
  input int,
  output reg [2:0]  ImmSel,
  output reg        ALUSrc_B,
  output reg [2:0]  MemtoReg,
  output reg [1:0]       Jump,
  output reg        Branch_Beq,
  output reg        Branch_Bne,
  output reg        Branch_Blt,
  output reg        Branch_Bltu,
  output reg        Branch_Bge,
  output reg        Branch_Bgeu,
  output reg [2:0]  Length,
  output reg        RegWrite,
  output reg        MemRW,
  output reg [3:0]  ALU_Control,
  output reg        CPU_MIO,

  output  reg     CsrWrite,         // CSR 写使能信�?
  output    reg   INT,              // 外部中断信号
  output    reg   ecall,            // ECALL 指令
  output   reg    mret,             // MRET 指令
  output   reg    illegal_inst     // 非法指令信号
    );
always@(*)begin
    case(OPcode)
        5'b01100:begin
            ImmSel <= 3'b000;
            ALUSrc_B <= 1'b0;
            MemtoReg <= 3'b000;
            Jump <= 2'b00;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            Length <= 3'b000;
            RegWrite <= 1'b1;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b0;
            case(Fun3)
                3'b000: ALU_Control <= Fun7?4'b0001:4'b0000;
                3'b001: ALU_Control <= 4'b0010;
                3'b010: ALU_Control <= 4'b0011;
                3'b011: ALU_Control <= 4'b0100;
                3'b100: ALU_Control <= 4'b0101;
                3'b101: ALU_Control <= Fun7?4'b0111:4'b0110;
                3'b110: ALU_Control <= 4'b1000;
                3'b111: ALU_Control <= 4'b1001;
            endcase
        end
        5'b00100: begin
            ImmSel <= 3'b000;
            ALUSrc_B <= 1'b1;
            MemtoReg <= 3'b000;
            Jump <= 2'b00;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            Length <= 3'b000;
            RegWrite <= 1'b1;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b0;
            case(Fun3)
                3'b000: ALU_Control <= 4'b0000;
                3'b001: ALU_Control <= 4'b0010;
                3'b010: ALU_Control <= 4'b0011;
                3'b011: ALU_Control <= 4'b0100;
                3'b100: ALU_Control <= 4'b0101;
                3'b101: ALU_Control <= Fun7?4'b0110:4'b0111;
                3'b110: ALU_Control <= 4'b1000;
                3'b111: ALU_Control <= 4'b1001;
            endcase
        end
        5'b00000:begin
            ImmSel <= 3'b000;
            ALUSrc_B <= 1'b1;
            MemtoReg <= 3'b001;
            Jump <= 2'b00;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            RegWrite <= 1'b1;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b0;
            ALU_Control <= 4'b0000; 
            case(Fun3)
                3'b000: Length <= 3'b001;
                3'b001: Length <= 3'b011;
                3'b010: Length <= 3'b100;
                3'b100: Length <= 3'b000;
                3'b101: Length <= 3'b010;
            endcase
        end
        5'b11001:begin
            ImmSel <= 3'b000;
            ALUSrc_B <= 1'b1;
            MemtoReg <= 3'b010;
            Jump <= 2'b10;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            Length <= 3'b000;
            RegWrite <= 1'b1;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b1;
            ALU_Control <= 4'b0000;
        end
        5'b01000:begin
            ImmSel <= 3'b001;
            ALUSrc_B <= 1'b1;
            MemtoReg <= 3'b001;
            Jump <= 2'b00;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            RegWrite <= 1'b0;
            MemRW <= 1'b1;
            CPU_MIO <= 1'b0;
            ALU_Control <= 4'b0000;
            case(Fun3)
                3'b000: Length <= 3'b000;
                3'b001: Length <= 3'b010;
                3'b010: Length <= 3'b100;
            endcase
        end
        5'b11000:begin
            ImmSel <= 3'b010;
            ALUSrc_B <= 1'b0;
            MemtoReg <= 3'b000;
            Jump <= 2'b00;
            Branch_Beq <= (Fun3 == 3'b000)?1'b1:1'b0;
            Branch_Bne <= (Fun3 == 3'b001)?1'b1:1'b0;
            Branch_Blt <= (Fun3 == 3'b100)?1'b1:1'b0;
            Branch_Bltu <= (Fun3 == 3'b110)?1'b1:1'b0;
            Branch_Bge <= (Fun3 == 3'b101)?1'b1:1'b0;
            Branch_Bgeu <= (Fun3 == 3'b111)?1'b1:1'b0;
            Length <= 3'b000;
            RegWrite <= 1'b0;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b0;
            case(Fun3)
                3'b000: ALU_Control <= 4'b0001;
                3'b001: ALU_Control <= 4'b0001;
                3'b100: ALU_Control <= 4'b0011;
                3'b101: ALU_Control <= 4'b0011;
                3'b110: ALU_Control <= 4'b0100;
                3'b111: ALU_Control <= 4'b0100;
            endcase
        end
        5'b11011:begin
            ImmSel <= 3'b100;
            ALUSrc_B <= 1'b1;
            MemtoReg <= 3'b010;
            Jump <= 2'b01;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            Length <= 3'b000;
            RegWrite <= 1'b1;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b0;
            ALU_Control <= 4'b0000;
        end
        5'b01101:begin
            ImmSel <= 3'b011;
            ALUSrc_B <= 1'b0;
            MemtoReg <= 3'b011;
            Jump <= 2'b00;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            Length <= 3'b000;
            RegWrite <= 1'b1;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b0;
            ALU_Control <= 4'b0000;
        end
        5'b00101:begin
            ImmSel <= 3'b011;
            ALUSrc_B <= 1'b0;
            MemtoReg <= 3'b100;
            Jump <= 2'b00;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            Length <= 3'b000;
            RegWrite <= 1'b1;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b0;
            ALU_Control <= 4'b0000;
        end
        5'b11100:begin
            ImmSel <= 3'b101;
            ALUSrc_B <= 1'b0;
            MemtoReg <=  3'b101;
            Jump <= 2'b00;
            Branch_Beq <= 1'b0;
            Branch_Bne <= 1'b0;
            Branch_Blt <= 1'b0;
            Branch_Bltu <= 1'b0;
            Branch_Bge <= 1'b0;
            Branch_Bgeu <= 1'b0;
            Length <= 3'b000;
            RegWrite <=  (Fun3==3'b000)?1'b0:1'b1;
            CsrWrite <= (Fun3==3'b000)?1'b0:1'b1;
            MemRW <= 1'b0;
            CPU_MIO <= 1'b0;
            ALU_Control <= 4'b0000;
            if(Fun3==3'b000)begin
            mret <= (mert_check==2'b11)?1'b1:1'b0;
            ecall<=(mert_check == 2'b11)?1'b0:1'b1;
            illegal_inst<=1'b0;
            end
        end
    default:illegal_inst <= 1'b1;
    endcase
    if(OPcode==5'b01100||OPcode==5'b00100||OPcode==5'b00000||OPcode==5'b11001||OPcode==5'b01000||OPcode==5'b11000||OPcode==5'b11011||OPcode==5'b01101||OPcode==5'b00101)begin
        illegal_inst <= 1'b0;
        mret <= 1'b0;
        ecall<=1'b0;
    end
     INT <= int;
     //   output       ecall,            // ECALL 指令





end





endmodule
