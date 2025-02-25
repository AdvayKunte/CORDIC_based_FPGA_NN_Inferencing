`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 16:07:08
// Design Name: 
// Module Name: shifter
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



module shifter#(parameter WIDTH = 15)(
input [WIDTH:0] a,
output [WIDTH:0] b,
input m , 
input [3:0] i
);
assign b= m?a>>i:((i!=0)?a>>(i-1):a);
endmodule

