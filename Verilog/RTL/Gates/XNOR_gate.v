//XNOR gate function
module xnor_gate(input A, B, output Y);
    mux_2x1 inst1(.a(~B), .b(B), .sel(A), .y(Y));
endmodule