`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2025 21:59:12
// Design Name: 
// Module Name: recon_top_level
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


(* dont_touch = "true" *)module recon_top_level#(parameter WIDTH = 15)( 
input [WIDTH:0] Xo, Zo , Yo,
input clk,
input ext_reset,
input [1:0] sel,
output [WIDTH:0] mac_out,
output [WIDTH:0] f,
input af_en
);
  

Neuron #(WIDTH)inneuron(Xo,Yo,Zo,clk,ext_reset, sinhz,coshz,z,reset3,complete,mac_out,af_en);
wire [WIDTH:0] z, coshz, sinhz;
//wire [1:0] sel;
//wire [WIDTH:0]f;
wire sign_z=z[WIDTH];
wire [WIDTH:0]relu ;

assign relu=sign_z?0:z;
// rest of the setup


wire [WIDTH:0] ez, ez_1;

add_sub #(WIDTH) adder1(coshz, sinhz, sel[0], ez);
add_sub #(WIDTH) adder2(ez, 16'b0000010000000000, sel[0], ez_1);
wire [WIDTH:0] w2,w3;
wire [WIDTH:0] divisor , dividend;

mux  #(WIDTH)m1(ez, coshz, sel[0], w2);
mux #(WIDTH) m2(ez_1, sinhz, sel[0], w3);
//some_div_module yet to be made by Addy
wire [WIDTH:0] div_out;

assign divisor =  {w3[15], (w3[14:0]>>2) };
assign dividend = {w2[15], (w2[14:0]>>2) };

//wire div_reset;
wire [WIDTH:0] X_divout,Y_divout;
wire complete ;

recon #(WIDTH) r_div(
 clk,reset3,1'b0,1'b1,
divisor, dividend ,16'b0,
 X_divout , Y_divout , div_out
);
 

//final selection between sigmoid(00), tanh(01) and relu(10)
//assign f=complete?(sel[1]?relu:div_out):15'bx;
  
assign f=complete?(sel[1]?(sel[0]?mac_out:relu):div_out):15'bx;  
  

endmodule