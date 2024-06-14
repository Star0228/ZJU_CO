`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 10:14:49
// Design Name: 
// Module Name: Cache
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
module Cache(
    input wire clk, // clock
    input wire rst, // reset
    input wire [31:0] data_cpu_write, // data write in (to flush cache and flush memory)
    input wire [127:0] data_mem_read, // data from mem (to flush cache)
    input wire [31:0] addr_cpu, // cpu addr
    input wire wr_cpu, // cpu write enable
    input wire rd_cpu, // cpu read enable
    input wire ready_mem, // memory ready
    output reg wr_mem, // memory write enable
    output reg rd_mem, // memory read enable
    output reg [127:0] data_mem_write, // data to mem to change value in memory
    output reg [31:0] data_cpu_read, // data to cpu read from cache/memory
    output reg [31:0] addr_mem // memory addr. to get/write value from/to memory
);
localparam IDLE = 2'b00;
localparam COMPARE = 2'b01;
localparam ALLOCATE = 2'b10;
localparam WRITE_BACK = 2'b11;
reg [1:0] state;
reg [153:0]line[127:0][1:0];
wire [1:0] offset = addr_cpu[1:0];
wire [6:0] index = addr_cpu[8:2];
wire [22:0] tag = addr_cpu[31:9];

wire Hit_1pos = (line[index][0][153:131] == tag)&&(line[index][0][128] == 1'b1);
wire Hit_2pos = (line[index][1][153:131] == tag)&&(line[index][1][128] == 1'b1);
wire Dirty_1pos = line[index][0][129];
wire Dirty_2pos = line[index][1][129]; 
wire Dirty = Dirty_1pos || Dirty_2pos;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        state <= IDLE;
    end
    else begin
        case(state)
            IDLE:begin
                wr_mem <= 1'b0;
                rd_mem <= 1'b0;
                if(wr_cpu||rd_cpu)begin
                    state <= COMPARE;
                end
                else state <= IDLE;
            end
            COMPARE:begin
                if(Hit_1pos)begin
                    if(wr_cpu)begin
                        line[index][0][(offset*32)+:32] <= data_cpu_write;
                        line[index][0][129] <= 1'b1;//dirty
                        line[index][0][130] <= 1'b1;//lru
                        line[index][1][130] <= 1'b0;
                        state <= IDLE;
                    end
                    else begin
                        data_cpu_read <= line[index][0][(offset*32)+:32];
                        state <= IDLE;
                        rd_mem <=1'b0;
                    end
                end
                else if(Hit_2pos)begin
                    if(wr_cpu)begin
                        line[index][1][(offset*32)+:32] <= data_cpu_write;
                        line[index][1][129] <= 1'b1;//dirty
                        line[index][1][130] <= 1'b1;//lru
                        line[index][0][130] <= 1'b0;//lru
                        state <= IDLE;
                    end
                    else begin
                        data_cpu_read <= line[index][1][(offset*32)+:32];
                        state <= IDLE;
                        rd_mem <=1'b0;
                    end
                end
                else begin
                    if(Dirty)begin
                        state<= WRITE_BACK;
                        wr_mem <= 1'b1;
                        rd_mem <= 1'b0;
                    end
                    else begin
                        state <= ALLOCATE;
                        rd_mem <= 1'b1;
                        rd_mem <= 1'b0;
                    end
                end
            end
            
            ALLOCATE:begin
                if(ready_mem)begin
                    if(line[index][0][130]==1'b0)begin
                        line[index][0][128] <= 1'b1;
                        line[index][0][129] <= 1'b0;
                        line[index][0][127:0] <= data_mem_read;
                        line[index][0][153:131] <= tag;
                    end 
                    else begin 
                        line[index][1][128] <= 1'b1;
                        line[index][1][129] <= 1'b0;
                        line[index][1][127:0] <= data_mem_read;
                        line[index][1][153:131] <= tag;
                    end
                    state <= COMPARE;
                end
                else begin
                    state <= ALLOCATE;
                end
            end
            WRITE_BACK:begin
                if(ready_mem)begin
                    wr_mem <= 1'b1;
                    if(Dirty_1pos)begin
                        data_mem_write <= line[index][0][127:0];
                        line[index][0][129] <=1'b0;//dirty
                    end
                    else begin 
                        data_mem_write <= line[index][1][127:0];
                        line[index][1][129] <=1'b0;//dirty
                    end
                    state <= ALLOCATE;
                end
                else begin 
                    state <= WRITE_BACK;
                end
            end
        endcase
    end
    addr_mem <= {addr_cpu[31:2],2'b00};
end

endmodule
