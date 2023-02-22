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
        if (PC > 63)
            halt <= 1;
        else if (branch_en) // absolute branching
            PC <= PC + 7;
        else if (jump_en) begin
            if (PC > 13)    // relative branching: add or subtract from the current PC value
                PC <= PC - 14;
            else
                halt <= 1;  // trap error condition
        end
        else
            PC <= PC + 1;   
    end
endmodule