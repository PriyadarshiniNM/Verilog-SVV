//Interface module of JK flip flop ( JK_inter.sv )
interface JK_inter(input bit clk);
logic J, K, rst, Q;
modport RTL ( input J, K, rst, clk, output Q);
modport TB ( input Q, output J, K, rst, clk );
endinterface