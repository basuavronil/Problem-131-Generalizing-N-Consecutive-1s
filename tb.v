`timescale 1ns / 1ps

module tb_consecutive_ones_detector;

    reg [31:0] in;
    wire detected;

    // Instantiate the Unit Under Test (UUT)
    consecutive_ones_detector uut (
        .in(in),
        .detected(detected)
    );

    initial begin
        $dumpfile("consecutive_ones.vcd");
        $dumpvars(0, tb_consecutive_ones_detector);

        $display("Time     | Input Word (Hex)                 | Detected");
        $display("-----------------------------------------------------");

        // Test 1: No 4 consecutive 1s (only 3)
        in = 32'h0000_000E; #10;
        $display("%t | %h |   %b", $time, in, detected);

        // Test 2: Exactly 4 consecutive 1s at the lower bits (binary ...000F)
        in = 32'h0000_000F; #10;
        $display("%t | %h |   %b", $time, in, detected);

        // Test 3: 4 consecutive 1s shifted higher
        in = 32'h0000_00F0; #10;
        $display("%t | %h |   %b", $time, in, detected);

        // Test 4: 5 consecutive 1s (should also trigger)
        in = 32'h0000_001F; #10;
        $display("%t | %h |   %b", $time, in, detected);

        // Test 5: Scattered 1s (no 4 in a row)
        in = 32'h5555_5555; #10;
        $display("%t | %h |   %b", $time, in, detected);

        $finish;
    end

endmodule
