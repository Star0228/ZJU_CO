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


module Reg_MEM_WB(
    input clk,
    input rst,
    input [31:0] PC,
    input [31:0] ALU_out,
    input [31:0] Data_in,
    input [31:0] Imm,
    input [4:0]Wt_addr,
    input [2:0]Length,
    input [2:0]MemtoReg,
    input  RegWrite,

    output reg [31:0]MEM_WB_PC,
    output reg [31:0]MEM_WB_ALU_out,
    output reg [31:0]MEM_WB_Data_in,
    output reg [31:0]MEM_WB_Imm,
    output reg [4:0]MEM_WB_Wt_addr,
    output reg [2:0]MEM_WB_Length,
    output reg [2:0]MEM_WB_MemtoReg,
    output reg MEM_WB_RegWrite

    );

always@(posedge clk or posedge rst)begin
    if(rst) begin
        MEM_WB_PC <= 32'b0;
        MEM_WB_ALU_out <= 32'b0;
        MEM_WB_Data_in <= 32'b0;
        MEM_WB_Imm <= 32'b0;
        MEM_WB_Wt_addr <= 5'b0;
        MEM_WB_Length <= 3'b0;
        MEM_WB_MemtoReg <= 3'b0;
        MEM_WB_RegWrite <= 1'b0;
    end
    else begin
        MEM_WB_PC <= PC;
        MEM_WB_ALU_out <= ALU_out;
        MEM_WB_Data_in <= Data_in;
        MEM_WB_Imm <= Imm;
        MEM_WB_Wt_addr <= Wt_addr;
        MEM_WB_Length <= Length;
        MEM_WB_MemtoReg <= MemtoReg;
        MEM_WB_RegWrite <= RegWrite;
    end
end

endmodule
