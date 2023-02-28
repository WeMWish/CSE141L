// using template from the Professor's lecture
// FIXME: need to chnage this to my own instructions

import definitions::*;

module ALU(
    input [7:0] INPUT_A,    
    input [7:0] INPUT_B,
    input [2:0] ALU_OP, // ALU opcode, part of microcode
    input       SC_IN,  // shift in/carry in
    output logic SC_OUT,    // shift out/carry out
    output logic ZERO,  // zero out flag
    output logic BEVEN  // LSB of input B = 0
);

    op_mne  op_mnemonic;    // type enum: used for convenient
    always_comb begin
        {SC_OUT, OUT} = 0;
        // single instruction for both LSW & MSW
    case (OP)
        kADD : {SC_OUT, OUT} = {1'b0, INPUT_A} + INPUT_B + SC_IN; // add
        kLSH : {SC_OUT, OUT} = {INPUT_A, SC_IN}; // shift left
        kRSH : {SC_OUT, OUT} = {SC_IN, INPUT_A}; // shift right
        kXOR : begin
            OUT = INPUT_A ^ INPUT_B;    // xor
            SC_OUT = 0;
        end
        kAND : begin
            OUT = INPUT_A & INPUT_B;    // and
            SC_OUT = 0;
        end
        kSUB : begin
            OUT = INPUT_A + (~INPUT_B) + SC_IN // subtract
            SC_OUT = 0;
        end
        default: {SC_OUT, OUT} = 0;
    endcase