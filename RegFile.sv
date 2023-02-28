module RegFile (parameter W=8, D=3) (
    input   CLK, RESET, WRITE_ENABLE,
    input   [D-1:0] readA, readB, write
    input   [W-1:0] dataIn
    output  [W-1:0] outA, outB
);

logic [W-1:0] Registers[2**D];

always_ff @(posedge CLK) begin
    if (RESET) begin
        for (int i = 0; i < 2**D; i++) begin
            Registers[i] <= 0;
        end
    else if (WRITE_ENABLE) begin
        Registers[write] <= dataIn;
    end
end