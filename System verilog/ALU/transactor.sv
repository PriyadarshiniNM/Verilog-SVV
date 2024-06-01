class transactor;
randc bit [3:0] a,b;
rand bit [2:0] opcode;
constraint C1 {opcode inside {[0:5],7};}
constraint C2 {a inside {[1:10],15};}
constraint C3 {b dist {[1:5]:=1, [6:10]:=6};}
endclass