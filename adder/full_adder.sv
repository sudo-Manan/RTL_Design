// 
// Module Name: full_adder
// Description: Full Adder Logic
// 
// Dependencies: 
// 

module full_adder (
    input logic in_a, in_b, cin,
    output logic out_sum, cout
);
    assign out_sum = in_a ^ in_b ^ cin;
    assign cout = (in_a & in_b) | (in_a & cin) | (in_b & cin);
endmodule