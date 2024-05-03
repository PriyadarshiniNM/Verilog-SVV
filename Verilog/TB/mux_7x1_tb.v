module mux_7x1_tb;
 reg [6:0] i;
 reg [2:0] s;
 wire y;
 mux_7x1 in1(.i(i), .s(s), .y(y));
 initial begin
    s = 3'b000;
    i = 7'b0000001; #10;
    s = 3'b001;
    i = 7'b0000010; #10;
    s = 3'b010;
    i = 7'b0000100; #10;
    s = 3'b011;
    i = 7'b0001000; #10;
    s = 3'b100;
    i = 7'b0010000; #10;
    s = 3'b101;
    i = 7'b0100000; #10;
    s = 3'b110;
    i = 7'b1000000; #10;
 end
 
 initial begin
    $monitor($time, " i=%d, s=%d, y=%d", i, s, y);
    $dumpfile("mux_7x1.vcd");
    $dumpvars;
 end
 endmodule