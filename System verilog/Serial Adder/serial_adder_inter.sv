// Interface for DUT inputs and outputs
interface serial_adder_inter(input bit clk);

    logic [3:0]a, b, 
    logic reset,cin;
    logic sum, cout;

    clocking cb @(posedge clk);
        output a, b, cin, reset;
        input sum, cout;
    endclocking

    modport tb (clocking cb, input sum, input cout);

endinterface