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
output [WIDTH:0] Sin_H,Cos_H,Z, 
output reset3,complete,
output [WIDTH:0] Yout,
input af_en
);
wire reset1,reset2;
wire zz;
assign Z=Yout;
wire[WIDTH:0] Xout,Yout,Zout;
wire [3:0] i1,i2;
wire [WIDTH:0] X_H,Y_H,Z_H;
ResetLogic RL(reset,clk,reset1,reset2,reset3,complete);
recon linear(clk,reset1,1'b0,1'b0,Xo, Yo ,Zo,Xout , Yout , Zout, i1);
latch l1(Xout,Yout,Zout, i1,clk,reset1,X_H,Y_H,Z_H,af_en);
recon hyperbolic(clk,reset2,1'b1,1'b0,X_H,Y_H,Z_H,Cos_H,Sin_H,zz,i2);
endmodule
