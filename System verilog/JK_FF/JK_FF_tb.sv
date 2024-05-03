//testbench of JK flip flop ( JK_FF_tb.sv )
module JK_FF_tb ( JK_inter.TB t1);
initial begin
	t1.rst <= 1’b1;
	#10	t1.rst <= 1’b0;
	#10	t1.J <= 1’b0;	t1.K<= 1’b0;
	#10	t1.K <= 1’b1;
	#10	t1.J <= 1’b1; t1.K<= 1’b0;
	#10	t1.K <= 1’b1;
	#10	$finish;
end
endmodule