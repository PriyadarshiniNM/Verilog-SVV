 module mux_6x1_tb;
 reg [5:0] i;
 reg [2:0] s;
 wire y;
 mux_6x1 in1(.i(i), .s(s), .y(y));
 initial begin
    s = 3'b000;
    i = 6'b000001; #10
    s = 3'b001;
    i = 6'b000010; #10
    s = 3'b010;
    i = 6'b000100; #10
    s = 3'b011;
    i = 6'b001000; #10
    s = 3'b100;
    i = 6'b010000; #10
    s = 3'b101;
    i = 6'b100000; #10
    $finish;
 end

 initial begin
    $monitor($time, "a=%d, b=%d, sel=%d, y=d",in1.i, in1.s, in1.y);
    $dumpfile("mux_6x1.vcd");
    $dumpvars;
 end
 endmodule