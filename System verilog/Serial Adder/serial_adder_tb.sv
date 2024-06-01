program test_program(serial_adder_inter.tb sai);

    initial begin
        sai.cb.reset <= 1;
        sai.cb.a <= 4'b0000;    sai.cb.b <= 4'b0000;    sai.cb.cin <= 0;
        #10; 

        sai.cb.reset <= 0;
        sai.cb.a <= 4'b1010;    sai.cb.b <= 4'b1100;    sai.cb.cin <= 1;
        #40; 

        sai.cb.reset <= 1;
        #10;

        sai.cb.reset <= 0;
        sai.cb.a <= 4'b0110;    sai.cb.b <= 4'b0011;    sai.cb.cin <= 0;
        #40;

        sai.cb.reset <= 1;
        #10;

        sai.cb.reset <= 0;
        sai.cb.a <= 4'b1111;    sai.cb.b <= 4'b1111;    sai.cb.cin <= 1;
        #40;

        $finish;
    end

endprogram