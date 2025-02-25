`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 16:32:29
// Design Name: 
// Module Name: recon_controlpath
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


module recon_controlpath(
input clk,reset,
output reg selmx,selmy,selmz,
output reg [3:0]  i
);

reg start;
initial begin

    start = 0;

end

always @ (posedge clk) begin
    if(reset) begin 
        i <= 0;
        selmx <= 0;
        selmy <= 0;
        selmz <= 0; 
        start <= 1;
    end
    else if(start) begin
        if(i!=0) begin
        selmx <= 1;
        selmy <= 1;
        selmz <= 1; 
        end
        if(i != 10) begin
         i <= i+1;
        end
        else if (i==10) begin
            start <= 0;
            i <= 0;
            selmx <= 0;
            selmy <= 0;
            selmz <= 0; 
        end
    end
end

endmodule
