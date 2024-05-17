//Interface module (JK_inter.sv)
interface JK_inter(input bit clk);
	logic J, K, rst;
    logic Q;

    clocking cb@(posedge clk);
    default input #2ns output #3ns;
    input Q;
    output J,K;
    endclocking

	modport TB ( clocking cb, output rst);

endinterface
