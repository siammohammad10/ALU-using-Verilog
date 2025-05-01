// =========================== SUB =========================== //

module SUB(result, opA, opB);
    output [7:0] result;
    input [7:0] opA, opB;
    assign result = opA - opB; // perform subtraction
endmodule
