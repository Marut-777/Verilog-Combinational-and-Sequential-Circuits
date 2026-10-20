`timescale 1ns/1ps

module tb_counter_4bit;

    reg clk;
    reg reset;
    wire [3:0] count;

    counter_4bit dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Generate a clock with a 10 ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter_4bit.vcd");
        $dumpvars(0, tb_counter_4bit);

        clk = 0;
        reset = 1;

        // Hold reset briefly, then release it
        #12;
        reset = 0;

        // Observe several counter increments
        repeat (18) begin
            @(posedge clk);
            #1;
            $display("Time=%0t ns, count=%b (%0d)",
                     $time, count, count);
        end

        $display("Counter test completed.");
        $finish;
    end

endmodule
