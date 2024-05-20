`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 21:39:18
// Design Name: 
// Module Name: Reg_ID_EX
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


module Reg_ID_EX(
    input clk,
    input rst,
    input [31:0] PC,
    input [4:0]Rs1_addr,
    input [4:0]Rs2_addr,
    input [31:0] Rs1_data,
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
    input [3:0]ALU_Control,
    input ALUSrc_B,
    output reg [4:0]ID_EX_Rs1_addr,
    output reg [4:0]ID_EX_Rs2_addr,
    output reg [31:0]ID_EX_PC,
    output reg [31:0]ID_EX_Rs1_data,
    output reg [31:0]ID_EX_Rs2_data,
    output reg [31:0]ID_EX_Imm,
    output reg [2:0]ID_EX_Length,
    output reg [2:0]ID_EX_MemtoReg,
    output reg ID_EX_RegWrite,
    output reg ID_EX_Branch_Beq,    
    output reg ID_EX_Branch_Bne,
    output reg ID_EX_Branch_Bge,
    output reg ID_EX_Branch_Blt,
    output reg ID_EX_Branch_Bgeu,
    output reg ID_EX_Branch_Bltu,
    output reg ID_EX_MemRW, 
    output reg [1:0]ID_EX_Jump,
    output reg [3:0]ID_EX_wea,
    output reg [3:0]ID_EX_ALU_Control,
    output reg ID_EX_ALUSrc_B,
    output reg [4:0]ID_EX_Wt_addr

    );

always@(posedge clk or posedge rst)begin
    if(rst)begin
        ID_EX_PC <= 32'b0;
        ID_EX_Rs1_data <= 32'b0;
        ID_EX_Rs2_data <= 32'b0;
        ID_EX_Imm <= 32'b0;
        ID_EX_Length <= 3'b0;
        ID_EX_MemtoReg <= 3'b0;
        ID_EX_RegWrite <= 1'b0;
        ID_EX_Branch_Beq <= 1'b0;
        ID_EX_Branch_Bne <= 1'b0;
        ID_EX_Branch_Bge <= 1'b0;
        ID_EX_Branch_Blt <= 1'b0;
        ID_EX_Branch_Bgeu <= 1'b0;
        ID_EX_Branch_Bltu <= 1'b0;
        ID_EX_MemRW <= 1'b0;
        ID_EX_Jump <= 2'b0;
        ID_EX_wea <= 4'b0;
        ID_EX_ALU_Control <= 4'b0;
        ID_EX_ALUSrc_B <= 1'b0;
        ID_EX_Wt_addr <= 5'b0;
        ID_EX_Rs1_addr <= 5'b0;
        ID_EX_Rs2_addr <= 5'b0;
    end
    else begin
        ID_EX_PC <= PC;
        ID_EX_Rs1_data <= Rs1_data;
        ID_EX_Rs2_data <= Rs2_data;
        ID_EX_Imm <= Imm;
        ID_EX_Length <= Length;
        ID_EX_MemtoReg <= MemtoReg;
        ID_EX_RegWrite <= RegWrite;
        ID_EX_Branch_Beq <= Branch_Beq;
        ID_EX_Branch_Bne <= Branch_Bne;
        ID_EX_Branch_Bge <= Branch_Bge;
        ID_EX_Branch_Blt <= Branch_Blt;
        ID_EX_Branch_Bgeu <= Branch_Bgeu;
        ID_EX_Branch_Bltu <= Branch_Bltu;
        ID_EX_MemRW <= MemRW;
        ID_EX_Jump <= Jump;
        ID_EX_wea <= wea;
        ID_EX_ALU_Control <= ALU_Control;
        ID_EX_ALUSrc_B <= ALUSrc_B;
        ID_EX_Wt_addr <= Wt_addr;
        ID_EX_Rs1_addr <= Rs1_addr;
        ID_EX_Rs2_addr <= Rs2_addr;
    end
end

endmodule
