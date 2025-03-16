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

        Xo = 16'b0000011000110011; // +0.75
        Yo = 16'b0000001100110011; // +0.25
        Zo = 16'b1111111100110011; // -0.3
        sel = 2'b00;
        #10; ext_reset = 0; #350;

        ext_reset = 1;
        Xo = 16'b0000001000000000; // +0.5
        Yo = 16'b1111110110000000; // -0.625
        Zo = 16'b0000000100000000; // +0.125
        sel = 2'b01;
        #10; ext_reset = 0; #350;

//        ext_reset = 1;
//        Xo = 16'b0000000010000000; // +0.125
//        Yo = 16'b1111111000000000; // -0.5
//        Zo = 16'b0000010000000000; // +1.0
//        sel = 2'b10;
//        #10; ext_reset = 0; #350;

//        ext_reset = 1;
//        Xo = 16'b1111111100000000; // -0.5
//        Yo = 16'b0000010100000000; // +0.625
//        Zo = 16'b0000000110000000; // +0.1875
//        sel = 2'b11;
//        #10; ext_reset = 0; #350;

//        ext_reset = 1;
//        Xo = 16'b1111111110000000; // -0.125
//        Yo = 16'b0000000011000000; // +0.1875
//        Zo = 16'b1111111010000000; // -0.75
//        sel = 2'b00;
//        #10; ext_reset = 0; #350;

//        ext_reset = 1;
//        Xo = 16'b0000011000000000; // +0.75
//        Yo = 16'b1111110100000000; // -0.875
//        Zo = 16'b0000001100000000; // +0.375
//        sel = 2'b01;
//        #10; ext_reset = 0; #350;

//        ext_reset = 1;
//        Xo = 16'b1111110010000000; // -0.9375
//        Yo = 16'b0000001001000000; // +0.28125
//        Zo = 16'b0000010101000000; // +0.65625
//        sel = 2'b10;
//        #10; ext_reset = 0; #350;

//        ext_reset = 1;
//        Xo = 16'b0000000001000000; // +0.03125
//        Yo = 16'b1111111111000000; // -0.0625
//        Zo = 16'b0000000100100000; // +0.140625
//        sel = 2'b11;
//        #10; ext_reset = 0; #350;

//        ext_reset = 1;
//        Xo = 16'b0000010010000000; // +0.5625
//        Yo = 16'b1111110001000000; // -0.96875
//        Zo = 16'b0000000001100000; // +0.046875
//        sel = 2'b00;
//        #10; ext_reset = 0; #350;

//        ext_reset = 1;
//        Xo = 16'b1111110101100000; // -0.84375
//        Yo = 16'b0000000111100000; // +0.46875
//        Zo = 16'b0000010010100000; // +0.578125
//        sel = 2'b01;
//        #10; ext_reset = 0; #350;

        // Finish Simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | Xo = %d | Yo = %d | Zo = %d | sel = %b | z = %d",
                 $time, Xo, Yo, Zo, sel, z);
    end

endmodule
