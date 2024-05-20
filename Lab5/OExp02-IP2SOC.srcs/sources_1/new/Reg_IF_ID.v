`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 08:59:38
// Design Name: 
// Module Name: Reg_IF_ID
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

module Reg_IF_ID(
    input clk,
    input rst,
    input [31:0] PC,
    input [31:0]inst_field,
    output reg [31:0]IF_ID_PC,
    output reg [31:0]IF_ID_inst_field,
    output reg [2:0]IF_ID_Fun3,
    output reg [4:0]IF_ID_OPcode,
    output reg IF_ID_Fun7
    );

always@(posedge clk or posedge rst)begin
    if(rst)begin
        IF_ID_PC <= 32'b0;
        IF_ID_inst_field <= 32'h00000013;
        IF_ID_Fun3 <= 3'b0;
        IF_ID_Fun7 <= 7'b0;
        IF_ID_OPcode <= 5'b0;
    end
    else begin
        IF_ID_PC <= PC;
        IF_ID_inst_field <= inst_field;
        IF_ID_Fun3 <= inst_field[14:12];
        IF_ID_Fun7 <= inst_field[30];
        IF_ID_OPcode <= inst_field[6:2];
    end
end

endmodule
