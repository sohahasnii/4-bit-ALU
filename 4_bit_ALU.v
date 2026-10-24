
module 4_bit_ALU (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] sel,

    output reg [3:0] result,
    output reg       carry, //overflow flag
    output           zero   //zero flag
);

    reg [4:0] temp;

    always @(*) begin
        // Default values
        result = 4'b0000;
        carry  = 1'b0;
        temp   = 5'b00000;

        case (sel)

            3'b000: begin
                // Addition
                temp   = A + B ;
                result = temp[3:0];
                carry  = temp[4];
            end

            3'b001: begin
                // Subtraction: A - B
                temp   = A + ~B + 5'b00001;
                result = temp[3:0];
                carry  = temp[4];
            end

            3'b010: begin
                // Bitwise AND
                result = A & B;
            end

            3'b011: begin
                // Bitwise OR
                result = A | B;
            end

            3'b100: begin
                // Bitwise XOR
                result = A ^ B;
            end

            3'b101: begin
                // Bitwise NOT
                result = ~A;
            end

            3'b110: begin
                // Logical left shift
                result = A << 1;
            end

            3'b111: begin
                // Logical right shift
                result = A >> 1;
            end

            default: begin
                result = 4'b0000;
                carry  = 1'b0;
            end

        endcase
    end

    assign zero = (result == 4'b0000);

endmodule
