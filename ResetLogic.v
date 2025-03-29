`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:01:38 PM
// Design Name: 
// Module Name: ResetLogic
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


module ResetLogic#(parameter WIDTH=15 )(
input ext_reset,
input clk,
output reg reset1,reset2,reset3,complete
);

reg [4:0] counter;

always@(posedge clk)begin
    //counter=counter+1;
    if(ext_reset) begin
        reset1=1;
        reset2=1;
        reset3 =1;
        complete = 0;
        counter=0;
    end
    else if(counter==0)begin
        counter=counter+1;
        reset1=0;
    end
    else if(counter==10) begin
        reset2=0;
        counter = counter + 1;
    end
    else if (counter == 20) begin 
        reset3 = 0;
        counter = counter + 1;
    end
    else if(counter ==30) begin
        complete = 1;
    end
    else if(counter <31) begin 
        counter = counter + 1;
    end
end

endmodule