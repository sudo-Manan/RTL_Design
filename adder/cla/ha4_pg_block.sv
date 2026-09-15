// 
// Module Name: ha4_pg_block
// Description: Half Adder Logic to obtain the generate and propogate signals for cla logic
// 
// Dependencies: 
// 

module ha4_pg_block (
    input logic [3:0] pg_a, pg_b,
    output logic [3:0] p_out, g_out
);
    assign p_out = pg_a ^ pg_b;
    assign g_out = pg_a & pg_b;
endmodule