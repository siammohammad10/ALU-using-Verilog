// =========================== MUX =========================== //

module MUX(result, nop_wire, add_out, sub_out, and_out, or_out, xor_out, invert_out, shift_left_out, shift_right_out, opS);
    output reg [7:0] result;
    input [7:0] nop_wire, add_out, sub_out, and_out, or_out, xor_out, invert_out, shift_left_out, shift_right_out;
    input [3:0] opS;

    always @(*) begin
        case (opS)
            4'd0: result = nop_wire;
            4'd1: result = add_out;
            4'd2: result = sub_out;
            4'd3: result = and_out;
            4'd4: result = or_out;
            4'd5: result = xor_out;
            4'd6: result = invert_out;
            4'd7: result = shift_left_out;
            4'd8: result = shift_right_out;
            default: result = nop_wire;
        endcase
    end
endmodule

