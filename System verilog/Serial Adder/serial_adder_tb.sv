program serial_adder_tb(serial_adder_inter.tb sai);
    initial begin
        sai.cb.rst <= 1;
        sai.cb.a <= 0;  sai.cb.b <= 0;  sai.cb.cin <= 0;
        #10;

        sai.cb.rst <= 0;
        sai.cb.a <= 0;  sai.cb.b <= 0;  sai.cb.cin <= 0;
        #10;

        sai.cb.a <= 0;  sai.cb.b <= 0;  sai.cb.cin <= 1;
        #10;

        sai.cb.a <= 0;  sai.cb.b <= 1;  sai.cb.cin <= 0;
        #10;

        sai.cb.a <= 0;  sai.cb.b <= 1;  sai.cb.cin <= 1;
        #10;

        sai.cb.a <= 1;  sai.cb.b <= 0;  sai.cb.cin <= 0
        #10;

        sai.cb.a <= 1;  sai.cb.b <= 0;  sai.cb.cin <= 1;
        #10;

        sai.cb.a <= 1;  sai.cb.b <= 1;  sai.cb.cin <= 0;
        #10;

        sai.cb.a <= 1;  sai.cb.b <= 1;  sai.cb.cin <= 1;
        #10;

        #50 $finish;
    end
endprogram