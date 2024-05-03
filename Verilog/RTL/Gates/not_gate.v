module not_gate(input A, output Y);
    mux_2x1 inst1(.a(1’b1), .b(1’b0), .sel(A), .y(Y));
endmodule