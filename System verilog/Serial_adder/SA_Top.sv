//Top module of Serial Adder ( SA_Top.sv )
module SA_Top ();
bit clk;
serial_adder_inter I1 (clk );
serial_adder_tb Inst1( I1.TB );
serial_adder ( I1 );

always #5 clk = ~clk;
initial begin 
    $dumpfile( “serial_adder.vcd” );
    $dumpvars;
    //$monitor( $time, “reset = %d, J = %d, K = %d, Q = %d”, I1.rst, I1.T, I1.Q );
end
endmodule
