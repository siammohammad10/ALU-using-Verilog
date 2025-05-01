// =========================== TESTBENCH: SUB =========================== //

`timescale 1ns / 1ps
`include "sub.v"

module tb_sub;
    reg [7:0] opA, opB;
    wire [7:0] result;

    SUB uut(
        .result(result),
        .opA(opA), .opB(opB)
    );

    initial begin
        $display("Testing SUB");

        // Example test case
        opA = 8'd15;
        opB = 8'd3;
        #1 $display("opA = %d, opB = %d, result = %d", opA, opB, result);
        
        // Additional test cases can be added here
        $finish;
    end
endmodule

// iverilog -o tb_sub.vvp tb_sub.v
// vvp tb_sub.vvp