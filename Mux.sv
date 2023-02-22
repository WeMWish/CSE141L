// FIXME: might need to specify how many bits for each input & output
module Mux (
    input logic input_A,
    input logic input_B,
    input logic select,
    output logic out
)

    always_comb begin
        if (select) begin
            out = input_0;
        end else begin
            out = input_A;
        end
    end