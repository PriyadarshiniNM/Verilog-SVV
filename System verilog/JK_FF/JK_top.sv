//Top module of JK flip flop ( jk_top.sv )

`include "JK_inter.sv"
`include "JK_FF_tb.sv"
`include "JK_FF.v"
module JK_top ();
	bit clk;

    JK_inter I1 (clk);
    JK_FF DUT (.clk(clk), .rst(I1.rst), .J(I1.J), .K(I1.K), .Q(I1.Q));
    JK_FF_tb Inst1(I1);

	always #5 clk = ~clk; 
	
    initial begin 
    	$dumpfile("JK_top.vcd");
       	$dumpvars;
        //$monitor("time=%d, clk=%b, rst=%b, J = %b, K = %b, Q = %b",$time, clk, I1.rst, I1.J, I1.K, I1.Q);
        #50 $finish;
    end
endmodule
