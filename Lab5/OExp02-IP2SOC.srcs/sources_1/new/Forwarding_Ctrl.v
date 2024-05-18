`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/18 18:25:09
// Design Name: 
// Module Name: Forwarding_Ctrl
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


module Forwarding_Ctrl(
    input [4:0]ID_EX_Rs1_addr,
    input [4:0]ID_EX_Rs2_addr,
    input [4:0]EX_MEM_Wt_addr,
    input [4:0]MEM_WB_Wt_addr,
    input EX_MEM_RegWrite,
    input MEM_WB_RegWrite,
    output reg [1:0]For_A,
    output reg [1:0]For_B
    );
    always@(*)begin
        if(EX_MEM_RegWrite && ID_EX_Rs1_addr == EX_MEM_Wt_addr && EX_MEM_Wt_addr != 5'b0)begin
            For_A = 2'b01;
        end
        else if(MEM_WB_RegWrite && ID_EX_Rs1_addr == MEM_WB_Wt_addr && MEM_WB_Wt_addr != 5'b0)begin
            For_A = 2'b10;
        end
        else begin
            For_A = 2'b00;
        end
        if(EX_MEM_RegWrite &&ID_EX_Rs2_addr == EX_MEM_Wt_addr && EX_MEM_Wt_addr != 5'b0)begin
            For_B = 2'b01;
        end
        else if(MEM_WB_RegWrite && ID_EX_Rs2_addr == MEM_WB_Wt_addr && MEM_WB_Wt_addr != 5'b0)begin
            For_B = 2'b10;
        end
        else begin
            For_B = 2'b00;
        end
    end

endmodule
