`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 11:08:35 PM
// Design Name: 
// Module Name: Uart_receiver
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


//module Uart_receiver(

//    );
//endmodule
// EcoMender Bot : Task 2A - UART Receiver

/*
Module UART Receiver

Baudrate: 230400 

Input:  clk_3125 - 3125 KHz clock
        rx      - UART Receiver

Output: rx_msg - received input message of 8-bit width
        rx_parity - received parity bit
        rx_complete - successful uart packet processed signal
*/

// module declaration
module uart_receiver(
    input clk_3125,
    input rx,
    output reg [15:0] rx_msg,
   // output reg rx_parity1,
    //output reg rx_parity2,
    output reg rx_complete
    );

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////
reg [7:0] counter;
reg [7:0] rx1,rx2;
reg [7:0] temp;
reg [3:0] k;
reg part_temp;
initial begin
    rx_msg = 0;
	  //rx_parity1 = 0;
	  //rx_parity2 = 0;
    rx_complete = 0;
	 counter =0;
	 k=0;
	 state=0;
end
reg state;


always @( posedge clk_3125 ) begin
	counter <= counter +1;
	
	case (counter)
	8'd21: begin temp[7]<= rx;
			if (rx ==1)	k<=k+1;	
			end
	8'd35: begin temp[6]<= rx;
			if (rx ==1)	k<=k+1;	
			end
	8'd49: begin temp[5]<= rx;
			if (rx ==1)	k<=k+1;	
			end
	8'd63: begin temp[4]<= rx;
			if (rx ==1)	k<=k+1;	
			end
	8'd77: begin temp[3]<= rx;
			if (rx ==1)	k<=k+1;	
			end
	8'd91: begin temp[2]<= rx;
			if (rx ==1)	k<=k+1;	
			end
	8'd105: begin temp[1]<= rx;
			if (rx ==1)	k<=k+1;	
			end
	8'd119: begin temp[0]<= rx;
			if (rx ==1)	k<=k+1;	
			end
	8'd133: part_temp<= rx;
	8'd154: begin
	//rx_msg <= temp;
	if(state==0) begin 
            if ((k%2 == 0) & (part_temp ==0)) rx1 <= temp;
            else if ((k%2 != 0) & (part_temp ==1)) rx1<= temp;
            else rx1 = 8'b00111111 ;
            state<=state+1;
            counter <=1;
            //rx_parity1 <= part_temp;

            k<=0;

	end
	else if(state==1) begin
	if ((k%2 == 0) & (part_temp ==0)) rx2 <= temp;
            else if ((k%2 != 0) & (part_temp ==1)) rx2<= temp;
            else rx2 = 8'b00111111 ;
            state<=0;
            rx_complete <=1'b1;
           // rx_parity2 <= part_temp;
            //counter<=0;
	
	end
	
	//rx_msg<={rx1,rx2};
	//rx_parity <= part_temp;
	counter <=1;
	k<=0;
	end
	default:rx_complete <=1'b0 ;
	endcase
	rx_msg<={rx1,rx2};
end

endmodule	
	


//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////


