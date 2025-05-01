// =========================== NOP =========================== //

module NOP(result, opA, opB);
    output [7:0] result;
    input [7:0] opA, opB;
    assign result = 8'd0;
endmodule
