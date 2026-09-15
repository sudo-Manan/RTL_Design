// 
// Module Name: demo_and
// Description: and gate demonstration with testbench
// 
// Dependencies: 
// 

module demo_and (
    input logic in_a, in_b,
    output logic out_y
);
    and (out_y, in_a, in_b);
endmodule

module tb;
    logic a, b, y;
    
    demo_and uut(.in_a(a), .in_b(b), .out_y(y));

    initial begin
        $monitor("| a = %b | b = %b | y = %b |", a, b, y);

        #5; a=1'b0; b=1'b0;
        #5; assert(y==0);

        #5; a=1'b0; b=1'b1;
        #5; assert(y==0);

        #5; a=1'b1; b=1'b0;
        #5; assert(y==0);

        #5; a=1'b1; b=1'b1;
        #5; assert(y==1);

        #5; $finish;
    end

endmodule