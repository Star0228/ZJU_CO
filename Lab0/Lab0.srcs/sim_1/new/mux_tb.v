`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/28 13:13:10
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
    reg [15:0]SW;    
    reg clk;
    wire [3:0]LED;
    MUX4to1_lb0 md1(
    .clk(clk),
    .SW(SW),
    .LED(LED)
    );
    initial begin
    clk = 1;
    SW[15:14] = 2'b00;
    SW[3:0]=4'b0000;
    SW[7:4]=4'b0010;
    SW[11:8]=4'b0100;
    end
    always begin
    #10 clk = ~clk;
    end 
    always begin
      #40 SW[15:14] = SW[15:14]+2'b01;
    end
    always begin
    #10;
    SW[3:0]=4'b0101;
    #10; 
    SW[7:4]=4'b1010;
    #10;
    SW[7:4]=4'b1110;
    #10;
    SW[11:8]=4'b1111;
    #10;
    SW[11:8]=4'b1001;
    end
endmodule
