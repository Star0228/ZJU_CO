`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/05 23:15:51
// Design Name: 
// Module Name: Regs
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
module Regs(
    input clk,
    input rst,
    input [4:0] Rs1_addr, 
    input [4:0] Rs2_addr, 
    input [4:0] Wt_addr, 
    input [31:0]Wt_data, 
    input RegWrite, 
    output wire [31:0] Rs1_data, 
    output wire[31:0] Rs2_data,
    output wire[31:0] Reg00,
    output wire[31:0] Reg01,
    output wire[31:0] Reg02,
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

reg [31:0]tem[1:31];

assign Rs1_data = Rs1_addr? tem[Rs1_addr]:32'd0;
assign Rs2_data = Rs2_addr? tem[Rs2_addr]:32'd0;
assign Reg00 = 32'd0;
assign Reg01 = tem[1];
assign Reg02 = tem[2];
assign Reg03 = tem[3];
assign Reg04 = tem[4];
assign Reg05 = tem[5];
assign Reg06 = tem[6];
assign Reg07 = tem[7];
assign Reg08 = tem[8];
assign Reg09 = tem[9];
assign Reg10 = tem[10];
assign Reg11 = tem[11];
assign Reg12 = tem[12];
assign Reg13 = tem[13];
assign Reg14 = tem[14];
assign Reg15 = tem[15];
assign Reg16 = tem[16];
assign Reg17 = tem[17];
assign Reg18 = tem[18];
assign Reg19 = tem[19];
assign Reg20 = tem[20];
assign Reg21 = tem[21];
assign Reg22 = tem[22];
assign Reg23 = tem[23];
assign Reg24 = tem[24];
assign Reg25 = tem[25];
assign Reg26 = tem[26];
assign Reg27 = tem[27];
assign Reg28 = tem[28];
assign Reg29 = tem[29];
assign Reg30 = tem[30];
assign Reg31 = tem[31];

integer i = 1;
always @(posedge clk) begin
  if(rst)begin
    for(i=1;i<32;i=i+1)begin
      tem[i] <= 32'd0;
    end
  end
  if(RegWrite&&!rst&&Wt_addr)begin
    tem[Wt_addr] <= Wt_data;
  end
end
// always @(negedge clk) begin
// if(RegWrite&&!rst&&Wt_addr)begin
//    tem[Wt_addr] <= Wt_data;
//  end
// end
endmodule