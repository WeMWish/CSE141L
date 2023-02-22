The architecture is designed to inmitate MIPS. Here is a list which you can used to navigate through the code:
    1. PC.sv -> the Program Counter
    2. ALU.sv -> the Arithmetic Logic Unit
    3. ControlDecoder.sv -> the Control Unit
    4. DataMemory.sv -> the Data Memory
    5. IM.sv -> the Instruction Memory
    6. RegFile.sv -> the Register File
    7. TopLevel.sv -> the top module
    8. LookUpTable.txt -> the Look Up Table for the Control Unit

I have not added any test branches yet. 
There should still be some unnecessary code in the TopLevel.sv file. I will clean it up later. Some of the code inside it will contradict the code in the other modules. That is because I am using the file from Professor John Eldon's lab session as a template. I will clean it up later.