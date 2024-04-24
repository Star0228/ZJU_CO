`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/05 23:19:29
// Design Name: 
// Module Name: TruthEvaluator_tb
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


module TruthEvaluator_tb;
reg clk;
reg  truth_detection;
wire trust_decision;

TruthEvaluator s1(
.clk(clk),
.truth_detection(truth_detection),
.trust_decision(trust_decision)
);
initial begin
    clk = 0;
    truth_detection = 0;
end
always begin
    #10 clk = ~clk;
end
always begin
    truth_detection= ~truth_detection;
    #100;
    truth_detection= ~truth_detection;
    #15;
    truth_detection= ~truth_detection;
    #15;
end
endmodule
