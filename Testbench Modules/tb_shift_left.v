// =========================== TESTBENCH: SHIFT_LEFT =========================== //
`timescale 1ns / 1ps
`include "shift_left.v"

module tb_shift_left;
    reg [7:0] op;
    wire [7:0] result;

    SHIFT_LEFT uut(
        .result(result),
        .op(op)
    );

    initial begin
        $display("Testing SHIFT_LEFT");

        // Example test case
        op = 8'd15; // 00001111
        #10 $display("op = %b, result = %b", op, result); // Expected: 00011110

        op = 8'b10000000;
        #10 $display("op = %b, result = %b", op, result); // Expected: 00000000 (overflow)

        $finish;
    end
endmodule


// iverilog -o tb_shift_left.vvp tb_shift_left.v
// vvp tb_shift_left.vvp

