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
output reg [15:0] wt_data, bias_data,
input [5:0] nl1,nl2,nl3,nl4,nl5
);
        
        
     
initial begin

//    //Layer 1

//    // First input weights 
//    weight_storage[0] = 16'b0000010000000000; //1 
//    weight_storage[1] = 16'b0000000000000000; // 0
//    weight_storage[2] = 16'b0000000000000000; // 0.000
//    weight_storage[3] = 16'b0000000000000000; // 0.000

//    // Second Input weights 
//    weight_storage[4] = 16'b0000000000000000; // 0.950
//    weight_storage[5] = 16'b0000010000000000; // 1
//    weight_storage[6] = 16'b0000000000000000; // 0.000
//    weight_storage[7] = 16'b0000000000000000; // 0.000
    
////    Third Input Weights
//    weight_storage[8] = 16'b0000000000000000; // 0.000
//    weight_storage[9] = 16'b0000000000000000; // 0.000
//    weight_storage[10] = 16'b0000010000000000; // 1.000
//    weight_storage[11] = 16'b0000000000000000; // 0.000
    
//    // Fourth input weights (Remaining layers)
//    weight_storage[12] = 16'b0000000000000000; // 0
//    weight_storage[13] = 16'b0000000000000000; // 0
//    weight_storage[14] = 16'b0000000000000000; // 0
//    weight_storage[15] = 16'b0000000000000000; // 0
    
//    //Layer 1 done
    
//    //Layer 2 
    
//        // First input weights (Layer 1: 0, 1, 2, 3)
//    weight_storage[16] = 16'b1111111100011010; // -0.225
//    weight_storage[17] = 16'b0000001011010111; // 0.71
//    weight_storage[18] = 16'b0000000000000000; // 2.000
//    weight_storage[19] = 16'b0000000000000000; // 3.000
    
//    // Secon Input input weights (Remaining layers)
//    weight_storage[20] = 16'b0000000101000000; // 0.313
//    weight_storage[21] = 16'b1111111100110110; // -0.198
//    weight_storage[22] = 16'b0000000000000000; // 0.320
//    weight_storage[23] = 16'b0000000000000000; // -0.750

//    //Layer 2 done

////    // Third input weights (Layer 1: 0, 1, 2, 3)
////    weight_storage[16] = 16'b0000000000000000; // 0.000
////    weight_storage[17] = 16'b0000000001000000; // 1.000
////    weight_storage[18] = 16'b0000000010000000; // 2.000
////    weight_storage[19] = 16'b0000000011000000; // 3.000
    
////    // Third input weights (Remaining layers)
////    weight_storage[20] = 16'b1100100000110000; // -0.875
////    weight_storage[21] = 16'b0011000001000000; // 0.750
////    weight_storage[22] = 16'b0001010000100000; // 0.320
////    weight_storage[23] = 16'b1100001000000000; // -0.750

//    // Fourth input weights (Layer 1: 0, 1, 2, 3)
//    weight_storage[24] = 16'b0000001000000000; // 0.5
//    weight_storage[25] = 16'b0000001000111101; // 0.56
//    weight_storage[26] = 16'b0000000000000000; // 000
//    weight_storage[27] = 16'b0000000000000000; // 000
    
//    // Fourth input weights (Remaining layers)
//    weight_storage[28] = 16'b0000000000000000; // 0
//    weight_storage[29] = 16'b0000000000000000; // 0
//    weight_storage[30] = 16'b0000000000000000; // 0
//    weight_storage[31] = 16'b0000000000000000; // 0.000 (No connection)
    
//    // Five input weights (Remaining layers)
//    weight_storage[32] = 16'b0000000010011100; // 0.153
//    weight_storage[33] = 16'b0000000000000000; // 0
//    weight_storage[34] = 16'b0000000000000000; // 0
//    weight_storage[35] = 16'b0000000000000000; // 0.000 (No connection)
    
//    // Five input weights (Remaining layers)
//    weight_storage[36] = 16'b0000001010110110; // 0.678
//    weight_storage[37] = 16'b0000000000000000; // 0
//    weight_storage[38] = 16'b0000000000000000; // 0
//    weight_storage[39] = 16'b0000000000000000; // 0.000 (No connection)


    // Bias values
    bias_storage[0] = 16'b0000000000000000; //0
    bias_storage[1] = 16'b0000000000000000; // 0
    bias_storage[2] = 16'b0000000000000000; // 0
    bias_storage[3] = 16'b0000000000000000; // 0
    bias_storage[4] = 16'b0000000011111110; // 0.124
    bias_storage[5] = 16'b0000000111111000; // 0.493
    bias_storage[6] = 16'b0000000000000000; // 0
    bias_storage[7] = 16'b0000000000000000; // 0
    bias_storage[8] = 16'b1111111010100011; // -0.341
end

initial begin
    $readmemb("C:/NewNewRecon/NewNewRecon.srcs/sources_1/new/fixed_point_random.mem", weight_storage);
  end        
        
 wire [5:0] na [4:0] ;
assign na[0] = nl1;
assign na[1] = nl1;
assign na[2] = nl2;
assign na[3] = nl3;
assign na[4] = nl4;       
        
reg [15:0] weight_storage [0:80];
reg [15:0] bias_storage [0:20];
reg [1:0] k;    
    
wire [6:0] weight_addr = (n==0)?{n[2:0] , i[1:0] , k}: {n[2:0], (na[n][1:0]-i[1:0]-2'b01) , k};   
wire [4:0] bias_addr = {n[2:0] , k}; 
    
initial begin
    k = 0;
end    
    
always @ (posedge clk) begin 
    if(weight_en) begin
        wt_data = weight_storage[weight_addr];
        k = k + 1;
    end
    else begin
        k =0 ;
    end
    if(bias_en) begin
        bias_data = bias_storage[bias_addr];
    end
end    
                           
endmodule
