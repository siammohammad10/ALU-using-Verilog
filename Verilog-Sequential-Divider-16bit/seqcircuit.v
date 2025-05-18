module top (
    input wire C,                 
    input wire [15:0] A,          
    input wire [15:0] B,          
    input wire S,                 
    output reg [15:0] Q,          
    output reg [15:0] R,          
    output reg F                  
);

    reg [15:0] dividend;
    reg [15:0] divisor;
    reg [4:0] count;
    reg [15:0] remainder;
    reg [15:0] quotient;
    reg running;
    reg sprevious;

    reg sidividend;
    reg sidivisor;
    reg siquotient;
    reg siremainder;

    always @(posedge C) begin
        if (S && !sprevious) begin

            sidividend <= A[15];
            sidivisor  <= B[15];
            siquotient <= A[15] ^ B[15];
            siremainder <= A[15];

            if (A[15]) 
                dividend <= ~A + 1;
            else 
                dividend <= A;

            if (B[15]) 
                divisor <= ~B + 1;
            else 
                divisor <= B;

            remainder <= 0;
            quotient <= 0;
            count <= 16;
            F <= 0;
            running <= 1;
        end else if (running) begin
            remainder = {remainder[14:0], dividend[15]};
            dividend = dividend << 1;

            if (remainder >= divisor) begin
                remainder = remainder - divisor;
                quotient = (quotient << 1) | 1'b1;
            end else begin
                quotient = quotient << 1;
            end

            count = count - 1;

            if (count == 0) begin
                if (siquotient)
                    Q <= ~quotient + 1;
                else
                    Q <= quotient;

                if (siremainder)
                    R <= ~remainder + 1;
                else
                    R <= remainder;

                F <= 1;
                running <= 0;
            end
        end else begin
            F <= 0;
        end

        sprevious <= S;
    end
endmodule
