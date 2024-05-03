//AND gate function
module and_gate(input A, B, output Y);
    mux_2x1 inst1(.a(1’b0), .b(B), .sel(A), .y(Y));
endmodule