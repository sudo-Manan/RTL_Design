// 
// Module Name: encoder_8to3
// Description: 8:3 encoder design
// it assumes one hot input
// 
// Dependencies: 
// 

module encoder_8to3 (
    input logic [7:0] in_d,
    output logic [2:0] out_d
);
    assign out_d[2] = |in_d[7:4];
    assign out_d[1] = |in_d[7:6] | |in_d[3:2];
    assign out_d[0] = in_d[7] | in_d[5] | in_d[3] | in_d[1];
endmodule