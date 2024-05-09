`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2024 12:21:35
// Design Name: 
// Module Name: JK_FF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//Design Under Test JK flip flop ( JK _FF.v )
module JK _FF(input clk, rst, J, K,
ourtput Q);
reg [1:0] JK;
JK ={J,K};
always@(posedge clk, posedge rst)
begin
    if (rst)
   	 Q <= 1'b0;
    else
    	if JK == 2'b00
            Q <= r1.Q;
   	 	else if JK == 2'b01
            Q <= 1'b0;
   	 	else if JK == 2'b10
            Q <= 1'b1;
   	 	else if JK == 2'b11
            Q <= (~Q);
end
endmodule
