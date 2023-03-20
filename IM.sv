module instruction_memory (
    input logic [9:0] address,  // 10 bits address. consistent with PC.sv
    output logic [8:0] instruction // 9 bits instruction
);

    logic[8:0] inst_rom[2**10];
        always_comb instruction = inst_rom[address];
 
    initial begin		                  // load from external text file
        $readmemb("machine_code.txt",inst_rom);
    end 

endmodule
