// 
// Module Name: demo_not
// Description: not gate demonstration
// 
// Dependencies: 
// 

module demo_not (
    input logic in_a,
    output logic out_y
);
    not (out_y, in_a);
endmodule

module tb;
    logic a, y;
    
    demo_not uut (.in_a(a), .out_y(y));

    initial begin
        $monitor("| a = %b | y = %b |", a, y);

        #5; a=1'b0; 
        #5; assert(y==1);

        #5; a=1'b1;
        #5; assert(y==0);

        #5; $finish;
    end
    
endmodule