//Top module of Serial Adder ( SA_Top.sv )
`timescale 1ns/1ps
`include "serial_adder.v"
`include "serial_adder_tb.sv"
`include "serial_adder_inter.sv"

module serial_adder_top;

    bit clk;
    logic a, b, cin, rst;
    wire sum, cout;

    serial_adder_inter sai (clk); // Instantiate the interface

    // Instantiate the Device Under Test (DUT)
    serial_adder dut (.clk(clk), .rst(rst), .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    // Instantiate the testbench
    serial_adder_tb tb (sai);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("serial_adder_top.vcd");
        $dumpvars;
    end
endmodule