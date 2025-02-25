`timescale 1ns / 1ps

module recon_tb;

    // Parameters
    parameter WIDTH = 15;

    // Inputs
    reg clk;
    reg reset;
    reg m;
    reg [WIDTH:0] Xo, Yo, Zo;

    // Outputs
    wire [WIDTH:0] Xout, Yout, Zout;

    // Instantiate the Unit Under Test (UUT)
    recon #(WIDTH) uut (
        .clk(clk),
        .reset(reset),
        .m(m),
        .Xo(Xo),
        .Yo(Yo),
        .Zo(Zo),
        .Xout(Xout),
        .Yout(Yout),
        .Zout(Zout)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10 ns clock period
    end

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        m = 0;
        Xo = 0;
        Yo = 0;
        Zo = 0;

 Xo = 9'b000000000; Yo = 9'b000000000; Zo = 9'b000000000; m = 0;

        // Apply reset
        #15 reset = 0;

        // Test case 1: Apply inputs
       

        // Wait for some cycles
        #100;
        reset = 1; 
        # 20 reset = 0;
Xo = 16'b0000010011010100; Yo = 16'b0000000000000000; Zo = 16'b0000001100100000; m = 1;

//0.68750	0000001011000000
//0.18750	0000000011000000
//0.90625	0000001110100000

//0.25	0000000100000000
//1.325	0000010101001101
//0.9424	0000001111000101

//0.32	0000000101001000
//0.645	0000001010010100
//3.14	0000110010001111

#200
//reset = 1;
//#20 reset = 0;
//Xo = 9'b001111000; Yo = 9'b001000100; Zo = 9'b111111110; m = 0;
        // Test case 2: Change inputs
  //      #10 Xo = 9'b0011110000; Yo = 9'b0010101010; Zo = 9'b0001010101; m = 0;

        // Wait for some cycles
       // #100;

        // Test case 3: Apply reset again
//        #10 reset = 1;
//        #10 reset = 0;

        // Final test case
   //     #10 Xo = 9'b0001010101; Yo = 9'b0000110011; Zo = 9'b0011001100; m = 0;

        // Wait for some cycles
 //       #50;

        // End simulation
        $stop;
    end

    initial begin
        $monitor("Time = %0t | reset = %b | m = %b | Xo = %b | Yo = %b | Zo = %b | Xout = %b | Yout = %b | Zout = %b", 
                  $time, reset, m, Xo, Yo, Zo, Xout, Yout, Zout);
    end

endmodule