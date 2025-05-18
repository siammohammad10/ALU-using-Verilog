`timescale 1ns/1ps
`include "seqcircuit.v"

module testbench();

    wire F;
    wire [15:0] Q, R;
    reg C, S;
    reg [15:0] A, B;

    top UUT(C, A, B, S, Q, R, F);

    // Clock Generation: 1ns high, 1ns low (period = 2ns)
    always begin
        C = ~C;
        #1;
    end

    initial begin
        $dumpfile("tb_circuits.vcd");
        $dumpvars(0, testbench);
        C = 0; 
        S = 0;

        #10;

        // Test Case 1: Positive / Positive
        A = 2000;
        B = 45;
        S = 1;
        wait (F == 1);
        $display("Test 1: %d / %d = %d, Remainder = %d", A, B, Q, R);

        S = 0; #10;

        // Test Case 2: Positive / Negative
        A = 2000;
        B = -45;
        S = 1;
        wait (F == 1);
        $display("Test 2: %d / %d = %d, Remainder = %d", $signed(A), $signed(B), $signed(Q), $signed(R));

        S = 0; #10;

        // Test Case 3: Negative / Positive
        A = -2000;
        B = 45;
        S = 1;
        wait (F == 1);
        $display("Test 3: %d / %d = %d, Remainder = %d", $signed(A), $signed(B), $signed(Q), $signed(R));

        S = 0; #10;

        // Test Case 4: Negative / Negative
        A = -2000;
        B = -45;
        S = 1;
        wait (F == 1);
        $display("Test 4: %d / %d = %d, Remainder = %d", $signed(A), $signed(B), $signed(Q), $signed(R));

        $finish;
    end
endmodule


// iverilog -o tb_seqcircuit.vvp tb_circuits.v
// vvp tb_seqcircuit.vvp