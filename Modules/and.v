// =========================== AND =========================== //

module AND(result, opA, opB);
    output [7:0] result;
    input [7:0] opA, opB;
    assign result = opA & opB;
endmodule

