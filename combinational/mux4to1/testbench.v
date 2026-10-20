`timescale 1ns/1ps

module tb_mux4to1;

    reg d0, d1, d2, d3;
    reg [1:0] sel;
    wire y;

    mux4to1 dut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux4to1.vcd");
        $dumpvars(0, tb_mux4to1);

        // Give each input a distinct value: d0=0, d1=1, d2=0, d3=1
        d0 = 0;
        d1 = 1;
        d2 = 0;
        d3 = 1;

        sel = 2'b00;
        #10;
        $display("sel=%b, y=%b (expected 0)", sel, y);
        if (y !== 0) $display("FAIL: select d0");
        else         $display("PASS: select d0");

        sel = 2'b01;
        #10;
        $display("sel=%b, y=%b (expected 1)", sel, y);
        if (y !== 1) $display("FAIL: select d1");
        else         $display("PASS: select d1");

        sel = 2'b10;
        #10;
        $display("sel=%b, y=%b (expected 0)", sel, y);
        if (y !== 0) $display("FAIL: select d2");
        else         $display("PASS: select d2");

        sel = 2'b11;
        #10;
        $display("sel=%b, y=%b (expected 1)", sel, y);
        if (y !== 1) $display("FAIL: select d3");
        else         $display("PASS: select d3");

        $display("MUX tests completed.");
        $finish;
    end

endmodule
