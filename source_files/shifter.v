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
input signed [WIDTH:0] a,
output signed [WIDTH:0] b,
input m , 
input [3:0] i
);


//wire [WIDTH-1:0] b_intm ;
//always @ (posedge clk) begin
//    if(a[15]) begin
//        b[15] = 1;
//        for(j = 0; j < 15 ;j = j+1) begin
//            b[j] = b[j+1]
//        end
//    end
//end
assign b = m? (a)>>>i :((i!=0)?(a)>>>(i-1):a);
//assign b = {a[WIDTH],b_intm};


endmodule

