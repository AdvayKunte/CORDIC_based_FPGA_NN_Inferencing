`timescale 1ns / 1ps

module recon_top_level_tb;

    parameter WIDTH = 15;
    reg [WIDTH:0] Xo, Yo, Zo;
    reg clk;
    reg ext_reset;
    reg [1:0] sel;
    wire [WIDTH:0] z;

    // Instantiate the DUT (Design Under Test)
    recon_top_level #(WIDTH) dut (
        .Xo(Xo),
        .Yo(Yo),
        .Zo(Zo),
        .clk(clk),
        .ext_reset(ext_reset),
        .sel(sel),
        .z(z)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Stimulus Process
    initial begin
        // Initialize signals
        ext_reset = 1; // Active high reset
        Xo = 16'b0000001100000000; // +0.75
        Yo = 16'b0000000100000000; // +0.25
        Zo = 16'b0000000111000101;
        sel = 2'b00;

        #10; // Allow some time before deasserting reset
        ext_reset = 0;

        // Test Case
        #350;
        ext_reset = 1; // Active high reset
        Xo = 16'b0000000010000000; // +0.125
        Yo = 16'b0000000000011101; // -0.625
        Zo = 16'b0000001000000000; //0.5
        sel = 2'b00;
        #10
        ext_reset = 0;
        #400
        // Finish Simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | Xo = %d | Yo = %d | Zo = %d | sel = %b | z = %d",
                 $time, Xo, Yo, Zo, sel, z);
    end

endmodule


