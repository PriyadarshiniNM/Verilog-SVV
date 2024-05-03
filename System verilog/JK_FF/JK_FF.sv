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


//Design Under Test JK flip flop ( JK _FF.sv )
module JK_FF(JK_inter.RTL r1)
always@(posedge r1.clk, posedge r1.rst)
begin
    if (r1.rst)
   	 r1.Q <= 1'b0;
    else
    	if {r1.J, r1.K} == 2'b00
            r1.Q <= r1.Q;
   	 	else if {r1.J, r1.K} == 2'b01
            r1.Q <= 1'b0;
   	 	else if {r1.J, r1.K} == 2'b10
            r1.Q <= 1'b1;
   	 	else if {r1.J, r1.K} == 2'b11
            r1.Q <= ~(r1.Q);
end
endmodule
