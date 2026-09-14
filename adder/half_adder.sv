// 
// Module Name: half_adder
// Description: Half Adder Logic
// 
// Dependencies: 
// 

module half_adder (
    input logic in_a, in_b,
    output logic out_sum, out_carry
);

    assign out_sum = in_a ^ in_b;
    assign out_carry = in_a & in_b;

endmodule