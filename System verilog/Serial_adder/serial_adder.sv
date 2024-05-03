module serial_adder_4bit (
    input clk, rst_n,
    input wire [3:0] A, B,
    output reg [3:0] result
);

reg [3:0] sum;
reg [3:0] carry;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        sum <= 4'b0000;
        carry <= 4'b0000;
    end else begin
            for (int i = 0; i < 4; i++) begin
                full_adder fa (.a(operand_a[i]), .b(operand_b[i]), .cin(carry[i]), .sum(sum[i]), .cout(carry[i+1]));
            end
            result <= sum;
    end
end
endmodule