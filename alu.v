module alu #(parameter n = 32)(
    input [n-1:0] A,
    input [n-1:0] B,
    input [3:0] sel,
    output reg [n-1:0] result,
    // output reg zero,
    output wire cf, zf, vf, sf,
    input [4:0] shamt,
    input [2:0] funct3,
    output reg branch_taken
);

    wire [n-1:0] AND = A & B;
    wire [n-1:0] OR = A | B;
    wire [n-1:0] XOR = A ^ B;
    wire [n-1:0] SLL = A << shamt;
    wire [n-1:0] SRL = A >> shamt;
    wire [n-1:0] SRA = A >>> shamt;
    wire [n-1:0] add, sub, op_b;
    wire [n-1:0] SLT = (A < B) ? 32'b1 : 32'b0;    // Signed comparison for SLT
    wire [n-1:0] SLTU = (A < B) ? 32'b1 : 32'b0;   // Unsigned comparison for SLTU
 
    // Carry-out and Overflow Detection
    assign {cf, add} = sel == 4'b00_01 ? (A - B) : (A + B);
    assign zf = (result == 0);
    assign sf = result[n-1];
    assign vf = (A[n-1] ^ B[n-1]) ^ result[n-1] ^ cf;

    always @(*) begin
        case(sel)
            4'b00_00: result = AND;
            4'b01_00: result = OR;
            4'b01_11: result = XOR;
            4'b00_00: result = add;
            4'b00_01: result = A - B;
            4'b10_01: result = SLL;
            4'b10_00: result = SRL;
            4'b10_10: result = SRA;
            4'b11_01: result = SLT;
            4'b11_11: result = SLTU;
            
            // LUI: Load Upper Immediate - Upper 20 bits
            default: result = 32'b0;
        endcase
        end

    always @(*) begin
        case (funct3)
             3'b000:  branch_taken = (A == B);                // Equal
             3'b001:  branch_taken = (A != B);                // Not Equal
             3'b100:  branch_taken = ($signed(A) < $signed(B)); // Less Than
             3'b101:  branch_taken = ($signed(A) >= $signed(B)); // Greater or Equal
             3'b110: branch_taken = (A < B);                 // Less Than Unsigned
             3'b111: branch_taken = (A >= B);                // Greater or Equal Unsigned
            default:  branch_taken = 1'b0; // Default case for non-branch instructions
        endcase
    end

        // zero = (result == 0);
        endmodule

/*

module prv32_ALU(
	input   wire [31:0] a, b,
	input   wire [4:0]  shamt,
	output  reg  [31:0] r,
	output  wire        cf, zf, vf, sf,
	input   wire [3:0]  alufn
);

    wire [31:0] add, sub, op_b;
    wire cfa, cfs;
    
    assign op_b = (~b);
    
    assign {cf, add} = alufn[0] ? (a + op_b + 1'b1) : (a + b);
    
    assign zf = (add == 0);
    assign sf = add[31];
    assign vf = (a[31] ^ (op_b[31]) ^ add[31] ^ cf);
    
    wire[31:0] sh;
    shifter shifter0(.a(a), .shamt(shamt), .type(alufn[1:0]),  .r(sh));
    
    always @ * begin
        r = 0;
        (* parallel_case *)
        case (alufn)
            // arithmetic
            4'b00_00 : r = add;
            4'b00_01 : r = sub;
            4'b00_11 : r = b;
            // logic
            4'b01_00:  r = a | b;
            4'b01_01:  r = a & b;
            4'b01_11:  r = a ^ b;
            // shift
            4'b10_00:  r=sh;
            4'b10_01:  r=sh;
            4'b10_10:  r=sh;
            // slt & sltu
            4'b11_01:  r = {31'b0,(sf != vf)}; 
            4'b11_11:  r = {31'b0,(~cf)};            	
        endcase
    end
endmodule
*/