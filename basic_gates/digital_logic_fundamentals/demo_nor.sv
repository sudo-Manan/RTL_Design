// 
// Module Name: demo_nor
// Description: nor gate demonstration with testbench
// 
// Dependencies: 
// 

module demo_nor (
    input logic in_a, in_b,
    output logic out_y
);
    nor (out_y, in_a, in_b);
endmodule

module tb;
    logic a, b, y;
    
    demo_nor uut (.in_a(a), .in_b(b), .out_y(y));

    initial begin
        $monitor("| a = %b | b = %b | y = %b |", a, b, y);

        #5; a=1'b0; b=1'b0;
        #5; assert(y==1);

        #5; a=1'b0; b=1'b1;
        #5; assert(y==0);

        #5; a=1'b1; b=1'b0;
        #5; assert(y==0);

        #5; a=1'b1; b=1'b1;
        #5; assert(y==0);

        #5; $finish;
endmodule