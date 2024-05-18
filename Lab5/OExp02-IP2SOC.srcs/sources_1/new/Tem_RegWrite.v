`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/18 18:25:51
// Design Name: 
// Module Name: Tem_RegWrite
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


module Tem_RegWrite(
    input [2:0]MemtoReg,
    input [2:0]Length,
    input [31:0]Data_in,    
    input [31:0]ALU_out,
    input [31:0]Imm,
    input [31:0]PC_out,
    output reg [31:0]Tem_RegWrite
    );

wire [31:0] reg_mem;
reg [31:0]tem_mem;
assign reg_mem = tem_mem;
always@(*)begin
    case(Length)
        3'b000: 
        case(ALU_out[1:0])
            2'b00: tem_mem = {24'b0, Data_in[7:0]};
            2'b01: tem_mem = {24'b0, Data_in[15:8]};
            2'b10: tem_mem = {24'b0, Data_in[23:16]};
            2'b11: tem_mem = {24'b0, Data_in[31:24]};
        endcase
        3'b001:
        case(ALU_out[1:0])
            2'b00: tem_mem = {{24{Data_in[7]}}, Data_in[7:0]};
            2'b01: tem_mem =  {{24{Data_in[15]}}, Data_in[15:8]};
            2'b10: tem_mem =  {{24{Data_in[23]}}, Data_in[23:16]};
            2'b11: tem_mem =  {{24{Data_in[31]}}, Data_in[31:24]};
        endcase
        3'b010:
        case(ALU_out[1:0])
            2'b00: tem_mem = {16'b0, Data_in[15:0]};
            2'b01: tem_mem = {16'b0, Data_in[23:8]};
            2'b10: tem_mem = {16'b0, Data_in[31:16]};
        endcase
        3'b011:
        case(ALU_out[1:0])
            2'b00: tem_mem = {{16{Data_in[15]}}, Data_in[15:0]};
            2'b01: tem_mem =  {{16{Data_in[23]}}, Data_in[23:8]};
            2'b10: tem_mem =  {{16{Data_in[31]}}, Data_in[31:16]};
        endcase
        3'b100:
            tem_mem = Data_in;
    endcase
    case(MemtoReg)
        3'b000: Tem_RegWrite = ALU_out;
        3'b001: Tem_RegWrite = reg_mem;
        3'b010: Tem_RegWrite = PC_out+32'd4;
        3'b011: Tem_RegWrite = Imm<<12;
        3'b100: Tem_RegWrite = PC_out+(Imm<<12);
    endcase
end
endmodule
