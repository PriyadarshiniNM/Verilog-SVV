//Interface module (JK_inter.sv)
interface JK_inter(input bit clk);
	logic rst,J, K;
    logic Q;

    clocking cb@(posedge clk);
    default input #2ns output #3ns;
    output J,K;
    input Q;
    endclocking

	modport TB ( clocking cb, output rst);
endinterface