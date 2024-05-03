 //7x1 Multiplexer
module mux_7x1(input [6:0] i,
 input [2:0] s,
 output y);
 wire w0, w1, w2, w3, w4, w5, w6;

  //instantiating multiple 2x1 Multiplexers
 mux_2x1 inst1(.a(i[0]), .b(i[1]), .sel(s[0]), .y(w0));
 mux_2x1 inst2(.a(i[2]), .b(i[3]), .sel(s[0]), .y(w1));
 mux_2x1 inst3(.a(i[4]), .b(i[5]), .sel(s[0]), .y(w2));
 mux_2x1 inst4(.a(w0), .b(w1), .sel(s[1]), .y(w3));
 mux_2x1 inst5(.a(w2), .b(i[6]), .sel(s[1]), .y(w4));
 mux_2x1 inst6(.a(w3), .b(w4), .sel(s[2]), .y(w5));
 mux_2x1 inst7(.a(w5), .b(w6), .sel(s[2]), .y(y));
 endmodule