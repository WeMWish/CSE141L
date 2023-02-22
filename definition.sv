// using template from the Professor's lecture
package definition;
    const logic [2:0]kADD = 3'b000;
    const logic [2:0]kLSH = 3'b001;
    const logic [2:0]kRSH = 3'b010;
    const logic [2:0]kXOR = 3'b011;
    const logic [2:0]kAND = 3'b100
    const logic [2:0]kSUB  = 3'b101;
    const logic [2:0]CLR = 3'b110;

    typedef enum logic[2:0] { 
        ADD, LSH, RSH, XOR, AND, SUB, CLR
    } op_name;
endpackage