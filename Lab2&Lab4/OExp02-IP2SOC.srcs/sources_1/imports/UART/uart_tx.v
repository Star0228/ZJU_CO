`timescale 1ns / 1ps
// https://github.com/wd5gnr/icestickPWM/blob/master/v2/cores/osdvu/uart.v

// Documented Verilog UART
// Copyright (C) 2010 Timothy Goddard (tim@goddard.net.nz)
//               2013 Aaron Dahlen
// Distributed under the MIT licence.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
// 
//** INSTANTIATION ********************************************
//
//  To instantiate this module copy this section to your main code...
//
//    uart_tx #(
//        .baud_rate(baud_rate),            // default is 9600
//        .sys_clk_freq(sys_clk_freq)       // default is 100000000
//     )
//    instance_name(
//        .clk(clk),                        // The master clock for this module
//        .rst(rst),                        // Synchronous reset
//        .rx(rx),                          // Incoming serial line
//        .tx(tx),                          // Outgoing serial line
//        .transmit(transmit),              // Signal to transmit
//        .tx_byte(tx_byte),                // Byte to transmit       
//        .received(received),              // Indicated that a byte has been received
//        .rx_byte(rx_byte),                // Byte received
//        .is_receiving(is_receiving),      // Low when receive line is idle
//        .is_transmitting(is_transmitting),// Low when transmit line is idle
//        .recv_error(recv_error)           // Indicates error in receiving packet.
//      //.recv_state(recv_state),          // for test bench
//      //.tx_state(tx_state)               // for test bench
//    );
//

 module uart_tx(
    input clk,                  // The master clock for this module
    input rst,                  // Synchronous reset
    output tx,                  // Outgoing serial line
    input transmit,             // Assert to begin transmission
    input [7:0] tx_byte,        // Byte to transmit
    output is_transmitting      // Low when transmit line is idle.
);

// The clock_divider is calculated using baud_rate and sys_clk_freq.  
// To modify baud rate you can modify the defaults shown below or instantiate
// the module using the template shown in the INSTANTIATION section above. 
// For aditional information about instantiation please see:
// http://www.sunburst-design.com/papers/CummingsHDLCON2002_Parameters_rev1_2.pdf

    parameter baud_rate = 9600;
    parameter sys_clk_freq = 10000_0000;
   
    localparam one_baud_cnt = sys_clk_freq / (baud_rate);

//** SYMBOLIC STATE DECLARATIONS ******************************

    localparam [1:0]     
        TX_IDLE             = 2'd0,
        TX_SENDING          = 2'd1,
        TX_DELAY_RESTART    = 2'd2,
        TX_RECOVER          = 2'd3;
  
  
//** SIGNAL DECLARATIONS **************************************

    reg [log2(one_baud_cnt)-1:0] tx_clk;

    reg tx_out = 1'b1;
    reg [1:0] tx_state = TX_IDLE;
    reg [3:0] tx_bits_remaining;
    reg [7:0] tx_data;
    

//** ASSIGN STATEMENTS ****************************************

    assign tx = tx_out;
    assign is_transmitting = tx_state != TX_IDLE;


//** TASKS / FUNCTIONS **************************************** 

    function integer log2(input integer M);
        integer i;
    begin
        log2 = 1;
        for (i = 0; 2**i <= M; i = i + 1)
            log2 = i + 1;
    end endfunction
    
    
//** Body *****************************************************

    always @(posedge clk) begin
        if (rst) begin
            tx_state = TX_IDLE;
        end
                              
        // Countdown timers for the receiving and transmitting
        // state machines are decremented.
    
        if(tx_clk) begin
            tx_clk = tx_clk - 1'd1;
        end
        
        
//** Transmit state machine ***********************************

        case (tx_state)
            TX_IDLE: begin
                if (transmit) begin
                    // If the transmit flag is raised in the idle
                    // state, start transmitting the current content
                    // of the tx_byte input.
                    tx_data = tx_byte;
                    // Send the initial, low pulse of 1 bit period
                    // to signal the start, followed by the data
                  //  tx_clk_divider =  clock_divide;                                
                    tx_clk = one_baud_cnt;
                    tx_out = 0;
                    tx_bits_remaining = 8;
                    tx_state = TX_SENDING;
                end
            end
            
            TX_SENDING: begin
                if (!tx_clk) begin
                    if (tx_bits_remaining) begin
                        tx_bits_remaining = tx_bits_remaining - 1'd1;
                        tx_out = tx_data[0];
                        tx_data = {1'b0, tx_data[7:1]};
                        tx_clk = one_baud_cnt;
                        tx_state = TX_SENDING;
                    end else begin
                        // Set delay to send out 2 stop bits.
                        tx_out = 1;
                        tx_clk = 16 * one_baud_cnt;// tx_countdown = 16;
                        tx_state = TX_DELAY_RESTART;
                    end
                end
            end
            
            TX_DELAY_RESTART: begin
                // Wait until tx_countdown reaches the end before
                // we send another transmission. This covers the
                // "stop bit" delay.
                tx_state = tx_clk ? TX_DELAY_RESTART : TX_RECOVER;// TX_IDLE;
            end
            
            TX_RECOVER: begin
                // Wait unitil the transmit line is deactivated.  This prevents repeated characters
                tx_state = transmit ? TX_RECOVER : TX_IDLE;
           
            end
            
        endcase
    end

endmodule
