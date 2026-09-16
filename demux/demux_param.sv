// 
// Module Name: demux_param
// Description: parameterized demux design 
// 
// Dependencies: 
// 

module demux_param #(parameter SIZE = 4)(
    input logic in_d,
    input logic [$clog2(SIZE)-1:0] in_sel,
    output logic [SIZE-1:0] out_y
);
    always_comb begin
        out_y = '0;
        out_y[in_sel] = in_d;
    end
endmodule