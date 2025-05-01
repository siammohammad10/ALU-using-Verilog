// =========================== INVERT =========================== //

module INVERT(result, op);
    output [7:0] result;
    input [7:0] op;
    assign result = ~op;
endmodule

