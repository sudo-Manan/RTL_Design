// 
// Module Name: param_cla_adder
// Description: Parameterized CLA Adder, using heirarical CLAs, for where width is in power of 4, but not 4(16, 64, 256, and so on)
// 
// Dependencies: 
// modules ha4_pg_block, cla4_pg_block
// 

module cla_adder_param #(parameter WIDTH = 64) (
    input logic [WIDTH-1:0] in_a, in_b,
    input logic in_carry,
    output logic [WIDTH-1:0] out_sum,
    output logic out_carry
);
    localparam SIZE = WIDTH/4;
    localparam LV = ($clog2(WIDTH) / 2) - 1;

    logic [WIDTH-1:0] w_p, w_g;
    logic [WIDTH:0] w_carry;
    logic [SIZE-1:0][LV:0] w_bp, w_bg;

    assign w_carry[0] = in_carry;

    genvar i, j, k;
    generate
        for(i=0; i<SIZE; i++) begin
            ha4_pg_block pg_inst (.pg_a(in_a[i*4 +: 4]), 
                                  .pg_b(in_b[i*4 +: 4]), 
                                  .p_out(w_p[i*4 +: 4]), 
                                  .g_out(w_g[i*4 +: 4])
                                 );
            cla4_block cla_0_inst (.cla_p(w_p[i*4 +: 4]), 
                                     .cla_g(w_g[i*4 +: 4]), 
                                     .cla_cin(w_carry[i*4]), 
                                     .cla_carry(w_carry[i*4 + 1 +: 3]), 
                                     .cla_bp(w_bp[i][0]), 
                                     .cla_bg(w_bg[i][0])
                                    );
        end
        for (j=0; j<LV; j++) begin
            for (k=0; k < WIDTH/(16*(4**j)); k++) begin
                cla4_block cla_lv_inst (.cla_p(w_bp[k*4 +: 4][j]), 
                                        .cla_g(w_bg[k*4 +: 4][j]), 
                                        .cla_cin(w_carry[k*16*(4**j)]), //add carry wires
                                        .cla_carry({w_carry[(4**(j+1))*((4*k)+3)], 
                                                    w_carry[(4**(j+1))*((4*k)+2)],
                                                    w_carry[(4**(j+1))*((4*k)+1)]}), 
                                                    //though and wrote this logic in excel, used calude to formulate it, and excel to verify the formula
                                        .cla_bp(w_bp[k][j+1]), 
                                        .cla_bg(w_bg[k][j+1])
                                       );
            end
        end
    endgenerate

    assign w_carry[WIDTH] = w_bg[0][LV] | (w_bp[0][LV] & w_carry[0]);
    assign out_sum = w_p ^ w_carry[WIDTH-1:0];
    assign out_carry = w_carry[WIDTH];

endmodule