`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 16:09:16
// Design Name: 
// Module Name: recon_datapath
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


module recon_datapath#(parameter WIDTH = 15)(
input clk,
input m,div,
input [WIDTH:0] Xo,Yo,Zo ,
//input xout_sel,
input selmx,selmy,selmz,
//input xas ,yas ,zas,
output reg [WIDTH:0] Xout,Yout, Zout,
input [WIDTH:0] z_rom,
input [3:0] i
//output reg di
);
wire [WIDTH:0] x_mux, y_mux , z_mux;
//wire selmx,selmy,selmz;

mux m_x(Xo , Xout , selmx , x_mux);
mux m_y(Yo , Yout , selmy , y_mux);
mux m_z(Zo , Zout , selmz , z_mux);

reg [WIDTH:0] Xi , Yi , Zi;
//reg di;

wire di = div?(~y_mux[15]):z_mux[15];

//assign Xout = x_fout;
//assign Yout = y_asout;
//assign Zout = z_asout;

always @ (negedge clk) begin 

if(i!=0) begin
    Xout = x_fout;
    Yout = y_asout;
    Zout = z_asout;
end
end

//always @ (posedge clk) begin 

//    Xi = x_mux;
//    Yi = y_mux;
//    Zi = z_mux; 
//   // di <=  z_mux[8];

//end
 
wire [WIDTH:0] x_sft, y_sft; 
    
shifter shftx(x_mux ,x_sft ,m, i);
shifter shfty(y_mux ,y_sft,m, i);


wire [WIDTH:0] x_asout, y_asout , z_asout; 
//wire [WIDTH:0]z_rom;
//assign z_rom = 9'b000011100;
add_sub X_as(x_mux , y_sft ,di, x_asout);
add_sub Y_as(y_mux , x_sft ,di, y_asout);
add_sub Z_as(z_mux , z_rom ,~(di), z_asout);

wire [WIDTH:0] x_fout;
//wire xout_sel;
mux m_xout(x_mux, x_asout , m , x_fout);


endmodule
