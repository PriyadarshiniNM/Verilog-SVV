`include "transactor.sv"
`include "ALU_inter.sv"

class driver;
transactor tx;
virtual ALU_inter.TB i1;
function new(virtual ALU_inter.TB i1_new);
this.i1=i1_new;
this.tx=new();
$display ("%d : Driver: new method created", $time);
endfunction

task drive_data();
begin
    repeat(2000) @( i1.cb)
    begin
        if((tx.randomize()))
        begin
            i1.cb.a<=tx.a;
            i1.cb.b<=tx.b;
            i1.cb.opcode<=tx.opcode;
            $display("%d : driver: sent A=%b, B=%b and opcode=%b", $time, i1.cb.a, i1.cb.b, i1.cb.opcode);
        end
        else
        $display("%d : Randomization error", $time);
    end
end
endtask
endclass