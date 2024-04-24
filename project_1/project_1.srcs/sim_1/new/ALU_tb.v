module ALU_tb();
    reg[31:0] A; 
    reg[31:0] B;
    reg[3:0] ALU_operation;
    wire[31:0] res;

    ALU alu(.A(A), .B(B), .ALU_operation(ALU_operation), .res(res));

    initial begin
        ALU_operation = 4'd7;
        A = 32'hffff_0000;
        B = 32'd4;
        #40;
        A = 32'hffff_ffff;
        B = 32'd8;
    end
endmodule
