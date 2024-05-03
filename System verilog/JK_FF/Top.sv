//Top module of JK flip flop ( Top.sv )
module Top ();
bit clk;
JK_inter I1 (clk );
JK_FF_tb Inst1( I1.TB );
JK_FF DUT ( I1 );

always #5 clk = ~clk;
initial begin 
    $dumpfile( “JK_FF.vcd” );
    $dumpvars;
    $monitor( $time, “reset = %d, J = %d, K = %d, Q = %d”, I1.rst, I1.T, I1.Q );
end
endmodule
