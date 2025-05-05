// =========================== TESTBENCH: TOP =========================== //

`timescale 1ns / 1ps

`include "top.v"
`include "add.v"
`include "sub.v"
`include "and.v"
`include "or.v"
`include "xor.v"
`include "invert.v"
`include "shift_left.v"
`include "shift_right.v"
`include "nop.v"
`include "mux.v"

module tb_top;
    reg [7:0] opA, opB;
    reg [3:0] opS;
    wire [7:0] result;

    top uut(.Result(result), .opA(opA), .opB(opB), .opS(opS));

    initial begin
        $display("Testing TOP Module");

        opA = 8'd15;  // 00001111
        opB = 8'd51;  // 00110011

        opS = 4'd0; #10; $display("NOP        = %d", result);
        opS = 4'd1; #10; $display("ADD        = %d", result);
        opS = 4'd2; #10; $display("SUB        = %d", result);
        opS = 4'd3; #10; $display("AND        = %b", result);
        opS = 4'd4; #10; $display("OR         = %b", result);
        opS = 4'd5; #10; $display("XOR        = %b", result);
        opS = 4'd6; #10; $display("INVERT     = %b", result);
        opS = 4'd7; #10; $display("SHIFT LEFT = %b", result);
        opS = 4'd8; #10; $display("SHIFT RIGHT= %b", result);

        $finish;
    end
endmodule




// iverilog -o tb_top.vvp tb_top.v
// vvp tb_top.vvp

