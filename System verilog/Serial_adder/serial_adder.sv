module serial_adder(input logic clk, reset, serial_in_a, serial_in_b,
                   output logic [3:0] sum_out);

    logic [3:0] reg_a, reg_b;
    logic cin;

    Shift_reg #(.WIDTH(4)) reg_a_inst(.clk(clk), .reset(reset), .serial_in(serial_in_a), .parallel_out(reg_a));
    Shift_reg #(.WIDTH(4)) reg_b_inst(.clk(clk), .reset(reset), .serial_in(serial_in_b), .parallel_out(reg_b));

    always_ff @(posedge clk or posedge reset)
    begin
        if (reset)
            cin <= 1'b0;
        else
            cin <= 1'b0;
    end

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : adder_loop
            FullAdder full_adder_inst(.a(reg_a[i]), .b(reg_b[i]), .cin(cin), .sum(sum_out[i]), .cout(cin));
        end
    endgenerate

endmodule
