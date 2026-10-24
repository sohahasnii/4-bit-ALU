
`timescale 1ns / 1ps

module 4_bit_ALU_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] sel;

    wire [3:0] result;
    wire carry;
    wire zero;

    4_bit_ALU uut (
        .A(A),
        .B(B),
        .sel(sel),
        .result(result),
        .carry(carry),
        .zero(zero)
    );

    initial begin

        $monitor(
            "Time=%0t A=%b B=%b sel=%b result=%b carry=%b zero=%b",
            $time, A, B, sel, result, carry, zero
        );

        // Addition: 5 + 3 = 8
        A = 4'b0101;
        B = 4'b0011;
        sel = 3'b000;
        #10;

        // Addition with carry: 15 + 1
        A = 4'b1111;
        B = 4'b0001;
        sel = 3'b000;
        #10;

        // Subtraction: 5 - 3 = 2
        A = 4'b0101;
        B = 4'b0011;
        sel = 3'b001;
        #10;

        // AND
        A = 4'b1010;
        B = 4'b1100;
        sel = 3'b010;
        #10;

        // OR
        sel = 3'b011;
        #10;

        // XOR
        sel = 3'b100;
        #10;

        // NOT A
        sel = 3'b101;
        #10;

        // Left shift
        A = 4'b1011;
        sel = 3'b110;
        #10;

        // Right shift
        sel = 3'b111;
        #10;

        // Zero result
        A = 4'b0101;
        B = 4'b0101;
        sel = 3'b001;
        #10;

        $finish;

    end

endmodule
