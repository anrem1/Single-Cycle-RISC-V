module InstMem (input [5:0] addr, output [31:0] data_out);
reg [31:0] mem [0:63];
assign data_out = mem[addr];

initial begin

//    mem[0] = 32'b00000000000000000001_00001_0110111;   // LUI x1, 0x1 (Loads 0x12345000 into x1)
//    mem[1] = 32'b0000000000000000010_00010_0010111;   // AUIPC x2, 4 (Adds PC + 4 to x2)
//    mem[2] = 32'b1000_0000_0000_0000_0000_0000_1101111;   // JAL x3, 8 (Jumps to PC + 8, stores return address in x3)
//    mem[3] = 32'b0100_0000_0000_0001_0000_0000_1100111;   // JALR x4, x1, 4 (Jumps to x1 + 4, stores return in x4)
//    mem[4] = 32'b0001_0000_0000_0000_0000_0000_1100011;   // BEQ x0, x0, label1 (Branches if equal)
//    mem[5] = 32'b0011000_00001_00101_101_1000_0_1100011;   // BLT x1, x5, label3 (Branches if x1 < x5)
//    mem[6] = 32'b000000_00000_00101_001_00100_1100011;   // BNE x0, x5, label2 (Branches if not equal)
//    mem[7] = 32'b0100_0000_0000_0001_0010_0001_1100011;   // BGE x2, x1, label4 (Branches if x2 >= x1)
//    mem[8] = 32'b0000_0000_0000_0000_010_00101_0000011;   // LW x5, 0(x0) (Load word from address in x1 into x5)

//    mem[9] = 32'b0000000_00101_00010_010_00100_0100011;   // SW x5, 4(x2) (Store x5 at address in x2 + 4)
      mem[0] = 32'b10100000000_00000_000_00110_0010011;  // ADDI x6, x0, 42 (Adds 42 to x0, result in x6)
//    mem[11] = 32'b1000_1111_0000_0001_010_00111_0010011;  // SLTI x7, x1, 1000 (x7 = 1 if x1 < 1000)
//    mem[12] = 32'b1111_1111_0000_0000_100_01000_0010011;  // XORI x8, x0, 0xFF (x8 = 0xFF)
//    mem[13] = 32'b1111_0000_1111_0000_110_01001_0010011;  // ORI x9, x8, 0x0F0F (x9 = x8 | 0x0F0F)
//    mem[14] = 32'b0010_0000_0000_0001_001_01010_0010011;  // SLLI x10, x9, 2 (x10 = x9 << 2)
//    mem[15] = 32'b0000_0000_01010_01000_000_01011_0110011; // ADD x11, x8, x10 (x11 = x8 + x10)
//    mem[16] = 32'b0100_0000_01000_01010_000_01100_0110011; // SUB x12, x10, x8 (x12 = x10 - x8)
//    mem[17] = 32'b0000_0000_00010_01100_001_01101_0110011; // SLL x13, x12, x2 (Shift x12 left by x2)
//    mem[18] = 32'b0000_0000_01001_01101_111_01110_0110011; // AND x14, x13, x9 (x14 = x13 & x9)
//      mem[19] = 32'b0000000_00100_00010_000_00011_0000011;  // LB x3, 4(x2) (Loads a byte from address x2 + 4 into x3)
//      mem[20] = 32'b0000000_00100_00010_001_00100_0000011;  // LH x4, 4(x2) (Loads a half-word from address x2 + 4 into x4)
//      mem[21] = 32'b0000000_00100_00010_100_00101_0000011;  // LBU x5, 4(x2) (Loads a byte from address x2 + 4 into x5, zero-extended)
//      mem[22] = 32'b0000000_00100_00010_101_00110_0000011;  // LHU x6, 4(x2) (Loads a half-word from address x2 + 4 into x6, zero-extended)
//      mem[23] = 32'b0000000_00101_00010_000_00100_0100011;  // SB x5, 4(x2) (Store the least significant byte of x5 at address x2 + 4)
//      mem[24] = 32'b0000000_00101_00010_001_00100_0100011;  // SH x5, 4(x2) (Store the least significant half-word of x5 at address x2 + 4)


end
endmodule
