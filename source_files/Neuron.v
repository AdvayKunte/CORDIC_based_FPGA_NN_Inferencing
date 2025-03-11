`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2025 09:28:35 AM
// Design Name: 
// Module Name: Neuron
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


module Neuron#(parameter WIDTH=15)(
input [WIDTH:0] Xo,Yo,Zo,
input clk,reset,
output [WIDTH:0] Sin_H,Cos_H,Z
);
wire[WIDTH:0] Xout,Yout,Zout;
wire [3:0] i1;
wire [WIDTH:0] X_H,Y_H,Z_H;
recon linear(clk,reset,1'b0,Xo, Yo ,Zo,Xout , Yout , Zout, i1);
latch l1(Xout,Yout,Zout, i1,clk,reset,X_H,Y_H,Z_H);
recon hyperbolic(clk,reset,1'b1,X_H,Y_H,Z_H,Cos_H,Sin_H,Z,i1);
endmodule