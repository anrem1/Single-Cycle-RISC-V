

module main(input [5:0] pc, input clk, input [31:0] instr );
// should pc be 32 ? 6? bits? where does it come from
// divide by 4??? for inst mem
wire [31: 0] data_out;
wire [31:0] imm_out;
wire branch, mr, mtoreg, mwrite, alusrc, regwr; // reg?
wire [1:0] aluop; // reg?
reg rst;    // ???
wire [31:0] rdata1, rdata2;
InstMem inst(.addr(pc), .data_out(data_out));
wire [31:0] A, B;   // inputs to ALU
wire [3:0] alusel;
wire [31:0] alures; // reg?
wire zero;  // reg?
// ctrl input is 7 bits in model but 5 bits here?
control ctrl( instr[7:2] /*how many bits?*/,  branch, mr, mtoreg, mwrite, alusrc, regwr, aluop);

// put in reg file (what should reset connect to?) (what to put in write data?)
 regfile regs( .wsig(regwr),  .clk(clk),  .rst(rst), .radd1(data_out[19:15]) , radd2(data_out[24:20]), .wadd(inst[11:7]), 
  .wdata(/*???*/),  .rdata1(rdata1) , .rdata2(rdata2));
  
  // put in imm gen
  ImmGen immgen(.gen_out(imm_out), .inst(data_out));
  
  // put in mux after regfile (32 input?) (make sure order is correct)
  nmux2x1#(32) nmux_inst(alusrc, /*data of second reg*/, imm_out, .out(B));
  
  // inst input should be [14:12] and 30?
  aluctrl aluctrl(aluop, instr[14:12], instr[30], alusel );
  // need to get data from 1st reg in reg file into A
  alu #( 32)(.A(A),  .B(B), alusel, alures, zero);
  
  // put in data mem, divide by 4?
  // STOPPED HERE
  DataMem( clk, input MemRead, input MemWrite, input [5:0] addr, input [31:0] data_in, output [31:0] data_out);
  
  // put in mux 
   nmux2x1#(32) nmux_inst(input s, input [n-1:0] in1, input [n-1:0] in2, output [n-1:0] out);
   
   // write data to registers how? regfile inst again? or always block?
   // 32 bits for left shift?
   nshift  #(32)(input [n-1:0] in, output [n-1:0] out);
   // put in adder, rca or full adder? 
   
  rca rca_inst( A, B, sum, overflow);
  rca rca_inst( A, B, sum, overflow);   // add pc + 4 ? neeed rca or no?
  // and branch signal and zero flag
  
  nmux2x1#(32) nmux_inst(input s, input [n-1:0] in1, input [n-1:0] in2, output [n-1:0] out);
  // put result of mux back in pc 
endmodule
