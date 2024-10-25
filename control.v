module control(input [4:0] in, output reg branch, mr, mwrite, alusrc, alusrc2, regwr, output reg [1:0] aluop, mtoreg
    );
    
    always @ (*) 
    begin
    case(in)                                              // alusrc 0 -> reg2, alusrc 1 -> imm, alusrc2 1 -> reg1, alusrc2 0 -> pc 
    5'b01100: begin  branch = 0; mr = 0; mtoreg = 2'b01; aluop = 10; mwrite = 0; alusrc = 0; alusrc2 = 1 ; regwr = 1; end     // add or r format
    5'b00000: begin branch = 0; mr = 1; mtoreg = 2'b10; aluop = 00; mwrite = 0; alusrc = 1; alusrc2 = 1; regwr = 1; end      // lw
    5'b01000: begin branch = 0; mr = 0; mtoreg = 2'bX; aluop = 00; mwrite = 1; alusrc = 1; alusrc2 = 1; regwr = 0; end   // sw
    5'b11000: begin branch = 1; mr = 0; mtoreg = 2'bX; aluop = 01; mwrite = 0; alusrc = 0; alusrc2 = 1; regwr = 0; end   // beq
    5'b01101: begin branch = 0; mr = 0; mtoreg = 2'01; aluop = 10 ; mwrite = 0; alusrc = 1; alusrc2 = 0; regwr = 1; end  // auipc 
    endcase
    end
endmodule

