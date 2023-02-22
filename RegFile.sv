module reg_file(input logic [2:0] read_reg1, read_reg2, write_reg,
                 input logic [31:0] write_data, // FIXME: what should be the size of register?
                 output logic [31:0] read_data1, read_data2);

    logic [31:0] registers [7:0];

    always @(read_reg1, read_reg2) begin
        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
    end

    always @ (posedge clk) begin
        if (write_enable) begin
            registers[write_reg] <= write_data;
        end
    end

endmodule
