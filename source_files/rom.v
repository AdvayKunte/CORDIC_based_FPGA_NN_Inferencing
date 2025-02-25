`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 16:34:19
// Design Name: 
// Module Name: rom
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


module rom#(parameter WIDTH = 15)(
input clk,
input sel ,
input [3:0] i,
output [WIDTH:0] rom_out
    );
    
 reg [WIDTH:0] rom_mem [0:19] ;
 
 initial begin
 rom_mem[0] =  16'b0000010000000000;
 rom_mem[1] =  16'b0000001000000000;
 rom_mem[2] =  16'b0000000100000000;
 rom_mem[3] =  16'b0000000010000000;
 rom_mem[4] =  16'b0000000001000000;
 rom_mem[5] =  16'b0000000000100000;
 rom_mem[6] =  16'b0000000000010000;
 rom_mem[7] =  16'b0000000000001000;
 rom_mem[8] =  16'b0000000000000100;
 rom_mem[9] =  16'b0000000000000010;

 rom_mem[10] =  16'b0000001000110010;
 rom_mem[11] =  16'b0000000100000110;
 rom_mem[12] =  16'b0000000010000001;
 rom_mem[13] =  16'b0000000001000000;
 rom_mem[14] =  16'b0000000000100000;
 rom_mem[15] =  16'b0000000000010000;
 rom_mem[16] =  16'b0000000000001000;
 rom_mem[17] =  16'b0000000000000100;
 rom_mem[18] =  16'b0000000000000010;
 rom_mem[19] =  16'b0000000000000001;
 
 end   
 
 assign rom_out = sel?rom_mem[i+9]:rom_mem[i-1];
    
endmodule