`timescale 1ns / 1ps
(* dont_touch = "true" *) module final_destination(
    input clk, start
);
    (* dont_touch = "true" *) wire [15:0] wt_in, bias_in;
    (* dont_touch = "true" *) wire weight_en, bias_en;
    (* dont_touch = "true" *) wire [5:0] n;
    (* dont_touch = "true" *) wire [9:0] i;
    wire [5:0] no_layers, nl1, nl2, nl3, nl4, nl5;
    wire [9:0] n_in;
    wire [1:0] afl1, afl2, afl3, afl4, afl5;
    
    (* dont_touch = "true" *) main_memory mem(
        .start(start),
        .clk(clk_new),
        .weight_en(weight_en),
        .bias_en(bias_en),
        .n(n),
        .i(i),
        .wt_data(wt_in),
        .bias_data(bias_in),
        .nl1(nl1),
        .nl2(nl2),
        .nl3(nl3),
        .nl4(nl4),
        .nl5(nl5),
        .nin(n_in)
    );
    
    wire clk_new;
      clk_wiz_0 clk_mod
   (
    // Clock out ports
    .clk_out1(clk_new),     // output clk_out1
   // Clock in ports
    .clk_in1(clk)      // input clk_in1
);
    
    (* dont_touch = "true" *) master_engine eng(
        .clk(clk_new),
        .start(start),
        .no_layers(no_layers),
        .nl1(nl1),
        .nl2(nl2),
        .nl3(nl3),
        .nl4(nl4),
        .nl5(nl5),
        .afl1(afl1),
        .afl2(afl2),
        .afl3(afl3),
        .afl4(afl4),
        .afl5(afl5),
        .wt_in(wt_in),
        .bias_in(bias_in),
        .weight_en(weight_en),
        .bias_en(bias_en),
        .n(n),
        .i(i),
        .n_in(n_in)
    );
    
endmodule