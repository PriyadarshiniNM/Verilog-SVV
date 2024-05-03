module or_gate(input A, B, output Y);
    mux_2x1 inst1(.a(B), .b(1’b1), .sel(A), .y(Y));
endmodule