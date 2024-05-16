module serial_adder_tb;

    logic clk;
    logic reset;
    logic [3:0] serial_in_a;
    logic [3:0] serial_in_b;
    logic [3:0] sum_out;

    // Clocking block
    clocking cb @(posedge clk);
        default input #1;
        default output #0;
    endclocking

    // Modports
    modport dut_port(input clk, reset, serial_in_a, serial_in_b,
                     output sum_out);

    // Program block
    initial begin
        $dumpfile("serial_adder_tb.vcd");
        $dumpvars(0, serial_adder_tb);
        
        clk = 0;
        forever #5 clk = ~clk;
        
        reset = 1;
        serial_in_a = 4'b0000;
        serial_in_b = 4'b0000;
        
        #10 reset = 0;
        
        // Test vectors
        serial_in_a = 4'b0110;
        serial_in_b = 4'b1011;
        #100;
        $finish;
    end

    // Instantiate DUT
    serial_adder dut_inst(.dut_port);

endmodule