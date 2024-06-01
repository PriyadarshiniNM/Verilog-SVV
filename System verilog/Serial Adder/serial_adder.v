module serial_adder (
    input clk, rst,
    input a, b, cin,
    output sum, cout
);
    reg [3:0] shift_a, shift_b, sum_reg;
    reg carry;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_a <= 4'b0;
            shift_b <= 4'b0;
            sum_reg <= 4'b0;
            carry <= 1'b0;
        end else begin
            shift_a <= {shift_a[2:0], a};
            shift_b <= {shift_b[2:0], b};
            {carry, sum_reg} <= shift_a + shift_b + carry;
        end
    end

    assign sum = sum_reg[0];
    assign cout = carry;

endmodule