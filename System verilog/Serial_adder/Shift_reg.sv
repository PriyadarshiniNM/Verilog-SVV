module Shift_reg(input logic clk, reset, serial_in,
                     output logic [3:0] parallel_out);

    logic [3:0] register;

    always_ff @(posedge clk or posedge reset)
    begin
        if (reset)
            register <= 4'b0000;
        else
            register <= {register[2:0], serial_in};
    end

    assign parallel_out = register;

endmodule
