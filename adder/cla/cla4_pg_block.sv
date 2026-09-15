// 
// Module Name: cla4_pg_block
// Description: Carry Look Ahead Logic to obtain the next 3 carry bits and block level generate and propogate signals for cla logic
// 
// Dependencies: 
// 

module cla4_pg_block (
    input logic [3:0] cla_p, cla_g,
    input logic cla_cin,
    output logic [2:0] cla_carry,
    output logic cla_bp, cla_bg,
)
    
    assign cla_carry[0] = cla_g[0] | cla_p[0] & cla_cin;
    assign cla_carry[1] = cla_g[1] | cla_p[1] & cla_g[0] | cla_p[1] & cla_p[0] & cla_cin;
    assign cla_carry[2] = cla_g[2] | cla_p[2] & cla_g[1] | cla_p[2] & cla_p[1] & cla_g[0] | cla_p[2] & cla_p[1] & cla_p[0] & cla_cin;

    assign cla_bp = &cla_p;
    assign cla_bg = cla_g[3] | cla_p[3] & cla_g[2] | cla_p[3] & cla_p[2] & cla_g[1] | cla_p[3] & cla_p[2] & cla_p[1] & cla_g[0];

endmodule