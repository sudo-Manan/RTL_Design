// 
// Module Name: nand_or
// Description: or gate using nand gate
// or gate demonstration with testbench
// 
// Dependencies: 
// 

module nand_or (
    input logic in_a, in_b,
    output logic out_y
);
    logic w_inv_a, w_inv_b;

    nand (w_inv_a, in_a, in_a);
    nand (w_inv_b, in_b, in_b);
    nand (out_y, w_inv_a, w_inv_b);
    
endmodule