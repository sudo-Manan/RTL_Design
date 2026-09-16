// 
// Module Name: demux1to4
// Description: 1:4 demux design using behavioural model/ rtl model
// 
// Dependencies: 
// 

module demux_1to4 (
    input logic in_d,
    input logic [1:0] in_sel,
    output logic out3, out2, out1, out0
);
    always_comb begin
        {out3, out2, out1, out0} = 4'd0;
        case (in_sel)
            2'b11: out3 = in_d;
            2'b10: out2 = in_d;
            2'b01: out1 = in_d;
            2'b00: out0 = in_d;
        endcase
    end
endmodule