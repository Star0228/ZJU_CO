`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/03/20 13:31:12
// Design Name:
// Module Name: uart_display
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


module uart_display(
    input clk,          // master clock
    input start,        // signal to start a printing round
    input rst,
    input [31:0] pc,
    input [31:0] inst,
    input [31:0] x0,
    input [31:0] ra,
    input [31:0] sp,
    input [31:0] gp,
    input [31:0] tp,
    input [31:0] t0,
    input [31:0] t1,
    input [31:0] t2,
    input [31:0] s0,
    input [31:0] s1,
    input [31:0] a0,
    input [31:0] a1,
    input [31:0] a2,
    input [31:0] a3,
    input [31:0] a4,
    input [31:0] a5,
    input [31:0] a6,
    input [31:0] a7,
    input [31:0] s2,
    input [31:0] s3,
    input [31:0] s4,
    input [31:0] s5,
    input [31:0] s6,
    input [31:0] s7,
    input [31:0] s8,
    input [31:0] s9,
    input [31:0] s10,
    input [31:0] s11,
    input [31:0] t3,
    input [31:0] t4,
    input [31:0] t5,
    input [31:0] t6,
    output tx
  );

  /* Parameters */
  parameter baud_rate = 9600;
  parameter sys_clk_freq = 10000_0000;
  parameter wait_clock = 5000000;  // wait 50ms after each printing round (with 100MHz master clock)
  // as 0.05 * sys_clk_freq = 0.05 * 10000_0000 = 5000000
  parameter char_wait_clock = 100000; // 1ms
  parameter str_idx_end = 516; // No more than 2048

  /* States */
  localparam [3:0]
             PRINT_IDLE          = 4'd0,
             PRINT_STR_INIT      = 4'd1,
             PRINT_SEND_CHAR_0   = 4'd2,
             PRINT_SEND_CHAR     = 4'd3,
             PRINT_WAIT_RDY_0    = 4'd4,
             PRINT_WAIT_RDY      = 4'd5,
             PRINT_CHAR_WAIT     = 4'd6,
             PRINT_DELAY_WAIT    = 4'd7,
             PRINT_ROUND_END     = 4'd8,
             PRINT_RESET         = 4'd9,
             PRINT_RESET_SEND_CHAR_0 = 4'd10,
             PRINT_RESET_SEND_CHAR = 4'd11,
             PRINT_RESET_WAIT_RDY_0 = 4'd12,
             PRINT_RESET_WAIT_RDY = 4'd13;

  /* Regs for state and uart-ports */
  reg [3:0] print_state = PRINT_IDLE;
  reg [log2(str_idx_end):0] str_idx = 0;
  reg [log2(wait_clock):0] wait_count, rst_wait_count = 0;
  reg [log2(char_wait_clock):0] char_wait_count, rst_char_wait_count = 0;
  reg transmit = 1'b0, rst_transmit = 1'b0;
  reg [7:0] tx_byte, rst_tx_byte;
  wire is_transmitting, rst_is_transmitting;

  wire [7:0] byte_to_print;
  string_to_print inst_string_to_print (.str_idx(str_idx),
                                        .data(byte_to_print),
                                        .pc(pc),
                                        .inst(inst),
                                        .x0(x0),
                                        .ra(ra),
                                        .sp(sp),
                                        .gp(gp),
                                        .tp(tp),
                                        .t0(t0),
                                        .t1(t1),
                                        .t2(t2),
                                        .s0(s0),
                                        .s1(s1),
                                        .a0(a0),
                                        .a1(a1),
                                        .a2(a2),
                                        .a3(a3),
                                        .a4(a4),
                                        .a5(a5),
                                        .a6(a6),
                                        .a7(a7),
                                        .s2(s2),
                                        .s3(s3),
                                        .s4(s4),
                                        .s5(s5),
                                        .s6(s6),
                                        .s7(s7),
                                        .s8(s8),
                                        .s9(s9),
                                        .s10(s10),
                                        .s11(s11),
                                        .t3(t3),
                                        .t4(t4),
                                        .t5(t5),
                                        .t6(t6));

  /* Functions */
  function integer log2(input integer M);
    integer i;
    begin
      log2 = 1;
      for (i = 0; 2**i <= M; i = i + 1)
        log2 = i + 1;
    end
  endfunction

  /* State-transfer */
  always @(posedge clk)
  begin
    case (print_state)
      PRINT_IDLE:
      begin
        if(start)
          print_state <= PRINT_STR_INIT;
        else if (rst)
          print_state <= PRINT_RESET;
        else
          print_state <= PRINT_IDLE;
      end
      PRINT_STR_INIT:
      begin
        print_state <= PRINT_SEND_CHAR_0;
      end
      PRINT_SEND_CHAR_0:
      begin
        print_state <= PRINT_SEND_CHAR;
      end
      PRINT_SEND_CHAR:
      begin
        print_state <= PRINT_WAIT_RDY_0;
      end
      PRINT_WAIT_RDY_0:
      begin
        print_state <= PRINT_WAIT_RDY;
      end
      PRINT_WAIT_RDY:
      begin
        if(!is_transmitting)
        begin
          // has sent a byte
          if(str_idx == str_idx_end)
          begin
            print_state <= PRINT_DELAY_WAIT;
          end
          else
          begin
            print_state <= PRINT_CHAR_WAIT;
          end
        end
        else
        begin
          print_state <= PRINT_WAIT_RDY;
        end
      end
      PRINT_CHAR_WAIT:
      begin
        if(char_wait_count == char_wait_clock)
        begin
          print_state <= PRINT_SEND_CHAR_0;
        end
        else
        begin
          print_state <= PRINT_CHAR_WAIT;
        end
      end
      PRINT_DELAY_WAIT:
      begin
        if(wait_count == wait_clock)
        begin
          print_state <= PRINT_ROUND_END;
        end
        else
        begin
          print_state <= PRINT_DELAY_WAIT;
        end
      end
      PRINT_ROUND_END:
      begin
        print_state <= PRINT_IDLE;
      end
      PRINT_RESET:
      begin
        print_state <= PRINT_RESET_SEND_CHAR_0;
      end
      PRINT_RESET_SEND_CHAR_0:
      begin
        print_state <= PRINT_RESET_SEND_CHAR;
      end
      PRINT_RESET_SEND_CHAR:
      begin
        print_state <= PRINT_RESET_WAIT_RDY_0;
      end
      PRINT_RESET_WAIT_RDY_0:
      begin
        print_state <= PRINT_RESET_WAIT_RDY;
      end
      PRINT_RESET_WAIT_RDY:
      begin
        if(!is_transmitting)
        begin
          // has sent a byte
          begin
            print_state <= PRINT_DELAY_WAIT;
          end
        end
        else
        begin
          print_state <= PRINT_RESET_WAIT_RDY;
        end
      end
    endcase
  end

  always @(posedge clk)
  begin
    if(print_state == PRINT_STR_INIT)
    begin
      str_idx <= 0;
    end
    else if (print_state == PRINT_SEND_CHAR)
    begin
      str_idx <= str_idx + 1'b1;
    end
  end

  always @(posedge clk)
  begin
    if(print_state == PRINT_DELAY_WAIT)
    begin
      wait_count <= wait_count + 2'b1;
    end
    else
    begin
      wait_count <= 0;
    end
  end

  always @(posedge clk)
  begin
    if(print_state == PRINT_SEND_CHAR_0)
    begin
      char_wait_count <= 0;
    end
    else if(print_state == PRINT_CHAR_WAIT)
    begin
      char_wait_count <= char_wait_count + 2'b1;
    end
  end

  always @(posedge clk)
  begin
    if(print_state == PRINT_SEND_CHAR)
    begin
      transmit <= 1'b1;
    end
    else
    begin
      transmit <= 1'b0;
    end
  end

  always @(posedge clk)
  begin
    if(print_state == PRINT_SEND_CHAR_0)
    begin
      tx_byte <= byte_to_print;
    end
  end

  // reset
  always @(posedge clk)
  begin
    if(print_state == PRINT_RESET_SEND_CHAR_0)
    begin
      rst_char_wait_count <= 0;
    end
  end

  always @(posedge clk)
  begin
    if(print_state == PRINT_RESET_SEND_CHAR)
    begin
      rst_transmit <= 1'b1;
    end
    else
    begin
      rst_transmit <= 1'b0;
    end
  end

  always @(posedge clk)
  begin
    if(print_state == PRINT_RESET_SEND_CHAR_0)
    begin
      rst_tx_byte <= 8'hc;
    end
  end

  wire [7:0] _tx_byte;
  wire _transmit, _is_transmitting;

  assign _tx_byte = rst ? rst_tx_byte : tx_byte;
  assign _transmit = rst ? rst_transmit : transmit;
  assign _is_transmitting = rst ? rst_is_transmitting : is_transmitting;


  uart_tx #(.baud_rate(baud_rate), .sys_clk_freq(sys_clk_freq))
          uart_inst (
            .clk(clk),
            .rst(1'b0),
            .tx(tx),
            .transmit(_transmit),
            .tx_byte(_tx_byte),
            .is_transmitting(_is_transmitting)
          );

  // ila_0 ila_inst (
  //     .clk(clk),
  //     .probe0(print_state),
  //     .probe1(str_idx),
  //     .probe2(wait_count),
  //     .probe3(transmit),
  //     .probe4(tx_byte),
  //     .probe5(is_transmitting)
  // );


endmodule
