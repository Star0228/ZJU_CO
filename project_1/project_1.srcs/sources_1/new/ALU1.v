`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/08 10:21:37
// Design Name: 
// Module Name: ALU
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

module ALU1(
    input [2:0] A,
    input [2:0] B,
    input [3:0] ALU_operation,
    output [2:0] res,
    output [2:0] res1,
        output [2:0] res2,
            output [2:0] res3
);
//assign res = (ALU_operation == 4'd6) ?$signed(A)>>> $signed(B) :                            // SRL Logic
    assign res = (ALU_operation == 4'd6) ?$signed(A)>>> $signed(B) :  
                $signed(3'b000);
                //3'b000;
     assign res1 =  $signed(A) >>> $signed(B);
     assign res2 =  $signed(A) >> $signed(B);
     assign res3 =  A >>> $signed(B);

endmodule
