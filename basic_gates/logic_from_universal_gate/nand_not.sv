// 
// Module Name: nand_not
// Description: not gate using nand gate
// not gate demonstration with testbench
// 
// Dependencies: 
// 

module nand_not (
    input logic in_a,
    output logic out_y
);
    nand (out_y, in_a, in_a);
endmodule