 module mux_2x1(input a, b, sel,
 output reg y);
 always@(a, b, sel)
 begin
   y =sel ? b : a;
 end
 endmodule
