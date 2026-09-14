// 
// Module Name: rca
// Description: N-bit Ripple Carry Adder
// has a linear time complexity. as we increase the size of inputs, the time to get output keeps on increasing
// Dependencies: full_adder module
// 

module rca #(parameter N = 4)(
    input logic [N-1:0] in_a, in_b,
    input logic cin,
    output logic [N-1:0] out_sum,
    output logic cout
);
    logic [N:0] w_carry;
    assign w_carry[0] = cin;

    genvar i;
    generate
        for (i=0; i<N; i++) begin
            full_adder fa_inst (.in_a(in_a[i]), .in_b(in_b[i]), .cin(w_carry[i]), .out_sum(out_sum[i]), .cout(w_carry[i+1]));
        end
    endgenerate
    
    assign cout = w_carry[N];

endmodule