`timescale 1ns / 1ps
(* dont_touch = "true" *) module final_destination(
    input clk, start,
    input [5:0] no_layers, nl1, nl2, nl3, nl4, nl5, n_in ,
    input [1:0] afl1, afl2, afl3, afl4, afl5
);
    (* dont_touch = "true" *) wire [15:0] wt_in, bias_in;
    (* dont_touch = "true" *) wire weight_en, bias_en;
    (* dont_touch = "true" *) wire [5:0] n, i;
    
    (* dont_touch = "true" *) main_memory mem(
        .start(start),
        .clk(clk),
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
    
    (* dont_touch = "true" *) master_engine eng(
        .clk(clk),
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