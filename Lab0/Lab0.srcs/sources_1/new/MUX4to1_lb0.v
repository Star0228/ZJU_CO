`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/28 12:53:42
// Design Name: 
// Module Name: MUX4to1_lb0
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


module MUX4to1_lb0(
    input clk,
    input [15:0]SW,
    output wire [3:0]LED
    );
    reg [3:0]led;
    always @* begin
        case(SW[15:14])
        2'b00:led = SW[3:0];  
        2'b01:led = SW[7:4];
        2'b10:led = SW[11:8];
        2'b11: led = 4'b0000;      
        endcase
    end
    assign LED = led;
    
endmodule
