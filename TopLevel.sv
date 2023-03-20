// use template from the Professor's lecture
// FIXME: still a little mess up here. lots of unnecessary code

module TopLevel (
    input  start,
    input   CLK,
    output  halt
);
    wire [3:0] write_register
    wire [7:0] regWriteValue;
    wire    REG_WRITE;
    wire [7:0]  memwriteValue;
    wire    MEM_WRITE;
    wire [9:0]  PC;
    wire    BRANCH;
    logic [7:0]  InstCounter;
    wire [8:0]  instruction;

// control signals
    wire MEM_READ, REG_DST, MEM_TO_REG, HALT;
    wire [3:0]  ALU_OP;
    wire [3:0]  ALU_SRC_B;
// ALU outputs
    wire ZERO, EQUAL;
    wire [7:0]  ALU_OUT;

// data mem wires
    wire [7:0] MemOut;

// if module input
    wire [7:0] Target;

// register file
    wire [7:0] readA;
    wire [7:0] readB;

// ALU wires
    wire [7:0] SE_Immediate;
    wire [7:0] IntermediateMux;
    wire [7:0] ALUInputB;

// fetch module
    PgmCtr pc_module (
        // .BRANCH (BRANCH & ZERO),
        // .Target ({5'b00000, Instruction[2:0]}),
        .Init   (start),
        .CLK,
        .Halt   (halt),
        .PC
    )

    instruction_memory inst_rom (
        .InstAddress    (PC),
        .InstOut    (Instruction)
    );

    RegFile register_module (
        .CLK,
        .RESET
        .WRITE_ENABLE   (REG_WRITE),
        .srcA  ({1'b0, Instruction[8:6]}),
        .srcB  ({1'b0, Instruction[2:0]}),
        .writeReg   (write_register),
        .writeValue (regWriteValue),
        .ReadA,
        .ReadB
    )

    ALU ALU_Module (
        .INPUT_A  (INPUT_A),
        .INPUT_B  (INPUT_B),
        .OUT   (ALU_OUT),
        .ZERO,
        .EQUAL (EQ)
    )

    