// Target Devices: `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/25 15:30:07
// Design Name: 
// Module Name: MUX1
// Project Name: 

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


module MUX1(
	output wire [31:0] out1 ,
	output wire [31:0] out2,
	output wire [31:0] out3,
	output wire [31:0] out4 
    );
    assign out1 = $signed(32'hffff0000)>>>$signed(32'd4);
	assign out2 = $signed(32'hffff0000)>>>$unsigned(32'd4);
	assign out3 = 32'hffff0000>>>$signed(32'd4);
	assign out4 = $unsigned(32'hffff0000)>>>$signed(32'd4);
	
endmodule
