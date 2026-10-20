`timescale 1ns/1ps

module sequence_detector_101 (
    input  wire clk,
    input  wire reset,
    input  wire din,
    output reg  detected
);

    // State encodes how much of 101 has matched
    localparam S0 = 2'b00; // No match
    localparam S1 = 2'b01; // Saw 1
    localparam S2 = 2'b10; // Saw 10
    localparam S3 = 2'b11; // Detected 101

    reg [1:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state    <= S0;
            detected <= 1'b0;
        end else begin
            detected <= 1'b0; // Default: one-cycle pulse

            case (state)
                S0: begin
                    if (din)
                        state <= S1;
                    else
                        state <= S0;
                end

                S1: begin
                    if (din)
                        state <= S1; // Latest bit is still 1
                    else
                        state <= S2; // Matched 10
                end

                S2: begin
                    if (din) begin
                        state    <= S3;
                        detected <= 1'b1; // Matched 101
                    end else begin
                        state <= S0;
                    end
                end

                S3: begin
                    // For overlap, a detected 101 ends in 1.
                    // Treat this as the start of a possible new match.
                    if (din)
                        state <= S1;
                    else
                        state <= S2;
                end

                default: begin
                    state    <= S0;
                    detected <= 1'b0;
                end
            endcase
        end
    end

endmodule
