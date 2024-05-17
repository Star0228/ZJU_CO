`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 21:39:18
// Design Name: 
// Module Name: Reg_
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


module Reg_EX_MEM(
    input clk,
    input rst,
    input [31:0] PC,
    input [31:0] PC_Jal,
    input [31:0] ALU_out,
    input zero,
    input [31:0] Rs2_data,
    input [31:0] Imm,
    input [4:0]Wt_addr,
    input [2:0]Length,
    input [2:0]MemtoReg,
    input  RegWrite,
    input  Branch_Beq,
    input  Branch_Bne,
    input  Branch_Bge,
    input  Branch_Blt,
    input  Branch_Bgeu,
    input  Branch_Bltu,
    input  MemRW,
    input [1:0] Jump,
    input [3:0] wea,
    output reg [31:0]EX_MEM_PC,
    output reg [31:0]EX_MEM_PC_Jal,
    output reg [31:0]EX_MEM_ALU_out,
    output reg EX_MEM_zero,
    output reg [31:0]EX_MEM_Rs2_data,
    output reg [31:0]EX_MEM_Imm,
    output reg [4:0]EX_MEM_Wt_addr,
    output reg [2:0]EX_MEM_Length,
    output reg [2:0]EX_MEM_MemtoReg,
    output reg EX_MEM_RegWrite,
    output reg EX_MEM_Branch_Beq,
    output reg EX_MEM_Branch_Bne,
    output reg EX_MEM_Branch_Bge,
    output reg EX_MEM_Branch_Blt,
    output reg EX_MEM_Branch_Bgeu,
    output reg EX_MEM_Branch_Bltu,
    output reg EX_MEM_MemRW,
    output reg [1:0]EX_MEM_Jump,
    output reg [3:0]EX_MEM_wea
    );

always@(posedge clk or posedge rst)begin
    if(rst) begin
        EX_MEM_PC <= 32'b0;
        EX_MEM_PC_Jal <= 32'b0;
        EX_MEM_ALU_out <= 32'b0;
        EX_MEM_zero <= 1'b0;
        EX_MEM_Rs2_data <= 32'b0;
        EX_MEM_Imm <= 32'b0;
        EX_MEM_Wt_addr <= 5'b0;
        EX_MEM_Length <= 3'b0;
        EX_MEM_MemtoReg <= 3'b0;
        EX_MEM_RegWrite <= 1'b0;
        EX_MEM_Branch_Beq <= 1'b0;
        EX_MEM_Branch_Bne <= 1'b0;
        EX_MEM_Branch_Bge <= 1'b0;
        EX_MEM_Branch_Blt <= 1'b0;
        EX_MEM_Branch_Bgeu <= 1'b0;
        EX_MEM_Branch_Bltu <= 1'b0;
        EX_MEM_MemRW <= 1'b0;
        EX_MEM_Jump <= 2'b0;
        EX_MEM_wea <= 4'b0;
    end
    else begin
        EX_MEM_PC <= PC;
        EX_MEM_PC_Jal <= PC_Jal;
        EX_MEM_ALU_out <= ALU_out;
        EX_MEM_zero <= zero;
        EX_MEM_Rs2_data <= Rs2_data;
        EX_MEM_Imm <= Imm;
        EX_MEM_Wt_addr <= Wt_addr;
        EX_MEM_Length <= Length;
        EX_MEM_MemtoReg <= MemtoReg;
        EX_MEM_RegWrite <= RegWrite;
        EX_MEM_Branch_Beq <= Branch_Beq;
        EX_MEM_Branch_Bne <= Branch_Bne;
        EX_MEM_Branch_Bge <= Branch_Bge;
        EX_MEM_Branch_Blt <= Branch_Blt;
        EX_MEM_Branch_Bgeu <= Branch_Bgeu;
        EX_MEM_Branch_Bltu <= Branch_Bltu;
        EX_MEM_MemRW <= MemRW;
        EX_MEM_Jump <= Jump;
        EX_MEM_wea <= wea;
    end
end

endmodule
