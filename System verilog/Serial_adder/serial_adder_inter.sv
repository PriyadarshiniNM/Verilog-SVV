interface serial_adder_inter(input bit clk);
    logic rst_n;
    logic [3:0] A, B, result;
    
        modport DUT (input rst_n, input [3:0] A, B, output [3:0] result);
        modport TB ( input [3:0]result, input rst_n, output [3:0] A, B,);
endinterface