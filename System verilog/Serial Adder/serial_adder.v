module serial_adder(
    input clk, reset,
    input [3:0] a, b,
    input cin,
    output reg sum, cout
);
    reg [3:0] shift_a, shift_b;
    reg carry;
    reg [1:0] bit_counter;

    always @(posedge clk or posedge reset) begin
        shift_a <= a;
        shift_b <= b;
        carry <= cin;
        if (reset) begin
            shift_a <= 4'b0;
            shift_b <= 4'b0;
            sum <= 1'b0;
            carry <= 1'b0;
            cout <= 1'b0;
            bit_counter <= 3'd0;
        end 
        else if (bit_counter <= 2'd3) begin
            {carry, sum} <= shift_a[0] + shift_b[0] + carry;
            shift_a <= {1'b0, shift_a[3:1]};
            shift_b <= {1'b0, shift_b[3:1]};
            bit_counter <= bit_counter + 1;
            if (bit_counter == 3'd3) begin
                cout <= carry;
            end
        end
    end
endmodule