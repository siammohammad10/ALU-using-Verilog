// =========================== TESTBENCH: ADD =========================== //
`timescale 1ns / 1ps
`include "add.v"

module tb_add;
    reg [7:0] opA, opB;
    wire [7:0] result;

    ADD uut(
        .result(result),
        .opA(opA), .opB(opB)
    );

    initial begin
        $display("Testing ADD");

        // Example test case
        opA = 8'd15;
        opB = 8'd3;
        #1 $display("opA = %d, opB = %d, result = %d", opA, opB, result);
        
        // Additional test cases can be added here
        $finish;
    end
endmodule


// iverilog -o tb_add.vvp tb_add.v
// vvp tb_add.vvp

