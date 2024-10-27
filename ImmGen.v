
module ImmGen (
    output reg [31:0] gen_out, input [31:0] inst
);

always @(*) begin
	case (inst[6:2])
		 5'b00_100   : 	Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] };            // Arith_I 
		 5'b01_000     :     Imm = { {21{IR[31]}}, IR[30:25], IR[11:8], IR[7] };             // Store 
		 5'b01_101     :     Imm = { IR[31], IR[30:20], IR[19:12], 12'b0 };                  // LUI 
		 5'b00_101    :     Imm = { IR[31], IR[30:20], IR[19:12], 12'b0 };                   // AUIPC
		5'b11_011       : 	Imm = { {12{IR[31]}}, IR[19:12], IR[20], IR[30:25], IR[24:21], 1'b0 }; // JAL 
		5'b11_001     : 	Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] };            // JALR 
		5'b11_000    : 	Imm = { {20{IR[31]}}, IR[7], IR[30:25], IR[11:8], 1'b0};         // Branch  
		default      : 	Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] }; // IMM_I
	endcase 
end

endmodule

