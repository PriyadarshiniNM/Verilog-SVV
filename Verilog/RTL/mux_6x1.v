 //6x1 Multiplexer
 module mux_6x1(input [5:0]i,
 input [2:0] s,
 output y);
 wire w0, w1, w2, w3;
 
 //instantiating multiple 2x1 Multiplexers
 mux_2x1 inst1(.a(i[0]), .b(i[1]), .sel(s[0]), .y(w0));
 mux_2x1 inst2(.a(i[2]), .b(i[3]), .sel(s[0]), .y(w1));
 mux_2x1 inst3(.a(i[4]), .b(i[5]), .sel(s[0]), .y(w2));
 mux_2x1 inst4(.a(w0), .b(w1), .sel(s[1]), .y(w3));
 mux_2x1 inst5(.a(w3), .b(w2), .sel(s[2]), .y(y));
 endmodule