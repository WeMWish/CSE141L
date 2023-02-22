module data_memory(
    input logic clk,
    input logic rst,
    input logic [31:0] addr,    // address to read/write
    input logic [31:0] din, // input that to be written to memory
    input logic write_enable,
    output logic [31:0] dout    // output that is read from memory
);

    // FIXME: what should be my memory size?
    parameter MEM_SIZE = 1024; // number of memory locations
    parameter WORD_SIZE = 32; // size of a memory word in bits

    logic [WORD_SIZE-1:0] mem [MEM_SIZE-1:0];

    always_ff @(posedge clk) begin
        if (rst) begin
            mem <= '0; // initialize memory to 0 on reset
        end else if (we) begin
            mem[addr] <= din;
        end
        dout <= mem[addr];
    end

endmodule
