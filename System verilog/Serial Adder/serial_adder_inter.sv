// Interface for DUT inputs and outputs
interface serial_adder_if(input bit clk);

    logic a, b, cin;
    logic sum, cout;
    logic rst;

    clocking cb @(posedge clk);
        output a, b, cin, rst;
        input sum, cout;
    endclocking

    modport tb (clocking cb, input sum, input cout);

endinterface
