// 
// Module Name: basic_comparator
// Description: 
// takes 2 1 bit inputs, and gives 3 outputs (to signify, equal, greater than, or less than), always one hot output. 
//
// Dependencies: 
// 

module basic_comparator (
    input logic in_a, in_b,
    output logic out_gt, out_eq, out_lt
);
    assign out_gt = in_a & !in_b;
    assign out_eq = in_a ~^ in_b;
    assign out_lt = !in_a & in_b;
    
endmodule