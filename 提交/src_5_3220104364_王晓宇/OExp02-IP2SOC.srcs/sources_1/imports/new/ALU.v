`timescale 1ns / 1ps
module ALU (
  input [31:0]  A,
  input [31:0]  B,
  input [3:0]   ALU_operation,
  output[31:0]  res,
  output  zero
);
reg [31:0] tem;
reg flag;
always@(*)begin
case(ALU_operation)
    4'd0: tem = $signed(A) + $signed(B);
    4'd1: tem =  $signed(A) - $signed(B);
    4'd2: tem = A << B[4:0];
    4'd3: tem = $signed(A)<$signed(B)?32'd1:32'd0 ;
    4'd4: tem = $unsigned(A)<$unsigned(B)?32'd1:32'd0;
    4'd5: tem = A ^ B;
    4'd6: tem = A >> B[4:0];
    4'd7: tem = $signed(A)>>>B[4:0];
    4'd8: tem = A | B;
    4'd9: tem = A & B;
    default: tem = 32'dz;
endcase
flag <= tem?1'b0:1'b1;
end

assign zero = flag;
assign res = tem;

endmodule