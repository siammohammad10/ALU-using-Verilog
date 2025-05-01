// =========================== TOP =========================== //

module top(Result, opA, opB, opS);
    output [7:0] Result;
    input [7:0] opA, opB;
    input [3:0] opS;

    wire [7:0] w_nop, w_add, w_sub, w_and, w_or, w_xor;
    wire [7:0] w_invert, w_shift_left, w_shift_righ;

    NOP         i0(.result(w_nop), .opA(opA), .opB(opB));
    ADD         i1(.result(w_add), .opA(opA), .opB(opB));
    SUB         i2(.result(w_sub), .opA(opA), .opB(opB));
    AND         i3(.result(w_and), .opA(opA), .opB(opB));
    OR          i4(.result(w_or),  .opA(opA), .opB(opB));
    XOR         i5(.result(w_xor), .opA(opA), .opB(opB));
    INVERT      i6(.result(w_invert), .op(opA));
    SHIFT_LEFT  i7(.result(w_shift_left), .op(opA));
    SHIFT_RIGHT i8(.result(w_shift_righ), .op(opA));

    MUX mux_inst(
        .result(Result), .nop_wire(w_nop), .add_out(w_add), .sub_out(w_sub),
        .and_out(w_and), .or_out(w_or), .xor_out(w_xor), .invert_out(w_invert),
        .shift_left_out(w_shift_left), .shift_right_out(w_shift_righ), .opS(opS)
    );
endmodule


