module JK_FF (input clk, rst, J, K,
    output reg Q);

always @(posedge clk or posedge rst) begin
	if (rst) begin
        Q <= 1'b0;
    	end 
	else begin
        	if (J == 1'b0 && K == 1'b0) begin
            		Q <= Q;
        	end 
		else if (J == 1'b0 && K == 1'b1) begin
        	    Q <= 1'b0;
		end 
		else if (J == 1'b1 && K == 1'b0) begin
            		Q <= 1'b1;
       		end
		else if (J == 1'b1 && K == 1'b1) begin
            		Q <= ~Q;  
        	end
    	end
end
endmodule
