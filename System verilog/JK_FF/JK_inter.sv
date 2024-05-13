//Interface module (JK_inter.sv)
interface JK_inter(input bit clk);
	logic J, K, rst;
    logic Q;

    clocking cb@(posedge clk);
    default input #1ns output #1ns;
    input Q;
    output J,K;
    endclocking

	modport TB ( clocking cb, output rst);

endinterface
