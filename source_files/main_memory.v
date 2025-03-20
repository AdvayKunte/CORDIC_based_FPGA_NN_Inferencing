`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 17:53:34
// Design Name: 
// Module Name: main_memory
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


module main_memory(
input clk, weight_en , bias_en , 
input [5:0] n,i,
output reg [15:0] data
);
        
reg [15:0] weight_storage [0:80];
reg [15:0] bias_storage [0:20];
reg [1:0] k;    
    
wire [6:0] weight_addr = {n[2:0] , i[1:0] , k} ;   
wire [4:0] bias_addr = {n[2:0] , k}; 
    
always @ (posedge clk) begin 
    if(weight_en) begin
        data = weight_storage[weight_addr];
    end
    if(bias_en) begin
        data = bias_storage[bias_addr];
    end
end    
    
endmodule
