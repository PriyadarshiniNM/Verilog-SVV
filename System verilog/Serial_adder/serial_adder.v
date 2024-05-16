module FullAdder(
    input A, B, Cin,
    output Sum, Cout
);

assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (A & Cin) | (B & Cin); 

endmodule

//PISO
module Shift_Reg(
    input clk, reset, 
    input [3:0] parallel_in, 
    output reg serial_out
);

reg [3:0] shift_reg; // Shift register for parallel data
reg [3:0] serial_out_reg; // Register for serial output

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 4'b0000; // Reset the shift register
        serial_out_reg <= 4'b0000; // Reset the serial output register
    end 
    else begin
        shift_reg <= {shift_reg[2:0], parallel_in[0]}; // Shift in the parallel input
        serial_out_reg <= {serial_out_reg[2:0], shift_reg[3]}; // Shift out the serial output
    end
end

assign serial_out = serial_out_reg[3]; // Assign serial_out to the most significant bit of serial_out_reg

endmodule

module SerialAdder(
    input clk, reset,
    input [3:0] A, B,
    output [3:0] Sum
);

wire [3:0] carry; // Carry bits for each stage

FullAdder FA0(A[0], B[0], 1'b0, Sum[0], carry[0]);
FullAdder FA1(A[1], B[1], carry[0], Sum[1], carry[1]);
FullAdder FA2(A[2], B[2], carry[1], Sum[2], carry[2]);
FullAdder FA3(A[3], B[3], carry[2], Sum[3], carry[3]);

Shift_Reg piso(clk, reset, Sum, Sum[3]);

endmodule