`timescale 1ns/1ps

module adder_subtractor_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       mode,   // 0: addition, 1: subtraction
    output wire [4:0] result
);

    wire [4:0] a_ext;
    wire [4:0] b_ext;

    assign a_ext = {1'b0, a};
    assign b_ext = {1'b0, b};

    // XOR with mode inverts b for subtraction.
    // Adding mode supplies the two's-complement +1.
    assign result = a_ext + (b_ext ^ {5{mode}}) + mode;

endmodule
