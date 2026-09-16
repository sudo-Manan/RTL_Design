// 
// Module Name: demux1to4
// Description: 1:4 demux design using dataflow model
// 
// Dependencies: 
// 

module demux_1to4 (
    input logic in_d,
    input logic [1:0] in_sel,
    output logic out3, out2, out1, out0
);
    assign out0 = (in_sel[1] ~| in_sel[0]) & in_d;
    assign out1 = (~in_sel[1] & in_sel[0]) & in_d;
    assign out2 = (in_sel[1] & ~in_sel[0]) & in_d;
    assign out3 = (in_sel[1] & in_sel[0]) & in_d;
endmodule