// 
// Module Name: mux2to1
// Description: 2:1 mux design using dataflow model, no ternary operation
// 
// Dependencies: 
// 

module mux2to1 (
    input logic in_d1, in_d0,
    input logic in_sel,
    output logic out_y
);
    assign out_y = (~in_sel & in_d0) | (in_sel & in_d1);

endmodule