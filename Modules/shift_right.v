// =========================== SHIFT_RIGHT =========================== //

module SHIFT_RIGHT(result, op);
    output [7:0] result;
    input [7:0] op;
    assign result = op >> 1; // shift right by 1 bit
endmodule
