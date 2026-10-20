`timescale 1ns/1ps

module tb_adder_subtractor;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        mode;
    wire [4:0] result;

    adder_subtractor_4bit dut (
        .a(a),
        .b(b),
        .mode(mode),
        .result(result)
    );

    initial begin
        $dumpfile("adder_subtractor.vcd");
        $dumpvars(0, tb_adder_subtractor);

        // Test 1: 3 + 5 = 8
        a = 4'd3;
        b = 4'd5;
        mode = 1'b0;
        #10;
        $display("ADD: %0d + %0d = %0d", a, b, result);
        if (result !== 5'd8)
            $display("FAIL: 3 + 5");
        else
            $display("PASS: 3 + 5");

        // Test 2: 15 + 1 = 16
        a = 4'd15;
        b = 4'd1;
        mode = 1'b0;
        #10;
        $display("ADD: %0d + %0d = %0d", a, b, result);
        if (result !== 5'd16)
            $display("FAIL: 15 + 1");
        else
            $display("PASS: 15 + 1");

        // Test 3: 9 - 4 = 5
        a = 4'd9;
        b = 4'd4;
        mode = 1'b1;
        #10;
        $display("SUB: %0d - %0d = %0d", a, b, result);
        if (result !== 5'd5)
            $display("FAIL: 9 - 4");
        else
            $display("PASS: 9 - 4");

        // Test 4: 3 - 5 = -2, represented as 5-bit two's complement
        a = 4'd3;
        b = 4'd5;
        mode = 1'b1;
        #10;
        $display("SUB: %0d - %0d = %b", a, b, result);
        if (result !== 5'b11110)
            $display("FAIL: 3 - 5");
        else
            $display("PASS: 3 - 5");

        $display("All tests completed.");
        $finish;
    end

endmodule
