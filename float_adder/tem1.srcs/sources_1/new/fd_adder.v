`timescale 1ns/1ps
module fd_adder(
    input clk,
     input [31:0] a,
     input [31:0] b,
     output [31:0] sum
);
//choping verison

wire [7:0]exp;
wire sign = a[31] ^ b[31];
assign exp = a[30:23] > b[30:23]? a[30:23]: b[30:23];
reg [24:0]aa ;
reg [24:0]bb;
reg [24:0]sum1;
reg [31:0]sum2;
reg sign_bit;
reg [5:0]change;
//reg guard, round, sticky;

integer i;
always@(posedge clk)begin
i = 0;
aa = {1'b0,1'b1,a[22:0]};
bb = {1'b0,1'b1,b[22:0]};

if(a[30:23] > b[30:23])begin
     bb = bb >> (a[30:23] - b[30:23]);
end else begin
     aa = aa >> (b[30:23] - a[30:23]);
end

if(sign)begin
     sum1 = aa>bb? aa - bb: bb - aa;
     sign_bit = (aa>bb&&a[31])||(aa<bb&&b[31])?1:0;
end else begin
     sum1 = aa + bb;
     sign_bit = a[31];
end

if(sum1[24])begin
     sum2 = {sign_bit,exp+1'b1,sum1[23:1]};
end else begin

     change = 6'b0;
     for(;i<24;i=i+1)begin
          if(sum1[23-i]==0)begin
               change = change+1'b1;
          end else begin
               i = 24;
          end
     end
     sum1 = sum1<<change;
     sum2 = {sign_bit,exp[7:0]-{2'b0,change},sum1[22:0]};
     if(exp[7:0]<{2'b0,change}||sum1==0)begin
          sum2 = {sign_bit,8'b0,sum1[22:0]};
     end
end

if((a[30:23]==0&&a[22:0]!=0)||b[30:23]==0&&b[22:0]!=0)begin
sum2 = {9'b0, 23'b1};
end

end
assign sum  = sum2;
endmodule