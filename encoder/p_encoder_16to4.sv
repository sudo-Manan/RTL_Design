// 
// Module Name: p_encoder_16to4
// Description: 16:4 encoder design
// defaults to zero
//
// Dependencies: 
// 

module p_encoder_16to4 (
    input logic [15:0] in_d,
    output logic [3:0] out_d
);
    always_comb begin
        priority case (1'b1)
            in_d[15] : out_d = 4'hF;
            in_d[14] : out_d = 4'hE;
            in_d[13] : out_d = 4'hD;
            in_d[12] : out_d = 4'hC;
            in_d[11] : out_d = 4'hB;
            in_d[10] : out_d = 4'hA;
            in_d[9] : out_d = 4'h9;
            in_d[8] : out_d = 4'h8;
            in_d[7] : out_d = 4'h7;
            in_d[6] : out_d = 4'h6;
            in_d[5] : out_d = 4'h5;
            in_d[4] : out_d = 4'h4;
            in_d[3] : out_d = 4'h3;
            in_d[2] : out_d = 4'h2;
            in_d[1] : out_d = 4'h1;
            in_d[0] : out_d = 4'h0;
            default: out_d = 4'h0;
        endcase
    end
endmodule
