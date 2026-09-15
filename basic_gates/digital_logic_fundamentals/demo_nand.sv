// 
// Module Name: demo_nand
// Description: nand gate demonstration with testbench
// 
// Dependencies: 
// 

module demo_nand (
    input logic in_a, in_b,
    output logic out_y
);
    nand (out_y, in_a, in_b);
endmodule

module tb;
    logic a, b, y;
    
    demo_nand uut (.in_a(a), .in_b(b), .out_y(y));

    initial begin
        $monitor("| a = %b | b = %b | y = %b |", a, b, y);

        #5; a=1'b0; b=1'b0;
        #5; assert(y==1);

        #5; a=1'b0; b=1'b1;
        #5; assert(y==1);

        #5; a=1'b1; b=1'b0;
        #5; assert(y==1);

        #5; a=1'b1; b=1'b1;
        #5; assert(y==0);

        #5; $finish;
    end

endmodule