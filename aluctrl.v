module aluctrl(input [1:0] aluop, input [2:0] inst, input in, output reg [3:0] alusel);
    always @(*) begin
        casez ({aluop, inst, in})
            6'b00zzzz: alusel = 4'b0010; // Load/Store: ADD
            6'b01zzzz: alusel = 4'b0110; // Branch: SUB
            6'b100000: alusel = 4'b0010; // ADDI
            6'b100100: alusel = 4'b0000; // ANDI
            6'b100110: alusel = 4'b0100; // XORI
            6'b101000: alusel = 4'b0000; // AND
            6'b101001: alusel = 4'b0001; // OR
            6'b101010: alusel = 4'b0101; // SLL
            6'b101100: alusel = 4'b0001; // ORI
            6'b101110: alusel = 4'b0011; // AUIPC
            // 6'bzz**** : alusel = 4'b1000; // LUI
            default: alusel = 4'b0000; // Default safety
        endcase
    end
endmodule
