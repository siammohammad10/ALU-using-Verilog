// =========================== SHIFT_LEFT =========================== //

module SHIFT_LEFT(result, op);
    output [7:0] result;
    input [7:0] op;
    assign result = op << 1; // shift left by 1 bit
endmodule
