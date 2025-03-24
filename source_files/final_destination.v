`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 20:06:52
// Design Name: 
// Module Name: final_destination
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


module final_destination(
input  clk, start,
input [5:0] no_layers ,nl1,nl2,nl3,nl4,nl5,
input [1:0] afl1 , afl2,afl5,afl3,afl4 
);


wire [15:0] wt_in , bias_in;
wire weight_en, bias_en;
wire [5:0] n , i    ;
    
main_memory mem(clk,weight_en , bias_en , n , i ,wt_in, bias_in);    
master_engine eng(clk,start,no_layers,nl1,nl2,nl3,nl4,nl5,afl1,afl2,afl3,afl4,afl5,wt_in , bias_in, weight_en , bias_en, n , i);    
    
endmodule
