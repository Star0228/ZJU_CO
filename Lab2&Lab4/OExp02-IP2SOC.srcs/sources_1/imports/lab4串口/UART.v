`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/03/20 13:26:59
// Design Name:
// Module Name: UART
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


module UART (
  input  wire        clk        ,
  input  wire        rst        ,
  input  wire [31:0] pc         ,
  input  wire [31:0] inst       ,
  input  wire [ 4:0] rs1        ,
  input  wire [31:0] rs1_val    ,
  input  wire [ 4:0] rs2        ,
  input  wire [31:0] rs2_val    ,
  input  wire [ 4:0] rd         ,
  input  wire [31:0] reg_i_data ,
  input  wire        reg_wen    ,
  input  wire        is_imm     ,
  input  wire        is_auipc   ,
  input  wire        is_lui     ,
  input  wire [31:0] imm        ,
  input  wire [31:0] a_val      ,
  input  wire [31:0] b_val      ,
  input  wire [ 3:0] alu_ctrl   ,
  input  wire [ 2:0] cmp_ctrl   ,
  input  wire [31:0] alu_res    ,
  input  wire        cmp_res    ,
  input  wire        is_branch  ,
  input  wire        is_jal     ,
  input  wire        is_jalr    ,
  input  wire        do_branch  ,
  input  wire [31:0] pc_branch  ,
  input  wire        mem_wen    ,
  input  wire        mem_ren    ,
  input  wire [31:0] dmem_o_data,
  input  wire [31:0] dmem_i_data,
  input  wire [31:0] dmem_addr  ,
  input  wire        csr_wen    ,
  input  wire [11:0] csr_ind    ,
  input  wire [ 1:0] csr_ctrl   ,
  input  wire [31:0] csr_r_data ,
  input  wire [31:0] x0         ,
  input  wire [31:0] ra         ,
  input  wire [31:0] sp         ,
  input  wire [31:0] gp         ,
  input  wire [31:0] tp         ,
  input  wire [31:0] t0         ,
  input  wire [31:0] t1         ,
  input  wire [31:0] t2         ,
  input  wire [31:0] s0         ,
  input  wire [31:0] s1         ,
  input  wire [31:0] a0         ,
  input  wire [31:0] a1         ,
  input  wire [31:0] a2         ,
  input  wire [31:0] a3         ,
  input  wire [31:0] a4         ,
  input  wire [31:0] a5         ,
  input  wire [31:0] a6         ,
  input  wire [31:0] a7         ,
  input  wire [31:0] s2         ,
  input  wire [31:0] s3         ,
  input  wire [31:0] s4         ,
  input  wire [31:0] s5         ,
  input  wire [31:0] s6         ,
  input  wire [31:0] s7         ,
  input  wire [31:0] s8         ,
  input  wire [31:0] s9         ,
  input  wire [31:0] s10        ,
  input  wire [31:0] s11        ,
  input  wire [31:0] t3         ,
  input  wire [31:0] t4         ,
  input  wire [31:0] t5         ,
  input  wire [31:0] t6         ,
  input  wire [31:0] mstatus_o  ,
  input  wire [31:0] mcause_o   ,
  input  wire [31:0] mepc_o     ,
  input  wire [31:0] mtval_o    ,
  input  wire [31:0] mtvec_o    ,
  input  wire [31:0] mie_o      ,
  input  wire [31:0] mip_o      ,
  output wire        tx
);

  reg[31:0] clock_cnt = 0;
  reg start;

  always @(posedge clk)
    begin
      if(clock_cnt == 32'd10000000)
        begin
          clock_cnt <= 0;
          start     <= 1'b1;
        end
      else
        begin
          clock_cnt <= clock_cnt + 32'b1;
          start     <= 1'b0;
        end
    end

  uart_display uart_display (
    .clk        (clk        ),
    .rst        (rst        ),
    .start      (start      ),
    .tx         (tx         ),
    .pc         (pc         ),
    .inst       (inst       ),
    .rs1        (rs1        ),
    .rs1_val    (rs1_val    ),
    .rs2        (rs2        ),
    .rs2_val    (rs2_val    ),
    .rd         (rd         ),
    .reg_i_data (reg_i_data ),
    .reg_wen    (reg_wen    ),
    .is_imm     (is_imm     ),
    .is_auipc   (is_auipc   ),
    .is_lui     (is_lui     ),
    .imm        (imm        ),
    .a_val      (a_val      ),
    .b_val      (b_val      ),
    .alu_ctrl   (alu_ctrl   ),
    .cmp_ctrl   (cmp_ctrl   ),
    .alu_res    (alu_res    ),
    .cmp_res    (cmp_res    ),
    .is_branch  (is_branch  ),
    .is_jal     (is_jal     ),
    .is_jalr    (is_jalr    ),
    .do_branch  (do_branch  ),
    .pc_branch  (pc_branch  ),
    .mem_wen    (mem_wen    ),
    .mem_ren    (mem_ren    ),
    .dmem_o_data(dmem_o_data),
    .dmem_i_data(dmem_i_data),
    .dmem_addr  (dmem_addr  ),
    .csr_wen    (csr_wen    ),
    .csr_ind    (csr_ind    ),
    .csr_ctrl   (csr_ctrl   ),
    .csr_r_data (csr_r_data ),
    .x0         (x0         ),
    .ra         (ra         ),
    .sp         (sp         ),
    .gp         (gp         ),
    .tp         (tp         ),
    .t0         (t0         ),
    .t1         (t1         ),
    .t2         (t2         ),
    .s0         (s0         ),
    .s1         (s1         ),
    .a0         (a0         ),
    .a1         (a1         ),
    .a2         (a2         ),
    .a3         (a3         ),
    .a4         (a4         ),
    .a5         (a5         ),
    .a6         (a6         ),
    .a7         (a7         ),
    .s2         (s2         ),
    .s3         (s3         ),
    .s4         (s4         ),
    .s5         (s5         ),
    .s6         (s6         ),
    .s7         (s7         ),
    .s8         (s8         ),
    .s9         (s9         ),
    .s10        (s10        ),
    .s11        (s11        ),
    .t3         (t3         ),
    .t4         (t4         ),
    .t5         (t5         ),
    .t6         (t6         ),
    .mstatus_o  (mstatus_o  ),
    .mcause_o   (mcause_o   ),
    .mepc_o     (mepc_o     ),
    .mtval_o    (mtval_o    ),
    .mtvec_o    (mtvec_o    ),
    .mie_o      (mie_o      ),
    .mip_o      (mip_o      )
  );

endmodule
