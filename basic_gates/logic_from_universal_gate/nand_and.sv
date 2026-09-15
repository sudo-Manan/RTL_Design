// 
// Module Name: nand_and
// Description: making and gate using nand gate
// and gate demonstration with testbench
// 
// Dependencies: 
// 

module nand_and (
    input  logic in_a, in_b,
    output logic out_y
);
    logic w_int0;

    nand (w_int0, in_a, in_b);
    nand (out_y, w_int0, w_int0);
    
endmodule