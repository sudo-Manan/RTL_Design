// 
// Module Name: mux4to1
// Description: 4:1 mux design using behavioural model/ rtl model
// 
// Dependencies: 
// 

module mux_4to1 (
    input logic in_d3, in_d2, in_d1, in_d0,
    input logic [1:0] in_sel,
    output logic out_y
);
    always_comb begin
        case (in_sel)
            2'b11: out_y = in_d3;
            2'b10: out_y = in_d2;
            2'b01: out_y = in_d1;
            2'b00: out_y = in_d0;
            default: out_y = 1'b0;
        endcase
    end
endmodule