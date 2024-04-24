1. 修改约束文件，添加
set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { tx }];

2. 调用方法：
修改CSSTE端口声明，添加
output wire tx
实例化方法：
UART uart_inst(.clk(clk_100mhz), .rst(sw[0]), .tx(tx), .pc(PC), .inst(inst));
其中clk接100MHz时钟，rst为串口复位信号，其它端口按需接入

3.添加后，原VGA的端口与代码可删除