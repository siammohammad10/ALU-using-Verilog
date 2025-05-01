// =========================== TESTBENCH: MUX =========================== //
`timescale 1ns / 1ps
`include "mux.v"

module tb_mux;
    reg [3:0] opS;
    reg [7:0] nop, add, sub, and_, or_, xor_, invert, sl, sr;
    wire [7:0] result;

    MUX uut(
        .result(result), .nop_wire(nop), .add_out(add), .sub_out(sub),
        .and_out(and_), .or_out(or_), .xor_out(xor_), .invert_out(invert),
        .shift_left_out(sl), .shift_right_out(sr), .opS(opS)
    );

    initial begin
        $display("Testing MUX");
        nop = 0; add = 8'd5; sub = 8'd1;
        and_ = 8'h0F; or_ = 8'hF0; xor_ = 8'hAA;
        invert = 8'h33; sl = 8'd2; sr = 8'd4;

        opS = 4'd1; #10; $display("ADD: %d", result);
        opS = 4'd4; #10; $display("OR: %b", result);
        opS = 4'd8; #10; $display("SHIFT RIGHT: %b", result);
        $finish;
    end
endmodule

// iverilog -o tb_mux.vvp tb_mux.v
// vvp tb_mux.vvp

