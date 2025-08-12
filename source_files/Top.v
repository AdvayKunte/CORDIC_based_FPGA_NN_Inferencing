`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:52:23 PM
// Design Name: 
// Module Name: Top
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


module Top(input rx,input master_clk,input strt,input master_start ,output[3:0]out);
reg fd_start;
wire clk_3125;
wire [15:0] data_in;
wire rx_complete;
wire pulse_start;
reg [1:0] state;
assign pulse_start=(clk_3125)&(rx_complete);

 //Ek module jo clock ko 3.125MHz me convert karega  
 reg load_complete;
 wire uart_clk;
 reg fd_strt;
// wire clk_load = uart_clk&rx_complete;
 reg [9:0] i;
 
 always@(posedge pulse_start) begin
    if(strt) begin
        load_complete <= 0;
    end
    if(s) begin
        input_reg[i] <= data_in;
        if(i==783) begin
            i<=0;
            load_complete <= 1;
        end
        i <= i+1;
    end
 end 
    
 always@(posedge master_clk)begin
    if(master_start)begin
        state<=0;
        input_load<= 0;
        i <=0 ;
    end
    else begin
        case(state)
        2'b00:begin //IDLE STATE
            if(strt) begin
            state<=state+1;
            end
        end
        2'b01:begin
            // STATE FOR LOADING INPUT
            input_load <= 1;
            if(load_complete) begin
                input_load<=0;
                state <= state +1;
            end
        end
        2'b10:begin
            //ENABLING THE RECON BLOCK
            fd_strt <= 1;
            if(done) begin
                fd_strt <= 0;
                state <= 0;
            end
        end
        endcase
    end
  end
 final_destination dut(
    .clk(master_clk), .start(fd_start),
    .no_layers(2'd2),.nl1(6'd64),.nl2(4'd10),.nl3(1'd0),.nl4(1'd0),.nl5(1'd0),.n_in(10'b1100010000) ,
     .afl1(2'b10), .afl2(2'b00),.afl3(2'b11),.afl4(2'b11),.afl5(2'b11),
    .pixel(data_in),
     .RF(out),
    .master_done(done)
);

reg [7:0] input_reg [0:783] ;

uart_receiver uart_in(
    .clk_3125(uart_clk),
    .rx(din),
    .rx_msg(data_in),
   // output reg rx_parity1,
    //output reg rx_parity2,
    .rx_complete(rx_complete)
    );

endmodule
