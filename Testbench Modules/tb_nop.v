// =========================== TESTBENCH: NOP =========================== //
`timescale 1ns / 1ps
`include "nop.v"

module tb_nop;
    reg [7:0] opA, opB;
    wire [7:0] result;

    NOP uut(
        .result(result),
        .opA(opA), .opB(opB)
    );

    initial begin
        $display("Testing NOP");

        // Example test case
        opA = 8'd15;
        opB = 8'd3;
        #1 $display("opA = %d, opB = %d, result = %d", opA, opB, result);
        
        // Additional test cases can be added here
        $finish;
    end
endmodule

// iverilog -o tb_nop.vvp tb_nop.v
// vvp tb_nop.vvp

