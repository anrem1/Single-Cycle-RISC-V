module DataMem(
    input clk, 
    input MemRead, 
    input MemWrite, 
    input [2:0] funct3,
    input [5:0] addr, 
    input [31:0] data_in, 
    output reg [31:0] data_out
);
    reg [31:0] mem [0:63];

    always @(*) begin
        if (MemRead) begin
            case (funct3)
                3'b000: data_out = {{24{mem[addr][7]}}, mem[addr][7:0]};     // LB
                3'b001: data_out = {{16{mem[addr][15]}}, mem[addr][15:0]};   // LH
                3'b010: data_out = mem[addr];                                // LW
                3'b100: data_out = {24'b0, mem[addr][7:0]};                  // LBU
                3'b101: data_out = {16'b0, mem[addr][15:0]};                 // LHU
                default: data_out = 32'b0;
            endcase
        end else begin
            data_out = 32'bz;
        end
    end

    always @(posedge clk) begin
        if (MemWrite) begin
            case (funct3)
                3'b000: mem[addr][7:0] = data_in[7:0];                       // SB
                3'b001: mem[addr][15:0] = data_in[15:0];                     // SH
                3'b010: mem[addr] = data_in;                                 // SW
            endcase
        end
    end

    initial begin
        mem[0] = 32'd30;
        mem[1] = 32'd25;
        mem[2] = 32'd5;
    end
endmodule
