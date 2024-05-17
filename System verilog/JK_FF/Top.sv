//Top module of JK flip flop ( Top.sv )

`include "JK_inter.sv"
`include "JK_FF_tb.sv"
`include "JK_FF.v"
module Top ();
	bit clk;
	always #5 clk = ~clk; 
	JK_inter I1 (clk);
    JK_FF_tb Inst1(I1);
    JK_FF DUT (.clk(clk), .rst(I1.rst), .J(I1.J), .K(I1.K), .Q(I1.Q));

    initial begin 
    	$dumpfile("JK_FF.vcd");
       	$dumpvars;
        //$monitor( $time, "clk = %d, reset = %d, J = %d, K = %d, Q = %d", I1.rst, I1.J, I1.K, I1.Q);
    end
endmodule
