`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/13 13:34:51
// Design Name: 
// Module Name: CSSTE
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

module CSSTE(
    input         clk_100mhz,
    input         RSTN,
    input  [3:0]  BTN_y,
    input  [15:0] SW,
    output [3:0]  Blue,
    output [3:0]  Green,
    output [3:0]  Red,
    output        HSYNC,
    output        VSYNC,
    output [15:0] LED_out,
    output [7:0] AN,
    //add debugger
    output wire tx,
    
    //add debugger
    
    output [7:0] segment
);
wire [3:0]U9_btnok;
wire [15:0]U9_swok;
wire U9_rst;
wire [31:0]U8_clkdiv;
wire U8_clkcpu;
wire U10_cnt0,U10_cnt1,U10_cnt2;
wire [31:0]U10_cntout;
wire [31:0]U2_spo;
wire U1_memrw;
wire [31:0]U1_add;
wire [31:0]U1_data;
wire [31:0]U1_pc;
wire [31:0]U3_douta;
wire [31:0]U4_cpu;
wire [31:0]U4_ramin;
wire [9:0]U4_ramadd;
wire U4_datawe,U4_gpiofwe,U4_gpioewe,U4_cntwe;
wire [31:0]U4_pin;
wire [7:0]U5_LEout;
wire [7:0]U5_ptout;
wire [31:0]U5_dispnum;
wire [1:0]U7_cntset;
SAnti_jitter U9(.clk(clk_100mhz), .RSTN(RSTN), .Key_y(BTN_y), .SW(SW),.BTN_OK(U9_btnok), .SW_OK(U9_swok), .rst(U9_rst));

clk_div U8(.clk(clk_100mhz), .rst(U9_rst), .SW2(U9_swok[2]), .SW8(U9_swok[8]), .STEP(U9_swok[10]), .clkdiv(U8_clkdiv), .Clk_CPU(U8_clkcpu));

Counter_x U10(.clk(~U8_clkcpu), .rst(U9_rst), .clk0(U8_clkdiv[6]), .clk1(U8_clkdiv[9]), .clk2(U8_clkdiv[11]), .counter_we(U4_cntwe), .counter_val(U4_pin),.counter_ch(U7_cntset), .counter0_OUT(U10_cnt0), .counter1_OUT(U10_cnt1), .counter2_OUT(U10_cnt2), .counter_out(U10_cntout));

ROM_1 U2(
    .a(U1_pc[11:2]),
    .spo(U2_spo)
    );

//SCPU_W U1(.clk(U8_clkcpu), .rst(U9_rst), .inst_in(U2_spo), .Data_in(U4_cpu), .MemRW(U1_memrw), .PC_out(U1_pc), .Data_out(U1_data), .Addr_out(U1_add));
wire [3:0]wea;
wire        CPU_MIO;
wire [31:0]Reg00,Reg01,Reg02,Reg03,Reg04,Reg05,Reg06,Reg07,Reg08,Reg09,Reg10,Reg11,Reg12,Reg13,Reg14,Reg15,Reg16,Reg17,Reg18,Reg19,Reg20,Reg21,Reg22,Reg23,Reg24,Reg25,Reg26,Reg27,Reg28,Reg29,Reg30,Reg31;
SCPU_W_1 U1(
    .clk(U8_clkcpu),
    .rst(U9_rst), 
    .inst_in(U2_spo), 
    .Data_in(U3_douta), 
    .MIO_ready(CPU_MIO),
    .MemRW(U1_memrw), 
    .CPU_MIO(CPU_MIO),
    .PC_out(U1_pc), 
    .Data_out(U1_data), 
    .Addr_out(U1_add),
.wea(wea),
.Reg00(Reg00),
.Reg01(Reg01),
.Reg02(Reg02),
.Reg03(Reg03),
.Reg04(Reg04),
.Reg05(Reg05),.Reg06(Reg06),.Reg07(Reg07),.Reg08(Reg08),.Reg09(Reg09),.Reg10(Reg10),.Reg11(Reg11),.Reg12(Reg12),.Reg13(Reg13),.Reg14(Reg14),.Reg15(Reg15),.Reg16(Reg16),.Reg17(Reg17),.Reg18(Reg18),.Reg19(Reg19),.Reg20(Reg20),.Reg21(Reg21),.Reg22(Reg22),.Reg23(Reg23),.Reg24(Reg24),.Reg25(Reg25),.Reg26(Reg26),.Reg27(Reg27),.Reg28(Reg28),.Reg29(Reg29),.Reg30(Reg30),.Reg31(Reg31)
);

//RAM_1 U3(.clka(~clk_100mhz),.wea(U4_datawe),.addra(U4_ramadd),.dina(u4ram),.douta(U3_douta));

RAM_1 U3(
    .clka(~U8_clkcpu),
    .wea({4{U1_memrw}}&wea),
    .addra(U1_add[11:2]),
    .dina(U1_data),
    .douta(U3_douta));

// RAM_1 U3(.clka(~clk_100mhz),.wea({4{U4_datawe}}&wea),.addra(U4_ramadd),.dina(u4ram),.douta(U3_douta));

MIO_BUS U4(
    .clk(clk_100mhz),
    .rst(U9_rst), 
    .BTN(U9_btnok), 
    .SW(U9_swok), 
    .mem_w(U1_memrw), 
    .Cpu_data2bus(U1_data), 
    .addr_bus(U1_add),
    .ram_data_out(U3_douta), 
    .led_out(LED_out), 
    .counter_out(U10_cntout), 
    .counter0_out(U10_cnt0), 
    .counter1_out(U10_cnt1), 
    .counter2_out(U10_cnt2), 
    .Cpu_data4bus(U4_cpu), 
    .ram_data_in(U4_ramin), 
    .ram_addr(U4_ramadd), 
    .data_ram_we(U4_datawe), 
    .GPIOf0000000_we(U4_gpiofwe),
    .GPIOe0000000_we(U4_gpioewe), 
    .counter_we(U4_cntwe), 
    .Peripheral_in(U4_pin));

Multi_8CH32 U5(.clk(~U8_clkcpu), .rst(U9_rst), .EN(U4_gpioewe), .Test(U9_swok[7:5]), .point_in({U8_clkdiv,U8_clkdiv}), .LES(64'b0), .Data0(U4_pin), .data1({2'b0,U1_pc[31:2]}), .data2(U2_spo), .data3(U10_cntout), .data4(U1_add), .data5(U1_data), .data6(U4_cpu), .data7(U1_pc), .point_out(U5_ptout), .LE_out(U5_LEout), .Disp_num(U5_dispnum));

Seg7_Dev_0 U6(.disp_num(U5_dispnum),.point(U5_ptout),.les(U5_LEout),.scan(U8_clkdiv[18:16]),.AN(AN),.segment(segment));

SPIO U7(.clk(~U8_clkcpu), .rst(U9_rst), .Start(U8_clkdiv[20]), .EN(U4_gpiofwe), .P_Data(U4_pin), .counter_set(U7_cntset), .LED_out(LED_out));

//VGA U11(.clk_25m(U8_clkdiv[1]), .clk_100m(clk_100mhz), .rst(U9_rst), .pc(U1_pc), .inst(U2_spo), .alu_res(U1_add), .mem_wen(U1_memrw), .dmem_o_data(U3_douta), .dmem_i_data(U4_ramin), .dmem_addr(U1_add), .hs(HSYNC),.vs(VSYNC), .vga_r(Red), .vga_g(Green), .vga_b(Blue));

UART uart_inst(
    .clk(clk_100mhz), 
    .rst(SW[0]), 
    .tx(tx), 
    .pc(U1_pc), 
    .inst(U2_spo),
    .x0(Reg00),
    .ra(Reg01),.sp(Reg02),.gp(Reg03),.tp(Reg04),.t0(Reg05),.t1(Reg06),.t2(Reg07),.s0(Reg08),.s1(Reg09),.a0(Reg10),.a1(Reg11),.a2(Reg12),.a3(Reg13),
    .a4(Reg14),.a5(Reg15),.a6(Reg16),.a7(Reg17),.s2(Reg18),.s3(Reg19),.s4(Reg20),.s5(Reg21),.s6(Reg22),.s7(Reg23),.s8(Reg24),.s9(Reg25),.s10(Reg26),
    .s11(Reg27),.t3(Reg28),.t4(Reg29),.t5(Reg30),.t6(Reg31)
    );
endmodule