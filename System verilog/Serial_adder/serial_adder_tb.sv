clocking cb @(posedge serial_adder_if.clk);
endclocking

serial_adder_if u_serial_adder (
    .clk(cb.clk),
    .rst_n(serial_adder_if.rst_n),
    .start(serial_adder_if.start),
    .operand_a(serial_adder_if.operand_a),
    .operand_b(serial_adder_if.operand_b),
    .result(serial_adder_if.result)
);

module serial_adder_tb();

    serial_adder_if dut_if();

    initial begin
        // Initialize inputs
        dut_if.clk = 0;
        dut_if.rst_n = 1;
        dut_if.start = 0;
        dut_if.operand_a = 4'b0000;
        dut_if.operand_b = 4'b0000;
        
        // Apply reset
        #10;
        dut_if.rst_n = 0;
        #10;
        dut_if.rst_n = 1;
        
        // Apply inputs and start calculation
        dut_if.operand_a = 4'b0010;
        dut_if.operand_b = 4'b0110;
        dut_if.start = 1;
        
        // Wait for calculation to complete
        #20;
        
        // Display result
        $display("Result: %b", dut_if.result);
        
        // Finish simulation
        #10;
        $finish;
    end

endmodule
