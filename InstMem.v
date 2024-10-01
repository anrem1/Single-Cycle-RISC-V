module InstMem (input [5:0] addr, output [31:0] data_out);
reg [31:0] mem [0:63];
assign data_out = mem[addr];

initial begin
mem[6'b000000] = 4;
mem[6'b000001] = 20;
mem[6'b000100] = 16;
mem[6'b010001] = 128;
mem[6'b000111] = 256;
end
endmodule
