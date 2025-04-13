`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 19:54:11
// Design Name: 
// Module Name: master_engine
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


module master_engine(
input clk, start, 
input [5:0] no_layers ,nl1,nl2,nl3,nl4,nl5,
input [1:0] afl1 , afl2,afl5,afl3,afl4,
input [15:0] wt_in , bias_in,//, x_input
output weight_en, bias_en,
output [5:0] n , i
);

reg [15:0] inputs [0:3];
initial begin 
inputs[0] = 16'b0000000010000011; //0.128
inputs[1] = 16'b0000001001000010;//0.565
inputs[2] = 16'b1111111011111101;//-0.253
inputs[3] = 16'b0000001011000011;
end

    
reg [15:0] weight_bank [0:63] ; 
reg [15:0] bias_bank [0:63] ; 
reg [15:0] output_bank [0:63];

wire [1:0] af_sel;      //Control Signals
wire bias_sign ,af_en ,bias_sig ,output_sig ,compute_en, weight_en , bias_en , out_shft_en , out_wr_en , tot_complete;

wire [1:0] bias_main ;

assign bias_main = {bias_en , bias_sign};

assign bias_sig = !bias_sign;

wire [15:0] bias_input [0:63] ;
wire [15:0] mac_output [0:63] ;



wire reset = !compute_en;

wire [15:0] neuron_input = output_sig?output_bank[0]:inputs[i] ;

//reg [5:0] n_layers ;           // No. of layers
//reg [5:0] nl1,nl2,nl3,nl4,nl5; //No. of neurons in each layer

wire [15:0] compute_out [63:0] ;
assign cnos[0]=nl1;
assign cnos[1]=nl2;
assign cnos[2]=nl3;
assign cnos[3]=nl4;
assign cnos[4]=nl5;


master_controlpath cntrl(
clk , start,no_layers ,cnos[0],cnos[1],cnos[2],cnos[3],cnos[4],
weight_en , bias_en , compute_en , af_en,
out_shft_en , out_wr_en, output_sig, bias_sign,
tot_complete , n , i
);

wire [5:0] n , i;
wire [5:0] cnos [0:4] ;
wire [1:0] af_nos [0:4];
assign af_nos[0] = afl1;
assign af_nos[1] = afl2;
assign af_nos[2] = afl3;
assign af_nos[3] = afl4;
assign af_nos[4] = afl5;


integer k ;

//assign bias_input[0] = bias_sig ? bias_bank[0] : mac_output[0];
//assign bias_input[1] = bias_sig ? bias_bank[1] : mac_output[1];
//assign bias_input[2] = bias_sig ? bias_bank[2] : mac_output[2];
//assign bias_input[3] = bias_sig ? bias_bank[3] : mac_output[3];
//assign bias_input[4] = bias_sig ? bias_bank[4] : mac_output[4];
//assign bias_input[5] = bias_sig ? bias_bank[5] : mac_output[5];
//assign bias_input[6] = bias_sig ? bias_bank[6] : mac_output[6];
//assign bias_input[7] = bias_sig ? bias_bank[7] : mac_output[7];
//assign bias_input[8] = bias_sig ? bias_bank[8] : mac_output[8];
//assign bias_input[9] = bias_sig ? bias_bank[9] : mac_output[9];
//assign bias_input[10] = bias_sig ? bias_bank[10] : mac_output[10];
//assign bias_input[11] = bias_sig ? bias_bank[11] : mac_output[11];
//assign bias_input[12] = bias_sig ? bias_bank[12] : mac_output[12];
//assign bias_input[13] = bias_sig ? bias_bank[13] : mac_output[13];
//assign bias_input[14] = bias_sig ? bias_bank[14] : mac_output[14];
//assign bias_input[15] = bias_sig ? bias_bank[15] : mac_output[15];
//assign bias_input[16] = bias_sig ? bias_bank[16] : mac_output[16];
//assign bias_input[17] = bias_sig ? bias_bank[17] : mac_output[17];
//assign bias_input[18] = bias_sig ? bias_bank[18] : mac_output[18];
//assign bias_input[19] = bias_sig ? bias_bank[19] : mac_output[19];
//assign bias_input[20] = bias_sig ? bias_bank[20] : mac_output[20];
//assign bias_input[21] = bias_sig ? bias_bank[21] : mac_output[21];
//assign bias_input[22] = bias_sig ? bias_bank[22] : mac_output[22];
//assign bias_input[23] = bias_sig ? bias_bank[23] : mac_output[23];
//assign bias_input[24] = bias_sig ? bias_bank[24] : mac_output[24];
//assign bias_input[25] = bias_sig ? bias_bank[25] : mac_output[25];
//assign bias_input[26] = bias_sig ? bias_bank[26] : mac_output[26];
//assign bias_input[27] = bias_sig ? bias_bank[27] : mac_output[27];
//assign bias_input[28] = bias_sig ? bias_bank[28] : mac_output[28];
//assign bias_input[29] = bias_sig ? bias_bank[29] : mac_output[29];
//assign bias_input[30] = bias_sig ? bias_bank[30] : mac_output[30];
//assign bias_input[31] = bias_sig ? bias_bank[31] : mac_output[31];
//assign bias_input[32] = bias_sig ? bias_bank[32] : mac_output[32];
//assign bias_input[33] = bias_sig ? bias_bank[33] : mac_output[33];
//assign bias_input[34] = bias_sig ? bias_bank[34] : mac_output[34];
//assign bias_input[35] = bias_sig ? bias_bank[35] : mac_output[35];
//assign bias_input[36] = bias_sig ? bias_bank[36] : mac_output[36];
//assign bias_input[37] = bias_sig ? bias_bank[37] : mac_output[37];
//assign bias_input[38] = bias_sig ? bias_bank[38] : mac_output[38];
//assign bias_input[39] = bias_sig ? bias_bank[39] : mac_output[39];
//assign bias_input[40] = bias_sig ? bias_bank[40] : mac_output[40];
//assign bias_input[41] = bias_sig ? bias_bank[41] : mac_output[41];
//assign bias_input[42] = bias_sig ? bias_bank[42] : mac_output[42];
//assign bias_input[43] = bias_sig ? bias_bank[43] : mac_output[43];
//assign bias_input[44] = bias_sig ? bias_bank[44] : mac_output[44];
//assign bias_input[45] = bias_sig ? bias_bank[45] : mac_output[45];
//assign bias_input[46] = bias_sig ? bias_bank[46] : mac_output[46];
//assign bias_input[47] = bias_sig ? bias_bank[47] : mac_output[47];
//assign bias_input[48] = bias_sig ? bias_bank[48] : mac_output[48];
//assign bias_input[49] = bias_sig ? bias_bank[49] : mac_output[49];
//assign bias_input[50] = bias_sig ? bias_bank[50] : mac_output[50];
//assign bias_input[51] = bias_sig ? bias_bank[51] : mac_output[51];
//assign bias_input[52] = bias_sig ? bias_bank[52] : mac_output[52];
//assign bias_input[53] = bias_sig ? bias_bank[53] : mac_output[53];
//assign bias_input[54] = bias_sig ? bias_bank[54] : mac_output[54];
//assign bias_input[55] = bias_sig ? bias_bank[55] : mac_output[55];
//assign bias_input[56] = bias_sig ? bias_bank[56] : mac_output[56];
//assign bias_input[57] = bias_sig ? bias_bank[57] : mac_output[57];
//assign bias_input[58] = bias_sig ? bias_bank[58] : mac_output[58];
//assign bias_input[59] = bias_sig ? bias_bank[59] : mac_output[59];
//assign bias_input[60] = bias_sig ? bias_bank[60] : mac_output[60];
//assign bias_input[61] = bias_sig ? bias_bank[61] : mac_output[61];
//assign bias_input[62] = bias_sig ? bias_bank[62] : mac_output[62];
//assign bias_input[63] = bias_sig ? bias_bank[63] : mac_output[63];


always @ (posedge clk) begin
    if(weight_en) begin
        for(k =1 ; k <=cnos[n] ; k= k+1 ) begin
//            if(k== wt_nos) begin
//                weight_en = 0;
//            end
//            else begin
            weight_bank[k] <= weight_bank[k-1] ;
           // end
        end
               weight_bank[0] <= wt_in ; 
      end
    if(bias_main == 2'b10) begin

        for(k =1 ; k <cnos[n] ; k= k+1 ) begin
            bias_bank[k] <= bias_bank[k-1] ;
        end
        bias_bank[0] = bias_in ; 
    end
    else if(bias_main == 2'b11) begin
        for(k =0 ; k <cnos[n] ; k= k+1 ) begin
            bias_bank[k] = mac_output[k] ;
        end
    end
    
    if(out_shft_en) begin 
        for(k =0 ; k <cnos[n] ; k= k+1 ) begin
            output_bank[k] = output_bank[k+1] ;
        end
    end
    if(out_wr_en) begin
        for(k =0 ; k <cnos[n] ; k= k+1 ) begin
            output_bank[k] = compute_out[k] ;
        end
    end
    
    
    
end

wire [15:0] b = bias_input[0] ; 

recon_top_level cu0 (neuron_input, weight_bank[0], bias_bank[0] ,  clk, reset, af_nos[n], mac_output[0], compute_out[0], af_en);
recon_top_level cu1 (neuron_input, weight_bank[1], bias_bank[1], clk, reset, af_nos[n], mac_output[1], compute_out[1],af_en);
recon_top_level cu2 (neuron_input, weight_bank[2], bias_bank[2], clk, reset, af_nos[n], mac_output[2], compute_out[2],af_en);
recon_top_level cu3 (neuron_input, weight_bank[3], bias_bank[3], clk, reset, af_nos[n], mac_output[3], compute_out[3],af_en);
recon_top_level cu4 (neuron_input, weight_bank[4], bias_bank[4], clk, reset, af_nos[n], mac_output[4], compute_out[4],af_en);
recon_top_level cu5 (neuron_input, weight_bank[5], bias_bank[5], clk, reset, af_nos[n], mac_output[5], compute_out[5]);
recon_top_level cu6 (neuron_input, weight_bank[6], bias_bank[6], clk, reset, af_nos[n], mac_output[6], compute_out[6]);
recon_top_level cu7 (neuron_input, weight_bank[7], bias_bank[7], clk, reset, af_nos[n], mac_output[7], compute_out[7]);
recon_top_level cu8 (neuron_input, weight_bank[8], bias_bank[8], clk, reset, af_nos[n], mac_output[8], compute_out[8]);
recon_top_level cu9 (neuron_input, weight_bank[9], bias_bank[9], clk, reset, af_nos[n], mac_output[9], compute_out[9]);
recon_top_level cu10 (neuron_input, weight_bank[10], bias_bank[10], clk, reset, af_nos[n], mac_output[10], compute_out[10]);
recon_top_level cu11 (neuron_input, weight_bank[11], bias_bank[11], clk, reset, af_nos[n], mac_output[11], compute_out[11]);
recon_top_level cu12 (neuron_input, weight_bank[12], bias_bank[12], clk, reset, af_nos[n], mac_output[12], compute_out[12]);
recon_top_level cu13 (neuron_input, weight_bank[13], bias_bank[13], clk, reset, af_nos[n], mac_output[13], compute_out[13]);
recon_top_level cu14 (neuron_input, weight_bank[14], bias_bank[14], clk, reset, af_nos[n], mac_output[14], compute_out[14]);
recon_top_level cu15 (neuron_input, weight_bank[15], bias_bank[15], clk, reset, af_nos[n], mac_output[15], compute_out[15]);
recon_top_level cu16 (neuron_input, weight_bank[16], bias_bank[16], clk, reset, af_nos[n], mac_output[16], compute_out[16]);
recon_top_level cu17 (neuron_input, weight_bank[17], bias_bank[17], clk, reset, af_nos[n], mac_output[17], compute_out[17]);
recon_top_level cu18 (neuron_input, weight_bank[18], bias_bank[18], clk, reset, af_nos[n], mac_output[18], compute_out[18]);
recon_top_level cu19 (neuron_input, weight_bank[19], bias_bank[19], clk, reset, af_nos[n], mac_output[19], compute_out[19]);
recon_top_level cu20 (neuron_input, weight_bank[20], bias_bank[20], clk, reset, af_nos[n], mac_output[20], compute_out[20]);
recon_top_level cu21 (neuron_input, weight_bank[21], bias_bank[21], clk, reset, af_nos[n], mac_output[21], compute_out[21]);
recon_top_level cu22 (neuron_input, weight_bank[22], bias_bank[22], clk, reset, af_nos[n], mac_output[22], compute_out[22]);
recon_top_level cu23 (neuron_input, weight_bank[23], bias_bank[23], clk, reset, af_nos[n], mac_output[23], compute_out[23]);
recon_top_level cu24 (neuron_input, weight_bank[24], bias_bank[24], clk, reset, af_nos[n], mac_output[24], compute_out[24]);
recon_top_level cu25 (neuron_input, weight_bank[25], bias_bank[25], clk, reset, af_nos[n], mac_output[25], compute_out[25]);
recon_top_level cu26 (neuron_input, weight_bank[26], bias_bank[26], clk, reset, af_nos[n], mac_output[26], compute_out[26]);
recon_top_level cu27 (neuron_input, weight_bank[27], bias_bank[27], clk, reset, af_nos[n], mac_output[27], compute_out[27]);
recon_top_level cu28 (neuron_input, weight_bank[28], bias_bank[28], clk, reset, af_nos[n], mac_output[28], compute_out[28]);
recon_top_level cu29 (neuron_input, weight_bank[29], bias_bank[29], clk, reset, af_nos[n], mac_output[29], compute_out[29]);
recon_top_level cu30 (neuron_input, weight_bank[30], bias_bank[30], clk, reset, af_nos[n], mac_output[30], compute_out[30]);
recon_top_level cu31 (neuron_input, weight_bank[31], bias_bank[31], clk, reset, af_nos[n], mac_output[31], compute_out[31]);
recon_top_level cu32 (neuron_input, weight_bank[32], bias_bank[32], clk, reset, af_nos[n], mac_output[32], compute_out[32]);
recon_top_level cu33 (neuron_input, weight_bank[33], bias_bank[33], clk, reset, af_nos[n], mac_output[33], compute_out[33]);
recon_top_level cu34 (neuron_input, weight_bank[34], bias_bank[34], clk, reset, af_nos[n], mac_output[34], compute_out[34]);
recon_top_level cu35 (neuron_input, weight_bank[35], bias_bank[35], clk, reset, af_nos[n], mac_output[35], compute_out[35]);
recon_top_level cu36 (neuron_input, weight_bank[36], bias_bank[36], clk, reset, af_nos[n], mac_output[36], compute_out[36]);
recon_top_level cu37 (neuron_input, weight_bank[37], bias_bank[37], clk, reset, af_nos[n], mac_output[37], compute_out[37]);
recon_top_level cu38 (neuron_input, weight_bank[38], bias_bank[38], clk, reset, af_nos[n], mac_output[38], compute_out[38]);
recon_top_level cu39 (neuron_input, weight_bank[39], bias_bank[39], clk, reset, af_nos[n], mac_output[39], compute_out[39]);
recon_top_level cu40 (neuron_input, weight_bank[40], bias_bank[40], clk, reset, af_nos[n], mac_output[40], compute_out[40]);
recon_top_level cu41 (neuron_input, weight_bank[41], bias_bank[41], clk, reset, af_nos[n], mac_output[41], compute_out[41]);
recon_top_level cu42 (neuron_input, weight_bank[42], bias_bank[42], clk, reset, af_nos[n], mac_output[42], compute_out[42]);
recon_top_level cu43 (neuron_input, weight_bank[43], bias_bank[43], clk, reset, af_nos[n], mac_output[43], compute_out[43]);
recon_top_level cu44 (neuron_input, weight_bank[44], bias_bank[44], clk, reset, af_nos[n], mac_output[44], compute_out[44]);
recon_top_level cu45 (neuron_input, weight_bank[45], bias_bank[45], clk, reset, af_nos[n], mac_output[45], compute_out[45]);
recon_top_level cu46 (neuron_input, weight_bank[46], bias_bank[46], clk, reset, af_nos[n], mac_output[46], compute_out[46]);
recon_top_level cu47 (neuron_input, weight_bank[47], bias_bank[47], clk, reset, af_nos[n], mac_output[47], compute_out[47]);
recon_top_level cu48 (neuron_input, weight_bank[48], bias_bank[48], clk, reset, af_nos[n], mac_output[48], compute_out[48]);
recon_top_level cu49 (neuron_input, weight_bank[49], bias_bank[49], clk, reset, af_nos[n], mac_output[49], compute_out[49]);
recon_top_level cu50 (neuron_input, weight_bank[50], bias_bank[50], clk, reset, af_nos[n], mac_output[50], compute_out[50]);
recon_top_level cu51 (neuron_input, weight_bank[51], bias_bank[51], clk, reset, af_nos[n], mac_output[51], compute_out[51]);
recon_top_level cu52 (neuron_input, weight_bank[52], bias_bank[52], clk, reset, af_nos[n], mac_output[52], compute_out[52]);
recon_top_level cu53 (neuron_input, weight_bank[53], bias_bank[53], clk, reset, af_nos[n], mac_output[53], compute_out[53]);
recon_top_level cu54 (neuron_input, weight_bank[54], bias_bank[54], clk, reset, af_nos[n], mac_output[54], compute_out[54]);
recon_top_level cu55 (neuron_input, weight_bank[55], bias_bank[55], clk, reset, af_nos[n], mac_output[55], compute_out[55]);
recon_top_level cu56 (neuron_input, weight_bank[56], bias_bank[56], clk, reset, af_nos[n], mac_output[56], compute_out[56]);
recon_top_level cu57 (neuron_input, weight_bank[57], bias_bank[57], clk, reset, af_nos[n], mac_output[57], compute_out[57]);
recon_top_level cu58 (neuron_input, weight_bank[58], bias_bank[58], clk, reset, af_nos[n], mac_output[58], compute_out[58]);
recon_top_level cu59 (neuron_input, weight_bank[59], bias_bank[59], clk, reset, af_nos[n], mac_output[59], compute_out[59]);
recon_top_level cu60 (neuron_input, weight_bank[60], bias_bank[60], clk, reset, af_nos[n], mac_output[60], compute_out[60]);
recon_top_level cu61 (neuron_input, weight_bank[61], bias_bank[61], clk, reset, af_nos[n], mac_output[61], compute_out[61]);
recon_top_level cu62 (neuron_input, weight_bank[62], bias_bank[62], clk, reset, af_nos[n], mac_output[62], compute_out[62]);
recon_top_level cu63 (neuron_input, weight_bank[63], bias_bank[63], clk, reset, af_nos[n], mac_output[63], compute_out[63]);


    
endmodule
