
module ImmGen (
    output reg [31:0] gen_out, input [31:0] inst
);

always @(*) begin
	case (inst[6:2])
		 5'b00_100   : 	gen_out = { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] };            // Arith_I 
		 5'b01_000     :     gen_out = { {21{inst[31]}}, inst[30:25], inst[11:8], inst[7] };             // Store 
		 5'b01_101     :     gen_out = { inst[31:12], 12'b0 };                  // LUI 
		 5'b00_101    :     gen_out = { inst[31:12], 12'b0 };                   // AUIPC
		5'b11_011       : 	gen_out = { {12{inst[31]}}, inst[19:12], inst[20], inst[30:25], inst[24:21], 1'b0 }; // JAL 
		5'b11_001     : 	gen_out = { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] };            // JALR 
		5'b11_000    : 	gen_out = { {20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};         // Branch  
		default      : 	gen_out = { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] }; // IMM_I
	endcase 
end

endmodule

