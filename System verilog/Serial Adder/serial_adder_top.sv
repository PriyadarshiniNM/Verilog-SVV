//Top module of Serial Adder ( SA_Top.sv )
`include "serial_adder.v"
`include "serial_adder_tb.sv"
`include "serial_adder_inter.sv"

module serial_adder_top;

    bit clk;
    always #5 clk=~clk;

    serial_adder_inter sai (clk); // Instantiate the interface
    serial_adder_tb tb (sai);// Instantiate the testbench
    // Instantiate the Device Under Test (DUT)
    serial_adder dut (.clk(clk), .reset(sai.reset), .a(sai.a), .b(sai.b), .cin(sai.cin), .sum(sai.sum), .cout(sai.cout));
  
    initial begin
        $dumpfile("serial_adder_top.vcd");
        $dumpvars;
    end
endmodule