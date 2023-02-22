module control_decoder(
    input logic [2:0] opcode,
    output logic reg_write,
    output logic mem_read,
    output logic mem_write,
    output logic [1:0] alu_op, // FIXME: have not thought it through yet how many bits do i need?
    output logic branch,
    output logic alu_src,
    output logic reg_dst,
    output logic mem_to_reg
);

    always_comb begin
        case (opcode)
            3'b000: // add
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
                alu_op = 2'b00;
                jump = 0;
                branch = 0;
                alu_src = 0;
                reg_dst = 1;
                mem_to_reg = 0;
            3'b001: // xor
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
                alu_op = 2'b01;
                jump = 0;
                branch = 0;
                alu_src = 0;
                reg_dst = 1;
                mem_to_reg = 0;
            3'b010: // sll
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
                alu_op = 2'b10;
                jump = 0;
                branch = 0;
                alu_src = 0;
                reg_dst = 1;
                mem_to_reg = 0;
            3'b011: // slt
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
                alu_op = 2'b11;
                jump = 0;
                branch = 0;
                alu_src = 0;
                reg_dst = 1;
                mem_to_reg = 0;
            3'b100: // j
                reg_write = 0;
                mem_read = 0;
                mem_write = 0;
                alu_op = 2'b00;
                jump = 1;
                branch = 0;
                alu_src = 0;
                reg_dst = 0;
                mem_to_reg = 0;
            3'b101: // sw
                reg_write = 0;
                mem_read = 0;
                mem_write = 1;
                alu_op = 2'b00;
                jump = 0;
                branch = 0;
                alu_src = 1;
                reg_dst = 0;
                mem_to_reg = 0;
            3'b110: // lw
                reg_write = 1;
                mem_read = 1;
                mem_write = 0;
                alu_op = 2'b00;
                jump = 0;
                branch = 0;
                alu_src = 1;
                reg_dst = 1;
                mem_to_reg = 1;
            3'b111: // beq
                reg_write = 0;
                mem_read = 0;
                mem_write = 0;
                alu_op = 2'b00;
                jump = 0;
                branch = 1;
                alu_src = 0;
                reg_dst = 0;
                mem_to_reg = 0;
            default: // unrecognized opcode
                reg_write = 0;
                mem_read = 0;
                mem_write = 0;
                alu_op = 2'b00;
                jump = 0;
                branch = 0;
                alu_src = 0;
                reg_dst = 0;
                mem_to_reg = 0;
        endcase
    end

endmodule
