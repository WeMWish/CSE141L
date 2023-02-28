// using template from the Professor's lecture
package definition;
    const logic [2:0]kADD = 3b'000;
    const logic [2:0]kLSH = 3b'001;
    const logic [2:0]kRSH = 3b'010;
    const logic [2:0]kXOR = 3b'011;
    const logic [2:0]kAND = 3b'100
    const logic [2:0]kSUB  = 3b'101;
    const logic [2:0]CLR = 3b'110;

    typedef enum logic[2:0] { 
        ADD, LSH, RSH, XOR, AND, SUB, CLR
    } op_name;
endpackage