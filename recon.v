`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 17:14:23
// Design Name: 
// Module Name: recon
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


module recon#(parameter WIDTH = 15)(
input clk,reset,m,div,
input [WIDTH:0] Xo, Yo ,Zo,
output [WIDTH:0] Xout , Yout , Zout,
output [3:0] i
);


wire selmx,selmy,selmz;
//wire [3:0]  i ;
wire [WIDTH:0] rom_out ;


recon_datapath dt(clk,m,div,Xo,Yo,Zo,selmx, selmy,selmz,Xout, Yout, Zout ,rom_out, i);
recon_controlpath ct(clk,reset,selmx,selmy,selmz,i);
rom rm(clk,m,i,rom_out);


endmodule
