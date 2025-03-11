`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2025 09:31:40 AM
// Design Name: 
// Module Name: latch
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


module latch#(parameter WIDTH=15)(
input [WIDTH:0] Xout,Yout,Zout,
input [3:0] i,
input clk,reset,
output reg [WIDTH:0] X_H,Y_H,Z_H );

always@(posedge clk) begin
    if(reset) begin
        X_H<=16'b0;
        Y_H<=16'b0;
        Z_H<=16'b0;
    end
    else if(i==10)begin
        X_H<=16'b0000010011010100;
        Y_H<=16'b0;
        Z_H<=Yout;
    end
end
endmodule