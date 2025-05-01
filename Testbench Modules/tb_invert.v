// =========================== TESTBENCH: INVERT =========================== //
`timescale 1ns / 1ps
`include "invert.v"

module tb_invert;
    reg [7:0] op;
    wire [7:0] result;

    INVERT uut(
        .result(result),
        .op(op)
    );

    initial begin
        $display("Testing INVERT");

        op = 8'd15;
        #10 $display("op = %b, result = %b", op, result);

        op = 8'b10101010;
        #10 $display("op = %b, result = %b", op, result);

        $finish;
    end
endmodule


// iverilog -o tb_invert.vvp tb_invert.v
// vvp tb_invert.vvp

