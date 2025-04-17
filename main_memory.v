`timescale 1ns / 1ps

(* dont_touch = "true" *)module main_memory(
    input start,
    input clk,
    input weight_en, bias_en, 
    input [5:0] n, i,
    output reg [15:0] wt_data, bias_data,
    input [5:0] nl1, nl2, nl3, nl4, nl5,
    input [5:0] nin 
);

    wire [15:0] dina,douta,biaso;
    wire wea;
    
    assign wea = 1'b0;
    assign dina = 16'b0;



//    // Infer BRAM (not just LUT RAM)
//    (* ram_style = "block" *) reg [15:0] weight_storage [0:20480];
//    (* ram_style = "block" *) reg [15:0] bias_storage   [0:319];

    reg [5:0] k;

//    // Include $readmemb during simulation
//    `ifndef SYNTHESIS
//    initial begin
//        $readmemb("fixed_point_random.mem", weight_storage);
//    end

//    initial begin
//        $readmemb("biasbank.mem", bias_storage);
//    end
//    `endif

    // Handle layer sizes
    wire [5:0] ninl [4:0];
    assign ninl[0] = nl1;
    assign ninl[1] = nl2;
    assign ninl[2] = nl3;
    assign ninl[3] = nl4;
    assign ninl[4] = nl5;

    wire [5:0] na [4:0];
    assign na[0] = nl1;
    assign na[1] = nl1;
    assign na[2] = nl2;
    assign na[3] = nl3;
    assign na[4] = nl4;

    // Memory addressing logic
    wire [14:0] weight_addr = (n == 6'b0) ? {n[2:0], i, k} :
                                         {n[2:0], (na[n] - i - 6'b000001), k};


    wire [8:0] bias_addr   = (n == 6'b0) ? {n[2:0], k} :
                                         {n[2:0], ninl[n] - k - 6'b000001};

   (* dont_touch = "true" *) weight_memory wtmem(
      .clka(clk),    // input wire clka
      .ena(weight_en),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(weight_addr),  // input wire [14 : 0] addra
      .dina(dina),    // input wire [15 : 0] dina
      .douta(douta)  // output wire [15 : 0] douta
    );

    (* dont_touch = "true" *)   bias_memory biasmem(
      .clka(clk),    // input wire clka
      .ena(weight_en),   // input wire ena
      .wea(wea),          // input wire [0 : 0] wea
      .addra(bias_addr),  // input wire [8 : 0] addra
      .dina(dina),        // input wire [15 : 0] dina
      .douta(biaso)       // output wire [15 : 0] douta
    );
    

    // Sequential logic
    always @(posedge clk) begin
        if (start) begin
            k = 0;
        end else begin
            if (weight_en) begin
                wt_data = douta;
                k = k + 1;
            end else begin
                k = 0;
            end

            if (bias_en) begin
                bias_data = biaso;
            end
        end
    end

endmodule
