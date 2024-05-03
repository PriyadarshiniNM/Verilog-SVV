module full_adder(
    input a, b, cin,clk,
    output sum, cout
);

    always @(clk) begin
    sum = a ^ b ^ cin;
    cout = (a & b) | (a & cin) | (b & cin);
    end
endmodule