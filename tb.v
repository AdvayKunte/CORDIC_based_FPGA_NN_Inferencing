`timescale 1ns / 1ps

module final_destination_tb;

    // Inputs
    reg clk, start;
    reg [5:0] no_layers, nl1, nl2, nl3, nl4, nl5, n_in;
    reg [1:0] afl1, afl2, afl3, afl4, afl5;

    // Instantiate the Unit Under Test (UUT)
    final_destination uut (
        .clk(clk),
        .start(start),
        .no_layers(no_layers),
        .nl1(nl1),
        .nl2(nl2),
        .nl3(nl3),
        .nl4(nl4),
        .nl5(nl5),
        .n_in(n_in),
        .afl1(afl1),
        .afl2(afl2),
        .afl3(afl3),
        .afl4(afl4),
        .afl5(afl5)
    );

    // Clock generation
    always #5 clk = ~clk; // 100MHz clock (10ns period)

    initial begin
        // Initialize inputs
        clk = 0;
        start = 0;
        no_layers = 6'b000011; // 3 layers
        nl1 = 6'b000010;      // 2 neurons in layer 1
        nl2 = 6'b000011;      // 3 neuron in layer 2
        nl3 = 6'b000010;      // 2 neurons in layer 3
        nl4 = 6'b000000;      // 0 neurons in layer 4
        nl5 = 6'b000000;      // 0 neurons in layer 5
        n_in =6'b000010;       //Number of Input dimensions

        afl1 = 2'b00;
        afl2 = 2'b00;
        afl3 = 2'b00;
        afl4 = 2'b00;
        afl5 = 2'b00;

        // Apply start signal after some delay
        #27;
        start = 1;
        #15;
        start = 0;

        // Wait for completion or further verification steps
        #10000;

        $display("Test Completed");
        $finish;
    end
endmodule