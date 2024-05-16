module FullAdder(
    input a, b, cin,
    output sum, cout
);

assign sum = a ^ b ^ cin;
assign cout = (a & b) | (cin & (a ^ b));

endmodule

module PISO(
    input clk, reset,
    input [3:0] parallel_in,
    output reg serial_out
);

reg [3:0] shift_reg;
reg [3:0] serial_out_reg;
reg [2:0] counter;

always @(posedge clk) begin
    if (reset) begin
        shift_reg <= 4'd0;
        serial_out_reg <= 4'd0;
        counter <= 3'd0;
    end 
    else if (counter == 3'b000) begin
        shift_reg <= {shift_reg[2:0], parallel_in[0]};
        serial_out_reg <= shift_reg;
        counter <= 3'b0001;
    end 
    else begin
        shift_reg <= {shift_reg[2:0], parallel_in[0]};
        serial_out_reg <= shift_reg;
        counter <= counter + 1'b1;
    end
end

assign serial_out = serial_out_reg[3];

endmodule

module SerialAdder(
    input clk,
    input reset,
    input [3:0] a, b,
    output reg [3:0] result
);

wire [3:0] sum;
wire [3:0] carry;

FullAdder FA0(.a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(carry[0]));
FullAdder FA1(.a(a[1]), .b(b[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]));
FullAdder FA2(.a(a[2]), .b(b[2]), .cin(carry[1]), .sum(sum[2]), .cout(carry[2]));
FullAdder FA3(.a(a[3]), .b(b[3]), .cin(carry[2]), .sum(sum[3]), .cout(result[3]));

PISO shift_reg(.clk(clk), .reset(reset), .parallel_in(sum), .serial_out());

endmodule