`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 22:19:20
// Design Name: 
// Module Name: master_controlpath
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


module master_controlpath(
input clk , start,
input [5:0] no_layers ,nl1,nl2,nl3,nl4,nl5,
output reg weight_en , bias_en , compute_en , af_en,
output reg output_shft_en , output_wr_en, output_sel, bias_sel,
output reg tot_complete,
output reg [5:0] n , i
);

//wire [1:0] af_sel;      //Control Signals
//wire bias_sig , weight_en , bias_en,in_sig , out_shft_en , out_wr_en;
   
reg [31:0] clk_iterations;   
    
wire [5:0]   ninl [4:0] ;
assign ninl[0]=nl1;
assign ninl[1]=nl2;
assign ninl[2]=nl3;
assign ninl[3]=nl4;
assign ninl[4]=nl5;  
    
reg [1:0] state;
//reg [5:0] n , i;    
    
always @ (posedge clk) begin

clk_iterations = clk_iterations + 1;

if(start) begin
    state = 0;
    clk_iterations = 0; 
    n =0; 
    i = 0;
    weight_en = 1;
    bias_en = 1;
    tot_complete = 0;
    compute_en  =0;
    af_en =0;
    output_wr_en = 0;
    output_shft_en = 0;
end

case(state) 
    2'b00:  begin
                 if(output_shft_en) begin
                    output_shft_en = 0;
                 end
                  weight_en = 1;
                   bias_en = 1;
                   
              if(i==0) begin
                    bias_sel = 0;
                end
                else begin
                    bias_sel =1 ;
                    output_shft_en = 1;
                end
            if(ninl[n] != 1) begin
                if(clk_iterations == (ninl[n]+1)) begin
                    weight_en = 0;
                    bias_en = 0;
                    compute_en =0 ;
                    af_en = 0;
                    state = state + 1;
                    clk_iterations = 0;
                    if(n == 0) begin 
                        output_sel = 0;
                    end
                    else if (n !=0) begin
                        output_sel = 1;
                    end
                end 
            end
            else  begin
                if(clk_iterations == (ninl[n]+2)) begin
                    weight_en = 0;
                    bias_en = 0;
                    compute_en =0 ;
                    af_en = 0;
                    state = state + 1;
                    clk_iterations = 0;
                    if(n == 0) begin 
                        output_sel = 0;
                    end
                    else if (n !=0) begin
                        output_sel = 1;
                    end
                end 
            end 
    end
    2'b01:  begin
            compute_en = 1;
            if(i != (ninl[n]-1)) begin
                if(clk_iterations == 0) begin
                    
                    af_en = 0;
                end
                if(clk_iterations == 10) begin 
                    compute_en = 0;
                    af_en = 0;    
                    state = 0;
                   weight_en = 1;
                   bias_en = 1;
                    i = i+1;
                    clk_iterations = 0;
                end

            end
            else if (i == (ninl[n]-1)) begin
//                if(clk_iterations == 0) begin
//                    compute_en = 1;
//                    af_en = 1;
//                end
                if(clk_iterations == 32) begin 
                    compute_en = 0;
                    af_en = 0;    
                    state = state + 1;
                    clk_iterations = 0;
                    output_wr_en = 1;
                end
                else begin
                    compute_en = 1;
                    af_en = 1;
                end
            end
    end
    2'b10: begin
        if(output_wr_en) begin
            output_wr_en =0;
        end
        compute_en = 0;
 //       output_shft_en = 1;
        n = n+1 ;
        if(n == no_layers) begin 
            state = state + 1;
        end 
        else begin
            state=0;  
            i =0;  
            weight_en = 1;
            bias_en = 1;    
        end
    end
    2'b11: begin
        tot_complete = 1;
    end
endcase

end
    
endmodule
