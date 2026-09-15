// 
// Module Name: demo_tri_state_buffer
// Description: Tri-State Buffer gate demonstration
// 
// Dependencies: 
// 

module demo_tri_state_buffer (
    input logic in_a, in_ctrl,
    output logic cytl1_y, ctrl0_y 
);
    bufif1 (ctrl1_y, in_a, in_ctrl);
    bufif0 (ctrl0_y, in_a, in_ctrl);
endmodule

module tb;
    logic a, ctrl, y0, y1;
    
    demo_tri_state_buffer (.in_a(a), .in_ctrl(b), .ctrl1_y(y1), .ctrl0_y(y0));

    initial begin
        $monitor("| ctrl = %b | a = %b | y_ctrl0 = %b | y_ctrl1 = %b |", ctrl, a, y0, y1);

        #5; ctrl=1'b0; a=1'b0;
        #5; assert(y0==0 && y1==z);

        #5; ctrl=1'b0; a=1'b1;
        #5; assert(y0==1 && y1==z);

        #5; ctrl=1'b1; a=1'b0;
        #5; assert(y0==z && y1==0);

        #5; ctrl=1'b1; a=1'b1;
        #5; assert(y0==z && y1==1);

        #5; $finish;
    end

endmodule