`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/04 11:24:19
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
  input wire [2:0]   ImmSel,
  input wire [31:0]  inst_field,
  output reg [31:0]  Imm_out
);
//0I-type, 1S-type, 2B-type, 3U-type, 4J-type


always @(*) begin
case (ImmSel)
    3'd0: Imm_out = {{20{inst_field[31]}},inst_field[31:20]};
    3'd1: Imm_out = {{20{inst_field[31]}},inst_field[31:25],inst_field[11:7]};
    3'd2: Imm_out = {{19{inst_field[31]}},inst_field[31],inst_field[7],inst_field[30:25],inst_field[11:8],1'b0};
    3'd3: Imm_out = {{12{inst_field[31]}},inst_field[31:12]};
    3'd4: Imm_out = {{11{inst_field[31]}},inst_field[31],inst_field[19:12],inst_field[20],inst_field[30:21],1'b0};
    3'd5: Imm_out = {27'b0,inst_field[19:15]};
endcase
end

endmodule
