// using template from the Professor's lecture

module PgmCtr (
    input init, CLK,
    output logic halt,
    output logic [9:0] PC
);

always  @(posedge CLK)
    if (init) begin
        PC <= 0;
    end
    else begin
            PC <= PC + 1;   
    end
endmodule