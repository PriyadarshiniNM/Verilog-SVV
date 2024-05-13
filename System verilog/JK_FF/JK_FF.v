// testbench of JK flip flop ( JK_FF_tb.sv )
program JK_FF_tb ( JK_inter.TB T1);
initial begin
	T1.rst <= 1'b1; //reset high
    T1.cb.J <= 1'b0;	T1.cb.K <= 1'b0;
	#10	T1.K <= 1'b1;

	#20	T1.rst <= 1'b0; //reset low
	#10	T1.cb.J <= 1'b0;	T1.cb.K <= 1'b0;
	#10	T1.cb.K <= 1'b1;
	#10	T1.cb.J <= 1'b1; T1.cb.K<= 1'b0;
	#10	T1.cb.K <= 1'b1;
	#50	$finish;
end
endprogram 
