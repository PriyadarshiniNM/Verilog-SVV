//JK DUT (JK_FF.v)
module JK_FF(input clk, rst, J, K,
output reg Q);
reg [1:0] JK;
//JK ={J,K};
always@(posedge clk or posedge rst)
begin
	JK={J,K};
    if (rst)
   	 Q <= 1'b0;
    else
        begin
    	if( JK == 2'b00)                 Q <= Q;
   	else if (JK == 2'b01)            Q <= 1'b0;
   	else if (JK == 2'b10)            Q <= 1'b1;
   	else if (JK == 2'b11)            Q <= (~Q);
        end
end
endmodule
