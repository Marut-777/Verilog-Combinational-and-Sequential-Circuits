`timescale 1ns/1ps

module tb_sequence_detector_101;

    reg clk;
    reg reset;
    reg din;
    wire detected;

    sequence_detector_101 dut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .detected(detected)
    );

    // 10 ns clock period
    always #5 clk = ~clk;

    task send_bit;
        input bit_value;
        begin
            @(negedge clk);
            din = bit_value;
            @(posedge clk);
            #1;
            $display("din=%b, detected=%b", din, detected);
        end
    endtask

    initial begin
        $dumpfile("sequence_detector_101.vcd");
        $dumpvars(0, tb_sequence_detector_101);

        clk = 0;
        reset = 1;
        din = 0;

        #12;
        reset = 0;

        // First pattern: 101 — should detect
        send_bit(1);
        send_bit(0);
        send_bit(1);

        // Additional bits: 0, 1, 0, 1 — another 101 occurs
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(1);

        $display("Sequence detector test completed.");
        $finish;
    end

endmodule
