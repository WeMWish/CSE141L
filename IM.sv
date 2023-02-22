module instruction_memory (
    input logic clk,
    input logic rst,
    input logic [9:0] address,  // 10 bits address. consistent with PC.sv
    output logic [2:0] instruction // 9 bits instruction
);

    parameter MEM_SIZE = 8; // number of instructions in memory
    parameter INSTR_WIDTH = 3; // width of each instruction in bits FIXME: should it be the opcode only or the whole instruction?

    logic [INSTR_WIDTH-1:0] mem [MEM_SIZE-1:0];

    initial begin
        $readmemh("LookUpTable", mem);
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            instruction <= 0;
        end else begin
            instruction <= mem[address];
        end
    end

endmodule
