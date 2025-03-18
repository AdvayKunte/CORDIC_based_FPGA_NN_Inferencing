`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2024 23:08:54
// Design Name: 
// Module Name: add_sub
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


module add_sub #(parameter WIDTH = 15)(
input signed [WIDTH:0] a,b,
input sel, 
output signed [WIDTH:0] out
);

wire [WIDTH+1:0] sum;
assign sum = sel?a-b:a+b;
assign out = {sum[WIDTH+1],sum[WIDTH-1:0]};

endmodule
