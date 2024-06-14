`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 10:19:28
// Design Name: 
// Module Name: sim_Cache
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


module sim_cache;
reg clk;
reg rst;
reg [31:0] addr_cpu;
reg [31:0] data_cpu_write;
reg [127:0] data_mem_read;
reg wr_cpu;
reg ready_mem;
reg rd_cpu;
wire wr_mem;
wire rd_mem;
wire [127:0] data_mem_write;
wire [31:0] data_cpu_read;
wire [31:0] addr_mem;
initial begin
    clk = 1;
    rst = 1;
    wr_cpu = 0;
    rd_cpu = 0;
    #10;
    rst = 0;
    ready_mem = 1;
    /*Read Miss and then update from the Memory*/
    wr_cpu = 0;
    rd_cpu = 1;
    //Read Miss
    addr_cpu = 32'h10000000;
    data_mem_read = 128'h11111111222222223333333344444444;
    #40;
    //Read mem_read
    addr_cpu = 32'h10000002; #40;
    //Read Miss
    addr_cpu = 32'h20000000;
    data_mem_read = 128'h55555555666666667777777788888888;
    #40;
    //Read mem_read
    addr_cpu = 32'h20000001; #40;
    //Read Miss
    addr_cpu = 32'h30000002;
    #40;
    /*Write into Cache and update memory*/
    wr_cpu = 1;
    rd_cpu = 0;
    addr_cpu = 32'h00000207;
    data_cpu_write = 32'hAAAAAAAA;
    #40;
    //Write to same location
    addr_cpu = 32'h00000207;
    data_cpu_write = 32'hFFFFFFFF;
    #40;
    //read mem_read
    rd_cpu = 1'd1;
    wr_cpu = 1'd0;
    addr_cpu = 32'h00000207;
    #40;
//    // Write to same location
//    wr_cpu = 1'd1;
//    rd_cpu = 1'd0;
//    data_cpu_write = 32'habababab;
//    addr_cpu = 32'h00000207;
//    // Read from same location to check updated data
//    rd_cpu = 1'd1;
//    wr_cpu = 1'd0;
//    addr_cpu = 32'h00000207;
//    wr_cpu = 0;
//    rd_cpu = 1;
//    addr_cpu = 32'h10000001; #20;
//    addr_cpu = 32'h20000002; #20;
    addr_cpu = 32'h30000207;
    data_mem_read = 128'hAAAAAAAABBBBBBBBCCCCCCCCDDDDDDDD; #40;
end
always #5 clk = ~clk;
Cache U1 (
    .clk(clk),
    .rst(rst),
    .addr_cpu(addr_cpu),
    .data_cpu_write(data_cpu_write),
    .data_mem_read(data_mem_read),
    .wr_cpu(wr_cpu),
    .rd_cpu(rd_cpu),
    .ready_mem(ready_mem),
    .wr_mem(wr_mem),
    .rd_mem(rd_mem),
    .data_mem_write(data_mem_write),
    .data_cpu_read(data_cpu_read),
    .addr_mem(addr_mem)
);
endmodule