// =========================== TESTBENCH: OR =========================== //
`timescale 1ns / 1ps
`include "or.v"

module tb_or;
    reg [7:0] opA, opB;
    wire [7:0] result;

    OR uut(
        .result(result),
        .opA(opA), .opB(opB)
    );

    initial begin
        $display("Testing OR");

        // Example test case
        opA = 8'd15;
        opB = 8'd3;
        #1 $display("opA = %d, opB = %d, result = %d", opA, opB, result);
        
        // Additional test cases can be added here
        $finish;
    end
endmodule

// iverilog -o tb_or.vvp tb_or.v
// vvp tb_or.vvp

